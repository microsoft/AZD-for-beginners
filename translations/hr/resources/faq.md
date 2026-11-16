# Često postavljana pitanja (FAQ)

**Dobivanje pomoći po poglavljima**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **🚆 Problemi s instalacijom**: [Poglavlje 1: Instalacija i postavljanje](../docs/chapter-01-foundation/installation.md)
- **🤖 Pitanja o umjetnoj inteligenciji**: [Poglavlje 2: AI-First razvoj](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Otklanjanje poteškoća**: [Poglavlje 7: Otklanjanje poteškoća i ispravljanje pogrešaka](../docs/chapter-07-troubleshooting/common-issues.md)

## Uvod

Ovaj sveobuhvatni FAQ pruža odgovore na najčešća pitanja o Azure Developer CLI (azd) i Azure implementacijama. Pronađite brza rješenja za uobičajene probleme, razumite najbolje prakse i dobijte pojašnjenja o azd konceptima i radnim procesima.

## Ciljevi učenja

Pregledom ovog FAQ-a ćete:
- Pronaći brze odgovore na česta pitanja i probleme vezane za Azure Developer CLI
- Razumjeti ključne pojmove i terminologiju kroz praktični format pitanja i odgovora
- Pristupiti rješenjima za otklanjanje problema kod učestalih problema i scenarija pogrešaka
- Naučiti najbolje prakse kroz često postavljana pitanja o optimizaciji
- Otkriti napredne značajke i mogućnosti kroz pitanja na stručnoj razini
- Efikasno koristiti smjernice za troškove, sigurnost i strategiju implementacije

## Ishodi učenja

Redovitim korištenjem ovog FAQ-a moći ćete:
- Neovisno rješavati uobičajene probleme Azure Developer CLI koristeći ponuđena rješenja
- Donositi informirane odluke o strategijama i konfiguracijama implementacije
- Razumjeti odnos između azd i drugih Azure alata i usluga
- Primijeniti najbolje prakse na temelju zajedničkog iskustva i stručnih preporuka
- Učinkovito otklanjati probleme s autentikacijom, implementacijom i konfiguracijom
- Optimizirati troškove i performanse koristeći uvide i preporuke iz FAQ-a

## Sadržaj

- [Početak rada](#getting-started)
- [Autentikacija i pristup](#authentication--access)
- [Predlošci i projekti](#templates--projects)
- [Implementacija i infrastruktura](#deployment--infrastructure)
- [Konfiguracija i okruženja](#configuration--environments)
- [Otklanjanje poteškoća](#troubleshooting)
- [Troškovi i naplata](#cost--billing)
- [Najbolje prakse](#best-practices)
- [Napredne teme](#advanced-topics)

---

## Početak rada

### P: Što je Azure Developer CLI (azd)?
**O**: Azure Developer CLI (azd) je alat naredbenog retka usmjeren na programere koji ubrzava vrijeme potrebno da vaša aplikacija prijeđe iz lokalnog razvojog okruženja u Azure. Pruža najbolje prakse putem predložaka i pomaže u cijelom životnom ciklusu implementacije.

### P: Čime se azd razlikuje od Azure CLI?
**O**: 
- **Azure CLI**: Alat opće namjene za upravljanje Azure resursima
- **azd**: Alat fokusiran na programere za radne procese implementacije aplikacija
- azd ima vlastitu autentikaciju i radni tijek implementacije; Azure CLI je zaseban, dopunski alat
- azd uključuje predloške, upravljanje okruženjima i automatizaciju implementacije

### P: Trebam li instalirati Azure CLI da bih koristio azd?
**O**: Nije potrebno za osnovni radni tijek AZD-a. Autentificirajte se pomoću `azd auth login`. Instalirajte Azure CLI zasebno kada tematski kôd ili vježba eksplicitno koriste `az` naredbe.

### P: Koje programske jezike azd podržava?
**O**: azd je neovisan o jeziku. Radi s:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statickim web-mjestima
- Kontejneriziranim aplikacijama

### P: Mogu li koristiti azd s postojećim projektima?
**O**: Da! Možete:
1. Koristiti `azd init` za dodavanje azd konfiguracije postojećim projektima
2. Prilagoditi postojeće projekte da odgovaraju azd strukturi predloška
3. Kreirati prilagođene predloške na temelju svoje postojeće arhitekture

---

## Autentikacija i pristup

### P: Kako se autentificirati na Azure koristeći azd?
**O**: Koristite `azd auth login` koji će otvoriti prozor preglednika za Azure autentikaciju. Za CI/CD scenarije koristite servisne račune ili upravljane identitete.

### P: Mogu li koristiti azd sa više Azure pretplata?
**O**: Da. Koristite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` da navedete koju pretplatu koristiti za svako okruženje.

### P: Koje dozvole trebam da implementiram pomoću azd?
**O**: Tipično su potrebne:
- Uloga **Contributor** na grupi resursa ili pretplati
- Uloga **User Access Administrator** ako implementirate resurse koji zahtijevaju dodjele uloga
- Specifične dozvole ovise o predlošku i resursima koji se implementiraju

### P: Mogu li koristiti azd u CI/CD pipeline-ovima?
**O**: Apsolutno! azd je dizajniran za integraciju u CI/CD. Koristite servisne račune za autentikaciju i postavite varijable okruženja za konfiguraciju.

### P: Kako upravljati autentikacijom u GitHub Actions?
**O**: Preferirajte workload identity federation (OIDC), konfigurirano s `azd pipeline config`. Generirani radni proces instalira AZD i autentificira AZD direktno s federiranim identitetom. Sam korak `azure/login` ne uspostavlja AZD prijavu. Korak prijave unutar postojeće zadaće je:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Provizionirajte ili implementirajte nakon prijave, s konfiguriranim namjeravanim AZD okruženjem, pretplatom i lokacijom. Federirani vjerodajnice identiteta moraju imati povjerenje u repozitorij/ref radnog procesa ili GitHub okruženje i Azure uloge moraju dozvoljavati tražene operacije.

---

## Predlošci i projekti

### P: Gdje mogu pronaći azd predloške?
**O**: 
- Službeni i zajednički predlošci: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Zajednički predlošci: GitHub pretraga za "azd-template"
- Koristite `azd template list` za pregled dostupnih predložaka

### P: Kako kreiram prilagođeni predložak?
**O**: 
1. Počnite sa postojećom strukturom predloška
2. Izmijenite `azure.yaml`, infrastrukturne datoteke i aplikacijski kod
3. Temeljito testirajte pomoću `azd up`
4. Objavite na GitHubu s prikladnim oznakama

### P: Mogu li koristiti azd bez predloška?
**O**: Da, koristite `azd init` u postojećem projektu za kreiranje potrebnih konfiguracijskih datoteka. Morat ćete ručno konfigurirati `azure.yaml` i infrastrukturne datoteke.

### P: Koja je razlika između službenih i zajedničkih predložaka?
**O**: 
- **Službeni predlošci**: Održavaju ih Microsoft, redovito se ažuriraju, s opsežnom dokumentacijom
- **Zajednički predlošci**: Izrađuju ih programeri, mogu imati specijalizirane primjene, kvaliteta i održavanje variraju

### P: Kako ažuriram predložak u svom projektu?
**O**: Predlošci se ne ažuriraju automatski. Možete:
1. Ručno usporediti i spojiti promjene iz izvornog predloška
2. Početi ispočetka sa `azd init` koristeći ažurirani predložak
3. Izabrati pojedinačna poboljšanja iz ažuriranih predložaka

---

## Implementacija i infrastruktura

### P: Koje Azure usluge azd može implementirati?
**O**: azd može implementirati bilo koju Azure uslugu putem Bicep/ARM predložaka, uključujući:
- App Services, Container Apps, Functions
- Baze podataka (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Mrežne, sigurnosne i nadzorne resurse

### P: Mogu li implementirati u više regija?
**O**: Da, konfigurirajte više regija u svojim Bicep predlošcima i postavite parametar lokacije prema potrebi za svako okruženje.

### P: Kako upravljati migracijama baze podataka?
**O**: Koristite implementacijske hookove u `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### P: Mogu li implementirati samo infrastrukturu bez aplikacija?
**O**: Da, koristite `azd provision` za implementaciju samo infrastrukturnih komponenti definiranih u predlošcima.

### P: Kako implementirati postojeće Azure resurse?
**O**: Da, ako predložak to podržava. Referencirajte postojeće resurse s Bicep `existing` deklaracijama ili parametrima za postojeće resurse dokumentiranim u predlošku, i mapirajte aplikacijske usluge na njihove ciljeve. Ovo ne uvozi vlasništvo niti automatski kreira nedostajuće dozvole. Pregledajte predložak prije implementacije.

### P: Mogu li koristiti Terraform umjesto Bicepa?
**O**: Da. AZD podržava Terraform kao i Bicep. Odaberite predložak baziran na Terraformu ili konfigurirajte `infra.provider: terraform` u `azure.yaml`, s odgovarajućim Terraform datotekama i konfiguracijom stanja/backenda. Pogledajte [Terraform radni proces](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfiguracija i okruženja

### P: Kako upravljati različitim okruženjima (dev, staging, prod)?
**O**: Kreirajte zasebna okruženja s `azd env new <environment-name>` i konfigurirajte različite postavke za svako:
```bash
azd env new development
azd env new staging  
azd env new production
```

### P: Gdje se pohranjuju konfiguracije okruženja?
**O**: U mapi `.azure` unutar direktorija vašeg projekta. Svako okruženje ima vlastitu mapu s konfiguracijskim datotekama.

### P: Kako postaviti konfiguraciju specifičnu za okruženje?
**O**: Koristite `azd env set` za konfiguriranje varijabli okruženja:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: Mogu li dijeliti konfiguracije okruženja među članovima tima?
**O**: Mapa `.azure` sadrži osjetljive informacije i ne bi se trebala komitirati u kontrolu verzija. Umjesto toga:
1. Dokumentirajte potrebne varijable okruženja
2. Koristite skripte za implementaciju za postavljanje okruženja
3. Koristite Azure Key Vault za osjetljive konfiguracije

### P: Kako nadjačati zadane postavke predloška?
**O**: Postavite varijable okruženja koje odgovaraju parametrima predloška:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Samo varijable koje predložak koristi utječu na implementaciju. `SKU_NAME` iznad je primjer prilagođenog unosa, ne univerzalna AZD postavka.

---

## Otklanjanje poteškoća

### P: Zašto `azd up` ne uspijeva?
**O**: Uobičajeni uzroci:
1. **Problemi s autentikacijom**: Pokrenite `azd auth login`
2. **Nedostatak dozvola**: Provjerite dodjele uloga u Azureu
3. **Sukobi naziva resursa**: Pregledajte sukobljeni resurs i unos imena u predlošku; kreirajte zasebno okruženje s `azd env new` ako je potrebna izolacija
4. **Problemi s kvotom/kapacitetom**: Provjerite regionalnu dostupnost
5. **Greške u predlošku**: Validirajte Bicep predloške

### P: Kako otkloniti pogreške u neuspjelim implementacijama?
**O**: 
1. Koristite `azd deploy --debug` za detaljne izlaze
2. Provjerite povijest implementacija u Azure portalu
3. Pregledajte zapisnik aktivnosti u Azure portalu
4. Koristite `azd show` za prikaz trenutnog stanja okruženja

### P: Zašto moje varijable okruženja ne rade?
**O**: Provjerite:
1. Da imena varijabli točno odgovaraju parametrima predloška
2. Da su vrijednosti pravilno navedene u navodnicima ako sadrže razmake
3. Odabrano je ispravno okruženje: `azd env select <environment>`
4. Varijable su postavljene u pravom okruženju

### P: Kako očistiti neuspjele implementacije?
**O**: 
```bash
azd down
```
Najprije pregledajte odabrano okruženje i potvrdu brisanja. Ovo briše provisionirane Azure resurse, a ne lokalnu konfiguraciju okruženja `.azure`. `--purge` dodatno traži trajno brisanje podržanih soft-izbrisanih resursa i može biti blokirano zaštitom zadržavanja/brisanja; to nije rutinski korak za oporavak.

### P: Zašto moja aplikacija nije dostupna nakon implementacije?
**O**: Provjerite:
1. Da je implementacija uspješno završena
2. Da aplikacija radi (provjerite zapise u Azure portalu)
3. Da mrežne sigurnosne grupe dopuštaju promet
4. Da su DNS/prilagođene domene pravilno konfigurirane

---

## Troškovi i naplata

### P: Koliko će koštati azd implementacije?
**O**: Troškovi ovise o:
- Azure uslugama koje se implementiraju
- Odabrani slojevi usluge/SKU-ovi
- Regionalnim razlikama u cijenama
- Obrasci korištenja

Koristite [Azure kalkulator cijena](https://azure.microsoft.com/pricing/calculator/) za procjene.

### P: Kako kontrolirati troškove u azd implementacijama?
**O**: 
1. Koristite SKU-ove nižih slojeva za razvojna okruženja
2. Postavite Azure budžete i upozorenja
3. Koristite `azd down` za uklanjanje resursa kad nisu potrebni
4. Odaberite prikladne regije (troškovi variraju po lokaciji)
5. Koristite alate Azure Cost Management

### P: Postoje li opcije besplatnog sloja za azd predloške?
**O**: Neke usluge imaju besplatne SKU-ove ili mjesečne potpore, ovisno o uvjetima podobnosti, planu hostinga, regiji i ograničenjima pretplate. To ne znači da je cijeli predložak besplatan: baze podataka, pretraživanje, mreže, registar, telemetrija i izvođenje modela mogu sami uzrokovati troškove. Provjerite [popis besplatnih Azure usluga](https://azure.microsoft.com/free/) i trenutačne cijene za svaki resurs prije implementacije.

### P: Kako procijeniti troškove prije implementacije?
**O**: 
1. Pregledajte `main.bicep` predloška da vidite koji se resursi kreiraju
2. Koristite Azure kalkulator cijena s određenim SKU-ovima
3. Prvo implementirajte u razvojnom okruženju da pratite stvarne troškove
4. Koristite Azure Cost Management za detaljnu analizu troškova

---

## Najbolje prakse

### P: Koje su najbolje prakse za strukturu azd projekta?
**O**: 
1. Držite aplikacijski kod odvojen od infrastrukture
2. Koristite smislenim imena usluga u `azure.yaml`
3. Implementirajte odgovarajuće rukovanje pogreškama u build skriptama
4. Koristite konfiguraciju specifičnu za okruženje
5. Uključite opsežnu dokumentaciju

### P: Kako organizirati više usluga u azd-u?
**O**: Koristite preporučenu strukturu:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### P: Trebam li komitirati `.azure` mapu u kontrolu verzija?
**O**: **Ne!** Mapa `.azure` sadrži osjetljive podatke. Dodajte je u `.gitignore`:
```gitignore
.azure/
```

### P: Kako upravljam tajnama i osjetljivom konfiguracijom?
**O**: 
1. Koristite Azure Key Vault za tajne
2. Referencirajte tajne iz Key Vaulta u konfiguraciji aplikacije
3. Nikada nemojte stavljati tajne u verzioniranje
4. Koristite upravljane identitete za autentifikaciju između servisa

### P: Koji je preporučeni pristup za CI/CD s azd?
**O**: 
1. Koristite odvojena okruženja za svako fazu (dev/staging/prod)
2. Implementirajte automatizirano testiranje prije implementacije
3. Koristite servisne principe za autentifikaciju
4. Pohranite osjetljivu konfiguraciju u pipeline tajne/varijable
5. Implementirajte odobrenja za produkcijske implementacije

---

## Napredne teme

### P: Mogu li proširiti azd s prilagođenom funkcionalnošću?
**O**: Da, putem deployment hooks u `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: Kako integriram azd s postojećim DevOps procesima?
**O**: 
1. Koristite azd naredbe u postojećim pipeline skriptama
2. Standardizirajte azd predloške unutar timova
3. Integrirajte s postojećim nadzorom i obavještavanjem
4. Koristite azd-ov JSON izlaz za integraciju u pipeline

### P: Mogu li koristiti azd s Azure DevOpsom?
**O**: Da, azd radi s bilo kojim CI/CD sustavom. Kreirajte Azure DevOps pipelines koji koriste azd naredbe.

### P: Kako mogu doprinijeti azd-u ili stvarati predloške za zajednicu?
**O**: 
1. **azd alat**: Doprinesite na [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Predlošci**: Slijedite upute za doprinos [Awesome AZD galeriji](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentacija**: Doprinesite dokumentaciji na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: Koji je plan razvoja za azd?
**O**: Pogledajte [službeni plan razvoja](https://github.com/Azure/azure-dev/projects) za planirane značajke i poboljšanja.

### P: Kako migriram s drugih alata za implementaciju na azd?
**O**: 
1. Analizirajte postojeću arhitekturu implementacije
2. Izradite odgovarajuće Bicep predloške
3. Konfigurirajte `azure.yaml` da odgovara postojećim servisima
4. Temeljito testirajte u razvojnom okruženju
5. Postupno migrirajte okruženja

---

## Imate još pitanja?

### **Prvo pretražite**
- Provjerite [službenu dokumentaciju](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Pretražite [GitHub issues](https://github.com/Azure/azure-dev/issues) za slične probleme

### **Potražite pomoć**
- [GitHub rasprave](https://github.com/Azure/azure-dev/discussions) - Podrška zajednice
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tehnička pitanja
- [Azure Discord](https://discord.gg/azure) - Razgovor zajednice u stvarnom vremenu

### **Prijavite probleme**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Prijave bugova i zahtjevi za značajke
- Uključite relevantne zapise, poruke o greškama i korake za reprodukciju

### **Saznajte više**
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Tehnički vodič pregledan: 4. studenog 2026. Provjera dostupnosti u oblaku i cijena mora se napraviti za vašu pretplatu i regiju.*

---

**Navigacija**
- **Prethodna lekcija**: [Rječnik](glossary.md)
- **Sljedeća lekcija**: [Priručnik za učenje](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->