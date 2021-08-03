# SOURCE: https://raw.githubusercontent.com/gdbinit/Gdbinit/master/gdbinit

set disassembly-flavor intel

#set confirm off
set breakpoint pending on
#set verbose off
set history filename ~/.gdb_history
set history save
#
#set output-radix 0x10
#set input-radix 0x10
#
set pagination off
## These make gdb never pause in its output
#set height 0
#set width 0

set print pretty on


#handle SIGPIPE nostop noprint pass
#set non-stop on
