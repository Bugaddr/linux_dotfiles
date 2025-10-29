# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Start ssh agent (https://rabexc.org/posts/pitfalls-of-ssh-agents)
# Check if ssh-add -l returns exit status 2 (no identities found)
if ! ssh-add -l &>/dev/null; then
  # Check if ~/.ssh-agent exists and is readable
  if [ -r ~/.ssh-agent ]; then
    # Load variables from ~/.ssh-agent
    eval $(<~/.ssh-agent) >/dev/null
    # Check again if ssh-add -l returns exit status 2
    if ! ssh-add -l &>/dev/null; then
      # If still no identities found, start a new ssh-agent
      (umask 066; ssh-agent > ~/.ssh-agent)
      eval $(<~/.ssh-agent) >/dev/null
      # Add SSH identities
      ssh-add
    fi
  else
    # If ~/.ssh-agent doesn't exist, start a new ssh-agent
    (umask 066; ssh-agent > ~/.ssh-agent)
    eval $(<~/.ssh-agent) >/dev/null
    # Add SSH identities
    ssh-add
  fi
fi

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
