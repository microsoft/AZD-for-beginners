# Muudatuste logi - AZD algajatele

## Sissejuhatus

See muudatuste logi dokumenteerib kõik olulised muudatused, uuendused ja täiustused AZD algajatele hoidlas. Järgime semantilise versiooni põhimõtteid ning hoiame seda logi selleks, et aidata kasutajatel mõista, mis on versioonide vahel muutunud.

## Õpieesmärgid

Selles logis muudatuste ülevaatamisel:
- Saate kursis olla uute funktsioonide ja sisuliste lisandustega
- Mõistate tehtud parendusi olemasolevas dokumentatsioonis
- Jälgite vigade parandusi ja korrektuure täpsuse tagamiseks
- Jälgite õppematerjalide arengut aja jooksul

## Õpitulemused

Pärast muudatuste logi kirjete ülevaatamist oskate:
- Tuvastada uut sisu ja õppimiseks kättesaadavaid ressursse
- Mõista, millised lõigud on uuendatud või parendatud
- Planeerida oma õppeteed põhinedes kõige värskematel materjalidel
- Anda tagasisidet ja ettepanekuid tulevaste parenduste jaoks

## Versiooniajalugu

### [v3.18.0] - 2026-03-16

#### AZD AI CLI käsud, sisu valideerimine ja mallide laiendamine
**See versioon lisab käsud `azd ai`, `azd extension` ja `azd mcp` kõigis AI-ga seotud peatükkides, parandab katkised lingid ja aegunud koodi failis agents.md, uuendab kiirviitamise lehte ning uuendab Näidismallide sektsiooni valideeritud kirjelduste ja uute Azure AI AZD mallidega.**

#### Lisatud
- **🤖 AZD AI CLI tugi** 7 failis (enne ainult peatükis 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Uus sektsioon "Laiendused ja AI käsud", tutvustades `azd extension`, `azd ai agent init` ja `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Variant 4: `azd ai agent init` koos võrdlustabeliga (malli vs manifesti lähenemine)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Alamsektsioonid "AZD laiendused Foundry jaoks" ja "Agent Esmane Deploy"
  - `docs/chapter-05-multi-agent/README.md` — Kiirkäivitus juhendab nii malli kui manifestipõhist juurutust
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Juhtimise sektsioonis nüüd `azd ai agent init` variant
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — “AZD AI laienduse käsud diagnostikaks” alamsektsioon
  - `resources/cheat-sheet.md` — Uus sektsioon "AI ja Laienduste käsud" koos `azd extension`, `azd ai agent init`, `azd mcp` ja `azd infra generate`
- **📦 Uued AZD AI näidismallid** failis `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG vestlus Blazor WebAssembly, Semantic Kernel ja häälevestluse toe abil
  - **azure-search-openai-demo-java** — Java RAG vestlus kasutades Langchain4J koos ACA/AKS juurutusvalikutega
  - **contoso-creative-writer** — Mitme agendiga loovkirjutamise rakendus Azure AI Agent Service, Bing Grounding ja Promptyga
  - **serverless-chat-langchainjs** — Serverita RAG kasutades Azure Functions + LangChain.js + Cosmos DB koos Ollama lokaalse arenduse toega
  - **chat-with-your-data-solution-accelerator** — Ettevõtte RAG kiirendi koos haldusportaali, Teamsi integratsiooni ja PostgreSQL/Cosmos DB valikutega
  - **azure-ai-travel-agents** — Mitme agendiga MCP orkestraatori näidissovellus serveritega .NET, Python, Java ja TypeScriptiga
  - **azd-ai-starter** — Minimaalne Azure AI infrastruktuuri Bicepi algmall
  - **🔗 Awesome AZD AI galerii link** — Viide [awesome-azd AI galeriile](https://azure.github.io/awesome-azd/?tags=ai) (üle 80 malli)

#### Parandatud
- **🔗 agents.md navigeerimine**: Eelnevad/Järgmised lingid nüüd vastavad peatüki 2 README õppetundide järjekorrale (Microsoft Foundry Integratsioon → Agentid → AI mudeli juurutus)
- **🔗 agents.md katkised lingid**: `production-ai-practices.md` parandatud aadressile `../chapter-08-production/production-ai-practices.md` (3 esinemist)
- **📦 agents.md aegunud kood**: `opencensus` asendatud `azure-monitor-opentelemetry`-ga + OpenTelemetry SDK
- **🐛 agents.md vigane API**: `max_tokens` liigutatud `create_agent()` pealt `create_run()` juurde nimega `max_completion_tokens`
- **🔢 agents.md tokenite lugemine**: Asendatud ligikaudne `len//4` `tiktoken.encoding_for_model()` kasutamisega
- **azure-search-openai-demo**: Teenused korrigeeritud "Cognitive Search + App Service" pealt "Azure AI Search + Azure Container Apps" peale (vaikimisi host muutus 2024. oktoobris)
- **contoso-chat**: Kirjeldust ajakohastatud viitamaks Azure AI Foundry + Promptyle, vastavuses hoidla tegeliku nimetuse ja tehnoloogiapinaga

#### Eemaldatud
- **ai-document-processing**: Eemaldatud mittekasutatav malli viide (hoidla pole avalikult kättesaadav kui AZD mall)

#### Parendatud
- **📝 agents.md harjutused**: Harjutus 1 näitab nüüd ootuspärast väljundit ja `azd monitor` sammu; Harjutus 2 sisaldab täielikku `FunctionTool` registreerimise koodi; Harjutus 3 asendab ebamäärase juhise konkreetsete `prepdocs.py` käskudega
- **📚 agents.md ressursid**: Uuendatud dokumentatsiooni lingid vastavalt Azure AI Agent Service praegustele dokumentidele ja kiirkäivitusele
- **📋 agents.md järgmisete sammude tabel**: Lisatud AI töötoa lab link kogu peatüki katvuseks

#### Muudetud failid
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Kursuse navigeerimise täiendus
**See versioon parandab README.md peatükkide navigeerimist täiustatud tabelvorminguga.**

#### Muudetud
- **Kursuse kaardi tabel**: Parendatud otselinkide, kestuse hinnangute ja keerukuse reitingutega
- **Kataloogide koristus**: Eemaldatud vananenud kaustad (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkide valideerimine**: Kõik 21+ siselingi kursuse kaardi tabelis kontrollitud

### [v3.16.0] - 2026-02-05

#### Tootenimede uuendused
**See versioon uuendab tootemärke vastavalt Microsofti praegusele brändingule.**

#### Muudetud
- **Microsoft Foundry → Microsoft Foundry**: Kõik viited uuendatud tõlkematutes failides
- **Azure AI Agent Service → Foundry Agents**: Teenuse nimi uuendatud tähistamaks praegust brändingut

#### Muudetud failid
- `README.md` - Põhikursuse avaleht
- `changelog.md` - Versiooniajalugu
- `course-outline.md` - Kursuse struktuur
- `docs/chapter-02-ai-development/agents.md` - AI agentide juhend
- `examples/README.md` - Näidisdokumentatsioon
- `workshop/README.md` - Töötuba avaleht
- `workshop/docs/index.md` - Töötuba indeks
- `workshop/docs/instructions/*.md` - Kõik töötuba juhendfailid

---

### [v3.15.0] - 2026-02-05

#### Suur hoiuala struktuuri muutus: peatükkidel põhinevad kaustanimed
**See versioon korraldab dokumentatsiooni ümber, luues selgema navigeerimise jaoks spetsiaalsed peatükkide kaustad.**

#### Kaustade ümbernimetamine
Vananenud kaustad asendatud peatükkide numbritega kaustadega:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lisatud uus: `docs/chapter-05-multi-agent/`

#### Failide migratsioonid
| Fail | Algne | Eesmärk |
|------|--------|---------|
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
- **📚 Peatükkide README-failid**: Igas peatüki kaustas loodud README.md fail, mis sisaldab:
  - Õpieesmärke ja kestust
  - Õppetundide tabelit koos kirjeldustega
  - Kiirkäivitus käske
  - Navigeerimist teistele peatükkidele

#### Muudetud
- **🔗 Kõik siselingid uuendatud**: Üle 78 kaustatee uuendatud kõigis dokumentatsioonifailides
- **🗺️ Peamine README.md**: Uuendatud Kursuse Kaart uue peatükkide struktuuriga
- **📝 examples/README.md**: Uuendatud ristviited peatükkide kaustadele

#### Eemaldatud
- Vana kaustastruktuur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Hoidla ümberkorraldus: Peatükkide navigatsioon
**See versioon lisas peatükkide navigeerimise README-failid (hiljem asendatud versiooniga v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Uus AI agentide juhend
**See versioon lisab põhjaliku juhendi AI agentide juurutamiseks Azure Developer CLI abil.**

#### Lisatud
- **🤖 docs/microsoft-foundry/agents.md**: Täielik juhend, mis käsitleb:
  - Mis on AI agentid ja kuidas nad erinevad chatbotidest
  - Kolm kiirkäivitus agentide malli (Foundry Agents, Prompty, RAG)
  - Agendi arhitektuuri mustrid (üksikagent, RAG, mitme-agendi mudel)
  - Tööriistade seadistamine ja kohandamine
  - Jälgimine ja mõõdikute kogumine
  - Kulude kaalutlused ja optimeerimine
  - Levinud tõrkeotsingu stsenaariumid
  - Kolm praktilist harjutust koos edutunnustega

#### Sisu struktuur
- **Sissejuhatus**: Agendi mõisted algajatele
- **Kiirkäivitus**: Agentide juurutamine käsuga `azd init --template get-started-with-ai-agents`
- **Arhitektuuri mustrid**: Visuaalsed skeemid agentide mustritest
- **Seadistus**: Tööriista seadistamine ja keskkonnamuutujad
- **Jälgimine**: Application Insights integratsioon
- **Harjutused**: Järgnev praktiline õppimine (20 kuni 45 minutit igaühele)

---

### [v3.12.0] - 2026-02-05

#### DevContainer keskkonna uuendus
**See versioon uuendab arendusmahuti konfiguratsiooni kaasaegsete tööriistade ja paremate vaikeseadistustega AZD õppimiskogemuse jaoks.**

#### Muudetud
- **🐳 Baaspilt**: Uuendatud pildilt `python:3.12-bullseye` pildile `python:3.12-bookworm` (viimane Debian stabiilne versioon)
- **📛 Mahuti nimi**: Muudetud "Python 3" pealt "AZD for Beginners" selguse huvides

#### Lisatud
- **🔧 Uued arenduskonteineri funktsioonid**:
  - `azure-cli` koos Bicep toe sisse lülitatud
  - `node:20` (AZD mallide LTS versioon)
  - `github-cli` mallide haldamiseks
  - `docker-in-docker` konteinerirakenduste juurutuseks

- **🔌 Pordinidi edasiandmine**: Eelkonfigureeritud pordid tavaliseks arenduseks:
  - 8000 (MkDocs eelvaade)
  - 3000 (Veebirakendused)
  - 5000 (Python Flask)
  - 8080 (API-d)

- **🧩 Uued VS Code laiendused**:
  - `ms-python.vscode-pylance` - Täiustatud Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions tugi
  - `ms-azuretools.vscode-docker` - Docker tugi
  - `ms-azuretools.vscode-bicep` - Bicep keele tugi
  - `ms-azure-devtools.azure-resource-groups` - Azure ressursside haldus
  - `yzhang.markdown-all-in-one` - Markdowni redigeerimine
  - `DavidAnson.vscode-markdownlint` - Markdowni lintimine
  - `bierner.markdown-mermaid` - Mermaid diagrammide tugi
  - `redhat.vscode-yaml` - YAML tugi (azure.yaml jaoks)
  - `eamodio.gitlens` - Giti visualiseerimine
  - `mhutchie.git-graph` - Giti ajalugu

- **⚙️ VS Code seaded**: Lisatud vaikeseaded Python interpreteerija, formateerimise salvestamisel ja tühikute eemaldamise jaoks

- **📦 Uuendatud requirements-dev.txt**:
  - Lisatud MkDocs minify plugin
  - Lisatud pre-commit koodi kvaliteedi kontrolliks
  - Lisatud Azure SDK paketid (azure-identity, azure-mgmt-resource)

#### Parandatud
- **Pärast loomist käivitatav käsk**: Kontrollib nüüd konteineri käivitamisel AZD ja Azure CLI paigaldust

---

### [v3.11.0] - 2026-02-05

#### Algajale sõbralik README ümberkujundus
**See versioon parandab oluliselt README.md ligipääsetavust algajatele ja lisab olulisi ressursse AI arendajatele.**

#### Lisatud
- **🆚 Azure CLI vs AZD võrdlus**: Selge seletus, millal kasutada kumbagi tööriista koos praktiliste näidetega
- **🌟 Suurepärased AZD lingid**: Otselingid kogukonna malligalerii ja panustamise ressurssidele:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ valmis juurutamiseks mõeldud malli
  - [Esita mall](https://github.com/Azure/awesome-azd/issues) - Kogukonna panus
- **🎯 Kiire algus juhend**: Lihtsustatud 3-astmeline alustamine (Install → Login → Deploy)
- **📊 Kogemusel põhinev navigeerimistabel**: Selged juhised, kust alustada lähtudes arendaja tasemest

#### Muudetud
- **README struktuur**: Ümorganiseeritud info järk-järgult kuvamiseks - kõige olulisem esmalt
- **Sissejuhatus**: Ümber kirjutatud, et selgitada "Tõrksat `azd up`" täielikele algajatele
- **Korduv sisu eemaldamine**: Ühepaljuja tõrkeotsingu jaotise eemaldamine
- **Tõrkeotsingu käsud**: Parandatud `azd logs` viide kehtivatele `azd monitor --logs` käskudele

#### Parandatud
- **🔐 Autentimise käsud**: Lisatud `azd auth login` ja `azd auth logout` cheat-sheet.md faili
- **Vale käsuviited**: Eemaldatud allesjäänud `azd logs` README tõrkeotsingu jaotisest

#### Märkused
- **Ulatus**: Muudatused peamiselt README.md ja resources/cheat-sheet.md
- **Sihtgrupp**: Parandused suunatud spetsiaalselt AZD-ga algajatele arendajatele

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI käskude täpsuse uuendus
**See versioon parandab dokumentatsioonis eksisteerimata AZD käsud, tagades, et kõik koodinäited kasutavad kehtivat Azure Developer CLI süntaksit.**

#### Parandatud
- **🔧 Eemaldatud eksisteerimata AZD käsud**: Põhjalik audit ja vigaste käskude parandused:
  - `azd logs` (ei eksisteeri) → asendatud `azd monitor --logs` või Azure CLI alternatiividega
  - `azd service` alamkäsud (ei eksisteeri) → asendatud `azd show` ja Azure CLI käskudega
  - `azd infra import/export/validate` (ei eksisteeri) → eemaldatud või asendatud kehtivate alternatiividega
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` lipud (ei eksisteeri) → eemaldatud
  - `azd provision --what-if/--rollback` lipud (ei eksisteeri) → uuendatud kasutama `--preview`
  - `azd config validate` (ei eksisteeri) → asendatud `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ei eksisteeri) → eemaldatud

- **📚 Failid, kuhu lisati käskude parandused**:
  - `resources/cheat-sheet.md`: Põhjalik käskude refaktor
  - `docs/deployment/deployment-guide.md`: Parandatud rollbacki ja juurutamise strateegiad
  - `docs/troubleshooting/debugging.md`: Parandatud logi analüüsi sektsioonid
  - `docs/troubleshooting/common-issues.md`: Värskendatud tõrkeotsingu käske
  - `docs/troubleshooting/ai-troubleshooting.md`: Parandatud AZD veaotsingu jaotis
  - `docs/getting-started/azd-basics.md`: Parandatud monitooringu käske
  - `docs/getting-started/first-project.md`: Uuendatud monitooringu ja veaotsingu näiteid
  - `docs/getting-started/installation.md`: Parandatud abi ja versiooni näiteid
  - `docs/pre-deployment/application-insights.md`: Parandatud logivaatamise käske
  - `docs/pre-deployment/coordination-patterns.md`: Parandatud agendi veaotsingu käske

- **📝 Versiooniviide uuendatud**:
  - `docs/getting-started/installation.md`: Muudetud kõigi jaoks sobivaks `1.x.x` versiooniks, varem kõva kodeeringuga `1.5.0`, lisatud link avaldustele

#### Muudetud
- **Rollbacki strateegiad**: Dokumentatsioon uuendatud kasutama Git-põhist rollbacki (AZD-l pole natiivset rollbacki)
- **Logivaatamine**: `azd logs` viited asendatud `azd monitor --logs`, `azd monitor --live` ja Azure CLI käskudega
- **Töökindluse sektsioon**: Eemaldatud eksisteerimata paralleelse/incremental juurutamise lipud, lisatud kehtivad alternatiivid

#### Tehnilised detailid
- **Kehtivad AZD käsud**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Kehtivad azd monitor lipud**: `--live`, `--logs`, `--overview`
- **Eemaldatud funktsioonid**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Märkused
- **Kinnitamine**: Käsud valideeritud Azure Developer CLI v1.23.x vastu

---

### [v3.9.0] - 2026-02-05

#### Töötuba valmis ja dokumentatsiooni kvaliteedi uuendus
**See versioon lõpetab interaktiivsete töötubade moodulid, parandab kõik katkised dokumendi lingid ning tõstab üldist sisu kvaliteeti Microsoft AZD-ga AI arendajatele.**

#### Lisatud
- **📝 CONTRIBUTING.md**: Uus panustamisjuhenditega dokument, mis sisaldab:
  - Selged juhised probleemide teatamiseks ja muudatusettepanekuteks
  - Dokumentatsiooni standardid uue sisu jaoks
  - Koodinäidete ja commit-sõnumite juhised
  - Kogukonna kaasamise info

#### Lõpetatud
- **🎯 Töötuba moodul 7 (Kokkuvõte)**: Täielik lõpetamine:
  - Töötoa saavutuste põhjalik kokkuvõte
  - Olulised mõisted AZD, mallide ja Microsoft Foundry kohta
  - Õppeteekonna jätkusuutlikkuse soovitused
  - Töötuba väljakutsete harjutused raskusastmetega
  - Kogukonna tagasiside ja tugilingid

- **📚 Töötuba moodul 3 (Lammutamine)**: Uuendatud õpieesmärkidega:
  - GitHub Copilot MCP serverite aktiveerimine
  - AZD malli kaustastruktuuri mõistmine
  - Infrastruktuur koodina (Bicep) organiseerimise mustrid
  - Praktilised labori juhised

- **🔧 Töötuba moodul 6 (Lammutamine)**: Lõpetatud koos:
  - Ressursside koristuse ja kulude haldamise eesmärkidega
  - `azd down` kasutus infrastruktuuri turvaliseks eemaldamiseks
  - Pehmelt kustutatud kognitiivsete teenuste taastamise juhised
  - Lisauuringute küsimused GitHub Copiloti ja Azure Portali jaoks

#### Parandatud
- **🔗 Katkiste linkide parandused**: Lahendatud 15+ katkist sisemist dokumentatsiooni linki:
  - `docs/ai-foundry/ai-model-deployment.md`: Parandatud microsoft-foundry-integration.md teed
  - `docs/troubleshooting/ai-troubleshooting.md`: Parandatud ai-model-deployment.md ja production-ai-practices.md teed
  - `docs/getting-started/first-project.md`: Asendatud eksisteerimatu cicd-integration.md deployment-guide.md-iga
  - `examples/retail-scenario.md`: Parandatud KKK ja tõrkeotsingu juhendite teed
  - `examples/container-app/microservices/README.md`: Parandatud kursuse avalehe ja juurutusjuhendi teed
  - `resources/faq.md` ja `resources/glossary.md`: Uuendatud AI peatükkide viited
  - `course-outline.md`: Parandatud juhendaja juhendi ja AI töötubade laborite viited

- **📅 Töötuba staatuse bänner**: Muudetud „Under Construction“ aktiivseks, kuupäevaks veebruar 2026

- **🔗 Töötuba navigeerimine**: Parandatud katkised navigeerimislingid README.md-s, mis viitasid olematule lab-1-azd-basics kaustale

#### Muudetud
- **Töötuba esitlus**: Eemaldatud „all ehitamisel“ hoiatus, töötuba on nüüd lõpetatud ja kasutamiseks valmis
- **Navigeerimise järjepidevus**: Kõik töötuba moodulid on korrektselt omavahel seotud
- **Õppeteekonna viited**: Uuendatud peatükkide ristviited õigetele microsoft-foundry teedele

#### Kinnitatud
- ✅ Kõik inglise markdownfailid sisaldavad kehtivaid siseviiteid
- ✅ Töötuba moodulid 0-7 on täielikult lõpetatud koos õppimiseesmärkidega
- ✅ Peatükkide ja moodulite navigeerimine toimib korrektselt
- ✅ Sisu sobib Microsoft AZD kasutavatele AI arendajatele
- ✅ Algajasõbralik keel ja struktuur on kogu dokumentatsioonis säilinud
- ✅ CONTRIBUTING.md annab selged juhised kogukonna panustajatele

#### Tehniline teostus
- **Linkide valideerimine**: Automaatne PowerShell skript kontrollis kogu .md sisesi linke
- **Sisu audit**: Manuaalne ülevaade töötoa täielikkuse ja algajasõbralikkuse osas
- **Navigatsioonisüsteem**: Ühtsed peatükkide ja moodulite navigeerimismustrid rakendatud

#### Märkused
- **Ulatus**: Muudatused kehtivad ainult ingliskeelsele dokumentatsioonile
- **Tõlked**: Tõlke kaustad ei ole selles versioonis uuendatud (automaatne tõlkesünk jätkub hiljem)
- **Töötoa kestus**: Täielik töötuba pakub 3-4 tundi praktilist õppimist

---

### [v3.8.0] - 2025-11-19

#### Täiustatud dokumentatsioon: Monitooring, turvalisus ja mitme agendi mustrid
**See versioon lisab põhjalikud A-klassi õppetunnid Application Insights integreerimisest, autentimismustritest ja mitme agendi koordinatsioonist tootmisse juurutamiseks.**

#### Lisatud
- **📊 Application Insights integreerimise õppetund**: failis `docs/pre-deployment/application-insights.md`:
  - AZD-põhine juurutus automaatse provisjonimisega
  - Täielikud Bicep mallid Application Insights + Log Analytics jaoks
  - Töötavad Python rakendused kohandatud telemeetriaga (üle 1200 rea)
  - AI/LLM monitooringumustrid (Microsoft Foundry mudelite token/kulu jälgimine)
  - 6 Mermaid diagrammi (arhitektuur, hajutatud jälgimine, telemeetria voog)
  - 3 praktilist ülesannet (hädalõud, juhtpaneelid, AI monitooring)
  - Kusto päringunäited ja kulude optimeerimise strateegiad
  - Otseülekande metrikad ja reaalaja veaotsing
  - Õppematerjali aeg ca 40-50 minutit tootmiskõlblike mustritega

- **🔐 Autentimise ja turvalisuse mustrid**: failis `docs/getting-started/authsecurity.md`:
  - 3 autentimismustrit (ühendusstringid, Key Vault, hallatav identiteet)
  - Täielikud Bicep infrastruktuuri mallid turvalise juurutuse jaoks
  - Node.js rakenduse kood Azure SDK integratsiooniga
  - 3 praktilist ülesannet (hallitava identiteedi lubamine, kasutaja määratud identiteet, Key Vaulti pööramine)
  - Turvalisuse parimad praktikad ja RBAC konfiguratsioonid
  - Tõrkeotsingu juhend ja kulude analüüs
  - Tootmiskõlblikud paroolivabad autentimismustrid

- **🤖 Mitme agendi koordinatsiooni mustrid**: failis `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinatsioonimustrit (järjestikune, paralleelne, hierarhiline, sündmuspõhine, konsensus)
  - Täielik orchestreerimisteenuse teostus (Python/Flask, üle 1500 rea)
  - 3 spetsialiseeritud agendi teostused (Uurija, Kirjutaja, Toimetaja)
  - Service Bus integratsioon sõnumijärjekorraks
  - Cosmos DB olekuhaldus hajutatud süsteemidele
  - 6 Mermaid diagrammi agendi interaktsioonidega
  - 3 täiustatud ülesannet (aegumishaldus, taaskatsete loogika, kaitselüliti)
  - Kuluaruanne ($240-565 kuus) ja optimeerimise strateegiad
  - Application Insights integratsioon monitoorimiseks

#### Täiustatud
- **Eeljõustamise peatükk**: Lisatud põhjalik monitooringu ja koordinatsiooni mustrite osakaal
- **Alustamise peatükk**: Täiustatud professionaalsete autentimismustritega
- **Tootmiskõlblikkus**: Täielik katvus turvalisusest jälgitavuseni
- **Kursuse ülevaade**: Uuendatud viited peatükkidele 3 ja 6 uute õppetundidega

#### Muudetud
- **Õppimise järjepidevus**: Parandatud turvalisuse ja monitooringu integreerimine kogu kursuse vältel
- **Dokumentatsiooni kvaliteet**: Ühtlustatud A-klassi standardid (95-97%) uutes õppetundides
- **Tootmismustrid**: Täielik otsast lõpuni katvus ettevõtte juurutuste puhul

#### Parandatud
- **Arendajakogemus**: Selge tee arendusest tootmisse monitooringuni  
- **Turvastandardid**: Professionaalsed mustrid autentimiseks ja saladuste halduseks  
- **Jälgitavus**: Täielik Application Insights integratsioon AZD-ga  
- **AI töökoormused**: Spetsiaalne monitooring Microsoft Foundry mudelitele ja mitme agendi süsteemidele  

#### Kinnitatud  
- ✅ Kõik õppetunnid sisaldavad täielikku töötavat koodi (mitte ainult lõike)  
- ✅ Mermaid diagrammid visuaalseks õppimiseks (kokku 19, 3 õppetunni jooksul)  
- ✅ Praktilised harjutused koos kontrollsammudega (kokku 9)  
- ✅ Tootmiskõlblikud Bicep mallid, mida saab juurutada `azd up` käsuga  
- ✅ Kuluanalüüs ja optimeerimisstrateegiad  
- ✅ Tõrkeotsingu juhendid ja parimad praktikad  
- ✅ Teadmiste kontrollpunktid koos verifikatsioonikäsklustega  

#### Dokumentatsiooni hindamise tulemused  
- **docs/pre-deployment/application-insights.md**: - Põhjalik monitooringu juhend  
- **docs/getting-started/authsecurity.md**: - Professionaalsed turvamustrid  
- **docs/pre-deployment/coordination-patterns.md**: - Täiustatud mitme agendi arhitektuurid  
- **Kogu uus sisu**: - Järjepidevalt kõrged kvaliteedistandardid  

#### Tehniline teostus  
- **Application Insights**: Log Analytics + kohandatud telemeetria + hajutatud jälgimine  
- **Autentimine**: Managed Identity + Key Vault + RBAC mustrid  
- **Mitme agenti tugi**: Service Bus + Cosmos DB + Container Apps + orkestreerimine  
- **Monitooring**: Reaalajas mõõdikud + Kusto päringud + hoiatused + juhtpaneelid  
- **Kulukontroll**: Valimistusstrateegiad, säilituspoliitikad, eelarve kontroll  

### [v3.7.0] - 2025-11-19  

#### Dokumentatsiooni kvaliteedi paranemine ja uus Microsoft Foundry mudelite näide  
**See versioon parandab kogu hoidla dokumentatsiooni kvaliteeti ja lisab täieliku Microsoft Foundry mudelite juurutamise näite gpt-4.1 vestlusliidesega.**  

#### Lisatud  
- **🤖 Microsoft Foundry mudelite vestlusnäide**: Täielik gpt-4.1 juurutus koos töökõlbliku rakendusega kataloogis `examples/azure-openai-chat/`:  
  - Täielik Microsoft Foundry mudelite infrastruktuur (gpt-4.1 mudeli juurutus)  
  - Pythoni käsurea vestlusliides vestlusajaloo salvestusega  
  - Key Vault integreerimine turvaliseks API võtme hoidmiseks  
  - Sõnumite kasutuse jälgimine ja kulu prognoos  
  - Piirangute seadmine ja veakäsitlus  
  - Põhjalik README 35–45-minutilise juurutusjuhisega  
  - 11 tootmiskõlblikku faili (Bicep mallid, Python rakendus, konfiguratsioon)  
- **📚 Dokumentatsiooni harjutused**: Lisatud praktilised harjutused konfiguratsiooni juhendisse:  
  - Harjutus 1: Mitmekeskkondade seadistus (15 minutit)  
  - Harjutus 2: Saladuste haldamise praktikad (10 minutit)  
  - Selged õnnestumiskriteeriumid ja kontrollsammud  
- **✅ Juurutuse verifitseerimine**: Lisatud verifikatsiooni sektsioon juurutusjuhendisse:  
  - Tervisekontrolli protseduurid  
  - Edukuse kriteeriumite kontrollnimekiri  
  - Oodatavad väljundid kõikide juurutuskäskude puhul  
  - Kiire tõrkeotsingu viide  

#### Täiustatud  
- **examples/README.md**: Uuendatud A-klassi kvaliteedile (93%):  
  - Lisatud azure-openai-chat kõigisse asjakohastesse sektsioonidesse  
  - Muudetud kohalikud näited 3-st 4-ni  
  - Lisatud AI rakenduste näidete tabelisse  
  - Integreeritud otse sissejuhatusse keskastme kasutajatele  
  - Lisatud Microsoft Foundry mallide sektsiooni  
  - Uuendatud võrdlustabeli ja tehnoloogia leidmise sektsioonid  
- **Dokumentatsiooni kvaliteet**: Paranenud B+ (87%) → A- (92%) kogu docs kaustas:  
  - Lisatud oodatud väljundid kriitilistele käskude näidetele  
  - Lisatud konfiguratsiooni muudatuste kontrollsammud  
  - Täiustatud praktilist õppimist harjutustega  

#### Muudetud  
- **Õppeprotsess**: Paremini integreeritud AI näited keskastme õpilastele  
- **Dokumentatsiooni ülesehitus**: Rohkem tegevuspõhiseid harjutusi koos selgete tulemustega  
- **Verifitseerimisprotsess**: Lisatud selged õnnestumiskriteeriumid võtme töövoogudele  

#### Parandatud  
- **Arendajakogemus**: Microsoft Foundry mudelite juurutus võtab nüüd 35–45 minutit (varem 60–90 min keerulisemate alternatiivide puhul)  
- **Kulu läbipaistvus**: Selged kuluprognoosid ($50–200/kuus) Microsoft Foundry mudeli näite jaoks  
- **Õppeteekond**: AI-arendajatele selge sisenemispunkt azure-openai-chat näitel  
- **Dokumentatsiooni standardid**: Järjepidevad oodatavad väljundid ja verifikatsioonisammud  

#### Kinnitatud  
- ✅ Microsoft Foundry mudeli näide töötab täielikult `azd up` käsuga  
- ✅ Kõik 11 rakendusfaili on süntaktiliselt korrektsed  
- ✅ README juhised vastavad tegelikule juurutusprotsessile  
- ✅ Dokumentatsiooni lingid uuendatud üle 8 koha  
- ✅ Näidete indeks täpselt peegeldab 4 kohalikku näidet  
- ✅ Ei ole duplikaatväliseid linke tabelites  
- ✅ Kõik navigeerimisviited korrektsed  

#### Tehniline teostus  
- **Microsoft Foundry mudelite arhitektuur**: gpt-4.1 + Key Vault + Container Apps mustrid  
- **Turvalisus**: Managed Identity kasutamiseks valmis, saladused Key Vaultis  
- **Monitooring**: Application Insights integratsioon  
- **Kulude haldus**: Sõnumite jälgimine ja kasutuse optimeerimine  
- **Juurutus**: Üks `azd up` käsk kogu seadistuseks  

### [v3.6.0] - 2025-11-19  

#### Suur uuendus: Container App juurutuse näited  
**See versioon toob kaasa põhjalikud tootmiskõlblikud konteinerirakenduste juurutamise näited Azure Developer CLI (AZD) abil koos täieliku dokumentatsiooni ja õppeteega.**  

#### Lisatud  
- **🚀 Container App näited**: Uued kohalikud näited kataloogis `examples/container-app/`:  
  - [Põhijuhend](examples/container-app/README.md): Täielik ülevaade konteineriseeritud juurutustest, kiire algus, tootmine ja täiustatud mustrid  
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api): Algajale sõbralik REST API koos skaaleerimise, tervisekontrollide, monitooringu ja tõrkeotsinguga  
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices): Tootmiskõlblik mitmeteenuse juurutus (API Gateway, toode, tellimus, kasutaja, teavitused), asünkroonne sõnumside, Service Bus, Cosmos DB, Azure SQL, hajutatud jälgimine, sinine-roheline ja kanarilennu juurutus  
- **Parimad praktikad**: Turvalisus, monitooring, kulude optimeerimine ja CI/CD juhised konteinerikoormustele  
- **Koodinäited**: Täielik `azure.yaml`, Bicep mallid ja mitmekeelsed teenuse implementatsioonid (Python, Node.js, C#, Go)  
- **Testimine ja tõrkeotsing**: Täielikud teststsenaariumid, monitooringukäsud, tõrkeotsingu juhised  

#### Muudetud  
- **README.md**: Uuendatud, et kuvada ja siduda uued konteinerirakenduste näited alajaotuses "Kohalikud näited – konteinerirakendused"  
- **examples/README.md**: Uuendatud konteinerirakenduste näitude esiletõstmiseks, võrdlustabeli lisamiseks ja tehnoloogia/arhitektuuri viidete värskendamiseks  
- **Kursuse ülevaade ja õpijuhend**: Uuendatud, et viidata uutele konteinerirakenduste näidetele ja juurutusmustritele vastavates peatükkides  

#### Kinnitatud  
- ✅ Kõiki uusi näiteid saab juurutada `azd up` käsuga ja need järgivad parimaid tavasid  
- ✅ Dokumentatsiooni ristviited ja navigeerimine on uuendatud  
- ✅ Näited katavad stsenaarioid algajast täiustatud tasemeni, sh tootmis mikroteenused  

#### Märkused  
- **Ulatus**: Ainult ingliskeelne dokumentatsioon ja näited  
- **Järgmised sammud**: Tõhustada täiendavate arenenud konteinerimustrite ja CI/CD automatiseerimisega tulevastes versioonides  

### [v3.5.0] - 2025-11-19  

#### Tootemärgistusmuudatus: Microsoft Foundry  
**See versioon teostab täieliku tootemärgi nime vahetuse "Microsoft Foundry" vastu kogu ingliskeelses dokumentatsioonis, peegeldades Microsofti ametlikku ümbernimetamist.**  

#### Muudetud  
- **🔄 Tootenime uuendus**: Täielik ümbernimetamine "Microsoft Foundry"-ks  
  - Kõik viited uuendatud ingliskeelses dokumentatsioonis kaustas `docs/`  
  - Kaust nimetatud ümber: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
  - Faili nimi muudetud: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - Kokku: 23 sisulist viidet uuendatud 7 dokumentatsioonifailis  

- **📁 Kaustastruktuuri muudatused**:  
  - `docs/ai-foundry/` nimetatud ümber `docs/microsoft-foundry/`  
  - Kõik ristviited uuendatud vastama uuele kaustastruktuurile  
  - Navigeerimislingid kontrollitud kogu dokumentatsioonis  

- **📄 Failinimede muutmine**:  
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - Kõik sisemised lingid uuendatud vastama uuele failinimele  

#### Uuendatud failid  
- **Peatükkide dokumentatsioon** (7 faili):  
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigeerimislingi uuendust  
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 toodete nimetuse viidet uuendatud  
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Juba kasutab Microsoft Foundry’d (eelmisest uuendusest)  
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 viidet uuendatud (ülevaade, kogukonna tagasiside, dokumentatsioon)  
  - `docs/getting-started/azd-basics.md` - 4 ristviite lingi uuendust  
  - `docs/getting-started/first-project.md` - 2 peatüki navigeerimislingi uuendust  
  - `docs/getting-started/installation.md` - 2 järgmise peatüki lingi uuendust  
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 viidet uuendatud (navigeerimine, Discord kogukond)  
  - `docs/troubleshooting/common-issues.md` - 1 navigeerimislink uuendatud  
  - `docs/troubleshooting/debugging.md` - 1 navigeerimislink uuendatud  

- **Kursuse struktuuri failid** (2 faili):  
  - `README.md` - 17 viidet uuendatud (kursuse ülevaade, peatükkide nimed, mallide sektsioon, kogukonna mõtted)  
  - `course-outline.md` - 14 viidet uuendatud (ülevaade, õpieesmärgid, peatükkide ressursid)  

#### Kinnitatud  
- ✅ Mitte ühtegi allesjäänud "ai-foundry" kausta teed ingliskeelses dokumentatsioonis  
- ✅ Mitte ühtegi allesjäänud "Microsoft Foundry" tootemärgi nime viidet ingliskeelses dokumentatsioonis  
- ✅ Kõik navigeerimislingid toimivad uue kaustastruktuuriga  
- ✅ Faili- ja kaustanime muutused edukalt lõpule viidud  
- ✅ Ristviited peatükkide vahel kontrollitud  

#### Märkused  
- **Ulatus**: Muudatused tehtud ainult ingliskeelsele dokumentatsioonile kaustas `docs/`  
- **Tõlked**: Tõlkekaustad (`translations/`) pole selles versioonis uuendatud  
- **Töötoad**: Töötoastematerjalid (`workshop/`) pole selles versioonis uuendatud  
- **Näited**: Näidist failid võivad endiselt sisaldada vana nimetust (parandatakse tulevikus)  
- **Välised lingid**: Välised URL-id ja GitHubi hoidlaviited jäävad muutumatuks  

#### Kaasautoritele migreerimisjuhend  
Kui teil on kohalikud harud või dokumentatsioon, mis viitab vanale struktuurile:  
1. Uuendage kaustaviited: `docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. Uuendage failiviited: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. Asendage tootenimi: "Microsoft Foundry" → "Microsoft Foundry"  
4. Kontrollige, et kõik sisemised dokumendi lingid töötaksid endiselt  

---

### [v3.4.0] - 2025-10-24  

#### Infrastruktuuri eelvaade ja verifitseerimise täiustused  
**See versioon toob kaasa põhjaliku toe uuele Azure Developer CLI eelvaate funktsioonile ning parandab töötoa kasutajakogemust.**  

#### Lisatud  
- **🧪 azd provision --preview funktsiooni dokumentatsioon**: Põhjalik ülevaade uuest infrastruktuuri eelvaate võimest  
  - Käskluse viide ja kasutusnäited kiirabi lehel  
  - Detailne integreerimine juurutusjuhendis koos kasutusjuhtude ja eelistega  
  - Eelkontrolli integreerimine ohutumaks juurutuse valideerimiseks  
  - Algaja juhised ohutu juurutamise praktikatega  
- **🚧 Töötoa oleku bänner**: Professionaalne HTML bänner töötoa arendusstaatuse näitamiseks  
  - Gradientne disain ehitustähisega selgeks kasutajate teavitamiseks  
  - Viimane uuendus kuupäev läbipaistvuseks  
  - Mobiilseadmetele responsiivne kujundus  

#### Täiustatud  
- **Infrastruktuuri turvalisus**: Eelvaate funktsionaalsus integreeritud kogu juurutusdokumentatsiooni ulatuses  
- **Enne juurutust valideerimine**: Automatiseeritud skriptid nüüd sisaldavad infrastruktuuri eelvaate testi  
- **Arendaja töövoog**: Käskude jada uuendatud, et eelvaade oleks parima tava osa  
- **Töötoa kogemus**: Kasutajatele selged ootused välja töötamisel oleva sisu kohta  

#### Muudetud  
- **Juurutuse parimad praktikad**: Eelvaatel põhinev töövoog nüüd soovitatav lähenemine  
- **Dokumentatsiooni voog**: Infrastruktuuri valideerimine toodud varasemasse õppeprotsessi  
- **Töötoa esitlemine**: Professionaalne staatuseside koos selge arendusgraafikuga  

#### Parandatud  
- **Turvalisus esmalt**: Infrastruktuuri muudatusi saab nüüd enne juurutust valideerida  
- **Meeskonnatöö**: Eelvaate tulemusi saab jagada ülevaatuseks ja kinnituseks  
- **Kulu teadlikkus**: Resursside kulude parem mõistmine enne juurutust  
- **Riski maandamine**: Vähenenud juurutuse ebaõnnestumised tänu eelkontrollile  

#### Tehniline teostus  
- **Mitu dokumenti integreeritud**: Eelvaate funktsioon dokumenteeritud 4 põhifailis  
- **Käskluse mustrid**: Järjepidev süntaks ja näited kogu dokumentatsioonis  
- **Parimate tavade integreerimine**: Eelvaade lisatud valideerimise töövoogudesse ja skriptidesse  
- **Visuaalsed märgid**: Selged UUED funktsionaalsuse märgistused avastatavuse parandamiseks  

#### Töötoa infrastruktuur  
- **Oleku edastamine**: Professionaalne HTML bänner gradient-stiilis  
- **Kasutajakogemus**: Selge arendusstaatus väldib segadust  
- **Professionaalne esitus**: Säilitab hoidla usaldusväärsuse ja seab ootusi  
- **Ajaskaala läbipaistvus**: Oktoober 2025 viimane uuendus kuupäev vastutuse näitamiseks  

### [v3.3.0] - 2025-09-24  

#### Täiustatud töötoa materjalid ja interaktiivne õppimiskogemus  
**See versioon toob kaasa põhjalikud töötoa materjalid, sirvijas põhinevad interaktiivsed juhendid ja struktureeritud õpikeskkonnad.**  

#### Lisatud  
- **🎥 Interaktiivne töötoa juhend**: Brauseripõhine töötoa kogemus koos MkDocs eelvaate võimalusega
- **📝 Struktureeritud töötoa juhised**: 7-astmeline juhendatud õpitee avastamisest kohandamiseni
  - 0-Sissejuhatus: töötoa ülevaade ja seadistamine
  - 1-Vali-AI-mall: Malli avastamise ja valimise protsess
  - 2-Kinnita-AI-mall: Deploy ja valideerimise protseduurid
  - 3-Lahuta-AI-mall: Malli arhitektuuri mõistmine
  - 4-Konfigureeri-AI-mall: Konfiguratsioon ja kohandamine
  - 5-Kohanda-AI-mall: Täpsemad muudatused ja iteratsioonid
  - 6-Lahusta-taristu: Puhastamine ja ressursside haldamine
  - 7-Kokkuvõte: Kokkuvõte ja järgmised sammud
- **🛠️ Töötoa tööriistad**: MkDocs konfiguratsioon Materjali teemaga parema õpikogemuse jaoks
- **🎯 Praktikaõppe tee**: 3-astmeline metoodika (Avastus → Deploy → Kohandamine)
- **📱 GitHub Codespaces integratsioon**: Sujuv arenduskeskkonna seadistus

#### Täiustatud
- **AI töötoa labor**: Laiendatud 2-3-tunnise struktureeritud õpikogemusega
- **Töötoa dokumentatsioon**: Professionaalne esitlus koos navigeerimise ja visuaalsete abivahenditega
- **Õppimise edenemine**: Selge samm-sammult juhend mallide valimisest tootmisele deploy‘ni
- **Arendajakogemus**: Integreeritud tööriistad sujuvamaks arendusvoogudeks

#### Parendatud
- **Juurdepääsetavus**: Brauseripõhine liides otsingu, kopeerimisfunktsionaalsuse ja teema lülitiga
- **Iseseisev õppimine**: Paindlik töötoasüsteem erinevate õpikiiruste jaoks
- **Praktiline rakendamine**: Reaalmaailma AI-mallide deploy stsenaariumid
- **Kogukonna integratsioon**: Discordi integratsioon töötoa toe ja koostöö jaoks

#### Töötoa funktsioonid
- **Integreeritud otsing**: Kiire märksõnade ja õppetükkide leidmine
- **Kopeeri koodiplokid**: Õpetamine hoidmisel kopeerimise funktsionaalsus kõigi koodinäidete jaoks
- **Teema lüliti**: Tumedate/heledate režiimide tugi erinevate eelistuste jaoks
- **Visuaalsed varad**: Ekraanipildid ja diagrammid parema mõistmise toetuseks
- **Abi integratsioon**: Otsene Discordi juurdepääs kogukonna toe jaoks

### [v3.2.0] - 2025-09-17

#### Suur navigeerimisstruktuuri ümberkorraldus ja peatükkidel põhinev õppesüsteem  
**See versioon tutvustab terviklikku peatükkidel põhinevat õppesüsteemi koos täiustatud navigeerimisega kogu repositooriumis.**

#### Lisatud
- **📚 Peatükkidel põhinev õppesüsteem**: Kogu kursus on ümber struktureeritud 8 järjestikku õppepeatükiks  
  - Peatükk 1: Alused ja kiire algus (⭐ - 30-45 minutit)  
  - Peatükk 2: AI-esmane arendus (⭐⭐ - 1-2 tundi)  
  - Peatükk 3: Konfiguratsioon & Autentimine (⭐⭐ - 45-60 minutit)  
  - Peatükk 4: Taristu koodina & Deploy (⭐⭐⭐ - 1-1,5 tundi)  
  - Peatükk 5: Mitmeagendi AI lahendused (⭐⭐⭐⭐ - 2-3 tundi)  
  - Peatükk 6: Eeldeploy valideerimine & planeerimine (⭐⭐ - 1 tund)  
  - Peatükk 7: Veaparandus ja silumine (⭐⭐ - 1-1,5 tundi)  
  - Peatükk 8: Tootmis- ja ettevõtte mustrid (⭐⭐⭐⭐ - 2-3 tundi)  
- **📚 Kõikehõlmav navigeerimissüsteem**: Ühtsed navigeerimispealkirjad ja jalused kogu dokumentatsioonis  
- **🎯 Edusamme jälgimine**: Kursuse lõpetamise kontrollnimekiri ja õppe kontrollsüsteem  
- **🗺️ Õppeteekonna juhendamine**: Selged sissepääsupunktid erinevate kogemustasemete ja eesmärkide jaoks  
- **🔗 Ristviitamise navigeerimine**: Seotud peatükid ja eeltingimused selgelt lingitud

#### Täiustatud
- **README struktuur**: Muudetud peatükkidel põhinevaks õppeplatvormiks  
- **Dokumentatsiooni navigeerimine**: Igal lehel on nüüd peatüki kontekst ja edenemise juhised  
- **Mallide organiseerimine**: Näited ja mallid on kaardistatud sobivate õppimispeatükkidega  
- **Ressursside integratsioon**: Vihikute, KKK-de ja õppejuhendite ühendus vastavate peatükkidega  
- **Töötoa integratsioon**: Käed-külge töölaborid kaardistatud mitmele peatükile

#### Muudetud
- **Õppimise edenemine**: Liinilt lineaarsele dokumentatsioonilt paindlikule peatükkidel põhinevale õppimisele  
- **Konfiguratsiooni asukoht**: Ümber paigutatud konfiguratsioonijuhend peatükiks 3 parema õppevoo jaoks  
- **AI-sisu integratsioon**: Parem AI-spetsiifilise sisu integreerimine kogu õppe jooksul  
- **Tootmissisu**: Täpsemad mustrid koondatud peatükki 8 ettevõtte õppijate jaoks

#### Parendatud
- **Kasutajakogemus**: Selged navigeerimismurdjad ja peatükkide edenemise näitajad  
- **Juurdepääsetavus**: Järjepidevad navigeerimismustrid kursuse lihtsamaks läbimiseks  
- **Professionaalne esitlus**: Ülikoolistiilis kursusestruktuur sobilik akadeemilisele ja korporatiivsele koolitusele  
- **Õppe efektiivsus**: Vähendatud aeg asjakohase sisu leidmiseks parema korraldusega

#### Tehniline rakendus
- **Navigeerimispealkirjad**: Ühtlustatud peatükkide navigeerimine üle 40 dokumentatsioonifaili  
- **Jalusnavigeerimine**: Ühtsed edenemisjuhised ja peatükkide lõpetamise näitajad  
- **Ristlinkimine**: Täielik sisemine linkimise süsteem mõistete ühendamiseks  
- **Peatükkide kaardistamine**: Mallid ja näited on selgelt seotud õpieesmärkidega

#### Õppejuhendi täiustus
- **📚 Kõikehõlmavad õpieesmärgid**: Õppejuhendi ümberstruktureerimine 8-peatükilise süsteemi järgi  
- **🎯 Peatükkidel põhinev hindamine**: Iga peatükk sisaldab konkreetseid õpieesmärke ja praktilisi harjutusi  
- **📋 Edusammude jälgimine**: Nädalane õppekava mõõdetavate tulemustega ja lõpetamise kontrollidega  
- **❓ Hindamisküsimused**: Iga peatüki teadmiste kontrolli küsimused professionaalsete tulemuste saavutamiseks  
- **🛠️ Praktilised harjutused**: Käed-külge tegevused reaalse deploy ja probleemide lahendamise stsenaariumitega  
- **📊 Oska edenemine**: Selge areng baasidest ettevõtte mustriteni koos karjääriarengu keskendunud  
- **🎓 Sertifitseerimiskava**: Professionaalse arengu tulemused ja kogukonna tunnustus  
- **⏱️ Ajaplaneerimine**: Struktureeritud 10-nädalane õppimisplaan koos verstapostide valideerimisega

### [v3.1.0] - 2025-09-17

#### Täiustatud mitmeagendi AI lahendused  
**See versioon parandab mitmeagendi jaekaubanduse lahendust paremate agendi nimede ja täiustatud dokumentatsiooniga.**

#### Muudetud
- **Mitmeagendi terminoloogia**: "Cora agent" asendatud kogu jaekaubanduse mitmeagendi lahenduses "Kliendi agendiga" parema arusaamise eesmärgil  
- **Agendi arhitektuur**: Uuendatud kogu dokumentatsioon, ARM mallid ja koodinäited, et kasutada ühtset "Kliendi agent" nimetust  
- **Konfiguratsiooni näited**: Moderniseeritud agendi konfiguratsiooni mustrid koos uuendatud nimetamisega  
- **Dokumentatsiooni järjepidevus**: Veenduti, et kõik viited kasutavad professionaalseid ja kirjeldavaid agendi nimesid

#### Täiustatud
- **ARM malli paketid**: Uuendatud retail-multiagent-arm-template koos Kliendi agendi viidetega  
- **Arhitektuuri diagrammid**: Värskendatud Mermaid diagrammid uue agendi nimetusega  
- **Koodinäited**: Pythoni klassid ja rakenduse näited kasutavad nüüd CustomerAgent nimetust  
- **Keskkonnamuutujad**: Uuendatud kõik deploy skriptid, kasutades CUSTOMER_AGENT_NAME mustrit

#### Parendatud
- **Arendajakogemus**: Selgemad agendi rollid ja vastutused dokumentatsioonis  
- **Tootmise valmisolek**: Parem kooskõla ettevõtte nimetamise tavadega  
- **Õppematerjalid**: Intuitiivsem agendi nimetus hariduslikel eesmärkidel  
- **Malli kasutatavus**: Agent funktsioonide ja deploy mustrite lihtsam mõistmine

#### Tehnilised üksikasjad
- Värskendatud Mermaid arhitektuuri diagrammid CustomerAgent viidetega  
- Asendatud CoraAgent klassinimed CustomerAgent nimedega Python näidetes  
- Muudetud ARM mallide JSON konfiguratsioonid, kasutades "customer" agendi tüüpi  
- Uuendatud keskkonnamuutujad CORA_AGENT_* asemel CUSTOMER_AGENT_* mustritele  
- Värskendatud kõik deploy käsud ja konteineri konfiguratsioonid

### [v3.0.0] - 2025-09-12

#### Suured muudatused - AI arendajate rõhuasetus ja Microsoft Foundry integratsioon  
**See versioon muudab repositooriumi terviklikuks AI-keskseks õppematerjaliks Microsoft Foundry integratsiooniga.**

#### Lisatud
- **🤖 AI-esmane õppeteekond**: Täielik ümberkorraldus AI arendajate ja inseneride prioriteediga  
- **Microsoft Foundry integratsiooni juhend**: Terviklik dokumentatsioon AZD ühendamiseks Microsoft Foundry teenustega  
- **AI mudelite deploy mustrid**: Detailne juhend mudelite valikuks, konfiguratsiooniks ja tootmises deployks  
- **AI töötoa labor**: 2-3-tunnine praktiline töötoa seanss AI rakenduste konverteerimiseks AZD deploy lahendusteks  
- **Tootmise AI parimad tavad**: Ettevõtte valmis mustrid AI töökoormuste skaleerimiseks, järelevalveks ja turvalisuseks  
- **AI-spetsiifiline probleemilahendus**: Täielik probleemide lahenduse juhend Microsoft Foundry mudelite, kognitiivsete teenuste ja AI deploy probleemide jaoks  
- **AI malligalerii**: Esile toodud Microsoft Foundry mallide kogumik keerukuse hindega  
- **Töötoa materjalid**: Täielik töötoastruktuur koos praktiliste laborite ja viitematerjalidega

#### Täiustatud
- **README struktuur**: AI arendajale suunatud koos 45% kogukonna huvigraafikuga Microsoft Foundry Discordist  
- **Õppeteed**: AI arendajate pühendatud tee kõrval traditsioonilised teed tudengitele ja DevOps inseneridele  
- **Mallisoovitused**: Esile tõstetud AI mallid, sh azure-search-openai-demo, contoso-chat ja openai-chat-app-quickstart  
- **Kogukonna integratsioon**: Täiustatud Discordi kogukonna tugi AI-spetsiifiliste kanalite ja aruteludega

#### Turvalisuse & tootmise rõhuasetus
- **Hallatud identiteedi mustrid**: AI-spetsiifiline autentimine ja turvakonfiguratsioonid  
- **Kulude optimeerimine**: Tokeni kasutamise jälgimine ja eelarve kontroll AI töökoormustele  
- **Mitme regiooni deploy**: Globaalsete AI rakenduste juurutamise strateegiad  
- **Jõudluse jälgimine**: AI-spetsiifilised mõõdikud ja Application Insights integratsioon

#### Dokumentatsiooni kvaliteet
- **Lineaarsed kursused**: Loogiline edenemine algajast edasijõudnute AI deploy mustriteni  
- **Valideeritud URL-id**: Kõik välised repositooriumi lingid kontrollitud ja kättesaadavad  
- **Täielik viiteaine**: Kõik sisemised dokumentatsiooni lingid valideeritud ja funktsionaalsed  
- **Tootmiseks valmis**: Ettevõtte deploy mustrid koos reaalsete näidetega

### [v2.0.0] - 2025-09-09

#### Suured muudatused - repositooriumi ümberkorraldus ja professionaalsuse tõstmine  
**See versioon tähistab märkimisväärset repositooriumi struktuuri ja sisuesitluse uuendust.**

#### Lisatud
- **Struktureeritud õpiraamistik**: Kõik dokumentatsioonilehed sisaldavad nüüd Sissejuhatust, Õpieesmärke ja Õppetulemusi  
- **Navigeerimissüsteem**: Lisatud Eelmine/Järgmine õppetükk lingid kogu dokumentatsioonis juhitud õppe edenemiseks  
- **Õppejuhend**: Kõikehõlmav study-guide.md koos õpieesmärkide, harjutuste ja hindamisvahenditega  
- **Professionaalne esitlus**: Kõik emoji ikoonid eemaldatud parema juurdepääsetavuse ja professionaalse välimuse tagamiseks  
- **Täiustatud sisustruktuur**: Paranenud õppematerjalide korraldus ja vool

#### Muudetud
- **Dokumentaatiooniformaat**: Kõik dokumentatsioonid ühtlustatud õppimiskeskse struktuuriga  
- **Navigeerimisvoog**: Rakendatud loogiline progression kõigi õppematerjalide sees  
- **Sisuesitlus**: Eemaldatud dekoratiivsed elemendid selge ja professionaalse vorminduse kasuks  
- **Lingistruktuur**: Uuendatud kõik sisemised lingid uue navigeerimissüsteemi toetamiseks

#### Parendatud
- **Juurdepääsetavus**: Emoji-de eemale jätmine parema ekraanilugejate toe huvides  
- **Professionaalsus**: Puhtad, akadeemilise stiiliga esitlused ettevõtteõppe jaoks sobivad  
- **Õppekogemus**: Struktureeritud lähenemine iga õppetüki selgete eesmärkide ja tulemustega  
- **Sisukorraldus**: Paremini loogiliselt seotud ja ühendatud teemad

### [v1.0.0] - 2025-09-09

#### Esialgne väljalase - terviklik AZD õppe repositoorium

#### Lisatud
- **Põhidokumentatsiooni struktuur**
  - Täielik alustamise juhendite sari  
  - Kõikehõlmav deploy ja provisjonimise dokumentatsioon  
  - Üksikasjalikud tõrkeotsingu ressursid ja silumisjuhised  
  - Eeldeploy valideerimise tööriistad ja protseduurid

- **Alustamise moodul**
  - AZD alused: põhimõisted ja terminoloogia  
  - Paigaldamise juhend: platvormispetsiifilised seadistusjuhised  
  - Konfiguratsiooni juhend: keskkonna seadistamine ja autentimine  
  - Esimene projektitutvustus: samm-sammult praktiline õppimine

- **Deploy ja provisjonimise moodul**
  - Deploy juhend: täielik töövoogu dokumentatsioon  
  - Provisjonimise juhend: infrastruktuur koodina koos Bicep-iga  
  - Parimad tavad tootmise deploydeks  
  - Mitme teenuse arhitektuurimustrid

- **Eeldeploy valideerimise moodul**
  - Mahuplaanimine: Azure ressursside saadavuse valideerimine  
  - SKU valik: teenuse astme põhjalik juhend  
  - Eelkontrollid: automatiseeritud valideerimisskriptid (PowerShell ja Bash)  
  - Kulude hinnang ja eelarve planeerimise tööriistad

- **Tõrkeotsingu moodul**
  - Levinumad probleemid: sagedasemad probleemid ja lahendused  
  - Silumisjuhend: süstemaatilised tõrkeotsingu metoodikad  
  - Täiustatud diagnostikatehnikad ja tööriistad  
  - Jõudluse jälgimine ja optimeerimine

- **Ressursid ja viited**
  - Käskude kiirjuhend: kiire viide olulistele käskudele  
  - Sõnastik: terminite ja akronüümide põhjalik definitsioon  
  - KKK: üksikasjalikud vastused sagedastele küsimustele  
  - Välised ressurssid ja kogukonna ühendused

- **Näited ja mallid**
  - Lihtne veebirakenduse näide  
  - Staatilise veebi paigaldamise mall  
  - Konteinerirakenduse konfiguratsioon  
  - Andmebaasi integratsiooni mustrid  
  - Mikroteenuste arhitektuuri näited  
  - Serverita funktsioonide rakendused

#### Omadused
- **Mitme platvormi tugi**: paigaldus- ja konfiguratsioonijuhised Windowsile, macOS-ile ja Linuxile  
- **Erinevad oskustasemed**: sisu mõeldud tudengitest kuni professionaalsete arendajateni  
- **Praktiline fookus**: käed-külge näited ja reaalmaailma stsenaariumid  
- **Kõikehõlmav valdus**: alates põhimõistetest kuni edasijõudnud ettevõtte mustriteni  
- **Turvalisus esikohal**: turvapraktikad integreeritud üle kogu materjali  
- **Kulude optimeerimine**: juhised kulutõhusate deployde ja ressursside haldamise jaoks

#### Dokumentatsiooni kvaliteet
- **Üksikasjalikud koodinäited**: praktilised, testitud koodinäited  
- **Samm-sammult juhised**: selged, tegevusele suunatud juhised  
- **Tõrkehalduse terviklahendused**: levinumate probleemide tõrkeotsingu lahendused  
- **Parimad tavad**: tööstusstandardite ja soovituste integreerimine  
- **Versioonide ühilduvus**: ajakohane koos viimaste Azure teenuste ja azd funktsioonidega

## Plaanitud tulevased täiustused

### Versioon 3.1.0 (planeeritud)
#### AI platvormi laiendus
- **Mitme mudeli tugi**: Integreerimismustrid Hugging Face, Azure Machine Learning ja kohandatud mudelite jaoks
- **Tehisintellekti agendi raamistikud**: LangChaini, Semantic Kernel’i ja AutoGen’i juurutuse mallid
- **Täpsemad RAG-mustrid**: Vektordaatabaaside võimalused lisaks Azure AI Searchile (Pinecone, Weaviate jne)
- **AI jälgitavus**: Täiustatud jälgimine mudeli jõudluse, tokenite kasutuse ja vastuse kvaliteedi osas

#### Arendajakogemus
- **VS Code’i laiendus**: Integreeritud AZD + Microsoft Foundry arenduskogemus
- **GitHub Copiloti integratsioon**: AI toel AZD mallide genereerimine
- **Interaktiivsed õppetunnid**: Praktilised kodeerimisharjutused automatiseeritud valideerimisega AI stsenaariumide jaoks
- **Videomaterjal**: Täiendavad videoõpetused visuaalsetele õppijatele AI juurutuste teemal

### Versioon 4.0.0 (Planeeritud)
#### Ettevõtte AI mustrid
- **Juhtimisraamistik**: AI mudelite haldus, nõuetele vastavus ja auditeerimislogid
- **Mitme üürniku AI**: Mustrid mitme kliendi teenindamiseks eraldatud AI teenustega
- **Äärte (Edge) AI juurutus**: Integratsioon Azure IoT Edge ja konteinerite eksemplaridega
- **Hübriidpilve AI**: Mitme pilve ja hübriidjuurutuse mustrid AI töökoormuste jaoks

#### Täiustatud funktsioonid
- **AI töövoo automatiseerimine**: MLOps integratsioon Azure Machine Learningi torudele
- **Täpsem turvalisus**: Nulliusaldusmustrid, privaatotsad ja täiustatud ohu kaitse
- **Jõudluse optimeerimine**: Täiustatud häälestus- ja manneerimise strateegiad suurte AI rakenduste jaoks
- **Globaalne levitamine**: Sisukättetoimetamise ja äärte vahemällu salvestamise mustrid AI rakendustele

### Versioon 3.0.0 (Planeeritud) - Asendatud praeguse väljaandega
#### Pakutavad lisandused - Nüüd rakendatud versioonis 3.0.0
- ✅ **AI-keskne sisu**: Terviklik Microsoft Foundry integratsioon (Lõpetatud)
- ✅ **Interaktiivsed õppetunnid**: Praktiline AI töötuba (Lõpetatud)
- ✅ **Täpsem turvamoodul**: AI-spetsiifilised turvatehnikad (Lõpetatud)
- ✅ **Jõudluse optimeerimine**: AI töökoormuste häälestusstrateegiad (Lõpetatud)

### Versioon 2.1.0 (Planeeritud) - Osaliselt rakendatud versioonis 3.0.0
#### Väikesed täiustused - Mõned tehtud praeguses väljaandes
- ✅ **Täiendavad näited**: AI-keskse juurutuse stsenaariumid (Lõpetatud)
- ✅ **Pikendatud KK**: AI-spetsiifilised küsimused ja tõrkeotsing (Lõpetatud)
- **Tööriistade integratsioon**: Täiustatud IDE ja redaktori integreerimise juhendid
- ✅ **Jälgimise laiendus**: AI-spetsiifilised jälgimise ja teavitamise mustrid (Lõpetatud)

#### Endiselt planeeritud tulevaseks väljaandeks
- **Mobiilisõbralik dokumentatsioon**: Vastuvõtlik disain mobiiliõppeks
- **Võrgust väljas juurdepääs**: Allalaaditavad dokumentatsioonipaketid
- **Täiustatud IDE integratsioon**: VS Code’i laiendus AZD + AI töövoogude jaoks
- **Kogukonna juhtpaneel**: Reaalaegsed kogukonna mõõdikud ja panuste jälgimine

## Panustamine muudatuste logisse

### Muudatuste teadustamine
Panustades sellesse hoidlas, veenduge, et muudatuste logi kirjete hulka kuuluvad:

1. **Versiooninumber**: Vastavalt semantilisele versioonihaldusele (major.minor.patch)
2. **Kuupäev**: Väljaande või uuenduse kuupäev formaadis AAAA-KK-PP
3. **Kategooria**: Lisatud, Muudetud, Lubatud, Eemaldatud, Parandatud, Turvalisus
4. **Selge kirjeldus**: Lühike ülevaade muudatustest
5. **Mõju analüüs**: Kuidas muudatused mõjutavad olemasolevaid kasutajaid

### Muudatuste kategooriad

#### Lisatud
- Uued funktsioonid, dokumentatsiooni jaotised või võimalused
- Uued näited, mallid või õppematerjalid
- Täiendavad tööriistad, skriptid või abivahendid

#### Muudetud
- Olemasolevate funktsioonide või dokumentatsiooni muudatused
- Selguse või täpsuse parandused
- Sisu või organiseerimise ümberkorraldus

#### Lubatud
- Funktsioonid või lähenemised, mida järk-järgult lõpetatakse
- Kavatsetud eemaldamise all olevad dokumentatsiooni osad
- Meetodid, millele on paremad alternatiivid

#### Eemaldatud
- Funktsioonid, dokumentatsioon või näited, mis ei ole enam asjakohased
- Aegunud info või lubatud lähenemised
- Korduvad või ühtlustatud sisud

#### Parandatud
- Vead dokumentatsioonis või koodis parandatud
- Teatatud probleemide lahendused
- Täpsuse või funktsionaalsuse täiustused

#### Turvalisus
- Turvaga seotud parandused või täiustused
- Turvalisuse parimate tavade uuendused
- Turvaaukude lahendused

### Semantilise versioonihalduse juhised

#### Peamine versioon (X.0.0)
- Katkestavad muutused, mis nõuavad kasutaja tegevust
- Märkimisväärne sisu või organisatsiooni ümberkorraldus
- Muutused, mis muudavad põhilist lähenemist või metodoloogiat

#### Väiksem versioon (X.Y.0)
- Uued funktsioonid või sisu lisandused
- Täiendused, mis säilitavad tagurpidi ühilduvuse
- Täiendavad näited, tööriistad või ressursid

#### Parandusversioon (X.Y.Z)
- Veaparandused ja korrektuurid
- Väikesed täiustused olemasolevale sisule
- Selgitused ja väiksemad täiustused

## Kogukonna tagasiside ja ettepanekud

Me julgustame aktiivselt kogukonna tagasisidet selle õppematerjali parandamiseks:

### Kuidas tagasisidet anda
- **GitHubi probleemid**: Teata probleemidest või tee parandusettepanekuid (AI-spetsiifilised küsimused on teretulnud)
- **Discordi arutelud**: Jaga ideid ja suhtle Microsoft Foundry kogukonnaga
- **Pull requestid**: Panusta otse parendusi sisu hulka, eriti AI mallide ja juhendite jaoks
- **Microsoft Foundry Discord**: Osale #Azure kanalil AZD + AI teemadel
- **Kogukonna foorumid**: Osale laiema Azure arendajate arutelus

### Tagasiside kategooriad
- **AI sisu täpsus**: Parandused AI teenuste integratsiooni ja juurutuse infole
- **Õppimiskogemus**: Ettepanekud AI arendaja õppevoo täiustamiseks
- **Puuduv AI sisu**: Palved täiendavate AI mallide, mustrite või näidete järele
- **Juurdepääsetavus**: Täiustused erinevate õppimisvajaduste toetamiseks
- **AI tööriistade integratsioon**: Parandused AI arendustöövoo integreerimiseks
- **Tootmistaseme AI mustrid**: Ettevõtte AI juurutuse mustrite taotlused

### Vastamise kohustused
- **Probleemide lahendamine**: 48 tunni jooksul pärast teate saamist
- **Uute funktsioonide päringud**: Hindamine ühe nädala jooksul
- **Kogukonna panused**: Läbivaatamine ühe nädala jooksul
- **Turvaprobleemid**: Kohene prioriteet ja kiirendatud reageerimine

## Hooldusgraafik

### Regulaarne uuendamine
- **Kuutuled**: Sisu täpsuse ja linkide valideerimine
- **Kvartali uuendused**: Olulised sisulised lisandused ja parandused
- **Poolaasta ülevaated**: Põhjalik struktuuri ümbervaatamine ja täiustamine
- **Aastased väljaanded**: Peamised versioonivärskendused oluliste täiustustega

### Jälgimine ja kvaliteedi tagamine
- **Automatiseeritud testimine**: Koodi näidete ja linkide regulaarne valideerimine
- **Kogukonna tagasiside kaasamine**: Kasutajate ettepanekute regulaarne integreerimine
- **Tehnoloogiauudised**: Vastavus uusimatele Azure teenustele ja azd väljalasetele
- **Juurdepääsetavuse auditeerimine**: Regulaarne ülevaade kaasava disaini põhimõtete osas

## Versioonitoe poliitika

### Praeguse versiooni tugi
- **Viimane peamine versioon**: Täielik tugi regulaarsete uuendustega
- **Eelmine peamine versioon**: Turvavärskendused ja kriitilised parandused 12 kuu jooksul
- **Varasemad versioonid**: Ainult kogukonna tugi, ametlikku värskendust ei pakuta

### Ülemineku juhendid
Kui uued peamised versioonid ilmuvad, pakume:
- **Ülemineku juhendid**: Samm-sammult ülemineku juhtnöörid
- **Ühilduvuse märkused**: Katkestavate muudatuste üksikasjad
- **Tööriistade tugi**: Skriptid või abivahendid ülemineku hõlbustamiseks
- **Kogukonna tugi**: Pühendatud foorumid ülemineku küsimuste jaoks

---

**Navigeerimine**
- **Eelnev õppetund**: [Õppejuhend](resources/study-guide.md)
- **Järgmine õppetund**: Tagasi [Põhi README-sse](README.md)

**Ole kursis**: Telli selle hoidla teavitused uute väljaannete ja oluliste õppematerjalide uuenduste kohta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud tehisintellekti tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüdleme täpsuse poole, olge teadlikud, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->