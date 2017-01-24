#
# Copyright (C) 2016 LEDE project (Tobias Ilte)
#
# This is free software, licensed under the GNU General Public License v3.

include $(TOPDIR)/rules.mk

PKG_NAME:=dailyreboot
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_MAINTAINER:=Tobias Ilte <tobias.ilte@campus.tu-berlin.de>
PKG_LICENSE:=GPL-3.0+


include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=Sets cronjob for daily reboot with random offset.
    MAINTAINER:=Tobias Ilte <tobias.ilte@campus.tu-berlin.de>
endef

define Package/$(PKG_NAME)/description
Sets cronjob for daily reboot with random offset.
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/rebootcron
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./src/rebootcron.sh $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./src/rebootscript $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./src/rebootcron.init $(1)/etc/init.d/rebootcron
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./src/rebootcron.config $(1)/etc/config/rebootcron
endef

$(eval $(call BuildPackage,$(PKG_NAME)))

