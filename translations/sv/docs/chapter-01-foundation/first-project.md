# Ditt första projekt - Praktisk handledning

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 1 - Grund & Snabbstart
- **⬅️ Föregående**: [Installation och uppsättning](installation.md)
- **➡️ Nästa**: [Konfiguration](configuration.md)
- **🚀 Nästa kapitel**: [Kapitel 2: AI-först utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Välkommen till ditt första Azure Developer CLI-projekt! Denna omfattande praktiska handledning ger en komplett genomgång av att skapa, distribuera och hantera en fullstack-applikation på Azure med azd. Du kommer att arbeta med en riktig todo-applikation som inkluderar en React-frontend, Node.js API-backend och MongoDB-databas.

## Inlärningsmål

Genom att slutföra denna handledning kommer du att:
- Bemästra azd:s arbetsflöde för projektinitiering med mallar
- Förstå Azure Developer CLI-projektstruktur och konfigurationsfiler
- Utföra fullständig distribution av applikationen till Azure med provisionering av infrastruktur
- Implementera uppdateringar av applikationen och strategier för omdistribution
- Hantera flera miljöer för utveckling och staging
- Tillämpa rutiner för rensning av resurser och kostnadshantering

## Läranderesultat

När du är klar kommer du att kunna:
- Initiera och konfigurera azd-projekt från mallar självständigt
- Navigera och modifiera azd-projektstrukturer effektivt
- Distribuera fullstack-applikationer till Azure med enkla kommandon
- Felsöka vanliga distributionsproblem och autentiseringsproblem
- Hantera flera Azure-miljöer för olika distributionsstadier
- Implementera kontinuerliga distributionsarbetsflöden för applikationsuppdateringar

## Komma igång

### Förutsättningar (checklista)
- ✅ Azure Developer CLI installerad ([Installationsguide](installation.md))
- ✅ AZD-autentisering slutförd med `azd auth login`
- ✅ Git installerat på ditt system
- ✅ Node.js 16+ (för denna handledning)
- ✅ Visual Studio Code (rekommenderas)

Innan du fortsätter, kör setupsvalidatorn från repositoryns rot:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifiera din uppsättning
```bash
# Kontrollera azd-installation
azd version

# Kontrollera AZD-autentisering
azd auth login --check-status
```

### Verifiera valfri Azure CLI-autentisering

```bash
az account show
```

### Kontrollera Node.js-versionen
```bash
node --version
```

## Steg 1: Välj och initiera en mall

Vi börjar med en populär todo-applikationsmall som inkluderar en React-frontend och en Node.js API-backend.

```bash
# Bläddra bland tillgängliga mallar
azd template list

# Initiera todo-appens mall
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Följ anvisningarna:
# - Ange ett miljönamn: "dev"
# - Välj en prenumeration (om du har flera)
# - Välj en region: "East US 2" (eller din föredragna region)
```

### Vad hände precis?
- Laddade ner mallkoden till din lokala katalog
- Skapade en `azure.yaml`-fil med tjänstedefinitioner
- Konfigurerade infrastrukturkod i `infra/`-katalogen
- Skapade en miljökonfiguration

## Steg 2: Utforska projektstrukturen

Låt oss granska vad azd skapade åt oss:

```bash
# Visa projektstrukturen
tree /f   # Windows
# eller
find . -type f | head -20   # macOS/Linux
```

Du bör se:
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

### Viktiga filer att förstå

**azure.yaml** - Hjärtat i ditt azd-projekt:
```bash
# Visa projektkonfigurationen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# Visa infrastrukturkoden
head -30 infra/main.bicep
```

## Steg 3: Anpassa ditt projekt (valfritt)

Innan du distribuerar kan du anpassa applikationen:

### Ändra frontenden
```bash
# Öppna React-appkomponenten
code src/web/src/App.tsx
```

Gör en enkel ändring:
```typescript
// Hitta titeln och ändra den
<h1>My Awesome Todo App</h1>
```

### Konfigurera miljövariabler
```bash
# Ställ in anpassade miljövariabler
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Visa alla miljövariabler
azd env get-values
```

## Steg 4: Distribuera till Azure

Nu till den spännande delen - distribuera allt till Azure!

```bash
# Distribuera infrastruktur och applikation
azd up

# Detta kommando kommer att:
# 1. Provisionera Azure-resurser (App Service, Cosmos DB, osv.)
# 2. Bygga din applikation
# 3. Distribuera till de provisionerade resurserna
# 4. Visa applikationens URL
```

### Vad händer under distributionen?

`azd up`-kommandot utför dessa steg:
1. **Provision** (`azd provision`) - Skapar Azure-resurser
2. **Package** - Bygger din applikationskod
3. **Deploy** (`azd deploy`) - Distribuerar kod till Azure-resurser

### Förväntad utdata
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Steg 5: Testa din applikation

### Åtkomst till din applikation
Klicka på URL:en som gavs i distributionsutdata, eller hämta den när som helst:
```bash
# Hämta applikationens slutpunkter
azd show

# Öppna applikationen i din webbläsare
azd show --output json | jq -r '.services.web.endpoint'
```

### Testa todo-appen
1. **Lägg till en todo-post** - Klicka på "Lägg till Todo" och ange en uppgift
2. **Markera som slutförd** - Bocka av slutförda uppgifter
3. **Ta bort uppgifter** - Ta bort todos du inte längre behöver

### Övervaka din applikation
```bash
# Öppna Azure-portalen för dina resurser
azd monitor

# Visa applikationsloggar
azd monitor --logs

# Visa realtidsmått
azd monitor --live
```

## Steg 6: Gör ändringar och distribuera igen

Låt oss göra en ändring och se hur enkelt det är att uppdatera:

### Ändra API:et
```bash
# Redigera API-koden
code src/api/src/routes/lists.js
```

Lägg till en anpassad respons-header:
```javascript
// Hitta en routehanterare och lägg till:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Distribuera bara kodändringarna
```bash
# Distribuera endast applikationskoden (hoppa över infrastrukturen)
azd deploy

# Detta är mycket snabbare än 'azd up' eftersom infrastrukturen redan finns
```

## Steg 7: Hantera flera miljöer

Skapa en staging-miljö för att testa ändringar innan produktion:

```bash
# Skapa en ny stagingmiljö
azd env new staging

# Distribuera till stagingmiljön
azd up

# Byt tillbaka till utvecklingsmiljön
azd env select dev

# Lista alla miljöer
azd env list
```

### Miljöjämförelse
```bash
# Visa utvecklingsmiljö
azd env select dev
azd show

# Visa stagingmiljö
azd env select staging
azd show
```

## Steg 8: Rensa upp resurser

När du är klar med experimenten, rensa upp för att undvika löpande kostnader:

```bash
# Ta bort alla Azure-resurser för den aktuella miljön
azd down

# Tvinga borttagning utan bekräftelse och rensa mjukborttagna resurser
azd down --force --purge

# Ta bort en specifik miljö
azd env select staging
azd down --force --purge
```

## Klassisk app vs. AI-drivna app: Samma arbetsflöde

Du har precis distribuerat en traditionell webbapplikation. Men vad händer om du istället vill distribuera en AI-drivna app—till exempel en chattapplikation som stöds av Microsoft Foundry Models?

Den goda nyheten: **arbetsflödet är identiskt.**

| Steg | Klassisk Todo-app | AI-chattapp |
|------|-------------------|-------------|
| Initiera | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentisera | `azd auth login` | `azd auth login` |
| Distribuera | `azd up` | `azd up` |
| Övervaka | `azd monitor` | `azd monitor` |
| Rensa upp | `azd down --force --purge` | `azd down --force --purge` |

Den enda skillnaden är den **mall** du börjar från. En AI-mall inkluderar ytterligare infrastruktur (som en Microsoft Foundry Models-resurs eller ett AI Search-index), men azd hanterar allt detta åt dig. Du behöver inte lära dig nya kommandon, anta ett annat verktyg eller ändra hur du tänker kring distribution.

Detta är kärnprincipen för azd: **ett arbetsflöde, vilken arbetsbelastning som helst.** De färdigheter du övade på i denna handledning—initiering, distribution, övervakning, omdistribution och rensning—gäller lika väl för AI-applikationer och agenter.

---

## Vad du har lärt dig

Grattis! Du har framgångsrikt:
- ✅ Initierat ett azd-projekt från en mall
- ✅ Utforskat projektstrukturen och viktiga filer
- ✅ Distribuerat en fullstack-applikation till Azure
- ✅ Gjort kodändringar och distribuerat igen
- ✅ Hanterat flera miljöer
- ✅ Rensat upp resurser

## 🎯 Färdighetsvalideringsövningar

### Övning 1: Distribuera en annan mall (15 minuter)
**Mål**: Visa att du behärskar azd init och distributionsarbetsflödet

```bash
# Testa Python + MongoDB-stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifiera driftsättning
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Rensa upp
azd down --force --purge
```

**Godkännandekriterier:**
- [ ] Applikationen distribueras utan fel
- [ ] Kan komma åt applikationens URL i webbläsaren
- [ ] Applikationen fungerar korrekt (lägg till/ta bort todos)
- [ ] Rensade upp alla resurser framgångsrikt

### Övning 2: Anpassa konfigurationen (20 minuter)
**Mål**: Öva på konfiguration av miljövariabler

```bash
cd my-first-azd-app

# Skapa en anpassad miljö
azd env new custom-config

# Ange anpassade variabler
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifiera variabler
azd env get-values | grep APP_TITLE

# Distribuera med anpassad konfiguration
azd up
```

**Godkännandekriterier:**
- [ ] Anpassad miljö skapades framgångsrikt
- [ ] Miljövariabler inställda och åtkomliga
- [ ] Applikationen distribueras med anpassad konfiguration
- [ ] Kan verifiera anpassade inställningar i den distribuerade appen

### Övning 3: Arbetsflöde för flera miljöer (25 minuter)
**Mål**: Bemästra hantering av miljöer och distributionsstrategier

```bash
# Skapa utvecklingsmiljö
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Notera utvecklings-URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Skapa stagingmiljö
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Notera staging-URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Jämför miljöerna
azd env list

# Testa båda miljöerna
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Rensa upp båda
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Godkännandekriterier:**
- [ ] Två miljöer skapade med olika konfigurationer
- [ ] Båda miljöerna distribuerades framgångsrikt
- [ ] Kan växla mellan miljöer med `azd env select`
- [ ] Miljövariabler skiljer sig åt mellan miljöerna
- [ ] Rensade upp båda miljöerna framgångsrikt

## 📊 Dina framsteg

**Tid investerad**: ~60-90 minuter  
**Förvärvade färdigheter**:
- ✅ Mallbaserad projektinitiering
- ✅ Provisionering av Azure-resurser
- ✅ Arbetsflöden för applikationsdistribution
- ✅ Hantering av miljöer
- ✅ Konfigurationshantering
- ✅ Rensning av resurser och kostnadshantering

**Nästa nivå**: Du är redo för [Konfigurationsguide](configuration.md) för att lära dig avancerade konfigurationsmönster!

## Felsökning av vanliga problem

### Autentiseringsfel
```bash
# Autentisera om med Azure
az login

# Verifiera åtkomst till prenumerationen
az account show
```

### Distributionsfel
```bash
# Aktivera felsökningsloggning
export AZD_DEBUG=true
azd up --debug

# Visa applikationsloggar i Azure
azd monitor --logs

# För Container Apps, använd Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikter i resursnamn
```bash
# Använd ett unikt miljönamn
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/nätverksproblem
```bash
# Kontrollera om portar är tillgängliga
netstat -an | grep :3000
netstat -an | grep :3100
```

## Nästa steg

Nu när du har slutfört ditt första projekt, utforska dessa avancerade ämnen:

### 1. Anpassa infrastrukturen
- [Infrastruktur som kod](../chapter-04-infrastructure/provisioning.md)
- [Lägg till databaser, lagring och andra tjänster](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Sätt upp CI/CD
- [Distribueringsguide](../chapter-04-infrastructure/deployment-guide.md) - Kompletta CI/CD-arbetsflöden
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguration av pipeline

### 3. Bästa praxis för produktion
- [Distribueringsguide](../chapter-04-infrastructure/deployment-guide.md) - Säkerhet, prestanda och övervakning

### 4. Utforska fler mallar
```bash
# Bläddra bland mallar efter kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Prova olika teknikstackar
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ytterligare resurser

### Lärmaterial
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community och support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallar och exempel
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Grattis till att du slutfört ditt första azd-projekt!** Du är nu redo att skapa och distribuera fantastiska applikationer på Azure med självförtroende.

---

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 1 - Grund & Snabbstart
- **⬅️ Föregående**: [Installation och uppsättning](installation.md)
- **➡️ Nästa**: [Konfiguration](configuration.md)
- **🚀 Nästa kapitel**: [Kapitel 2: AI-först utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Nästa lektion**: [Distribueringsguide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, observera att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungsspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->