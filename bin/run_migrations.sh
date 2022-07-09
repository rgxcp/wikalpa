#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"

main () {
	echo -e "${GREEN}[i] Running migrations on development env.${WHITE}"
	bin/rails db:migrate
	echo -e "${GREEN}[i] Running migrations on test env.${WHITE}"
	RAILS_ENV=test bin/rails db:migrate
}

main
