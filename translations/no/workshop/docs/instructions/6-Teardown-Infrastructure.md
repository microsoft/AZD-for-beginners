<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T22:45:30+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "no"
}
-->
# 6. Avvikling av Infrastruktur

!!! tip "VED SLUTTEN AV DENNE MODULEN VIL DU KUNNE"

    - [ ] Punkt
    - [ ] Punkt
    - [ ] Punkt

---

## Ekstraoppgaver

Før vi avvikler prosjektet, ta noen minutter til å utforske fritt.

!!! danger "NITYA-TODO: Skisser noen forslag til utforskning"

---

## Avvikle Infrastruktur

1. Å avvikle infrastrukturen er så enkelt som:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Flagget `--purge` sikrer at det også fjerner mykt slettede Cognitive Service-ressurser, og frigjør dermed kvoten som holdes av disse ressursene. Når prosessen er fullført, vil du se noe som dette:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Valgfritt) Hvis du nå kjører `azd up` igjen, vil du merke at gpt-4.1-modellen blir distribuert siden miljøvariabelen ble endret (og lagret) i den lokale `.azure`-mappen. 

      Her er modell-distribusjonene **før**:

      ![Initial](../../../../../translated_images/14-deploy-initial.30e4cf1c29b587bc86efd11a0dd0b6ee6bec92ae4425860272179121951bd917.no.png)

      Og her er de **etter**:
      ![New](../../../../../translated_images/14-deploy-new.f7f3c355a3cf7299572bca5941cfeec14090237cd3d20310e347f27564089379.no.png)

---

