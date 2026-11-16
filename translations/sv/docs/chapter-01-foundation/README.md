# Kapitel 1: Grundläggande & Snabbstart

**📚 Kurs**: [AZD För Nybörjare](../../README.md) | **⏱️ Varaktighet**: 75-120 minuter inklusive första driftsättningen; ytterligare övningar tar längre tid | **⭐ Svårighetsgrad**: Nybörjare

---

## Översikt

Detta kapitel introducerar grunderna i Azure Developer CLI (azd). Du lär dig kärnkoncept, installerar verktygen och driftsätter din första applikation till Azure.

> Kommandon och konfigurationsgranskning mål: `azd 1.37.2` (november 2026). Live Azure-provisionering kördes inte under granskningen.

## Lärandemål

Genom att genomföra detta kapitel kommer du att:
- Förstå vad Azure Developer CLI är och hur det skiljer sig från Azure CLI
- Installera och konfigurera AZD på din plattform
- Driftsätta din första applikation till Azure med `azd up`
- Rensa upp resurser med `azd down`

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [AZD Grundläggande](azd-basics.md) | Kärnkoncept, terminologi och projektstruktur | 15 min |
| 2 | [Installation & Setup](installation.md) | Plattformsspecifika installationsguider | 10 min |
| 3 | [Ditt Första Projekt](first-project.md) | Praktiskt: Driftsätt en webbapp till Azure | 20 min |
| 4 | [Ta Med Din Egen App](bring-your-own-app.md) | Lägg till azd till ett befintligt projekt du redan har | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Reproducerbara azd-miljöer med dev containers | 15 min |

---

## ✅ Börja Här: Validera Din Setup

Innan du börjar, bekräfta att din lokala dator är redo för Kapitel 1-mallen:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Om skriptet rapporterar saknade verktyg, åtgärda dessa först och fortsätt sedan med kapitlet.

---

## 🚀 Snabbstart

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

## ✅ Framgångskriterier

Efter att ha slutfört detta kapitel bör du kunna:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Nästa** | [Kapitel 2: AI-First Utveckling](../chapter-02-ai-development/README.md) |
| **Hoppa till** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

---

## 📖 Relaterade Resurser

- [Kommandolathund](../../resources/cheat-sheet.md)
- [Vanliga frågor](../../resources/faq.md)
- [Ordlista](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->