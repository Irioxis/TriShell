#!/bin/bash

function inverse(){

    toprint=" "

    for fich in "$1"/*
    do
    
        if [ -f $fich ]
        then
            toprint="$fich\n$toprint"
        
        fi
        if test -d "$fich" -a \! -L "$fich"
        then 
            rec=`$0 "$fich"`
            #nbline= echo "$rec" | wc -l
            for line in `echo "$rec"|head -n $[nbline-1]|tail -n $[nbline-2]`
            do
                echo "$line"
            done

        fi
    done

    echo -e "$toprint"

}

inverse $@
    


