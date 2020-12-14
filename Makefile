libcakehole.so: cakehole.o
	$(CC) -g -shared -o libcakehole.so cakehole.o

cakehole.o: cakehole.c
	$(CC) -g -c -O0 -fPIC cakehole.c
