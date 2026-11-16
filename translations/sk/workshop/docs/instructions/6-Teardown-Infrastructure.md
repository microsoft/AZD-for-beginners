# 6. Odstraňovanie infraštruktúry

!!! tip "NA KONCI TOHTO MODULU BUDETE SCHOPNÍ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusové cvičenia

Predtým, než projekt odstránime, venujte niekoľko minút voľnému skúmaniu.

!!! info "Vyskúšajte tieto námety na skúmanie"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Odprovízia infraštruktúry

1. Odstraňovanie infraštruktúry je také jednoduché ako:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Potvrďte vybrané prostredie a skontrolujte zdroje, ktoré budú vymazané. Toto odstráni Azure zdroje a môže zničiť dáta. Pre tento učebný proces si ponechajte výzvu na potvrdenie. Po dokončení uvidíte podobný výstup:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Overte zmazanie na portáli a skontrolujte zdroje mimo rozsah nasadenia. Hlásenie nákladov a aktualizácie kvót môžu meškať. Lokálna konfigurácia `.azure` zostáva, pokiaľ ju výslovne neodstránite.

1. `azd down --purge` navyše žiada o trvalé vymazanie podporovaných soft-delete zdrojov. Používajte ho len keď nie je potrebné zotavenie a rozumiete pravidlám uchovávania/ochrany pred vymazaním. Nezaručuje okamžité uvoľnenie kvót.

1. Neznovu nasadzujte len na overenie vyčistenia. Neskoršie zámerné `azd up` môže znova vytvoriť zdroje s použitím zostávajúcich lokálnych vstupov a opäť vzniknú poplatky. Aktualizácie modelu bežne používajú podporované zmeny provisioning, nie odstraňovanie.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->