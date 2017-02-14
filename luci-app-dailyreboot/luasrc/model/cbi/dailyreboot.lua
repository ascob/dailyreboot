m = Map("dailyreboot")

s = m:section(NamedSection, "dailyreboot", "dailyreboot", "Configuration", "Configuration and stuff...")

enabled = s:option(Flag, "enabled", "enabled", "Enable dailyreboot")
enabled.rmempty = false
enabled.default = true

device_tty = s:option(Value, "time", "time", "The reboot time")
device_tty.datatype = "string"
device_tty.default = "03:00"

mqtt_host = s:option(Value, "offset", "offset", "Random offset in minutes to reboot time.")
mqtt_host.datatype = "string"
mqtt_host.default = "50"


return m

