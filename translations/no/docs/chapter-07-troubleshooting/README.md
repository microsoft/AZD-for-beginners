# Kapittel 7: Feilsøking & Debugging

**📚 Kurs**: [AZD for nybegynnere](../../README.md) | **⏱️ Varighet**: 1-1.5 timer | **⭐ Kompleksitet**: Middels

---

## Oversikt

Dette kapittelet hjelper deg med å diagnostisere og løse vanlige problemer når du arbeider med Azure Developer CLI. Fra distribusjonsfeil til AI-spesifikke problemer.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Diagnostisere vanlige AZD-distribusjonsfeil
- Feilsøke autentiserings- og tillatelsesproblemer
- Løse tilkoblingsproblemer for AI-tjenester
- Bruke Azure-portalen og CLI for feilsøking

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Vanlige problemer](common-issues.md) | Ofte forekommende problemer | 30 min |
| 2 | [Feilsøkingsguide](debugging.md) | Trinnvise feilsøkingsstrategier | 45 min |
| 3 | [AI-feilsøking](ai-troubleshooting.md) | AI-spesifikke problemer | 30 min |

---

## 🚨 Raske løsninger

### Autentiseringsproblemer
```bash
azd auth login
az login
azd auth whoami
```

### Provisioning-feil
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Ressurskonflikter
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kvoter overskredet
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Feilkodereferanse

| Feil | Årsak | Løsning |
|-------|-------|----------|
| `AuthenticationError` | Ikke logget inn | `azd auth login` |
| `ResourceNotFound` | Manglende ressurs | Sjekk ressursnavn |
| `QuotaExceeded` | Abonnementsgrenser | Be om økning av kvote |
| `InvalidTemplate` | Bicep-syntaksfeil | `az bicep build` |
| `Conflict` | Ressurs eksisterer | Bruk nytt navn eller slett |
| `Forbidden` | Utilstrekkelige tillatelser | Sjekk RBAC-roller |

---

## 🔄 Tilbakestilling og gjenoppretting

```bash
# Myk tilbakestilling (behold ressurser, rull ut koden på nytt)
azd deploy --force

# Hard tilbakestilling (slett alt, start på nytt)
azd down --force --purge
azd up
```

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Forrige** | [Kapittel 6: Forhåndsdistribusjon](../chapter-06-pre-deployment/README.md) |
| **Neste** | [Kapittel 8: Produksjon](../chapter-08-production/README.md) |

---

## 📖 Relaterte ressurser

- [Forhåndssjekker](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurasjonsveiledning](../chapter-03-configuration/configuration.md)
- [AZD GitHub-issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, må du være oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Originaldokumentet på sitt opprinnelige språk bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->