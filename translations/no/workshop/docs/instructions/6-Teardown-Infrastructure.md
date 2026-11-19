# 6. Nedbygging av infrastruktur

!!! tip "ETTER DETTE MODULEN VIL DU KUNNE"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusoppgaver

Før vi river ned prosjektet, ta noen minutter til å gjøre litt åpen utforskning.

!!! info "Prøv disse utforskningsspørsmålene"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Avvikle infrastruktur

!!! warning "Hvis du også fullførte øvelsen med GA hosted-agent"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Nedbygging av infrastruktur er så enkelt som:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Bekreft valgt miljø og gjennomgå ressursene som skal slettes. Dette fjerner Azure-ressurser og kan ødelegge data. Behold bekreftelsesprompten for denne læringsprosessen. Når dette er gjort ser du output som ligner på:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verifiser sletting i portalen og sjekk etter ressurser utenfor deployeringens omfang. Kostnadsrapportering og kvoteoppdateringer kan ha forsinkelser. Lokal `.azure` konfigurasjon forblir med mindre du eksplisitt fjerner den.

1. `azd down --purge` ber også om permanent sletting av støttede mykt-slettede ressurser. Bruk den bare når gjenoppretting ikke er nødvendig og du forstår retningslinjer for oppbevaring/slettingsbeskyttelse. Det garanterer ikke umiddelbar kvoteutgivelse.

1. Ikke deploy på nytt bare for å verifisere opprydding. En senere bevisst `azd up` kan gjenopprette ressurser ved å bruke de gjenværende lokale inputene, og påløper kostnader på nytt. Modelloppdateringer bruker normalt støttede provisjoneringsendringer, ikke nedbygging.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->