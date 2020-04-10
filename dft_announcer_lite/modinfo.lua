name = "Don't Fight Together Announcer Lite"
version = "2019"
description = "Version:"..version..", 20th August 2050.\n\nDon't Fight Together Announcer Lite for DFT EU."
author = "Kova"


api_version = 10

icon_atlas = "atlas.xml"
icon = "icon.tex"

dst_compatible = true

client_only_mod = false
all_clients_require_mod = false

server_filter_tags = {"Announce Important Cooperative Actions", "Cooperative Announcer"}

configuration_options ={
	{
		name = "debug",
		label = "Debugging mode?",
		options = {
						{description = "Enabled", data = true},
						{description = "Disabled", data = false},
					},
		default = false,
		hover = "",
	},
}
