#!/bin/bash
figlet "Gitlab Installation script" | lolcat

echo ""
echo "Before anything, you need to check these :"
echo "1. Root login via ssh is enabled on the distant server"
echo "2. Root can log-in via your ssh public key on the distant server"
echo "3. atelier.local points to the ip of your server"
echo ""
read -p "Press y/n depending if your config is correct or not : " choice

case $choice in
  y)
  ;;

  n)
  echo "Configure your environnment according to the requirements."
  exit
  ;;

  *)
  echo "Not y or n, exiting"
  exit
  ;;
esac

echo ""
read -p "Enter the ip : " ip

echo -e "\nHost atelier \n  Hostname $ip \n  User root" >> ~/.ssh/config

ansible-playbook playbook.yml -i inventory

passwd=$(ssh atelier cat /etc/gitlab/initial_root_password | sed "s/#.*//g" | sed 's/Password\: //g' | sed '/^$/d')

echo -e "Installation Finished, here is the root password: \n
$passwd. \n
You have 24 hours to change it"
