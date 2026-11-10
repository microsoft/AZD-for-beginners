# 6. Nedmontering av infrastruktur

!!! tip "VID SLUTET AV DENNA MODUL KOMMER DU ATT KUNNA"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusövningar

Innan vi river ner projektet, ta några minuter för att göra lite öppen utforskning.

!!! info "Prova dessa utforskningsuppmaningar"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Avveckla infrastruktur

1. Att riva ner infrastrukturen är lika enkelt som:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Bekräfta den valda miljön och granska resurserna som ska tas bort. Detta tar bort Azure-resurser och kan förstöra data. Behåll bekräftelseprompten för detta lärande arbetsflöde. När det är klart kommer du att se en utdata liknande:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verifiera borttagning i portalen och kontrollera resurser utanför distributionens omfattning. Kostnadsrapportering och kvotuppdateringar kan fördröjas. Lokal `.azure` konfiguration kvarstår om du inte uttryckligen tar bort den.

1. `azd down --purge` begär dessutom permanent borttagning av stödda mjuk-borttagna resurser. Använd den endast när återställning inte krävs och du förstår behållnings-/renskyddspolicys. Den garanterar inte omedelbar kvotfrigörelse.

1. Distribuera inte om bara för att verifiera rensning. En senare avsiktlig `azd up` kan återskapa resurser med de återstående lokala inmatningarna, och medför avgifter igen. Modelluppdateringar använder normalt sett stödda provisioneringsändringar, inte nedmontering.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->