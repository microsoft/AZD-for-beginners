# 6. Infra rakenteen purku

!!! tip "MODUULIN LOPPUUN MENNESSÄ OSAA"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonus Harjoitukset

Ennen kuin puret projektin, käytä muutama minuutti avoimeen tutkimiseen.

!!! info "Kokeile Näitä Tutkimusaiheita"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Poista infrastruktuuri käytöstä

1. Infrastruktuurin purku on yhtä helppoa kuin:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Vahvista valittu ympäristö ja tarkista poistettavat resurssit. Tämä poistaa Azuren resurssit ja voi tuhota tietoja. Säilytä vahvistuskehotus tässä oppimistyönkulussa. Kun valmis, näet ulostulon, joka on samanlainen kuin:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Vahvista poisto portaalissa ja tarkista resurssit jotka ovat käyttöönottoskaalasta ulkopuolella. Kustannusraportointi ja käyttöoikeuksien päivitykset voivat viivästyä. Paikallinen `.azure` kokoonpano säilyy ellet poista sitä erikseen.

1. `azd down --purge` pyytää lisäksi tuettuja pehmeästi poistettuja resursseja poistettavaksi pysyvästi. Käytä tätä vain, kun palautusta ei tarvita ja ymmärrät säilytys-/poistonsuojapolitiikat. Se ei takaa välitöntä käyttöoikeuksien vapautusta.

1. Älä ota uudelleen käyttöön vain varmistaaksesi siivouksen. Myöhemmällä tarkoituksellisella `azd up` voi luoda resurssit uudelleen käyttämällä jäljelle jääneitä paikallisia syötteitä, ja aiheuttaa taas kustannuksia. Mallipäivitykset käyttävät normaalisti tuettuja provisiointimuutoksia, eivät purkua.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->