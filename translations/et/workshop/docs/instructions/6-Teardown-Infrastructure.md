# 6. Infrastruktuuri demonteerimine

!!! tip "Selle mooduli lõpuks oskad sa"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Boonusülesanded

Enne projekti demonteerimist võta paar minutit, et teha mõningaid avatud uurimisharjutusi.

!!! info "Proovi neid uurimissuuniseid"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Infrastruktuuri keelamine

!!! warning "Kui sa täitsid ka GA hostitud agendi harjutuse"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Infrastruktuuri demonteerimine on sama lihtne kui:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Kinnita valitud keskkond ja vaata üle kustutamist vajavad ressursid. See eemaldab Azure'i ressursid ja võib andmeid hävitada. Hoia selle õppeprotsessi jaoks kinnituskäsk sees. Pärast lõpetamist näed sarnast väljundit:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Kontrolli kustutamist portaalis ja vaata üle ressursid väljaspool juurutuse ulatust. Kuluraportid ja kvota uuendused võivad viibida. Kohalik `.azure` konfiguratsioon jääb alles, kui sa seda teadlikult ei eemalda.

1. `azd down --purge` taotleb lisaks toetatud pehmelt kustutatud ressursside püsivat kustutamist. Kasuta seda ainult siis, kui taastamine ei ole vajalik ja sa mõistad säilitamis- ja puhastuskaitsepoliitikaid. See ei taga kohe kvota vabastamist.

1. Ära juuruta uuesti ainult puhastuse kontrollimiseks. Hilisem sihilik `azd up` võib olemasolevaid kohalikke sisendeid kasutades ressursid taastada ning see toob taas kulud kaasa. Mudeli värskendused kasutavad tavaliselt toetatud provisioning`u muutusi, mitte demonteerimist.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->