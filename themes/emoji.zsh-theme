
declare BG_COLOR
declare FG_COLOR

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" 📌"
ZSH_THEME_GIT_PROMPT_CLEAN=" 📎"
ZSH_THEME_GIT_PROMPT_UNTRACKED="📣"
ZSH_THEME_GIT_PROMPT_MODIFIED="🥴"
ZSH_THEME_GIT_PROMPT_DELETED="🗑"

function prompt_name {
    FG_COLOR="032"
    echo "%B%F{$FG_COLOR}%K{$BG_COLOR}(%n@$HOST)%k%f%b"
}

function prompt_pwd {
    FG_COLOR="076"
    echo "%B%F{$FG_COLOR}%K{$BG_COLOR}%3~%k%f%b"
}


function prompt_git_branch {
    git_info="$(git_prompt_info)"
    if [ ! -z $git_info ]; then
        git_status=`git status -s`
        if [ -z $git_status ]; then
            BG_COLOR="022"
            FG_COLOR="015"
        else
            BG_COLOR="184"
            FG_COLOR="016"
        fi
        echo "%K{202} %F{015}\uE0A0%f %k%F{202}%K{$BG_COLOR}\ue0b0%f %K{$BG_COLOR}%F{$FG_COLOR}${git_info} %f%k%F{$BG_COLOR}\ue0b0%f"
    fi
}


PROMPT='

%(?.😎.🤬)$(prompt_name) ⚡️$(prompt_pwd) %B $(nvm_prompt_info)
 👉 '


RPROMPT='%B$(prompt_git_branch)$(git_prompt_status)%b'

