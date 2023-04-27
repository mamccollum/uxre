all: libuxre.a libuxre.so

OBJ = bracket.o _collelem.o _collmult.o regcomp.o regdfa.o regerror.o \
	regexec.o regfree.o regnfa.o regparse.o stubs.o

#OBJ = onefile.o regfree.o regerror.o

libuxre.a: $(OBJ)
	$(AR) -rv $@ $(OBJ)
	$(RANLIB) $@

libuxre.so: $(OBJ)
	$(CC) -shared -o $@ $(OBJ)

onefile.o: onefile.c
	$(CC) $(CFLAGS2) $(CPPFLAGS) $(XO5FL) $(IWCHAR) -I. -c onefile.c

_collelem.o: _collelem.c
	$(CC) $(CFLAGSS) $(CPPFLAGS) $(XO5FL) $(IWCHAR) -I. -c _collelem.c

_collmult.o: _collmult.c
	$(CC) $(CFLAGSS) $(CPPFLAGS) $(XO5FL) $(IWCHAR) -I. -c _collmult.c

bracket.o: bracket.c
	$(CC) $(CFLAGS2) $(CPPFLAGS) $(XO5FL) $(IWCHAR) -I. -c bracket.c

regcomp.o: regcomp.c
	$(CC) $(CFLAGSS) $(CPPFLAGS) $(XO5FL) $(IWCHAR) -I. -c regcomp.c

regdfa.o: regdfa.c
	$(CC) $(CFLAGS2) $(CPPFLAGS) $(XO5FL) $(IWCHAR) -I. -c regdfa.c

regerror.o: regerror.c
	$(CC) $(CFLAGSS) $(CPPFLAGS) $(XO5FL) $(IWCHAR) -I. -c regerror.c

regexec.o: regexec.c
	$(CC) $(CFLAGSS) $(CPPFLAGS) $(XO5FL) $(IWCHAR) -I. -c regexec.c

regfree.o: regfree.c
	$(CC) $(CFLAGSS) $(CPPFLAGS) $(XO5FL) $(IWCHAR) -I. -c regfree.c

regnfa.o: regnfa.c
	$(CC) $(CFLAGS2) $(CPPFLAGS) $(XO5FL) $(IWCHAR) -I. -c regnfa.c

regparse.o: regparse.c
	$(CC) $(CFLAGSS) $(CPPFLAGS) $(XO5FL) $(IWCHAR) -I. -c regparse.c

stubs.o: stubs.c
	$(CC) $(CFLAGS2) $(CPPFLAGS) $(XO5FL) $(IWCHAR) -I. -c stubs.c

install:
	install -d $(DESTDIR)$(PREFIX)/lib
	install -m 644 libuxre.a $(DESTDIR)$(PREFIX)/lib
	install -m 755 libuxre.so $(DESTDIR)$(PREFIX)/lib
	install -d $(DESTDIR)$(PREFIX)/include
	install -m 644 re.h $(DESTDIR)$(PREFIX)/include
	install -m 644 regex.h $(DESTDIR)$(PREFIX)/include
	install -m 644 wcharm.h $(DESTDIR)$(PREFIX)/include

clean:
	rm -f $(OBJ) core log *~

_collelem.o: colldata.h re.h regex.h wcharm.h
_collmult.o: colldata.h re.h regex.h wcharm.h
bracket.o: colldata.h re.h regex.h wcharm.h
regcomp.o: colldata.h re.h regex.h wcharm.h
regdfa.o: colldata.h regdfa.h re.h regex.h wcharm.h 
regerror.o: colldata.h re.h regex.h wcharm.h
regexec.o: colldata.h re.h regex.h wcharm.h
regfree.o: colldata.h re.h regex.h wcharm.h
regnfa.o: colldata.h re.h regex.h wcharm.h
regparse.o: colldata.h re.h regex.h wcharm.h
stubs.o: colldata.h wcharm.h
onefile.o: _collelem.c _collmult.c bracket.c regcomp.c regdfa.c regexec.c
onefile.o: regfree.c regnfa.c regparse.c stubs.c 

mrproper: clean
	rm -f libuxre.a Makefile
