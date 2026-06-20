# 6. Rastavljanje infrastrukture

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Razumjeti važnost čišćenja resursa i upravljanja troškovima
    - [ ] Koristiti `azd down` za sigurno ukidanje infrastrukture
    - [ ] Povratiti soft-obrisane Azure AI usluge ako je potrebno
    - [ ] **Laboratorij 6:** Očistiti Azure resurse i potvrditi uklanjanje

---

## Bonus vježbe

Prije nego što rastavimo projekt, odvojite nekoliko minuta za otvoreno istraživanje.

!!! info "Isprobajte ove poticaje za istraživanje"

    **Eksperimentirajte s GitHub Copilot:**
    
    1. Pitajte: `Koje druge AZD predloške bih mogao isprobati za scenarije s više agenata?`
    2. Pitajte: `Kako mogu prilagoditi upute agenta za slučaj upotrebe u zdravstvu?`
    3. Pitajte: `Koje varijable okruženja kontroliraju optimizaciju troškova?`
    
    **Istražite Azure Portal:**
    
    1. Pregledajte metrike Application Insights za vašu implementaciju
    2. Provjerite analizu troškova za osigurane resurse
    3. Još jednom istražite Microsoft Foundry portal agent playground

---

## Ukidanje infrastrukture

1. Rastavljanje infrastrukture je jednostavno kao:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Zastavica `--purge` osigurava da se također izbrišu soft-obrisani resursi Cognitive Servica, čime se oslobađa kvota koju ti resursi drže. Kada završi, vidjet ćete nešto poput ovoga:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opcionalno) Ako sada ponovno pokrenete `azd up`, primijetit ćete da se model gpt-4.1 implementira jer je varijabla okruženja promijenjena (i spremljena) u lokalnoj mapi `.azure`.

      Evo implementacija modela **prije**:

      ![Initial](../../../../../translated_images/hr/14-deploy-initial.30e4cf1c29b587bc.webp)

      A ovako je **poslije**:
      ![New](../../../../../translated_images/hr/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->