<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T21:30:55+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "da"
}
-->
# 6. Nedtagning af Infrastruktur

!!! tip "VED SLUTNINGEN AF DETTE MODUL VIL DU KUNNE"

    - [ ] Punkt
    - [ ] Punkt
    - [ ] Punkt

---

## Ekstra Øvelser

Før vi nedtager projektet, brug et par minutter på at udforske frit og åbent.

!!! fare "NITYA-TODO: Skitser nogle forslag til udforskning"

---

## Nedtagning af Infrastruktur

1. Nedtagning af infrastruktur er så enkelt som:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Flaget `--purge` sikrer, at det også fjerner blødt-slettede Cognitive Service-ressourcer, hvilket frigiver den kvote, der holdes af disse ressourcer. Når processen er færdig, vil du se noget som dette:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Valgfrit) Hvis du nu kører `azd up` igen, vil du bemærke, at gpt-4.1-modellen bliver implementeret, da miljøvariablen blev ændret (og gemt) i den lokale `.azure`-mappe. 

      Her er modelimplementeringerne **før**:

      ![Initial](../../../../../translated_images/14-deploy-initial.30e4cf1c29b587bc86efd11a0dd0b6ee6bec92ae4425860272179121951bd917.da.png)

      Og her er de **efter**:
      ![New](../../../../../translated_images/14-deploy-new.f7f3c355a3cf7299572bca5941cfeec14090237cd3d20310e347f27564089379.da.png)

---

