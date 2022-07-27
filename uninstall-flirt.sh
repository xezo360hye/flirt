#!/bin/bash
PS3="Are you sure you want to uninstall flirt?: "
select choice in yes no; do
case $choice in
yes) rm .flirt ;;
no) exit
      esac
      break
done

rm .bashrc
echo "Successfully uninstalled, thank you for using flirt. Have a nice morning/afternoon/night!"
