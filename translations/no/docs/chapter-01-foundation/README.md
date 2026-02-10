# Kapittel 1: Grunnlag & Rask start

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 30-45 minutter | **⭐ Vanskelighetsgrad**: Nybegynner

---

## Oversikt

Dette kapitlet introduserer grunnleggende om Azure Developer CLI (azd). Du vil lære kjernebegreper, installere verktøyene, og rulle ut din første applikasjon til Azure.

## Læringsmål

Ved å fullføre dette kapitlet vil du:
- Forstå hva Azure Developer CLI er og hvordan det skiller seg fra Azure CLI
- Installere og konfigurere AZD på din plattform
- Rulle ut din første applikasjon til Azure med `azd up`
- Rydd opp ressurser med `azd down`

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Kjernebegreper, terminologi og prosjektstruktur | 15 min |
| 2 | [Installation & Setup](installation.md) | Plattformspesifikke installasjonsveiledninger | 10 min |
| 3 | [Ditt første prosjekt](first-project.md) | Praktisk: Rull ut en webapp til Azure | 20 min |

---

## 🚀 Rask start

```bash
# Sjekk installasjonen
azd version

# Logg inn på Azure
azd auth login

# Distribuer din første app
azd init --template todo-nodejs-mongo
azd up

# Rydd opp når du er ferdig
azd down --force --purge
```

---

## ✅ Suksesskriterier

Etter å ha fullført dette kapitlet, bør du kunne:

```bash
azd version              # Viser installert versjon
azd init --template todo-nodejs-mongo  # Initialiserer prosjekt
azd up                   # Distribuerer til Azure
azd show                 # Viser URL for kjørende app
azd down --force --purge # Rydder opp i ressurser
```

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Neste** | [Kapittel 2: AI-først utvikling](../chapter-02-ai-development/README.md) |
| **Hopp til** | [Kapittel 3: Konfigurasjon](../chapter-03-configuration/README.md) |

---

## 📖 Relaterte ressurser

- [Kommandooversikt](../../resources/cheat-sheet.md)
- [Ofte stilte spørsmål](../../resources/faq.md)
- [Ordliste](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Originaldokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell, menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår som følge av bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->