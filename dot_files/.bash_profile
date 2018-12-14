# Include the bash profile colours
. ~/.bash_profile_colours

# Make Tab autocomplete regardless of filename case
set completion-ignore-case on

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Required for subl
PATH="~/bin:$PATH"

GITPS1="\$(__git_ps1 \"(%s)\")"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function smart_git_push() {
  git push --set-upstream origin `git symbolic-ref --short HEAD`
}

PS1="\n$bldcyn\W $bldpur\$(parse_git_branch): $txtrst"

alias .bash_profile="subl ~/.bash_profile"
alias .gitconfig="subl ~/.gitconfig"

## RAILS SPECIFIC
alias devlog="tail -f -n 200 log/development.log"
alias testlog="tail -f -n 200 log/test.log"
alias be="bundle exec"
alias bo="EDITOR=sublime bundle open"
alias bu="bundle update"
alias findroutes="rails routes | grep"
alias fuckshitup="be rake db:drop db:create db:migrate && be rake db:seed db:test:prepare"
alias fs="foreman start -m web=1,resque=1,watch=1,serve=1"
alias schema="rails db:schema:dump"
alias reseed="rake db:drop db:create && rake db:migrate && rake db:seed"

## GIT
alias ga="git add"
alias gbr="git branch"
alias gco="git_smart_checkout" # https://github.com/jordanmaguire/git_smart_checkout
alias gcom="git checkout master"
alias gcop="git checkout -"
alias gp="git push"
alias gpl="git pull"
alias gpu="smart_git_push" # git push upstream
alias grc="git rebase --continue"
alias gsd="git_smart_branch_destroy" # https://github.com/jordanmaguire/git_smart_branch_destroy
alias gsm="git_smart_merge" # https://github.com/jordanmaguire/git_smart_merge
alias gsp="git_smart_prune" # https://github.com/jordanmaguire/git_smart_prune
alias gst="git status"
alias diffupstream="git diff @{upstream}"

# Heroku
alias hl="heroku local"

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
