$path = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\subir github\calculadora_elcondor.html"
$lines = [System.IO.File]::ReadAllLines($path, [System.Text.Encoding]::UTF8)

# "TECNOLOGÍA EN CLIMATIZACIÓN, ENERGÍA Y SEGURIDAD"
$lines[300] = '            <div class="tagline">' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("VEVDTk9MT0fDjUEgRU4gQ0xJTUFUSVpBQ0nDs04sIEVORVJHw41BIFkgU0VHVVJJREFE")) + '</div>'
$lines[337] = '                ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("Q0xJTUFUSVpBQ0nDs04gKENBQ0EvQ0FSKQ==")) + '</div>'
$lines[601] = '                    ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("8J+UpSBPRkVSVEFTIExBTlpBTUlFTlRPICgxMDBtIEluYy4p")) + '</p>'
$lines[697] = '                <span>MAT ELEC: <b id="tot_elec_mat">' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCU")) + '</b></span>'
$lines[698] = '                <span>MAT SUELTOS: <b id="tot_mat_ind">' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCU")) + '</b></span>'
$lines[852] = '            // ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4pSA4pSA4pSAIENBVMOBTE9HTyBNQVRFUklBTEVTIEVMw4lDVFJJQ09TIOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgA=="))
$lines[1170] = '            document.getElementById(''tot_elec_mat'').innerText = elec_mat > 0 ? fmt(elec_mat) : ''' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCU")) + ''';'
$lines[1171] = '            document.getElementById(''tot_mat_ind'').innerText = mat_ind > 0 ? fmt(mat_ind) : ''' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCU")) + ''';'
$lines[1313] = '            let t = `*LISTADO DE MATERIALES (EL ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("Q8OTTkRPUg==")) + ')*\n`;'
$lines[1328] = '            t += `' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("8J+RiCAqJHtyZXFfbWFyY2FzfSo=")) + '\n\n`;'
$lines[1348] = '                list.push(`-- MATERIAL ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("QsBTSUNP")) + ' DE BOCAS (SEGÚN AEA 771) --`);'

[System.IO.File]::WriteAllLines($path, $lines, [System.Text.Encoding]::UTF8)
Write-Host "Success"
