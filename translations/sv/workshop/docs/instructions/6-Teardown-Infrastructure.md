# 6. Avveckla infrastruktur

!!! tip "NÄR DU HAR SLUTFÖRT DENNA MODUL KOMMER DU ATT KUNNA"

    - [ ] Förstå vikten av att rensa upp resurser och kostnadshantering
    - [ ] Använd `azd down` för att avprovisionera infrastrukturen säkert
    - [ ] Återställ vid behov mjukborttagna Azure AI-tjänster
    - [ ] **Laboration 6:** Rensa Azure-resurser och verifiera borttagning

---

## Bonusövningar

Innan vi avvecklar projektet, ta några minuter för att göra lite öppen utforskning.

!!! info "Prova dessa utforskningstips"

    **Experimentera med GitHub Copilot:**
    
    1. Fråga: `What other AZD templates could I try for multi-agent scenarios?`
    2. Fråga: `How can I customize the agent instructions for a healthcare use case?`
    3. Fråga: `What environment variables control cost optimization?`
    
    **Utforska Azure-portalen:**
    
    1. Granska Application Insights-metriker för din driftsättning
    2. Kontrollera kostnadsanalysen för de resurser som provisionerats
    3. Utforska Microsoft Foundry-portalens agent playground en gång till

---

## Avprovisionera infrastruktur

1. Att avveckla infrastrukturen är lika enkelt som:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Flaggan `--purge` säkerställer att den även tar bort mjukborttagna Cognitive Service-resurser, vilket frigör kvot som hålls av dessa resurser. När den är klar kommer du att se något liknande detta:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Valfritt) Om du nu kör `azd up` igen kommer du att märka att modellen gpt-4.1 driftsätts eftersom miljövariabeln ändrades (och sparades) i den lokala `.azure`-mappen. 

      Här är modellutplaceringarna **före**:

      ![Före](../../../../../translated_images/sv/14-deploy-initial.30e4cf1c29b587bc.webp)

      Och här är det **efter**:
      ![Efter](../../../../../translated_images/sv/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->