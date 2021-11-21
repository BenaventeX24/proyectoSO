#!/bin/sh

# Variable que contiene el grep a la carpeta de usuarios buscando admin
verify=$(grep adminUser /etc/passwd)

# Comprueba si la búsqueda de admin es vacía
if [ -z $verify ]
then
    # Crea un administrador y creá su directorio base (/home/adminUser) con '-m'. Además, añade su contraseña como 'admin' por default.
    sudo useradd -m admin
    echo administrador:admin | sudo chpasswd
fi

# Da permisos al tutor de leer, escribir y ejecutar la carpeta del proyecto y todos sus subdirectorios y archivos
sudo setfacl -R -m u:administrador:rwx /home/anima/proyecto

# Loguear al usuario tutor y ejecutar el comando 'bash tutorScript.sh'.
# Debe pedir contraseña de tutor.
su --login administrador -c "bash /home/anima/proyecto/adminScript.sh"
