set -U fish_greeting ""
set -U fish_user_paths ~/.local/bin ~/.cargo/bin ~/.cabal/bin ~/.ghcup/bin ~/go/bin ~/.emacs.d/bin
set -Ux RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -Ux RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup
set -Ux GOPRIVATE "*.netisdev.com"

set -g fish_prompt_pwd_dir_length 0

set -g theme_nerd_fonts yes
set -g theme_color_scheme dracula

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

if test "$DESKTOP_SESSION" = "/usr/share/xsessions/i3"
    set -x QT_QPA_PLATFORMTHEME "qt5ct"
    set -x TERMINAL "konsole"
end

set -l ppid (cat /proc/(echo %self)/status | grep PPid | cut -f2)
if string match -r 'tilix' (ps --no-headers -p $ppid -o comm) 1> /dev/null
    for wid in (xdotool search --pid $ppid)
        xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid
    end
end
