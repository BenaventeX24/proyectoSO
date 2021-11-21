#!/bin/sh

# Variable que contiene el grep a la carpeta de usuarios buscando tutor
verify=$(grep administrador /etc/passwd)

# Comprueba si la búsqueda de tutor es vacía
if [ -z $verify ]
then
    # Crea un tutor y creá su directorio base (/home/tutor) con '-m'. Además, añade su contraseña como 'tutor' por default.
    sudo useradd -m administrador
    echo administrador:administrador | sudo chpasswd
fi

# Da permisos al tutor de leer, escribir y ejecutar la carpeta del proyecto y todos sus subdirectorios y archivos
sudo setfacl -R -m u:administrador:rwx /home/anima/proyecto

# Loguear al usuario tutor y ejecutar el comando 'bash adminScript.sh'.
# Debe pedir contraseña de tutor.
su --login administrador -c "bash /home/anima/proyecto/adminScript.sh"
