# SKU-valintaopas – Oikeiden Azure-palvelutasojen valinta

**Lukuvalikko:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 6 – Esiasennusvalvonta ja suunnittelu
- **⬅️ Edellinen**: [Kapsiteettisuunnittelu](capacity-planning.md)
- **➡️ Seuraava**: [Esilento-tarkastukset](preflight-checks.md)
- **🚀 Seuraava luku**: [Luku 7: Vianmääritys](../chapter-07-troubleshooting/common-issues.md)

## Johdanto

Tämä kattava opas auttaa sinua valitsemaan optimaaliset Azure-palvelun SKU:t (varastoyksiköt) eri ympäristöihin, työkuormiin ja vaatimuksiin. Opit analysoimaan suorituskykytarpeet, kustannusnäkökohdat ja skaalautuvuusvaatimukset, jotta voit valita sopivimmat palvelutasot Azure Developer CLI -käyttöönottoihin.

## Oppimistavoitteet

Opastuksen suorittamalla:
- Ymmärrät Azure SKU -käsitteet, hinnoittelumallit ja ominaisuuserot
- Hallitset ympäristökohtaiset SKU-valintastrategiat kehitykseen, testaukseen ja tuotantoon
- Analysoit työkuormavaatimukset ja sovitat ne sopiviin palvelutasoihin
- Toteutat kustannusten optimointistrategioita älykkään SKU-valinnan avulla
- Käytät suorituskykytestaus- ja validointimenetelmiä SKU-valinnoille
- Määrität automaattiset SKU-suositukset ja valvonnan

## Oppimistulokset

Opastuksen suorittamisen jälkeen osaat:
- Valita sopivat Azure-palvelun SKU:t työkuormavaatimusten ja rajoitusten perusteella
- Suunnitella kustannustehokkaita moniympäristörakenteita oikean tason valinnalla
- Toteuttaa suorituskykyvertailuja ja validaatioita SKU-valinnoille
- Luoda automaattisia työkaluja SKU-suosituksille ja kustannusten optimointiin
- Suunnitella SKU-migraatiot ja skaalausstrategiat muuttuville vaatimuksille
- Soveltaa Azure Well-Architected Framework -periaatteita palvelutasovalintaan

## Sisällysluettelo

- [SKUjen ymmärtäminen](#understanding-skus)
- [Ympäristökohtainen valinta](#environment-based-selection)
- [Palvelukohtaiset ohjeet](#service-specific-guidelines)
- [Kustannusten optimointistrategiat](#cost-optimization-strategies)
- [Suorituskykylähtökohdat](#performance-considerations)
- [Pikaviitetaulukot](#quick-reference-tables)
- [Validointityökalut](#validation-tools)

---

## SKUjen ymmärtäminen

> **Esimerkin laajuus:** Alla olevat YAML SKU-kartat ja suorituskykyasetukset ovat suunnittelumuistiinpanoja, eivät `azure.yaml` skeema tai kuormitustyökalu-konfiguraatioita. Bicep-lohkot ovat vaihtoehtoja/palasia: määrittele niiden parametrit ja emoresurssit, käytä ainutlaatuisia symbolisia nimiä yhdistettäessä ja liitä moduulit toimivaan projektiin. Hinnat, rajoitukset ja alue-/SKU-saatavuus tulee tarkistaa tilauksesi osalta ennen käyttöönottoa.

### Mitä SKU:t ovat?

SKU:t (Stock Keeping Units) edustavat eri palvelutasoja ja suorituskykytasoja Azure-resursseille. Jokainen SKU tarjoaa erilaisia:

- **Suorituskykyominaisuuksia** (CPU, muisti, läpimenokyky)
- **Ominaisuuksien saatavuutta** (skaalausvaihtoehdot, SLA-tasot)
- **Hinnoittelumalleja** (kulutukseen perustuva, varattu kapasiteetti)
- **Alueellista saatavuutta** (kaikki SKU:t eivät ole saatavilla kaikilla alueilla)

### Tärkeät tekijät SKU-valinnassa

1. **Työkuormavaatimukset**
   - Odotetut liikenne-/kuormitusmallit
   - Suorituskykyvaatimukset (CPU, muisti, I/O)
   - Tallennustarpeet ja käyttökuviot

2. **Ympäristön tyyppi**
   - Kehitys/testaus vs. tuotanto
   - Saatavuusvaatimukset
   - Tietoturva- ja vaatimustenmukaisuus

3. **Budjettirajoitukset**
   - Alkuperäiset kustannukset vs. ylläpitokulut
   - Varatun kapasiteetin alennukset
   - Itse skaalaamisen kustannusvaikutukset

4. **Kasvuarviot**
   - Skaalautuvuusvaatimukset
   - Tulevat ominaisuustarpeet
   - Migraation monimutkaisuus

---

## Ympäristökohtainen valinta

### Kehitysympäristö

**Prioriteetit**: Kustannusten optimointi, perustoiminnallisuus, helppo käyttöönotto ja poisto

#### Suositellut SKU:t
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

#### Ominaisuudet
- **App Service**: F1 (Ilmainen) tai B1 (Perus) yksinkertaiseen testaukseen
- **Tietokannat**: Perustaso vähäisillä resursseilla
- **Tallennus**: Standardi, paikallisella redundanssilla
- **Laskenta**: Jaetut resurssit hyväksyttäviä
- **Verkko**: Perusasetukset

### Testaus-/Esiasennusympäristö

**Prioriteetit**: Tuotantomainen konfiguraatio, kustannusten tasapaino, suorituskykytestausmahdollisuus

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
- **Ominaisuudet**: Useimmat tuotanto-ominaisuudet käytössä
- **Redundanssi**: Jonkin verran maantieteellistä redundanssia
- **Skaalaus**: Rajoitettu automaattinen skaalaus testaukseen
- **Valvonta**: Täydellinen valvontapino

### Tuotantoympäristö

**Prioriteetit**: Suorituskyky, saatavuus, tietoturva, vaatimustenmukaisuus, skaalautuvuus

#### Suositellut SKU:t
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

#### Ominaisuudet
- **Korkea saatavuus**: 99,9 %+ SLA-vaatimukset
- **Suorituskyky**: Omistetut resurssit, korkea läpimenokyky
- **Tietoturva**: Premium-tason tietoturvaominaisuudet
- **Skaalaus**: Täysi automaattinen skaalaus
- **Valvonta**: Kattava havaittavuus

---

## Palvelukohtaiset ohjeet

### Azure App Service

#### SKU-valintamatriisi

| Käyttötapaus | Suositeltu SKU | Perustelut |
|----------|----------------|-----------|
| Kehitys/testaus | F1 (Ilmainen) tai B1 (Perus) | Kustannustehokas, riittävä testaukseen |
| Pienet tuotantosovellukset | S1 (Standardi) | Oma domain, SSL, automaattinen skaalaus |
| Keskisuuret tuotantosovellukset | P1V3 (Premium V3) | Parempi suorituskyky, enemmän ominaisuuksia |
| Suuren liikenteen sovellukset | P2V3 tai P3V3 | Omistetut resurssit, korkea suorituskyky |
| Tärkeät sovellukset | I1V2 (Eristetty V2) | Verkkoseristys, omistettu laitteisto |

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
   - **Basic**: 5 DTU – Kehitys/testaus
   - **Standard**: S0–S12 (10–3000 DTU) – Yleiskäyttö
   - **Premium**: P1–P15 (125–4000 DTU) – Suorituskykykriittinen

2. **vCore-pohjainen** (Suositeltu tuotantoon)
   - **General Purpose**: Tasapainoinen laskenta ja tallennus
   - **Business Critical**: Matala viive, korkea IOPS
   - **Hyperscale**: Erittäin skaalautuva tallennus; tarkista nykyiset kokorajoitukset ja alueellinen tuki

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

1. **Kulutusperusteinen**
   - Käyttöpohjainen hinnoittelu
   - Soveltuu kehitykseen ja vaihteleviin työkuormiin
   - Jaettu infrastruktuuri

2. **Omistettu (Työkuormaprofiilit)**
   - Omistetut laskentaresurssit
   - Ennustettava suorituskyky
   - Soveltuu paremmin tuotantotyökuormiin

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

**Tuotanto (omistettu)**
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

Alueellinen redundanssi vaatii myös tuettujen alueiden infrastruktuuria sekä sopivat VNet-/aliverkkoasetukset, jotka on jätetty pois tästä. Tämä esimerkki varaa kolme omistettua solmua; määritä vähintään kaksi sovelluskopiota ylialuejakelua varten ja mitoita sekä kopiot että solmut aluevikaan varautumiseen. Katso [Container Apps -luotettavuusohjeet](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Sovelluksen sijoittamiseksi tälle profiilille aseta sen `workloadProfileName: 'production-profile'`; pelkkä profiilin luonti ei siirrä sovelluksia siihen.

### Azure Cosmos DB

#### Läpäisykykymallit

1. **Manuaalinen varattu läpäisykyky**
   - Ennustettava suorituskyky
   - Varatun kapasiteetin alennukset
   - Paras tasainen työkuorma

2. **Automaattisesti skaalaava läpäisykyky**
   - Käytön mukaan automaattinen skaalaus
   - Maksa käytön mukaan (vähimmäismäärällä)
   - Soveltuu vaihteleviin työkuormiin

3. **Palvelimeton**
   - Maksa pyyntöjen mukaan
   - Ei varattua läpäisykykyä
   - Ihanteellinen kehitykseen ja satunnaisiin työkuormiin

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

#### Tallennustilin tyypit

1. **Standard_LRS** – Kehitys, epä-kriittiset tiedot
2. **Standard_GRS** – Tuotanto, maantieteellinen redundanssi vaaditaan
3. **Premium_LRS** – Suorituskykyvaatimukset korkeat sovellukset
4. **Premium_ZRS** – Korkea saatavuus alueellisen redundanssin kanssa

#### Suorituskykytasot

- **Standard**: Yleiskäyttö, kustannustehokas
- **Premium**: Korkean suorituskyvyn, pienen viiveen käyttötapaukset

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

## Kustannusten optimointistrategiat

### 1. Varattu kapasiteetti

Varaa resursseja 1–3 vuodeksi merkittäviä alennuksia varten:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Varaustarjoukset ja kelpoiset resurssityypit vaihtelevat; tarkasta luettelo ja ostoehdot, älä oleta, että kaikki palvelut/SKU:t tukevat varausta.

### 2. Oikean kokoisen valinta

Aloita pienemmistä SKU:ista ja skaalaa käyttöön perustuen:

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

### 3. Automaattisen skaalaamisen konfigurointi

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

### 4. Ajoitettu skaalaus

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

## Suorituskykylähtökohdat

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

Testaa eri SKU:ja toimivuuden varmistamiseksi:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
```

### Valvonta ja optimointi

Ota käyttöön kattava valvonta:

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

## Pikaviitetaulukot

### App Service SKU -pikaviite

| SKU | Taso | vCPU | RAM | Tallennus | Hintaluokka | Käyttötapaus |
|-----|------|------|-----|----------|-------------|------------|
| F1 | Ilmainen | Jaettu | 1 GB | 1 GB | Ilmainen | Kehitys |
| B1 | Perus | 1 | 1,75 GB | 10 GB | $ | Pienet sovellukset |
| S1 | Standardi | 1 | 1,75 GB | 50 GB | $$ | Tuotanto |
| P1V3 | Premium V3 | 2 | 8 GB | 250 GB | $$$ | Korkea suorituskyky |
| I1V2 | Eristetty V2 | 2 | 8 GB | 1 TB | $$$$ | Yritys |

### SQL Database SKU -pikaviite

| SKU | Taso | DTU/vCore | Tallennus | Hintaluokka | Käyttötapaus |
|-----|------|-----------|----------|-------------|------------|
| Basic | Perus | 5 DTU | 2 GB | $ | Kehitys |
| S2 | Standardi | 50 DTU | 250 GB | $$ | Pieni tuotanto |
| P2 | Premium | 250 DTU | 1 TB | $$$ | Korkea suorituskyky |
| GP_Gen5_4 | Yleiskäyttö | 4 vCore | 4 TB | $$$ | Tasapainoinen |
| BC_Gen5_8 | Business Critical | 8 vCore | 4 TB | $$$$ | Kriittinen |

### Container Apps SKU -pikaviite

| Malli | Hinnoittelu | CPU/Muisti | Käyttötapaus |
|-------|------------|------------|------------|
| Kulutus | Käytön mukaan | Tuetut CPU/muistiyhdistelmät riippuvat ympäristö-/profiilista | Kehitys tai tuotanto, vaihteleva kuorma |
| Omistettu D4 | Omistettu solmulaskutus | 4 vCPU, 16 GiB solmua kohden | Jatkuva kuorma/eristystarpeet |
| Omistettu D8 | Omistettu solmulaskutus | 8 vCPU, 32 GiB solmua kohden | Korkeampi jatkuva kuorma |

---

## Validointityökalut

### SKU:n saatavuustarkistaja

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

### Kustannusarviointiskripti

**Vain pseudokoodi:** `Get-ResourceCost` alla on projektiin sidottu funktio, joka tulee toteuttaa ajantasaisilla alueellisilla/ sopimushinnoilla ja käyttöoletuksilla. Se ei ole PowerShell- tai Azure-komento.

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

Seuraava YAML on vaatimusmalli, **ei** Azure Load Testingin, JMeterin, Locustin tai k6:n syöttöskeema. Käännä se valitsemasi työkalun todelliseksi konfiguraatioksi ennen em. load-test-komennon käyttöä.

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

## Parhaat käytännöt – yhteenveto

### Pitäisi tehdä

1. **Aloita pienestä ja skaalauta käyttöön perustuen**
2. **Käytä erilaisia SKUja eri ympäristöissä**
3. **Valvo suorituskykyä ja kustannuksia jatkuvasti**
4. **Hyödynnä varattu kapasiteetti tuotantotyökuormissa**
5. **Ota käyttöön automaattinen skaalaus, kun sopivaa**
6. **Testaa suorituskyky realistisilla työkuormilla**
7. **Suunnittele kasvu, mutta vältä ylisuuret resurssit**
8. **Käytä ilmaisia tasoja kehityksessä mahdollisuuksien mukaan**

### Ei pitäisi tehdä

1. **Älä käytä tuotannon SKUja kehityksessä**
2. **Älä unohda alueellista SKU-saatavuutta**
3. **Älä unohda tiedonsiirtokustannuksia**
4. **Älä ylisuunnittele ilman perustelua**
5. **Älä unohda riippuvuuksien vaikutuksia**
6. **Älä aseta automaattisen skaalaamisen rajoja liian korkeiksi**
7. **Älä unohda vaatimustenmukaisuusvaatimuksia**
8. **Älä tee päätöksiä pelkän hinnan perusteella**

---

**Ammattivinkki**: Käytä Azure Cost Managementia ja Advisoria saadaksesi henkilökohtaisia suosituksia SKU-valintojen optimointiin perustuen todelliseen käyttöön.

---

**Navigointi**
- **Edellinen oppitunti**: [Kapsiteettisuunnittelu](capacity-planning.md)
- **Seuraava oppitunti**: [Esilento-tarkastukset](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->