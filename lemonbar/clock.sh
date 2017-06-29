#!/bin/sh
# Dylan's Lemonbar Clock
# Very heavily modified by APIUM

battery () {
    battery="$(</sys/class/power_supply/BAT0/capacity)"
    charging="$(</sys/class/power_supply/BAT0/status)"

    case "$battery" in
        [0-9]|10)
            battery="${battery}%  "
        ;;

        1[0-9]|2[0-5])
            battery="${battery}%  "
        ;;

        2[6-9]|3[0-9]|4[0-9]|50)
            battery="${battery}%  "
        ;;

        5[1-9]|6[0-9]|7[0-5])
            battery="${battery}%  "
        ;;

        7[6-9]|8[0-9]|9[0-9]|100)
            battery="${battery}%  "
        ;;
    esac

    [ "$charging" == "Charging" ] && \
        battery="Charging  $battery"

    printf "%s" "$battery"
}

batttime(){
    calc(){ printf "%.2f\n" `echo $@ |bc -l`;}
    charge(){ cat /sys/class/power_supply/BAT0/charge_now;}
    current(){ cat /sys/class/power_supply/BAT0/current_now;}
    full(){ cat /sys/class/power_supply/BAT0/charge_full;}
    charging="$(</sys/class/power_supply/BAT0/status)"

    # echo $(current) / $(charge) | bc -l
    if [ "$charging" == "Charging" ]
        then
            calc "($(full) - $(charge)) / $(current)"
        else
            calc $(charge) / $(current)
    fi
}

# aim is to read the time over a 10s period, then average it out over that
# period and only then output the time remaining.
# I have no idea how to do this so this will remain a copy of above until
# I can use bash...


wifi(){
    ssid="$(iwgetid -r)"
    ping -c 1 google.com >/dev/null 2>&1 && echo "    Connected to "$ssid  || echo "   Disconnected"
}

sound(){

    amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq

}

while :; do
   echo "%{l}$(wifi)    |    Volume: $(sound)% %{c}$(date "+%a %d %b %l:%M %p")%{r}$(battery)     |     $(batttime) Hours     %{r}"
# try to get it to hide of mpv fullscreen
    if [ -z "$WINDOWID" ] ; then
    WINDOWID=$(xdotool search --name bar)
    if [ ! -z "$WINDOWID" ] ; then
        xprop -id $WINDOWID -f _NET_WM_STATE 32a -set _NET_WM_STATE _NET_WM_STATE_STICKY,_NET_WM_STATE_BELOW
        xprop -id $WINDOWID -f _NET_WM_WINDOW_TYPE 32a -set _NET_WM_WINDOW_TYPE _NET_WM_WINDOW_TYPE_NORMAL
        fi
    fi
    sleep 2s
done |

lemonbar -d -b -g "1200x20+550+0" -f "roboto:size=8" -o 0 -f "fontawesome:size=8" -o 0 -B "#FCFCFC" -F "#2E2E2E" & lemonbar -g 2800x80 -B{#AAFFFFFF} -b
