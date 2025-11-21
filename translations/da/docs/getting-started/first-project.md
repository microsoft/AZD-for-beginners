<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-21T09:33:52+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "da"
}
-->
# Dit Første Projekt - Praktisk Vejledning

**Kapiteloversigt:**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 1 - Fundament & Hurtig Start
- **⬅️ Forrige**: [Installation & Opsætning](installation.md)
- **➡️ Næste**: [Konfiguration](configuration.md)
- **🚀 Næste Kapitel**: [Kapitel 2: AI-First Udvikling](../microsoft-foundry/microsoft-foundry-integration.md)

## Introduktion

Velkommen til dit første Azure Developer CLI-projekt! Denne omfattende praktiske vejledning giver dig en komplet gennemgang af, hvordan du opretter, implementerer og administrerer en full-stack applikation på Azure ved hjælp af azd. Du vil arbejde med en rigtig todo-applikation, der inkluderer en React-frontend, Node.js API-backend og en MongoDB-database.

## Læringsmål

Ved at gennemføre denne vejledning vil du:
- Mestre azd-projektinitialiseringsworkflowet ved hjælp af skabeloner
- Forstå Azure Developer CLI-projektstruktur og konfigurationsfiler
- Udføre komplet applikationsimplementering til Azure med infrastrukturprovisionering
- Implementere applikationsopdateringer og genimplementeringsstrategier
- Administrere flere miljøer til udvikling og staging
- Anvende ressourcerydelse og omkostningsstyringspraksis

## Læringsresultater

Når du er færdig, vil du kunne:
- Selvstændigt initialisere og konfigurere azd-projekter fra skabeloner
- Navigere og ændre azd-projektstrukturer effektivt
- Implementere full-stack applikationer til Azure med enkle kommandoer
- Fejlsøge almindelige implementeringsproblemer og autentificeringsproblemer
- Administrere flere Azure-miljøer til forskellige implementeringsstadier
- Implementere kontinuerlige implementeringsworkflows til applikationsopdateringer

## Kom godt i gang

### Tjekliste for Forudsætninger
- ✅ Azure Developer CLI installeret ([Installationsvejledning](installation.md))
- ✅ Azure CLI installeret og autentificeret
- ✅ Git installeret på dit system
- ✅ Node.js 16+ (til denne vejledning)
- ✅ Visual Studio Code (anbefales)

### Verificer Din Opsætning
```bash
# Kontroller azd installation
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
# Gennemse tilgængelige skabeloner
azd template list

# Initialiser todo app-skabelonen
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Følg vejledningen:
# - Indtast et miljønavn: "dev"
# - Vælg et abonnement (hvis du har flere)
# - Vælg en region: "East US 2" (eller din foretrukne region)
```

### Hvad Skete Der Lige?
- Skabelonkoden blev downloadet til din lokale mappe
- En `azure.yaml`-fil med servicedefinitioner blev oprettet
- Infrastrukturkode blev oprettet i `infra/`-mappen
- Et miljøkonfigurationssetup blev oprettet

## Trin 2: Udforsk Projektstrukturen

Lad os undersøge, hvad azd har oprettet for os:

```bash
# Se projektstrukturen
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

### Vigtige Filer at Forstå

**azure.yaml** - Hjertet i dit azd-projekt:
```bash
# Se projektkonfigurationen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# Se infrastrukturen kode
head -30 infra/main.bicep
```

## Trin 3: Tilpas Dit Projekt (Valgfrit)

Før implementering kan du tilpasse applikationen:

### Ændr Frontenden
```bash
# Åbn React-appkomponenten
code src/web/src/App.tsx
```

Foretag en simpel ændring:
```typescript
// Find titlen og ændr den
<h1>My Awesome Todo App</h1>
```

### Konfigurer Miljøvariabler
```bash
# Indstil brugerdefinerede miljøvariabler
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Vis alle miljøvariabler
azd env get-values
```

## Trin 4: Implementer til Azure

Nu til den spændende del - implementer alt til Azure!

```bash
# Udrul infrastruktur og applikation
azd up

# Denne kommando vil:
# 1. Klargøre Azure-ressourcer (App Service, Cosmos DB, osv.)
# 2. Bygge din applikation
# 3. Udrulle til de klargjorte ressourcer
# 4. Vise applikationens URL
```

### Hvad Sker Der Under Implementeringen?

Kommandoen `azd up` udfører disse trin:
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
Klik på URL'en, der blev givet i implementeringsoutputtet, eller hent den når som helst:
```bash
# Hent applikationsendepunkter
azd show

# Åbn applikationen i din browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test Todo-Appen
1. **Tilføj en todo-opgave** - Klik på "Add Todo" og indtast en opgave
2. **Markér som fuldført** - Afkryds fuldførte opgaver
3. **Slet opgaver** - Fjern todos, du ikke længere har brug for

### Overvåg Din Applikation
```bash
# Åbn Azure-portalen for dine ressourcer
azd monitor

# Vis applikationslogfiler
azd logs
```

## Trin 6: Foretag Ændringer og Genimplementer

Lad os foretage en ændring og se, hvor nemt det er at opdatere:

### Ændr API'en
```bash
# Rediger API-koden
code src/api/src/routes/lists.js
```

Tilføj en brugerdefineret svarheader:
```javascript
// Find en rutehåndtering og tilføj:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementer Kun Kodeændringer
```bash
# Udrul kun applikationskoden (spring infrastruktur over)
azd deploy

# Dette er meget hurtigere end 'azd up', da infrastrukturen allerede eksisterer
```

## Trin 7: Administrer Flere Miljøer

Opret et staging-miljø for at teste ændringer før produktion:

```bash
# Opret et nyt staging-miljø
azd env new staging

# Udrul til staging
azd up

# Skift tilbage til udviklingsmiljø
azd env select dev

# List alle miljøer
azd env list
```

### Miljøsammenligning
```bash
# Vis udviklingsmiljø
azd env select dev
azd show

# Vis stagingmiljø
azd env select staging
azd show
```

## Trin 8: Ryd Op i Ressourcer

Når du er færdig med at eksperimentere, skal du rydde op for at undgå løbende omkostninger:

```bash
# Slet alle Azure-ressourcer for nuværende miljø
azd down

# Tvangsslet uden bekræftelse og fjern blødt-slettede ressourcer
azd down --force --purge

# Slet specifikt miljø
azd env select staging
azd down --force --purge
```

## Hvad Har Du Lært

Tillykke! Du har med succes:
- ✅ Initialiseret et azd-projekt fra en skabelon
- ✅ Udforsket projektstrukturen og nøglefiler
- ✅ Implementeret en full-stack applikation til Azure
- ✅ Foretaget kodeændringer og genimplementeret
- ✅ Administreret flere miljøer
- ✅ Ryddet op i ressourcer

## 🎯 Øvelser til Færdighedsvalidering

### Øvelse 1: Implementer en Anden Skabelon (15 minutter)
**Mål**: Demonstrer mestring af azd init og implementeringsworkflow

```bash
# Prøv Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Bekræft udrulning
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Ryd op
azd down --force --purge
```

**Succes Kriterier:**
- [ ] Applikationen implementeres uden fejl
- [ ] Kan få adgang til applikations-URL i browseren
- [ ] Applikationen fungerer korrekt (tilføj/fjern todos)
- [ ] Alle ressourcer er ryddet op med succes

### Øvelse 2: Tilpas Konfiguration (20 minutter)
**Mål**: Øv dig i konfiguration af miljøvariabler

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

**Succes Kriterier:**
- [ ] Brugerdefineret miljø oprettet med succes
- [ ] Miljøvariabler sat og tilgængelige
- [ ] Applikationen implementeres med brugerdefineret konfiguration
- [ ] Kan verificere brugerdefinerede indstillinger i den implementerede app

### Øvelse 3: Workflow for Flere Miljøer (25 minutter)
**Mål**: Mestre miljøstyring og implementeringsstrategier

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

# Ryd op i begge
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Succes Kriterier:**
- [ ] To miljøer oprettet med forskellige konfigurationer
- [ ] Begge miljøer implementeret med succes
- [ ] Kan skifte mellem miljøer ved hjælp af `azd env select`
- [ ] Miljøvariabler er forskellige mellem miljøerne
- [ ] Begge miljøer er ryddet op med succes

## 📊 Din Fremgang

**Tidsforbrug**: ~60-90 minutter  
**Tilegnede Færdigheder**:
- ✅ Skabelonbaseret projektinitialisering
- ✅ Azure-ressourceprovisionering
- ✅ Applikationsimplementeringsworkflows
- ✅ Miljøstyring
- ✅ Konfigurationsstyring
- ✅ Ressourcerydelse og omkostningsstyring

**Næste Niveau**: Du er klar til [Konfigurationsvejledning](configuration.md) for at lære avancerede konfigurationsmønstre!

## Fejlfinding af Almindelige Problemer

### Autentificeringsfejl
```bash
# Godkend igen med Azure
az login

# Bekræft abonnementadgang
az account show
```

### Implementeringsfejl
```bash
# Aktiver fejlfinding logning
export AZD_DEBUG=true
azd up --debug

# Se detaljerede logfiler
azd logs --service api
azd logs --service web
```

### Ressourcenavnekonflikter
```bash
# Brug et unikt miljønavn
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/Netværksproblemer
```bash
# Kontroller om porte er tilgængelige
netstat -an | grep :3000
netstat -an | grep :3100
```

## Næste Skridt

Nu hvor du har gennemført dit første projekt, kan du udforske disse avancerede emner:

### 1. Tilpas Infrastruktur
- [Infrastruktur som kode](../deployment/provisioning.md)
- [Tilføj databaser, lager og andre tjenester](../deployment/provisioning.md#adding-services)

### 2. Opsæt CI/CD
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Produktions Bedste Praksis
- [Sikkerhedskonfigurationer](../deployment/best-practices.md#security)
- [Ydelsesoptimering](../deployment/best-practices.md#performance)
- [Overvågning og logning](../deployment/best-practices.md#monitoring)

### 4. Udforsk Flere Skabeloner
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

**Kapiteloversigt:**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 1 - Fundament & Hurtig Start
- **⬅️ Forrige**: [Installation & Opsætning](installation.md)
- **➡️ Næste**: [Konfiguration](configuration.md)
- **🚀 Næste Kapitel**: [Kapitel 2: AI-First Udvikling](../microsoft-foundry/microsoft-foundry-integration.md)
- **Næste Lektion**: [Implementeringsvejledning](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->