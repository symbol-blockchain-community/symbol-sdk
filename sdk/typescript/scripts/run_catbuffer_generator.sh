#!/bin/bash

set -ex

function generate_code() {
	# $1 blockchain
	# $2 destination

	local git_root
	git_root="$(git rev-parse --show-toplevel)"

	PYTHONPATH="${git_root}/catbuffer/parser" python3 -m catparser \
		--schema "${git_root}/catbuffer/schemas/$1/all_generated.cats"  \
		--include "${git_root}/catbuffer/schemas/$1" \
		--output "${git_root}/sdk/typescript/src/$2" \
		--quiet \
		--generator generator.Generator
}

if [[ $# -eq 0 ]]; then
	echo "updating generated code in git"
	#for name in "nem" "symbol";
	for name in "symbol";
	do
		rm -rf "./src/${name}/models.ts"
		generate_code "${name}" "${name}"
	done
elif [[ "$1" = "dryrun" ]]; then
	echo "running dryrun diff"

	for name in "nem" "symbol";
	do
		generate_code "${name}" "${name}2"
		diff --strip-trailing-cr "./src/${name}/models.ts" "./src/${name}2/models.ts"
		rm -rf "./src/${name}2/models.ts"
	done
else
	echo "unknown options"
	exit 1
fi
