source "$ZDOTDIR/zsh.d/compinit.zsh"
source "$ZDOTDIR/zsh.d/prompt.zsh"
source "$ZDOTDIR/zsh.d/history.zsh"
source "$ZDOTDIR/zsh.d/fzf.zsh"
source "$ZDOTDIR/zsh.d/aliases.zsh"
source "$ZDOTDIR/zsh.d/tmux.zsh"
source "$ZDOTDIR/zsh.d/vi.zsh"
source "$ZDOTDIR/zsh.d/plugins.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.private/.private.zsh ] && source ~/.private/.private.zsh
[ -f ~/.work/.work.zsh ] && source ~/.work/.work.zsh

# zmodload zsh/zprof
# zprof
