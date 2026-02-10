# Kapitel 8: Produktion & företagsmönster

**📚 Kurs**: [AZD för nybörjare](../../README.md) | **⏱️ Varaktighet**: 2-3 timmar | **⭐ Komplexitet**: Avancerad

---

## Översikt

Detta kapitel täcker företagsklara distributionsmönster, säkerhetshärdning, övervakning och kostnadsoptimering för produktions-AI-arbetsbelastningar.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Distribuera applikationer över flera regioner för ökad motståndskraft
- Implementera säkerhetsmönster för företag
- Konfigurera omfattande övervakning
- Optimera kostnader i stor skala
- Sätta upp CI/CD-pipelines med AZD

---

## 📚 Lektioner

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Production AI Practices](production-ai-practices.md) | Företagsdistributionsmönster | 90 min |

---

## 🚀 Produktionschecklista

- [ ] Flerregionsdistribution för resiliens
- [ ] Hanterad identitet för autentisering (inga nycklar)
- [ ] Application Insights för övervakning
- [ ] Kostnadsbudgetar och larm konfigurerade
- [ ] Säkerhetsskanning aktiverad
- [ ] Integrering av CI/CD-pipeline
- [ ] Plan för katastrofåterställning

---

## 🏗️ Arkitekturmönster

### Mönster 1: Mikrotjänster för AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### Mönster 2: Händelsestyrd AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
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

| Strategy | Savings |
|----------|---------|
| Skala till noll (Container Apps) | 60-80% |
| Använd konsumtionsnivåer för utveckling | 50-70% |
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

## 📊 Övervakningsinställning

```bash
# Strömma loggar
azd monitor --logs

# Kontrollera Application Insights
azd monitor

# Visa mätvärden
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigering

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Kapitel 7: Felsökning](../chapter-07-troubleshooting/README.md) |
| **Course Complete** | [Kursens startsida](../../README.md) |

---

## 📖 Relaterade resurser

- [Guide för AI-agenter](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Fleragentlösningar](../chapter-05-multi-agent/README.md)
- [Exempel: mikrotjänster](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Vi eftersträvar noggrannhet, men observera att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->