# Hoofdstuk 7: Probleemoplossing & debuggen

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 1-1,5 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk helpt je bij het diagnosticeren en oplossen van veelvoorkomende problemen bij het werken met Azure Developer CLI. Van implementatiefouten tot AI-specifieke problemen.

> Gevalideerd met `azd 1.23.12` in maart 2026.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- Diagnosticeer veelvoorkomende AZD-implementatiefouten
- Debug authenticatie- en machtigingsproblemen
- Los verbindingsproblemen met AI-services op
- Gebruik Azure Portal en CLI voor probleemoplossing

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Veelvoorkomende problemen](common-issues.md) | Veelvoorkomende problemen | 30 min |
| 2 | [Debuggengids](debugging.md) | Stapsgewijze debugstrategieën | 45 min |
| 3 | [AI-probleemoplossing](ai-troubleshooting.md) | AI-specifieke problemen | 30 min |

---

## 🚨 Snelle oplossingen

### Authenticatieproblemen
```bash
# Vereist voor AZD-workflows
azd auth login

# Optioneel als u ook rechtstreeks Azure CLI-opdrachten gebruikt
az login

azd auth status
```

### Fouten bij provisioning
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Resourceconflicten
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

## 📋 Foutcode-referentie

| Fout | Oorzaak | Oplossing |
|-------|-------|----------|
| `AuthenticationError` | Niet ingelogd | `azd auth login` |
| `ResourceNotFound` | Ontbrekende resource | Controleer resource-namen |
| `QuotaExceeded` | Abonnementslimieten | Vraag verhoging van quota aan |
| `InvalidTemplate` | Bicep-syntaxisfout | `az bicep build` |
| `Conflict` | Resource bestaat | Gebruik nieuwe naam of verwijder |
| `Forbidden` | Onvoldoende machtigingen | Controleer RBAC-rollen |

---

## 🔄 Reset en herstel

```bash
# Zachte reset (bronnen behouden, code opnieuw uitrollen)
azd deploy --force

# Harde reset (alles verwijderen, opnieuw beginnen)
azd down --force --purge
azd up
```

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 6: Pre-implementatie](../chapter-06-pre-deployment/README.md) |
| **Volgende** | [Hoofdstuk 8: Productie](../chapter-08-production/README.md) |

---

## 📖 Gerelateerde bronnen

- [Pre-implementatiecontroles](../chapter-06-pre-deployment/preflight-checks.md)
- [Configuratiehandleiding](../chapter-03-configuration/configuration.md)
- [AZD GitHub-issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, moet u zich ervan bewust zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->