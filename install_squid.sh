clear
echo "Squid 3.3.8 Installer";
sleep 5;
[[ ! -e /etc/apt/sources.list.d/trusty_sources.list ]] && {
touch /etc/apt/sources.list.d/trusty_sources.list >/dev/null 2>&1
echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty main universe" | tee --append /etc/apt/sources.list.d/trusty_sources.list >/dev/null 2>&1
}
[[ $(grep -wc 'Debian' /etc/issue.net) != '0' ]] && {
apt install dirmngr -y >/dev/null 2>&1
[[ $(apt-key list 2>/dev/null | grep -c 'Ubuntu') == '0' ]] && {
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 >/dev/null 2>&1
}
}
apt update -y >/dev/null 2>&1
apt install squid3=3.3.8-1ubuntu6 squid=3.3.8-1ubuntu6 squid3-common=3.3.8-1ubuntu6 -y >/dev/null 2>&1
wget -qO- https://raw.githubusercontent.com/rodrigo12xd/SSHPLUS/master/Install/squid3 >/etc/init.d/squid3
chmod +x /etc/init.d/squid3 >/dev/null 2>&1
update-rc.d squid3 defaults >/dev/null 2>&1
}
