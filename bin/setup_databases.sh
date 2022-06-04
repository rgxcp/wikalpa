#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"

main () {
    echo -e "${GREEN}[i] Setting up databases on development env.${WHITE}"
    bin/rails db:setup
    echo -e "${GREEN}[i] Setting up databases on test env.${WHITE}"
    RAILS_ENV=test bin/rails db:setup
}

main
