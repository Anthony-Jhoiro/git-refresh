#!/bin/bash

if [ -f .env ]; then
    source .env
fi

dest=$DESTINATION
repo=$REPOSITORY
token=$GITHUB_TOKEN
timer=$TIME_BETWEEN_CHECK

repo_name=$(basename $repo)

function log() {
    messages=$@
    echo $(date) - $messages
}



function main() {
    log Begin check
    
    mkdir -p $dest
    cd $dest

    if [ ! -d .git ]; then 
        log Cloning the repository
        git clone "https://${token}@github.com/$repo" .
    else
        log Pulling the repository
        git pull 
    fi
}

while [ 1 ]; do
    main
    sleep $timer
done
