# Ανάπτυξη μιας βάσης δεδομένων Microsoft SQL και Web App με AZD

⏱️ **Εκτιμώμενος Χρόνος**: 20-30 λεπτά | 💰 **Εκτιμώμενο Κόστος**: ~$15-25/μήνα | ⭐ **Πολυπλοκότητα**: Ενδιάμεση

Αυτό το **πλήρες, λειτουργικό παράδειγμα** δείχνει πώς να χρησιμοποιήσετε το [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) για να αναπτύξετε μια εφαρμογή Python Flask με βάση δεδομένων Microsoft SQL στο Azure. Όλος ο κώδικας περιλαμβάνεται και έχει δοκιμαστεί—χωρίς εξωτερικές εξαρτήσεις.

## Τι θα μάθετε

Με την ολοκλήρωση αυτού του παραδείγματος, θα:
- Αναπτύξετε μια εφαρμογή πολλαπλών επιπέδων (web app + βάση δεδομένων) χρησιμοποιώντας υποδομή ως κώδικα
- Διαμορφώσετε ασφαλείς συνδέσεις βάσης δεδομένων χωρίς ενσωμάτωση μυστικών στον κώδικα
- Παρακολουθείτε την υγεία της εφαρμογής με το Application Insights
- Διαχειρίζεστε πόρους Azure αποτελεσματικά με το CLI AZD
- Ακολουθήσετε βέλτιστες πρακτικές Azure για ασφάλεια, βελτιστοποίηση κόστους και παρατηρησιμότητα

## Επισκόπηση Σεναρίου
- **Web App**: Python Flask REST API με σύνδεση σε βάση δεδομένων
- **Database**: Azure SQL Database με δείγμα δεδομένων
- **Infrastructure**: Παρέχεται χρησιμοποιώντας Bicep (αρθρωτά, επαναχρησιμοποιήσιμα πρότυπα)
- **Deployment**: Πλήρως αυτοματοποιημένο με εντολές `azd`
- **Monitoring**: Application Insights για logs και τηλεμετρία

## Προαπαιτούμενα

### Απαιτούμενα Εργαλεία

Πριν ξεκινήσετε, επιβεβαιώστε ότι έχετε εγκαταστήσει αυτά τα εργαλεία:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (έκδοση 2.50.0 ή νεότερη)
   ```sh
   az --version
   # Αναμενόμενη έξοδος: azure-cli 2.50.0 ή νεότερη έκδοση
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (έκδοση 1.0.0 ή νεότερη)
   ```sh
   azd version
   # Αναμενόμενη έξοδος: έκδοση azd 1.0.0 ή νεότερη
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (για τοπική ανάπτυξη)
   ```sh
   python --version
   # Αναμενόμενη έξοδος: Python 3.8 ή νεότερη
   ```

4. **[Docker](https://www.docker.com/get-started)** (προαιρετικό, για τοπική ανάπτυξη σε κοντέινερ)
   ```sh
   docker --version
   # Αναμενόμενη έξοδος: Docker έκδοση 20.10 ή νεότερη
   ```

### Απαιτήσεις Azure

- Ένας ενεργός **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- Δικαιώματα για δημιουργία πόρων στο συνδρομητικό σας λογαριασμό
- **Owner** ή **Contributor** ρόλος στη συνδρομή ή στο resource group

### Προαπαιτούμενες Γνώσεις

Αυτό είναι ένα παράδειγμα **ενδιάμεσου επιπέδου**. Θα πρέπει να είστε εξοικειωμένοι με:
- Βασικές λειτουργίες γραμμής εντολών
- Βασικές έννοιες cloud (resources, resource groups)
- Βασική κατανόηση web εφαρμογών και βάσεων δεδομένων

**Νέος στο AZD;** Ξεκινήστε με τον [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) πρώτα.

## Αρχιτεκτονική

Αυτό το παράδειγμα αναπτύσσει μια αρχιτεκτονική δύο επιπέδων με μια web εφαρμογή και μια βάση SQL:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Ανάπτυξη Πόρων:**
- **Resource Group**: Κοντέινερ για όλους τους πόρους
- **App Service Plan**: Φιλοξενία βασισμένη σε Linux (B1 tier για οικονομία)
- **Web App**: Python 3.11 runtime με εφαρμογή Flask
- **SQL Server**: Διαχειριζόμενος database server με TLS 1.2 ως ελάχιστο
- **SQL Database**: Basic tier (2GB, κατάλληλο για ανάπτυξη/δοκιμές)
- **Application Insights**: Παρακολούθηση και logging
- **Log Analytics Workspace**: Κεντρική αποθήκευση logs

**Παρομοίωση**: Σκεφτείτε το αυτό σαν ένα εστιατόριο (web app) με έναν ψυκτικό θάλαμο (βάση δεδομένων). Οι πελάτες παραγγέλνουν από το μενού (API endpoints), και η κουζίνα (Flask app) παίρνει τα υλικά (δεδομένα) από τον θάλαμο. Ο διευθυντής του εστιατορίου (Application Insights) παρακολουθεί ό,τι συμβαίνει.

## Δομή Φακέλων

Όλα τα αρχεία περιλαμβάνονται σε αυτό το παράδειγμα—χωρίς εξωτερικές εξαρτήσεις:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Τι κάνει κάθε αρχείο:**
- **azure.yaml**: Ποιοι πόροι να αναπτυχθούν και που το λέει στο AZD
- **infra/main.bicep**: Συντονίζει όλους τους πόρους Azure
- **infra/resources/*.bicep**: Ορισμοί μεμονωμένων πόρων (αρθρωτά για επαναχρησιμοποίηση)
- **src/web/app.py**: Εφαρμογή Flask με λογική βάσης δεδομένων
- **requirements.txt**: Εξαρτήσεις πακέτων Python
- **Dockerfile**: Οδηγίες containerization για ανάπτυξη

## Γρήγορη εκκίνηση (Βήμα-βήμα)

### Βήμα 1: Clone και Μεταβείτε

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Έλεγχος Επιτυχίας**: Επιβεβαιώστε ότι βλέπετε `azure.yaml` και τον φάκελο `infra/`:
```sh
ls
# Αναμενόμενα: README.md, azure.yaml, infra/, src/
```

### Βήμα 2: Πιστοποίηση στο Azure

```sh
azd auth login
```

Αυτό θα ανοίξει τον περιηγητή σας για πιστοποίηση στο Azure. Συνδεθείτε με τα διαπιστευτήριά σας Azure.

**✓ Έλεγχος Επιτυχίας**: Θα πρέπει να δείτε:
```
Logged in to Azure.
```

### Βήμα 3: Αρχικοποίηση του Περιβάλλοντος

```sh
azd init
```

**Τι συμβαίνει**: Το AZD δημιουργεί μια τοπική διαμόρφωση για την ανάπτυξή σας.

**Ερωτήματα που θα δείτε**:
- **Environment name**: Εισάγετε ένα σύντομο όνομα (π.χ., `dev`, `myapp`)
- **Azure subscription**: Επιλέξτε τη συνδρομή σας από τη λίστα
- **Azure location**: Επιλέξτε μια περιοχή (π.χ., `eastus`, `westeurope`)

**✓ Έλεγχος Επιτυχίας**: Θα πρέπει να δείτε:
```
SUCCESS: New project initialized!
```

### Βήμα 4: Παροχή Πόρων Azure

```sh
azd provision
```

**Τι συμβαίνει**: Το AZD αναπτύσσει όλη την υποδομή (διαρκεί 5-8 λεπτά):
1. Δημιουργεί resource group
2. Δημιουργεί SQL Server και Database
3. Δημιουργεί App Service Plan
4. Δημιουργεί Web App
5. Δημιουργεί Application Insights
6. Διαμορφώνει δικτύωση και ασφάλεια

**Θα σας ζητηθεί**:
- **SQL admin username**: Εισάγετε ένα όνομα χρήστη (π.χ., `sqladmin`)
- **SQL admin password**: Εισάγετε έναν ισχυρό κωδικό (αποθηκεύστε τον!)

**✓ Έλεγχος Επιτυχίας**: Θα πρέπει να δείτε:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Χρόνος**: 5-8 λεπτά

### Βήμα 5: Ανάπτυξη της Εφαρμογής

```sh
azd deploy
```

**Τι συμβαίνει**: Το AZD χτίζει και αναπτύσσει την εφαρμογή Flask σας:
1. Πακετάρει την εφαρμογή Python
2. Χτίζει το Docker container
3. Πιέζει στο Azure Web App
4. Αρχικοποιεί τη βάση δεδομένων με δείγμα δεδομένων
5. Εκκινεί την εφαρμογή

**✓ Έλεγχος Επιτυχίας**: Θα πρέπει να δείτε:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Χρόνος**: 3-5 λεπτά

### Βήμα 6: Περιηγηθείτε στην Εφαρμογή

```sh
azd browse
```

Αυτό ανοίγει την αναπτυγμένη web app σας στον περιηγητή στη διεύθυνση `https://app-<unique-id>.azurewebsites.net`

**✓ Έλεγχος Επιτυχίας**: Θα πρέπει να δείτε έξοδο JSON:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Βήμα 7: Δοκιμάστε τα API Endpoints

**Έλεγχος Υγείας** (επιβεβαίωση σύνδεσης βάσης δεδομένων):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Αναμενόμενη Απάντηση**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Λίστα Προϊόντων** (δείγμα δεδομένων):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Αναμενόμενη Απάντηση**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Λήψη Μονού Προϊόντος**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Έλεγχος Επιτυχίας**: Όλα τα endpoints επιστρέφουν δεδομένα JSON χωρίς σφάλματα.

---

**🎉 Συγχαρητήρια!** Έχετε αναπτύξει επιτυχώς μια web εφαρμογή με βάση δεδομένων στο Azure χρησιμοποιώντας το AZD.

## Εμβάθυνση στη Διαμόρφωση

### Μεταβλητές Περιβάλλοντος

Τα μυστικά διαχειρίζονται με ασφάλεια μέσω της διαμόρφωσης του Azure App Service—**μην τα ενσωματώνετε ποτέ στον πηγαίο κώδικα**.

**Διαμορφώνονται Αυτόματα από το AZD**:
- `SQL_CONNECTION_STRING`: Σύνδεση βάσης δεδομένων με κρυπτογραφημένα διαπιστευτήρια
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endpoint τηλεμετρίας
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Ενεργοποιεί αυτόματη εγκατάσταση εξαρτήσεων

**Πού Αποθηκεύονται τα Μυστικά**:
1. Κατά το `azd provision`, παρέχετε τα διαπιστευτήρια SQL μέσω ασφαλών προτροπών
2. Το AZD τα αποθηκεύει στο τοπικό `.azure/<env-name>/.env` αρχείο (αγνοείται από το git)
3. Το AZD τα εισάγει στη διαμόρφωση του Azure App Service (κρυπτογραφημένα at rest)
4. Η εφαρμογή τα διαβάζει μέσω `os.getenv()` κατά το runtime

### Τοπική Ανάπτυξη

Για τοπικό testing, δημιουργήστε ένα `.env` αρχείο από το δείγμα:

```sh
cp .env.sample .env
# Επεξεργαστείτε το .env με τη σύνδεση στην τοπική βάση δεδομένων σας
```

**Τοπικό Workflow Ανάπτυξης**:
```sh
# Εγκατάσταση εξαρτήσεων
cd src/web
pip install -r requirements.txt

# Ορισμός μεταβλητών περιβάλλοντος
export SQL_CONNECTION_STRING="your-local-connection-string"

# Εκτέλεση της εφαρμογής
python app.py
```

**Δοκιμή τοπικά**:
```sh
curl http://localhost:8000/health
# Αναμενόμενο: {"status": "υγιής", "database": "συνδεδεμένη"}
```

### Υποδομή ως Κώδικας

Όλοι οι πόροι Azure ορίζονται σε **Bicep templates** (`infra/` φάκελος):

- **Αρθρωτός Σχεδιασμός**: Κάθε τύπος πόρου έχει το δικό του αρχείο για επαναχρησιμοποίηση
- **Παραμετροποιημένος**: Προσαρμόστε SKUs, περιοχές, κανόνες ονομασίας
- **Βέλτιστες Πρακτικές**: Ακολουθεί πρότυπα ονομασίας και προεπιλογές ασφάλειας Azure
- **Έλεγχος Εκδόσεων**: Οι αλλαγές στην υποδομή παρακολουθούνται στο Git

**Παράδειγμα Προσαρμογής**:
Για να αλλάξετε το tier της βάσης δεδομένων, επεξεργαστείτε `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Καλύτερες Πρακτικές Ασφαλείας

Αυτό το παράδειγμα ακολουθεί βέλτιστες πρακτικές ασφάλειας Azure:

### 1. **Χωρίς Μυστικά στον Πηγαίο Κώδικα**
- ✅ Τα διαπιστευτήρια αποθηκεύονται στη διαμόρφωση του Azure App Service (κρυπτογραφημένα)
- ✅ Τα αρχεία `.env` εξαιρούνται από το Git μέσω `.gitignore`
- ✅ Τα μυστικά περνιούνται μέσω ασφαλών παραμέτρων κατά την παροχή

### 2. **Κρυπτογραφημένες Συνδέσεις**
- ✅ TLS 1.2 ως ελάχιστο για τον SQL Server
- ✅ Επιβολή HTTPS-only για το Web App
- ✅ Οι συνδέσεις στη βάση δεδομένων χρησιμοποιούν κρυπτογραφημένα κανάλια

### 3. **Δικτυακή Ασφάλεια**
- ✅ Ο firewall του SQL Server διαμορφώνεται να επιτρέπει μόνο υπηρεσίες Azure
- ✅ Ο δημόσιος δικτυακός πρόσβασης περιορίζεται (μπορεί να κλειδωθεί περαιτέρω με Private Endpoints)
- ✅ Το FTPS είναι απενεργοποιημένο στο Web App

### 4. **Authentication & Authorization**
- ⚠️ **Τρέχουσα**: SQL authentication (username/password)
- ✅ **Σύσταση για Παραγωγή**: Χρησιμοποιήστε Azure Managed Identity για αυθεντικοποίηση χωρίς κωδικούς

**Για αναβάθμιση σε Managed Identity** (για παραγωγή):
1. Ενεργοποιήστε managed identity στο Web App
2. Χορηγήστε δικαιώματα SQL στην ταυτότητα
3. Ενημερώστε το connection string για χρήση managed identity
4. Αφαιρέστε την πιστοποίηση με κωδικό πρόσβασης

### 5. **Έλεγχος & Συμμόρφωση**
- ✅ Το Application Insights καταγράφει όλες τις αιτήσεις και τα σφάλματα
- ✅ Η SQL Database έχει ενεργοποιημένο auditing (μπορεί να διαμορφωθεί για συμμόρφωση)
- ✅ Όλοι οι πόροι έχουν tags για διακυβέρνηση

**Λίστα Ελέγχου Ασφαλείας πριν την Παραγωγή**:
- [ ] Ενεργοποιήστε το Azure Defender για SQL
- [ ] Διαμορφώστε Private Endpoints για τη SQL Database
- [ ] Ενεργοποιήστε Web Application Firewall (WAF)
- [ ] Υλοποιήστε Azure Key Vault για rotation μυστικών
- [ ] Διαμορφώστε Azure AD authentication
- [ ] Ενεργοποιήστε diagnostic logging για όλους τους πόρους

## Βελτιστοποίηση Κόστους

**Εκτιμώμενα Μηνιαία Κόστη** (όπως τον Νοέμβριο 2025):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 Συμβουλές για μείωση κόστους**:

1. **Χρησιμοποιήστε Free Tier για μάθηση**:
   - App Service: F1 tier (δωρεάν, με περιορισμένες ώρες)
   - SQL Database: Χρησιμοποιήστε Azure SQL Database serverless
   - Application Insights: 5GB/μήνα δωρεάν εισαγωγή

2. **Απενεργοποιήστε πόρους όταν δεν χρησιμοποιούνται**:
   ```sh
   # Σταματήστε την εφαρμογή web (η χρέωση της βάσης δεδομένων συνεχίζεται)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Επανεκκινήστε όταν χρειάζεται
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Διαγράψτε τα πάντα μετά τις δοκιμές**:
   ```sh
   azd down
   ```
   Αυτό αφαιρεί ΟΛΟΥΣ τους πόρους και σταματά τις χρεώσεις.

4. **Development vs. Production SKUs**:
   - **Development**: Basic tier (χρησιμοποιείται σε αυτό το παράδειγμα)
   - **Production**: Standard/Premium tier με redundancy

**Παρακολούθηση Κόστους**:
- Δείτε τα κόστη στο [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Ρυθμίστε ειδοποιήσεις κόστους για να αποφύγετε εκπλήξεις
- Επισημάνετε όλους τους πόρους με `azd-env-name` για παρακολούθηση

**Εναλλακτική Free Tier**:
Για εκπαιδευτικούς σκοπούς, μπορείτε να τροποποιήσετε το `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Σημείωση**: Το δωρεάν επίπεδο έχει περιορισμούς (60 min/day CPU, no always-on).

## Παρακολούθηση & Παρατηρησιμότητα

### Ενσωμάτωση Application Insights

Αυτό το παράδειγμα περιλαμβάνει **Application Insights** για ολοκληρωμένη παρακολούθηση:

**Τι παρακολουθείται**:
- ✅ HTTP αιτήσεις (latency, status codes, endpoints)
- ✅ Σφάλματα και εξαιρέσεις εφαρμογής
- ✅ Προσαρμοσμένο logging από την εφαρμογή Flask
- ✅ Υγεία σύνδεσης βάσης δεδομένων
- ✅ Μετρικές απόδοσης (CPU, μνήμη)

**Πρόσβαση στο Application Insights**:
1. Ανοίξτε το [Azure Portal](https://portal.azure.com)
2. Μεταβείτε στο resource group σας (`rg-<env-name>`)
3. Κάντε κλικ στο Application Insights resource (`appi-<unique-id>`)

**Χρήσιμες Ερωτήσεις** (Application Insights → Logs):

**Προβολή Όλων των Αιτήσεων**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Εύρεση Σφαλμάτων**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Έλεγχος Endpoint Υγείας**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database Auditing

**Το auditing της SQL Database είναι ενεργοποιημένο** για να παρακολουθεί:
- Πρότυπα πρόσβασης στη βάση δεδομένων
- Αποτυχημένες προσπάθειες σύνδεσης
- Αλλαγές στο σχήμα
- Πρόσβαση σε δεδομένα (για συμμόρφωση)

**Πρόσβαση στα audit logs**:
1. Azure Portal → SQL Database → Auditing
2. Δείτε τα logs στο Log Analytics workspace

### Παρακολούθηση σε Πραγματικό Χρόνο

**Προβολή Live Metrics**:
1. Application Insights → Live Metrics
2. Δείτε αιτήσεις, αποτυχίες και απόδοση σε πραγματικό χρόνο

**Δημιουργία Ειδοποιήσεων**:
Δημιουργήστε ειδοποιήσεις για κρίσιμα γεγονότα:
- HTTP 500 errors > 5 σε 5 λεπτά
- Σφάλματα σύνδεσης στη βάση δεδομένων
- Υψηλοί χρόνοι απόκρισης (>2 δευτερόλεπτα)

**Παράδειγμα Δημιουργίας Ειδοποίησης**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Αντιμετώπιση προβλημάτων

### Συνηθισμένα προβλήματα και λύσεις

#### 1. `azd provision` αποτυγχάνει με "Location not available"

**Σύμπτωμα**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Λύση**:
Επιλέξτε μια διαφορετική περιοχή Azure ή καταχωρήστε τον πάροχο πόρων:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Η σύνδεση SQL αποτυγχάνει κατά την ανάπτυξη

**Σύμπτωμα**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Λύση**:
- Επιβεβαιώστε ότι το firewall του SQL Server επιτρέπει τις υπηρεσίες Azure (διαμορφώνεται αυτόματα)
- Ελέγξτε ότι ο κωδικός διαχειριστή SQL εισήχθη σωστά κατά το `azd provision`
- Βεβαιωθείτε ότι ο SQL Server έχει ολοκληρώσει την προμήθεια (μπορεί να χρειαστεί 2-3 λεπτά)

**Επαλήθευση σύνδεσης**:
```sh
# Από την Πύλη Azure, μεταβείτε στη Βάση δεδομένων SQL → Επεξεργαστής ερωτημάτων
# Προσπαθήστε να συνδεθείτε με τα διαπιστευτήριά σας
```

#### 3. Η Web App εμφανίζει "Application Error"

**Σύμπτωμα**:
Ο περιηγητής εμφανίζει γενική σελίδα σφάλματος.

**Λύση**:
Ελέγξτε τα αρχεία καταγραφής της εφαρμογής:
```sh
# Προβολή πρόσφατων αρχείων καταγραφής
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Συνήθεις αιτίες**:
- Ελλιπείς μεταβλητές περιβάλλοντος (ελέγξτε App Service → Configuration)
- Η εγκατάσταση πακέτων Python απέτυχε (ελέγξτε τα αρχεία καταγραφής ανάπτυξης)
- Σφάλμα αρχικοποίησης βάσης δεδομένων (ελέγξτε τη συνδεσιμότητα SQL)

#### 4. `azd deploy` αποτυγχάνει με "Build Error"

**Σύμπτωμα**:
```
Error: Failed to build project
```

**Λύση**:
- Βεβαιωθείτε ότι το `requirements.txt` δεν περιέχει συντακτικά σφάλματα
- Ελέγξτε ότι το Python 3.11 έχει καθοριστεί στο `infra/resources/web-app.bicep`
- Επαληθεύστε ότι το Dockerfile έχει τη σωστή βασική εικόνα

**Αντιμετώπιση σφαλμάτων τοπικά**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" κατά την εκτέλεση εντολών AZD

**Σύμπτωμα**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Λύση**:
Συνδεθείτε ξανά στο Azure:
```sh
azd auth login
az login
```

Επιβεβαιώστε ότι έχετε τα σωστά δικαιώματα (ρόλος Contributor) στη συνδρομή.

#### 6. Υψηλό κόστος βάσης δεδομένων

**Σύμπτωμα**:
Απροσδόκητος λογαριασμός Azure.

**Λύση**:
- Ελέγξτε αν ξεχάσατε να εκτελέσετε `azd down` μετά τις δοκιμές
- Επιβεβαιώστε ότι η SQL Database χρησιμοποιεί το επίπεδο Basic (όχι Premium)
- Επανεξετάστε τα κόστη στο Azure Cost Management
- Ρυθμίστε ειδοποιήσεις κόστους

### Λήψη βοήθειας

**Προβολή όλων των μεταβλητών περιβάλλοντος AZD**:
```sh
azd env get-values
```

**Έλεγχος κατάστασης ανάπτυξης**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Πρόσβαση στα αρχεία καταγραφής εφαρμογής**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Χρειάζεστε περισσότερη βοήθεια;**
- [Οδηγός αντιμετώπισης προβλημάτων AZD](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Αντιμετώπιση προβλημάτων Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Αντιμετώπιση προβλημάτων Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Πρακτικές Ασκήσεις

### Άσκηση 1: Επαληθεύστε την ανάπτυξή σας (Αρχάριος)

**Στόχος**: Επιβεβαιώστε ότι όλοι οι πόροι έχουν αναπτυχθεί και η εφαρμογή λειτουργεί.

**Βήματα**:
1. Λίστα όλων των πόρων στην ομάδα πόρων σας:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Αναμενόμενο**: 6-7 πόροι (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Δοκιμάστε όλα τα endpoints του API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Αναμενόμενο**: Όλα επιστρέφουν έγκυρο JSON χωρίς σφάλματα

3. Ελέγξτε το Application Insights:
   - Πλοηγηθείτε στο Application Insights στο Azure Portal
   - Μεταβείτε στο "Live Metrics"
   - Ανανεώστε τον περιηγητή σας στην web app
   **Αναμενόμενο**: Δείτε αιτήσεις να εμφανίζονται σε πραγματικό χρόνο

**Κριτήρια επιτυχίας**: Όλοι οι 6-7 πόροι υπάρχουν, όλα τα endpoints επιστρέφουν δεδομένα, το Live Metrics εμφανίζει δραστηριότητα.

---

### Άσκηση 2: Προσθέστε ένα νέο endpoint API (Ενδιάμεσο)

**Στόχος**: Επεκτείνετε την εφαρμογή Flask με ένα νέο endpoint.

**Αρχικός κώδικας**: Τα τρέχοντα endpoints στο `src/web/app.py`

**Βήματα**:
1. Επεξεργαστείτε το `src/web/app.py` και προσθέστε ένα νέο endpoint μετά τη συνάρτηση `get_product()`:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Αναπτύξτε την ενημερωμένη εφαρμογή:
   ```sh
   azd deploy
   ```

3. Δοκιμάστε το νέο endpoint:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Αναμενόμενο**: Επιστρέφει προϊόντα που ταιριάζουν με "laptop"

**Κριτήρια επιτυχίας**: Το νέο endpoint λειτουργεί, επιστρέφει φιλτραρισμένα αποτελέσματα, εμφανίζεται στα αρχεία καταγραφής του Application Insights.

---

### Άσκηση 3: Προσθέστε παρακολούθηση και ειδοποιήσεις (Προχωρημένο)

**Στόχος**: Ρυθμίστε προληπτική παρακολούθηση με ειδοποιήσεις.

**Βήματα**:
1. Δημιουργήστε μια ειδοποίηση για σφάλματα HTTP 500:
   ```sh
   # Λήψη του αναγνωριστικού πόρου του Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Δημιουργία ειδοποίησης
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Προκαλέστε την ειδοποίηση προκαλώντας σφάλματα:
   ```sh
   # Ζητήστε ένα ανύπαρκτο προϊόν
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Ελέγξτε αν η ειδοποίηση ενεργοποιήθηκε:
   - Azure Portal → Alerts → Alert Rules
   - Ελέγξτε το email σας (αν έχει ρυθμιστεί)

**Κριτήρια επιτυχίας**: Ο κανόνας ειδοποίησης δημιουργήθηκε, ενεργοποιείται σε σφάλματα, οι ειδοποιήσεις λαμβάνονται.

---

### Άσκηση 4: Αλλαγές στο σχήμα βάσης δεδομένων (Προχωρημένο)

**Στόχος**: Προσθέστε έναν νέο πίνακα και τροποποιήστε την εφαρμογή να τον χρησιμοποιεί.

**Βήματα**:
1. Συνδεθείτε στη SQL Database μέσω του Query Editor του Azure Portal

2. Δημιουργήστε έναν νέο πίνακα `categories`:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Ενημερώστε το `src/web/app.py` για να συμπεριλάβει πληροφορίες κατηγορίας στις απαντήσεις

4. Αναπτύξτε και δοκιμάστε

**Κριτήρια επιτυχίας**: Ο νέος πίνακας υπάρχει, τα προϊόντα εμφανίζουν πληροφορίες κατηγορίας, η εφαρμογή εξακολουθεί να λειτουργεί.

---

### Άσκηση 5: Εφαρμογή caching (Expert)

**Στόχος**: Προσθέστε Azure Redis Cache για βελτίωση της απόδοσης.

**Βήματα**:
1. Προσθέστε Redis Cache στο `infra/main.bicep`
2. Ενημερώστε το `src/web/app.py` για να πραγματοποιεί caching στα ερωτήματα προϊόντων
3. Μετρήστε τη βελτίωση απόδοσης με το Application Insights
4. Συγκρίνετε τους χρόνους απόκρισης πριν/μετά το caching

**Κριτήρια επιτυχίας**: Το Redis έχει αναπτυχθεί, το caching λειτουργεί, οι χρόνοι απόκρισης βελτιώνονται κατά >50%.

**Υπόδειξη**: Ξεκινήστε με [Τεκμηρίωση Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Καθαρισμός

Για να αποφύγετε συνεχή χρέωση, διαγράψτε όλους τους πόρους όταν τελειώσετε:

```sh
azd down
```

**Μήνυμα επιβεβαίωσης**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Πληκτρολογήστε `y` για επιβεβαίωση.

**✓ Έλεγχος επιτυχίας**: 
- Όλοι οι πόροι έχουν διαγραφεί από το Azure Portal
- Δεν υπάρχουν συνεχή χρεώσεις
- Ο τοπικός φάκελος `.azure/<env-name>` μπορεί να διαγραφεί

**Εναλλακτικό** (διατηρήστε την υποδομή, διαγράψτε τα δεδομένα):
```sh
# Διαγράψτε μόνο την ομάδα πόρων (κρατήστε τη διαμόρφωση AZD)
az group delete --name rg-<env-name> --yes
```
## Μάθετε περισσότερα

### Σχετική τεκμηρίωση
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Τεκμηρίωση Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Τεκμηρίωση Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Τεκμηρίωση Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Αναφορά γλώσσας Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Επόμενα βήματα σε αυτό το μάθημα
- **[Παράδειγμα Container Apps](../../../../examples/container-app)**: Αναπτύξτε μικροϋπηρεσίες με τα Azure Container Apps
- **[Οδηγός ενσωμάτωσης AI](../../../../docs/ai-foundry)**: Προσθέστε δυνατότητες AI στην εφαρμογή σας
- **[Καλές πρακτικές ανάπτυξης](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Πρότυπα ανάπτυξης για παραγωγή

### Προχωρημένα θέματα
- **Διαχειριζόμενη ταυτότητα (Managed Identity)**: Αφαιρέστε κωδικούς και χρησιμοποιήστε αυθεντικοποίηση Azure AD
- **Ιδιωτικά Endpoints**: Ασφαλίστε τις συνδέσεις βάσης δεδομένων εντός ενός εικονικού δικτύου
- **Ενσωμάτωση CI/CD**: Αυτοματοποιήστε τις αναπτύξεις με GitHub Actions ή Azure DevOps
- **Πολλαπλά περιβάλλοντα**: Ρυθμίστε περιβάλλοντα dev, staging και production
- **Μεταναστεύσεις βάσης δεδομένων**: Χρησιμοποιήστε Alembic ή Entity Framework για versioning σχήματος

### Σύγκριση με άλλες προσεγγίσεις

**AZD vs. ARM Templates**:
- ✅ AZD: Ανώτερο επίπεδο αφαίρεσης, απλούστερες εντολές
- ⚠️ ARM: Πιο περιγραφικό, λεπτομερής έλεγχος

**AZD vs. Terraform**:
- ✅ AZD: Εγγενές για Azure, ενσωματωμένο με υπηρεσίες Azure
- ⚠️ Terraform: Υποστήριξη πολλαπλών cloud, μεγαλύτερο οικοσύστημα

**AZD vs. Azure Portal**:
- ✅ AZD: Επαναλήψιμο, με έλεγχο εκδόσεων, αυτοματοποιήσιμο
- ⚠️ Portal: Χειροκίνητα κλικ, δύσκολο στην αναπαραγωγή

**Σκεφτείτε το AZD ως**: Docker Compose για το Azure—απλοποιημένη διαμόρφωση για σύνθετες αναπτύξεις.

---

## Συχνές Ερωτήσεις

**Q: Μπορώ να χρησιμοποιήσω διαφορετική γλώσσα προγραμματισμού;**  
A: Ναι! Αντικαταστήστε το `src/web/` με Node.js, C#, Go ή οποιαδήποτε γλώσσα. Ενημερώστε το `azure.yaml` και τα Bicep ανάλογα.

**Q: Πώς προσθέτω περισσότερες βάσεις δεδομένων;**  
A: Προσθέστε άλλο module SQL Database στο `infra/main.bicep` ή χρησιμοποιήστε PostgreSQL/MySQL από τις υπηρεσίες Azure Database.

**Q: Μπορώ να το χρησιμοποιήσω για παραγωγή;**  
A: Αυτό είναι ένα σημείο εκκίνησης. Για παραγωγή, προσθέστε: managed identity, private endpoints, redundancy, στρατηγική backup, WAF και βελτιωμένη παρακολούθηση.

**Q: Τι γίνεται αν θέλω να χρησιμοποιήσω containers αντί για ανάπτυξη κώδικα;**  
A: Δείτε το [Παράδειγμα Container Apps](../../../../examples/container-app) που χρησιμοποιεί Docker containers καθ' όλη τη διάρκεια.

**Q: Πώς συνδέομαι στη βάση δεδομένων από το τοπικό μου μηχάνημα;**  
A: Προσθέστε το IP σας στο firewall του SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Μπορώ να χρησιμοποιήσω υπάρχουσα βάση δεδομένων αντί να δημιουργήσω νέα;**  
A: Ναι, τροποποιήστε το `infra/main.bicep` για να αναφερθεί σε υπάρχον SQL Server και ενημερώστε τις παραμέτρους connection string.

---

> **Σημείωση:** Αυτό το παράδειγμα παρουσιάζει βέλτιστες πρακτικές για την ανάπτυξη μιας web εφαρμογής με βάση δεδομένων χρησιμοποιώντας το AZD. Περιλαμβάνει λειτουργικό κώδικα, πλήρη τεκμηρίωση και πρακτικές ασκήσεις για την ενδυνάμωση της μάθησης. Για αναπτύξεις σε παραγωγή, εξετάστε τα ζητήματα ασφάλειας, κλιμάκωσης, συμμόρφωσης και απαιτήσεις κόστους που ισχύουν για τον οργανισμό σας.

**📚 Πλοήγηση μαθήματος:**
- ← Προηγούμενο: [Παράδειγμα Container Apps](../../../../examples/container-app)
- → Επόμενο: [Οδηγός ενσωμάτωσης AI](../../../../docs/ai-foundry)
- 🏠 [Αρχική μαθήματος](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Το παρόν έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης τεχνητής νοημοσύνης (AI) [Co-op Translator](https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, σημειώστε ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->