#!/bin/bash
# This file is part of the https://gist.github.com/Maxximo88
# Copyright (c) 2017 Carofano Massimo Antonio
# 
# This program is free software: you can redistribute it and/or modify  
# it under the terms of the GNU General Public License as published by  
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but 
# WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License 
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
echo -e "\e[1;34m=====================================\e[0m"
echo -e "\e[1;34mVerifico la tua Distribuzione Linux..\e[0m"
echo -e "\e[1;34m=====================================\e[0m"
DISTRO=$(lsb_release -i | cut -f 2-)
if [ $DISTRO == "Deepin" ]; then
	echo "Ok stai usando $DISTRO, procediamo.."
	echo ''
else
	echo -e "\e[1;31mQuesto script non è compatibile con la tua distribuzione Linux ($DISTRO)\e[0m"
	exit
fi
echo 'La guida testuale è disponibile su Caroblog.it'
echo -e "\e[1;31mIn questo momento, il consiglio è quello di aggiungere i Repo di Debian Stretch!\e[0m"
echo ''
PS3='Cosa desideri fare? '
options=("Aggiungi i Repo di Debian Stretch" "Installa tutti i software consigliati" "Ampliamento funzionalità terminale" "Fonts aggiuntivi" "Flash Player" "Multimedia" "Libre Office" "Gimp" "Natron" "Lightworks" "RawTherapee" "Blue Fish" "Inkscape" "Blender" "OpenSCAD" "Krita" "gDebi" "Synaptic" "Evince" "Bleachbit" "Open JDK8" "VLC Media Player" "Gestore pacchetti Snap" "iFuse per supporto Apple iPhone/iPad/iPod" "Neofetch" "Fonts Google Roboto" "Pulizia Distro" "Elimina i Repo aggiuntivi" "Termina")
select opt in "${options[@]}"
do
	case $opt in
		"Aggiungi i Repo di Debian Stretch")
			echo ''
			echo -e "\e[1;31mOra creerò un Sources.list.d aggiuntivo al primario, così da gestire i repo senza intaccare quello originale di Deepin\e[0m"
			echo ''
			cd $HOME &
			sudo cp /etc/apt/sources.list /etc/apt/sources.list.d/sources.list
			sudo bash -c 'cat << EOF > /etc/apt/sources.list.d/sources.list
## Repo Debian Stretch
deb http://deb.debian.org/debian/ stable main contrib non-free
deb http://deb.debian.org/debian/ stable-updates main contrib non-free
deb http://deb.debian.org/debian-security stable/updates main
deb http://ftp.debian.org/debian stretch-backports main
EOF'
			echo -e "\e[1;31mFile creato, vediamo di controllare eventuali aggiornamenti!\e[0m"
			sudo apt update
			echo ''
			echo 'I Repo di Debian Stretch sono stati aggiunti, puoi proseguire!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
			;;
		"Installa tutti i software consigliati")
			sudo apt install -y wget software-properties-common apt-transport-https dirmngr ttf-mscorefonts-installer flashplugin-nonfree libdvd-pkg libdvdread4 python3 libreoffice libreoffice-gtk2 libreoffice-style-sifr libreoffice-l10n-it gimp natron lightworks rawtherapee bluefish inkscape blender openscad krita gdebi synaptic evince ifuse bleachbit openjdk-8-jre icedtea-8-plugin vlc snapd
			sudo dpkg-reconfigure libdvd-pkg foxitreader
			sudo apt install -f
			sudo apt --purge autoremove
			sudo apt autoclean
			sudo apt clean
			sudo apt -y install deborphan
			sudo apt --purge remove `deborphan`
			sudo apt --purge remove `deborphan --libdev`
			sudo apt install curl libcurl3 php5-curl
			echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
			curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key
			sudo apt update
			sudo apt install neofetch
			neofetch
			mkdir -p $HOME/roboto-src cd $HOME/roboto-src
			git clone https://github.com/google/roboto.git
			pip install --user virtualenv virtualenv roboto-env source roboto-env/bin/activate
			cd roboto pip install -r requirements.txt
			cd roboto make
			echo ''
			echo 'Beh, carino Neofetch eh? Ad ogni modo, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Ampliamento funzionalità terminale")
			sudo apt install -y wget software-properties-common && sudo apt install dirmngr
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Fonts aggiuntivi")
			sudo apt install -y ttf-mscorefonts-installer
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Flash Player")
			sudo apt install -y flashplugin-nonfree
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Multimedia")
			sudo apt install -y libdvd-pkg libdvdread4 python3 && sudo dpkg-reconfigure libdvd-pkg
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Libre Office")
			sudo apt install -y libreoffice libreoffice-style-sifr libreoffice-gtk2 libreoffice-l10n-it
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Gimp")
			sudo apt install -y gimp
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Natron")
			sudo apt install -y natron
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Lightworks")
			sudo apt install -y lightworks
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"RawTherapee")
		sudo apt install -y rawtherapee
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Blue Fish")
			sudo apt install -y bluefish
				echo ''
				echo 'Beh, proseguiamo!'
				echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Inkscape")
			sudo apt install -y inkscape
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Blender")
			sudo apt install -y blender
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"OpenSCAD")
			sudo apt install -y openscad
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Krita")
			sudo apt install -y krita
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"gDebi")
			sudo apt install -y gdebi
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Synaptic")
			sudo apt install -y synaptic
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Evince")
			sudo apt install -y evince
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Bleachbit")
			sudo apt install bleachbit -y
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Open JDK8")
			sudo apt install openjdk-8-jre icedtea-8-plugin -y
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		 "VLC Media Player")
		 	sudo apt install vlc -y
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Gestore pacchetti Snap")
			sudo apt install -y snapd
			sudo snap install hello
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"iFuse per supporto Apple iPhone/iPad/iPod")
			sudo apt install -y ifuse
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Neofetch")
			sudo apt install curl libcurl3 php5-curl
			echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
			curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key
			sudo apt update
			sudo apt install neofetch
			neofetch
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Fonts Google Roboto")
			mkdir -p $HOME/roboto-src cd $HOME/roboto-src
			git clone https://github.com/google/roboto.git
			pip install --user virtualenv virtualenv roboto-env source roboto-env/bin/activate
			cd roboto pip install -r requirements.txt
			cd roboto make
			echo ''
			echo 'Beh, proseguiamo!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Pulizia Distro")
			echo ''
			echo 'Inizio col verificare i pacchetti difettosi'
			echo ''
			sudo apt install -f
			echo ''
			echo 'Proseguo eliminando le dipendenze inutili'
			echo ''
			sudo apt --purge autoremove
			echo ''
			echo 'Verifico ed elimino i pacchetti obsoleti'
			echo ''
			sudo apt autoclean
			echo ''
			echo 'Rimuovo i pacchetti scaricati oramai inutili'
			echo ''
			sudo apt clean
			echo ''
			echo 'Verifico la presenza di Deborphan, nel caso installandolo, per eliminare le librerie orfane'
			echo ''
			sudo apt -y install deborphan
			sudo apt --purge remove `deborphan`
			echo ''
			echo 'Elimino ora le librerie orfane relative allo sviluppo)'
			echo ''
			sudo apt --purge remove `deborphan --libdev`
			echo ''
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Elimina i Repo aggiuntivi")
			echo ''
			echo -e "\e[1;31mOra eliminerò il Sources.list.d\e[0m"
			echo ''
			cd $HOME &
			sudo rm /etc/apt/sources.list.d/sources.list
			echo -e "\e[1;31mFile eliminati, diamo un piccolo aggiornamento dei Repo ora però!\e[0m"          
			sudo apt update
			echo ''
			echo 'Ora che hai eliminato i Repo aggiuntivi, non ti resta che proseguire!'
			echo -e "\e[1;31mTi ricordo le opzioni: 1.Aggiungi i Repo di Debian Stretch; 2.Installa tutti i software consigliati; 3.Ampliamento funzionalità terminale; 4.Fonts aggiuntivi; 5.Flash Player; 6.Multimedia; 7.Libre Office; 8.Gimp; 9.Natron; 10.Lightworks; 11.RawTherapee; 12.Blue Fish; 13.Inkscape; 14.Blender; 15.OpenSCAD; 16. Krita; 17.gDebi; 18.Synaptic; 19.Evince; 20.Bleachbit; 21.Open JDK8; 22.VLC Media Player; 23.Gestore pacchetti Snap; 24.iFuse per supporto Apple iPhone/iPad/iPod; 25.Neofetch; 26.Fonts Google Roboto; 27.Pulizia Distro; 28.ipristina il Source.List col Mirror originale; 29.Termina\e[0m"
		;;
		"Termina")
			echo 'Beh, spero che questo script sia stato apprezzato...Alla prossima!'
			break
		;;
		*) echo invalid option;;
	esac
done
