const fs = require('fs');
const path = require('path');

const photosJsPath = path.join(__dirname, 'photos_js.txt');
const rootHtmlPath = path.join(__dirname, '..', 'index.html');
const servicesHtmlPath = path.join(__dirname, '..', 'servicios el condor', 'index.html');

if (!fs.existsSync(photosJsPath)) {
    console.error("photos_js.txt not found!");
    process.exit(1);
}

const photosJsContent = fs.readFileSync(photosJsPath, 'utf8');

// Helper to replace the photos array block
function updateHtml(filePath, relativePathPrefix) {
    let content = fs.readFileSync(filePath, 'utf8');
    
    // adjust paths if prefix is provided
    let adjustedPhotosJs = photosJsContent;
    if (relativePathPrefix) {
        adjustedPhotosJs = photosJsContent.replace(/FOTOS\//g, relativePathPrefix + "FOTOS/");
    }
    
    const pattern = /const photos = \[\s*[\s\S]*?\s*\];/;
    const replacement = `const photos = [\n${adjustedPhotosJs}\n        ];`;
    
    if (!pattern.test(content)) {
        console.error(`Pattern not found in ${filePath}`);
        return;
    }
    
    const updatedContent = content.replace(pattern, replacement);
    fs.writeFileSync(filePath, updatedContent, 'utf8');
    console.log(`Successfully updated ${filePath}`);
}

updateHtml(rootHtmlPath, "");
updateHtml(servicesHtmlPath, "../");
