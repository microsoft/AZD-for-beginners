<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-21T06:27:39+00:00",
  "source_file": "examples/README.md",
  "language_code": "el"
}
-->
# Παραδείγματα - Πρακτικά Πρότυπα και Ρυθμίσεις AZD

**Μάθηση μέσω Παραδειγμάτων - Οργανωμένα ανά Κεφάλαιο**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../README.md)
- **📖 Χαρτογράφηση Κεφαλαίων**: Παραδείγματα οργανωμένα ανά επίπεδο δυσκολίας
- **🚀 Τοπικό Παράδειγμα**: [Λύση Λιανικής με Πολλαπλούς Πράκτορες](retail-scenario.md)
- **🤖 Εξωτερικά Παραδείγματα AI**: Σύνδεσμοι σε αποθετήρια Azure Samples

> **📍 ΣΗΜΑΝΤΙΚΟ: Τοπικά vs Εξωτερικά Παραδείγματα**  
> Αυτό το αποθετήριο περιέχει **4 πλήρη τοπικά παραδείγματα** με ολοκληρωμένες υλοποιήσεις:  
> - **Azure OpenAI Chat** (Ανάπτυξη GPT-4 με διεπαφή συνομιλίας)  
> - **Container Apps** (Απλό Flask API + Μικροϋπηρεσίες)  
> - **Database App** (Web + SQL Database)  
> - **Retail Multi-Agent** (Λύση AI για Επιχειρήσεις)  
>  
> Πρόσθετα παραδείγματα είναι **εξωτερικές αναφορές** σε αποθετήρια Azure-Samples που μπορείτε να κλωνοποιήσετε.

## Εισαγωγή

Αυτός ο κατάλογος παρέχει πρακτικά παραδείγματα και αναφορές για να μάθετε το Azure Developer CLI μέσω πρακτικής εξάσκησης. Το σενάριο Retail Multi-Agent είναι μια πλήρης, έτοιμη για παραγωγή υλοποίηση που περιλαμβάνεται σε αυτό το αποθετήριο. Πρόσθετα παραδείγματα αναφέρονται σε επίσημα Azure Samples που παρουσιάζουν διάφορα πρότυπα AZD.

### Θρύλος Βαθμολογίας Πολυπλοκότητας

- ⭐ **Αρχάριος** - Βασικές έννοιες, μία υπηρεσία, 15-30 λεπτά
- ⭐⭐ **Μεσαίο** - Πολλαπλές υπηρεσίες, ενσωμάτωση βάσης δεδομένων, 30-60 λεπτά
- ⭐⭐⭐ **Προχωρημένο** - Πολύπλοκη αρχιτεκτονική, ενσωμάτωση AI, 1-2 ώρες
- ⭐⭐⭐⭐ **Ειδικός** - Έτοιμο για παραγωγή, πρότυπα επιχειρήσεων, 2+ ώρες

## 🎯 Τι Περιλαμβάνει Αυτό το Αποθετήριο

### ✅ Τοπική Υλοποίηση (Έτοιμη για Χρήση)

#### [Εφαρμογή Συνομιλίας Azure OpenAI](azure-openai-chat/README.md) 🆕
**Πλήρης ανάπτυξη GPT-4 με διεπαφή συνομιλίας που περιλαμβάνεται σε αυτό το αποθετήριο**

- **Τοποθεσία:** `examples/azure-openai-chat/`
- **Πολυπλοκότητα:** ⭐⭐ (Μεσαίο)
- **Τι Περιλαμβάνει:**
  - Πλήρης ανάπτυξη Azure OpenAI (GPT-4)
  - Διεπαφή συνομιλίας γραμμής εντολών Python
  - Ενσωμάτωση Key Vault για ασφαλή API keys
  - Πρότυπα υποδομής Bicep
  - Παρακολούθηση χρήσης token και κόστους
  - Περιορισμός ρυθμού και διαχείριση σφαλμάτων

**Γρήγορη Εκκίνηση:**
```bash
# Μεταβείτε στο παράδειγμα
cd examples/azure-openai-chat

# Αναπτύξτε τα πάντα
azd up

# Εγκαταστήστε τις εξαρτήσεις και ξεκινήστε τη συνομιλία
pip install -r src/requirements.txt
python src/chat.py
```

**Τεχνολογίες:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Παραδείγματα Εφαρμογών Container](container-app/README.md) 🆕
**Ολοκληρωμένα παραδείγματα ανάπτυξης container που περιλαμβάνονται σε αυτό το αποθετήριο**

- **Τοποθεσία:** `examples/container-app/`
- **Πολυπλοκότητα:** ⭐-⭐⭐⭐⭐ (Αρχάριος έως Ειδικός)
- **Τι Περιλαμβάνει:**
  - [Κύριος Οδηγός](container-app/README.md) - Πλήρης επισκόπηση των αναπτύξεων container
  - [Απλό Flask API](../../../examples/container-app/simple-flask-api) - Βασικό παράδειγμα REST API
  - [Αρχιτεκτονική Μικροϋπηρεσιών](../../../examples/container-app/microservices) - Έτοιμη για παραγωγή ανάπτυξη πολλαπλών υπηρεσιών
  - Γρήγορη Εκκίνηση, Παραγωγή και Προχωρημένα πρότυπα
  - Παρακολούθηση, ασφάλεια και βελτιστοποίηση κόστους

**Γρήγορη Εκκίνηση:**
```bash
# Προβολή κύριου οδηγού
cd examples/container-app

# Ανάπτυξη απλού Flask API
cd simple-flask-api
azd up

# Ανάπτυξη παραδείγματος μικροϋπηρεσιών
cd ../microservices
azd up
```

**Τεχνολογίες:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Λύση Λιανικής με Πολλαπλούς Πράκτορες](retail-scenario.md) 🆕
**Πλήρης υλοποίηση έτοιμη για παραγωγή που περιλαμβάνεται σε αυτό το αποθετήριο**

- **Τοποθεσία:** `examples/retail-multiagent-arm-template/`
- **Πολυπλοκότητα:** ⭐⭐⭐⭐ (Προχωρημένο)
- **Τι Περιλαμβάνει:**
  - Πλήρες πρότυπο ανάπτυξης ARM
  - Αρχιτεκτονική πολλαπλών πρακτόρων (Πελάτης + Απόθεμα)
  - Ενσωμάτωση Azure OpenAI
  - AI Αναζήτηση με RAG
  - Ολοκληρωμένη παρακολούθηση
  - Σενάριο ανάπτυξης με ένα κλικ

**Γρήγορη Εκκίνηση:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Τεχνολογίες:** Azure OpenAI, AI Αναζήτηση, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Εξωτερικά Παραδείγματα Azure Samples (Κλωνοποίηση για Χρήση)

Τα παρακάτω παραδείγματα διατηρούνται σε επίσημα αποθετήρια Azure-Samples. Κλωνοποιήστε τα για να εξερευνήσετε διαφορετικά πρότυπα AZD:

### Απλές Εφαρμογές (Κεφάλαια 1-2)

| Πρότυπο | Αποθετήριο | Πολυπλοκότητα | Υπηρεσίες |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Τοπικό: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Μικροϋπηρεσίες** | [Τοπικό: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Πολλαπλές υπηρεσίες, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Πώς να το χρησιμοποιήσετε:**
```bash
# Κλωνοποιήστε οποιοδήποτε παράδειγμα
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Ανάπτυξη
azd up
```

### Παραδείγματα Εφαρμογών AI (Κεφάλαια 2, 5, 8)

| Πρότυπο | Αποθετήριο | Πολυπλοκότητα | Εστίαση |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Τοπικό: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Ανάπτυξη GPT-4 |
| **Γρήγορη Εκκίνηση AI Chat** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Βασικό AI chat |
| **AI Πράκτορες** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Πλαίσιο πρακτόρων |
| **Demo Αναζήτησης + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Πρότυπο RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI για Επιχειρήσεις |

### Βάσεις Δεδομένων & Προχωρημένα Πρότυπα (Κεφάλαια 3-8)

| Πρότυπο | Αποθετήριο | Πολυπλοκότητα | Εστίαση |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Ενσωμάτωση βάσης δεδομένων |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Μικροϋπηρεσίες** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Πολλαπλές υπηρεσίες |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Στόχοι Μάθησης

Εργαζόμενοι με αυτά τα παραδείγματα, θα:
- Εξασκηθείτε στις ροές εργασίας του Azure Developer CLI με ρεαλιστικά σενάρια εφαρμογών
- Κατανοήσετε διαφορετικές αρχιτεκτονικές εφαρμογών και τις υλοποιήσεις τους με azd
- Μάθετε πρότυπα Infrastructure as Code για διάφορες υπηρεσίες Azure
- Εφαρμόσετε διαχείριση ρυθμίσεων και στρατηγικές ανάπτυξης ανά περιβάλλον
- Υλοποιήσετε πρότυπα παρακολούθησης, ασφάλειας και κλιμάκωσης σε πρακτικά πλαίσια
- Αποκτήσετε εμπειρία με την αντιμετώπιση προβλημάτων και την αποσφαλμάτωση πραγματικών σεναρίων ανάπτυξης

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση αυτών των παραδειγμάτων, θα μπορείτε να:
- Αναπτύσσετε διάφορους τύπους εφαρμογών χρησιμοποιώντας το Azure Developer CLI με αυτοπεποίθηση
- Προσαρμόζετε τα παρεχόμενα πρότυπα στις δικές σας απαιτήσεις εφαρμογών
- Σχεδιάζετε και υλοποιείτε προσαρμοσμένα πρότυπα υποδομής χρησιμοποιώντας Bicep
- Ρυθμίζετε πολύπλοκες εφαρμογές πολλαπλών υπηρεσιών με σωστές εξαρτήσεις
- Εφαρμόζετε βέλτιστες πρακτικές ασφάλειας, παρακολούθησης και απόδοσης σε πραγματικά σενάρια
- Αντιμετωπίζετε προβλήματα και βελτιστοποιείτε αναπτύξεις βάσει πρακτικής εμπειρίας

## Δομή Καταλόγου

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

> **💡 Νέοι στο AZD;** Ξεκινήστε με το παράδειγμα #1 (Flask API) - διαρκεί ~20 λεπτά και διδάσκει βασικές έννοιες.

### Για Αρχάριους
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Τοπικό) ⭐  
   Αναπτύξτε ένα απλό REST API με δυνατότητα scale-to-zero  
   **Χρόνος:** 20-25 λεπτά | **Κόστος:** $0-5/μήνα  
   **Θα Μάθετε:** Βασική ροή εργασίας azd, containerization, health probes  
   **Αναμενόμενο Αποτέλεσμα:** Λειτουργικό API endpoint που επιστρέφει "Hello, World!" με παρακολούθηση

2. **[Απλή Web Εφαρμογή - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Αναπτύξτε μια web εφαρμογή Node.js Express με MongoDB  
   **Χρόνος:** 25-35 λεπτά | **Κόστος:** $10-30/μήνα  
   **Θα Μάθετε:** Ενσωμάτωση βάσης δεδομένων, μεταβλητές περιβάλλοντος, connection strings  
   **Αναμενόμενο Αποτέλεσμα:** Εφαρμογή λίστας εργασιών με λειτουργίες δημιουργίας/ανάγνωσης/ενημέρωσης/διαγραφής

3. **[Στατική Ιστοσελίδα - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Φιλοξενήστε μια στατική ιστοσελίδα React με Azure Static Web Apps  
   **Χρόνος:** 20-30 λεπτά | **Κόστος:** $0-10/μήνα  
   **Θα Μάθετε:** Στατική φιλοξενία, serverless functions, ανάπτυξη CDN  
   **Αναμενόμενο Αποτέλεσμα:** React UI με API backend, αυτόματο SSL, παγκόσμιο CDN

### Για Μεσαίους Χρήστες
4. **[Εφαρμογή Συνομιλίας Azure OpenAI](../../../examples/azure-openai-chat)** (Τοπικό) ⭐⭐  
   Αναπτύξτε GPT-4 με διεπαφή συνομιλίας και ασφαλή διαχείριση API key  
   **Χρόνος:** 35-45 λεπτά | **Κόστος:** $50-200/μήνα  
   **Θα Μάθετε:** Ανάπτυξη Azure OpenAI, ενσωμάτωση Key Vault, παρακολούθηση token  
   **Αναμενόμενο Αποτέλεσμα:** Λειτουργική εφαρμογή συνομιλίας με GPT-4 και παρακολούθηση κόστους

5. **[Container App - Μικροϋπηρεσίες](../../../examples/container-app/microservices)** (Τοπικό) ⭐⭐⭐⭐  
   Αρχιτεκτονική πολλαπλών υπηρεσιών έτοιμη για παραγωγή  
   **Χρόνος:** 45-60 λεπτά | **Κόστος:** $50-150/μήνα  
   **Θα Μάθετε:** Επικοινωνία υπηρεσιών, ουρές μηνυμάτων, κατανεμημένη ιχνηλάτηση  
   **Αναμενόμενο Αποτέλεσμα:** Σύστημα 2 υπηρεσιών (API Gateway + Υπηρεσία Προϊόντων) με παρακολούθηση

6. **[Εφαρμογή Βάσης Δεδομένων - C# με Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web εφαρμογή με C# API και Azure SQL Database  
   **Χρόνος:** 30-45 λεπτά | **Κόστος:** $20-80/μήνα  
   **Θα Μάθετε:** Entity Framework, μεταναστεύσεις βάσης δεδομένων, ασφάλεια συνδέσεων  
   **Αναμενόμενο Αποτέλεσμα:** C# API με Azure SQL backend, αυτόματη ανάπτυξη σχήματος

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions με HTTP triggers και Cosmos DB  
   **Χρόνος:** 30-40 λεπτά | **Κόστος:** $10-40/μήνα  
   **Θα Μάθετε:** Αρχιτεκτονική βασισμένη σε γεγονότα, serverless scaling, ενσωμάτωση NoSQL  
   **Αναμενόμενο Αποτέλεσμα:** Εφαρμογή λειτουργιών που ανταποκρίνεται σε HTTP αιτήματα με αποθήκευση Cosmos DB

8. **[Μικροϋπηρεσίες - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Εφαρμογή Java πολλαπλών υπηρεσιών με Container Apps και API gateway  
   **Χρόνος:** 60-90 λεπτά | **Κόστος:** $80-200/μήνα  
   **Θα Μάθετε:** Ανάπτυξη Spring Boot, service mesh, εξισορρόπηση φορτίου  
   **Αναμενόμενο Αποτέλεσμα:** Σύστημα Java πολλαπλών υπηρεσιών με ανακάλυψη υπηρεσιών και δρομολόγηση

### Πρότυπα Azure AI Foundry

1. **[Εφαρμογή Συνομιλίας Azure OpenAI - Τοπικό Παράδειγμα](../../../examples/azure-openai-chat)** ⭐⭐  
   Πλήρης ανάπτυξη GPT-4 με διεπαφή συνομιλίας  
   **Χρόνος:** 35-45 λεπτά | **Κόστος:** $50-200/μήνα  
   **Αναμενόμενο Αποτέλεσμα:** Λειτουργική εφαρμογή συνομιλίας με παρακολούθηση token και κόστους

2. **[Demo Αναζήτησης + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Έξυπνη εφαρμογή συνομιλίας με αρχιτεκτονική RAG  
   **
- **Υποδομή Παραγωγής**: Αναπτύξεις Azure OpenAI σε πολλαπλές περιοχές, AI Search, Container Apps και ολοκληρωμένη παρακολούθηση
- **Έτοιμο προς Ανάπτυξη ARM Template**: Ανάπτυξη με ένα κλικ με πολλαπλές λειτουργίες διαμόρφωσης (Ελάχιστη/Κανονική/Προηγμένη)
- **Προηγμένα Χαρακτηριστικά**: Επικύρωση ασφάλειας μέσω red teaming, πλαίσιο αξιολόγησης πρακτόρων, βελτιστοποίηση κόστους και οδηγοί αντιμετώπισης προβλημάτων
- **Πραγματικό Επιχειρηματικό Πλαίσιο**: Περίπτωση χρήσης υποστήριξης πελατών λιανικής με μεταφορτώσεις αρχείων, ενσωμάτωση αναζήτησης και δυναμική κλιμάκωση

**Τεχνολογίες**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Πολυπλοκότητα**: ⭐⭐⭐⭐ (Προηγμένο - Έτοιμο για Παραγωγή Επιχειρήσεων)

**Ιδανικό για**: Προγραμματιστές AI, αρχιτέκτονες λύσεων και ομάδες που δημιουργούν συστήματα πολλαπλών πρακτόρων για παραγωγή

**Γρήγορη Εκκίνηση**: Αναπτύξτε την πλήρη λύση σε λιγότερο από 30 λεπτά χρησιμοποιώντας το περιλαμβανόμενο ARM template με `./deploy.sh -g myResourceGroup`

## 📋 Οδηγίες Χρήσης

### Προαπαιτούμενα

Πριν εκτελέσετε οποιοδήποτε παράδειγμα:
- ✅ Συνδρομή Azure με πρόσβαση Ιδιοκτήτη ή Συνεισφέροντα
- ✅ Εγκατεστημένο Azure Developer CLI ([Οδηγός Εγκατάστασης](../docs/getting-started/installation.md))
- ✅ Ενεργό Docker Desktop (για παραδείγματα container)
- ✅ Κατάλληλα όρια Azure (ελέγξτε τις απαιτήσεις κάθε παραδείγματος)

> **💰 Προειδοποίηση Κόστους:** Όλα τα παραδείγματα δημιουργούν πραγματικούς πόρους Azure που επιφέρουν χρεώσεις. Δείτε τα επιμέρους αρχεία README για εκτιμήσεις κόστους. Θυμηθείτε να εκτελέσετε `azd down` όταν τελειώσετε για να αποφύγετε συνεχιζόμενες χρεώσεις.

### Εκτέλεση Παραδειγμάτων Τοπικά

1. **Κλωνοποίηση ή Αντιγραφή Παραδείγματος**
   ```bash
   # Μεταβείτε στο επιθυμητό παράδειγμα
   cd examples/simple-web-app
   ```

2. **Αρχικοποίηση Περιβάλλοντος AZD**
   ```bash
   # Αρχικοποιήστε με υπάρχον πρότυπο
   azd init
   
   # Ή δημιουργήστε νέο περιβάλλον
   azd env new my-environment
   ```

3. **Διαμόρφωση Περιβάλλοντος**
   ```bash
   # Ορίστε τις απαιτούμενες μεταβλητές
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Ανάπτυξη**
   ```bash
   # Ανάπτυξη υποδομής και εφαρμογής
   azd up
   ```

5. **Επαλήθευση Ανάπτυξης**
   ```bash
   # Λάβετε τα σημεία τερματισμού υπηρεσιών
   azd env get-values
   
   # Δοκιμάστε το σημείο τερματισμού (παράδειγμα)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Αναμενόμενοι Δείκτες Επιτυχίας:**
   - ✅ Το `azd up` ολοκληρώνεται χωρίς σφάλματα
   - ✅ Το endpoint της υπηρεσίας επιστρέφει HTTP 200
   - ✅ Το Azure Portal δείχνει κατάσταση "Running"
   - ✅ Το Application Insights λαμβάνει τηλεμετρία

> **⚠️ Προβλήματα;** Δείτε [Συνηθισμένα Προβλήματα](../docs/troubleshooting/common-issues.md) για αντιμετώπιση προβλημάτων ανάπτυξης

### Προσαρμογή Παραδειγμάτων

Κάθε παράδειγμα περιλαμβάνει:
- **README.md** - Αναλυτικές οδηγίες ρύθμισης και προσαρμογής
- **azure.yaml** - Διαμόρφωση AZD με σχόλια
- **infra/** - Πρότυπα Bicep με εξηγήσεις παραμέτρων
- **src/** - Δείγμα κώδικα εφαρμογής
- **scripts/** - Βοηθητικά scripts για κοινές εργασίες

## 🎯 Εκπαιδευτικοί Στόχοι

### Κατηγορίες Παραδειγμάτων

#### **Βασικές Αναπτύξεις**
- Εφαρμογές μίας υπηρεσίας
- Απλά πρότυπα υποδομής
- Βασική διαχείριση διαμόρφωσης
- Οικονομικές ρυθμίσεις ανάπτυξης

#### **Προηγμένα Σενάρια**
- Αρχιτεκτονικές πολλαπλών υπηρεσιών
- Πολύπλοκες διαμορφώσεις δικτύου
- Πρότυπα ενσωμάτωσης βάσεων δεδομένων
- Υλοποιήσεις ασφάλειας και συμμόρφωσης

#### **Πρότυπα Έτοιμα για Παραγωγή**
- Ρυθμίσεις υψηλής διαθεσιμότητας
- Παρακολούθηση και παρατηρησιμότητα
- Ενσωμάτωση CI/CD
- Ρυθμίσεις ανάκαμψης από καταστροφή

## 📖 Περιγραφές Παραδειγμάτων

### Απλή Web Εφαρμογή - Node.js Express
**Τεχνολογίες**: Node.js, Express, MongoDB, Container Apps  
**Πολυπλοκότητα**: Αρχάριος  
**Έννοιες**: Βασική ανάπτυξη, REST API, ενσωμάτωση NoSQL βάσης δεδομένων

### Στατική Ιστοσελίδα - React SPA
**Τεχνολογίες**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Πολυπλοκότητα**: Αρχάριος  
**Έννοιες**: Στατική φιλοξενία, serverless backend, σύγχρονη ανάπτυξη web

### Εφαρμογή Container - Python Flask
**Τεχνολογίες**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Πολυπλοκότητα**: Αρχάριος  
**Έννοιες**: Containerization, REST API, scale-to-zero, health probes, παρακολούθηση  
**Τοποθεσία**: [Τοπικό Παράδειγμα](../../../examples/container-app/simple-flask-api)

### Εφαρμογή Container - Αρχιτεκτονική Microservices
**Τεχνολογίες**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Πολυπλοκότητα**: Προηγμένο  
**Έννοιες**: Αρχιτεκτονική πολλαπλών υπηρεσιών, επικοινωνία υπηρεσιών, ουρές μηνυμάτων, κατανεμημένη ιχνηλάτηση  
**Τοποθεσία**: [Τοπικό Παράδειγμα](../../../examples/container-app/microservices)

### Εφαρμογή Βάσης Δεδομένων - C# με Azure SQL
**Τεχνολογίες**: C# ASP.NET Core, Azure SQL Database, App Service  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Entity Framework, συνδέσεις βάσεων δεδομένων, ανάπτυξη web API

### Serverless Function - Python Azure Functions
**Τεχνολογίες**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Αρχιτεκτονική βασισμένη σε γεγονότα, serverless computing, ανάπτυξη full-stack

### Microservices - Java Spring Boot
**Τεχνολογίες**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Επικοινωνία microservices, κατανεμημένα συστήματα, πρότυπα επιχειρήσεων

### Παραδείγματα Azure AI Foundry

#### Azure OpenAI Chat App
**Τεχνολογίες**: Azure OpenAI, Cognitive Search, App Service  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Αρχιτεκτονική RAG, αναζήτηση vector, ενσωμάτωση LLM

#### Επεξεργασία Εγγράφων AI
**Τεχνολογίες**: Azure AI Document Intelligence, Storage, Functions  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Ανάλυση εγγράφων, OCR, εξαγωγή δεδομένων

#### Pipeline Μηχανικής Μάθησης
**Τεχνολογίες**: Azure ML, MLOps, Container Registry  
**Πολυπλοκότητα**: Προηγμένο  
**Έννοιες**: Εκπαίδευση μοντέλων, pipelines ανάπτυξης, παρακολούθηση

## 🛠 Παραδείγματα Διαμόρφωσης

Ο φάκελος `configurations/` περιέχει επαναχρησιμοποιήσιμα στοιχεία:

### Διαμορφώσεις Περιβάλλοντος
- Ρυθμίσεις περιβάλλοντος ανάπτυξης
- Διαμορφώσεις περιβάλλοντος staging
- Ρυθμίσεις έτοιμες για παραγωγή
- Αναπτύξεις πολλαπλών περιοχών

### Modules Bicep
- Επαναχρησιμοποιήσιμα στοιχεία υποδομής
- Κοινά πρότυπα πόρων
- Πρότυπα με ενισχυμένη ασφάλεια
- Διαμορφώσεις βελτιστοποιημένες για κόστος

### Βοηθητικά Scripts
- Αυτοματοποίηση ρύθμισης περιβάλλοντος
- Scripts μετεγκατάστασης βάσεων δεδομένων
- Εργαλεία επικύρωσης ανάπτυξης
- Εργαλεία παρακολούθησης κόστους

## 🔧 Οδηγός Προσαρμογής

### Προσαρμογή Παραδειγμάτων στις Ανάγκες σας

1. **Επισκόπηση Προαπαιτούμενων**
   - Ελέγξτε τις απαιτήσεις υπηρεσιών Azure
   - Επαληθεύστε τα όρια συνδρομής
   - Κατανοήστε τις επιπτώσεις κόστους

2. **Τροποποίηση Διαμόρφωσης**
   - Ενημερώστε τους ορισμούς υπηρεσιών στο `azure.yaml`
   - Προσαρμόστε τα πρότυπα Bicep
   - Ρυθμίστε μεταβλητές περιβάλλοντος

3. **Εκτενής Δοκιμή**
   - Αναπτύξτε πρώτα σε περιβάλλον ανάπτυξης
   - Επαληθεύστε τη λειτουργικότητα
   - Δοκιμάστε την κλιμάκωση και την απόδοση

4. **Ανασκόπηση Ασφάλειας**
   - Ελέγξτε τους ελέγχους πρόσβασης
   - Εφαρμόστε διαχείριση μυστικών
   - Ενεργοποιήστε την παρακολούθηση και τις ειδοποιήσεις

## 📊 Πίνακας Σύγκρισης

| Παράδειγμα | Υπηρεσίες | Βάση Δεδομένων | Αυθεντικοποίηση | Παρακολούθηση | Πολυπλοκότητα |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Τοπικό) | 2 | ❌ | Key Vault | Πλήρης | ⭐⭐ |
| **Python Flask API** (Τοπικό) | 1 | ❌ | Βασική | Πλήρης | ⭐ |
| **Microservices** (Τοπικό) | 5+ | ✅ | Επιχειρησιακή | Προηγμένη | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Βασική | Βασική | ⭐ |
| React SPA + Functions | 3 | ✅ | Βασική | Πλήρης | ⭐ |
| Python Flask Container | 2 | ❌ | Βασική | Πλήρης | ⭐ |
| C# Web API + SQL | 2 | ✅ | Πλήρης | Πλήρης | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Πλήρης | Πλήρης | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Πλήρης | Πλήρης | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Πλήρης | Πλήρης | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Βασική | Πλήρης | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Πλήρης | Πλήρης | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Τοπικό) | **8+** | **✅** | **Επιχειρησιακή** | **Προηγμένη** | **⭐⭐⭐⭐** |

## 🎓 Εκπαιδευτική Διαδρομή

### Προτεινόμενη Πρόοδος

1. **Ξεκινήστε με Απλή Web Εφαρμογή**
   - Μάθετε βασικές έννοιες AZD
   - Κατανοήστε τη ροή ανάπτυξης
   - Εξασκηθείτε στη διαχείριση περιβάλλοντος

2. **Δοκιμάστε Στατική Ιστοσελίδα**
   - Εξερευνήστε διαφορετικές επιλογές φιλοξενίας
   - Μάθετε για την ενσωμάτωση CDN
   - Κατανοήστε τη διαμόρφωση DNS

3. **Μεταβείτε σε Εφαρμογή Container**
   - Μάθετε βασικές έννοιες containerization
   - Κατανοήστε τις έννοιες κλιμάκωσης
   - Εξασκηθείτε με Docker

4. **Προσθέστε Ενσωμάτωση Βάσης Δεδομένων**
   - Μάθετε την παροχή βάσεων δεδομένων
   - Κατανοήστε τις συμβολοσειρές σύνδεσης
   - Εξασκηθείτε στη διαχείριση μυστικών

5. **Εξερευνήστε Serverless**
   - Κατανοήστε την αρχιτεκτονική βασισμένη σε γεγονότα
   - Μάθετε για triggers και bindings
   - Εξασκηθείτε με APIs

6. **Δημιουργήστε Microservices**
   - Μάθετε την επικοινωνία υπηρεσιών
   - Κατανοήστε τα κατανεμημένα συστήματα
   - Εξασκηθείτε σε πολύπλοκες αναπτύξεις

## 🔍 Εύρεση του Κατάλληλου Παραδείγματος

### Ανά Τεχνολογικό Στοίβα
- **Container Apps**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices (Τοπικό)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Τοπικό)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Τοπικό)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Τοπικό)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Τοπικό)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices (Τοπικό)](../../../examples/container-app/microservices), Java Microservices
- **Βάσεις Δεδομένων**: [Microservices (Τοπικό)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Τοπικό)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Συστήματα Πολλαπλών Πρακτόρων**: **Retail Multi-Agent Solution**
- **Ενσωμάτωση OpenAI**: **[Azure OpenAI Chat (Τοπικό)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Παραγωγή Επιχειρήσεων**: [Microservices (Τοπικό)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Ανά Αρχιτεκτονικό Πρότυπο
- **Απλό REST API**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api)
- **Μονολιθικό**: Node.js Express Todo, C# Web API + SQL
- **Στατικό + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Τοπικό)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices (Τοπικό)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Τοπικό)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Αρχιτεκτονική Πολλαπλών Πρακτόρων**: **Retail Multi-Agent Solution**
- **Επιχειρησιακή Πολλαπλών Υπηρεσιών**: [Microservices (Τοπικό)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Ανά Επίπεδο Πολυπλοκότητας
- **Αρχάριος**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Ενδιάμεσο**: **[Azure OpenAI
- [Εφαρμογή Todo με Node.js και PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App με API σε C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions με Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Βέλτιστες Πρακτικές
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Συμβολή Παραδειγμάτων

Έχετε ένα χρήσιμο παράδειγμα να μοιραστείτε; Καλωσορίζουμε τις συνεισφορές!

### Οδηγίες Υποβολής
1. Ακολουθήστε την καθορισμένη δομή φακέλων
2. Συμπεριλάβετε αναλυτικό README.md
3. Προσθέστε σχόλια στα αρχεία ρυθμίσεων
4. Δοκιμάστε διεξοδικά πριν την υποβολή
5. Συμπεριλάβετε εκτιμήσεις κόστους και προαπαιτούμενα

### Δομή Προτύπου Παραδείγματος
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Συμβουλή**: Ξεκινήστε με το πιο απλό παράδειγμα που ταιριάζει στην τεχνολογική σας στοίβα και στη συνέχεια προχωρήστε σταδιακά σε πιο σύνθετα σενάρια. Κάθε παράδειγμα βασίζεται σε έννοιες από τα προηγούμενα!

## 🚀 Έτοιμοι να Ξεκινήσετε;

### Η Διαδρομή Μάθησής Σας

1. **Εντελώς Αρχάριοι;** → Ξεκινήστε με [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 λεπτά)
2. **Έχετε Βασικές Γνώσεις AZD;** → Δοκιμάστε [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 λεπτά)
3. **Δημιουργείτε Εφαρμογές AI;** → Ξεκινήστε με [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 λεπτά) ή εξερευνήστε [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ώρες)
4. **Χρειάζεστε Συγκεκριμένη Τεχνολογική Στοίβα;** → Χρησιμοποιήστε την ενότητα [Εύρεση του Κατάλληλου Παραδείγματος](../../../examples) παραπάνω

### Επόμενα Βήματα

- ✅ Ανασκόπηση [Προαπαιτούμενων](../../../examples) παραπάνω
- ✅ Επιλέξτε ένα παράδειγμα που ταιριάζει στο επίπεδο δεξιοτήτων σας (δείτε [Θρύλο Πολυπλοκότητας](../../../examples))
- ✅ Διαβάστε προσεκτικά το README του παραδείγματος πριν την ανάπτυξη
- ✅ Θυμηθείτε να εκτελέσετε `azd down` μετά τη δοκιμή
- ✅ Μοιραστείτε την εμπειρία σας μέσω GitHub Issues ή Discussions

### Χρειάζεστε Βοήθεια;

- 📖 [FAQ](../resources/faq.md) - Συχνές ερωτήσεις απαντημένες
- 🐛 [Οδηγός Επίλυσης Προβλημάτων](../docs/troubleshooting/common-issues.md) - Επιδιορθώστε προβλήματα ανάπτυξης
- 💬 [Συζητήσεις στο GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Ρωτήστε την κοινότητα
- 📚 [Οδηγός Μελέτης](../resources/study-guide.md) - Ενισχύστε τη μάθησή σας

---

**Πλοήγηση**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD For Beginners](../README.md)
- **📖 Υλικά Μελέτης**: [Οδηγός Μελέτης](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Γλωσσάρι](../resources/glossary.md)
- **🔧 Πόροι**: [FAQ](../resources/faq.md) | [Επίλυση Προβλημάτων](../docs/troubleshooting/common-issues.md)

---

*Τελευταία Ενημέρωση: Νοέμβριος 2025 | [Αναφορά Προβλημάτων](https://github.com/microsoft/AZD-for-beginners/issues) | [Συνεισφορά Παραδειγμάτων](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->