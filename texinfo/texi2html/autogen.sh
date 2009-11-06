#! /bin/sh
# Run this to generate all the initial makefiles, etc.

test -f Makefile.am || cd "`dirname \"$0\"`"

autopoint
cp po/* po_message
cp po/* po_document
rm -rf po

# Create `aclocal.m4'.
aclocal

# Create `Makefile.in' from `Makefile.am', and symlink `install-sh',
# `missing' and `mkinstalldirs' from /usr/share/automake.
automake --add-missing 

# Create `configure' from `configure.in'.
autoconf

chmod a+x configure mdate-sh
