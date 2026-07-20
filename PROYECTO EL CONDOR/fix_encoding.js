const fs = require('fs');
const path = require('path');

const targetFile = 'c:\\Users\\PABLO\\OneDrive\\Desktop\\PROYECTO EL CONDOR\\subir github\\calculadora_elcondor.html';

let content = fs.readFileSync(targetFile, 'utf8');

const replacements = {
    'ÃƒÂ³': 'ó',
    'ÃƒÂ©': 'é',
    'ÃƒÂ­': 'í',
    'ÃƒÂ¡': 'á',
    'ÃƒÂº': 'ú',
    'ÃƒÂ±': 'ñ',
    'ÃƒÂ ': 'í', // specific check
    'Ã¢â‚¬â€ ': '—',
    'Ã¢Å¡Â¡': '⚡',
    'Ã°Å¸â€œÅ\xa0': '📊',
    'Ã°Å¸â€ Â¥': '🔥',
    'Ã‚Â·': '·',
    'CÃƒÂ³ndor': 'Cóndor',
    'TECNOLOGÃƒÂ A': 'TECNOLOGÍA',
    'ENERGÃƒÂ A': 'ENERGÍA',
    'UbicaciÃƒÂ³n': 'Ubicación',
    'TelÃƒÂ©fono': 'Teléfono',
    'InstalaciÃƒÂ³n': 'Instalación',
    'CaÃƒÂ±os': 'Caños',
    'CaÃƒÂ±erÃƒÂ­a': 'Cañería',
    'AislaciÃƒÂ³n': 'Aislación',
    'EstÃƒÂ©tico': 'Estético',
    'CaÃƒÂ±erÃƒÂ­a': 'Cañería',
    'DesinstalaciÃƒÂ³n': 'Desinstalación',
    'TÃƒÂ©rmicas': 'Térmicas',
    'automÃƒÂ¡ticamente': 'automáticamente',
    'PlafÃƒÂ³n': 'Plafón',
    'CanalizaciÃƒÂ³n': 'Canalización',
    'MetÃƒÂ¡licas': 'Metálicas',
    'mÃƒÂ©nsulas': 'ménsulas',
    'sujeciÃƒÂ³n': 'sujeción',
    'bulonerÃƒÂ­a': 'bulonería',
    'aÃƒÂ©reo': 'aéreo',
    'LÃƒÂ­neas': 'Líneas',
    'IluminaciÃƒÂ³n': 'Iluminación',
    'CÃƒÂ¡maras': 'Cámaras',
    'CÃƒÂ¡mara': 'Cámara',
    'ViÃƒÂ¡ticos': 'Viáticos',
    'DÃƒÂ­as': 'Días',
    'Ã°Å¸â€œÅ ': '📊',
    'ÃƒÂ': 'í' // catchall for what's left
};

for (const [bad, good] of Object.entries(replacements)) {
    content = content.split(bad).join(good);
}

fs.writeFileSync(targetFile, content, 'utf8');
console.log("Corrección completada.");
