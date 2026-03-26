# Muutospäiväkirja - AZD Aloittelijoille

## Johdanto

Tämä muutospäiväkirja dokumentoi kaikki merkittävät muutokset, päivitykset ja parannukset AZD For Beginners -repossa. Noudatamme semanttisen versionhallinnan periaatteita ja ylläpidämme tätä lokia auttaaksemme käyttäjiä ymmärtämään, mitä versioiden välillä on muuttunut.

## Oppimistavoitteet

Tarkastelemalla tätä muutospäiväkirjaa:
- Pysyt ajan tasalla uusista ominaisuuksista ja sisällön lisäyksistä
- Ymmärrät olemassa olevan dokumentaation parannukset
- Seuraat virheiden korjauksia ja tarkistuksia varmistaaksesi tarkkuuden
- Seuraat oppimateriaalien kehittymistä ajan myötä

## Oppimistulokset

Muutospäiväkirjan merkintöjä tarkasteltuasi osaat:
- Tunnistaa uutta oppimiseen saatavilla olevaa sisältöä ja resursseja
- Ymmärtää, mitä osioita on päivitetty tai parannettu
- Suunnitella oppimispolkusi ajantasaisimman materiaalin perusteella
- Antaa palautetta ja ehdotuksia tulevia parannuksia varten

## Versiohistoria

### [v3.18.0] - 2026-03-16

#### AZD AI CLI -komennot, sisällön validointi & mallien laajennus
**Tässä versiossa lisätään `azd ai`, `azd extension` ja `azd mcp` -komentojen kattavuus kaikkiin AI:hin liittyviin lukuihin, korjataan rikkinäisiä linkkejä ja vanhentunutta koodia agents.md:ssä, päivitetään pikatiedot, ja uudistetaan Esimerkkimallit-osio validoiduilla kuvauksilla ja uusilla Azure AI AZD -malleilla.**

#### Lisätty
- **🤖 AZD AI CLI -kattavuus** 7 tiedostossa (aiemmin vain Luku 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Uusi "Extensions and AI Commands" -osio, joka esittelee `azd extension`, `azd ai agent init` ja `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Vaihtoehto 4: `azd ai agent init` vertailutaulukolla (template vs manifest -lähestymistapa)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" ja "Agent-First Deployment" -aliosiokset
  - `docs/chapter-05-multi-agent/README.md` — Quick Start näyttää nyt sekä template- että manifest-pohjaiset käyttöönotot
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-osio sisältää nyt `azd ai agent init` -vaihtoehdon
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" -aliohjelma
  - `resources/cheat-sheet.md` — Uusi "AI & Extensions Commands" -osio sisältäen `azd extension`, `azd ai agent init`, `azd mcp` ja `azd infra generate`
- **📦 Uudet AZD AI -esimerkkimallit** tiedostossa `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG -keskustelu Blazor WebAssemblyllä, Semantic Kernelilla ja puhechatin tuella
  - **azure-search-openai-demo-java** — Java RAG -keskustelu käyttäen Langchain4J:ta ACA/AKS käyttöönotto-optioilla
  - **contoso-creative-writer** — Moni-agenttinen luovan kirjoittamisen sovellus käyttäen Azure AI Agent Servicea, Bing Groundingia ja Promptyä
  - **serverless-chat-langchainjs** — Serverless RAG käyttäen Azure Functions + LangChain.js + Cosmos DB ja Ollama paikallinen kehitystuki
  - **chat-with-your-data-solution-accelerator** — Yritys-tason RAG-kiihdytin ylläpitoportaalilla, Teams-integraatiolla ja PostgreSQL/Cosmos DB -vaihtoehdoilla
  - **azure-ai-travel-agents** — Moni-agenttinen MCP-orchestraatio referenssisovellus .NET-, Python-, Java- ja TypeScript-palvelimilla
  - **azd-ai-starter** — Miniminen Azure AI -infrastruktuurin Bicep-aloitusmalli
  - **🔗 Awesome AZD AI Gallery -linkki** — Viittaus [awesome-azd AI -galleriaan](https://azure.github.io/awesome-azd/?tags=ai) (80+ mallia)

#### Korjattu
- **🔗 agents.md navigaatio**: Previous/Next -linkit vastaavat nyt Luku 2 README -opetuksen järjestystä (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md rikkinäiset linkit**: `production-ai-practices.md` korjattu muotoon `../chapter-08-production/production-ai-practices.md` (3 esiintymää)
- **📦 agents.md vanhentunut koodi**: Korvattu `opencensus` paketilla `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md virheellinen API**: Siirretty `max_tokens` `create_agent()`-kutsusta `create_run()`-kutsuun nimeksi `max_completion_tokens`
- **🔢 agents.md token-laskenta**: Korvattu karkea `len//4` -arvio `tiktoken.encoding_for_model()` -käytöllä
- **azure-search-openai-demo**: Palvelut korjattu muotoon "Azure AI Search + Azure Container Apps" aiemman "Cognitive Search + App Service" sijaan (oletus-isäntä muuttui lokakuussa 2024)
- **contoso-chat**: Kuvausta päivitetty viittaamaan Azure AI Foundryyn + Promptyyn, vastaamaan repositorion todellista otsikkoa ja teknologiaa

#### Poistettu
- **ai-document-processing**: Poistettu ei-toimiva malliviittaus (repo ei ole julkisesti saatavilla AZD-mallina)

#### Parannettu
- **📝 agents.md harjoitukset**: Harjoitus 1 näyttää nyt odotetun tulosteen ja `azd monitor` -vaiheen; Harjoitus 2 sisältää täydellisen `FunctionTool`-rekisteröintikoodin; Harjoitus 3 korvaa epämääräisen ohjeistuksen konkreettisilla `prepdocs.py` -komennoilla
- **📚 agents.md resurssit**: Päivitetyt dokumentaatiolinkit nykyisiin Azure AI Agent Service -dokumentteihin ja quickstartiin
- **📋 agents.md Next Steps -taulukko**: Lisätty AI Workshop Lab -linkki koko luvun kattavuuteen

#### Päivitetyt tiedostot
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Kurssin navigoinnin parannus
**Tässä versiossa parannetaan README.md -lukujen navigointia laajennetulla taulukkomuodolla.**

#### Muutettu
- **Kurssikarttataulukko**: Parannettu suorin oppituntilinkein, kestoarvioin ja vaikeustasoarvioin
- **Kansiopuhdistus**: Poistettu päällekkäisiä vanhoja kansioita (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkin validointi**: Kaikki yli 21 sisäistä linkkiä Kurssikartta-taulukossa varmistettu

### [v3.16.0] - 2026-02-05

#### Tuotenimen päivitykset
**Tässä versiossa päivitetään tuoteviittaukset nykyiseen Microsoftin brändäykseen.**

#### Muutettu
- **Microsoft Foundry → Microsoft Foundry**: Kaikki viittaukset päivitetty käännös-tiedostojen ulkopuolella
- **Azure AI Agent Service → Foundry Agents**: Palvelun nimi päivitetty vastaamaan nykyistä brändäystä

#### Päivitetyt tiedostot
- `README.md` - Kurssin pääsivu
- `changelog.md` - Versiohistoria
- `course-outline.md` - Kurssin rakenne
- `docs/chapter-02-ai-development/agents.md` - AI-agenttien opas
- `examples/README.md` - Esimerkkien dokumentaatio
- `workshop/README.md` - Työpajan aloitussivu
- `workshop/docs/index.md` - Työpajan indeksi
- `workshop/docs/instructions/*.md` - Kaikki työpajan ohjetiedostot

---

### [v3.15.0] - 2026-02-05

#### Suuri repositorion uudelleenjärjestely: Kansioiden nimeäminen lukujen mukaisesti
**Tässä versiossa dokumentaatio on jäsennelty omiin luku-kansioihin selkeämmän navigoinnin vuoksi.**

#### Kansionimet muuttuneet
Vanhojen kansioiden tilalle on tullut luku-numeroidut kansiot:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lisätty uusi: `docs/chapter-05-multi-agent/`

#### Tiedostomigraatiot
| File | From | To |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Lisätty
- **📚 Luku-README-tiedostot**: Luotu README.md jokaiseen luku-kansioon sisältäen:
  - Oppimistavoitteet ja arvioitu kesto
  - Oppituntitaulukko kuvauksineen
  - Pika-aloituskäskyt
  - Navigointi muihin lukuihin

#### Muutettu
- **🔗 Kaikkien sisäisten linkkien päivitys**: Yli 78 polkua päivitetty dokumentaation eri tiedostoissa
- **🗺️ Pää-README.md**: Kurssikartta päivitetty uuteen luku-rakenteeseen
- **📝 examples/README.md**: Päivitetyt viittaukset luku-kansioihin

#### Poistettu
- Vanha kansiorakenne (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repositorion uudelleenjärjestely: Luku-navigointi
**Tässä versiossa lisättiin lukujen navigointi-README-tiedostoja (korvattu v3.15.0:ssa).**

---

### [v3.13.0] - 2026-02-05

#### Uusi AI Agenttien opas
**Tässä versiossa lisätään kattava opas AI-agenttien käyttöönotosta Azure Developer CLI:llä.**

#### Lisätty
- **🤖 docs/microsoft-foundry/agents.md**: Täydellinen opas, joka kattaa:
  - Mitä AI-agentit ovat ja miten ne eroavat chatbot:eista
  - Kolme pika-aloitus agenttimallia (Foundry Agents, Prompty, RAG)
  - Agenttiarkkitehtuurimallit (yksi agentti, RAG, moni-agentti)
  - Työkalujen konfigurointi ja räätälöinti
  - Monitorointi ja metriikkojen seuranta
  - Kustannusnäkökohdat ja optimointi
  - Yleiset vianetsintätilanteet
  - Kolme käytännön harjoitusta onnistumiskriteereineen

#### Sisällön rakenne
- **Johdanto**: Agenttikonseptit aloittelijoille
- **Pika-aloitus**: Agenttien käyttöönotto `azd init --template get-started-with-ai-agents` -komennolla
- **Arkkitehtuurimallit**: Visuaaliset kaaviot agenttimalleista
- **Konfigurointi**: Työkalujen asennus ja ympäristömuuttujat
- **Monitorointi**: Application Insights -integraatio
- **Harjoitukset**: Portaittain etenevä käytännön oppiminen (20–45 minuuttia kukin)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-ympäristön päivitys
**Tässä versiossa päivitetään kehityssäiliön konfiguraatio moderneilla työkaluilla ja paremmilla oletusasetuksilla AZD-oppimiskokemusta varten.**

#### Muutettu
- **🐳 Peruskuva**: Päivitetty `python:3.12-bullseye` → `python:3.12-bookworm` (uusin Debian stable)
- **📛 Säiliön nimi**: Nimetty uudelleen "Python 3" → "AZD for Beginners" selkeyden vuoksi

#### Lisätty
- **🔧 Uudet kehityssäiliöominaisuudet**:
  - `azure-cli` with Bicep support enabled
  - `node:20` (LTS-versio AZD-malleille)
  - `github-cli` for template management
  - `docker-in-docker` for container app deployments

- **🔌 Porttien edelleenlähetys**: Esikonfiguroidut portit yleiseen kehitykseen:
  - 8000 (MkDocs-esikatselu)
  - 3000 (Verkkosovellukset)
  - 5000 (Python Flask)
  - 8080 (API:t)

- **🧩 Uudet VS Code -laajennukset**:
  - `ms-python.vscode-pylance` - Parannettu Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions -tuki
  - `ms-azuretools.vscode-docker` - Docker-tuki
  - `ms-azuretools.vscode-bicep` - Bicep-kielen tuki
  - `ms-azure-devtools.azure-resource-groups` - Azure-resurssien hallinta
  - `yzhang.markdown-all-in-one` - Markdownin muokkaus
  - `DavidAnson.vscode-markdownlint` - Markdownin tarkistus
  - `bierner.markdown-mermaid` - Mermaid-kaavioiden tuki
  - `redhat.vscode-yaml` - YAML-tuki (azure.yaml:lle)
  - `eamodio.gitlens` - Gitin visualisointi
  - `mhutchie.git-graph` - Git-historia

- **⚙️ VS Code -asetukset**: Lisätty oletusasetuksia Python-tulkille, tallennettaessa muotoilu ja välilyöntien poisto

- **📦 Päivitetty requirements-dev.txt**:
  - Lisätty MkDocs minify -lisäosa
  - Lisätty pre-commit koodin laadunvarmistukseen
  - Lisätty Azure SDK -paketteja (azure-identity, azure-mgmt-resource)

#### Korjattu
- **Post-Create-komento**: Nyt tarkistaa AZD- ja Azure CLI -asennuksen säiliön käynnistyessä

---

### [v3.11.0] - 2026-02-05

#### Aloittelijaystävällinen README-uudistus
**Tämä versio parantaa README.md:tä merkittävästi tekemällä siitä saavutettavamman aloittelijoille ja lisää olennaisia resursseja tekoälykehittäjille.**

#### Lisätty
- **🆚 Azure CLI vs AZD -vertailu**: Selkeä selitys siitä, milloin käyttää kumpaakin työkalua käytännön esimerkkien kera
- **🌟 Huippu AZD -linkit**: Suorat linkit yhteisön malligalleriaan ja osallistumisresursseihin:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - yli 200 valmista käyttöön otettavaa mallia
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Yhteisön osallistuminen
- **🎯 Pika-aloitusopas**: Yksinkertaistettu kolmen vaiheen aloitusosio (Asenna → Kirjaudu sisään → Ota käyttöön)
- **📊 Kokemukseen perustuva navigaatiotaulukko**: Selkeä ohjeistus mistä aloittaa kehittäjän kokemuksen perusteella

#### Muutokset
- **README-rakenne**: Uudelleenjärjestetty vaiheittaiseen paljastukseen — tärkeimmät tiedot ensin
- **Esittelyosio**: Uudelleenkirjoitettu selittämään `azd up`-komennon taika täydellisille aloittelijoille
- **Poistettu päällekkäinen vianmääritysosio**
- **Vianmäärityskomennot**: Korjattu `azd logs` -viittaus käyttämään kelvollista `azd monitor --logs`

#### Korjattu
- **🔐 Autentikointikomennot**: Lisätty `azd auth login` ja `azd auth logout` tiedostoon cheat-sheet.md
- **Virheelliset komennon viittaukset**: Poistettu jäljellä olevat `azd logs` README:n vianmääritysosiosta

#### Huomiot
- **Laajuus**: Muutokset sovellettiin pää-README.md:ään ja resources/cheat-sheet.md:ään
- **Kohdeyleisö**: Parannukset kohdistettu erityisesti AZD:hen tutustuville kehittäjille

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI -komentojen tarkkuuspäivitys
**Tämä versio korjaa dokumentaation läpi esiintyneet olemattomat AZD-komennot, varmistaen että kaikki koodiesimerkit käyttävät kelvollista Azure Developer CLI -syntaksia.**

#### Korjattu
- **🔧 Ei-olemassa olevat AZD-komennot poistettu**: Kattava auditointi ja virheellisten komentojen korjaus:
  - `azd logs` (ei ole olemassa) → korvattu `azd monitor --logs`-komennolla tai Azure CLI -vaihtoehdoilla
  - `azd service`-alikäskyt (eivät ole olemassa) → korvattu `azd show`-komennolla ja Azure CLI:llä
  - `azd infra import/export/validate` (eivät ole olemassa) → poistettu tai korvattu kelvollisilla vaihtoehdoilla
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes`-liput (eivät ole olemassa) → poistettu
  - `azd provision --what-if/--rollback`-liput (eivät ole olemassa) → päivitetty käyttämään `--preview`
  - `azd config validate` (ei ole olemassa) → korvattu `azd config list`
  - `azd info`, `azd history`, `azd metrics` (eivät ole olemassa) → poistettu

- **📚 Tiedostot päivitetty komentokorjauksilla**:
  - `resources/cheat-sheet.md`: Suuri uudistus komentoviitteeseen
  - `docs/deployment/deployment-guide.md`: Korjatut palautus- ja käyttöönotto-strategiat
  - `docs/troubleshooting/debugging.md`: Korjatut lokien analysointi -osiot
  - `docs/troubleshooting/common-issues.md`: Päivitetyt vianmäärityskomennot
  - `docs/troubleshooting/ai-troubleshooting.md`: Korjattu AZD-debuggausosio
  - `docs/getting-started/azd-basics.md`: Korjatut monitorointikomennot
  - `docs/getting-started/first-project.md`: Päivitetyt monitorointi- ja debuggausesimerkit
  - `docs/getting-started/installation.md`: Korjatut ohje- ja versioesimerkit
  - `docs/pre-deployment/application-insights.md`: Korjatut lokien katselumiskomennot
  - `docs/pre-deployment/coordination-patterns.md`: Korjatut agenttien debuggauskomennot

#### Muutokset
- **Palautusstrategiat**: Päivitetty dokumentaatio käyttämään Git-pohjaista palautusta (AZD:llä ei ole natiivia palautusta)
- **Lokin katselu**: Korvattu `azd logs`-viittaukset komentoilla `azd monitor --logs`, `azd monitor --live` ja Azure CLI -komennoilla
- **Suorituskykyosio**: Poistettu olemattomat rinnakkais-/inkrementaaliset käyttöönotto-liput, tarjottu kelvolliset vaihtoehdot

#### Tekniset tiedot
- **Kelvolliset AZD-komennot**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Kelvolliset azd monitor -liput**: `--live`, `--logs`, `--overview`
- **Poistetut ominaisuudet**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Huomiot
- **Varmistus**: Komennot validoitu Azure Developer CLI v1.23.x:ää vastaan

---

### [v3.9.0] - 2026-02-05

#### Työpajan valmistuminen ja dokumentaation laadun päivitys
**Tämä versio viimeistelee interaktiiviset työpajamoduulit, korjaa kaikki rikkinäiset dokumentaatiolinkit ja parantaa yleistä sisältölaatua Microsoft AZD:tä käyttäville tekoälykehittäjille.**

#### Lisätty
- **📝 CONTRIBUTING.md**: Uusi ohjeistus osallistumista varten, sisältäen:
  - Selkeät ohjeet virheiden raportointiin ja muutosehdotuksiin
  - Dokumentaation standardit uudelle sisällölle
  - Koodiesimerkkien ohjeet ja commit-viestien käytännöt
  - Tietoa yhteisön osallistumisesta

#### Valmistunut
- **🎯 Työpajan moduuli 7 (Yhteenveto)**: Täysin valmis yhteenvetomoduuli, joka sisältää:
  - Kattava yhteenveto työpajan saavutuksista
  - Keskeiset opitut käsitteet -osio, joka kattaa AZD:n, mallit ja Microsoft Foundryn
  - Suositukset oppimispolun jatkamiseksi
  - Työpajan haasteharjoituksia vaikeustasoilla
  - Yhteisön palaute- ja tukilinkit

- **📚 Työpajan moduuli 3 (Deconstruct)**: Päivitetyt oppimistavoitteet, sisältäen:
  - Ohjeet GitHub Copilotin ja MCP-palvelimien aktivointiin
  - Ymmärrys AZD-mallikansiorakenteesta
  - Infrastructure-as-code (Bicep) -järjestelymallit
  - Käytännön lab-ohjeet

- **🔧 Työpajan moduuli 6 (Teardown)**: Valmistunut, sisältäen:
  - Resurssien siivous ja kustannusten hallinnan tavoitteet
  - `azd down`-komennon käyttö turvalliseen infrastruktuurin poistoon
  - Cognitive Servicesin pehmeästi poistettujen resurssien palautusohjeet
  - Lisätehtäviä GitHub Copilotille ja Azure Portalille

#### Korjattu
- **🔗 Rikkinäisten linkkien korjaukset**: Korjattu yli 15 rikkinäistä sisäistä dokumentaatiolinkkiä:
  - `docs/ai-foundry/ai-model-deployment.md`: Korjattu polut tiedostoon microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korjattu ai-model-deployment.md ja production-ai-practices.md -polut
  - `docs/getting-started/first-project.md`: Korvattu olematon cicd-integration.md tiedostolla deployment-guide.md
  - `examples/retail-scenario.md`: Korjattu FAQ- ja vianmääritysoppaan polut
  - `examples/container-app/microservices/README.md`: Korjattu kurssin kotisivu- ja deployment guide -polut
  - `resources/faq.md` ja `resources/glossary.md`: Päivitetyt AI-lukuviitteet
  - `course-outline.md`: Korjattu ohjaajan opas- ja AI-työpajalab-viitteet

- **📅 Työpajan tila-banneri**: Päivitetty 'Under Construction' -tilasta aktiiviseksi työpajaksi helmikuulle 2026
- **🔗 Työpajan navigaatio**: Korjattu rikkinäiset navigaatiolinkit workshop README.md:ssä, jotka osoittivat olemattomaan lab-1-azd-basics -kansioon

#### Muutokset
- **Työpajan esitys**: Poistettu "under construction" -varoitus, työpaja on nyt valmis ja käyttövalmis
- **Navigaation johdonmukaisuus**: Varmistettu, että kaikilla työpajamoduuleilla on asianmukainen moduulien välinen navigaatio
- **Oppimispolun viitteet**: Päivitetty lukujen ristiviitteet käyttämään oikeita microsoft-foundry-polkuja

#### Varmennettu
- ✅ Kaikilla englanninkielisillä Markdown-tiedostoilla on kelvolliset sisäiset linkit
- ✅ Työpajamoduulit 0–7 ovat valmiita oppimistavoitteineen
- ✅ Luku- ja moduulinavigaatio toimii oikein
- ✅ Sisältö on sopivaa Microsoft AZD:tä käyttäville tekoälykehittäjille
- ✅ Aloittelijaystävällinen kieli ja rakenne säilytetty
- ✅ CONTRIBUTING.md tarjoaa selkeät ohjeet yhteisön kontribuutiolle

#### Tekninen toteutus
- **Linkkien validointi**: Automaattinen PowerShell-skripti varmisti kaikki .md-tiedostojen sisäiset linkit
- **Sisällön auditointi**: Manuaalinen tarkastus työpajan täydellisyyden ja aloittelijaystävällisyyden varmistamiseksi
- **Navigaatiojärjestelmä**: Johdonmukaiset luku- ja moduulinavigaatiomallit otettu käyttöön

#### Huomiot
- **Laajuus**: Muutokset sovellettiin vain englanninkieliseen dokumentaatioon
- **Käännökset**: Käännöskansiot eivät päivittyneet tässä versiossa (automaattinen käännös synkronoidaan myöhemmin)
- **Työpajan kesto**: Täysi työpaja tarjoaa nyt 3–4 tuntia käytännön oppimista

---

### [v3.8.0] - 2025-11-19

#### Edistynyt dokumentaatio: monitorointi, turvallisuus ja moni-agenttien mallit
**Tämä versio lisää kattavat A-tason oppitunnit Application Insights -integraatiosta, autentikointimalleista ja moni-agenttien koordinoinnista tuotantokäyttöön.**

#### Lisätty
- **📊 Application Insights -integraatio-opetus**: tiedostossa `docs/pre-deployment/application-insights.md`:
  - AZD-keskeinen käyttöönotto automaattisella provisioinnilla
  - Täydelliset Bicep-mallit Application Insightsille + Log Analyticsille
  - Toimivat Python-sovellukset mukautetulla telemetrialla (yli 1 200 riviä)
  - AI/LLM-monitorointimallit (Microsoft Foundry -mallien token-/kustannusseuranta)
  - 6 Mermaid-kaaviota (arkkitehtuuri, hajautettu jäljitys, telemetrian virtaus)
  - 3 käytännön harjoitusta (hälytykset, dashboardit, AI-monitorointi)
  - Kusto-kyselyesimerkit ja kustannusten optimointistrategiat
  - Live-mittarivirtaus ja reaaliaikainen debuggaus
  - 40–50 minuutin oppimisaika tuotantovalmiiden mallien kanssa

- **🔐 Autentikointi- ja turvallisuusmallit**: tiedostossa `docs/getting-started/authsecurity.md`:
  - 3 autentikointimallia (yhteysmerkkijonot, Key Vault, hallittu identiteetti)
  - Täydelliset Bicep-infrastruktuurimallit turvallisiin käyttöönottoihin
  - Node.js-sovelluskoodi Azure SDK -integraatiolla
  - 3 täydellistä harjoitusta (hallitun identiteetin ottaminen käyttöön, käyttäjälle osoitettu identiteetti, Key Vaultin kierto)
  - Turvallisuuden parhaat käytännöt ja RBAC-konfiguraatiot
  - Vianmääritysopas ja kustannusanalyysi
  - Tuotantovalmiit salasanattomat autentikointimallit

- **🤖 Moni-agenttien koordinointimallit**: tiedostossa `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinointimallia (sekventiaalinen, rinnakkainen, hierarkkinen, tapahtumapohjainen, konsensus)
  - Täydellinen orkestroijapalvelun toteutus (Python/Flask, yli 1 500 riviä)
  - 3 erikoistettua agenttitoteutusta (Tutkija, Kirjoittaja, Editori)
  - Service Bus -integraatio viestijonitusta varten
  - Cosmos DB:n tilanhallinta hajautetuille järjestelmille
  - 6 Mermaid-kaaviota, jotka näyttävät agenttien vuorovaikutukset
  - 3 edistynyttä harjoitusta (aikakatkaisujen käsittely, uudelleenyrityslogiikka, circuit breaker)
  - Kustannuserittely (240–565 $/kk) optimointistrategioineen
  - Application Insights -integraatio monitorointia varten

#### Parannettu
- **Ennakkovalmistelu-luku**: Sisältää nyt kattavat monitorointi- ja koordinointimallit
- **Aloitus-luku**: Parannettu ammatillisilla autentikointimalleilla
- **Tuotantovalmius**: Täydellinen kattavuus turvallisuudesta havaittavuuteen
- **Kurssin sisältö**: Päivitetty viittaamaan uusiin oppitunteihin luvuissa 3 ja 6

#### Muutokset
- **Oppimisen eteneminen**: Parempi turvallisuuden ja monitoroinnin integrointi koko kurssiin
- **Dokumentaation laatu**: Johdonmukaiset A-tason standardit (95–97 %) uusissa oppitunneissa
- **Tuotantokaaviot**: Täydellinen päästä päähän kattavuus yritystason käyttöönottoihin

#### Parannettu
- **Developer Experience**: Selkeä polku kehityksestä tuotantovalvontaan
- **Security Standards**: Ammattimaisia malleja todennukseen ja salaisuuksien hallintaan
- **Observability**: Täydellinen Application Insights -integraatio AZD:n kanssa
- **AI Workloads**: Erikoistunut valvonta Microsoft Foundry Models -malleille ja moni-agenttijärjestelmille

#### Vahvistettu
- ✅ Kaikilla oppitunneilla on kokonainen toimiva koodi (ei katkelmia)
- ✅ Mermaid-kaaviot visuaalista oppimista varten (19 yhteensä 3 oppitunnissa)
- ✅ Käytännön harjoituksia verifiointivaiheineen (9 yhteensä)
- ✅ Tuotantovalmiit Bicep-mallit, jotka voi ottaa käyttöön `azd up` -komennolla
- ✅ Kustannusanalyysi ja optimointistrategiat
- ✅ Vianetsintäoppaat ja parhaat käytännöt
- ✅ Tietopisteet verifiointikomennoilla

#### Dokumentaation arviointitulokset
- **docs/pre-deployment/application-insights.md**: - Kattava valvontaopas
- **docs/getting-started/authsecurity.md**: - Ammattimaiset turvallisuusmallit
- **docs/pre-deployment/coordination-patterns.md**: - Kehittyneet moni-agenttiarkkitehtuurit
- **Overall New Content**: - Johdonmukaiset korkealaatuiset standardit

#### Tekninen toteutus
- **Application Insights**: Log Analytics + mukautettu telemetria + hajautettu jäljitys
- **Authentication**: Managed Identity + Key Vault + RBAC-mallit
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrointi
- **Monitoring**: Live-metriikat + Kusto-kyselyt + hälytykset + kojelaudat
- **Cost Management**: Näytemenetelmät, säilytyskäytännöt, budjettivalvonta

### [v3.7.0] - 2025-11-19

#### Dokumentaation laadun parannukset ja uusi Microsoft Foundry Models -esimerkki
**Tämä versio parantaa dokumentaation laatua koko arkistossa ja lisää täydellisen Microsoft Foundry Models -käyttöönottoesimerkin, jossa on gpt-4.1 chat-käyttöliittymä.**

#### Lisätty
- **🤖 Microsoft Foundry Models Chat Example**: Täydellinen gpt-4.1 -käyttöönotto toimivalla toteutuksella kansiossa `examples/azure-openai-chat/`:
  - Täydellinen Microsoft Foundry Models -infrastruktuuri (gpt-4.1 -mallin käyttöönotto)
  - Python-pohjainen komentorivichat-käyttöliittymä keskusteluhistorialla
  - Key Vault -integraatio API-avainten turvalliseen säilytykseen
  - Tokenien käytön seuranta ja kustannusarviointi
  - Nopeusrajoitus ja virheenkäsittely
  - Kattava README, jossa 35–45 minuutin käyttöönotto-opas
  - 11 tuotantovalmista tiedostoa (Bicep-mallit, Python-sovellus, konfiguraatio)
- **📚 Dokumentaation harjoitukset**: Lisätty käytännön harjoituksia konfiguraatio-oppaaseen:
  - Harjoitus 1: Moni-ympäristökonfiguraatio (15 minuuttia)
  - Harjoitus 2: Salaisuuksien hallinnan harjoitus (10 minuuttia)
  - Selkeät onnistumiskriteerit ja verifiointivaiheet
- **✅ Käyttöönoton verifiointi**: Lisätty verifiointiosio käyttöönotto-oppaaseen:
  - Terveystarkastusmenettelyt
  - Onnistumiskriteerien tarkistuslista
  - Odotetut tulosteet kaikille käyttöönotto-komennoille
  - Vianetsinnän pikaopas

#### Parannettu
- **examples/README.md**: Päivitetty A-tason laatuun (93%):
  - Lisätty azure-openai-chat kaikkiin asiaankuuluviin osioihin
  - Paikallisten esimerkkien määrä päivitetty 3:sta 4:ään
  - Lisätty AI Application Examples -taulukkoon
  - Integroitu Quick Start -osioon keskitasoisille käyttäjille
  - Lisätty Microsoft Foundry Templates -osioon
  - Päivitetty vertailumatriisi- ja teknologialöytöosioita
- **Documentation Quality**: Parannettu B+ (87%) → A- (92%) koko docs-kansiossa:
  - Lisätty odotetut tulosteet kriittisiin komentoesimerkkeihin
  - Sisällytetty verifiointivaiheet konfiguraatiomuutoksiin
  - Parannettu käytännön oppimista käytännön harjoituksilla

#### Muutettu
- **Oppimisen eteneminen**: Parempi AI-esimerkkien integrointi keskitasoisille oppijoille
- **Documentation Structure**: Toiminnallisempia harjoituksia selkeillä tuloksilla
- **Verification Process**: Selkeät onnistumiskriteerit lisätty keskeisiin työnkulkuihin

#### Parannettu
- **Developer Experience**: Microsoft Foundry Models -käyttöönotto nyt 35–45 minuuttia (vs. 60–90 monimutkaisille vaihtoehdoille)
- **Cost Transparency**: Selkeät kustannusarviot ($50–200/kk) Microsoft Foundry Models -esimerkille
- **Learning Path**: AI-kehittäjille selkeä sisäänpääsy azure-openai-chatin avulla
- **Documentation Standards**: Johdonmukaiset odotetut tulosteet ja verifiointivaiheet

#### Vahvistettu
- ✅ Microsoft Foundry Models -esimerkki täysin toimiva `azd up` -komennolla
- ✅ Kaikki 11 toteutustiedostoa syntaksiltaan oikein
- ✅ README-ohjeet vastaavat todellista käyttöönotto­kokemusta
- ✅ Dokumentaatiolinkit päivitetty yli 8 paikkaan
- ✅ Esimerkkien indeksi vastaa tarkasti 4 paikallista esimerkkiä
- ✅ Ei päällekkäisiä ulkoisia linkkejä taulukoissa
- ✅ Kaikki navigointiviittaukset oikeita

#### Tekninen toteutus
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + Container Apps -malli
- **Security**: Managed Identity valmiina, salaisuudet Key Vaultissa
- **Monitoring**: Application Insights -integraatio
- **Cost Management**: Token-seuranta ja käytön optimointi
- **Deployment**: Yksi `azd up` -komento koko käyttöönottoon

### [v3.6.0] - 2025-11-19

#### Merkittävä päivitys: Container App -käyttöönotto-esimerkit
**Tämä versio esittelee kattavat, tuotantovalmiit konttisovellusten käyttöönottoesimerkit Azure Developer CLI:n (AZD) avulla, täydellisellä dokumentaatiolla ja integroinnilla oppimispolkuun.**

#### Lisätty
- **🚀 Container App Examples**: Uudet paikalliset esimerkit kansiossa `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kattava yleiskatsaus kontitetuista käyttöönotosta, pika-aloitus, tuotanto ja edistyneet mallit
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Aloittelijaystävällinen REST-rajapinta, jossa scale-to-zero, terveystarkastukset, valvonta ja vianetsintä
  - [Microservices Architecture](../../examples/container-app/microservices): Tuotantovalmis monipalvelukäyttöönotto (API Gateway, Product, Order, User, Notification), asynkroninen viestintä, Service Bus, Cosmos DB, Azure SQL, hajautettu jäljitys, blue-green/canary-käyttöönotto
- **Best Practices**: Turvallisuus, valvonta, kustannusoptimointi ja CI/CD-ohjeistus konttikuormille
- **Code Samples**: Täydellinen `azure.yaml`, Bicep-mallit ja monikieliset palvelutoteutukset (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end -testiskenaariot, valvontakomennot, vianetsintäohjeet

#### Muutettu
- **README.md**: Päivitetty esittelemään ja linkittämään uudet container app -esimerkit osion "Local Examples - Container Applications" alla
- **examples/README.md**: Päivitetty korostamaan container app -esimerkkejä, lisäämään vertailumatriisin rivejä ja päivittämään teknologia-/arkkitehtuuriviittauksia
- **Course Outline & Study Guide**: Päivitetty viittaamaan uusiin container app -esimerkkeihin ja käyttöönotto-malleihin asiaankuuluvissa luvuissa

#### Vahvistettu
- ✅ Kaikki uudet esimerkit otettavissa käyttöön `azd up` -komennolla ja noudattavat parhaita käytäntöjä
- ✅ Dokumentaation ristiinlinkitykset ja navigaatio päivitetty
- ✅ Esimerkit kattavat aloittelija- ja edistyneet skenaariot, mukaan lukien tuotantomonipalvelut

#### Huomautuksia
- **Scope**: Vain englanninkielinen dokumentaatio ja esimerkit
- **Next Steps**: Laajentaa lisätyillä edistyneillä konttimalleilla ja CI/CD-automaatioilla tulevissa julkaisuissa

### [v3.5.0] - 2025-11-19

#### Tuotteen nimeämisen uudistus: Microsoft Foundry
**Tämä versio toteuttaa kattavan tuotteen nimen muutoksen "Microsoft Foundry" → "Microsoft Foundry" kaikessa englanninkielisessä dokumentaatiossa, heijastaen Microsoftin virallista uudelleenbrändäystä.**

#### Muutettu
- **🔄 Product Name Update**: Täydellinen uudelleennimeäminen "Microsoft Foundry" → "Microsoft Foundry"
  - Päivitetty kaikki viittaukset englanninkielisessä dokumentaatiossa kansiossa `docs/`
  - Uudelleennimetty kansio: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Uudelleennimetty tiedosto: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Yhteensä: 23 sisältöviittausta päivitetty 7 dokumentaatiotiedostossa

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` uudelleennimetty `docs/microsoft-foundry/`
  - Kaikki ristiinviittaukset päivitetty heijastamaan uutta kansiorakennetta
  - Navigointilinkit validoitu koko dokumentaatiossa

- **📄 Tiedostojen uudelleennimeäminen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kaikki sisäiset linkit päivitetty viittaamaan uuteen tiedostonimeen

#### Päivitetyt tiedostot
- **Lukudokumentaatio** (7 tiedostoa):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigointilinkin päivitystä
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tuotteenimen viittauksen päivitystä
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Jo käyttää Microsoft Foundry'ta (aikaisemmista päivityksistä)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 viittauksen päivitystä (yleiskatsaus, yhteisöpalautteet, dokumentaatio)
  - `docs/getting-started/azd-basics.md` - 4 ristiinviittauksen päivitystä
  - `docs/getting-started/first-project.md` - 2 luvunavigaation päivitystä
  - `docs/getting-started/installation.md` - 2 seuraavan luvun linkin päivitystä
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 viittauksen päivitystä (navigaatio, Discord-yhteisö)
  - `docs/troubleshooting/common-issues.md` - 1 navigointilinkin päivitys
  - `docs/troubleshooting/debugging.md` - 1 navigointilinkin päivitys

- **Kurssirakenteen tiedostot** (2 tiedostoa):
  - `README.md` - 17 viittauksen päivitystä (kurssin yleiskatsaus, luvun otsikot, malliosio, yhteisön näkemykset)
  - `course-outline.md` - 14 viittauksen päivitystä (yleiskatsaus, oppimistavoitteet, luvun resurssit)

#### Vahvistettu
- ✅ Nolla jäljellä olevaa "ai-foundry" kansiopolun viittausta englanninkielisissä docs-tiedostoissa
- ✅ Nolla jäljellä olevaa "Microsoft Foundry" tuotteenimen viittausta englanninkielisessä dokumentaatiossa
- ✅ Kaikki navigointilinkit toiminnassa uuden kansiorakenteen kanssa
- ✅ Tiedosto- ja kansioiden uudelleennimeämiset suoritettu onnistuneesti
- ✅ Ristiinviittaukset lukujen välillä validoitu

#### Huomautuksia
- **Scope**: Muutokset sovellettu vain englanninkieliseen dokumentaatioon kansiossa `docs/`
- **Translations**: Käännöskansiot (`translations/`) eivät päivittyneet tässä versiossa
- **Workshop**: Workshop-materiaaleja (`workshop/`) ei päivitetty tässä versiossa
- **Examples**: Esimerkkitiedostot saattavat edelleen viitata vanhaan nimeämiseen (korjataan tulevassa päivityksessä)
- **External Links**: Ulkoiset URL-osoitteet ja GitHub-repositorion viittaukset pysyvät muuttumattomina

#### Siirtymäopas kontribuuttoreille
Jos sinulla on paikallisia haaroja tai dokumentaatiota, jotka viittaavat vanhaan rakenteeseen:
1. Päivitä kansioviittaukset: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Päivitä tiedostoviittaukset: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Korvaa tuotteen nimi: "Microsoft Foundry" → "Microsoft Foundry"
4. Varmista, että kaikki sisäiset dokumentaatiolinkit toimivat edelleen

---

### [v3.4.0] - 2025-10-24

#### Infrastruktuurin esikatselu- ja validointiparannukset
**Tämä versio lisää kattavan tuen uudelle Azure Developer CLI -esikatseluominaisuudelle ja parantaa workshopin käyttäjäkokemusta.**

#### Lisätty
- **🧪 azd provision --preview Feature Documentation**: Kattava kuvaus uudesta infrastruktuurin esikatseluominaisuudesta
  - Komentoviite ja käyttöesimerkit pikalistassa
  - Yksityiskohtainen integrointi provisioning-oppaassa käyttötapauksineen ja hyötyineen
  - Pre-flight -tarkistuksen integrointi turvallisemman käyttöönoton validointiin
  - Aloitusoppaan päivitykset turvallisuutta ensisijaisesti korostavilla käyttöönotto­käytännöillä
- **🚧 Workshop Status Banner**: Ammattimainen HTML-banneri, joka ilmoittaa workshopin kehitystilasta
  - Liukuvärisuunnittelu ja rakennusilmaisimet selkeään käyttäjäviestintään
  - Viimeksi päivitetty -aikaleima läpinäkyvyyden vuoksi
  - Mobiiliystävällinen responsiivinen suunnittelu kaikille laitteille

#### Parannettu
- **Infrastructure Safety**: Esikatseluominaisuus integroituna koko käyttöönoton dokumentaatioon
- **Pre-deployment Validation**: Automaattiskriptit sisältävät nyt infrastruktuurin esikatselutestauksen
- **Developer Workflow**: Päivitetyt komentojonot sisällyttävät esikatselun parhaana käytäntönä
- **Workshop Experience**: Käyttäjille asetetaan selkeät odotukset sisällön kehitystilasta

#### Muutettu
- **Deployment Best Practices**: Esikatselu-ensimmäinen työnkulku suositeltavana lähestymistapana
- **Documentation Flow**: Infrastruktuurin validointi siirretty aiemmin oppimisprosessissa
- **Workshop Presentation**: Ammattimainen tilaviestintä selkeällä kehitysaikataululla

#### Parannettu
- **Safety-First Approach**: Infrastruktuurimuutokset voidaan nyt validoida ennen käyttöönottoa
- **Team Collaboration**: Esikatselutuloksia voidaan jakaa tarkistusta ja hyväksyntää varten
- **Cost Awareness**: Parempi ymmärrys resurssikustannuksista ennen provisioningia
- **Risk Mitigation**: Vähemmän käyttöönoton virheitä ennakkovalidoinnin kautta

#### Tekninen toteutus
- **Multi-document Integration**: Esikatseluominaisuus dokumentoitu neljässä keskeisessä tiedostossa
- **Command Patterns**: Johdonmukainen syntaksi ja esimerkit koko dokumentaatiossa
- **Best Practice Integration**: Esikatselu sisällytetty validointityönkulkuihin ja skripteihin
- **Visual Indicators**: Selkeät UUSIEN ominaisuuksien merkinnät löydettävyyden parantamiseksi

#### Workshopin infrastruktuuri
- **Status Communication**: Ammattimainen HTML-banneri liukuvärityylillä
- **User Experience**: Selkeä kehitystila estää sekaannuksen
- **Professional Presentation**: Säilyttää repositorion uskottavuuden samalla kun asettaa odotukset
- **Timeline Transparency**: Lokakuu 2025 viimeksi päivitetyn aikaleiman näkyvyys vastuullisuuden vuoksi

### [v3.3.0] - 2025-09-24

#### Parannettu workshop-materiaali ja interaktiivinen oppimiskokemus
**Tämä versio esittelee kattavat workshop-materiaalit selainpohjaisilla interaktiivisilla oppailla ja jäsennellyillä oppimispoluilla.**

#### Lisätty
- **🎥 Interaktiivinen työpajaopas**: Selaimessa suoritettava työpajan kokemus, jossa MkDocs-esikatselutoiminto
- **📝 Rakenteelliset työpajaohjeet**: 7-vaiheinen ohjattu oppimispolku löytämisestä muokkaamiseen
  - 0-Introduction: Työpajan yleiskatsaus ja käyttöönotto
  - 1-Select-AI-Template: Mallipohjien etsimis- ja valintaprosessi
  - 2-Validate-AI-Template: Julkaisu- ja validointimenettelyt
  - 3-Deconstruct-AI-Template: Mallipohjan arkkitehtuurin ymmärtäminen
  - 4-Configure-AI-Template: Konfigurointi ja mukauttaminen
  - 5-Customize-AI-Template: Edistyneet muokkaukset ja iteroinnit
  - 6-Teardown-Infrastructure: Siivous ja resurssien hallinta
  - 7-Wrap-up: Yhteenveto ja seuraavat askeleet
- **🛠️ Työpajan työkalut**: MkDocs-konfiguraatio Material-teemalla parannetun oppimiskokemuksen vuoksi
- **🎯 Käytännön oppimispolku**: 3-vaiheinen metodologia (Löytö → Käyttöönotto → Mukauttaminen)
- **📱 GitHub Codespaces -integraatio**: Saumaton kehitysympäristön käyttöönotto

#### Parannettu
- **AI Workshop Lab**: Laajennettu kattavalla 2–3 tunnin rakenteellisella oppimiskokemuksella
- **Workshop Documentation**: Ammattimainen esitys navigoinnilla ja visuaalisilla apuvälineillä
- **Learning Progression**: Selkeä vaiheittainen ohjeistus mallipohjan valinnasta tuotantokäyttöönottoon
- **Developer Experience**: Integroituja työkaluja kehitysprosessien sujuvoittamiseen

#### Parannuksia
- **Saavutettavuus**: Selaimessa toimiva käyttöliittymä, jossa on haku, kopiointiominaisuus ja teeman vaihtaminen
- **Itsenäinen oppiminen**: Joustava työpajarakenne, joka mukautuu eri oppimisnopeuksiin
- **Käytännön soveltaminen**: Reaaliaikaiset AI-mallipohjien käyttöönoton skenaariot
- **Yhteisöintegraatio**: Discord-integraatio työpajan tukea ja yhteistyötä varten

#### Työpajan ominaisuudet
- **Sisäänrakennettu haku**: Nopea avainsana- ja oppitunnin löytäminen
- **Koodilohkojen kopiointi**: Vie-hiiri-päälle-kopioi -toiminto kaikille koodiesimerkeille
- **Teeman vaihtaminen**: Tumma/vaalea-tila tuettuna eri mieltymyksiin
- **Visuaaliset aineistot**: Kuvakaappaukset ja kaaviot ymmärryksen parantamiseksi
- **Ohjeintegraatio**: Suora Discord-yhteys yhteisötukea varten

### [v3.2.0] - 2025-09-17

#### Suuri navigoinnin uudelleenjärjestely ja lukuperusteinen oppimisjärjestelmä
**Tässä versiossa otetaan käyttöön kattava lukuperusteinen oppimisrakenne ja parannettu navigointi koko repositoriossa.**

#### Lisätty
- **📚 Lukuperusteinen oppimisjärjestelmä**: Koko kurssi järjestelty 8 etenevään oppilukuun
  - Chapter 1: Perusta & Pikakäynnistys (⭐ - 30–45 min)
  - Chapter 2: AI-keskeinen kehitys (⭐⭐ - 1–2 tuntia)
  - Chapter 3: Konfigurointi & Todennus (⭐⭐ - 45–60 min)
  - Chapter 4: Infrastruktuuri koodina & Käyttöönotto (⭐⭐⭐ - 1–1.5 tuntia)
  - Chapter 5: Moniagenttiset AI-ratkaisut (⭐⭐⭐⭐ - 2–3 tuntia)
  - Chapter 6: Ennen käyttöönottoa tapahtuva validointi & Suunnittelu (⭐⭐ - 1 tunti)
  - Chapter 7: Vianmääritys & Virheenkorjaus (⭐⭐ - 1–1.5 tuntia)
  - Chapter 8: Tuotanto- & Yrityskäytännöt (⭐⭐⭐⭐ - 2–3 tuntia)
- **📚 Kattava navigaatiojärjestelmä**: Johdonmukaiset navigaatiopääotsikot ja alatunnisteet kaikessa dokumentaatiossa
- **🎯 Edistymisen seuranta**: Kurssin suorituschecklist ja oppimisen vahvistusjärjestelmä
- **🗺️ Oppimispolun ohjeistus**: Selkeät sisäänpääsypisteet eri osaamistasoille ja tavoitteille
- **🔗 Ristiinviittausten navigointi**: Liittyvät luvut ja ennakkoedellytykset selkeästi linkitettyinä

#### Parannettu
- **README-rakenne**: Muutettu rakenteelliseksi oppimisalustaksi lukujaottelulla
- **Dokumentaation navigaatio**: Jokaisella sivulla on nyt lukukonteksti ja etenemisohjeet
- **Mallipohjien järjestely**: Esimerkit ja mallipohjat yhdistetty sopiviin oppilukuihin
- **Resurssien integrointi**: Pikaohjeet, FAQ:t ja opiskelumateriaalit liitetty relevantteihin lukuihin
- **Työpaja-integraatio**: Käytännön laboratoriot liitetty useisiin lukuoppimistavoitteisiin

#### Muutettu
- **Oppimisen eteneminen**: Siirrytty lineaarisesta dokumentaatiosta joustavaan lukuperusteiseen oppimiseen
- **Konfiguraation sijoittaminen**: Konfiguraatio-opas siirretty luvuksi 3 paremman oppimiskulun vuoksi
- **AI-sisällön integrointi**: AI-spesifinen sisältö paremmassa asemassa koko oppimismatkalla
- **Tuotantosisältö**: Edistyneet mallit koottu lukuun 8 yrityskäyttäjille

#### Parannuksia
- **Käyttäjäkokemus**: Selkeät navigointipolut ja lukujen etenemisen indikaattorit
- **Saavutettavuus**: Johdonmukaiset navigointimallit helpottavat kurssin läpikäyntiä
- **Ammattimainen esitys**: Yliopistotyyppinen kurssirakenne sopii akateemiseen ja yrityskoulutukseen
- **Oppimisen tehokkuus**: Parantunut tiedonlöydettävyys ja organisaatio vähentävät aikaa relevantin sisällön löytämiseen

#### Tekninen toteutus
- **Navigaatiopääotsikot**: Standardoitu lukualueiden navigaatio yli 40+ dokumentaatiotiedostossa
- **Alatunnisteen navigaatio**: Johdonmukaiset etenemisohjeet ja lukujen suoritusindikattorit
- **Ristiinlinkitys**: Kattava sisäinen linkitysjärjestelmä yhdistää aiheita
- **Lukukartoitus**: Mallipohjat ja esimerkit selkeästi sidottu oppimistavoitteisiin

#### Opintomateriaalien parannus
- **📚 Kattavat oppimistavoitteet**: Opintomateriaali uudelleenjärjestetty vastaamaan 8-luvun järjestelmää
- **🎯 Lukuun perustuva arviointi**: Jokaisessa luvussa on omat oppimistavoitteet ja käytännön tehtävät
- **📋 Edistymisen seuranta**: Viikoittainen oppimisaikataulu mitattavilla tuloksilla ja tarkistuslistoilla
- **❓ Arviointikysymykset**: Tietojen varmistuskysymyksiä joka luvulle ammatillisilla tavoitteilla
- **🛠️ Käytännön harjoitukset**: Kädessä-kokeiltavat tehtävät todellisilla käyttöönottojen skenaarioilla ja vianetsinnällä
- **📊 Osaamisen eteneminen**: Selkeä eteneminen peruskonsepteista yritystason malleihin ja uraohjaukseen
- **🎓 Sertifiointikehys**: Ammatilliset kehitystulokset ja yhteisön tunnustamisjärjestelmä
- **⏱️ Aikataulun hallinta**: Rakenettu 10-viikkoinen oppimissuunnitelma välitarkastuksineen

### [v3.1.0] - 2025-09-17

#### Laajennetut moniagenttiset AI-ratkaisut
**Tämä versio parantaa moniagenttista vähittäiskaupan ratkaisua selkeämmällä agenttien nimeämisellä ja parannetulla dokumentaatiolla.**

#### Muutettu
- **Multi-Agent Terminology**: Korvattu "Cora agent" arvolla "Customer agent" koko vähittäiskaupan moniagenttiratkaisussa selkeämmän ymmärryksen vuoksi
- **Agent Architecture**: Päivitetty kaikki dokumentaatiot, ARM-mallit ja koodiesimerkit käyttämään johdonmukaista "Customer agent" -nimeämistä
- **Configuration Examples**: Modernisoidut agenttikonfiguraatiomallit päivitettyine nimeämiskäytänteineen
- **Documentation Consistency**: Varmistettu, että kaikki viittaukset käyttävät ammattimaisia, kuvaavia agenttinimiä

#### Parannettu
- **ARM Template Package**: Päivitetty retail-multiagent-arm-template Customer agent -viittauksilla
- **Architecture Diagrams**: Päivitetyt Mermaid-kaaviot uusilla agenttinimillä
- **Code Examples**: Python-luokat ja toteutusesimerkit käyttävät nyt CustomerAgent-nimeämistä
- **Environment Variables**: Päivitetty kaikki käyttöönotto-skriptit käyttämään CUSTOMER_AGENT_NAME -käytäntöä

#### Parantunut
- **Developer Experience**: Selkeämmät agenttien roolit ja vastuut dokumentaatiossa
- **Production Readiness**: Parempi linjaus yritystason nimeämiskäytäntöihin
- **Learning Materials**: Intuitiivisempi agenttinimeäminen opetustarkoituksiin
- **Template Usability**: Yksinkertaisempi agenttien toimintojen ja käyttöönottojen ymmärtäminen

#### Tekniset tiedot
- Päivitetyt Mermaid-arkkitehtuurikaaviot CustomerAgent-viittauksilla
- Korvattu CoraAgent-luokkien nimet CustomerAgent-nimisillä luokilla Python-esimerkeissä
- Muokattu ARM-template JSON -konfiguraatioita käyttämään "customer" agent-tyyppiä
- Päivitetty ympäristömuuttujat CORA_AGENT_* -malleista CUSTOMER_AGENT_* -malleihin
- Päivitetty kaikki käyttöönotto-komennot ja konttikonfiguraatiot

### [v3.0.0] - 2025-09-12

#### Suuret muutokset - AI-kehittäjäfokus ja Microsoft Foundry -integraatio
**Tämä versio muuttaa reposton kattavaksi AI-keskittyneeksi oppimisresurssiksi, jossa on Microsoft Foundryn integraatio.**

#### Lisätty
- **🤖 AI-ensijainen oppimispolku**: Kattava uudelleenjärjestely, joka priorisoi AI-kehittäjiä ja -insinöörejä
- **Microsoft Foundry Integration Guide**: Kattava dokumentaatio AZD:n yhdistämisestä Microsoft Foundryn palveluihin
- **AI Model Deployment Patterns**: Yksityiskohtainen opas mallien valintaan, konfigurointiin ja tuotantoon siirtoon
- **AI Workshop Lab**: 2–3 tunnin käytännön työpaja AI-sovellusten muuntamisesta AZD-deployattaviksi ratkaisuiksi
- **Production AI Best Practices**: Yritysvalmiit mallit skaalaamiseen, monitorointiin ja suojaamiseen
- **AI-Specific Troubleshooting Guide**: Kattava vianetsintäopas Microsoft Foundry -malleille, Cognitive Servicesille ja AI-käyttöönotto-ongelmille
- **AI Template Gallery**: Esittely Microsoft Foundryn mallipohjakokoelmasta kompleksisuustasoineen
- **Workshop Materials**: Täydellinen työpajarakenne käytännön laboratorioineen ja tukimateriaaleineen

#### Parannettu
- **README Structure**: AI-kehittäjäkeskeinen rakenne, jossa 45 % yhteisön kiinnostusdatan tuesta Microsoft Foundry Discordista
- **Learning Paths**: Dedikoitu AI-kehittäjän polku perinteisten opiskelija- ja DevOps-polkujen rinnalle
- **Template Recommendations**: Esitellyt AI-mallipohjasuositukset, mukaan lukien azure-search-openai-demo, contoso-chat ja openai-chat-app-quickstart
- **Community Integration**: Parannettu Discord-yhteisötuki AI-spesifisille kanaville ja keskusteluille

#### Turvallisuus & Tuotantokeskeisyys
- **Managed Identity Patterns**: AI-spesifiset todennus- ja suojauskonfiguraatiot
- **Cost Optimization**: Tokenien käyttöseuranta ja budjettiohjaus AI-kuormituksille
- **Multi-Region Deployment**: Strategiat globaaleihin AI-sovellusten käyttöönottoihin
- **Performance Monitoring**: AI-spesifiset mittarit ja Application Insights -integraatio

#### Dokumentaation laatu
- **Lineaarinen kurssirakenne**: Looginen eteneminen aloittelijasta edistyneisiin AI-käyttöönottoihin
- **Varmennetut URL-osoitteet**: Kaikki ulkoiset repositoriolinkit tarkastettu ja saavutettavissa
- **Täydellinen viite**: Kaikki sisäiset dokumentaatiolinkit validoitu ja toimivia
- **Valmis tuotantoon**: Yritysvalmiit käyttöönotto-mallit todellisilla esimerkeillä

### [v2.0.0] - 2025-09-09

#### Suuret muutokset - Repositorion uudelleenjärjestely ja ammatillinen parannus
**Tämä versio edustaa merkittävää uudistusta repositorion rakenteessa ja sisällön esitystavassa.**

#### Lisätty
- **Rakenteellinen oppimiskehys**: Kaikilla dokumentaatiopareilla on nyt Johdanto-, Oppimistavoitteet- ja Oppimistulokset-osiot
- **Navigaatiopalvelu**: Edellinen/Seuraava -oppitunnelinkit lisätty ohjatun oppimisen etenemiseen dokumentaatioon
- **Study Guide**: Kattava study-guide.md sisältäen oppimistavoitteet, harjoitustehtävät ja arviointimateriaalit
- **Ammatillinen esitys**: Emojeiden poistaminen parantaen saavutettavuutta ja ammattimaista ulkoasua
- **Paranneltu sisällön rakenne**: Parempi järjestys ja oppimateriaalien sujuvuus

#### Muutettu
- **Dokumentaation muoto**: Kaikki dokumentaatio standardisoitu johdonmukaisella oppimiskeskeisellä rakenteella
- **Navigaatiovirtaus**: Looginen eteneminen oppimateriaalien läpi toteutettu
- **Sisällön esitys**: Koriste-elementit poistettu selkeän, ammatillisen esityksen hyväksi
- **Linkkirakenne**: Kaikki sisäiset linkit päivitetty tukemaan uutta navigaatiojärjestelmää

#### Parannettu
- **Saavutettavuus**: Emojien poistaminen parantaa ruudunlukijan yhteensopivuutta
- **Ammatillinen ulkoasu**: Puhdas, akateeminen tyyli sopii yrityskoulutukseen
- **Oppimiskokemus**: Rakenne ja selkeät tavoitteet parantavat oppimistuloksia
- **Sisällön organisointi**: Loogisempi virtaus ja yhteydet aiheiden välillä

### [v1.0.0] - 2025-09-09

#### Ensijulkaisu - Kattava AZD-oppimisrepositorio

#### Lisätty
- **Ydindokumentaation rakenne**
  - Täydellinen getting-started -opassarja
  - Kattava käyttöönotto- ja provisiointidokumentaatio
  - Yksityiskohtaiset vianetsintäresurssit ja virheenkorjausoppaat
  - Pre-deployment -validointityökalut ja menettelyt

- **Aloitusmoduuli**
  - AZD Basics: Peruskäsitteet ja terminologia
  - Installation Guide: Alustakohtaiset asennusohjeet
  - Configuration Guide: Ympäristön asennus ja todennus
  - First Project Tutorial: Askel askeleelta -käytännön opetus

- **Käyttöönotto- ja provisiointimoduuli**
  - Deployment Guide: Koko työnkulun dokumentaatio
  - Provisioning Guide: Infrastruktuuri koodina Bicepillä
  - Parhaat käytännöt tuotantokäyttöönottoihin
  - Monipalveluarkkitehtuurin mallit

- **Pre-deployment -validointimoduuli**
  - Kapasiteettisuunnittelu: Azure-resurssien saatavuuden validointi
  - SKU-valinta: Palvelutasovalinnat kattavasti
  - Pre-flight-tarkastukset: Automaattiset validointiskriptit (PowerShell ja Bash)
  - Kustannusarviot ja budjetointityökalut

- **Vianetsintämoduuli**
  - Yleiset ongelmat: Usein kohtaavat ongelmat ja ratkaisut
  - Virheenkorjausopas: Järjestelmällinen vianetsintämenetelmä
  - Edistyneet diagnostiikkatekniikat ja työkalut
  - Suorituskyvyn seuranta ja optimointi

- **Resurssit ja viitelähteet**
  - Komentojen pikaopas: Nopeat viittaukset tärkeisiin komentoihin
  - Sanasto: Kattavat termien ja lyhenteiden selitykset
  - FAQ: Yksityiskohtaiset vastaukset yleisiin kysymyksiin
  - Ulkoiset resurssilinkit ja yhteisöyhteydet

- **Esimerkit ja mallipohjat**
  - Yksinkertainen web-sovellus-esimerkki
  - Staattisen sivuston käyttöönotto-malli
  - Konttisovelluskonfiguraatio
  - Tietokanta-integraation mallit
  - Mikropalveluarkkitehtuuriesimerkit
  - Serverless-funktioiden toteutukset

#### Ominaisuudet
- **Monialustatuki**: Asennus- ja konfigurointioppaat Windowsille, macOS:lle ja Linuxille
- **Useita taitotasoja**: Sisältöä opiskelijoista ammattilaiskehittäjiin
- **Käytännönläheisyys**: Kädessä-kokeiltavat esimerkit ja todelliset skenaariot
- **Kattavuus**: Peruskonsepteista edistyneisiin yrityskäytäntöihin
- **Turvallisuus ensin**: Turvallisuuden parhaat käytännöt integroitu kautta linjan
- **Kustannusten optimointi**: Ohjeistus kustannustehokkaaseen käyttöönottoon ja resurssien hallintaan

#### Dokumentaation laatu
- **Yksityiskohtaiset koodiesimerkit**: Käytännön, testatut koodinäytteet
- **Askel askeleelta -ohjeet**: Selkeät, toteutuskelpoiset ohjeet
- **Kattava virheenkäsittely**: Vianetsintä yleisille ongelmille
- **Parhaat käytännöt**: Alan standardit ja suositukset
- **Versi yhteensopivuus**: Päivitetty uusimpien Azure-palveluiden ja azd-ominaisuuksien mukaiseksi

## Suunnitellut tulevat parannukset

### Version 3.1.0 (Suunnitteilla)
#### AI-alustan laajentaminen
- **Multi-Model Support**: Integraatiomallit Hugging Face:lle, Azure Machine Learningille ja mukautetuille malleille
- **AI Agent Frameworks**: Mallipohjat LangChainin, Semantic Kernelin ja AutoGenin käyttöönottoon
- **Advanced RAG Patterns**: Vektoripohjaiset tietokantavaihtoehdot Azure AI Searchin lisäksi (Pinecone, Weaviate, jne.)
- **AI Observability**: Parannettu valvonta mallin suorituskyvylle, tokenien käytölle ja vastausten laadulle

#### Kehittäjäkokemus
- **VS Code Extension**: Integroitu AZD + Microsoft Foundry -kehityskokemus
- **GitHub Copilot Integration**: AI-avusteinen AZD-mallipohjien generointi
- **Interactive Tutorials**: Käytännön koodausharjoituksia automatisoidulla validoinnilla AI-skenaarioihin
- **Video Content**: Täydentävät video-oppaat visuaalisille oppijoille, keskittyen AI-käyttöönottoihin

### Versio 4.0.0 (Suunnitteilla)
#### Yritys-AI-mallit
- **Governance Framework**: AI-mallien hallinta, säädösten noudattaminen ja auditointilokit
- **Multi-Tenant AI**: Mallit useiden asiakkaiden palvelemiseen eristetyillä AI-palveluilla
- **Edge AI Deployment**: Integrointi Azure IoT Edgen ja kontti-instaanssien kanssa
- **Hybrid Cloud AI**: Monipilvi- ja hybridi-käyttöönottojen mallit AI-kuormituksille

#### Kehittyneet ominaisuudet
- **AI Pipeline Automation**: MLOps-integraatio Azure Machine Learning -putkien kanssa
- **Advanced Security**: Zero-trust-mallit, yksityiset päätepisteet ja kehittynyt uhkasuojaus
- **Performance Optimization**: Kehittyneet säätö- ja skaalausstrategiat korkean läpimenon AI-sovelluksille
- **Global Distribution**: Sisällön toimitus- ja reunavälimuistimallit AI-sovelluksille

### Versio 3.0.0 (Suunnitteilla) - Korvattu nykyisellä julkaisulla
#### Ehdotetut lisäykset - Nyt toteutettu versiossa v3.0.0
- ✅ **AI-keskeinen sisältö**: Kattava Microsoft Foundry -integraatio (Valmis)
- ✅ **Interaktiiviset opastukset**: Käytännön AI-työpajalaboratorio (Valmis)
- ✅ **Kehittynyt turvallisuusmoduuli**: AI-kohtaiset turvallisuusmallit (Valmis)
- ✅ **Suorituskyvyn optimointi**: AI-kuormituksen säätöstrategiat (Valmis)

### Versio 2.1.0 (Suunnitteilla) - Osittain toteutettu versiossa v3.0.0
#### Pienet parannukset - Osa toteutettu nykyisessä julkaisussa
- ✅ **Lisää esimerkkejä**: AI-keskeisiä käyttöönotto-skenaarioita (Valmis)
- ✅ **Laajennettu UKK**: AI-kohtaiset kysymykset ja vianmääritys (Valmis)
- **Työkalujen integrointi**: Parannetut IDE- ja editori-integraatio-ohjeet
- ✅ **Valvonnan laajennus**: AI-kohtaiset valvonta- ja hälytysmallit (Valmis)

#### Vielä suunnitteilla tulevalle julkaisulle
- **Mobiiliystävällinen dokumentaatio**: Responsiivinen muotoilu mobiiliopiskeluun
- **Offline-käyttö**: Ladattavat dokumentaatiopaketit
- **Parannettu IDE-integraatio**: VS Code -laajennus AZD + AI-työnkulkuihin
- **Yhteisön kojelauta**: Reaaliaikaiset yhteisön mittarit ja kontribuutioiden seuranta

## Osallistuminen muutosten lokiin

### Muutosten raportointi
Kun osallistut tähän repositorioon, varmista, että muutosten lokimerkinnät sisältävät:

1. **Versiotunnus**: Seuraa semanttista versionumeroa (major.minor.patch)
2. **Päivämäärä**: Julkaisun tai päivityksen päivämäärä muodossa YYYY-MM-DD
3. **Kategoria**: Lisätty, Muutettu, Vanhentunut, Poistettu, Korjattu, Turvallisuus
4. **Selkeä kuvaus**: Ytimekäs kuvaus siitä, mitä muutettiin
5. **Vaikutusarvio**: Kuvaus siitä, miten muutokset vaikuttavat nykyisiin käyttäjiin

### Muutoskategoriat

#### Lisätty
- Uudet ominaisuudet, dokumentaatio-osiot tai toiminnallisuudet
- Uudet esimerkit, mallipohjat tai oppimateriaalit
- Lisätyökalut, skriptit tai apuohjelmat

#### Muutettu
- Muutokset olemassa olevaan toiminnallisuuteen tai dokumentaatioon
- Päivitykset selkeyden tai tarkkuuden parantamiseksi
- Sisällön tai organisaation uudelleenjärjestely

#### Vanhentunut
- Ominaisuudet tai käytännöt, jotka ovat poistumassa käytöstä
- Dokumentaatio-osiot, jotka on aikataulutettu poistettavaksi
- Menetelmät, joille on parempia vaihtoehtoja

#### Poistettu
- Ominaisuudet, dokumentaatio tai esimerkit, jotka eivät ole enää ajankohtaisia
- Vanhentunut tieto tai poistumassa olevat käytännöt
- Päällekkäinen tai yhdistetty sisältö

#### Korjattu
- Korjaukset dokumentaation tai koodin virheisiin
- Raportoituja ongelmia tai vikoja ratkaistu
- Parannukset tarkkuuteen tai toiminnallisuuteen

#### Turvallisuus
- Turvallisuuteen liittyvät parannukset tai korjaukset
- Päivitykset turvallisuuden parhaisiin käytäntöihin
- Haavoittuvuuksien korjaaminen

### Semanttisen versionhallinnan ohjeet

#### Pääversio (X.0.0)
- Yhteensopimattomat muutokset, jotka vaativat käyttäjän toimenpiteitä
- Merkittävä sisällön tai organisoinnin uudelleenjärjestely
- Muutokset, jotka muuttavat peruslähtökohtaa tai metodologiaa

#### Pienempi versio (X.Y.0)
- Uudet ominaisuudet tai sisällön lisäykset
- Parannukset, jotka säilyttävät taaksepäin yhteensopivuuden
- Lisäesimerkit, työkalut tai resurssit

#### Korjausversio (X.Y.Z)
- Virheenkorjaukset ja korjaukset
- Pienet parannukset olemassa olevaan sisältöön
- Selvennykset ja pienet parannukset

## Yhteisön palaute ja ehdotukset

Kannustamme aktiivisesti yhteisön palautteeseen tämän oppimateriaalin parantamiseksi:

### Miten antaa palautetta
- **GitHub Issues**: Ilmoita ongelmista tai ehdota parannuksia (AI-kohtaiset ongelmat ovat tervetulleita)
- **Discord Discussions**: Jaa ideoita ja osallistu Microsoft Foundry -yhteisöön
- **Pull Requests**: Tee suoria parannuksia sisältöön, erityisesti AI-mallipohjiin ja ohjeisiin
- **Microsoft Foundry Discord**: Osallistu #Azure-kanavalla AZD + AI -keskusteluihin
- **Community Forums**: Osallistu laajempiin Azure-kehittäjäkeskusteluihin

### Palautteen kategoriat
- **AI-sisällön tarkkuus**: Korjaukset AI-palvelujen integraatio- ja käyttöönotto-tietoihin
- **Oppimiskokemus**: Ehdotuksia AI-kehittäjän oppimiskokemuksen parantamiseksi
- **Puuttuva AI-sisältö**: Pyynnöt lisätä AI-mallipohjia, malleja tai esimerkkejä
- **Saavutettavuus**: Parannuksia monipuolisten oppijoiden tarpeisiin
- **AI-työkalujen integrointi**: Ehdotuksia AI-kehitysprosessin integraation parantamiseksi
- **Tuotantotason AI-mallit**: Pyyntöjä yritystason AI-käyttöönottojen malleista

### Vastauslupaus
- **Ongelmiin vastaus**: Raportoituihin ongelmiin vastataan 48 tunnin kuluessa
- **Ominaisuuspyynnöt**: Ominaisuuspyynnöt arvioidaan viikon kuluessa
- **Yhteisön kontribuutiot**: Yhteisön kontribuutiot tarkastetaan viikon kuluessa
- **Turvallisuusongelmat**: Turvallisuusongelmat ovat ensisijaisia ja niihin vastataan kiireellisesti

## Ylläpitosuunnitelma

### Säännölliset päivitykset
- **Kuukausittaiset katsaukset**: Sisällön tarkkuuden ja linkkien validoinnin tarkistukset kuukausittain
- **Neljännesvuosittaiset päivitykset**: Suuret sisällön lisäykset ja parannukset neljännesvuosittain
- **Puolivuosittaiset tarkistukset**: Laaja-alainen uudelleenjärjestely ja parannukset puolivuosittain
- **Vuosittaiset julkaisut**: Suuret versiopäivitykset merkittävillä parannuksilla

### Valvonta ja laadunvarmistus
- **Automaattinen testaus**: Automaattinen koodiesimerkkien ja linkkien validointi säännöllisesti
- **Yhteisön palautteen integrointi**: Käyttäjäehdotusten säännöllinen integrointi
- **Teknologiapäivitykset**: Yhdenmukaistaminen uusimpien Azure-palveluiden ja azd-julkaisujen kanssa
- **Saavutettavuusauditoinnit**: Säännöllinen tarkastus inklusiivisen suunnittelun periaatteiden mukaisesti

## Versiotukipolitiikka

### Nykyisen version tuki
- **Uusin pääversio**: Täysi tuki säännöllisillä päivityksillä
- **Edellinen pääversio**: Turvapäivitykset ja kriittiset korjaukset 12 kuukauden ajan
- **Perintöversiot**: Vain yhteisön tuki, ei virallisia päivityksiä

### Migraatio-ohjeet
Kun uusia pääversioita julkaistaan, tarjoamme:
- **Migraatio-oppaat**: Vaiheittaiset siirtymisohjeet
- **Yhteensopivuusmuistiinpanot**: Tiedot yhteensopivuuteen vaikuttavista muutoksista
- **Työkalutuki**: Skriptit tai apuohjelmat migraation avuksi
- **Yhteisön tuki**: Omistautuneet foorumit migraatiokysymyksiin

---

**Navigointi**
- **Edellinen oppitunti**: [Study Guide](resources/study-guide.md)
- **Seuraava oppitunti**: Palaa kohtaan [Main README](README.md)

**Pysy ajan tasalla**: Seuraa tätä repositoriota saadaksesi ilmoituksia uusista julkaisuista ja tärkeistä päivityksistä oppimateriaaleihin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää virallisena lähteenä. Tärkeiden tietojen osalta suosittelemme ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä johtuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->