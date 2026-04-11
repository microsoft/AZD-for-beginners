# 2. Overenie šablóny

> Overené proti `azd 1.23.12` v marci 2026.

!!! tip "NA KONCI TOHTO MODULU BUDETE SCHOPNÍ"

    - [ ] Analyzovať architektúru AI riešenia
    - [ ] Rozumieť workflow nasadenia AZD
    - [ ] Použiť GitHub Copilot na pomoc s používaním AZD
    - [ ] **Laboratórium 2:** Nasadiť a overiť šablónu AI Agentov

---


## 1. Úvod

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) alebo `azd` je open-source príkazový nástroj, ktorý zjednodušuje pracovný tok vývojára pri vytváraní a nasadzovaní aplikácií do Azure.

[AZD šablóny](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sú štandardizované repozitáre, ktoré obsahujú ukážkový aplikačný kód, aktíva v podobe _infraštruktúry ako kódu_ a konfiguračné súbory `azd` pre súdržnú architektúru riešenia. Provisioning infraštruktúry je tak jednoduchý ako príkaz `azd provision` - zatiaľ čo použitie `azd up` umožňuje jedným príkazom provision infraštruktúru **a** nasadiť vašu aplikáciu!

Výsledkom je, že začať s vývojom aplikácie môže byť tak jednoduché ako nájsť správnu _AZD štartovaciu šablónu_, ktorá najviac vyhovuje potrebám vašej aplikácie a infraštruktúry - a potom prispôsobiť repozitár podľa požiadaviek vášho scenára.

Pred tým, než začneme, uistime sa, že máte Azure Developer CLI nainštalovaný.

1. Otvorte terminál vo VS Code a zadajte tento príkaz:

      ```bash title="" linenums="0"
      azd version
      ```

1. Mali by ste vidieť niečo takéto!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Teraz ste pripravení vybrať a nasadiť šablónu s azd**

---

## 2. Výber šablóny

Platforma Microsoft Foundry prichádza so [súborom odporúčaných AZD šablón](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), ktoré pokrývajú populárne scenáre riešení ako _automatizácia workflow viacerých agentov_ a _spracovanie multimodálneho obsahu_. Tieto šablóny môžete nájsť aj návštevou portálu Microsoft Foundry.

1. Navštívte [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Pri výzve sa prihláste do portálu Microsoft Foundry – uvidíte niečo takéto.

![Pick](../../../../../translated_images/sk/01-pick-template.60d2d5fff5ebc374.webp)


**Základné** možnosti sú vaše štartovacie šablóny:

1. [ ] [Začať s AI Chatom](https://github.com/Azure-Samples/get-started-with-ai-chat), ktorá nasadí základnú chatovaciu aplikáciu _s vašimi dátami_ do Azure Container Apps. Použite ju na preskúmanie základného scenára AI chatbota.
1. [X] [Začať s AI Agentmi](https://github.com/Azure-Samples/get-started-with-ai-agents), ktorá tiež nasadí štandardného AI agenta (s Foundry agentmi). Použite ju na zoznámenie sa s agentickými AI riešeniami využívajúcimi nástroje a modely.

Navštívte druhý odkaz v novej karte prehliadača (alebo kliknite na `Open in GitHub` pri príslušnej karte). Mali by ste vidieť repozitár pre túto AZD šablónu. Venujte minútu na preskúmanie README. Architektúra aplikácie vyzerá takto:

![Arch](../../../../../translated_images/sk/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivácia šablóny

Skúsme nasadiť túto šablónu a uistime sa, že je platná. Budeme postupovať podľa usmernení v sekcii [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Vyberte pracovné prostredie pre repozitár šablóny:

      - **GitHub Codespaces**: Kliknite na [tento odkaz](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) a potvrďte `Create codespace`
      - **Lokálny klon alebo dev container**: Klonujte `Azure-Samples/get-started-with-ai-agents` a otvorte ho vo VS Code

1. Počkajte, kým bude terminál vo VS Code pripravený a zadajte nasledujúci príkaz:

   ```bash title="" linenums="0"
   azd up
   ```

Dokončite kroky workflow, ktoré sa tým spustia:

1. Budete vyzvaní na prihlásenie do Azure - riaďte sa pokynmi na autentifikáciu
1. Zadajte jedinečný názov prostredia - napríklad ja som použil `nitya-mshack-azd`
1. Tým sa vytvorí priečinok `.azure/` - uvidíte podsložku s názvom prostredia
1. Budete vyzvaní na výber názvu predplatného - vyberte predvolené
1. Budete vyzvaní na výber umiestnenia - použite `East US 2`

Teraz čakajte na dokončenie provisioningu. **Trvá to 10-15 minút**

1. Po dokončení sa vám v konzole zobrazí SPRÁVA O ÚSPECHU ako táto:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. V Azure portáli sa vám teraz zobrazí vytvorená skupina prostriedkov s týmto názvom prostredia:

      ![Infra](../../../../../translated_images/sk/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Teraz ste pripravení overiť nasadenú infraštruktúru a aplikáciu**.

---

## 4. Overenie šablóny

1. Navštívte stránku Skupiny prostriedkov Azure portálu [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - prihláste sa, ak ste vyzvaní
1. Kliknite na RG s názvom vášho prostredia - uvidíte stránku vyššie

      - kliknite na zdroj Azure Container Apps
      - kliknite na URL aplikácie v sekcii _Základné informácie_ (hore vpravo)

1. Mali by ste vidieť hosťované užívateľské rozhranie frontend aplikácie ako toto:

   ![App](../../../../../translated_images/sk/03-test-application.471910da12c3038e.webp)

1. Skúste položiť pár [ukážkových otázok](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Spýtajte sa: ```Aké je hlavné mesto Francúzska?```
      1. Spýtajte sa: ```Aký je najlepší stan do $200 pre dve osoby a aké funkcie obsahuje?```

1. Mali by ste dostať odpovede podobné tým, ktoré sú zobrazené nižšie. _Ale ako to funguje?_

      ![App](../../../../../translated_images/sk/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Overenie agenta

Azure Container App nasadzuje endpoint, ktorý sa pripája na AI agenta provisionovaného v projekte Microsoft Foundry pre túto šablónu. Pozrime sa, čo to znamená.

1. Vráťte sa na stránku _Prehľad_ Azure portálu pre vašu skupinu prostriedkov

1. Kliknite na zdroj `Microsoft Foundry` v tomto zozname

1. Mali by ste vidieť toto. Kliknite na tlačidlo `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/sk/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Mali by ste vidieť stránku Foundry projektu pre vašu AI aplikáciu
   ![Project](../../../../../translated_images/sk/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kliknite na `Agents` - uvidíte predvoleného agenta provisionovaného vo vašom projekte
   ![Agents](../../../../../translated_images/sk/06-visit-agents.bccb263f77b00a09.webp)

1. Vyberte ho - uvidíte detaily agenta. Všímajte si nasledujúce:

      - Agent používa predvolene (vždy) vyhľadávanie v súboroch (File Search)
      - Agentova sekcia `Knowledge` indikuje, že má nahraných 32 súborov (na vyhľadávanie v súboroch)
      ![Agents](../../../../../translated_images/sk/07-view-agent-details.0e049f37f61eae62.webp)

1. V ľavom menu hľadajte možnosť `Data+indexes` a kliknite pre detaily.

      - Mali by ste vidieť 32 dátových súborov nahraných ako znalosti.
      - Tieto korešpondujú s 12 zákazníckymi súbormi a 20 produktovými súbormi v `src/files`
      ![Data](../../../../../translated_images/sk/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Validovali ste činnosť Agenta!**

1. Odpovede agenta sú založené na znalostiach v týchto súboroch.
1. Môžete teraz klásť otázky týkajúce sa týchto dát a dostať relevantné odpovede.
1. Príklad: `customer_info_10.json` popisuje 3 nákupy vykonané "Amanda Perez"

Vráťte sa na kartu prehliadača s endpointom Container App a spýtajte sa: `Aké produkty vlastní Amanda Perez?`. Mali by ste vidieť niečo takéto:

![Data](../../../../../translated_images/sk/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Poďme si trochu viac osvojiť schopnosti Microsoft Foundry tým, že si agent vyskúšame v Agents Playground.

1. Vráťte sa na stránku `Agents` v Microsoft Foundry – vyberte predvoleného agenta
1. Kliknite na možnosť `Try in Playground` – mali by ste dostať užívateľské rozhranie Playground ako toto
1. Položte tú istú otázku: `Aké produkty vlastní Amanda Perez?`

    ![Data](../../../../../translated_images/sk/09-ask-in-playground.a1b93794f78fa676.webp)

Dostanete rovnakú (alebo podobnú) odpoveď – ale zároveň získate ďalšie informácie, ktoré môžete použiť na pochopenie kvality, nákladov a výkonu vašej agentickej aplikácie. Napríklad:

1. Všimnite si, že odpoveď uvádza dátové súbory použité na "základ" odpovede
1. Prejdite myšou cez ktorúkoľvek z týchto značiek súborov – zodpovedajú údaje vašej otázke a zobrazenej odpovedi?

Vidíte tiež riadok _štatistík_ pod odpoveďou.

1. Prejdite myšou cez akýkoľvek metriku – napr. Safety (bezpečnosť). Uvidíte niečo takéto
1. Zodpovedá hodnotené ohodnotenie vašej intuícii o úrovni bezpečnosti odpovede?

      ![Data](../../../../../translated_images/sk/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Vstavaná pozorovateľnosť

Pozorovateľnosť spočíva v tom, že aplikáciu opatrujete nástrojmi na generovanie dát, ktoré môžu byť použité na pochopenie, ladenie a optimalizáciu jej prevádzky. Ak chcete získať predstavu:

1. Kliknite na tlačidlo `View Run Info` – mali by ste vidieť tento pohľad. Toto je príklad [sledovania agenta](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) v akcii. _Tento pohľad môžete získať aj kliknutím na Thread Logs v hlavnom menu_.

   - Získajte prehľad o krokoch behu a nástrojoch zapojených agentom
   - Pochopte celkový počet tokenov (vs. výstupné tokeny) pre odpoveď
   - Pochopte latenciu a kde sa čas stráca počas vykonávania

      ![Agent](../../../../../translated_images/sk/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kliknite na záložku `Metadata` pre zobrazenie ďalších atribútov behu, ktoré môžu poskytnúť užitočný kontext pre neskoršie ladenie problémov.

      ![Agent](../../../../../translated_images/sk/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kliknite na záložku `Evaluations` pre zobrazenie automatických hodnotení agentovej odpovede. Patria sem hodnotenia bezpečnosti (napr. samovoľné ublíženie) a špecifické agentové hodnotenia (napr. rozlúštenie zámeru, dodržiavanie úlohy).

      ![Agent](../../../../../translated_images/sk/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. A nakoniec kliknite na záložku `Monitoring` v postrannom menu.

      - Vyberte záložku `Resource usage` na zobrazenom paneli – a sledujte metriky.
      - Sledujte používanie aplikácie z hľadiska nákladov (tokeny) a zaťaženia (požiadavky).
      - Sledujte latenciu aplikácie od prvého bajtu (spracovanie vstupu) po posledný bajt (výstup).

      ![Agent](../../../../../translated_images/sk/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Premenné prostredia

Doteraz sme prešli nasadením v prehliadači – a overili, že infraštruktúra je provisióvaná a aplikácia funguje. Ak však chceme pracovať s aplikáciou _najprv kódom_, potrebujeme nastaviť naše lokálne vývojové prostredie relevantnými premennými, ktoré sú potrebné na prácu s týmito zdrojmi. Použitie `azd` to veľmi zjednodušuje.

1. Azure Developer CLI [používa premenné prostredia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) na ukladanie a správu konfiguračných nastavení nasadenia aplikácií.

1. Premenné prostredia sú uložené v `.azure/<env-name>/.env` – tým sú viazané na prostredie `env-name`, ktoré ste použili počas nasadenia, a pomáhajú vám izolovať prostredia medzi rôznymi cieľmi nasadenia v rovnakom repozitári.

1. Premenné prostredia sú automaticky načítané príkazom `azd` vždy, keď spustí konkrétny príkaz (napr. `azd up`). Upozorňujeme, že `azd` automaticky nečíta _premenné prostredia na úrovni OS_ (napr. nastavené v shelle) – namiesto toho používajte `azd set env` a `azd get env` na prenos informácií v skriptoch.

Vyskúšajme niekoľko príkazov:

1. Získajte všetky premenné prostredia nastavené pre `azd` v tomto prostredí:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Mali by ste vidieť niečo takéto:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Získajte konkrétnu hodnotu – napríklad chcem vedieť, či je nastavená hodnota `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Malo by to vyzerať takto – nebola nastavená predvolene!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Nastavte novú premennú prostredia pre `azd`. Tu aktualizujeme názov modelu agenta. _Upozornenie: akékoľvek zmeny sa okamžite prejavia v súbore `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Teraz by sme mali vidieť, že hodnota je nastavená:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Niektoré zdroje sú však perzistentné (napr. nasadenia modelov) a budú vyžadovať viac než len `azd up` na donútenie opätovného nasadenia. Skúsme odstrániť pôvodné nasadenie a znovu nasadiť so zmenenými premennými prostredia.

1. **Obnovenie (Refresh)** Ak ste predtým nasadili infraštruktúru pomocou šablóny azd – môžete _obnoviť_ stav svojich lokálnych premenných prostredia na základe aktuálneho stavu vášho Azure nasadenia pomocou tohto príkazu:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Toto je výkonný spôsob, ako _synchronizovať_ premenné prostredia medzi dvoma alebo viacerými lokálnymi vývojovými prostrediami (napr. tím s viacerými vývojármi) – umožňujúc nasadenej infraštruktúre slúžiť ako základná pravda o stave premenných prostredia. Členovia tímu jednoducho _obnovia_ premenné, aby sa znovu zosúladili.

---

## 9. Blahoželáme 🏆

Práve ste dokončili komplexný pracovný tok, kde ste:

- [X] Vybrali šablónu AZD, ktorú chcete použiť
- [X] Otvorili šablónu v podporovanom vývojovom prostredí
- [X] Nasadili šablónu a overili, že funguje

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, berte prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek neporozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->