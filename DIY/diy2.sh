#!/bin/bash
#====================================================
# MZwrt 脚本
#====================================================             



##配置IP
sed -i  's/192.168.1.100/192.168.1.100/g' package/base-files/files/bin/config_generate

##
rm -rf ./feeds/extraipk/主题/luci-theme-argon-18.06
rm -rf ./feeds/extraipk/主题/luci-app-argon-config-18.06
rm -rf ./feeds/extraipk/主题/ luci-主题-设计
rm -rf ./feeds/extraipk/主题/ luci-主题-edge
rm -rf ./feeds/extraipk/主题/ luci-主题-ifit
rm -rf ./feeds/extraipk/主题/ luci-theme-opentopd
rm -rf ./feeds/extraipk/主题/ luci-主题-neobird

rm -rf ./package/feeds/extraipk/luci-theme-argon-18.06
rm -rf ./package/feeds/extraipk/luci-app-argon-config-18.06
rm -rf ./package/feeds/extraipk/主题/luci-主题-设计
rm -rf ./package/feeds/extraipk/主题/ luci-theme-edge
rm -rf ./package/feeds/extraipk/主题/ luci-theme-ifit
rm -rf ./package/feeds/extraipk/主题/ luci-theme-opentopd
rm -rf ./package/feeds/extraipk/主题/ luci-theme-neobird


##取消bootstrap为默认主题
sed -i  '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i  's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i  's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile

##更改主机名
sed -i  "s/hostname='.*'/hostname='MzWrt'/g" package/base-files/files/bin/config_generate

##作者加入信息
sed -i  "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='MzWrt- $(date +%Y%m%d) '/g"   package/base-files/files/etc/openwrt_release
sed -i  "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' By Mz'/g" package/base-files/files/etc/openwrt_release
cp -af feeds/extraipk/patch/diy/banner-MZwrt 包/base-files/files/etc/banner

sed -i   "2iuci set istore.istore.channel='MZ_wrt'" package/emortal/default-settings/files/99-default-settings
sed -i   “3iuci 提交 istore”包/emortal/default-settings/files/99-default-settings
sed -i .bak “s，mirrors.vsean.net/openwrt，mirrors.vsean.net/openwrt，g”包/emortal/default-settings/files/99-default-settings


##无线上网
sed -i  “s/MT7981_AX3000_2.4G/MzWrt-2.4G/g”包/mtk/drivers/wifi-profile/files/mt7981/mt7981.dbdc.b0.dat
sed -i  “s/MT7981_AX3000_5G/MzWrt-5G/g”包/mtk/drivers/wifi-profile/files/mt7981/mt7981.dbdc.b1.dat

##新的无线网络
sed -i  “s/ImmortalWrt-2.4G/MzWrt-2.4G/g”包/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i  “s/ImmortalWrt-5G/MzWrt-5G/g”包/mtk/applications/mtwifi-cfg/files/mtwifi.sh


