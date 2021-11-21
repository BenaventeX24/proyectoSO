#!/bin/sh

# Quitar acceso a los siguientes archivos, para hacer obligatorio el logueo como tutor o admin a su correspondiente
chmod -777 adminScript.sh
chmod -777 tutorScript.sh
chmod -777 docente.sh
chmod -777 alumno.sh

function menu(){
    # Limpia la consola
    clear
    
    # Until cumple la misma funcion que la estructura while (bucle). A diferencia de que el until se ejecutara solo y cuando su condicion no se cumpla.
    # En comparacion al while, este se ejecutara mientras su condicion sea verdadera.
    # En este caso mientras que tec no sea igual a 3, se ejecutara el menu. En caso de que se 3, cortara el bucle funalizando el programa.
    until [ "$tec" = "3" ]; do
        echo "======================================================="
        echo
        echo "                     Menu principal"
        echo
        echo "======================================================="
        echo
        echo "1) Registrar asistencia"
        echo
        echo "2) Opciones"
        echo
        echo "3) Salir"
        echo
        echo "======================================================="
        echo
        read -p "Escriba una opcion y aprete enter: " tec
        
        
        # Switch para la opcion que se elija
        case "$tec" in
            1)
                # Opcion 1
                bash asistencia.sh
            ;;
            2)
                # Opcion 2
                bash options.sh
            ;;
            3)
                # Opcion 3
                
                # En caso que se haya ingresado '3', mostrara este mensaje y terminara el programa/bucle.
                clear
                echo "==============================================================="
                echo
                echo "                       Hasta la proxima!"
                echo
                echo "==============================================================="
                sleep 2
                clear
            ;;
            *)
                # En caso que se haya ingresado un numero que no sea una opcion disponible del menu, mostrara este mensaje.
                clear
                echo "==============================================================="
                echo
                echo "         Opcion no valida! Intente con una diferente"
                echo
                echo "==============================================================="
                sleep 2
                clear
            ;;
        esac
    done
}

menu
