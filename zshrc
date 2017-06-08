# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jujutheme"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

#Powerline stuff
POWERLINE_PATH="short"
POWERLINE_RIGHT_A="exit-status-on-fail"

DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:/opt/android-sdk/platform-tools/:$PATH
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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias netrestart="sudo systemctl restart netctl-auto@wlp5s0.service"

export QT_X11_NO_MITSHM=1

export VISUAL=vim
export EDITOR="$VISUAL"

source /usr/share/zsh-dwim/init.zsh


alias comp="g++ -std=c++1z -O2 -Wall -Wextra "
alias compd="g++ -std=c++1z -g3 -Weverything -Wno-shadow-field-in-constructor -Wno-c++98-compat -Wno-missing-prototypes -Wno-c++98-compat-pedantic -Wno-shorten-64-to-32 -Wno-missing-variable-declarations -Wno-exit-time-destructors -Wno-global-constructors -Wno-padded -Wno-sign-conversion -fsanitize=undefined -fsanitize=address -D_GLIBCXX_DEBUG "
alias compo="clang++ -std=c++1z -O3 -march=native -Wall -Wextra "

alias touchrestart="sudo rmmod psmouse ; sudo insmod /usr/lib/modules/$(uname -r)/kernel/drivers/input/mouse/psmouse.ko.gz"

alias dcj='~/contests/codejam/dcj/dcj.sh'

alias newsandbox="isolate --init --cg"
alias sandbox="isolate --dir=etc --dir=boot --dir=home --dir=opt --dir=root --dir=sbin --dir=tmp --cg --cg-timing --chdir=$(pwd) --full-env --processes=100 --meta=/tmp/boxmeta --run "
alias sandboxmem="isolate --dir=etc --dir=boot --dir=home --dir=opt --dir=root --dir=sbin --dir=tmp --cg --cg-mem=4194304 --cg-timing --chdir=$(pwd) --full-env --mem=4194304  --processes=100 --meta=/tmp/boxmeta --run "

export TERM=xterm-256color

# Report CPU usage for commands running longer than 1 seconds
REPORTTIME=1

#always use a server for vim
alias vim='vim --servername vim'
