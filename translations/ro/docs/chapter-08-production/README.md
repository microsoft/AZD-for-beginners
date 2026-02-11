# Capitolul 8: Modele pentru producție și întreprinderi

**📚 Curs**: [AZD pentru Începători](../../README.md) | **⏱️ Durată**: 2-3 ore | **⭐ Complexitate**: Avansat

---

## Prezentare generală

Acest capitol acoperă modele de implementare pregătite pentru mediul enterprise, întărirea securității, monitorizare și optimizarea costurilor pentru sarcini AI în producție.

## Obiective de învățare

Prin parcurgerea acestui capitol, veți:
- Implementa aplicații reziliente în mai multe regiuni
- Implementa modele de securitate pentru întreprinderi
- Configura monitorizare cuprinzătoare
- Optimiza costurile la scară
- Configura pipeline-uri CI/CD cu AZD

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Practici AI pentru producție](production-ai-practices.md) | Modele de implementare pentru întreprinderi | 90 min |

---

## 🚀 Lista de verificare pentru producție

- [ ] Implementare multi-regiune pentru reziliență
- [ ] Identitate administrată pentru autentificare (fără chei)
- [ ] Application Insights pentru monitorizare
- [ ] Bugete de cost și alerte configurate
- [ ] Scanare de securitate activată
- [ ] Integrare pipeline CI/CD
- [ ] Plan de recuperare în caz de dezastru

---

## 🏗️ Modele arhitecturale

### Model 1: Microservicii AI

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

### Model 2: AI bazat pe evenimente

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Bune practici de securitate

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

## 💰 Optimizarea costurilor

| Strategie | Economii |
|----------|---------|
| Scalare la zero (Container Apps) | 60-80% |
| Folosirea nivelurilor de consum pentru dezvoltare | 50-70% |
| Scalare programată | 30-50% |
| Capacitate rezervată | 20-40% |

```bash
# Setează alerte pentru buget
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Configurare monitorizare

```bash
# Transmite loguri
azd monitor --logs

# Verifică Application Insights
azd monitor

# Vizualizează metrici
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 7: Depanare](../chapter-07-troubleshooting/README.md) |
| **Curs complet** | [Pagina cursului](../../README.md) |

---

## 📖 Resurse conexe

- [Ghid agenți AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Soluții multi-agent](../chapter-05-multi-agent/README.md)
- [Exemplu microservicii](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Declinare de responsabilitate:
Acest document a fost tradus folosind un serviciu de traducere prin inteligență artificială [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autoritară. Pentru informații critice se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->