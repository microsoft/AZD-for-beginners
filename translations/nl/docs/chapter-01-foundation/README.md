# Chapter 1: Foundation & Quick Start

**📚 Cursus**: [AZD For Beginners](../../README.md) | **⏱️ Duur**: 30-45 minuten | **⭐ Complexiteit**: Beginner

---

## Overzicht

Dit hoofdstuk introduceert de basisprincipes van Azure Developer CLI (azd). Je leert kernconcepten, installeert de tools en zet je eerste applicatie naar Azure in productie.

## Leerdoelen

Na het voltooien van dit hoofdstuk zul je:
- Begrijpen wat Azure Developer CLI is en hoe het verschilt van Azure CLI
- AZD installeren en configureren op je platform
- Je eerste applicatie naar Azure deployen met `azd up`
- Resources opruimen met `azd down`

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD Basisprincipes](azd-basics.md) | Kernconcepten, terminologie en projectstructuur | 15 min |
| 2 | [Installatie & Setup](installation.md) | Platform-specifieke installatiehandleidingen | 10 min |
| 3 | [Je Eerste Project](first-project.md) | Praktijk: Implementeer een webapp naar Azure | 20 min |

---

## 🚀 Snelle start

```bash
# Controleer de installatie
azd version

# Log in op Azure
azd auth login

# Implementeer je eerste app
azd init --template todo-nodejs-mongo
azd up

# Ruim op wanneer je klaar bent
azd down --force --purge
```

---

## ✅ Succescriteria

Na het voltooien van dit hoofdstuk zou je in staat moeten zijn om:

```bash
azd version              # Toont geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert project
azd up                   # Deployt naar Azure
azd show                 # Toont URL van de draaiende app
azd down --force --purge # Ruimt bronnen op
```

---

## 🔗 Navigatie

| Direction | Chapter |
|-----------|---------|
| **Volgende** | [Hoofdstuk 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Ga naar** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |

---

## 📖 Gerelateerde bronnen

- [Snelreferentie voor commando's](../../resources/cheat-sheet.md)
- [Veelgestelde vragen (FAQ)](../../resources/faq.md)
- [Woordenlijst](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->