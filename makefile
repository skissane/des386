# Makefile for portable C version under UNIX

CC = cc
CFLAGS =

certify: descert testdata
	./descert < testdata

descert: descert.o deskey.o desport.o dessp.o
	$(CC) $(CFLAGS) -o descert descert.o deskey.o desport.o dessp.o

descycle: descycle.o deskey.o desport.o dessp.o
	$(CC) $(CFLAGS) -o descycle descycle.o deskey.o desport.o dessp.o

destime: unixtime.o deskey.o desport.o dessp.o
	$(CC) $(CFLAGS) -o destime unixtime.o deskey.o desport.o dessp.o

dessp.c: gensp
	./gensp c > dessp.c

gensp: gensp.c
	$(CC) $(CFLAGS) -O -o gensp gensp.c

deskey.o: deskey.c des.h
desport.o: desport.c des.h

clean:
	rm -f *.o descert descycle destime gensp dessp.c

.PHONY: certify clean
