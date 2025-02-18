# Auto activate virtual env on cd
function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]]; then
    # Check for both .env and .venv folders in the current directory and its parents
    current_dir="$PWD"
    while [[ "$current_dir" != "/" ]]; do
      for env_dir in .env .venv; do
        if [[ -d "$current_dir/$env_dir" && -x "$current_dir/$env_dir/bin/python" ]]; then
          source "$current_dir/$env_dir/bin/activate"
          return
        fi
      done
      current_dir="$(dirname "$current_dir")"
    done
  else
    # Check if the current folder is a subdirectory of the VIRTUAL_ENV folder
    parentdir="$(dirname "$VIRTUAL_ENV")"
    if [[ "$PWD"/ != "$parentdir"/* ]]; then
      deactivate
    fi
  fi
}

# Function to load environment variables from a specified file
loadenv() {
  local env_file="$1"

  if [[ -z "$env_file" ]]; then
    env_file=".env"
    read -p "No file path provided. Use .env from current directory? ($PWD/.env) [y/N] " response

    case "$response" in
    [yY][eE][sS] | [yY])
      : # continue with default
      ;;
    *)
      echo "Operation cancelled" >&2
      return 1
      ;;
    esac
  fi

  # Expand the path
  env_file=$(realpath -q "$env_file" 2>/dev/null || echo "$env_file")

  # Check if file exists
  if [[ ! -f "$env_file" ]]; then
    echo "Error: File '$env_file' not found" >&2
    return 1
  fi

  # Check if file is readable
  if [[ ! -r "$env_file" ]]; then
    echo "Error: File '$env_file' is not readable" >&2
    return 1
  fi

  echo "Loading environment variables from: $env_file"

  # Load variables using set -a (allexport)
  set -a
  source "$env_file"
  set +a

  echo "Successfully loaded environment variables from '$env_file'"
}

_load_env_completion() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=($(compgen -f -- "$cur"))
}
complete -F _load_env_completion load_env

#Create new directory and enter it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Timestampped backup of a file in same directory
bkp() {
  local file="$1"
  local timestamp=$(date +"%Y-%m-%d-%H%M%S")
  local backup_file="${file}.${timestamp}.bak"

  cp "$file" "$backup_file"
  echo "Backup created: $backup_file"
}

# Open current git repository in browser
gitopen() {
  local remote_url=$(git config --get remote.origin.url)
  if [[ -z "$remote_url" ]]; then
    echo "Error: No remote URL found" >&2
    return 1
  fi

  # Check if the remote URL is a SSH URL, and convert it to HTTPS (primarily for GitHub)
  if [[ "$remote_url" == git@* ]]; then
    remote_url=$(echo "$remote_url" | sed -E 's/^git@([^:]+):(.+)$/https:\/\/\1\/\2/')
  fi

  echo "Open in browser: $remote_url ? [y/N]"
  read -r response
  case "$response" in
  [yY][eE][sS] | [yY])
    xdg-open "$remote_url"
    ;;
  *)
    echo "Operation cancelled" >&2
    return 1
    ;;
  esac
}

# Show custom functions and aliases
userhelp() {
  local search="$1"
  local bashrc_dir="$HOME/.bashrc.d"

  if [[ -n "$search" ]]; then
    echo "🔍 Searching for: $search"
    echo "───────────────────────"
    grep -h -i "$search" "$bashrc_dir"/{aliases,functions}.sh 2>/dev/null
    return
  fi

  echo "📚 Custom Functions & Aliases"
  echo "───────────────────────"

  # Print functions
  if [[ -f "$bashrc_dir/functions.sh" ]]; then
    echo "   Functions (functions.sh):"
    grep -h "^[[:space:]]*function[[:space:]]*.*()[[:space:]]*{\|^[[:space:]]*.*()[[:space:]]*{" "$bashrc_dir/functions.sh" |
      sed 's/function[[:space:]]*//g' |
      sed 's/()[[:space:]]*{.*$//' |
      sed 's/^[[:space:]]*/  /'
  fi

  # Print aliases
  if [[ -f "$bashrc_dir/aliases.sh" ]]; then
    echo -e "\n  Aliases (aliases.sh):"
    grep -h "^[[:space:]]*alias.*=" "$bashrc_dir/aliases.sh" |
      sed 's/alias \([^=]*\)=.*/  \1/' | sort
  fi

  echo -e "\n💡 Tip: Use 'userhelp search_term' to search"
}
