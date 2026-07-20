import os
import sys

pdf_path = r"c:\Users\PABLO\OneDrive\Desktop\revista junio (2) (3).pdf"

print("Checking PDF existence and size...")
if not os.path.exists(pdf_path):
    print(f"Error: PDF not found at {pdf_path}")
    sys.exit(1)

size = os.path.getsize(pdf_path)
print(f"PDF size: {size / (1024*1024):.2f} MB")

try:
    import pypdf
    print("pypdf is installed.")
except ImportError:
    pypdf = None
    print("pypdf is not installed.")

try:
    import fitz # PyMuPDF
    print("PyMuPDF (fitz) is installed.")
except ImportError:
    fitz = None
    print("PyMuPDF (fitz) is not installed.")

try:
    import pdfplumber
    print("pdfplumber is installed.")
except ImportError:
    pdfplumber = None
    print("pdfplumber is not installed.")

# Let's write code to extract metadata and first few pages/headers using what's available
if fitz:
    print("\n--- Extracting via PyMuPDF (fitz) ---")
    doc = fitz.open(pdf_path)
    print(f"Number of pages: {len(doc)}")
    print("Metadata:", doc.metadata)
    # Extract text from first 5 pages and some middle pages to understand the magazine
    for i in range(min(15, len(doc))):
        text = doc[i].get_text()
        print(f"\n--- Page {i+1} ---")
        print(text[:1000]) # first 1000 characters
elif pypdf:
    print("\n--- Extracting via pypdf ---")
    reader = pypdf.PdfReader(pdf_path)
    print(f"Number of pages: {len(reader.pages)}")
    print("Metadata:", reader.metadata)
    for i in range(min(15, len(reader.pages))):
        text = reader.pages[i].extract_text()
        print(f"\n--- Page {i+1} ---")
        print(text[:1000] if text else "[No text extracted]")
else:
    print("\nNo advanced PDF library found. Attempting to install pypdf via pip...")
    # We will try installing pypdf in command or run it
