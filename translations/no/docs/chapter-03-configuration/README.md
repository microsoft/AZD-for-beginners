# Kapittel 3: Konfigurasjon og autentisering

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 45-60 minutter | **⭐ Kompleksitet**: Middels

---

## Oversikt

Dette kapitlet dekker miljøkonfigurasjon, autentiseringsmønstre og sikkerhetsanbefalinger for Azure Developer CLI-distribusjoner.

## Læringsmål

Ved å fullføre dette kapitlet vil du:
- Beherske AZD-konfigurasjonshierarkiet
- Administrere flere miljøer (dev, staging, prod)
- Implementere sikker autentisering med administrerte identiteter
- Konfigurere miljøspesifikke innstillinger

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Konfigurasjonsguide](configuration.md) | Miljøoppsett og administrasjon | 30 min |
| 2 | [Autentisering og sikkerhet](authsecurity.md) | Administrert identitet og RBAC-mønstre | 30 min |

---

## 🚀 Rask start

```bash
# Opprett flere miljøer
azd env new dev
azd env new staging
azd env new prod

# Bytt miljø
azd env select prod

# Angi miljøvariabler
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Vis konfigurasjon
azd env get-values
```

---

## 🔧 Konfigurasjonshierarki

AZD bruker innstillinger i denne rekkefølgen (senere overstyrer tidligere):

1. **Standardverdier** (innebygd i maler)
2. **azure.yaml** (prosjektkonfigurasjon)
3. **Miljøvariabler** (`azd env set`)
4. **Kommandolinjeflagg** (`--location eastus`)

---

## 🔐 Beste sikkerhetspraksis

```bash
# Bruk administrert identitet (anbefales)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kontroller autentiseringsstatus
azd auth whoami
az account show

# Autentiser på nytt om nødvendig
azd auth login
az login
```

---

## 🔗 Navigasjon

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Kapittel 2: AI-utvikling](../chapter-02-ai-development/README.md) |
| **Next** | [Kapittel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Relaterte ressurser

- [Sjekkliste før distribusjon](../chapter-06-pre-deployment/README.md)
- [Feilsøking](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->