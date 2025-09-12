<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e131a5271d4c8eb0d44ae82302f8fd1a",
  "translation_date": "2025-09-12T22:40:40+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "hr"
}
-->
# Vaš Prvi Projekt - Praktični Vodič

**Prethodno:** [Konfiguracija](configuration.md) | **Sljedeće:** [Integracija s Azure AI Foundry](../ai-foundry/azure-ai-foundry-integration.md)

## Uvod

Dobrodošli u vaš prvi projekt s Azure Developer CLI! Ovaj sveobuhvatni praktični vodič pruža detaljan pregled kreiranja, implementacije i upravljanja full-stack aplikacijom na Azureu koristeći azd. Radit ćete s pravom todo aplikacijom koja uključuje React frontend, Node.js API backend i MongoDB bazu podataka.

## Ciljevi učenja

Završetkom ovog vodiča, naučit ćete:
- Ovladati procesom inicijalizacije azd projekata koristeći predloške
- Razumjeti strukturu projekta i konfiguracijske datoteke Azure Developer CLI-a
- Izvršiti kompletnu implementaciju aplikacije na Azure uz provisioniranje infrastrukture
- Provoditi ažuriranja aplikacije i strategije ponovne implementacije
- Upravljati višestrukim okruženjima za razvoj i testiranje
- Primijeniti prakse čišćenja resursa i upravljanja troškovima

## Ishodi učenja

Po završetku, moći ćete:
- Samostalno inicijalizirati i konfigurirati azd projekte iz predložaka
- Učinkovito navigirati i mijenjati strukture azd projekata
- Implementirati full-stack aplikacije na Azure koristeći jednostavne naredbe
- Rješavati uobičajene probleme s implementacijom i autentifikacijom
- Upravljati višestrukim Azure okruženjima za različite faze implementacije
- Provoditi kontinuirane procese implementacije za ažuriranja aplikacija

## Početak

### Popis preduvjeta
- ✅ Instaliran Azure Developer CLI ([Vodič za instalaciju](installation.md))
- ✅ Instaliran i autentificiran Azure CLI
- ✅ Instaliran Git na vašem sustavu
- ✅ Node.js 16+ (za ovaj vodič)
- ✅ Preporučuje se Visual Studio Code

### Provjera postavki
```bash
# Check azd installation
azd version
```
### Provjera autentifikacije na Azureu

```bash
az account show
```

### Provjera verzije Node.js
```bash
node --version
```

## Korak 1: Odabir i inicijalizacija predloška

Započnimo s popularnim predloškom todo aplikacije koji uključuje React frontend i Node.js API backend.

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
- Kreirali ste datoteku `azure.yaml` s definicijama servisa
- Postavili ste kod infrastrukture u direktorij `infra/`
- Kreirali ste konfiguraciju okruženja

## Korak 2: Istraživanje strukture projekta

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

## Korak 3: Prilagodba projekta (Opcionalno)

Prije implementacije, možete prilagoditi aplikaciju:

### Izmjena frontenda
```bash
# Open the React app component
code src/web/src/App.tsx
```

Napravite jednostavnu promjenu:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfiguracija varijabli okruženja
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Korak 4: Implementacija na Azure

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

## Korak 5: Testiranje aplikacije

### Pristup aplikaciji
Kliknite na URL koji je naveden u izlazu implementacije ili ga dohvatite u bilo kojem trenutku:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testiranje Todo aplikacije
1. **Dodajte stavku** - Kliknite "Add Todo" i unesite zadatak
2. **Označite kao dovršeno** - Označite dovršene stavke
3. **Izbrišite stavke** - Uklonite zadatke koji vam više nisu potrebni

### Praćenje aplikacije
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Korak 6: Izmjene i ponovna implementacija

Napravimo promjenu i vidimo koliko je lako ažurirati:

### Izmjena API-ja
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Dodajte prilagođeni odgovor u zaglavlju:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementacija samo promjena koda
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Korak 7: Upravljanje višestrukim okruženjima

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

## Korak 8: Čišćenje resursa

Kad završite s eksperimentiranjem, očistite resurse kako biste izbjegli stalne troškove:

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

### 1. Prilagodba infrastrukture
- [Infrastruktura kao kod](../deployment/provisioning.md)
- [Dodavanje baza podataka, pohrane i drugih servisa](../deployment/provisioning.md#adding-services)

### 2. Postavljanje CI/CD-a
- [Integracija s GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Najbolje prakse za produkciju
- [Sigurnosne konfiguracije](../deployment/best-practices.md#security)
- [Optimizacija performansi](../deployment/best-practices.md#performance)
- [Praćenje i zapisivanje](../deployment/best-practices.md#monitoring)

### 4. Istraživanje više predložaka
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
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
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

**Čestitamo na završetku vašeg prvog azd projekta!** Sada ste spremni graditi i implementirati nevjerojatne aplikacije na Azureu s povjerenjem.

---

**Prethodno:** [Konfiguracija](configuration.md) | **Sljedeće:** [Integracija s Azure AI Foundry](../ai-foundry/azure-ai-foundry-integration.md)
- **Sljedeća lekcija**: [Vodič za implementaciju](../deployment/deployment-guide.md)

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.