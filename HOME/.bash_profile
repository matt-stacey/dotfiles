# Use UTF-8 encoding
export LANG=en_US.UTF-8

# Set important environment variables
export EDITOR=vim
export TERM='xterm-256color'

# if this is the SpaceX laptop
[ "$HOSTNAME" == "mstacey-840" ] && export TERM='screen-256color'

# Prevent "others" from getting write permission on created files
umask 2

# If this is an interactive shell, source .bashrc (if it exists)
case "$-" in
    *i*)  # source ~/.bashrc
        [[ -f ~/.bashrc ]] && . ~/.bashrc
        ;;
esac
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
