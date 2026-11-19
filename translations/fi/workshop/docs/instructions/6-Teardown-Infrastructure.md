# 6. Peruuta infrastruktuuri

!!! tip "TÄMÄN MODUULIN LOPUSSA OSAA TOTEUTTAA SEURAAVAA"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusharjoitukset

Ennen projektin purkamista, käytä muutama minuutti avoimeen tutkimiseen.

!!! info "Kokeile näitä tutkimuskehotteita"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Peruuta infrastruktuuri

!!! warning "Jos teit myös GA-hosted-agent -harjoituksen"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Infrastruktuurin purkaminen on yhtä helppoa kuin:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Vahvista valittu ympäristö ja tarkista poistettavat resurssit. Tämä poistaa Azure-resursseja ja voi tuhoaa dataa. Pidä vahvistuskehotus tämän oppimisprosessin aikana. Valmiin tehtävän jälkeen näet vastaavaa tulostetta:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Tarkista poistaminen portaalissa ja etsi resursseja, jotka ovat käyttöönottoprojektin ulkopuolella. Kustannusraportointi ja käyttökiintiöiden päivitys voivat viivästyä. Paikallinen `.azure`-määritys säilyy, ellei sitä erikseen poisteta.

1. `azd down --purge` pyytää lisäksi tuetusti pehmeästi poistettujen resurssien pysyvää poistoa. Käytä sitä vain, kun palautusta ei tarvita ja ymmärrät säilytys- ja pyyhintäsuojauskäytännöt. Se ei takaa välitöntä käyttökiintiön vapautusta.

1. Älä ota uudelleen käyttöön pelkästään siivouksen varmistamiseksi. Myöhempi tarkoituksellinen `azd up` voi uudelleenluoda resurssit paikallisten tietojen avulla ja aiheuttaa uudelleen kustannuksia. Mallipäivitykset käyttävät tavallisesti tuettuja käyttöönoton muutoksia, eivät purkua.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->