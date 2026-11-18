# Često postavljana pitanja (FAQ)

**Dobijte pomoć po poglavlju**
- **📚 Početna stranica tečaja**: [AZD Za početnike](../README.md)
- **🚆 Problemi s instalacijom**: [Poglavlje 1: Instalacija i postavljanje](../docs/chapter-01-foundation/installation.md)
- **🤖 Pitanja o umjetnoj inteligenciji**: [Poglavlje 2: AI-prvo razvijanje](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Rješavanje problema**: [Poglavlje 7: Rješavanje problema i ispravljanje pogrešaka](../docs/chapter-07-troubleshooting/common-issues.md)

## Uvod

Ovaj opsežni FAQ pruža odgovore na najčešća pitanja o Azure Developer CLI (azd) i Azure implementacijama. Pronađite brza rješenja za uobičajene probleme, razumite najbolje prakse i dobite pojašnjenja o azd konceptima i radnim tijekovima.

## Ciljevi učenja

Pregledom ovog FAQ-a, moći ćete:
- Pronaći brze odgovore na česta pitanja i probleme vezane uz Azure Developer CLI
- Razumjeti ključne pojmove i terminologiju kroz praktični Q&A format
- Pristupiti rješenjima za često ponavljajuće probleme i scenarije grešaka
- Naučiti najbolje prakse kroz često postavljana pitanja o optimizaciji
- Otkriti napredne značajke i mogućnosti kroz stručna pitanja
- Učinkovito koristiti smjernice za troškove, sigurnost i strategiju implementacije

## Ishodi učenja

Redovitim pregledom ovog FAQ-a, moći ćete:
- Neovisno rješavati uobičajene probleme Azure Developer CLI koristeći dostupna rješenja
- Donositi informirane odluke o strategijama i konfiguracijama implementacije
- Razumjeti odnos između azd i drugih Azure alata i usluga
- Primijeniti najbolje prakse temeljene na iskustvu zajednice i stručnim preporukama
- Učinkovito rješavati probleme vezane uz autentifikaciju, implementaciju i konfiguraciju
- Optimizirati troškove i performanse koristeći uvide i preporuke FAQ-a

## Sadržaj

- [Početak rada](#getting-started)
- [Autentifikacija i pristup](#authentication--access)
- [Predlošci i projekti](#templates--projects)
- [Implementacija i infrastruktura](#deployment--infrastructure)
- [Konfiguracija i okruženja](#configuration--environments)
- [Rješavanje problema](#troubleshooting)
- [Troškovi i naplata](#cost--billing)
- [Najbolje prakse](#best-practices)
- [Napredne teme](#advanced-topics)

---

## Početak rada

### P: Što je Azure Developer CLI (azd)?
**O**: Azure Developer CLI (azd) je alat za naredbeni redak usmjeren na programere koji ubrzava vrijeme potrebno da vaša aplikacija pređe iz lokalnog razvojnog okruženja u Azure. Pruža najbolje prakse kroz predloške i pomaže u cijelom životnom ciklusu implementacije.

### P: Po čemu se azd razlikuje od Azure CLI?
**O**: 
- **Azure CLI**: Univerzalni alat za upravljanje Azure resursima
- **azd**: Alat fokusiran na programere za radne tokove implementacije aplikacija
- azd ima vlastitu autentifikaciju i radni tok implementacije; Azure CLI je zaseban, dopunski alat
- azd uključuje predloške, upravljanje okruženjima i automatizaciju implementacije

### P: Trebam li instalirati Azure CLI da bih koristio azd?
**O**: Nije potrebno za osnovni AZD radni tok. Autentificirajte se sa `azd auth login`. Instalirajte Azure CLI odvojeno kad predložak ili vježba izričito koriste naredbe `az`.

### P: Koje programske jezike azd podržava?
**O**: azd je neovisan o jeziku. Radi s:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statičkim web stranicama
- Kontejneriziranim aplikacijama

### P: Mogu li koristiti azd s postojećim projektima?
**O**: Da! Možete:
1. Koristiti `azd init` za dodavanje azd konfiguracije postojećim projektima
2. Prilagoditi postojeće projekte da odgovaraju azd strukturi predložaka
3. Kreirati prilagođene predloške bazirane na vašoj postojećoj arhitekturi

### P: Što se promijenilo s općom dostupnošću Foundry proširenja?
**A**: Paket `microsoft.foundry` dosegao je verziju 1.0 i GA 5. studenog 2026. S AZD 1.37.0+ koristite `azd ext install microsoft.foundry` za instalaciju sedam osnovnih proširenja za agente, veze, inspektora, projekte, rutine, vještine i alate. To nije novi prostor naziva naredbi, a njegove komponente imaju neovisno verzioniranje. Evaluacije, skupovi podataka, fino podešavanje i prilagođeni modeli instaliraju se zasebno; opcionalne značajke u pregledu ne postaju GA samo zato što je paket GA.

Vodič [hosted-agent](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) koristi Python 3.13+ i trenutni uv. `azd ai agent run` otvara Agent Inspector lokalno, ali pozivi modela i dalje koriste Azure i naplaćuju se. Način rada s kodom `azd deploy` učitava izvor za udaljenu izgradnju bez potrebe za lokalnom izgradnjom kontejnera.

### P: Uklanja li `azd down` hostiranog agenta iz postojeće Foundry aplikacije?
**O**: Ne za put ponovno korištenog projekta opisan u hosted-agent kratkom vodiču: ostavlja projekt, hostiranog agenta i ostale resurse na mjestu. Neželjene resurse uklonite zasebno bez brisanja zajedničkih resursa. Ako je okruženje kreiralo novi Foundry projekt, `azd down` briše njegovu grupu resursa i sve u njoj. Pregledajte [smjernice za čišćenje](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) i upite za brisanje prije potvrde.

---

## Autentikacija i pristup

### P: Kako se autentificirati s Azure pomoću azd?
**O**: Koristite `azd auth login` što će otvoriti prozor preglednika za Azure autentikaciju. Za CI/CD scenarije koristite servisne principe ili upravljane identitete.

### P: Mogu li koristiti azd s više Azure pretplata?
**O**: Da. Koristite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` za specificiranje pretplate za svako okruženje.

### P: Koje ovlasti trebam za implementaciju pomoću azd?
**O**: Obično trebate:
- ulogu **Contributor** na grupi resursa ili pretplati
- ulogu **User Access Administrator** ako implementirate resurse za koje su potrebna dodjeljivanja uloga
- Specifične dozvole variraju ovisno o predlošku i resursima koji se implementiraju

### P: Mogu li koristiti azd u CI/CD pipelineovima?
**O**: Apsolutno! azd je dizajniran za integraciju u CI/CD. Za autentikaciju koristite servisne principe i postavite varijable okruženja za konfiguraciju.

### P: Kako se nositi s autentikacijom u GitHub Actions?
**O**: Preferirajte federaciju identiteta opterećenja posla (OIDC), konfiguriranu s `azd pipeline config`. Generirani workflow instalira AZD i autentificira AZD direktno s federiranim identitetom. Korak `azure/login` sam za sebe ne uspostavlja AZD prijavu. Prijavni korak unutar postojećeg posla je:
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

Provjerite ili implementirajte nakon prijave, s namijenjenim AZD okruženjem, pretplatom i lokacijom konfiguriranim. Federirani vjerodajnik identiteta mora imati povjerenje za repozitorij/ref workflowa ili GitHub okruženje, a njegove Azure uloge moraju omogućavati tražene operacije.

---

## Predlošci i projekti

### P: Gdje mogu pronaći azd predloške?
**O**: 
- Službeni i zajednički predlošci: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Zajednički predlošci: GitHub pretraživanje za "azd-template"
- Koristite `azd template list` za pregled dostupnih predložaka

### P: Kako napraviti vlastiti prilagođeni predložak?
**O**: 
1. Počnite s postojećom strukturom predloška
2. Izmijenite `azure.yaml`, datoteke infrastrukture i aplikacijski kod
3. Temeljito testirajte s `azd up`
4. Objavite na GitHub s odgovarajućim oznakama

### P: Mogu li koristiti azd bez predloška?
**O**: Da, koristite `azd init` u postojećem projektu za izradu potrebnih konfiguracijskih datoteka. Potrebno je ručno konfigurirati `azure.yaml` i datoteke infrastrukture.

### P: Koja je razlika između službenih i zajedničkih predložaka?
**O**: 
- **Službeni predlošci**: Održava ih Microsoft, redovito se ažuriraju, imaju opsežnu dokumentaciju
- **Zajednički predlošci**: Kreiraju ih developeri, mogu imati specijalizirane slučajeve uporabe, različitu kvalitetu i održavanje

### P: Kako ažurirati predložak u mom projektu?
**O**: Predlošci se ne ažuriraju automatski. Možete:
1. Ručno usporediti i spojiti promjene iz izvornog predloška
2. Početi iznova s `azd init` koristeći ažurirani predložak
3. Odabrati specifična poboljšanja iz ažuriranih predložaka

---

## Implementacija i infrastruktura

### P: Koje Azure usluge može implementirati azd?
**O**: azd može implementirati bilo koju Azure uslugu putem Bicep/ARM predložaka, uključujući:
- App Services, Container Apps, Functions
- Baze podataka (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Umrežavanje, sigurnosne i nadzorne resurse

### P: Mogu li implementirati u više regija?
**O**: Da, konfigurirajte više regija u svojim Bicep predlošcima i postavite parametar lokacije odgovarajuće za svako okruženje.

### P: Kako upravljati migracijama sheme baze podataka?
**O**: Koristite implementacijske kuke u `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### P: Mogu li implementirati samo infrastrukturu bez aplikacija?
**O**: Da, koristite `azd provision` za implementaciju samo infrastrukturnih komponenti definiranih u vašim predlošcima.

### P: Kako implementirati postojeće Azure resurse?
**O**: Da, ako predložak to podržava. Referencirajte postojeće resurse s Bicep deklaracijama `existing` ili parametarskim vrijednostima za postojeće resurse definiranim u predlošku i mapirajte aplikacijske usluge na njihove namijenjene ciljeve. Ovo ne uvozi vlasništvo niti automatski kreira potrebne dozvole. Pregledajte predložak prije implementacije.

### P: Mogu li koristiti Terraform umjesto Bicep-a?
**O**: Da. AZD podržava Terraform kao i Bicep. Izaberite predložak baziran na Terraformu ili konfigurirajte `infra.provider: terraform` u `azure.yaml`, s odgovarajućim Terraform datotekama i konfiguracijom stanja/backend-a. Pogledajte [Terraform workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

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
**O**: U mapi `.azure` unutar direktorija vašeg projekta. Svako okruženje ima svoju mapu s konfiguracijskim datotekama.

### P: Kako postaviti konfiguraciju specifičnu za okruženje?
**O**: Koristite `azd env set` za konfiguraciju varijabli okruženja:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: Mogu li dijeliti konfiguracije okruženja među članovima tima?
**O**: Mapa `.azure` sadrži osjetljive informacije i ne bi se trebala uključivati u kontrolu verzija. Umjesto toga:
1. Dokumentirajte potrebne varijable okruženja
2. Koristite skripte za implementaciju za postavljanje okruženja
3. Koristite Azure Key Vault za osjetljive konfiguracije

### P: Kako nadjačati zadane vrijednosti predloška?
**O**: Postavite varijable okruženja koje odgovaraju parametrima predloška:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Samo varijable koje predložak koristi utječu na implementaciju. `SKU_NAME` gore je primjer prilagođenog unosa, ne univerzalna AZD postavka.

---

## Rješavanje problema

### P: Zašto `azd up` ne uspijeva?
**O**: Uobičajeni uzroci:
1. **Problemi s autentikacijom**: Pokrenite `azd auth login`
2. **Nedostatak dopuštenja**: Provjerite svoje dodjele uloga u Azureu
3. **Konflikti u imenovanju resursa**: Pregledajte sukobljeni resurs i predloške za unos naziva; kreirajte zasebno okruženje s `azd env new` kad je potrebna izolacija
4. **Ograničenja kvota/kapaciteta**: Provjerite regionalnu dostupnost
5. **Pogreške u predlošku**: Validirajte Bicep predloške

### P: Kako otkloniti pogreške u implementaciji?
**O**: 
1. Koristite `azd deploy --debug` za detaljni ispis
2. Provjerite povijest implementacije u Azure portalu
3. Pregledajte Dnevnik aktivnosti u Azure portalu
4. Koristite `azd show` za prikaz trenutnog stanja okruženja

### P: Zašto varijable okruženja ne rade?
**O**: Provjerite:
1. Imena varijabli točno odgovaraju parametrima predloška
2. Vrijednosti su pravilno navedene ako sadrže razmake
3. Izabrano je okruženje: `azd env select <environment>`
4. Varijable su postavljene u ispravnom okruženju

### P: Kako očistiti neuspjele implementacije?
**O**: 
```bash
azd down
```
 Prvo pregledajte odabrano okruženje i potvrdu brisanja. Ovo briše implementirane Azure resurse, a ne lokalnu konfiguraciju okruženja `.azure`. `--purge` dodatno traži trajno brisanje podržanih soft-obrisanih resursa i može biti blokiran politikama zadržavanja/zaštite od brisanja; nije rutinski korak oporavka.

### P: Zašto moja aplikacija nije dostupna nakon implementacije?
**O**: Provjerite:
1. Implementacija je uspješno dovršena
2. Aplikacija radi (provjerite logove u Azure portalu)
3. Mrežne sigurnosne grupe dopuštaju promet
4. DNS/prilagođeni domeni su ispravno konfigurirani

---

## Troškovi i naplata

### P: Koliko će koštati azd implementacije?
**O**: Troškovi ovise o:
- Azure uslugama koje se implementiraju
- Odabranim razinama usluge/SKU-ovima
- Regionalnim razlikama u cijenama
- Obrasci uporabe

Koristite [Azure kalkulator cijena](https://azure.microsoft.com/pricing/calculator/) za procjene.

### P: Kako kontrolirati troškove u azd implementacijama?
**O**: 
1. Koristite SKU-ove niže razine za razvojna okruženja
2. Postavite Azure proračune i upozorenja
3. Koristite `azd down` za uklanjanje resursa kad nisu potrebni
4. Izaberite prikladne regije (troškovi variraju prema lokaciji)
5. Koristite alate za upravljanje troškovima u Azureu

### P: Postoje li opcije besplatnog sloja za azd predloške?
**O**: Neki servisi imaju besplatne SKU-ove ili mjesečne dodijele, ovisno o podobnosti, hosting planu, regiji i ograničenjima pretplate. To ne čini cijeli predložak besplatnim: baze podataka, pretraživanje, umrežavanje, registar, telemetrija i izvođenje modela mogu samostalno izazvati troškove. Provjerite [Azure listu besplatnih servisa](https://azure.microsoft.com/free/) i trenutne cijene za svaki resurs prije implementacije.

### P: Kako procijeniti troškove prije implementacije?
**O**: 
1. Pregledajte `main.bicep` predloška da vidite koji se resursi kreiraju
2. Koristite Azure Kalkulator Cijena sa specifičnim SKU-ovima
3. Prvo implementirajte u razvojno okruženje za praćenje stvarnih troškova
4. Koristite Azure Cost Management za detaljnu analizu troškova

---

## Najbolje prakse

### P: Koje su najbolje prakse za strukturu azd projekta?
**O**: 
1. Držite kod aplikacije odvojeno od infrastrukture
2. Koristite smisleno imenovanje servisa u `azure.yaml`
3. Implementirajte ispravno rukovanje pogreškama u build skriptama
4. Koristite konfiguraciju specifičnu za okruženje
5. Uključite sveobuhvatnu dokumentaciju

### P: Kako organizirati više servisa u azd?
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

### P: Trebam li predati `.azure` mapu u kontrolu verzija?
**O**: **Ne!** `.azure` mapa sadrži osjetljive informacije. Dodajte je u `.gitignore`:
```gitignore
.azure/
```

### P: Kako upravljati tajnama i osjetljivom konfiguracijom?
**O**: 
1. Koristite Azure Key Vault za tajne
2. Referencirajte Key Vault tajne u konfiguraciji aplikacije
3. Nikada ne predajte tajne u kontrolu verzija
4. Koristite upravljane identitete za autentifikaciju između servisa

### P: Koji je preporučeni pristup CI/CD s azd?
**O**: 
1. Koristite odvojena okruženja za svaku fazu (dev/staging/prod)
2. Implementirajte automatizirano testiranje prije implementacije
3. Koristite servisne principe za autentifikaciju
4. Pohranite osjetljivu konfiguraciju u tajne/varijable pipeline-a
5. Implementirajte odobrenja za produkcijske implementacije

---

## Napredne teme

### P: Mogu li proširiti azd s prilagođenom funkcionalnošću?
**O**: Da, kroz deployment hookove u `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### P: Kako integrirati azd s postojećim DevOps procesima?
**O**: 
1. Koristite azd naredbe u postojećim pipeline skriptama
2. Standardizirajte azd predloške među timovima
3. Integrirajte s postojećim praćenjem i upozorenjima
4. Koristite azd JSON izlaz za integraciju pipeline-a

### P: Mogu li koristiti azd s Azure DevOps?
**O**: Da, azd radi s bilo kojim CI/CD sustavom. Kreirajte Azure DevOps pipeline-ove koji koriste azd naredbe.

### P: Kako mogu doprinijeti azd ili kreirati zajedničke predloške?
**O**: 
1. **azd alat**: Doprinosite na [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Predlošci**: Slijedite [Awesome AZD gallery upute za doprinos](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentacija**: Doprinosite dokumentaciji na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: Koji je plan razvoja azd?
**O**: Provjerite [službeni roadmap](https://github.com/Azure/azure-dev/projects) za planirane značajke i poboljšanja.

### P: Kako migrirati s drugih alata za implementaciju na azd?
**O**: 
1. Analizirajte trenutnu arhitekturu implementacije
2. Kreirajte ekvivalentne Bicep predloške
3. Konfigurirajte `azure.yaml` da odgovara trenutnim servisima
4. Temeljito testirajte u razvojnom okruženju
5. Postupno migrirajte okruženja

---

## Još imate pitanja?

### **Prvo pretražite**
- Provjerite [službenu dokumentaciju](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Pretražite [GitHub issues](https://github.com/Azure/azure-dev/issues) za slične probleme

### **Potražite pomoć**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - podrška zajednice
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - tehnička pitanja
- [Azure Discord](https://discord.gg/azure) - chat zajednice u stvarnom vremenu

### **Prijavite probleme**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - prijave bugova i zahtjevi za značajke
- Uključite relevantne zapisnike, poruke o pogreškama i korake za reproduciranje

### **Saznajte više**
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Tehničke smjernice pregledane: 4. studenog 2026. Provjerite dostupnost u oblaku i cijene za vaš pretplatnički plan i regiju.*

---

**Navigacija**
- **Prethodna lekcija**: [Rječnik](glossary.md)
- **Sljedeća lekcija**: [Studijski vodič](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->