import os
import re

photos_js_path = os.path.join(os.path.dirname(__file__), 'photos_js.txt')
root_html_path = os.path.join(os.path.dirname(__file__), '..', 'index.html')
services_html_path = os.path.join(os.path.dirname(__file__), '..', 'servicios el condor', 'index.html')

if not os.path.exists(photos_js_path):
    print("photos_js.txt not found!")
    exit(1)

with open(photos_js_path, 'r', encoding='utf-8') as f:
    photos_js_content = f.read()

def update_html(file_path, prefix=""):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    adjusted_photos = photos_js_content
    if prefix:
        adjusted_photos = photos_js_content.replace("FOTOS/", f"{prefix}FOTOS/")
        
    pattern = r"const photos = \[\s*[\s\S]*?\s*\];"
    replacement = f"const photos = [\n{adjusted_photos}\n        ];"
    
    if not re.search(pattern, content):
        print(f"Pattern not found in {file_path}")
        return
        
    updated_content = re.sub(pattern, replacement, content)
    
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(updated_content)
    print(f"Successfully updated {file_path}")

update_html(root_html_path)
update_html(services_html_path, "../")
