# Xu Zhang (张旭)

Source code for my academic homepage: [house-yuyu.github.io](https://house-yuyu.github.io/).

The site is built with Jekyll and uses a responsive, data-driven academic homepage layout with English/Chinese and light/dark theme switching.

## Features

- Data-driven publications and news under `_data/`
- English/Chinese language switcher
- Light/dark theme switcher
- Responsive publication cards
- BibTeX, RIS, CSL-JSON, IEEE, APA, and GB/T 7714 citation output
- Google Scholar citation badge and statistics

## Content management

- Personal and social information: `_config.yml`
- Homepage introduction, experience, and academic service: `_pages/about.md`
- Publications: `_data/pubs.json` and `_data/references.json`
- News: `_data/news.json`
- Navigation: `_data/navigation.yml`

After editing publication references, regenerate citation output with:

```bash
npm ci
npm run citations:build
```

## Local preview

Install the Ruby dependencies, then run:

```bash
bundle install
bundle exec jekyll serve
```

The site is available locally at `http://127.0.0.1:4000`.

## Acknowledgements

The visual system is adapted from [YichuXu/YichuXu.github.io](https://github.com/YichuXu/YichuXu.github.io) and [zzaiyan/zzaiyan.github.io](https://github.com/zzaiyan/zzaiyan.github.io), based on AcadHomepage, Minimal Mistakes, and Academic Pages. See [LICENSE](LICENSE) for licensing information.
