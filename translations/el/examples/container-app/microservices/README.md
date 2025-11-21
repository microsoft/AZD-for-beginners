<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-21T09:44:08+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "el"
}
-->
# Αρχιτεκτονική Microservices - Παράδειγμα Εφαρμογής Container

⏱️ **Εκτιμώμενος Χρόνος**: 25-35 λεπτά | 💰 **Εκτιμώμενο Κόστος**: ~$50-100/μήνα | ⭐ **Πολυπλοκότητα**: Προχωρημένο

Μια **απλοποιημένη αλλά λειτουργική** αρχιτεκτονική microservices που αναπτύσσεται σε Azure Container Apps χρησιμοποιώντας το AZD CLI. Αυτό το παράδειγμα δείχνει επικοινωνία μεταξύ υπηρεσιών, ορχήστρωση containers και παρακολούθηση με μια πρακτική ρύθμιση 2 υπηρεσιών.

> **📚 Προσέγγιση Μάθησης**: Αυτό το παράδειγμα ξεκινά με μια ελάχιστη αρχιτεκτονική 2 υπηρεσιών (API Gateway + Backend Service) που μπορείτε πραγματικά να αναπτύξετε και να μάθετε από αυτήν. Αφού κατακτήσετε αυτή τη βάση, παρέχουμε καθοδήγηση για επέκταση σε ένα πλήρες οικοσύστημα microservices.

## Τι Θα Μάθετε

Ολοκληρώνοντας αυτό το παράδειγμα, θα:
- Αναπτύξετε πολλαπλά containers σε Azure Container Apps
- Υλοποιήσετε επικοινωνία μεταξύ υπηρεσιών με εσωτερική δικτύωση
- Ρυθμίσετε κλιμάκωση βάσει περιβάλλοντος και ελέγχους υγείας
- Παρακολουθήσετε διανεμημένες εφαρμογές με Application Insights
- Κατανοήσετε μοτίβα ανάπτυξης microservices και βέλτιστες πρακτικές
- Μάθετε προοδευτική επέκταση από απλές σε σύνθετες αρχιτεκτονικές

## Αρχιτεκτονική

### Φάση 1: Τι Δημιουργούμε (Περιλαμβάνεται σε Αυτό το Παράδειγμα)

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

**Γιατί Ξεκινάμε Απλά;**
- ✅ Αναπτύξτε και κατανοήστε γρήγορα (25-35 λεπτά)
- ✅ Μάθετε βασικά μοτίβα microservices χωρίς πολυπλοκότητα
- ✅ Λειτουργικός κώδικας που μπορείτε να τροποποιήσετε και να πειραματιστείτε
- ✅ Χαμηλότερο κόστος για μάθηση (~$50-100/μήνα έναντι $300-1400/μήνα)
- ✅ Αποκτήστε αυτοπεποίθηση πριν προσθέσετε βάσεις δεδομένων και ουρές μηνυμάτων

**Αναλογία**: Σκεφτείτε το σαν να μαθαίνετε να οδηγείτε. Ξεκινάτε σε ένα άδειο πάρκινγκ (2 υπηρεσίες), κατακτάτε τα βασικά και μετά προχωράτε στην κυκλοφορία της πόλης (5+ υπηρεσίες με βάσεις δεδομένων).

### Φάση 2: Μελλοντική Επέκταση (Αναφορά Αρχιτεκτονικής)

Αφού κατακτήσετε την αρχιτεκτονική 2 υπηρεσιών, μπορείτε να επεκταθείτε σε:

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

Δείτε την ενότητα "Οδηγός Επέκτασης" στο τέλος για βήμα-βήμα οδηγίες.

## Περιλαμβανόμενα Χαρακτηριστικά

✅ **Ανακάλυψη Υπηρεσιών**: Αυτόματη ανακάλυψη μέσω DNS μεταξύ containers  
✅ **Load Balancing**: Ενσωματωμένο load balancing μεταξύ αντιγράφων  
✅ **Αυτόματη Κλιμάκωση**: Ανεξάρτητη κλιμάκωση ανά υπηρεσία βάσει αιτημάτων HTTP  
✅ **Παρακολούθηση Υγείας**: Έλεγχοι liveness και readiness για τις δύο υπηρεσίες  
✅ **Διανεμημένη Καταγραφή**: Κεντρική καταγραφή με Application Insights  
✅ **Εσωτερική Δικτύωση**: Ασφαλής επικοινωνία μεταξύ υπηρεσιών  
✅ **Ορχήστρωση Containers**: Αυτόματη ανάπτυξη και κλιμάκωση  
✅ **Ενημερώσεις Χωρίς Διακοπή**: Rolling updates με διαχείριση αναθεωρήσεων  

## Προαπαιτούμενα

### Απαιτούμενα Εργαλεία

Πριν ξεκινήσετε, βεβαιωθείτε ότι έχετε εγκαταστήσει αυτά τα εργαλεία:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (έκδοση 1.0.0 ή νεότερη)
   ```bash
   azd version
   # Αναμενόμενο αποτέλεσμα: έκδοση azd 1.0.0 ή υψηλότερη
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (έκδοση 2.50.0 ή νεότερη)
   ```bash
   az --version
   # Αναμενόμενο αποτέλεσμα: azure-cli 2.50.0 ή νεότερη έκδοση
   ```

3. **[Docker](https://www.docker.com/get-started)** (για τοπική ανάπτυξη/δοκιμή - προαιρετικό)
   ```bash
   docker --version
   # Αναμενόμενο αποτέλεσμα: Έκδοση Docker 20.10 ή νεότερη
   ```

### Απαιτήσεις Azure

- Ενεργή **συνδρομή Azure** ([δημιουργήστε δωρεάν λογαριασμό](https://azure.microsoft.com/free/))
- Δικαιώματα για δημιουργία πόρων στη συνδρομή σας
- Ρόλος **Contributor** στη συνδρομή ή την ομάδα πόρων

### Γνώσεις Προαπαιτούμενες

Αυτό είναι ένα παράδειγμα **προχωρημένου επιπέδου**. Θα πρέπει να έχετε:
- Ολοκληρώσει το [απλό παράδειγμα Flask API](../../../../../examples/container-app/simple-flask-api) 
- Βασική κατανόηση της αρχιτεκτονικής microservices
- Εξοικείωση με REST APIs και HTTP
- Κατανόηση των εννοιών των containers

**Νέοι στα Container Apps;** Ξεκινήστε με το [απλό παράδειγμα Flask API](../../../../../examples/container-app/simple-flask-api) για να μάθετε τα βασικά.

## Γρήγορη Εκκίνηση (Βήμα-Βήμα)

### Βήμα 1: Κλωνοποίηση και Πλοήγηση

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Έλεγχος Επιτυχίας**: Επαληθεύστε ότι βλέπετε το `azure.yaml`:
```bash
ls
# Αναμενόμενο: README.md, azure.yaml, infra/, src/
```

### Βήμα 2: Αυθεντικοποίηση με Azure

```bash
azd auth login
```

Αυτό ανοίγει τον περιηγητή σας για αυθεντικοποίηση στο Azure. Συνδεθείτε με τα διαπιστευτήρια Azure σας.

**✓ Έλεγχος Επιτυχίας**: Θα πρέπει να δείτε:
```
Logged in to Azure.
```

### Βήμα 3: Αρχικοποίηση Περιβάλλοντος

```bash
azd init
```

**Προτροπές που θα δείτε**:
- **Όνομα περιβάλλοντος**: Εισάγετε ένα σύντομο όνομα (π.χ., `microservices-dev`)
- **Συνδρομή Azure**: Επιλέξτε τη συνδρομή σας
- **Τοποθεσία Azure**: Επιλέξτε μια περιοχή (π.χ., `eastus`, `westeurope`)

**✓ Έλεγχος Επιτυχίας**: Θα πρέπει να δείτε:
```
SUCCESS: New project initialized!
```

### Βήμα 4: Ανάπτυξη Υποδομής και Υπηρεσιών

```bash
azd up
```

**Τι συμβαίνει** (διαρκεί 8-12 λεπτά):
1. Δημιουργεί περιβάλλον Container Apps
2. Δημιουργεί Application Insights για παρακολούθηση
3. Δημιουργεί container API Gateway (Node.js)
4. Δημιουργεί container Product Service (Python)
5. Αναπτύσσει και τα δύο containers στο Azure
6. Ρυθμίζει δικτύωση και ελέγχους υγείας
7. Ρυθμίζει παρακολούθηση και καταγραφή

**✓ Έλεγχος Επιτυχίας**: Θα πρέπει να δείτε:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Χρόνος**: 8-12 λεπτά

### Βήμα 5: Δοκιμή Ανάπτυξης

```bash
# Λάβετε το σημείο πρόσβασης της πύλης
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Δοκιμάστε την υγεία του API Gateway
curl $GATEWAY_URL/health

# Αναμενόμενο αποτέλεσμα:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Δοκιμή υπηρεσίας προϊόντων μέσω gateway**:
```bash
# Λίστα προϊόντων
curl $GATEWAY_URL/api/products

# Αναμενόμενο αποτέλεσμα:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ Έλεγχος Επιτυχίας**: Και τα δύο endpoints επιστρέφουν δεδομένα JSON χωρίς σφάλματα.

---

**🎉 Συγχαρητήρια!** Έχετε αναπτύξει μια αρχιτεκτονική microservices στο Azure!

## Δομή Έργου

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

**Τι Κάνει Κάθε Συστατικό:**

**Υποδομή (infra/)**:
- `main.bicep`: Οργανώνει όλους τους πόρους Azure και τις εξαρτήσεις τους
- `core/container-apps-environment.bicep`: Δημιουργεί το περιβάλλον Container Apps και το Azure Container Registry
- `core/monitor.bicep`: Ρυθμίζει το Application Insights για διανεμημένη καταγραφή
- `app/*.bicep`: Ατομικοί ορισμοί container app με κλιμάκωση και ελέγχους υγείας

**API Gateway (src/api-gateway/)**:
- Υπηρεσία που δέχεται αιτήματα και τα προωθεί στις backend υπηρεσίες
- Υλοποιεί καταγραφή, διαχείριση σφαλμάτων και προώθηση αιτημάτων
- Δείχνει επικοινωνία HTTP μεταξύ υπηρεσιών

**Υπηρεσία Προϊόντων (src/product-service/)**:
- Εσωτερική υπηρεσία με κατάλογο προϊόντων (στη μνήμη για απλότητα)
- REST API με ελέγχους υγείας
- Παράδειγμα μοτίβου backend microservice

## Επισκόπηση Υπηρεσιών

### API Gateway (Node.js/Express)

**Θύρα**: 8080  
**Πρόσβαση**: Δημόσια (εξωτερική είσοδος)  
**Σκοπός**: Δρομολογεί εισερχόμενα αιτήματα στις κατάλληλες backend υπηρεσίες  

**Endpoints**:
- `GET /` - Πληροφορίες υπηρεσίας
- `GET /health` - Endpoint ελέγχου υγείας
- `GET /api/products` - Προώθηση στην υπηρεσία προϊόντων (λίστα όλων)
- `GET /api/products/:id` - Προώθηση στην υπηρεσία προϊόντων (λήψη ανά ID)

**Κύρια Χαρακτηριστικά**:
- Δρομολόγηση αιτημάτων με axios
- Κεντρική καταγραφή
- Διαχείριση σφαλμάτων και χρονικών ορίων
- Ανακάλυψη υπηρεσιών μέσω μεταβλητών περιβάλλοντος
- Ενσωμάτωση Application Insights

**Επισήμανση Κώδικα** (`src/api-gateway/app.js`):
```javascript
// Εσωτερική επικοινωνία υπηρεσιών
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Υπηρεσία Προϊόντων (Python/Flask)

**Θύρα**: 8000  
**Πρόσβαση**: Μόνο εσωτερική (χωρίς εξωτερική είσοδο)  
**Σκοπός**: Διαχειρίζεται τον κατάλογο προϊόντων με δεδομένα στη μνήμη  

**Endpoints**:
- `GET /` - Πληροφορίες υπηρεσίας
- `GET /health` - Endpoint ελέγχου υγείας
- `GET /products` - Λίστα όλων των προϊόντων
- `GET /products/<id>` - Λήψη προϊόντος ανά ID

**Κύρια Χαρακτηριστικά**:
- RESTful API με Flask
- Κατάστημα προϊόντων στη μνήμη (απλό, χωρίς βάση δεδομένων)
- Παρακολούθηση υγείας με probes
- Δομημένη καταγραφή
- Ενσωμάτωση Application Insights

**Μοντέλο Δεδομένων**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Γιατί Μόνο Εσωτερική Πρόσβαση;**
Η υπηρεσία προϊόντων δεν εκτίθεται δημόσια. Όλα τα αιτήματα πρέπει να περνούν μέσω του API Gateway, το οποίο παρέχει:
- Ασφάλεια: Ελεγχόμενο σημείο πρόσβασης
- Ευελιξία: Μπορεί να αλλάξει το backend χωρίς να επηρεάζονται οι πελάτες
- Παρακολούθηση: Κεντρική καταγραφή αιτημάτων

## Κατανόηση Επικοινωνίας Υπηρεσιών

### Πώς Επικοινωνούν οι Υπηρεσίες

Σε αυτό το παράδειγμα, το API Gateway επικοινωνεί με την Υπηρεσία Προϊόντων χρησιμοποιώντας **εσωτερικές κλήσεις HTTP**:

```javascript
// Πύλη API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Κάντε εσωτερικό αίτημα HTTP
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Κύρια Σημεία**:

1. **Ανακάλυψη μέσω DNS**: Τα Container Apps παρέχουν αυτόματα DNS για εσωτερικές υπηρεσίες
   - FQDN Υπηρεσίας Προϊόντων: `product-service.internal.<environment>.azurecontainerapps.io`
   - Απλοποιημένο ως: `http://product-service` (τα Container Apps το επιλύουν)

2. **Χωρίς Δημόσια Έκθεση**: Η Υπηρεσία Προϊόντων έχει `external: false` στο Bicep
   - Προσβάσιμη μόνο εντός του περιβάλλοντος Container Apps
   - Δεν μπορεί να προσεγγιστεί από το διαδίκτυο

3. **Μεταβλητές Περιβάλλοντος**: Οι διευθύνσεις URL υπηρεσιών εισάγονται κατά την ανάπτυξη
   - Το Bicep περνά το εσωτερικό FQDN στο gateway
   - Καμία σκληροκωδικοποιημένη URL στον κώδικα της εφαρμογής

**Αναλογία**: Σκεφτείτε το σαν γραφεία. Το API Gateway είναι η ρεσεψιόν (δημόσια), και η Υπηρεσία Προϊόντων είναι ένα γραφείο (μόνο εσωτερική πρόσβαση). Οι επισκέπτες πρέπει να περάσουν από τη ρεσεψιόν για να φτάσουν σε οποιοδήποτε γραφείο.
Για μάθηση/δοκιμή, σκεφτείτε:
- Χρησιμοποιήστε δωρεάν πιστώσεις Azure (πρώτες 30 ημέρες)
- Κρατήστε τον ελάχιστο αριθμό αντιγράφων
- Διαγράψτε μετά τη δοκιμή (χωρίς συνεχιζόμενες χρεώσεις)

---

## Καθαρισμός

Για να αποφύγετε συνεχιζόμενες χρεώσεις, διαγράψτε όλους τους πόρους:

```bash
azd down --force --purge
```

**Προτροπή Επιβεβαίωσης**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Πληκτρολογήστε `y` για επιβεβαίωση.

**Τι Διαγράφεται**:
- Περιβάλλον Εφαρμογών Container
- Και οι δύο Εφαρμογές Container (gateway & product service)
- Registry Container
- Application Insights
- Log Analytics Workspace
- Ομάδα Πόρων

**✓ Επαλήθευση Καθαρισμού**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Θα πρέπει να επιστρέψει κενό.

---

## Οδηγός Επέκτασης: Από 2 σε 5+ Υπηρεσίες

Αφού κατανοήσετε αυτήν την αρχιτεκτονική με 2 υπηρεσίες, δείτε πώς να επεκταθείτε:

### Φάση 1: Προσθήκη Επίμονης Βάσης Δεδομένων (Επόμενο Βήμα)

**Προσθήκη Cosmos DB για την Υπηρεσία Προϊόντων**:

1. Δημιουργήστε `infra/core/cosmos.bicep`:
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

2. Ενημερώστε την υπηρεσία προϊόντων να χρησιμοποιεί το Cosmos DB αντί για δεδομένα στη μνήμη

3. Εκτιμώμενο πρόσθετο κόστος: ~$25/μήνα (serverless)

### Φάση 2: Προσθήκη Τρίτης Υπηρεσίας (Διαχείριση Παραγγελιών)

**Δημιουργία Υπηρεσίας Παραγγελιών**:

1. Νέος φάκελος: `src/order-service/` (Python/Node.js/C#)
2. Νέο Bicep: `infra/app/order-service.bicep`
3. Ενημερώστε το API Gateway να δρομολογεί `/api/orders`
4. Προσθέστε Azure SQL Database για την αποθήκευση παραγγελιών

**Η αρχιτεκτονική γίνεται**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Φάση 3: Προσθήκη Ασύγχρονης Επικοινωνίας (Service Bus)

**Υλοποίηση Αρχιτεκτονικής Βασισμένης σε Γεγονότα**:

1. Προσθέστε Azure Service Bus: `infra/core/servicebus.bicep`
2. Η Υπηρεσία Προϊόντων δημοσιεύει γεγονότα "ProductCreated"
3. Η Υπηρεσία Παραγγελιών εγγράφεται στα γεγονότα προϊόντων
4. Προσθέστε Υπηρεσία Ειδοποιήσεων για επεξεργασία γεγονότων

**Μοτίβο**: Αίτηση/Απάντηση (HTTP) + Βασισμένο σε Γεγονότα (Service Bus)

### Φάση 4: Προσθήκη Αυθεντικοποίησης Χρηστών

**Υλοποίηση Υπηρεσίας Χρηστών**:

1. Δημιουργήστε `src/user-service/` (Go/Node.js)
2. Προσθέστε Azure AD B2C ή προσαρμοσμένη αυθεντικοποίηση JWT
3. Το API Gateway επαληθεύει τα tokens
4. Οι υπηρεσίες ελέγχουν τα δικαιώματα χρηστών

### Φάση 5: Ετοιμότητα για Παραγωγή

**Προσθέστε Αυτά τα Στοιχεία**:
- Azure Front Door (παγκόσμια εξισορρόπηση φορτίου)
- Azure Key Vault (διαχείριση μυστικών)
- Azure Monitor Workbooks (προσαρμοσμένοι πίνακες ελέγχου)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity για όλες τις υπηρεσίες

**Πλήρες Κόστος Αρχιτεκτονικής Παραγωγής**: ~$300-1,400/μήνα

---

## Μάθετε Περισσότερα

### Σχετική Τεκμηρίωση
- [Τεκμηρίωση Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Οδηγός Αρχιτεκτονικής Microservices](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights για Κατανεμημένη Ιχνηλάτηση](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Επόμενα Βήματα σε Αυτό το Μάθημα
- ← Προηγούμενο: [Απλό Flask API](../../../../../examples/container-app/simple-flask-api) - Παράδειγμα αρχάριου με ένα container
- → Επόμενο: [Οδηγός Ενσωμάτωσης AI](../../../../../examples/docs/ai-foundry) - Προσθέστε δυνατότητες AI
- 🏠 [Αρχική Σελίδα Μαθήματος](../../README.md)

### Σύγκριση: Πότε να Χρησιμοποιήσετε Τι

**Μία Εφαρμογή Container** (Παράδειγμα Απλού Flask API):
- ✅ Απλές εφαρμογές
- ✅ Μονολιθική αρχιτεκτονική
- ✅ Γρήγορη ανάπτυξη
- ❌ Περιορισμένη κλιμάκωση
- **Κόστος**: ~$15-50/μήνα

**Microservices** (Αυτό το παράδειγμα):
- ✅ Σύνθετες εφαρμογές
- ✅ Ανεξάρτητη κλιμάκωση ανά υπηρεσία
- ✅ Αυτονομία ομάδας (διαφορετικές υπηρεσίες, διαφορετικές ομάδες)
- ❌ Πιο περίπλοκη διαχείριση
- **Κόστος**: ~$60-250/μήνα

**Kubernetes (AKS)**:
- ✅ Μέγιστος έλεγχος και ευελιξία
- ✅ Φορητότητα πολλαπλών cloud
- ✅ Προηγμένη δικτύωση
- ❌ Απαιτεί εξειδίκευση στο Kubernetes
- **Κόστος**: ~$150-500/μήνα ελάχιστο

**Σύσταση**: Ξεκινήστε με Container Apps (αυτό το παράδειγμα), μεταβείτε στο AKS μόνο αν χρειάζεστε συγκεκριμένες δυνατότητες Kubernetes.

---

## Συχνές Ερωτήσεις

**Ε: Γιατί μόνο 2 υπηρεσίες αντί για 5+;**  
Α: Εκπαιδευτική πρόοδος. Κατανοήστε τα βασικά (επικοινωνία υπηρεσιών, παρακολούθηση, κλιμάκωση) με ένα απλό παράδειγμα πριν προσθέσετε πολυπλοκότητα. Τα μοτίβα που μαθαίνετε εδώ ισχύουν για αρχιτεκτονικές με 100 υπηρεσίες.

**Ε: Μπορώ να προσθέσω περισσότερες υπηρεσίες μόνος μου;**  
Α: Φυσικά! Ακολουθήστε τον οδηγό επέκτασης παραπάνω. Κάθε νέα υπηρεσία ακολουθεί το ίδιο μοτίβο: δημιουργήστε φάκελο src, δημιουργήστε αρχείο Bicep, ενημερώστε το azure.yaml, αναπτύξτε.

**Ε: Είναι αυτό έτοιμο για παραγωγή;**  
Α: Είναι μια σταθερή βάση. Για παραγωγή, προσθέστε: managed identity, Key Vault, επίμονες βάσεις δεδομένων, CI/CD pipeline, ειδοποιήσεις παρακολούθησης και στρατηγική δημιουργίας αντιγράφων ασφαλείας.

**Ε: Γιατί να μην χρησιμοποιήσω Dapr ή άλλο service mesh;**  
Α: Κρατήστε το απλό για μάθηση. Μόλις κατανοήσετε τη δικτύωση των Container Apps, μπορείτε να προσθέσετε το Dapr για πιο προηγμένα σενάρια.

**Ε: Πώς μπορώ να κάνω εντοπισμό σφαλμάτων τοπικά;**  
Α: Εκτελέστε τις υπηρεσίες τοπικά με Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Ε: Μπορώ να χρησιμοποιήσω διαφορετικές γλώσσες προγραμματισμού;**  
Α: Ναι! Αυτό το παράδειγμα δείχνει Node.js (gateway) + Python (product service). Μπορείτε να συνδυάσετε οποιεσδήποτε γλώσσες που εκτελούνται σε containers.

**Ε: Τι γίνεται αν δεν έχω πιστώσεις Azure;**  
Α: Χρησιμοποιήστε το δωρεάν επίπεδο Azure (πρώτες 30 ημέρες με νέους λογαριασμούς) ή αναπτύξτε για σύντομες περιόδους δοκιμής και διαγράψτε αμέσως.

---

> **🎓 Περίληψη Μαθησιακής Διαδρομής**: Έχετε μάθει να αναπτύσσετε μια αρχιτεκτονική πολλαπλών υπηρεσιών με αυτόματη κλιμάκωση, εσωτερική δικτύωση, κεντρική παρακολούθηση και πρότυπα έτοιμα για παραγωγή. Αυτή η βάση σας προετοιμάζει για σύνθετα κατανεμημένα συστήματα και αρχιτεκτονικές microservices για επιχειρήσεις.

**📚 Πλοήγηση Μαθήματος**:
- ← Προηγούμενο: [Απλό Flask API](../../../../../examples/container-app/simple-flask-api)
- → Επόμενο: [Παράδειγμα Ενσωμάτωσης Βάσης Δεδομένων](../../../../../examples/database-app)
- 🏠 [Αρχική Σελίδα Μαθήματος](../../README.md)
- 📖 [Βέλτιστες Πρακτικές Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->