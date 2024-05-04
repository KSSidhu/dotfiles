set fish_greeting ""

set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"

set -gx EDITOR nvim
# Rust PATH
set -gx PATH "$HOME/.cargo/bin" $PATH;

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls="eza --icons=always"
