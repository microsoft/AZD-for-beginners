# Dnevnici promjena - AZD za početnike

## Uvod

Ovaj dnevnici promjena dokumentiraju sve značajne promjene, ažuriranja i poboljšanja u repozitoriju AZD za početnike. Slijedimo principe semantičkog verzioniranja i vodimo ovaj zapis kako bismo korisnicima pomogli razumjeti što je promijenjeno između verzija.

## Ciljevi učenja

Pregledom ovog dnevnika promjena, moći ćete:
- Ostanite informirani o novim značajkama i dodacima sadržaja
- Razumjeti poboljšanja postojećih dokumenata
- Pratiti ispravke bugova i korekcije radi osiguravanja točnosti
- Pratiti razvoj nastavnih materijala kroz vrijeme

## Ishodi učenja

Nakon pregleda unosa dnevnika promjena, moći ćete:
- Identificirati novi sadržaj i resurse dostupne za učenje
- Razumjeti koje su sekcije ažurirane ili poboljšane
- Planirati svoj put učenja na temelju najnovijih materijala
- Doprinositi povratnim informacijama i prijedlozima za buduća poboljšanja

## Povijest verzija

### [v3.24.0]- 2026-11-04

#### Ispravljeno
- Popravljena navigacija na tečaju na engleskom jeziku, premještene putanje stranica, nedostajući ankori i zastarjele vanjske reference, uključujući poveznicu na Poglavlje 2 prema vodiču za proizvodni AI.
- Revidirane trenutne upute na temelju objavljenog AZD 1.37.2, agenata 1.0.0-beta.23 i evaluacija 1.0.0-beta.2. Dokumentiran je poseban `azd ai eval` tijek rada i migracija konfiguracije optimizacije.
- Ispravljene nepodržane CLI zastavice, granice autentikacije, upute za plaintext okruženje/lozinke, infrastrukturna ažuriranja, konfiguracija modela i primjeri destruktivnog oporavka.
- Osvježen radionica na temelju trenutnog primjera AI agenata, uključujući stvarne kuke, unose konfiguracije, evaluacijske testove, ulazne točke za red-teaming i nadgledanje.
- Ispravljeni primjeri implementacije i popravljeni povezani problemi aplikacije/infrastrukture/konfiguracije. Materijal o maloprodajnoj arhitekturi jasno je razlikovan od potpune radne aplikacije.
- Vraćena matrica jezičnog koda CodeQL, odabran podržani Node.js 24 za razvojni kontejner i omogućen izvještaj validatora o neuspjelim naredbama verzije.

#### Dodano
- Offline provjera poveznica/ankora samo na engleskom, regresijski testovi i tijek rada za dokumentaciju koji također gradi radionicu u strogom načinu rada. Generirani prijevodi i prevedene slike isključeni su.

#### Opseg provjere valjanosti
- Provjere izvora, sintakse, konfiguracije, lokalnog ponašanja i mrežnih poveznica ne potvrđuju mogućnost trenutnog postavljanja na Azure, kvote, RBAC, regionalnu dostupnost modela, naplatu, sigurnosnu usklađenost ili spremnost za proizvodnju.
- Stariji unosi ispod su povijesni zapisi, a ne trenutne naredbe ili upute za izdavanje.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 osvježenje: ažuriranje verzije
**Ova verzija ponovno validira tečaj na temelju `azd` `1.27.1` (srpanj 2026, posljednje stabilno izdanje) i trenutačnog pregleda proširenja za AI agente `azure.ai.agents` `1.0.0-beta.5`, ažurirajući svaki oznaku "validirano prema" nakon izdanja 1.26.0, 1.27.0 i 1.27.1.**

#### Promijenjeno
- **✅ Ažurirana referentna točka validacije** s `azd 1.25.6` (lipanj 2026) na `azd 1.27.1` (srpanj 2026) u glavnom README-u, svim README-ima poglavlja, lekciji dev-kontejnera u Poglavlju 1 (uključujući primjere s fiksnim verzijama), lekciji o prilagođenim predlošcima u Poglavlju 4, lekciji o višestrukim agentima u Poglavlju 5 i dokumentaciji radionice
- **🤖 Osnova Poglavlja 2 osvježena** s `azd 1.23.12` (ožujak 2026) na `azd 1.27.1` preko `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` i `microsoft-foundry-integration.md`; ažurirani datumi bilješki o validaciji na 2026-07-13
- **🧩 Proširenje AI agenta podignuto** s `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` na trenutačnu verziju `1.0.0-beta.5` u README-u Poglavlja 2 i `agents.md`
- **🧪 Primjer validacije radionice** (`azd version` izlaz) ažuriran na `1.27.1`

#### Bilješke o relevantnim izdanjima azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Podrška za Go za Azure Functions na Flex Consumption, `azd config sub-filter` filtri pretplate po zakupcu, samostalni paketi proširenja (`azd x pack --bundle`) i `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelirajte Azure AI Foundry projekte/agente izravno u `azure.yaml` (pokretanje bez Bicepa/Terraforma), podrška za distribuiranje kontejnera u App Service (`host: appservice` + `language: docker`), izravni `-s/--source` za `azd extension` naredbe i `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` zastavica za `azd extension install`, zastarjeli modeli po defaultu isključeni iz kataloga/kvotnih upita i nekoliko ispravki bugova

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

#### Popunjavanje praznina za početnike #2: Autorstvo predložaka, razvojni kontejneri, Pulumi, Azure DevOps, servisni glavni korisnici i više
**Ova verzija zatvara preostale srednje praznine koje je analizirao azd-coverage: kako izraditi i objaviti vlastiti predložak, reproducibilna razvojna okruženja u Dev Containerima/Codespaces-ima, infrastrukturni provider Pulumi, Azure DevOps CI/CD vodič, autentikacija servisnih glavnih korisnika, upute za odabir domaćina (AKS/Spring Apps), objašnjenja za `azd restore`/`azd package`, upravljanje pogreškama kuka i prakse timskih/dijeljenih okruženja.**

#### Dodano
- **🧱 Nova lekcija u Poglavlju 4** `docs/chapter-04-infrastructure/custom-templates.md` — autorstvo vlastitog azd predloška: potrebna struktura (`azure.yaml`, `infra/`, `src/`), `metadata.template` polje, parametarizacija infrastrukture putem `uniqueString()` resursnog tokena i `azd-env-name` oznake, lokalno testiranje s `azd init --template <local-path>`, objava na GitHubu i slanje u Awesome AZD galeriju
- **📦 Nova lekcija u Poglavlju 1** `docs/chapter-01-foundation/dev-containers.md` — reproducibilna azd okruženja s Dev Containerima i GitHub Codespaces: minimalni `.devcontainer/devcontainer.json` koristeći službenu `ghcr.io/azure/azure-dev/azd` značajku, jezično specifične značajke, `docker-in-docker` za hostove kontejnera i `azd auth login --use-device-code` za daljinsku prijavu
- **🧩 Sekcija Pulumi s azd** u `docs/chapter-04-infrastructure/provisioning.md` — konfiguracija `infra.provider: pulumi`, struktura mape Pulumi, stackovi mapirani na azd okruženja, potrebni izlazni podaci/oznake i identičan tijek rada `azd up` / `azd down`
- **🎯 Upute za odabir domaćina** u `docs/chapter-04-infrastructure/provisioning.md` — početnički prijateljsko uspoređivanje `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` i `springapp`, s uputama kada odabrati AKS ili Azure Spring Apps
- **🛠️ Azure DevOps CI/CD vodič** u `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, servisna veza s federacijom identiteta radnog opterećenja (OIDC), generirani `azure-dev.yml` i postavljanje varijabilnih skupina
- **🔑 Servisni glavni korisnici (Obrazac 4)** dodano u `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktivni `azd auth login` s tajnim ključem klijenta naspram federiranih/OIDC vjerodajnica, kada koristiti i sigurno spremanje vjerodajnica
- **🪝 Upravljanje pogreškama kuka** pododjeljak u `docs/chapter-04-infrastructure/deployment-guide.md` — izlazni kodovi i `set -e`, `continueOnError`, izolirano testiranje kuka s `azd hooks run`, shelovi specifični za OS i `--debug`
- **👥 Timska/dijeljena okruženja** sekcija u `docs/chapter-03-configuration/configuration.md` — što se nalazi u `.azure/`, što ignorirati u git-u, okruženja po razvojnim programerima, `azd env list`/`select` i pružanje vrijednosti okruženja u CI/CD
- **🧰 `azd restore` i proširena objašnjenja `azd package`** u `resources/cheat-sheet.md` — vraćanje ovisnosti i izgradnja raspoložnog artefakta bez raspoređivanja

#### Promijenjeno
- **🧭 Tablica lekcija Poglavlja 4** ažurirana kako bi uključila novu lekciju "Autorstvo vlastitog predloška" (Lekcija 3)
- **🧭 Tablica lekcija Poglavlja 1** ažurirana kako bi uključila novu lekciju "Dev Containers & Codespaces" (Lekcija 5); navigacijski podnožja spojeni između `bring-your-own-app.md` i `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Popunjavanje praznina za početnike: praktična lekcija za višestruke agente, "Donesite svoju aplikaciju", Terraform i CI/CD vodič
**Ova verzija zatvara najveće praznine za potpuni vodič za početnike dodavanjem dvije nove praktične lekcije (vodič za rasporediv višestruki agent i dodavanje azd postojećoj aplikaciji), uvod u kuke prilagođen početnicima, sekciju Terraform s azd, korak-po-korak GitHub Actions vodič, objašnjenje novih pregleda proširenja i eksplicitni kontrolni popis za verifikaciju raspoređivanja.**

#### Dodano
- **🤝 Nova lekcija u Poglavlju 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — potpuno praktični vodič za rasporediv dvostruki agent (koordinator + stručnjaci) koristeći stvarni predložak (`contoso-creative-writer`), pokrivajući kada koristiti višestruke agente, `azd up` tijek rada, razumijevanje raspoređenih resursa, praćenje između agenata, prilagodbu i čišćenje
- **📦 Nova lekcija u Poglavlju 1** `docs/chapter-01-foundation/bring-your-own-app.md` — kako dodati azd postojećem projektu s `azd init` ("koristi kod u trenutnom direktoriju"), razumijevanje `azure.yaml` i `infra/`, `azd infra generate`, detekcija domaćina i raspoređivanje s `azd up`
- **🌐 Sekcija Terraform s azd** dodana u `docs/chapter-04-infrastructure/provisioning.md` — konfiguracija `infra.provider: terraform`, struktura mape `.tf`, potrebni izlazi `AZURE_*` i označavanje `azd-env-name` te identičan tijek rada `azd up` / `azd down` (zatvara prazninu gdje je podrška za Terraform tvrdila ali je pokazana samo za Bicep)
- **⚙️ Korak-po-korak GitHub Actions vodič** u `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitorija do automatskih raspoređivanja: `azd pipeline config`, OIDC federirane vjerodajnice (bez pohranjenih tajni), generirani `azure-dev.yml` i upute o tajnama kontra varijabli
- **🪝 Uvod za početnike "Novi u kukama?"** u `docs/chapter-04-infrastructure/deployment-guide.md` — što je kuka, tablica faza kuka, minimalna prva kuka i ručno pokretanje kuka s `azd hooks run`
- **✅ Dodan kontrolni popis "Provjerite svoje raspoređivanje"** u Korak 5 `docs/chapter-01-foundation/first-project.md` — provjera dima, provjera zdravstvene točke i eksplicitni kriteriji uspjeha
- **🧩 Objašnjenje novih pregleda proširenja** `azure.ai.skills` i `azure.ai.connections` (što su i kada ih zatražiti) u `docs/chapter-08-production/production-ai-practices.md`

#### Promijenjeno
- **🧭 Tablica lekcija Poglavlja 5** ispravljena: `multi-agent-basics.md` je sada Lekcija 1 (jedina potpuno praktična lekcija), iskreno označeno da Lekcija 2 pripada Poglavlju 6, a scenarij za maloprodaju je arhitektonski nacrt, a ne predložak jedne naredbe
- **🧭 Tablica lekcija Poglavlja 1** sada uključuje novu lekciju "Donesite svoju aplikaciju" (Lekcija 4)
- **🔗 Navigacijski podnožja** ažurirana: `first-project.md` sada povezuje naprijed prema `bring-your-own-app.md`

#### Ispravljeno
- **🧱 Zatvorena praznina "tvrdio ali nedostajao" za Terraform** — tečaj je prije referirao podršku za Terraform, ali nije je pokazivao
- **🔀 Ispravljene zavaravajuće križne poveznice u Poglavlju 5** koje su implicirale da postoji potpuna višestruka implementacija agenata kada je postojao samo arhitektonski nacrt

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

#### Osvježenje AZD 1.25.6, Komande za puni životni ciklus agenata i Aspire Rebrand
**Ova verzija ponovno potvrđuje tečaj u odnosu na `azd` `1.25.6` (lipanj 2026.) i `azure.ai.agents` `0.1.40-preview` proširenje, proširuje AI smjernice sa "postavljanje agenta" na kompletan životni ciklus agenta (testiranje → evaluacija → optimizacija → inspekcija → brisanje), prikazuje nova `azure.ai.skills` i `azure.ai.connections` pregledna proširenja, te bilježi promjenu branda proizvoda s ".NET Aspire" na "Aspire".**

#### Dodano
- **🔁 Puno pokrivanje životnog ciklusa agenta** za početnike i AI inženjere kroz dokumentaciju:
  - `docs/chapter-01-foundation/azd-basics.md` — Tablica životnog ciklusa (postavljanje → testiranje → mjerenje → poboljšanje → inspekcija → čišćenje) dodana u dio o Proširenjima i AI komandama
  - `docs/chapter-08-production/production-ai-practices.md` — Novi odjeljak "Upravljanje životnim ciklusom agenta" koji pokriva `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, i `delete --force`
  - `resources/cheat-sheet.md` — Proširene AI komande za agente s `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, i `delete --force`
- **🧩 Nova pregledna proširenja** dokumentirana: `azure.ai.skills` (ponovno upotrebljive vještine agenta) i `azure.ai.connections` (povezivanja Foundry) dodani u tablicu proširenja i prečice
- **⏱️ Smjernice za vremensko odzivanje** — primjeri `azd ai agent invoke` sada bilježe ukupno kašnjenje i vrijeme do prvog bajta
- **📌 Banner verzije** u glavnom README-u koji usmjerava polaznike na `azd version` i `azd upgrade`

#### Promijenjeno
- **✅ Osnova validacije ažurirana** sa `azd 1.23.12` (ožujak 2026.) na `azd 1.25.6` (lipanj 2026.) kroz sve README-e poglavlja i dokumentaciju radionice
- **🤖 Bilješka o proširenju poglavlja 2** ažurirana s `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Primjer validacije radionice** (`azd version` izlaz) ažuriran na `1.25.6`
- **🧭 README "Što je novo u azd danas"** osvježen za isticanje punog životnog ciklusa agenta, novih AI proširenja i nedavnih poboljšanja kvalitete života (`azd init` idempotencija, `azd auth login` čišćenje zastarjelog tokena, `azd tool` prompt pri prvom pokretanju)
- **📖 Poglavlje 2 agents.md (Opcija 4)** sada upućuje polaznike na komande za životni ciklus nakon implementacije umjesto zaustavljanja na `azd up`

#### Ispravljeno
- **🏷️ Imenovanje proizvoda** — dodana napomena o rebrandu Aspire (".NET Aspire" je sada jednostavno "Aspire"); podrška za Aspire u azd ostaje nepromijenjena
- **🔎 Validacija izdanja uživo** potvrđena nasuprot Azure Developer CLI feedu izdanja: stabilni CLI `1.25.6` (2026-06-12) i `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Pojašnjenje za početnike, validacija postava i konačno čišćenje AZD komandi
**Ova verzija nadovezuje se na AZD 1.23 val. pregled s fokusom na početnike u dokumentaciji: pojašnjava AZD-prvu autentikaciju, dodaje lokalne skripte za validaciju postava, provjerava ključne naredbe preko živog AZD CLI-ja te uklanja zadnje zastarjele engleske izvore komandi izvan dnevnika promjena.**

#### Dodano
- **🧪 Skripte za validaciju postava za početnike** s `validate-setup.ps1` i `validate-setup.sh` kako bi polaznici mogli potvrditi potrebne alate prije početka Poglavlja 1
- **✅ Koraci za validaciju postava u startu** u glavnom i poglavlju 1 README-u tako da se propusti u preduvjetima primijete prije `azd up`

#### Promijenjeno
- **🔐 Smjernice za autentikaciju početnika** sada dosljedno tretiraju `azd auth login` kao primarni put za AZD tijekove rada, a `az login` je označen kao opcionalan osim ako se ne koriste direktno Azure CLI komande
- **📚 Uvodni proces za Poglavlje 1** sada upućuje polaznike da validiraju lokalni postav prije instalacije, autentikacije i prvih koraka implementacije
- **🛠️ Poruke validatora** sada jasno razlikuju blokirajuće zahtjeve od opcionalnih upozorenja Azure CLI-ja za AZD-smjer za početnike
- **📖 Dokumentacija o konfiguraciji, otklanjanju poteškoća i primjerima** sada razlikuje potrebnu AZD autentikaciju i opcionalni Azure CLI prijavu gdje su prije bili prikazani bez konteksta

#### Ispravljeno
- **📋 Preostale reference engleskih komandi** ažurirane na trenutne AZD oblike, uključujući `azd config show` u prečicama i `azd monitor --overview` tamo gdje je bila namjera smjernica za Azure Portal
- **🧭 Tvrdnje za početnike u Poglavlju 1** ublažene kako se ne bi previše obećavala zajamčena bezgreška ili rollback ponašanja kroz sve predloške i Azure resurse
- **🔎 Validacija živog CLI-ja** potvrđuje trenutnu podršku za `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` i `azd down --force --purge`

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
**Ova verzija izvodi validacijski pregled dokumentacije za `azd` `1.23.12`, ažurira zastarjele primjere AZD komandi, osvježava AI model smjernice na trenutačne zadane vrijednosti i širi upute za radionicu izvan GitHub Codespaces da uključuju dev kontejnere i lokalne kopije.**

#### Dodano
- **✅ Bilješke o validaciji kroz glavna poglavlja i dokumentaciju radionice** da se polaznicima jasno pokaže testirana AZD osnova za korištenje novijih ili starijih CLI verzija
- **⏱️ Smjernice za vremensko ograničenje implementacije** za dugotrajne AI aplikacije koristeći `azd deploy --timeout 1800`
- **🔎 Koraci za inspekciju proširenja** s `azd extension show azure.ai.agents` u AI workflow dokumentaciji
- **🌐 Šire upute okruženja radionice** koje pokrivaju GitHub Codespaces, dev kontejnere i lokalne kopije uz MkDocs

#### Promijenjeno
- **📚 README uvodi poglavlja** sada dosljedno bilježe validaciju prema `azd 1.23.12` kroz fundamentalne, konfiguracijske, infrastrukturne, multi-agent, prije implementacije, otklanjanje problema i produkcijske sekcije
- **🛠️ Reference AZD komandi** ažurirane na trenutne oblike kroz dokumentaciju:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ili `azd env get-value(s)` ovisno o kontekstu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` gdje je namijenjen pregled Application Insightsa
- **🧪 Primjeri pokušaja preview provisioniranja** pojednostavljeni na trenutačno podržane upotrebe poput `azd provision --preview` i `azd provision --preview -e production`
- **🧭 Tijek radionice** ažuriran tako da polaznici mogu dovršiti laboratorije u Codespaces, dev kontejneru ili lokalnoj kopiji umjesto da se pretpostavlja samo Codespaces
- **🔐 Smjernice za autentikaciju** sada preferiraju `azd auth login` za AZD tijekove rada, s `az login` kao opcionalnim kada se izravno koriste Azure CLI komande

#### Ispravljeno
- **🪟 Windows komande za instalaciju** usklađene na trenutni `winget` casing paketa u vodiču za instalaciju
- **🐧 Linux smjernice za instalaciju** ispravljene da ne upućuju na nepodržan distro-specifični upravitelj paketa `azd` i umjesto toga usmjeravaju na izvore izdanja gdje je primjereno
- **📦 Primjeri AI modela** osvježeni sa starih zadavanja poput `gpt-35-turbo` i `text-embedding-ada-002` na trenutačne primjere kao što su `gpt-4.1-mini`, `gpt-4.1` i `text-embedding-3-large`
- **📋 Isječci implementacije i dijagnostike** ispravljeni da koriste trenutačne komande okoline i statusa u zapisima, skriptama i koracima za otklanjanje poteškoća
- **⚙️ Smjernice za GitHub Actions** ažurirane s `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Smjernice za MCP/Copilot pristanke** ažurirane s `azd mcp consent` na `azd copilot consent list`

#### Poboljšano
- **🧠 Upute za AI poglavlje** sada bolje objašnjavaju ponašanje osjetljivo na pregled `azd ai`, prijavu specifičnu za zakupnika, trenutačnu uporabu proširenja i ažurirane preporuke za implementaciju modela
- **🧪 Upute za radionicu** sada koriste realističnije primjere verzija i jasniji jezik za postavljanje okoline za praktične laboratorije
- **📈 Dokumentacija za produkciju i rješavanje problema** sada bolje usklađena s trenutačnim nadzorom, rezervnim modelom i primjerima troškovnih razina

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
**Ova verzija dodaje pokrivenost naredbi `azd ai`, `azd extension` i `azd mcp` u svim ključnim AI poglavljima, ispravlja pokvarene veze i zastarjeli kod u agents.md, ažurira sažetak te temeljito preuređuje odjeljak Primjeri Predložaka s potvrđenim opisima i novim Azure AI AZD predlošcima.**

#### Dodano
- **🤖 Pokrivenost AZD AI CLI** kroz 7 datoteka (prije samo u poglavlju 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Novi odjeljak "Proširenja i AI Naredbe" koji uvodi `azd extension`, `azd ai agent init` i `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcija 4: `azd ai agent init` s usporednom tablicom (predložak vs pristup manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Pododjeljci "AZD Proširenja za Foundry" i "Implementacija usmjerena na agente"
  - `docs/chapter-05-multi-agent/README.md` — Brzi početak sada prikazuje oba puta implementacije bazirana na predlošku i manifestu
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Odjeljak implementacije sada uključuje opciju `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Pododjeljak "AZD AI naredbe za dijagnostiku"
  - `resources/cheat-sheet.md` — Novi odjeljak "AI & Naredbe proširenja" s `azd extension`, `azd ai agent init`, `azd mcp` i `azd infra generate`
- **📦 Novi AZD AI primjeri predložaka** u `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s Blazor WebAssembly, Semantic Kernel i podrškom za glasovni chat
  - **azure-search-openai-demo-java** — Java RAG chat koristeći Langchain4J s opcijama implementacije ACA/AKS
  - **contoso-creative-writer** — Višeagentna aplikacija za kreativno pisanje koristeći Azure AI Agent Service, Bing Grounding i Prompty
  - **serverless-chat-langchainjs** — Serverless RAG koristeći Azure Functions + LangChain.js + Cosmos DB s Ollama podrškom za lokalni razvoj
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG akcelerator s administrativnim portalom, Teams integracijom i opcijama PostgreSQL/Cosmos DB-a
  - **azure-ai-travel-agents** — Referentna aplikacija za orkestraciju višestrukih agenata MCP s poslužiteljima u .NET, Python, Java i TypeScript
  - **azd-ai-starter** — Minimalna Azure AI infrastruktura Bicep starter predložak
  - **🔗 Awesome AZD AI Gallery link** — Referenca na [awesome-azd AI galeriju](https://azure.github.io/awesome-azd/?tags=ai) (80+ predložaka)

#### Ispravljeno
- **🔗 agents.md navigacija**: Linkovi Prethodni/Sljedeći sada odgovaraju redoslijedu lekcija u Chapter 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md neispravni linkovi**: `production-ai-practices.md` ispravljeno u `../chapter-08-production/production-ai-practices.md` (3 pojave)
- **📦 agents.md zastarjeli kod**: Zamijenjen `opencensus` s `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md neispravan API**: Premješten `max_tokens` iz `create_agent()` u `create_run()` kao `max_completion_tokens`
- **🔢 agents.md brojanje tokena**: Zamijenjena gruba `len//4` procjena s `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Ispravljene usluge s "Cognitive Search + App Service" na "Azure AI Search + Azure Container Apps" (zadani host promijenjen u listopadu 2024.)
- **contoso-chat**: Ažuriran opis da referira Azure AI Foundry + Prompty, usklađeno s pravim naslovom i tehnološkim stackom repozitorija

#### Uklonjeno
- **ai-document-processing**: Uklonjena nefunkcionalna referenca na predložak (repozitorij nije javno dostupan kao AZD predložak)

#### Poboljšano
- **📝 agents.md vježbe**: Vježba 1 sada prikazuje očekivani rezultat i `azd monitor` korak; Vježba 2 uključuje punu `FunctionTool` registracijsku šifru; Vježba 3 zamjenjuje nejasne upute konkretnim `prepdocs.py` naredbama
- **📚 agents.md resursi**: Ažurirane poveznice na dokumentaciju u skladu s trenutnom Azure AI Agent Service dokumentacijom i brzim početkom
- **📋 agents.md tablica Sljedeći Koraci**: Dodan link na AI Workshop Lab za potpunu pokrivenost poglavlja

#### Ažurirane Datoteke
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Poboljšanje navigacije kroz tečaj
**Ova verzija poboljšava navigaciju kroz poglavlja README.md datoteke s poboljšanim formatom tablice.**

#### Izmijenjeno
- **Tablica karte tečaja**: Poboljšana s direktnim linkovima na lekcije, procjenama trajanja i ocjenama složenosti
- **Čišćenje mapa**: Uklonjene suvišne stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Provjera poveznica**: Provjereno svih 21+ internih poveznica u tablici Karte tečaja

### [v3.16.0] - 2026-02-05

#### Ažuriranja naziva proizvoda
**Ova verzija ažurira reference proizvoda prema trenutačnom Microsoft brendiranju.**

#### Izmijenjeno
- **Microsoft Foundry → Microsoft Foundry**: Sve reference ažurirane kroz sve datoteke osim prijevoda
- **Azure AI Agent Service → Foundry Agents**: Naziv servisa ažuriran da odražava trenutačno brendiranje

#### Ažurirane datoteke
- `README.md` - Glavna početna stranica tečaja
- `changelog.md` - Povijest verzija
- `course-outline.md` - Struktura tečaja
- `docs/chapter-02-ai-development/agents.md` - Vodič za AI agente
- `examples/README.md` - Dokumentacija primjera
- `workshop/README.md` - Početna stranica radionice
- `workshop/docs/index.md` - Indeks radionica
- `workshop/docs/instructions/*.md` - Sve upute za radionicu

---

### [v3.15.0] - 2026-02-05

#### Velika restrukturacija repozitorija: nazivi mapa po poglavljima
**Ova verzija restrukturira dokumentaciju u namjenske mape poglavlja radi jasnoće navigacije.**

#### Promjene naziva mapa
Stare su mape zamijenjene mapama numeriranim po poglavljima:
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
| Sve pre-deployment datoteke | pre-deployment/ | chapter-06-pre-deployment/ |
| Sve troubleshooting datoteke | troubleshooting/ | chapter-07-troubleshooting/ |

#### Dodano
- **📚 README datoteke po poglavljima**: Kreirana README.md u svakoj mapi poglavlja s:
  - Ciljevima učenja i trajanjem
  - Tablicom lekcija s opisima
  - Naredbama za brzi početak
  - Navigacijom na ostala poglavlja

#### Izmijenjeno
- **🔗 Ažurirani svi interni linkovi**: 78+ putanja ažurirano u svim dokumentacijskim datotekama
- **🗺️ Glavni README.md**: Ažurirana karta tečaja s novom strukturom poglavlja
- **📝 examples/README.md**: Ažurirane međureferencijske poveznice na mape poglavlja

#### Uklonjeno
- Stara struktura mapa (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturiranje repozitorija: navigacija kroz poglavlja
**Ova verzija je dodala README datoteke za navigaciju kroz poglavlja (zamijenjena verzijom v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novi vodič za AI agente
**Ova verzija dodaje sveobuhvatan vodič za implementaciju AI agenata uz Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Potpun vodič koji pokriva:
  - Što su AI agenti i kako se razlikuju od chatbotova
  - Tri predloška za brzi početak (Foundry Agents, Prompty, RAG)
  - Arhitekturalni obrasci agenata (pojedinačni agent, RAG, višestruki agent)
  - Konfiguracija i prilagodba alata
  - Praćenje i metričko izvještavanje
  - Troškovi i optimizacija
  - Uobičajeni scenariji za rješavanje problema
  - Tri praktične vježbe s kriterijima uspjeha

#### Struktura sadržaja
- **Uvod**: Koncepti agenata za početnike
- **Brzi početak**: Implementacija agenata s `azd init --template get-started-with-ai-agents`
- **Arhitekturalni obrasci**: Vizualni dijagrami obrazaca agenata
- **Konfiguracija**: Postavljanje alata i varijable okruženja
- **Praćenje**: Integracija s Application Insights
- **Vježbe**: Postepeno praktično učenje (20-45 minuta svaka)

---

### [v3.12.0] - 2026-02-05

#### Ažuriranje okruženja DevContainer
**Ova verzija ažurira konfiguraciju razvojnog kontejnera s modernim alatima i boljim zadanim postavkama za AZD iskustvo učenja.**

#### Izmijenjeno
- **🐳 Bazna slika**: Ažurirana s `python:3.12-bullseye` na `python:3.12-bookworm` (najnoviji Debian stabilni)
- **📛 Naziv kontejnera**: Preimenovan s "Python 3" u "AZD for Beginners" radi jasnoće

#### Dodano
- **🔧 Nove značajke razvojnog kontejnera**:
  - `azure-cli` s podrškom za Bicep omogućenom
  - `node:20` (LTS verzija za AZD predloške)
  - `github-cli` za upravljanje predlošcima
  - `docker-in-docker` za implementacije kontejnerskih aplikacija

- **🔌 Prosljeđivanje portova**: Prekonfigurirani portovi za uobičajeni razvoj:
  - 8000 (MkDocs pregled)
  - 3000 (Web aplikacije)
  - 5000 (Python Flask)
  - 8080 (API-jevi)

- **🧩 Novi VS Code dodaci**:
  - `ms-python.vscode-pylance` - Poboljšani Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podrška za Azure Functions
  - `ms-azuretools.vscode-docker` - Podrška za Docker
  - `ms-azuretools.vscode-bicep` - Podrška za Bicep jezik
  - `ms-azure-devtools.azure-resource-groups` - Upravljanje Azure resursima
  - `yzhang.markdown-all-in-one` - Uređivanje Markdowna
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Podrška za Mermaid dijagrame
  - `redhat.vscode-yaml` - Podrška za YAML (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Gita
  - `mhutchie.git-graph` - Povijest Gita

- **⚙️ VS Code postavke**: Dodane zadane postavke za Python interpreter, automatsko formatiranje pri spremanju i uklanjanje praznina

- **📦 Ažurirane requirements-dev.txt**:
  - Dodan MkDocs minify dodatak
  - Dodan pre-commit za kvalitetu koda
  - Dodani Azure SDK paketi (azure-identity, azure-mgmt-resource)

#### Ispravljeno
- **Post-Create naredba**: Sada provjerava instalaciju AZD i Azure CLI prilikom pokretanja kontejnera

---

### [v3.11.0] - 2026-02-05

#### README prilagođen početnicima
**Ova verzija značajno poboljšava README.md da bude pristupačniji početnicima i dodaje ključne resurse za AI programere.**

#### Dodano
- **🆚 Usporedba Azure CLI i AZD**: Jasno objašnjenje kada koristiti koji alat s praktičnim primjerima
- **🌟 Awesome AZD linkovi**: Direktni linkovi na galeriju predložaka zajednice i resurse za doprinos:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ predložaka spremnih za implementaciju
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Doprinos zajednice
- **🎯 Vodič za brzi početak**: Pojednostavljeni tijek u 3 koraka (Instaliraj → Prijavi se → Implementiraj)
- **📊 Tablica navigacije prema iskustvu**: Jasne upute gdje započeti na temelju razine iskustva programera

#### Izmijenjeno
- **Struktura README-a**: Preuređena za postupno otkrivanje - ključne informacije prve
- **Uvodni dio**: Prepisan da objasni "Čaroliju `azd up`" za potpune početnike
- **Uklonjen duplicirani sadržaj**: Izbačen duplicirani odjeljak za rješavanje problema
- **Naredbe za rješavanje problema**: Ispravljena referenca `azd logs` da koristi valjani `azd monitor --logs`

#### Ispravljeno
- **🔐 Naredbe za autentikaciju**: Dodani `azd auth login` i `azd auth logout` u cheat-sheet.md
- **Nevažeće referencije naredbi**: Uklonjen preostali `azd logs` iz README odjeljka za rješavanje problema

#### Napomene
- **Opseg**: Promjene primijenjene na glavni README.md i resources/cheat-sheet.md
- **Ciljana publika**: Poboljšanja usmjerena posebno na programere novi u AZD

---

### [v3.10.0] - 2026-02-05

#### Ispravak točnosti naredbi Azure Developer CLI
**Ova verzija ispravlja nepostojeće AZD naredbe u cijeloj dokumentaciji, osiguravajući da svi primjeri koda koriste valjanu sintaksu Azure Developer CLI-a.**

#### Ispravljeno
- **🔧 Uklonjene nepostojeće AZD naredbe**: Sveobuhvatna revizija i ispravak nevažećih naredbi:
  - `azd logs` (ne postoji) → zamijenjeno s `azd monitor --logs` ili Azure CLI alternativama
  - `azd service` podnaredbe (ne postoje) → zamijenjene s `azd show` i Azure CLI-jem
  - `azd infra import/export/validate` (ne postoje) → uklonjene ili zamijenjene valjanim alternativama
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` zastavice (ne postoje) → uklonjene
  - `azd provision --what-if/--rollback` zastavice (ne postoje) → ažurirane da koriste `--preview`
  - `azd config validate` (ne postoji) → zamijenjeno s `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne postoje) → uklonjeno

- **📚 Ažurirane datoteke s ispravcima naredbi**:
  - `resources/cheat-sheet.md`: Veliko preuređenje referenci naredbi
  - `docs/deployment/deployment-guide.md`: Ispravljene strategije rollbacka i implementacije
  - `docs/troubleshooting/debugging.md`: Ispravljeni odjeljci za analizu zapisa
  - `docs/troubleshooting/common-issues.md`: Ažurirane naredbe za rješavanje problema
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljena AZD sekcija za otklanjanje pogrešaka
  - `docs/getting-started/azd-basics.md`: Ispravljene naredbe za nadzor
  - `docs/getting-started/first-project.md`: Ažurirani primjeri nadzora i otklanjanja pogrešaka
  - `docs/getting-started/installation.md`: Ispravljeni primjeri pomoći i verzija
  - `docs/pre-deployment/application-insights.md`: Ispravljene naredbe za pregled zapisa
  - `docs/pre-deployment/coordination-patterns.md`: Ispravljene naredbe za otklanjanje pogrešaka agenata

- **📝 Ažurirana Referenca Verzije**: 
  - `docs/getting-started/installation.md`: Promijenjena hardkodirana verzija `1.5.0` u generičku `1.x.x` s poveznicom na izdanja

#### Promijenjeno
- **Strategije Poništavanja**: Ažurirana dokumentacija za korištenje poništavanja temeljenog na Gitu (AZD nema ugrađeno poništavanje)
- **Pregled zapisa**: Zamijenjeni referenca `azd logs` s `azd monitor --logs`, `azd monitor --live` i Azure CLI naredbama
- **Odjeljak za performanse**: Uklonjeni nepostojeći zastavice za paralelno/incrementalno postavljanje, pružene važeće alternative

#### Tehnički detalji
- **Važeće AZD naredbe**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Važeće zastavice azd monitor**: `--live`, `--logs`, `--overview`
- **Uklonjene značajke**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Napomene
- **Verifikacija**: Naredbe potvrđene na Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Završetak radionice i ažuriranje kvalitete dokumentacije
**Ova verzija dovršava interaktivne module radionice, popravlja sve neispravne poveznice u dokumentaciji i poboljšava ukupnu kvalitetu sadržaja za AI programere koji koriste Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Novi dokument s uputama za doprinos s:
  - Jasnim uputama za prijavu problema i predlaganje promjena
  - Standardima dokumentacije za novi sadržaj
  - Smjernicama za primjere koda i konvencijama poruka za commit
  - Informacijama o angažmanu zajednice

#### Dovršeno
- **🎯 Modul radionice 7 (Zaključak)**: Potpuno dovršen modul zaključka s:
  - Opsežan sažetak postignuća radionice
  - Odjeljak ključnih usvojenih koncepata koji obuhvaća AZD, predloške i Microsoft Foundry
  - Preporuke za nastavak puta učenja
  - Vježbe izazova radionice s ocjenama težine
  - Povratne informacije zajednice i poveznice za podršku

- **📚 Modul radionice 3 (Demontaža)**: Ažurirani ciljevi učenja s:
  - Aktivacijskom uputom za GitHub Copilot s MCP poslužiteljima
  - Razumijevanje strukture mape predložaka AZD
  - Obrasci organizacije infrastrukture kao koda (Bicep)
  - Upute za praktične laboratorijske vježbe

- **🔧 Modul radionice 6 (Rasklapanje)**: Dovršen s:
  - Ciljevima čišćenja resursa i upravljanja troškovima
  - Korištenje `azd down` za sigurno ukidanje infrastrukture
  - Upute za oporavak kognitivnih usluga obrisanih na soft-delete
  - Bonus poticaji za istraživanje GitHub Copilota i Azure Portal

#### Ispravljeno
- **🔗 Popravci neispravnih poveznica**: Riješeno 15+ neispravnih internih poveznica u dokumentaciji:
  - `docs/ai-foundry/ai-model-deployment.md`: Ispravljeni putovi do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljeni putovi ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamijenjen nepostojeći cicd-integration.md s deployment-guide.md
  - `examples/retail-scenario.md`: Ispravljeni putovi FAQ i vodiča za otklanjanje poteškoća
  - `examples/container-app/microservices/README.md`: Ispravljeni putovi kućne stranice te vodiča za postavljanje
  - `resources/faq.md` i `resources/glossary.md`: Ažurirane reference poglavlja o AI
  - `course-outline.md`: Ispravljene reference na vodič instruktora i AI radionicu lab

- **📅 Traka statusa radionice**: Ažurirana s "U izradi" na aktivan status radionice s datumom veljače 2026.

- **🔗 Navigacija radionice**: Popravljene neispravne poveznice u README.md koje su upućivale na nepostojeću mapu lab-1-azd-basics

#### Promijenjeno
- **Prezentacija radionice**: Uklonjena upozorenja "u izradi", radionica je sada dovršena i spremna za korištenje
- **Konzistentnost navigacije**: Osigurana pravilna navigacija između svih modula radionice
- **Reference puteva učenja**: Ažurirane međureferentne poveznice poglavlja za ispravne microsoft-foundry putove

#### Održano
- ✅ Sve engleske markdown datoteke imaju važeće interne poveznice
- ✅ Moduli radionice 0-7 dovršeni s ciljevima učenja
- ✅ Navigacija između poglavlja i modula ispravno funkcionira
- ✅ Sadržaj prikladan za AI programere koji koriste Microsoft AZD
- ✅ Održavan je jezik i struktura prilagođena početnicima
- ✅ CONTRIBUTING.md pruža jasne smjernice za doprinositelje zajednice

#### Tehnička provedba
- **Validacija poveznica**: Automatizirani PowerShell skript potvrdio sve interne .md poveznice
- **Revizija sadržaja**: Ručni pregled dovršenosti radionice i pristupačnosti početnicima
- **Sustav navigacije**: Primijenjeni konzistentni obrasci navigacije poglavlja i modula

#### Napomene
- **Opseg**: Promjene primijenjene samo na englesku dokumentaciju
- **Prijevodi**: Mapu prijevoda nije ažurirana u ovoj verziji (automatizirani prijevodi bit će sinkronizirani naknadno)
- **Trajanje radionice**: Cijela radionica sada pruža 3-4 sata praktičnog učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: Nadzor, sigurnost i obrasci za više agenata
**Ova verzija dodaje sveobuhvatne lekcije A razine o integraciji Application Insights, obrascima autentikacije i koordinaciji više agenata za produkcijska postavljanja.**

#### Dodano
- **📊 Lekcija integracije Application Insights**: u `docs/pre-deployment/application-insights.md`:
  - Fokusirano na AZD implementaciju s automatskim reprovizioniranjem
  - Potpuni Bicep predlošci za Application Insights + Log Analytics
  - Funkcionalne Python aplikacije s prilagođenom telemetrijom (1.200+ linija)
  - Obrasci nadzora AI/LLM (praćenje tokena/troškova Microsoft Foundry modela)
  - 6 Mermaid dijagrama (arhitektura, distribuirano praćenje, protok telemetrije)
  - 3 praktične vježbe (uzbune, nadzorne ploče, AI nadzor)
  - Primjeri Kusto upita i strategije optimizacije troškova
  - Striming metrika uživo i otklanjanje pogrešaka u stvarnom vremenu
  - Vrijeme učenja 40-50 minuta s produkcijskim obrascima

- **🔐 Lekcija o obrascima autentikacije i sigurnosti**: u `docs/getting-started/authsecurity.md`:
  - 3 obrasca autentikacije (connection string, Key Vault, upravljani identitet)
  - Potpuni Bicep predlošci infrastrukture za sigurna postavljanja
  - Node.js aplikacijski kod s integracijom Azure SDK
  - 3 potpune vježbe (omogućavanje upravljanog identiteta, korisnički dodijeljen identitet, rotacija Key Vaulta)
  - Najbolje sigurnosne prakse i konfiguracije RBAC-a
  - Vodič za otklanjanje poteškoća i analiza troškova
  - Produkcijski obrasci autentikacije bez lozinke

- **🤖 Lekcija o obrascima koordinacije više agenata**: u `docs/pre-deployment/coordination-patterns.md`:
  - 5 obrazaca koordinacije (sekvencijalni, paralelni, hijerarhijski, pokretan događajima, konsenzus)
  - Potpuna implementacija servisa orkestratora (Python/Flask, 1.500+ linija)
  - 3 specijalizirane implementacije agenata (istraživač, pisac, urednik)
  - Integracija Service Bus za redove poruka
  - Upravljanje stanjima Cosmos DB za distribuirane sustave
  - 6 Mermaid dijagrama koji prikazuju interakcije agenata
  - 3 napredne vježbe (obrada timeouta, logika ponavljanja, prekidač struje)
  - Raspodjela troškova ($240-565/mjesečno) s optimizacijskim strategijama
  - Integracija Application Insights za nadzor

#### Poboljšano
- **Poglavlje Prije postavljanja**: Sada uključuje sveobuhvatne obrasce nadzora i koordinacije
- **Poglavlje Za početak**: Poboljšano profesionalnim obrascima autentikacije
- **Spremnost za produkciju**: Potpuno obuhvaćena sigurnost i operabilnost
- **Sadržaj tečaja**: Ažurirano s referencama na nove lekcije u poglavljima 3 i 6

#### Promijenjeno
- **Progresija učenja**: Bolja integracija sigurnosti i nadzora kroz cijeli tečaj
- **Kvaliteta dokumentacije**: Konzistentni standardi A razine (95-97%) u novim lekcijama
- **Obrasci za produkciju**: Potpuna pokrivenost za enterprise postavljanja

#### Poboljšano
- **Iskustvo programera**: Jasan put od razvoja do nadzora u produkciji
- **Sigurnosni standardi**: Profesionalni obrasci za autentikaciju i upravljanje tajnama
- **Operabilnost**: Potpuna integracija Application Insights s AZD
- **AI opterećenja**: Specijalizirani nadzor za Microsoft Foundry modele i sustave s više agenata

#### Održano
- ✅ Sve lekcije uključuju potpuni radni kod (nije samo isječak)
- ✅ Mermaid dijagrami za vizualno učenje (ukupno 19 kroz 3 lekcije)
- ✅ Praktične vježbe s koracima provjere (ukupno 9)
- ✅ Produkcijski Bicep predlošci postavljivi putem `azd up`
- ✅ Analize troškova i strategije optimizacije
- ✅ Vodiči za otklanjanje poteškoća i najbolje prakse
- ✅ Kontrolne točke znanja s naredbama za verifikaciju

#### Rezultati ocjenjivanja dokumentacije
- **docs/pre-deployment/application-insights.md**: - Sveobuhvatan vodič za nadzor
- **docs/getting-started/authsecurity.md**: - Profesionalni obrasci sigurnosti
- **docs/pre-deployment/coordination-patterns.md**: - Napredne arhitekture za više agenata
- **Ukupno novi sadržaj**: - Konzistentni visokokvalitetni standardi

#### Tehnička provedba
- **Application Insights**: Log Analytics + prilagođena telemetrija + distribuirano praćenje
- **Autentikacija**: Upravljani identitet + Key Vault + obrasci RBAC-a
- **Više agenata**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Nadzor**: Metričke podatke uživo + Kusto upiti + uzbune + nadzorne ploče
- **Upravljanje troškovima**: Strategije uzorkovanja, politike zadržavanja, kontrola budžeta

### [v3.7.0] - 2025-11-19

#### Poboljšanja kvalitete dokumentacije i novi primjer Microsoft Foundry modela
**Ova verzija poboljšava kvalitetu dokumentacije u cijelom spremištu i dodaje potpuni primjer postavljanja Microsoft Foundry modela s gpt-4.1 chat sučeljem.**

#### Dodano
- **🤖 Primjer chata Microsoft Foundry modela**: Potpuno postavljanje gpt-4.1 s funkcionalnom implementacijom u `examples/azure-openai-chat/`:
  - Potpuna infrastruktura Microsoft Foundry modela (postavljanje gpt-4.1 modela)
  - Python chat sučelje iz naredbenog retka s poviješću razgovora
  - Integracija Key Vaulta za sigurno pohranjivanje API ključeva
  - Praćenje upotrebe tokena i procjena troškova
  - Ograničavanje brzine i rukovanje pogreškama
  - Sveobuhvatan README s vodičem za postavljanje od 35-45 minuta
  - 11 datoteka spremnih za produkciju (Bicep predlošci, Python app, konfiguracija)
- **📚 Vježbe dokumentacije**: Dodane praktične vježbe za vodič konfiguracije:
  - Vježba 1: Više okruženja konfiguracija (15 minuta)
  - Vježba 2: Praksa upravljanja tajnama (10 minuta)
  - Jasni kriteriji uspjeha i koraci verifikacije
- **✅ Verifikacija postavljanja**: Dodan odjeljak za verifikaciju u vodič za postavljanje:
  - Postupci provjere zdravlja
  - Kontrolni popis kriterija uspjeha
  - Očekivani izlazi za sve naredbe postavljanja
  - Brza referenca za otklanjanje poteškoća

#### Poboljšano
- **examples/README.md**: Ažurirano na kvalitetu A razine (93%):
  - Dodan azure-openai-chat u sve relevantne odjeljke
  - Ažuriran broj lokalnih primjera s 3 na 4
  - Dodan u tablicu AI primjera aplikacija
  - Integriran u Quick Start za srednjo napredne korisnike
  - Dodan u Microsoft Foundry Templates odjeljak
  - Ažurirana matrica usporedbe i odjeljci s tehničkim pronalascima
- **Kvaliteta dokumentacije**: Poboljšano s B+ (87%) → A- (92%) u mapi docs:
  - Dodani očekivani izlazi u ključne primjere naredbi
  - Uključeni koraci za verifikaciju promjena konfiguracije
  - Poboljšano praktično učenje s vježbama

#### Promijenjeno
- **Progresija učenja**: Bolja integracija AI primjera za srednjo napredne učenike
- **Struktura dokumentacije**: Akcionije vježbe s jasnim rezultatima
- **Proces verifikacije**: Eksplitični kriteriji uspjeha dodani ključnim procesima

#### Poboljšano
- **Iskustvo programera**: Postavljanje Microsoft Foundry modela sada traje 35-45 minuta (u odnosu na 60-90 za složenije alternative)
- **Transparentnost troškova**: Jasne procjene troškova ($50-200/mjesečno) za primjer Microsoft Foundry modela
- **Put učenja**: AI programeri imaju jasan početak s azure-openai-chat
- **Standardi dokumentacije**: Konzistentni očekivani izlazi i koraci verifikacije

#### Potvrđeno
- ✅ Microsoft Foundry Models primjer u potpunosti funkcionalan s `azd up`
- ✅ Sve 11 implementacijske datoteke sintaktički ispravne
- ✅ Upute u README se slažu s stvarnim iskustvom postavljanja
- ✅ Poveznice u dokumentaciji ažurirane na 8+ lokacija
- ✅ Indeks primjera točno prikazuje 4 lokalna primjera
- ✅ Nema ponovljenih vanjskih poveznica u tablicama
- ✅ Sve reference navigacije ispravne

#### Tehnička provedba
- **Arhitektura Microsoft Foundry modela**: gpt-4.1 + Key Vault + Container Apps obrazac
- **Sigurnost**: Spreman upravljani identitet, tajne u Key Vaultu
- **Nadzor**: Integracija Application Insights
- **Upravljanje troškovima**: Praćenje tokena i optimizacija upotrebe
- **Postavljanje**: Jedinstvena `azd up` naredba za cjelokupnu konfiguraciju

### [v3.6.0] - 2025-11-19

#### Veliko ažuriranje: Primjeri postavljanja Container App aplikacija
**Ova verzija uvodi sveobuhvatne, produkcijski spremne primjere postavljanja kontejnerskih aplikacija koristeći Azure Developer CLI (AZD), s punom dokumentacijom i integracijom u put učenja.**

#### Dodano
- **🚀 Primjeri Container App aplikacija**: Novi lokalni primjeri u `examples/container-app/`:
  - [Glavni vodič](examples/container-app/README.md): Potpun pregled kontejneriziranih implementacija, brzi početak, produkcija i napredni obrasci
  - [Jednostavan Flask API](../../examples/container-app/simple-flask-api): REST API prilagođen početnicima s mjerenjem na nulu, zdravstvenim sondama, nadzorom i otklanjanjem poteškoća
  - [Mikroservisna arhitektura](../../examples/container-app/microservices): Produkcijski spremna implementacija s više servisa (API Gateway, Product, Order, User, Notification), asinkrono poručivanje, Service Bus, Cosmos DB, Azure SQL, distribuirano praćenje, plavo-zelena/canary implementacija
- **Najbolje prakse**: Sigurnost, nadzor, optimizacija troškova i smjernice za CI/CD za kontejnerizirane radne opterećenja
- **Primjeri koda**: Potpuni `azure.yaml`, Bicep predlošci i implementacije servisa na više jezika (Python, Node.js, C#, Go)
- **Testiranje i otklanjanje poteškoća**: Scenariji testiranja od kraja do kraja, naredbe za nadzor, smjernice za otklanjanje poteškoća

#### Izmijenjeno
- **README.md**: Ažuriran za prikaz i povezivanje novih prikaza kontejnerskih aplikacija pod "Lokalni primjeri - Kontejnerske aplikacije"
- **examples/README.md**: Ažuriran za isticanje primjera kontejnerskih aplikacija, dodavanje unosa matrice usporedbe i ažuriranje referenci na tehnologiju/arhitekturu
- **Plan tečaja i vodič za proučavanje**: Ažuriran za referenciranje novih primjera kontejnerskih aplikacija i obrazaca implementacije u relevantnim poglavljima

#### Validirano
- ✅ Svi novi primjeri mogu se implementirati s `azd up` i prate najbolje prakse
- ✅ Prelazne poveznice u dokumentaciji i navigacija ažurirani
- ✅ Primjeri pokrivaju scenarije od početničkih do naprednih, uključujući produkcijske mikroservise

#### Bilješke
- **Opseg**: Samo engleska dokumentacija i primjeri
- **Sljedeći koraci**: Proširiti dodatnim naprednim obrascima kontejnera i automatizacijom CI/CD u budućim izdanjima

### [v3.5.0] - 2025-11-19

#### Rebrendiranje proizvoda: Microsoft Foundry
**Ova verzija provodi sveobuhvatnu promjenu naziva proizvoda s "Microsoft Foundry" na "Microsoft Foundry" u cijeloj engleskoj dokumentaciji, odražavajući službeno rebrendiranje Microsofta.**

#### Izmijenjeno
- **🔄 Ažuriranje naziva proizvoda**: Potpuno rebrendiranje s "Microsoft Foundry" na "Microsoft Foundry"
  - Ažurirane sve reference kroz englesku dokumentaciju u `docs/` mapi
  - Preimenovana mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Ukupno: 23 reference sadržaja ažurirane u 7 datoteka dokumentacije

- **📁 Promjene strukture mapa**:
  - `docs/ai-foundry/` preimenovana u `docs/microsoft-foundry/`
  - Sve međureferencije ažurirane za odražavanje nove strukture mapa
  - Navigacijske poveznice potvrđene kroz svu dokumentaciju

- **📄 Preimenovanja datoteka**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Sve interne poveznice ažurirane za nove nazive datoteka

#### Ažurirane datoteke
- **Dokumentacija poglavlja** (7 datoteka):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ažuriranja navigacijskih poveznica
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ažuriranja naziva proizvoda
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Već koristi Microsoft Foundry (iz prethodnih ažuriranja)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 ažurirane reference (pregled, povratne informacije zajednice, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 ažurirane međureferencijske poveznice
  - `docs/getting-started/first-project.md` - 2 ažurirane navigacijske poveznice poglavlja
  - `docs/getting-started/installation.md` - 2 ažurirane poveznice za sljedeće poglavlje
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 ažurirane reference (navigacija, Discord zajednica)
  - `docs/troubleshooting/common-issues.md` - 1 ažurirana navigacijska poveznica
  - `docs/troubleshooting/debugging.md` - 1 ažurirana navigacijska poveznica

- **Datoteke strukture tečaja** (2 datoteke):
  - `README.md` - 17 ažuriranih referenci (pregled tečaja, naslovi poglavlja, odjeljak predložaka, uvidi zajednice)
  - `course-outline.md` - 14 ažuriranih referenci (pregled, ciljevi učenja, resursi poglavlja)

#### Validirano
- ✅ Nema preostalih referenci "ai-foundry" mape u engleskoj dokumentaciji
- ✅ Nema preostalih referenci naziva proizvoda "Microsoft Foundry" u engleskoj dokumentaciji
- ✅ Sve navigacijske poveznice funkcioniraju s novom strukturom mapa
- ✅ Preimenovanja datoteka i mapa uspješno završena
- ✅ Međureferencije između poglavlja potvrđene

#### Bilješke
- **Opseg**: Promjene primijenjene samo u engleskoj dokumentaciji u `docs/` mapi
- **Prijevodi**: Mape prijevoda (`translations/`) nisu ažurirane u ovoj verziji
- **Radionica**: Materijali radionice (`workshop/`) nisu ažurirani u ovoj verziji
- **Primjeri**: Datoteke primjera mogu još uvijek sadržavati nasljedne nazive (bit će riješeno u budućem ažuriranju)
- **Vanjske poveznice**: Vanjski URL-ovi i GitHub repozitoriji ostaju nepromijenjeni

#### Vodič za migraciju za suradnike
Ako imate lokalne grane ili dokumentaciju koja referencira staru strukturu:
1. Ažurirajte reference mapa: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ažurirajte reference datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamijenite naziv proizvoda: "Microsoft Foundry" → "Microsoft Foundry"
4. Provjerite da sve interne poveznice u dokumentaciji i dalje rade

---

### [v3.4.0] - 2025-10-24

#### Poboljšanja pregleda i validacije infrastrukture
**Ova verzija uvodi opsežnu podršku za novu preview značajku Azure Developer CLI i poboljšava korisničko iskustvo radionice.**

#### Dodano
- **🧪 Dokumentacija značajke azd provision --preview**: Detaljan opis nove mogućnosti pregleda infrastrukture
  - Referenca naredbi i primjeri korištenja u praktičnom vodiču
  - Detaljna integracija u vodiču za provision s upotrebom i prednostima
  - Integracija provjere prije leta za sigurniju validaciju implementacije
  - Ažuriranja vodiča za početak rada s praksama sigurnosti za prvo implementiranje
- **🚧 Banner statusa radionice**: Profesionalni HTML banner koji označava status razvoja radionice
  - Dizajn s gradijentom i indikatorima izgradnje za jasnu komunikaciju korisnicima
  - Zapis o posljednjem ažuriranju radi transparentnosti
  - Dizajn prilagođen mobilnim uređajima svih tipova

#### Poboljšano
- **Sigurnost infrastrukture**: Pregled funkcionalnosti integriran kroz cijelu dokumentaciju implementacije
- **Validacija prije implementacije**: Automatizirani skripti sad uključuju testiranje infrastrukture u preview modu
- **Radni tok developera**: Ažurirane sekvence naredbi koje uklјučuju preview kao najbolju praksu
- **Iskustvo radionice**: Jasna obavijest korisnicima o statusu razvoja sadržaja

#### Izmijenjeno
- **Najbolje prakse implementacije**: Preporučeni pristup sada je workflow s prioritetom na preview
- **Tok dokumentacije**: Validacija infrastrukture premještena ranije u proces učenja
- **Prezentacija radionice**: Profesionalna komunikacija statusa s jasnim vremenskim okvirom razvoja

#### Poboljšano
- **Pristup usmjeren na sigurnost**: Sada je moguće validirati promjene infrastrukture prije implementacije
- **Timsku suradnju**: Rezultate pregleda moguće dijeliti na ocjenu i odobrenje
- **Svesnost troškova**: Bolje razumjevanje troškova resursa prije provisioninga
- **Ublažavanje rizika**: Smanjenje neuspjeha implementacije zahvaljujući naprednoj validaciji

#### Tehnička implementacija
- **Integracija više dokumenata**: Opis preview značajke u 4 ključne datoteke
- **Obrasci naredbi**: Konzistentna sintaksa i primjeri kroz cijelu dokumentaciju
- **Integracija najbolje prakse**: Preview uključen u validacijske radne tokove i skripte
- **Vizualne oznake**: Jasna oznaka NOVE značajke radi bolje vidljivosti

#### Infrastruktura radionice
- **Komunikacija statusa**: Profesionalni HTML banner s gradijentnim stilom
- **Korisničko iskustvo**: Jasan status razvoja sprječava zabunu
- **Profesionalna prezentacija**: Održava povjerenje u repozitorij istovremeno postavljajući očekivanja
- **Transparentnost vremenskog okvira**: Označeno kao zadnje ažuriranje u listopadu 2025. radi odgovornosti

### [v3.3.0] - 2025-09-24

#### Poboljšani materijali radionice i interaktivno učenje
**Ova verzija uvodi opsežne materijale radionice s vodičima baziranim na pregledniku i strukturiranim putovima učenja.**

#### Dodano
- **🎥 Interaktivni vodič za radionicu**: Radionica u pregledniku s mogućnošću pregleda MkDocs
- **📝 Strukturirane upute radionice**: 7-korak vođeni put učenja od otkrivanja do prilagodbe
  - 0-Uvod: Pregled i postavljanje radionice
  - 1-Odabir AI predloška: Proces pronalaženja i odabira predloška
  - 2-Validacija AI predloška: Postupci implementacije i validacije
  - 3-Razgradnja AI predloška: Razumijevanje arhitekture predloška
  - 4-Konfiguracija AI predloška: Postavke i prilagodba
  - 5-Prilagodba AI predloška: Napredne modifikacije i iteracije
  - 6-Uklanjanje infrastrukture: Čišćenje i upravljanje resursima
  - 7-Završetak: Sažetak i sljedeći koraci
- **🛠️ Alati radionice**: MkDocs konfiguracija s Material temom za poboljšano iskustvo učenja
- **🎯 Praktični put učenja**: 3-korak metodologija (Otkrivanje → Implementacija → Prilagodba)
- **📱 Integracija GitHub Codespaces**: Neprimjetno postavljanje razvojne okoline

#### Poboljšano
- **AI laboratorij radionice**: Proširen s opsežnim 2-3 satnim strukturiranim učenjem
- **Dokumentacija radionice**: Profesionalna prezentacija s navigacijom i vizualnim pomagalima
- **Napredak u učenju**: Jasne upute korak po korak od odabira predloška do produkcijske implementacije
- **Iskustvo developera**: Integrirani alati za pojednostavljene razvojne radne tokove

#### Poboljšano
- **Pristupačnost**: Sučelje u pregledniku s pretraživanjem, funkcijom kopiranja i promjenom teme
- **Učenje vlastitim tempom**: Fleksibilna struktura radionice koja podržava različite brzine učenja
- **Praktična primjena**: Implementacijski scenariji stvarnog svijeta za AI predloške
- **Integracija zajednice**: Integracija Discord zajednice za podršku i suradnju na radionici

#### Značajke radionice
- **Ugrađeno pretraživanje**: Brzo pronalaženje ključnih riječi i lekcija
- **Kopiranje blokova koda**: Funkcija kopiranja pri prelasku mišem za sve primjere koda
- **Prekidač teme**: Podrška za tamni/svjetli način rada prema preferencijama
- **Vizualni elementi**: Snimke zaslona i dijagrami za bolje razumijevanje
- **Integracija pomoći**: Izravni pristup Discord zajednici za podršku

### [v3.2.0] - 2025-09-17

#### Velika reorganizacija navigacije i sustav učenja po poglavljima
**Ova verzija uvodi sveobuhvatan sustav učenja po poglavljima s poboljšanom navigacijom kroz cijeli repozitorij.**

#### Dodano
- **📚 Sustav učenja po poglavljima**: Cijeli tečaj restrukturiran u 8 progresivnih poglavlja
  - Poglavlje 1: Osnove i brzi početak (⭐ - 30-45 min)
  - Poglavlje 2: AI-prvo razvoj (⭐⭐ - 1-2 sata)
  - Poglavlje 3: Konfiguracija i autentikacija (⭐⭐ - 45-60 min)
  - Poglavlje 4: Infrastructure as Code i implementacija (⭐⭐⭐ - 1-1,5 sati)
  - Poglavlje 5: Višeagentna AI rješenja (⭐⭐⭐⭐ - 2-3 sata)
  - Poglavlje 6: Validacija i planiranje prije implementacije (⭐⭐ - 1 sat)
  - Poglavlje 7: Otklanjanje poteškoća i debugiranje (⭐⭐ - 1-1,5 sati)
  - Poglavlje 8: Produkcijski i korporativni obrasci (⭐⭐⭐⭐ - 2-3 sata)
- **📚 Sveobuhvatan navigacijski sustav**: Dosljedni navigacijski zaglavlja i podnožja kroz cijelu dokumentaciju
- **🎯 Praćenje napretka**: Lista za provjeru završetka tečaja i sustav provjere učenja
- **🗺️ Upute za put učenja**: Jasne početne točke za različite razine iskustva i ciljeve
- **🔗 Navigacija međureferencama**: Jasno povezano povezivanje povezanih poglavlja i preduvjeta

#### Poboljšano
- **Struktura README-a**: Pretvorena u strukturiranu platformu za učenje s organizacijom po poglavljima
- **Navigacija dokumentacije**: Svaka stranica sada uključuje kontekst poglavlja i upute za napredak
- **Organizacija predložaka**: Primjeri i predlošci mapirani u odgovarajuća poglavlja za učenje
- **Integracija resursa**: Prečaci, FAQ i vodiči za proučavanje povezani s relevantnim poglavljima
- **Integracija radionice**: Praktične laboratorije mapirane s ciljevima učenja u više poglavlja

#### Izmijenjeno
- **Napredak u učenju**: Premještanje s linearne dokumentacije na fleksibilno učenje po poglavljima
- **Smještaj konfiguracije**: Vodič za konfiguraciju premješten u Poglavlje 3 za bolji tijek učenja
- **Integracija AI sadržaja**: Bolja integracija AI specifičnog sadržaja kroz cijeli proces učenja
- **Produkcijski sadržaj**: Napredni obrasci objedinjeni u Poglavlju 8 za korporativne korisnike

#### Poboljšano
- **Korisničko iskustvo**: Jasne oznake navigacije i pokazatelji napretka kroz poglavlja
- **Pristupačnost**: Dosljedni obrasci navigacije radi lakšeg kretanja po tečaju
- **Profesionalna prezentacija**: Struktura tečaja u stilu sveučilišta prikladna za akademsku i korporativnu edukaciju
- **Učinkovitost učenja**: Smanjeno vrijeme pronalaska relevantnog sadržaja kroz poboljšanu organizaciju

#### Tehnička implementacija
- **Navigacijska zaglavlja**: Standardizirana navigacija po poglavljima kroz 40+ datoteka dokumentacije
- **Navigacija podnožja**: Dosljedne upute za napredak i pokazatelji završetka poglavlja
- **Međupovezivanje**: Sveobuhvatan sustav internih poveznica koji povezuje povezane koncepte
- **Mapiranje poglavlja**: Predlošci i primjeri jasno povezani s ciljevima učenja

#### Poboljšanje vodiča za proučavanje
- **📚 Sveobuhvatni ciljevi učenja**: Restrukturiran vodič za proučavanje usklađen s 8-poglavnim sustavom
- **🎯 Procjena po poglavljima**: Svako poglavlje uključuje specifične ciljeve učenja i praktične zadatke
- **📋 Praćenje napretka**: Tjedni plan učenja s mjerljivim rezultatima i listama za provjeru
- **❓ Pitanja za procjenu**: Pitanja za provjeru znanja za svako poglavlje s profesionalnim ishodima
- **🛠️ Praktične vježbe**: Aktivnosti iz prakse s primjerima implementacije i otklanjanjem poteškoća
- **📊 Napredak vještina**: Jasno napredovanje od osnovnih pojmova do korporativnih obrazaca s fokusom na razvoj karijere
- **🎓 Okvir certifikacije**: Profesionalni razvojni ishodi i sustav prepoznavanja zajednice
- **⏱️ Upravljanje vremenskim okvirom**: Strukturirani 10-tjedni plan učenja s validacijom ključnih faza

### [v3.1.0] - 2025-09-17

#### Poboljšana višestruka agentska AI rješenja
**Ova verzija poboljšava višestruko agentsko rješenje u maloprodaji boljim imenovanjem agenata i poboljšanom dokumentacijom.**

#### Izmijenjeno
- **Terminologija Više-agenta**: Zamijenjen "Cora agent" s "Customer agent" kroz cijelo maloprodajno višelagentsko rješenje radi jasnijeg razumijevanja
- **Agentna Arhitektura**: Ažurirana sva dokumentacija, ARM predlošci i primjeri koda za dosljedno korištenje naziva "Customer agent"
- **Primjeri Konfiguracije**: Modernizirani obrasci konfiguracije agenta s ažuriranim konvencijama imenovanja
- **Dosljednost Dokumentacije**: Osigurano da svi navodi koriste profesionalne, opisne nazive agenata

#### Poboljšano
- **ARM Paket Predložaka**: Ažuriran retail-multiagent-arm-template s referencama na Customer agent
- **Arhitektonske Dijagrame**: Osvježeni Mermaid dijagrami s ažuriranim imenima agenata
- **Primjeri Koda**: Python klase i primjeri implementacije sada koriste CustomerAgent naziv
- **Varijable Okruženja**: Ažurirani svi skripti za implementaciju da koriste CUSTOMER_AGENT_NAME konvencije

#### Poboljšano
- **Iskustvo Razvijatelja**: Jasnije uloge i odgovornosti agenata u dokumentaciji
- **Spremnost za Produkciju**: Bolja usklađenost s poduzećnim konvencijama imenovanja
- **Materijali za Učenje**: Intuitivnija imena agenata za obrazovne svrhe
- **Upotrebljivost Predložaka**: Pojednostavljeno razumijevanje funkcija agenata i obrazaca implementacije

#### Tehnički Detalji
- Ažurirani Mermaid arhitektonski dijagrami sa CustomerAgent referencama
- Zamijenjena imena CoraAgent klasa s CustomerAgent u Python primjerima
- Modificirane ARM JSON konfiguracije za korištenje tipa agenta "customer"
- Ažurirane varijable okruženja s CORA_AGENT_* na CUSTOMER_AGENT_* obrasce
- Osvježene sve naredbe za implementaciju i konfiguracije kontejnera

### [v3.0.0] - 2025-09-12

#### Glavne Promjene - Fokus na AI Razvijatelje i Microsoft Foundry Integraciju
**Ova verzija transformira spremište u sveobuhvatan AI usmjereni izvor za učenje s integracijom Microsoft Foundry.**

#### Dodano
- **🤖 AI-Primarni Put Učenja**: Potpuna restrukturacija koja daje prioritet AI razvijateljima i inženjerima
- **Vodič za Microsoft Foundry Integraciju**: Sveobuhvatna dokumentacija za povezivanje AZD s Microsoft Foundry uslugama
- **Obrasci Implementacije AI Modela**: Detaljni vodič za izbor modela, konfiguraciju i strategije implementacije u produkciju
- **AI Radionica-Laboratorij**: 2-3 sata praktične radionice za pretvaranje AI aplikacija u rješenja implementabilna putem AZD
- **Najbolje Prakse za AI u Produkciji**: Uzorci spremni za poduzeća za skaliranje, nadzora i osiguravanja AI radnih opterećenja
- **Vodič za AI Specifično Rješavanje Problema**: Sveobuhvatno otklanjanje poteškoća za Microsoft Foundry modele, Kognitivne usluge i AI implementacijske probleme
- **Galerija AI Predložaka**: Istaknuta zbirka Microsoft Foundry predložaka s ocjenama složenosti
- **Materijali Radionice**: Potpuna struktura radionice s praktičnim laboratorijima i referentnim materijalima

#### Poboljšano
- **Struktura README-a**: Fokus na AI razvijatelje s 45% podataka o interesu zajednice s Microsoft Foundry Discorda
- **Putovi Učenja**: Posvećene AI razvojne staze zajedno s tradicionalnim stazama za studente i DevOps inženjere
- **Preporuke Predložaka**: Istaknuti AI predlošci uključujući azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart
- **Integracija Zajednice**: Poboljšana podrška Discord zajednici s AI-specifičnim kanalima i raspravama

#### Sigurnost i Fokus na Produkciju
- **Predlošci Upravljanog Identiteta**: AI-specifične konfiguracije autentikacije i sigurnosti
- **Optimizacija Troškova**: Praćenje korištenja tokena i kontrola budžeta za AI radna opterećenja
- **Implementacija u Više Regija**: Strategije za globalnu implementaciju AI aplikacija
- **Praćenje Performansi**: AI-specifični metrički podaci i integracija Application Insights

#### Kvaliteta Dokumentacije
- **Linearni Kurs**: Logičan napredak od početničkih do naprednih AI obrazaca implementacije
- **Validirani URL-ovi**: Svi vanjski linkovi na spremište potvrđeni i dostupni
- **Potpune Reference**: Svi interni dokumentacijski linkovi potvrđeni i funkcionalni
- **Spremno za Produkciju**: Uzorci implementacije za poduzeća sa stvarnim primjerima

### [v2.0.0] - 2025-09-09

#### Glavne Promjene - Restrukturiranje Spremišta i Profesionalno Poboljšanje
**Ova verzija predstavlja značajnu reviziju strukture spremišta i prezentacije sadržaja.**

#### Dodano
- **Strukturirani Okvir za Učenje**: Sve stranice dokumentacije sada uključuju uvod, ciljeve učenja i ishode učenja
- **Sustav Navigacije**: Dodani linkovi NAZAD/NAPRIJED između lekcija kroz cijelu dokumentaciju za vođeni napredak u učenju
- **Vodič za Učenje**: Sveobuhvatni study-guide.md s ciljevima učenja, vježbama i materijalima za procjenu
- **Profesionalna Prezentacija**: Uklonjeni svi emoji ikoni radi bolje pristupačnosti i profesionalnog izgleda
- **Poboljšana Struktura Sadržaja**: Unaprijeđena organizacija i protok obrazovnih materijala

#### Promijenjeno
- **Format Dokumentacije**: Standardizirana sva dokumentacija s dosljednom strukturom usmjerenom na učenje
- **Tok Navigacije**: Implementiran logički napredak kroz sve materijale za učenje
- **Prezentacija Sadržaja**: Uklonjeni ukrasni elementi u korist jasnog, profesionalnog formatiranja
- **Struktura Linkova**: Ažurirani svi interni linkovi za podršku novom sustavu navigacije

#### Poboljšano
- **Pristupačnost**: Uklonjene ovisnosti o emojijima za bolju kompatibilnost s čitačima ekrana
- **Profesionalni Izgled**: Čista, akademski stilizirana prezentacija prikladna za poduzećno učenje
- **Iskustvo Učenja**: Strukturirani pristup s jasnim ciljevima i ishodima za svaku lekciju
- **Organizacija Sadržaja**: Bolji logički protok i povezivanje povezanih tema

### [v1.0.0] - 2025-09-09

#### Početno Izdanje - Sveobuhvatni AZD Spremište za Učenje

#### Dodano
- **Osnovna Struktura Dokumentacije**
  - Potpuna serija vodiča za početak rada
  - Sveobuhvatna dokumentacija za implementaciju i provisiju
  - Detaljni izvori za rješavanje problema i vodiči za otklanjanje grešaka
  - Alati i procedure za validaciju prije implementacije

- **Modul Početak Rada**
  - AZD Osnove: Temeljni pojmovi i terminologija
  - Vodič za Instalaciju: Upute za postavljanje specifične za platformu
  - Vodič za Konfiguraciju: Postavljanje okruženja i autentikacija
  - Prvi Projekt Tutorial: Hands-on učenje korak po korak

- **Modul Implementacije i Provisije**
  - Vodič za Implementaciju: Potpuna dokumentacija tijeka rada
  - Vodič za Provisiju: Infrastruktura kao kod pomoću Bicep
  - Najbolje prakse za produkcijske implementacije
  - Obrasci arhitekture višestrukih usluga

- **Modul Validacije prije Implementacije**
  - Planiranje Kapaciteta: Validacija dostupnosti Azure resursa
  - Izbor SKU: Sveobuhvatne smjernice za slojeve usluga
  - Pre-flight Provjere: Automatizirani validacijski skripti (PowerShell i Bash)
  - Alati za procjenu troškova i planiranje budžeta

- **Modul Rješavanja Problema**
  - Uobičajeni Problemi: Često susretani problemi i rješenja
  - Vodič za Otklanjanje Grešaka: Sistematske metodologije rješavanja problema
  - Napredne dijagnostičke tehnike i alati
  - Praćenje performansi i optimizacija

- **Resursi i Reference**
  - Prečac naredbi: Brza referenca za ključne naredbe
  - Rječnik: Sveobuhvatne definicije terminologije i akronima
  - FAQ: Detaljni odgovori na česta pitanja
  - Linkovi prema vanjskim resursima i zajednici

- **Primjeri i Predlošci**
  - Primjer Jednostavne Web Aplikacije
  - Predložak za implementaciju statične web stranice
  - Konfiguracija kontejnerske aplikacije
  - Obrasci integracije baze podataka
  - Primjeri arhitekture mikroservisa
  - Implementacije bezposlužnih funkcija

#### Značajke
- **Višeplatformska Podrška**: Vodiči za instalaciju i konfiguraciju za Windows, macOS i Linux
- **Više Razina Znanja**: Sadržaj dizajniran za studente do profesionalnih programera
- **Praktični Fokus**: Hands-on primjeri i stvarni scenariji
- **Sveobuhvatna Pokrivenost**: Od osnovnih pojmova do naprednih obrazaca za poduzeća
- **Sigurnost kao Prioritet**: Najbolje sigurnosne prakse integrirane kroz cijeli sadržaj
- **Optimizacija Troškova**: Smjernice za isplative implementacije i upravljanje resursima

#### Kvaliteta Dokumentacije
- **Detaljni Primjeri Koda**: Praktični, testirani uzorci koda
- **Upute Korak-po-Korak**: Jasne, provedive smjernice
- **Sveobuhvatno Rješavanje Problema**: Otklanjanje grešaka za uobičajene probleme
- **Integracija Najboljih Praksi**: Industrijski standardi i preporuke
- **Kompatibilnost Verzija**: Ažurirano s najnovijim Azure servisima i azd značajkama

## Planirana Buduća Poboljšanja

### Verzija 3.1.0 (Planirano)
#### Proširenje AI Platforme
- **Podrška za Više Modela**: Obrasci integracije za Hugging Face, Azure Machine Learning i prilagođene modele
- **AI Agenti Okviri**: Predlošci za LangChain, Semantic Kernel i AutoGen implementacije
- **Napredni RAG Obrasci**: Opcije vektorskih baza podataka izvan Azure AI Search (Pinecone, Weaviate, itd.)
- **AI Promatranje**: Poboljšano praćenje performansi modela, korištenja tokena i kvalitete odgovora

#### Iskustvo Razvijatelja
- **VS Code Proširenje**: Integrirano AZD + Microsoft Foundry razvojno iskustvo
- **GitHub Copilot Integracija**: AI-podržana generacija AZD predložaka
- **Interaktivni Tutorijali**: Praktične kodne vježbe s automatiziranom validacijom za AI scenarije
- **Video Sadržaj**: Dodatni video tutorijali za vizualne učenike usmjereni na AI implementacije

### Verzija 4.0.0 (Planirano)
#### Poduzećni AI Obrasci
- **Okvir Upravljanja**: Upravljanje AI modelima, usklađenost i revizijske staze
- **Više-Tenant AI**: Obrasci za servisiranje više korisnika s izoliranim AI uslugama
- **Edge AI Implementacija**: Integracija s Azure IoT Edge i kontejnerskim instancama
- **Hibridni Cloud AI**: Multicloud i hibridni obrasci implementacije za AI radna opterećenja

#### Napredne Značajke
- **Automatizacija AI Pipelinea**: MLOps integracija s Azure Machine Learning pipelineovima
- **Napredna Sigurnost**: Zero-trust obrasci, privatne usluge i napredna zaštita od prijetnji
- **Optimizacija Performansi**: Napredna podešavanja i strategije skaliranja za visokoprotočne AI aplikacije
- **Globalna Distribucija**: Obrasci isporuke sadržaja i edge cache za AI aplikacije

### Verzija 3.0.0 (Planirano) - Zamijenjeno Trenutačnim Izdavanjem
#### Predloženi Dodaci - Sada Implementirani u v3.0.0
- ✅ **AI-Fokusirani Sadržaj**: Sveobuhvatna Microsoft Foundry integracija (Završeno)
- ✅ **Interaktivni Tutorijali**: Hands-on AI radionica laboratorij (Završeno)
- ✅ **Napredni Sigurnosni Modul**: AI-specifični sigurnosni obrasci (Završeno)
- ✅ **Optimizacija Performansi**: Strategije podešavanja AI radnih opterećenja (Završeno)

### Verzija 2.1.0 (Planirano) - Djelomično Implementirano u v3.0.0
#### Manja Poboljšanja - Neka Završena u Trenutačnom Izdanju
- ✅ **Dodatni Primjeri**: AI-fokusirani scenariji implementacije (Završeno)
- ✅ **Prošireni FAQ**: AI-specifična pitanja i rješavanje problema (Završeno)
- **Integracija Alata**: Poboljšani vodiči za IDE i uređivače
- ✅ **Proširenje Praćenja**: AI-specifični obrasci praćenja i upozorenja (Završeno)

#### Još Planirano za Buduće Izdanje
- **Mobilno Prijateljska Dokumentacija**: Responzivni dizajn za mobilno učenje
- **Pristup Bez Mreže**: Preuzimajući paketi dokumentacije
- **Poboljšana IDE Integracija**: VS Code proširenje za AZD + AI tijekove rada
- **Zajednički Kontrolni Panel**: Metrički podaci zajednice u stvarnom vremenu i praćenje doprinosa

## Doprinos Popisu Promjena

### Prijavljivanje Promjena
Prilikom doprinosa ovom spremištu, molimo osigurajte da unosi u popis promjena uključuju:

1. **Broj Verzije**: Slijedeći semantičko verzioniranje (glavna.mala.ispravka)
2. **Datum**: Datum izdavanja ili ažuriranja u formatu GGGG-MM-DD
3. **Kategorija**: Dodano, Promijenjeno, Zastarjelo, Uklonjeno, Ispravljeno, Sigurnost
4. **Jasan Opis**: Sažeti opis što je promijenjeno
5. **Procjena Utjecaja**: Kako promjene utječu na postojeće korisnike

### Kategorije Promjena

#### Dodano
- Nove značajke, dijelovi dokumentacije ili mogućnosti
- Novi primjeri, predlošci ili izvori za učenje
- Dodatni alati, skripte ili pomoćni programi

#### Promijenjeno
- Izmjene postojeće funkcionalnosti ili dokumentacije
- Ažuriranja za poboljšanje jasnoće ili točnosti
- Restrukturiranje sadržaja ili organizacije

#### Zastarjelo
- Značajke ili pristupi koji se postupno ukidaju
- Sekcije dokumentacije planirane za uklanjanje
- Metode koje imaju bolje alternative

#### Uklonjeno
- Značajke, dokumentacija ili primjeri koji više nisu relevantni
- Zastarjele informacije ili zastarjeli pristupi
- Suvišan ili objedinjeni sadržaj

#### Ispravljeno
- Ispravci pogrešaka u dokumentaciji ili kodu
- Rješavanje prijavljenih problema ili poteškoća
- Poboljšanja točnosti ili funkcionalnosti

#### Sigurnost
- Poboljšanja ili ispravci vezani uz sigurnost
- Ažuriranja sigurnosnih najboljih praksi
- Rješavanje sigurnosnih ranjivosti

### Smjernice za Semantičko Verzionarstvo

#### Glavna Verzija (X.0.0)
- Promjene koje zahtijevaju akciju korisnika
- Značajno restrukturiranje sadržaja ili organizacije
- Promjene koje mijenjaju temeljni pristup ili metodologiju

#### Manja Verzija (X.Y.0)
- Nove značajke ili dodavanja sadržaja
- Poboljšanja koja održavaju kompatibilnost unazad
- Dodatni primjeri, alati ili resursi

#### Verzija Ispravka (X.Y.Z)
- Ispravci grešaka i korekcije
- Manja poboljšanja postojećeg sadržaja
- Pojašnjenja i sitna poboljšanja

## Povratne Informacije Zajednice i Prijedlozi

Aktivno potičemo povratne informacije zajednice za poboljšanje ovog izvora za učenje:

### Kako Dati Povratne Informacije
- **GitHub Issues**: Prijavite probleme ili predložite poboljšanja (AI-specifični problemi dobrodošli)
- **Discord Rasprave**: Dijelite ideje i uključite se u Microsoft Foundry zajednicu
- **Pull Requests**: Izravno doprinesite poboljšanjima sadržaja, posebno AI predložacima i vodičima
- **Microsoft Foundry Discord**: Sudjelujte u #Azure kanalu za AZD + AI rasprave
- **Zajednički Forumi**: Sudjelujte u širim Azure razvojničkim raspravama

### Kategorije Povratnih Informacija
- **Točnost AI Sadržaja**: Ispravci integracije AI usluga i informacija o implementaciji
- **Iskustvo Učenja**: Prijedlozi za poboljšanje tijeka učenja AI razvijatelja
- **Nedostatak AI Sadržaja**: Zahtjevi za dodatnim AI predlošcima, obrascima ili primjerima
- **Pristupačnost**: Poboljšanja za različite potrebe učenja
- **Integracija AI Alata**: Prijedlozi za bolju integraciju AI radnih tokova razvoja
- **Proizvodni AI Obrasci**: Zahtjevi za obrasce implementacije AI u poduzećima

### Obveza Odgovora
- **Odgovor na Probleme**: Unutar 48 sati za prijavljene probleme
- **Zahtjevi za Značajke**: Procjena unutar jednog tjedna
- **Doprinosi Zajednice**: Pregled unutar jednog tjedna
- **Sigurnosni Problemi**: Odmah prioritetno s ubrzanim odgovorom

## Raspored Održavanja

### Redovna Ažuriranja
- **Mjesečni Pregledi**: Točnost sadržaja i validacija linkova
- **Kvartalna Ažuriranja**: Glavna dodavanja sadržaja i poboljšanja
- **Polugodišnji Pregledi**: Sveobuhvatno restrukturiranje i unaprjeđenje
- **Godišnja Izdavanja**: Glavna izdanja verzija sa značajnim poboljšanjima

### Praćenje i Osiguranje Kvalitete
- **Automatsko testiranje**: Redovita provjera primjera koda i poveznica
- **Integracija povratnih informacija zajednice**: Redovito uključivanje korisničkih prijedloga
- **Ažuriranja tehnologije**: Usuglašenost s najnovijim Azure uslugama i azd izdanjima
- **Revizije pristupačnosti**: Redoviti pregledi načela inkluzivnog dizajna

## Pravila podrške verzija

### Trenutna podrška verzija
- **Najnovija glavna verzija**: Puna podrška s redovitim ažuriranjima
- **Prethodna glavna verzija**: Sigurnosna ažuriranja i kritične ispravke u trajanju od 12 mjeseci
- **Zastarjele verzije**: Samo podrška zajednice, bez službenih ažuriranja

### Upute za migraciju
Kada se objave glavne verzije, pružamo:
- **Vodiče za migraciju**: Upute korak po korak za prijelaz
- **Bilješke o kompatibilnosti**: Detalji o promjenama koje mogu uzrokovati probleme
- **Podršku alatima**: Skripte ili alati za pomoć pri migraciji
- **Podršku zajednice**: Namjenska foruma za pitanja o migraciji

---

**Navigacija**
- **Prethodni lekcija**: [Vodič za učenje](resources/study-guide.md)
- **Sljedeća lekcija**: Povratak na [Glavni README](README.md)

**Ostanite u toku**: Pratite ovaj repozitorij za obavijesti o novim izdanjima i važnim ažuriranjima materijala za učenje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->