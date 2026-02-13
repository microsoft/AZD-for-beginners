# Kapittel 8: Produksjon og enterprise-mønstre

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 2-3 timer | **⭐ Kompleksitet**: Avansert

---

## Oversikt

Dette kapitlet dekker enterprise-klare distribusjonsmønstre, sikkerhetsherding, overvåking og kostnadsoptimalisering for produksjons-AI arbeidsmengder.

## Læringsmål

Ved å fullføre dette kapitlet vil du:
- Distribuere flerregions robuste applikasjoner
- Implementere sikkerhetsmønstre for enterprise
- Konfigurere omfattende overvåking
- Optimalisere kostnader i stor skala
- Sette opp CI/CD-pipelines med AZD

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Produksjon AI-praksis](production-ai-practices.md) | Distribusjonsmønstre for enterprise | 90 min |

---

## 🚀 Produksjonssjekkliste

- [ ] Flerregionsdistribusjon for høy tilgjengelighet
- [ ] Administrert identitet for autentisering (ingen nøkler)
- [ ] Application Insights for overvåking
- [ ] Kostnadsbudsjetter og varsler konfigurert
- [ ] Sikkerhetsskanning aktivert
- [ ] Integrasjon med CI/CD-pipeline
- [ ] Plan for katastrofegjenoppretting

---

## 🏗️ Arkitekturmønstre

### Mønster 1: Mikrotjenester for AI

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

### Mønster 2: Hendelsesdrevet AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Beste sikkerhetspraksiser

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

## 💰 Kostnadsoptimalisering

| Strategi | Besparelser |
|----------|-------------|
| Skaler til null (Container Apps) | 60-80% |
| Bruk forbruksnivåer for utvikling | 50-70% |
| Planlagt skalering | 30-50% |
| Reservert kapasitet | 20-40% |

```bash
# Angi budsjettvarsler
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Overvåkingsoppsett

```bash
# Strømme logger
azd monitor --logs

# Sjekk Application Insights
azd monitor

# Vis målinger
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Forrige** | [Kapittel 7: Feilsøking](../chapter-07-troubleshooting/README.md) |
| **Kurs fullført** | [Kursoversikt](../../README.md) |

---

## 📖 Relaterte ressurser

- [Guide til AI-agenter](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Multi-agentløsninger](../chapter-05-multi-agent/README.md)
- [Mikrotjenesteksempel](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten Co-op Translator (https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell, menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->