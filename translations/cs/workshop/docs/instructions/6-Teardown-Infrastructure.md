# 6. Demontáž infrastruktury

!!! tip "NA KONCI TOHOTO MODULU BUDETE SCHOPNI"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusové cvičení

Než projekt rozebereš, věnuj pár minut otevřenému průzkumu.

!!! info "Vyzkoušejte tyto podněty pro průzkum"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Ukončení infrastruktury

1. Demontáž infrastruktury je tak jednoduchá jako:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Potvrďte vybrané prostředí a zkontrolujte zdroje, které mají být smazány. Tím odstraníte Azure zdroje a může dojít ke ztrátě dat. V tomto učebním pracovním postupu ponechte výzvu k potvrzení. Po dokončení uvidíte podobný výstup:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Ověřte smazání v portálu a zkontrolujte zdroje mimo rozsah nasazení. Reportování nákladů a aktualizace kvót mohou mít zpoždění. Lokální `.azure` konfigurace zůstává, pokud ji explicitně neodstraníte.

1. `azd down --purge` dále požaduje trvalé smazání podporovaných zdrojů, které jsou označeny jako měkké smazané. Použijte jej pouze, pokud není potřeba obnovit data a rozumíte zásadám uchovávání/ochrany před vymazáním. Nezaručuje okamžité uvolnění kvóty.

1. Nepřenasazujte jen kvůli ověření vyčištění. Pozdější záměrná `azd up` může znovu vytvořit zdroje pomocí zbývajících lokálních vstupů a opět vyvolá poplatky. Aktualizace modelu obvykle využívají podporované změny zajištění, ne demontáž.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->