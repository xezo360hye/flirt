#!/bin/bash
(
color=( 31 "1;31" 33 "1;33" "1;34" "1;35" "1;36" )
text=( "It shall be done, comrade"
"As you wish, honey :3"
"Executing, my love"
"I'll do that for you, sweetheart" )

sel_color="\e[${color[$RANDOM % ${#color[@]}]}m"
sel_text="~ ${text[$RANDOM % ${#text[@]}]}"
reset="\e[0m\n"

echo -e "${sel_color}${sel_text}${reset}"
)
