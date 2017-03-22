DESTDIR=
COMPONENT=azkaban

DEB_VERSION:=$(shell dpkg-parsechangelog | grep Version | cut -d' ' -f2)

PACKAGE="${COMPONENT}_${DEB_VERSION}_all.deb"

all:

deb:
	+dpkg-buildpackage -b -rfakeroot -uc -us && mv ../$(PACKAGE) .

localtest: deb
	sudo dpkg -i $(PACKAGE)

