#!/bin/bash

mkdir /root/bashrc_backup

cp /root/.bashrc /root/bashrc_backup

mv uninstall-flirt.sh /root/uninstall-flirt.sh

echo "P.S we have backed up your bashrc, which is stored in bashrc_backup, because uninstalling flirt will delete bashrc that's currently in the root directory."

PS3="Choose a version to install (extended contains blinking): "

select v in default extended; do
	case $v in
	default) mv flirt.sh	~/.flirt ;;
	extended) mv eflirt.sh	~/.flirt ;;
        exit) exit ;;
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

chmod +x .flirt

echo "Installation success, start bash again for the changes to take effect. if you need to uninstall it, run bash uninstall-flirt.sh"
