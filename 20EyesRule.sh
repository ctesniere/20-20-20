#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    if ! which brew >/dev/null; then
        echo "Install brew ? [Y/N]"
        read PROMPT

        if echo "$PROMPT" | grep -iq "Y"; then
            printf "\e[32m ===> brew is not installed. Installing ...\e[0m\n"
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
    fi

    if which brew >/dev/null; then
        printf "\e[32m ===> brew updating ...\e[0m\n"
        brew update

        if ! which Terminal-notifier >/dev/null; then
            printf "\e[32m ===> terminal-notifier is not installed. Installing ...\e[0m\n"
            brew install terminal-notifier
        fi
    fi

    if ! which Terminal-notifier >/dev/null; then
        printf "\e[32m ===> terminal-notifier is not installed. Installing ...\e[0m\n"
        sudo gem install terminal-notifier
    fi
fi

printf "\n\e[32m ===> Execution of 20-20-20 rule ...\e[0m\n"

while true
do
    sleep $(expr 60 \* 20)

    if [ "$(uname)" == "Darwin" ]; then
        if which Terminal-notifier >/dev/null; then
            Terminal-notifier \
                -contentImage http://www.iconarchive.com/download/i30603/sailorsaturn78/halloween/eye.ico \
                -sound default \
                -title "20-20-20" \
                -group '20EyesRule' \
                -message "Pause de 20 secondes"
        else
            osascript -e 'tell app "System Events" to display dialog "Pause de 20 secondes"'
        fi


    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        zenity --info --text "Pause de 20 secondes"

    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
        echo "Pause de 20 secondes"
    fi

    sleep 20
done
