#!/bin/bash

cat << EOF
!WARNING!
This will overwrite your .bashrc with the backup made while installing flirt
All changes made after that WILL NOT BE SAVED!
Consider manual editing if you need something else
EOF

read -p "Are you sure you want to uninstall flirt [y/N]? "
case "$REPLY" in
    y|Y)
        rm "$HOME/.flirt"
        mv "$HOME/.bashrc_backup" "$HOME/.bashrc"
        ;;
esac

echo "Successfully uninstalled, thank you for using flirt. Have a nice morning/afternoon/night!"
