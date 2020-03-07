# .zshrc (use zplug)
export ZSH=~/.oh-my-zsh

#alias Start Text
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "
source ~/.zplug/init.zsh

# Plugins
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/command-not-found",   from:oh-my-zsh
zplug "plugins/pip",   from:oh-my-zsh
zplug "plugins/tmux",   from:oh-my-zsh
zplug "plugins/tmuxinator",   from:oh-my-zsh
zplug "plugins/urltools",   from:oh-my-zsh
#zplug "plugins/fasd",   from:oh-my-zsh

zplug "lib/completion",   from:oh-my-zsh
zplug 'lib/key-bindings', from:oh-my-zsh
zplug "lib/directories",  from:oh-my-zsh

zplug "modules/ssh",        from:prezto
zplug "hlissner/zsh-autopair", defer:2
zplug "b4b4r07/enhancd", use:init.sh
zplug "djui/alias-tips"
zplug "wfxr/forgit"
zplug "seletskiy/zsh-git-smart-commands"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"

#zplug 'dracula/zsh', as:theme
zplug romkatv/powerlevel10k, as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

#lsd alias
alias ls='lsd'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

function fif() {
  if [ ! "$#" -gt 0 ]; then echo "검색어를 입력해주세요."; return 1; fi
  rg --files-with-matches --no-messages $2 "$1" | fzf\
  --border\
  --height 80%\
  --extended\
  --ansi\
  --reverse\
  --cycle\
  --header 'Find in File'\
  --bind 'f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort'\
  --bind 'ctrl-p:preview-up,ctrl-n:preview-down'\
  --bind 'ctrl-u:half-page-up,ctrl-d:half-page-down'\
  --bind '?:toggle-preview,alt-w:toggle-preview-wrap'\
  --bind 'ctrl-v:execute(vim {} >/dev/tty </dev/tty)'\
  --preview "bat --theme='OneHalfDark' --style=numbers --color=always {} | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

function sdt() {
  local dir
  dir=$(fd --type d --hidden --follow --exclude .git 2>/dev/null | fzf\
  --header 'Search In Directory'\
  --border\
  --height 80%\
  --extended\
  --ansi\
  --reverse\
  --cycle\
  --header 'Search Directory'\
  --bind 'alt-p:preview-up,alt-n:preview-down'\
  --bind 'ctrl-u:half-page-up,ctrl-d:half-page-down'\
  --bind "alt-s:execute(lsd {})+abort"\
  --bind '?:toggle-preview,alt-w:toggle-preview-wrap'\
  --bind 'alt-v:execute($EDITOR {$FZF_PATH_LOC} >/dev/tty </dev/tty)'\
  --preview 'lsd --color=always --tree --depth=2  {} | head -200 2>/dev/null'\
  --preview-window=right:50%) && cd "$dir"
}

# Then, source plugins and add commands to $PATH
zplug check || zplug install
zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
