#!/usr/bin/env bash

#This should work.....in theory....animus...KeepTrying...lol


packageFunction() {

	echo -e "What is the package manager of your distro???\nSelect an option number\n> "
	declare -a packageManager=(apt yum pacman)
	select nopt in ${packageManager[*]}; do
		if [[ "$nopt" = "${packageManager[0]}" ]]; then
			pkgm="${packageManager[0]}"; printf "\n"; main
		elif [[  "$nopt" = " ${packageManager[1]}" ]]; then
			pkgm="${packageManager[1]}"; printf "\n"; main
		elif [[  "$nopt" = " ${packageManager[2]}" ]]; then
            pkgm="pacman -Sy && pacman -S"; printf "\n"; main
        else
        	packageFunction
        fi
	done

}


main() {

	declare -a options=(Install_and_configure Restore_bashrc_Archive configure_the_default_bashrc exit)
	select opt in ${options[*]}; do
		if [[ "$opt" = "${options[0]}" ]]; then
			printf "\n\nThis option will install all binaries necessaries to make work all the functions\n in the .bashrc archive also it gonna configure some things \n Let's see if you're brave choose an Yes or No if you want to continue:\n"
			declare -a yesNo=(Yes No)
			select topt in "${yesNo[@]}"; do
				if  [[ "$topt" = "${yesNo[0]}" ]];  then
					[[ "apt" =~ "$pkgm" ]] || [[ "yum" =~ "$pkgm" ]] && sudo $pkgm update && sudo $pkgm upgrade -y && sudo $pkgm install -y toilet golang snapd; sudo snap install taskbook; [[ "pacman" =~ "${pkgm[0]}" ]] && eval "$(echo ${pkgm[*]}) toilet golang snapd"; go get -u github.com/jingweno/ccat; [[ -a $HOME/.bashrc ]] &&  mkdir $HOME/bashrcBackUp && mv $HOME/.bashrc $HOME/bashrcBackUp/;cp $(dirname $(realpath $0))/bashrc $HOME/.bashrc; wget -P $HOME https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/LS_COLORS; cat  $(dirname $(realpath $0))/data.txt >>  $HOME/.bashrc; sed -i 's/#declare/declare/g;s/##alias/alias/g;s/\#\*\#/alias tb='taskbook'/' $HOME/.bashrc; [[ ! -d ~/.simpleBashrcData ]] && mkdir $HOME/.simpleBashrcData && cp $(dirname $(readlink -f $BASH_SOURCE))/{oneLiners.md,animus.txt,error.txt} $HOME/.simpleBashrcData/; echo -e "\nWell done animus, NeverGiveUp, something else??\n"; main	

 				elif  [[ "$topt" = "${yesNo[1]}" ]];  then
 					echo -e "Ok animus select an option number\n\n"
 					main

				else
					main


				fi
				
			done

		elif [[ "$opt" = "${options[1]}" ]]; then
			echo -e "\n\nOk let's to restore your default .bashrc file\n\n"
			cp $HOME/bashrcBackup/.bashrc $HOME/.bashrc
			echo -e "\n\nOk file restored just type in your shell:\nsource $HOME/.bashrc\n\nanimus\n\n"
			main
		elif [[ "$opt" = "${options[2]}" ]]; then
			cp $(dirname $(readlink -f $0))/bashrc $HOME/.bashrc
			printf "Ok animus....A default bashrc archive was configure use the command:\nsource .bashrc \n This command is for get the changes or re open your terminal"
			main
			
		elif [[ "$opt" = "${options[3]}" ]]; then
	    	echo -e "\n\nOk Good Bye....Animus, Never Give up, trust me ....NEVER GIVE UP....Skate"
	    	exit; return 0

	    else
	    		main
	    	
	    fi

	done

}

packageFunction
