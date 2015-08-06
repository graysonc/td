#!/usr/bin/env bash

# td: A very, very lightweight todo list.
# Grayson Chao

TODO_FILE="$HOME/todo.txt"
LINE_COUNT="$(touch $HOME/todo.txt && wc -l < $HOME/todo.txt | sed 's/^[ \t]*//')"

confirm() {
  read throwaway
  exec $1
}

if [[ $1 = "add" ]] ; then

  line="$(($LINE_COUNT + 1)): "

  # Chomp through the line, word by word. We don't care about $1 anymore.
  while [[ -n $2 ]] ; do
    line="$line $2" ; shift
  done

  echo "$line" >> $TODO_FILE

elif [[ $1 = "list" ]] ; then

  touch $TODO_FILE
  echo TODO
  echo $(<$TODO_FILE)

elif [[ $1 = "remove" ]] ; then

  if [[ $2 -gt 0 ]] && [[ $2 -le $LINE_COUNT ]] ; then
    echo "Deleting line ${2}. Interrupt to cancel: "
    sed "${2}s/^/----> /" $HOME/todo.txt
    confirm "sed -i'' ${2}d $HOME/todo.txt"
  fi

fi
