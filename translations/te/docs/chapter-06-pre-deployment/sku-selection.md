# SKU ఎంపిక గైడ్ - సరైన Azure సర్వీస్ టియర్స్ ఎంచుకోవడం

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [AZD ప్రారంభకులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 6 - ప్రీ-డిప్లాయ్‌మెంట్ ధృవీకరణ & ప్రణాళిక
- **⬅️ముందటి**: [क्षमता योजना](capacity-planning.md)
- **➡️తరువాత**: [ప్రి-ఫ్లైట్ చెక్కులు](preflight-checks.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 7: సమస్య పరిష్కారం](../chapter-07-troubleshooting/common-issues.md)

## పరిచయం

ఈ సమగ్ర గైడ్ మీరు వివిధ వాతావరణాలు, పనిభారం, మరియు అవసరాలకు సరిపోయే ఉత్తమ Azure సర్వీస్ SKUs (స్టాక్ కీపింగ్ యూనిట్స్) ఎంచుకోవడంలో సహాయపడుతుంది. పనితీరు అవసరాలు, వ్యయ పరిశీలన మరియు స్కేలబిలిటీ అవసరాలను విశ్లేషించి మీ Azure Developer CLI డిప్లాయ్‌మెంట్లకు సరైన సర్వీస్ టియర్స్ ఎంచుకోవడం నేర్చుకోండి.

## నేర్చుకునే లక్ష్యాలు

ఈ గైడ్ పూర్తి చేసిన తర్వాత, మీరు:
- Azure SKU కాన్సెప్ట్స్, ధరల నమూనాలు, మరియు ఫీచర్ తేడాలను అర్థం చేసుకోగలరు
- అభివృద్ధి, స్టేజింగ్, మరియు ప్రొడక్షన్ వాతావరణాలకు అనుగుణంగా SKU ఎంచుకునే వ్యూహాలలో నైపుణ్యం పొందగలరు
- పనిభారం అవసరాలను విశ్లేషించి సరైన సర్వీస్ టియర్స్‌కు సరిపోల్చగలరు
- తెలివైన SKU ఎంపిక ద్వారా వ్యయం ఆప్టిమైజేషన్ వ్యూహాలను అమలు చేయగలరు
- SKU ఎంపికలకు పనితీరు పరీక్ష మరియు ధృవీకరణ సాంకేతికతలను వర్తించగలరు
- ఆటోమేటెడ్ SKU సిఫార్సులు మరియు మోనిటరింగ్ సెటప్ చేయగలరు

## నేర్చుకున్న ఫలితాలు

పూర్తి చేసిన తరువాత, మీరు చేయగలరు:
- పనిభార అవసరాలు మరియు పరిమితుల ఆధారంగా సరైన Azure సర్వీస్ SKUs ఎంచుకోవడం
- సరైన టియర్ ఎంపికతో వ్యయ సమర్థవంతమైన బహు-వాతావరణ నిర్మాణాలను డిజైన్ చేయడం
- SKU ఎంపికలకు పనితీరు బెంచ్‌మార్కింగ్ మరియు ధృవీకరణను అమలు చేయడం
- SKU సిఫార్సులు మరియు వ్యయ ఆప్టిమైజేషన్ కోసం ఆటోమేటెడ్ టూల్స్ తయారు చేయడం
- మారుతున్న అవసరాలకు SKU మైగ్రేషన్‌లు మరియు స్కేలింగ్ వ్యూహాలను ప్లాన్ చేయడం
- Azure వీల్-ఆర్కిటెక్టెడ్ ఫ్రేమ్‌వర్క్ సూత్రాలను సర్వీస్ టియర్ ఎంపికలో వర్తించటం

## విషయసૂచీ

- [SKU లను అర్థం చేసుకోడం](#understanding-skus)
- [వాతావరణ ఆధారిత ఎంపిక](#environment-based-selection)
- [సర్వీస్-స్పెసిఫిక్ మార్గదర్శకాలు](#service-specific-guidelines)
- [ఖర్చు ఆప్టిమైజేషన్ వ్యూహాలు](#cost-optimization-strategies)
- [పనితీరు పరిశీలనలు](#performance-considerations)
- [త్వరిత సూచిక పట్టికలు](#quick-reference-tables)
- [ధృవీకరణ సాధనాలు](#validation-tools)

---

## SKU లను అర్థం చేసుకోవడం

> **ఉదాహరణ పరిధి:** YAML SKU మ్యాప్స్ మరియు పనితీరు కాన్ఫిగరేషన్లు క్రింద డిజైన్ గమనికలు మాత్రమే, `azure.yaml` స్కీమా లేదా లోడ్-టూల్ కాన్ఫిగరేషన్ కాదు. బైసిప్ బ్లాక్స్ ప్రత్యామ్నాయాలు/భాగాలు: వాటి పరామితులు మరియు ప్రెంట్ రిసోర్సులను ప్రకటించండి, వాటిని కలిపినప్పుడు ప్రత్యేక సంకేతాత్మక నామాలు ఉపయోగించండి మరియు మాడ్యూల్స్‌ను పనిపెట్టబడ్డ ప్రాజెక్టులో వాయర్ చేయండి. ధరలు, పరిమితులు, మరియు ప్రాంతం/SKU లభ్యతను మీ సబ్స్క్రిప్షన్ కోసం డిప్లాయ్‌మెంట్ ముందే పరిశీలించాలి.

### SKU లు ఏమిటి?

SKU లు (స్టాక్ కీపింగ్ యూనిట్స్) Azure వనరుల కోసం వేరే వేరే సర్వీస్ టియర్స్ మరియు పనితీరు స్థాయిలను సూచిస్తాయి. ప్రతి SKU ఏమిటి అందిస్తుంది:

- **పనితీరు లక్షణాలు** (CPU, మెమరీ, థ్రూపుట్)
- **ఫీచర్ లభ్యత** (స్కేలింగ్ ఆప్షన్లు, SLA స్థాయిలు)
- **ధర నమూనాలు** (ఖర్చు ఆధారిత, రిజర్వ్ కాపాసిటీ)
- **ప్రాంతీయ లభ్యత** (అన్ని SKUలు అన్ని ప్రాంతాలలో అందుబాటులో ఉండవు)

### SKU ఎంపికలో కీలక అంశాలు

1. **పనిభారం అవసరాలు**
   - అంచనా ట్రాఫిక్/లోడ్ మోడళ్లు
   - పనితీరు అవసరాలు (CPU, మెమరీ, I/O)
   - నిల్వ అవసరాలు మరియు యాక్సెస్ నమూనాలు

2. **వాతావరణ రకం**
   - అభివృద్ధి/పరీక్ష vs. ప్రొడక్షన్
   - లభ్యత అవసరాలు
   - సెక్యూరిటీ మరియు అనుగుణత అవసరాలు

3. **బడ్జెట్ పరిమితులు**
   - ప్రారంభ వ్యయాలు vs. ఆపరేషనల్ ఖర్చులు
   - రిజర్వ్ కాపాసిటీ డిస్కౌంట్లు
   - ఆటో-స్కేలింగ్ ఖర్చుల ప్రభావం

4. **వృద్ధి అంచనాలు**
   - స్కేలబిలిటీ అవసరాలు
   - భవిష్యత్ ఫీచర్ అవసరాలు
   - మైగ్రేషన్ కాంప్లెక్సిటీ

---

## వాతావరణ ఆధారిత ఎంపిక

### అభివృద్ధి వాతావరణం

**ప్రాధాన్యతలు**: ఖర్చు ఆప్టిమైజేషన్, ప్రాథమిక ఫంక్షనాలిటీ, సులభమైన ప్రావిజనింగ్/డీ-ప్రావిజనింగ్

#### సిఫార్సు చేసిన SKU లు
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Standard"      # Free tier is an account opt-in, not a SKU
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "workspace-based" # Consumption billing; no Free SKU
```

#### లక్షణాలు
- **యాప్ సర్వీస్**: సులభ పరీక్షలకి F1 (ఉచితం) లేదా B1 (బేసిక్)
- **డేటాబేస్‌లు**: కనిష్ట వనరులతో బేసిక్ టియర్
- **స్టోరేజ్**: స్థానిక రెడండన్సీతో స్టాండర్డ్ మాత్రమే
- **కంప్యూట్**: షేర్డ్ వనరులు అనుకూలం
- **నెట్వర్కింగ్**: ప్రాథమిక కాన్ఫిగరేషన్లు

### స్టేజింగ్/పరీక్ష వాతావరణం

**ప్రాధాన్యతలు**: ప్రొడక్షన్‌లాగా కాన్ఫిగరేషన్, ఖర్చు సమతౌల్యం, పనితీరు పరీక్ష సామర్థ్యం

#### సిఫార్సు చేసిన SKU లు
```yaml
# Staging environment configuration
environment: staging
skus:
  app_service: "S1"          # Standard tier
  sql_database: "S2"         # Standard tier, 50 DTU
  storage: "Standard_GRS"    # Geo-redundant
  cosmos_db: "Standard"      # 400 RU/s provisioned
  container_apps: "Consumption" # Pay-per-use
```

#### లక్షణాలు
- **పనితీరు**: ఉత్పత్తి సామర్థ్యం యొక్క 70-80%
- **ఫీచర్లు**: ఎక్కువ భాగం ప్రొడక్షన్ ఫీచర్లు రానabled
- **రెడండన్సీ**: కొంత భౌగోళిక రెడండన్సీ
- **స్కేలింగ్**: పరీక్షల కోసం పరిమిత ఆటో-స్కేలింగ్
- **మోనిటరింగ్**: పూర్తి మోనిటరింగ్ స్టాక్

### ప్రొడక్షన్ వాతావరణం

**ప్రాధాన్యతలు**: పనితీరు, లభ్యత, భద్రత, అనుగుణత, స్కేలబిలిటీ

#### సిఫార్సు చేసిన SKU లు
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Standard_GRS"    # Geo-redundant; Premium_GRS is not a storage SKU
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### లక్షణాలు
- **అత్యంత లభ్యత**: 99.9%+ SLA అవసరాలు
- **పనితీరు**: ప్రత్యేక వనరులు, అధిక థ్రూపుట్
- **భద్రత**: ప్రీమియం భద్రత ఫీచర్లు
- **స్కేలింగ్**: పూర్తి ఆటో-స్కేలింగ్ సామర్థ్యాలు
- **మోనిటరింగ్**: సమగ్ర విశ్లేషణ

---

## సర్వీస్-స్పెసిఫిక్ మార్గదర్శకాలు

### Azure యాప్ సర్వీసు

#### SKU నిర్ణయ మేట్రిక్స్

| ఉపయోగ కేసు | సిఫార్సు చేయబడిన SKU | కారణం |
|----------|----------------|-----------|
| అభివృద్ధి/పరీక్ష | F1 (ఉచితం) లేదా B1 (బేసిక్) | వ్యయ సమర్థవంతమైనది, పరీక్షలకు సరిపోతుంది |
| చిన్న ప్రొడక్షన్ యాప్స్ | S1 (స్టాండర్డ్) | కస్టమ్ డొమైన్‌లు, SSL, ఆటో-స్కేలింగ్ |
| మధ్యమ ప్రొడక్షన్ యాప్స్ | P1V3 (ప్రీమియం V3) | మెరుగైన పనితీరు, మరిన్ని ఫీచర్లు |
| అధిక ట్రాఫిక్ యాప్స్ | P2V3 లేదా P3V3 | ప్రత్యేక వనరులు, అధిక పనితీరు |
| మిషన్-క్రిటికల్ యాప్స్ | I1V2 (ఐసోలేటెడ్ V2) | నెట్వర్క్ ఐసోలేషన్, ప్రత్యేక హార్డ్‌వేర్ |

#### కాన్ఫిగరేషన్ ఉదాహరణలు

**అభివృద్ధి**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-dev'
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
    capacity: 1
  }
  properties: {
    reserved: false
  }
}
```

**ప్రొడక్షన్**
```bicep
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environmentName}-prod'
  location: location
  sku: {
    name: 'P1V3'
    tier: 'PremiumV3'
    capacity: 3
  }
  properties: {
    reserved: false
  }
}
```

### Azure SQL డేటాబేస్

#### SKU ఎంపిక ఫ్రేమ్‌వర్క్

1. **DTU-ఆధారిత (డేటాబేస్ ట్రాన్సాక్షన్ యూనిట్స్)**
   - **బేసిక్**: 5 DTU - అభివృద్ధి/పరీక్ష
   - **స్టాండర్డ్**: S0-S12 (10-3000 DTU) - జెనరల్ పర్పస్
   - **ప్రీమియం**: P1-P15 (125-4000 DTU) - పనితీరు-తీవ్రమైన

2. **vCore-ఆధారిత** (ప్రొడక్షన్‌కు సిఫార్సు చేయబడింది)
   - **జెనరల్ పర్పస్**: సమతుల్య కంఫ్యూట్ మరియు నిల్వ
   - **బిజినెస్ క్రిటికల్**: తక్కువ లేటెన్సీ, అధిక IOPS
   - **హైపర్‌స్కేల్**: అత్యంత స్కేలబుల్ నిల్వ; ప్రస్తుత పరిమాణ పరిమితులు మరియు ప్రాంతీయ మద్దతును నిర్ధారించుకోండి

#### ఉదాహరణ కాన్ఫిగరేషన్లు

```bicep
// Development
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-dev'
  parent: sqlServer
  location: location
  sku: {
    name: 'Basic'
    tier: 'Basic'
    capacity: 5
  }
  properties: {
    maxSizeBytes: 2147483648 // 2GB
  }
}

// Production
resource sqlDatabase 'Microsoft.Sql/servers/databases@2022-05-01-preview' = {
  name: 'db-${environmentName}-prod'
  parent: sqlServer
  location: location
  sku: {
    name: 'GP_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 4
  }
  properties: {
    maxSizeBytes: 536870912000 // 500GB
  }
}
```

### Azure కంటెయినర్ యాప్స్

#### వాతావరణ రకాలు

1. **ఖర్చు-ఆధారిత**
   - వినియోగం ప్రకారం చెల్లింపు
   - అభివృద్ధి మరియు మార్పిడి పనిభారాలకు అనుకూలం
   - షేర్డ్ మౌలిక సదుపాయాలు

2. **ప్రత్యేక (పనిభారం ప్రొఫైల్స్)**
   - ప్రత్యేక కంఫ్యూట్ వనరులు
   - అంచనా పనితీరు
   - ప్రొడక్షన్ పనిభారాలకు మెరుగైనది

#### కాన్ఫిగరేషన్ ఉదాహరణలు

**అభివృద్ధి (వినియోగం ఆధారిత)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-dev'
  location: location
  properties: {
    zoneRedundant: false
  }
}

resource containerApp 'Microsoft.App/containerApps@2022-10-01' = {
  name: 'ca-${environmentName}-dev'
  location: location
  properties: {
    managedEnvironmentId: containerAppEnvironment.id
    configuration: {
      ingress: {
        external: true
        targetPort: 80 // nginx listens on 80 by default
      }
    }
    template: {
      containers: [{
        name: 'main'
        image: 'nginx:latest'
        resources: {
          cpu: json('0.25')
          memory: '0.5Gi'
        }
      }]
      scale: {
        minReplicas: 0
        maxReplicas: 1
      }
    }
  }
}
```

**ప్రొడక్షన్ (ప్రత్యేక)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2024-03-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 3
      maximumCount: 10
    }]
  }
}
```

జోన్ రెడండన్సీకి మద్దతు ఉన్న ప్రాంతీయ మౌలిక సదుపాయాలు మరియు అనుకూల VNet/సబ్‌నెట్ కాన్ఫిగరేషన్ అవసరం, ఇది ఇక్కడ తగ్గించబడింది. ఈ ఉదాహరణలో మూడు ప్రత్యేక నోడ్ల బడ్జెట్ ఉన్నది; క్రాస్-జోన్ పంపిణీ కోసం కనీసం రెండు యాప్ రిప్లికాలను కన్ఫిగర్ చేయండి మరియు జోన్ వైఫల్యానికి రిప్లికాలు మరియు నోడ్ల పరిమాణాన్ని సెట్ చేయండి. [కంటెయినర్ యాప్స్ విశ్వసనీయత మార్గదర్శకం](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps) చూడండి. ఈ ప్రొఫైల్‌పై యాప్‌ను ఉంచడానికి, దాని `workloadProfileName: 'production-profile'` సెట్చేయాలి; ప్రొఫైల్ సృష్టించడం మాత్రమె యాప్స్‌ను దానికి తరలించడం కాదు.

### Azure కోస్మోస్ DB

#### థ్రూపుట్ మోడళ్లు

1. **మెన్యువల్ ప్రోవిజన్డ్ థ్రూపుట్**
   - అంచనా పనితీరు
   - రిజర్వ్ కాపాసిటీ డిస్కౌంట్లు
   - స్థిరమైన పనిభారాల కోసం ఉత్తమం

2. **ఆటోస్కేల్ ప్రోవిజన్డ్ థ్రూపుట్**
   - వినియోగంపై ఆధారపడి ఆటోమేటిక్ స్కేలింగ్
   - ఉపయోగించిన మేరకు చెల్లించండి (కనిష్టం తో)
   - మార్పిడి పనిభారాలకు సరైనది

3. **సర్వర్‌లెస్**
   - అభ్యర్థనల వారీగా చెల్లింపు
   - ప్రోవిజన్డ్ థ్రూపుట్ లేదు
   - అభివృద్ధి మరియు అంతరాయం ఉన్న పనిభారాలకు ఆదర్శం

#### SKU ఉదాహరణలు

```bicep
// Development - Serverless
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-dev'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [{
      locationName: location
    }]
    capabilities: [{
      name: 'EnableServerless'
    }]
  }
}

// Production - Provisioned with Autoscale
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: 'cosmos-${environmentName}-prod'
  location: location
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
      }
      {
        locationName: secondaryLocation
        failoverPriority: 1
      }
    ]
    enableAutomaticFailover: true
    enableMultipleWriteLocations: false
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  name: 'main'
  parent: cosmosAccount
  properties: {
    resource: {
      id: 'main'
    }
    options: {
      autoscaleSettings: {
        maxThroughput: 4000
      }
    }
  }
}
```

### Azure స్టోరేజ్ అకౌంట్

#### స్టోరేజ్ అకౌంట్ రకాలు

1. **స్టాండర్డ్_LRS** - అభివృద్ధి, కాదు-తీవ్రమైన డేటా
2. **స్టాండర్డ్_GRS** - ప్రొడక్షన్, భౌగోళిక రెడండన్సీ అవసరం
3. **ప్రీమియం_LRS** - అధిక పనితీరు అప్లికేషన్లు
4. **ప్రీమియం_ZRS** - జోన్ రెడండన్సీతో అధిక లభ్యత

#### పనితీరు టియర్స్

- **స్టాండర్డ్**: సాధారణ ఉపయోగం, ఖర్చు సమర్థవంతం
- **ప్రీమియం**: అధిక పనితీరు, తక్కువ లేటెన్సీ క్షేత్రాలు

```bicep
// Development
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}dev'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
  }
}

// Production
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'sa${uniqueString(resourceGroup().id)}prod'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    networkAcls: {
      defaultAction: 'Deny'
      virtualNetworkRules: []
      ipRules: []
    }
  }
}
```

---

## ఖర్చు ఆప్టిమైజేషన్ వ్యూహాలు

### 1. రిజర్వ్ కాపాసిటీ

గొప్ప డిస్కౌంట్ల కోసం 1-3 సంవత్సరాల కోసం వనరులను రిజర్వు చేయండి:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

రిజర్వేషన్ ఆఫరింగ్‌లు మరియు అర్హత గల వనరు రకాలు మారవచ్చు; ప్రతీ సర్వీస్/SKU రిజర్వేషన్ ను మద్దతు ఇచ్చిందని అనుకోవడం కాకుండా క్యాటలాగ్ మరియు కొనుగోలు నిబంధనలను పరిశీలించండి.

### 2. సరైన వడిమినలు (Right-Sizing)

చిన్న SKU లతో ప్రారంభించి వాస్తవ వినియోగం ఆధారంగా పెంపొందండి:

```yaml
# Progressive scaling approach
development:
  app_service: "F1"    # Free tier
testing:
  app_service: "B1"    # Basic tier  
staging:
  app_service: "S1"    # Standard tier
production:
  app_service: "P1V3"  # Premium tier
```

### 3. ఆటో-స్కేలింగ్ కాన్ఫిగరేషన్

ఖర్చులను ఆప్టిమైజ్ చేయడానికి తెలివైన స్కేలింగ్ అమలు చేయండి:

```bicep
resource autoScaleSettings 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'autoscale-${appServicePlan.name}'
  location: location
  properties: {
    profiles: [{
      name: 'default'
      capacity: {
        minimum: '1'
        maximum: '10'
        default: '2'
      }
      rules: [
        {
          metricTrigger: {
            statistic: 'Average'
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'GreaterThan'
            threshold: 70
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Increase'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
        {
          metricTrigger: {
            statistic: 'Average'
            metricName: 'CpuPercentage'
            metricResourceUri: appServicePlan.id
            operator: 'LessThan'
            threshold: 30
            timeAggregation: 'Average'
            timeGrain: 'PT1M'
            timeWindow: 'PT5M'
          }
          scaleAction: {
            direction: 'Decrease'
            type: 'ChangeCount'
            value: '1'
            cooldown: 'PT5M'
          }
        }
      ]
    }]
    enabled: true
    targetResourceUri: appServicePlan.id
  }
}
```

### 4. షెడ్యూల్ చేసిన స్కేలింగ్

ఆఫ్-ఆవర్ల సమయంలో తగ్గించండి:

```json
{
  "profiles": [
    {
      "name": "business-hours",
      "capacity": {
        "minimum": "2",
        "maximum": "10", 
        "default": "3"
      },
      "recurrence": {
        "frequency": "Week",
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [8],
          "minutes": [0]
        }
      }
    },
    {
      "name": "off-hours",
      "capacity": {
        "minimum": "1",
        "maximum": "2",
        "default": "1"
      },
      "recurrence": {
        "frequency": "Week", 
        "schedule": {
          "timeZone": "Pacific Standard Time",
          "days": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
          "hours": [18],
          "minutes": [0]
        }
      }
    }
  ]
}
```

---

## పనితీరు పరిశీలనలు

### బేస్లైన్ పనితీరు అవసరాలు

SKU ఎంచుకునే ముందుగా సున్నితం పనితీరు అవసరాలను నిర్వచించండి:

```yaml
performance_requirements:
  response_time:
    p95: "< 500ms"
    p99: "< 1000ms"
  throughput:
    requests_per_second: 1000
    concurrent_users: 500
  availability:
    uptime: "99.9%"
    rpo: "15 minutes"
    rto: "30 minutes"
```

### లోడ్ టెస్టింగ్

పనితీరును ధృవీకరించడానికి వేర్వేరు SKUలను పరీక్షించండి:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### మోనిటరింగ్ మరియు ఆప్టిమైజేషన్

సమగ్ర మోనిటరింగ్ సెటప్ చేయండి:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    IngestionMode: 'LogAnalytics'
  }
}

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: 'law-${environmentName}'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}
```

---

## త్వరిత సూచిక పట్టికలు

### యాప్ సర్వీస్ SKU త్వరిత సూచిక

| SKU | టియర్ | vCPU | RAM | నిల్వ | ధర పరిధి | ఉపయోగం కేసు |
|-----|------|------|-----|---------|-------------|----------|
| F1 | ఉచితం | షేర్డ్ | 1GB | 1GB | ఉచితం | అభివృద్ధి |
| B1 | బేసిక్ | 1 | 1.75GB | 10GB | $ | చిన్న యాప్స్ |
| S1 | స్టాండర్డ్ | 1 | 1.75GB | 50GB | $$ | ప్రొడక్షన్ |
| P1V3 | ప్రీమియం V3 | 2 | 8GB | 250GB | $$$ | అధిక పనితీరు |
| I1V2 | ఐసోలేటెడ్ V2 | 2 | 8GB | 1TB | $$$$ | ఎంటర్ప్రైజ్ |

### SQL డేటాబేస్ SKU త్వరిత సూచిక

| SKU | టియర్ | DTU/vCore | నిల్వ | ధర పరిధి | ఉపయోగం కేసు |
|-----|------|-----------|---------|-------------|----------|
| బేసిక్ | బేసిక్ | 5 DTU | 2GB | $ | అభివృద్ధి |
| S2 | స్టాండర్డ్ | 50 DTU | 250GB | $$ | చిన్న ప్రొడక్షన్ |
| P2 | ప్రీమియం | 250 DTU | 1TB | $$$ | అధిక పనితీరు |
| GP_Gen5_4 | జెనరల్ పర్పస్ | 4 vCore | 4TB | $$$ | సమతుల్యమైనది |
| BC_Gen5_8 | బిజినెస్ క్రిటికల్ | 8 vCore | 4TB | $$$$ | మిషన్ క్రిటికల్ |

### కంటెయినర్ యాప్స్ SKU త్వరిత సూచిక

| మోడల్ | ధరాచారం | CPU/మెమరీ | ఉపయోగం కేసు |
|-------|---------|------------|----------|
| వినియోగం | ఉపయోగించినదానికుగాను చెల్లింపు | వాతావరణం/ప్రొఫైల్ ఆధారంగా మద్దతుతో CPU/మెమరీ కలయికలు | అభివృద్ధి లేదా ప్రొడక్షన్, మార్పిడి లోడ్ |
| ప్రత్యేక D4 | ప్రత్యేక నోడ్ బిల్లింగ్ | 4 vCPU, 16GiB ప్రతి నోడ్ | స్థిరమైన లోడ్/ఐసోలేషన్ అవసరాలు |
| ప్రత్యేక D8 | ప్రత్యేక నోడ్ బిల్లింగ్ | 8 vCPU, 32GiB ప్రతి నోడ్ | ఎక్కువ స్థిరమైన లోడ్ |

---

## ధృవీకరణ సాధనాలు

### SKU లభ్యత చెకర్

```bash
#!/bin/bash
# Check SKU availability in target region

check_sku_availability() {
    local region=$1
    local resource_type=$2
    local sku=$3
    
    echo "Checking $sku availability for $resource_type in $region..."
    
    case $resource_type in
        "app-service")
            az appservice list-locations --sku $sku --output table
            ;;
        "sql-database")
            az sql db list-editions --location $region --output table
            ;;
        "storage")
            # Name availability is not SKU availability.
            az storage sku list --query "[?name=='$sku'].{name:name,locations:locations,restrictions:restrictions}" --output json
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# Usage
check_sku_availability "eastus" "app-service" "P1V3"
```

### ఖర్చు అంచనా స్క్రిప్ట్

**సుడోకోడ్ మాత్రమే:** క్రింద `Get-ResourceCost` ప్రాజెక్ట్-నిర్దిష్ట ఫంక్షన్ మీరు అమలు చేయాలి ప్రస్తుత ప్రాంతీయ/ఒప్పంద ధరలు మరియు వినియోగ అంచనాలతో. ఇది పవర్‌షెల్ లేదా Azure cmdlet కాదు.

```powershell
# PowerShell script for cost estimation
function Get-AzureCostEstimate {
    param(
        [string]$SubscriptionId,
        [string]$ResourceGroup,
        [hashtable]$Resources
    )
    
    $totalCost = 0
    
    foreach ($resource in $Resources.GetEnumerator()) {
        $resourceType = $resource.Key
        $sku = $resource.Value
        
        # Use Azure Pricing API or calculator
        $cost = Get-ResourceCost -Type $resourceType -SKU $sku
        $totalCost += $cost
        
        Write-Host "$resourceType ($sku): $cost/month"
    }
    
    Write-Host "Total estimated cost: $totalCost/month"
}

# Usage
$resources = @{
    "AppService" = "P1V3"
    "SqlDatabase" = "GP_Gen5_4"
    "StorageAccount" = "Standard_GRS"
}

Get-AzureCostEstimate -ResourceGroup "rg-myapp-prod" -Resources $resources
```

### పనితీరు ధృవీకరణ

ఈ క్రింది YAML అవసరాలకు రూపకల్పన మాత్రమే, **కాదు** Azure లోడ్ టెస్టింగ్, JMeter, Locust, లేదా k6 ఇన్‌పుట్ స్కీమా. పై లోడ్-టెస్ట్ కమాండ్ వాడే ముందు దీన్ని మీ ఎంపిక టూల్ యొక్క వాస్తవ కాన్ఫిగరేషన్‌గా మార్చండి.

```yaml
# Load test configuration for SKU validation
test_configuration:
  duration: "10m"
  users:
    spawn_rate: 10
    max_users: 100
  
  scenarios:
    - name: "sku_performance_test"
      requests:
        - url: "https://myapp.azurewebsites.net/api/health"
          method: "GET"
          expect:
            - status_code: 200
            - response_time_ms: 500
        
        - url: "https://myapp.azurewebsites.net/api/data"
          method: "POST"
          expect:
            - status_code: 201
            - response_time_ms: 1000

  thresholds:
    http_req_duration:
      - "p(95)<500"  # 95% of requests under 500ms
      - "p(99)<1000" # 99% of requests under 1s
    http_req_failed:
      - "rate<0.1"   # Less than 10% failure rate
```

---

## ఉత్తమ ప్రచార సారాంశం

### చేయవలసినవి

1. **చిన్నగా ప్రారంభించి వాస్తవ వినియోగం ఆధారంగా పెంపొందించండి**
2. **వేర్వేరు వాతావరణాలకు వేర్వేరు SKUలను ఉపయోగించండి**
3. **పనితీరు మరియు ఖర్చులను నిరంతరం మోనిటర్ చేయండి**
4. **ప్రొడక్షన్ పనిభారాలకు రిజర్వ్ కాపాసిటీని ఉపయోగించండి**
5. **సరైన చోట్ల ఆటో-స్కేలింగ్ అమలు చేయండి**
6. **వాస్తవిక పనిభారాలతో పనితీరు పరీక్షించండి**
7. **వృద్ధికి ప్లాన్ చేయండి కాని అతిగా ప్రావిజనింగ్ నుండి దూరంగా ఉండండి**
8. **అభివృద్ధికి సాధ్యమైనప్పుడు ఉచిత టియర్స్ ఉపయోగించండి**

### చేయకూడని పనులు

1. **అభివృద్ధికి ప్రొడక్షన్ SKUలను ఉపయోగించవద్దు**
2. **ప్రాంతీయ SKU లభ్యతను మిస్ అవ్వవద్దు**
3. **డేటా ట్రాన్స్ఫర్ ఖర్చులను మరవవద్దు**
4. **వాజిబైన కారణం లేకుండా అతిగా ప్రావిజనింగ్ చేయొద్దు**
5. **ఆధారాలను దృష్టిలో పెట్టుకోకపోవద్దు**
6. **అటో-స్కేలింగ్ పరిమితులను ఎక్కువగా సెట్ చేయొద్దు**
7. **అనుగుణత అవసరాలను మరవవద్దు**
8. **ధర ఆధారంగా మాత్రమే నిర్ణయాలు తీసుకోకూడదు**

---

**ప్రో చిట్కా**: మీ వాస్తవ వినియోగ నమూనాల ఆధారంగా SKU ఎంపికలను ఆప్టిమైజ్ చేయటానికి Azure ఖర్చు మేనేజ్మెంట్ మరియు అడ్వైజర్ ఉపయోగించి వ్యక్తిగత సిఫార్సులు పొందండి.

---

**నావిగేషన్**
- **ముందటి పాఠము**: [क्षमता योजना](capacity-planning.md)
- **తదుపరి పాఠము**: [ప్రి-ఫ్లైట్ చెక్కులు](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->