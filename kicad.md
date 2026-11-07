# Curso Completo de KiCad 10: De Cero a Diseñador de PCBs

¡Te damos la bienvenida al **Curso Maestro de KiCad 10**! Este repositorio contiene una formación completa, metódica y 100% práctica para aprender a diseñar circuitos electrónicos y placas de circuito impreso (**PCB**) profesionales con la versión más moderna y potente de la suite: **KiCad 10** (instalado en tu equipo en `E:\OPT\KICAD10.6`).

---

## Índice General

1. [¿Qué es KiCad y qué hace única a la versión 10?](#1-qué-es-kicad-y-qué-hace-única-a-la-versión-10)
2. [Estructura del Curso y Hoja de Ruta de Proyectos](#2-estructura-del-curso-y-hoja-de-ruta-de-proyectos)
3. [Guía Maestra de Librerías y Búsqueda de Componentes](#3-guía-maestra-de-librerías-y-búsqueda-de-componentes)
   - [Búsqueda de Símbolos en el Esquemático](#31-búsqueda-de-símbolos-en-el-esquemático)
   - [Nombres de los Símbolos Más Comunes](#32-nombres-de-los-símbolos-más-comunes)
   - [Catálogo de Huellas (Footprints): THT vs SMD](#33-catálogo-de-huellas-footprints-tht-vs-smd)
4. [El Flujo de Trabajo en KiCad Paso a Paso (The Design Pipeline)](#4-el-flujo-de-trabajo-en-kicad-paso-a-paso)
   - [Paso 1: Creación del Proyecto](#paso-1-creación-del-proyecto)
   - [Paso 2: Captura del Esquemático (`eeschema`)](#paso-2-captura-del-esquemático-eeschema)
   - [Paso 3: Asignación de Huellas Físicas](#paso-3-asignación-de-huellas-físicas)
   - [Paso 4: Sincronización Esquemático-PCB (F8)](#paso-4-sincronización-esquemático-pcb-f8)
   - [Paso 5: Definición del Borde de Placa (`Edge.Cuts`)](#paso-5-definición-del-borde-de-placa-edgecuts)
   - [Paso 6: Ubicación Estratégica de Componentes](#paso-6-ubicación-estratégica-de-componentes)
   - [Paso 7: Ruteo Interactivo de Pistas](#paso-7-ruteo-interactivo-de-pistas)
   - [Paso 8: Creación de Planos de Masa (Zonas de Cobre)](#paso-8-creación-de-planos-de-masa-zonas-de-cobre)
   - [Paso 9: Serigrafía y Acabado Estético](#paso-9-serigrafía-y-acabado-estético)
   - [Paso 10: Comprobación de Reglas de Diseño (DRC)](#paso-10-comprobación-de-reglas-de-diseño-drc)
   - [Paso 11: Inspección Fotorrealista 3D](#paso-11-inspección-fotorrealista-3d)
   - [Paso 12: Generación de Archivos de Fabricación (Gerber y Drill)](#paso-12-generación-de-archivos-de-fabricación-gerber-y-drill)
5. [Automatización y Línea de Comandos (`kicad-cli`)](#5-automatización-y-línea-de-comandos-kicad-cli)
6. [Cómo Utilizar este Curso](#6-cómo-utilizar-este-curso)

---

## 1. ¿Qué es KiCad y qué hace única a la versión 10?

KiCad es la suite libre y de código abierto (GPL) líder a nivel mundial para el diseño y automatización electrónica (**EDA**). A diferencia de herramientas privativas que imponen límites de capas, tamaños de placa o requieren costosas suscripciones anuales, KiCad no tiene ninguna limitación en el número de capas de cobre, complejidad del circuito o escala industrial de producción.

### Principales Ventajas de KiCad 10 (Build 10.0.6)
Tu instalación ubicada en `E:\OPT\KICAD10.6` cuenta con las características más avanzadas de la arquitectura de décima generación:
- **Motor de Renderizado Acelerado**: Rendimiento fluido en PCBs multicapa masivas con aceleración por hardware (OpenGL) y un motor de **Trazado de Rayos (Raytracing)** fotográfico en el visor 3D que calcula sombras, reflejos de cobre y refracción en plásticos.
- **Enrutador Interactivo Push & Shove**: Permite trazar pistas complejas mientras el motor aparta automáticamente las pistas y vías circundantes respetando los aislamientos (*clearances*), o camina alrededor de obstáculos (*Walkaround*).
- **Precisión Geométrica de 64 bits**: Capacidad de diseñar desde microchips a escala nanométrica hasta tarjetas de comunicaciones de varios metros sin pérdida de precisión.
- **Formato Nativo S-Expression (sexpr)**: Todos los archivos (`.kicad_sch`, `.kicad_pcb`, `.kicad_sym`, `.kicad_mod`) son archivos de texto plano estructurados en listas Lisp. Esto permite gestionarlos con **Git**, inspeccionar diferencias línea a línea (*diffs*) y manipularlos mediante scripts.
- **Potente API de Python (`pcbnew`)**: Control total programático del editor de PCB para generar circuitos, automatizar ruteos y crear extensiones.
- **Suite de Línea de Comandos Unificada (`kicad-cli.exe`)**: Permite exportar Gerbers, generar taladros, exportar esquemáticos a SVG/PDF, calcular listas de materiales (BOM) y renderizar vistas 3D en PNG sin abrir la interfaz gráfica.

---

## 2. Estructura del Curso y Hoja de Ruta de Proyectos

El curso está organizado en **5 proyectos completos** ordenados pedagógicamente por dificultad creciente, ubicados en sus respectivas subcarpetas dentro de este directorio macro:

```
KiCad_Course/
├── README.md                           <-- Este manual maestro de referencia
├── scripts/
│   └── build_projects.py               <-- Script generador y renderizador en Python
├── 01_LED_Indicator_Basic/             <-- NIVEL 1: Fundamentos y Ley de Ohm
├── 02_Timer_555_Astable/               <-- NIVEL 2: Integrados DIP-8 y Temporización RC
├── 03_Arduino_Nano_Weather_OLED/       <-- NIVEL 3: Microcontroladores, Bus I2C y Sensores
├── 04_ESP32_PulseOximeter_OLED/        <-- NIVEL 4: IoT, Baterías LiPo, LDOs y Señales Biomédicas
└── 05_Dual_Power_Supply_5V_3V3/        <-- NIVEL 5: Fuentes de Alimentación y Térmica
```

### Resumen de Proyectos:

| Carpeta | Título del Proyecto | Conceptos Clave | Hardware Incluido |
|:---|:---|:---|:---|
| [`01_LED_Indicator_Basic`](./01_LED_Indicator_Basic/README.md) | **Circuito Básico Indicador LED** | Ley de Ohm, cálculo de resistencias, primer esquemático y PCB, comparativa directa THT vs SMD, ruteo básico y plano de masa. | Bornera 2 pines, interruptor deslizante, condensador desacoplo, LED 5mm THT + resistencia 330Ω, LED SMD 0805 + resistencia 1kΩ. |
| [`02_Timer_555_Astable`](./02_Timer_555_Astable/README.md) | **Oscilador Astable NE555** | Circuitos integrados en formato DIP-8, constantes de tiempo RC, ajuste de frecuencia analógica con potenciómetro, condensadores electrolíticos. | NE555P, potenciómetro 100k, resistencias de temporización, condensador 10µF, desacoplo de 10nF en pin CV, LED indicador. |
| [`03_Arduino_Nano_Weather_OLED`](./03_Arduino_Nano_Weather_OLED/README.md) | **Arduino Nano con OLED y DHT22** | Shields para microcontroladores, zócalos hembra de 15.24mm, comunicación digital I2C con pull-ups, bus 1-wire, diodo Schottky de protección contra polaridad inversa en batería. | Zócalos hembra 1x15, Arduino Nano V3, OLED 0.96" SSD1306, sensor DHT22, diodo 1N5819, bornera para batería 7-12V. |
| [`04_ESP32_PulseOximeter_OLED`](./04_ESP32_PulseOximeter_OLED/README.md) | **ESP32 con Pulsoxímetro y OLED** | Dispositivos IoT y wearables, sensor biomédico fotopletismográfico MAX30102 con interrupción hardware, batería LiPo con conector JST-PH 2.0 y bornera, regulador LDO AMS1117-3.3 en SOT-223, divisor resistivo filtrado para monitoreo de batería en ADC. | ESP32 DevKit 38 pines, sensor MAX30102, display OLED I2C, conector JST-PH 2.0, bornera de tornillo, AMS1117-3.3, divisor 100k/100k con filtro 100nF, LED Heartbeat. |
| [`05_Dual_Power_Supply_5V_3V3`](./05_Dual_Power_Supply_5V_3V3/README.md) | **Fuente Regulada Dual 5V y 3.3V** | Etapas de potencia y diseño térmico, regulación lineal en cascada (12V $\rightarrow$ 5V $\rightarrow$ 3.3V), fusible rearmable PTC (Polyfuse 1.1A), diodo de 3A, disipadores de calor TO-220 y SOT-223, pistas de alta corriente (1.2mm). | Jack DC 2.1mm, bornera de entrada 7-15V, Polyfuse 1.1A, Schottky SS34 3A, LM7805, AMS1117-3.3, batería de condensadores de filtrado, borneras de salida independientes y peine 2x4. |

---

## 3. Guía Maestra de Librerías y Búsqueda de Componentes

Uno de los mayores desafíos para quien comienza en KiCad es saber **cómo se llama el componente** y **en qué librería buscarlo**, tanto en el esquemático (símbolo) como en la PCB (huella física).

### 3.1 Búsqueda de Símbolos en el Esquemático
Al pulsar la tecla **`A`** en el editor de esquemáticos se abre el buscador universal. Los símbolos están agrupados por familias lógicas:

```
[Nombre_Librería] : [Nombre_Símbolo]
Ejemplo: Device:R   (Resistencia dentro de la librería Device)
```

### 3.2 Nombres de los Símbolos Más Comunes

| Componente | Qué escribir en el buscador | Librería Oficial | Descripción |
|---|:---:|:---:|---|
| **Resistencia estándar** | `R` | `Device` | Símbolo rectangular estándar europeo (IEC). |
| **Resistencia americana**| `R_US` | `Device` | Símbolo en zig-zag tradicional (IEEE). |
| **Potenciómetro** | `R_Potentiometer` | `Device` | Resistor variable con 3 terminales (extremos y cursor central). |
| **Condensador cerámico** | `C` | `Device` | Condensador no polarizado de dos placas paralelas. |
| **Condensador electrolítico** | `C_Polarized` | `Device` | Condensador con polaridad positiva (+) y negativa (-). |
| **Diodo rectificador** | `D` | `Device` | Diodo estándar semiconductor PN (ej. 1N4007). |
| **Diodo Schottky** | `D_Schottky` | `Device` | Diodo de conmutación rápida y baja caída directa (ej. 1N5819, SS34). |
| **Diodo Zener** | `D_Zener` | `Device` | Diodo regulador de tensión en polarización inversa. |
| **Diodo LED** | `LED` | `Device` | Diodo emisor de luz con flechas indicadoras. |
| **Fusible rearmable PTC** | `Polyfuse` | `Device` | Fusible polimérico térmico de coeficiente positivo. |
| **Bornera de tornillo 2P** | `Screw_Terminal_01x02` | `Connector` | Bloque terminal con tornillos para conectar cables pelados. |
| **Conector Jack DC** | `Barrel_Jack` | `Connector` | Conector hembra circular de 2.1mm o 2.5mm para alimentadores de pared. |
| **Tira de pines macho** | `Conn_01x02`, `Conn_01x04` | `Connector_Generic` | Conectores genéricos de paso 2.54mm de 1 fila. |
| **Peine de pines doble** | `Conn_02x04_Odd_Even` | `Connector_Generic` | Tira de 2 filas de 4 pines (8 pines en total). |
| **Interruptor deslizante**| `SW_SPDT` | `Switch` | Interruptor unipolar de dos tiros (3 pines: común y dos salidas). |
| **Pulsador táctil** | `SW_Push` | `Switch` | Pulsador normalmente abierto tipo push-button de 6x6mm. |
| **Temporizador 555** | `NE555P` o `LM555` | `Timer` | Circuito integrado temporizador de 8 pines. |
| **Regulador 5V TO-220** | `LM7805_TO220` | `Regulator_Linear` | Regulador lineal de 5V clásico de 3 terminales. |
| **Regulador LDO 3.3V** | `AMS1117-3.3` | `Regulator_Linear` | Regulador SMD de baja caída para 3.3V. |
| **Símbolo de Masa (GND)**| `GND` | `power` | Plano de referencia de 0V. |
| **Símbolos de Voltaje** | `+5V`, `+3.3V`, `+9V`, `VCC` | `power` | Nodos de alimentación positiva. |
| **Bandera de Potencia** | `PWR_FLAG` | `power` | Indica al verificador ERC que una red tiene origen de energía. |

---

### 3.3 Catálogo de Huellas (Footprints): THT vs SMD

Una vez dibujado el símbolo eléctrico, debemos asociarle su **huella física (Footprint)** para el editor de PCB.

#### ¿Cuál es la diferencia entre THT y SMD?

![](./imgs/Gemini_Generated_Image_dl2vo4dl2vo4dl2v.jpeg)

#### Nombres de Huellas Oficiales de KiCad:

```
[Librería_Huellas] : [Nombre_Exacto_de_la_Huella]
```

##### 1. Resistencias:
- **THT**: `Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal`
  - *Desglose*: Resistencia cilíndrica estándar de 1/4W (longitud 6.3mm, diámetro 2.5mm, distancia entre taladros `P = 7.62mm` o 300 mil).
- **SMD**: `Resistor_SMD:R_0805_2012Metric`
  - *Desglose*: Encapsulado rectangular de tamaño 0805 en pulgadas (0.08 x 0.05 pulgadas) o 2012 en milímetros (2.0 x 1.25 mm). Es el tamaño ideal para iniciarse en soldadura SMD manual. Otros tamaños comunes: `0603` (más pequeño) y `1206` (más grande, soporta 1/4W).

##### 2. Condensadores:
- **THT Electrolítico**: `Capacitor_THT:CP_Radial_D5.0mm_P2.50mm`
  - *Desglose*: Condensador cilíndrico de 5mm de diámetro exterior con separación entre patillas de `2.50mm`.
- **THT Cerámico**: `Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm`
  - *Desglose*: Condensador cerámico tipo lenteja de 5mm de diámetro con paso entre pines de `5.00mm`.
- **SMD**: `Capacitor_SMD:C_0805_2012Metric` o `Capacitor_SMD:C_1206_3216Metric`.

##### 3. Diodos y LEDs:
- **LED THT 5mm**: `LED_THT:LED_D5.0mm` (cúpula redonda tradicional).
- **LED SMD 0805**: `LED_SMD:LED_0805_2012Metric`.
- **Diodo THT**: `Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal` (encapsulado estándar para 1N4001..1N4007 y 1N5819).
- **Diodo SMD**: `Diode_SMD:D_SMA` o `Diode_SMD:D_SOD-123`.

##### 4. Conectores y Borneras:
- **Bornera de 2 pines paso 5.08mm**: `TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal` (el estándar industrial de tornillo verde).
- **Conector Jack DC 2.1mm**: `Connector_BarrelJack:BarrelJack_Horizontal`.
- **Conector JST para batería LiPo**: `Connector_JST:JST_PH_B2B-PH-K_1x02_P2.00mm_Vertical` (paso de 2.00mm).
- **Tira de pines macho paso 2.54mm**: `Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical`.
- **Zócalos hembra paso 2.54mm**: `Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical`.

##### 5. Circuitos Integrados y Reguladores:
- **Encapsulado DIP-8 (THT)**: `Package_DIP:DIP-8_W7.62mm` (ancho entre filas de 7.62mm / 300 mil).
- **Regulador TO-220 (THT)**: `Package_TO_SOT_THT:TO-220-3_Vertical` (para LM7805).
- **Regulador SOT-223 (SMD)**: `Package_TO_SOT_SMD:SOT-223-3_TabPin2` (para AMS1117-3.3).

---

## 4. El Flujo de Trabajo en KiCad Paso a Paso

El proceso de desarrollo de hardware electrónico sigue una metodología estricta y secuencial. Saltarse pasos o alterar su orden suele generar placas defectuosas o inservibles:

![](./imgs/Gemini_Generated_Image_83hkbt83hkbt83hk.jpeg)

---

### Paso 1: Creación del Proyecto
1. Abre KiCad desde `E:\OPT\KICAD10.6\bin\kicad.exe`.
2. Haz clic en **Archivo $\rightarrow$ Nuevo Proyecto...**.
3. Selecciona la carpeta de destino y dale un nombre significativo (ej. `Mi_Primer_Circuito`).
4. KiCad creará un contenedor de proyecto `.kicad_pro` que sincroniza el esquemático (`.kicad_sch`) con la placa de circuito impreso (`.kicad_pcb`).

---

### Paso 2: Captura del Esquemático (`eeschema`)
1. Haz doble clic en el archivo `.kicad_sch`.
2. **Colocación de Símbolos**: Pulsa la tecla **`A`** (*Add Symbol*), escribe el nombre del componente (ej. `R`, `LED`, `Screw_Terminal_01x02`) y haz clic para posicionarlo.
3. **Conexión de Cables**: Pulsa **`W`** (*Wire*) y haz clic entre los extremos de los pines para trazar la línea verde de conexión.
4. **Etiquetas de Red (Net Labels)**: Para evitar cruzar cables a lo largo de toda la hoja, pulsa **`L`** y escribe un nombre de red (ej. `I2C_SDA`, `I2C_SCL`, `RESET`). Todo cable conectado a una etiqueta con el mismo nombre quedará internamente unido.
5. **Alimentación y Masa**: Pulsa **`P`** (*Power Symbol*) para colocar `GND`, `+5V` o `+3.3V`.
6. **El papel de `PWR_FLAG`**: KiCad realiza una comprobación de que cada nodo de alimentación recibe corriente de una fuente. Si alimentas tu placa mediante una bornera de tornillo o un pinheader, KiCad no sabe que allí conectarás una batería, por lo que emitirá el error: *"Pin de entrada de potencia no alimentado"*. Para solucionarlo, coloca un símbolo `PWR_FLAG` conectado a la red `+9V` y otro conectado a `GND`.
7. **Anotación de Componentes**: Si tus componentes tienen nombres como `R?` o `D?`, ve a **Herramientas $\rightarrow$ Anotar Esquemático...** para asignar automáticamente números únicos (`R1`, `R2`, `D1`...).
8. **Comprobación de Reglas Eléctricas (ERC)**: Haz clic en el icono del insecto con una lupa o ve a **Inspeccionar $\rightarrow$ Comprobador de Reglas Eléctricas (ERC)**. Asegúrate de resolver todos los errores y advertencias antes de continuar.

---

### Paso 3: Asignación de Huellas Físicas
Cada símbolo abstracto del esquemático debe asociarse a una huella física real:
1. Ve a **Herramientas $\rightarrow$ Asignar Huellas...**.
2. Se abrirá una ventana de tres columnas:
   - **Columna izquierda**: Librerías de huellas disponibles en tu instalación de KiCad.
   - **Columna central**: Lista de todos los componentes de tu circuito (`R1`, `C1`, `U1`...).
   - **Columna derecha**: Huellas individuales dentro de la librería seleccionada.
3. Selecciona el componente y haz doble clic sobre la huella deseada (por ejemplo, para `R1` selecciona `Resistor_THT` y luego `R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal`).
4. Haz clic en **Aceptar y Guardar Esquemático**.

---

### Paso 4: Sincronización Esquemático-PCB (F8)
1. Con el esquemático guardado, pulsa la tecla **`F8`** (o ve a **Herramientas $\rightarrow$ Actualizar PCB desde Esquemático**).
2. Se abrirá una ventana con el reporte de componentes añadidos y redes conectadas. Haz clic en **Actualizar PCB**.
3. Mueve el cursor al área de trabajo de `pcbnew`: verás todos los componentes agrupados unidos por líneas finas blancas. Estas líneas reciben el nombre de **Ratsnest** (nido de ratas) e indican las conexiones eléctricas que aún faltan por rutear con cobre.
4. Haz un clic izquierdo para depositar los componentes.

---

### Paso 5: Definición del Borde de Placa (`Edge.Cuts`)
Una placa sin contorno no se puede fabricar porque la máquina de fresado CNC no sabe dónde cortar:
1. En el panel lateral derecho de **Capas**, haz clic sobre **`Edge.Cuts`** para activarla (se mostrará con una flecha o color resaltado).
2. Selecciona la herramienta **Dibujar Rectángulo** (barra lateral derecha o atajo `Ctrl + Mayús + R`).
3. Dibuja un rectángulo que envuelva holgadamente la zona de trabajo (por ejemplo $60 \times 40\text{ mm}$).
4. *Importante*: El contorno debe ser un polígono **completamente cerrado**, sin extremos abiertos ni líneas superpuestas.
5. Coloca 4 taladros de montaje en las esquinas: Pulsa la tecla **`O`** (*Add Footprint*), busca `MountingHole:MountingHole_3.2mm_M3` y ubícalos a $3.5\text{ mm}$ de cada borde.

---

### Paso 6: Ubicación Estratégica de Componentes
El éxito del ruteo depende en un 80% de una buena colocación inicial:
1. **Conectores en los bordes**: Todas las borneras de tornillo (`J1`), conectores de batería (JST), jacks de alimentación y pulsadores deben colocarse en el perímetro de la placa, con sus aberturas de inserción orientadas hacia afuera.
2. **Desacoplos pegados a los pines**: Cada condensador cerámico de desacoplo ($100\text{nF}$) debe ubicarse a menos de $2-3\text{ mm}$ del pin de alimentación del circuito integrado o sensor correspondiente.
3. **Flujo lógico de señal**: Organiza los componentes de izquierda a derecha (por ejemplo: Entrada de Alimentación $\rightarrow$ Regulación $\rightarrow$ Microcontrolador $\rightarrow$ Sensores y Pantallas).
4. **Atajos clave**:
   - **`M`**: Mover componente seleccionado.
   - **`R`**: Rotar componente 90 grados.

---

### Paso 7: Ruteo Interactivo de Pistas
1. Selecciona en el panel de capas la capa de cobre superior (**`F.Cu`**) o inferior (**`B.Cu`**).
2. Pulsa la tecla **`X`** (*Route Tracks*).
3. Haz clic sobre un pad: KiCad resaltará automáticamente en amarillo el pad de destino y mostrará la guía visual de la conexión.
4. **Reglas de Ancho de Pista**:
   - Señales digitales y sensores: **$0.25\text{ mm} - 0.50\text{ mm}$**.
   - Pistas de alimentación ($V_{CC}$, $+5\text{V}$, $+3.3\text{V}$, Batería): **$0.80\text{ mm} - 1.20\text{ mm}$** para soportar corriente sin caída de tensión ni calentamiento.
   - Puedes configurar anchos predefinidos en **Configuración de la Placa $\rightarrow$ Clases de Red**.
5. **Cambio de Capa con Vías**: Si durante el ruteo encuentras un cruce de pistas bloqueado, pulsa la tecla **`V`** mientras ruteas: KiCad colocará una vía pasante metalizada (*Via*) y conmutará automáticamente a la capa opuesta para que continúes sin chocar.
6. **Evita esquinas a 90 grados**: Rutea siempre con quiebros a **45 grados** para evitar acumulación de ácido durante el grabado químico y minimizar reflexiones de señal.

---

### Paso 8: Creación de Planos de Masa (Zonas de Cobre)
En lugar de rutear manualmente decenas de pistas de masa (`GND`), se cubre la totalidad de la capa inferior con un plano masivo de cobre:
1. Selecciona la herramienta **Añadir Zona Rellena** (atajo `Ctrl + Mayús + Z`).
2. Haz clic dentro de la placa: se abrirá un cuadro de diálogo.
3. Selecciona la capa **`B.Cu`** y asocia la zona a la red **`GND`**.
4. En la opción *Conexión a pads*, selecciona **Alivio Térmico (Thermal Relief)**. Esto genera unas pequeñas cruces de cobre en los pads pasantes para que el calor del soldador manual no se disipe inmediatamente por toda la placa.
5. Dibuja los cuatro vértices del rectángulo cubriendo el contorno de la placa.
6. Pulsa la tecla **`B`**: KiCad calculará instantáneamente el relleno de cobre, sorteando todas las pistas existentes y conectando automáticamente todos los pines de GND.

---

### Paso 9: Serigrafía y Acabado Estético
Una placa profesional debe poder ensamblarse sin consultar el esquemático:
1. Selecciona la capa de serigrafía superior (**`F.SilkS`**).
2. Usa la herramienta de texto (icono `T` en la barra lateral) para añadir:
   - Polaridad en borneras: marcas `+` y `-`.
   - Nombres de los pines en los conectores de pantallas y sensores: `GND`, `VCC`, `SCL`, `SDA`.
   - Título del proyecto, versión y fecha (ej. `Estacion Meteo V1.0 - 2026`).

---

### Paso 10: Comprobación de Reglas de Diseño (DRC)
Antes de enviar a fabricar, es obligatorio ejecutar el **DRC (Design Rules Check)**:
1. Ve a **Inspeccionar $\rightarrow$ Comprobador de Reglas de Diseño (DRC)**.
2. Haz clic en **Ejecutar DRC**.
3. El verificador comprobará:
   - Que no existan conexiones incompletas en el *ratsnest* (redes sin rutear).
   - Que ninguna pista esté más cerca de otra de lo permitido por la separación mínima (*clearance*).
   - Que ningún texto de serigrafía tape un pad de soldadura.
4. **Meta obligatoria**: Cero errores y cero advertencias críticas.

---

### Paso 11: Inspección Fotorrealista 3D
1. Pulsa el atajo universal **`Alt + 3`** (o ve a **Ver $\rightarrow$ Visor 3D**).
2. Se abrirá una ventana con el modelo tridimensional completo de la placa con acabados de máscara de soldadura, estañado y componentes 3D montados.
3. Usa el ratón para rotar en 360 grados, hacer zoom y verificar:
   - Que no haya colisiones físicas entre componentes altos (condensadores electrolíticos vs zócalos).
   - Que las borneras y conectores apunten hacia el exterior.
   - Que los textos de serigrafía sean legibles.

---

### Paso 12: Generación de Archivos de Fabricación (Gerber y Drill)
Los fabricantes de circuitos impresos (JLCPCB, PCBWay, OSH Park, Eurocircuits, etc.) no leen archivos `.kicad_pcb`; requieren archivos estándar **Gerber (RS-274X)** y de perforación **Excellon**:
1. En el editor de PCB, ve a **Archivo $\rightarrow$ Trazar... (Plot)**.
2. Asegúrate de marcar las capas esenciales:
   - `F.Cu` (Cobre superior)
   - `B.Cu` (Cobre inferior)
   - `F.Paste` / `B.Paste` (Pasta de soldadura para SMD)
   - `F.Silks` / `B.Silks` (Serigrafía blanca superior e inferior)
   - `F.Mask` / `B.Mask` (Máscara antisoldante)
   - `Edge.Cuts` (Borde de corte exterior)
3. Haz clic en **Trazar (Plot)**.
4. En la misma ventana, haz clic en **Generar Archivos de Taladros... (Generate Drill Files)**.
5. Selecciona formato *Excellon*, unidades en milímetros y haz clic en **Generar Archivo de Taladros**.
6. Comprime todos los archivos resultantes en un archivo `.zip`: ¡este ZIP es el que subes directamente a la web del fabricante para ordenar tus placas!

---

## 5. Automatización y Línea de Comandos (`kicad-cli`)

KiCad 10 cuenta con el binario `kicad-cli.exe` (ubicado en `E:\OPT\KICAD10.6\bin\kicad-cli.exe`), lo que permite automatizar tareas sin interacción gráfica.

### Comandos más utilizados:

#### 1. Exportar Esquemático a Vectorial SVG:
```powershell
& "E:\OPT\KICAD10.6\bin\kicad-cli.exe" sch export svg -o salida_svg "mi_proyecto.kicad_sch"
```

#### 2. Renderizar Vista 3D fotorrealista a PNG:
```powershell
& "E:\OPT\KICAD10.6\bin\kicad-cli.exe" pcb render --quality basic --side top -o preview_3d.png "mi_proyecto.kicad_pcb"
```

#### 3. Exportar Paquete Completo de Gerbers:
```powershell
& "E:\OPT\KICAD10.6\bin\kicad-cli.exe" pcb export gerbers -o gerber/ "mi_proyecto.kicad_pcb"
```

#### 4. Exportar Archivos de Taladro Excellon:
```powershell
& "E:\OPT\KICAD10.6\bin\kicad-cli.exe" pcb export drill -o gerber/ "mi_proyecto.kicad_pcb"
```

#### 5. Ejecutar DRC desatendido (para CI/CD en GitHub Actions):
```powershell
& "E:\OPT\KICAD10.6\bin\kicad-cli.exe" pcb drc --output drc_report.txt "mi_proyecto.kicad_pcb"
```

En la carpeta [`scripts/`](./scripts/) tienes a tu disposición el script `build_projects.py` que genera, valida y renderiza todos los proyectos del curso de forma desatendida utilizando la API de Python integrada en KiCad (`pcbnew`).

---

## 6. Cómo Utilizar este Curso

1. **Explora los Proyectos en Orden**:
   - Comienza por `01_LED_Indicator_Basic`: Abre el proyecto en KiCad y familiarízate con cómo se conectan el esquemático y la PCB.
   - Continúa con `02_Timer_555_Astable`: Analiza cómo interactúan los componentes analógicos y las patillas de un circuito integrado DIP.
   - Pasa a `03_Arduino_Nano_Weather_OLED`: Aprende a diseñar placas para microcontroladores y buses I2C.
   - Estudia `04_ESP32_PulseOximeter_OLED`: Observa el tratamiento de señales biomédicas, regulación LDO para Wi-Fi y baterías LiPo.
   - Concluye con `05_Dual_Power_Supply_5V_3V3`: Domina el diseño de potencia y la disipación térmica.
2. **Experimenta y Modifica**:
   - Abre cada proyecto, elimina una pista y vuelve a rutearla tú mismo con la tecla **`X`**.
   - Modifica el contorno en `Edge.Cuts` para practicar formas personalizadas.
   - Pulsa **`Alt + 3`** para ver el impacto de tus cambios en 3D en tiempo real.
3. **Genera tus Propias Placas**:
   - Utiliza las huellas, bloques y esquemas de este curso como plantillas y módulos de referencia para tus futuros desarrollos.

---
*Curso preparado para la suite KiCad 10 en Windows (`E:\OPT\KICAD10.6`).*
