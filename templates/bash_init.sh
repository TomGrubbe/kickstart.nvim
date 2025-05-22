#!/bin/bash

PROG=$(basename $0)
CWD=$(cd $(dirname $0) && pwd)

fail()
{
  echo ""
  echo "ERROR: $1"
  echo ""
  exit 1
}


