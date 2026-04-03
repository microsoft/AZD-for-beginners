# 1. Vyberte šablonu

!!! tip "NA KONCI TOHOTO MODULU BUDETE UMĚT"

    - [ ] Popsat, co jsou šablony AZD
    - [ ] Objevovat a používat šablony AZD pro AI
    - [ ] Začít s šablonou AI Agents
    - [ ] **Cvičení 1:** Rychlý start s AZD v Codespaces nebo vývojovém kontejneru

---

## 1. Příklad z budovatelského světa

Postavit moderní podnikové AI aplikaci _od nuly_ může být náročné. Je to trochu jako stavět si nový dům sami, cihlu po cihle. Ano, jde to! Ale není to nejefektivnější způsob, jak dosáhnout požadovaného výsledku! 

Místo toho často začínáme s existujícím _projektovým plánem_ a spolupracujeme s architektem na jeho přizpůsobení našim osobním požadavkům. A přesně takový přístup byste měli zvolit při budování inteligentních aplikací. Nejprve najděte dobrou designovou architekturu, která odpovídá vašemu problému. Poté spolupracujte s řešitelským architektem, aby vám přizpůsobil a vyvinul řešení pro váš konkrétní scénář.

Ale kde tyto projektové plány najít? A jak najít architekta, který vás naučí, jak tyto plány přizpůsobit a nasadit sami? Na tomto workshopu na tyto otázky odpovíme tím, že vám představíme tři technologie:

1. [Azure Developer CLI](https://aka.ms/azd) - open-source nástroj, který urychluje cestu vývojáře od lokálního vývoje (build) po nasazení do cloudu (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - standardizované open-source repozitáře obsahující ukázkové kódy, infrastrukturu a konfigurační soubory pro nasazení architektury AI řešení.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - kódovací agent založený na znalostech Azure, který nás může vést při orientaci v kódu a provádění změn – pomocí přirozeného jazyka.

S těmito nástroji v ruce nyní můžeme _objevit_ správnou šablonu, _nasadit_ ji a ověřit, že funguje, a _přizpůsobit_ ji tak, aby vyhovovala našim konkrétním scénářům. Pojďme na to a naučme se, jak tyto nástroje fungují.


---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (nebo `azd`) je open-source příkazový nástroj, který může urychlit vaši cestu od kódu k nasazení v cloudu pomocí sady uživatelsky přívětivých příkazů, které fungují konzistentně v rámci vašeho IDE (vývoj) i CI/CD (devops) prostředí.

S `azd` může být vaše cesta nasazení tak jednoduchá jako:

- `azd init` - Inicializuje nový AI projekt z existující AZD šablony.
- `azd up` - Provede provisioning infrastruktury a nasazení aplikace v jednom kroku.
- `azd monitor` - Získá monitoring a diagnostiku v reálném čase pro nasazenou aplikaci.
- `azd pipeline config` - Nastaví CI/CD pipeline pro automatizaci nasazení do Azure.

**🎯 | CVIČENÍ**: <br/> Prozkoumejte nyní příkazový nástroj `azd` ve vašem aktuálním workshopovém prostředí. Může to být GitHub Codespaces, vývojový kontejner nebo lokální klon s nainstalovanými předpoklady. Začněte zadáním tohoto příkazu a zjistěte, co nástroj umí:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/cs/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Šablona AZD

Aby mohl `azd` fungovat, potřebuje znát infrastrukturu k vytvoření, konfigurační nastavení a aplikaci k nasazení. A právě zde přicházejí na řadu [šablony AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

Šablony AZD jsou open-source repozitáře, které kombinují ukázkový kód s infrastrukturou a konfiguračními soubory potřebnými k nasazení architektury řešení.
Díky přístupu _Infrastructure-as-Code_ (IaC) umožňují definice zdrojů a konfigurační nastavení ve šabloně být verzovány (stejně jako zdrojový kód aplikace) - což vytváří znovupoužitelné a konzistentní workflow mezi uživateli projektu.

Při vytváření nebo opětovném použití šablony AZD pro _váš_ scénář zvažte tyto otázky:

1. Co stavíte? → Existuje šablona, která má startovací kód pro tento scénář?
1. Jak je vaše řešení navrženo? → Existuje šablona, která obsahuje potřebné zdroje?
1. Jak je řešení nasazeno? → Myslete na `azd deploy` s před- a po-zpracovatelskými hooky!
1. Jak to můžete dále optimalizovat? → Myslete na vestavěné monitorování a automatizační pipeline!

**🎯 | CVIČENÍ**: <br/> 
Navštivte galerii [Awesome AZD](https://azure.github.io/awesome-azd/) a použijte filtry prozkoumat více než 250 dostupných šablon. Zjistěte, zda některá odpovídá požadavkům _vašeho_ scénáře.

![Code](../../../../../translated_images/cs/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Šablony AI aplikací

Pro aplikace poháněné AI poskytuje Microsoft specializované šablony s **Microsoft Foundry** a **Foundry Agents**. Tyto šablony zrychlují vaši cestu k tvorbě inteligentních, produkčně připravených aplikací.

### Microsoft Foundry & Foundry Agents šablony

Vyberte níže šablonu k nasazení. Každá šablona je dostupná na [Awesome AZD](https://azure.github.io/awesome-azd/) a může být inicializována jediným příkazem.

| Šablona | Popis | Příkaz k nasazení |
|----------|-------------|----------------|
| **[AI Chat s RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Chatovací aplikace s Retrieval Augmented Generation pomocí Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Vytvářejte AI agenty s Foundry Agents pro autonomní vykonávání úkolů | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Koordinace Multi-Agentů](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Koordinujte více Foundry Agentů pro složité workflow | `azd init -t azure-samples/multi-agent-orchestration` |
| **[Inteligence z dokumentů AI](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Extrahujte a analyzujte dokumenty pomocí modelů Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Konverzační AI bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Vytvářejte inteligentní chatboty s integrací Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[Generování AI obrázků](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Generujte obrázky pomocí DALL-E přes Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Agent Semantic Kernel](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | AI agenti využívající Semantic Kernel s Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Multi-agentní systémy využívající framework AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Rychlý start

1. **Prohlížejte šablony**: Navštivte [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) a filtrovat podle `AI`, `Agents` nebo `Microsoft Foundry`
2. **Vyberte šablonu**: Zvolte takovou, která odpovídá vašemu případu použití
3. **Inicializujte**: Spusťte příkaz `azd init` pro zvolenou šablonu
4. **Nasazení**: Spusťte `azd up` pro provisioning a nasazení

**🎯 | CVIČENÍ**: <br/>
Vyberte jednu z výše uvedených šablon na základě vašeho scénáře:

- **Chcete stavět chatbota?** → Začněte s **AI Chat s RAG** nebo **Konverzační AI bot**
- **Potřebujete autonomní agenty?** → Vyzkoušejte **Foundry Agent Service Starter** nebo **Koordinace Multi-Agentů**
- **Zpracováváte dokumenty?** → Použijte **Inteligence z dokumentů AI**
- **Chcete AI asistenta pro kódování?** → Prozkoumejte **Agent Semantic Kernel** nebo **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Prozkoumejte více šablon"
    Galerie [Awesome AZD](https://azure.github.io/awesome-azd/) obsahuje více než 250 šablon. Použijte filtry, abyste našli šablony odpovídající vašim specifickým požadavkům na jazyk, framework a Azure služby.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro zásadní informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo mylné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->