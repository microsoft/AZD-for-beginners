# 6. Infrastruktūros naikimas

!!! tip "ŠIO MODULIO PABAIGOJE SUKURSITE SU ŠIAIS ĮGŪDŽIAIS"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Papildomi pratimai

Prieš naikindami projektą, skirkite kelias minutes atvirajai tyrinėjimui.

!!! info "Išbandykite šiuos tyrinėjimo nurodymus"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Infrastruktūros atšaukimas

!!! warning "Jei taip pat atlikote GA talpinamo agento pratimą"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Infrastruktūros naikinimas yra toks paprastas:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Patvirtinkite pasirinktą aplinką ir peržiūrėkite naikintinus išteklius. Tai pašalina „Azure“ išteklius ir gali sunaikinti duomenis. Laikykitės patvirtinimo užklausos šiam mokymosi procesui. Baigus, pamatysite panašų išvesties rezultatą:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Patikrinkite naikinimą portale ir ieškokite išteklių už diegimo ribų. Sąnaudų ataskaita ir kvotų atnaujinimas gali vėluoti. Vietinė `.azure` konfigūracija išlieka, nebent ją išimtai pašalinsite.

1. `azd down --purge` taip pat prašo nuolatinio palaikomų minkštai ištrintų išteklių naikinimo. Naudokite tik tada, kai atkūrimas nereikalingas ir suprantate saugojimo/valymo apsaugos taisykles. Tai negarantuoja kvotų išleidimo iš karto.

1. Nenaudokite pakartotinai diegti tik norint patikrinti valymą. Vėliau tyčinis `azd up` gali atkurti išteklius naudodamas likusius vietinius įvesties duomenis ir vėl suskaičiuoja mokesčius. Modelio atnaujinimams paprastai naudojami palaikomi aprovizavimo pakeitimai, o ne naikinimas.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->