# Ejemplos para fabricar PCBs

Este repositorio reúne una serie de ejemplos prácticos para aprender y documentar el flujo de trabajo necesario para diseñar y fabricar placas de circuito impreso (PCB) de forma sencilla.

Los proyectos combinan **KiCad**, **FlatCAM** y **EZCAD 2**, desde el diseño eléctrico y la preparación de los archivos de fabricación hasta el grabado o corte de la placa con una máquina láser.

## Herramientas utilizadas

- **KiCad**: creación del esquemático, asignación de huellas, diseño de la placa y exportación de archivos Gerber.
- **FlatCAM**: preparación de los archivos Gerber y generación de geometrías vectoriales adecuadas para la fabricación.
- **EZCAD 2**: configuración del trabajo y envío de los archivos vectoriales a la máquina de grabado o corte.

## Flujo de trabajo general

1. Diseñar el circuito y la placa en KiCad.
2. Exportar los archivos de fabricación, principalmente Gerber, taladros y contorno de la placa.
3. Importar y procesar esos archivos en FlatCAM.
4. Exportar la geometría resultante, normalmente en formato DXF.
5. Importar el DXF en EZCAD 2 y configurar los parámetros de la máquina.
6. Realizar el grabado, corte o marcado sobre el material elegido.

Cada etapa puede requerir ajustes relacionados con las dimensiones, la escala, el origen, las capas, el ancho de las pistas, la herramienta y los parámetros de la máquina. Por ello, se recomienda comprobar siempre la geometría y hacer una prueba antes de fabricar la placa definitiva.

## Ejemplos disponibles

### [LED_TEST](./LED_TEST/)

Proyecto inicial de prueba con un circuito LED sencillo. Incluye el diseño en KiCad, exportación de archivos Gerber, preparación con FlatCAM y archivos listos para la etapa final de grabado o corte en EZCAD 2.

### [LED_TEST2](./LED_TEST2/)

Segunda iteración del mismo flujo de fabricación, con una placa de prueba adicional y archivos generados para la preparación vectorial: Gerber, contorno de placa, proyecto de FlatCAM y salida DXF para EZCAD 2. Sirve como referencia para comparar variaciones del diseño y del proceso de fabricación.

### [BLOCKS](./BLOCKS/)

Librería reutilizable de bloques de KiCad con un bloque llamado "SIMPLE LED". Permite encapsular y reutilizar partes del diseño para acelerar la creación de nuevos proyectos o variaciones del circuito base.

## Objetivo del repositorio

El objetivo es disponer de ejemplos reproducibles que sirvan como referencia para experimentar con el diseño de PCBs y entender la comunicación entre las distintas herramientas del proceso. Los archivos pueden utilizarse como punto de partida para crear diseños propios, reutilizar bloques funcionales y adaptar el flujo a diferentes máquinas y materiales.

## Videos útiles

- ARDUINOLOVER:
    - Commarker B4 Fiber Laser - PCB - Preparando los archivos  [LINK](https://www.youtube.com/watch?v=ZPhiWutrlDI&t=2s)
    - Commarker B4 Fiber Laser - Fabricando la PCB [LINK](https://www.youtube.com/watch?v=WB-G7eJQOjc&t=905s)

- KICAD:
    - KiCad 10 and FreeCAD 1.1 are substantial [LINK](https://www.youtube.com/watch?v=RrsPh7PYMvw)
    - KiCad Design Blocks Tutorial | Reuse Circuit Modules Easily [LINK](https://www.youtube.com/watch?v=wRWg5tdpsog)
