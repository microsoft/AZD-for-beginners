<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7c000a3a8f4a04aa85c6d35714e3dee0",
  "translation_date": "2025-09-09T22:04:53+00:00",
  "source_file": "docs/pre-deployment/sku-selection.md",
  "language_code": "fi"
}
-->
# SKU-valintaopas - Oikean Azure-palvelutason valinta

## Johdanto

Tämä kattava opas auttaa sinua valitsemaan optimaaliset Azure-palvelu-SKU:t (Stock Keeping Units) eri ympäristöihin, työkuormiin ja vaatimuksiin. Opit analysoimaan suorituskykytarpeita, kustannusnäkökulmia ja skaalautuvuusvaatimuksia, jotta voit valita sopivimmat palvelutasot Azure Developer CLI -käyttöönottoihin.

## Oppimistavoitteet

Tämän oppaan avulla opit:
- Ymmärtämään Azure SKU -konseptit, hinnoittelumallit ja ominaisuuserot
- Hallitsemaan ympäristökohtaisia SKU-valintastrategioita kehitykseen, testaukseen ja tuotantoon
- Analysoimaan työkuormavaatimuksia ja yhdistämään ne sopiviin palvelutasoihin
- Toteuttamaan kustannusoptimointistrategioita älykkään SKU-valinnan avulla
- Soveltamaan suorituskykytestausta ja validointitekniikoita SKU-valinnoille
- Konfiguroimaan automatisoituja SKU-suosituksia ja seurantaa

## Oppimistulokset

Oppaan suorittamisen jälkeen pystyt:
- Valitsemaan sopivat Azure-palvelu-SKU:t työkuormavaatimusten ja rajoitteiden perusteella
- Suunnittelemaan kustannustehokkaita monen ympäristön arkkitehtuureja oikeilla tasovalinnoilla
- Toteuttamaan suorituskykyvertailuja ja validointia SKU-valinnoille
- Luomaan automatisoituja työkaluja SKU-suosituksiin ja kustannusoptimointiin
- Suunnittelemaan SKU-siirtymiä ja skaalautumisstrategioita muuttuvien vaatimusten mukaan
- Soveltamaan Azure Well-Architected Framework -periaatteita palvelutason valintaan

## Sisällysluettelo

- [SKU:iden ymmärtäminen](../../../../docs/pre-deployment)
- [Ympäristökohtainen valinta](../../../../docs/pre-deployment)
- [Palvelukohtaiset ohjeet](../../../../docs/pre-deployment)
- [Kustannusoptimointistrategiat](../../../../docs/pre-deployment)
- [Suorituskykynäkökohdat](../../../../docs/pre-deployment)
- [Pikaviittaustaulukot](../../../../docs/pre-deployment)
- [Validointityökalut](../../../../docs/pre-deployment)

---

## SKU:iden ymmärtäminen

### Mitä SKU:t ovat?

SKU:t (Stock Keeping Units) edustavat eri palvelutasoja ja suorituskykytasoja Azure-resursseille. Jokainen SKU tarjoaa erilaisia:

- **Suorituskykyominaisuuksia** (CPU, muisti, läpimeno)
- **Ominaisuuksien saatavuutta** (skaalausvaihtoehdot, SLA-tasot)
- **Hinnoittelumalleja** (kulutuspohjainen, varattu kapasiteetti)
- **Alueellista saatavuutta** (kaikki SKU:t eivät ole saatavilla kaikilla alueilla)

### Tärkeimmät tekijät SKU-valinnassa

1. **Työkuormavaatimukset**
   - Odotetut liikenne-/kuormitusmallit
   - Suorituskykyvaatimukset (CPU, muisti, I/O)
   - Tallennustarpeet ja käyttömallit

2. **Ympäristötyyppi**
   - Kehitys/testaus vs. tuotanto
   - Saatavuusvaatimukset
   - Turvallisuus- ja vaatimustenmukaisuustarpeet

3. **Budjettirajoitteet**
   - Alkuperäiset kustannukset vs. operatiiviset kustannukset
   - Varatun kapasiteetin alennukset
   - Automaattisen skaalauksen kustannusvaikutukset

4. **Kasvuprojektiot**
   - Skaalautuvuusvaatimukset
   - Tulevat ominaisuustarpeet
   - Siirtymän monimutkaisuus

---

## Ympäristökohtainen valinta

### Kehitysympäristö

**Prioriteetit**: Kustannusoptimointi, perustoiminnallisuus, helppo käyttöönotto ja poisto

#### Suositellut SKU:t
```yaml
# Development environment configuration
environment: development
skus:
  app_service: "F1"          # Free tier
  sql_database: "Basic"       # Basic tier, 5 DTU
  storage: "Standard_LRS"     # Locally redundant
  cosmos_db: "Free"          # Free tier (400 RU/s)
  key_vault: "Standard"      # Standard pricing tier
  application_insights: "Free" # First 5GB free
```

#### Ominaisuudet
- **App Service**: F1 (ilmainen) tai B1 (perus) yksinkertaiseen testaukseen
- **Tietokannat**: Perustaso, jossa minimaaliset resurssit
- **Tallennus**: Standardi, vain paikallinen redundanssi
- **Laskenta**: Jaetut resurssit hyväksyttäviä
- **Verkko**: Peruskonfiguraatiot

### Testaus-/vaiheympäristö

**Prioriteetit**: Tuotantomaiset konfiguraatiot, kustannustasapaino, suorituskykytestausmahdollisuus

#### Suositellut SKU:t
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

#### Ominaisuudet
- **Suorituskyky**: 70–80 % tuotantokapasiteetista
- **Ominaisuudet**: Suurin osa tuotanto-ominaisuuksista käytössä
- **Redundanssi**: Jonkin verran maantieteellistä redundanssia
- **Skaalaus**: Rajoitettu automaattinen skaalaus testaukseen
- **Seuranta**: Täysi seurantapino

### Tuotantoympäristö

**Prioriteetit**: Suorituskyky, saatavuus, turvallisuus, vaatimustenmukaisuus, skaalautuvuus

#### Suositellut SKU:t
```yaml
# Production environment configuration
environment: production
skus:
  app_service: "P1V3"        # Premium v3 tier
  sql_database: "P2"         # Premium tier, 250 DTU
  storage: "Premium_GRS"     # Premium geo-redundant
  cosmos_db: "Provisioned"   # Dedicated throughput
  container_apps: "Dedicated" # Dedicated environment
  key_vault: "Premium"       # Premium with HSM
```

#### Ominaisuudet
- **Korkea saatavuus**: 99,9 %+ SLA-vaatimukset
- **Suorituskyky**: Dedikoidut resurssit, korkea läpimeno
- **Turvallisuus**: Premium-turvaominaisuudet
- **Skaalaus**: Täydet automaattiset skaalausominaisuudet
- **Seuranta**: Kattava näkyvyys

---

## Palvelukohtaiset ohjeet

### Azure App Service

#### SKU-päätösmatriisi

| Käyttötapaus | Suositeltu SKU | Perustelu |
|--------------|----------------|-----------|
| Kehitys/testaus | F1 (ilmainen) tai B1 (perus) | Kustannustehokas, riittävä testaukseen |
| Pienet tuotantosovellukset | S1 (standardi) | Mukautetut verkkotunnukset, SSL, automaattinen skaalaus |
| Keskikokoiset tuotantosovellukset | P1V3 (Premium V3) | Parempi suorituskyky, enemmän ominaisuuksia |
| Suuren liikenteen sovellukset | P2V3 tai P3V3 | Dedikoidut resurssit, korkea suorituskyky |
| Kriittiset sovellukset | I1V2 (Isolated V2) | Verkkoyksityisyys, dedikoitu laitteisto |

#### Konfiguraatioesimerkit

**Kehitys**
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

**Tuotanto**
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

#### SKU-valintakehys

1. **DTU-pohjainen (Database Transaction Units)**
   - **Perus**: 5 DTU - Kehitys/testaus
   - **Standardi**: S0-S12 (10–3000 DTU) - Yleiskäyttö
   - **Premium**: P1-P15 (125–4000 DTU) - Suorituskykykriittinen

2. **vCore-pohjainen** (suositeltu tuotantoon)
   - **Yleiskäyttö**: Tasapainotettu laskenta ja tallennus
   - **Liiketoimintakriittinen**: Matala viive, korkea IOPS
   - **Hyperscale**: Erittäin skaalautuva tallennus (jopa 100TB)

#### Esimerkkikonfiguraatiot

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

#### Ympäristötyypit

1. **Kulutuspohjainen**
   - Maksu käytön mukaan
   - Sopii kehitykseen ja vaihteleviin työkuormiin
   - Jaettu infrastruktuuri

2. **Dedikoitu (työkuormaprofiilit)**
   - Dedikoidut laskentaresurssit
   - Ennustettava suorituskyky
   - Parempi tuotantotyökuormille

#### Konfiguraatioesimerkit

**Kehitys (kulutus)**
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
        targetPort: 3000
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

**Tuotanto (dedikoitu)**
```bicep
resource containerAppEnvironment 'Microsoft.App/managedEnvironments@2022-10-01' = {
  name: 'cae-${environmentName}-prod'
  location: location
  properties: {
    zoneRedundant: true
    workloadProfiles: [{
      name: 'production-profile'
      workloadProfileType: 'D4'
      minimumCount: 2
      maximumCount: 10
    }]
  }
}
```

### Azure Cosmos DB

#### Läpimenomallit

1. **Manuaalisesti varattu läpimeno**
   - Ennustettava suorituskyky
   - Varatun kapasiteetin alennukset
   - Paras tasaisille työkuormille

2. **Automaattisesti skaalautuva läpimeno**
   - Automaattinen skaalaus käytön mukaan
   - Maksu käytön mukaan (minimivaatimuksella)
   - Hyvä vaihteleville työkuormille

3. **Palveluton**
   - Maksu per pyyntö
   - Ei varattua läpimenoa
   - Sopii kehitykseen ja satunnaisiin työkuormiin

#### SKU-esimerkit

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

#### Tallennustilit

1. **Standard_LRS** - Kehitys, ei-kriittinen data
2. **Standard_GRS** - Tuotanto, maantieteellinen redundanssi tarpeen
3. **Premium_LRS** - Suorituskykyiset sovellukset
4. **Premium_ZRS** - Korkea saatavuus vyöhykeredundanssilla

#### Suorituskykytasot

- **Standardi**: Yleiskäyttö, kustannustehokas
- **Premium**: Suorituskykyiset, matalan viiveen skenaariot

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

## Kustannusoptimointistrategiat

### 1. Varattu kapasiteetti

Varaa resursseja 1–3 vuodeksi merkittäviä alennuksia varten:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Oikea mitoitus

Aloita pienemmillä SKU:illa ja skaalaa ylöspäin todellisen käytön perusteella:

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

### 3. Automaattisen skaalauksen konfigurointi

Toteuta älykäs skaalaus kustannusten optimoimiseksi:

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

### 4. Aikataulutettu skaalaus

Skaalaa alas hiljaisina aikoina:

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

## Suorituskykynäkökohdat

### Perussuorituskykyvaatimukset

Määrittele selkeät suorituskykyvaatimukset ennen SKU-valintaa:

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

### Kuormitustestaus

Testaa eri SKU:t suorituskyvyn validointia varten:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Seuranta ja optimointi

Ota käyttöön kattava seuranta:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: 'ai-${environmentName}'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    RetentionInDays: 90
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

## Pikaviittaustaulukot

### App Service SKU -pikaviittaus

| SKU | Taso | vCPU | RAM | Tallennus | Hintaluokka | Käyttötapaus |
|-----|------|------|-----|-----------|-------------|--------------|
| F1 | Ilmainen | Jaettu | 1GB | 1GB | Ilmainen | Kehitys |
| B1 | Perus | 1 | 1.75GB | 10GB | $ | Pienet sovellukset |
| S1 | Standardi | 1 | 1.75GB | 50GB | $$ | Tuotanto |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Korkea suorituskyky |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Yrityskäyttö |

### SQL Database SKU -pikaviittaus

| SKU | Taso | DTU/vCore | Tallennus | Hintaluokka | Käyttötapaus |
|-----|------|-----------|-----------|-------------|--------------|
| Perus | Perus | 5 DTU | 2GB | $ | Kehitys |
| S2 | Standardi | 50 DTU | 250GB | $$ | Pieni tuotanto |
| P2 | Premium | 250 DTU | 1TB | $$$ | Korkea suorituskyky |
| GP_Gen5_4 | Yleiskäyttö | 4 vCore | 4TB | $$$ | Tasapainotettu |
| BC_Gen5_8 | Liiketoimintakriittinen | 8 vCore | 4TB | $$$$ | Kriittinen |

### Container Apps SKU -pikaviittaus

| Malli | Hinnoittelu | CPU/Muisti | Käyttötapaus |
|-------|-------------|------------|--------------|
| Kulutus | Maksu käytön mukaan | 0.25–2 vCPU | Kehitys, vaihteleva kuorma |
| Dedikoitu D4 | Varattu | 4 vCPU, 16GB | Tuotanto |
| Dedikoitu D8 | Varattu | 8 vCPU, 32GB | Korkea suorituskyky |

---

## Validointityökalut

### SKU-saatavuuden tarkistaja

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
            az storage account check-name --name "test" --output table
            ;;
        *)
            echo "Resource type not supported"
            ;;
    esac
}

# Usage
check_sku_availability "eastus" "app-service" "P1V3"
```

### Kustannusarviolaskuri

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

### Suorituskyvyn validointi

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

## Parhaiden käytäntöjen yhteenveto

### Tee näin

1. **Aloita pienestä ja skaalaa ylöspäin** todellisen käytön perusteella
2. **Käytä eri SKU:ita eri ympäristöissä**
3. **Seuraa suorituskykyä ja kustannuksia jatkuvasti**
4. **Hyödynnä varattua kapasiteettia tuotantotyökuormille**
5. **Toteuta automaattinen skaalaus tarpeen mukaan**
6. **Testaa suorituskyky realistisilla työkuormilla**
7. **Suunnittele kasvua varten, mutta vältä ylisuunnittelua**
8. **Käytä ilmaisia tasoja kehitykseen aina kun mahdollista**

### Älä tee näin

1. **Älä käytä tuotanto-SKU:ita kehitykseen**
2. **Älä unohda alueellista SKU-saatavuutta**
3. **Älä unohda datansiirtokustannuksia**
4. **Älä ylisuunnittele ilman perusteluja**
5. **Älä jätä huomiotta riippuvuuksien vaikutusta**
6. **Älä aseta automaattisen skaalauksen rajoja liian korkealle**
7. **Älä unohda vaatimustenmukaisuusvaatimuksia**
8. **Älä tee päätöksiä pelkästään hinnan perusteella**

---

**Vinkki**: Käytä Azure Cost Managementia ja Advisoria saadaksesi henkilökohtaisia suosituksia SKU-valintojen optimointiin todellisten käyttömallien perusteella.

---

**Navigointi**
- **Edellinen osio**: [Kapasiteettisuunnittelu](capacity-planning.md)
- **Seuraava osio**: [Esitarkistukset](preflight-checks.md)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.