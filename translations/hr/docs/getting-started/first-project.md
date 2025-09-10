<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:41:00+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "hr"
}
-->
# Vaš prvi projekt - Praktični vodič

## Uvod

Dobrodošli u svoj prvi projekt s Azure Developer CLI! Ovaj sveobuhvatni praktični vodič pruža detaljan pregled stvaranja, implementacije i upravljanja full-stack aplikacijom na Azureu koristeći azd. Radit ćete s pravom todo aplikacijom koja uključuje React frontend, Node.js API backend i MongoDB bazu podataka.

## Ciljevi učenja

Završetkom ovog vodiča, naučit ćete:
- Ovladati postupkom inicijalizacije azd projekta koristeći predloške
- Razumjeti strukturu i konfiguracijske datoteke Azure Developer CLI projekata
- Izvršiti potpunu implementaciju aplikacije na Azure uz postavljanje infrastrukture
- Provoditi ažuriranja aplikacije i strategije ponovne implementacije
- Upravljati višestrukim okruženjima za razvoj i testiranje
- Primijeniti prakse čišćenja resursa i upravljanja troškovima

## Ishodi učenja

Po završetku, bit ćete sposobni:
- Samostalno inicijalizirati i konfigurirati azd projekte iz predložaka
- Učinkovito navigirati i mijenjati strukture azd projekata
- Implementirati full-stack aplikacije na Azure koristeći jednostavne naredbe
- Rješavati uobičajene probleme s implementacijom i autentifikacijom
- Upravljati višestrukim Azure okruženjima za različite faze implementacije
- Provoditi kontinuirane tijekove implementacije za ažuriranja aplikacija

## Početak

### Popis preduvjeta
- ✅ Instaliran Azure Developer CLI ([Vodič za instalaciju](installation.md))
- ✅ Instaliran i autentificiran Azure CLI
- ✅ Instaliran Git na vašem sustavu
- ✅ Node.js 16+ (za ovaj vodič)
- ✅ Visual Studio Code (preporučeno)

### Provjera postavki
```bash
# Check azd installation
azd version
```
### Provjera Azure autentifikacije

```bash
az account show
```

### Provjera verzije Node.js
```bash
node --version
```

## Korak 1: Odaberite i inicijalizirajte predložak

Započnimo s popularnim predloškom za todo aplikaciju koji uključuje React frontend i Node.js API backend.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Što se upravo dogodilo?
- Preuzeli ste kod predloška u lokalni direktorij
- Kreirali ste `azure.yaml` datoteku s definicijama usluga
- Postavili ste infrastrukturni kod u direktoriju `infra/`
- Kreirali ste konfiguraciju okruženja

## Korak 2: Istražite strukturu projekta

Pogledajmo što je azd kreirao za nas:

```bash
# View the project structure
tree /f   # Windows
# or
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

### Ključne datoteke za razumijevanje

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

## Korak 3: Prilagodite svoj projekt (Opcionalno)

Prije implementacije, možete prilagoditi aplikaciju:

### Izmijenite frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Napravite jednostavnu promjenu:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfigurirajte varijable okruženja
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Korak 4: Implementirajte na Azure

Sada dolazi uzbudljivi dio - implementirajte sve na Azure!

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

Naredba `azd up` izvodi sljedeće korake:
1. **Provision** (`azd provision`) - Kreira Azure resurse
2. **Package** - Gradi kod vaše aplikacije
3. **Deploy** (`azd deploy`) - Implementira kod na Azure resurse

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
Kliknite na URL naveden u izlazu implementacije ili ga dohvatite u bilo kojem trenutku:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testirajte Todo aplikaciju
1. **Dodajte stavku** - Kliknite "Add Todo" i unesite zadatak
2. **Označite kao dovršeno** - Označite dovršene stavke
3. **Izbrišite stavke** - Uklonite zadatke koji vam više nisu potrebni

### Nadgledajte svoju aplikaciju
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Korak 6: Napravite promjene i ponovno implementirajte

Napravimo promjenu i provjerimo koliko je jednostavno ažurirati:

### Izmijenite API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Dodajte prilagođeni zaglavlje odgovora:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementirajte samo promjene u kodu
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Korak 7: Upravljajte višestrukim okruženjima

Kreirajte testno okruženje za provjeru promjena prije produkcije:

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

### Usporedba okruženja
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Korak 8: Očistite resurse

Kada završite s eksperimentiranjem, očistite resurse kako biste izbjegli dodatne troškove:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Što ste naučili

Čestitamo! Uspješno ste:
- Inicijalizirali azd projekt iz predloška
- Istražili strukturu projekta i ključne datoteke
- Implementirali full-stack aplikaciju na Azure
- Napravili promjene u kodu i ponovno implementirali
- Upravljali višestrukim okruženjima
- Očistili resurse

## Rješavanje uobičajenih problema

### Problemi s autentifikacijom
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Neuspjesi implementacije
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Sukobi u nazivima resursa
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problemi s portovima/mrežom
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Sljedeći koraci

Sada kada ste završili svoj prvi projekt, istražite ove napredne teme:

### 1. Prilagodite infrastrukturu
- [Infrastruktura kao kod](../deployment/provisioning.md)
- [Dodajte baze podataka, pohranu i druge usluge](../deployment/provisioning.md#adding-services)

### 2. Postavite CI/CD
- [Integracija s GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Najbolje prakse za produkciju
- [Sigurnosne konfiguracije](../deployment/best-practices.md#security)
- [Optimizacija performansi](../deployment/best-practices.md#performance)
- [Nadgledanje i zapisivanje](../deployment/best-practices.md#monitoring)

### 4. Istražite više predložaka
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatni resursi

### Materijali za učenje
- [Dokumentacija za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Zajednica i podrška
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predlošci i primjeri
- [Službena galerija predložaka](https://azure.github.io/awesome-azd/)
- [Predlošci zajednice](https://github.com/Azure-Samples/azd-templates)
- [Enterprise obrasci](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Čestitamo na završetku svog prvog azd projekta!** Sada ste spremni graditi i implementirati nevjerojatne aplikacije na Azureu s povjerenjem.

---

**Navigacija**
- **Prethodna lekcija**: [Konfiguracija](configuration.md)
- **Sljedeća lekcija**: [Vodič za implementaciju](../deployment/deployment-guide.md)

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden korištenjem AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati mjerodavnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane stručnjaka. Ne preuzimamo odgovornost za bilo kakve nesporazume ili pogrešne interpretacije proizašle iz korištenja ovog prijevoda.