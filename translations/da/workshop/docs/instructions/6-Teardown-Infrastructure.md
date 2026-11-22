# 6. Nedtagning af Infrastruktur

!!! tip "VED SLUTNINGEN AF DETTE MODUL VIL DU VÆRE I STAND TIL"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusøvelser

Før vi nedtager projektet, skal du tage et par minutter til at lave nogle åbne udforskninger.

!!! info "Prøv disse udforskningsforslag"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Nedluk Infrastruktur

!!! warning "Hvis du også har gennemført øvelsen med GA hostet-agent"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Nedtagning af infrastrukturen er lige så let som:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Bekræft det valgte miljø og gennemgå de ressourcer, der skal slettes. Dette fjerner Azure-ressourcer og kan ødelægge data. Behold bekræftelsesprompten for denne læringsworkflow. Når det er færdigt, vil du se output som:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verificer sletning i portalen og tjek for ressourcer uden for deployment-omfanget. Omkostningsrapportering og kvotopdateringer kan være forsinkede. Lokal `.azure` konfiguration forbliver medmindre du eksplicit fjerner den.

1. `azd down --purge` anmoder desuden om permanent sletning af understøttede blødt-slettede ressourcer. Brug det kun, når genoprettelse ikke er nødvendig, og du forstår politikker for opbevaring/udryddelsesbeskyttelse. Det garanterer ikke øjeblikkelig frigivelse af kvote.

1. Genudrul ikke bare for at bekræfte oprydning. En senere tilsigtet `azd up` kan genskabe ressourcer ved hjælp af de resterende lokale inputs og påfører omkostninger igen. Modelopdateringer bruger normalt understøttede provisioning-ændringer, ikke nedtagning.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->