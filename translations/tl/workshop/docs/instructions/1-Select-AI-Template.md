# 1. Pumili ng Template

!!! tip "SA PAGTATAPOS NG MODULONG ITO MAGAGAWA MO"

    - [ ] Ilarawan kung ano ang mga AZD template
    - [ ] Tuklasin at gamitin ang mga AZD template para sa AI
    - [ ] Magsimula gamit ang template na AI Agents
    - [ ] **Lab 1:** AZD Quickstart sa Codespaces o isang dev container

---

## 1. Isang Analohiya ng Tagabuo

Ang pagbuo ng isang modernong AI application na handa para sa enterprise _mula sa simula_ ay maaaring nakakakaba. Parang pagbuo ng bagong bahay mo nang mag-isa, brick by brick. Oo, magagawa! Ngunit hindi ito ang pinakamabisang paraan upang makamit ang ninanais na resulta!

Sa halip, madalas tayong nagsisimula sa umiiral na _design blueprint_, at nakikipagtulungan sa isang arkitekto upang i-customize ito sa ating mga personal na pangangailangan. At iyan mismo ang paraan na dapat sundan kapag bumubuo ng mga intelligent na aplikasyon. Una, hanapin ang magandang disenyo ng arkitektura na tugma sa iyong problemang saklaw. Pagkatapos, makipagtulungan sa isang arkitekto ng solusyon upang i-customize at paunlarin ang solusyon para sa iyong partikular na senaryo.

Ngunit saan natin mahahanap ang mga design blueprint na ito? At paano tayo makakahanap ng isang arkitekto na handang turuan tayo kung paano i-customize at i-deploy ang mga blueprint na ito nang mag-isa? Sa workshop na ito, sasagutin namin ang mga tanong na iyon sa pamamagitan ng pagpapakilala sa iyo sa tatlong teknolohiya:

1. [Azure Developer CLI](https://aka.ms/azd) - isang open-source na tool na nagpapabilis sa landas ng developer mula sa lokal na pag-develop (build) hanggang sa pag-deploy sa cloud (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - standardized open-source repositories na naglalaman ng sample code, imprastruktura at mga file ng konfigurasyon para sa pag-deploy ng isang AI solution architecture.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - isang coding agent na nakabatay sa kaalaman tungkol sa Azure, na maaaring gumabay sa atin sa pag-navigate sa codebase at paggawa ng mga pagbabago — gamit ang natural na wika.

Sa mga tool na ito, maaari na nating _tuklasin_ ang tamang template, _i-deploy_ ito upang i-validate na gumagana, at _i-customize_ ito upang umangkop sa ating mga partikular na senaryo. Tingnan natin at alamin kung paano ito gumagana.


---

## 2. Azure Developer CLI

Ang [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (o `azd`) ay isang open-source commandline tool na maaaring pabilisin ang iyong code-to-cloud na paglalakbay gamit ang isang hanay ng mga friendly na command para sa developer na gumagana nang pare-pareho sa iyong IDE (development) at CI/CD (devops) na mga environment.

Sa `azd`, ang iyong deployment na paglalakbay ay maaaring maging kasing simple ng:

- `azd init` - Nag-i-initialize ng bagong AI project mula sa umiiral na AZD template.
- `azd up` - Nagpaprovisyon ng imprastruktura at dine-deploy ang iyong aplikasyon sa isang hakbang.
- `azd monitor` - Kumuha ng real-time na monitoring at diagnostics para sa iyong na-deploy na aplikasyon.
- `azd pipeline config` - Mag-set up ng CI/CD pipelines para i-automate ang pag-deploy sa Azure.

**🎯 | EXERCISE**: <br/> Siyasatin ang `azd` commandline tool sa iyong kasalukuyang workshop na kapaligiran ngayon. Maaari itong GitHub Codespaces, isang dev container, o isang lokal na clone na may mga kinakailangang naka-install. Magsimula sa pag-type ng utos na ito upang makita kung ano ang kaya ng tool:

```bash title="" linenums="0"
azd help
```

![Daloy](../../../../../translated_images/tl/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Ang AZD Template

Para magawa ito ng `azd`, kailangan nitong malaman ang imprastruktura na ipaglalaan, ang mga setting ng konfigurasyon na ipatutupad, at ang aplikasyon na ide-deploy. Dito pumapasok ang [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

Ang mga AZD template ay mga open-source na repository na pinagsasama ang sample code kasama ang mga file ng imprastruktura at konfigurasyon na kinakailangan para sa pag-deploy ng solution architecture.
Sa pamamagitan ng paggamit ng isang _Infrastructure-as-Code_ (IaC) na pamamaraan, pinapayagan nila ang mga definition ng resource ng template at mga setting ng konfigurasyon na ma-version-control (tulad ng source code ng app) - lumilikha ng mga reusable at pare-parehong workflow sa mga gumagamit ng proyektong iyon.

Kapag lumilikha o muling gumagamit ng AZD template para sa _iyong_ senaryo, isaalang-alang ang mga sumusunod na tanong:

1. Ano ang binubuo mo? → Mayroon bang template na may starter code para sa senaryong iyon?
1. Paano naka-arkitektura ang iyong solusyon? → Mayroon bang template na may kinakailangang mga resource?
1. Paano dine-deploy ang iyong solusyon? → Isipin ang `azd deploy` na may pre/post-processing hooks!
1. Paano mo pa ito mai-o-optimize? → Isipin ang built-in monitoring at automation pipelines!

**🎯 | EXERCISE**: <br/> 
Bisitahin ang [Awesome AZD](https://azure.github.io/awesome-azd/) gallery at gamitin ang mga filter upang tuklasin ang 250+ na mga template na kasalukuyang magagamit. Tingnan kung makakakita ka ng isa na tumutugma sa _iyong_ mga kinakailangan ng senaryo.

![Kodigo](../../../../../translated_images/tl/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Mga Template ng AI App

Para sa mga AI-powered na aplikasyon, nagbibigay ang Microsoft ng mga espesyal na template na tampok ang **Microsoft Foundry** at **Foundry Agents**. Pinapabilis ng mga template na ito ang iyong landas sa pagbuo ng mga intelligent, production-ready na aplikasyon.

### Microsoft Foundry at Foundry Agents na Mga Template

Pumili ng template sa ibaba upang i-deploy. Bawat template ay magagamit sa [Awesome AZD](https://azure.github.io/awesome-azd/) at maaaring i-initialize gamit ang isang utos.

| Template | Paglalarawan | Deploy Command |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Chat application na gumagamit ng Retrieval Augmented Generation (RAG) at Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Bumuo ng AI agents gamit ang Foundry Agents para sa autonomous na pag-execute ng mga gawain | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Isaayos ang koordinasyon ng maramihang Foundry Agents para sa mga kumplikadong workflow | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Mag-extract at mag-analyze ng mga dokumento gamit ang mga modelo ng Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Bumuo ng mga intelligent na chatbot na may integrasyon sa Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Gumawa ng mga imahe gamit ang DALL-E sa pamamagitan ng Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | AI agents na gumagamit ng Semantic Kernel kasama ang Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Mga multi-agent system na gumagamit ng AutoGen framework | `azd init -t azure-samples/autogen-multi-agent` |

### Mabilis na Pagsisimula

1. **Mag-browse ng mga template**: Bisitahin ang [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) at i-filter ayon sa `AI`, `Agents`, o `Microsoft Foundry`
2. **Piliin ang iyong template**: Pumili ng isa na tumutugma sa iyong kaso ng paggamit
3. **I-initialize**: Patakbuhin ang `azd init` command para sa napili mong template
4. **I-deploy**: Patakbuhin ang `azd up` para mag-provision at mag-deploy

**🎯 | EXERCISE**: <br/>
Pumili ng isa sa mga template sa itaas batay sa iyong senaryo:

- **Bumubuo ng chatbot?** → Magsimula sa **AI Chat with RAG** o **Conversational AI Bot**
- **Kailangan ng autonomous agents?** → Subukan ang **Foundry Agent Service Starter** o **Multi-Agent Orchestration**
- **Naga-process ng mga dokumento?** → Gamitin ang **AI Document Intelligence**
- **Nais ng tulong sa AI coding?** → Tuklasin ang **Semantic Kernel Agent** o **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Tuklasin ang Iba Pang Mga Template"
    Ang [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) ay naglalaman ng 250+ na mga template. Gamitin ang mga filter upang hanapin ang mga template na tumutugma sa iyong mga partikular na kinakailangan para sa wika, framework, at mga serbisyo ng Azure.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI na pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o di-tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng isang taong tagasalin. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->