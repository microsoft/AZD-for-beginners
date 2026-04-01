# Vaš Prvi Projekt - Praktični Vodič

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD Za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i Brzi početak
- **⬅️ Prethodno**: [Instalacija i Postavljanje](installation.md)
- **➡️ Sljedeće**: [Konfiguracija](configuration.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: AI-prvo razvoja](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Dobrodošli u vaš prvi Azure Developer CLI projekt! Ovaj sveobuhvatni praktični vodič pruža potpuni prolaz kroz kreiranje, implementaciju i upravljanje full-stack aplikacijom na Azureu koristeći azd. Radit ćete s pravom todo aplikacijom koja uključuje React frontend, Node.js API backend i MongoDB bazu podataka.

## Ciljevi učenja

Nakon dovršetka ovog vodiča moći ćete:
- Ovladati procesom inicijalizacije azd projekta korištenjem predložaka
- Razumjeti strukturu azd projekta i konfiguracijske datoteke
- Izvršiti potpunu implementaciju aplikacije na Azure uz provisioniranje infrastrukture
- Provesti strategije ažuriranja i ponovne implementacije aplikacije
- Upravljati višestrukim okruženjima za razvoj i staging
- Primijeniti prakse čišćenja resursa i upravljanja troškovima

## Ishodi učenja

Po završetku moći ćete:
- Samostalno inicijalizirati i konfigurirati azd projekte iz predložaka
- Efikasno se kretati i mijenjati strukturu azd projekata
- Implementirati full-stack aplikacije na Azure koristeći jedinstvene naredbe
- Riješiti uobičajene probleme s implementacijom i autentikacijom
- Upravljati višestrukim Azure okruženjima za različite faze implementacije
- Provesti kontinuirane tijekove implementacije za ažuriranja aplikacija

## Početak rada

### Popis preduvjeta
- ✅ Instaliran Azure Developer CLI ([Vodič za instalaciju](installation.md))
- ✅ Završena AZD autentikacija s `azd auth login`
- ✅ Git instaliran na vašem sustavu
- ✅ Node.js verzija 16 ili novija (za ovaj vodič)
- ✅ Preporučen Visual Studio Code

Prije nego nastavite, pokrenite validator postavljanja iz korijena repozitorija:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Provjerite svoje postavke
```bash
# Provjerite instalaciju azd
azd version

# Provjerite AZD autentifikaciju
azd auth login --check-status
```

### Provjerite neobaveznu Azure CLI autentikaciju

```bash
az account show
```

### Provjerite verziju Node.js
```bash
node --version
```

## Korak 1: Odaberite i Inicijalizirajte Predložak

Počnimo s popularnim predloškom todo aplikacije koji uključuje React frontend i Node.js API backend.

```bash
# Pregled dostupnih predložaka
azd template list

# Inicijaliziraj predložak aplikacije za zadatke
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Slijedi upute:
# - Unesi ime okoliša: "dev"
# - Odaberi pretplatu (ako ih imaš više)
# - Odaberi regiju: "East US 2" (ili svoju željenu regiju)
```

### Što se upravo dogodilo?
- Preuzeli ste kod predloška u lokalni direktorij
- Kreirali datoteku `azure.yaml` s definiranim uslugama
- Postavili infrastrukturu u direktorij `infra/`
- Kreirali konfiguraciju okruženja

## Korak 2: Istražite Strukturu Projekta

Pogledajmo što je azd napravio za nas:

```bash
# Pogledajte strukturu projekta
tree /f   # Windows
# ili
find . -type f | head -20   # macOS/Linux
```

Trebali biste vidjeti:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Ključne datoteke za razumjeti

**azure.yaml** - Srce vašeg azd projekta:
```bash
# Pogledajte konfiguraciju projekta
cat azure.yaml
```

**infra/main.bicep** - Definicija infrastrukture:
```bash
# Pregledajte infrastrukturalni kod
head -30 infra/main.bicep
```

## Korak 3: Prilagodite Svoj Projekt (Opcionalno)

Prije implementacije, možete prilagoditi aplikaciju:

### Izmijenite Frontend
```bash
# Otvorite React aplikacijsku komponentu
code src/web/src/App.tsx
```

Napravite jednostavnu promjenu:
```typescript
// Pronađi naslov i promijeni ga
<h1>My Awesome Todo App</h1>
```

### Konfigurirajte Varijable Okruženja
```bash
# Postavite prilagođene varijable okoline
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Pogledajte sve varijable okoline
azd env get-values
```

## Korak 4: Implementirajte na Azure

Sada slijedi uzbudljivi dio - implementirajte sve na Azure!

```bash
# Postavite infrastrukturu i aplikaciju
azd up

# Ova naredba će:
# 1. Nabaviti Azure resurse (App Service, Cosmos DB, itd.)
# 2. Izgraditi vašu aplikaciju
# 3. Postaviti na nabavljene resurse
# 4. Prikazati URL aplikacije
```

### Što se događa tijekom implementacije?

Naredba `azd up` izvršava sljedeće korake:
1. **Provisioniranje** (`azd provision`) - Kreira Azure resurse
2. **Paketiranje** - Gradi vaš kod aplikacije
3. **Implementacija** (`azd deploy`) - Implementira kod na Azure resurse

### Očekivani ispis
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Korak 5: Testirajte Svoju Aplikaciju

### Pristupite Svoj Aplikaciji
Kliknite na URL naveden u ispisu implementacije, ili ga dobijte u bilo kojem trenutku:
```bash
# Dohvati krajnje točke aplikacije
azd show

# Otvorite aplikaciju u svom pregledniku
azd show --output json | jq -r '.services.web.endpoint'
```

### Testirajte Todo Aplikaciju
1. **Dodajte stavku** - Kliknite "Add Todo" i unesite zadatak
2. **Označite kao dovršeno** - Označite dovršene stavke
3. **Izbrišite stavke** - Uklonite zadatke koje više ne trebate

### Pratite Aplikaciju
```bash
# Otvorite Azure portal za vaše resurse
azd monitor

# Prikaži zapisnike aplikacije
azd monitor --logs

# Prikaži trenutne metrike uživo
azd monitor --live
```

## Korak 6: Napravite Promjene i Ponovno Implementirajte

Napravimo promjenu i vidimo koliko je lako ažurirati:

### Izmijenite API
```bash
# Uredi API kod
code src/api/src/routes/lists.js
```

Dodajte prilagođeni odgovor zaglavlja:
```javascript
// Pronađite rukovatelja rute i dodajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementirajte Samo Promjene Koda
```bash
# Postavite samo kod aplikacije (preskočite infrastrukturu)
azd deploy

# Ovo je mnogo brže od 'azd up' jer infrastruktura već postoji
```

## Korak 7: Upravljajte Višestrukim Okruženjima

Kreirajte staging okruženje za testiranje promjena prije produkcije:

```bash
# Kreiraj novo testno okruženje
azd env new staging

# Postavi na testno okruženje
azd up

# Vrati se na razvojno okruženje
azd env select dev

# Navedite sva okruženja
azd env list
```

### Usporedba Okruženja
```bash
# Pregled razvojno okruženje
azd env select dev
azd show

# Pregled postavljanje okruženje
azd env select staging
azd show
```

## Korak 8: Očistite Resurse

Kad završite s eksperimentiranjem, očistite resurse da biste izbjegli daljnje troškove:

```bash
# Izbriši sve Azure resurse za trenutni okoliš
azd down

# Primoraj brisanje bez potvrde i očisti privremeno izbrisane resurse
azd down --force --purge

# Izbriši određeni okoliš
azd env select staging
azd down --force --purge
```

## Klasična Aplikacija vs. AI-Pokretana Aplikacija: Isti Tijek Rada

Upravo ste implementirali tradicionalnu web aplikaciju. Ali što ako želite implementirati AI-pokretanu aplikaciju - recimo chat aplikaciju podržanu Microsoft Foundry modelima?

Dobra vijest: **tijek rada je identičan.**

| Korak | Klasična Todo Aplikacija | AI Chat Aplikacija |
|------|-----------------|-------------|
| Inicijalizacija | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentikacija | `azd auth login` | `azd auth login` |
| Implementacija | `azd up` | `azd up` |
| Praćenje | `azd monitor` | `azd monitor` |
| Čišćenje | `azd down --force --purge` | `azd down --force --purge` |

Jedina razlika je **predložak** od kojeg počinjete. AI predložak uključuje dodatnu infrastrukturu (poput Microsoft Foundry Models resursa ili AI Search indeksa), ali azd sve to upravlja za vas. Ne trebate učiti nove naredbe, koristiti drugačiji alat niti mijenjati način razmišljanja o implementaciji.

Ovo je osnovni princip azd-a: **jedan tijek rada, bilo koji workload.** Vještine koje ste prakticirali u ovom vodiču — inicijalizacija, implementacija, praćenje, ponovna implementacija i čišćenje — jednako se primjenjuju na AI aplikacije i agente.

---

## Što ste naučili

Čestitamo! Uspješno ste:
- ✅ Inicijalizirali azd projekt iz predloška
- ✅ Istražili strukturu projekta i ključne datoteke
- ✅ Implementirali full-stack aplikaciju na Azure
- ✅ Napravili izmjene koda i ponovno ih implementirali
- ✅ Upravljali višestrukim okruženjima
- ✅ Očistili resurse

## 🎯 Vježbe za potvrdu vještina

### Vježba 1: Implementirajte Drugi Predložak (15 minuta)
**Cilj**: Demonstrirati ovladavanje azd init i procesom implementacije

```bash
# Isprobajte Python + MongoDB paket
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Provjerite implementaciju
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Očistite
azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Aplikacija se implementira bez grešaka
- [ ] Moguće je pristupiti URL-u aplikacije u pregledniku
- [ ] Aplikacija funkcionalno radi (dodavanje/brisanje zadataka)
- [ ] Uspješno očišćeni svi resursi

### Vježba 2: Prilagodite Konfiguraciju (20 minuta)
**Cilj**: Prakticirati konfiguraciju varijabli okruženja

```bash
cd my-first-azd-app

# Kreiraj prilagođeno okruženje
azd env new custom-config

# Postavi prilagođene varijable
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Provjeri varijable
azd env get-values | grep APP_TITLE

# Pokreni s prilagođenom konfiguracijom
azd up
```

**Kriteriji uspjeha:**
- [ ] Uspješno kreirano prilagođeno okruženje
- [ ] Varijable okruženja postavljene i dohvatljive
- [ ] Aplikacija implementirana s prilagođenom konfiguracijom
- [ ] Moguće je provjeriti prilagođene postavke u implementiranoj aplikaciji

### Vježba 3: Višestruki Okruzni Tijek Rada (25 minuta)
**Cilj**: Ovladati upravljanjem okruženjima i strategijama implementacije

```bash
# Kreiraj razvojno okruženje
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Zabilježi URL za razvoj
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Kreiraj testno okruženje
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Zabilježi URL za testiranje
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Usporedi okruženja
azd env list

# Testiraj oba okruženja
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Očisti oba
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Kreirana su dva okruženja s različitim konfiguracijama
- [ ] Oba okruženja su uspješno implementirana
- [ ] Moguće je prebacivati se između okruženja koristeći `azd env select`
- [ ] Varijable okruženja razlikuju se između okruženja
- [ ] Uspješno očišćena oba okruženja

## 📊 Vaš Napredak

**Uloženo Vrijeme**: ~60-90 minuta  
**Stečene Vještine**:
- ✅ Inicijalizacija projekta temeljenog na predlošcima
- ✅ Provisioniranje Azure resursa
- ✅ Tijekovi implementacije aplikacija
- ✅ Upravljanje okruženjima
- ✅ Upravljanje konfiguracijom
- ✅ Čišćenje resursa i upravljanje troškovima

**Sljedeći Korak**: Spremni ste za [Vodič za Konfiguraciju](configuration.md) kako biste naučili napredne obrasce konfiguracije!

## Rješavanje Čestih Problema

### Greške pri autentikaciji
```bash
# Ponovno se autentificirajte s Azureom
az login

# Provjerite pristup pretplati
az account show
```

### Neuspjele implementacije
```bash
# Omogući zapisivanje za otklanjanje pogrešaka
export AZD_DEBUG=true
azd up --debug

# Pregledajte zapisnike aplikacije u Azuru
azd monitor --logs

# Za Container Apps koristite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Sukobi imena resursa
```bash
# Koristite jedinstveno ime okruženja
azd env new dev-$(whoami)-$(date +%s)
```

### Problemi s portom/mrežom
```bash
# Provjerite jesu li portovi dostupni
netstat -an | grep :3000
netstat -an | grep :3100
```

## Sljedeći koraci

Sada kada ste dovršili svoj prvi projekt, istražite ove napredne teme:

### 1. Prilagodite infrastrukturu
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Dodajte baze podataka, spremišta i druge usluge](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Postavite CI/CD
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) - Potpuni tijekovi CI/CD
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracija pipelina

### 3. Najbolje prakse za produkciju
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) - Sigurnost, performanse i nadzor

### 4. Istražite više predložaka
```bash
# Pregledajte predloške po kategoriji
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Isprobajte različite tehnološke komplektacije
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatni resursi

### Materijali za učenje
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Zajednica i podrška
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predlošci i primjeri
- [Službena galerija predložaka](https://azure.github.io/awesome-azd/)
- [Zajednički predlošci](https://github.com/Azure-Samples/azd-templates)
- [Enterprise obrasci](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Čestitamo na dovršetku vašeg prvog azd projekta!** Sada ste spremni graditi i implementirati izvrsne aplikacije na Azureu s povjerenjem.

---

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD Za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i Brzi početak
- **⬅️ Prethodno**: [Instalacija i Postavljanje](installation.md)
- **➡️ Sljedeće**: [Konfiguracija](configuration.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: AI-prvo razvoja](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Sljedeća lekcija**: [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o odricanju odgovornosti**:
Ovaj dokument je preveden korištenjem AI prevodilačke usluge [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatizirani prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovu izvornom jeziku treba se smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne odgovaramo za bilo kakve nesporazume ili pogrešne interpretacije proizašle iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->