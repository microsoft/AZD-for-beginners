# Kapittel 6: Planlegging og Validering før Distribusjon

**📚 Kurs**: [AZD For Begynnere](../../README.md) | **⏱️ Varighet**: 1 time | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapittelet dekker viktige planleggings- og valideringstrinn før du distribuerer applikasjonen din. Lær å unngå kostbare feil med riktig kapasitetplanlegging, SKU-valg og preflight-sjekker.

> Validert med `azd 1.27.1` i juli 2026.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Kjøre preflight-sjekker før distribusjon
- Planlegge kapasitet og estimere ressursbehov
- Velge passende SKUer for kostnadsoptimalisering
- Konfigurere Application Insights for overvåking
- Forstå teamkoordinasjonsmønstre

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|---------|-------------|-----|
| 1 | [Preflight-sjekker](preflight-checks.md) | Valider konfigurasjon før distribusjon | 15 min |
| 2 | [Kapasitetsplanlegging](capacity-planning.md) | Estimere ressursbehov | 20 min |
| 3 | [SKU-valg](sku-selection.md) | Velge passende prisnivåer | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurere overvåking | 20 min |
| 5 | [Koordinasjonsmønstre](coordination-patterns.md) | Teamets distribusjonsarbeidsflyter | 15 min |

---

## 🚀 Kom i gang raskt

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
- [ ] SKUer valgt riktig
- [ ] Kostnadsestimat gjennomgått
- [ ] Konsistent navnekonvensjon
- [ ] Sikkerhet/RBAC konfigurert

### Før `azd deploy`

- [ ] Miljøvariabler satt
- [ ] Hemmeligheter i Key Vault
- [ ] Tilkoblingsstrenger verifisert
- [ ] Helsesjekker konfigurert

---

## 💰 Veiledning for SKU-valg

| Arbeidsbelastning | Utvikling | Produksjon |
|------------------|-----------|------------|
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

## 📖 Relaterte Ressurser

- [Konfigurasjonsveiledning](../chapter-03-configuration/configuration.md)
- [Distribusjonsveiledning](../chapter-04-infrastructure/deployment-guide.md)
- [Vanlige problemer](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->