<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-17T23:28:26+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "da"
}
-->
# Dit Første Projekt - Praktisk Vejledning

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 1 - Grundlag & Hurtig Start
- **⬅️ Forrige**: [Installation & Opsætning](installation.md)
- **➡️ Næste**: [Konfiguration](configuration.md)
- **🚀 Næste Kapitel**: [Kapitel 2: AI-First Udvikling](../ai-foundry/azure-ai-foundry-integration.md)

## Introduktion

Velkommen til dit første Azure Developer CLI-projekt! Denne omfattende praktiske vejledning giver dig en komplet gennemgang af, hvordan du opretter, implementerer og administrerer en full-stack applikation på Azure ved hjælp af azd. Du vil arbejde med en rigtig todo-applikation, der inkluderer en React-frontend, Node.js API-backend og MongoDB-database.

## Læringsmål

Ved at gennemføre denne vejledning vil du:
- Mestre azd-projektets initialiseringsworkflow ved hjælp af skabeloner
- Forstå Azure Developer CLI-projektstruktur og konfigurationsfiler
- Udføre komplet applikationsimplementering til Azure med infrastrukturprovisionering
- Implementere strategier for applikationsopdateringer og genimplementering
- Administrere flere miljøer til udvikling og staging
- Anvende praksis for oprydning af ressourcer og omkostningsstyring

## Læringsresultater

Når du er færdig, vil du kunne:
- Selvstændigt initialisere og konfigurere azd-projekter fra skabeloner
- Navigere og ændre azd-projektstrukturer effektivt
- Implementere full-stack applikationer til Azure med enkle kommandoer
- Fejlsøge almindelige implementeringsproblemer og autentificeringsfejl
- Administrere flere Azure-miljøer til forskellige implementeringsstadier
- Implementere kontinuerlige implementeringsworkflows til applikationsopdateringer

## Kom godt i gang

### Tjekliste for forudsætninger
- ✅ Azure Developer CLI installeret ([Installationsvejledning](installation.md))
- ✅ Azure CLI installeret og autentificeret
- ✅ Git installeret på dit system
- ✅ Node.js 16+ (til denne vejledning)
- ✅ Visual Studio Code (anbefales)

### Verificer din opsætning
```bash
# Check azd installation
azd version
```
### Verificer Azure-autentificering

```bash
az account show
```

### Tjek Node.js-version
```bash
node --version
```

## Trin 1: Vælg og Initialiser en Skabelon

Lad os starte med en populær todo-applikationsskabelon, der inkluderer en React-frontend og Node.js API-backend.

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

### Hvad skete der lige?
- Skabelonkoden blev downloadet til din lokale mappe
- En `azure.yaml`-fil med servicedefinitioner blev oprettet
- Infrastrukturkode blev oprettet i mappen `infra/`
- Et miljøkonfigurationsfil blev oprettet

## Trin 2: Udforsk Projektstrukturen

Lad os undersøge, hvad azd har oprettet for os:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Du bør se:
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

### Vigtige Filer at Forstå

**azure.yaml** - Kernen i dit azd-projekt:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Trin 3: Tilpas Dit Projekt (Valgfrit)

Før implementering kan du tilpasse applikationen:

### Ændr Frontenden
```bash
# Open the React app component
code src/web/src/App.tsx
```

Foretag en simpel ændring:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfigurer Miljøvariabler
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Trin 4: Implementer til Azure

Nu til den spændende del - implementer alt til Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Hvad sker der under implementeringen?

Kommandoen `azd up` udfører følgende trin:
1. **Provision** (`azd provision`) - Opretter Azure-ressourcer
2. **Pakke** - Bygger din applikationskode
3. **Implementer** (`azd deploy`) - Implementerer kode til Azure-ressourcer

### Forventet Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Trin 5: Test Din Applikation

### Få Adgang til Din Applikation
Klik på URL'en, der blev angivet i implementeringsoutputtet, eller hent den når som helst:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test Todo-Appen
1. **Tilføj en todo-opgave** - Klik på "Add Todo" og indtast en opgave
2. **Markér som fuldført** - Afkryds fuldførte opgaver
3. **Slet opgaver** - Fjern todo-opgaver, du ikke længere har brug for

### Overvåg Din Applikation
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Trin 6: Foretag Ændringer og Genimplementer

Lad os foretage en ændring og se, hvor nemt det er at opdatere:

### Ændr API'en
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Tilføj en brugerdefineret svarheader:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementer Kun Kodeændringer
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Trin 7: Administrer Flere Miljøer

Opret et staging-miljø for at teste ændringer før produktion:

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

### Miljøsammenligning
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Trin 8: Ryd Op i Ressourcer

Når du er færdig med at eksperimentere, skal du rydde op for at undgå løbende omkostninger:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Hvad Du Har Lært

Tillykke! Du har med succes:
- Initialiseret et azd-projekt fra en skabelon
- Udforsket projektstrukturen og nøglefiler
- Implementeret en full-stack applikation til Azure
- Foretaget kodeændringer og genimplementeret
- Administreret flere miljøer
- Ryddet op i ressourcer

## Fejlfinding af Almindelige Problemer

### Autentificeringsfejl
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Implementeringsfejl
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Ressourcenavnekonflikter
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/Netværksproblemer
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Næste Skridt

Nu hvor du har gennemført dit første projekt, kan du udforske disse avancerede emner:

### 1. Tilpas Infrastruktur
- [Infrastructure as Code](../deployment/provisioning.md)
- [Tilføj databaser, lager og andre tjenester](../deployment/provisioning.md#adding-services)

### 2. Opsæt CI/CD
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Produktionsbedste Praksis
- [Sikkerhedskonfigurationer](../deployment/best-practices.md#security)
- [Performanceoptimering](../deployment/best-practices.md#performance)
- [Overvågning og logning](../deployment/best-practices.md#monitoring)

### 4. Udforsk Flere Skabeloner
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

## Yderligere Ressourcer

### Læringsmaterialer
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Fællesskab & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Skabeloner & Eksempler
- [Officiel Skabelongalleri](https://azure.github.io/awesome-azd/)
- [Fællesskabsskabeloner](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Mønstre](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Tillykke med at have gennemført dit første azd-projekt!** Du er nu klar til at bygge og implementere fantastiske applikationer på Azure med selvtillid.

---

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 1 - Grundlag & Hurtig Start
- **⬅️ Forrige**: [Installation & Opsætning](installation.md)
- **➡️ Næste**: [Konfiguration](configuration.md)
- **🚀 Næste Kapitel**: [Kapitel 2: AI-First Udvikling](../ai-foundry/azure-ai-foundry-integration.md)
- **Næste Lektion**: [Implementeringsvejledning](../deployment/deployment-guide.md)

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.