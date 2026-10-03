# Report Template

Latex template for reports. Focuses on minimality and easiness of use for any kind of user (even non-familiar with latex).

## Setup

### 1. Make sure you have a LaTeX compiler installed on your computer

Make sure the `latexmk` compiler is installed: type 
```bash
which latexmk
```

**If you do not see a file location**, you must install `latexmk`. 
Linux/MacOS: install a comprehensive LaTeX suite with 
   ```bash
   sudo apt update && sudo apt install texlive-full
   ```


### 2. Advised LaTeX setup: VSCode & "LaTeX Workshop" extension

If you want to use this template with VSCode and some comfort, follow this section.

Install VSCode on your computer ([link](https://code.visualstudio.com/)).

Open VSCode, open the extensions menu with `CTRL + Shift + X`, search the "LaTeX Workshop" extension (by James Yu), and install it.

Finally, copy (`CTRL + C`) the following settings block, go to VSCode, open the top menu with `CTRL + SHIFT + P`, type and open "Preferences: Open User Settings (JSON)", navigate to the bottom of the file just before the last closing bracket `}`, and paste (`CTRL + V`).
```json

	// -------- LATEX WORKSHOP CONFIG --------
    // 1. Put all build artifacts (.aux, .log, .pdf, ...) into a "build/" subfolder
    //    instead of the project root, so the root stays clean.
    "latex-workshop.latex.outDir": "%DIR%/build",

    // 2. Automatically delete auxiliary files ONLY when a build fails ("onFailed").
    //    Why: after a successful build, keeping them lets latexmk recompile incrementally (faster);
    //    after a failed build, they may be corrupted and break the next compilation, so we wipe them.
    "latex-workshop.latex.autoClean.run": "onFailed",

    // 3. Define the "tools": the individual commands that the recipe (step 4) can chain together.
    "latex-workshop.latex.tools": [
        {
            // Tool 1: compile the document with latexmk, which runs pdflatex/bibtex as many times as needed.
            "name": "latexmk",
            "command": "latexmk",
            "args": [
                "-synctex=1",               // Generate SyncTeX data → enables Ctrl+Click navigation between the .tex source and the PDF preview.
                "-interaction=nonstopmode", // Never pause to ask on error → the build runs to the end and reports all errors at once (required for editor integration).
                "-file-line-error",         // Print errors as "file:line: message" → VS Code can turn them into clickable links to the source.
                "-pdf",                     // Produce a PDF (using pdflatex).
                "-outdir=%OUTDIR%",         // Write all outputs into the "build/" folder defined in step 1.
                "%DOC%"                     // Placeholder for the root .tex file to compile (auto-detected by LaTeX Workshop).
            ],
            "env": {} // No custom environment variables needed for this tool.
        },
        {
            // Tool 2: copy the generated PDF from "build/" back to the project root,
            // so the final PDF is easy to find while intermediate files stay in "build/".
            "name": "copy_pdf_to_root",
            "command": "cp",
            "args": [
                "%OUTDIR%/%DOCFILE%.pdf", // Source: the PDF produced inside "build/".
                "%DIR%/"                  // Destination: the project root folder.
            ],
            "env": {}
        }
    ],

    // 4. Define the "recipe": the ordered list of tools executed when you trigger a build.
    //    Here: first compile with latexmk, THEN copy the resulting PDF to the root
    //    (the copy only runs if the compilation succeeded).
    "latex-workshop.latex.recipes": [
        {
            "name": "Clean Build (artifacts in build/ + PDF at root)",
            "tools": [
                "latexmk",
                "copy_pdf_to_root"
            ]
        }
    ]


```



### 3. Copy this LaTeX template

Go to your project folder or create one (possibly in VSCode if this is your choice).

Open a terminal (in VSCode: `CTRL + Alt + M`) and clone this canva:
```bash
git clone https://github.com/remi-moreau/latex-beamer
```

And you are done! 


### 4. Use this LaTeX template

To add text and content: use the files the `sections/` folder and add some if needed.

To add figures, logos, or other images: put them in the `assets/` folder and use the usual LaTeX syntax.

To modify the order, structure and front page of your document: navigate in the `main.tex` file.

VSCode advices:
- use `CTRL + ALT + V` in any `.tex` folder to open the corresponding compiled pdf;
- normally, the LaTeX Workshop extension will automatically compile your document at each save (`CTRL + S`);
- you can navigate from the compiled pdf document to the `.tex` file corresponding to any sentence using `CTRL + Left click` on this sentence.

