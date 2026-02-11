# 1. Vyberte šablónu

!!! tip "NA KONCI TOHTO MODULU BUDETE VEDIEŤ"

    - [ ] Popísať, čo sú AZD šablóny
    - [ ] Objaviť a používať AZD šablóny pre AI
    - [ ] Začať so šablónou AI Agents
    - [ ] **Lab 1:** AZD Rýchly štart s GitHub Codespaces

---

## 1. Analógia staviteľa

Vytvorenie modernej podnikovej AI aplikácie pripravenéj na produkciu _od začiatku_ môže byť zastrašujúce. Je to trochu ako stavať si nový dom sám, tehla po tehle. Áno, dá sa to urobiť! Ale nie je to najefektívnejší spôsob, ako dosiahnuť požadovaný výsledok! 

Namiesto toho často začíname s existujúcim _návrhovým plánom_ a spolupracujeme s architektom, aby sme ho prispôsobili našim osobným požiadavkám. A presne to je prístup, ktorý treba zvoliť pri budovaní inteligentných aplikácií. Najprv nájdite dobrú architektúru návrhu, ktorá sedí na váš problémový priestor. Potom spolupracujte s architektom riešení, aby ste prispôsobili a vyvinuli riešenie pre váš konkrétny scenár.

Kde však tieto návrhové plány nájdeme? A ako nájsť architekta, ktorý nám ochotne ukáže, ako ich upravovať a nasadzovať sami? V tomto workshope na tieto otázky odpovedáme predstavením troch technológií:

1. [Azure Developer CLI](https://aka.ms/azd) - open-source nástroj, ktorý zrýchľuje cestu vývojára od lokálneho vývoja (build) k nasadeniu v cloude (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - štandardizované open-source repozitáre obsahujúce ukážkový kód, infraštruktúru a konfiguračné súbory pre nasadenie architektúry AI riešenia.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - kódujúci agent založený na znalostiach Azure, ktorý nás môže viesť pri orientácii v kódbáze a vykonávaní zmien pomocou prirodzeného jazyka.

S týmito nástrojmi môžeme teraz _objaviť_ správnu šablónu, _nasadiť_ ju, aby sme overili, že funguje, a _prispôsobiť_ ju podľa našich špecifických scenárov. Poďme na to a naučme sa, ako fungujú.


---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) je open-source nástroj príkazového riadku, ktorý môže zrýchliť vašu cestu od kódu k cloudu s množstvom príkazov priateľských pre vývojárov, ktoré fungujú konzistentne naprieč vaším IDE (vývoj) a CI/CD (devops) prostrediami.

S `azd` môže byť vaša cesta nasadenia taká jednoduchá ako:

- `azd init` - Inicializuje nový AI projekt z existujúcej AZD šablóny.
- `azd up` - Zabezpečí infraštruktúru a nasadí vašu aplikáciu jedným krokom.
- `azd monitor` - Získajte monitorovanie a diagnostiku v reálnom čase pre nasadenú aplikáciu.
- `azd pipeline config` - Nastavte CI/CD pipeline na automatizáciu nasadenia do Azure.

**🎯 | CVIČENIE**: <br/> Preskúmajte nástroj `azd` v prostredí GitHub Codespaces teraz. Začnite zadaním tohto príkazu, aby ste videli, čo nástroj dokáže:

```bash title="" linenums="0"
azd help
```

![Tok](../../../../../translated_images/sk/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD šablóna

Aby `azd` mohol toto dosiahnuť, potrebuje vedieť, akú infraštruktúru má zabezpečiť, aké konfiguračné nastavenia má vynucovať a akú aplikáciu nasadiť. Tu prichádzajú na rad [AZD šablóny](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp). 

AZD šablóny sú open-source repozitáre, ktoré kombinujú ukážkový kód s infraštruktúrnymi a konfiguračnými súbormi potrebnými na nasadenie architektúry riešenia.
Použitím prístupu _Infrastructure-as-Code_ (IaC) umožňujú, aby definície zdrojov šablóny a konfiguračné nastavenia boli verziované (rovnako ako zdrojový kód aplikácie) - čím vytvárajú opakovane použiteľné a konzistentné pracovné postupy pre používateľov projektu.

Pri vytváraní alebo znovupoužití AZD šablóny pre _váš_ scenár zvážte tieto otázky:

1. What are you building? → Existuje šablóna, ktorá obsahuje počiatočný kód pre daný scenár?
1. How is your solution architected? → Existuje šablóna, ktorá má potrebné zdroje?
1. How is your solution deployed? → Pomyslite na `azd deploy` s pred- a post-procesnými hookmi!
1. How can you optimize it further? → Pomyslite na vstavané monitorovanie a automatizované pipeline!

**🎯 | CVIČENIE**: <br/> 
Navštívte galériu [Awesome AZD](https://azure.github.io/awesome-azd/) a použite filtre na preskúmanie viac než 250 dostupných šablón. Pozrite sa, či nájdete tú, ktorá sa hodí k požiadavkám vášho scenára.

![Kód](../../../../../translated_images/sk/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Šablóny AI aplikácií

Pre AI-poháňané aplikácie Microsoft poskytuje špecializované šablóny obsahujúce **Microsoft Foundry** a **Foundry Agents**. Tieto šablóny zrýchľujú vašu cestu k tvorbe inteligentných aplikácií pripravených na produkciu.

### Šablóny Microsoft Foundry & Foundry Agents

Vyberte si nižšie šablónu na nasadenie. Každá šablóna je k dispozícii na [Awesome AZD](https://azure.github.io/awesome-azd/) a môže byť inicializovaná jedným príkazom.

| Šablóna | Popis | Príkaz nasadenia |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Chatovacia aplikácia s Retrieval Augmented Generation využívajúcim Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Vytvorte AI agentov s Foundry Agents pre autonómne vykonávanie úloh | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Koordinujte viaceré Foundry Agents pre zložité pracovné toky | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Extrahujte a analyzujte dokumenty pomocou modelov Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Vytvorte inteligentné chatboty s integráciou Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Generujte obrázky pomocou DALL-E prostredníctvom Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | AI agenti používajúci Semantic Kernel s Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Viacagentové systémy používajúce rámec AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Rýchly štart

1. **Prehliadať šablóny**: Navštívte [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) a filtrovať podľa `AI`, `Agents`, alebo `Microsoft Foundry`
2. **Vyberte šablónu**: Zvoľte tú, ktorá zodpovedá vášmu prípadu použitia
3. **Inicializovať**: Spustite príkaz `azd init` pre vybranú šablónu
4. **Nasadiť**: Spustite `azd up` na zabezpečenie infraštruktúry a nasadenie

**🎯 | CVIČENIE**: <br/>
Vyberte jednu z vyššie uvedených šablón podľa vášho scenára:

- **Budujete chatbota?** → Začnite s **AI Chat with RAG** alebo **Conversational AI Bot**
- **Potrebujete autonómnych agentov?** → Vyskúšajte **Foundry Agent Service Starter** alebo **Multi-Agent Orchestration**
- **Spracúvate dokumenty?** → Použite **AI Document Intelligence**
- **Chcete AI pomoc pri kódovaní?** → Preskúmajte **Semantic Kernel Agent** alebo **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Preskúmajte ďalšie šablóny"
    Galéria [Awesome AZD](https://azure.github.io/awesome-azd/) obsahuje viac než 250 šablón. Použite filtre na nájdenie šablón, ktoré zodpovedajú vašim špecifickým požiadavkám na jazyk, framework a Azure služby.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o vylúčení zodpovednosti:**
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vzniknuté použitím tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->