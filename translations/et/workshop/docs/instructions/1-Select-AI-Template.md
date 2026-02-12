# 1. Valige mall

!!! tip "SELLE MÕÕDU LÕPUS OLETE VÕIMELINE"

    - [ ] Kirjeldama, mis on AZD mallid
    - [ ] Avastama ja kasutama AZD malle tehisintellekti jaoks
    - [ ] Alustama AI Agents malliga
    - [ ] **Lab 1:** AZD kiire algus GitHub Codespaces keskkonnas

---

## 1. Ehitusmehe analoogia

Tänapäevase, ettevõttele valmis AI-rakenduse ehitamine _algusest peale_ võib olla hirmutav. See on natuke nagu oma uut kodu telliskivi haaval ise ehitamine. Jah, see on võimalik! Kuid see pole kõige tõhusam viis soovitud lõpptulemuse saavutamiseks!

Selle asemel alustame sageli olemasoleva _disainiplaaniga_ ja töötame arhitektiga selle isikupärastamiseks vastavalt oma vajadustele. Ja just sellist lähenemist tuleks intelligentsete rakenduste loomisel kasutada. Esmalt leidke sobiv disaini arhitektuur, mis sobib teie probleemivaldkonnaga. Seejärel tehke koostööd lahenduse arhitektiga, et kohandada ja arendada lahendus teie konkreetseks stsenaariumiks.

Aga kust me saame neid disainiplaane? Ja kuidas leida arhitekt, kes on valmis õpetama, kuidas neid plaane iseseisvalt kohandada ja juurutada? Selles töötubades vastame nendele küsimustele, tutvustades teile kolme tehnoloogiat:

1. [Azure Developer CLI](https://aka.ms/azd) - avatud lähtekoodiga tööriist, mis kiirendab arendaja teekonda kohalikust arendusest (build) pilve juurutamiseni (ship).
1. [Microsoft Foundry mallid](https://ai.azure.com/templates) - standardiseeritud avatud lähtekoodiga hoidlad, mis sisaldavad näidiskoodi, infrastruktuuri ja konfiguratsioonifaile AI lahenduse arhitektuuri juurutamiseks.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - Azure teadmistega kodeerimisagent, kes saab juhendada meid koodibaasi navigeerimisel ja muudatuste tegemisel - loomulikus keeles.

Nende tööriistadega käes saame nüüd _avastada_ õige malli, _juurutada_ selle, et kinnitada selle toimivus, ja _kohandada_ seda vastavalt oma konkreetsele stsenaariumile. Sukeldume ja õpime, kuidas need töötavad.

---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (või `azd`) on avatud lähtekoodiga käsurea tööriist, mis võib kiirendada teie koodi-pilve teekonda arendajasõbralike käskude komplektiga, mis toimivad järjepidevalt teie IDEs (arenduskeskkonnas) ja CI/CD (devops) keskkondades.

`azd`-ga võib teie juurutamise teekond olla nii lihtne:

- `azd init` - Initsialiseerib uue AI projekti olemasolevast AZD mallist.
- `azd up` - Provisioneerib infrastruktuuri ja juurutab teie rakenduse ühe sammuga.
- `azd monitor` - Saab reaalajas jälgimist ja diagnostikat teie juurutatud rakendusele.
- `azd pipeline config` - Seadistab CI/CD torustikud automaatseks juurutamiseks Azure'is.

**🎯 | HARJUTUS**: <br/> Avage nüüd oma GitHub Codespaces keskkonnas `azd` käsurea tööriista. Alustage selle käsu sisestamisest, et näha, mida tööriist teha suudab:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/et/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD mall

Selleks, et `azd` saaks seda teha, peab ta teadma infrastruktuuri, mida provisioneerida, konfiguratsiooni seadeid, mida rakendada, ja rakendust, mida juurutada. Siin tulevadki mängu [AZD mallid](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

AZD mallid on avatud lähtekoodiga hoidlad, mis ühendavad näidiskoodi infrastruktuuri ja konfiguratsioonifailidega, mis on vajalikud lahendusarhitektuuri juurutamiseks.
Kasutades _Infrastructure-as-Code_ (IaC) lähenemist, võimaldavad mallis määratletud ressursid ja konfiguratsiooniseaded olla versioonihalduses (nagu ka rakenduse lähtekood) - luues korduvkasutatavaid ja järjepidevaid töövooge projekti kasutajate vahel.

Kui loote või kasutate AZD malli _oma_ stsenaariumi jaoks, mõelge nendele küsimustele:

1. Mida te ehitate? → Kas on olemas mall, mis sisaldab sellele stsenaariumile alguskoodi?
1. Kuidas on teie lahendus arhitektuuriliselt üles ehitatud? → Kas on olemas mall, milles on vajalikud ressursid?
1. Kuidas juurutatakse teie lahendus? → Mõelge `azd deploy` käsule koos eelsalvestuse/jälgitöödega!
1. Kuidas saate seda veelgi optimeerida? → Mõelge sisseehitatud jälgimisele ja automatiseeritud torustikele!

**🎯 | HARJUTUS**: <br/>
Külastage [Awesome AZD](https://azure.github.io/awesome-azd/) galeriid ja kasutage filtreid, et uurida üle 250 kujunduse malli, mis on praegu saadaval. Vaadake, kas leiate ühe, mis vastab teie stsenaariumi nõuetele.

![Code](../../../../../translated_images/et/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI rakenduse mallid

Tehisintellekti jõuliste rakenduste jaoks pakub Microsoft spetsiaalseid malle, mille hulka kuuluvad **Microsoft Foundry** ja **Foundry Agents**. Need mallid kiirendavad teie teekonda intelligentsete, tootmiseks valmis rakenduste ehitamisel.

### Microsoft Foundry & Foundry Agents mallid

Valige allolevast malli deployimiseks. Iga mall on saadaval [Awesome AZD](https://azure.github.io/awesome-azd/) keskkonnas ja seda saab initsialiseerida ühe käsuga.

| Mall | Kirjeldus | Juurutuskäsk |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Vestlusrakendus, mis kasutab Microsoft Foundry Retrieval Augmented Generationit | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Ehita tehisintellekti agente Foundry Agentitega autonoomsete ülesannete täitmiseks | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Koordineeri mitut Foundry agenti keerukate tööprotsesside jaoks | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Eemalda ja analüüsi dokumente Microsoft Foundry mudelite abil | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Ehita intelligentseid vestlusbote Microsoft Foundry integreerimisega | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Loo pilte DALL-E abil Microsoft Foundry kaudu | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Tehisintellekti agentide kasutamine Semantic Kerneliga Foundry Agentide abil | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Mitme agendi süsteemid AutoGen raamistikuga | `azd init -t azure-samples/autogen-multi-agent` |

### Kiire algus

1. **Sirvige malle**: Külastage [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) ja filtreerige `AI`, `Agents` või `Microsoft Foundry` järgi
2. **Valige oma mall**: Valige sobiv vastavalt oma kasutusjuhule
3. **Initsialiseeri**: Käivitage oma valitud malli jaoks `azd init` käsk
4. **Juurutage**: Käivitage `azd up`, et provisioneerida ja juurutada

**🎯 | HARJUTUS**: <br/>
Valige ülaltoodud mallidest üks vastavalt oma stsenaariumile:

- **Chatboti ehitamine?** → Alustage **AI Chat with RAG** või **Conversational AI Bot**-iga
- **Vajate autonoomseid agente?** → Proovige **Foundry Agent Service Starter** või **Multi-Agent Orchestration**
- **Dokumentide töötlemine?** → Kasutage **AI Document Intelligence**
- **Tahate AI abiga kodeerimist?** → Avastage **Semantic Kernel Agent** või **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Avastage rohkem malle"
    [Awesome AZD galeriis](https://azure.github.io/awesome-azd/) on üle 250 mallide. Kasutage filtreid, et leida malle, mis vastavad teie spetsiifilistele keele-, raamistiku- ja Azure teenuste nõuetele.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi me püüdleme täpsuse poole, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Tähtsa teabe puhul on soovitatav kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->