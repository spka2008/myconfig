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

## Aliases
alias ctrc='xclip -selection clipboard'
alias ctrv='xclip -selection clipboard -o '
##END Aliases
zstyle :compinstall filename '/home/serg/.zshrc'
autoload -Uz compinit
compinit
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
bindkey '^[OA' history-beginning-search-backward
bindkey '^[OB' history-beginning-search-forward
