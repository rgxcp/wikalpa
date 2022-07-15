#!/bin/bash

main () {
	FILES=()

	# Staged files
	FILES+=($(git diff --name-only --staged))
	# Modified files
	FILES+=($(git diff --name-only --diff-filter=M))
	# Untracked files
	FILES+=($(git ls-files --others --exclude-standard))

	for I in ${!FILES[@]}; do
		if [[ ${FILES[$I]} != *"_spec.rb"* ]]; then
			unset FILES[$I]
		fi
	done

	bundle exec rspec ${FILES[@]} $1
}

main $1
