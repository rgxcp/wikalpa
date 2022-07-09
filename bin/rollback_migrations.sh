#!/bin/bash

GREEN="\e[32m"
WHITE="\e[0m"

main () {
	echo -e "${GREEN}[i] Rollback migrations on development env.${WHITE}"
	bin/rails db:rollback
	echo -e "${GREEN}[i] Rollback migrations on test env.${WHITE}"
	RAILS_ENV=test bin/rails db:rollback
}

main
