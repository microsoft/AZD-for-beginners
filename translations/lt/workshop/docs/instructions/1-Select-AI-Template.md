# 1. Pasirinkite šabloną

!!! tip "BAIGĘ ŠĮ MODULĮ GALĖSITE"

    - [ ] Apibūdinti, kas yra AZD šablonai
    - [ ] Atrasti ir naudoti AZD šablonus AI
    - [ ] Pradėti su AI Agents šablonu
    - [ ] **Laboratorija 1:** AZD greitas startas su GitHub Codespaces

---

## 1. Statytojo analogija

Sukurti modernią, įmonėms pritaikytą AI programėlę _nuo nulio_ gali būti baugu. Tai šiek tiek panašu į nuosavo namo statybą plyta po plytos. Taip, tai įmanoma! Bet tai nėra efektyviausias būdas pasiekti norimą rezultatą! 

Vietoje to dažnai pradedame nuo esamo _dizaino plano_ ir dirbame su architektu, kad pritaikytume jį prie savo reikalavimų. Ir būtent toks požiūris turėtų būti taikomas kuriant išmaniąsias programas. Pirmiausia raskite gerą dizaino architektūrą, tinkamą jūsų problemos sričiai. Tada dirbkite su sprendimų architektu, kad pritaikytumėte ir sukurtumėte sprendimą konkrečiam scenarijui.

Bet kur galime rasti šiuos dizaino planus? Ir kaip rasti architektą, kuris norėtų išmokyti mus, kaip pritaikyti ir įdiegti šiuos planus savarankiškai? Šiame dirbtuvėje mes atsakome į šiuos klausimus pristatydami tris technologijas:

1. [Azure Developer CLI](https://aka.ms/azd) - atviro kodo įrankis, pagreitinantis kūrėjo kelią nuo vietinio vystymo (build) iki diegimo į debesį (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - standartizuotos atviro kodo saugyklos, kuriose yra pavyzdinis kodas, infrastruktūros ir konfigūracijos failai AI sprendimo architektūros diegimui.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - programavimo agentas, pagrįstas Azure žiniomis, galintis mus nukreipti naršant kodo bazę ir atliekant pakeitimus natūralia kalba.

Turėdami šiuos įrankius galime _atrasti_ tinkamą šabloną, _įdiegti_ jį, kad patvirtintume, jog jis veikia, ir _pritaikyti_ jį savo konkrečioms scenarijoms. Panagrinėkime ir sužinokime, kaip tai veikia.


---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) is an open-source commandline tool that can speed up your code-to-cloud journey with a set of developer-friendly commands that work consistently across your IDE (development) and CI/CD (devops) environments.

With `azd`, your deployment journey can be as simple as:

- `azd init` - Inicializuoja naują AI projektą iš esamo AZD šablono.
- `azd up` - Paruošia infrastruktūrą ir vienu žingsniu įdiegia jūsų programą.
- `azd monitor` - Gaukite realaus laiko stebėjimą ir diagnostiką savo įdiegtai programai.
- `azd pipeline config` - Sukonfigūruokite CI/CD paleidimo schemas, kad automatizuotumėte diegimą į Azure.

**🎯 | UŽDUOTIS**: <br/> Išbandykite `azd` komandinės eilutės įrankį savo GitHub Codespaces aplinkoje dabar. Pradėkite įvesdami šią komandą, kad pamatytumėte, ką įrankis gali:

```bash title="" linenums="0"
azd help
```

![Srautas](../../../../../translated_images/lt/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD šablonas

For `azd` to achieve this, it needs to know the infrastructure to provision, the configuration settings to enforce, and the application to deploy. This is where [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) come in. 

AZD šablonai yra atviro kodo saugyklos, kurios apjungia pavyzdinį kodą su infrastruktūros ir konfigūracijos failais, reikalingais sprendimo architektūros diegimui.
Naudodami _Infrastructure-as-Code_ (IaC) požiūrį, jie leidžia šablono resursų apibrėžimams ir konfigūracijos nustatymams būti valdomiems versijų valdymo (kaip ir programos šaltinio kodas) - taip sukuriant pakartotinai naudojamus ir nuoseklius darbo procesus projekto vartotojams.

Kuriant arba naudojant AZD šabloną _jūsų_ scenarijui, apsvarstykite šiuos klausimus:

1. Ką statote? → Ar yra šablonas, turintis pradžios kodą tokiam scenarijui?
1. Kaip suprojektuotas jūsų sprendimas? → Ar yra šablonas, turintis reikiamus resursus?
1. Kaip diegiamas jūsų sprendimas? → Pagalvokite apie `azd deploy` su prieš/dėmesio apdorojimo kabliukais!
1. Kaip galite tai toliau optimizuoti? → Pagalvokite apie integruotą stebėjimą ir automatizavimo pipelines!

**🎯 | UŽDUOTIS**: <br/> 
Apsilankykite [Awesome AZD](https://azure.github.io/awesome-azd/) galerijoje ir naudokite filtrus, kad išnaršytumėte daugiau nei 250 šablonų, kurie šiuo metu yra prieinami. Pažiūrėkite, ar rasite tokį, kuris atitinka _jūsų_ scenarijaus reikalavimus.

![Kodas](../../../../../translated_images/lt/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI programų šablonai

For AI-powered applications, Microsoft provides specialized templates featuring **Microsoft Foundry** and **Foundry Agents**. These templates accelerate your path to building intelligent, production-ready applications.

### Microsoft Foundry & Foundry Agents šablonai

Pasirinkite žemiau esantį šabloną diegimui. Kiekvienas šablonas yra prieinamas [Awesome AZD](https://azure.github.io/awesome-azd/) ir gali būti inicializuotas viena komanda.

| Template | Description | Deploy Command |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Pokalbių programa su Retrieval Augmented Generation (RAG), naudojant Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Kurkite AI agentus su Foundry Agents autonominiam užduočių vykdymui | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Koordinuokite kelis Foundry Agents sudėtingiems darbo srautams | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Išgaukite ir analizuokite dokumentus su Microsoft Foundry modeliais | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Kurti išmanius pokalbių robotus su Microsoft Foundry integracija | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Generuokite vaizdus naudodami DALL-E per Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | AI agentai, naudojant Semantic Kernel kartu su Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Daugiagentės sistemos, naudojančios AutoGen karkasą | `azd init -t azure-samples/autogen-multi-agent` |

### Greitas startas

1. **Naršykite šablonus**: Apsilankykite [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) ir filtruokite pagal `AI`, `Agents` arba `Microsoft Foundry`
2. **Pasirinkite šabloną**: Išsirinkite tą, kuris atitinka jūsų naudojimo atvejį
3. **Inicializuokite**: Paleiskite `azd init` komandą pasirinktam šablonui
4. **Įdiekite**: Paleiskite `azd up`, kad paruoštumėte infrastruktūrą ir įdiegtumėte

**🎯 | UŽDUOTIS**: <br/>
Pasirinkite vieną iš aukščiau pateiktų šablonų pagal jūsų scenarijų:

- **Kuriate pokalbių robotą?** → Pradėkite su **AI Chat with RAG** arba **Conversational AI Bot**
- **Reikia autonominių agentų?** → Išbandykite **Foundry Agent Service Starter** arba **Multi-Agent Orchestration**
- **Apdorojate dokumentus?** → Naudokite **AI Document Intelligence**
- **Reikia AI pagalbos programuojant?** → Naršykite **Semantic Kernel Agent** arba **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Atraskite daugiau šablonų"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) contains 250+ templates. Use the filters to find templates matching your specific requirements for language, framework, and Azure services.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl kritinės informacijos rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kilusius naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->