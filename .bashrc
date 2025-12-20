# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Exports
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin:$HOME/.local/bin:/usr/local/bin"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export PS1="\[\e[1;32m\]\u@\h\[\e[0m\] \[\e[1;34m\]\w\[\e[0m\] \$( [ \$? -eq 0 ] && c='\[\e[1;32m\]' || c='\[\e[1;31m\]'; [ \$(id -u) -eq 0 ] && echo -e \"\$c#\" || echo -e \"\$c\$\" )\[\e[0m\] "

# Functions
aur(){
    cd ~/.cache || return
    git clone https://aur.archlinux.org/$1.git || return
    cd $1 || return
    makepkg -si; cd -
}

# Alias
alias nvidia='sudo envycontrol -s nvidia --force-comp --verbose'
alias hybrid='sudo envycontrol -s hybrid --rtd3 3 --verbose'
alias intel='sudo envycontrol -s integrated --verbose'
alias cdtemp='cd $(mktemp -d)'
alias updatemirror='sudo reflector --protocol https --latest 20 --age 24 --sort rate --verbose --country IN,SG --save /etc/pacman.d/mirrorlist'
alias wifite='sudo wifite -mac --daemon --kill; sudo airmon-ng stop wlan0mon; sudo systemctl restart NetworkManager'
alias userjs='~/.mozilla/updater.sh -l -s -o ~/.mozilla/user-overrides.js'
alias changemac='sudo systemctl stop NetworkManager; sudo macchanger -a wlan0; sudo systemctl start NetworkManager '
alias turbo1='sudo x86_energy_perf_policy --turbo-enable 1'
alias turbo0='sudo x86_energy_perf_policy --turbo-enable 0'
alias lowpower='echo low-power | sudo tee /sys/firmware/acpi/platform_profile; powerprofilesctl set power-saver'
alias balanced='echo balanced | sudo tee /sys/firmware/acpi/platform_profile; powerprofilesctl set balanced'
alias performance='echo balanced-performance | sudo tee /sys/firmware/acpi/platform_profile; powerprofilesctl set performance'
alias pp='cat /sys/firmware/acpi/platform_profile'
alias dot='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias dota='dot commit -a -m push'
alias suspend='systemctl suspend'
alias 60='hyprctl keyword monitor eDP-1,2560x1440@60,auto,auto; kscreen-doctor output.eDP-1.mode.2560x1440@60'
alias 144='hyprctl keyword monitor eDP-1,2560x1440@144,auto,auto; kscreen-doctor output.eDP-1.mode.2560x1440@144'
alias 165='hyprctl keyword monitor eDP-1,2560x1440@165,auto,auto; kscreen-doctor output.eDP-1.mode.2560x1440@165'
alias nano='nvim'
alias snip='less ~/.snip'
alias nvperf='echo performance | sudo tee /sys/module/pcie_aspm/parameters/policy'
alias nvdef='echo default | sudo tee /sys/module/pcie_aspm/parameters/policy'
alias nveco='echo powersupersave | tee /sys/module/pcie_aspm/parameters/policy'
alias np='cat /sys/module/pcie_aspm/parameters/policy'
alias rmnm='fd -td node_modules -x rm -rifv'
alias hibernate='systemctl hibernate'
alias pr='espeak-ng -v en-gb -s 130 -p 50 -k20'
