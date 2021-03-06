# Copyright © 2012-2013 Martin Ueding <dev@martin-ueding.de>

all: git-tarball.1.gz git-upload-tarballs.1.gz

%.1.gz: %.1
	$(RM) $@
	gzip $<

%.1: %.1.rst
	rst2man $< $@

install:
	if [ -f git-tarball.1.gz ]; then install -d "$(DESTDIR)/usr/share/man/man1/"; install -m 644 git-tarball.1.gz -t "$(DESTDIR)/usr/share/man/man1/"; fi
	if [ -f git-upload-tarballs.1.gz ]; then install -d "$(DESTDIR)/usr/share/man/man1/"; install -m 644 git-upload-tarballs.1.gz -t "$(DESTDIR)/usr/share/man/man1/"; fi
	install -d "$(DESTDIR)/usr/bin/"
	install git-tarball -t "$(DESTDIR)/usr/bin/"
	install git-upload-tarballs -t "$(DESTDIR)/usr/bin/"

.PHONY: clean
clean:
	$(RM) *.1
	$(RM) *.1.gz
