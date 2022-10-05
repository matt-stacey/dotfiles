# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
fi

# Modified commands
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias free='free -m'

# New commands
alias du1='du --max-depth=1'
alias planner='flatpak run com.github.alainm23.planner &'

# More ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Safety features
alias cp='cp -irv'
alias mv='mv -iv'
alias rm='rm -Irv'  # 'rm -i' prompts for every file
alias ln='ln -iv'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Make Bash error tolerant
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'

# extract - archive extractor
# usage: extract <file>
extract ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


## Work-related aliases and functions
alias dolph='dolphin . &'
alias osr='deactivate; cd ~/Git/osr-tools-and-scripts/sxivv/'
alias dragon='ssh -Y dragonpit-01.sx.odysseyspace.net'

# Repo shortcuts
alias spacex='deactivate; cd ~/sxivv/spacex_ivv; source bashrc'
alias genii='deactivate; cd ~/sxivv/spacex_ivv; source bashrc; cd tools/pp_tools/post_processing/genii/'
alias c3po='deactivate; cd ~/sxivv/spacex_ivv; source bashrc; cd tools/pp_tools/post_processing/c3po/'

alias spacex2='deactivate; cd ~/sxivv2/spacex_ivv; source bashrc'
alias genii2='deactivate; cd ~/sxivv2/spacex_ivv; source bashrc; cd tools/pp_tools/post_processing/genii/'
alias c3po2='deactivate; cd ~/sxivv2/spacex_ivv; source bashrc; cd tools/pp_tools/post_processing/c3po/'

alias hspacex='deactivate; cd /sx/repos-mbs/spacex_ivv; source bashrc'
alias hosr='deactivate; cd /sx/repos-mbs/osr-tools-and-scripts/sxivv/'
alias temp='deactivate; cd /sx/proxy/spacex/temporary'
alias prism='deactivate; cd /sx/proxy/spacex/load_builder/proxy_standard; ./bin/prism'
alias perf='deactivate; cd /sx/proxy/spacex/load_builder/proxy_standard; ./bin/prism --telem_host=localhost:10066'
alias rio='deactivate; cd /sx/repos-mbs/osr-tools-and-scripts/sxivv/Crew-Displays'

# VPN access
alias osr-vpn='sudo openvpn --config ~/Documents/client.ovpn'  # hard link to file
alias sx-vpn='globalprotect connect -p connect.spacex.com'
alias sx-stat='globalprotect show --status'
alias no-sx='globalprotect disconnect'

# HOOTL access
alias hootls='hootl_agent status'
# Current descriptors:
# hootl d2 c1 ##    crew-1 dragon2
# hootl f9 d2 ##    falcon9 with dragon2
hootl() {
    ssh -YC hootl-$1-$2-$3.sx.odysseyspace.net
}
hootl-pdb() {
    telnet hootl-$1-$2-$3.sx.odysseyspace.net 10001
}
claim() {
    hootl_agent claim hootl-$1-$2-$3
}
release() {
    hootl_agent release hootl-$1-$2-$3
}
key_copy() {
    ssh-copy-id -i ~/.ssh/id_rsa.pub mstacey@hootl-$1-$2-$3.sx.odysseyspace.net
}
sx-runner() {  # don't alias this to runner, or HOOTL runner won't work
    hootl_agent claim runner-sx-sim$1
    ssh -YC -i ~/.ssh/id_rsa_sx_runners gitlab-runner@runner-sx-sim$1.sx.odysseyspace.net
    hootl_agent release runner-sx-sim$1
}

# SSH commands
work_wrapper() {  # should never be called on its own, but could be
    if [ $# -lt 1 ]
    then
        exit 1
    fi
    MACHINE=`echo "$1" | sed 's/./\L&/g'`  # ensure it's lowercase
    if [ $# -eq 1 ]
    then
        echo 'ssh -YC mstacey@'$MACHINE
        ssh -YC mstacey@$MACHINE
    else
        case $2 in
            mount)
                echo 'sshfs mstacey@'$MACHINE':/home/mstacey/ ~/'$3'/'
                sshfs mstacey@$MACHINE:/home/mstacey/ ~/$3/
                ;;
            unmount)
                echo 'fusermount -u ~/'$3
                fusermount -u ~/$3
                ;;
            key)
                echo 'ssh-copy-id -i ~/.ssh/id_rsa.pub mstacey@'$MACHINE
                ssh-copy-id -i ~/.ssh/id_rsa.pub mstacey@$MACHINE
                ;;
            *)
                echo 'bad option: '$2
                ;;
        esac
    fi
}

aore () {
    if [ $# -lt 1 ]
    then
        work_wrapper aore.lan.odysseyspace.net
    else
        work_wrapper aore.lan.odysseyspace.net $1 aore
    fi
}

udot () {
    if [ $# -lt 1 ]
    then
        work_wrapper udot.lan.odysseyspace.net
    else
        work_wrapper udot.lan.odysseyspace.net $1 udot
    fi
}

work_ip() {
    if [ $# -lt 1 ]
    then
        exit 1
    fi
    if [ $# -eq 1 ]
    then
        work_wrapper $1
    else
        work_wrapper $@  # requires manual selection of mount point: IP, command (,mount_point)
    fi
}

share() {
    if [ $# -lt 1 ]
    then
        echo 'mount or unmount?'
    else
        case $1 in
            mount)
                echo 'sshfs mstacey@udot.lan.odysseyspace.net:/share/ /home/matt/osr_share/'
                sshfs mstacey@udot.lan.odysseyspace.net:/share/ /home/matt/osr_share/
                ;;
            unmount)
                echo 'fusermount -u ~/osr_share'
                fusermount -u ~/osr_share
                ;;
            *)
                echo 'bad option: '$1
                ;;
        esac
    fi
}
