# Vaš Prvi Projekt - Praktični Tutorial

**Navigacija Poglavljima:**
- **📚 Početna Stranica Tečaja**: [AZD za Početnike](../../README.md)
- **📖 Trenutno Poglavlje**: Poglavlje 1 - Osnove i Brzi Početak
- **⬅️ Prethodno**: [Instalacija i Postavljanje](installation.md)
- **➡️ Sljedeće**: [Donesi Svoju Aplikaciju](bring-your-own-app.md)
- **🚀 Sljedeće Poglavlje**: [Poglavlje 2: AI-prvi Razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Dobrodošli u vaš prvi Azure Developer CLI projekt! Postavit ćete aplikaciju za zadatke s React frontend-om, Node.js API-jem i Azure Cosmos DB-om. Predložak zadržava povijesno ime `todo-nodejs-mongo`; njegova trenutna infrastruktura koristi Cosmos DB za NoSQL, stoga proučite preuzeti README i `infra/` umjesto da nagađate API baze podataka prema imenu.

> Pregledano u studenom 2026. prema `azd 1.37.2` i javnom predlošku. Primjeri ispod koriste Bash; izdvajanje JSON-a zahtijeva i `jq`. Azure implementacije uključuju troškove i nisu izvršene tijekom ovog pregleda.

## Ciljevi Učenja

Završetkom ovog tutoriala, moći ćete:
- Savladati tijek rada inicijalizacije azd projekta koristeći predloške
- Razumjeti strukturu projekta Azure Developer CLI i konfiguracijske datoteke
- Izvesti kompletnu implementaciju aplikacije na Azure uz pružanje infrastrukture
- Implementirati strategije ažuriranja i ponovne implementacije aplikacije
- Upravljati višestrukim okruženjima za razvoj i testiranje
- Primijeniti prakse čišćenja resursa i upravljanja troškovima

## Ishodi Učenja

Nakon završetka, moći ćete:
- Neovisno inicijalizirati i konfigurirati azd projekte iz predložaka
- Učinkovito navigirati i mijenjati strukturu azd projekata
- Implementirati full-stack aplikacije na Azure koristeći jednostavne naredbe
- Rješavati uobičajene probleme s implementacijom i autentifikacijom
- Upravljati višestrukim Azure okruženjima za različite faze implementacije
- Implementirati tijekove kontinuirane implementacije za ažuriranja aplikacije

## Početak

### Popis preduvjeta
- ✅ Instaliran Azure Developer CLI ([Vodič za instalaciju](installation.md))
- ✅ Dovršena AZD autentifikacija s `azd auth login`
- ✅ Git instaliran na vašem sustavu
- ✅ Node.js 22 LTS (ili podržana verzija potrebna za preuzeti predložak)
- ✅ Visual Studio Code (preporučeno)

Prije nastavka, pokrenite validator postavljanja iz korijena repozitorija:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Provjerite svoj setup
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Provjerite opcionalnu Azure CLI autentifikaciju

```bash
az account show
```

### Provjerite verziju Node.js
```bash
node --version
```

## Korak 1: Odaberite i Inicijalizirajte Predložak

Počnimo s popularnim predloškom aplikacije za zadatke koji uključuje React frontend i Node.js API backend.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Što se upravo dogodilo?
- Preuzet je predložak koda u vaš lokalni direktorij
- Kreirana je `azure.yaml` datoteka s definicijama servisa
- Postavljen je infrastrukturirani kod u direktoriju `infra/`
- Kreirana je konfiguracija okruženja

## Korak 2: Istražite Strukturu Projekta

Pogledajmo što je azd stvorio za nas:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Trebali biste vidjeti:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Ključne Datoteke za Razumjeti

**azure.yaml** - Srce vašeg azd projekta:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definicija infrastrukture:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Korak 3: Prilagodite Svoj Projekt (Opcionalno)

Prije implementacije, možete prilagoditi aplikaciju:

### Izmijenite Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Napravite jednostavnu promjenu:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Konfigurirajte Varijable Okruženja
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Ove dvije prilagođene vrijednosti demonstriraju samo lokalno pohranjivanje. Standardni predložak ne koristi `WEBSITE_TITLE` ili `API_VERSION`, tako da one ne mijenjaju aplikaciju. Izričita izvorna izmjena gore mijenja prikazani naslov.

## Korak 4: Implementirajte na Azure

E sad dolazi uzbudljivi dio - implementirajte sve na Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Što se događa tijekom implementacije?

Tijek rada pruža infrastrukturu i pakira/implementira kod. Točan redoslijed može se prilagoditi kroz `workflows.up` u `azure.yaml`; ovaj predložak specificira prvo pružanje, pa implementaciju. Nemojte se oslanjati na jedan univerzalni redoslijed faza za svaki predložak.

### Očekivani Izlaz
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Korak 5: Testirajte Svoju Aplikaciju

### Pristupite Svojoj Aplikaciji
Kliknite na URL dan u izlazu implementacije ili ga dobijte bilo kada:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Testirajte Todo Aplikaciju
1. **Dodajte zadatak** - Kliknite "Add Todo" i unesite zadatak
2. **Označite kao dovršeno** - Označite dovršene zadatke
3. **Obrišite stavke** - Uklonite zadatke koje više ne trebate

### Pratite Svoju Aplikaciju
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Potvrdite Svoju Implementaciju

Prije nego nastavite, prođite ovaj brzi popis za provjeru da potvrdite da sve stvarno radi—nemojte pretpostaviti da "implementacija je uspjela" znači "aplikacija radi":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Implementacija je potvrđena ako:**
- ✅ `azd show` navodi dostupni URL krajnje točke
- ✅ URL se otvara u pregledniku bez pogrešaka
- ✅ Osnovne funkcije rade (dodavanje/dovršavanje/brisanje zadatka)
- ✅ `azd monitor --logs` prikazuje dolazne zahtjeve bez neočekivanih grešaka

Ako bilo koja provjera ne uspije, prijeđite na [Poglavlje 7: Otklanjanje Problema](../chapter-07-troubleshooting/README.md).

## Korak 6: Napravite Promjene i Ponovno Implementirajte

Napravimo promjenu i vidimo koliko je lako ažurirati:

### Izmijenite API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Dodajte prilagođeni zaglavlje odgovora:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementirajte Samo Promjene Koda
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Korak 7: Upravljajte Višestrukim Okruženjima

Kreirajte testno okruženje za ispitivanje promjena prije produkcije:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Usporedba Okruženja
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Korak 8: Očistite Resurse

Kad završite s eksperimentiranjem, očistite za izbjegavanje daljnjih troškova:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klasična Aplikacija vs. AI-Pokretana Aplikacija: Isti Tijek Rada

Upravo ste implementirali tradicionalnu web aplikaciju. Ali što ako želite implementirati AI-aplikaciju—na primjer, chat aplikaciju podržanu Microsoft Foundry modelima?

Dobra vijest: **tijek rada je identičan.**

| Korak | Klasična Todo Aplikacija | AI Chat Aplikacija |
|------|------------------------|------------------|
| Inicijalizacija (prazan direktorij) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autentikacija | `azd auth login` | `azd auth login` |
| Implementacija | `azd up` | `azd up` |
| Praćenje | `azd monitor` | `azd monitor` |
| Čišćenje | `azd down --force --purge` | `azd down --force --purge` |

Životni ciklus naredbi je isti, ali preduvjeti se razlikuju. AI predložak može zahtijevati pristup modelu, regionalni kvotu, unos podataka i dodatnu konfiguraciju. Pročitajte njegov README prije implementacije; `azd up` ne može osigurati nedostajuće dozvole ili kvotu.

Ovo je osnovno načelo azd: **jedan tijek rada, bilo koji teret.** Vještine koje ste vježbali u ovom tutorialu—inicijalizacija, implementacija, praćenje, ponovna implementacija i čišćenje—podjednako se odnose na AI aplikacije i agente.

---

## Što Ste Naučili

Čestitamo! Uspješno ste:
- ✅ Inicijalizirali azd projekt iz predloška
- ✅ Istražili strukturu projekta i ključne datoteke
- ✅ Implementirali full-stack aplikaciju na Azure
- ✅ Napravili promjene u kodu i ponovno implementirali
- ✅ Upravljali višestrukim okruženjima
- ✅ Očistili resurse

## 🎯 Vježbe za Potvrdu Vještina

### Vježba 1: Implementirajte Drugi Predložak (15 minuta)
**Cilj**: Pokazati ovladavanje azd init i tijek rada implementacije

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Kriteriji Uspjeha:**
- [ ] Aplikacija se implementira bez pogrešaka
- [ ] Moguće je pristupiti URL-u aplikacije u pregledniku
- [ ] Aplikacija funkcioniše ispravno (dodavanje/uklanjanje zadataka)
- [ ] Uspješno su očišćeni svi resursi

### Vježba 2: Prilagodite Konfiguraciju (20 minuta)
**Cilj**: Vježbati lokalno pohranjivanje vrijednosti okruženja bez miješanja s runtime konfiguracijom

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Kriteriji Uspjeha:**
- [ ] Prilagođeno okruženje uspješno kreirano
- [ ] Varijable okruženja postavljene i dohvatljive
- [ ] `azd env get-value APP_TITLE` ispisuje `My Custom Todo App`
- [ ] Mogu objasniti zašto ove vrijednosti ne mijenjaju standardnu aplikaciju osim ako ih kod/infrastruktura ne koristi

### Vježba 3: Višestruko Okruženje u Tijeku Rada (25 minuta)
**Cilj**: Ovladati upravljanjem okruženjima i strategijama implementacije

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteriji Uspjeha:**
- [ ] Dva okruženja kreirana s različitim konfiguracijama
- [ ] Oba okruženja uspješno implementirana
- [ ] Moguće je prebacivati se između okruženja koristeći `azd env select`
- [ ] Varijable okruženja razlikuju se između okruženja
- [ ] Uspješno očišćena oba okruženja

## 📊 Vaš Napredak

**Uloženo Vrijeme**: ~60-90 minuta  
**Stečene Vještine**:
- ✅ Inicijalizacija projekata temeljenih na predlošcima
- ✅ Pružanje Azure resursa
- ✅ Tijekovi rada implementacije aplikacija
- ✅ Upravljanje okruženjima
- ✅ Upravljanje konfiguracijom
- ✅ Čišćenje resursa i upravljanje troškovima

**Sljedeća Razina**: Spremni ste za [Vodič za Konfiguraciju](../chapter-03-configuration/configuration.md) za učenje naprednih konfiguracijskih uzoraka!

## Otklanjanje Uobičajenih Problema

### Pogreške Autentifikacije
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Neuspjeh Implementacije
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Sukobi Imena Resursa
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problem s Portom/Mrežom
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Sljedeći Koraci

Sad kad ste dovršili svoj prvi projekt, istražite ove napredne teme:

### 1. Prilagodite Infrastrukturu
- [Infrastruktura kao Kod](../chapter-04-infrastructure/provisioning.md)
- [Dodajte infrastrukturu baze podataka](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Postavite CI/CD
- [Vodič za Implementaciju](../chapter-04-infrastructure/deployment-guide.md) - Potpuni tijekovi rada CI/CD
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracija pipeline-a

### 3. Najbolje Prakse za Produkciju
- [Vodič za Implementaciju](../chapter-04-infrastructure/deployment-guide.md) - Sigurnost, performanse i nadzor

### 4. istražite Još Predložaka
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Dodatni Resursi

### Materijali za Učenje
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Zajednica i Podrška
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predlošci i Primjeri
- [Službena Galerija Predložaka](https://azure.github.io/awesome-azd/)
- [Doprinosi Zajednice za Predloške](https://github.com/Azure/awesome-azd)
- [Izvor Todo Predloška](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Čestitamo na dovršetku vašeg prvog azd projekta!** Sada ste spremni izgraditi i implementirati nevjerojatne aplikacije na Azure s povjerenjem.

---

**Navigacija Poglavljima:**
- **📚 Početna Stranica Tečaja**: [AZD za Početnike](../../README.md)
- **📖 Trenutno Poglavlje**: Poglavlje 1 - Osnove i Brzi Početak
- **⬅️ Prethodno**: [Instalacija i Postavljanje](installation.md)
- **➡️ Sljedeće**: [Donesi Svoju Aplikaciju](bring-your-own-app.md)
- **🚀 Sljedeće Poglavlje**: [Poglavlje 2: AI-prvi Razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->