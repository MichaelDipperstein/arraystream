############################################################################
# Makefile for arraystream library and sample
#
#   $Id: Makefile,v 1.2 2007/08/27 13:01:00 michael Exp $
#   $Log: Makefile,v $
#   Revision 1.2  2007/08/27 13:01:00  michael
#   Lower optimization level.
#   -O2 in GCC 4.1.2 results in a seg fault.
#
#   Revision 1.1.1.1  2004/12/06 13:41:26  michael
#   initial release
#
#
############################################################################

CC = gcc
LD = gcc
CFLAGS = -O -Wall -ansi -c
LDFLAGS = -O -o

# Treat NT and non-NT windows the same
ifeq ($(OS),Windows_NT)
	OS = Windows
endif

ifeq ($(OS),Windows)
	EXE = .exe
	DEL = del
else	#assume Linux/Unix
	EXE =
	DEL = rm
endif

all:		sample$(EXE)

sample$(EXE):	sample.o arraystream.o
		$(LD) $^ $(LDFLAGS) $@

sample.o:	sample.c arraystream.h
		$(CC) $(CFLAGS) $<

arraystream.o:	arraystream.c arraystream.h
		$(CC) $(CFLAGS) $<

clean:
		$(DEL) *.o
		$(DEL) sample$(EXE)
