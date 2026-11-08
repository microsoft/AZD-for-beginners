# Hoofdstuk 7: Problemen oplossen & Debuggen

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 1-1.5 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk helpt je bij het diagnosticeren en oplossen van veelvoorkomende problemen bij het werken met Azure Developer CLI. Van implementatiefouten tot AI-specifieke problemen.

> Commandoregelinstructies gecontroleerd aan de hand van de vrijgegeven `azd 1.37.2` referentie. Cloud-implementaties zijn niet uitgevoerd. Vervang voorbeeldresource-namen en ID's voordat je commando's gebruikt.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- Veelvoorkomende AZD-implementatiefouten diagnosticeren
- Authenticatie- en machtigingsproblemen debuggen
- Connectiviteitsproblemen van AI-services oplossen
- Azure Portal en CLI gebruiken voor probleemoplossing

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Veelvoorkomende Problemen](common-issues.md) | Vaak voorkomende problemen | 30 min |
| 2 | [Debugging Gids](debugging.md) | Stapsgewijze debugstrategieën | 45 min |
| 3 | [AI Probleemoplossing](ai-troubleshooting.md) | AI-specifieke problemen | 30 min |

---

## 🚨 Snelle Oplossingen

### Authenticatieproblemen
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Implementatiefouten
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Resource-conflicten
Controleer eerst de bestaande resource en implementatiefouten. Verwijder geen gedeelde of productieomgeving om een naamconflict op te lossen. Voor een **nieuwe wegwerpomgeving**, gebruik een unieke naam:

```bash
azd env new different-name
azd up
```

### Quota Overschreden
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Wijziging van `AZURE_LOCATION` verplaatst geen bestaande resources en kan locatieconflicten veroorzaken bij herimplementatie.

---

## 📋 Foutcode Referentie

| Fout | Oorzaak | Oplossing |
|-------|---------|----------|
| `AuthenticationError` | Niet ingelogd | `azd auth login` |
| `ResourceNotFound` | Ontbrekende resource | Controleer resourcenamen |
| `QuotaExceeded` | Abonnementsbeperkingen | Vraag quota-verhoging aan |
| `InvalidTemplate` | Bicep-syntaxisfout | `az bicep build` |
| `Conflict` | Resource bestaat al | Gebruik nieuwe naam of verwijder |
| `Forbidden` | Onvoldoende rechten | Controleer RBAC-rollen |

---

## 🔄 Resetten en Herstel

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

De harde reset verwijdert gegevens en kan endpoints veranderen. Maak eerst een back-up en bekijk de interactieve verwijderingsprompt. `--force --purge` is alleen geschikt voor wegwerpomgevingen wanneer onomkeerbare verwijdering is bedoeld.

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 6: Pre-Implementatie](../chapter-06-pre-deployment/README.md) |
| **Volgende** | [Hoofdstuk 8: Productie](../chapter-08-production/README.md) |

---

## 📖 Gerelateerde Middelen

- [Pre-Implementatie Controles](../chapter-06-pre-deployment/preflight-checks.md)
- [Configuratie Gids](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->