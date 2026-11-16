# Kapitel 6: Planering och validering före distribution

**📚 Kurs**: [AZD För nybörjare](../../README.md) | **⏱️ Tid**: 2-4 timmar läsning; extra tid för anpassade labbar | **⭐ Svårighetsgrad**: Mellan–Avancerad

---

## Översikt

Det här kapitlet täcker viktiga planerings- och valideringssteg före distribution av din applikation. Lär dig undvika kostsamma misstag genom korrekt kapacitetsplanering, val av SKU och förhandskontroller.

> Kommandoriktlinjer granskade mot den publicerade `azd 1.37.2` referensen. Molndistributioner har inte körts. De längre lektionerna innehåller illustrativa fragment, inte kompletta lokala distributionsprojekt.

## Målsättningar

När du har slutfört detta kapitel kommer du att:
- Köra förhandskontroller före distribution
- Planera kapacitet och uppskatta resursbehov
- Välja lämpliga SKU:er för kostnadsoptimering
- Konfigurera Application Insights för övervakning
- Förstå mönster för samordning av flera agenter och deras distributionskrav

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Förhandskontroller](preflight-checks.md) | Validera konfiguration före distribution | 15 min |
| 2 | [Kapacitetsplanering](capacity-planning.md) | Uppskatta resursbehov | 20 min |
| 3 | [SKU-val](sku-selection.md) | Välj lämpliga prisklasser | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurera övervakning | 20 min |
| 5 | [Samordningsmönster](coordination-patterns.md) | Avancerad design för multi-agent orkestrering | 60-75 min |

---

## 🚀 Snabbstart

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

## ☑️ Checklista före distribution

### Innan `azd provision`

- [ ] Kvot verifierad för region
- [ ] SKU:er valda korrekt
- [ ] Kostnadsberäkning granskad
- [ ] Konventionsnamngivning konsekvent
- [ ] Säkerhet/RBAC konfigurerad

### Innan `azd deploy`

- [ ] Miljövariabler satta
- [ ] Hemligheter i Key Vault
- [ ] Anslutningssträngar verifierade
- [ ] Hälsokontroller konfigurerade

---

## 💰 Guide för SKU-val

| Arbetsbelastning | Utveckling | Produktion |
|----------|-------------|------------|
| Container Apps | Consumption | Consumption eller dedikerad arbetsprofil, baserat på mätt belastning |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI-modeller | Stödd pay-as-you-go-distributionstyp | Pay-as-you-go eller provisionerad genomströmning; beroende på modell/region |
| AI Search | Gratis/Basic inom gränser | Basic eller Standard-nivå anpassad för index, repliker och frågelast |

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