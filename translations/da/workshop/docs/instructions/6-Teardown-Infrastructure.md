# 6. Nedtagning af infrastruktur

!!! tip "I SLUTNINGEN AF DETTE MODUL VIL DU KUNNE"

    - [ ] Forstå vigtigheden af oprydning af ressourcer og omkostningsstyring
    - [ ] Bruge `azd down` til sikkert at afprovisionere infrastruktur
    - [ ] Gendanne blødt slettede Azure AI-tjenester om nødvendigt
    - [ ] **Lab 6:** Rydde op i Azure-ressourcer og bekræfte fjernelse

---

## Bonusøvelser

Før vi nedtager projektet, tag et par minutter til åben udforskning.

!!! info "Prøv disse udforskningsforslag"

    **Eksperimenter med GitHub Copilot:**
    
    1. Spørg: `Hvilke andre AZD-skabeloner kunne jeg prøve til multi-agent scenarier?`
    2. Spørg: `Hvordan kan jeg tilpasse agentinstruktionerne til et sundhedspleje-tilfælde?`
    3. Spørg: `Hvilke miljøvariabler styrer omkostningsoptimering?`
    
    **Udforsk Azure-portalen:**
    
    1. Gennemgå Application Insights-metrikker for din implementering
    2. Tjek omkostningsanalysen for de oprettede ressourcer
    3. Udforsk Microsoft Foundry-portalen agent-legpladsen en gang til

---

## Nedtagning af infrastruktur

1. At nedtage infrastrukturen er lige så nemt som:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Valgfrit) Hvis du nu kører `azd up` igen, vil du bemærke, at gpt-4.1-modellen bliver deployet, da miljøvariablen blev ændret (og gemt) i den lokale `.azure`-mappe. 

      Her er modeludrulningerne **før**:

      ![Før](../../../../../translated_images/da/14-deploy-initial.30e4cf1c29b587bc.webp)

      Og her er den **efter**:
      ![Efter](../../../../../translated_images/da/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->