# AI Workshop Lab: Gør dine AI-løsninger AZD-udrulningsklare

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-første udvikling
- **⬅️ Forrige**: [AI Modeludrulning](ai-model-deployment.md)
- **➡️ Næste**: [Produktion AI bedste praksis](../chapter-08-production/production-ai-practices.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

## Workshop oversigt

Denne praktiske lab guider udviklere gennem processen med at tage en eksisterende AI-skabelon og implementere den ved hjælp af Azure Developer CLI (AZD). Du lærer væsentlige mønstre for AI-udrulning i produktion med Microsoft Foundry-tjenester.

> **Udgivelsesevaluering (2026-11-04):** AZD kommandovejledning og navne på prøvekonfigurationer blev kontrolleret i forhold til `azd` `1.37.2` udgivelsen og den linkede prøves aktuelle konfiguration. Dette er en dokumentationsgennemgang, ikke en validering af en live-udrulning. RAG laboratoriet kræver ikke agentudvidelsen; til agentvurderinger, brug den separate `azure.ai.evaluations` udvidelse og [nuværende evalueringsworkflow](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), ikke ældre agentkald.

**Varighed:** 2-3 timer  
**Niveau:** Mellem  
**Forudsætninger:** Grundlæggende Azure-kendskab, kendskab til AI/ML-koncepter

## 🎓 Læringsmål

Når du har gennemført denne workshop, vil du kunne:
- ✅ Udforske en eksisterende AI AZD-skabelon og planlægge konvertering af din egen applikation
- ✅ Konfigurere Microsoft Foundry-tjenester med AZD
- ✅ Implementere sikker håndtering af legitimationsoplysninger til AI-tjenester
- ✅ Udrulle en AI-referenceapplikation med overvågning
- ✅ Fejlsøge almindelige AI-udrulningsproblemer

## Forudsætninger

### Nødvendige værktøjer
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installeret
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installeret
- [Git](https://git-scm.com/) installeret
- Kodeeditor (helst VS Code)

Disse kommandoer bruger Bash-syntaks (inklusive linjefortsættelser og `grep`). På Windows, brug Git Bash/WSL eller oversæt til PowerShell. Installer også det sprog, pakkehåndtering og container-værktøjer, som er anført i [prøvens opsætning af lokal miljø](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure-ressourcer
- Azure-abonnement med rettigheder til ressourceudarbejdelse og rolle-tildelinger (Contributor alene kan ikke oprette RBAC-tildelinger; brug en godkendt rolleadministrator eller prøvens dokumenterede tilsvarende)
- Adgang til Microsoft Foundry Models-tjenester (eller mulighed for at anmode om adgang)
- Rettigheder til oprettelse af ressourcegruppe

### Viden-forudsætninger
- Grundlæggende forståelse for Azure-tjenester
- Kendskab til kommandolinjegrænseflader
- Grundlæggende AI/ML-koncepter (API’er, modeller, prompts)

## Labopsætning

### Trin 1: Miljøforberedelse

1. **Bekræft installation af værktøjer:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Hvis du arbejder på tværs af flere lejere, eller din abonnement ikke registreres automatisk, prøv igen med `azd auth login --tenant-id <tenant-id>`.

2. **Klon workshop repositories:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Forståelse af AZD-struktur for AI-applikationer

### Anatomi af en AI AZD-skabelon

Gennemgå nøglefiler i en AI-klar AZD-skabelon:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Den udtjekkede prøve kan ændre sig; `.azure/` vises efter initialisering af miljøet, ikke nødvendigvis i en frisk kloning. Undersøg det faktiske checkout i stedet for at oprette manglende mapper for at matche denne skitse.

### **Labøvelse 1.1: Udforsk konfigurationen**

1. **Undersøg azure.yaml-filen:**
```bash
cat azure.yaml
```

**Hvad du skal kigge efter:**
- Tjeneste-definitioner for AI-komponenter
- Miljøvariabelkortlægninger
- Værtskonfigurationer

2. **Gennemgå hoved.bicep infrastrukturen:**
```bash
cat infra/main.bicep
```

**Vigtige AI-mønstre at identificere:**
- Microsoft Foundry Models tjenesteudarbejdelse
- Integration med Azure AI Search
- Sikker nøglehåndtering
- Netværkssikkerhedskonfigurationer

### **Diskussionspunkt:** Hvorfor disse mønstre er vigtige for AI

- **Tjenesteafhængigheder**: AI-apps kræver ofte flere koordinerede tjenester
- **Sikkerhed**: API-nøgler og endepunkter skal håndteres sikkert
- **Skalerbarhed**: AI-arbejdsbelastninger har særlige skaleringsbehov
- **Omkostningsstyring**: AI-tjenester kan blive dyre, hvis ikke korrekt konfigureret

## Modul 2: Udrul din første AI-applikation

### Trin 2.1: Initialiser miljøet

1. **Opret et nyt AZD-miljø:**
```bash
azd env new myai-workshop
```

2. **Indstil nødvendige parametre:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Trin 2.2: Udrul infrastrukturen og applikationen

1. **Udrul med AZD:**
```bash
azd up
```

**Hvad sker der under `azd up`:**
- ✅ Opretter Microsoft Foundry Models-tjenesten
- ✅ Opretter Azure AI Search-tjenesten
- ✅ Sætter Azure Container Apps op til backend og den medfølgende frontend (prøvens standard)
- ✅ Konfigurerer netværk og sikkerhed
- ✅ Udruller applikationskode
- ✅ Sætter overvågning og logning op

2. **Overvåg udrulningsforløbet** og bemærk de oprettede ressourcer.

### Trin 2.3: Bekræft din udrulning

1. **Tjek de udrullede ressourcer:**
```bash
azd show
```

2. **Åbn den udrullede applikation:**
```bash
azd show
```

Åbn web-endepunktet vist i `azd show` outputtet.

3. **Test AI-funktionaliteten:**
   - Gå til webapplikationen
   - Prøv prøveforespørgsler
   - Bekræft at AI-svar fungerer

### **Labøvelse 2.1: Fejlsøgningstræning**

**Scenarie**: Din udrulning lykkedes, men AI’en svarer ikke.

**Almindelige problemer at tjekke:**
1. **Autentifikation**: Bekræft managed identity og rolle-tildelinger; tjek kun API-nøgler hvis du bevidst brugte nøglebaseret autentifikation
2. **Modeltilgængelighed**: Tjek om dit område understøtter modellen
3. **Netværksforbindelse**: Sikr at tjenester kan kommunikere
4. **RBAC tilladelser**: Bekræft at appen kan tilgå OpenAI

**Fejlsøgningskommandoer:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Tilpasning af AI-applikationer efter dine behov

### Trin 3.1: Ændr AI-konfigurationen

1. **Opdater OpenAI-modellen:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Tilføj ekstra AI-tjenester:**

Rediger `infra/main.bicep` for at tilføje Document Intelligence:

Følgende er et illustrativt eksempel, ikke en komplet skabelon. Prøven kan allerede oprette dokumentbehandlingstjenester: undersøg den aktuelle infrastruktur før du tilføjer dublerede ressourcer. Tilpasninger kræver sammenkobling af outputs, identiteter og applikationskonfiguration.

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Trin 3.2: Miljøspecifikke konfigurationer

**Bedste praksis**: Forskellige konfigurationer for udvikling kontra produktion.

1. **Opret et produktionsmiljø:**
```bash
azd env new myai-production
```

2. **Indstil produktionsspecifikke parametre:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Disse navne stammer fra prøvens [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json). `azd env set` opbevarer en værdi men gør ikke en variabel aktiv vilkårligt: skabelonen skal bruge den. Gennemgå prøvens [vejledning til netværksisolation](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) før offentlig adgang deaktiveres, og brug `azd up` til at anvende infrastruktursændringer. OpenAI SKU `S0` alene bestemmer ikke modelgennemløb; også modeludrulningstype og kapacitet er vigtige.

### **Labøvelse 3.1: Omkostningsoptimering**

**Udfordring**: Konfigurer skabelonen for omkostningseffektiv udvikling.

**Opgaver:**
1. Vælg det midlertidige workshopmiljø: `azd env select myai-workshop`.
2. Noter nuværende Search SKU og modelkapacitet fra `infra/main.parameters.json` og det valgte miljø.
3. Brug de understøttede input nedenfor, efter bekræftelse af model-/regionskvote:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Bekræft Search SKU og udrulningskapacitet i portalen og estimer forskel med prisberegneren. Forvent ikke at faktureringsdata opdateres med det samme.

**Succes kriterier:** Search bruger Basic, chatudrulningen har den anmodede understøttede kapacitet, og appen besvarer stadig et prøvespørgsmål. Kapacitet `10` er en rategrænseallokering, ikke en tokenprisrabat. Søgningstrinneskift kan være begrænset eller kræve nyoprettelse; eksperimenter ikke på produktionsressourcer. F0 er servicespecifik og er ikke en Azure OpenAI model SKU.

## Modul 4: Sikkerhed og bedste praksis i produktion

### Trin 4.1: Sikker håndtering af legitimationsoplysninger

**Nuværende udfordring**: Mange AI-apps hardcoder API-nøgler eller bruger usikker opbevaring.

**AZD løsning**: Managed Identity + Key Vault integration.

1. **Gennemgå sikkerhedskonfigurationen i din skabelon:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Kontroller at Managed Identity fungerer:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Trin 4.2: Netværkssikkerhed

1. **Aktivér private endpoints** ved at bruge prøvens understøttede netværkskonfiguration (hvis ikke allerede konfigureret).

For din egen skabelon viser dette illustrationseksempel OpenAI-endepunktsforbindelsen. Den har også brug for VNet, privat DNS-konfiguration og applikationsforbindelse; indsæt ikke det uændret i prøven, der allerede har private-endpoint moduler:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Trin 4.3: Overvågning og observerbarhed

1. **Konfigurer Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Aktivér prøvens Application Insights integration:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Prøvens instrumentering udsender telemetri; en vilkårlig `OPENAI_MONITOR_ENABLED` indstilling aktiverer ikke AI-målinger. Gennemgå spor efter modelkald, latenstid, fejl og tokenbrug, og undgå at optage følsomme prompts eller svar.

### **Labøvelse 4.1: Sikkerhedsrevision**

**Opgave**: Gennemgå din udrulning for sikker bedste praksis.

**Tjekliste:**
- [ ] Ingen hardcodede hemmeligheder i kode eller konfiguration
- [ ] Managed Identity brugt til service-til-service autentifikation
- [ ] Key Vault opbevarer følsomme konfigurationer
- [ ] Netværksadgang er korrekt begrænset
- [ ] Overvågning og logning er aktiveret

## Modul 5: Konvertering af din egen AI-applikation

### Trin 5.1: Vurderingsark

**Før du konverterer din app**, besvar disse spørgsmål:

1. **Applikationsarkitektur:**
   - Hvilke AI-tjenester bruger din app?
   - Hvilke compute-ressourcer har den brug for?
   - Kræver den en database?
   - Hvad er afhængighederne mellem tjenester?

2. **Sikkerhedskrav:**
   - Hvilke følsomme data håndterer din app?
   - Hvilke overholdelseskrav har du?
   - Har du brug for privat netværk?

3. **Skaleringskrav:**
   - Hvad er dit forventede belastningsniveau?
   - Har du brug for autoskalering?
   - Er der regionale krav?

### Trin 5.2: Opret din AZD-skabelon

**Følg dette mønster for at konvertere din app:**

**Kun grundstruktur:** Dette afsnit indeholder ikke kildekode til API/web-applikation, host-infrastruktur, modeludrulninger, identitet/RBAC eller et færdigt `main.parameters.json`. Ressourcegruppen med Bicep illustrerer modulopbygning; et typisk AZD-abonnement-adgangspunkt må oprette en ressourcegruppe og kalde det i det scope. Forvent ikke at `azd up` udruller en komplet app efter kun at have kopieret disse fragmenter. Til et kørbart udgangspunkt, fortsæt med at bruge RAG-skabelonen fra Modul 1.

1. **Opret grundstrukturen:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **Opret azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Opret infrastruktur-skabeloner:**

**infra/main.bicep** - Hovedskabelon:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI modul:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Labøvelse 5.1: Skabelonskabelsesudfordring**

**Udfordring**: Opret en AZD-skabelon til en AI-app til dokumentbehandling.

**Krav:**
- Microsoft Foundry Models til indholdsanalyse
- Document Intelligence til OCR
- Storage Account til dokumentuploads
- Funktionsapp til behandlingslogik
- Webapp til brugergrænseflade

**Bonuspoint:**
- Tilføj korrekt fejlhåndtering
- Inkluder omkostningsestimering
- Opsæt overvågningsdashboard

## Modul 6: Fejlfinding af almindelige problemer

### Almindelige udrulningsproblemer

#### Problem 1: OpenAI tjenestekvote overskredet
**Symptomer:** Udrulning fejler med kvotefejl
**Løsninger:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problem 2: Model ikke tilgængelig i region
**Symptomer:** AI-svar fejler eller fejl i modeludrulning
**Løsninger:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problem 3: Tilladelsesproblemer
**Symptomer:** 403 Forbidden fejl når AI-tjenester kaldes
**Løsninger:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Ydelsesproblemer

#### Problem 4: Langsomme AI-svar
**Undersøgelsestrin:**
1. Tjek Application Insights for ydelsesdata
2. Gennemgå OpenAI tjenestemålinger i Azure-portalen
3. Bekræft netværksforbindelse og latenstid

**Løsninger:**
- Implementer caching for almindelige forespørgsler
- Brug passende OpenAI-model til dit brugsscenarie
- Skaler applikationskopier først efter tjek af model RPM/TPM grænser; Azure OpenAI-udrulninger eksponerer ikke generisk database-stil ”read replica” indstilling

### **Labøvelse 6.1: Fejlsøgningsudfordring**

**Scenarie**: Din udrulning lykkedes, men applikationen returnerer 500 fejl.

**Fejlsøgningsopgaver:**
1. Kontroller applikationslogs
2. Bekræft tjenesteforbindelse
3. Test autentificering
4. Gennemgå konfiguration

**Værktøjer til brug:**
- `azd show` til implementeringsoversigt
- Azure portalen til detaljerede servicelogfiler
- Application Insights til applikationstelemtri

## Modul 7: Overvågning og Optimering

### Trin 7.1: Opsæt Omfattende Overvågning

1. **Opret brugerdefinerede dashboards:**

Naviger til Azure portalen og opret et dashboard med:
- OpenAI forespørgselsantal og latenstid
- Applikationsfejlrater
- Ressourceudnyttelse
- Omkostningssporing

2. **Opsæt alarmer:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Bekræft at komponenten udsender forespørgselstelemtri og tilføj en handlingsgruppe hvis notifikationer er nødvendige. Målingen er et antal, ikke en fejlfrekvens; en rateralarm kræver en passende forespørgsel og nævner.

### Trin 7.2: Omkostningsoptimering

1. **Analyser nuværende omkostninger:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Erstat datoplaceringerne. Forbrugs-API understøttelse varierer efter faktureringsaftale; brug Cost Management i portalen hvis brugsdetaljer ikke er tilgængelige. Omkostninger er forsinkede, ikke et realtidstest-vidne.

2. **Implementer omkostningskontroller:**
- Opsæt budgetalarmer
- Brug autoskalering
- Implementer forespørgsels-caching
- Overvåg tokenforbrug for OpenAI

### **Laboratorieøvelse 7.1: Ydeevneoptimering**

**Opgave**: Optimer din AI-applikation både for ydeevne og omkostninger.

**Mål at forbedre:**
- Reducer gennemsnitlig svartid med 20%
- Reducer månedlige omkostninger med 15%
- Definer en 99,9% tilgængeligheds-SLO og et målevindue (et kort laboratorie kan ikke demonstrere månedlig oppetid)

**Strategier at prøve:**
- Implementer respons-caching
- Optimer prompts for tokeneffektivitet
- Brug passende compute SKUs
- Opsæt korrekt autoskalering

## Endelig Udfordring: Implementering fra Start til Slut

### Udfordringsscenarie

Dette er en **valgfri arkitektur-/designudfordring**, ikke en leveret kørbar øvelse eller en produktionscertificering. Forslå en AI-drevet kundeservicechatbot og dokumenter hvilke krav der kræver yderligere implementering og beviser:

**Funktionelle krav:**
- Webgrænseflade til kundeinteraktioner
- Integration med Microsoft Foundry-modeller til svar
- Dokumentsøgningsfunktion ved hjælp af Azure AI Search
- Integration med eksisterende kundedatabase
- Flersproget support

**Ikke-funktionelle krav:**
- Håndter 1000 samtidige brugere
- 99,9% oppetids-SLA
- SOC 2 overholdelse
- Omkostninger under $500/måned
- Udrul til flere miljøer (dev, staging, prod)

Dette er hypotetiske interessentbegrænsninger, ikke simultant garanterede resultater. Definer forespørgselsrate, prompt-/output-størrelser og sessionsvarighed før estimering af omkostninger; 1.000 samtidige brugere fastlægger ikke en arbejdsbyrde eller beviser et $500-budget er muligt. SOC 2 er en organisatorisk revisionsresultat, ikke en switch aktiveret af en AZD-skabelon. Identificer kompromiser og afvis urealistiske begrænsninger med beviser.

### Implementeringstrin

1. **Design arkitekturen**
2. **Opret AZD-skabelonen**
3. **Implementer sikkerhedsforanstaltninger**
4. **Opsæt overvågning og alarmering**
5. **Opret implementeringspipelines**
6. **Dokumenter løsningen**

### Evalueringskriterier

- ✅ **Funktionalitet**: Er implementerede funktioner demonstreret og resterende huller eksplicitte?
- ✅ **Sikkerhed**: Er bedste praksis implementeret?
- ✅ **Skalerbarhed**: Kan det håndtere belastningen?
- ✅ **Vedligeholdelse**: Er koden og infrastrukturen velorganiseret?
- ✅ **Omkostninger**: Holder det sig inden for budgettet?

## Yderligere Ressourcer

### Microsoft Dokumentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Eksempelskabeloner
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Ressourcer
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Afslutningscheckpoint

Tillykke! Du har gennemført AI Workshop-laboratoriet. Du skulle nu kunne:

- ✅ Forklar hvordan man tilpasser en eksisterende AI-applikation til en AZD-skabelon
- ✅ Implementer og test en AI-referenceapplikation
- ✅ Implementer sikkerhedspraksis for AI-arbejdsmængder
- ✅ Overvåg og optimer AI-applikationsydelse
- ✅ Fejlfind almindelige implementeringsproblemer

**Ryd op:** Kør `azd env list`, vælg hvert engangsmiljø oprettet i dette laboratorium (`myai-workshop`, og hvis deployeret `myai-production`/`myai-quota-test`), og kør `azd down` i hvert. Gennemgå sletteplanen; sletning af et miljøs lokale konfiguration alene sletter ikke Azure-ressourcer. Undgå `--purge` medmindre du forstår irreversibel fjernelse af blødt slettede ressourcer.

### Næste Skridt
1. Anvend disse mønstre på dine egne AI-projekter
2. Bidrag med skabeloner tilbage til fællesskabet
3. Deltag i Microsoft Foundry Discord for løbende support
4. Udforsk avancerede emner som multi-region implementeringer

---

**Workshop Feedback**: Hjælp os med at forbedre denne workshop ved at dele dine erfaringer i [Microsoft Foundry Discord #Azure-kanalen](https://discord.gg/microsoft-azure).

---

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-Først Udvikling
- **⬅️ Forrige**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Næste**: [Production AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

**Har du brug for hjælp?** Deltag i vores fællesskab for support og diskussioner om AZD og AI-implementeringer.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->