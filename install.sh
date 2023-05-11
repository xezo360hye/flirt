#!/bin/bash

cp "$HOME/.bashrc" "$HOME/.bashrc_backup"

echo "We have backed up your .bashrc and stored in the .bashrc_backup file, because uninstalling flirt will delete .bashrc that's currently in the $HOME directory"

PS3="Choose a version to install (extended contains blinking): "
select v in default extended; do
	case $v in
        default)  mv  flirt.sh	~/.flirt ;;
        extended) mv eflirt.sh	~/.flirt ;;
        exit) exit ;;
        *) continue ;;
	esac
	break
done

cat << EOF >> "$HOME/.bashrc"

PROMPT_COMMAND="prompt=1"
trap 'cmd=\$BASH_COMMAND; \
[[ "\$prompt" && "\$cmd" != "\$PROMPT_COMMAND" ]] && \
~/.flirt; unset prompt' DEBUG
EOF

echo "Installation success, start bash again for the changes to take effect"
echo "If you need to uninstall it, run ./uninstall-flirt.sh"
