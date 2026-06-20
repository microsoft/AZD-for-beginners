# 6. Infra struktuuri eemaldamine

!!! tip "SELLE MÄLUMOODULI LÕPUS SAAD OMAOSAKS"

    - [ ] Mõista ressursi puhastamise ja kulude juhtimise olulisust
    - [ ] Kasutada `azd down` infrastruktuuri turvaliseks eemaldamiseks
    - [ ] Vajadusel taastada pehmelt kustutatud Azure AI teenused
    - [ ] **Lab 6:** Azure ressursside puhastamine ja eemaldamise kinnitamine

---

## Boonusülesanded

Enne projekti eemaldamist võta mõned minutid avastuslikuks uurimiseks.

!!! info "Proovi neid uurimisküsimusi"

    **Katseta GitHub Copilotiga:**
    
    1. Küsi: `Milliseid teisi AZD malle võiksin proovida mitme agendi stsenaariumite jaoks?`
    2. Küsi: `Kuidas kohandada agendi juhiseid tervishoiu kasutusjuhtumi jaoks?`
    3. Küsi: `Millised keskkonnamuutujad kontrollivad kulude optimeerimist?`
    
    **Uuri Azure portaali:**
    
    1. Vaata üle oma juurutuse Application Insights mõõdikud
    2. Kontrolli provisjoneeritud ressursside kulude analüüsi
    3. Uuri Microsoft Foundry portaali agendi mänguväljakut veel kord

---

## Infra eemaldamine

1. Infrastruktuuri eemaldamine on sama lihtne kui:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Lipp `--purge` tagab, et see ka puhastab pehmelt kustutatud Kognitiivsete teenuste ressursid, vabastades nende ressursside poolt hoitud mahupiirangud. Kui see on lõpetatud, näed midagi sellist:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Valikuline) Kui nüüd jooksutad uuesti `azd up` käsku, märkad, et gpt-4.1 mudel paigaldatakse, sest keskkonnamuutuja muudeti (ja salvestati) kohalikus `.azure` kaustas. 

      Siin on mudeli juurutused **enne**:

      ![Initial](../../../../../translated_images/et/14-deploy-initial.30e4cf1c29b587bc.webp)

      Ja siin on see **pärast**:
      ![New](../../../../../translated_images/et/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->