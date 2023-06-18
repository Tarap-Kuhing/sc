#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading File"
sleep 2
wget -q -O /usr/bin/ menu "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/ m-vmess "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-vmess.sh" && chmod +x /usr/bin/m-vmess
wget -q -O /usr/bin/ m-vless "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-vless.sh" && chmod +x /usr/bin/m-vless
wget -q -O /usr/bin/ running "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/running.sh" && chmod +x /usr/bin/running
wget -q -O /usr/bin/ clearcache "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/clearcache.sh" && chmod +x /usr/bin/clearcache
wget -q -O /usr/bin/ m-ssws "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-ssws.sh" && chmod +x /usr/bin/m-ssws
wget -q -O /usr/bin/ m-trojan "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-trojan.sh" && chmod +x /usr/bin/m-trojan
wget -q -O /usr/bin/ m-update "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-update.sh" && chmod +x /usr/bin/m-update
wget -q -O /usr/bin/ m-bot "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-bot.sh" && chmod +x /usr/bin/m-bot


# menu ssh ovpn
wget -q -O /usr/bin/ m-sshovpn "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-sshovpn.sh" && chmod +x /usr/bin/m-sshovpn
#wget -q -O /usr/bin/ backup "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/backup.sh" && chmod +x /usr/bin/backup
#wget -O trial "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/trial.sh"
#wget -O renew "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/renew.sh"
#wget -O hapus "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/hapus.sh"
#wget -O cek "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/cek.sh"
#wget -O member "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/member.sh"
#wget -O delete "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/delete.sh"
wget -q -O /usr/bin/ autokill "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/autokill.sh" && chmod +x /usr/bin/autokill
wget -q -O /usr/bin/ ceklim "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/ceklim.sh" && chmod +x /usr/bin/ceklim
wget -q -O /usr/bin/ tendang "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/tendang.sh" && chmod +x /usr/bin/tendang
#wget -q -O /usr/bin/ insshws "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/sshws/insshws.sh" && chmod +x /usr/bin/insshws
wget -q -O /usr/bin/ issue "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/issue.net" && chmod +x /usr/bin/issue

# menu system
wget -q -O /usr/bin/ m-system "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-system.sh" && chmod +x /usr/bin/m-system
wget -q -O /usr/bin/ m-domain "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-domain.sh" && chmod +x /usr/bin/m-domain
wget -q -O /usr/bin/ add-host "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/add-host.sh" && chmod +x /usr/bin/add-host
#wget -O port-change "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/port/port-change.sh"
wget -q -O /usr/bin/ certv2ray "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/xray/certv2ray.sh" && chmod +x /usr/bin/certv2ray
#wget -O m-webmin "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-webmin.sh"
wget -q -O /usr/bin/ speedtest "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/speedtest_cli.py" && chmod +x /usr/bin/speedtest_cli
#wget -O about "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/about.sh"
wget -q -O /usr/bin/ auto-reboot "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/auto-reboot.sh" && chmod +x /usr/bin/auto-reboot
wget -q -O /usr/bin/ restart "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/restart.sh" && chmod +x /usr/bin/restart
wget -q -O /usr/bin/ bw "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/bw.sh" && chmod +x /usr/bin/bw
wget -q -O /usr/bin/ m-tcp "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/tcp.sh" && chmod +x /usr/bin/tcp

# change port
#wget -O port-ssl "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/port/port-ssl.sh"
wget -q -O /usr/bin/ backup "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/backup.sh" && chmod +x /usr/bin/backup
wget -q -O /usr/bin/ bckp "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/bckp.sh" && chmod +x /usr/bin/bckp


wget -q -O /usr/bin/ xp "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/ssh/xp.sh" && chmod +x /usr/bin/xp
wget -q -O /usr/bin/ m-theme "https://raw.githubusercontent.com/Tarap-Kuhing/sc/main/menu/m-theme.sh" && chmod +x /usr/bin/m-theme

echo -e " [INFO] Dwonload File Successfully"
sleep 2
exit
