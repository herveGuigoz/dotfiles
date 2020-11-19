  
#!/bin/bash
set -e

function hello() {
	echo "hello world"
	fi
}

function usage() {
	cat <<EOF
usage: $0 [options]
Set up a fresh Mac or run individual parts of it.
OPTIONS:
  --help|-h       Show this message
  --update|-u     Install macOS updates
  --brew|-b       Install Homebrew, all brew.txt packages an cask-minimal.txt
  --full|-f       Install all brew packages and casks defined in cask-full.txt
  --dotfiles|-d   Install dotfiles repo or update it
  --defaults|-D   Install default user settings
  --terminal|-t   Install terminal profile
Without any option it runs the complete setup.
EOF
	exit 1
}

# Main

UPDATE=0
BREW=0
FULL=0
DOTFILES=0
DEFAULTS=0
TERMINAL=0
# translate long options to short
for arg; do
	delim=""
	case "${arg}" in
	--help) args="${args}-h " ;;
	--update) args="${args}-u " ;;
	--brew) args="${args}-b " ;;
	--full) args="${args}-f " ;;
	--dotfiles) args="${args}-d " ;;
	--defaults) args="${args}-D " ;;
	--terminal) args="${args}-t " ;;
	# pass through anything else
	*)
		[[ "${arg:0:1}" == "-" ]] || delim="\""
		args="${args}${delim}${arg}${delim} "
		;;
	esac
done
# reset the translated args
eval set -- "$args"
# now we can process with getopt
while getopts ":ubfdDt" opt; do
	case $opt in
	h) usage ;;
	u) UPDATE=1 ;;
	b) BREW=1 ;;
	f) FULL=1 ;;
	d) DOTFILES=1 ;;
	D) DEFAULTS=1 ;;
	t) TERMINAL=1 ;;
	\?) usage ;;
	:)
		echo "option -$OPTARG requires an argument"
		usage
		;;
	esac
done
shift $((OPTIND - 1))

if [ -z "$args" ]; then
	UPDATE=1
	BREW=1
	FULL=1
	DOTFILES=1
	DEFAULTS=1
	TERMINAL=1
fi

if [ $UPDATE == 1 ]; then hello; fi
if [ $BREW == 1 ]; then hello; fi
if [ $BREW == 1 ]; then hello minimal; fi
if [ $DOTFILES == 1 ]; then hello; fi
if [ $TERMINAL == 1 ]; then hello; fi
if [ $DEFAULTS == 1 ]; then hello; fi
if [ $FULL == 1 ]; then hello full; fi