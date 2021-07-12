#!/bin/bash

#Creare Script Automatizare LVm

 # , Afisiare mesaj, creating a disk to convert to a logical volume will delete the data
clear
 echo -e "\033[32m !!!!!! Atentie !!!!!!\033[0m"
echo
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "Acest Script va converti intreg disk-ul in PV si va sterge toate datele de pe el!!!"
echo "Acest Script Va sterge Datele de pe el"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo

 read -p "Do you want to continue y/n?:" sure
 #Test whether the user input is y, if not, exit the script
[ $sure != y ] && exit

 #Prompt the user to enter relevant parameters (disk, volume group name, etc.) and test whether the user has entered these values. If there is no input, the script exits.
 read -p "Please enter a disk name such as /dev/vdb:" disk
 [ -z $disk ] && echo "No disk name entered" && exit
 read -p "Please enter the volume group name:" vg_name
 [ -z $vg_name ] && echo "No volume group name entered" && exit
 read -p "Please enter the logical volume name:" lv_name
 [ -z $lv_name ] && echo "No logical volume name entered" && exit
 read -p "Please enter the logical volume size:" lv_size
 [ -z $lv_size ] && echo "No logical volume size entered" && exit

 #Use the command to create a logical volume
pvcreate $disk
vgcreate $vg_name $disk
lvcreate -L ${lv_size}M -n ${lv_name} ${vg_name}
