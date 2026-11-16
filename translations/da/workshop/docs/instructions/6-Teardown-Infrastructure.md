# 6. Nedrivning af Infrastruktur

!!! tip "SIDST I DETTE MODUL VIL DU VÆRE I STAND TIL AT"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusøvelser

Før vi nedriver projektet, så tag et par minutter til at lave lidt åben udforskning.

!!! info "Prøv Disse Udforskningsforslag"

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

1. Nedrivning af infrastrukturen er lige så nemt som:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Bekræft det valgte miljø og gennemgå ressourcerne, der skal slettes. Dette fjerner Azure-ressourcer og kan slette data. Behold bekræftelsesprompten for denne læringsproces. Når det er fuldført, vil du se output svarende til:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Tjek sletningen i portalen og se efter ressourcer uden for implementeringens omfang. Omkostningsrapportering og kvoteopdateringer kan være forsinkede. Lokal `.azure` konfiguration forbliver, medmindre du eksplicit fjerner den.

1. `azd down --purge` anmoder desuden om permanent sletning af understøttede blødt slettede ressourcer. Brug den kun, når genoprettelse ikke er nødvendig, og du forstår politikkerne for opbevaring/rydning. Den garanterer ikke øjeblikkelig frigivelse af kvoter.

1. Genudrul ikke bare for at bekræfte oprydning. En senere bevidst `azd up` kan genskabe ressourcer ved hjælp af de resterende lokale input og medfører omkostninger igen. Modelopdateringer bruger normalt understøttede ændringer i provisionering, ikke nedrivning.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->