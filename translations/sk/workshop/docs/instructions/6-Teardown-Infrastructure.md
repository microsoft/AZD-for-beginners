# 6. Demontáž infraštruktúry

!!! tip "NA KONCI TOHTO MODULU BUDETE SCHOPNÍ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusové cvičenia

Pred tým, než projekt rozoberiete, venujte pár minút voľnému skúmaniu.

!!! info "Vyskúšajte tieto podnety na skúmanie"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Deprovízia infraštruktúry

!!! warning "Ak ste tiež dokončili cvičenie s hosteným agentom GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Demontáž infraštruktúry je taká jednoduchá ako:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Potvrďte vybrané prostredie a skontrolujte zdroje, ktoré sa majú zmazať. Toto odstráni zdroje Azure a môže zničiť dáta. Pre tento učením riadený tok ponechajte výzvu na potvrdenie. Po dokončení uvidíte výstup podobný:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Overte zmazanie v portáli a skontrolujte zdroje mimo rozsahu nasadenia. Reportovanie nákladov a aktualizácie kvót môžu meškať. Lokálna konfigurácia `.azure` zostáva, pokiaľ ju výslovne neodstránite.

1. `azd down --purge` navyše žiada o trvalé zmazanie podporovaných soft-zmazaných zdrojov. Používajte ho iba vtedy, keď nie je potrebná obnova a keď rozumiete zásadám uchovávania/ochrany pred vyprázdnením. Nezaručuje okamžité uvoľnenie kvóty.

1. Neznovu nasadzujte len na overenie vyčistenia. Neskoršia zámerná `azd up` môže opätovne vytvoriť zdroje s použitím zostávajúcich lokálnych vstupov a opäť spôsobí poplatky. Aktualizácie modelu zvyčajne používajú podporované zmeny provisioningu, nie rozobratie.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->