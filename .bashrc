# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Functions
aur(){ 
	d=$(mktemp -d); cd $d
	git clone https://aur.archlinux.org/$1.git
	cd $1; makepkg -si --noconfirm
	cd; rm -rf $d
}

# My alias
alias hybrid='sudo envycontrol -s hybrid --rtd3 2 --force-comp --verbose'
alias nvidia='sudo envycontrol -s nvidia --force-comp --verbose'
alias intel='sudo envycontrol -s integrated --force-comp --verbose'
alias cdtemp='cd $(mktemp -d)'
alias updatemirror='sudo reflector --protocol https --latest 20 --age 24 --sort rate --verbose --country IN,SG --save /etc/pacman.d/mirrorlist'
alias wifite='sudo wifite -mac --daemon --kill; sudo airmon-ng stop wlan0mon; sudo systemctl restart NetworkManager'
alias userjs='~/.mozilla/updater.sh -l -s -o ~/.mozilla/user-overrides.js'
alias changemac='sudo systemctl stop NetworkManager; sudo macchanger -a wlan0; sudo systemctl start NetworkManager '
alias turbo1='sudo x86_energy_perf_policy --turbo-enable 1'
alias turbo0='sudo x86_energy_perf_policy --turbo-enable 0'
alias quiet='echo quiet | sudo tee /sys/firmware/acpi/platform_profile; powerprofilesctl set power-saver'
alias balanced='echo balanced | sudo tee /sys/firmware/acpi/platform_profile; powerprofilesctl set balanced'
alias perf='echo balanced-performance | sudo tee /sys/firmware/acpi/platform_profile; powerprofilesctl set performance'
alias pp='cat /sys/firmware/acpi/platform_profile'
alias dot='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias suspend='systemctl suspend'
alias 60='hyprctl keyword monitor eDP-1,2560x1440@60,auto,auto; kscreen-doctor output.eDP-1.mode.2560x1440@60'
alias 144='hyprctl keyword monitor eDP-1,2560x1440@144,auto,auto; kscreen-doctor output.eDP-1.mode.2560x1440@144'
alias 165='hyprctl keyword monitor eDP-1,2560x1440@165,auto,auto; kscreen-doctor output.eDP-1.mode.2560x1440@165'
alias nano='nvim'
alias vlc='$HOME/.local/bin/vlchidpi'
