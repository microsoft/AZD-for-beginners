# 6. Razstavljanje infrastrukture

!!! tip "NA KONCU TEGA MODULA BOSTE ZMOGLI"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Dodatne vaje

Preden razstavite projekt, si vzemite nekaj minut za odprto raziskovanje.

!!! info "Poskusite te raziskovalne iztočnice"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Odstranitev infrastrukture

1. Razstavljanje infrastrukture je enostavno:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Potrdite izbrano okolje in preglejte vire, ki jih je treba izbrisati. To odstrani Azure vire in lahko uniči podatke. Obdržite potrditveni poziv za ta učni potek. Ko je končano, boste videli izhod, podoben temu:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Preverite izbris v portalu in preverite vire zunaj obsega namestitve. Poročanje stroškov in posodobitve kvot lahko zamujajo. Lokalna konfiguracija `.azure` ostane, razen če jo izrecno odstranite.

1. `azd down --purge` dodatno zahteva trajni izbris podprtih mehko izbrisanih virov. Uporabite ga samo, ko ni potrebna obnovitev in ko razumete politike shranjevanja/zaščite pred čiščenjem. Ne zagotavlja takojšnje sprostitve kvote.

1. Ne ponovno uvajajte samo za preverjanje čiščenja. Kasnejši namerni `azd up` lahko znova ustvari vire z uporabo preostalih lokalnih vhodov in spet povzroči stroške. Posodobitve modela običajno uporabljajo podprte spremembe namestitve, ne razstavljanja.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->