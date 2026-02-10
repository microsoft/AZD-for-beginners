# Kapitel 6: Planering och validering före distribution

**📚 Kurs**: [AZD för nybörjare](../../README.md) | **⏱️ Varaktighet**: 1 timme | **⭐ Komplexitet**: Medel

---

## Översikt

Detta kapitel täcker viktiga planerings- och valideringssteg innan du distribuerar din applikation. Lär dig att undvika kostsamma misstag med korrekt kapacitetsplanering, val av SKU och förkontroller.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Köra förkontroller före distribution
- Planera kapacitet och uppskatta resursbehov
- Välja lämpliga SKU:er för kostnadsoptimering
- Konfigurera Application Insights för övervakning
- Förstå mönster för teamkoordination

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Förkontroller](preflight-checks.md) | Validera konfiguration innan distribution | 15 min |
| 2 | [Kapacitetsplanering](capacity-planning.md) | Uppskatta resursbehov | 20 min |
| 3 | [Val av SKU](sku-selection.md) | Välj lämpliga prisnivåer | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurera övervakning | 20 min |
| 5 | [Koordinationsmönster](coordination-patterns.md) | Arbetsflöden för teamdistribution | 15 min |

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

- [ ] Kvoter verifierade för regionen
- [ ] SKU:er valda korrekt
- [ ] Kostnadsuppskattning granskad
- [ ] Namnkonventionen konsekvent
- [ ] Säkerhet/RBAC konfigurerat

### Innan `azd deploy`

- [ ] Miljövariabler inställda
- [ ] Hemligheter i Key Vault
- [ ] Anslutningssträngar verifierade
- [ ] Hälsokontroller konfigurerade

---

## 💰 Guide för val av SKU

| Arbetsbelastning | Utveckling | Produktion |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
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
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten Co-op Translator (https://github.com/Azure/co-op-translator). Trots att vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess originalspråk ska anses vara den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->