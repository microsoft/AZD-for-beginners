# 2. Vahvista malli

> Vahvistettu versiolla `azd 1.27.1` heinäkuussa 2026.

!!! tip "TÄMÄN MODUULIN LOPUSSA OSAA"

    - [ ] Analysoida AI-ratkaisun arkkitehtuuria
    - [ ] Ymmärtää AZD:n käyttöönoton työnkulku
    - [ ] Käyttää GitHub Copilotia apuna AZD:n käytössä
    - [ ] **Lab 2:** Ota käyttöön ja vahvista AI Agents -malli

---


## 1. Johdanto

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) eli `azd` on avoimen lähdekoodin komentorivityökalu, joka virtaviivaistaa kehittäjän työnkulkua sovelluksia rakennettaessa ja otettaessa käyttöön Azuren pilvipalveluun.

[AZD-mallit](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ovat standardoituja arkistoja, jotka sisältävät esimerkkisovelluskoodia, infrastruktuuri-koodina -resursseja sekä `azd`-määritystiedostoja yhtenäisen ratkaisun arkkitehtuuria varten. Infrastruktuurin provisiointi käy helposti pelkällä `azd provision` -komennolla, ja `azd up` -komennolla voit samanaikaisesti provisioida infrastruktuurin **ja** ottaa sovelluksen käyttöön!

Näin sovelluksen kehitys voidaan käynnistää kätevästi etsimällä sopiva _AZD Starter_ -malli, joka vastaa mahdollisimman hyvin sovellus- ja infrastruktuuritarpeitasi, ja muokkaamalla arkistosta omiin vaatimuksiisi sopiva.

Ennen aloittamista varmistetaan, että sinulla on Azure Developer CLI asennettuna.

1. Avaa VS Code -terminaali ja kirjoita tämä komento:

      ```bash title="" linenums="0"
      azd version
      ```

1. Näet jotain tällaista!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Nyt olet valmis valitsemaan ja käyttämään mallia azd:n avulla**

---

## 2. Mallin valinta

Microsoft Foundry -alusta tarjoaa [joukon suositeltuja AZD-malleja](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), jotka kattavat suosittuja ratkaisuskenaarioita kuten _moni-agenttien työnkulkuautomaation_ ja _monimodaalisen sisällön käsittelyn_. Löydät nämä mallit myös Microsoft Foundryn portaalista.

1. Siirry osoitteeseen [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Kirjaudu Microsoft Foundryn portaaliin, kun sinua kehotetaan – näet jotain tällaista.

![Pick](../../../../../translated_images/fi/01-pick-template.60d2d5fff5ebc374.webp)


**Basic**-vaihtoehdot ovat aloitusmallejasi:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat), joka ottaa käyttöön peruskeskustelusovelluksen _datan kanssa_ Azure Container Apps -ympäristöön. Käytä tätä tutustuaksesi perus AI-chatbot-skenaarioon.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents), joka ottaa käyttöön myös vakio AI-agentin (Foundry Agentsin kanssa). Tutustu tähän, jos haluat tutustua agenttipohjaisiin AI-ratkaisuihin, joissa käytetään työkaluja ja malleja.

Avaa toinen linkki uudessa selainvälilehdessä (tai klikkaa kortissa "Open in GitHub"). Näet tämän AZD-mallin arkiston. Tutustu README-tiedostoon hetki. Sovelluksen arkkitehtuuri näyttää tältä:

![Arch](../../../../../translated_images/fi/architecture.8cec470ec15c65c7.webp)

---

## 3. Mallin aktivointi

Yritetään ottaa tämä malli käyttöön ja varmistaa sen kelvollisuus. Seuraamme ohjeita [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) -osiossa.

1. Valitse työskentely-ympäristö mallia varten:

      - **GitHub Codespaces**: Klikkaa [tästä](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ja vahvista `Create codespace`
      - **Paikallinen klooni tai kehityssäiliö**: Kloonaa `Azure-Samples/get-started-with-ai-agents` ja avaa se VS Codessa

1. Odota, että VS Code -terminaali on valmis, ja kirjoita sitten seuraava komento:

   ```bash title="" linenums="0"
   azd up
   ```

Suorita työnkulun vaiheet, joihin tämä komentoriviltä käynnistyy:

1. Sinua pyydetään kirjautumaan Azureen – seuraa ohjeita ja autentikoi
1. Anna ainutlaatuinen ympäristön nimi – esimerkiksi minä käytin `nitya-mshack-azd`
1. Tämä luo `.azure/`-kansion – näet siellä alikansion, jonka nimi on ympäristön nimi
1. Sinua pyydetään valitsemaan tilaus – valitse oletustilaus
1. Sinua pyydetään määrittämään sijainti – käytä `East US 2`

Nyt odotetaan provisioinnin valmistumista. **Tämä kestää 10-15 minuuttia**

1. Kun valmis, konsolissasi näkyy ONNISTUMISVIESTI, joka näyttää tältä:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure-portaalissasi on nyt provisioitu resurssiryhmä, jonka nimi on valitsemasi ympäristön nimen mukainen:

      ![Infra](../../../../../translated_images/fi/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Olet nyt valmis vahvistamaan käyttöönottamasi infrastruktuurin ja sovelluksen**.

---

## 4. Mallin vahvistus

1. Siirry Azure-portaalin [Resurssiryhmät](https://portal.azure.com/#browse/resourcegroups) -sivulle ja kirjaudu sisään
1. Klikkaa resurssiryhmää, jonka nimi on ympäristön nimeä vastaava – näet yllä olevan näkymän

      - klikkaa Azure Container Apps -resurssia
      - klikkaa Sovelluksen URL:ia _Essentials_-osiossa (oikeassa yläkulmassa)

1. Näet isännöidyn sovelluksen käyttöliittymän, joka näyttää tältä:

   ![App](../../../../../translated_images/fi/03-test-application.471910da12c3038e.webp)

1. Kokeile esimerkkikysymyksiä [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Kysy: ```Mikä on Ranskan pääkaupunki?``` 
      1. Kysy: ```Mikä on paras teltan vaihtoehto alle 200 dollarilla kahdelle hengelle, ja mitä ominaisuuksia se sisältää?```

1. Saat vastaukset, jotka ovat samankaltaisia kuin alla näkyvät. _Mutta miten tämä toimii?_ 

      ![App](../../../../../translated_images/fi/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agentin vahvistus

Azure Container App tarjoaa rajapinnan, joka yhdistää Microsoft Foundry -projektissa provisioidun AI-agentin. Katsotaanpa, mitä tämä tarkoittaa.

1. Palaa Azure-portaalin resurssiryhmän _Yleiskatsaus_-sivulle

1. Klikkaa `Microsoft Foundry` -resurssia listalla

1. Näet tämän. Klikkaa `Go to Microsoft Foundry Portal` -painiketta. 
   ![Foundry](../../../../../translated_images/fi/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Näet Foundry-projektisivun AI-sovelluksellesi
   ![Project](../../../../../translated_images/fi/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klikkaa `Agents` - näet valmiiksi provisioidun oletusagentin projektissasi
   ![Agents](../../../../../translated_images/fi/06-visit-agents.bccb263f77b00a09.webp)

1. Valitse agentti ja näet tiedot siitä. Huomioi seuraavat seikat:

      - Agentti käyttää oletuksena aina File Searchia
      - Agentin `Knowledge`-osiossa näkyy, että sille on ladattu 32 tiedostoa (tiedostohakuun)
      ![Agents](../../../../../translated_images/fi/07-view-agent-details.0e049f37f61eae62.webp)

1. Etsi vasemman valikon `Data+indexes` -vaihtoehto ja klikkaa nähdäksesi lisätietoja. 

      - Näet siellä tiedon 32 ladatusta data-tiedostosta,
      - jotka vastaavat niitä 12 asiakastiedostoa ja 20 tuote-tiedostoa, jotka löytyvät `src/files` -kansiosta
      ![Data](../../../../../translated_images/fi/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Olet vahvistanut agentin toiminnan!** 

1. Agentin vastaukset pohjautuvat näiden tiedostojen tietoon. 
1. Voit nyt esittää kysymyksiä, jotka liittyvät näihin tietoihin, ja saat niihin perusteltuja vastauksia.
1. Esimerkki: `customer_info_10.json` kuvaa Amanda Perezin tekemiä kolmea ostosta.

Palaa selainvälilehdelle, jossa on Container Appin päätepiste, ja kysy: `Millaisia tuotteita Amanda Perez omistaa?`. Näet jotain tällaista:

![Data](../../../../../translated_images/fi/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agentin kokeilualusta

Rakennetaan lisäymmärrystä Microsoft Foundryn kyvykkyyksistä kokeilemalla agenttia Agents Playgroundissa. 

1. Palaa Microsoft Foundryn `Agents`-sivulle ja valitse oletusagentti
1. Klikkaa `Try in Playground` -vaihtoehtoa – näet Playgroundin käyttöliittymän, joka näyttää tältä
1. Kysy sama kysymys: `Millaisia tuotteita Amanda Perez omistaa?`

    ![Data](../../../../../translated_images/fi/09-ask-in-playground.a1b93794f78fa676.webp)

Saat saman (tai vastaavan) vastauksen – mutta lisäksi näet lisätietoa, joka auttaa ymmärtämään agentti-sovelluksen vastauksen laatua, kustannuksia ja suorituskykyä. Esimerkiksi:

1. Huomaa, että vastaus sisältää viitteitä niistä data-tiedostoista, joihin vastauksen tieto perustuu
1. Vie hiiri minkä tahansa tiedoston päälle – vastaako tieto kysymystä ja näytettyä vastausta?

Vastauksen alla on myös _stats_-rivi. 

1. Vie hiiri minkä tahansa mittarin päälle – esim. Safety. Näet jotain tällaista
1. Vastaako arvioitu luokitus intuitiotasi vastauksen turvallisuustasosta?

      ![Data](../../../../../translated_images/fi/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Sisäänrakennettu havainnointi

Havainnointi tarkoittaa sovelluksen instrumentointia niin, että sen toiminnasta syntyy dataa, jota voidaan käyttää ymmärtämiseen, virheiden selvittämiseen ja optimointiin. Saadaksesi käsityksen tästä:

1. Klikkaa `View Run Info` -painiketta – näet tämän näkymän. Tämä on esimerkki [Agentin jäljityksestä](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) käytännössä. _Saat tämän näkymän myös klikkaamalla Thread Logs ylävalikon kautta_.

   - Hahmota suoritusvaiheet ja agentin käyttämät työkalut
   - Ymmärrä kokonais-tokenien määrä (verrattuna tuotetun vastauksen tokeneihin)
   - Ymmärrä viive ja missä vaiheessa suoritus vie eniten aikaa

      ![Agent](../../../../../translated_images/fi/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klikkaa `Metadata`-välilehteä nähdäksesi lisäominaisuuksia suorituksesta, jotka voivat olla hyödyllisiä virheiden selvityksessä myöhemmin.   

      ![Agent](../../../../../translated_images/fi/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klikkaa `Evaluations`-välilehteä nähdäksesi agentin vastaukseen liittyvät automaattis-arviot, joihin sisältyy turvallisuusarviointeja (esim. itseä vahingoittava sisältö) ja agenttikohtaisia arviointeja (esim. aikomuksen tunnistus, tehtävän noudattaminen).

      ![Agent](../../../../../translated_images/fi/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Lopuksi, klikkaa `Monitoring` -välilehteä sivuvalikossa.

      - Valitse `Resource usage` -välilehti sivulla - ja tarkastele mittareita.
      - Seuraa sovelluksen resurssien käyttöä kustannusten (tokenien) ja kuormituksen (pyyntöjen) näkökulmasta.
      - Seuraa sovelluksen viivettä ensimmäiseen tavuun (syötteen käsittely) ja viimeiseen tavuun (tuloste).

      ![Agent](../../../../../translated_images/fi/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Ympäristömuuttujat

Tähän asti olemme käyneet läpi käyttöönoton selaimessa - ja vahvistaneet, että infrastruktuuri on provisioitu ja sovellus toimii. Mutta työskennelläksemme sovelluksen koodin parissa, meidän täytyy konfiguroida paikallinen kehitysympäristömme asianmukaisilla muuttujilla, jotka tarvitaan näiden resurssien käyttämiseen. `azd` tekee tästä helppoa.

1. Azure Developer CLI [käyttää ympäristömuuttujia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) tallentaakseen ja hallinnoidakseen sovelluksen käyttöönoton määrityksiä.

1. Ympäristömuuttujat tallennetaan polkuun `.azure/<env-name>/.env` – tämä kohdistaa ne käytössä olevaan `env-name`-ympäristöön ja auttaa eristämään erilaiset ympäristöt saman arkiston sisällä eri käyttöönottojen välillä.

1. `azd` lataa nämä muuttujat automaattisesti aina, kun se suorittaa tietyn komennon (esim. `azd up`). Huomaa, että `azd` ei lue automaattisesti _OS-tason_ ympäristömuuttujia (esim. kuoren asetus) – sen sijaan käytä `azd set env` ja `azd get env` -komentoja tietojen siirtoon skripteissä.


Kokeillaan muutamaa komentoa:

1. Hae kaikki tämän ympäristön `azd`:lle asetetut ympäristömuuttujat:

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

1. Hae tietty arvo – esim. haluan tietää, onko `AZURE_AI_AGENT_MODEL_NAME` asetettu

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Näet jotain tällaista – tätä ei ollut oletuksena asetettu!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Aseta uusi ympäristömuuttuja `azd`:lle. Tässä päivitämme agentin mallin nimen. _Huom: kaikki muutokset näkyvät välittömästi `.azure/<env-name>/.env` -tiedostossa._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nyt arvon pitäisi olla asetettu:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Huomaa, että jotkut resurssit ovat pysyviä (esim. mallin käyttöönotot) ja vaativat enemmän kuin vain `azd up`:n pakottaakseen uudelleenasennuksen. Kokeillaan purkaa alkuperäinen käyttöönotto ja ottaa uudelleen käyttöön muutetuilla ympäristömuuttujilla.

1. **Päivitä** Jos olet aiemmin ottanut infrastruktuurin käyttöön azd-mallilla, voit _päivittää_ paikallisen ympäristömuuttujiesi tilan nykyisen Azure-käyttöönoton tilan perusteella tällä komennolla:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Tämä on tehokas tapa _synkronoida_ ympäristömuuttujia kahden tai useamman paikallisen kehitysympäristön välillä (esim. tiimi, jossa on useita kehittäjiä) - jolloin käyttöönotettu infrastruktuuri toimii totuuden lähteenä ympäristömuuttujien tilasta. Tiimin jäsenet yksinkertaisesti _päivittävät_ muuttujat saadakseen ne takaisin synkassa.

---

## 9. Onnittelut 🏆

Sinä juuri suoritit loppuun kokonaisvaltaisen työnkulun, jossa sinä:

- [X] Valitsit haluamasi AZD-mallipohjan
- [X] Avasit mallipohjan tuetussa kehitysympäristössä
- [X] Otit mallipohjan käyttöön ja varmistit, että se toimii

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->