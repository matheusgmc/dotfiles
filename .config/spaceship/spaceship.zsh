SPACESHIP_USER_SHOW=always
SPACESHIP_NODE_SHOW=true
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL="❯"

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  rust          # Rust section
  node		      # Node.js section
  exec_time     # Execution time
  line_sep     # Line break
  # vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

