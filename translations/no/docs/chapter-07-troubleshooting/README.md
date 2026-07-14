# Kapittel 7: Feilsøking og Debugging

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 1-1.5 timer | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapittelet hjelper deg å diagnostisere og løse vanlige problemer når du jobber med Azure Developer CLI. Fra distribusjonsfeil til AI-spesifikke problemer.

> Validert mot `azd 1.27.1` i juli 2026.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Diagnostisere vanlige AZD distribusjonsfeil
- Feilsøke autentiserings- og tillatelsesproblemer
- Løse AI-tjeneste tilkoblingsproblemer
- Bruke Azure Portal og CLI for feilsøking

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Vanlige problemer](common-issues.md) | Ofte forekommende problemer | 30 min |
| 2 | [Debugging guide](debugging.md) | Trinnvise feilsøkingsstrategier | 45 min |
| 3 | [AI feilsøking](ai-troubleshooting.md) | AI-spesifikke problemer | 30 min |

---

## 🚨 Rask løsning

### Autentiseringsproblemer
```bash
# Påkrevd for AZD-arbeidsflyter
azd auth login

# Valgfritt hvis du også bruker Azure CLI-kommandoer direkte
az login

azd auth status
```

### Distribusjonsfeil
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

### Kvote overskredet
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Feilkodeoversikt

| Feil | Årsak | Løsning |
|-------|-------|----------|
| `AuthenticationError` | Ikke innlogget | `azd auth login` |
| `ResourceNotFound` | Manglende ressurs | Sjekk ressursnavn |
| `QuotaExceeded` | Abonnementsgrenser | Be om økning av kvote |
| `InvalidTemplate` | Bicep syntaksfeil | `az bicep build` |
| `Conflict` | Ressurs eksisterer | Bruk nytt navn eller slett |
| `Forbidden` | Utilstrekkelige rettigheter | Sjekk RBAC roller |

---

## 🔄 Tilbakestilling og gjenoppretting

```bash
# Myk tilbakestilling (behold ressurser, distribuer kode på nytt)
azd deploy --force

# Hard tilbakestilling (slett alt, start på nytt)
azd down --force --purge
azd up
```

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Forrige** | [Kapittel 6: Forberedelse før distribusjon](../chapter-06-pre-deployment/README.md) |
| **Neste** | [Kapittel 8: Produksjon](../chapter-08-production/README.md) |

---

## 📖 Relaterte ressurser

- [Forhåndssjekker før distribusjon](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurasjonsguide](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->