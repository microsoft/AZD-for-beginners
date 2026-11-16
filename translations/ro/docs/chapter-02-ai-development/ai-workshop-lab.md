# Laborator AI Workshop: Cum să faci soluțiile tale AI să fie implementabile cu AZD  

**Navigare capitole:**  
- **📚 Pagina cursului**: [AZD Pentru Începători](../../README.md)  
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare AI-First  
- **⬅️ Anterior**: [Implementarea modelului AI](ai-model-deployment.md)  
- **➡️ Următor**: [Cele mai bune practici AI pentru producție](../chapter-08-production/production-ai-practices.md)  
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)  

## Prezentare generală a laboratorului  

Acest laborator practic ghidează dezvoltatorii prin procesul de preluare a unui șablon AI existent și implementarea acestuia folosind Azure Developer CLI (AZD). Veți învăța modele esențiale pentru implementările AI în producție folosind serviciile Microsoft Foundry.  

> **Revizuire versiune (2026-11-04):** Ghidul comenzilor AZD și numele de configurare exemplu au fost verificate cu versiunea `azd` `1.37.2` și cu configurația curentă a exemplului legat. Aceasta este o revizuire a documentației, nu o validare a unei implementări live. Laboratorul RAG nu necesită extensia agent; pentru evaluările agent, folosiți extensia separată `azure.ai.evaluations` și [fluxul de evaluare curent](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), nu comenzile legacy de evaluare a agentului.  

**Durată:** 2-3 ore  
**Nivel:** Intermediar  
**Prerechizite:** Cunoștințe de bază Azure, familiaritate cu conceptele AI/ML  

## 🎓 Obiective de învățare  

La finalul acestui workshop, veți putea:  
- ✅ Explora un șablon AI AZD existent și planifica conversia propriei aplicații  
- ✅ Configura serviciile Microsoft Foundry cu AZD  
- ✅ Implementa gestionarea sigură a credențialelor pentru serviciile AI  
- ✅ Implementa o aplicație de referință AI cu monitorizare  
- ✅ Depana problemele comune de implementare AI  

## Prerechizite  

### Instrumente necesare  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) instalat
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalat
- [Git](https://git-scm.com/) instalat
- Editor de cod (VS Code recomandat)

Aceste blocuri de comenzi folosesc sintaxa Bash (inclusiv continuări pe linii și `grep`). Pe Windows, folosește Git Bash/WSL sau traduce-le în PowerShell. De asemenea, instalează instrumentele pentru limbaj, manager de pachete și containere listate în [configurarea mediului local a exemplului](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Resurse Azure
- Abonament Azure cu permisiuni pentru aprovizionarea resurselor și atribuirea rolurilor (Contributor singur nu poate crea atribuiri RBAC; folosește un administrator de rol autorizat sau echivalentul documentat al exemplului)
- Acces la serviciile Microsoft Foundry Models (sau posibilitatea de a solicita acces)
- Permisiuni pentru crearea grupurilor de resurse

### Cunoștințe prealabile
- Înțelegere de bază a serviciilor Azure
- Familiaritate cu interfețele de linie de comandă
- Concepte de bază AI/ML (API-uri, modele, prompturi)

## Configurarea laboratorului

### Pasul 1: Pregătirea mediului

1. **Verifică instalările instrumentelor:**
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

Dacă lucrezi pe mai mulți chiriași sau abonamentul tău nu este detectat automat, încearcă din nou cu `azd auth login --tenant-id <tenant-id>`.

2. **Clonează depozitul atelierului:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modul 1: Înțelegerea structurii AZD pentru aplicații AI

### Anatomia unui șablon AZD pentru AI

Explorează fișierele cheie dintr-un șablon AZD pregătit pentru AI:

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

Exemplarul extras poate varia; `.azure/` apare după inițializarea mediului, nu neapărat într-un clone proaspăt. Examinează checkout-ul real în loc să creezi directoare lipsă pentru a corespunde acestui schematic.

### **Exercițiul de laborator 1.1: Explorează configurația**

1. **Examinează fișierul azure.yaml:**
```bash
cat azure.yaml
```

**Ce să cauți:**
- Definiții de servicii pentru componentele AI
- Mapări ale variabilelor de mediu
- Configurații de gazdă

2. **Revizuiește infrastructura main.bicep:**
```bash
cat infra/main.bicep
```

**Tipare cheie AI de identificat:**
- Aprovizionarea serviciului Microsoft Foundry Models
- Integrarea Azure AI Search
- Management securizat al cheilor
- Configurații de securitate a rețelei

### **Punct de discuție:** De ce aceste tipare sunt importante pentru AI

- **Dependențe de servicii**: aplicațiile AI necesită adesea servicii multiple coordonate
- **Securitate**: Cheile API și punctele finale trebuie gestionate securizat
- **Scalabilitate**: încărcările AI au cerințe unice de scalare
- **Managementul costurilor**: serviciile AI pot fi costisitoare dacă nu sunt configurate corect

## Modul 2: Desfășoară prima ta aplicație AI

### Pasul 2.1: Inițializează mediul

1. **Creează un mediu AZD nou:**
```bash
azd env new myai-workshop
```

2. **Setează parametrii necesari:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Pasul 2.2: Desfășoară infrastructura și aplicația

1. **Desfășoară cu AZD:**
```bash
azd up
```

**Ce se întâmplă în timpul `azd up`:**
- ✅ Aprovizionează serviciul Microsoft Foundry Models
- ✅ Creează serviciul Azure AI Search
- ✅ Configurează Azure Container Apps pentru backend și frontend inclus (configurația implicită a exemplului curent)
- ✅ Configurează rețeaua și securitatea
- ✅ Desfășoară codul aplicației
- ✅ Configurează monitorizarea și înregistrarea jurnalelor

2. **Monitorizează progresul desfășurării** și observă resursele create.

### Pasul 2.3: Verifică implementarea ta

1. **Verifică resursele desfășurate:**
```bash
azd show
```

2. **Deschide aplicația desfășurată:**
```bash
azd show
```

Deschide punctul final web afișat în ieșirea `azd show`.

3. **Testează funcționalitatea AI:**
   - Navighează la aplicația web
   - Încearcă interogări exemplu
   - Verifică dacă răspunsurile AI funcționează

### **Exercițiul de laborator 2.1: Practică depanare**

**Scenariu**: Implementarea ta a reușit, dar AI nu răspunde.

**Probleme comune de verificat:**
1. **Autentificare**: Verifică identitatea gestionată și atribuțiile rolurilor; verifică cheile API doar dacă ai activat intenționat autentificarea pe bază de chei
2. **Disponibilitatea modelului**: Verifică dacă regiunea ta suportă modelul
3. **Conectivitate rețea**: Asigură-te că serviciile pot comunica
4. **Permisiuni RBAC**: Verifică dacă aplicația poate accesa OpenAI

**Comenzi de depanare:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modul 3: Personalizează aplicațiile AI pentru nevoile tale

### Pasul 3.1: Modifică configurația AI

1. **Actualizează modelul OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Adaugă servicii AI suplimentare:**

Editează `infra/main.bicep` pentru a adăuga Document Intelligence:

Următorul fragment este ilustrativ, nu un șablon complet. Exemplarul poate aproviziona deja servicii de procesare documente: examinează infrastructura curentă înainte de a adăuga resurse duplicate. Adăugările personalizate necesită conectarea ieșirilor, a identităților și configurației aplicației.

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

### Pasul 3.2: Configurații specifice mediului

**Practica recomandată**: Configurații diferite pentru dezvoltare față de producție.

1. **Creează un mediu de producție:**
```bash
azd env new myai-production
```

2. **Setează parametri specifici producției:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Aceste nume provin din [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) al exemplului. `azd env set` stochează o valoare, dar nu o face efectivă dacă șablonul nu o consumă. Revizuiește [ghidul de izolare a rețelei](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) al exemplului înainte de a dezactiva accesul public și folosește `azd up` pentru a aplica modificările infrastructurii. SKU-ul OpenAI `S0` singur nu determină debitul modelului; contează și tipul de implementare și capacitatea modelului.

### **Exercițiul de laborator 3.1: Optimizarea costurilor**

**Provocare**: Configurează șablonul pentru dezvoltare eficientă din punct de vedere al costurilor.

**Sarcini:**
1. Selectează mediul de atelier de unica folosință: `azd env select myai-workshop`.
2. Înregistrează SKU-ul Search curent și capacitatea modelului din `infra/main.parameters.json` și mediul selectat.
3. Folosește intrările suportate de mai jos, după confirmarea cotei pentru model/regiune:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Verifică SKU-ul Search și capacitatea de implementare în portal și estimează diferența cu calculatorul de prețuri. Nu te aștepta ca datele de facturare să se actualizeze imediat.

**Criterii de succes:** Search folosește Basic, implementarea de chat are capacitatea suportată solicitată, iar aplicația răspunde totuși la o întrebare exemplu. Capacitatea `10` este o alocare de limită de rată, nu un discount la prețul tokenului. Modificările nivelului Search pot fi restricționate sau necesită refacere; nu experimenta pe resurse de producție. F0 este specific serviciului și nu este un SKU de model Azure OpenAI.

## Modul 4: Securitate și bune practici de producție

### Pasul 4.1: Management securizat al acreditărilor

**Provocarea curentă**: Multe aplicații AI încorporează chei API în cod sau folosesc stocare nesigură.

**Soluția AZD**: Identitate gestionată + integrare Key Vault.

1. **Revizuiește configurația de securitate din șablonul tău:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verifică dacă Identitatea Gestionată funcționează:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Pasul 4.2: Securitatea rețelei

1. **Activează endpoint-uri private** folosind configurația de rețea suportată a exemplului (dacă nu este deja configurată).

Pentru propriul tău șablon, acest fragment ilustrativ arată conexiunea punctului final OpenAI. Este nevoie și de VNet, configurație DNS privată și conectivitate aplicație; nu-l lipi neschimbat în exemplu, care deja are module de endpoint privat:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Activează integrarea Application Insights a exemplului:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Instrumentarea exemplului emite telemetrie; o setare arbitrară `OPENAI_MONITOR_ENABLED` nu activează metrici AI. Revizuiește urmăririle pentru apelurile modelului, latență, eșecuri și utilizarea tokenilor, evitând înregistrarea prompturilor sau răspunsurilor sensibile.

### **Exercițiul de laborator 4.1: Audit de securitate**

**Sarcină**: Revizuiește implementarea ta pentru cele mai bune practici de securitate.

**Listă de verificare:**
- [ ] Fără secrete codificate în cod sau configurație
- [ ] Identitate Gestionată folosită pentru autentificarea serviciu-la-serviciu
- [ ] Key Vault stochează configurația sensibilă
- [ ] Accesul la rețea este restricționat corespunzător
- [ ] Monitorizarea și înregistrarea sunt activate

## Modul 5: Convertirea aplicației tale AI

### Pasul 5.1: Foaie de evaluare

**Înainte de a converti aplicația ta**, răspunde la aceste întrebări:

1. **Arhitectura aplicației:**
   - Ce servicii AI folosește aplicația ta?
   - Ce resurse de calcul necesită?
   - Are nevoie de o bază de date?
   - Care sunt dependențele între servicii?

2. **Cerințe de securitate:**
   - Ce date sensibile gestionează aplicația ta?
   - Ce cerințe de conformitate ai?
   - Ai nevoie de rețea privată?

3. **Cerințe de scalare:**
   - Care este încărcarea așteptată?
   - Ai nevoie de scalare automată?
   - Sunt cerințe regionale?

### Pasul 5.2: Creează-ți șablonul AZD

**Urmează acest tipar pentru a-ți converti aplicația:**

**Doar schelet:** Această secțiune nu oferă sursa API/aplicație web, infrastructura gazdă, implementările modelului, identitate/RBAC sau un `main.parameters.json` finalizat. Bicep la nivel de grup de resurse ilustrează compoziția modulelor; un punct de intrare tipic la nivel de abonament AZD trebuie să creeze un grup de resurse și să-l invoce la acel nivel. Nu te aștepta ca `azd up` să desfășoare o aplicație completă după copierea doar a acestor fragmente. Pentru o bază funcțională, continuă să folosești șablonul RAG din Modulul 1.

1. **Creează structura de bază:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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

3. **Creează șabloanele de infrastructură:**

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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Exercițiul de laborator 5.1: Provocare creare șablon**

**Provocare**: Creează un șablon AZD pentru o aplicație AI de procesare documente.

**Cerințe:**
- Microsoft Foundry Models pentru analiză de conținut
- Document Intelligence pentru OCR
- Cont de stocare pentru încărcarea documentelor
- Function App pentru logica de procesare
- Aplicație web pentru interfață utilizator

**Puncte bonus:**
- Adaugă gestionarea corectă a erorilor
- Include estimare de cost
- Configurează panouri de monitorizare

## Modul 6: Depanarea problemelor comune

### Probleme comune la implementare

#### Problema 1: Cota serviciului OpenAI depășită
**Simptome:** Implementare eșuează cu eroare de cotă
**Soluții:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelul nu este disponibil în regiune
**Simptome:** Răspunsurile AI eșuează sau apar erori de implementare model
**Soluții:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problema 3: Probleme de permisiuni
**Simptome:** Eroare 403 Forbidden când apelezi serviciile AI
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

### Probleme de performanță

#### Problema 4: Răspunsuri AI lente
**Pași de investigație:**
1. Verifică metricele de performanță în Application Insights
2. Revizuiește metricele serviciului OpenAI în portalul Azure
3. Verifică conectivitatea rețelei și latența

**Soluții:**
- Implementează caching pentru interogări comune
- Folosește modelul OpenAI adecvat pentru cazul tău de utilizare
- Scalează replicile aplicației doar după verificarea limitelor RPM/TPM ale modelului; implementările Azure OpenAI nu expun o setare generică „read replica” asemănătoare bazelor de date

### **Exercițiul de laborator 6.1: Provocare de depanare**

**Scenariu**: Implementarea a reușit, dar aplicația returnează erori 500.

**Sarcini de depanare:**
1. Verifică jurnalele aplicației
2. Verifică conectivitatea serviciului
3. Testarea autentificării
4. Revizuirea configurației

**Unelte de folosit:**
- `azd show` pentru o privire de ansamblu asupra implementării
- Portalul Azure pentru jurnale detaliate ale serviciului
- Application Insights pentru telemetria aplicației

## Modulul 7: Monitorizare și Optimizare

### Pasul 7.1: Configurarea unei monitorizări cuprinzătoare

1. **Creează tablouri de bord personalizate:**

Navighează în portalul Azure și creează un tablou cu:
- Numărul și latența cererilor OpenAI
- Rata erorilor aplicației
- Utilizarea resurselor
- Urmărirea costurilor

2. **Configurează alerte:**
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

Verifică dacă componenta emite telemetrie pentru cereri și adaugă un grup de acțiune dacă sunt necesare notificări. Metriicul este un contor, nu un procent de eșec; o alertă de rată necesită o interogare adecvată și un numitor.

### Pasul 7.2: Optimizarea costurilor

1. **Analizează costurile curente:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Înlocuiește marcajele de dată. Suportul API de consum variază în funcție de acordul de facturare; folosește Cost Management în portal dacă detaliile de utilizare nu sunt disponibile. Costurile sunt întârziate, nu un oracol de testare în timp real.

2. **Implementarea controalelor asupra costurilor:**
- Configurează alerte pentru bugete
- Folosește politici de autoscalare
- Implementează cache pentru cereri
- Monitorizează utilizarea tokenilor pentru OpenAI

### **Exercițiu de laborator 7.1: Optimizarea performanței**

**Sarcină**: Optimizează-ți aplicația AI atât pentru performanță, cât și pentru cost.

**Metrice de îmbunătățit:**
- Redu timpul mediu de răspuns cu 20%
- Redu costurile lunare cu 15%
- Definește un SLO de disponibilitate 99,9% și o fereastră de măsurare (un laborator scurt nu poate demonstra timpul de funcționare lunar)

**Strategii de încercat:**
- Implementează cache pentru răspunsuri
- Optimizează prompturile pentru eficiență token
- Folosește SKU-uri de calcul potrivite
- Configurează autoscalarea corespunzătoare

## Provocarea finală: Implementare end-to-end

### Scenariul provocării

Aceasta este o **provocare opțională de arhitectură/design**, nu un exercițiu executabil furnizat sau o certificare de producție. Propune un chatbot pentru serviciul clienți alimentat de AI și documentează care cerințe necesită implementare suplimentară și dovezi:

**Cerințe funcționale:**
- Interfață web pentru interacțiuni cu clienții
- Integrare cu Microsoft Foundry Models pentru răspunsuri
- Capacitate de căutare documente folosind Azure AI Search
- Integrare cu baza de date clienți existentă
- Suport multi-limbă

**Cerințe non-funcționale:**
- Suport pentru 1000 utilizatori concurenți
- SLA de uptime 99,9%
- Conformitate SOC 2
- Cost sub 500 $/lună
- Implementare în medii multiple (dev, staging, prod)

Acestea sunt constrângeri ipotetice ale părților interesate, nu rezultate garantate simultan. Definește rata cererilor, dimensiunile prompturilor/ieșirilor și durata sesiunii înainte de a estima costurile; 1000 de utilizatori concurenți nu stabilesc o încărcare sau nu demonstrează fezabilitatea unui buget de 500 $. SOC 2 este un rezultat al auditului organizațional, nu un comutator activat de un șablon AZD. Identifică compromisuri și respinge constrângerile nefezabile cu dovezi.

### Pași de implementare

1. **Proiectează arhitectura**
2. **Creează șablonul AZD**
3. **Implementarea măsurilor de securitate**
4. **Configurează monitorizarea și alertarea**
5. **Creează pipeline-uri de implementare**
6. **Documentează soluția**

### Criterii de evaluare

- ✅ **Funcționalitate**: Sunt capabilitățile implementate demonstrate și lacunele rămase explicite?
- ✅ **Securitate**: Sunt bunele practici implementate?
- ✅ **Scalabilitate**: Poate gestiona sarcina?
- ✅ **Mentenabilitate**: Este codul și infrastructura bine organizate?
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

### Resurse comunitare
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Șabloane AZD uimitoare](https://azure.github.io/awesome-azd/)

## 🎓 Punct de verificare a finalizării

Felicitări! Ai finalizat laboratorul AI Workshop. Acum ar trebui să poți:

- ✅ Explica cum să adaptezi o aplicație AI existentă la un șablon AZD
- ✅ Rulează și testează o aplicație AI de referință
- ✅ Implementează cele mai bune practici de securitate pentru sarcini AI
- ✅ Monitorizează și optimizează performanța aplicației AI
- ✅ Depanează probleme comune de implementare

**Curățare:** Rulează `azd env list`, selectează fiecare mediu disposable creat în acest laborator (`myai-workshop`, și dacă a fost implementat `myai-production`/`myai-quota-test`), și rulează `azd down` în fiecare. Revizuiește planul de ștergere; ștergerea doar a configurației locale a unui mediu nu șterge resursele Azure. Evită `--purge` dacă nu înțelegi eliminarea irevocabilă a resurselor soft-șterse.

### Pașii următori
1. Aplică aceste modele proiectelor tale AI
2. Contribuie cu șabloane înapoi comunității
3. Alătură-te Microsoft Foundry Discord pentru suport continuu
4. Explorează subiecte avansate ca implementările multi-regiune

---

**Feedback despre atelier**: Ajută-ne să îmbunătățim acest atelier împărtășind experiența ta în [canalul #Azure Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navigarea capitolelor:**
- **📚 Pagina principală a cursului**: [AZD pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Anterior**: [Implementarea modelului AI](ai-model-deployment.md)
- **➡️ Următor**: [Cele mai bune practici AI în producție](../chapter-08-production/production-ai-practices.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

**Ai nevoie de ajutor?** Alătură-te comunității noastre pentru suport și discuții despre implementările AZD și AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->