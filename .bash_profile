export PS1="\w=>"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function tmux-start {
  chmod 777 /tmp/mysession
  tmux -S /tmp/tmux-session new -s mysession
  #tmux -S /tmux/prog new-session -s prog
}

function tmux-join {
  tmux -S /tmp/tmux-session attach -t mysession
  #tmux -S /tmux/prog attach
}

