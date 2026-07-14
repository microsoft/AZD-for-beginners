# 2. Validace šablony

> Validováno podle `azd 1.27.1` v červenci 2026.

!!! tip "NA KONCI TOHOTO MODULU BUDETE SCHOPNI"

    - [ ] Analyzovat architekturu AI řešení
    - [ ] Pochopit workflow nasazení AZD
    - [ ] Používat GitHub Copilot pro pomoc s používáním AZD
    - [ ] **Lab 2:** Nasadit a ověřit šablonu AI agentů

---


## 1. Úvod

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) nebo `azd` je open-source nástroj příkazové řádky, který zjednodušuje workflow vývojáře při vytváření a nasazování aplikací do Azure.

[AZD Šablony](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) jsou standardizované repozitáře, které obsahují ukázkový aplikační kód, zdroje _infrastruktury jako kódu_ a konfigurační soubory `azd` pro celistvou architekturu řešení. Provisioning infrastruktury je tak jednoduchý jako příkaz `azd provision` – zatímco příkaz `azd up` umožní najednou provisionovat infrastrukturu **a** nasadit vaši aplikaci!

Výsledkem je, že spuštění vašeho vývojového procesu aplikace může být tak snadné jako najít správnou _AZD Starter šablonu_, která nejvíce vyhovuje vašim požadavkům na aplikaci a infrastrukturu – a pak přizpůsobit repozitář podle vašich scénářů.

Než začneme, ujistěme se, že máte nainstalovaný Azure Developer CLI.

1. Otevřete terminál ve VS Code a zadejte tento příkaz:

      ```bash title="" linenums="0"
      azd version
      ```

1. Měli byste vidět něco podobného!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Nyní jste připraveni vybrat a nasadit šablonu pomocí azd**

---

## 2. Výběr šablony

Platforma Microsoft Foundry přichází s [sadu doporučených AZD šablon](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), které pokrývají oblíbené scénáře řešení jako _automatizace workflow s více agenty_ a _zpracování multimodálního obsahu_. Tyto šablony můžete také objevit návštěvou portálu Microsoft Foundry.

1. Navštivte [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Přihlaste se do portálu Microsoft Foundry, když budete vyzváni – uvidíte něco takového.

![Pick](../../../../../translated_images/cs/01-pick-template.60d2d5fff5ebc374.webp)


Volby **Základní** jsou vaše startovací šablony:

1. [ ] [Začít s AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat), která nasadí základní chatovací aplikaci _s vašimi daty_ do Azure Container Apps. Použijte to k prozkoumání základního scénáře AI chatbota.
1. [X] [Začít s AI Agenty](https://github.com/Azure-Samples/get-started-with-ai-agents), která také nasadí standardního AI Agenta (s Foundry agenty). Použijte to, abyste si osvojili agentní AI řešení využívající nástroje a modely.

Navštivte druhý odkaz v nové záložce prohlížeče (nebo klikněte na `Open in GitHub` na příslušné kartě). Měli byste vidět repozitář této AZD šablony. Věnujte chvíli prozkoumání README. Architektura aplikace vypadá takto:

![Arch](../../../../../translated_images/cs/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivace šablony

Zkusme nasadit tuto šablonu a ověřit její platnost. Budeme postupovat podle pokynů v sekci [Začínáme](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Vyberte pracovní prostředí pro repozitář šablony:

      - **GitHub Codespaces**: Klikněte na [tento odkaz](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) a potvrďte `Create codespace`
      - **Lokální klon nebo dev kontejner**: Klonujte `Azure-Samples/get-started-with-ai-agents` a otevřete ji ve VS Code

1. Počkejte, až bude terminál VS Code připraven, pak zadejte následující příkaz:

   ```bash title="" linenums="0"
   azd up
   ```

Dokončete kroky workflow, které tento příkaz spustí:

1. Budete vyzváni k přihlášení do Azure – postupujte podle pokynů pro autentizaci
1. Zadejte unikátní název prostředí pro vás – např. já jsem použil `nitya-mshack-azd`
1. Toto vytvoří složku `.azure/` – uvidíte podsložku s názvem prostředí
1. Budete vyzváni k výběru názvu předplatného – vyberte výchozí
1. Budete vyzváni k zadání umístění – použijte `East US 2`

Nyní počkejte na dokončení provisioningu. **Trvá to 10-15 minut**

1. Po dokončení váš konzolový výstup zobrazí ÚSPĚŠNOU zprávu jako tato:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. V Azure Portálu nyní uvidíte zdrojovou skupinu s názvem prostředí:

      ![Infra](../../../../../translated_images/cs/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Nyní jste připraveni validovat nasazenou infrastrukturu a aplikaci**.

---

## 4. Validace šablony

1. Navštivte stránku Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) – přihlaste se, pokud budete vyzváni
1. Klikněte na RG odpovídající vašemu názvu prostředí – uvidíte stránku výše

      - klikněte na zdroj Azure Container Apps
      - klikněte na URL aplikace v sekci _Essentials_ (vpravo nahoře)

1. Měli byste vidět hostované front-end UI aplikace jako toto:

   ![App](../../../../../translated_images/cs/03-test-application.471910da12c3038e.webp)

1. Vyzkoušejte několik [ukázkových otázek](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Zeptejte se: ```Jaké je hlavní město Francie?```
      1. Zeptejte se: ```Jaký je nejlepší stan pod 200 dolarů pro dvě osoby a jaké má vlastnosti?```

1. Měli byste dostat odpovědi podobné těm níže. _Ale jak to funguje?_

      ![App](../../../../../translated_images/cs/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validace agenta

Azure Container App nasazuje endpoint, který se připojuje k AI Agentovi provisionovanému v projektu Microsoft Foundry pro tuto šablonu. Podívejme se, co to znamená.

1. Vraťte se na stránku _Přehled_ ve vašem Azure Portálu pro vaši zdrojovou skupinu

1. Klikněte na `Microsoft Foundry` zdroj v tomto seznamu

1. Měli byste vidět toto. Klikněte na tlačítko `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/cs/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Měli byste vidět stránku s projektem Foundry pro vaši AI aplikaci
   ![Project](../../../../../translated_images/cs/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klikněte na `Agents` – uvidíte výchozího agenta provisionovaného ve vašem projektu
   ![Agents](../../../../../translated_images/cs/06-visit-agents.bccb263f77b00a09.webp)

1. Vyberte ho – a uvidíte podrobnosti agenta. Všimněte si následujícího:

      - Agent používá výchozí vyhledávání v souborech (vždy)
      - Agent `Knowledge` uvádí, že bylo nahráno 32 souborů (pro vyhledávání v souborech)
      ![Agents](../../../../../translated_images/cs/07-view-agent-details.0e049f37f61eae62.webp)

1. Vyhledejte možnost `Data+indexes` v levém menu a klikněte pro detaily.

      - Měli byste vidět 32 nahraných datových souborů pro znalosti.
      - Ty odpovídají 12 zákaznickým souborům a 20 produktovým souborům ve složce `src/files`
      ![Data](../../../../../translated_images/cs/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Potvrdili jste správnou funkci agenta!**

1. Odpovědi agenta jsou založeny na znalostech v těchto souborech.
1. Nyní můžete klást otázky týkající se těchto dat a dostávat na ně podložené odpovědi.
1. Příklad: `customer_info_10.json` popisuje 3 nákupy uskutečněné "Amanda Perez"

Vraťte se do záložky prohlížeče s endpointem Container App a zeptejte se: `Jaké produkty vlastní Amanda Perez?`. Měli byste vidět něco takového:

![Data](../../../../../translated_images/cs/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Herní pole agenta

Získejme trochu více intuice o možnostech Microsoft Foundry tím, že si agenta vyzkoušíme v Agents Playground.

1. Vraťte se na stránku `Agents` v Microsoft Foundry - vyberte výchozího agenta
1. Klikněte na možnost `Try in Playground` - měli byste vidět UI Playgroundu jako toto
1. Zeptejte se stejnou otázku: `Jaké produkty vlastní Amanda Perez?`

    ![Data](../../../../../translated_images/cs/09-ask-in-playground.a1b93794f78fa676.webp)

Dostanete stejnou (nebo podobnou) odpověď - ale také další informace, které můžete využít k porozumění kvalitě, nákladům a výkonu vaší agentní aplikace. Například:

1. Všímejte si, že odpověď uvádí datové soubory, které byly použity k "podložení" odpovědi
1. Najděte kurzorem libovolnou ze štítků souborů – odpovídají data vaší otázce a zobrazené odpovědi?

Pod odpovědí také vidíte řádek se _statistikami_.

1. Najděte kurzorem libovolnou metriku – např. Bezpečnost (Safety). Uvidíte něco jako toto
1. Odpovídá hodnocení vaší intuici ohledně úrovně bezpečnosti odpovědi?

      ![Data](../../../../../translated_images/cs/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Vestavěná možnost sledování

Sledovatelnost (observability) znamená instrumentaci vaší aplikace k generování dat, která lze využít k pochopení, ladění a optimalizaci jejího fungování. Pro získání přehledu:

1. Klikněte na tlačítko `View Run Info` - měli byste vidět tento pohled. Toto je příklad [sledování agenta](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) v praxi. _Tento pohled můžete získat také kliknutím na Thread Logs v horní nabídce_.

   - Získejte přehled o krocích běhu a zapojených nástrojích agenta
   - Pochopte celkový počet Tokenů (ve srovnání s použitými výstupními tokeny) pro odpověď
   - Pochopte latenci a kde je tráven čas ve vykonávání

      ![Agent](../../../../../translated_images/cs/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klikněte na záložku `Metadata` pro zobrazení dalších atributů běhu, které mohou poskytovat užitečný kontext pro pozdější ladění problémů.

      ![Agent](../../../../../translated_images/cs/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klikněte na záložku `Evaluations` pro zobrazení automatických hodnocení odpovědi agenta. Ty zahrnují hodnocení bezpečnosti (např. Sebepoškozování) a hodnocení specifická pro agenta (např. vyhodnocení záměru, dodržení úkolu).

      ![Agent](../../../../../translated_images/cs/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Nakonec klikněte na záložku `Monitoring` v postranním menu.

      - Vyberte záložku `Resource usage` na zobrazené stránce a prohlédněte si metriky.
      - Sledujte využití aplikace z hlediska nákladů (tokenů) a zatížení (požadavky).
      - Sledujte latenci aplikace pro první bajt (zpracování vstupu) a poslední bajt (výstup).

      ![Agent](../../../../../translated_images/cs/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Proměnné prostředí

Doposud jsme prošli nasazením v prohlížeči – a ověřili jsme, že infrastruktura byla provisionována a aplikace funguje. Ale abychom mohli pracovat s aplikací _především kódem_, musíme nakonfigurovat naše lokální vývojové prostředí s příslušnými proměnnými prostředí potřebnými k práci s těmito zdroji. Použití `azd` to výrazně usnadňuje.

1. Azure Developer CLI [používá proměnné prostředí](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) ke skladování a řízení konfiguračních nastavení pro nasazení aplikací.

1. Proměnné prostředí jsou uloženy v `.azure/<env-name>/.env` – což je vztahuje ke konkrétnímu prostředí `env-name` použitým při nasazení a pomáhá izolovat prostředí mezi různými cíli nasazení ve stejném repozitáři.

1. Proměnné prostředí jsou automaticky načítány příkazem `azd` vždy, když spustí konkrétní příkaz (např. `azd up`). Vezměte na vědomí, že `azd` automaticky nečte _proměnné prostředí na úrovni OS_ (např. nastavené v shellu) – místo toho použijte příkazy `azd set env` a `azd get env` pro předávání informací ve skriptech.


Vyzkoušejme si několik příkazů:

1. Zobrazit všechny proměnné prostředí nastavené pro `azd` v tomto prostředí:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Uvidíte něco jako:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Zobrazit konkrétní hodnotu – např. chci vědět, jestli máme nastavenou hodnotu `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Uvidíte něco takového – nebylo to nastaveno ve výchozím stavu!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Nastavit novou proměnnou prostředí pro `azd`. Zde aktualizujeme název modelu agenta. _Poznámka: jakékoli změny se okamžitě projeví v souboru `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nyní by měla být hodnota nastavena:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Některé zdroje jsou přetrvávající (např. nasazení modelů) a vyžadují víc než jen `azd up` k nucenému opětovnému nasazení. Zkusme rozebrat původní nasazení a nasadit znovu s novými proměnnými prostředí.

1. **Obnovit** Pokud jste dříve nasadili infrastrukturu pomocí šablony azd – můžete _obnovit_ stav vašich lokálních proměnných prostředí na základě aktuálního stavu nasazení v Azure pomocí tohoto příkazu:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Toto je silný způsob, jak _synchronizovat_ proměnné prostředí mezi dvěma nebo více lokálními vývojovými prostředími (např. tým s více vývojáři) - což umožňuje, aby nasazená infrastruktura sloužila jako pravdivý zdroj stavu proměnných prostředí. Členové týmu jednoduše _obnoví_ proměnné, aby se opět synchronizovali.

---

## 9. Gratulujeme 🏆

Právě jste dokončili kompletní pracovní postup, ve kterém jste:

- [X] Vybrali šablonu AZD, kterou chcete použít
- [X] Otevřeli šablonu v podporovaném vývojovém prostředí
- [X] Nasadili šablonu a ověřili, že funguje

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->