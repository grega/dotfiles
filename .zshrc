# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/greg/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(asdf aws git git-open golang wd)

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
export EDITOR=nano
export VISUAL="$EDITOR"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cw='watch -n'
alias dc="docker-compose"
alias dcu="docker compose up --remove-orphans"
alias g="git"
alias hdash="heroku_dashboard"
alias gop="git-open"
alias gpl="git pull"
alias gs="git status"
alias pwg='(){ echo -n $(pwgen -s $1 1) | pbcopy && echo "Random password of length $1 copied to clipboard"; }'
alias pwgs='(){ echo -n $(pwgen -sy $1 1) | pbcopy && echo "Random password (including symbols) of length $1 copied to clipboard"; }'
alias rmi="rm -rI"
alias tf="terraform"
alias v="vagrant"

# Credentials
#source ~/.aws/credentials # automatically sourced by AWS CLI, Terraform CLI...
source ~/.betterstack/credentials
source ~/.cloudflare/credentials
source ~/.digitalocean/credentials
source ~/.hydra/credentials
source ~/.github/credentials
source ~/.heroku/credentials

# Fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# GoLang
export GOPATH=/Users/greg/Dev/go

export EDITOR="code -w"

export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# asdf
unset ASDF_DIR
source $(brew --prefix asdf)/libexec/asdf.sh
export PATH="${HOME}/.pyenv/shims:${PATH}"
export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/greg/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/greg/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/greg/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/greg/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# command to open Heroku dashboard in a browser, given the URL (HEROKU_PIPELINE_URL) is set in .env file
heroku_dashboard() {
    get_heroku_url_from_env() {
        if [ ! -f ".env" ]; then
            echo "No .env file found in the current directory."
            return 1
        fi

        source .env

        if [[ -z "${HEROKU_PIPELINE_URL}" ]]; then
            echo "HEROKU_PIPELINE_URL not set in .env file."
            return 1
        fi

        echo "${HEROKU_PIPELINE_URL}"
    }

    # get Heroku URL from .env file
    heroku_pipeline_url=$(get_heroku_url_from_env)
    if [[ $? -ne 0 ]]; then
        echo "Error: $heroku_pipeline_url"
        return 1
    fi

    open "$heroku_pipeline_url"
}
