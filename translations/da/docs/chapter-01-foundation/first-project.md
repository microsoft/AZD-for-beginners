# Dit første projekt - Praktisk vejledning

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 1 - Grundlag & Hurtig start
- **⬅️ Forrige**: [Installation og opsætning](installation.md)
- **➡️ Næste**: [Konfiguration](configuration.md)
- **🚀 Næste kapitel**: [Kapitel 2: AI-først udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Velkommen til dit første Azure Developer CLI-projekt! Denne omfattende praktiske vejledning giver en komplet gennemgang af oprettelse, udrulning og administration af en full-stack-applikation på Azure ved hjælp af azd. Du arbejder med en rigtig todo-applikation, der inkluderer en React-frontend, Node.js API-backend og MongoDB-database.

## Læringsmål

Når du har gennemført denne vejledning, vil du:
- Mestre azd-projektinitialiseringsworkflowet ved hjælp af skabeloner
- Forstå Azure Developer CLI-projektstruktur og konfigurationsfiler
- Udføre komplet applikationsudrulning til Azure med infrastrukturprovisionering
- Implementere opdaterings- og genudrulningsstrategier for applikationen
- Administrere flere miljøer til udvikling og staging
- Anvende ressourcerensning og omkostningsstyringspraksis

## Læringsudbytte

Når du er færdig, vil du være i stand til at:
- Initialisere og konfigurere azd-projekter fra skabeloner uafhængigt
- Navigere i og ændre azd-projektstrukturer effektivt
- Udrulle full-stack-applikationer til Azure med enkeltkommandoer
- Fejlfinde almindelige udrulningsproblemer og godkendelsesproblemer
- Administrere flere Azure-miljøer til forskellige udrulningsstadier
- Implementere kontinuerlige udrulnings-workflows for applikationsopdateringer

## Kom godt i gang

### Forudsætninger
- ✅ Azure Developer CLI installeret ([Installationsvejledning](installation.md))
- ✅ Azure CLI installeret og godkendt
- ✅ Git installeret på dit system
- ✅ Node.js 16+ (til denne vejledning)
- ✅ Visual Studio Code (anbefalet)

### Bekræft din opsætning
```bash
# Kontroller azd-installationen
azd version
```
### Bekræft Azure-godkendelse

```bash
az account show
```

### Tjek Node.js-version
```bash
node --version
```

## Trin 1: Vælg og initialiser en skabelon

Lad os starte med en populær todo-applikationsskabelon, der inkluderer en React-frontend og en Node.js API-backend.

```bash
# Gennemse tilgængelige skabeloner
azd template list

# Initialiser todo-app-skabelonen
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Følg anvisningerne:
# - Indtast et miljønavn: "dev"
# - Vælg et abonnement (hvis du har flere)
# - Vælg en region: "East US 2" (eller din foretrukne region)
```

### Hvad skete der lige?
- Downloadede skabelonkoden til din lokale mappe
- Oprettede en `azure.yaml` fil med servicedefinitioner
- Opsatte infrastrukturkode i `infra/`-mappen
- Oprettede en miljøkonfiguration

## Trin 2: Undersøg projektstrukturen

Lad os gennemgå, hvad azd oprettede for os:

```bash
# Vis projektstrukturen
tree /f   # Windows
# eller
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

### Vigtige filer at forstå

**azure.yaml** - Hjertet i dit azd-projekt:
```bash
# Vis projektkonfigurationen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# Se infrastrukturkoden
head -30 infra/main.bicep
```

## Trin 3: Tilpas dit projekt (valgfrit)

Før udrulning kan du tilpasse applikationen:

### Rediger frontend
```bash
# Åbn React-app-komponenten
code src/web/src/App.tsx
```

Foretag en enkel ændring:
```typescript
// Find titlen og ændr den
<h1>My Awesome Todo App</h1>
```

### Konfigurer miljøvariabler
```bash
# Indstil brugerdefinerede miljøvariabler
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Vis alle miljøvariabler
azd env get-values
```

## Trin 4: Udrul til Azure

Nu til den spændende del — udrul alt til Azure!

```bash
# Udrul infrastruktur og applikation
azd up

# Denne kommando vil:
# 1. Oprette Azure-ressourcer (App Service, Cosmos DB osv.)
# 2. Bygge din applikation
# 3. Udrulle til de oprettede ressourcer
# 4. Vise applikationens URL
```

### Hvad sker der under udrulningen?

Kommandoen `azd up` udfører disse trin:
1. **Provision** (`azd provision`) - Opretter Azure-ressourcer
2. **Package** - Bygger din applikationskode
3. **Deploy** (`azd deploy`) - Udruller kode til Azure-ressourcer

### Forventet output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Trin 5: Test din applikation

### Få adgang til din applikation
Klik på URL'en, der blev vist i udrulningsoutputtet, eller hent den når som helst:
```bash
# Hent applikationens endepunkter
azd show

# Åbn applikationen i din browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test Todo-appen
1. **Tilføj et todo-element** - Klik "Add Todo" og indtast en opgave
2. **Marker som fuldført** - Sæt hak ved fuldførte emner
3. **Slet elementer** - Fjern todos, du ikke længere har brug for

### Overvåg din applikation
```bash
# Åbn Azure-portalen for dine ressourcer
azd monitor

# Vis applikationslogfiler
azd monitor --logs

# Vis målinger i realtid
azd monitor --live
```

## Trin 6: Foretag ændringer og udrul igen

Lad os lave en ændring og se, hvor nemt det er at opdatere:

### Ændr API'en
```bash
# Rediger API-koden
code src/api/src/routes/lists.js
```

Tilføj en brugerdefineret respons-header:
```javascript
// Find en route-handler og tilføj:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Udrul kun kodeændringerne
```bash
# Udrul kun applikationskoden (spring infrastrukturen over)
azd deploy

# Dette er meget hurtigere end 'azd up', da infrastrukturen allerede findes
```

## Trin 7: Administrer flere miljøer

Opret et staging-miljø for at teste ændringer før produktion:

```bash
# Opret et nyt staging-miljø
azd env new staging

# Udrul til staging-miljø
azd up

# Skift tilbage til dev-miljø
azd env select dev

# Vis alle miljøer
azd env list
```

### Miljøsammenligning
```bash
# Vis udviklingsmiljø
azd env select dev
azd show

# Vis staging-miljø
azd env select staging
azd show
```

## Trin 8: Ryd op i ressourcer

Når du er færdig med at eksperimentere, ryd op for at undgå løbende omkostninger:

```bash
# Slet alle Azure-ressourcer for det aktuelle miljø
azd down

# Tving sletning uden bekræftelse og fjern blødt slettede ressourcer permanent
azd down --force --purge

# Slet et specifikt miljø
azd env select staging
azd down --force --purge
```

## Hvad du har lært

Tillykke! Du har succesfuldt:
- ✅ Initialiseret et azd-projekt fra en skabelon
- ✅ Undersøgt projektstrukturen og nøglefiler
- ✅ Udrullet en full-stack-applikation til Azure
- ✅ Foretaget kodeændringer og genudrullet
- ✅ Administreret flere miljøer
- ✅ Ryddet op i ressourcer

## 🎯 Færdighedsvalideringsøvelser

### Øvelse 1: Udrul en anden skabelon (15 minutter)
**Mål**: Demonstrer mestring af azd init og udrulningsworkflow

```bash
# Prøv Python + MongoDB-stak
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Bekræft udrulning
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Ryd op
azd down --force --purge
```

**Succeskriterier:**
- [ ] Applikationen udrulles uden fejl
- [ ] Kan få adgang til applikationens URL i browseren
- [ ] Applikationen fungerer korrekt (tilføj/fjern todos)
- [ ] Ryddet op i alle ressourcer succesfuldt

### Øvelse 2: Tilpas konfiguration (20 minutter)
**Mål**: Øv konfiguration af miljøvariabler

```bash
cd my-first-azd-app

# Opret tilpasset miljø
azd env new custom-config

# Indstil tilpassede variabler
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Bekræft variabler
azd env get-values | grep APP_TITLE

# Udrul med tilpasset konfiguration
azd up
```

**Succeskriterier:**
- [ ] Tilpasset miljø oprettet succesfuldt
- [ ] Miljøvariabler sat og hentbare
- [ ] Applikationen udrulles med brugerdefineret konfiguration
- [ ] Kan verificere brugerdefinerede indstillinger i den udrullede app

### Øvelse 3: Multi-miljø workflow (25 minutter)
**Mål**: Mestre miljøstyring og udrulningsstrategier

```bash
# Opret udviklingsmiljø
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Noter udviklings-URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Opret staging-miljø
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Noter staging-URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Sammenlign miljøer
azd env list

# Test begge miljøer
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Ryd begge miljøer op
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Succeskriterier:**
- [ ] To miljøer oprettet med forskellige konfigurationer
- [ ] Begge miljøer udrullet succesfuldt
- [ ] Kan skifte mellem miljøer ved hjælp af `azd env select`
- [ ] Miljøvariabler adskiller sig mellem miljøerne
- [ ] Ryddet op i begge miljøer succesfuldt

## 📊 Din fremgang

**Tidsforbrug**: ~60-90 minutter  
**Erhvervede færdigheder**:
- ✅ Skabelonbaseret projektinitialisering
- ✅ Azure-ressourceprovisionering
- ✅ Applikationsudrulnings-workflows
- ✅ Miljøstyring
- ✅ Konfigurationsstyring
- ✅ Rensning af ressourcer og omkostningsstyring

**Næste niveau**: Du er klar til [Konfigurationsvejledning](configuration.md) for at lære avancerede konfigurationsmønstre!

## Fejlfinding - almindelige problemer

### Godkendelsesfejl
```bash
# Godkend igen med Azure
az login

# Bekræft adgang til abonnementet
az account show
```

### Udrulningsfejl
```bash
# Aktivér debug-logning
export AZD_DEBUG=true
azd up --debug

# Se applikationslogfiler i Azure
azd monitor --logs

# For Container Apps, brug Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikter i ressourcenavne
```bash
# Brug et unikt miljønavn
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/Netværksproblemer
```bash
# Kontroller, om porte er tilgængelige
netstat -an | grep :3000
netstat -an | grep :3100
```

## Næste skridt

Nu hvor du har gennemført dit første projekt, kan du udforske disse avancerede emner:

### 1. Tilpas infrastruktur
- [Infrastruktur som kode](../chapter-04-infrastructure/provisioning.md)
- [Tilføj databaser, storage og andre services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Opsæt CI/CD
- [Udrulningsvejledning](../chapter-04-infrastructure/deployment-guide.md) - Fuldstændige CI/CD-workflows
- [Dokumentation for Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipelinekonfiguration

### 3. Bedste praksis for produktion
- [Udrulningsvejledning](../chapter-04-infrastructure/deployment-guide.md) - Sikkerhed, ydeevne og overvågning

### 4. Udforsk flere skabeloner
```bash
# Gennemse skabeloner efter kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Prøv forskellige teknologistakke
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Yderligere ressourcer

### Læringsmaterialer
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Fællesskab & support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Skabeloner & eksempler
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Tillykke med at have gennemført dit første azd-projekt!** Du er nu klar til at bygge og udrulle fantastiske applikationer på Azure med tillid.

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 1 - Grundlag & Hurtig start
- **⬅️ Forrige**: [Installation og opsætning](installation.md)
- **➡️ Næste**: [Konfiguration](configuration.md)
- **🚀 Næste kapitel**: [Kapitel 2: AI-først udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Næste lektion**: [Udrulningsvejledning](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets originalsprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->