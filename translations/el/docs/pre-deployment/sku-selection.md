# Οδηγός Επιλογής SKU - Επιλέγοντας τις Κατάλληλες Κατηγορίες Υπηρεσιών Azure

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 6 - Επικύρωση & Σχεδιασμός Πριν την Ανάπτυξη
- **⬅️ Προηγούμενο**: [Σχεδιασμός Χωρητικότητας](capacity-planning.md)
- **➡️ Επόμενο**: [Έλεγχοι Πριν την Ανάπτυξη](preflight-checks.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 7: Αντιμετώπιση Προβλημάτων](../troubleshooting/common-issues.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός σας βοηθά να επιλέξετε τα βέλτιστα SKU (Stock Keeping Units) υπηρεσιών Azure για διαφορετικά περιβάλλοντα, φόρτους εργασίας και απαιτήσεις. Μάθετε να αναλύετε τις ανάγκες απόδοσης, τις οικονομικές παραμέτρους και τις απαιτήσεις κλιμάκωσης για να επιλέξετε τις πιο κατάλληλες κατηγορίες υπηρεσιών για τις αναπτύξεις σας με το Azure Developer CLI.

## Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του οδηγού, θα:
- Κατανοήσετε τις έννοιες των SKU του Azure, τα μοντέλα τιμολόγησης και τις διαφορές χαρακτηριστικών
- Αποκτήσετε δεξιότητες επιλογής SKU ανάλογα με το περιβάλλον (ανάπτυξη, δοκιμές, παραγωγή)
- Αναλύσετε τις απαιτήσεις φόρτου εργασίας και να τις αντιστοιχίσετε στις κατάλληλες κατηγορίες υπηρεσιών
- Εφαρμόσετε στρατηγικές βελτιστοποίησης κόστους μέσω έξυπνης επιλογής SKU
- Χρησιμοποιήσετε τεχνικές δοκιμών απόδοσης και επικύρωσης για τις επιλογές SKU
- Ρυθμίσετε αυτοματοποιημένες συστάσεις και παρακολούθηση SKU

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση, θα μπορείτε να:
- Επιλέξετε κατάλληλα SKU υπηρεσιών Azure βάσει απαιτήσεων και περιορισμών φόρτου εργασίας
- Σχεδιάσετε οικονομικά αποδοτικές αρχιτεκτονικές πολλαπλών περιβαλλόντων με σωστή επιλογή κατηγοριών
- Εφαρμόσετε δοκιμές απόδοσης και επικύρωση για τις επιλογές SKU
- Δημιουργήσετε αυτοματοποιημένα εργαλεία για συστάσεις SKU και βελτιστοποίηση κόστους
- Σχεδιάσετε στρατηγικές μετεγκατάστασης και κλιμάκωσης SKU για μεταβαλλόμενες απαιτήσεις
- Εφαρμόσετε τις αρχές του Azure Well-Architected Framework στην επιλογή κατηγοριών υπηρεσιών

## Πίνακας Περιεχομένων

- [Κατανόηση των SKU](../../../../docs/pre-deployment)
- [Επιλογή Βάσει Περιβάλλοντος](../../../../docs/pre-deployment)
- [Κατευθυντήριες Γραμμές Ανά Υπηρεσία](../../../../docs/pre-deployment)
- [Στρατηγικές Βελτιστοποίησης Κόστους](../../../../docs/pre-deployment)
- [Παράγοντες Απόδοσης](../../../../docs/pre-deployment)
- [Πίνακες Γρήγορης Αναφοράς](../../../../docs/pre-deployment)
- [Εργαλεία Επικύρωσης](../../../../docs/pre-deployment)

---

## Κατανόηση των SKU

### Τι είναι τα SKU;

Τα SKU (Stock Keeping Units) αντιπροσωπεύουν διαφορετικές κατηγορίες υπηρεσιών και επίπεδα απόδοσης για πόρους του Azure. Κάθε SKU προσφέρει διαφορετικά:

- **Χαρακτηριστικά απόδοσης** (CPU, μνήμη, ρυθμός μετάδοσης)
- **Διαθεσιμότητα χαρακτηριστικών** (επιλογές κλιμάκωσης, επίπεδα SLA)
- **Μοντέλα τιμολόγησης** (βάσει κατανάλωσης, δεσμευμένη χωρητικότητα)
- **Περιφερειακή διαθεσιμότητα** (όχι όλα τα SKU είναι διαθέσιμα σε όλες τις περιοχές)

### Βασικοί Παράγοντες Επιλογής SKU

1. **Απαιτήσεις Φόρτου Εργασίας**
   - Αναμενόμενα μοτίβα κίνησης/φόρτου
   - Απαιτήσεις απόδοσης (CPU, μνήμη, I/O)
   - Ανάγκες αποθήκευσης και μοτίβα πρόσβασης

2. **Τύπος Περιβάλλοντος**
   - Ανάπτυξη/δοκιμές vs. παραγωγή
   - Απαιτήσεις διαθεσιμότητας
   - Ανάγκες ασφάλειας και συμμόρφωσης

3. **Περιορισμοί Προϋπολογισμού**
   - Αρχικό κόστος vs. λειτουργικό κόστος
   - Εκπτώσεις δεσμευμένης χωρητικότητας
   - Επιπτώσεις κόστους αυτόματης κλιμάκωσης

4. **Προβλέψεις Ανάπτυξης**
   - Απαιτήσεις κλιμάκωσης
   - Μελλοντικές ανάγκες χαρακτηριστικών
   - Πολυπλοκότητα μετεγκατάστασης

---

## Επιλογή Βάσει Περιβάλλοντος

### Περιβάλλον Ανάπτυξης

**Προτεραιότητες**: Βελτιστοποίηση κόστους, βασική λειτουργικότητα, εύκολη παροχή/αφαίρεση

#### Προτεινόμενα SKU
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

#### Χαρακτηριστικά
- **App Service**: F1 (Δωρεάν) ή B1 (Βασικό) για απλές δοκιμές
- **Βάσεις Δεδομένων**: Βασική κατηγορία με ελάχιστους πόρους
- **Αποθήκευση**: Τυπική με τοπική πλεοναστικότητα μόνο
- **Υπολογισμός**: Αποδεκτοί κοινόχρηστοι πόροι
- **Δικτύωση**: Βασικές διαμορφώσεις

### Περιβάλλον Δοκιμών/Σταδιοποίησης

**Προτεραιότητες**: Διαμόρφωση παρόμοια με παραγωγή, ισορροπία κόστους, δυνατότητα δοκιμών απόδοσης

#### Προτεινόμενα SKU
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

#### Χαρακτηριστικά
- **Απόδοση**: 70-80% της χωρητικότητας παραγωγής
- **Χαρακτηριστικά**: Ενεργοποίηση των περισσότερων χαρακτηριστικών παραγωγής
- **Πλεοναστικότητα**: Κάποια γεωγραφική πλεοναστικότητα
- **Κλιμάκωση**: Περιορισμένη αυτόματη κλιμάκωση για δοκιμές
- **Παρακολούθηση**: Πλήρης στοίβα παρακολούθησης

### Περιβάλλον Παραγωγής

**Προτεραιότητες**: Απόδοση, διαθεσιμότητα, ασφάλεια, συμμόρφωση, κλιμάκωση

#### Προτεινόμενα SKU
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

#### Χαρακτηριστικά
- **Υψηλή διαθεσιμότητα**: Απαιτήσεις SLA 99.9%+
- **Απόδοση**: Αφιερωμένοι πόροι, υψηλός ρυθμός μετάδοσης
- **Ασφάλεια**: Χαρακτηριστικά ασφάλειας premium
- **Κλιμάκωση**: Πλήρεις δυνατότητες αυτόματης κλιμάκωσης
- **Παρακολούθηση**: Ολοκληρωμένη παρατηρησιμότητα

---

## Κατευθυντήριες Γραμμές Ανά Υπηρεσία

### Azure App Service

#### Πίνακας Απόφασης SKU

| Χρήση | Προτεινόμενο SKU | Αιτιολόγηση |
|-------|------------------|-------------|
| Ανάπτυξη/Δοκιμές | F1 (Δωρεάν) ή B1 (Βασικό) | Οικονομικό, επαρκές για δοκιμές |
| Μικρές εφαρμογές παραγωγής | S1 (Standard) | Προσαρμοσμένα domains, SSL, αυτόματη κλιμάκωση |
| Μεσαίες εφαρμογές παραγωγής | P1V3 (Premium V3) | Καλύτερη απόδοση, περισσότερα χαρακτηριστικά |
| Εφαρμογές υψηλής κίνησης | P2V3 ή P3V3 | Αφιερωμένοι πόροι, υψηλή απόδοση |
| Κρίσιμες εφαρμογές | I1V2 (Isolated V2) | Απομόνωση δικτύου, αφιερωμένο υλικό |

#### Παραδείγματα Διαμόρφωσης

**Ανάπτυξη**
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

**Παραγωγή**
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

#### Πλαίσιο Επιλογής SKU

1. **Βασισμένο σε DTU (Database Transaction Units)**
   - **Βασικό**: 5 DTU - Ανάπτυξη/δοκιμές
   - **Standard**: S0-S12 (10-3000 DTU) - Γενική χρήση
   - **Premium**: P1-P15 (125-4000 DTU) - Κρίσιμη απόδοση

2. **Βασισμένο σε vCore** (Συνιστάται για παραγωγή)
   - **Γενικός Σκοπός**: Ισορροπημένη υπολογιστική ισχύς και αποθήκευση
   - **Κρίσιμη Επιχειρηματική Χρήση**: Χαμηλή καθυστέρηση, υψηλό IOPS
   - **Hyperscale**: Εξαιρετικά κλιμακούμενη αποθήκευση (έως 100TB)

#### Παραδείγματα Διαμόρφωσης

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

#### Τύποι Περιβάλλοντος

1. **Βασισμένο στην Κατανάλωση**
   - Τιμολόγηση ανά χρήση
   - Κατάλληλο για ανάπτυξη και μεταβλητούς φόρτους εργασίας
   - Κοινόχρηστη υποδομή

2. **Αφιερωμένο (Προφίλ Φόρτου Εργασίας)**
   - Αφιερωμένοι υπολογιστικοί πόροι
   - Προβλέψιμη απόδοση
   - Καλύτερο για φόρτους παραγωγής

#### Παραδείγματα Διαμόρφωσης

**Ανάπτυξη (Κατανάλωση)**
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

**Παραγωγή (Αφιερωμένο)**
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

#### Μοντέλα Ρυθμού Μετάδοσης

1. **Χειροκίνητος Ρυθμός Μετάδοσης**
   - Προβλέψιμη απόδοση
   - Εκπτώσεις δεσμευμένης χωρητικότητας
   - Καλύτερο για σταθερούς φόρτους εργασίας

2. **Αυτόματη Κλιμάκωση Ρυθμού Μετάδοσης**
   - Αυτόματη κλιμάκωση βάσει χρήσης
   - Πληρωμή για ό,τι χρησιμοποιείται (με ελάχιστο)
   - Καλό για μεταβλητούς φόρτους εργασίας

3. **Χωρίς Διακομιστή**
   - Πληρωμή ανά αίτημα
   - Χωρίς δεσμευμένο ρυθμό μετάδοσης
   - Ιδανικό για ανάπτυξη και διαλείπουσες εργασίες

#### Παραδείγματα SKU

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

#### Τύποι Λογαριασμών Αποθήκευσης

1. **Standard_LRS** - Ανάπτυξη, μη κρίσιμα δεδομένα
2. **Standard_GRS** - Παραγωγή, απαιτείται γεωγραφική πλεοναστικότητα
3. **Premium_LRS** - Εφαρμογές υψηλής απόδοσης
4. **Premium_ZRS** - Υψηλή διαθεσιμότητα με πλεοναστικότητα ζώνης

#### Επίπεδα Απόδοσης

- **Standard**: Γενικός σκοπός, οικονομικό
- **Premium**: Υψηλή απόδοση, σενάρια χαμηλής καθυστέρησης

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

## Στρατηγικές Βελτιστοποίησης Κόστους

### 1. Δεσμευμένη Χωρητικότητα

Δεσμεύστε πόρους για 1-3 χρόνια για σημαντικές εκπτώσεις:

```bash
# Check reservation options
az reservations catalog show --reserved-resource-type SqlDatabase
az reservations catalog show --reserved-resource-type CosmosDb
```

### 2. Σωστή Διάσταση

Ξεκινήστε με μικρότερα SKU και κλιμακώστε βάσει πραγματικής χρήσης:

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

### 3. Ρύθμιση Αυτόματης Κλιμάκωσης

Εφαρμόστε έξυπνη κλιμάκωση για βελτιστοποίηση κόστους:

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

### 4. Προγραμματισμένη Κλιμάκωση

Μειώστε την κλιμάκωση κατά τις ώρες μη αιχμής:

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

## Παράγοντες Απόδοσης

### Βασικές Απαιτήσεις Απόδοσης

Ορίστε σαφείς απαιτήσεις απόδοσης πριν την επιλογή SKU:

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

### Δοκιμές Φόρτου

Δοκιμάστε διαφορετικά SKU για επικύρωση απόδοσης:

```bash
# Azure Load Testing service
az load test create \
  --name "sku-performance-test" \
  --resource-group $RESOURCE_GROUP \
  --load-test-config @load-test-config.yaml
```

### Παρακολούθηση και Βελτιστοποίηση

Ρυθμίστε ολοκληρωμένη παρακολούθηση:

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

## Πίνακες Γρήγορης Αναφοράς

### Γρήγορη Αναφορά SKU App Service

| SKU | Κατηγορία | vCPU | RAM | Αποθήκευση | Εύρος Τιμής | Χρήση |
|-----|----------|------|-----|------------|-------------|-------|
| F1 | Δωρεάν | Κοινόχρηστο | 1GB | 1GB | Δωρεάν | Ανάπτυξη |
| B1 | Βασικό | 1 | 1.75GB | 10GB | $ | Μικρές εφαρμογές |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Παραγωγή |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Υψηλή απόδοση |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Επιχειρηματική χρήση |

### Γρήγορη Αναφορά SKU SQL Database

| SKU | Κατηγορία | DTU/vCore | Αποθήκευση | Εύρος Τιμής | Χρήση |
|-----|----------|-----------|------------|-------------|-------|
| Basic | Βασικό | 5 DTU | 2GB | $ | Ανάπτυξη |
| S2 | Standard | 50 DTU | 250GB | $$ | Μικρή παραγωγή |
| P2 | Premium | 250 DTU | 1TB | $$$ | Υψηλή απόδοση |
| GP_Gen5_4 | Γενικός Σκοπός | 4 vCore | 4TB | $$$ | Ισορροπημένο |
| BC_Gen5_8 | Κρίσιμη Επιχειρηματική Χρήση | 8 vCore | 4TB | $$$$ | Κρίσιμη χρήση |

### Γρήγορη Αναφορά SKU Container Apps

| Μοντέλο | Τιμολόγηση | CPU/Μνήμη | Χρήση |
|---------|-----------|-----------|-------|
| Κατανάλωση | Πληρωμή ανά χρήση | 0.25-2 vCPU | Ανάπτυξη, μεταβλητό φορτίο |
| Αφιερωμένο D4 | Δεσμευμένο | 4 vCPU, 16GB | Παραγωγή |
| Αφιερωμένο D8 | Δεσμευμένο | 8 vCPU, 32GB | Υψηλή απόδοση |

---

## Εργαλεία Επικύρωσης

### Ελεγκτής Διαθεσιμότητας SKU

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

### Σενάριο Εκτίμησης Κόστους

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

### Επικύρωση Απόδοσης

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

## Σύνοψη Βέλτιστων Πρακτικών

### Τι να Κάνετε

1. **Ξεκινήστε μικρά και κλιμακώστε** βάσει πραγματικής χρήσης
2. **Χρησιμοποιήστε διαφορετικά SKU για διαφορετικά περιβάλλοντα**
3. **Παρακολουθήστε συνεχώς την απόδοση και το κόστος**
4. **Εκμεταλλευτείτε τη δεσμευμένη χωρητικότητα για φόρτους παραγωγής**
5. **Εφαρμόστε αυτόματη κλιμάκωση όπου είναι κατάλληλο**
6. **Δοκιμάστε την απόδοση με ρεαλιστικούς φόρτους εργασίας**
7. **Σχεδιάστε για ανάπτυξη αλλά αποφύγετε την υπερβολική διάσταση**
8. **Χρησιμοποιήστε δωρεάν κατηγορίες για ανάπτυξη όπου είναι δυνατόν**

### Τι να Αποφ

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.