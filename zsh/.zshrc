source "$ZDOTDIR/zsh.d/compinit.zsh"
source "$ZDOTDIR/zsh.d/prompt.zsh"
source "$ZDOTDIR/zsh.d/history.zsh"
source "$ZDOTDIR/zsh.d/fzf.zsh"
source "$ZDOTDIR/zsh.d/aliases.zsh"
source "$ZDOTDIR/zsh.d/tmux.zsh"
source "$ZDOTDIR/zsh.d/vi.zsh"
source "$ZDOTDIR/zsh.d/plugins.zsh"

[ -f ~/.private/.private.zsh ] && source ~/.private/.private.zsh
[ -f ~/.work/.work.zsh ] && source ~/.work/.work.zsh
[ -f ~/.bun/_bun ] && source ~/.bun/_bun

# zmodload zsh/zprof
# zprof
