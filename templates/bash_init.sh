#!/bin/bash

PROG=$(basename "$0")
CWD=$(cd "$(dirname "$0")" && pwd)

# Flags
FILENAME="${CWD}/filename.txt"

fail()
{
  echo ""
  echo "ERROR: $1"
  echo ""
  exit 1
}

usage()
{
cat <<EOF

  USAGE: % ./${PROG} [options] 

  OPTIONS:

    -h                   - Usage
    -f <filename>        - Some description
    <add options here>

  EXAMPLES:

    % ./${PROG} <add flags here>

EOF
  exit 0
}

process_args()
{
  [ $# -lt  0 ] && usage

  while getopts "hf:?" opt
  do
    case "$opt" in
      h)
        usage
        ;;
      f)
        FILENAME=${OPTARG}
        ;;
      *)
        echo "-- What? --"
        usage
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

