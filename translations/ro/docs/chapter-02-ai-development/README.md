# Capitolul 2: Dezvoltare centrată pe AI

**📚 Curs**: [AZD For Beginners](../../README.md) | **⏱️ Durată**: 1-2 ore | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol se concentrează pe implementarea aplicațiilor bazate pe AI folosind Azure Developer CLI și serviciile Microsoft Foundry. De la aplicații simple de chat AI la agenți inteligenți cu instrumente.

## Obiective de învățare

Parcurgând acest capitol, veți:
- Implementați aplicații AI folosind șabloane AZD predefinite
- Înțelegeți integrarea Microsoft Foundry cu AZD
- Configurați și personalizați agenți AI cu instrumente
- Implementați aplicații RAG (Generare augmentată prin recuperare)

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Integrarea Microsoft Foundry](microsoft-foundry-integration.md) | Conectați AZD la serviciile Foundry | 30 min |
| 2 | [Ghid agenți AI](agents.md) | Implementați agenți inteligenți cu instrumente | 45 min |
| 3 | [Implementare modele AI](ai-model-deployment.md) | Implementați și configurați modele AI | 30 min |
| 4 | [Laborator AI](ai-workshop-lab.md) | Laborator practic: Pregătiți soluția AI pentru AZD | 60 min |

---

## 🚀 Pornire rapidă

```bash
# Opțiunea 1: Aplicație de chat RAG
azd init --template azure-search-openai-demo
azd up

# Opțiunea 2: Agenți IA
azd init --template get-started-with-ai-agents
azd up

# Opțiunea 3: Aplicație de chat rapidă
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Șabloane AI recomandate

| Șablon | Descriere | Servicii |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG cu citări | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent AI cu instrumente | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI de bază | OpenAI + Container Apps |

---

## 💰 Conștientizarea costurilor

| Mediu | Cost lunar estimat |
|-------------|----------------------|
| Dezvoltare | $80-150 |
| Pre-producție | $150-300 |
| Producție | $300-3,500+ |

**Sfat:** Rulați `azd down` după testare pentru a evita taxele.

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 1: Fundamente](../chapter-01-foundation/README.md) |
| **Următorul** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |
| **Sari la** | [Capitolul 8: Tipare de producție](../chapter-08-production/README.md) |

---

## 📖 Resurse conexe

- [Depanare AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Practici AI pentru producție](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Declinare de responsabilitate:
Acest document a fost tradus folosind serviciul de traducere AI Co-op Translator (https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->