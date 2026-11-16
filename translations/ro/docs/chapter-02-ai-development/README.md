# Capitolul 2: Dezvoltare AI-First

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 4-5 ore inclusiv atelierul | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol se concentrează pe implementarea aplicațiilor alimentate de AI folosind Azure Developer CLI și serviciile Microsoft Foundry. De la aplicații simple de chat AI la agenți inteligenți cu unelte.

> **Recenzie lansare (2026-11-04):** Ghidul AI CLI a fost verificat în raport cu documentația/sursa publicată `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, și `azure.ai.evaluations` `1.0.0-beta.2`. Folosiți `azd >= 1.37.0` pentru fluxul de lucru combinat. Evaluările folosesc acum namespace separat `azd ai eval`; vezi [schimbările din lansare și ghidul de migrare](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Aceasta nu este o validare de implementare live.

## Obiective de învățare

Parcurgând acest capitol, vei:
- Implementa aplicații AI folosind șabloane AZD predefinite
- Înțelege integrarea Microsoft Foundry cu AZD
- Configura și personaliza agenți AI cu unelte
- Implementa aplicații RAG (Generare augmentată prin recuperare)

---

## 📚 Lecții

| # | Lecție | Descriere | Durată |
|---|--------|-------------|------|
| 1 | [Integrare Microsoft Foundry](microsoft-foundry-integration.md) | Conectează AZD cu serviciile Foundry | 30 min |
| 2 | [Ghid Agenți AI](agents.md) | Implementarea agenților inteligenți cu unelte | 45 min |
| 3 | [Implementare Model AI](ai-model-deployment.md) | Implementare și configurare modele AI | 30 min |
| 4 | [Atelier AI](ai-workshop-lab.md) | Practic: Explorează un șablon și planifică conversia ta | 2-3 ore |

---

## 🚀 Pornire rapidă

Alege o opțiune într-un director nou și gol. `.` de la final inițializează directorul curent; în caz contrar AZD poate crea un subdirector fără a schimba directorul curent în shell-ul tău.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Șabloane AI recomandate

| Șablon | Descriere | Servicii |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG cu citări | OpenAI + Căutare AI |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent AI cu unelte | Serviciu Agent AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI de bază | OpenAI + Container Apps |

---

## 💰 Conștientizare a costurilor

Acestea sunt intervale ilustrative, nu oferte sau plafoane; traficul modelului, SKU-urile Search/compute, regiunea și opțiunile suplimentare pot depăși aceste valori. Consultă ghidul de prețuri curent al eșantionului ales înainte de aprovizionare.

| Mediu | Cost lunar estimat |
|-------------|----------------------|
| Dezvoltare | $80-150 |
| Staging | $150-300 |
| Producție | $300-3,500+ |

**Sfat:** Rulează `azd down` după testare pentru a evita taxe.

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 1: Fundație](../chapter-01-foundation/README.md) |
| **Următor** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |
| **Sari la** | [Capitolul 8: Modele de producție](../chapter-08-production/README.md) |

---

## 📖 Resurse conexe

- [Depanare AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Practici AI de producție](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->