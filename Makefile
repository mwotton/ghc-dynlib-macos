all: main

libfakelib.so: fakelib.hs
	ghc-6.11.20090827 --make -dynamic -fPIC -shared fakelib.hs -o libfakelib.so  -lHSrts-ghc6.11.20090827 -L/usr/local/lib/ghc-6.11.20090827/
	# ghc-6.11.20090827  -fPIC -shared fakelib.hs -o libfakelib.so -optl'-flat_namespace' -lHSrts-ghc6.11.20090827 # -optl-Wl,-rpath,/usr/local/lib/ghc-6.11.20090827/ # -optl'-undefined suppress' 


main: libfakelib.so client.c
	gcc client.c -o main -lfakelib -L. -I/usr/local/lib/ghc-6.11.20090827/include/

clean:
	rm *.o *.hi *stub* libfakelib.so 2>/dev/null;true 
