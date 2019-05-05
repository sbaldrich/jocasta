#!/usr/bin/zsh

export JOCASTA_LOCATION="~/code/jocasta"

source $JOCASTA_LOCATION/config.sh

for source_file in $JOCASTA_LOCATION/lib/*.sh; do
  source $source_file
done

mkdir -p $JOCASTA_TEMP_DIR

cd $JOCASTA_PROJECT_LOCATION
