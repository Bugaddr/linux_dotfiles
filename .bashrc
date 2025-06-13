# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Export
export PATH="$PATH:~/.local/bin"
export PS1="\[\e[1;32m\]$USER@$HOSTNAME \w \`if [ \$? = 0 ]; then echo -e '\[\e[1;32m\]'; else echo -e '\[\e[1;31m\]'; fi\`\\$ \[\e[0m\]"
#export MOZ_DISABLE_RDD_SANDBOX=1
#export LIBVA_DRIVER_NAME=nvidia
#export NVD_GPU=0
#export __EGL_VENDOR_LIBRARY_FILENAMES='/usr/share/glvnd/egl_vendor.d/10_nvidia.json'
#export VK_ICD_FILENAMES='/usr/share/vulkan/icd.d/nvidia_icd.json'

# ssh-agent https://rabexc.org/posts/pitfalls-of-ssh-agents
ssh-add -l &>/dev/null
if [ "$?" == 2 ]; then
  test -r ~/.ssh-agent && \
    eval "$(<~/.ssh-agent)" >/dev/null
  ssh-add -l &>/dev/null
  if [ "$?" == 2 ]; then
    (umask 066; ssh-agent > ~/.ssh-agent)
    eval "$(<~/.ssh-agent)" >/dev/null
    ssh-add
  fi
fi

## General alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wifite='sudo wifite -mac --daemon --kill'
alias wifi='sudo airmon-ng stop wlan0mon && sudo systemctl restart NetworkManager'
alias la='ls -a'
alias ll='ls -hal'
alias c='clear'
alias e='exit'
alias h='history'
alias hybrid='sudo envycontrol -s hybrid --rtd3 3 --verbose'
alias nvidia='sudo envycontrol -s nvidia --verbose'
alias intel='sudo envycontrol -s integrated --verbose'
alias cdtemp='cd $(mktemp -d)'
alias mirror='sudo reflector --protocol https --latest 50 --age 24 --sort rate --verbose --save /etc/pacman.d/mirrorlist'
alias cam='sudo rmmod uvcvideo; sudo insmod ~/Documents/git/uvc/uvcvideo.ko && echo done'

## Git alias
alias gcl='git clone'
alias gadd='git add -A'
alias gcom='git commit -a'
alias gpu='git push -u'
alias gacp='git add -A && git commit -a && git push'
alias gst='git status -sb'
alias glog='git log'

alias gcp='git cherry-pick'
alias gcpa='gcp --abort'
alias gcps='gcp --skip'
alias gcpc='gcp --continue'

alias gam='git am'
alias gama='gam --abort'
alias gams='gam --skip'
alias gamc='gam --continue'

## Execute
#ssh-add ~/.ssh/bugaddr
#daily-whatis
