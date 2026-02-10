# Hoofdstuk 6: Pre-deploymentplanning & validatie

**📚 Cursus**: [AZD voor Beginners](../../README.md) | **⏱️ Duur**: 1 uur | **⭐ Complexiteit**: Gemiddeld

---

## Overzicht

Dit hoofdstuk behandelt essentiële plannings- en validatiestappen vóór het uitrollen van je applicatie. Leer kostbare fouten te voorkomen met juiste capaciteitsplanning, SKU-selectie en preflight-controles.

## Leerdoelen

Door dit hoofdstuk te voltooien zul je:
- Preflight-controles uitvoeren vóór implementatie
- Capaciteit plannen en de benodigde resources inschatten
- Geschikte SKU's kiezen voor kostenoptimalisatie
- Application Insights configureren voor monitoring
- Patronen voor teamcoördinatie begrijpen

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Configuratie valideren vóór implementatie | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Schat de benodigde resources | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Kies geschikte prijsniveaus | 15 min |
| 4 | [Application Insights](application-insights.md) | Monitoring configureren | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Workflows voor teamimplementatie | 15 min |

---

## 🚀 Snelstart

```bash
# Controleer abonnementsquota
az vm list-usage --location eastus --output table

# Voorbeeldimplementatie (geen resources aangemaakt)
azd provision --preview

# Valideer Bicep-syntaxis
az bicep build --file infra/main.bicep

# Controleer de omgevingsconfiguratie
azd env get-values
```

---

## ☑️ Checklist vóór implementatie

### Voor `azd provision`

- [ ] Quota geverifieerd voor regio
- [ ] SKU's passend geselecteerd
- [ ] Kostenraming beoordeeld
- [ ] Naamgevingsconventie consistent
- [ ] Beveiliging/RBAC geconfigureerd

### Voor `azd deploy`

- [ ] Omgevingsvariabelen ingesteld
- [ ] Geheimen in Key Vault
- [ ] Verbindingsstrings gecontroleerd
- [ ] Health checks geconfigureerd

---

## 💰 SKU-selectiegids

| Werklast | Ontwikkeling | Productie |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Volgende** | [Hoofdstuk 7: Problemen oplossen](../chapter-07-troubleshooting/README.md) |

---

## 📖 Gerelateerde bronnen

- [Configuratiehandleiding](../chapter-03-configuration/configuration.md)
- [Implementatiegids](../chapter-04-infrastructure/deployment-guide.md)
- [Veelvoorkomende problemen](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal geldt als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->