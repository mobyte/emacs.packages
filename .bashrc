export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH=/usr/local/Cellar/git/current/bin:/Applications/Emacs.app/Contents/MacOS/bin:/Library/PostgreSQL/9.3/bin:/Users/emil.yessenamanov/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/opt/local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/openjdk/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

#PATH=/opt/homebrew/opt/coreutils/libexec/gnubin
export LC_ALL=en_US.UTF-8
export EDITOR=emacsclient
export JAVA_HOME=/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home
#export JAVA_HOME=$(/usr/libexec/java_home -v17)
#export JAVA_HOME=/Users/mobyte/src/jdk-11.0.1.jdk/Contents/Home
#export JAVA_HOME=/Users/mobyte/src/jdk-12.0.1.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export MAVEN_OPTS='-Djsse.enableSNIExtension=false'
export ATLAS_HOME=/usr/local/Cellar/atlassian-plugin-sdk/5.0.4/libexec
export ATLAS_MVN=/usr/local/bin/mvn
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M -Xmx2G"
export HOMEBREW_GITHUB_API_TOKEN=8b73d93825262a5e24fff4c6fc332b5e4b68a71e
export CURRENT_PROJECT="/Users/emil.yessenamanov/repos/rewe/rewe-order-service/"
export docker_beta=true
export HOMEBREW_NO_AUTO_UPDATE=1
export OMS_SERVICE_NAME=OMS123
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

if [ "$TERM" = dumb ] && [ "$INSIDE_EMACS" ]; then
    export TERM=xterm-256color
fi

export BOOT_JVM_OPTIONS="-XX:-OmitStackTraceInFastThrow"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1='\[\033[01;36m\]\w\[\033[00m\]\$ ' # backup

alias ls='ls -G'
alias mvn="mvn $MAVEN_OPTS"
alias git="git --no-pager $*"
alias md5='md5 -r'
alias md5sum='md5 -r'
alias oms="cd /Users/emil.yessenamanov/repos/rewe-order-service/"
alias emacs-conf="cd /Users/emil.yessenamanov/repos/emacs.config/"
alias ec="cd /Users/emil.yessenamanov/repos/emacs.config/"
alias merge-commit='git merge-base @ origin/master'

#launchctl setenv JAVA_HOME /Users/mobyte/src/jdk-11.0.1.jdk/Contents/Home

setjdk() {
  export JAVA_HOME=$(/usr/libexec/java_home -v $1)
}

#setjdk 11

#launchctl limit maxfiles 1024 2048

# if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#     __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
#     GIT_PROMPT_ONLY_IN_REPO=1

#     GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
#     GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules
#     GIT_PROMPT_WITH_VIRTUAL_ENV=0 # uncomment to avoid setting virtual environment infos for node/python/conda environments

#     ## GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
#     GIT_PROMPT_SHOW_UNTRACKED_FILES=no # can be no, normal or all; determines counting of untracked files

#     GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

#     ## GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
#     ## GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

#     ## as last entry source the gitprompt script
#     ## GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
#     ## GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
#     ## GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
#     source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
# fi

##source ~/.zshrc
