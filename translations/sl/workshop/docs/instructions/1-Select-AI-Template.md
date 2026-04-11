# 1. Izberite predlogo

!!! tip "NA KONEC TEGA MODULA BOSTE ZMOGLI"

    - [ ] Opisati, kaj so predloge AZD
    - [ ] Odkrijte in uporabite predloge AZD za AI
    - [ ] Začnite s predlogo AI Agents
    - [ ] **Lab 1:** AZD hitri začetek v Codespaces ali razvojnem vsebniku

---

## 1. Prispodoba graditelja

Izdelava sodobne, za podjetja primerne AI aplikacije _od začetka_ je lahko zastrašujoča. Malce je kot graditi svoj nov dom sami, opeko za opeko. Da, to je mogoče! Vendar to ni najučinkovitejši način za dosego želenega končnega rezultata! 

Namesto tega pogosto začnemo z obstoječim _načrtom zasnove_ in sodelujemo z arhitektom, da ga prilagodimo našim osebnim zahtevam. In prav to je pristop, ki ga je treba uporabiti pri gradnji inteligentnih aplikacij. Najprej poiščite dobro arhitekturo zasnove, ki ustreza vašemu področju problema. Nato sodelujte z arhitektom rešitve, da prilagodite in razvijete rešitev za vaš specifičen scenarij.

Ampak kje najti te načrte zasnove? In kako najti arhitekta, ki je pripravljen naučiti nas, kako prilagoditi in razmestiti te načrte sami? V tej delavnici bomo odgovorili na ta vprašanja s predstavitvijo treh tehnologij:

1. [Azure Developer CLI](https://aka.ms/azd) - odprtokodno orodje, ki pospešuje pot razvijalca od lokalnega razvoja (build) do uvajanja v oblak (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - standardizirani repozitoriji odprte kode, ki vsebujejo vzorčno kodo, infrastrukturo in konfiguracijske datoteke za nameščanje arhitekture AI rešitve.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - agent za kodiranje, utemeljen na znanju Azure, ki nas lahko vodi pri navigaciji po izvorni kodi in pri izvajanju sprememb z uporabo naravnega jezika.

Z orodji v roki lahko zdaj _poiščemo_ pravo predlogo, jo _razmestimo_, da preverimo, če deluje, in jo _prilagodimo_, da ustreza našim specifičnim scenarijem. Poglobimo se in izvedimo, kako delujejo.


---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) je odprtokodno orodje ukazne vrstice, ki lahko pohitri vašo pot od kode do oblaka z naborom ukazov, prijaznih razvijalcem, ki delujejo dosledno v vašem IDE (razvoj) in CI/CD (devops) okoljih.

With `azd`, your deployment journey can be as simple as:

- `azd init` - Inicializira nov AI projekt iz obstoječe AZD predloge.
- `azd up` - Ustvari infrastrukturo in v enem koraku razmestite vašo aplikacijo.
- `azd monitor` - Pridobite spremljanje v realnem času in diagnostiko za vašo razmeščeno aplikacijo.
- `azd pipeline config` - Nastavite CI/CD cevovode za avtomatizacijo razmestitve v Azure.

**🎯 | VAJA**: <br/> Raziščite orodje ukazne vrstice `azd` v vašem trenutnem delavnem okolju delavnice zdaj. To je lahko GitHub Codespaces, dev container ali lokalni klon z nameščenimi predpogoji. Začnite tako, da vtipkate ta ukaz in si ogledate, kaj orodje zmore:

```bash title="" linenums="0"
azd help
```

![Potek](../../../../../translated_images/sl/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Predloga AZD

Za to, da `azd` lahko to doseže, mora poznati infrastrukturo za zagotavljanje, konfiguracijske nastavitve, ki jih je treba uveljaviti, in aplikacijo, ki jo je treba razmestiti. Tu pridejo v poštev [AZD predloge](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp). 

AZD predloge so odprtokodni repozitoriji, ki združujejo vzorčno kodo z datotekami infrastrukture in konfiguracije, potrebnimi za razmestitev arhitekture rešitve.
Z uporabo pristopa _Infrastruktura kot koda_ (IaC) omogočajo, da so definicije virov predloge in konfiguracijske nastavitve vodene z različicami (tako kot izvorna koda aplikacije) - kar ustvarja ponovno uporabne in dosledne delovne tokove za uporabnike tega projekta.

Ko ustvarjate ali ponovno uporabljate AZD predlogo za _vaš_ scenarij, razmislite o teh vprašanjih:

1. Kaj gradite? → Ali obstaja predloga, ki ima začetno kodo za ta scenarij?
1. Kako je vaša rešitev arhitektirana? → Ali obstaja predloga, ki ima potrebne vire?
1. Kako je vaša rešitev razmeščena? → Pomislite na `azd deploy` s pred- in post-obdelavnimi kljukami!
1. Kako jo lahko še optimizirate? → Pomislite na vgrajeno spremljanje in avtomatizirane cevovode!

**🎯 | VAJA**: <br/> 
Obiščite galerijo [Awesome AZD](https://azure.github.io/awesome-azd/) in uporabite filtre za raziskovanje več kot 250 predlog, ki so trenutno na voljo. Preverite, ali lahko najdete tisto, ki ustreza vašim zahtevam scenarija.

![Koda](../../../../../translated_images/sl/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Predloge za AI aplikacije

Za aplikacije, podprte z AI, Microsoft nudi specializirane predloge z **Microsoft Foundry** in **Foundry Agents**. Te predloge pospešijo vašo pot do gradnje inteligentnih, za produkcijo pripravljenih aplikacij.

### Microsoft Foundry & Foundry Agents Templates

Izberite predlogo spodaj za razmestitev. Vsaka predloga je na voljo na [Awesome AZD](https://azure.github.io/awesome-azd/) in jo je mogoče inicializirati z enim ukazom.

| Predloga | Opis | Ukaz za namestitev |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Klepetalna aplikacija z Retrieval Augmented Generation (RAG) z uporabo Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Ustvarite AI agente z Foundry Agents za avtonomno izvrševanje nalog | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Koordinacija več Foundry Agentov za kompleksne delovne tokove | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Izvleček in analiza dokumentov z modeli Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Ustvarite inteligentne klepetalne bote z integracijo Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Ustvarite slike z DALL-E prek Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | AI agenti, ki uporabljajo Semantic Kernel s Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Sistemi z več agenti, ki uporabljajo okvir AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Hitri začetek

1. **Brskaj po predlogah**: Obiščite [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) in filtrirajte po `AI`, `Agents` ali `Microsoft Foundry`
2. **Izberite predlogo**: Izberite tisto, ki se ujema z vašim primerom uporabe
3. **Inicializirajte**: Zaženite ukaz `azd init` za izbrano predlogo
4. **Razmestite**: Zaženite `azd up`, da zagotovite infrastrukturo in razmestite aplikacijo

**🎯 | VAJA**: <br/>
Izberite eno izmed zgornjih predlog glede na vaš scenarij:

- **Gradite klepetalnega bota?** → Začnite z **AI Chat with RAG** ali **Conversational AI Bot**
- **Potrebujete avtonomne agente?** → Poskusite **Foundry Agent Service Starter** ali **Multi-Agent Orchestration**
- **Obdelujete dokumente?** → Uporabite **AI Document Intelligence**
- **Želite AI pomoč pri kodiranju?** → Raziščite **Semantic Kernel Agent** ali **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Raziščite več predlog"
    Galerija [Awesome AZD](https://azure.github.io/awesome-azd/) vsebuje več kot 250 predlog. Uporabite filtre, da najdete predloge, ki ustrezajo vašim specifičnim zahtevam glede jezika, ogrodja in Azure storitev.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, prosimo upoštevajte, da avtomatski prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije priporočamo profesionalen človeški prevod. Ne odgovarjamo za kakršnekoli nesporazume ali napačne razlage, ki bi izhajale iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->