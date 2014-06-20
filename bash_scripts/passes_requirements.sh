#!/bin/bash
touch /.checking_requirements
if [ "$root_pw" == "" ]; then
  echo "FATAL ERROR! required environment variable 'root_pw' is blank"
  exit 1
fi
if [ "$uuid" == "" ]; then
  echo "FATAL ERROR! required environment variable 'uuid' is blank"
  exit 1
fi
touch /.requirements_passed