# 6. Uklanjanje infrastrukture

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonus vježbe

Prije nego što uklonite projekt, odvojite nekoliko minuta za slobodno istraživanje.

!!! info "Isprobajte ove poticaje za istraživanje"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Ukidanje infrastrukture

1. Uklanjanje infrastrukture je jednostavno kao:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Potvrdite odabrano okruženje i pregledajte resurse koji će biti izbrisani. Ovo uklanja Azure resurse i može uništiti podatke. Zadržite potvrdu za ovaj obrazovni proces. Kada je završeno, vidjet ćete sličan izlaz:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Provjerite brisanje na portalu i provjerite ima li resursa izvan opsega implementacije. Izvještavanje troškova i ažuriranja kvota mogu kasniti. Lokalne `.azure` konfiguracije ostaju osim ako ih eksplicitno ne uklonite.

1. `azd down --purge` dodatno traži trajno brisanje podržanih soft-obrisanih resursa. Koristite ga samo ako oporavak nije potreban i razumijete politike zadržavanja/zaštite od brisanja. Ne jamči trenutno oslobađanje kvote.

1. Nemojte ponovno implementirati samo da biste provjerili čišćenje. Kasnija namjerna `azd up` može ponovno stvoriti resurse koristeći preostale lokalne unose i ponovno će se naplaćivati. Ažuriranja modela obično koriste podržane promjene u opskrbi, a ne uklanjanje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->