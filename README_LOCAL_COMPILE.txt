LOCAL COMPILATION (Windows + MiKTeX)
====================================

1. Extract the complete ZIP into a folder.
2. Make sure MiKTeX and Biber are installed and available in PATH.
3. Double-click compile_dissertation.bat.
   Alternatively, open Command Prompt in this folder and run:
       compile_dissertation.bat

The script runs:
  pdflatex -> biber -> pdflatex -> pdflatex

The final two LaTeX passes populate the Table of Contents, List of Figures,
List of Tables, cross-references, and bibliography.

IMPORTANT:
- Do not run cleanup_tex.bat to clear auxiliary files. The previous version
  deleted .aux, .toc, .lof, .lot and .bbl files, which are needed for lists
  and references. The included cleanup_tex.bat is now safe and deletes nothing.
- If compilation stops, fix the FIRST error reported in main.log, then rerun
  compile_dissertation.bat.
- Figures and tables appear in their lists only if they have numbered
  \\caption{...} commands. Unnumbered \\caption* commands are not listed.
- The bibliography is generated from image_processing_bibliography.bib
  using Biber. References cited in the text are included.
