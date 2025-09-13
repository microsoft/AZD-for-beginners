<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T23:03:54+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "ro"
}
-->
# Atelier AI: Transformarea Soluțiilor AI pentru Implementare cu AZD

**Anterior:** [Implementarea Modelului AI](ai-model-deployment.md) | **Următor:** [Practici AI pentru Producție](production-ai-practices.md)

## Prezentare Generală a Atelierului

Acest laborator practic ghidează dezvoltatorii prin procesul de transformare a unei aplicații AI existente pentru a fi implementabilă folosind Azure Developer CLI (AZD). Veți învăța modele esențiale pentru implementările AI în producție utilizând serviciile Azure AI Foundry.

**Durată:** 2-3 ore  
**Nivel:** Intermediar  
**Cerințe preliminare:** Cunoștințe de bază despre Azure, familiaritate cu conceptele AI/ML

## 🎓 Obiective de Învățare

La finalul acestui atelier, veți putea:
- ✅ Converti o aplicație AI existentă pentru a utiliza șabloane AZD
- ✅ Configura serviciile Azure AI Foundry cu AZD
- ✅ Implementa gestionarea securizată a acreditivelor pentru serviciile AI
- ✅ Implementa aplicații AI pregătite pentru producție cu monitorizare
- ✅ Depana probleme comune de implementare AI

## Cerințe preliminare

### Instrumente necesare
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalat
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalat
- [Git](https://git-scm.com/) instalat
- Editor de cod (VS Code recomandat)

### Resurse Azure
- Abonament Azure cu acces de contributor
- Acces la serviciile Azure OpenAI (sau posibilitatea de a solicita acces)
- Permisiuni pentru crearea grupurilor de resurse

### Cunoștințe necesare
- Înțelegere de bază a serviciilor Azure
- Familiaritate cu interfețele de linie de comandă
- Concepte de bază AI/ML (API-uri, modele, prompturi)

## Configurarea Laboratorului

### Pasul 1: Pregătirea Mediului

1. **Verificați instalarea instrumentelor:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Clonați depozitul atelierului:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modulul 1: Înțelegerea Structurii AZD pentru Aplicații AI

### Anatomia unui Șablon AZD Pregătit pentru AI

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

### **Exercițiu de Laborator 1.1: Explorarea Configurației**

1. **Examinați fișierul azure.yaml:**
```bash
cat azure.yaml
```

**Ce să căutați:**
- Definiții ale serviciilor pentru componentele AI
- Mapări ale variabilelor de mediu
- Configurații ale gazdei

2. **Revizuiți infrastructura main.bicep:**
```bash
cat infra/main.bicep
```

**Modele AI cheie de identificat:**
- Provizionarea serviciului Azure OpenAI
- Integrarea Cognitive Search
- Gestionarea securizată a cheilor
- Configurații de securitate a rețelei

### **Punct de Discuție:** De ce Contează Aceste Modele pentru AI

- **Dependențe ale Serviciilor**: Aplicațiile AI necesită adesea mai multe servicii coordonate
- **Securitate**: Cheile API și punctele finale necesită gestionare securizată
- **Scalabilitate**: Sarcinile AI au cerințe unice de scalare
- **Gestionarea Costurilor**: Serviciile AI pot fi costisitoare dacă nu sunt configurate corespunzător

## Modulul 2: Implementarea Primei Aplicații AI

### Pasul 2.1: Inițializarea Mediului

1. **Creați un nou mediu AZD:**
```bash
azd env new myai-workshop
```

2. **Setați parametrii necesari:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Pasul 2.2: Implementarea Infrastructurii și Aplicației

1. **Implementați cu AZD:**
```bash
azd up
```

**Ce se întâmplă în timpul `azd up`:**
- ✅ Provizionează serviciul Azure OpenAI
- ✅ Creează serviciul Cognitive Search
- ✅ Configurează App Service pentru aplicația web
- ✅ Configurează rețeaua și securitatea
- ✅ Implementă codul aplicației
- ✅ Configurează monitorizarea și jurnalizarea

2. **Monitorizați progresul implementării** și notați resursele create.

### Pasul 2.3: Verificați Implementarea

1. **Verificați resursele implementate:**
```bash
azd show
```

2. **Deschideți aplicația implementată:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testați funcționalitatea AI:**
   - Navigați la aplicația web
   - Încercați interogări de exemplu
   - Verificați dacă răspunsurile AI funcționează

### **Exercițiu de Laborator 2.1: Practică de Depanare**

**Scenariu**: Implementarea a reușit, dar AI nu răspunde.

**Probleme comune de verificat:**
1. **Cheile API OpenAI**: Verificați dacă sunt setate corect
2. **Disponibilitatea modelului**: Verificați dacă regiunea dvs. suportă modelul
3. **Conectivitatea rețelei**: Asigurați-vă că serviciile pot comunica
4. **Permisiuni RBAC**: Verificați dacă aplicația poate accesa OpenAI

**Comenzi de depanare:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modulul 3: Personalizarea Aplicațiilor AI pentru Nevoile Dvs.

### Pasul 3.1: Modificarea Configurației AI

1. **Actualizați modelul OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
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

### Pasul 3.2: Configurații Specifice Mediului

**Cea mai bună practică**: Configurații diferite pentru dezvoltare vs producție.

1. **Creați un mediu de producție:**
```bash
azd env new myai-production
```

2. **Setați parametrii specifici producției:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercițiu de Laborator 3.1: Optimizarea Costurilor**

**Provocare**: Configurați șablonul pentru dezvoltare cu costuri reduse.

**Sarcini:**
1. Identificați ce SKUs pot fi setate la niveluri gratuite/de bază
2. Configurați variabilele de mediu pentru costuri minime
3. Implementați și comparați costurile cu configurația de producție

**Indicații pentru soluție:**
- Utilizați nivelul F0 (gratuit) pentru Cognitive Services, dacă este posibil
- Utilizați nivelul Basic pentru Search Service în dezvoltare
- Luați în considerare utilizarea planului Consumption pentru Functions

## Modulul 4: Securitate și Cele Mai Bune Practici pentru Producție

### Pasul 4.1: Gestionarea Securizată a Acreditivelor

**Provocarea actuală**: Multe aplicații AI codifică cheile API sau utilizează stocare nesigură.

**Soluția AZD**: Identitate Gestionată + Integrare Key Vault.

1. **Revizuiți configurația de securitate din șablonul dvs.:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verificați funcționarea Identității Gestionate:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Pasul 4.2: Securitatea Rețelei

1. **Activați punctele finale private** (dacă nu sunt deja configurate):

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

### Pasul 4.3: Monitorizare și Observabilitate

1. **Configurați Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Configurați monitorizarea specifică AI:**

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

### **Exercițiu de Laborator 4.1: Audit de Securitate**

**Sarcină**: Revizuiți implementarea pentru cele mai bune practici de securitate.

**Listă de verificare:**
- [ ] Niciun secret codificat în cod sau configurație
- [ ] Identitate Gestionată utilizată pentru autentificarea între servicii
- [ ] Key Vault stochează configurația sensibilă
- [ ] Accesul la rețea este restricționat corespunzător
- [ ] Monitorizarea și jurnalizarea sunt activate

## Modulul 5: Conversia Propriei Aplicații AI

### Pasul 5.1: Fișă de Evaluare

**Înainte de a converti aplicația dvs.**, răspundeți la aceste întrebări:

1. **Arhitectura Aplicației:**
   - Ce servicii AI utilizează aplicația dvs.?
   - Ce resurse de calcul sunt necesare?
   - Este necesară o bază de date?
   - Care sunt dependențele între servicii?

2. **Cerințe de Securitate:**
   - Ce date sensibile gestionează aplicația dvs.?
   - Ce cerințe de conformitate aveți?
   - Este necesară o rețea privată?

3. **Cerințe de Scalare:**
   - Care este încărcarea așteptată?
   - Este necesară scalarea automată?
   - Există cerințe regionale?

### Pasul 5.2: Creați Șablonul AZD

**Urmați acest model pentru a converti aplicația dvs.:**

1. **Creați structura de bază:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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

3. **Creați șabloane de infrastructură:**

**infra/main.bicep** - Șablon principal:
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

### **Exercițiu de Laborator 5.1: Provocare de Creare a Șablonului**

**Provocare**: Creați un șablon AZD pentru o aplicație AI de procesare a documentelor.

**Cerințe:**
- Azure OpenAI pentru analiza conținutului
- Document Intelligence pentru OCR
- Storage Account pentru încărcarea documentelor
- Function App pentru logica de procesare
- Aplicație web pentru interfața utilizatorului

**Puncte bonus:**
- Adăugați gestionarea corectă a erorilor
- Includeți estimarea costurilor
- Configurați tablouri de monitorizare

## Modulul 6: Depanarea Problemelor Comune

### Probleme Comune de Implementare

#### Problema 1: Cota Serviciului OpenAI Depășită
**Simptome:** Implementarea eșuează cu eroare de cotă
**Soluții:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelul Nu Este Disponibil în Regiune
**Simptome:** Răspunsurile AI eșuează sau erori de implementare a modelului
**Soluții:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problema 3: Probleme de Permisiuni
**Simptome:** Erori 403 Forbidden la apelarea serviciilor AI
**Soluții:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Probleme de Performanță

#### Problema 4: Răspunsuri AI Lente
**Pași de investigație:**
1. Verificați metricile de performanță în Application Insights
2. Revizuiți metricile serviciului OpenAI în portalul Azure
3. Verificați conectivitatea rețelei și latența

**Soluții:**
- Implementați caching pentru interogările comune
- Utilizați modelul OpenAI potrivit pentru cazul dvs. de utilizare
- Luați în considerare replici de citire pentru scenarii cu încărcare mare

### **Exercițiu de Laborator 6.1: Provocare de Depanare**

**Scenariu**: Implementarea a reușit, dar aplicația returnează erori 500.

**Sarcini de depanare:**
1. Verificați jurnalele aplicației
2. Verificați conectivitatea serviciului
3. Testați autentificarea
4. Revizuiți configurația

**Instrumente de utilizat:**
- `azd show` pentru o privire de ansamblu asupra implementării
- Portalul Azure pentru jurnale detaliate ale serviciilor
- Application Insights pentru telemetria aplicației

## Modulul 7: Monitorizare și Optimizare

### Pasul 7.1: Configurați Monitorizarea Comprehensivă

1. **Creați tablouri personalizate:**

Navigați la portalul Azure și creați un tablou de bord cu:
- Numărul de cereri OpenAI și latența
- Ratele de eroare ale aplicației
- Utilizarea resurselor
- Urmărirea costurilor

2. **Configurați alerte:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Pasul 7.2: Optimizarea Costurilor

1. **Analizați costurile actuale:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementați controale de cost:**
- Configurați alerte de buget
- Utilizați politici de scalare automată
- Implementați caching pentru cereri
- Monitorizați utilizarea token-urilor pentru OpenAI

### **Exercițiu de Laborator 7.1: Optimizarea Performanței**

**Sarcină**: Optimizați aplicația AI pentru performanță și costuri.

**Metrici de îmbunătățit:**
- Reduceți timpul mediu de răspuns cu 20%
- Reduceți costurile lunare cu 15%
- Mențineți o disponibilitate de 99.9%

**Strategii de încercat:**
- Implementați caching pentru răspunsuri
- Optimizați prompturile pentru eficiența token-urilor
- Utilizați SKUs potrivite pentru calcul
- Configurați scalarea automată corespunzătoare

## Provocare Finală: Implementare de la Cap la Coadă

### Scenariu de Provocare

Sunteți responsabil de crearea unui chatbot AI pentru servicii clienți, pregătit pentru producție, cu următoarele cerințe:

**Cerințe Funcționale:**
- Interfață web pentru interacțiuni cu clienții
- Integrare cu Azure OpenAI pentru răspunsuri
- Capacitate de căutare în documente folosind Cognitive Search
- Integrare cu baza de date existentă a clienților
- Suport pentru mai multe limbi

**Cerințe Non-Funcționale:**
- Gestionarea a 1000 de utilizatori simultan
- SLA de disponibilitate de 99.9%
- Conformitate SOC 2
- Cost sub 500$/lună
- Implementare în mai multe medii (dezvoltare, testare, producție)

### Pași de Implementare

1. **Proiectați arhitectura**
2. **Creați șablonul AZD**
3. **Implementați măsuri de securitate**
4. **Configurați monitorizarea și alertele**
5. **Creați pipeline-uri de implementare**
6. **Documentați soluția**

### Criterii de Evaluare

- ✅ **Funcționalitate**: Îndeplinește toate cerințele?
- ✅ **Securitate**: Sunt implementate cele mai bune practici?
- ✅ **Scalabilitate**: Poate gestiona încărcarea?
- ✅ **Menținere**: Codul și infrastructura sunt bine organizate?
- ✅ **Cost**: Se încadrează în buget?

## Resurse Suplimentare

### Documentație Microsoft
- [Documentație Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentație Azure OpenAI Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentație Azure AI Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Șabloane de Exemplu
- [Aplicație Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Quickstart Aplicație Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Resurse Comunitare
- [Discord Azure AI Foundry](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Șabloane Awesome AZD](https://azure.github.io/awesome-azd/)

## 🎓 Certificat de Finalizare

Felicitări! Ați finalizat Atelierul AI. Acum ar trebui să puteți:

- ✅ Converti aplicații AI existente în șabloane AZD
- ✅ Implementa aplicații AI pregătite pentru producție
- ✅ Implementați cele mai bune practici de securitate pentru sarcinile de lucru AI  
- ✅ Monitorizați și optimizați performanța aplicațiilor AI  
- ✅ Depanați problemele comune de implementare  

### Pași următori  
1. Aplicați aceste modele în propriile proiecte AI  
2. Contribuiți cu șabloane înapoi către comunitate  
3. Alăturați-vă Discord-ului Azure AI Foundry pentru suport continuu  
4. Explorați subiecte avansate, cum ar fi implementările multi-regiune  

---

**Feedback pentru atelier**: Ajutați-ne să îmbunătățim acest atelier împărtășind experiența voastră în [canalul #Azure din Discord-ul Azure AI Foundry](https://discord.gg/microsoft-azure).  

---

**Anterior:** [Implementarea modelelor AI](ai-model-deployment.md) | **Următor:** [Practici AI în producție](production-ai-practices.md)  

**Aveți nevoie de ajutor?** Alăturați-vă comunității noastre pentru suport și discuții despre AZD și implementările AI.  

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.