# !/bin/sh

function options(){
    clear
    until [ "$tec" = "3" ]; do
        echo "======================================================="
        echo
        echo "                      Opciones"
        echo
        echo "======================================================="
        echo
        echo "1) Loguearse como Admin"
        echo
        echo "2) Loguearse como Tutor"
        echo
        echo "3) Menu principal"
        echo
        echo "======================================================="
        echo
        read -p "Escriba una opcion y aprete enter: " tec
        
        case "$tec" in
            1)
                # Opcion 1
                bash admin.sh
            ;;
            2)
                # Opcion 2
                bash tutor.sh
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

options