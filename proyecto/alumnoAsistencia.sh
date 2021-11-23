# !/bin/sh

# Variables que contienen letras y numeros para validar los campos de registro.
validate_number="^[0-9]+$"
validate_text="^[A-Za-zÁÉÍÓÚáéíóú ]+$"

# Comprobación de CI
function validationCI(){
    clear
        echo
        read -p "> Ingrese su cedula de identidad: " ci
        echo
        
        # Comprueba si no se introdujo una CI
        if [ -z "$ci" ];
        then
            clear
            echo "==============================================================="
            echo
            echo "             Debes ingresar una cedula de identidad"
            echo
            echo "==============================================================="
            sleep 2
            clear
        else
            # Comprueba si la CI ingresada solo sean numeros.
            # El símbolo '=~' lo que hace es devolver true cuando matchea
            if [[ $ci =~ $validate_number ]];
            then
                # Si la búsqueda de grep dada la ci en esta fecha devuelve algo, quiere decir que fue registrada
                validateAssist=$(grep -w $ci /home/anima/proyecto/db/usuarios)
                if [ -z "$validateAssist" ];
                then
        clear
        echo "==============================================================="
        echo
        echo "      No existe un alumno con esas credenciales"
        echo
        echo "==============================================================="
        sleep 2
        clear
    		else
    	fecha=$(date +"%m-%d")
        echo "$validateAssist|$fecha|" >> /home/anima/proyecto/db/asistenciaUsuarios
    		fi
        else
                clear
                echo "==============================================================="
                echo
                echo "  No se permiten letras o caracteres especiales, solo numeros"
                echo
                echo "==============================================================="
                sleep 2
                clear
            fi
        fi
}
validationCI
