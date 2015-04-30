# Alias para seguridad
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias c='clear'
alias ll='ls -l'
alias l='ls -la'
alias ..='cd ..'

# We need an alias to get docker works with sudo
alias docker='sudo docker'
alias tclsh='rlwrap tclsh'
alias wish='rlwrap wish'

# Thanks to Pedro borracha
#export PS1="\n\[\033[1;37m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;31m\]\u@\h'; fi)\[\033[1;37m\])\342\224\200(\$(if [[ \$? == 0 ]];
#then echo \"\[\033[01;32m\]\342\234\223\";
#else echo \"\[\033[01;31m\]\342\234\227\"; fi)\[\033[1;37m\])\342\224\200(\[\033[1;36m\]\@ \d\[\033[1;37m\])\[\033[1;37m\]\n\342\224\224\342\224\200(\[\033[1;32m\]\w\[\033[1;37m\])\342\224\200(\[\033[1;32m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -lah | grep -m 1 total | sed 's/total //')b\[\033[1;37m\])\342\224\200> \[\033[0m\]"
#

#Raspberry
alias raspberry='ssh pi@noriaf.ddns.net'

alias mc='mc -b'
