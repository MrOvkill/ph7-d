CSOURCES=src/interface.cpp src/ph7.c
DSOURCES=source/ph7/ph7.d source/app.d
default:
	make native-library
	make d-library
native-library:
	g++ -Iinclude -Wno-write-strings -O2 -shared -fPIC $(CSOURCES) -o libph7.so
d-library:
	dmd $(DSOURCES) -ofph7 -L-L. -L-lph7