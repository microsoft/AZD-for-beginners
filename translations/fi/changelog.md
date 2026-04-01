# Muutospäiväkirja - AZD Aloittelijoille

## Johdanto

Tämä muutospäiväkirja dokumentoi kaikki merkittävät muutokset, päivitykset ja parannukset AZD For Beginners -repositorioissa. Noudatamme semanttisen versionhallinnan periaatteita ja ylläpidämme tätä lokia auttaaksemme käyttäjiä ymmärtämään, mitä versioiden välillä on muuttunut.

## Oppimistavoitteet

Käymällä tätä muutospäiväkirjaa läpi sinä:
- Pysyät ajan tasalla uusista ominaisuuksista ja sisällön lisäyksistä
- Ymmärrät olemassa olevan dokumentaation parannukset
- Seuraat korjauksia ja virheenkorjauksia varmistaaksesi tarkkuuden
- Seuraat oppimateriaalien kehitystä ajan myötä

## Oppimistulokset

Muutospäiväkirjamerkintöjä läpikäytyäsi pystyt:
- Tunnistamaan uudet oppimateriaaliin lisätyt sisällöt ja resurssit
- Ymmärtämään, mitkä osiot on päivitetty tai parannettu
- Suunnittelemaan oppimispolkusi ajantasaisen materiaalin perusteella
- Antamaan palautetta ja ehdotuksia tulevia parannuksia varten

## Versiohistoria

### [v3.19.1] - 2026-03-27

#### Aloittelijan perehdytyksen selvennys, asennuksen validointi & lopullinen AZD-komentojen siivous
**Tämä versio jatkaa AZD 1.23 -validointia aloittelijoille suunnatulla dokumentaation korjauskierroksella: se selventää AZD-etusijaista todennusohjeistusta, lisää paikallisia asennuksen validointiskriptejä, varmentaa keskeisiä komentoja live-AZD-CLI:llä ja poistaa viimeiset vanhentuneet englanninkieliset komentoviittaukset changelogin ulkopuolelta.**

#### Lisätty
- **🧪 Aloittelijan asennuksen validointiskriptit** `validate-setup.ps1` ja `validate-setup.sh` niin, että oppijat voivat varmistaa vaaditut työkalut ennen luvun 1 aloittamista
- **✅ Alkukäteiset asennuksen validointivaiheet** juurihakemiston README:hen ja Luku 1:n README:hen, jotta puuttuvat esivaatimukset havaitaan ennen `azd up`

#### Muutokset
- **🔐 Aloittelijan todennusohjeistus** käsittelee nyt johdonmukaisesti `azd auth login`-komentoa ensisijaisena polkuna AZD-työnkuluille, ja `az login` mainitaan valinnaisena, ellei Azure CLI -komentoja käytetä suoraan
- **📚 Luku 1:n perehdytysprosessi** ohjaa nyt oppijat validoimaan paikallisen asennuksensa ennen asennusta, todennusta ja ensimmäisiä käyttöönottoaskeleita
- **🛠️ Validointiviestintä** erottaa nyt selkeästi estävät vaatimukset valinnaisista Azure CLI -varoituksista AZD-keskeiselle aloittelijapolulle
- **📖 Konfigurointi-, vianmääritys- ja esimerkkidokumentit** erottelevat nyt vaaditun AZD-todennuksen ja valinnaisen Azure CLI -kirjautumisen siellä, missä molemmat esitettiin aiemmin ilman kontekstia

#### Korjattu
- **📋 Jäljellä olevat englanninkieliset komentoviittaukset** päivitetty nykyisiin AZD-muotoihin, mukaan lukien `azd config show` pikaohjeessa ja `azd monitor --overview` siellä, missä oli tarkoitus antaa Azure-portaalin yleiskatsausohje
- **🧭 Luku 1:n aloittelijaväitteitä** lievennetty, jotta vältetään liialliset lupaukset nollavirheestä tai palautuksesta kaikissa malleissa ja Azure-resursseissa
- **🔎 Live-CLI-validointi** vahvisti nykyisen tuen `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` ja `azd down --force --purge` -komennoille

#### Päivitetyt tiedostot
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 -validointi, työpajaympäristön laajennus & tekoälymallien päivitys
**Tämä versio suorittaa dokumentaation validointikierroksen `azd` `1.23.12`:a vastaan, päivittää vanhentuneita AZD-komento-esimerkkejä, uudistaa tekoälymallien ohjeistusta nykyisiin oletuksiin ja laajentaa työpajaohjeita GitHub Codespacesin ulkopuolelle tukemaan myös dev-containereita ja paikallisia klooneja.**

#### Lisätty
- **✅ Validointimuistiinpanot** ydinkappaleissa ja työpajadokumenteissa, jotta testattu AZD-perusta on selkeä oppijoille, jotka käyttävät uudempia tai vanhempia CLI-versioita
- **⏱️ Käyttöönoton aikakatkaisuvinkit** pitkään käynnissä oleville tekoälysovellusten käyttöönottoyrityksille käyttäen `azd deploy --timeout 1800`
- **🔎 Laajennuksen tarkastusvaiheet** `azd extension show azure.ai.agents` -komennolla AI-työnkulkujen dokumenteissa
- **🌐 Laajempi työpajaympäristöohjeistus** joka kattaa GitHub Codespacesin, dev-containerit ja paikalliset kloonit MkDocsin kanssa

#### Muutokset
- **📚 Lukuintrojen README:t** ilmoittavat nyt johdonmukaisesti validoinnista `azd 1.23.12`:aa vastaan perusta-, konfigurointi-, infrastruktuuri-, moni-agentti-, esikäyttöönotto-, vianmääritys- ja tuotanto-osioissa
- **🛠️ AZD-komentoviittaukset** päivitetty nykyisiin muotoihin dokumenteissa:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` tai `azd env get-value(s)` riippuen kontekstista
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` siellä, missä on tarkoitus antaa Application Insightsin yleiskatsaus
- **🧪 Provision-esikatseluesimerkit** yksinkertaistettu nykyiseen tuettuun käyttöön, kuten `azd provision --preview` ja `azd provision --preview -e production`
- **🧭 Työpajavirtaus** päivitetty siten, että oppijat voivat suorittaa labit Codespacesissa, dev-containerissa tai paikallisessa kloonissa sen sijaan, että oletettaisiin Codespaces-ainainen suoritus
- **🔐 Todennusohjeistus** suosii nyt `azd auth login`-komentoa AZD-työnkuluissa, ja `az login` esitetään valinnaisena, kun Azure CLI -komentoja käytetään suoraan

#### Korjattu
- **🪟 Windowsin asennuskomennot** normalisoitu asennusoppaassa nykyiseen `winget`-paketin kirjainkokoon
- **🐧 Linuxin asennusohjeet** korjattu välttämään ei-tuettuja jakelukohtaisia `azd`-paketinhallintaohjeita ja viittaamaan tarvittaessa julkaisun artefakteihin
- **📦 Tekoälymalliesimerkit** päivitetty vanhemmista oletuksista kuten `gpt-35-turbo` ja `text-embedding-ada-002` nykyisiin esimerkkeihin kuten `gpt-4.1-mini`, `gpt-4.1` ja `text-embedding-3-large`
- **📋 Käyttöönotto- ja diagnostiikkakatkelmat** korjattu käyttämään nykyisiä ympäristö- ja tilakomentoja lokeissa, skripteissä ja vianmääritysvaiheissa
- **⚙️ GitHub Actions -ohjeistus** päivitetty `Azure/setup-azd@v1.0.0`:sta `Azure/setup-azd@v2`:een
- **🤖 MCP/Copilot-suostumusohjeistus** päivitetty `azd mcp consent`:sta `azd copilot consent list`:iin

#### Parannettu
- **🧠 AI-luvun ohjeistus** selittää nyt paremmin esikatselusensitiivistä `azd ai`-käyttäytymistä, tenanttikohtaista kirjautumista, nykyistä laajennusten käyttöä ja päivitettyjä mallien käyttöönotto-suosituksia
- **🧪 Työpajaohjeet** käyttävät nyt realistisempia versioesimerkkejä ja selkeämpää ympäristön asetuskieltä käytännön labroja varten
- **📈 Tuotanto- ja vianmääritysdokumentit** ovat nyt paremmin linjassa nykyisten valvonta-, varavaihtoehtoisten mallien ja kustannustaso-esimerkkien kanssa

#### Päivitetyt tiedostot
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI -CLI-komennot, sisällön validointi & mallien laajennus
**Tämä versio lisää `azd ai`, `azd extension` ja `azd mcp` -komentokattavuuden kaikissa AI:hin liittyvissä luvuissa, korjaa rikkinäiset linkit ja vanhentuneet koodit agents.md:ssä, päivittää pikaohjeen ja uudistaa Esimerkkimallit-osion validoiduilla kuvauksilla sekä uusilla Azure AI AZD -malleilla.**

#### Lisätty
- **🤖 AZD AI -CLI-kattavuus** 7 tiedostossa (aiemmin vain Luvussa 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Uusi "Laajennukset ja AI-komennot" -osio, joka esittelee `azd extension`, `azd ai agent init` ja `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Vaihtoehto 4: `azd ai agent init` vertailutaulukolla (mallipohja vs manifest-lähestymistapa)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD-laajennukset Foundrylle" ja "Agentti-ensimmäinen käyttöönotto" -alajaksoja
  - `docs/chapter-05-multi-agent/README.md` — Pikastartti näyttää nyt sekä mallipohja- että manifestipohjaiset käyttöönotto-polut
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Deploy-osio sisältää nyt `azd ai agent init` -vaihtoehdon
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI -laajennuskomennot diagnostiikkaan" -alajakso
  - `resources/cheat-sheet.md` — Uusi "AI & Laajennuskomennot" -osio, jossa `azd extension`, `azd ai agent init`, `azd mcp` ja `azd infra generate`
- **📦 Uudet AZD AI -esimerkkimallit** tiedostossa `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG -chat Blazor WebAssemblyllä, Semantic Kernelillä ja äänikeskustelun tuella
  - **azure-search-openai-demo-java** — Java RAG -chat käyttäen Langchain4J:ta, tarjoten ACA/AKS-käyttöönotto-optioita
  - **contoso-creative-writer** — Moni-agenttinen luovan kirjoittamisen sovellus, joka käyttää Azure AI Agent Serviceä, Bing Groundingia ja Promptya
  - **serverless-chat-langchainjs** — Serverless RAG käyttäen Azure Functionsia + LangChain.js:ää + Cosmos DB:tä Ollama-paikalliskehitystuen kanssa
  - **chat-with-your-data-solution-accelerator** — Yritys-tason RAG-kiihdytin hallintaportaalilla, Teams-integraatiolla ja PostgreSQL/Cosmos DB -vaihtoehdoilla
  - **azure-ai-travel-agents** — Moni-agenttinen MCP-orchestrointi-esimerkkisovellus palvelimilla .NET:ssä, Pythonissa, Javassa ja TypeScriptissä
  - **azd-ai-starter** — Minimaalinen Azure AI -infran Bicep-aloitusmalli
  - **🔗 Upea AZD AI -galleria-linkki** — Viittaus [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (yli 80 mallia)

#### Korjattu
- **🔗 agents.md -navigointi**: Edellinen/Seuraava -linkit vastaavat nyt Luku 2 README:n oppitilajärjestystä (Microsoft Foundry -integraatio → Agentit → AI-mallin käyttöönotto)
- **🔗 agents.md rikkinäiset linkit**: `production-ai-practices.md` korjattu muotoon `../chapter-08-production/production-ai-practices.md` (3 esiintymää)
- **📦 agents.md vanhentunut koodi**: `opencensus` korvattu `azure-monitor-opentelemetry`:lla + OpenTelemetry SDK:lla
- **🐛 agents.md virheellinen API**: Siirretty `max_tokens` `create_agent()`-kutsusta `create_run()`-kutsuun nimellä `max_completion_tokens`
- **🔢 agents.md tokenien laskenta**: Karkea `len//4`-arvio korvattu `tiktoken.encoding_for_model()`:lla
- **azure-search-openai-demo**: Palvelut korjattu "Cognitive Search + App Service" → "Azure AI Search + Azure Container Apps" (oletusisäntä muuttui lokakuussa 2024)
- **contoso-chat**: Kuvausta päivitetty viittaamaan Azure AI Foundryyn + Promptyyn, vastaamaan repoon kuuluvaa todellista otsikkoa ja teknologiaa

#### Poistettu
- **ai-document-processing**: Poistettu ei-toimiva malliviittaus (repo ei ole julkisesti saatavilla AZD-mallina)

#### Parannettu
- **📝 agents.md exercises**: Tehtävä 1 näyttää nyt odotetun tulosteen ja `azd monitor` -vaiheen; Tehtävä 2 sisältää täydellisen `FunctionTool`-rekisteröintikoodin; Tehtävä 3 korvaa epämääräiset ohjeet konkreettisilla `prepdocs.py`-komennoilla
- **📚 agents.md resources**: Päivitetty dokumentaatiolinkit nykyisiin Azure AI Agent Service -dokumentteihin ja pikaoppaaseen
- **📋 agents.md Next Steps table**: Lisätty AI Workshop Lab -linkki kattamaan koko luvun sisältö

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

#### Course Navigation Enhancement
**Tässä versiossa parannetaan README.md:n luvunavigointia parannetulla taulukkomuodolla.**

#### Muutokset
- **Course Map Table**: Parannettu suorin oppituntien linkein, kestoarvioin ja monimutkaisuusluokituksin
- **Folder Cleanup**: Poistettu päällekkäiset vanhat kansiot (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Kaikki 21+ sisäistä linkkiä Course Map -taulukossa tarkistettu

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Tässä versiossa päivitetään tuotteen viittaukset nykyiseen Microsoft-brändäykseen.**

#### Muutokset
- **Microsoft Foundry → Microsoft Foundry**: Kaikki viittaukset päivitetty ei-käännöstiedostoissa
- **Azure AI Agent Service → Foundry Agents**: Palvelun nimi päivitetty vastaamaan uutta brändäystä

#### Päivitetyt tiedostot
- `README.md` - Pääkurssin aloitussivu
- `changelog.md` - Versiohistoria
- `course-outline.md` - Kurssin rakenne
- `docs/chapter-02-ai-development/agents.md` - AI-agenttien opas
- `examples/README.md` - Esimerkkien dokumentaatio
- `workshop/README.md` - Workshopin aloitussivu
- `workshop/docs/index.md` - Workshopin indeksi
- `workshop/docs/instructions/*.md` - Kaikki workshopin ohjetiedostot

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**Tässä versiossa dokumentaatio järjestetään uudelleen luvunmukaisiin kansioihin selkeämmän navigoinnin vuoksi.**

#### Folder Renames
Vanhojen kansioiden tilalle otettu luvunumeroinnin mukaiset kansiot:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lisätty uusi: `docs/chapter-05-multi-agent/`

#### Tiedostojen siirrot
| Tiedosto | Alkuperä | Kohde |
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
- **📚 Luku-README-tiedostot**: Luotu README.md jokaisen luvun kansioon, sisältäen:
  - Oppimistavoitteet ja arvioitu kesto
  - Oppituntitaulukko kuvauksineen
  - Pika-asennuskäskyt
  - Navigointi muihin lukuihin

#### Muutokset
- **🔗 Päivitetty kaikki sisäiset linkit**: 78+ polkua päivitetty kaikissa dokumentaatiotiedostoissa
- **🗺️ Pää-README.md**: Päivitetty Course Map uuteen lukuarkkitehtuuriin
- **📝 examples/README.md**: Päivitetty viittaukset luku-kansioihin

#### Poistettu
- Vanha kansiorakenne (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Tässä versiossa lisättiin luvunavigoinnin README-tiedostot (korvattu v3.15.0:ssa).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Tässä versiossa lisätään kattava opas AI-agenttien käyttöönottoon Azure Developer CLI:llä.**

#### Lisätty
- **🤖 docs/microsoft-foundry/agents.md**: Täydellinen opas, joka kattaa:
  - Mitä AI-agentit ovat ja miten ne eroavat chatboteista
  - Kolme pika-aloitusagenttipohjaa (Foundry Agents, Prompty, RAG)
  - Agenttiarkkitehtuurimallit (yksittäinen agentti, RAG, mon_agentti)
  - Työkalukonfiguraatio ja mukauttaminen
  - Seuranta ja metriikat
  - Kustannusnäkökohdat ja optimointi
  - Yleiset vianmääritystapaukset
  - Kolme käytännön harjoitusta onnistumiskriteereineen

#### Sisällön rakenne
- **Introduction**: Agenttikäsitteet aloittelijoille
- **Quick Start**: Ota agentit käyttöön `azd init --template get-started-with-ai-agents` -komennolla
- **Architecture Patterns**: Visualisoinnit agenttimalleista
- **Configuration**: Työkalun asetukset ja ympäristömuuttujat
- **Monitoring**: Application Insights -integraatio
- **Exercises**: Järjestelmälliset käytännön oppimistehtävät (20–45 minuuttia kukin)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Tässä versiossa päivitetään kehityssäiliön kokoonpano nykyaikaisilla työkaluilla ja paremmilla oletusasetuksilla AZD-oppimiskokemusta varten.**

#### Muutokset
- **🐳 Base Image**: Päivitetty `python:3.12-bullseye` → `python:3.12-bookworm` (uusin Debian-stable)
- **📛 Container Name**: Nimetty uudelleen "Python 3" → "AZD for Beginners" selkeyden vuoksi

#### Lisätty
- **🔧 Uudet Dev Container -ominaisuudet**:
  - `azure-cli` Bicep-tuen kanssa
  - `node:20` (LTS-versio AZD-malleille)
  - `github-cli` mallien hallintaan
  - `docker-in-docker` container-applikaatioiden käyttöönottoa varten

- **🔌 Porttien uudelleenohjaus**: Esikonfiguroidut portit yleiselle kehitykselle:
  - 8000 (MkDocs-esikatselu)
  - 3000 (Web-sovellukset)
  - 5000 (Python Flask)
  - 8080 (API:t)

- **🧩 Uudet VS Code -laajennukset**:
  - `ms-python.vscode-pylance` - Parannettu Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions -tuki
  - `ms-azuretools.vscode-docker` - Docker-tuki
  - `ms-azuretools.vscode-bicep` - Bicep-kielituki
  - `ms-azure-devtools.azure-resource-groups` - Azure-resurssien hallinta
  - `yzhang.markdown-all-in-one` - Markdown-muokkaus
  - `DavidAnson.vscode-markdownlint` - Markdown-linttaus
  - `bierner.markdown-mermaid` - Mermaid-kaavioiden tuki
  - `redhat.vscode-yaml` - YAML-tuki (azure.yaml:lle)
  - `eamodio.gitlens` - Git-visualisointi
  - `mhutchie.git-graph` - Git-historia

- **⚙️ VS Code -asetukset**: Lisätty oletusasetukset Python-tulkille, automaattimuotoilulle tallennettaessa ja välilyöntien poistolle

- **📦 Päivitetty requirements-dev.txt**:
  - Lisätty MkDocs-minify-laajennus
  - Lisätty pre-commit koodilaadun varmistukseen
  - Lisätty Azure SDK -paketit (azure-identity, azure-mgmt-resource)

#### Korjattu
- **Post-Create Command**: Tarkistaa nyt AZD:n ja Azure CLI:n asennuksen säilön käynnistyessä

---

### [v3.11.0] - 2026-02-05

#### Beginner-Friendly README Overhaul
**Tässä versiossa README.md parannetaan merkittävästi aloittelijaystävällisemmäksi ja lisätään olennaisia resursseja AI-kehittäjille.**

#### Lisätty
- **🆚 Azure CLI vs AZD -vertailu**: Selkeä selitys siitä, milloin käyttää kumpaakin työkalua esimerkkien kera
- **🌟 Upeat AZD-linkit**: Suorat linkit yhteisön malligalleriaan ja kontribuutiolähteisiin:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ valmista käyttöönottomallia
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Yhteisön kontribuutiot
- **🎯 Pika-aloitusopas**: Yksinkertaistettu 3-vaiheinen aloitus (Asenna → Kirjaudu sisään → Ota käyttöön)
- **📊 Kokemukseen perustuva navigointitaulukko**: Selkeät ohjeet siitä, mistä aloittaa kehittäjän kokemustason perusteella

#### Muutokset
- **README-rakenne**: Järjestelty niin, että tärkeimmät tiedot ovat ensin
- **Johdanto-osio**: Uudelleenkirjoitettu selittämään "The Magic of `azd up`" täydellisille aloittelijoille
- **Poistettu päällekkäinen sisältö**: Poistettu duplikaattinen vianmääritysosio
- **Vianmäärityskomennot**: Korjattu `azd logs` -viittaus käyttämään kelvollista `azd monitor --logs` -komentoa

#### Korjattu
- **🔐 Todennuskomennot**: Lisätty `azd auth login` ja `azd auth logout` tiedostoon resources/cheat-sheet.md
- **Virheelliset komentoviittaukset**: Poistettu jäljelle jääneet `azd logs` -viittaukset README:n vianmääritysosiosta

#### Huomioita
- **Scope**: Muutokset sovellettu pää-README.md:ään ja resources/cheat-sheet.md:ään
- **Kohdeyleisö**: Parannukset suunnattu erityisesti AZD:hen tutustuville kehittäjille

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI Command Accuracy Update
**Tässä versiossa korjataan dokumentaation olemattomia AZD-komentoja siten, että kaikki koodiesimerkit käyttävät kelvollista Azure Developer CLI -syntaksia.**

#### Korjattu
- **🔧 Ei-olevien AZD-komentojen poistot**: Laaja auditointi ja virheellisten komentojen korjaukset:
  - `azd logs` (ei olemassa) → korvattu `azd monitor --logs` tai Azure CLI -vaihtoehdoilla
  - `azd service` -alakomennot (eivät ole olemassa) → korvattu `azd show` ja Azure CLI:llä
  - `azd infra import/export/validate` (ei olemassa) → poistettu tai korvattu kelvollisilla vaihtoehdoilla
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` -liput (eivät ole olemassa) → poistettu
  - `azd provision --what-if/--rollback` -liput (eivät ole olemassa) → päivitetty käyttämään `--preview`
  - `azd config validate` (ei olemassa) → korvattu `azd config list`
  - `azd info`, `azd history`, `azd metrics` (eivät ole olemassa) → poistettu

- **📚 Tiedostot päivitetty komentokorjausten kanssa**:
  - `resources/cheat-sheet.md`: Merkittävä komentoviitteiden päivitys
  - `docs/deployment/deployment-guide.md`: Korjattu rollback- ja käyttöönotto-ohjeet
  - `docs/troubleshooting/debugging.md`: Korjattu lokianalyysiosiot
  - `docs/troubleshooting/common-issues.md`: Päivitetty vianmäärityskomennot
  - `docs/troubleshooting/ai-troubleshooting.md`: Korjattu AZD-vianmääritysosio
  - `docs/getting-started/azd-basics.md`: Korjattu monitorointi-komennot
  - `docs/getting-started/first-project.md`: Päivitetyt monitorointi- ja debug-esimerkit
  - `docs/getting-started/installation.md`: Korjatut ohje- ja versioviittaukset
  - `docs/pre-deployment/application-insights.md`: Korjatut lokien katselukomennot
  - `docs/pre-deployment/coordination-patterns.md`: Korjatut agenttien vianmäärityskomennot

- **📝 Versiovihje päivitetty**: 
  - `docs/getting-started/installation.md`: Vaihdettu kovakoodattu `1.5.0` yleiseen `1.x.x` -muotoon ja lisätty linkki julkaisuihin

#### Muutokset
- **Rollback-strategiat**: Päivitetty dokumentaatio käyttämään Git-pohjaista rollbackia (AZD:llä ei ole natiivia rollback-toimintoa)
- **Lokien katselu**: Korvattu `azd logs` -viittaukset `azd monitor --logs`, `azd monitor --live` ja Azure CLI -komennoilla
- **Suorituskykyosio**: Poistettu olemattomat parallel-/incremental-liput ja annettu kelvolliset vaihtoehdot

#### Teknisiä tietoja
- **Kelvolliset AZD-komennot**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Kelvolliset azd monitor -liput**: `--live`, `--logs`, `--overview`
- **Poistetut ominaisuudet**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Huomautuksia
- **Varmennus**: Komennot validoitu Azure Developer CLI v1.23.x:ää vasten

---

### [v3.9.0] - 2026-02-05

#### Workshop Completion and Documentation Quality Update
**Tämä versio täydentää interaktiiviset työpajamoduulit, korjaa kaikki rikkinäiset dokumentaatiolinkit ja parantaa yleistä sisältölaatua Microsoft AZD:tä käyttäville AI-kehittäjille.**

#### Added
- **📝 CONTRIBUTING.md**: Uusi kontribuutiot ohjeet -dokumentti, joka sisältää:
  - Selkeät ohjeet ongelmien raportointiin ja muutosehdotusten tekemiseen
  - Dokumentointistandardit uudelle sisällölle
  - Koodiesimerkkiohjeet ja commit-viestien konventiot
  - Tietoa yhteisön osallistumisesta

#### Completed
- **🎯 Workshop Module 7 (Wrap-up)**: Täysin valmis wrap-up-moduuli, joka sisältää:
  - Kattavan yhteenvedon työpajan saavutuksista
  - Avainkäsitteet-osio, joka kattaa AZD:n, mallipohjat ja Microsoft Foundryn
  - Suositukset oppimispolun jatkamiseksi
  - Työpajan haasteharjoitukset vaikeustason arvioinneilla
  - Yhteisön palaute- ja tukilinkit

- **📚 Workshop Module 3 (Deconstruct)**: Päivitetyt oppimistavoitteet, jotka sisältävät:
  - Ohjeistus GitHub Copilotin ja MCP-palvelimien aktivointiin
  - Ymmärrys AZD-mallipohjien kansiorakenteesta
  - Infrastructure-as-code (Bicep) -järjestelymallit
  - Käytännön laboratorio-ohjeet

- **🔧 Workshop Module 6 (Teardown)**: Valmistunut sisältäen:
  - Resurssien siivous- ja kustannustenhallintatavoitteet
  - `azd down` käyttö infrastruktuurin turvalliseen deprovisiointiin
  - Ohjeet pehmeästi poistettujen kognitiivisten palveluiden palauttamiseen
  - Bonus-tutkimuskehotteet GitHub Copilotille ja Azure Portalille

#### Fixed
- **🔗 Rikkinäisten linkkien korjaukset**: Korjattiin yli 15 rikkinäistä sisäistä dokumentaatiolinkkiä:
  - `docs/ai-foundry/ai-model-deployment.md`: Korjattu polut tiedostoon microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korjattu polut tiedostoihin ai-model-deployment.md ja production-ai-practices.md
  - `docs/getting-started/first-project.md`: Korvattu olematon cicd-integration.md tiedostolla deployment-guide.md
  - `examples/retail-scenario.md`: Korjattu FAQ- ja vianmääritysohjeiden polut
  - `examples/container-app/microservices/README.md`: Korjattu kurssin kotisivu- ja deployment-opas -polut
  - `resources/faq.md` ja `resources/glossary.md`: Päivitetty AI-lukuviittaukset
  - `course-outline.md`: Korjattu ohjaajan opas- ja AI-työpajaharjoitus -viittaukset

- **📅 Työpajan tilabanneri**: Päivitetty "Under Construction" -tilasta aktiiviseksi työpajaksi helmikuu 2026 -päivämäärällä

- **🔗 Työpajan navigaatio**: Korjattu rikkinäiset navigointilinkit workshop README.md:ssä, jotka osoittivat olemattomaan lab-1-azd-basics -hakemistoon

#### Changed
- **Työpajan esitys**: Poistettu "under construction" -varoitus; työpaja on nyt valmis ja käyttövalmis
- **Navigoinnin johdonmukaisuus**: Varmistettu, että kaikilla työpajamoduuleilla on asianmukainen moduulien välinen navigaatio
- **Oppimispolun viittaukset**: Päivitetty lukuviittaukset käyttämään oikeita microsoft-foundry -polkuja

#### Validated
- ✅ Kaikissa englanninkielisissä Markdown-tiedostoissa on toimivat sisäiset linkit
- ✅ Työpajamoduulit 0-7 ovat valmiit oppimistavoitteineen
- ✅ Navigointi lukujen ja moduulien välillä toimii oikein
- ✅ Sisältö soveltuu Microsoft AZD:tä käyttäville AI-kehittäjille
- ✅ Aloittelijaystävällinen kieli ja rakenne on säilytetty
- ✅ CONTRIBUTING.md tarjoaa selkeät ohjeet yhteisön kontribuuttoreille

#### Tekninen toteutus
- **Linkkien validointi**: Automaattinen PowerShell-skripti varmisti kaikki .md-sisäiset linkit
- **Sisältöauditointi**: Manuaalinen tarkastus työpajan täydellisyyden ja aloittelijasoveltuvuuden varmistamiseksi
- **Navigaatiojärjestelmä**: Johdonmukaiset luku- ja moduulinavigaatiomallit otettu käyttöön

#### Huomautuksia
- **Soveltamisala**: Muutokset tehty vain englanninkieliseen dokumentaatioon
- **Käännökset**: Käännöshakemistot eivät päivittyneet tässä versiossa (automaattinen käännös synkronoidaan myöhemmin)
- **Työpajan kesto**: Valmis työpaja tarjoaa nyt 3–4 tuntia käytännön oppimista

---

### [v3.8.0] - 2025-11-19

#### Advanced Documentation: Monitoring, Security, and Multi-Agent Patterns
**Tämä versio lisää kattavat A-tason oppitunnit Application Insights -integraatiosta, todennusmalleista ja moniedustajakoordinaatiosta tuotantokäyttöön.**

#### Added
- **📊 Application Insights Integration Lesson**: tiedostossa `docs/pre-deployment/application-insights.md`:
  - AZD-keskeinen käyttöönotto automaattisella provisioinnilla
  - Täydelliset Bicep-mallit Application Insightsille ja Log Analyticsille
  - Toimivat Python-sovellukset räätälöidyllä telemetrialla (yli 1 200 riviä)
  - AI/LLM-monitorointimallit (Microsoft Foundry Models -tokenien/kustannusten seuranta)
  - 6 Mermaid-kaaviota (arkkitehtuuri, hajautettu jäljitys, telemetriavirta)
  - 3 käytännön harjoitusta (hälytykset, kojelaudat, AI-monitorointi)
  - Kusto-kyselyesimerkkejä ja kustannusten optimointistrategioita
  - Live-metriikoiden striimaus ja reaaliaikainen virheenkorjaus
  - 40–50 minuutin oppimisaika tuotantovalmiiden mallien kanssa

- **🔐 Authentication & Security Patterns Lesson**: tiedostossa `docs/getting-started/authsecurity.md`:
  - 3 todennuskäytäntöä (yhteysmerkkijonot, Key Vault, hallittu identiteetti)
  - Täydelliset Bicep-infrastruktuurimallit turvallisiin käyttöönottoihin
  - Node.js-sovelluskoodi Azure SDK -integraatiolla
  - 3 täydellistä harjoitusta (hallittu identiteetti, käyttäjälle määritetty identiteetti, Key Vaultin avainkierto)
  - Turvallisuusparhaat käytännöt ja RBAC-konfiguraatiot
  - Vianmääritysohje ja kustannusanalyysi
  - Tuotantovalmiit salasanattoman todennuksen mallit

- **🤖 Multi-Agent Coordination Patterns Lesson**: tiedostossa `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinointimallia (peräkkäinen, rinnakkainen, hierarkkinen, tapahtumia ohjaava, konsensus)
  - Täydellinen orkestrointipalvelun toteutus (Python/Flask, yli 1 500 riviä)
  - 3 erikoistettua agenttitoteutusta (Research, Writer, Editor)
  - Service Bus -integraatio viestijonitusta varten
  - Cosmos DB -tilanhallinta hajautetuille järjestelmille
  - 6 Mermaid-kaaviota, jotka näyttävät agenttien vuorovaikutuksen
  - 3 edistynyttä harjoitusta (aikakatkaisun käsittely, uudelleenyrityslogiikka, circuit breaker)
  - Kustannuserittely (240–565 $/kk) optimointistrategioineen
  - Application Insights -integraatio monitorointia varten

#### Enhanced
- **Ennen käyttöönottoa -luku**: Sisältää nyt kattavat monitorointi- ja koordinointimallit
- **Aloitusluku**: Laajennettu ammattimaisten todennusmallien osalta
- **Tuotantovalmius**: Täydellinen kattavuus turvallisuudesta havaittavuuteen
- **Kurssin yleiskuva**: Päivitetty viittaamaan uusiin oppitunteihin luvuissa 3 ja 6

#### Changed
- **Oppimisen eteneminen**: Parempi integraatio turvallisuuden ja monitoroinnin välillä koko kurssilla
- **Dokumentaation laatu**: Johdonmukaiset A-tason standardit (95–97 %) uusissa oppitunneissa
- **Tuotantomallit**: Täydellinen end-to-end-kattavuus yrityskäyttöön

#### Improved
- **Kehittäjäkokemus**: Selkeä polku kehityksestä tuotannon monitorointiin
- **Turvallisuusstandardit**: Ammattimaiset mallit todennukselle ja salaisuuksien hallinnalle
- **Havaittavuus**: Täydellinen Application Insights -integraatio AZD:n kanssa
- **AI-kuormat**: Erikoistunut monitorointi Microsoft Foundry Modelsille ja moniedustajajärjestelmille

#### Validated
- ✅ Kaikissa oppitunneissa on toimiva, täydellinen koodi (ei pelkkiä katkelmia)
- ✅ Mermaid-kaaviot visuaalista oppimista varten (19 kappaletta kolmen oppitunnin välillä)
- ✅ Käytännön harjoitukset verifikaatiovaiheineen (9 kappaletta)
- ✅ Tuotantovalmiit Bicep-mallit pystytettävissä `azd up` -komennolla
- ✅ Kustannusanalyysi ja optimointistrategiat
- ✅ Vianmääritysohjeet ja parhaat käytännöt
- ✅ Tiedon tarkistuspisteet verifikaatiokomennoilla

#### Dokumentaation arviointitulokset
- **docs/pre-deployment/application-insights.md**: - Kattava monitorointiohje
- **docs/getting-started/authsecurity.md**: - Ammattimaiset turvallisuusmallit
- **docs/pre-deployment/coordination-patterns.md**: - Edistyneet moniedustaja-arkkitehtuurit
- **Uusi sisältö yhteenvetona**: - Johdonmukaiset korkean laadun standardit

#### Tekninen toteutus
- **Application Insights**: Log Analytics + räätälöity telemetria + hajautettu jäljitys
- **Todennus**: Hallittu identiteetti + Key Vault + RBAC-mallit
- **Moniedustaja**: Service Bus + Cosmos DB + Container Apps + orkestrointi
- **Monitorointi**: Live-metriikat + Kusto-kyselyt + hälytykset + kojelaudat
- **Kustannusten hallinta**: Otanta, säilytyskäytännöt, budjetin valvonta

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**Tämä versio parantaa dokumentaation laatua repositoriossa ja lisää täydellisen Microsoft Foundry Models -käyttöönoton esimerkin gpt-4.1 chat -käyttöliittymällä.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Täydellinen gpt-4.1 -käyttöönotto toimivalla toteutuksella kansiossa `examples/azure-openai-chat/`:
  - Täydellinen Microsoft Foundry Models -infrastruktuuri (gpt-4.1 -mallin käyttöönotto)
  - Python-pohjainen komentorivichat käyttöliittymä keskusteluhistorialla
  - Key Vault -integraatio API-avainten turvalliseen tallennukseen
  - Tokenien käytön seuranta ja kustannusarvio
  - Nopeusrajoituksen hallinta ja virheenkäsittely
  - Kattava README 35–45 minuutin käyttöönotto-oppaalla
  - 11 tuotantovalmista tiedostoa (Bicep-mallit, Python-sovellus, konfiguraatio)
- **📚 Dokumentaatiotehtävät**: Lisätty käytännön harjoituksia konfiguraatio-oppaan yhteyteen:
  - Harjoitus 1: Moniympäristökonfiguraatio (15 minuuttia)
  - Harjoitus 2: Salaisuuksien hallinnan harjoitus (10 minuuttia)
  - Selkeät onnistumiskriteerit ja verifiointivaiheet
- **✅ Käyttöönoton varmennus**: Lisätty varmennusosio käyttöönotto-oppaaseen:
  - Health check -menettelyt
  - Onnistumisen kriteerilista
  - Odotetut tulosteet kaikille käyttöönotto komennoille
  - Nopea vianmäärityksen pikaopas

#### Enhanced
- **examples/README.md**: Päivitetty A-tason laatuun (93 %):
  - Lisätty azure-openai-chat kaikkiin asiaankuuluviin osioihin
  - Paikallisten esimerkkien määrä päivitetty 3:sta 4:ään
  - Lisätty AI-sovellusesimerkkeihin
  - Integroitu Keskitetty Aloitus välivaiheille (Quick Start for Intermediate Users)
  - Lisätty Microsoft Foundry Templates -osioon
  - Päivitetty vertailumatriisi ja teknologian löytöosiot
- **Dokumentaation laatu**: Parannettu B+ (87 %) → A- (92 %) docs-kansiossa:
  - Lisätty odotetut tulosteet kriittisiin komentoesimerkkeihin
  - Mukana verifikaatiovaiheet konfiguraatiomuutoksille
  - Parannettu käytännön oppimista konkreettisilla harjoituksilla

#### Changed
- **Oppimisen eteneminen**: Parempi integraatio AI-esimerkkien kanssa keskitason käyttäjille
- **Dokumentaation rakenne**: Toiminnallisempia harjoituksia selkeillä tuloksilla
- **Varmennusprosessi**: Selkeät onnistumiskriteerit lisätty keskeisiin työnkulkuihin

#### Improved
- **Kehittäjäkokemus**: Microsoft Foundry Models -käyttöönotto kestää nyt 35–45 minuuttia (verrattuna 60–90 minuuttia monimutkaisempiin vaihtoehtoihin)
- **Kustannusten läpinäkyvyys**: Selkeät kustannusarviot (50–200 $/kk) Microsoft Foundry Models -esimerkille
- **Oppimispolku**: AI-kehittäjille selkeä lähtöpiste azure-openai-chatin kautta
- **Dokumentaation standardit**: Johdonmukaiset odotetut tulosteet ja verifikaatiovaiheet

#### Validated
- ✅ Microsoft Foundry Models -esimerkki toimii täydellisesti `azd up` -komennolla
- ✅ Kaikki 11 toteutustiedostoa ovat syntaksiltaan oikein
- ✅ README-ohjeet vastaavat todellista käyttöönotto-kokemusta
- ✅ Dokumenttilinkit päivitetty yli 8 eri paikkaan
- ✅ Esimerkkien indeksi heijastaa oikein 4 paikallista esimerkkiä
- ✅ Ei duplikaatteja ulkoisissa linkeissä taulukoissa
- ✅ Kaikki navigointiviitteet ovat oikein

#### Tekninen toteutus
- **Microsoft Foundry Models -arkkitehtuuri**: gpt-4.1 + Key Vault + Container Apps -malli
- **Turvallisuus**: Valmis hallittuun identiteettiin, salaisuudet Key Vaultissa
- **Monitorointi**: Application Insights -integraatio
- **Kustannusten hallinta**: Token-seuranta ja käytön optimointi
- **Käyttöönotto**: Yksi `azd up` -komento koko asennukselle

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**Tämä versio esittelee kattavat, tuotantovalmiit konttisovellus-käyttöönottoesimerkit Azure Developer CLI:n (AZD) avulla, kokonaisella dokumentaatiolla ja integraatiolla oppimispolkuun.**

#### Added
- **🚀 Container App Examples**: Uudet paikalliset esimerkit kansiossa `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Täydellinen yleiskatsaus kontitetuille käyttöönottoihin, pika-aloitus, tuotanto ja edistyneet mallit
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Aloittelijaystävällinen REST-API skaalaus-zero:lla, terveysprobeilla, monitoroinnilla ja vianmäärityksellä
  - [Microservices Architecture](../../examples/container-app/microservices): Tuotantovalmis monipalvelukäyttöönotto (API Gateway, Product, Order, User, Notification), asynkroninen viestintä, Service Bus, Cosmos DB, Azure SQL, hajautettu jäljitys, blue-green/canary -käyttöönotot
- **Parhaat käytännöt**: Turvallisuus, monitorointi, kustannusten optimointi ja CI/CD-ohjeistus konttikuormille
- **Koodiesimerkit**: Täydelliset `azure.yaml`, Bicep-mallit ja monikieliset palvelutoteutukset (Python, Node.js, C#, Go)
- **Testaus & vianmääritys**: End-to-end -testiskenaariot, monitorointikomennot, vianmääritysohjeet

#### Changed
- **README.md**: Päivitetty esittelemään ja linkittämään uusia konttisovellus-esimerkkejä kohtaan "Paikalliset esimerkit - Konttisovellukset"
- **examples/README.md**: Päivitetty korostamaan konttisovellus-esimerkkejä, lisäämään vertailumatriisin kohtia ja päivittämään teknologia-/arkkitehtuuriviittaukset
- **Course Outline & Study Guide**: Päivitetty viittaamaan uusiin konttisovellus-esimerkkeihin ja käyttöönottoihin liittyviin malleihin asiaankuuluvissa luvuissa

#### Vahvistettu
- ✅ Kaikki uudet esimerkit käyttöön otettavissa `azd up` -komennolla ja noudattavat parhaita käytäntöjä
- ✅ Dokumentaation ristiinlinkitykset ja navigaatio päivitetty
- ✅ Esimerkit kattavat aloittelijasta edistyneisiin skenaarioihin, mukaan lukien tuotantotason mikropalvelut

#### Huomautuksia
- **Scope**: Vain englanninkielinen dokumentaatio ja esimerkit
- **Next Steps**: Laajennus lisättyillä edistyneemmillä konttimalleilla ja CI/CD-automaatioilla tulevissa julkaisuissa

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Tässä versiossa toteutetaan kattava tuotteen nimen muutos "Microsoft Foundry" → "Microsoft Foundry" kaikessa englanninkielisessä dokumentaatiossa, heijastaen Microsoftin virallista uudelleenbrändäystä.**

#### Changed
- **🔄 Product Name Update**: Täydellinen uudelleenbrändäys "Microsoft Foundry" → "Microsoft Foundry"
  - Päivitetty kaikki viittaukset englanninkielisessä dokumentaatiossa `docs/` -kansiossa
  - Uudelleennimetty kansio: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Uudelleennimetty tiedosto: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Yhteensä: 23 sisällön viittausta päivitetty 7 dokumentaatiotiedostossa

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` uudelleennimetty muotoon `docs/microsoft-foundry/`
  - Kaikki ristiinviittaukset päivitetty vastaamaan uutta kansiorakennetta
  - Navigaatiolinkit validoitu kaikissa dokumenteissa

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kaikki sisäiset linkit päivitetty viittaamaan uuteen tiedostonimeen

#### Päivitetyt tiedostot
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigointilinkin päivitystä
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tuotteen nimiviitteen päivitystä
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Käyttää jo Microsoft Foundry -nimeä (aiemmista päivityksistä)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 viittauksen päivitystä (yleiskatsaus, yhteisön palaute, dokumentaatio)
  - `docs/getting-started/azd-basics.md` - 4 ristiinviittauslinkin päivitystä
  - `docs/getting-started/first-project.md` - 2 luvunavigointilinkin päivitystä
  - `docs/getting-started/installation.md` - 2 seuraavan luvun linkin päivitystä
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 viittauksen päivitystä (navigaatio, Discord-yhteisö)
  - `docs/troubleshooting/common-issues.md` - 1 navigointilinkin päivitys
  - `docs/troubleshooting/debugging.md` - 1 navigointilinkin päivitys

- **Course Structure Files** (2 files):
  - `README.md` - 17 viitteen päivitystä (kurssin yleiskatsaus, lukujen otsikot, mallipohjat-osio, yhteisöanalyysit)
  - `course-outline.md` - 14 viitteen päivitystä (yleiskatsaus, oppimistavoitteet, lukujen resurssit)

#### Vahvistettu
- ✅ Ei jäljellä "ai-foundry" -kansioon viittaavia polkuja englanninkielisissä dokumenteissa
- ✅ Ei jäljellä "Microsoft Foundry" -tuotteen nimiviittauksia englanninkielisissä dokumenteissa
- ✅ Kaikki navigaatiolinkit toimivat uuden kansiorakenteen kanssa
- ✅ Tiedostojen ja kansioiden uudelleennimeäminen suoritettu onnistuneesti
- ✅ Luku- ja ristiinviittaukset validoitu

#### Huomautuksia
- **Scope**: Muutokset tehty vain `docs/` -kansion englanninkieliseen dokumentaatioon
- **Translations**: Käännöskansiot (`translations/`) eivät päivity tässä versiossa
- **Workshop**: Työpajamateriaalit (`workshop/`) eivät päivity tässä versiossa
- **Examples**: Esimerkkitiedostot saattavat edelleen viitata vanhaan nimeämistapaan (korjataan tulevassa päivityksessä)
- **External Links**: Ulkoiset URL-osoitteet ja GitHub-repositorion viittaukset säilyvät muuttumattomina

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Tässä versiossa otetaan käyttöön laaja tuki uudelle Azure Developer CLI -esikatselutoiminnolle ja parannetaan työpajan käyttäjäkokemusta.**

#### Lisätty
- **🧪 azd provision --preview Feature Documentation**: Kattava kuvaus uudesta infrastruktuurin esikatseluominaisuudesta
  - Komentorivi­viitteet ja käyttöesimerkit pikatiedotteessa
  - Yksityiskohtainen integrointi provisiointiohjeeseen käyttötapauksineen ja hyötyineen
  - Esilento­tarkistusintegraatio turvallisempaa käyttöönoton validointia varten
  - Aloitusoppaan päivitykset turvallisuus edellä -käytänteillä
- **🚧 Workshop Status Banner**: Ammattimainen HTML-banneri, joka ilmoittaa työpajan kehitystilasta
  - Liukuvärjätty muotoilu ja rakennustilaa osoittavat elementit selkeää käyttäjäviestintää varten
  - Viimeisin päivitysaikaleima läpinäkyvyyden takaamiseksi
  - Mobiiliresponsiivinen muotoilu kaikille laitteille

#### Parannettu
- **Infrastructure Safety**: Esikatselutoiminto integroitu läpi käyttöönotto­dokumentaation
- **Pre-deployment Validation**: Automatisoidut skriptit sisältävät nyt infrastruktuurin esikatselutestauksen
- **Developer Workflow**: Päivitetyt komentosarjat sisältävät esikatselun suositeltuna käytäntönä
- **Workshop Experience**: Käyttäjille asetetaan selkeät odotukset sisällön kehitystilasta

#### Muutettu
- **Deployment Best Practices**: Esikatselu-ensimmäinen työnkulku suositeltavana lähestymistapana
- **Documentation Flow**: Infrastruktuurin validointi siirretty oppimisprosessissa aikaisemmaksi
- **Workshop Presentation**: Ammattimainen tilaviestintä selkeällä kehitysaikataululla

#### Parannuksia
- **Safety-First Approach**: Infrastruktuurin muutokset voidaan nyt validoida ennen käyttöönottoa
- **Team Collaboration**: Esikatselun tuloksia voidaan jakaa tarkistusta ja hyväksyntää varten
- **Cost Awareness**: Parempi ymmärrys resurssikustannuksista ennen provisiointia
- **Risk Mitigation**: Vähemmän käyttöönoton epäonnistumisia ennakollisen validoinnin kautta

#### Tekninen toteutus
- **Multi-document Integration**: Esikatseluominaisuus dokumentoitu 4 keskeisessä tiedostossa
- **Command Patterns**: Johdonmukainen syntaksi ja esimerkit läpi dokumentaation
- **Best Practice Integration**: Esikatselu mukana validointityönkuluissa ja skripteissä
- **Visual Indicators**: Selkeät UUSI-ominaisuusmerkinnät löydettävyyden parantamiseksi

#### Työpajan infrastruktuuri
- **Status Communication**: Ammattimainen HTML-banneri liukuväristyylillä
- **User Experience**: Selkeä kehitystilan viestintä estää sekaannuksia
- **Professional Presentation**: Säilyttää repositorion uskottavuuden samalla kun asettaa odotukset
- **Timeline Transparency**: Lokakuu 2025 - viimeisin päivitys aikaleimana vastuullisuuden vuoksi

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**Tässä versiossa tarjotaan kattavat työpajamateriaalit selaimessa toimivine interaktiivisine oppaineen ja rakenteellisine oppimispolkuineen.**

#### Lisätty
- **🎥 Interactive Workshop Guide**: Selaimessa toimiva työpajakokemus MkDocs-esikatseluominaisuudella
- **📝 Structured Workshop Instructions**: 7-vaiheinen ohjattu oppimispolku löytämisestä räätälöintiin
  - 0-Introduction: Työpajan yleiskatsaus ja asennus
  - 1-Select-AI-Template: Mallin etsiminen ja valintaprosessi
  - 2-Validate-AI-Template: Käyttöönotto ja validointimenettelyt
  - 3-Deconstruct-AI-Template: Mallin arkkitehtuurin ymmärtäminen
  - 4-Configure-AI-Template: Konfigurointi ja räätälöinti
  - 5-Customize-AI-Template: Edistyneet muokkaukset ja iteroinnit
  - 6-Teardown-Infrastructure: Siivous ja resurssien hallinta
  - 7-Wrap-up: Yhteenveto ja seuraavat askeleet
- **🛠️ Workshop Tooling**: MkDocs-konfiguraatio Material-teemalla parannettua oppimiskokemusta varten
- **🎯 Hands-On Learning Path**: 3-vaiheinen metodologia (Löytäminen → Käyttöönotto → Räätälöinti)
- **📱 GitHub Codespaces Integration**: Saumaton kehitysympäristön pystytys

#### Parannettu
- **AI Workshop Lab**: Laajennettu kattavaksi 2–3 tunnin rakenteelliseksi oppimiskokemukseksi
- **Workshop Documentation**: Ammattimainen esitys navigaatiolla ja visuaalisilla tukiaineistoilla
- **Learning Progression**: Selkeä vaiheistus mallin valinnasta tuotantoon viemiseen
- **Developer Experience**: Integroituja työkaluja sujuvoittamaan kehitystyön kulkua

#### Parannuksia
- **Accessibility**: Selaimessa toimiva käyttöliittymä hakutoiminnolla, kopiointi-ominaisuudella ja teeman vaihdolla
- **Self-Paced Learning**: Joustava työpajarakenne eri oppimisnopeuksille
- **Practical Application**: Todellisia AI-mallien käyttöönotto­skenaarioita
- **Community Integration**: Discord-integraatio työpajan tukea ja yhteistyötä varten

#### Workshop Features
- **Built-in Search**: Nopea avainsana- ja oppitunnin löytäminen
- **Copy Code Blocks**: Hover-to-copy -toiminto kaikille koodiesimerkeille
- **Theme Toggle**: Tumma/vaalea -tila eri mieltymyksiä varten
- **Visual Assets**: Kuvakaappaukset ja kaaviot ymmärrettävyyden parantamiseksi
- **Help Integration**: Suora Discord-pääsy yhteisön tukea varten

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Tässä versiossa otetaan käyttöön kattava lukuun perustuva oppimisrakenne ja parannettu navigaatio koko repositoriossa.**

#### Lisätty
- **📚 Chapter-Based Learning System**: Koko kurssi järjestelty 8 etenevään lukuun
  - Luku 1: Perusta & Nopea aloitus (⭐ - 30-45 min)
  - Luku 2: AI-lähtöinen kehitys (⭐⭐ - 1-2 tuntia)
  - Luku 3: Konfigurointi ja todennus (⭐⭐ - 45-60 min)
  - Luku 4: Infrastruktuuri koodina ja käyttöönotto (⭐⭐⭐ - 1-1.5 tuntia)
  - Luku 5: Moni-agenttiset AI-ratkaisut (⭐⭐⭐⭐ - 2-3 tuntia)
  - Luku 6: Ennakkotarkastus ja suunnittelu ennen käyttöönottoa (⭐⭐ - 1 tunti)
  - Luku 7: Vianetsintä ja virheenkorjaus (⭐⭐ - 1-1.5 tuntia)
  - Luku 8: Tuotanto ja yritystason mallit (⭐⭐⭐⭐ - 2-3 tuntia)
- **📚 Comprehensive Navigation System**: Johdonmukaiset navigaatiopalkit ja alatunnisteet kautta koko dokumentaation
- **🎯 Progress Tracking**: Kurssin suorituschecklist ja oppimisen validointijärjestelmä
- **🗺️ Learning Path Guidance**: Selkeät sisäänpääsypolut eri kokemustasoille ja tavoitteille
- **🔗 Cross-Reference Navigation**: Aiheeseen liittyvät luvut ja edellytykset selkeästi linkitettyinä

#### Parannettu
- **README Structure**: Muutettu rakenteelliseksi oppimisalustaksi lukuja hyödyntäen
- **Documentation Navigation**: Jokaisella sivulla on nyt luvun konteksti ja etenemissuositus
- **Template Organization**: Esimerkit ja mallit kartoitettu sopiviin lukuihin
- **Resource Integration**: Pikatiedotteet, UKK:t ja opintosuunnitelmat liitetty asiaankuuluviin lukuihin
- **Workshop Integration**: Käytännön labrat sidottu useisiin luku­tavoitteisiin

#### Muutettu
- **Learning Progression**: Siirtymä lineaarisesta dokumentaatiosta joustavaan lukuun perustuvaan oppimiseen
- **Configuration Placement**: Konfiguraatio-opas siirretty Lukuun 3 parempaa oppimisvirtausta varten
- **AI Content Integration**: AI-spesifinen sisältö integroidumpana läpi oppimismatkan
- **Production Content**: Edistyneet mallit koottu Lukuun 8 yrityskäyttäjille

#### Parannuksia
- **User Experience**: Selkeät navigointipolut ja luvun etenemisindikaattorit
- **Accessibility**: Johdonmukaiset navigointikäytännöt helpottavat kurssin läpikäyntiä
- **Professional Presentation**: Yliopistotyyppinen kurssirakenne sopii akateemiseen ja yrityskoulutukseen
- **Learning Efficiency**: Lyhyempi aika löytää olennaiset sisällöt parannetun organisoinnin ansiosta

#### Tekninen toteutus
- **Navigation Headers**: Standardisoidut luvunavigaatiot yli 40 dokumenttiedostossa
- **Footer Navigation**: Johdonmukainen etenemisopastus ja luvun suoritusindikaattorit
- **Cross-Linking**: Kattava sisäinen linkitysjärjestelmä yhdistää aiheita ja käsitteitä
- **Chapter Mapping**: Mallit ja esimerkit selkeästi sidottu oppimistavoitteisiin

#### Opintosuunnitelman parannukset
- **📚 Comprehensive Learning Objectives**: Opintosuunnitelma uudelleenjärjestetty 8-lukuiseen järjestelmään
- **🎯 Chapter-Based Assessment**: Jokaisessa luvussa on erityiset oppimistavoitteet ja käytännön harjoitukset
- **📋 Progress Tracking**: Viikkokohtainen oppimisaikataulu mitattavilla tuloksilla ja suoritustarkistuksilla
- **❓ Assessment Questions**: Tiedonvarmistuskysymykset kullekin luvulle ammatillisiin tuloksiin tähtääen
- **🛠️ Practical Exercises**: Käytännön harjoituksia todellisilla käyttöönotto­skenaarioilla ja vianetsinnällä
- **📊 Skill Progression**: Selkeä eteneminen peruskäsitteistä yritystason malleihin ja urakehitykseen
- **🎓 Certification Framework**: Ammatillisen kehityksen tulokset ja yhteisön tunnustusjärjestelmä
- **⏱️ Timeline Management**: Rakenteellinen 10-viikon opintosuunnitelma virstanpylväiden validoinnilla

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Tässä versiossa parannetaan moni-agenttista vähittäiskaupan ratkaisua selkeämmillä agentin nimillä ja parannetulla dokumentaatiolla.**

#### Muutettu
- **Multi-Agent Terminology**: Korvattu "Cora agent" nimellä "Customer agent" koko vähittäiskaupan moni-agenttiratkaisussa selkeämmän ymmärrettävyyden vuoksi
- **Agent Architecture**: Päivitetty kaikki dokumentaatiot, ARM-mallit ja koodiesimerkit käyttämään yhtenäistä "Customer agent" -nimitystä
- **Configuration Examples**: Modernisoidut agentin konfigurointimallit päivitettyjen nimeämiskäytäntöjen mukaisesti
- **Documentation Consistency**: Varmistettu, että kaikki viittaukset käyttävät ammatillisia, kuvaavia agenttien nimiä

#### Parannettu
- **ARM Template Package**: Päivitetty retail-multiagent-arm-template Customer agent -viittauksilla
- **Architecture Diagrams**: Päivitetyt Mermaid-diagrammit päivitetyn agentin nimeämisen kanssa
- **Code Examples**: Python-luokat ja toteutusesimerkit käyttävät nyt CustomerAgent-nimeämistä
- **Environment Variables**: Päivitetty kaikki käyttöönotto-skriptit käyttämään CUSTOMER_AGENT_NAME -konventioita

#### Improved
- **Developer Experience**: Selkeämmät agenttiroolit ja vastuut dokumentaatiossa
- **Production Readiness**: Parempi yhdenmukaisuus yritystason nimeämiskäytäntöjen kanssa
- **Learning Materials**: Intuitiivisempi agenttien nimeäminen opetustarkoituksiin
- **Template Usability**: Yksinkertaisempi ymmärtää agenttien toimintoja ja käyttöönotto-malleja

#### Technical Details
- Päivitetyt Mermaid-arkkitehtuurikaaviot CustomerAgent-viittauksilla
- Korvattu CoraAgent-luokkien nimet CustomerAgent-luokilla Python-esimerkeissä
- Muokattu ARM template JSON -konfiguraatioita käyttämään "customer" agenttityyppiä
- Päivitetty ympäristömuuttujia CORA_AGENT_*:sta CUSTOMER_AGENT_* -kuvioihin
- Päivitetty kaikki käyttöönotto-komennot ja konttikonfiguraatiot

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Täydellinen uudelleenjärjestely, joka priorisoi AI-kehittäjät ja -insinöörit
- **Microsoft Foundry Integration Guide**: Kattava dokumentaatio AZD:n yhdistämisestä Microsoft Foundry -palveluihin
- **AI Model Deployment Patterns**: Yksityiskohtainen opas mallin valintaan, konfigurointiin ja tuotantokäyttöönottoon
- **AI Workshop Lab**: 2–3 tunnin käytännön työpaja AI-sovellusten muuntamiseksi AZD:n kautta otettaviksi käyttöön
- **Production AI Best Practices**: Yritysvalmiit mallit AI-kuormien skaalaamiseen, valvontaan ja suojaamiseen
- **AI-Specific Troubleshooting Guide**: Kattava vianetsintä Microsoft Foundry -malleille, Cognitive Servicesille ja AI-käyttöönotto-ongelmille
- **AI Template Gallery**: Esittelykokoelma Microsoft Foundry -malleista monimutkaisuusluokituksineen
- **Workshop Materials**: Täydellinen työpajan rakenne käytännön harjoituksineen ja tukimateriaaleineen

#### Enhanced
- **README Structure**: AI-kehittäjille suunnattu rakenne, 45 % yhteisön kiinnostusdatalla Microsoft Foundry Discordista
- **Learning Paths**: Omistettu AI-kehittäjän polku rinnakkain perinteisten polkujen opiskelijoille ja DevOps-insinööreille
- **Template Recommendations**: Esitellyt AI-mallit, mukaan lukien azure-search-openai-demo, contoso-chat ja openai-chat-app-quickstart
- **Community Integration**: Laajennettu Discord-yhteisötuki AI-spesifisillä kanavilla ja keskusteluilla

#### Security & Production Focus
- **Managed Identity Patterns**: AI-spesifiset todennus- ja suojauskonfiguraatiot
- **Cost Optimization**: Tokenien käytön seuranta ja budjettikontrollit AI-kuormille
- **Multi-Region Deployment**: Strategiat globaalille AI-sovellusten käyttöönotolle
- **Performance Monitoring**: AI-spesifiset mittarit ja Application Insights -integraatio

#### Documentation Quality
- **Linear Course Structure**: Looginen eteneminen aloittelijasta edistyneisiin AI-käyttöönotto-malleihin
- **Validated URLs**: Kaikki ulkoiset repository-linkit tarkistettu ja saavutettavissa
- **Complete Reference**: Kaikki sisäiset dokumentaatio-linkit validoitu ja toimivia
- **Production Ready**: Yritysvalmiit käyttöönotto-mallit todellisilla esimerkeillä

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: Kaikille dokumentaatiopuille lisätty Introduction-, Learning Goals- ja Learning Outcomes -osiot
- **Navigation System**: Lisätty Previous/Next -oppitunnelinkit kaikkialle dokumentaatioon ohjattua etenemistä varten
- **Study Guide**: Kattava study-guide.md oppimistavoitteineen, harjoitustehtävineen ja arviointimateriaaleineen
- **Professional Presentation**: Poistettu kaikki emoji-ikonit parannetun saavutettavuuden ja ammattimaisen ulkoasun vuoksi
- **Enhanced Content Structure**: Parannettu oppimateriaalien järjestys ja virtaus

#### Changed
- **Documentation Format**: Standardoitu kaikki dokumentaatiot yhtenäisellä oppimiskeskeisellä rakenteella
- **Navigation Flow**: Toteutettu looginen etenemisjärjestys kaikkien oppimateriaalien läpi
- **Content Presentation**: Poistettu koriste-elementtejä selkeämmän, ammattimaisemman muotoilun hyväksi
- **Link Structure**: Päivitetty kaikki sisäiset linkit tukemaan uutta navigaatiojärjestelmää

#### Improved
- **Accessibility**: Poistettu emojeihin perustuvat elementit parantaen ruudunlukuohjelmien yhteensopivuutta
- **Professional Appearance**: Siisti, akateeminen tyyli sopiva yrityskäyttöön
- **Learning Experience**: Rakenne, jossa jokaisella oppitunnilla selkeät tavoitteet ja tulokset
- **Content Organization**: Parempi looginen yhteys ja virtaus aiheiden välillä

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Täydellinen getting-started -opassarja
  - Kattava käyttöönotto- ja provisiointidokumentaatio
  - Yksityiskohtaiset vianetsintäresurssit ja debug-oppaat
  - Ennen käyttöönottoa tehtävät validointityökalut ja -menettelyt

- **Getting Started Module**
  - AZD Basics: Peruskäsitteet ja terminologia
  - Installation Guide: Alustakohtaiset asennusohjeet
  - Configuration Guide: Ympäristön asetukset ja todennus
  - First Project Tutorial: Askel askeleelta -käytännön opetus

- **Deployment and Provisioning Module**
  - Deployment Guide: Täydellinen työnkulkuohjeistus
  - Provisioning Guide: Infrastructure as Code Bicepillä
  - Parhaat käytännöt tuotantokäyttöönottoihin
  - Monipalveluarkkitehtuurin mallit

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure-resurssien saatavuuden varmistus
  - SKU Selection: Palvelutason laajuusopas
  - Pre-flight Checks: Automatisoidut ennakkotarkastusskriptit (PowerShell ja Bash)
  - Kustannusarviointi- ja budjetointityökalut

- **Troubleshooting Module**
  - Common Issues: Usein esiintyvät ongelmat ja ratkaisut
  - Debugging Guide: Systemaattiset vianetsintämenetelmät
  - Edistyneet diagnostiikkatekniikat ja työkalut
  - Suorituskyvyn seuranta ja optimointi

- **Resources and References**
  - Command Cheat Sheet: Pikaviite keskeisistä komennoista
  - Glossary: Kattava termien ja lyhenteiden sanasto
  - FAQ: Yksityiskohtaiset vastaukset yleisiin kysymyksiin
  - Ulkoiset resurssilinkit ja yhteisöyhteydet

- **Examples and Templates**
  - Yksinkertainen web-sovellus -esimerkki
  - Staattisen sivuston käyttöönotto-malli
  - Konttisovelluskonfiguraatio
  - Tietokantaintegraatiomallit
  - Mikropalveluarkkitehtuurin esimerkit
  - Serverless-funktioiden toteutukset

#### Features
- **Multi-Platform Support**: Asennus- ja konfigurointiohjeet Windowsille, macOS:lle ja Linuxille
- **Multiple Skill Levels**: Sisältöä opiskelijoista ammattilaiskehittäjiin
- **Practical Focus**: Käytännön esimerkit ja reaalimaailman skenaariot
- **Comprehensive Coverage**: Peruskonsepteista edistyneisiin yritysmalleihin
- **Security-First Approach**: Turvallisuuden parhaat käytännöt integroituina läpi
- **Cost Optimization**: Ohjeistus kustannustehokkaaseen käyttöönottoon ja resurssien hallintaan

#### Documentation Quality
- **Detailed Code Examples**: Käytännönläheiset ja testatut koodiesimerkit
- **Step-by-Step Instructions**: Selkeät, toiminnalliset ohjeet
- **Comprehensive Error Handling**: Vianetsintä yleisimpiin ongelmiin
- **Best Practices Integration**: Alan standardit ja suositukset
- **Version Compatibility**: Ajantasainen uusimpiin Azure-palveluihin ja azd-ominaisuuksiin

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Integraatiomallit Hugging Face:n, Azure Machine Learningin ja räätälöityjen mallien kanssa
- **AI Agent Frameworks**: Mallipohjat LangChain-, Semantic Kernel- ja AutoGen-käyttöönottoihin
- **Advanced RAG Patterns**: Vektoritietokantavaihtoehdot Azure AI Searchin ulkopuolelle (Pinecone, Weaviate, jne.)
- **AI Observability**: Laajennettu valvonta mallien suorituskyvylle, token-käytölle ja vastausten laadulle

#### Developer Experience
- **VS Code Extension**: Integroitu AZD + Microsoft Foundry -kehityskokemus
- **GitHub Copilot Integration**: AI-avusteinen AZD-mallien generointi
- **Interactive Tutorials**: Käytännön koodausharjoituksia automaattisella validoinnilla AI-skenaarioille
- **Video Content**: Täydennyksinä oleva videomateriaali visuaalisille oppijoille AI-käyttöönottoihin keskittyen

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: AI-mallien hallinta, vaatimustenmukaisuus ja auditoinnin jäljitys
- **Multi-Tenant AI**: Mallit useiden asiakkaiden palvelemiseen eristetyillä AI-palveluilla
- **Edge AI Deployment**: Integraatio Azure IoT Edgeen ja kontti-instanseihin
- **Hybrid Cloud AI**: Monipilvi- ja hybridikäyttöönoton mallit AI-kuormille

#### Advanced Features
- **AI Pipeline Automation**: MLOps-integraatio Azure Machine Learning -putkien kanssa
- **Advanced Security**: Zero-trust -mallit, private endpoints ja edistynyt uhkien torjunta
- **Performance Optimization**: Edistynyt viritys- ja skaalausstrategiat korkean läpimenon AI-sovelluksille
- **Global Distribution**: Sisällön jakelu ja reunavälimuisti AI-sovelluksille

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Kattava Microsoft Foundry -integraatio (Valmis)
- ✅ **Interactive Tutorials**: Käytännön AI-työpajalab (Valmis)
- ✅ **Advanced Security Module**: AI-spesifiset turvallisuusmallit (Valmis)
- ✅ **Performance Optimization**: AI-kuormien viritysstrategiat (Valmis)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: AI-käyttöönottojen esimerkit (Valmis)
- ✅ **Extended FAQ**: AI-spesifiset kysymykset ja vianetsintä (Valmis)
- **Tool Integration**: Parannetut IDE- ja editori-integraatio-oppaat
- ✅ **Monitoring Expansion**: AI-spesifinen valvonta ja hälytys (Valmis)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsiivinen muotoilu mobiilioppimiseen
- **Offline Access**: Latauskelpoiset dokumentaatiopakettijulkaisut
- **Enhanced IDE Integration**: VS Code -laajennus AZD + AI -työnkuluille
- **Community Dashboard**: Reaaliaikainen yhteisömittaristo ja kontribuutioseuranta

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- Uudet ominaisuudet, dokumentaatiokohdat tai kyvykkyydet
- Uudet esimerkit, mallit tai oppimateriaalit
- Lisätyt työkalut, skriptit tai utiliteetit

#### Changed
- Muutokset olemassa olevaan toiminnallisuuteen tai dokumentaatioon
- Päivitykset selkeyden tai tarkkuuden parantamiseksi
- Sisällön tai organisaation uudelleenjärjestelyt

#### Deprecated
- Ominaisuudet tai lähestymistavat, jotka poistuvat käytöstä
- Dokumentaatio-osiot, jotka on aikataulutettu poistettaviksi
- Menetelmät, joille on parempia vaihtoehtoja

#### Removed
- Ominaisuudet, dokumentaatio tai esimerkit, jotka eivät ole enää relevantteja
- Vanhentunut tieto tai käytöstä poistetut lähestymistavat
- Redundantti tai yhdistetty sisältö

#### Fixed
- Korjaukset dokumentaatiossa tai koodissa oleviin virheisiin
- Raportoitujen ongelmien tai bugien ratkaisut
- Tarkkuuden tai toiminnallisuuden parannukset

#### Security
- Tietoturvaan liittyvät parannukset tai korjaukset
- Päivitykset turvallisuuden parhaisiin käytäntöihin
- Haavoittuvuuksien korjaukset

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Muutokset, jotka rikkovat yhteensopivuuden ja vaativat käyttäjän toimenpiteitä
- Merkittävät organisaatio- tai sisällön uudelleenjärjestelyt
- Muutokset, jotka muuttavat peruslähestymistapaa tai metodologiaa

#### Minor Version (X.Y.0)
- Uudet ominaisuudet tai sisällön lisäykset
- Parannukset, jotka säilyttävät taaksepäin yhteensopivuuden
- Lisäesimerkit, työkalut tai resurssit

#### Patch Version (X.Y.Z)
- Bugikorjaukset ja korjaukset
- Pienet parannukset olemassa olevaan sisältöön
- Selvennykset ja pienet täsmennykset

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Corrections to AI service integration and deployment information
- **Learning Experience**: Suggestions for improved AI developer learning flow
- **Missing AI Content**: Requests for additional AI templates, patterns, or examples
- **Accessibility**: Improvements for diverse learning needs
- **AI Tool Integration**: Suggestions for better AI development workflow integration
- **Production AI Patterns**: Enterprise AI deployment pattern requests

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with expedited response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Current Version Support
- **Uusin pääversio**: Täysi tuki ja säännölliset päivitykset
- **Edellinen pääversio**: Turvapäivitykset ja kriittiset korjaukset 12 kuukauden ajan
- **Vanhemmat versiot**: Vain yhteisön tuki, ei virallisia päivityksiä

### Siirtymäohjeet
Kun pääversiot julkaistaan, tarjoamme:
- **Siirtymäoppaat**: Vaiheittaiset siirtymäohjeet
- **Yhteensopivuustiedot**: Tarkemmat tiedot muutoksista, jotka rikkovat yhteensopivuutta
- **Työkalutuki**: Skriptit ja apuohjelmat migraation avuksi
- **Yhteisön tuki**: Omistetut foorumit migraatiokysymyksille

---

**Navigointi**
- **Edellinen oppitunti**: [Opas](resources/study-guide.md)
- **Seuraava oppitunti**: Palaa kohtaan [Pää-README](README.md)

**Pysy ajan tasalla**: Seuraa tätä arkistoa saadaksesi ilmoituksia uusista julkaisuista ja tärkeistä päivityksistä oppimateriaaleihin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automatisoiduissa käännöksissä voi olla virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää auktoritatiivisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä johtuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->