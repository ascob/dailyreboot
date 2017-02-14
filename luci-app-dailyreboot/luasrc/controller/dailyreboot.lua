module("luci.controller.dailyreboot", package.seeall)

function index()
   if not nixio.fs.access("/etc/config/dailyreboot") then
      return
   end
   entry({"admin", "services", "dailyreboot"}, cbi("dailyreboot"), _("dailyreboot"))
end
