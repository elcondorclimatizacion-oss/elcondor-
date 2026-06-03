const fs = require('fs');
const path = require('path');

const dirPath = "c:\\Users\\PABLO\\OneDrive\\Desktop\\fotos highvolt";
const outPath = "c:\\Users\\PABLO\\OneDrive\\Desktop\\PROYECTO EL CONDOR\\scratch\\photos_js.txt";

if (!fs.existsSync(dirPath)) {
    console.error("Directory not found:", dirPath);
    process.exit(1);
}

const files = fs.readdirSync(dirPath).filter(f => {
    const ext = path.extname(f).toLowerCase();
    return ext === '.jpeg' || ext === '.jpg';
});

const captionsMap = {
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
};

const defaultCaptions = [
    "Instalación de Tableros Eléctricos y Protecciones Especiales",
    "Normalización de Instalaciones Eléctricas de Alta Exigencia",
    "Cableado y Peinado Estético bajo Normas AEA",
    "Instalación de Sistemas de Iluminación y Tomas de Fuerza Motriz",
    "Tendido y Canalizaciones Eléctricas Profesionales"
];

const outJs = [];
files.forEach((f, idx) => {
    let caption = "";
    for (const [k, v] of Object.entries(captionsMap)) {
        if (f.includes(k)) {
            caption = v;
            break;
        }
    }
    if (!caption) {
        caption = defaultCaptions[idx % defaultCaptions.length];
    }

    const escapedCaption = caption.replace(/"/g, '\\"');
    const item = `            { src: "FOTOS/${f}", category: "electricidad", caption: "${escapedCaption}" },`;
    outJs.push(item);
});

fs.writeFileSync(outPath, outJs.join("\n"), "utf8");
console.log(`Successfully generated ${outJs.length} photo array items.`);
