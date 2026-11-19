# Integrasyon ng Microsoft Foundry kasama ang AZD

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [AI Agents](agents.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../chapter-03-configuration/configuration.md)

## Pangkalahatang Pagsusuri

Ipinapakita ng gabay na ito kung paano i-integrate ang Microsoft Foundry services sa Azure Developer CLI (AZD) para sa mas maayos na deployment ng AI applications. Nagbibigay ang Microsoft Foundry ng komprehensibong platform para sa paggawa, pag-deploy, at pamamahala ng AI applications, habang pinapasimple ng AZD ang proseso ng infrastructure at deployment.

## Ano ang Microsoft Foundry?

Ang Microsoft Foundry ay pinag-isang platform ng Microsoft para sa AI development na kinabibilangan ng:

- **Model Catalog**: Access sa mga pinaka-makabagong AI models
- **Prompt Flow**: Visual designer para sa AI workflows
- **Microsoft Foundry Portal**: Integrated development environment para sa AI applications
- **Deployment Options**: Maraming hosting at scaling options
- **Safety and Security**: Built-in na responsable na mga AI feature

## AZD + Microsoft Foundry: Mas Maganda Kapag Magkasama

| Tampok | Microsoft Foundry | Benepisyo sa Integrasyon ng AZD |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual na deployment gamit ang portal | Automated, paulit-ulit na deployment |
| **Infrastructure** | Configuration ng proyekto at resources | Magsimula mula sa `azure.yaml`; i-eject ang Bicep o Terraform kung kinakailangan |
| **Pamamahala ng Kapaligiran** | Nakatuon sa isang kapaligiran | Maramihang kapaligiran (dev/staging/prod) |
| **CI/CD Integration** | Deployment at evaluation services | Muling gamitin ang configuration sa GitHub Actions o Azure DevOps |
| **Pamamahala ng Gastos** | Pangunahing monitoring | Optimizasyon ng gastos ayon sa kapaligiran |

## Mga Kailangang Ihanda

- Azure subscription na may angkop na mga permiso
- Azure Developer CLI 1.37.0 o mas bago para sa GA Foundry workflow
- Access sa Microsoft Foundry Models services
- Pangunahing kaalaman sa Microsoft Foundry

> **Foundry GA update (2026-11-09):** Ang `microsoft.foundry` extension bundle ay umabot sa bersyon 1.0 at general availability noong [November 5, 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Ang gabay sa ibaba ay sumusunod sa anunsyo na iyon at sa naka-link na Microsoft Learn quickstart. Ito ay pagsusuri ng dokumentasyon, hindi aktwal na validation ng deployment. Ang mga opsyonal na preview feature at mga independently released extension ay may sariling release status.

**Mga Nilalaman na Matututunan:** I-install ang GA bundle, suriin ang `azure.yaml` ng isang agent, ikumpara ang lokal at deployed na mga sagot, at ipaliwanag ang evaluation, CI/CD, at mga hangganan ng paglilinis. Para sa sunud-sunod na deployment ng agent, pumunta sa [hosted-agent walkthrough](#hosted-agent-walkthrough-ga). Ang mga resource fragment sa ibaba ay sumasaklaw sa iba pang mga pattern ng integrasyon.

## Pangunahing Mga Pattern ng Integrasyon

**Saklaw ng mga halimbawa:** Ang Bicep sa ibaba ay naglalaman ng mga halimbawa ng resource fragment, hindi isang kumpletong deployable na template. Ang naglalaman na template ay dapat magdeklara ng mga pangalan, `location`, mga referenced resources, mga pagkakakilanlan, outputs, at pagho-host ng application. Gumamit ng naka-link na halimbawa para sa isang runnable na panimulang punto. Ang mga Bash halimbawa ay nangangailangan ng Azure CLI authentication nang hiwalay mula sa `azd auth login`.

### Pattern 1: Integrasyon ng Microsoft Foundry Models

**Gamit:** Mag-deploy ng chat applications gamit ang Azure OpenAI models sa Microsoft Foundry

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

**Infrastructure (main.bicep):**
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

Kailangan ng caller na may nakakabit na managed identity at `Cognitive Services OpenAI User` sa account scope; ang pag-disable ng mga key ay hindi nagbibigay ng access. Tingnan ang availability ng region/model/SKU at quota bago mag-deploy.

### Pattern 2: AI Search + RAG Integration

**Gamit:** Mag-deploy ng retrieval-augmented generation (RAG) applications

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

Walang `Microsoft.Search/searchServices/dataConnections` ARM resource para sa integrasyong ito. I-configure ang Search index, data source, indexer/skillset o vectorizer gamit ang supported na Search data-plane APIs. Kung tatawagin ng Search ang isang embedding model, payagan ang managed identity nito, bigyan ng kaukulang model role, at i-configure ang embedding skill/vectorizer. Tingnan ang [integrated vectorization](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Pattern 3: Document Intelligence Integration

**Gamit:** Mga workflow sa pagproseso at pagsusuri ng dokumento

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

## 🔧 Mga Pattern ng Configuration

### Pag-setup ng Environment Variables

Maliban sa mga dokumentadong AZD setting tulad ng `AZURE_LOCATION`, ito ay mga **pangalan ng custom-template input**. Wala silang epekto maliban na lamang kung kakainin sila ng template/application gamit ang parameter at host-environment mappings. Para sa `azure-search-openai-demo`, gamitin ang aktwal na mga pangalan tulad ng `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` at `AZURE_SEARCH_SERVICE_SKU` sa halip. Ang kapasidad ng modelo ay hindi account SKU.

**Production Configuration:**
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

**Development Configuration:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Secure Configuration gamit ang Key Vault

Mas mainam ang Entra ID na may lokal na key authentication na naka-disable. Ang sumusunod ay isang **lumang alternatibo ng key-authentication** para sa mga application na nangangailangan ng mga key: nangangailangan ito ng account na may key authentication na naka-enable, application identity na nakakabit sa kanyang host, at gumaganang Key Vault access/networking. Huwag pagsamahin ang pagkuha ng key gamit ang `disableLocalAuth: true` at umaasang gagana ang key-based na tawag.

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

## Mga Workflow sa Deployment

### Mga Extension ng AZD para sa Foundry

Para sa GA workflow, i-install ang `microsoft.foundry` bundle sa halip na isa-isang i-assemble ang mga core extension:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Ina-install ng bundle ang mga agent, koneksyon, inspector, mga proyekto, routines, skills, at toolboxes. Hindi nito idinadagdag ang isang `microsoft.foundry` na command group. Ang evaluations, datasets, fine-tuning, at mga custom model ay ini-install nang hiwalay kung kinakailangan. Tingnan ang [extension packaging reference](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Hosted-Agent Walkthrough (GA)

Ang isang **hosted agent** ay nagpapatakbo ng iyong agent code sa Foundry-managed compute. Ang ehersisyong ito ay gumagamit ng upstream basic Python Agent Framework Responses API sample, hindi ang klasikong Agent Service SDK fragments sa ibang mga aralin.

#### 1. Maghanda at mag-initialize

Gumamit ng walang laman na direktoryo na nasa labas ng checkout ng kursong ito. Mag-install ng Python 3.13 o mas bago at ng kasalukuyang [uv release](https://docs.astral.sh/uv/getting-started/installation/). Ang standalone na uv installation ay maaaring gumamit ng `uv self update`. Suriin ang [hosted-agent permissions](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), availability ng modelo, at quota sa iyong subscription at rehiyon bago mag-provision. Ang Azure resources at mga lokal na tawag sa modelo ay nagkakaroon ng gastos.

Kumpletuhin ang `azd auth login` at ang pag-install ng bundle na nasa itaas. Ang lokal na sample code ay gumagamit ng `DefaultAzureCredential`; kung gumagamit ng Azure CLI credentials, mag-sign in gamit ang `az login` gamit ang parehong account at tenant ng AZD. Ang pag-sign in sa AZD lamang ay hindi pag-sign in sa Azure CLI.

Patakbuhin ang isang-linyang command na ito sa Bash o PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Pumili ng bagong o umiiral na Foundry project at ang nilalayong subscription at rehiyon. Para muling gamitin ang isang model deployment, idagdag ang `--model-deployment <existing-deployment-name>` sa initialization command **bago ito patakbuhin**, at piliin ang umiiral na proyekto. Manatili sa direktoryong naglalaman ng generated `azure.yaml` para sa mga natitirang command.

#### 2. Suriin ang deployment definition

Buksan ang `azure.yaml` at hanapin ang mga setting na ito sa [upstream sample](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Setting | Anong Suriin |
|---------|---------------|
| `host: azure.ai.project` at `deployments` | Nilalayong Foundry project at pangalan ng modelo, bersyon, deployment SKU, at kapasidad |
| `host: azure.ai.agent` at `project` | Hosted agent at ang direktoryong naglalaman ng source nito |
| `codeConfiguration` | Python runtime at entry point; ang sinusuring sample ay gumagamit ng `python_3_13` at `main.py` |
| `uses` | Dependensya sa Foundry project service |
| `container.resources` | CPU at memory allocation, kahit na ang code ay binuo sa malayo |
| `env` | Mapping ng model deployment at `PYTHONNOUSERSITE: "1"` para i-disable ang pag-load ng user-site package |
| `infra.provider` | `microsoft.foundry`, na siyang gumagawa ng kinakailangang infrastructure |

I-commit ang sinusuring `azure.yaml` at agent code nang magkasama. Walang kailangang handwritten infrastructure para magsimula; kapag kailangan mo ng mga editable provisioning na file, sundin ang [infrastructure ejection](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) para sa Bicep o Terraform at ipagpatuloy ang paggamit ng `azd provision`. Huwag mag-commit ng mga credentials o `.azure/` environment state.

#### 3. Mag-provision at subukan nang lokal

```bash
azd provision
azd ai agent run
```

Maaaring gumawa ang provisioning ng mga nawawalang model deployments **kahit sa reused project**. Suriin ang mga model prompt at piliin ang magagamit na online deployment type tulad ng Global Standard o Data Zone Standard; ang quota at supporta sa rehiyon ay nag-iiba.

Inihahanda ng lokal na pagtakbo ang mga dependencies at binubuksan ang **Agent Inspector**, kung saan maaari mong siyasatin ang mga request, sagot, at aktibidad ng tool/model. Panatilihing bukas ito at buksan ang pangalawang terminal sa parehong project directory:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Checkpoint:** Kumpirmahin na makatanggap ka ng kaugnay na sagot at maaaring suriin ang kaugnay na lokal na aktibidad. Ang lokal na pagpapatupad ay tumatawag pa rin sa iyong Azure model deployment; ito ay hindi isang offline o libreng pagsubok. Gumamit ng synthetic prompts at iwasang ipakita ang mga lihim o sensitibong data sa output ng inspector.

#### 4. Mag-deploy at ikumpara

Itigil ang lokal na pagtakbo gamit ang Ctrl+C kapag tapos na. Bago ang remote invocation, i-configure o suriin ang [Application Insights connection at trace-reading access](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) ng proyekto.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

Sa mode ng deployment sa code, ina-upload ng AZD ang source para sa remote Foundry build; hindi mo kailangan ng lokal na build ng container para sa path na ito. Nagbibigay ang output ng deployment ng mga playground at endpoint na link. Suriin ang sagot mula sa deployed agent at ang cloud trace nito; ang lokal na inspector events lamang ay hindi nagpapatunay na gumagana ang cloud tracing.

Para sa mga susunod na pagbabago, suriin ang suportadong hosted-agent configuration gamit ang `azd deploy --preview`. I-stream ang mga log gamit ang `azd ai agent monitor --follow`, o i-diagnose ang mga setup at access problem gamit ang `azd ai agent doctor`. Ang deployment preview ay hindi isang kumpletong pagsusuri ng infrastructure o seguridad.

#### 5. Magdagdag ng paulit-ulit na quality check

I-install ang independently released evaluations extension, pagkatapos ay bumuo ng draft na mga test asset:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Ilarawan ang nilalayong ugali ng agent at piliin ang **Dataset and evaluator**, pagkatapos ay **Turn**. Suriin at i-edit ang mga nabuo na kaso at grading rubric, kabilang ang kasusang may unsupported na tanong, bago i-configure ang evaluation:

```bash
azd ai eval init --name quality
```

Piliin ang nasuring dataset at rubric at kumpirmahin ang judge model deployment. Siyasatin ang `evals/azure.eval.yaml` at ang evaluation-service reference nito sa `azure.yaml`, pagkatapos irehistro ang mga assets at isagawa:

```bash
azd up
azd ai eval run start --eval quality
```

Siyasatin ang mga score at mga nabigong o nag-error na kaso; ang isang natapos na evaluation ay hindi awtomatikong tanda ng quality pass. Ang generation at scoring ay nagdudulot din ng mga singil ng modelo. I-commit ang nonsecret configuration, mga datasets, at rubric upang maikumpara ng mga kasama sa team ang mga pagbabago. Maaaring muling gamitin ng `azd ai agent optimize` ang compatible evaluation bilang baseline, ngunit suriin ang mga kandidato bago tahasang mag-deploy ng isa. Tingnan ang [quality gates at migration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) para sa mga lumang proyekto at CI.

#### 6. Muling gamitin ang workflow sa CI/CD

Matapos ang matagumpay na `azd up`, patakbuhin ang `azd pipeline config` at suriin ang nabuo na GitHub Actions o Azure DevOps workflow. I-install ang `microsoft.foundry` sa runner, pati na rin ang `azure.ai.evaluations` kung nagpapatakbo ng mga evaluation. Panatilihin ang mga generated checkout, sign-in, at environment setting; ang pag-install lamang ay hindi awtomatikong nagpapatotoo sa pipeline.

Gumamit ng hiwalay na AZD environment para sa bawat stage, bigyan ang pipeline identity ng kinakailangang resource at Foundry permissions, at panatilihin ang mga kredensyal sa pipeline secrets o gumamit ng federated identity. I-commit ang evaluation assets at tiyaking ma-access ng identity ang mga referenced datasets/evaluators. Tingnan ang [course pipeline example](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) at [Foundry CI/CD guide](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Linisin nang sinadya

Para sa isang **bagong proyekto na nilikha ng environment na ito**, suriin ang mga resources na nakalistang ng `azd down` bago kumpirmahin: ito ay magtatanggal ng resource group at lahat ng laman nito.

Para sa isang **reused na proyekto**, iiwan ng `azd down` ang proyekto, hosted agent, at ibang mga resource sa lugar. Tanggalin lamang ang mga hindi gustong resource na pag-aari mo gamit ang [quickstart cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); huwag tanggalin ang shared resource group para linisin ang isang ehersisyo.

**Pagsusuri sa Pagtatapos:** Ipaliwanag kung aling mga setting ang kumokontrol sa lokal at cloud na kilos, ipakita ang mga lokal at deployed na sagot, suriin ang resulta ng evaluation, at tukuyin kung aling mga resource ang nananatili pagkatapos ng paglilinis.

### Opsyonal: Gawing Scaffold gamit ang Microsoft Foundry Skill

I-install ang [Microsoft Foundry Skill](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) para sa host ng iyong coding agent, pagkatapos buksan ang isang hiwalay na walang laman na folder. Hilingin na i-scaffold ang basic Python Agent Framework Responses API sample sa mode ng code deployment, ipaliwanag ang nabuo na `azure.yaml`, at imungkahi ang subscription, rehiyon, proyekto, at model deployment. Kailanganin ang pag-apruba **bago gumawa ng Azure resources**, hilingin ang lokal na pagsubok, at huminto bago ang deployment. Suriin ang output nito at ipagpatuloy ang mga hakbang ng deployment sa itaas kapag handa na.

Para sa mga umiiral na proyekto, ang `--template`/`-t` ay pumapalit sa deprecated na baybay na `--manifest`/`-m`; ang pagpapalit ng flag ay hindi nagmi-migrate ng mga legacy manifest o nested na agent configuration. Tingnan ang [AI CLI reference](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Single Command Deployment

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Environment-Specific Deployments

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

## Monitoring and Observability

### Application Insights Integration

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

Ito ay naglalaan ng isang Insights resource, hindi telemetry instrumentation. Kapag naglabas ang iyong app ng outbound model-call spans, patakbuhin ang ilustratibong query na ito sa Application Insights Logs (i-adapt ang filter sa iyong aktwal na mga pangalan ng span):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Cost Monitoring

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

Gumamit ng totoong tatanggap at suriin ang mga permiso sa billing-scope. Ang budget ay nagpapadala ng mga alerto; hindi ito spending cap.

## 🔐 Security Best Practices

### Managed Identity Configuration

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

### Network Security

Ang fragment ng endpoint na ito ay kailangan din ng private DNS zone/group, VNet links, application VNet connectivity, at isang explicit na public-access policy. Ang paglikha ng private endpoint lamang ay hindi nagpapatigil sa public access.

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

## Performance Optimization

### Caching Strategies

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

Ang Azure Cache para sa Redis Basic/Standard/Premium ay nasa [retirement path](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); gamitin ang Azure Managed Redis para sa mga bagong deployment at sundin ang kasalukuyang template/authentication na gabay. I-scope ang cached AI responses ayon sa authorization, model/instructions, at bersyon ng data, na may expiry; huwag kailanman ibahagi ang mga pribadong tugon gamit lamang ang query text.

### Auto-scaling Configuration

**Partial resource:** pagsamahin ang mga setting na scale/ingress na ito sa isang kumpletong Container App na may managed environment, container image, at mga resource limit. Hindi nadadagdagan ang model quota sa pagdagdag ng mas maraming replicas.

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

## Troubleshooting Common Issues

### Issue 1: OpenAI Quota Exceeded

**Sintomas:**
- Nabibigo ang deployment dahil sa quota errors
- 429 errors sa mga application logs

**Mga Solusyon:**
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

Ang capacity variable sa itaas ay nalalapat lamang sa isang custom na template na naka-wire upang gamitin ito. Para sa RAG sample, gamitin ang `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Huwag baguhin ang `AZURE_LOCATION` para ilipat ang mga umiiral na resources sa lugar; gumawa ng hiwalay na environment para sa bagong rehiyon at planuhin ang migration/paglilinis.

### Issue 2: Authentication Failures

**Sintomas:**
- 401/403 errors kapag tumatawag sa AI services
- Mga mensaheng "Access denied"

**Mga Solusyon:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Issue 3: Model Deployment Issues

**Sintomas:**
- Mga modelo na hindi available sa deployment
- Mga partikular na bersyon ng modelo na pumapalya

**Mga Solusyon:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Example Templates

Ito ay mga alternatibo, hindi sunod-sunod na mga utos. Simulan ang bawat isa sa hiwalay na walang laman na direktoryo. Ang explicit na `.` destination ay pinananatili ang initialization sa kasalukuyan mong directory; kung hindi, ang kasalukuyang AZD ay maaaring lumikha ng isang template-named child directory nang hindi binabago ang working directory ng iyong shell.

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Paglalarawan**: Isang RAG chat reference application para sa mga tanong tungkol sa iyong mga dokumento, gamit ang Azure AI Search retrieval. Suriin ang kasalukuyang mga suportadong modelo ng sample, mga opsyonal na feature, gabay sa gastos, at production hardening bago gamitin; ang pag-deploy ng sample ay hindi nangangahulugang production-ready ang application.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Paglalarawan**: Katumbas ng .NET/C# ng Python RAG chat sample. Ginawa gamit ang ASP.NET Core Minimal API at Blazor WebAssembly na frontend. Kasama ang voice chat, GPT-4o-mini vision support, at isang kasamang .NET MAUI Blazor Hybrid desktop/mobile client.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Mga Serbisyo**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Paglalarawan**: Bersyon ng Java ng RAG chat sample gamit ang Langchain4J para sa AI orchestration. Sinusuportahan ang microservice event-driven architecture, maraming search strategies (text, vector, hybrid), pag-upload ng dokumento gamit ang Azure Document Intelligence, at deployment sa alinman sa Azure Container Apps o Azure Kubernetes Service.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Mga Serbisyo**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Paglalarawan**: End-to-end retail RAG copilot gamit ang Microsoft Foundry at Prompty. Isang Contoso Outdoor retailer chatbot na nagpapakita ng mga sagot na naka-base sa product catalog at customer order data. Ipinapakita ang buong GenAIOps workflow — prototype gamit ang Prompty, i-evaluate gamit ang AI-assisted evaluators, at i-deploy sa pamamagitan ng AZD sa Container Apps.

**Quick Start**:
```bash
azd init --template contoso-chat .
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Mga Serbisyo**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Paglalarawan**: Multi-agent sample na nagpapakita ng AI agent orchestration gamit ang Prompty. Gumagamit ng isang research agent (Bing Grounding sa Azure AI Agent Service), isang product agent (Azure AI Search), isang writer agent, at isang editor agent upang magkasanib na lumikha ng mahusay na nasuring mga artikulo. Kasama ang CI/CD na may evaluation sa GitHub Actions.

**Quick Start**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Mga Serbisyo**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Paglalarawan**: Ganap na serverless na RAG chatbot gamit ang LangChain.js kasama ang Azure Functions para sa API at Azure Static Web Apps para sa hosting. Ginagamit ang Azure Cosmos DB bilang parehong vector store at chat history database. Sinusuportahan ang lokal na pag-develop gamit ang Ollama para sa zero-cost testing.

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Mga Serbisyo**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search with Cosmos DB, o PostgreSQL with pgvector

**Paglalarawan**: Isang document-grounded chat accelerator na may mga citation. Ang kasalukuyang sample ay nagho-host ng React frontend, FastAPI backend, at Functions ingestion worker sa Container Apps; ang mga opsyon sa orchestrator ay Agent Framework at LangGraph. Ang mga opsyon sa database/retrieval ay pinipili sa deployment. Ito ay panimulang punto, hindi turnkey production system; huwag ipalagay na ang mga lumang bersyon ng App Service, Semantic Kernel, o Prompt Flow ay naglalarawan ng kasalukuyang default.

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Mga Serbisyo**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Paglalarawan**: Reference application para sa multi-agent AI orchestration gamit ang tatlong frameworks (LangChain.js, LlamaIndex.TS, at Microsoft Agent Framework). Tampok ang MCP (Model Context Protocol) servers sa apat na wika na naka-deploy bilang serverless Azure Container Apps na may OpenTelemetry monitoring.

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Mag-browse ng higit pang mga template**: Bisitahin ang [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) para sa mga kasalukuyang available na mga template sa iba't ibang wika at senaryo. Ang bawat naka-link na halimbawa ay isang external na repository, hindi lokal na halimbawa na ibinigay ng kursong ito; suriin ang mga kasalukuyang prerequisites at production guidance bago mag-deploy.

## Next Steps

1. **Subukan ang mga Halimbawa**: Magsimula sa isang pre-built na template na tumutugma sa iyong kaso ng paggamit
2. **I-customize para sa Iyong Pangangailangan**: Baguhin ang imprastraktura at application code
3. **Magdagdag ng Monitoring**: Magpatupad ng komprehensibong observability
4. **I-optimize ang Gastos**: Fine-tune ang mga configuration para sa iyong budget
5. **Siguraduhin ang Iyong Deployment**: Ipatupad ang mga pattern ng enterprise security
6. **I-scale sa Production**: Magdagdag ng multi-region at high-availability na mga feature

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minuto)
**Layunin**: I-deploy at subukan ang isang AI chat reference application

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

**Mga Pamantayan ng Tagumpay:**
- [ ] Nakumpleto ang deployment nang walang quota errors
- [ ] Makaka-access ng chat interface sa browser
- [ ] Makakapagtanong at makakakuha ng AI-powered na mga tugon
- [ ] Nagpapakita ang Application Insights ng telemetry data
- [ ] Matagumpay na na-linis ang mga resources

**Gastos:** Suriin ang kasalukuyang gabay sa gastos ng sample at mga napiling SKU bago mag-deploy. Magpapatuloy ang pagsingil hanggang matanggal ang mga resources; walang nakatakdang 30-minutong estimate na naaangkop sa bawat configuration.

### Exercise 2: I-configure ang Multi-Model Deployment (45 minuto)
**Layunin**: Mag-deploy ng maraming AI modelo na may iba't ibang configuration

**Panimulang punto:** Isang umiiral na Azure OpenAI account at isang AZD resource-group module na maaaring tumawag sa file na ito. Gumawa ng `infra/ai-models.bicep` na may sumusunod na nilalaman gamit ang iyong editor. Hindi ito awtomatikong nade-deploy basta nasa ilalim lang kasi ito ng `infra/`.

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

Mula sa resource-group-scoped module na may-ari ng account, magdagdag ng module invocation (i-adapt ang pangalan ng simbolo sa iyong aktwal na account):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Huwag ideklara ang parehong mga deployment sa parehong mga module. Kung subscription-scoped ang AZD entry point, tawagin ito mula sa resource-group-scoped child module nito at i-adjust ang relative path. I-build ang module na iyon gamit ang `az bicep build --file <path-to-containing-module>`, pagkatapos:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Mga Pamantayan ng Tagumpay:**
- [ ] Maraming modelo ang matagumpay na nade-deploy
- [ ] Nai-apply ang iba't ibang capacity settings
- [ ] Accessible ang mga modelo sa pamamagitan ng API
- [ ] Maaaring tawagan ang parehong mga modelo mula sa application

### Exercise 3: Ipatupad ang Cost Monitoring (20 minuto)
**Layunin**: Mag-set up ng budget alerts at pag-track ng gastos

**Panimulang punto:** Ang budget pattern sa itaas at isang resource-group-scoped infrastructure module. Idagdag ang resource na ito gamit ang iyong editor; ipasa ang `budgetStartDate` mula sa iyong parameter mapping (huwag ulitin ang parameter kung naideklara na). Palitan ang tatanggap at kumpirmahin na mayroon kang budget write access.

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

Inaasahan: ang tugon ay naglalaman ng `amount: 200`, parehong mga threshold, at ang iyong tatanggap. Suriin ang Cost Management sa portal para sa aktwal na mga singil; ang data ng gastos ay delayed at hindi kailangang mag-fire ang alert sa maikling exercise.

**Mga Pamantayan ng Tagumpay:**
- [ ] Nagawa ang budget alert sa Azure
- [ ] Na-configure ang email notifications
- [ ] Maaaring tingnan ang data ng gastos sa Azure Portal
- [ ] Naayos nang tama ang mga budget threshold

## 💡 Frequently Asked Questions

<details>
<summary><strong>Paano ko mababawasan ang gastos ng Microsoft Foundry Models habang nagde-develop?</strong></summary>

1. **Suriin ang presyo**: Walang pangkalahatang libreng 50,000-token na buwanang allowance para sa Azure OpenAI models
2. **I-right-size ang capacity**: Ang Capacity `10` ay karaniwang kumakatawan sa 10,000 TPM para sa mga Standard text na modelong ito, hindi 10 TPM. Ang pagbabawas ng rate limit na ito ay hindi nagpapababa ng presyo kada token
3. **Gamitin ang azd down**: Burahin ang mga disposable resources kapag hindi aktibong nagde-develop (hindi ito deallocation)
4. **I-cache ang mga Tugon**: Magpatupad ng Redis cache para sa mga paulit-ulit na query
5. **Gamitin ang Prompt Engineering**: Bawasan ang paggamit ng token gamit ang mas epektibong mga prompt

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Ano ang pagkakaiba ng Microsoft Foundry Models at OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Enterprise security at compliance
- Pribadong network integration
- SLA guarantees
- Managed identity authentication
- Mas mataas na mga quota ang available

**OpenAI API**: Isang hiwalay na provider/API na may sariling availability ng modelo, presyo, authentication, at enterprise connectivity options. Ikompara ang kasalukuyang mga alok kaysa mag-assume na ito ay para lang sa public internet o palaging unang nagpapadala ng mga modelo.

Pumili base sa mga pangangailangan ng iyong organisasyon; ang mga Azure-specific na halimbawa ng managed identity at private-link sa kursong ito ay para sa mga Azure-hosted na serbisyo, hindi lahat ng modelo/provider sa Foundry catalog.
</details>

<details>
<summary><strong>Paano ko haharapin ang Microsoft Foundry Models quota exceeded errors?</strong></summary>

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
<summary><strong>Maaari ko bang gamitin ang sarili kong data sa Microsoft Foundry Models?</strong></summary>

Oo! Gamitin ang **Azure AI Search** para sa RAG (Retrieval Augmented Generation):

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

Tingnan ang [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) template.
</details>

<details>
<summary><strong>Paano ko mase-secure ang mga endpoint ng AI model?</strong></summary>

**Pinakamainam na mga Gawi**:
1. Gumamit ng Managed Identity (hindi API keys)
2. Paganahin ang Private Endpoints
3. I-configure ang mga network security groups
4. Magpatupad ng rate limiting
5. Gumamit ng Azure Key Vault para sa mga secrets

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

## Komunidad at Suporta

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Mga isyu at talakayan](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Opisyal na dokumentasyon](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill sa skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - I-install ang Azure + Foundry agent skills sa iyong editor gamit ang `npx skills add microsoft/github-copilot-for-azure`

---

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraang Kabanata**: [Kabanata 1: Ang Iyong Unang Proyekto](../chapter-01-foundation/first-project.md)
- **➡️ Susunod**: [AI Agents](agents.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../chapter-03-configuration/configuration.md)

**Kailangan ng Tulong?** Sumali sa aming mga talakayan sa komunidad o magbukas ng isyu sa repositoryo. Narito ang Azure AI + AZD komunidad upang tulungan kang magtagumpay!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->