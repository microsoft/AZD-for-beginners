# 2. Validoi malli

> Vahvistettu `azd 1.23.12` -versiolla maaliskuussa 2026.

!!! tip "TÄMÄN MODUULIN PÄÄTTYESSÄ OSAAT"

    - [ ] Analysoida tekoälyratkaisun arkkitehtuuria
    - [ ] Ymmärtää AZD:n käyttöönoton työnkulku
    - [ ] Käyttää GitHub Copilotia saadaksesi apua AZD:n käyttöön
    - [ ] **Lab 2:** Ota käyttöön ja validoi AI Agents -malli

---


## 1. Johdanto

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) tai `azd` on avoimen lähdekoodin komentorivityökalu, joka sujuvoittaa kehittäjän työnkulkua sovelluksia rakennettaessa ja otettaessa käyttöön Azureen. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ovat standardoituja repositorioita, jotka sisältävät esimerkkisovelluskoodin, _infrastructure-as-code_ -resurssit ja `azd`-määrittelyt yhtenäistä ratkaisun arkkitehtuuria varten. Infrastruktuurin provisioiminen on yhtä yksinkertaista kuin `azd provision` -komento - kun taas `azd up` mahdollistaa infrastruktuurin provisioinnin **ja** sovelluksen käyttöönoton yhdellä kertaa!

Tämän seurauksena sovelluskehityksen aloittaminen voi olla yhtä helppoa kuin löytää oikea _AZD Starter template_, joka lähestyy parhaiten sovellus- ja infrastruktuuritarpeitasi - ja mukauttaa sitten repositorion vastaamaan skenaarion vaatimuksia.

Ennen kuin aloitamme, varmistetaan, että sinulla on Azure Developer CLI asennettuna.

1. Avaa VS Code -terminaali ja kirjoita tämä komento:

      ```bash title="" linenums="0"
      azd version
      ```

1. Näet jotain tällaista!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Olet nyt valmis valitsemaan ja ottamaan mallin käyttöön azd:llä**

---

## 2. Mallin valinta

Microsoft Foundry -alusta sisältää [joukon suositeltuja AZD-malleja](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), jotka kattavat suosittuja ratkaisuskenaarioita kuten _multi-agent workflow atomation_ ja _multi-modal content processing_. Voit myös löytää nämä mallit vierailemalla Microsoft Foundry -portaalissa.

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Kirjaudu Microsoft Foundry -portaaliin, kun sinulta pyydetään - näet jotain tällaista.

![Valitse malli](../../../../../translated_images/fi/01-pick-template.60d2d5fff5ebc374.webp)


Kohdan **Basic** -vaihtoehdot ovat aloitusmallejasi:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) joka ottaa käyttöön perustason chat-sovelluksen _omilla tiedoillasi_ Azure Container Appsiin. Käytä tätä tutkiaksesi peruskäyttöistä tekoälychatbot-skenaariota.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) joka myös ottaa käyttöön standardin AI Agentin (Foundryn Agentit). Käytä tätä tutustuaksesi agenttiperustaiseen tekoälyratkaisuun, joka hyödyntää työkaluja ja malleja.

Avaa toinen linkki uudessa välilehdessä (tai klikkaa kortin `Open in GitHub`). Näet tämän AZD-templaten repositorion. Käy README läpi hetki. Sovelluksen arkkitehtuuri näyttää tältä:

![Arkkitehtuuri](../../../../../translated_images/fi/architecture.8cec470ec15c65c7.webp)

---

## 3. Mallin aktivointi

Kokeillaan ottaa tämä malli käyttöön ja varmistetaan, että se on kelvollinen. Seuraamme [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) -osion ohjeita.

1. Valitse työkäyttöympäristö mallirepositoriolle:

      - **GitHub Codespaces**: Klikkaa [tätä linkkiä](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ja vahvista `Create codespace`
      - **Paikallinen klooni tai dev container**: Kloonaa `Azure-Samples/get-started-with-ai-agents` ja avaa se VS Codessa

1. Odota, kunnes VS Code -terminaali on valmis, ja kirjoita sitten seuraava komento:

   ```bash title="" linenums="0"
   azd up
   ```

Suorita työnkulun vaiheet, jotka tämä käynnistää:

1. Sinua pyydetään kirjautumaan Azureen - noudata ohjeita tunnistautumista varten
1. Anna yksilöllinen ympäristön nimi - esim. käytin `nitya-mshack-azd`
1. Tämä luo `.azure/`-kansion - näet alikansion, jonka nimi on ympäristön nimi
1. Sinulta pyydetään tilausta (subscription) - valitse oletus
1. Sinulta kysytään sijaintia - käytä `East US 2`

Nyt odota provisioinnin valmistumista. **Tämä kestää 10–15 minuuttia**

1. Kun valmis, konsolissasi näkyy SUCCESS-viesti, joka näyttää tältä:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure-portaalissasi on nyt provisioitu resurssiryhmä sillä ympäristön nimellä:

      ![Provisioitu infra](../../../../../translated_images/fi/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Olet nyt valmis validoimaan provisioidun infrastruktuurin ja sovelluksen**.

---

## 4. Mallin validointi

1. Vieraile Azure-portaalin [Resurssiryhmät](https://portal.azure.com/#browse/resourcegroups) -sivulla - kirjaudu sisään tarvittaessa
1. Klikkaa ympäristösi resurssiryhmää - näet yllä olevan sivun

      - klikkaa Azure Container Apps -resurssia
      - klikkaa Application Urlia _Essentials_ -kohdassa (oikeassa yläkulmassa)

1. Näet isännöidyn sovelluksen frontend-käyttöliittymän, joka näyttää tältä:

   ![Sovelluksen käyttöliittymä](../../../../../translated_images/fi/03-test-application.471910da12c3038e.webp)

1. Kokeile esittää pari [esimerkkikysymystä](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Kysy: ```What is the capital of France?``` 
      1. Kysy: ```What's the best tent under $200 for two people, and what features does it include?```

1. Saat todennäköisesti vastauksia, jotka ovat samankaltaisia kuin alla näkyvät. _Mutta miten tämä toimii?_ 

      ![Sovelluksen vastaus](../../../../../translated_images/fi/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agentin validointi

Azure Container App ottaa käyttöön päätepisteen, joka yhdistyy tähän templaten Microsoft Foundry -projektiin provisioituun AI Agentiin. Katsotaan, mitä tämä tarkoittaa.

1. Palaa Azure-portaalin resurssiryhmän _Overview_ -sivulle

1. Klikkaa listalta `Microsoft Foundry` -resurssia

1. Näet tällaisen näkymän. Klikkaa `Go to Microsoft Foundry Portal` -painiketta. 
   ![Foundry-projekti](../../../../../translated_images/fi/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Näet Foundry-projektin sivun AI-sovelluksellesi
   ![Projekti](../../../../../translated_images/fi/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klikkaa `Agents` - näet projektisi oletusarvoisen Agentin, joka on provisioitu
   ![Agentit](../../../../../translated_images/fi/06-visit-agents.bccb263f77b00a09.webp)

1. Valitse se - ja näet Agentin tiedot. Huomioi seuraavat seikat:

      - Agentti käyttää oletuksena File Searchia (aina)
      - Agentin `Knowledge` kertoo, että siihen on ladattu 32 tiedostoa (tiedostohakua varten)
      ![Agentin tiedot](../../../../../translated_images/fi/07-view-agent-details.0e049f37f61eae62.webp)

1. Etsi vasemman reunan valikosta `Data+indexes` -vaihtoehto ja klikkaa nähdäksesi tiedot. 

      - Näet 32 tiedostoa, jotka on ladattu tiedonlähteiksi.
      - Nämä vastaavat `src/files`-kansiossa olevia 12 asiakastiedostoa ja 20 tuotetiedostoa 
      ![Tiedot ja indeksit](../../../../../translated_images/fi/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Olet varmistanut Agentin toiminnan!** 

1. Agentin vastaukset perustuvat näiden tiedostojen tietopohjaan. 
1. Voit nyt esittää kyseisiin tietoihin liittyviä kysymyksiä ja saada niihin perusteltuja vastauksia.
1. Esimerkki: `customer_info_10.json` kuvaa "Amanda Perezin" tekemiä kolmea ostosta

Palaa selaimen välilehdelle, jossa Container Appin päätepiste on avoinna, ja kysy: `What products does Amanda Perez own?`. Näet jotain tällaista:

![Sovelluksen vastaus](../../../../../translated_images/fi/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Rakennetaan hieman intuitiota Microsoft Foundryn kyvykkyyksistä ajamalla Agent pyörimään Agents Playgroundissa. 

1. Palaa Microsoft Foundryn `Agents`-sivulle - valitse oletusagentti
1. Klikkaa `Try in Playground` -vaihtoehtoa - saat Playground-käyttöliittymän, joka näyttää tältä
1. Kysy sama kysymys: `What products does Amanda Perez own?`

    ![Sovelluksen vastaus](../../../../../translated_images/fi/09-ask-in-playground.a1b93794f78fa676.webp)

Saat samanlaiset (tai samankaltaiset) vastaukset - mutta saat myös lisätietoja, joita voit käyttää arvioidaksesi agenttisovelluksesi laatua, kustannuksia ja suorituskykyä. Esimerkiksi:

1. Huomaa, että vastaus viittaa tiedostoon/tiedostoihin, joita käytettiin vastauksen "groundaamiseen"
1. Vie hiiri minkä tahansa näistä tiedostotunnisteista päälle - vastaako tiedon sisältö kysymystä ja näytettyä vastausta?

Näet myös _stats_ -rivin vastauksen alapuolella. 

1. Vie hiiri minkä tahansa mittarin päälle - esim. Safety. Näet jotain tällaista
1. Vastaako arvioitu luokitus mielikuvaasi vastauksen turvallisuustasosta?

      ![Agentti](../../../../../translated_images/fi/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Sisäänrakennettu observoitavuus

Observoitavuus tarkoittaa sovelluksen instrumentointia siten, että se tuottaa dataa, jota voidaan käyttää toiminnan ymmärtämiseen, virheiden selvittämiseen ja optimointiin. Saadaksesi käsityksen tästä:

1. Klikkaa `View Run Info` -painiketta - näet tämän näkymän. Tämä on esimerkki [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) -toiminnallisuudesta. _Tämän näkymän saa myös klikkaamalla Thread Logs ylävalikosta_.

   - Hanki käsitys suorituksen vaiheista ja agentein käyttämistä työkaluista
   - Ymmärrä kokonais Token-määrä (vs. ulostulotokeneiden käyttö) vastauksessa
   - Ymmärrä latenssi ja missä ajankäyttö tapahtuu suorituksen aikana

      ![Agentin suoritustiedot](../../../../../translated_images/fi/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klikkaa `Metadata`-välilehteä nähdäksesi suorituksen lisäattribuutteja, jotka voivat tarjota hyödyllistä kontekstia vikatilanteiden jäljittämiseen.   

      ![Agentin suoritustiedot](../../../../../translated_images/fi/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klikkaa `Evaluations`-välilehteä nähdäksesi agentin vastaukseen tehtyjä automaattisia arviointeja. Näihin sisältyy turvallisuusarviointeja (esim. itse-vahingoittaminen) ja agenttikohtaisia arviointeja (esim. intentin ratkaisu, tehtävän noudattaminen).

      ![Agentin suoritustiedot](../../../../../translated_images/fi/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Lopuksi, klikkaa sivupalkin `Monitoring`-välilehteä.

      - Valitse näytöllä `Resource usage` -välilehti - ja tarkastele mittareita.
      - Seuraa sovelluksen käyttöä kustannusten (tokenit) ja kuormituksen (pyynnöt) suhteen.
      - Seuraa sovelluksen latenssia ensimmäiseen tavu (syötteen käsittely) ja viimeiseen tavu (ulosotto) asti.

      ![Agentin suoritustiedot](../../../../../translated_images/fi/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Ympäristömuuttujat

Tähän asti olemme käyneet läpi käyttöönoton selaimessa - ja varmistaneet, että infrastruktuuri on provisioitu ja sovellus toimii. Mutta työskennelläksemme sovelluksen kanssa _koodikeskeisesti_ meidän täytyy konfiguroida paikallinen kehitysympäristömme relevanttien muuttujien avulla, joita tarvitaan resurssien kanssa työskentelyyn. `azd` tekee tästä helppoa.

1. Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) tallentaakseen ja hallitakseen konfiguraatioasetuksia sovelluksen käyttöönotolle.

1. Ympäristömuuttujat tallennetaan `.azure/<env-name>/.env` -tiedostoon - tämä rajaa ne käytettyyn `env-name`-ympäristöön ja auttaa erottamaan eri deployment-ympäristöt samassa repositoriossa.

1. Ympäristömuuttujat ladataan automaattisesti `azd`-komennon toimesta aina, kun se suorittaa tietyn komennon (esim. `azd up`). Huomaa, että `azd` ei lue automaattisesti _käyttöjärjestelmän tason_ ympäristömuuttujia (esim. komentorivillä asetettuja) - käytä sen sijaan `azd set env` ja `azd get env` siirtääksesi tietoa skriptien sisällä.


Kokeillaan muutamaa komentoa:

1. Hae kaikki ympäristömuuttujat, jotka on asetettu `azd`:lle tässä ympäristössä:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Näet jotain tällaista:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Hae tietty arvo - esim. haluan tietää, asetettiinko `AZURE_AI_AGENT_MODEL_NAME`-arvo

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Näet jotain tällaista - sitä ei ollut asetettu oletuksena!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Aseta uusi ympäristömuuttuja `azd`:lle. Tässä päivitämme agentin mallin nimen. _Huom: kaikki tekemäsi muutokset heijastuvat välittömästi `.azure/<env-name>/.env`-tiedostoon._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nyt arvon tulisi olla asetettu:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Huomaa, että jotkin resurssit ovat pysyviä (esim. mallien käyttöönotot) ja vaativat enemmän kuin pelkän `azd up`-komennon pakottaakseen uudelleenasennuksen. Kokeillaan purkaa alkuperäinen käyttöönotto ja ottaa se uudelleen käyttöön muutetuilla ympäristömuuttujilla.

1. **Refresh** Jos olet aiemmin ottanut infrastruktuurin käyttöön azd-templaten avulla - voit _refreshata_ paikallisten ympäristömuuttujiesi tilan nykyisen Azure-käyttöönoton tilan perusteella käyttämällä tätä komentoa:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Tämä on tehokas tapa _synkronoida_ ympäristömuuttujia kahden tai useamman paikallisen kehitysympäristön välillä (esim. usean kehittäjän tiimi) - jolloin käyttöön otettu infrastruktuuri toimii totuuden lähteenä ympäristömuuttujien tilasta. Tiimin jäsenet yksinkertaisesti _päivittävät_ muuttujat pysyäkseen synkronissa.

---

## 9. Onnittelut 🏆

Olet juuri suorittanut alusta loppuun kulkevan työnkulun, jossa:

- [X] Valitsit haluamasi AZD-mallin
- [X] Avasit mallin tuetussa kehitysympäristössä
- [X] Otit mallin käyttöön ja varmistit, että se toimii

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattisissa käännöksissä voi olla virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulisi pitää ensisijaisena lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaista ihmisen tekemää käännöstä. Emme ole vastuussa tästä käännöksestä johtuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->