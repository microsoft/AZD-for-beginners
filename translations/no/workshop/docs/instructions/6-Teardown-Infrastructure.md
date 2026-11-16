# 6. Nedbygging av Infrastruktur

!!! tip "ETTER DETTE MODULEN VIL DU KUNNE"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusutfordringer

Før vi river ned prosjektet, ta noen minutter til å gjøre litt åpen utforskning.

!!! info "Prøv disse utforskningsoppgavene"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Avvikle Infra

1. Å rive ned infrastrukturen er enkelt som følger:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Bekreft valgt miljø og gå gjennom ressursene som skal slettes. Dette fjerner Azure-ressurser og kan ødelegge data. Behold bekreftelsestilbudet for denne læringsflyten. Når det er fullført vil du se output som ligner på:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verifiser slettingen i portalen og sjekk etter ressurser utenfor distribusjonens omfang. Kostnadsrapportering og kvoteoppdateringer kan ha forsinkelse. Lokal `.azure` konfigurasjon forblir med mindre du eksplisitt fjerner den.

1. `azd down --purge` forespør i tillegg permanent sletting av støttede myk-slettede ressurser. Bruk den kun når gjenoppretting ikke er nødvendig og du forstår regler for oppbevaring/slettingsbeskyttelse. Det garanterer ikke umiddelbar kvotefrigivelse.

1. Ikke distribuer på nytt bare for å verifisere opprydding. En senere bevisst `azd up` kan gjenopprette ressurser ved å bruke de gjenværende lokale parameterne, og påløper kostnader på nytt. Modelloppdateringer bruker vanligvis støttede provisioning-endringer, ikke nedbygging.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->