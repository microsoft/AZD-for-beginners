# 1. Selectați un șablon

!!! tip "LA SFÂRȘITUL ACESTUI MODUL VEȚI FI CAPABIL SĂ"

    - [ ] Descrieți ce sunt șabloanele AZD
    - [ ] Descoperiți și folosiți șabloanele AZD pentru AI
    - [ ] Începeți cu șablonul AI Agents
    - [ ] **Laborator 1:** AZD Quickstart cu GitHub Codespaces

---

## 1. O analogie cu un constructor

Construirea unei aplicații AI moderne, gata pentru întreprindere, _de la zero_ poate fi descurajantă. Este puțin ca și cum ai construi singur casa ta nouă, cărămidă cu cărămidă. Da, se poate face! Dar nu este cea mai eficientă metodă de a obține rezultatul final dorit!

În schimb, de obicei începem cu un _plan de proiectare_ existent și lucrăm cu un arhitect pentru a-l personaliza conform cerințelor noastre personale. Și exact aceasta este abordarea de adoptat când construim aplicații inteligente. Mai întâi, găsiți o arhitectură de proiectare bună care se potrivește domeniului problemei dumneavoastră. Apoi, lucrați cu un arhitect de soluții pentru a personaliza și dezvolta soluția pentru scenariul dvs. specific.

Dar unde putem găsi aceste planuri de proiectare? Și cum găsim un arhitect care este dispus să ne învețe cum să personalizăm și să implementăm aceste planuri pe cont propriu? În acest atelier, răspundem la aceste întrebări prin prezentarea a trei tehnologii:

1. [Azure Developer CLI](https://aka.ms/azd) - un instrument open-source care accelerează traseul dezvoltatorului de la dezvoltarea locală (build) la implementarea în cloud (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - depozite standardizate open-source care conțin cod exemplu, infrastructură și fișiere de configurare pentru implementarea unei arhitecturi soluție AI.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - un agent de coding bazat pe cunoștințele Azure, care ne poate ghida în navigarea bazei de cod și realizarea modificărilor - folosind limbaj natural.

Cu aceste instrumente în mână, putem acum să _descoperim_ șablonul potrivit, să-l _implementăm_ pentru a valida că funcționează și să-l _personalizăm_ pentru a se potrivi scenariilor noastre. Să începem să învățăm cum funcționează acestea.

---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (sau `azd`) este un instrument open-source din linia de comandă care poate accelera traseul cod-la-cloud cu un set de comenzi prietenoase dezvoltatorului care funcționează consecvent atât în mediul IDE (dezvoltare), cât și în mediile CI/CD (devops).

Cu `azd`, drumul dumneavoastră de implementare poate fi la fel de simplu ca:

- `azd init` - Inițiază un nou proiect AI dintr-un șablon AZD existent.
- `azd up` - Provoacă infrastructura și implementează aplicația dvs. într-un singur pas.
- `azd monitor` - Obține monitorizare și diagnosticare în timp real pentru aplicația implementată.
- `azd pipeline config` - Configurează pipeline-uri CI/CD pentru automatizarea implementării în Azure.

**🎯 | EXERCIȚIU**: <br/> Explorați acum instrumentul din linia de comandă `azd` în mediul dvs. GitHub Codespaces. Începeți tastând această comandă pentru a vedea ce poate face acest instrument:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/ro/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Șablonul AZD

Pentru ca `azd` să realizeze acest lucru, trebuie să știe infrastructura de provisionat, setările de configurare de aplicat și aplicația de implementat. Aici intervin [șabloanele AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

Șabloanele AZD sunt depozite open-source care combină codul exemplu cu infrastructura și fișierele de configurare necesare pentru implementarea arhitecturii soluției.  
Folosind o abordare _Infrastructure-as-Code_ (IaC), acestea permit ca definițiile resurselor și setările de configurare să fie controlate în versiuni (la fel ca și codul sursă al aplicației) - creând fluxuri de lucru reutilizabile și consistente între utilizatorii acelui proiect.

Când creați sau reutilizați un șablon AZD pentru _scenariul dvs._, luați în considerare următoarele întrebări:

1. Ce construiți? → Există un șablon care are cod de start pentru acel scenariu?
1. Cum este arhitectată soluția dvs.? → Există un șablon cu resursele necesare?
1. Cum este implementată soluția dvs.? → Gândiți-vă la `azd deploy` cu hook-uri pre/post-procesare!
1. Cum o puteți optimiza și mai mult? → Gândiți-vă la monitorizare încorporată și pipeline-uri de automatizare!

**🎯 | EXERCIȚIU**: <br/>  
Vizitați galeria [Awesome AZD](https://azure.github.io/awesome-azd/) și folosiți filtrele pentru a explora cele peste 250 de șabloane disponibile în prezent. Verificați dacă puteți găsi unul care să corespundă cerințelor _scenariului dvs._

![Code](../../../../../translated_images/ro/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Șabloane pentru Aplicații AI

Pentru aplicațiile alimentate de AI, Microsoft oferă șabloane specializate care includ **Microsoft Foundry** și **Foundry Agents**. Aceste șabloane accelerează drumul dvs. către construirea unor aplicații inteligente, gata pentru producție.

### Șabloane Microsoft Foundry & Foundry Agents

Selectați un șablon de mai jos pentru a-l implementa. Fiecare șablon este disponibil pe [Awesome AZD](https://azure.github.io/awesome-azd/) și poate fi inițializat cu o singură comandă.

| Șablon | Descriere | Comandă de implementare |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Aplicație de chat cu Generare Augmentată prin Recuperare folosind Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Construiește agenți AI cu Foundry Agents pentru execuție autonomă a sarcinilor | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Coordonează mai mulți Foundry Agents pentru fluxuri de lucru complexe | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Extrage și analizează documente folosind modele Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Construiește chatboti inteligenți cu integrare Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Generează imagini folosind DALL-E prin Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Agenți AI folosind Semantic Kernel cu Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Sisteme multi-agent bazate pe cadrul AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Pornire rapidă

1. **Răsfoiți șabloanele**: Vizitați [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) și filtrați după `AI`, `Agents` sau `Microsoft Foundry`
2. **Selectați un șablon**: Alegeți unul care se potrivește cazului dvs. de utilizare
3. **Inițializați**: Rulați comanda `azd init` pentru șablonul ales
4. **Implementați**: Rulați `azd up` pentru a provisiona și implementa

**🎯 | EXERCIȚIU**: <br/>
Selectați unul dintre șabloanele de mai sus în funcție de scenariul dvs.:

- **Construiți un chatbot?** → Începeți cu **AI Chat with RAG** sau **Conversational AI Bot**
- **Aveți nevoie de agenți autonomi?** → Încercați **Foundry Agent Service Starter** sau **Multi-Agent Orchestration**
- **Procesați documente?** → Folosiți **AI Document Intelligence**
- **Doriți asistență AI la codare?** → Explorați **Semantic Kernel Agent** sau **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Explorați mai multe șabloane"
    Galeria [Awesome AZD](https://azure.github.io/awesome-azd/) conține peste 250 de șabloane. Folosiți filtrele pentru a găsi șabloane care se potrivesc cerințelor specifice legate de limbaj, framework și servicii Azure.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să aveți în vedere că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->