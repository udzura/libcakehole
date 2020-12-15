libcakehole.so: cakehole.o
	$(CC) -g -shared -o libcakehole.so cakehole.o

libcakehole.a: cakehole.o
	$(AR) r libcakehole.a cakehole.o

cakehole.o: cakehole.c
	$(CC) -g -c -O0 -fPIC cakehole.c

libcakehole_listen.so: libcakehole.a cakehole_listen.c
	$(CC) -g -c -O0 -fPIC -ldl cakehole_listen.c
	$(CC) -g -shared -O0 -fPIC cakehole_listen.o libcakehole.a \
		-o libcakehole_listen.so

sample_run: libcakehole_listen.so
	strace -elisten,kill env LD_PRELOAD=./libcakehole_listen.so \
		ruby -run -e httpd

.PHONY: sample_run
