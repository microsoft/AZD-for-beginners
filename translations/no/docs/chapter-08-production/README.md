# Kapittel 8: Produksjon & Enterprise-mønstre

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 2-3 timer | **⭐ Vanskelighetsgrad**: Avansert

---

## Oversikt

Dette kapitlet dekker enterprise-klare distribusjonsmønstre, sikkerhetsforbedring, overvåking og kostnadsoptimalisering for produksjons-AI arbeidsbelastninger.

> Validert mot `azd 1.25.6` i juni 2026.

## Læringsmål

Ved å fullføre dette kapitlet vil du:
- Distribuere flerregionale robuste applikasjoner
- Implementere enterprise-sikkerhetsmønstre
- Konfigurere omfattende overvåking
- Optimalisere kostnader i stor skala
- Sette opp CI/CD-pipelines med AZD

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|---------|-------------|-----|
| 1 | [Produksjonspraksis for AI](production-ai-practices.md) | Enterprise distribusjonsmønstre | 90 min |

---

## 🚀 Produksjonsjekkliste

- [ ] Flerregional distribusjon for robusthet
- [ ] Administrert identitet for autentisering (ingen nøkler)
- [ ] Application Insights for overvåking
- [ ] Kostnadsbudsjetter og varsler konfigurert
- [ ] Sikkerhetsskanning aktivert
- [ ] CI/CD-pipeline-integrasjon
- [ ] Katastrofegjenopprettingsplan

---

## 🏗️ Arkitekturmønstre

### Mønster 1: Mikrotjenester AI

```mermaid
graph LR
    Gateway[API Gateway] --> AI[AI-tjeneste] --> Models[Microsoft Foundry-modeller]
    Gateway --> Auth[Autentiseringstjeneste]
    AI --> Data[Databutikk]
```

### Mønster 2: Hendelsesdrevet AI

```mermaid
graph LR
    EventGrid[Hendelsesnett] --> Functions[Funksjoner] --> Pipeline[AI-pipeline]
```

---

## 🔐 Sikkerhetsanbefalinger

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

| Strategi | Besparelse |
|----------|------------|
| Skaler til null (Container Apps) | 60-80 % |
| Bruk forbruksnivåer for utvikling | 50-70 % |
| Planlagt skalering | 30-50 % |
| Reservert kapasitet | 20-40 % |

```bash
# Sett budsjettvarsler
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Overvåkingsoppsett

```bash
# Stream logger
azd monitor --logs

# Sjekk Application Insights
azd monitor --overview

# Vis måledata
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigasjon

| Retning | Kapittel |
|----------|----------|
| **Forrige** | [Kapittel 7: Feilsøking](../chapter-07-troubleshooting/README.md) |
| **Fullfør kurs** | [Kurs Hjem](../../README.md) |

---

## 📖 Relaterte ressurser

- [AI-agentguide](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Multi-agentløsninger](../chapter-05-multi-agent/README.md)
- [Mikrotjenestereksempel](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->