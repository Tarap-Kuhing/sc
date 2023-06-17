#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
clear
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
clear
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
echo "Masukkan Email Untuk Menerima Backup"
read -rp "Email : " -e email
cat <<EOF>>/home/email
EOF
fi
clear
echo "Mohon Menunggu , Proses Backup sedang berlangsung !!"
rm -rf /root/backup
mkdir /root/backup
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/group /root/backup/ &> /dev/null
cp -r /etc/shadow /root/backup/ &> /dev/null
cp -r /etc/gshadow /root/backup/ &> /dev/null
cp -r /usr/bin/idchat /root/backup/ &> /dev/null
cp -r /usr/bin/token /root/backup/ &> /dev/null
cp -r /etc/per/id /root/backup/ &> /dev/null
cp -r /etc/per/token /root/backup/token2 &> /dev/null
#cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp -r /etc/xray/config.json /root/backup/xray &> /dev/null
#cp -r /etc/xray/ssh /root/backup/ssh &> /dev/null
#cp -r /usr/local/etc/xray /root/backup/xray &> /dev/null
cp -r /etc/nginx/conf.d /root/backup/conf.d/ &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp -r /etc/crontab /root/backup/crontab &> /dev/null
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
" | mail -s "Backup Data"
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
"
echo "Silahkan cek Kotak Masuk $email"
read -n 1 -s -r -p "Press any key to back on menu"
menu
