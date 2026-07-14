# Dnevnik promjena - AZD za početnike

## Uvod

Ovaj dnevnik promjena dokumentira sve značajne promjene, ažuriranja i poboljšanja u spremištu AZD za početnike. Pridržavamo se principa semantičkog verzioniranja i održavamo ovaj zapis kako bismo korisnicima pomogli razumjeti što se promijenilo između verzija.

## Ciljevi učenja

Pregledom ovog dnevnika promjena, moći ćete:
- Ostanite informirani o novim značajkama i dodacima sadržaja
- Razumjeti poboljšanja postojeće dokumentacije
- Pratiti ispravke grešaka i korekcije radi osiguravanja točnosti
- Pratiti razvoj materijala za učenje kroz vrijeme

## Ishodi učenja

Nakon pregleda unosa u dnevnik promjena, moći ćete:
- Uočiti novi sadržaj i dostupne resurse za učenje
- Razumjeti koje su sekcije ažurirane ili poboljšane
- Planirati svoj put učenja na temelju najnovijih materijala
- Doprinositi povratnim informacijama i prijedlozima za buduća poboljšanja

## Povijest verzija

### [v3.23.0] - 2026-07-13

#### Osvježenje AZD 1.27.1: Ažuriranje valjanosti verzije
**Ova verzija ponovno potvrđuje tečaj protiv `azd` `1.27.1` (srpanj 2026., najnovije stabilno izdanje) i trenutnog proširenja AI agenta u pregledu `azure.ai.agents` `1.0.0-beta.5`, ažurirajući svaki "potvrđeno protiv" natpis nakon izdanja 1.26.0, 1.27.0 i 1.27.1.**

#### Promijenjeno
- **✅ Ažurirana osnovna linija validacije** s `azd 1.25.6` (lipanj 2026.) na `azd 1.27.1` (srpanj 2026.) kroz glavni README, sve README datoteke poglavlja, lekciju dev-container u poglavlju 1 (uključujući primjere fiksiranih verzija), lekciju o prilagođenim šablonama u poglavlju 4, lekciju o multi-agentima u poglavlju 5 i dokumentaciju radionice
- **🤖 Osvježena osnovna linija za poglavlje 2** s `azd 1.23.12` (ožujak 2026.) na `azd 1.27.1` kroz `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` i `microsoft-foundry-integration.md`; datumi napomena o validaciji ažurirani na 2026-07-13
- **🧩 Nadograđeno AI agent proširenje** s `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` na trenutačno izdanje `1.0.0-beta.5` u README poglavlja 2 i `agents.md`
- **🧪 Ažuriran primjer validacije radionice** (izlaz `azd version`) na `1.27.1`

#### Bilješke o relevantnim azd izdanjima (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Podrška za Go u Azure Functions na Flex Consumption, `azd config sub-filter` filtri pretplate po zakupcu, samostalni paketi proširenja (`azd x pack --bundle`), i `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modeliranje Azure AI Foundry projekata/agenta izravno u `azure.yaml` (inicijalizacija bez Bicep/Terraform), podrška za kontejnerizaciju na App Service (`host: appservice` + `language: docker`), izravno `-s/--source` za `azd extension` naredbe, i `azd tool uninstall`
- **1.27.1 (2026-07-09):** Zastavica `--no-dependencies` za `azd extension install`, zastarjeli modeli po defaultu izuzeti iz kataloga/pitanja o kvotama, i nekoliko ispravki grešaka

#### Ažurirane datoteke
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

#### Popunjavanje praznina za početnike #2: Izrada šablona, Dev kontejneri, Pulumi, Azure DevOps, Service Principals i još mnogo toga
**Ova verzija zatvara preostale srednje praznine prikazane analizom pokrivenosti azd-a: kako izraditi i objaviti vlastitu šablonu, reproducibilni dev-container/Codespaces okruženja, Pulumi davatelj infrastrukture, Azure DevOps CI/CD vodič, autentifikacija servisnog korisnika, upute za odabir domaćina (AKS/Spring Apps), objašnjenja za `azd restore`/`azd package`, rukovanje pogreškama hook-ova i prakse timskih/zajedničkih okruženja.**

#### Dodano
- **🧱 Nova lekcija poglavlja 4** `docs/chapter-04-infrastructure/custom-templates.md` — izrada vlastite azd šablone: potrebna struktura (`azure.yaml`, `infra/`, `src/`), polje `metadata.template`, parametrizacija infrastrukture s `uniqueString()` tokenom resursa i oznakom `azd-env-name`, lokalno testiranje s `azd init --template <local-path>`, objavljivanje na GitHub i predaja u Awesome AZD galeriju
- **📦 Nova lekcija poglavlja 1** `docs/chapter-01-foundation/dev-containers.md` — reproducibilna azd okruženja s Dev kontejnerima i GitHub Codespaces: minimalni `.devcontainer/devcontainer.json` koristeći službeni `ghcr.io/azure/azure-dev/azd` feature, jezične značajke, `docker-in-docker` za domaćine kontejnera i `azd auth login --use-device-code` za prijavu na daljinu
- **🧩 Pulumi s azd-om** odjeljak u `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, struktura Pulumi direktorija, stogovi mapirani na azd okruženja, potrebni izlazi/oznake i identičan tok rada `azd up` / `azd down`
- **🎯 Upute za odabir domaćina** u `docs/chapter-04-infrastructure/provisioning.md` — početnički prijateljsko uspoređivanje `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` i `springapp`, s uputama kad odabrati AKS ili Azure Spring Apps
- **🛠️ Azure DevOps CI/CD vodič** u `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, servisna veza s workload identity federation (OIDC), generirani `azure-dev.yml` i postavljanje varijabilnih grupa
- **🔑 Service Principals (Uzorak 4)** dodano u `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktivna prijava `azd auth login` s klijentskim tajnim ključem nasuprot federiranim/OIDC vjerodajnicama, kada koristiti i sigurno pohranjivanje vjerodajnica
- **🪝 Pododjeljak za rukovanje pogreškama hook-ova** u `docs/chapter-04-infrastructure/deployment-guide.md` — izlazni kodovi i `set -e`, `continueOnError`, testiranje hook-ova izolirano s `azd hooks run`, OS-specifične ljuske i `--debug`
- **👥 Tim / zajednička okruženja** odjeljak u `docs/chapter-03-configuration/configuration.md` — što živi u `.azure/`, što ignoirati u git-u, razvojnička okruženja, `azd env list`/`select` i pružanje vrijednosti okruženja u CI/CD
- **🧰 `azd restore` i proširena objašnjenja `azd package`** u `resources/cheat-sheet.md` — vraćanje ovisnosti i izgradnja artefakta spremnog za implementaciju bez implementacije

#### Promijenjeno
- **🧭 Tablica lekcija poglavlja 4** ažurirana za uključivanje nove lekcije "Izrada vlastite šablone" (Lekcija 3)
- **🧭 Tablica lekcija poglavlja 1** ažurirana za uključivanje nove lekcije "Dev Containers & Codespaces" (Lekcija 5); navigacijski podnožja povezana između `bring-your-own-app.md` i `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Popunjavanje praznina za početnike: Praktična lekcija o multi-agentima, "Donesi vlastitu aplikaciju", Terraform i CI/CD vodič
**Ova verzija zatvara najveće praznine za kompletan vodič za početnike dodavanjem dvije nove praktične lekcije (pokretanje multi-agent rješenja i dodavanje azd-a postojećoj aplikaciji), početničkog uvoda u hook-ove, Terraform s azd odjeljak, korak-po-korak vodič za GitHub Actions pipeline, objašnjenje za nova proširenja u pregledu i eksplicitnu listu za provjeru implementacije.**

#### Dodano
- **🤝 Nova lekcija poglavlja 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — potpuno praktični, implementabilni vodič za dva agenta (orchestrator + specijalisti) koristeći stvarnu šablonu (`contoso-creative-writer`), pokrivajući kada koristiti multi-agent, tok rada `azd up`, razumijevanje implementiranih resursa, praćenje među agentima, prilagođavanje i čišćenje
- **📦 Nova lekcija poglavlja 1** `docs/chapter-01-foundation/bring-your-own-app.md` — kako dodati azd u postojeći projekt s `azd init` ("koristi kod u trenutnom direktoriju"), razumijevanje `azure.yaml` i `infra/`, `azd infra generate`, otkrivanje domaćina i implementacija s `azd up`
- **🌐 Terraform s azd-om** dodan odjeljak u `docs/chapter-04-infrastructure/provisioning.md` — konfiguracija `infra.provider: terraform`, struktura `.tf` direktorija, potrebni `AZURE_*` izlazi i oznake `azd-env-name`, i identičan tok rada `azd up` / `azd down` (zatvara prazninu gdje je tvrdila podrška za Terraform, ali je prikazivan samo Bicep)
- **⚙️ Korak-po-korak GitHub Actions vodič** u `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitorija do automatizirane implementacije: `azd pipeline config`, OIDC federirane vjerodajnice (bez pohranjenih tajni), generirani `azure-dev.yml` i upute za tajne kontra varijable
- **🪝 Početnički uvod "Novi u hook-ovima?"** u `docs/chapter-04-infrastructure/deployment-guide.md` — što je hook, tablica faza hook-ova, minimalni prvi hook i ručno pokretanje hook-ova s `azd hooks run`
- **✅ Dodan popis za provjeru "Provjeri svoju implementaciju"** u koraku 5 `docs/chapter-01-foundation/first-project.md` — smoke test, provjera health-endpointa i eksplicitni kriteriji uspjeha
- **🧩 Objašnjenje za nova preview proširenja** `azure.ai.skills` i `azure.ai.connections` (što su i kada ih koristiti) u `docs/chapter-08-production/production-ai-practices.md`

#### Promijenjeno
- **🧭 Tablica lekcija poglavlja 5** ispravljena: `multi-agent-basics.md` sada je Lekcija 1 (jedina potpuno praktična lekcija), s iskrenim označavanjem da je Lekcija 2 u poglavlju 6 i da je scenarij Retail arhitektonski nacrt, a ne šablona jednom naredbom
- **🧭 Tablica lekcija poglavlja 1** sada uključuje novu lekciju "Bring Your Own App" (Lekcija 4)
- **🔗 Navigacijski podnožja** ažurirana: `first-project.md` sada povezuje prema `bring-your-own-app.md`

#### Ispravljeno
- **🧱 Zatvorena "proklamirana ali nedostajuća" Terraform praznina** — tečaj je ranije referirao podršku za Terraform bez da ju je prikazao
- **🔀 Ispravljene zavaravajuće međulinkove poglavlja 5** koji su sugerirali da postoji potpuna multi-agent implementacija kad je postojala samo arhitektonska skica

#### Ažurirane datoteke
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

#### Osvježenje AZD 1.25.6, potpune naredbe životnog ciklusa agenta i Aspire rebranding

**Ova verzija ponovno provjerava tečaj u odnosu na `azd` `1.25.6` (lipanj 2026.) i `azure.ai.agents` `0.1.40-preview` proširenje, proširuje AI smjernice s "skladištenja agenta" na kompletan životni ciklus agenta (testiranje → evaluacija → optimizacija → inspekcija → brisanje), prikazuje nova `azure.ai.skills` i `azure.ai.connections` preview proširenja i bilježi rebranding proizvoda s ".NET Aspire" na "Aspire".**

#### Dodano
- **🔁 Potpuna pokrivenost životnog ciklusa agenta** za početnike i AI inženjere kroz dokumentaciju:
  - `docs/chapter-01-foundation/azd-basics.md` — Dodana tablica životnog ciklusa (skladištenje → testiranje → mjerenje → poboljšanje → inspekcija → čišćenje) u odjeljak Proširenja i AI naredbi
  - `docs/chapter-08-production/production-ai-practices.md` — Nova sekcija "Upravljanje životnim ciklusom agenta" koja pokriva `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, i `delete --force`
  - `resources/cheat-sheet.md` — Proširene AI naredbe za agente s `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, i `delete --force`
- **🧩 Dokumentirana nova preview proširenja**: `azure.ai.skills` (ponovno upotrebljive vještine agenta) i `azure.ai.connections` (Foundry veze) dodani u tablicu proširenja i cheat sheet
- **⏱️ Smjernice za mjerenje odziva** — primjeri `azd ai agent invoke` sada bilježe ukupnu latenciju i vrijeme do prvog bajta
- **📌 Banner verzije** u glavnom README-u koji učiocima pokazuje `azd version` i `azd upgrade`

#### Promijenjeno
- **✅ Ažurirana osnova za provjeru** s `azd 1.23.12` (ožujak 2026.) na `azd 1.25.6` (lipanj 2026.) u svim README-ima poglavlja i dokumentaciji radionice
- **🤖 Ažurirana napomena o proširenju u Poglavlju 2** s `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Primjer potvrde radionice** (`azd version` izlaz) ažuriran na `1.25.6`
- **🧭 Osvježenje README-a "Što je novo u azd danas"** ističe cjelokupni životni ciklus agenta, nova AI proširenja i nedavne ispravke za kvalitetu korištenja (`azd init` idempotencija, čišćenje zastarjelih tokena u `azd auth login`, prompt za prvi početak u `azd tool`)
- **📖 Chapter 2 agents.md (Opcija 4)** sada upućuje učenike na naredbe životnog ciklusa nakon implementacije, umjesto da zaustavlja na `azd up`

#### Ispravljeno
- **🏷️ Imenovanje proizvoda** — dodana bilješka o rebrandingu Aspirea (".NET Aspire" sada je samo "Aspire"); podrška za Aspire u azd ostaje nepromijenjena
- **🔎 Provjera uživo novog izdanja** potvrđena u odnosu na feed izdanja Azure Developer CLI-ja: stabilni CLI `1.25.6` (2026-06-12) i `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Ažurirane datoteke
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

#### Pojašnjenje za početnike, provjera postavki i čišćenje konačnih AZD naredbi
**Ova verzija prati potvrdu AZD 1.23 valjanosti s dokumentacijom usmjerenom na početnike: pojašnjava smjernice za autentifikaciju prvo u AZD-u, dodaje skripte za provjeru lokalne postavke, provjerava ključne naredbe prema živom AZD CLI-ju i uklanja posljednje zastarjele reference na naredbe na engleskom izvan changeloga.**

#### Dodano
- **🧪 Skripte za provjeru postavki za početnike** s `validate-setup.ps1` i `validate-setup.sh` tako da učenici mogu potvrditi tražene alate prije početka Poglavlja 1
- **✅ Koraci za ranu provjeru postavki** u glavnom README-u i README-u Poglavlja 1 tako da se nedostajući preduvjeti otkriju prije `azd up`

#### Promijenjeno
- **🔐 Smjernice za autentifikaciju početnika** sada dosljedno tretiraju `azd auth login` kao primarni put za AZD tijekove rada, s `az login` kao opcijom osim ako se izravno ne koriste Azure CLI naredbe
- **📚 Uvod u prijavu u Poglavlju 1** sada upućuje učenike na potvrdu svoje lokalne postavke prije instalacije, autentifikacije i prvih koraka implementacije
- **🛠️ Poruke validatora** sada jasno razlikuju blokirajuće zahtjeve od neobaveznih upozorenja za Azure CLI u putu za početnike s AZD-om
- **📖 Dokumenti za konfiguraciju, rješavanje problema i primjere** sada razlikuju potrebnu AZD autentifikaciju od neobavezne prijave u Azure CLI gdje je prije obje prezentirano bez konteksta

#### Ispravljeno
- **📋 Preostale reference na naredbe na engleskom** ažurirane su na sadašnje AZD oblike, uključujući `azd config show` u cheat sheet i `azd monitor --overview` gdje je zamišljen pregled u Azure portalu
- **🧭 Izjave za početnike u Poglavlju 1** ublažene su da se izbjegne pretjerano obećanje zajamčenog ponašanja bez grešaka ili poništavanja na svim predlošcima i Azure resursima
- **🔎 Provjera uživo CLI-ja** potvrđena je za trenutačnu podršku `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` i `azd down --force --purge`

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

#### AZD 1.23.12 Validacija, proširenje okruženja radionice i osvježenje AI modela
**Ova verzija provodi dokumentacijsku provjeru u odnosu na `azd` `1.23.12`, ažurira zastarjele primjere AZD naredbi, osvježava AI smjernice za aktivne zadanosti i proširuje upute radionica izvan GitHub Codespaces na dev kontejnere i lokalne kopije.**

#### Dodano
- **✅ Bilješke o validaciji kroz glavna poglavlja i dokumentaciju radionice** kako bi se jasno istakla testirana AZD osnova za korisnike sa novijim ili starijim CLI verzijama
- **⏱️ Smjernice za timeout implementacije** za dugotrajne AI implementacije s `azd deploy --timeout 1800`
- **🔎 Koraci za pregled proširenja** s `azd extension show azure.ai.agents` u AI tijekovima rada
- **🌐 Šire smjernice za okruženje radionice** koje uključuju GitHub Codespaces, dev kontejnere i lokalne kopije s MkDocs

#### Promijenjeno
- **📚 Uvodni README-i poglavlja** sada dosljedno bilježe provjeru na `azd 1.23.12` kroz osnova, konfiguraciju, infrastrukturu, višestruke agente, pre-implementaciju, rješavanje problema i produkcijske sekcije
- **🛠️ Reference AZD naredbi** ažurirane su na trenutačne oblike kroz dokumentaciju:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ili `azd env get-value(s)` ovisno o kontekstu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` gdje je primjeren pregled Application Insightsa
- **🧪 Primjeri za pregled korištenja** pojednostavljeni na trenutačno podržane upotrebe kao što su `azd provision --preview` i `azd provision --preview -e production`
- **🧭 Tijek radionice** ažuriran je tako da učenici mogu dovršiti laboratorije u Codespaces, dev kontejneru ili lokalnoj kopiji, umjesto da se pretpostavlja samo izvođenje u Codespaces
- **🔐 Smjernice za autentifikaciju** sada preferiraju `azd auth login` za AZD tijekove rada, dok je `az login` označen kao opcionalan ako se koriste izravno Azure CLI naredbe

#### Ispravljeno
- **🪟 Windows naredbe za instalaciju** usklađene su s trenutačnim pisanjem paketa `winget` u vodiču za instalaciju
- **🐧 Smjernice za instalaciju na Linuxu** ispravljene da izbjegnu neslužbene upute za upravitelja paketa `azd` specifične za distribuciju i umjesto toga upućuju na izdanja gdje je prikladno
- **📦 Primjeri AI modela** osvježeni s starijih zadataka poput `gpt-35-turbo` i `text-embedding-ada-002` na trenutačne kao što su `gpt-4.1-mini`, `gpt-4.1` i `text-embedding-3-large`
- **📋 Ispravci dijelova za implementaciju i dijagnostiku** korištenjem trenutačnih naredbi za okruženje i status u zapisima, skriptama i koracima rješavanja problema
- **⚙️ Smjernice za GitHub Actions** ažurirane s `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Smjernice za MCP/Copilot pristanak** ažurirane s `azd mcp consent` na `azd copilot consent list`

#### Poboljšano
- **🧠 Smjernice za AI poglavlja** sada bolje objašnjavaju ponašanje osjetljivo na preview `azd ai`, prijavu ovisnu o najmodavcu, trenutačnu uporabu proširenja i ažurirane preporuke za implementaciju modela
- **🧪 Upute radionice** sada koriste realističnije primjere verzija i jasniji jezik postavki okoline za praktične laboratorije
- **📈 Dokumenti za produkciju i rješavanje problema** sada bolje usklađeni s trenutačnim primjerima nadzora, rezervnog modela i razina troškova

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
**Ova verzija dodaje pokrivenost naredbama `azd ai`, `azd extension` i `azd mcp` u svim AI povezanim poglavljima, ispravlja neispravne poveznice i zastarjeli kôd u agents.md, ažurira cheat sheet i temeljito preuređuje sekciju Primjeri predložaka s potvrđenim opisima i novim Azure AI AZD predlošcima.**

#### Dodano
- **🤖 Pokrivenost AZD AI CLI-jem** kroz 7 datoteka (prije samo u Poglavlju 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nova sekcija "Proširenja i AI naredbe" koja uvodi `azd extension`, `azd ai agent init` i `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcija 4: `azd ai agent init` s usporednom tablicom (predložak vs manifest pristup)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Pododjeljci "AZD proširenja za Foundry" i "Implementacija s najprioritetnijim agentom"

  - `docs/chapter-05-multi-agent/README.md` — Brzi početak sada prikazuje oba puta implementacije, temeljenu na predlošku i manifestu
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Dio za implementaciju sada uključuje opciju `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Pododjeljak "AZD AI Extension naredbe za dijagnostiku"
  - `resources/cheat-sheet.md` — Novi odjeljak "Naredbe za AI i ekstenzije" s `azd extension`, `azd ai agent init`, `azd mcp`, i `azd infra generate`
- **📦 Novi AZD AI primjerni predlošci** u `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel i podrškom za glasovni chat
  - **azure-search-openai-demo-java** — Java RAG chat koristeći Langchain4J s opcijama implementacije ACA/AKS
  - **contoso-creative-writer** — Višeagentna aplikacija za kreativno pisanje koristeći Azure AI Agent Service, Bing Grounding i Prompty
  - **serverless-chat-langchainjs** — Serverless RAG koristeći Azure Functions + LangChain.js + Cosmos DB s Ollama lokalnom podrškom za razvoj
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG accelerator s admin portalom, Teams integracijom i opcijama PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Višeagentna MCP orkestracijska referentna aplikacija sa serverima u .NET, Python, Java i TypeScript
  - **azd-ai-starter** — Minimalni Azure AI infrastrukturalni Bicep startni predložak
  - **🔗 Link na Awesome AZD AI galeriju** — Referenca na [awesome-azd AI galeriju](https://azure.github.io/awesome-azd/?tags=ai) (80+ predložaka)

#### Ispravljeno
- **🔗 Navigacija u agents.md**: Linkovi Prethodno/Sljedeće sada odgovaraju redoslijedu lekcija u Chapter 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Pokvareni linkovi u agents.md**: `production-ai-practices.md` ispravljeno u `../chapter-08-production/production-ai-practices.md` (3 pojave)
- **📦 Zastarjeli kod u agents.md**: Zamijenjen `opencensus` s `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Neispravan API u agents.md**: Premješten `max_tokens` iz `create_agent()` u `create_run()` kao `max_completion_tokens`
- **🔢 Prebrojavanje tokena u agents.md**: Zamijenjena gruba procjena `len//4` s `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Ispravljene usluge s "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (zadani host promijenjen u listopadu 2024)
- **contoso-chat**: Ažuriran opis da referira Azure AI Foundry + Prompty, usklađeno sa stvarnim naslovom i tehnološkim stolom repozitorija

#### Uklonjeno
- **ai-document-processing**: Uklonjena referenca na nefunkcionalni predložak (repozitorij nije javno dostupan kao AZD predložak)

#### Poboljšano
- **📝 Vježbe u agents.md**: Vježba 1 sada prikazuje očekivani izlaz i korak `azd monitor`; Vježba 2 uključuje kompletan kod registracije `FunctionTool`; Vježba 3 zamjenjuje nejasne upute konkretnih naredbi `prepdocs.py`
- **📚 Resursi u agents.md**: Ažurirani linkovi na dokumentaciju za Azure AI Agent Service i brzi početak
- **📋 Tablica narednih koraka u agents.md**: Dodan link na AI Workshop Lab za potpunu pokrivenost poglavlja

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
**Ova verzija poboljšava navigaciju poglavljima README.md datoteke s poboljšanim oblikom tablice.**

#### Promjene
- **Tablica karte tečaja**: Poboljšana s izravnim poveznicama na lekcije, procjenama trajanja i ocjenama složenosti
- **Čišćenje mapa**: Uklonjene suvišne stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validacija veza**: Sve 21+ unutarnje veze u tablici karte tečaja potvrđene

### [v3.16.0] - 2026-02-05

#### Ažuriranja naziva proizvoda
**Ova verzija ažurira reference proizvoda prema trenutačnom Microsoftovom brendiranju.**

#### Promjene
- **Microsoft Foundry → Microsoft Foundry**: Sve reference ažurirane u svim datotekama osim prijevoda
- **Azure AI Agent Service → Foundry Agents**: Ime usluge ažurirano radi usklađenosti s trenutačnim brendiranjem

#### Ažurirane datoteke
- `README.md` - Glavna stranica tečaja
- `changelog.md` - Povijest verzija
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodič za AI agente
- `examples/README.md` - Dokumentacija primjera
- `workshop/README.md` - Ulazna stranica radionice
- `workshop/docs/index.md` - Indeks radionice
- `workshop/docs/instructions/*.md` - Sve upute za radionicu

---

### [v3.15.0] - 2026-02-05

#### Velika restrukturacija repozitorija: Mapama po poglavljima
**Ova verzija restrukturira dokumentaciju u posvećene mape poglavlja radi jasnije navigacije.**

#### Preimenovanja mapa
Stare mape zamijenjene su mapama označenim brojem poglavlja:
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Dodano
- **📚 README datoteke poglavlja**: Kreirana README.md u svakoj mapi poglavlja sa:
  - Ciljevi učenja i trajanje
  - Tablica lekcija sa opisima
  - Brzi start naredbe
  - Navigacija na druga poglavlja

#### Promijenjeno
- **🔗 Ažurirani svi interni linkovi**: Ažurirano više od 78 putanja u svim dokumentacijskim datotekama
- **🗺️ Glavni README.md**: Ažurirana karta tečaja s novom strukturom poglavlja
- **📝 examples/README.md**: Ažurirane unakrsne reference na mape poglavlja

#### Uklonjeno
- Stara struktura mapa (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturiranje repozitorija: Navigacija poglavljima
**Ova verzija dodaje README datoteke za navigaciju poglavljima (zamijenjeno verzijom v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novi vodič za AI agente
**Ova verzija dodaje sveobuhvatan vodič za implementaciju AI agenata koristeći Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Potpuni vodič koji obuhvaća:
  - Što su AI agenti i kako se razlikuju od chatbotova
  - Tri predloška za brz start agenata (Foundry Agents, Prompty, RAG)
  - Arhitektonski obrasci agenata (pojedinačni agent, RAG, multi-agent)
  - Konfiguracija i prilagodba alata
  - Praćenje i analitika metrika
  - Troškovi i optimizacija
  - Uobičajeni scenariji rješavanja problema
  - Tri praktične vježbe s kriterijima uspjeha

#### Struktura sadržaja
- **Uvod**: Koncepti agenata za početnike
- **Brzi start**: Implementacija agenata s `azd init --template get-started-with-ai-agents`
- **Arhitektonski obrasci**: Vizualni dijagrami obrazaca agenata
- **Konfiguracija**: Postavljanje alata i varijable okruženja
- **Praćenje**: Integracija s Application Insights
- **Vježbe**: Postupno praktično učenje (20-45 minuta svaka)

---

### [v3.12.0] - 2026-02-05

#### Ažuriranje DevContainer okruženja
**Ova verzija ažurira konfiguraciju razvojne kutije s modernim alatima i boljim zadanim postavkama za AZD iskustvo učenja.**

#### Promijenjeno
- **🐳 Osnovna slika (Base Image)**: Ažurirana s `python:3.12-bullseye` na `python:3.12-bookworm` (najnoviji stabilni Debian)
- **📛 Ime kontejnera**: Preimenovano iz "Python 3" u "AZD za početnike" radi jasnosti

#### Dodano
- **🔧 Nove značajke Dev Container-a**:
  - `azure-cli` s omogućenjem podrške za Bicep
  - `node:20` (LTS verzija za AZD predloške)
  - `github-cli` za upravljanje predlošcima
  - `docker-in-docker` za implementacije kontejnerskih aplikacija

- **🔌 Prosljeđivanje portova**: Predefinirani portovi za uobičajeni razvoj:
  - 8000 (MkDocs pregled)
  - 3000 (Web aplikacije)
  - 5000 (Python Flask)
  - 8080 (API-jevi)

- **🧩 Nove VS Code ekstenzije**:
  - `ms-python.vscode-pylance` - Poboljšani Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podrška za Azure Functions
  - `ms-azuretools.vscode-docker` - Podrška za Docker
  - `ms-azuretools.vscode-bicep` - Podrška za Bicep jezik
  - `ms-azure-devtools.azure-resource-groups` - Upravljanje Azure resursima
  - `yzhang.markdown-all-in-one` - Uređivanje Markdowna
  - `DavidAnson.vscode-markdownlint` - Markdown provjera stila
  - `bierner.markdown-mermaid` - Podrška za Mermaid dijagrame
  - `redhat.vscode-yaml` - Podrška za YAML (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Git repozitorija
  - `mhutchie.git-graph` - Povijest Git promjena

- **⚙️ VS Code postavke**: Dodane zadane postavke za Python interpreter, automatsko formatiranje pri spremanju i uklanjanje suvišnih razmaka

- **📦 Ažurirane requirements-dev.txt**:
  - Dodan MkDocs minify dodatak
  - Dodan pre-commit za kvalitetu koda
  - Dodani Azure SDK paketi (azure-identity, azure-mgmt-resource)

#### Ispravljeno
- **Post-Create naredba**: Sada provjerava instalaciju AZD i Azure CLI pri pokretanju kontejnera

---

### [v3.11.0] - 2026-02-05

#### README prilagođen početnicima
**Ova verzija značajno poboljšava README.md kako bi bio pristupačniji početnicima i dodaje ključne resurse za AI developere.**

#### Dodano
- **🆚 Usporedba Azure CLI i AZD**: Jasan prikaz kada koristiti koji alat s praktičnim primjerima
- **🌟 Odlični AZD linkovi**: Izravni linkovi na galeriju predložaka zajednice i resurse za doprinos:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ spremnih predložaka za implementaciju
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Doprinos zajednici
- **🎯 Vodič za brz start**: Jednostavan 3-korak odjeljak za početak (Instaliraj → Prijavi se → Implementiraj)
- **📊 Tablica navigacije temeljena na iskustvu**: Jasne upute gdje započeti na temelju razine razvijatelja

#### Promijenjeno
- **Struktura README datoteke**: Preuređeno za progresivno otkrivanje - ključne informacije prve
- **Uvodni dio**: Prepisano za objašnjenje "Čarolije `azd up`" za potpune početnike
- **Uklonjen duplicirani sadržaj**: Eliminiran duplicirani odjeljak za rješavanje problema

- **Naredbe za rješavanje problema**: Ispravljena referenca `azd logs` za korištenje valjanog `azd monitor --logs`

#### Ispravljeno

- **🔐 Autentikacijski naredbeni redci**: Dodani `azd auth login` i `azd auth logout` u cheat-sheet.md
- **Nevažeće reference naredbi**: Uklonjen preostali `azd logs` iz odjeljka za rješavanje problema u README

#### Bilješke
- **Opseg**: Promjene primijenjene na glavni README.md i resources/cheat-sheet.md
- **Ciljana publika**: Poboljšanja posebno usmjerena na developere nove u AZD

---

### [v3.10.0] - 2026-02-05

#### Ažuriranje točnosti naredbi Azure Developer CLI
**Ova verzija ispravlja nepostojeće AZD naredbe kroz dokumentaciju, osiguravajući da svi primjeri koda koriste valjanu sintaksu Azure Developer CLI.**

#### Ispravljeno
- **🔧 Uklonjene nepostojeće AZD naredbe**: Sveobuhvatna revizija i ispravak nevažećih naredbi:
  - `azd logs` (ne postoji) → zamijenjeno s `azd monitor --logs` ili Azure CLI alternativama
  - `azd service` podnaredbe (ne postoje) → zamijenjeno `azd show` i Azure CLI
  - `azd infra import/export/validate` (ne postoje) → uklonjeno ili zamijenjeno valjanim alternativama
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` zastavice (ne postoje) → uklonjeno
  - `azd provision --what-if/--rollback` zastavice (ne postoje) → ažurirano na korištenje `--preview`
  - `azd config validate` (ne postoji) → zamijenjeno s `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne postoje) → uklonjeno

- **📚 Datoteke ažurirane s ispravcima naredbi**:
  - `resources/cheat-sheet.md`: Velika prenamjena referentnih naredbi
  - `docs/deployment/deployment-guide.md`: Ispravljene strategije vraćanja i implementacije
  - `docs/troubleshooting/debugging.md`: Ispravljeni odjeljci za analizu zapisa
  - `docs/troubleshooting/common-issues.md`: Ažurirane naredbe za rješavanje problema
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljeno AZD otklanjanje pogrešaka
  - `docs/getting-started/azd-basics.md`: Ispravljene naredbe za nadzor
  - `docs/getting-started/first-project.md`: Ažurirani primjeri nadzora i otklanjanja pogrešaka
  - `docs/getting-started/installation.md`: Ispravljeni primjeri pomoći i verzije
  - `docs/pre-deployment/application-insights.md`: Ispravljene naredbe za pregled zapisa
  - `docs/pre-deployment/coordination-patterns.md`: Ispravljene naredbe za otklanjanje pogrešaka agenta

- **📝 Ažurirana referenca verzije**: 
  - `docs/getting-started/installation.md`: Promijenjena tvrdo kodirana verzija `1.5.0` u generičku `1.x.x` s vezom na izdanja

#### Promijenjeno
- **Strategije vraćanja**: Ažurirana dokumentacija za korištenje vraćanja temeljenog na Gitu (AZD nema ugrađeno vraćanje)
- **Pregled zapisa**: Zamijenjene reference `azd logs` s `azd monitor --logs`, `azd monitor --live` i Azure CLI naredbama
- **Odjeljak o performansama**: Uklonjene nepostojeće paralelne/incrementalne zastavice implementacije, pružene valjane alternative

#### Tehnički detalji
- **Valjane AZD naredbe**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valjane `azd monitor` zastavice**: `--live`, `--logs`, `--overview`
- **Uklonjene značajke**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Bilješke
- **Verifikacija**: Naredbe su provjerene protiv Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Završetak radionice i ažuriranje kvalitete dokumentacije
**Ova verzija dovršava interaktivne modules radionice, ispravlja sve pokvarene veze u dokumentaciji i poboljšava ukupnu kvalitetu sadržaja za AI developere koji koriste Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Novi dokument s pravilima doprinosa koji uključuje:
  - Jasne upute za prijavu problema i prijedloge promjena
  - Standarde dokumentacije za novi sadržaj
  - Smjernice za primjere koda i konvencije poruka prihvata
  - Informacije o angažmanu zajednice

#### Dovršeno
- **🎯 Modul radionice 7 (Zaključak)**: Potpuno dovršen modul zaključka s:
  - Sveobuhvatan sažetak postignuća radionice
  - Sekciju s ključnim konceptima naučenim o AZD-u, predlošcima i Microsoft Foundry
  - Preporuke za nastavak učenja
  - Vježbe izazova radionice s ocjenama težine
  - Povratne informacije zajednice i poveznice za podršku

- **📚 Modul radionice 3 (Deconstruct)**: Ažurirani ciljevi učenja s:
  - Vodičem za GitHub Copilot s MCP serverima
  - Razumijevanjem strukture mape AZD predložaka
  - Uzorcima organizacije infrastrukture kao koda (Bicep)
  - Uputama za praktične laboratorijske vježbe

- **🔧 Modul radionice 6 (Teardown)**: Dovršen s:
  - Ciljevima čišćenja resursa i upravljanja troškovima
  - Korištenjem `azd down` za sigurno deprovisioniranje infrastrukture
  - Vodičem za oporavak soft-obrisanih kognitivnih servisa
  - Bonus prijedlozima za istraživanje GitHub Copilot i Azure Portal

#### Ispravljeno
- **🔗 Popravljanje pokvarenih veza**: Riješeno 15+ pokvarenih internih veza u dokumentaciji:
  - `docs/ai-foundry/ai-model-deployment.md`: Ispravljeni putevi do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljeni putovi ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamijenjeno nepostojeće cicd-integration.md s deployment-guide.md
  - `examples/retail-scenario.md`: Ispravljeni putevi za FAQ i vodič za rješavanje problema
  - `examples/container-app/microservices/README.md`: Ispravljeni putovi za početnu stranicu tečaja i vodič za implementaciju
  - `resources/faq.md` i `resources/glossary.md`: Ažurirane reference poglavlja o AI-u
  - `course-outline.md`: Ispravljeni vodiči instruktora i laboratorijske reference AI radionice

- **📅 Statusni banner radionice**: Ažuriran s "U izradi" na aktivan status radionice s datumom veljače 2026.

- **🔗 Navigacija radionice**: Popravljene pokvarene navigacijske veze u README.md radionice koje su upućivale na nepostojeću mapu lab-1-azd-basics

#### Promijenjeno
- **Prezentacija radionice**: Uklonjena upozorenja o "u izradi", radionica je sada dovršena i spremna za upotrebu
- **Dosljednost navigacije**: Osigurana pravilna međumodulska navigacija u svim modulima radionice
- **Reference na putove učenja**: Ažurirane međureferencije poglavlja radi ispravnih microsoft-foundry putova

#### Verificirano
- ✅ Sve engleske markdown datoteke imaju valjane interne veze
- ✅ Moduli radionice 0-7 su dovršeni s ciljevima učenja
- ✅ Navigacija između poglavlja i modula radi ispravno
- ✅ Sadržaj je prikladan za AI developere koji koriste Microsoft AZD
- ✅ Očuvan je pristupačan jezik i struktura za početnike kroz cijeli sadržaj
- ✅ CONTRIBUTING.md pruža jasne smjernice za suradnike iz zajednice

#### Tehnička implementacija
- **Validacija veza**: Automatski PowerShell skripta provjerila sve interne veze u .md datotekama
- **Revizija sadržaja**: Ručni pregled dovršenosti radionice i prikladnosti za početnike
- **Sustav navigacije**: Primijenjeni dosljedni obrasci za navigaciju poglavljima i modulima

#### Bilješke
- **Opseg**: Promjene primijenjene samo na englesku dokumentaciju
- **Prijevodi**: Mape prijevoda nisu ažurirane u ovoj verziji (automatizirani prijevod će se sinkronizirati kasnije)
- **Trajanje radionice**: Dovršena radionica sada pruža 3-4 sata praktičnog učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: nadzor, sigurnost i obrasci za višestruke agente
**Ova verzija dodaje sveobuhvatne lekcije vrhunske kvalitete o integraciji Application Insights, obrascima autentikacije i koordinacije višestrukih agenata za produkcijske implementacije.**

#### Dodano
- **📊 Lekcija o integraciji Application Insights**: u `docs/pre-deployment/application-insights.md`:
  - Implementacija usmjerena na AZD s automatskim provisioniranjem
  - Potpuni Bicep predlošci za Application Insights + Log Analytics
  - Radne Python aplikacije s prilagođenom telemetrijom (1.200+ linija)
  - Obrasci nadzora AI/LLM (praćenje tokena/troškova Microsoft Foundry modela)
  - 6 Mermaid dijagrama (arhitektura, distribuirano praćenje, protok telemetrije)
  - 3 praktične vježbe (alerti, nadzorne ploče, AI nadzor)
  - Primjeri Kusto upita i strategije optimizacije troškova
  - Streaming metrika uživo i otklanjanje pogrešaka u stvarnom vremenu
  - Vrijeme učenja 40-50 minuta s proizvodnim obrascima

- **🔐 Lekcija o obrascima autentikacije i sigurnosti**: u `docs/getting-started/authsecurity.md`:
  - 3 obrasca autentikacije (poveznički nizovi, Key Vault, upravljani identitet)
  - Potpuni Bicep predlošci infrastrukture za sigurne implementacije
  - Node.js kod aplikacije s Azure SDK integracijom
  - 3 praktične vježbe (omogućavanje upravljanog identiteta, korisnički dodijeljen identitet, rotacija Key Vaulta)
  - Najbolje sigurnosne prakse i konfiguracije RBAC-a
  - Vodič za rješavanje problema i analiza troškova
  - Produkcijski obrasci autentikacije bez lozinke

- **🤖 Lekcija o obrascima koordinacije višestrukih agenata**: u `docs/pre-deployment/coordination-patterns.md`:
  - 5 obrazaca koordinacije (sekvencijalni, paralelni, hijerarhijski, događajno vođen, konsenzus)
  - Potpuna implementacija orchestrator servisa (Python/Flask, 1.500+ linija)
  - 3 specijalizirane implementacije agenata (Istraživač, Pisac, Urednik)
  - Integracija Service Bus-a za poručivanje
  - Upravljanje stanjem pomoću Cosmos DB za distribuirane sustave
  - 6 Mermaid dijagrama koji prikazuju interakcije agenata
  - 3 napredne vježbe (upravljanje prekidom, logika ponavljanja, prekidač električnog kruga)
  - Analiza troškova (240-565 $/mj) sa strategijama optimizacije
  - Integracija Application Insights za nadzor

#### Poboljšano
- **Poglavlje prije implementacije**: Sada uključuje sveobuhvatne obrasce nadzora i koordinacije
- **Poglavlje za početnike**: Poboljšano profesionalnim obrascima autentikacije
- **Spremnost za produkciju**: Potpuni pregled od sigurnosti do vidljivosti
- **Prikaz tečaja**: Ažurirano za referencu na nove lekcije u Poglavljima 3 i 6

#### Promijenjeno
- **Napredak učenja**: Bolja integracija sigurnosti i nadzora kroz cijeli tečaj
- **Kvaliteta dokumentacije**: Dosljedni A-sadržajni standardi (95–97%) u novim lekcijama
- **Produkcijski obrasci**: Potpuni pokrivači za enterprise implementacije od početka do kraja

#### Poboljšano
- **Iskustvo developera**: Jasna staza od razvoja do produkcijskog nadzora
- **Sigurnosni standardi**: Profesionalni obrasci za autentikaciju i upravljanje tajnama
- **Vidljivost**: Potpuna integracija Application Insights s AZD-om
- **AI radni opterećenja**: Specijalizirani nadzor za Microsoft Foundry modele i sustave višestrukih agenata

#### Verificirano
- ✅ Sve lekcije uključuju potpuno radni kod (nije samo isječak)
- ✅ Mermaid dijagrami za vizualno učenje (ukupno 19 kroz 3 lekcije)
- ✅ Praktične vježbe s koracima provjere (ukupno 9)
- ✅ Produkcijski Bicep predlošci spremni za implementaciju preko `azd up`
- ✅ Analiza troškova i strategije optimizacije
- ✅ Vodiči za rješavanje problema i najbolje prakse
- ✅ Provjere znanja s naredbama za verifikaciju

#### Rezultati ocjenjivanja dokumentacije
- **docs/pre-deployment/application-insights.md**: - Sveobuhvatan vodič za nadzor
- **docs/getting-started/authsecurity.md**: - Profesionalni sigurnosni obrasci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne arhitekture za višestruke agente
- **Ukupan novi sadržaj**: - Dosljedni standardi visoke kvalitete

#### Tehnička implementacija
- **Application Insights**: Log Analytics + prilagođena telemetrija + distribuirano praćenje
- **Autentikacija**: Upravljani identitet + Key Vault + RBAC obrasci
- **Višestruki agenti**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Nadzor**: Metrike uživo + Kusto upiti + alerti + nadzorne ploče
- **Upravljanje troškovima**: Strategije uzorkovanja, politike zadržavanja, kontrola budžeta

### [v3.7.0] - 2025-11-19

#### Poboljšanja kvalitete dokumentacije i novi primjer Microsoft Foundry modela
**Ova verzija poboljšava kvalitetu dokumentacije u cijelom spremištu i dodaje potpuni primjer implementacije Microsoft Foundry modela s gpt-4.1 chat sučeljem.**

#### Dodano
- **🤖 Primjer Microsoft Foundry modela za chat**: Potpuna implementacija gpt-4.1 s radnim primjerom u `examples/azure-openai-chat/`:
  - Potpuna infrastruktura Microsoft Foundry modela (implementacija modela gpt-4.1)
  - Python sučelje naredbenog retka za chat s poviješću razgovora
  - Integracija Key Vaulta za sigurnu pohranu API ključeva
  - Praćenje upotrebe tokena i procjena troškova
  - Ograničenja brzine i upravljanje greškama
  - Sveobuhvatan README s vodičem za implementaciju od 35-45 minuta
  - 11 proizvodnih datoteka (Bicep predlošci, Python aplikacija, konfiguracija)
- **📚 Vježbe dokumentacije**: Dodane praktične vježbe u vodiču za konfiguraciju:
  - Vježba 1: Konfiguracija za više okruženja (15 minuta)
  - Vježba 2: Praksa upravljanja tajnama (10 minuta)
  - Jasni kriteriji uspjeha i koraci provjere
- **✅ Verifikacija implementacije**: Dodan odjeljak za provjeru u vodiču za implementaciju:
  - Postupci provjere statusa zdravlja
  - Popis kriterija uspjeha
  - Očekivani izlazi za sve naredbe implementacije
  - Brzi pregled rješavanja problema

#### Poboljšano
- **examples/README.md**: Ažuriran na kvalitetu A klase (93%):
  - Dodan azure-openai-chat u sve relevantne sekcije
  - Ažuriran broj lokalnih primjera s 3 na 4
  - Dodano u tablicu primjera AI aplikacija
  - Integrirano u Brzi početak za srednje korisnike
  - Dodano u odjeljak Microsoft Foundry predlošaka
  - Ažurirane sekcije matrice usporedbe i pronalaženja tehnologije
- **Kvaliteta dokumentacije**: Poboljšano s B+ (87%) na A- (92%) unutar mape docs

  - Dodani očekivani ishodi za primjere kritičnih naredbi
  - Uključeni koraci verifikacije za promjene konfiguracije
  - Poboljšano praktično učenje s praktičnim vježbama

#### Promijenjeno
- **Napredak u učenju**: Bolja integracija AI primjera za srednje napredne korisnike
- **Struktura dokumentacije**: Više primjenjivih vježbi s jasnim ishodima
- **Proces verifikacije**: Dodani eksplicitni kriteriji uspjeha u ključnim tijekovima rada

#### Poboljšano
- **Iskustvo programera**: Implementacija Microsoft Foundry Models sada traje 35-45 minuta (naspram 60-90 za složene alternative)
- **Transparentnost troškova**: Jasne procjene troškova (50-200 $/mjesečno) za primjer Microsoft Foundry Models
- **Put učenja**: AI programeri imaju jasnu početnu točku s azure-openai-chat
- **Standardi dokumentacije**: Dosljedni očekivani ishodi i koraci verifikacije

#### Validirano
- ✅ Primjer Microsoft Foundry Models potpuno funkcionalan s `azd up`
- ✅ Svi 11 implementacijskih datoteka sintaktički ispravni
- ✅ Upute u README-u odgovaraju stvarnom iskustvu implementacije
- ✅ Linkovi u dokumentaciji ažurirani na više od 8 lokacija
- ✅ Indeks primjera točno odražava 4 lokalna primjera
- ✅ Nema dupliciranih vanjskih linkova u tablicama
- ✅ Sve navigacijske reference su ispravne

#### Tehnička implementacija
- **Arhitektura Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps uzorak
- **Sigurnost**: Managed Identity spreman, tajne u Key Vault
- **Nadzor**: Integracija Application Insights
- **Upravljanje troškovima**: Praćenje tokena i optimizacija korištenja
- **Implementacija**: Jedna `azd up` naredba za potpunu postavu

### [v3.6.0] - 2025-11-19

#### Veliko ažuriranje: Primjeri implementacije Container App
**Ova verzija donosi sveobuhvatne, proizvodno spremne primjere implementacije kontejnerskih aplikacija pomoću Azure Developer CLI (AZD), s kompletnom dokumentacijom i integracijom u put učenja.**

#### Dodano
- **🚀 Primjeri Container App**: Novi lokalni primjeri u `examples/container-app/`:
  - [Glavni vodič](examples/container-app/README.md): Potpun pregled kontejneriziranih implementacija, brz početak, proizvodnja i napredni obrasci
  - [Jednostavni Flask API](../../examples/container-app/simple-flask-api): Pristupačan REST API za početnike s scale-to-zero, health probes, nadzor i otklanjanje poteškoća
  - [Mikroservisna arhitektura](../../examples/container-app/microservices): Proizvodno spremna implementacija s više servisa (API Gateway, Product, Order, User, Notification), asinhrona poruka, Service Bus, Cosmos DB, Azure SQL, distribuirano praćenje, blue-green/canary implementacija
- **Najbolje prakse**: Sigurnost, nadzor, optimizacija troškova i smjernice za CI/CD za kontejnerizirane radne zadatke
- **Primjeri koda**: Kompletni `azure.yaml`, Bicep predlošci i višeslojne implementacije servisa (Python, Node.js, C#, Go)
- **Testiranje i otklanjanje poteškoća**: Krajnje-krajnji testni scenariji, naredbe za nadzor, smjernice za otklanjanje poteškoća

#### Promijenjeno
- **README.md**: Ažuriran za isticanje i povezivanje novih primjera Container App pod "Lokalni primjeri - Kontejnerske aplikacije"
- **examples/README.md**: Ažuriran za isticanje primjera Container App, dodavanje unosa u matricu usporedbe i ažuriranje tehnoloških/arhitektonskih referenci
- **Osnovna struktura tečaja & vodič za učenje**: Ažurirana za referenciranje novih primjera Container App i obrazaca implementacije u relevantnim poglavljima

#### Validirano
- ✅ Svi novi primjeri mogu se implementirati s `azd up` i slijede najbolje prakse
- ✅ Unakrsni linkovi u dokumentaciji i navigacija ažurirani
- ✅ Primjeri pokrivaju scenarije od početničkih do naprednih, uključujući proizvodne mikroservise

#### Bilješke
- **Opseg**: Dokumentacija i primjeri samo na engleskom jeziku
- **Daljnji koraci**: Proširenje s dodatnim naprednim obrascima kontejnera i automatizacijom CI/CD u budućim izdanjima

### [v3.5.0] - 2025-11-19

#### Promjena imena proizvoda: Microsoft Foundry
**Ova verzija provodi sveobuhvatnu promjenu naziva proizvoda iz "Microsoft Foundry" u "Microsoft Foundry" u svim engleskim dokumentacijama, odražavajući službeni rebranding tvrtke Microsoft.**

#### Promijenjeno
- **🔄 Ažuriranje naziva proizvoda**: Potpuni rebranding iz "Microsoft Foundry" u "Microsoft Foundry"
  - Ažurirani svi reference u engleskoj dokumentaciji u folderu `docs/`
  - Preimenovan folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Ukupno: ažurirano 23 reference sadržaja u 7 datoteka dokumentacije

- **📁 Promjene strukture foldera**:
  - `docs/ai-foundry/` preimenovan u `docs/microsoft-foundry/`
  - Ažurirane sve međureferencijske veze da odražavaju novu strukturu foldera
  - Validirane veze za navigaciju kroz svu dokumentaciju

- **📄 Preimenovanja datoteka**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Sve interne poveznice ažurirane da upućuju na novo ime datoteke

#### Ažurirane datoteke
- **Poglavlja dokumentacije** (7 datoteka):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ažuriranja navigacijskih linkova
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ažuriranja referenci naziva proizvoda
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Već koristi Microsoft Foundry (iz prethodnih ažuriranja)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 ažuriranja (pregled, povratne informacije zajednice, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 ažuriranja međureferencijskih linkova
  - `docs/getting-started/first-project.md` - 2 ažuriranja navigacijskih linkova poglavlja
  - `docs/getting-started/installation.md` - 2 ažuriranja linkova sljedećih poglavlja
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 ažuriranja (navigacija, Discord zajednica)
  - `docs/troubleshooting/common-issues.md` - 1 ažuriranje navigacijskog linka
  - `docs/troubleshooting/debugging.md` - 1 ažuriranje navigacijskog linka

- **Struktura datoteka tečaja** (2 datoteke):
  - `README.md` - 17 ažuriranih referenci (pregled tečaja, naslovi poglavlja, odjeljak predložaka, uvidi zajednice)
  - `course-outline.md` - 14 ažuriranih referenci (pregled, ciljevi učenja, resursi poglavlja)

#### Validirano
- ✅ Nema preostalih referenci na folder putanju "ai-foundry" u engleskoj dokumentaciji
- ✅ Nema preostalih referenci na naziv proizvoda "Microsoft Foundry" u engleskoj dokumentaciji
- ✅ Sve navigacijske veze su funkcionalne s novom strukturom foldera
- ✅ Preimenovanja datoteka i foldera izvršena uspješno
- ✅ Validirane međureferencijske veze među poglavljima

#### Bilješke
- **Opseg**: Promjene primijenjene samo na englesku dokumentaciju u folderu `docs/`
- **Prijevodi**: Folderi za prijevod (`translations/`) nisu ažurirani u ovoj verziji
- **Radionica**: Materijali za radionicu (`workshop/`) nisu ažurirani u ovoj verziji
- **Primjeri**: Datoteke primjera mogu još uvijek sadržavati stare nazive (bit će riješeno u budućim ažuriranjima)
- **Vanjski linkovi**: Vanjske URL-ove i GitHub repozitorij reference ostaju nepromijenjene

#### Vodič za migraciju za suradnike
Ako imate lokalne grane ili dokumentaciju koja referencira staru strukturu:
1. Ažurirajte reference na foldere: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ažurirajte reference datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamijenite naziv proizvoda: "Microsoft Foundry" → "Microsoft Foundry"
4. Validirajte da sve interne poveznice u dokumentaciji i dalje funkcionišu

---

### [v3.4.0] - 2025-10-24

#### Poboljšanja pregleda i verifikacije infrastrukture
**Ova verzija uvodi sveobuhvatnu podršku za novu funkcionalnost pregleda u Azure Developer CLI i poboljšava korisničko iskustvo radionice.**

#### Dodano
- **🧪 azd provision --preview Dokumentacija funkcionalnosti**: Sveobuhvatno pokrivanje nove mogućnosti pregleda infrastrukture
  - Referenca naredbi i primjeri upotrebe u cheat sheetu
  - Detaljna integracija u vodiču za provisioniranje s primjerima i prednostima
  - Integracija provjere prije leta za sigurniju verifikaciju implementacije
  - Ažuriranja vodiča za početak rada s praksama sigurnog implementiranja
- **🚧 Banner statusa radionice**: Profesionalni HTML banner koji pokazuje status razvoja radionice
  - Gradientni dizajn s indikatorima izgradnje radi jasne komunikacije korisnicima
  - Zapis zadnjeg ažuriranja za transparentnost
  - Dizajn prilagođen mobilnim uređajima

#### Poboljšano
- **Sigurnost infrastrukture**: Funkcionalnost pregleda integrirana kroz dokumentaciju implementacije
- **Verifikacija prije implementacije**: Automatski skripti sada uključuju testiranje pregleda infrastrukture
- **Radni proces za programere**: Ažurirana sekvenca naredbi uključuje pregled kao najbolju praksu
- **Iskustvo radionice**: Korisnicima postavljeni jasni očekivanja o statusu sadržaja

#### Promijenjeno
- **Najbolje prakse implementacije**: Preporučeni tijek rada je sada prvo pregled
- **Tok dokumentacije**: Verifikacija infrastrukture premještena ranije u proces učenja
- **Prezentacija radionice**: Profesionalna komunikacija statusa s jasnim vremenskim okvirom razvoja

#### Poboljšano
- **Pristup usmjeren na sigurnost**: Infrastrukturne promjene sada se mogu verifikovati prije implementacije
- **Suradnja tima**: Rezultati pregleda mogu se dijeliti na pregled i odobrenje
- **Svijest o troškovima**: Bolje razumijevanje cijena resursa prije provisioniranja
- **Smanjenje rizika**: Smanjenje neuspjeha implementacije putem ranije verifikacije

#### Tehnička implementacija
- **Integracija više dokumenata**: Funkcionalnost pregleda dokumentirana u 4 ključne datoteke
- **Obrasci naredbi**: Dosljedna sintaksa i primjeri kroz cijelu dokumentaciju
- **Integracija najbolje prakse**: Pregled uključen u tokove rada verifikacije skripti
- **Vizualni indikatori**: Jasno označene NOVE funkcije radi lakše otkrivnosti

#### Infrastruktura radionice
- **Komunikacija statusa**: Profesionalni HTML banner s gradijentnim stilom
- **Korisničko iskustvo**: Jasan status razvoja sprječava zabunu
- **Profesionalna prezentacija**: Održava kredibilitet repozitorija dok postavlja očekivanja
- **Transparentnost vremenskog okvira**: Zapis zadnjeg ažuriranja u listopadu 2025. za odgovornost

### [v3.3.0] - 2025-09-24

#### Poboljšani materijali radionice i interaktivno iskustvo učenja
**Ova verzija donosi sveobuhvatne materijale radionice s vodičima baziranim na pregledniku i strukturiranim putevima učenja.**

#### Dodano
- **🎥 Interaktivni vodič radionice**: Iskustvo radionice u pregledniku s mogućnošću pregleda MkDocs
- **📝 Strukturirane upute za radionicu**: 7-korak vođeni put učenja od otkrivanja do prilagodbe
  - 0-Uvod: Pregled i postavljanje radionice
  - 1-Odabir AI predloška: Proces otkrivanja i odabira predložaka
  - 2-Verifikacija AI predloška: Postupci implementacije i verifikacije
  - 3-Razlaganje AI predloška: Razumijevanje arhitekture predloška
  - 4-Konfiguracija AI predloška: Konfiguracija i prilagodba
  - 5-Prilagodba AI predloška: Napredne izmjene i iteracije
  - 6-Razgradnja infrastrukture: Čišćenje i upravljanje resursima
  - 7-Zaključenje: Sažetak i sljedeći koraci
- **🛠️ Alati za radionicu**: MkDocs konfiguracija s temom Material za poboljšano iskustvo učenja
- **🎯 Praktični put učenja**: Metodologija od 3 koraka (Otkriće → Implementacija → Prilagodba)
- **📱 Integracija GitHub Codespaces**: Bešavno postavljanje razvojne okoline

#### Poboljšano
- **AI laboratorij radionice**: Proširen s obuhvatnim 2-3 satnim strukturiranim iskustvom učenja
- **Dokumentacija radionice**: Profesionalna prezentacija s navigacijom i vizualnim pomagalima
- **Napredak u učenju**: Jasno vođenje korak-po-korak od odabira predloška do proizvodne implementacije
- **Iskustvo programera**: Integrirani alati za pojednostavljene razvojne tokove

#### Poboljšano
- **Pristupačnost**: Sučelje bazirano na pregledniku s funkcijama pretraživanja, kopiranja i promjene teme
- **Učenje vlastitim tempom**: Fleksibilna struktura radionice prilagođava se različitim brzinama učenja
- **Praktična primjena**: Scenariji implementacije stvarnih AI predložaka
- **Integracija zajednice**: Integracija Discorda za podršku i suradnju radionice

#### Značajke radionice
- **Ugrađeno pretraživanje**: Brzo pronalaženje ključnih riječi i lekcija
- **Kopiranje blokova koda**: Funkcija kopiranja pri prelasku mišem preko koda za sve primjere
- **Preklopnik teme**: Podrška za tamni/svijetli način rada za različite preference
- **Vizualni materijali**: Snimke zaslona i dijagrami za bolje razumijevanje
- **Integracija pomoći**: Izravni pristup Discord zajednici za podršku

### [v3.2.0] - 2025-09-17

#### Velika restrukturacija navigacije i sustav učenja po poglavljima
**Ova verzija uvodi sveobuhvatan sustav učenja po poglavljima s poboljšanom navigacijom kroz cijeli repozitorij.**

#### Dodano
- **📚 Sustav učenja po poglavljima**: Preuređen cijeli tečaj u 8 progresivnih poglavlja učenja
  - Poglavlje 1: Osnove i brz početak (⭐ - 30-45 minuta)
  - Poglavlje 2: AI-prvo razvijanje (⭐⭐ - 1-2 sata)
  - Poglavlje 3: Konfiguracija i autentikacija (⭐⭐ - 45-60 minuta)
  - Poglavlje 4: Infrastruktura kao kod i implementacija (⭐⭐⭐ - 1-1,5 sata)
  - Poglavlje 5: AI rješenja s višestrukim agentima (⭐⭐⭐⭐ - 2-3 sata)
  - Poglavlje 6: Verifikacija i planiranje prije implementacije (⭐⭐ - 1 sat)
  - Poglavlje 7: Otklanjanje i ispravljanje problema (⭐⭐ - 1-1,5 sati)
  - Poglavlje 8: Obrazci za proizvodne i enterprise primjene (⭐⭐⭐⭐ - 2-3 sata)
- **📚 Sveobuhvatan navigacijski sustav**: Dosljedni zaglavlja i podnožja navigacije kroz svu dokumentaciju
- **🎯 Praćenje napretka**: Kontrolni popis za dovršetak tečaja i sustav verifikacije učenja
- **🗺️ Smjernice za put učenja**: Jasne ulazne točke za različite razine iskustva i ciljeve
- **🔗 Navigacija međureferencama**: Relevantna poglavlja i preduvjeti jasno povezani

#### Poboljšano
- **Struktura README-a**: Pretvoren u strukturiranu platformu za učenje s organizacijom po poglavljima
- **Navigacija u dokumentaciji**: Svaka stranica sada sadrži kontekst poglavlja i smjernice za napredak
- **Organizacija predložaka**: Primjeri i predlošci mapirani na pripadajuća poglavlja učenja

- **Integracija resursa**: Prečaci, često postavljana pitanja i vodiči za učenje povezani s relevantnim poglavljima
- **Integracija radionica**: Praktične laboratorijske vježbe mapirane na više ciljeva učenja po poglavljima

#### Promijenjeno
- **Napredak u učenju**: Prešli smo s linearne dokumentacije na fleksibilno učenje bazirano na poglavljima
- **Pozicioniranje konfiguracije**: Vodič za konfiguraciju premješten je u Poglavlje 3 radi boljeg toka učenja
- **Integracija AI sadržaja**: Bolja integracija sadržaja specifičnog za AI kroz cijeli proces učenja
- **Sadržaj za proizvodnju**: Napredni obrasci konsolidirani u Poglavlju 8 za učenike na razini poduzeća

#### Poboljšano
- **Korisničko iskustvo**: Jasna navigacija s tragovima i indikatorima napretka kroz poglavlja
- **Pristupačnost**: Dosljedni obrasci navigacije za lakše prolazak kroz tečaj
- **Profesionalna prezentacija**: Struktura tečaja u stilu sveučilišta prikladna za akademsku i korporativnu obuku
- **Učinkovitost u učenju**: Smanjeno vrijeme pronalaska relevantnog sadržaja kroz poboljšanu organizaciju

#### Tehnička implementacija
- **Zaglavlja za navigaciju**: Standardizirana navigacija kroz poglavlja u preko 40 dokumenata
- **Navigacija u podnožju**: Dosljedni vodiči za napredovanje i indikatori završetka poglavlja
- **Unutarnje povezivanje**: Sveobuhvatan sustav međupovezivanja koji povezuje srodne pojmove
- **Mapiranje poglavlja**: Predlošci i primjeri jasno povezani s ciljevima učenja

#### Unapređenje vodiča za učenje
- **📚 Sveobuhvatni ciljevi učenja**: Prestrukturiran vodič za učenje usklađen sa sustavom od 8 poglavlja
- **🎯 Procjena po poglavljima**: Svako poglavlje uključuje specifične ciljeve učenja i praktične vježbe
- **📋 Praćenje napretka**: Tjedni raspored učenja s mjerljivim rezultatima i kontrolnim listama završetka
- **❓ Pitanja za procjenu**: Pitanja za provjeru znanja za svako poglavlje s profesionalnim ishodima
- **🛠️ Praktične vježbe**: Praktične aktivnosti s realnim scenarijima implementacije i rješavanja problema
- **📊 Napredak u vještinama**: Jasno napredovanje od osnovnih pojmova do obrazaca za poduzeća s fokusom na razvoj karijere
- **🎓 Sustav certifikacije**: Ishodi profesionalnog razvoja i sustav priznavanja u zajednici
- **⏱️ Upravljanje vremenom**: Strukturirani plan učenja od 10 tjedana s validacijom ključnih točaka

### [v3.1.0] - 2025-09-17

#### Poboljšana AI rješenja s više agenata
**Ova verzija poboljšava rješenje za maloprodaju s više agenata boljim imenovanjem agenata i unaprijeđenom dokumentacijom.**

#### Promijenjeno
- **Terminologija za više agenata**: Zamijenjen "Cora agent" s "Customer agent" kroz cijelo rješenje za maloprodaju s više agenata radi jasnijeg razumijevanja
- **Arhitektura agenata**: Ažurirana sva dokumentacija, ARM predlošci i primjeri koda da koriste dosljedno ime "Customer agent"
- **Primjeri konfiguracije**: Modernizirani obrasci konfiguracije agenata s ažuriranim pravilima imenovanja
- **Konzistentnost dokumentacije**: Osigurano da svi upućuju na profesionalna, opisna imena agenata

#### Poboljšano
- **Paket ARM predloška**: Ažuriran retail-multiagent-arm-template s referencama Customer agent
- **Sheme arhitekture**: Osvježeni Mermaid dijagrami s ažuriranim imenovanjem agenata
- **Primjeri koda**: Python klase i primjeri implementacije sada koriste imenovanje CustomerAgent
- **Promjenjive okoline**: Ažurirani svi skripti za implementaciju da koriste konvencije CUSTOMER_AGENT_NAME

#### Unaprijeđeno
- **Iskustvo programera**: Jasnije uloge i odgovornosti agenata u dokumentaciji
- **Spremnost za proizvodnju**: Bolja usklađenost s imenovnim konvencijama za poduzeća
- **Materijali za učenje**: Intuitivnije imenovanje agenata za obrazovne svrhe
- **Upotrebljivost predložaka**: Pojednostavljeno razumijevanje funkcija agenata i obrazaca implementacije

#### Tehnički detalji
- Ažurirani Mermaid dijagrami arhitekture s referencama CustomerAgent
- Zamijenjena imena klasa CoraAgent s CustomerAgent u Python primjerima
- Izmijenjene ARM JSON konfiguracije za upotrebu tipa agenta "customer"
- Ažurirane varijable okoline iz CORA_AGENT_* u CUSTOMER_AGENT_* obrasce
- Osvježene sve naredbe za implementaciju i konfiguracije kontejnera

### [v3.0.0] - 2025-09-12

#### Velike promjene - Fokus na AI developere i integracija Microsoft Foundry
**Ova verzija pretvara repozitorij u sveobuhvatan resurs za učenje fokusiran na AI s integracijom Microsoft Foundry.**

#### Dodano
- **🤖 AI-prioritetni put učenja**: Potpuna restrukturacija s prioritetom na AI developere i inženjere
- **Vodič za integraciju Microsoft Foundry**: Sveobuhvatna dokumentacija za povezivanje AZD-a s Microsoft Foundry uslugama
- **Obrasci implementacije AI modela**: Detaljni vodič pokrivajući odabir modela, konfiguraciju i strategije implementacije u produkciji
- **AI radionica**: 2-3 sata praktične radionice za pretvaranje AI aplikacija u AZD-rješive solucije
- **Prakse za proizvodnju AI**: Obrasci spremni za poduzeća za skaliranje, nadzor i osiguranje AI radnih opterećenja
- **Vodič za rješavanje problema specifičnih za AI**: Sveobuhvatno rješavanje problema za Microsoft Foundry modele, kognitivne usluge i AI implementacijske poteškoće
- **Galerija AI predložaka**: Izabrana kolekcija Microsoft Foundry predložaka s ocjenama složenosti
- **Materijali za radionice**: Potpuna struktura radionice s praktičnim laboratorijskim vježbama i referentnim materijalima

#### Poboljšano
- **Struktura README-a**: Fokus na AI developere s 45% interesa zajednice sa Microsoft Foundry Discorda
- **Put učenja**: Namjenski put AI developera uz tradicionalne puteve za studente i DevOps inženjere
- **Preporuke predložaka**: Istaknuti AI predlošci uključuju azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart
- **Integracija zajednice**: Poboljšana podrška zajednici na Discordu s AI-kanalima i diskusijama

#### Sigurnost i proizvodnja
- **Obrasci za upravljane identitete**: Autentikacija i sigurnosne konfiguracije specifične za AI
- **Optimizacija troškova**: Praćenje tokena i kontrole budžeta za AI radna opterećenja
- **Višeregionalna implementacija**: Strategije za globalnu implementaciju AI aplikacija
- **Nadzor performansi**: AI-specifični metrički podaci i integracija s Application Insights

#### Kvaliteta dokumentacije
- **Linearna struktura tečaja**: Logički napredak od početničkih do naprednih obrazaca za implementaciju AI
- **Provjerene URL adrese**: Svi vanjski linkovi repozitorija su provjereni i dostupni
- **Potpuna referenca**: Sve unutarnje veze u dokumentaciji su validirane i funkcionalne
- **Spremno za proizvodnju**: Obrasci implementacije za poduzeća s primjerima iz stvarnog svijeta

### [v2.0.0] - 2025-09-09

#### Velike promjene - Restrukturiranje repozitorija i profesionalno unapređenje
**Ova verzija predstavlja značajnu promjenu strukture repozitorija i prezentacije sadržaja.**

#### Dodano
- **Strukturirani okvir za učenje**: Sve dokumentacijske stranice sada uključuju odjeljke Uvod, Ciljeve učenja i Ishode učenja
- **Sustav navigacije**: Dodane veze Prethodna/Sljedeća lekcija kroz cijelu dokumentaciju za vođeni napredak u učenju
- **Vodič za učenje**: Sveobuhvatni study-guide.md s ciljevima učenja, praktičnim vježbama i materijalima za procjenu
- **Profesionalna prezentacija**: Uklonjeni svi emoji ikoni za bolju pristupačnost i profesionalni izgled
- **Poboljšana struktura sadržaja**: Poboljšana organizacija i tok materijala za učenje

#### Promijenjeno
- **Format dokumentacije**: Standardizirana sva dokumentacija s dosljednom strukturom fokusiranom na učenje
- **Tok navigacije**: Implementiran logički napredak kroz sve materijale za učenje
- **Prezentacija sadržaja**: Uklonjeni ukrasni elementi u korist jasnog, profesionalnog oblikovanja
- **Struktura poveznica**: Ažurirane sve unutarnje veze da podrže novi navigacijski sustav

#### Poboljšano
- **Pristupačnost**: Uklonjene ovisnosti o emojijima radi bolje kompatibilnosti s čitačima ekrana
- **Profesionalni izgled**: Čista, akademski stil prezentacije prikladan za učenje u poduzećima
- **Iskustvo u učenju**: Strukturirani pristup s jasnim ciljevima i ishodima za svaku lekciju
- **Organizacija sadržaja**: Bolji logički tok i povezanost između srodnih tema

### [v1.0.0] - 2025-09-09

#### Početno izdanje - Sveobuhvatan AZD repozitorij za učenje

#### Dodano
- **Osnovna struktura dokumentacije**
  - Potpuni serijal vodiča za početak rada
  - Sveobuhvatna dokumentacija za implementaciju i provisioniranje
  - Detaljni resursi za rješavanje poteškoća i vodiči za ispravljanje grešaka
  - Alati i postupci za provjeru prije implementacije

- **Modul za početak rada**
  - Osnove AZD-a: Temeljni pojmovi i terminologija
  - Vodič za instalaciju: Upute za postavljanje specifične za platformu
  - Vodič za konfiguraciju: Postavljanje okoline i autentikacija
  - Tutorial za prvi projekt: Detaljno učenje korak po korak

- **Modul za implementaciju i provisioniranje**
  - Vodič za implementaciju: Potpuna dokumentacija tijeka rada
  - Vodič za provisioniranje: Infrastruktura kao kod pomoću Bicep-a
  - Najbolje prakse za produkcijske implementacije
  - Obrasci arhitekture za višeservisne sustave

- **Modul za provjeru prije implementacije**
  - Planiranje kapaciteta: Validacija dostupnosti Azure resursa
  - Odabir SKU-a: Sveobuhvatni vodič kroz razine usluga
  - Prethodne kontrole: Automatizirani validacijski skripti (PowerShell i Bash)
  - Alati za procjenu troškova i planiranje budžeta

- **Modul za rješavanje problema**
  - Česti problemi: Često susretani problemi i njihova rješenja
  - Vodič za ispravljanje grešaka: Sustavne metode rješavanja problema
  - Napredne dijagnostičke tehnike i alati
  - Praćenje performansi i optimizacija

- **Resursi i reference**
  - Prečac za naredbe: Brzi pregled bitnih naredbi
  - Rječnik: Sveobuhvatna terminologija i definicije akronima
  - Često postavljana pitanja: Detaljni odgovori na uobičajena pitanja
  - Vanjske poveznice na resurse i zajednicu

- **Primjeri i predlošci**
  - Jednostavan primjer web aplikacije
  - Predložak za implementaciju statične web stranice
  - Konfiguracija aplikacije u kontejneru
  - Obrasci integracije baze podataka
  - Primjeri arhitekture mikroservisa
  - Implementacije serverless funkcija

#### Značajke
- **Podrška za više platformi**: Vodiči za instalaciju i konfiguraciju za Windows, macOS i Linux
- **Više razina vještina**: Sadržaj dizajniran za studente do profesionalnih developera
- **Praktični fokus**: Praktični primjeri i scenariji iz stvarnog svijeta
- **Sveobuhvatan obuhvat**: Od osnovnih pojmova do naprednih obrazaca za poduzeća
- **Pristup usmjeren na sigurnost**: Najbolje sigurnosne prakse integrirane kroz cijeli sadržaj
- **Optimizacija troškova**: Upute za isplative implementacije i upravljanje resursima

#### Kvaliteta dokumentacije
- **Detaljni primjeri koda**: Praktični, testirani primjeri koda
- **Upute korak-po-korak**: Jasne, provedive smjernice
- **Sveobuhvatno upravljanje greškama**: Rješavanje problema za česte poteškoće
- **Integracija najboljih praksi**: Standardi industrije i preporuke
- **Kompatibilnost verzija**: Ažurirano s najnovijim Azure uslugama i azd značajkama

## Planirana buduća unaprjeđenja

### Verzija 3.1.0 (planirano)
#### Proširenje AI platforme
- **Podrška za više modela**: Obrasci integracije za Hugging Face, Azure Machine Learning i prilagođene modele
- **Okviri za AI agente**: Predlošci za LangChain, Semantic Kernel i AutoGen implementacije
- **Napredni RAG obrasci**: Opcije vektorskih baza podataka izvan Azure AI Search (Pinecone, Weaviate itd.)
- **Promatranje AI-a**: Unaprijeđeni nadzor performansi modela, korištenja tokena i kvalitete odgovora

#### Iskustvo developera
- **VS Code ekstenzija**: Integrirano razvojno iskustvo AZD + Microsoft Foundry
- **Integracija GitHub Copilot**: AI-podržana generacija AZD predložaka
- **Interaktivni tutorijali**: Praktične kodne vježbe s automatiziranom validacijom za AI scenarije
- **Video sadržaj**: Dopunski video tutorijali za vizualne učenike usmjereni na AI implementacije

### Verzija 4.0.0 (planirano)
#### Obrasci poduzeća za AI
- **Okvir upravljanja**: Upravljanje AI modelima, usklađenost i revizijske staze
- **Višekorisnički AI**: Obrasci za opsluživanje više kupaca s izoliranim AI uslugama
- **Edge AI implementacija**: Integracija s Azure IoT Edge i kontejnerskim instancama
- **Hibridni cloud AI**: Obrasci višerežimskog i hibridnog implementiranja AI radnih opterećenja

#### Napredne značajke
- **Automatizacija AI pipeline-a**: MLOps integracija s Azure Machine Learning pipeline-ima
- **Napredna sigurnost**: Zero-trust obrasci, privatne krajnje točke i napredna zaštita od prijetnji
- **Optimizacija performansi**: Napredne strategije za podešavanje i skaliranje AI aplikacija visokog kapaciteta
- **Globalna distribucija**: Obrasci isporuke sadržaja i edge caching za AI aplikacije

### Verzija 3.0.0 (planirano) - Zamijenjeno trenutnim izdanjem
#### Predložena dodavanja - Sada implementirana u v3.0.0
- ✅ **AI-fokusirani sadržaj**: Sveobuhvatna integracija Microsoft Foundry (Završeno)
- ✅ **Interaktivni tutorijali**: Praktična AI radionica (Završeno)
- ✅ **Napredni sigurnosni modul**: AI-specifični sigurnosni obrasci (Završeno)
- ✅ **Optimizacija performansi**: Strategije podešavanja AI radnog opterećenja (Završeno)

### Verzija 2.1.0 (planirano) - Djelomično implementirano u v3.0.0
#### Manja poboljšanja - Dio dovršen u sadašnjem izdanju
- ✅ **Dodatni primjeri**: AI-fokusirani implementacijski scenariji (Završeno)
- ✅ **Prošireni FAQ**: AI-specifična pitanja i rješavanje problema (Završeno)
- **Integracija alata**: Poboljšani vodiči za IDE i integraciju uređivača
- ✅ **Proširenje nadzora**: AI-specifični obrasci nadzora i upozorenja (Završeno)

#### Još planirano za buduće izdanje
- **Dokumentacija prilagođena mobilnim uređajima**: Responzivni dizajn za mobilno učenje
- **Pristup bez mrežne veze**: Preuzimanje paketa dokumentacije
- **Poboljšana integracija IDE-a**: VS Code ekstenzija za AZD + AI tokove rada
- **Zajednički nadzor**: Metrički podaci u stvarnom vremenu i praćenje doprinosa zajednice

## Doprinos zapisniku promjena

### Prijavljivanje promjena
Prilikom doprinosa ovom repozitoriju, molimo osigurajte da zapisi u changelogu uključuju:

1. **Broj verzije**: Slijedeći semantičko verzioniranje (glavna.manja.popravak)
2. **Datum**: Datum izdavanja ili ažuriranja u formatu GGGG-MM-DD
3. **Kategorija**: Dodano, Promijenjeno, Zastarjelo, Uklonjeno, Ispravljeno, Sigurnost
4. **Jasni opis**: Sažet opis promjene
5. **Procjena utjecaja**: Kako promjene utječu na postojeće korisnike

### Kategorije promjena

#### Dodano
- Nove značajke, odjeljci dokumentacije ili mogućnosti
- Novi primjeri, predlošci ili resursi za učenje
- Dodatni alati, skripte ili utiliteti

#### Promijenjeno
- Izmjene postojeće funkcionalnosti ili dokumentacije
- Ažuriranja za poboljšanje jasnoće ili točnosti
- Restrukturiranje sadržaja ili organizacije

#### Zastarjelo
- Značajke ili pristupi koji se ukidaju
- Odjeli dokumentacije predviđeni za uklanjanje
- Metode za koje postoje bolji alternativni načini

#### Uklonjeno
- Značajke, dokumentacija ili primjeri koji više nisu relevantni
- Zastarjele informacije ili zastarjeli pristupi
- Suvišan ili konsolidirani sadržaj

#### Ispravljeno
- Ispravci grešaka u dokumentaciji ili kodu
- Rješavanje prijavljenih problema ili poteškoća
- Poboljšanja točnosti ili funkcionalnosti


#### Sigurnost
- Poboljšanja ili ispravci vezani za sigurnost
- Ažuriranja najboljih sigurnosnih praksi
- Rješavanje sigurnosnih ranjivosti

### Smjernice za semantičko verzioniranje

#### Glavna verzija (X.0.0)
- Promjene koje prekidaju kompatibilnost i zahtijevaju akciju korisnika
- Značajne preinake sadržaja ili organizacije
- Promjene koje mijenjaju temeljni pristup ili metodologiju

#### Manja verzija (X.Y.0)
- Nove značajke ili dodaci sadržaju
- Unapređenja koja održavaju unazadnu kompatibilnost
- Dodatni primjeri, alati ili resursi

#### Verzija za ispravke (X.Y.Z)
- Ispravci pogrešaka i korekcije
- Manja poboljšanja postojećeg sadržaja
- Pojašnjenja i sitna unapređenja

## Povratne informacije i prijedlozi zajednice

Aktivno potičemo povratne informacije zajednice za poboljšanje ovog resursa za učenje:

### Kako dati povratnu informaciju
- **GitHub Issues**: Prijavite probleme ili predložite poboljšanja (AI-specifični problemi su dobrodošli)
- **Discord Rasprave**: Dijelite ideje i sudjelujte u Microsoft Foundry zajednici
- **Pull Requests**: Izravno doprinesite poboljšanjima sadržaja, osobito AI predlošcima i vodičima
- **Microsoft Foundry Discord**: Sudjelujte u #Azure kanalu za AZD + AI rasprave
- **Zajednički forumi**: Sudjelujte u široj Azure razvojnoj zajednici

### Kategorije povratnih informacija
- **Točnost AI sadržaja**: Ispravci informacija o integraciji i implementaciji AI usluga
- **Iskustvo u učenju**: Prijedlozi za poboljšanje tijeka učenja AI razvojnih inženjera
- **Nedostajući AI sadržaj**: Zahtjevi za dodatnim AI predlošcima, obrascima ili primjerima
- **Pristupačnost**: Poboljšanja za različite potrebe u učenju
- **Integracija AI alata**: Prijedlozi za bolju integraciju AI razvojnog tijeka
- **Produkcijski AI obrasci**: Zahtjevi za uzorcima implementacije AI na razini poduzeća

### Obveza odgovora
- **Odgovor na probleme**: Unutar 48 sati za prijavljene probleme
- **Zahtjevi za značajke**: Procjena unutar jednog tjedna
- **Doprinosi zajednice**: Pregled unutar jednog tjedna
- **Sigurnosni problemi**: Prioritetno i brzo rješavanje

## Raspored održavanja

### Redovita ažuriranja
- **Mjesečni pregledi**: Provjera točnosti sadržaja i valjanosti poveznica
- **Kvartalna ažuriranja**: Veliki dodaci i poboljšanja sadržaja
- **Polugodišnji pregledi**: Sveobuhvatno preuređenje i unaprjeđenje
- **Godišnja izdanja**: Glavna ažuriranja verzija sa značajnim poboljšanjima

### Praćenje i osiguranje kvalitete
- **Automatizirano testiranje**: Redovita provjera primjera koda i poveznica
- **Integracija povratnih informacija zajednice**: Redovito uključivanje korisničkih prijedloga
- **Ažuriranja tehnologije**: Usuglašavanje s najnovijim Azure uslugama i azd izdanjima
- **Revizije pristupačnosti**: Redoviti pregledi inkluzivnih dizajnerskih načela

## Politika podrške verzija

### Podrška za trenutačne verzije
- **Najnovija glavna verzija**: Potpuna podrška s redovitim ažuriranjima
- **Prethodna glavna verzija**: Sigurnosna ažuriranja i kritične ispravke 12 mjeseci
- **Zastarjele verzije**: Podrška zajednice, bez službenih ažuriranja

### Smjernice za migraciju
Kada se objave glavne verzije, pružamo:
- **Vodiče za migraciju**: Upute korak po korak za prijelaz
- **Napomene o kompatibilnosti**: Detalji o promjenama koje prekidaju kompatibilnost
- **Podršku alata**: Skripte ili uslužni programi za pomoć pri migraciji
- **Podršku zajednice**: Namjenski forumi za pitanja o migraciji

---

**Navigacija**
- **Prethodna lekcija**: [Study Guide](resources/study-guide.md)
- **Sljedeća lekcija**: Povratak na [Main README](README.md)

**Ostanite ažurni**: Pratite ovaj repozitorij za obavijesti o novim izdanjima i važnim ažuriranjima materijala za učenje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->