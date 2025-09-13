<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e131a5271d4c8eb0d44ae82302f8fd1a",
  "translation_date": "2025-09-12T22:28:31+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ro"
}
-->
# Primul Tău Proiect - Tutorial Practic

**Anterior:** [Configurare](configuration.md) | **Următor:** [Integrarea Azure AI Foundry](../ai-foundry/azure-ai-foundry-integration.md)

## Introducere

Bine ai venit la primul tău proiect cu Azure Developer CLI! Acest tutorial practic cuprinzător oferă o prezentare completă a procesului de creare, implementare și gestionare a unei aplicații full-stack pe Azure folosind azd. Vei lucra cu o aplicație reală de tip todo care include un frontend React, un backend API Node.js și o bază de date MongoDB.

## Obiective de Învățare

După finalizarea acestui tutorial, vei:
- Stăpâni fluxul de inițializare a proiectelor azd folosind șabloane
- Înțelege structura proiectelor Azure Developer CLI și fișierele de configurare
- Executa implementarea completă a aplicației pe Azure cu provizionarea infrastructurii
- Aplica strategii de actualizare și redeployare a aplicației
- Gestiona medii multiple pentru dezvoltare și testare
- Aplica practici de curățare a resurselor și gestionare a costurilor

## Rezultate de Învățare

După finalizare, vei putea:
- Inițializa și configura proiecte azd din șabloane în mod independent
- Naviga și modifica structurile proiectelor azd eficient
- Implementa aplicații full-stack pe Azure folosind comenzi simple
- Depana probleme comune de implementare și autentificare
- Gestiona medii multiple Azure pentru diferite etape de implementare
- Implementa fluxuri de implementare continuă pentru actualizări ale aplicației

## Începe

### Listă de Verificare a Prerechizitelor
- ✅ Azure Developer CLI instalat ([Ghid de Instalare](installation.md))
- ✅ Azure CLI instalat și autentificat
- ✅ Git instalat pe sistemul tău
- ✅ Node.js 16+ (pentru acest tutorial)
- ✅ Visual Studio Code (recomandat)

### Verifică Configurația Ta
```bash
# Check azd installation
azd version
```
### Verifică Autentificarea Azure

```bash
az account show
```

### Verifică Versiunea Node.js
```bash
node --version
```

## Pasul 1: Alege și Inițializează un Șablon

Să începem cu un șablon popular de aplicație todo care include un frontend React și un backend API Node.js.

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

### Ce Tocmai S-a Întâmplat?
- Codul șablonului a fost descărcat în directorul local
- A fost creat un fișier `azure.yaml` cu definiții ale serviciilor
- Codul infrastructurii a fost configurat în directorul `infra/`
- A fost creată o configurație de mediu

## Pasul 2: Explorează Structura Proiectului

Să examinăm ce a creat azd pentru noi:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Ar trebui să vezi:
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

### Fișiere Cheie de Înțeles

**azure.yaml** - Inima proiectului azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definiția infrastructurii:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Pasul 3: Personalizează Proiectul Tău (Opțional)

Înainte de implementare, poți personaliza aplicația:

### Modifică Frontend-ul
```bash
# Open the React app component
code src/web/src/App.tsx
```

Fă o schimbare simplă:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Configurează Variabilele de Mediu
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Pasul 4: Implementează pe Azure

Acum urmează partea interesantă - implementează totul pe Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Ce Se Întâmplă În Timpul Implementării?

Comanda `azd up` execută următorii pași:
1. **Provizionare** (`azd provision`) - Creează resurse Azure
2. **Pachetizare** - Construiește codul aplicației
3. **Implementare** (`azd deploy`) - Implementează codul pe resursele Azure

### Rezultatul Așteptat
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Pasul 5: Testează Aplicația Ta

### Accesează Aplicația Ta
Dă click pe URL-ul furnizat în rezultatul implementării sau accesează-l oricând:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testează Aplicația Todo
1. **Adaugă un element todo** - Click pe "Add Todo" și introdu o sarcină
2. **Marchează ca finalizat** - Bifează elementele completate
3. **Șterge elemente** - Elimină sarcinile de care nu mai ai nevoie

### Monitorizează Aplicația Ta
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Pasul 6: Fă Modificări și Redeployează

Să facem o modificare și să vedem cât de ușor este să actualizăm:

### Modifică API-ul
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Adaugă un header de răspuns personalizat:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementează Doar Modificările Codului
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Pasul 7: Gestionează Medii Multiple

Creează un mediu de testare pentru a verifica modificările înainte de producție:

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

### Comparație între Medii
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Pasul 8: Curăță Resursele

Când ai terminat de experimentat, curăță resursele pentru a evita costuri suplimentare:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Ce Ai Învățat

Felicitări! Ai reușit să:
- Inițializezi un proiect azd dintr-un șablon
- Explorezi structura proiectului și fișierele cheie
- Implementezi o aplicație full-stack pe Azure
- Faci modificări de cod și să redeployezi
- Gestionezi medii multiple
- Cureți resursele

## Depanarea Problemelor Comune

### Erori de Autentificare
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Eșecuri de Implementare
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Conflicte de Nume ale Resurselor
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Probleme de Port/Network
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Următorii Pași

Acum că ai finalizat primul tău proiect, explorează aceste subiecte avansate:

### 1. Personalizează Infrastructura
- [Infrastructure as Code](../deployment/provisioning.md)
- [Adaugă baze de date, stocare și alte servicii](../deployment/provisioning.md#adding-services)

### 2. Configurează CI/CD
- [Integrarea GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Practici Optime pentru Producție
- [Configurări de securitate](../deployment/best-practices.md#security)
- [Optimizare performanță](../deployment/best-practices.md#performance)
- [Monitorizare și logare](../deployment/best-practices.md#monitoring)

### 4. Explorează Mai Multe Șabloane
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

## Resurse Suplimentare

### Materiale de Învățare
- [Documentația Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrul de Arhitectură Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework-ul Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunitate & Suport
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Comunitatea Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Șabloane & Exemple
- [Galeria Oficială de Șabloane](https://azure.github.io/awesome-azd/)
- [Șabloane Comunitare](https://github.com/Azure-Samples/azd-templates)
- [Modele Enterprise](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Felicitări pentru finalizarea primului tău proiect azd!** Acum ești pregătit să construiești și să implementezi aplicații uimitoare pe Azure cu încredere.

---

**Anterior:** [Configurare](configuration.md) | **Următor:** [Integrarea Azure AI Foundry](../ai-foundry/azure-ai-foundry-integration.md)
- **Următoarea Lecție**: [Ghid de Implementare](../deployment/deployment-guide.md)

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.