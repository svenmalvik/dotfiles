alias ll='ls -latr'
alias _aws='ssh -i ~/.ssh/aws/*.pem $AWS_USER@devops.town'
alias _gpcp="git pull; git commit -m \"I have no comment.\"; git push"

__git_ps1 () 
{
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf " (%s)" "${b##refs/heads/}";
    fi
}

IBlack="\[\033[0;90m\]"       # Black
Green="\[\033[0;32m\]"        # Green
IRed="\[\033[0;91m\]"         # Red
BYellow="\[\033[1;33m\]"      # Yellow
Yellow="\[\034[0;33m\]"       # Yellow

# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better
source /etc/bash_completion.d/git
export PS1=$IBlack$Time24h$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$BYellow$PathShort$Color_Off'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$Yellow$PathShort$Color_Off'\$ "; \
fi)'

#source .bashrc_home
source .bashrc_hb
tmux
