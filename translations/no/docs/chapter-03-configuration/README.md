# Kapittel 3: Konfigurasjon & Autentisering

**📚 Kurs**: [AZD For Nybegynnere](../../README.md) | **⏱️ Varighet**: 45-60 minutter | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapittelet dekker miljøkonfigurasjon, autentiseringsmønstre, og sikkerhetsbeste praksis for Azure Developer CLI-distribusjoner.

> Validert mot `azd 1.25.6` i juni 2026.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Mestre AZD-konfigurasjonshierarkiet
- Administrere flere miljøer (dev, staging, prod)
- Implementere sikker autentisering med administrerte identiteter
- Konfigurere miljøspesifikke innstillinger

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|---------|-------------|-----|
| 1 | [Konfigurasjonsguide](configuration.md) | Miljøoppsett og administrasjon | 30 min |
| 2 | [Autentisering & Sikkerhet](authsecurity.md) | Administrert identitet og RBAC-mønstre | 30 min |

---

## 🚀 Rask Start

```bash
# Opprett flere miljøer
azd env new dev
azd env new staging
azd env new prod

# Bytt miljøer
azd env select prod

# Sett miljøvariabler
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Vis konfigurasjon
azd env get-values
```

---

## 🔧 Konfigurasjonshierarki

AZD anvender innstillinger i denne rekkefølgen (senere overstyrer tidligere):

1. **Standardverdier** (innebygd i maler)
2. **azure.yaml** (prosjektkonfigurasjon)
3. **Miljøvariabler** (`azd env set`)
4. **Kommando-linje-flagg** (`--location eastus`)

---

## 🔐 Sikkerhetsbeste Praksis

```bash
# Bruk administrert identitet (anbefalt)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Sjekk AZD autentiseringsstatus
azd auth status

# Valgfritt: verifiser Azure CLI-kontekst hvis du planlegger å kjøre az-kommandoer
az account show

# Autentiser på nytt om nødvendig
azd auth login

# Valgfritt: oppdater Azure CLI-autentisering for az-kommandoer
az login
```

---

## 🔗 Navigasjon

| Retning | Kapittel |
|---------|----------|
| **Forrige** | [Kapittel 2: AI-utvikling](../chapter-02-ai-development/README.md) |
| **Neste** | [Kapittel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Relaterte Ressurser

- [Sjekkliste før distribusjon](../chapter-06-pre-deployment/README.md)
- [Feilsøking](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->