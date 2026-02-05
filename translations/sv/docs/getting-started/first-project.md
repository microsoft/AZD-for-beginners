# Ditt Första Projekt - Praktisk Guide

**Kapitelnavigation:**
- **📚 Kurshem**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 1 - Grundläggande & Snabbstart
- **⬅️ Föregående**: [Installation & Inställning](installation.md)
- **➡️ Nästa**: [Konfiguration](configuration.md)
- **🚀 Nästa Kapitel**: [Kapitel 2: AI-Driven Utveckling](../microsoft-foundry/microsoft-foundry-integration.md)

## Introduktion

Välkommen till ditt första Azure Developer CLI-projekt! Denna omfattande praktiska guide ger dig en komplett genomgång av att skapa, distribuera och hantera en fullstack-applikation på Azure med azd. Du kommer att arbeta med en riktig todo-applikation som inkluderar en React-frontend, Node.js API-backend och MongoDB-databas.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Behärska arbetsflödet för azd-projektinitiering med hjälp av mallar
- Förstå strukturen och konfigurationsfilerna för Azure Developer CLI-projekt
- Utföra komplett applikationsdistribution till Azure med infrastrukturförberedelse
- Implementera applikationsuppdateringar och omdistributionsstrategier
- Hantera flera miljöer för utveckling och staging
- Tillämpa resursrensning och kostnadshanteringsmetoder

## Läranderesultat

Efter att ha slutfört guiden kommer du att kunna:
- Självständigt initiera och konfigurera azd-projekt från mallar
- Navigera och modifiera azd-projektstrukturer effektivt
- Distribuera fullstack-applikationer till Azure med enkla kommandon
- Felsöka vanliga distributionsproblem och autentiseringsfel
- Hantera flera Azure-miljöer för olika distributionsstadier
- Implementera kontinuerliga distributionsarbetsflöden för applikationsuppdateringar

## Kom igång

### Förutsättningar Checklista
- ✅ Azure Developer CLI installerad ([Installationsguide](installation.md))
- ✅ Azure CLI installerad och autentiserad
- ✅ Git installerat på ditt system
- ✅ Node.js 16+ (för denna guide)
- ✅ Visual Studio Code (rekommenderas)

### Verifiera Din Installation
```bash
# Kontrollera azd-installation
azd version
```
### Verifiera Azure-autentisering

```bash
az account show
```

### Kontrollera Node.js-version
```bash
node --version
```

## Steg 1: Välj och Initiera en Mall

Låt oss börja med en populär todo-applikationsmall som inkluderar en React-frontend och Node.js API-backend.

```bash
# Bläddra bland tillgängliga mallar
azd template list

# Initiera todo-appmallen
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Följ anvisningarna:
# - Ange ett miljönamn: "dev"
# - Välj en prenumeration (om du har flera)
# - Välj en region: "East US 2" (eller din föredragna region)
```

### Vad Händer Här?
- Mallkoden laddades ner till din lokala katalog
- En `azure.yaml`-fil skapades med tjänstedefinitioner
- Infrastrukturkod sattes upp i katalogen `infra/`
- En miljökonfiguration skapades

## Steg 2: Utforska Projektstrukturen

Låt oss undersöka vad azd har skapat åt oss:

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

### Viktiga Filer att Förstå

**azure.yaml** - Kärnan i ditt azd-projekt:
```bash
# Visa projektkonfigurationen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# Visa infrastrukturen kod
head -30 infra/main.bicep
```

## Steg 3: Anpassa Ditt Projekt (Valfritt)

Innan distribution kan du anpassa applikationen:

### Modifiera Frontend
```bash
# Öppna React-appkomponenten
code src/web/src/App.tsx
```

Gör en enkel ändring:
```typescript
// Hitta titeln och ändra den
<h1>My Awesome Todo App</h1>
```

### Konfigurera Miljövariabler
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
# 1. Tillhandahålla Azure-resurser (App Service, Cosmos DB, etc.)
# 2. Bygga din applikation
# 3. Distribuera till de tillhandahållna resurserna
# 4. Visa applikationens URL
```

### Vad Händer Under Distributionen?

Kommandot `azd up` utför följande steg:
1. **Provision** (`azd provision`) - Skapar Azure-resurser
2. **Package** - Bygger din applikationskod
3. **Deploy** (`azd deploy`) - Distribuerar kod till Azure-resurser

### Förväntad Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Steg 5: Testa Din Applikation

### Åtkomst till Din Applikation
Klicka på URL:en som tillhandahålls i distributionsoutputen, eller hämta den när som helst:
```bash
# Hämta applikationens slutpunkter
azd show

# Öppna applikationen i din webbläsare
azd show --output json | jq -r '.services.web.endpoint'
```

### Testa Todo-Appen
1. **Lägg till en todo** - Klicka på "Add Todo" och ange en uppgift
2. **Markera som klar** - Kryssa för slutförda uppgifter
3. **Ta bort uppgifter** - Ta bort todos du inte längre behöver

### Övervaka Din Applikation
```bash
# Öppna Azure-portalen för dina resurser
azd monitor

# Visa applikationsloggar
azd logs
```

## Steg 6: Gör Ändringar och Omdistribuera

Låt oss göra en ändring och se hur enkelt det är att uppdatera:

### Modifiera API
```bash
# Redigera API-koden
code src/api/src/routes/lists.js
```

Lägg till en anpassad svarshuvud:
```javascript
// Hitta en routhanterare och lägg till:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Distribuera Endast Kodändringar
```bash
# Distribuera endast applikationskoden (hoppa över infrastrukturen)
azd deploy

# Detta är mycket snabbare än 'azd up' eftersom infrastrukturen redan finns
```

## Steg 7: Hantera Flera Miljöer

Skapa en staging-miljö för att testa ändringar innan produktion:

```bash
# Skapa en ny staging-miljö
azd env new staging

# Distribuera till staging
azd up

# Växla tillbaka till utvecklingsmiljön
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

## Steg 8: Rensa Resurser

När du är klar med att experimentera, rensa upp för att undvika löpande kostnader:

```bash
# Ta bort alla Azure-resurser för nuvarande miljö
azd down

# Tvinga borttagning utan bekräftelse och rensa mjukraderade resurser
azd down --force --purge

# Ta bort specifik miljö
azd env select staging
azd down --force --purge
```

## Vad Du Har Lärt Dig

Grattis! Du har framgångsrikt:
- ✅ Initierat ett azd-projekt från en mall
- ✅ Utforskat projektstrukturen och viktiga filer
- ✅ Distribuerat en fullstack-applikation till Azure
- ✅ Gjort kodändringar och omdistribuerat
- ✅ Hanterat flera miljöer
- ✅ Rensat resurser

## 🎯 Färdighetsvalideringsövningar

### Övning 1: Distribuera en Annan Mall (15 minuter)
**Mål**: Visa att du behärskar arbetsflödet för azd init och distribution

```bash
# Prova Python + MongoDB-stack
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
- [ ] Kan komma åt applikations-URL i webbläsaren
- [ ] Applikationen fungerar korrekt (lägg till/ta bort todos)
- [ ] Alla resurser har framgångsrikt rensats

### Övning 2: Anpassa Konfiguration (20 minuter)
**Mål**: Öva på att konfigurera miljövariabler

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
- [ ] Miljövariabler inställda och åtkomliga
- [ ] Applikationen distribueras med anpassad konfiguration
- [ ] Kan verifiera anpassade inställningar i distribuerad app

### Övning 3: Arbetsflöde för Flera Miljöer (25 minuter)
**Mål**: Behärska miljöhantering och distributionsstrategier

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

# Jämför miljöer
azd env list

# Testa båda miljöerna
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Rensa upp båda
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Framgångskriterier:**
- [ ] Två miljöer skapade med olika konfigurationer
- [ ] Båda miljöerna distribuerade framgångsrikt
- [ ] Kan växla mellan miljöer med `azd env select`
- [ ] Miljövariabler skiljer sig mellan miljöerna
- [ ] Framgångsrikt rensat båda miljöerna

## 📊 Din Framgång

**Tid Investering**: ~60-90 minuter  
**Färdigheter Förvärvade**:
- ✅ Mallbaserad projektinitiering
- ✅ Azure-resursförberedelse
- ✅ Applikationsdistributionsarbetsflöden
- ✅ Miljöhantering
- ✅ Konfigurationshantering
- ✅ Resursrensning och kostnadshantering

**Nästa Nivå**: Du är redo för [Konfigurationsguide](configuration.md) för att lära dig avancerade konfigurationsmönster!

## Felsökning Vanliga Problem

### Autentiseringsfel
```bash
# Återautentisera med Azure
az login

# Verifiera prenumerationsåtkomst
az account show
```

### Distributionsfel
```bash
# Aktivera felsökningsloggning
export AZD_DEBUG=true
azd up --debug

# Visa detaljerade loggar
azd logs --service api
azd logs --service web
```

### Resursnamnskonflikter
```bash
# Använd ett unikt miljönamn
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/Nätverksproblem
```bash
# Kontrollera om portar är tillgängliga
netstat -an | grep :3000
netstat -an | grep :3100
```

## Nästa Steg

Nu när du har slutfört ditt första projekt, utforska dessa avancerade ämnen:

### 1. Anpassa Infrastruktur
- [Infrastruktur som Kod](../deployment/provisioning.md)
- [Lägg till databaser, lagring och andra tjänster](../deployment/provisioning.md#adding-services)

### 2. Ställ In CI/CD
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Produktionsbästa Praxis
- [Säkerhetskonfigurationer](../deployment/best-practices.md#security)
- [Prestandaoptimering](../deployment/best-practices.md#performance)
- [Övervakning och loggning](../deployment/best-practices.md#monitoring)

### 4. Utforska Fler Mallar
```bash
# Bläddra bland mallar efter kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Prova olika teknologiska stackar
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Ytterligare Resurser

### Lärmaterial
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallar & Exempel
- [Officiell Mallgalleri](https://azure.github.io/awesome-azd/)
- [Community Mallar](https://github.com/Azure-Samples/azd-templates)
- [Företagsmönster](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Grattis till att ha slutfört ditt första azd-projekt!** Du är nu redo att bygga och distribuera fantastiska applikationer på Azure med självförtroende.

---

**Kapitelnavigation:**
- **📚 Kurshem**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 1 - Grundläggande & Snabbstart
- **⬅️ Föregående**: [Installation & Inställning](installation.md)
- **➡️ Nästa**: [Konfiguration](configuration.md)
- **🚀 Nästa Kapitel**: [Kapitel 2: AI-Driven Utveckling](../microsoft-foundry/microsoft-foundry-integration.md)
- **Nästa Lektion**: [Distributionsguide](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->