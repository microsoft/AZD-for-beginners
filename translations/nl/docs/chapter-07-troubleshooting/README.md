# Hoofdstuk 7: Problemen oplossen & Debuggen

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 1-1.5 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk helpt je bij het diagnosticeren en oplossen van veelvoorkomende problemen bij het werken met Azure Developer CLI. Van foutmeldingen bij deployment tot AI-specifieke problemen.

> Gecontroleerd met `azd 1.27.1` in juli 2026.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- Veelvoorkomende AZD deploymentfouten diagnosticeren
- Authenticatie- en machtigingsproblemen debuggen
- Problemen met AI-serviceconnectiviteit oplossen
- De Azure Portal en CLI gebruiken voor probleemoplossing

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Veelvoorkomende problemen](common-issues.md) | Vaak voorkomende problemen | 30 min |
| 2 | [Debugginsgids](debugging.md) | Stapsgewijze debugstrategieën | 45 min |
| 3 | [AI Problemen oplossen](ai-troubleshooting.md) | AI-specifieke problemen | 30 min |

---

## 🚨 Snelle oplossingen

### Authenticatieproblemen
```bash
# Vereist voor AZD-workflows
azd auth login

# Optioneel als u ook Azure CLI-commando's rechtstreeks gebruikt
az login

azd auth status
```

### Fouten bij provisioning
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Resource conflicten
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Quota overschreden
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Foutcode referentie

| Fout | Oorzaak | Oplossing |
|-------|-------|----------|
| `AuthenticationError` | Niet ingelogd | `azd auth login` |
| `ResourceNotFound` | Ontbrekende bron | Controleer bron namen |
| `QuotaExceeded` | Abonnementsbeperkingen | Vraag quota uitbreiding aan |
| `InvalidTemplate` | Bicep syntaxfout | `az bicep build` |
| `Conflict` | Bron bestaat al | Gebruik nieuwe naam of verwijder |
| `Forbidden` | Onvoldoende rechten | Controleer RBAC rollen |

---

## 🔄 Reset en herstel

```bash
# Zachte reset (houd bronnen vast, code opnieuw implementeren)
azd deploy --force

# Harde reset (alles verwijderen, opnieuw beginnen)
azd down --force --purge
azd up
```

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 6: Pre-Deployment](../chapter-06-pre-deployment/README.md) |
| **Volgende** | [Hoofdstuk 8: Productie](../chapter-08-production/README.md) |

---

## 📖 Gerelateerde bronnen

- [Pre-Deployment Checks](../chapter-06-pre-deployment/preflight-checks.md)
- [Configuratie Gids](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->