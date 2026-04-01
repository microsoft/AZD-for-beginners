# Kapitel 6: Planlægning og validering før udrulning

**📚 Kursus**: [AZD for begyndere](../../README.md) | **⏱️ Varighed**: 1 time | **⭐ Kompleksitet**: Mellem

---

## Oversigt

Dette kapitel dækker væsentlige planlægnings- og valideringstrin før udrulning af din applikation. Lær at undgå dyre fejl med korrekt kapacitetsplanlægning, SKU-udvælgelse og preflight-tjek.

> Valideret mod `azd 1.23.12` i marts 2026.

## Læringsmål

Når du har gennemført dette kapitel, vil du:
- Køre preflight-tjek før udrulning
- Planlægge kapacitet og estimere ressourcebehov
- Vælge passende SKU'er for omkostningsoptimering
- Konfigurere Application Insights til overvågning
- Forstå teamkoordinationsmønstre

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Preflight-tjek](preflight-checks.md) | Validér konfiguration før udrulning | 15 min |
| 2 | [Kapacitetsplanlægning](capacity-planning.md) | Estimer ressourcebehov | 20 min |
| 3 | [Valg af SKU'er](sku-selection.md) | Vælg passende prissætningsniveauer | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurér overvågning | 20 min |
| 5 | [Koordinationsmønstre](coordination-patterns.md) | Teamets udrulningsarbejdsgange | 15 min |

---

## 🚀 Hurtig start

```bash
# Kontroller abonnementskvoter
az vm list-usage --location eastus --output table

# Forhåndsvis udrulning (ingen ressourcer oprettes)
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
- [ ] SKU'er valgt passende
- [ ] Omkostningsestimat gennemgået
- [ ] Navnekonvention ensartet
- [ ] Sikkerhed/RBAC konfigureret

### Før `azd deploy`

- [ ] Miljøvariabler indstillet
- [ ] Adgangsoplysninger i Key Vault
- [ ] Forbindelsestrenge verificeret
- [ ] Sundhedskontroller konfigureret

---

## 💰 Guide til valg af SKU'er

| Workload | Udvikling | Produktion |
|----------|-----------|------------|
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

## 📖 Relaterede ressourcer

- [Konfigurationsguide](../chapter-03-configuration/configuration.md)
- [Udrulningsguide](../chapter-04-infrastructure/deployment-guide.md)
- [Almindelige problemer](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->