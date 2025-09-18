<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a82d27b84022e9b7c7a163f99fa1fd25",
  "translation_date": "2025-09-18T12:09:48+00:00",
  "source_file": "resources/faq.md",
  "language_code": "hr"
}
-->
# Često postavljana pitanja (FAQ)

**Pomoć po poglavlju**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **🚆 Problemi s instalacijom**: [Poglavlje 1: Instalacija i postavljanje](../docs/getting-started/installation.md)
- **🤖 Pitanja o AI-u**: [Poglavlje 2: Razvoj temeljen na AI-u](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Rješavanje problema**: [Poglavlje 7: Rješavanje problema i ispravljanje grešaka](../docs/troubleshooting/common-issues.md)

## Uvod

Ovaj sveobuhvatni FAQ pruža odgovore na najčešća pitanja o Azure Developer CLI (azd) i implementacijama na Azureu. Pronađite brza rješenja za uobičajene probleme, razumite najbolje prakse i razjasnite koncepte i radne procese azd-a.

## Ciljevi učenja

Pregledom ovog FAQ-a, moći ćete:
- Pronaći brze odgovore na uobičajena pitanja i probleme vezane uz Azure Developer CLI
- Razumjeti ključne koncepte i terminologiju kroz praktičan format pitanja i odgovora
- Pristupiti rješenjima za rješavanje čestih problema i scenarija s greškama
- Naučiti najbolje prakse kroz često postavljana pitanja o optimizaciji
- Otkriti napredne značajke i mogućnosti kroz pitanja na stručnoj razini
- Učinkovito se referirati na smjernice o troškovima, sigurnosti i strategijama implementacije

## Ishodi učenja

Redovitim korištenjem ovog FAQ-a, moći ćete:
- Samostalno rješavati uobičajene probleme s Azure Developer CLI koristeći ponuđena rješenja
- Donositi informirane odluke o strategijama i konfiguracijama implementacije
- Razumjeti odnos između azd-a i drugih Azure alata i usluga
- Primijeniti najbolje prakse temeljene na iskustvima zajednice i preporukama stručnjaka
- Učinkovito rješavati probleme s autentifikacijom, implementacijom i konfiguracijom
- Optimizirati troškove i performanse koristeći uvide i preporuke iz FAQ-a

## Sadržaj

- [Početak rada](../../../resources)
- [Autentifikacija i pristup](../../../resources)
- [Predlošci i projekti](../../../resources)
- [Implementacija i infrastruktura](../../../resources)
- [Konfiguracija i okruženja](../../../resources)
- [Rješavanje problema](../../../resources)
- [Troškovi i naplata](../../../resources)
- [Najbolje prakse](../../../resources)
- [Napredne teme](../../../resources)

---

## Početak rada

### P: Što je Azure Developer CLI (azd)?
**O**: Azure Developer CLI (azd) je alat naredbenog retka usmjeren na programere koji ubrzava proces prijenosa vaše aplikacije iz lokalnog razvojnog okruženja na Azure. Pruža najbolje prakse putem predložaka i pomaže u cijelom životnom ciklusu implementacije.

### P: Po čemu se azd razlikuje od Azure CLI-ja?
**O**: 
- **Azure CLI**: Alat opće namjene za upravljanje Azure resursima
- **azd**: Alat usmjeren na programere za radne procese implementacije aplikacija
- azd koristi Azure CLI interno, ali pruža apstrakcije višeg nivoa za uobičajene razvojne scenarije
- azd uključuje predloške, upravljanje okruženjima i automatizaciju implementacije

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
3. Stvoriti prilagođene predloške temeljene na vašoj postojećoj arhitekturi

---

## Autentifikacija i pristup

### P: Kako se autentificirati s Azureom koristeći azd?
**O**: Koristite `azd auth login`, što će otvoriti prozor preglednika za autentifikaciju na Azureu. Za CI/CD scenarije koristite servisne principe ili upravljane identitete.

### P: Mogu li koristiti azd s više Azure pretplata?
**O**: Da. Koristite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` za određivanje pretplate za svako okruženje.

### P: Koje su mi dozvole potrebne za implementaciju s azd-om?
**O**: Obično su potrebne:
- Uloga **Contributor** na grupi resursa ili pretplati
- **User Access Administrator** ako implementirate resurse koji zahtijevaju dodjelu uloga
- Specifične dozvole ovise o predlošku i resursima koji se implementiraju

### P: Mogu li koristiti azd u CI/CD cjevovodima?
**O**: Apsolutno! azd je dizajniran za integraciju s CI/CD. Koristite servisne principe za autentifikaciju i postavite varijable okruženja za konfiguraciju.

### P: Kako upravljati autentifikacijom u GitHub Actions?
**O**: Koristite Azure Login akciju sa servisnim principima:
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
- Predlošci zajednice: GitHub pretraga za "azd-template"
- Koristite `azd template list` za pregled dostupnih predložaka

### P: Kako stvoriti prilagođeni predložak?
**O**: 
1. Počnite s postojećom strukturom predloška
2. Izmijenite `azure.yaml`, infrastrukturne datoteke i kod aplikacije
3. Temeljito testirajte s `azd up`
4. Objavite na GitHubu s odgovarajućim oznakama

### P: Mogu li koristiti azd bez predloška?
**O**: Da, koristite `azd init` u postojećem projektu za stvaranje potrebnih konfiguracijskih datoteka. Ručno ćete morati konfigurirati `azure.yaml` i infrastrukturne datoteke.

### P: Koja je razlika između službenih i predložaka zajednice?
**O**: 
- **Službeni predlošci**: Održava Microsoft, redovito ažurirani, s opsežnom dokumentacijom
- **Predlošci zajednice**: Kreirani od strane programera, mogu imati specijalizirane slučajeve upotrebe, različite kvalitete i održavanja

### P: Kako ažurirati predložak u svom projektu?
**O**: Predlošci se ne ažuriraju automatski. Možete:
1. Ručno usporediti i spojiti promjene iz izvornog predloška
2. Početi ispočetka s `azd init` koristeći ažurirani predložak
3. Selektivno preuzeti specifična poboljšanja iz ažuriranih predložaka

---

## Implementacija i infrastruktura

### P: Koje Azure usluge azd može implementirati?
**O**: azd može implementirati bilo koju Azure uslugu putem Bicep/ARM predložaka, uključujući:
- App Services, Container Apps, Functions
- Baze podataka (SQL, PostgreSQL, Cosmos DB)
- Pohranu, Key Vault, Application Insights
- Mrežne, sigurnosne i nadzorne resurse

### P: Mogu li implementirati u više regija?
**O**: Da, konfigurirajte više regija u svojim Bicep predlošcima i postavite parametar lokacije za svako okruženje.

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
**O**: Ovo je složeno i nije izravno podržano. Možete:
1. Uvesti postojeće resurse u svoje Bicep predloške
2. Koristiti reference postojećih resursa u predlošcima
3. Izmijeniti predloške kako bi uvjetno stvarali ili referencirali resurse

### P: Mogu li koristiti Terraform umjesto Bicepa?
**O**: Trenutno azd primarno podržava Bicep/ARM predloške. Terraform podrška nije službeno dostupna, iako mogu postojati rješenja zajednice.

---

## Konfiguracija i okruženja

### P: Kako upravljati različitim okruženjima (dev, staging, prod)?
**O**: Stvorite zasebna okruženja s `azd env new <environment-name>` i konfigurirajte različite postavke za svako:
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

### P: Mogu li dijeliti konfiguracije okruženja s članovima tima?
**O**: `.azure` mapa sadrži osjetljive informacije i ne bi trebala biti uključena u verzioniranje. Umjesto toga:
1. Dokumentirajte potrebne varijable okruženja
2. Koristite skripte za postavljanje okruženja
3. Koristite Azure Key Vault za osjetljive konfiguracije

### P: Kako nadjačati zadane postavke predloška?
**O**: Postavite varijable okruženja koje odgovaraju parametrima predloška:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Rješavanje problema

### P: Zašto `azd up` ne uspijeva?
**O**: Uobičajeni uzroci:
1. **Problemi s autentifikacijom**: Pokrenite `azd auth login`
2. **Nedovoljne dozvole**: Provjerite svoje Azure uloge
3. **Sukobi u imenovanju resursa**: Promijenite AZURE_ENV_NAME
4. **Problemi s kvotama/kapacitetom**: Provjerite dostupnost u regiji
5. **Pogreške u predlošku**: Validirajte Bicep predloške

### P: Kako otkloniti greške u implementaciji?
**O**: 
1. Koristite `azd deploy --debug` za detaljan ispis
2. Provjerite povijest implementacije u Azure portalu
3. Pregledajte Dnevnik aktivnosti u Azure portalu
4. Koristite `azd show` za prikaz trenutnog stanja okruženja

### P: Zašto moje varijable okruženja ne rade?
**O**: Provjerite:
1. Imena varijabli točno odgovaraju parametrima predloška
2. Vrijednosti su ispravno navedene ako sadrže razmake
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
2. Aplikacija radi (provjerite zapisnike u Azure portalu)
3. Mrežne sigurnosne grupe dopuštaju promet
4. DNS/prilagođene domene su ispravno konfigurirane

---

## Troškovi i naplata

### P: Koliko će koštati azd implementacije?
**O**: Troškovi ovise o:
- Azure uslugama koje se implementiraju
- Razinama usluga/SKU-ovima koji su odabrani
- Regionalnim razlikama u cijenama
- Obrasci korištenja

Koristite [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) za procjene.

### P: Kako kontrolirati troškove u azd implementacijama?
**O**: 
1. Koristite niže SKU-ove za razvojna okruženja
2. Postavite Azure proračune i upozorenja
3. Koristite `azd down` za uklanjanje resursa kada nisu potrebni
4. Odaberite odgovarajuće regije (troškovi variraju po lokaciji)
5. Koristite alate za upravljanje troškovima na Azureu

### P: Postoje li besplatne opcije za azd predloške?
**O**: Mnoge Azure usluge nude besplatne razine:
- App Service: Dostupna besplatna razina
- Azure Functions: 1M besplatnih izvršenja mjesečno
- Cosmos DB: Besplatna razina s 400 RU/s
- Application Insights: Prvih 5GB/mjesečno besplatno

Konfigurirajte predloške za korištenje besplatnih razina gdje je to moguće.

### P: Kako procijeniti troškove prije implementacije?
**O**: 
1. Pregledajte `main.bicep` predloška kako biste vidjeli koji se resursi stvaraju
2. Koristite Azure Pricing Calculator s određenim SKU-ovima
3. Implementirajte u razvojno okruženje prvo kako biste pratili stvarne troškove
4. Koristite Azure Cost Management za detaljnu analizu troškova

---

## Najbolje prakse

### P: Koje su najbolje prakse za strukturu azd projekata?
**O**: 
1. Držite kod aplikacije odvojen od infrastrukture
2. Koristite smislena imena usluga u `azure.yaml`
3. Implementirajte pravilno rukovanje greškama u skriptama za izgradnju
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

### P: Trebam li uključiti `.azure` mapu u verzioniranje?
**O**: **Ne!** `.azure` mapa sadrži osjetljive informacije. Dodajte je u `.gitignore`:
```gitignore
.azure/
```

### P: Kako upravljati tajnama i osjetljivom konfiguracijom?
**O**: 
1. Koristite Azure Key Vault za tajne
2. Referencirajte tajne iz Key Vaulta u konfiguraciji aplikacije
3. Nikada ne uključujte tajne u verzioniranje
4. Koristite upravljane identitete za autentifikaciju između usluga

### P: Koji je preporučeni pristup za CI/CD s azd-om?
**O**: 
1. Koristite zasebna okruženja za svaku fazu (dev/staging/prod)
2. Implementirajte automatizirano testiranje prije implementacije
3. Koristite servisne principe za autentifikaciju
4. Pohranite osjetljive konfiguracije u tajne/varijable cjevovoda
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
1. Koristite azd naredbe u postojećim skriptama cjevovoda
2. Standardizirajte azd predloške unutar timova
3. Integrirajte s postojećim alatima za nadzor i upozorenja
4. Koristite JSON izlaz azd-a za integraciju u cjevovode

### P: Mogu li koristiti azd s Azure DevOpsom?
**O**: Da, azd radi s bilo kojim CI/CD sustavom. Kreirajte Azure DevOps cjevovode koji koriste azd naredbe.

### P: Kako doprinijeti azd-u ili stvoriti predloške zajednice?
**O**: 
1. **azd alat**:
2. **Predlošci**: Izradite predloške slijedeći [smjernice za predloške](https://github.com/Azure-Samples/awesome-azd)  
3. **Dokumentacija**: Doprinesite dokumentaciji na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### P: Koji je plan razvoja za azd?  
**O**: Pogledajte [službeni plan razvoja](https://github.com/Azure/azure-dev/projects) za planirane značajke i poboljšanja.  

### P: Kako mogu migrirati s drugih alata za implementaciju na azd?  
**O**:  
1. Analizirajte trenutnu arhitekturu implementacije  
2. Izradite odgovarajuće Bicep predloške  
3. Konfigurirajte `azure.yaml` da odgovara trenutnim uslugama  
4. Temeljito testirajte u razvojnom okruženju  
5. Postupno migrirajte okruženja  

---

## Imate još pitanja?  

### **Prvo pretražite**  
- Provjerite [službenu dokumentaciju](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Pretražite [GitHub issues](https://github.com/Azure/azure-dev/issues) za slične probleme  

### **Zatražite pomoć**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Podrška zajednice  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tehnička pitanja  
- [Azure Discord](https://discord.gg/azure) - Chat zajednice u stvarnom vremenu  

### **Prijavite probleme**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Prijava grešaka i zahtjeva za značajke  
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
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za bilo kakve nesporazume ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.