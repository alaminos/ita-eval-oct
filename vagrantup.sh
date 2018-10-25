#!/bin/bash
# mettre en place une installation complète de Vagrant et Virtualbox sur un poste sous linux. 
# vérifier si Vagrant et Virtualbox sont installés. Si tel est le cas, vous mettez un message comme quoi ces logiciels sont déjà installés.

# permettre de créer un Vagrantfile automatiquement ou avec des input client,
# pour que ce soit plus simple, simplement proposer un choix du nom du dossier synchro local et le nom du dossier synchro distant.

# Une fois mis en place, vous devrez pouvoir afficher toutes les Vagrant en cours d’utilisation sur le système et pouvoir interagir avec.



# Un guide utilisateur devra permettre d’utiliser l’application sans connaissance préalable. 

# La validation se fera sur le fonctionnement du script, la qualité de la documentation fournie et la réutilisation des notions étudiées en formation. 
# Le script devra être fourni via GIT et envoyé par mail 
# à l’adresse a.corrot@it-akademy.fr avec comme objet : NOM + PRENOM + SESSION + Linux


#test area
#COLOR CODES
# OK \e[32m
# NORMAL \e[36m
# WARNING \e[33m

#Vagrant installation #######
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
vboxins() {
	echo -e "\e[32mWe are now going to install VirtualBox."
	sleep 1
	echo "But first, let's check if it is ALREADY installed."
	sleep 1
	echo $(VBoxManage showvminfo) 
	#command pour vérifier si virtualbox est déjà installé ##################
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
	;;
	*) echo -e "\e[33mXXXXX Please re-read the instructions and press a valid key next time.XXXXX"
esac

#CREATE VAGRANTFILE
createvagrantfile() {
	# permettre de créer un Vagrantfile automatiquement ou avec des input client,
	# pour que ce soit plus simple, simplement proposer un choix du nom du dossier synchro local et le nom du dossier synchro distant.

	vagrant init
	echo "choissisez un nom de dossier synchro local et le nom du dossier synchro distant"
	sleep 1
	echo "local : "
	read localfname
	echo "distant : "
	read remotefname

	mkdir $localfname

	echo "\e[35m***Done, what do you want to do now?***"
	# Une fois mis en place, vous devrez pouvoir afficher toutes les Vagrant en cours d’utilisation sur le système et pouvoir interagir avec.
	echo "**********************************************"
	echo "*** 1 - afficher toutes les Vagrant **********"
	echo "*** 2 - afficher toutes les Vagrant **********"
	echo "*** 3 - afficher toutes les Vagrant **********"
	echo "*** 4 - afficher tarari tarara Vagr **********"
	echo "**********************************************"

}


#### Virtualisation ####
			
# ------------- Logiciels nécéssaires : -----------

# - Virtualbox : Permet de gérer les environnements virtuels créés avec Vagrant. L'un ne va	pas sans l'autre.
# - Vagrant : Permet de créer des environnements virtuels/ les éteindre, supprimer, etc. L'un ne va pas sans l'autre.

# ------------- Commandes pour Vagrant : -----------

# Initialiser le fichier de configuration de notre vagrant : vagrant init   ===> Cela crée un Vagrantfile que l'on va pouvoir configurer.

# Lignes à modifier dans le Vagrantfile :
# - config.vm.box = "base" en config.vm.box = "ubuntu/xenial64"
# - Décocher la ligne suivante : config.vm.network "private_network", ip: "192.168.33.10"
# - Décocher la ligne suivante :   config.vm.synced_folder "../data", "/vagrant_data" et remplacer par : 
# 		config.vm.synced_folder "./data", "/var/www/html"

# Après modification du Vagrant file...
# Démarrer notre environnement virtuel :
# - vagrant up ===> Va télécharger la box et ses composants

# Stopper notre environnement virtuel :
# - vagrant halt

# Entrer dans notre VM :
# - vagrant ssh

# ----- EN SSH -----
# Mise à jour des paquets : sudo apt update
# Installer un paquet : sudo apt install nomDuPaquet ==> exemple : sudo apt install apache2
# Désinstaller un paquet : sudo apt remove nomDuPaquet

#TO DO
# at the end of every block, set color to default -- code 0
# improve way vagrant installation is checked