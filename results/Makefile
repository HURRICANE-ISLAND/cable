#
#    This file is part of WHOI Cable, a program for the static and dynamic
#    analysis of oceanographic cable structures.
#
#    Copyright (C) 1997-2016 by Woods Hole Oceanographic Institution (WHOI)
#    and Jason Gobat
#                  2024      by Hurricane Island
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

CC = gcc
ifeq ($(OS),windows)
    CFLAGS = -O2 -Wall -funroll-loops -I../include -DZLIB -DWINGUI \
            -mms-bitfields
else ifeq ($(OS),OSX-universal)
    CFLAGS = -g -O2 -Wall -I../include -DZLIB -DGUI \
             -force_cpusubtype_ALL -mmacosx-version-min=10.4 \
             -arch i386 -arch ppc
else
    CFLAGS = -g -DZLIB -DGUI -Wall -I../include
endif

LIB = libresults.a
OBJS = results.o rotate.o res2mat.o

$(LIB): $(OBJS)
	rm -f $@
	ar cq $@ $^
	ranlib $@

all: $(LIB)

clean:
	@rm -f $(OBJS) $(LIB) core

.PHONY: all clean
