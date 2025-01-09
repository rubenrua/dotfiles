if not status is-interactive
    # No interactive sessions
    return
end


set -Ux EDITOR emacs
set -g fish_escape_delay_ms 500
set fish_greeting

# ALT+L Sets word to lowercase as emacs
bind \el downcase-word

alias cat=bat
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias ffmpeg="ffmpeg -hide_banner"
alias ffprobe="ffprobe -hide_banner"

zoxide init fish --cmd j | source

# gst-plugins-rs build workaround
set -Ux SODIUM_USE_PKG_CONFIG 1