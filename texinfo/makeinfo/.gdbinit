define redo
file makeinfo
end

set env MALLOC_CHECK_ 2
set env ttests ../../@tests

#set args -o /tmp/out --no-validate ../@ttests/outside.texi
#set args -o - $ttests/hyphyph.tex
#set args -o - $ttests/sentence-end.texi

# unrecognized command @contents.
#set args -o /dev/null $ttests/contents2.tex

# multiple paragraph @item not indented after @center
#set args -o - $ttests/centerenum.tex

# core dump
#set args -o /dev/null --html $ttests/multit.tex

# all kinds of lossage with @tex expansion
#set args -I../doc --iftex --no-ifinfo -o /dev/null texinfo.txi

# no-headers to stdout should work.
set args -I../doc --no-headers $ttests/contents.tex -o /tmp/xyz

# Using a multi-argument macro to construct node names.
#set args -o - -E $ttests/macro-nodename.xp $ttests/macro-nodename.texi

# @multitable in an indented environment (@defun).
#set args -o - $ttests/multindent.tex

# Lowercasification of @samp arg.
#set args -o - $ttests/casesamp.tex

# Crash reported.
#set args -o /dev/null $ttests/podcrash.tex

# Crash reported here.
#set args -o - $ttests/macro-noparam.tex

# Crashes when multiple files.
#set args -o /dev/null -I $ttests -I /u/karl/gnu/gnuorg /usr/local/gnu/src/make-3.75/make.texinfo tasks.texi

# Crash on redirected indices.
#set args -o - -I $ttests synindex.tex synindex.tex

# Crash on unmacro.
#set args -o /dev/null $ttests/unmacro.tex

# Empty macros not expanded.
#set args -o /dev/null -E $ttests/mac-empty.xp $ttests/mac-empty.tex

# No macro expansion in footnotes.
#set args -o - -E $ttests/mac-footnote.xp $ttests/mac-footnote.tex
#set args -o - -E $ttests/footnote.xp $ttests/footnote.tex

# Output files should get removed on error.
#set args -E $ttests/error.xp $ttests/error.tex

# Should complain about double redirection to stdout.
#set args -E - -o - $ttests/error.tex

# @deftypemethod.
#set args -o - $ttests/deftypemethod.tex

# Core dump on mismatched ifset/end ifclear.
#set args -o - $ttests/setclear.tex

# Missing blank line in nested @table.
#set args -o - $ttests/tablenest.tex

# Chars with high bit set end up with short line lengths.
#set args -o - $ttests/eight.tex

# Macros not expanded if not defined at right place in the file?
#set args -o - $ttests/mac-top.tex

# Weird cross-reference errors.  Line numbers off in first.
#set args --force $ttests/gforth.texi
#set args --force $ttests/ref.tex

# Images.
#set args -o - $ttests/image.tex

# Errors in index commands have the line number of the @printindex
# command instead of the source index entry.
# set args -o /dev/null -I$ttests $ttests/indexerr.texi

# Macros not expanded in @uref, @email.
#set args -o /tmp/x -E - $ttests/mac-pack.tex
#set args -o /tmp/uref -E - $ttests/uref.tex

# Incorrect indentation inside @smallexample if @group.
#set args -o - $ttests/dotindent.tex

# Anchor tag tables.
#set args -o /tmp/a $ttests/anchor1.tex

# maybe_brace_args
#set args -o - $ttests/accent.tex

# seg fault.
#set args -o /dev/null ../doc/info-stnd.texi

# Error in comment menu items.
#set args -o /dev/null $ttests/menucomment.tex

# @sp ignored in info now.
#set args -o - $ttests/sp.tex

# blank @item in @multitable.
#set args -o - $ttests/multiblank.tex

# blank lines chewed up by @exdent
#set args -o - $ttests/exdentblank.tex

# -- collapsed to - in index.
#set args -o - $ttests/synindex.tex

# split output file at anchor with @anchor before @printindex cp.
#set args -o /tmp/u -I../doc texinfo.txi

# @ifset switches @itemize to @enumerate
#set args -o - $ttests/itemset.tex

#set env LANG de
#set args -o - $ttests/doclang.tex

# allow braces, no braces, etc as item markers
#set args -o - $ttests/itemspace.tex

# \'s and implicit @quote-arg in macro params
#set args -o - $ttests/mac-quote.tex

# raw html misoutput
#set args --html -o - $ttests/rawhtml.tex

#set args --html tests/html-docdesc.txi

#set args -o - --enable-encoding -I tests --no-headers tests/accentenc.txi

#set args -o /dev/null --no-split --enable-encoding -I ../doc --no-headers texinfo.txi

# permissions output in each split html/info file as a comment, also in xml.
#set args --force -I ../doc info-stnd.texi

# @{ in @deffn arg.
#set args -o - $ttests/macbrace.tex

# can't change split directory name.
#set args -I../doc --html -o README.split texinfo.txi

# --xml complains about @sp.
#set args -o - --xml $ttests/sp.tex

# macro expansion ouput first.
set args -o - --html $ttests/macfirst.tex

# crash
set args -o - --docbook $ttests/idxangle.tex

# node positions in tag table don't reflect copying text.
set args -o - $ttests/copyinglong.tex

# @nabla^2 is taken as the macro name, including the ^2.
set args -o - $ttests/math.tex

# seg fault
set args -o /dev/null /nonexistent.texinfo tests/html-min.txi

# infinite error
set args -o - tests/itemize-extra.txi

# local variables with split files
set args --no-warn --enable-encoding --split-size=150000 $ttests/xe.tex

# local variables with encoding info
set args -o - --enable-encoding $ttests/doclatin1.tex

# --xml?
set args -o /dev/null --xml $ttests/doclatin1.tex

# seg fault printindex twice
set args -o - $ttests/index22.tex

# seg fault
set args -o /dev/null $ttests/lilypond-internals.nexi

# no <html>
set args -o $ttests/tbook.html --html --no-split $ttests/tbook.tex

set args -o /tmp/x.html -I$tdoc --html --no-split $tdoc/texinfo.txi
