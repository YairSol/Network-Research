#!/bin/bash
#-------------------------------------------------------------------------------------Network Research Project---------------------------------------------------------------------------------------------------
#Checking if you are "root"
echo "--------------------------Network Research Project-------------------------" | lolcat -a -d 50
echo ""


if [ "$(whoami)" != "root" ] 
then
    echo "You are not root! connecting as root" | lolcat
    sudo su 
	exit
fi
	

#function to install applications
function INST()
{	if	[ -d "/etc/ssh"	]
	then 
		echo "ssh already installed	" | lolcat
	else
		echo "installing ssh" | lolcat
	 apt-get install ssh 1>/dev/null
	fi
	
	 apt-get install sshpass 1>/dev/null
	 
	 if [ -d "/usr/share/GeoIP"	]
	 then
		echo ""
		echo "	geoip already installed	" | lolcat
		echo ""
	 else	
		echo""
	    echo "installing geoip" | lolcat
	    apt-get install geoip-bin 1>/dev/null
	    echo""
	 fi
	 if	[	-d "/usr/share/figlet" ]
	 then
		echo "		figlet already installed" | lolcat
	 else
		echo "installing figlet" | lolcat
		apt-get install figlet 1>/dev/null
		echo ""
 	 fi	
	 
	 if [ -d "/home/kali/nipe" ]
	 then
		echo""
		echo "			nipe already installed   	  " | lolcat
		echo""
		echo""
	else
		echo "                 connecting to nipe mode                 " 	
		git clone https://github.com/htrgouvea/nipe && cd nipe 1>/dev/null
	 
		cpan install Try::Tiny Config::Simple JSON 1>/dev/null
	 
		perl nipe.pl install 1>/dev/null
		
	
	 fi

}	

#~ #function to check if you are anonymous

function ANON()
{
EXTIP=$(curl -s ifconfig.co)

CNT=$(geoiplookup $EXTIP | awk '{print $4}' | sed 's/,//g')

if	[ "$CNT" != "IL" ]
then
	echo "⠀⠀⠀⠀⠀⠀⠀⠀           ⣴⣾⠿⠿⠿⠿⠿⠿⠿⠿⢷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠁⠀⠀⠀⠀⠀⣀⣠⣤⣶⣶⣶⣶⣶⣶⣤⣄⣀⠀⠀⠀⠀⠀⠀⢿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣏⠀⠀⣤⣴⣾⣿⠿⠛⠉⠁⠀⠀⠀⠀⠀⠉⠛⠻⢿⣷⣶⣤⡄⠀⢸⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣆⠀⠉⠉⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠈⠉⠁⢠⣾⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣼⣿⣧⡀⠀⢻⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⣰⣿⣿⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣰⣾⠟⠛⠋⠉⠈⢻⣷⡄⠘⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⠏⢀⣼⡿⠁⠉⠉⠛⠻⢿⣦⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣰⣿⠃⠀⣀⣀⣀⣀⣀⣹⣿⣆⣈⣿⣷⣦⣄⣀⣀⣀⣀⣠⣤⣾⣿⣋⣠⣾⣟⣀⣀⣀⣀⣀⡀⠈⢿⣧⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⣿⠃⢰⣿⠟⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⣿⡇⠈⢿⣆⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⣿⠏⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠘⣿⣆⠀⠀⠀⠀
⠀⠀⠀⢠⣿⡟⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣶⠿⠿⣷⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠸⣿⣆⠀⠀⠀
⠀⠀⢀⣾⡟⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⡟⠉⠀⠀⠀⠀⠈⠻⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠹⣿⡄⠀⠀
⠀⢀⣾⡟⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡏⠀⣴⣄⠀⠀⣠⣤⡄⠸⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠹⣿⡄⠀
⠀⣼⡟⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣇⠀⠈⠻⠇⠐⠿⠋⠀⢠⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠹⣷⡀
⢸⣿⠁⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⣷⣦⡄⠀⠀⠀⣤⣶⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⣿⡧
⠈⠻⣷⣦⡀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣷⣤⣤⣴⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⢀⣠⣾⡿⠃
⠀⠀⠈⠙⢿⣷⣄⡀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⣠⣴⡿⠛⠁⠀⠀
⠀⠀⠀⠀⠀⠈⠻⢿⣾⣿⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⠀⠀⢀⣀⣀⣀⣿⣿⣿⠟⠉⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠀⠀⠘⠛⠛⠛⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣿⠇⠀⠀" | lolcat
	echo ""
	echo "                you are anonymous        " | lolcat -a -d 60
	echo ""
else
	echo "=================================================================================="
	figlet  "you  are'nt anonymous" | lolcat
	echo 
	echo "=================================================================================="
	echo
	figlet "activing anonymous mode: " | lolcat
	echo "=================================================================================="
	cd /home/kali/nipe
	perl nipe.pl start 1>/dev/null
	perl nipe.pl restart 1>/dev/null
	perl nipe.pl start 1>/dev/null
    perl nipe.pl status | lolcat
    echo "========================"
	exit
	
fi
}

#~ A function for obtaining information about the target by agents
function VPS()
{
    read -p "enter ip of agent one: " IP 

	read -p "enter username of agent one: " USER

	read -p "enter ip range to scan: " RNG 
	echo ""
	echo "scaning for open ports" | lolcat
	sshpass -p "$USER" ssh -o StrictHostKeyChecking=no $USER@$IP "nmap  $RNG -Pn -p22,80,443 | grep open " #namp query for port scan
	echo ""
	echo "scaning for hosts in the network" | lolcat
	sshpass -p "$USER" ssh -o StrictHostKeyChecking=no $USER@$IP "nmap -sn  $RNG | grep -i scan" #namp scan for hosts in the network
	echo ""
	echo "scaning for operating systems" | lolcat
	sshpass -p "$USER" ssh -o StrictHostKeyChecking=no $USER@$IP "nmap -sV -F  $RNG | grep -i service | grep -i info" #namp scan for Operating Systems
	echo ""
	read -p "enter ip of agent two: " IP 
	read -p "enter username of agent two: " USER
	read -p "enter ip range to scan: " RNG 
	echo "scaning country of the target" | lolcat
	sshpass -p "$USER" ssh -o StrictHostKeyChecking=no $USER@$IP "whois  $RNG | grep -i country " #whois query for country
	echo ""
	echo "scaning city of the target" | lolcat
	sshpass -p "$USER" ssh -o StrictHostKeyChecking=no $USER@$IP " whois  $RNG | grep -i city " #whois query for city
	echo ""
	echo "scaning Phone number of the target" | lolcat
	sshpass -p "$USER" ssh -o StrictHostKeyChecking=no $USER@$IP "whois  $RNG |grep -i OrgTechPhone | awk '{print $2}'" #whois query for phone number of the target
	echo ""
	echo "scaning Email of the target" | lolcat
	sshpass -p "$USER" ssh -o StrictHostKeyChecking=no $USER@$IP "whois  $RNG |grep -i OrgTechemail " #whois query for the email of the target


}
INST
ANON
VPS	




