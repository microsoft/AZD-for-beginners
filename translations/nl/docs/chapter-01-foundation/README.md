# Hoofdstuk 1: Basis & Snelstart

**📚 Cursus**: [AZD voor beginners](../../README.md) | **⏱️ Duur**: 30-45 minuten | **⭐ Complexiteit**: Beginner

---

## Overzicht

Dit hoofdstuk introduceert de basisprincipes van de Azure Developer CLI (azd). Je leert kernconcepten, installeert de tools en implementeert je eerste applicatie naar Azure.

> Gevalideerd met `azd 1.23.12` in maart 2026.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- Begrijpen wat Azure Developer CLI is en hoe het verschilt van Azure CLI
- AZD op je platform installeren en configureren
- Je eerste applicatie naar Azure implementeren met `azd up`
- Hulpbronnen opruimen met `azd down`

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|-----|--------------|------|
| 1 | [AZD Basis](azd-basics.md) | Kernconcepten, terminologie en projectstructuur | 15 min |
| 2 | [Installatie & Configuratie](installation.md) | Platform-specifieke installatiehandleidingen | 10 min |
| 3 | [Je eerste project](first-project.md) | Praktijk: implementeer een webapp naar Azure | 20 min |

---

## ✅ Begin hier: Controleer je omgeving

Voordat je begint, controleer of je lokale machine klaar is voor de template van hoofdstuk 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Als het script ontbrekende tools meldt, los die dan eerst op en ga daarna verder met het hoofdstuk.

---

## 🚀 Snelstart

```bash
# Controleer de installatie
azd version

# Authenticieer voor AZD
# Optioneel: az login als je van plan bent Azure CLI-commando's direct uit te voeren
azd auth login

# Implementeer je eerste app
azd init --template todo-nodejs-mongo
azd up

# Ruim op wanneer je klaar bent
azd down --force --purge
```

---

## ✅ Succescriteria

Na het voltooien van dit hoofdstuk moet je het volgende kunnen:

```bash
azd version              # Toont geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert project
azd up                   # Implementeert in Azure
azd show                 # Toont URL van de draaiende app
azd down --force --purge # Ruimt resources op
```

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|-----------|
| **Volgende** | [Hoofdstuk 2: AI-first ontwikkeling](../chapter-02-ai-development/README.md) |
| **Overslaan naar** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |

---

## 📖 Gerelateerde bronnen

- [Commando-spiekbrief](../../resources/cheat-sheet.md)
- [Veelgestelde vragen (FAQ)](../../resources/faq.md)
- [Woordenlijst](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor enige misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->