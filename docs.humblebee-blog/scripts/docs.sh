#!/bin/bash
set -euo pipefail


## --- Base --- ##
# Getting path of this script file:
_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
_PROJECT_DIR="$(cd "${_SCRIPT_DIR}/.." >/dev/null 2>&1 && pwd)"
cd "${_PROJECT_DIR}" || exit 2


if [ -z "$(which mkdocs)" ]; then
	echo "[ERROR]: 'mkdocs' not found or not installed."
	exit 1
fi

# if [ -z "$(which mike)" ]; then
# 	echo "[ERROR]: 'mike' not found or not installed."
# 	exit 1
# fi
## --- Base --- ##


## --- Variables --- ##
# Flags:
_IS_BUILD=false
_IS_PUBLISH=false
## --- Variables --- ##


## --- Main --- ##
main()
{
	## --- Menu arguments --- ##
	if [ -n "${1:-}" ]; then
		for _input in "${@:-}"; do
			case ${_input} in
				-b | --build)
					_IS_BUILD=true
					shift;;
				-p | --publish)
					_IS_PUBLISH=true
					shift;;
				*)
					echo "[ERROR]: Failed to parsing input -> ${_input}"
					echo "[INFO]: USAGE: ${0}  -b, --build | -p, --publish"
					exit 1;;
			esac
		done
	fi
	## --- Menu arguments --- ##


	if [ "${_IS_PUBLISH}" == true ]; then
		if [ -z "$(which git)" ]; then
			echo "[ERROR]: 'git' not found or not installed!"
			exit 1
		fi
	fi


	if [ "${_IS_BUILD}" == false ]; then
		echo "[INFO]: Starting documentation server..."
		mkdocs serve
	elif [ "${_IS_PUBLISH}" == true ]; then
		echo "[INFO]: Publishing documentation pages to the GitHub Pages..."
		mkdocs gh-deploy --force

		# _major_minor_version="$(./scripts/get-version.sh | cut -d. -f1-2)"
		# mike deploy -p -u "${_major_minor_version}" latest
		# mike set-default -p latest
	else
		echo "[INFO]: Building documentation pages (HTML) into the 'site' directory..."
		mkdocs build
	fi
	echo "[OK]: Done."
}

main "${@:-}"
## --- Main --- ##
