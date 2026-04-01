# Kapittel 1: Grunnlag & Komme i Gang

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 30-45 minutter | **⭐ Vanskelighetsgrad**: Nybegynner

---

## Oversikt

Dette kapittelet introduserer grunnleggende Azure Developer CLI (azd). Du vil lære kjernebegreper, installere verktøyene, og distribuere din første applikasjon til Azure.

> Validert mot `azd 1.23.12` i mars 2026.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Forstå hva Azure Developer CLI er og hvordan det skiller seg fra Azure CLI
- Installere og konfigurere AZD på din plattform
- Distribuere din første applikasjon til Azure med `azd up`
- Rydde opp ressurser med `azd down`

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | Kjernebegreper, terminologi og prosjektstruktur | 15 min |
| 2 | [Installasjon & Oppsett](installation.md) | Plattformspesifikke installasjonsguider | 10 min |
| 3 | [Ditt Første Prosjekt](first-project.md) | Praktisk: Distribuer en webapp til Azure | 20 min |

---

## ✅ Start Her: Validér Ditt Oppsett

Før du begynner, forsikre deg om at din lokale maskin er klar for kapittel 1-malen:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis skriptet rapporterer manglende verktøy, fiks disse først og fortsett deretter med kapittelet.

---

## 🚀 Komme i Gang

```bash
# Sjekk installasjon
azd version

# Autentiser for AZD
# Valgfritt: az innlogging hvis du planlegger å kjøre Azure CLI-kommandoer direkte
azd auth login

# Distribuer din første app
azd init --template todo-nodejs-mongo
azd up

# Rydd opp når du er ferdig
azd down --force --purge
```

---

## ✅ Suksesskriterier

Etter å ha fullført dette kapittelet skal du kunne:

```bash
azd version              # Viser installert versjon
azd init --template todo-nodejs-mongo  # Initialiserer prosjekt
azd up                   # Distribuerer til Azure
azd show                 # Viser URL for kjørende app
azd down --force --purge # Rydder opp ressurser
```

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Neste** | [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/README.md) |
| **Hopp til** | [Kapittel 3: Konfigurasjon](../chapter-03-configuration/README.md) |

---

## 📖 Relaterte Ressurser

- [Kommandooversikt](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Ordliste](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet har blitt oversatt ved bruk av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på sitt opprinnelige språk skal anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for noen misforståelser eller feiltolkninger som oppstår fra bruken av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->