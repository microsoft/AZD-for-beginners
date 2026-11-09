# 6. Infrastruktúra lebontása

!!! tip "A MODUL VÉGÉRE KÉPES LESZEL"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bónusz feladatok

Mielőtt lebontanánk a projektet, szánj néhány percet szabad feltáró tevékenységre.

!!! info "Próbáld ki ezeket a feltáró kérdéseket"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Infrastruktúra eltávolítása

1. Az infrastruktúra lebontása egyszerű:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Erősítsd meg a kiválasztott környezetet, és tekintsd át a törlendő erőforrásokat. Ez eltávolítja az Azure erőforrásokat, és adatokat törölhet. Tartsd meg a megerősítő üzenetet ehhez a tanulási folyamathoz. A befejezés után hasonló kimenetet fogsz látni:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Ellenőrizd a törlést a portálon, és keresd meg a telepítés körén kívüli erőforrásokat. A költségjelentés és a kvóta-frissítések késhetnek. A helyi `.azure` konfiguráció megmarad, hacsak nem törlöd kifejezetten.

1. Az `azd down --purge` továbbá kéri a támogatott, lágyan törölt erőforrások végleges törlését. Csak akkor használd, ha nincs szükség a helyreállításra, és ismered a megőrzési / törlési védelmi szabályzatokat. Nem garantálja a kvóta azonnali felszabadulását.

1. Ne telepítsd újra csak a takarítás ellenőrzése miatt. Egy későbbi szándékos `azd up` újra létrehozhatja az erőforrásokat a megmaradt helyi bemenetek felhasználásával, és újra költségekkel jár. A modellfrissítések általában támogatott szolgáltatásváltoztatásokat használnak, nem lebontást.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->