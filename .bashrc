# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Exports
export GOPATH="$HOME/.go"
export PATH="$HOME/.local/bin:$GOPATH/bin:/usr/local/bin:$PATH"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Functions
__set_prompt() { local ext=$? c="\[\e[1;32m\]" v=""; [[ $ext -ne 0 ]] && c="\[\e[1;31m\]"; [[ -n "$VIRTUAL_ENV" ]] && v="\[\e[1;35m\]($(basename "$VIRTUAL_ENV"))\[\e[0m\] "; PS1="${v}\[\e[1;32m\]\u@\h\[\e[0m\] \[\e[1;34m\]\w\[\e[0m\] ${c}\\\$\[\e[0m\] "; }
PROMPT_COMMAND=__set_prompt
aur() { (cd ~/.cache && git clone "https://aur.archlinux.org/$1.git" && cd "$1" && makepkg -si); }
pp() { local p=/sys/firmware/acpi/platform_profile PS3="Set: "; echo "Now: $(<"$p")"; select o in $(<"${p}_choices"); do [[ -n $o ]] && sudo tee "$p" <<<"$o" >/dev/null && break; done; }
tb() { local p=/sys/devices/system/cpu/intel_pstate/no_turbo; [[ -n $1 ]] && sudo tee "$p" <<<"$((!$1))" >/dev/null; (( $(<"$p") )) && echo 'Turbo: Off' || echo 'Turbo: On'; }
np() { local p=/sys/module/pcie_aspm/parameters/policy PS3="Set: "; echo "Now: $(<"$p")"; select o in $(tr -d '[]' <"$p"); do [[ -n $o ]] && sudo tee "$p" <<<"$o" >/dev/null && break; done; }

# Alias
alias nvidia='sudo envycontrol -s nvidia --force-comp --verbose'
alias hybrid='sudo envycontrol -s hybrid --rtd3 2 --verbose'
alias intel='sudo envycontrol -s integrated --verbose'
alias cdtemp='cd $(mktemp -d)'
alias updatemirror='sudo reflector --protocol https --latest 20 --age 24 --sort rate --verbose --country IN,SG --save /etc/pacman.d/mirrorlist'
alias wifite='sudo wifite -mac --daemon --kill; sudo airmon-ng stop wlan0mon; sudo systemctl restart NetworkManager'
alias userjs='~/.mozilla/updater.sh -l -s -o ~/.mozilla/user-overrides.js'
alias changemac='sudo systemctl stop NetworkManager; sudo macchanger -a wlan0; sudo systemctl start NetworkManager'
alias dot='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias dota='dot commit -a -m "$(date)" && ssh-add ~/.ssh/bugaddr && dot push'
alias suspend='systemctl suspend'
alias hibernate='systemctl hibernate'
alias snip='less ~/.snip'
alias rmnm='fd -td node_modules -x rm -rfv'
alias pr='espeak-ng -v en-gb -s 130 -p 50 -k20'
alias unpac='pacman -Qeq | fzf --multi --preview "pacman -Qi {1}" | xargs -ro sudo pacman -Rcns'
alias mvenv='python -m venv ./venv'
alias avenv='source ./venv/bin/activate'


# Added by Antigravity CLI installer
export PATH="/home/bugaddr/.local/bin:$PATH"
