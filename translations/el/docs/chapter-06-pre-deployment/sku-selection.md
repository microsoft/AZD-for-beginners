# Οδηγός Επιλογής SKU - Επιλογή των κατάλληλων επιπέδων υπηρεσιών Azure

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 6 - Επαλήθευση & Σχεδιασμός Προ-Ανάπτυξης
- **⬅️ Προηγούμενο**: [Capacity Planning](capacity-planning.md)
- **➡️ Επόμενο**: [Pre-flight Checks](preflight-checks.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 7: Αντιμετώπιση Προβλημάτων](../chapter-07-troubleshooting/common-issues.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός βοηθά στην επιλογή των βέλτιστων SKU υπηρεσιών Azure (Stock Keeping Units) για διαφορετικά περιβάλλοντα, φόρτους εργασίας και απαιτήσεις. Μάθετε να αναλύετε τις ανάγκες απόδοσης, τα κόστη και τις απαιτήσεις κλιμάκωσης για να επιλέξετε τα πιο κατάλληλα επίπεδα υπηρεσιών για τις αναπτύξεις σας με το Azure Developer CLI.

## Στόχοι Μάθησης

Ολοκληρώνοντας αυτόν τον οδηγό, θα:
- Κατανοήσετε τις έννοιες SKU του Azure, τα μοντέλα τιμολόγησης και τις διαφορές χαρακτηριστικών
- Κατακτήσετε στρατηγικές επιλογής SKU ανά περιβάλλον για ανάπτυξη, δοκιμές και παραγωγή
- Αναλύσετε τις απαιτήσεις φορτίου εργασίας και τις αντιστοιχίσετε στα κατάλληλα επίπεδα υπηρεσιών
- Υλοποιήσετε στρατηγικές βελτιστοποίησης κόστους μέσω έξυπνης επιλογής SKU
- Εφαρμόσετε τεχνικές δοκιμής απόδοσης και επικύρωσης για τις επιλογές SKU
- Παραμετροποιήσετε αυτοματοποιημένες συστάσεις και παρακολούθηση SKU

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση, θα είστε ικανοί να:
- Επιλέγετε κατάλληλα SKU υπηρεσιών Azure βάσει απαιτήσεων και περιορισμών φόρτου εργασίας
- Σχεδιάζετε κοστολογικά αποδοτικές αρχιτεκτονικές πολλαπλών περιβαλλόντων με σωστή επιλογή επιπέδου
- Υλοποιείτε μετρήσεις και επικύρωση απόδοσης για επιλογές SKU
- Δημιουργείτε αυτοματοποιημένα εργαλεία για σύσταση SKU και βελτιστοποίηση κόστους
- Προγραμματίζετε μεταναστεύσεις SKU και στρατηγικές κλιμάκωσης για μεταβαλλόμενες ανάγκες
- Εφαρμόζετε τις αρχές του Azure Well-Architected Framework στην επιλογή επιπέδου υπηρεσίας

## Πίνακας Περιεχομένων

- [Κατανόηση των SKU](#understanding-skus)
- [Επιλογή με Βάση το Περιβάλλον](#environment-based-selection)
- [Κατευθυντήριες Οδηγίες ανά Υπηρεσία](#service-specific-guidelines)
- [Στρατηγικές Βελτιστοποίησης Κόστους](#cost-optimization-strategies)
- [Παράγοντες Απόδοσης](#performance-considerations)
- [Πίνακες Γρήγορης Αναφοράς](#quick-reference-tables)
- [Εργαλεία Επικύρωσης](#validation-tools)

---

## Κατανόηση των SKU

> **Παράδειγμα εύρους:** Οι παρακάτω χάρτες SKU YAML και ρυθμίσεις απόδοσης είναι σημειώσεις σχεδιασμού, όχι `azure.yaml` σχήμα ή ρύθμιση εργαλείου φόρτου. Τα μπλοκ Bicep είναι εναλλακτικές/κομμάτια: δηλώνουν τις παραμέτρους και τους γονικούς πόρους τους, χρησιμοποιούν μοναδικά συμβολικά ονόματα όταν τα συνδυάζετε και συνδέουν τα modules σε ένα λειτουργικό έργο. Πρέπει να ελέγξετε τιμές, όρια και διαθεσιμότητα περιοχής/SKU για τη συνδρομή σας πριν από την ανάπτυξη.

### Τι είναι τα SKUs;

Τα SKUs (Μονάδες Κρατήσεως Αποθέματος) αντιπροσωπεύουν διαφορετικά επίπεδα υπηρεσιών και επίπεδα απόδοσης για πόρους Azure. Κάθε SKU προσφέρει διαφορετικά:

- **Χαρακτηριστικά απόδοσης** (CPU, μνήμη, διαμετακόμιση)
- **Διαθεσιμότητα χαρακτηριστικών** (επιλογές κλιμάκωσης, επίπεδα SLA)
- **Μοντέλα τιμολόγησης** (κατανάλωση, δεσμευμένη χωρητικότητα)
- **Περιφερειακή διαθεσιμότητα** (δεν είναι όλα τα SKUs διαθέσιμα σε όλες τις περιοχές)

### Βασικοί Παράγοντες στην Επιλογή SKU

1. **Απαιτήσεις Φόρτου Εργασίας**
   - Αναμενόμενα πρότυπα κίνησης/φόρτου
   - Απαιτήσεις απόδοσης (CPU, μνήμη, I/O)
   - Ανάγκες αποθήκευσης και πρότυπα πρόσβασης

2. **Τύπος Περιβάλλοντος**
   - Ανάπτυξη/δοκιμές έναντι παραγωγής
   - Απαιτήσεις διαθεσιμότητας
   - Ανάγκες ασφαλείας και συμμόρφωσης

3. **Περιορισμοί Προϋπολογισμού**
   - Αρχικό κόστος έναντι λειτουργικού κόστους
   - Εκπτώσεις σε δεσμευμένη χωρητικότητα
   - Επιπτώσεις κόστους αυτο-κλιμάκωσης

4. **Προβλέψεις Ανάπτυξης**
   - Απαιτήσεις κλιμάκωσης
   - Μελλοντικές ανάγκες χαρακτηριστικών
   - Πολυπλοκότητα μετανάστευσης

---

## Επιλογή με Βάση το Περιβάλλον

### Περιβάλλον Ανάπτυξης

**Προτεραιότητες**: Βελτιστοποίηση κόστους, βασική λειτουργικότητα, εύκολη παροχή/απόσυρση

#### Συνιστώμενα SKU
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

#### Χαρακτηριστικά
- **App Service**: F1 (Δωρεάν) ή B1 (Βασικό) για απλή δοκιμή
- **Βάσεις Δεδομένων**: Βασικό επίπεδο με ελάχιστους πόρους
- **Αποθήκευση**: Προκαθορισμένη με μόνο τοπική πλεονασματικότητα
- **Υπολογισμός**: Επιτρεπτοί κοινοί πόροι
- **Δικτύωση**: Βασικές ρυθμίσεις

### Περιβάλλον Στάδιο/Δοκιμών

**Προτεραιότητες**: Ρύθμιση με βάση την παραγωγή, ισορροπία κόστους, δυνατότητα δοκιμής απόδοσης

#### Συνιστώμενα SKU
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
- **Χαρακτηριστικά**: Τα περισσότερα χαρακτηριστικά παραγωγής ενεργοποιημένα
- **Πλεονασματικότητα**: Μερική γεωγραφική πλεονασματικότητα
- **Κλιμάκωση**: Περιορισμένη αυτο-κλιμάκωση για δοκιμές
- **Παρακολούθηση**: Πλήρες στοίβα παρακολούθησης

### Περιβάλλον Παραγωγής

**Προτεραιότητες**: Απόδοση, διαθεσιμότητα, ασφάλεια, συμμόρφωση, κλιμακωσιμότητα

#### Συνιστώμενα SKU
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

#### Χαρακτηριστικά
- **Υψηλή διαθεσιμότητα**: Απαιτήσεις SLA 99.9%+
- **Απόδοση**: Αφιερωμένοι πόροι, υψηλή διαμετακόμιση
- **Ασφάλεια**: Χαρακτηριστικά premium ασφάλειας
- **Κλιμάκωση**: Πλήρεις δυνατότητες αυτο-κλιμάκωσης
- **Παρακολούθηση**: Ολοκληρωμένη παρατηρησιμότητα

---

## Κατευθυντήριες Οδηγίες ανά Υπηρεσία

### Azure App Service

#### Πίνακας Αποφάσεων SKU

| Περίπτωση Χρήσης | Συνιστώμενο SKU | Αιτιολόγηση |
|----------|----------------|-----------|
| Ανάπτυξη/Δοκιμές | F1 (Δωρεάν) ή B1 (Βασικό) | Οικονομικό, επαρκές για δοκιμές |
| Μικρές εφαρμογές παραγωγής | S1 (Standard) | Προσαρμοσμένοι τομείς, SSL, αυτο-κλιμάκωση |
| Μεσαίες εφαρμογές παραγωγής | P1V3 (Premium V3) | Καλύτερη απόδοση, περισσότερα χαρακτηριστικά |
| Εφαρμογές υψηλής κυκλοφορίας | P2V3 ή P3V3 | Αφιερωμένοι πόροι, υψηλή απόδοση |
| Εφαρμογές κρίσιμης σημασίας | I1V2 (Isolated V2) | Απομόνωση δικτύου, αφιερωμένος εξοπλισμός |

#### Παραδείγματα Ρυθμίσεων

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

1. **Βάσει DTU (Μονάδες Συναλλαγής Βάσης Δεδομένων)**
   - **Basic**: 5 DTU - Ανάπτυξη/δοκιμές
   - **Standard**: S0-S12 (10-3000 DTU) - Γενικού σκοπού
   - **Premium**: P1-P15 (125-4000 DTU) - Απόδοση κρίσιμης σημασίας

2. **Βάσει vCore** (Συνιστάται για παραγωγή)
   - **General Purpose**: Ισορροπημένος υπολογισμός και αποθήκευση
   - **Business Critical**: Χαμηλή καθυστέρηση, υψηλή IOPS
   - **Hyperscale**: Πολύ κλιμακούμενη αποθήκευση· επιβεβαιώστε τα τρέχοντα όρια μεγέθους και υποστήριξη περιοχής

#### Παραδείγματα Ρυθμίσεων

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

1. **Βάσει Κατανάλωσης**
   - Τιμολόγηση ανά χρήση
   - Κατάλληλο για ανάπτυξη και μεταβλητούς φόρτους εργασίας
   - Κοινόχρηστη υποδομή

2. **Αφιερωμένο (Προφίλ Φόρτου Εργασίας)**
   - Αφιερωμένοι υπολογιστικοί πόροι
   - Προβλέψιμη απόδοση
   - Κατάλληλο για φόρτους παραγωγής

#### Παραδείγματα Ρυθμίσεων

**Ανάπτυξη (Βάσει Κατανάλωσης)**
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

**Παραγωγή (Αφιερωμένο)**
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

Η πλεονασματικότητα ζώνης απαιτεί επίσης υποδομή υποστηριζόμενης περιοχής και κατάλληλη διαμόρφωση VNet/υποδικτύου, που παραλείπεται εδώ. Αυτό το παράδειγμα κατανέμει τρεις αφιερωμένους κόμβους· ρυθμίστε τουλάχιστον δύο αντίγραφα εφαρμογής για διανομή διαζωνική και μεγεθύνετε τόσο τα αντίγραφα όσο και τους κόμβους για αποτυχία ζώνης. Δείτε [Οδηγίες αξιοπιστίας Container Apps](https://learn.microsoft.com/azure/reliability/reliability-azure-container-apps). Για να τοποθετήσετε μια εφαρμογή σε αυτό το προφίλ, ρυθμίστε το `workloadProfileName: 'production-profile'` της· το να δημιουργήσετε μόνο το προφίλ δεν μετακινεί τις εφαρμογές εκεί.

### Azure Cosmos DB

#### Μοντέλα Διαμετακόμισης

1. **Με Μηχανική Ρύθμιση Διαμετακόμισης**
   - Προβλέψιμη απόδοση
   - Εκπτώσεις δεσμευμένης χωρητικότητας
   - Καλύτερο για σταθερούς φόρτους

2. **Με Αυτόματη Κλιμάκωση Διαμετακόμισης**
   - Αυτόματη κλιμάκωση βάσει χρήσης
   - Πληρώνετε για αυτό που χρησιμοποιείτε (με ελάχιστο)
   - Καλή επιλογή για μεταβλητούς φόρτους

3. **Serverless**
   - Πληρωμή ανά αίτηση
   - Χωρίς εκ των προτέρων διαμετακόμιση
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
2. **Standard_GRS** - Παραγωγή, απαιτείται γεωπλεονασματικότητα
3. **Premium_LRS** - Εφαρμογές υψηλής απόδοσης
4. **Premium_ZRS** - Υψηλή διαθεσιμότητα με πλεονασματικότητα ζώνης

#### Επίπεδα Απόδοσης

- **Standard**: Γενικού σκοπού, οικονομικό
- **Premium**: Υψηλής απόδοσης, χαμηλής λανθάνουσας κατάστασης σενάρια

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

Κρατήστε πόρους για 1-3 χρόνια για σημαντικές εκπτώσεις:

```bash
# With the reservation extension available, inspect the subscription catalog
az reservations catalog show \
  --subscription-id "$AZURE_SUBSCRIPTION_ID" \
  --reserved-resource-type SqlDatabases
```

Οι προσφορές κράτησης και οι επιλέξιμοι τύποι πόρων διαφέρουν· ελέγξτε τον κατάλογο και τους όρους αγοράς αντί να υποθέτετε ότι κάθε υπηρεσία/SKU υποστηρίζει κράτηση.

### 2. Σωστό Μέγεθος

Ξεκινήστε με μικρότερα SKUs και αυξήστε τη κλίμακα βάσει πραγματικής χρήσης:

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

### 3. Ρυθμίσεις Αυτόματης Κλιμάκωσης

Υλοποιήστε έξυπνη κλιμάκωση για βελτιστοποίηση κόστους:

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

### 4. Προγραμματισμένη Κλιμάκωση

Κλιμακώστε χαμηλότερα κατά τις ώρες μη αιχμής:

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

### Δοκιμή Φόρτου

Δοκιμάστε διάφορα SKUs για επικύρωση απόδοσης:

```bash
# Azure Load Testing service (requires an existing load-testing resource,
# the load extension, and a valid config plus referenced test script)
az load test create \
  --load-test-resource "$LOAD_TEST_RESOURCE" \
  --resource-group "$RESOURCE_GROUP" \
  --test-id "sku-performance-test" \
  --load-test-config-file load-test-config.yaml
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

## Πίνακες Γρήγορης Αναφοράς

### Γρήγορη Αναφορά SKU App Service

| SKU | Επίπεδο | vCPU | RAM | Αποθήκευση | Εύρος Τιμών | Περίπτωση Χρήσης |
|-----|--------|------|-----|------------|-------------|------------------|
| F1 | Δωρεάν | Κοινόχρηστο | 1GB | 1GB | Δωρεάν | Ανάπτυξη |
| B1 | Βασικό | 1 | 1.75GB | 10GB | $ | Μικρές εφαρμογές |
| S1 | Standard | 1 | 1.75GB | 50GB | $$ | Παραγωγή |
| P1V3 | Premium V3 | 2 | 8GB | 250GB | $$$ | Υψηλή απόδοση |
| I1V2 | Isolated V2 | 2 | 8GB | 1TB | $$$$ | Επιχειρήσεις |

### Γρήγορη Αναφορά SKU Βάσης SQL

| SKU | Επίπεδο | DTU/vCore | Αποθήκευση | Εύρος Τιμών | Περίπτωση Χρήσης |
|-----|--------|-----------|------------|-------------|------------------|
| Basic | Βασικό | 5 DTU | 2GB | $ | Ανάπτυξη |
| S2 | Standard | 50 DTU | 250GB | $$ | Μικρή παραγωγή |
| P2 | Premium | 250 DTU | 1TB | $$$ | Υψηλή απόδοση |
| GP_Gen5_4 | Γενικού Σκοπού | 4 vCore | 4TB | $$$ | Ισορροπημένο |
| BC_Gen5_8 | Επιχειρησιακής Σημασίας | 8 vCore | 4TB | $$$$ | Κρίσιμη αποστολή |

### Γρήγορη Αναφορά SKU Container Apps

| Μοντέλο | Τιμολόγηση | CPU/Μνήμη | Περίπτωση Χρήσης |
|---------|-------------|------------|------------------|
| Κατανάλωση | Πληρωμή ανά χρήση | Τα υποστηριζόμενα combinations CPU/μνήμης εξαρτώνται από το περιβάλλον/προφίλ | Ανάπτυξη ή παραγωγή, μεταβλητός φόρτος |
| Αφιερωμένο D4 | Χρέωση αφιερωμένου κόμβου | 4 vCPU, 16GiB ανά κόμβο | Αντοχή φόρτου/απομόνωση |
| Αφιερωμένο D8 | Χρέωση αφιερωμένου κόμβου | 8 vCPU, 32GiB ανά κόμβο | Υψηλότερος αντοχή φόρτου |

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

### Σενάριο Εκτίμησης Κόστους

**Μόνο ψευδοκώδικας:** `Get-ResourceCost` παρακάτω είναι μια συνάρτηση ειδική για το έργο που πρέπει να υλοποιήσετε με βάση το τρέχον τιμολόγιο περιοχής/συμβολαίου και τις υποθέσεις χρήσης. Δεν είναι PowerShell ή Azure cmdlet.

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

Το ακόλουθο YAML είναι σκίτσο απαιτήσεων, **όχι** σχήμα εισόδου Azure Load Testing, JMeter, Locust ή k6. Μεταφράστε το σε πραγματική ρύθμιση του εργαλείου που επιλέξατε πριν χρησιμοποιήσετε την εντολή load-test παραπάνω.

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

## Περίληψη Καλύτερων Πρακτικών

### Πρέπει να

1. **Ξεκινήστε μικρά και αυξήστε** βάσει πραγματικής χρήσης
2. **Χρησιμοποιήστε διαφορετικά SKUs για διαφορετικά περιβάλλοντα**
3. **Παρακολουθείτε διαρκώς απόδοση και κόστη**
4. **Εκμεταλλευτείτε τη δεσμευμένη χωρητικότητα για φόρτους παραγωγής**
5. **Εφαρμόστε αυτο-κλιμάκωση όπου ενδείκνυται**
6. **Δοκιμάστε την απόδοση με ρεαλιστικούς φόρτους εργασίας**
7. **Σχεδιάστε για ανάπτυξη αλλά αποφύγετε υπερπρομήθεια**
8. **Χρησιμοποιείστε δωρεάν επίπεδα για ανάπτυξη όπου είναι δυνατόν**

### Μην

1. **Μην χρησιμοποιείτε SKU παραγωγής για ανάπτυξη**
2. **Μην αγνοείτε τη διαθεσιμότητα SKU κατά περιοχή**
3. **Μην ξεχνάτε το κόστος μεταφοράς δεδομένων**
4. **Μην κάνετε υπερπρομήθεια χωρίς αιτιολόγηση**
5. **Μην αγνοείτε τον αντίκτυπο των εξαρτήσεων**
6. **Μην ορίζετε όρια αυτο-κλιμάκωσης πολύ υψηλά**
7. **Μην ξεχνάτε τις απαιτήσεις συμμόρφωσης**
8. **Μην παίρνετε αποφάσεις μόνο με βάση την τιμή**

---

**Επαγγελματική Συμβουλή**: Χρησιμοποιήστε το Azure Cost Management και Advisor για να πάρετε εξατομικευμένες συστάσεις βελτιστοποίησης επιλογών SKU βάσει των πραγματικών προτύπων χρήσης.

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Capacity Planning](capacity-planning.md)
- **Επόμενο Μάθημα**: [Preflight Checks](preflight-checks.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->