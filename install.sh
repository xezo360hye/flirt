#!/bin/bash

echo "P.S backup your .bashrc before you install flirt just in case."

PS3="Choose a version to install (extended contains blinking): "

select v in default extended; do
	case $v in
	default) mv flirt.sh	~/.flirt ;;
	extended) mv eflirt.sh	~/.flirt ;;
	*) continue ;;
	esac
	break
done

cd
rm -rf flirt

cat << EOF >> .bashrc

PROMPT_COMMAND="prompt=1"
trap 'cmd=\$BASH_COMMAND; \
[[ "\$prompt" && "\$cmd" != "\$PROMPT_COMMAND" ]] && \
~/.flirt; unset prompt' DEBUG
EOF

touch uninstall-flirt.sh
cat << EOF >> uninstall-flirt.sh

#!/bin/bash
PS3="Are you sure you want to uninstall flirt?: "
select choice in yes no; do
case $choice in
yes) rm .flirt ;;
no) exit

rm .bashrc
cat .bashrc
echo "Successfully uninstalled, thank you for using flirt. Have a nice morning/afternoon/night!"
		esac
	done
}
EOF

chmod +x .flirt

echo "Installation success, start bash again for the changes to take effect.\nif you need to uninstall it, run bash uninstall-flirt.sh"
