# Παραδείγματα - Πρακτικά Πρότυπα και Διαμορφώσεις AZD

**Μάθηση μέσω Παραδείγματος - Οργανωμένο κατά Κεφάλαιο**
- **📚 Αρχική Μαθήματος**: [AZD για Αρχάριους](../README.md)
- **📖 Χάρτης Κεφαλαίων**: Παραδείγματα οργανωμένα κατά πολυπλοκότητα μάθησης
- **🚀 Τοπικό Παράδειγμα**: [Λύση Retail Multi-Agent](retail-scenario.md)
- **🤖 Εξωτερικά Παραδείγματα AI**: Σύνδεσμοι προς αποθετήρια Azure Samples

> **📍 ΣΗΜΑΝΤΙΚΟ: Τοπικά vs Εξωτερικά Παραδείγματα**  
> Αυτό το αποθετήριο περιέχει **4 πλήρη τοπικά παραδείγματα** με πλήρεις υλοποιήσεις:  
> - **Microsoft Foundry Models Chat** (ανάπτυξη gpt-4.1 με διεπαφή συνομιλίας)  
> - **Container Apps** (Απλό Flask API + Microservices)  
> - **Εφαρμογή Βάσης Δεδομένων** (Web + SQL Database)  
> - **Retail Multi-Agent** (Επιχειρησιακή λύση AI)  
>  
> Επιπλέον παραδείγματα είναι **εξωτερικές αναφορές** σε αποθετήρια Azure-Samples που μπορείτε να κλωνοποιήσετε.

## Εισαγωγή

Αυτός ο κατάλογος παρέχει πρακτικά παραδείγματα και αναφορές για να σας βοηθήσει να μάθετε το Azure Developer CLI μέσω πρακτικής εξάσκησης. Το σενάριο Retail Multi-Agent είναι μια πλήρης, έτοιμη για παραγωγή υλοποίηση που περιλαμβάνεται σε αυτό το αποθετήριο. Επιπλέον παραδείγματα αναφέρονται σε επίσημα Azure Samples που επιδεικνύουν διάφορα μοτίβα AZD.

### Υπόμνημα Βαθμολόγησης Πολυπλοκότητας

- ⭐ **Αρχάριος** - Βασικές έννοιες, μία υπηρεσία, 15-30 λεπτά
- ⭐⭐ **Ενδιάμεσος** - Πολλαπλές υπηρεσίες, ενσωμάτωση βάσης δεδομένων, 30-60 λεπτά
- ⭐⭐⭐ **Προχωρημένος** - Πολυσύνθετη αρχιτεκτονική, ενσωμάτωση AI, 1-2 ώρες
- ⭐⭐⭐⭐ **Ειδικός** - Έτοιμο για παραγωγή, επιχειρησιακά μοτίβα, 2+ ώρες

## 🎯 Τι Περιέχει Πραγματικά Αυτό το Αποθετήριο

### ✅ Τοπική Υλοποίηση (Έτοιμη για Χρήση)

#### [Εφαρμογή συνομιλίας Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Πλήρης ανάπτυξη gpt-4.1 με διεπαφή συνομιλίας συμπεριλαμβάνεται σε αυτό το αποθετήριο**

- **Τοποθεσία:** `examples/azure-openai-chat/`
- **Πολυπλοκότητα:** ⭐⭐ (Ενδιάμεσο)
- **Τι Περιλαμβάνεται:**
  - Πλήρης ανάπτυξη Microsoft Foundry Models (gpt-4.1)
  - Διεπαφή συνομιλίας γραμμής εντολών Python
  - Ενσωμάτωση Key Vault για ασφαλή κλειδιά API
  - Πρότυπα υποδομής Bicep
  - Παρακολούθηση χρήσης token και κόστους
  - Περιορισμός ρυθμού και διαχείριση σφαλμάτων

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
**Πληρέστατα παραδείγματα ανάπτυξης containers περιλαμβάνονται σε αυτό το αποθετήριο**

- **Τοποθεσία:** `examples/container-app/`
- **Πολυπλοκότητα:** ⭐-⭐⭐⭐⭐ (Από Αρχάριο έως Προχωρημένο)
- **Τι Περιλαμβάνεται:**
  - [Κύριος Οδηγός](container-app/README.md) - Πλήρης επισκόπηση των αναπτύξεων containers
  - [Απλό Flask API](../../../examples/container-app/simple-flask-api) - Βασικό παράδειγμα REST API
  - [Αρχιτεκτονική Microservices](../../../examples/container-app/microservices) - Παραγωγική ανάπτυξη πολλαπλών υπηρεσιών
  - Γρήγορη εκκίνηση, πρότυπα παραγωγής και προχωρημένα μοτίβα
  - Παρακολούθηση, ασφάλεια και βελτιστοποίηση κόστους

**Γρήγορη Εκκίνηση:**
```bash
# Προβολή κύριου οδηγού
cd examples/container-app

# Ανάπτυξη απλού API με Flask
cd simple-flask-api
azd up

# Ανάπτυξη παραδείγματος μικροϋπηρεσιών
cd ../microservices
azd up
```

**Τεχνολογίες:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Λύση Retail Multi-Agent](retail-scenario.md) 🆕
**Πλήρης υλοποίηση έτοιμη για παραγωγή περιλαμβάνεται σε αυτό το αποθετήριο**

- **Τοποθεσία:** `examples/retail-multiagent-arm-template/`
- **Πολυπλοκότητα:** ⭐⭐⭐⭐ (Προχωρημένο)
- **Τι Περιλαμβάνεται:**
  - Πλήρες πρότυπο ανάπτυξης ARM
  - Αρχιτεκτονική πολλαπλών πρακτόρων (Customer + Inventory)
  - Ενσωμάτωση Microsoft Foundry Models
  - AI Search με RAG
  - Ολοκληρωμένη παρακολούθηση
  - Σενάριο ανάπτυξης με ένα κλικ

**Γρήγορη Εκκίνηση:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Τεχνολογίες:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Εξωτερικά Παραδείγματα Azure Samples (Κλωνοποιήστε για Χρήση)

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
| **Microsoft Foundry Models Chat** | [Τοπικό: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | ανάπτυξη gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Βασική συνομιλία AI |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Πλαίσιο πρακτόρων |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | μοτίβο RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Επιχειρησιακό AI |

### Βάσεις Δεδομένων & Προχωρημένα Πρότυπα (Κεφάλαια 3-8)

| Πρότυπο | Αποθετήριο | Πολυπλοκότητα | Εστίαση |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Ενσωμάτωση βάσης δεδομένων |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Πολλαπλές υπηρεσίες |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Στόχοι Μάθησης

Εργαζόμενοι με αυτά τα παραδείγματα, θα:
- Εξασκηθείτε στις ροές εργασίας του Azure Developer CLI με ρεαλιστικά σενάρια εφαρμογών
- Κατανοήσετε διαφορετικές αρχιτεκτονικές εφαρμογών και τις αντίστοιχες υλοποιήσεις azd
- Εξοικειωθείτε με τα μοτίβα Infrastructure as Code για διάφορες υπηρεσίες Azure
- Εφαρμόσετε διαχείριση διαμόρφωσης και στρατηγικές ανάπτυξης ανά περιβάλλον
- Υλοποιήσετε πρότυπα παρακολούθησης, ασφάλειας και κλιμάκωσης σε πρακτικά πλαίσια
- Αποκτήσετε εμπειρία στην αντιμετώπιση προβλημάτων και τον εντοπισμό σφαλμάτων σε πραγματικά σενάρια ανάπτυξης

## Μαθησιακά Αποτελέσματα

Με την ολοκλήρωση αυτών των παραδειγμάτων, θα μπορείτε να:
- Αναπτύσσετε διάφορους τύπους εφαρμογών χρησιμοποιώντας το Azure Developer CLI με αυτοπεποίθηση
- Προσαρμόζετε τα παρεχόμενα πρότυπα στις δικές σας απαιτήσεις εφαρμογής
- Σχεδιάζετε και υλοποιείτε προσαρμοσμένα μοτίβα υποδομής χρησιμοποιώντας Bicep
- Διαμορφώνετε πολύπλοκες εφαρμογές πολλαπλών υπηρεσιών με σωστές εξαρτήσεις
- Εφαρμόζετε βέλτιστες πρακτικές ασφάλειας, παρακολούθησης και απόδοσης σε πραγματικά σενάρια
- Εντοπίζετε και βελτιστοποιείτε αναπτύξεις βάσει πρακτικής εμπειρίας

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

> **💡 Νέος στο AZD;** Ξεκινήστε με το παράδειγμα #1 (Flask API) - παίρνει ~20 λεπτά και διδάσκει βασικές έννοιες.

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
   **Αναμενόμενο αποτέλεσμα:** Εφαρμογή Todo με λειτουργίες δημιουργίας/ανάγνωσης/ενημέρωσης/διαγραφής

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Φιλοξενήστε ένα React στατικό website με Azure Static Web Apps  
   **Χρόνος:** 20-30 λεπτά | **Κόστος:** $0-10/month  
   **Τι θα μάθετε:** Στατική φιλοξενία, serverless functions, ανάπτυξη μέσω CDN  
   **Αναμενόμενο αποτέλεσμα:** React UI με backend API, αυτόματο SSL, παγκόσμιο CDN

### Για Ενδιάμεσους Χρήστες
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Τοπικό) ⭐⭐  
   Αναπτύξτε gpt-4.1 με διεπαφή συνομιλίας και ασφαλή διαχείριση κλειδιών API  
   **Χρόνος:** 35-45 λεπτά | **Κόστος:** $50-200/month  
   **Τι θα μάθετε:** Ανάπτυξη Microsoft Foundry Models, ενσωμάτωση Key Vault, παρακολούθηση token  
   **Αναμενόμενο αποτέλεσμα:** Λειτουργική εφαρμογή συνομιλίας με gpt-4.1 και παρακολούθηση κόστους

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Τοπικό) ⭐⭐⭐⭐  
   Παραγωγική αρχιτεκτονική πολλαπλών υπηρεσιών  
   **Χρόνος:** 45-60 λεπτά | **Κόστος:** $50-150/month  
   **Τι θα μάθετε:** Επικοινωνία υπηρεσιών, ουρά μηνυμάτων, κατανεμημένη παρακολούθηση (tracing)  
   **Αναμενόμενο αποτέλεσμα:** Σύστημα 2 υπηρεσιών (API Gateway + Product Service) με παρακολούθηση

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web εφαρμογή με C# API και Azure SQL Database  
   **Χρόνος:** 30-45 λεπτά | **Κόστος:** $20-80/month  
   **Τι θα μάθετε:** Entity Framework, database migrations, ασφάλεια συνδέσεων  
   **Αναμενόμενο αποτέλεσμα:** C# API με Azure SQL backend, αυτόματη ανάπτυξη σχήματος

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions με HTTP triggers και Cosmos DB  
   **Χρόνος:** 30-40 λεπτά | **Κόστος:** $10-40/month  
   **Τι θα μάθετε:** Event-driven αρχιτεκτονική, serverless scaling, ενσωμάτωση NoSQL  
   **Αναμενόμενο αποτέλεσμα:** Function app που ανταποκρίνεται σε HTTP αιτήματα με αποθήκευση σε Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Πολυυπηρεσιακή Java εφαρμογή με Container Apps και API gateway  
   **Χρόνος:** 60-90 λεπτά | **Κόστος:** $80-200/month  
   **Τι θα μάθετε:** Ανάπτυξη Spring Boot, service mesh, load balancing  
   **Αναμενόμενο αποτέλεσμα:** Πολυυπηρεσιακό σύστημα Java με ανακάλυψη υπηρεσιών και δρομολόγηση

### Πρότυπα Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Τοπικό Παράδειγμα](../../../examples/azure-openai-chat)** ⭐⭐  
   Πλήρης ανάπτυξη gpt-4.1 με διεπαφή συνομιλίας  
   **Χρόνος:** 35-45 λεπτά | **Κόστος:** $50-200/month  
   **Αναμενόμενο αποτέλεσμα:** Λειτουργική εφαρμογή συνομιλίας με παρακολούθηση token και κόστους

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Έξυπνη εφαρμογή συνομιλίας με αρχιτεκτονική RAG  
   **Χρόνος:** 60-90 λεπτά | **Κόστος:** $100-300/month  
   **Αναμενόμενο αποτέλεσμα:** Διεπαφή συνομιλίας με RAG, αναζήτηση εγγράφων και παραπομπές

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Ανάλυση εγγράφων χρησιμοποιώντας υπηρεσίες Azure AI  
   **Χρόνος:** 40-60 λεπτά | **Κόστος:** $20-80/month  
   **Αναμενόμενο αποτέλεσμα:** API που εξάγει κείμενο, πίνακες και οντότητες από ανεβασμένα έγγραφα

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps ροή εργασίας με Azure Machine Learning  
   **Χρόνος:** 2-3 ώρες | **Κόστος:** $150-500/month  
   **Αναμενόμενο αποτέλεσμα:** Αυτοματοποιημένη ML pipeline με εκπαίδευση, ανάπτυξη και παρακολούθηση

### Σενάρια Πραγματικού Κόσμου

#### **Λύση Retail Multi-Agent** 🆕  
**[Οδηγός Πλήρους Υλοποίησης](./retail-scenario.md)**

Μια ολοκληρωμένη, έτοιμη για παραγωγή λύση πολλαπλών πρακτόρων για υποστήριξη πελατών που επιδεικνύει ανάπτυξη επιχειρησιακής κλάσης εφαρμογών AI με AZD. Αυτό το σενάριο παρέχει:
- **Πλήρης Αρχιτεκτονική**: Σύστημα πολλαπλών πρακτόρων με εξειδικευμένους πράκτορες εξυπηρέτησης πελατών και διαχείρισης αποθεμάτων
- **Υποδομή Παραγωγής**: Αναπτύξεις Microsoft Foundry Models σε πολλαπλές περιοχές, AI Search, Container Apps, και ολοκληρωμένη παρακολούθηση
- **Έτοιμο ARM Template για Ανάπτυξη**: Ανάπτυξη με ένα κλικ με πολλαπλές λειτουργίες διαμόρφωσης (Minimal/Standard/Premium)
- **Προηγμένα Χαρακτηριστικά**: Έλεγχος ασφάλειας red teaming, πλαίσιο αξιολόγησης πρακτόρων, βελτιστοποίηση κόστους και οδηγοί αντιμετώπισης προβλημάτων
- **Πραγματικό Επιχειρηματικό Πλαίσιο**: Περίπτωση χρήσης υποστήριξης πελατών λιανέμπορου με ανέβασμα αρχείων, ενσωμάτωση αναζήτησης και δυναμική κλιμάκωση

**Τεχνολογίες**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Πολυπλοκότητα**: ⭐⭐⭐⭐ (Προχωρημένο - Έτοιμο για Παραγωγή Επιχειρήσεων)

**Κατάλληλο για**: προγραμματιστές AI, αρχιτέκτονες λύσεων, και ομάδες που δημιουργούν συστήματα πολλαπλών πρακτόρων για παραγωγή

**Γρήγορη Εκκίνηση**: Αναπτύξτε την πλήρη λύση σε λιγότερο από 30 λεπτά χρησιμοποιώντας το συμπεριλαμβανόμενο ARM template με `./deploy.sh -g myResourceGroup`

## 📋 Οδηγίες Χρήσης

### Προαπαιτούμενα

Πριν εκτελέσετε οποιοδήποτε παράδειγμα:
- ✅ Συνδρομή Azure με δικαιώματα Owner ή Contributor
- ✅ Το Azure Developer CLI εγκατεστημένο ([Οδηγός Εγκατάστασης](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop σε λειτουργία (για παραδείγματα με containers)
- ✅ Κατάλληλα όρια πόρων Azure (ελέγξτε τις απαιτήσεις συγκεκριμένων παραδειγμάτων)

> **💰 Προειδοποίηση Κόστους:** Όλα τα παραδείγματα δημιουργούν πραγματικούς πόρους Azure που επιφέρουν χρεώσεις. Δείτε τα επιμέρους αρχεία README για εκτιμήσεις κόστους. Θυμηθείτε να εκτελέσετε `azd down` όταν τελειώσετε για να αποφύγετε συνεχείς χρεώσεις.

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
   # Λήψη σημείων τερματισμού υπηρεσίας
   azd env get-values
   
   # Δοκιμή του σημείου τερματισμού (παράδειγμα)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Δείκτες Επιτυχίας που Αναμένονται:**
   - ✅ `azd up` ολοκληρώνεται χωρίς σφάλματα
   - ✅ Το endpoint της υπηρεσίας επιστρέφει HTTP 200
   - ✅ Το Azure Portal εμφανίζει κατάσταση "Running"
   - ✅ Το Application Insights λαμβάνει τηλεμετρία

> **⚠️ Πρόβλημα;** Δείτε [Συνηθισμένα Προβλήματα](../docs/chapter-07-troubleshooting/common-issues.md) για αντιμετώπιση προβλημάτων ανάπτυξης

### Προσαρμογή Παραδειγμάτων

Κάθε παράδειγμα περιλαμβάνει:
- **README.md** - Λεπτομερείς οδηγίες εγκατάστασης και προσαρμογής
- **azure.yaml** - Διαμόρφωση AZD με σχόλια
- **infra/** - Πρότυπα Bicep με εξηγήσεις παραμέτρων
- **src/** - Δείγμα κώδικα εφαρμογής
- **scripts/** - Βοηθητικά scripts για κοινές εργασίες

## 🎯 Στόχοι Μάθησης

### Κατηγορίες Παραδειγμάτων

#### **Βασικές Αναπτύξεις**
- Εφαρμογές μίας υπηρεσίας
- Απλά πρότυπα υποδομής
- Βασική διαχείριση διαμόρφωσης
- Οικονομικά αποδοτικές ρυθμίσεις ανάπτυξης

#### **Προχωρημένα Σενάρια**
- Αρχιτεκτονικές πολλαπλών υπηρεσιών
- Σύνθετες ρυθμίσεις δικτύωσης
- Πρότυπα ενσωμάτωσης βάσης δεδομένων
- Υλοποιήσεις ασφάλειας και συμμόρφωσης

#### **Πρότυπα Έτοιμα για Παραγωγή**
- Ρυθμίσεις υψηλής διαθεσιμότητας
- Παρακολούθηση και παρατηρησιμότητα
- Ενσωμάτωση CI/CD
- Διατάξεις ανάκτησης από καταστροφή

## 📖 Περιγραφές Παραδειγμάτων

### Απλή Web Εφαρμογή - Node.js Express
**Τεχνολογίες**: Node.js, Express, MongoDB, Container Apps  
**Πολυπλοκότητα**: Αρχάριος  
**Έννοιες**: Βασική ανάπτυξη, REST API, ενσωμάτωση NoSQL βάσης δεδομένων

### Στατική Ιστοσελίδα - React SPA
**Τεχνολογίες**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Πολυπλοκότητα**: Αρχάριος  
**Έννοιες**: Στατική φιλοξενία, serverless backend, σύγχρονη ανάπτυξη web

### Container App - Python Flask
**Τεχνολογίες**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Πολυπλοκότητα**: Αρχάριος  
**Έννοιες**: Containerization, REST API, scale-to-zero, health probes, παρακολούθηση  
**Τοποθεσία**: [Τοπικό Παράδειγμα](../../../examples/container-app/simple-flask-api)

### Container App - Αρχιτεκτονική Microservices
**Τεχνολογίες**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Πολυπλοκότητα**: Προχωρημένο  
**Έννοιες**: Αρχιτεκτονική πολλαπλών υπηρεσιών, επικοινωνία υπηρεσιών, ουρά μηνυμάτων, κατανεμημένη ιχνηλασιμότητα  
**Τοποθεσία**: [Τοπικό Παράδειγμα](../../../examples/container-app/microservices)

### Εφαρμογή Βάσης Δεδομένων - C# με Azure SQL
**Τεχνολογίες**: C# ASP.NET Core, Azure SQL Database, App Service  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Entity Framework, συνδέσεις βάσης δεδομένων, ανάπτυξη web API

### Serverless Function - Python Azure Functions
**Τεχνολογίες**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Αρχιτεκτονική καθοδηγούμενη από γεγονότα, serverless computing, full-stack ανάπτυξη

### Microservices - Java Spring Boot
**Τεχνολογίες**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Επικοινωνία microservices, κατανεμημένα συστήματα, επιχειρησιακά πρότυπα

### Παραδείγματα Microsoft Foundry

#### Εφαρμογή Chat Microsoft Foundry Models
**Τεχνολογίες**: Microsoft Foundry Models, Cognitive Search, App Service  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: RAG αρχιτεκτονική, vector search, ενσωμάτωση LLM

#### Επεξεργασία Εγγράφων με AI
**Τεχνολογίες**: Azure AI Document Intelligence, Storage, Functions  
**Πολυπλοκότητα**: Ενδιάμεσο  
**Έννοιες**: Ανάλυση εγγράφων, OCR, εξαγωγή δεδομένων

#### Pipeline Μηχανικής Μάθησης
**Τεχνολογίες**: Azure ML, MLOps, Container Registry  
**Πολυπλοκότητα**: Προχωρημένο  
**Έννοιες**: Εκπαίδευση μοντέλων, pipelines ανάπτυξης, παρακολούθηση

## 🛠 Παραδείγματα Διαμόρφωσης

Ο φάκελος `configurations/` περιέχει επαναχρησιμοποιήσιμα στοιχεία:

### Διαμορφώσεις Περιβάλλοντος
- Ρυθμίσεις περιβάλλοντος ανάπτυξης
- Διαμορφώσεις περιβάλλοντος staging
- Ρυθμίσεις έτοιμες για παραγωγή
- Ρυθμίσεις ανάπτυξης πολλαπλών περιοχών

### Μονάδες Bicep
- Επαναχρησιμοποιήσιμα συστατικά υποδομής
- Συνήθη πρότυπα πόρων
- Πρότυπα με ενισχυμένη ασφάλεια
- Διαμορφώσεις βελτιστοποιημένες για κόστος

### Βοηθητικά Scripts
- Αυτοματοποίηση ρύθμισης περιβάλλοντος
- Σενάρια μετανάστευσης βάσης δεδομένων
- Εργαλεία επικύρωσης ανάπτυξης
- Εργαλεία παρακολούθησης κόστους

## 🔧 Οδηγός Προσαρμογής

### Προσαρμογή Παραδειγμάτων στο Σενάριό σας

1. **Επανεξέταση Προαπαιτούμενων**
   - Ελέγξτε τις απαιτήσεις υπηρεσιών Azure
   - Επαληθεύστε τα όρια συνδρομής
   - Κατανοήστε τις επιπτώσεις κόστους

2. **Τροποποιήστε τη Διαμόρφωση**
   - Ενημερώστε τους ορισμούς υπηρεσιών στο `azure.yaml`
   - Προσαρμόστε τα πρότυπα Bicep
   - Προσαρμόστε τις μεταβλητές περιβάλλοντος

3. **Δοκιμάστε Ενδελεχώς**
   - Αναπτύξτε πρώτα στο περιβάλλον ανάπτυξης
   - Επαληθεύστε τη λειτουργικότητα
   - Δοκιμάστε την κλιμάκωση και την απόδοση

4. **Έλεγχος Ασφάλειας**
   - Ελέγξτε τους ελέγχους πρόσβασης
   - Υλοποιήστε διαχείριση μυστικών
   - Ενεργοποιήστε παρακολούθηση και ειδοποιήσεις

## 📊 Πίνακας Σύγκρισης

| Παράδειγμα | Υπηρεσίες | Βάση Δεδομένων | Αυθεντικοποίηση | Παρακολούθηση | Πολυπλοκότητα |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Τοπικό) | 2 | ❌ | Key Vault | Πλήρες | ⭐⭐ |
| **Python Flask API** (Τοπικό) | 1 | ❌ | Βασικό | Πλήρες | ⭐ |
| **Microservices** (Τοπικό) | 5+ | ✅ | Επιχειρησιακή | Προχωρημένο | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Βασικό | Βασικό | ⭐ |
| React SPA + Functions | 3 | ✅ | Βασικό | Πλήρες | ⭐ |
| Python Flask Container | 2 | ❌ | Βασικό | Πλήρες | ⭐ |
| C# Web API + SQL | 2 | ✅ | Πλήρες | Πλήρες | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Πλήρες | Πλήρες | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Πλήρες | Πλήρες | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Πλήρες | Πλήρες | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Βασικό | Πλήρες | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Πλήρες | Πλήρες | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Τοπικό) | **8+** | **✅** | **Επιχειρησιακή** | **Προχωρημένο** | **⭐⭐⭐⭐** |

## 🎓 Διαδρομή Μάθησης

### Συνιστώμενη Σειρά

1. **Ξεκινήστε με Απλή Web Εφαρμογή**
   - Μάθετε τα βασικά του AZD
   - Κατανοήστε τη ροή εργασίας ανάπτυξης
   - Εξασκηθείτε στη διαχείριση περιβάλλοντος

2. **Δοκιμάστε Στατική Ιστοσελίδα**
   - Εξερευνήστε διαφορετικές επιλογές φιλοξενίας
   - Μάθετε για την ενσωμάτωση CDN
   - Κατανοήστε τη διαμόρφωση DNS

3. **Μεταβείτε σε Container App**
   - Μάθετε τις βασικές αρχές containerization
   - Κατανοήστε τις έννοιες κλιμάκωσης
   - Εξασκηθείτε με Docker

4. **Προσθέστε Ενσωμάτωση Βάσης Δεδομένων**
   - Μάθετε την προμήθεια/παροχή βάσεων δεδομένων
   - Κατανοήστε τα connection strings
   - Εξασκηθείτε στη διαχείριση μυστικών

5. **Εξερευνήστε το Serverless**
   - Κατανοήστε την αρχιτεκτονική καθοδηγούμενη από γεγονότα
   - Μάθετε για triggers και bindings
   - Εξασκηθείτε με APIs

6. **Κατασκευάστε Microservices**
   - Μάθετε επικοινωνία υπηρεσιών
   - Κατανοήστε κατανεμημένα συστήματα
   - Εξασκηθείτε σε σύνθετες αναπτύξεις

## 🔍 Εύρεση του Κατάλληλου Παραδείγματος

### Ανά Στοίβα Τεχνολογίας
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
- **Για Παραγωγή Επιχειρήσεων**: [Microservices (Τοπικό)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Ανά Πρότυπο Αρχιτεκτονικής
- **Simple REST API**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api)
- **Μονολιθικό**: Node.js Express Todo, C# Web API + SQL
- **Στατικό + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Τοπικό)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Τοπικό)](../../../examples/container-app/simple-flask-api), [Microservices (Τοπικό)](../../../examples/container-app/microservices), Java Microservices
- **AI-Powered**: **[Microsoft Foundry Models Chat (Τοπικό)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Αρχιτεκτονική Πολλαπλών Πρακτόρων**: **Retail Multi-Agent Solution**
- **Επιχειρησιακό Πολλαπλών Υπηρεσιών**: [Microservices (Τοπικό)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Ανά Επίπεδο Πολυπλοκότητας
- **Αρχάριος**: [Python Flask API (Τοπικό)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Ενδιάμεσο**: **[Microsoft Foundry Models Chat (Τοπικό)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Προχωρημένο**: ML Pipeline
- **Έτοιμο για Παραγωγή Επιχειρήσεων**: [Microservices (Τοπικό)](../../../examples/container-app/microservices) (Πολλαπλές υπηρεσίες με ουρά μηνυμάτων), **Retail Multi-Agent Solution** (Πλήρες σύστημα πολλαπλών πρακτόρων με ανάπτυξη μέσω ARM template)

## 📚 Επιπλέον Πόροι

### Σύνδεσμοι Τεκμηρίωσης
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Παραδείγματα Κοινότητας
- [Πρότυπα AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Πρότυπα Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Συλλογή Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Εφαρμογή Todo με C# και Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Εφαρμογή Todo με Python και MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Εφαρμογή Todo με Node.js και PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Εφαρμογή Web React με API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Εργασία Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions με Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Καλές Πρακτικές
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Συνεισφορά Παραδειγμάτων

Έχετε ένα χρήσιμο παράδειγμα να μοιραστείτε; Καλωσορίζουμε τις συνεισφορές!

### Οδηγίες Υποβολής
1. Ακολουθήστε την καθιερωμένη δομή καταλόγων
2. Συμπεριλάβετε ένα πλήρες README.md
3. Προσθέστε σχόλια στα αρχεία ρυθμίσεων
4. Δοκιμάστε διεξοδικά πριν υποβάλετε
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

**Συμβουλή Επαγγελματία**: Ξεκινήστε με το πιο απλό παράδειγμα που ταιριάζει στη στοίβα τεχνολογιών σας, και στη συνέχεια εργαστείτε σταδιακά προς πιο σύνθετα σενάρια. Κάθε παράδειγμα βασίζεται σε έννοιες από τα προηγούμενα!

## 🚀 Έτοιμοι να ξεκινήσετε;

### Η Διαδρομή Μάθησής σας

1. **Εντελώς Αρχάριος;** → Ξεκινήστε με [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 λεπτά)
2. **Έχετε βασικές γνώσεις AZD;** → Δοκιμάστε [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 λεπτά)
3. **Δημιουργείτε εφαρμογές AI;** → Ξεκινήστε με [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 λεπτά) ή εξερευνήστε [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ ώρες)
4. **Χρειάζεστε συγκεκριμένη στοίβα τεχνολογιών;** → Χρησιμοποιήστε την ενότητα [Εύρεση του κατάλληλου παραδείγματος](../../../examples) παραπάνω

### Επόμενα Βήματα

- ✅ Επανεξετάστε τα [Προαπαιτούμενα](../../../examples) παραπάνω
- ✅ Επιλέξτε ένα παράδειγμα που ταιριάζει στο επίπεδο δεξιοτήτων σας (βλ. [Υπόμνημα Πολυπλοκότητας](../../../examples))
- ✅ Διαβάστε προσεκτικά το README του παραδείγματος πριν την ανάπτυξη
- ✅ Ορίστε υπενθύμιση να εκτελέσετε `azd down` μετά τις δοκιμές
- ✅ Μοιραστείτε την εμπειρία σας μέσω GitHub Issues ή Discussions

### Χρειάζεστε Βοήθεια;

- 📖 [Συχνές Ερωτήσεις (FAQ)](../resources/faq.md) - Συνηθισμένες ερωτήσεις απαντημένες
- 🐛 [Οδηγός Αντιμετώπισης Προβλημάτων](../docs/chapter-07-troubleshooting/common-issues.md) - Διορθώστε προβλήματα ανάπτυξης
- 💬 [Συζητήσεις GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Ρωτήστε την κοινότητα
- 📚 [Οδηγός Μελέτης](../resources/study-guide.md) - Ενισχύστε τη μάθησή σας

---

**Πλοήγηση**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../README.md)
- **📖 Υλικό Μελέτης**: [Οδηγός Μελέτης](../resources/study-guide.md) | [Σύντομος Οδηγός](../resources/cheat-sheet.md) | [Γλωσσάριο](../resources/glossary.md)
- **🔧 Πόροι**: [Συχνές Ερωτήσεις (FAQ)](../resources/faq.md) | [Αντιμετώπιση προβλημάτων](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Τελευταία Ενημέρωση: Νοέμβριος 2025 | [Αναφέρετε Προβλήματα](https://github.com/microsoft/AZD-for-beginners/issues) | [Συνεισφέρετε Παραδείγματα](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθύνης:
Το παρόν έγγραφο έχει μεταφραστεί με τη χρήση της υπηρεσίας μετάφρασης με τεχνητή νοημοσύνη Co-op Translator (https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, παρακαλούμε λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε καμία ευθύνη για τυχόν παρανοήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->