#!/bin/sh

darwin () {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

linux () {
    sudo apt install -y make
    sudo apt install python3
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    darwin
elif [[ "$OSTYPE" == "linux+gnu" ]]; then
    linux
fi
