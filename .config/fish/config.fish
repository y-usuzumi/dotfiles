set -U fish_greeting ""
set -U fish_user_paths ~/.local/bin ~/.cargo/bin ~/.cabal/bin ~/.ghcup/bin ~/go/bin ~/.emacs.d/bin ~/.yarn/bin
set -Ux RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -Ux RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup
set -Ux GOPRIVATE "*.netisdev.com"
set -Ux EDITOR nvim

set -g fish_prompt_pwd_dir_length 0

set -g theme_nerd_fonts yes
set -g theme_color_scheme dracula
# set -g theme_color_scheme gruvbox

eval (python -m virtualfish auto_activation global_requirements compat_aliases)

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

source ~/.aliases

# nvm
function nvm
    bass source /usr/share/nvm/init-nvm.sh --no-use ';' nvm $argv
end

function _wine32prefix
    env WINEPREFIX=$HOME/.wine32 $argv
end

function wine32
    _wine32prefix wine $argv
end

function winetricks32
    _wine32prefix winetricks $argv
end

function regedit32
    _wine32prefix regedit $argv
end

function winecfg32
    _wine32prefix winecfg
end

if test "$DESKTOP_SESSION" = "/usr/share/xsessions/i3"
    set -x QT_QPA_PLATFORMTHEME "qt5ct"
    set -x TERMINAL "konsole"
end

# https://github.com/y-usuzumi/j
function j
    eval (eval ".j $argv")
end

