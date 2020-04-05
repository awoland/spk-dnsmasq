SPK_NAME = dnsmasq
SPK_VERS = 2.80
SPK_REV = 1
SPK_ICON = src/dnsmasq.png
DEPENDS = cross/busybox cross/$(SPK_NAME)

MAINTAINER = SynoCommunity
DESCRIPTION = DNSMASQ is a lightweight DNS, TFTP, PXE, router advertisement and DHCP server. It is intended to provide coupled DNS and DHCP service to a LAN.
RELOAD_UI = yes
DISPLAY_NAME = DNSMASQ
STARTABLE = yes
CHANGELOG = "1. Starting version spk 2.80"
HOMEPAGE = http://thekelleys.org.uk/dnsmasq/doc.html
LICENSE  = GPLv2/GPLv3

SERVICE_USER = auto
# SERVICE_COMMAND is provided there
SERVICE_SETUP = src/service-setup.sh

SERVICE_PORT = 53
SERVICE_PORT_TITLE = $(DISPLAY_NAME)
NO_SERVICE_SHORTCUT = yes

POST_STRIP_TARGET = dnsmasq_extra_install

BUSYBOX_CONFIG = usrmng
ENV += BUSYBOX_CONFIG="$(BUSYBOX_CONFIG)"

include ../../mk/spksrc.spk.mk

.PHONY: dnsmasq_extra_install
dnsmasq_extra_install:
	install -d $(STAGING_DIR)/var
	install -m 644 src/dnsmasq.conf $(STAGING_DIR)/var/dnsmasq.conf
