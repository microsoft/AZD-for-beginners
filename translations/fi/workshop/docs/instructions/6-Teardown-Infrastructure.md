# 6. Infrastruktuurin purku

!!! tip "TÄMÄN MODUULIN PÄÄTTYESSÄ OSAAT"

    - [ ] Ymmärtää resurssien siivouksen ja kustannusten hallinnan merkityksen
    - [ ] Käyttää `azd down` turvallisesti infrastruktuurin purkamiseen
    - [ ] Palauttaa pehmeästi poistetut Azure AI Services -resurssit tarvittaessa
    - [ ] **Harjoitus 6:** Siivota Azure-resurssit ja varmistaa poisto

---

## Lisätehtävät

Before we tear down the project, take a few minutes to do some open-ended exploration.

!!! info "Kokeile näitä tutkimuskehotteita"

    **Kokeile GitHub Copilotia:**
    
    1. Kysy: `What other AZD templates could I try for multi-agent scenarios?`
    2. Kysy: `How can I customize the agent instructions for a healthcare use case?`
    3. Kysy: `What environment variables control cost optimization?`
    
    **Tutki Azure-portaalia:**
    
    1. Tarkastele Application Insightsin mittareita käyttöönotossasi
    2. Tarkista provisionoitujen resurssien kustannusanalyysi
    3. Tutki Microsoft Foundry -portaalin agenttien leikkikenttää vielä kerran

---

## Poista infrastruktuuri

1. Tearing down infrastructure is as easy as:
      
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

1. (Valinnainen) If you now run `azd up` again, you will notice the gpt-4.1 model gets deployed since the environment variable was changed (and saved) in the local `.azure` folder. 

      Here is the model deployments **before**:

      ![Alkuperäinen](../../../../../translated_images/fi/14-deploy-initial.30e4cf1c29b587bc.webp)

      And here it is **after**:
      ![Uusi](../../../../../translated_images/fi/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->