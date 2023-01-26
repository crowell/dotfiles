[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_COLOR=135
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_HOST_COLOR=166
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_COLOR=118
SPACESHIP_CHAR_SYMBOL_ROOT="# "
SPACESHIP_CHAR_SYMBOL="$ "
SPACESHIP_CHAR_COLOR_SUCCESS="gray"
SPACESHIP_CHAR_COLOR_FAILURE="gray"
SPACESHIP_GIT_PREFIX="("
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_BRANCH_COLOR="cyan"
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  dotnet        # .NET section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
source ~/.zsh/spaceship-prompt/spaceship.zsh

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

alias vim=nvim
alias vi=nvim

fpath=(/opt/local/share/zsh/site-functions $fpath)

eval "$(rbenv init - zsh)"
source /opt/local/share/nvm/init-nvm.sh

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
alias ll="ls -alG"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
