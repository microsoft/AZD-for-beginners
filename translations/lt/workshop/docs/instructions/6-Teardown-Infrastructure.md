# 6. Infrastruktūros naikinimas

!!! tipas "ŠIO MODULIO PABAIGOJE JŪS SUDEBĖSITE"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Papildomos užduotys

Prieš naikindami projektą, skirkite kelias minutes atviram tyrinėjimui.

!!! info "Išbandykite šiuos tyrinėjimo užuominas"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Infrastruktūros pašalinimas

1. Infrastruktūros naikinimas yra toks paprastas:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Patvirtinkite pasirinktą aplinką ir peržiūrėkite ištrinsite resursus. Tai pašalins Azure resursus ir gali sunaikinti duomenis. Išlaikykite patvirtinimo užklausą šiam mokymosi srautui. Baigę matysite panašų rezultatą:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Patikrinkite ištrynimą portale ir patikrinkite resursus už diegimo ribų. Sąnaudų ataskaitos ir kvotų atnaujinimai gali vėluoti. Vietinė `.azure` konfigūracija išlieka, jei ją nepašalinate explicitiai.

1. `azd down --purge` taip pat prašo nuolatinio palaikomų minkštai ištrintų resursų ištrynimo. Naudokite tik tada, kai atkūrimas nereikalingas ir suprantate saugojimo/šalinimo apsaugos politiką. Tai negarantuoja greito kvotų atlaisvinimo.

1. Neperdieginėkite tik patikrinti išvalymą. Vėlesnis tyčinis `azd up` gali perkurti resursus naudodamas likusius vietinius įvesties duomenis ir vėl sukelti išlaidas. Modelio atnaujinimai paprastai naudoja palaikomus teikimo pakeitimus, o ne naikinimą.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->