# 2. Overiť šablónu

!!! tip "NA KONCI TOHTO MODULU BUDETE SCHOPNÍ"

    - [ ] Analyzovať architektúru AI riešenia
    - [ ] Pochopiť pracovný postup nasadenia AZD
    - [ ] Použiť GitHub Copilot na pomoc pri používaní AZD
    - [ ] **Cvičenie 2:** Nasadiť a overiť šablónu AI Agentov

---


## 1. Úvod

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` je open-source nástroj príkazového riadku, ktorý zjednodušuje vývojárske pracovné toky pri vytváraní a nasadzovaní aplikácií do Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sú štandardizované repozitáre, ktoré zahŕňajú ukážkový aplikačný kód, assets typu _infrastructure-as-code_ a konfiguračné súbory `azd` pre súdržnú architektúru riešenia. Provisioning infraštruktúry sa stáva tak jednoduchým ako príkaz `azd provision` - pričom použitie `azd up` vám umožní naraz provisionovať infraštruktúru **a** nasadiť vašu aplikáciu!

V dôsledku toho môže byť rýchly štart vývoja vašej aplikácie tak jednoduchý, ako nájsť vhodnú _AZD Starter šablónu_, ktorá najviac vyhovuje vašim požiadavkám na aplikáciu a infraštruktúru - a potom upraviť repozitár podľa požiadaviek vášho scenára.

Predtým než začneme, uistime sa, že máte nainštalovaný Azure Developer CLI.

1. Open a VS Code terminal and type this command:

      ```bash title="" linenums="0"
      azd version
      ```

1. Mali by ste vidieť niečo takéto!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Teraz ste pripravení vybrať a nasadiť šablónu s azd**

---

## 2. Výber šablóny

Platforma Microsoft Foundry prináša [súbor odporúčaných šablón AZD](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), ktoré pokrývajú populárne scenáre riešení ako _automatizácia pracovných postupov s viacerými agentmi_ a _spracovanie multimodálneho obsahu_. Tieto šablóny môžete tiež objaviť návštevou portálu Microsoft Foundry.

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Pri výzve sa prihláste do portálu Microsoft Foundry - uvidíte niečo takéto.

![Vybrať](../../../../../translated_images/sk/01-pick-template.60d2d5fff5ebc374.webp)


Možnosti **Basic** sú vaše štartovacie šablóny:

1. [ ] [Začíname s AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) ktorá nasadí základnú chatovú aplikáciu _s vašimi dátami_ do Azure Container Apps. Použite to na preskúmanie základného scenára AI chatbota.
1. [X] [Začíname s AI Agentmi](https://github.com/Azure-Samples/get-started-with-ai-agents) ktorá tiež nasadí štandardného AI Agenta (s Foundry Agents). Použite toto na zoznámenie sa s agentickými AI riešeniami zahŕňajúcimi nástroje a modely.

Navštívte druhý odkaz v novej karte prehliadača (alebo kliknite na `Open in GitHub` pre príslušnú kartu). Mali by ste vidieť repozitár tejto AZD šablóny. Venujte minútu preskúmaniu README. Architektúra aplikácie vyzerá takto:

![Architektúra](../../../../../translated_images/sk/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivácia šablóny

Poďme skúsiť nasadiť túto šablónu a uistiť sa, že je platná. Budeme nasledovať usmernenia v sekcii [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Kliknite na [tento odkaz](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - potvrďte predvolenú akciu `Create codespace`
1. Otvorí sa nová karta prehliadača - počkajte, kým sa relácia GitHub Codespaces dokončí načítanie
1. Otvorte terminál VS Code v Codespaces - zadajte nasledujúci príkaz:

   ```bash title="" linenums="0"
   azd up
   ```

Dokončite kroky pracovného postupu, ktoré to spustí:

1. Zobrazí sa výzva na prihlásenie do Azure - postupujte podľa inštrukcií na autentifikáciu
1. Zadajte jedinečný názov prostredia pre seba - napr., ja som použil `nitya-mshack-azd`
1. Toto vytvorí priečinok `.azure/` - uvidíte podpriečinok s názvom prostredia
1. Zobrazí sa výzva na výber názvu predplatného - vyberte predvolené
1. Zobrazí sa výzva na výber lokality - použite `East US 2`

Teraz čakáte, kým sa provisioning dokončí. **Toto trvá 10-15 minút**

1. Keď to bude hotové, vaša konzola ukáže správu SUCCESS ako táto:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Váš Azure Portal bude mať teraz provisionovanú skupinu prostriedkov s týmto názvom prostredia:

      ![Infraštruktúra](../../../../../translated_images/sk/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Teraz ste pripravení overiť nasadenú infraštruktúru a aplikáciu**.

---

## 4. Overenie šablóny

1. Navštívte stránku Azure Portal [Skupiny prostriedkov](https://portal.azure.com/#browse/resourcegroups) - pri výzve sa prihláste
1. Kliknite na RG pre názov vášho prostredia - uvidíte stránku vyššie

      - kliknite na zdroj Azure Container Apps
      - kliknite na Application Url v sekcii _Essentials_ (pravý horný roh)

1. Mali by ste vidieť hostené front-end UI aplikácie ako táto:

   ![Aplikácia](../../../../../translated_images/sk/03-test-application.471910da12c3038e.webp)

1. Skúste položiť pár [ukážkových otázok](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Opýtajte sa: ```Aké je hlavné mesto Francúzska?``` 
      1. Opýtajte sa: ```Ktorý stan do $200 je najlepší pre dve osoby a aké funkcie obsahuje?```

1. Mali by ste dostať odpovede podobné tým, ktoré sú zobrazené nižšie. _Ale ako to funguje?_ 

      ![Aplikácia](../../../../../translated_images/sk/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Overenie agenta

Azure Container App nasadí koncový bod, ktorý sa pripája na AI Agenta provisionovaného v projekte Microsoft Foundry pre túto šablónu. Pozrime sa, čo to znamená.

1. Vráťte sa na stránku Prehľad v Azure Portal pre vašu skupinu prostriedkov

1. Kliknite v zozname na zdroj `Microsoft Foundry`

1. Mali by ste toto vidieť. Kliknite na tlačidlo `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/sk/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Mali by ste vidieť stránku Foundry Project pre vašu AI aplikáciu
   ![Projekt](../../../../../translated_images/sk/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kliknite na `Agents` - uvidíte predvoleného agenta provisionovaného vo vašom projekte
   ![Agentí](../../../../../translated_images/sk/06-visit-agents.bccb263f77b00a09.webp)

1. Vyberte ho - a uvidíte detaily Agenta. Všimnite si nasledujúce:

      - Agent používa File Search predvolene (vždy)
      - Agent `Knowledge` indikuje, že má nahratých 32 súborov (pre file search)
      ![Agentí](../../../../../translated_images/sk/07-view-agent-details.0e049f37f61eae62.webp)

1. Hľadajte možnosť `Data+indexes` v ľavom menu a kliknite pre detaily. 

      - Mali by ste vidieť 32 dátových súborov nahratých pre knowledge.
      - Tieto budú zodpovedať 12 súborom zákazníkov a 20 súborom produktov v `src/files` 
      ![Dáta](../../../../../translated_images/sk/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Overili ste fungovanie agenta!** 

1. Odpovede agenta sú podložené znalosťami v týchto súboroch. 
1. Teraz môžete klásť otázky súvisiace s týmito dátami a získať podložené odpovede.
1. Príklad: `customer_info_10.json` popisuje 3 nákupy vykonané "Amanda Perez"

Vráťte sa na kartu prehliadača s koncovým bodom Container App a opýtajte sa: `Aké produkty vlastní Amanda Perez?`. Mali by ste vidieť niečo takéto:

![Dáta](../../../../../translated_images/sk/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Poďme si vybudovať trochu viac intuície pre schopnosti Microsoft Foundry tým, že agenta vyskúšame v Agents Playground. 

1. Vráťte sa na stránku `Agents` v Microsoft Foundry - vyberte predvoleného agenta
1. Kliknite na možnosť `Try in Playground` - mali by ste dostať UI Playground ako toto
1. Opýtajte sa rovnakú otázku: `Aké produkty vlastní Amanda Perez?`

    ![Dáta](../../../../../translated_images/sk/09-ask-in-playground.a1b93794f78fa676.webp)

Dostanete rovnakú (alebo podobnú) odpoveď - ale tiež získate ďalšie informácie, ktoré môžete použiť na porozumenie kvality, nákladov a výkonu vašej agentickej aplikácie. Napríklad:

1. Všimnite si, že odpoveď cituje dátové súbory použité na "podloženie" odpovede
1. Najazdite myšou nad niektorý z týchto štítkov súborov - zodpovedajú dáta vašej otázke a zobrazenej odpovedi?

Tiež vidíte riadok _stats_ pod odpoveďou. 

1. Najazdite myšou nad ktorýkoľvek metrík - napr., Safety. Uvidíte niečo takéto
1. Zodpovedá posúdené hodnotenie vašej intuícii o úrovni bezpečnosti odpovede?

      ![Dáta](../../../../../translated_images/sk/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Vstavaná pozorovateľnosť

Pozorovateľnosť je o inštrumentovaní vašej aplikácie tak, aby generovala údaje, ktoré je možné použiť na pochopenie, ladenie a optimalizáciu jej činnosti. Aby ste získali predstavu o tom:

1. Kliknite na tlačidlo `View Run Info` - mali by ste vidieť tento pohľad. Toto je príklad [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) v akcii. _Tento pohľad môžete získať aj kliknutím na Thread Logs v hornom menu_.

   - Získajte prehľad o krokoch behu a nástrojoch zapojených agentom
   - Pochopte celkový počet Tokenov (vs. použitie výstupných tokenov) pre odpoveď
   - Pochopte latenciu a kde sa čas trávi pri vykonávaní

      ![Agent](../../../../../translated_images/sk/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kliknite na kartu `Metadata`, aby ste videli ďalšie atribúty behu, ktoré môžu poskytnúť užitočný kontext pre ladenie problémov neskôr.   

      ![Agent](../../../../../translated_images/sk/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kliknite na kartu `Evaluations`, aby ste videli automatické hodnotenia vykonané nad odpoveďou agenta. Tieto zahŕňajú hodnotenia bezpečnosti (napr. Sebapoškodzovanie) a hodnotenia špecifické pre agenta (napr. Rozpoznanie zámeru, Dodržanie úlohy).

      ![Agent](../../../../../translated_images/sk/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Nakoniec kliknite na kartu `Monitoring` v bočnom menu.

      - Vyberte kartu `Resource usage` na zobrazené stránke - a prezerajte metriky.
      - Sledujte používanie aplikácie z hľadiska nákladov (tokeny) a zaťaženia (požiadavky).
      - Sledujte latenciu aplikácie až po prvý bajt (spracovanie vstupu) a posledný bajt (výstup).

      ![Agent](../../../../../translated_images/sk/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Premenné prostredia

Doteraz sme prešli nasadením v prehliadači - a overili, že naša infraštruktúra je provisionovaná a aplikácia je funkčná. Ale aby sme pracovali s aplikáciou _kódom najprv_, potrebujeme nakonfigurovať naše lokálne vývojové prostredie s príslušnými premennými potrebnými na prácu s týmito prostriedkami. Použitie `azd` to uľahčuje.

1. The Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) na ukladanie a správu konfiguračných nastavení pre nasadenia aplikácií.

1. Premenné prostredia sú uložené v `.azure/<env-name>/.env` - toto ich obmedzí na prostredie `env-name` použité počas nasadenia a pomáha izolovať prostredia medzi rôznymi cieľmi nasadenia v tom istom repozitári.

1. Premenné prostredia sú automaticky načítané príkazom `azd` vždy, keď vykoná konkrétny príkaz (napr., `azd up`). Poznámka: `azd` automaticky nečíta _OS-level_ premenné prostredia (napr. nastavené v shelli) - namiesto toho použite `azd set env` a `azd get env` na prenos informácií v skriptoch.


Poďme vyskúšať niekoľko príkazov:

1. Získajte všetky premenné prostredia nastavené pre `azd` v tomto prostredí:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Uvidíte niečo takéto:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Získajte konkrétnu hodnotu - napr., chcem vedieť, či sme nastavili hodnotu `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Uvidíte niečo takéto - nebola nastavená predvolene!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Nastavte novú premennú prostredia pre `azd`. Tu aktualizujeme názov modelu agenta. _Poznámka: všetky vykonané zmeny sa okamžite prejavia v súbore `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Teraz by sme mali nájsť hodnotu nastavenú:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Všimnite si, že niektoré prostriedky sú perzistentné (napr. nasadenia modelov) a budú vyžadovať viac než len `azd up` na vynútenie opätovného nasadenia. Poďme skúsiť rozobrať pôvodné nasadenie a znovu nasadiť s upravenými env premennými.

1. **Obnoviť** Ak ste už predtým nasadili infraštruktúru pomocou azd šablóny - môžete _obnoviť_ stav vašich lokálnych premenných prostredia na základe aktuálneho stavu vášho Azure nasadenia pomocou tohto príkazu:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Toto je výkonný spôsob, ako _synchronizovať_ premenné prostredia medzi dvoma alebo viacerými lokálnymi vývojovými prostrediami (napr. tím s viacerými vývojármi) - umožňujúc nasadenej infraštruktúre slúžiť ako zdroj pravdy pre stav premenných prostredia. Členovia tímu jednoducho _obnovia_ premenné, aby sa znovu zosynchronizovali.

---

## 9. Gratulujeme 🏆

Práve ste dokončili kompletný pracovný tok, v ktorom ste:

- [X] Vybrali ste AZD Template, ktorý chcete použiť
- [X] Spustili ste šablónu pomocou GitHub Codespaces 
- [X] Nasadili ste šablónu a overili, že funguje

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o vylúčení zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladovej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, majte, prosím, na pamäti, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za rozhodujúci zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->