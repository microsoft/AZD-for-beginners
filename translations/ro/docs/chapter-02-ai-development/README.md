# Capitolul 2: Dezvoltare AI-First

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 1-2 ore | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol se concentrează pe implementarea aplicațiilor bazate pe AI folosind Azure Developer CLI și serviciile Microsoft Foundry. De la aplicații simple de chat AI până la agenți inteligenți cu unelte.

> **Notă de validare (2026-07-13):** Fluxul de comenzi și ghidul pentru extensii din acest capitol au fost revizuite față de `azd` `1.27.1` și actuala versiune preview a extensiei agentului AI `azure.ai.agents` `1.0.0-beta.5`. Dacă utilizați o versiune mai veche AZD, actualizați mai întâi și apoi continuați cu exercițiile.

## Obiective de învățare

Finalizând acest capitol, vei putea:
- Implementa aplicații AI folosind șabloane AZD predefinite
- Înțelege integrarea Microsoft Foundry cu AZD
- Configura și personaliza agenți AI cu unelte
- Implementa aplicații RAG (Retrieval-Augmented Generation)

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Integrarea Microsoft Foundry](microsoft-foundry-integration.md) | Conectează AZD cu serviciile Foundry | 30 min |
| 2 | [Ghid agenți AI](agents.md) | Implementare agenți inteligenți cu unelte | 45 min |
| 3 | [Implementare modele AI](ai-model-deployment.md) | Implementare și configurare modele AI | 30 min |
| 4 | [Laborator AI Workshop](ai-workshop-lab.md) | Practic: Pregătește soluția AI pentru AZD | 60 min |

---

## 🚀 Început rapid

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

| Șablon | Descriere | Servicii |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG cu citări | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent AI cu unelte | Serviciul Agent AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI de bază | OpenAI + Container Apps |

---

## 💰 Conștientizarea costurilor

| Mediu | Cost lunar estimat |
|-------------|----------------------|
| Dezvoltare | 80-150 $ |
| Pre-producție | 150-300 $ |
| Producție | 300-3,500+ $ |

**Sfat:** Rulează `azd down` după testare pentru a evita costuri suplimentare.

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 1: Bază](../chapter-01-foundation/README.md) |
| **Următor** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |
| **Sari la** | [Capitolul 8: Modele de producție](../chapter-08-production/README.md) |

---

## 📖 Resurse conexe

- [Depanarea AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Practici AI în producție](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->