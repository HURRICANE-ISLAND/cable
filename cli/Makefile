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

TAR = tar
CC = gcc
LD = gcc

ifeq ($(OS),windows)
   CFLAGS   = -O6 -Wall -funroll-loops -I../include -DWINGUI \
              -DZLIB -mms-bitfields 
   LDFLAGS = -mwindows 
   WOBJS   = WinControl.o winres.o
   XLIBS   =
   ZLIBS    = -lz
else ifeq ($(OS),OSX)
   CFLAGS = -g -O2 -Wall -funroll-loops -I../include \
             -DZLIB -DGUI -I../widgets -I/opt/x11/include -mmacosx-version-min=10.4
   WOBJS = Xcontrol.o 
   LDFLAGS = -mmacosx-version-min=10.4 
   WIDGETS = ../widgets/libwidgets.a
   XLIBS = -L/usr/X11R6/lib -lXaw -lXmu -lXt -lX11
   ZLIBS = -lz
else ifeq ($(OS),OSX-universal)
   CFLAGS = -O2 -Wall -funroll-loops -I../include -I/opt/x11/include \
            -force_cpusubtype_ALL -mmacosx-version-min=10.4 \
            -arch i386 -arch ppc -DZLIB
   WOBJS   = Xcontrol.o
   LDFLAGS = -force_cpusubtype_ALL -mmacosx-version-min=10.4 \
             -arch i386 -arch ppc
   WIDGETS =
   XLIBS =
   ZLIBS = -lz
else ifeq ($(OS),nox)
   CFLAGS = -g -Wall -funroll-loops -I../include -DZLIB 
   WOBJS =
   XLIBS =
   WIDGETS =
   LDFLAGS = -g
   ZLIBS = -lz -lm
else
   CFLAGS = -g -DGUI -Wall -funroll-loops -I../include \
            -DZLIB -I../widgets -I/usr/X11R6/include
   WOBJS   = Xcontrol.o
   LDFLAGS  = -g
   WIDGETS  = ../widgets/libwidgets.a
   XLIBS    = -L/usr/X11R6/lib -lXaw -lXmu -lXt -lX11
   ZLIBS    = -lz -lm
endif

OBJS = cli.o error.o options.o
ASCOBJS = res2asc.o options.o errtxt.o 
MATOBJS = res2mat.o options.o basename.o errtxt.o
LIBS = ../solver/libsolver.a ../model/libmodel.a ../results/libresults.a

PROG = cable res2mat res2asc

all: cable res2mat res2asc

cable: $(OBJS) $(LIBS) $(WOBJS)
	$(CC) -o cable $(LDFLAGS) $^ $(WIDGETS) $(XLIBS) $(ZLIBS) $(DEBUGLIBS)

res2mat: $(MATOBJS) $(LIBS)
	$(CC) -o res2mat $(LDFLAGS) $^ $(ZLIBS) 

res2asc: $(ASCOBJS) $(LIBS)
	$(CC) $(LDFLAGS) -o res2asc $^ $(ZLIBS)

api: api.o $(OBJS) $(LIBS)
	rm -f libcable.a
	ar cq libcable.a api.o $(OBJS)
	ranlib libcable.a

winres.o: WinControl.rc
	windres -i WinControl.rc -o winres.o

clean:
	@rm -f $(OBJS) $(ASCOBJS) $(MATOBJS) $(PROG) cli.o driver.o api.o WinControl.o Xcontrol.o core winres.o *.core
