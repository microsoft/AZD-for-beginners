# Hoofdstuk 1: Basis & Snelle Start

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 30-45 minuten | **⭐ Complexiteit**: Beginner

---

## Overzicht

Dit hoofdstuk introduceert de basisprincipes van Azure Developer CLI (azd). Je leert de kernconcepten, installeert de tools en zet je eerste applicatie in Azure uit.

> Gevalideerd tegen `azd 1.27.1` in juli 2026.

## Leerdoelen

Door dit hoofdstuk te voltooien zul je:
- Begrijpen wat Azure Developer CLI is en hoe het verschilt van Azure CLI
- AZD installeren en configureren op jouw platform
- Je eerste applicatie naar Azure uitrollen met `azd up`
- Resources opruimen met `azd down`

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [AZD Basisprincipes](azd-basics.md) | Kernconcepten, terminologie en projectstructuur | 15 min |
| 2 | [Installatie & Setup](installation.md) | Platform-specifieke installatiehandleidingen | 10 min |
| 3 | [Je Eerste Project](first-project.md) | Hands-on: Zet een webapp uit naar Azure | 20 min |
| 4 | [Breng Je Eigen App](bring-your-own-app.md) | Voeg azd toe aan een bestaand project dat je al hebt | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Reproduceerbare azd-omgevingen met dev containers | 15 min |

---

## ✅ Begin Hier: Controleer Je Setup

Controleer voordat je begint of je lokale machine klaar is voor de sjabloon van Hoofdstuk 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Als het script ontbrekende tools meldt, los die dan eerst op en ga dan verder met het hoofdstuk.

---

## 🚀 Snelle Start

```bash
# Controleer installatie
azd version

# Authenticeren voor AZD
# Optioneel: az login als je van plan bent Azure CLI-commando's direct uit te voeren
azd auth login

# Zet je eerste app uit
azd init --template todo-nodejs-mongo
azd up

# Opruimen wanneer klaar
azd down --force --purge
```

---

## ✅ Succescriteria

Na het voltooien van dit hoofdstuk zou je in staat moeten zijn om:

```bash
azd version              # Toont geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert project
azd up                   # Zet uit naar Azure
azd show                 # Toont URL van de lopende app
azd down --force --purge # Ruimt bronnen op
```

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Volgende** | [Hoofdstuk 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Sla over naar** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |

---

## 📖 Gerelateerde Bronnen

- [Command Cheat Sheet](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossarium](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->