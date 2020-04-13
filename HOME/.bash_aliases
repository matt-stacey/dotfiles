alias osr-vpn='sudo openvpn --config ~/Documents/client.ovpn'  # hard link to file
alias sx-vpn='globalprotect connect -p connect.spacex.com'
alias no-sx='globalprotect disconnect'

alias aore='ssh -YC mstacey@aore.lan.odysseyspace.net; exit'
alias aore-mount='sshfs mstacey@aore.lan.odysseyspace.net:/home/mstacey/ ~/aore/'
alias aore-unmount='fusermount -u /home/matt/aore'
alias aore-key='ssh-copy-id -i ~/.ssh/id_rsa.pub mstacey@aore.lan.odysseyspace.net'
