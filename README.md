
Daily reboot configurator with LEDE Linux [www.lede-project.org]

### How to install dailyreboot ?

1. Add `src-git dynapoint https://github.com/ascob/dailyreboot.git` to your feeds.conf
2. Run `./scripts/feeds update dailyreboot`
3. Run `./scripts/feeds install dailyreboot`
4. Run `make menuconfig` and select dailyreboot under Utilities
5. Run `make package/feeds/dailyreboot/dailyreboot/install`

### How to use dailyreboot?
Configuration in /etc/config/dailyreboot:

```
config dailyreboot dailyreboot
	option enabled '1'
	option time '03:00' # sets reboot time to 03:00 am.
	option offset '50' 	# adds random offset between 0 and 50 minutes to reboot time

```
