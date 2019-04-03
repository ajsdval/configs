#!/bin/bash

pipenv="python3 -m pipenv"

darwin () {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

linux () {
    sudo apt install -y make python3 python3-pip python3-apt
    python3 -m pip install --upgrade pip pipenv
    sudo $pipenv --rm && rm Pipfile Pipfile.lock
    $pipenv --python 3.6 --site-packages
    $pipenv install --skip-lock ansible
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    darwin
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    linux
fi
