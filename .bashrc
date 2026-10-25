# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
  # Shell is non-interactive.  Be done now!
  return
fi

PS1='\[\e[1;35m\]\u@\h\[\e[0m\] \[\e[1;34m\][\w]\[\e[0m\]\n\$ '

alias c='xclip -selection clipboard'
alias cls="clear && printf '\e[3J'"

. /etc/os-release
osname=${NAME,,}
cowsay bros using ${osname// linux/} btw

install_date=$(stat -c %Y / 2>/dev/null)
current_date=$(date +%s)
age_days=$(((current_date - install_date) / 86400))

echo "System age: $age_days days"
