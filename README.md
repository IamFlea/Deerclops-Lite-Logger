# Don't Fight Together Announcer Lite version
This mod extends the Don't Starve Together logs with adding information about the current day, phase and the list of players. 
The mod is server side only mod. 
Thus, players do not require downloading this mod.

# Install 
Copy this mod (folder `dft_announcer_lite`) into the folder with other mods. For example: `~/gamedir/dontstarvetogether_dedicated_server/mods` The mod folder is specific with lots of `workshop-123456789` and you also set which mods will be downloaded there in `dedicated_server_mods_setup.lua`. 

Change server mod settings in `modoverrides.lua` in the Master and in the Caves folder. 
Add there this part of code into the table that is returned
```
  dft_announcer_lite={
    configuration_options={
      debug=true,
    },
    enabled=true
  },
```

# Discord bot
See: https://github.com/IamFlea/Deerclops-Lite
