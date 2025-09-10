<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:13:07+00:00",
  "source_file": "examples/README.md",
  "language_code": "el"
}
-->
# Παραδείγματα - Πρακτικά Πρότυπα και Ρυθμίσεις AZD

## Εισαγωγή

Αυτός ο φάκελος περιέχει πρακτικά παραδείγματα, πρότυπα και σενάρια πραγματικού κόσμου για να σας βοηθήσει να μάθετε το Azure Developer CLI μέσω πρακτικής εξάσκησης. Κάθε παράδειγμα παρέχει πλήρη λειτουργικό κώδικα, πρότυπα υποδομής και λεπτομερείς οδηγίες για διαφορετικές αρχιτεκτονικές εφαρμογών και μοτίβα ανάπτυξης.

## Στόχοι Μάθησης

Εργαζόμενοι με αυτά τα παραδείγματα, θα:
- Εξασκηθείτε στις ροές εργασίας του Azure Developer CLI με ρεαλιστικά σενάρια εφαρμογών
- Κατανοήσετε διαφορετικές αρχιτεκτονικές εφαρμογών και τις υλοποιήσεις τους με azd
- Μάθετε μοτίβα Υποδομής ως Κώδικα για διάφορες υπηρεσίες Azure
- Εφαρμόσετε στρατηγικές διαχείρισης ρυθμίσεων και ανάπτυξης ανά περιβάλλον
- Υλοποιήσετε μοτίβα παρακολούθησης, ασφάλειας και κλιμάκωσης σε πρακτικά πλαίσια
- Αποκτήσετε εμπειρία με την αντιμετώπιση προβλημάτων και την αποσφαλμάτωση πραγματικών σεναρίων ανάπτυξης

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση αυτών των παραδειγμάτων, θα μπορείτε να:
- Αναπτύξετε διάφορους τύπους εφαρμογών χρησιμοποιώντας το Azure Developer CLI με αυτοπεποίθηση
- Προσαρμόσετε τα παρεχόμενα πρότυπα στις δικές σας απαιτήσεις εφαρμογών
- Σχεδιάσετε και υλοποιήσετε προσαρμοσμένα μοτίβα υποδομής χρησιμοποιώντας Bicep
- Ρυθμίσετε σύνθετες εφαρμογές πολλαπλών υπηρεσιών με σωστές εξαρτήσεις
- Εφαρμόσετε βέλτιστες πρακτικές ασφάλειας, παρακολούθησης και απόδοσης σε πραγματικά σενάρια
- Αντιμετωπίσετε προβλήματα και βελτιστοποιήσετε τις αναπτύξεις βάσει πρακτικής εμπειρίας

## Δομή Φακέλου

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Παραδείγματα Γρήγορης Εκκίνησης

### Για Αρχάριους
1. **[Απλή Εφαρμογή Ιστού - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Αναπτύξτε μια εφαρμογή ιστού Node.js Express με MongoDB
2. **[Στατική Ιστοσελίδα - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Φιλοξενήστε μια στατική ιστοσελίδα React με Azure Static Web Apps
3. **[Εφαρμογή Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Αναπτύξτε μια containerized εφαρμογή Python Flask

### Για Μεσαίους Χρήστες
4. **[Εφαρμογή Βάσης Δεδομένων - C# με Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Εφαρμογή ιστού με API C# και Azure SQL Database
5. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions με HTTP triggers και Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Εφαρμογή πολλαπλών υπηρεσιών Java με Container Apps και API gateway

### Πρότυπα Azure AI Foundry

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Έξυπνη εφαρμογή συνομιλίας με Azure OpenAI
2. **[Επεξεργασία Εγγράφων AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Ανάλυση εγγράφων χρησιμοποιώντας υπηρεσίες Azure AI
3. **[Pipeline Μηχανικής Μάθησης](https://github.com/Azure-Samples/mlops-v2)** - Ροή εργασίας MLOps με Azure Machine Learning

## 📋 Οδηγίες Χρήσης

### Εκτέλεση Παραδειγμάτων Τοπικά

1. **Κλωνοποίηση ή Αντιγραφή Παραδείγματος**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Αρχικοποίηση Περιβάλλοντος AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Ρύθμιση Περιβάλλοντος**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Ανάπτυξη**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Προσαρμογή Παραδειγμάτων

Κάθε παράδειγμα περιλαμβάνει:
- **README.md** - Λεπτομερείς οδηγίες εγκατάστασης και προσαρμογής
- **azure.yaml** - Ρύθμιση AZD με σχόλια
- **infra/** - Πρότυπα Bicep με εξηγήσεις παραμέτρων
- **src/** - Δείγμα κώδικα εφαρμογής
- **scripts/** - Βοηθητικά scripts για κοινές εργασίες

## 🎯 Στόχοι Μάθησης

### Κατηγορίες Παραδειγμάτων

#### **Βασικές Αναπτύξεις**
- Εφαρμογές μίας υπηρεσίας
- Απλά μοτίβα υποδομής
- Βασική διαχείριση ρυθμίσεων
- Οικονομικές ρυθμίσεις ανάπτυξης

#### **Προχωρημένα Σενάρια**
- Αρχιτεκτονικές πολλαπλών υπηρεσιών
- Σύνθετες ρυθμίσεις δικτύου
- Μοτίβα ενσωμάτωσης βάσεων δεδομένων
- Υλοποιήσεις ασφάλειας και συμμόρφωσης

#### **Μοτίβα Έτοιμα για Παραγωγή**
- Ρυθμίσεις υψηλής διαθεσιμότητας
- Παρακολούθηση και παρατηρησιμότητα
- Ενσωμάτωση CI/CD
- Ρυθμίσεις ανάκτησης από καταστροφή

## 📖 Περιγραφές Παραδειγμάτων

### Απλή Εφαρμογή Ιστού - Node.js Express
**Τεχνολογίες**: Node.js, Express, MongoDB, Container Apps  
**Πολυπλοκότητα**: Αρχάριος  
**Έννοιες**: Βασική ανάπτυξη, REST API, ενσωμάτωση NoSQL βάσης δεδομένων

### Στατική Ιστοσελίδα - React SPA
**Τεχνολογίες**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Πολυπλοκότητα**: Αρχάριος  
**Έννοιες**: Στατική φιλοξενία, serverless backend, σύγχρονη ανάπτυξη ιστού

### Εφαρμογή Container - Python Flask
**Τεχνολογίες**: Python Flask, Docker, Container Apps, Container Registry  
**Πολυπλοκότητα**: Αρχάριος  
**Έννοιες**: Containerization, αρχιτεκτονική μικροϋπηρεσιών, ανάπτυξη API

### Εφαρμογή Βάσης Δεδομένων - C# με Azure SQL
**Τεχνολογίες**: C# ASP.NET Core, Azure SQL Database, App Service  
**Πολυπλοκότητα**: Μεσαίος  
**Έννοιες**: Entity Framework, συνδέσεις βάσεων δεδομένων, ανάπτυξη web API

### Serverless Function - Python Azure Functions
**Τεχνολογίες**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Πολυπλοκότητα**: Μεσαίος  
**Έννοιες**: Αρχιτεκτονική βασισμένη σε γεγονότα, serverless computing, ανάπτυξη full-stack

### Microservices - Java Spring Boot
**Τεχνολογίες**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Πολυπλοκότητα**: Μεσαίος  
**Έννοιες**: Επικοινωνία μικροϋπηρεσιών, κατανεμημένα συστήματα, μοτίβα επιχειρησιακής κλίμακας

### Παραδείγματα Azure AI Foundry

#### Azure OpenAI Chat App
**Τεχνολογίες**: Azure OpenAI, Cognitive Search, App Service  
**Πολυπλοκότητα**: Μεσαίος  
**Έννοιες**: Αρχιτεκτονική RAG, αναζήτηση vector, ενσωμάτωση LLM

#### Επεξεργασία Εγγράφων AI
**Τεχνολογίες**: Azure AI Document Intelligence, Storage, Functions  
**Πολυπλοκότητα**: Μεσαίος  
**Έννοιες**: Ανάλυση εγγράφων, OCR, εξαγωγή δεδομένων

#### Pipeline Μηχανικής Μάθησης
**Τεχνολογίες**: Azure ML, MLOps, Container Registry  
**Πολυπλοκότητα**: Προχωρημένος  
**Έννοιες**: Εκπαίδευση μοντέλων, ροές εργασίας ανάπτυξης, παρακολούθηση

## 🛠 Παραδείγματα Ρυθμίσεων

Ο φάκελος `configurations/` περιέχει επαναχρησιμοποιήσιμα στοιχεία:

### Ρυθμίσεις Περιβάλλοντος
- Ρυθμίσεις περιβάλλοντος ανάπτυξης
- Ρυθμίσεις περιβάλλοντος staging
- Ρυθμίσεις έτοιμες για παραγωγή
- Ρυθμίσεις ανάπτυξης πολλαπλών περιοχών

### Μονάδες Bicep
- Επαναχρησιμοποιήσιμα στοιχεία υποδομής
- Κοινά μοτίβα πόρων
- Πρότυπα με αυξημένη ασφάλεια
- Ρυθμίσεις βελτιστοποιημένου κόστους

### Βοηθητικά Scripts
- Αυτοματοποίηση ρύθμισης περιβάλλοντος
- Scripts μετανάστευσης βάσεων δεδομένων
- Εργαλεία επικύρωσης ανάπτυξης
- Εργαλεία παρακολούθησης κόστους

## 🔧 Οδηγός Προσαρμογής

### Προσαρμογή Παραδειγμάτων στις Ανάγκες Σας

1. **Ανασκόπηση Προαπαιτούμενων**
   - Ελέγξτε τις απαιτήσεις υπηρεσιών Azure
   - Επαληθεύστε τα όρια συνδρομής
   - Κατανοήστε τις επιπτώσεις κόστους

2. **Τροποποίηση Ρυθμίσεων**
   - Ενημερώστε τους ορισμούς υπηρεσιών στο `azure.yaml`
   - Προσαρμόστε τα πρότυπα Bicep
   - Ρυθμίστε τις μεταβλητές περιβάλλοντος

3. **Δοκιμή**
   - Αναπτύξτε πρώτα στο περιβάλλον ανάπτυξης
   - Επικυρώστε τη λειτουργικότητα
   - Δοκιμάστε την κλιμάκωση και την απόδοση

4. **Ανασκόπηση Ασφάλειας**
   - Ελέγξτε τους ελέγχους πρόσβασης
   - Υλοποιήστε διαχείριση μυστικών
   - Ενεργοποιήστε την παρακολούθηση και τις ειδοποιήσεις

## 📊 Πίνακας Σύγκρισης

| Παράδειγμα | Υπηρεσίες | Βάση Δεδομένων | Αυθεντικοποίηση | Παρακολούθηση | Πολυπλοκότητα |
|------------|-----------|----------------|------------------|---------------|---------------|
| Node.js Express Todo | 2 | ✅ | Βασική | Βασική | ⭐ |
| React SPA + Functions | 3 | ✅ | Βασική | Πλήρης | ⭐ |
| Python Flask Container | 2 | ❌ | Βασική | Πλήρης | ⭐ |
| C# Web API + SQL | 2 | ✅ | Πλήρης | Πλήρης | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Πλήρης | Πλήρης | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Πλήρης | Πλήρης | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Πλήρης | Πλήρης | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Βασική | Πλήρης | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Πλήρης | Πλήρης | ⭐⭐⭐⭐ |

## 🎓 Διαδρομή Μάθησης

### Συνιστώμενη Πρόοδος

1. **Ξεκινήστε με την Απλή Εφαρμογή Ιστού**
   - Μάθετε βασικές έννοιες AZD
   - Κατανοήστε τη ροή εργασίας ανάπτυξης
   - Εξασκηθείτε στη διαχείριση περιβάλλοντος

2. **Δοκιμάστε τη Στατική Ιστοσελίδα**
   - Εξερευνήστε διαφορετικές επιλογές φιλοξενίας
   - Μάθετε για την ενσωμάτωση CDN
   - Κατανοήστε τη ρύθμιση DNS

3. **Προχωρήστε στην Εφαρμογή Container**
   - Μάθετε βασικά στοιχεία containerization
   - Κατανοήστε έννοιες κλιμάκωσης
   - Εξασκηθείτε με Docker

4. **Προσθέστε Ενσωμάτωση Βάσης Δεδομένων**
   - Μάθετε την παροχή βάσεων δεδομένων
   - Κατανοήστε τις συμβολοσειρές σύνδεσης
   - Εξασκηθείτε στη διαχείριση μυστικών

5. **Εξερευνήστε το Serverless**
   - Κατανοήστε την αρχιτεκτονική βασισμένη σε γεγονότα
   - Μάθετε για triggers και bindings
   - Εξασκηθείτε με APIs

6. **Δημιουργήστε Microservices**
   - Μάθετε την επικοινωνία υπηρεσιών
   - Κατανοήστε κατανεμημένα συστήματα
   - Εξασκηθείτε σε σύνθετες αναπτύξεις

## 🔍 Εύρεση του Κατάλληλου Παραδείγματος

### Ανά Τεχνολογικό Στοίβα
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Microservices
- **Databases**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Ανά Μοτίβο Αρχιτεκτονικής
- **Μονολιθικό**: Node.js Express Todo, C# Web API + SQL
- **Στατικό + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerized**: Python Flask Container App
- **AI-Powered**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Ανά Επίπεδο Πολυπλοκότητας
- **Αρχάριος**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Μεσαίος**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Προχωρημένος**: ML Pipeline

## 📚 Πρόσθετοι Πόροι

### Σύνδεσμοι Τεκμηρίωσης
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Τεκμηρίωση Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Κέντρο Αρχιτεκτονικής Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Παραδείγματα Κοινότητας
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App με C# και Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App με Python και MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App με Node.js και PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App με C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions με Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Βέλτιστες Πρακτικές
- [Πλαίσιο Καλά Αρχιτεκτονημένου Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Πλαίσιο Υιοθέτησης Cloud](https://learn.microsoft.com/en-us

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.