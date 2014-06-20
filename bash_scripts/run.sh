#!/bin/bash

if [ ! -f /.requirements_passed ]; then
  /passes_requirements.sh
fi

if [ ! -f /.setup_finished ]; then
  /setup.sh
fi


touch /.running
echo "[`date`] - Starting Supervisor"
exec supervisord -n