# Παραδείγματα - Πρακτικά Πρότυπα και Διαμορφώσεις AZD

**Μάθηση Μέσω Παραδείγματος - Οργανωμένα κατά Κεφάλαιο**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../README.md)
- **📖 Χάρτης Κεφαλαίων**: Παραδείγματα οργανωμένα κατά πολυπλοκότητα μάθησης
- **🚀 Τοπικό Παράδειγμα**: [Λύση Πολυ-Πράκτορα Λιανεμπορίου](retail-scenario.md)
- **🤖 Εξωτερικά Παραδείγματα AI**: Σύνδεσμοι σε αποθετήρια Azure Samples

> **📍 ΣΗΜΑΝΤΙΚΟ: Τοπικά έναντι Εξωτερικών Παραδειγμάτων**  
> Αυτό το αποθετήριο περιέχει **4 πλήρη τοπικά παραδείγματα** με πλήρεις υλοποιήσεις:  
> - **Azure OpenAI Chat** (υλοποίηση GPT-4 με διεπαφή chat)  
> - **Container Apps** (Απλό Flask API + Μικροϋπηρεσίες)  
> - **Database App** (Ιστός + SQL Database)  
> - **Retail Multi-Agent** (Επιχειρησιακή λύση AI)  
>  
> Πρόσθετα παραδείγματα είναι **εξωτερικές αναφορές** σε αποθετήρια Azure-Samples που μπορείτε να κλωνοποιήσετε.

## Εισαγωγή

Αυτός ο κατάλογος παρέχει πρακτικά παραδείγματα και αναφορές για να σας βοηθήσει να μάθετε το Azure Developer CLI μέσω πρακτικής εξάσκησης. Το σενάριο Retail Multi-Agent είναι μια πλήρης, έτοιμη για παραγωγή υλοποίηση που περιλαμβάνεται σε αυτό το αποθετήριο. Πρόσθετα παραδείγματα αναφέρονται σε επίσημα Azure Samples που επιδεικνύουν διάφορα μοτίβα AZD.

### Υπόμνημα Βαθμολογίας Πολυπλοκότητας

- ⭐ **Αρχάριος** - Βασικές έννοιες, μία υπηρεσία, 15-30 λεπτά
- ⭐⭐ **Μεσαίο Επίπεδο** - Πολλαπλές υπηρεσίες, ενσωμάτωση βάσης δεδομένων, 30-60 λεπτά
- ⭐⭐⭐ **Προχωρημένο** - Πολύπλοκη αρχιτεκτονική, ενσωμάτωση AI, 1-2 ώρες
- ⭐⭐⭐⭐ **Ειδικός** - Έτοιμο για παραγωγή, επιχειρηματικά μοτίβα, 2+ ώρες

## 🎯 Τι Περιέχει Πραγματικά Αυτό το Αποθετήριο

### ✅ Τοπική Υλοποίηση (Έτοιμη για Χρήση)

#### [Εφαρμογή Azure OpenAI Chat](azure-openai-chat/README.md) 🆕
**Πλήρης ανάπτυξη GPT-4 με διεπαφή συνομιλίας περιλαμβάνεται σε αυτό το αποθετήριο**

- **Τοποθεσία:** `examples/azure-openai-chat/`
- **Πολυπλοκότητα:** ⭐⭐ (Μεσαίο Επίπεδο)
- **Τι Περιλαμβάνεται:**
  - Πλήρης ανάπτυξη Azure OpenAI (GPT-4)
  - Διεπαφή συνομιλίας γραμμής εντολών Python
  - Ενσωμάτωση Key Vault για ασφαλή API κλειδιά
  - Πρότυπα υποδομής Bicep
  - Παρακολούθηση χρήσης token και κόστους
  - Περιορισμός ρυθμού και χειρισμός σφαλμάτων

**Γρήγορη Εκκίνηση:**
```bash
# Μεταβείτε στο παράδειγμα
cd examples/azure-openai-chat

# Αναπτύξτε τα πάντα
azd up

# Εγκαταστήστε τις εξαρτήσεις και αρχίστε να συνομιλείτε
pip install -r src/requirements.txt
python src/chat.py
```

**Τεχνολογίες:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Παραδείγματα Container App](container-app/README.md) 🆕
**Περιεκτικά παραδείγματα ανάπτυξης container περιλαμβάνονται σε αυτό το αποθετήριο**

- **Τοποθεσία:** `examples/container-app/`
- **Πολυπλοκότητα:** ⭐-⭐⭐⭐⭐ (Αρχάριος έως Ειδικός)
- **Τι Περιλαμβάνεται:**
  - [Οδηγός Master](container-app/README.md) - Πλήρης επισκόπηση αναπτύξεων container
  - [Απλό Flask API](../../../examples/container-app/simple-flask-api) - Βασικό παράδειγμα REST API
  - [Αρχιτεκτονική Μικροϋπηρεσιών](../../../examples/container-app/microservices) - Παραγωγική ανάπτυξη πολλαπλών υπηρεσιών
  - Γρήγορη Εκκίνηση, Παραγωγή και Προχωρημένα μοτίβα
  - Παρακολούθηση, ασφάλεια και βελτιστοποίηση κόστους

**Γρήγορη Εκκίνηση:**
```bash
# Προβολή κύριου οδηγού
cd examples/container-app

# Ανάπτυξη απλού API Flask
cd simple-flask-api
azd up

# Ανάπτυξη παραδείγματος μικροϋπηρεσιών
cd ../microservices
azd up
```

**Τεχνολογίες:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Λύση Πολυ-Πράκτορα Λιανεμπορίου](retail-scenario.md) 🆕
**Πλήρης υλοποίηση έτοιμη για παραγωγή περιλαμβάνεται σε αυτό το αποθετήριο**

- **Τοποθεσία:** `examples/retail-multiagent-arm-template/`
- **Πολυπλοκότητα:** ⭐⭐⭐⭐ (Προχωρημένο)
- **Τι Περιλαμβάνεται:**
  - Πλήρες πρότυπο ανάπτυξης ARM
  - Αρχιτεκτονική πολλαπλών πρακτόρων (Πελάτης + Αποθέματα)
  - Ενσωμάτωση Azure OpenAI
  - AI Search με RAG
  - Ολοκληρωμένη παρακολούθηση
  - Σενάριο ανάπτυξης με ένα κλικ

**Γρήγορη Εκκίνηση:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Τεχνολογίες:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Εξωτερικά Azure Samples (Κλωνοποιήστε για Χρήση)

Τα ακόλουθα παραδείγματα διατηρούνται σε επίσημα αποθετήρια Azure-Samples. Κλωνοποιήστε τα για να εξερευνήσετε διαφορετικά μοτίβα AZD:

### Απλές Εφαρμογές (Κεφάλαια 1-2)

| Πρότυπο | Αποθετήριο | Πολυπλοκότητα | Υπηρεσίες |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Τοπικό: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Τοπικό: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Πολλαπλές υπηρεσίες, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Πώς να το χρησιμοποιήσετε:**
```bash
# Κλωνοποιήστε οποιοδήποτε παράδειγμα
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Αναπτύξτε
azd up
```

### Παραδείγματα Εφαρμογών AI (Κεφάλαια 2, 5, 8)

| Πρότυπο | Αποθετήριο | Πολυπλοκότητα | Εστίαση |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Τοπικό: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Υλοποίηση GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Βασική συνομιλία AI |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Πλαίσιο πρακτόρων |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Πρότυπο RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Επιχειρησιακό AI |

### Βάσεις Δεδομένων & Προχωρημένα Μοτίβα (Κεφάλαια 3-8)

| Πρότυπο | Αποθετήριο | Πολυπλοκότητα | Εστίαση |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Ενσωμάτωση βάσης δεδομένων |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Πολλαπλές υπηρεσίες |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Στόχοι Μάθησης

Με την εργασία σε αυτά τα παραδείγματα, θα:
- Εξασκήσετε ροές εργασίας Azure Developer CLI με ρεαλιστικά σενάρια εφαρμογών
- Κατανοήσετε διαφορετικές αρχιτεκτονικές εφαρμογών και τις υλοποιήσεις τους με azd
- Κατακτήσετε μοτίβα Infrastructure as Code για διάφορες υπηρεσίες Azure
- Εφαρμόσετε διαχείριση διαμορφώσεων και στρατηγικές ανάπτυξης ειδικές για περιβάλλον
- Υλοποιήσετε μοτίβα παρακολούθησης, ασφάλειας και κλιμάκωσης σε πρακτικά περιβάλλοντα
- Αποκτήσετε εμπειρία με αντιμετώπιση προβλημάτων και αποσφαλμάτωση πραγματικών σεναρίων ανάπτυξης

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση αυτών των παραδειγμάτων, θα μπορείτε να:
- Αναπτύξετε διάφορους τύπους εφαρμογών χρησιμοποιώντας Azure Developer CLI με αυτοπεποίθηση
- Προσαρμόσετε τα παρεχόμενα πρότυπα στις δικές σας απαιτήσεις εφαρμογής
- Σχεδιάσετε και υλοποιήσετε προσαρμοσμένα μοτίβα υποδομής χρησιμοποιώντας Bicep
- Διαμορφώσετε πολύπλοκες εφαρμογές πολλαπλών υπηρεσιών με σωστές εξαρτήσεις
- Εφαρμόσετε βέλτιστες πρακτικές ασφάλειας, παρακολούθησης και απόδοσης σε πραγματικά σενάρια
- Αντιμετωπίσετε προβλήματα και βελτιστοποιήσετε αναπτύξεις βάσει πρακτικής εμπειρίας

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

> **💡 Νέος/α στο AZD;** Ξεκινήστε με το παράδειγμα #1 (Flask API) - διαρκεί ~20 λεπτά και διδάσκει βασικές έννοιες.

### Για Αρχάριους
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Αναπτύξτε ένα απλό REST API με scale-to-zero  
   **Χρόνος:** 20-25 λεπτά | **Κόστος:** $0-5/μήνα  
   **Θα Μάθετε:** Βασική ροή εργασίας azd, containerization, health probes  
   **Αναμενόμενο Αποτέλεσμα:** Λειτουργικό endpoint API που επιστρέφει "Hello, World!" με παρακολούθηση

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Αναπτύξτε μια εφαρμογή Node.js Express με MongoDB  
   **Χρόνος:** 25-35 λεπτά | **Κόστος:** $10-30/μήνα  
   **Θα Μάθετε:** Ενσωμάτωση βάσης δεδομένων, μεταβλητές περιβάλλοντος, σειρές σύνδεσης  
   **Αναμενόμενο Αποτέλεσμα:** Εφαρμογή λίστας υποχρεώσεων με δυνατότητες δημιουργίας/ανάγνωσης/ενημέρωσης/διαγραφής

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Φιλοξενήστε ένα React στατικό website με Azure Static Web Apps  
   **Χρόνος:** 20-30 λεπτά | **Κόστος:** $0-10/μήνα  
   **Θα Μάθετε:** Στατική φιλοξενία, serverless functions, ανάπτυξη CDN  
   **Αναμενόμενο Αποτέλεσμα:** React UI με backend API, αυτόματο SSL, παγκόσμιο CDN

### Για Μεσαίο Επίπεδο Χρηστών
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Αναπτύξτε GPT-4 με διεπαφή συνομιλίας και ασφαλή διαχείριση κλειδιών API  
   **Χρόνος:** 35-45 λεπτά | **Κόστος:** $50-200/μήνα  
   **Θα Μάθετε:** Ανάπτυξη Azure OpenAI, ενσωμάτωση Key Vault, παρακολούθηση token  
   **Αναμενόμενο Αποτέλεσμα:** Λειτουργική εφαρμογή συνομιλίας με GPT-4 και παρακολούθηση κόστους

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Αρχιτεκτονική πολλαπλών υπηρεσιών έτοιμη για παραγωγή  
   **Χρόνος:** 45-60 λεπτά | **Κόστος:** $50-150/μήνα  
   **Θα Μάθετε:** Επικοινωνία υπηρεσιών, ουρές μηνυμάτων, κατανεμημένη ιχνηλασία  
   **Αναμενόμενο Αποτέλεσμα:** Σύστημα 2 υπηρεσιών (API Gateway + Product Service) με παρακολούθηση

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Εφαρμογή ιστού με C# API και Azure SQL Database  
   **Χρόνος:** 30-45 λεπτά | **Κόστος:** $20-80/μήνα  
   **Θα Μάθετε:** Entity Framework, μεταναστεύσεις βάσης δεδομένων, ασφάλεια σύνδεσης  
   **Αναμενόμενο Αποτέλεσμα:** C# API με Azure SQL backend, αυτόματη ανάπτυξη σχήματος

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions με HTTP triggers και Cosmos DB  
   **Χρόνος:** 30-40 λεπτά | **Κόστος:** $10-40/μήνα  
   **Θα Μάθετε:** Αρχιτεκτονική event-driven, serverless κλιμάκωση, ενσωμάτωση NoSQL  
   **Αναμενόμενο Αποτέλεσμα:** Function app που ανταποκρίνεται σε HTTP αιτήματα με αποθήκευση Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Πολυϋπηρεσιακή Java εφαρμογή με Container Apps και API gateway  
   **Χρόνος:** 60-90 λεπτά | **Κόστος:** $80-200/μήνα  
   **Θα Μάθετε:** Ανάπτυξη Spring Boot, service mesh, load balancing  
   **Αναμενόμενο Αποτέλεσμα:** Πολυϋπηρεσιακό Java σύστημα με ανακάλυψη υπηρεσιών και δρομολόγηση

### Πρότυπα Microsoft Foundry

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Πλήρης ανάπτυξη GPT-4 με διεπαφή συνομιλίας  
   **Χρόνος:** 35-45 λεπτά | **Κόστος:** $50-200/μήνα  
   **Αναμενόμενο Αποτέλεσμα:** Λειτουργική εφαρμογή συνομιλίας με παρακολούθηση token και κόστους

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Ευφυής εφαρμογή συνομιλίας με αρχιτεκτονική RAG  
   **Χρόνος:** 60-90 λεπτά | **Κόστος:** $100-300/μήνα  
   **Αναμενόμενο Αποτέλεσμα:** Διεπαφή συνομιλίας με RAG, αναζήτηση εγγράφων και αναφορές

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Ανάλυση εγγράφων χρησιμοποιώντας υπηρεσίες Azure AI  
   **Χρόνος:** 40-60 λεπτά | **Κόστος:** $20-80/μήνα  
   **Αναμενόμενο Αποτέλεσμα:** API που εξάγει κείμενο, πίνακες και οντότητες από ανεβασμένα έγγραφα

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Ροή εργασίας MLOps με Azure Machine Learning  
   **Χρόνος:** 2-3 ώρες | **Κόστος:** $150-500/μήνα  
   **Αναμενόμενο Αποτέλεσμα:** Αυτοματοποιημένη ML pipeline με εκπαίδευση, ανάπτυξη και παρακολούθηση

### Πραγματικά Σενάρια

#### **Λύση Πολυ-Πράκτορα Λιανεμπορίου** 🆕
**[Οδηγός Πλήρους Υλοποίησης](./retail-scenario.md)**

Μια ολοκληρωμένη, έτοιμη για παραγωγή λύση πολλαπλών πρακτόρων για υποστήριξη πελατών που επιδεικνύει την ανάπτυξη επιχειρησιακής κλάσης εφαρμογών AI με AZD. Αυτό το σενάριο παρέχει:

- **Πλήρης Αρχιτεκτονική**: Σύστημα πολλαπλών πρακτόρων με εξειδικευμένους πράκτορες εξυπηρέτησης πελατών και διαχείρισης αποθεμάτων
- **Υποδομή Παραγωγής**: Αναπτύξεις Azure OpenAI σε πολλαπλές περιοχές, AI Search, Container Apps, και ολοκληρωμένη παρακολούθηση
- **Έτοιμο για Ανάπτυξη ARM Template**: Ανάπτυξη με ένα κλικ με πολλαπλές λειτουργίες διαμόρφωσης (Minimal/Standard/Premium)
- **Προηγμένα Χαρακτηριστικά**: red teaming επικύρωση ασφάλειας, πλαίσιο αξιολόγησης πρακτόρων, βελτιστοποίηση κόστους, και οδηγοί αντιμετώπισης προβλημάτων
- **Πραγματικό Επιχειρηματικό Πλαίσιο**: Περίπτωση χρήσης υποστήριξης πελατών λιανικής με ανέβασμα αρχείων, ενσωμάτωση αναζήτησης, και δυναμική κλιμάκωση

**Τεχνολογίες**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Πολυπλοκότητα**: ⭐⭐⭐⭐ (Προχωρημένο - Έτοιμο για Επιχειρησιακή Παραγωγή)

**Ιδανικό για**: προγραμματιστές AI, αρχιτέκτονες λύσεων, και ομάδες που χτίζουν παραγωγικά συστήματα πολλαπλών πρακτόρων

**Γρήγορη Έναρξη**: Αναπτύξτε την πλήρη λύση σε λιγότερο από 30 λεπτά χρησιμοποιώντας το συνημμένο ARM template με `./deploy.sh -g myResourceGroup`

## 📋 Οδηγίες Χρήσης

### Προαπαιτούμενα

Πριν εκτελέσετε οποιοδήποτε παράδειγμα:
- ✅ Συνδρομή Azure με δικαιώματα Owner ή Contributor
- ✅ Εγκατεστημένο Azure Developer CLI ([Οδηγός Εγκατάστασης](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop σε λειτουργία (για παραδείγματα κοντέινερ)
- ✅ Κατάλληλα όρια πόρων Azure (ελέγξτε τις απαιτήσεις συγκεκριμένου παραδείγματος)

> **💰 Προειδοποίηση Κόστους:** Όλα τα παραδείγματα δημιουργούν πραγματικούς πόρους Azure που συνεπάγονται χρεώσεις. Δείτε τα μεμονωμένα αρχεία README για εκτιμήσεις κόστους. Θυμηθείτε να εκτελέσετε `azd down` όταν τελειώσετε για να αποφύγετε συνεχιζόμενες χρεώσεις.

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
   # Αναπτύξτε την υποδομή και την εφαρμογή
   azd up
   ```

5. **Επαλήθευση Ανάπτυξης**
   ```bash
   # Λήψη τελικών σημείων υπηρεσίας
   azd env get-values
   
   # Δοκιμή του τελικού σημείου (παράδειγμα)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Αναμενόμενοι Δείκτες Επιτυχίας:**
   - ✅ Το `azd up` ολοκληρώνεται χωρίς σφάλματα
   - ✅ Το endpoint υπηρεσίας επιστρέφει HTTP 200
   - ✅ Το Azure Portal εμφανίζει κατάσταση "Running"
   - ✅ Το Application Insights λαμβάνει τηλεμετρία

> **⚠️ Πρόβλημα;** Δείτε [Συνηθισμένα Προβλήματα](../docs/chapter-07-troubleshooting/common-issues.md) για αντιμετώπιση προβλημάτων ανάπτυξης

### Προσαρμογή Παραδειγμάτων

Κάθε παράδειγμα περιλαμβάνει:
- **README.md** - Λεπτομερείς οδηγίες ρύθμισης και προσαρμογής
- **azure.yaml** - Ρύθμιση AZD με σχόλια
- **infra/** - Πρότυπα Bicep με επεξηγήσεις παραμέτρων
- **src/** - Δείγμα κώδικα εφαρμογής
- **scripts/** - Βοηθητικά σενάρια για κοινές εργασίες

## 🎯 Στόχοι Μάθησης

### Κατηγορίες Παραδειγμάτων

#### **Βασικές Αναπτύξεις**
- Εφαρμογές μίας υπηρεσίας
- Απλά πρότυπα υποδομής
- Βασική διαχείριση ρυθμίσεων
- Οικονομικά αποδοτικές ρυθμίσεις ανάπτυξης

#### **Προηγμένα Σενάρια**
- Αρχιτεκτονικές πολλαπλών υπηρεσιών
- Πολύπλοκες ρυθμίσεις δικτύωσης
- Πρότυπα ενσωμάτωσης βάσεων δεδομένων
- Υλοποιήσεις ασφάλειας και συμμόρφωσης

#### **Πρότυπα Έτοιμα για Παραγωγή**
- Ρυθμίσεις υψηλής διαθεσιμότητας
- Παρακολούθηση και παρατηρησιμότητα
- Ενσωμάτωση CI/CD
- Ρυθμίσεις ανάκαμψης από καταστροφές

## 📖 Περιγραφές Παραδειγμάτων

### Απλή Web Εφαρμογή - Node.js Express
**Τεχνολογίες**: Node.js, Express, MongoDB, Container Apps  
**Πολυπλοκότητα**: Αρχάριος  
**Έννοιες**: Βασική ανάπτυξη, REST API, ενσωμάτωση βάσης NoSQL

### Στατικός Ιστότοπος - React SPA
**Τεχνολογίες**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Πολυπλοκότητα**: Αρχάριος  
**Έννοιες**: Στατική φιλοξενία, serverless backend, σύγχρονη ανάπτυξη ιστοσελίδων

### Container App - Python Flask
**Τεχνολογίες**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Πολυπλοκότητα**: Αρχάριος  
**Έννοιες**: Containerization, REST API, scale-to-zero, health probes, monitoring  
**Τοποθεσία**: [Τοπικό Παράδειγμα](../../../examples/container-app/simple-flask-api)

### Container App - Αρχιτεκτονική Microservices
**Τεχνολογίες**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Πολυπλοκότητα**: Προχωρημένο  
**Έννοιες**: Αρχιτεκτονική πολλαπλών υπηρεσιών, επικοινωνία υπηρεσιών, ουρές μηνυμάτων, κατανεμημένη ιχνηλάτηση  
**Τοποθεσία**: [Τοπικό Παράδειγμα](../../../examples/container-app/microservices)

### Εφαρμογή Βάσης Δεδομένων - C# με Azure SQL
**Τεχνολογίες**: C# ASP.NET Core, Azure SQL Database, App Service  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Entity Framework, συνδέσεις βάσης δεδομένων, ανάπτυξη web API

### Serverless Function - Python Azure Functions
**Τεχνολογίες**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Event-driven architecture, serverless computing, full-stack ανάπτυξη

### Microservices - Java Spring Boot
**Τεχνολογίες**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Επικοινωνία microservices, κατανεμημένα συστήματα, επιχειρησιακά πρότυπα

### Παραδείγματα Microsoft Foundry

#### Εφαρμογή Azure OpenAI Chat
**Τεχνολογίες**: Azure OpenAI, Cognitive Search, App Service  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Αρχιτεκτονική RAG, vector search, ενσωμάτωση LLM

#### Επεξεργασία Εγγράφων με AI
**Τεχνολογίες**: Azure AI Document Intelligence, Storage, Functions  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Ανάλυση εγγράφων, OCR, εξαγωγή δεδομένων

#### Pipeline Μηχανικής Μάθησης
**Τεχνολογίες**: Azure ML, MLOps, Container Registry  
**Πολυπλοκότητα**: Προχωρημένο  
**Έννοιες**: Εκπαίδευση μοντέλων, pipelines ανάπτυξης, παρακολούθηση

## 🛠 Παραδείγματα Διαμόρφωσης

Ο φάκελος `configurations/` περιέχει επαναχρησιμοποιήσιμα συστατικά:

### Ρυθμίσεις Περιβάλλοντος
- Ρυθμίσεις περιβάλλοντος ανάπτυξης
- Ρυθμίσεις περιβάλλοντος staging
- Ρυθμίσεις έτοιμες για παραγωγή
- Ρυθμίσεις ανάπτυξης σε πολλαπλές περιοχές

### Μονάδες Bicep
- Επαναχρησιμοποιήσιμα στοιχεία υποδομής
- Συνηθισμένα πρότυπα πόρων
- Πρότυπα με αυξημένη ασφάλεια
- Διαμορφώσεις βελτιστοποιημένες για κόστος

### Βοηθητικά Σενάρια
- Αυτοματοποίηση ρύθμισης περιβάλλοντος
- Σενάρια μετανάστευσης βάσης δεδομένων
- Εργαλεία επαλήθευσης ανάπτυξης
- Εργαλεία παρακολούθησης κόστους

## 🔧 Οδηγός Προσαρμογής

### Προσαρμογή Παραδειγμάτων για τη Δική σας Περίπτωση Χρήσης

1. **Επανεξέταση Προαπαιτούμενων**
   - Ελέγξτε τις απαιτήσεις υπηρεσιών Azure
   - Επαληθεύστε τα όρια της συνδρομής
   - Κατανοήστε τις οικονομικές επιπτώσεις

2. **Τροποποίηση Διαμόρφωσης**
   - Ενημερώστε τους ορισμούς υπηρεσιών στο `azure.yaml`
   - Προσαρμόστε τα πρότυπα Bicep
   - Ρυθμίστε τις μεταβλητές περιβάλλοντος

3. **Ελέγξτε Εξονυχιστικά**
   - Αναπτύξτε πρώτα στο περιβάλλον ανάπτυξης
   - Επαληθεύστε τη λειτουργικότητα
   - Δοκιμάστε την κλιμάκωση και την απόδοση

4. **Έλεγχος Ασφαλείας**
   - Ελέγξτε τους ελέγχους πρόσβασης
   - Υλοποιήστε διαχείριση μυστικών
   - Ενεργοποιήστε παρακολούθηση και ειδοποιήσεις

## 📊 Πίνακας Συγκρίσεων

| Παράδειγμα | Υπηρεσίες | Βάση Δεδομένων | Έλεγχος ταυτότητας | Παρακολούθηση | Πολυπλοκότητα |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Τοπικό) | 2 | ❌ | Key Vault | Πλήρης | ⭐⭐ |
| **Python Flask API** (Τοπικό) | 1 | ❌ | Βασικό | Πλήρης | ⭐ |
| **Microservices** (Τοπικό) | 5+ | ✅ | Επιχειρησιακό | Προχωρημένο | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Βασικό | Βασικό | ⭐ |
| React SPA + Functions | 3 | ✅ | Βασικό | Πλήρης | ⭐ |
| Python Flask Container | 2 | ❌ | Βασικό | Πλήρης | ⭐ |
| C# Web API + SQL | 2 | ✅ | Πλήρης | Πλήρης | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Πλήρης | Πλήρης | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Πλήρης | Πλήρης | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Πλήρης | Πλήρης | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Βασικό | Πλήρης | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Πλήρης | Πλήρης | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Τοπικό) | **8+** | **✅** | **Επιχειρησιακό** | **Προχωρημένο** | **⭐⭐⭐⭐** |

## 🎓 Διαδρομή Μάθησης

### Συνιστώμενη Σειρά Βημάτων

1. **Ξεκινήστε με Απλή Web Εφαρμογή**
   - Μάθετε βασικές έννοιες AZD
   - Κατανοήστε τη ροή εργασίας ανάπτυξης
   - Εξασκηθείτε στη διαχείριση περιβάλλοντος

2. **Δοκιμάστε Στατικό Ιστότοπο**
   - Εξερευνήστε διαφορετικές επιλογές φιλοξενίας
   - Μάθετε για την ενσωμάτωση CDN
   - Κατανοήστε τη διαμόρφωση DNS

3. **Μεταβείτε σε Container App**
   - Μάθετε τα βασικά της containerization
   - Κατανοήστε τις έννοιες κλιμάκωσης
   - Εξασκηθείτε με Docker

4. **Προσθέστε Ενσωμάτωση Βάσης Δεδομένων**
   - Μάθετε παροχή βάσης δεδομένων
   - Κατανοήστε τα connection strings
   - Εξασκηθείτε στη διαχείριση μυστικών

5. **Εξερευνήστε το Serverless**
   - Κατανοήστε την event-driven αρχιτεκτονική
   - Μάθετε για triggers και bindings
   - Εξασκηθείτε με APIs

6. **Δημιουργήστε Microservices**
   - Μάθετε επικοινωνία υπηρεσιών
   - Κατανοήστε κατανεμημένα συστήματα
   - Εξασκηθείτε σε πολύπλοκες αναπτύξεις

## 🔍 Εύρεση του Κατάλληλου Παραδείγματος

### Ανά Στοίβα Τεχνολογιών
- **Container Apps**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices (Τοπικό)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Πύλη API Microservices (Τοπικό)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Τοπικό)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Τοπικό)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Τοπικό)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices (Τοπικό)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Τοπικό)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Τοπικό)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Λύση Retail Multi-Agent**
- **Συστήματα Πολλαπλών Πρακτόρων**: **Λύση Retail Multi-Agent**
- **Ενσωμάτωση OpenAI**: **[Azure OpenAI Chat (Τοπικό)](../../../examples/azure-openai-chat)**, Λύση Retail Multi-Agent
- **Επιχειρησιακή Παραγωγή**: [Microservices (Τοπικό)](../../../examples/container-app/microservices), **Λύση Retail Multi-Agent**

### Ανά Πρότυπο Αρχιτεκτονικής
- **Απλό REST API**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api)
- **Μονολιθική**: Node.js Express Todo, C# Web API + SQL
- **Στατική + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Τοπικό)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices (Τοπικό)](../../../examples/container-app/microservices), Java Microservices
- **Με δυνατότητα AI**: **[Azure OpenAI Chat (Τοπικό)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Λύση Retail Multi-Agent**
- **Αρχιτεκτονική Πολλαπλών Πρακτόρων**: **Λύση Retail Multi-Agent**
- **Επιχειρησιακό Πολλαπλών Υπηρεσιών**: [Microservices (Τοπικό)](../../../examples/container-app/microservices), **Λύση Retail Multi-Agent**

### Ανά Επίπεδο Πολυπλοκότητας
- **Αρχάριος**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Ενδιάμεσο**: **[Azure OpenAI Chat (Τοπικό)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Προχωρημένο**: ML Pipeline
- **Έτοιμο για Επιχειρησιακή Παραγωγή**: [Microservices (Τοπικό)](../../../examples/container-app/microservices) (Πολλαπλές υπηρεσίες με ουρές μηνυμάτων), **Λύση Retail Multi-Agent** (Πλήρες σύστημα πολλαπλών πρακτόρων με ανάπτυξη μέσω ARM template)

## 📚 Πρόσθετοι Πόροι

### Συνδέσεις Τεκμηρίωσης
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Κοινοτικά Παραδείγματα
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Εφαρμογή Todo με Node.js και PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web εφαρμογή με API σε C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Εργασία Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions με Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Βέλτιστες Πρακτικές
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Συνεισφορά Παραδειγμάτων

Έχετε ένα χρήσιμο παράδειγμα να μοιραστείτε; Καλωσορίζουμε τις συνεισφορές!

### Οδηγίες Υποβολής
1. Ακολουθήστε την καθιερωμένη δομή καταλόγων
2. Συμπεριλάβετε αναλυτικό README.md
3. Προσθέστε σχόλια στα αρχεία ρυθμίσεων
4. Δοκιμάστε ενδελεχώς πριν την υποβολή
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

**Συμβουλή**: Ξεκινήστε με το πιο απλό παράδειγμα που ταιριάζει στην τεχνολογική σας στοίβα, στη συνέχεια προχωρήστε σταδιακά σε πιο σύνθετα σενάρια. Κάθε παράδειγμα βασίζεται σε έννοιες από τα προηγούμενα!

## 🚀 Έτοιμοι να ξεκινήσετε;

### Η Διαδρομή Μάθησής σας

1. **Εντελώς αρχάριος;** → Ξεκινήστε με [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 λεπτά)
2. **Έχετε βασικές γνώσεις AZD;** → Δοκιμάστε [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 λεπτά)
3. **Αναπτύσσετε εφαρμογές AI;** → Ξεκινήστε με [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 λεπτά) ή εξερευνήστε [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ώρες)
4. **Χρειάζεστε συγκεκριμένη τεχνολογική στοίβα;** → Χρησιμοποιήστε την ενότητα [Εύρεση του κατάλληλου παραδείγματος](../../../examples) παραπάνω

### Επόμενα Βήματα

- ✅ Ελέγξτε τα [Προαπαιτούμενα](../../../examples) παραπάνω
- ✅ Επιλέξτε ένα παράδειγμα που ταιριάζει στο επίπεδο δεξιοτήτων σας (βλέπε [Υπόμνημα πολυπλοκότητας](../../../examples))
- ✅ Διαβάστε προσεκτικά το README του παραδείγματος πριν την ανάπτυξη
- ✅ Ορίστε μια υπενθύμιση να εκτελέσετε `azd down` μετά τις δοκιμές
- ✅ Μοιραστείτε την εμπειρία σας μέσω GitHub Issues ή Discussions

### Χρειάζεστε βοήθεια;

- 📖 [FAQ](../resources/faq.md) - Συνηθισμένες ερωτήσεις με απαντήσεις
- 🐛 [Οδηγός Επίλυσης Προβλημάτων](../docs/chapter-07-troubleshooting/common-issues.md) - Επιλύστε ζητήματα ανάπτυξης
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Ρωτήστε την κοινότητα
- 📚 [Οδηγός Μελέτης](../resources/study-guide.md) - Ενισχύστε τη μάθησή σας

---

**Πλοήγηση**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD For Beginners](../README.md)
- **📖 Υλικό Μελέτης**: [Οδηγός Μελέτης](../resources/study-guide.md) | [Συνοπτικός Οδηγός](../resources/cheat-sheet.md) | [Γλωσσάρι](../resources/glossary.md)
- **🔧 Πόροι**: [FAQ](../resources/faq.md) | [Επίλυση Προβλημάτων](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Τελευταία ενημέρωση: Νοέμβριος 2025 | [Αναφέρετε Προβλήματα](https://github.com/microsoft/AZD-for-beginners/issues) | [Συνεισφέρετε Παραδείγματα](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Το παρόν έγγραφο έχει μεταφραστεί με χρήση της υπηρεσίας μετάφρασης με τεχνητή νοημοσύνη Co-op Translator (https://github.com/Azure/co-op-translator). Παρόλο που επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το αρχικό έγγραφο στην πρωτότυπη γλώσσα του πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από ανθρώπινο μεταφραστή. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->