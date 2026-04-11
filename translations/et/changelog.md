# Muudatuste logi - AZD Algajatele

## Sissejuhatus

See muudatuste logi dokumenteerib kõik märkimisväärsed muudatused, uuendused ja täiustused AZD Algajatele hoidlas. Järgime semantilise versiooni põhimõtteid ja hoiame seda logi, et aidata kasutajatel mõista, mis versioonide vahel on muutunud.

## Õpieesmärgid

Muudatuste logi ülevaatamisel:
- Olete kursis uute funktsioonide ja sisuliste täiendustega
- Mõistate olemasoleva dokumentatsiooni parandusi
- Jälgite vigade parandusi ja korrektuure täpsuse tagamiseks
- Järgite õppematerjalide arengut aja jooksul

## Õpitulemused

Muudatusregistri sissekannete uurimise järel oskate:
- Tuvastada uut õppimiseks saadaval olevat sisu ja ressursse
- Mõista, millised lõigud on uuendatud või parendatud
- Plaanida oma õppeteekonda tuginedes kõige ajakohasematele materjalidele
- Anda tagasisidet ja ettepanekuid tulevaste parenduste jaoks

## Versiooniajalugu

### [v3.19.1] - 2026-03-27

#### Algajate sissejuhatuse täpsustus, seadistuse valideerimine ja lõplik AZD käsu korrastamine  
**See versioon järgneb AZD 1.23 valideerimislainel algajatele suunatud dokumentatsiooni läbivaatusega: see täpsustab AZD-esmane autentimisjuhis, lisab kohalikud seadistuse valideerimise skriptid, kontrollib põhikäsklusi elava AZD CLI vastu ning eemaldab viimased aegunud käsuviidete tõlked väljaspool muudatuste logi.**

#### Lisatud  
- **🧪 Algajate seadistuse valideerimise skriptid** `validate-setup.ps1` ja `validate-setup.sh`, et õppijad saaksid enne 1. peatüki alustamist nõutud tööriistu kontrollida  
- **✅ Eelvalideerimise sammud** juur-README-s ja 1. peatüki README-s, et puuduvad eeltingimused avastataks enne `azd up` käivitamist  

#### Muudetud  
- **🔐 Algajate autentimisjuhend** käsitleb nüüd järjepidevalt `azd auth login` kui AZD töövoogude põhiteed, kusjuures `az login` on märgitud valikuliseks, kui Azure CLI käske ei kasutata otse  
- **📚 1. peatüki sissejuhatuse voog** juhendab nüüd õppijaid oma kohalikku seadistust enne installi, autentimist ja esimest juurutamist kontrollima  
- **🛠️ Valideerimise sõnumid** eristavad nüüd selgelt plokksed nõuded ja valikulised Azure CLI hoiatused vaid AZD algajate teekonna jaoks  
- **📖 Seadistus-, tõrkeotsingu- ja näitedokumendid** eristavad nüüd nõutavat AZD autentimist ja valikulist Azure CLI logimist seal, kus varem esitati mõlemaid kontekstita  

#### Parandatud  
- **📋 Järelejäänud ingliskeelsed käsuviited** uuendatud hetke AZD kujudele, sealhulgas `azd config show` petulehel ja `azd monitor --overview` seal, kus taheti Azure Portali ülevaate juhist  
- **🧭 Algajate väited 1. peatükis** pehmendatud, vältimaks garanteeritud nullvea või tagasikerimise lubamist kõigi mallide ja Azure ressursside kohta  
- **🔎 Elava CLI valideerimine** kinnitas praegust tuge järgmistele käskudele: `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` ja `azd down --force --purge`  

#### Uuendatud failid  
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

#### AZD 1.23.12 valideerimine, töötoa keskkonna laiendus ja AI mudeli värskendus  
**See versioon teostab dokumentatsiooni valideerimise `azd` `1.23.12` vastu, uuendab aegunud AZD käsukäsimisi, värskendab AI mudeli juhiseid praeguste vaikeväärtuste kohaselt ning laiendab töötoa juhiseid GitHub Codespacesist ka arenduskonteinerite ja kohalike kloonide toe suunas.**

#### Lisatud  
- **✅ Valideerimise märkused põhilõikudes ja töötoa dokumentides**, et õppijatele oleks selge katsetatud AZD põhibaseline, kasutades uuemaid või vanemaid CLI versioone  
- **⏱️ Juurutuse aegumisiht juhendamisel** pikaajaliste AI rakenduste juurutuste puhul kasutades `azd deploy --timeout 1800`  
- **🔎 Laienduse kontrollimise sammud** `azd extension show azure.ai.agents` AI töövoo dokumentides  
- **🌐 Laiem töötoa keskkonna juhendamine** hõlmab GitHub Codespaces, arenduskonteinereid ja kohalikke kloone koos MkDocsiga  

#### Muudetud  
- **📚 Peatükkide sissejuhatavad README-d** märgivad nüüd piisavalt, et valideerimine on tehtud `azd 1.23.12` vastu kõikides vundamendi, konfiguratsiooni, infrastruktuuri, mitme agendi, ettejuurutuse, tõrkeotsingu ja tootmise lõikudes  
- **🛠️ AZD käsuviited** uuendatud aktiivsetele vormidele kõikjal dokumentides:  
  - `azd config list` → `azd config show`  
  - `azd env show` → `azd env list` või `azd env get-value(s)` kontekstist lähtuvalt  
  - `azd auth whoami` → `azd auth status`  
  - `azd monitor` → `azd monitor --overview` seal, kus on mõeldud Application Insights ülevaadet  
- **🧪 Provision eelvaate näited** lihtsustatud aktsepteeritud käivitamisvormideks nagu `azd provision --preview` ja `azd provision --preview -e production`  
- **🧭 Töötuba voog** uuendatud nii, et õppijad saavad teha labisid Codespacesis, arenduskonteineris või kohalikus kloonis, mitte ainult Codespacesi eeldusel  
- **🔐 Autentimisjuhend** eelistab nüüd `azd auth login` AZD töövoogude puhul, kusjuures `az login` on valikuline alles juhul, kui kasutatakse otse Azure CLI käske  

#### Parandatud  
- **🪟 Windowsi installikäsud** normaliseeritud vastavalt praegusele `winget` paketi nime formaadile installijuhendis  
- **🐧 Linuxi installijuhend** parandatud, et vältida toetamata distributsioonispetsiifilisi `azd` pakihalduri juhiseid ja suunata sobival juhul vabastuste varade juurde  
- **📦 AI mudeli näited** värskendatud vanadest vaikimisi mudelitest nagu `gpt-35-turbo` ja `text-embedding-ada-002` praegustele näidetele nagu `gpt-4.1-mini`, `gpt-4.1` ja `text-embedding-3-large`  
- **📋 Juurutuse ja diagnostika lõigud** parandatud, kasutades praeguseid keskkonna- ja staatuse käske logides, skriptides ja tõrkeotsingus  
- **⚙️ GitHub Actions juhend** uuendatud `Azure/setup-azd@v1.0.0` pealt `Azure/setup-azd@v2` peale  
- **🤖 MCP/Copiloti nõusoleku juhis** muudetud `azd mcp consent` pealt `azd copilot consent list` peale  

#### Parendatud  
- **🧠 AI peatüki juhend** paremini selgitab eelvaate tundlikku `azd ai` käitumist, üürnikupõhist sisselogimist, praegust laienduste kasutust ja mudeli juurutamise soovitusi  
- **🧪 Töötoa juhised** kasutavad nüüd realistlikumaid versiooni näiteid ja selgemat keskkonna seadistuse keelt praktiliste labide jaoks  
- **📈 Tootmise ja tõrkeotsingu dokumendid** vastavad nüüd paremini praegustele jälgimis-, tagavaralsete mudelite ja kulutaseme näidetele  

#### Uuendatud failid  
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

#### AZD AI CLI käsud, sisu valideerimine ja mallide laiendus  
**See versioon lisab `azd ai`, `azd extension` ja `azd mcp` käsukattuvuse kõigis AI-ga seotud peatükkides, parandab katkiseid linke ja aegunud koodi failis agents.md, uuendab petulehte ning uuendab Näidismallide lõiku valideeritud kirjelduste ja uute Azure AI AZD mallidega.**

#### Lisatud  
- **🤖 AZD AI CLI tugi** 7 failis (enne ainult 8. peatükis):  
  - `docs/chapter-01-foundation/azd-basics.md` — uus lõik "Laiendused ja AI käsud", tutvustades `azd extension`, `azd ai agent init` ja `azd mcp`  
  - `docs/chapter-02-ai-development/agents.md` — valik 4: `azd ai agent init` võrdlustabeliga (malli vs manifesti lähenemine)  
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — lõigud "AZD laiendused Foundry jaoks" ja "Agent Esmane juurutus"  
  - `docs/chapter-05-multi-agent/README.md` — kiire alustamise lõigus nii malli- kui manifestipõhised juurutusviisid  
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Juurutuse lõigus lisatud `azd ai agent init` võimalus  
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — lõik "AZD AI laienduse käsud diagnostikaks"  
  - `resources/cheat-sheet.md` — uus lõik "AI & Laienduste käsud" koos `azd extension`, `azd ai agent init`, `azd mcp` ja `azd infra generate`  
- **📦 Uued AZD AI näidismallid** `microsoft-foundry-integration.md` failis:  
  - **azure-search-openai-demo-csharp** — .NET RAG vestlus Blazor WebAssembly, Semantic Kerneli ja häälevestluse toega  
  - **azure-search-openai-demo-java** — Java RAG vestlus kasutades Langchain4J, võimalustega ACA/AKS-le juurutamisel  
  - **contoso-creative-writer** — mitmeagendi loovkirjutusrakendus Azure AI Agent Service, Bing Grounding ja Promptyga  
  - **serverless-chat-langchainjs** — serverless RAG, kasutades Azure Functions + LangChain.js + Cosmos DB koos Ollama kohaliku arenduse toel  
  - **chat-with-your-data-solution-accelerator** — ettevõtte RAG kiirendaja koos administraatori portaaliga, Teamsi integratsioon ja PostgreSQL/Cosmos DB valikud  
  - **azure-ai-travel-agents** — mitmeagendi MCP orkestreerimise näidissovellus serveritega .NET, Python, Java ja TypeScripti jaoks  
  - **azd-ai-starter** — minimaalne Azure AI infrastruktuuri Bicep algusmall  
  - **🔗 Awesome AZD AI galerii link** — viide [awesome-azd AI galeriile](https://azure.github.io/awesome-azd/?tags=ai) (üle 80 malli)  

#### Parandatud  
- **🔗 agents.md navigeerimine**: Eelmine/Järgmine lingid nüüd vastavad 2. peatüki README õppetükkide järjekorrale (Microsoft Foundry integratsioon → Agentid → AI mudeli juurutus)  
- **🔗 agents.md katkised lingid**: `production-ai-practices.md` parandatud `../chapter-08-production/production-ai-practices.md` peale (3 kogutud kohta)  
- **📦 agents.md aegunud kood**: asendatud `opencensus` `azure-monitor-opentelemetry` ja OpenTelemetry SDK-ga  
- **🐛 agents.md vigane API**: `max_tokens` liigutatud `create_agent()` pealt `create_run()` peale nimega `max_completion_tokens`  
- **🔢 agents.md tokenite lugemine**: asendatud umbkaudne `len//4` hinnang `tiktoken.encoding_for_model()`-ga  
- **azure-search-openai-demo**: parandatud teenused "Cognitive Search + App Service" pealt "Azure AI Search + Azure Container Apps" peale (vaikehost muutus 2024. oktoobris)  
- **contoso-chat**: uuendatud kirjeldus, et viidata Azure AI Foundry-le + Promptyle, vastavalt hoidlale tegelikule pealkirjale ja tehnoloogiapakile  

#### Eemaldatud  
- **ai-document-processing**: eemaldatud mittefunktsionaalne malli viide (hoidla ei ole avalikult kättesaadav AZD mallina)  

#### Parendatud  
- **📝 agents.md harjutused**: Harjutus 1 kuvab nüüd oodatud väljundi ja `azd monitor` sammu; harjutus 2 sisaldab täielikku `FunctionTool` registreerimiskoodi; harjutus 3 asendab ebamäärase juhise konkreetsete `prepdocs.py` käskudega
- **📚 agents.md ressursid**: Uuendatud dokumentatsiooni lingid vastavaks tänastele Azure AI Agent Service dokumentidele ja kiire alustamise juhendile
- **📋 agents.md järgmised sammud tabel**: Lisatud AI töötoa töökoja link kogu peatüki ulatuse kohta

#### Uuendatud failid
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Kursuse navigeerimise täiustamine
**See versioon parandab README.md peatüki navigeerimist täiustatud tabeliformaadiga.**

#### Muudatused
- **Kursuse kaardi tabel**: Täiustatud otselinkide, kestvuse hinnangute ja keerukuse tasemetega
- **Kaustade puhastus**: Eemaldatud mittevajalikud vanad kaustad (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Linkide valideerimine**: Kõik 21+ siselingid kursusekaardi tabelis kontrollitud

### [v3.16.0] - 2026-02-05

#### Toodete nimede uuendused
**See versioon uuendab tooteviiteid vastavaks Microsofti värskeile brändinimedele.**

#### Muudatused
- **Microsoft Foundry → Microsoft Foundry**: Kõik viited uuendatud mitte-tõlke failides
- **Azure AI Agent Service → Foundry Agents**: Teenuse nimi ajakohastatud

#### Uuendatud failid
- `README.md` - Peamine kursuse avaleht
- `changelog.md` - Versiooniloend
- `course-outline.md` - Kursuse struktuur
- `docs/chapter-02-ai-development/agents.md` - AI agentide juhend
- `examples/README.md` - Näidisdokumentatsioon
- `workshop/README.md` - Töötoa avaleht
- `workshop/docs/index.md` - Töötoa indeks
- `workshop/docs/instructions/*.md` - Kõik töötoa juhendi failid

---

### [v3.15.0] - 2026-02-05

#### Suur repo ümberkorraldus: peatükkidepõhised kaustanimed
**See versioon korraldab dokumentatsiooni ümber pühendatud peatükkide kaustadeks selgema navigeerimise huvides.**

#### Kaustade ümbernimetused
Vanimad kaustad asendatud peatükkide numbritega:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lisatud uus: `docs/chapter-05-multi-agent/`

#### Failide üleviimine
| Fail | Alates | Kohta |
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
| Kõik pre-deployment failid | pre-deployment/ | chapter-06-pre-deployment/ |
| Kõik troubleshooting failid | troubleshooting/ | chapter-07-troubleshooting/ |

#### Lisatud
- **📚 Peatükkide README failid**: Igas peatüki kaustas loodud README.md koos:
  - Õpieesmärkide ja kestusega
  - Õppetundide tabel koos kirjeldustega
  - Kiire alustamise käsud
  - Navigeerimine teiste peatükkide juurde

#### Muudetud
- **🔗 Kõik siselinkid uuendatud**: 78+ rada uuendatud kogu dokumentatsioonis
- **🗺️ Peamine README.md**: Kursuse kaart ajakohastatud uue peatükkide struktuuriga
- **📝 examples/README.md**: Viited peatükkidele uuendatud

#### Eemaldatud
- Vanad kaustastruktuurid (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repositsiooni ümberkorraldus: peatükkide navigeerimine
**See versioon lisas peatükkide navigeerimise README failid (komplementeeritud versiooniga v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Uus AI agentide juhend
**See versioon lisab põhjaliku juhendi AI agentide juurutamiseks Azure Developer CLI-ga.**

#### Lisatud
- **🤖 docs/microsoft-foundry/agents.md**: Täielik juhend, mis hõlmab:
  - Mis on AI agentid ja kuidas nad erinevad vestlusrobotitest
  - Kolm kiire aluspõhja agentide malli (Foundry Agents, Prompty, RAG)
  - Agendi arhitektuuri mustrid (ühe agendi, RAG, mitme agendi lahendused)
  - Tööriistade seadistamine ja kohandamine
  - Monitooring ja mõõdikute jälgimine
  - Kulude kaalumine ja optimeerimine
  - Levinud tõrkeotsingu juhtumid
  - Kolm praktilist harjutust koos edukriteeriumidega

#### Sisustruktuur
- **Sissejuhatus**: Agendi mõistete tutvustus algajatele
- **Kiire alustamine**: Agentide juurutamine käsuga `azd init --template get-started-with-ai-agents`
- **Arhitektuuri mustrid**: Visuaalsed skeemid agendi mustrite jaoks
- **Seadistus**: Tööriistade seadistamine ja keskkonnamuutujad
- **Monitooring**: Application Insights integreerimine
- **Harjutused**: Järkjärguline praktiline õppimine (20-45 minutit igaüks)

---

### [v3.12.0] - 2026-02-05

#### DevContaineri keskkonna uuendus
**See versioon uuendab devcontaineri konfiguratsiooni kaasaegsete tööriistade ja paremate vaikeseadetega AZD õppimiskogemuse jaoks.**

#### Muudatused
- **🐳 Baaspilt**: Uuendatud `python:3.12-bullseye` pealt `python:3.12-bookworm` peale (Debian uusim stabiilne)
- **📛 Konteineri nimi**: Muudetud „Python 3” pealt „AZD for Beginners” selguse huvides

#### Lisatud
- **🔧 Uued devcontaineri funktsioonid**:
  - `azure-cli` koos Bicep toe lubamisega
  - `node:20` (LTS versioon AZD mallide jaoks)
  - `github-cli` mallihalduseks
  - `docker-in-docker` konteinerirakenduste juurutamiseks

- **🔌 Pordide edastus**: Eelseadistatud pordid tavapaladeks arenduseks:
  - 8000 (MkDocs eelvaade)
  - 3000 (Veebirakendused)
  - 5000 (Python Flask)
  - 8080 (APId)

- **🧩 Uued VS Code laiendused**:
  - `ms-python.vscode-pylance` - Parandatud Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions tugi
  - `ms-azuretools.vscode-docker` - Docker tugi
  - `ms-azuretools.vscode-bicep` - Bicep keel
  - `ms-azure-devtools.azure-resource-groups` - Azure ressursihaldus
  - `yzhang.markdown-all-in-one` - Markdowni redigeerimine
  - `DavidAnson.vscode-markdownlint` - Markdowni lintimine
  - `bierner.markdown-mermaid` - Mermaid diagrammitugi
  - `redhat.vscode-yaml` - YAML tugi (azure.yaml jaoks)
  - `eamodio.gitlens` - Git visualiseerimine
  - `mhutchie.git-graph` - Git ajaloo sirvimine

- **⚙️ VS Code seadistused**: Lisatud vaikimisi seaded Pythoni tõlgile, vormindamisele salvestamisel ja tühikute eemaldamisele

- **📦 requirements-dev.txt uuendatud**:
  - Lisatud MkDocs minify plugin
  - Lisatud pre-commit koodi kvaliteedi jaoks
  - Lisatud Azure SDK paketid (azure-identity, azure-mgmt-resource)

#### Parandatud
- **Pärast loomist käsk**: Nüüd kontrollib konteineri käivitamisel AZD ja Azure CLI olemasolu

---

### [v3.11.0] - 2026-02-05

#### Algajatele sõbralik README uuendus
**See versioon teeb README.md oluliselt kättesaadavamaks algajatele ning lisab olulisi ressursse AI arendajatele.**

#### Lisatud
- **🆚 Azure CLI vs AZD võrdlus**: Selge selgitus, millal kumb tööriist valida, praktiliste näidetega
- **🌟 Awesome AZD lingid**: Otseviited kogukonna malligaleriile ja panustamise juhenditele:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ valmis juurutamiseks mõeldud malli
  - [Esita mall](https://github.com/Azure/awesome-azd/issues) - Kogukonna panustamine
- **🎯 Kiirjuhend**: Lihtsustatud 3-sammuline alustamise juhend (Paigalda → Logi sisse → Juuruta)
- **📊 Kogemusel põhinev navigeerimistabel**: Selged juhised alguspunkti jaoks arendaja kogemuse põhjal

#### Muudetud
- **README struktuur**: Uuesti korraldatud, et tähtsad infod ilmu esmalt
- **Sissejuhatuse jaotis**: Kirjutatud ümber, et selgitada „The Magic of `azd up`” täiesti algajatele
- **Eemaldatud korduvad sisud**: Kaksikutõrkeotsingu jaotist eemaldatud
- **Tõrkeotsingu käsud**: Parandatud `azd logs` viiteid kasutama kehtivaid `azd monitor --logs`

#### Parandatud
- **🔐 Autentimiskäsud**: Lisatud `azd auth login` ja `azd auth logout` cheat-sheet.md-sse
- **Vigased käsureaviited**: Eemaldatud allesjäänud `azd logs` README tõrkeotsingu jaotisest

#### Märkused
- **Ulatus**: Muudatused kohaldatud peamisele README.md-le ja resources/cheat-sheet.md-le
- **Sihtgrupp**: Täiustused suunatud spetsiaalselt AZD algajatele arendajatele

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI käskude täpsuse uuendus
**See versioon parandab dokumentatsioonis eksisteerimata AZD käske, kindlustades kõigi näidete vastavuse kehtivale Azure Developer CLI süntaksile.**

#### Parandatud
- **🔧 Eksisteerimata AZD käsud eemaldatud**: Ulatuslik audit ja vigade parandused:
  - `azd logs` (ei eksisteeri) → asendatud `azd monitor --logs` või Azure CLI alternatiividega
  - `azd service` alamkäsud (ei eksisteeri) → asendatud `azd show` ja Azure CLI-ga
  - `azd infra import/export/validate` (ei eksisteeri) → eemaldatud või asendatud kehtivatega
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` lipud (ei eksisteeri) → eemaldatud
  - `azd provision --what-if/--rollback` lipud (ei eksisteeri) → uuendatud kasutama `--preview`
  - `azd config validate` (ei eksisteeri) → asendatud `azd config list`-iga
  - `azd info`, `azd history`, `azd metrics` (ei eksisteeri) → eemaldatud

- **📚 Failid uuendatud käskude parandustega**:
  - `resources/cheat-sheet.md`: Suur käskude viite muutmine
  - `docs/deployment/deployment-guide.md`: Parandatud rollback ja juurutamisstrateegiad
  - `docs/troubleshooting/debugging.md`: Parandatud logi analüüsi jaotised
  - `docs/troubleshooting/common-issues.md`: Uuendatud tõrkeotsingu käsud
  - `docs/troubleshooting/ai-troubleshooting.md`: Parandatud AZD silumise osa
  - `docs/getting-started/azd-basics.md`: Parandatud monitooringu käsud
  - `docs/getting-started/first-project.md`: Uuendatud monitooringu ja silumise näited
  - `docs/getting-started/installation.md`: Parandatud abi- ja versiooninäited
  - `docs/pre-deployment/application-insights.md`: Parandatud logide vaatamise käsud
  - `docs/pre-deployment/coordination-patterns.md`: Parandatud agentide silumise käsud

- **📝 Versiooni viide uuendatud**: 
  - `docs/getting-started/installation.md`: Muudetud kõvas koodis versioon „1.5.0” asemel üldiseks „1.x.x” koos linkiga vabastustele

#### Muudetud
- **Rollback strateegiad**: Dokumendis kasutusele võetud Git-põhine rollback (AZD-l ei ole sisseehitatud rollbacki)
- **Logide vaatamine**: Asendatud `azd logs` viited käskudele `azd monitor --logs`, `azd monitor --live` ja Azure CLI käsudega
- **Jõudluse jaotis**: Eemaldatud eksisteerimata paralleelse/incremental juurutamise lipud, pakutud kehtivad alternatiivid

#### Tehnilised üksikasjad
- **Kehtivad AZD käsud**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Kehtivad azd monitor lipud**: `--live`, `--logs`, `--overview`
- **Eemaldatud funktsioonid**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Märkused
- **Kinnitamine**: käsud on valideeritud Azure Developer CLI v1.23.x vastu

---

### [v3.9.0] - 2026-02-05

#### Töötoa lõpetamine ja dokumentatsiooni kvaliteedi uuendus
**See versioon lõpetab interaktiivsed töötoa moodulid, parandab kõik katkenud dokumentatsiooni lingid ja parandab üldist sisu kvaliteeti AI arendajatele, kes kasutavad Microsoft AZD-d.**

#### Lisatud
- **📝 CONTRIBUTING.md**: uus panustamisjuhendite dokument, mis sisaldab:
  - selged juhised probleemide teatamiseks ja muudatuste ettepanekuks
  - dokumentatsiooni standardid uue sisu jaoks
  - koodinäidiste juhised ja commit-teadete konventsioonid
  - kogukonna kaasamise teave

#### Lõpetatud
- **🎯 Töötoa moodul 7 (Lõpetamine)**: täielikult lõpetatud lõpetamise moodul, mis sisaldab:
  - põhjalik kokkuvõte töötoa saavutustest
  - põhikontseptsioonide omandamise sektsioon, mis hõlmab AZD, malle ning Microsoft Foundryt
  - soovitused õpiteekonna jätkamiseks
  - töötoa väljakutsete harjutused raskusastmete hinnangutega
  - kogukonna tagasiside ja tugilingid

- **📚 Töötoa moodul 3 (Lammutamine)**: uuendatud õpieesmärgid järgmistega:
  - juhised GitHub Copilot MCP serverite aktiveerimiseks
  - AZD malli kaustastruktuuri mõistmine
  - infrastruktuur-koodina (Bicep) organiseerimise mustrid
  - praktilised laborijuhised

- **🔧 Töötoa moodul 6 (Mahavõtt)**: lõpetatud järgmistega:
  - ressursside puhastamise ja kulude juhtimise eesmärgid
  - `azd down` kasutamine turvaliseks infrastruktuuri eemaldamiseks
  - pehmes olekus kustutatud kognitiivsete teenuste taastamise juhendid
  - lisa uurimispäringud GitHub Copilot ja Azure Portali jaoks

#### Parandatud
- **🔗 Katkenud linkide parandused**: parandatud 15+ katkenud sisemist dokumentatsiooni linki:
  - `docs/ai-foundry/ai-model-deployment.md`: parandatud teed microsoft-foundry-integration.md juurde
  - `docs/troubleshooting/ai-troubleshooting.md`: parandatud ai-model-deployment.md ja production-ai-practices.md teed
  - `docs/getting-started/first-project.md`: asendatud puuduv cicd-integration.md juhendiga deployment-guide.md
  - `examples/retail-scenario.md`: parandatud KKK ja tõrkeotsingu juhendi teed
  - `examples/container-app/microservices/README.md`: parandatud kursuse avalehe ja deploy juhendi teed
  - `resources/faq.md` ja `resources/glossary.md`: uuendatud AI peatükkide viited
  - `course-outline.md`: parandatud juhendaja juhendit ja AI töötoa labori viiteid

- **📅 Töötoa oleku bänner**: uuendatud olek “Under Construction” pealt aktiivseks töötoaks kuupäevaga veebruar 2026

- **🔗 Töötoa navigeerimine**: parandatud katkenud navigeerimislingid töötoa README.md failis, mis osutasid mitteeksisteerivale lab-1-azd-basics kaustale

#### Muudetud
- **Töötoa esitlus**: eemaldatud hoiatus “Under Construction”, töötuba on nüüd lõpetatud ja kasutamiseks valmis
- **Navigeerimise järjepidevus**: tagatud kõigi töötoa moodulite korrektne vahelinkimine
- **Õpitee viited**: uuendatud peatükkide ristviiteid, kasutades õigeid microsoft-foundry teid

#### Kontrollitud
- ✅ Kõik inglise keeles markdown-failid sisaldavad kehtivaid siselinke
- ✅ Töötoa moodulid 0-7 on täielikult lõpetatud koos õpieesmärkidega
- ✅ Peatükkide ja moodulite vaheline navigeerimine töötab korrektselt
- ✅ Sisu sobib AI arendajatele, kes kasutavad Microsoft AZD-d
- ✅ Algajatele sobiv keel ja struktuur on säilinud kogu aine jooksul
- ✅ CONTRIBUTING.md annab selged juhised kogukonna panustajatele

#### Tehniline rakendus
- **Lingikontroll**: automatiseeritud PowerShell skript kontrollis kõiki .md siselinke
- **Sisuanalüüs**: töötoa täielikkuse ja algajasõbralikkuse manuaalne ülevaatus
- **Navigeerimissüsteem**: ühtsed peatükkide ja moodulite navigeerimismustrid rakendatud

#### Märkused
- **Küpsis**: muudatused kehtivad ainult inglise keelsele dokumentatsioonile
- **Tõlked**: tõlkekaustad ei uuendatud selles versioonis (automatiseeritud tõlge sünkroniseeritakse hiljem)
- **Töötoa kestus**: täielik töötuba pakub nüüd 3-4 tundi praktilist õppimist

---

### [v3.8.0] - 2025-11-19

#### Täiustatud dokumentatsioon: Jälgimine, turvalisus ja mitme agendi mustrid
**See versioon lisab põhjalikud A-klassi õppetunnid Application Insights integratsioonist, autentimismustritest ja mitme agendi koordineerimisest tootmisdeploy’de jaoks.**

#### Lisatud
- **📊 Application Insights integratsiooni õppetund**: failis `docs/pre-deployment/application-insights.md`:
  - AZD keskne deploy koos automaatse provisioneerimisega
  - Täielikud Bicep mallid Application Insights + Log Analytics jaoks
  - Töötavad Python rakendused koos kohandatud telemeetria (üle 1200 rea)
  - AI/LLM jälgimismustrid (Microsoft Foundry mudelite token/kulu jälgimine)
  - 6 Mermaid diagrammi (arhitektuur, hajutatud jälgimine, telemeetria voog)
  - 3 praktilist harjutust (häired, juhtpaneelid, AI jälgimine)
  - Kusto-päringute näited ja kulude optimeerimise strateegiad
  - Reaalajas mõõdikute voog ja silumine
  - 40-50 minutit õppimisaega tootmisküpsete mustritega

- **🔐 Autentimise ja turvalisuse mustrite õppetund**: failis `docs/getting-started/authsecurity.md`:
  - 3 autentimismustrit (ühenduste stringid, Key Vault, hallatud identiteet)
  - Täielikud Bicep infrastruktuuri mallid turvaliste deploy’de jaoks
  - Node.js rakenduskood Azure SDK integratsiooniga
  - 3 terviklikku harjutust (hallatud identiteedi võimaldamine, kasutajale määratud identiteet, Key Vault pöörded)
  - Turvalisuse parimad tavad ja RBAC konfiguratsioonid
  - Tõrkeotsingu juhend ja kuluanalüüs
  - Tootmisküpsad paroolita autentimismustrid

- **🤖 Mitme agendi koordineerimise mustrite õppetund**: failis `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineerimismustrit (seqventaalne, paralleelne, hierarhiline, sündmuspõhine, konsensus)
  - Täielik orkestratsiooniteenuse implementatsioon (Python/Flask, 1500+ rida)
  - 3 spetsialiseeritud agendi implementatsiooni (Uurija, Kirjutaja, Toimetaja)
  - Service Bus integratsioon sõnumijärjekordade jaoks
  - Cosmos DB oleku haldus hajutatud süsteemidele
  - 6 Mermaid diagrammi agendi interaktsioonide näitamiseks
  - 3 keerukamat harjutust (aegumise haldus, korduskatsetus loogika, katkestusskeem)
  - Kulu jaotus (240-565 $/kuu) optimeerimisstrateegiatega
  - Application Insights integratsioon jälgimiseks

#### Täiustatud
- **Enne deploy peatükk**: nüüd sisaldab põhjalikke jälgimis- ja koordineerimismustreid
- **Alguspeatükk**: täiustatud professionaalsete autentimismustritega
- **Tootmisküpsus**: täielik katvus turvalisusest jälgitavuseni
- **Kursuse ülevaade**: uuendatud viited uutele peatükkidele 3 ja 6

#### Muudetud
- **Õppimise järjekord**: parem turvalisuse ja jälgimise koostoime kogu kursusel
- **Dokumentatsiooni kvaliteet**: ühtlane A-klassi standard (95-97%) uutes õppetundides
- **Tootmismustrid**: täielik lõpp-lõpuni katvus ettevõtte deploy’de jaoks

#### Paranenud
- **Arendajakogemus**: selge tee arendusest tootmisse jälgimiseks
- **Turvastandardid**: professionaalsed mustrid autentimiseks ja saladuste haldamiseks
- **Jälgitavus**: täielik Application Insights integratsioon AZD-ga
- **AI töökoormused**: spetsialiseeritud jälgimine Microsoft Foundry mudelite ja mitme agendi süsteemide jaoks

#### Kontrollitud
- ✅ Kõik õppetunnid sisaldavad täielikku töötavat koodi (mitte ainult lõike)
- ✅ Mermaid diagrammid visuaalseks õppimiseks (kokku 19 kolme õppetunni jooksul)
- ✅ Praktilised harjutused koos kontrollimissammudega (kokku 9)
- ✅ Tootmisküpsed Bicep mallid, mida saab deploy'da `azd up` abil
- ✅ Kulude analüüs ja optimeerimise strateegiad
- ✅ Tõrkeotsingu juhendid ja parimad praktikad
- ✅ Teadmiste kontrollpunktid koos kinnituskäskudega

#### Dokumentatsiooni hindamise tulemused
- **docs/pre-deployment/application-insights.md**: - põhjalik jälgimisjuhend
- **docs/getting-started/authsecurity.md**: - professionaalsed turvalisuse mustrid
- **docs/pre-deployment/coordination-patterns.md**: - edasijõudnud mitme agendi arhitektuur
- **Üldine uus sisu**: - järjekindlad kõrged kvaliteedistandardid

#### Tehniline rakendus
- **Application Insights**: Log Analytics + kohandatud telemeetria + hajutatud jälgimine
- **Autentimine**: hallatud identiteet + Key Vault + RBAC mustrid
- **Mitme agent**: Service Bus + Cosmos DB + Container Apps + orkestratsioon
- **Jälgimine**: reaalajas mõõdikud + Kusto päringud + häired + juhtpaneelid
- **Kulude juhtimine**: proovivõtu strateegiad, säilituspoliitikad, eelarve kontroll

### [v3.7.0] - 2025-11-19

#### Dokumentatsiooni kvaliteedi parandused ja uus Microsoft Foundry mudelite näide
**See versioon parandab kogu hoidlas dokumentatsiooni kvaliteeti ja lisab täieliku Microsoft Foundry mudelite deploy näite koos gpt-4.1 vestluse liidesega.**

#### Lisatud
- **🤖 Microsoft Foundry mudelite vestlusnäide**: täielik gpt-4.1 deploy töökorras implementatsiooniga kaustas `examples/azure-openai-chat/`:
  - täielik Microsoft Foundry mudelite infrastruktuur (gpt-4.1 mudeli deploy)
  - Python käsurea vestlusliides koos vestluste ajaloo haldusega
  - Key Vault integratsioon turvaliseks API võtmete hoiustamiseks
  - tokeni kasutuse jälgimine ja kulude hinnang
  - kiirusepiirangud ja veahaldus
  - ulatuslik README koos 35-45 minuti pikkuse deploy juhendiga
  - 11 tootmisküpsat faili (Bicep mallid, Python rakendus, konfiguratsioon)
- **📚 Dokumentatsiooni harjutused**: lisatud praktilised harjutused konfiguratsioonijuhendisse:
  - Harjutus 1: Mitmekeskkondade konfiguratsioon (15 minutit)
  - Harjutus 2: Saladuste haldamise harjutus (10 minutit)
  - Selged õnnestumiskriteeriumid ja kontrollsammud
- **✅ Deploy kinnitamine**: lisatud kinnituse sektsioon deploy juhendisse:
  - tervisekontrolli protseduurid
  - õnnestumise nõuete kontrolplokk
  - kõigi deploy käskude oodatavad väljundid
  - kiire tõrkeotsingu ülevaade

#### Täiustatud
- **examples/README.md**: uuendatud A-klassi kvaliteedile (93%):
  - lisatud azure-openai-chat kõikidesse seotud osadesse
  - kohalikud näidete arv uuendatud 3-lt 4-le
  - lisatud AI rakenduste näidete tabelisse
  - integreeritud Kesktaseme kasutajate Kiire algus juhisesse
  - lisatud Microsoft Foundry mallide sektsiooni
  - uuendatud võrdlusmaatriksit ja tehnoloogiate leidmise osi
- **Dokumentatsiooni kvaliteet**: paranenud B+ (87%) → A- (92%) kogu docs kaustas:
  - lisatud olulistele käskudele oodatavad väljundid
  - lisatud konfiguratsiooni muudatuste kontrollimissammud
  - täiustatud praktiline õpe läbi harjutuste

#### Muudetud
- **Õppimise järjekord**: paremini integreeritud AI näited kesktaseme õppuritele
- **Dokumentatsiooni struktuur**: rohkem tegutsemisvõimalusi harjutuste kaudu selgete tulemustega
- **Kinnitamisprotsess**: oluliste töövoogude juures lisatud selged õnnestumiskriteeriumid

#### Paranenud
- **Arendajakogemus**: Microsoft Foundry mudelite juurutamine võtab nüüd 35-45 minutit (varem 60-90 min raskemate alternatiivide puhul)
- **Kulude läbipaistvus**: selged kuluhinnangud (50-200 $/kuu) Microsoft Foundry mudelite näite jaoks
- **Õpitee**: AI arendajatel on kindel sissepääs azure-openai-chat näite kaudu
- **Dokumentatsiooni standardid**: järjepidevad oodatavad väljundid ja kontrollsammud

#### Kontrollitud
- ✅ Microsoft Foundry mudelite näide töötab täielikult koos `azd up` käsuga
- ✅ Kõik 11 implementeerimisfaili on süntaktiliselt korrektsed
- ✅ README juhised vastavad tegelikule deploy kogemusele
- ✅ Dokumentatsiooni lingid uuendatud üle 8 koha
- ✅ Näidete indeks peegeldab korrektselt 4 kohalikku näidet
- ✅ Puuduvad topeltvälised lingid tabelites
- ✅ Kõik navigeerimisviited on korrektsed

#### Tehniline rakendus
- **Microsoft Foundry mudelite arhitektuur**: gpt-4.1 + Key Vault + Container Apps muster
- **Turvalisus**: valmis hallatud identiteediga, saladused Key Vault-is
- **Jälgimine**: Application Insights integratsioon
- **Kulude juhtimine**: tokeni jälgimine ja kasutuse optimeerimine
- **Deploy**: kogu seadistus ühekordse `azd up` käsuga

### [v3.6.0] - 2025-11-19

#### Suur uuendus: Container App juurutuse näited
**See versioon tutvustab põhjalikke, tootmisküpsaid konteinerirakenduste juurutuse näiteid kasutades Azure Developer CLI-d (AZD), koos täieliku dokumentatsiooni ja integreerimise õpiteele.**

#### Lisatud
- **🚀 Container App näited**: uued kohalikud näited kaustas `examples/container-app/`:
  - [Peamine juhend](examples/container-app/README.md): täielik ülevaade konteineripõhistest deploy’dest, kiire alustamise, tootmise ja edasijõudnud mustritega
  - [Lihtne Flask API](../../examples/container-app/simple-flask-api): algajasõbralik REST API koos scale-to-zero, tervise sondide, jälgimise ja tõrkeotsinguga
  - [Mikroteenuste arhitektuur](../../examples/container-app/microservices): tootmisküps mitme teenusega deploy (API Gateway, Toode, Tellimus, Kasutaja, Teavitus), asünkroonne sõnumivahetus, Service Bus, Cosmos DB, Azure SQL, hajutatud jälgimine, sinine-roheline ja kanaardeploy
- **Parimad praktikad**: turvalisus, jälgimine, kulu optimeerimine ja CI/CD juhised konteineripõhiste töökoormuste jaoks
- **Koodinäited**: täielik `azure.yaml`, Bicep mallid ja mitme keele teenuste implementatsioonid (Python, Node.js, C#, Go)
- **Testimine ja tõrkeotsing**: lõpp-lõpuni teststsenaariumid, jälgimiskäsud, tõrkeotsingu juhised

#### Muudetud
- **README.md**: Uuendatud, et lisada ja lingitada uusi konteinerirakenduste näiteid jaotises „Kohalikud näited – konteinerirakendused“
- **examples/README.md**: Uuendatud, rõhutamaks konteinerirakenduste näiteid, lisades võrdlustabeli kirjed ja uuendades tehnoloogia/arhitektuuri viiteid
- **Kursuse ülevaade ja õpiabi**: Uuendatud, et viidata uutele konteinerirakenduste näidetele ja juurutusmustritele vastavates peatükkides

#### Kinnitatud
- ✅ Kõik uued näited on käivitatavad käsuga `azd up` ja järgivad parimaid tavasid
- ✅ Dokumentatsiooni ristviited ja navigeerimine uuendatud
- ✅ Näited hõlmavad algajast edasijõudnuteni, sealhulgas tootmises kasutatavaid mikroteenuseid

#### Märkused
- **Ulatus**: Ainult ingliskeelne dokumentatsioon ja näited
- **Järgmised sammud**: Tulevastes versioonides lisada täpsemaid konteinerimustreid ja CI/CD automatiseerimist

### [v3.5.0] - 2025-11-19

#### Toodete ümberbrändimine: Microsoft Foundry
**See versioon muudab täielikult tootenime „Microsoft Foundry“ kõikides ingliskeelsetes dokumentides, kajastades Microsofti ametlikku ümberbrändimist.**

#### Muudetud
- **🔄 Tootenime uuendus**: Täielik ümberbrändimine „Microsoft Foundry“ nime abil
  - Kõik viited uuendatud kõigis ingliskeelsetes dokumentides kaustas `docs/`
  - Kausta nimi muudetud: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Faili nimi muudetud: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kokku uuendatud 23 sisuviidet 7 dokumendifailis

- **📁 Kaustastruktuuri muudatused**:
  - `docs/ai-foundry/` nimetatud ümber `docs/microsoft-foundry/`
  - Kõik ristviited uuendatud vastavalt uuele kaustastruktuurile
  - Navigeerimislingid kontrollitud kõigis dokumentides

- **📄 Failide nimede muutmine**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kõik sisemised lingid viidatud uuele failinimele

#### Uuendatud failid
- **Peatükkide dokumentatsioon** (7 faili):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigeerimislingi uuendust
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 tootenime viidet uuendatud
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - juba kasutab Microsoft Foundry’d (varasemate uuenduste põhjal)
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
- ✅ Ühtegi allesjäänud „ai-foundry“ kaustateekonna viidet ingliskeelsetes dokumentides pole
- ✅ Ühtegi allesjäänud „Microsoft Foundry“ tootenime viidet ingliskeelsetes dokumentides pole
- ✅ Kõik navigeerimislingid toimivad uue kaustastruktuuriga
- ✅ Failide ja kaustade ümbernimetamine edukalt lõpetatud
- ✅ Peatükkidevahelised ristviited valideeritud

#### Märkused
- **Ulatus**: Muudatused tehtud ainult ingliskeelsetes dokumentides kaustas `docs/`
- **Tõlked**: Tõlkekaustad (`translations/`) pole selles versioonis uuendatud
- **Töötuba**: Töötubade materjalid (`workshop/`) pole selles versioonis uuendatud
- **Näited**: Näidete failid võivad endiselt sisaldada pärandnimesid (parandatakse tulevastes versioonides)
- **Välised lingid**: Välised URL-id ja GitHubi hoidla viited on muutmata

#### Migratsioonijuhend panustajatele
Kui teil on lokaalsed harud või dokumentatsioon, mis viitab vanale struktuurile:
1. Uuendage kaustaviited: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uuendage failiviited: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Asendage tootenimi: "Microsoft Foundry" → "Microsoft Foundry"
4. Kontrollige, et kõik sisemised dokumendilingid töötaksid jätkuvalt

---

### [v3.4.0] - 2025-10-24

#### Taristu eelvaate ja valideerimise täiustused
**See versioon lisab ulatusliku toe uuele Azure Developer CLI eelvaate funktsioonile ja parandab töötubade kasutajakogemust.**

#### Lisatud
- **🧪 azd provision --preview funktsiooni dokumentatsioon**: Ulatuslik katvus uue taristu eelvaate võimaluse kohta
  - Käsurea viited ja kasutusnäited petulehel
  - Üksikasjalik integratsioon juurutusjuhendis koos kasutusjuhtude ja kasudega
  - Eelkontrolli integreerimine ohutumaks juurutamise valideerimiseks
  - Algaja juhendi uuendused, rõhutades turvalist juurutamist
- **🚧 Töötuba staatuse bänner**: Professionaalne HTML-bänner näitamaks töötoa arenduse staatust
  - Gradientdisain koos ehitusteemaliste indikaatoritega selgeks kasutajate teavitamiseks
  - Viimase uuenduse timestamp läbipaistvuseks
  - Kõikide seadmetüüpide jaoks mobiilne reageerimisvõime

#### Täiustatud
- **Taristu turvalisus**: Eelvaate funktsioon integreeritud kogu juurutusdokumentatsioonis
- **Eeljuurutuse valideerimine**: Automaatkäsud sisaldavad nüüd taristu eelvaate testimist
- **Arendaja töövoog**: Käsuliinid uuendatud nii, et eelvaade on parim tava
- **Töötuba kogemus**: Selgelt määratletud ootused sisu arenduse staatusele

#### Muudetud
- **Juurutuse parimad tavad**: Eelvaate esmane kasutamine nüüd soovitatav töövoog
- **Dokumentatsiooni voog**: Taristu valideerimine viidud õppimise varasemasse ossa
- **Töötoa esitlus**: Professionaalne staatuskommunikatsioon koos selge arendustähtajaga

#### Parandatud
- **Turvalisustähtsus**: Taristu muudatusi saab nüüd enne juurutust valideerida
- **Meeskonnatöö**: Eelvaate tulemusi saab jagada kinnitamiseks ja läbivaatuseks
- **Kulutõhusus**: Parem arusaam ressursside maksumusest enne juurutust
- **Riski vähendamine**: Vähendatud juurutusvigu ettvalideerimise abil

#### Tehniline teostus
- **Mitmedokumendi integratsioon**: Eelvaate funktsioon dokumenteeritud 4 põhifailis
- **Käsumustri järjepidevus**: Ühtne süntaks ja näited kogu dokumentatsioonis
- **Parimate tavade integreerimine**: Eelvaade kaasatud valideerimis- ja skriptitöövoogudesse
- **Visuaalsed indikaatorid**: Selged UUE funktsiooni märgistused avastamise hõlbustamiseks

#### Töötuba taristu
- **Staatuse kommunikatsioon**: Professionaalne HTML-bänner gradientstiiliga
- **Kasutajakogemus**: Selge arenduse staatuse näitamine hoiab ära segaduse
- **Professionaalne esitlus**: Säilitab hoidla usaldusväärsuse ja seab ootused
- **Ajaskaala läbipaistvus**: Okt 2025 viimase uuenduse timestamp aruandlikkuse tagamiseks

### [v3.3.0] - 2025-09-24

#### Täiustatud töötubade materjalid ja interaktiivne õppimiskogemus
**See versioon lisab ulatuslikke töötubade materjale koos brauseripõhise interaktiivse juhendi ja struktureeritud õpiteedega.**

#### Lisatud
- **🎥 Interaktiivne töötoa juhend**: Brauseripõhine töötuba MkDocs eelvaate võimekusega
- **📝 Struktureeritud töötoa juhised**: 7-etapiline juhitud õpitee avastamisest kohandamiseni
  - 0-Sissejuhatus: töötoa ülevaade ja seadistamine
  - 1-Vali tehisintellekti mall: mallide avastamine ja valikuprotsess
  - 2-Kinnita AI mall: juurutus- ja valideerimisprotseduurid
  - 3-Lammutame AI malli: malli arhitektuuri mõistmine
  - 4-Seadista AI mall: konfigureerimine ja kohandamine
  - 5-Kohanda AI mall: täiustatud muudatused ja iteratsioonid
  - 6-Lammutame taristu: koristamine ja ressursihaldus
  - 7-Kokkuvõte: kokkuvõttev kokkuvõte ja järgmised sammud
- **🛠️ Töötoa tööriistad**: MkDocs konfiguratsioon koos Materjali teemaga parema õpikogemuse jaoks
- **🎯 Praktikal põhinev õpitee**: 3-astmeline metoodika (Avastus → Juurutus → Kohandamine)
- **📱 GitHub Codespaces integratsioon**: sujuv arenduskeskkonna paigaldus

#### Täiustatud
- **AI töötuba labor**: Laiendatud ulatusliku 2-3-tunnise struktureeritud õpikogemusega
- **Töötoa dokumentatsioon**: Professionaalne esitlus koos navigeerimise ja visuaalsete abivahenditega
- **Õppe edenemine**: Selged samm-sammult juhised mallide valikust kuni tootmisjuurutuseni
- **Arendajakogemus**: Integreeritud tööriistad voogude tõhustamiseks

#### Parandatud
- **Juurdepääsetavus**: Brauseripõhine liides otsingu, kopeerimisfunktsiooni ja teemavahetusega
- **Isetempo õppimine**: Paindlik töötoa struktuur erinevatele õpitempostele sobiv
- **Praktiline rakendus**: Tootmisvalmid AI mallide juurutamise stsenaariumid
- **Kogukonna integratsioon**: Discordi tugi töötoa abiks ja koostööks

#### Töötuba funktsioonid
- **Sisseehitatud otsing**: Kiire märksõnade ja õppetundide leidmine
- **Koodi plokkide kopeerimine**: Hover-to-copy funktsioon kõigi koodinäidete puhul
- **Teemavahetus**: Tume/heledateemade tugi eelistuste jaoks
- **Visuaalsed vahendid**: Kuvaekraanid ja diagrammid parema mõistmise huvides
- **Abi integreerimine**: Otsene juurdepääs Discordi kogukonnale

### [v3.2.0] - 2025-09-17

#### Suur navigeerimistruktuuri ümberkorraldus ja peatükkidel põhinev õppesüsteem
**See versioon tutvustab põhjalikku peatükkidel põhinevat õpistruktuuri ja täiustatud navigeerimist kogu hoidlas.**

#### Lisatud
- **📚 Peatükkidel põhinev õppesüsteem**: Kogu kursus ümber struktureeritud 8 järjepidevasse õppepeatükki
  - Peatükk 1: Alused ja kiire algus (⭐ - 30-45 minutit)
  - Peatükk 2: AI-esmane arendus (⭐⭐ - 1-2 tundi)
  - Peatükk 3: Konfiguratsioon ja autentimine (⭐⭐ - 45-60 minutit)
  - Peatükk 4: Taristu kui kood ja juurutus (⭐⭐⭐ - 1-1,5 tundi)
  - Peatükk 5: Mitme agendiga AI lahendused (⭐⭐⭐⭐ - 2-3 tundi)
  - Peatükk 6: Eeljuurutuse valideerimine ja planeerimine (⭐⭐ - 1 tund)
  - Peatükk 7: Vead ja tõrkeotsing (⭐⭐ - 1-1,5 tundi)
  - Peatükk 8: Tootmis- ja ettevõttetasandi mustrid (⭐⭐⭐⭐ - 2-3 tundi)
- **📚 Ulatuslik navigeerimissüsteem**: Ühtsed navigeerimispealkirjad ja jalused kogu dokumentatsioonis
- **🎯 Edenemise jälgimine**: Kursuse lõpetamise kontrollnimekiri ja õppe kontrollsüsteem
- **🗺️ Õpitee juhendamine**: Selged sisenemispunktid erineva taustaga õppijatele
- **🔗 Ristviited**: Seotud peatükid ja eeldused selgelt seotud

#### Täiustatud
- **README struktuur**: Muudetud struktureeritud õpikeskkonnaks koos peatükkide jaotusega
- **Dokumentatsiooni navigeerimine**: Igal lehel nüüd peatüki kontekst ja edenemissuunised
- **Mallide organiseerimine**: Näited ja mallid kaardistatud vastavatesse õppepeatükkidesse
- **Ressursside integreerimine**: Pettulehed, KKJa ning õpiabid seotud asjakohaste peatükkidega
- **Töötoa integratsioon**: Praktilised laborid ühendatud mitme peatüki õpieesmärkidega

#### Muudetud
- **Õppe edenemine**: Liigutud lineaarsest dokumentatsioonist paindlikule peatükkidel põhinevale õppimisele
- **Konfiguratsiooni asukoht**: Konfiguratsioonijuhend nihutatud peatükki 3 parema õppevoo huvides
- **AI sisu integreerimine**: AI-spetsiifiline sisu paremini integreeritud kogu õppeteekonnas
- **Tootmisesisud**: Täiustatud mustrid koondatud peatükki 8 ettevõtlusõppuritele

#### Parandatud
- **Kasutajakogemus**: Selged navigeerimiskrõpsud ja peatüki edenemismärgendid
- **Juurdepääsetavus**: Ühtsed navigeerimismustrid lihtsustavad kursuse läbimist
- **Professionaalne esitlus**: Ülikoolitüüpi kursusestruktuur akadeemiliseks ja korporatiivseks koolituseks
- **Õppe efektiivsus**: Relevantsete materjalide leidmine kiirem ja parem organiseeritud

#### Tehniline teostus
- **Navigeerimispealkirjad**: Ühtlustatud peatükkide navigeerimine üle 40 dokumendifaili
- **Jaluse navigeerimine**: Ühtne edenemissuuna juhend ja lõpetamise indikaatorid
- **Ristlinkimine**: Ulatuslik sisemine linkimissüsteem seob seotud mõisted
- **Peatükkide kaardistamine**: Mallid ja näited selgelt seotud õpieesmärkidega

#### Õpiabi täiendused
- **📚 Ulatuslikud õpieesmärgid**: Õpiabi ümberstruktureeritud 8-peatükilise süsteemi juurde
- **🎯 Peatükkidel põhinev hindamine**: Igal peatükil oma õpieesmärgid ja praktilised ülesanded
- **📋 Edenemise jälgimine**: Nädalane õppekava koos mõõdetavate tulemuste ja lõpetamise kontrollnimekirjadega
- **❓ Hindamisküsimused**: Iga peatüki teadmiste valideerimise küsimused professionaalse tulemuslikkusega
- **🛠️ Praktilised harjutused**: Käed-külge tegevused reaalsete juurutusstsenaariumitega ja tõrkeotsinguga
- **📊 Osakuste edenemine**: Selge areng algtõdedest ettevõtte mustriteni, keskendudes karjääriarengule
- **🎓 Sertifitseerimisraamistik**: Professionaalse arengu tulemused ja kogukonna tunnustussüsteem
- **⏱️ Ajaplaneerimine**: Struktureeritud 10-nädalane õppeplaan tähtajaliste valideerimistega

### [v3.1.0] - 2025-09-17

#### Täiustatud mitmeagendiline AI-lahendus
**See versioon parandab mitmeagendilist jaemüügilahendust paremate agendi nimetuste ja täiustatud dokumentatsiooniga.**

#### Muudetud
- **Mitmeagendiline terminoloogia**: „Cora agent“ asendatud kogu jaemüügikeskses mitmeagendilises lahenduses nimetusega „Kliendi agent“ arusaadavuse parandamiseks
- **Agendi arhitektuur**: Kõik dokumentatsioonid, ARM mallid ja koodinäited uuendatud, kasutades järjepidevat nimetust „Kliendi agent“
- **Konfiguratsiooni näited**: Uuendatud agendi konfiguratsioonimustrid värskete nimetustega
- **Dokumentatsiooni järjepidevus**: Kõik viited kasutavad professionaalseid ja kirjeldavaid agendi nimesid

#### Täiustatud
- **ARM mallipakett**: Uuendatud retail-multiagent-arm-template koos Customer agent viidetega
- **Arhitektuuri skeemid**: Värskendatud Mermaid skeemid uuendatud agentide nimedega
- **Koodi näited**: Python klassid ja rakendusnäited kasutavad nüüd CustomerAgent nimetust
- **Keskkonnamuutujad**: Kõik kasutussevõtuskriptid uuendatud CUSTOMER_AGENT_NAME konventsioonide järgi

#### Parendatud
- **Arendajakogemus**: Selgemad agentide rollid ja vastutused dokumentatsioonis
- **Tootmisvalmidus**: Parem kooskõla ettevõtte nimetanekonventsioonidega
- **Õppematerjalid**: Intuitiivsem agentide nimetamine hariduslikel eesmärkidel
- **Mallide kasutusmugavus**: Lihtsustatud arusaamine agentide funktsioonidest ja kasutuselevõtu mustritest

#### Tehnilised üksikasjad
- Uuendatud Mermaid arhitektuuri skeemid CustomerAgent viidetega
- Asendatud CoraAgent klassinimed Python näidetes CustomerAgent nimedega
- Muudetud ARM mallide JSON konfiguratsioonid kasutama "customer" agent tüüpi
- Värskendatud keskkonnamuutujad CORA_AGENT_* mustrilt CUSTOMER_AGENT_* mustrile
- Värskendatud kõik kasutuselevõtu käsud ja konteinerikonfiguratsioonid

### [v3.0.0] - 2025-09-12

#### Suured muudatused - AI arendajate fookus ja Microsoft Foundry integratsioon
**See versioon muudab hoidla põhjalikuks AI-keskseks õppematerjaliks koos Microsoft Foundry integreerimisega.**

#### Lisatud
- **🤖 AI-eeskätt õpitee**: Täielik ümberehitus AI arendajaid ja insenere eelistades
- **Microsoft Foundry integratsioonijuhend**: Ulatuslik dokumentatsioon AZD ühendamiseks Microsoft Foundry teenustega
- **AI mudelite kasutuselevõtu mustrid**: Detailne juhend mudelite valiku, konfigureerimise ja tootmiskasutuse strateegiate kohta
- **AI töötuba laboris**: 2-3 tunnine praktiline töötuba AI rakenduste teisendamiseks AZD kasutuselevõtuks
- **Tootmisvalmis AI parimad tavad**: Ettevõttetasemel mustrid AI töökoormuste skaleerimiseks, monitoorimiseks ja turvamiseks
- **AI-spetsiifiline tõrkeotsingu juhend**: Ulatuslik juhend Microsoft Foundry mudelite, kognitiivsete teenuste ja AI kasutuselevõttu puudutavate probleemide lahendamiseks
- **AI mallide kogu**: Esile tõstetud Microsoft Foundry mallide komplekt keerukuse hinnangutega
- **Töötoa materjalid**: Täielik töötoa ülesehitus praktiliste laborite ja vihjematerjalidega

#### Täiustatud
- **README struktuur**: AI-arendajale suunatud, sisaldab 45% kogukonna huvi andmeid Microsoft Foundry Discordist
- **Õppeteed**: Pühendatud AI arendajate rada koos traditsioonilistega tudengitele ja DevOps inseneridele
- **Mallisoovitused**: Esile tõstetud AI mallid nagu azure-search-openai-demo, contoso-chat ja openai-chat-app-quickstart
- **Kogukonna integratsioon**: Täiustatud Discord kogukonna tugi AI-spetsiifiliste kanalite ja aruteludega

#### Turvalisus ja tootmisfookus
- **Haldatud identiteedi mustrid**: AI-spetsiifilised autentimise ja turvakonfiguratsioonid
- **Kulu optimeerimine**: Tokenite kasutuse jälgimine ja eelarve kontroll AI töökoormustele
- **Mitmeregiooniline kasutuselevõtt**: Globaalsete AI rakenduste juurutamise strateegiad
- **Jõudluse monitooring**: AI-spetsiifilised mõõdikud ja Application Insights integratsioon

#### Dokumentatsiooni kvaliteet
- **Lineaarne kursuse struktuur**: Loogiline edenemine algajast kuni edasijõudnuteni AI kasutuselevõtu mustrites
- **Kehtestatud URL-id**: Kõik välised hoidla lingid kontrollitud ja kättesaadavad
- **Täielik reference**: Kõik sisemise dokumentatsiooni lingid kontrollitud ja toimivad
- **Tootmisvalmis**: Ettevõtte juurutamise mustrid koos reaalse elu näidetega

### [v2.0.0] - 2025-09-09

#### Suured muudatused - hoidla ümberkorraldus ja professionaalsuse tõstmine
**See versioon tähistab märkimisväärset hoidla struktuuri ja sisu esitluse ülevaatust.**

#### Lisatud
- **Struktureeritud õppemudel**: Kõik dokumentatsioonilehed sisaldavad nüüd Sissejuhatus, Õpieesmärgid ja Õppetulemused sektsioone
- **Navigatsioonisüsteem**: Lisatud Eelmine/Järgmine õppetüki lingid kogu dokumentatsioonis juhitud õppimise tagamiseks
- **Õppejuhend**: Ulatuslik study-guide.md koos õpieesmärkide, praktiliste harjutuste ja hinnangumaterjalidega
- **Professionaalne esitlus**: Kõik emojid eemaldatud paremaks ligipääsetavuseks ja professionaalsemaks välimuseks
- **Sisu parem korraldus**: Õppematerjalide parem organiseerimine ja voog

#### Muudetud
- **Dokumentatsiooni formaat**: Kõik dokumentatsioonistandardid ühtlustatud õpieesmärkidele keskendudes
- **Navigatsiooni voog**: Rakendatud loogiline järelkõne kogu õppematerjalides
- **Sisu esitlus**: Eemaldatud dekoratiivsed elemendid, eelistatud selge ja professionaalne vormindus
- **Lingistruktuur**: Kõik sisemised lingid uuendatud vastavalt uuele navigeerimissüsteemile

#### Parendatud
- **Ligipääsetavus**: Eemaldatud emoji kasutus parema ekraanilugejaga ühilduvuse tõttu
- **Professionaalne välimus**: Puhas, akadeemilise stiiliga esitlus sobilik ettevõttetasemel õppimiseks
- **Õppimiskogemus**: Struktureeritud lähenemine selgete eesmärkide ja tulemustega iga õppetüki jaoks
- **Sisu organiseerimine**: Parem loogiline voog ja teemadevaheline seotus

### [v1.0.0] - 2025-09-09

#### Esmane väljaanne - põhjalik AZD õppimise hoidla

#### Lisatud
- **Põhidokumentatsiooni struktuur**
  - Täielik alustamise juhiste seeria
  - Ulatuslik kasutuselevõtu ja provisjonimise dokumentatsioon
  - Detailne tõrkeotsingu ja silumise juhendmaterjal
  - Enne kasutuselevõttu valideerimise tööriistad ja protseduurid

- **Alustamise moodul**
  - AZD põhitõed: põhikontseptsioonid ja terminoloogia
  - Paigaldusjuhend: platvormipõhised seadistusjuhised
  - Konfiguratsioonijuhend: keskkonna seadistus ja autentimine
  - Esimese projekti juhis: samm-sammuline praktiline õppimine

- **Kasutuselevõtu ja provisjonimise moodul**
  - Kasutuselevõtu juhend: täielik töövoo dokumentatsioon
  - Provisjonimise juhend: infrastruktuur koodina Bicepsiga
  - Parimad tavad tootmisjuurutusteks
  - Mitmeteenuse arhitektuuri mustrid

- **Eelvalideerimise moodul**
  - Kapatsiitsiplaan: Azure ressursside kättesaadavuse valideerimine
  - SKU valik: põhjalik teenuse astme juhend
  - Eelkontrollid: automatiseeritud valideerimisskriptid (PowerShell ja Bash)
  - Kulude hindamine ja eelarvestamise tööriistad

- **Tõrkeotsingu moodul**
  - Levinud probleemid: sagedasti esinevad probleemid ja lahendused
  - Silumise juhend: süsteemsed tõrkeotsingumeetodid
  - Täiustatud diagnostikatehnikad ja tööriistad
  - Jõudluse jälgimine ja optimeerimine

- **Ressursid ja viited**
  - Käsuviipa kiirjuhend: kiire viide olulistele käskudele
  - Glossaar: põhjalikud terminoloogilised ja lühendite seletused
  - KKK: detailne vastuste kogu sagedastele küsimustele
  - Välised ressursid ja kogukonnaseosed

- **Näited ja mallid**
  - Lihtne veebirakenduse näide
  - Staatilise veebisaidi kasutuselevõtu mall
  - Konteinerirakenduse konfiguratsioon
  - Andmebaasi integreerimise mustrid
  - Mikroteenuste arhitektuuri näited
  - Serverivaba funktsioonide rakendused

#### Omadused
- **Mitmeplatvormiline tugi**: paigaldamise ja seadistuse juhised Windowsile, macOS-ile ja Linuxile
- **Mitme oskustasemega**: sisu loodud tudengineist professionaalsete arendajateni
- **Praktiline fookus**: praktilised näited ja reaalsed stsenaariumid
- **Põhjalik kate**: alates põhitõdedest kuni keerukate ettevõttemustriteni
- **Turvalisus esikohal**: turvalisuse parimad tavad integreeritud kogu materjalis
- **Kulude optimeerimine**: juhised kulutõhusate kasutuselevõttude ja ressursside halduseks

#### Dokumentatsiooni kvaliteet
- **Detailseid koodinäiteid**: praktilised ja testitud koodinäited
- **Samm-sammult juhised**: selged ja teostatavad suunised
- **Täielik veateadlikkus**: tavaliste probleemide tõrkeotsingu juhendid
- **Parimate tavade integreerimine**: tööstusharu standardid ja soovitused
- **Versiooni ühilduvus**: ajakohastatud viimaste Azure teenuste ja azd funktsioonidega

## Tulevased plaanitud täiustused

### Versioon 3.1.0 (plaanis)
#### AI platvormi laiendus
- **Multi-mudeli tugi**: integreerimismustrid Hugging Face, Azure Machine Learning ja kohandatud mudelite jaoks
- **AI agentide raamistikud**: mallid LangChain, Semantic Kernel ja AutoGen juurutusteks
- **Täiustatud RAG mustrid**: vektandmebaaside valikud väljaspool Azure AI Searchi (Pinecone, Weaviate jt)
- **AI jälgitavus**: täiustatud mudeli jõudluse, tokenite kasutuse ja vastuste kvaliteedi jälgimine

#### Arendajakogemus
- **VS Code laiendus**: integreeritud AZD + Microsoft Foundry arenduskogemus
- **GitHub Copilot integratsioon**: AI abil AZD mallide genereerimine
- **Interaktiivsed juhendid**: praktilised kodeerimisharjutused automaatse valideerimisega AI stsenaariumide jaoks
- **Videomaterjalid**: lisatud videoõpetused visuaalsetele õppijatele AI kasutuselevõttu käsitlevalt

### Versioon 4.0.0 (plaanis)
#### Ettevõtte AI mustrid
- **Juhtimisraamistik**: AI mudelite governance, vastavus ja auditee jäljed
- **Mitme kliendi AI**: mustrid mitmele kliendile isoleeritud AI teenuseid pakkumiseks
- **Edge AI kasutuselevõtt**: integratsioon Azure IoT Edge ja konteineriteenustega
- **Hübriid pilve AI**: mitmepilve ja hübriid kasutuselevõtu mustrid AI töökoormustele

#### Täiustatud funktsioonid
- **AI torustike automatiseerimine**: MLOps integratsioon Azure Machine Learning torustikega
- **Täiustatud turvalisus**: Zero trust mudelid, privaatotsad ja edasijõudnud ohu kaitse
- **Jõudluse optimeerimine**: keerukad seadistamis- ja skaleerimisstrateegiad kõrge läbilaskevõimega AI rakendustele
- **Globaalne levitus**: sisujagamise ja edge puhverdamise mustrid AI rakendustele

### Versioon 3.0.0 (plaanitud) - asendatud käimasoleva väljaandega
#### Pakutavad lisad - nüüd rakendatud v3.0.0-s
- ✅ **AI-keskne sisu**: ulatuslik Microsoft Foundry integratsioon (valmis)
- ✅ **Interaktiivsed juhendid**: praktiline AI töötuba laboris (valmis)
- ✅ **Täiustatud turvamoodul**: AI-spetsiifilised turvamustrid (valmis)
- ✅ **Jõudluse optimeerimine**: AI töökoormuse seadistamisstrateegiad (valmis)

### Versioon 2.1.0 (plaanitud) - osaliselt rakendatud v3.0.0-s
#### Väikesed täiustused - mõned valmis käimasolevas versioonis
- ✅ **Lisatud näited**: AI-kesksed kasutuselevõtu stsenaariumid (valmis)
- ✅ **Laiendatud KKK**: AI-spetsiifilised küsimused ja tõrkeotsing (valmis)
- **Tööriistade integreerimine**: täiustatud IDE ja redaktori juhendid
- ✅ **Jälgimise laiendus**: AI-spetsiifilised jälgimise ja häireduse mustrid (valmis)

#### Jätkuvalt planeeritud tulevaseks väljalaskedeks
- **Mobiilisõbralik dokumentatsioon**: reageeriv kujundus mobiili õppimiseks
- **Offline juurdepääs**: allalaaditavad dokumentatsioonipaketid
- **Täiustatud IDE integratsioon**: VS Code laiendus AZD + AI töövoogudele
- **Kogukonna armatuurlaud**: reaalajas kogukonna mõõdikud ja panuse jälgimine

## Muudatuste logisse panustamine

### Muudatuste teatamine
Muudatusi hoidlasse lisades palume järgida:

1. **Versiooni number**: järgitakse semantilist versioonihaldust (major.minor.patch)
2. **Kuupäev**: väljaandmise või uuendamise kuupäev formaadis YYYY-MM-DD
3. **Kategooria**: Lisatud, Muudetud, Sobimatu, Eemaldatud, Parandatud, Turvalisus
4. **Selge kirjeldus**: kokkuvõtlik muudatuse kirjeldus
5. **Mõju hindamine**: kuidas muudatused mõjutavad olemasolevaid kasutajaid

### Muudatuste kategooriad

#### Lisatud
- Uued funktsioonid, dokumentatsiooni sektsioonid või võimekused
- Uued näited, mallid või õppematerjalid
- Täiendavad tööriistad, skriptid või abivahendid

#### Muudetud
- Olemasoleva funktsionaalsuse või dokumentatsiooni muudatused
- Selguse ja täpsuse parandused
- Sisu või organiseerimise ümberkorraldamine

#### Sobimatu
- Funktsioonid või lähenemised, mida hakatakse lõpetama
- Dokumentatsiooni sektsioonid, mis on planeeritud eemaldamiseks
- Meetodid, millele on paremad alternatiivid

#### Eemaldatud
- Funktsioonid, dokumentatsioon või näited, mis pole enam asjakohased
- Aegunud teave või sobimatud lähenemised
- Üha enam dubleeruv või konsolideeritud sisu

#### Parandatud
- Dokumentatsiooni või koodi veaparandused
- Teatatud probleemide või vigade lahendused
- Täpsuse ja funktsionaalsuse parandused

#### Turvalisus
- Turvalisusega seotud parandused või täiustused
- Turvapraktikate värskendused
- Turvanõrkuste lahendused

### Semantilise versioonihalduse juhised

#### Suur versioon (X.0.0)
- Tagasiühilduvust rikkuvad muudatused, mis nõuavad kasutajalt tegutsemist
- Sisu või organiseerimise olulised ümberkorraldused
- Põhimõtteliste lähenemisviiside või metoodikate muutused

#### Väike versioon (X.Y.0)
- Uued omadused või sisu täiendused
- Parandused, mis säilitavad tagasikõlblikkuse
- Täiendavad näited, tööriistad või ressursid

#### Parandusversioon (X.Y.Z)
- Vead ja veaparandused
- Väikesed täiendused olemasolevale sisule
- Selgitused ja väiksemad täiustused

## Kogukonna tagasiside ja ettepanekud

Soovitame aktiivselt kogukonnalt tagasisidet selle õppematerjali parendamiseks:

### Kuidas tagasisidet anda
- **GitHub Issues**: teatage probleemidest või tehke parandusettepanekuid (AI-spetsiifilised küsimused teretulnud)
- **Discord arutelud**: jagage ideid ja osalege Microsoft Foundry kogukonna vestlustes
- **Pull Request-id**: panustage otse sisu täiustustele, eelkõige AI mallidele ja juhenditele
- **Microsoft Foundry Discord**: osalege #Azure kanalil AZD + AI aruteludes
- **Kogukonna foorumid**: osalege laiemates Azure arendajate aruteludes

### Tagasiside kategooriad
- **AI sisuline täpsus**: parandused AI teenuste integreerimise ja kasutuselevõtu infole
- **Õppimiskogemus**: ettepanekud AI arendajatele suunatud õppimisvoo paremaks muutmiseks
- **Puuduv AI sisu**: päringud täiendavate AI mallide, mustrite või näidete kohta
- **Ligipääsetavus**: täiustused erinevate õppimisharjumustega kasutajatele
- **AI tööriistade integreerimine**: ettepanekud AI arendustöövoogude paremaks ühendamiseks
- **Tootmis AI mustrid**: ettepanekud ettevõtte AI juurutuse mustritele

### Vastamise kohustus
- **Probleemile reageerimine**: kuni 48 tunni jooksul alates teatamisest
- **Uute funktsioonide taotlused**: hindamine 1 nädala jooksul
- **Kogukonna panused**: läbivaatamine 1 nädala jooksul
- **Turvaprobleemid**: kohene prioriteet ja kiirendatud reageerimine

## Hooldusplaan

### Regulaarne uuendamine
- **Kuuülevaated**: sisu täpsuse ja linkide kontroll
- **Kvartiirsed uuendused**: olulised sisu täiendused ja parendused
- **Poolaastased ülevaated**: põhjalik ümberkorraldus ja täiustused
- **Aastased versioonid**: suured versiooniuuendused oluliste täiustustega

### Jälgimine ja kvaliteedi tagamine
- **Automaatne testimine**: koodinäidete ja linkide regulaarne valideerimine
- **Kogukonna tagasiside kaasamine**: regulaarselt kasutajate ettepanekute integreerimine
- **Tehnoloogiauudised**: kooskõla uusimate Azure teenuste ja azd versioonidega
- **Ligipääsetavuse auditid**: regulaarne läbivaatus kaasava disaini printsiipide osas

## Versiooni toetuse poliitika

### Aktiivse versiooni tugi
- **Viimane suur versioon**: Täielik tugi regulaarsete uuendustega  
- **Eelmine suur versioon**: Turvauuendused ja kriitilised parandused 12 kuu jooksul  
- **Pärandversioonid**: Ainult kogukonna tugi, ametlikke uuendusi ei ole  

### Ülemineku juhised  
Kui antakse välja uued suured versioonid, pakume:  
- **Ülemineku juhendid**: Samm-sammult ülemineku juhised  
- **Ühilduvuse märkused**: Üksikasjad katkestavate muudatuste kohta  
- **Tööriistade tugi**: Skriptid või utiliidid, mis aitavad üleminekut  
- **Kogukonna tugi**: Pühendatud foorumid ülemineku küsimustele  

---

**Navigeerimine**  
- **Eelmine peatükk**: [Õppejuhend](resources/study-guide.md)  
- **Järgmine peatükk**: Tagasi [PõhREADME](README.md)  

**Ole kursis**: Jälgi seda hoidlat, et saada teateid uute väljaannete ja õppematerjalide oluliste uuenduste kohta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutuse piiramine**:
See dokument on tõlgitud kasutades tehisintellekti tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame täpsust, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleb pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta ühegi arusaamatuse või valesti mõistmise eest, mis võivad tekkida selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->