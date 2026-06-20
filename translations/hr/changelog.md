# Dnevnik promjena - AZD za početnike

## Uvod

Ovaj dnevnik promjena dokumentira sve značajne promjene, nadogradnje i poboljšanja u spremištu AZD za početnike. Pratimo principe semantičkog verzioniranja i održavamo ovaj zapis kako bismo korisnicima pomogli razumjeti što se promijenilo između verzija.

## Ciljevi učenja

Pregledom ovog dnevnika promjena, moći ćete:
- Ostanite informirani o novim značajkama i dodavanju sadržaja
- Razumjeti poboljšanja postojećih dokumenata
- Pratiti ispravke i korekcije kako bi se osigurala točnost
- Pratiti razvoj nastavnih materijala tijekom vremena

## Ishodi učenja

Nakon pregleda unosa u dnevnik promjena, moći ćete:
- Identificirati novi sadržaj i resurse dostupne za učenje
- Razumjeti koje su sekcije ažurirane ili poboljšane
- Planirati svoj put učenja na temelju najnovijih materijala
- Dati povratne informacije i prijedloge za buduća poboljšanja

## Povijest verzija

### [v3.22.0] - 2026-06-16

#### Popunjavanje praznina za početnike #2: Izrada predložaka, razvojni spremnici, Pulumi, Azure DevOps, Servisni principi i još mnogo toga
**Ova verzija zatvara preostale srednje praznine prikazane analizom azd-coverage: kako izraditi i objaviti vlastiti predložak, reproducibilna razvojna okruženja u spremnicima/Codespaces, pružatelj infrastrukture Pulumi, vodič kroz CI/CD u Azure DevOpsu, autentikacija servisnih principa, smjernice za odabir domaćina (AKS/Spring Apps), objašnjenja `azd restore` / `azd package`, rukovanje pogreškama ureza, te prakse timskih/dijeljenih okruženja.**

#### Dodano
- **🧱 Novi lekcija 4 poglavlja** `docs/chapter-04-infrastructure/custom-templates.md` — izrada vlastitog azd predloška: potrebna struktura (`azure.yaml`, `infra/`, `src/`), polje `metadata.template`, parametarizacija infrastrukture pomoću `uniqueString()` resursnog tokena i oznake `azd-env-name`, lokalno testiranje pomoću `azd init --template <local-path>`, objavljivanje na GitHubu i prijava u Awesome AZD galeriju
- **📦 Novi lekcija 1 poglavlja** `docs/chapter-01-foundation/dev-containers.md` — reproducibilna azd okruženja s Dev Containers i GitHub Codespaces: minimalni `.devcontainer/devcontainer.json` koristeći službenu `ghcr.io/azure/azure-dev/azd` značajku, jezično-specifične funkcije, `docker-in-docker` za domaćine spremnika i `azd auth login --use-device-code` za udaljeno prijavljivanje
- **🧩 Pulumi s azd** sekcija u `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, raspored Pulumi mapa, stogovi povezani s azd okruženjima, potrebni izlazi/označavanja te identičan tijek rada `azd up` / `azd down`
- **🎯 Smjernice za izbor domaćina** u `docs/chapter-04-infrastructure/provisioning.md` — usporedba za početnike između `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` i `springapp` s preporukama kada odabrati AKS ili Azure Spring Apps
- **🛠️ Vodič Azure DevOps CI/CD** u `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, servisna veza s federacijom identiteta opterećenja (OIDC), generirani `azure-dev.yml` i postavljanje varijabli skupina
- **🔑 Servisni principi (Uzorkom 4)** dodano u `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, ne-interaktivni `azd auth login` s klijentskim tajnim ključem naspram federiranih/OIDC vjerodajnica, kada koristiti i sigurno pohranjivanje vjerodajnica
- **🪝 Rukovanje pogreškama u urezima** podsekcija u `docs/chapter-04-infrastructure/deployment-guide.md` — izlazni kodovi i `set -e`, `continueOnError`, testiranje urezova izolirano s `azd hooks run`, OS-specifične ljuske i `--debug`
- **👥 Tim / dijeljena okruženja** sekcija u `docs/chapter-03-configuration/configuration.md` — što se čuva u `.azure/`, što ignorirati u git-u, okruženja po programeru, `azd env list`/`select` i pružanje vrijednosti okruženja u CI/CD
- **🧰 Objašnjenja `azd restore` i proširenog `azd package`** u `resources/cheat-sheet.md` — vraćanje ovisnosti i izgradnja artefakta spremnog za implementaciju bez implementacije

#### Promijenjeno
- **🧭 Tablica lekcija poglavlja 4** ažurirana da uključi novu lekciju "Izrada vlastitog predloška" (Lekcija 3)
- **🧭 Tablica lekcija poglavlja 1** ažurirana da uključi novu lekciju "Dev Containers & Codespaces" (Lekcija 5); navigacijske podnožja povezana između `bring-your-own-app.md` i `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Popunjavanje praznina za početnike: Praktična lekcija o multi-agentima, "Donesi svoju aplikaciju", Terraform i vodič za CI/CD
**Ova verzija zatvara najveće praznine za kompletan vodič za početnike dodavanjem dviju novih praktičnih lekcija (vodič za implementaciju multi-agenta i dodavanje azd-a postojećoj aplikaciji), uvod za početnike u urezima, sekciju Terraform s azd-om, detaljan GitHub Actions pipeline vodič, objašnjenje novih preglednih proširenja i eksplicitni kontrolni popis za provjeru implementacije.**

#### Dodano
- **🤝 Nova lekcija 5 poglavlja** `docs/chapter-05-multi-agent/multi-agent-basics.md` — potpuno praktični, implementabilni vodič za dva agenta (orkestra + specijalisti) koristeći stvarni predložak (`contoso-creative-writer`), uključujući kada koristiti multi-agenta, tijek rada `azd up`, razumijevanje implementiranih resursa, praćenje među agentima, prilagodbu i čišćenje
- **📦 Nova lekcija 1 poglavlja** `docs/chapter-01-foundation/bring-your-own-app.md` — kako dodati azd postojećem projektu s `azd init` ("koristi kod u trenutnom direktoriju"), razumijevanje `azure.yaml` i `infra/`, `azd infra generate`, detekcija hosta i implementacija s `azd up`
- **🌐 Terraform s azd** sekcija dodana u `docs/chapter-04-infrastructure/provisioning.md` — konfiguracija `infra.provider: terraform`, raspored `.tf` mapa, potrebni izlazi `AZURE_*` i označavanje `azd-env-name`, identičan tijek rada `azd up` / `azd down` (zatvara prazninu gdje je Terraform podrška bila najavljena, ali prikazan je samo Bicep)
- **⚙️ Detaljan GitHub Actions vodič** u `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitorija do automatiziranih implementacija: `azd pipeline config`, federirane OIDC vjerodajnice (bez pohranjenih zaporki), generirani `azure-dev.yml` i smjernice za tajne i varijable
- **🪝 Početnički uvod "Novi u urezima?"** u `docs/chapter-04-infrastructure/deployment-guide.md` — što je urez, tablica faza urezivanja, minimalni prvi urez i ručno pokretanje urezova s `azd hooks run`
- **✅ Kontrolni popis "Provjerite svoju implementaciju"** dodan u Korak 5 `docs/chapter-01-foundation/first-project.md` — test dima, provjera health-endpointa i eksplicitni kriteriji uspjeha
- **🧩 Objašnjenje za nova pregledna proširenja** `azure.ai.skills` i `azure.ai.connections` (što su i kada ih koristiti) u `docs/chapter-08-production/production-ai-practices.md`

#### Promijenjeno
- **🧭 Tablica lekcija poglavlja 5** ispravljena: `multi-agent-basics.md` je sada Lekcija 1 (jedina potpuno praktična lekcija), iskreno označeno da Lekcija 2 pripada poglavlju 6, a maloprodajni scenarij je arhitektonski nacrt, a ne jednim naredbom pokrenut predložak
- **🧭 Tablica lekcija poglavlja 1** sada uključuje novu lekciju "Donesi svoju aplikaciju" (Lekcija 4)
- **🔗 Navigacijski podnožji** ažuriran: `first-project.md` sada vodi naprijed do `bring-your-own-app.md`

#### Ispravljeno
- **🧱 Zatvorena praznina "najavljena ali nedostajuća" Terraform podrška** — tečaj je ranije spominjao Terraform podršku bez prikaza
- **🔀 Ispravljene obmanjujuće međulinke poglavlja 5** koje su implicirale postojanje pune implementacije multi-agenta, dok je prikazan samo arhitektonski nacrt

#### Datoteke ažurirane
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(novo)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(novo)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 osvježenje, potpune naredbe za životni ciklus agenta i Aspire rebrand
**Ova verzija potvrđuje tečaj protiv `azd` `1.25.6` (lipanj 2026) i ekstenzije `azure.ai.agents` `0.1.40-preview`, proširuje AI smjernice od "postavljanje agenta" do kompletnog životnog ciklusa agenta (testiranje → evaluacija → optimizacija → inspekcija → brisanje), uvodi nova pregledna proširenja `azure.ai.skills` i `azure.ai.connections` te bilježi promjenu imena proizvoda s ".NET Aspire" na "Aspire".**

#### Dodano
- **🔁 Potpuno pokrivanje životnog ciklusa agenta** za početnike i AI inženjere kroz dokumente:
  - `docs/chapter-01-foundation/azd-basics.md` — tablica životnog ciklusa (postavljanje → testiranje → mjerenje → poboljšanje → inspekcija → čišćenje) dodana u odjeljak Proširenja i AI naredbi
  - `docs/chapter-08-production/production-ai-practices.md` — nova sekcija "Upravljanje životnim ciklusom agenta" pokrivajući `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` i `delete --force`
  - `resources/cheat-sheet.md` — proširene AI Agent naredbe s `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` i `delete --force`
- **🧩 Nova pregledna proširenja** dokumentirana: dodana su `azure.ai.skills` (ponovno upotrebljive vještine agenta) i `azure.ai.connections` (Foundry veze) u tablicu proširenja i sažetak trikova
- **⏱️ Smjernice o vremenu odziva** — primjeri `azd ai agent invoke` sada navode ukupno kašnjenje i vrijeme do prvog bajta
- **📌 Baner verzije** u korijenskom README-u usmjeren prema korisnicima na `azd version` i `azd upgrade`

#### Promijenjeno
- **✅ Ažurirana baza za validaciju** s `azd 1.23.12` (ožujak 2026) na `azd 1.25.6` (lipanj 2026) u svim README datotekama poglavlja i dokumentima radionice
- **🤖 Napomena o ekstenziji poglavlja 2** ažurirana s `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Primjer validacije radionice** (`azd version` izlaz) ažuriran na `1.25.6`
- **🧭 README "Što je novo u azd danas"** osvježen za naglašavanje kompletnog životnog ciklusa agenta, novih AI proširenja i nedavnih poboljšanja kvalitete života (`azd init` idempotentnost, čišćenje zastarjelog tokena u `azd auth login`, prikaz prilikom prvog pokretanja `azd tool`)
- **📖 Kapitel 2 agents.md (Opcija 4)** sada usmjerava učenike na naredbe životnog ciklusa nakon implementacije umjesto zaustavljanja na `azd up`

#### Ispravljeno
- **🏷️ Imenovanje proizvoda** — dodana bilješka o promjeni imena Aspire (".NET Aspire" je sada samo "Aspire"); podrška azd-a za Aspire ostaje nepromijenjena
- **🔎 Validacija uživo** potvrđena putem Azure Developer CLI feeda: stabilna verzija CLI-a `1.25.6` (2026-06-12) i `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Datoteke ažurirane
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
#### Pojašnjenje za početnike, provjera postavljanja i konačno čišćenje AZD naredbi
**Ova verzija nastavlja s provjerom AZD 1.23 s fokusom na dokumentaciju za početnike: pojašnjava smjernice za autentifikaciju prvenstveno s AZD-om, dodaje skripte za lokalnu provjeru postavljanja, provjerava ključne naredbe prema aktivnom AZD CLI-u te uklanja posljednje zastarjele reference naredbi na izvornom engleskom izvan promjena.**

#### Dodano
- **🧪 Skripte za provjeru postavljanja za početnike** s `validate-setup.ps1` i `validate-setup.sh` kako bi korisnici mogli potvrditi potrebne alate prije početka 1. poglavlja
- **✅ Koraci za inicijalnu provjeru postavljanja** u glavnom README-u i README-u 1. poglavlja kako bi se nedostajući preduvjeti otkrili prije `azd up`

#### Promijenjeno
- **🔐 Smjernice za autentifikaciju za početnike** sada dosljedno tretiraju `azd auth login` kao primarni put za AZD workflow-e, dok se `az login` navodi kao opcijski osim ako se direktno ne koriste Azure CLI naredbe
- **📚 Tijek uvođenja u 1. poglavlju** sada usmjerava korisnike da potvrde svoje lokalno postavljanje prije instalacije, autentifikacije i prvih koraka implementacije
- **🛠️ Poruke validatora** sada jasno razdvajaju blokirajuće zahtjeve od opcijskih upozorenja Azure CLI-ja za put samo s AZD-om za početnike
- **📖 Dokumentacija o konfiguraciji, otklanjanju poteškoća i primjerima** sada razlikuje potrebnu AZD autentifikaciju i opcijsko prijavljivanje u Azure CLI gdje su prije oba prikazana bez konteksta

#### Ispravljeno
- **📋 Preostale reference naredbi na izvornom engleskom** ažurirane na trenutne AZD oblike, uključujući `azd config show` u prečac listi i `azd monitor --overview` gdje se mislilo na Azure Portal pregled
- **🧭 Izjave za početnike u 1. poglavlju** ublažene kako bi se izbjeglo preveliko obećanje zajamčenog ponašanja bez pogrešaka ili vraćanja za sve predloške i Azure resurse
- **🔎 Provjera uživo CLI-ja** potvrđena podrška za `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` i `azd down --force --purge`

#### Ažurirane datoteke
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

#### Validacija AZD 1.23.12, proširenje okruženja radionice i osvježenje AI modela
**Ova verzija provodi valjanost dokumentacije s `azd` verzijom `1.23.12`, ažurira zastarjele primjerke AZD naredbi, osvježava smjernice za AI modele prema trenutnim zadanim postavkama i proširuje upute za radionice izvan samo GitHub Codespaces kako bi podržala razvojne spremnike i lokalne klonove.**

#### Dodano
- **✅ Napomene o validaciji kroz ključna poglavlja i dokumentaciju radionice** kako bi učenici imali jasnu uvid u testiranu baznu verziju AZD CLI-ja koristeći novije ili starije verzije
- **⏱️ Smjernice za timeout implementacije** za dugotrajne implementacije AI aplikacija korištenjem `azd deploy --timeout 1800`
- **🔎 Koraci za inspekciju ekstenzija** s `azd extension show azure.ai.agents` u AI workflow dokumentima
- **🌐 Proširene upute za okruženje radionice** uključujući GitHub Codespaces, razvojne spremnike i lokalne klonove s MkDocs

#### Promijenjeno
- **📚 Uvodi u README-ima poglavlja** sada dosljedno bilježe validaciju prema `azd 1.23.12` u sekcijama temeljnih, konfiguracijskih, infrastrukturnih, višestrukih agenata, prije-implementacijskih, rješavanja problema i produkcijskih
- **🛠️ Reference AZD naredbi** ažurirane na trenutne oblike diljem dokumenata:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ili `azd env get-value(s)` ovisno o kontekstu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` gdje je bio namijenjen pregled Application Insightsa
- **🧪 Primjeri pregleda provisioniranja** pojednostavljeni na trenutačno podržanu uporabu kao što su `azd provision --preview` i `azd provision --preview -e production`
- **🧭 Tijek radionice** ažuriran tako da korisnici mogu završiti zadatke u Codespaces, razvojnom spremniku ili lokalnom klonu umjesto pretpostavke isključivo Codespaces
- **🔐 Smjernice za autentifikaciju** sada preferiraju `azd auth login` za AZD radne tokove, dok je `az login` postavljen kao opcijski prilikom direktnog korištenja Azure CLI naredbi

#### Ispravljeno
- **🪟 Windows instalacijske naredbe** normalizirane na trenutačni `winget` paket u vodiču za instalaciju
- **🐧 Upute za instalaciju na Linuxu** ispravljene kako bi se izbjegle nepodržane distro-specifične `azd` naredbe upravitelja paketa te upućuju na release assete gdje je prikladno
- **📦 AI primjeri modela** osvježeni s ranijih zadatih poput `gpt-35-turbo` i `text-embedding-ada-002` u primjerke poput `gpt-4.1-mini`, `gpt-4.1` i `text-embedding-3-large`
- **📋 Ispravci kod implementacije i dijagnostike** koriste trenutačne naredbe za okruženja i statuse u zapisima, skriptama i koracima za rješavanje problema
- **⚙️ Smjernice za GitHub Actions** ažurirane s `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Smjernice za MCP/Copilot suglasnost** ažurirane s `azd mcp consent` na `azd copilot consent list`

#### Poboljšano
- **🧠 Smjernice u AI poglavlju** sada bolje objašnjavaju osjetljivo ponašanje `azd ai` u preview modu, prijavu specifičnu za tenant, trenutačnu upotrebu ekstenzija i ažurirane preporuke za postavljanje modela
- **🧪 Upute za radionicu** sada koriste realističnije primjere verzija i jasniji jezik za postavljanje okruženja u hands-on laboratorijima
- **📈 Dokumentacija za produkciju i otklanjanje poteškoća** bolje su usklađene s trenutačnim primjerima nadzora, rezervnog modela i troškovnih razreda

#### Ažurirane datoteke
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

#### AZD AI CLI naredbe, validacija sadržaja i proširenje predložaka
**Ova verzija dodaje pokrivenost naredbi `azd ai`, `azd extension` i `azd mcp` u svim AI-povezanim poglavljima, ispravlja pokvarene veze i zastarjeli kod u agents.md, ažurira cheat sheet i temeljito prepravlja odjeljak Predložaka primjera s provjerenim opisima i novim Azure AI AZD predlošcima.**

#### Dodano
- **🤖 Pokrivenost AZD AI CLI-ja** u 7 datoteka (prije samo u 8. poglavlju):
  - `docs/chapter-01-foundation/azd-basics.md` — Novi odjeljak "Ekstenzije i AI naredbe" koji uvodi `azd extension`, `azd ai agent init` i `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcija 4: `azd ai agent init` s usporednom tablicom (predložak vs pristup manifestom)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Pododjeljci "AZD ekstenzije za Foundry" i "Implementacija s fokusom na agenata"
  - `docs/chapter-05-multi-agent/README.md` — Brzi početak sada prikazuje oba puta implementacije: predložak i manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Dio o implementaciji sada uključuje opciju `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Pododjeljak "AZD AI ekstenzijske naredbe za dijagnostiku"
  - `resources/cheat-sheet.md` — Novi odjeljak "AI i ekstenzijske naredbe" s `azd extension`, `azd ai agent init`, `azd mcp` i `azd infra generate`
- **📦 Novi AZD AI primjerni predlošci** u `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel i podrškom za glasovni chat
  - **azure-search-openai-demo-java** — Java RAG chat koristeći Langchain4J s mogućnostima implementacije na ACA/AKS
  - **contoso-creative-writer** — Višestruki agent za kreativno pisanje koristeći Azure AI Agent Service, Bing Grounding i Prompty
  - **serverless-chat-langchainjs** — Serverless RAG koristeći Azure Functions + LangChain.js + Cosmos DB s lokalnom podrškom za Ollama razvoj
  - **chat-with-your-data-solution-accelerator** — Enterprisni RAG akcelerator s administracijskim portalom, integracijom u Teams i opcijama PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Referentna aplikacija za organizaciju više agenata MCP s poslužiteljima u .NET, Python, Java i TypeScriptu
  - **azd-ai-starter** — Minimalni početni predložak infrastrukture Azure AI u Bicepu
  - **🔗 Link na izvrsnu AZD AI galeriju** — Referenca na [awesome-azd AI galeriju](https://azure.github.io/awesome-azd/?tags=ai) (više od 80 predložaka)

#### Ispravljeno
- **🔗 Navigacija u agents.md**: Prethodni/sljedeći linkovi sada odgovaraju redoslijedu lekcija u README-u 2. poglavlja (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Pokvarene veze u agents.md**: `production-ai-practices.md` ispravljeno u `../chapter-08-production/production-ai-practices.md` (3 instances)
- **📦 Zastarjeli kod u agents.md**: Zamijenjen `opencensus` s `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Nevažeći API u agents.md**: Pomaknut parametar `max_tokens` iz `create_agent()` u `create_run()` kao `max_completion_tokens`
- **🔢 Brojanje tokena u agents.md**: Zamijenjena gruba procjena `len//4` s preciznim `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Ispravljene usluge s "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (zadani host promijenjen u listopadu 2024.)
- **contoso-chat**: Opis ažuriran kako bi referirao Azure AI Foundry + Prompty, usklađujući se s pravim nazivom i tehnološkim slojem repozitorija

#### Uklonjeno
- **ai-document-processing**: Uklonjena referenca na nefunkcionalni predložak (repozitorij nije javno dostupan kao AZD predložak)

#### Poboljšano
- **📝 Vježbe u agents.md**: Vježba 1 sada prikazuje očekivani rezultat i korak `azd monitor`; Vježba 2 uključuje potpun kod registracije `FunctionTool`; Vježba 3 zamjenjuje nejasne upute konkretnih naredbi `prepdocs.py`
- **📚 Resursi u agents.md**: Ažurirane poveznice na aktualnu dokumentaciju Azure AI Agent Service i brzog početka
- **📋 Tablica sljedećih koraka u agents.md**: Dodan link na AI Workshop Lab za kompletnu pokrivenost poglavlja

#### Ažurirane datoteke
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05
#### Poboljšanje navigacije tečajem
**Ova verzija poboljšava navigaciju poglavljima u README.md pomoću unaprijeđenog formata tablice.**

#### Promijenjeno
- **Tablica karte tečaja**: Unaprijeđena s izravnim poveznicama na lekcije, procjenama trajanja i ocjenama složenosti
- **Čišćenje mapa**: Uklonjene suvišne stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Provjera poveznica**: Sve 21+ internetske poveznice u tablici karte tečaja su potvrđene

### [v3.16.0] - 2026-02-05

#### Ažuriranja naziva proizvoda
**Ova verzija ažurira reference proizvoda u skladu s trenutnim Microsoftovim brendiranjem.**

#### Promijenjeno
- **Microsoft Foundry → Microsoft Foundry**: Sve reference ažurirane u datotekama koje se ne prevode
- **Azure AI Agent Service → Foundry Agents**: Naziv usluge ažuriran radi usklađenosti s trenutnim brendiranjem

#### Ažurirane datoteke
- `README.md` - Glavna početna stranica tečaja
- `changelog.md` - Povijest verzija
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodič za AI agente
- `examples/README.md` - Dokumentacija primjera
- `workshop/README.md` - Početna stranica radionice
- `workshop/docs/index.md` - Indeks radionice
- `workshop/docs/instructions/*.md` - Sve datoteke s uputama za radionicu

---

### [v3.15.0] - 2026-02-05

#### Velika rekonstrukcija repozitorija: imenovanje mapa prema poglavljima
**Ova verzija restrukturira dokumentaciju u namjenske mape poglavlja radi jasnije navigacije.**

#### Promjena naziva mapa
Stare mape zamijenjene mapama označenim brojevima poglavlja:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Dodano novo: `docs/chapter-05-multi-agent/`

#### Migracije datoteka
| Datoteka | Iz | U |
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
| Sve datoteke pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Sve datoteke troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Dodano
- **📚 README datoteke poglavlja**: Kreiran README.md u svakoj mapi poglavlja s:
  - Ciljevima učenja i trajanjem
  - Tablica lekcija s opisima
  - Brze naredbe za početak
  - Navigacija prema ostalim poglavljima

#### Promijenjeno
- **🔗 Ažurirano svih internih poveznica**: 78+ staza ažurirano u svim dokumentacijskim datotekama
- **🗺️ Glavni README.md**: Ažurirana karta tečaja s novom strukturom poglavlja
- **📝 examples/README.md**: Ažurirane križne reference na mape poglavlja

#### Uklonjeno
- Stara struktura mapa (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturiranje repozitorija: navigacija po poglavljima
**Ova verzija dodaje README datoteke za navigaciju poglavljima (zastarjelo s v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novi vodič za AI agente
**Ova verzija dodaje sveobuhvatan vodič za implementaciju AI agenata pomoću Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Kompletan vodič koji pokriva:
  - Što su AI agenti i kako se razlikuju od chatbota
  - Tri predloška za brzi početak (Foundry Agents, Prompty, RAG)
  - Arhitektonski obrasci agenata (jedan agent, RAG, multi-agent)
  - Konfiguracija alata i prilagodbe
  - Praćenje i nadzor metrika
  - Troškovi i optimizacija
  - Uobičajeni problemi i njihovo rješavanje
  - Tri praktične vježbe s kriterijima uspjeha

#### Struktura sadržaja
- **Uvod**: Koncepti agenata za početnike
- **Brzi početak**: Implementacija agenata s `azd init --template get-started-with-ai-agents`
- **Arhitektonski obrasci**: Vizualni dijagrami obrazaca agenata
- **Konfiguracija**: Postavljanje alata i varijabli okoline
- **Nadzor**: Integracija s Application Insights
- **Vježbe**: Postepeno praktično učenje (20-45 minuta po vježbi)

---

### [v3.12.0] - 2026-02-05

#### Ažuriranje razvojne okoline DevContainer
**Ova verzija ažurira konfiguraciju razvojne okoline s modernim alatima i boljim zadanim postavkama za AZD iskustvo učenja.**

#### Promijenjeno
- **🐳 Osnovna slika**: Ažurirano s `python:3.12-bullseye` na `python:3.12-bookworm` (najnoviji stabilni Debian)
- **📛 Naziv kontejnera**: Preimenovan s "Python 3" u "AZD za početnike" radi jasnoće

#### Dodano
- **🔧 Nove značajke Dev Containera**:
  - `azure-cli` s uključenom podrškom za Bicep
  - `node:20` (LTS verzija za AZD predloške)
  - `github-cli` za upravljanje predlošcima
  - `docker-in-docker` za implementaciju aplikacija u kontejnerima

- **🔌 Prosljeđivanje portova**: Predkonfigurirani portovi za uobičajeni razvoj:
  - 8000 (pregled MkDocs)
  - 3000 (web aplikacije)
  - 5000 (Python Flask)
  - 8080 (API-jevi)

- **🧩 Nove VS Code ekstenzije**:
  - `ms-python.vscode-pylance` - Poboljšani Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podrška za Azure Functions
  - `ms-azuretools.vscode-docker` - Podrška za Docker
  - `ms-azuretools.vscode-bicep` - Podrška za Bicep jezik
  - `ms-azure-devtools.azure-resource-groups` - Upravljanje Azure resursima
  - `yzhang.markdown-all-in-one` - Uređivanje Markdowna
  - `DavidAnson.vscode-markdownlint` - Lintiranje Markdowna
  - `bierner.markdown-mermaid` - Podrška za Mermaid dijagrame
  - `redhat.vscode-yaml` - Podrška za YAML (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Git-a
  - `mhutchie.git-graph` - Povijest Git promjena

- **⚙️ VS Code postavke**: Dodane zadane postavke za Python interpretator, formatiranje pri spremanju i uklanjanje praznina

- **📦 Ažuriran requirements-dev.txt**:
  - Dodan MkDocs minify plugin
  - Dodan pre-commit za kvalitetu koda
  - Dodani Azure SDK paketi (azure-identity, azure-mgmt-resource)

#### Ispravljeno
- **Naredba nakon stvaranja**: Provjera instalacije AZD i Azure CLI prilikom pokretanja kontejnera

---

### [v3.11.0] - 2026-02-05

#### Prilagođeni README za početnike
**Ova verzija značajno poboljšava README.md za pristupačnost početnicima i dodaje ključne resurse za AI developere.**

#### Dodano
- **🆚 Usporedba Azure CLI i AZD**: Jasno objašnjenje kada koristiti koji alat s praktičnim primjerima
- **🌟 Sjajne poveznice za AZD**: Izravni linkovi na galeriju predložaka i resurse za doprinos:
  - [Sjajna AZD galerija](https://azure.github.io/awesome-azd/) - 200+ predložaka spremnih za implementaciju
  - [Predloži predložak](https://github.com/Azure/awesome-azd/issues) - doprinos zajednice
- **🎯 Vodič za brzi početak**: Pojednostavljeni odjeljak u 3 koraka (Instaliraj → Prijavi se → Implementiraj)
- **📊 Tablica navigacije prema iskustvu**: Jasne preporuke gdje započeti na temelju iskustva developera

#### Promijenjeno
- **Struktura README-a**: Preuređena za postupno otkrivanje ključnih informacija
- **Uvodni dio**: Prepisan za objašnjenje "Čarolije `azd up`" za potpune početnike
- **Uklonjen dvostruki sadržaj**: Izbačen duplicirani odjeljak za rješavanje problema
- **Ispravak naredbi za rješavanje problema**: Referenca `azd logs` zamijenjena valjanim `azd monitor --logs`

#### Ispravljeno
- **🔐 Autentikacijske naredbe**: Dodani `azd auth login` i `azd auth logout` u cheat-sheet.md
- **Nevažeće reference naredbi**: Uklonjeni preostali `azd logs` iz odjeljka za rješavanje problema u README-u

#### Napomene
- **Opseg**: Promjene u glavnom README.md i resources/cheat-sheet.md
- **Ciljana publika**: Poboljšanja usmjerena posebno na developere koji tek počinju s AZD

---

### [v3.10.0] - 2026-02-05

#### Ažuriranje ispravnosti naredbi Azure Developer CLI
**Ova verzija ispravlja nepostojeće AZD naredbe u dokumentaciji, osiguravajući da svi kodni primjeri koriste točnu sintaksu Azure Developer CLI-ja.**

#### Ispravljeno
- **🔧 Uklonjene nepostojeće AZD naredbe**: Sveobuhvatni pregled i ispravak nevažećih naredbi:
  - `azd logs` (ne postoji) → zamijenjeno s `azd monitor --logs` ili Azure CLI alternativama
  - `azd service` podnaredbe (ne postoje) → zamijenjeno s `azd show` i Azure CLI
  - `azd infra import/export/validate` (ne postoje) → uklonjeno ili zamijenjeno validnim alternativama
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` zastavice (ne postoje) → uklonjeno
  - `azd provision --what-if/--rollback` zastavice (ne postoje) → ažurirano na korištenje `--preview`
  - `azd config validate` (ne postoji) → zamijenjeno s `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne postoje) → uklonjeno

- **📚 Ažurirane datoteke s ispravcima naredbi**:
  - `resources/cheat-sheet.md`: Velika revizija referenci naredbi
  - `docs/deployment/deployment-guide.md`: Ispravljene strategije rollbacka i implementacije
  - `docs/troubleshooting/debugging.md`: Ispravljeni dijelovi analize logova
  - `docs/troubleshooting/common-issues.md`: Ažurirane naredbe za rješavanje problema
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljen AZD debugging odjeljak
  - `docs/getting-started/azd-basics.md`: Ispravljene naredbe za nadzor
  - `docs/getting-started/first-project.md`: Ažurirani primjeri nadzora i debuggiranja
  - `docs/getting-started/installation.md`: Ispravljeni primjeri za pomoć i verziju
  - `docs/pre-deployment/application-insights.md`: Ispravljene naredbe za pregled logova
  - `docs/pre-deployment/coordination-patterns.md`: Ispravljene naredbe za debugging agenata

- **📝 Ažurirana referenca verzije**:
  - `docs/getting-started/installation.md`: Zamijenjena fiksna verzija `1.5.0` s generičkom `1.x.x` uz poveznicu na izdanja

#### Promijenjeno
- **Strategije rollbacka**: Dokumentacija ažurirana da koristi rollback zasnovan na Gitu (AZD nema ugrađeni rollback)
- **Pregled logova**: Zamjena referenci `azd logs` s `azd monitor --logs`, `azd monitor --live` i Azure CLI naredbama
- **Odjeljak o performansama**: Uklonjene nepostojeće zastavice za paralelnu/incrementalnu implementaciju, pružene valjane alternative

#### Tehnički detalji
- **Važeće AZD naredbe**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Važeće zastavice za azd monitor**: `--live`, `--logs`, `--overview`
- **Uklonjene značajke**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Napomene
- **Verifikacija**: Naredbe potvrđene prema Azure Developer CLI verziji v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Završetak radionice i poboljšanje kvalitete dokumentacije
**Ova verzija dovršava interaktivne module radionice, popravlja sve pokvarene poveznice u dokumentaciji i poboljšava ukupnu kvalitetu sadržaja za AI developere koji koriste Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Novi dokument s uputama za doprinos koji sadrži:
  - Jasne upute za prijavu problema i predlaganje promjena
  - Standarde za dokumentaciju novog sadržaja
  - Smjernice za primjere koda i konvencije poruka za commit
  - Informacije o angažmanu zajednice

#### Završeno
- **🎯 Radionica Modul 7 (Zaključenje)**: Potpuno dovršen modul za zaključenje s:
  - Sveobuhvatnim sažetkom postignuća radionice
  - Sekcijom ključnih usvojenih koncepata koja pokriva AZD, predloške i Microsoft Foundry
  - Preporukama za nastavak učenja
  - Izazovima radionice s ocjenama težine
  - Povratnim informacijama zajednice i poveznicama za podršku

- **📚 Radionica Modul 3 (Rasčlanjivanje)**: Ažurirani ciljevi učenja s:
  - Uputama za aktivaciju GitHub Copilot s MCP poslužiteljima
  - Razumijevanjem strukture mapa AZD predložaka
  - Obrasci organizacije infrastrukture kao koda (Bicep)
  - Uputama za praktičnu vježbu

- **🔧 Radionica Modul 6 (Rasplet)**: Završeno s:
  - Ciljevima čišćenja resursa i upravljanja troškovima
  - Korištenjem `azd down` za sigurno uklanjanje infrastrukture
  - Uputama za oporavak kognitivnih usluga koje su mekano izbrisane
  - Bonus pitanjima za istraživanje GitHub Copilota i Azure Portala

#### Ispravljeno
- **🔗 Popravci neispravnih poveznica**: Riješeno preko 15 neispravnih internih poveznica u dokumentaciji:
  - `docs/ai-foundry/ai-model-deployment.md`: Ispravljeni putovi do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljeni putovi ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamijenjen nepostojeći cicd-integration.md s deployment-guide.md
  - `examples/retail-scenario.md`: Ispravljeni putovi FAQ i vodiča za rješavanje problema
  - `examples/container-app/microservices/README.md`: Ispravljeni putovi do kućne stranice te vodiča za implementaciju
  - `resources/faq.md` i `resources/glossary.md`: Ažurirane reference na AI poglavlje
  - `course-outline.md`: Ispravljene reference na vodič instruktora i AI radionicu

- **📅 Banner statusa radionice**: Ažuriran s "Under Construction" na aktivni status radionice s datumom veljača 2026.

- **🔗 Navigacija radionice**: Ispravljene neispravne navigacijske poveznice u README.md radionice koje su upućivale na nepostojeću mapu lab-1-azd-basics

#### Promijenjeno
- **Prezentacija radionice**: Uklonjena obavijest "under construction", radionica je sada kompletna i spremna za uporabu
- **Konzistentnost navigacije**: Osigurana ispravna međumodularna navigacija svih modula radionice
- **Reference na putove učenja**: Ažurirane međureferencije poglavlja na ispravne microsoft-foundry putove

#### Potvrđeno
- ✅ Sve engleske markdown datoteke imaju valjane interne veze
- ✅ Moduli radionice 0-7 su završeni s ciljevima učenja
- ✅ Navigacija između poglavlja i modula funkcionira ispravno
- ✅ Sadržaj je prikladan za AI developere koji koriste Microsoft AZD
- ✅ Održan je jezik i struktura prikladna za početnike
- ✅ CONTRIBUTING.md daje jasne upute za suradnike u zajednici

#### Tehnička implementacija
- **Provjera poveznica**: Automatizirani PowerShell skript provjerio sve .md interne poveznice
- **Revizija sadržaja**: Ručni pregled potpune radionice i prikladnosti za početnike
- **Sustav navigacije**: Dosljedni obrasci navigacije kroz poglavlja i module

#### Napomene
- **Opseg**: Promjene su primijenjene samo na englesku dokumentaciju
- **Prijevodi**: Mape za prijevod nisu ažurirane u ovoj verziji (automatizirani prijevod bit će sinkroniziran kasnije)
- **Trajanje radionice**: Cijela radionica sada pruža 3-4 sata praktičnog učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: Nadgledanje, sigurnost i obrasci za više agenata
**Ova verzija dodaje sveobuhvatne lekcije vrhunske kvalitete o integraciji Application Insights, obrascima autentifikacije i koordinaciji više agenata za proizvodne implementacije.**

#### Dodano
- **📊 Lekcija integracije Application Insights**: u `docs/pre-deployment/application-insights.md`:
  - AZD-orijentirana implementacija s automatskom provizijom
  - Potpuni Bicep predlošci za Application Insights + Log Analytics
  - Radne Python aplikacije s prilagođenom telemetrijom (1200+ linija)
  - Obrasci nadgledanja AI/LLM (praćenje tokena/troškova Microsoft Foundry modela)
  - 6 Mermaid dijagrama (arhitektura, distribuirano praćenje, tok telemetrije)
  - 3 praktične vježbe (alerti, nadzorne ploče, AI nadzor)
  - Primjeri Kusto upita i strategije optimizacije troškova
  - Streaming metrika uživo i debugiranje u stvarnom vremenu
  - Vrijeme učenja 40-50 minuta s proizvodnim obrascima

- **🔐 Lekcija o obrascima autentifikacije i sigurnosti**: u `docs/getting-started/authsecurity.md`:
  - 3 obrasca autentifikacije (connection stringovi, Key Vault, upravljani identitet)
  - Potpuni infrastrukturni Bicep predlošci za sigurne implementacije
  - Node.js aplikacijski kod s Azure SDK integracijom
  - 3 cjelovite vježbe (omogući upravljani identitet, korisnički dodijeljeni identitet, rotaciju Key Vaulta)
  - Sigurnosne najbolje prakse i RBAC konfiguracije
  - Vodič za rješavanje problema i analiza troškova
  - Proizvodni obrasci autentifikacije bez lozinki

- **🤖 Lekcija o obrascima koordinacije više agenata**: u `docs/pre-deployment/coordination-patterns.md`:
  - 5 obrazaca koordinacije (sekvencijalno, paralelno, hijerarhijsko, događajno, konsenzus)
  - Potpuna implementacija orkestratora (Python/Flask, 1500+ linija)
  - 3 specijalizirane implementacije agenata (Istraživač, Pisac, Urednik)
  - Integracija Service Bus-a za redove poruka
  - Upravljanje stanjem u Cosmos DB za distribuirane sustave
  - 6 Mermaid dijagrama koji prikazuju interakcije agenata
  - 3 napredne vježbe (upravljanje vremenskim ograničenjima, logika ponavljanja, circuit breaker)
  - Razrada troškova (240-565 USD/mjesečno) uz strategije optimizacije
  - Integracija Application Insights za nadgledanje

#### Poboljšano
- **Poglavlje prije implementacije**: Sada uključuje sveobuhvatne obrasce nadgledanja i koordinacije
- **Poglavlje za početak**: Nadograđeno profesionalnim obrascima autentifikacije
- **Proizvodna spremnost**: Potpuno pokrivanje od sigurnosti do promatranja
- **Plan tečaja**: Ažuriran s novim lekcijama u poglavljima 3 i 6

#### Promijenjeno
- **Napredak u učenju**: Bolja integracija sigurnosti i nadgledanja kroz tečaj
- **Kvaliteta dokumentacije**: Dosljedni standardi vrhunske kvalitete (95-97%) u novim lekcijama
- **Proizvodni obrasci**: Potpuno od kraja do kraja pokrivanje za enterprise implementacije

#### Poboljšano
- **Iskustvo developera**: Jasan put od razvoja do nadzora u produkciji
- **Sigurnosni standardi**: Profesionalni obrasci za autentifikaciju i upravljanje tajnama
- **Promatranje**: Potpuna integracija Application Insights s AZD-om
- **AI opterećenja**: Specijalizirano nadgledanje Microsoft Foundry modela i višestrukih agenata

#### Potvrđeno
- ✅ Sve lekcije uključuju potpun radni kod (ne isječke)
- ✅ Mermaid dijagrami za vizualno učenje (ukupno 19 u 3 lekcije)
- ✅ Praktične vježbe s koracima za provjeru (ukupno 9)
- ✅ Proizvodni Bicep predlošci moguće za implementaciju putem `azd up`
- ✅ Analiza troškova i strategije optimizacije
- ✅ Vodiči za rješavanje problema i najbolje prakse
- ✅ Provjere znanja s naredbama za provjeru

#### Rezultati ocjene dokumentacije
- **docs/pre-deployment/application-insights.md**: - Sveobuhvatni vodič za nadgledanje
- **docs/getting-started/authsecurity.md**: - Profesionalni sigurnosni obrasci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne arhitekture za više agenata
- **Ukupni novi sadržaj**: - Dosljedni standardi visoke kvalitete

#### Tehnička implementacija
- **Application Insights**: Log Analytics + prilagođena telemetrija + distribuirano praćenje
- **Autentifikacija**: Upravljani identitet + Key Vault + RBAC obrasci
- **Više agenata**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Nadzor**: Streaming metrika uživo + Kusto upiti + alerti + nadzorne ploče
- **Upravljanje troškovima**: Strategije uzorkovanja, pravila zadržavanja, kontrola proračuna

### [v3.7.0] - 2025-11-19

#### Poboljšanja kvalitete dokumentacije i novi primjer Microsoft Foundry Models
**Ova verzija poboljšava kvalitetu dokumentacije diljem repozitorija i dodaje potpun primjer implementacije Microsoft Foundry Models s chat sučeljem gpt-4.1.**

#### Dodano
- **🤖 Primjer chata Microsoft Foundry Models**: Potpuna implementacija gpt-4.1 u `examples/azure-openai-chat/`:
  - Potpuna infrastruktura Microsoft Foundry Models (implementacija gpt-4.1 modela)
  - Python sučelje naredbenog retka za chat s poviješću razgovora
  - Integracija Key Vaulta za sigurno spremanje API ključeva
  - Praćenje upotrebe tokena i procjena troškova
  - Ograničavanje brzine i upravljanje pogreškama
  - Sveobuhvatni README s vodičem implementacije od 35-45 minuta
  - 11 datoteka spremnih za produkciju (Bicep predlošci, Python aplikacija, konfiguracija)
- **📚 Vježbe za dokumentaciju**: Dodane praktične vježbe u vodič konfiguracije:
  - Vježba 1: Više okruženja konfiguracija (15 minuta)
  - Vježba 2: Upravljanje tajnama (10 minuta)
  - Jasni kriteriji uspjeha i koraci za provjeru
- **✅ Verifikacija implementacije**: Dodan odjeljak verifikacije u vodič za implementaciju:
  - Postupci provjere zdravlja
  - Kontrolna lista kriterija uspjeha
  - Očekivani rezultati za sve naredbe implementacije
  - Brz pregled rješavanja problema

#### Poboljšano
- **examples/README.md**: Ažuriran na A razinu kvalitete (93%):
  - Dodan azure-openai-chat u sve relevantne dijelove
  - Ažuriran broj lokalnih primjera s 3 na 4
  - Dodan u tablicu AI primjera aplikacija
  - Integriran u Brzi početak za srednje korisnike
  - Dodan u odjeljak Microsoft Foundry Templates
  - Ažurirana matrica usporedbe i dijelovi pronalaženja tehnologija
- **Kvaliteta dokumentacije**: Poboljšanje s B+ (87%) na A- (92%) u mapi docs:
  - Dodani očekivani rezultati ključnih naredbi
  - Uključeni koraci provjere za promjene konfiguracije
  - Poboljšano praktično učenje s vježbama

#### Promijenjeno
- **Napredak u učenju**: Bolja integracija AI primjera za srednje korisnike
- **Struktura dokumentacije**: Više korisnih vježbi s jasnim rezultatima
- **Proces verifikacije**: Dodani eksplicitni kriteriji uspjeha u ključnim tijekovima rada

#### Poboljšano
- **Iskustvo developera**: Implementacija Microsoft Foundry Models sada traje 35-45 minuta (naspram 60-90 za složenije alternative)
- **Transparentnost troškova**: Jasne procjene troškova (50-200 USD/mjesečno) za Microsoft Foundry Models primjer
- **Put učenja**: AI developeri imaju jasan početak s azure-openai-chat
- **Standardi dokumentacije**: Dosljedni očekivani rezultati i koraci verifikacije

#### Potvrđeno
- ✅ Microsoft Foundry Models primjer potpuno funkcionalan s `azd up`
- ✅ Sve 11 implementacijskih datoteka sintaktički ispravne
- ✅ Upute u README-u odgovaraju stvarnom iskustvu implementacije
- ✅ Ažurirane poveznice u dokumentaciji na više od 8 mjesta
- ✅ Indeks primjera točno prikazuje 4 lokalna primjera
- ✅ Nema dupliciranih vanjskih poveznica u tablicama
- ✅ Sve reference u navigaciji ispravne

#### Tehnička implementacija
- **Arhitektura Microsoft Foundry Models**: gpt-4.1 + Key Vault + obrazac Container Apps
- **Sigurnost**: Spremno za upravljani identitet, tajne u Key Vaultu
- **Nadzor**: Integracija Application Insights
- **Upravljanje troškovima**: Praćenje tokena i optimizacija uporabe
- **Implementacija**: Jedna naredba `azd up` za potpun setup

### [v3.6.0] - 2025-11-19

#### Veliko ažuriranje: Primjeri implementacije Container aplikacija
**Ova verzija uvodi sveobuhvatne, produkcijski spremne primjere implementacije kontejneriziranih aplikacija koristeći Azure Developer CLI (AZD), s potpunom dokumentacijom i integracijom u put učenja.**

#### Dodano
- **🚀 Primjeri Container aplikacija**: Novi lokalni primjeri u `examples/container-app/`:
  - [Glavni vodič](examples/container-app/README.md): Potpuni pregled kontejneriziranih implementacija, brzo pokretanje, produkcija i napredni obrasci
  - [Jednostavan Flask API](../../examples/container-app/simple-flask-api): REST API za početnike s scale-to-zero, health probe, nadzorom i rješavanjem problema
  - [Arhitektura mikroservisa](../../examples/container-app/microservices): Produkcijski spremna multi-servisna implementacija (API Gateway, Product, Order, User, Notification), asinkrona poruka, Service Bus, Cosmos DB, Azure SQL, distribuirano praćenje, blue-green/canary implementacija
- **Najbolje prakse**: Sigurnost, nadzor, optimizacija troškova i smjernice za CI/CD za kontejnerizirane radne opterećenja
- **Primjeri koda**: Potpuni `azure.yaml`, Bicep predlošci i višestruke implementacije servisa (Python, Node.js, C#, Go)
- **Testiranje i rješavanje problema**: Scenariji krajnjeg do kraja, naredbe za nadzor, smjernice za rješavanje problema

#### Promijenjeno
- **README.md**: Ažuriran za predstavljanje i povezivanje novih primjera container app pod "Lokalni Primjeri - Container aplikacije"
- **examples/README.md**: Ažuriran za isticanje primjera container app, dodavanje unosa u matricu usporedbe te ažuriranje tehnoloških/arhitektonskih referenci
- **Plan tečaja i vodič za učenje**: Ažurirani za uključivanje novih primjera container app i obrazaca implementacije u relevantna poglavlja

#### Potvrđeno
- ✅ Svi novi primjeri mogu se implementirati s `azd up` i slijede najbolje prakse
- ✅ Ažurirane međuveze u dokumentaciji i navigaciji
- ✅ Primjeri pokrivaju scenarije od početničkih do naprednih, uključujući produkcijske mikroservise

#### Napomene
- **Opseg**: Samo engleska dokumentacija i primjeri
- **Sljedeći koraci**: Proširenje s dodatnim naprednim obrascima za kontejnere i automatizacijom CI/CD u budućim izdanjima

### [v3.5.0] - 2025-11-19

#### Rebrendiranje proizvoda: Microsoft Foundry
**Ova verzija provodi sveobuhvatnu promjenu imena proizvoda iz "Microsoft Foundry" u "Microsoft Foundry" kroz cijelu englesku dokumentaciju, reflektirajući službeno rebrendiranje Microsofta.**

#### Promijenjeno
- **🔄 Ažuriranje imena proizvoda**: Potpuno rebrendiranje s "Microsoft Foundry" na "Microsoft Foundry"
  - Ažurirane sve reference u engleskoj dokumentaciji u mapi `docs/`
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Ukupno: 23 ažuriranja unutar 7 datoteka dokumentacije

- **📁 Promjene u strukturi mapa**:
  - `docs/ai-foundry/` preimenovan u `docs/microsoft-foundry/`
  - Sve međureferencije ažurirane kako bi odražavale novu strukturu mapa
  - Navigacijski linkovi provjereni kroz svu dokumentaciju

- **📄 Preimenovanja datoteka**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Svi unutarnji linkovi ažurirani da referiraju novi naziv datoteke

#### Ažurirane datoteke
- **Dokumentacija poglavlja** (7 datoteka):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ažuriranja navigacijskih linkova
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ažuriranja naziva proizvoda
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Već koristi Microsoft Foundry (iz prethodnih ažuriranja)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 ažuriranja (pregled, povratne informacije zajednice, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 ažuriranja međureferencijskih linkova
  - `docs/getting-started/first-project.md` - 2 ažuriranja navigacijskih linkova poglavlja
  - `docs/getting-started/installation.md` - 2 ažuriranja linkova na sljedeća poglavlja
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 ažuriranja (navigacija, Discord zajednica)
  - `docs/troubleshooting/common-issues.md` - 1 ažuriranje navigacijskog linka
  - `docs/troubleshooting/debugging.md` - 1 ažuriranje navigacijskog linka

- **Datoteke strukture tečaja** (2 datoteke):
  - `README.md` - 17 ažuriranja (pregled tečaja, naslovi poglavlja, dio predložaka, uvidi zajednice)
  - `course-outline.md` - 14 ažuriranja (pregled, ciljevi učenja, resursi poglavlja)

#### Potvrđeno
- ✅ Nema preostalih referenci puta mape "ai-foundry" u engleskoj dokumentaciji
- ✅ Nema preostalih referenci naziva proizvoda "Microsoft Foundry" u engleskoj dokumentaciji
- ✅ Svi navigacijski linkovi funkcionalni s novom strukturom mapa
- ✅ Preimenovanja datoteka i mapa uspješno završena
- ✅ Validirane međureferencije između poglavlja

#### Napomene
- **Opseg**: Promjene primijenjene samo na englesku dokumentaciju u mapi `docs/`
- **Prijevodi**: Mape za prijevode (`translations/`) nisu ažurirane u ovoj verziji
- **Radionica**: Materijali radionice (`workshop/`) nisu ažurirani u ovoj verziji
- **Primjeri**: Primjer datoteka mogu i dalje sadržavati stare nazive (riješit će se u budućim izdanjima)
- **Vanjski linkovi**: URL-ovi i GitHub repozitoriji nisu mijenjani

#### Vodič za migraciju za suradnike
Ako imate lokalne grane ili dokumentaciju koja referira staru strukturu:
1. Ažurirajte reference mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ažurirajte reference datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamijenite naziv proizvoda: "Microsoft Foundry" → "Microsoft Foundry"
4. Provjerite da svi unutarnji linkovi u dokumentaciji i dalje funkcioniraju

---

### [v3.4.0] - 2025-10-24

#### Poboljšanja pregleda infrastrukture i validacije
**Ova verzija uvodi opsežnu podršku za novu preview značajku Azure Developer CLI-ja te poboljšava korisničko iskustvo radionice.**

#### Dodano
- **🧪 Dokumentacija značajke azd provision --preview**: Potpuno pokrivanje nove mogućnosti pregleda infrastrukture
  - Referenca naredbi i primjeri korištenja u cheat sheetu
  - Detaljna integracija u vodiču za provisioning s primjerima i pogodnostima
  - Integracija pre-flight provjera za sigurniju validaciju prije implementacije
  - Ažuriranja vodiča za početak rada s praksama sigurnog puštanja u rad
- **🚧 Banner statusa radionice**: Profesionalni HTML banner koji prikazuje status razvoja radionice
  - Dizajn s gradijentima i indikatorima u izgradnji za jasnu komunikaciju korisniku
  - Zapis posljednje izmjene radi transparentnosti
  - Responsivan dizajn prilagođen svim uređajima

#### Poboljšano
- **Sigurnost infrastrukture**: Pregledna funkcionalnost integrirana kroz dokumentaciju puštanja u rad
- **Validacija prije puštanja**: Automatizirani skripti sada uključuju testiranje pregleda infrastrukture
- **Radni tijek razvoja**: Nove sekvence naredbi uključuju pregled kao najbolju praksu
- **Iskustvo radionice**: Jasna očekivanja postavljena korisnicima o statusu sadržaja

#### Promijenjeno
- **Najbolje prakse puštanja u rad**: Workflow fokusiran na pregled kao prvi korak sada je preporučeni pristup
- **Tok dokumentacije**: Validacija infrastrukture pomaknuta ranije u proces učenja
- **Prezentacija radionice**: Profesionalna komunikacija statusa s jasnim vremenom razvoja

#### Poboljšano
- **Pristup usmjeren na sigurnost**: Infrastrukturne promjene mogu se validirati prije stvarne implementacije
- **Suradnja u timu**: Rezultate pregleda moguće je podijeliti radi pregleda i odobrenja
- **Svijest o troškovima**: Bolje razumijevanje troškova resursa prije provisioning-a
- **Smanjenje rizika**: Manje neuspješnih implementacija zahvaljujući rana validacija

#### Tehnička implementacija
- **Integracija u više dokumenata**: Pregled značajke dokumentiran u 4 ključne datoteke
- **Musteri naredbi**: Konzistentna sintaksa i primjeri kroz dokumentaciju
- **Integracija najboljih praksi**: Pregled uključen u validation workflow i skripte
- **Vizualni indikatori**: Jasne oznake NOVE značajke radi bolje uočljivosti

#### Infrastruktura radionice
- **Komunikacija statusa**: Profesionalni HTML banner s gradijentnim stilom
- **Korisničko iskustvo**: Jasna informacija o statusu razvoja sprječava zabunu
- **Profesionalna prezentacija**: Održava kredibilitet repozitorija uz postavljanje realnih očekivanja
- **Transparentnost vremenskog okvira**: Označeno zadnje ažuriranje listopada 2025. radi odgovornosti

### [v3.3.0] - 2025-09-24

#### Prošireni materijali radionice i interaktivno učenje
**Ova verzija uvodi omfattne materijale za radionicu s preglednim vodičima u pregledniku i strukturiranim putevima učenja.**

#### Dodano
- **🎥 Interaktivni vodič radionice**: Radionica u pregledniku s mogućnošću pregleda kroz MkDocs
- **📝 Strukturirane upute za radionicu**: 7-koraka vodič od otkrivanja do prilagodbe
  - 0-Uvod: Pregled i postavljanje radionice
  - 1-Odabir AI predloška: Otkrivanje i izbor predloška
  - 2-Validacija AI predloška: Puštanje u rad i provjere valjanosti
  - 3-Razgradnja AI predloška: Razumijevanje arhitekture predloška
  - 4-Konfiguracija AI predloška: Postavljanje i prilagodbe
  - 5-Prilagodba AI predloška: Napredne modifikacije i iteracije
  - 6-Razgradnja infrastrukture: Čišćenje i upravljanje resursima
  - 7-Završetak: Sažetak i daljnji koraci
- **🛠️ Alati za radionicu**: MkDocs konfiguracija s Material temom za bolje iskustvo učenja
- **🎯 Praktični put učenja**: 3-koraka metodologija (Otkrivanje → Puštanje u rad → Prilagodba)
- **📱 GitHub Codespaces integracija**: Lakša konfiguracija razvojnog okruženja

#### Poboljšano
- **AI Workshop Lab**: Proširen s potpunim 2-3 satnim strukturom učenja
- **Dokumentacija radionice**: Profesionalna prezentacija s navigacijom i vizualnim pomagalima
- **Napredak u učenju**: Jasne upute korak po korak od odabira predloška do puštanja u proizvodnju
- **Programersko iskustvo**: Integrirani alati za pojednostavljene razvojne procese

#### Poboljšano
- **Pristupačnost**: Sučelje u pregledniku s pretraživanjem, funkcijom kopiranja i promjenom teme
- **Učenje vlastitim tempom**: Fleksibilna struktura radionice za različite brzine učenja
- **Praktična primjena**: Scenariji stvarnog puštanja AI predložaka
- **Zajednica**: Integracija Discorda za podršku i suradnju tijekom radionice

#### Značajke radionice
- **Integrirano pretraživanje**: Brzo pronalaženje ključnih pojmova i lekcija
- **Kopiranje kodnih blokova**: Funkcija kopiranja kodova iz primjera jednostavnim prelaskom miša
- **Prebacivanje teme**: Podrška za tamni/svijetli način za različite preferencije
- **Vizualni materijali**: Snimke zaslona i dijagrami za bolje razumijevanje
- **Integrirana pomoć**: Direktan pristup Discord zajednici za podršku

### [v3.2.0] - 2025-09-17

#### Velika rekonstrukcija navigacije i sustav učenja po poglavljima
**Ova verzija donosi cjelovit sustav učenja kroz poglavlja s poboljšanom navigacijom kroz cijeli repozitorij.**

#### Dodano
- **📚 Sustav učenja kroz poglavlja**: Cijeli tečaj restrukturiran u 8 progresivnih poglavlja
  - Poglavlje 1: Osnove i brzi početak (⭐ - 30-45 minuta)
  - Poglavlje 2: AI-pristup u razvoju (⭐⭐ - 1-2 sata)
  - Poglavlje 3: Konfiguracija i autentikacija (⭐⭐ - 45-60 minuta)
  - Poglavlje 4: Infrastruktura kao kod i puštanje u rad (⭐⭐⭐ - 1-1,5 sati)
  - Poglavlje 5: AI rješenja s višestrukim agentima (⭐⭐⭐⭐ - 2-3 sata)
  - Poglavlje 6: Validacija i planiranje prije puštanja (⭐⭐ - 1 sat)
  - Poglavlje 7: Otklanjanje poteškoća i debugiranje (⭐⭐ - 1-1,5 sati)
  - Poglavlje 8: Produkcijski i enterprise obrasci (⭐⭐⭐⭐ - 2-3 sata)
- **📚 Sveobuhvatan navigacijski sustav**: Dosljedni zaglavlja i podnožja navigacije kroz svu dokumentaciju
- **🎯 Praćenje napretka**: Lista za provjeru završetka tečaja i sustav verifikacije učenja
- **🗺️ Vodič kroz put učenja**: Jasne točke ulaska za različite razine iskustva i ciljeve
- **🔗 Navigacija međureferencama**: Povezanost povezanih poglavlja i preduvjeta

#### Poboljšano
- **Struktura README-a**: Preobražena u strukturiranu platformu učenja s organizacijom po poglavljima
- **Navigacija dokumentacije**: Svaka stranica sada uključuje kontekst poglavlja i upute za napredak
- **Organizacija predložaka**: Primjeri i predlošci usklađeni s odgovarajućim poglavljima
- **Integracija resursa**: Cheat sheetovi, FAQ i vodiči za učenje povezani s relevantnim poglavljima
- **Integracija radionice**: Praktični labovi povezani s ciljevima učenja više poglavlja

#### Promijenjeno
- **Napredak u učenju**: Prijelaz sa linearne dokumentacije na fleksibilno učenje po poglavljima
- **Mjesto konfiguracije**: Vodič za konfiguraciju premješten u Poglavlje 3 radi boljeg toka učenja
- **Integracija AI sadržaja**: Bolja integracija sadržaja specifičnih za AI kroz cijeli proces učenja
- **Produkcijski sadržaj**: Napredni obrasci objedinjeni u Poglavlju 8 za enterprise korisnike

#### Poboljšano
- **Korisničko iskustvo**: Jasne navigacijske "breadcrumb" staze i indikatori napretka kroz poglavlja
- **Pristupačnost**: Dosljedni navigacijski obrasci za lakše kretanje tečajem
- **Profesionalna prezentacija**: Struktura tečaja nalik sveučilišnom standardu, prikladna za akademsku i korporativnu obuku
- **Učinkovitost učenja**: Smanjeno vrijeme pronalaska relevantnog sadržaja zahvaljujući boljoj organizaciji

#### Tehnička implementacija
- **Zaglavlja navigacije**: Standardizirana navigacija poglavlja u preko 40 datoteka dokumentacije
- **Podnožje navigacije**: Dosljedne upute za napredak i indikatori završetka poglavlja
- **Međusobno povezivanje**: Sveobuhvatan sustav unutarnjih linkova koji povezuju povezane pojmove
- **Mapiranje poglavlja**: Predlošci i primjeri jasno povezani s ciljevima učenja

#### Poboljšanja vodiča za učenje
- **📚 Sveobuhvatni ciljevi učenja**: Restrukturirani vodič za učenje usklađen s 8-poglavnom strukturom
- **🎯 Procjena po poglavljima**: Svako poglavlje uključuje ciljeve učenja i praktične zadatke
- **📋 Praćenje napretka**: Tjedni plan učenja s mjerljivim ishodima i listama za provjeru
- **❓ Pitanja za procjenu**: Provjerna pitanja za svako poglavlje s profesionalnim ishodima
- **🛠️ Praktične vježbe**: Aktivnosti s primjerima stvarnog puštanja i otklanjanja poteškoća
- **📊 Napredak vještina**: Jasno napredovanje od osnovnih pojmova do enterprise obrazaca s fokusom na razvoj karijere
- **🎓 Certifikacijski okvir**: Profesionalni razvoj i sustav priznavanja u zajednici
- **⏱️ Upravljanje vremenom**: Strukturirani 10-tjedni plan s provjerom ključnih faza

### [v3.1.0] - 2025-09-17

#### Poboljšana AI rješenja s višestrukim agentima
**Ova verzija poboljšava višestruka agentska rješenja za maloprodaju s jasnijim imenovanjem agenata i poboljšanom dokumentacijom.**

#### Promijenjeno
- **Terminologija višestrukih agenata**: "Cora agent" zamijenjen s "Customer agent" kroz cijelo maloprodajno višestruko agentsko rješenje za jasnije razumijevanje
- **Arhitektura agenata**: Ažurirana sva dokumentacija, ARM predlošci i primjeri koda s ujednačenim nazivom "Customer agent"
- **Primjeri konfiguracije**: Modernizirani obrasci konfiguracije agenata s novim imenima
- **Dosljednost dokumentacije**: Sve reference koriste profesionalne i deskriptivne nazive agenata

#### Poboljšano
- **ARM predložak paketa**: Ažurirani retail-multiagent-arm-template s referencama na Customer agent
- **Arhitektonski dijagrami**: Osvježeni Mermaid dijagrami s novim nazivima agenata
- **Primjeri koda**: Python klase i implementacije sada koriste imenovanje CustomerAgent
- **Varijable okoline**: Sve skripte za puštanje u rad ažurirane s prefiksom CUSTOMER_AGENT_NAME

#### Poboljšano
- **Iskustvo developera**: Jasnije uloge i odgovornosti agenata u dokumentaciji
- **Spremnost za proizvodnju**: Bolja usklađenost s enterprise konvencijama imenovanja
- **Materijali za učenje**: Intuitivnije imenovanje agenata za edukativne svrhe
- **Upotrebljivost predložaka**: Jednostavnije razumijevanje funkcija agenata i obrazaca puštanja u rad

#### Tehnički detalji
- Ažurirani Mermaid arhitektonski dijagrami s referencama na CustomerAgent
- Zamijenjena imena CoraAgent klasa s CustomerAgent u Python primjerima
- Izmijenjene ARM template JSON konfiguracije za tip "customer" agenta
- Ažurirane varijable okoline iz CORA_AGENT_* u CUSTOMER_AGENT_* obrasce
- Osvježene naredbe za puštanje i konfiguracije containera

### [v3.0.0] - 2025-09-12

#### Velike promjene - Fokus na AI developere i integracija Microsoft Foundry
**Ova verzija transformira repozitorij u opsežan AI orijentiran resurs za učenje s integracijom Microsoft Foundry.**

#### Dodano
- **🤖 Put učenja s AI prvenstvom**: Potpuna restrukturacija s fokusom na AI developere i inženjere
- **Vodič za integraciju Microsoft Foundry**: Opsežna dokumentacija za povezivanje AZD-a s Microsoft Foundry uslugama
- **Obrasci za puštanje AI modela u rad**: Detaljni vodič koji pokriva izbor modela, konfiguraciju i strategije produkcijskog puštanja u rad
- **AI radionica u laboratoriju**: 2-3 sata praktične radionice za pretvaranje AI aplikacija u AZD-rješenja spremna za implementaciju  
- **Najbolje prakse za proizvodni AI**: Enterprise obrasci za skaliranje, nadzor i osiguranje AI radnih opterećenja  
- **Vodič za rješavanje problema specifičnih za AI**: Sveobuhvatno rješavanje problema za Microsoft Foundry modele, kognitivne usluge i AI implementacije  
- **Galerija AI predložaka**: Istaknuta kolekcija Microsoft Foundry predložaka s ocjenama složenosti  
- **Materijali za radionicu**: Kompletna struktura radionice s praktičnim laboratorijima i referentnim materijalima  

#### Poboljšano
- **Struktura README-a**: Usmjereno na AI razvojne inženjere s 45% podataka o interesu zajednice s Microsoft Foundry Discorda  
- **Putokazi učenja**: Posvećeno AI programersko putovanje uz tradicionalne putove za studente i DevOps inženjere  
- **Preporuke predložaka**: Istaknuti AI predlošci uključuju azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart  
- **Integracija zajednice**: Unaprijeđena podrška zajednice na Discordu s kanalima i raspravama specifičnim za AI  

#### Sigurnost i fokus na proizvodnju
- **Uzorci Managed Identity**: AI-specificne konfiguracije autentikacije i sigurnosti  
- **Optimizacija troškova**: Praćenje upotrebe tokena i kontrola budžeta za AI radna opterećenja  
- **Višeregionalna implementacija**: Strategije za globalnu implementaciju AI aplikacija  
- **Praćenje performansi**: AI-specifične metrike i integracija Application Insightsa  

#### Kvaliteta dokumentacije
- **Linearni tijek tečaja**: Logičan napredak od početničkih do naprednih obrazaca implementacije AI-a  
- **Provjereni URL-ovi**: Svi linkovi na vanjske repozitorije provjereni i dostupni  
- **Kompletna referenca**: Svi unutarnji dokumentacijski linkovi provjereni i funkcionalni  
- **Spremno za proizvodnju**: Enterprise obrasci implementacije s primjerima iz stvarnog svijeta  

### [v2.0.0] - 2025-09-09  

#### Veće promjene - restrukturiranje repozitorija i profesionalna nadogradnja  
**Ova verzija predstavlja značajno preuređenje strukture repozitorija i prezentacije sadržaja.**  

#### Dodano  
- **Strukturirani okvir učenja**: Sve stranice dokumentacije sada uključuju odjeljke Uvod, Ciljevi učenja i Ishodi učenja  
- **Navigacijski sustav**: Dodani linkovi Prethodni/Sljedeći lekciji kroz kompletnu dokumentaciju za vođen tijek učenja  
- **Vodič za učenje**: Sveobuhvatan study-guide.md s ciljevima učenja, praktičnim vježbama i materijalima za procjenu  
- **Profesionalna prezentacija**: Uklonjene sve emoji ikone za poboljšanu pristupačnost i profesionalan izgled  
- **Poboljšana struktura sadržaja**: Bolja organizacija i tok materijala za učenje  

#### Promijenjeno  
- **Format dokumentacije**: Standardiziran sve dokumentacijske stranice s dosljednom strukturom fokusiranom na učenje  
- **Tok navigacije**: Implementiran logičan napredak kroz sve materijale za učenje  
- **Prezentacija sadržaja**: Uklonjeni dekorativni elementi u korist jasnog, profesionalnog formatiranja  
- **Struktura linkova**: Ažurirani svi unutarnji linkovi za podršku novom navigacijskom sustavu  

#### Poboljšano  
- **Pristupačnost**: Uklonjene ovisnosti o emoji ikonama za bolju kompatibilnost sa zaslon čitačima  
- **Profesionalni izgled**: Čista, akademski stilizirana prezentacija prikladna za enterprise učenje  
- **Iskustvo učenja**: Strukturirani pristup s jasnim ciljevima i ishodima za svaku lekciju  
- **Organizacija sadržaja**: Bolji logični tok i povezanost među srodnim temama  

### [v1.0.0] - 2025-09-09  

#### Početno izdanje - Sveobuhvatan AZD repozitorij za učenje  

#### Dodano  
- **Osnovna struktura dokumentacije**  
  - Kompletni vodiči za početak rada  
  - Sveobuhvatna dokumentacija za implementaciju i provisioning  
  - Detaljni resursi za rješavanje problema i upute za debugiranje  
  - Alati i procedure za validaciju prije implementacije  

- **Modul za početnike**  
  - Osnove AZD-a: Temeljni koncepti i terminologija  
  - Vodič za instalaciju: Upute za specifične platforme  
  - Vodič za konfiguraciju: Postavljanje okruženja i autentikacija  
  - Prvi projekt: Korak-po-korak praktični vodič  

- **Modul za implementaciju i provisioning**  
  - Vodič za implementaciju: Kompletan tijek rada dokumentiran  
  - Vodič za provisioning: Infrastruktura kao kod sa Bicep-om  
  - Najbolje prakse za proizvodne implementacije  
  - Obrasci višeslužbene arhitekture  

- **Modul za validaciju prije implementacije**  
  - Planiranje kapaciteta: Validacija dostupnosti Azure resursa  
  - Odabir SKU-a: Sveobuhvatne upute za nivoe usluge  
  - Pre-flight provjere: Automatizirani skripti (PowerShell i Bash)  
  - Alati za procjenu troškova i planiranje budžeta  

- **Modul za rješavanje problema**  
  - Česti problemi: Uobičajeni problemi i rješenja  
  - Vodič za debugiranje: Sistematske metodologije rješavanja problema  
  - Napredne dijagnostičke tehnike i alati  
  - Praćenje i optimizacija performansi  

- **Resursi i reference**  
  - Cheat Sheet naredbi: Brzi podsjetnik za ključne naredbe  
  - Rječnik: Sveobuhvatni pojmovnik i definicije akronima  
  - Često postavljana pitanja: Detaljni odgovori na česta pitanja  
  - Linkovi na vanjske resurse i povezanost zajednice  

- **Primjeri i predlošci**  
  - Primjer jednostavne web aplikacije  
  - Predložak za implementaciju statične web stranice  
  - Konfiguracija kontejnerskih aplikacija  
  - Obrasci integracije baza podataka  
  - Primjeri mikroservisnih arhitektura  
  - Implementacije serverless funkcija  

#### Značajke  
- **Podrška za više platformi**: Upute za instalaciju i konfiguraciju za Windows, macOS i Linux  
- **Više razina vještina**: Sadržaj dizajniran za studente pa do profesionalnih developera  
- **Praktični fokus**: Praktični primjeri i scenariji iz stvarnog svijeta  
- **Sveobuhvatnost**: Od osnovnih koncepata do naprednih enterprise obrazaca  
- **Sigurnost na prvom mjestu**: Najbolje sigurnosne prakse integrirane kroz cijeli sadržaj  
- **Optimizacija troškova**: Upute za ekonomične implementacije i upravljanje resursima  

#### Kvaliteta dokumentacije  
- **Detaljni primjeri koda**: Praktični, testirani uzorci koda  
- **Upute korak po korak**: Jasne i provedive smjernice  
- **Sveobuhvatno rukovanje greškama**: Rješavanje uobičajenih problema  
- **Integracija najboljih praksi**: Industrijski standardi i preporuke  
- **Kompatibilnost verzija**: Usklađeno s najnovijim Azure uslugama i značajkama azd-a  

## Planirana buduća poboljšanja  

### Verzija 3.1.0 (planirano)  
#### Proširenje AI platforme  
- **Podrška za više modela**: Obrasci integracije za Hugging Face, Azure Machine Learning i prilagođene modele  
- **AI agent okviri**: Predlošci za distribucije LangChain, Semantic Kernel i AutoGen  
- **Napredni RAG obrasci**: Opcije vektorskih baza podataka izvan Azure AI Searcha (Pinecone, Weaviate itd.)  
- **AI nadzor**: Poboljšani nadzor performansi modela, upotrebe tokena i kvalitete odgovora  

#### Iskustvo programera  
- **VS Code ekstenzija**: Integrirano AZD + Microsoft Foundry razvojno iskustvo  
- **GitHub Copilot integracija**: AI-pomoć u generiranju AZD predložaka  
- **Interaktivni tutorijali**: Praktične kodne vježbe s automatiziranom validacijom za AI scenarije  
- **Video sadržaji**: Dodatni video tutorijali za vizualne učenike fokusirane na AI implementacije  

### Verzija 4.0.0 (planirano)  
#### Enterprise AI obrasci  
- **Okvir upravljanja**: Upravljanje AI modelima, usklađenost i auditi  
- **Višekorisnički AI**: Obrasci za usluživanje više kupaca s izoliranim AI servisima  
- **Edge AI implementacija**: Integracija s Azure IoT Edge i kontejnerskim instancama  
- **Hibridni cloud AI**: Obrasci višemrežne i hibridne cloud implementacije AI radnih opterećenja  

#### Napredne značajke  
- **Automatizacija AI pipelinea**: MLOps integracija s Azure Machine Learning pipeline-ima  
- **Napredna sigurnost**: Obrasci zero-trust, privatne krajnje točke i napredna zaštita od prijetnji  
- **Optimizacija performansi**: Napredne strategije podešavanja i skaliranja za AI aplikacije visokog protoka  
- **Globalna distribucija**: Obrasci dostave sadržaja i edge caching za AI aplikacije  

### Verzija 3.0.0 (planirano) - Zamijenjeno trenutačnim izdanjem  
#### Predložena proširenja - sada implementirana u v3.0.0  
- ✅ **AI-fokusiran sadržaj**: Sveobuhvatna integracija Microsoft Foundryja (dovršeno)  
- ✅ **Interaktivni tutorijali**: Praktična AI radionica u laboratoriju (dovršeno)  
- ✅ **Napredni sigurnosni modul**: AI-specifični sigurnosni obrasci (dovršeno)  
- ✅ **Optimizacija performansi**: Strategije podešavanja AI radnih opterećenja (dovršeno)  

### Verzija 2.1.0 (planirano) - Djelomično implementirano u v3.0.0  
#### Manja poboljšanja - neka dovršena u trenutačnom izdanju  
- ✅ **Dodatni primjeri**: AI-fokusirani scenariji implementacije (dovršeno)  
- ✅ **Prošireni FAQ**: AI-specifična pitanja i rješavanje problema (dovršeno)  
- **Integracija alata**: Poboljšane upute za integraciju IDE-a i uređivača  
- ✅ **Proširenje nadzora**: AI-specifični obrasci nadzora i obavještavanja (dovršeno)  

#### Još planirano za buduću verziju  
- **Dokumentacija prilagođena mobilnim uređajima**: Responsivni dizajn za mobilno učenje  
- **Offline pristup**: Preuzimanje dokumentacijskih paketa  
- **Poboljšana integracija IDE-a**: VS Code ekstenzija za AZD + AI radne tokove  
- **Nadzorna ploča zajednice**: Metrički podaci zajednice u stvarnom vremenu i praćenje doprinosa  

## Doprinos promjenama u zapisniku promjena  

### Prijava promjena  
Prilikom doprinosa ovom repozitoriju, molimo osigurajte da zapisi u changelogu sadrže:  

1. **Broj verzije**: Slijedeći semantičko verzioniranje (major.minor.patch)  
2. **Datum**: Datum izdanja ili ažuriranja u formatu GGGG-MM-DD  
3. **Kategoriju**: Dodano, Promijenjeno, Zastarjelo, Uklonjeno, Ispravljeno, Sigurnost  
4. **Jasan opis**: Sažet opis promjene  
5. **Procjenu utjecaja**: Kako promjene utječu na postojeće korisnike  

### Kategorije promjena  

#### Dodano  
- Nove značajke, odjeljci u dokumentaciji ili mogućnosti  
- Novi primjeri, predlošci ili resursi za učenje  
- Dodatni alati, skripte ili pomoćni programi  

#### Promijenjeno  
- Izmjene postojeće funkcionalnosti ili dokumentacije  
- Ažuriranja za poboljšanje jasnoće ili točnosti  
- Restrukturiranje sadržaja ili organizacije  

#### Zastarjelo  
- Značajke ili pristupi koji se ukidaju  
- Odjeljci dokumentacije planirani za uklanjanje  
- Metode koje imaju bolje alternative  

#### Uklonjeno  
- Značajke, dokumentacija ili primjeri koji više nisu relevantni  
- Zastarjele informacije ili zastarjeli pristupi  
- Redundantni ili spojeni sadržaji  

#### Ispravljeno  
- Ispravci grešaka u dokumentaciji ili kodu  
- Rješavanje prijavljenih problema ili poteškoća  
- Poboljšanja u točnosti ili funkcionalnosti  

#### Sigurnost  
- Poboljšanja ili ispravci vezani za sigurnost  
- Ažuriranja najboljih sigurnosnih praksi  
- Rješavanje sigurnosnih ranjivosti  

### Smjernice za semantičko verzioniranje  

#### Velika verzija (X.0.0)  
- Promjene koje zahtijevaju intervenciju korisnika  
- Značajna restrukturiranja sadržaja ili organizacije  
- Promjene koje mijenjaju temeljni pristup ili metodologiju  

#### Manja verzija (X.Y.0)  
- Nove značajke ili dodatci sadržaja  
- Nadogradnje koje održavaju kompatibilnost unatrag  
- Dodatni primjeri, alati ili resursi  

#### Verzija zakrpe (X.Y.Z)  
- Ispravci bugova i korekcije  
- Manja poboljšanja postojećeg sadržaja  
- Pojašnjenja i sitna poboljšanja  

## Povratne informacije i prijedlozi zajednice  

Aktivno potičemo povratne informacije zajednice za poboljšanje ovog resursa za učenje:  

### Kako pružiti povratne informacije  
- **GitHub Issues**: Prijavite probleme ili predložite poboljšanja (AI-specifični problemi dobrodošli)  
- **Discord rasprave**: Dijelite ideje i uključite se u Microsoft Foundry zajednicu  
- **Pull Requests**: Izravno doprinesite poboljšanjima sadržaja, osobito AI predlošcima i vodičima  
- **Microsoft Foundry Discord**: Sudjelujte u #Azure kanalu za AZD + AI rasprave  
- **Zajednički forumi**: Sudjelujte u širim Azure developerskim razgovorima  

### Kategorije povratnih informacija  
- **Točnost AI sadržaja**: Ispravci integracije AI usluga i podataka o implementaciji  
- **Iskustvo učenja**: Prijedlozi za poboljšanje toka učenja AI developera  
- **Nedostajući AI sadržaj**: Zahtjevi za dodatnim AI predlošcima, obrascima ili primjerima  
- **Pristupačnost**: Poboljšanja za različite potrebe učenja  
- **Integracija AI alata**: Prijedlozi za bolju integraciju razvojnog tijeka AI-a  
- **Proizvodni AI obrasci**: Zahtjevi za enterprise obrasce AI implementacije  

### Obveza odgovora  
- **Odgovor na issue**: Unutar 48 sati od prijave problema  
- **Zahtjevi za značajke**: Procjena unutar jednog tjedna  
- **Doprinosi zajednice**: Pregled unutar jednog tjedna  
- **Sigurnosna pitanja**: Prioritetna obrada s ubrzanim odgovorom  

## Raspored održavanja  

### Redovita ažuriranja  
- **Mjesečni pregledi**: Provjera točnosti sadržaja i validacija linkova  
- **Četvrtinska ažuriranja**: Veći dodaci i poboljšanja sadržaja  
- **Polugodišnji pregledi**: Sveobuhvatna restrukturiranja i nadogradnje  
- **Godišnja izdanja**: Velika ažuriranja verzija sa značajnim poboljšanjima  

### Praćenje i osiguranje kvalitete  
- **Automatizirano testiranje**: Redovita validacija primjera koda i linkova  
- **Integracija povratnih informacija zajednice**: Redovita implementacija prijedloga korisnika  
- **Tehnološka ažuriranja**: Usuglašavanje s najnovijim Azure uslugama i izdanjima azd-a  
- **Revizije pristupačnosti**: Redovni pregledi inkluzivnih dizajnerskih principa  

## Politika podrške verzijama  

### Podrška za trenutačnu verziju  
- **Najnovija glavna verzija**: Puna podrška s redovitim ažuriranjima  
- **Prethodna glavna verzija**: Sigurnosne nadogradnje i kritične ispravke 12 mjeseci  
- **Arhivske verzije**: Samo podrška zajednice, bez službenih ažuriranja  

### Upute za migraciju  
Kad se objave glavne verzije, pružamo:  
- **Vodiče za migraciju**: Korak-po-korak prijelazne upute  
- **Napomene o kompatibilnosti**: Detalje o promjenama koje mogu prekinuti funkcionalnost  
- **Podršku alatima**: Skripte ili alati za pomoć pri migraciji  
- **Zajedničku podršku**: Namjenski forumi za pitanja migracije  

---  

**Navigacija**  
- **Prethodna lekcija**: [Study Guide](resources/study-guide.md)  
- **Sljedeća lekcija**: Povratak na [Main README](README.md)  

**Ostanite u toku**: Pratite ovaj repozitorij za obavijesti o novim izdanjima i važnim ažuriranjima materijala za učenje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->