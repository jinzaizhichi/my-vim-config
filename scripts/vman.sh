#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: vman <command> [section]"
  exit 1
fi

if [ $# -eq 2 ]; then
  vim -c "Man $2 $1" -c "only"
else
  vim -c "Man $1" -c "only"
fi
