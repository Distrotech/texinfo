/* Copyright 2010, 2011, 2012, 2013, 2014, 2015
   Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>. */

#include <stdlib.h>

#include "tree_types.h"
#include "context_stack.h"
#include "api.h"

static enum context *stack;
static size_t top; /* One above last pushed context. */
static size_t space;

void
reset_context_stack (void)
{
  top = 0;
}

void
push_context (enum context c)
{
  if (top >= space)
    {
      stack = realloc (stack, (space += 5) * sizeof (enum context));
    }

  debug (">>>>>>>>>>>>>>>>>PUSHING STACK AT %d  -- %s", top,
         c == ct_preformatted ? "preformatted"
         : c == ct_line ? "line"
         : c == ct_def ? "def"
         : c == ct_menu ? "menu"
         : "");
  stack[top++] = c;
}

enum context
pop_context ()
{
  if (top == 0)
    abort ();

  debug (">>>>>>>>>>>>>POPPING STACK AT %d", top - 1);
  return stack[--top];
}

enum context
current_context (void)
{
  if (top == 0)
    return ct_NONE;

  return stack[top - 1];
}


/* the valid regions are 'titlepage', 'copying', and 'documentdescription' */

static enum command_id *region_stack;
static size_t region_top; /* One above last pushed region. */
static size_t region_space;

void
reset_region_stack (void)
{
  region_top = 0;
}

void
push_region (enum command_id r)
{
  if (region_top >= region_space)
    {
      region_stack = realloc (region_stack,
                              (region_space += 5) * sizeof (enum command_id));
    }

  debug (">>>>>>>>>>>>>>>>>PUSHING REGION STACK AT %d", region_top);

  region_stack[region_top++] = r;
}

enum command_id
pop_region ()
{
  if (region_top == 0)
    abort ();

  debug (">>>>>>>>>>>>>POPPING REGION STACK AT %d", region_top - 1);
  return region_stack[--region_top];
}

enum command_id
current_region (void)
{
  if (region_top == 0)
    return CM_NONE;

  return region_stack[region_top - 1];
}
