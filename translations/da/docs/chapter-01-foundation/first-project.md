# Dit første projekt - Praktisk vejledning

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 1 - Grundlag & Hurtig start
- **⬅️ Forrige**: [Installation & Setup](installation.md)
- **➡️ Næste**: [Configuration](configuration.md)
- **🚀 Næste kapitel**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Velkommen til dit første Azure Developer CLI-projekt! Denne omfattende praktiske vejledning giver en komplet gennemgang af at oprette, implementere og administrere en full-stack-applikation på Azure ved hjælp af azd. Du arbejder med en rigtig todo-applikation, der inkluderer et React-frontend, Node.js API-backend og MongoDB-database.

## Læringsmål

Ved at gennemføre denne vejledning vil du:
- Mestre azd-projektinitialiseringsarbejdsgangen ved hjælp af skabeloner
- Forstå Azure Developer CLI-projektstruktur og konfigurationsfiler
- Udføre komplet applikationsudrulning til Azure med infrastrukturprovisionering
- Implementere opdaterings- og genudrulningsstrategier for applikationer
- Administrere flere miljøer til udvikling og staging
- Anvende ressourcerensning og omkostningsstyringspraksis

## Læringsudbytte

Efter gennemførelse vil du kunne:
- Initialisere og konfigurere azd-projekter fra skabeloner selvstændigt
- Navigere og ændre azd-projektstrukturer effektivt
- Udrulle full-stack-applikationer til Azure med enkeltkommandoer
- Fejlfinde almindelige udrulningsproblemer og autentificeringsproblemer
- Administrere flere Azure-miljøer til forskellige udrulningsstadier
- Implementere kontinuerlige udrulningsarbejdsgange til applikationsopdateringer

## Kom godt i gang

### Tjekliste for forudsætninger
- ✅ Azure Developer CLI installeret ([Installation Guide](installation.md))
- ✅ Azure CLI installeret og autentificeret
- ✅ Git installeret på dit system
- ✅ Node.js 16+ (til denne vejledning)
- ✅ Visual Studio Code (anbefales)

### Bekræft din opsætning
```bash
# Kontroller azd-installationen
azd version
```
### Bekræft Azure-autentificering

```bash
az account show
```

### Kontroller Node.js-version
```bash
node --version
```

## Trin 1: Vælg og initialiser en skabelon

Lad os starte med en populær todo-applikationsskabelon, der inkluderer et React-frontend og Node.js API-backend.

```bash
# Gennemse tilgængelige skabeloner
azd template list

# Initialiser todo-app-skabelonen
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Følg instruktionerne:
# - Indtast et miljønavn: "dev"
# - Vælg et abonnement (hvis du har flere)
# - Vælg en region: "East US 2" (eller din foretrukne region)
```

### Hvad skete der lige?
- Downloadede skabelonkoden til din lokale mappe
- Oprettede en `azure.yaml`-fil med servicedefinitioner
- Konfigurerede infrastrukturkode i `infra/`-mappen
- Oprettede en miljøkonfiguration

## Trin 2: Undersøg projektstrukturen

Lad os se nærmere på, hvad azd oprettede for os:

```bash
# Vis projektstrukturen
tree /f   # Windows
# eller
find . -type f | head -20   # macOS/Linux
```

Du skulle gerne se:
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
# Vis infrastrukturkoden
head -30 infra/main.bicep
```

## Trin 3: Tilpas dit projekt (valgfrit)

Før udrulning kan du tilpasse applikationen:

### Rediger frontend
```bash
# Åbn React-app-komponenten
code src/web/src/App.tsx
```

Lav en enkel ændring:
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
# 1. Oprette Azure-ressourcer (App Service, Cosmos DB osv.)
# 2. Bygge din applikation
# 3. Udrulle til de oprettede ressourcer
# 4. Vise applikationens URL
```

### Hvad sker der under udrulningen?

`azd up`-kommandoen udfører disse trin:
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
Klik på den URL, der er angivet i udrulningsoutputtet, eller hent den når som helst:
```bash
# Hent applikationens endepunkter
azd show

# Åbn applikationen i din browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test Todo-appen
1. **Tilføj en todo-post** - Klik på "Add Todo" og indtast en opgave
2. **Markér som færdig** - Sæt kryds ved gennemførte elementer
3. **Slet elementer** - Fjern todos, du ikke længere har brug for

### Overvåg din applikation
```bash
# Åbn Azure-portalen for dine ressourcer
azd monitor

# Vis applikationslogfiler
azd monitor --logs

# Vis live-målinger
azd monitor --live
```

## Trin 6: Foretag ændringer og genudrul

Lad os lave en ændring og se, hvor nemt det er at opdatere:

### Rediger API'en
```bash
# Rediger API-koden
code src/api/src/routes/lists.js
```

Tilføj en brugerdefineret svarheader:
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
# Opret et nyt staging-miljø
azd env new staging

# Udrul til staging
azd up

# Skift tilbage til udviklingsmiljøet
azd env select dev

# Vis alle miljøer
azd env list
```

### Sammenligning af miljøer
```bash
# Vis udviklingsmiljø
azd env select dev
azd show

# Vis stagingmiljø
azd env select staging
azd show
```

## Trin 8: Ryd op i ressourcerne

Når du er færdig med at eksperimentere, ryd op for at undgå løbende omkostninger:

```bash
# Slet alle Azure-ressourcer for det aktuelle miljø
azd down

# Tving sletning uden bekræftelse og permanent sletning af blødslettede ressourcer
azd down --force --purge

# Slet et specifikt miljø
azd env select staging
azd down --force --purge
```

## Klassisk app vs. AI-drevet app: Samme arbejdsgang

Du har lige udrullet en traditionel webapplikation. Men hvad hvis du ønskede at udrulle en AI-drevet app i stedet—f.eks. en chatapplikation understøttet af Microsoft Foundry Models?

Den gode nyhed: **arbejdsgangen er identisk.**

| Trin | Klassisk Todo-app | AI Chat-app |
|------|-------------------|-------------|
| Initialiser | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentificer | `azd auth login` | `azd auth login` |
| Udrul | `azd up` | `azd up` |
| Overvåg | `azd monitor` | `azd monitor` |
| Ryd op | `azd down --force --purge` | `azd down --force --purge` |

Den eneste forskel er den **skabelon**, du starter fra. En AI-skabelon inkluderer yderligere infrastruktur (som en Microsoft Foundry Models-ressource eller et AI Search-indeks), men azd håndterer alt dette for dig. Du behøver ikke lære nye kommandoer, tage et andet værktøj i brug eller ændre den måde, du tænker på ved udrulning.

Dette er kerneprincippet for azd: **én arbejdsgang, enhver arbejdsopgave.** De færdigheder, du øvede i denne vejledning—initialisering, udrulning, overvågning, genudrulning og oprydning—gælder lige så godt for AI-applikationer og agenter.

---

## Hvad du har lært

Tillykke! Du har med succes:
- ✅ Initialiseret et azd-projekt fra en skabelon
- ✅ Undersøgt projektstrukturen og nøglefilerne
- ✅ Udrullet en full-stack-applikation til Azure
- ✅ Foretaget kodeændringer og genudrullet
- ✅ Administreret flere miljøer
- ✅ Ryddet op i ressourcerne

## 🎯 Øvelser til færdighedsvalidering

### Øvelse 1: Udrul en anden skabelon (15 minutter)
**Mål**: Demonstrere mestring af azd init og udrulningsarbejdsgangen

```bash
# Prøv Python + MongoDB-stakken
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Bekræft udrulning
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Ryd op
azd down --force --purge
```

**Succes-kriterier:**
- [ ] Applikationen udrulles uden fejl
- [ ] Kan få adgang til applikations-URL i browseren
- [ ] Applikationen fungerer korrekt (tilføj/fjern todos)
- [ ] Har med succes ryddet op i alle ressourcer

### Øvelse 2: Tilpas konfigurationen (20 minutter)
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

**Succes-kriterier:**
- [ ] Tilpasset miljø oprettet med succes
- [ ] Miljøvariabler sat og kan hentes
- [ ] Applikationen udrulles med tilpasset konfiguration
- [ ] Kan verificere tilpassede indstillinger i den udrullede app

### Øvelse 3: Arbejdsgang med flere miljøer (25 minutter)
**Mål**: Mestre miljøstyring og udrulningsstrategier

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

# Sammenlign miljøerne
azd env list

# Test begge miljøer
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Ryd begge op
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Succes-kriterier:**
- [ ] To miljøer oprettet med forskellige konfigurationer
- [ ] Begge miljøer udrullet med succes
- [ ] Kan skifte mellem miljøer ved hjælp af `azd env select`
- [ ] Miljøvariablerne er forskellige mellem miljøerne
- [ ] Har med succes ryddet op i begge miljøer

## 📊 Din fremgang

**Tidsforbrug**: ~60-90 minutter  
**Tilegnede færdigheder**:
- ✅ Skabelonbaseret projektinitialisering
- ✅ Provisionering af Azure-ressourcer
- ✅ Udrulningsarbejdsgange for applikationer
- ✅ Miljøstyring
- ✅ Konfigurationsstyring
- ✅ Rydning af ressourcer og omkostningsstyring

**Næste niveau**: Du er klar til [Configuration Guide](configuration.md) for at lære avancerede konfigurationsmønstre!

## Fejlfinding af almindelige problemer

### Autentificeringsfejl
```bash
# Genautentificer med Azure
az login

# Bekræft adgang til abonnement
az account show
```

### Udrulningsfejl
```bash
# Aktivér fejlsøgningslogning
export AZD_DEBUG=true
azd up --debug

# Vis applikationslogfiler i Azure
azd monitor --logs

# For Container Apps, brug Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikter i ressource-navne
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

Nu hvor du har gennemført dit første projekt, udforsk disse avancerede emner:

### 1. Tilpas infrastrukturen
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Tilføj databaser, storage og andre tjenester](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Opsæt CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Komplette CI/CD-arbejdsgange
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipelinekonfiguration

### 3. Bedste praksis til produktion
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Sikkerhed, ydeevne og overvågning

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

### Skabeloner og eksempler
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

Tillykke med at have gennemført dit første azd-projekt! Du er nu klar til at bygge og udrulle fantastiske applikationer på Azure med selvtillid.

---

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 1 - Grundlag & Hurtig start
- **⬅️ Forrige**: [Installation & Setup](installation.md)
- **➡️ Næste**: [Configuration](configuration.md)
- **🚀 Næste kapitel**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Næste lektion**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->