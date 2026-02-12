# Često postavljana pitanja (FAQ)

**Dobijte pomoć po poglavlju**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **🚆 Problemi s instalacijom**: [Poglavlje 1: Instalacija i postavljanje](../docs/getting-started/installation.md)
- **🤖 Pitanja o umjetnoj inteligenciji**: [Poglavlje 2: AI-First razvoj](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Otklanjanje poteškoća**: [Poglavlje 7: Otklanjanje problema i ispravljanje grešaka](../docs/troubleshooting/common-issues.md)

## Uvod

Ovaj opsežni FAQ pruža odgovore na najčešća pitanja o Azure Developer CLI (azd) i Azure implementacijama. Pronađite brza rješenja za uobičajene probleme, razumite najbolje prakse i dobite pojašnjenja o koncepcijama i radnim tokovima azd-a.

## Ciljevi učenja

Pregledom ovog FAQ-a, moći ćete:
- Pronaći brze odgovore na česta pitanja i probleme vezane uz Azure Developer CLI
- Razumjeti ključne koncepte i terminologiju kroz praktični Q&A format
- Pristupiti rješenjima za otklanjanje problema za česte probleme i scenarije pogrešaka
- Naučiti najbolje prakse kroz često postavljana pitanja o optimizaciji
- Otkriti napredne značajke i mogućnosti kroz pitanja na ekspertnoj razini
- Učinkovito referencirati smjernice za troškove, sigurnost i strategiju implementacije

## Ishodi učenja

Uz redovito korištenje ovog FAQ-a, moći ćete:
- Samostalno rješavati uobičajene probleme s Azure Developer CLI koristeći pružena rješenja
- Donositi informirane odluke o strategijama i konfiguracijama implementacije
- Razumjeti odnos između azd-a i ostalih Azure alata i usluga
- Primjenjivati najbolje prakse temeljene na iskustvu zajednice i preporukama stručnjaka
- Učinkovito otklanjati probleme s autentikacijom, implementacijom i konfiguracijom
- Optimizirati troškove i performanse koristeći uvide i preporuke iz FAQ-a

## Sadržaj

- [Početak rada](../../../resources)
- [Autentikacija i pristup](../../../resources)
- [Predlošci i projekti](../../../resources)
- [Implementacija i infrastruktura](../../../resources)
- [Konfiguracija i okruženja](../../../resources)
- [Otklanjanje poteškoća](../../../resources)
- [Troškovi i naplata](../../../resources)
- [Najbolje prakse](../../../resources)
- [Napredne teme](../../../resources)

---

## Početak rada

### P: Što je Azure Developer CLI (azd)?
**O**: Azure Developer CLI (azd) je alat za naredbeni redak usmjeren na developere koji ubrzava vrijeme potrebnog za premještanje vaše aplikacije iz lokalnog razvojno okruženja u Azure. Pruža najbolje prakse kroz predloške i pomaže u cijelom životnom ciklusu implementacije.

### P: Kako se azd razlikuje od Azure CLI?
**O**: 
- **Azure CLI**: Svestrani alat za upravljanje Azure resursima
- **azd**: Alat usmjeren na developere za radne tokove implementacije aplikacija
- azd interno koristi Azure CLI, ali pruža apstrakcije višeg nivoa za uobičajene razvojne scenarije
- azd uključuje predloške, upravljanje okruženjima i automatizaciju implementacije

### P: Trebam li imati instaliran Azure CLI za korištenje azd-a?
**O**: Da, azd zahtijeva Azure CLI za autentikaciju i neke operacije. Najprije instalirajte Azure CLI, a zatim azd.

### P: Koje programske jezike azd podržava?
**O**: azd je neovisan o jeziku. Radi s:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statičnim web stranicama
- Aplikacijama u spremnicima (containerized applications)

### P: Mogu li koristiti azd s postojećim projektima?
**O**: Da! Možete:
1. Koristiti `azd init` za dodavanje azd konfiguracije postojećim projektima
2. Prilagoditi postojeće projekte da odgovaraju strukturi azd predložaka
3. Kreirati prilagođene predloške bazirane na vašoj postojećoj arhitekturi

---

## Autentikacija i pristup

### P: Kako se autentificirati u Azure koristeći azd?
**O**: Koristite `azd auth login` koji će otvoriti preglednik za Azure autentikaciju. Za CI/CD scenarije koristite servisne glavnice (service principals) ili upravljane identitete (managed identities).

### P: Mogu li koristiti azd s više Azure pretplata?
**O**: Da. Koristite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` da navedete koju pretplatu koristiti za svako okruženje.

### P: Koje dozvole trebam za implementaciju koristeći azd?
**O**: Obično su potrebne:
- **Contributor** uloga na grupi resursa ili pretplati
- **User Access Administrator** ako implementirate resurse koji zahtijevaju dodjelu uloga
- Specifične dozvole ovise o predlošku i resursima koji se implementiraju

### P: Mogu li koristiti azd u CI/CD cjevovodima?
**O**: Apsolutno! azd je dizajniran za integraciju u CI/CD. Koristite servisne glavnice za autentikaciju i podesite varijable okruženja za konfiguraciju.

### P: Kako rukovati autentikacijom u GitHub Actions?
**O**: Koristite Azure Login akciju sa servisnim glavnicama:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Predlošci i projekti

### P: Gdje mogu pronaći azd predloške?
**O**: 
- Službeni predlošci: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Zajednički predlošci: GitHub pretraživanje "azd-template"
- Koristite `azd template list` za listu dostupnih predložaka

### P: Kako stvoriti prilagođeni predložak?
**O**: 
1. Započnite s postojećom strukturom predloška
2. Izmijenite `azure.yaml`, infrastrukturalne datoteke i kod aplikacije
3. Temeljito testirajte s `azd up`
4. Objavite na GitHub s odgovarajućim oznakama

### P: Mogu li koristiti azd bez predloška?
**O**: Da, koristite `azd init` u postojećem projektu za kreiranje potrebnih konfiguracijskih datoteka. Morat ćete ručno konfigurirati `azure.yaml` i infrastrukturne datoteke.

### P: Koja je razlika između službenih i zajedničkih predložaka?
**O**: 
- **Službeni predlošci**: Održavaju Microsoft, redovito se ažuriraju, obuhvatna dokumentacija
- **Zajednički predlošci**: Kreirani od developera, mogu imati specijalizirane slučajeve korištenja, kvaliteta i održavanje variraju

### P: Kako ažurirati predložak u mom projektu?
**O**: Predlošci se ne ažuriraju automatski. Možete:
1. Ručno usporediti i spojiti promjene s izvornog predloška
2. Početi iznova s `azd init` koristeći ažurirani predložak
3. Odabrati specifična poboljšanja iz ažuriranih predložaka

---

## Implementacija i infrastruktura

### P: Koje Azure usluge može implementirati azd?
**O**: azd može implementirati bilo koju Azure uslugu putem Bicep/ARM predložaka, uključujući:
- App Services, Container Apps, Functions
- Baze podataka (SQL, PostgreSQL, Cosmos DB)
- Pohranu, Key Vault, Application Insights
- Mrežne, sigurnosne i nadzorne resurse

### P: Mogu li implementirati u više regija?
**O**: Da, konfigurirajte više regija u svojim Bicep predlošcima i pravilno postavite parametar lokacije za svako okruženje.

### P: Kako se nositi s migracijama šeme baze podataka?
**O**: Koristite deployment hookove u `azure.yaml`:
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

### P: Kako implementirati na postojeće Azure resurse?
**O**: To je složeno i nije direktno podržano. Možete:
1. Uvesti postojeće resurse u svoje Bicep predloške
2. Koristiti reference na postojeće resurse u predlošcima
3. Izmijeniti predloške da uvjetno stvaraju ili referenciraju resurse

### P: Mogu li koristiti Terraform umjesto Bicep-a?
**O**: Trenutno azd prvenstveno podržava Bicep/ARM predloške. Podrška za Terraform nije službeno dostupna, iako postoje rješenja u zajednici.

---

## Konfiguracija i okruženja

### P: Kako upravljati različitim okruženjima (dev, staging, prod)?
**O**: Kreirajte zasebna okruženja pomoću `azd env new <naziv-okruženja>` i konfigurirajte različita podešavanja za svako:
```bash
azd env new development
azd env new staging  
azd env new production
```

### P: Gdje se pohranjuju konfiguracije okruženja?
**O**: U `.azure` mapi unutar vašeg direktorija projekta. Svako okruženje ima vlastitu mapu s konfiguracijskim datotekama.

### P: Kako postaviti konfiguracije specifične za okruženje?
**O**: Koristite `azd env set` za konfiguraciju varijabli okruženja:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: Mogu li dijeliti konfiguracije okruženja među članovima tima?
**O**: `.azure` mapa sadrži osjetljive informacije i ne bi se trebala dodavati u verzioniranje. Umjesto toga:
1. Dokumentirajte potrebne varijable okruženja
2. Koristite skripte za implementaciju za postavljanje okruženja
3. Koristite Azure Key Vault za osjetljivu konfiguraciju

### P: Kako nadjačati zadane postavke predložaka?
**O**: Postavite varijable okruženja koje odgovaraju parametrima predloška:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Otklanjanje poteškoća

### P: Zašto `azd up` ne uspijeva?
**O**: Česti uzroci:
1. **Problemi s autentikacijom**: Pokrenite `azd auth login`
2. **Nedostatak dozvola**: Provjerite dodjele uloga u Azure-u
3. **Sukobi u imenima resursa**: Promijenite AZURE_ENV_NAME
4. **Problemi s kvotama/kapacitetom**: Provjerite dostupnost po regijama
5. **Pogreške u predlošku**: Validirajte Bicep predloške

### P: Kako otkloniti pogreške pri implementaciji?
**O**: 
1. Koristite `azd deploy --debug` za detaljan izlaz
2. Provjerite povijest implementacija u Azure portalu
3. Pregledajte zapisnik aktivnosti u Azure portalu
4. Koristite `azd show` za prikaz trenutačnog stanja okruženja

### P: Zašto moje varijable okruženja ne funkcioniraju?
**O**: Provjerite:
1. Da imena varijabli točno odgovaraju parametrima predloška
2. Da su vrijednosti pravilno citirane ako sadrže razmake
3. Da je odabrano odgovarajuće okruženje: `azd env select <okruženje>`
4. Da su varijable postavljene u ispravnom okruženju

### P: Kako očistiti neuspjele implementacije?
**O**: 
```bash
azd down --force --purge
```
Ovo uklanja sve resurse i konfiguracije okruženja.

### P: Zašto moja aplikacija nije dostupna nakon implementacije?
**O**: Provjerite:
1. Je li implementacija uspješno završena
2. Radi li aplikacija (provjerite zapise u Azure portalu)
3. Da mrežne sigurnosne grupe dopuštaju promet
4. Da su DNS/ prilagođene domene pravilno konfigurirane

---

## Troškovi i naplata

### P: Koliko će koštati implementacije azd-om?
**O**: Troškovi ovise o:
- Azure uslugama koje se implementiraju
- Odabranim razinama usluga (SKU)
- Različitostima u cijenama po regijama
- Obrasci korištenja

Koristite [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) za procjene.

### P: Kako kontrolirati troškove kod implementacija azd-om?
**O**: 
1. Koristite SKU-ove nižih razina za razvojna okruženja
2. Postavite Azure budžete i upozorenja
3. Koristite `azd down` za uklanjanje resursa kada nisu potrebni
4. Odaberite prikladne regije (troškovi variraju po lokaciji)
5. Koristite alate za upravljanje troškovima u Azureu

### P: Postoje li besplatne razine za azd predloške?
**O**: Mnoge Azure usluge nude besplatne razine:
- App Service: dostupna besplatna razina
- Azure Functions: 1M besplatnih izvršenja mjesečno
- Cosmos DB: besplatna razina s 400 RU/s
- Application Insights: prvih 5GB mjesečno besplatno

Konfigurirajte predloške da koriste besplatne razine gdje je dostupno.

### P: Kako procijeniti troškove prije implementacije?
**O**: 
1. Pregledajte `main.bicep` predložak da vidite koje se resurse kreiraju
2. Koristite Azure Pricing Calculator sa specifičnim SKU-ovima
3. Prvo implementirajte u razvojno okruženje za praćenje stvarnih troškova
4. Koristite Azure Cost Management za detaljnu analizu troškova

---

## Najbolje prakse

### P: Koje su najbolje prakse za strukturu azd projekta?
**O**: 
1. Držite kod aplikacije odvojen od infrastrukture
2. Koristite smislenim imena servisa u `azure.yaml`
3. Implementirajte ispravno rukovanje greškama u build skriptama
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

### P: Trebam li dodati `.azure` mapu u verzioniranje?
**O**: **Ne!** `.azure` mapa sadrži osjetljive informacije. Dodajte je u `.gitignore`:
```gitignore
.azure/
```

### P: Kako rukovati tajnama i osjetljivom konfiguracijom?
**O**: 
1. Koristite Azure Key Vault za tajne
2. Referencirajte tajne iz Key Vault-a u konfiguraciji aplikacije
3. Nikad ne dodajte tajne u verzioniranje
4. Koristite upravljane identitete za autentikaciju između servisa

### P: Koji je preporučeni pristup za CI/CD s azd-om?
**O**: 
1. Koristite odvojena okruženja za svaku fazu (dev/staging/prod)
2. Implementirajte automatizirane testove prije implementacije
3. Koristite servisne glavnice za autentikaciju
4. Spremite osjetljivu konfiguraciju u tajne/varijable cjevovoda
5. Implementirajte odobrenja za produkcijske implementacije

---

## Napredne teme

### P: Mogu li proširiti azd prilagođenim funkcionalnostima?
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
1. Koristite azd naredbe u postojećim skriptama cjevovoda
2. Standardizirajte azd predloške među timovima
3. Integrirajte s postojećim nadzorom i upozorenjima
4. Koristite azd JSON izlaz za integraciju u cjevovode

### P: Mogu li koristiti azd s Azure DevOps-om?
**O**: Da, azd radi s bilo kojim CI/CD sustavom. Kreirajte Azure DevOps cjevovode koji koriste azd naredbe.

### P: Kako mogu pridonijeti azd-u ili kreirati predloške za zajednicu?
**O**: 
1. **azd alat**: Doprinosite na [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Predlošci**: Izradite predloške prema [smjernicama za predloške](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentacija**: Doprinosite dokumentaciji na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: Koji je plan razvoja za azd?
**O**: Pogledajte [službeni plan razvoja](https://github.com/Azure/azure-dev/projects) za planirane značajke i poboljšanja.

### P: Kako migrirati s drugih alata za implementaciju na azd?
**O**: 
1. Analizirajte trenutnu arhitekturu implementacije
2. Izradite odgovarajuće Bicep predloške
3. Konfigurirajte `azure.yaml` da odgovara trenutačnim uslugama
4. Temeljito testirajte u razvojnom okruženju
5. Postupno migrirajte okruženja

---

## Još imate pitanja?

### **Prvo pretražite**
- Provjerite [službenu dokumentaciju](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Pretražite [GitHub issues](https://github.com/Azure/azure-dev/issues) za slične probleme

### **Dobijte pomoć**
- [GitHub rasprave](https://github.com/Azure/azure-dev/discussions) - Podrška zajednice
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tehnička pitanja
- [Azure Discord](https://discord.gg/azure) - Razgovor u stvarnom vremenu s zajednicom

### **Prijavite probleme**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Prijave bugova i zahtjevi za značajkama
- Uključite relevantne zapise, poruke o grešci i korake za reproduciranje

### **Saznajte više**
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Ovaj FAQ se redovito ažurira. Zadnje ažuriranje: 9. rujna 2025.*

---

**Navigacija**
- **Prethodna lekcija**: [Rječnik](glossary.md)
- **Sljedeća lekcija**: [Vodič za učenje](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument preveden je korištenjem AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako se trudimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporučuje se profesionalni ljudski prijevod. Ne odgovaramo za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->