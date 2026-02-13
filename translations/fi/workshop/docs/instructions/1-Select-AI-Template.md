# 1. Valitse mallipohja

!!! tip "TÄMÄN MODUULIN LOPPUUN MENNESSÄ OSAAT"

    - [ ] Kuvailla, mitä AZD-mallipohjat ovat
    - [ ] Etsiä ja käyttää AZD-mallipohjia tekoälyä varten
    - [ ] Aloittaa AI Agents -mallipohjalla
    - [ ] **Lab 1:** AZD pika-aloitus GitHub Codespacesilla

---

## 1. Rakentajan vertauskuva

Modernin, tuotantovalmiin yritystason tekoälysovelluksen rakentaminen _alusta alkaen_ voi olla pelottavaa. Se on vähän kuin rakentaisit uuden kotisi itse, tiili kerrallaan. Kyllä, se on mahdollista! Mutta se ei ole tehokkain tapa saavuttaa toivottu lopputulos!

Sen sijaan aloitetaan usein olemassa olevalla _suunnitelmalla_ ja työskennellään arkkitehdin kanssa räätälöidäksemme sen omiin vaatimuksiimme. Ja juuri tätä lähestymistapaa kannattaa käyttää älykkäitä sovelluksia rakennettaessa. Etsi ensin hyvä suunnitteluarkkitehtuuri, joka sopii ongelma-alueeseesi. Työskentele sitten ratkaisun arkkitehdin kanssa räätälöidäksesi ja kehittääksesi ratkaisun erityiseen skenaarioosi.

Mutta mistä löydämme nämä suunnitelmapohjat? Entä mistä löydämme arkkitehdin, joka on valmis opettamaan meille, miten räätälöidä ja ottaa nämä suunnitelmat käyttöön itse? Tässä työpajassa vastaamme näihin kysymyksiin esittelemällä kolme teknologiaa:

1. [Azure Developer CLI](https://aka.ms/azd) - avoimen lähdekoodin työkalu, joka nopeuttaa kehittäjän polkua paikallisesta kehityksestä (build) pilottiin (ship).
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - standardisoituja avoimen lähdekoodin repositorioita, jotka sisältävät esimerkkikoodin, infrastruktuuri- ja konfiguraatiotiedostot tekoälyratkaisun arkkitehtuurin käyttöönottoa varten.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - koodausagentti, joka perustuu Azure-osaamiseen ja voi opastaa meitä koodipohjan läpikäynnissä ja muutosten tekemisessä luonnollisella kielellä.

Näiden työkalujen avulla voimme nyt _löytää_ oikean mallipohjan, _ottaa sen käyttöön_ varmistaaksemme että se toimii, ja _räätälöidä_ sen vastaamaan omia scenaarioitamme. Sukelletaan sisään ja opitaan, miten nämä toimivat.


---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) on avoimen lähdekoodin komentorivityökalu, joka voi nopeuttaa koodista pilveen -polkuasi joustavilla, kehittäjäystävällisillä komennoilla, jotka toimivat johdonmukaisesti IDE- (kehitys) ja CI/CD- (devops)ympäristöissä.

`azd`:n avulla käyttöönotto voi olla yksinkertaista:

- `azd init` - Alustaa uuden tekoälyprojektin olemassa olevasta AZD-mallipohjasta.
- `azd up` - Provisionoi infrastruktuurin ja ottaa sovelluksen käyttöön yhdessä vaiheessa.
- `azd monitor` - Tarjoaa reaaliaikaista monitorointia ja vianmääritystä käyttöön otetulle sovellukselle.
- `azd pipeline config` - Konfiguroi CI/CD-putket automatisoimaan käyttöönottoa Azureen.

**🎯 | HARJOITUS**: <br/> Tutustu `azd`-komentorivityökaluun GitHub Codespaces -ympäristössäsi nyt. Aloita kirjoittamalla tämä komento nähdäksesi, mitä työkalu osaa:

```bash title="" linenums="0"
azd help
```

![Prosessi](../../../../../translated_images/fi/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. The AZD Template

Jotta `azd` voi toteuttaa tämän, sen täytyy tietää provisionoitava infrastruktuuri, sovellettavat konfiguraatioasetukset ja sovellus, joka otetaan käyttöön. Tässä vaiheessa tulevat mukaan [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

AZD-mallipohjat ovat avoimen lähdekoodin repositorioita, jotka yhdistävät esimerkkikoodin infrastruktuuriin ja konfiguraatiotiedostoihin, joita tarvitaan ratkaisun arkkitehtuurin käyttöönottoon.
Käyttämällä _Infrastruktuuri koodina_ (IaC) -lähestymistapaa ne mahdollistavat mallipohjan resurssimääritelmien ja konfiguraatioasetusten versionhallinnan (juuri kuten sovelluksen lähdekoodin) — luoden uudelleenkäytettäviä ja yhdenmukaisia työnkulkuja projektin käyttäjille.

Kun luot tai käytät uudelleen AZD-mallipohjaa _omaan_ skenaarioosi, harkitse näitä kysymyksiä:

1. Mitä olet rakentamassa? → Onko olemassa mallipohjaa, joka tarjoaa aloituskoodin tähän skenaarioon?
1. Miten ratkaisusi on arkkitehtuuriltaan rakennettu? → Onko olemassa mallipohjaa, joka sisältää tarvittavat resurssit?
1. Miten ratkaisusi otetaan käyttöön? → Mieti `azd deploy` -komentoa esikäsittely- ja jälkikäsittelykoukkujen kanssa!
1. Miten voit optimoida sitä edelleen? → Mieti sisäänrakennettua monitorointia ja automaatioputkia!

**🎯 | HARJOITUS**: <br/> 
Vieraile [Awesome AZD](https://azure.github.io/awesome-azd/) -galleriassa ja käytä suodattimia tutkiaksesi yli 250 mallipohjaa, jotka ovat tällä hetkellä saatavilla. Katso, löydätkö sellaisen, joka vastaa _sinun_ skenaariosi vaatimuksia.

![Koodi](../../../../../translated_images/fi/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Tekoälysovellusten mallipohjat

Tekoälyä hyödyntäville sovelluksille Microsoft tarjoaa erikoistuneita mallipohjia, jotka sisältävät **Microsoft Foundry**- ja **Foundry Agents** -integraatioita. Nämä mallipohjat nopeuttavat polkuasi kohti älykkäitä, tuotantovalmiita sovelluksia.

### Microsoft Foundry & Foundry Agents -mallipohjat

Valitse alla oleva mallipohja ottaaksesi sen käyttöön. Jokainen mallipohja on saatavilla [Awesome AZD](https://azure.github.io/awesome-azd/) -galleriassa ja se voidaan alustaa yhdellä komennolla.

| Mallipohja | Kuvaus | Käyttöönotto-komento |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Keskustelusovellus, joka käyttää Retrieval Augmented Generationia Microsoft Foundryn avulla | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Rakenna AI-agentteja Foundry Agents -alustan avulla autonomista tehtävien suorittamista varten | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Koordinoi useita Foundry Agentteja monimutkaisiin työnkulkuihin | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Uutea ja analysoi asiakirjoja Microsoft Foundryn mallien avulla | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Rakenna älykkäitä chatboteja Microsoft Foundry -integraatiolla | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Luo kuvia DALL-E:n avulla Microsoft Foundryn kautta | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | AI-agentteja, jotka käyttävät Semantic Kernelia yhdessä Foundry Agents -ratkaisun kanssa | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Moniagenttijärjestelmiä, jotka käyttävät AutoGen-kehystä | `azd init -t azure-samples/autogen-multi-agent` |

### Nopea aloitus

1. **Selaa mallipohjia**: Vieraile [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) ja suodata kohteita `AI`, `Agents` tai `Microsoft Foundry`
2. **Valitse mallipohja**: Valitse skenaarioosi sopiva
3. **Alusta**: Suorita `azd init` -komento valitsemallesi mallipohjalle
4. **Ota käyttöön**: Suorita `azd up` provisionoidaksesi ja ottaaksesi käyttöön

**🎯 | HARJOITUS**: <br/>
Valitse yksi yllä olevista mallipohjista skenaariosi perusteella:

- **Rakennat chatbotin?** → Aloita **AI Chat with RAG**- tai **Conversational AI Bot** -mallipohjalla
- **Tarvitset autonomisia agenteja?** → Kokeile **Foundry Agent Service Starter**- tai **Multi-Agent Orchestration** -mallipohjia
- **Käsittelet asiakirjoja?** → Käytä **AI Document Intelligence** -mallipohjaa
- **Haluat tekoälyavusteista koodausapua?** → Tutki **Semantic Kernel Agent**- tai **AutoGen Multi-Agent** -vaihtoehtoja

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Tutki lisää mallipohjia"
    [Awesome AZD -galleria](https://azure.github.io/awesome-azd/) sisältää yli 250 mallipohjaa. Käytä suodattimia löytääksesi mallipohjia, jotka vastaavat erityisiä vaatimuksiasi kielen, kehyskirjaston ja Azure-palveluiden osalta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Pyrimme tarkkuuteen, mutta huomioithan, että automatisoiduissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää ensisijaisena lähteenä. Kriittisten tietojen kohdalla suositellaan ammattimaisen ihmiskääntäjän tekemää käännöstä. Emme vastaa mahdollisista väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->