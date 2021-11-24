#!/usr/bin/env bash

function registrarTutor(){
    echo "=========================="
    echo "Crear nuevo tutor:"
    echo "=========================="
    read -p "Escriba un nombre y aprete enter: " tutorNuevoName
    read -p "Escriba una contraseña y aprete enter: " tutorNuevoPass
    sudo useradd -m "$tutorNuevoName"
    echo "$tutorNuevoName":"$tutorNuevoPass" | sudo chpasswd
}

function menu(){

        echo "====================="
        echo
        echo "   ¿Qué desea hacer?"
        echo
        echo "====================="
        echo
        echo "1) Registrar nuevo tutor personalizado"
        echo
        echo "2) Salir"
        echo
        echo "====================="
        echo
        read -p "Escriba una opcion y aprete enter: " tec
    
    case $tec in
        
        1)
            registrarTutor
        ;;
        2)
            clear
            echo "==============================================================="
            echo
            echo "                       Hasta la proxima!"
            echo
            echo "==============================================================="
            sleep 2
            clear
        ;;
    esac

}

menu
