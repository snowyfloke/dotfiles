# Instructions for installing the dotfiles:

## 1- Clone this Repo
Run on your terminal:

`git clone https://github.com/snowyfloke/dotfiles && cd dotfiles`

Verify that the contents match (specifically if the folders "config", "assets" and "scripts" are there.
## 2- Run the Script
Type `./install.sh` in your terminal
## 3- Reboot Your Computer and select Hyprland
If you're on GDM (GNOME), click the little settings icon after you selected your account (don't login yet!), and select the option called "Hyprland"

If you're on another display manager (SDDM for example), search for the option to change your desktop, and select Hyprland!
## 4- Configure Things!
My dotfiles should be all ready for use, but it's still recommended to at least take a look at your config options!
### Noctalia Shell:
This is the easiest, all you need to do is right-click the top bar and click on the settings icon (or use SUPER+,), then you can configure all sorts of things like colors, wallpapers, schedulling, plugins and etc!
### Hyprland:
This is for more advanced users. Use this option only if you know what you're doing, or have a video-guide! My configs are laid like so:
#### ~/.config/hypr/hyprland.conf
Main config file, use it to set general things up, and add new modules!
#### ~/.config/hypr/modules/appearence.conf
Set appearence settings here!
#### ~/.config/input.conf
Set up input settings like mouse options, keyboard layout, touchpad settings, and most importantly: KEYBINDINGS!!!!!
###### For keybindings use the following format: `bind = $mod, KEY, action, #"Description"` this is important so the keybindings plugin can correctly display your keybindings!
#### ~/.config/hypr/modules/monitors.conf
As I use a laptop, this config isn't included, otherwise it would break desktop systems. However, I strongly advice you to create one and set your monitor settings there, as Hyprland's default settings are really bad.
#### ~/.config/hypr/modules/programs.conf
Set your default programs here! This way, you can easily assign keybindings for them later without needing to worry about memorizing init flags or flatpak command names (they suck lol)
### Starship:
#### ~/.config/starship-preset.toml
Change this file to apply changes after switching from dark mode or changing wallpapers via noctalia. If you're interested in how the starship theme switching via Noctalia works, it's located in `~/scripts/starship.sh`!
#### ~/.config/starship.toml
This is the final starship theme. Any changes made here WILL BE OVERWRITTEN BY THE COLOUR CHANGING SCRIPT!!!!!
### NeoVIM:
I honestly don't have any idea of how to configure it. Everything you'll see inside it is either made via Lazy-Vim, or via Claude Code (such as the snowy theme)
### Kitty:
#### ~/.config/kitty/kitty.conf
This is kitty's config, feel free to change it as you wish!
###### Note: Noctalia overrides the end of the file after each colour change.
