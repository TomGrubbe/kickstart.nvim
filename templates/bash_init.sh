#!/usr/bin/env bash

PROG=$(basename "$0")
CWD=$(cd "$(dirname "$0")" && pwd)

# Flags
FILENAME="${CWD}/filename.txt"
VERBOSE=false

fail()
{
  echo ""
  echo "ERROR: $1"
  echo ""
  exit 1
}

usage()
{
  [ -n "$1" ] && printf "\nERROR: %s\n" "$1"

cat <<EOF

  USAGE: % ./${PROG} [options] 

  OPTIONS:

    -h                   - Usage
    -f <filename>        - Some description
    <add options here>

  EXAMPLES:

    % ./${PROG} <add flags here>

  NOTES:

    * <add notes here>

EOF
  exit 0
}

process_args()
{
  [ $# -eq 0 ] && usage

  while getopts ":hvf:?" opt
  do
    case "$opt" in
      h)
        usage
        ;;
      f)
        FILENAME=${OPTARG}
        ;;
      v)
        VERBOSE=true
        ;;
      \?)
        usage "Invalid argument: -$OPTARG"
        ;;
      :)
        usage "Option -$OPTARG requires an argument."
        ;;
    esac
  done
}

Main()
{
  process_args "$@"

  echo "$FILENAME"
}

Main "$@"

