# Muutuste logi - AZD Algajatele

## Sissejuhatus

See muutuste logi dokumenteerib kõik olulised muudatused, uuendused ja täiustused AZD Algajatele hoidlas. Järgime semantilise versioonihaldamise põhimõtteid ning hoiame seda logi, et aidata kasutajatel mõista, mis on versioonide vahel muutunud.

## Õpieesmärgid

Selle muutuste logi läbivaatamisega:
- Olete kursis uute funktsioonide ja sisuliste täiendustega
- Mõistate olemasoleva dokumentatsiooni parandusi
- Jälgite vigade parandusi ja korrektuure täpsuse tagamiseks
- Järgite õppematerjalide arengut aja jooksul

## Õpitulemused

Muutuste logi kirjeid läbi vaadates saate:
- Tuvastada uue sisu ja õppematerjalid
- Mõista, milliseid sektsioone on uuendatud või täiustatud
- Planeerida oma õppeteed vastavalt kõige värskematele materjalidele
- Anda tagasisidet ja ettepanekuid tulevikus tehtavateks täiustusteks

## Versiooniajalugu

### [v3.17.0] - 2026-02-05

#### Kursuse navigeerimise täiustus
**See versioon täiustab README.md peatükkide navigeerimist täiendatud tabelivorminguga.**

#### Muudetud
- **Kursuse kaardi tabel**: Täiustatud otseteede, kestuse hinnangute ja keerukuse hinnangutega
- **Kausta puhastus**: Eemaldatud mittevajalikud vanad kaustad (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Lingikontroll**: Kõik 21+ sisemist linki kursuse kaardi tabelis kontrollitud

### [v3.16.0] - 2026-02-05

#### Toote nimetuste uuendused
**See versioon uuendab tooteviiteid vastavalt Microsofti praegusele brändingule.**

#### Muudetud
- **Azure AI Foundry → Microsoft Foundry**: Kõik viited uuendatud tõlkimata failides üle kogu hoidla
- **Azure AI Agent Service → Foundry Agents**: Teenuse nimi uuendatud vastavalt praegusele brändingule

#### Uuendatud failid
- `README.md` - Peamine kursuse avaleh
- `changelog.md` - Versiooniajalugu
- `course-outline.md` - Kursuse struktuur
- `docs/chapter-02-ai-development/agents.md` - AI agentide juhend
- `examples/README.md` - Näidisdokumentatsioon
- `workshop/README.md` - Töötuba avaleh
- `workshop/docs/index.md` - Töötuba indeks
- `workshop/docs/instructions/*.md` - Kõik töötuba juhendid

---

### [v3.15.0] - 2026-02-05

#### Hoidla põhjalik ümberkorraldus: peatükkidealused kaustanimed
**See versioon korraldab dokumentatsiooni ümber eraldi peatükkide kaustadeks, et tagada selgem navigeerimine.**

#### Kaustanimed muudetud
Vanimad kaustad asendatud peatükkidel põhinevate numbritega:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lisatud uus: `docs/chapter-05-multi-agent/`

#### Failide teisaldused
| Fail | Algne asukoht | Uus asukoht |
|------|---------------|-------------|
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
| Kõik pre-deployment failid | pre-deployment/ | chapter-06-pre-deployment/ |
| Kõik troubleshooting failid | troubleshooting/ | chapter-07-troubleshooting/ |

#### Lisatud
- **📚 Peatüki README failid**: Igas peatüki kaustas loodud README.md koos:
  - Õpieesmärkide ja kestuse info
  - Tunni tabel koos kirjeldustega
  - Kiire algus käsud
  - Navigeerimine teiste peatükkide vahel

#### Muudetud
- **🔗 Kõik siselinkid uuendatud**: 78+ rada uuendatud kogu dokumentatsioonis
- **🗺️ Peamine README.md**: Kursuse kaardi värskendus uue peatükkide struktuuriga
- **📝 examples/README.md**: Täiendatud ristviited peatükkide kaustadele

#### Eemaldatud
- Vana kaustastruktuur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Hoidla ümberkorraldus: peatükkide navigeerimine
**See versioon lisas peatükkide navigeerimise README failid (asendatud versiooniga v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Uus AI agentide juhend
**See versioon lisab kõikehõlmava juhendi AI agentide juurutamiseks Azure Developer CLI abil.**

#### Lisatud
- **🤖 docs/microsoft-foundry/agents.md**: Täielik juhend sisaldab:
  - Mis on AI agendid ja kuidas nad erinevad vestlusrobotitest
  - Kolm kiire alustamise agentide malli (Foundry Agents, Prompty, RAG)
  - Agendi arhitektuuri mustrid (ühest agent, RAG, mitmeagentuurne)
  - Tööriista seadistamine ja kohandamine
  - Jälgimine ja mõõdikute kogumine
  - Kulude kaalutlused ja optimeerimine
  - Tavalised tõrkeotsingu stsenaariumid
  - Kolm praktilist harjutust koos õnnestumiskriteeriumitega

#### Sisukorra struktuur
- **Sissejuhatus**: Agentide kontseptsioonid algajatele
- **Kiire käivitamine**: Agentide juurutamine käsuga `azd init --template get-started-with-ai-agents`
- **Arhitektuuri mustrid**: Visuaalsed diagrammid agentide mustritest
- **Seadistamine**: Tööriista sisseseadmine ja keskkonnamuutujad
- **Jälgimine**: Application Insights integratsioon
- **Harjutused**: Progressiivne praktiline õppimine (20-45 minutit igaüks)

---

### [v3.12.0] - 2026-02-05

#### DevContainer keskkonna uuendus
**See versioon uuendab arenduskonteineri konfiguratsiooni kaasaegsete tööriistade ja paremate vaikeseadistustega AZD õppimiskogemuse jaoks.**

#### Muudetud
- **🐳 Aluspilt**: Uuendatud `python:3.12-bullseye` pealt `python:3.12-bookworm` peale (Debian'i uusim stabiilne versioon)
- **📛 Konteineri nimi**: Muudetud "Python 3" → "AZD for Beginners" selguse huvides

#### Lisatud
- **🔧 Uued DevContainer funktsioonid**:
  - `azure-cli` koos Bicep toe lubamisega
  - `node:20` (AZD mallide LTS versioon)
  - `github-cli` mallide haldamiseks
  - `docker-in-docker` konteinerirakenduste juurutamiseks

- **🔌 Pordiedastus**: Eelseadistatud pordid sagedaseks arenduseks:
  - 8000 (MkDocs eelvaade)
  - 3000 (Veebirakendused)
  - 5000 (Python Flask)
  - 8080 (API-d)

- **🧩 Uued VS Code laiendused**:
  - `ms-python.vscode-pylance` - täiustatud Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure funktsioonide tugi
  - `ms-azuretools.vscode-docker` - Docker tugi
  - `ms-azuretools.vscode-bicep` - Bicep keele tugi
  - `ms-azure-devtools.azure-resource-groups` - Azure ressursside haldus
  - `yzhang.markdown-all-in-one` - Markdown'i redigeerimine
  - `DavidAnson.vscode-markdownlint` - Markdown'i vormistus
  - `bierner.markdown-mermaid` - Mermaid diagrammide tugi
  - `redhat.vscode-yaml` - YAML tugi (azure.yaml jaoks)
  - `eamodio.gitlens` - Git visualiseerimine
  - `mhutchie.git-graph` - Git ajalugu

- **⚙️ VS Code seaded**: Vaikimisi sätted Python interpreteri, salvestamisel vormindamise ja tühikute eemaldamise jaoks

- **📦 Uuendatud requirements-dev.txt**:
  - Lisatud MkDocs minify plugin
  - Lisatud pre-commit koodi kvaliteedi tagamiseks
  - Lisatud Azure SDK paketid (azure-identity, azure-mgmt-resource)

#### Parandatud
- **Post-Create käsk**: Nüüd kontrollib AZD ja Azure CLI olemasolu konteineri käivitamisel

---

### [v3.11.0] - 2026-02-05

#### Algajatele sõbralik README ümberehitus
**See versioon parandab README.md oluliselt, et olla algajatele ligipääsetavam ja lisab olulised ressursid AI arendajatele.**

#### Lisatud
- **🆚 Azure CLI vs AZD võrdlus**: Selge seletus, millal iga tööriista kasutada koos praktiliste näidetega
- **🌟 Vägevad AZD lingid**: Otse lingid kogukonna mallide galeriisse ja panustamise ressurssidesse:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ kohe kasutusvalmis malli
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Kogukonna panustamine
- **🎯 Kiire algus juhend**: Lihtsustatud 3-astmeline algus (Installi → Logi sisse → Juuruta)
- **📊 Kogemuspõhine navigeerimistabel**: Selge juhend, kust alustada vastavalt arenduskogemusele

#### Muudetud
- **README struktuur**: Ümber korraldatud järkjärguliseks avamiseks - esmalt võtmeinfore
- **Sissejuhatus**: Ümber kirjutatud, et selgitada „The Magic of `azd up`“ täiesti algajatele
- **Duplicate sisu eemaldamine**: Korduv tõrkeotsingu sektsioon eemaldatud
- **Tõrkeotsingu käsud**: Parandatud `azd logs` viited kehtivaks `azd monitor --logs` käsuks

#### Parandatud
- **🔐 Autentimiskäsud**: Lisatud `azd auth login` ja `azd auth logout` cheat-sheet.md faili
- **Vigased käsuviited**: Eemaldatud ülejäänud `azd logs` README tõrkeotsingu sektsioonist

#### Märkused
- **Uuenduste ulatus**: Muudatused tehtud põhimõtteliselt README.md ja resources/cheat-sheet.md failides
- **Sihtgrupp**: Täiustused suunatud spetsiaalselt AZD kasutusega algajatele arendajatele

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI käskude täpsustuste uuendus
**See versioon parandab dokumentatsioonis mittekohalduvaid AZD käske, tagades kõigi koodinäidete vastavuse kehtiva Azure Developer CLI süntaksiga.**

#### Parandatud
- **🔧 Mittesobivad AZD käsud eemaldatud**: Ulatuslik audit ja vale käskude parandused:
  - `azd logs` (puudub) → asendatud käskudega `azd monitor --logs` või Azure CLI alternatiividega
  - `azd service` alamkäsud (puuduvad) → asendatud `azd show` ja Azure CLI-ga
  - `azd infra import/export/validate` (puuduvad) → eemaldatud või asendatud kehtivatega
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` lipud (puuduvad) → eemaldatud
  - `azd provision --what-if/--rollback` lipud (puuduvad) → uuendatud `--preview` kasutamiseks
  - `azd config validate` (puudub) → asendatud `azd config list`-ga
  - `azd info`, `azd history`, `azd metrics` (puuduvad) → eemaldatud

- **📚 Failid uuendatud käsukorrektsioonide järgi**:
  - `resources/cheat-sheet.md`: Suur käsurea viitamise ülevaatus
  - `docs/deployment/deployment-guide.md`: Parandatud rollback ja juurutusstrateegiad
  - `docs/troubleshooting/debugging.md`: Parandatud logi analüüsi sektsioonid
  - `docs/troubleshooting/common-issues.md`: Uuendatud tõrkeotsingu käske
  - `docs/troubleshooting/ai-troubleshooting.md`: Parandatud AZD silumissektsioon
  - `docs/getting-started/azd-basics.md`: Parandatud jälgimiskäske
  - `docs/getting-started/first-project.md`: Uuendatud jälgimise ja silumise näited
  - `docs/getting-started/installation.md`: Parandatud abi ja versiooni näited
  - `docs/pre-deployment/application-insights.md`: Parandatud logide vaatamise käsud
  - `docs/pre-deployment/coordination-patterns.md`: Parandatud agentide silumise käsud

- **📝 Versiooniviite uuendus**:
  - `docs/getting-started/installation.md`: Muudetud kõva koodi versioon `1.5.0` üldiseks `1.x.x` koos linkidega väljalasetele

#### Muudetud
- **Rollback strateegiad**: Dokumentatsiooni uuendatud kasutama Git-põhist rollbacki (AZD ei toeta natiivset rollbacki)
- **Logide vaatamine**: Asendatud `azd logs` viited käskudega `azd monitor --logs`, `azd monitor --live` ja Azure CLI käskudega
- **Jõudluse sektsioon**: Eemaldatud mittekohaldatavad paralleelsed ja järk-järguline juurutamise lipud, lisatud kehtivad alternatiivid

#### Tehnilised üksikasjad
- **Kehtivad AZD käsud**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Kehtivad azd monitor lipud**: `--live`, `--logs`, `--overview`
- **Eemaldatud funktsioonid**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Märkused
- **Kontrollimine**: Käsud kinnitatud Azure Developer CLI v1.23.x vastu

---

### [v3.9.0] - 2026-02-05

#### Töötuba lõpetamine ja dokumentatsiooni kvaliteedi uuendus
**See versioon lõpetab interaktiivsed töötoa moodulid, parandab kõik katkenud dokumentatsiooni lingid ning parandab Microsoft AZD-d kasutavate AI arendajate jaoks kogu sisu kvaliteeti.**

#### Lisatud
- **📝 CONTRIBUTING.md**: Uus panustamisjuhenditega dokument koos:
  - Selgete juhistega probleemide teatamiseks ja muudatuste ettepanekuks
  - Uue sisu dokumentatsioonistandardid
  - Koodi näidete juhised ja commit sõnumite konventsioonid
  - Kogukonna kaasamise info

#### Lõpetatud
- **🎯 Töötuba Moodul 7 (Kokkuvõte)**: Täielikult lõpetatud kokkuvõtte moodul koos:
  - Ülevaadliku kokkuvõttega töötoa saavutustest
  - Peamised omandatud mõisted AZD, mallide ja AI Foundry kohta
  - Soovitused õppe jätkamiseks
  - Töötuba väljakutsed koos raskusastme hinnangutega
  - Kogukonna tagasiside ja tugilingid

- **📚 Töötuba Moodul 3 (Analüüs)**: Uuendatud õpieesmärgid koos:
  - GitHub Copilot MCP serveritega aktiveerimise juhendiga
  - AZD mallide kausta struktuuri mõistmine
  - Infrastrukturikoodi (Bicep) organiseerimise mustrid
  - Käed-külge laborijuhised

- **🔧 Töötuba Moodul 6 (Lammutamine)**: Lõpetatud koos:
  - Ressursside puhastamise ja kuluhalduse eesmärkidega
  - `azd down` kasutamine infrastruktuuri turvaliseks desprovisioneerimiseks
  - Pehmemalt kustutatud kognitiivsete teenuste taastamise juhendiga
  - Lisapunktide uurimissoovitused GitHub Copiloti ja Azure Portaali jaoks

#### Parandatud
- **🔗 Katkenud linkide parandused**: Lõpetatud 15+ katkenud siseste dokumentatsiooni linki:
  - `docs/ai-foundry/ai-model-deployment.md`: Parandatud teed microsoft-foundry-integration.md-le
  - `docs/troubleshooting/ai-troubleshooting.md`: Parandatud ai-model-deployment.md ja production-ai-practices.md teed
  - `docs/getting-started/first-project.md`: Asendatud puuduv cicd-integration.md deployment-guide.md-ga
  - `examples/retail-scenario.md`: Parandatud KKK ja tõrkeotsingu juhendi viited
  - `examples/container-app/microservices/README.md`: Parandatud kursuse kodu ja deployment guide teed
  - `resources/faq.md` ja `resources/glossary.md`: Uuendatud AI peatükkide viited
  - `course-outline.md`: Parandatud juhendaja juhend ja AI töötoa labori viited

- **📅 Töötuba staatuse bänner**: Uuendatud olek "Ehitusjärgus" pealt aktiivseks kaheksandaks kuuks 2026

- **🔗 Töötuba navigeerimine**: Parandatud katkised navigeerimislingid töötoa README.md-s, mis osutasid puuduvatele lab-1-azd-basics kaustale

#### Muudetud
- **Töötoa esitlus**: Eemaldatud "ehitusjärgus" hoiatustekst, töötuba on täielikult lõpetatud ja kasutamiseks valmis
- **Navigeerimise järjepidevus**: Tagatud kõigis töötoa moodulites sobiv moodulitevaheline navigeerimine
- **Õppeteede viited**: Uuendatud peatükkide ristviited kasutama õigeid microsoft-foundry teid

#### Kinnitatud
- ✅ Kõik inglise keeles markdown failid sisaldavad kehtivaid siselinke
- ✅ Töötoa moodulid 0-7 on lõpetatud koos õpieesmärkidega
- ✅ Peatükkide ja moodulite vaheline navigeerimine töötab korrektselt
- ✅ Sisu sobib Microsoft AZD-d kasutavate AI arendajate jaoks
- ✅ Algajale sobiv keel ja struktuur on kogu dokumentatsioonis säilinud
- ✅ CONTRIBUTING.md annab selged juhised kogukonna panustajatele

#### Tehniline realiseerimine
- **Linkide valideerimine**: Automaatne PowerShell skript kontrollis kõiki .md siselinke
- **Sisu audit**: Töötoa täielikkuse ja algajasõbralikkuse käsitsi ülevaatus
- **Navigeerimissüsteem**: Järjepidevad peatükkide ja moodulite navigeerimismustrid rakendatud

#### Märkused
- **Ulatus**: Muudatused rakendatud ainult inglise keelsele dokumentatsioonile
- **Tõlked**: Tõlkekaustad ei ole selles versioonis uuendatud (automatiseeritud tõlge sünkroonitakse hiljem)
- **Töötoa kestus**: Täielik töötuba pakub nüüd 3–4 tundi praktilist õppimist

---

### [v3.8.0] - 2025-11-19

#### Täiustatud dokumentatsioon: Jälgimine, turvalisus ja mitmeagendi mustrid
**See versioon lisab põhjalikud A-taseme õppetunnid Application Insightsi integreerimisest, autentimismustritest ja mitmeagendi koordineerimisest tootmispaigalduste jaoks.**

#### Lisatud
- **📊 Application Insightsi integreerimise õppetund**: failis `docs/pre-deployment/application-insights.md`:
  - AZD-keskne juurutamine automaatse provisioneerimisega
  - Täielikud Bicep mallid Application Insightsi ja Log Analyticsi jaoks
  - Töötavad Python rakendused kohandatud telemeetriaga (üle 1200 rea)
  - AI/LLMi jälgimise mustrid (Azure OpenAI tokenite ja kulude jälgimine)
  - 6 Mermaid diagrammi (arhitektuur, hajutatud jälgimine, telemeetriavoo skeem)
  - 3 praktilist harjutust (hoiatused, juhtpaneelid, AI jälgimine)
  - Kusto-päringute näited ja kulude optimeerimise strateegiad
  - Reaalajas mõõdikute voog ja reaalajas silumine
  - 40-50 minutit õppetööd tootmisvalmis mustritega

- **🔐 Autentimise ja turvapõhimõtete õppetund**: failis `docs/getting-started/authsecurity.md`:
  - 3 autentimismustrit (ühendusstringid, Key Vault, hallatav identiteet)
  - Täielikud Bicep infrastruktuurimallid turvalisteks juurutusteks
  - Node.js rakenduse kood Azure SDK integratsiooniga
  - 3 täielikku harjutust (hallatava identiteedi lubamine, kasutaja määratud identiteet, Key Vault pööramine)
  - Turvalisuse parimad tavad ja RBAC konfiguratsioonid
  - Tõrkeotsingu juhend ja kulude analüüs
  - Tootmisvalmis paroolita autentimise mustrid

- **🤖 Mitmeagendi koordineerimismustrite õppetund**: failis `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineerimismustrit (järjestikune, paralleelne, hierarhiline, sündmuspõhine, konsensus)
  - Täielik orkestreeriv teenuse rakendus (Python/Flask, üle 1500 rea)
  - 3 spetsialiseeritud agendi rakendust (Uurija, Kirjutaja, Toimetaja)
  - Service Bus sõnumijärjekorra integratsioon
  - Cosmos DB oleku haldus hajutatud süsteemide jaoks
  - 6 Mermaid diagrammi agentide interaktsioonidest
  - 3 täiustatud harjutust (aegumiste käsitsemine, taaskatsetamine, lüliti kaitse)
  - Kuluaruanne (240–565 USD/kuus) optimeerimisstrateegiatega
  - Application Insights integratsioon jälgimiseks

#### Täiustatud
- **Eeljuurutuse peatükk**: Lisatud põhjalikud jälgimis- ja koordineerimismustrid
- **Alguse peatükk**: Täiustatud professionaalsete autentimismustritega
- **Tootmise valmisolek**: Terviklik turvalisusest vaatluseni
- **Kursuse ülevaade**: Uuendatud uute õppetundide viidetega peatükkides 3 ja 6

#### Muudetud
- **Õppimise järjekord**: Paranenud turvalisuse ja jälgimise integratsioon kogu kursuse vältel
- **Dokumentatsiooni kvaliteet**: Järjepidevad A-taseme standardid (95-97%) uutes õppetundides
- **Tootmismustrid**: Terviklik lõputöö katvus ettevõtte juurutuste jaoks

#### Parendatud
- **Arendajakogemus**: Selge tee arendusest tootmise jälgimiseni
- **Turvastandardid**: Professionaalsed mustrid autentimiseks ja saladuste halduseks
- **Vaatlusvõimekus**: Täielik Application Insights integratsioon AZD-ga
- **AI töökoormused**: Spetsialiseeritud jälgimine Azure OpenAI ja mitmeagendi süsteemidel

#### Kinnitatud
- ✅ Kõik õppetunnid sisaldavad täielikku toimivat koodi (mitte ainult fragmendid)
- ✅ Mermaid diagrammid visuaalseks õppimiseks (kokku 19 kolme õppetunni peale)
- ✅ Praktilised harjutused koos kontrollkäikudega (kokku 9)
- ✅ Tootmisvalmid Bicep mallid, mida saab juurutada käsuga `azd up`
- ✅ Kulude analüüs ja optimeerimisstrateegiad
- ✅ Tõrkeotsingu juhised ja parimad praktikad
- ✅ Teadmiste kontrollpunktid kontrollkäskudega

#### Dokumentatsiooni hindamise tulemused
- **docs/pre-deployment/application-insights.md**: - Põhjalik jälgimisjuhend
- **docs/getting-started/authsecurity.md**: - Professionaalsed turvamustrid
- **docs/pre-deployment/coordination-patterns.md**: - Täiustatud mitmeagendi arhitektuurid
- **Üldine uus sisu**: - Järjepidevalt kõrge kvaliteediga

#### Tehniline realiseerimine
- **Application Insights**: Log Analytics + kohandatud telemeetria + hajutatud jälgimine
- **Autentimine**: Hallatav identiteet + Key Vault + RBAC mustrid
- **Mitmeagent**: Service Bus + Cosmos DB + Container Apps + orkestreerimine
- **Jälgimine**: Reaalajas mõõdikud + Kusto päringud + hoiatused + juhtpaneelid
- **Kulukorraldus**: Proovivõtu strateegiad, säilituspoliitikad, eelarveseaded

### [v3.7.0] - 2025-11-19

#### Dokumentatsiooni kvaliteedi paranemine ja uus Azure OpenAI näide
**See versioon parandab dokumentatsiooni kvaliteeti kogu hoidlas ning lisab täieliku Azure OpenAI juurutamise näite GPT-4 vestlusliidesega.**

#### Lisatud
- **🤖 Azure OpenAI vestluse näide**: Täielik GPT-4 juurutus koos töövõimelise implementeeringuga `examples/azure-openai-chat/`:
  - Täielik Azure OpenAI infrastruktuur (GPT-4 mudeli juurutus)
  - Python käskliinivestluse liides vestlusajaloo salvestamisega
  - Key Vaulti integratsioon turvaliseks API võtme hoidmiseks
  - Tokeni kasutuse jälgimine ja kulude hindamine
  - Kiirusepiirangud ja veahaldus
  - Põhjalik README 35-45 minutilise juurutusjuhisega
  - 11 tootmisvalmis faili (Bicep mallid, Python rakendus, konfiguratsioon)
- **📚 Dokumentatsiooni harjutused**: Lisatud praktikaülesanded konfiguratsioonijuhendisse:
  - Harjutus 1: Mitmekeskkondade konfigureerimine (15 minutit)
  - Harjutus 2: Saladuste haldamise praktika (10 minutit)
  - Selged õnnestumise kriteeriumid ja kontrollkäigud
- **✅ Juurutuse kontroll**: Lisatud verifitseerimise peatükk juurutusjuhendisse:
  - Tervisekontrolli protseduurid
  - Edu kriteeriumite kontrollnimekiri
  - Oodatavad väljundid kõigile juurutuskäskudele
  - Kiire tõrkeotsingu juhend

#### Täiustatud
- **examples/README.md**: Uuendatud A-taseme kvaliteedile (93%):
  - Lisatud azure-openai-chat kõikidesse asjakohastesse sektsioonidesse
  - Kohalike näidete arv uuendatud 3-lt 4-le
  - Lisatud AI rakenduste näidete tabelisse
  - Integreeritud Quick Start vahele Intermediate Users sektsiooni
  - Lisatud Microsoft Foundry mallide jaotisse
  - Uuendatud võrdlustabel ja tehnoloogia leidmise sektsioonid
- **Dokumentatsiooni kvaliteet**: Paranenud B+ (87%) → A- (92%) kogu docs kaustas:
  - Lisatud oodatud väljundid kriitilistele käskude näidetele
  - Lisatud kontrollkäigud konfiguratsiooni muudatuste jaoks
  - Parendatud praktiline õppimine harjutustega

#### Muudetud
- **Õppimise järjekord**: AI näidete parem integreerimine keskastme õppijatele
- **Dokumentatsiooni struktuur**: Rohkem tegevuspõhiseid harjutusi selgete tulemuste ja juhistega
- **Kontrollprotsess**: Selgelt lisatud edu kriteeriumid võtmevoogudesse

#### Parendatud
- **Arendajakogemus**: Azure OpenAI juurutamine võtab nüüd 35-45 minutit (võrreldes 60-90-ga keerukamate alternatiivide puhul)
- **Kulukorraldus**: Selged kuluhinnangud (50–200 USD kuus) Azure OpenAI näite jaoks
- **Õppeteek**: AI arendajatele on selge stardipunkt azure-openai-chat abil
- **Dokumentatsiooni standardid**: Järjepidevad oodatud väljundid ja kontrollkäigud

#### Kinnitatud
- ✅ Azure OpenAI näide töötab täies mahus koos `azd up` käsuga
- ✅ Kõik 11 implementeerimisfaili on süntaktiliselt korrektsed
- ✅ README juhised vastavad tegelikule juurutuskogemusele
- ✅ Dokumentatsiooni lingid uuendatud üle 8+ koha
- ✅ Näidete indeks täpselt peegeldab 4 kohalikku näidet
- ✅ Tabelites pole korduvaid väliseid linke
- ✅ Kõik navigeerimisviited on korrektsed

#### Tehniline realiseerimine
- **Azure OpenAI arhitektuur**: GPT-4 + Key Vault + Container Apps muster
- **Turvalisus**: Hallatav identiteet valmis, saladused Key Vaultis
- **Jälgimine**: Application Insights integratsioon
- **Kulude haldus**: Tokenite jälgimine ja kasutuse optimeerimine
- **Juurutus**: Üksik `azd up` käsk täielikuks seadistamiseks

### [v3.6.0] - 2025-11-19

#### Suur uuendus: Container App juurutusnäited
**See versioon tutvustab põhjalikke, tootmisvalmis konteinerirakenduste juurutuse näiteid Azure Developer CLI (AZD) abil koos täieliku dokumentatsiooni ja integreeritult õppeteega.**

#### Lisatud
- **🚀 Container App näited**: Uued kohalikud näited kaustas `examples/container-app/`:
  - [Põhijuhend](examples/container-app/README.md): Täielik ülevaade konteineripõhistest juurutustest, kiirest alustamisest, tootmisest ja täiustatud mustritest
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api): Algajasõbralik REST API koos scale-to-zero, tervisekontrollide, jälgimise ja tõrkeotsinguga
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices): Tootmisvalmis mitme teenuse juurutus (API Gateway, Product, Order, User, Notification), asünkroonne sõnumivahetus, Service Bus, Cosmos DB, Azure SQL, hajutatud jälgimine, sinine-roheline/kanaari juurutus
- **Parimad tavad**: Turvalisus, jälgimine, kulude optimeerimine ja CI/CD juhised konteinerikoormuste jaoks
- **Koodinäited**: Täielikud `azure.yaml`, Bicep mallid ja mitme keele teenuse implementeerimised (Python, Node.js, C#, Go)
- **Testimine & tõrkeotsing**: Lõppto-lõpuni teststsenaariumid, jälgimiskäsud, tõrkeotsingu juhendid

#### Muudetud
- **README.md**: Uuendatud, et esile tõsta ja linkida uusi konteinerirakenduste näiteid jaotises "Local Examples - Container Applications"
- **examples/README.md**: Uuendatud, et rõhutada konteinerirakenduste näiteid, lisada võrdlustabeli kirjeid ja uuendada tehnoloogia/arhitektuuri viiteid
- **Kursuse kavand & õppematerjal**: Uuendatud, et viidata uutele konteinerirakenduste näidetele ja juurutamismustritele asjakohastes peatükkides

#### Kinnitatud
- ✅ Kõik uued näited on juurutatavad käsuga `azd up` ja järgivad parimaid tavasid
- ✅ Dokumentatsiooni ristviited ja navigeerimine uuendatud
- ✅ Näited hõlmavad algajatest kuni edasijõudnuteni, sealhulgas tootmismikroteenuseid

#### Märkused
- **Keel**: Ainult ingliskeelne dokumentatsioon ja näited
- **Järgmised sammud**: Tulemustes laiendada täiendavate arenenud konteinerimustrite ja CI/CD automatiseerimisega

### [v3.5.0] - 2025-11-19

#### Tootemärgi ümberbrändimine: Microsoft Foundry
**See versioon viib läbi ulatusliku tootenime vahetuse “Microsoft Foundry” vastu kogu ingliskeelses dokumentatsioonis, kajastades Microsofti ametlikku ümberbrändimist.**

#### Muudetud
- **🔄 Tootenime uuendus**: Täielik ümberbrändimine “Microsoft Foundry” vastu
  - Uuendatud kõik viited ingliskeelses dokumentatsioonis `docs/` kaustas
  - Kausta nimi muudetud: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Faili nimi muudetud: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kokku: 23 sisuviidet uuendatud 7 dokumentatsioonifailis

- **📁 Kaustastruktuuri muudatused**:
  - Kaust `docs/ai-foundry/` muudetud `docs/microsoft-foundry/`-ks
  - Kõik ristviited uuendatud uue kaustastruktuuri peegeldamiseks
  - Navigeerimislingid kontrollitud kogu dokumentatsiooni ulatuses

- **📄 Failinimede muudatused**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kõik sisemised lingid uuendatud, et viidata uuele failinimele

#### Uuendatud failid
- **Peatüki dokumentatsioon** (7 faili):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigeerimislingi uuendust
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tootenime viidet uuendatud
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Kasutab juba Microsoft Foundry’d (varasemate uuenduste põhjal)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 viidet uuendatud (ülevaade, kogukonna tagasiside, dokumentatsioon)
  - `docs/getting-started/azd-basics.md` - 4 ristviite linki uuendatud
  - `docs/getting-started/first-project.md` - 2 peatüki navigeerimislinki uuendatud
  - `docs/getting-started/installation.md` - 2 järgmise peatüki linki uuendatud
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 viidet uuendatud (navigeerimine, Discordi kogukond)
  - `docs/troubleshooting/common-issues.md` - 1 navigeerimislink uuendatud
  - `docs/troubleshooting/debugging.md` - 1 navigeerimislink uuendatud

- **Kursuse struktuuri failid** (2 faili):
  - `README.md` - 17 viidet uuendatud (kursuse ülevaade, peatükkide pealkirjad, mallide sektsioon, kogukonna teadmised)
  - `course-outline.md` - 14 viidet uuendatud (ülevaade, õpieesmärgid, peatükkide ressursid)

#### Kinnitatud
- ✅ Ükski “ai-foundry” kaustateekonna viide ei esine enam ingliskeelses dokumentatsioonis
- ✅ Ükski “Microsoft Foundry” tootenime viide ei esine enam ingliskeelses dokumentatsioonis
- ✅ Kõik navigeerimislingid funktsioneerivad uue kaustastruktuuriga
- ✅ Faili- ja kaustanimede muudatused edukalt lõpule viidud
- ✅ Ristviited peatükkide vahel kontrollitud

#### Märkused
- **Keel**: Muudatused tehtud ainult ingliskeelses dokumendis `docs/` kaustas
- **Tõlked**: Tõlkekaustad (`translations/`) selles versioonis ei ole uuendatud
- **Töötoad**: Töötoa materjalid (`workshop/`) selles versioonis ei ole uuendatud
- **Näited**: Näidised võivad endiselt sisaldada varasema nimekasutuse viiteid (uuendus tulevikus)
- **Välised lingid**: Välised URLid ja GitHubi hoidla viited jäävad muutmata

#### Migratsioonijuhis kaastöötegijatele
Kui teil on kohalikud harud või dokumentatsioon, mis viitavad vanale struktuurile:
1. Uuendage kaustaviited: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uuendage failiviiteid: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Asendage tootenimi: "Microsoft Foundry" → "Microsoft Foundry"
4. Kontrollige, et kõik sisemised viited töötaksid jätkuvalt

---

### [v3.4.0] - 2025-10-24

#### Taristu eelvaate ja valideerimise täiustused
**See versioon lisab täieliku toe uuele Azure Developer CLI eelvaate funktsioonile ja parandab töötoa kasutajakogemust.**

#### Lisatud
- **🧪 azd provision --preview funktsiooni dokumentatsioon**: Ulatuslik ülevaade uue taristu eelvaate võimekusest
  - Käsu viited ja kasutusnäited kiire juhendi sees
  - Põhjalik integreerimine juurutamise juhises koos kasutusjuhtude ja eelistega
  - Eelkontrolli sekkumine ohutumaks juurutamise valideerimiseks
  - Algusjuhendi uuendused ohutuslähtelise juurutamise tavadega
- **🚧 Töötoa oleku bänner**: Professionaalne HTML bänner, mis näitab töötoa arenduse staatust
  - Gradientdisain ehituse indikatsioonidega kasutajale selgeks infoks
  - Viimane uuenduse kuupäev nähtavuse tagamiseks
  - Mobiilseadmete jaoks vastuvõtlik disain

#### Täiustatud
- **Taristu ohutus**: Eelvaate funktsioon integreeritud kõigisse juurutamise dokumentidesse
- **Eeljuurutuse valideerimine**: Automatiseeritud skriptid sisaldavad nüüd taristu eelvaate testi
- **Arendaja töövoog**: Käsuread uuendatud nii, et eelvaade on parim praktika osa
- **Töötoa kogemus**: Kasutajatele selgelt seatud ootused sisu arendusstaatusest

#### Muudetud
- **Juurutamise parimad tavad**: Eelvaate-eelne töövoog on nüüd soovitatav meetod
- **Dokumentatsiooni voog**: Taristu valideerimine nihutatud õppeprotsessis varasemasse etappi
- **Töötoa esitlus**: Professionaalne oleku info arendusaja selge esitusega

#### Paranenud
- **Ohutuslähteline lähenemine**: Taristu muudatusi saab enne juurutamist valideerida
- **Meeskonnatöö**: Eelvaate tulemusi saab jagada ülevaatuseks ja kinnituseks
- **Kuluteadlikkus**: Ressursside kuludest parema ülevaate saamine enne juurutamist
- **Riskide maandamine**: Vähendatud juurutamise ebaõnnestumisi tänu eelkontrollile

#### Tehniline teostus
- **Mitme dokumendi integratsioon**: Eelvaate funktsioon dokumenteeritud 4 põhifailis
- **Käsurea mustrid**: Järjepidev süntaks ja näited kogu dokumentatsioonis
- **Parimate tavade integreerimine**: Eelvaade kaasatud valideerimise töövoogudesse ja skriptidesse
- **Visuaalsed märgistused**: Selgelt välja toodud UUS funktsioon avastamiseks

#### Töötoa taristu
- **Oleku teavitus**: Professionaalne HTML bänner gradiendi stiilis
- **Kasutajakogemus**: Selge arenduse staatuse teave väldib segadust
- **Professionaalne esitlus**: Säilitab hoidla usaldusväärsuse ja seab ootused
- **Ajaskaala läbipaistvus**: 2025. aasta oktoobri viimane uuendusaeg vastutuse tagamiseks

### [v3.3.0] - 2025-09-24

#### Täiustatud töötoa materjalid ja interaktiivne õppekeskkond
**See versioon lisab laiaulatusliku töötoa materjalide komplekti koos brauseripõhiste interaktiivsete juhendite ja struktureeritud õpperadadega.**

#### Lisatud
- **🎥 Interaktiivne töötoa juhend**: Brauseripõhine töötoa kogemus MkDocs eelvaate võimekusega
- **📝 Struktureeritud töötoa juhised**: 7-astmeline juhitud õppeteek avastamisest kohandamiseni
  - 0-Sissejuhatus: töötoa ülevaade ja seadistus
  - 1-Vali-AI-mall: mallide avastamine ja valikuprotsess
  - 2-Valideeri-AI-mall: juurutamine ja valideerimine
  - 3-Lammutamise-AI-mall: malli arhitektuuri mõistmine
  - 4-Konfigureeri-AI-mall: seadistamine ja kohandamine
  - 5-Kohanda-AI-mall: arenenud muudatused ja iteratsioonid
  - 6-Purusta-taristu: puhastamine ja ressursside haldus
  - 7-Kokkuvõte: ülevaade ja järgmised sammud
- **🛠️ Töötoa tööriistad**: MkDocs konfiguratsioon koos Material teemaga täiustatud õppekogemuseks
- **🎯 Praktiline õpperada**: 3-astmeline metoodika (Avastus → Juurutamine → Kohandamine)
- **📱 GitHub Codespaces integreerimine**: Sujuv arenduskeskkonna seadistus

#### Täiustatud
- **AI töötoa labor**: Laiendatud põhjaliku 2-3 tunni pikkuse struktureeritud õppega
- **Töötoa dokumentatsioon**: Professionaalne esitlus koos navigeerimise ja visuaalsete abivahenditega
- **Õppimise progressioon**: Selge samm-sammuline juhend mallide valikust tootmisse juurutamiseni
- **Arendajakogemus**: Integreeritud tööriistad lihtsustatud arendusvoogude jaoks

#### Paranenud
- **Juurdepääsetavus**: Brauseripõhine liides otsingu, kopeerimise ja teemade lülitusega
- **Isetempo õpe**: Paindlik töötoa struktuur erinevatele õppimiskiirustele
- **Praktiline rakendus**: Tootmises kasutatavad AI mallide juurutamise stsenaariumid
- **Kogukonna integratsioon**: Discordi liidestus töötoa toe ja koostöö jaoks

#### Töötoa funktsioonid
- **Sisseehitatud otsing**: Kiire märksõna ja õppetükkide leidmine
- **Kopeeri koodiplokid**: Hiirega üle minek kopeerimise funktsioon kõikidele koodinäidetele
- **Teema lüliti**: Tume/hele režiim eelistustele vastamiseks
- **Visuaalsed materjalid**: Ekraanipildid ja diagrammid parema mõistmise jaoks
- **Abi integreerimine**: Otsepääs Discordi kogukonna toele

### [v3.2.0] - 2025-09-17

#### Suur navigeerimise ümberkorraldus ja peatükkidel põhinev õppesüsteem
**See versioon toob kaasa ulatusliku peatükkidel põhineva õpistruktuuri koos täiustatud navigeerimisega kogu hoidlas.**

#### Lisatud
- **📚 Peatükkidel põhinev õppesüsteem**: Kogu kursus ümber struktureeritud 8 järjest kasvavasse õppepeatükki
  - Peatükk 1: Alused & Kiirstart (⭐ - 30-45 min)
  - Peatükk 2: AI-esmane arendus (⭐⭐ - 1-2 tundi)
  - Peatükk 3: Konfiguratsioon & Autentimine (⭐⭐ - 45-60 min)
  - Peatükk 4: Infrastruktuur koodina & juurutamine (⭐⭐⭐ - 1-1,5 tundi)
  - Peatükk 5: Mitmeagendilised AI lahendused (⭐⭐⭐⭐ - 2-3 tundi)
  - Peatükk 6: Eeljuurutuse valideerimine & planeerimine (⭐⭐ - 1 tund)
  - Peatükk 7: Tõrkeotsing & silumine (⭐⭐ - 1-1,5 tundi)
  - Peatükk 8: Tootmise ja ettevõtte mustrid (⭐⭐⭐⭐ - 2-3 tundi)
- **📚 Ühtne navigeerimissüsteem**: Ühtsed navigatsioonipealkirjad ja jalused kogu dokumentatsioonis
- **🎯 Edusammu jälgimine**: Kursuse läbimise kontrollnimekiri ja õppimise kontrollsüsteem
- **🗺️ Õpperaja juhised**: Selged alguspunktid erinevate kogemustasemete ja eesmärkidega õppijatele
- **🔗 Ristviited navigeerimisel**: Seotud peatükid ja eeltingimused selgelt seotud

#### Täiustatud
- **README struktuur**: Muudetud struktureeritud õppeplatvormiks peatükkidel põhineva korraldusega
- **Dokumentatsiooni navigeerimine**: Igal lehel on nüüd peatüki kontekst ja edenemise juhised
- **Mallide organiseerimine**: Näited ja mallid paigutatud vastavatesse õppepeatükkidesse
- **Ressursside integreerimine**: Kiirjuhendid, korduma kippuvad küsimused ja õppematerjalid seotud vastavate peatükkidega
- **Töötoa integratsioon**: Praktilised laborid seotud mitme peatüki õpieesmärkidega

#### Muudetud
- **Õppimise progressioon**: Liigutud lineaarse dokumentatsiooni pealt paindlikule peatükkidel põhinevale õppimisele
- **Konfiguratsiooni asukoht**: Konfiguratsioonijuhend paigutatud parema õppimiskäigu huvides peatükki 3
- **AI sisu integratsioon**: AI-spetsiifiline sisu parema kaasamisega kogu õppe jooksul
- **Tootmise sisu**: Arendatud mustrid koondatud peatükki 8 ettevõtte õppijatele

#### Paranenud
- **Kasutajakogemus**: Selged navigeerimisteed ja peatükkide edenemise indikaatorid
- **Juurdepääsetavus**: Ühtsed navigeerimismustrid kursusel lihtsamaks läbimiseks
- **Professionaalne esitlus**: Ülikooli tüüpi kursuse struktuur sobilik akadeemiliseks ja korporatiivseks koolituseks
- **Õppimise efektiivsus**: Relevantse sisu leidmise aeg lühenenud parem korraldus

#### Tehniline teostus
- **Navigeerimispealkirjad**: Standardiseeritud peatükkide navigeerimine üle 40 dokumentatsioonifaili
- **Jaluse navigeerimine**: Ühtsed edenemise juhised ja peatükkide lõpetamise indikaatorid
- **Ristlinkimine**: Ulatuslik sisemine lingisüsteem seotud kontseptsioonide ühendamiseks
- **Peatükkide kaardistamine**: Mallid ja näited selgelt seotud õpieesmärkidega

#### Õppematerjali täiustused
- **📚 Ulatuslikud õpieesmärgid**: Õppematerjali struktuur viidud kooskõlla 8 peatükiga
- **🎯 Peatükkide hindamine**: Iga peatükk hõlmab kindlaid õpieesmärke ja praktilisi harjutusi
- **📋 Edusammu jälgimine**: Nädalapõhine õppimise ajakava mõõdetavate tulemustega ja läbimise nimekirjadega
- **❓ Hindamisküsimused**: Teadmiste kontroll iga peatüki kohta professionaalsete tulemuste jaoks
- **🛠️ Praktilised harjutused**: Käed-külge tegevused reaalsete juurutamisstsenaariumitega ja tõrkeotsinguga
- **📊 Oskuste areng**: Selge edenemine põhitõdedest ettevõtte mustriteni koos karjääriarendusega
- **🎓 Sertifitseerimise raamistik**: Professionaalse arengu tulemused ja kogukonna tunnustussüsteem
- **⏱️ Ajakava juhtimine**: Struktureeritud 10-nädalane õppeplaan tähtaegadega

### [v3.1.0] - 2025-09-17

#### Täiustatud mitmeagendiline AI lahendus
**See versioon parandab mitmeagendilist jaekaubanduse lahendust paremate agendi nimede ja täiustatud dokumentatsiooniga.**

#### Muudetud
- **Mitmeagendiline terminoloogia**: Asendatud "Cora agent" nimetusega "Kliendi agent" kogu jaekaubanduse mitmeagendise lahenduse ulatuses selgema arusaamise tagamiseks
- **Agendi arhitektuur**: Uuendatud kogu dokumentatsioon, ARM mallid ja koodinäited ühtseks "Kliendi agent" nimetamiseks
- **Konfiguratsiooni näited**: Kaasaegsemad agendi konfiguratsiooni mustrid koos uuendatud nimetustega
- **Dokumentatsiooni järjepidevus**: Tagatud kõikide viidete professionaalselt kirjeldavate agentide nimede kasutamine

#### Täiustatud
- **ARM malli pakett**: Uuendatud retail-multiagent-arm-template Kliendi agendi viidetega
- **Arhitektuuri diagrammid**: Uuendatud Mermaid diagrammid Kliendi agendi uute nimetustega
- **Koodinäited**: Python klassid ja rakenduse näited kasutavad nüüd CustomerAgent nimetust
- **Keskkonnamuutujad**: Uuendatud kõik juurutamisskriptid kasutama CUSTOMER_AGENT_NAME konventsioone

#### Paranenud
- **Arendajakogemus**: Selgemad agendi rollid ja vastutus dokumentatsioonis  
- **Tootmisküpsus**: Parem joondamine ettevõtte nimetamisstandarditega  
- **Õppematerjalid**: Intuitiivsem agendi nimetamine õppeotstarbel  
- **Mallide kasutatavus**: Lihtsustatud arusaam agendi funktsioonidest ja kasutuselevõtu mustritest  

#### Tehnilised üksikasjad  
- Uuendatud Mermaid arhitektuuridiagrammid CustomerAgent viidetega  
- Asendatud CoraAgent klassinimed Python näidetes CustomerAgent nimedega  
- Muudetud ARM malli JSON konfiguratsioonid kasutama "customer" agendi tüüpi  
- Uuendatud keskkonnamuutujad CORA_AGENT_* mustrilt CUSTOMER_AGENT_* mustrile  
- Värskendatud kõik kasutuselevõtu käsud ja konteineri konfiguratsioonid  

### [v3.0.0] - 2025-09-12  

#### Suured muudatused – AI arendajate fookus ja Microsoft Foundry integratsioon  
**See versioon muudab hoidla kõikehõlmavaks AI-keskseks õppematerjaliks Microsoft Foundry integratsiooniga.**  

#### Lisatud  
- **🤖 AI-esimene õppeteek**: Täielik ümberkorraldus, mis seab esikohale AI arendajad ja insenerid  
- **Microsoft Foundry integreerimisspetsifikatsioon**: Üksikasjalik dokumentatsioon AZD ühendamiseks Microsoft Foundry teenustega  
- **AI mudelite kasutuselevõtu mustrid**: Detailne juhend mudelite valiku, seadistuse ja tootmislevituse strateegiate kohta  
- **AI töölabor**: 2–3-tunnine praktiline töötuba AI rakenduste konverteerimiseks AZD-ga kasutatavaks lahenduseks  
- **Tootmisvalmis AI parimad tavad**: Ettevõttetasemel mustrid AI koormuste skaleerimiseks, jälgimiseks ja turvamiseks  
- **AI spetsiifiline tõrkeotsingu juhend**: Üksikasjalik juhend Azure OpenAI, Cognitive Services ja AI kasutuselevõtu tõrkeotsinguks  
- **AI malligalerii**: Esile tõstetud Microsoft Foundry mallide kogumik keerukuse hinnangutega  
- **Töötubade materjalid**: Täielik töötoastuktuur koos praktiliste laborite ja viitematerjalidega  

#### Täiustatud  
- **README struktuur**: AI-arendajale suunatud, 45% kogukonna huvi andmetega Microsoft Foundry Discordist  
- **Õppeteed**: Pühendatud AI arendaja teekond koos traditsiooniliste õpilaste ja DevOpsi inseneride radadega  
- **Mallisoovitused**: Esiletõstetud AI malli nagu azure-search-openai-demo, contoso-chat ja openai-chat-app-quickstart  
- **Kogukonna integreerimine**: Paranenud Discordi kogukonna toetus AI-spetsiifiliste kanalite ja aruteludega  

#### Turvalisus ja tootmise fookus  
- **Haldatud identiteedi mustrid**: AI-spetsiifilised autentimis- ja turvaseaded  
- **Kuluoptimeerimine**: Märgise kasutuse jälgimine ja eelarvekontroll AI koormuste jaoks  
- **Mitmeregiooni levitus**: Strateegiad ülemaailmseks AI rakenduste kasutuselevõtuks  
- **Tulemuslikkuse monitooring**: AI-spetsiifilised mõõdikud ja Application Insights integratsioon  

#### Dokumentatsiooni kvaliteet  
- **Lineaarne kursuse struktuur**: Loogiline areng algajast täiustatud AI kasutuselevõtu mustriteni  
- **Kinnitatud URLid**: Kõik välised hoidla lingid on kontrollitud ja kättesaadavad  
- **Täielik viitetekst**: Kõik siseviited on valideeritud ja töötavad  
- **Tootmisküpsus**: Ettevõtte kasutuselevõtu mustrid koos reaalsete näidetega  

### [v2.0.0] - 2025-09-09  

#### Suured muudatused – hoidla ümberkorraldus ja professionaalsuse tõstmine  
**See versioon esindab olulist hoidla struktuuri ja sisu esituse uuendust.**  

#### Lisatud  
- **Struktureeritud õppimise raamistik**: Kõik dokumentatsioonilehed sisaldavad nüüd Sissejuhatus, Õpieesmärgid ja Õpitulemused sektsioone  
- **Navigeerimissüsteem**: Lisatud eelmise/järgmisel õppetunnil navigeerimise lingid igale lehele juhitud õppimiseks  
- **Õppejuhend**: Üksikasjalik study-guide.md koos õpieesmärkide, praktikaülesannete ja hindematerjalidega  
- **Professionaalne esitlus**: Kõik emoji ikoonid eemaldatud paremaks ligipääsetavuseks ja professionaalseks välimuseks  
- **Täiustatud sisustruktuur**: Õppematerjalide parem organiseeritus ja voolavus  

#### Muudetud  
- **Dokumentatsiooni formaat**: Kõigi dokumentide standardiseerimine õppimiskeskse struktuuriga  
- **Navigeerimise kulg**: Loogiline ettepoole suunatud vool õppematerjalides  
- **Sisuesitlus**: Dekoratiivsete elementide eemaldamine selgema ja professionaalsemate vormistusreeglite jaoks  
- **Lingistruktuur**: Kõigi siseviidete uuendamine uue navigeerimissüsteemi toetuseks  

#### Paranenud  
- **Ligipääsetavus**: Emoji toetuse eemaldamine parema ekraanilugeri ühilduvuse jaoks  
- **Professionaalne välimus**: Puhtam, akadeemilise stiiliga esitlus sobilik ettevõtte õppekeskkonda  
- **Õpikogemus**: Struktureeritud lähenemine selgete eesmärkide ja tulemustega igas õppeosas  
- **Sisu organiseeritus**: Parem loogiline seos ja ühendus seotud teemade vahel  

### [v1.0.0] - 2025-09-09  

#### Algne väljaanne – täielik AZD õppematerjalide hoidla  

#### Lisatud  
- **Põhidokumentatsiooni struktuur**  
  - Täielik alustamisjuhendite seeria  
  - Üksikasjalik kasutuselevõtu ja provisjonimise dokumentatsioon  
  - Tõrkeotsingu ressursid ja silumise juhendid  
  - Enne kasutuselevõttu valideerimise tööriistad ja protseduurid  

- **Alustamise moodul**  
  - AZD põhitõed: põhimõisted ja terminid  
  - Paigaldusjuhend: platvormispetsiifilised seadistusjuhised  
  - Konfiguratsiooni juhend: keskkonna seadistamine ja autentimine  
  - Esimene projekti juhend: samm-sammult praktiline õpe  

- **Kasutuselevõtu ja provisjonimise moodul**  
  - Kasutuselevõtu juhend: täielik töövoo dokumentatsioon  
  - Provisjonimise juhend: infrastruktuur koodina Bicep abil  
  - Parimad tavad tootmiskasutuseks  
  - Mitme teenuse arhitektuurimustrid  

- **Enne kasutuselevõttu valideerimise moodul**  
  - Mahu planeerimine: Azure ressursside olemasolu kontroll  
  - SKU valik: teenustaseme juhendid  
  - Kontrollsõidud: automatiseeritud valideerimisskriptid (PowerShell ja Bash)  
  - Kuluarvutuse ja eelarve planeerimise tööriistad  

- **Tõrkeotsingu moodul**  
  - Levinud probleemid: sagedased probleemid ja lahendused  
  - Silumisjuhend: süstemaatilised tõrkeotsingumeetodid  
  - Täpsemad diagnostikatehnikad ja tööriistad  
  - Tulemuslikkuse jälgimine ja optimeerimine  

- **Ressursid ja viited**  
  - Käsurea spikker: kiire ülevaade olulistest käskudest  
  - Sõnastik: täislõik terminitega ja lühendite seletustega  
  - KKK: põhjalikud vastused sagedastele küsimustele  
  - Välised ressursid ja kogukonnaga ühendamise lingid  

- **Näited ja mallid**  
  - Lihtsa Veebirakenduse näide  
  - Staatilise veebisaidi kasutuselevõtu mall  
  - Konteineri rakenduse konfiguratsioon  
  - Andmebaasi integratsioonimustrid  
  - Mikroteenuste arhitektuuri näited  
  - Serverivaba funktsioonide rakendused  

#### Omadused  
- **Mitme platvormi tugi**: Windowsi, macOS-i ja Linuxi paigaldus- ja konfiguratsioonijuhendid  
- **Mitmed oskustasemed**: sisu mõeldud nii tudengitele kui ka professionaalsetele arendajatele  
- **Praktiline fookus**: praktilised näited ja reaalse elu stsenaariumid  
- **Kõikehõlmav**: põhimõistetest kuni täiustatud ettevõtte mustriteni  
- **Turvalisus esikohal**: turvapraktikate integreerimine kogu sisus  
- **Kuluoptimeerimine**: juhised kulutõhusate kasutuselevõttude ja ressursside haldamiseks  

#### Dokumentatsiooni kvaliteet  
- **Üksikasjalikud koodinäited**: praktilised ja testitud kooditükid  
- **Samm-sammult juhised**: selged ja rakendatavad juhised  
- **Tõrgete käitlemise terviklikkus**: levinud vigade tõrkeotsing  
- **Parimate tavade integreerimine**: tööstusharu standardid ja soovitused  
- **Versiooni ühilduvus**: ajakohane viimaste Azure teenuste ja azd funktsioonidega  

## Planeeritud tulevased täiustused  

### Versioon 3.1.0 (plaanis)  
#### AI platvormi laiendamine  
- **Mitme mudeli tugi**: integratsioonimustrid Hugging Face, Azure Machine Learning ja kohandatud mudelite jaoks  
- **AI agendi raamistikud**: mallid LangChain, Semantic Kernel ja AutoGen kasutuselevõtuks  
- **Täiustatud RAG mustrid**: vektandmebaasi valikud Azure AI Searchist kaugemal (Pinecone, Weaviate jne)  
- **AI jälgitavus**: täiustatud monitooring mudeli jõudluse, märgiste kasutamise ja vastuste kvaliteedi kohta  

#### Arendajakogemus  
- **VS Code laiendus**: integreeritud AZD + AI Foundry arenduskogemus  
- **GitHub Copilot integratsioon**: AI abiga AZD mallide genereerimine  
- **Interaktiivsed juhendid**: praktilised kodeerimisharjutused automatiseeritud valideerimisega AI stsenaariumidele  
- **Videosisu**: visuaalsete õppijate jaoks täiendavad õppevideod AI kasutuselevõtuks  

### Versioon 4.0.0 (plaanis)  
#### Ettevõtte AI mustrid  
- **Juhtimisraamistik**: AI mudelite haldus, vastavus ja auditeerimised  
- **Mitmikklientide AI**: mustrid, mis teenindavad mitut klienti isoleeritud AI teenustega  
- **Edge AI kasutuselevõtt**: integratsioon Azure IoT Edge ja konteinerite instantsidega  
- **Hübriidpilve AI**: mitme pilve ja hübriidlevituse mustrid AI koormustele  

#### Täiustatud funktsioonid  
- **AI torujuhtme automatiseerimine**: MLOps integratsioon Azure Machine Learning torujuhtmetega  
- **Täiustatud turvalisus**: nullusalduslikud mustrid, privaatväravad ja täiustatud ohukaitse  
- **Jõudluse optimeerimine**: täiustatud häälestus- ja skaleerimisstrateegiad kõrge läbilaskevõimega AI rakendustele  
- **Ülemaailmne levitus**: sisu levitamine ja edge vahemällu salvestuse mustrid AI rakendustele  

### Versioon 3.0.0 (plaanis) - asendatud praeguse väljaandega  
#### Pakutavad lisandused – nüüd rakendatud v3.0.0  
- ✅ **AI-keskne sisu**: põhjalik Microsoft Foundry integratsioon (valmis)  
- ✅ **Interaktiivsed juhendid**: praktiline AI töötuba (valmis)  
- ✅ **Täiustatud turvamoodul**: AI-spetsiifilised turvamustrid (valmis)  
- ✅ **Tulemuslikkuse optimeerimine**: AI koormuse häälestusstrateegiad (valmis)  

### Versioon 2.1.0 (plaanis) - osaliselt rakendatud v3.0.0  
#### Väiksemad täiustused – osa valmis praeguses versioonis  
- ✅ **Täiendavad näited**: AI-keskse kasutuselevõtu stsenaariumid (valmis)  
- ✅ **Laiendatud KKK**: AI-spetsiifilised küsimused ja tõrkeotsing (valmis)  
- **Tööriistade integratsioon**: täiustatud IDE ja redaktori integreerimisjuhised  
- ✅ **Monitooringu laiendus**: AI-spetsiifilised jälgimis- ja teadete mustrid (valmis)  

#### Endiselt plaanis tulevikus  
- **Mobiilisõbralik dokumentatsioon**: mobiilõppe jaoks kohanduv disain  
- **Võrgust väljas ligipääs**: allalaaditavad dokumentatsioonipaketid  
- **Täiustatud IDE integratsioon**: VS Code laiendus AZD + AI töövoogudele  
- **Kogukonna juhtpaneel**: reaalajas kogukonna mõõdikud ja panuste jälgimine  

## Panustamine muudatustesse  

### Muudatuste raportimine  
Hoidlasse panustades palun veendu, et muudatused sisaldaksid:  

1. **Versiooni number**: vastavalt semantilisele versioonihaldusele (major.minor.patch)  
2. **Kuupäev**: väljaande või uuenduse kuupäev vormingus AAAA-KK-PP  
3. **Kategooria**: Lisatud, Muudetud, Mahavisatud, Eemaldatud, Parandatud, Turvalisus  
4. **Selge kirjeldus**: lühike kirjeldus muudatustest  
5. **Mõjuhinnang**: kuidas muudatused mõjutavad olemasolevaid kasutajaid  

### Muudatuste kategooriad  

#### Lisatud  
- Uued funktsioonid, dokumentatsiooniosad või võimekused  
- Uued näited, mallid või õppematerjalid  
- Täiendavad tööriistad, skriptid või utiliidid  

#### Muudetud  
- Muudatused olemasolevas funktsionaalsuses või dokumentatsioonis  
- Täiendused selguse või täpsuse parandamiseks  
- Sisu või organiseerimise ümberstruktureerimine  

#### Mahavisatud  
- Funktsioonid või lähenemised, mida järk-järgult lõpetatakse  
- Dokumentatsiooni sektsioonid, mis on planeeritud eemaldamiseks  
- Meetodid, millel on paremad alternatiivid  

#### Eemaldatud  
- Funktsioonid, dokumentatsioon või näited, mis pole enam asjakohased  
- Aegunud info või mahavisatud lähenemised  
- Liigne või koondatud sisu  

#### Parandatud  
- Dokumentatsiooni või koodi vigade parandused  
- Teatatud probleemide või rikete lahendused  
- Täpsuse või funktsionaalsuse parandused  

#### Turvalisus  
- Turvalisusega seotud täiustused või parandused  
- Turvalisuse parimate tavade uuendused  
- Turvaaukude lahendused  

### Semantilise versioonihalduse juhised  

#### Suur versioon (X.0.0)  
- Murduvad muudatused, mis nõuavad kasutaja sekkumist  
- Olulised ümberkorraldused sisus või organisatsioonis  
- Lähenemis- või metoodika muutused põhitasemel  

#### Väike versioon (X.Y.0)  
- Uued funktsioonid või sisulised lisandused  
- Täiendused, mis säilitavad tagasikõlblikkuse  
- Täiendavad näited, tööriistad või ressursid  

#### Parandusversioon (X.Y.Z)  
- Veaparandused ja korrektsioonid  
- Väikesed täiustused olemasolevas sisus  
- Selgitused ja pisitäiustused  

## Kogukonna tagasiside ja ettepanekud  

Julgustame aktiivselt kogukonna tagasisidet selle õppematerjali täiustamiseks:  

### Kuidas anda tagasisidet  
- **GitHubi probleemid**: probleemide teatamine või parendusettepanekud (AI-spetsiifilised probleemid teretulnud)  
- **Discordi arutelud**: ideede jagamine ja Microsoft Foundry kogukonna kaasamine  
- **Pull-päringud**: otseste täiustuste panustamine eelkõige AI mallide ja juhendite osas  
- **Microsoft Foundry Discord**: osalemine #Azure kanalil AZD + AI aruteludes  
- **Kogukonna foorumid**: laiem Azure arendajate kaasamine  

### Tagasiside kategooriad  
- **AI sisu täpsus**: parandused AI teenuste integreerimisel ja kasutuselevõtu infol  
- **Õppimiskogemus**: ettepanekud AI arendajate õppeteekide parandamiseks  
- **Puuduv AI sisu**: täiendavate AI mallide, mustrite või näidete soovitused  
- **Ligipääsetavus**: mitmekesist õppevajadust toetavad täiustused  
- **AI tööriistade integratsioon**: ettepanekud sujuvama AI arendustöövoo jaoks  
- **Tootmise AI mustrid**: ettevõtte AI kasutuselevõtu mustrite soovitused  

### Vastuse pühendumus  
- **Probleemide lahendamine**: vastus 48 tunni jooksul  
- **Uute funktsioonide taotlused**: hindamine nädala jooksul  
- **Kogukonna panused**: läbivaatamine nädala jooksul  
- **Turvalisuse probleemid**: kiire reageerimine ja erakorraline tähelepanu  

## Hooldusplaan  

### Regulaarne uuendamine  
- **Kuuülevaated**: sisu täpsuse ja linkide valideerimine  
- **Kvartaliuuendused**: olulised sisulised täiendused ja parendused  
- **Poolaasta ülevaated**: põhjalik ümberkorraldus ja täiustused  
- **Aastased väljaanded**: suuremad versiooniuuendused ja olulised parandused  

### Monitooring ja kvaliteedi tagamine  
- **Automatiseeritud testimine**: koodinäidete ja linkide regulaarne kontroll  
- **Kogukonna tagasiside integreerimine**: kasutajate ettepanekute regulaarne kaasamine  
- **Tehnoloogia uuendused**: vastavus uusimatele Azure teenustele ja azd versioonidele  
- **Ligipääsetavuse auditid**: regulaarne ülevaade kaasava disaini põhimõtete osas  

## Versioonide tugi  

### Praegune versiooni tugi  
- **Viimane suur versioon**: täielik tugi regulaarsete uuendustega  
- **Eelmine suur versioon**: turvauuendused ja kriitilised parandused 12 kuud  
- **Varasemad versioonid**: ainult kogukonna tugi, ametlikke uuendusi ei tule  

### Migratsioonijuhised  
Kui välja antakse suuremad versioonid, pakume:
- **Migratsioonijuhendid**: Samm-sammult ülemineku juhised
- **Ühilduvuse märkused**: Üksikasjad katkestavate muudatuste kohta
- **Tööriistade tugi**: Skriptid või utiliidid migratsiooni abistamiseks
- **Kogukonna tugi**: Pühendatud foorumid migratsiooniküsimuste jaoks

---

**Navigeerimine**
- **Eelmise õppetüki**: [Õppejuhend](resources/study-guide.md)
- **Järgmise õppetüki**: Tagasi [PõhREADME](README.md)

**Püsige kursis**: Jälgige seda hoidlat, et saada teateid uutest versioonidest ja olulistest õppematerjalide uuendustest.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud kasutades tehisintellektil põhinevat tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise info korral soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega eksituste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->