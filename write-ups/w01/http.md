# Ataque Man-in-the-middle al servicio HTTP

En esta sección del laboratorio, procederemos a crear un servicio HTTP en el servidor al cual el cliente Ubuntu se conectará y con la MV Kali procederemos a realizar un attaque Man-in-the-middle para analizar, observar y comentar los paquetes mas importantes durante la transmisión de información

## Configuración HTTP Server
Primero, instalamos ``apache2`` para poder crear el servidor HTTP con el comando ``sudo apt install apache2 -y``. Luego, iniciamos el HTTP en la MV Ubuntu Servidor con el comando ``python3 -m http.server 8080``

![Creacion HTTP Server](/images/HTTP/CreacionHTTPServerUbuntuServer.png)

## Paquete GET del HTTP Server
Ahora, mientras el cliente Ubuntu se conecta al servidor HTTP con ``curl http://10.10.10.20``, en la MV Kali escuchamos la transmision de paquetes con la herramienta Wireshark:

![Paquete GET](/images/HTTP/WiresharkPaqueteGETHTTPKali.png)

Observamos que existen dos paquetes en la pagina de Wireshark con el filtro "http", el primero es la petición de la MV Ubuntu Cliente (10.10.10.10) a la MV Ubuntu Servidor (10.10.10.20) para conectarse al servidor HTTP. En segudo lugar vemos el paquete de respuesta del servidor dando el OK (Codigo 200).

La información relevante en este caso se encuentra abajo en la imagen ya que, interceptando el paquete, podemos ver desde que IP (**10.10.10.10**) a que IP destino (**10.10.10.20**) se envía, el tipo de paquete (**GET 200**), el comando usado (**curl**) y por qué puerto (**8080**).

## Paquete de respuesta del HTTP Server
Finalmente, en el otro paquete en el que se da la respuesta al cliente, al ser un servidor HTTP (NO CIFRADO) podemos ver, si interceptamos el mensaje, el código fuente directmente del servidor.

![Paquete Respuesa](/images/HTTP/WiresharkRespuestaHTTPKali.png)
