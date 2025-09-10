<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-10T07:33:35+00:00",
  "source_file": "resources/faq.md",
  "language_code": "hr"
}
-->
# Često postavljana pitanja (FAQ)

## Uvod

Ovaj sveobuhvatni FAQ pruža odgovore na najčešća pitanja o Azure Developer CLI (azd) i Azure implementacijama. Pronađite brza rješenja za uobičajene probleme, razumite najbolje prakse i dobijte pojašnjenja o konceptima i radnim procesima azd-a.

## Ciljevi učenja

Pregledom ovog FAQ-a, moći ćete:
- Pronaći brze odgovore na uobičajena pitanja i probleme vezane uz Azure Developer CLI
- Razumjeti ključne koncepte i terminologiju kroz praktičan format pitanja i odgovora
- Pristupiti rješenjima za otklanjanje problema i scenarije grešaka
- Naučiti najbolje prakse kroz često postavljana pitanja o optimizaciji
- Otkriti napredne značajke i mogućnosti kroz pitanja na ekspertskoj razini
- Efikasno se referirati na smjernice o troškovima, sigurnosti i strategijama implementacije

## Ishodi učenja

Redovitim korištenjem ovog FAQ-a, moći ćete:
- Samostalno rješavati uobičajene probleme s Azure Developer CLI koristeći ponuđena rješenja
- Donositi informirane odluke o strategijama i konfiguracijama implementacije
- Razumjeti odnos između azd-a i drugih Azure alata i usluga
- Primijeniti najbolje prakse temeljene na iskustvima zajednice i preporukama stručnjaka
- Učinkovito otklanjati probleme s autentifikacijom, implementacijom i konfiguracijom
- Optimizirati troškove i performanse koristeći uvide i preporuke iz FAQ-a

## Sadržaj

- [Početak rada](../../../resources)
- [Autentifikacija i pristup](../../../resources)
- [Predlošci i projekti](../../../resources)
- [Implementacija i infrastruktura](../../../resources)
- [Konfiguracija i okruženja](../../../resources)
- [Otklanjanje problema](../../../resources)
- [Troškovi i naplata](../../../resources)
- [Najbolje prakse](../../../resources)
- [Napredne teme](../../../resources)

---

## Početak rada

### P: Što je Azure Developer CLI (azd)?
**O**: Azure Developer CLI (azd) je alat za naredbeni redak usmjeren na razvoj koji ubrzava vrijeme potrebno za prijenos vaše aplikacije iz lokalnog razvojnog okruženja na Azure. Pruža najbolje prakse putem predložaka i pomaže u cijelom životnom ciklusu implementacije.

### P: Po čemu se azd razlikuje od Azure CLI?
**O**: 
- **Azure CLI**: Alat opće namjene za upravljanje Azure resursima
- **azd**: Alat usmjeren na razvoj za radne procese implementacije aplikacija
- azd koristi Azure CLI interno, ali pruža apstrakcije višeg nivoa za uobičajene scenarije razvoja
- azd uključuje predloške, upravljanje okruženjem i automatizaciju implementacije

### P: Trebam li imati instaliran Azure CLI da bih koristio azd?
**O**: Da, azd zahtijeva Azure CLI za autentifikaciju i neke operacije. Prvo instalirajte Azure CLI, a zatim azd.

### P: Koje programske jezike podržava azd?
**O**: azd je neovisan o jeziku. Radi s:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statičke web stranice
- Aplikacije u kontejnerima

### P: Mogu li koristiti azd s postojećim projektima?
**O**: Da! Možete:
1. Koristiti `azd init` za dodavanje azd konfiguracije postojećim projektima
2. Prilagoditi postojeće projekte kako bi odgovarali strukturi azd predložaka
3. Kreirati prilagođene predloške temeljene na vašoj postojećoj arhitekturi

---

## Autentifikacija i pristup

### P: Kako se autentificirati s Azure koristeći azd?
**O**: Koristite `azd auth login`, što će otvoriti prozor preglednika za autentifikaciju na Azure. Za CI/CD scenarije koristite servisne principe ili upravljane identitete.

### P: Mogu li koristiti azd s više Azure pretplata?
**O**: Da. Koristite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` za određivanje koje pretplate koristiti za svako okruženje.

### P: Koje dozvole trebam za implementaciju s azd?
**O**: Obično trebate:
- **Contributor** ulogu na grupi resursa ili pretplati
- **User Access Administrator** ako implementirate resurse koji zahtijevaju dodjelu uloga
- Specifične dozvole ovise o predlošku i resursima koji se implementiraju

### P: Mogu li koristiti azd u CI/CD pipeline-ima?
**O**: Naravno! azd je dizajniran za integraciju s CI/CD. Koristite servisne principe za autentifikaciju i postavite varijable okruženja za konfiguraciju.

### P: Kako upravljati autentifikacijom u GitHub Actions?
**O**: Koristite Azure Login akciju s vjerodajnicama servisnog principa:
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
- Predlošci zajednice: Pretražite GitHub za "azd-template"
- Koristite `azd template list` za pregled dostupnih predložaka

### P: Kako kreirati prilagođeni predložak?
**O**: 
1. Započnite s postojećom strukturom predloška
2. Izmijenite `azure.yaml`, infrastrukturne datoteke i kod aplikacije
3. Temeljito testirajte s `azd up`
4. Objavite na GitHubu s odgovarajućim oznakama

### P: Mogu li koristiti azd bez predloška?
**O**: Da, koristite `azd init` u postojećem projektu za kreiranje potrebnih konfiguracijskih datoteka. Morat ćete ručno konfigurirati `azure.yaml` i infrastrukturne datoteke.

### P: Koja je razlika između službenih i predložaka zajednice?
**O**: 
- **Službeni predlošci**: Održava Microsoft, redovito ažurirani, opsežna dokumentacija
- **Predlošci zajednice**: Kreiraju ih developeri, mogu imati specijalizirane slučajeve korištenja, različita kvaliteta i održavanje

### P: Kako ažurirati predložak u mom projektu?
**O**: Predlošci se ne ažuriraju automatski. Možete:
1. Ručno usporediti i spojiti promjene iz izvornog predloška
2. Započeti iznova s `azd init` koristeći ažurirani predložak
3. Selektivno preuzeti specifična poboljšanja iz ažuriranih predložaka

---

## Implementacija i infrastruktura

### P: Koje Azure usluge može azd implementirati?
**O**: azd može implementirati bilo koju Azure uslugu putem Bicep/ARM predložaka, uključujući:
- App Services, Container Apps, Functions
- Baze podataka (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Mrežne, sigurnosne i nadzorne resurse

### P: Mogu li implementirati u više regija?
**O**: Da, konfigurirajte više regija u vašim Bicep predlošcima i postavite parametar lokacije odgovarajuće za svako okruženje.

### P: Kako upravljati migracijama sheme baze podataka?
**O**: Koristite deployment hooks u `azure.yaml`:
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
**O**: Ovo je složeno i nije direktno podržano. Možete:
1. Uvesti postojeće resurse u vaše Bicep predloške
2. Koristiti reference postojećih resursa u predlošcima
3. Izmijeniti predloške kako bi uvjetno kreirali ili referencirali resurse

### P: Mogu li koristiti Terraform umjesto Bicep-a?
**O**: Trenutno, azd primarno podržava Bicep/ARM predloške. Terraform podrška nije službeno dostupna, iako mogu postojati rješenja zajednice.

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
**O**: U `.azure` mapi unutar direktorija vašeg projekta. Svako okruženje ima vlastitu mapu s konfiguracijskim datotekama.

### P: Kako postaviti konfiguraciju specifičnu za okruženje?
**O**: Koristite `azd env set` za postavljanje varijabli okruženja:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### P: Mogu li dijeliti konfiguracije okruženja među članovima tima?
**O**: `.azure` mapa sadrži osjetljive informacije i ne bi trebala biti uključena u verzioniranje. Umjesto toga:
1. Dokumentirajte potrebne varijable okruženja
2. Koristite skripte za implementaciju za postavljanje okruženja
3. Koristite Azure Key Vault za osjetljive konfiguracije

### P: Kako nadjačati zadane postavke predloška?
**O**: Postavite varijable okruženja koje odgovaraju parametrima predloška:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Otklanjanje problema

### P: Zašto `azd up` ne uspijeva?
**O**: Uobičajeni uzroci:
1. **Problemi s autentifikacijom**: Pokrenite `azd auth login`
2. **Nedovoljne dozvole**: Provjerite dodjele uloga na Azure
3. **Sukobi u imenovanju resursa**: Promijenite AZURE_ENV_NAME
4. **Problemi s kvotama/kapacitetom**: Provjerite dostupnost u regiji
5. **Greške u predlošku**: Validirajte Bicep predloške

### P: Kako otkloniti greške u implementaciji?
**O**: 
1. Koristite `azd deploy --debug` za detaljan izlaz
2. Provjerite povijest implementacije u Azure portalu
3. Pregledajte Activity Log u Azure portalu
4. Koristite `azd show` za prikaz trenutnog stanja okruženja

### P: Zašto moje varijable okruženja ne rade?
**O**: Provjerite:
1. Imena varijabli točno odgovaraju parametrima predloška
2. Vrijednosti su pravilno citirane ako sadrže razmake
3. Odabrano je ispravno okruženje: `azd env select <environment>`
4. Varijable su postavljene u ispravnom okruženju

### P: Kako očistiti neuspjele implementacije?
**O**: 
```bash
azd down --force --purge
```
Ovo uklanja sve resurse i konfiguraciju okruženja.

### P: Zašto moja aplikacija nije dostupna nakon implementacije?
**O**: Provjerite:
1. Implementacija je uspješno završena
2. Aplikacija radi (provjerite logove u Azure portalu)
3. Mrežne sigurnosne grupe dopuštaju promet
4. DNS/prilagođene domene su ispravno konfigurirane

---

## Troškovi i naplata

### P: Koliko će koštati azd implementacije?
**O**: Troškovi ovise o:
- Azure uslugama koje se implementiraju
- Razinama usluga/SKU-ovima koji se odaberu
- Regionalnim razlikama u cijenama
- Obrascima korištenja

Koristite [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) za procjene.

### P: Kako kontrolirati troškove u azd implementacijama?
**O**: 
1. Koristite niže SKU-ove za razvojna okruženja
2. Postavite Azure budžete i upozorenja
3. Koristite `azd down` za uklanjanje resursa kada nisu potrebni
4. Odaberite odgovarajuće regije (troškovi variraju po lokaciji)
5. Koristite Azure Cost Management alate

### P: Postoje li opcije besplatnog korištenja za azd predloške?
**O**: Mnoge Azure usluge nude besplatne razine:
- App Service: Dostupna besplatna razina
- Azure Functions: 1M besplatnih izvršenja/mjesec
- Cosmos DB: Besplatna razina s 400 RU/s
- Application Insights: Prvih 5GB/mjesec besplatno

Konfigurirajte predloške za korištenje besplatnih razina gdje je dostupno.

### P: Kako procijeniti troškove prije implementacije?
**O**: 
1. Pregledajte `main.bicep` predloška da vidite koji se resursi kreiraju
2. Koristite Azure Pricing Calculator s specifičnim SKU-ovima
3. Prvo implementirajte u razvojno okruženje za praćenje stvarnih troškova
4. Koristite Azure Cost Management za detaljnu analizu troškova

---

## Najbolje prakse

### P: Koje su najbolje prakse za strukturu azd projekta?
**O**: 
1. Držite kod aplikacije odvojen od infrastrukture
2. Koristite smislena imena usluga u `azure.yaml`
3. Implementirajte pravilno rukovanje greškama u skriptama za izgradnju
4. Koristite konfiguraciju specifičnu za okruženje
5. Uključite opsežnu dokumentaciju

### P: Kako organizirati više usluga u azd?
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

### P: Trebam li uključiti `.azure` mapu u verzioniranje?
**O**: **Ne!** `.azure` mapa sadrži osjetljive informacije. Dodajte je u `.gitignore`:
```gitignore
.azure/
```

### P: Kako upravljati tajnama i osjetljivom konfiguracijom?
**O**: 
1. Koristite Azure Key Vault za tajne
2. Referencirajte tajne iz Key Vault-a u konfiguraciji aplikacije
3. Nikada ne uključujte tajne u verzioniranje
4. Koristite upravljane identitete za autentifikaciju između usluga

### P: Koji je preporučeni pristup za CI/CD s azd?
**O**: 
1. Koristite zasebna okruženja za svaku fazu (dev/staging/prod)
2. Implementirajte automatizirano testiranje prije implementacije
3. Koristite servisne principe za autentifikaciju
4. Pohranite osjetljivu konfiguraciju u tajne/varijable pipeline-a
5. Implementirajte odobrenja za implementacije u produkciju

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

### P: Kako integrirati azd s postojećim DevOps procesima?
**O**: 
1. Koristite azd naredbe u postojećim skriptama pipeline-a
2. Standardizirajte azd predloške među timovima
3. Integrirajte s postojećim alatima za nadzor i upozorenja
4. Koristite JSON izlaz azd-a za integraciju pipeline-a

### P: Mogu li koristiti azd s Azure DevOps?
**O**: Da, azd radi s bilo kojim CI/CD sustavom. Kreirajte Azure DevOps pipeline-e koji koriste azd naredbe.

### P: Kako doprinijeti azd-u ili kreirati predloške zajednice?
**O**: 
1. **azd alat**: Doprinijeti na [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Predlošci**: Kreirajte predloške slijedeći [smjernice za predloške](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentacija**: Doprinijeti dokumentaciji na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### P: Koji je plan razvoja za azd?
**O**: Provjerite [službeni plan razvoja](https://github.com/Azure/azure-dev/projects) za planirane značajke i poboljšanja.

### P: Kako migrirati s drugih alata za implementaciju na azd?
**O**:
1. Analizirajte trenutnu arhitekturu implementacije  
2. Kreirajte odgovarajuće Bicep predloške  
3. Konfigurirajte `azure.yaml` kako bi odgovarao trenutnim uslugama  
4. Temeljito testirajte u razvojnom okruženju  
5. Postupno migrirajte okruženja  

---

## Imate li još pitanja?

### **Prvo pretražite**
- Provjerite [službenu dokumentaciju](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Pretražite [GitHub issues](https://github.com/Azure/azure-dev/issues) za slične probleme  

### **Zatražite pomoć**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Podrška zajednice  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tehnička pitanja  
- [Azure Discord](https://discord.gg/azure) - Chat zajednice u stvarnom vremenu  

### **Prijavite probleme**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Prijava grešaka i zahtjeva za značajkama  
- Uključite relevantne logove, poruke o greškama i korake za reprodukciju  

### **Saznajte više**
- [Dokumentacija za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Ovaj FAQ se redovito ažurira. Zadnje ažuriranje: 9. rujna 2025.*

---

**Navigacija**  
- **Prethodna lekcija**: [Pojmovnik](glossary.md)  
- **Sljedeća lekcija**: [Vodič za učenje](study-guide.md)  

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden korištenjem AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati mjerodavnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane stručnjaka. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.