# 2. Vahvista mallipohja

> Vahvistettu versiolla `azd 1.25.6` kesäkuussa 2026.

!!! tip "TÄMÄN MODUULIN LOPPUUN MENNESSÄ OSAAT"

    - [ ] Analysoida AI-ratkaisun arkkitehtuuria
    - [ ] Ymmärtää AZD:n käyttöönoton työnkulun
    - [ ] Käyttää GitHub Copilotia saadakseen apua AZD:n käyttöön
    - [ ] **Lab 2:** Ota käyttöön ja vahvista AI Agents -mallipohja

---


## 1. Johdanto

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) tai `azd` on avoimen lähdekoodin komentorivityökalu, joka virtaviivaistaa kehittäjän työnkulkua sovelluksia rakennettaessa ja otettaessa käyttöön Azureen. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ovat standardoituja repoja, jotka sisältävät esimerkkisovelluskoodia, _infrastruktuuri-koodina_ -resursseja ja `azd`-konfiguraatiotiedostoja yhtenäistä ratkaisun arkkitehtuuria varten. Infrastruktuurin provisiointi voi olla yhtä yksinkertaista kuin `azd provision` -komento - ja `azd up` antaa sinun provisioida infrastruktuurin **ja** ottaa sovellus käyttöön yhdellä kertaa!

Tämän seurauksena sovelluskehityksen käynnistäminen voi olla yhtä yksinkertaista kuin sopivan _AZD Starter template_ -mallipohjan löytäminen, joka vastaa parhaiten sovelluksesi ja infrastruktuurisi tarpeita - ja sitten repositorion mukauttaminen omia skenaarioita varten.

Ennen kuin aloitamme, varmistetaan, että sinulla on Azure Developer CLI asennettuna.

1. Avaa VS Code -terminaali ja kirjoita tämä komento:

      ```bash title="" linenums="0"
      azd version
      ```

1. Näet jotain tällaista!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Olet nyt valmis valitsemaan ja ottamaan käyttöön mallipohjan azd:llä**

---

## 2. Mallipohjan valinta

Microsoft Foundry -alusta sisältää [joukon suositeltuja AZD-mallipohjia](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), jotka kattavat suosittuja ratkaisuskenaarioita kuten _moni-agenttinen työnkulun automaatio_ ja _monimodaalinen sisällön käsittely_. Voit myös löytää nämä mallipohjat vierailemalla Microsoft Foundry -portaalissa.

1. Vieraile osoitteessa [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Kirjaudu Microsoft Foundry -portaaliin, kun sinua pyydetään - näet jotain tällaista.

![Valitse](../../../../../translated_images/fi/01-pick-template.60d2d5fff5ebc374.webp)


The **Basic** vaihtoehdot ovat aloitusmallipohjasi:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) joka ottaa käyttöön perussovelluksen keskustelulle _omilla tiedoillasi_ Azure Container Appsiin. Käytä tätä tutkiaksesi perus AI-chattibotin skenaariota.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) joka myös ottaa käyttöön standardin AI Agentin (Foundry Agentsien kanssa). Käytä tätä tutustuaksesi agenttipohjaisiin AI-ratkaisuihin, jotka sisältävät työkaluja ja malleja.

Vieraile toisessa linkissä uuteen selainvälilehteen (tai klikkaa kortista `Open in GitHub`). Näet tämän AZD-mallipohjan repositorion. Käy README läpi muutaman hetken ajan. Sovelluksen arkkitehtuuri näyttää tältä:

![Arkkitehtuuri](../../../../../translated_images/fi/architecture.8cec470ec15c65c7.webp)

---

## 3. Mallipohjan aktivointi

Kokeillaan ottaa tämä mallipohja käyttöön ja varmistetaan, että se on pätevä. Seuraamme ohjeita [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) -osiosta.

1. Valitse työskentely-ympäristö mallipohjan repositoriolle:

      - **GitHub Codespaces**: Napsauta [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ja vahvista `Create codespace`
      - **Local clone or dev container**: Klonkaa `Azure-Samples/get-started-with-ai-agents` ja avaa se VS Codessa

1. Odota, kunnes VS Code -terminaali on valmis, ja kirjoita sitten seuraava komento:

   ```bash title="" linenums="0"
   azd up
   ```

Suorita työnkulun vaiheet, jotka tämä käynnistää:

1. Sinua pyydetään kirjautumaan Azureen - seuraa ohjeita kirjautuaksesi
1. Anna uniikki ympäristön nimi itsellesi - esim. minä käytin `nitya-mshack-azd`
1. Tämä luo `.azure/`-kansion - näet alikansion, jossa on ympäristön nimi
1. Sinua pyydetään valitsemaan tilaus - valitse oletus
1. Sinua pyydetään valitsemaan sijainti - käytä `East US 2`

Nyt odotat provisioinnin valmistumista. **Tämä kestää 10–15 minuuttia**

1. Kun prosessi on valmis, konsolissasi näkyy SUCCESS-viesti, joka näyttää tältä:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure-portaalissasi on nyt provisioitu resurssiryhmä sillä ympäristön nimellä:

      ![Infrastruktuuri](../../../../../translated_images/fi/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Olet nyt valmis validoimaan provisioidun infrastruktuurin ja sovelluksen**.

---

## 4. Mallipohjan validointi

1. Vieraile Azure Portalissa [Resource Groups](https://portal.azure.com/#browse/resourcegroups) -sivulla - kirjaudu sisään, kun sinua pyydetään
1. Klikkaa ympäristönimesi resurssiryhmää - näet yllä olevan sivun

      - klikkaa Azure Container Apps -resurssia
      - klikkaa Application Url -kohtaa _Essentials_-osiosta (oikea yläkulma)

1. Näet isännöidyn sovelluksen käyttöliittymän etupään, joka näyttää tältä:

   ![Sovellus](../../../../../translated_images/fi/03-test-application.471910da12c3038e.webp)

1. Kokeile esittää pari [esimerkkikysymystä](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Kysy: ```What is the capital of France?``` 
      1. Kysy: ```What's the best tent under $200 for two people, and what features does it include?```

1. Saat vastauksia, jotka ovat samanlaisia kuin alla näytetyt. _Mutta miten tämä toimii?_ 

      ![Sovellus](../../../../../translated_images/fi/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agentin validointi

Azure Container App julkaisee päätepisteen, joka yhdistyy AI Agenttiin, joka on provisioitu tämän mallipohjan Microsoft Foundry -projektiin. Katsotaanpa mitä se tarkoittaa.

1. Palaa Azure Portalin resurssiryhmän _Overview_ -sivulle

1. Klikkaa listalta `Microsoft Foundry` -resurssia

1. Näet tämän. Klikkaa `Go to Microsoft Foundry Portal` -painiketta. 
   ![Foundry](../../../../../translated_images/fi/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Näet Foundry-projektisivun AI-sovelluksellesi
   ![Projekti](../../../../../translated_images/fi/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klikkaa `Agents` - näet projektissasi provisionoidun oletusagentin
   ![Agentit](../../../../../translated_images/fi/06-visit-agents.bccb263f77b00a09.webp)

1. Valitse se - ja näet agentin tiedot. Huomioi seuraavat seikat:

      - Agentti käyttää oletuksena Tiedostohakua (aina)
      - Agentin `Knowledge` osoittaa, että siihen on ladattu 32 tiedostoa (tiedostohakua varten)
      ![Agentit](../../../../../translated_images/fi/07-view-agent-details.0e049f37f61eae62.webp)

1. Etsi vasemmasta valikosta `Data+indexes` -vaihtoehto ja klikkaa nähdäksesi tiedot. 

      - Näet 32 ladattua data-/tiedostoa, jotka muodostavat tiedon pohjan.
      - Nämä vastaavat `src/files`-kansion 12 asiakastiedostoa ja 20 tuotetiedostoa 
      ![Tiedot](../../../../../translated_images/fi/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Olet vahvistanut agentin toiminnan!** 

1. Agentin vastaukset perustuvat noihin tiedostoihin.
1. Nyt voit esittää kysymyksiä, jotka liittyvät noihin tietoihin, ja saada perusteltuja vastauksia.
1. Esimerkki: `customer_info_10.json` kuvaa kolmea ostosta, jotka "Amanda Perez" on tehnyt

Palaa selaimen välilehteen, jossa Container Appin päätepiste on auki, ja kysy: `What products does Amanda Perez own?`. Näet jotain tällaista:

![Tiedot](../../../../../translated_images/fi/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agentin leikkikenttä

Rakennetaan hieman lisää ymmärrystä Microsoft Foundryn kyvykkyyksistä kokeilemalla agenttia Agents Playgroundissa. 

1. Palaa Microsoft Foundryn `Agents`-sivulle - valitse oletusagentti
1. Klikkaa `Try in Playground` -vaihtoehtoa - saat Playground-käyttöliittymän, joka näyttää tältä
1. Kysy sama kysymys: `What products does Amanda Perez own?`

    ![Tiedot](../../../../../translated_images/fi/09-ask-in-playground.a1b93794f78fa676.webp)

Saat saman (tai samanlaisen) vastauksen - mutta saat myös lisätietoja, joita voit käyttää arvioidaksesi agenttipohjaisen sovelluksesi laatua, kustannuksia ja suorituskykyä. Esimerkiksi:

1. Huomaa, että vastaus viittaa käytettyihin tiedostodokumentteihin, jotka "maadoittavat" vastauksen
1. Vie hiiri minkä tahansa tiedostotunnisteen päälle - vastaako tiedon sisältö kysymystäsi ja näytettyä vastausta?

Näet myös vastauksen alla _tilastot_-rivin. 

1. Vie hiiri minkä tahansa mittarin päälle - esim. Safety. Näet jotain tällaista
1. Vastaako arvioitu luokitus intuitiotasi vastausvarmuuden tasosta?

      ![Tiedot](../../../../../translated_images/fi/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Sisäänrakennettu havaittavuus

Havaittavuus tarkoittaa sovelluksen instrumentointia siten, että se tuottaa dataa, jota voidaan käyttää toimintojen ymmärtämiseen, virheiden selvittämiseen ja optimointiin. Tämän hahmottamiseksi:

1. Klikkaa `View Run Info` -painiketta - näet tämän näkymän. Tämä on esimerkki [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) -toiminnasta käytännössä. _Saat tämän näkymän myös klikkaamalla Thread Logs ylävalikosta_.

   - Hahmota ajon vaiheet ja agentin käyttämät työkalut
   - Ymmärrä kokonais Token-määrä (vs. ulostulon tokenien käyttö) vastauksessa
   - Ymmärrä viiveet ja missä kohtaa suoritusajassa aikaa kuluu

      ![Agentti](../../../../../translated_images/fi/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klikkaa `Metadata`-välilehteä nähdäksesi lisäattribuutteja ajosta, jotka voivat antaa hyödyllistä kontekstia vikatilanteiden selvittämiseen myöhemmin.   

      ![Agentti](../../../../../translated_images/fi/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klikkaa `Evaluations`-välilehteä nähdäksesi automaattiset arviot agentin vastauksesta. Näihin sisältyy turvallisuusarviointeja (esim. Itsevahingoittelu) ja agenttispesifisiä arviointeja (esim. intentin ratkaisu, tehtävän noudattaminen).

      ![Agentti](../../../../../translated_images/fi/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Viimeisenä mutta ei vähäisimpänä, klikkaa sivupalkin `Monitoring`-välilehteä.

      - Valitse näytetyllä sivulla `Resource usage` -välilehti - ja tarkastele mittareita.
      - Seuraa sovelluksen käyttöä kustannusten (tokenit) ja kuormituksen (pyynnöt) suhteen.
      - Seuraa sovelluksen viivettä ensimmäiseen tavuun (syötteen käsittely) ja viimeiseen tavuun (tulostus).

      ![Agentti](../../../../../translated_images/fi/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Ympäristömuuttujat

Tähän mennessä olemme käyneet läpi käyttöönoton selaimessa - ja vahvistaneet, että infrastruktuuri on provisioitu ja sovellus toimii. Mutta työskennelläksemme sovelluksen kanssa _koodipohjaisesti_, meidän täytyy konfiguroida paikallinen kehitysympäristömme asiaankuuluvilla muuttujilla, joita tarvitaan näiden resurssien kanssa työskentelemiseen. `azd` tekee tästä helppoa.

1. Azure Developer CLI [käyttää ympäristömuuttujia](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) tallentaakseen ja hallitakseen konfiguraatioasetuksia sovelluksen käyttöönottoja varten.

1. Ympäristömuuttujat tallennetaan polkuun `.azure/<env-name>/.env` - tämä rajaa ne käytettyyn `env-name`-ympäristöön ja auttaa eristämään ympäristöjä eri käyttökohteiden välillä samassa repossa.

1. Ympäristömuuttujat ladataan automaattisesti `azd`-komennon toimesta aina, kun se suorittaa tietyn komennon (esim. `azd up`). Huomaa, että `azd` ei automaattisesti lue käyttöjärjestelmän tason ympäristömuuttujia (esim. kuoren asetuksia) - käytä sen sijaan `azd set env` ja `azd get env` siirtääksesi tietoja skriptien sisällä.


Kokeillaan muutamia komentoja:

1. Hae kaikki tässä ympäristössä `azd`-työkalulle asetetut ympäristömuuttujat:

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
      
      Näet jotain tällaista - sitä ei asetettu oletuksena!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Aseta uusi ympäristömuuttuja `azd`:lle. Tässä päivitämme agentin mallin nimen. _Huom: kaikki tehdyt muutokset näkyvät välittömästi tiedostossa `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nyt meidän pitäisi löytää arvo asetettuna:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Huomaa, että jotkut resurssit ovat pysyviä (esim. mallien deployt) ja niiden uudelleenkäynnistäminen vaatii enemmän kuin pelkän `azd up` -komennon pakottaakseen uudelleendeployn. Kokeillaan purkaa alkuperäinen käyttöönotto ja ottaa se uudelleen käyttöön muuttuneilla ympäristömuuttujilla.

1. **Päivitä** Jos olet aiemmin ottanut infrastruktuurin käyttöön azd-mallipohjalla - voit _päivittää_ paikallisten ympäristömuuttujiesi tilan Azure-käyttöönoton nykytilan perusteella käyttämällä tätä komentoa:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Tämä on tehokas tapa _synkronoida_ ympäristömuuttujia kahden tai useamman paikallisen kehitysympäristön välillä (esim. tiimi, jossa on useita kehittäjiä) - antaen käyttöön otetun infrastruktuurin toimia ympäristömuuttujien tilan totuudenlähteenä. Tiimin jäsenet yksinkertaisesti _päivittävät_ muuttujat saadakseen ne jälleen synkronoitua.

---

## 9. Onnittelut 🏆

Olet juuri suorittanut päästä päähän -työnkulun, jossa:

- [X] Valitsit käytettäväksi haluamasi AZD Template
- [X] Avasit mallin tuetussa kehitysympäristössä
- [X] Otit mallin käyttöön ja varmistit, että se toimii

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->