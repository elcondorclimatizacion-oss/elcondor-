$path = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\subir github\calculadora_elcondor.html"
$lines = [System.IO.File]::ReadAllLines($path, [System.Text.Encoding]::UTF8)

# Just overwrite the entire line without trying to match the bad characters
$lines[300] = '            <div class="tagline">TECNOLOGÍA EN CLIMATIZACIÓN, ENERGÍA Y SEGURIDAD</div>'
$lines[337] = '                CLIMATIZACIÓN (CACA/CAR)</div>'
$lines[601] = '                    🔥 OFERTAS LANZAMIENTO (100m Inc.)</p>'
$lines[697] = '                <span>MAT ELEC: <b id="tot_elec_mat">—</b></span>'
$lines[698] = '                <span>MAT SUELTOS: <b id="tot_mat_ind">—</b></span>'
$lines[852] = '            // ─── CATÁLOGO MATERIALES ELÉCTRICOS ───────────────────────────────'
$lines[1170] = '            document.getElementById("tot_elec_mat").innerText = elec_mat > 0 ? fmt(elec_mat) : "—";'
$lines[1171] = '            document.getElementById("tot_mat_ind").innerText = mat_ind > 0 ? fmt(mat_ind) : "—";'
$lines[1313] = '            let t = "*LISTADO DE MATERIALES (EL CÓNDOR)*\n";'
$lines[1328] = '            t += "👉 *" + req_marcas + "*\n\n";'
$lines[1348] = '                list.push("-- MATERIAL BÁSICO DE BOCAS (SEGÚN AEA 771) --");'

$lines[1402] = '                list.push(" • 3m Caño de Cobre (" + window.lastHvacPipes + ")");'
$lines[1403] = '                list.push(" • 2u Fundas aislantes (una p/ cada caño)");'
$lines[1404] = '                list.push(" • 4m Cable TPR 5x1.5mm (Interconexión)");'
$lines[1405] = '                list.push(" • 4u Tacos antivibratorios de goma (p/ pie de unidad ext.)");'
$lines[1406] = '                list.push(" • 3m Manguera cristal de drenaje");'
$lines[1407] = '                list.push(" • 1u Cinta de PVC para terminación");'

$lines[1410] = '                    list.push("\n-- CANALIZACIÓN ESTÉTICA (" + window.lastHvacCCDesc + ") --");'
$lines[1412] = '                    list.push(" • Codos, uniones y terminales originales del sistema");'
$lines[1416] = '                    list.push("\n-- EXTRAS DE CAÑERÍA (" + window.lastHvacMtExtra + " metros) --");'
$lines[1417] = '                    list.push(" • " + window.lastHvacMtExtra + "m Caño de cobre extra");'
$lines[1418] = '                    list.push(" • " + window.lastHvacMtExtra + "m Aislación y cable extra");'

[System.IO.File]::WriteAllLines($path, $lines, [System.Text.Encoding]::UTF8)
Write-Host "Success"
