# Muutokset - AZD For Beginners

## Johdanto

Tämä muutosloki dokumentoi kaikki merkittävät muutokset, päivitykset ja parannukset AZD For Beginners -repositoriolle. Noudatamme semanttisen versionhallinnan periaatteita ja ylläpidämme tätä lokia auttaaksemme käyttäjiä ymmärtämään, mitä versioiden välillä on muuttunut.

## Oppimistavoitteet

Tarkastelemalla tätä muutoslokia, pystyt:
- Pysymään ajan tasalla uusista ominaisuuksista ja sisällön lisäyksistä
- Ymmärtämään olemassa olevan dokumentaation parannuksia
- Seuraamaan korjauksia ja virheiden korjaustoimia tarkkuuden varmistamiseksi
- Seuraamaan oppimateriaalien kehitystä ajan myötä

## Oppimistulokset

Muutosloki-merkintöjen tarkastelun jälkeen pystyt:
- Tunnistamaan uuden sisällön ja oppimiseen saatavilla olevat resurssit
- Ymmärtämään, mitä osioita on päivitetty tai parannettu
- Suunnittelemaan oppimispolkusi ajantasaisen materiaalin perusteella
- Antamaan palautetta ja ehdotuksia tulevia parannuksia varten

## Versiohistoria

### [v3.17.0] - 2026-02-05

#### Kurssin navigoinnin parannus
**Tässä versiossa parannetaan README.md:n lukujen navigointia parannetulla taulukkomuodolla.**

#### Muutokset
- **Kurssikarttataulukko**: Parannettu suoriin oppitunti-linkkeihin, kestoarvioihin ja vaikeustason arvioihin
- **Kansioiden siivous**: Poistettu ylimääräiset vanhat kansiot (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkkien validointi**: Kaikki 21+ sisäistä linkkiä Kurssikartan taulukossa tarkistettu

### [v3.16.0] - 2026-02-05

#### Tuotenimen päivitykset
**Tässä versiossa päivitetään tuotereferenssit vastaamaan nykyistä Microsoftin brändäystä.**

#### Muutokset
- **Azure AI Foundry → Microsoft Foundry**: Kaikki viittaukset päivitetty ei-käännöstiedostoissa
- **Azure AI Agent Service → Foundry Agents**: Palvelun nimi päivitetty vastaamaan nykyistä brändäystä

#### Päivitetyt tiedostot
- `README.md` - Pääkurssin aloitussivu
- `changelog.md` - Versiohistoria
- `course-outline.md` - Kurssin rakenne
- `docs/chapter-02-ai-development/agents.md` - AI-agenttien opas
- `examples/README.md` - Esimerkkien dokumentaatio
- `workshop/README.md` - Työpajan aloitussivu
- `workshop/docs/index.md` - Työpajan indeksi
- `workshop/docs/instructions/*.md` - Kaikki työpajan ohjetiedostot

---

### [v3.15.0] - 2026-02-05

#### Merkittävä repositorion uudelleenjärjestely: Lukuperusteiset kansiot
**Tässä versiossa dokumentaatio järjestellään uudelleen omiin luku-kansioihinsa selkeämmän navigoinnin vuoksi.**

#### Kansioiden uudelleennimeäminen
Vanhat kansiot on korvattu luku-numeroiduilla kansioilla:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Tiedostojen siirrot
| Tiedosto | Lähde | Kohde |
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
- **📚 Luku-README-tiedostot**: Luotu README.md jokaisen luku-kansion sisälle, sisältäen:
  - Learning objectives and duration
  - Lesson table with descriptions
  - Quick start commands
  - Navigation to other chapters

#### Muutokset
- **🔗 Päivitetty kaikki sisäiset linkit**: 78+ polkua päivitetty kaikkien dokumentaatiotiedostojen läpi
- **🗺️ Pää-README.md**: Päivitetty Kurssikartta uuteen luku-rakenteeseen
- **📝 examples/README.md**: Päivitetty ristiviittaukset luku-kansioihin

#### Poistettu
- Vanha kansiorakenne (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repositorion uudelleenjärjestely: Lukujen navigointi
**Tässä versiossa lisättiin luku-navigoinnin README-tiedostot (korvattu versiossa v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Uusi AI-agenttien opas
**Tässä versiossa lisätään kattava opas AI-agenttien käyttöönottoon Azure Developer CLI:llä.**

#### Lisätty
- **🤖 docs/microsoft-foundry/agents.md**: Täydellinen opas, joka käsittelee:
  - Mitä AI-agentit ovat ja miten ne poikkeavat chatboteista
  - Kolme pika-aloitusagenttipohjaa (Foundry Agents, Prompty, RAG)
  - Agentin arkkitehtuurimallit (yksittäinen agentti, RAG, monen agentin)
  - Työkalun konfigurointi ja räätälöinti
  - Valvonta ja mittarien seuranta
  - Kustannuksiin liittyvät näkökohdat ja optimointi
  - Yleiset vianmääritystilanteet
  - Kolme käytännön harjoitusta onnistumiskriteereineen

#### Sisällön rakenne
- **Johdanto**: Agenttikäsitteet aloittelijoille
- **Pika-aloitus**: Ota agentit käyttöön komennolla `azd init --template get-started-with-ai-agents`
- **Arkkitehtuurimallit**: Visuaaliset kaaviot agenttimalleista
- **Konfigurointi**: Työkalun asennus ja ympäristömuuttujat
- **Valvonta**: Application Insights -integraatio
- **Harjoitukset**: Asteittainen käytännön oppiminen (20-45 minuuttia kukin)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-ympäristön päivitys
**Tässä versiossa päivitetään kehityskontin kokoonpanoa moderneilla työkaluilla ja paremmilla oletuksilla AZD-opiskelukokemusta varten.**

#### Muutokset
- **🐳 Peruskuva**: Päivitetty `python:3.12-bullseye` → `python:3.12-bookworm` (uusin Debian stable)
- **📛 Kontin nimi**: Nimetty uudelleen "Python 3" -> "AZD for Beginners" selkeyden vuoksi

#### Lisätty
- **🔧 Uudet Dev Container -ominaisuudet**:
  - `azure-cli` Bicep-tuen kanssa
  - `node:20` (LTS-versio AZD-malleille)
  - `github-cli` mallien hallintaan
  - `docker-in-docker` säilösovellusten käyttöönottoa varten

- **🔌 Porttien edelleenlähetys**: Esikonfiguroidut portit yleiseen kehitykseen:
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
  - `yzhang.markdown-all-in-one` - Markdownin muokkaus
  - `DavidAnson.vscode-markdownlint` - Markdown-linttaus
  - `bierner.markdown-mermaid` - Mermaid-kaavioiden tuki
  - `redhat.vscode-yaml` - YAML-tuki (azure.yaml:lle)
  - `eamodio.gitlens` - Gitin visualisointi
  - `mhutchie.git-graph` - Git-historia

- **⚙️ VS Code -asetukset**: Lisätty oletusasetukset Python-tulkille, tallennettaessa muotoilu ja välilyöntien trimmaus

- **📦 Päivitetty requirements-dev.txt**:
  - Lisätty MkDocs minify -lisäosa
  - Lisätty pre-commit koodin laadun varmistukseen
  - Lisätty Azure SDK -paketteja (azure-identity, azure-mgmt-resource)

#### Korjattu
- **Post-Create -komento**: Varmistaa nyt AZD:n ja Azure CLI:n asennuksen kontin käynnistyksessä

---

### [v3.11.0] - 2026-02-05

#### Aloittelijaystävällisen README-tiedoston uudistus
**Tässä versiossa README.md parannetaan merkittävästi aloittelijoille helpommaksi ja lisätään olennaisia resursseja AI-kehittäjille.**

#### Lisätty
- **🆚 Azure CLI vs AZD -vertailu**: Selkeä selitys siitä, milloin käyttää kumpaakin työkalua käytännön esimerkkien kanssa
- **🌟 Mahtavat AZD-linkit**: Suorat linkit yhteisön malligalleriaan ja kontribuutiolähteisiin:
  - [Awesome AZD-galleria](https://azure.github.io/awesome-azd/) - yli 200 valmista käyttöönotettavaa mallia
  - [Lähetä malli](https://github.com/Azure/awesome-azd/issues) - Yhteisön kontribuutio
- **🎯 Pika-aloitusopas**: Yksinkertaistettu 3-vaiheinen aloitusosio (Asenna → Kirjaudu sisään → Ota käyttöön)
- **📊 Kokemukseen perustuva navigaatiotaulukko**: Selkeä opastus siitä, mistä aloittaa kehittäjän kokemustason perusteella

#### Muutokset
- **README-rakenne**: Järjestetty uudelleen progressiiviseen paljastukseen - tärkeimmät tiedot ensin
- **Johdanto-osio**: Uudistettu selittämään "The Magic of `azd up`" täydellisille aloittelijoille
- **Poistettu päällekkäinen sisältö**: Poistettu päällekkäinen vianmääritykseen liittyvä osio
- **Vianmäärityskomennot**: Korjattu `azd logs`-viittaus käyttämään validia `azd monitor --logs`-komentoa

#### Korjattu
- **🔐 Autentikointikomennot**: Lisätty `azd auth login` ja `azd auth logout` cheat-sheet.md:ään
- **Virheelliset komentoviittaukset**: Poistettu jäljellä olleet `azd logs`-viittaukset README:n vianmääritysosiosta

#### Huomautuksia
- **Laajuus**: Muutokset sovellettu pää-README.md:ään ja resources/cheat-sheet.md:ään
- **Kohdeyleisö**: Parannukset kohdistettu erityisesti AZD:hen tutustuville kehittäjille

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI -komentojen tarkkuuspäivitys
**Tässä versiossa korjataan dokumentaation läpi esiintyviä olemattomia AZD-komentoja, jotta kaikki koodiesimerkit käyttävät kelvollista Azure Developer CLI -syntaksia.**

#### Korjattu
- **🔧 Olemattomat AZD-komennot poistettu**: Laaja auditointi ja virheellisten komentojen korjaus:
  - `azd logs` (ei ole olemassa) → korvattu komennolla `azd monitor --logs` tai Azure CLI -vaihtoehdoilla
  - `azd service`-alikomennot (eivät ole olemassa) → korvattu `azd show`- ja Azure CLI -komennoilla
  - `azd infra import/export/validate` (eivät ole olemassa) → poistettu tai korvattu kelvollisilla vaihtoehdoilla
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` liput (eivät ole olemassa) → poistettu
  - `azd provision --what-if/--rollback` liput (eivät ole olemassa) → päivitetty käyttämään `--preview`
  - `azd config validate` (ei ole olemassa) → korvattu `azd config list`-komennolla
  - `azd info`, `azd history`, `azd metrics` (eivät ole olemassa) → poistettu

- **📚 Tiedostot päivitetty komentokorjauksilla**:
  - `resources/cheat-sheet.md`: Suuri uudistus komentoviitteeseen
  - `docs/deployment/deployment-guide.md`: Korjattu rollback- ja käyttöönotto-strategioita
  - `docs/troubleshooting/debugging.md`: Korjattu lokianalyysi-osioita
  - `docs/troubleshooting/common-issues.md`: Päivitetty vianmäärityskomennot
  - `docs/troubleshooting/ai-troubleshooting.md`: Korjattu AZD-debuggausosio
  - `docs/getting-started/azd-basics.md`: Korjattu valvontakomennot
  - `docs/getting-started/first-project.md`: Päivitetty valvonta- ja debug-esimerkit
  - `docs/getting-started/installation.md`: Korjattu help- ja versioviittaukset
  - `docs/pre-deployment/application-insights.md`: Korjattu lokien katseluohjeita
  - `docs/pre-deployment/coordination-patterns.md`: Korjattu agenttien debuggauskomennot

- **📝 Versioviittaus päivitetty**:
  - `docs/getting-started/installation.md`: Vaihdettu kovakoodattu `1.5.0` generiseen `1.x.x`-viittaukseen ja lisätty linkki julkaisuihin

#### Muutokset
- **Rollback-strategiat**: Päivitetty dokumentaatio käyttämään Git-pohjaista rollbackia (AZD:llä ei ole natiivista rollback-toimintoa)
- **Lokien katselu**: Korvattu `azd logs` -viittaukset komentoilla `azd monitor --logs`, `azd monitor --live` ja Azure CLI -komennoilla
- **Suorituskykyo-osa**: Poistettu olemattomat parallel/incremental -deploy-liput ja annettu kelvollisia vaihtoehtoja

#### Teknisiä yksityiskohtia
- **Kelvolliset AZD-komennot**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Kelvolliset azd monitor -liput**: `--live`, `--logs`, `--overview`
- **Poistetut ominaisuudet**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Huomautuksia
- **Varmistus**: Komennot validoitu Azure Developer CLI v1.23.x:llä

---

### [v3.9.0] - 2026-02-05

#### Työpajan valmistuminen ja dokumentaation laadun päivitys
**Tämä versio täydentää interaktiiviset työpajamoduulit, korjaa kaikki rikkinäiset dokumentaatiolinkit ja parantaa yleistä sisältölaatua tekoälykehittäjille, jotka käyttävät Microsoft AZD:tä.**

#### Lisätty
- **📝 CONTRIBUTING.md**: Uusi kontribuutioprotokolladokumentti, joka sisältää:
  - Selkeät ohjeet ongelmien ilmoittamiseen ja muutosehdotuksiin
  - Dokumentaatiostandardit uudelle sisällölle
  - Koodiesimerkkiohjeet ja commit-viestikonventiot
  - Tietoa yhteisön osallistumisesta

#### Valmistunut
- **🎯 Työpajamoduuli 7 (Yhteenveto)**: Täysin valmis yhteenvetomoduuli, joka sisältää:
  - Kattavan yhteenvedon työpajan saavutuksista
  - Avainkäsitteet -osio, joka kattaa AZD:n, templatet ja AI Foundryn
  - Suositukset oppimispolun jatkamiseksi
  - Työpajan haasteharjoituksia vaikeustasoilla
  - Yhteisön palaute- ja tukilinkkejä

- **📚 Työpajamoduuli 3 (Purku)**: Päivitetyt oppimistavoitteet, jotka sisältävät:
  - GitHub Copilotin aktivointiohjeet MCP-palvelimilla
  - AZD-templaten kansiorakenteen ymmärtäminen
  - Infrastructure-as-code (Bicep) -järjestelymallit
  - Käytännön lab-ohjeet

- **🔧 Työpajamoduuli 6 (Tpurku)**: Valmistunut sisältäen:
  - Resurssien siivous- ja kustannustenhallintatavoitteet
  - `azd down` -käyttö turvalliseen infrastruktuurin poistamiseen
  - Ohjeistus pehmeästi poistettujen kognitiivisten palveluiden palauttamiseen
  - Bonus-tutkimusaiheita GitHub Copilotille ja Azure Portalille

#### Korjattu
- **🔗 Rikkoutuneiden linkkien korjaukset**: Korjattiin yli 15 rikkinäistä sisäistä dokumentaatiolinkkiä:
  - `docs/ai-foundry/ai-model-deployment.md`: Korjattu polut microsoft-foundry-integration.md:hen
  - `docs/troubleshooting/ai-troubleshooting.md`: Korjattu ai-model-deployment.md ja production-ai-practices.md polut
  - `docs/getting-started/first-project.md`: Korvattu puuttuva cicd-integration.md deployment-guide.md:llä
  - `examples/retail-scenario.md`: Korjattu UKK- ja vianmääritysohjeiden polut
  - `examples/container-app/microservices/README.md`: Korjattu kurssin kotisivu- ja deployment-opas-polut
  - `resources/faq.md` ja `resources/glossary.md`: Päivitetyt AI-lukujen viittaukset
  - `course-outline.md`: Korjattu ohjaajan opas- ja AI-työpajalab-viittaukset

- **📅 Työpajan tilabanneri**: Päivitetty "Under Construction" -tilasta aktiiviseksi työpajaksi, päivämääränä helmikuu 2026

- **🔗 Työpajan navigointi**: Korjattu rikkinäiset navigointilinkit työpajan README.md:ssä, jotka osoittivat olemattomaan lab-1-azd-basics -kansioon

#### Muutettu
- **Työpajan esitys**: Poistettu "under construction" -varoitus, työpaja on nyt valmis ja käyttövalmis
- **Navigoinnin yhdenmukaisuus**: Varmistettu, että kaikilla työpajamoduuleilla on asianmukainen moduulien välinen navigointi
- **Oppimispolun viittaukset**: Päivitetty lukujen poikkiviittaukset käyttämään oikeita microsoft-foundry-polkuja

#### Varmennettu
- ✅ Kaikilla englanninkielisillä markdown-tiedostoilla on kelvolliset sisäiset linkit
- ✅ Työpajamoduulit 0–7 ovat valmiita oppimistavoitteineen
- ✅ Luku- ja moduulinavigointi toimii oikein
- ✅ Sisältö on sopivaa tekoälykehittäjille, jotka käyttävät Microsoft AZD:tä
- ✅ Kielenkäyttö ja rakenne on aloittelijaystävällinen läpi dokumentaation
- ✅ CONTRIBUTING.md tarjoaa selkeät ohjeet yhteisön kontribuuttoreille

#### Tekninen toteutus
- **Linkin validointi**: Automaattinen PowerShell-skripti tarkisti kaikki .md-tiedostojen sisäiset linkit
- **Sisältöauditointi**: Manuaalinen tarkastus työpajan täydellisyyden ja aloittelijaystävällisyyden varmistamiseksi
- **Navigointijärjestelmä**: Yhtenäiset luku- ja moduulinavigointimallit otettiin käyttöön

#### Huomautuksia
- **Soveltamisala**: Muutokset on tehty vain englanninkieliseen dokumentaatioon
- **Käännökset**: Käännöskansiot eivät päivittyneet tässä versiossa (automaattinen käännös synkronoidaan myöhemmin)
- **Työpajan kesto**: Täydellinen työpaja tarjoaa nyt 3–4 tuntia käytännön oppimista

---

### [v3.8.0] - 2025-11-19

#### Edistynyt dokumentaatio: monitorointi, turvallisuus ja moni-agenttipatternit
**Tämä versio lisää kattavat A-tason oppitunnit Application Insights -integraatiosta, autentikointimalleista ja moni-agentin koordinoinnista tuotantokäyttöön.**

#### Lisätty
- **📊 Application Insights -integraation oppitunti**: tiedostoon `docs/pre-deployment/application-insights.md`:
  - AZD-keskeinen käyttöönotto automaattisella provisioinnilla
  - Täydelliset Bicep-templatet Application Insightsille + Log Analyticsille
  - Toimivat Python-sovellukset mukautetulla telemetrialla (yli 1 200 riviä)
  - AI/LLM-monitorointimallit (Azure OpenAI -tokenien/kustannusten seuranta)
  - 6 Mermaid-kaaviota (arkkitehtuuri, hajautettu jäljitys, telemetriavirta)
  - 3 käytännön harjoitusta (hälytykset, dashboardit, AI-monitorointi)
  - Kusto-kyselyesimerkkejä ja kustannusoptimointistrategioita
  - Live-mittarivirtaus ja reaaliaikainen vianetsintä
  - 40–50 minuutin oppimisaika tuotantovalmiilla malleilla

- **🔐 Autentikointi- ja turvallisuusmallit -oppitunti**: tiedostoon `docs/getting-started/authsecurity.md`:
  - 3 autentikointimallia (yhteysmerkkijonot, Key Vault, hallittu identiteetti)
  - Täydelliset Bicep-infrastruktuuritemplat turvallisille käyttöönottoille
  - Node.js-sovelluskoodi Azure SDK -integraatiolla
  - 3 täydellistä harjoitusta (hallittu identiteetti, käyttäjän määrittämä identiteetti, Key Vaultin kierto)
  - Turvallisuuden parhaat käytännöt ja RBAC-määritykset
  - Vianmääritysohje ja kustannusanalyysi
  - Tuotantovalmiit salasanattomat autentikointimallit

- **🤖 Moni-agentin koordinointimallit -oppitunti**: tiedostoon `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinointimallia (sekventiaalinen, rinnakkainen, hierarkkinen, tapahtumapohjainen, konsensus)
  - Täydellinen orkestrointipalvelun toteutus (Python/Flask, yli 1 500 riviä)
  - 3 erikoistettua agenttitoteutusta (Research, Writer, Editor)
  - Service Bus -integraatio viestijonotukseen
  - Cosmos DB tilanhallinta hajautetuissa järjestelmissä
  - 6 Mermaid-kaaviota, jotka näyttävät agenttien vuorovaikutukset
  - 3 edistynyttä harjoitusta (aikarajankäsittely, uudelleenyrittomekanismi, circuit breaker)
  - Kustannuserittely (240–565 $/kk) optimointistrategioineen
  - Application Insights -integraatio monitorointia varten

#### Laajennettu
- **Pre-deployment-luku**: Sisältää nyt kattavan monitoroinnin ja koordinointimallit
- **Getting Started -luku**: Laajennettu ammattimaisilla autentikointimalleilla
- **Tuotantovalmius**: Täysi kattavuus turvallisuudesta observabilityyn
- **Kurssin rakenne**: Päivitetty viittaamaan uusiin oppitunteihin lukuihin 3 ja 6

#### Muutettu
- **Oppimisen eteneminen**: Turvallisuuden ja monitoroinnin parempi integrointi koko kurssin ajan
- **Dokumentaation laatu**: Johdonmukaiset A-tason standardit (95–97 %) uusissa oppitunneissa
- **Tuotantomallit**: Täydellinen end-to-end -kattavuus yritystason käyttöönottoihin

#### Parannettu
- **Kehittäjäkokemus**: Selkeä polku kehityksestä tuotantovalvontaan
- **Turvallisuusstandardit**: Ammattimaiset mallit autentikointiin ja salaisuuksien hallintaan
- **Observability**: Täysi Application Insights -integraatio AZD:n kanssa
- **AI-kuormat**: Erikoistunut monitorointi Azure OpenAI:lle ja moni-agenttijärjestelmille

#### Varmennettu
- ✅ Kaikilla oppitunneilla on täydelliset toimivat koodit (ei pelkkiä pätkiä)
- ✅ Mermaid-kaaviot visuaaliseen oppimiseen (yhteensä 19 kolmella oppitunnilla)
- ✅ Käytännön harjoitukset vahvistusvaiheineen (yhteensä 9)
- ✅ Tuotantovalmiit Bicep-templatet, jotka voi ottaa käyttöön `azd up` -komennolla
- ✅ Kustannusanalyysi ja optimointistrategiat
- ✅ Vianmääritysohjeet ja parhaat käytännöt
- ✅ Tietotarkastuskohtia vahvistuskomentteineen

#### Dokumentaation arviointitulokset
- **docs/pre-deployment/application-insights.md**: - Kattava monitorointiohje
- **docs/getting-started/authsecurity.md**: - Ammattimaiset turvallisuusmallit
- **docs/pre-deployment/coordination-patterns.md**: - Edistyneet moni-agenttiarkkitehtuurit
- **Kaikki uudet sisällöt**: - Johdonmukaisesti korkeatasoiset standardit

#### Tekninen toteutus
- **Application Insights**: Log Analytics + mukautettu telemetria + hajautettu jäljitys
- **Autentikointi**: Hallittu identiteetti + Key Vault + RBAC-mallit
- **Moni-agentti**: Service Bus + Cosmos DB + Container Apps + orkestrointi
- **Monitorointi**: Live-mittarit + Kusto-kyselyt + hälytykset + dashboardit
- **Kustannusten hallinta**: Näytteenottostrategiat, säilytysasetukset, budjettikontrollit

### [v3.7.0] - 2025-11-19

#### Dokumentaation laatupäivitykset ja uusi Azure OpenAI -esimerkki
**Tämä versio parantaa dokumentaation laatua koko repositoriossa ja lisää täydellisen Azure OpenAI -käyttöönottoesimerkin GPT-4-keskustelukäyttöliittymällä.**

#### Lisätty
- **🤖 Azure OpenAI -keskusteluesimerkki**: Täydellinen GPT-4-käyttöönotto toimivalla toteutuksella kansiossa `examples/azure-openai-chat/`:
  - Täydellinen Azure OpenAI -infrastruktuuri (GPT-4-mallin käyttöönotto)
  - Python-komentorivikeskusteluliittymä keskusteluhistorialla
  - Key Vault -integraatio API-avainten turvalliseen säilytykseen
  - Tokenien käytön seuranta ja kustannusarviointi
  - Nopeudenrajaus ja virheenkäsittely
  - Kattava README, 35–45 minuutin käyttöönotto-opas
  - 11 tuotantovalmista tiedostoa (Bicep-templatet, Python-sovellus, konfiguraatio)
- **📚 Dokumentaation harjoitukset**: Lisätty käytännön harjoituksia konfiguraatio-oppaaseen:
  - Harjoitus 1: Moni-ympäristökonfiguraatio (15 minuuttia)
  - Harjoitus 2: Salaisuuksien hallinnan harjoitus (10 minuuttia)
  - Selkeät onnistumiskriteerit ja vahvistusvaiheet
- **✅ Käyttöönoton varmennus**: Lisätty varmennusosio käyttöönotto-oppaaseen:
  - Terveyden tarkistusmenettelyt
  - Onnistumiskriteerien tarkistuslista
  - Odotetut tulosteet kaikille käyttöönotto komennoille
  - Pikaviankorjauslista

#### Laajennettu
- **examples/README.md**: Päivitetty A-tason laatuun (93 %):
  - Lisätty azure-openai-chat kaikkiin asiaankuuluviin osioihin
  - Paikallisten esimerkkien määrä päivitetty 3 -> 4
  - Lisätty AI-sovellus-esimerkkitaulukkoon
  - Integroidu Intermediate User Quick Startiin
  - Lisätty Microsoft Foundry Templates -osioon
  - Päivitetty vertailumatriisi ja teknologiaosiot
- **Dokumentaation laatu**: Parantunut B+ (87 %) → A- (92 %) koko docs-kansiossa:
  - Lisätty odotetut tulosteet kriittisiin komentoesimerkkeihin
  - Sisällytetty vahvistusvaiheet konfiguraatiomuutoksiin
  - Lisää käytännön harjoittelua selkeillä tuloksilla

#### Muutettu
- **Oppimisen eteneminen**: Parempi AI-esimerkkien integrointi keskitasoisille oppijoille
- **Dokumentaation rakenne**: Toiminnallisempia harjoituksia selkeillä lopputuloksilla
- **Varmennusprosessi**: Eksplisiittiset onnistumiskriteerit lisätty keskeisiin työnkulkuihin

#### Parannettu
- **Kehittäjäkokemus**: Azure OpenAI -käyttöönotto kestää nyt 35–45 minuuttia (aiemmin 60–90 minuuttia monimutkaisemmissa vaihtoehdoissa)
- **Kustannusten läpinäkyvyys**: Selkeät kustannusarviot (50–200 $/kk) Azure OpenAI -esimerkille
- **Oppimispolku**: AI-kehittäjille selkeä aloituspiste azure-openai-chatilla
- **Dokumentaatiostandardit**: Johdonmukaiset odotetut tulosteet ja vahvistusvaiheet

#### Varmennettu
- ✅ Azure OpenAI -esimerkki toimii täysin `azd up` -komennolla
- ✅ Kaikki 11 toteutustiedostoa syntaksiltaan oikein
- ✅ README-ohjeet vastaavat todellista käyttöönottoa
- ✅ Dokumentaatiolinkit päivitetty yli 8 eri paikkaan
- ✅ Esimerkkien indeksi heijastaa 4 paikallista esimerkkiä oikein
- ✅ Ei päällekkäisiä ulkoisia linkkejä taulukoissa
- ✅ Kaikki navigointiviittaukset oikeita

#### Tekninen toteutus
- **Azure OpenAI -arkkitehtuuri**: GPT-4 + Key Vault + Container Apps -malli
- **Turvallisuus**: Hallittu identiteetti valmis, salaisuudet Key Vaultissa
- **Monitorointi**: Application Insights -integraatio
- **Kustannusten hallinta**: Tokenien seuranta ja käytön optimointi
- **Käyttöönotto**: Yksi `azd up` -komento koko asetukselle

### [v3.6.0] - 2025-11-19

#### Suuri päivitys: Container App -käyttöönottoesimerkit
**Tämä versio esittelee kattavat, tuotantovalmiit konttisovellusten käyttöönottoesimerkit Azure Developer CLI:n (AZD) avulla, täydellisellä dokumentaatiolla ja integroinnilla oppimispolkuun.**

#### Lisätty
- **🚀 Container App -esimerkit**: Uudet paikalliset esimerkit kansioon `examples/container-app/`:
  - [Pääopas](examples/container-app/README.md): Täydellinen yleiskatsaus konttikäyttöönotoista, pika-aloituksesta, tuotantokäytöstä ja edistyneistä malleista
  - [Yksinkertainen Flask-API](../../examples/container-app/simple-flask-api): Aloittelijaystävällinen REST-API, jolla on scale-to-zero, health probe -tarkistukset, monitorointi ja vianmääritys
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices): Tuotantovalmiiksi hiottu monipalvelukäyttöönotto (API Gateway, Product, Order, User, Notification), asynkroninen viestitys, Service Bus, Cosmos DB, Azure SQL, hajautettu jäljitys, blue-green/canary-käyttöönotto
- **Parhaat käytännöt**: Turvallisuus, monitorointi, kustannusoptimointi ja CI/CD-ohjeet konttityökuormille
- **Koodiesimerkit**: Täydelliset `azure.yaml`, Bicep-templatet ja monikieliset palvelutoteutukset (Python, Node.js, C#, Go)
- **Testaus & vianmääritys**: End-to-end -testiskenaariot, monitorointikomennot, vianmääritysohjeet

#### Muutettu
- **README.md**: Päivitetty sisältämään ja linkittämään uudet container app -esimerkit osion "Local Examples - Container Applications" alle
- **examples/README.md**: Päivitetty korostamaan container app -esimerkkejä, lisätty vertailumatriisin rivit ja päivitetty teknologia-/arkkitehtuuriviittaukset
- **Kurssin rakenne ja opiskeluopas**: Päivitetty viittaamaan uusiin container app -esimerkkeihin ja käyttöönotto-malleihin asiaankuuluvissa luvuissa

#### Vahvistettu
- ✅ Kaikki uudet esimerkit voidaan ottaa käyttöön `azd up` -komennolla ja ne noudattavat parhaita käytäntöjä
- ✅ Dokumentaation ristiinlinkitykset ja navigaatio päivitetty
- ✅ Esimerkit kattavat aloittelijoista edistyneisiin skenaarioihin, mukaan lukien tuotannon mikropalvelut

#### Muistiinpanot
- **Laajuus**: Vain englanninkielinen dokumentaatio ja esimerkit
- **Seuraavat askeleet**: Laajenna lisätyillä edistyneillä container-malleilla ja CI/CD-automaatioilla tulevissa julkaisuissa

### [v3.5.0] - 2025-11-19

#### Tuotteen uudelleennimeäminen: Microsoft Foundry
**Tässä versiossa toteutetaan kattava tuotteen nimen muutos "Microsoft Foundry" → "Microsoft Foundry" kaikessa englanninkielisessä dokumentaatiossa, heijastaen Microsoftin virallista uudelleenbrändäystä.**

#### Muutettu
- **🔄 Tuotteen nimen päivitys**: Kattava uudelleennimeäminen "Microsoft Foundry" → "Microsoft Foundry"
  - Päivitetty kaikki viittaukset englanninkielisessä dokumentaatiossa kansiossa `docs/`
  - Nimetty kansio uudelleen: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Nimetty tiedosto uudelleen: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Yhteensä: 23 sisältoviittausta päivitetty seitsemässä dokumentaatiotiedostossa

- **📁 Kansion rakenteen muutokset**:
  - `docs/ai-foundry/` nimetty uudelleen `docs/microsoft-foundry/`
  - Kaikki ristiviittaukset päivitetty vastaamaan uutta kansiorakennetta
  - Navigointilinkit validoitu kaikessa dokumentaatiossa

- **📄 Tiedostojen uudelleennimeäminen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kaikki sisäiset linkit päivitetty viittaamaan uuteen tiedostonimeen

#### Päivitetyt tiedostot
- **Lukudokumentaatio** (7 tiedostoa):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigointilinkin päivitystä
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tuotteen nimen viittausta päivitetty
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Käytössä jo Microsoft Foundry (aiemmista päivityksistä)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 viitettä päivitetty (yleiskatsaus, yhteisön palaute, dokumentaatio)
  - `docs/getting-started/azd-basics.md` - 4 ristiviittauslinkkiä päivitetty
  - `docs/getting-started/first-project.md` - 2 luvunavigointilinkkiä päivitetty
  - `docs/getting-started/installation.md` - 2 seuraavan luvun linkkiä päivitetty
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 viitettä päivitetty (navigointi, Discord-yhteisö)
  - `docs/troubleshooting/common-issues.md` - 1 navigointilinkki päivitetty
  - `docs/troubleshooting/debugging.md` - 1 navigointilinkki päivitetty

- **Kurssin rakenteen tiedostot** (2 tiedostoa):
  - `README.md` - 17 viittausta päivitetty (kurssin yleiskatsaus, lukujen otsikot, malliosio, yhteisön näkemykset)
  - `course-outline.md` - 14 viittausta päivitetty (yleiskatsaus, oppimistavoitteet, lukujen resurssit)

#### Vahvistettu
- ✅ Ei jäljellä "ai-foundry" -kansiopolkuviittauksia englanninkielisissä dokumenteissa
- ✅ Ei jäljellä "Microsoft Foundry" -tuotteen nimen viittauksia englanninkielisissä dokumenteissa
- ✅ Kaikki navigointilinkit toimivat uuden kansiorakenteen kanssa
- ✅ Tiedostojen ja kansioiden uudelleennimeämiset suoritettu onnistuneesti
- ✅ Lukujen väliset ristiviittaukset validoitu

#### Huomautukset
- **Laajuus**: Muutokset sovellettu vain englanninkieliseen dokumentaatioon kansiossa `docs/`
- **Käännökset**: Käännöskansiot (`translations/`) eivät ole päivitetty tässä versiossa
- **Työpaja**: Työpajamateriaalit (`workshop/`) eivät ole päivitetty tässä versiossa
- **Esimerkit**: Esimerkkitiedostot saattavat edelleen viitata vanhentuneeseen nimeämiseen (käsitellään tulevassa päivityksessä)
- **Ulkoiset linkit**: Ulkoiset URL-osoitteet ja GitHub-repositorion viittaukset pysyvät muuttumattomina

#### Siirtymäopas kontribuuttoreille
Jos sinulla on paikallisia haaroja tai dokumentaatiota, jotka viittaavat vanhaan rakenteeseen:
1. Päivitä kansioviittaukset: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Päivitä tiedostoviittaukset: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Korvaa tuotteen nimi: "Microsoft Foundry" → "Microsoft Foundry"
4. Varmista, että kaikki sisäiset dokumentaatiolinkit toimivat edelleen

---

### [v3.4.0] - 2025-10-24

#### Infrastruktuurin esikatselu- ja validointiparannukset
**Tämä versio lisää kattavan tuen uudelle Azure Developer CLI -esikatseluominaisuudelle ja parantaa työpajan käyttäjäkokemusta.**

#### Lisätty
- **🧪 azd provision --preview -ominaisuuden dokumentaatio**: Kattava käsittely uudesta infrastruktuurin esikatseluominaisuudesta
  - Komentoviite ja käyttöesimerkit cheat sheetissä
  - Yksityiskohtainen integrointi provisiointioppaassa käyttötapauksineen ja hyötyineen
  - Ennalta tehtävän tarkistuksen integrointi turvallisempaa käyttöönoton validointia varten
  - Aloitusoppaan päivitykset turvallisuutta korostavilla käyttöönotto-käytännöillä
- **🚧 Työpajan tilabanneri**: Ammattimainen HTML-banneri, joka osoittaa työpajan kehitystilanteen
  - Liukuväripohjainen muotoilu rakennustilamerkinnöillä selkeää käyttäjäviestintää varten
  - Viimeisimmän päivityksen aikaleima läpinäkyvyyden vuoksi
  - Mobiiliresponsiivinen muotoilu kaikille laitteille

#### Parannettu
- **Infrastruktuurin turvallisuus**: Esikatseluominaisuus integroitu käyttöönotto-dokumentaatioon
- **Ennen käyttöönottoa tehtävä validointi**: Automaattiset skriptit sisältävät nyt infrastruktuurin esikatselutestauksen
- **Kehittäjän työnkulku**: Päivitetyt komentojonot sisältävät esikatselun parhaana käytäntönä
- **Työpajan kokemus**: Käyttäjille asetetut selkeät odotukset sisällön kehitystilanteesta

#### Muutettu
- **Käyttöönoton parhaat käytännöt**: Esikatselu-ensimmäinen työnkulku nyt suositeltu lähestymistapa
- **Dokumentaation kulku**: Infrastruktuurin validointi siirretty aiemmaksi oppimisprosessissa
- **Työpajan esitys**: Ammattimainen tilaviestintä selkeällä kehitysaikataululla

#### Parannettu
- **Turvallisuus edellä**: Infrastruktuurimuutokset voidaan nyt validoida ennen käyttöönottoa
- **Tiimiyhteistyö**: Esikatselutuloksia voidaan jakaa tarkastelua ja hyväksyntää varten
- **Kustannustietoisuus**: Parempi ymmärrys resurssikustannuksista ennen provisiointia
- **Riskin lieventäminen**: Vähemmän käyttöönoton epäonnistumisia ennakkovalidoinnin avulla

#### Tekninen toteutus
- **Monidokumenttinen integrointi**: Esikatseluominaisuus dokumentoitu neljässä keskeisessä tiedostossa
- **Komentomallit**: Johdonmukainen syntaksi ja esimerkit koko dokumentaatiossa
- **Parhaiden käytäntöjen integrointi**: Esikatselu sisällytetty validointityönkulkuihin ja skripteihin
- **Visuaaliset indikaattorit**: Selkeät UUSIEN ominaisuuksien merkinnät helpottamaan löydettävyyttä

#### Työpajan infrastruktuuri
- **Tilaviestintä**: Ammattimainen HTML-banneri liukuvärityylillä
- **Käyttäjäkokemus**: Selkeä kehitystila estää sekaannusta
- **Ammattimainen esitys**: Säilyttää repositorion uskottavuuden samalla kun asettaa odotukset
- **Aikataulun läpinäkyvyys**: Lokakuu 2025 viimeisimmän päivityksen aikaleima vastuullisuuden vuoksi

### [v3.3.0] - 2025-09-24

#### Parannettu työpajamateriaali ja interaktiivinen oppimiskokemus
**Tämä versio tuo kattavat työpajamateriaalit selaimella toimivine interaktiivisine oppaineen ja rakenteellisine oppimispolkuineen.**

#### Lisätty
- **🎥 Interaktiivinen työpajaopas**: Selaimessa toimiva työpajakokemus MkDocs-esikatselutoiminnolla
- **📝 Rakenettu työpajaohjeistus**: 7-vaiheinen ohjattu oppimispolku löydöstä räätälöintiin
  - 0-Introduction: Työpajan yleiskatsaus ja asennus
  - 1-Select-AI-Template: Mallin löytäminen ja valintaprosessi
  - 2-Validate-AI-Template: Käyttöönotto- ja validointimenettelyt
  - 3-Deconstruct-AI-Template: Mallin arkkitehtuurin ymmärtäminen
  - 4-Configure-AI-Template: Konfigurointi ja räätälöinti
  - 5-Customize-AI-Template: Edistyneet muokkaukset ja iteroinnit
  - 6-Teardown-Infrastructure: Siivous ja resurssien hallinta
  - 7-Wrap-up: Yhteenveto ja seuraavat askeleet
- **🛠️ Työpajan työkalut**: MkDocs-konfiguraatio Material-teemalla parannetun oppimiskokemuksen vuoksi
- **🎯 Käytännön oppimispolku**: 3-vaiheinen metodologia (Löytäminen → Käyttöönotto → Räätälöinti)
- **📱 GitHub Codespaces -integraatio**: Saumaton kehitysympäristön asennus

#### Parannettu
- **AI-työpajalaboratorio**: Laajennettu kattavalla 2–3 tunnin rakennetulla oppimiskokemuksella
- **Työpajan dokumentaatio**: Ammattimainen esitys navigaatiolla ja visuaalisilla apuvälineillä
- **Oppimisen eteneminen**: Selkeä vaiheittainen ohjaus mallin valinnasta tuotantokäyttöön siirtymiseen
- **Kehittäjäkokemus**: Integroituja työkaluja virtaviivaisten kehitystyönkulkujen tueksi

#### Parannettu
- **Saavutettavuus**: Selainpohjainen käyttöliittymä hakutoiminnolla, kopiointiominaisuudella ja teeman vaihtamisella
- **Itsenäinen oppiminen**: Joustava työpajarakenne, joka mukautuu eri oppimisvauhteihin
- **Käytännön sovellukset**: Todellisen maailman AI-mallien käyttöönotto-skenaariot
- **Yhteisöintegraatio**: Discord-integraatio työpajatukea ja yhteistyötä varten

#### Työpajan ominaisuudet
- **Sisäänrakennettu haku**: Nopea avainsanojen ja oppituntien löytäminen
- **Kopioi koodilohkot**: Vie kursori päälle -kopiointitoiminto kaikille koodiesimerkeille
- **Teeman vaihto**: Tuki tumma/vaalea -tilalle eri mieltymyksille
- **Visuaaliset aineistot**: Kuvakaappaukset ja kaaviot paremman ymmärryksen tukena
- **Ohjeintegraatio**: Suora Discord-yhteys yhteisön tukeen

### [v3.2.0] - 2025-09-17

#### Merkittävä navigoinnin uudelleenjärjestely ja luku-pohjainen oppimisjärjestelmä
**Tämä versio esittelee kattavan luku-pohjaisen oppimisrakenteen ja parannetun navigoinnin koko arkistossa.**

#### Lisätty
- **📚 Luku-pohjainen oppimisjärjestelmä**: Kurssi järjestetty uudelleen 8 etenevään oppimislukuun
  - Luku 1: Perusteet ja pika-aloitus (⭐ - 30–45 min)
  - Luku 2: AI-lähtöinen kehitys (⭐⭐ - 1–2 tuntia)
  - Luku 3: Konfigurointi ja autentikointi (⭐⭐ - 45–60 min)
  - Luku 4: Infrastruktuuri koodina & käyttöönotto (⭐⭐⭐ - 1–1,5 tuntia)
  - Luku 5: Moni-agenttiset AI-ratkaisut (⭐⭐⭐⭐ - 2–3 tuntia)
  - Luku 6: Ennen käyttöönottoa tehtävä validointi & suunnittelu (⭐⭐ - 1 tunti)
  - Luku 7: Vianmääritys & debuggaus (⭐⭐ - 1–1,5 tuntia)
  - Luku 8: Tuotanto- & yritystason mallit (⭐⭐⭐⭐ - 2–3 tuntia)
- **📚 Kattava navigointijärjestelmä**: Johdonmukaiset ylätunnisteet ja alatunnisteet kaikessa dokumentaatiossa
- **🎯 Edistymisen seuranta**: Kurssin suorituschecklista ja oppimisen varmistusjärjestelmä
- **🗺️ Oppimispolun ohjaus**: Selkeät aloituspisteet eri kokemustasoille ja tavoitteille
- **🔗 Ristiviittausnavigointi**: Liittyvät luvut ja ennakkoedellytykset selkeästi linkitettyinä

#### Parannettu
- **README-rakenne**: Muutettu rakenteelliseksi oppimisalustaksi luku-pohjaisella organisoinnilla
- **Dokumentaation navigointi**: Jokaisella sivulla on nyt luvun konteksti ja etenemisen ohjaus
- **Mallien organisointi**: Esimerkit ja mallit kohdennettu sopiviin oppimislukuihin
- **Resurssien integrointi**: Cheat sheetit, UKK:t ja opiskeluoppaat yhdistetty asiaankuuluviin lukuihin
- **Työpajan integrointi**: Käytännön laboratoriot kohdennettu useisiin lukujen oppimistavoitteisiin

#### Muutettu
- **Oppimisen eteneminen**: Siirretty lineaarisesta dokumentaatiosta joustavaan luku-pohjaiseen oppimiseen
- **Konfiguraation sijoitus**: Konfigurointiopas siirretty Luvuksi 3 paremman oppimisvirran vuoksi
- **AI-sisällön integrointi**: Parempi AI-spesifisen sisällön integrointi koko oppimispolun ajan
- **Tuotantosisältö**: Edistyneet mallit yhdistetty Lukuun 8 yrityskäyttäjille

#### Parannettu
- **Käyttäjäkokemus**: Selkeät navigointimurupolut ja luvun etenemisen indikaattorit
- **Saavutettavuus**: Johdonmukaiset navigointikuvioinnit helpottavat kurssin läpikäyntiä
- **Ammattimainen esitys**: Yliopistotyyppinen kurssirakenne sopii akateemiseen ja yrityskoulutukseen
- **Oppimisen tehokkuus**: Vähemmän aikaa relevantin sisällön löytämiseen parannetun organisoinnin ansiosta

#### Tekninen toteutus
- **Navigointiylätunnisteet**: Standardisoitu luvunavigointi yli 40 dokumentaatiotiedostossa
- **Alatunnisteen navigointi**: Johdonmukainen etenemisen ohjaus ja luvun suoritusindikaattorit
- **Ristilinkitys**: Kattava sisäinen linkitysjärjestelmä yhdistämässä liittyviä käsitteitä
- **Lukukartoitus**: Mallit ja esimerkit selkeästi yhdistetty oppimistavoitteisiin

#### Opiskeluoppaan parannus
- **📚 Kattavat oppimistavoitteet**: Opiskeluopas uudelleenjärjestetty vastaamaan 8-lukuista järjestelmää
- **🎯 Luku-pohjainen arviointi**: Jokainen luku sisältää erityiset oppimistavoitteet ja käytännön harjoitukset
- **📋 Edistymisen seuranta**: Viikoittainen oppimisaikataulu mitattavilla tuloksilla ja suorituschecklisteillä
- **❓ Arviointikysymykset**: Tietämyksen validointikysymykset jokaiselle luvulle ammatillisilla tuloksilla
- **🛠️ Käytännön harjoitukset**: Käytännön aktiviteetteja todellisilla käyttöönotto-skenaarioilla ja vianmäärityksellä
- **📊 Taitojen eteneminen**: Selkeä eteneminen perustason käsitteistä yritystason malleihin urakehitykseen keskittyen
- **🎓 Sertifiointikehys**: Ammatillisen kehityksen tulokset ja yhteisön tunnustusjärjestelmä
- **⏱️ Aikataulun hallinta**: Rakenteellinen 10-viikkoinen oppimissuunnitelma virstanpylväiden laadintatarkastuksin

### [v3.1.0] - 2025-09-17

#### Parannettu moni-agenttinen AI-ratkaisu
**Tässä versiossa parannetaan moni-agenttista vähittäiskaupan ratkaisua paremmilla agenttien nimillä ja parannetulla dokumentaatiolla.**

#### Muutettu
- **Moni-agenttiterminologia**: Korvattu "Cora agent" termillä "Customer agent" koko vähittäiskaupan moni-agenttiratkaisussa selkeämmän ymmärryksen vuoksi
- **Agenttien arkkitehtuuri**: Päivitetty kaikki dokumentaatio, ARM-mallit ja koodiesimerkit käyttämään yhtenäistä "Customer agent" -nimitystä
- **Konfiguraatioesimerkit**: Modernisoitu agentin konfigurointimallit päivitettyjen nimeämiskäytäntöjen kanssa
- **Dokumentaation yhdenmukaisuus**: Varmistettu, että kaikki viittaukset käyttävät ammatillisia, kuvailevia agenttinimiä

#### Parannettu
- **ARM-mallipaketti**: Päivitetty retail-multiagent-arm-template Customer agent -viittauksilla
- **Arkkitehtuurikaaviot**: Päivitetyt Mermaid-kaaviot päivitettyjen agenttinimien kanssa
- **Koodiesimerkit**: Python-luokat ja toteutusesimerkit käyttävät nyt CustomerAgent-nimeämistä
- **Ympäristömuuttujat**: Päivitetty kaikki käyttöönotto-skriptit käyttämään CUSTOMER_AGENT_NAME-käytäntöjä

#### Parannettu
- **Developer Experience**: Selkeämmät agentin roolit ja vastuut dokumentaatiossa
- **Production Readiness**: Parempi yhdenmukaistaminen yrityksen nimeämiskäytäntöihin
- **Learning Materials**: Intuitiivisempi agenttien nimeäminen opetustarkoituksiin
- **Template Usability**: Yksinkertaistettu ymmärrys agenttien toiminnoista ja käyttöönotto-malleista

#### Tekniset tiedot
- Päivitetyt Mermaid-arkkitehtuurikaaviot, joissa CustomerAgent-viittaukset
- Korvattiin CoraAgent-luokkien nimet CustomerAgentilla Python-esimerkeissä
- Muokattiin ARM-mallin JSON-konfiguraatioita käyttämään "customer"-agenttityyppiä
- Päivitettiin ympäristömuuttujia CORA_AGENT_* → CUSTOMER_AGENT_* -mallien mukaisesti
- Päivitettiin kaikki käyttöönotto-komennot ja konttikonfiguraatiot

### [v3.0.0] - 2025-09-12

#### Suuret muutokset - AI-kehittäjäkeskeisyys ja Microsoft Foundry -integraatio
**Tämä versio muuttaa repositorion kattavaksi tekoälykeskeiseksi oppimateriaaliresurssiksi, jossa on Microsoft Foundry -integraatio.**

#### Lisätty
- **🤖 AI-First Learning Path**: Täydellinen uudelleenjärjestely, jossa etusijalla ovat tekoälykehittäjät ja -insinöörit
- **Microsoft Foundry Integration Guide**: Kattava dokumentaatio AZD:n yhdistämisestä Microsoft Foundry -palveluihin
- **AI Model Deployment Patterns**: Yksityiskohtainen opas, joka kattaa mallin valinnan, konfiguroinnin ja tuotantokäyttöönoton strategiat
- **AI Workshop Lab**: 2–3 tunnin käytännön työpaja AI-sovellusten muuttamisesta AZD:llä otettaviksi ratkaisuiksi
- **Production AI Best Practices**: Yrityskäyttöön valmiit mallit AI-kuormien skaalaamiseen, monitorointiin ja suojaamiseen
- **AI-Specific Troubleshooting Guide**: Kattava vikadiagnostiikka Azure OpenAI:lle, Cognitive Servicesille ja AI-käyttöönotto-ongelmille
- **AI Template Gallery**: Esitelty kokoelma Microsoft Foundry -malleja monimutkaisuusluokituksineen
- **Workshop Materials**: Täydellinen työpajan rakenne käytännön laboratorioineen ja viitemateriaaleineen

#### Parannettu
- **README Structure**: Tekoälykehittäjäkeskeinen, 45 % yhteisön kiinnostusdatalla Microsoft Foundry Discordista
- **Learning Paths**: Omistettu tekoälykehittäjän polku rinnakkain perinteisten polkujen opiskelijoille ja DevOps-insinööreille
- **Template Recommendations**: Esiteltyjä tekoälymalleja, kuten azure-search-openai-demo, contoso-chat ja openai-chat-app-quickstart
- **Community Integration**: Parannettu Discord-yhteisötuki tekoälykohtaisilla kanavilla ja keskusteluilla

#### Turvallisuus ja tuotantokeskeisyys
- **Managed Identity Patterns**: Tekoälykohtaiset todennus- ja suojauskonfiguraatiot
- **Cost Optimization**: Tokenien käytön seuranta ja budjettikontrollit AI-kuormille
- **Multi-Region Deployment**: Strategiat maailmanlaajuiseen AI-sovellusten käyttöönottoon
- **Performance Monitoring**: Tekoälykohtaiset mittarit ja Application Insights -integraatio

#### Dokumentaation laatu
- **Linear Course Structure**: Looginen eteneminen aloittelijasta edistyneisiin AI-käyttöönoton malleihin
- **Validated URLs**: Kaikki ulkoiset repository-linkit tarkistettu ja saavutettavissa
- **Complete Reference**: Kaikki sisäiset dokumentaatiolinkit validoitu ja toimivia
- **Production Ready**: Yrityskäyttöön valmiit käyttöönoton mallit todellisilla esimerkeillä

### [v2.0.0] - 2025-09-09

#### Suuret muutokset - Repositorion uudelleenjärjestely ja ammattimainen parannus
**Tämä versio edustaa merkittävää uudistusta repositorion rakenteessa ja sisällön esittämisessä.**

#### Lisätty
- **Structured Learning Framework**: Kaikilla dokumentaatioluvuilla on nyt Johdanto-, Oppimistavoitteet- ja Oppimistulokset-osiot
- **Navigation System**: Lisätty Edellinen/Seuraava-oppituntolinkit koko dokumentaatioon ohjatun oppimisen etenemiseksi
- **Study Guide**: Kattava study-guide.md oppimistavoitteineen, harjoitustehtävineen ja arviointimateriaaleineen
- **Professional Presentation**: Poistettiin kaikki emojit parannetun saavutettavuuden ja ammattimaisen ulkonäön vuoksi
- **Enhanced Content Structure**: Paranneltu organisointi ja oppimateriaalien rakenne

#### Muutettu
- **Documentation Format**: Standardisoitiin kaikki dokumentaatio johdonmukaisella oppimiskeskeisellä rakenteella
- **Navigation Flow**: Toteutettiin looginen eteneminen kaikkien oppimateriaalien läpi
- **Content Presentation**: Poistettiin koristeelliset elementit selkeämmän, ammattimaisemman muotoilun hyväksi
- **Link Structure**: Päivitettiin kaikki sisäiset linkit tukemaan uutta navigaatiojärjestelmää

#### Parannettu
- **Accessibility**: Poistettiin emoji-riippuvuudet parantaen ruudunlukija-yhteensopivuutta
- **Professional Appearance**: Siisti, akateeminen esitystyyli yrityskäyttöön sopivana
- **Learning Experience**: Jäsennelty lähestymistapa selkeillä tavoitteilla ja tuloksilla jokaista oppituntia varten
- **Content Organization**: Parempi looginen eteneminen ja yhteydet aiheiden välillä

### [v1.0.0] - 2025-09-09

#### Ensijulkaisu - Kattava AZD-oppimisrepositorio

#### Lisätty
- **Ydindokumentaation rakenne**
  - Täydellinen aloitusopassarja
  - Kattava käyttöönotto- ja provisiointidokumentaatio
  - Yksityiskohtaiset vianetsintäresurssit ja virheenkorjausoppaat
  - Ennen käyttöönottoa suoritettavat validointi-työkalut ja -menettelyt

- **Aloitusmoduuli**
  - AZD:n perusteet: Ydinkäsitteet ja terminologia
  - Asennusopas: Alustakohtaiset asennusohjeet
  - Konfiguraatio-opas: Ympäristön asetukset ja todennus
  - Ensimmäinen projektitutorial: Vaiheittainen käytännön oppiminen

- **Käyttöönotto- ja provisiointimoduuli**
  - Käyttöönotto-opas: Täydellinen työnkulun dokumentaatio
  - Provisiointiopas: Infrastructure as Code Bicepillä
  - Parhaat käytännöt tuotantokäyttöönottoon
  - Monipalveluarkkitehtuurin mallit

- **Ennakkovalidointimoduuli**
  - Kapasiteettisuunnittelu: Azure-resurssien saatavuuden tarkistus
  - SKU-valinta: Kattava opastus palvelutasojen valintaan
  - Esitarkistukset: Automaattiset validointiskriptit (PowerShell ja Bash)
  - Kustannusarviointi- ja budjetointityökalut

- **Vianmääritysmoduuli**
  - Yleiset ongelmat: Usein kohdattavat ongelmat ja ratkaisut
  - Virheenkorjausopas: Systemaattiset vianetsintämenetelmät
  - Edistyneet diagnostiikkatekniikat ja -työkalut
  - Suorituskyvyn seuranta ja optimointi

- **Resurssit ja viitteet**
  - Komentojen pikaopas: Nopea viite olennaisille komennoille
  - Sanasto: Kattavat termi- ja lyhenneluettelot
  - FAQ: Yksityiskohtaiset vastaukset yleisiin kysymyksiin
  - Ulkoiset resurssilinkit ja yhteisöyhteydet

- **Esimerkit ja mallit**
  - Yksinkertainen verkkosovellus-esimerkki
  - Staattisen sivuston käyttöönotto-malli
  - Konttisovelluskonfiguraatio
  - Tietokantaintegraatiomallit
  - Mikropalveluarkkitehtuurin esimerkit
  - Serverless-funktioiden toteutukset

#### Ominaisuudet
- **Multi-Platform Support**: Asennus- ja konfigurointioppaat Windowsille, macOS:lle ja Linuxille
- **Multiple Skill Levels**: Sisältö suunniteltu opiskelijoista ammattilaiskehittäjiin
- **Practical Focus**: Käytännön esimerkit ja todelliset skenaariot
- **Comprehensive Coverage**: Peruskäsitteistä edistyneisiin yritysmalleihin
- **Security-First Approach**: Turvallisuuden parhaat käytännöt integroituina läpi
- **Cost Optimization**: Ohjeet kustannustehokkaisiin käyttöönottoihin ja resurssien hallintaan

#### Dokumentaation laatu
- **Detailed Code Examples**: Käytännölliset, testatut koodiesimerkit
- **Step-by-Step Instructions**: Selkeät, toteuttamiskelpoiset ohjeet
- **Comprehensive Error Handling**: Vianetsintä yleisille ongelmille
- **Best Practices Integration**: Alan standardit ja suositukset
- **Version Compatibility**: Päivitetty uusimpien Azure-palveluiden ja azd-ominaisuuksien mukaiseksi

## Suunnitellut tulevat parannukset

### Versio 3.1.0 (Suunniteltu)
#### AI-alustan laajentaminen
- **Multi-Model Support**: Integraatiomallit Hugging Face:lle, Azure Machine Learningille ja räätälöidyille malleille
- **AI Agent Frameworks**: Mallipohjat LangChain-, Semantic Kernel- ja AutoGen-käyttöönottoihin
- **Advanced RAG Patterns**: Vaihtoehdot vektoridatabasesille Azure AI Searchin lisäksi (Pinecone, Weaviate jne.)
- **AI Observability**: Parannettu monitorointi mallin suorituskyvylle, tokenien käytölle ja vastausten laadulle

#### Kehittäjäkokemus
- **VS Code Extension**: Integroitu AZD + AI Foundry -kehityskokemus
- **GitHub Copilot Integration**: Copilotin avulla avustettu AZD-mallien generointi
- **Interactive Tutorials**: Interaktiiviset käytännön koodausharjoitukset automaattisella validoinnilla AI-skenaarioissa
- **Video Content**: Lisämateriaali video-opastuksia visuaalisille oppijoille, keskittyen AI-käyttöönottoihin

### Versio 4.0.0 (Suunniteltu)
#### Yritys-AI-mallit
- **Governance Framework**: AI-mallien hallinta, vaatimustenmukaisuus ja audit-lokit
- **Multi-Tenant AI**: Mallit monen asiakkaan palvelemiseen erillisten AI-palveluiden avulla
- **Edge AI Deployment**: Integraatio Azure IoT Edgeen ja kontti-instanseihin
- **Hybrid Cloud AI**: Monipilvi- ja hybridikäyttöönoton mallit AI-kuormille

#### Edistyneet ominaisuudet
- **AI Pipeline Automation**: MLOps-integraatio Azure Machine Learning -putkistoihin
- **Advanced Security**: Zero-trust -mallit, private endpointit ja kehittynyt uhkasuojaus
- **Performance Optimization**: Kehittyneet viritys- ja skaalausstrategiat suurilukuisille AI-sovelluksille
- **Global Distribution**: Sisällön jakelu- ja reunacaching-mallit AI-sovelluksille

### Versio 3.0.0 (Suunniteltu) - Korvattu nykyisellä julkaisulla
#### Ehdotetut lisäykset - Nyt toteutettu versiossa v3.0.0
- ✅ **AI-Focused Content**: Kattava Microsoft Foundry -integraatio (Valmis)
- ✅ **Interactive Tutorials**: Käytännön AI-työpaja (Valmis)
- ✅ **Advanced Security Module**: Tekoälykohtaiset suojausmallit (Valmis)
- ✅ **Performance Optimization**: AI-kuormien viritysstrategiat (Valmis)

### Versio 2.1.0 (Suunniteltu) - Osittain toteutettu versiossa v3.0.0
#### Pienet parannukset - Osa toteutettu nykyjulkaisussa
- ✅ **Additional Examples**: AI-keskeiset käyttöönotto-skenaariot (Valmis)
- ✅ **Extended FAQ**: AI-kohtaiset kysymykset ja vianetsintä (Valmis)
- **Tool Integration**: Parannetut IDE- ja editor-integraatio-oppaat
- ✅ **Monitoring Expansion**: AI-kohtaiset monitorointi- ja hälytysmallit (Valmis)

#### Vielä suunnitteilla tuleville julkaisuille
- **Mobile-Friendly Documentation**: Responsiivinen suunnittelu mobiilioppimiseen
- **Offline Access**: Ladattavat dokumentaatiopaketit
- **Enhanced IDE Integration**: VS Code -laajennus AZD + AI -työnkuluille
- **Community Dashboard**: Reaaliaikaiset yhteisön mittarit ja kontribuutioseuranta

## Osallistuminen muutoslokiin

### Muutosten raportointi
Kun kontribuoit tähän repositorioon, varmista että muutoslokimerkinnät sisältävät:

1. **Version Number**: Noudata semanttista versiointia (major.minor.patch)
2. **Date**: Julkaisun tai päivityksen päivämäärä muodossa YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Ytimekäs kuvaus siitä, mitä muutettiin
5. **Impact Assessment**: Kuvaus siitä, miten muutokset vaikuttavat nykyisiin käyttäjiin

### Muutoskategoriat

#### Lisätty
- Uudet ominaisuudet, dokumentaatioluvut tai toiminnot
- Uudet esimerkit, mallit tai oppimateriaalit
- Lisätyt työkalut, skriptit tai apuohjelmat

#### Muutettu
- Muutokset olemassa olevaan toiminnallisuuteen tai dokumentaatioon
- Päivitykset selkeyden tai tarkkuuden parantamiseksi
- Sisällön tai organisaation uudelleenjärjestelyt

#### Vanhentunut
- Ominaisuudet tai lähestymistavat, joita asteittain poistetaan
- Dokumentaatio-osiot, jotka on suunniteltu poistettaviksi
- Menetelmät, joille on parempia vaihtoehtoja

#### Poistettu
- Ominaisuudet, dokumentaatio tai esimerkit, jotka eivät ole enää relevantteja
- Vanhentunut tieto tai vanhentuneet lähestymistavat
- Päällekkäinen tai yhdistetty sisältö

#### Korjattu
- Korjauksia dokumentaation tai koodin virheisiin
- Raportoitujen ongelmien tai vikojen ratkaisut
- Parannuksia tarkkuuteen tai toiminnallisuuteen

#### Turvallisuus
- Turvallisuuteen liittyvät parannukset tai korjaukset
- Päivitykset turvallisen käytännön suosituksiin
- Turvahaavoittuvuuksien korjaukset

### Semanttisen versioinnin ohjeet

#### Suuri versio (X.0.0)
- Taaksepäin yhteensopimattomat muutokset, jotka vaativat käyttäjän toimenpiteitä
- Merkittävä sisällön tai organisaation uudelleenjärjestely
- Muutokset, jotka muuttavat perustavanlaatuista lähestymistapaa tai metodologiaa

#### Pieni versio (X.Y.0)
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
- **GitHub Issues**: Ilmoita ongelmista tai ehdota parannuksia (AI-kohtaiset ongelmat tervetulleita)
- **Discord Discussions**: Jaa ideoita ja osallistu Microsoft Foundry -yhteisöön
- **Pull Requests**: Tee suoria parannuksia sisältöön, erityisesti AI-malleihin ja oppaisiin
- **Microsoft Foundry Discord**: Osallistu kanavaan #Azure AZD + AI -keskusteluihin
- **Community Forums**: Osallistu laajempiin Azure-kehittäjien keskusteluihin

### Palautekategoriat
- **AI Content Accuracy**: Korjaukset AI-palveluiden integraatioon ja käyttöönottoon liittyvään tietoon
- **Learning Experience**: Ehdotukset AI-kehittäjäoppimisen virtauksen parantamiseksi
- **Missing AI Content**: Pyynnöt lisätä AI-mallipohjia, -malleja tai esimerkkejä
- **Accessibility**: Parannuksia monipuolisiin oppimistarpeisiin
- **AI Tool Integration**: Ehdotuksia AI-kehitystyönkulun paremman integraation saavuttamiseksi
- **Production AI Patterns**: Pyyntöjä yritys-AI-käyttöönoton mallien lisäämiseksi

### Vastauslupaus
- **Issue Response**: Vastataan ilmoitettuihin ongelmiin 48 tunnin kuluessa
- **Feature Requests**: Arvioidaan viikon sisällä
- **Community Contributions**: Tarkastellaan viikon kuluessa
- **Security Issues**: Korkea prioriteetti, nopeutettu reagointi

## Ylläpitosuunnitelma

### Säännölliset päivitykset
- **Monthly Reviews**: Sisällön tarkkuuden ja linkkien validointi kuukausittain
- **Quarterly Updates**: Merkittäviä sisällön lisäyksiä ja parannuksia neljännesvuosittain
- **Semi-Annual Reviews**: Kattavat uudelleenjärjestelyt ja parannukset puolen vuoden välein
- **Annual Releases**: Vuotuiset julkaisut merkittävin versiopäivityksin ja parannuksin

### Seuranta ja laadunvarmistus
- **Automated Testing**: Säännöllinen koodiesimerkkien ja linkkien validointi
- **Community Feedback Integration**: Käyttäjäehdotusten säännöllinen sisällyttäminen
- **Technology Updates**: Yhdenmukaistus uusimpien Azure-palveluiden ja azd-julkaisujen kanssa
- **Accessibility Audits**: Säännölliset tarkastukset inklusiivisen suunnittelun periaatteille

## Versiotukipolitiikka

### Nykyversion tuki
- **Latest Major Version**: Täysi tuki säännöllisillä päivityksillä
- **Previous Major Version**: Turvapäivitykset ja kriittiset korjaukset 12 kuukauden ajan
- **Legacy Versions**: Vain yhteisön tuki, ei virallisia päivityksiä

### Migraatio-ohjeet
Kun suuret versiot julkaistaan, tarjoamme:
- **Siirtymäoppaat**: Vaiheittaiset siirtymäohjeet
- **Yhteensopivuustiedot**: Tiedot yhteensopivuuden rikkovista muutoksista
- **Työkalutuki**: Skriptit tai apuohjelmat siirtymän avuksi
- **Yhteisön tuki**: Omistetut foorumit siirtymäkysymyksille

---

**Navigointi**
- **Edellinen oppitunti**: [Opas](resources/study-guide.md)
- **Seuraava oppitunti**: Palaa kohtaan [Pää-README](README.md)

**Pysy ajan tasalla**: Seuraa tätä repositoriota saadaksesi ilmoituksia uusista julkaisuista ja tärkeistä päivityksistä oppimateriaaleihin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Pyrimme tarkkuuteen, mutta huomioithan, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää auktoritatiivisena lähteenä. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->