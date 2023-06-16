#!/bin/bash
BURIQ () {
    curl -sS https://raw.githubusercontent.com/kuhing/theme > /root/tmp
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
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}⇱ UPDATE ⇲                    ${NC} $COLOR1 $NC"
echo -e "$COLOR1 ${NC} ${COLBG1}             ${WH}⇱ SCRIPT TERBARU ⇲                  ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"


#hapus menu
rm -rf menu
rm -rf m-vmess
rm -rf m-vless
rm -rf m-trojan
rm -rf m-system
rm -rf m-sshovpn
rm -rf m-ssws
rm -rf running
rm -rf m-update
rm -rf m-backup
rm -rf m-theme
rm -rf m-ip
rm -rf m-bot
rm -rf update
#rm -rf ws-dropbear
rm -rf tendang
rm -rf bottelegram
rm -rf restore
rm -rf backup2
rm -rf cleaner
rm -rf bot


# download menu
cd /usr/bin
rm -rf menu
rm -rf m-vmess
rm -rf m-vless
rm -rf m-trojan
rm -rf m-system
rm -rf m-sshovpn
rm -rf m-ssws
rm -rf running
rm -rf m-backup
rm -rf m-theme
rm -rf m-domain
rm -rf m-bot
rm -rf update
#rm -rf ws-dropbear
rm -rf tendang
#rm -rf bottelegram
#rm -rf restore
#rm -rf backup
rm -rf cleaner
rm -rf add-host
rm -rf certv2ray
rm -rf uuid


fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
#wget -O m-ip "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-ip.sh"    
wget -O /usr/bin/menu "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -O /usr/bin/m-vmess "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-vmess.sh" && chmod +x /usr/bin/m-vmess
wget -O /usr/bin/m-vless "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-vless.sh" && chmod +x /usr/bin/m-vless
wget -O /usr/bin/m-trojan "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-trojan.sh" && chmod +x /usr/bin/m-trojan
wget -O /usr/bin/m-system "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-system.sh" && chmod +x /usr/bin/m-system
wget -O /usr/bin/m-sshovpn "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-sshovpn.sh" && chmod +x /usr/bin/m-sshovpn
wget -O /usr/bin/m-ssws "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-ssws.sh" && chmod +x /usr/bin/m-ssws
wget -O /usr/bin/running "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/running.sh" && chmod +x /usr/bin/running
wget -O /usr/bin/m-backup "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-backup.sh" && chmod +x /usr/bin/m-backup
wget -O /usr/bin/m-theme "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-theme.sh" && chmod +x /usr/bin/m-theme
wget -O /usr/bin/m-domain "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-domain.sh" && chmod +x /usr/bin/m-domain
wget -O /usr/bin/m-bot "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-bot.sh" && chmod +x /usr/bin/m-bot
wget -O /usr/bin/m-update "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-update.sh" && chmod +x /usr/bin/update
#wget -O /usr/bin/ws-dropbear "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/sshws/ws-dropbear" && chmod +x /usr/bin/ws-dropbear
#wget -O /usr/bin/tendang "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/tendang.sh" && chmod +x /usr/bin/tendang
#wget -O /usr/bin/bottelegram "https://raw.githubusercontent.com/Tarap-Kuhing/tarap/main/menu/bottelegram.sh" && chmod +x /usr/bin/bottelegram
#wget -O /usr/bin/backup "https://raw.githubusercontent.com/Tarap-Kuhing/tarap/main/ssh/backup2.sh" && chmod +x /usr/bin/backup
#wget -O /usr/bin/restore "https://raw.githubusercontent.com/Tarap-Kuhing/tarap/main/ssh/restore.sh" && chmod +x /usr/bin/restore
wget -O /usr/bin/cleaner "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/cleaner.sh" && chmod +x /usr/bin/cleaner
wget -O /usr/bin/certv2ray "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/xray/certv2ray.sh" && chmod +x /usr/bin/certv2ray
wget -O /usr/bin/add-host "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/addhost.sh" && chmod +x /usr/bin/add-host
wget -O /usr/bin/uuid "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/xray/uuid.sh" && chmod +x /usr/bin/uuid

chmod +x menu
chmod +x m-vmess
chmod +x m-vless
chmod +x m-trojan
chmod +x m-system
chmod +x m-sshovpn
chmod +x m-ssws
chmod +x running
chmod +x m-update
chmod +x m-backup
chmod +x m-theme
chmod +x m-domain
chmod +x m-bot
chmod +x update
#chmod +x tendang
#chmod +x bottelegram
#chmod +x backup2
#chmod +x restore
chmod +x cleaner
chmod +x certv2ray
chmod +x add-host
chmod +x uuid

clear

}
echo -e ""
echo -e "  \033[1;91m Update Script...\033[1;37m"
fun_bar 'res1'

echo -e ""

cd
menu
