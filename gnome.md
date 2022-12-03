## Gnome

# Change alt-tab
# https://superuser.com/questions/394376/how-to-prevent-gnome-shells-alttab-from-grouping-windows-from-similar-apps
#
# wmctrl -a $(wmctrl -l | grep -e "@.*: " | cut -c 20-)
# https://askubuntu.com/questions/441395/keyboard-shortcut-to-focus-on-idle-terminal
dconf dump /org/gnome/desktop/wm/keybindings/

dconf write /org/gnome/desktop/wm/keybindings/switch-windows "['<ALT>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications "['<Super>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications-backward "['<Shift><Super>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-windows-backward "['<Shift><Alt>Tab']"


# Disable bell
# from https://gitlab.gnome.org/GNOME/console/-/issues/147#note_1548960

gsettings set org.gnome.desktop.wm.preferences audible-bell false
