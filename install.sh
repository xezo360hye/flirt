#!/bin/bash

PS3="Choose a version to install (extended contains blinking): "

select v in default extended; do
	case $v in
	default) mv flirt.sh	~/.flirt ;;
	extended) mv eflirt.sh	~/.flirt ;;
	*) continue ;;
	esac
	break
done

cd ..
rm -rf flirt

cat << EOF >> .bashrc

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
EOF

chmod +x .flirt
chmod +x .bashrc

echo "Installation success, start bash again for the changes to take effect"
