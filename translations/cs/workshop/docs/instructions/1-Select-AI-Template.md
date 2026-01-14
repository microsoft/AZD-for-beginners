<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "06d6207eff634aefcaa41739490a5324",
  "translation_date": "2025-09-25T01:59:03+00:00",
  "source_file": "workshop/docs/instructions/1-Select-AI-Template.md",
  "language_code": "cs"
}
-->
# 1. Vyberte šablonu

!!! tip "NA KONCI TOHOTO MODULU BUDETE SCHOPNI"

    - [ ] Popsat, co jsou šablony AZD
    - [ ] Objevit a používat šablony AZD pro AI
    - [ ] Začít pracovat se šablonou AI Agents
    - [ ] **Laboratoř 1:** Rychlý start AZD s GitHub Codespaces

---

## 1. Analogie stavitele

Vytvoření moderní podnikové AI aplikace _od nuly_ může být náročné. Je to trochu jako stavět svůj nový domov vlastními silami, cihlu po cihle. Ano, je to možné! Ale není to nejefektivnější způsob, jak dosáhnout požadovaného výsledku!

Místo toho často začínáme s existujícím _návrhovým plánem_ a spolupracujeme s architektem na jeho přizpůsobení našim osobním požadavkům. A přesně tento přístup bychom měli zvolit při vytváření inteligentních aplikací. Nejprve najděte vhodnou návrhovou architekturu, která odpovídá vašemu problému. Poté spolupracujte s architektem řešení na přizpůsobení a vývoji řešení pro váš konkrétní scénář.

Ale kde najít tyto návrhové plány? A jak najít architekta, který je ochoten nás naučit, jak tyto plány přizpůsobit a nasadit sami? V tomto workshopu odpovíme na tyto otázky tím, že vás seznámíme se třemi technologiemi:

1. [Azure Developer CLI](https://aka.ms/azd) - open-source nástroj, který urychluje cestu vývojáře od lokálního vývoje (build) k nasazení do cloudu (ship).
1. [Azure AI Foundry Templates](https://ai.azure.com/templates) - standardizované open-source repozitáře obsahující ukázkový kód, infrastrukturu a konfigurační soubory pro nasazení AI řešení.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - kódovací agent založený na znalostech Azure, který nás může vést při navigaci v kódu a provádění změn pomocí přirozeného jazyka.

S těmito nástroji můžeme nyní _objevit_ správnou šablonu, _nasadit_ ji, abychom ověřili její funkčnost, a _přizpůsobit_ ji našim specifickým scénářům. Pojďme se ponořit a naučit se, jak tyto nástroje fungují.

---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (nebo `azd`) je open-source příkazový nástroj, který může urychlit vaši cestu od kódu k cloudu pomocí sady příkazů přátelských pro vývojáře, které fungují konzistentně napříč vaším IDE (vývoj) a CI/CD (devops) prostředím.

S `azd` může být vaše cesta nasazení tak jednoduchá jako:

- `azd init` - Inicializuje nový AI projekt z existující šablony AZD.
- `azd up` - Zřídí infrastrukturu a nasadí vaši aplikaci v jednom kroku.
- `azd monitor` - Získá monitorování v reálném čase a diagnostiku pro vaši nasazenou aplikaci.
- `azd pipeline config` - Nastaví CI/CD pipeline pro automatizaci nasazení do Azure.

**🎯 | CVIČENÍ**: <br/> Prozkoumejte příkazový nástroj `azd` ve vašem prostředí GitHub Codespaces. Začněte zadáním tohoto příkazu, abyste zjistili, co nástroj umí:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/azd-flow.19ea67c2f81eaa66.cs.png)

---

## 3. Šablona AZD

Aby `azd` mohl toto dosáhnout, potřebuje vědět, jakou infrastrukturu zřídit, jaké konfigurační nastavení vynutit a jakou aplikaci nasadit. Zde přicházejí na řadu [šablony AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

Šablony AZD jsou open-source repozitáře, které kombinují ukázkový kód s infrastrukturními a konfiguračními soubory potřebnými pro nasazení řešení. 
Použitím přístupu _Infrastructure-as-Code_ (IaC) umožňují, aby definice zdrojů šablony a konfigurační nastavení byly verzovány (stejně jako zdrojový kód aplikace) - což vytváří opakovatelné a konzistentní pracovní postupy napříč uživateli daného projektu.

Při vytváření nebo opětovném použití šablony AZD pro _váš_ scénář zvažte tyto otázky:

1. Co vytváříte? → Existuje šablona, která má počáteční kód pro tento scénář?
1. Jak je vaše řešení navrženo? → Existuje šablona, která má potřebné zdroje?
1. Jak je vaše řešení nasazeno? → Myslete na `azd deploy` s před/po zpracovatelskými kroky!
1. Jak jej můžete dále optimalizovat? → Myslete na vestavěné monitorování a automatizační pipeline!

**🎯 | CVIČENÍ**: <br/> 
Navštivte galerii [Awesome AZD](https://azure.github.io/awesome-azd/) a použijte filtry k prozkoumání více než 250 dostupných šablon. Zkuste najít takovou, která odpovídá _vašim_ požadavkům na scénář.

![Code](../../../../../translated_images/azd-code-to-cloud.2d9503d69d3400da.cs.png)

---

## 4. Šablony AI aplikací

---

