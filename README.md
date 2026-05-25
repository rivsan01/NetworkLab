# 🌐 NetworkLab

![Network Security](https://img.shields.io/badge/Security-MITM-red)
![Kali Linux](https://img.shields.io/badge/OS-Kali%20Linux-blue)
![Networking](https://img.shields.io/badge/Skill-Networking-brightgreen)

Este repositorio es un entorno práctico de laboratorio donde demuestro mis conocimientos sobre redes, transporte de paquetes, protocolos y distintos servicios de comunicación cliente-servidor.

El enfoque principal del proyecto es la monitorización y análisis del tráfico de red a través de la ejecución de un ataque **Man-in-the-Middle (MITM)**, utilizando una máquina virtual con **Kali Linux**.

## 📂 Estructura del Repositorio

* 📁 **`images/`**: Contiene las capturas de pantalla y evidencias visuales de la topología, ejecución del ataque y la interceptación de tráfico.
* 📁 **`write-ups/`**: Documentación y explicaciones detalladas (paso a paso) sobre el comportamiento de la red y los protocolos analizados.
* 📁 **`scripts/`**: Scripts codificados en Bash para automatizar ciertas tareas que puedan ser repetitivas como comprobar la conectividad cliente-servidor asi como comprobar logs en el servidor.

## 🛠️ Entorno y Herramientas

El escenario de pruebas está simulado en un entorno controlado compuesto por:
* **Máquina Atacante**: Kali Linux.
* **Cliente y Servidor**: Máquinas Ubuntu Servidor y Clietne entre las que se genera el tráfico real.
* **Herramientas de Red/Análisis**: *Wireshark* e interceptación de paquetes.

## 🔍 Objetivos del Laboratorio

1. **Ataque Man-in-the-Middle (MITM):** Redirección exitosa del tráfico entre el cliente y el servidor para que pase por la máquina atacante.
2. **Monitorización de Tráfico:** Uso de analizadores de protocolos para la captura de paquetes en tiempo real.
3. **Análisis de Protocolos:** Comprensión de las capas de red, el transporte de datos y los riesgos de utilizar servicios y protocolos no cifrados.
4. **Scripts para Automatización de Tareas** Creación de distintos scripts para minimizar distintas tareas que puedan ser repetitivas del cliente y del servidor.

## 📸 Demostración, Evidencias y Scripts

En los distintos write-ups se demuestra como se han interceptado los paquetes a través de distintos protocolos y servicios en distintas situaciones ya sean por HTTP, HTTPS, DNS y SSH. Además, se analizan los distintos paquetes y datos relevantes interceptados en cada uno de ellos.

*(Puedes consultar todas las evidencias gráficas dentro del directorio [`images/`](./images) y las explicaciones teóricas en la carpeta [`write-ups/`](./write-ups)).*

Finalmente, se ha procedido a crear dos scripts en Bash que automaticen ciertas tareas repetivas y que son criticas realizar entre Cliente-Servidor asi como distintos logs que son importante tener en cuenta.
---
> **⚠️ Aviso Legal:** Este repositorio y sus demostraciones han sido creados en un entorno de laboratorio estrictamente controlado. Su propósito es 100% educativo y orientado al aprendizaje sobre ciberseguridad y redes.
