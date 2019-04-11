#!/bin/bash

pipenv="python3 -m pipenv"

darwin () {
    if hash brew 2>/dev/null; then
        echo "Homebrew is already installed. Skipping "
    else
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    python3 -m pip install --upgrade pip pipenv
    pipenv --rm && rm Pipfile Pipfile.lock
    $pipenv --python 3
    $pipenv install ansible
}

linux () {
    sudo apt install -y make python3 python3-pip python3-apt
    python3 -m pip install --upgrade pip pipenv
    sudo $pipenv --rm && rm Pipfile Pipfile.lock
    $pipenv --python 3 --site-packages
    $pipenv install --skip-lock ansible
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    darwin
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    linux
fi

make