# Kapitel 1: Grundläggande och Snabbstart

**📚 Kurs**: [AZD för nybörjare](../../README.md) | **⏱️ Varaktighet**: 30-45 minuter | **⭐ Komplexitet**: Nybörjare

---

## Översikt

Detta kapitel introducerar grunderna i Azure Developer CLI (azd). Du kommer att lära dig kärnkoncept, installera verktygen och distribuera din första applikation till Azure.

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
| 2 | [Installation och konfiguration](installation.md) | Plattformspecifika installationsguider | 10 min |
| 3 | [Ditt första projekt](first-project.md) | Praktiskt: Distribuera en webbapp till Azure | 20 min |

---

## 🚀 Snabbstart

```bash
# Kontrollera installationen
azd version

# Logga in på Azure
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
azd init --template todo-nodejs-mongo  # Initierar projekt
azd up                   # Distribuerar till Azure
azd show                 # Visar URL för den körande appen
azd down --force --purge # Rensar upp resurser
```

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Nästa** | [Kapitel 2: AI-fokuserad utveckling](../chapter-02-ai-development/README.md) |
| **Hoppa till** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |

---

## 📖 Relaterade resurser

- [Kommandosnabbguide](../../resources/cheat-sheet.md)
- [Vanliga frågor](../../resources/faq.md)
- [Ordlista](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter korrekthet, var vänlig och observera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk ska betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->