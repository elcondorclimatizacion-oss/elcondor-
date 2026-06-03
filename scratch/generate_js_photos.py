import os
import re

dir_path = r"c:\Users\PABLO\OneDrive\Desktop\fotos highvolt"
files = [f for f in os.listdir(dir_path) if f.lower().endswith(('.jpeg', '.jpg'))]

captions_map = {
    "8.13.19": "Montaje y Conexión de Tablero Eléctrico Principal Seccional",
    "8.13.20": "Medición y Distribución de Fases en Tablero Principal",
    "8.13.21": "Distribución Peinada de Térmicas y Disyuntores",
    "8.13.22": "Instalación y Medición de Jabalina de Puesta a Tierra",
    "8.13.23": "Conexión de Protectores de Tensión e Indicadores LED",
    "23.13.48": "Normalización de Acometida Principal Eléctrica",
    "23.13.49": "Tablero de Distribución Seccional en Obra de Gran Envergadura",
    "23.13.50": "Cableado Estructurado y Canalización de Tableros de Comando",
    "23.13.53": "Montaje de Bandejas Portacables y Canalizaciones de Fuerza Motriz",
    "23.13.54": "Normalización Eléctrica Completa y Rotulado de Tablero Principal",
    "23.13.55": "Terminación y Peinado de Tablero con Terminales Tubulares",
    "23.23.26": "Mantenimiento Preventivo de Tablero General Residencial",
    "23.23.27": "Certificación de Medición de Puesta a Tierra y Continuidad",
    "11.15.02": "Instalación Eléctrica e Interconexión de Unidades de Climatización",
    "11.15.03": "Canalización y Conexión de Fuerza Motriz para Condensadoras",
    "11.19.09": "Instalación Eléctrica de CCTV y Fuentes Centralizadas de Seguridad",
    "1.04.01": "Cableado de Potencia y Señal de Control Estandarizado",
    "11.43.52": "Detalle de Peinado de Conductores en Canalizaciones",
    "11.44.02": "Tablero Principal de Obra de Seguridad con Tomas Industriales",
    "11.44.03": "Tendido de Alimentadores de Potencia e Interruptores de Cabecera",
    "11.44.04": "Puesta en Marcha y Verificación de Sentido de Giro Trifásico",
    "11.44.05": "Tablero Seccional de Iluminación y Automatismos Domóticos",
    "11.44.06": "Protecciones Termomagnéticas para Circuitos Seccionales",
    "11.44.07": "Aislación y Encintado Térmico de Tuberías y Drenajes",
    "11.44.09": "Conexión de Red y Servidor de Cámaras de Seguridad",
    "11.44.11": "Instalación de Rack de Telecomunicaciones y Patchera de Red",
}

default_captions = [
    "Instalación de Tableros Eléctricos y Protecciones Especiales",
    "Normalización de Instalaciones Eléctricas de Alta Exigencia",
    "Cableado y Peinado Estético bajo Normas AEA",
    "Instalación de Sistemas de Iluminación y Tomas de Fuerza Motriz",
    "Tendido y Canalizaciones Eléctricas Profesionales"
]

print("Scanning files:")
out_js = []
for idx, f in enumerate(files):
    # Find matching caption or assign default
    caption = ""
    for k, v in captions_map.items():
        if k in f:
            caption = v
            break
    if not caption:
        caption = default_captions[idx % len(default_captions)]
    
    # We escape double quotes
    escaped_caption = caption.replace('"', '\\"')
    
    item = f'            {{ src: "FOTOS/{f}", category: "electricidad", caption: "{escaped_caption}" }},'
    out_js.append(item)

# Write output file
out_path = r"c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\scratch\photos_js.txt"
os.makedirs(os.path.dirname(out_path), exist_ok=True)
with open(out_path, "w", encoding="utf-8") as out_f:
    out_f.write("\n".join(out_js))

print(f"Generated {len(out_js)} JS lines.")
