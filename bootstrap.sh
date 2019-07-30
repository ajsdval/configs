#!/bin/bash

darwin () {
    if hash brew 2>/dev/null; then
        echo "Homebrew is already installed. Skipping "
    else
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

linux () {
    sudo apt install -y make aptitude python3 python3-apt python3-pip python3-venv
}

_python () {
    python3 -m pip install --upgrade pip
    python3 -m venv .env
    . .env/bin/activate
    python -m pip install ansible
}

_cdk () {
    npm install -g aws-cdk
    cdk init aws --language=python
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    darwin
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    linux
fi

_python
make
