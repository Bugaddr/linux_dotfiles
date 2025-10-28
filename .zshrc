# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
# https://stackoverflow.com/questions/62931101/i-have-multiple-files-of-zcompdump-why-do-i-have-multiple-files-of-these
export ZSH_COMPDUMP="$ZSH/cache/.zcompdump-$HOST"
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gentoo"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='nano'
else
 export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# My alias
alias hybrid='sudo envycontrol -s hybrid --rtd3 2 --force-comp --verbose'
alias nvidia='sudo envycontrol -s nvidia --force-comp --verbose'
alias intel='sudo envycontrol -s integrated --force-comp --verbose'
alias cdtemp='cd $(mktemp -d)'
alias updatemirror='sudo reflector --protocol https --latest 20 --age 24 --sort rate --verbose --country IN,SG --save /etc/pacman.d/mirrorlist'
alias wifite='sudo wifite -mac --daemon --kill; sudo airmon-ng stop wlan0mon; sudo systemctl restart NetworkManager'
alias userjs='~/.mozilla/updater.sh -l -s -o ~/.mozilla/user-overrides.js'
alias changemac='sudo systemctl stop NetworkManager; sudo macchanger -a wlan0; sudo systemctl start NetworkManager '
alias loginwifi="changemac; sleep 5; curl 'http://172.16.177.5:8090/login.xml' -X POST --data-raw 'mode=191&username=pawarpa&password=msvw88&producttype=0'"
alias turbo1='sudo x86_energy_perf_policy --turbo-enable 1'
alias turbo0='sudo x86_energy_perf_policy --turbo-enable 0'
alias quiet='echo quiet | sudo tee /sys/firmware/acpi/platform_profile; powerprofilesctl set power-saver'
alias balanced='echo balanced | sudo tee /sys/firmware/acpi/platform_profile; powerprofilesctl set balanced'
alias perf='echo balanced-performance | sudo tee /sys/firmware/acpi/platform_profile; powerprofilesctl set performance'
alias pp='cat /sys/firmware/acpi/platform_profile'
alias dot='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias e='exit'
alias suspend='systemctl suspend'
alias 144='hyprctl keyword monitor eDP-1,2560x1440@144,auto,auto'
alias 165='hyprctl keyword monitor eDP-1,2560x1440@165,auto,auto'
alias 60='hyprctl keyword monitor eDP-1,2560x1440@60,auto,auto'
alias nano='nvim'
alias vlc='$HOME/.local/bin/vlchidpi'
