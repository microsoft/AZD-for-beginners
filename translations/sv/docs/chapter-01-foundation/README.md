# Kapitel 1: Grund & Snabbstart

**📚 Kurs**: [AZD för nybörjare](../../README.md) | **⏱️ Varaktighet**: 30–45 minuter | **⭐ Svårighetsgrad**: Nybörjare

---

## Översikt

Detta kapitel introducerar Azure Developer CLI (azd) grunderna. Du kommer att lära dig kärnkoncept, installera verktygen och distribuera din första applikation till Azure.

> Validerad mot `azd 1.23.12` i mars 2026.

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
| 2 | [Installation & uppsättning](installation.md) | Plattformspecifika installationsguider | 10 min |
| 3 | [Ditt första projekt](first-project.md) | Praktiskt: Distribuera en webbapp till Azure | 20 min |

---

## ✅ Börja här: Validera din miljö

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

Efter att ha slutfört detta kapitel bör du kunna:

```bash
azd version              # Visar installerad version
azd init --template todo-nodejs-mongo  # Initierar projektet
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

- [Kommandocheatsheet](../../resources/cheat-sheet.md)
- [Vanliga frågor](../../resources/faq.md)
- [Ordlista](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Trots att vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller felaktigheter. Originaldokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas en professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->