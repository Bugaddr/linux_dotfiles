# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Exports
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin:$HOME/.local/bin:/usr/local/bin"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export PS1="\[\e[1;32m\]\u@\h\[\e[0m\] \[\e[1;34m\]\w\[\e[0m\] \$( [ \$? -eq 0 ] && c='\[\e[1;32m\]' || c='\[\e[1;31m\]'; [ \$(id -u) -eq 0 ] && echo -e \"\$c#\" || echo -e \"\$c\$\" )\[\e[0m\] "

# Functions
aur() { (cd ~/.cache; git clone https://aur.archlinux.org/$1.git; cd $1 && makepkg -si); }
pp() { p=/sys/firmware/acpi/platform_profile; echo "Now: $(cat $p)"; PS3="Set: "; select o in $(cat ${p}_choices); do [[ $o ]] && sudo tee $p <<<$o >/dev/null && break; done; }
tb(){ p=/sys/devices/system/cpu/intel_pstate/no_turbo; [[ $1 ]] && sudo tee $p<<<$((!$1))>/dev/null; ((`cat $p`)) && echo 'Turbo: Off' || echo 'Turbo: On'; }
np() { p=/sys/module/pcie_aspm/parameters/policy; echo "Now: $(<$p)"; PS3="Set: "; select o in $(tr -d '[]' <$p); do [[ $o ]] && sudo tee $p <<<$o >/dev/null && break; done; }

# Alias
alias nvidia='sudo envycontrol -s nvidia --force-comp --verbose'
alias hybrid='sudo envycontrol -s hybrid --rtd3 3 --verbose'
alias intel='sudo envycontrol -s integrated --verbose'
alias cdtemp='cd $(mktemp -d)'
alias updatemirror='sudo reflector --protocol https --latest 20 --age 24 --sort rate --verbose --country IN,SG --save /etc/pacman.d/mirrorlist'
alias wifite='sudo wifite -mac --daemon --kill; sudo airmon-ng stop wlan0mon; sudo systemctl restart NetworkManager'
alias userjs='~/.mozilla/updater.sh -l -s -o ~/.mozilla/user-overrides.js'
alias changemac='sudo systemctl stop NetworkManager; sudo macchanger -a wlan0; sudo systemctl start NetworkManager '
alias dot='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias dota='dot commit -a -m push-latest-changes; ssh-add ~/.ssh/bugaddr; dot push'
alias suspend='systemctl suspend'
alias hibernate='systemctl hibernate'
alias snip='less ~/.snip'
alias rmnm='fd -td node_modules -x rm -rifv'
alias pr='espeak-ng -v en-gb -s 130 -p 50 -k20'
alias unpac='pacman -Qeq | fzf --multi --preview "pacman -Qi {1}" | xargs -ro sudo pacman -Rcns'
alias mvenv='python -m venv ./venv'
alias avenv='source ./venv/bin/activate'
