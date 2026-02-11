# Laborator AI: Făcând soluțiile tale AI implementabile cu AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

Acest laborator practic ghidează dezvoltatorii prin procesul de a prelua un șablon AI existent și de a-l implementa folosind Azure Developer CLI (AZD). Veți învăța tipare esențiale pentru implementările AI de producție folosind serviciile Microsoft Foundry.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

By the end of this workshop, you will be able to:
- ✅ Convert an existing AI application to use AZD templates
- ✅ Configure Microsoft Foundry services with AZD
- ✅ Implement secure credential management for AI services
- ✅ Deploy production-ready AI applications with monitoring
- ✅ Troubleshoot common AI deployment issues

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalat
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalat
- [Git](https://git-scm.com/) instalat
- Editor de cod (VS Code recomandat)

### Azure Resources
- Abonament Azure cu acces de contributor
- Acces la serviciile Azure OpenAI (sau posibilitatea de a solicita acces)
- Permisiuni pentru crearea de grupuri de resurse

### Knowledge Prerequisites
- Înțelegere de bază a serviciilor Azure
- Familiaritate cu interfețele de linie de comandă
- Concepte de bază AI/ML (API-uri, modele, prompturi)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Verificați instalarea AZD
azd version

# Verificați Azure CLI
az --version

# Conectați-vă la Azure
az login
azd auth login
```

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Explorați fișierele cheie dintr-un șablon AZD pregătit pentru AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Exercițiu de laborator 1.1: Explorați configurația**

1. **Examinați fișierul azure.yaml:**
```bash
cat azure.yaml
```

**Ce să căutați:**
- Definiții de servicii pentru componente AI
- Mapări ale variabilelor de mediu
- Configurații de găzduire

2. **Revizuiți infrastructura main.bicep:**
```bash
cat infra/main.bicep
```

**Tipare AI cheie de identificat:**
- Provizionarea serviciului Azure OpenAI
- Integrarea Cognitive Search
- Gestionarea sigură a cheilor
- Configurații de securitate a rețelei

### **Punct de discuție:** De ce contează aceste tipare pentru AI

- **Dependențe de servicii**: Aplicațiile AI necesită adesea mai multe servicii coordonate
- **Securitate**: Cheile API și endpoint-urile necesită gestionare sigură
- **Scalabilitate**: Sarcinile AI au cerințe unice de scalare
- **Managementul costurilor**: Serviciile AI pot fi costisitoare dacă nu sunt configurate corect

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# Setați regiunea Azure preferată
azd env set AZURE_LOCATION eastus

# Opțional: Setați un model OpenAI specific
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**Ce se întâmplă în timpul `azd up`:**
- ✅ Provizionează serviciul Azure OpenAI
- ✅ Creează serviciul Cognitive Search
- ✅ Configurează App Service pentru aplicația web
- ✅ Configurează rețeaua și securitatea
- ✅ Deployează codul aplicației
- ✅ Configurează monitorizare și jurnalizare

2. **Monitorizați progresul implementării** și observați resursele create.

### Step 2.3: Verify Your Deployment

1. **Verificați resursele implementate:**
```bash
azd show
```

2. **Deschideți aplicația implementată:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testați funcționalitatea AI:**
   - Accesați aplicația web
   - Încercați interogări de probă
   - Verificați că răspunsurile AI funcționează

### **Exercițiu de laborator 2.1: Practica depanării**

**Scenariu**: Implementarea a reușit, dar AI nu răspunde.

**Probleme comune de verificat:**
1. **Chei OpenAI**: Verificați dacă sunt setate corect
2. **Disponibilitatea modelului**: Verificați dacă regiunea dvs. suportă modelul
3. **Conectivitate de rețea**: Asigurați-vă că serviciile pot comunica
4. **Permisiuni RBAC**: Verificați dacă aplicația poate accesa OpenAI

**Comenzi de depanare:**
```bash
# Verifică variabilele de mediu
azd env get-values

# Vizualizează jurnalele de implementare
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verifică starea implementării OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Actualizați modelul OpenAI:**
```bash
# Schimbați la un alt model (dacă este disponibil în regiunea dvs.)
azd env set AZURE_OPENAI_MODEL gpt-4

# Implementați din nou cu noua configurație
azd deploy
```

2. **Adăugați servicii AI adiționale:**

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

**Practica recomandată**: Configurații diferite pentru dezvoltare vs producție.

1. **Creați un mediu de producție:**
```bash
azd env new myai-production
```

2. **Setați parametri specifici producției:**
```bash
# În producție se folosesc de obicei SKU-uri mai mari
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Activează funcționalități de securitate suplimentare
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercițiu de laborator 3.1: Optimizarea costurilor**

**Provocare**: Configurați șablonul pentru dezvoltare cu costuri reduse.

**Sarcini:**
1. Identificați ce SKU-uri pot fi setate pe niveluri free/basic
2. Configurați variabilele de mediu pentru cost minim
3. Implementați și comparați costurile cu configurația de producție

**Indiciu de soluție:**
- Folosiți nivelul F0 (free) pentru Cognitive Services când este posibil
- Folosiți nivelul Basic pentru Search Service în dezvoltare
- Luați în considerare utilizarea planului Consumption pentru Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Provocarea actuală**: Multe aplicații AI încorporează chei API în cod sau folosesc stocare nesigură.

**Soluția AZD**: integrare Managed Identity + Key Vault.

1. **Revizuiți configurația de securitate din șablonul dvs.:**
```bash
# Caută configurarea Key Vault și a identității administrate
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

Adăugați metrici personalizate pentru operațiunile AI:
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

### **Exercițiu de laborator 4.1: Audit de securitate**

**Sarcină**: Revizuiți implementarea pentru bune practici de securitate.

**Checklist:**
- [ ] Fără secrete hardcodate în cod sau configurație
- [ ] Managed Identity folosit pentru autentificare între servicii
- [ ] Key Vault stochează configurația sensibilă
- [ ] Accesul la rețea este restricționat corespunzător
- [ ] Monitorizare și jurnalizare sunt activate

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Înainte de a converti aplicația dvs.**, răspundeți la aceste întrebări:

1. **Arhitectura aplicației:**
   - Ce servicii AI folosește aplicația dvs.?
   - Ce resurse de calcul are nevoie?
   - Necesită o bază de date?
   - Care sunt dependențele dintre servicii?

2. **Cerințe de securitate:**
   - Ce date sensibile gestionează aplicația dvs.?
   - Ce cerințe de conformitate aveți?
   - Aveți nevoie de rețea privată?

3. **Cerințe de scalare:**
   - Care este încărcarea așteptată?
   - Aveți nevoie de auto-scalare?
   - Există cerințe regionale?

### Step 5.2: Create Your AZD Template

**Urmați acest tipar pentru a converti aplicația dvs.:**

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

**infra/main.bicep** - Template principal:
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

**infra/modules/openai.bicep** - Modul OpenAI:
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

### **Exercițiu de laborator 5.1: Provocare de creare a șablonului**

**Provocare**: Creați un șablon AZD pentru o aplicație AI de procesare a documentelor.

**Cerințe:**
- Azure OpenAI pentru analiză de conținut
- Document Intelligence pentru OCR
- Storage Account pentru încărcări de documente
- Function App pentru logica de procesare
- Web app pentru interfața cu utilizatorul

**Puncte bonus:**
- Adăugați tratare corectă a erorilor
- Includeți estimare de cost
- Configurați panouri de monitorizare

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** Implementarea eșuează cu eroare de cotă
**Solutions:**
```bash
# Verificați cotele curente
az cognitiveservices usage list --location eastus

# Solicitați majorarea cotelor sau încercați o regiune diferită
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** Răspunsurile AI eșuează sau apar erori la implementarea modelului
**Solutions:**
```bash
# Verifică disponibilitatea modelului în funcție de regiune
az cognitiveservices model list --location eastus

# Actualizează la modelul disponibil
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** Erori 403 Forbidden la apelarea serviciilor AI
**Solutions:**
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
**Investigation steps:**
1. Verificați Application Insights pentru metrici de performanță
2. Revizuiți metricile serviciului OpenAI în portalul Azure
3. Verificați conectivitatea rețelei și latența

**Solutions:**
- Implementați caching pentru interogările comune
- Folosiți modelul OpenAI potrivit pentru cazul dvs. de utilizare
- Luați în considerare replici pentru citire în scenarii cu trafic ridicat

### **Exercițiu de laborator 6.1: Provocare de depanare**

**Scenariu**: Implementarea a reușit, dar aplicația returnează erori 500.

**Sarcini de depanare:**
1. Verificați jurnalele aplicației
2. Verificați conectivitatea serviciilor
3. Testați autentificarea
4. Revizuiți configurația

**Unelte de utilizat:**
- `azd show` pentru prezentarea generală a implementării
- Portalul Azure pentru jurnale detaliate ale serviciilor
- Application Insights pentru telemetria aplicației

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Creați panouri personalizate:**

Accesați portalul Azure și creați un panou cu:
- Numărul și latența cererilor OpenAI
- Ratele de eroare ale aplicației
- Utilizarea resurselor
- Monitorizarea costurilor

2. **Configurați alerte:**
```bash
# Avertizare pentru o rată mare de erori
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
# Utilizați Azure CLI pentru a obține date despre costuri
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementați controale de cost:**
- Configurați alerte de buget
- Folosiți politici de autoscalare
- Implementați caching pentru cereri
- Monitorizați consumul de tokeni pentru OpenAI

### **Exercițiu de laborator 7.1: Optimizarea performanței**

**Sarcină**: Optimizați aplicația AI pentru performanță și cost.

**Metrici de îmbunătățit:**
- Reduceți timpul mediu de răspuns cu 20%
- Reduceți costurile lunare cu 15%
- Mențineți 99.9% uptime

**Strategii de încercat:**
- Implementați caching pentru răspunsuri
- Optimizați prompturile pentru eficiență a tokenilor
- Folosiți SKU-urile de calcul potrivite
- Configurați autoscalare adecvată

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Sunteți însărcinat cu crearea unui chatbot pentru servicii clienți, pregătit pentru producție, alimentat de AI, cu următoarele cerințe:

**Cerințe funcționale:**
- Interfață web pentru interacțiunile cu clienții
- Integrare cu Azure OpenAI pentru răspunsuri
- Capacitate de căutare a documentelor folosind Cognitive Search
- Integrare cu baza de date existentă a clienților
- Suport multi-limbă

**Cerințe non-funcționale:**
- Gestionarea a 1000 de utilizatori concurenți
- SLA de 99.9% uptime
- Conformitate SOC 2
- Cost sub 500$/lună
- Implementare în mai multe medii (dev, staging, prod)

### Implementation Steps

1. **Proiectați arhitectura**
2. **Creați șablonul AZD**
3. **Implementați măsuri de securitate**
4. **Configurați monitorizarea și alertarea**
5. **Creați pipeline-uri de implementare**
6. **Documentați soluția**

### Evaluation Criteria

- ✅ **Functionality**: Îndeplinește toate cerințele?
- ✅ **Security**: Sunt implementate bunele practici?
- ✅ **Scalability**: Poate face față încărcării?
- ✅ **Maintainability**: Codul și infrastructura sunt bine organizate?
- ✅ **Cost**: Rămâne în buget?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate
Felicitări! Ai finalizat laboratorul AI Workshop. Ar trebui acum să poți:

- ✅ Converti aplicațiile AI existente în șabloane AZD
- ✅ Implementa aplicații AI gata pentru producție
- ✅ Implementa cele mai bune practici de securitate pentru sarcinile de lucru AI
- ✅ Monitoriza și optimiza performanța aplicațiilor AI
- ✅ Depana problemele comune de implementare

### Pașii următori
1. Aplică aceste modele în proiectele tale AI
2. Contribuie cu șabloane comunității
3. Alătură-te Discord-ului Microsoft Foundry pentru suport continuu
4. Explorează subiecte avansate, cum ar fi implementările multi-regiune

---

**Feedback despre workshop**: Ajută-ne să îmbunătățim acest workshop împărtășind experiența ta în [canalul #Azure din Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare centrată pe AI
- **⬅️ Anterior**: [Implementarea modelului AI](ai-model-deployment.md)
- **➡️ Următor**: [Cele mai bune practici AI pentru producție](production-ai-practices.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

**Ai nevoie de ajutor?** Alătură-te comunității noastre pentru suport și discuții despre AZD și implementările AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Declinare de responsabilitate:
Acest document a fost tradus cu ajutorul serviciului de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm responsabilitatea pentru eventuale neînțelegeri sau interpretări greșite care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->