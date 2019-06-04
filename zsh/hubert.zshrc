# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/hubert/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
if [ "$(uname)" = "Darwin" ]; then
    ZSH_THEME="hubert"
else
    ZSH_THEME="dha"
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugin=(git git-flow pyenv pylint python)
#if [ "$(uname)" = "Darwin" ]; then
#    plugin="osx ${plugin}"
#else
#    plugin="${plugin} tmux"
#fi
#plugins=(${plugin})

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


#############
# for Linux #
#############
if [ "$(uname)" = "Linux" ]; then
    alias ls="ls --color=auto"
fi


###########
# for Mac #
###########
if [ "$(uname)" = "Darwin" ]; then
    alias ls="ls -G"
    alias ldd="otool -L"
	alias ctags="$(brew --prefix)/bin/ctags"
fi


###########
# exports #
###########
export EDITOR=vim
unset SSH_ASKPASS

if [ -d /daum/program ]; then
    export PKG_CONFIG_PATH=/daum/program/lib/pkgconfig:$PKG_CONFIG_PATH
    export LD_LIBRARY_PATH=/daum/program/lib:/usr/local/cuda/lib64:$LD_LIBRARY_PATH
    export PATH=/daum/program/bin:/daum/program/maven/bin:$PATH

    if [ -d /daum/program/java ]; then
        export JAVA_HOME=/daum/program/java
        export PATH=$JAVA_HOME/bin:$PATH
    fi

    if [ -d /daum/program/scala ]; then
        export SCALA_HOME=/daum/program/scala
        export PATH=$SCALA_HOME/bin:$PATH
    fi

    if [ -d /daum/program/pyenv ]; then
        export PATH=/daum/program/pyenv/bin:$PATH
    fi

    if [ -d /daum/program/direnv ]; then
        export PATH=/daum/program/direnv/bin:$PATH
    fi

    if [ -d /daum/program/cmake ]; then
        export PATH=/daum/program/cmake/bin:$PATH
    fi
fi

export DISPOSABLE_DIR=$HOME/workspace/disposable
if [ -d $DISPOSABLE_DIR ]; then
    export PYTHONPATH=$DISPOSABLE_DIR/lib:$PYTHONPATH
    export PATH=$DISPOSABLE_DIR/bin:$PATH
fi
export PYTHONIOENCODING=UTF-8

if [ -d $HOME/.cabal ]; then
    export PATH=$HOME/.cabal/bin:$PATH
fi

if [ -f /etc/profile ]; then
	source /etc/profile
fi
export TMOUT=0    # do not close idle shell cursor

###########
# aliases #
###########
alias ll="ls -al"
alias vi=vim
alias grep="grep --color=auto"
alias sort="LC_ALL=C sort -S 4g"
alias cpplint="cpplint.py --extensions=h,hh,hpp,c,cc,cpp --linelength=100"
alias tmx="\\tmux -L hubert attach || \\tmux -L hubert"


#############
# functions #
#############
function han {
    ssh hanadmin@search-$1.dakao.io
}


##########
# others #
##########
ulimit -c unlimited

eval "$(direnv hook zsh)"
