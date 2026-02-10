# Hoofdstuk 7: Probleemoplossing & Debugging

**📚 Cursus**: [AZD For Beginners](../../README.md) | **⏱️ Duur**: 1-1.5 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk helpt je bij het diagnosticeren en oplossen van veelvoorkomende problemen bij het werken met de Azure Developer CLI. Van implementatiefouten tot AI-specifieke problemen.

## Leerdoelen

Na het voltooien van dit hoofdstuk kun je:
- Veelvoorkomende AZD-implementatiefouten diagnosticeren
- Authenticatie- en machtigingsproblemen debuggen
- Connectiviteitsproblemen van AI-services oplossen
- Azure Portal en CLI gebruiken voor probleemoplossing

---

## 📚 Lessons

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Veelvoorkomende problemen](common-issues.md) | Veel voorkomende problemen | 30 min |
| 2 | [Debuggids](debugging.md) | Stapsgewijze debugstrategieën | 45 min |
| 3 | [AI-probleemoplossing](ai-troubleshooting.md) | AI-specifieke problemen | 30 min |

---

## 🚨 Snelle oplossingen

### Authenticatieproblemen
```bash
azd auth login
az login
azd auth whoami
```

### Provisioning-fouten
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Bronconflicten
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
| `ResourceNotFound` | Ontbrekende resource | Controleer resourcenamen |
| `QuotaExceeded` | Abonnementslimieten | Vraag verhoging van de quota aan |
| `InvalidTemplate` | Bicep-syntaxisfout | `az bicep build` |
| `Conflict` | Resource bestaat | Gebruik een nieuwe naam of verwijder |
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

- [Pre-deployment-controles](../chapter-06-pre-deployment/preflight-checks.md)
- [Configuratiegids](../chapter-03-configuration/configuration.md)
- [AZD GitHub-issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->