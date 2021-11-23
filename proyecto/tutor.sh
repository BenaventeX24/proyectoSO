#!/bin/sh

# Variable que contiene el grep a la carpeta de usuarios buscando tutor
verify=$(grep tutor /etc/passwd)

# Comprueba si la búsqueda de tutor es vacía
if [ -z $verify ]
then
    # Crea un tutor y creá su directorio base (/home/tutor) con '-m'. Además, añade su contraseña como 'tutor' por default.
    sudo useradd -m tutor
    echo tutor:tutor | sudo chpasswd
fi

#Leer nombre del tutor a loguear
read -p "Nombre del tutor: " tutorName

# Da permisos al tutor de leer, escribir y ejecutar la carpeta del proyecto y todos sus subdirectorios y archivos
sudo setfacl -R -m u:"$tutorName":rwx /home/anima/proyecto

# Loguear al usuario tutor y ejecutar el comando 'bash tutorScript.sh'.
# Debe pedir contraseña de tutor.
su --login "$tutorName" -c "bash /home/anima/proyecto/tutorScript.sh"
