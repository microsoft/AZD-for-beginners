# Ditt första projekt - Praktisk handledning

**Kapitelnavigation:**
- **📚 Kursens startsida**: [AZD For Beginners](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 1 - Grund och snabbstart
- **⬅️ Föregående**: [Installation & Setup](installation.md)
- **➡️ Nästa**: [Configuration](configuration.md)
- **🚀 Nästa kapitel**: [Kapitel 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Välkommen till ditt första Azure Developer CLI-projekt! Denna omfattande praktiska handledning ger en komplett genomgång av att skapa, distribuera och hantera en fullstack-applikation på Azure med azd. Du kommer att arbeta med en verklig todo-applikation som inkluderar ett React-frontend, ett Node.js API-backend och en MongoDB-databas.

## Lärandemål

Genom att slutföra denna handledning kommer du att:
- Behärska azd-workflow för projektsinitiering med mallar
- Förstå Azure Developer CLI-projektstruktur och konfigurationsfiler
- Genomföra fullständig applikationsdistribution till Azure med infrastrukturprovisionering
- Implementera uppdaterings- och omdistributionsstrategier för applikationen
- Hantera flera miljöer för utveckling och staging
- Tillämpa rutiner för resursrengöring och kostnadshantering

## Läranderesultat

Efter slutförandet kommer du att kunna:
- Initiera och konfigurera azd-projekt från mallar självständigt
- Navigera och modifiera azd-projektstrukturer effektivt
- Distribuera fullstack-applikationer till Azure med enstaka kommandon
- Felsöka vanliga distributionsproblem och autentiseringsproblem
- Hantera flera Azure-miljöer för olika distributionssteg
- Implementera kontinuerliga distributionsarbetsflöden för applikationsuppdateringar

## Komma igång

### Förutsättningar - checklista
- ✅ Azure Developer CLI installerat ([Installation Guide](installation.md))
- ✅ AZD-autentisering slutförd med `azd auth login`
- ✅ Git installerat på din dator
- ✅ Node.js 16+ (för denna handledning)
- ✅ Visual Studio Code (rekommenderas)

Innan du fortsätter, kör valideringsskriptet från repositoryns rot:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifiera din installation
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

### Kontrollera Node.js-version
```bash
node --version
```

## Steg 1: Välj och initiera en mall

Låt oss börja med en populär todo-applikationsmall som inkluderar ett React-frontend och ett Node.js API-backend.

```bash
# Bläddra bland tillgängliga mallar
azd template list

# Initiera todo-appmallen
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Följ uppmaningarna:
# - Ange ett miljönamn: "dev"
# - Välj en prenumeration (om du har flera)
# - Välj en region: "East US 2" (eller din föredragna region)
```

### Vad hände precis?
- Hämtade mallkoden till din lokala katalog
- Skapade en `azure.yaml`-fil med servicedefinitioner
- Konfigurerade infrastrukturkod i katalogen `infra/`
- Skapade en miljökonfiguration

## Steg 2: Utforska projektstrukturen

Låt oss granska vad azd skapade åt oss:

```bash
# Visa projektstrukturen
tree /f   # Windows
# eller
find . -type f | head -20   # macOS/Linux
```

Du ska se:
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

**azure.yaml** - Kärnan i ditt azd-projekt:
```bash
# Visa projektkonfigurationen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# Visa koden för infrastrukturen
head -30 infra/main.bicep
```

## Steg 3: Anpassa ditt projekt (valfritt)

Innan distribution kan du anpassa applikationen:

### Ändra frontend
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

Nu till den spännande delen – distribuera allt till Azure!

```bash
# Distribuera infrastruktur och applikation
azd up

# Detta kommando kommer att:
# 1. Provisionera Azure-resurser (App Service, Cosmos DB osv.)
# 2. Bygga din applikation
# 3. Distribuera till de provisionerade resurserna
# 4. Visa applikationens URL
```

### Vad händer under distributionen?

Kommandot `azd up` utför dessa steg:
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

### Få åtkomst till din applikation
Klicka på URL:en som visas i distributionsutdata, eller hämta den när som helst:
```bash
# Hämta applikationens slutpunkter
azd show

# Öppna applikationen i din webbläsare
azd show --output json | jq -r '.services.web.endpoint'
```

### Testa todo-appen
1. **Lägg till en todo-post** - Klicka på "Add Todo" och skriv in en uppgift
2. **Markera som klar** - Kryssa av färdiga poster
3. **Ta bort poster** - Ta bort todos som du inte längre behöver

### Övervaka din applikation
```bash
# Öppna Azure-portalen för dina resurser
azd monitor

# Visa applikationsloggar
azd monitor --logs

# Visa realtidsmått
azd monitor --live
```

### ✅ Verifiera din distribution

Innan du går vidare, gå igenom den här snabba checklistan för att bekräfta att allt faktiskt fungerar—anta inte att "deploy succeeded" betyder "app fungerar":

```bash
# 1. Bekräfta att ändpunkten finns och är åtkomlig
azd show

# 2. Gör ett snabbtest av ändpunkten (förväntar sig HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Kontrollera hälsoändpunkten om din app har en
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Distributionen är verifierad när:**
- ✅ `azd show` listar en nåbar endpoint-URL
- ✅ URL:en öppnas i din webbläsare utan fel
- ✅ Kärnfunktioner fungerar (lägg till/markera/ta bort en todo)
- ✅ `azd monitor --logs` visar inkommande förfrågningar utan oväntade fel

Om någon kontroll misslyckas, gå till [Kapitel 7: Felsökning](../chapter-07-troubleshooting/README.md).

## Steg 6: Gör ändringar och distribuera igen

Låt oss göra en ändring och se hur enkelt det är att uppdatera:

### Ändra API:t
```bash
# Redigera API-koden
code src/api/src/routes/lists.js
```

Lägg till en anpassad responsheader:
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

Skapa en stagingmiljö för att testa ändringar innan produktion:

```bash
# Skapa en ny stagingmiljö
azd env new staging

# Distribuera till staging
azd up

# Byt tillbaka till dev-miljön
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

# Tvinga borttagning utan bekräftelse och ta bort mjukborttagna resurser permanent
azd down --force --purge

# Ta bort specifik miljö
azd env select staging
azd down --force --purge
```

## Klassisk app vs. AI-driven app: Samma arbetsflöde

Du just distribuerade en traditionell webbapplikation. Men vad om du vill distribuera en AI-drivriven app istället—till exempel en chattapplikation som använder Microsoft Foundry Models?

Den goda nyheten: **arbetsflödet är identiskt.**

| Steg | Klassisk Todo-app | AI-chattapp |
|------|-------------------|-------------|
| Initiera | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentisera | `azd auth login` | `azd auth login` |
| Distribuera | `azd up` | `azd up` |
| Övervaka | `azd monitor` | `azd monitor` |
| Rensa upp | `azd down --force --purge` | `azd down --force --purge` |

Den enda skillnaden är **mallen** du börjar från. En AI-mall inkluderar ytterligare infrastruktur (som en Microsoft Foundry Models-resurs eller ett AI Search-index), men azd hanterar allt detta åt dig. Du behöver inte lära dig nya kommandon, anta ett annat verktyg eller ändra hur du tänker kring distribution.

Detta är kärnprincipen för azd: **ett arbetsflöde, vilken arbetsbelastning som helst.** De färdigheter du övade i denna handledning—initiering, distribution, övervakning, omdistribution och rensning—gäller lika väl för AI-applikationer och agenter.

---

## Vad du har lärt dig

Gratulerar! Du har framgångsrikt:
- ✅ Initierat ett azd-projekt från en mall
- ✅ Utforskat projektstrukturen och viktiga filer
- ✅ Distribuerat en fullstack-applikation till Azure
- ✅ Gjort kodändringar och distribuerat igen
- ✅ Hanterat flera miljöer
- ✅ Rensat upp resurser

## 🎯 Övningar för färdighetsvalidering

### Övning 1: Distribuera en annan mall (15 minuter)
**Mål**: Visa behärskning av azd init och distributionsarbetsflödet

```bash
# Testa Python + MongoDB-stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifiera distribution
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Rensa upp
azd down --force --purge
```

**Framgångskriterier:**
- [ ] Applikationen distribueras utan fel
- [ ] Kan nå applikationens URL i webbläsaren
- [ ] Applikationen fungerar korrekt (lägg till/ta bort todos)
- [ ] Rensade framgångsrikt upp alla resurser

### Övning 2: Anpassa konfiguration (20 minuter)
**Mål**: Öva konfiguration av miljövariabler

```bash
cd my-first-azd-app

# Skapa anpassad miljö
azd env new custom-config

# Ställ in anpassade variabler
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifiera variabler
azd env get-values | grep APP_TITLE

# Distribuera med anpassad konfiguration
azd up
```

**Framgångskriterier:**
- [ ] Anpassad miljö skapad framgångsrikt
- [ ] Miljövariabler satta och hämtbara
- [ ] Applikationen distribueras med anpassad konfiguration
- [ ] Kan verifiera anpassade inställningar i den distribuerade appen

### Övning 3: Arbetsflöde med flera miljöer (25 minuter)
**Mål**: Behärska hantering av miljöer och distributionsstrategier

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

# Rensa upp båda miljöerna
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Framgångskriterier:**
- [ ] Två miljöer skapade med olika konfigurationer
- [ ] Båda miljöerna distribuerade framgångsrikt
- [ ] Kan växla mellan miljöer med `azd env select`
- [ ] Miljövariabler skiljer sig mellan miljöerna
- [ ] Rensat upp båda miljöerna framgångsrikt

## 📊 Dina framsteg

**Investerad tid**: ~60–90 minuter  
**Förvärvade färdigheter**:
- ✅ Mallbaserad projektsinitiering
- ✅ Azure-resursprovisionering
- ✅ Arbetsflöden för applikationsdistribution
- ✅ Miljöhantering
- ✅ Konfigurationshantering
- ✅ Resursrensning och kostnadshantering

**Nästa nivå**: Du är redo för [Konfigurationsguide](configuration.md) för att lära dig avancerade konfigurationsmönster!

## Felsökning av vanliga problem

### Autentiseringsfel
```bash
# Autentisera om med Azure
az login

# Verifiera prenumerationsåtkomst
az account show
```

### Distributionsfel
```bash
# Aktivera felsökningsloggning
export AZD_DEBUG=true
azd up --debug

# Visa programloggar i Azure
azd monitor --logs

# För Container Apps, använd Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikter i resursnamn
```bash
# Använd ett unikt namn för miljön
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

### 1. Anpassa infrastruktur
- [Infrastruktur som kod](../chapter-04-infrastructure/provisioning.md)
- [Lägg till databaser, lagring och andra tjänster](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Ställ in CI/CD
- [Distributionsguide](../chapter-04-infrastructure/deployment-guide.md) - Kompletta CI/CD-arbetsflöden
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipelinekonfiguration

### 3. Bästa praxis för produktion
- [Distributionsguide](../chapter-04-infrastructure/deployment-guide.md) - Säkerhet, prestanda och övervakning

### 4. Utforska fler mallar
```bash
# Bläddra bland mallar efter kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Prova olika teknologistackar
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ytterligare resurser

### Lärmaterial
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure välarkitekturerade ramverk](https://learn.microsoft.com/en-us/azure/well-architected/)

### Gemenskap & support
- [Azure Developer CLI på GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallar & exempel
- [Officiellt mallgalleri](https://azure.github.io/awesome-azd/)
- [Community-mallar](https://github.com/Azure-Samples/azd-templates)
- [Företagsmönster](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Grattis till att du slutfört ditt första azd-projekt!** Du är nu redo att bygga och distribuera fantastiska applikationer på Azure med självförtroende.

---

**Kapitelnavigation:**
- **📚 Kursens startsida**: [AZD For Beginners](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 1 - Grund och snabbstart
- **⬅️ Föregående**: [Installation & Setup](installation.md)
- **➡️ Nästa**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Nästa kapitel**: [Kapitel 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->