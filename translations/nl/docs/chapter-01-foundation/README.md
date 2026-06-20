# Hoofdstuk 1: Basis & Snelstart

**📚 Cursus**: [AZD For Beginners](../../README.md) | **⏱️ Duur**: 30-45 minuten | **⭐ Complexiteit**: Beginner

---

## Overzicht

Dit hoofdstuk introduceert de basisprincipes van Azure Developer CLI (azd). Je leert de kernconcepten, installeert de tools en zet je eerste toepassing naar Azure in productie.

> Gevalideerd met `azd 1.25.6` in juni 2026.

## Leerdoelen

Door dit hoofdstuk te voltooien, zal je:
- Begrijpen wat Azure Developer CLI is en hoe het verschilt van Azure CLI
- AZD installeren en configureren op je platform
- Je eerste applicatie naar Azure uitrollen met `azd up`
- Resources opruimen met `azd down`

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [AZD Basis](azd-basics.md) | Kernconcepten, terminologie en projectstructuur | 15 min |
| 2 | [Installatie & Configuratie](installation.md) | Platform-specifieke installatiehandleidingen | 10 min |
| 3 | [Je Eerste Project](first-project.md) | Praktijk: Een web-app naar Azure implementeren | 20 min |
| 4 | [Breng Je Eigen App](bring-your-own-app.md) | Voeg azd toe aan een bestaand project dat je al hebt | 15 min |
| 5 | [Dev-containers & Codespaces](dev-containers.md) | Reproduceerbare azd-omgevingen met dev-containers | 15 min |

---

## ✅ Begin hier: Controleer je configuratie

Voordat je begint, controleer dat je lokale machine klaar is voor de sjabloon van Hoofdstuk 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Als het script ontbrekende tools meldt, los die eerst op en ga daarna verder met het hoofdstuk.

---

## 🚀 Snelstart

```bash
# Controleer de installatie
azd version

# Meld je aan bij AZD
# Optioneel: az login als je van plan bent Azure CLI-commando's rechtstreeks uit te voeren
azd auth login

# Implementeer je eerste app
azd init --template todo-nodejs-mongo
azd up

# Ruim op als je klaar bent
azd down --force --purge
```

---

## ✅ Succescriteria

Na het voltooien van dit hoofdstuk zou je in staat moeten zijn om:

```bash
azd version              # Toont geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert project
azd up                   # Implementeert naar Azure
azd show                 # Toont URL van de draaiende app
azd down --force --purge # Ruimt bronnen op
```

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Volgende** | [Hoofdstuk 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Sla over naar** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |

---

## 📖 Gerelateerde bronnen

- [Commando-spiekbrief](../../resources/cheat-sheet.md)
- [Veelgestelde vragen](../../resources/faq.md)
- [Woordenlijst](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->