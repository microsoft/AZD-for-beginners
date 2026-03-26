# Kapitel 6: Planering och validering före distribution

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varaktighet**: 1 timme | **⭐ Komplexitet**: Medelnivå

---

## Översikt

Detta kapitel täcker viktiga planerings- och valideringssteg innan du distribuerar din applikation. Lär dig undvika kostsamma misstag med korrekt kapacitetsplanering, val av SKU och förkontroller.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Köra förkontroller innan distribution
- Planera kapacitet och uppskatta resursbehov
- Välj lämpliga SKU:er för kostnadsoptimering
- Konfigurera Application Insights för övervakning
- Förstå samordningsmönster för teamet

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Förkontroller](preflight-checks.md) | Validera konfiguration innan distribution | 15 min |
| 2 | [Kapacitetsplanering](capacity-planning.md) | Uppskatta resursbehov | 20 min |
| 3 | [Val av SKU](sku-selection.md) | Välj lämpliga prisnivåer | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurera övervakning | 20 min |
| 5 | [Koordineringsmönster](coordination-patterns.md) | Teamets distributionsarbetsflöden | 15 min |

---

## 🚀 Snabbstart

```bash
# Kontrollera prenumerationskvoter
az vm list-usage --location eastus --output table

# Förhandsgranska distribution (inga resurser skapas)
azd provision --preview

# Validera Bicep-syntax
az bicep build --file infra/main.bicep

# Kontrollera miljökonfiguration
azd env get-values
```

---

## ☑️ Checklista före distribution

### Innan `azd provision`

- [ ] Kvot verifierad för regionen
- [ ] SKU:er valda lämpligt
- [ ] Kostnadsberäkning granskad
- [ ] Namngivningskonvention konsekvent
- [ ] Säkerhet/RBAC konfigurerat

### Innan `azd deploy`

- [ ] Miljövariabler inställda
- [ ] Hemligheter i Key Vault
- [ ] Anslutningssträngar verifierade
- [ ] Hälsokontroller konfigurerade

---

## 💰 Guide för SKU-val

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Föregående** | [Kapitel 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Nästa** | [Kapitel 7: Felsökning](../chapter-07-troubleshooting/README.md) |

---

## 📖 Relaterade resurser

- [Konfigurationsguide](../chapter-03-configuration/configuration.md)
- [Distributionsguide](../chapter-04-infrastructure/deployment-guide.md)
- [Vanliga problem](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, observera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess ursprungliga språk bör anses vara den auktoritativa källan. För kritisk information rekommenderas en professionell översättning utförd av en mänsklig översättare. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->