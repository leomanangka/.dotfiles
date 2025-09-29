#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# SWAY
#if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
#    exec sway
#fi

# HYPRLAND
if uwsm check may-start; then
  exec uwsm start hyprland-uwsm.desktop
fi
