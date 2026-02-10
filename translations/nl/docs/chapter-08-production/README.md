# Hoofdstuk 8: Productie- & Enterprise-patronen

**📚 Cursus**: [AZD Voor Beginners](../../README.md) | **⏱️ Duur**: 2-3 uur | **⭐ Complexiteit**: Geavanceerd

---

## Overzicht

Dit hoofdstuk behandelt enterprise-klare implementatiepatronen, beveiligingsverharding, monitoring en kostenoptimalisatie voor productie-AI-workloads.

## Leerdoelen

Door dit hoofdstuk te voltooien, zul je:
- Implementeer veerkrachtige toepassingen in meerdere regio's
- Implementeer enterprise-beveiligingspatronen
- Configureer uitgebreide monitoring
- Optimaliseer kosten op schaal
- Stel CI/CD-pijplijnen in met AZD

---

## 📚 Lessen

| # | Les | Beschrijving | Tijd |
|---|--------|-------------|------|
| 1 | [Productie AI-praktijken](production-ai-practices.md) | Enterprise-implementatiepatronen | 90 min |

---

## 🚀 Productie-checklist

- [ ] Implementatie in meerdere regio's voor veerkracht
- [ ] Beheerde identiteit voor authenticatie (geen sleutels)
- [ ] Application Insights voor monitoring
- [ ] Kostenbudgetten en waarschuwingen geconfigureerd
- [ ] Beveiligingsscanning ingeschakeld
- [ ] Integratie van CI/CD-pijplijn
- [ ] Noodherstelplan

---

## 🏗️ Architectuurpatronen

### Patroon 1: Microservices AI

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

### Patroon 2: Gebeurtenisgestuurde AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Beste beveiligingspraktijken

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

## 💰 Kostenoptimalisatie

| Strategie | Besparingen |
|----------|---------|
| Schaal naar nul (Container Apps) | 60-80% |
| Gebruik verbruiksniveaus voor ontwikkeling | 50-70% |
| Geplande schaling | 30-50% |
| Gereserveerde capaciteit | 20-40% |

```bash
# Stel budgetwaarschuwingen in
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Monitoringconfiguratie

```bash
# Logs streamen
azd monitor --logs

# Controleer Application Insights
azd monitor

# Bekijk statistieken
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigatie

| Richting | Hoofdstuk |
|-----------|---------|
| **Vorige** | [Hoofdstuk 7: Problemen oplossen](../chapter-07-troubleshooting/README.md) |
| **Cursus voltooid** | [Cursusoverzicht](../../README.md) |

---

## 📖 Gerelateerde bronnen

- [Gids voor AI-agents](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Multi-agentoplossingen](../chapter-05-multi-agent/README.md)
- [Microservices-voorbeeld](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel wij naar nauwkeurigheid streven, houd er rekening mee dat automatische vertalingen fouten of onjuistheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->