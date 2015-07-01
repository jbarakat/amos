files_f= $(wildcard *.f)

files_o= $(files_f:.f=.o)

amos:libamos.a

test: bestest

ctest: cbestest

bestest: libamos.a bestest.f
	gfortran bestest.f -L./ -lamos -o bestest

cbestest: libamos.a cbestest.cpp
	g++ cbestest.cpp -L./ -lamos -lgfortran -o cbestest

libamos.a: $(files_o)
	ar cru libamos.a $(files_o)
	ranlib libamos.a
#	gfortran -fdefault-real-8 -fdefault-double-8 -c $(files_f)

$(files_o): $(files_f)
	gfortran -c $(files_f)

clean: 
	rm -f $(files_o)
	rm -f libamos.a
	rm -f bestest
