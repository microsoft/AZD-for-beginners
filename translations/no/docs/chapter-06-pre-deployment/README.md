# Kapittel 6: Forhåndsplanlegging og validering før distribusjon

**📚 Kurs**: [AZD for nybegynnere](../../README.md) | **⏱️ Varighet**: 1 time | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapittelet dekker viktige planleggings- og valideringstrinn før du distribuerer applikasjonen din. Lær å unngå kostbare feil med riktig kapasitetsplanlegging, valg av SKU og preflight-sjekker.

## Læringsmål

By completing this chapter, you will:
- Kjør preflight-sjekker før distribusjon
- Planlegg kapasitet og estimer ressursbehov
- Velg passende SKU-er for kostnadsoptimalisering
- Konfigurer Application Insights for overvåking
- Forstå mønstre for teamkoordinering

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Valider konfigurasjon før distribusjon | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimer ressursbehov | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Velg passende prisnivåer | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurer overvåking | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Teamets distribusjonsarbeidsflyter | 15 min |

---

## 🚀 Rask start

```bash
# Sjekk abonnementskvoter
az vm list-usage --location eastus --output table

# Forhåndsvis distribusjon (ingen ressurser opprettes)
azd provision --preview

# Valider Bicep-syntaks
az bicep build --file infra/main.bicep

# Sjekk miljøkonfigurasjon
azd env get-values
```

---

## ☑️ Sjekkliste før distribusjon

### Før `azd provision`

- [ ] Kvote bekreftet for regionen
- [ ] SKU-er valgt riktig
- [ ] Kostnadsestimat gjennomgått
- [ ] Navnekonvensjon konsistent
- [ ] Sikkerhet/RBAC konfigurert

### Før `azd deploy`

- [ ] Miljøvariabler satt
- [ ] Hemmeligheter i Key Vault
- [ ] Tilkoblingsstrenger verifisert
- [ ] Helsjekker konfigurert

---

## 💰 Veiledning for valg av SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Forrige** | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Neste** | [Chapter 7: Feilsøking](../chapter-07-troubleshooting/README.md) |

---

## 📖 Relaterte ressurser

- [Konfigurasjonsguide](../chapter-03-configuration/configuration.md)
- [Distribusjonsguide](../chapter-04-infrastructure/deployment-guide.md)
- [Vanlige problemer](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som følge av bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->