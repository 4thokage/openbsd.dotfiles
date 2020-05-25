# Source profile
. $HOME/.profile

# Load Xresources
xrdb -merge $HOME/.config/Xresources

# Init X stuff
sxhkd &
remaps &
setbg &
#dwmblocks &
dunst &
xidle &
xcompmgr &
xset b off

#xset +fp $HOME/.config/fonts/ttf

# Thinkpad trackpoint scrolling dragging with middle mouse
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

exec bspwm

# TODO
# move more stuff to config
# check if can remove some stuff to make this faster
# check maybe for driver updates
# remove dwmblock and dwm
