#!/usr/bin/env bash

_script_dir=$HOME/lib/freewrite
source $HOME/.freewriterc

echo "Removing today's session writing file: $session_file"
echo "Removing today's session data file: $data_file"
echo -n "Correct ? (y/n) "
read -n 1 answer
[[ $answer = "y" ]] && rm -f $session_file $data_file

exit 0
