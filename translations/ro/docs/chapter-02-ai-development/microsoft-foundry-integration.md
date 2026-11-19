# Integrarea Microsoft Foundry cu AZD

**Navigare capitole:**
- **📚 Acasă curs**: [AZD pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitol anterior**: [Capitolul 1: Primul tău proiect](../chapter-01-foundation/first-project.md)
- **➡️ Următorul**: [Agenți AI](agents.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

## Prezentare generală

Acest ghid demonstrează cum să integrezi serviciile Microsoft Foundry cu Azure Developer CLI (AZD) pentru implementări simplificate de aplicații AI. Microsoft Foundry oferă o platformă cuprinzătoare pentru construirea, implementarea și gestionarea aplicațiilor AI, în timp ce AZD simplifică procesul de infrastructură și implementare.

## Ce este Microsoft Foundry?

Microsoft Foundry este platforma unificată a Microsoft pentru dezvoltarea AI care include:

- **Catalog de modele**: Acces la modele AI de ultimă generație
- **Prompt Flow**: Designer vizual pentru fluxuri de lucru AI
- **Portal Microsoft Foundry**: Mediu integrat de dezvoltare pentru aplicații AI
- **Opțiuni de implementare**: Multiple opțiuni de găzduire și scalare
- **Siguranță și securitate**: Funcții AI responsabile integrate

## AZD + Microsoft Foundry: Mai bune împreună

| Caracteristică | Microsoft Foundry | Beneficiu integrare AZD |
|---------|-----------------|------------------------|
| **Implementare modele** | Implementare manuală prin portal | Implementări automatizate, repetabile |
| **Infrastructură** | Configurare proiect și resurse | Pornește de la `azure.yaml`; extrage Bicep sau Terraform când este nevoie |
| **Gestionarea mediului** | Focalizare pe un singur mediu | Medii multiple (dev/staging/prod) |
| **Integrare CI/CD** | Servicii de implementare și evaluare | Reutilizare configurare în GitHub Actions sau Azure DevOps |
| **Gestionarea costurilor** | Monitorizare de bază | Optimizare costuri specifică mediului |

## Precondiții

- Abonament Azure cu permisiunile corespunzătoare
- Azure Developer CLI versiunea 1.37.0 sau ulterioară pentru fluxul GA Foundry
- Acces la serviciile Microsoft Foundry Models
- Familiaritate de bază cu Microsoft Foundry

> **Actualizare Foundry GA (2026-11-09):** Pachetul de extensii `microsoft.foundry` a ajuns la versiunea 1.0 și disponibilitatea generală la [5 noiembrie 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Parcurgerea de mai jos urmează acel anunț și ghidul rapid Microsoft Learn linkat. Aceasta este o revizuire a documentației, nu o validare de implementare live. Funcțiile opționale în previzualizare și extensiile lansate independent își păstrează propriul statut de lansare.

**Rezultate de învățare:** Instalează pachetul GA, revizuiește un `azure.yaml` al unui agent, compară răspunsurile locale și cele implementate, și explică evaluarea, CI/CD și limitele de curățare. Pentru o implementare pas cu pas a agentului, accesează [ghidul pentru agent găzduit](#hosted-agent-walkthrough-ga). Fragmentele de resurse de mai jos acoperă alte tipare de integrare.

## Tipare principale de integrare

**Scopul exemplelor:** Bicep-ul de mai jos conține fragmente ilustrative de resurse, nu un șablon complet implementabil. Șablonul care îl conține trebuie să definească nume, `location`, resurse referențiate, identități, outputuri și găzduirea aplicației. Folosește un exemplu linkat pentru un punct de pornire executabil. Exemplele Bash necesită autentificare Azure CLI separată de `azd auth login`.

### Tipar 1: Integrarea Microsoft Foundry Models

**Caz de utilizare**: Implementarea aplicațiilor chat cu modele Azure OpenAI în Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**Infrastructură (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

Apelantul are nevoie de o identitate administrată atașată și de `Cognitive Services OpenAI User` la nivelul contului; dezactivarea cheilor nu acordă acces. Verifică disponibilitatea regiunii/modelului/SKU și cota înainte de implementare.

### Tipar 2: AI Search + Integrare RAG

**Caz de utilizare**: Implementarea aplicațiilor cu generare augmentată prin recuperare (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

Nu există o resursă ARM `Microsoft.Search/searchServices/dataConnections` pentru această integrare. Configurează un index Search, o sursă de date, indexer/skillset sau vectorizator prin API-urile suportate Search data-plane. Dacă Search apelează un model de embedare, activează-i identitatea administrată, acordă rolul relevant modelului și configurează abilitatea de embedare/vectorizator. Vezi [vectorizare integrată](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Tipar 3: Integrarea Document Intelligence

**Caz de utilizare**: Fluxuri de procesare și analiză documente

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Tipare de configurare

### Setare variabile mediu

Cu excepția setărilor AZD documentate precum `AZURE_LOCATION`, acestea sunt **numele de intrare ale șabloanelor personalizate**. Nu au efect decât dacă șablonul/aplicația le consumă prin parametri și mapări ale mediului host. Pentru `azure-search-openai-demo`, folosește nume reale precum `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` și `AZURE_SEARCH_SERVICE_SKU` în schimb. Capacitatea modelului nu este SKU cont.

**Configurare producție:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configurare dezvoltare:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Configurare securizată cu Key Vault

Preferă Entra ID cu autentificarea cheii locale dezactivată. Următorul este doar o **alternativă de autentificare cu chei moștenită** pentru aplicații care necesită chei: solicită un cont cu autentificare cheie activată, identitatea aplicației atașată gazdei și acces rețea funcțional la Key Vault. Nu combina preluarea cheilor cu `disableLocalAuth: true` și aștepta-te ca apelurile bazate pe chei să funcționeze.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Fluxuri de implementare

### Extensii AZD pentru Foundry

Pentru fluxul GA, instalează pachetul `microsoft.foundry` în loc să asamblezi extensiile de bază pe rând:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Pachetul instalează agenți, conexiuni, inspector, proiecte, rutine, abilități și truse de unelte. Nu adaugă un grup de comenzi `microsoft.foundry`. Evaluările, seturile de date, fine tuning-ul și modelele personalizate se instalează separat când este nevoie. Vezi [referința de ambalare a extensiilor](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Parcurgere Agent Găzduit (GA)

Un **agent găzduit** execută codul agentului tău pe calcul gestionat de Foundry. Acest exercițiu folosește API-ul de răspunsuri de bază Python Agent Framework din amonte, nu fragmentele clasice Agent Service SDK din alte lecții.

#### 1. Pregătește și inițializează

Folosește un director gol în afara acestui checkout de curs. Instalează Python 3.13 sau mai nou și o versiune curentă [uv release](https://docs.astral.sh/uv/getting-started/installation/). Instalările uv standalone pot folosi `uv self update`. Verifică [permisiunile agentului găzduit](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), disponibilitatea modelului și cota în abonament și regiunea ta înainte de aprovizionare. Resursele Azure și apelurile locale de model implică costuri.

Completează instalarea `azd auth login` și pachetului de mai sus. Codul local de exemplu folosește `DefaultAzureCredential`; dacă folosești credențiale Azure CLI, autentifică-te cu `az login` folosind același cont și tenant ca AZD. Autentificarea AZD singură nu înseamnă autentificare Azure CLI.

Rulează această comandă pe o singură linie în Bash sau PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Alege un proiect Foundry nou sau existent și abonamentul și regiunea intenționate. Pentru a reutiliza o implementare de model, adaugă `--model-deployment <existing-deployment-name>` comenzii de inițializare **înainte să o rulezi** și selectează proiectul existent. Rămâi în directorul care conține `azure.yaml` generat pentru comenzile următoare.

#### 2. Revizuiește definiția implementării

Deschide `azure.yaml` și localizează aceste setări în [exemplul din amonte](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Setare | Ce verifici |
|---------|---------------|
| `host: azure.ai.project` și `deployments` | Proiectul Foundry intenționat și numele modelului, versiunea, SKU de implementare și capacitatea |
| `host: azure.ai.agent` și `project` | Agentul găzduit și directorul care conține sursa sa |
| `codeConfiguration` | Runtime Python și punct de intrare; exemplul revizuit folosește `python_3_13` și `main.py` |
| `uses` | Dependență de serviciul proiectului Foundry |
| `container.resources` | Alocare CPU și memorie, chiar dacă codul este construit remote |
| `env` | Maparea implementării modelului și `PYTHONNOUSERSITE: "1"` pentru a dezactiva încărcarea pachetelor din site-ul utilizatorului |
| `infra.provider` | `microsoft.foundry`, care sintetizează infrastructura necesară |

Comite împreună `azure.yaml` și codul agentului revizuit. Nu este necesară infrastructură scrisă manual pentru a începe; când ai nevoie de fișiere de aprovizionare editabile, urmează [extracția infrastructurii](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) pentru Bicep sau Terraform și continuă să folosești `azd provision`. Nu comite acreditări sau starea mediului `.azure/`.

#### 3. Aprovizionează și testează local

```bash
azd provision
azd ai agent run
```

Aprovizionarea poate crea implementări de model lipsă **chiar și în proiect reutilizat**. Revizuiește prompturile modelului și selectează un tip disponibil de implementare online precum Global Standard sau Data Zone Standard; cotele și suportul regional variază.

Execuția locală pregătește dependențe și deschide **Agent Inspector**, unde poți inspecta cererile, răspunsurile și activitatea uneltelor/modelului. Ține-l deschis și deschide un al doilea terminal în același director de proiect:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Checkpoint:** Confirmă că primești un răspuns relevant și poți inspecta activitatea locală asociată. Execuția locală încă apelează implementarea modelului tău Azure; nu este un test offline sau gratuit. Folosește prompturi sintetice și evită expunerea secretelor sau datelor sensibile în ieșirea inspectorului.

#### 4. Implementare și comparație

Oprește execuția locală cu Ctrl+C când ai terminat. Înainte de invocarea la distanță, configurează sau verifică [conexiunea Application Insights și accesul la citirea trace-urilor](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) al proiectului.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

În modul de implementare în cod, AZD încarcă sursa pentru o compilare remote Foundry; nu este nevoie de o construcție locală de container pentru acest traseu. Ieșirea implementării oferă link-uri playground și endpoint. Verifică un răspuns de la agentul implementat și trace-ul său cloud; evenimentele inspectorului local singure nu dovedesc că trasabilitatea cloud funcționează.

Pentru schimbările ulterioare, revizuiește configurarea agentului găzduit suportată cu `azd deploy --preview`. Fluxul jurnalelor cu `azd ai agent monitor --follow`, sau diagnosticul configurării și problemelor de acces cu `azd ai agent doctor`. O previzualizare a implementării nu este o revizuire completă a infrastructurii sau securității.

#### 5. Adaugă o verificare repetabilă a calității

Instalează extensia de evaluări lansată independent, apoi generează materiale inițiale de test:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Descrie comportamentul intenționat al agentului și selectează **Set de date și evaluator**, apoi **Turn**. Revizuiește și editează cazurile generate și rubrica de notare, inclusiv un caz de întrebare nesuportată, înainte să configurezi evaluarea:

```bash
azd ai eval init --name quality
```

Selectează setul de date și rubrica revizuite și confirmă implementarea modelului pentru judecător. Inspectează `evals/azure.eval.yaml` și referința serviciului de evaluare în `azure.yaml`, apoi înregistrează materialele și execută:

```bash
azd up
azd ai eval run start --eval quality
```

Inspectează scorurile și cazurile eșuate sau cu erori; o evaluare finalizată nu este automat o trecere a calității. Generarea și notarea implică și costuri model. Comite configurările non-secrete, seturile de date și rubricile pentru ca colegii să poată compara schimbările. `azd ai agent optimize` poate reutiliza o evaluare compatibilă ca bază, dar revizuiește candidații înainte de a implementa explicit una. Vezi [porți de calitate și migrarea](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) pentru proiecte mai vechi și CI.

#### 6. Reutilizează fluxul în CI/CD

După un succes `azd up`, rulează `azd pipeline config` și revizuiește fluxul GitHub Actions sau Azure DevOps generat. Instalează `microsoft.foundry` pe runner, plus `azure.ai.evaluations` dacă rulezi evaluări. Păstrează setările generate de checkout, autentificare și mediu; instalarea singură nu autentifică pipeline-ul.

Folosește un mediu AZD separat pentru fiecare etapă, acordă identității pipeline permisiunile necesare pentru resurse și Foundry, și păstrează acreditările în secrete pipeline sau folosește identitate federată. Comite materialele de evaluare și verifică dacă identitatea poate accesa seturile de date/evaluatorii referențiați. Vezi [exemplul pipeline-ului cursului](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) și [ghidul Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Curățare deliberată

Pentru un **proiect nou creat de acest mediu**, revizuiește resursele listate de `azd down` înainte de confirmare: va șterge grupul de resurse și tot ce conține.

Pentru un **proiect reutilizat**, `azd down` lasă proiectul, agentul găzduit și alte resurse în loc. Elimină doar resursele nedorite pe care le deții folosind [ghidul de curățare quickstart](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); nu șterge un grup de resurse partajat pentru a curăța un singur exercițiu.

**Verificare finalizare:** Explică ce setări controlează comportamentul local și în cloud, arată răspunsurile locale și implementate, revizuiește un rezultat de evaluare și identifică ce resurse rămân după curățare.

### Opțional: Scaffold cu Microsoft Foundry Skill

Instalează [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) pentru gazda agentului tău de cod, apoi deschide un folder gol separat. Cere să scaffoldeze exemplul de bază Python Agent Framework Responses API în modul implementare cod, explică `azure.yaml` generat și propune abonamentul, regiunea, proiectul și implementarea modelului. Cere aprobare **înainte de crearea resurselor Azure**, solicită un test local și oprește înainte de implementare. Revizuiește output-ul și continuă cu pașii de implementare de mai sus doar când ești gata.

Pentru proiectele existente, `--template`/`-t` înlocuiește ortografia învechită `--manifest`/`-m`; schimbarea flagului nu migrează manifeste vechi sau configurația agentului înglobat. Consultați [referința AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Implementare printr-o singură comandă

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Implementări specifice mediului

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Monitorizare și Observabilitate

### Integrarea Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

Aceasta alocă o resursă Insights, nu o instrumentație de telemetrie. Odată ce aplicația dvs. emite span-uri outbound de apelare model, rulați această interogare ilustrativă în Application Insights Logs (adaptați filtrul la numele reale ale span-urilor):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Monitorizarea costurilor

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

Folosiți un destinatar real și verificați permisiunile de acces în domeniul de facturare. Un buget trimite alerte; nu este o limită de cheltuieli.

## 🔐 Cele mai bune practici de securitate

### Configurarea identității gestionate

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Securitatea rețelei

Acest fragment de endpoint are nevoie și de o zonă/grup DNS privat, link-uri VNet, conectivitate aplicație VNet și o politică explicită de acces public. Crearea unui endpoint privat singur nu dezactivează accesul public.

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
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

## Optimizarea performanței

### Strategii de caching

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache for Redis Basic/Standard/Premium este pe un [drum de pensionare](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); folosiți Azure Managed Redis pentru implementările noi și urmați ghidul curent pentru template/autentificare. Limitați răspunsurile cache AI după autorizare, model/instrucțiuni și versiunea datelor, cu expirare; nu distribuiți niciodată răspunsuri private folosind doar textul interogării.

### Configurarea auto-scalării

**Resursă parțială:** integrați aceste setări de scalare/ingress într-o aplicație completă Container App cu un mediu gestionat, imagine container și limite de resursă. Mai multe replici nu cresc cota modelului.

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Depanarea problemelor comune

### Problema 1: Cota OpenAI depășită

**Simptome:**
- Implementarea eșuează cu erori de cotă
- Erori 429 în jurnalele aplicației

**Soluții:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

Variabila capacity de mai sus se aplică doar unui template personalizat configurat să o consume. Pentru exemplul RAG, folosiți `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Nu schimbați `AZURE_LOCATION` pentru a muta resurse existente; creați un mediu separat pentru o regiune nouă și planificați migrarea/curățenia.

### Problema 2: Eșecuri de autentificare

**Simptome:**
- Erori 401/403 la apelarea serviciilor AI
- Mesaje „Acces refuzat”

**Soluții:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problema 3: Probleme la implementarea modelului

**Simptome:**
- Modele indisponibile în implementare
- Versiuni specifice de model eșuând

**Soluții:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Exemple de template-uri

Acestea sunt alternative, nu comenzi secvențiale. Începeți fiecare într-un director gol separat. Destinația explicită `.` păstrează inițializarea în directorul curent; altfel AZD curent poate crea un subdirector cu numele template-ului fără să schimbe directorul de lucru al shell-ului.

### Aplicație Chat RAG (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descriere**: O aplicație de referință chat RAG pentru întrebări pe documentele dvs., cu recuperare prin Azure AI Search. Revizuiți modelele suportate actual, funcțiile opționale, ghidul de costuri și întărirea pentru producție înainte de utilizare; implementarea unui exemplu nu face aplicația gata de producție.

**Pornire rapidă**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplicație Chat RAG (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descriere**: Echivalentul .NET/C# al exemplului chat RAG Python. Construit cu ASP.NET Core Minimal API și frontend Blazor WebAssembly. Include chat vocal, suport viziune GPT-4o-mini și client desktop/mobile companion .NET MAUI Blazor Hybrid.

**Pornire rapidă**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplicație Chat RAG (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servicii**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descriere**: Versiunea Java a exemplului chat RAG utilizând Langchain4J pentru orchestrarea AI. Suportă arhitectură microservicii bazată pe evenimente, multiple strategii de căutare (text, vector, hibrid), încărcare documente cu Azure Document Intelligence și implementare pe Azure Container Apps sau Azure Kubernetes Service.

**Pornire rapidă**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copilot Enterprise Retail cu Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicii**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descriere**: Copilot retail end-to-end RAG folosind Microsoft Foundry și Prompty. Un chatbot Contoso Outdoor retailer care bazează răspunsurile pe catalogul de produse și datele comenzilor clienților. Demonstrează fluxul complet GenAIOps — prototip cu Prompty, evaluare cu evaluatori AI asistați și implementare via AZD la Container Apps.

**Pornire rapidă**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplicație Multi-Agent Creativ Writing

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servicii**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descriere**: Exemplu multi-agent demonstrând orchestrarea agenților AI cu Prompty. Folosește un agent de cercetare (Bing Grounding în Azure AI Agent Service), un agent de produs (Azure AI Search), un agent scriitor și un agent editor pentru producerea colaborativă de articole bine documentate. Include CI/CD cu evaluare în GitHub Actions.

**Pornire rapidă**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat Serverless RAG (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servicii**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB pentru NoSQL + LangChain.js

**Descriere**: Chatbot RAG complet serverless folosind LangChain.js cu Azure Functions pentru API și Azure Static Web Apps pentru hosting. Folosește Azure Cosmos DB ca depozit vectorial și bază de date pentru istoricul conversației. Suportă dezvoltarea locală cu Ollama pentru testare fără costuri.

**Pornire rapidă**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Accelerator Chat cu Datele Tale

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servicii**: Microsoft Foundry + Azure Container Apps (web/API/ingestie) + Azure AI Search cu Cosmos DB, sau PostgreSQL cu pgvector

**Descriere**: Accelerator chat bazat pe documente cu citări. Exemplul actual găzduiește un frontend React, backend FastAPI și worker de ingestie Functions pe Container Apps; opțiunile de orchestrare sunt Agent Framework și LangGraph. Opțiunile de bază de date/recuperare sunt selectate la implementare. Este un punct de plecare, nu un sistem gata de producție; nu presupuneți că variantele mai vechi App Service, Semantic Kernel sau Prompt Flow descriu standardul actual.

**Pornire rapidă**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agenți de călătorie AI — Orchestrare Multi-Agent MCP

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servicii**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Descriere**: Aplicație de referință pentru orchestrarea multi-agent AI folosind trei framework-uri (LangChain.js, LlamaIndex.TS și Microsoft Agent Framework). Caracteristici MCP (Model Context Protocol) servers în patru limbi implementate ca Azure Container Apps serverless cu monitorizare OpenTelemetry.

**Pornire rapidă**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Răsfoiți mai multe template-uri**: Vizitați [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) pentru template-uri disponibile curent în diverse limbi și scenarii. Fiecare exemplu legat este un repository extern, nu un exemplu local furnizat de acest curs; examinați prerechizitele și indicațiile de producție curente înainte de implementare.

## Pașii următori

1. **Încercați exemplele**: Începeți cu un template preconstruit care se potrivește cazului dvs. de utilizare
2. **Personalizați după nevoi**: Modificați infrastructura și codul aplicației
3. **Adăugați monitorizare**: Implementați o observabilitate cuprinzătoare
4. **Optimizați costurile**: Ajustați configurațiile pentru bugetul dvs.
5. **Asigurați implementarea**: Implementați modele de securitate enterprise
6. **Scalează pentru producție**: Adăugați caracteristici multi-regiune și înaltă disponibilitate

## 🎯 Exerciții practice

### Exercițiul 1: Implementați aplicația chat Microsoft Foundry Models (30 minute)
**Scop**: Implementați și testați o aplicație de referință chat AI

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Review the listed resources and confirm cleanup
azd down
```

**Criterii de succes:**
- [ ] Implementare finalizată fără erori de cotă
- [ ] Se poate accesa interfața de chat în browser
- [ ] Se pot pune întrebări și se primesc răspunsuri alimentate de AI
- [ ] Application Insights afișează date de telemetrie
- [ ] Resursele au fost curățate cu succes

**Cost:** Consultați ghidul curent de cost al eșantionului și SKU-urile selectate înainte de implementare. Facturarea continuă până când resursele sunt șterse; nu există o estimare fixă de 30 de minute pentru fiecare configurație.

### Exercițiul 2: Configurați implementarea multi-model (45 minute)
**Scop**: Implementați mai multe modele AI cu configurații diferite

**Punct de plecare:** Un cont Azure OpenAI existent și un modul AZD cu scop de grup de resurse care poate apela acest fișier. Creați `infra/ai-models.bicep` cu următorul conținut folosind editorul dvs. Nu este implementat automat doar pentru că se află sub `infra/`.

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Din modulul cu scop grup de resurse care deține contul, adăugați o invocare a modulului (adaptați numele simbolului la contul dvs. real):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Nu declarați aceleași implementări în ambele module. Dacă punctul de intrare AZD este la nivel abonament, invocați-l din modulul copil cu scop grup de resurse și ajustați calea relativă. Compilați acel modul conținător cu `az bicep build --file <path-to-containing-module>`, apoi:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Criterii de succes:**
- [ ] Mai multe modele implementate cu succes
- [ ] Setări de capacitate diferite aplicate
- [ ] Modele accesibile prin API
- [ ] Se poate apela ambele modele din aplicație

### Exercițiul 3: Implementați monitorizarea costurilor (20 minute)
**Scop**: Configurați alerte de buget și urmărirea costurilor

**Punct de plecare:** Modelul de buget de mai sus și un modul de infrastructură cu scop grup de resurse. Adăugați această resursă folosind editorul; transmiteți `budgetStartDate` din maparea parametrilor dvs. (nu duplicați parametrul dacă este deja declarat). Înlocuiți destinatarul și confirmați că aveți acces de scriere în buget.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Așteptat: răspunsul conține `amount: 200`, ambele praguri și destinatarul dvs. Inspectați Cost Management în portal pentru taxele reale; datele de cost sunt întârziate și o alertă nu trebuie să pornească într-un exercițiu scurt.

**Criterii de succes:**
- [ ] Alertă buget creată în Azure
- [ ] Notificări email configurate
- [ ] Se pot vizualiza date despre costuri în Azure Portal
- [ ] Praguri buget setate corespunzător

## 💡 Întrebări frecvente

<details>
<summary><strong>Cum reduc costurile Microsoft Foundry Models în timpul dezvoltării?</strong></summary>

1. **Verificați prețurile**: Nu există o alocație universală gratuită de 50,000 de tokeni lunar pentru modelele Azure OpenAI
2. **Dimensionați capacitatea corect**: Capacitatea `10` reprezintă de obicei 10,000 TPM pentru aceste modele Standard text, nu 10 TPM. Reducerea ratei de limitare nu reduce prețurile pe token
3. **Folosiți azd down**: Ștergeți resursele eliminațile atunci când nu dezvoltați activ (nu este dezalocare)
4. **Cachează răspunsurile**: Implementați cache Redis pentru interogări repetate
5. **Folosiți ingineria prompturilor**: Reduceți utilizarea de tokeni cu prompturi eficiente

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Care este diferența între Microsoft Foundry Models și OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Securitate enterprise și conformitate
- Integrare rețea privată
- Garanții SLA
- Autentificare identitate gestionată
- Cote mai mari disponibile

**OpenAI API**: Un furnizor/API separat cu propria disponibilitate a modelelor, prețuri, autentificare și opțiuni de conectivitate enterprise. Comparați ofertele curente în loc să presupuneți că este doar pe internet public sau că livrează mereu modelele primele.

Alegeți în funcție de cerințele organizației dvs.; exemplele Azure specifice cu identitate gestionată și private-link din acest curs se aplică serviciilor găzduite în Azure, nu fiecărui model/furnizor din catalogul Foundry.
</details>

<details>
<summary><strong>Cum gestionez erorile de depășire a cotei la Microsoft Foundry Models?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Pot să folosesc propriile mele date cu Microsoft Foundry Models?</strong></summary>

Da! Folosiți **Azure AI Search** pentru RAG (Generare augmentată prin recuperare):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Consultați template-ul [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Cum securizez punctele finale ale modelelor AI?</strong></summary>

**Cele mai bune practici**:
1. Folosește Managed Identity (fără chei API)
2. Activează Private Endpoints
3. Configurează grupuri de securitate în rețea
4. Implementează limitarea ratei
5. Utilizează Azure Key Vault pentru secrete

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Comunitate și Suport

- **Microsoft Foundry Discord**: [canalul #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Probleme și discuții](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentație oficială](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Competența Microsoft Foundry pe skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instalează competențele agentului Azure + Foundry în editorul tău cu `npx skills add microsoft/github-copilot-for-azure`

---

**Navigarea capitolului:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Capitolul anterior**: [Capitolul 1: Primul tău proiect](../chapter-01-foundation/first-project.md)
- **➡️ Următor**: [Agenți AI](agents.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

**Ai nevoie de ajutor?** Alătură-te discuțiilor din comunitate sau deschide o problemă în depozit. Comunitatea Azure AI + AZD este aici să te ajute să reușești!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->