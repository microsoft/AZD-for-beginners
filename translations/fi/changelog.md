# Muutosloki - AZD Aloittelijoille

## Johdanto

Tämä muutosloki dokumentoi kaikki merkittävät muutokset, päivitykset ja parannukset AZD For Beginners -varastossa. Noudatamme semanttisen versionhallinnan periaatteita ja ylläpidämme tätä lokia auttaaksemme käyttäjiä ymmärtämään versioiden väliset muutokset.

## Oppimistavoitteet

Tämän muutoslokin tarkastelun avulla:
- Pysyt ajan tasalla uusista ominaisuuksista ja sisällön lisäyksistä
- Ymmärrät olemassa olevan dokumentaation parannukset
- Seuraat virheenkorjauksia ja korjauksia tarkkuuden varmistamiseksi
- Seuraat oppimateriaalien kehitystä ajan myötä

## Oppimistulokset

Muutoslokimerkintöjen tarkastelun jälkeen pystyt:
- Tunnistamaan uudet oppimateriaali- ja resurssilisäykset
- Ymmärtämään, mitkä osiot on päivitetty tai parannettu
- Suunnittelemaan oppimispolkusi ajantasaisen materiaalin perusteella
- Antamaan palautetta ja ehdotuksia tulevia parannuksia varten

## Versiohistoria

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Päivitys: Version Päivittäminen
**Tämä versio varmistaa kurssin yhteensopivuuden `azd` `1.27.1` (heinäkuu 2026, uusin vakaa julkaisu) ja nykyisen esikatseluversion AI-agenttilaajennuksen `azure.ai.agents` `1.0.0-beta.5` kanssa, päivittäen kaikki "vahvistettu" -bannerit ajan tasalle versioiden 1.26.0, 1.27.0 ja 1.27.1 julkaisujen jälkeen.**

#### Muutokset
- **✅ Vahvistusperusta päivitetty** versiosta `azd 1.25.6` (kesäkuu 2026) versioon `azd 1.27.1` (heinäkuu 2026) juurihakemiston README:tä, kaikkia luku-README-tiedostoja, luvun 1 dev-container -oppituntia (sisältäen sidotut versioesimerkit), luvun 4 mukautetun mallin oppituntia, luvun 5 moniagentti-oppituntia sekä työpajan dokumentaatiota
- **🤖 Luku 2 perusta päivitetty** versiosta `azd 1.23.12` (maaliskuu 2026) versioon `azd 1.27.1` tiedostoissa `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` ja `microsoft-foundry-integration.md`; vahvistuspäivämäärät päivitetty päivämäärään 2026-07-13
- **🧩 AI-agenttilaajennus päivitetty** versiosta `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` versioon `1.0.0-beta.5` luvun 2 README-tiedostossa ja `agents.md`-tiedostossa
- **🧪 Työpajan validointiesimerkki** (`azd version` -ulostulo) päivitetty versioon `1.27.1`

#### Huomiot merkittävistä azd-julkaisuista (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-tuki Azure Functions -palvelulle Flex Consumption -ympäristössä, `azd config sub-filter` vuokranantajakohtaiset tilausfiltterit, itse sisältävät laajennuspaketit (`azd x pack --bundle`), ja `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Azure AI Foundry -projektit/agentit mallinnettavissa suoraan `azure.yaml`-tiedostossa (Bicep- ja Terraform-vapaasti), säilöjen käyttöpäällikkötuki App Servicelle (`host: appservice` + `language: docker`), suora `-s/--source` -optio `azd extension` -komennoille, sekä `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` -valitsin `azd extension install` -komentoon, vanhentuneet mallit suljettu oletuksena pois luettelosta/kiintiökyselyistä, sekä useita vikakorjauksia

#### Päivitetyt tiedostot
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Aloittelijoiden aukko #2: Mallien kirjoittaminen, dev-containerit, Pulumi, Azure DevOps, palveluperiaatteet ja muuta
**Tämä versio sulkee jäljellä olevat keskitasoiset aukot, jotka tulivat esiin azd-coverage -analyysistä: miten kirjoittaa ja julkaista oma malli, toistettavat dev-container-/Codespaces-ympäristöt, Pulumi-infrastruktuurin tarjoaja, Azure DevOps CI/CD -läpikäynti, palveluperiaatteella tapahtuva todennus, isäntien valintaopastus (AKS/Spring Apps), `azd restore`/`azd package` -selitykset, hook-virheenkäsittely, sekä tiimin ja jaettujen ympäristöjen käytännöt.**

#### Lisätty
- **🧱 Uusi Luku 4 -oppitunti** `docs/chapter-04-infrastructure/custom-templates.md` — oman azd-mallin kirjoittaminen: vaadittu rakenne (`azure.yaml`, `infra/`, `src/`), `metadata.template`-kenttä, infrastruktuurin parametrisointi `uniqueString()`-resurssitunnuksella ja `azd-env-name` -tagilla, paikallinen testaus `azd init --template <local-path>` -komennolla, julkaisu GitHubiin ja lähetys Awesome AZD -galleriaan
- **📦 Uusi Luku 1 -oppitunti** `docs/chapter-01-foundation/dev-containers.md` — toistettavat azd-ympäristöt Dev Containersien ja GitHub Codespacesin avulla: minimalistinen `.devcontainer/devcontainer.json` käyttäen virallista `ghcr.io/azure/azure-dev/azd` -ominaisuutta, kielenkohtaiset ominaisuudet, `docker-in-docker` säilön isännille ja `azd auth login --use-device-code` etäkirjautumiseen
- **🧩 Pulumi azd:n kanssa** -osio tiedostossa `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumin kansiorakenne, pinosidonta azd-ympäristöihin, tarvittavat outputit/tagit sekä identtinen `azd up` / `azd down` -työnkulku
- **🎯 Isäntien valintaopastus** tiedostossa `docs/chapter-04-infrastructure/provisioning.md` — aloittelijaystävällinen vertailu `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` ja `springapp` -vaihtoehdoista, sekä ohjeistusta AKS:n tai Azure Spring Appsin valintaan
- **🛠️ Azure DevOps CI/CD -läpikäynti** tiedostossa `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, palveluyhteys kuormitustunnuksen federoinnilla (OIDC), generoitu `azure-dev.yml` ja muuttujaryhmän asetukset
- **🔑 Palveluperiaatteet (Malli 4)** lisätty tiedostoon `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, ei-interaktiivinen `azd auth login` asiakassalasanalla vs. federoidut/OIDC-tunnisteet, käyttötarkoitukset ja turvallinen tunnistetietojen säilytys
- **🪝 Hook-virheenkäsittely** alajakso tiedostossa `docs/chapter-04-infrastructure/deployment-guide.md` — poistumiskoodit ja `set -e`, `continueOnError`, hookkien testaus erikseen `azd hooks run` -komennolla, käyttöjärjestelmäkohtaiset shellit ja `--debug`
- **👥 Tiimin / jaetut ympäristöt** osio tiedostossa `docs/chapter-03-configuration/configuration.md` — mitä sijaitsee `.azure/` -kansiossa, mitä gitignoretaan, kehittäjäkohtaiset ympäristöt, `azd env list`/`select` ja ympäristöarvojen antaminen CI/CD:ssä
- **🧰 `azd restore` ja laajennetut `azd package`** selitykset tiedostossa `resources/cheat-sheet.md` — riippuvuuksien palautus ja siirrettävän artefaktin rakentaminen ilman käyttöönottoa

#### Muutokset
- **🧭 Luku 4 oppituntitaulukko** päivitetty sisältämään uusi "Kirjoita oma mallisi" -oppitunti (Oppitunti 3)
- **🧭 Luku 1 oppituntitaulukko** päivitetty sisältämään uusi "Dev Containers & Codespaces" -oppitunti (Oppitunti 5); navigointialat kytketty tiedostojen `bring-your-own-app.md` ja `dev-containers.md` välillä

### [v3.21.0] - 2026-06-16

#### Aloittelijoiden aukko: Käytännön moni-agenttioppitunti, "Ota oma sovellus", Terraform ja CI/CD-läpikäynti
**Tämä versio sulkee suurimmat aukot täydelliselle aloittelijoiden opastukselle lisäämällä kaksi uutta käytännön oppituntia (yleisesti käyttöön otettava moni-agenttiläpikäynti ja azd:n lisääminen olemassa olevaan sovellukseen), aloittelijaystävällisen hooks-esittelyn, Terraform-azd -osion, vaiheittaisen GitHub Actions -putken kävelyn, selityksen uusille esikatselulaajennuksille sekä selkeän käyttöönoton varmistuslistan.**

#### Lisätty
- **🤝 Uusi Luku 5 -oppitunti** `docs/chapter-05-multi-agent/multi-agent-basics.md` — täysin käytännönläheinen, käyttöönotettava kahden agentin läpikäynti (orkestroija + erikoisasiantuntijat) käyttämällä todellista mallia (`contoso-creative-writer`), käsitellen milloin käyttää moni-agenttia, `azd up` -työnkulku, käyttöön otettujen resurssien ymmärtäminen, agenttien välinen jäljitettävyys, mukauttaminen ja siivous
- **📦 Uusi Luku 1 -oppitunti** `docs/chapter-01-foundation/bring-your-own-app.md` — miten lisätä azd olemassa olevaan projektiin käyttäen `azd init` ("käytä nykyisen kansion koodia"), `azure.yaml` ja `infra/` -kansion ymmärtäminen, `azd infra generate`, isännän tunnistus ja käyttöönotto `azd up` -komennolla
- **🌐 Terraform azd:n kanssa** osio lisättiin tiedostoon `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` -asetus, `.tf`-kansiorakenne, vaaditut `AZURE_*` -outputit ja `azd-env-name` -tagitus sekä identtinen `azd up` / `azd down` -työnkulku (sulkee aukon, jossa Terraform-tuki mainittiin, mutta näytettiin vain Bicep)
- **⚙️ Vaiheittainen GitHub Actions -läpikäynti** tiedostossa `docs/chapter-08-production/production-ai-practices.md` — GitHub repositoriosta automaattisiin käyttöönottoihin: `azd pipeline config`, OIDC-yhdistettävät tunnistetiedot (ei tallennettuja salaisuuksia), generoitu `azure-dev.yml` ja opastus salaisuuksien vs. muuttujien käytössä
- **🪝 Aloittelijoille "Uusi hookeihin?" -esittely** tiedostossa `docs/chapter-04-infrastructure/deployment-guide.md` — mikä on hook, hook-vaihetaulukko, yksinkertainen ensimmäinen hook ja manuaalinen hookien ajaminen `azd hooks run` -komennolla
- **✅ "Varmista käyttöönotto" -tarkistuslista** lisätty osaan 5 tiedostossa `docs/chapter-01-foundation/first-project.md` — savutesti, terveystarkistus-URL ja selkeät onnistumiskriteerit
- **🧩 Selitys uusista esikatselulaajennuksista** `azure.ai.skills` ja `azure.ai.connections` (mikä ne ovat ja milloin käyttää) tiedostossa `docs/chapter-08-production/production-ai-practices.md`

#### Muutokset
- **🧭 Luku 5 oppituntitaulukko** korjattu: `multi-agent-basics.md` on nyt Oppitunti 1 (ainoastaan täysin käytännönläheinen oppitunti), rehellisesti merkitty, että Oppitunti 2 on luvussa 6 ja Retail-skenaario on arkkitehtuurimalli, ei yksi-komennon malli
- **🧭 Luku 1 oppituntitaulukko** sisältää nyt uuden "Ota oma sovellus" -oppitunnin (Oppitunti 4)
- **🔗 Navigointialat** päivitetty: `first-project.md` linkittää nyt eteenpäin `bring-your-own-app.md` -tiedostoon

#### Korjattu
- **🧱 Suljettu "mainittu mutta puuttuva" Terraform-aukko** — kurssi viittasi aiemmin Terraform-tukeen näyttämättä sitä
- **🔀 Korjattu harhaanjohtavat Luku 5 ristilinkitykset** jotka antoivat ymmärtää, että täysi moni-agenttiratkaisu olisi olemassa, kun todellisuudessa oli vain arkkitehtuurimalli

#### Päivitetyt tiedostot
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(uusi)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(uusi)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Päivitys, Täydelliset Agentin Elinkaarikomennot & Aspire-brändimuutos

**Tämä versio validoi kurssin `azd` `1.25.6` (kesäkuu 2026) ja `azure.ai.agents` `0.1.40-preview` laajennuksen kanssa, laajentaa tekoälyohjeistusta "agentin rakentamisesta" kattamaan koko agentin elinkaaren (testaus → arviointi → optimointi → tarkastus → poisto), esittelee uudet `azure.ai.skills` ja `azure.ai.connections` esikatselulaajennukset, sekä huomioi ".NET Aspire" → "Aspire" tuotteen uudelleenbrändäyksen.**

#### Lisätty
- **🔁 Täysi agentin elinkaaren kattavuus** aloittelijoille ja tekoälyinsinööreille dokumentaatiossa:
  - `docs/chapter-01-foundation/azd-basics.md` — Elinkaaritaulukko (rakentaminen → testaus → mittaus → parannus → tarkastus → siivous) lisätty Laajennukset ja tekoälykomennot -osioon
  - `docs/chapter-08-production/production-ai-practices.md` — Uusi "Agentin elinkaaren hallinta" osio, joka kattaa `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ja `delete --force`
  - `resources/cheat-sheet.md` — Laajennetut tekoälyagenttikomennot sisältäen `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` ja `delete --force`
- **🧩 Uudet esikatselulaajennukset** dokumentoitu: `azure.ai.skills` (uudelleenkäytettävät agenttitaidot) ja `azure.ai.connections` (Foundry-yhteydet) lisätty laajennustaulukkoon ja pikaselosteeseen
- **⏱️ Vastausajan ohjeistus** — `azd ai agent invoke` esimerkeissä nyt mainitaan, että se tulostaa kokonaisviiveen ja ensimmäisen tavun vastaanottoajan
- **📌 Version banneri** juurireadonmeissa ohjaamassa käyttäjiä `azd version` ja `azd upgrade` komentojen pariin

#### Muutettu
- **✅ Validointiperusta päivitetty** `azd 1.23.12` (maaliskuu 2026) versiosta `azd 1.25.6` (kesäkuu 2026) kaikkiin lukujen README-tiedostoihin ja työpajadokumentaatioon
- **🤖 Luku 2 laajennusmuistio** päivitetty `azure.ai.agents` `0.1.18-preview` versiosta `0.1.40-preview`
- **🧪 Työpajavalidointiesimerkki** (`azd version` tuloste) päivitetty versioon `1.25.6`
- **🧭 README "Mitä uutta azd:ssä tänään"** päivitetty korostamaan agentin elinkaaren kokonaisuutta, uusia tekoälylaajennuksia ja viimeaikaisia käyttömukavuuspäivityksiä (`azd init` idempotenssi, `azd auth login` vanhentuneen tokenin poisto, `azd tool` ensimmäisen suorituksen kehotus)
- **📖 Luku 2 agents.md (Vaihtoehto 4)** ohjaa nyt käyttäjiä käyttämään jälkiasennuksen elinkaaren komentoja `azd up` sijaan

#### Korjattu
- **🏷️ Tuotteen nimeäminen** — lisätty Aspire-brändimuutosmuistio (".NET Aspire" on nyt yksinkertaisesti "Aspire"); azd:n Aspire-tuki on ennallaan
- **🔎 Julkaisun elävän validoinnin** varmistus Azure Developer CLI julkaisusyötteen mukaan: vakaa CLI `1.25.6` (2026-06-12) ja `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Päivitetyt tiedostot
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### Aloittelijan perehdytyksen selvennys, asennuksen validointi & loppusiivous AZD-komentoihin
**Tämä versio jatkaa AZD 1.23 validointikierrosta aloittelijakeskeisellä dokumentaatioläpikäynnillä: se selventää AZD-ensimmäistä todennusohjeistusta, lisää paikallisen asennuksen validointiskriptit, varmentaa tärkeät komennot suoraan elävästä AZD CLI:stä sekä poistaa viimeiset vanhentuneet englanninkieliset komentoviittaukset changelogin ulkopuolelta.**

#### Lisätty
- **🧪 Aloittelijan asennuksen validointiskriptit** `validate-setup.ps1` ja `validate-setup.sh`, jotta käyttäjät voivat varmistaa vaaditut työkalut ennen luvun 1 aloittamista
- **✅ Alkuperäinen asennuksen validointivaihe** juurireadmeessa ja Luku 1 README:ssa, jotta puuttuvat edellytykset havaitaan ennen `azd up` komentoa

#### Muutettu
- **🔐 Aloittelijan todennusohjeistus** käsittelee nyt johdonmukaisesti `azd auth login` ensisijaisena polkuna AZD-työnkuluille ja mainitsee `az login`:n valinnaisena, ellei Azure CLI-komentoja käytetä suoraan
- **📚 Luku 1 perehdytysvirtaus** ohjaa nyt käyttäjiä validomaan paikallisen asennuksen ennen asennusta, todennusta ja ensiasennusvaiheita
- **🛠️ Validointiviestit** erottelevat nyt selkeästi estävät vaatimukset ja valinnaiset Azure CLI varoitukset AZD-ainostyöskentelylle
- **📖 Asetukset, vianetsintä ja esimerkkidokumentaatio** eroittavat nyt vaaditun AZD-todennuksen ja valinnaisen Azure CLI kirjautumisen, missä aiemmin esitettiin ilman kontekstia

#### Korjattu
- **📋 Jäljellä olevat englanninkieliset komentoviittaukset** päivitetty nykyisiin AZD-muotoihin, sisältäen `azd config show` pikaselosteessa ja `azd monitor --overview` kohteissa, joissa tarkoituksena on Azure Portalin yleiskatsaus
- **🧭 Aloittelijan väitteet Luvussa 1** pehmennetty välttämään liiallisia lupauksia virheettömyydestä tai automaattisista palautuksista kaikissa malleissa ja Azure-resursseissa
- **🔎 Elävä CLI-validointi** varmistettu nykyisen tuen osalta komennoille `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` ja `azd down --force --purge`

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

#### AZD 1.23.12 validointi, työpaja-ympäristön laajennus & tekoälymallin päivitys
**Tämä versio suorittaa dokumentaation validointikierroksen `azd` `1.23.12` versiota vasten, päivittää vanhentuneita AZD-komentoesimerkkejä, päivittää tekoälymallin ohjeistusta nykyisiin oletuksiin, ja laajentaa työpajaohjeita GitHub Codespacesin lisäksi tukemaan kehityssäiliöitä ja paikallisia klooneja.**

#### Lisätty
- **✅ Validointimuistiinpanot ydinkappaleissa ja työpajan dokumentaatiossa** tehden testatun AZD-perustan oppijoille eksplisiittiseksi uudemmilla tai vanhemmilla CLI-versioilla
- **⏱️ Käyttöönoton aikakatkaisun ohjeistus** pitkäkestoisiin tekoälysovelluksen käyttöönottoihin käyttäen `azd deploy --timeout 1800`
- **🔎 Laajennusten tarkistusohjeet** `azd extension show azure.ai.agents` AI-työnkulkujen dokumentaatiossa
- **🌐 Laajempi työpaja-ympäristöohjeistus** kattaen GitHub Codespaces, dev containerit ja paikalliset kloonit MkDocs:lla

#### Muutettu
- **📚 Luvun esittely-README:t** mainitsevat nyt johdonmukaisesti validoinnin `azd 1.23.12` versiolla fundamentti-, konfiguraatio-, infrastruktuuri-, multi-agent-, esiasennus-, vianetsintä- ja tuotanto-osioissa
- **🛠️ AZD-komentoviittaukset** päivitetty nykyisiin muotoihin dokumentaatiossa:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` tai `azd env get-value(s)` kontekstista riippuen
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` kohteissa, joissa on tarkoitus näyttää Application Insights yleiskatsaus
- **🧪 Provision-esikatseluesimerkit** yksinkertaistettu nykyisiin tuettuihin muotoihin kuten `azd provision --preview` ja `azd provision --preview -e production`
- **🧭 Työpajavirtaus** päivitetty siten, että käyttäjät voivat suorittaa labrat Codespacesissa, dev containerissa tai paikallisessa kloonissa, eikä pelkästään Codespaces-ympäristössä
- **🔐 Todennusohjeistus** suosii nyt `azd auth login` käyttöä AZD-työnkuluissa, ja `az login` mainitaan valinnaisena, kun Azure CLI-komentoja käytetään suoraan

#### Korjattu
- **🪟 Windowsin asennuskomennot** normalisoitu nykyiseen `winget`-pakettien kirjaimistoon asennusohjeissa
- **🐧 Linuxin asennusohjeistus** korjattu välttämään tuettomat distrokohtaiset `azd`-pakettienhallinnan ohjeet ja ohjaamaan tarvittaessa julkaisulatauksiin
- **📦 Tekoälymallin esimerkit** päivitetty vanhoista oletusarvoista kuten `gpt-35-turbo` ja `text-embedding-ada-002` nykyaikaisiin esimerkkeihin kuten `gpt-4.1-mini`, `gpt-4.1` ja `text-embedding-3-large`
- **📋 Käyttöönoton ja diagnostiikan koodikatkelmat** korjattu nykyisten ympäristö- ja tilakomentojen käyttöön lokeissa, skripteissä ja vianetsintäohjeissa
- **⚙️ GitHub Actions ohjeistus** päivitetty versioon `Azure/setup-azd@v2` aiemman `v1.0.0` sijaan
- **🤖 MCP/Copilot-suostumusohje** päivitetty `azd mcp consent`:sta `azd copilot consent list`-komentoon

#### Parannettu
- **🧠 Tekoälyn lukuohjeistus** selkeyttää nyt esikatseluihin liittyvää `azd ai` käytöstä, vuokraajan kirjautumista, nykyisten laajennusten käyttöä ja päivitettyjä mallin käyttöönottoehdotuksia
- **🧪 Työpajaohjeet** käyttävät nyt realistisempia versioesimerkkejä ja selkeämpää ympäristön asennuskieltä käytännön laboratorioihin
- **📈 Tuotanto- ja vianetsintädokumentaatio** on nyt linjassa nykyisten monitorointi-, reservimalli- ja kustannustasoesimerkkien kanssa

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

#### AZD AI CLI -komennot, sisällön validointi & mallipohjien laajennus
**Tämä versio lisää `azd ai`, `azd extension` ja `azd mcp` komentojen kattavuuden kaikkiin tekoälyyn liittyviin lukuihin, korjaa rikkinäiset linkit ja vanhentuneen koodin agents.md -tiedostossa, päivittää pikaselosteen ja uudistaa Esimerkkimallipohjat-osion validoiduilla kuvauksilla ja uusilla Azure AI AZD-malleilla.**

#### Lisätty
- **🤖 AZD AI CLI -kattavuus** seitsemässä tiedostossa (aiemmin vain Luvussa 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Uusi "Laajennukset ja tekoälykomennot" osio, joka esittelee `azd extension`, `azd ai agent init` ja `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Vaihtoehto 4: `azd ai agent init` vertailevalla taulukolla (mallipohja vs manifesti-lähestymistapa)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD-laajennukset Foundrylle" ja "Agenttiohjelman ensiasennus" alaluvut

  - `docs/chapter-05-multi-agent/README.md` — Nopean aloituksen osio näyttää nyt sekä mallipohja- että manifestipohjaiset käyttöönoton polut
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Käyttöönotto-osio sisältää nyt `azd ai agent init` -valinnan
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI-laajennuksen komennot diagnostiikkaan" -alajakso
  - `resources/cheat-sheet.md` — Uusi "AI & Laajennusten komennot" -osio sisältäen `azd extension`, `azd ai agent init`, `azd mcp` ja `azd infra generate`
- **📦 Uudet AZD AI -esimerkkimallit** tiedostossa `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG -keskustelu Blazor WebAssemblyllä, Semantic Kernelillä ja äänikeskustelun tuella
  - **azure-search-openai-demo-java** — Java RAG -keskustelu Langchain4J:llä, ACA/AKS käyttöönotto vaihtoehdot
  - **contoso-creative-writer** — Moniagenttinen luovan kirjoittamisen sovellus Azure AI Agent Servicellä, Bing Groundingilla ja Promptyllä
  - **serverless-chat-langchainjs** — Serverless RAG Azure Functionsilla + LangChain.js:llä + Cosmos DB:llä ja Ollama paikallisen kehityksen tuella
  - **chat-with-your-data-solution-accelerator** — Yritystason RAG-kiihdytin hallintaportaalilla, Teams-integraatiolla ja PostgreSQL/Cosmos DB -vaihtoehdoilla
  - **azure-ai-travel-agents** — Moniagenttinen MCP-orchestrointi esimerkkisovellus .NET-, Python-, Java- ja TypeScript-palvelimilla
  - **azd-ai-starter** — Minimimaalinen Azure AI infrastruktuurin Bicep-alustamalli
  - **🔗 Hieno AZD AI -gallerialinkki** — Viittaus [awesome-azd AI galleryyn](https://azure.github.io/awesome-azd/?tags=ai) (yli 80 mallia)

#### Korjatut
- **🔗 agents.md navigointi**: Edellinen/Seuraava linkit vastaavat nyt luvun 2 README-opetusten järjestystä (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md rikkinäiset linkit**: `production-ai-practices.md` korjattu muotoon `../chapter-08-production/production-ai-practices.md` (3 esiintymää)
- **📦 agents.md vanhentunut koodi**: Korvattu `opencensus` paketilla `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md virheellinen API**: `max_tokens` siirretty `create_agent()`-funktiosta `create_run()`-funktioon nimellä `max_completion_tokens`
- **🔢 agents.md tokenien laskenta**: Arvio `len//4` korvattu tarkemmalla `tiktoken.encoding_for_model()`-funktiolla
- **azure-search-openai-demo**: Palvelut korjattu muotoon "Azure AI Search + Azure Container Apps" aiemmasta "Cognitive Search + App Service" (oletuspalvelimen isäntä muuttui lokakuussa 2024)
- **contoso-chat**: Päivitetty kuvausta vastaamaan Azure AI Foundrya + Promptyä, repo oikeaa nimeä ja teknologiaa vastaavaksi

#### Poistetut
- **ai-document-processing**: Ei-toimiva malliviite poistettu (repo ei julkisesti saatavilla AZD-mallina)

#### Parannukset
- **📝 agents.md harjoitukset**: Harjoituksessa 1 näytetään nyt odotettu tulos ja `azd monitor` -vaihe; Harjoitus 2 sisältää koko `FunctionTool` rekisteröintikoodin; Harjoitus 3 korvaa epämääräisen ohjeistuksen konkreettisilla `prepdocs.py` komennoilla
- **📚 agents.md resurssit**: Päivitetty dokumentaatiolinkit nykyisiin Azure AI Agent Service -dokumentteihin ja pikaoppaaseen
- **📋 agents.md seuraavat askeleet -taulukko**: Lisätty AI-työpajan laboratorio linkki täydellistä luvun kattavuutta varten

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

#### Kurssin navigointiparannus
**Tämä versio parantaa README.md luvunavigointia parannetulla taulukkomuodolla.**

#### Muutokset
- **Kurssikarttataulukko**: Paranneltu suorilla oppituntien linkeillä, kestoarvioilla ja monimutkaisuusluokituksella
- **Kansion siivous**: Poistettu tarpeettomat vanhat kansiot (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkkien tarkistus**: Kaikki 21+ sisäistä linkkiä Kurssikarttataulukossa on varmistettu

### [v3.16.0] - 2026-02-05

#### Tuotenimipäivitykset
**Tämä versio päivittää tuotteen nimityksiä nykyisen Microsoftin brändäyksen mukaisiksi.**

#### Muutokset
- **Microsoft Foundry → Microsoft Foundry**: Kaikki viittaukset päivitetty ei-käännöstiedostoissa
- **Azure AI Agent Service → Foundry Agents**: Palvelun nimi päivitetty vastaamaan nykyistä brändiä

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

#### Merkittävä reporakenteen muutos: Luvun nimiset kansiot
**Tämä versio järjestelee dokumentaation uudelleen luku kansionimillä selkeyttämään navigointia.**

#### Kansionimien muutokset
Vanhojen kansioiden tilalle on tullut luvunumerot kansiot:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lisätty uusi: `docs/chapter-05-multi-agent/`

#### Tiedostojen siirrot
| Tiedosto | Mistä | Minne |
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
- **📚 Luvun README-tiedostot**: Luotiin README.md-kunkin luvun kansioon, sisältäen:
  - Oppimistavoitteet ja kesto
  - Tuntitaulukko kuvauksineen
  - Pikakäynnistyskomennot
  - Navigointi muihin lukuihin

#### Muutettu
- **🔗 Päivitetty kaikki sisäiset linkit**: 78+ polkua päivitetty kaikkien dokumentaatiotiedostojen läpi
- **🗺️ Pää-README.md**: Päivitetty Kurssikartta uudella lukurakenteella
- **📝 examples/README.md**: Päivitetty viittaukset luku-kansiolle

#### Poistettu
- Vanha kansiorakenne (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Arkistorakenteen muutos: Luvun navigointi
**Tässä versiossa lisättiin lukunavigoinnin README-tiedostot (korvattu versiolla v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Uusi AI-agenttien opas
**Tässä versiossa lisätään kattava opas AI-agenttien käyttöönotosta Azure Developer CLI:llä.**

#### Lisätty
- **🤖 docs/microsoft-foundry/agents.md**: Täydellinen opas, joka käsittelee:
  - Mitä AI-agentit ovat ja miten ne poikkeavat chatbotista
  - Kolme pikakäynnistysagenttipohjaa (Foundry Agents, Prompty, RAG)
  - Agenttiarkkitehtuurimallit (yksittäinen agentti, RAG, moniagentti)
  - Työkalun konfigurointi ja muokkaus
  - Seuranta ja mittareiden seuranta
  - Kustannusnäkökohdat ja optimointi
  - Yleisiä vianmääritystilanteita
  - Kolme käytännön harjoitusta onnistumiskriteereineen

#### Sisältörakenne
- **Johdanto**: Agenttikäsitteitä aloittelijoille
- **Pikakäynnistys**: Agenttien käyttöönotto komennolla `azd init --template get-started-with-ai-agents`
- **Arkkitehtuurimallit**: Visuaaliset kaaviot agenttimalleista
- **Konfigurointi**: Työkalun asetus ja ympäristömuuttujat
- **Seuranta**: Application Insights -integraatio
- **Harjoitukset**: Etenevä käytännön opiskelu (20-45 minuuttia kukin)

---

### [v3.12.0] - 2026-02-05

#### DevContainer-ympäristön päivitys
**Tämä versio päivittää kehityssäiliön asetuksia moderneilla työkaluilla ja paremmilla oletuksilla AZD:n opetteluympäristöä varten.**

#### Muutettu
- **🐳 Peruskuva**: Päivitetty `python:3.12-bullseye` -kuvasta `python:3.12-bookworm` -kuvaan (uusin Debian stable)
- **📛 Säiliön nimi**: Nimetty uudelleen "Python 3":sta "AZD for Beginners" -nimiseksi selkeyden vuoksi

#### Lisätty
- **🔧 Uudet Dev Container -ominaisuudet**:
  - `azure-cli` Bicep-tuen kera
  - `node:20` (LTS-versio AZD-malleille)
  - `github-cli` mallien hallintaan
  - `docker-in-docker` konttisovellusten käyttöönottoa varten

- **🔌 Portin eteenpäin ohjaus**: Esikonfiguroidut portit yleiseen kehitykseen:
  - 8000 (MkDocs-esikatselu)
  - 3000 (Web-sovellukset)
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
  - `bierner.markdown-mermaid` - Mermaid-kaaviotuki
  - `redhat.vscode-yaml` - YAML-tuki (azure.yaml:lle)
  - `eamodio.gitlens` - Gitin visualisointi
  - `mhutchie.git-graph` - Git-historia

- **⚙️ VS Code -asetukset**: Lisätty oletusasetukset Python-tulkille, muotoilulle tallennettaessa ja tyhjien merkkien poistolle

- **📦 Päivitetty requirements-dev.txt**:
  - Lisätty MkDocs-minifiointilaajennus
  - Lisätty pre-commit koodin laadun varmistamiseen
  - Lisätty Azure SDK -paketit (azure-identity, azure-mgmt-resource)

#### Korjattu
- **Luontijälkeinen komento**: Tarkistaa nyt AZD- ja Azure CLI -asennukset kontin käynnistyessä

---

### [v3.11.0] - 2026-02-05

#### Aloittelijaystävällinen README-uudistus
**Tämä versio parantaa README.md-tiedostoa merkittävästi aloittelijoille sopivammaksi ja lisää olennaiset resurssit AI-kehittäjille.**

#### Lisätty
- **🆚 Azure CLI vs AZD -vertailu**: Selkeä selitys siitä, milloin kumpaakin työkalua käytetään käytännön esimerkein
- **🌟 Upeat AZD-linkit**: Suorat linkit yhteisön mallitietokantaan ja kontribuutiovälineisiin:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ valmista käyttöönotettavaa mallia
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Yhteisön panos
- **🎯 Pikakäynnistysopas**: Yksinkertaistettu 3-vaiheinen aloitusosio (Asenna → Kirjaudu sisään → Ota käyttöön)
- **📊 Kokemusperusteinen navigaatiotaulukko**: Selkeä opas siitä, mistä aloittaa kehittäjän kokemuksen mukaan

#### Muutettu
- **README-rakenne**: Järjestetty asteittaiseen paljastamiseen - tärkeimmät tiedot ensin
- **Johdanto-osio**: Kirjoitettu uudelleen selittämään "The Magic of `azd up`" täydellisille aloittelijoille
- **Poistettu kaksoissisältö**: Poistettu päällekkäinen vianmääritysosio

- **Vianmäärityskomennot**: Korjattiin `azd logs` viittaus käyttämään kelvollista `azd monitor --logs`

#### Korjattu

- **🔐 Todennuskomennot**: Lisätty `azd auth login` ja `azd auth logout` cheat-sheet.md-tiedostoon
- **Virheelliset komentoviittaukset**: Poistettu jäljellä olevat `azd logs` README:n vianetsintäosasta

#### Huomautuksia
- **Kohdealue**: Muutokset tehty pääasiallisesti README.md- ja resources/cheat-sheet.md-tiedostoihin
- **Kohdeyleisö**: Parannukset suunnattu erityisesti AZD:n uusille kehittäjille

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI -komentojen tarkkuuspäivitys
**Tämä versio korjaa dokumentaation ei-olemassa olevat AZD-komennot, varmistaen että kaikki koodiesimerkit käyttävät kelvollista Azure Developer CLI -syntaksia.**

#### Korjattu
- **🔧 Ei-olemassa olevien AZD-komentojen poistot**: Laaja tarkastus ja virheellisten komentojen korjaukset:
  - `azd logs` (ei ole olemassa) → korvattu komennolla `azd monitor --logs` tai Azure CLI -vaihtoehdoilla
  - `azd service` -alikomennot (eivät ole olemassa) → korvattu komennoilla `azd show` ja Azure CLI
  - `azd infra import/export/validate` (ei ole olemassa) → poistettu tai korvattu kelvollisilla vaihtoehdoilla
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` -liput (eivät ole olemassa) → poistettu
  - `azd provision --what-if/--rollback` -liput (eivät ole olemassa) → päivitetty käyttämään `--preview`
  - `azd config validate` (ei ole olemassa) → korvattu `azd config list` -komennolla
  - `azd info`, `azd history`, `azd metrics` (eivät ole olemassa) → poistettu

- **📚 Korjauksilla päivitetyt tiedostot**:
  - `resources/cheat-sheet.md`: Kattava päivitys komentoviitteisiin
  - `docs/deployment/deployment-guide.md`: Korjattiin rollback- ja deployment-strategiat
  - `docs/troubleshooting/debugging.md`: Korjattu lokianalyysiosiot
  - `docs/troubleshooting/common-issues.md`: Päivitetty vianetsintäkomennot
  - `docs/troubleshooting/ai-troubleshooting.md`: Korjattu AZD:n virheenkorjausosio
  - `docs/getting-started/azd-basics.md`: Korjattu monitorointikomennot
  - `docs/getting-started/first-project.md`: Päivitetty monitorointi- ja virheenkorjausesimerkit
  - `docs/getting-started/installation.md`: Korjattu apu- ja versioesimerkit
  - `docs/pre-deployment/application-insights.md`: Korjattu lokien katselukomennot
  - `docs/pre-deployment/coordination-patterns.md`: Korjattu agenttien virheenkorjauskomennot

- **📝 Päivitetty versio-viite**:
  - `docs/getting-started/installation.md`: Kovakoodattu versio `1.5.0` vaihdettu geneeriseen `1.x.x` ja linkki julkaisuihin

#### Muutettu
- **Rollback-strategiat**: Dokumentaatiota päivitetty käyttämään Git-pohjaista rollbackia (AZD:llä ei ole natiivisti rollback-toimintoa)
- **Lokien katselu**: Vaihdettu kaikki `azd logs` -viittaukset `azd monitor --logs`, `azd monitor --live` ja Azure CLI -komentoihin
- **Suorituskykyosio**: Poistettu ei-olemassa olevat rinnakkais- ja inkrementaaliset deployment-liput, annettu kelvolliset vaihtoehdot

#### Tekniset tiedot
- **Kelvolliset AZD-komennot**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Kelvolliset azd monitor -liput**: `--live`, `--logs`, `--overview`
- **Poistetut ominaisuudet**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Huomautuksia
- **Varmistus**: Komennot validoitu Azure Developer CLI v1.23.x -versiota vastaan

---

### [v3.9.0] - 2026-02-05

#### Työpajamoduulien valmistuminen ja dokumentaation laadun päivitys
**Tämä versio viimeistelee vuorovaikutteiset työpajamoduulit, korjaa kaikki rikkoutuneet linkit dokumentaatiossa ja parantaa yleistä sisältölaatua Microsoft AZD:n AI-kehittäjille.**

#### Lisätty
- **📝 CONTRIBUTING.md**: Uusi osallistumisohjeiden dokumentti sisältäen:
  - Selkeät ohjeet ongelmien raportoimiseen ja muutosehdotuksiin
  - Dokumentaation laatuvaatimukset uudelle sisällölle
  - Koodiesimerkkejä ja sitoutumisviestien käytäntöjä
  - Yhteisön osallistumisohjeistukset

#### Valmistunut
- **🎯 Työpajamoduuli 7 (Yhteenveto)**: Täysin valmis yhteenvetomoduuli sisältäen:
  - Kattavan yhteenvedon työpajan saavutuksista
  - Keskeisten käsitteiden hallinta AZD:stä, malleista ja Microsoft Foundrystä
  - Oppimispolun jatkosuositukset
  - Työpajaharuutteluhaasteet vaikeustasoineen
  - Yhteisön palaute- ja tukilinkit

- **📚 Työpajamoduuli 3 (Purkaminen)**: Päivitetyt oppimistavoitteet sisältäen:
  - GitHub Copilot MCP-palvelinten aktivointiohjeistus
  - AZD-mallipohjien kansiorakenteen ymmärrys
  - Infrastruktuuri koodina (Bicep) -järjestelymallit
  - Käytännön labraohjeet

- **🔧 Työpajamoduuli 6 (Purku)**: Valmistunut sisältäen:
  - Resurssien siivous- ja kustannustenhallintatavoitteet
  - `azd down` -komennon käyttö infrastruktuurin turvalliseen alasajoon
  - Pehmeästi poistettujen kognitiivisten palveluiden palautusohjeet
  - Bonus-tutustumiskiihdyttimet GitHub Copilotiin ja Azure-portaaliin

#### Korjattu
- **🔗 Rikkinäisten linkkien korjaukset**: Korjattiin yli 15 rikkoutunutta sisäistä dokumentaatio-linkkiä:
  - `docs/ai-foundry/ai-model-deployment.md`: Korjattu polut microsoft-foundry-integration.md -tiedostoon
  - `docs/troubleshooting/ai-troubleshooting.md`: Korjattu ai-model-deployment.md ja production-ai-practices.md polut
  - `docs/getting-started/first-project.md`: Ei-oleva cicd-integration.md korvattu deployment-guide.md:llä
  - `examples/retail-scenario.md`: Korjattu UKK- ja vianetsintäoppaan polut
  - `examples/container-app/microservices/README.md`: Korjattu kurssin kotisivu- ja deployment-opaspolut
  - `resources/faq.md` ja `resources/glossary.md`: Päivitetty AI-luvun viittaukset
  - `course-outline.md`: Korjattu opettajan opas ja AI-työpajalabra-viittaukset

- **📅 Työpajan tila-banneri**: Päivitetty "Rakenteilla"-tilasta aktiiviseksi tilaksi helmikuussa 2026

- **🔗 Työpajan navigointi**: Korjattu rikkoutuneet navigointilinkit työpajan README.md-tiedostossa, jotka osoittivat olemattomaan lab-1-azd-basics-kansioon

#### Muutettu
- **Työpajan esitys**: Poistettu "rakenteilla" -varoitus, työpaja nyt valmis ja käyttövalmis
- **Navigoinnin yhdenmukaisuus**: Varmistettu, että kaikissa työpajamoduuleissa on toimiva moduulien välinen navigointi
- **Oppimispolun viittaukset**: Päivitetty lukujen ristiinviittaukset käyttämään oikeita microsoft-foundry-polkuja

#### Validointi
- ✅ Kaikissa englanninkielisissä markdown-tiedostoissa ovat kelvolliset sisäiset linkit
- ✅ Työpajamoduulit 0-7 ovat valmiita ja sisältävät oppimistavoitteet
- ✅ Navigointi lukujen ja moduulien välillä toimii moitteettomasti
- ✅ Sisältö sopii Microsoft AZD:tä käyttävälle AI-kehittäjälle
- ✅ Aloittelijaystävällinen kieli ja rakenne säilytetty koko dokumentaatiossa
- ✅ CONTRIBUTING.md tarjoaa selkeät ohjeet yhteisön osallistujille

#### Tekninen toteutus
- **Linkkien validointi**: Automaattinen PowerShell-skripti varmisti kaikkien .md-tiedostojen sisäiset linkit
- **Sisällöntarkistus**: Työpajan kattavuuden ja aloittelijaystävällisyyden manuaalinen arviointi
- **Navigointijärjestelmä**: Tasaiset luku- ja moduulinavigointimallit

#### Huomautuksia
- **Kohdealue**: Muutokset koskevat vain englanninkielistä dokumentaatiota
- **Käännökset**: Käännöskansiot eivät päivittyneet tässä versiossa (automaattinen kääntäminen synkronoituu myöhemmin)
- **Työpajan kesto**: Täysin valmis työpaja tarjoaa nyt 3–4 tuntia käytännön oppimista

---

### [v3.8.0] - 2025-11-19

#### Edistynyt dokumentaatio: Monitorointi, suojaus ja moniagenttikuviot
**Tämä versio lisää kattavat A-tason oppitunnit Application Insights -integraatiosta, todennuskäytännöistä ja moniagenttien koordinoinnista tuotantoympäristöissä.**

#### Lisätty
- **📊 Application Insights -integraatio-opetus**: tiedostossa `docs/pre-deployment/application-insights.md`:
  - AZD-kohdennettu käyttöönotto automaattisella provisioinnilla
  - Täydelliset Bicep-mallit Application Insights + Log Analytics -palveluille
  - Toimivat Python-sovellukset mukautetulla telemetrialla (yli 1 200 riviä)
  - AI/LLM-monitorointikäytännöt (Microsoft Foundry Models -tokenin/kustannusten seuranta)
  - 6 Mermaid-kaaviota (arkkitehtuuri, hajautettu jäljitys, telemetriavirta)
  - 3 käytännön harjoitusta (hälytykset, dashboardit, AI-monitorointi)
  - Kusto-kyselyesimerkit ja kustannusten optimointistrategiat
  - Live-metriikkavirtaus ja reaaliaikainen virheenkorjaus
  - 40-50 minuutin oppimisaika tuotantovalmiilla malleilla

- **🔐 Todennus- ja suojauskuviot -opetus**: tiedostossa `docs/getting-started/authsecurity.md`:
  - 3 todennuskuviota (yhteysmerkkijonot, Key Vault, hallittu identiteetti)
  - Täydelliset Bicep-infrastruktuurimallit turvallisille käyttöönottoille
  - Node.js-sovelluskoodi Azure SDK -integraatiolla
  - 3 täydellistä harjoitusta (hallittu identiteetti, käyttäjän määrittämä identiteetti, Key Vaultin kierto)
  - Turvallisuuden parhaat käytännöt ja RBAC-konfiguraatiot
  - Vianetsintäopas ja kustannusanalyysi
  - Tuotantovalmiit salasanattomat todennuskuviot

- **🤖 Moniagenttien koordinointikuviot -opetus**: tiedostossa `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinointikuviota (peräkkäinen, rinnakkainen, hierarkkinen, tapahtumapohjainen, konsensus)
  - Täydellinen orkestrointipalvelun toteutus (Python/Flask, yli 1 500 riviä)
  - 3 erikoistunutta agenttien toteutusta (Tutkimus, Kirjoittaja, Toimittaja)
  - Service Bus -integraatio viestijonotukseen
  - Cosmos DB -tilanhallinta hajautetuissa järjestelmissä
  - 6 Mermaid-kaaviota agenttien vuorovaikutuksista
  - 3 edistynyttä harjoitusta (aikarajojen hallinta, uudelleenyrityslogiikka, piirikaapin murtaja)
  - Kustannuserittely ($240-565/kk) optimointistrategioineen
  - Application Insights -integraatio monitorointiin

#### Laajennettu
- **Ennakkoasennusluku**: Nyt sisältää kattavat monitorointi- ja koordinointikuviot
- **Aloitusluku**: Parannettu ammattilaiset todennuskäytännöt
- **Tuotantovalmius**: Täydellinen kattavuus turvallisuudesta havainnointiin
- **Kurssirunko**: Päivitetty viitteet uusiin lukuihin 3 ja 6

#### Muutettu
- **Oppimisen eteneminen**: Turvallisuuden ja monitoroinnin parempi integrointi kurssilla
- **Dokumentaation laatu**: Tasaiset A-tason standardit (95-97 %) uusissa oppitunneissa
- **Tuotantomallit**: Täydellinen päästä päähän -kattaus yritysjulkaisuille

#### Parannettu
- **Kehittäjäkokemus**: Selkeä polku kehityksestä tuotantomonitorointiin
- **Turvallisuusstandardit**: Ammattimaiset todennuskäytännöt ja salaisuuksien hallinta
- **Havaittavuus**: Täydellinen Application Insights -integraatio AZD:llä
- **AI-kuormat**: Erikoistunut monitorointi Microsoft Foundry Models- ja moniagenttijärjestelmille

#### Vahvistettu
- ✅ Kaikki oppitunnit sisältävät toimivan täydellisen koodin (eivät pelkkiä pätkiä)
- ✅ Mermaid-kaaviot visuaaliseen oppimiseen (19 yhteensä kolmessa oppitunnissa)
- ✅ Käytännön harjoitukset vahvistusvaiheineen (9 yhteensä)
- ✅ Tuotantovalmiit Bicep-mallit voidaan ottaa käyttöön `azd up` -komennolla
- ✅ Kustannusanalyysi ja optimointistrategiat
- ✅ Vianetsintäoppaat ja parhaat käytännöt
- ✅ Tietopisteet varmistuskomentoineen

#### Dokumentaation arviointitulokset
- **docs/pre-deployment/application-insights.md**: - Kattava monitorointiohje
- **docs/getting-started/authsecurity.md**: - Ammattimaiset suojauskuviot
- **docs/pre-deployment/coordination-patterns.md**: - Edistyneet moniagenttijärjestelmät
- **Yhteenveto uudesta sisällöstä**: - Tasainen korkea laatustandardi

#### Tekninen toteutus
- **Application Insights**: Log Analytics + mukautettu telemetria + hajautettu jäljitys
- **Todennus**: Hallittu identiteetti + Key Vault + RBAC-kuviot
- **Moni-agentti**: Service Bus + Cosmos DB + Container Apps + orkestrointi
- **Monitorointi**: Live-metriikat + Kusto-kyselyt + hälytykset + dashboardit
- **Kustannusten hallinta**: Otantamenetelmät, säilytyskäytännöt, budjettirajoitukset

### [v3.7.0] - 2025-11-19

#### Dokumentaation laadun parannukset ja uusi Microsoft Foundry Models -esimerkki
**Tämä versio parantaa dokumentaation laatua koko arkistossa ja lisää täydellisen Microsoft Foundry Models -julkaisuesimerkin gpt-4.1-chat-käyttöliittymällä.**

#### Lisätty
- **🤖 Microsoft Foundry Models -chat-esimerkki**: Täydellinen gpt-4.1-julkaisu ja toimiva toteutus hakemistossa `examples/azure-openai-chat/`:
  - Täydellinen Microsoft Foundry Models -infrastruktuuri (gpt-4.1-mallin julkaisu)
  - Python-pohjainen komentorivichat-käyttöliittymä keskusteluhistorialla
  - Key Vault -integraatio API-avaimen turvalliseen säilytykseen
  - Tokenin käytön seuranta ja kustannusarviointi
  - Nopeuden rajoitus ja virheenkäsittely
  - Kattava README 35 - 45 minuutin julkaisuoppaalla
  - 11 tuotantovalmiita tiedostoa (Bicep-mallit, Python-sovellus, konfiguraatio)
- **📚 Dokumentaation harjoitukset**: Lisätty käytännön harjoituksia konfiguraatio-oppaaseen:
  - Harjoitus 1: Moniympäristökonfiguraatio (15 minuuttia)
  - Harjoitus 2: Salaisuuksien hallinnan harjoitus (10 minuuttia)
  - Selkeät onnistumiskriteerit ja vahvistusvaiheet
- **✅ Julkaisun vahvistus**: Lisätty tarkistusosio julkaisuoppaaseen:
  - Terveystarkastusmenettelyt
  - Onnistumiskriteerien tarkistuslista
  - Kaikkien julkaisukomentojen odotetut tulosteet
  - Nopea vianetsintäviite

#### Parannettu
- **examples/README.md**: Päivitetty A-tason laaduksi (93 %):
  - Lisätty azure-openai-chat kaikkiin asiaankuuluviin osioihin
  - Päivitetty paikallisten esimerkkien määrä 3:sta 4:ään
  - Lisätty AI-sovellusesimerkkien taulukkoon
  - Integroitu keskitasoisten käyttäjien pikaoppaaseen
  - Lisätty Microsoft Foundry Mallit -osioon
  - Päivitetty vertailumatriisi ja teknologian löytöosat
- **Dokumentaation laatu**: Parannettu B+ (87 %) → A- (92 %) kaikkialla docs-kansiossa:

  - Lisätty odotetut tulokset kriittisiin komentoesimerkkeihin
  - Sisällytetty varmennusvaiheet konfiguraatiomuutoksille
  - Parannettu käytännön oppimista käytännön harjoituksilla

#### Muutettu
- **Oppimisen eteneminen**: Parempi tekoälyesimerkkien integrointi keskitason oppijoille
- **Dokumentaation rakenne**: Enemmän käytännönläheisiä harjoituksia selkeillä tuloksilla
- **Varmennusprosessi**: Selkeämpi menestyskriteeristö keskeisiin työnkulkuihin

#### Parannettu
- **Kehittäjäkokemus**: Microsoft Foundry Models -mallien käyttöönotto vie nyt 35-45 minuuttia (aikaisemmin 60-90 minuuttia monimutkaisemmilla vaihtoehdoilla)
- **Kustannusten läpinäkyvyys**: Selkeät kustannusarviot ($50-200/kuukausi) Microsoft Foundry Models -esimerkille
- **Oppimispolku**: Tekoälykehittäjillä selkeä aloituspiste azure-openai-chatilla
- **Dokumentaation standardit**: Johdonmukaiset odotetut tulokset ja varmennusvaiheet

#### Varmennettu
- ✅ Microsoft Foundry Models -esimerkki täysin toimiva `azd up` -komennolla
- ✅ Kaikki 11 toteutustiedostoa ovat syntaksiltaan oikeita
- ✅ README-ohjeet vastaavat todellista käyttöönoton kokemusta
- ✅ Dokumentaatiolinkit päivitetty yli 8 paikassa
- ✅ Esimerkkihakemisto vastaa tarkasti 4 paikallista esimerkkiä
- ✅ Ei päällekkäisiä ulkoisia linkkejä taulukoissa
- ✅ Kaikki navigointiviittaukset ovat oikein

#### Tekninen toteutus
- **Microsoft Foundry Models -arkkitehtuuri**: gpt-4.1 + Key Vault + Container Apps -malli
- **Turvallisuus**: Hallittu identiteetti valmiina, salaisuudet Key Vaultissa
- **Valvonta**: Application Insights -integraatio
- **Kustannusten hallinta**: Token-seuranta ja käytön optimointi
- **Käyttöönotto**: Yksi `azd up` -komento koko käyttöönotolle

### [v3.6.0] - 2025-11-19

#### Suuri päivitys: Container App -käyttöönottoesimerkit
**Tämä versio esittelee kattavat tuotantovalmiit konttisovellusten käyttöönottoesimerkit Azure Developer CLI -työkalulla (AZD), täydellisellä dokumentaatiolla ja integroituna oppimispolkuun.**

#### Lisätty
- **🚀 Container App -esimerkit**: Uudet paikalliset esimerkit kansiossa `examples/container-app/`:
  - [Pääopas](examples/container-app/README.md): Täydellinen yleiskatsaus konttikäyttöönottoihin, pika-aloitus, tuotanto ja kehittyneet mallit
  - [Yksinkertainen Flask API](../../examples/container-app/simple-flask-api): Aloittelijaystävällinen REST API, skaalaus nollaan, terveystarkastukset, valvonta ja vianmääritys
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices): Tuotantovalmiiksi monipalvelukäyttöön (API Gateway, Product, Order, User, Notification), asynkroninen viestintä, Service Bus, Cosmos DB, Azure SQL, hajautettu jäljitys, blue-green/canary-käyttöönotto
- **Parhaat käytännöt**: Turvallisuus, valvonta, kustannusten optimointi ja CI/CD-ohjeistus konttipohjaisille kuormille
- **Koodinäytteet**: Täydelliset `azure.yaml`, Bicep-mallit ja monikieliset palvelutoteutukset (Python, Node.js, C#, Go)
- **Testaus & Vianmääritys**: End-to-end testausvaihtoehdot, valvontakomennot, vianmääritysohjeet

#### Muutettu
- **README.md**: Päivitetty sisältämään ja linkittämään uudet container app -esimerkit kohdassa "Local Examples - Container Applications"
- **examples/README.md**: Päivitetty korostamaan container app -esimerkkejä, lisätty vertailumatriisin kohteita ja päivitetty teknologia-/arkkitehtuuriviittauksia
- **Kurssin rakenne & opas**: Päivitetty viittaamaan uusiin container app -esimerkkeihin ja käyttöönoton malleihin asiaankuuluvissa luvuissa

#### Varmennettu
- ✅ Kaikki uudet esimerkit voidaan ottaa käyttöön `azd up` -komennolla ja ne noudattavat parhaita käytäntöjä
- ✅ Dokumentaation ristiinlinkitykset ja navigointi päivitetty
- ✅ Esimerkit kattavat aloittelijoista edistyneiden skenaarioihin, mukaan lukien tuotannon mikropalvelut

#### Huomautuksia
- **Laajuus**: Vain englanninkieliset dokumentaatiot ja esimerkit
- **Seuraavat askeleet**: Laajenna lisätyillä edistyneillä container-malleilla ja CI/CD-automaatioilla tulevissa julkaisuissa

### [v3.5.0] - 2025-11-19

#### Tuotteen uudelleenbrändäys: Microsoft Foundry
**Tämä versio toteuttaa kattavan tuotenimen muutoksen "Microsoft Foundry" nimeen kaikessa englanninkielisessä dokumentaatiossa Microsoftin virallisen uudelleenbrändäyksen mukaisesti.**

#### Muutettu
- **🔄 Tuotenimen päivitys**: Täydellinen uudelleenbrändäys "Microsoft Foundry" nimeen
  - Kaikkien viittausten päivitys englanninkielisessä dokumentaatiossa kansiossa `docs/`
  - Kansion nimi muutettu: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Tiedoston nimi muutettu: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Yhteensä 23 sisältöviitettä päivitetty 7 dokumentaatiotiedostossa

- **📁 Kansion rakenteen muutokset**:
  - `docs/ai-foundry/` on nimetty uudelleen `docs/microsoft-foundry/`
  - Kaikki ristiinviittaukset päivitetty heijastamaan uutta kansiorakennetta
  - Navigointilinkit tarkistettu kaikissa dokumenteissa

- **📄 Tiedostojen uudelleennimetyt**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kaikki sisäiset linkit päivitetty uuteen tiedostonimeen

#### Päivitetyt tiedostot
- **Lukudokumentaatio** (7 tiedostoa):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigointilinkin päivitystä
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tuotenimen viittausta päivitetty
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Käytössä jo Microsoft Foundry (aikaisemmista päivityksistä)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 viittausta päivitetty (yleiskatsaus, yhteisöpalautteet, dokumentaatio)
  - `docs/getting-started/azd-basics.md` - 4 ristiinviittauksen päivitystä
  - `docs/getting-started/first-project.md` - 2 luvun navigointilinkin päivitystä
  - `docs/getting-started/installation.md` - 2 seuraavan luvun linkin päivitystä
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 viittausta päivitetty (navigointi, Discord-yhteisö)
  - `docs/troubleshooting/common-issues.md` - 1 navigointilinkin päivitys
  - `docs/troubleshooting/debugging.md` - 1 navigointilinkin päivitys

- **Kurssirakenteen tiedostot** (2 tiedostoa):
  - `README.md` - 17 viittausta päivitetty (kurssin yleiskatsaus, lukujen otsikot, malliosio, yhteisön näkemykset)
  - `course-outline.md` - 14 viittausta päivitetty (yleiskatsaus, oppimistavoitteet, lukuresurssit)

#### Varmennettu
- ✅ Ei jäljellä "ai-foundry" kansion polkuviittauksia englanninkielisessä dokumentaatiossa
- ✅ Ei jäljellä "Microsoft Foundry" tuotenimeä englanninkielisessä dokumentaatiossa
- ✅ Kaikki navigointilinkit toimivia uudessa kansiorakenteessa
- ✅ Tiedostojen ja kansioiden uudelleennimetyt sujuvasti suoritettu
- ✅ Lukuviittaukset keskenään varmennettu

#### Huomautuksia
- **Laajuus**: Muutokset koskevat vain englanninkielistä dokumentaatiota kansiossa `docs/`
- **Käännökset**: Käännöskansiot (`translations/`) eivät päivity tässä versiossa
- **Työpaja**: Työpajamateriaalit (`workshop/`) eivät päivity tässä versiossa
- **Esimerkit**: Esimerkkitiedostot saattavat edelleen sisältää vanhoja nimiviittauksia (korjataan tulevissa päivityksissä)
- **Ulkoiset linkit**: Ulkoiset URL-osoitteet ja GitHub-repositorioiden viitteet pysyvät ennallaan

#### Siirtymäopas kontribuoijille
Jos sinulla on paikallisia haaroja tai dokumentaatiota, joka viittaa vanhaan rakenteeseen:
1. Päivitä kansioviittaukset: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Päivitä tiedostoviittaukset: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Korvaa tuotenimi: "Microsoft Foundry" → "Microsoft Foundry"
4. Varmista, että kaikki sisäiset dokumentaatiolinkit toimivat edelleen

---

### [v3.4.0] - 2025-10-24

#### Infrastruktuurin esikatselu- ja varmennusparannukset
**Tämä versio tuo kattavan tuen uudelle Azure Developer CLI -esikatseluominaisuudelle ja parantaa työpajan käyttäjäkokemusta.**

#### Lisätty
- **🧪 azd provision --preview -ominaisuuden dokumentaatio**: Laaja kattavuus uudelle infrastruktuurin esikatselutoiminnolle
  - Komentoviittaukset ja käyttöesimerkit pikatiedostossa
  - Yksityiskohtainen integraatio provisiointiohjeessa käyttötapauksien ja hyötyjen kanssa
  - Esilennon tarkastuksen integraatio turvallisempaan käyttöönoton varmennukseen
  - Aloitusoppaan päivitykset turvallisuus edellä -käytännöillä
- **🚧 Työpajan tilailmoitusbanneri**: Ammattimainen HTML-banneri, joka ilmaisee työpajan kehitystilaa
  - Liukuvärisuunnittelu ja rakennusindikaattorit selkeään viestintään käyttäjille
  - Viimeksi päivitetty -aikaleima läpinäkyvyyttä varten
  - Mobiililaitteille joustava ulkoasu

#### Parannettu
- **Infrastruktuurin turvallisuus**: Esikatselutoiminto integroitu kattavasti dokumentaatioon
- **Ennen käyttöönottoa tehtävä varmennus**: Automaattiset skriptit sisältävät nyt infrastruktuurin esikatselutestit
- **Kehittäjän työnkulku**: Päivitetyt komentojaksot sisältävät esikatselun parhaana käytäntänä
- **Työpajan kokemus**: Selkeät odotukset käyttäjille sisältökehityksestä

#### Muutettu
- **Käyttöönoton parhaat käytännöt**: Esikatselu ensin -työnkulku nyt suositeltu menetelmä
- **Dokumentaation kulku**: Infrastruktuurin varmennus siirretty aiempaan vaiheeseen oppimisprosessissa
- **Työpajan esitys**: Ammattimainen tilaviestintä selkeän kehitysaikataulun kanssa

#### Parannettu
- **Turvallisuus ensin -lähestymistapa**: Infrastruktuurimuutokset voidaan nyt varmistaa ennen käyttöönottoa
- **Tiimiyhteistyö**: Esikatselutulokset voidaan jakaa tarkastelua ja hyväksyntää varten
- **Kustannustietoisuus**: Parempi resurssikustannusten ymmärrys ennen provisiointia
- **Riskejä vähentävä**: Käyttöönoton epäonnistumisia vähemmän ennakkovarmennuksen ansiosta

#### Tekninen toteutus
- **Monidokumenttinen integraatio**: Esikatselutoiminto dokumentoituna neljässä keskeisessä tiedostossa
- **Komentomallit**: Johdonmukainen syntaksi ja esimerkit koko dokumentaatiossa
- **Parhaiden käytäntöjen integrointi**: Esikatselu sisällytetty varmennustyönkulkuihin ja skripteihin
- **Visuaaliset osoittimet**: Selkeät UUSI-toiminnon merkinnät löydettävyyden parantamiseksi

#### Työpajan infrastruktuuri
- **Tilaviestintä**: Ammattimainen HTML-banneri liukuvärityksellä
- **Käyttäjäkokemus**: Selkeä kehitystilan ilmoitus estää sekaannukset
- **Ammattimainen esitystapa**: Säilyttää repositorion uskottavuuden ja asettaa odotukset
- **Aikataulun läpinäkyvyys**: Lokakuun 2025 viimeisin päivitysaikaleima vastuullisuutta varten

### [v3.3.0] - 2025-09-24

#### Parannetut työpajamateriaalit ja interaktiivinen oppimiskokemus
**Tämä versio sisältää kattavat työpajamateriaalit selainpohjaisen interaktiivisen oppaan ja rakenteellisten oppimispolkujen kera.**

#### Lisätty
- **🎥 Interaktiivinen työpajaopas**: Selainpohjainen työpajakokemus MkDocs-esikatselulla
- **📝 Rakenteelliset työpajaohjeet**: 7-vaiheinen opastettu oppimispolku tutustumisesta räätälöintiin
  - 0-Esittely: Työpajan yleiskatsaus ja asennus
  - 1-Valitse-AI-malli: Mallin löytäminen ja valintaprosessi
  - 2-Varmista-AI-malli: Käyttöönotto ja varmennusmenettelyt
  - 3-Puretaan-AI-malli: Mallin arkkitehtuurin ymmärtäminen
  - 4-Konfiguroi-AI-malli: Konfigurointi ja mukauttaminen
  - 5-Räätälöi-AI-malli: Edistyneet muokkaukset ja iteroinnit
  - 6-Infrastruktuurin purku: Siivous ja resurssien hallinta
  - 7-Yhteenveto: Yhteenveto ja seuraavat askeleet
- **🛠️ Työpajatyökalut**: MkDocs-konfiguraatio Material-teemalla parannetun oppimiskokemuksen takia
- **🎯 Käytännön oppimispolku**: 3-vaiheinen metodologia (löytö → käyttöönotto → räätälöinti)
- **📱 GitHub Codespaces -integraatio**: Saumaton kehitysympäristön asennus

#### Parannettu
- **AI-työpajalaboratorio**: Laajennettu kattavaan 2-3 tunnin rakenteelliseen oppimiskokemukseen
- **Työpajadokumentaatio**: Ammattimainen esitys navigaation ja visuaalisten apuvälineiden kera
- **Oppimisen eteneminen**: Selkeät askel askeleelta -ohjeet mallin valinnasta tuotantoon asti
- **Kehittäjäkokemus**: Integroitu työkaluketju sujuviin kehitystyönkulkuihin

#### Parannettu
- **Esteettömyys**: Selainpohjainen käyttöliittymä, haku, kopiointi ja teemavaihtoehdot
- **Omaehtoinen oppiminen**: Joustava työpajarakenne eri oppimistahtien tukemiseksi
- **Käytännön soveltaminen**: Todelliset tekoälymallin käyttöönoton skenaariot
- **Yhteisön integraatio**: Discord-integraatio työpajan tukeen ja yhteistyöhön

#### Työpajan ominaisuudet
- **Sisäänrakennettu haku**: Nopea avainsanahaku ja oppituntien löytäminen
- **Kopioi koodilohkot**: Hover-tilassa toimiva kopiointitoiminto kaikille koodiesimerkeille
- **Teemavaihto**: Tumma/vaalea tila käyttäjäasetusten mukaan
- **Visuaaliset materiaali**: Kuvakaappaukset ja kaaviot paremman ymmärryksen tukena
- **Ohjeintegraatio**: Suora pääsy Discord-yhteisöön tuen saamiseksi

### [v3.2.0] - 2025-09-17

#### Merkittävä navigaation uudelleenjärjestely ja lukuittainen oppimisjärjestelmä
**Tämä versio sisältää kokonaisvaltaisen lukuittaisen oppimisrakenteen parannettuna navigaatiossa koko repositoriossa.**

#### Lisätty
- **📚 Lukuittainen oppimisjärjestelmä**: Koko kurssi jäsennetty 8 etenevään oppimislukuun
  - Luku 1: Perusta & pika-aloitus (⭐ - 30-45 min)
  - Luku 2: AI-Ensimmäinen kehitys (⭐⭐ - 1-2 tuntia)
  - Luku 3: Konfigurointi & todennus (⭐⭐ - 45-60 min)
  - Luku 4: Infrastruktuuri koodina & käyttöönotto (⭐⭐⭐ - 1-1,5 tuntia)
  - Luku 5: Moniagenttiset tekoälyratkaisut (⭐⭐⭐⭐ - 2-3 tuntia)
  - Luku 6: Ennen käyttöönottoa tehtävä varmennus & suunnittelu (⭐⭐ - 1 tunti)
  - Luku 7: Vianmääritys & debuggaus (⭐⭐ - 1-1,5 tuntia)
  - Luku 8: Tuotanto & yritysmallit (⭐⭐⭐⭐ - 2-3 tuntia)
- **📚 Kattava navigointijärjestelmä**: Johdonmukaiset navigointipäätteet ja alatunnisteet kaikissa dokumenteissa
- **🎯 Edistymisen seuranta**: Kurssin suorituslista ja oppimisen varmennusjärjestelmä
- **🗺️ Oppimispolun ohjaus**: Selkeät aloituspisteet erilaisille kokemustasoille ja tavoitteille
- **🔗 Ristiinviittausnavigointi**: Aiheeseen liittyvät luvut ja edeltävät vaatimukset selkeästi linkitettyinä

#### Parannettu
- **README-rakenne**: Muokattu rakenteelliseksi oppimisalustaksi lukuittaisella organisoinnilla
- **Dokumentaation navigointi**: Jokaisella sivulla nyt lukukonteksti ja etenemisohjeet
- **Mallien organisointi**: Esimerkit ja mallit kartoitetaan asiaankuuluviin oppimislukuihin

- **Resurssien integrointi**: Huijausvihkot, UKK:t ja opiskelumateriaalit liittyen asiaankuuluviin lukuihin
- **Työpajaintegrointi**: Käytännön laboratoriot vastaamassa useita lukujen oppimistavoitteita

#### Muutettu
- **Oppimiskulku**: Siirtyminen lineaarisesta dokumentaatiosta joustavaan lukupohjaiseen oppimiseen
- **Konfiguraation sijoittaminen**: Konfiguraatio-opas siirretty luvuksi 3 paremman oppimisen sujuvuuden takia
- **AI-sisällön integrointi**: Parempi AI-spesifisen sisällön integrointi koko oppimismatkan ajan
- **Tuotannon sisältö**: Edistyneet mallit koottu lukuun 8 yrityskäyttäjille

#### Parannettu
- **Käyttäjäkokemus**: Selkeät navigointipolut ja luvun etenemisen osoittimet
- **Saavutettavuus**: Yhtenäiset navigointimallit helpottamaan kurssin läpikäyntiä
- **Ammatillinen esitys**: Yliopistotyyppinen kurssirakenne akateemiseen ja yrityskoulutukseen sopiva
- **Oppimistehokkuus**: Relevantin sisällön löytymiseen kuluvan ajan vähentäminen paremman organisoinnin avulla

#### Tekninen toteutus
- **Navigointipäätteet**: Standardoitu luvunavigointi yli 40 dokumentaatiotiedostossa
- **Alatunnisteen navigointi**: Johdonmukaiset etenemisen ohjeistukset ja luvun valmistumisindikaattorit
- **Ristiinlinkitys**: Kattava sisäinen linkitysjärjestelmä yhdistää aihepiirit
- **Luvun kartoitus**: Mallit ja esimerkit selkeästi sidottu oppimistavoitteisiin

#### Opasparannukset
- **📚 Kattavat oppimistavoitteet**: Opasstruktuuri uudistettu 8 luvun järjestelmään
- **🎯 Lukupohjainen arviointi**: Jokaisessa luvussa omat oppimistavoitteet ja käytännön harjoitukset
- **📋 Edistymisen seuranta**: Viikoittainen opintoaikataulu mitattavilla tuloksilla ja tarkistuslistoilla
- **❓ Arviointikysymykset**: Tietoisuuden validointikysymykset jokaiselle luvulle ammatillisilla tuloksilla
- **🛠️ Käytännön tehtävät**: Käytännön aktiviteetit todellisilla käyttöönotto- ja vianmääritystilanteilla
- **📊 Taitojen edistyminen**: Selkeä eteneminen peruskäsitteistä yritysmalliin urakehityksen painotuksella
- **🎓 Sertifiointikehys**: Ammatillisen kehityksen tulokset ja yhteisön tunnustamisjärjestelmä
- **⏱️ Aikataulun hallinta**: Rakenteellinen 10 viikon oppimissuunnitelma virstanpylväiden tarkastuksilla

### [v3.1.0] - 2025-09-17

#### Parannettu moniagenttinen AI-ratkaisu
**Tämä versio parantaa moniagenttista jälleenmyyntiratkaisua paremmalla agenttien nimeämisellä ja parannetulla dokumentaatiolla.**

#### Muutokset
- **Moniagenttiterminologia**: "Cora agent" korvattu "Customer agent" -termillä koko jälleenmyyntiratkaisussa selkeyden vuoksi
- **Agenttien arkkitehtuuri**: Päivitetty kaikki dokumentaatiot, ARM-mallit ja koodiesimerkit käyttämään yhtenäistä "Customer agent" nimeämistä
- **Konfiguraatioesimerkit**: Modernisoidut agentin konfigurointimallit päivitettyillä nimeämiskäytännöillä
- **Dokumentaation yhdenmukaisuus**: Varmistettu, että kaikki viittaukset käyttävät ammattimaisia, kuvaavia agenttien nimiä

#### Parannettu
- **ARM-mallipaketti**: Päivitetty retail-multiagent-arm-template käyttämään Customer agent -viittauksia
- **Arkkitehtuurikaaviot**: Päivitetty Mermaid-kaaviot uudella agenttien nimeämisellä
- **Koodiesimerkit**: Python-luokat ja toteutusesimerkit nyt CustomerAgent-nimeämisellä
- **Ympäristömuuttujat**: Päivitetty kaikki käyttöönoton skriptit käyttämään CUSTOMER_AGENT_NAME-konventioita

#### Parannettu
- **Kehittäjäkokemus**: Selkeämmät agenttien roolit ja vastuut dokumentaatiossa
- **Tuotantovalmius**: Parempi yhdenmukaisuus yritysnimeämiskäytäntöjen kanssa
- **Oppimateriaalit**: Intuitiivisempi agenttien nimeäminen koulutustarkoituksiin
- **Mallin käytettävyys**: Yksinkertaistettu agenttien toimintojen ja käyttöönottojen ymmärtäminen

#### Teknisiä tietoja
- Päivitetyt Mermaid-arkkitehtuurikaaviot CustomerAgent-viittauksilla
- Korvattu CoraAgent-luokkien nimet Python-esimerkeissä CustomerAgentillä
- Muokattu ARM-mallin JSON-konfiguraatiot käyttämään "customer"-agenttityyppiä
- Päivitetty ympäristömuuttujat CORA_AGENT_* -muodosta CUSTOMER_AGENT_* -malliin
- Päivitetyt kaikki käyttöönoton komennot ja konttikonfiguraatiot

### [v3.0.0] - 2025-09-12

#### Suuret muutokset - AI-kehittäjien painopiste ja Microsoft Foundry -integrointi
**Tämä versio muuttaa repositorion kattavaksi tekoälykeskeiseksi oppimateriaaliksi Microsoft Foundryn integraatiolla.**

#### Lisätty
- **🤖 AI-ensimmäinen oppimispolku**: Täydellinen rakenne uudelleen painopisteenä tekoälykehittäjät ja insinöörit
- **Microsoft Foundry -integrointiohje**: Kattava dokumentaatio AZD:n yhdistämiseksi Microsoft Foundry -palveluihin
- **AI-mallien käyttöönotto-mallit**: Yksityiskohtainen opas mallin valintaan, konfigurointiin ja tuotantokäyttöönottoon
- **AI-työpajatyö**: 2-3 tunnin käytännön työpaja AI-sovellusten muuttamiseksi AZD-käyttökelpoisiksi ratkaisuiksi
- **Tuotannon AI parhaat käytännöt**: Yrityskäyttöön soveltuvat mittakaava-, valvonta- ja suojausmallit
- **AI-spesifinen vianmääritysopas**: Kattava vianetsintä Microsoft Foundry -malleille, kognitiivisille palveluille ja AI-käyttöönotto-ongelmille
- **AI-malligalleria**: Microsoft Foundry -mallien kokoelma monimutkaisuusluokituksilla
- **Työpajamateriaalit**: Täydellinen työpajarakenne käytännön laboratorioineen ja viitemateriaaleineen

#### Parannettu
- **README-rakenne**: Tekoälykehittäjille suunnattu sisältö 45 % yhteisön mielenkiinnolla Microsoft Foundry Discordista
- **Oppimispolut**: Omistettu tekoälykehittäjien matka perinteisten opiskelijoiden ja DevOps-insinöörien rinnalla
- **Mallisuositukset**: Esitellyt AI-mallit, mukaan lukien azure-search-openai-demo, contoso-chat ja openai-chat-app-quickstart
- **Yhteisön integraatio**: Parannettu Discord-yhteisötuki AI-spesifeine kanavineen ja keskusteluineen

#### Tietoturva & tuotantovalmius
- **Hallintatunnusmallit**: Tekoälykohtaiset autentikointi- ja suojauskonfiguraatiot
- **Kustannusten optimointi**: Token-käytön seuranta ja budjettivalvonta AI-kuormituksille
- **Monialueinen käyttöönotto**: Strategiat globaaleihin AI-sovellusten käyttöönottoihin
- **Suorituskyvyn valvonta**: AI-spesifiset mittarit ja Application Insights -integraatio

#### Dokumentaation laatu
- **Lineaarinen kurssirakenne**: Looginen eteneminen aloittelijasta edistyneisiin AI-käyttöönoton malleihin
- **Vahvistetut URL-osoitteet**: Kaikki ulkoiset repositorion linkit varmennettu ja toimivia
- **Täydellinen viite**: Kaikki sisäiset dokumentaatiolinkit vahvistettu ja toimivia
- **Tuotantovalmius**: Yritystason käyttöönoton mallit todellisilla esimerkeillä

### [v2.0.0] - 2025-09-09

#### Suuret muutokset - versionhallinnan rakenne ja ammatillinen parannus
**Tämä versio edustaa merkittävää uudistusta repositorion rakenteessa ja sisällön esityksessä.**

#### Lisätty
- **Rakenteellinen oppimismalli**: Kaikki dokumentaatiot sivut sisältävät nyt johdanto-, oppimistavoite- ja oppimistulososioita
- **Navigointijärjestelmä**: Lisätty edellinen/seuraava oppitunti -linkit kaikkialle dokumentaatioon ohjatun oppimisen edistämiseksi
- **Opiskeluopas**: Kattava study-guide.md sisältäen oppimistavoitteet, käytännön harjoitukset ja arviointimateriaalit
- **Ammatillinen ulkoasu**: Poistettu kaikki emoji-ikonit saavutettavuuden ja ammattimaisen ilmeen parantamiseksi
- **Parannettu sisällön rakenne**: Oppimateriaalien parempi organisointi ja sujuvuus

#### Muutettu
- **Dokumentaatiomuoto**: Standardoitu kaikki dokumentaatiot yhtenäiseen oppimiskeskeiseen rakenteeseen
- **Navigointivirtaus**: Toteutettu looginen eteneminen kaikissa oppimateriaaleissa
- **Sisällön esitys**: Poistettu koristeellisia elementtejä selkeän, ammatillisen muotoilun hyväksi
- **Linkkirakenne**: Päivitetty kaikki sisäiset linkit tukemaan uutta navigointijärjestelmää

#### Parannettu
- **Saavutettavuus**: Poistettu emojien käyttö parempaa ruudunlukijan yhteensopivuutta varten
- **Ammatillinen ulkoasu**: Selkeä, akateeminen esitystapa yrityskoulutukseen soveltuva
- **Oppimiskokemus**: Rakenteellinen lähestymistapa jokaisella oppitunnilla selkeine tavoitteineen ja tuloksineen
- **Sisällön organisointi**: Parempi looginen kulku ja yhteys aiheiden välillä

### [v1.0.0] - 2025-09-09

#### Ensijulkaisu - Kattava AZD-oppimisrepositorio

#### Lisätty
- **Perusdokumentaation rakenne**
  - Täydellinen opas aloitukseen
  - Kattava käyttöönotto- ja provisiointidokumentaatio
  - Yksityiskohtaiset vianetsintäresurssit ja debuggausohjeet
  - Ennen käyttöönottoa suoritettavat varmennustyökalut ja -menettelyt

- **Aloitusmoduuli**
  - AZD:n perusteet: Keskeiset käsitteet ja termistö
  - Asennusopas: Alustakohtaiset asennusohjeet
  - Konfiguraatio-opas: Ympäristön asennus ja autentikointi
  - Ensimmäisen projektin opas: vaiheittainen käytännön oppiminen

- **Käyttöönotto ja provisiointi**
  - Käyttöönotto-opas: Täydellinen työnkulun dokumentaatio
  - Provisiointiopas: Infrastructure as Code Bicepillä
  - Parhaat käytännöt tuotantokäyttöön
  - Monipalveluarkkitehtuurin mallit

- **Ennen käyttöönottoa varmistus**
  - Kapasiteetin suunnittelu: Azure-resurssien saatavuuden tarkistus
  - SKU-valinta: Kattava ohjeistus palvelutasoista
  - Pre-flight-tarkistukset: Automatisoidut varmistusskriptit (PowerShell ja Bash)
  - Kustannusarviointi ja budjetointityökalut

- **Vianmääritysmoduuli**
  - Yleiset ongelmat: Usein esiintyvät vikatilanteet ja ratkaisut
  - Debuggausopas: Järjestelmälliset vianetsintämenetelmät
  - Edistyneet diagnostiikkatekniikat ja työkalut
  - Suorituskyvyn seuranta ja optimointi

- **Resurssit ja viitteet**
  - Komentojen pikaopas: Pikaopas olennaisiin komentoihin
  - Sanasto: Kattava termistö ja akronyymit
  - Usein kysytyt kysymykset: Yksityiskohtaiset vastaukset yleisiin kysymyksiin
  - Ulkoiset resurssilinkit ja yhteisöyhteydet

- **Esimerkit ja mallit**
  - Yksinkertainen web-sovellus-esimerkki
  - Staattisen verkkosivuston käyttöönotto malli
  - Konttisovelluksen konfigurointi
  - Tietokantaintegraatiomallit
  - Mikkropalveluarkkitehtuurin esimerkit
  - Palvelimettomat funktiototeutukset

#### Ominaisuudet
- **Monialustatuki**: Asennus- ja konfiguraatio-oppaat Windowsille, macOS:lle ja Linuxille
- **Monitasoinen osaaminen**: Sisältö suunniteltu opiskelijoista ammattilaiskehittäjiin
- **Käytännönläheisyys**: Käytännön esimerkit ja todelliset skenaariot
- **Kattava kattaus**: Peruskäsitteistä edistyneisiin yritysmalleihin
- **Tietoturvakeskeisyys**: Tietoturvan parhaat käytännöt integroituna koko materiaaliin
- **Kustannusoptimointi**: Ohjeistus kustannustehokkaaseen käyttöönottoon ja resurssien hallintaan

#### Dokumentaation laatu
- **Yksityiskohtaiset koodiesimerkit**: Käytännön, testatut koodinäytteet
- **Vaiheittaiset ohjeet**: Selkeät ja käytännönläheiset ohjeistukset
- **Kattava virheiden käsittely**: Vianmääritys yleisille ongelmille
- **Parhaiden käytäntöjen integrointi**: Alan standardit ja suositukset
- **Versioyhteensopivuus**: Ajantasainen uusimpien Azure-palveluiden ja azd-ominaisuuksien kanssa

## Suunnitellut tulevat parannukset

### Versio 3.1.0 (Suunnitteilla)
#### AI-alustan laajennus
- **Monimallituen**: Integraatiomallit Hugging Face:lle, Azure Machine Learningille ja räätälöidyille malleille
- **AI-agenttikehykset**: Mallit LangChainille, Semantic Kernelille ja AutoGen-käyttöönottoihin
- **Edistyneet RAG-mallit**: Vektoritietokantavaihtoehdot Azure AI Searchin ulkopuolelle (Pinecone, Weaviate jne.)
- **AI-valvonta**: Parannettu valvonta mallien suorituskyvystä, tokenien käytöstä ja vastausten laadusta

#### Kehittäjäkokemus
- **VS Code -laajennus**: Integroitu AZD + Microsoft Foundry kehitysympäristö
- **GitHub Copilot -integraatio**: AI-avusteinen AZD malligeneraattori
- **Interaktiiviset opastukset**: Käytännön koodausharjoitukset automaattisella validoinnilla AI-skenaarioissa
- **Videomateriaali**: Täydennyssarjat video-opastuksille visuaalisille oppijoille AI-käyttöönoissa

### Versio 4.0.0 (Suunnitteilla)
#### Yrityksen AI-mallit
- **Hallintakehys**: AI-mallien hallinta, vaatimustenmukaisuus ja auditointilokit
- **Monivuokrainen AI**: Mallit useiden asiakkaiden palvelemiseksi eriytetyillä AI-palveluilla
- **Edge AI -käyttöönottorakenne**: Integraatiot Azure IoT Edgen ja kontti-instanssien kanssa
- **Hybridipilvi AI**: Monipilvi- ja hybridikäyttöönoton mallit AI-kuormille

#### Edistyneet ominaisuudet
- **AI-putkiston automaatio**: MLOps-integraatio Azure Machine Learning -putkistoilla
- **Edistynyt tietoturva**: Zero-trust-mallit, yksityiset päätepisteet ja kehittynyt uhkasuojaus
- **Suorituskyvyn optimointi**: Edistyneet hienosäätö- ja skaalausstrategiat suurille AI-sovelluksille
- **Globaali jakelu**: Sisällön toimitus ja edge-välimuistit AI-sovelluksille

### Versio 3.0.0 (Suunniteltu) - Korvattu nykyisellä julkaisulla
#### Ehdotetut lisäykset - Nyt toteutettu versiossa 3.0.0
- ✅ **AI-keskeinen sisältö**: Kattava Microsoft Foundry -integraatio (Valmis)
- ✅ **Interaktiiviset opetusohjelmat**: Käytännön AI-työpajalaboratorio (Valmis)
- ✅ **Edistynyt tietoturvamoduuli**: AI-spesifiset tietoturvamallit (Valmis)
- ✅ **Suorituskyvyn optimointi**: AI-kuormien hienosäätöstrategiat (Valmis)

### Versio 2.1.0 (Suunniteltu) - Osittain toteutettu versiossa 3.0.0
#### Pienet parannukset - Osa toteutettu nykyisessä julkaisussa
- ✅ **Lisää esimerkkejä**: AI-käyttöönottoja koskevat skenaariot (Valmis)
- ✅ **Laajennettu FAQ**: AI-spesifiset kysymykset ja vianmääritykset (Valmis)
- **Työkalujen integraatio**: Parannettu IDE- ja editori-integraatio-oppaat
- ✅ **Valvonnan laajennus**: AI-spesifiset valvonta- ja hälytysmallit (Valmis)

#### Suunnitteilla edelleen tulevaan julkaisuun
- **Mobiiliystävällinen dokumentaatio**: Responsiivinen suunnittelu mobiilioppimiseen
- **Offline-pääsy**: Ladattavat dokumentaatiosarjat
- **Parannettu IDE-integraatio**: VS Code -laajennus AZD + AI työnkuluille
- **Yhteisön hallintapaneeli**: Reaaliaikaiset yhteisömetriikat ja osallistumisen seuranta

## Muutosten raportointi

### Muutosten ilmoittaminen
Kun osallistut tähän repositorioon, varmista että muutosehdotuksissa on mukana:

1. **Versiopäivä**: Noudattamalla semanttista versiointia (major.minor.patch)
2. **Päivämäärä**: Julkaisun tai päivityksen päivämäärä muodossa YYYY-MM-DD
3. **Kategoria**: Lisätty, Muutettu, Vanhentunut, Poistettu, Korjattu, Tietoturva
4. **Selkeä kuvaus**: Ytimekäs kuvaus tehdyistä muutoksista
5. **Vaikutusten arviointi**: Kuvaus miten muutokset vaikuttavat olemassa oleviin käyttäjiin

### Muutosten kategoriat

#### Lisätty
- Uudet ominaisuudet, dokumentaatioosiot tai mahdollisuudet
- Uudet esimerkit, mallit tai oppimisresurssit
- Lisätyt työkalut, skriptit tai apuohjelmat

#### Muutettu
- Muutokset olemassa olevaan toiminnallisuuteen tai dokumentaatioon
- Päivitykset selkeyden tai tarkkuuden parantamiseksi
- Sisällön tai organisoinnin uudelleenjärjestely

#### Vanhentunut
- Ominaisuudet tai menetelmät, jotka poistuvat käytöstä
- Dokumentaation osat, joiden suunniteltu poistaminen on meneillään
- Menetelmät, joilla on parempia vaihtoehtoja

#### Poistettu
- Ominaisuudet, dokumentaatio tai esimerkit, jotka eivät ole enää relevantteja
- Vanhentuneet tiedot tai käyttökelvottomat menetelmät
- Toistuva tai yhdistetty sisältö

#### Korjattu
- Virheiden korjaukset dokumentaatiossa tai koodissa
- Raportoitujen ongelmien ratkaisut
- Tarkkuuden tai toiminnallisuuden parannukset


#### Tietoturva
- Tietoturvaan liittyvät parannukset tai korjaukset
- Päivitykset tietoturvan parhaisiin käytäntöihin
- Tietoturva-aukkojen ratkaisut

### Semanttisen versionhallinnan ohjeet

#### Merkittävä versio (X.0.0)
- Taaksepäin yhteensopimattomat muutokset, jotka vaativat käyttäjän toimenpiteitä
- Sisällön tai järjestelyn merkittävä uudelleenrakentaminen
- Muutokset, jotka muuttavat perustavanlaatuista lähestymistapaa tai menetelmää

#### Pienempi versio (X.Y.0)
- Uudet ominaisuudet tai sisällön lisäykset
- Parannukset, jotka säilyttävät yhteensopivuuden aiempien versioiden kanssa
- Lisäesimerkit, työkalut tai resurssit

#### Korjausversio (X.Y.Z)
- Virheenkorjaukset ja korjaukset
- Pienet parannukset olemassa olevaan sisältöön
- Selvennykset ja pienet parannukset

## Yhteisön palaute ja ehdotukset

Kannustamme aktiivisesti yhteisön palautteeseen tämän oppimateriaalin parantamiseksi:

### Palautteen antaminen
- **GitHub Issues**: Raportoi ongelmista tai ehdota parannuksia (tekoälyyn liittyvät aiheet ovat tervetulleita)
- **Discord-keskustelut**: Jaa ideoita ja osallistu Microsoft Foundry -yhteisön keskusteluihin
- **Pull Requests**: Tee suoria parannuksia sisältöön, erityisesti tekoälymalleihin ja oppaisiin
- **Microsoft Foundry Discord**: Osallistu #Azure-kanavalle AZD- ja tekoälykeskusteluihin
- **Yhteisöfoorumit**: Osallistu laajempiin Azure-kehittäjäkeskusteluihin

### Palautteen luokat
- **Tekoälysisällön tarkkuus**: Korjaukset tekoälypalveluiden integrointi- ja käyttöönotto-ohjeisiin
- **Oppimiskokemus**: Ehdotukset tekoälykehittäjien oppimispolun parantamiseksi
- **Puuttuva tekoälysisältö**: Pyynnöt lisätä tekoälymalleja, -kaavoja tai esimerkkejä
- **Saavutettavuus**: Parannukset erilaisten oppijoiden tarpeisiin
- **Tekoälytyökalujen integraatio**: Ehdotukset paremman tekoälykehitystyönkulun integroimiseksi
- **Tuotantotekoälykaavat**: Yritystekoälyn käyttöönottoon liittyvät kaavapyyntöjä

### Vastauslupaus
- **Ongelmien käsittely**: Vastaus 48 tunnin sisällä ilmoitetuista ongelmista
- **Ominaisuuspyynnöt**: Arviointi viikon sisällä
- **Yhteisöpanokset**: Tarkastelu viikon sisällä
- **Tietoturvaongelmat**: Välitön prioriteetti ja nopeutettu vastaus

## Huoltoaikataulu

### Säännölliset päivitykset
- **Kuukausittaiset tarkistukset**: Sisällön tarkkuus ja linkkien vahvistus
- **Neljännesvuosipäivitykset**: Merkittävät sisältölisäykset ja -parannukset
- **Puolivuosittaiset katsaukset**: Kokonaisvaltainen uudelleenjärjestely ja parannus
- **Vuosijulkaisut**: Merkittävän version päivitykset merkittävillä parannuksilla

### Seuranta ja laadunvarmistus
- **Automaattitestit**: Säännöllinen koodiesimerkkien ja linkkien validointi
- **Yhteisöpalauteintegraatio**: Käyttäjien ehdotusten säännöllinen sisällyttäminen
- **Teknologiapäivitykset**: Yhdenmukaisuus uusimpien Azure-palveluiden ja azd-julkaisujen kanssa
- **Saavutettavuusauditoinnit**: Säännöllinen tarkistus inklusiivisen suunnittelun periaatteille

## Versiontuen käytäntö

### Nykyinen version tuki
- **Uusin merkittävä versio**: Täysi tuki säännöllisillä päivityksillä
- **Edellinen merkittävä versio**: Tietoturvapäivitykset ja kriittiset korjaukset 12 kuukauden ajan
- **Vanhemmat versiot**: Vain yhteisön tuki, ei virallisia päivityksiä

### Siirtymäohjeet
Kun merkittäviä versioita julkaistaan, tarjoamme:
- **Siirtymäoppaat**: Vaiheittaiset ohjeet siirtymiseen
- **Yhteensopivuustiedot**: Tiedot taaksepäin yhteensopimattomista muutoksista
- **Työkalutuki**: Skriptit tai apuvälineet siirtymän helpottamiseksi
- **Yhteisön tuki**: Omistetut foorumit siirtymää koskeville kysymyksille

---

**Navigointi**
- **Edellinen oppitunti**: [Opas](resources/study-guide.md)
- **Seuraava oppitunti**: Palaa [Pää README](README.md) -tiedostoon

**Pysy ajan tasalla**: Seuraa tätä repositoriota saadaksesi ilmoituksia uusista julkaisuista ja tärkeistä päivityksistä oppimateriaaleihin.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->