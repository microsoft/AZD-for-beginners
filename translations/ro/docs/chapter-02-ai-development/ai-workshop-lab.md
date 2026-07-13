# Laborator AI Workshop: Cum să faci soluțiile tale AI deploabile cu AZD

**Navigare în capitole:**
- **📚 Acasă curs**: [AZD pentru începători](../../README.md)
- **📖 Capitol curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Anterior**: [Deplasarea modelului AI](ai-model-deployment.md)
- **➡️ Următor**: [Cele mai bune practici pentru AI în producție](production-ai-practices.md)
- **🚀 Capitol următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

## Prezentare generală a laboratorului

Acest laborator practic ghidează dezvoltatorii prin procesul de a lua un șablon AI existent și a-l deploya folosind Azure Developer CLI (AZD). Veți învăța modele esențiale pentru deplasările AI în producție folosind serviciile Microsoft Foundry.

> **Notă de validare (2026-07-13):** Acest atelier a fost revizuit cu `azd` `1.27.1`. Dacă instalarea locală este mai veche, actualizați AZD înainte de a începe pentru a vă asigura că autentificarea, șablonul și fluxul de lucru pentru deploy sunt conforme cu pașii de mai jos.

**Durată:** 2-3 ore  
**Nivel:** Intermediar  
**Prerechizite:** Cunoștințe de bază Azure, familiaritate cu conceptele AI/ML

## 🎓 Obiective de învățare

La finalul acestui atelier, vei putea să:
- ✅ Convertești o aplicație AI existentă să folosească șabloane AZD
- ✅ Configurezi serviciile Microsoft Foundry cu AZD
- ✅ Implementezi gestionarea securizată a acreditărilor pentru serviciile AI
- ✅ Deploiezi aplicații AI gata pentru producție cu monitorizare
- ✅ Depistezi probleme comune de deploy AI

## Prerechizite

### Unelte necesare
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalat
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalat
- [Git](https://git-scm.com/) instalat
- Editor de cod (VS Code recomandat)

### Resurse Azure
- Abonament Azure cu acces de contributor
- Acces la serviciile Microsoft Foundry Models (sau posibilitatea de a-l solicita)
- Permisiuni de creare grup de resurse

### Cunoștințe necesare
- Înțelegere de bază a serviciilor Azure
- Familiaritate cu interfețe de linie de comandă
- Concepte de bază AI/ML (API-uri, modele, prompturi)

## Configurarea laboratorului

### Pasul 1: Pregătirea mediului

1. **Verifică instalarea uneltelor:**
```bash
# Verificați instalarea AZD
azd version

# Verificați Azure CLI
az --version

# Autentificare în Azure pentru fluxurile de lucru AZD
azd auth login

# Autentificare în Azure CLI doar dacă intenționați să rulați comenzi az în timpul diagnosticării
az login
```

Dacă lucrezi în mai mulți clienți (tenants) sau abonamentul tău nu este detectat automat, încearcă din nou cu `azd auth login --tenant-id <tenant-id>`.

2. **Clonează depozitul atelierului:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modulul 1: Înțelegerea structurii AZD pentru aplicații AI

### Anatomia unui șablon AZD pregătit pentru AI

Explorează fișierele cheie dintr-un șablon AZD pregătit pentru AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Exercițiu laborator 1.1: Explorează configurația**

1. **Examinează fișierul azure.yaml:**
```bash
cat azure.yaml
```

**Ce să cauți:**
- Definiții de servicii pentru componente AI
- Mapări ale variabilelor de mediu
- Configurații pentru gazde

2. **Revizuiește infrastructura main.bicep:**
```bash
cat infra/main.bicep
```

**Modele cheie AI de identificat:**
- Provisionarea serviciului Microsoft Foundry Models
- Integrare Azure AI Search
- Management securizat chei
- Configurări securitate rețea

### **Punct de discuție:** De ce contează aceste modele pentru AI

- **Dependențe de servicii**: Aplicațiile AI necesită adesea servicii multiple coordonate
- **Securitate**: Cheile API și punctele finale necesită gestionare securizată
- **Scalabilitate**: Sarcinile AI au cerințe unice de scalare
- **Gestionare costuri**: Serviciile AI pot fi costisitoare dacă nu sunt configurate corect

## Modulul 2: Deploiează prima ta aplicație AI

### Pasul 2.1: Inițializează mediul

1. **Creează un mediu nou AZD:**
```bash
azd env new myai-workshop
```

2. **Setează parametrii solicitați:**
```bash
# Setează regiunea Azure preferată
azd env set AZURE_LOCATION eastus

# Opțional: Setează un model OpenAI specific
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Pasul 2.2: Deploiează infrastructura și aplicația

1. **Deploiează cu AZD:**
```bash
azd up
```

**Ce se întâmplă în timpul `azd up`:**
- ✅ Provisionarea serviciului Microsoft Foundry Models
- ✅ Crearea serviciului Azure AI Search
- ✅ Configurarea App Service pentru aplicația web
- ✅ Configurarea rețelei și securității
- ✅ Deploy cod aplicație
- ✅ Setup monitorizare și logare

2. **Monitorizează progresul deploy-ului** și observă resursele create.

### Pasul 2.3: Verifică deploy-ul

1. **Verifică resursele deployate:**
```bash
azd show
```

2. **Deschide aplicația deployată:**
```bash
azd show
```

Deschide endpoint-ul web afișat în ieșirea `azd show`.

3. **Testează funcționalitatea AI:**
   - Navighează la aplicația web
   - Încearcă interogări exemplu
   - Verifică dacă răspunsurile AI funcționează

### **Exercițiu laborator 2.1: Practica depanării**

**Scenariu:** Deploy-ul a reușit, dar AI nu răspunde.

**Probleme comune pentru verificare:**
1. **Cheile API OpenAI**: Verifică dacă sunt configurate corect
2. **Disponibilitatea modelului**: Verifică dacă regiunea ta suportă modelul
3. **Conectivitate rețea**: Asigură-te că serviciile pot comunica
4. **Permisiuni RBAC**: Verifică dacă aplicația are acces la OpenAI

**Comenzi pentru depanare:**
```bash
# Verifică variabilele de mediu
azd env get-values

# Vizualizează jurnalele de implementare
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verifică starea implementării OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modulul 3: Personalizarea aplicațiilor AI pentru nevoile tale

### Pasul 3.1: Modifică configurația AI

1. **Actualizează modelul OpenAI:**
```bash
# Schimbă la un alt model (dacă este disponibil în regiunea ta)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Redeploiați cu noua configurație
azd deploy
```

2. **Adaugă servicii AI suplimentare:**

Editează `infra/main.bicep` pentru a adăuga Document Intelligence:

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

### Pasul 3.2: Configurări specifice mediului

**Cea mai bună practică**: Configurații diferite pentru dezvoltare vs producție.

1. **Creează un mediu de producție:**
```bash
azd env new myai-production
```

2. **Setează parametrii specifici producției:**
```bash
# Producția utilizează de obicei SKU-uri mai mari
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Activează funcții suplimentare de securitate
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercițiu laborator 3.1: Optimizare costuri**

**Provocare:** Configurează șablonul pentru dezvoltare economică.

**Sarcini:**
1. Identifică care SKU-uri pot fi setate la nivel gratuit/de bază
2. Configurează variabilele de mediu pentru cost minim
3. Deploiează și compară costurile cu configurația de producție

**Sugestii pentru soluții:**
- Folosește nivelul F0 (gratuit) pentru serviciile Azure AI când este posibil
- Folosește nivelul Basic pentru Search Service în dezvoltare
- Ia în considerare planul Consumption pentru Functions

## Modulul 4: Securitate și bune practici de producție

### Pasul 4.1: Gestionarea securizată a acreditărilor

**Provocare actuală:** Multe aplicații AI scriu cheile API direct în cod sau folosesc stocare nesigură.

**Soluția AZD:** Identitate gestionată + integrare Key Vault.

1. **Revizuiește configurația de securitate în șablonul tău:**
```bash
# Caută configurația pentru Key Vault și Identitate Gestionată
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifică dacă Identitatea Gestionată funcționează:**
```bash
# Verifică dacă aplicația web are configurația corectă a identității
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Pasul 4.2: Securitatea rețelei

1. **Activează endpoint-urile private** (dacă nu sunt deja configurate):

Adaugă în șablonul bicep:
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

### Pasul 4.3: Monitorizare și observabilitate

1. **Configurează Application Insights:**
```bash
# Application Insights ar trebui configurat automat
# Verifică configurația:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Setează monitorizare specifică AI:**

Adaugă metrici personalizate pentru operațiuni AI:
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

### **Exercițiu laborator 4.1: Audit de securitate**

**Sarcină:** Revizuiește deploy-ul pentru bune practici de securitate.

**Checklist:**
- [ ] Nu există secrete hardcodate în cod sau configurație
- [ ] Se utilizează Identitate Gestionată pentru autentificarea serviciu-la-serviciu
- [ ] Key Vault stochează configurări sensibile
- [ ] Accesul la rețea este corespunzător restricționat
- [ ] Monitorizarea și logarea sunt activate

## Modulul 5: Conversia propriei aplicații AI

### Pasul 5.1: Fișă de evaluare

**Înainte de a converti aplicația**, răspunde la aceste întrebări:

1. **Arhitectura aplicației:**
   - Ce servicii AI folosește aplicația ta?
   - Ce resurse de calcul necesită?
   - Necesită o bază de date?
   - Care sunt dependențele dintre servicii?

2. **Cerinte de securitate:**
   - Ce date sensibile gestionează aplicația ta?
   - Ce cerințe de conformitate ai?
   - Ai nevoie de rețea privată?

3. **Cerinte de scalare:**
   - Care este traficul estimat?
   - Ai nevoie de auto-scalare?
   - Există cerințe regionale?

### Pasul 5.2: Creează-ți șablonul AZD

**Urmează acest model pentru a-ți converti aplicația:**

1. **Creează structura de bază:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inițializează șablonul AZD
azd init --template minimal
```

2. **Creează azure.yaml:**
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

3. **Creează șabloane de infrastructură:**

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

### **Exercițiu laborator 5.1: Provocare creare șablon**

**Provocare:** Creează un șablon AZD pentru o aplicație AI de procesare documente.

**Cerințe:**
- Microsoft Foundry Models pentru analiză conținut
- Document Intelligence pentru OCR
- Cont de stocare pentru încărcări documente
- Function App pentru logica de procesare
- Aplicație web pentru interfața utilizator

**Puncte bonus:**
- Adaugă gestionare corectă a erorilor
- Include estimare costuri
- Configurează tablouri de bord pentru monitorizare

## Modulul 6: Depanarea problemelor comune

### Probleme comune la deplasare

#### Problema 1: Cota serviciului OpenAI depășită
**Simptome:** Deploy eșuează cu eroare de cotă
**Soluții:**
```bash
# Verifică cotele curente
az cognitiveservices usage list --location eastus

# Solicită creșterea cotei sau încearcă o regiune diferită
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Model indisponibil în regiune
**Simptome:** Răspunsuri AI eșuează sau erori la deploy model
**Soluții:**
```bash
# Verifică disponibilitatea modelului pe regiuni
az cognitiveservices model list --location eastus

# Actualizează la modelul disponibil
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problema 3: Probleme de permisiuni
**Simptome:** Erori 403 Forbidden când se cheamă serviciile AI
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

### Probleme de performanță

#### Problema 4: Răspunsuri AI lente
**Pași de investigație:**
1. Verifică Application Insights pentru metrici performanță
2. Revizuiește metricile serviciului OpenAI în portalul Azure
3. Verifică conectivitatea și latența rețelei

**Soluții:**
- Implementează cache pentru interogări comune
- Folosește model OpenAI potrivit pentru cazul tău
- Ia în considerare replici de citire pentru scenarii cu trafic mare

### **Exercițiu laborator 6.1: Provocare depanare**

**Scenariu:** Deploy-ul a reușit, dar aplicația întoarce erori 500.

**Sarcini de depanare:**
1. Verifică jurnalele aplicației
2. Verifică conectivitatea serviciului
3. Testează autentificarea
4. Revizuiește configurația

**Unelte de folosit:**
- `azd show` pentru vedere de ansamblu a deploy-ului
- Portal Azure pentru jurnale detaliate de serviciu
- Application Insights pentru telemetrie aplicație

## Modulul 7: Monitorizare și optimizare

### Pasul 7.1: Setează monitorizare cuprinzătoare

1. **Creează tablouri de bord personalizate:**

Navighează în portalul Azure și creează un tablou cu:
- Număr și latență a cererilor OpenAI
- Rate de erori ale aplicației
- Utilizare resurse
- Urmărire costuri

2. **Configurează alerte:**
```bash
# Alertă pentru rata mare de erori
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Pasul 7.2: Optimizarea costurilor

1. **Analizează costurile curente:**
```bash
# Folosește Azure CLI pentru a obține date despre costuri
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implementează controale de cost:**
- Setează alerte de buget
- Folosește politici de autoscalare
- Implementează caching pe cereri
- Monitorizează utilizarea tokenilor OpenAI

### **Exercițiu laborator 7.1: Optimizare performanță**

**Sarcină:** Optimizează aplicația ta AI pentru performanță și cost.

**Metrici de îmbunătățit:**
- Redu timpul mediu de răspuns cu 20%
- Scade costurile lunare cu 15%
- Menține o disponibilitate de 99.9%

**Strategii de încercat:**
- Implementează caching pentru răspunsuri
- Optimizează prompturile pentru eficiența tokenilor
- Folosește SKU-uri de calcul potrivite
- Setează autoscalare corectă

## Provocare finală: Implementare completă end-to-end

### Scenariu provocare

Ai sarcina de a crea un chatbot pentru serviciu clienți AI gata pentru producție cu următoarele cerințe:

**Cerințe funcționale:**
- Interfață web pentru interacțiuni cu clienții
- Integrare cu Microsoft Foundry Models pentru răspunsuri
- Capacitate de căutare documente folosind Azure AI Search
- Integrare cu baza de date clienți existentă
- Suport multi-limbă

**Cerințe non-funcționale:**
- Gestionează 1000 utilizatori concurenți
- SLA cu disponibilitate 99.9%
- Conformitate SOC 2
- Cost sub 500$/lună
- Deploy în mai multe medii (dev, staging, prod)

### Pași implementare

1. **Desenează arhitectura**
2. **Creează șablonul AZD**
3. **Implementează măsuri de securitate**
4. **Configurează monitorizarea și alertele**
5. **Creează pipeline-uri de deploy**
6. **Documentează soluția**

### Criterii de evaluare

- ✅ **Funcționalitate**: Îndeplinește toate cerințele?
- ✅ **Securitate**: Sunt implementate bune practici?
- ✅ **Scalabilitate**: Poate gestiona traficul?
- ✅ **Ușurință de întreținere**: Codul și infrastructura sunt bine organizate?
- ✅ **Cost**: Se încadrează în buget?

## Resurse suplimentare

### Documentație Microsoft
- [Documentație Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentație Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentație Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Șabloane exemplu
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Resurse Comunitare
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Template AZD Grozave](https://azure.github.io/awesome-azd/)

## 🎓 Certificat de finalizare

Felicitări! Ai finalizat Laboratorul AI Workshop. Acum ar trebui să poți:

- ✅ Să convertești aplicații AI existente în template-uri AZD
- ✅ Să implementezi aplicații AI pregătite pentru producție
- ✅ Să implementezi cele mai bune practici de securitate pentru sarcinile AI
- ✅ Să monitorizezi și să optimizezi performanța aplicațiilor AI
- ✅ Să depanezi probleme comune de implementare

### Pașii următori
1. Aplică aceste modele în propriile tale proiecte AI
2. Contribuie cu template-uri către comunitate
3. Alătură-te Discord-ului Microsoft Foundry pentru suport continuu
4. Explorează subiecte avansate precum implementările multi-regiune

---

**Feedback pentru Workshop**: Ajută-ne să îmbunătățim acest workshop împărtășindu-ne experiența ta în [canalul #Azure Discord Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Navigare Capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 2 - Dezvoltare axată pe AI
- **⬅️ Anterior**: [Implementarea Modelului AI](ai-model-deployment.md)
- **➡️ Următor**: [Cele mai bune practici AI pentru producție](production-ai-practices.md)
- **🚀 Capitolul Următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

**Ai nevoie de ajutor?** Alătură-te comunității noastre pentru suport și discuții despre AZD și implementările AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->