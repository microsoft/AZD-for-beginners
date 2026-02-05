# Ανάπτυξη μιας Βάσης Δεδομένων Microsoft SQL και Εφαρμογής Ιστού με AZD

⏱️ **Εκτιμώμενος Χρόνος**: 20-30 λεπτά | 💰 **Εκτιμώμενο Κόστος**: ~15-25€/μήνα | ⭐ **Δυσκολία**: Μεσαία

Αυτό το **πλήρες, λειτουργικό παράδειγμα** δείχνει πώς να χρησιμοποιήσετε το [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) για να αναπτύξετε μια εφαρμογή ιστού Python Flask με μια Βάση Δεδομένων Microsoft SQL στο Azure. Όλος ο κώδικας περιλαμβάνεται και έχει δοκιμαστεί—δεν απαιτούνται εξωτερικές εξαρτήσεις.

## Τι θα Μάθετε

Ολοκληρώνοντας αυτό το παράδειγμα, θα:
- Αναπτύξετε μια εφαρμογή πολλαπλών επιπέδων (εφαρμογή ιστού + βάση δεδομένων) χρησιμοποιώντας υποδομή ως κώδικα
- Ρυθμίσετε ασφαλείς συνδέσεις βάσης δεδομένων χωρίς να αποθηκεύετε μυστικά στον κώδικα
- Παρακολουθήσετε την υγεία της εφαρμογής με το Application Insights
- Διαχειριστείτε πόρους Azure αποτελεσματικά με το AZD CLI
- Ακολουθήσετε τις βέλτιστες πρακτικές του Azure για ασφάλεια, βελτιστοποίηση κόστους και παρατηρησιμότητα

## Επισκόπηση Σεναρίου
- **Εφαρμογή Ιστού**: REST API Python Flask με συνδεσιμότητα βάσης δεδομένων
- **Βάση Δεδομένων**: Azure SQL Database με δείγματα δεδομένων
- **Υποδομή**: Δημιουργείται με χρήση Bicep (αρθρωτά, επαναχρησιμοποιήσιμα πρότυπα)
- **Ανάπτυξη**: Πλήρως αυτοματοποιημένη με εντολές `azd`
- **Παρακολούθηση**: Application Insights για καταγραφές και τηλεμετρία

## Προαπαιτούμενα

### Απαιτούμενα Εργαλεία

Πριν ξεκινήσετε, βεβαιωθείτε ότι έχετε εγκαταστήσει τα παρακάτω εργαλεία:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (έκδοση 2.50.0 ή νεότερη)
   ```sh
   az --version
   # Αναμενόμενο αποτέλεσμα: azure-cli 2.50.0 ή νεότερη έκδοση
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (έκδοση 1.0.0 ή νεότερη)
   ```sh
   azd version
   # Αναμενόμενο αποτέλεσμα: έκδοση azd 1.0.0 ή υψηλότερη
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (για τοπική ανάπτυξη)
   ```sh
   python --version
   # Αναμενόμενο αποτέλεσμα: Python 3.8 ή νεότερη έκδοση
   ```

4. **[Docker](https://www.docker.com/get-started)** (προαιρετικό, για τοπική ανάπτυξη με containers)
   ```sh
   docker --version
   # Αναμενόμενο αποτέλεσμα: Έκδοση Docker 20.10 ή νεότερη
   ```

### Απαιτήσεις Azure

- Ενεργή **συνδρομή Azure** ([δημιουργήστε δωρεάν λογαριασμό](https://azure.microsoft.com/free/))
- Δικαιώματα για δημιουργία πόρων στη συνδρομή σας
- Ρόλος **Owner** ή **Contributor** στη συνδρομή ή την ομάδα πόρων

### Γνώσεις που Απαιτούνται

Αυτό είναι ένα παράδειγμα **μεσαίου επιπέδου**. Θα πρέπει να είστε εξοικειωμένοι με:
- Βασικές λειτουργίες γραμμής εντολών
- Θεμελιώδεις έννοιες cloud (πόροι, ομάδες πόρων)
- Βασική κατανόηση εφαρμογών ιστού και βάσεων δεδομένων

**Νέοι στο AZD;** Ξεκινήστε με τον [Οδηγό Ξεκινήματος](../../docs/getting-started/azd-basics.md).

## Αρχιτεκτονική

Αυτό το παράδειγμα αναπτύσσει μια αρχιτεκτονική δύο επιπέδων με μια εφαρμογή ιστού και μια βάση δεδομένων SQL:

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
- **Ομάδα Πόρων**: Κοντέινερ για όλους τους πόρους
- **App Service Plan**: Φιλοξενία βασισμένη σε Linux (επίπεδο B1 για οικονομία)
- **Εφαρμογή Ιστού**: Python 3.11 runtime με εφαρμογή Flask
- **SQL Server**: Διαχειριζόμενος διακομιστής βάσης δεδομένων με ελάχιστο TLS 1.2
- **SQL Database**: Βασικό επίπεδο (2GB, κατάλληλο για ανάπτυξη/δοκιμές)
- **Application Insights**: Παρακολούθηση και καταγραφή
- **Log Analytics Workspace**: Κεντρική αποθήκευση καταγραφών

**Παρομοίωση**: Σκεφτείτε το σαν ένα εστιατόριο (εφαρμογή ιστού) με έναν καταψύκτη (βάση δεδομένων). Οι πελάτες παραγγέλνουν από το μενού (API endpoints), και η κουζίνα (εφαρμογή Flask) ανακτά υλικά (δεδομένα) από τον καταψύκτη. Ο διευθυντής του εστιατορίου (Application Insights) παρακολουθεί τα πάντα.

## Δομή Φακέλων

Όλα τα αρχεία περιλαμβάνονται σε αυτό το παράδειγμα—δεν απαιτούνται εξωτερικές εξαρτήσεις:

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

**Τι Κάνει Κάθε Αρχείο:**
- **azure.yaml**: Ενημερώνει το AZD τι να αναπτύξει και πού
- **infra/main.bicep**: Οργανώνει όλους τους πόρους Azure
- **infra/resources/*.bicep**: Ορισμοί μεμονωμένων πόρων (αρθρωτοί για επαναχρησιμοποίηση)
- **src/web/app.py**: Εφαρμογή Flask με λογική βάσης δεδομένων
- **requirements.txt**: Εξαρτήσεις πακέτων Python
- **Dockerfile**: Οδηγίες containerization για ανάπτυξη

## Γρήγορη Εκκίνηση (Βήμα-Βήμα)

### Βήμα 1: Κλωνοποίηση και Πλοήγηση

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Έλεγχος Επιτυχίας**: Επαληθεύστε ότι βλέπετε το `azure.yaml` και τον φάκελο `infra/`:
```sh
ls
# Αναμενόμενο: README.md, azure.yaml, infra/, src/
```

### Βήμα 2: Αυθεντικοποίηση με το Azure

```sh
azd auth login
```

Αυτό ανοίγει τον περιηγητή σας για αυθεντικοποίηση στο Azure. Συνδεθείτε με τα διαπιστευτήριά σας.

**✓ Έλεγχος Επιτυχίας**: Θα πρέπει να δείτε:
```
Logged in to Azure.
```

### Βήμα 3: Αρχικοποίηση Περιβάλλοντος

```sh
azd init
```

**Τι συμβαίνει**: Το AZD δημιουργεί μια τοπική διαμόρφωση για την ανάπτυξή σας.

**Προτροπές που θα δείτε**:
- **Όνομα περιβάλλοντος**: Εισάγετε ένα σύντομο όνομα (π.χ., `dev`, `myapp`)
- **Συνδρομή Azure**: Επιλέξτε τη συνδρομή σας από τη λίστα
- **Τοποθεσία Azure**: Επιλέξτε μια περιοχή (π.χ., `eastus`, `westeurope`)

**✓ Έλεγχος Επιτυχίας**: Θα πρέπει να δείτε:
```
SUCCESS: New project initialized!
```

### Βήμα 4: Παροχή Πόρων Azure

```sh
azd provision
```

**Τι συμβαίνει**: Το AZD αναπτύσσει όλη την υποδομή (διαρκεί 5-8 λεπτά):
1. Δημιουργεί ομάδα πόρων
2. Δημιουργεί SQL Server και Βάση Δεδομένων
3. Δημιουργεί App Service Plan
4. Δημιουργεί Εφαρμογή Ιστού
5. Δημιουργεί Application Insights
6. Ρυθμίζει δικτύωση και ασφάλεια

**Θα σας ζητηθεί**:
- **Όνομα διαχειριστή SQL**: Εισάγετε ένα όνομα χρήστη (π.χ., `sqladmin`)
- **Κωδικός διαχειριστή SQL**: Εισάγετε έναν ισχυρό κωδικό (αποθηκεύστε τον!)

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

**Τι συμβαίνει**: Το AZD δημιουργεί και αναπτύσσει την εφαρμογή Flask:
1. Πακετάρει την εφαρμογή Python
2. Δημιουργεί το Docker container
3. Το ανεβάζει στο Azure Web App
4. Αρχικοποιεί τη βάση δεδομένων με δείγματα δεδομένων
5. Εκκινεί την εφαρμογή

**✓ Έλεγχος Επιτυχίας**: Θα πρέπει να δείτε:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Χρόνος**: 3-5 λεπτά

### Βήμα 6: Περιήγηση στην Εφαρμογή

```sh
azd browse
```

Αυτό ανοίγει την αναπτυγμένη εφαρμογή ιστού στον περιηγητή στη διεύθυνση `https://app-<unique-id>.azurewebsites.net`

**✓ Έλεγχος Επιτυχίας**: Θα πρέπει να δείτε JSON έξοδο:
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

### Βήμα 7: Δοκιμή των API Endpoints

**Έλεγχος Υγείας** (επαλήθευση σύνδεσης βάσης δεδομένων):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Αναμενόμενη Απόκριση**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Λίστα Προϊόντων** (δείγματα δεδομένων):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Αναμενόμενη Απόκριση**:
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

**Λήψη Ενός Προϊόντος**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Έλεγχος Επιτυχίας**: Όλα τα endpoints επιστρέφουν δεδομένα JSON χωρίς σφάλματα.

---

**🎉 Συγχαρητήρια!** Έχετε αναπτύξει επιτυχώς μια εφαρμογή ιστού με βάση δεδομένων στο Azure χρησιμοποιώντας το AZD.
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

## Αντιμετώπιση Προβλημάτων

### Συνηθισμένα Προβλήματα και Λύσεις

#### 1. Το `azd provision` αποτυγχάνει με "Η τοποθεσία δεν είναι διαθέσιμη"

**Σύμπτωμα**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Λύση**:
Επιλέξτε διαφορετική περιοχή Azure ή καταχωρίστε τον πάροχο πόρων:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Η σύνδεση SQL αποτυγχάνει κατά την ανάπτυξη

**Σύμπτωμα**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Λύση**:
- Επαληθεύστε ότι το τείχος προστασίας του SQL Server επιτρέπει υπηρεσίες Azure (ρυθμίζεται αυτόματα)
- Ελέγξτε ότι ο κωδικός πρόσβασης διαχειριστή SQL εισήχθη σωστά κατά τη διάρκεια του `azd provision`
- Βεβαιωθείτε ότι ο SQL Server έχει πλήρως δημιουργηθεί (μπορεί να χρειαστούν 2-3 λεπτά)

**Επαλήθευση Σύνδεσης**:
```sh
# Από το Azure Portal, μεταβείτε στο SQL Database → Query editor
# Προσπαθήστε να συνδεθείτε με τα διαπιστευτήριά σας
```

#### 3. Η εφαρμογή Web εμφανίζει "Σφάλμα Εφαρμογής"

**Σύμπτωμα**:
Ο περιηγητής εμφανίζει γενική σελίδα σφάλματος.

**Λύση**:
Ελέγξτε τα αρχεία καταγραφής της εφαρμογής:
```sh
# Προβολή πρόσφατων καταγραφών
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Συνηθισμένες αιτίες**:
- Λείπουν μεταβλητές περιβάλλοντος (ελέγξτε App Service → Configuration)
- Αποτυχία εγκατάστασης πακέτων Python (ελέγξτε τα αρχεία καταγραφής ανάπτυξης)
- Σφάλμα αρχικοποίησης βάσης δεδομένων (ελέγξτε τη σύνδεση SQL)

#### 4. Το `azd deploy` αποτυγχάνει με "Σφάλμα Κατασκευής"

**Σύμπτωμα**:
```
Error: Failed to build project
```

**Λύση**:
- Βεβαιωθείτε ότι το `requirements.txt` δεν έχει συντακτικά λάθη
- Ελέγξτε ότι το Python 3.11 έχει καθοριστεί στο `infra/resources/web-app.bicep`
- Επαληθεύστε ότι το Dockerfile έχει τη σωστή βασική εικόνα

**Εντοπισμός σφαλμάτων τοπικά**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Μη εξουσιοδοτημένος" κατά την εκτέλεση εντολών AZD

**Σύμπτωμα**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Λύση**:
Επανασυνδεθείτε με το Azure:
```sh
azd auth login
az login
```

Επαληθεύστε ότι έχετε τα σωστά δικαιώματα (ρόλος Contributor) στη συνδρομή.

#### 6. Υψηλό κόστος βάσης δεδομένων

**Σύμπτωμα**:
Απροσδόκητος λογαριασμός Azure.

**Λύση**:
- Ελέγξτε αν ξεχάσατε να εκτελέσετε το `azd down` μετά τη δοκιμή
- Επαληθεύστε ότι η βάση δεδομένων SQL χρησιμοποιεί το Basic tier (όχι Premium)
- Εξετάστε τα κόστη στο Azure Cost Management
- Ρυθμίστε ειδοποιήσεις κόστους

### Λήψη Βοήθειας

**Προβολή Όλων των Μεταβλητών Περιβάλλοντος AZD**:
```sh
azd env get-values
```

**Έλεγχος Κατάστασης Ανάπτυξης**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Πρόσβαση στα Αρχεία Καταγραφής Εφαρμογής**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Χρειάζεστε Περισσότερη Βοήθεια;**
- [Οδηγός Αντιμετώπισης Προβλημάτων AZD](../../docs/troubleshooting/common-issues.md)
- [Αντιμετώπιση Προβλημάτων Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Αντιμετώπιση Προβλημάτων Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Πρακτικές Ασκήσεις

### Άσκηση 1: Επαλήθευση της Ανάπτυξής σας (Αρχάριοι)

**Στόχος**: Επιβεβαιώστε ότι όλοι οι πόροι έχουν αναπτυχθεί και η εφαρμογή λειτουργεί.

**Βήματα**:
1. Λίστα όλων των πόρων στην ομάδα πόρων σας:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Αναμενόμενο**: 6-7 πόροι (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Δοκιμάστε όλα τα API endpoints:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Αναμενόμενο**: Όλα επιστρέφουν έγκυρο JSON χωρίς σφάλματα

3. Ελέγξτε το Application Insights:
   - Μεταβείτε στο Application Insights στο Azure Portal
   - Πηγαίνετε στο "Live Metrics"
   - Ανανεώστε τον περιηγητή σας στην εφαρμογή web
   **Αναμενόμενο**: Βλέπετε αιτήματα σε πραγματικό χρόνο

**Κριτήρια Επιτυχίας**: Υπάρχουν όλοι οι 6-7 πόροι, όλα τα endpoints επιστρέφουν δεδομένα, το Live Metrics δείχνει δραστηριότητα.

---

### Άσκηση 2: Προσθήκη Νέου API Endpoint (Μεσαίο Επίπεδο)

**Στόχος**: Επεκτείνετε την εφαρμογή Flask με ένα νέο endpoint.

**Κώδικας Εκκίνησης**: Τρέχοντα endpoints στο `src/web/app.py`

**Βήματα**:
1. Επεξεργαστείτε το `src/web/app.py` και προσθέστε ένα νέο endpoint μετά τη λειτουργία `get_product()`:
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

**Κριτήρια Επιτυχίας**: Το νέο endpoint λειτουργεί, επιστρέφει φιλτραρισμένα αποτελέσματα, εμφανίζεται στα αρχεία καταγραφής του Application Insights.

---

### Άσκηση 3: Προσθήκη Παρακολούθησης και Ειδοποιήσεων (Προχωρημένο)

**Στόχος**: Ρυθμίστε προληπτική παρακολούθηση με ειδοποιήσεις.

**Βήματα**:
1. Δημιουργήστε μια ειδοποίηση για σφάλματα HTTP 500:
   ```sh
   # Λάβετε το αναγνωριστικό πόρου του Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Δημιουργήστε ειδοποίηση
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Προκαλέστε την ειδοποίηση δημιουργώντας σφάλματα:
   ```sh
   # Ζητήστε ένα ανύπαρκτο προϊόν
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Ελέγξτε αν ενεργοποιήθηκε η ειδοποίηση:
   - Azure Portal → Alerts → Alert Rules
   - Ελέγξτε το email σας (αν έχει ρυθμιστεί)

**Κριτήρια Επιτυχίας**: Ο κανόνας ειδοποίησης δημιουργείται, ενεργοποιείται σε σφάλματα, λαμβάνονται ειδοποιήσεις.

---

### Άσκηση 4: Αλλαγές Σχήματος Βάσης Δεδομένων (Προχωρημένο)

**Στόχος**: Προσθέστε έναν νέο πίνακα και τροποποιήστε την εφαρμογή ώστε να τον χρησιμοποιεί.

**Βήματα**:
1. Συνδεθείτε στη βάση δεδομένων SQL μέσω του Azure Portal Query Editor

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

3. Ενημερώστε το `src/web/app.py` ώστε να περιλαμβάνει πληροφορίες κατηγορίας στις απαντήσεις

4. Αναπτύξτε και δοκιμάστε

**Κριτήρια Επιτυχίας**: Ο νέος πίνακας υπάρχει, τα προϊόντα εμφανίζουν πληροφορίες κατηγορίας, η εφαρμογή λειτουργεί ακόμα.

---

### Άσκηση 5: Υλοποίηση Caching (Ειδικός)

**Στόχος**: Προσθέστε Azure Redis Cache για βελτίωση της απόδοσης.

**Βήματα**:
1. Προσθέστε Redis Cache στο `infra/main.bicep`
2. Ενημερώστε το `src/web/app.py` για να αποθηκεύει προσωρινά τα ερωτήματα προϊόντων
3. Μετρήστε τη βελτίωση της απόδοσης με το Application Insights
4. Συγκρίνετε τους χρόνους απόκρισης πριν/μετά την προσωρινή αποθήκευση

**Κριτήρια Επιτυχίας**: Το Redis έχει αναπτυχθεί, η προσωρινή αποθήκευση λειτουργεί, οι χρόνοι απόκρισης βελτιώνονται κατά >50%.

**Υπόδειξη**: Ξεκινήστε με την [τεκμηρίωση Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Καθαρισμός

Για να αποφύγετε συνεχιζόμενες χρεώσεις, διαγράψτε όλους τους πόρους όταν τελειώσετε:

```sh
azd down
```

**Προτροπή επιβεβαίωσης**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Πληκτρολογήστε `y` για επιβεβαίωση.

**✓ Έλεγχος Επιτυχίας**: 
- Όλοι οι πόροι διαγράφονται από το Azure Portal
- Δεν υπάρχουν συνεχιζόμενες χρεώσεις
- Ο τοπικός φάκελος `.azure/<env-name>` μπορεί να διαγραφεί

**Εναλλακτική** (διατηρήστε την υποδομή, διαγράψτε τα δεδομένα):
```sh
# Διαγράψτε μόνο την ομάδα πόρων (διατηρήστε τη διαμόρφωση AZD)
az group delete --name rg-<env-name> --yes
```
## Μάθετε Περισσότερα

### Σχετική Τεκμηρίωση
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Τεκμηρίωση Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)
- [Τεκμηρίωση Azure App Service](https://learn.microsoft.com/azure/app-service/)
- [Τεκμηρίωση Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Αναφορά Γλώσσας Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Επόμενα Βήματα σε Αυτό το Μάθημα
- **[Παράδειγμα Εφαρμογών Container](../../../../examples/container-app)**: Ανάπτυξη μικροϋπηρεσιών με Azure Container Apps
- **[Οδηγός Ενσωμάτωσης AI](../../../../docs/ai-foundry)**: Προσθέστε δυνατότητες AI στην εφαρμογή σας
- **[Βέλτιστες Πρακτικές Ανάπτυξης](../../docs/deployment/deployment-guide.md)**: Πρότυπα ανάπτυξης για παραγωγή

### Προχωρημένα Θέματα
- **Managed Identity**: Αφαιρέστε κωδικούς πρόσβασης και χρησιμοποιήστε έλεγχο ταυτότητας Azure AD
- **Ιδιωτικά Endpoints**: Ασφαλίστε συνδέσεις βάσης δεδομένων μέσα σε εικονικό δίκτυο
- **Ενσωμάτωση CI/CD**: Αυτοματοποιήστε τις αναπτύξεις με GitHub Actions ή Azure DevOps
- **Πολλαπλά Περιβάλλοντα**: Ρυθμίστε περιβάλλοντα ανάπτυξης, staging και παραγωγής
- **Μεταναστεύσεις Βάσης Δεδομένων**: Χρησιμοποιήστε Alembic ή Entity Framework για έκδοση σχήματος

### Σύγκριση με Άλλες Προσεγγίσεις

**AZD vs. ARM Templates**:
- ✅ AZD: Υψηλότερο επίπεδο αφαίρεσης, απλούστερες εντολές
- ⚠️ ARM: Πιο λεπτομερές, μεγαλύτερος έλεγχος

**AZD vs. Terraform**:
- ✅ AZD: Εγγενές στο Azure, ενσωματωμένο με υπηρεσίες Azure
- ⚠️ Terraform: Υποστήριξη πολλαπλών cloud, μεγαλύτερο οικοσύστημα

**AZD vs. Azure Portal**:
- ✅ AZD: Επαναλήψιμο, ελεγχόμενο μέσω έκδοσης, αυτοματοποιήσιμο
- ⚠️ Portal: Χειροκίνητα κλικ, δύσκολο να αναπαραχθεί

**Σκεφτείτε το AZD ως**: Docker Compose για το Azure—απλοποιημένη διαμόρφωση για σύνθετες αναπτύξεις.

---

## Συχνές Ερωτήσεις

**Ε: Μπορώ να χρησιμοποιήσω διαφορετική γλώσσα προγραμματισμού;**  
Α: Ναι! Αντικαταστήστε το `src/web/` με Node.js, C#, Go ή οποιαδήποτε γλώσσα. Ενημερώστε το `azure.yaml` και το Bicep ανάλογα.

**Ε: Πώς μπορώ να προσθέσω περισσότερες βάσεις δεδομένων;**  
Α: Προσθέστε μια άλλη μονάδα SQL Database στο `infra/main.bicep` ή χρησιμοποιήστε PostgreSQL/MySQL από τις υπηρεσίες Azure Database.

**Ε: Μπορώ να το χρησιμοποιήσω για παραγωγή;**  
Α: Αυτό είναι ένα σημείο εκκίνησης. Για παραγωγή, προσθέστε: managed identity, ιδιωτικά endpoints, πλεονασμό, στρατηγική αντιγράφων ασφαλείας, WAF και ενισχυμένη παρακολούθηση.

**Ε: Τι γίνεται αν θέλω να χρησιμοποιήσω containers αντί για ανάπτυξη κώδικα;**  
Α: Δείτε το [Παράδειγμα Εφαρμογών Container](../../../../examples/container-app) που χρησιμοποιεί Docker containers παντού.

**Ε: Πώς μπορώ να συνδεθώ στη βάση δεδομένων από τον τοπικό μου υπολογιστή;**  
Α: Προσθέστε τη διεύθυνση IP σας στο τείχος προστασίας του SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Ε: Μπορώ να χρησιμοποιήσω υπάρχουσα βάση δεδομένων αντί να δημιουργήσω νέα;**  
Α: Ναι, τροποποιήστε το `infra/main.bicep` για να αναφέρεται σε υπάρχον SQL Server και ενημερώστε τις παραμέτρους της συμβολοσειράς σύνδεσης.

---

> **Σημείωση:** Αυτό το παράδειγμα δείχνει βέλτιστες πρακτικές για την ανάπτυξη μιας εφαρμογής web με βάση δεδομένων χρησιμοποιώντας το AZD. Περιλαμβάνει λειτουργικό κώδικα, ολοκληρωμένη τεκμηρίωση και πρακτικές ασκήσεις για την ενίσχυση της μάθησης. Για αναπτύξεις παραγωγής, εξετάστε τις απαιτήσεις ασφαλείας, κλιμάκωσης, συμμόρφωσης και κόστους που είναι συγκεκριμένες για τον οργανισμό σας.

**📚 Πλοήγηση Μαθήματος:**
- ← Προηγούμενο: [Παράδειγμα Εφαρμογών Container](../../../../examples/container-app)
- → Επόμενο: [Οδηγός Ενσωμάτωσης AI](../../../../docs/ai-foundry)
- 🏠 [Αρχική Σελίδα Μαθήματος](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->