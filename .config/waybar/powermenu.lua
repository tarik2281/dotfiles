#!/usr/bin/lua
local opts = {
	{
		title = "\tShut down",
		exec = "systemctl poweroff",
	},
	{
		title = "\tReboot",
		exec = "systemctl reboot",
	},
	{
		title = "󰍃\tLog out",
		exec = "hyprctl dispatch exit",
	},
	{
		title = "\tLock",
		exec = "nwg-look",
	},
	{
		title = "\tSleep",
		exec = "systemctl suspend",
	},
	{
		title = "\tHibernate",
		exec = "systemctl hibernate",
	},
}

local options_string = ""
local length = 0
for _, v in ipairs(opts) do
	options_string = options_string .. v.title .. "\n"
	length = length + 1
end

options_string = options_string:sub(1, -2)

local f = assert(
	io.popen(
		"echo -e '"
			.. options_string
			.. "' | wofi --dmenu --insensitive --prompt 'Power Menu' --width 300 --height 336 -Ddmenu-print_line_num=true",
		"r"
	)
)

local selected = assert(f:read("n"))
f:close()
selected = selected + 1

local cmd = opts[selected].exec

os.execute(cmd)
