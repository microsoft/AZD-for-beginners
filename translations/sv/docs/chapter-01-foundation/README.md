# Kapitel 1: Grundläggande & Snabbstart

**📚 Kurs**: [AZD för nybörjare](../../README.md) | **⏱️ Varaktighet**: 30-45 minuter | **⭐ Komplexitet**: Nybörjare

---

## Översikt

Detta kapitel introducerar Azure Developer CLI (azd) grundläggande. Du kommer att lära dig kärnkoncept, installera verktygen och distribuera din första applikation till Azure.

> Validerad mot `azd 1.25.6` i juni 2026.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Förstå vad Azure Developer CLI är och hur det skiljer sig från Azure CLI
- Installera och konfigurera AZD på din plattform
- Distribuera din första applikation till Azure med `azd up`
- Rensa upp resurser med `azd down`

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [AZD-grunderna](azd-basics.md) | Kärnkoncept, terminologi och projektstruktur | 15 min |
| 2 | [Installation och uppsättning](installation.md) | Plattformspecifika installationsguider | 10 min |
| 3 | [Ditt första projekt](first-project.md) | Praktiskt: Distribuera en webbapp till Azure | 20 min |
| 4 | [Lägg till azd i ett befintligt projekt](bring-your-own-app.md) | Lägg till azd i ett befintligt projekt du redan har | 15 min |
| 5 | [Utvecklingscontainrar & Codespaces](dev-containers.md) | Reproducerbara azd-miljöer med dev-containrar | 15 min |

---

## ✅ Börja här: Validera din konfiguration

Innan du börjar, bekräfta att din lokala dator är redo för Kapitel 1-mallen:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Om skriptet rapporterar saknade verktyg, åtgärda dem först och fortsätt sedan med kapitlet.

---

## 🚀 Snabbstart

```bash
# Kontrollera installationen
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
azd show                 # Visar URL för den körande appen
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

- [Kommandofusklapp](../../resources/cheat-sheet.md)
- [Vanliga frågor (FAQ)](../../resources/faq.md)
- [Ordlista](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->