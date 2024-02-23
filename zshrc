# Exclude tmux from auto-starting on other terminals
if [ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ] && [ "$TERM_PROGRAM" != "WarpTerminal" ] && [ -n "$PS1" ] && [ -z "$TMUX" ]; then
  ZSH_TMUX_AUTOSTART=true
  ZSH_TMUX_AUTOCONNECT=false
  tmux new-session -A -s main
fi 

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  macos
  copypath
  copyfile
  copybuffer
  aliases
  alias-finder
  fasd
)

if [[ "$TERM_PROGRAM" != "WarpTerminal" ]]; then
  
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  # ========== Brew plugins ==========
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
  # ==================================


  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

  plugins+=(fzf)
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  set -o vi
fi

# ========== pk10 theme ==========
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# ================================
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# ========== Java ========== 
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_17_HOME=$(/usr/libexec/java_home -v17)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java17='export JAVA_HOME=$JAVA_17_HOME'

java11
# ==========================

# ========= Go =========
export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GOOS="darwin"
export GOARCH="arm64"
# ======================

# ========= Rust =========
export RUSTUP_HOME="${HOME}/.rustup"
export CARGO_HOME="${HOME}/.cargo"
# added to path by .zshenv
# ========================

# ========= Custom scripts =========
export PATH="${PATH}:${HOME}/.dotfiles/scripts/utils/bin"
alias pst="pomodoro start"
# ==================================

# ========= Bat ====================
export BAT_THEME="gruvbox-dark"
alias cat="bat -pp"
# ==================================

# ========= Vim / Nvim =========
alias vi="nvim"
alias vim="nvim"
# ==============================

# ========= AWS CLI =========
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
# ===========================

# ========= Graphviz =========
export GRAPHVIZ_DOT=$(which dot)
# ============================

# ========= act =========
alias act="act --container-architecture linux/amd64"
# =======================


# ========= Docker =========
# For building docker on Mac M1
#docker() {
#  if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
#    /usr/local/bin/docker "$1" --platform linux/amd64 "${@:2}"
#  else
#    /usr/local/bin/docker "$@"
#  fi
#}

# ==========================

# ====== Tokens ======
source ~/.tokens.sh
# ====================




# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# conda config --set auto_activate_base false

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

PATH="$(bash --norc -ec 'IFS=:; paths=($PATH);
for i in ${!paths[@]}; do
if [[ ${paths[i]} == "''/Users/jbenitezg/.pyenv/shims''" ]]; then unset '\''paths[i]'\'';
fi; done;
echo "${paths[*]}"')"
export PATH="/Users/jbenitezg/.pyenv/shims:${PATH}"
command pyenv rehash 2>/dev/null

export SPATIALINDEX_C_LIBRARY='/opt/homebrew/Cellar/spatialindex/1.9.3/lib'
