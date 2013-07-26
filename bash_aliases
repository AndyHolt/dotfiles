## ~/.bash_aliases: loaded by ~/.bashrc
## contains alias definitions for shell

## ls aliases:
# pipe ls into less pager
alias lp='ls | less'
# pipe ls -l into less pager
alias llp='ls -alF | less'
alias LS='ls'


## emacs aliases
alias emacs='emacsclient -c -a=""'
alias e='emacsclient -c -a=""'

## xdg-open
alias o='xdg-open'

## directory changing
alias db='cd ~/Dropbox'
alias doc='cd /storage/Documents'
alias 2a='cd /storage/Documents/Uni/PartIIA/'
alias cu='cd ~/Dropbox/Shared\ CICCU/'

## show MAC address
alias MAC='ifconfig | grep -i hwaddr'

## show IP address
alias IP='ifconfig | grep -i inet'

## ssh to CUED gate server
alias se='ssh ah635@gate.eng.cam.ac.uk'
alias sxe='ssh -X ah635@gate.eng.cam.ac.uk'

## start ArgoUML application
alias ArgoUML='java -jar ~/ArgoUML/argouml-0.34/argouml.jar'

## run script to backup data files
alias backup_data='~/Shell_Scripts/backupdata'
