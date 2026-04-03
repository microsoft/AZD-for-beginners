# Kapitel 6: Planering och validering inför distribution

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varaktighet**: 1 timme | **⭐ Komplexitet**: Medel

---

## Översikt

Detta kapitel täcker viktiga planerings- och valideringssteg innan du distribuerar din applikation. Lär dig att undvika kostsamma misstag genom korrekt kapacitetsplanering, val av SKU och preflight‑kontroller.

> Validerad mot `azd 1.23.12` i mars 2026.

## Lärandemål

När du har slutfört detta kapitel kommer du att:
- Köra preflight‑kontroller före distribution
- Planera kapacitet och uppskatta resursbehov
- Välja lämpliga SKU:er för kostnadsoptimering
- Konfigurera Application Insights för övervakning
- Förstå mönster för teamkoordinering

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Validera konfiguration innan distribution | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Uppskatta resursbehov | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Välja lämpliga prissättningsnivåer | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurera övervakning | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Teamets distributionsarbetsflöden | 15 min |

---

## 🚀 Kom igång snabbt

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

## ☑️ Checklista inför distribution

### Före `azd provision`

- [ ] Kvot verifierad för regionen
- [ ] SKUs valda på lämpligt sätt
- [ ] Kostnadsuppskattning granskad
- [ ] Konsekvent namngivningskonvention
- [ ] Säkerhet/RBAC konfigurerat

### Före `azd deploy`

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
- [Distribueringsguide](../chapter-04-infrastructure/deployment-guide.md)
- [Vanliga problem](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, observera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess ursprungsspråk bör anses vara den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->