PKG_NAME = dnsmasq
PKG_VERS = 2.80
PKG_EXT = tar.xz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://thekelleys.org.uk/dnsmasq/
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/libidn cross/nettle cross/gmp

HOMEPAGE = http://thekelleys.org.uk/dnsmasq/doc.html
COMMENT  = A lightweight DNS, TFTP, PXE, router advertisement and DHCP server. It is intended to provide coupled DNS and DHCP service to a LAN.
LICENSE  = GPLv2/GPLv3

ENV += CURDIR="$(WORK_DIR)/$(PKG_DIR)"

CONFIGURE_TARGET = nop
COMPILE_TARGET = myCompile
INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk

.PHONY: myCompile
myCompile:
	$(RUN) $(MAKE) dnsmasq COPTS="-DHAVE_BROKEN_RTC -DHAVE_DBUS -DVERSION=\"$(PKG_VERS)\"" PREFIX=$(INSTALL_PREFIX)

.PHONY: myInstall
myInstall:
	install -m 755 -d $(STAGING_INSTALL_PREFIX)/sbin
	install -m 755 -d $(STAGING_INSTALL_PREFIX)/etc/dnsmasq.d
	install -m 755 -d $(STAGING_INSTALL_PREFIX)/share/dnsmasq
	install -m 755 -d $(STAGING_INSTALL_PREFIX)/var/lib/misc
	touch $(STAGING_INSTALL_PREFIX)/etc/dnsmasq.d/dummy
	touch $(STAGING_INSTALL_PREFIX)/var/lib/misc/dnsmasq.leases
	install -m 0755 -s $(WORK_DIR)/$(PKG_DIR)/src/dnsmasq 
	install -m 0644 $(WORK_DIR)/$(PKG_DIR)/trust-anchors.conf $(STAGING_INSTALL_PREFIX)/share/dnsmasq
	cat $(WORK_DIR)/$(PKG_DIR)/dnsmasq.conf.example | sed -e 's/\#conf-dir\=\/etc\/dnsmasq.d\/,\*.conf/conf-dir\=\/etc\/dnsmasq.d\/,\*.conf/g' > $(STAGING_INSTALL_PREFIX)/etc/dnsmasq.conf
