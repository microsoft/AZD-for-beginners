# Hoofdstuk 6: Pre-Deployment Planning & Validatie

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 1 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk behandelt essentiële plannings- en validatiestappen vóór het implementeren van je applicatie. Leer kostbare fouten te vermijden met goede capaciteitsplanning, SKU-selectie en preflight checks.

> Gevalideerd tegen `azd 1.27.1` in juli 2026.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- Preflight checks uitvoeren vóór implementatie
- Capaciteitsplanning maken en resourcevereisten inschatten
- Passende SKU's selecteren voor kostenoptimalisatie
- Application Insights configureren voor monitoring
- Patronen voor teamcoördinatie begrijpen

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Configuratie valideren vóór implementatie | 15 min |
| 2 | [Capaciteitsplanning](capacity-planning.md) | Resourcevereisten inschatten | 20 min |
| 3 | [SKU Selectie](sku-selection.md) | Passende prijsniveaus kiezen | 15 min |
| 4 | [Application Insights](application-insights.md) | Monitoring configureren | 20 min |
| 5 | [Coördinatiepatronen](coordination-patterns.md) | Team deployment workflows | 15 min |

---

## 🚀 Snelstart

```bash
# Controleer abonnementquota
az vm list-usage --location eastus --output table

# Voorbeeld van implementatie (geen bronnen aangemaakt)
azd provision --preview

# Valideer Bicep-syntaxis
az bicep build --file infra/main.bicep

# Controleer omgevingsconfiguratie
azd env get-values
```

---

## ☑️ Pre-implementatie Checklist

### Voor `azd provision`

- [ ] Quotum geverifieerd voor regio
- [ ] SKU's passend geselecteerd
- [ ] Kostenschatting beoordeeld
- [ ] Naamgevingsconventie consistent
- [ ] Beveiliging/RBAC geconfigureerd

### Voor `azd deploy`

- [ ] Omgevingsvariabelen ingesteld
- [ ] Geheimen in Key Vault
- [ ] Connectiestrings geverifieerd
- [ ] Health checks geconfigureerd

---

## 💰 SKU Selectiegids

| Werkbelasting | Ontwikkeling | Productie |
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

## 📖 Gerelateerde Bronnen

- [Configuratiehandleiding](../chapter-03-configuration/configuration.md)
- [Implementatiehandleiding](../chapter-04-infrastructure/deployment-guide.md)
- [Veelvoorkomende Problemen](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->