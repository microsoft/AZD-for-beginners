# Kapittel 7: Feilsøking og Debugging

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 1-1,5 timer | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapittelet hjelper deg med å diagnostisere og løse vanlige problemer ved bruk av Azure Developer CLI. Fra distribusjonsfeil til AI-spesifikke problemer.

> Kommando-veiledning gjennomgått mot den utgitte `azd 1.37.2` referansen. Sky-distribusjoner ble ikke utført. Bytt ut eksempelressursnavn og IDer før du bruker kommandoene.

## Læringsmål

Ved å fullføre dette kapitlet vil du:
- Diagnostisere vanlige AZD distribusjonsfeil
- Feilsøke autentiserings- og tillatelsesproblemer
- Løse AI-tjeneste tilkoblingsproblemer
- Bruke Azure Portal og CLI for feilsøking

---

## 📚 Lekser

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Vanlige Problemer](common-issues.md) | Ofte møtte problemer | 30 min |
| 2 | [Debuggingguide](debugging.md) | Trinn-for-trinn feilsøking | 45 min |
| 3 | [AI Feilsøking](ai-troubleshooting.md) | AI-spesifikke problemer | 30 min |

---

## 🚨 Rask Løsning

### Autentiseringsproblemer
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Problemer med Tilordning
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Ressurskonflikter
Undersøk først eksisterende ressurs- og distribusjonsfeil. Ikke slett et delt eller produksjonsmiljø for å løse en navnekonflikt. For et **nytt disponibelt miljø**, bruk et unikt navn:

```bash
azd env new different-name
azd up
```

### Kvotebegrensning overskredet
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Endring av `AZURE_LOCATION` flytter ikke eksisterende ressurser og kan forårsake lokasjonskonflikter ved redistribusjon.

---

## 📋 Feilkode Referanse

| Feil | Årsak | Løsning |
|-------|-------|----------|
| `AuthenticationError` | Ikke pålogget | `azd auth login` |
| `ResourceNotFound` | Manglende ressurs | Sjekk ressursnavn |
| `QuotaExceeded` | Abonnementsgrenser | Be om kvoteøkning |
| `InvalidTemplate` | Bicep syntaksfeil | `az bicep build` |
| `Conflict` | Ressurs eksisterer | Bruk nytt navn eller slett |
| `Forbidden` | Utilstrekkelige tillatelser | Sjekk RBAC roller |

---

## 🔄 Tilbakestilling og Gjenoppretting

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Hard tilbakestilling sletter data og kan endre endepunkter. Ta sikkerhetskopi først og gå gjennom interaktive sletteforespørsler. `--force --purge` er kun egnet for disponibelt miljø når irreversibel sletting er ønsket.

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Forrige** | [Kapittel 6: Forutsatt distribusjon](../chapter-06-pre-deployment/README.md) |
| **Neste** | [Kapittel 8: Produksjon](../chapter-08-production/README.md) |

---

## 📖 Relaterte Ressurser

- [Forhåndssjekker før distribusjon](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurasjonsveiledning](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->