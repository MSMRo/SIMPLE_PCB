/* =================================================================
   Fluorímetro Integrado + Case Arduino Mega 2560 R3 + Tapa Óptica
   - Cavidad del microtubo de 0.5 mL 100% pasante y visible desde abajo
   - Ventana inferior ampliada (d = 5.5 mm) para inspección directa
   - Disposición óptica perpendicular a 90°
   ================================================================= */

$fn = 50;

// =================================================================
// 1. PARÁMETROS DEL CASE ARDUINO MEGA 2560 R3
// =================================================================
mega_pcb_w       = 101.6; 
mega_pcb_d       = 53.34; 
mega_wall        = 3.0;   
mega_floor       = 2.0;   
standoff_h       = 2.5;   

case_outer_h     = 14.0;  
case_inner_h     = case_outer_h - mega_floor; 

standoff_od      = 6.5;   
standoff_id      = 2.8;   // Tornillo M3

clearance        = 0.8; 
case_inner_x     = mega_pcb_w + clearance * 2;
case_inner_y     = mega_pcb_d + clearance * 2;
case_outer_x     = case_inner_x + mega_wall * 2;
case_outer_y     = case_inner_y + mega_wall * 2;

mega_holes = [
    [14.0, 2.5],
    [15.2, 50.8],
    [90.2, 50.8],
    [96.5, 2.5]
];

usb_w            = 13.5;  
usb_y_pos        = 32.0;  
jack_w           = 11.5;  
jack_y_pos       = 3.0;   

// =================================================================
// 2. PARÁMETROS DEL BLOQUE ÓPTICO Y MICROTUBO 0.5 mL
// =================================================================
block_size       = 38.0;  
block_height     = 38.0;  
corner_radius    = 3.5;

// Microtubo de 0.5 mL (SureSeal MTC Bio o estándar)
tube_body_dia    = 8.4;   // Diámetro superior con holgura
cone_tip_dia     = 5.0;   // Diámetro en la base del cono
cone_height      = 12.0;  // Altura de la sección cónica
cylinder_height  = 16.0;  // Altura del cuerpo cilíndrico
rim_dia          = 13.5;  // Asiento para pestaña/anillo
rim_depth        = 3.5;   // Rebaje superior

// Ventana inferior de visualización
bottom_window_dia = 5.5;  // Orificio pasante amplio visible desde abajo
tube_bottom_z    = 5.0;   // Altura de la base del cono sobre el suelo

optical_z        = 11.5;  // Eje óptico apuntando al líquido en el cono
pinhole_dia      = 2.0;

tube_pos_x       = block_size / 2; // 19.0 mm
tube_pos_y       = block_size / 2; // 19.0 mm

// Placas AS7341 y Placa LED
pcb_w            = 26.0;
pcb_h            = 18.4;
pocket_depth     = 3.0;
hole_pitch_w     = 20.32;
hole_pitch_h     = 12.70;
mount_screw_dia  = 2.2;
mount_screw_len  = 6.5;

fluor_pos_x      = case_outer_x;
fluor_pos_y      = (case_outer_y - block_size) / 2;

// =================================================================
// 3. PARÁMETROS DE CUELLO Y TAPA
// =================================================================
collar_h         = 5.0;   
collar_od        = 21.0;  
collar_id        = 15.0;  
cap_clearance    = 0.25;  
cap_wall         = 2.0;   
cap_top_thick    = 2.5;   
knob_h           = 4.0;   
knob_dia         = 12.0;  

// =================================================================
// RENDERIZADO DEL CONJUNTO
// =================================================================
fluorimetro_completo();

translate([fluor_pos_x + block_size/2, -collar_od - 8, 0])
    tapa_fluorimetro();


// =================================================================
// MÓDULOS
// =================================================================

module fluorimetro_completo() {
    difference() {
        union() {
            // Case para Arduino Mega
            case_arduino_mega();

            // Bloque exterior del fluorímetro
            translate([fluor_pos_x, fluor_pos_y, 0])
                rounded_cube([block_size, block_size, block_height], corner_radius);

            // Cuello cilíndrico superior para la tapa
            translate([fluor_pos_x + tube_pos_x, fluor_pos_y + tube_pos_y, block_height])
                cylinder(h = collar_h, d = collar_od);
        }

        // =========================================================
        // CAVIDAD HUECA INTEGRAL DEL MICROTUBO (Pasante de arriba a abajo)
        // =========================================================
        translate([fluor_pos_x + tube_pos_x, fluor_pos_y + tube_pos_y, 0]) {
            // 1. Hueco inferior de visualización / inspección (desde Z=-1 hasta la punta)
            translate([0, 0, -1])
                cylinder(h = tube_bottom_z + 1.1, d = bottom_window_dia);

            // 2. Cono del microtubo (donde reposa la punta con la muestra líquida)
            translate([0, 0, tube_bottom_z])
                cylinder(h = cone_height, d1 = cone_tip_dia, d2 = tube_body_dia);

            // 3. Cuerpo cilíndrico principal
            translate([0, 0, tube_bottom_z + cone_height])
                cylinder(h = cylinder_height + 0.1, d = tube_body_dia);

            // 4. Asiento plano para el labio y la pestaña del tubo
            translate([0, 0, block_height - rim_depth])
                cylinder(h = rim_depth + 0.1, d = rim_dia);

            // 5. Cámara superior dentro del cuello para que la tapa cierre sin chocar
            translate([0, 0, block_height - 0.1])
                cylinder(h = collar_h + 1.0, d = collar_id);
        }

        // =========================================================
        // MONTAJES ÓPTICOS A 90°
        // =========================================================
        // Montura Sensor AS7341 (Cara Y externa)
        translate([fluor_pos_x, fluor_pos_y, 0])
            cavidad_montura();

        // Montura Placa LED (Cara X externa a 90°)
        translate([fluor_pos_x + block_size, fluor_pos_y, 0])
            rotate([0, 0, 90])
                cavidad_montura();

        // =========================================================
        // PASAMUROS DE CABLES HACIA EL ARDUINO
        // =========================================================
        translate([case_outer_x - mega_wall - 1, fluor_pos_y + 10.0, mega_floor + standoff_h])
            cube([mega_wall + 2, 18.0, 7.0]);
    }
}

// Cavidad de montaje con rebajes de componentes y agujeros para tornillos
module cavidad_montura() {
    // Pinhole óptico que comunica el sensor directamente con el tubo
    translate([tube_pos_x, -1, optical_z])
        rotate([-90, 0, 0])
            cylinder(h = tube_pos_y + 1, d = pinhole_dia);

    // Bolsillo donde encaja la placa PCB
    translate([tube_pos_x - pcb_w/2, -0.1, optical_z - pcb_h/2])
        cube([pcb_w, pocket_depth + 0.1, pcb_h]);

    // Despeje para conectores STEMMA QT
    translate([tube_pos_x - (pcb_w + 3.5)/2, -0.1, optical_z - 3.5])
        cube([pcb_w + 3.5, pocket_depth + 0.1, 7.0]);

    // Despeje para regleta de pines soldados
    translate([tube_pos_x - 9.0, -0.1, optical_z - pcb_h/2 - 2.0])
        cube([18.0, pocket_depth + 0.1, 4.0]);

    // 4 Agujeros para atornillar la placa (M2 / M2.5)
    for (dw = [-hole_pitch_w/2, hole_pitch_w/2]) {
        for (dh = [-hole_pitch_h/2, hole_pitch_h/2]) {
            translate([tube_pos_x + dw, pocket_depth - 0.1, optical_z + dh])
                rotate([-90, 0, 0])
                    cylinder(h = mount_screw_len, d = mount_screw_dia);
        }
    }
}

// Tapa Antifugas de Luz
module tapa_fluorimetro() {
    cap_inner_dia = collar_od + cap_clearance * 2;
    cap_outer_dia = cap_inner_dia + cap_wall * 2;
    cap_inner_h   = collar_h + 1.5; 
    cap_total_h   = cap_inner_h + cap_top_thick;

    union() {
        difference() {
            cylinder(h = cap_total_h, d = cap_outer_dia);

            translate([0, 0, -0.1])
                cylinder(h = cap_inner_h + 0.1, d = cap_inner_dia);

            translate([0, 0, -0.1])
                cylinder(h = 1.0, d1 = cap_inner_dia + 1.2, d2 = cap_inner_dia);
        }

        translate([0, 0, cap_total_h]) {
            cylinder(h = knob_h, d = knob_dia);
            for (a = [0 : 45 : 360]) {
                rotate([0, 0, a])
                    translate([knob_dia/2, 0, knob_h/2])
                        cylinder(h = knob_h, d = 1.5, center = true);
            }
        }
    }
}

// Case Arduino Mega 2560 Calibrado
module case_arduino_mega() {
    difference() {
        cube([case_outer_x, case_outer_y, case_outer_h]);

        translate([mega_wall, mega_wall, mega_floor])
            cube([case_inner_x, case_inner_y, case_inner_h + 1.0]);

        // Ranura de entrada para conector USB Tipo B
        translate([-1, mega_wall + clearance + usb_y_pos, mega_floor + standoff_h])
            cube([mega_wall + 2, usb_w, case_outer_h]);

        // Ranura de entrada para conector Jack DC
        translate([-1, mega_wall + clearance + jack_y_pos, mega_floor + standoff_h])
            cube([mega_wall + 2, jack_w, case_outer_h]);
    }

    for (h = mega_holes) {
        translate([mega_wall + clearance + h[0], mega_wall + clearance + h[1], mega_floor]) {
            difference() {
                cylinder(h = standoff_h, d = standoff_od);
                translate([0, 0, -0.5])
                    cylinder(h = standoff_h + 1.0, d = standoff_id);
            }
        }
    }
}

// Módulo auxiliar de redondeo
module rounded_cube(size, r) {
    x = size[0];
    y = size[1];
    z = size[2];
    hull() {
        translate([r, r, 0])         cylinder(h = z, r = r);
        translate([x - r, r, 0])     cylinder(h = z, r = r);
        translate([r, y - r, 0])     cylinder(h = z, r = r);
        translate([x - r, y - r, 0]) cylinder(h = z, r = r);
    }
}