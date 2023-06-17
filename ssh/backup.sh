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
CHATID=`cat /etc/Tarap-Kuhing/id`
KEY=`cat /etc/Tarap-Kuhing/token`
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
mkdir -p /var/www/html >/dev/null 2>&1
cp -r /etc/xray/config.json  config.json >/dev/null 2>&1
zip config.json vps-backup.zip >/dev/null 2>&1
mv *.zip /var/www/html >/dev/null 2>&1
systemctl restart backup >/dev/null 2>&1
clear
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/Tarap-Kuhing/user.log
echo -e "SUCCESSFULL BACKUP YOUR VPS" | tee -a /etc/Tarap-Kuhing/user.log
echo -e "Please Save The Following Data" | tee -a /etc/Tarap-Kuhing/user.log
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/Tarap-Kuhing/user.log
echo -e "${BLUE}Your VPS IP${NC} : ${GREEN}$IP${NC}" | tee -a /etc/Tarap-Kuhing/user.log
echo -e "${BLUE}DOMAIN${NC}      : ${GREEN}$HOST${NC}" | tee -a /etc/Tarap-Kuhing/user.log
echo -e "${BLUE}DATE${NC}        : ${GREEN}$DATEVPS${NC}" | tee -a /etc/Tarap-Kuhing/user.log
echo -e "${BLUE}ISP${NC}         : ${GREEN}$ISPVPS${NC}" | tee -a /etc/Tarap-Kuhing/user.log
echo -e "${BLUE}LOCATION${NC}    : ${GREEN}$CITY${NC}" | tee -a /etc/Tarap-Kuhing/user.log
echo -e "${BLUE}LINK BACKUP${NC} : ${GREEN}$LINKBACKUP${NC}" | tee -a /etc/Tarap-Kuhing/user.log
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/Tarap-Kuhing/user.log
echo -e "${RED}Please Save your backup file${NC}" | tee -a /etc/Tarap-Kuhing/user.log

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
