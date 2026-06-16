# 6. Infrastructuur opruimen

!!! tip "AAN HET EINDE VAN DEZE MODULE ZUL JE IN STAAT ZIJN OM"

    - [ ] Het belang van het opruimen van resources en kostenbeheer begrijpen
    - [ ] Gebruik `azd down` om infrastructuur veilig te deprovisioneren
    - [ ] Herstel soft-verwijderde Azure AI Services indien nodig
    - [ ] **Lab 6:** Ruim Azure-resources op en verifieer verwijdering

---

## Bonusopdrachten

Voordat we het project opruimen, neem een paar minuten voor wat open verkenning.

!!! info "Probeer deze verkenningsprompts"

    **Experimenteer met GitHub Copilot:**
    
    1. Vraag: `Welke andere AZD-sjablonen zou ik kunnen proberen voor multi-agent scenario's?`
    2. Vraag: `Hoe kan ik de agentinstructies aanpassen voor een zorgtoepassing?`
    3. Vraag: `Welke omgevingsvariabelen regelen kostenoptimalisatie?`
    
    **Verken het Azure-portaal:**
    
    1. Bekijk de Application Insights-metrics voor je implementatie
    2. Controleer de kostenanalyse voor de geprovisioneerde resources
    3. Verken nogmaals de agent-playground van de Microsoft Foundry-portal one more time

---

## Infrastructuur verwijderen

1. Het afbreken van de infrastructuur is zo eenvoudig als:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. De `--purge`-vlag zorgt ervoor dat ook soft-verwijderde Cognitive Service-resources worden verwijderd, waardoor de door deze resources gebruikte quota worden vrijgegeven. Zodra dit is voltooid zie je iets als dit:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Optioneel) Als je nu opnieuw `azd up` uitvoert, zul je opmerken dat het gpt-4.1-model wordt uitgerold aangezien de omgevingsvariabele is gewijzigd (en opgeslagen) in de lokale `.azure`-map. 

      Hier zijn de modelimplementaties **voor**:

      ![Begin](../../../../../translated_images/nl/14-deploy-initial.30e4cf1c29b587bc.webp)

      En hier is het **daarna**:
      ![Nieuw](../../../../../translated_images/nl/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->