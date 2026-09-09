# Test de PCB con EZCAD 2

Este proyecto muestra el flujo completo para diseñar, preparar y fabricar una PCB simple usando KiCad, FlatCAM y EZCAD 2.

## 1. Diseñar el circuito en KICAD

En esta etapa se crea el esquema eléctrico y la placa física del circuito, definiendo la distribución de los componentes y las conexiones finales.

### 1.1 Diseñar el esquemático
Se define el circuito base y se ubican los componentes principales del diseño.
![](./imgs/Screenshot%202026-09-08%20215324.png)

### 1.2 Asignar las huellas de los componentes simbólicos y las pcb (real)
Se configuran los footprints reales para que el diseño coincida con la fabricación de la placa.
![](./imgs/Screenshot%202026-09-08%20215153.png)

### 1.3 Conexión de las pistas y plano de masa
Se trazan las rutas del circuito y se agrega el plano de masa para mejorar la funcionalidad y la manufactura.
![](./imgs/Screenshot%202026-09-08%20224107.png)

### 1.4 Exportar la PCB
Se exportan los archivos de fabricación necesarios para continuar con el proceso de preparación del tablero.
![](./imgs/Screenshot%202026-09-08%20223129.png)

![](./imgs/Screenshot%202026-09-08%20223149.png)

## 2. Flatcam

FlatCAM sirve para transformar la geometría de la PCB en una salida lista para grabado o corte según la máquina utilizada.

### 2.1 Importar los archivos GBR de Kicad
Se cargan los archivos Gerber generados desde KiCad para preparar el diseño.
![](./imgs/Screenshot%202026-09-08%20224415.png)

### 2.2 Abrir las propiedades del archivo
Se revisan los parámetros de la geometría y la herramienta para ajustar la salida final.
![](./imgs/Screenshot%202026-09-08%20224609.png)

![](./imgs/Screenshot%202026-09-08%20223256.png)

![](./imgs/Screenshot%202026-09-08%20223336.png)

### 2.3 Exportación de la geometría creada
Se genera la geometría lista para importarla en EZCAD 2 y ejecutar la fabricación.
![](./imgs/Screenshot%202026-09-08%20223041.png)

![](./imgs/Screenshot%202026-09-08%20223402.png)

## 3. EZCAD 2

En esta etapa se importa la geometría final para configurar la máquina y realizar el grabado o corte del circuito en la placa.

### 3.1 Importar vector DXF
Se carga el archivo vectorial y se prepara la ejecución del trabajo sobre la PCB.
![](./imgs/Screenshot%202026-09-08%20225039.png)

![](./imgs/Screenshot%202026-09-08%20225105.png)

![](./imgs/Screenshot%202026-09-08%20225119.png)

![](./imgs/Screenshot%202026-09-08%20225604.png)

![](./imgs/Screenshot%202026-09-08%20225152.png)