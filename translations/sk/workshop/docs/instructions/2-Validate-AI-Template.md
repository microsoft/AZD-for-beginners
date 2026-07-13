# 2. Overenie šablóny

> Overené na `azd 1.27.1` v júli 2026.

!!! tip "NA KONCI TOHTO MODULU BUDETE VEDIEŤ"

    - [ ] Analyzovať architektúru AI riešenia
    - [ ] Pochopiť pracovný postup nasadzovania AZD
    - [ ] Použiť GitHub Copilot na pomoc s používaním AZD
    - [ ] **Lab 2:** Nasadiť a overiť šablónu AI agentov

---


## 1. Úvod

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) alebo `azd` je open-source príkazový nástroj, ktorý zjednodušuje vývojársky pracovný postup pri tvorbe a nasadzovaní aplikácií do Azure.

[AZD šablóny](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sú štandardizované repozitáre, ktoré obsahujú ukážkový aplikačný kód, zdroje _infrastrukturálneho kódu_ a konfiguračné súbory `azd` pre súdržnú architektúru riešenia. Poskytovanie infraštruktúry je také jednoduché ako príkaz `azd provision` – zatiaľ čo použitie príkazu `azd up` umožňuje poskytnutie infraštruktúry **a zároveň** nasadenie aplikácie na jedenkrát!

Výsledkom je, že naštartovanie vývoja vašej aplikácie môže byť také jednoduché, ako nájsť správnu _AZD štartovaciu šablónu_, ktorá najbližšie vyhovuje vašim potrebám aplikácie a infraštruktúry – a potom upraviť repozitár podľa požiadaviek vášho scenára.

Predtým než začneme, uistime sa, že máte nainštalovaný Azure Developer CLI.

1. Otvorte terminál VS Code a zadajte tento príkaz:

      ```bash title="" linenums="0"
      azd version
      ```

1. Mali by ste vidieť niečo takéto!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Teraz ste pripravení vybrať a nasadiť šablónu pomocou azd**

---

## 2. Výber šablóny

Platforma Microsoft Foundry prichádza so [súborom odporúčaných AZD šablón](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), ktoré pokrývajú populárne scenáre riešení ako _automatizácia pracovných postupov s viacerými agentmi_ a _multi-modálne spracovanie obsahu_. Tieto šablóny môžete objaviť aj návštevou portálu Microsoft Foundry.

1. Navštívte [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Pri výzve sa prihláste do portálu Microsoft Foundry – uvidíte niečo takéto.

![Pick](../../../../../translated_images/sk/01-pick-template.60d2d5fff5ebc374.webp)


**Základné** možnosti sú vaše štartovacie šablóny:

1. [ ] [Začať s AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat), ktorá nasadí základnú chatovaciu aplikáciu _s vašimi dátami_ do Azure Container Apps. Použite na preskúmanie základného scenára AI chatbota.
1. [X] [Začať s AI Agentmi](https://github.com/Azure-Samples/get-started-with-ai-agents), ktorá taktiež nasadí štandardného AI agenta (s Foundry agentmi). Použite na zoznámenie sa s agentickými AI riešeniami zahŕňajúcimi nástroje a modely.

Navštívte druhý odkaz v novom prehliadačovom okne (alebo kliknite na `Open in GitHub` pre súvisiacu kartu). Mali by ste vidieť repozitár pre túto AZD šablónu. Venujte minútu preskúmaniu súboru README. Architektúra aplikácie vyzerá takto:

![Arch](../../../../../translated_images/sk/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivácia šablóny

Skúsme nasadiť túto šablónu a overiť, že je platná. Budeme postupovať podľa pokynov v sekcii [Začíname](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Vyberte pracovné prostredie pre repozitár šablóny:

      - **GitHub Codespaces**: Kliknite na [tento odkaz](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) a potvrďte `Create codespace`
      - **Lokálny klon alebo dev kontajner**: Klonujte `Azure-Samples/get-started-with-ai-agents` a otvorte ho vo VS Code

1. Počkajte, kým bude terminál VS Code pripravený, potom zadajte nasledujúci príkaz:

   ```bash title="" linenums="0"
   azd up
   ```

Dokončite kroky pracovného postupu, ktoré tento príkaz spustí:

1. Budete vyzvaní na prihlásenie do Azure – postupujte podľa pokynov na autentifikáciu
1. Zadajte jedinečný názov prostredia – napríklad ja som použil `nitya-mshack-azd`
1. Toto vytvorí priečinok `.azure/` – uvidíte podpriečinok s názvom prostredia
1. Budete vyzvaní na výber názvu predplatného – vyberte predvolené
1. Budete vyzvaní na výber lokality – použite `East US 2`

Teraz počkajte, kým sa dokončí provisionovanie. **Trvá to 10-15 minút**

1. Po dokončení vám konzola zobrazí SPRÁVU O ÚSPECHU ako táto:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Váš Azure portál teraz bude mať provisionovanú skupinu zdrojov s týmto názvom prostredia:

      ![Infra](../../../../../translated_images/sk/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Teraz ste pripravení overiť nasadenú infraštruktúru a aplikáciu**.

---

## 4. Overenie šablóny

1. Navštívte stránku Azure portálu [Resource Groups](https://portal.azure.com/#browse/resourcegroups) – prihláste sa, keď budete vyzvaní
1. Kliknite na RG (Resource Group) s názvom vášho prostredia – uvidíte stránku vyššie

      - kliknite na zdroj Azure Container Apps
      - kliknite na URL aplikácie v sekcii _Essentials_ (vpravo hore)

1. Mali by ste vidieť hostené používateľské rozhranie aplikácie ako toto:

   ![App](../../../../../translated_images/sk/03-test-application.471910da12c3038e.webp)

1. Skúste položiť niekoľko [ukážkových otázok](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pýtajte sa: ```Aké je hlavné mesto Francúzska?``` 
      1. Pýtajte sa: ```Aký je najlepší stan do 200 $ pre dve osoby a aké má funkcie?```

1. Mali by ste dostať odpovede podobné tým, ktoré sú zobrazené nižšie. _Ale ako to funguje?_

      ![App](../../../../../translated_images/sk/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Overenie agenta

Azure Container App nasadzuje koncový bod, ktorý sa pripája k AI Agentovi provisionovanému v projekte Microsoft Foundry pre túto šablónu. Pozrime sa, čo to znamená.

1. Vráťte sa na stránku _Overview_ v Azure Portáli pre vašu skupinu zdrojov

1. Kliknite na zdroj `Microsoft Foundry` v tomto zozname

1. Mali by ste vidieť toto. Kliknite na tlačidlo `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/sk/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Mali by ste vidieť stránku Foundry projektu pre vašu AI aplikáciu
   ![Project](../../../../../translated_images/sk/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kliknite na `Agents` – uvidíte predvoleného agenta provisionovaného vo vašom projekte
   ![Agents](../../../../../translated_images/sk/06-visit-agents.bccb263f77b00a09.webp)

1. Vyberte ho – a uvidíte detaily agenta. Všímajte si nasledovné:

      - Agent používa predvolene File Search (vždy)
      - V časti `Knowledge` agenta vidno, že má nahraných 32 súborov (pre vyhľadávanie v súboroch)
      ![Agents](../../../../../translated_images/sk/07-view-agent-details.0e049f37f61eae62.webp)

1. V ľavom menu hľadajte možnosť `Data+indexes` a kliknite pre detaily.

      - Mali by ste vidieť 32 dátových súborov nahraných pre vedomosti.
      - Tieto budú korešpondovať s 12 zákazníckymi súbormi a 20 produktovými súbormi v zložke `src/files`
      ![Data](../../../../../translated_images/sk/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Overili ste činnosť agenta!**

1. Odpovede agenta sú založené na znalostiach v týchto súboroch.
1. Teraz môžete klásť otázky súvisiace s týmito dátami a dostávať podložené odpovede.
1. Príklad: `customer_info_10.json` popisuje 3 nákupy uskutočnené "Amanda Perez"

Vráťte sa na kartu prehliadača s koncovým bodom Container App a zadajte: `Aké produkty vlastní Amanda Perez?`. Mali by ste vidieť niečo takéto:

![Data](../../../../../translated_images/sk/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Poďme získať lepšiu predstavu o možnostiach Microsoft Foundry tým, že agenta vyzkúšame v Agents Playground.

1. Vráťte sa na stránku `Agents` v Microsoft Foundry – vyberte predvoleného agenta
1. Kliknite na možnosť `Try in Playground` – mali by ste dostať UI ako táto
1. Pýtajte sa tú istú otázku: `Aké produkty vlastní Amanda Perez?`

    ![Data](../../../../../translated_images/sk/09-ask-in-playground.a1b93794f78fa676.webp)

Dostanete rovnakú (alebo podobnú) odpoveď – ale zároveň aj ďalšie informácie, ktoré môžete použiť na pochopenie kvality, nákladov a výkonu vašej agentovej aplikácie. Napríklad:

1. Všimnite si, že odpoveď cituje dátové súbory použité na „podkladanie“ odpovede
1. Najeďte myšou na niektorý z týchto názvov súborov – zodpovedajú dáta vašej otázke a zobrazenej odpovedi?

Pod odpoveďou vidíte aj riadok so _štatistikami_.

1. Najeďte myšou na akúkoľvek metriku – napríklad Safety. Uvidíte niečo takéto
1. Zodpovedá hodnotené skóre vašej intuícii o úrovni bezpečnosti odpovede?

      ![Data](../../../../../translated_images/sk/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Zabudovaná pozorovateľnosť

Pozorovateľnosť znamená inštrumentovať vašu aplikáciu tak, aby generovala dáta, ktoré je možné použiť na pochopenie, ladenie a optimalizáciu jej prevádzky. Pre predstavu:

1. Kliknite na tlačidlo `View Run Info` – mali by ste vidieť tento pohľad. Toto je príklad [sledovania agenta](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) v akcii. _Tento pohľad môžete tiež získať kliknutím na Thread Logs v hlavnom menu._

   - Získajte prehľad o krokoch behu a zapojených nástrojoch agenta
   - Pochopte celkový počet tokenov ( oproti používaným výstupným tokenom) pre odpoveď
   - Pochopte latenciu a kde sa trávi čas počas vykonávania

      ![Agent](../../../../../translated_images/sk/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kliknite na záložku `Metadata` pre zobrazenie ďalších atribútov behu, ktoré môžu neskôr poskytnúť užitočný kontext pre ladenie.

      ![Agent](../../../../../translated_images/sk/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kliknite na záložku `Evaluations` pre zobrazenie automatických hodnotení odpovede agenta. Patria sem bezpečnostné hodnotenia (napr. sebapoškodzovanie) a špecifické hodnotenia agenta (napr. riešenie zámeru, dodržiavanie úloh).

      ![Agent](../../../../../translated_images/sk/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Nakoniec, kliknite na záložku `Monitoring` v bočnom menu.

      - Vyberte záložku `Resource usage` na zobrazenej stránke – a prezrite si metriky.
      - Sledujte využitie aplikácie z hľadiska nákladov (tokeny) a zaťaženia (požiadavky).
      - Sledujte latenciu aplikácie do prvého bajtu (spracovanie vstupu) a posledného bajtu (výstup).

      ![Agent](../../../../../translated_images/sk/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Premenné prostredia

Doteraz sme prešli nasadením v prehliadači a overili, že naša infraštruktúra bola provisionovaná a aplikácia funguje. Ale na prácu s kódom aplikácie _najskôr_ potrebujeme nakonfigurovať naše lokálne vývojové prostredie s príslušnými premennými nutnými pre prácu s týmito zdrojmi. Použitie `azd` to výrazne uľahčuje.

1. Azure Developer CLI [používa premenné prostredia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) na ukladanie a správu konfiguračných nastavení pre nasadenie aplikácie.

1. Premenné prostredia sa ukladajú do `.azure/<env-name>/.env` – toto ich viaže na prostredie `env-name` použité počas nasadenia a pomáha izolovať prostredia medzi rôznymi cieľmi nasadenia v rovnakom repozitári.

1. Premenné prostredia sa automaticky načítavajú príkazom `azd` zakaždým, keď sa vykoná konkrétny príkaz (napr. `azd up`). Poznámka, `azd` automaticky nečíta premenné prostredia _na úrovni OS_ (napr. nastavené v shelli) – namiesto toho použite príkazy `azd set env` a `azd get env` na prenos informácií v rámci skriptov.


Skúsme niekoľko príkazov:

1. Získajte všetky premenné prostredia nastavené pre `azd` v tomto prostredí:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Uvidíte niečo také:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Získajte konkrétnu hodnotu – napríklad chcem vedieť, či sme nastavili hodnotu `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Uvidíte niečo takéto – nebola nastavená predvolene!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Nastavte novú premennú prostredia pre `azd`. Tu upravujeme názov modelu agenta. _Poznámka: všetky zmeny sa okamžite odrazia v súbore `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Teraz by sme mali vidieť, že hodnota je nastavená:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Niektoré zdroje sú trvalé (napr. nasadenia modelov) a bude na ne potrebné viac než len príkaz `azd up` na vynútenie opätovného nasadenia. Skúsme odstrániť pôvodné nasadenie a znova nasadiť so zmenenými premennými prostredia.

1. **Obnoviť** Ak ste predtým nasadili infraštruktúru pomocou šablóny azd – môžete _obnoviť_ stav vašich lokálnych premenných prostredia na základe aktuálneho stavu nasadenia vo Azure pomocou tohto príkazu:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Toto je silný spôsob, ako _synchronizovať_ premenné prostredia cez dva alebo viac lokálnych vývojových prostredí (napr. tím s viacerými vývojármi) - čo umožňuje, aby nasadená infraštruktúra slúžila ako základná pravda pre stav premenných prostredia. Členovia tímu jednoducho _obnovia_ premenné, aby sa opäť zosynchronizovali.

---

## 9. Gratulujeme 🏆

Práve ste dokončili komplexný pracovný postup, v ktorom ste:

- [X] Vybrali šablónu AZD, ktorú chcete použiť
- [X] Otvorili šablónu v podporovanom vývojovom prostredí
- [X] Nasadili šablónu a overili, že funguje

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->