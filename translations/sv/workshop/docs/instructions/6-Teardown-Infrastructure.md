# 6. Avveckla Infrastruktur

!!! tip "NÄR DU ÄR KLAR MED DENNA MODUL KOMMER DU ATT KUNNA"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusövningar

Innan vi avvecklar projektet, ta några minuter för att göra en öppen explorering.

!!! info "Prova Dessa Utforskningsuppmaningar"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Avveckla Infra

!!! warning "Om du också har slutfört GA-hostade agentövningen"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Att avveckla infrastrukturen är lika enkelt som:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Bekräfta den valda miljön och granska resurserna som ska tas bort. Detta tar bort Azure-resurser och kan förstöra data. Behåll bekräftelseprompten för detta inlärningsflöde. När det är klart kommer du att se output som liknar:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verifiera borttagningen i portalen och kontrollera efter resurser utanför distributionens omfattning. Kostnadsrapportering och kvotuppdateringar kan fördröjas. Lokal `.azure`-konfiguration kvarstår såvida du inte explicit tar bort den.

1. `azd down --purge` begär dessutom permanent borttagning av stödda mjukborttagna resurser. Använd det endast när återställning inte krävs och du förstår behållnings-/raderingsskyddspolicys. Det garanterar inte omedelbar kvotfrigivning.

1. Distribuera inte om bara för att verifiera städningen. En senare avsiktlig `azd up` kan återskapa resurser med de kvarvarande lokala indata, och medför kostnader igen. Modelluppdateringar använder normalt stödda provisionsändringar, inte avveckling.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->