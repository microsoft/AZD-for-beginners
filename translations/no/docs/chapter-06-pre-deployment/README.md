# Kapittel 6: Forhåndsplanlegging og validering før distribusjon

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 2–4 timer lesing; ekstra tid for tilpassede laboratorier | **⭐ Vanskelighetsgrad**: Middels–Avansert

---

## Oversikt

Dette kapitlet dekker viktige planleggings- og valideringstrinn før distribusjon av applikasjonen din. Lær å unngå kostbare feil med riktig kapasitetsplanlegging, SKU-valg og forhåndssjekker.

> Kommandoveiledning gjennomgått mot utgitt `azd 1.37.2` referanse. Sky-distribusjoner ble ikke utført. De lengre leksjonene inkluderer illustrerende fragmenter, ikke komplette lokale distribusjonsprosjekter.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Kjøre forhåndssjekker før distribusjon
- Planlegge kapasitet og estimere ressursbehov
- Velge passende SKUs for kostnadsoptimalisering
- Konfigurere Application Insights for overvåking
- Forstå mønstre for koordinering av flere agenter og deres distribusjonsbehov

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Forhåndssjekker](preflight-checks.md) | Valider konfigurasjon før distribusjon | 15 min |
| 2 | [Kapasitetsplanlegging](capacity-planning.md) | Estimer ressursbehov | 20 min |
| 3 | [SKU-valg](sku-selection.md) | Velg passende prisskalaer | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurer overvåking | 20 min |
| 5 | [Koordineringsmønstre](coordination-patterns.md) | Avansert orkestreringsdesign for flere agenter | 60–75 min |

---

## 🚀 Rask start

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Sjekkliste før distribusjon

### Før `azd provision`

- [ ] Kvote verifisert for region
- [ ] SKUs valgt passende
- [ ] Kostnadsestimat gjennomgått
- [ ] Navnekonvensjon konsistent
- [ ] Sikkerhet/RBAC konfigurert

### Før `azd deploy`

- [ ] Miljøvariabler satt
- [ ] Hemmeligheter i Key Vault
- [ ] Tilkoblingsstrenger verifisert
- [ ] Helsekontroller konfigurert

---

## 💰 Veiledning for SKU-valg

| Arbeidsbelastning | Utvikling | Produksjon |
|----------|-------------|------------|
| Container Apps | Consumption | Consumption eller dedikert arbeidsprofil, basert på målt belastning |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI-modeller | Støttet betalingsmodell for bruk | Betaling etter bruk eller forhåndsallokert gjennomstrømning; avhengig av modell/region |
| AI Search | Gratis/Basic innenfor grenser | Basic eller Standard-nivå tilpasset indeks, replikater og spørringsbelastning |

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
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
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->