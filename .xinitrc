!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

syndaemon -i 0.3 -d
setxkbmap -option caps:escape
setxkbmap -option compose:ralt
xmodmap -e "keysym 0xffea = Multi_key"
xinput --set-prop 12 295 0.8
xset r rate 350 40
xrandr --dpi 96
feh --bg-tile $HOME/Pictures/papes/patterns/pattern_125.gif
compton --config $HOME/.config/compton/config &
statusbar &
notifydaemon &
redshift &
xbindkeys -f $HOME/.config/xbindkeys/config
mpd $HOME/.config/mpd/mpd.conf
pactl set-sink-volume 0 50%

exec dwm
