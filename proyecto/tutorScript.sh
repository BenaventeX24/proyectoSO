#!/usr/bin/env bash

#función para buscar un alumno en la lista de asistencia. Devuelve los datos del alumno seguido la fecha de asistencia
function lista(){
    echo "=========================="
    echo "Lista de asistencia:"
    echo "=========================="
    read estudiante
    #busqueda
    cat /home/anima/proyecto/db/asistenciaUsuarios
}

#Funcion para ver la lista de asistencia dada una fecha
function asistencia(){
    echo "=========================="
    echo "Ingrese la fecha de lista:"
    echo "Formato (M-D)"
    echo "=========================="
    read fecha
    #Busqueda
    grep $fecha /home/anima/proyecto/db/asistenciaUsuarios
}

#Funcion para ver la lista de asistencia docente
function asistenciadocente(){
    echo "=========================="
    echo "Ingrese la fecha de lista:"
    echo "Formato (M-D)"
    echo "=========================="
    read fecha
    #Busqueda
    grep $fecha /home/anima/proyecto/db/asistenciaDocente
}

#menú de opciones
function menu(){

        echo "====================="
        echo
        echo "   ¿Qué desea hacer?"
        echo
        echo "====================="
        echo
        echo "1) Crear un nuevo alumno"
        echo
        echo "2) Revisar la lista de asistencias de alumnos"
        echo
        echo "3) Revisar la lista de asistencias de alumnos dada una fecha"
        echo
        echo "4) Revisar la asistencia docente dada una fecha"
        echo
        echo "5) Salir"
        echo
        echo "====================="
        echo
        read -p "Escriba una opcion y aprete enter: " tec
    
    case $tec in
        
         
        1)
            bash /home/anima/proyecto/alumno.sh
        ;;
        1)
            lista
        ;;
        2)
            asistencia
        ;;
        3)
            asistenciadocente
        ;;
        4)
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
