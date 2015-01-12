# Copyright 2010, 2011, 2012, 2013, 2014, 2015
# Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

#######################################################
# From gawk manual
# ord.awk --- do ord and chr

# Global identifiers:
#    _ord_:        numerical values indexed by characters
#    _ord_init:    function to initialize _ord_

BEGIN    { _ord_init() }

function _ord_init(    low, high, i, t)
{
    low = sprintf("%c", 7) # BEL is ascii 7
    if (low == "\a") {    # regular ascii
        low = 0
        high = 127
    } else if (sprintf("%c", 128 + 7) == "\a") {
        # ascii, mark parity
        low = 128
        high = 255
    } else {        # ebcdic(!)
        low = 0
        high = 255
    }

    for (i = low; i <= high; i++) {
        t = sprintf("%c", i)
        _ord_[t] = i
    }
}

function ord(str,    c)
{
    # only first character is of interest
    c = substr(str, 1, 1)
    return _ord_[c]
}

#######################################################


BEGIN {
    bs_escapes["\\n"] = "\n"
    bs_escapes["\\f"] = "\f"
    bs_escapes["\\t"] = "\t"
    bs_escapes["\\\\"] = "\\"
    bs_escapes["\\\""] = "\""
    bs_escapes["\\x20"] = " "

    for (v in bs_escapes) {
        inv_bs_escapes[bs_escapes[v]] = v
    }

    print "/* This file automatically generated by command_data.awk */"
    print "enum command_id {"
    print "CM_NONE,"
    print
}

!/^$/ && !/^#/ {
    if ($1 in bs_escapes)
        commands[bs_escapes[$1]] = $2
    else
        commands[$1] = $2
    data[$1] = $3
}

END {
    print "COMMAND builtin_command_data[] = {" >"command_data.c"

    print "0, 0, 0," >"command_data.c"

    # We want the output sorted so we can use bsearch
    PROCINFO["sorted_in"]="@ind_str_asc"
    for (c in commands) {
        # Single character commands with unusual names
        if (c ~ /^[^[:alpha:]]$/) {
                if (c in inv_bs_escapes) {
                    c2 = inv_bs_escapes[c]
                } else
                    c2 = c
                printf "CM_hex_%02x,\n", ord(c)
        } else {
                c2 = c
                print "CM_" c ","
        }

        if (commands[c] != "") {
            flags = "CF_" commands[c]
            gsub (/,/, " | CF_", flags)
        } else {
            flags = "0"
        }

        if (data[c] != "") {
            command_data = data[c]
        } else {
            command_data = "0"
        }
        print "\"" c2 "\", " flags ", " command_data "," > "command_data.c"
    }
    print "};" >"command_data.c"
    print "};"
}


