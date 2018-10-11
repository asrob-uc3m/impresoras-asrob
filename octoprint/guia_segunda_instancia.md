# Guia para usar OctoPrint con 2 impresoras al mismo tiempo

##### Con esta guía podrás utilizar 2 impresoras al mismo tiempo con OctoPrint usando una sola raspberry

###Requisitos

- Raspberry Pi (preferiblemente de 3 para arriba).
- Tarjeta de memoria: Con 8Gb debería valer, pero cuanto más, mejor.
- Tener instalado OctoPrint en la Raspberry (https://octoprint.org/download/)
- Cable micro usb para alimentar y conectarte a la Raspberry
- Cables de conexión a tus impresoras.

###Pasos a seguir 

1. Conectarte a la Rasphberry Pi.
2. Copiar la carpeta de OctoPrint.
3. Copiar y modificar script de configuración de OctoPrint2.
4. Copiar y modificar script de inicio de OctoPrint2.
5. Añadir el nuevo script de inicio de OctoPrint2 a autostart.

### Conectarte a la Raspberry Pi mediante SSH

Conectaremos a la red local la RPi ya sea por cable ethernet o por Wi-Fi, y configuraremos una IP Estatica.
Posteriormente en el terminal ejecutaremos el siguiente comando:

`ssh pi@[IP local de la RPi]`

### Copiar la carpeta original de OctoPrint

Una vez dentro de `pi@octopi` ejecutaremos los siguientes comandos:

`cp -R /home/pi/.octoprint /home/pi/.octoprint2`

### Copiar y modificar script de configuración de OctoPrint2

`sudo cp /etc/default/octoprint /etc/default/octoprint2`

Usando vim o nano (a tu elección) editamos el archivo /etc/default/octoprin2

`vim /etc/default/octoprint2` o `sudo nano /etc/default/octoprint2`

y modificamos PORT y DAEMON_ARGS, quedando ambos valores así: 

```bash
HOST=0.0.0.0
PORT=5001
DAEMON_ARGS="--host=$HOST --port=$PORT --basedir /home/pi/.octoprint2/"
```

Con esto, nuestra segunda instancia de OctoPrint será accesible desde el puerto 5001.

### Copiar y modificar script de inicio de OctoPrint2

`sudo cp /etc/init.d/octoprint /etc/init.d/octoprint2`

Entramos de nuevo en un editor para modificar este archivo

`vim /etc/init.d/octoprint2` o `sudo nano /etc/init.d/octoprint2`

En este archivo cambiaremos todos los `octoprint` por `octoprint2` y todos los `OctoPrint` por `OctoPrint2` (**cuidado** con las mayúculas!!), **pero** dejaremos tal y como está la linea de `DAEMON=/usr/bin/octoprint`.

### Añadir el nuevo script de inicio de OctoPrint2 a autostart.

```bash
sudo systemctl daemon-reload

sudo update-rc.d octoprint2 defaults

sudo /etc/init.d/octoprint2 start

systemctl status octoprint2.service
```

Si el último comando no devuelve ningún error, significa que hasta ahora hemos hecho todo bien.

### Primer Inicio

A la primera instancia accederemos desde la IP, donde esta conectada la Rasphberry Pi. A la segunda, acceremos con la misma IP, añadiendo a continuacion ```:5001```.
Y ¡LISTO! ya puedes comenzar a usar tus dos impresoras.
