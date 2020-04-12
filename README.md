# Don't Fight Together Announcer Lite version
This mod extends the Don't Starve Together logs with adding information about the current day, phase and the list of players. 
The mod is server side only mod. 
Thus, players do not require downloading this mod.

# Install 
Copy this mod (folder `dft_announcer_lite`) into the folder named `mods` in `dst_dedicated_server`.
For example: `~/gamedir/dontstarvetogether_dedicated_server/mods` 

Change the server mod settings in `modoverrides.lua` in the Master and in the Caves folder. 
Add there this part of code into the table that is returned
```
  dft_announcer_lite={
    configuration_options={
      debug=false,
    },
    enabled=true
  },
```
Restart the server.
If you want to be sure you have installed the mod correctly, set `debug=true` The server should announce the phase change *day*, *dusk*, or *night* after that. 

# Discord bot
See: https://github.com/IamFlea/Deerclops-Lite
