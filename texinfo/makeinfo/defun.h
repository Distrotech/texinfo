/* defun.h -- declaration for defuns.
   $Id: defun.h,v 1.3 2005-03-31 16:56:48 karl Exp $

   Copyright (C) 1999, 2005 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

   Written by Karl Heinz Marbaise <kama@hippo.fido.de>.  */

#ifndef DEFUN_H
#define DEFUN_H

#include "insertion.h"

extern enum insertion_type get_base_type (enum insertion_type);
extern void cm_defun (void);

#endif /* !DEFUN_H */

