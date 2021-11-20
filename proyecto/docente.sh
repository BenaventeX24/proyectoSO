# !/bin/sh

#Los piquitos indican de inicio y el símbolo de dolar indica a fin
#Esto verifica (más tarde) que ci sea solo números y nombre y apellido solo texto correspondientemente
validate_number="^[0-9]+$"
validate_text="^[A-Za-zÁÉÍÓÚáéíóú ]+$"

#Comprobación de CI
function validationCI (){
    clear
    while :
    do
        echo
        read -p "> Ingrese su cedula de identidad: " ci
        echo
        #Si no se introdujo una ci
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
        #Si ci contiene caracteres fuera de números entre el rango del 0-9
        #El símbolo =~ lo que hace es devolver true cuando matchea
            if [[ $ci =~ $validate_number ]];
            then
            
            #Si la búsqueda de grep dado el ci en esta fecha devuelve algo, quiere decir que esta ci ya fue registrada
                validateRegister=$(grep $ci /home/anima/proyecto/db/docentes)
                if [ -z $validateRegister ];
                then
                    clear
                    echo "============================================================================="
                    echo
                    echo "        Ya existe un docente con esa CI"
                    echo
                    echo "============================================================================="
                    sleep 2
                    clear
                else
                    break
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


#Chequeo de validación de num tel, es exactamente lo mismo que antes
function validationPhone (){
    clear
    while :
    do
        echo
        read -p "> Ingrese su numero de telefono: " phone
        echo
        #Si no se introdujo un num de tel
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
        #Si el num de tel contiene caracteres fuera de números entre el rango del 0-9
        #El símbolo =~ lo que hace es devolver true cuando matchea
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

function validationText (){
    clear
    while :
    do
        echo
        read -p "> Ingrese su $textLabel: " text
        echo
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
        #Si el texto contiene caracteres fuera de las indicadas
        #El símbolo =~ lo que hace es devolver true cuando matchea
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

#Función para finalmente mandar los datos a la lista de asistencia
function docenteRegister (){
    validationCI
    
    textLabel="nombre"
    validationText
    nombre=$text
    
    textLabel="apellido"
    validationText
    apellido=$text
    
    validationPhone

    echo "$ci|$nombre|$apellido|$phone" >> /home/anima/proyecto/db/docentes
        
}

docenteRegister
