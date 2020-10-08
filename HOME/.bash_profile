# Use UTF-8 encoding
export LANG=en_US.UTF-8

# Set important environment variables
export EDITOR=vim
export TERM='xterm-256color'

# Prevent "others" from getting write permission on created files
umask 2

# If this is an interactive shell, source .bashrc (if it exists)
case "$-" in
    *i*)  # source ~/.bashrc
        [[ -f ~/.bashrc ]] && . ~/.bashrc
        ;;
esac
