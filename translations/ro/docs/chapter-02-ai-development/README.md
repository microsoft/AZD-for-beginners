# Capitolul 2: Dezvoltare AI-First

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 4-5 ore inclusiv atelierul | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol se concentrează pe implementarea aplicațiilor alimentate de AI folosind Azure Developer CLI și serviciile Microsoft Foundry. De la aplicații simple de chat AI la agenți inteligenți cu instrumente.

> **Actualizare Foundry GA (2026-11-09):** Pachetul `microsoft.foundry` 1.0 este [disponibil general](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Folosiți `azd >= 1.37.0`; evaluările rămân o instalare separată. [Tutorialul agentului găzduit](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) acoperă testarea Inspectorului Agent local și implementarea codului de la distanță. Aceasta este o revizuire a documentației, nu o validare a implementării live; funcțiile de previzualizare opționale își păstrează propriul statut.

## Obiective de Învățare

Finalizând acest capitol, vei:
- Implementa aplicații AI folosind șabloane AZD predefinite
- Înțelege integrarea Microsoft Foundry cu AZD
- Instala pachetul GA și testează un agent găzduit local înainte de a implementa sursa sa în Foundry
- Revizuiește `azure.yaml`, resursele de evaluare și curățarea proiectelor noi versus reutilizate
- Configurează și personalizează agenți AI cu instrumente
- Implementează aplicații RAG (Generare augmentată prin recuperare)

---

## 📚 Lecții

| # | Lecție | Descriere | Durată |
|---|--------|-------------|------|
| 1 | [Integrarea Microsoft Foundry](microsoft-foundry-integration.md) | Pachet GA, flux de lucru agent găzduit local-în-cloud și evaluări | 60 min |
| 2 | [Ghid pentru Agenți AI](agents.md) | Implementarea agenților inteligenți cu instrumente | 45 min |
| 3 | [Implementarea Modelului AI](ai-model-deployment.md) | Implementarea și configurarea modelelor AI | 30 min |
| 4 | [Atelier AI Laborator](ai-workshop-lab.md) | Practic: Explorează un șablon și planifică conversia ta | 2-3 ore |

---

## 🚀 Pornire Rapidă

Alege o opțiune într-un director nou gol. `.` la sfârșit inițializează directorul curent; altfel AZD poate crea un subdirector fără a schimba directorul de lucru al shell-ului tău.

Pentru **calea de implementare a codului agentului găzduit GA**, începe cu [tutorialul ghidat](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Necesită AZD 1.37.0+, uv curent, Python 3.13+, permisiuni Foundry și cotă de modele. Șabloanele complete de aplicații de mai jos sunt alternative, nu prerechizite pentru acel tutorial.

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

## 🤖 Șabloane AI Recomandate

| Șablon | Descriere | Servicii |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG cu citări | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent AI cu instrumente | Serviciul Agent AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI de bază | OpenAI + Container Apps |

---

## 💰 Conștientizarea Costurilor

Acestea sunt intervale ilustrative, nu cotații sau limite; traficul modelului, SKU-urile de căutare/calcul, regiunea și funcțiile opționale pot depăși aceste valori. Consultă sfaturile actuale de preț pentru exemplul ales înainte de aprovizionare.

| Mediu | Cost Lunar Estimat |
|-------------|----------------------|
| Dezvoltare | 80-150 $ |
| Staging | 150-300 $ |
| Producție | 300-3.500+ $ |

**Curățare:** Revizuiește `azd down` înainte de confirmare: pentru un proiect Foundry nou creat șterge grupul de resurse și tot ce conține. Pentru un proiect Foundry reutilizat, păstrează resursele proiectului și ale agentului; urmează [instrucțiunile de curățare din tutorial](microsoft-foundry-integration.md#7-clean-up-deliberately) pentru a elimina resursele nedorite separat.

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 1: Fundament](../chapter-01-foundation/README.md) |
| **Următor** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |
| **Salt la** | [Capitolul 8: Modele de Producție](../chapter-08-production/README.md) |

---

## 📖 Resurse Aflate în Legătură

- [Depanare AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Practici AI pentru Producție](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->