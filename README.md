#td

a tiny todo list.

install:
```
$(cd /usr/local/bin && curl -O https://raw.githubusercontent.com/graysonc/td/master/td && chmod +x ./td)
```

uninstall:

```
rm /usr/local/bin/td
rm $HOME/todo.txt
```

```
gchao$ td list
TODO
Nothing! :)

gchao$ td add Update the readme

gchao$ td list
TODO
1: Update the readme

gchao$ td remove 1
Deleting line 1. Interrupt to cancel:
----> 1:  Update the readme

gchao$ td list
TODO
Nothing! :)
```
