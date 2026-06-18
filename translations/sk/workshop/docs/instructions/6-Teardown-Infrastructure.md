# 6. Odstránenie infraštruktúry

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] Pochopiť dôležitosť vyčistenia prostriedkov a riadenia nákladov
    - [ ] Použiť `azd down` na bezpečné odstránenie infraštruktúry
    - [ ] Obnoviť soft-deleteované Azure AI Services v prípade potreby
    - [ ] **Laboratórium 6:** Vyčistiť Azure zdroje a overiť odstránenie

---

## Bonusové cvičenia

Predtým, než projekt odstránime, venujte niekoľko minút otvorenému preskúmaniu.

!!! info "Try These Exploration Prompts"

    **Experimentujte s GitHub Copilot:**
    
    1. Opýtajte sa: `Aké ďalšie AZD šablóny by som mohol vyskúšať pre scenáre s viacerými agentmi?`
    2. Opýtajte sa: `Ako môžem prispôsobiť inštrukcie agenta pre prípad použitia v zdravotnej starostlivosti?`
    3. Opýtajte sa: `Ktoré premenné prostredia riadia optimalizáciu nákladov?`
    
    **Preskúmajte Azure Portal:**
    
    1. Preskúmajte metriky Application Insights pre vaše nasadenie
    2. Skontrolujte analýzu nákladov pre nasadené zdroje
    3. Preskúmajte portál Microsoft Foundry a jeho agent playground ešte raz

---

## Odstránenie infraštruktúry

1. Odstránenie infraštruktúry je také jednoduché ako:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Prepínač `--purge` zabezpečí, že vymaže aj soft-deleteované zdroje Cognitive Service, čím uvoľní kvótu, ktorú tieto zdroje zaberajú. Po dokončení uvidíte niečo takéto:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Voliteľné) Ak teraz znovu spustíte `azd up`, všimnete si, že sa nasadí model gpt-4.1, pretože sa zmenila (a uložila) premenná prostredia v lokálnom `.azure` priečinku. 

      Tu sú nasadenia modelu **pred**:

      ![Pôvodné](../../../../../translated_images/sk/14-deploy-initial.30e4cf1c29b587bc.webp)

      A tu je **po**:
      ![Nové](../../../../../translated_images/sk/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->