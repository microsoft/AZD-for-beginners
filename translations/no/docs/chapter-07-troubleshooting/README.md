# Kapittel 7: Feilsøking og Debugging

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 1-1,5 timer | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapittelet hjelper deg med å diagnostisere og løse vanlige problemer når du jobber med Azure Developer CLI. Fra distribusjonsfeil til AI-spesifikke problemer.

> Validert mot `azd 1.23.12` i mars 2026.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Diagnostisere vanlige AZD distribusjonsfeil
- Debugge autentiserings- og tillatelsesproblemer
- Løse AI-tjenestetilkoblingsproblemer
- Bruke Azure Portal og CLI til feilsøking

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|---------|-------------|------|
| 1 | [Vanlige Problemer](common-issues.md) | Ofte møtte problemer | 30 min |
| 2 | [Debugging Guide](debugging.md) | Steg-for-steg debugging-strategier | 45 min |
| 3 | [AI Feilsøking](ai-troubleshooting.md) | AI-spesifikke problemer | 30 min |

---

## 🚨 Rask Løsning

### Autentiseringsproblemer
```bash
# Kreves for AZD-arbeidsflyter
azd auth login

# Valgfritt hvis du også bruker Azure CLI-kommandoer direkte
az login

azd auth status
```

### Leveringsfeil
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

### Kvotemaksimum nådd
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Feilkodeskatalog

| Feil | Årsak | Løsning |
|------|-------|---------|
| `AuthenticationError` | Ikke logget inn | `azd auth login` |
| `ResourceNotFound` | Manglende ressurs | Sjekk ressursnavn |
| `QuotaExceeded` | Abonnementsgrenser | Be om økt kvote |
| `InvalidTemplate` | Bicep syntaksfeil | `az bicep build` |
| `Conflict` | Ressurs finnes allerede | Bruk nytt navn eller slett |
| `Forbidden` | Manglende tillatelser | Sjekk RBAC-roller |

---

## 🔄 Tilbakestilling og Gjenoppretting

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
|---------|----------|
| **Forrige** | [Kapittel 6: Forhåndsdistribusjon](../chapter-06-pre-deployment/README.md) |
| **Neste** | [Kapittel 8: Produksjon](../chapter-08-production/README.md) |

---

## 📖 Relaterte Ressurser

- [Forhåndssjekk](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurasjonsguide](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på dets opprinnelige språk bør anses som den offisielle kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår fra bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->