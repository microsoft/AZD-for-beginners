# Kapitel 6: Planering och validering före distribution

**📚 Kurs**: [AZD För nybörjare](../../README.md) | **⏱️ Varaktighet**: 1 timme | **⭐ Svårighetsgrad**: Medelnivå

---

## Översikt

Detta kapitel täcker viktiga planerings- och valideringssteg innan du distribuerar din applikation. Lär dig undvika kostsamma misstag med korrekt kapacitetsplanering, SKU-val och förhandskontroller.

> Validerad mot `azd 1.27.1` i juli 2026.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Köra förhandskontroller före distribution
- Planera kapacitet och uppskatta resursbehov
- Välja lämpliga SKU:er för kostnadsoptimering
- Konfigurera Application Insights för övervakning
- Förstå samordningsmönster för teamet

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Förhandskontroller](preflight-checks.md) | Validera konfiguration före distribution | 15 min |
| 2 | [Kapacitetsplanering](capacity-planning.md) | Uppskatta resursbehov | 20 min |
| 3 | [SKU-val](sku-selection.md) | Välj lämpliga prisnivåer | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurera övervakning | 20 min |
| 5 | [Samordningsmönster](coordination-patterns.md) | Teamets distributionsarbetsflöden | 15 min |

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

## ☑️ Kontrollista före distribution

### Före `azd provision`

- [ ] Kvot verifierad för region
- [ ] SKU:er valda lämpligt
- [ ] Kostnadsuppskattning granskad
- [ ] Namngivningskonvention konsekvent
- [ ] Säkerhet/RBAC konfigurerat

### Före `azd deploy`

- [ ] Miljövariabler satta
- [ ] Hemligheter i Key Vault
- [ ] Anslutningssträngar verifierade
- [ ] Hälsokontroller konfigurerade

---

## 💰 Guide för SKU-val

| Arbetsbelastning | Utveckling | Produktion |
|----------|-------------|------------|
| Containerappar | Consumption | Dedicated D4 |
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
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->