# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -r ~/.zshrc -a -r ~/.zshrc.global -a ! -r ~/.zshrc.local ] ; then
    printf '-!-\n'
    printf '-!- Looks like you are using the old zshrc layout of grml.\n'
    printf '-!- Please read the notes in the grml-zsh-refcard, being'
    printf '-!- available at: http://grml.org/zsh/\n'
    printf '-!-\n'
    printf '-!- If you just want to get rid of this warning message execute:\n'
    printf '-!-        touch ~/.zshrc.local\n'
    printf '-!-\n'
fi

## Functions
# rclone 
rem (){
    case $1 in
        g) remote='google_rm:'; dev='/home/serg/GoogleDrive' ;;
        y) remote='yandex_rm:'; dev='/home/serg/yandex' ;;
        o) remote='onedrive_rm:'; dev='ome/serg/onedrive' ;;
        *) echo "'$1' нет такого облака" ;;
    esac
    rclone mount $remote $dev >& /dev/null &
}
## Aliases
alias ctrc='xclip -selection clipboard'
alias ctrv='xclip -selection clipboard -o '
alias cat='vimcat'
alias -s avi=mplayer
alias -s mkv=mplayer
alias ls='ls --color=auto'
#alias vifm='vifmrun'
##END Aliases
zstyle :compinstall filename '/home/serg/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' menu yes select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:processes' command 'ps -xuf'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
setopt  APPEND_HISTORY
setopt  HIST_IGNORE_ALL_DUPS
setopt  HIST_IGNORE_SPACE
setopt  HIST_REDUCE_BLANKS
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
