DFILES = libpq.di connection.d query.d answer.d fields.d unittests_main.d
ONAME = libdpq2
DC = dmd
COMMON = $(DC) $(DFILES) -w -d -property -of$(ONAME)

DEBUG = $(COMMON) -g -debug -lib
RELEASE = $(COMMON) -release -O -lib
UNITTEST = $(COMMON) -g -debug -unittest

release:
	$(RELEASE)

debug:
	$(DEBUG)

unittest:
	$(UNITTEST)

doc:
	$(RELEASE) -o- -Dddoc

clean:
	rm -rf *.o *.a
	rm -rf doc
	rm -f $(ONAME)
