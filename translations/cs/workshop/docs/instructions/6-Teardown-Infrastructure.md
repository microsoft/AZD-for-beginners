# 6. Demontáž infrastruktury

!!! tip "KE KONCI TOHOTO MODULU BUDETE UMĚT"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusová cvičení

Ještě než projekt rozebereš, věnuj pár minut volnému průzkumu.

!!! info "Vyzkoušejte tyto průzkumné podněty"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Odprovisionování infrastruktury

!!! warning "Pokud jste také dokončili cvičení s GA hosted-agentem"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Demontáž infrastruktury je tak jednoduchá jako:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Potvrďte vybrané prostředí a zkontrolujte zdroje k odstranění. Toto odstraní Azure zdroje a může zničit data. Nechte si potvrzovací výzvu pro tento učební scénář. Po dokončení uvidíte výstup podobný:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Ověřte odstranění v portálu a zkontrolujte zdroje mimo rozsah nasazení. Reportování nákladů a aktualizace kvót mohou mít zpoždění. Lokální `.azure` konfigurace zůstává, pokud ji výslovně neodstraníte.

1. `azd down --purge` navíc požaduje trvalé smazání podporovaných soft-delete zdrojů. Používejte ji pouze, když není potřeba obnovit a rozumíte zásadám uchovávání/ochrany proti odstranění. Nezaručuje okamžité uvolnění kvóty.

1. Nepřeinstalovávejte jen kvůli ověření vyčištění. Pozdější úmyslná `azd up` může znovu vytvořit zdroje pomocí zbývajících lokálních vstupů a opět účtuje poplatky. Aktualizace modelu obvykle používají podporované změny provisioning, ne demontáž.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->