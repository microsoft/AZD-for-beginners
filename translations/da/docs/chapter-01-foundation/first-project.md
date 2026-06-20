# Dit første projekt - Praktisk vejledning

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 1 - Grundlag & Kom godt i gang
- **⬅️ Forrige**: [Installation og opsætning](installation.md)
- **➡️ Næste**: [Konfiguration](configuration.md)
- **🚀 Næste kapitel**: [Kapitel 2: AI-først udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Velkommen til dit første Azure Developer CLI-projekt! Denne omfattende praktiske vejledning giver en komplet gennemgang af oprettelse, udrulning og administration af en full-stack-applikation på Azure ved hjælp af azd. Du vil arbejde med en rigtig todo-applikation, der inkluderer en React-frontend, Node.js API-backend og MongoDB-database.

## Læringsmål

Ved at gennemføre denne vejledning vil du:
- Beherske azd-projektinitialiseringsworkflow ved hjælp af skabeloner
- Forstå Azure Developer CLI-projektets struktur og konfigurationsfiler
- Udføre komplet applikationsudrulning til Azure med infrastrukturprovisionering
- Implementere applikationsopdateringer og genudrulningsstrategier
- Administrere flere miljøer til udvikling og staging
- Anvende praksis for oprydning af ressourcer og omkostningsstyring

## Læringsresultater

Efter afslutning vil du kunne:
- Initialisere og konfigurere azd-projekter fra skabeloner uafhængigt
- Navigere og ændre azd-projektstrukturer effektivt
- Udrulle full-stack-applikationer til Azure med enkelte kommandoer
- Fejlsøge almindelige udrulningsproblemer og autentificeringsproblemer
- Administrere flere Azure-miljøer til forskellige udrulningsstadier
- Implementere kontinuerlige udrulningsarbejdsgange til applikationsopdateringer

## Kom i gang

### Tjekliste for forudsætninger
- ✅ Azure Developer CLI installeret ([Installationsvejledning](installation.md))
- ✅ AZD-godkendelse gennemført med `azd auth login`
- ✅ Git installeret på dit system
- ✅ Node.js 16+ (til denne vejledning)
- ✅ Visual Studio Code (anbefalet)

Før du fortsætter, kør opsætningsvalidatoren fra repository-roden:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Bekræft din opsætning
```bash
# Kontroller azd-installation
azd version

# Kontroller AZD-autentificering
azd auth login --check-status
```

### Bekræft valgfri Azure CLI-godkendelse

```bash
az account show
```

### Tjek Node.js-version
```bash
node --version
```

## Trin 1: Vælg og initialiser en skabelon

Lad os starte med en populær todo-applikationsskabelon, der inkluderer en React-frontend og Node.js API-backend.

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
- Oprettede en `azure.yaml`-fil med servicedefinitioner
- Opsatte infrastrukturkode i `infra/`-mappen
- Oprettede en miljøkonfiguration

## Trin 2: Udforsk projektstrukturen

Lad os gennemgå, hvad azd har oprettet for os:

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

### Nøglefiler at forstå

**azure.yaml** - Hjertet i dit azd-projekt:
```bash
# Se projektkonfigurationen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# Se infrastrukturkoden
head -30 infra/main.bicep
```

## Trin 3: Tilpas dit projekt (valgfrit)

Før du fortsætter med udrulning, kan du tilpasse applikationen:

### Rediger frontend
```bash
# Åbn React-appkomponenten
code src/web/src/App.tsx
```

Foretag en simpel ændring:
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

Nu til den spændende del - udrul alt til Azure!

```bash
# Udrul infrastruktur og applikation
azd up

# Denne kommando vil:
# 1. Provisionere Azure-ressourcer (App Service, Cosmos DB osv.)
# 2. Bygge din applikation
# 3. Udrulle til de provisionerede ressourcer
# 4. Vise applikationens URL
```

### Hvad sker der under udrulningen?

Den `azd up`-kommando udfører disse trin:
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
Klik på den URL, der vises i udrulningsoutputtet, eller hent den når som helst:
```bash
# Hent applikationens slutpunkter
azd show

# Åbn applikationen i din browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test Todo-appen
1. **Add a todo item** - Klik på "Tilføj Todo" og indtast en opgave
2. **Mark as complete** - Sæt kryds ved færdige elementer
3. **Delete items** - Fjern todos, du ikke længere har brug for

### Overvåg din applikation
```bash
# Åbn Azure-portalen for dine ressourcer
azd monitor

# Vis applikationslogfiler
azd monitor --logs

# Vis live-målinger
azd monitor --live
```

### ✅ Bekræft din udrulning

Før du går videre, gennemgå denne hurtige tjekliste for at bekræfte, at alt rent faktisk virker—antag ikke, at "udrulning lykkedes" betyder "appen virker":

```bash
# 1. Bekræft, at endpointet findes og kan nås
azd show

# 2. Udfør en smoke-test af endpointet (forventer HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Tjek health-endpointet, hvis din app udstiller et
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Udrulningen er verificeret når:**
- ✅ `azd show` viser en tilgængelig endpoint-URL
- ✅ URL'en åbnes i din browser uden fejl
- ✅ Kernefunktioner virker (tilføj/fuldfør/slet en todo)
- ✅ `azd monitor --logs` viser ankommende forespørgsler uden uventede fejl

Hvis nogen kontrol fejler, gå til [Kapitel 7: Fejlfinding](../chapter-07-troubleshooting/README.md).

## Trin 6: Foretag ændringer og genudrul

Lad os foretage en ændring og se, hvor nemt det er at opdatere:

### Rediger API'en
```bash
# Rediger API-koden
code src/api/src/routes/lists.js
```

Tilføj en brugerdefineret responsheader:
```javascript
// Find en rutehåndterer og tilføj:
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
# Opret et nyt stagingmiljø
azd env new staging

# Udrul til stagingmiljø
azd up

# Skift tilbage til udviklingsmiljø
azd env select dev

# Vis alle miljøer
azd env list
```

### Sammenligning af miljøer
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

# Tving sletning uden bekræftelse og permanent fjernelse af blødt slettede ressourcer
azd down --force --purge

# Slet et specifikt miljø
azd env select staging
azd down --force --purge
```

## Klassisk app vs. AI-drevet app: Samme arbejdsgang

Du har lige udrullet en traditionel webapplikation. Men hvad nu hvis du i stedet ville udrulle en AI-drevet app—f.eks. en chatapplikation drevet af Microsoft Foundry Models?

Den gode nyhed: **arbejdsgangen er identisk.**

| Trin | Klassisk Todo-app | AI-chatapp |
|------|-------------------|------------|
| Initialiser | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentificer | `azd auth login` | `azd auth login` |
| Udrul | `azd up` | `azd up` |
| Overvåg | `azd monitor` | `azd monitor` |
| Ryd op | `azd down --force --purge` | `azd down --force --purge` |

Den eneste forskel er den **skabelon**, du starter fra. En AI-skabelon inkluderer yderligere infrastruktur (som en Microsoft Foundry Models-ressource eller et AI Search-index), men azd håndterer det hele for dig. Du behøver ikke at lære nye kommandoer, tage et andet værktøj i brug eller ændre, hvordan du tænker udrulning.

Dette er det grundlæggende princip i azd: **én arbejdsgang, enhver arbejdsbelastning.** De færdigheder, du øvede i denne vejledning—initialisering, udrulning, overvågning, genudrulning og oprydning—gælder i lige så høj grad for AI-applikationer og agenter.

---

## Hvad du har lært

Tillykke! Du har med succes:
- ✅ Initialiseret et azd-projekt fra en skabelon
- ✅ Udforsket projektstrukturen og nøglefiler
- ✅ Udrullet en full-stack-applikation til Azure
- ✅ Foretaget kodeændringer og genudrullet
- ✅ Administreret flere miljøer
- ✅ Ryddet op i ressourcer

## 🎯 Færdighedsvalideringsøvelser

### Øvelse 1: Udrul en anden skabelon (15 minutter)
**Goal**: Demonstrate mastery of azd init and deployment workflow

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

**Kriterier for succes:**
- [ ] Applikationen udrulles uden fejl
- [ ] Kan få adgang til applikations-URL'en i browseren
- [ ] Applikationen fungerer korrekt (tilføj/fjern todos)
- [ ] Alle ressourcer er ryddet op succesfuldt

### Øvelse 2: Tilpas konfiguration (20 minutter)
**Goal**: Practice environment variable configuration

```bash
cd my-first-azd-app

# Opret brugerdefineret miljø
azd env new custom-config

# Indstil brugerdefinerede variabler
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Bekræft variabler
azd env get-values | grep APP_TITLE

# Udrul med brugerdefineret konfiguration
azd up
```

**Kriterier for succes:**
- [ ] Brugerdefineret miljø oprettet succesfuldt
- [ ] Miljøvariabler sat og hentbare
- [ ] Applikationen udrulles med brugerdefineret konfiguration
- [ ] Kan verificere brugerdefinerede indstillinger i den udrullede app

### Øvelse 3: Multi-miljø arbejdsgang (25 minutter)
**Goal**: Master environment management and deployment strategies

```bash
# Opret udviklingsmiljø
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Notér udviklings-URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Opret staging-miljø
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Notér staging-URL
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

**Kriterier for succes:**
- [ ] To miljøer oprettet med forskellige konfigurationer
- [ ] Begge miljøer udrullet succesfuldt
- [ ] Kan skifte mellem miljøer ved hjælp af `azd env select`
- [ ] Miljøvariabler adskiller sig mellem miljøerne
- [ ] Begge miljøer er ryddet op succesfuldt

## 📊 Din fremgang

**Tidsforbrug**: ~60-90 minutter  
**Erhvervede færdigheder**:
- ✅ Skabelonbaseret projektinitialisering
- ✅ Azure-ressourceprovisionering
- ✅ Applikationsudrulningsarbejdsgange
- ✅ Miljøstyring
- ✅ Konfigurationsstyring
- ✅ Oprydning af ressourcer og omkostningsstyring

**Next Level**: Du er klar til [Konfigurationsvejledning](configuration.md) for at lære avancerede konfigurationsmønstre!

## Fejlfinding af almindelige problemer

### Autentificeringsfejl
```bash
# Autentificer igen med Azure
az login

# Bekræft adgang til abonnement
az account show
```

### Udrulningsfejl
```bash
# Aktivér fejlsøgningslogning
export AZD_DEBUG=true
azd up --debug

# Se applikationslogfiler i Azure
azd monitor --logs

# For Container Apps, brug Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Ressourcenavnkonflikter
```bash
# Brug et unikt miljønavn
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/netværksproblemer
```bash
# Kontroller, om porte er tilgængelige
netstat -an | grep :3000
netstat -an | grep :3100
```

## Næste skridt

Nu hvor du har gennemført dit første projekt, kan du udforske disse avancerede emner:

### 1. Tilpas infrastruktur
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Opsæt CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Complete CI/CD workflows
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipeline configuration

### 3. Bedste praksis til produktion
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Security, performance, and monitoring

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

### Læringsmateriale
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Fællesskab og support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Skabeloner & eksempler
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Tillykke med at have gennemført dit første azd-projekt!** Du er nu klar til at bygge og udrulle fantastiske applikationer på Azure med selvtillid.

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 1 - Grundlag & Kom godt i gang
- **⬅️ Forrige**: [Installation og opsætning](installation.md)
- **➡️ Næste**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Næste kapitel**: [Kapitel 2: AI-først udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->