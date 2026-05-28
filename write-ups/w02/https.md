# Ataque Man-in-the-middle al servicio HTTPS
En esta sección del laboratorio, procederemos a crear un servicio HTTPS en el servidor al cual el cliente Ubuntu se conectará y con la MV Kali procederemos a realizar un attaque Man-in-the-middle para analizar, observar y comentar los paquetes mas importantes durante la transmisión de información.

## Configuración HTTPS Server
Para poder tener nuestro propio servidor HTTPS necesitaremos el servicio nginx asi como nuestro propio certificado autofirmado.

Empezamos instalando el servicio nginx con ``sudo apt install nginx`` y comprobamos que está funcionando:

![Comprobacion nginx](/images/HTTPS/CreacionHTTPSServerUbuntuServer.png)

Posteriormente, tendremos que crear nuestro propio certificado que será el que use el servidor para certificar que la transmisión de los datos es segura. Primero deberemos crear el siguiente archivo de configuración del servidor HTTPS donde pondremos lo siguiente:

![Configuracion HTTPS file](/images/HTTPS/ConfigSSLHTTPSUbuntuServer.png)

En resumen, el archivo hace lo siguiente:
  - Configura el puerto 443 con un certificado SSL para el dominio server.https
  - Indica que los archivos se encuentran en /var/www/html y que el archivo principal es index.html
  - Si no existe el directorio, devuelve "ERROR 404"

## Creación certificado autofirmado
Necesitaremos nuestro propio certificado autofirmado y para ello se conseguirá con el siguiente comando:

![Certificado autofirmado](/images/HTTPS/CertificadoAutofirmadoUbuntuServer.png)

En resumen, el comando hace lo siguiente:
  - ``openssl req -x509``: Crea un certificado estándar (X.509) autofirmado
  - ``-newkey rsa:2048``: Genera una nueva clave privada RSA de 2048 bits
  - ``-nodes``: Indica que la clave privada no debe estar protegida por una contraseña (para que Nginx arranque automáticamente)
  - ``-days 365``: El certificado será válido por un año
  - ``-keyout / -out``: Guarda la clave privada y el certificado en las rutas exactas donde el archivo de configuración de Nginx los espera
  - ``-subj``: Rellena automáticamente los datos de identidad del certificado (país, organización, nombre del servidor, etc.) sin pedir que se escriban manualmente

## Conexión con el servidor y ataque Man-in-the-middle
Desde la MV Ubuntu cliente, nos conectaremos al servidor HTTPS creado con ``curl -k https://10.10.10.20``. Ahora, con la MV Kali, procederemos a observar el trafico generado centrándonos concretamente en el protocolo TLS:

![Wireshark HTTPS](/images/HTTPS/WiresharkClientHelloKali.png)

En la imágen podemos observar que efectivamente el servidor HTTPS se ha creado correctamente con el paquete ``CLIENT HELLO`` y el nombre del servidor ``server.https``. Como en este caso, el contenido de la información transmitida va encriptada, solamente podremos observar paquetes encriptados por lo que no podremos saber que se está transmitiendo a diferencia del srevidor HTTP. 



