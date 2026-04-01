# Kapittel 6: Planlegging og validering før distribusjon

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 1 time | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapittelet dekker viktige planleggings- og valideringstrinn før du distribuerer applikasjonen din. Lær hvordan du unngår kostbare feil med riktig kapasitetsplanlegging, SKU-utvelgelse og preflight-sjekker.

> Validert mot `azd 1.23.12` i mars 2026.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Kjøre preflight-sjekker før distribusjon
- Planlegge kapasitet og estimere ressursbehov
- Velge passende SKU-er for kostnadsoptimalisering
- Konfigurere Application Insights for overvåkning
- Forstå teamkoordinasjonsmønstre

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|---------|-------------|-----|
| 1 | [Preflight Checks](preflight-checks.md) | Validere konfigurasjon før distribusjon | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimere ressursbehov | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Velge passende prismodeller | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurere overvåkning | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Teamets distribusjonsarbeidsflyt | 15 min |

---

## 🚀 Rask start

```bash
# Sjekk abonnementskvoter
az vm list-usage --location eastus --output table

# Forhåndsvis distribusjon (ingen ressurser opprettet)
azd provision --preview

# Valider Bicep-syntaks
az bicep build --file infra/main.bicep

# Sjekk miljøkonfigurasjon
azd env get-values
```

---

## ☑️ Sjekkliste før distribusjon

### Før `azd provision`

- [ ] Kvote verifisert for region
- [ ] SKU-er valgt riktig
- [ ] Kostnadsestimat gjennomgått
- [ ] Navnekonvensjon konsistent
- [ ] Sikkerhet/RBAC konfigurert

### Før `azd deploy`

- [ ] Miljøvariabler satt
- [ ] Hemmeligheter i Key Vault
- [ ] Tilkoblingsstrenger verifisert
- [ ] Helsesjekker konfigurert

---

## 💰 Veiledning for SKU-utvelgelse

| Arbeidsbelastning | Utvikling | Produksjon |
|-------------------|-----------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigasjon

| Retning | Kapittel |
|---------|----------|
| **Forrige** | [Kapittel 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Neste** | [Kapittel 7: Feilsøking](../chapter-07-troubleshooting/README.md) |

---

## 📖 Relaterte ressurser

- [Konfigurasjonsveiledning](../chapter-03-configuration/configuration.md)
- [Distribusjonsveiledning](../chapter-04-infrastructure/deployment-guide.md)
- [Vanlige problemer](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->