# Kapittel 1: Grunnlag & Rask Start

**📚 Kurs**: [AZD For Nybegynnere](../../README.md) | **⏱️ Varighet**: 30-45 minutter | **⭐ Vanskelighetsgrad**: Nybegynner

---

## Oversikt

Dette kapittelet introduserer Azure Developer CLI (azd) grunnleggende. Du vil lære kjernekonsepter, installere verktøyene og distribuere din første applikasjon til Azure.

> Validert med `azd 1.27.1` i juli 2026.

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
| 1 | [AZD Grunnleggende](azd-basics.md) | Kjernetemaer, terminologi og prosjektstruktur | 15 min |
| 2 | [Installasjon & Oppsett](installation.md) | Plattformspesifikke installasjonsveiledninger | 10 min |
| 3 | [Ditt Første Prosjekt](first-project.md) | Praktisk: Distribuer en webapp til Azure | 20 min |
| 4 | [Ta med egen app](bring-your-own-app.md) | Legg til azd i et eksisterende prosjekt du allerede har | 15 min |
| 5 | [Utviklingscontainere & Codespaces](dev-containers.md) | Reproduserbare azd-miljøer med utviklingscontainere | 15 min |

---

## ✅ Start her: Valider oppsettet ditt

Før du begynner, bekreft at din lokale maskin er klar for kapittel 1-mal:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis skriptet rapporterer manglende verktøy, fiks disse først og fortsett deretter med kapitlet.

---

## 🚀 Rask Start

```bash
# Sjekk installasjon
azd version

# Autentiser for AZD
# Valgfritt: az login hvis du planlegger å kjøre Azure CLI-kommandoer direkte
azd auth login

# Distribuer din første app
azd init --template todo-nodejs-mongo
azd up

# Rydd opp når du er ferdig
azd down --force --purge
```

---

## ✅ Suksesskriterier

Etter å ha fullført dette kapittelet, bør du kunne:

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
| **Neste** | [Kapittel 2: AI-Første Utvikling](../chapter-02-ai-development/README.md) |
| **Hopp til** | [Kapittel 3: Konfigurasjon](../chapter-03-configuration/README.md) |

---

## 📖 Relaterte Ressurser

- [Kommando-hurtigreferanse](../../resources/cheat-sheet.md)
- [Ofte Stilte Spørsmål](../../resources/faq.md)
- [Ordlisten](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->