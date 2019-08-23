#source ~/.bashrc
network=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')
if [[ $network == "CalVisitor" ]]; then
    echo You\'re on Calvisitor, fix that
fi

alias pip='pip3'
alias python='python3'
#Aliases
PS1="%~$ %"

# added by Anaconda3 5.2.0 installer
export PATH="/Users/Danny/anaconda3/bin":$PATH
ec2() {
    ssh -i ~/Desktop/MCServer/MCServer.pem ec2-user@ec2-54-245-66-34.us-west-2.compute.amazonaws.com
}

ec3(){
    ssh -i "~/Desktop/MCServer/MCBigServer.pem" ec2-user@ec2-54-68-146-217.us-west-2.compute.amazonaws.com
}
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias school="cd /Users/Danny/Documents/school/Berkeley/Sem_8"
u=aia
start() {
    ssh -i ~/.ssh/cs161 -t cs161-$u@hive$((36#${u:2}%26+1)).cs.berkeley.edu \~cs161/proj1/start
}
stop(){
    ssh -i ~/.ssh/cs161 -t cs161-$u@hive$((36#${u:2}%26+1)).cs.berkeley.edu \~cs161/proj1/stop
}
ssh(){
    
    network=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}')
    if [[ $network == "CalVisitor" ]]; then
        echo You\'re on Calvisitor, fix that
        return
    fi

    if [[ $1 == "cs161" ]]; then
     ssh -i ~/.ssh/cs161 cs161-aia@hive10.cs.berkeley.edu
    else
    command ssh $@
    fi
}
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export CLICOLOR=1
alias sl='ls'
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'
alias cs="cd ~/Documents/CS"
alias CS="cs"
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
 zle -N edit-command-line
 bindkey '^xe' edit-command-line
 bindkey '^x^e' edit-command-line

 echo remember your ctrl-x-e!
 echo killing disk space warning daemon
killall diskspaced

git(){
    if [[ $1 == "send" ]]; then
        git commit -am $2
        git push
    else
    command git $@
    fi
}
