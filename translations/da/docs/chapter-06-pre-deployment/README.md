# Kapitel 6: Forudgående planlægning og validering

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 1 time | **⭐ Sværhedsgrad**: Mellem

---

## Oversigt

Dette kapitel dækker essentielle planlægnings- og valideringstrin inden du udruller din applikation. Lær at undgå dyre fejl med korrekt kapacitetsplanlægning, SKU-valg og preflight-tjek.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Køre preflight-tjek før udrulning
- Planlægge kapacitet og estimere ressourcebehov
- Vælge passende SKUs for omkostningsoptimering
- Konfigurere Application Insights til overvågning
- Forstå teamkoordinationsmønstre

---

## 📚 Lektioner

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Valider konfiguration før udrulning | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimer ressourcernes behov | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Vælg passende prisniveauer | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurer overvågning | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Teamets implementeringsarbejdsgange | 15 min |

---

## 🚀 Hurtig start

```bash
# Kontroller abonnementskvoter
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

- [ ] Kvote bekræftet for regionen
- [ ] SKUs valgt passende
- [ ] Omkostningsestimat gennemgået
- [ ] Navngivningskonvention konsekvent
- [ ] Sikkerhed/RBAC konfigureret

### Før `azd deploy`

- [ ] Miljøvariabler indstillet
- [ ] Hemmeligheder i Key Vault
- [ ] Forbindelsestrenge bekræftet
- [ ] Sundhedstjek konfigureret

---

## 💰 Vejledning til SKU-valg

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Forrige** | [Kapitel 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Næste** | [Kapitel 7: Fejlfinding](../chapter-07-troubleshooting/README.md) |

---

## 📖 Relaterede ressourcer

- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- [Common Issues](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument i dets originalsprog bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->