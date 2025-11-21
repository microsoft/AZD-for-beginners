<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9e7f581a238c1bf7f9f31a2ba118a90c",
  "translation_date": "2025-11-21T09:52:22+00:00",
  "source_file": "examples/container-app/simple-flask-api/README.md",
  "language_code": "el"
}
-->
# Απλό Flask API - Παράδειγμα Εφαρμογής Container

**Διαδρομή Μάθησης:** Αρχάριος ⭐ | **Χρόνος:** 25-35 λεπτά | **Κόστος:** $0-15/μήνα

Ένα πλήρες, λειτουργικό Python Flask REST API που έχει αναπτυχθεί στο Azure Container Apps χρησιμοποιώντας το Azure Developer CLI (azd). Αυτό το παράδειγμα δείχνει τη διαδικασία ανάπτυξης container, την αυτόματη κλιμάκωση και τα βασικά της παρακολούθησης.

## 🎯 Τι Θα Μάθετε

- Ανάπτυξη μιας εφαρμογής Python σε container στο Azure
- Ρύθμιση αυτόματης κλιμάκωσης με scale-to-zero
- Εφαρμογή ελέγχων υγείας και ετοιμότητας
- Παρακολούθηση καταγραφών και μετρήσεων εφαρμογής
- Χρήση του Azure Developer CLI για γρήγορη ανάπτυξη

## 📦 Τι Περιλαμβάνεται

✅ **Εφαρμογή Flask** - Πλήρες REST API με λειτουργίες CRUD (`src/app.py`)  
✅ **Dockerfile** - Ρύθμιση container έτοιμη για παραγωγή  
✅ **Υποδομή Bicep** - Περιβάλλον Container Apps και ανάπτυξη API  
✅ **Ρύθμιση AZD** - Ρύθμιση ανάπτυξης με μία εντολή  
✅ **Έλεγχοι Υγείας** - Ρυθμισμένοι έλεγχοι ζωντάνιας και ετοιμότητας  
✅ **Αυτόματη Κλιμάκωση** - 0-10 αντίγραφα βάσει φόρτου HTTP  

## Αρχιτεκτονική

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Προαπαιτούμενα

### Απαιτούμενα
- **Azure Developer CLI (azd)** - [Οδηγός εγκατάστασης](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Συνδρομή Azure** - [Δωρεάν λογαριασμός](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Εγκατάσταση Docker](https://www.docker.com/products/docker-desktop/) (για τοπικές δοκιμές)

### Επαλήθευση Προαπαιτούμενων

```bash
# Ελέγξτε την έκδοση azd (απαιτείται 1.5.0 ή νεότερη)
azd version

# Επαληθεύστε τη σύνδεση στο Azure
azd auth login

# Ελέγξτε το Docker (προαιρετικό, για τοπικές δοκιμές)
docker --version
```

## ⏱️ Χρονοδιάγραμμα Ανάπτυξης

| Φάση | Διάρκεια | Τι Συμβαίνει |
|------|----------|-------------||
| Ρύθμιση περιβάλλοντος | 30 δευτερόλεπτα | Δημιουργία περιβάλλοντος azd |
| Δημιουργία container | 2-3 λεπτά | Δημιουργία Docker για την εφαρμογή Flask |
| Παροχή υποδομής | 3-5 λεπτά | Δημιουργία Container Apps, registry, παρακολούθηση |
| Ανάπτυξη εφαρμογής | 2-3 λεπτά | Αποστολή εικόνας και ανάπτυξη στα Container Apps |
| **Σύνολο** | **8-12 λεπτά** | Ολοκληρωμένη ανάπτυξη έτοιμη |

## Γρήγορη Έναρξη

```bash
# Μεταβείτε στο παράδειγμα
cd examples/container-app/simple-flask-api

# Αρχικοποιήστε το περιβάλλον (επιλέξτε μοναδικό όνομα)
azd env new myflaskapi

# Αναπτύξτε τα πάντα (υποδομή + εφαρμογή)
azd up
# Θα σας ζητηθεί να:
# 1. Επιλέξετε συνδρομή Azure
# 2. Επιλέξετε τοποθεσία (π.χ., eastus2)
# 3. Περιμένετε 8-12 λεπτά για την ανάπτυξη

# Αποκτήστε το τελικό σημείο του API σας
azd env get-values

# Δοκιμάστε το API
curl $(azd env get-value API_ENDPOINT)/health
```

**Αναμενόμενο Αποτέλεσμα:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Επαλήθευση Ανάπτυξης

### Βήμα 1: Έλεγχος Κατάστασης Ανάπτυξης

```bash
# Προβολή αναπτυγμένων υπηρεσιών
azd show

# Η αναμενόμενη έξοδος δείχνει:
# - Υπηρεσία: api
# - Σημείο πρόσβασης: https://ca-api-[env].xxx.azurecontainerapps.io
# - Κατάσταση: Σε λειτουργία
```

### Βήμα 2: Δοκιμή Σημείων Τέλους API

```bash
# Λάβετε το API endpoint
API_URL=$(azd env get-value API_ENDPOINT)

# Δοκιμή υγείας
curl $API_URL/health

# Δοκιμή του root endpoint
curl $API_URL/

# Δημιουργία αντικειμένου
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Λάβετε όλα τα αντικείμενα
curl $API_URL/api/items
```

**Κριτήρια Επιτυχίας:**
- ✅ Το σημείο υγείας επιστρέφει HTTP 200
- ✅ Το κύριο σημείο δείχνει πληροφορίες API
- ✅ Το POST δημιουργεί αντικείμενο και επιστρέφει HTTP 201
- ✅ Το GET επιστρέφει δημιουργημένα αντικείμενα

### Βήμα 3: Προβολή Καταγραφών

```bash
# Ροή ζωντανών καταγραφών
azd logs api --follow

# Θα πρέπει να δείτε:
# - Μηνύματα εκκίνησης Gunicorn
# - Καταγραφές αιτημάτων HTTP
# - Καταγραφές πληροφοριών εφαρμογής
```

## Δομή Έργου

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## Σημεία Τέλους API

| Σημείο Τέλους | Μέθοδος | Περιγραφή |
|---------------|---------|-----------|
| `/health` | GET | Έλεγχος υγείας |
| `/api/items` | GET | Λίστα όλων των αντικειμένων |
| `/api/items` | POST | Δημιουργία νέου αντικειμένου |
| `/api/items/{id}` | GET | Λήψη συγκεκριμένου αντικειμένου |
| `/api/items/{id}` | PUT | Ενημέρωση αντικειμένου |
| `/api/items/{id}` | DELETE | Διαγραφή αντικειμένου |

## Ρύθμιση

### Μεταβλητές Περιβάλλοντος

```bash
# Ορίστε προσαρμοσμένη διαμόρφωση
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Ρύθμιση Κλιμάκωσης

Το API κλιμακώνεται αυτόματα βάσει της κίνησης HTTP:
- **Ελάχιστα Αντίγραφα**: 0 (κλιμακώνεται στο μηδέν όταν είναι ανενεργό)
- **Μέγιστα Αντίγραφα**: 10
- **Συγχρονισμένα Αιτήματα ανά Αντίγραφο**: 50

## Ανάπτυξη

### Τοπική Εκτέλεση

```bash
# Εγκαταστήστε τις εξαρτήσεις
cd src
pip install -r requirements.txt

# Εκτελέστε την εφαρμογή
python app.py

# Δοκιμάστε τοπικά
curl http://localhost:8000/health
```

### Δημιουργία και Δοκιμή Container

```bash
# Δημιουργία εικόνας Docker
docker build -t flask-api:local ./src

# Εκτέλεση κοντέινερ τοπικά
docker run -p 8000:8000 flask-api:local

# Δοκιμή κοντέινερ
curl http://localhost:8000/health
```

## Ανάπτυξη

### Πλήρης Ανάπτυξη

```bash
# Ανάπτυξη υποδομής και εφαρμογής
azd up
```

### Ανάπτυξη Μόνο Κώδικα

```bash
# Αναπτύξτε μόνο τον κώδικα εφαρμογής (η υποδομή παραμένει αμετάβλητη)
azd deploy api
```

### Ενημέρωση Ρύθμισης

```bash
# Ενημέρωση μεταβλητών περιβάλλοντος
azd env set API_KEY "new-api-key"

# Επαναδιάθεση με νέα διαμόρφωση
azd deploy api
```

## Παρακολούθηση

### Προβολή Καταγραφών

```bash
# Ροή ζωντανών καταγραφών
azd logs api --follow

# Προβολή τελευταίων 100 γραμμών
azd logs api --tail 100
```

### Παρακολούθηση Μετρήσεων

```bash
# Άνοιγμα του πίνακα ελέγχου του Azure Monitor
azd monitor --overview

# Προβολή συγκεκριμένων μετρήσεων
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Δοκιμές

### Έλεγχος Υγείας

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Αναμενόμενη απάντηση:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Δημιουργία Αντικειμένου

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Λήψη Όλων των Αντικειμένων

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Βελτιστοποίηση Κόστους

Αυτή η ανάπτυξη χρησιμοποιεί scale-to-zero, οπότε πληρώνετε μόνο όταν το API επεξεργάζεται αιτήματα:

- **Κόστος αδράνειας**: ~$0/μήνα (κλιμακώνεται στο μηδέν)
- **Κόστος ενεργού**: ~$0.000024/δευτερόλεπτο ανά αντίγραφο
- **Αναμενόμενο μηνιαίο κόστος** (ελαφριά χρήση): $5-15

### Μείωση Κόστους Περισσότερο

```bash
# Μειώστε τον μέγιστο αριθμό αντιγράφων για ανάπτυξη
azd env set MAX_REPLICAS 3

# Χρησιμοποιήστε μικρότερο χρόνο αδράνειας
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 λεπτά
```

## Αντιμετώπιση Προβλημάτων

### Το Container Δεν Ξεκινά

```bash
# Ελέγξτε τα αρχεία καταγραφής του κοντέινερ
azd logs api --tail 100

# Επαληθεύστε ότι οι εικόνες Docker δημιουργούνται τοπικά
docker build -t test ./src
```

### Το API Δεν Είναι Προσβάσιμο

```bash
# Επαληθεύστε ότι η εισροή είναι εξωτερική
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Υψηλοί Χρόνοι Απόκρισης

```bash
# Ελέγξτε τη χρήση CPU/Μνήμης
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Αυξήστε τους πόρους αν χρειαστεί
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Καθαρισμός

```bash
# Διαγραφή όλων των πόρων
azd down --force --purge
```

## Επόμενα Βήματα

### Επέκταση Αυτού του Παραδείγματος

1. **Προσθήκη Βάσης Δεδομένων** - Ενσωμάτωση Azure Cosmos DB ή SQL Database
   ```bash
   # Προσθέστε τη μονάδα Cosmos DB στο infra/main.bicep
   # Ενημερώστε το app.py με τη σύνδεση βάσης δεδομένων
   ```

2. **Προσθήκη Αυθεντικοποίησης** - Εφαρμογή Azure AD ή κλειδιών API
   ```python
   # Προσθέστε το middleware αυθεντικοποίησης στο app.py
   from functools import wraps
   ```

3. **Ρύθμιση CI/CD** - Ροή εργασίας GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Προσθήκη Διαχειριζόμενης Ταυτότητας** - Ασφαλής πρόσβαση σε υπηρεσίες Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Σχετικά Παραδείγματα

- **[Εφαρμογή Βάσης Δεδομένων](../../../../../examples/database-app)** - Πλήρες παράδειγμα με SQL Database
- **[Μικροϋπηρεσίες](../../../../../examples/container-app/microservices)** - Αρχιτεκτονική πολλαπλών υπηρεσιών
- **[Οδηγός Container Apps](../README.md)** - Όλα τα μοτίβα container

### Πόροι Μάθησης

- 📚 [Μάθημα AZD για Αρχάριους](../../../README.md) - Κεντρικό μάθημα
- 📚 [Μοτίβα Container Apps](../README.md) - Περισσότερα μοτίβα ανάπτυξης
- 📚 [Συλλογή Προτύπων AZD](https://azure.github.io/awesome-azd/) - Πρότυπα κοινότητας

## Πρόσθετοι Πόροι

### Τεκμηρίωση
- **[Τεκμηρίωση Flask](https://flask.palletsprojects.com/)** - Οδηγός πλαισίου Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Επίσημη τεκμηρίωση Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Αναφορά εντολών azd

### Σεμινάρια
- **[Γρήγορη Έναρξη Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Ανάπτυξη της πρώτης εφαρμογής σας
- **[Python στο Azure](https://learn.microsoft.com/azure/developer/python/)** - Οδηγός ανάπτυξης Python
- **[Γλώσσα Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Υποδομή ως κώδικας

### Εργαλεία
- **[Azure Portal](https://portal.azure.com)** - Οπτική διαχείριση πόρων
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Ενσωμάτωση IDE

---

**🎉 Συγχαρητήρια!** Έχετε αναπτύξει ένα Flask API έτοιμο για παραγωγή στο Azure Container Apps με αυτόματη κλιμάκωση και παρακολούθηση.

**Ερωτήσεις;** [Ανοίξτε ένα ζήτημα](https://github.com/microsoft/AZD-for-beginners/issues) ή δείτε το [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->