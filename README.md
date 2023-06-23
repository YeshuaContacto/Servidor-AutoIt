# Servidor-AutoIt

# Descripción del proyecto
[![AutoIt](https://img.shields.io/badge/AutoIt-blue?style=for-the-badge&logo=autoit&logoColor=white&labelColor=101010)]()

Este proyecto consiste en un servidor y un cliente escritos en AutoIt para establecer una comunicación TCP/IP. El servidor y el cliente permiten la ejecución remota de acciones en el sistema operativo.

## Servidor
El servidor se encarga de recibir las solicitudes del cliente y ejecutar las acciones correspondientes en el sistema. Al ejecutarse, muestra una interfaz gráfica que permite iniciar el servidor y visualizar los mensajes recibidos de los clientes.

El servidor escucha en una dirección IP y un puerto específicos, esperando la conexión de clientes. Una vez que un cliente se conecta, el servidor recibe un mensaje y realiza una acción correspondiente. En este ejemplo, las acciones posibles son abrir la calculadora, el bloc de notas o el programa Paint. Si se recibe un mensaje diferente, simplemente muestra el mensaje recibido en la interfaz gráfica.

## Cliente
El cliente proporciona una interfaz gráfica con botones que representan las acciones que se pueden enviar al servidor. Al hacer clic en un botón, se establece una conexión con el servidor y se envía una solicitud específica.

El cliente se conecta al servidor a través de la dirección IP y el puerto especificados. Luego, envía un mensaje al servidor indicando la acción seleccionada. En este caso, las acciones son abrir la calculadora, el bloc de notas o el programa Paint. También hay un botón para enviar un saludo al servidor.

## Uso
Ejecuta el servidor primero para iniciar la escucha en la dirección IP y el puerto especificados.
Luego, ejecuta el cliente y utiliza los botones para enviar solicitudes al servidor.
El servidor recibirá las solicitudes y ejecutará las acciones correspondientes en el sistema operativo.
Los mensajes y acciones realizadas se mostrarán en la interfaz gráfica del servidor.

## Nota: Asegúrate de tener habilitadas las conexiones TCP/IP y de que la dirección IP y el puerto especificados sean accesibles y estén disponibles.

¡Disfruta explorando la comunicación cliente-servidor con AutoIt!
