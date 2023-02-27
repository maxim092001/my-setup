export SBT_OPTS="-XX:+UseG1GC -Xmx2048M -Xss2M  -Duser.timezone=GMT"
export NNN_PLUG='t:preview-tabbed;i:imgview;p:preview-tui;'

set PATH /Users/maximgran/.local/bin $PATH
#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/maximgran/.ghcup/bin $PATH /Users/maximgran/.local/bin # ghcup-env

fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/homebrew/opt/llvm@12/bin

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
#set -gx PATH $PATH /Users/maximgran/.ghcup/bin # ghcup-env
fish_add_path /Users/maximgran/Library/Application\ Support/Coursier/bin/
set -gx PATH $PATH /Users/maximgran/Library/Application Support/Coursier/bin
# set -gx PATH $PATH /Users/maximgran/.ghcup/ghc/9.2.5/bin
# set -gx PATH $PATH /Users/maximgran/.ghcup/ghc/9.0.2/bin
# export PATH="$PATH:/Users/maximgran/Library/Application Support/Coursier/bin"

# Aliases
alias ls exa
alias ll "exa -ahl"
alias tree "exa --tree"
alias cat "bat -P"

function catp --wraps cat --description 'cat and pbcopy'
    cat $argv | pbcopy
end

# zoxide 
zoxide init fish | source

# opam configuration
source /Users/maximgran/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

# theme_gruvbox dark

# set_onedark

# starship init fish | source

set JAVA_HOME /Users/maximgran/Library/Java/JavaVirtualMachines/coretto-11.0.17



# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 364a82
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
#set -gx PATH $HOME/.cabal/bin $PATH /Users/maximgran/.ghcup/bin # ghcup-env

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /Users/maximgran/.ghcup/bin $PATH # ghcup-env
