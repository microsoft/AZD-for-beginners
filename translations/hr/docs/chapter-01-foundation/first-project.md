# Vaš prvi projekt - praktični vodič

**Navigacija poglavljem:**
- **📚 Početak tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brz početak
- **⬅️ Prethodno**: [Instalacija i postavljanje](installation.md)
- **➡️ Sljedeće**: [Konfiguracija](configuration.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: AI-prvo razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Dobrodošli u vaš prvi Azure Developer CLI projekt! Ovaj sveobuhvatni praktični vodič pruža potpuni prolazak kroz izradu, implementaciju i upravljanje full-stack aplikacijom na Azure koristeći azd. Radit ćete s pravom todo aplikacijom koja uključuje React frontend, Node.js API backend i MongoDB bazu podataka.

## Ciljevi učenja

Nakon završetka ovog vodiča, moći ćete:
- Savladati tijek inicijalizacije azd projekta korištenjem predložaka
- Razumjeti strukturu projekta Azure Developer CLI i konfiguracijske datoteke
- Izvršiti potpunu implementaciju aplikacije na Azure zajedno s provisioningom infrastrukture
- Primijeniti strategije ažuriranja aplikacije i ponovne implementacije
- Upravljati više okruženja za razvoj i staging
- Primijeniti postupke čišćenja resursa i upravljanja troškovima

## Ishodi učenja

Nakon završetka ovog vodiča, bit ćete u mogućnosti:
- Samostalno inicijalizirati i konfigurirati azd projekte iz predložaka
- Učinkovito se kretati i mijenjati strukture azd projekata
- Implementirati full-stack aplikacije na Azure jednim naredbama
- Rješavati uobičajene probleme s implementacijom i autentikacijom
- Upravljati višestrukim Azure okruženjima za različite faze implementacije
- Primijeniti kontinuirane tijekove implementacije za ažuriranja aplikacija

## Početak rada

### Popis preduvjeta
- ✅ Instaliran Azure Developer CLI ([Vodič za instalaciju](installation.md))
- ✅ Obavljena AZD autentikacija s `azd auth login`
- ✅ Instaliran Git na vašem sustavu
- ✅ Node.js 16+ (za ovaj vodič)
- ✅ Visual Studio Code (preporučeno)

Prije nastavka, pokrenite validator postavljanja iz korijena repozitorija:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Provjerite svoje postavke
```bash
# Provjerite instalaciju azd
azd version

# Provjerite AZD autentifikaciju
azd auth login --check-status
```

### Provjerite opcionalnu Azure CLI autentikaciju

```bash
az account show
```

### Provjerite verziju Node.js
```bash
node --version
```

## Korak 1: Odaberite i inicijalizirajte predložak

Počnimo s popularnim predloškom todo aplikacije koji uključuje React frontend i Node.js API backend.

```bash
# Pregledaj dostupne predloške
azd template list

# Inicijaliziraj predložak todo aplikacije
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Slijedi upute:
# - Unesi naziv okruženja: "dev"
# - Odaberi pretplatu (ako ih imaš više)
# - Odaberi regiju: "East US 2" (ili svoju željenu regiju)
```

### Što se upravo dogodilo?
- Preuzeli ste kôd predloška u lokalni direktorij
- Kreirali datoteku `azure.yaml` sa definicijama servisa
- Postavili kôd infrastrukture u direktoriju `infra/`
- Kreirali konfiguraciju okruženja

## Korak 2: Istražite strukturu projekta

Pogledajmo što je azd kreirao za nas:

```bash
# Pogledaj strukturu projekta
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

### Ključne datoteke koje treba razumjeti

**azure.yaml** - Srce vašeg azd projekta:
```bash
# Pregledajte konfiguraciju projekta
cat azure.yaml
```

**infra/main.bicep** - Definicija infrastrukture:
```bash
# Pogledajte kod infrastrukture
head -30 infra/main.bicep
```

## Korak 3: Prilagodite svoj projekt (po izboru)

Prije implementacije, možete prilagoditi aplikaciju:

### Izmijenite frontend
```bash
# Otvorite React app komponentu
code src/web/src/App.tsx
```

Napravite jednostavnu promjenu:
```typescript
// Pronađi naslov i promijeni ga
<h1>My Awesome Todo App</h1>
```

### Konfigurirajte varijable okruženja
```bash
# Postavi prilagođene varijable okoline
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Prikaži sve varijable okoline
azd env get-values
```

## Korak 4: Implementirajte na Azure

Sada slijedi najuzbudljiviji dio - implementacija svega na Azure!

```bash
# Postavi infrastrukturu i aplikaciju
azd up

# Ova naredba će:
# 1. Osigurati Azure resurse (App Service, Cosmos DB, itd.)
# 2. Izgraditi vašu aplikaciju
# 3. Implementirati na osigurane resurse
# 4. Prikazati URL aplikacije
```

### Što se događa tijekom implementacije?

Naredba `azd up` izvodi sljedeće korake:
1. **Provision** (`azd provision`) - Kreira Azure resurse
2. **Package** - Izgrađuje kôd vaše aplikacije
3. **Deploy** (`azd deploy`) - Implementira kôd na Azure resurse

### Očekivani izlaz
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Korak 5: Testirajte svoju aplikaciju

### Pristupite svojoj aplikaciji
Kliknite na URL prikazan u izlazu implementacije, ili ga dohvati bilo kada:
```bash
# Dohvati krajnje točke aplikacije
azd show

# Otvori aplikaciju u svom pregledniku
azd show --output json | jq -r '.services.web.endpoint'
```

### Testirajte Todo aplikaciju
1. **Dodajte stavku todo liste** - Kliknite „Add Todo“ i upišite zadatak
2. **Označite kao dovršeno** - Označite dovršene stavke
3. **Izbrišite stavke** - Uklonite zadatke koje više ne trebate

### Pratite svoju aplikaciju
```bash
# Otvorite Azure portal za vaše resurse
azd monitor

# Pogledajte zapise aplikacije
azd monitor --logs

# Pogledajte metrike u stvarnom vremenu
azd monitor --live
```

### ✅ Provjerite svoju implementaciju

Prije nego što nastavite, prođite ovaj brz popis da potvrdite da sve zaista radi — nemojte pretpostavljati da "implementacija je uspjela" znači "aplikacija radi":

```bash
# 1. Potvrdite da krajnja točka postoji i da je dostupna
azd show

# 2. Izvedite osnovni test krajnje točke (očekuje se HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Provjerite health endpoint ako ga vaša aplikacija izlaže
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Implementacija je potvrđena kada:**
- ✅ `azd show` prikazuje dostupnu endpoint URL adresu
- ✅ URL se otvara u pregledniku bez grešaka
- ✅ Glavne funkcionalnosti rade (dodavanje/ dovršavanje/ brisanje todo stavke)
- ✅ `azd monitor --logs` pokazuje dolazne zahtjeve bez neočekivanih grešaka

Ako nešto ne uspije, skočite na [Poglavlje 7: Rješavanje problema](../chapter-07-troubleshooting/README.md).

## Korak 6: Napravite promjene i ponovno implementirajte

Napravimo promjenu i vidite koliko je lako ažurirati:

### Izmijenite API
```bash
# Uredi API kod
code src/api/src/routes/lists.js
```

Dodajte prilagođeni odgovor u zaglavlju:
```javascript
// Pronađite rukovatelja rute i dodajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementirajte samo promjene u kôdu
```bash
# Postavite samo kod aplikacije (preskočite infrastrukturu)
azd deploy

# Ovo je mnogo brže od 'azd up' jer infrastruktura već postoji
```

## Korak 7: Upravljajte višestrukim okruženjima

Kreirajte staging okruženje za testiranje promjena prije produkcije:

```bash
# Kreiraj novo staging okruženje
azd env new staging

# Implementiraj na staging
azd up

# Vratite se na razvojno okruženje
azd env select dev

# Navedite sva okruženja
azd env list
```

### Usporedba okruženja
```bash
# Pogledaj razvojno okruženje
azd env select dev
azd show

# Pogledaj pristupno okruženje
azd env select staging
azd show
```

## Korak 8: Očistite resurse

Kad završite s eksperimentiranjem, očistite resurse da ne bi dalje naplaćivali:

```bash
# Izbriši sve Azure resurse za trenutačno okruženje
azd down

# Prisilno brisanje bez potvrde i uklanjanje privremeno obrisanih resursa
azd down --force --purge

# Izbriši određeno okruženje
azd env select staging
azd down --force --purge
```

## Klasična aplikacija vs. AI-pokretana aplikacija: isti tijek rada

Upravo ste implementirali tradicionalnu web aplikaciju. Ali što ako želite implementirati AI-pokretanu aplikaciju — recimo chat aplikaciju podržanu Microsoft Foundry modelima?

Dobra vijest: **tijek rada je identičan.**

| Korak | Klasična Todo aplikacija | AI Chat aplikacija |
|-------|--------------------------|--------------------|
| Inicijalizacija | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentikacija | `azd auth login` | `azd auth login` |
| Implementacija | `azd up` | `azd up` |
| Praćenje | `azd monitor` | `azd monitor` |
| Čišćenje | `azd down --force --purge` | `azd down --force --purge` |

Jedina razlika je **predložak** s kojim počinjete. AI predložak uključuje dodatnu infrastrukturu (poput Microsoft Foundry Models resource ili AI Search indeksa), no azd sve to upravlja za vas. Ne morate učiti nove naredbe, usvajati novi alat ili mijenjati pristup razmišljanju o implementaciji.

Ovo je osnovno načelo azd: **jedan tijek rada, bilo koji radni opterećenje.** Vještine koje ste vježbali u ovom vodiču — inicijalizacija, implementacija, praćenje, ponovno objavljivanje i čišćenje — jednako se primjenjuju na AI aplikacije i agente.

---

## Što ste naučili

Čestitamo! Uspješno ste:
- ✅ Inicijalizirali azd projekt iz predloška
- ✅ Istražili strukturu projekta i ključne datoteke
- ✅ Implementirali full-stack aplikaciju na Azure
- ✅ Napravili promjene u kôdu i ponovo implementirali
- ✅ Upravljali višestrukim okruženjima
- ✅ Očistili resurse

## 🎯 Vježbe provjere vještina

### Vježba 1: Implementirajte drugi predložak (15 minuta)
**Cilj**: Demonstrirati savladavanje azd init i tijeka implementacije

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
- [ ] Moguć pristup URL-u aplikacije u pregledniku
- [ ] Aplikacija radi ispravno (dodavanje/uklanjanje todo stavki)
- [ ] Uspješno su očišćeni svi resursi

### Vježba 2: Prilagodite konfiguraciju (20 minuta)
**Cilj**: Vježbati konfiguraciju varijabli okruženja

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

# Implementiraj s prilagođenom konfiguracijom
azd up
```

**Kriteriji uspjeha:**
- [ ] Prilagođeno okruženje uspješno kreirano
- [ ] Varijable okruženja postavljene i dostupne
- [ ] Aplikacija se implementira s prilagođenom konfiguracijom
- [ ] Moguće je provjeriti prilagođene postavke u implementiranoj aplikaciji

### Vježba 3: Tijek rada s višestrukim okruženjima (25 minuta)
**Cilj**: Savladati upravljanje okruženjem i strategije implementacije

```bash
# Kreiraj razvojno okruženje
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Zabilježi razvojni URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Kreiraj testno okruženje
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Zabilježi testni URL
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
- [ ] Mogućnost prebacivanja između okruženja pomoću `azd env select`
- [ ] Varijable okruženja se razlikuju između okruženja
- [ ] Oba okruženja su uspješno očišćena

## 📊 Vaš napredak

**Uloženo vrijeme**: ~60-90 minuta  
**Osvježene vještine**:
- ✅ Inicijalizacija projekta iz predložaka
- ✅ Provisioning Azure resursa
- ✅ Tijekovi implementacije aplikacija
- ✅ Upravljanje okruženjima
- ✅ Upravljanje konfiguracijom
- ✅ Čišćenje resursa i upravljanje troškovima

**Sljedeća razina**: Spremni ste za [Vodič za konfiguraciju](configuration.md) za napredne obrasce konfiguracije!

## Rješavanje čestih problema

### Pogreške u autentikaciji
```bash
# Ponovno se autentificirajte s Azureom
az login

# Provjerite pristup pretplati
az account show
```

### Neuspjesi pri implementaciji
```bash
# Omogući zapisivanje debug informacija
export AZD_DEBUG=true
azd up --debug

# Pogledaj zapise aplikacije u Azuru
azd monitor --logs

# Za Container Apps, koristi Azure CLI:
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

## Daljnji koraci

Sada kad ste završili svoj prvi projekt, istražite ove napredne teme:

### 1. Prilagodite infrastrukturu
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Dodajte baze podataka, pohranu i druge servise](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Postavite CI/CD
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) - Potpuni tijekovi rada CI/CD-a
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracija pipeline-a

### 3. Najbolje prakse za produkciju
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) - Sigurnost, performanse i nadzor

### 4. Istražite više predložaka
```bash
# Pregledajte predloške po kategoriji
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Isprobajte različite tehnološke skupove
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatni izvori

### Materijali za učenje
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Zajednica i podrška
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer zajednica](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predlošci i primjeri
- [Službena galerija predložaka](https://azure.github.io/awesome-azd/)
- [Zajednički predlošci](https://github.com/Azure-Samples/azd-templates)
- [Enterprise obrasci](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Čestitamo na dovršetku vašeg prvog azd projekta!** Sada ste spremni graditi i implementirati sjajne aplikacije na Azure s povjerenjem.

---

**Navigacija poglavljem:**
- **📚 Početak tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brz početak
- **⬅️ Prethodno**: [Instalacija i postavljanje](installation.md)
- **➡️ Sljedeće**: [Ponesi vlastitu aplikaciju](bring-your-own-app.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: AI-prvo razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->