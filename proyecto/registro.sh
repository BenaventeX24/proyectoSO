# !/bin/sh

function register(){
    clear
    until [ "$tec" = "3" ]; do
        echo "======================================================="
        echo
        echo "                     Asistencia"
        echo
        echo "======================================================="
        echo
        echo "1) Alumno"
        echo
        echo "2) Docente"
        echo
        echo "3) Menu principal"
        echo
        echo "======================================================="
        echo
        read -p "Escriba una opcion y aprete enter: " tec
        
        case "$tec" in
            1)
                # Opcion 1
                bash alumno.sh
            ;;
            2)
                # Opcion 2
                docente.sh
            ;;
            3)
                # Opcion 3
                clear
            ;;
            *)
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

register
