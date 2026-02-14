# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Static single-page website for **Jeito Ágape**, a Catholic music ministry in Brazil. Hosted on GitHub Pages at **jeitoagape.com.br**.

## Technology Stack

- Single HTML file ([index.html](index.html)) with inline CSS and JavaScript
- TailwindCSS via CDN (`cdn.tailwindcss.com`)
- AOS (Animate On Scroll) library via unpkg CDN
- Lucide icons via unpkg CDN
- No build process, package manager, or dependencies to install

## Running Locally

```bash
python3 -m http.server 8000
# or: npx http-server -p 8000
# or: xdg-open index.html
```

## Deployment

Push to `main` branch → GitHub Pages auto-deploys. CNAME maps to `jeitoagape.com.br`.

## Architecture

### Single-File Structure

Everything lives in [index.html](index.html): HTML structure, `<style>` block, and `<script>` block.

Sections (5 total): Hero (`#hero`), Sobre (`#sobre`), Serviços (`#servicos`), Álbum (`#album`), Contato & Redes (`#contato`).

### CSS Design System — Minimalist Dark Theme

CSS custom properties in `:root`:
- `--bg: #0A0A0A` (background), `--surface: #111111` (cards/alt sections)
- `--accent: #C53050` (brand red, used sparingly)
- `--text: #FFFFFF`, `--text-muted: rgba(255,255,255,0.5)`
- `--border: rgba(255,255,255,0.06)` (subtle dividers)

Font: **Inter** only (weights 300–700). Sections alternate between `--bg` and `--surface` using `.section-alt` class.

### Key CSS Classes

- `.header` / `.header.scrolled` — fixed header, darkens on scroll
- `.hero` — full-viewport, displays Hero.png centered
- `.card` — minimal cards with border hover to accent color
- `.track` / `.track-num` / `.track-name` — album tracklist
- `.platform-link` — streaming platform buttons (inline, small)
- `.link-card` — contact/social grid cards
- `.whatsapp-float` — fixed WhatsApp button (bottom-right)
- `.back-to-top` / `.visible` — scroll-to-top (bottom-left)
- `.mobile-menu` / `.mobile-overlay` — slide-in mobile nav

### JavaScript

Inline at bottom of [index.html](index.html):
1. AOS init (`duration: 600, once: true, offset: 80`)
2. Lucide icon rendering
3. Header scroll class toggle
4. Mobile menu open/close with body scroll lock
5. Back-to-top visibility toggle (after 300px)
6. Smooth scroll for `#` anchor links

### Adding New Sections

1. Add `<section id="new-id" class="section">` (use `section-alt` for alternate bg)
2. Add `data-aos="fade-up"` for scroll animation
3. Update nav links in both desktop (`nav.hidden.md:flex`) and mobile (`#mobile-menu`)
4. Use `.section-title` + `.accent-bar` + `.section-subtitle` for heading pattern

## Assets

```
assets/
├── Hero.png           # Hero banner (has logo, name, verse embedded)
├── background.svg     # Body background (currently unused in redesign)
├── confiar-album.png  # Album cover
├── favicon.png        # Site favicon
└── logo.png           # Jeito Ágape logo
```
