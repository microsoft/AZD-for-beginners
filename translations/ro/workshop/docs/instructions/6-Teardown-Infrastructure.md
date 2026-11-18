# 6. Demontarea infrastructurii

!!! tip "LA SFÂRȘITUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Exerciții Bonus

Înainte de a demonta proiectul, ia câteva minute pentru a face o explorare deschisă.

!!! info "Încearcă aceste sugestii de explorare"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Deprovisionarea infrastructurii

!!! warning "Dacă ai finalizat și exercițiul cu agentul găzduit GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Demontarea infrastructurii este la fel de simplă precum:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Confirmă mediul selectat și verifică resursele care vor fi șterse. Aceasta elimină resursele Azure și poate distruge date. Păstrează promptul de confirmare pentru acest flux de învățare. Odată complet, vei vedea un output similar cu:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verifică ștergerea în portal și caută resurse din afara domeniului de aplicare al implementării. Raportarea costurilor și actualizările cotelor pot întârzia. Configurația locală `.azure` rămâne, cu excepția cazului în care o elimini explicit.

1. `azd down --purge` solicită în plus ștergerea permanentă a resurselor șterse soft suportate. Folosește-l doar când recuperarea nu este necesară și înțelegi politicile de retenție/protecție la ștergere. Nu garantează eliberarea imediată a cotei.

1. Nu redeploya doar pentru a verifica curățarea. O `azd up` intenționată mai târziu poate recrea resursele folosind intrările locale rămase și va genera din nou costuri. Actualizările modelelor folosesc în mod normal modificările de provisioning suportate, nu demontarea.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->