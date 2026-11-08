# 6. Infrastructuur afbreken

!!! tip "AAN HET EINDE VAN DEZE MODULE KUN JE"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonus Oefeningen

Voordat we het project afbreken, neem een paar minuten om wat open verkenning te doen.

!!! info "Probeer Deze Verkenningsvragen"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Infra deprovisie

1. Het afbreken van infrastructuur is zo eenvoudig als:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Bevestig de geselecteerde omgeving en controleer de resources die verwijderd worden. Dit verwijdert Azure-resources en kan data vernietigen. Houd de bevestigingsprompt voor deze leerworkflow aan. Zodra voltooid zie je output vergelijkbaar met:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Controleer de verwijdering in het portaal en controleer op resources buiten de scope van de implementatie. Kostenrapportage en quotaupdates kunnen vertraging oplopen. Lokale `.azure` configuratie blijft behouden tenzij je die expliciet verwijdert.

1. `azd down --purge` vraagt ook om permanente verwijdering van ondersteunde soft-verwijderde resources. Gebruik dit alleen als herstel niet vereist is en je de bewaarbeleid/opschoningsbescherming begrijpt. Het garandeert geen onmiddellijke vrijgave van quotum.

1. Voer geen herimplementatie uit alleen om de opruiming te verifiëren. Een latere bewuste `azd up` kan resources opnieuw aanmaken met de resterende lokale inputs, en brengt opnieuw kosten met zich mee. Modelupdates gebruiken normaal gesproken ondersteunde wijzigingswijzen voor provisioning, niet afbreken.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->