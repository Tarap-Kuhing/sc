#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Tarap-Kuhing
# //	Dscription: Xray Menu Management
# //	email: merahjambo@gmail.com
# //  telegram: https://t.me/Baung2012
# //====================================================
# // font color configuration | TARAP KUHING AUTOSCRIPT
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/id)
URL="https://api.telegram.org/bot$KEY/sendMessage"
IP=$(curl -s ipv4.icanhazip.com);
HOST="$(cat /etc/xray/domain)"
DATEVPS=$(date +"%Y-%m-%d")
LINKBACKUP="http://$HOST:81"
ISPVPS=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
WKT=$(curl -s ipinfo.io/timezone)
GREEN="\e[92;1m"
BLUE="\033[36m"
RED='\033[0;31m'
NC='\033[0m'

function BACKUPVPS() {
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
clear
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
echo "Masukkan Email Untuk Menerima Backup"
read -rp "Email : " -e email
cat <<EOF>>/home/email
$email
EOF
fi
clear
figlet "Backup"
echo "Mohon Menunggu , Proses Backup sedang berlangsung !!"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/xray backup/xray
cp -r /root/nsdomain backup/nsdomain
cp -r /etc/slowdns backup/slowdns
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
clear
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "SUCCESSFULL BACKUP YOUR VPS"
echo -e "Please Save The Following Data"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${BLUE}Your VPS IP${NC} : ${GREEN}$IP${NC}"
echo -e "${BLUE}DOMAIN${NC}      : ${GREEN}$HOST${NC}"
echo -e "${BLUE}DATE${NC}        : ${GREEN}$date${NC}"
echo -e "${BLUE}ISP${NC}         : ${GREEN}$ISPVPS${NC}"
echo -e "${BLUE}LOCATION${NC}    : ${GREEN}$CITY${NC}"
echo -e "${BLUE}LINK BACKUP${NC} : ${GREEN}$$link${NC}"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${RED}Please Save your backup file${NC}"

}


function RESTOREVPS() {
mv /var/www/html/*.zip vps-backup.zip >/dev/null 2>&1
rm -f *.zip >/dev/null 2>&1
mv *.json /etc/xray >/dev/null 2>&1
systemctl restart nginx >/dev/null 2>&1
systemctl restart xray >/dev/null 2>&1
systemctl restart backup >/dev/null 2>&1
clear
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "SUCCESSFULL RESTORE YOUR VPS"
echo -e "Please Save The Following Data"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${BLUE}Your VPS IP${NC} : ${GREEN}$IP${NC}"
echo -e "${BLUE}DOMAIN${NC}      : ${GREEN}$HOST${NC}"
echo -e "${BLUE}DATE${NC}        : ${GREEN}$DATEVPS${NC}"
echo -e "${BLUE}ISP${NC}         : ${GREEN}$ISPVPS${NC}"
echo -e "${BLUE}LOCATION${NC}    : ${GREEN}$CITY${NC}"
echo -e "${BLUE}LINK RESTORE${NC}: ${GREEN}$LINKBACKUP${NC}"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${RED}This feature can only be used if the previous data backup uses this script${NC}"

}

function QUESTION() {
clear
echo -e ""
echo -e "${RED}WARNING !!!${NC}"
echo -e ""
echo -e "${RED}If you haven't uploaded your file, the VPN will not connect${NC}"
echo -e "${BLUE}if you have uploaded the file, please type yes${NC}"
echo -e "${BLUE}if you haven't uploaded the file, please type not${NC}"
read -p "Have you uploaded the backup file? yes/not :" NUM_MENU
 case $NUM_MENU in
    yes)
        RESTOREVPS
    ;;
    not)
        menu
    ;;
    *)
        echo -e "${Red}You wrong command !${Font}"
        sleep 5
        menu
    ;;
esac

}


echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[42m              BACKUP & RESTORE           \E[0m"
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [${grenbo}1${NC}] ${RED}• ${NC} Backup Data VPS"
echo -e " [${grenbo}2${NC}] ${RED}• ${NC} Restore Data VPS"
echo -e ""
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "Select From Options [ 1 - 2 ] : " OPT_MENU
echo -e ""
 case $OPT_MENU in
    1)
        BACKUPVPS
    ;;
    2)
        QUESTION
    ;;
    *)
        echo -e "${Red}You wrong command !${Font}"
        sleep 5
        menu
    ;;
esac
echo ""
read -n 1 -s -r -p "Press any key to back on menu"

menu
