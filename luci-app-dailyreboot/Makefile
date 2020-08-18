#
# Copyright (C) 2017 OpenWrt project (Tobias Ilte)
#
# This is free software, licensed under the GNU General Public License v3.

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-dailyreboot
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_MAINTAINER:=Tobias Ilte <tobias.ilte@campus.tu-berlin.de>
PKG_LICENSE:=GPL-3.0+
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
    SECTION:=LuCI
    CATEGORY:=LuCI
    SUBMENU:=3. Applications
    TITLE:=LuCI Support for dailyreboot
    DEPENDS:=+lua +luci-base +dailyreboot +luci-compat
    MAINTAINER:=Tobias Ilte <tobias.ilte@campus.tu-berlin.de>
    PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
Sets cronjob for daily reboot with random offset.
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./root/etc/uci-defaults/40_luci-dailyreboot $(1)/etc/uci-defaults/40_luci-dailyreboot
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/dailyreboot
	$(INSTALL_DATA) ./luasrc/model/cbi/dailyreboot.lua $(1)/usr/lib/lua/luci/model/cbi/dailyreboot.lua
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./luasrc/controller/dailyreboot.lua $(1)/usr/lib/lua/luci/controller/dailyreboot.lua
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
        $(INSTALL_DATA) ./root/usr/share/luci/menu.d/luci-app-dailyreboot.json $(1)/usr/share/luci/menu.d/luci-app-dailyreboot.json
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
        $(INSTALL_DATA) ./root/usr/share/rpcd/acl.d/luci-app-dailyreboot.json $(1)/usr/share/rpcd/acl.d/luci-app-dailyreboot.json
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
