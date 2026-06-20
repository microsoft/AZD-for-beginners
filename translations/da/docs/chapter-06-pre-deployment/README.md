# Kapitel 6: Forudgående planlægning og validering

**📚 Kursus**: [AZD for begyndere](../../README.md) | **⏱️ Varighed**: 1 time | **⭐ Kompleksitet**: Mellemniveau

---

## Oversigt

Dette kapitel dækker væsentlige planlægnings- og valideringstrin, før du implementerer din applikation. Lær at undgå dyre fejl med korrekt kapacitetsplanlægning, valg af SKU'er og preflight-tjek.

> Valideret imod `azd 1.25.6` i juni 2026.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Køre preflight-kontroller før implementering
- Planlægge kapacitet og estimere ressourcebehov
- Vælge passende SKUs for omkostningsoptimering
- Konfigurere Application Insights til overvågning
- Forstå mønstre for teamkoordinering

---

## 📚 Lektioner

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Preflight-kontroller](preflight-checks.md) | Valider konfiguration før implementering | 15 min |
| 2 | [Kapacitetsplanlægning](capacity-planning.md) | Estimer ressourcebehov | 20 min |
| 3 | [SKU-valg](sku-selection.md) | Vælg passende prisklasser | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurer overvågning | 20 min |
| 5 | [Koordineringsmønstre](coordination-patterns.md) | Teamets udrulningsarbejdsgange | 15 min |

---

## 🚀 Hurtig start

```bash
# Kontroller abonnementskvoter
az vm list-usage --location eastus --output table

# Forhåndsvisning af udrulning (ingen ressourcer oprettes)
azd provision --preview

# Valider Bicep-syntaks
az bicep build --file infra/main.bicep

# Kontroller miljøkonfiguration
azd env get-values
```

---

## ☑️ Tjekliste før implementering

### Før `azd provision`

- [ ] Kvoter bekræftet for regionen
- [ ] SKUs valgt passende
- [ ] Omkostningsestimat gennemgået
- [ ] Navnekonvention ensartet
- [ ] Sikkerhed/RBAC konfigureret

### Før `azd deploy`

- [ ] Miljøvariabler indstillet
- [ ] Secrets i Key Vault
- [ ] Forbindelsesstrenge verificeret
- [ ] Sundhedstjek konfigureret

---

## 💰 Vejledning til SKU-valg

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Forbrugsbaseret | Dedicated D4 |
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

- [Konfigurationsguide](../chapter-03-configuration/configuration.md)
- [Udrulningsvejledning](../chapter-04-infrastructure/deployment-guide.md)
- [Almindelige problemer](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->