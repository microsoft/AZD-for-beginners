# Απλό Flask API - Παράδειγμα Container App

**Μονοπάτι Μάθησης:** Αρχάριος ⭐ | **Χρόνος:** 25-35 λεπτά | **Κόστος:** $0-15/μήνα

Ένα πλήρες, λειτουργικό Python Flask REST API αναπτυγμένο σε Azure Container Apps χρησιμοποιώντας το Azure Developer CLI (azd). Αυτό το παράδειγμα δείχνει την ανάπτυξη κοντέινερ, την αυτόματη κλιμάκωση και τα βασικά της παρακολούθησης.

## 🎯 Τι θα μάθετε

- Αναπτύξτε μια εφαρμογή Python σε container στο Azure
- Διαμορφώστε αυτόματη κλιμάκωση με scale-to-zero
- Υλοποιήστε probes υγείας και readiness checks
- Παρακολουθήστε logs και μετρικές εφαρμογής
- Χρησιμοποιήστε το Azure Developer CLI για γρήγορη ανάπτυξη

## 📦 Τι περιλαμβάνεται

✅ **Flask Application** - Πλήρες REST API με λειτουργίες CRUD (`src/app.py`)  
✅ **Dockerfile** - Διαμόρφωση container έτοιμη για παραγωγή  
✅ **Bicep Infrastructure** - Περιβάλλον Container Apps και ανάπτυξη API  
✅ **AZD Configuration** - Ρύθμιση ανάπτυξης με μία εντολή  
✅ **Health Probes** - Ρυθμίσεις liveness και readiness  
✅ **Auto-scaling** - 0-10 αντίγραφα με βάση το HTTP φορτίο  

## Architecture

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

## Prerequisites

### Απαιτούμενα
- **Azure Developer CLI (azd)** - [Οδηγός εγκατάστασης](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [Δωρεάν λογαριασμός](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Εγκατάσταση Docker](https://www.docker.com/products/docker-desktop/) (για τοπικό testing)

### Επαλήθευση απαιτήσεων

```bash
# Ελέγξτε την έκδοση του azd (απαιτείται 1.5.0 ή νεότερη)
azd version

# Επιβεβαιώστε τη σύνδεση στο Azure
azd auth login

# Ελέγξτε το Docker (προαιρετικό, για τοπικές δοκιμές)
docker --version
```

## ⏱️ Χρονοδιάγραμμα ανάπτυξης

| Phase | Duration | What Happens |
|-------|----------|--------------||
| Environment setup | 30 seconds | Create azd environment |
| Build container | 2-3 minutes | Docker build Flask app |
| Provision infrastructure | 3-5 minutes | Create Container Apps, registry, monitoring |
| Deploy application | 2-3 minutes | Push image and deploy to Container Apps |
| **Total** | **8-12 minutes** | Complete deployment ready |

## Γρήγορη εκκίνηση

```bash
# Μεταβείτε στο παράδειγμα
cd examples/container-app/simple-flask-api

# Αρχικοποιήστε το περιβάλλον (επιλέξτε μοναδικό όνομα)
azd env new myflaskapi

# Αναπτύξτε τα πάντα (υποδομή + εφαρμογή)
azd up
# Θα σας ζητηθεί να:
# 1. Επιλέξτε συνδρομή Azure
# 2. Επιλέξτε τοποθεσία (π.χ., eastus2)
# 3. Περιμένετε 8-12 λεπτά για την ανάπτυξη

# Λάβετε το endpoint του API σας
azd env get-values

# Δοκιμάστε το API
curl $(azd env get-value API_ENDPOINT)/health
```

**Αναμενόμενο αποτέλεσμα:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Επαλήθευση ανάπτυξης

### Βήμα 1: Έλεγχος κατάστασης ανάπτυξης

```bash
# Προβολή αναπτυγμένων υπηρεσιών
azd show

# Η αναμενόμενη έξοδος δείχνει:
# - Υπηρεσία: api
# - Τερματικό σημείο: https://ca-api-[env].xxx.azurecontainerapps.io
# - Κατάσταση: Σε λειτουργία
```

### Βήμα 2: Δοκιμή τελικών σημείων API

```bash
# Λήψη endpoint API
API_URL=$(azd env get-value API_ENDPOINT)

# Έλεγχος υγείας
curl $API_URL/health

# Έλεγχος ριζικού endpoint
curl $API_URL/

# Δημιουργία αντικειμένου
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Λήψη όλων των αντικειμένων
curl $API_URL/api/items
```

**Κριτήρια επιτυχίας:**
- ✅ Το /health endpoint επιστρέφει HTTP 200
- ✅ Το root endpoint εμφανίζει πληροφορίες API
- ✅ Η μέθοδος POST δημιουργεί στοιχείο και επιστρέφει HTTP 201
- ✅ Η μέθοδος GET επιστρέφει τα δημιουργημένα στοιχεία

### Βήμα 3: Προβολή καταγραφών

```bash
# Παρακολουθήστε σε πραγματικό χρόνο τα αρχεία καταγραφής χρησιμοποιώντας azd monitor
azd monitor --logs

# Ή χρησιμοποιήστε το Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Θα πρέπει να δείτε:
# - Μηνύματα εκκίνησης του Gunicorn
# - Καταγραφές αιτήσεων HTTP
# - Καταγραφές πληροφοριών εφαρμογής
```

## Δομή έργου

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

## Τερματικά API

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Έλεγχος υγείας |
| `/api/items` | GET | Λίστα όλων των στοιχείων |
| `/api/items` | POST | Δημιουργία νέου στοιχείου |
| `/api/items/{id}` | GET | Λήψη συγκεκριμένου στοιχείου |
| `/api/items/{id}` | PUT | Ενημέρωση στοιχείου |
| `/api/items/{id}` | DELETE | Διαγραφή στοιχείου |

## Διαμόρφωση

### Μεταβλητές περιβάλλοντος

```bash
# Ορίστε προσαρμοσμένη διαμόρφωση
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Ρύθμιση κλιμάκωσης

Το API κλιμακώνεται αυτόματα με βάση την κίνηση HTTP:
- **Ελάχιστα αντίγραφα**: 0 (κλιμακώνεται στο μηδέν όταν είναι αδρανές)
- **Μέγιστα αντίγραφα**: 10
- **Ταυτόχρονες αιτήσεις ανά αντίγραφο**: 50

## Ανάπτυξη

### Εκτέλεση τοπικά

```bash
# Εγκαταστήστε τις εξαρτήσεις
cd src
pip install -r requirements.txt

# Εκτελέστε την εφαρμογή
python app.py

# Δοκιμάστε το τοπικά
curl http://localhost:8000/health
```

### Δημιουργία και δοκιμή κοντέινερ

```bash
# Δημιουργία εικόνας Docker
docker build -t flask-api:local ./src

# Εκτέλεση κοντέινερ τοπικά
docker run -p 8000:8000 flask-api:local

# Δοκιμή κοντέινερ
curl http://localhost:8000/health
```

## Ανάπτυξη

### Πλήρης ανάπτυξη

```bash
# Ανάπτυξη υποδομής και εφαρμογής
azd up
```

### Ανάπτυξη μόνο του κώδικα

```bash
# Αναπτύξτε μόνο τον κώδικα της εφαρμογής (η υποδομή παραμένει αμετάβλητη)
azd deploy api
```

### Ενημέρωση διαμόρφωσης

```bash
# Ενημερώστε τις μεταβλητές περιβάλλοντος
azd env set API_KEY "new-api-key"

# Αναπτύξτε ξανά με τη νέα διαμόρφωση
azd deploy api
```

## Παρακολούθηση

### Προβολή καταγραφών

```bash
# Μεταδώστε ζωντανά αρχεία καταγραφής χρησιμοποιώντας το azd monitor
azd monitor --logs

# Ή χρησιμοποιήστε το Azure CLI για Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Προβολή των τελευταίων 100 γραμμών
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Παρακολούθηση μετρήσεων

```bash
# Άνοιγμα πίνακα ελέγχου Azure Monitor
azd monitor --overview

# Προβολή συγκεκριμένων μετρήσεων
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Δοκιμές

### Έλεγχος υγείας

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Αναμενόμενη απόκριση:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Δημιουργία στοιχείου

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Λήψη όλων των στοιχείων

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Βελτιστοποίηση κόστους

Αυτή η ανάπτυξη χρησιμοποιεί κλιμάκωση στο μηδέν, οπότε πληρώνετε μόνο όταν το API επεξεργάζεται αιτήσεις:

- **Κόστος αδράνειας**: περίπου $0/μήνα (κλιμακώθηκε στο μηδέν)
- **Ενεργό κόστος**: περίπου $0.000024/δευτερόλεπτο ανά αντίγραφο
- **Αναμενόμενο μηνιαίο κόστος** (ελαφριά χρήση): $5-15

### Μείωση κόστους περαιτέρω

```bash
# Μειώστε τον μέγιστο αριθμό αντιγράφων για το περιβάλλον ανάπτυξης
azd env set MAX_REPLICAS 3

# Χρησιμοποιήστε μικρότερο χρονικό όριο αδράνειας
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 λεπτά
```

## Αντιμετώπιση προβλημάτων

### Το container δεν ξεκινά

```bash
# Ελέγξτε τα αρχεία καταγραφής του κοντέινερ χρησιμοποιώντας το Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Επαληθεύστε ότι η εικόνα Docker χτίζεται τοπικά
docker build -t test ./src
```

### Το API δεν είναι προσβάσιμο

```bash
# Επιβεβαιώστε ότι το ingress είναι εξωτερικό
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Υψηλοί χρόνοι απόκρισης

```bash
# Ελέγξτε τη χρήση της CPU/μνήμης
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Αυξήστε τους πόρους αν χρειάζεται
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Καθαρισμός

```bash
# Διαγράψτε όλους τους πόρους
azd down --force --purge
```

## Επόμενα βήματα

### Επέκταση αυτού του παραδείγματος

1. **Προσθήκη βάσης δεδομένων** - Ενσωμάτωση Azure Cosmos DB ή SQL Database
   ```bash
   # Προσθήκη μονάδας Cosmos DB στο infra/main.bicep
   # Ενημέρωση του app.py με τη σύνδεση στη βάση δεδομένων
   ```

2. **Προσθήκη ελέγχου ταυτότητας** - Εφαρμογή Azure AD ή κλειδιών API
   ```python
   # Προσθέστε middleware αυθεντικοποίησης στο app.py
   from functools import wraps
   ```

3. **Ρύθμιση CI/CD** - Ροή εργασιών GitHub Actions
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Προσθήκη Διαχειριζόμενης ταυτότητας** - Ασφαλής πρόσβαση σε υπηρεσίες Azure
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Σχετικά παραδείγματα

- **[Database App](../../../../../examples/database-app)** - Πλήρες παράδειγμα με SQL Database
- **[Microservices](../../../../../examples/container-app/microservices)** - Αρχιτεκτονική πολλαπλών υπηρεσιών
- **[Container Apps Master Guide](../README.md)** - Όλα τα πρότυπα container

### Πόροι μάθησης

- 📚 [AZD For Beginners Course](../../../README.md) - Κεντρική σελίδα του μαθήματος
- 📚 [Container Apps Patterns](../README.md) - Περισσότερα πρότυπα ανάπτυξης
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - Πρότυπα της κοινότητας

## Πρόσθετοι πόροι

### Τεκμηρίωση
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Οδηγός του πλαισίου Flask
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Επίσημη τεκμηρίωση Azure
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Αναφορά εντολών azd

### Οδηγοί
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Αναπτύξτε την πρώτη σας εφαρμογή
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Οδηγός ανάπτυξης Python
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infrastructure as code

### Εργαλεία
- **[Azure Portal](https://portal.azure.com)** - Διαχείριση πόρων οπτικά
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Ενσωμάτωση IDE

---

**🎉 Συγχαρητήρια!** Έχετε αναπτύξει ένα έτοιμο για παραγωγή Flask API σε Azure Container Apps με αυτόματη κλιμάκωση και παρακολούθηση.

**Έχετε ερωτήσεις;** [Ανοίξτε ένα θέμα](https://github.com/microsoft/AZD-for-beginners/issues) ή δείτε τις [Συχνές Ερωτήσεις](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Το παρόν έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη Co-op Translator (https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για την ακρίβεια, να λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται ως η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από ανθρώπινο μεταφραστή. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->