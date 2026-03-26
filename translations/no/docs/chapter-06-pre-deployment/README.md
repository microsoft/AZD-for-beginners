# Kapittel 6: Planlegging og validering før utrulling

**📚 Kurs**: [AZD For Nybegynnere](../../README.md) | **⏱️ Varighet**: 1 time | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapittelet dekker viktige planleggings- og valideringssteg før du ruller ut applikasjonen din. Lær å unngå kostbare feil med riktig kapasitetsplanlegging, SKU-valg og preflight-sjekker.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Kjøre preflight-sjekker før utrulling
- Planlegge kapasitet og estimere ressursbehov
- Velge passende SKUer for kostnadsoptimalisering
- Konfigurere Application Insights for overvåking
- Forstå samarbeidsmønstre i teamet

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Preflight-sjekker](preflight-checks.md) | Valider konfigurasjon før utrulling | 15 min |
| 2 | [Kapasitetsplanlegging](capacity-planning.md) | Estimer ressursbehov | 20 min |
| 3 | [SKU-valg](sku-selection.md) | Velg passende prismodeller | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurer overvåking | 20 min |
| 5 | [Samarbeidsmønstre](coordination-patterns.md) | Teamets utrullingsarbeidsflyt | 15 min |

---

## 🚀 Rask Start

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

## ☑️ Sjekkliste før utrulling

### Før `azd provision`

- [ ] Kvote verifisert for region
- [ ] SKUer valgt riktig
- [ ] Kostnadsestimat gjennomgått
- [ ] Navnekonvensjon konsekvent
- [ ] Sikkerhet/RBAC konfigurert

### Før `azd deploy`

- [ ] Miljøvariabler satt
- [ ] Hemmeligheter i Key Vault
- [ ] Tilkoblingsstrenger verifisert
- [ ] Helsesjekker konfigurert

---

## 💰 Veiledning for SKU-valg

| Arbeidsbelastning | Utvikling | Produksjon |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Forrige** | [Kapittel 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Neste** | [Kapittel 7: Feilsøking](../chapter-07-troubleshooting/README.md) |

---

## 📖 Relaterte ressurser

- [Konfigurasjonsveiledning](../chapter-03-configuration/configuration.md)
- [Utrullingsveiledning](../chapter-04-infrastructure/deployment-guide.md)
- [Vanlige problemer](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved bruk av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for noen misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->