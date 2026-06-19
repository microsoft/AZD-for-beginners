# 6. Rive ned infrastruktur

!!! tip "PÅ SLUTTEN AV DETTE MODULEN VIL DU KUNNE"

    - [ ] Forstå viktigheten av ressursopprydding og kostnadsstyring
    - [ ] Bruke `azd down` for å trygt avvikle infrastruktur
    - [ ] Gjenopprette mykt slettede Azure AI-tjenester om nødvendig
    - [ ] **Lab 6:** Rydde opp i Azure-ressurser og verifisere fjerning

---

## Bonusøvelser

Før vi river ned prosjektet, ta noen minutter til å gjøre litt åpen utforskning.

!!! info "Prøv disse utforskningspromptene"

    **Eksperimenter med GitHub Copilot:**
    
    1. Spør: `Hvilke andre AZD-maler kan jeg prøve for fleragent-scenarier?`
    2. Spør: `Hvordan kan jeg tilpasse instruksjonene for agenten for en helsesektorsbruk?`
    3. Spør: `Hvilke miljøvariabler styrer kostnadsoptimalisering?`
    
    **Utforsk Azure-portalen:**
    
    1. Sjekk Application Insights-metrikker for distribusjonen din
    2. Undersøk kostnadsanalysen for provisjonerte ressurser
    3. Utforsk Microsoft Foundry-portalen agent-lekeplassen en gang til

---

## Avvikle infrastruktur

1. Å rive ned infrastrukturen er så enkelt som:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. `--purge`-flagget sikrer at det også fjerner mykt slettede Cognitive Service-ressurser, og dermed frigjør kvote holdt av disse ressursene. Når det er fullført, vil du se noe som dette:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Valgfritt) Hvis du nå kjører `azd up` igjen, vil du legge merke til at gpt-4.1-modellen blir distribuert siden miljøvariabelen ble endret (og lagret) i den lokale `.azure`-mappen.

      Her er modellutplasseringene **før**:

      ![Initial](../../../../../translated_images/no/14-deploy-initial.30e4cf1c29b587bc.webp)

      Og her er det **etter**:
      ![Ny](../../../../../translated_images/no/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->