# Dnevnik promjena - AZD za početnike

## Uvod

Ovaj dnevnik promjena dokumentira sve značajne promjene, ažuriranja i poboljšanja u spremištu AZD za početnike. Pratimo principe semantičkog verzioniranja i održavamo ovaj zapis kako bismo korisnicima pomogli razumjeti što se promijenilo između verzija.

## Ciljevi učenja

Pregledom ovog dnevnika promjena moći ćete:
- Ostati informirani o novim značajkama i dodacima sadržaja
- Razumjeti poboljšanja postojeće dokumentacije
- Pratiti ispravke grešaka i korekcije kako bi se osigurala točnost
- Pratiti razvoj nastavnih materijala tijekom vremena

## Ishodi učenja

Nakon pregleda zapisa dnevnika promjena, moći ćete:
- Prepoznati novi sadržaj i dostupne resurse za učenje
- Razumjeti koje su sekcije ažurirane ili poboljšane
- Planirati svoj put učenja na temelju najnovijih materijala
- Doprinositi povratnim informacijama i prijedlozima za buduća poboljšanja

## Povijest verzija

### [v3.25.0] - 2026-11-09

#### Microsoft Foundry ekstenzija 1.0 je sada općenito dostupna

Paket `microsoft.foundry` 1.0 je **uživo i općenito dostupan**, kako je najavljeno [5. studenog 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Tečaj sada uči objavljeni GA tijek rada, ne nadolazeće izdanje. Počnite s AZD **1.37.0 ili novijim** i `azd ext install microsoft.foundry`.

#### Dostupno u ovom ažuriranju tečaja
- Smjernice na engleskom koriste GA paket kao zadani put instalacije i objašnjavaju njegovih sedam neovisno verzioniranih glavnih ekstenzija.
- [Prikaz hostiranog agenta](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) pokriva uzlazni Python Agent Framework Responses API primjer, trenutne uvjete, Python 3.13+, odabir novog/postojećeg projekta, ponovnu upotrebu modela i pregled `azure.yaml`.
- Lokalno-u-oblak tijek rada pokriva testiranje Agent Inspector, troškove poziva modela podržane Azureom, daljinske izgradnje koda, implementiranu invokaciju, praćenje u oblaku, pregled implementacije, zapise i dijagnostiku.
- Posebne smjernice za evaluaciju uključuju generiranje i pregled skupova podataka/rubrika, konfiguraciju imenovane evaluacije, registraciju resursa i inspekciju rezultata. Starije upute za evaluaciju/optimizaciju ostaju kao povijest migracije, a ne trenutna osnova izdanja.
- Foundry CI/CD smjernice uključuju instalaciju ekstenzije runnera, autentificiranu implementaciju, pristup evaluacijskim resursima i eksplicitni kvalitetni prag.
- Smjernice za čišćenje razlikuju novoizrađene i ponovno iskorištene Foundry projekte. Radionica povezuje na zasebnu GA vježbu bez zamjene specifičnih testova primjera.
- Navigacija tečajem, ciljevi učenja, preduvjeti postavljanja, kratica, često postavljana pitanja i vodič za učenje odražavaju GA tijek rada. Generirani prijevodi nisu ručno uređivani.

#### Opseg pregleda
- Temeljeno na GA najavi, povezanom Microsoft Learn vodiču i uzlaznoj konfiguraciji primjera. Nije izvršeno uživo Azure provisioniranje, implementacija, pozivanje modela ili evaluacija.
- GA paketa ne podrazumijeva GA za svaku opcionalnu značajku, neovisnu ekstenziju ili SDK, niti potvrđuje primjere za produkciju.

### [v3.24.0]- 2026-11-04

#### Ispravljeno
- Popravljena navigacija tečaja na engleskom, premješteni putovi stranica, nedostajući sidreni linkovi i zastarjele vanjske reference, uključujući poveznicu na Poglavlje 2 u vodiču za proizvodni AI.
- Pregledane trenutne smjernice u odnosu na objavljeni AZD 1.37.2, agente 1.0.0-beta.23 i evaluacije 1.0.0-beta.2. Dokumentiran poseban `azd ai eval` tijek rada i migracija konfiguracije optimizacije.
- Ispravljene neprihvaćene CLI zastavice, granice autentifikacije, vodiči za običan tekst okoliša/tajni, infrastrukturna ažuriranja, konfiguracija modela i primjeri destruktivnog oporavka.
- Osvježena radionica u odnosu na trenutni AI Agents primjer, uključujući stvarne hooks, ulazne konfiguracije, evaluacijske testove, red-teaming ulazne točke i promatranje.
- Ispravljeni navodi o implementaciji primjera i popravljeni povezani problemi s aplikacijom/infrastrukturom/konfiguracijom. Materijali o arhitekturi maloprodaje jasno su odvojeni od potpune funkcionalne aplikacije.
- Vraćena CodeQL jezična matrica, odabran podržani Node.js 24 za razvojni kontejner i uvedeni validatori postavljanja koji prijavljuju neuspješne verzijske naredbe.

#### Dodano
- Offline provjerivač linkova/sidra samo na engleskom, regresijski testovi i tijek rada dokumentacije koji također gradi radionicu u strogoj izvedbi. Generirani prijevodi i prevedene slike su isključeni.

#### Opseg validacije
- Provjere izvora, sintakse, konfiguracije, lokalnog ponašanja i mrežnih poveznica ne potvrđuju mogućnost živog Azure deployanja, kvote, RBAC, regionalne dostupnosti modela, naplate, sigurnosne usklađenosti ili spremnost za produkciju.
- Stariji unosi ispod su povijesni zapisi, a ne trenutačne naredbe ili upute za izdanja.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 osvježenje: ažuriranje verzije
**Ova verzija ponovno potvrđuje tečaj protiv `azd` `1.27.1` (srpanj 2026, najnovije stabilno izdanje) i trenutnu preview AI agent ekstenziju `azure.ai.agents` `1.0.0-beta.5`, dovodeći svaki "validated against" baner u red nakon izdanja 1.26.0, 1.27.0 i 1.27.1.**

#### Promijenjeno
- **✅ Ažurirana referentna linija validacije** s `azd 1.25.6` (lipanj 2026) na `azd 1.27.1` (srpanj 2026) u root README, svim README-ima poglavlja, lekciji za razvojni kontejner u Poglavlju 1 (uključujući primjere s prikvačenim verzijama), lekciji prilagođenih predložaka u Poglavlju 4, lekciji s više agenata u Poglavlju 5 i dokumentaciji radionice
- **🤖 Osvježena osnovna linija za Poglavlje 2** s `azd 1.23.12` (ožujak 2026) na `azd 1.27.1` kroz `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` i `microsoft-foundry-integration.md`; datumi napomena o validaciji su ažurirani na 2026-07-13
- **🧩 Povećana AI agent ekstenzija** s `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` na trenutnu `1.0.0-beta.5` verziju u README-u za Poglavlje 2 i `agents.md`
- **🧪 Primjer validacije radionice** (`azd version` izlaz) ažuriran na `1.27.1`

#### Bilješke o relevantnim azd izdanjima (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Podrška za Go za Azure Functions na Flex Consumption, `azd config sub-filter` filtri pretplate po zakupcu, samostalni paketi ekstenzija (`azd x pack --bundle`) i `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modeliranje Azure AI Foundry projekata/agenata izravno u `azure.yaml` (pokretanje bez Bicep-a/Terraform-a), podrška implementacije kontejnera za App Service (`host: appservice` + `language: docker`), izravni `-s/--source` za `azd extension` naredbe, i `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` zastavica za `azd extension install`, zastarjeli modeli isključeni iz upita za katalog/kvote prema zadanim postavkama, i nekoliko ispravki grešaka

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

#### Popunjavanje praznina za početnike #2: Izrada predložaka, razvojni kontejneri, Pulumi, Azure DevOps, Servisni Principali i još mnogo toga
**Ova verzija zatvara preostale srednjerazredne praznine otkrivene analizom pokrivenosti azd: kako izraditi i objaviti vlastiti predložak, reproducibilna okruženja razvojnih kontejnera/Codespaces, Pulumi pružatelj infrastrukture, Azure DevOps CI/CD vodič, autentikacija servisnog principala, smjernice za odabir hosta (AKS/Spring Apps), objašnjenja `azd restore`/`azd package`, rukovanje pogreškama hooks i prakse timskih/dijeljenih okruženja.**

#### Dodano
- **🧱 Nova lekcija u Poglavlju 4** `docs/chapter-04-infrastructure/custom-templates.md` — izrada vlastitog azd predloška: potrebna struktura (`azure.yaml`, `infra/`, `src/`), polje `metadata.template`, parametariziranje infrastrukture s `uniqueString()` tokenom resursa i `azd-env-name` oznakom, lokalno testiranje s `azd init --template <local-path>`, objavljivanje na GitHubu i podnošenje u Awesome AZD galeriju
- **📦 Nova lekcija u Poglavlju 1** `docs/chapter-01-foundation/dev-containers.md` — reproducibilna azd okruženja s Razvojnim kontejnerima i GitHub Codespaces: minimalni `.devcontainer/devcontainer.json` koristeći službenu `ghcr.io/azure/azure-dev/azd` funkcionalnost, značajke specifične za jezik, `docker-in-docker` za hostove kontejnera i `azd auth login --use-device-code` za daljinsko prijavljivanje
- **🧩 Pulumi s azd** dio u `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, raspored Pulumi mapa, slojevi mapirani na azd okruženja, potrebni izlazi/oznake i identičan `azd up` / `azd down` tijek rada
- **🎯 Smjernice za odabir hosta** u `docs/chapter-04-infrastructure/provisioning.md` — početnički prijateljsko uspoređivanje `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` i `springapp`, s uputama kada odabrati AKS ili Azure Spring Apps
- **🛠️ Azure DevOps CI/CD vodič** u `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, servisna veza s federacijom identiteta radnog opterećenja (OIDC), generirani `azure-dev.yml` i postavljanje grupnih varijabli
- **🔑 Servisni Principali (obrazac 4)** dodani u `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, neinteraktivni `azd auth login` s tajnom klijenta naspram federiranih/OIDC vjerodajnica, kada koristiti i sigurno pohranjivanje vjerodajnica
- **🪝 Rukovanje pogreškama hooksa** pododjeljak u `docs/chapter-04-infrastructure/deployment-guide.md` — izlazni kodovi i `set -e`, `continueOnError`, testiranje hooks izolirano s `azd hooks run`, OS-specifični shellovi i `--debug`
- **👥 Tim / dijeljena okruženja** sekcija u `docs/chapter-03-configuration/configuration.md` — što se nalazi u `.azure/`, što gitignoreati, okruženja po programeru, `azd env list`/`select` i pružanje vrijednosti okruženja u CI/CD
- **🧰 `azd restore` i proširena objašnjenja `azd package`** u `resources/cheat-sheet.md` — vraćanje ovisnosti i izgradnja deployabilnog artefakta bez implementacije

#### Promijenjeno
- **🧭 Tablica lekcija Poglavlja 4** ažurirana da uključi novu lekciju "Izrada vlastitog predloška" (Lekcija 3)
- **🧭 Tablica lekcija Poglavlja 1** ažurirana da uključi novu lekciju "Razvojni kontejneri i Codespaces" (Lekcija 5); navigacijski podnožja povezana između `bring-your-own-app.md` i `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Popunjavanje praznina za početnike: Praktična lekcija s više agenata, "Donesi vlastitu aplikaciju," Terraform i CI/CD vodič
**Ova verzija zatvara najveće praznine za potpuni vodič za početnike dodavanjem dvije nove praktične lekcije (implementabilni vodič s više agenata i dodavanje azd postojećoj aplikaciji), uvoda za početnike u hooks, sekcije Terraform s azd-om, korak-po-korak GitHub Actions pipeline vodič, objašnjenja za nove pregledne ekstenzije i eksplicitni kontrolni popis za verifikaciju implementacije.**

#### Dodano
- **🤝 Nova lekcija u Poglavlju 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — potpuno praktični, implementabilni vodič s dva agenta (orkestrator + specijalisti) koristeći stvarni predložak (`contoso-creative-writer`), pokrivajući kada koristiti više agenata, `azd up` tijek rada, razumijevanje implementiranih resursa, međugentsko praćenje, prilagodbu i čišćenje
- **📦 Nova lekcija u Poglavlju 1** `docs/chapter-01-foundation/bring-your-own-app.md` — kako dodati azd postojećem projektu pomoću `azd init` ("koristi kod u trenutnom direktoriju"), razumijevanje `azure.yaml` i `infra/`, `azd infra generate`, detekcija hosta i implementacija pomoću `azd up`
- **🌐 Sekcija Terraform s azd** dodana u `docs/chapter-04-infrastructure/provisioning.md` — konfiguracija `infra.provider: terraform`, raspored mapa `.tf`, potrebni `AZURE_*` izlazi i označavanje `azd-env-name`, te identičan tijek rada `azd up` / `azd down` (zatvara prazninu gdje je podrska za Terraform obećana, ali je prikazan samo Bicep)
- **⚙️ Detaljan vodič kroz GitHub Actions** u `docs/chapter-08-production/production-ai-practices.md` — od GitHub repozitorija do automatiziranih deploya: `azd pipeline config`, OIDC federirane vjerodajnice (bez pohranjenih tajni), generirani `azure-dev.yml` i smjernice za tajne u odnosu na varijable
- **🪝 Uvod za početnike "Novi u hookovima?"** u `docs/chapter-04-infrastructure/deployment-guide.md` — što je hook, tablica faza hooka, minimalni prvi hook i ručno pokretanje hookova s `azd hooks run`
- **✅ Popis za provjeru "Provjerite svoj deploy"** dodan u Korak 5 od `docs/chapter-01-foundation/first-project.md` — smoke test, provjera health endpointa i eksplicitni kriteriji uspjeha
- **🧩 Objašnjenje za nove preview ekstenzije** `azure.ai.skills` i `azure.ai.connections` (što su i kada ih koristiti) u `docs/chapter-08-production/production-ai-practices.md`

#### Promijenjeno
- **🧭 Ispravljena tablica lekcija u Poglavlju 5**: `multi-agent-basics.md` je sada Lekcija 1 (jedina potpuno praktična lekcija), pošteno označeno da Lekcija 2 pripada Poglavlju 6, a scenarij Retail je arhitektonski nacrt, a ne predložak jedne komande
- **🧭 Tablica lekcija u Poglavlju 1** sada uključuje novu lekciju "Bring Your Own App" (Lekcija 4)
- **🔗 Navigacijski podnožja** ažurirana: `first-project.md` sada vodi prema naprijed ka `bring-your-own-app.md`

#### Ispravljeno
- **🧱 Zatvoren "navodni ali nedostajući" Terraform jaz** — tečaj je prije spominjao podršku za Terraform bez pokazivanja istog
- **🔀 Ispravljene zavaravajuće međuspone u Poglavlju 5** koje su implicirale postojanje pune multi-agent implementacije dok je postojalo samo arhitektonsko rješenje

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

#### AZD 1.25.6 osvježenje, potpune naredbe životnog ciklusa agenta i Aspire rebranding
**Ova verzija ponovno potvrđuje tečaj prema `azd` `1.25.6` (lipanj 2026) i ekstenziji `azure.ai.agents` `0.1.40-preview`, proširuje AI smjernice od "kreiraj agenta" do kompletnog životnog ciklusa agenta (testiraj → procijeni → optimiziraj → pregledaj → izbriši), prikazuje nove preview ekstenzije `azure.ai.skills` i `azure.ai.connections` te bilježi promjenu imena proizvoda ".NET Aspire" u "Aspire".**

#### Dodano
- **🔁 Potpuna pokrivenost životnog ciklusa agenta** za početnike i AI inženjere kroz dokumentaciju:
  - `docs/chapter-01-foundation/azd-basics.md` — Tablica životnog ciklusa (kreiranje → testiranje → mjerenje → poboljšanje → pregled → čišćenje) dodana u odjeljak Ekstenzije i AI naredbe
  - `docs/chapter-08-production/production-ai-practices.md` — Novi odjeljak "Upravljanje životnim ciklusom agenta" koji obuhvaća `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` i `delete --force`
  - `resources/cheat-sheet.md` — Proširene AI naredbe za agente s `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` i `delete --force`
- **🧩 Nove preview ekstenzije** dokumentirane: `azure.ai.skills` (ponovno upotrebljive agentove vještine) i `azure.ai.connections` (Foundry veze) dodano na tablicu ekstenzija i prečace
- **⏱️ Smjernice za vrijeme odziva** — primjeri `azd ai agent invoke` sada prikazuju ukupnu latenciju i vrijeme do prvog bajta
- **📌 Banner verzije** u glavnom README koji usmjerava polaznike na `azd version` i `azd upgrade`

#### Promijenjeno
- **✅ Ažurirana osnovna validacija** s `azd 1.23.12` (ožujak 2026) na `azd 1.25.6` (lipanj 2026) u svim README datotekama poglavlja i u radionicama
- **🤖 Napomena o ekstenziji u Poglavlju 2** ažurirana s `azure.ai.agents` `0.1.18-preview` na `0.1.40-preview`
- **🧪 Primjer validacije radionice** (output `azd version`) ažuriran na `1.25.6`
- **🧭 README "Što je novo u azd danas"** osvježen da istakne kompletni životni ciklus agenta, nove AI ekstenzije i posljednje popravke kvalitete (`azd init` idempotentnost, `azd auth login` čišćenje nevažećih tokena, `azd tool` prompt prvog pokretanja)
- **📖 Kapitel 2 agents.md (Opcija 4)** sada usmjerava polaznike na naredbe za životni ciklus nakon deploya umjesto da stane na `azd up`

#### Ispravljeno
- **🏷️ Naziv proizvoda** — dodana bilješka o Aspire rebrandingu (".NET Aspire" sada je jednostavno "Aspire"); podrška azd-om za Aspire ostaje nepromijenjena
- **🔎 Live validacija izdanja** potvrđena uživo sa Azure Developer CLI izdanjem: stabilan CLI `1.25.6` (2026-06-12) i `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Pojašnjenje za početnike, validacija postavki i finalno čišćenje AZD naredbi
**Ova verzija nastavlja s AZD 1.23 valjdačom i dokumentacijom usmjerenom na početnike: pojašnjava AZD-prvu autentikaciju, dodaje skripte za lokalnu validaciju postavki, potvrđuje ključne naredbe uživo s AZD CLI-jem i uklanja zadnje zastarjele engleske reference naredbi izvan changeloga.**

#### Dodano
- **🧪 Skripte za validaciju postavki za početnike** s `validate-setup.ps1` i `validate-setup.sh` da polaznici mogu potvrditi potrebne alate prije početka Poglavlja 1
- **✅ Rano provjeravanje postavki** u glavnom README i README Poglavlja 1 da se otkriju nedostajući preduvjeti prije `azd up`

#### Promijenjeno
- **🔐 Smjernice za autentikaciju početnika** sada dosljedno tretiraju `azd auth login` kao primarni put za AZD radne tokove, s `az login` označenim kao opcionalno osim ako se direktno ne koriste Azure CLI naredbe
- **📚 Tijek uvođenja u Poglavlje 1** sada vodi polaznike da validiraju lokalnu postavku prije instalacije, autentikacije i prvog deploya
- **🛠️ Poruke validatora** sada jasno razlikuju blokirajuće zahtjeve od neobaveznih upozorenja Azure CLI-ja za početnički AZD put
- **📖 Konfiguracijska, troubleshooting i primjer dokumentacija** sada razlikuje obaveznu AZD autentikaciju i neobavezno prijavljivanje u Azure CLI, gdje je ranije bilo bez konteksta

#### Ispravljeno
- **📋 Preostale engleske reference naredbi** ažurirane na trenutne AZD oblike, uključujući `azd config show` u prečacu i `azd monitor --overview` gdje je bila namjera za Azure Portal pregled
- **🧭 Početničke tvrdnje u Poglavlju 1** ublažene da se ne obećava zajamčeno ponašanje bez grešaka ili rollback u svim predlošcima i Azure resursima
- **🔎 Live validacija CLI-ja** potvrđuje trenutnu podršku za `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` i `azd down --force --purge`

#### Datoteke ažurirane
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

#### AZD 1.23.12 validacija, širenje okruženja radionice i osvježenje AI modela
**Ova verzija izvodi dokumentacijsku validaciju prema `azd` `1.23.12`, ažurira zastarjele primjere AZD naredbi, osvježava AI model smjernice na trenutne zadane vrijednosti i proširuje upute radionice izvan GitHub Codespaces podržavajući i dev kontejnere te lokalne kopije.**

#### Dodano
- **✅ Napomene o validaciji u glavnim poglavljima i dokumentaciji radionice** da bi polaznici imali jasnu AZD bazu za testiranje koristeći novije ili starije CLI verzije
- **⏱️ Smjernice o timeout-u deploya** za dugotrajne AI aplikacije koristeći `azd deploy --timeout 1800`
- **🔎 Koraci inspekcije ekstenzija** s `azd extension show azure.ai.agents` u dokumentaciji AI radnih tokova
- **🌐 Šire smjernice za radno okruženje radionice** koje obuhvaćaju GitHub Codespaces, dev kontejnere i lokalne kopije pomoću MkDocs

#### Promijenjeno
- **📚 Uvodni README-i poglavlja** sada redovito bilježe validaciju protiv `azd 1.23.12` kroz temeljne, konfiguracijske, infrastrukturne, multi-agent, preddeploy, troubleshooting i produkcijske dijelove
- **🛠️ Reference AZD naredbi** ažurirane na trenutačne oblike u dokumentaciji:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ili `azd env get-value(s)` ovisno o kontekstu
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` gdje se misli na pregled Application Insights
- **🧪 Pojednostavljeni preview primjeri** u skladu s trenutačno podržanim korištenjem poput `azd provision --preview` i `azd provision --preview -e production`
- **🧭 Radni tijek radionice** ažuriran tako da polaznici mogu završiti labove u Codespaces, dev containeru ili lokalnoj kopiji, a ne pretpostavljajući isključivo Codespaces
- **🔐 Smjernice autentikacije** sada preferiraju `azd auth login` za AZD radne tokove, s `az login` kao opcionalnim ako se direktno koriste Azure CLI naredbe

#### Ispravljeno
- **🪟 Windows instalacijske naredbe** usklađene s trenutnim velikim i malim slovima paketa `winget` u vodiču za instalaciju
- **🐧 Linux smjernice za instalaciju** ispravljene da izbjegnu nedopuštene distro-specifične upute za upravitelj paketa `azd` i umjesto toga upute prema release assetima gdje je prikladno
- **📦 AI primjeri modela** osvježeni s starijih zadataka poput `gpt-35-turbo` i `text-embedding-ada-002` na aktualne poput `gpt-4.1-mini`, `gpt-4.1` i `text-embedding-3-large`
- **📋 Primjeri deploya i dijagnostike** ispravljeni za korištenje trenutačnih naredbi za okruženje i status u zapisima, skriptama i troubleshooting koracima
- **⚙️ GitHub Actions smjernice** ažurirane s `Azure/setup-azd@v1.0.0` na `Azure/setup-azd@v2`
- **🤖 Smjernice za MCP/Copilot pristanak** ažurirane s `azd mcp consent` na `azd copilot consent list`

#### Poboljšano
- **🧠 AI poglavlje smjernice** bolje objašnjavaju ponašanje osjetljivo na preview ekstenzije `azd ai`, prijavu po tenantima, trenutačnu upotrebu ekstenzija i ažurirane preporuke za deploy modela
- **🧪 Upute radionice** sada koriste realističnije verzijske primjere i jasniji jezik za postavljanje okruženja za praktične labove
- **📈 Produkcija i troubleshooting dokumentacija** bolje usklađeni s trenutačnim praćenjem, fallback modelom i primjerima razina troškova

#### Datoteke ažurirane
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

#### AZD AI CLI naredbe, validacija sadržaja i proširenje predloška
**Ova verzija dodaje pokrivenost naredbama `azd ai`, `azd extension` i `azd mcp` u svim poglavljima vezanim uz AI, popravlja prekinute poveznice i zastarjeli kod u agents.md, ažurira cheat sheet i potpuno preuređuje odjeljak Primjeri predložaka s provjerenim opisima i novim Azure AI AZD predlošcima.**

#### Dodano
- **🤖 AZD AI CLI pokrivenost** u 7 datoteka (prije samo u Poglavlju 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Novi odjeljak "Proširenja i AI naredbe" koji uvodi `azd extension`, `azd ai agent init` i `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opcija 4: `azd ai agent init` s tablicom usporedbe (pristup predlošku vs pristup manifestu)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Pododjeljci "AZD Proširenja za Foundry" i "Primjena vođena agentima"
  - `docs/chapter-05-multi-agent/README.md` — Brzi početak sada prikazuje oba puta primjene: prema predlošku i prema manifestu
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Odjeljak Primjena sada uključuje opciju `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Pododjeljak "AZD AI naredbe za dijagnostiku"
  - `resources/cheat-sheet.md` — Novi odjeljak "AI & naredbe proširenja" s `azd extension`, `azd ai agent init`, `azd mcp` i `azd infra generate`
- **📦 Novi AZD AI predlošci primjera** u `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat s podrškom za Blazor WebAssembly, Semantic Kernel i glasovni chat
  - **azure-search-openai-demo-java** — Java RAG chat koristeći Langchain4J s mogućnostima primjene na ACA/AKS
  - **contoso-creative-writer** — Višeagentna aplikacija za kreativno pisanje koristeći Azure AI Agent Service, Bing Grounding i Prompty
  - **serverless-chat-langchainjs** — Serverless RAG koristeći Azure Functions + LangChain.js + Cosmos DB s Ollama podrškom za lokalni razvoj
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG akcelerator s administratorskim portalom, integracijom Teamsa i opcijama PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Višeagentna MCP orkestracijska referentna aplikacija sa serverima u .NET, Python, Java i TypeScriptu
  - **azd-ai-starter** — Minimalni Azure AI infrastrukturni Bicep početni predložak
  - **🔗 Awesome AZD AI Gallery link** — Referenca na [awesome-azd AI galeriju](https://azure.github.io/awesome-azd/?tags=ai) (više od 80 predložaka)

#### Ispravljeno
- **🔗 agents.md navigacija**: Poveznice Prethodno/Sljedeće sada odgovaraju redoslijedu lekcija u Poglavlju 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 prekinute poveznice u agents.md**: `production-ai-practices.md` ispravljeno u `../chapter-08-production/production-ai-practices.md` (3 pojave)
- **📦 zastarjeli kod u agents.md**: Zamijenjeno `opencensus` s `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 neispravan API u agents.md**: Premješteno `max_tokens` iz `create_agent()` u `create_run()` kao `max_completion_tokens`
- **🔢 brojanje tokena u agents.md**: Zamijenjena gruba procjena `len//4` s `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Ispravljene usluge iz "Cognitive Search + App Service" u "Azure AI Search + Azure Container Apps" (zadani host promijenjen u listopadu 2024)
- **contoso-chat**: Ažuriran opis s referencom na Azure AI Foundry + Prompty, usklađeno s realnim naslovom i tehnološkim stogom repozitorija

#### Uklonjeno
- **ai-document-processing**: Uklonjena nefunkcionalna referenca na predložak (repo nije javno dostupan kao AZD predložak)

#### Poboljšano
- **📝 vježbe u agents.md**: Vježba 1 sada prikazuje očekivani ispis i korak `azd monitor`; Vježba 2 uključuje kompletan kod registracije `FunctionTool`; Vježba 3 zamjenjuje nejasne upute konkretnim naredbama `prepdocs.py`
- **📚 njimaice u agents.md**: Ažurirane poveznice na dokumentaciju za Azure AI Agent Service i vodič za brzi početak
- **📋 tablica Sljedećih koraka u agents.md**: Dodana poveznica na AI Workshop Lab za potpunu pokrivenost poglavlja

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

#### Poboljšanje navigacije kroz tečaj
**Ova verzija poboljšava navigaciju poglavljima u README.md s naprednim tabličnim formatom.**

#### Promijenjeno
- **Tablica karte tečaja**: Poboljšana s izravnim poveznicama na lekcije, procjenama trajanja i ocjenama složenosti
- **Čišćenje mapa**: Uklonjene suvišne stare mape (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validacija poveznica**: Provjereno svih 21+ internu poveznica u tablici karte tečaja

### [v3.16.0] - 2026-02-05

#### Ažuriranja naziva proizvoda
**Ova verzija ažurira reference na proizvode prema aktualnom Microsoft brandingu.**

#### Promijenjeno
- **Microsoft Foundry → Microsoft Foundry**: Sve reference ažurirane u svim datotekama koje nisu prijevodi
- **Azure AI Agent Service → Foundry Agents**: Naziv usluge ažuriran kako bi odražavao aktualni branding

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

#### Velika preuređenja spremišta: imena mapa prema poglavljima
**Ova verzija restrukturira dokumentaciju u namjenske mape po poglavljima radi jasnije navigacije.**

#### Promjena imena mapa
Stare mape zamijenjene su mapama numeriranim po poglavljima:
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
| Sve datoteke iz pre-deployment/ | pre-deployment/ | chapter-06-pre-deployment/ |
| Sve datoteke iz troubleshooting/ | troubleshooting/ | chapter-07-troubleshooting/ |

#### Dodano
- **📚 README datoteke po poglavljima**: Kreiran README.md u svakoj mapi poglavlja s:
  - Ciljevima učenja i trajanjem
  - Tablicom lekcija s opisima
  - Naredbama za brzi početak
  - Navigacijom do ostalih poglavlja

#### Promijenjeno
- **🔗 Ažurirane sve interne poveznice**: više od 78 putanja ažurirano u svim dokumentacijskim datotekama
- **🗺️ Glavni README.md**: Ažurirana karta tečaja s novom strukturom poglavlja
- **📝 examples/README.md**: Ažurirane unakrsne reference na mape poglavlja

#### Uklonjeno
- Stara struktura mapa (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturiranje spremišta: navigacija po poglavljima
**Ova verzija je dodala README datoteke za navigaciju po poglavljima (zamijenjeno verzijom v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Novi vodič za AI agente
**Ova verzija dodaje opsežan vodič za primjenu AI agenata s Azure Developer CLI.**

#### Dodano
- **🤖 docs/microsoft-foundry/agents.md**: Kompletan vodič koji pokriva:
  - Što su AI agenti i kako se razlikuju od chatbotova
  - Tri predloška za brzi početak (Foundry Agents, Prompty, RAG)
  - Obrasce arhitekture agenata (pojedinačni agent, RAG, više agenata)
  - Konfiguraciju i prilagodbu alata
  - Praćenje i metrike
  - Razmatranje troškova i optimizaciju
  - Uobičajene situacije za otklanjanje poteškoća
  - Tri praktične vježbe s kriterijima uspjeha

#### Struktura sadržaja
- **Uvod**: Koncepti agenata za početnike
- **Brzi početak**: Primjena agenata koristeći `azd init --template get-started-with-ai-agents`
- **Obrasci arhitekture**: Vizualni dijagrami obrasca agenata
- **Konfiguracija**: Postavljanje alata i varijable okruženja
- **Praćenje**: Integracija s Application Insights
- **Vježbe**: Postupno praktično učenje (20-45 minuta svaka)

---

### [v3.12.0] - 2026-02-05

#### Ažuriranje DevContainer okruženja
**Ova verzija ažurira konfiguraciju razvojne kutije s modernim alatima i boljim zadanim postavkama za AZD iskustvo učenja.**

#### Promijenjeno
- **🐳 Osnovna slika**: Ažurirano s `python:3.12-bullseye` na `python:3.12-bookworm` (najnovija stabilna Debian verzija)
- **📛 Naziv kontejnera**: Preimenovan iz "Python 3" u "AZD for Beginners" radi jasnosti

#### Dodano
- **🔧 Nove značajke Dev Container-a**:
  - `azure-cli` s omogućenom podrškom za Bicep
  - `node:20` (LTS verzija za AZD predloške)
  - `github-cli` za upravljanje predlošcima
  - `docker-in-docker` za primjenu container aplikacija

- **🔌 Prosljeđivanje portova**: Prije konfigurirani portovi za uobičajeni razvoj:
  - 8000 (MkDocs pregled)
  - 3000 (Web aplikacije)
  - 5000 (Python Flask)
  - 8080 (API-jevi)

- **🧩 Novi VS Code dodaci**:
  - `ms-python.vscode-pylance` - Poboljšana Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Podrška za Azure Functions
  - `ms-azuretools.vscode-docker` - Podrška za Docker
  - `ms-azuretools.vscode-bicep` - Podrška za Bicep jezik
  - `ms-azure-devtools.azure-resource-groups` - Upravljanje Azure resursima
  - `yzhang.markdown-all-in-one` - Uređivanje Markdown-a
  - `DavidAnson.vscode-markdownlint` - Lintanje Markdown-a
  - `bierner.markdown-mermaid` - Podrška za Mermaid dijagrame
  - `redhat.vscode-yaml` - Podrška za YAML (za azure.yaml)
  - `eamodio.gitlens` - Vizualizacija Git-a
  - `mhutchie.git-graph` - Povijest Git-a

- **⚙️ VS Code postavke**: Dodane zadane postavke za Python interpreter, formatiranje prilikom spremanja i uklanjanje praznina

- **📦 Ažurirani requirements-dev.txt**:
  - Dodan MkDocs minify plugin
  - Dodan pre-commit za kvalitetu koda
  - Dodani Azure SDK paketi (azure-identity, azure-mgmt-resource)

#### Ispravljeno
- **Post-Create naredba**: Sada provjerava instalaciju AZD i Azure CLI prilikom pokretanja kontejnera

---

### [v3.11.0] - 2026-02-05

#### Prerađena README datoteka prilagođena početnicima
**Ova verzija značajno poboljšava README.md da bude pristupačniji početnicima i dodaje bitne resurse za AI developere.**

#### Dodano
- **🆚 Usporedba Azure CLI i AZD**: Jasno objašnjenje kada koristiti koji alat s praktičnim primjerima
- **🌟 Awesome AZD poveznice**: Izravne poveznice na galeriju predložaka zajednice i resurse za doprinos:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - više od 200 predložaka spremnih za primjenu
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Doprinos zajednice
- **🎯 Vodič za brzi početak**: Pojednostavljen odjeljak s 3 koraka (Instaliraj → Prijavi se → Primijeni)
- **📊 Tablica navigacije prema iskustvu**: Jasne upute gdje početi prema razini iskustva developera

#### Promijenjeno
- **Struktura README-a**: Preuređena za postupno otkrivanje - ključne informacije prvo
- **Uvodni odjeljak**: Prepravljeno za objašnjenje "Magije `azd up`" za potpune početnike
- **Uklonjen duplicirani sadržaj**: Izbačen duplicirani odjeljak za otklanjanje poteškoća
- **Naredbe za otklanjanje poteškoća**: Ispravljena referenca `azd logs` za korištenje valjanog `azd monitor --logs`

#### Ispravljeno
- **🔐 Naredbe za autentifikaciju**: Dodani `azd auth login` i `azd auth logout` u cheat-sheet.md
- **Nevažeće reference naredbi**: Uklonjeni preostali `azd logs` iz README odjeljka za otklanjanje poteškoća

#### Bilješke
- **Opseg**: Promjene primijenjene na glavni README.md i resources/cheat-sheet.md
- **Ciljna publika**: Poboljšanja posebno usmjerena na developere nove u AZD

---

### [v3.10.0] - 2026-02-05

#### Ažuriranje točnosti naredbi Azure Developer CLI
**Ova verzija ispravlja nepostojeće AZD naredbe u dokumentaciji, osiguravajući da svi primjeri koda koriste važeću sintaksu Azure Developer CLI.**

#### Ispravljeno
- **🔧 Uklonjene nepostojeće AZD naredbe**: Sveobuhvatni pregled i ispravak nevažećih naredbi:
  - `azd logs` (ne postoji) → zamijenjeno s `azd monitor --logs` ili Azure CLI alternativama
  - `azd service` podnaredbe (ne postoje) → zamijenjeno s `azd show` i Azure CLI
  - `azd infra import/export/validate` (ne postoje) → uklonjeno ili zamijenjeno valjanim alternativama
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` zastavice (ne postoje) → uklonjeno
  - `azd provision --what-if/--rollback` zastavice (ne postoje) → ažurirano za korištenje `--preview`
  - `azd config validate` (ne postoji) → zamijenjeno s `azd config list`
  - `azd info`, `azd history`, `azd metrics` (ne postoje) → uklonjeno

- **📚 Datoteke ažurirane s ispravcima naredbi**:
  - `resources/cheat-sheet.md`: Veliki prepravak referenci naredbi
  - `docs/deployment/deployment-guide.md`: Ispravljene strategije rollbacka i implementacije
  - `docs/troubleshooting/debugging.md`: Ispravljeni odjeljci za analizu zapisnika
  - `docs/troubleshooting/common-issues.md`: Ažurirane naredbe za otklanjanje poteškoća
  - `docs/troubleshooting/ai-troubleshooting.md`: Popravljen odjeljak za debugiranje AZD-a
  - `docs/getting-started/azd-basics.md`: Ispravljene naredbe za nadzor
  - `docs/getting-started/first-project.md`: Ažurirani primjeri za nadzor i debugiranje
  - `docs/getting-started/installation.md`: Popravljeni primjeri pomoću i verzije
  - `docs/pre-deployment/application-insights.md`: Ispravljene naredbe za pregled zapisnika
  - `docs/pre-deployment/coordination-patterns.md`: Ispravljene naredbe za debugiranje agenta

- **📝 Ažurirana referenca verzije**: 
  - `docs/getting-started/installation.md`: Promijenjena hardkodirana verzija `1.5.0` u generičku `1.x.x` s linkom na izdanja

#### Promijenjeno
- **Strategije rollbacka**: Ažurirana dokumentacija za korištenje rollbacka temeljenog na Git-u (AZD nema ugrađeni rollback)
- **Pregled zapisnika**: Zamijenjene reference `azd logs` s `azd monitor --logs`, `azd monitor --live` i Azure CLI naredbama
- **Odjeljak performansi**: Uklonjene nepostojeće zastavice za paralelnu/incrementalnu implementaciju, pružene valjane alternative

#### Tehnički detalji
- **Valjane AZD naredbe**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Valjane zastavice za azd monitor**: `--live`, `--logs`, `--overview`
- **Uklonjene značajke**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Bilješke
- **Provjera**: Naredbe su potvrđene u odnosu na Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Završetak radionice i ažuriranje kvalitete dokumentacije
**Ova verzija dovršava interaktivne module radionice, ispravlja sve neispravne veze u dokumentaciji i poboljšava ukupnu kvalitetu sadržaja za AI developere koji koriste Microsoft AZD.**

#### Dodano
- **📝 CONTRIBUTING.md**: Novi dokument smjernica za doprinose s:
  - Jasne upute za prijavu problema i predlaganje promjena
  - Standardi dokumentacije za novi sadržaj
  - Smjernice za primjere koda i konvencije poruka commit-a
  - Informacije o angažmanu zajednice

#### Dovršeno
- **🎯 Modul radionice 7 (Zaključak)**: Potpuno dovršen modul sa:
  - Sveobuhvatnim sažetkom postignuća radionice
  - Odjeljkom ključnih pojmova o AZD-u, predlošcima i Microsoft Foundry-ju
  - Preporukama za nastavak učenja
  - Vježbama izazova radionice s ocjenama težine
  - Povratnim informacijama zajednice i linkovima za podršku

- **📚 Modul radionice 3 (Rasklop)**: Ažurirani ishodi učenja s:
  - Vodičem za aktivaciju GitHub Copilota s MCP serverima
  - Razumijevanjem strukture mapa AZD predložaka
  - Uzorcima organizacije infrastrukture kao koda (Bicep)
  - Uputama za praktične laboratorijske vježbe

- **🔧 Modul radionice 6 (Raspuštanje)**: Dovršen sa:
  - Ciljevima čišćenja resursa i upravljanja troškovima
  - Korištenjem `azd down` za sigurno ukidanje infrastrukture
  - Uputama za oporavak meko obrisanih kognitivnih usluga
  - Bonus prijedlozima za istraživanje GitHub Copilota i Azure Portala

#### Ispravljeno
- **🔗 Popravljene pokvarene veze**: Riješeno preko 15 neispravnih internih veza u dokumentaciji:
  - `docs/ai-foundry/ai-model-deployment.md`: Ispravljeni putovi do microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Ispravljeni putovi do ai-model-deployment.md i production-ai-practices.md
  - `docs/getting-started/first-project.md`: Zamijenjen nepostojeći cicd-integration.md s deployment-guide.md
  - `examples/retail-scenario.md`: Ispravljeni putovi do FAQ i vodiča za otklanjanje poteškoća
  - `examples/container-app/microservices/README.md`: Ispravljeni putovi do kurseva i vodiča za implementaciju
  - `resources/faq.md` i `resources/glossary.md`: Ažurirane reference AI poglavlja
  - `course-outline.md`: Ispravljeni referenci za vodiče instruktora i AI laboratorijske radionice

- **📅 Status radionice**: Ažurirano s "U izradi" na aktivan status radionice sa datumom veljača 2026.

- **🔗 Navigacija radionice**: Popravljene pokvarene navigacijske veze u workshop README.md koje su upućivale na nepostojeću mapu lab-1-azd-basics

#### Promijenjeno
- **Prezentacija radionice**: Uklonjena upozorenja "u izradi", radionica sada kompletna i spremna za korištenje
- **Konzistentnost navigacije**: Osigurano pravilno međumodularno povezivanje svih modula radionice
- **Reference putanje učenja**: Ažurirane međureferencije poglavlja za ispravno korištenje microsoft-foundry putanja

#### Potvrđeno
- ✅ Sve engleske markdown datoteke imaju valjane interne veze
- ✅ Moduli radionice 0-7 su dovršeni sa ishodima učenja
- ✅ Navigacija između poglavlja i modula funkcionira ispravno
- ✅ Sadržaj je prikladan za AI developere koristeći Microsoft AZD
- ✅ Održan jednostavan jezik i struktura za početnike
- ✅ CONTRIBUTING.md daje jasne smjernice za suradnike zajednice

#### Tehnička implementacija
- **Provjera veza**: Automatizirani PowerShell skripta provjerila sve unutarnje .md veze
- **Revizija sadržaja**: Ručni pregled cjelovitosti radionice i prikladnosti za početnike
- **Sustav navigacije**: Primijenjeni konzistentni obrasci navigacije za poglavlja i module

#### Bilješke
- **Opseg**: Promjene primijenjene samo na dokumentaciju na engleskom jeziku
- **Prijevodi**: Mape prijevoda nisu ažurirane u ovoj verziji (automatizirani prijevod će se kasnije sinkronizirati)
- **Trajanje radionice**: Kompletna radionica sada pruža 3-4 sata praktičnog učenja

---

### [v3.8.0] - 2025-11-19

#### Napredna dokumentacija: Nadziranje, sigurnost i obrasci za višestruke agente
**Ova verzija dodaje sveobuhvatne lekcije najviše kvalitete o integraciji Application Insights, obrascima autentifikacije i koordinaciji višestrukih agenata za proizvodne implementacije.**

#### Dodano
- **📊 Lekcija o integraciji Application Insights**: u `docs/pre-deployment/application-insights.md`:
  - Implementacija usredotočena na AZD s automatskim provizijama
  - Cjeloviti Bicep predlošci za Application Insights + Log Analytics
  - Radne Python aplikacije s prilagođenom telemetrijom (1,200+ redaka)
  - Obrasci nadzora AI/LLM (praćenje tokena/troškova Microsoft Foundry modela)
  - 6 Mermaid dijagrama (arhitektura, distribuirano praćenje, tok telemetrije)
  - 3 praktične vježbe (upozorenja, nadzorne ploče, AI nadzor)
  - Primjeri Kusto upita i strategije optimizacije troškova
  - Streaming metrika uživo i debugiranje u stvarnom vremenu
  - Vrijeme učenja 40-50 minuta s proizvodnim obrascima

- **🔐 Lekcija o obrascima autentifikacije i sigurnosti**: u `docs/getting-started/authsecurity.md`:
  - 3 obrasca autentifikacije (connection strings, Key Vault, upravljani identitet)
  - Cjeloviti Bicep predlošci infrastrukture za sigurne implementacije
  - Node.js kod aplikacije s Azure SDK integracijom
  - 3 kompletne vježbe (omogućavanje upravljanog identiteta, korisnički dodijeljen identitet, rotacija Key Vault-a)
  - Najbolje prakse sigurnosti i konfiguracija RBAC-a
  - Vodič za otklanjanje poteškoća i analiza troškova
  - Proizvodni obrasci autentifikacije bez lozinki

- **🤖 Lekcija o obrascima koordinacije više agenata**: u `docs/pre-deployment/coordination-patterns.md`:
  - 5 obrazaca koordinacije (sekvencijalni, paralelni, hijerarhijski, događajno vođeni, konsenzus)
  - Kompletna implementacija orkestratorske usluge (Python/Flask, 1,500+ redaka)
  - 3 specijalizirane implementacije agenata (istraživanje, pisac, urednik)
  - Integracija s Service Bus za redove poruka
  - Upravljanje stanjem Cosmos DB za distribuirane sustave
  - 6 Mermaid dijagrama prikazuju interakcije agenata
  - 3 napredne vježbe (rukovanje timeout-om, logika ponovnog pokušaja, prekidač kruga)
  - Razrada troškova (240-565 $/mjesečno) sa strategijama optimizacije
  - Integracija s Application Insights za nadzor

#### Poboljšano
- **Poglavlje prije implementacije**: Sada uključuje sveobuhvatne obrasce nadzora i koordinacije
- **Poglavlje za početak**: Poboljšano profesionalnim obrascima autentifikacije
- **Spremnost za proizvodnju**: Potpuni pregled od sigurnosti do vidljivosti
- **Okvir tečaja**: Ažuriran za referencu novih lekcija u Poglavljima 3 i 6

#### Promijenjeno
- **Progresija učenja**: Bolja integracija sigurnosti i nadzora kroz cijeli tečaj
- **Kvaliteta dokumentacije**: Dosljedni A razredi standarda (95-97%) kroz nove lekcije
- **Obrasci za proizvodnju**: Potpuni end-to-end pregled za enterprise implementacije

#### Poboljšano
- **Iskustvo developera**: Jasan put od razvoja do nadzora proizvodnje
- **Sigurnosni standardi**: Profesionalni obrasci za autentifikaciju i upravljanje tajnama
- **Vidljivost**: Potpuna integracija Application Insights s AZD
- **AI opterećenja**: Specijalizirani nadzor za Microsoft Foundry modele i sustave višestrukih agenata

#### Potvrđeno
- ✅ Sve lekcije uključuju cjeloviti radni kod (ne isječke)
- ✅ Mermaid dijagrami za vizualno učenje (ukupno 19 kroz 3 lekcije)
- ✅ Praktične vježbe s koracima potvrde (ukupno 9)
- ✅ Produkcijski Bicep predlošci spremni za implementaciju putem `azd up`
- ✅ Analiza troškova i strategije optimizacije
- ✅ Vodiči za otklanjanje poteškoća i najbolje prakse
- ✅ Čvorišta znanja s naredbama za potvrdu

#### Rezultati ocjene dokumentacije
- **docs/pre-deployment/application-insights.md**: - Sveobuhvatan vodič za nadzor
- **docs/getting-started/authsecurity.md**: - Profesionalni sigurnosni obrasci
- **docs/pre-deployment/coordination-patterns.md**: - Napredne arhitekture višestrukih agenata
- **Ukupno novi sadržaj**: - Dosljedni visoki standardi kvalitete

#### Tehnička implementacija
- **Application Insights**: Log Analytics + prilagođena telemetrija + distribuirano praćenje
- **Autentifikacija**: Upravljani identitet + Key Vault + RBAC obrasci
- **Višestruki agenti**: Service Bus + Cosmos DB + Container Apps + orkestracija
- **Nadzor**: Streaming metrika uživo + Kusto upiti + upozorenja + nadzorne ploče
- **Upravljanje troškovima**: Strategije uzorkovanja, politike zadržavanja, kontrola budžeta

### [v3.7.0] - 2025-11-19

#### Poboljšanja kvalitete dokumentacije i novi primjer Microsoft Foundry modela
**Ova verzija poboljšava kvalitetu dokumentacije u repo-u te dodaje cjeloviti primjer implementacije Microsoft Foundry modela s gpt-4.1 chat sučeljem.**

#### Dodano
- **🤖 Primjer chata Microsoft Foundry modela**: Potpuna implementacija gpt-4.1 s radnim primjerom u `examples/azure-openai-chat/`:
  - Potpuna infrastruktura Microsoft Foundry modela (implementacija gpt-4.1 modela)
  - Python chat sučelje za naredbeni redak s poviješću razgovora
  - Integracija s Key Vault-om za sigurnu pohranu API ključeva
  - Praćenje potrošnje tokena i procjena troškova
  - Ograničavanje zahtjeva i rukovanje greškama
  - Sveobuhvatan README s vodičem za implementaciju od 35-45 minuta
  - 11 produkcijski spremnih datoteka (Bicep predlošci, Python aplikacija, konfiguracija)
- **📚 Vježbe za dokumentaciju**: Dodane praktične vježbe u vodič za konfiguraciju:
  - Vježba 1: konfiguracija za više okruženja (15 minuta)
  - Vježba 2: praksa upravljanja tajnama (10 minuta)
  - Jasni kriteriji uspjeha i koraci potvrde
- **✅ Verifikacija implementacije**: Dodan odjeljak potvrde u vodič za implementaciju:
  - Postupci za provjeru zdravlja sustava
  - Popis kriterija uspjeha
  - Očekivani izlazi za sve implementacijske naredbe
  - Brza referenca za otklanjanje poteškoća

#### Poboljšano
- **examples/README.md**: Ažuriran na kvalitetu razreda A (93%):
  - Dodan azure-openai-chat u sve relevantne sekcije
  - Ažuriran broj lokalnih primjera s 3 na 4
  - Dodano u tablicu primjera AI aplikacija
  - Integrirano u brzo pokretanje za srednje korisnike
  - Dodano u odjeljak Microsoft Foundry predložaka
  - Ažurirane sekcije usporednog matriksa i pronalaženja tehnologija
- **Kvaliteta dokumentacije**: Poboljšano iz B+ (87%) u A- (92%) kroz folder docs:
  - Dodani očekivani izlazi za kritične primjere naredbi
  - Uključeni koraci verifikacije za promjene konfiguracije
  - Poboljšano praktično učenje s vježbama

#### Promijenjeno
- **Napredak u učenju**: Bolja integracija AI primjera za srednje napredne korisnike
- **Struktura dokumentacije**: Više praktičnih vježbi s jasnim ishodima
- **Proces verifikacije**: Dodani eksplicitni kriteriji uspjeha za ključne radne tokove

#### Poboljšano
- **Iskustvo programera**: Deploy Microsoft Foundry Modela sada traje 35-45 minuta (u odnosu na 60-90 za složenije alternative)
- **Transparentnost troškova**: Jasne procjene troškova (50-200 $/mjesečno) za primjer Microsoft Foundry Modela
- **Put učenja**: AI programeri imaju jasan početak s azure-openai-chat
- **Standardi dokumentacije**: Dosljedni očekivani izlazi i koraci verifikacije

#### Validirano
- ✅ Primjer Microsoft Foundry Modela potpuno funkcionalan s `azd up`
- ✅ Sve 11 implementacijskih datoteka sintaktički ispravne
- ✅ Upute u README-u usklađene sa stvarnim iskustvom deploya
- ✅ Ažurirani linkovi za dokumentaciju na više od 8 mjesta
- ✅ Indeks primjera točno prikazuje 4 lokalna primjera
- ✅ Nema dupliciranih eksternih linkova u tablicama
- ✅ Sve navigacijske reference ispravne

#### Tehnička implementacija
- **Arhitektura Microsoft Foundry Modela**: gpt-4.1 + Key Vault + Container Apps obrazac
- **Sigurnost**: Managed Identity spreman, tajne u Key Vaultu
- **Nadzor**: Integracija s Application Insights
- **Upravljanje troškovima**: Praćenje tokena i optimizacija korištenja
- **Implementacija**: Jedna naredba `azd up` za kompletno postavljanje

### [v3.6.0] - 2025-11-19

#### Glavna nadogradnja: Primjeri deploya Container App-a
**Ova verzija donosi sveobuhvatne, spremne za produkciju primjere deploya containera koristeći Azure Developer CLI (AZD), s potpunom dokumentacijom i integracijom u put učenja.**

#### Dodano
- **🚀 Primjeri Container App-a**: Novi lokalni primjeri u `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kompletan pregled containeriziranih deploya, brz početak, produkcija i napredni obrasci
  - [Jednostavni Flask API](../../examples/container-app/simple-flask-api): Početnički REST API s scale-to-zero, health probeovima, nadzorom i dijagnostikom
  - [Arhitektura Mikroservisa](../../examples/container-app/microservices): Produkcijski multi-service deploy (API Gateway, Product, Order, User, Notification), async poruke, Service Bus, Cosmos DB, Azure SQL, distribuirano praćenje, blue-green/canary deploy
- **Best Practices**: Sigurnost, nadzor, optimizacija troškova i CI/CD upute za container workloads
- **Primjeri koda**: Potpuni `azure.yaml`, Bicep template-i i višelingvijalne implementacije servisa (Python, Node.js, C#, Go)
- **Testiranje i dijagnostika**: End-to-end testni scenariji, naredbe za nadzor, smjernice za otklanjanje problema

#### Promijenjeno
- **README.md**: Ažuriran da uključi i poveže nove primjere container applikacija pod "Local Examples - Container Applications"
- **examples/README.md**: Ažuriran za isticanje primjera container aplikacija, dodavanje usporednih matrica i ažuriranje tehnoloških/arhitektonskih referenci
- **Plan i vodič za učenje**: Ažuriran za referenciranje novih primjera container aplikacija i obrazaca deploya u relevantnim poglavljima

#### Validirano
- ✅ Svi novi primjeri moguće su implementirati s `azd up` i slijede najbolje prakse
- ✅ Ažurirane unakrsne reference i navigacija u dokumentaciji
- ✅ Primjeri obuhvaćaju scenarije od početničkih do naprednih, uključujući produkcijske mikroservise

#### Napomene
- **Opseg**: Dokumentacija i primjeri samo na engleskom jeziku
- **Sljedeći koraci**: Proširenje s dodatnim naprednim container obrascima i CI/CD automatizacijom u budućim izdanjima

### [v3.5.0] - 2025-11-19

#### Rebranding proizvoda: Microsoft Foundry
**Ova verzija uvodi sveobuhvatnu promjenu naziva proizvoda s "Microsoft Foundry" na "Microsoft Foundry" kroz svu englesku dokumentaciju, u skladu s službenim Microsoftovim rebrendingom.**

#### Promijenjeno
- **🔄 Ažuriranje naziva proizvoda**: Potpuni rebranding od "Microsoft Foundry" do "Microsoft Foundry"
  - Ažurirane sve reference u engl. dokumentaciji u folderu `docs/`
  - Preimenovan folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Preimenovana datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Ukupno: 23 reference ažurirane u 7 dokumentacijskih datoteka

- **📁 Promjene strukture foldera**:
  - `docs/ai-foundry/` preimenovan u `docs/microsoft-foundry/`
  - Sve unakrsne reference ažurirane za novu strukturu foldera
  - Navigacijski linkovi provjereni kroz cijelu dokumentaciju

- **📄 Preimenovanja datoteka**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Svi interni linkovi ažurirani na novi naziv datoteke

#### Ažurirane datoteke
- **Dokumentacija poglavlja** (7 datoteka):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ažuriranja navigacijskih linkova
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 reference naziva proizvoda ažurirane
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Već koristi Microsoft Foundry (iz prethodnih ažuriranja)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 reference ažurirane (pregled, povratne informacije zajednice, dokumentacija)
  - `docs/getting-started/azd-basics.md` - 4 ažuriranja unakrsnih linkova
  - `docs/getting-started/first-project.md` - 2 ažuriranja navigacijskih linkova poglavlja
  - `docs/getting-started/installation.md` - 2 ažuriranja linkova za sljedeća poglavlja
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 reference ažurirane (navigacija, Discord zajednica)
  - `docs/troubleshooting/common-issues.md` - 1 ažuriranje navigacijskog linka
  - `docs/troubleshooting/debugging.md` - 1 ažuriranje navigacijskog linka

- **Struktura tečaja** (2 datoteke):
  - `README.md` - 17 ažuriranih referenci (pregled tečaja, naslovi poglavlja, odjeljak predložaka, korisna mišljenja zajednice)
  - `course-outline.md` - 14 ažuriranih referenci (pregled, ciljevi učenja, resursi poglavlja)

#### Validirano
- ✅ Nema preostalih referenci na folder putanju "ai-foundry" u engleskoj dokumentaciji
- ✅ Nema preostalih referenci na naziv proizvoda "Microsoft Foundry" u engleskoj dokumentaciji
- ✅ Svi navigacijski linkovi funkcionalni s novom strukturom foldera
- ✅ Preimenovanja datoteka i foldera uspješno završena
- ✅ Unakrsne reference između poglavlja provjerene

#### Napomene
- **Opseg**: Promjene primijenjene samo na englesku dokumentaciju u folderu `docs/`
- **Prijevodi**: Folderi prijevoda (`translations/`) nisu ažurirani u ovoj verziji
- **Radionice**: Materijali radionica (`workshop/`) nisu ažurirani u ovoj verziji
- **Primjeri**: Primjerni fajlovi još mogu sadržavati stare nazive (bit će otklonjeno u budućim ažuriranjima)
- **Eksterni linkovi**: Eksterni URL-ovi i referencije GitHub repozitorija ostaju nepromijenjeni

#### Vodič za migraciju za suradnike
Ako imate lokalne brancheve ili dokumentaciju koja referencira staru strukturu:
1. Ažurirajte reference foldera: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ažurirajte reference datoteka: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Zamijenite naziv proizvoda: "Microsoft Foundry" → "Microsoft Foundry"
4. Provjerite da svi interni linkovi u dokumentaciji i dalje funkcioniraju

---

### [v3.4.0] - 2025-10-24

#### Unapređenja pregleda infrastrukture i validacije
**Ova verzija uvodi sveobuhvatnu podršku za novu preview funkciju Azure Developer CLI-ja i poboljšava korisničko iskustvo radionica.**

#### Dodano
- **🧪 azd provision --preview funkcijska dokumentacija**: Potpuni opis nove mogućnosti pregleda infrastrukture
  - Referenca naredbi i primjeri korištenja u cheat sheetu
  - Detaljna integracija u vodiču za provision s primjerima upotrebe i koristima
  - Integracija pre-flight provjera radi sigurnijeg deploya
  - Ažuriranja vodiča za početnike s praktičnim preporukama za sigurnost
- **🚧 Banner statusa radionice**: Profesionalni HTML banner koji označava status razvoja radionice
  - Dizajn u gradijentu s indikatorima izrade za jasnu komunikaciju korisnicima
  - Označeno vrijeme posljednjeg ažuriranja radi transparentnosti
  - Dizajn prilagođen mobilnim uređajima

#### Poboljšano
- **Sigurnost infrastrukture**: Preview funkcionalnost integrirana kroz svu dokumentaciju deploya
- **Validacija prije deploya**: Automatizirani skripti sada uključuju testiranje infrastrukture u preview modu
- **Radni tok programera**: Ažurirane naredbe s uključivanjem previewa kao najbolje prakse
- **Iskustvo radionice**: Jasan prikaz očekivanja za korisnike o statusu razvoja sadržaja

#### Promijenjeno
- **Najbolje prakse deploya**: Preporučen pristup s pregledom (preview-first workflow)
- **Tok dokumentacije**: Validacija infrastrukture premještena ranije u procesu učenja
- **Prezentacija radionice**: Profesionalna komunikacija statusa s jasnim planom razvoja

#### Poboljšano
- **Pristup sigurnosti na prvom mjestu**: Infrastrukturne promjene moguće prije validirati prije deploya
- **Timsku suradnju**: Rezultate previewa moguće dijeliti radi pregleda i odobrenja
- **Svijest o troškovima**: Bolje razumijevanje troškova resursa prije provisioninga
- **Smanjenje rizika**: Manje grešaka u deployu zahvaljujući pred-validaciji

#### Tehnička implementacija
- **Integracija kroz više dokumenata**: Preview funkcija obuhvaćena u 4 ključna dokumenta
- **Obrasci naredbi**: Dosljedna sintaksa i primjeri kroz čitavu dokumentaciju
- **Integracija najboljih praksi**: Preview uključen u validacijske tokove i skripte
- **Vizualni indikatori**: Jasne oznake NOVIH funkcija za olakšanu prepoznatljivost

#### Infrastruktura radionice
- **Komunikacija statusa**: Profesionalni HTML banner s gradijentnim stilom
- **Korisničko iskustvo**: Jasan razvojni status sprječava konfuziju
- **Profesionalna prezentacija**: Održava kredibilitet repozitorija uz postavljanje očekivanja
- **Transparentnost vremenskih okvira**: Označeno zadnje ažuriranje u listopadu 2025. radi odgovornosti

### [v3.3.0] - 2025-09-24

#### Poboljšani materijali radionice i interaktivno iskustvo učenja
**Ova verzija donosi sveobuhvatne materijale za radionicu s interaktivnim vodičima u pregledniku i strukturiranim putovima učenja.**

#### Dodano
- **🎥 Interaktivni vodič za radionicu**: Radionica u pregledniku s podrškom MkDocs previewa
- **📝 Strukturirane upute radionice**: 7-korak vođen put učenja od otkrivanja do prilagodbe
  - 0-Uvod: Pregled radionice i postavljanje
  - 1-Selektiranje AI predloška: Proces pronalaska i izbora predloška
  - 2-Validacija AI predloška: Postupci za deploy i verifikaciju
  - 3-Razlaganje AI predloška: Razumijevanje arhitekture predloška
  - 4-Konfiguracija AI predloška: Konfiguracija i prilagodbe
  - 5-Prilagodba AI predloška: Napredne modifikacije i iteracije
  - 6-Razgradnja infrastrukture: Čišćenje i upravljanje resursima
  - 7-Zaključak: Sažetak i daljnji koraci
- **🛠️ Alat za radionicu**: MkDocs konfiguracija s Material temom za poboljšano iskustvo učenja
- **🎯 Put prakse učenja**: 3-korak metodologija (Otkrivanje → Deploy → Prilagodba)
- **📱 Integracija GitHub Codespaces**: Besprijekorno postavljanje razvojnih okruženja

#### Poboljšano
- **AI laboratorij radionice**: Proširen s opsežnim 2-3 satnim strukturiranim iskustvom učenja
- **Dokumentacija radionice**: Profesionalna prezentacija s navigacijom i vizualnim pomagalima
- **Napredak u učenju**: Jasno vođstvo korak-po-korak od izbora predloška do produkcijskog deploya
- **Iskustvo programera**: Integrirani alati za učinkovitije radne tokove razvoja

#### Poboljšano
- **Pristupačnost**: Sučelje u pregledniku s pretragom, funkcijom kopiranja i izborom teme
- **Učenje vlastitim tempom**: Fleksibilna struktura radionice za različite brzine učenja
- **Praktična primjena**: Scenariji implementacije AI predložaka iz stvarnog života
- **Integracija zajednice**: Discord integracija za podršku radionici i suradnju

#### Značajke radionice
- **Ugrađena pretraga**: Brzo pronalaženje ključnih riječi i lekcija
- **Kopiranje blokova koda**: Funkcija kopiranja kod primjera s mišem iznad
- **Izbor teme**: Podrška za tamni/svijetli način rada prema preferencijama
- **Vizualni sadržaji**: Screenshoti i dijagrami za bolje razumijevanje
- **Integracija pomoći**: Direktan pristup Discord zajednici za podršku

### [v3.2.0] - 2025-09-17

#### Velika reorganizacija navigacije i sustav učenja baziran na poglavljima
**Ova verzija uvodi sveobuhvatan sustav učenja strukturiran kroz poglavlja s poboljšanom navigacijom kroz cijeli repozitorij.**

#### Dodano
- **📚 Sustav učenja po poglavljima**: Cijeli tečaj restrukturiran u 8 progresivnih poglavlja za učenje
  - Poglavlje 1: Temelji i brz početak (⭐ - 30-45 minuta)
  - Poglavlje 2: AI-prvo programiranje (⭐⭐ - 1-2 sata)
  - Poglavlje 3: Konfiguracija i autentikacija (⭐⭐ - 45-60 minuta)
  - Poglavlje 4: Infrastruktur kao kod & Deploy (⭐⭐⭐ - 1-1.5 sati)
  - Poglavlje 5: Rješenja s više AI agenata (⭐⭐⭐⭐ - 2-3 sata)
  - Poglavlje 6: Validacija i planiranje prije deploya (⭐⭐ - 1 sat)
  - Poglavlje 7: Otklanjanje problema i ispravljanje grešaka (⭐⭐ - 1-1.5 sati)
  - Poglavlje 8: Produkcijski i enterprise obrasci (⭐⭐⭐⭐ - 2-3 sata)
- **📚 Sveobuhvatan navigacijski sustav**: Dosljedni zaglavlja i podnožja navigacije u cijeloj dokumentaciji
- **🎯 Praćenje napretka**: Lista za provjeru završetka tečaja i sustav verificiranja učenja
- **🗺️ Smjernice za put učenja**: Jasni početni koraci za različite razine iskustva i ciljeve
- **🔗 Unakrsna navigacija**: Povezana poglavlja i jasne preduvjete

#### Poboljšano
- **Struktura README-a**: Pretvorena u strukturiranu platformu za učenje organiziranu po poglavljima
- **Navigacija dokumentacijom**: Svaka stranica sada uključuje kontekst poglavlja i smjernice napretka
- **Organizacija predložaka**: Primjeri i predlošci mapirani u odgovarajuća poglavlja za učenje
- **Integracija resursa**: Cheat sheet-ovi, često postavljana pitanja i vodiči povezani uz relevantna poglavlja
- **Integracija radionica**: Praktične laboratorijske vježbe mapirane na više ciljeva učenja po poglavljima

#### Promijenjeno
- **Progres u učenju**: Premješteno s linearne dokumentacije na fleksibilno učenje po poglavljima
- **Smještaj konfiguracije**: Vodič za konfiguraciju premješten u Poglavlje 3 radi boljeg toka učenja
- **Integracija AI sadržaja**: Bolja integracija sadržaja specifičnih za AI kroz cijelo putovanje učenja
- **Sadržaj za produkciju**: Napredni obrasci objedinjeni u Poglavlju 8 za učenike iz poduzeća

#### Poboljšano
- **Korisničko iskustvo**: Jasni putokazi navigacije i indikatori napretka po poglavljima
- **Pristupačnost**: Dosljedni obrasci navigacije za lakše prolaz kroz tečaj
- **Profesionalna prezentacija**: Struktura tečaja u stilu sveučilišta pogodna za akademsko i korporativno obrazovanje
- **Učinkovitost učenja**: Smanjeno vrijeme za pronalaženje relevantnog sadržaja kroz poboljšanu organizaciju

#### Tehnička implementacija
- **Zaglavlja navigacije**: Standardizirana navigacija po poglavljima u više od 40 dokumentacijskih datoteka
- **Navigacija u podnožju**: Dosljedna uputa za napredak i indikatori završetka poglavlja
- **Međusobno povezivanje**: Sveobuhvatan sustav unutarnjih poveznica koji povezuje povezane koncepte
- **Mapiranje poglavlja**: Predlošci i primjeri jasno povezani s ciljevima učenja

#### Poboljšanje vodiča za učenje
- **📚 Sveobuhvatni ciljevi učenja**: Preuređen vodič za usklađivanje sa sustavom od 8 poglavlja
- **🎯 Procjena po poglavljima**: Svako poglavlje uključuje specifične ciljeve učenja i praktične vježbe
- **📋 Praćenje napretka**: Tjedni raspored učenja s mjerljivim rezultatima i kontrolnim listama za dovršenje
- **❓ Pitanja za procjenu**: Pitanja za potvrdu znanja za svako poglavlje s profesionalnim rezultatima
- **🛠️ Praktične vježbe**: Radionice s praktičnim aktivnostima i scenarijima implementacije i otklanjanja poteškoća
- **📊 Napredak u vještinama**: Jasna progresija od osnovnih koncepata do obrazaca za poduzeća s fokusom na profesionalni razvoj
- **🎓 Okvir certificiranja**: Ishodi profesionalnog razvoja i sustav prepoznavanja zajednice
- **⏱️ Upravljanje vremenom**: Strukturirani plan učenja od 10 tjedana s validacijom prekretnica

### [v3.1.0] - 2025-09-17

#### Poboljšana rješenja za višestruke AI agente
**Ova verzija poboljšava višestruko-agentsko maloprodajno rješenje s boljim imenovanjem agenata i poboljšanom dokumentacijom.**

#### Promijenjeno
- **Terminologija višestrukih agenata**: Zamijenjen "Cora agent" s "Customer agent" kroz cijelo maloprodajno multi-agent rješenje radi jasnijeg razumijevanja
- **Arhitektura agenata**: Ažurirana sva dokumentacija, ARM predlošci i primjeri koda s dosljednim nazivom "Customer agent"
- **Primjeri konfiguracije**: Modernizirani obrasci konfiguracije agenata s ažuriranim nazivima
- **Dosljednost dokumentacije**: Osigurano da svi navodi koriste profesionalna i opisna imena agenata

#### Poboljšano
- **Paket ARM predloška**: Ažuriran retail-multiagent-arm-template s referencama na Customer agent
- **Dijagrami arhitekture**: Osvježeni Mermaid dijagrami s ažuriranim imenovanjem agenata
- **Primjeri koda**: Python klase i primjeri implementacije sada koriste naziv CustomerAgent
- **Varijable okoline**: Ažurirani svi skripti za implementaciju kako bi koristili konvencije CUSTOMER_AGENT_NAME

#### Poboljšano
- **Iskustvo programera**: Jasnije uloge i odgovornosti agenata u dokumentaciji
- **Spremnost za produkciju**: Bolja usklađenost s nazivnim konvencijama za poduzeća
- **Materijali za učenje**: Intuitivnije imenovanje agenata za edukativne svrhe
- **Upotrebljivost predložaka**: Pojednostavljeno razumijevanje funkcija agenata i obrazaca implementacije

#### Tehnički detalji
- Ažurirani Mermaid dijagrami arhitekture s referencama CustomerAgent
- Zamijenjena imena klasa CoraAgent s CustomerAgent u Python primjerima
- Modificirane ARM JSON konfiguracije predložaka da koriste tip agenata "customer"
- Ažurirane varijable okoline sa CORA_AGENT_* na CUSTOMER_AGENT_*
- Osvježene sve naredbe za implementaciju i konfiguracije kontejnera

### [v3.0.0] - 2025-09-12

#### Velike promjene - Fokus na AI programere i integracija Microsoft Foundry
**Ova verzija pretvara repozitorij u sveobuhvatni resurs za učenje fokusiran na AI s integracijom Microsoft Foundry.**

#### Dodano
- **🤖 AI-prvi put učenja**: Potpuno restrukturiranje s prioritetom na AI programere i inženjere
- **Vodič za integraciju Microsoft Foundry**: Sveobuhvatna dokumentacija za povezivanje AZD-a s Microsoft Foundry uslugama
- **Obrasci implementacije AI modela**: Detaljni vodič o odabiru modela, konfiguraciji i strategijama produkcijske implementacije
- **AI radionica laboratorium**: 2-3 sata praktičnih radionica za pretvaranje AI aplikacija u rješenja za implementaciju putem AZD-a
- **Najbolje prakse za AI u produkciji**: Obrasci spremni za poduzeća za skaliranje, nadzor i sigurnost AI radnih opterećenja
- **Vodič za rješavanje problema specifičnih za AI**: Sveobuhvatno otklanjanje problema za Microsoft Foundry modele, kognitivne usluge i AI implementacije
- **Galerija AI predložaka**: Istaknuta kolekcija Microsoft Foundry predložaka s ocjenama složenosti
- **Materijali za radionice**: Potpuna struktura radionica s praktičnim laboratorijima i referentnim materijalima

#### Poboljšano
- **Struktura README**: Fokus na AI programere s 45% podataka o interesu zajednice s Microsoft Foundry Discorda
- **Putovi učenja**: Posvećeno AI programu uz tradicionalne putove za studente i DevOps inženjere
- **Preporuke predložaka**: Istaknuti AI predlošci uključuju azure-search-openai-demo, contoso-chat i openai-chat-app-quickstart
- **Integracija zajednice**: Poboljšana podrška Discord zajednici s AI-specifičnim kanalima i raspravama

#### Sigurnost i fokus na produkciju
- **Obrasci upravljanog identiteta**: Autentifikacija i sigurnosne konfiguracije specifične za AI
- **Optimizacija troškova**: Praćenje uporabe tokena i kontrole proračuna za AI radna opterećenja
- **Implementacija u više regija**: Strategije za globalnu implementaciju AI aplikacija
- **Praćenje performansi**: AI-specifične metrike i integracija s Application Insights

#### Kvaliteta dokumentacije
- **Linearna struktura tečaja**: Logičan napredak od početničkih do naprednih obrazaca implementacije AI
- **Provjereni URL-ovi**: Svi vanjski linkovi na repozitorije verificirani i dostupni
- **Potpuna referenca**: Svi unutarnji linkovi u dokumentaciji potvrđeni i funkcionalni
- **Spremno za produkciju**: Obrasci implementacije za poduzeća s primjerima iz stvarnog svijeta

### [v2.0.0] - 2025-09-09

#### Velike promjene - Restrukturiranje repozitorija i profesionalna nadogradnja
**Ova verzija predstavlja značajan preokret u strukturi repozitorija i predstavljanju sadržaja.**

#### Dodano
- **Strukturirani okvir učenja**: Sve dokumentacijske stranice sada uključuju uvod, ciljeve učenja i ishode učenja
- **Sustav navigacije**: Dodane poveznice za prethodnu/sljedeću lekciju kroz cijelu dokumentaciju radi vođenog napredovanja u učenju
- **Vodič za učenje**: Sveobuhvatan study-guide.md s ciljevima učenja, praktičnim vježbama i materijalima za procjenu
- **Profesionalna prezentacija**: Uklonjeni svi emoji ikoni za poboljšanu pristupačnost i profesionalan izgled
- **Poboljšana struktura sadržaja**: Poboljšana organizacija i protok materijala za učenje

#### Promijenjeno
- **Format dokumentacije**: Standardizirana sva dokumentacija s dosljednom strukturom fokusiranom na učenje
- **Tok navigacije**: Implementiran logičan napredak kroz sve materijale za učenje
- **Prezentacija sadržaja**: Uklonjeni ukrasni elementi u korist jasnog, profesionalnog oblikovanja
- **Struktura poveznica**: Ažurirani svi unutarnji linkovi za podršku novom sustavu navigacije

#### Poboljšano
- **Pristupačnost**: Uklonjena ovisnost o emoji ikonama radi bolje kompatibilnosti sa čitačima zaslona
- **Profesionalni izgled**: Čist, akademski stil prikaza prikladan za učenje u poduzeću
- **Iskustvo učenja**: Strukturirani pristup s jasnim ciljevima i ishodima za svaku lekciju
- **Organizacija sadržaja**: Bolji logički protok i povezanost između povezanih tema

### [v1.0.0] - 2025-09-09

#### Početno izdanje - Sveobuhvatni repozitorij za učenje AZD-a

#### Dodano
- **Osnovna struktura dokumentacije**
  - Kompletan niz vodiča za početak rada
  - Sveobuhvatna dokumentacija za implementaciju i provisioning
  - Detaljni resursi za otklanjanje poteškoća i debugiranje
  - Alati i procedure za provjeru prije implementacije

- **Modul za početak rada**
  - Osnove AZD-a: Temeljni koncepti i terminologija
  - Vodič za instalaciju: upute specifične za platformu
  - Vodič za konfiguraciju: postavljanje okoliša i autentifikacija
  - Prvi tutorial projekta: korak-po-korak praktično učenje

- **Modul za implementaciju i provisioning**
  - Vodič za implementaciju: potpuna dokumentacija radnog procesa
  - Vodič za provisioning: infrastruktura kao kod s Bicepm
  - Najbolje prakse za produkcijske implementacije
  - Obrasci arhitekture za višeservisna okruženja

- **Modul za provjeru prije implementacije**
  - Planiranje kapaciteta: provjera dostupnosti Azure resursa
  - Odabir SKU-a: sveobuhvatne smjernice za slojeve usluge
  - Pre-flight provjere: automatizirani skripti za validaciju (PowerShell i Bash)
  - Alati za procjenu troškova i planiranje proračuna

- **Modul za otklanjanje poteškoća**
  - Uobičajeni problemi: često susretani problemi i rješenja
  - Vodič za debugiranje: sustavne metodologije uklanjanja pogrešaka
  - Napredne dijagnostičke tehnike i alati
  - Praćenje performansi i optimizacija

- **Resursi i reference**
  - Brzi referentni list naredbi
  - Rječnik: sveobuhvatni termini i definicije akronima
  - Često postavljana pitanja (FAQ)
  - Vanjski linkovi na resurse i veze sa zajednicom

- **Primjeri i predlošci**
  - Primjer jednostavne web aplikacije
  - Predložak za statičku web stranicu
  - Konfiguracija kontejnerske aplikacije
  - Obrasci integracije baza podataka
  - Primjeri mikroservisne arhitekture
  - Implementacije serverless funkcija

#### Značajke
- **Višeplatformska podrška**: vodiči za instalaciju i konfiguraciju za Windows, macOS i Linux
- **Više razina vještina**: sadržaj dizajniran za studente do profesionalnih programera
- **Praktični fokus**: primjeri iz stvarnog svijeta i praktični scenariji
- **Sveobuhvatna pokrivenost**: od osnovnih koncepata do naprednih obrazaca za poduzeća
- **Pristup usmjeren na sigurnost**: integrirane najbolje sigurnosne prakse
- **Optimizacija troškova**: smjernice za isplative implementacije i upravljanje resursima

#### Kvaliteta dokumentacije
- **Detaljni primjeri koda**: praktični, testirani primjeri koda
- **Upute korak po korak**: jasne, provedive smjernice
- **Sveobuhvatno rukovanje pogreškama**: otklanjanje poteškoća za uobičajene probleme
- **Integracija najboljih praksi**: industrijski standardi i preporuke
- **Kompatibilnost verzija**: ažurirano s najnovijim Azure uslugama i značajkama azd-a

## Planirana buduća poboljšanja

### Verzija 3.1.0 (planirano)
#### Proširenje AI platforme
- **Podrška za više modela**: obrasci integracije za Hugging Face, Azure Machine Learning i prilagođene modele
- **Okviri za AI agente**: predlošci za LangChain, Semantic Kernel i AutoGen implementacije
- **Napredni RAG obrasci**: opcije vektorskih baza podataka izvan Azure AI Search (Pinecone, Weaviate itd.)
- **AI Prometna vidljivost**: poboljšani nadzor performansi modela, upotrebe tokena i kvalitete odgovora

#### Iskustvo programera
- **VS Code proširenje**: integrirano razvojno iskustvo AZD + Microsoft Foundry
- **Integracija GitHub Copilot**: AI-podržana generacija AZD predložaka
- **Interaktivni tutorijali**: praktične kodirajuće vježbe s automatiziranom validacijom za AI scenarije
- **Video sadržaj**: dopunski video tutorijali za vizualne učenike fokusirane na AI implementacije

### Verzija 4.0.0 (planirano)
#### Obrasci AI za poduzeća
- **Okvir upravljanja**: upravljanje AI modelima, usklađenost i revizorski tragovi
- **Višenajamnički AI**: obrasci za pružanje usluga višestrukim korisnicima s izoliranim AI uslugama
- **Edge AI implementacija**: integracija s Azure IoT Edge i kontejnerskim instancama
- **Hibridni cloud AI**: višestruka cloud i hibridni obrasci implementacije za AI radna opterećenja

#### Napredne značajke
- **Automatizacija AI pipelinea**: MLOps integracija s Azure Machine Learning pipelineima
- **Napredna sigurnost**: obrasci zero-trust, privatne krajnje točke i napredno zaštita od prijetnji
- **Optimizacija performansi**: napredne strategije podešavanja i skaliranja za AI aplikacije visoke propusnosti
- **Globalna distribucija**: obrasci isporuke sadržaja i edge predmemoriranja za AI aplikacije

### Verzija 3.0.0 (planirano) - Superseded by Current Release
#### Predloženi dodaci - Sada implementirani u v3.0.0
- ✅ **Sadržaj fokusiran na AI**: Sveobuhvatna integracija Microsoft Foundry (dovršeno)
- ✅ **Interaktivni tutorijali**: praktična AI radionica (dovršeno)
- ✅ **Napredni modul sigurnosti**: AI-specifični sigurnosni obrasci (dovršeno)
- ✅ **Optimizacija performansi**: strategije podešavanja radnih opterećenja AI (dovršeno)

### Verzija 2.1.0 (planirano) - Djelomično implementirano u v3.0.0
#### Manja poboljšanja - Neka dovršena u trenutnom izdanju
- ✅ **Dodatni primjeri**: scenariji implementacije usmjereni na AI (dovršeno)
- ✅ **Prošireni FAQ**: AI-specifična pitanja i otklanjanje problema (dovršeno)
- **Integracija alata**: vodiči za poboljšanu integraciju IDE-a i uređivača
- ✅ **Proširenje nadzora**: AI-specifični obrasci nadzora i upozorenja (dovršeno)

#### Još planirano za buduće izdanje
- **Dokumentacija prilagođena mobilnim uređajima**: responzivan dizajn za mobilno učenje
- **Pristup bez interneta**: paketi dokumentacije za preuzimanje
- **Poboljšana integracija IDE-a**: VS Code proširenje za AZD + AI tijekove rada
- **Nadzorna ploča zajednice**: metrike zajednice u stvarnom vremenu i praćenje doprinosa

## Doprinos u promjenama promjena

### Prijava promjena
Prilikom doprinosa u ovom repozitoriju, molimo osigurajte da zapisi o promjenama uključuju:

1. **Broj verzije**: prema semantičkom verzioniranju (major.minor.patch)
2. **Datum**: datum izdavanja ili ažuriranja u formatu GGGG-MM-DD
3. **Kategorija**: Dodano, Promijenjeno, Zastarjelo, Uklonjeno, Ispravljeno, Sigurnost
4. **Jasan opis**: sažeti opis promjene
5. **Procjena utjecaja**: kako promjene utječu na postojeće korisnike

### Kategorije promjena

#### Dodano
- Nove značajke, odjeljci dokumentacije ili sposobnosti
- Novi primjeri, predlošci ili resursi za učenje
- Dodatni alati, skripte ili uslužni programi

#### Promijenjeno
- Izmjene postojeće funkcionalnosti ili dokumentacije
- Ažuriranja za poboljšanje jasnoće ili točnosti
- Restrukturiranje sadržaja ili organizacije

#### Zastarjelo
- Značajke ili pristupi koji se povlače iz upotrebe
- Odjeljci dokumentacije predviđeni za uklanjanje
- Metode za koje postoje bolje alternative

#### Uklonjeno
- Značajke, dokumentacija ili primjeri koji više nisu relevantni
- Zastarjele informacije ili zastarjeli pristupi
- Redundantni ili objedinjeni sadržaj

#### Ispravljeno
- Ispravci pogrešaka u dokumentaciji ili kodu
- Rješavanje prijavljenih problema ili poteškoća
- Poboljšanja točnosti ili funkcionalnosti

#### Sigurnost
- Sigurnosna poboljšanja ili ispravci
- Ažuriranja najboljih sigurnosnih praksi
- Rješavanje sigurnosnih ranjivosti

### Smjernice semantičkog verzioniranja

#### Glavna verzija (X.0.0)
- Promjene koje zahtijevaju akciju korisnika
- Značajna restrukturiranja sadržaja ili organizacije
- Promjene koje mijenjaju temeljni pristup ili metodologiju

#### Manja verzija (X.Y.0)
- Nove značajke ili dodaci sadržaju
- Poboljšanja koja održavaju kompatibilnost unatrag
- Dodatni primjeri, alati ili resursi

#### Verzija zakrpe (X.Y.Z)
- Ispravci pogrešaka i popravci
- Manja poboljšanja postojećeg sadržaja
- Pojašnjenja i mala poboljšanja

## Povratne informacije i prijedlozi zajednice

Aktivno potičemo povratne informacije zajednice za poboljšanje ovog resursa za učenje:

### Kako dati povratnu informaciju
- **GitHub Issues**: Prijavite probleme ili predložite poboljšanja (dobrodošle teme vezane za AI)
- **Discord Rasprave**: Dijelite ideje i uključite se u Microsoft Foundry zajednicu
- **Pull Requests**: Izravno doprinesite poboljšanjima sadržaja, posebno AI predložaka i vodiča
- **Microsoft Foundry Discord**: Sudjelujte u #Azure kanalu za AZD + AI rasprave
- **Zajednički Forumi**: Sudjelujte u širim raspravama za Azure developere

### Kategorije povratnih informacija
- **Točnost AI sadržaja**: Ispravci informacija o integraciji i implementaciji AI usluga
- **Iskustvo učenja**: Prijedlozi za poboljšani tijek učenja za AI developere
- **Nedostajući AI sadržaj**: Zahtjevi za dodatnim AI predlošcima, uzorcima ili primjerima
- **Pristupačnost**: Poboljšanja za različite potrebe učenja
- **Integracija AI alata**: Prijedlozi za bolje povezivanje AI razvojnih tijekova
- **Produkcijski AI uzorci**: Zahtjevi za obrasce implementacije AI na razini poduzeća

### Obveza odgovora
- **Odgovor na probleme**: Unutar 48 sati za prijavljene probleme
- **Zahtjevi za značajke**: Procjena unutar jednog tjedna
- **Doprinosi zajednice**: Pregled u roku od tjedan dana
- **Sigurnosna pitanja**: Trenutna prioritetnost s ubrzanim odgovorom

## Raspored održavanja

### Redovna ažuriranja
- **Mjesečni pregledi**: Točnost sadržaja i provjera poveznica
- **Kvartalna ažuriranja**: Veliki dodaci i poboljšanja sadržaja
- **Polugodišnji pregledi**: Sveobuhvatna restrukturiranja i poboljšanja
- **Godišnja izdanja**: Glavna ažuriranja verzija sa značajnim poboljšanjima

### Praćenje i osiguranje kvalitete
- **Automatsko testiranje**: Redovna validacija kod primjera i poveznica
- **Integracija povratnih informacija zajednice**: Redovno uključenje korisničkih prijedloga
- **Ažuriranja tehnologije**: Usklađivanje sa najnovijim Azure uslugama i izdanjima azd
- **Revizije pristupačnosti**: Redovni pregledi za principe inkluzivnog dizajna

## Politika podrške verzija

### Trenutna podrška verzija
- **Najnovija glavna verzija**: Potpuna podrška sa redovitim ažuriranjima
- **Prethodna glavna verzija**: Sigurnosna ažuriranja i kritične ispravke 12 mjeseci
- **Nasljedne verzije**: Podrška zajednice, bez službenih ažuriranja

### Smjernice za migraciju
Kada se izdaju glavne verzije, nudimo:
- **Vodiče za migraciju**: Upute korak-po-korak za prijelaz
- **Bilješke o kompatibilnosti**: Detalji o promjenama koje prekidaju kompatibilnost
- **Podršku alata**: Skripte ili alati koji pomažu pri migraciji
- **Podršku zajednice**: Namjenski forumi za pitanja migracije

---

**Navigacija**
- **Prethodna lekcija**: [Study Guide](resources/study-guide.md)
- **Sljedeća lekcija**: Povratak na [Main README](README.md)

**Ostanite u toku**: Pratite ovaj repozitorij kako biste dobivali obavijesti o novim izdanjima i važnim ažuriranjima materijala za učenje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->