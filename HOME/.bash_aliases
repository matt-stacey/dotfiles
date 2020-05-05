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
alias osr-vpn='sudo openvpn --config ~/Documents/client.ovpn'  # hard link to file
alias sx-vpn='globalprotect connect -p connect.spacex.com'
alias no-sx='globalprotect disconnect'

aore() {
    if [ $# -eq 0 ]
    then
        echo 'ssh -YC mstacey@aore.lan.odysseyspace.net'
        ssh -YC mstacey@aore.lan.odysseyspace.net
    else
        case $1 in
            mount)
                echo 'sshfs mstacey@aore.lan.odysseyspace.net:/home/mstacey/ ~/aore/'
                sshfs mstacey@aore.lan.odysseyspace.net:/home/mstacey/ ~/aore/
                ;;
            unmount)
                echo 'fusermount -u /home/matt/aore'
                fusermount -u /home/matt/aore
                ;;
            key)
                echo 'ssh-copy-id -i ~/.ssh/id_rsa.pub mstacey@aore.lan.odysseyspace.net'
                ssh-copy-id -i ~/.ssh/id_rsa.pub mstacey@aore.lan.odysseyspace.net
                ;;
            *)
                echo 'bad option'
                ;;
        esac
    fi
}
