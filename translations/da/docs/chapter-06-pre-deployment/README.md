# Kapitel 6: Planlægning & Validering Før Udrulning

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 1 time | **⭐ Sværhedsgrad**: Mellem

---

## Oversigt

Dette kapitel dækker væsentlige planlægnings- og valideringstrin før udrulning af din applikation. Lær at undgå dyre fejl med korrekt kapacitetsplanlægning, valg af SKU'er og preflight-tjek.

> Valideret med `azd 1.27.1` i juli 2026.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Køre preflight-tjek før udrulning
- Planlægge kapacitet og estimere ressourcernes behov
- Vælge passende SKU'er til omkostningsoptimering
- Konfigurere Application Insights til overvågning
- Forstå teamkoordinationsmønstre

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Valider konfiguration før udrulning | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimer ressourcernes behov | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Vælg passende prismodeller | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurer overvågning | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Teamets udrulningsarbejdsgange | 15 min |

---

## 🚀 Kom Godt I Gang

```bash
# Tjek abonnementskvoter
az vm list-usage --location eastus --output table

# Forhåndsvis implementering (ingen ressourcer oprettes)
azd provision --preview

# Validér Bicep-syntaks
az bicep build --file infra/main.bicep

# Tjek miljøkonfiguration
azd env get-values
```

---

## ☑️ Tjekliste Før Udrulning

### Før `azd provision`

- [ ] Kvota bekræftet for region
- [ ] SKU'er valgt passende
- [ ] Omkostningsoverslag gennemgået
- [ ] Konsistent navngivningskonvention
- [ ] Sikkerhed/RBAC konfigureret

### Før `azd deploy`

- [ ] Miljøvariabler sat
- [ ] Hemmeligheder i Key Vault
- [ ] Forbindelsesstrenge bekræftet
- [ ] Sundhedstjek konfigureret

---

## 💰 Guide til SKU-Valg

| Arbejdsbelastning | Udvikling | Produktion |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Næste** | [Kapitel 7: Fejlfinding](../chapter-07-troubleshooting/README.md) |

---

## 📖 Relaterede Ressourcer

- [Konfigurationsguide](../chapter-03-configuration/configuration.md)
- [Udrulningsguide](../chapter-04-infrastructure/deployment-guide.md)
- [Almindelige Problemer](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->