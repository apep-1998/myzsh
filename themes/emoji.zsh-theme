
declare BG_COLOR
declare FG_COLOR

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{202}\ue0b2%f%K{202} %F{white}\uE0A0%f %k%K{022}%F{202}\ue0b0%f "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" \u00b1"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✅"
ZSH_THEME_GIT_PROMPT_UNTRACKED="📣"
ZSH_THEME_GIT_PROMPT_MODIFIED="🥴"
ZSH_THEME_GIT_PROMPT_DELETED="🗑"

function prompt_name {
    FG_COLOR="033"
    echo "%B%F{$FG_COLOR}%K{$BG_COLOR}(%n@$HOST)%k%f%b"
}

function prompt_pwd {
    FG_COLOR="076"
    echo "%B%F{$FG_COLOR}%K{$BG_COLOR}%3~%k%f%b"
}

PROMPT='

%(?.😎.🤬)$(prompt_name) ⚡️$(prompt_pwd) %B$(git_prompt_info) $(git_prompt_status)%b%{$reset_color%}
👉 '


RPROMPT=''

