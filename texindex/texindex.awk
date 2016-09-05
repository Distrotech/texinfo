# texindex.awk, generated by jrtangle from ti.twjr.
#
# Copyright 2014, 2015, 2016 Free Software Foundation, Inc.
# 
# This file is part of GNU Texinfo.
# 
# Texinfo is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
# 
# Texinfo is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, see <http://www.gnu.org/licenses/>.
# ftrans.awk --- handle data file transitions
#
# user supplies beginfile() and endfile() functions
#
# Arnold Robbins, arnold@skeeve.com, Public Domain
# November 1992

FNR == 1 {
  if (_filename_ != "")
    endfile(_filename_)
  _filename_ = FILENAME
  beginfile(FILENAME)
}

END  { endfile(_filename_) }
# join.awk --- join an array into a string
#
# Arnold Robbins, arnold@skeeve.com, Public Domain
# May 1993

function join(array, start, end, sep,    result, i)
{
  if (sep == "")
    sep = " "
  else if (sep == SUBSEP) # magic value
    sep = ""
  result = array[start]
  for (i = start + 1; i <= end; i++)
    result = result sep array[i]
  return result
}
# quicksort --- C.A.R. Hoare's quick sort algorithm.  See Wikipedia
#               or almost any algorithms or computer science text
# Adapted from K&R-II, page 110
#
function quicksort(data, left, right,    i, last)
{
    if (left >= right)  # do nothing if array contains fewer
        return          # than two elements

    quicksort_swap(data, left, int((left + right) / 2))
    last = left
    for (i = left + 1; i <= right; i++)
        if (less_than(data[i], data[left]))
            quicksort_swap(data, ++last, i)
    quicksort_swap(data, left, last)
    quicksort(data, left, last - 1)
    quicksort(data, last + 1, right)
}

# quicksort_swap --- quicksort helper function, could be inline
#
function quicksort_swap(data, i, j, temp)
{
    temp = data[i]
    data[i] = data[j]
    data[j] = temp
}
function del_array(a)
{
  # Portable and faster than
  #   for (i in a)
  #     delete a[i]
  split("", a)
}
function check_split_null(    n, a)
{
  n = split("abcde", a, "")
  return (n == 5)
}
function char_split(string, array,    n, i)
{
  if (Can_split_null)
    return split(string, array, "")

  # do it the hard way
  del_array(array)
  n = length(string)
  for (i = 1; i <= n; i++)
    array[i] = substr(string, i, 1)

  return n
}
function fatal(format, arg1, arg2, arg3, arg4, arg5,
            arg6, arg7, arg8, arg9, arg10)
{
  printf(format, arg1, arg2, arg3, arg4, arg5,
      arg6, arg7, arg8, arg9, arg10) > "/dev/stderr"
  exit EXIT_FAILURE
}
function isupper(c)
{
  return index("ABCDEFGHIJKLMNOPQRSTUVWXYZ", c)
}

function islower(c)
{
  return index("abcdefghijklmnopqrstuvwxyz", c)
}

function isalpha(c)
{
  return islower(c) || isupper(c)
}

function isdigit(c)
{
  return index("0123456789", c)
}
function usage(exit_val)
{
  printf(_"Usage: %s [OPTION]... FILE...\n", Invocation_name)
  print _"Generate a sorted index for each TeX output FILE."
  print _"Usually FILE... is specified as `foo.??' for a document `foo.texi'."
  print ""
  print _"Options:"
  print _" -h, --help   display this help and exit"
  print _" --version    display version information and exit"
  print _" --           end option processing"
  print ""
  print _"Email bug reports to bug-texinfo@gnu.org,\n\
general questions and discussion to help-texinfo@gnu.org.\n\
Texinfo home page: http://www.gnu.org/software/texinfo/";

  exit exit_val
}

function version()
{
  print "texindex (GNU texinfo)", Texindex_version
  print ""
  printf _"Copyright (C) %s Free Software Foundation, Inc.\n\
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>\n\
This is free software: you are free to change and redistribute it.\n\
There is NO WARRANTY, to the extent permitted by law.\n", "2016";

  exit EXIT_SUCCESS
}

BEGIN {
  TRUE = 1
  FALSE = 0
  EXIT_SUCCESS = 0
  EXIT_FAILURE = 1
  
  Texindex_version = "6.1.91"
  if (! Invocation_name) {
    # provide fallback in case it's not passed in.
    Invocation_name = "texindex"
  }
  
  Can_split_null = check_split_null()
  TEXTDOMAIN = "texinfo"
  for (i = 1; i < ARGC; i++) {
    if (ARGV[i] == "-h" || ARGV[i] == "--help") {
      usage(EXIT_SUCCESS)
    } else if (ARGV[i] == "--version") {
      version()
    } else if (ARGV[i] == "-k" || ARGV[i] == "--keep") {
      # do nothing, backwards compatibility
      delete ARGV[i]
    } else if (ARGV[i] == "--") {
      delete ARGV[i]
      break
    } else if (ARGV[i] ~ /^--?.+/) {
      fatal(_"%s: unrecognized option `%s'\n" \
            "Try `%s --help' for more information.\n",
            Invocation_name, ARGV[i], Invocation_name)
      exit EXIT_FAILURE
    } else {
      break
    }
  }
}

function beginfile(filename)
{
  Output_file = filename "s"

  # Reinitialize these for each input file
  del_array(Data)
  del_array(Keys)
  del_array(Seen)
  Entries = 0
  Do_initials = FALSE
  Prev_initial = ""

  Command_char = substr($0, 1, 1)
  if (   (Command_char != "\\" && Command_char != "@") \
      || substr($0, 2, 5) != "entry")
    fatal(_"%s is not a Texinfo index file\n", filename)

  Special_chars = "{}"
}
function endfile(filename,    i, prev_initial, initial)
{
  # sort the entries
  quicksort(Keys, 1, Entries)

  for (i = 1; i <= Entries; i++) {
    # deal with initial
    initial = Data[Keys[i], "initial"]
    if (initial != prev_initial) {
      prev_initial = initial
      print_initial(initial)
    }

    # write the actual line \entry {...}{...}
    printf("%centry {%s}{%s}\n",
      Command_char,
      Data[Keys[i], "text"],
      Data[Keys[i], "pagenum"]) > Output_file
  }
  close(Output_file)
}
{
  # Remove duplicates, which can happen
  if ($0 in Seen)
    next
  Seen[$0] = TRUE
  $0 = substr($0, 7)  # remove leading \entry
  initial = extract_initial($0)
  numfields = field_split($0, fields, "{", "}", Command_char)
  if (numfields != 3)
    fatal(_"%s:%d: Bad entry; expected three fields, not %d\n",
          FILENAME, FNR, numfields)
  key = fields[1]
  pagenum = fields[2]
  text = fields[3]
  if (! ((key, "text") in Data)) {
    # first time we've seen this full line
    Keys[++Entries] = key
    Data[key, "text"] = text
    Data[key, "pagenum"] = pagenum
    Data[key, "initial"] = initial
  } else
    # seen this key before; add the current pagenum
    # unless we've already seen that too.
    if (   Data[key, "pagenum"] != pagenum \
        && Data[key, "pagenum"] !~ (", " pagenum "$")) {
      Data[key, "pagenum"] = Data[key, "pagenum"] ", " pagenum
    }
  if (! Do_initials) {
    if (Prev_initial == "")
      Prev_initial = initial
    else if (initial != Prev_initial)
      Do_initials = TRUE
  }
}
function extract_initial(key,  initial, nextchar, i, l, kchars)
{
  l = char_split(key, kchars)
  if (l >= 3 && kchars[2] == "{") {
    bracecount = 1
    i = 3
    while (bracecount > 0 && i <= l) {
      if (kchars[i] == "{")
        bracecount++
      else if (kchars[i] == "}")
        bracecount--
      i++
    }
    if (i > l)
      fatal(_"%s:%d: Bad key %s in record\n", FILENAME, FNR, key)
    initial = substr(key, 2, i - 2)
  } else if (kchars[2] == Command_char) {
    nextchar = kchars[3]
    if (initial == Command_char && (nextchar == "{" || nextchar == "}"))
      initial = substr(key, 2, 3)
    else {
      initial = toupper(nextchar)
    }
  } else {
    initial = toupper(kchars[2])
  }

  return initial
}
function field_split( \
  record, fields, start, end, com_ch,      # parameters
  chars, numchars, out, delim_count, i, j, k) # locals
{
  del_array(fields)

  numchars = char_split(record, chars)
  j = 1  # index into fields
  k = 1  # index into out
  delim_count = 1
  for (i = 2; i <= numchars; i++) {
    if (chars[i] == com_ch) {
      if (index(Special_chars, chars[i+1]) != 0) {
        out[k++] = chars[i+1]
        i++
      } else
        out[k++] = chars[i]
    } else if (chars[i] == start) {
      delim_count++
      out[k++] = chars[i]
    } else if (chars[i] == end) {
      delim_count--

      if (delim_count == 0) {
        fields[j++] = join(out, 1, k-1, SUBSEP)
        del_array(out)  # reset for next time through
        k = 1
        
        i++
        if (i <= numchars && chars[i] != start)
          fatal(_"%s:%d: Bad entry; expected %s at column %d\n",
                FILENAME, FNR, start, i)
        delim_count = 1
      } else
        out[k++] = chars[i]
    } else
      out[k++] = chars[i]

    if (j == 3) {  # Per Karl, just grab the whole rest of the line
      # extract everything between the outer delimiters
      fields[3] = substr(record, i + 1, numchars - i - 1)
      break
    }
  }

  return j  # num fields
}
function print_initial(initial)
{
  if (Do_initials) {
    if (index(Special_chars, initial) != 0)
      initial = Command_char initial
    printf("%cinitial {%s}\n",
      Command_char, initial) > Output_file
  }
}
BEGIN {
  for (i = 0; i < 256; i++) {
    c = sprintf("%c", i)
    Ordval[c] = i  # map character to value

    if ((n = isdigit(c)) > 0) {
      Ordval[c] += 512
    }
  }

  # Give both 'A' and 'a' the same code
  i = Ordval["A"]
  j = Ordval["Z"]
  for (; i <= j; i++) {
    c = sprintf("%c", i)

    # In ASCII, 'A' is before 'a', so this is
    # the right order to check
    #
    # Checking isupper() lets this work for EBCDIC, too.
    if (isupper(c)) {
      Ordval[c] += 512
      Ordval[tolower(c)] = Ordval[c]
    }
  }
}
function less_than(left, right,    len_l, len_r, len, chars_l, chars_r)
{
  len_l = length(left)
  len_r = length(right)
  len = (len_l < len_r ? len_l : len_r)

  char_split(left, chars_l)
  char_split(right, chars_r)

  for (i = 1; i <= len; i++) {
    if (isalpha(chars_l[i]) && isalpha(chars_r[i])) {
      # same char different case
      # upper case comes out last
      if (chars_l[i] != chars_r[i] &&
        tolower(chars_l[i]) == tolower(chars_r[i])) {
          if (   i != len \
            && (isalpha(chars_l[i+1]) \
              || isalpha(chars_r[i+1])))
            continue
          if (chars_l[i] > chars_r[i])
            return 1
          return 0
      }
      # same case, different char,
      # or different case, different char:
      # letter order wins
      if (Ordval[chars_l[i]] < Ordval[chars_r[i]])
        return 1

      if (Ordval[chars_l[i]] > Ordval[chars_r[i]])
        return 0

      # equal, keep going
      continue
    }

    # letter and something else, or two non-letters
    # letter order wins
    if (Ordval[chars_l[i]] < Ordval[chars_r[i]])
      return 1

    if (Ordval[chars_l[i]] > Ordval[chars_r[i]])
      return 0

    # equal, keep going
  }

  # equal so far, shorter one wins
  if (len_l < len_r)
    return 1

  return 0
}
