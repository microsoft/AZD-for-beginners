# Laborator AI Workshop: Cum să faci soluțiile tale AI deployabile cu AZD

**Navigare capitole:**  
- **📚 Acasă Curs:** [AZD Pentru Începători](../../README.md)  
- **📖 Capitol curent:** Capitolul 2 - Dezvoltare AI-First  
- **⬅️ Anterior:** [Implementarea Modelului AI](ai-model-deployment.md)  
- **➡️ Următor:** [Cele mai bune practici AI în Producție](production-ai-practices.md)  
- **🚀 Capitol următor:** [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

## Prezentare generală a laboratorului

Acest laborator practic ghidează dezvoltatorii prin procesul de preluare a unui șablon AI existent și implementarea lui folosind Azure Developer CLI (AZD). Veți învăța modele esențiale pentru implementările AI în producție folosind serviciile Microsoft Foundry.

**Durată:** 2-3 ore  
**Nivel:** Intermediar  
**Precondiții:** Cunoștințe de bază Azure, familiarizare cu conceptele AI/ML

## 🎓 Obiective de învățare

La finalul acestui laborator, veți putea să:  
- ✅ Convertiți o aplicație AI existentă pentru a folosi șabloanele AZD  
- ✅ Configurați serviciile Microsoft Foundry folosind AZD  
- ✅ Implementați management securizat al acreditărilor pentru serviciile AI  
- ✅ Implementați aplicații AI pregătite pentru producție cu monitorizare  
- ✅ Depanați probleme comune de implementare AI  

## Precondiții

### Unelte necesare  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalat  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalat  
- [Git](https://git-scm.com/) instalat  
- Editor de cod (se recomandă VS Code)  

### Resurse Azure  
- Abonament Azure cu acces contributor  
- Acces la serviciile Microsoft Foundry Models (sau posibilitatea de a solicita acces)  
- Permisiuni pentru crearea grupurilor de resurse  

### Cunoștințe prealabile  
- Înțelegere de bază a serviciilor Azure  
- Familiaritate cu interfețele de linie de comandă  
- Concepte AI/ML de bază (API-uri, modele, prompturi)

## Configurarea laboratorului

### Pasul 1: Pregătirea mediului

1. **Verificarea instalării uneltelor:**  
```bash
# Verifică instalarea AZD
azd version

# Verifică Azure CLI
az --version

# Autentificare în Azure
az login
azd auth login
```
  
2. **Clonarea depozitului laboratorului:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## Modulul 1: Înțelegerea structurii AZD pentru aplicații AI

### Anatomia unui șablon AI AZD

Explorați fișierele principale dintr-un șablon AZD pregătit pentru AI:

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
  
### **Exercițiu de laborator 1.1: Explorarea configurației**

1. **Examinați fișierul azure.yaml:**  
```bash
cat azure.yaml
```
  
**Ce să urmăriți:**  
- Definiții ale serviciilor pentru componente AI  
- Mapările variabilelor de mediu  
- Configurațiile gazdei  

2. **Revizuiți infrastructura main.bicep:**  
```bash
cat infra/main.bicep
```
  
**Modele AI cheie de identificat:**  
- Provizionarea serviciului Microsoft Foundry Models  
- Integrare Cognitive Search  
- Management securizat al cheilor  
- Configurații de securitate rețea  

### **Punct de discuție:** De ce contează aceste modele pentru AI

- **Dependențe ale serviciilor:** Aplicațiile AI necesită adesea multiple servicii coordonate  
- **Securitate:** Cheile API și punctele finale trebuie gestionate securizat  
- **Scalabilitate:** Sarcinile AI au cerințe unice de scalare  
- **Managementul costurilor:** Serviciile AI pot fi costisitoare dacă nu sunt configurate corect  

## Modulul 2: Implementați prima dvs. aplicație AI

### Pasul 2.1: Inițializare mediu

1. **Creați un nou mediu AZD:**  
```bash
azd env new myai-workshop
```
  
2. **Setați parametrii necesari:**  
```bash
# Setează regiunea Azure preferată
azd env set AZURE_LOCATION eastus

# Opțional: Setează modelul OpenAI specific
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```
  
### Pasul 2.2: Implementați infrastructura și aplicația

1. **Implementați cu AZD:**  
```bash
azd up
```
  
**Ce se întâmplă în timpul `azd up`:**  
- ✅ Provizionează serviciul Microsoft Foundry Models  
- ✅ Creează serviciul Cognitive Search  
- ✅ Configurează App Service pentru aplicația web  
- ✅ Configurează rețeaua și securitatea  
- ✅ Deploy cod aplicație  
- ✅ Configurează monitorizare și logging  

2. **Monitorizați progresul implementării** și observați resursele create.

### Pasul 2.3: Verificați implementarea

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
   - Încercați interogări de test  
   - Verificați răspunsurile AI  

### **Exercițiu de laborator 2.1: Practică de depanare**

**Scenariu:** Implementarea a reușit, dar AI nu răspunde.

**Probleme comune de verificat:**  
1. **Chei API OpenAI:** Verificați dacă sunt setate corect  
2. **Disponibilitatea modelului:** Verificați dacă regiunea dvs. suportă modelul  
3. **Conectivitate rețea:** Asigurați-vă că serviciile pot comunica  
4. **Permisiuni RBAC:** Verificați dacă aplicația are acces la OpenAI  

**Comenzi de depanare:**  
```bash
# Verifică variabilele de mediu
azd env get-values

# Vizualizează jurnalele de implementare
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Verifică starea implementării OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Modulul 3: Personalizarea aplicațiilor AI după nevoile dvs.

### Pasul 3.1: Modificarea configurației AI

1. **Actualizați modelul OpenAI:**  
```bash
# Schimbă cu un model diferit (dacă este disponibil în regiunea ta)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Redeploy cu noua configurație
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

**Best Practice:** Configurații diferite pentru dezvoltare vs producție.

1. **Creați un mediu de producție:**  
```bash
azd env new myai-production
```
  
2. **Setați parametrii specifici producției:**  
```bash
# Producția folosește în mod obișnuit SKU-uri mai mari
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Activează funcții suplimentare de securitate
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **Exercițiu de laborator 3.1: Optimizarea costurilor**

**Provocare:** Configurați șablonul pentru dezvoltare cu costuri eficiente.

**Sarcini:**  
1. Identificați ce SKU-uri pot fi setate pe tier gratuit/bazic  
2. Configurați variabilele de mediu pentru minim cost  
3. Implementați și comparați costurile cu configurația de producție  

**Sugestii de soluție:**  
- Utilizați tier F0 (gratuit) pentru Cognitive Services când este posibil  
- Folosiți tier Basic pentru serviciul Search în dezvoltare  
- Luați în considerare planul Consumption pentru Functions  

## Modulul 4: Securitate și cele mai bune practici în producție

### Pasul 4.1: Management securizat al acreditărilor

**Provocarea curentă:** Multe aplicații AI codifică direct cheile API sau folosesc stocare nesigură.

**Soluția AZD:** Identitate Gestionată + integrare Key Vault.

1. **Revizuiți configurația de securitate din șablon:**  
```bash
# Caută configurarea Key Vault și Identitate Gestionată
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Verificați că Identitatea Gestionată funcționează:**  
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
  
### Pasul 4.3: Monitorizare și observaționalitate

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
  
### **Exercițiu de laborator 4.1: Audit de securitate**

**Sarcină:** Revizuiți implementarea dvs. pentru cele mai bune practici de securitate.

**Lista de verificare:**  
- [ ] Nicio parolă/secret hardcodate în cod sau configurație  
- [ ] Identitate gestionată utilizată pentru autentificarea serviciu-la-serviciu  
- [ ] Key Vault stochează configurații sensibile  
- [ ] Accesul în rețea este bine restricționat  
- [ ] Monitorizarea și logging-ul sunt activate  

## Modulul 5: Convertirea propriei aplicații AI

### Pasul 5.1: Fișă de evaluare

**Înainte de a converti aplicația**, răspundeți la aceste întrebări:

1. **Arhitectura aplicației:**  
   - Ce servicii AI folosește aplicația?  
   - Ce resurse de calcul sunt necesare?  
   - Necesită o bază de date?  
   - Care sunt dependențele între servicii?  

2. **Cerinte de securitate:**  
   - Ce date sensibile gestionează aplicația?  
   - Ce cerințe de conformitate aveți?  
   - Aveți nevoie de rețea privată?  

3. **Cerințe de scalare:**  
   - Care este încărcarea așteptată?  
   - Aveți nevoie de scalare automată?  
   - Există cerințe regionale?  

### Pasul 5.2: Creați șablonul AZD

**Urmați acest model pentru a converti aplicația dvs.:**

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
  
### **Exercițiu de laborator 5.1: Provocare creare șablon**

**Provocare:** Creați un șablon AZD pentru o aplicație AI de procesare documente.

**Cerințe:**  
- Microsoft Foundry Models pentru analiză de conținut  
- Document Intelligence pentru OCR  
- Cont de stocare pentru încărcare documente  
- Function App pentru logica de procesare  
- Aplicație web pentru interfață utilizator  

**Puncte bonus:**  
- Adăugați gestionare corectă a erorilor  
- Includeți estimare de costuri  
- Configurați tablouri de bord pentru monitorizare  

## Modulul 6: Depanarea problemelor comune

### Probleme comune de implementare

#### Problema 1: Depășire cotă serviciu OpenAI  
**Simptome:** Implementarea eșuează cu eroare de cotă  
**Soluții:**  
```bash
# Verifică cotele curente
az cognitiveservices usage list --location eastus

# Solicitați o creștere a cotei sau încercați o regiune diferită
azd env set AZURE_LOCATION westus2
azd up
```
  
#### Problema 2: Model indisponibil în regiune  
**Simptome:** Răspunsuri AI eșuează sau erori la implementare model  
**Soluții:**  
```bash
# Verifică disponibilitatea modelului pe regiuni
az cognitiveservices model list --location eastus

# Actualizează la modelul disponibil
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```
  
#### Problema 3: Probleme de permisiuni  
**Simptome:** Erori 403 Forbidden când se apelează serviciile AI  
**Soluții:**  
```bash
# Verifică atribuțiile rolurilor
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Adaugă rolurile lipsă
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  
### Probleme de performanță

#### Problema 4: Răspunsuri AI lente  
**Pași de investigat:**  
1. Verificați Application Insights pentru metrici de performanță  
2. Revizuiți metrici serviciu OpenAI în portal Azure  
3. Verificați conectivitatea și latența rețelei  

**Soluții:**  
- Implementați caching pentru interogări frecvente  
- Folosiți modelul OpenAI potrivit pentru cazul dvs.  
- Luați în considerare replici de citire pentru încărcări mari  

### **Exercițiu de laborator 6.1: Provocare de depanare**

**Scenariu:** Implementarea a reușit, dar aplicația returnează erori 500.

**Sarcini de depanare:**  
1. Verificați log-urile aplicației  
2. Verificați conectivitatea serviciilor  
3. Testați autentificarea  
4. Revizuiți configurația  

**Unelte recomandate:**  
- `azd show` pentru overview implementare  
- Portal Azure pentru loguri detaliate servicii  
- Application Insights pentru telemetria aplicației  

## Modulul 7: Monitorizare și optimizare

### Pasul 7.1: Configurați monitorizarea comprehensivă

1. **Creați tablouri de bord personalizate:**  

Navigați în portal Azure și creați un dashboard cu:  
- Numărul și latența cererilor OpenAI  
- Ratele de eroare ale aplicației  
- Utilizarea resurselor  
- Urmărirea costurilor  

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
  
### Pasul 7.2: Optimizarea costurilor

1. **Analizați costurile curente:**  
```bash
# Folosește Azure CLI pentru a obține datele despre costuri
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **Implementați controlul costurilor:**  
- Configurați alerte buget  
- Folosiți politici de autoscalare  
- Implementați caching cereri  
- Monitorizați consumul de tokeni pentru OpenAI  

### **Exercițiu de laborator 7.1: Optimizare performanță**

**Sarcină:** Optimizați aplicația AI atât pentru performanță cât și cost.

**Metrix de îmbunătățit:**  
- Reduceți timpul mediu de răspuns cu 20%  
- Reduceți costurile lunare cu 15%  
- Mențineți 99.9% uptime  

**Strategii de încercat:**  
- Implementați caching răspunsuri  
- Optimizați prompturile pentru eficiența token-ilor  
- Folosiți SKU-uri compute potrivite  
- Configurați autoscalare corectă  

## Provocarea finală: Implementare end-to-end

### Scenariu provocare

Sunteți provocat să creați un chatbot AI pentru servicii clienți, gata pentru producție, cu următoarele cerințe:

**Cerințe funcționale:**  
- Interfață web pentru interacțiuni clienți  
- Integrare Microsoft Foundry Models pentru răspunsuri  
- Căutare documente folosind Cognitive Search  
- Integrare cu baza de date clienți existentă  
- Suport multilingv  

**Cerințe non-funcționale:**  
- Susține 1000 utilizatori simultan  
- SLA 99.9% uptime  
- Conformitate SOC 2  
- Cost sub 500$ / lună  
- Deploy pe multiple medii (dev, staging, prod)  

### Pași implementare

1. **Proiectați arhitectura**  
2. **Creați șablonul AZD**  
3. **Implementați măsuri de securitate**  
4. **Configurați monitorizarea și alertarea**  
5. **Creați pipeline-uri de implementare**  
6. **Documentați soluția**  

### Criterii evaluare

- ✅ **Funcționalitate:** Îndeplinește toate cerințele?  
- ✅ **Securitate:** Sunt aplicate cele mai bune practici?  
- ✅ **Scalabilitate:** Poate face față încărcării?  
- ✅ **Mentenabilitate:** Codul și infrastructura sunt bine organizate?  
- ✅ **Cost:** Se încadrează în buget?  

## Resurse suplimentare

### Documentație Microsoft  
- [Documentație Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Documentație Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Documentația Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)  

### Șabloane exemple  
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)  
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)  

### Resurse comunitare  
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)  
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)  

## 🎓 Certificat de finalizare

Felicitări! Ați finalizat laboratorul AI Workshop. Acum ar trebui să puteți:
- ✅ Convertiți aplicațiile AI existente în șabloane AZD  
- ✅ Implementați aplicații AI gata pentru producție  
- ✅ Aplicați cele mai bune practici de securitate pentru sarcinile AI  
- ✅ Monitorizați și optimizați performanța aplicațiilor AI  
- ✅ Depanați problemele comune de implementare  

### Pașii următori  
1. Aplicați aceste modele în propriile proiecte AI  
2. Contribuiți cu șabloane înapoi comunității  
3. Alăturați-vă canalului Microsoft Foundry Discord pentru suport continuu  
4. Explorați subiecte avansate precum implementările multi-regiune  

---

**Feedback despre atelier**: Ajutați-ne să îmbunătățim acest atelier împărtășind experiența dvs. în [canalul Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).  

---

**Navigare capitole:**  
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)  
- **📖 Capitol curent**: Capitolul 2 - Dezvoltare AI-First  
- **⬅️ Anterior**: [Implementarea modelului AI](ai-model-deployment.md)  
- **➡️ Următor**: [Cele mai bune practici AI în producție](production-ai-practices.md)  
- **🚀 Capitol următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)  

**Aveți nevoie de ajutor?** Alăturați-vă comunității noastre pentru suport și discuții despre AZD și implementările AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist. Nu ne asumăm responsabilitatea pentru orice neînțelegeri sau interpretări greșite ce pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->