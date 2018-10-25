#!/bin/bash


# SUBMENU OF THINGS WE CAN DO WITH OUR ALREADY INSTALLED VAGRANT 
#  unfinished !!
submenu() {
	# Une fois mis en place, vous devrez pouvoir afficher toutes les Vagrant en cours d’utilisation sur le système et pouvoir interagir avec.
	echo "**********************************************"
	echo "*** 1 - afficher toutes les Vagrant **********" # VBoxManage list runningvms
	echo "*** 2 - afficher boxes              **********"
	echo "*** 3 - interagir dune autre maniere *********"
	echo "*** 4 - afficher tarari tarara Vagr **********"
	echo "*** 5 - stopper environement virtual *********"
	echo "*** Q - get me out of here !        **********"
	echo "**********************************************"
	read choice
	case $choice in
1) vagrant global-status
;;
2) vagrant box list
;;
3)
;;
5) vagrant halt
esac
}

#Vagrant installation #######
# working fine
vagrantins() {
	echo -e "\e[36mWe are now going to install Vagrant."
	sleep 1
	echo "But first let's check if it is ALREADY installed."
	sleep 1
	vagrant
	if [ "$?" -ne 127 ] 
	then
	echo -e "\e[32mIt is installed :)" #TO DO : color green
	else
	    echo -e "It is *NOT* installed :-O" #to do : color yellow
	fi
}

#VirtualBox question
#working fine
virtualboxQ() {
	echo -e "\e[36mDo you also want to install VirtualBox?"
	sleep 1
	echo "oui ou non?"
	read userinput
	case $userinput in
		[1oOyY]) echo "you have chosen to install VirtualBox"
		sleep 1
		vboxins
		;;
		[02nN]) echo -e "you have chosen NOT TO install VB. Ciao!\e[0m" #to do : color red
		;;
		*) echo -e "\e[33mXXXXX Please re-read the instructions and press a valid key next time. XXXXX"
	esac

}

#VirtualBox installation ###########
#needs improvement
vboxins() {
	echo -e "\e[32mWe are now going to install VirtualBox."
	sleep 1
	echo "But first, let's check if it is ALREADY installed."
	sleep 1
	echo $(VBoxManage showvminfo) 
	#command pour vérifier si virtualbox est déjà installé ##################
}

#CREATE VAGRANTFILE
#unfinished
createvagrantfile() {
	# permettre de créer un Vagrantfile automatiquement ou avec des input client,
	# pour que ce soit plus simple, simplement proposer un choix du nom du dossier synchro local et le nom du dossier synchro distant.

	vagrant init ubuntu/xenial64
	echo "choissisez un nom de dossier synchro local et le nom du dossier synchro distant"
	sleep 1
	echo "local : "
	read localfname
	echo "distant : "
	read remotefname

	mkdir $localfname

	echo "\e[35m***Done, what do you want to do now?***"
	# to do: change/add line in vagrantfile

	submenu
}


#Menu principal ########
echo -e "\e[36mBjr, souhaitez-vous installer Vagrant ?"
echo "*************"
echo "*** 1: Oui **"
echo "*** 2: Non **"
echo "*************"
read answer

case $answer in
	[1oOyY]) echo -e "\e[32myou have chosen to install Vagrant."
sleep 1
vagrantins
virtualboxQ
	;;
	[2nN]) echo -e "you have chosen NOT to install Vagrant.\e[0m"
	submenu
	;;
	*) echo -e "\e[33mXXXXX Please re-read the instructions and press a valid key next time. Bye bye! XXXXX\e[0m"
	;;
esac




# ------------- Commandes pour Vagrant : -----------

# Initialiser le fichier de configuration de notre vagrant : vagrant init   ===> Cela crée un Vagrantfile que l'on va pouvoir configurer.

# Lignes à modifier dans le Vagrantfile :
# - config.vm.box = "base" en config.vm.box = "ubuntu/xenial64"
# - Décocher la ligne suivante : config.vm.network "private_network", ip: "192.168.33.10"
# - Décocher la ligne suivante :   config.vm.synced_folder "../data", "/vagrant_data" et remplacer par : 
# 		config.vm.synced_folder "./data", "/var/www/html"


