top -c -b -o +%MEM | head -n 20 | tail -15
top -c -o +%MEM | head -n 20 | tail -15


top -c -b -o +%CPU | head -n 20 | tail -15
top -c -o +%CPU | head -n 20 | tail -15


#c:显示整个命令行而不只是显示命令名。

#-b  :Batch-mode operation
#            Starts  top  in  Batch  mode, which could be useful for sending output from top to other programs or to a file.  In this mode, top will not accept input and runs until the iterations limit you've set
#            with the `-n' command-line option or until killed.

#-c  :Command-line/Program-name toggle
#    Starts top with the last remembered `c' state reversed.  Thus, if top was displaying command lines, now that field will show program names, and visa versa.  See the `c' interactive command for  addi‐
#    tional information.
#
#-H  :Threads-mode operation
#    Instructs top to display individual threads.  Without this command-line option a summation of all threads in each process is shown.  Later this can be changed with the `H' interactive command.

#-o  :Override-sort-field as:  -o fieldname
#    Specifies the name of the field on which tasks will be sorted, independent of what is reflected in the configuration file.  You can prepend a `+' or `-' to the field name to also  override  the  sort
#    direction.  A leading `+' will force sorting high to low, whereas a `-' will ensure a low to high ordering.