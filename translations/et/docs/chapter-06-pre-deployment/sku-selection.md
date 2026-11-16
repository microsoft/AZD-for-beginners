# SKU valiku juhend - õige Azure teenustaseme valimine

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 6 - Eelnev valideerimine ja planeerimine
- **⬅️ Eelmine**: [Mahutavuse planeerimine](capacity-planning.md)
- **➡️ Järgmine**: [Eelpardimine kontrollid](preflight-checks.md)
- **🚀 Järgmine peatükk**: [Peatükk 7: Tõrkeotsing](../chapter-07-troubleshooting/common-issues.md)

## Sissejuhatus

See põhjalik juhend aitab teil valida optimaalsed Azure teenuse SKU-d (laoseisus ühikud) erinevate keskkondade, töökoormuste ja nõudmiste jaoks. Õppige analüüsima jõudlusvajadusi, kulude kaalutlusi ja skaleeritavuse nõudeid, et valida Azure Developer CLI kasutuselevõttede jaoks sobivaimad teenustasemed.

## Õpieesmärgid

Selle juhendi lõpetamisel:
- Mõistate Azure SKU kontseptsioone, hinnamudeleid ja omaduste erinevusi
- Omandate keskkonnapõhised SKU valimise strateegiad arenduseks, testimiseks ja tootmiseks
- Analüüsite töökoormuste nõudeid ja sobitate need sobivate teenustasemetega
- Rakendate kulude optimeerimise strateegiaid nutika SKU valiku kaudu
- Kasutate jõudluse testimise ja valideerimise tehnikaid SKU valikute puhul
- Konfigureerite automaatseid SKU soovitusi ja jälgimist

## Õpitulemused

Pärast lõpetamist suudate:
- Valida töökoormuse nõuete ja piirangute põhjal sobivad Azure teenuse SKU-d
- Kujundada kulutõhusaid mitmekeskkondlikke arhitektuure õige taseme valikuga
- Rakendada jõudluse võrdlustesti ja valideerimist SKU valikuteks
- Luua automatiseeritud tööriistu SKU soovitamiseks ja kulude optimeerimiseks
- Plaanida SKU migratsioone ja skaleerimisstrateegiaid muutuvate nõuete jaoks
- Rakendada Azure Well-Architected Framework põhimõtteid teenustaseme valikul

## Sisukord

- [SKU-de mõistmine](#understanding-skus)
- [Keskkonnapõhine valik](#environment-based-selection)
- [Teenusepõhised juhised](#service-specific-guidelines)
- [Kulude optimeerimise strateegiad](#cost-optimization-strategies)
- [Jõudluskaalutlused](#performance-considerations)
- [Kiire viite tabelid](#quick-reference-tables)
- [Valideerimistööriistad](#validation-tools)

---

## SKU-de mõistmine

> **Näite ulatus:** Allolevad YAML SKU kaardid ja jõudluse konfiguratsioonid on disainimärkused, mitte `azure.yaml` skeem või koormustööriista konfiguratsioon. Bicepi plokid on alternatiivid/fragmendid: deklareerige nende parameetrid ja emaresursid, kasutage unikaalseid sümboolseid nimesid nende kombineerimisel, ning ühendage moodulid tööprojektiks. Hinnad, piirangud ja piirkonna/SKU saadavus tuleb enne juurutamist teie tellimuse kohta kontrollida.

### Mis on SKU-d?

SKU-d (laoseisus ühikud) esindavad erinevaid teenustasemeid ja jõudlustasemeid Azure ressursside jaoks. Iga SKU pakub erinevaid:

- **Jõudlusomadusi** (CPU, mälu, läbilaskevõime)
- **Funktsioonide saadavust** (skaleerimisvõimalused, SLA tasemed)
- **Hinnamudeleid** (kasutuspõhine, reserveeritud maht)
- **Piirkondlikku saadavust** (mitte kõik SKU-d pole kõigis regioonides saadaval)

### Peamised tegurid SKU valikul

1. **Töökoormuse nõuded**
   - Eeldatavad liiklus-/koormusmustrit
   - Jõudlusnõuded (CPU, mälu, I/O)
   - Salvestusvajadused ja ligipääsumustrid

2. **Keskkonna tüüp**
   - Arendus/testimine vs tootmine
   - Saadavuse nõuded
   - Turbe- ja vastavusvajadused

3. **Eelarve piirangud**
   - Algkulud vs tegevuskulud
   - Reserveeritud mahu soodustused
   - Automaatskaleerimise kulumõjud

4. **Kasvuprognoosid**
   - Skaleeritavuse nõuded
   - Tulevased funktsioonivajadused
   - Migratsiooni keerukus

---

## Keskkonnapõhine valik

### Arenduskeskkond

**Eesmärgid**: kulude optimeerimine, põhiline funktsionaalsus, lihtne paigaldus ja eemaldamine

#### Soovitatud SKU-d
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

#### Omadused
- **App Service**: F1 (Tasuta) või B1 (Põhi) lihtsaks testimiseks
- **Andmebaasid**: Põhitase minimaalsete ressurssidega
- **Salvestus**: Standard, ainult lokaalse redundantsiga
- **Arvutus**: Jagatud ressursid sobivad
- **Võrk**: Põhikonfiguratsioonid

### Testimise/eelvaate keskkond

**Eesmärgid**: tootmisele sarnane konfiguratsioon, kulu ja jõudluse tasakaal, võimekus jõudluse testimiseks

#### Soovitatud SKU-d
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

#### Omadused
- **Jõudlus**: 70-80% tootmismahust
- **Funktsioonid**: enamus tootmisfunktsioone lubatud
- **Redundantsus**: osa geograafiline redundants
- **Skaleerimine**: piiratud automaatne skaleerimine testimiseks
- **Jälgimine**: täielik jälgimispakett

### Tootmiskeskkond

**Eesmärgid**: jõudlus, kättesaadavus, turvalisus, vastavus, skaleeritavus

#### Soovitatud SKU-d
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

#### Omadused
- **Kõrge kättesaadavus**: 99,9%+ SLA nõuded
- **Jõudlus**: pühendatud ressursid, kõrge läbilaskevõime
- **Turve**: premium-turbe omadused
- **Skaleerimine**: täielikud automaatse skaleerimise võimalused
- **Jälgimine**: põhjalik jälgitavus

---

## Teenusepõhised juhised

### Azure App Service

#### SKU valikumaatriks

| Kasutusjuhud | Soovitatud SKU | Põhjendus |
|----------|----------------|-----------|
| Arendus/testimine | F1 (Tasuta) või B1 (Põhi) | Kulutõhus, piisav testimiseks |
| Väikesed tootmiskeskkonna rakendused | S1 (Standard) | Kohandatud domeenid, SSL, automaatne skaleerimine |
| Keskmise suurusega tootmiskeskkonna rakendused | P1V3 (Premium V3) | Parem jõudlus, rohkem funktsioone |
| Kõrge koormusega rakendused | P2V3 või P3V3 | Pühendatud ressursid, kõrge jõudlus |
| Väga kriitilised rakendused | I1V2 (Isolatsioon V2) | Võrgu isolatsioon, pühendatud riistvara |

#### Konfiguratsiooni näited

**Arendus**
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

**Tootmine**
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

### Azure SQL Database

#### SKU valiku raamistik

1. **DTU-põhine (Andmebaasi tehinguühikud)**
   - **Põhi**: 5 DTU - arendus/testimine
   - **Standard**: S0-S12 (10-3000 DTU) - üldotstarbeline
   - **Premium**: P1-P15 (125-4000 DTU) - jõudlus-kriitiline

2. **vCore-põhine** (t soovitatav tootmises)
   - **Üldotstarbeline**: tasakaalustatud arvutus ja salvestus
   - **Ärikriitiline**: madal latentsus, kõrge IOPS
   - **Hyperscale**: väga skaleeritav salvestus; kontrollige praeguseid suuruse piire ja piirkondlikku toetust

#### Näited konfiguratsioonidest

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

### Azure Container Apps

#### Keskkonna tüübid

1. **Kasutuspõhine**
   - Maksmine kasutuse järgi
   - Sobib arenduseks ja muutlikuks töökoormuseks
   - Jagatud infrastruktuur

2. **Pühendatud (Töökoormuse profiilid)**
   - Pühendatud arvutusressursid
   - Ennustatav jõudlus
   - Sobivam tootmistöökoormustele

#### Konfiguratsiooni näited

**Arendus (kasutuspõhine)**
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

**Tootmine (pühendatud)**
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

Tsooniredudantsus nõuab ka toetatud piirkonna infrastruktuuri ja sobivat VNet/subnet konfiguratsiooni, mis on siin välja jäetud. See näide eelarvestab kolm pühendatud sõlme; konfigureerige vähemalt kaks äri koopiat tide tsoonidevaheliseks jaotamiseks ning mõõtke nii koopiad kui sõlmed tsooni rikke jaoks. Vaadake [Container Apps töökindluse juhendit](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Rakenduse selle profiili peale paigutamiseks seadke selle `workloadProfileName: 'production-profile'`; profiili loomine ainult ei vii rakendusi selle alla.

### Azure Cosmos DB

#### Läbilaskevõime mudelid

1. **Muuaniline reserveeritud läbilaskevõime**
   - Ennustatav jõudlus
   - Reserveeritud mahu soodustused
   - Parim stabiilsete töökoormuste jaoks

2. **Automaatskaleeruv reserveeritud läbilaskevõime**
   - Automaatne skaleerimine kasutuse põhjal
   - Maksad selle eest, mida kasutad (minimaalsega)
   - Sobib muutlikele töökoormustele

3. **Serverless**
   - Maksmine päringu alusel
   - Puudub reserveeritud läbilaskevõime
   - Ideaalne arenduseks ja katkendlikeks töökoormusteks

#### SKU näited

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

### Azure Storage Account

#### Salvestuskonto tüübid

1. **Standard_LRS** - arendus, mitte-kriitilised andmed
2. **Standard_GRS** - tootmine, georedundantsus vajalik
3. **Premium_LRS** - jõudlusrakendused
4. **Premium_ZRS** - kõrge kättesaadavusega tsooniredudantsus

#### Jõudlustasemed

- **Standard**: üldotstarbeline, kulutõhus
- **Premium**: kõrge jõudlusega, madala latentsusega stsenaariumid

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

## Kulude optimeerimise strateegiad

### 1. Reserveeritud maht

Reserveerige ressursid 1-3 aastaks märkimisväärsete allahindluste saamiseks:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Reserveeritud pakkumised ja sobivad ressursitüübid varieeruvad; mõistlik on kontrollida kataloogi ja ostutingimusi, mitte eeldada, et iga teenus/SKU toetab reserveerimist.

### 2. Õige suurusega valik

Alustage väiksemate SKU-dega ja suurendage vastavalt tegelikule kasutusele:

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

### 3. Automaatskaleerimise konfiguratsioon

Rakendage nutikas skaleerimine kulude optimeerimiseks:

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

### 4. Ajastatud skaleerimine

Skaalake alla mitteaktiivsetel aegadel:

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

## Jõudluskaalutlused

### Baasjõudlusnõuded

Määratlege selged jõudlusnõuded enne SKU valikut:

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

### Koormustestimine

Testige erinevaid SKU-sid jõudluse valideerimiseks:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Jälgimine ja optimeerimine

Seadistage põhjalik jälgimine:

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

## Kiire viide tabelid

### App Service SKU kiire viide

| SKU | Tase | vCPU | RAM | Salvestus | Hinnavahemik | Kasutusjuhud |
|-----|------|------|-----|---------|-------------|----------|
| F1 | Tasuta | Jagatud | 1GB | 1GB | Tasuta | Arendus |
| B1 | Põhi | 1 | 1.75GB | 10GB | $ | Väikesed rakendused |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Tootmine |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Kõrge jõudlus |
| I1V2 | Isolatsioon V2 | 2 | 8GB | 1TB | $$$$ | Ettevõte |

### SQL andmebaasi SKU kiire viide

| SKU | Tase | DTU/vCore | Salvestus | Hinnavahemik | Kasutusjuhud |
|-----|------|-----------|---------|-------------|----------|
| Basic | Põhi | 5 DTU | 2GB | $ | Arendus |
| S2 | Standard | 50 DTU | 250GB | $$ | Väike tootmine |
| P2 | Premium | 250 DTU | 1TB | $$$ | Kõrge jõudlus |
| GP_Gen5_4 | Üldotstarbeline | 4 vCore | 4TB | $$$ | Tasakaalustatud |
| BC_Gen5_8 | Ärikeskselt oluline | 8 vCore | 4TB | $$$$ | Missioonikriitiline |

### Container Apps SKU kiire viide

| Mudel | Hinnakujundus | CPU/Mälu | Kasutusjuhud |
|-------|---------|------------|----------|
| Kasutuspõhine | Maksmine kasutuse järgi | Toetatud CPU/mälu kombinatsioonid sõltuvad keskkonnast/profiilist | Arendus või tootmine, muutuv koormus |
| Pühendatud D4 | Pühendatud sõlme arvepidamine | 4 vCPU, 16GiB sõlme kohta | Püsiv koormus/isoleerimisvajadused |
| Pühendatud D8 | Pühendatud sõlme arvepidamine | 8 vCPU, 32GiB sõlme kohta | Kõrgem püsiv koormus |

---

## Valideerimistööriistad

### SKU saadavuse kontrollija

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

### Kulu hindamise skript

**Pseudokood ainult:** `Get-ResourceCost` all on projekti-spetsiifiline funktsioon, mille peate ellu viima kasutades praeguseid piirkondlikke/lepingulisi hindu ja kasutuse eeldusi. See ei ole PowerShelli ega Azure cmdlet.

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

### Jõudluse valideerimine

Järgneva YAML on nõudmiste visand, **mitte** Azure Load Testing, JMeter, Locust või k6 sisendi skeem. Tõlkige see oma valitud tööriista reaalseks konfiguratsiooniks enne koormustesti käsu kasutamist ülal.

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

## Parimad tavad kokkuvõte

### Tee nii

1. **Alusta väikestest SKU-dest ja skaleeri ülespoole** vastavalt tegelikule kasutusele
2. **Kasuta erinevaid SKU-sid eri keskkondades**
3. **Jälgi pidevalt jõudlust ja kulusid**
4. **Kasuta tootmistöökoormustele reserveeritud mahtu**
5. **Rakenda autoskaleerimist, kus see sobib**
6. **Testeeri jõudlust realistlike töökoormustega**
7. **Plaani kasvuks, kuid väldi üleliigset ressursside kasutamist**
8. **Kasuta arenduses tasuta tasemeid, kui võimalik**

### Väldi järgmist

1. **Ära kasuta tootmise SKU-sid arenduseks**
2. **Ära ignoreeri piirkondlikku SKU saadavust**
3. **Ära unusta andmeedastuse kulusid**
4. **Ära üleprovisioneerita põhjendamatult**
5. **Ära unusta sõltuvuste mõju**
6. **Ära sea autoskaleerimise piire liiga kõrgele**
7. **Ära unusta vastavusnõudeid**
8. **Ära tee otsuseid ainult hinna alusel**

---

**Professionaalne näpunäide**: Kasutage Azure Kulu Halduse ja Advisori teenuseid, et saada isikupärastatud soovitusi oma SKU valikute optimeerimiseks vastavalt tegelikule kasutusmustrile.

---

**Navigeerimine**
- **Eelmine õppetund**: [Mahutavuse planeerimine](capacity-planning.md)
- **Järgmine õppetund**: [Eelpardimine kontrollid](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->