# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Acest laborator practic ghidează dezvoltatorii prin procesul de preluare a unui șablon AI existent și implementarea acestuia folosind Azure Developer CLI (AZD). Veți învăța modele esențiale pentru implementări AI de producție folosind serviciile Microsoft Foundry.

> **Notă de validare (2026-03-25):** Acest workshop a fost revizuit cu `azd` `1.23.12`. Dacă instalația dvs. locală este mai veche, actualizați AZD înainte de a începe, astfel încât fluxul de autentificare, șabloanele și implementarea să corespundă pașilor de mai jos.

**Durată:** 2-3 ore  
**Nivel:** Intermediar  
**Condiții prealabile:** Cunoștințe de bază despre Azure, familiaritate cu conceptele AI/ML

## 🎓 Learning Objectives

La sfârșitul acestui workshop, veți putea:
- ✅ Converti o aplicație AI existentă pentru a folosi șabloane AZD
- ✅ Configura serviciile Microsoft Foundry cu AZD
- ✅ Implementa gestionarea securizată a acreditărilor pentru serviciile AI
- ✅ Implementa aplicații AI pregătite pentru producție cu monitorizare
- ✅ Depana probleme comune de implementare AI

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalat
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalat
- [Git](https://git-scm.com/) instalat
- Editor de cod (recomandat VS Code)

### Azure Resources
- Abonament Azure cu acces de tip contributor
- Acces la serviciile Microsoft Foundry Models (sau posibilitatea de a solicita acces)
- Permisiuni pentru crearea de grupuri de resurse

### Knowledge Prerequisites
- Înțelegere de bază a serviciilor Azure
- Familiaritate cu interfețele de linie de comandă
- Concepte de bază AI/ML (API-uri, modele, prompturi)

## Lab Setup

### Step 1: Environment Preparation

1. **Verificați instalările uneltelor:**
```bash
# Verificați instalarea AZD
azd version

# Verificați Azure CLI
az --version

# Conectați-vă la Azure pentru fluxurile de lucru AZD
azd auth login

# Conectați-vă la Azure CLI doar dacă intenționați să rulați comenzi az în timpul diagnosticului
az login
```

Dacă lucrați pe mai mulți tenanți sau abonamentul dvs. nu este detectat automat, încercați din nou cu `azd auth login --tenant-id <tenant-id>`.

2. **Clonați repository-ul workshop-ului:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Explorați fișierele cheie într-un șablon AZD pregătit pentru AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examinați fișierul azure.yaml:**
```bash
cat azure.yaml
```

**Ce să urmăriți:**
- Definiții de servicii pentru componentele AI
- Mapări ale variabilelor de mediu
- Configurații de gazdă

2. **Revizuiți main.bicep pentru infrastructură:**
```bash
cat infra/main.bicep
```

**Modele AI cheie de identificat:**
- Provisionarea serviciului Microsoft Foundry Models
- Integrarea Cognitive Search
- Gestionarea securizată a cheilor
- Configurații de securitate a rețelei

### **Discussion Point:** De ce contează aceste modele pentru AI

- **Dependențe de servicii**: Aplicațiile AI necesită adesea mai multe servicii coordonate
- **Securitate**: Cheile API și endpoint-urile trebuie gestionate în siguranță
- **Scalabilitate**: Workload-urile AI au cerințe unice de scalare
- **Managementul costurilor**: Serviciile AI pot fi costisitoare dacă nu sunt configurate corespunzător

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Creați un nou mediu AZD:**
```bash
azd env new myai-workshop
```

2. **Setați parametrii necesari:**
```bash
# Setează regiunea Azure preferată
azd env set AZURE_LOCATION eastus

# Opțional: Setează un model OpenAI specific
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Implementați cu AZD:**
```bash
azd up
```

**Ce se întâmplă în timpul `azd up`:**
- ✅ Provisionarea serviciului Microsoft Foundry Models
- ✅ Crearea serviciului Cognitive Search
- ✅ Configurarea App Service pentru aplicația web
- ✅ Configurarea rețelelor și securității
- ✅ Implementarea codului aplicației
- ✅ Configurarea monitorizării și logării

2. **Monitorizați progresul implementării** și observați resursele care sunt create.

### Step 2.3: Verify Your Deployment

1. **Verificați resursele implementate:**
```bash
azd show
```

2. **Deschideți aplicația implementată:**
```bash
azd show
```

Deschideți endpoint-ul web afișat în output-ul `azd show`.

3. **Testați funcționalitatea AI:**
   - Navigați la aplicația web
   - Încercați interogări de probă
   - Verificați că răspunsurile AI funcționează

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenariu**: Implementarea a reușit, dar AI nu răspunde.

**Probleme comune de verificat:**
1. **Chei API OpenAI**: Verificați dacă sunt setate corect
2. **Disponibilitatea modelului**: Verificați dacă regiunea dvs. suportă modelul
3. **Conectivitate de rețea**: Asigurați-vă că serviciile pot comunica
4. **Permisiuni RBAC**: Verificați dacă aplicația poate accesa OpenAI

**Comenzi pentru depanare:**
```bash
# Verificați variabilele de mediu
azd env get-values

# Vizualizați jurnalele de implementare
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verificați starea implementării OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Actualizați modelul OpenAI:**
```bash
# Schimbați la un alt model (dacă este disponibil în regiunea dvs.)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Relansați cu noua configurație
azd deploy
```

2. **Adăugați servicii AI suplimentare:**

Editați `infra/main.bicep` pentru a adăuga Document Intelligence:

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

### Step 3.2: Environment-Specific Configurations

**Best Practice**: Configurații diferite pentru development vs production.

1. **Creați un mediu de producție:**
```bash
azd env new myai-production
```

2. **Setați parametrii specifici producției:**
```bash
# În producție se folosesc de obicei SKU-uri mai avansate
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Activează funcționalități de securitate suplimentare
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Provocare**: Configurați șablonul pentru dezvoltare cost-eficientă.

**Sarcini:**
1. Identificați ce SKU-uri pot fi setate pe niveluri free/basic
2. Configurați variabilele de mediu pentru cost minim
3. Implementați și comparați costurile cu configurația de producție

**Indiciu de soluție:**
- Folosiți tier-ul F0 (free) pentru Cognitive Services când este posibil
- Folosiți tier-ul Basic pentru Search Service în dezvoltare
- Luați în considerare folosirea planului Consumption pentru Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Provocarea curentă**: Multe aplicații AI includ chei API hardcodate sau folosesc stocare nesigură.

**Soluția AZD**: Managed Identity + integrare Key Vault.

1. **Revizuiți configurația de securitate din șablonul dvs.:**
```bash
# Caută configurarea Key Vault și a identității gestionate.
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verificați că Managed Identity funcționează:**
```bash
# Verifică dacă aplicația web are configurația de identitate corectă
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Activați private endpoints** (dacă nu sunt deja configurate):

Adăugați în șablonul bicep:
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

### Step 4.3: Monitoring and Observability

1. **Configurați Application Insights:**
```bash
# Application Insights ar trebui să fie configurat automat
# Verificați configurația:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Configurați monitorizare specifică AI:**

Adăugați metrici personalizate pentru operațiuni AI:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Lab Exercise 4.1: Security Audit**

**Sarcină**: Revizuiți implementarea pentru bune practici de securitate.

**Checklist:**
- [ ] Nicio secretă hardcodată în cod sau configurație
- [ ] Managed Identity folosit pentru autentificare serviciu-către-serviciu
- [ ] Key Vault stochează configurația sensibilă
- [ ] Accesul la rețea este restricționat corespunzător
- [ ] Monitorizarea și logarea sunt activate

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Înainte de a converti aplicația**, răspundeți la aceste întrebări:

1. **Arhitectura aplicației:**
   - Ce servicii AI folosește aplicația dvs.?
   - Ce resurse de calcul are nevoie?
   - Necesită o bază de date?
   - Care sunt dependențele între servicii?

2. **Cerințe de securitate:**
   - Ce date sensibile procesează aplicația dvs.?
   - Ce cerințe de conformitate aveți?
   - Aveți nevoie de rețea privată?

3. **Cerințe de scalare:**
   - Care este încărcarea estimată?
   - Aveți nevoie de auto-scalare?
   - Există cerințe regionale?

### Step 5.2: Create Your AZD Template

**Urmăriți acest model pentru a vă converti aplicația:**

1. **Creați structura de bază:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inițializează șablonul AZD
azd init --template minimal
```

2. **Creați azure.yaml:**
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

3. **Creați șabloanele de infrastructură:**

**infra/main.bicep** - Șablonul principal:
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

**infra/modules/openai.bicep** - Modulul OpenAI:
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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab Exercise 5.1: Template Creation Challenge**

**Provocare**: Creați un șablon AZD pentru o aplicație AI de procesare a documentelor.

**Cerințe:**
- Microsoft Foundry Models pentru analiză de conținut
- Document Intelligence pentru OCR
- Storage Account pentru încărcarea documentelor
- Function App pentru logica de procesare
- Web app pentru interfața utilizator

**Puncte bonus:**
- Adăugați tratare corectă a erorilor
- Includeți estimare de cost
- Configurați dashboard-uri de monitorizare

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Simptome:** Implementarea eșuează cu eroare de cotă
**Soluții:**
```bash
# Verificați cotele curente
az cognitiveservices usage list --location eastus

# Solicitați creșterea cotelor sau încercați o regiune diferită
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Simptome:** Răspunsurile AI eșuează sau apar erori la implementarea modelului
**Soluții:**
```bash
# Verifică disponibilitatea modelului în funcție de regiune
az cognitiveservices model list --location eastus

# Actualizează la modelul disponibil
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Issue 3: Permission Issues
**Simptome:** Erori 403 Forbidden la apelarea serviciilor AI
**Soluții:**
```bash
# Verifică atribuirea rolurilor
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Adaugă rolurile lipsă
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Pași de investigație:**
1. Verificați Application Insights pentru metrici de performanță
2. Revizuiți metricile serviciului OpenAI în portalul Azure
3. Verificați conectivitatea rețelei și latența

**Soluții:**
- Implementați caching pentru interogările comune
- Folosiți modelul OpenAI potrivit pentru cazul dvs. de utilizare
- Luați în considerare replici de citire pentru scenarii cu trafic ridicat

### **Lab Exercise 6.1: Debugging Challenge**

**Scenariu**: Implementarea a reușit, dar aplicația returnează erori 500.

**Sarcini de depanare:**
1. Verificați logurile aplicației
2. Verificați conectivitatea serviciilor
3. Testați autentificarea
4. Revizuiți configurația

**Unelte de folosit:**
- `azd show` pentru overview-ul implementării
- Portalul Azure pentru loguri detaliate ale serviciilor
- Application Insights pentru telemetria aplicației

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Creați dashboard-uri personalizate:**

Navigați la portalul Azure și creați un dashboard cu:
- Numărul și latența cererilor OpenAI
- Ratele de eroare ale aplicației
- Utilizarea resurselor
- Urmărirea costurilor

2. **Configurați alerte:**
```bash
# Alertă pentru rată mare de erori
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analizați costurile curente:**
```bash
# Folosiți Azure CLI pentru a obține date despre costuri
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementați controale de cost:**
- Configurați alerte de buget
- Folosiți politici de autoscaling
- Implementați caching pentru cereri
- Monitorizați utilizarea tokenilor pentru OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Sarcină**: Optimizați aplicația AI atât pentru performanță, cât și pentru cost.

**Metrici de îmbunătățit:**
- Reduceți timpul mediu de răspuns cu 20%
- Reduceți costurile lunare cu 15%
- Mențineți uptime 99.9%

**Strategii de încercat:**
- Implementați caching de răspunsuri
- Optimizați prompturile pentru eficiență de tokeni
- Folosiți SKU-uri de computație adecvate
- Configurați autoscaling corect

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Sunteți responsabil pentru crearea unui chatbot pentru serviciul clienți, pregătit pentru producție, cu următoarele cerințe:

**Cerințe funcționale:**
- Interfață web pentru interacțiunea cu clienții
- Integrare cu Microsoft Foundry Models pentru generarea răspunsurilor
- Capacitate de căutare în documente folosind Cognitive Search
- Integrare cu baza de date existentă a clienților
- Suport multilingv

**Cerințe non-funcționale:**
- Gestionarea a 1000 de utilizatori concurenți
- SLA de uptime 99.9%
- Conformitate SOC 2
- Cost sub 500$/lună
- Implementare în multiple medii (dev, staging, prod)

### Implementation Steps

1. **Proiectați arhitectura**
2. **Creați șablonul AZD**
3. **Implementați măsuri de securitate**
4. **Configurați monitorizarea și alertarea**
5. **Creați pipeline-uri de implementare**
6. **Documentați soluția**

### Evaluation Criteria

- ✅ **Funcționalitate**: Respectă toate cerințele?
- ✅ **Securitate**: Sunt implementate bunele practici?
- ✅ **Scalabilitate**: Poate gestiona încărcarea?
- ✅ **Mentenabilitate**: Codul și infrastructura sunt bine organizate?
- ✅ **Cost**: Respectă bugetul?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Aplicație Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Ghid rapid pentru Aplicația Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Resurse comunitare
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificat de finalizare

Felicitări! Ai finalizat laboratorul AI Workshop. Ar trebui acum să poți:

- ✅ Converti aplicațiile AI existente în șabloane AZD
- ✅ Implementa aplicații AI pregătite pentru producție
- ✅ Implementa cele mai bune practici de securitate pentru sarcinile de lucru AI
- ✅ Monitoriza și optimiza performanța aplicațiilor AI
- ✅ Depana probleme comune de implementare

### Pașii următori
1. Aplică aceste modele proiectelor tale AI
2. Contribuie cu șabloane înapoi comunității
3. Alătură-te Discord-ului Microsoft Foundry pentru suport continuu
4. Explorează subiecte avansate, cum ar fi implementările multi-regiune

---

**Feedback despre workshop**: Ajută-ne să îmbunătățim acest atelier împărtășind experiența ta în [canalul Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare axată pe AI
- **⬅️ Anterior**: [Implementarea modelului AI](ai-model-deployment.md)
- **➡️ Următor**: [Cele mai bune practici pentru AI în producție](production-ai-practices.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

**Ai nevoie de ajutor?** Alătură-te comunității noastre pentru suport și discuții despre AZD și implementările AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări eronate care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->