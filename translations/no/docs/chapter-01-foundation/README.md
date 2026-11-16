# Kapittel 1: Grunnlag & Rask Start

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 75-120 minutter inkludert første utrulling; ekstra øvelser tar lengre tid | **⭐ Vanskelighetsgrad**: Nybegynner

---

## Oversikt

Dette kapittelet introduserer grunnleggende om Azure Developer CLI (azd). Du vil lære kjernebegreper, installere verktøyene og distribuere din første applikasjon til Azure.

> Kommando- og konfigurasjonsgjennomgang mål: `azd 1.37.2` (November 2026). Live Azure-provisjonering ble ikke kjørt under gjennomgangen.

## Læringsmål

Når du har fullført dette kapittelet, vil du:
- Forstå hva Azure Developer CLI er og hvordan det skiller seg fra Azure CLI
- Installere og konfigurere AZD på din plattform
- Deployere din første applikasjon til Azure med `azd up`
- Rydde opp ressurser med `azd down`

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [AZD Grunnleggende](azd-basics.md) | Kjernebegreper, terminologi og prosjektstruktur | 15 min |
| 2 | [Installasjon & Oppsett](installation.md) | Plattformspesifikke installasjonsguider | 10 min |
| 3 | [Ditt Første Prosjekt](first-project.md) | Praktisk: Distribuer en webapp til Azure | 20 min |
| 4 | [Bruk Din Egen App](bring-your-own-app.md) | Legg til azd i et eksisterende prosjekt du allerede har | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Reproduserbare azd-miljøer med dev containers | 15 min |

---

## ✅ Start Her: Valider Oppsettet Ditt

Før du begynner, bekreft at din lokale maskin er klar for kapittel 1-malen:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis skriptet melder om manglende verktøy, fiks disse først og fortsett deretter med kapittelet.

---

## 🚀 Rask Start

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

## ✅ Suksesskriterier

Etter å ha fullført dette kapittelet, skal du kunne:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Neste** | [Kapittel 2: AI-Først Utvikling](../chapter-02-ai-development/README.md) |
| **Hopp til** | [Kapittel 3: Konfigurasjon](../chapter-03-configuration/README.md) |

---

## 📖 Relaterte Ressurser

- [Kommando Hurtigreferanse](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Ordlisten](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->