CSOURCES=PH7/ph7.c
CINCLUDE=PH7
DSOURCES=source/ph7/ph7.d source/app.d
default:
	make native-library
	make d-library
native-library:
	g++ -I$(CINCLUDE) -Wno-write-strings -O2 -shared -fPIC $(CSOURCES) -o libph7.so
d-library:
	dub build
