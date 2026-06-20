# Hoofdstuk 6: Pre-deploymentplanning & validatie

**📚 Cursus**: [AZD For Beginners](../../README.md) | **⏱️ Duur**: 1 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk behandelt essentiële plannings- en validatiestappen voordat u uw applicatie implementeert. Leer kostbare fouten te vermijden met juiste capaciteitsplanning, SKU-selectie en preflightcontroles.

> Gevalideerd tegen `azd 1.25.6` in juni 2026.

## Leerdoelen

Door dit hoofdstuk te voltooien zult u:
- Preflightcontroles uitvoeren vóór implementatie
- Capaciteit plannen en benodigde resources inschatten
- Geschikte SKUs selecteren voor kostenoptimalisatie
- Application Insights configureren voor monitoring
- Patronen voor teamcoördinatie begrijpen

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Preflightcontroles](preflight-checks.md) | Valideer configuratie vóór implementatie | 15 min |
| 2 | [Capaciteitsplanning](capacity-planning.md) | Schat resourcevereisten | 20 min |
| 3 | [SKU-selectie](sku-selection.md) | Kies geschikte prijsniveaus | 15 min |
| 4 | [Application Insights](application-insights.md) | Configureer monitoring | 20 min |
| 5 | [Coördinatiepatronen](coordination-patterns.md) | Workflows voor teamimplementatie | 15 min |

---

## 🚀 Snelstart

```bash
# Controleer abonnementsquota
az vm list-usage --location eastus --output table

# Voorvertoning van de implementatie (er worden geen resources aangemaakt)
azd provision --preview

# Valideer Bicep-syntaxis
az bicep build --file infra/main.bicep

# Controleer omgevingsconfiguratie
azd env get-values
```

---

## ☑️ Controlelijst vóór implementatie

### Voor `azd provision`

- [ ] Quota geverifieerd voor regio
- [ ] SKUs correct geselecteerd
- [ ] Kostenschatting beoordeeld
- [ ] Naamgevingsconventie consistent
- [ ] Beveiliging/RBAC geconfigureerd

### Voor `azd deploy`

- [ ] Omgevingsvariabelen ingesteld
- [ ] Geheimen in Key Vault
- [ ] Verbindingsstrings geverifieerd
- [ ] Gezondheidscontroles geconfigureerd

---

## 💰 SKU-selectiegids

| Workload | Ontwikkeling | Productie |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Volgende** | [Hoofdstuk 7: Probleemoplossing](../chapter-07-troubleshooting/README.md) |

---

## 📖 Gerelateerde bronnen

- [Configuratiehandleiding](../chapter-03-configuration/configuration.md)
- [Implementatiehandleiding](../chapter-04-infrastructure/deployment-guide.md)
- [Veelvoorkomende problemen](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->