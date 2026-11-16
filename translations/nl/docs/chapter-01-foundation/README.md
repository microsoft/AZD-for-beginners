# Hoofdstuk 1: Basis & Snelle Start

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 75-120 minuten inclusief de eerste implementatie; extra oefeningen duren langer | **⭐ Moeilijkheidsgraad**: Beginner

---

## Overzicht

Dit hoofdstuk introduceert de basisprincipes van Azure Developer CLI (azd). Je leert kernconcepten, installeert de tools, en zet je eerste applicatie in Azure uit.

> Doel van de opdracht- en configuratiereview: `azd 1.37.2` (november 2026). Live Azure provisioning werd tijdens de review niet uitgevoerd.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- Begrijpen wat Azure Developer CLI is en hoe het verschilt van Azure CLI
- AZD op jouw platform installeren en configureren
- Je eerste applicatie naar Azure implementeren met `azd up`
- Resources opruimen met `azd down`

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [AZD Basisprincipes](azd-basics.md) | Kernconcepten, terminologie en projectstructuur | 15 min |
| 2 | [Installatie & Setup](installation.md) | Platform-specifieke installatiehandleidingen | 10 min |
| 3 | [Je Eerste Project](first-project.md) | Praktijk: Implementeer een webapp naar Azure | 20 min |
| 4 | [Gebruik Je Eigen App](bring-your-own-app.md) | Voeg azd toe aan een bestaand project dat je al hebt | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Reproduceerbare azd-omgevingen met dev containers | 15 min |

---

## ✅ Begin Hier: Verifieer Je Setup

Voordat je begint, bevestig dat je lokale machine klaar is voor de template van hoofdstuk 1:

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

## 🚀 Snelle Start

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Succescriteria

Na het voltooien van dit hoofdstuk zou je in staat moeten zijn om:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Volgende** | [Hoofdstuk 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Overslaan naar** | [Hoofdstuk 3: Configuratie](../chapter-03-configuration/README.md) |

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