# Laborator AI Workshop: Cum să faci soluțiile tale AI deployabile cu AZD

**Navigare capitole:**  
- **📚 Acasă curs**: [AZD For Beginners](../../README.md)  
- **📖 Capitol curent**: Capitolul 2 - Dezvoltare AI-First  
- **⬅️ Anterior**: [Deployarea modelului AI](ai-model-deployment.md)  
- **➡️ Următor**: [Best Practices AI în producție](production-ai-practices.md)  
- **🚀 Capitol următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)  

## Prezentare generală laborator

Acest laborator practic ghidează dezvoltatorii prin procesul de a lua un șablon AI existent și de a-l deploya folosind Azure Developer CLI (AZD). Veți învăța modele esențiale pentru deployeri AI în producție utilizând serviciile Microsoft Foundry.

> **Notă de validare (2026-03-25):** Acest workshop a fost revizuit folosind `azd` `1.23.12`. Dacă instalarea locală este mai veche, actualizați AZD înainte de a începe pentru ca fluxul de autentificare, șablon și deploy să corespundă pașilor de mai jos.

**Durată:** 2-3 ore  
**Nivel:** Intermediar  
**Prerechizite:** Cunoștințe de bază Azure, familiaritate cu concepte AI/ML  

## 🎓 Obiective de învățare

La finalul acestui laborator veți putea:  
- ✅ Converti o aplicație AI existentă să folosească șabloane AZD  
- ✅ Configura serviciile Microsoft Foundry cu AZD  
- ✅ Implementa gestionarea securizată a acreditărilor pentru serviciile AI  
- ✅ Deploaia aplicații AI gata de producție cu monitorizare  
- ✅ Depana probleme comune la deployeri AI  

## Prerechizite

### Unelte necesare  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalat  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalat  
- [Git](https://git-scm.com/) instalat  
- Editor de cod (VS Code recomandat)  

### Resurse Azure  
- Abonament Azure cu acces contributor  
- Acces la serviciile Microsoft Foundry Models (sau posibilitatea de a solicita acces)  
- Permisiuni pentru creare grupuri de resurse  

### Cunoștințe de bază  
- Înțelegere de bază a serviciilor Azure  
- Familiaritate cu interfețe de linie de comandă  
- Concepte elementare AI/ML (API-uri, modele, prompturi)  

## Configurare laborator

### Pasul 1: Pregătirea mediului

1. **Verificați instalările uneltelor:**  
```bash
# Verifică instalarea AZD
azd version

# Verifică Azure CLI
az --version

# Autentifică-te în Azure pentru fluxurile de lucru AZD
azd auth login

# Autentifică-te în Azure CLI doar dacă intenționezi să rulezi comenzi az în timpul diagnosticului
az login
```
  
Dacă lucrați pe mai mulți tenanți sau abonamentul nu se detectează automat, repetați cu `azd auth login --tenant-id <tenant-id>`.

2. **Clonați repository-ul workshop-ului:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## Modul 1: Înțelegerea structurii AZD pentru aplicații AI

### Anatomia unui șablon AZD AI

Explorați fișierele cheie dintr-un șablon AZD pregătit pentru AI:

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
  
### **Exercițiu laborator 1.1: Explorați configurația**

1. **Examinați fișierul azure.yaml:**  
```bash
cat azure.yaml
```
  
**Ce să urmăriți:**  
- Definiții de servicii pentru componentele AI  
- Mapări variabile de mediu  
- Configurări gazdă  

2. **Revizuiți infrastructura main.bicep:**  
```bash
cat infra/main.bicep
```
  
**Modele AI cheie de identificat:**  
- Provizionare serviciu Microsoft Foundry Models  
- Integrare Azure AI Search  
- Gestionarea securizată a cheilor  
- Configurări de securitate rețea  

### **Punct de discuție:** De ce importă aceste modele pentru AI

- **Dependențe servicii**: Aplicațiile AI necesită adesea mai multe servicii coordonate  
- **Securitate**: Cheile API și punctele finale trebuie gestionate securizat  
- **Scalabilitate**: Workload-urile AI au cerințe unice de scalare  
- **Gestionarea costurilor**: Serviciile AI pot fi costisitoare dacă nu sunt configurate corect  

## Modul 2: Deployați prima aplicație AI

### Pasul 2.1: Inițializați mediul

1. **Creați un mediu nou AZD:**  
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
  
### Pasul 2.2: Deployați infrastructura și aplicația

1. **Deploy cu AZD:**  
```bash
azd up
```
  
**Ce se întâmplă în timpul `azd up`:**  
- ✅ Provizionează serviciul Microsoft Foundry Models  
- ✅ Creează serviciul Azure AI Search  
- ✅ Configurează App Service pentru aplicația web  
- ✅ Configurează rețeaua și securitatea  
- ✅ Deployează codul aplicației  
- ✅ Configurează monitorizare și logare  

2. **Monitorizați progresul deployerii** și observați resursele create.

### Pasul 2.3: Verificați deployul

1. **Verificați resursele deployate:**  
```bash
azd show
```
  
2. **Deschideți aplicația deployată:**  
```bash
azd show
```
  
Deschideți endpoint-ul web afișat în output-ul `azd show`.

3. **Testați funcționalitatea AI:**  
   - Navigați la aplicația web  
   - Testați interogări exemplu  
   - Verificați dacă răspunsurile AI funcționează  

### **Exercițiu laborator 2.1: Practică depanare**

**Scenariu:** Deployul a reușit, dar AI nu răspunde.

**Probleme comune de verificat:**  
1. **Cheile API OpenAI**: Verificați dacă sunt setate corect  
2. **Disponibilitatea modelului**: Verificați dacă regiunea dvs. suportă modelul  
3. **Conectivitatea rețelei**: Asigurați-vă că serviciile pot comunica  
4. **Permisiuni RBAC**: Verificați dacă aplicația poate accesa OpenAI  

**Comenzi depanare:**  
```bash
# Verifică variabilele de mediu
azd env get-values

# Vizualizează jurnalele de implementare
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verifică starea implementării OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Modul 3: Personalizarea aplicațiilor AI după nevoi

### Pasul 3.1: Modificați configurația AI

1. **Actualizați modelul OpenAI:**  
```bash
# Schimbă cu un alt model (dacă este disponibil în regiunea ta)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Redeplasează cu noua configurație
azd deploy
```
  
2. **Adăugați servicii AI suplimentare:**  

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

**Best Practice**: Configurări diferite pentru development vs producție.

1. **Creați un mediu de producție:**  
```bash
azd env new myai-production
```
  
2. **Setați parametrii specifici producției:**  
```bash
# Producția folosește de obicei SKU-uri mai ridicate
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Activează funcții suplimentare de securitate
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **Exercițiu laborator 3.1: Optimizare costuri**

**Provocare:** Configurați șablonul pentru dezvoltare cost-eficientă.

**Sarcini:**  
1. Identificați ce SKU-uri pot fi setate pe nivel gratuit/bazic  
2. Configurați variabile de mediu pentru cost minim  
3. Deployați și comparați costurile cu configurația de producție  

**Indicații pentru soluție:**  
- Folosiți nivelul F0 (gratuit) pentru Azure AI Services când este posibil  
- Folosiți nivelul Basic pentru Search Service în dezvoltare  
- Luați în considerare planul Consumption pentru Functions  

## Modul 4: Securitate și Best Practices în producție

### Pasul 4.1: Gestionare securizată a acreditărilor

**Provocare curentă:** Multe aplicații AI folosesc chei API hardcodate sau stocare nesigură.

**Soluția AZD:** Managed Identity + integrare Key Vault.

1. **Revizuiți configurația de securitate din șablonul dvs.:**  
```bash
# Căutați configurația Key Vault și Identitate Gestionată
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Verificați dacă Managed Identity funcționează:**  
```bash
# Verifică dacă aplicația web are configurația corectă a identității
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### Pasul 4.2: Securitate rețea

1. **Activați endpoint-uri private** (dacă nu sunt deja configurate):

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
  
### Pasul 4.3: Monitorizare și observabilitate

1. **Configurați Application Insights:**  
```bash
# Application Insights ar trebui să fie configurat automat
# Verificați configurația:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **Configurați monitorizarea specifică AI:**  

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
  
### **Exercițiu laborator 4.1: Audit de securitate**

**Sarcină:** Revizuiți deployul pentru respectarea best practices de securitate.

**Checklist:**  
- [ ] Nicio secretă hardcodată în cod sau configurații  
- [ ] Folosire Managed Identity pentru autentificare serviciu-la-serviciu  
- [ ] Key Vault stochează configurația sensibilă  
- [ ] Accesul în rețea este restricționat corespunzător  
- [ ] Monitorizare și logare sunt activate  

## Modul 5: Conversia propriei aplicații AI

### Pasul 5.1: Foaie de evaluare

**Înainte de a converti aplicația**, răspundeți la aceste întrebări:

1. **Arhitectura aplicației:**  
   - Ce servicii AI folosește aplicația?  
   - Ce resurse de calcul necesită?  
   - Are nevoie de bază de date?  
   - Care sunt dependențele dintre servicii?  

2. **Cerinte de securitate:**  
   - Ce date sensibile manipulează aplicația?  
   - Ce cerințe de conformitate aveți?  
   - Aveți nevoie de rețea privată?  

3. **Cerinte de scalare:**  
   - Care este încărcarea așteptată?  
   - Aveți nevoie de auto-scalare?  
   - Există cerințe regionale?  

### Pasul 5.2: Creați șablonul AZD

**Urmați acest model pentru a converti aplicația:**  

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

**Provocare:** Creați un șablon AZD pentru o aplicație AI de procesare documente.

**Cerinte:**  
- Microsoft Foundry Models pentru analiză conținut  
- Document Intelligence pentru OCR  
- Cont de stocare pentru upload documente  
- Function App pentru logica de procesare  
- Aplicație web pentru interfață utilizator  

**Bonusuri:**  
- Adăugați tratare corectă erori  
- Includeți estimare costuri  
- Configurați dashboard-uri de monitorizare  

## Modul 6: Depanare probleme comune

### Probleme comune la deploy

#### Problema 1: Quota serviciu OpenAI depășită  
**Simptome:** Deploy eșuează cu eroare quota  
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
# Verifică disponibilitatea modelului pe regiune
az cognitiveservices model list --location eastus

# Actualizează la modelul disponibil
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```
  
#### Problema 3: Probleme de permisiuni  
**Simptome:** Erori 403 Forbidden când se apelează servicii AI  
**Soluții:**  
```bash
# Verifică alocările rolurilor
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Adaugă rolurile lipsă
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  
### Probleme de performanță

#### Problema 4: Răspunsuri AI lente  
**Pași investigare:**  
1. Verificați Application Insights pentru metrici performanță  
2. Revizuiți metricile serviciului OpenAI în portal Azure  
3. Verificați conectivitatea și latența rețelei  

**Soluții:**  
- Implementați caching pentru interogări frecvente  
- Folosiți model OpenAI potrivit scenariului  
- Luați în considerare replici de citire pentru sarcină mare  

### **Exercițiu laborator 6.1: Provocare depanare**

**Scenariu:** Deployul a reușit, dar aplicația returnează erori 500.

**Sarcini depanare:**  
1. Verificați logurile aplicației  
2. Verificați conectivitatea serviciilor  
3. Testați autentificarea  
4. Revizuiți configurația  

**Unelte de folosit:**  
- `azd show` pentru vedere generală deploy  
- Portal Azure pentru log-uri detaliate  
- Application Insights pentru telemetria aplicației  

## Modul 7: Monitorizare și optimizare

### Pasul 7.1: Configurați monitorizare completă

1. **Creați dashboard-uri personalizate:**  

Navigați în portalul Azure și creați dashboard cu:  
- Număr și latență cereri OpenAI  
- Rată erori aplicație  
- Utilizare resurse  
- Urmărire costuri  

2. **Configurați alerte:**  
```bash
# Alertă pentru rată ridicată a erorilor
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```
  
### Pasul 7.2: Optimizare costuri

1. **Analizați costurile curente:**  
```bash
# Folosiți Azure CLI pentru a obține datele de cost
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **Implementați controale de cost:**  
- Configurați alerte buget  
- Folosiți politici de autoscalare  
- Implementați caching pentru cereri  
- Monitorizați consumul de tokeni OpenAI  

### **Exercițiu laborator 7.1: Optimizare performanță**

**Sarcină:** Optimizați aplicația AI atât pentru performanță cât și cost.

**Metrici de îmbunătățit:**  
- Reduceți timpul mediu de răspuns cu 20%  
- Reduceți costul lunar cu 15%  
- Mențineți disponibilitate 99.9%  

**Strategii de încercat:**  
- Implementare caching răspunsuri  
- Optimizarea prompturilor pentru eficiență tokeni  
- Folosirea SKU-urilor compute potrivite  
- Configurarea autoscalării corecte  

## Provocare finală: Implementare end-to-end

### Scenariu provocare

Vi se cere să creați un chatbot AI pentru suport clienți gata de producție, cu cerințele:  

**Cerinte funcționale:**  
- Interfață web pentru interacțiuni clienți  
- Integrare cu Microsoft Foundry Models pentru răspunsuri  
- Căutare documente folosind Azure AI Search  
- Integrare cu baza de date clienți existentă  
- Suport multi-limbă  

**Cerinte non-funcționale:**  
- Gestionare 1000 utilizatori concurenți  
- SLA 99.9% uptime  
- Conformitate SOC 2  
- Cost sub 500$ / lună  
- Deploy în medii multiple (dev, staging, prod)  

### Pași implementare

1. **Proiectați arhitectura**  
2. **Creați șablonul AZD**  
3. **Implementați măsuri de securitate**  
4. **Configurați monitorizare și alertare**  
5. **Creați pipeline-uri de deploy**  
6. **Documentați soluția**  

### Criterii evaluare

- ✅ **Functionalitate:** Corespunde tuturor cerințelor?  
- ✅ **Securitate:** Sunt implementate best practices?  
- ✅ **Scalabilitate:** Poate gestiona încărcarea?  
- ✅ **Mentenabilitate:** Codul și infrastructura sunt bine organizate?  
- ✅ **Cost:** Rămâne în buget?  

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

## 🎓 Certificat de Finalizare

Felicitări! Ai finalizat atelierul AI Workshop Lab. Acum ar trebui să poți:

- ✅ Converti aplicațiile AI existente în template-uri AZD
- ✅ Implementa aplicații AI gata de producție
- ✅ Aplica cele mai bune practici de securitate pentru sarcinile AI
- ✅ Monitoriza și optimiza performanța aplicațiilor AI
- ✅ Depana probleme comune de implementare

### Pași Următori
1. Aplică aceste modele în propriile tale proiecte AI
2. Contribuie cu template-uri înapoi către comunitate
3. Alătură-te canalului Microsoft Foundry Discord pentru suport continuu
4. Explorează subiecte avansate precum implementările multi-regiune

---

**Feedback pentru Atelier**: Ajută-ne să îmbunătățim acest atelier împărtășind experiența ta în [canalul Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Navigare capitole:**
- **📚 Pagina cursului**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Anterior**: [Implementarea Modelului AI](ai-model-deployment.md)
- **➡️ Următor**: [Cele Mai Bune Practici AI pentru Producție](production-ai-practices.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

**Ai nevoie de ajutor?** Alătură-te comunității noastre pentru suport și discuții despre AZD și implementările AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->