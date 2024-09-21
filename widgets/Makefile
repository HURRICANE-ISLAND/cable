#
#    This file is part of WHOI Cable, a program for the static and dynamic
#    analysis of oceanographic cable structures.
#
#    Copyright (C) 1997-2012 by Woods Hole Oceanographic Institution (WHOI)
#    and Jason Gobat
#                            by Hurricane Island
#
#    WHOI Cable is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    WHOI Cable is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with WHOI Cable.  If not, see <http://www.gnu.org/licenses/>.
#

ifeq ($(OS),OSX-universal)
    CFLAGS = -Wall -O2 -g -I../include \
             -force_cpusubtype_ALL -mmacosx-version-min=10.4 \
             -arch i386 -arch ppc
else ifeq ($(OS),OSX)
    CFLAGS = -Wall -O2 -g -I../include -mmacosx-version-min=10.4
else
    # CFLAGS = -Wall -O2 -g -I../include -I/opt/x11/include
    CFLAGS = -O2 -g -I../include -I/opt/x11/include
endif

LIB	= libwidgets.a
OBJS = post.o tabgroup.o scroll.o util.o outputdialog.o \
 Layout.o laylex.o laygram.o 

clean:
	@rm -f $(OBJS) $(LIB)

$(LIB): $(OBJS)
	rm -f $@
	ar cq $@ $^
	ranlib $@

all: $(OBJS)

.PHONY: test