# 6. Tõrke infrastruktuur maha

!!! tip "SELLE MODUULI LÕPUS OLED SA VÕimeline"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Boonusülesanded

Enne projekti lammutamist võta paar minutit, et teha mõningaid avatud uurimisi.

!!! info "Proovi neid uurimiskomplekte"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Infrastruktuuri eemaldamine

1. Infrastruktuuri maha võtmine on sama lihtne kui:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Kinnita valitud keskkond ja vaata üle kustutatavad ressursid. See eemaldab Azure'i ressursid ja võib andmeid hävitada. Hoia selle õppimise töövoo jaoks kinnituskutse. Kui lõpetad, näed väljundit, mis näeb välja nagu:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Kontrolli portaalis kustutamist ja otsi üles ressursid, mis jäävad väljapoole juurutuspiirkonda. Kulude aruandlus ja limiidi uuendused võivad hilineda. Kohalik `.azure` konfiguratsioon püsib alles, kui sa seda ekspliciitselt ei eemalda.

1. `azd down --purge` nõuab lisaks toetatud pehmeta kustutatud ressursside jäädavat kustutamist. Kasuta seda ainult siis, kui taastamine pole vajalik ning sa mõistad säilitamis- ja puhastus-kaitse poliitikaid. See ei taga kohest limiidi vabastamist.

1. Ära juuruta uuesti lihtsalt puhastuse kontrollimiseks. Hilisem tahtlik `azd up` võib järelejäänud kohalike sisendite abil ressursid uuesti luua ja see põhjustab taas tasusid. Mudeli uuendused kasutavad tavaliselt toetatud juurutusmuudatusi, mitte lammutamist.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->