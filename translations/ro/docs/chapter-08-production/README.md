# Capitolul 8: Modele de Producție & Enterprise

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 2-3 ore | **⭐ Complexitate**: Avansat

---

## Prezentare generală

Acest capitol acoperă modele de implementare pregătite pentru mediul enterprise, întărirea securității, monitorizarea și optimizarea costurilor pentru sarcini de lucru AI în producție.

> Validat cu `azd 1.25.6` în iunie 2026.

## Obiective de învățare

Prin parcurgerea acestui capitol, vei:
- Implementa aplicații reziliente multi-regiune
- Implementa modele de securitate enterprise
- Configura monitorizare cuprinzătoare
- Optimiza costurile la scară
- Configura pipeline-uri CI/CD cu AZD

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-----------|------|
| 1 | [Practici AI pentru producție](production-ai-practices.md) | Modele de implementare enterprise | 90 min |

---

## 🚀 Lista de verificare pentru producție

- [ ] Implementare multi-regiune pentru reziliență
- [ ] Identitate gestionată pentru autentificare (fără chei)
- [ ] Application Insights pentru monitorizare
- [ ] Bugete și alerte de cost configurate
- [ ] Scanare de securitate activată
- [ ] Integrare pipeline CI/CD
- [ ] Plan de recuperare în caz de dezastru

---

## 🏗️ Modele de arhitectură

### Modelul 1: Microservicii AI

```mermaid
graph LR
    Gateway[API Gateway] --> AI[Serviciu AI] --> Models[Modele Microsoft Foundry]
    Gateway --> Auth[Serviciu Autentificare]
    AI --> Data[Stocare Date]
```

### Modelul 2: AI bazat pe evenimente

```mermaid
graph LR
    EventGrid[Grid de Evenimente] --> Functions[Funcții] --> Pipeline[Flux AI]
```

---

## 🔐 Cele mai bune practici de securitate

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
| Scalarea la zero (Container Apps) | 60-80% |
| Folosirea nivelurilor de consum pentru dev | 50-70% |
| Scalare programată | 30-50% |
| Capacitate rezervată | 20-40% |

```bash
# Setează alerte de buget
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Configurare monitorizare

```bash
# Flux de jurnale
azd monitor --logs

# Verifică Application Insights
azd monitor --overview

# Vizualizează metrici
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 7: Depanare](../chapter-07-troubleshooting/README.md) |
| **Curs finalizat** | [Pagina principală a cursului](../../README.md) |

---

## 📖 Resurse relevante

- [Ghid agenți AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Soluții multi-agent](../chapter-05-multi-agent/README.md)
- [Exemplu microservicii](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->