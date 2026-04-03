# Kapitel 8: Produktions- och företagsmönster

**📚 Kurs**: [AZD för nybörjare](../../README.md) | **⏱️ Varaktighet**: 2-3 timmar | **⭐ Komplexitet**: Avancerad

---

## Översikt

Detta kapitel täcker företagsklara distributionsmönster, säkerhetshärdning, övervakning och kostnadsoptimering för produktionsarbetsbelastningar för AI.

> Validerad mot `azd 1.23.12` i mars 2026.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Distribuera applikationer mot flera regioner för resilens
- Implementera säkerhetsmönster för företag
- Konfigurera omfattande övervakning
- Optimera kostnader i stor skala
- Sätta upp CI/CD-pipelines med AZD

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Produktionspraxis för AI](production-ai-practices.md) | Företagsdistributionsmönster | 90 min |

---

## 🚀 Produktionschecklista

- [ ] Distribution över flera regioner för motståndskraft
- [ ] Hanterad identitet för autentisering (inga nycklar)
- [ ] Application Insights för övervakning
- [ ] Kostnadsbudgetar och varningar konfigurerade
- [ ] Säkerhetsskanning aktiverad
- [ ] Integration med CI/CD-pipeline
- [ ] Katastrofåterställningsplan

---

## 🏗️ Arkitekturmönster

### Mönster 1: Mikrotjänster för AI

```mermaid
graph LR
    Gateway[API-gateway] --> AI[AI-tjänst] --> Models[Microsoft Foundry-modeller]
    Gateway --> Auth[Autentiseringstjänst]
    AI --> Data[Datalagring]
```
### Mönster 2: Händelsestyrd AI

```mermaid
graph LR
    EventGrid[Händelsenät] --> Functions[Funktioner] --> Pipeline[AI-pipeline]
```
---

## 🔐 Bästa säkerhetspraxis

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Kostnadsoptimering

| Strategi | Besparingar |
|----------|-------------|
| Skala till noll (Container Apps) | 60-80% |
| Använd konsumtionsnivåer för utveckling (dev) | 50-70% |
| Schemalagd skalning | 30-50% |
| Reserverad kapacitet | 20-40% |

```bash
# Ställ in budgetvarningar
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Övervakningsinställningar

```bash
# Strömma loggar
azd monitor --logs

# Kontrollera Application Insights
azd monitor --overview

# Visa mätvärden
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Föregående** | [Kapitel 7: Felsökning](../chapter-07-troubleshooting/README.md) |
| **Kurs slutförd** | [Kursöversikt](../../README.md) |

---

## 📖 Relaterade resurser

- [Guide för AI-agenter](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Fleragentslösningar](../chapter-05-multi-agent/README.md)
- [Exempel på mikrotjänster](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig observera att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på sitt ursprungsspråk ska betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell översättning utförd av en mänsklig översättare. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->