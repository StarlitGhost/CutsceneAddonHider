# Cutscene Addon Hider

Hides other Windower 4 addons/plugins when you enter a cutscene in FFXI, showing them again afterwards.

Currently it hides/shows the FFXIDB minimap and WeatherMon's weather icon, but I intend to make the commands it runs to do that part of a config file.

Originally this was part of [MapTile](https://github.com/StarlitGhost/MapTile/), but that felt a bit jank so I pulled it out.

## How to install:
1. Download the repository [here](https://github.com/StarlitGhost/CutsceneAddonHider/archive/refs/heads/master.zip)
2. Extract and place in `Windower/addons/CutsceneAddonHider`

## How to make it load automatically:
1. Open `Windower/scripts/init.txt` (create it if it doesn't exist)
2. Add the line `lua l cutsceneaddonhider` to the end of it

## How to manually enable in-game:
1. Login to your character in FFXI
2. Type `//lua l cutsceneaddonhider` in chat
