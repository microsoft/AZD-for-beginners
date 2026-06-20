# 6. Odstranění infrastruktury

!!! tip "NA KONCI TOHOTO MODULU BUDETE SCHOPNI"

    - [ ] Porozumět důležitosti úklidu prostředků a řízení nákladů
    - [ ] Použít `azd down` k bezpečnému odstranění infrastruktury
    - [ ] Obnovit dočasně smazané služby Azure AI, pokud je to potřeba
    - [ ] **Cvičení 6:** Vyčistit prostředky Azure a ověřit jejich odstranění

---

## Bonusová cvičení

Než projekt ukončíme, věnujte pár minut otevřenému průzkumu.

!!! info "Vyzkoušejte tyto průzkumné podněty"

    **Experimentujte s GitHub Copilotem:**
    
    1. Zeptejte se: `Jaké další šablony AZD bych mohl vyzkoušet pro scénáře s více agenty?`
    2. Zeptejte se: `Jak mohu přizpůsobit instrukce agenta pro použití ve zdravotnictví?`
    3. Zeptejte se: `Které proměnné prostředí ovlivňují optimalizaci nákladů?`
    
    **Prozkoumejte Azure Portal:**
    
    1. Zkontrolujte metriky Application Insights pro vaše nasazení
    2. Zkontrolujte analýzu nákladů pro nasazené prostředky
    3. Ještě jednou prozkoumejte playground pro agenty v portálu Microsoft Foundry

---

## Zrušení infrastruktury

1. Zrušení infrastruktury je tak jednoduché jako:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Přepínač `--purge` zajistí také vyčištění dočasně smazaných prostředků Cognitive Service, čímž uvolní kvóty držené těmito prostředky. Po dokončení uvidíte něco takového:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Volitelné) Pokud nyní znovu spustíte `azd up`, všimnete si, že se nasadí model gpt-4.1, protože proměnná prostředí byla změněna (a uložena) v místní složce `.azure`. 

      Here is the model deployments **before**:

      ![Původní](../../../../../translated_images/cs/14-deploy-initial.30e4cf1c29b587bc.webp)

      And here it is **after**:
      ![Nové](../../../../../translated_images/cs/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->