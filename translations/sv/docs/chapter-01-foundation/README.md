# Kapitel 1: Grundläggande & Snabbstart

**📚 Kurs**: [AZD För nybörjare](../../README.md) | **⏱️ Varaktighet**: 30-45 minuter | **⭐ Svårighetsgrad**: Nybörjare

---

## Översikt

Detta kapitel introducerar grunderna för Azure Developer CLI (azd). Du kommer att lära dig kärnbegrepp, installera verktygen och distribuera din första applikation till Azure.

> Validerad med `azd 1.27.1` i juli 2026.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Förstå vad Azure Developer CLI är och hur det skiljer sig från Azure CLI
- Installera och konfigurera AZD på din plattform
- Distribuera din första applikation till Azure med `azd up`
- Rensa resurser med `azd down`

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Grundläggande om AZD](azd-basics.md) | Kärnbegrepp, terminologi och projektstruktur | 15 min |
| 2 | [Installation & Setup](installation.md) | Plattformspecifika installationsguider | 10 min |
| 3 | [Ditt första projekt](first-project.md) | Praktisk övning: Distribuera en webbapp till Azure | 20 min |
| 4 | [Ta med din egen app](bring-your-own-app.md) | Lägg till azd i ett existerande projekt du redan har | 15 min |
| 5 | [Utvecklingscontainrar & Codespaces](dev-containers.md) | Reproducerbara azd-miljöer med utvecklingscontainrar | 15 min |

---

## ✅ Börja här: Validera din installation

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
# Kontrollera installation
azd version

# Autentisera för AZD
# Valfritt: az login om du planerar att köra Azure CLI-kommandon direkt
azd auth login

# Distribuera din första app
azd init --template todo-nodejs-mongo
azd up

# Rensa upp när du är klar
azd down --force --purge
```

---

## ✅ Framgångskriterier

Efter att ha slutfört detta kapitel ska du kunna:

```bash
azd version              # Visar installerad version
azd init --template todo-nodejs-mongo  # Initierar projekt
azd up                   # Distribuerar till Azure
azd show                 # Visar körande app-URL
azd down --force --purge # Rensar upp resurser
```

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Nästa** | [Kapitel 2: AI-först utveckling](../chapter-02-ai-development/README.md) |
| **Hoppa till** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

---

## 📖 Relaterade resurser

- [Kommandocheat sheet](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Ordlista](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->