[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_COLOR=magenta
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_PREFIX="\b@"
SPACESHIP_HOST_COLOR="red"
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_COLOR="green"
SPACESHIP_CHAR_SYMBOL_ROOT="# "
SPACESHIP_CHAR_SYMBOL="$ "
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
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
