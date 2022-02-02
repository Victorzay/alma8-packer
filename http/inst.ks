cdrom
text
lang en_US.UTF-8
keyboard us
timezone UTC

network --onboot yes --bootproto=dhcp --ipv6=auto --activate
network --hostname=almalinux8

rootpw --iscrypted $6$Nup5jB.F2A.BPnn7$yJ1ObMpHn7AxDc6f7gg4nmOE7Haj8Ot9LEW/gvz8Gs0LzF9YwFjTVhwHIYJI7qUIFGqElRH4rClgHFN5Smx3t/

user --name=vagrant --groups=wheel --plaintext --password=vagrant

firewall --disabled
selinux --disabled
firstboot --disabled

skipx

logging --level=info
zerombr
clearpart --all --initlabel
autopart

eula --agreed

reboot

%packages
@Core
openssh-clients
openssh-server
%end

%post --log=/root/post_install.log

usermod -aG vagrant vagrant

echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vagrant


/bin/chmod 0440 /etc/sudoers.d/vagrant
/bin/sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

%end