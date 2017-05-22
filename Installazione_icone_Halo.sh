#!/bin/bash
# Installazione_icone_Halo
echo 'Ciao!'
echo 'Installa il Deb delle icone Halo e poi esegui questo semplicissimo script'
PS3='Se hai installato il Deb, digita 1 per proseguire con la sistemazione delle cartelle, altrimenti digita 2 per uscire dallo script: '
options=("SI" "NO")
select opt in "${options[@]}"
do
    case $opt in
		"SI")
			sudo cp -R -p /usr/share/icons/HaloIcons1.3/HALO /usr/share/icons/
			sudo cp -R -p /usr/share/icons/HaloIcons1.3/HALODARK /usr/share/icons/
			echo 'Bene, ora non ti resta che riavviare, avrai a disposizione le icone direttamente nel Control Center'
         ;;
		"NO")
	    echo 'Beh magari più tardi ci ripensi!'
		break
		;;
        *) echo invalid option;;
    esac
done