# Kapitel 6: Forudgående planlægning og validering

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 1 time | **⭐ Kompleksitet**: Mellemniveau

---

## Oversigt

Dette kapitel dækker essentielle planlægnings- og valideringstrin inden du implementerer din applikation. Lær at undgå kostbare fejl med korrekt kapacitetsplanlægning, SKU-valg og forudgående kontroller.

## Læringsmål

Når du har gennemført dette kapitel, vil du:
- Køre forudgående kontroller før udrulning
- Planlægge kapacitet og anslå ressourcebehov
- Vælge passende SKU'er for omkostningsoptimering
- Konfigurere Application Insights til overvågning
- Forstå mønstre for teamkoordinering

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Forudgående kontroller](preflight-checks.md) | Validér konfiguration før udrulning | 15 min |
| 2 | [Kapacitetsplanlægning](capacity-planning.md) | Anslå ressourcebehov | 20 min |
| 3 | [SKU-valg](sku-selection.md) | Vælg passende prismuligheder | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurer overvågning | 20 min |
| 5 | [Koordineringsmønstre](coordination-patterns.md) | Teamets udrulningsarbejdsgange | 15 min |

---

## 🚀 Hurtigstart

```bash
# Kontroller abonnementets kvoter
az vm list-usage --location eastus --output table

# Forhåndsvis implementering (ingen ressourcer oprettes)
azd provision --preview

# Valider Bicep-syntaks
az bicep build --file infra/main.bicep

# Kontroller miljøkonfiguration
azd env get-values
```

---

## ☑️ Tjekliste før udrulning

### Før `azd provision`

- [ ] Kvoter verificeret for regionen
- [ ] SKUs valgt korrekt
- [ ] Omkostningsestimat gennemgået
- [ ] Navnekonvention konsekvent
- [ ] Sikkerhed/RBAC konfigureret

### Før `azd deploy`

- [ ] Miljøvariabler sat
- [ ] Hemmeligheder i Key Vault
- [ ] Forbindelsesstrenge verificeret
- [ ] Sundhedstjek konfigureret

---

## 💰 Vejledning til SKU-valg

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Forrige** | [Kapitel 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Næste** | [Kapitel 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 Relaterede ressourcer

- [Konfigurationsvejledning](../chapter-03-configuration/configuration.md)
- [Udrulningsguide](../chapter-04-infrastructure/deployment-guide.md)
- [Almindelige problemer](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument i sit oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->