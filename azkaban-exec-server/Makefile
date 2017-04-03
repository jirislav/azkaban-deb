DESTDIR=
COMPONENT=azkaban-exec-server

DEB_VERSION:=$(shell dpkg-parsechangelog | grep Version | cut -d' ' -f2)
PACKAGE="${COMPONENT}_${DEB_VERSION}_all.deb"

BIN=$(DESTDIR)/usr/bin
LIB=$(DESTDIR)/usr/lib/$(COMPONENT)
CONF=$(DESTDIR)/etc/$(COMPONENT)
CONF_PLUGINS=$(DESTDIR)/etc/$(COMPONENT)/plugins
SERVER_PATH=$(DESTDIR)/var/lib/$(COMPONENT)

BUILD=../src/$(COMPONENT)/build/install/$(COMPONENT)

all:

deb:
	+dpkg-buildpackage -b -rfakeroot -uc -us && mv ../$(PACKAGE) . || \
		echo "Did you run './configure' in main directory?"

install:
	install -d $(CONF) $(CONF_PLUGINS) $(LIB)/extlib $(BIN) $(SERVER_PATH)
	cp -R conf/* $(CONF)
	cp -R $(BUILD)/lib/* $(LIB)
	-cp -R extlib/* $(LIB)/extlib
	cp -R bin/* $(BIN)

localtest: deb
	dpkg -i $(PACKAGE)

