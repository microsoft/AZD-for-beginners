# 6. Infrastruktúra lebontása

!!! tip "A MODUL VÉGÉRE KÉPES LESZ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bónusz gyakorlatok

Mielőtt lebontanánk a projektet, szánjon néhány percet nyitott végű felfedezésre.

!!! info "Próbálja ki ezeket a felfedező kérdéseket"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Infra leszerelése

!!! warning "Ha Ön szintén elvégezte a GA hosztolt ügynök gyakorlatot"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Az infrastruktúra leszerelése egyszerűen:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Erősítse meg a kiválasztott környezetet, és tekintse át a törlendő erőforrásokat. Ez eltávolítja az Azure erőforrásokat és adatokat is veszthet. Tartsa meg az megerősítő promptot ehhez a tanulási munkafolyamathoz. A folyamat végén hasonló kimenetet lát:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Ellenőrizze a törlést a portálon, és nézze meg, vannak-e az üzembe helyezés hatókörén kívüli erőforrások. A költségjelentés és a kvótafrissítés késhet. A helyi `.azure` konfiguráció megmarad, kivéve, ha kifejezetten eltávolítja azt.

1. Az `azd down --purge` további kéréseket tesz a támogatott, puha törölt erőforrások végleges törlésére. Csak akkor használja, amikor nincs szükség visszaállításra, és érti a megőrzési/tisztításvédelmi szabályokat. Nem garantálja az azonnali kvóta felszabadítást.

1. Ne telepítse újra csak a tisztítás ellenőrzésére. Egy későbbi szándékos `azd up` újra létrehozhatja az erőforrásokat a megmaradt helyi bemenetek alapján, és ismét díjköteles lesz. A modellfrissítések általában támogatott provisioning változásokat használnak, nem lebontást.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->