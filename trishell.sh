#!/bin/bash
##########################################################################
#                                                                        #
#                         Matthieu - Lepetit                             #
#                                                                        #
##########################################################################

#analyse la ligne de commande
# ./trishell.sh [-R] [-d] [-nsmletpg] /home
estCroissant=1
rep=$0 #repertoire courant par défaut

for p in $@
do
    test -d $p && rep=$p
    if [ $p == "-d" ]
    then    estCroissant=0
    fi
done

#FONCTION
#fonction tri pour l'option -R
# premier paramètre = boolean estCroissant
# return None
# tri le contenu de l’arborescence débutant au répertoire rep
function tri_R()
{
    if [ "$1" -eq 1 ]
    then
        echo "croissant"
    else
        echo "décroissant"
    fi
}

function tri_d_affichage(){
    toprint=" " 
    for i in $@
    do 
        toprint "$i \n $toprint"
    done
    echo "$toprint"    
}

function tri_d(){
    toprint=" " 
    for i in $@
    do 
        toprint "$i \n $toprint"
    done
      
}

# tri
for i in $@
do
    case $i in 
    "-R")
        tri_R $estCroissant
    ;;
    esac
     
done    