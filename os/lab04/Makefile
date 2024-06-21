CC=gcc
DYNFLAGS=-fPIC -shared
CFLAGS=-Wall
LDFLAGS=-Wl,--wrap=fred -Wl,--wrap=john
RPATH=-Wl,-rpath,.

all: libstatic.a libshared.so main load.so

libstatic.a: fred.o john.o
	ar crv $@ $^

libshared.so: sam.o bill.o
	$(CC) $(DYNFLAGS) -o $@ $^

fred.o: fred.c
	$(CC) $(CFLAGS) -c $< -o $@

john.o: john.c
	$(CC) $(CFLAGS) -c $< -o $@

sam.o: sam.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

bill.o: bill.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

main.o: main.c
	$(CC) $(CFLAGS) -c $< -o $@

link.o: link.c
	$(CC) $(CFLAGS) -DLINKTIME -c $< -o $@

load.so: load.c
	$(CC) $(DYNFLAGS) -DRUNTIME -o $@ $< -ldl

main: main.o libstatic.a libshared.so link.o
	$(CC) -o $@ main.o link.o -L. -lstatic -lshared -ldl -lm $(LDFLAGS) $(RPATH)

run: main
	LD_PRELOAD=./load.so ./main

clean:
	rm -f *.o *.a *.so main