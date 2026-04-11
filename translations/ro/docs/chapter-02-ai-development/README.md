# Capitolul 2: Dezvoltare AI-First

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 1-2 ore | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol se concentrează pe implementarea aplicațiilor cu capabilități AI folosind Azure Developer CLI și serviciile Microsoft Foundry. De la aplicații simple de chat AI până la agenți inteligenți cu instrumente.

> **Notă de validare (2026-03-25):** Fluxul de comenzi și ghidarea extensiei din acest capitol au fost verificate față de `azd` `1.23.12` și versiunea curentă de preview a extensiei agent AI `azure.ai.agents` `0.1.18-preview`. Dacă utilizați o versiune mai veche a AZD, actualizați mai întâi și apoi continuați cu exercițiile.

## Obiective de învățare

După parcurgerea acestui capitol, veți:
- Implementa aplicații AI folosind șabloane AZD predefinite
- Înțelege integrarea Microsoft Foundry cu AZD
- Configura și personaliza agenți AI cu instrumente
- Implementa aplicații RAG (Retrieval-Augmented Generation)

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Integrarea Microsoft Foundry](microsoft-foundry-integration.md) | Conectați AZD cu serviciile Foundry | 30 min |
| 2 | [Ghid agenți AI](agents.md) | Implementați agenți inteligenți cu instrumente | 45 min |
| 3 | [Implementarea modelului AI](ai-model-deployment.md) | Implementați și configurați modele AI | 30 min |
| 4 | [Laborator workshop AI](ai-workshop-lab.md) | Practic: Pregătiți soluția AI pentru AZD | 60 min |

---

## 🚀 Pornire rapidă

```bash
# Opțiunea 1: Aplicație de chat RAG
azd init --template azure-search-openai-demo
azd up

# Opțiunea 2: Agenți AI
azd init --template get-started-with-ai-agents
azd up

# Opțiunea 3: Aplicație de chat rapidă
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Șabloane AI recomandate

| Template | Descriere | Servicii |
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
| **Anterior** | [Capitolul 1: Fundație](../chapter-01-foundation/README.md) |
| **Următor** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |
| **Sari la** | [Capitolul 8: Modele de producție](../chapter-08-production/README.md) |

---

## 📖 Resurse relevante

- [Depanare AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Practici AI pentru producție](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru orice neînțelegeri sau interpretări eronate care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->