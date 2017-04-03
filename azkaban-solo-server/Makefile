DESTDIR=
COMPONENT=azkaban-solo-server

DEB_VERSION:=$(shell dpkg-parsechangelog | grep Version | cut -d' ' -f2)
PACKAGE="${COMPONENT}_${DEB_VERSION}_all.deb"

BIN=$(DESTDIR)/usr/bin
LIB=$(DESTDIR)/usr/lib/$(COMPONENT)
CONF=$(DESTDIR)/etc/$(COMPONENT)
CONF_PLUGINS=$(DESTDIR)/etc/$(COMPONENT)/plugins
SQL_DEST=$(DESTDIR)/var/lib/${COMPONENT}/sql
WEB_DEST=$(DESTDIR)/var/lib/${COMPONENT}/web

BUILD=../src/$(COMPONENT)/build/install/$(COMPONENT)

all:

deb:
	+dpkg-buildpackage -b -rfakeroot -uc -us && mv ../$(PACKAGE) . || \
		echo "Did you run './configure' in main directory?"

install:
	install -d $(CONF) $(CONF_PLUGINS) $(LIB)/extlib $(SQL_DEST) $(WEB_DEST) $(BIN_DEST) $(BIN)
	cp -R $(BUILD)/conf/* $(CONF)
	cp -R conf/* $(CONF)
	cp -R $(BUILD)/plugins/* $(CONF_PLUGINS)
	cp -R $(BUILD)/sql/* $(SQL_DEST)
	cp -R $(BUILD)/web/* $(WEB_DEST)
	cp -R $(BUILD)/lib/* $(LIB)
	-cp -R ../extlib/* $(LIB)/extlib
	cp -R bin/* $(BIN)

localtest: deb
	dpkg -i $(PACKAGE)

