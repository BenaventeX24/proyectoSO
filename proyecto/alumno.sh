# !/bin/sh

# Variables que contienen letras y numeros para validar los campos de registro.
validate_number="^[0-9]+$"
validate_text="^[A-Za-zÁÉÍÓÚáéíóú ]+$"

# Comprobación de CI
function validationCI(){
    clear
    while :
    do
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
                # Si la búsqueda de grep dada la ci en esta fecha devuelve algo, quiere decir que esta ci ya fue registrada
                validateRegister=$(grep $ci /home/anima/proyecto/db/usuarios)
                if [ -z $validateRegister ];
                then
                    break
                else
                    clear
                    echo "============================================================================="
                    echo
                    echo "     Ya existe un alumno con esa CI"
                    echo
                    echo "============================================================================="
                    sleep 2
                    clear
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
    done
}

# Comprobación de numero de telefono
function validationPhone(){
    clear
    while :
    do
        echo
        read -p "> Ingrese su numero de telefono: " phone
        echo
        
        # Comprueba si no se introdujo un numero de telefono
        if [ -z "$phone" ];
        then
            clear
            echo "==============================================================="
            echo
            echo "             Debes ingresar un numero de telefono"
            echo
            echo "==============================================================="
            sleep 2
            clear
        else
            # Comprueba si el numero de telefono ingresado solo sean numeros.
            if [[ $phone =~ $validate_number ]];
            then
                break
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
    done
}

# Comprobacion de nombres y apellidos
function validationText(){
    clear
    while :
    do
        echo
        # Se usa de la variable textLabel para despues asignarle un valor y lo muestre (nombre o apellido).
        read -p "> Ingrese su $textLabel: " text
        echo
        
        # Comprueba si no se introdujo nombre o apellido
        if [ -z "$text" ];
        then
            clear
            echo "==============================================================="
            echo
            echo "                Debes ingresar un $textLabel"
            echo
            echo "==============================================================="
            sleep 2
            clear
        else
            # Comprueba si el nombre o apellido ingresado solo sean letras.
            if [[ $text =~ $validate_text ]];
            then
                break
            else
                clear
                echo "==============================================================="
                echo
                echo "  No se permiten numeros o caracteres especiales, solo letras"
                echo
                echo "==============================================================="
                sleep 2
                clear
            fi
        fi
    done
}

# Función para finalmente mandar los datos del alumno a la lista de asistencia
function alumnoRegister(){
    
    # Se llama a la funcion 'validationCI'
    validationCI
    
    # Se le asigna un valor a la variable textLabel antes de llamar a la funcion 'validationText' para que muestre su contenido en la misma.
    textLabel="nombre"
    validationText
    nombre=$text
    
    textLabel="apellido"
    validationText
    apellido=$text
    
    validationPhone
    
    # Se guarda los datos del alumno registrado en 'usuarios.txt'
    echo "$ci|$nombre|$apellido|$phone" >> /home/anima/proyecto/db/usuarios
    
    clear
}

alumnoRegister
