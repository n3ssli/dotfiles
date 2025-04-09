#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/  \1/'
}

PS1='\[\e[38;5;141m\]┏━[\[\e[38;5;213m\]\u\[\e[38;5;141m\]]━[\[\e[38;5;213m\]\w\[\e[38;5;141m\]]\[\e[38;5;177m\]$(parse_git_branch)\[\e[38;5;141m\]\n┗━>\[\e[0m\] '
eval "$(starship init bash)"

alias pfetch='clear && neofetch --config ~/.config/neofetch/config.conf --source ~/.config/neofetch/ascii/arch_3d.txt --colors 5 5 13 13 5 5'
alias pfetch3d='clear && neofetch --config ~/.config/neofetch/config.conf --source ~/.config/neofetch/ascii/arch_3d_enhanced.txt --colors 5 5 13 13 5 5'
alias archfetch='clear && neofetch --config ~/.config/neofetch/config.conf --source ~/.config/neofetch/ascii/arch_ultra.txt --colors 5 5 5 13 13 13'
alias archornate='clear && neofetch --config ~/.config/neofetch/config.conf --source ~/.config/neofetch/ascii/arch_ornate.txt --colors 5 5 5 13 13 13'
alias archfuture='clear && neofetch --config ~/.config/neofetch/config.conf --source ~/.config/neofetch/ascii/arch_future.txt --colors 5 13 5 13 5 7'
alias bashrc='nano ~/.bashrc'
alias hypr='nano ~/.config/hypr/hyprland.conf'
