# Microservices Architecture - Container App Example

⏱️ **Estimated Time**: 25-35 minutes | 💰 **Estimated Cost**: ~$50-100/month | ⭐ **Complexity**: Advanced

Μια **απλοποιημένη αλλά λειτουργική** αρχιτεκτονική μικροϋπηρεσιών αναπτυγμένη σε Azure Container Apps χρησιμοποιώντας το AZD CLI. Αυτό το παράδειγμα επιδεικνύει επικοινωνία υπηρεσίας προς υπηρεσία, ορχήστρωση κοντέινερ και παρακολούθηση με μια πρακτική διάταξη 2 υπηρεσιών.

> **📚 Μαθησιακή Προσέγγιση**: Αυτό το παράδειγμα ξεκινά με μια ελάχιστη αρχιτεκτονική 2 υπηρεσιών (API Gateway + Backend Service) την οποία μπορείτε πραγματικά να αναπτύξετε και να μάθετε. Αφού κατανοήσετε αυτά τα θεμέλια, παρέχουμε οδηγίες για επέκταση σε ένα πλήρες οικοσύστημα μικροϋπηρεσιών.

## What You'll Learn

Με την ολοκλήρωση αυτού του παραδείγματος, θα:
- Αναπτύξετε πολλαπλά κοντέινερ σε Azure Container Apps
- Υλοποιήσετε επικοινωνία υπηρεσίας-προς-υπηρεσία με εσωτερικό δίκτυο
- Διαμορφώσετε κλιμάκωση βάσει περιβάλλοντος και έλεγχους υγείας
- Παρακολουθήσετε κατανεμημένες εφαρμογές με το Application Insights
- Κατανοήσετε πρότυπα ανάπτυξης μικροϋπηρεσιών και βέλτιστες πρακτικές
- Μάθετε προοδευτική επέκταση από απλές σε σύνθετες αρχιτεκτονικές

## Architecture

### Phase 1: What We're Building (Included in This Example)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Why Start Simple?**
- ✅ Γρήγορη ανάπτυξη και κατανόηση (25-35 λεπτά)
- ✅ Μάθετε βασικά πρότυπα μικροϋπηρεσιών χωρίς πολυπλοκότητα
- ✅ Λειτουργικός κώδικας που μπορείτε να τροποποιήσετε και να πειραματιστείτε
- ✅ Χαμηλότερο κόστος για μάθηση (~$50-100/μήνα έναντι $300-1400/μήνα)
- ✅ Απόκτηση αυτοπεποίθησης πριν προσθέσετε βάσεις δεδομένων και ουρές μηνυμάτων

**Αναλογία**: Σκεφτείτε το σαν να μαθαίνετε να οδηγείτε. Ξεκινάτε με ένα άδειο χώρο στάθμευσης (2 υπηρεσίες), κατακτάτε τα βασικά, και μετά προχωράτε στην κίνηση της πόλης (5+ υπηρεσίες με βάσεις δεδομένων).

### Phase 2: Future Expansion (Reference Architecture)

Μόλις κατανοήσετε την αρχιτεκτονική 2 υπηρεσιών, μπορείτε να επεκταθείτε σε:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Δείτε την ενότητα "Expansion Guide" στο τέλος για βήμα-προς-βήμα οδηγίες.

## Features Included

✅ **Service Discovery**: Αυτόματη ανακάλυψη με βάση το DNS μεταξύ κοντέινερ  
✅ **Load Balancing**: Ενσωματωμένο load balancing μεταξύ αντιγράφων  
✅ **Auto-scaling**: Ανεξάρτητη κλιμάκωση ανά υπηρεσία με βάση αιτήματα HTTP  
✅ **Health Monitoring**: Liveness και readiness probes για όλες τις υπηρεσίες  
✅ **Distributed Logging**: Κεντρική καταγραφή με Application Insights  
✅ **Internal Networking**: Ασφαλής επικοινωνία υπηρεσίας-προς-υπηρεσία  
✅ **Container Orchestration**: Αυτόματη ανάπτυξη και κλιμάκωση  
✅ **Zero-Downtime Updates**: Rolling updates με διαχείριση εκδόσεων  

## Prerequisites

### Required Tools

Πριν ξεκινήσετε, επιβεβαιώστε ότι έχετε εγκαταστήσει αυτά τα εργαλεία:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (έκδοση 1.0.0 ή νεότερη)
   ```bash
   azd version
   # Αναμενόμενη έξοδος: azd έκδοση 1.0.0 ή νεότερη
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (έκδοση 2.50.0 ή νεότερη)
   ```bash
   az --version
   # Αναμενόμενη έξοδος: azure-cli 2.50.0 ή νεότερη
   ```

3. **[Docker](https://www.docker.com/get-started)** (για τοπική ανάπτυξη/δοκιμές - προαιρετικό)
   ```bash
   docker --version
   # Αναμενόμενο αποτέλεσμα: Έκδοση Docker 20.10 ή νεότερη
   ```

### Azure Requirements

- Ένας ενεργός **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- Δικαιώματα για δημιουργία πόρων στο subscription σας
- Ρόλος **Contributor** στο subscription ή στο resource group

### Knowledge Prerequisites

Αυτό είναι ένα παράδειγμα **προχωρημένου επιπέδου**. Θα πρέπει να έχετε:
- Ολοκληρώσει το [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) 
- Βασική κατανόηση της αρχιτεκτονικής μικροϋπηρεσιών
- Εξοικείωση με REST APIs και HTTP
- Κατανόηση εννοιών container

**Νέος/α στα Container Apps;** Ξεκινήστε πρώτα με το [Simple Flask API example](../../../../../examples/container-app/simple-flask-api) για να μάθετε τα βασικά.

## Quick Start (Step-by-Step)

### Step 1: Clone and Navigate

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Success Check**: Επιβεβαιώστε ότι βλέπετε `azure.yaml`:
```bash
ls
# Αναμενόμενα: README.md, azure.yaml, infra/, src/
```

### Step 2: Authenticate with Azure

```bash
azd auth login
```

Αυτό θα ανοίξει το πρόγραμμα περιήγησης για αυθεντικοποίηση στο Azure. Συνδεθείτε με τα διαπιστευτήρια Azure.

**✓ Success Check**: Θα πρέπει να δείτε:
```
Logged in to Azure.
```

### Step 3: Initialize the Environment

```bash
azd init
```

**Προτροπές που θα δείτε**:
- **Environment name**: Εισάγετε ένα σύντομο όνομα (π.χ., `microservices-dev`)
- **Azure subscription**: Επιλέξτε το subscription σας
- **Azure location**: Επιλέξτε μια περιοχή (π.χ., `eastus`, `westeurope`)

**✓ Success Check**: Θα πρέπει να δείτε:
```
SUCCESS: New project initialized!
```

### Step 4: Deploy Infrastructure and Services

```bash
azd up
```

**Τι συμβαίνει** (διαρκεί 8-12 λεπτά):
1. Δημιουργεί το Container Apps environment
2. Δημιουργεί το Application Insights για παρακολούθηση
3. Κατασκευάζει το κοντέινερ του API Gateway (Node.js)
4. Κατασκευάζει το κοντέινερ της Product Service (Python)
5. Αναπτύσσει και τα δύο κοντέινερ σε Azure
6. Διαμορφώνει δικτύωση και ελέγχους υγείας
7. Οργανώνει παρακολούθηση και καταγραφή

**✓ Success Check**: Θα πρέπει να δείτε:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Time**: 8-12 minutes

### Step 5: Test the Deployment

```bash
# Λάβετε το endpoint της πύλης API
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Ελέγξτε την υγεία της πύλης API
curl $GATEWAY_URL/health

# Αναμενόμενη έξοδος:
# {"κατάσταση":"υγιής","υπηρεσία":"api-gateway","χρονοσήμανση":"2025-11-19T10:30:00Z"}
```

**Δοκιμάστε την υπηρεσία προϊόντων μέσω του gateway**:
```bash
# Λίστα προϊόντων
curl $GATEWAY_URL/api/products

# Αναμενόμενη έξοδος:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ Success Check**: Και τα δύο endpoints επιστρέφουν δεδομένα JSON χωρίς σφάλματα.

---

**🎉 Συγχαρητήρια!** Έχετε αναπτύξει μια αρχιτεκτονική μικροϋπηρεσιών στο Azure!

## Project Structure

Όλα τα αρχεία υλοποίησης περιλαμβάνονται—αυτό είναι ένα πλήρες, λειτουργικό παράδειγμα:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Τι κάνει κάθε συνιστώσα:**

**Infrastructure (infra/)**:
- `main.bicep`: Ορχηστρώνει όλους τους πόρους Azure και τις εξαρτήσεις τους
- `core/container-apps-environment.bicep`: Δημιουργεί το Container Apps environment και το Azure Container Registry
- `core/monitor.bicep`: Ρυθμίζει το Application Insights για κατανεμημένη καταγραφή
- `app/*.bicep`: Ορισμοί μεμονωμένων container app με κλιμάκωση και έλεγχους υγείας

**API Gateway (src/api-gateway/)**:
- Δημόσια υπηρεσία που δρομολογεί αιτήματα προς backend υπηρεσίες
- Υλοποιεί καταγραφή, χειρισμό σφαλμάτων και προώθηση αιτημάτων
- Επιδεικνύει HTTP επικοινωνία υπηρεσίας προς υπηρεσία

**Product Service (src/product-service/)**:
- Εσωτερική υπηρεσία με κατάλογο προϊόντων (in-memory για απλότητα)
- REST API με health checks
- Παράδειγμα προτύπου backend microservice

## Services Overview

### API Gateway (Node.js/Express)

**Port**: 8080  
**Access**: Public (external ingress)  
**Purpose**: Δρομολογεί εισερχόμενα αιτήματα προς τις κατάλληλες backend υπηρεσίες  

**Endpoints**:
- `GET /` - Πληροφορίες υπηρεσίας
- `GET /health` - Endpoint ελέγχου υγείας
- `GET /api/products` - Προώθηση προς την υπηρεσία προϊόντων (λίστα)
- `GET /api/products/:id` - Προώθηση προς την υπηρεσία προϊόντων (ανά id)

**Key Features**:
- Δρομολόγηση αιτημάτων με axios
- Κεντρική καταγραφή
- Χειρισμός σφαλμάτων και διαχείριση timeout
- Ανακάλυψη υπηρεσιών μέσω μεταβλητών περιβάλλοντος
- Ενσωμάτωση με Application Insights

**Code Highlight** (`src/api-gateway/app.js`):
```javascript
// Εσωτερική επικοινωνία υπηρεσιών
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Access**: Internal only (no external ingress)  
**Purpose**: Διαχειρίζεται τον κατάλογο προϊόντων με δεδομένα in-memory  

**Endpoints**:
- `GET /` - Πληροφορίες υπηρεσίας
- `GET /health` - Endpoint ελέγχου υγείας
- `GET /products` - Λίστα με όλα τα προϊόντα
- `GET /products/<id>` - Λήψη προϊόντος κατά ID

**Key Features**:
- RESTful API με Flask
- Αποθήκη προϊόντων in-memory (απλή, χωρίς ανάγκη βάσης δεδομένων)
- Παρακολούθηση υγείας με probes
- Δομημένη καταγραφή
- Ενσωμάτωση με Application Insights

**Data Model**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Γιατί Internal Only;**
Η υπηρεσία προϊόντων δεν είναι εκτεθειμένη δημόσια. Όλα τα αιτήματα πρέπει να περάσουν από το API Gateway, που παρέχει:
- Ασφάλεια: Ελεγχόμενη σημείο εισόδου
- Ευελιξία: Μπορεί να αλλάξει το backend χωρίς να επηρεαστούν οι πελάτες
- Παρακολούθηση: Κεντρική καταγραφή αιτημάτων

## Understanding Service Communication

### How Services Talk to Each Other

Σε αυτό το παράδειγμα, το API Gateway επικοινωνεί με την Product Service χρησιμοποιώντας **εσωτερικές κλήσεις HTTP**:

```javascript
// Πύλη API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Κάντε εσωτερικό αίτημα HTTP
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Κύρια Σημεία**:

1. **DNS-Based Discovery**: Τα Container Apps παρέχουν αυτόματα DNS για εσωτερικές υπηρεσίες
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Απλοποιημένο ως: `http://product-service` (τα Container Apps το επιλύουν)

2. **Καμία Δημόσια Έκθεση**: Η Product Service έχει `external: false` στο Bicep
   - Προσβάσιμη μόνο εντός του Container Apps environment
   - Δεν μπορεί να προσεγγιστεί από το διαδίκτυο

3. **Μεταβλητές Περιβάλλοντος**: Τα URLs υπηρεσιών εγχύονται κατά τον χρόνο ανάπτυξης
   - Το Bicep περνά το εσωτερικό FQDN στο gateway
   - Χωρίς hardcoded URLs στον κώδικα εφαρμογής

**Αναλογία**: Σκεφτείτε το σαν γραφεία σε ένα κτήριο. Το API Gateway είναι η ρεσεψιόν (δημόσιο σημείο) και η Product Service είναι ένα γραφείο (εσωτερικό). Οι επισκέπτες πρέπει να περάσουν από τη ρεσεψιόν για να φτάσουν σε οποιοδήποτε γραφείο.

## Deployment Options

### Full Deployment (Recommended)

```bash
# Αναπτύξτε την υποδομή και τις δύο υπηρεσίες
azd up
```

Αυτό αναπτύσσει:
1. Container Apps environment
2. Application Insights
3. Container Registry
4. API Gateway container
5. Product Service container

**Time**: 8-12 minutes

### Deploy Individual Service

```bash
# Αναπτύξτε μόνο μία υπηρεσία (μετά την αρχική azd up)
azd deploy api-gateway

# Ή αναπτύξτε την υπηρεσία προϊόντος
azd deploy product-service
```

**Σενάριο Χρήσης**: Όταν έχετε ενημερώσει κώδικα σε μία υπηρεσία και θέλετε να αναπτύξετε μόνο αυτή.

### Update Configuration

```bash
# Αλλάξτε τις παραμέτρους κλιμάκωσης
azd env set GATEWAY_MAX_REPLICAS 30

# Επαναπτύξτε με τη νέα διαμόρφωση
azd up
```

## Configuration

### Scaling Configuration

Και οι δύο υπηρεσίες είναι διαμορφωμένες με αυτόματη κλιμάκωση βάσει HTTP στα Bicep αρχεία τους:

**API Gateway**:
- Ελάχιστα αντίγραφα: 2 (πάντα τουλάχιστον 2 για διαθεσιμότητα)
- Μέγιστα αντίγραφα: 20
- Κριτήριο κλιμάκωσης: 50 concurrent requests ανά αντίγραφο

**Product Service**:
- Ελάχιστα αντίγραφα: 1 (μπορεί να κλιμακώσει σε μηδέν αν χρειαστεί)
- Μέγιστα αντίγραφα: 10
- Κριτήριο κλιμάκωσης: 100 concurrent requests ανά αντίγραφο

**Προσαρμογή Κλιμάκωσης** (στο `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Resource Allocation

**API Gateway**:
- CPU: 1.0 vCPU
- Μνήμη: 2 GiB
- Λόγος: Αντιμετωπίζει όλη την εξωτερική κίνηση

**Product Service**:
- CPU: 0.5 vCPU
- Μνήμη: 1 GiB
- Λόγος: Ελαφριές in-memory λειτουργίες

### Health Checks

Και οι δύο υπηρεσίες περιλαμβάνουν liveness και readiness probes:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Τι Σημαίνει Αυτό**:
- **Liveness**: Αν αποτύχει ο έλεγχος υγείας, τα Container Apps επανεκκινούν το κοντέινερ
- **Readiness**: Αν δεν είναι έτοιμο, τα Container Apps σταματούν να δρομολογούν κίνηση σε εκείνο το αντίγραφο



## Monitoring & Observability

### View Service Logs

```bash
# Προβολή καταγραφών χρησιμοποιώντας το azd monitor
azd monitor --logs

# Ή χρησιμοποιήστε το Azure CLI για συγκεκριμένες Container Apps:
# Ροή καταγραφών από το API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Προβολή πρόσφατων καταγραφών υπηρεσίας προϊόντος
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Αναμενόμενη Έξοδος**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights Queries

Πρόσβαση στο Application Insights στο Azure Portal, και στη συνέχεια εκτελέστε αυτά τα ερωτήματα:

**Εύρεση Αργών Αιτημάτων**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Παρακολούθηση Κλήσεων Υπηρεσίας-προς-Υπηρεσία**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Ποσοστό Σφαλμάτων ανά Υπηρεσία**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Όγκος Αιτημάτων με την Πάροδο του Χρόνου**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Access Monitoring Dashboard

```bash
# Λήψη λεπτομερειών του Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Άνοιγμα παρακολούθησης στο Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Live Metrics

1. Μεταβείτε στο Application Insights στο Azure Portal
2. Κάντε κλικ στο "Live Metrics"
3. Δείτε σε πραγματικό χρόνο αιτήματα, αποτυχίες και απόδοση
4. Δοκιμάστε τρέχοντας: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Practical Exercises

[Note: See full exercises above in the "Practical Exercises" section for detailed step-by-step exercises including deployment verification, data modification, autoscaling tests, error handling, and adding a third service.]

## Cost Analysis

### Estimated Monthly Costs (For This 2-Service Example)

| Resource | Configuration | Estimated Cost |
|----------|--------------|----------------|
| API Gateway | 2-20 replicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/month | $5-10 |
| Log Analytics | 1 GB/month | $3 |
| **Total** | | **$58-243/month** |

**Διάσπαση Κόστους ανά Χρήση**:
- **Ελαφριά κίνηση** (testing/learning): ~$60/μήνα
- **Μέτρια κίνηση** (μικρή παραγωγή): ~$120/μήνα
- **Υψηλή κίνηση** (φορτωμένες περιόδους): ~$240/μήνα

### Cost Optimization Tips

1. **Scale to Zero for Development**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Use Consumption Plan for Cosmos DB** (when you add it):
   - Πληρώστε μόνο για ό,τι χρησιμοποιείτε
   - Χωρίς ελάχιστη χρέωση

3. **Set Application Insights Sampling**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Δειγματοληψία του 50% των αιτημάτων
   ```

4. **Clean Up When Not Needed**:
   ```bash
   azd down
   ```

### Free Tier Options
Για εκμάθηση/δοκιμές, σκεφτείτε:
- Χρησιμοποιήστε δωρεάν πιστώσεις Azure (τις πρώτες 30 ημέρες)
- Διατηρήστε τα αντίγραφα στο ελάχιστο
- Διαγράψτε μετά τις δοκιμές (χωρίς συνεχιζόμενα έξοδα)

---

## Καθαρισμός

Για να αποφύγετε συνεχιζόμενα έξοδα, διαγράψτε όλους τους πόρους:

```bash
azd down --force --purge
```

**Προτροπή Επιβεβαίωσης**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Πληκτρολογήστε `y` για επιβεβαίωση.

**Τι Διαγράφεται**:
- Container Apps Environment
- Και τα δύο Container Apps (gateway & product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Επαλήθευση Καθαρισμού**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Πρέπει να επιστρέψει κενό.

---

## Οδηγός Επέκτασης: Από 2 σε 5+ Υπηρεσίες

Μόλις κατακτήσετε αυτήν την αρχιτεκτονική με 2 υπηρεσίες, ιδού πώς να επεκταθείτε:

### Φάση 1: Προσθήκη Επίμονης Βάσης Δεδομένων (Επόμενο Βήμα)

**Προσθήκη Cosmos DB για την Υπηρεσία Προϊόντος**:

1. Create `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Ενημερώστε την υπηρεσία προϊόντος ώστε να χρησιμοποιεί Cosmos DB αντί για δεδομένα στη μνήμη

3. Εκτιμώμενο πρόσθετο κόστος: ~$25/μήνα (χωρίς διακομιστή)

### Φάση 2: Προσθήκη Τρίτης Υπηρεσίας (Διαχείριση Παραγγελιών)

**Δημιουργία Υπηρεσίας Παραγγελιών**:

1. Νέος φάκελος: `src/order-service/` (Python/Node.js/C#)
2. Νέο Bicep: `infra/app/order-service.bicep`
3. Ενημερώστε το API Gateway για να δρομολογεί στο `/api/orders`
4. Προσθέστε Azure SQL Database για την αποθήκευση παραγγελιών

**Η αρχιτεκτονική γίνεται**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Φάση 3: Προσθήκη Ασύγχρονης Επικοινωνίας (Service Bus)

**Εφαρμογή Αρχιτεκτονικής βάσει Γεγονότων**:

1. Προσθέστε Azure Service Bus: `infra/core/servicebus.bicep`
2. Η Υπηρεσία Προϊόντος δημοσιεύει γεγονότα "ProductCreated"
3. Η Υπηρεσία Παραγγελιών εγγράφεται σε γεγονότα προϊόντων
4. Προσθέστε Υπηρεσία Ειδοποιήσεων για επεξεργασία γεγονότων

**Πρότυπο**: Αίτημα/Απόκριση (HTTP) + Βάσει Γεγονότων (Service Bus)

### Φάση 4: Προσθήκη Αυθεντικοποίησης Χρηστών

**Υλοποίηση Υπηρεσίας Χρηστών**:

1. Δημιουργήστε `src/user-service/` (Go/Node.js)
2. Προσθέστε Azure AD B2C ή προσαρμοσμένη αυθεντικοποίηση JWT
3. Το API Gateway επικυρώνει τα tokens
4. Οι υπηρεσίες ελέγχουν τα δικαιώματα χρηστών

### Φάση 5: Ετοιμότητα για Παραγωγή

**Προσθέστε αυτά τα στοιχεία**:
- Azure Front Door (παγκόσμια εξισορρόπηση φόρτου)
- Azure Key Vault (διαχείριση μυστικών)
- Azure Monitor Workbooks (προσαρμοσμένα ταμπλό)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Διαχειριζόμενη ταυτότητα για όλες τις υπηρεσίες

**Πλήρες κόστος αρχιτεκτονικής για παραγωγή**: ~$300-1,400/μήνα

---

## Μάθετε περισσότερα

### Σχετική Τεκμηρίωση
- [Τεκμηρίωση Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Οδηγός Αρχιτεκτονικής Μικροϋπηρεσιών](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights για Διανεμημένη Παρακολούθηση](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Επόμενα Βήματα σε Αυτό το Μάθημα
- ← Προηγούμενο: [Απλό Flask API](../../../../../examples/container-app/simple-flask-api) - Παράδειγμα για αρχάριους με ένα container
- → Επόμενο: [Οδηγός Ενσωμάτωσης AI](../../../../../examples/docs/ai-foundry) - Προσθήκη δυνατοτήτων AI
- 🏠 [Αρχική Μαθήματος](../../README.md)

### Σύγκριση: Πότε να Χρησιμοποιήσετε Τι

**Εφαρμογή με Μονό Container** (Παράδειγμα Απλού Flask API):
- ✅ Απλές εφαρμογές
- ✅ Μονολιθική αρχιτεκτονική
- ✅ Γρήγορη ανάπτυξη
- ❌ Περιορισμένη κλιμάκωση
- **Κόστος**: ~$15-50/μήνα

**Μικροϋπηρεσίες** (Αυτό το παράδειγμα):
- ✅ Πολύπλοκες εφαρμογές
- ✅ Ανεξάρτητη κλιμάκωση ανά υπηρεσία
- ✅ Αυτονομία ομάδων (διαφορετικές υπηρεσίες, διαφορετικές ομάδες)
- ❌ Πιο πολύπλοκο στη διαχείριση
- **Κόστος**: ~$60-250/μήνα

**Kubernetes (AKS)**:
- ✅ Μέγιστος έλεγχος και ευελιξία
- ✅ Φορητότητα σε πολλαπλά cloud
- ✅ Προηγμένες δυνατότητες δικτύωσης
- ❌ Απαιτεί εξειδίκευση σε Kubernetes
- **Κόστος**: ~$150-500/μήνα τουλάχιστον

**Σύσταση**: Ξεκινήστε με τα Container Apps (αυτό το παράδειγμα), μεταβείτε σε AKS μόνο εάν χρειάζεστε λειτουργίες ειδικές για Kubernetes.

---

## Συχνές Ερωτήσεις

**Q: Why only 2 services instead of 5+?**  
A: Εκπαιδευτική προοδευτική προσέγγιση. Κατακτήστε τα βασικά (επικοινωνία υπηρεσιών, παρακολούθηση, κλιμάκωση) με ένα απλό παράδειγμα πριν προσθέσετε πολυπλοκότητα. Τα μοτίβα που μαθαίνετε εδώ ισχύουν και για αρχιτεκτονικές με 100 υπηρεσίες.

**Q: Can I add more services myself?**  
A: Απολύτως! Ακολουθήστε τον οδηγό επέκτασης παραπάνω. Κάθε νέα υπηρεσία ακολουθεί το ίδιο μοτίβο: δημιουργήστε φάκελο src, δημιουργήστε αρχείο Bicep, ενημερώστε azure.yaml, αναπτύξτε.

**Q: Is this production-ready?**  
A: Είναι μια σταθερή βάση. Για παραγωγή, προσθέστε: managed identity, Key Vault, επίμονες βάσεις δεδομένων, CI/CD pipeline, ειδοποιήσεις παρακολούθησης και στρατηγική backups.

**Q: Why not use Dapr or other service mesh?**  
A: Κρατήστε το απλό για εκμάθηση. Μόλις κατανοήσετε το εγγενές networking των Container Apps, μπορείτε να προσθέσετε Dapr για προχωρημένα σενάρια.

**Q: How do I debug locally?**  
A: Εκτελέστε τις υπηρεσίες τοπικά με Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Can I use different programming languages?**  
A: Ναι! Αυτό το παράδειγμα δείχνει Node.js (gateway) + Python (product service). Μπορείτε να συνδυάσετε οποιαδήποτε γλώσσα που τρέχει σε containers.

**Q: What if I don't have Azure credits?**  
A: Χρησιμοποιήστε το δωρεάν επίπεδο Azure (τις πρώτες 30 ημέρες με νέους λογαριασμούς) ή αναπτύξτε για σύντομες περιόδους δοκιμών και διαγράψτε αμέσως.

---

> **🎓 Περίληψη Διαδρομής Μάθησης**: Έχετε μάθει να αναπτύσσετε μια αρχιτεκτονική πολλαπλών υπηρεσιών με αυτόματη κλιμάκωση, εσωτερική δικτύωση, κεντρικοποιημένη παρακολούθηση και πρότυπα έτοιμα για παραγωγή. Αυτή η βάση σας προετοιμάζει για σύνθετα κατανεμημένα συστήματα και αρχιτεκτονικές μικροϋπηρεσιών σε επίπεδο επιχείρησης.

**📚 Πλοήγηση Μαθήματος:**
- ← Προηγούμενο: [Απλό Flask API](../../../../../examples/container-app/simple-flask-api)
- → Επόμενο: [Παράδειγμα Ενσωμάτωσης Βάσης Δεδομένων](../../../../../examples/database-app)
- 🏠 [Αρχική Μαθήματος](../../../README.md)
- 📖 [Καλύτερες Πρακτικές Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη Co-op Translator (https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, να γνωρίζετε ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν ευθυνόμαστε για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->