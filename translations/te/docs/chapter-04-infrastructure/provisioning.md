# AZDతో Azure వనరుల ప్రావిజనింగ్

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [ఆగమనీయుల కోసం AZD](../../README.md)
- **📖 ప్రస్తుతం అధ్యాయం**: అధ్యాయం 4 - కోడులతో మూలసదుపాయాలు & డిప্লాయ్‌మెంట్
- **⬅️ గతము**: [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md)
- **➡️ నక్స అధ్యాయం**: [అధ్యాయం 5: బహుళ ఏజెంట్ AI పరిష్కారాలు](../../examples/retail-scenario.md)
- **🔧 సంబంధిత**: [అధ్యాయం 6: ముందస్తు-డిప్లాయ్‌మెంట్ ధృవీకరణ](../chapter-06-pre-deployment/capacity-planning.md)

## పరిచయం

ఈ గైడు Azure Developer CLIని ఉపయోగించి Azure వనరులు ప్రావిజన్ చేయడం మరియు నిర్వహించడం Bicep మరియు Terraform ప్రొవైడర్లతో చేయడం గురించి వివరిస్తుంది.

> `azd 1.37.2` ద్వారా సమీక్షించబడింది (నవంబర్ 2026). చెప్పని వరకు, Bicep, Terraform, మరియు స్క్రిప్ట్ ఉదాహరణలు **ప్రదర్శనకు మాత్రమే ఉన్న అరికట్టు భాగాలు**, పూర్తి టెంప్లేట్ కాదు. వాటిని ప్రాజెక్టులో విలీనం చేయండి, అక్కడ పేర్కొన్న పరామితులు, మాడ్యూల్లు, గుర్తింపులు, నెట్‌వర్కింగ్, మరియు అనువర్తన కోడ్ ఉంటాయి. ఈ సమీక్షలో Azure ప్రావిజనింగ్ చేయబడలేదు.

## నేర్చుకునే లక్ష్యాలు

ఈ గైడ్ పూర్తి చేసిన తర్వాత మీరు:
- ఇన్ఫ్రాస్ట్రక్చర్ ఆఫ్ కోడ్ ప్రిన్సిపల్స్ మరియు Azure వనరుల ప్రావిజనింగ్‌లో నైపుణ్యం సాధిస్తారు
- Azure Developer CLI మద్దతు ఇస్తున్న బహుళ IaC ప్రొవైడర్లను అర్థం చేసుకుంటారు
- సాధారణ అనువర్తన వాస్తవాల్లోకి Bicep టెంప్లేట్లను రూపకల్పన చేసి అమలు చేస్తారు
- వనరు పరామితులు, వేరియబుల్స్, మరియు వాతావరణ-ప్రత్యేక సెట్టింగులను కాన్ఫిగర్ చేస్తారు
- నెట్‌వర్కింగ్ మరియు భద్రత సహిత ఆధునిక ఇన్ఫ్రాస్ట్రక్చర్ నమూనాలు అమలు చేస్తారు
- వనరుల జీవనచక్రం, నవీకరణలు, మరియు ఆధారిత పరిష్కారాలను నిర్వహిస్తారు

## నేర్చుకున్న ఫలితాలు

పూర్తి చేసిన తర్వాత, మీరు చేయగలుగుతారు:
- Bicep మరియు ARM టెంప్లేట్లతో Azure ఇన్ఫ్రాస్ట్రక్చర్ రూపకల్పన మరియు ప్రావిజన్ చేయడం
- సరైన వనరు ఆధారితాలతో సంక్లిష్ట బహుసేవా వాస్తవాలను కాన్ఫిగర్ చేయడం
- బహువాతావరణాలు మరియు కాన్ఫిగరేషన్ల కోసం పరామితీకృత టెంప్లేట్లను అమలు చేయడం
- ఇన్ఫ్రాస్ట్రక్చర్ ప్రావిజనింగ్ సమస్యలను ట్రబుల్‌షూట్ చేసి డిప్లాయ్‌మెంట్ తప్పిదాలను పరిష్కరించడం
- ఇన్ఫ్రాస్ట్రక్చర్ డిజైన్‌కు Azure వెల్-ఆర్కిటెక్టెడ్ ఫ్రేమ్‌వర్క్ సూత్రాలను వర్తించటం
- ఇన్ఫ్రాస్ట్రక్చర్ నవీకరణలను నిర్వహించి ఇన్ఫ్రాస్ట్రక్చర్ వెర్షనింగ్ వ్యూహాలను అమలు చేయడం

## ఇన్ఫ్రాస్ట్రక్చర్ ప్రావిజనింగ్ అవలోకనం

Azure Developer CLI మద్దతు ఇస్తుంది బహుళ ఇన్ఫ్రాస్ట్రక్చర్ ఆఫ్ కోడ్ (IaC) ప్రొవైడర్లను:
- **Bicep** (సిఫార్సు చేయబడింది) - Azureకి సంబంధించిన భాష
- **ARM టెంప్లేట్లు** - Bicep ARMకి కంపైలు చేస్తుంది; ఊరు ARM JSON వేరు బిల్ట్-ఇన్ `infra.provider` కాదు
- **Terraform** - బహు-క్లౌడ్ ఇన్ఫ్రాస్ట్రక్చర్ టూల్
- **విస్తరణ ప్రొవైడర్లు** - వేరుగా ఇన్‌స్టాల్ చేయాల్సిన ప్రొవైడర్ ఎక్స్‌టెన్షన్ మరియు దాని డాక్యుమెంటెడ్ కాన్ఫిగరేషన్ అవసరం; ఎటువంటి ప్రొవైడర్ స్ట్రీంగ్ మద్దతు పొందిందని ఊహించవద్దు

## Azure వనరులను అర్థం చేసుకోవడం

### వనరు మరియు అంతర్గత గుచ్ఛం
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### అనువర్తనాలకు సాధారణ Azure సేవలు
- **కంప్యూట్**: యాప్ సర్వీస్, కంటైనర్ యాప్స్, ఫంక్షన్‌లు, వర్చువల్ మెషిన్లు
- **స్టోరేజ్**: స్టోరేజ్ అకౌంట్, కోస్మాస్ DB, SQL డేటాబేస్, పోస్ట్‌గ్రెSQL
- **నెట్‌వర్కింగ్**: వర్చువల్ నెట్‌వర్క్, అనువర్తన గేట్వే, CDN
- **భద్రత**: కీ వాల్ట్, అనువర్తన ఇన్‌సైట్స్, లాగ్ అనలిటిక్స్
- **AI/ML**: Azure AI సేవలు, Azure OpenAI, Azure మిషన్ లెర్నింగ్

## Bicep ఇన్ఫ్రాస్ట్రక్చర్ టెంప్లేట్లు

### ప్రాథమిక Bicep టెంప్లేట్ నిర్మాణం
```bicep
// infra/modules/web.bicep - resource-group-scoped module fragment
targetScope = 'resourceGroup'
@description('The name of the environment')
param environmentName string

@description('The location for all resources')
param location string = resourceGroup().location

@description('The name of the application')
param applicationName string = 'myapp'

// Variables
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
var tags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
}

// App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${applicationName}-${environmentName}-plan'
  location: location
  tags: tags
  sku: {
    name: 'B1'
    capacity: 1
  }
  properties: {
    reserved: true // Linux App Service Plan
  }
}

// Web App
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${applicationName}-web-${resourceToken}'
  location: location
  tags: union(tags, { 'azd-service-name': 'web' })
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|22-lts'
      alwaysOn: true
      ftpsState: 'Disabled'
      minTlsVersion: '1.2'
      appSettings: [
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
        {
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
    httpsOnly: true
  }
}

// Output values for azd
output WEB_URL string = 'https://${webApp.properties.defaultHostName}'
output WEB_NAME string = webApp.name
```

పూర్తయిన azd ప్రాజెక్ట్ కోసం, ఈ మాడ్యూల్‌ను ఒక సబ్‌స్క్రిప్షన్-స్థాయి `infra/main.bicep` నుండి పిలవండి, ఇది ఒక ట్యాగ్ చేయబడిన వనరు గుంపును సృష్టించి దాని పారామితులను పంపిస్తుంది. `environmentName`/`location` ను `main.parameters.json`లో సరిపోల్చండి. `azd-service-name: web` ట్యాగ్ వనరు యొక్క `services.web` కి సంబంధించింది; ఏ ఆగ్రహాస్పద అవుట్‌పుట్ పేర్లూ మాత్రమే సర్వీస్ డిస్కవరీని కాన్ఫిగర్ చేయవు.

### ఆధునిక Bicep నమూనాలు

#### మాడ్యూలర్ ఇన్ఫ్రాస్ట్రక్చర్
```bicep
// infra/modules/app-service.bicep
@description('App Service configuration')
param name string
param location string
param planId string
param appSettings array = []

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: planId
    siteConfig: {
      appSettings: appSettings
      linuxFxVersion: 'NODE|22-lts'
      alwaysOn: true
    }
    httpsOnly: true
  }
}

output hostname string = webApp.properties.defaultHostName
output principalId string = webApp.identity.principalId
```

```bicep
// infra/main.bicep - Using modules
module webAppModule 'modules/app-service.bicep' = {
  name: 'webApp'
  params: {
    name: '${applicationName}-web-${resourceToken}'
    location: location
    planId: appServicePlan.id
    appSettings: [
      {
        name: 'API_URL'
        value: apiModule.outputs.endpoint
      }
      {
        name: 'DATABASE_URL'
        value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-url)'
      }
    ]
  }
}
```

#### షరతు ఆధారిత వనరు సృష్టి
```bicep
@description('Whether to create a database')
param createDatabase bool = true

@description('Database SKU')
param databaseSku string = 'Basic'

resource database 'Microsoft.Sql/servers/databases@2021-11-01' = if (createDatabase) {
  name: '${sqlServer.name}/${applicationName}-db'
  location: location
  sku: {
    name: databaseSku
    tier: databaseSku == 'Basic' ? 'Basic' : 'Standard'
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
  }
}
```

## 🌐 azdతో Terraform ఉపయోగించడం

Bicep azdకు డిఫాల్ట్ అయితే కూడా, azd **Terraform**-ను మద్దతు ఇస్తుంది—మీ జట్టు ఇప్పటికే దీన్ని ప్రామాణీకరించినట్లైతే లేదా మీరు బహురాష్ట్రీయ ఇన్ఫ్రాస్ట్రక్చర్‌ను నిర్వహిస్తుంటే ఉపయోగపడుతుంది. azd వర్క్ఫ్లో (`azd up`, `azd provision`, `azd down`) ఒకే విధంగా ఉంటుంది; కేవలం ఇన్ఫ్రాస్ట్రక్చర్ భాష మరియు ఫోల్డర్ అమర్చే పద్ధతి మారుతుంది.

### azdకి Terraform ఉపయోగించమని చెప్పడం

Terraform ప్రొవైడర్‌ను సూచించే `infra` భాగాన్ని `azure.yaml` లో చేర్చండి:

```yaml
# azure.yaml
name: my-terraform-app
infra:
  provider: terraform   # default is "bicep"
  path: infra           # folder containing your .tf files
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### Terraform ఫోల్డర్ అమరిక

Terraform ప్రొవైడర్‌తో, మీ `infra/` ఫోల్డర్ Bicep కాకుండా `.tf` ఫైళ్లను ఉపయోగిస్తుంది:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### ఒక `main.tf` ఫ్రాగ్మెంట్

ఇది వనరు గుంపును మరియు ప్లాన్‌ను మాత్రమే సృష్టిస్తుంది, డిప్లాయ్ చేయదగిన సేవ కాదు. మీరు కూడా ఇన్‌పుట్ వేరియబుల్స్, అనుకూలమైన `azurerm` ప్రొవైడర్, వెబ్ యాప్, మరియు దాని సర్వీస్ ట్యాగ్/వనరు-పేరు మ్యాపింగ్‌ను పేర్కొనాలి.

```hcl
# infra/main.tf
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment_name}"
  location = var.location
  tags     = { "azd-env-name" = var.environment_name }
}

resource "azurerm_service_plan" "plan" {
  name                = "plan-${var.environment_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}
```

### azd మీ Terraform అవుట్‌పుట్‌లకు ఎలా కనెక్ట్ అవుతుంది

azd Terraform **అవుట్‌పుట్‌లను** వాతావరణ విలువల్లో చదువుతుంది. ఈ ఫ్రాగ్మెంట్ మీరు `azurerm_linux_web_app.web` నిర్వచించినట్లు భావిస్తుంది; సర్వీస్ డిస్కవరీకు సరిపోయే వనరు పేరు లేదా `azd-service-name` ట్యాగ్ అవసరం:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **గుర్తించవలసినది:**	azd వనరులను వాతావరణం కొరకు ట్రాక్ చేయడానికి `azd-env-name` ట్యాగ్ మరియు `AZURE_*` అవుట్‌పుట్‌లను ఉపయోగిస్తుంది. మీ వనరు గుంపును ఎల్లప్పుడూ `"azd-env-name" = var.environment_name` తో ట్యాగ్ చేయండి, తద్వారా `azd down` ప్రతీదాన్ని కనుగొని తొలగించగలదు.

### Terraformతో డిప్లాయ్ చేయండి

ఆదేశాలు పూర్తి Bicep వంటివే:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **ముందస్తు అవసరం:** Terraform మీ సిస్టమ్‌లో ఇన్‌స్టాల్ చేయబడిన మరియు మీ `PATH` పై ఉండాలి. azd Terraform *వర్క్ఫ్లో*ను నిర్వహిస్తుంది కానీ Terraformని మీ కోసం ఇన్‌స్టాల్ చేయదు. స్థితి కోసం, azd స్థానిక స్థితిని డిఫాల్ట్‌గా ఎంచుకుంటుంది; బృందాల కోసం, దూర బ్యాకెండ్ (ఉదాహరణకి, Azure స్టోరేజ్ బ్యాకెండ్)ను `provider.tf`లో కాన్ఫిగర్ చేయండి.

పూర్తి, ఆపరేబుల్ Terraform ఆధారిత స్టార్టర్ల కోసం, [ఆసెమ్ AZD గ్యాలరీ](https://azure.github.io/awesome-azd/)ని బ్రౌజ్ చేయండి మరియు Terraform ఫిల్టర్ చేయండి, లేదా అధికారిక [azd Terraform డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd) చూడండి.

## 🧩 ఇతర ఇన్ఫ్రాస్ట్రక్చర్ టూల్స్

Pulumi azd 1.37.2లో బిల్ట్-ఇన్ ప్రొవైడర్ కాదు. కేవలం `infra.provider: pulumi` సెట్టింగ్ వర్కింగ్ ఇంటిగ్రేషన్ ఏర్పరచదు, మరియు `azd env new` ఆటోమేటిక్‌గా Pulumi స్టాక్‌ను సృష్టించదు/ఎంపిక చేయదు. మీరు ఇతర IaC టూల్ ఉపయోగిస్తే, ధృవీకృత ప్రొవైడర్ ఎక్స్‌టెన్షన్ డాక్యుమెంటేషన్‌ను అనుసరించండి లేదా దాని జీవిత చక్రాన్ని మీ స్వంత వర్క్ఫ్లోలో స్పష్టంగా నిర్వహించండి. ఈ కోర్సు దాశీవల Pulumi ప్రొవైడర్‌ను అందించదు లేదా ధృవీకరించడం లేదు.

## 🎯 మీ సేవకు హోస్ట్ ఎంచుకోవడం

`host` ఫీల్డ్ లో `azure.yaml` నిర్ణయిస్తుంది మీ కోడ్ ఎక్కడ నడుస్తుంది. azd అనేక హోస్ట్లను మద్దతు ఇస్తుంది—సరైన హోస్ట్ ఎన్నుకోవడం ఇన్ఫ్రాస్ట్రక్చర్ భాష కంటే ముఖ్యం. ఇక్కడ ప్రారంభికులకు అనుకూలమైన సరిపోలిక:

| `host` విలువ | ఉత్తమం | కారణం |
|--------------|----------|-----|
| `appservice` | సంప్రదాయ వెబ్ యాప్స్ మరియు APIలు | సరళమైన PaaS; కంటెయినర్లు అవసరం లేదు |
| `staticwebapp` | ఫ్రంట్-ఎండ్ SPAs (React, Vue, Angular) | గ్లోబల్ CDN + ఉచిత SSL, బిల్ట్-ఇన్ API మద్దతు |
| `function` | ఈవెంట్-ప్రమాదిత మరియు సర్వర్‌లెస్ వర్క్‌లోడ్స్ | సగటు-టు-జీరో, ఎగ్జిక్యూషన్ మేరకు చెల్లింపు |
| `containerapp` | కంటైనరైజ్డ్ మైక్రోసర్వీసెస్ | సర్వర్‌లెస్ కంటైనర్లు, సగటు-టు-జీరో, బిల్ట్-ఇన్ ఇన్గ్రెஸ் |
| `aks` | సంక్లిష్ట ఆర్కెస్ట్రేషన్ అవసరాలు | నిజంగా అవసరమైనప్పుడు పూర్తి Kubernetes నియంత్రణ |
| `springapp` | ప్రస్తుత Azure Spring Apps డిప్లాయ్‌మెంట్లు | లెగసీ లక్ష్యం; సేవ మార్చి 31, 2028 న రిటైర్ అవుతుంది మరియు కొత్త కస్టమర్‌లకు మూసి వేయబడింది |

### ఎప్పుడు AKSని ఉపయోగించాలి

**Azure Kubernetes Service (`host: aks`)** మీకు Kubernetes సంపూర్ణ శక్తిని ఇస్తుంది—కస్టమ్ కంట్రోలర్లు, సర్వీస్ మెష్లు, సంక్లిష్ట నెట్‌వర్కింగ్, మరియు ఆపరేటింగ్ షెడ్యూలింగ్. ఆ శక్తి పని భారాన్ని తేవాలి: మీరు నోడ్ పనులు, అప్‌గ్రేడ్లు, మరియు క్లస్టర్ నెట్‌వర్కింగ్ నిర్వహించాలి.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **మీరు చేయగలిగితే సాదాసీదాగా ప్రారంభించండి.** చాలా మైక్రోసర్వీసులకు, **కంటెయినర్ యాప్స్** మీరు కంటెయినర్లు, ఆటోస్కేలింగ్, మరియు సగటు-టు-జీరోను క్లస్టర్ నిర్వహణ లేకుండా ఇస్తుంది. మీరు Kubernetes-ప్రత్యేక ఫీచర్లు అవసరమైతేనే AKS ఎంచుకోండి.

### ఎప్పుడు Azure Spring Apps ఉపయోగించాలి

**Azure Spring Apps (`host: springapp`)** స్ప్రింగ్ బూట్ కొరకు ప్రత్యేకంగా రూపొందించిన మేనేజ్డ్ రన్‌టైమ్. ఇది సర్వీస్ డిస్కవరీ, కాన్ఫిగర్ సర్వర్, మరియు బ్లూ-గ్రీన్ డిప్లాయ్‌మెంట్ నిర్వహిస్తుంది కాబట్టి జావా బృందాలు తమ స్వంత ఇన్ఫ్రాస్ట్రక్చర్ కలపవద్దు.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> కొత్త ఆరంభ ప్రాజెక్టుకి Azure Spring Apps ఎంపిక చేయవద్దు: ఇది కొత్త కస్టమర్‌లకు మూసివేయబడింది మరియు [మార్చి 31, 2028 న రిటైర్ అవుతుంది](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). మద్దతు పొందుతున్న ప్రత్యామ్నాయాలు ఉపయోగించండి, ఉదాహరణకి కంటెయినర్ యాప్స్, మరియు ఉన్న డిప్లాయ్‌మెంట్లకు మైగ్రేషన్ ప్రణాళిక చేయండి.

## 🗃️ డేటాబేస్ ప్రావిజనింగ్

### కోస్మాస్ DB
```bicep
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: '${applicationName}-cosmos-${resourceToken}'
  location: location
  tags: tags
  kind: 'GlobalDocumentDB'
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    capabilities: [
      {
        name: 'EnableServerless'
      }
    ]
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  parent: cosmosAccount
  name: '${applicationName}db'
  properties: {
    resource: {
      id: '${applicationName}db'
    }
  }
}

resource todoContainer 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2023-04-15' = {
  parent: cosmosDatabase
  name: 'todos'
  properties: {
    resource: {
      id: 'todos'
      partitionKey: {
        paths: ['/userId']
        kind: 'Hash'
      }
    }
  }
}
```

### పోస్ట్‌గ్రెSQL
**ఫ్రాగ్మెంట్ సూచనాలు:** `@secure() param databasePassword string`ని ప్రకటన చేసి బలమైన సరిపొయే విలువ ఉపయోగించండి. ప్రజా యాక్సెస్ **లేదా** కింద డెలిగేటెడ్ సబ్‌నెట్/ప్రైవేట్ DNSను సమగ్రపరచండి; ఈ రెండు సూక్ష్మాహితాలు స్వయంచాలకంగా కనెక్ట్ కావు.

```bicep
resource postgresServer 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: '${applicationName}-postgres-${resourceToken}'
  location: location
  tags: tags
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    version: '14'
    administratorLogin: 'dbadmin'
    administratorLoginPassword: databasePassword
    storage: {
      storageSizeGB: 32
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
    highAvailability: {
      mode: 'Disabled'
    }
  }
}

resource postgresDatabase 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2022-12-01' = {
  parent: postgresServer
  name: '${applicationName}db'
  properties: {
    charset: 'utf8'
    collation: 'en_US.utf8'
  }
}

// Allow Azure services to connect
resource firewallRule 'Microsoft.DBforPostgreSQL/flexibleServers/firewallRules@2022-12-01' = {
  parent: postgresServer
  name: 'AllowAzureServices'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}
```

`0.0.0.0` రూల్ మీ సబ్‌స్క్రిప్షన్‌కు మించAzure సేవల నుండి కనెక్షన్లను అనుమతిస్తుంది. ఇది ప్రైవేట్ నెట్‌వర్కింగ్ కాదు; వాస్తవ వర్క్‌లోడ్స్ కోసం పరిమిత నెట్‌వర్క్ డిజైన్‌కు ప్రాధాన్యత ఇవ్వండి.

## 🔒 భద్రత మరియు సీక్రెట్ నిర్వహణ

### కీ వాల్ట్ సమగ్రత
```bicep
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: '${applicationName}-kv-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
  }
}

// Grant Key Vault access to the web app
resource webAppKeyVaultAccess 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(keyVault.id, webApp.id, 'Key Vault Secrets User')
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId(
      'Microsoft.Authorization/roleDefinitions',
      '4633458b-17de-408a-b874-0445c86b69e6' // Key Vault Secrets User
    )
    principalId: webApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}

// Store database connection string in Key Vault
resource databaseConnectionSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'database-connection-string'
  properties: {
    value: 'Server=${postgresServer.properties.fullyQualifiedDomainName};Database=${postgresDatabase.name};Port=5432;User Id=${postgresServer.properties.administratorLogin};Password=${databasePassword};'
  }
}
```

### నిర్వహిత గుర్తింపు కాన్ఫిగరేషన్
```bicep
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${applicationName}-web-${resourceToken}'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'DATABASE_CONNECTION_STRING'
          value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-connection-string)'
        }
        {
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
  }
}
```

సిస్టమ్-కేటాయించిన గుర్తింపుకు, దాని ప్రిన్సిపల్ IDకి `AZURE_CLIENT_ID` సెట్ చేయవద్దు. యూజర్-కేటాయించిన గుర్తింపు దాని **క్లయింట్ ID**ను ఉపయోగిస్తుంది, ఆబ్జెక్ట్/ప్రిన్సిపల్ ID కాదు. కీ వాల్ట్ రిఫరెన్స్‌కు కూడా యాప్ గుర్తింపు యొక్క వాల్ట్ పాత్ర కేటాయింపు మరియు నెట్‌వర్క్ యాక్సెస్ అవసరం.

## 🌍 నెట్‌వర్కింగ్ మరియు కనెక్టివిటీ

### వర్చువల్ నెట్‌వర్క్ కాన్ఫిగరేషన్
```bicep
resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: '${applicationName}-vnet-${resourceToken}'
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'app-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          serviceEndpoints: [
            {
              service: 'Microsoft.Storage'
            }
            {
              service: 'Microsoft.KeyVault'
            }
          ]
        }
      }
      {
        name: 'db-subnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'postgres-delegation'
              properties: {
                serviceName: 'Microsoft.DBforPostgreSQL/flexibleServers'
              }
            }
          ]
        }
      }
    ]
  }
}

// Private DNS Zone for PostgreSQL
resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: '${applicationName}.postgres.database.azure.com'
  location: 'global'
  tags: tags
}

resource privateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: privateDnsZone
  name: '${applicationName}-dns-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet.id
    }
  }
}
```

### SSLతో అనువర్తన గేట్‌వే
**పూర్తిగా గల వాస్తవ నిర్మాణ ఫ్రాగ్మెంట్ కాదు, డిప్లాయ్ చేయదగిన గేట్‌వే కాదు:** VNetకు ప్రత్యేకమైన `gateway-subnet` చేర్చండి, బ్యాక్‌ఎండ్ పూల్స్, HTTP సెట్టింగ్స్, వినియోగదారు లిస్టనర్స్, ప్రాధాన్యతలతో రౌటింగ్ రూల్స్, మరియు TLS సర్టిఫికెట్ (లేదా అధికారిక కీ వాల్ట్ రిఫరెన్స్). కేవలం పోర్ట్ 443 తెరవడం HTTPSని కాన్ఫిగర్ చేయదు.

```bicep
resource publicIP 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: '${applicationName}-agw-pip-${resourceToken}'
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource applicationGateway 'Microsoft.Network/applicationGateways@2023-04-01' = {
  name: '${applicationName}-agw-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 1
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: '${vnet.id}/subnets/gateway-subnet'
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port80'
        properties: {
          port: 80
        }
      }
      {
        name: 'port443'
        properties: {
          port: 443
        }
      }
    ]
  }
}
```

## 📊 మానిటరింగ్ మరియు ఆబ్జర్వబిలిటీ

### అనువర్తన ఇన్‌సైట్స్
```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: '${applicationName}-logs-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: '${applicationName}-ai-${resourceToken}'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
  }
}

// Output connection string for applications
output APPLICATION_INSIGHTS_CONNECTION_STRING string = applicationInsights.properties.ConnectionString
```

### కస్టమ్ మెట్రిక్స్ మరియు అలర్ట్స్
```bicep
resource cpuAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: '${applicationName}-cpu-alert'
  location: 'global'
  tags: tags
  properties: {
    description: 'Alert when CPU usage is high'
    severity: 2
    enabled: true
    scopes: [appServicePlan.id]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'CPU Usage'
          metricName: 'CpuPercentage'
          metricNamespace: 'Microsoft.Web/serverfarms'
          operator: 'GreaterThan'
          threshold: 80
          timeAggregation: 'Average'
        }
      ]
    }
    actions: [
      {
        actionGroupId: actionGroup.id
      }
    ]
  }
}
```

## 🔧 వాతావరణ-ప్రత్యేక కాన్ఫిగరేషన్లు

### వేరువేరు వాతావరణాల కోసం పరామితి ఫైళ్లను ఉపయోగించడం
దిగువ ఫైళ్లు **వికల్ప పరామితి-ఫైల్ ఉదాహరణలు**. azd వాతావరణ పేరుతో ఆటోమేటిక్‌గా `main.parameters.dev.json` లేదా `main.parameters.prod.json` ఎంచుకోదు. వాస్తవ `main.parameters.json`ను వాతావరణ స్థానామాలను ఉపయోగించి ఉపయోగించండి (ఉదాహరణకి `${APP_SERVICE_SKU=B1}`), మరియు ప్రతి పరామితిని Bicepలో ప్రకటించి వినియోగించండి.

`infra/main.parameters.dev.json` కోసం ఉదాహరణ కంటెంట్లు:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSku": {
      "value": "B1"
    },
    "databaseSku": {
      "value": "Standard_B1ms"
    },
    "enableBackup": {
      "value": false
    }
  }
}
```

`infra/main.parameters.prod.json` కోసం ఉదాహరణ కంటెంట్లు:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSku": {
      "value": "P1v3"
    },
    "databaseSku": {
      "value": "Standard_D2s_v3"
    },
    "enableBackup": {
      "value": true
    },
    "replicaCount": {
      "value": 3
    }
  }
}
```

### షరతు ఆధారిత వనరు ప్రావిజనింగ్
```bicep
@description('Environment type (dev, staging, prod)')
@allowed(['dev', 'staging', 'prod'])
param environmentType string = 'dev'

// Development resources
resource devStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'dev') {
  name: 'stdev${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Production resources with geo-redundancy
resource prodStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'prod') {
  name: 'stprod${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_GRS'
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}
```

## 🚀 ఆధునిక ప్రావిజనింగ్ నమూనాలు

### బహుళ-ప్రాంత డిప్లాయ్‌మెంట్
```bicep
@description('Primary region')
param primaryLocation string = 'eastus2'

@description('Secondary region')
param secondaryLocation string = 'westus2'

// Primary region resources
module primaryRegion 'modules/region.bicep' = {
  name: 'primary-region'
  params: {
    location: primaryLocation
    isPrimary: true
    applicationName: applicationName
    environmentName: environmentName
  }
}

// Secondary region resources
module secondaryRegion 'modules/region.bicep' = {
  name: 'secondary-region'
  params: {
    location: secondaryLocation
    isPrimary: false
    applicationName: applicationName
    environmentName: environmentName
  }
}

// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficmanagerprofiles@2022-04-01' = {
  name: '${applicationName}-tm-${resourceToken}'
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Priority'
    dnsConfig: {
      relativeName: '${applicationName}-${environmentName}'
      ttl: 30
    }
    monitorConfig: {
      protocol: 'HTTPS'
      port: 443
      path: '/health'
    }
    endpoints: [
      {
        name: 'primary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: primaryRegion.outputs.webAppId
          priority: 1
        }
      }
      {
        name: 'secondary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: secondaryRegion.outputs.webAppId
          priority: 2
        }
      }
    ]
  }
}
```

### ఇన్ఫ్రాస్ట్రక్చర్ టెస్టింగ్
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

ప్రావిజనింగ్ ఇన్ఫ్రాస్ట్రక్చర్ మీ అనువర్తన కోడ్‌ను డిప్లాయ్ చేయదు. అనువర్తన తనిఖీలు మీరు కేవలం `azd deploy`/`azd up` తర్వాత నడపాలి, మరియు మీరు మీ యాప్‌లో అమలు చేస్తేనే `/health` ఉపయోగించండి. ARM డిప్లాయ్‌మెంట్ స్క్రిప్ట్‌లు Azure వనరులను సృష్టిస్తాయి, అదనపు గుర్తింపు, మద్దతు పొందిన రన్‌టైమ్ వర్షన్స్, మరియు అనుమతులు అవసరం; అవి స్థానిక యూనిట్ టెస్టులు కాదు.

## 🧪 ఇన్ఫ్రాస్ట్రక్చర్ ప్రివ్యూ & ధృవీకరణ (కొత్త)

### డిప్లాయ్‌మెంట్‌కు ముందు ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను ప్రివ్యూ చేయండి

`azd provision --preview` ఫీచర్ మీకు వనరులను నిజంగా డిప్లాయ్ చేయక ముందే **ఇన్ఫ్రాస్ట్రక్చర్ ప్రావిజనింగ్‌ను అనుకరించేందుకు** అనుమతిస్తుంది. ఇది `terraform plan` లేదా `bicep what-if` వైలాగే ఉంటుంది, మీ Azure వాతావరణంలో ఎలాంటి మార్పులు జరిగేందుకు ఉన్నాయో **డ్రై-రన్ వీక్షణ** ఇస్తుంది.

#### 🛠️ ఇది చేస్తుంది
- **మీ IaC టెంప్లేట్లను విశ్లేషిస్తుంది** (Bicep లేదా Terraform)
- **వనరు మార్పుల ప్రివ్యూ చూపిస్తుంది**: జోడింపులు, తొలగింపులు, నవీకరణలు
- **ప్రొవైడర్ ప్రతిపాదించిన ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను అప్లై చేయదు** — ప్రాజెక్ట్ హుక్‌లను మొదట పరిశీలించండి; స్క్రిప్ట్‌లు ఎఫెక్ట్ కలిగించవచ్చు మరియు ప్రివ్యూ Azure అనుమతులు వాంఛనీయమైనవి

#### ఉపయోగాలు
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

ఈ ఆదేశం మీకు సహాయపడుతుంది:
- వనరులను కమిట్ చేయకముందే **ఇన్ఫ్రాస్ట్రక్చర్ మార్పులను ధృవీకరించండి**
- అభివృద్ధి చక్రంలో **తప్పులను త్వరగా గుర్తించండి**
- బృంద వాతావరణాల్లో **భద్రతగా సహకరించండి**
- ఎటువంటి ఆశ్చర్యాలు లేకుండా **తక్కువ హక్కుల డిప్లాయ్‌మెంట్లను నిర్ధారించండి**

ఇది ప్రత్యేకంగా ఉపయోగకరం, ఎప్పుడు:
- సంక్లిష్ట బహుసేవా వాతావరణాలతో పనిచేస్తూ
- ఉత్పత్తి ఇన్ఫ్రాస్ట్రక్చర్‌కు మార్పులు చేస్తూ
- PR ఆమోదానికి ముందే టెంప్లేట్ మార్చులను ధృవీకరించటం
- కొత్త బృంద సభ్యులను ఇన్ఫ్రాస్ట్రక్చర్ నమూనాలపై శిక్షణ ఇవ్వడం

### ఉదాహరణ ప్రివ్యూ అవుట్‌పుట్
ప్రొవైడర్ మరియు ప్రాజెక్టు నిర్మాణం ఆధారంగా ఖచ్చితమైన ప్రివ్యూ అవుట్‌పుట్ మారుతుంది, కాని ఫలితం ఏదైనా అప్లై అయ్యే ముందు ప్రతిపాదిత మార్పులను స్పష్టంగా సూచించాలి.

```text
$ azd provision --preview

🔍 Previewing infrastructure changes...

The following resources will be created:
  + azurerm_resource_group.rg
  + azurerm_app_service_plan.plan
  + azurerm_linux_web_app.web
  + azurerm_cosmosdb_account.cosmos

The following resources will be modified:
  ~ azurerm_key_vault.kv
    ~ access_policy (forces replacement)

The following resources will be destroyed:
  - azurerm_storage_account.old_storage

⚠️  Warning: 1 resource will be replaced

✅ Preview completed successfully!
```

## 🔄 వనరు నవీకరణలు మరియు మైగ్రేషన్లు

### భద్రతగల వనరు నవీకరణలు
```bash
# Preview infrastructure changes first (RECOMMENDED)
azd provision --preview

# Apply changes after preview confirmation
azd provision
# In automation, --no-prompt uses known values and fails on unresolved decisions;
# it is not an approval bypass.

# For rollback, use Git to revert infrastructure changes:
git revert HEAD  # Revert last infrastructure commit
azd provision    # Apply previous infrastructure state
```

### డేటాబేస్ మైగ్రేషన్లు
**అపూర్తి డిప్లాయ్‌మెంట్ స్క్రిప్ట్ నమూనా:** అవసరమైన చోట యూజర్-కేటాయించిన గుర్తింపు, మద్దతు పొందిన Azure CLI రన్‌టైమ్, అందుబాటులో ఉన్న మైగ్రేషన్ టూల్స్, అందించిన మైగ్రేషన్ డైరెక్టరీ/కాన్ఫిగరేషన్, మరియు డేటాబేస్ కనెక్టివిటిని అవసరం. ఇది కేవలం ఈ వనరును టెంప్లేట్‌లో కుమికించి నడపలేనిది.

```bicep
resource migrationScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'database-migration'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.40.0'
    scriptContent: '''
      # Install database migration tools
      npm install -g db-migrate db-migrate-pg
      
      # Run migrations
      db-migrate up --config database.json --env production
      
      echo "Database migration completed successfully"
    '''
    environmentVariables: [
      {
        name: 'DATABASE_URL'
        secureValue: databaseConnectionString
      }
    ]
    timeout: 'PT30M'
    cleanupPreference: 'OnSuccess'
    retentionInterval: 'P1D'
  }
}
```

## 🎯 ఉత్తమ పద్ధతులు

### 1. వనరు ਨਾਮకరణ పరంపరలు
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. ట్యాగింగ్ వ్యూహం
```bicep
// utcNow is only allowed in a parameter default, not directly in a variable.
param deploymentDate string = utcNow('yyyy-MM-dd')

var commonTags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
  'environment': environmentName
  'cost-center': 'engineering'
  'owner': 'platform-team'
  'project': applicationName
  'deployment-date': deploymentDate
}
```

### 3. పరామితి ధృవీకరణ
```bicep
@description('Environment name')
@minLength(3)
@maxLength(20)
param environmentName string

@description('Location for resources')
@allowed(['eastus2', 'westus2', 'centralus'])
param location string

@description('App Service SKU')
@allowed(['B1', 'B2', 'S1', 'S2', 'P1v3', 'P2v3'])
param appServiceSku string = 'B1'
```

### 4. అవుట్‌పుట్ ఏర్పాటు
```bicep
// Service endpoints
output WEB_URL string = 'https://${webApp.properties.defaultHostName}'
output API_URL string = 'https://${apiApp.properties.defaultHostName}'

// Resource identifiers
output WEB_APP_NAME string = webApp.name
output API_APP_NAME string = apiApp.name
output DATABASE_NAME string = database.name

// Connection strings (for secure reference)
output DATABASE_CONNECTION_STRING_KEY string = '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-connection-string)'
```

## తరువాతి దశలు

- [డిప్లాయ్‌మెంట్ మునుపటి ప్రణాళిక](../chapter-06-pre-deployment/capacity-planning.md) - వనరుల అందుబాటును ధృవీకరించండి
- [సాధారణ సమస్యలు](../chapter-07-troubleshooting/common-issues.md) - ఇన్ఫ్రాస్ట్రక్చర్ సమస్యలను ట్రబుల్‌షూట్ చేయండి
- [డీబగ్గింగ్ మార్గదర్శిని](../chapter-07-troubleshooting/debugging.md) - ప్రావిజనింగ్ సమస్యలను డీబగ్గింగ్ చేయండి
- [SKU ఎంపిక](../chapter-06-pre-deployment/sku-selection.md) - సరైన సేవా స్థరాలను ఎంచుకోండి

## అదనపు వనరులు

- [ఆజూర్ బిసెప్ డాక్యుమెంటేషన్](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [ఆజూర్ రిసోర్స్ మేనేజర్ టెంప్లేట్లు](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [ఆజూర్ ఆర్కిటెక్చర్ సెంటర్](https://learn.microsoft.com/en-us/azure/architecture/)
- [ఆజూర్ వెల్-ఆర్కిటెక్చర్ ఫ్రేమ్‌వర్క్](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**నావిగేషన్**
- **మునుపటి పాఠం**: [డిప్లాయ్‌మెంట్ గైడ్](deployment-guide.md)
- **తరువాత పాఠం**: [కపాసిటీ ప్లానింగ్](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->