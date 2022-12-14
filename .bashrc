# get battery
battery=$(termux-battery-status 2>/dev/null | jq -r '.percentage' 2>/dev/null)
charge=$(termux-battery-status 2>/dev/null | jq -r '.status' 2>/dev/null)

if [[ "$battery" =~ ^-?[[:digit:]]+$ ]]; then
        if [[ "$charge" == "CHARGING" ]]; then
                icon=""

                if [[ "$battery" -gt 99 ]]; then
                        echo "ﮤ Unplug"
                else
                        echo "$icon $battery%"
                fi
        else
                if [[ "$battery" -gt 85 ]]; then
                        icon=""
                elif [[ "$battery" -gt 60 ]]; then
                        icon=""
                elif [[ "$battery" -gt 35 ]]; then
                        icon=""
                elif [[ "$battery" -gt 10 ]]; then
                        icon=""
                else
                        icon=""
                fi

                echo "$icon $battery%"
        fi
else
        echo " NA"
fi


GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"

PS1="$icon $battery% ${GREEN}bash${RESET}> "
