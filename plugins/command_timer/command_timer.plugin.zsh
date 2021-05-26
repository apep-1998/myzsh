
# ===================================== plugin config
declare -i MIN_SEC_TRACK=3
declare ALERT_AFTER_FINISH=true
declare -i MIN_SEC_ALERT=3


# ===================================== private variable
declare -i timestamp_start=0
declare -i timestamp_finish
declare -i timestamp_diff

function get_timestamp {
    echo `date +"%s"`
}

function echo_time_duration {
    # inputs:
    #           @duration_sec => 

    declare -i duration_sec=$1
    declare -i columns="$(tput cols)"
    declare echo_text=""


    if [ $duration_sec -gt $MIN_SEC_TRACK ]; then
        hours=$((duration_sec/3600))
        mins=$((duration_sec%3600/60))
        secs=$((duration_sec%60))
        echo_text=""
        [ $hours -ne 0 ] && echo_text="$echo_text ${hours}h:"
        [ $mins -ne 0 ] && echo_text="$echo_text${mins}m:"
        [ $secs -ne 0 ] && echo_text="$echo_text${secs}s ⏰"
        printf "%*s\n" $(( columns - 2)) "$echo_text"
    fi
    [ $ALERT_AFTER_FINISH ] && [ $duration_sec -gt $MIN_SEC_ALERT ] && notify-send -a Terminal "Your command executed in $echo_text"

}

function pre_exec {
    timestamp_start=$(get_timestamp)
}

function post_exec {
    if [ $timestamp_start -ne 0 ]; then
      timestamp_finish=$(get_timestamp)
      timestamp_diff=$((timestamp_finish - timestamp_start))
      echo_time_duration $timestamp_diff
    fi
    timestamp_start=0
}

autoload -U add-zsh-hook
add-zsh-hook preexec pre_exec
add-zsh-hook precmd post_exec
