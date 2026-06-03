/**
 * 🦅 SCRIPT DE CONEXIÓN AUTOMÁTICA: IA -> NOTION API
 * Empresa: El Cóndor - Servicios Integrales
 * 
 * Este script envía una nueva tarjeta de idea/guion directamente a tu 
 * base de datos de Notion utilizando JavaScript nativo (sin instalaciones previas).
 */

// 🔑 CREDENCIALES PRIVADAS DEL USUARIO (Se cargan localmente para seguridad)
const fs = require('fs');
const path = require('path');

let NOTION_TOKEN = "TU_NOTION_TOKEN";
let DATABASE_ID = "TU_DATABASE_ID";

try {
    const configPath = path.join(__dirname, '..', 'config_notion.json');
    if (fs.existsSync(configPath)) {
        const config = JSON.parse(fs.readFileSync(configPath, 'utf8'));
        NOTION_TOKEN = config.NOTION_TOKEN || NOTION_TOKEN;
        DATABASE_ID = config.DATABASE_ID || DATABASE_ID;
    }
} catch (e) {
    console.log("⚠️ No se pudo cargar config_notion.json. Usando variables de entorno o placeholders.");
}

// Capturar los argumentos enviados desde la terminal
const args = process.argv.slice(2);
const tituloVideo = args[0] || "Nueva Idea de Video (Generada por IA)";
const servicio = args[1] || "General";
const temporada = args[2] || "Actual";
const contenidoGuion = args[3] || "Guion pendiente de grabación en obra.";

async function crearTarjetaNotion() {
    console.log(`\n🚀 Conectando con el Cerebro de Notion...`);
    console.log(`📋 Creando tarjeta: "${tituloVideo}"`);

    // Estructura de datos que espera la API de Notion
    const bodyData = {
        parent: { database_id: DATABASE_ID },
        properties: {
            // La columna principal de título en Notion (suele llamarse "Name" o "Nombre")
            // Nota: Si tu columna principal se llama diferente, cámbialo aquí abajo:
            "Name": {
                title: [
                    { text: { content: tituloVideo } }
                ]
            }
        },
        // Escribimos los detalles y el guion dentro de la página para leerlo en el celular
        children: [
            {
                object: "block",
                type: "heading_2",
                heading_2: { rich_text: [{ text: { content: "🏷️ Datos de la Estrategia" } }] }
            },
            {
                object: "block",
                type: "paragraph",
                paragraph: {
                    rich_text: [
                        { text: { content: `• Servicio enfocado: ${servicio}\n• Temporada: ${temporada}` } }
                    ]
                }
            },
            {
                object: "block",
                type: "heading_2",
                heading_2: { rich_text: [{ text: { content: "🎬 Guion para Grabar (CapCut)" } }] }
            },
            {
                object: "block",
                type: "paragraph",
                paragraph: {
                    rich_text: [{ text: { content: contenidoGuion } }]
                }
            }
        ]
    };

    try {
        const response = await fetch("https://api.notion.com/v1/pages", {
            method: "POST",
            headers: {
                "Authorization": `Bearer ${NOTION_TOKEN}`,
                "Content-Type": "application/json",
                "Notion-Version": "2022-06-28"
            },
            body: JSON.stringify(bodyData)
        });

        const data = await response.json();

        if (response.ok) {
            console.log(`\n✅ ¡ÉXITO! La tarjeta se creó mágicamente en tu Notion.`);
            console.log(`🔗 Puedes verla en tu app o haciendo clic aquí: ${data.url}\n`);
        } else {
            console.error(`\n❌ Error de la API de Notion:`, data.message);
            console.log(`💡 Tip de solución: Verifica que le hayas dado permiso a la integración en tu página (Paso 2 de la guía).`);
        }
    } catch (error) {
        console.error(`\n❌ Error de conexión local:`, error.message);
    }
}

// Ejecutar la función
crearTarjetaNotion();
