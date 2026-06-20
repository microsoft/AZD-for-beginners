# 6. Odstranitev infrastrukture

!!! tip "NA KONCU TEGA MODULA BOSTE ZMOGLI"

    - [ ] Razumeti pomen čiščenja virov in upravljanja stroškov
    - [ ] Uporabiti `azd down` za varno odstranitev infrastrukture
    - [ ] Po potrebi obnoviti mehko izbrisane Azure AI Services
    - [ ] **Laboratorij 6:** Očistiti Azure vire in preveriti odstranitev

---

## Bonus Exercises

Preden odstranimo projekt, si vzemite nekaj minut za odprto raziskovanje.

!!! info "Preizkusite te raziskovalne pozive"

    **Eksperimentirajte z GitHub Copilotom:**
    
    1. Ask: `Katere druge AZD predloge bi lahko preizkusil za večagentne scenarije?`
    2. Ask: `Kako lahko prilagodim navodila agenta za zdravstveno uporabo?`
    3. Ask: `Katere okoljske spremenljivke nadzirajo optimizacijo stroškov?`
    
    **Raziščite Azure Portal:**
    
    1. Preglejte metrike Application Insights za vašo namestitev
    2. Preverite analizo stroškov za zagotovljene vire
    3. Raziskujte igrišče agentov v portalu Microsoft Foundry še enkrat

---

## Odstranitev infrastrukture

1. Odstranitev infrastrukture je preprosta:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Neobvezno) Če zdaj ponovno zaženete `azd up`, boste opazili, da se model `gpt-4.1` namesti, ker je bila spremenjena okoljska spremenljivka (in shranjena) v lokalni mapi `.azure`. 

      Tukaj so namestitve modelov **pred**:

      ![Začetno](../../../../../translated_images/sl/14-deploy-initial.30e4cf1c29b587bc.webp)

      In tukaj so **po**:
      ![Novo](../../../../../translated_images/sl/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->