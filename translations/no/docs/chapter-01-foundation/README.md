# Kapittel 1: Grunnlag & Rask Start

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 30-45 minutter | **⭐ Vanskelighetsgrad**: Nybegynner

---

## Oversikt

Dette kapitlet introduserer Azure Developer CLI (azd) grunnleggende. Du vil lære kjernebegreper, installere verktøyene og distribuere din første applikasjon til Azure.

> Validert mot `azd 1.25.6` i juni 2026.

## Læringsmål

Ved å fullføre dette kapitlet vil du:
- Forstå hva Azure Developer CLI er og hvordan det skiller seg fra Azure CLI
- Installere og konfigurere AZD på din plattform
- Distribuere din første applikasjon til Azure med `azd up`
- Rydde opp ressurser med `azd down`

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|---------|-------------|-----|
| 1 | [AZD Basics](azd-basics.md) | Kjernebegreper, terminologi og prosjektstruktur | 15 min |
| 2 | [Installation & Setup](installation.md) | Plattformspesifikke installasjonsguider | 10 min |
| 3 | [Your First Project](first-project.md) | Praktisk: Distribuer en webapp til Azure | 20 min |
| 4 | [Bring Your Own App](bring-your-own-app.md) | Legg til azd i et eksisterende prosjekt du allerede har | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Reproduserbare azd-miljøer med dev containers | 15 min |

---

## ✅ Start her: Verifiser oppsettet ditt

Før du begynner, bekreft at din lokale maskin er klar for kapittel 1-malen:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis skriptet rapporterer manglende verktøy, fikser du disse først og fortsetter deretter med kapitlet.

---

## 🚀 Rask start

```bash
# Sjekk installasjonen
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

Etter å ha fullført dette kapitlet skal du kunne:

```bash
azd version              # Viser installert versjon
azd init --template todo-nodejs-mongo  # Initialiserer prosjekt
azd up                   # Distribuerer til Azure
azd show                 # Viser URL til kjørende app
azd down --force --purge # Rydder opp ressurser
```

---

## 🔗 Navigasjon

| Retning | Kapittel |
|---------|----------|
| **Neste** | [Kapittel 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Hopp til** | [Kapittel 3: Konfigurasjon](../chapter-03-configuration/README.md) |

---

## 📖 Relaterte ressurser

- [Kommandooversikt](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Ordlisten](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->