$path = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\subir github\calculadora_elcondor.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# Instead of typing strange characters, we can use base64 encoding for the source broken strings
# However, base64 encoding the exact string might be tricky because it depends on exactly what bytes are in the file.
# Let's try replacing by line number directly!
$lines = [System.IO.File]::ReadAllLines($path, [System.Text.Encoding]::UTF8)

$lines[300] = '            <div class="tagline">TECNOLOGÍA EN CLIMATIZACIÓN, ENERGÍA Y SEGURIDAD</div>'
$lines[337] = '                CLIMATIZACIÓN (CACA/CAR)</div>'
$lines[601] = '                    🔥 OFERTAS LANZAMIENTO (100m Inc.)</p>'
$lines[697] = '                <span>MAT ELEC: <b id="tot_elec_mat">—</b></span>'
$lines[698] = '                <span>MAT SUELTOS: <b id="tot_mat_ind">—</b></span>'
$lines[852] = '            // ─── CATÁLOGO MATERIALES ELÉCTRICOS ───────────────────────────────'
$lines[1170] = '            document.getElementById(''tot_elec_mat'').innerText = elec_mat > 0 ? fmt(elec_mat) : ''—'';'
$lines[1171] = '            document.getElementById(''tot_mat_ind'').innerText = mat_ind > 0 ? fmt(mat_ind) : ''—'';'
$lines[1313] = '            let t = `*LISTADO DE MATERIALES (EL CÓNDOR)*\n`;'
$lines[1328] = '            t += `👉 *${req_marcas}*\n\n`;'
$lines[1348] = '                list.push(`-- MATERIAL BÁSICO DE BOCAS (SEGÚN AEA 771) --`);'

for ($i=1402; $i -le 1407; $i++) {
    $lines[$i] = $lines[$i] -replace " Ã¢â‚¬Â¢ ", " • "
}

$lines[1410] = '                    list.push(`\n-- CANALIZACIÓN ESTÉTICA (${window.lastHvacCCDesc}) --`);'
$lines[1412] = '                    list.push(` • Codos, uniones y terminales originales del sistema`);'
$lines[1416] = '                    list.push(`\n-- EXTRAS DE CAÑERÍA (${window.lastHvacMtExtra} metros) --`);'
$lines[1417] = '                    list.push(` • ${window.lastHvacMtExtra}m Caño de cobre extra`);'
$lines[1418] = '                    list.push(` • ${window.lastHvacMtExtra}m Aislación y cable extra`);'
$lines[1466] = '            t += list.map(item => item.startsWith(''-'') ? item : ` • ${item}`).join(''\n'');'

[System.IO.File]::WriteAllLines($path, $lines, [System.Text.Encoding]::UTF8)
Write-Host "Success"
