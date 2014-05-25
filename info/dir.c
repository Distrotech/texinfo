/* dir.c -- how to build a special "dir" node from "localdir" files.
   $Id$

   Copyright 1993, 1997, 1998, 2004, 2007, 2008, 2009, 2012,
   2013, 2014 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

   Originally written by Brian Fox. */

#include "info.h"
#include "info-utils.h"
#include "filesys.h"
#include "tilde.h"

/* The "dir" node can be built from the contents of a file called "dir",
   with the addition of the menus of every file named in the array
   dirs_to_add which are found in INFOPATH. */

static void add_menu_to_node (char *contents, size_t size, NODE *node);
static void insert_text_into_node (NODE *node, long start,
    char *text, int textlen);

static char *dirs_to_add[] = {
  "dir", "localdir", NULL
};

FILE_BUFFER *dir_buffer = 0;

static void create_dir_buffer (void);
static NODE *build_dir_node (void);

NODE *
get_dir_node (void)
{
  NODE *node;

  if (!dir_buffer)
    create_dir_buffer ();

  if (!dir_buffer->tags || !dir_buffer->tags[0])
    {
      NODE *tag;
      int i = 0;
      tag = build_dir_node ();
      /* Create and save dir node. */
      add_pointer_to_array (tag, i,
                            dir_buffer->tags,
                            dir_buffer->tags_slots, 2);
    }

  node = xmalloc (sizeof (NODE));
  *node = *dir_buffer->tags[0]; /* Only one entry in tags table. */
  return node;
}

static void
create_dir_buffer (void)
{
  dir_buffer = make_file_buffer ();
  dir_buffer->filename = xstrdup ("dir");
  dir_buffer->fullpath = xstrdup ("dir");
  dir_buffer->finfo.st_size = 0;
  dir_buffer->filesize = 0;
  dir_buffer->contents = NULL;
  dir_buffer->flags = (N_IsInternal | N_CannotGC);

  /* Initialize empty tags table. */
  dir_buffer->tags = xmalloc (sizeof (NODE *));
  dir_buffer->tags[0] = 0;
}

static NODE *
build_dir_node (void)
{
  int path_index;
  char *this_dir;
  NODE *node;

  node = info_create_node ();
  node->nodename = xstrdup ("Top");
  node->filename = xstrdup ("dir");
  node->contents = xstrdup (

"File: dir,	Node: Top,	This is the top of the INFO tree.\n"
"\n"
"This is the Info main menu (aka directory node).\n"
"A few useful Info commands:\n"
"\n"
"  `q' quits;\n"
"  `?' lists all Info commands;\n"
"  `h' starts the Info tutorial;\n"
"  `mTexinfo RET' visits the Texinfo manual, etc.\n"

  );

  node->nodelen = strlen (node->contents);

  /* Using each element of the path, check for one of the files in
     DIRS_TO_ADD.  Do not check for "localdir.info.Z" or anything else.
     Only files explictly named are eligible.  This is a design decision.
     There can be an info file name "localdir.info" which contains
     information on the setting up of "localdir" files. */
  for (this_dir = infopath_first (&path_index); this_dir; 
       this_dir = infopath_next (&path_index))
    {
      register int da_index;
      char *from_file;

      /* Expand a leading tilde if one is present. */
      if (*this_dir == '~')
        {
          char *tilde_expanded_dirname;

          tilde_expanded_dirname = tilde_expand_word (this_dir);
          if (tilde_expanded_dirname != this_dir)
            {
              this_dir = tilde_expanded_dirname;
            }
        }

      /* For every different file named in DIRS_TO_ADD found in the
         search path, add that file's menu to our "dir" node. */
      for (da_index = 0; (from_file = dirs_to_add[da_index]); da_index++)
        {
          struct stat finfo;
          int statable;
          int namelen = strlen (from_file);
          char *fullpath = xmalloc (3 + strlen (this_dir) + namelen);
          
          strcpy (fullpath, this_dir);
          if (!IS_SLASH (fullpath[strlen (fullpath) - 1]))
            strcat (fullpath, "/");
          strcat (fullpath, from_file);

          statable = (stat (fullpath, &finfo) == 0);

          if (statable && S_ISREG (finfo.st_mode))
            {
              size_t filesize;
	      int compressed;
              char *contents = filesys_read_info_file (fullpath, &filesize,
                                                       &finfo, &compressed);
              if (contents)
                {
                  add_menu_to_node (contents, filesize, node);
                  free (contents);
                }
            }

          free (fullpath);
        }
    }

  {
    char *old_contents = node->contents;
    scan_node_contents (0, &node);
    if (node->flags & N_WasRewritten)
      free (old_contents);
  }
  return node;
}

/* Given CONTENTS and NODE, add the menu found in CONTENTS to the menu
   found in NODE->contents.  SIZE is the total size of CONTENTS. */
static void
add_menu_to_node (char *contents, size_t size, NODE *node)
{
  SEARCH_BINDING contents_binding, fb_binding;
  long contents_offset, fb_offset;

  contents_binding.buffer = contents;
  contents_binding.start = 0;
  contents_binding.end = size;
  contents_binding.flags = S_FoldCase | S_SkipDest;

  fb_binding.buffer = node->contents;
  fb_binding.start = 0;
  fb_binding.end = node->nodelen;
  fb_binding.flags = S_FoldCase | S_SkipDest;

  /* Move to the start of the menus in CONTENTS and NODE. */
  if (search_forward (INFO_MENU_LABEL, &contents_binding, &contents_offset)
      != search_success)
    /* If there is no menu in CONTENTS, quit now. */
    return;

  /* There is a menu in CONTENTS, and contents_offset points to the first
     character following the menu starter string.  Skip all whitespace
     and newline characters. */
  contents_offset += skip_whitespace_and_newlines (contents + contents_offset);

  /* If there is no menu in NODE, make one. */
  if (search_forward (INFO_MENU_LABEL, &fb_binding, &fb_offset)
      != search_success)
    {
      fb_binding.start = node->nodelen;

      insert_text_into_node
        (node, fb_binding.start, INFO_MENU_LABEL, strlen (INFO_MENU_LABEL));

      fb_binding.buffer = node->contents;
      fb_binding.start = 0;
      fb_binding.end = node->nodelen;
      if (search_forward (INFO_MENU_LABEL, &fb_binding, &fb_offset)
	  != search_success)
        abort ();
    }

  /* CONTENTS_OFFSET and FB_OFFSET point to the starts of the menus that
     appear in their respective buffers.  Add the remainder of CONTENTS
     to the end of NODE's menu. */
  fb_binding.start = fb_offset;
  fb_offset = find_node_separator (&fb_binding);
  if (fb_offset != -1)
    fb_binding.start = fb_offset;
  else
    fb_binding.start = fb_binding.end;

  /* Leave exactly one blank line between directory entries. */
  {
    int num_found = 0;

    while ((fb_binding.start > 0) &&
           (whitespace_or_newline (fb_binding.buffer[fb_binding.start - 1])))
      {
        num_found++;
        fb_binding.start--;
      }

    /* Optimize if possible. */
    if (num_found >= 2)
      {
        fb_binding.buffer[fb_binding.start++] = '\n';
        fb_binding.buffer[fb_binding.start++] = '\n';
      }
    else
      {
        /* Do it the hard way. */
        insert_text_into_node (node, fb_binding.start, "\n\n", 2);
        fb_binding.start += 2;
      }
  }

  /* Insert the new menu. */
  insert_text_into_node
    (node, fb_binding.start, contents + contents_offset, size - contents_offset);
}

static void
insert_text_into_node (NODE *node, long start, char *text, int textlen)
{
  char *contents;
  long end;

  end = node->nodelen;

  contents = xmalloc (node->nodelen + textlen + 1);
  memcpy (contents, node->contents, start);
  memcpy (contents + start, text, textlen);
  memcpy (contents + start + textlen, node->contents + start, end - start);
  free (node->contents);
  node->contents = contents;
  node->nodelen += textlen;
}

REFERENCE *
lookup_dir_entry (char *label)
{
  NODE *node = get_dir_node ();
  REFERENCE *entry;

  entry = info_get_menu_entry_by_label (node, label);

  /* If the item wasn't found, search the list sloppily, e.g. the
     user typed "buffer" when they really meant "Buffers". */
  /* FIXME: Should this be placed in info_get_menu_entry_by_label? */
  if (!entry)
    {
      int i;
      int best_guess = -1;

      for (i = 0; (entry = node->references[i]); i++)
        {
          if (mbscasecmp (entry->label, label) == 0)
            break;
          else if (best_guess == -1
                && (mbsncasecmp (entry->label, label, strlen (label)) == 0))
              best_guess = i;
        }

      if (!entry && best_guess != -1)
        entry = node->references[best_guess];
    }

  return entry;
}

