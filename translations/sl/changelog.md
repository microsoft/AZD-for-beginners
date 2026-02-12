# Dnevnik sprememb - AZD For Beginners

## Uvod

Ta dnevnik sprememb dokumentira vse pomembne spremembe, posodobitve in izboljšave v repozitoriju AZD For Beginners. Upoštevamo načela semantičnega verzioniranja in vodimo ta zapis, da uporabnikom pomagamo razumeti, kaj se je spremenilo med različicami.

## Cilji učenja

Z ogledom tega dnevnika sprememb boste:
- Ostali obveščeni o novih funkcijah in dodajanju vsebin
- Razumeli izboljšave obstoječe dokumentacije
- Sledili odpravam napak in popravkom za zagotavljanje natančnosti
- Spremljali razvoj učnih gradiv skozi čas

## Rezultati učenja

Po pregledu vnosov v dnevnik boste lahko:
- Prepoznali novo vsebino in vire, ki so na voljo za učenje
- Razumeli, katere sekcije so bile posodobljene ali izboljšane
- Načrtovali svojo učno pot na podlagi najnovejših gradiv
- Prispevali povratne informacije in predloge za prihodnje izboljšave

## Zgodovina različic

### [v3.17.0] - 2026-02-05

#### Izboljšava navigacije po tečaju
**Ta različica izboljšuje navigacijo poglavij v README.md z izboljšano tabelo.**

#### Spremembe
- **Tabela zemljevida tečaja**: Izboljšana z direktnimi povezavami do lekcij, ocenami trajanja in ocenami zahtevnosti
- **Čiščenje map**: Odstranjene odvečne stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Preverjanje povezav**: Vseh 21+ notranjih povezav v tabeli zemljevida tečaja preverjenih

### [v3.16.0] - 2026-02-05

#### Posodobitve imen izdelkov
**Ta različica posodablja reference izdelkov glede na trenutno Microsoftovo blagovno znamko.**

#### Spremembe
- **Azure AI Foundry → Microsoft Foundry**: Vse reference posodobljene v datotekah, ki niso prevodi
- **Azure AI Agent Service → Foundry Agents**: Ime storitve posodobljeno, da odraža trenutno blagovno znamko

#### Posodobljene datoteke
- `README.md` - Glavna stran tečaja
- `changelog.md` - Zgodovina različic
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodnik za AI agente
- `examples/README.md` - Dokumentacija primerov
- `workshop/README.md` - Vstopna stran delavnice
- `workshop/docs/index.md` - Indeks delavnice
- `workshop/docs/instructions/*.md` - Vse datoteke z navodili za delavnico

---

### [v3.15.0] - 2026-02-05

#### Obsežna preureditev repozitorija: Imena map po poglavjih
**Ta različica preuredi dokumentacijo v namenski mapi za vsako poglavje za bolj jasno navigacijo.**

#### Preimenovanje map
Stare mape so bile zamenjane z mapami, oštevilčenimi po poglavjih:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Dodano: `docs/chapter-05-multi-agent/`

#### Migracije datotek
| Datoteka | Iz | V |
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

#### Dodano
- **📚 Chapter README files**: Ustvarjen README.md v vsaki mapi poglavja z:
  - Cilji učenja in trajanje
  - Tabela lekcij z opisi
  - Ukazi za hiter začetek
  - Navigacija do drugih poglavij

#### Spremenjeno
- **🔗 Posodobljene vse notranje povezave**: 78+ poti posodobljenih v celotni dokumentaciji
- **🗺️ Main README.md**: Posodobljen zemljevid tečaja z novo strukturo poglavij
- **📝 examples/README.md**: Posodobljene medsebojne reference na mape poglavij

#### Odstranjeno
- Stara struktura map (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Preureditev repozitorija: Navigacija po poglavjih
**Ta različica je dodala README datoteke za navigacijo po poglavjih (nadomestila jo je v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novi vodnik za AI agente
**Ta različica dodaja obsežen vodnik za nameščanje AI agentov z Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Celovit vodnik, ki pokriva:
  - Kaj so AI agenti in kako se razlikujejo od klepetalnikov
  - Tri predloge za hiter začetek agentov (Foundry Agents, Prompty, RAG)
  - Vzorec arhitekture agentov (en sam agent, RAG, večagentni)
  - Konfiguracija orodij in prilagoditve
  - Nadzor in sledenje metrik
  - Upoštevanje stroškov in optimizacija
  - Pogosti scenariji odpravljanja napak
  - Tri praktične vaje s kriteriji uspeha

#### Struktura vsebine
- **Uvod**: Koncepti agentov za začetnike
- **Hiter začetek**: Namestite agente z `azd init --template get-started-with-ai-agents`
- **Vzorce arhitekture**: Vizualne sheme vzorcev agentov
- **Konfiguracija**: Nastavitev orodij in spremenljivke okolja
- **Nadzor**: Integracija z Application Insights
- **Vaje**: Progresivno praktično učenje (20-45 minut vsaka)

---

### [v3.12.0] - 2026-02-05

#### Posodobitev okolja DevContainer
**Ta različica posodablja konfiguracijo razvojnega kontejnerja z modernimi orodji in boljšimi privzetimi nastavitvami za izkušnjo učenja AZD.**

#### Spremenjeno
- **🐳 Osnovna slika**: Posodobljeno iz `python:3.12-bullseye` v `python:3.12-bookworm` (najnovejša stabilna izdaja Debian)
- **📛 Ime kontejnerja**: Preimenovano iz "Python 3" v "AZD for Beginners" zaradi jasnosti

#### Dodano
- **🔧 Nove funkcije Dev Containerja**:
  - `azure-cli` z omogočeno podporo za Bicep
  - `node:20` (LTS različica za AZD predloge)
  - `github-cli` za upravljanje predlog
  - `docker-in-docker` za nameščanje aplikacij v kontejnerjih

- **🔌 Posredovanje vrat**: Prednastavljena vrata za pogost razvoj:
  - 8000 (predogled MkDocs)
  - 3000 (spletne aplikacije)
  - 5000 (Python Flask)
  - 8080 (API-ji)

- **🧩 Nove razširitve VS Code**:
  - `ms-python.vscode-pylance` - Izboljšan Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podpora za Azure Functions
  - `ms-azuretools.vscode-docker` - Podpora za Docker
  - `ms-azuretools.vscode-bicep` - Podpora za jezik Bicep
  - `ms-azure-devtools.azure-resource-groups` - Upravljanje Azure virov
  - `yzhang.markdown-all-in-one` - Urejanje Markdowna
  - `DavidAnson.vscode-markdownlint` - Lintanje Markdowna
  - `bierner.markdown-mermaid` - Podpora za Mermaid diagrame
  - `redhat.vscode-yaml` - Podpora za YAML (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Gita
  - `mhutchie.git-graph` - Zgodovina Git sprememb

- **⚙️ Nastavitve VS Code**: Dodane privzete nastavitve za Python interpreter, formatiranje ob shranjevanju in odstranjevanje odvečnih presledkov

- **📦 Posodobljen requirements-dev.txt**:
  - Dodan MkDocs minify vtičnik
  - Dodan pre-commit za kakovost kode
  - Dodane Azure SDK knjižnice (azure-identity, azure-mgmt-resource)

#### Popravljeno
- **Ukaz po ustvarjanju**: Zdaj preveri namestitev AZD in Azure CLI ob zagonu kontejnerja

---

### [v3.11.0] - 2026-02-05

#### Prenova README-ja za začetnike
**Ta različica bistveno izboljša README.md, da je bolj dostopen začetnikom, in dodaja pomembne vire za AI razvijalce.**

#### Dodano
- **🆚 Primerjava Azure CLI in AZD**: Jasna razlaga, kdaj uporabiti katero orodje z praktičnimi primeri
- **🌟 Awesome AZD Links**: Neposredne povezave na galerijo skupnostnih predlog in vire za prispevanje:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ predlog pripravljenih za namestitev
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Prispevanje skupnosti
- **🎯 Vodnik za hiter začetek**: Poenostavljen 3-koračni odsek (Namesti → Prijava → Namesti)
- **📊 Tabela navigacije glede na izkušnje**: Jasna usmeritev, kje začeti glede na izkušnje razvijalca

#### Spremenjeno
- **Struktura README**: Preureditev za postopno razkrivanje informacij - ključne informacije prve
- **Sekcija Uvod**: Preoblikovana, da pojasni "Čar `azd up`" za popolne začetnike
- **Odstranjena podvojena vsebina**: Odstranjen podvojen odsek za odpravljanje težav
- **Ukazi za odpravljanje težav**: Popravljena referenca `azd logs` v `azd monitor --logs`

#### Popravljeno
- **🔐 Ukazi za avtentikacijo**: Dodani `azd auth login` in `azd auth logout` v cheat-sheet.md
- **Neveljavne reference ukazov**: Odstranjene ostanke `azd logs` iz razdelka README za odpravljanje težav

#### Opombe
- **Obseg**: Spremembe uporabljene v glavnem README.md in resources/cheat-sheet.md
- **Ciljna publika**: Izboljšave posebej namenjene razvijalcem, ki so novi z AZD

---

### [v3.10.0] - 2026-02-05

#### Posodobitev natančnosti ukazov Azure Developer CLI
**Ta različica popravi neobstoječe ukaze AZD po vsej dokumentaciji, s čimer zagotavlja, da vsi primeri kode uporabljajo veljavno sintakso Azure Developer CLI.**

#### Popravljeno
- **🔧 Neobstoječi ukazi AZD odstranjeni**: Celovit pregled in popravki neveljavnih ukazov:
  - `azd logs` (ne obstaja) → zamenjan z `azd monitor --logs` ali alternativami Azure CLI
  - `azd service` subcommands (ne obstajajo) → zamenjani z `azd show` in Azure CLI
  - `azd infra import/export/validate` (ne obstajajo) → odstranjeni ali zamenjani z veljavnimi alternativami
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` zastavice (ne obstajajo) → odstranjene
  - `azd provision --what-if/--rollback` zastavice (ne obstajajo) → posodobljeno za uporabo `--preview`
  - `azd config validate` (ne obstaja) → zamenjano z `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne obstajajo) → odstranjeni

- **📚 Datoteke posodobljene z popravki ukazov**:
  - `resources/cheat-sheet.md`: Obsežna prenova seznama ukazov
  - `docs/deployment/deployment-guide.md`: Popravljene strategije za povrnitev in nameščanje
  - `docs/troubleshooting/debugging.md`: Popravljeni oddelki za analizo dnevnikov
  - `docs/troubleshooting/common-issues.md`: Posodobljeni ukazi za odpravljanje težav
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljena sekcija za razhroščevanje AZD
  - `docs/getting-started/azd-basics.md`: Popravljeni ukazi za nadzor
  - `docs/getting-started/first-project.md`: Posodobljeni primeri za nadzor in razhroščevanje
  - `docs/getting-started/installation.md`: Popravljeni primeri pomoči in različic
  - `docs/pre-deployment/application-insights.md`: Popravljeni ukazi za ogled dnevnikov
  - `docs/pre-deployment/coordination-patterns.md`: Popravljeni ukazi za razhroščevanje agentov

- **📝 Posodobljena referenca različice**:
  - `docs/getting-started/installation.md`: Spremenjena trdo kodirana različica `1.5.0` v generično `1.x.x` z povezavo na izdaje

#### Spremenjeno
- **Strategije povrnitve**: Dokumentacija posodobljena za uporabo povrnitve na osnovi Gita (AZD nima vgrajene povrnitve)
- **Ogled dnevnikov**: Reference `azd logs` zamenjane z `azd monitor --logs`, `azd monitor --live` in ukazi Azure CLI
- **Sekcija o zmogljivosti**: Odstranjene neobstoječe zastavice za paralelno/incremental namestitev, dodane veljavne alternative

#### Tehnični podatki
- **Veljavni AZD ukazi**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Veljavni preklopniki za azd monitor**: `--live`, `--logs`, `--overview`
- **Odstranjene funkcije**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Opombe
- **Preverjanje**: Ukazi preverjeni z Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Zaključek delavnice in posodobitev kakovosti dokumentacije
**Ta različica dokončuje interaktivne module delavnice, popravlja vse pokvarjene povezave v dokumentaciji in izboljšuje splošno kakovost vsebine za razvijalce AI, ki uporabljajo Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Nov dokument s smernicami za prispevke, ki vsebuje:
  - Jasna navodila za poročanje o težavah in predlaganje sprememb
  - Standardi dokumentacije za novo vsebino
  - Smernice za primere kode in konvencije sporočil commitov
  - Informacije o vključevanju skupnosti

#### Dokončano
- **🎯 Modul delavnice 7 (Zaključek)**: Popolnoma dokončan zaključni modul z:
  - Celovitim povzetkom dosežkov delavnice
  - Razdelkom o osvojenih ključnih konceptih, ki pokriva AZD, predloge in AI Foundry
  - Priporočili za nadaljevanje učne poti
  - Izzivi delavnice z ocenami zahtevnosti
  - Povezavami za povratne informacije skupnosti in podporo

- **📚 Modul delavnice 3 (Razčlenitev)**: Posodobljeni učni cilji z:
  - Navodili za aktivacijo GitHub Copilot z MCP strežniki
  - Razumevanjem strukture map AZD predlog
  - Vzorcami organizacije Infrastructure-as-Code (Bicep)
  - Navodili za praktično delavnico

- **🔧 Modul delavnice 6 (Odstranitev)**: Dokončano z:
  - Cilji čiščenja virov in upravljanja stroškov
  - Uporabo `azd down` za varno odstranjevanje infrastrukture
  - Navodili za obnovitev mehko izbrisanih kognitivnih storitev
  - Dodatnimi predlogi za raziskovanje GitHub Copilot in Azure Portal

#### Popravljeno
- **🔗 Popravki pokvarjenih povezav**: Rešeno več kot 15 pokvarjenih notranjih povezav v dokumentaciji:
  - `docs/ai-foundry/ai-model-deployment.md`: Fixed paths to microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrected ai-model-deployment.md and production-ai-practices.md paths
  - `docs/getting-started/first-project.md`: Replaced non-existent cicd-integration.md with deployment-guide.md
  - `examples/retail-scenario.md`: Fixed FAQ and troubleshooting guide paths
  - `examples/container-app/microservices/README.md`: Corrected course home and deployment guide paths
  - `resources/faq.md` and `resources/glossary.md`: Updated AI chapter references
  - `course-outline.md`: Fixed instructor guide and AI workshop lab references

- **📅 Pasica statusa delavnice**: Posodobljeno iz "Under Construction" na aktivno stanje delavnice z datumom februar 2026

- **🔗 Navigacija delavnice**: Popravljene pokvarjene navigacijske povezave v workshop README.md, ki so kazale na neobstoječo mapo lab-1-azd-basics

#### Spremenjeno
- **Predstavitev delavnice**: Odstranjeno opozorilo "under construction", delavnica je zdaj dokončana in pripravljena za uporabo
- **Doslednost navigacije**: Zagotovljeno, da imajo vsi moduli delavnice pravilno medsebojno navigacijo
- **Sklici v učni poti**: Posodobljeni medpoglavjski sklici, da uporabljajo pravilne microsoft-foundry poti

#### Preverjeno
- ✅ Vse angleške markdown datoteke imajo veljavne notranje povezave
- ✅ Moduli delavnice 0-7 so dokončani z učnimi cilji
- ✅ Navigacija med poglavji in moduli deluje pravilno
- ✅ Vsebina je primerna za razvijalce AI, ki uporabljajo Microsoft AZD
- ✅ Jezik in struktura prijazna začetnikom sta ohranjena
- ✅ CONTRIBUTING.md nudi jasna navodila za prispevke skupnosti

#### Tehnična implementacija
- **Preverjanje povezav**: Avtomatiziran PowerShell skript je preveril vse .md notranje povezave
- **Revizija vsebine**: Ročni pregled popolnosti delavnice in primernosti za začetnike
- **Sistem navigacije**: Uporabljeni so bili dosledni vzorci za navigacijo poglavij in modulov

#### Opombe
- **Obseg**: Spremembe so bile uporabljene samo v angleški dokumentaciji
- **Prevodi**: Mape s prevodi niso bile posodobljene v tej različici (avtomatiziran prevod bo sinhroniziran kasneje)
- **Trajanje delavnice**: Popolna delavnica zdaj nudi 3–4 ure praktičnega učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: spremljanje, varnost in vzorci več-agentnega delovanja
**Ta različica dodaja celovite lekcije najvišje kakovosti o integraciji Application Insights, vzorcih avtentikacije in koordinacije več agentov za produkcijska okolja.**

#### Dodano
- **📊 Lekcija o integraciji Application Insights**: v `docs/pre-deployment/application-insights.md`:
  - Namestitev osredotočena na AZD z avtomatskim zagotavljanjem
  - Celovite Bicep predloge za Application Insights + Log Analytics
  - Delujoče Python aplikacije s prilagojeno telemetrijo (1200+ vrstic)
  - Vzorci spremljanja za AI/LLM (sledenje tokenov/stroškov Azure OpenAI)
  - 6 diagramov Mermaid (arhitektura, distribuirano sledenje, tok telemetrije)
  - 3 praktične vaje (alarmi, nadzorne plošče, spremljanje AI)
  - Primeri Kusto poizvedb in strategije optimizacije stroškov
  - Pretakanje metrik v živo in odpravljanje napak v realnem času
  - Čas učenja 40–50 minut s produkcijsko pripravnimi vzorci

- **🔐 Lekcija o vzorcih avtentikacije in varnosti**: v `docs/getting-started/authsecurity.md`:
  - 3 vzorci avtentikacije (connection strings, Key Vault, managed identity)
  - Celovite Bicep infrastrukturne predloge za varne namestitve
  - Koda Node.js aplikacije z integracijo Azure SDK
  - 3 popolne vaje (omogočanje managed identity, user-assigned identity, rotacija Key Vault)
  - Varnostne najboljše prakse in konfiguracije RBAC
  - Vodnik za odpravljanje težav in analiza stroškov
  - Produkcijsko pripravljeni vzorci brezgeselne avtentikacije

- **🤖 Lekcija o vzorcih koordinacije več agentov**: v `docs/pre-deployment/coordination-patterns.md`:
  - 5 vzorcev koordinacije (sledenje, vzporedno, hierarhično, na dogodke, konsenz)
  - Popolna implementacija orkestrator storitve (Python/Flask, 1500+ vrstic)
  - 3 specializirane implementacije agentov (Research, Writer, Editor)
  - Integracija Service Bus za vrstičenje sporočil
  - Upravljanje stanja z Cosmos DB za distribuirane sisteme
  - 6 diagramov Mermaid, ki prikazujejo interakcije agentov
  - 3 napredne vaje (obvladovanje timeoutov, logika ponavljanja, circuit breaker)
  - Razčlenitev stroškov ($240-565/month) z strategijami optimizacije
  - Integracija Application Insights za spremljanje

#### Izboljšano
- **Poglavje Pre-deployment**: Zdaj vključuje celovite vzorce spremljanja in koordinacije
- **Poglavje Getting Started**: Izboljšano z profesionalnimi varnostnimi vzorci
- **Priprava na produkcijo**: Popolno pokrivanje od varnosti do opazovanja
- **Načrt tečaja**: Posodobljen za sklicevanje na nove lekcije v poglavjih 3 in 6

#### Spremenjeno
- **Napredovanje učenja**: Boljša integracija varnosti in spremljanja skozi celoten tečaj
- **Kakovost dokumentacije**: Dosledni standardi A-grade (95–97%) za nove lekcije
- **Produkcijski vzorci**: Popolno pokritje end-to-end za okolja na ravni podjetja

#### Izboljšano
- **Izkušnja razvijalca**: Jasna pot od razvoja do produkcijskega spremljanja
- **Varnostni standardi**: Profesionalni vzorci za avtentikacijo in upravljanje skrivnosti
- **Opazovanje**: Celovita integracija Application Insights z AZD
- **AI delovne obremenitve**: Specializirano spremljanje za Azure OpenAI in multividne agente

#### Preverjeno
- ✅ Vse lekcije vključujejo popolno delujočo kodo (ne izrezki)
- ✅ Diagrami Mermaid za vizualno učenje (19 skupno v 3 lekcijah)
- ✅ Praktične vaje z verifikacijskimi koraki (9 skupno)
- ✅ Produkcijsko pripravljene Bicep predloge za namestitev z `azd up`
- ✅ Analiza stroškov in strategije optimizacije
- ✅ Vodniki za odpravljanje težav in najboljše prakse
- ✅ Kontrolne točke znanja z verifikacijskimi ukazi

#### Rezultati ocenjevanja dokumentacije
- **docs/pre-deployment/application-insights.md**: - Celovit vodič za spremljanje
- **docs/getting-started/authsecurity.md**: - Profesionalni varnostni vzorci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne več-agentne arhitekture
- **Skratka nova vsebina**: - Dosledni standardi visoke kakovosti

#### Tehnična implementacija
- **Application Insights**: Log Analytics + prilagojena telemetrija + distribuirano sledenje
- **Avtentikacija**: Managed Identity + Key Vault + vzorci RBAC
- **Več-agentno**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Spremljanje**: Metrično pretakanje v živo + Kusto poizvedbe + alarmi + nadzorne plošče
- **Upravljanje stroškov**: Strategije vzorčenja, politike zadrževanja, proračunske omejitve

### [v3.7.0] - 2025-11-19

#### Izboljšave kakovosti dokumentacije in nov primer Azure OpenAI
**Ta različica izboljšuje kakovost dokumentacije po celotnem repozitoriju in dodaja popoln primer namestitve Azure OpenAI z GPT-4 klepetalnim vmesnikom.**

#### Dodano
- **🤖 Primer Azure OpenAI Chat**: Popolna namestitev GPT-4 z delujočo implementacijo v `examples/azure-openai-chat/`:
  - Popolna infrastruktura Azure OpenAI (namestitev GPT-4 modela)
  - Python ukazni vmesnik za klepet z zgodovino pogovorov
  - Integracija Key Vault za varno shranjevanje API ključev
  - Sledenje porabe tokenov in ocena stroškov
  - Omejevanje hitrosti in obravnava napak
  - Celovit README z vodičem za namestitev (35–45 minut)
  - 11 produkcijsko pripravnih datotek (Bicep predloge, Python aplikacija, konfiguracija)
- **📚 Vaje v dokumentaciji**: Dodane praktične vaje v vodnik za konfiguracijo:
  - Vaja 1: Konfiguracija več okolij (15 minut)
  - Vaja 2: Vaja za upravljanje skrivnosti (10 minut)
  - Jasna merila uspeha in koraki za preverjanje
- **✅ Verifikacija namestitve**: Dodan oddelek za preverjanje v vodič za namestitev:
  - Postopki za preverjanje stanja (health check)
  - Kontrolni seznam meril uspeha
  - Pričakovani izhodi za vse ukaze namestitve
  - Hiter referenčni vodič za odpravljanje težav

#### Izboljšano
- **examples/README.md**: Posodobljeno na kakovost A (93%):
  - Dodan azure-openai-chat v vse ustrezne razdelke
  - Posodobljeno število lokalnih primerov z 3 na 4
  - Dodano v tabelo primerov AI aplikacij
  - Integrirano v Hitri začetek za srednje zahtevne uporabnike
  - Dodano v razdelek Microsoft Foundry Templates
  - Posodobljen primerjalni matrika in razdelki za iskanje tehnologij
- **Kakovost dokumentacije**: Izboljšana iz B+ (87%) → A- (92%) v mapi docs:
  - Dodani pričakovani izhodi za ključne primere ukazov
  - Vključeni koraki preverjanja za spremembe konfiguracije
  - Izboljšano praktično učenje z bolj izvedljivimi vajami

#### Spremenjeno
- **Napredovanje učenja**: Boljša integracija AI primerov za srednje zahtevne uporabnike
- **Struktura dokumentacije**: Več izvedljivih vaj z jasnimi rezultati
- **Proces verifikacije**: Dodana eksplicitna merila uspeha v ključnih potekih

#### Izboljšano
- **Izkušnja razvijalca**: Namestitev Azure OpenAI zdaj traja 35–45 minut (v primerjavi z 60–90 za kompleksne alternative)
- **Preglednost stroškov**: Jasne ocene stroškov ($50-200/month) za primer Azure OpenAI
- **Učna pot**: AI razvijalcem ponuja jasen vstopni primer z azure-openai-chat
- **Standardi dokumentacije**: Dosledni pričakovani izhodi in koraki preverjanja

#### Preverjeno
- ✅ Primer Azure OpenAI popolnoma funkcionalen z `azd up`
- ✅ Vseh 11 datotek implementacije je sintaktično pravilnih
- ✅ Navodila v README ustrezajo dejanski izkušnji namestitve
- ✅ Povezave v dokumentaciji posodobljene na 8+ lokacijah
- ✅ Indeks primerov natančno odraža 4 lokalne primere
- ✅ V tabelah ni podvojenih zunanjih povezav
- ✅ Vsi sklici na navigacijo so pravilni

#### Tehnična implementacija
- **Arhitektura Azure OpenAI**: GPT-4 + Key Vault + Container Apps vzorec
- **Varnost**: Pripravljeno za Managed Identity, skrivnosti v Key Vault
- **Spremljanje**: Integracija Application Insights
- **Upravljanje stroškov**: Sledenje tokenov in optimizacija porabe
- **Namestitev**: En ukaz `azd up` za popolno nastavitev

### [v3.6.0] - 2025-11-19

#### Večja posodobitev: primeri namestitve Container App
**Ta različica uvaja celovite, produkcijsko pripravljene primere namestitve vsebniških aplikacij z uporabo Azure Developer CLI (AZD), z vsemi dokumenti in integracijo v učno pot.**

#### Dodano
- **🚀 Primeri Container App**: Novi lokalni primeri v `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Celovit pregled vsebničenih namestitev, hiter začetek, produkcija in napredni vzorci
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API za začetnike s scale-to-zero, health probes, spremljanjem in odpravljanjem napak
  - [Microservices Architecture](../../examples/container-app/microservices): Produkcijsko pripravljen večstoritveni razpored (API Gateway, Product, Order, User, Notification), asinhrono sporočanje, Service Bus, Cosmos DB, Azure SQL, distribuirano sledenje, blue-green/canary namestitev
- **Najboljše prakse**: Varnost, spremljanje, optimizacija stroškov in smernice CI/CD za vsebnične obremenitve
- **Primeri kode**: Popolni `azure.yaml`, Bicep predloge in implementacije storitev v več jezikih (Python, Node.js, C#, Go)
- **Testiranje in odpravljanje napak**: Scenariji končnega do konca testiranja, ukazi za spremljanje, navodila za odpravljanje težav

#### Spremenjeno
- **README.md**: Posodobljen za predstavitev in povezavo do novih primerov Container App v razdelku "Local Examples - Container Applications"
- **examples/README.md**: Posodobljen za izpostavitev primerov container app, dodan primerjalni matrix in posodobljene sklice na tehnologije/arhitekturo
- **Načrt tečaja in vodnik za študij**: Posodobljeno tako, da se v ustreznih poglavjih sklicuje na nove primere aplikacij v vsebnikih in vzorce razmestitve

#### Preverjeno
- ✅ Vsi novi primeri so razmestljivi z `azd up` in sledijo najboljšim praksam
- ✅ Križno sklicevanje dokumentacije in navigacija posodobljena
- ✅ Primeri zajemajo scenarije od začetniških do naprednih, vključno s produkcijskimi mikrostoritvami

#### Opombe
- **Obseg**: Samo dokumentacija in primeri v angleščini
- **Naslednji koraki**: Razširiti z dodatnimi naprednimi vzorci vsebnikov in avtomatizacijo CI/CD v prihodnjih izdajah

### [v3.5.0] - 2025-11-19

#### Preimenovanje izdelka: Microsoft Foundry
**Ta različica izvaja celovito spremembo imena izdelka iz "Microsoft Foundry" v "Microsoft Foundry" v celotni angleški dokumentaciji, kar odraža uradno preimenovanje družbe Microsoft.**

#### Spremenjeno
- **🔄 Posodobitev imena izdelka**: Popolno preimenovanje iz "Microsoft Foundry" v "Microsoft Foundry"
  - Posodobljeni vsi sklici v angleški dokumentaciji v mapi `docs/`
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Skupaj: Posodobljenih 23 vsebinskih sklicev v 7 dokumentacijskih datotekah

- **📁 Spremembe strukture map**:
  - `docs/ai-foundry/` preimenovana v `docs/microsoft-foundry/`
  - Vsi križni sklici posodobljeni, da odražajo novo strukturo map
  - Navigacijske povezave potrjene po celotni dokumentaciji

- **📄 Preimenovanja datotek**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Vse notranje povezave posodobljene, da se sklicujejo na novo ime datoteke

#### Posodobljene datoteke
- **Dokumentacija poglavij** (7 datotek):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 posodobitve navigacijskih povezav
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 posodobitve sklicev imena izdelka
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - že uporablja Microsoft Foundry (iz prejšnjih posodobitev)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 posodobitve sklicev (pregled, povratne informacije skupnosti, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 posodobitve križnih sklicev
  - `docs/getting-started/first-project.md` - 2 posodobitvi navigacijskih povezav poglavij
  - `docs/getting-started/installation.md` - 2 posodobitvi povezav na naslednje poglavje
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 posodobitve sklicev (navigacija, Discord skupnost)
  - `docs/troubleshooting/common-issues.md` - 1 posodobitev navigacijske povezave
  - `docs/troubleshooting/debugging.md` - 1 posodobitev navigacijske povezave

- **Datoteke strukture tečaja** (2 datoteki):
  - `README.md` - posodobljenih 17 sklicev (pregled tečaja, naslovi poglavij, razdelek s predlogami, vpogledi skupnosti)
  - `course-outline.md` - posodobljenih 14 sklicev (pregled, učni cilji, viri poglavij)

#### Preverjeno
- ✅ Ni več sklicev na mapo 'ai-foundry' v angleških dokumentih
- ✅ Ni več sklicev na ime izdelka "Microsoft Foundry" v angleških dokumentih
- ✅ Vse navigacijske povezave delujejo s novo strukturo map
- ✅ Preimenovanja datotek in map uspešno dokončana
- ✅ Križni sklici med poglavji preverjeni

#### Opombe
- **Obseg**: Spremembe uporabljene samo v angleški dokumentaciji v mapi `docs/`
- **Prevodi**: Mape z prevodi (`translations/`) v tej različici niso posodobljene
- **Delavnica**: Gradiva delavnice (`workshop/`) v tej različici niso posodobljena
- **Primeri**: Datoteke s primeri lahko še vedno vključujejo sklice na zastarelo poimenovanje (bodo rešene v prihodnji posodobitvi)
- **Zunanje povezave**: Zunanji URL-ji in sklici na GitHub repozitorij ostajajo nespremenjeni

#### Vodnik za migracijo za prispevatele
Če imate lokalne veje ali dokumentacijo, ki se sklicuje na staro strukturo:
1. Posodobite sklice na mape: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Posodobite sklice na datoteke: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamenjajte ime izdelka: "Microsoft Foundry" → "Microsoft Foundry"
4. Preverite, da vse notranje dokumentacijske povezave še vedno delujejo

---

### [v3.4.0] - 2025-10-24

#### Izboljšave predogleda infrastrukture in validacije
**Ta različica uvaja obsežno podporo za novo predogledno funkcijo Azure Developer CLI in izboljšuje uporabniško izkušnjo delavnice.**

#### Dodano
- **🧪 azd provision --preview Dokumentacija funkcije**: Celovito pokritje nove zmožnosti predogleda infrastrukture
  - Referenca ukazov in primeri uporabe v hitrem vodniku
  - Podrobna integracija v vodniku za provisioning z opisi primerov uporabe in koristi
  - Integracija predhodnega preverjanja za varnejšo validacijo razmestitve
  - Posodobitve uvodnega vodiča z praksami razmestitve, ki dajejo prednost varnosti
- **🚧 Pasica stanja delavnice**: Profesionalna HTML-pasica, ki označuje status razvoja delavnice
  - Gradientni dizajn z indikatorji v gradnji za jasno komunikacijo uporabnikom
  - Časovni žig zadnje posodobitve za preglednost
  - Mobilno odziven dizajn za vse vrste naprav

#### Izboljšano
- **Varnost infrastrukture**: funkcionalnost predogleda integrirana v celotno dokumentacijo razmestitve
- **Validacija pred razmestitvijo**: avtomatizirani skripti sedaj vključujejo testiranje predogleda infrastrukture
- **Razvijalni potek dela**: posodobljeni zaporedji ukazov vključujejo predogled kot najboljšo prakso
- **Izkušnja delavnice**: uporabnikom so jasno postavljena pričakovanja glede statusa razvoja vsebine

#### Spremenjeno
- **Najboljše prakse razmestitve**: priporočen je delovni tok, ki prednostno uporablja predogled
- **Potek dokumentacije**: validacija infrastrukture prestavljena prej v učni proces
- **Predstavitev delavnice**: profesionalna komunikacija statusa s jasno časovnico razvoja

#### Izboljšano
- **Pristop, ki daje prednost varnosti**: spremembe infrastrukture je zdaj mogoče preveriti pred razmestitvijo
- **Sodelovanje v ekipi**: rezultate predogleda je mogoče deliti za pregled in odobritev
- **Zavedanje stroškov**: boljše razumevanje stroškov virov pred provisioningom
- **Ublažitev tveganj**: manj neuspešnih razmestitev zaradi predhodne validacije

#### Tehnična implementacija
- **Integracija v več dokumentih**: funkcija predogleda dokumentirana v 4 ključnih datotekah
- **Vzorec ukazov**: dosledna sintaksa in primeri po celotni dokumentaciji
- **Integracija najboljših praks**: predogled vključen v validacijske delovne procese in skripte
- **Vizualni indikatorji**: jasne oznake NOVO za lažjo odkritljivost

#### Infrastruktura delavnice
- **Komunikacija statusa**: profesionalna HTML-pasica z gradientno obliko
- **Uporabniška izkušnja**: jasen status razvoja preprečuje zmedo
- **Profesionalna predstavitev**: ohranja verodostojnost repozitorija med postavljanjem pričakovanj
- **Preglednost časovnice**: časovni žig zadnje posodobitve oktober 2025 za odgovornost

### [v3.3.0] - 2025-09-24

#### Izboljšano gradivo delavnic in interaktivna učna izkušnja
**Ta različica uvaja obsežna gradiva delavnic z brskalniško interaktivnimi vodiči in strukturiranimi učnimi potmi.**

#### Dodano
- 🎥 Interaktivni vodič delavnice: izkušnja delavnice v brskalniku z možnostjo predogleda v MkDocs
- 📝 Strukturirana navodila delavnice: vodena učna pot v 7 korakih od odkritja do prilagoditve
  - 0-Uvod: pregled delavnice in nastavitev
  - 1-Izbor-AI-predloge: postopek odkrivanja in izbire predloge
  - 2-Validacija-AI-predloge: postopki razmestitve in validacije
  - 3-Analiza-AI-predloge: razumevanje arhitekture predloge
  - 4-Konfiguracija-AI-predloge: konfiguracija in prilagoditve
  - 5-Prilagoditev-AI-predloge: napredne spremembe in iteracije
  - 6-Razgradnja-infrastrukture: čiščenje in upravljanje virov
  - 7-Zaključek: povzetek in naslednji koraki
- 🛠️ Orodja delavnice: konfiguracija MkDocs z Material temo za izboljšano učno izkušnjo
- 🎯 Praktična učna pot: metodologija v 3 korakih (Odkritje → Razmestitev → Prilagoditev)
- 📱 Integracija GitHub Codespaces: brezhibna nastavitev razvojnega okolja

#### Izboljšano
- AI laboratorij delavnice: razširjen z obsežno strukturirano učno izkušnjo, trajajočo 2–3 ure
- Dokumentacija delavnice: profesionalna predstavitev z navigacijo in vizualnimi pripomočki
- Napredovanje učenja: jasna vodena navodila korak za korakom od izbire predloge do razmestitve v produkciji
- Izkušnja razvijalca: integrirana orodja za poenostavljene razvojne delovne tokove

#### Izboljšano
- Dostopnost: vmesnik v brskalniku z iskanjem, funkcijo kopiranja in preklopom teme
- Učenje v lastnem tempu: prožna struktura delavnice, ki omogoča različne hitrosti učenja
- Praktična uporaba: scenariji razmestitve AI-predlog v resničnem svetu
- Integracija skupnosti: integracija Discorda za podporo delavnicam in sodelovanje

#### Značilnosti delavnice
- Vgrajeno iskanje: hitro iskanje po ključnih besedah in lekcijah
- Kopiranje blokov kode: funkcionalnost kopiranja ob premiku kazalca za vse primere kode
- Preklop teme: podpora temnemu/svetlemu načinu za različne preference
- Vizualna gradiva: posnetki zaslona in diagrami za boljše razumevanje
- Integracija pomoči: neposreden dostop do Discorda za podporo skupnosti

### [v3.2.0] - 2025-09-17

#### Obsežna prestrukturacija navigacije in sistem učenja, ki temelji na poglavjih
**Ta različica uvaja celovito strukturo učenja, razdeljeno na poglavja, z izboljšano navigacijo po celotnem repozitoriju.**

#### Dodano
- 📚 Sistem učenja na osnovi poglavij: celoten tečaj prestrukturiran v 8 progresivnih učnih poglavij
  - Poglavje 1: Osnove in hitri začetek (⭐ - 30–45 min)
  - Poglavje 2: Razvoj, osredotočen na AI (⭐⭐ - 1–2 uri)
  - Poglavje 3: Konfiguracija in avtentikacija (⭐⭐ - 45–60 min)
  - Poglavje 4: Infrastruktura kot koda in razmestitev (⭐⭐⭐ - 1–1,5 ure)
  - Poglavje 5: Rešitve AI z več agenti (⭐⭐⭐⭐ - 2–3 ure)
  - Poglavje 6: Validacija in načrtovanje pred razmestitvijo (⭐⭐ - 1 ura)
  - Poglavje 7: Odpravljanje težav in razhroščevanje (⭐⭐ - 1–1,5 ure)
  - Poglavje 8: Vzorce v produkciji in za podjetja (⭐⭐⭐⭐ - 2–3 ure)
- 📚 Celovit navigacijski sistem: dosledni navigacijski glavi in noge po vsej dokumentaciji
- 🎯 Sledenje napredku: kontrolni seznam za dokončanje tečaja in sistem preverjanja učenja
- 🗺️ Usmerjanje učne poti: jasne vstopne točke za različne ravni izkušenj in cilje
- 🔗 Navigacija s križnimi sklici: povezane poglavja in predpogoj jasno povezani

#### Izboljšano
- Struktura README: preoblikovana v strukturirano učilno platformo z organizacijo po poglavjih
- Navigacija dokumentacije: vsaka stran zdaj vključuje kontekst poglavja in vodila za napredovanje
- Organizacija predlog: primeri in predloge povezani z ustreznimi učnimi poglavji
- Integracija virov: hitri vodniki, pogosta vprašanja in študijski vodiči povezani z ustreznimi poglavji
- Integracija delavnic: praktične delavnice povezane z več učnimi cilji poglavij

#### Spremenjeno
- Napredovanje učenja: prešlo iz linearne dokumentacije v prilagodljivo učenje po poglavjih
- Razporeditev konfiguracije: vodič za konfiguracijo premaknjen v poglavje 3 za boljši tok učenja
- Integracija vsebin AI: boljša integracija vsebin, specifičnih za AI, skozi celotno učno pot
- Vsebine za produkcijo: napredni vzorci združeni v poglavju 8 za podjetniške udeležence

#### Izboljšano
- Uporabniška izkušnja: jasne drobtinice navigacije in indikatorji napredka poglavij
- Dostopnost: dosledni navigacijski vzorci za lažje premikanje po tečaju
- Profesionalna predstavitev: struktura tečaja v stilu univerze, primerna za akademsko in korporativno usposabljanje
- Učinkovitost učenja: zmanjšan čas iskanja relevantnih vsebin zahvaljujoč izboljšani organizaciji

#### Tehnična implementacija
- Navigacijske glave: standardizirana navigacija poglavij v več kot 40 dokumentacijskih datotekah
- Navigacija v nogi strani: dosledna navodila za napredovanje in indikatorji dokončanja poglavij
- Križno linkanje: obsežen sistem notranjih povezav, ki povezuje sorodne koncepte
- Preslikava poglavij: predloge in primeri jasno povezani z učnimi cilji

#### Izboljšava študijskega vodiča
- 📚 Celoviti učni cilji: študijski vodič prestrukturiran v skladu s sistemom 8 poglavij
- 🎯 Ocena po poglavjih: vsako poglavje vključuje specifične učne cilje in praktične vaje
- 📋 Sledenje napredku: tedenski učni načrt z merljivimi rezultati in kontrolnimi seznami za dokončanje
- ❓ Vprašanja za ocenjevanje: vprašanja za preverjanje znanja za vsako poglavje s strokovnimi izidi
- 🛠️ Praktične vaje: praktične aktivnosti z resničnimi scenariji razmestitve in odpravljanja težav
- 📊 Napredovanje spretnosti: jasno napredovanje od osnovnih konceptov do podjetniških vzorcev s poudarkom na razvoju kariere
- 🎓 Okvir za certificiranje: strokovni razvojni cilji in sistem priznanja v skupnosti
- ⏱️ Upravljanje časovnice: strukturiran 10-tedenski učni načrt z validacijo mejnic

### [v3.1.0] - 2025-09-17

#### Izboljšane rešitve AI z več agenti
**Ta različica izboljšuje maloprodajno rešitev z več agenti z boljšim poimenovanjem agentov in izboljšano dokumentacijo.**

#### Spremenjeno
- Terminologija več agentov: "Cora agent" je bil zamenjan s "Customer agent" v celotni maloprodajni rešitvi z več agenti za lažje razumevanje
- Arhitektura agentov: posodobljena vsa dokumentacija, ARM predloge in primeri kode za uporabo doslednega poimenovanja "Customer agent"
- Primeri konfiguracije: posodobljeni vzorci konfiguracije agentov z novimi konvencijami poimenovanja
- Doslednost dokumentacije: zagotovljeno, da vsi sklici uporabljajo profesionalna, opisna imena agentov

#### Izboljšano
- Paket ARM predlog: posodobljen retail-multiagent-arm-template z navedbami "Customer agent"
- Diagrami arhitekture: osveženi Mermaid diagrami z posodobljenim poimenovanjem agentov
- Primeri kode: Python klase in implementacijski primeri zdaj uporabljajo poimenovanje CustomerAgent
- Spremenljivke okolja: posodobljeni vsi skripti za razmestitev, da uporabljajo konvencijo CUSTOMER_AGENT_NAME

#### Izboljšano
- **Izkušnja razvijalca**: Jasnejše vloge in odgovornosti agentov v dokumentaciji
- **Pripravljenost za produkcijo**: Boljše usklajevanje s korporativnimi konvencijami poimenovanja
- **Učilni materiali**: Bolj intuitivna poimenovanja agentov za izobraževalne namene
- **Uporabnost predlog**: Poenostavljeno razumevanje funkcij agentov in vzorcev nameščanja

#### Tehnične podrobnosti
- Posodobljeni Mermaid arhitekturni diagrami z referencami na CustomerAgent
- V Python primerih zamenjana imena razreda CoraAgent s CustomerAgent
- Spremenjene ARM predloge JSON konfiguracije za uporabo agentnega tipa "customer"
- Posodobljene okoljske spremenljivke iz CORA_AGENT_* v CUSTOMER_AGENT_* vzorce
- Osveženi vsi ukazi za nameščanje in konfiguracije kontejnerjev

### [v3.0.0] - 2025-09-12

#### Večje spremembe - Osredotočenost na AI razvijalce in integracija z Microsoft Foundry
**Ta različica preoblikuje repozitorij v obsežen učni vir, osredotočen na AI, z integracijo Microsoft Foundry.**

#### Dodano
- **🤖 Učilna pot, usmerjena v AI**: Popolna prerazporeditev s prednostjo za AI razvijalce in inženirje
- **Vodnik za integracijo Microsoft Foundry**: Celovita dokumentacija za povezavo AZD s storitvami Microsoft Foundry
- **Vzorci nameščanja AI modelov**: Podroben vodnik, ki pokriva izbor modela, konfiguracijo in strategije nameščanja v produkcijo
- **AI delavnica**: 2-3-urne praktične delavnice za pretvorbo AI aplikacij v rešitve, ki jih je mogoče razmestiti z AZD
- **Priporočljive prakse za produkcijski AI**: Vzorci pripravljeni za podjetja za skaliranje, spremljanje in zavarovanje AI obremenitev
- **Vodnik za odpravljanje težav specifičnih za AI**: Celovito odpravljanje težav za Azure OpenAI, Cognitive Services in težave pri nameščanju AI
- **Galerija AI predlog**: Izbrane Microsoft Foundry predloge s ocenami kompleksnosti
- **Gradivo za delavnice**: Celotna struktura delavnice s praktičnimi laboratoriji in referenčnimi materiali

#### Izboljšano
- **Struktura README**: Osredotočeno na AI razvijalce z 45 % podatki o interesu skupnosti iz Microsoft Foundry Discord
- **Učne poti**: Posebna pot za AI razvijalce ob tradicionalnih poteh za študente in DevOps inženirje
- **Priporočila predlog**: Izbrane AI predloge, vključno z azure-search-openai-demo, contoso-chat in openai-chat-app-quickstart
- **Integracija skupnosti**: Izboljšana podpora skupnosti na Discordu z AI-specifičnimi kanali in razpravami

#### Varnost in fokus na produkcijo
- **Vzorci upravljanih identitet**: Avtentikacija in varnostne konfiguracije specifične za AI
- **Optimizacija stroškov**: Sledenje uporabi žetonov in nadzor proračuna za AI obremenitve
- **Večregijsko nameščanje**: Strategije za globalno nameščanje AI aplikacij
- **Spremljanje zmogljivosti**: Meritve specifične za AI in integracija z Application Insights

#### Kakovost dokumentacije
- **Linearna struktura tečaja**: Logičen napredek od začetnika do naprednih vzorcev nameščanja AI
- **Preverjene URL povezave**: Vse zunanje povezave do repozitorijev preverjene in dostopne
- **Popolna referenca**: Vse notranje povezave v dokumentaciji preverjene in funkcionalne
- **Pripravljeno za produkcijo**: Podjetniški vzorci nameščanja z realnimi primeri

### [v2.0.0] - 2025-09-09

#### Večje spremembe - Prestrukturiranje repozitorija in profesionalna izboljšava
**Ta različica predstavlja obsežno prenovo strukture repozitorija in predstavitve vsebine.**

#### Dodano
- **Strukturiran učni okvir**: Vse strani dokumentacije zdaj vključujejo odseke Uvod, Cilji učenja in Rezultati učenja
- **Sistem navigacije**: Dodane povezave Prejšnji/Naslednji za lekcije po vsej dokumentaciji za vodeno učno napredovanje
- **Vodnik za študij**: Celovit study-guide.md z učnimi cilji, vajami in ocenjevalnimi materiali
- **Profesionalna predstavitev**: Odstranjeni vsi emotikoni za boljšo dostopnost in profesionalen videz
- **Izboljšana struktura vsebin**: Izboljšana organizacija in tok učnih gradiv

#### Spremenjeno
- **Format dokumentacije**: Standardizirana vsa dokumentacija z dosledno strukturo, osredotočeno na učenje
- **Tok navigacije**: Implementiran logičen napredek skozi vsa učna gradiva
- **Predstavitev vsebine**: Odstranjeni dekorativni elementi v korist jasnega, profesionalnega oblikovanja
- **Struktura povezav**: Posodobljene vse notranje povezave za podporo novemu sistemu navigacije

#### Izboljšano
- **Dostopnost**: Odstranjena odvisnost od emotikonov za boljšo združljivost s čitalniki zaslona
- **Profesionalni videz**: Čista, akademska predstavitev primerna za učenje v podjetjih
- **Učna izkušnja**: Strukturiran pristop z jasnimi cilji in rezultati za vsako lekcijo
- **Organizacija vsebin**: Boljši logični tok in povezave med sorodnimi temami

### [v1.0.0] - 2025-09-09

#### Prvotna izdaja - Celovit AZD učni repozitorij

#### Dodano
- **Osnovna struktura dokumentacije**
  - Celovita serija vodnikov za začetek
  - Celovita dokumentacija za razmestitev in zagotavljanje virov
  - Podrobni viri za odpravljanje težav in vodniki za razhroščevanje
  - Orodja in postopki za preverjanje pred razmestitvijo

- **Modul za začetek**
  - AZD osnove: Temeljni koncepti in terminologija
  - Vodnik za namestitev: Navodila za nastavitev, specifična za platformo
  - Vodnik za konfiguracijo: Nastavitev okolja in avtentikacija
  - Prvi projekt: Vadnica korak za korakom za praktično učenje

- **Modul za razmestitev in zagotavljanje virov**
  - Vodnik za razmestitev: Celovita dokumentacija delovnega toka
  - Vodnik za zagotavljanje virov: Infrastruktura kot koda s Bicep
  - Najboljše prakse za produkcijska razmestitev
  - Vzorci arhitekture z več storitvami

- **Modul za preverjanje pred razmestitvijo**
  - Načrtovanje kapacitet: Preverjanje razpoložljivosti Azure virov
  - Izbira SKU: Celovita navodila za raven storitev
  - Preverjanje pred poletom: Avtomatizirani preverjevalni skripti (PowerShell in Bash)
  - Orodja za oceno stroškov in načrtovanje proračuna

- **Modul za odpravljanje težav**
  - Pogoste težave: Pogosto srečane težave in rešitve
  - Vodnik za razhroščevanje: Sistematične metodologije odpravljanja težav
  - Napredne diagnostične tehnike in orodja
  - Spremljanje zmogljivosti in optimizacija

- **Viri in reference**
  - Preprost seznam ukazov: Hitri priročnik za osnovne ukaze
  - Slovar: Celovite definicije terminologije in okrajšav
  - Pogosta vprašanja: Podrobni odgovori na pogosta vprašanja
  - Zunanje povezave do virov in povezave s skupnostjo

- **Primeri in predloge**
  - Primer preproste spletne aplikacije
  - Predloga za razmestitev statične spletne strani
  - Konfiguracija aplikacije v kontejnerju
  - Vzorci integracije podatkovnih baz
  - Primeri arhitekture mikrostoritev
  - Implementacije brezstrežnih funkcij

#### Značilnosti
- **Podpora za več platform**: Vodniki za namestitev in konfiguracijo za Windows, macOS in Linux
- **Več ravni znanja**: Vsebina zasnovana za študente in profesionalne razvijalce
- **Praktični poudarek**: Praktični primeri in scenariji iz resničnega sveta
- **Celovito pokritje**: Od osnovnih konceptov do naprednih podjetniških vzorcev
- **Varnost najprej**: Najboljše varnostne prakse vgrajene povsod
- **Optimizacija stroškov**: Navodila za stroškovno učinkovite razmestitve in upravljanje virov

#### Kakovost dokumentacije
- **Podrobni primeri kode**: Praktični, preizkušeni primeri kode
- **Navodila korak za korakom**: Jasna, izvedljiva navodila
- **Celovito ravnanje z napakami**: Odpravljanje težav za pogoste napake
- **Vključevanje najboljših praks**: Industrijski standardi in priporočila
- **Združljivost različic**: Posodobljeno z najnovejšimi storitvami Azure in funkcijami azd

## Načrtovane prihodnje izboljšave

### Verzija 3.1.0 (Načrtovano)
#### Razširitev AI platforme
- **Podpora več modelov**: Vzorec integracije za Hugging Face, Azure Machine Learning in lastne modele
- **Okviri za AI agente**: Predloge za nameščanje LangChain, Semantic Kernel in AutoGen
- **Napredni RAG vzorci**: Možnosti vektornih baz podatkov zunaj Azure AI Search (Pinecone, Weaviate itd.)
- **Opazovanje AI**: Izboljšano spremljanje zmogljivosti modelov, uporabe žetonov in kakovosti odzivov

#### Izkušnja razvijalca
- **Razširitev za VS Code**: Integrirana izkušnja razvoja AZD + AI Foundry
- **Integracija GitHub Copilot**: Generiranje AZD predlog z asistenco AI
- **Interaktivne vadnice**: Praktične vaje programiranja z avtomatiziranim preverjanjem za AI scenarije
- **Video vsebine**: Dopolnilne video vadnice za vizualne učence, osredotočene na nameščanje AI

### Verzija 4.0.0 (Načrtovano)
#### Podjetniški AI vzorci
- **Okvir upravljanja**: Upravljanje AI modelov, skladnost in revizijske sledi
- **Večnajemniški AI**: Vzorci za strežbo več strank z ločenimi AI storitvami
- **Nameščanje Edge AI**: Integracija z Azure IoT Edge in instancami kontejnerjev
- **Hibridni oblak AI**: Vzorci za več-oblačno in hibridno nameščanje AI obremenitev

#### Napredne funkcije
- **Avtomatizacija AI cevovodov**: MLOps integracija z Azure Machine Learning cevovodi
- **Napredna varnost**: Zero-trust vzorci, zasebni končni točki in napredna zaščita pred grožnjami
- **Optimizacija zmogljivosti**: Napredne strategije prilagajanja in skaliranja za visoko prepustne AI aplikacije
- **Globalna distribucija**: Vzorci dostave vsebin in predpomnjenja na robu za AI aplikacije

### Verzija 3.0.0 (Načrtovano) - Nadomeščeno z trenutno izdajo
#### Predlagane dopolnitve - Zdaj izvedene v v3.0.0
- ✅ **Vsebine usmerjene v AI**: Celovita integracija Microsoft Foundry (Dokončano)
- ✅ **Interaktivne vadnice**: Praktična AI delavnica (Dokončano)
- ✅ **Modul za napredno varnost**: Vzorci varnosti specifični za AI (Dokončano)
- ✅ **Optimizacija zmogljivosti**: Strategije prilagajanja AI obremenitev (Dokončano)

### Verzija 2.1.0 (Načrtovano) - Delno izvedeno v v3.0.0
#### Manjše izboljšave - Nekatere dokončane v trenutni izdaji
- ✅ **Dodatni primeri**: Scenariji razmestitve osredotočeni na AI (Dokončano)
- ✅ **Razširjen FAQ**: Vprašanja in odpravljanje težav specifično za AI (Dokončano)
- **Integracija orodij**: Izboljšani vodniki za integracijo IDE in urejevalnikov
- ✅ **Razširitev spremljanja**: Vzorci spremljanja in opozarjanja specifični za AI (Dokončano)

#### Še načrtovano za prihodnjo izdajo
- **Dostopna dokumentacija za mobilne naprave**: Prilagodljiva zasnova za mobilno učenje
- **Dostop brez povezave**: Prenosni paketi dokumentacije
- **Izboljšana integracija IDE**: Razširitev za VS Code za delovne tokove AZD + AI
- **Nadzorna plošča skupnosti**: Meritve skupnosti v realnem času in sledenje prispevkom

## Prispevanje v dnevnik sprememb

### Poročanje o spremembah
Ko prispevate v ta repozitorij, poskrbite, da vnosi v dnevnik sprememb vključujejo:

1. **Številka različice**: V skladu z semantičnim verzioniranjem (major.minor.patch)
2. **Datum**: Datum izdaje ali posodobitve v formatu YYYY-MM-DD
3. **Kategorija**: Dodano, Spremenjeno, Zastarelo, Odstranjeno, Popravljeno, Varnost
4. **Jasen opis**: Jedrnat opis, kaj se je spremenilo
5. **Ocenitev vpliva**: Kako spremembe vplivajo na obstoječe uporabnike

### Kategorije sprememb

#### Dodano
- Nove funkcije, razdelki dokumentacije ali zmogljivosti
- Novi primeri, predloge ali učni viri
- Dodatna orodja, skripte ali pripomočki

#### Spremenjeno
- Spremembe obstoječe funkcionalnosti ali dokumentacije
- Posodobitve za izboljšanje jasnosti ali natančnosti
- Prestrukturiranje vsebine ali organizacije

#### Zastarelo
- Funkcije ali pristopi, ki se postopoma ukinjajo
- Razdelki dokumentacije, načrtovani za odstranitev
- Metode, ki imajo boljše alternative

#### Odstranjeno
- Funkcije, dokumentacija ali primeri, ki niso več relevantni
- Zastarale informacije ali pristopi označeni kot zastareli
- Podvojena ali konsolidirana vsebina

#### Popravljeno
- Popravki napak v dokumentaciji ali kodi
- Rešitev prijavljenih težav ali problemov
- Izboljšave natančnosti ali funkcionalnosti

#### Varnost
- Izboljšave ali popravki v zvezi z varnostjo
- Posodobitve najboljših varnostnih praks
- Reševanje varnostnih ranljivosti

### Smernice za semantično verzioniranje

#### Glavna različica (X.0.0)
- Prelomne spremembe, ki zahtevajo ukrep uporabnika
- Pomembno prestrukturiranje vsebine ali organizacije
- Spremembe, ki spreminjajo osnovni pristop ali metodologijo

#### Manjša različica (X.Y.0)
- Nove funkcije ali dodatki vsebine
- Izboljšave, ki ohranjajo združljivost z prejšnjimi različicami
- Dodatni primeri, orodja ali viri

#### Popravna različica (X.Y.Z)
- Popravljene napake in popravki
- Manjše izboljšave obstoječe vsebine
- Pojasnila in manjše izboljšave

## Povratne informacije skupnosti in predlogi

Aktivno spodbujamo povratne informacije skupnosti za izboljšanje tega učnega vira:

### Kako podati povratne informacije
- **GitHub Issues**: Prijavite težave ali predlagajte izboljšave (AI-specifična vprašanja so dobrodošla)
- **Discord razprave**: Delite ideje in sodelujte s skupnostjo Microsoft Foundry
- **Pull Requests**: Prispevajte neposredne izboljšave vsebine, zlasti AI predloge in vodnike
- **Microsoft Foundry Discord**: Sodelujte v kanalu #Azure za razprave o AZD + AI
- **Forumi skupnosti**: Sodelujte v širših razpravah razvijalcev za Azure

### Kategorije povratnih informacij
- **Natančnost AI vsebin**: Popravki informacij o integraciji AI storitev in nameščanju
- **Učna izkušnja**: Predlogi za izboljšan učni tok za AI razvijalce
- **Manjkajoče AI vsebine**: Zahteve po dodatnih AI predlogah, vzorcih ali primerih
- **Dostopnost**: Izboljšave za različne potrebe učenja
- **Integracija AI orodij**: Predlogi za boljšo integracijo delovnih tokov razvoja AI
- **Vzorci produkcijskega AI**: Zahteve po podjetniških vzorcih nameščanja AI

### Zaveza glede odziva
- **Odziv na težave**: V roku 48 ur za prijavljene probleme
- **Zahteve za funkcije**: Ocena v enem tednu
- **Prispevki skupnosti**: Pregled v enem tednu
- **Varnostne težave**: Prioriteta takoj z pospešenim odzivom

## Urnik vzdrževanja

### Redne posodobitve
- **Mesečni pregledi**: Natančnost vsebine in preverjanje povezav
- **Četrtletne posodobitve**: Večje dopolnitve vsebine in izboljšave
- **Polletni pregledi**: Celovito prestrukturiranje in izboljšave
- **Letne izdaje**: Večje posodobitve različic z znatnimi izboljšavami

### Spremljanje in zagotavljanje kakovosti
- **Avtomatizirano testiranje**: Redno preverjanje primerov kode in povezav
- **Vključevanje povratnih informacij skupnosti**: Redno vključevanje predlogov uporabnikov
- **Posodobitve tehnologije**: Usklajevanje z najnovejšimi storitvami Azure in izdajami azd
- **Revizije dostopnosti**: Redni pregledi načel vključujočega oblikovanja

## Politika podpore različic

### Podpora trenutne različice
- **Zadnja glavna različica**: Polna podpora z rednimi posodobitvami
- **Prejšnja glavna različica**: Varnostne posodobitve in kritični popravki za 12 mesecev
- **Zastarele različice**: Le podpora skupnosti, brez uradnih posodobitev

### Vodnik za migracijo
Ko so izdane glavne različice, zagotovimo:
- **Priročniki za migracijo**: Korak po koraku navodila za prehod
- **Opombe o združljivosti**: Podrobnosti o nezdružljivih spremembah
- **Podpora za orodja**: Skripte ali pripomočki za pomoč pri migraciji
- **Podpora skupnosti**: Posebni forumi za vprašanja o migraciji

---

**Navigacija**
- **Prejšnja lekcija**: [Učni vodnik](resources/study-guide.md)
- **Naslednja lekcija**: Vrnite se na [Glavni README](README.md)

**Ostanite obveščeni**: Spremljajte ta repozitorij za obvestila o novih izdajah in pomembnih posodobitvah učnih gradiv.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Za avtoritativni vir velja izvirni dokument v njegovem izvor­nem jeziku. Za ključne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazuma ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->