# 🏛️ ARQUITECTURA NOTION ERP: "EL CÓNDOR"

Esta guía te muestra cómo estructurar tus bases de datos en **Notion** para tener el control total de tus contenidos, clientes y obras de tus 5 servicios integrales (AA, Electricidad, CCTV, Domótica y Fibra Óptica).

---

## 🚀 CONFIGURACIÓN EN 5 MINUTOS (Paso a Paso)

Abre tu Notion y crea una nueva página llamada **"🦅 ERP EL CÓNDOR - SERVICIOS INTEGRALES"**. Dentro de esta página, crearemos 3 Bases de Datos con vista de **Tablero (Board View / estilo Kanban)**.

---

### 1. 📅 BASE DE DATOS: "CALENDARIO DE CONTENIDOS"
* **Objetivo:** Conectar las ideas generadas por el **Agente 1 (Cóndor Media)** con tus grabaciones en obra y edición en CapCut.
* **Tipo de Vista:** Tablero agrupado por la propiedad **"Estado"**.

#### Columnas (Estados de la tarjeta):
1. `💡 Idea / Guion IA` *(Aquí pegas lo que te genera el Agente 1)*
2. `🎥 Para Grabar en Obra` *(Lo abres en tu celular cuando estás trabajando)*
3. `✂️ En Edición (CapCut)` *(Cuando ya tienes los videos en tu galería)*
4. `✅ Publicado`

#### Propiedades de cada tarjeta (Añadir con el botón `+`):
* **Servicio (Select / Selección única):** 
  * ❄️ Climatización (AA)
  * ⚡ Electricidad
  * 📹 CCTV
  * 🏠 Domótica
  * 🌐 Fibra Óptica
* **Temporada (Select):** 
  * 🍂 Otoño - Invierno
  * 🌸 Primavera - Verano
* **Gancho del Video (Text):** La frase inicial para leer rápido.
* **Fecha Programada (Date):** Cuándo se va a subir.

---

### 2. 👥 BASE DE DATOS: "CRM DE VENTAS Y LEADS"
* **Objetivo:** No perder ningún cliente que te escriba por WhatsApp solicitando precios o visitas técnicas.
* **Tipo de Vista:** Tablero agrupado por **"Estado del Lead"**.

#### Columnas (Estados):
1. `📥 Nuevo Contacto` *(Cliente que recién escribe)*
2. `🔍 Visita Técnica Programada` *(Para ir a presupuestar)*
3. `📄 Presupuesto Enviado` *(Esperando respuesta)*
4. `🤝 Presupuesto Aprobado` *(Pasa a la Base de Datos de Obras)*
5. `❌ Perdido / Rechazado`

#### Propiedades de la tarjeta:
* **Teléfono / WhatsApp (Phone):** Para hacer clic y abrir el chat directo.
* **Servicio Solicitado (Multi-select):** Puede ser AA + Electricidad.
* **Monto Presupuestado (Number - Formato Moneda):** El valor de la cotización.

---

### 3. 🛠️ BASE DE DATOS: "GESTIÓN DE OBRAS Y SERVICIOS"
* **Objetivo:** Controlar la ejecución técnica, compras de materiales y garantías activas.
* **Tipo de Vista:** Tablero agrupado por **"Fase de Obra"**.

#### Columnas (Estados):
1. `🛒 Comprar Materiales` *(Generar lista con el Agente Técnico)*
2. `⚡ Obra en Ejecución` *(Técnicos trabajando)*
3. `🏁 Obra Finalizada` *(Cobrado al 100%)*
4. `🛡️ Garantía Activa` *(Para control postventa)*

#### Propiedades de la tarjeta:
* **Dirección / Ubicación (Text):** Enlace a Google Maps o calle.
* **Costo de Materiales (Number):** Lo gastado en proveedores.
* **Ganancia Neta (Formula):** `Monto Presupuestado - Costo de Materiales`.
* **Fin de Garantía (Date):** Generalmente 6 meses o 1 año después de finalizar.

---

## 🔗 EL CICLO DE TRABAJO PERFECTO (Cómo usarlo el día a día)

1. **Lunes por la mañana:** Abres a **Cóndor Media (Agente 1)** en tu IA, le pides 3 guiones de la temporada actual y los pegas en la columna `💡 Idea` de tu Calendario de Contenidos en Notion.
2. **Durante la semana en obra:** Llega un cliente nuevo por WhatsApp, lo anotas rápido en `📥 Nuevo Contacto`. Vas a la obra, abres tu Notion en el celular, revisas qué tomas de video te pidió el Agente 1 grabar, las grabas en 1 minuto, y mueves la tarjeta a `✂️ En Edición (CapCut)`.
3. **Viernes por la tarde:** Pasas los videos por CapCut usando los subtítulos y música sugeridos, los publicas y pasas las tarjetas a `✅ Publicado`.
