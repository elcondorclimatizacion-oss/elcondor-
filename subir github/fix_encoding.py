import os

path = r"c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\subir github\calculadora_elcondor.html"
with open(path, "r", encoding="utf-8") as f:
    content = f.read()

replacements = {
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
    'Ã°Å¸â€œÅ\xa0': '📊',
    'Ã°Å¸â€ Â¥': '🔥',
    'Ã¢Å¡Â¡': '⚡',
    'Ã¢â‚¬â€ ': '—',
    'ÃƒÂ³': 'ó',
    'ÃƒÂ©': 'é',
    'ÃƒÂ­': 'í',
    'ÃƒÂ¡': 'á',
    'ÃƒÂº': 'ú',
    'ÃƒÂ±': 'ñ',
    'ÃƒÂ ': 'í',
    'Ã‚Â·': '·',
    'ÃƒÂ': 'í'
}

for bad, good in replacements.items():
    content = content.replace(bad, good)

with open(path, "w", encoding="utf-8") as f:
    f.write(content)

print("Done")
