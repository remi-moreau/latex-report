# =======================================
# Configuration latexmk locale au projet
# =======================================

# Génération PDF via pdflatex
$pdf_mode = 1;

# Tous les fichiers de sortie et auxiliaires dans build/
#$out_dir = 'build';
$aux_dir = 'build';

# Utiliser biber (pas bibtex) pour biblatex
$biber = 'biber %O %S';
