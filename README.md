# Personal Site – Tracy Miles

A small, static site for my security portfolio and resume.

## Quick start

- Open `index.html` directly in your browser, or run a tiny server:
  - Python: `python3 -m http.server 8000` → http://localhost:8000
- Edit `index.html`, `work.css`, and `app.js` for content and styles.

## Deploy

This repo is set up for GitHub Pages.
- Push to `main`
- Custom domain goes in `CNAME` (currently `www.twmiles.co`)

## What’s here

- `index.html` – content (hero, about, My Work, contact)
- `work.css` / `main.css` – styles
- `app.js` + `particles.js` – background particles
- `assets/` – site images (profile, favicon, etc.)
- `resume/` – LaTeX source, build script, and PDFs
  - `TracyMiles_Resume.tex` – LaTeX resume
  - `resume.cls` – resume class/styles
  - `assets/` – small icons used in the PDF (email/github/linkedin/phone)
  - `latex_build.sh` – Docker build helper
  - `build/` – compiled outputs (workflow copies the latest to `resume/Tracy-Miles-Resume.pdf` used by the site)

## Building the resume (Docker)

Pick one approach.

- Quick script (build + compile):
```bash
bash resume/latex_build.sh
# Output PDFs will be in resume/build/
```

- Manual (build image once, then compile anytime):
```bash
# Build the image (first time, or after Dockerfile changes)
docker build . -f resume/Dockerfile -t latexBuild

# Compile the resume (run this whenever you update the .tex)
docker run --rm -v "$PWD/resume:/input" -v "$PWD/resume/build:/output" latexBuild
```

Windows (PowerShell):
```powershell
$root = (Resolve-Path .).Path
# Build once
docker build . -f resume/Dockerfile -t latexBuild
# Compile each time
docker run --rm -v "$root/resume:/input" -v "$root/resume/build:/output" latexBuild
```
The Dockerfile runs `latexmk` inside the container, so no local TeX setup is required.

## My Work section

The homepage shows a curated list of GitHub repos. Update the array in `index.html` (near the bottom) to change which repos are displayed.

## TODO

- Add light/dark toggle
- Chip icons + mobile polish
- Simple case‑study pages for private work

## License

- Code: MIT (see `LICENSE`).
- Site content (text and general assets in this repo):
  - Creative Commons Attribution‑NonCommercial 4.0 (CC BY‑NC 4.0)
  - Summary: you can share/adapt with attribution for non‑commercial purposes.
- Exceptions (All rights reserved):
  - `resume/` (the PDF and LaTeX content) and personal photos in `assets/`.
  - Please do not copy or redistribute these without permission.

---
Notes to self: keep it fast, keep it readable, ship small updates often. 

