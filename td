#!/usr/bin/env bash

# td: A very, very lightweight todo list.
# Grayson Chao

TODO_FILE="$HOME/todo.txt"
LINE_COUNT="$(touch $HOME/todo.txt && wc -l < $HOME/todo.txt | sed 's/^[ \t]*//')"

confirm() {
  read throwaway
  exec $1
}

case $1 in

  a|ad|add)

    if [[ $LINE_COUNT = 0 ]] ; then
      LINE_COUNT=1 ;
    fi

    # Chomp through the line, word by word. We don't care about $1 anymore.
    while [[ -n $2 ]] ; do
      line="$line $2" ; shift
    done

    echo "$line" >> $TODO_FILE

  ;;

  l|li|lis|list)

    echo TODO
    if [[ $LINE_COUNT -gt 0 ]] ; then
      cat -n $TODO_FILE
    else
      echo "Nothing! :)"
    fi

  ;;

  r|re|rem|remo|remov|remove)

    if [[ $2 -gt 0 ]] && [[ $2 -le $LINE_COUNT ]] ; then
      echo "Deleting line ${2}. Interrupt to cancel: "
      sed "${2}s/^/----> /" $HOME/todo.txt
      confirm "sed -i'' ${2}d $HOME/todo.txt"
    fi

  ;;

  u|up|upd|upda|updat|update)

    $(cd /usr/local/bin && curl -O https://raw.githubusercontent.com/graysonc/td/master/td && chmod +x ./td)

  ;;

esac
