# Παραδείγματα - Πρακτικά Πρότυπα και Ρυθμίσεις AZD

**Μάθηση Μέσω Παραδείγματος - Οργανωμένα ανά Κεφάλαιο**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../README.md)
- **📖 Χάρτης Κεφαλαίων**: Παραδείγματα οργανωμένα ανά επίπεδο δυσκολίας
- **🚀 Τοπικό Παράδειγμα**: [Λύση Retail Multi-Agent](retail-scenario.md)
- **🤖 Εξωτερικά Παραδείγματα AI**: Σύνδεσμοι προς αποθετήρια Azure Samples

> **📍 ΣΗΜΑΝΤΙΚΟ: Τοπικά έναντι Εξωτερικών Παραδειγμάτων**  
> Αυτό το αποθετήριο περιέχει **4 πλήρη τοπικά παραδείγματα** με ολοκληρωμένες υλοποιήσεις:  
> - **Microsoft Foundry Models Chat** (ανάπτυξη gpt-4.1 με διεπαφή συνομιλίας)  
> - **Container Apps** (Απλό Flask API + Μικροϋπηρεσίες)  
> - **Database App** (Ιστοσελίδα + Βάση Δεδομένων SQL)  
> - **Retail Multi-Agent** (Επιχειρηματική λύση AI)  
>  
> Επιπλέον παραδείγματα είναι **εξωτερικές αναφορές** σε αποθετήρια Azure-Samples που μπορείτε να κλωνοποιήσετε.

## Εισαγωγή

Αυτός ο κατάλογος παρέχει πρακτικά παραδείγματα και αναφορές για να σας βοηθήσει να μάθετε το Azure Developer CLI μέσω πρακτικής εξάσκησης. Το σενάριο Retail Multi-Agent είναι μια πλήρης, έτοιμη για παραγωγή υλοποίηση που περιλαμβάνεται σε αυτό το αποθετήριο. Επιπλέον παραδείγματα αναφέρονται σε επίσημα Azure Samples που δείχνουν διάφορα μοτίβα AZD.

### Υπόμνημα Βαθμολογίας Πολυπλοκότητας

- ⭐ **Αρχάριος** - Βασικές έννοιες, μία υπηρεσία, 15-30 λεπτά
- ⭐⭐ **Ενδιάμεσο** - Πολλαπλές υπηρεσίες, ενσωμάτωση βάσης δεδομένων, 30-60 λεπτά
- ⭐⭐⭐ **Προχωρημένο** - Σύνθετη αρχιτεκτονική, ενσωμάτωση AI, 1-2 ώρες
- ⭐⭐⭐⭐ **Εξειδικευμένο** - Έτοιμο για παραγωγή, επιχειρησιακά μοτίβα, 2+ ώρες

## 🎯 Τι Περιέχει Πραγματικά Αυτό το Αποθετήριο

### ✅ Τοπική Υλοποίηση (Έτοιμη προς Χρήση)

#### [Εφαρμογή Συνομιλίας Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Πλήρης ανάπτυξη gpt-4.1 με διεπαφή συνομιλίας συμπεριλαμβανόμενη σε αυτό το αποθετήριο**

- **Τοποθεσία:** `examples/azure-openai-chat/`
- **Πολυπλοκότητα:** ⭐⭐ (Ενδιάμεσο)
- **Τι Περιλαμβάνεται:**
  - Πλήρης ανάπτυξη Microsoft Foundry Models (gpt-4.1)
  - Διεπαφή συνομιλίας μέσω γραμμής εντολών Python
  - Ενσωμάτωση Key Vault για ασφαλή κλειδιά API
  - Πρότυπα υποδομής Bicep
  - Παρακολούθηση χρήσης tokens και κόστους
  - Περιορισμός ρυθμού και χειρισμός σφαλμάτων

**Γρήγορη Εκκίνηση:**
```bash
# Πλοηγηθείτε στο παράδειγμα
cd examples/azure-openai-chat

# Αναπτύξτε τα πάντα
azd up

# Εγκαταστήστε τις εξαρτήσεις και ξεκινήστε να συνομιλείτε
pip install -r src/requirements.txt
python src/chat.py
```

**Τεχνολογίες:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Παραδείγματα Container App](container-app/README.md) 🆕
**Εκτενή παραδείγματα ανάπτυξης container περιλαμβάνονται σε αυτό το αποθετήριο**

- **Τοποθεσία:** `examples/container-app/`
- **Πολυπλοκότητα:** ⭐-⭐⭐⭐⭐ (Από Αρχάριο έως Εξειδικευμένο)
- **Τι Περιλαμβάνεται:**
  - [Κύριος Οδηγός](container-app/README.md) - Πλήρης επισκόπηση των αναπτύξεων container
  - [Απλό Flask API](../../../examples/container-app/simple-flask-api) - Βασικό παράδειγμα REST API
  - [Αρχιτεκτονική Microservices](../../../examples/container-app/microservices) - Παραγωγική, έτοιμη ανάπτυξη πολλαπλών υπηρεσιών
  - Γρήγορη εκκίνηση, Παραγωγή και Προχωρημένα πρότυπα
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

#### [Λύση Λιανικής με Πολλαπλούς Πράκτορες](retail-scenario.md) 🆕
**Πλήρης υλοποίηση έτοιμη για παραγωγή συμπεριλαμβάνεται σε αυτό το αποθετήριο**

- **Τοποθεσία:** `examples/retail-multiagent-arm-template/`
- **Πολυπλοκότητα:** ⭐⭐⭐⭐ (Προχωρημένο)
- **Τι Περιλαμβάνεται:**
  - Πλήρες πρότυπο ανάπτυξης ARM
  - Αρχιτεκτονική πολλαπλών πρακτόρων (Πελάτης + Αποθέματα)
  - Ενσωμάτωση Microsoft Foundry Models
  - AI Search με RAG
  - Πλήρης παρακολούθηση
  - Σενάριο ανάπτυξης με ένα κλικ

**Γρήγορη Εκκίνηση:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Τεχνολογίες:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Εξωτερικά Azure Samples (Κλωνοποίηση για Χρήση)

Τα παρακάτω παραδείγματα διατηρούνται σε επίσημα αποθετήρια Azure-Samples. Κλωνοποιήστε τα για να εξερευνήσετε διαφορετικά μοτίβα AZD:

### Απλές Εφαρμογές (Κεφάλαια 1-2)

| Πρότυπο | Αποθετήριο | Πολυπλοκότητα | Υπηρεσίες |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Τοπικό: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Τοπικό: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Πολλαπλές υπηρεσίες, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Πώς να χρησιμοποιήσετε:**
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
| **Microsoft Foundry Models Chat** | [Τοπικό: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | ανάπτυξη gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Βασική συνομιλία AI |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | πλαίσιο πρακτόρων |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | πρότυπο RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Επιχειρηματικό AI |

### Βάσεις Δεδομένων & Προχωρημένα Πρότυπα (Κεφάλαια 3-8)

| Πρότυπο | Αποθετήριο | Πολυπλοκότητα | Εστίαση |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Ενσωμάτωση βάσης δεδομένων |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Πολλαπλές υπηρεσίες |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Στόχοι Μάθησης

Εργαζόμενοι αυτά τα παραδείγματα, θα:
- Εξασκήσετε ροές εργασίας του Azure Developer CLI με ρεαλιστικά σενάρια εφαρμογών
- Κατανοήσετε διαφορετικές αρχιτεκτονικές εφαρμογών και τις υλοποιήσεις τους με azd
- Εξειδικευτείτε σε μοτίβα Infrastructure as Code για διάφορες υπηρεσίες Azure
- Εφαρμόσετε διαχείριση ρυθμίσεων και στρατηγικές ανάπτυξης ανά περιβάλλον
- Υλοποιήσετε μοτίβα παρακολούθησης, ασφάλειας και κλιμάκωσης σε πρακτικά πλαίσια
- Αποκτήσετε εμπειρία στην αντιμετώπιση προβλημάτων και τον εντοπισμό σφαλμάτων σε πραγματικά σενάρια ανάπτυξης

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση αυτών των παραδειγμάτων, θα μπορείτε να:
- Αναπτύσσετε με αυτοπεποίθηση διάφορους τύπους εφαρμογών χρησιμοποιώντας το Azure Developer CLI
- Προσαρμόζετε τα παρεχόμενα πρότυπα στις δικές σας απαιτήσεις εφαρμογής
- Σχεδιάζετε και υλοποιείτε προσαρμοσμένα μοτίβα υποδομής χρησιμοποιώντας Bicep
- Διαμορφώνετε σύνθετες πολυ-υπηρεσιακές εφαρμογές με σωστές εξαρτήσεις
- Εφαρμόζετε βέλτιστες πρακτικές ασφάλειας, παρακολούθησης και απόδοσης σε πραγματικά σενάρια
- Αντιμετωπίζετε και βελτιστοποιείτε αναπτύξεις βάσει πρακτικής εμπειρίας

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

> **💡 Νέοι στο AZD;** Ξεκινήστε με το παράδειγμα #1 (Flask API) - παίρνει ~20 λεπτά και διδάσκει βασικές έννοιες.

### Για Αρχάριους
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Τοπικό) ⭐  
   Αναπτύξτε ένα απλό REST API με scale-to-zero  
   **Χρόνος:** 20-25 λεπτά | **Κόστος:** $0-5/month  
   **Τι θα μάθετε:** Βασική ροή εργασίας azd, containerization, health probes  
   **Αναμενόμενο αποτέλεσμα:** Λειτουργικό endpoint API που επιστρέφει "Hello, World!" με παρακολούθηση

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Αναπτύξτε μια εφαρμογή Node.js Express με MongoDB  
   **Χρόνος:** 25-35 λεπτά | **Κόστος:** $10-30/month  
   **Τι θα μάθετε:** Ενσωμάτωση βάσης δεδομένων, μεταβλητές περιβάλλοντος, connection strings  
   **Αναμενόμενο αποτέλεσμα:** Εφαρμογή todo με δυνατότητες δημιουργίας/ανάγνωσης/ενημέρωσης/διαγραφής

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Φιλοξενία στατικής ιστοσελίδας React με Azure Static Web Apps  
   **Χρόνος:** 20-30 λεπτά | **Κόστος:** $0-10/month  
   **Τι θα μάθετε:** Στατική φιλοξενία, serverless functions, ανάπτυξη CDN  
   **Αναμενόμενο αποτέλεσμα:** React UI με backend API, αυτόματο SSL, παγκόσμιο CDN

### Για Ενδιάμεσους
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Τοπικό) ⭐⭐  
   Αναπτύξτε gpt-4.1 με διεπαφή συνομιλίας και ασφαλή διαχείριση κλειδιών API  
   **Χρόνος:** 35-45 λεπτά | **Κόστος:** $50-200/month  
   **Τι θα μάθετε:** Ανάπτυξη Microsoft Foundry Models, ενσωμάτωση Key Vault, παρακολούθηση tokens  
   **Αναμενόμενο αποτέλεσμα:** Λειτουργική εφαρμογή συνομιλίας με gpt-4.1 και παρακολούθηση κόστους

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Τοπικό) ⭐⭐⭐⭐  
   Παραγωγική αρχιτεκτονική πολλαπλών υπηρεσιών  
   **Χρόνος:** 45-60 λεπτά | **Κόστος:** $50-150/month  
   **Τι θα μάθετε:** Επικοινωνία υπηρεσιών, ουρές μηνυμάτων, κατανεμημένη εντοπισμός σφαλμάτων  
   **Αναμενόμενο αποτέλεσμα:** Σύστημα 2 υπηρεσιών (API Gateway + Product Service) με παρακολούθηση

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Ιστοσελίδα με C# API και Azure SQL Database  
   **Χρόνος:** 30-45 λεπτά | **Κόστος:** $20-80/month  
   **Τι θα μάθετε:** Entity Framework, migrations βάσης, ασφάλεια συνδέσεων  
   **Αναμενόμενο αποτέλεσμα:** C# API με Azure SQL backend, αυτόματη ανάπτυξη σχήματος

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions με HTTP triggers και Cosmos DB  
   **Χρόνος:** 30-40 λεπτά | **Κόστος:** $10-40/month  
   **Τι θα μάθετε:** Event-driven αρχιτεκτονική, serverless κλιμάκωση, ενσωμάτωση NoSQL  
   **Αναμενόμενο αποτέλεσμα:** Function app που ανταποκρίνεται σε HTTP αιτήματα με αποθήκευση σε Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Πολυ-υπηρεσιακή Java εφαρμογή με Container Apps και API gateway  
   **Χρόνος:** 60-90 λεπτά | **Κόστος:** $80-200/month  
   **Τι θα μάθετε:** Ανάπτυξη Spring Boot, service mesh, load balancing  
   **Αναμενόμενο αποτέλεσμα:** Πολυ-υπηρεσιακό σύστημα Java με service discovery και routing

### Πρότυπα Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Πλήρης ανάπτυξη gpt-4.1 με διεπαφή συνομιλίας  
   **Χρόνος:** 35-45 λεπτά | **Κόστος:** $50-200/month  
   **Αναμενόμενο αποτέλεσμα:** Λειτουργική εφαρμογή συνομιλίας με παρακολούθηση tokens και κόστους

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Ευφυής εφαρμογή συνομιλίας με αρχιτεκτονική RAG  
   **Χρόνος:** 60-90 λεπτά | **Κόστος:** $100-300/month  
   **Αναμενόμενο αποτέλεσμα:** Διεπαφή συνομιλίας με RAG, αναζήτηση εγγράφων και παραπομπές

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Ανάλυση εγγράφων χρησιμοποιώντας υπηρεσίες Azure AI  
   **Χρόνος:** 40-60 λεπτά | **Κόστος:** $20-80/month  
   **Αναμενόμενο αποτέλεσμα:** API που εξάγει κείμενο, πίνακες και οντότητες από ανεβασμένα έγγραφα

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Ροή εργασίας MLOps με Azure Machine Learning  
   **Χρόνος:** 2-3 ώρες | **Κόστος:** $150-500/month  
   **Αναμενόμενο αποτέλεσμα:** Αυτοματοποιημένη ML pipeline με εκπαίδευση, ανάπτυξη και παρακολούθηση

### Σενάρια Πραγματικού Κόσμου

#### **Retail Multi-Agent Solution** 🆕
**[Οδηγός Πλήρους Υλοποίησης](./retail-scenario.md)**

Μια ολοκληρωμένη, έτοιμη για παραγωγή λύση υποστήριξης πελατών με πολλούς πράκτορες που δείχνει την ανάπτυξη εφαρμογών AI επιχειρησιακού επιπέδου με το AZD. Αυτό το σενάριο παρέχει:

- **Πλήρης Αρχιτεκτονική**: Σύστημα πολλαπλών πρακτόρων με εξειδικευμένους πράκτορες εξυπηρέτησης πελατών και διαχείρισης αποθεμάτων
- **Production Infrastructure**: Αναπτύξεις Microsoft Foundry Models σε πολλαπλές περιοχές, Azure AI Search, Container Apps και ολοκληρωμένη παρακολούθηση
- **Ready-to-Deploy ARM Template**: Εγκατάσταση με ένα κλικ με πολλαπλούς τρόπους διαμόρφωσης (Minimal/Standard/Premium)
- **Advanced Features**: Έλεγχος ασφάλειας red teaming, πλαίσιο αξιολόγησης agents, βελτιστοποίηση κόστους και οδηγοί αντιμετώπισης προβλημάτων
- **Real Business Context**: Περίπτωση χρήσης υποστήριξης πελατών λιανικής με ανέβασμα αρχείων, ενσωμάτωση αναζήτησης και δυναμική κλιμάκωση

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Προχωρημένο - Έτοιμο για Παραγωγή Επιχειρησιακού Επιπέδου)

**Perfect for**: Προγραμματιστές AI, αρχιτέκτονες λύσεων και ομάδες που κατασκευάζουν πολυ-agent συστήματα για παραγωγή

**Quick Start**: Αναπτύξτε την πλήρη λύση σε λιγότερο από 30 λεπτά χρησιμοποιώντας το περιλαμβανόμενο ARM template με `./deploy.sh -g myResourceGroup`

## 📋 Οδηγίες Χρήσης

### Προαπαιτούμενα

Πριν εκτελέσετε οποιοδήποτε παράδειγμα:
- ✅ Συνδρομή Azure με δικαιώματα Owner ή Contributor
- ✅ Εγκατεστημένο Azure Developer CLI ([Οδηγός Εγκατάστασης](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop σε λειτουργία (για παραδείγματα με containers)
- ✅ Κατάλληλα όρια Azure (ελέγξτε τις απαιτήσεις κάθε παραδείγματος)

> **💰 Προειδοποίηση Κόστους:** Όλα τα παραδείγματα δημιουργούν πραγματικούς πόρους Azure που επιβαρύνουν λογαριασμό. Δείτε τα ξεχωριστά README αρχεία για εκτιμήσεις κόστους. Θυμηθείτε να τρέξετε `azd down` όταν τελειώσετε για να αποφύγετε συνεχιζόμενες χρεώσεις.

### Εκτέλεση Παραδειγμάτων Τοπικά

1. **Clone or Copy Example**
   ```bash
   # Πλοηγηθείτε στο επιθυμητό παράδειγμα
   cd examples/simple-web-app
   ```

2. **Initialize AZD Environment**
   ```bash
   # Αρχικοποιήστε με υπάρχον πρότυπο
   azd init
   
   # Ή δημιουργήστε νέο περιβάλλον
   azd env new my-environment
   ```

3. **Configure Environment**
   ```bash
   # Ορίστε τις απαραίτητες μεταβλητές
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Deploy**
   ```bash
   # Αναπτύξτε την υποδομή και την εφαρμογή
   azd up
   ```

5. **Verify Deployment**
   ```bash
   # Λήψη τελικών σημείων υπηρεσίας
   azd env get-values
   
   # Δοκιμή του τελικού σημείου (παράδειγμα)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Δείκτες Επιτυχίας που Αναμένονται:**
   - ✅ `azd up` ολοκληρώνεται χωρίς σφάλματα
   - ✅ Το endpoint της υπηρεσίας επιστρέφει HTTP 200
   - ✅ Το Azure Portal εμφανίζει κατάσταση "Running"
   - ✅ Το Application Insights λαμβάνει τηλεμετρία

> **⚠️ Προβλήματα;** Δείτε τα [Συνηθισμένα Προβλήματα](../docs/chapter-07-troubleshooting/common-issues.md) για αντιμετώπιση σφαλμάτων ανάπτυξης

### Προσαρμογή Παραδειγμάτων

Κάθε παράδειγμα περιλαμβάνει:
- **README.md** - Λεπτομερείς οδηγίες εγκατάστασης και προσαρμογής
- **azure.yaml** - Διαμόρφωση AZD με σχόλια
- **infra/** - Bicep templates με εξηγήσεις παραμέτρων
- **src/** - Κώδικας δείγματος εφαρμογής
- **scripts/** - Βοηθητικά scripts για κοινές εργασίες

## 🎯 Μαθησιακοί Στόχοι

### Κατηγορίες Παραδειγμάτων

#### **Basic Deployments**
- Εφαρμογές μίας υπηρεσίας
- Απλά μοτίβα υποδομής
- Βασική διαχείριση ρυθμίσεων
- Οικονομικά αποδοτικά περιβάλλοντα ανάπτυξης

#### **Advanced Scenarios**
- Αρχιτεκτονικές πολλαπλών υπηρεσιών
- Πολύπλοκες ρυθμίσεις δικτύωσης
- Μοτίβα ενσωμάτωσης βάσεων δεδομένων
- Υλοποιήσεις ασφάλειας και συμμόρφωσης

#### **Production-Ready Patterns**
- Ρυθμίσεις υψηλής διαθεσιμότητας
- Παρακολούθηση και observability
- Ενσωμάτωση CI/CD
- Σενάρια ανάκτησης από καταστροφή

## 📖 Περιγραφές Παραδειγμάτων

### Απλή Web Εφαρμογή - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Αρχάριος  
**Concepts**: Βασική ανάπτυξη, REST API, ενσωμάτωση NoSQL βάσης δεδομένων

### Στατικός Ιστότοπος - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Αρχάριος  
**Concepts**: Στατική φιλοξενία, serverless backend, μοντέρνα ανάπτυξη web

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Αρχάριος  
**Concepts**: Containerization, REST API, scale-to-zero, health probes, παρακολούθηση  
**Location**: [Τοπικό Παράδειγμα](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Προχωρημένο  
**Concepts**: Αρχιτεκτονική πολλαπλών υπηρεσιών, επικοινωνία υπηρεσιών, message queuing, distributed tracing  
**Location**: [Τοπικό Παράδειγμα](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Ενδιάμεσο  
**Concepts**: Entity Framework, συνδέσεις βάσης δεδομένων, ανάπτυξη web API

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Ενδιάμεσο  
**Concepts**: Event-driven αρχιτεκτονική, serverless computing, full-stack ανάπτυξη

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Ενδιάμεσο  
**Concepts**: Επικοινωνία μικροϋπηρεσιών, κατανεμημένα συστήματα, επιχειρησιακά μοτίβα

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complexity**: Ενδιάμεσο  
**Concepts**: RAG αρχιτεκτονική, vector search, ενσωμάτωση LLM

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Ενδιάμεσο  
**Concepts**: Ανάλυση εγγράφων, OCR, εξαγωγή δεδομένων

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Προχωρημένο  
**Concepts**: Εκπαίδευση μοντέλων, pipelines ανάπτυξης, παρακολούθηση

## 🛠 Παραδείγματα Διαμόρφωσης

Ο κατάλογος `configurations/` περιέχει επαναχρησιμοποιήσιμα συστατικά:

### Environment Configurations
- Ρυθμίσεις περιβάλλοντος ανάπτυξης
- Διαμορφώσεις περιβάλλοντος staging
- Παραγωγικές διαμορφώσεις
- Ρυθμίσεις ανάπτυξης σε πολλαπλές περιοχές

### Bicep Modules
- Επαναχρησιμοποιήσιμα συστατικά υποδομής
- Κοινά μοτίβα πόρων
- Προτύπα με ενισχυμένη ασφάλεια
- Ρυθμίσεις βελτιστοποιημένες για κόστος

### Helper Scripts
- Αυτοματοποίηση ρύθμισης περιβάλλοντος
- Scripts μετανάστευσης βάσεων δεδομένων
- Εργαλεία επαλήθευσης ανάπτυξης
- Utilities παρακολούθησης κόστους

## 🔧 Οδηγός Προσαρμογής

### Προσαρμογή Παραδειγμάτων για τη Δική σας Περίπτωση Χρήσης

1. **Επανεξέταση Προαπαιτούμενων**
   - Ελέγξτε τις απαιτήσεις υπηρεσιών Azure
   - Επαληθεύστε τα όρια της συνδρομής
   - Κατανοήστε τις επιπτώσεις στο κόστος

2. **Τροποποίηση Ρυθμίσεων**
   - Ενημερώστε τα οριστικά υπηρεσιών στο `azure.yaml`
   - Προσαρμόστε τα Bicep templates
   - Ρυθμίστε τις μεταβλητές περιβάλλοντος

3. **Ελέγξτε Εκτενώς**
   - Αναπτύξτε πρώτα στο περιβάλλον ανάπτυξης
   - Επαληθεύστε τη λειτουργικότητα
   - Δοκιμάστε την κλιμάκωση και την απόδοση

4. **Ανασκόπηση Ασφαλείας**
   - Επανελέγξτε τους ελέγχους πρόσβασης
   - Υλοποιήστε διαχείριση μυστικών
   - Ενεργοποιήστε παρακολούθηση και ειδοποιήσεις

## 📊 Πίνακας Σύγκρισης

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Διαδρομή Μάθησης

### Προτεινόμενη Προοδευτική Σειρά

1. **Ξεκινήστε με την Απλή Web Εφαρμογή**
   - Μάθετε βασικές έννοιες AZD
   - Κατανοήστε τη ροή ανάπτυξης
   - Πρακτική στη διαχείριση περιβάλλοντος

2. **Δοκιμάστε τον Στατικό Ιστότοπο**
   - Εξερευνήστε επιλογές φιλοξενίας
   - Μάθετε για ενσωμάτωση CDN
   - Κατανοήστε τη ρύθμιση DNS

3. **Προχωρήστε στο Container App**
   - Μάθετε βασικά containerization
   - Κατανοήστε έννοιες κλιμάκωσης
   - Πρακτική με Docker

4. **Προσθέστε Ενσωμάτωση Βάσης Δεδομένων**
   - Μάθετε παροχή βάσεων δεδομένων
   - Κατανοήστε connection strings
   - Πρακτική διαχείρισης μυστικών

5. **Εξερευνήστε Serverless**
   - Κατανοήστε event-driven αρχιτεκτονική
   - Μάθετε για triggers και bindings
   - Πρακτική με APIs

6. **Κατασκευάστε Microservices**
   - Μάθετε επικοινωνία υπηρεσιών
   - Κατανοήστε κατανεμημένα συστήματα
   - Πρακτική σε σύνθετες αναπτύξεις

## 🔍 Επιλογή του Κατάλληλου Παραδείγματος

### Ανά Τεχνολογικό Stack
- **Container Apps**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices (Τοπικό)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Τοπικό)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Τοπικό)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Τοπικό)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Τοπικό)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices (Τοπικό)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Τοπικό)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Τοπικό)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Τοπικό)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Τοπικό)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Ανά Μοτίβο Αρχιτεκτονικής
- **Simple REST API**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Τοπικό)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices (Τοπικό)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Τοπικό)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Τοπικό)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Ανά Επίπεδο Πολυπλοκότητας
- **Beginner**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (Τοπικό)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (Τοπικό)](../../../examples/container-app/microservices) (Πολλαπλές υπηρεσίες με message queuing), **Retail Multi-Agent Solution** (Ολοκληρωμένο σύστημα πολλαπλών agents με ARM template ανάπτυξη)

## 📚 Πρόσθετοι Πόροι

### Σύνδεσμοι Τεκμηρίωσης
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Παραδείγματα Κοινότητας
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App με C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Εργασία Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions με Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Καλύτερες Πρακτικές
- [Πλαίσιο Καλής Αρχιτεκτονικής Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Πλαίσιο Υιοθέτησης Νέφους](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Συνεισφορά Παραδειγμάτων

Έχετε ένα χρήσιμο παράδειγμα να μοιραστείτε; Καλωσορίζουμε τις συνεισφορές!

### Οδηγίες Υποβολής
1. Ακολουθήστε τη καθιερωμένη δομή καταλόγων
2. Συμπεριλάβετε πλήρες README.md
3. Προσθέστε σχόλια στα αρχεία διαμόρφωσης
4. Δοκιμάστε σχολαστικά πριν υποβάλετε
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

**Συμβουλή Επαγγελματία**: Ξεκινήστε με το απλούστερο παράδειγμα που ταιριάζει στο τεχνολογικό σας στοίβασμα και στη συνέχεια προχωρήστε σταδιακά σε πιο πολύπλοκα σενάρια. Κάθε παράδειγμα βασίζεται σε έννοιες από τα προηγούμενα!

## 🚀 Έτοιμοι να Ξεκινήσετε;

### Η Διαδρομή Μάθησής σας

1. **Εντελώς Αρχάριος;** → Ξεκινήστε με [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 λεπτά)
2. **Έχετε βασικές γνώσεις AZD;** → Δοκιμάστε [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 λεπτά)
3. **Κατασκευάζετε εφαρμογές AI;** → Ξεκινήστε με [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 λεπτά) ή εξερευνήστε [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ώρες)
4. **Χρειάζεστε συγκεκριμένο τεχνολογικό στοίβασμα;** → Χρησιμοποιήστε την ενότητα [Βρείτε το Κατάλληλο Παράδειγμα](#-finding-the-right-example) παραπάνω

### Επόμενα Βήματα

- ✅ Επανεξετάστε τα [Προαπαιτούμενα](#προαπαιτούμενα) παραπάνω
- ✅ Επιλέξτε ένα παράδειγμα που ταιριάζει στο επίπεδο δεξιοτήτων σας (δείτε τον [Οδηγό Πολυπλοκότητας](#υπόμνημα-βαθμολογίας-πολυπλοκότητας))
- ✅ Διαβάστε προσεκτικά το README του παραδείγματος πριν την ανάπτυξη
- ✅ Ορίστε μια υπενθύμιση για να εκτελέσετε `azd down` μετά τις δοκιμές
- ✅ Μοιραστείτε την εμπειρία σας μέσω GitHub Issues ή Συζητήσεων

### Χρειάζεστε Βοήθεια;

- 📖 [Συχνές Ερωτήσεις](../resources/faq.md) - Συνήθεις ερωτήσεις με απαντήσεις
- 🐛 [Οδηγός Επίλυσης Προβλημάτων](../docs/chapter-07-troubleshooting/common-issues.md) - Επίλυση προβλημάτων ανάπτυξης
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Ρωτήστε την κοινότητα
- 📚 [Οδηγός Μελέτης](../resources/study-guide.md) - Ενισχύστε τη μάθησή σας

---

**Πλοήγηση**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD For Beginners](../README.md)
- **📖 Υλικό Μελέτης**: [Οδηγός Μελέτης](../resources/study-guide.md) | [Συνοπτικό Υπόμνημα](../resources/cheat-sheet.md) | [Γλωσσάρι](../resources/glossary.md)
- **🔧 Πόροι**: [Συχνές Ερωτήσεις](../resources/faq.md) | [Επίλυση Προβλημάτων](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Τελευταία Ενημέρωση: November 2025 | [Αναφέρετε Προβλήματα](https://github.com/microsoft/AZD-for-beginners/issues) | [Συνεισφέρετε Παραδείγματα](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->