#!/bin/sh

# Variable que contiene el grep a la carpeta de usuarios buscando admin
verify=$(grep adminUser /etc/passwd)

# Comprueba si la búsqueda de admin es vacía
if [ -z $verify ]
then
    # Crea un administrador y creá su directorio base (/home/adminUser) con '-m'. Además, añade su contraseña como 'admin' por default.
    sudo useradd -m admin
    echo adminUser:admin | sudo chpasswd
fi

sudo cp -r /home/anima/proyecto /home/adminUser
sudo chown -R tutor /home/tutor/proyecto/*

# Da permisos al tutor de leer, escribir y ejecutar la carpeta del proyecto y todos sus subdirectorios y archivos
sudo setfacl -R -m u:adminUser:rwx /home/anima/proyecto

# Loguear al usuario admin y ejecutar el comando 'bash adminScript'.
# Debe pedir contraseña de admin.
su --login adminUser -c "bash /home/anima/proyecto/adminScript.sh"
