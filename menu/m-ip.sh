#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);

colornow=$(cat /etc/kuhing/theme/color.conf)
NC="\e[0m"
COLOR1="$(cat /etc/kuhing/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/kuhing/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'

APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
#regis ip
API1=$(cat /etc/github/api)
EMAIL1=$(cat /etc/github/email)
USERNAME1=$(cat /etc/github/username)


function setapi(){
    clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}              ${WH}• IPVPS GITHUB API •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"

if [[ -f /etc/github/api && -f /etc/github/email && /etc/github/username ]]; then
   rec="OK"
else
    mkdir /etc/github > /dev/null 2>&1
fi

read -p " E-mail   : " EMAIL1
if [ -z $EMAIL1 ]; then
echo -e "$COLOR1 ${NC}   [INFO] Please Input Your Github Email Adress"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi

read -p " Username : " USERNAME1
if [ -z $USERNAME1 ]; then
echo -e "$COLOR1 ${NC}   [INFO] Please Input Your Github Username"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi

read -p " API      : " API1
if [ -z $API1 ]; then
echo -e "$COLOR1 ${NC}  [INFO] Please Input Your Github API"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "  Press any key to back on menu"
m-ip
fi

sleep 2
echo "$EMAIL1" > /etc/github/email
echo "$USERNAME1" > /etc/github/username
echo "$API1" > /etc/github/api
echo "ON" > /etc/github/gitstat
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}   [INFO] Github Api Setup Successfully"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}   • Email : $EMAIL1"
echo -e "$COLOR1 ${NC}   • User  : $USERNAME1"
echo -e "$COLOR1 ${NC}   • API   : $API1"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}

function viewapi(){
    clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}             ${WH}• LIST REGISTER IP •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  • Email : $EMAILGIT"
echo -e "$COLOR1 ${NC}  • User  : $USERGIT"
echo -e "$COLOR1 ${NC}  • API   : $APIGIT"
echo -e "$COLOR1 ${NC}  • All U need Is Create a new repository "
echo -e "$COLOR1 ${NC}    & Nammed : ip "
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}

function add_ip(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
rm -rf /root/ip
read -p "   NEW IPVPS : " daftar
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  [INFO] Checking the IPVPS!"
sleep 1
REQIP=$(curl -sS https://raw.githubusercontent.com/${USERGIT}/ip/main/vps | awk '{print $4}' | grep $daftar)
if [[ $daftar = $REQIP ]]; then
echo -e "$COLOR1 ${NC}  [INFO] VPS IP Already Registered!!"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
else
echo -e "$COLOR1 ${NC}  [INFO] OK! IP VPS is not Registered!"
echo -e "$COLOR1 ${NC}  [INFO] Lets Regester it!"
sleep 3
clear
fi
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -p "   User Name  : " client
if [ -z $client ]; then
cd
echo -e "$COLOR1 ${NC}  [INFO] Please Input client"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi


read -p "   EXP Date   : " exp
if [ -z $exp ]; then
cd
echo -e "$COLOR1 ${NC}   [INFO] Please Input exp date"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi

x="ok"

satu="ON"
dua="OFF"
while true $x != "ok"
do
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  ${COLOR1}[01]${NC} • ADMIN   ${COLOR1}[02]${NC} • NORMAL"
echo -e "$COLOR1 ${NC}"
echo -ne "   Input your choice : "; read list
echo ""
case "$list" in
   1) isadmin="$satu";break;;
   2) isadmin="$dua";break;;
esac
done


exp=$(date -d "$exp days" +"%Y-%m-%d")
hariini=$(date -d "0 days" +"%Y-%m-%d")
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
git clone https://github.com/${USERGIT}/ip.git &> /dev/null
cd /root/ip/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
touch vps &> /dev/null
#touch newuser &> /dev/null
TEXT="
Name        : $client
Admin Panel : $isadmin
Exp         : $exp
IPVPS       : $daftar
Reg Date    : $hariini
"
#echo "${TEXT}" >>/root/tarap/newuser
echo "### $client $exp $daftar $isadmin" >>/root/ip/vps
git add .
git commit -m register &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USERGIT}/ip.git &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/ip.git &> /dev/null
sleep 1
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  Client IP Regested Successfully"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  Client Name   : $client"
echo -e "$COLOR1 ${NC}  Admin Panel   : $isadmin"
echo -e "$COLOR1 ${NC}  IP VPS        : $daftar"
echo -e "$COLOR1 ${NC}  Register Date : $hariini"
echo -e "$COLOR1 ${NC}  Expired Date  : $exp"
cd
rm -rf /root/ip
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHINH •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
}
function delipvps(){
clear
rm -rf /root/ip &> /dev/null
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
git clone https://github.com/${USERGIT}/ip.git &> /dev/null
cd /root/ip/ &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
touch vps &> /dev/null
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}• DELETE IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "/root/ip/vps" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -rp "   Please Input Number : " nombor
if [ -z $nombor ]; then
cd
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}• DELETE IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1 ${NC}   [INFO] Please Input Correct Number"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi

name1=$(grep -E "^### " "/root/ip/vps" | cut -d ' ' -f 2 | sed -n "$nombor"p) #name
exp=$(grep -E "^### " "/root/ip/vps" | cut -d ' ' -f 3 | sed -n "$nombor"p) #exp
ivps1=$(grep -E "^### " "/root/ip/vps" | cut -d ' ' -f 4 | sed -n "$nombor"p) #ip
sed -i "s/### $name1 $exp $ivps1//g" /root/ip/vps &> /dev/null
hariini2=$(date -d "0 days" +"%Y-%m-%d")
TEXTD="
Name     : $name1
IPVPS    : $ivps1
Status   : Deleted on  $hariini2
"
echo "${TEXTD}" >>/root/ip/delete_log  &> /dev/null

git add . &> /dev/null
git commit -m remove &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USERGIT}/ip.git &> /dev/null
git push -f https://${APIGIT}@github.com/${USERGIT}/ip.git &> /dev/null
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  Client IP Deleted Successfully"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  Ip VPS       : $ivps1"
echo -e "$COLOR1 ${NC}  Expired Date : $exp"
echo -e "$COLOR1 ${NC}  Client Name  : $name1"
cd
rm -rf /root/ip
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}

function renewipvps(){
 clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW EXP IPVPS •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
rm -rf /root/ip
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
git clone https://github.com/${USERGIT}/ip.git
cd /root/ip/
rm -rf .git
git init
touch vps
echo -e "   [ ${Lyellow}INFO${NC} ] Checking list.."

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/root/ip/vps")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
  clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW EXP IPVPS •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}   [INFO] You have no existing clients!"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW EXP IPVPS •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "/root/ip/vps" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
  if [[ ${CLIENT_NUMBER} == '1' ]]; then
    read -rp " Select one client [1]: " CLIENT_NUMBER
  else
    read -rp " Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
  fi
if [ -z $CLIENT_NUMBER ]; then
cd
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW EXP IPVPS •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}   [INFO] Please Input Correct Number"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi
done
echo -e ""
read -p " Expired (days): " masaaktif
if [ -z $masaaktif ]; then
cd
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW EXP IPVPS •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  [INFO] Please Input Correct Number"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi
name1=$(grep -E "^### " "/root/ip/vps" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p) #name
exp=$(grep -E "^### " "/root/ip/vps" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p) #exp
ivps1=$(grep -E "^### " "/root/ip/vps" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p) #ip

now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(((d1 - d2) / 86400))
exp3=$(($exp2 + $masaaktif))
exp4=$(date -d "$exp3 days" +"%Y-%m-%d")
sed -i "s/### $name1 $exp $ivps1/### $name1 $exp4 $ivps1/g" /root/ip/vps
git add .
git commit -m renew
git branch -M main
git remote add origin https://github.com/${USERGIT}/ip.git
git push -f https://${APIGIT}@github.com/${USERGIT}/ip.git
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW EXP IPVPS •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  Client IP VPS Renew Successfully"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  Ip VPS        : $ivps1"
echo -e "$COLOR1 ${NC}  Renew Date    : $now"
echo -e "$COLOR1 ${NC}  Days Added    : $masaaktif Days"
echo -e "$COLOR1 ${NC}  Expired Date  : $exp4"
echo -e "$COLOR1 ${NC}  Client Name   : $name1"
cd
rm -rf /root/ip
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}

function useripvps(){
clear
rm -rf /root/ip
git config --global user.email "${EMAILGIT}"
git config --global user.name "${USERGIT}"
git clone https://github.com/${USERGIT}/ip.git
cd /root/ip/
rm -rf .git
git init
touch vps
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• USERLIST IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "/root/ip/vps" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
cd
rm -rf /root/ip
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}
function renewip(){
 clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
rm -rf /root/ip
git config --global user.email "${EMAILGIT}" &> /dev/null
git config --global user.name "${USERGIT}" &> /dev/null
git clone https://github.com/${USERGIT}/ip.git
cd /root/ip/
rm -rf .git
git init
touch vps
echo -e "   [ ${Lyellow}INFO${NC} ] Checking list.."

NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/root/ip/vps")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
  clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW IPVPS •                 ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}   [INFO] You have no existing clients!"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW IPVPS •                 ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
grep -E "^### " "/root/ip/vps" | cut -d ' ' -f 2-4 | nl -s '. '
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
  if [[ ${CLIENT_NUMBER} == '1' ]]; then
    read -rp " Select one client [1]: " CLIENT_NUMBER
  else
    read -rp " Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
  fi
if [ -z $CLIENT_NUMBER ]; then
cd
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW IPVPS •                 ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}   [INFO] Please Input Correct Number"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi
done
echo -e ""
read -p "   RENEW IP : " RENEW
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  [INFO] Checking the IPVPS!"
sleep 1
REQIP=$(curl -sS https://raw.githubusercontent.com/${USERGIT}/ip/main/vps | awk '{print $4}' | grep $daftar)
if [[ $RENEW = $ivps1 ]]; then
cd
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW IPVPS •                 ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  [INFO] Please Input Correct Number"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ip
fi
#name1=$(grep -E "^### " "/root/tarap/ipvps" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p) #name
#exp=$(grep -E "^### " "/root/tarap/ipvps" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p) #exp
ivps1=$(grep -E "^### " "/root/ip/vps" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p) #ip

#now=$(date +%Y-%m-%d)
#d1=$(date -d "$exp" +%s)
#d2=$(date -d "$now" +%s)
#exp2=$(((d1 - d2) / 86400))
#exp3=$(($exp2 + $masaaktif))
#exp4=$(date -d "$exp3 days" +"%Y-%m-%d")
sed -i "s/### $name1 $exp $ivps1/### $name1 $exp4 $ivps1/g" /root/ip/vps
git add .
git commit -m renew
git branch -M main
git remote add origin https://github.com/${USERGIT}/ip.git
git push -f https://${APIGIT}@github.com/${USERGIT}/ip.git
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• RENEW IPVPS •                 ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  Client IP VPS Renew Successfully"
echo -e "$COLOR1 ${NC}"
echo -e "$COLOR1 ${NC}  Ip VPS        : $ivps1"
echo -e "$COLOR1 ${NC}  Renew Date    : $now"
echo -e "$COLOR1 ${NC}  Days Added    : $masaaktif Days"
echo -e "$COLOR1 ${NC}  Expired Date  : $exp4"
echo -e "$COLOR1 ${NC}  Client Name   : $name1"
cd
rm -rf /root/ip
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}
function resetipvps(){
clear
rm -f /etc/github/email
rm -f /etc/github/username
rm -f /etc/github/api
rm -f /etc/github/gitstat
echo "OFF" > /etc/github/gitstat
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}              ${WH}• RESET GITUB API •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}  [INFO] Github API Reseted Successfully"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
}
Isadmin=$(curl -sS https://raw.githubusercontent.com/kuhing/ip/main/vps | grep $MYIP | awk '{print $5}')
if [ "$Isadmin" = "OFF" ]; then
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• PREMIUM USER ONLY •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} [INFO] Only PRO Users Can Use This Panel"
echo -e "$COLOR1 ${NC} [INFO] Buy Premium Membership : "
echo -e "$COLOR1 ${NC} [INFO] PM : https://wa.me/085754292950"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
m-ip
fi
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
GITREQ=/etc/github/gitstat
if [ -f "$GITREQ" ]; then
    cekk="ok"
else
    mkdir /etc/github
    touch /etc/github/gitstat
    echo "OFF" > /etc/github/gitstat
fi

stst1=$(cat /etc/github/gitstat)
if [ "$stst1" = "OFF" ]; then
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• REGISTER IPVPS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}   • You Need To Set Github API First!"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -n 1 -s -r -p "   Press any key to Set API"
setapi
fi
stst=$(cat /etc/github/gitstat)
if [ "$stst" = "ON" ]; then
APIOK="CEK API"
rex="viewapi"
else
APIOK="SET API"
rex="setapi"
fi
if [ "$stst" = "ON" ]; then
ISON="RESET API"
ressee="resetipvps"
else
ISON=""
ressee="m-ip"
fi
echo -e "   $COLOR1 [01]$NC • $APIOK        $COLOR1 [05]$NC • USERLIST IPVPS"
echo -e "   $COLOR1 [02]$NC • ADD IPVPS      $COLOR1 [06]$NC • $ISON"
echo -e "   $COLOR1 [03]$NC • DELETE IPVPS   $COLOR1 [07]$NC • RENEW IPVPS"
echo -e "   $COLOR1 [04]$NC • RENEW EXP IPVPS"
echo -e "   "
echo -e "   $COLOR1 [00]$NC • GO BACK"

echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; $rex ;;
02 | 2) clear ; add_ip ;;
03 | 3) clear ; delipvps ;;
04 | 4) clear ; renewipvps ;;
05 | 5) clear ; useripvps ;;
06 | 6) clear ; $ressee ;;
07 | 7) clear ; renewip ;;
00 | 0) clear ; menu ;;
*) clear ; m-ip ;;
esac
