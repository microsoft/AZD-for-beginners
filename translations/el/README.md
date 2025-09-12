<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T20:51:09+00:00",
  "source_file": "README.md",
  "language_code": "el"
}
-->
# AZD Για Αρχάριους

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.el.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)  

![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)  

Ακολουθήστε αυτά τα βήματα για να ξεκινήσετε να χρησιμοποιείτε αυτούς τους πόρους:  
1. **Κάντε Fork το Repository**: Πατήστε [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Κλωνοποιήστε το Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Γίνετε μέλος στις κοινότητες Azure Discord και γνωρίστε ειδικούς και άλλους προγραμματιστές**](https://discord.com/invite/ByRwuEEgH4)  

### Υποστήριξη Πολλών Γλωσσών  

#### Υποστηρίζεται μέσω GitHub Action (Αυτοματοποιημένο & Πάντα Ενημερωμένο)  

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](./README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**Αν θέλετε να υποστηριχθούν επιπλέον γλώσσες, οι διαθέσιμες γλώσσες αναφέρονται [εδώ](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## Εισαγωγή  

Καλώς ήρθατε στον ολοκληρωμένο οδηγό για το Azure Developer CLI (azd). Αυτό το repository έχει σχεδιαστεί για να βοηθήσει προγραμματιστές όλων των επιπέδων, από φοιτητές έως επαγγελματίες προγραμματιστές, να μάθουν και να κατακτήσουν το Azure Developer CLI για αποδοτικές αναπτύξεις στο cloud, **με ιδιαίτερη έμφαση στην ανάπτυξη εφαρμογών AI χρησιμοποιώντας το Azure AI Foundry**. Αυτός ο δομημένος εκπαιδευτικός πόρος παρέχει πρακτική εμπειρία με αναπτύξεις στο Azure cloud, επίλυση κοινών προβλημάτων και εφαρμογή βέλτιστων πρακτικών για επιτυχημένες αναπτύξεις προτύπων AZD.  

### **Γιατί Αυτός Ο Οδηγός Είναι Σημαντικός Για Προγραμματιστές AI**  
Βάσει της πρόσφατης δημοσκόπησης στην κοινότητα Azure AI Foundry Discord, **το 45% των προγραμματιστών ενδιαφέρονται να χρησιμοποιήσουν το AZD για AI workloads** αλλά αντιμετωπίζουν προκλήσεις με:  
- Πολύπλοκες αρχιτεκτονικές AI πολλαπλών υπηρεσιών  
- Βέλτιστες πρακτικές ανάπτυξης AI σε παραγωγή  
- Ενσωμάτωση και παραμετροποίηση υπηρεσιών Azure AI  
- Βελτιστοποίηση κόστους για AI workloads  
- Επίλυση προβλημάτων ανάπτυξης που σχετίζονται με AI  

## Στόχοι Μάθησης  

Με την εργασία σας σε αυτό το repository, θα:  
- Κατακτήσετε τα βασικά και τις κύριες έννοιες του Azure Developer CLI  
- Μάθετε να αναπτύσσετε και να προμηθεύετε πόρους Azure χρησιμοποιώντας Infrastructure as Code  
- Αναπτύξετε δεξιότητες επίλυσης προβλημάτων για κοινά ζητήματα ανάπτυξης AZD  
- Κατανοήσετε την επικύρωση πριν την ανάπτυξη και τον προγραμματισμό χωρητικότητας  
- Εφαρμόσετε βέλτιστες πρακτικές ασφάλειας και στρατηγικές βελτιστοποίησης κόστους  
- Αποκτήσετε αυτοπεποίθηση στην ανάπτυξη εφαρμογών έτοιμων για παραγωγή στο Azure  

## Αποτελέσματα Μάθησης  

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε να:  
- Εγκαταστήσετε, παραμετροποιήσετε και χρησιμοποιήσετε με επιτυχία το Azure Developer CLI  
- Δημιουργήσετε και να αναπτύξετε εφαρμογές χρησιμοποιώντας πρότυπα AZD  
- Επίλυση προβλημάτων αυθεντικοποίησης, υποδομής και ανάπτυξης  
- Διενεργήσετε ελέγχους πριν την ανάπτυξη, συμπεριλαμβανομένου του προγραμματισμού χωρητικότητας και της επιλογής SKU  
- Εφαρμόσετε βέλτιστες πρακτικές παρακολούθησης, ασφάλειας και διαχείρισης κόστους  
- Ενσωματώσετε τις ροές εργασίας AZD σε pipelines CI/CD  

## Περιεχόμενα  

- [Τι είναι το Azure Developer CLI;](../..)  
- [Γρήγορη Εκκίνηση](../..)  
- [Διαδρομή Μάθησης](../..)  
  - [Για Προγραμματιστές AI (Συνιστάται να Ξεκινήσετε Εδώ!)](../..)  
  - [Για Φοιτητές & Αρχάριους](../..)  
  - [Για Προγραμματιστές](../..)  
  - [Για Μηχανικούς DevOps](../..)  
- [Τεκμηρίωση](../..)  
  - [Ξεκινώντας](../..)  
  - [Ανάπτυξη & Προμήθεια](../..)  
  - [Έλεγχοι Πριν την Ανάπτυξη](../..)  
  - [AI & Azure AI Foundry](../..)  
  - [Επίλυση Προβλημάτων](../..)  
- [Παραδείγματα & Πρότυπα](../..)  
  - [Προτεινόμενα: Πρότυπα Azure AI Foundry](../..)  
  - [Προτεινόμενα: Σενάρια Azure AI Foundry E2E](../..)  
  - [Επιπλέον Πρότυπα AZD](../..)  
  - [Εργαστήρια & Workshops](../..)  
- [Πόροι](../..)  
- [Συνεισφορά](../..)  
- [Υποστήριξη](../..)  
- [Κοινότητα](../..)  

## Τι είναι το Azure Developer CLI;  

Το Azure Developer CLI (azd) είναι μια διεπαφή γραμμής εντολών που επικεντρώνεται στους προγραμματιστές και επιταχύνει τη διαδικασία δημιουργίας και ανάπτυξης εφαρμογών στο Azure. Παρέχει:  

- **Αναπτύξεις βάσει προτύπων** - Χρησιμοποιήστε προκατασκευασμένα πρότυπα για κοινά μοτίβα εφαρμογών  
- **Infrastructure as Code** - Διαχειριστείτε πόρους Azure χρησιμοποιώντας Bicep ή Terraform  
- **Ενσωματωμένες ροές εργασίας** - Προμηθεύστε, αναπτύξτε και παρακολουθήστε εφαρμογές χωρίς κόπο  
- **Φιλικό προς τους προγραμματιστές** - Βελτιστοποιημένο για παραγωγικότητα και εμπειρία προγραμματιστών  

### **AZD + Azure AI Foundry: Ιδανικό για Αναπτύξεις AI**  

**Γιατί AZD για Λύσεις AI;** Το AZD αντιμετωπίζει τις κορυφαίες προκλήσεις που αντιμετωπίζουν οι προγραμματιστές AI:  

- **Πρότυπα Έτοιμα για AI** - Προκαθορισμένα πρότυπα για Azure OpenAI, Cognitive Services και ML workloads  
- **Ασφαλείς Αναπτύξεις AI** - Ενσωματωμένα μοτίβα ασφάλειας για υπηρεσίες AI, API keys και endpoints μοντέλων  
- **Μοτίβα AI σε Παραγωγή** - Βέλτιστες πρακτικές για κλιμακούμενες, οικονομικά αποδοτικές αναπτύξεις εφαρμογών AI  
- **Ροές Εργασίας AI από Άκρο σε Άκρο** - Από την ανάπτυξη μοντέλων έως την παραγωγική ανάπτυξη με σωστή παρακολούθηση  
- **Βελτιστοποίηση Κόστους** - Έξυπνες στρατηγικές κατανομής πόρων και κλιμάκωσης για workloads AI  
- **Ενσωμάτωση Azure AI Foundry** - Απρόσκοπτη σύνδεση με τον κατάλογο μοντέλων και τα endpoints του AI Foundry  

## Γρήγορη Εκκίνηση  

### Προαπαιτούμενα  
- Συνδρομή Azure  
- Εγκατεστημένο Azure CLI  
- Git (για κλωνοποίηση προτύπων)  

### Εγκατάσταση  
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### Η Πρώτη Σας Ανάπτυξη  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

### Η Πρώτη Σας Ανάπτυξη AI  
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```  

## Διαδρομή Μάθησης  

### Για Προγραμματιστές AI (Συνιστάται να Ξεκινήσετε Εδώ!)  
1. **Γρήγορη Εκκίνηση**: Δοκιμάστε το πρότυπο [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)  
2. **Μάθετε τα Βασικά**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)  
3. **Πρακτική Εξάσκηση**: Ολοκληρώστε το [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md)  
4. **Έτοιμο για Παραγωγή**: Ανασκόπηση [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md)  
5. **Προχωρημένο**: Αναπτύξτε το [contoso-chat](https://github.com/Azure-Samples/contoso-chat) πρότυπο για επιχειρήσεις  

### Για Φοιτητές & Αρχάριους  
1. Ξεκινήστε με [AZD Basics](docs/getting-started/azd-basics.md)  
2. Ακολουθήστε τον [Οδηγό Εγκατάστασης](docs/getting-started/installation.md)  
3. Ολοκληρώστε το [Πρώτο Σας Έργο](docs/getting-started/first-project.md)  
4. Εξασκηθείτε με το [Παράδειγμα Απλής Εφαρμογής Web](../../examples/simple-web-app)  

### Για Προγραμματιστές  
1. Ανασκόπηση [Οδηγού Παραμετροποίησης](docs/getting-started/configuration.md)  
2. Μελέτη [Οδηγού Ανάπτυξης](docs/deployment/deployment-guide.md)  
3. Εργασία με το [Παράδειγμα Εφαρμογής Βάσης Δεδομένων](../../examples/database-app)  
4. Εξερεύνηση [Παραδείγματος Εφαρμογής Container](../../examples/container-app)  

### Για Μηχανικούς DevOps  
1. Κατακτήστε την [Προμήθεια Πόρων](docs/deployment/provisioning.md)  
2. Εφαρμόστε [Ελέγχους Πριν την Ανάπτυξη](docs/pre-deployment/preflight-checks.md)  
3. Εξασκηθείτε στον [Προγραμματισμό Χωρητικότητας](docs/pre-deployment/capacity-planning.md)  
4. Προχωρημένο [Παράδειγμα Μικροϋπηρεσιών](../../examples/microservices)  

## Τεκμηρίωση  

### Ξεκινώντας  
- [**AZD Basics**](docs/getting-started/azd-basics.md) - Βασικές έννοιες και ορολογία  
- [**Εγκατάσταση & Ρύθμιση**](docs/getting-started/installation.md) - Οδηγοί εγκατάστασης ανά πλατφόρμα  
- [**Παραμετροποίηση**](docs/getting-started/configuration.md) - Ρύθμιση περιβάλλοντος και αυθεντικοποίηση  
- [**Το Πρώτο Σας Έργο**](docs/getting-started/first-project.md) - Βήμα-βήμα οδηγός  

### Ανάπτυξη & Προμήθεια  
- [**Οδηγός Ανάπτυξης**](docs/deployment/deployment-guide.md) - Πλήρεις ροές εργασίας ανάπτυξης  
- [**Προμήθεια Πόρων**](docs/deployment/provisioning.md) - Διαχείριση πόρων Azure  

### Έλεγχοι Πριν την Ανάπτυξη  
- [**Προγραμματισμός Χωρητικότητας**](docs/pre-deployment/capacity-planning.md) - Επικύρωση χωρητικότητας πόρων Azure  
- [**Επιλογή SKU**](docs/pre-deployment/sku-selection.md) - Επιλογή κατάλληλων SKU Azure  
- [**Ελέγχοι Πριν την Ανάπτυξη**](docs/pre-deployment/preflight-checks.md) - Αυτοματοποιημένα scripts επικύρωσης  

### AI & Azure AI Foundry  
- [**Ενσωμάτωση Azure AI Foundry**](docs/ai-foundry/azure-ai-foundry-integration.md) - Σύνδεση AZD με υπηρεσίες Azure AI Foundry  
- [**Μοτίβα Ανάπτυξης Μοντέλων AI**](docs/ai-foundry/ai-model-deployment.md) - Ανάπτυξη και δια
- [**Οδηγός Εντοπισμού Σφαλμάτων**](docs/troubleshooting/debugging.md) - Στρατηγικές εντοπισμού σφαλμάτων βήμα προς βήμα  
- [**Ειδική Αντιμετώπιση Προβλημάτων AI**](docs/troubleshooting/ai-troubleshooting.md) - Ζητήματα υπηρεσιών AI και ανάπτυξης μοντέλων  

## Παραδείγματα & Πρότυπα  

### [Προτεινόμενο: Πρότυπα Azure AI Foundry](https://ai.azure.com/resource/build/templates)  
**Ξεκινήστε εδώ αν αναπτύσσετε εφαρμογές AI!**  

| Πρότυπο | Περιγραφή | Πολυπλοκότητα | Υπηρεσίες |  
|----------|-------------|------------|----------|  
| [**Ξεκινήστε με AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Δημιουργήστε και αναπτύξτε μια βασική εφαρμογή συνομιλίας ενσωματωμένη με τα δεδομένα και τις πληροφορίες τηλεμετρίας σας χρησιμοποιώντας Azure Container Apps |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**Ξεκινήστε με AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Δημιουργήστε και αναπτύξτε μια βασική εφαρμογή agent με ενέργειες και πληροφορίες τηλεμετρίας χρησιμοποιώντας Azure Container Apps. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**Αυτοματοποίηση ροής εργασίας πολλαπλών agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Βελτιώστε τον προγραμματισμό και την αυτοματοποίηση εργασιών ενορχηστρώνοντας και διαχειρίζοντας μια ομάδα AI agents.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Δημιουργία εγγράφων από τα δεδομένα σας**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Επιταχύνετε τη δημιουργία εγγράφων όπως συμβόλαια, τιμολόγια και επενδυτικές προτάσεις βρίσκοντας και συνοψίζοντας σχετικές πληροφορίες από τα δεδομένα σας. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**Βελτίωση συναντήσεων με πελάτες μέσω agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Μεταφέρετε παλαιό κώδικα σε σύγχρονες γλώσσες αξιοποιώντας μια ομάδα agents. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**Εκσυγχρονισμός του κώδικα σας με agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Δημιουργήστε και αναπτύξτε μια βασική εφαρμογή συνομιλίας ενσωματωμένη με τα δεδομένα και τις πληροφορίες τηλεμετρίας σας χρησιμοποιώντας Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Δημιουργία του conversational agent σας**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Αξιοποιήστε προηγμένη κατανόηση συνομιλιών για να δημιουργήσετε και να βελτιώσετε chatbots και agents με καθορισμένες και ελεγχόμενες από τον άνθρωπο ροές εργασίας. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**Ανακάλυψη πληροφοριών από δεδομένα συνομιλιών**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Βελτιώστε την αποτελεσματικότητα του κέντρου επικοινωνίας ανακαλύπτοντας πληροφορίες από μεγάλα σύνολα δεδομένων ήχου και κειμένου χρησιμοποιώντας προηγμένες δυνατότητες κατανόησης περιεχομένου. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**Επεξεργασία περιεχομένου πολλαπλών μορφών**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Επεξεργαστείτε αξιώσεις, τιμολόγια, συμβόλαια και άλλα έγγραφα γρήγορα και με ακρίβεια εξάγοντας πληροφορίες από μη δομημένο περιεχόμενο και αντιστοιχίζοντάς το σε δομημένη μορφή. Αυτό το πρότυπο υποστηρίζει κείμενο, εικόνες, πίνακες και γραφήματα. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### Προτεινόμενο: Σενάρια Azure AI Foundry E2E  
**Ξεκινήστε εδώ αν αναπτύσσετε εφαρμογές AI!**  

| Πρότυπο | Περιγραφή | Πολυπλοκότητα | Υπηρεσίες |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Απλή διεπαφή συνομιλίας με Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Εφαρμογή συνομιλίας με δυνατότητες RAG και Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Ανάλυση εγγράφων με υπηρεσίες AI | ⭐⭐ | Azure Document Intelligence + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Πλαίσιο agent AI με κλήση λειτουργιών | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Εταιρική συνομιλία με ενορχήστρωση AI | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |  

### Πρόσθετα Πρότυπα AZD  
- [**Κατάλογος Παραδειγμάτων**](examples/README.md) - Πρακτικά παραδείγματα, πρότυπα και σενάρια πραγματικού κόσμου  
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Επίσημα πρότυπα της Microsoft  
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Πρότυπα που συνεισφέρθηκαν από την κοινότητα  

### Εργαστήρια & Εργαστήρια Εφαρμογών  
- [**Εργαστήριο AI Workshop**](docs/ai-foundry/ai-workshop-lab.md) - **ΝΕΟ**: Κάντε τις λύσεις AI σας έτοιμες για ανάπτυξη με AZD  
- [**Εργαστήριο AZD για Αρχάριους**](workshop/README.md) - Εστίαση στην ανάπτυξη προτύπων AI Agents με AZD  

## Πόροι  

### Γρήγορες Αναφορές  
- [**Φύλλο Εντολών**](resources/cheat-sheet.md) - Βασικές εντολές azd  
- [**Γλωσσάρι**](resources/glossary.md) - Ορολογία Azure και azd  
- [**Συχνές Ερωτήσεις**](resources/faq.md) - Συχνές ερωτήσεις  
- [**Οδηγός Μελέτης**](resources/study-guide.md) - Στόχοι μάθησης και ασκήσεις πρακτικής  

### Εξωτερικοί Πόροι  
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Κέντρο Αρχιτεκτονικής Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Υπολογιστής Τιμών Azure](https://azure.microsoft.com/pricing/calculator/)  
- [Κατάσταση Azure](https://status.azure.com/)  

## Συνεισφορά  

Καλωσορίζουμε συνεισφορές! Διαβάστε τον [Οδηγό Συνεισφοράς](CONTRIBUTING.md) για λεπτομέρειες σχετικά με:  
- Πώς να υποβάλετε ζητήματα και αιτήματα για λειτουργίες  
- Κατευθυντήριες γραμμές για συνεισφορά κώδικα  
- Βελτιώσεις τεκμηρίωσης  
- Πρότυπα κοινότητας  

## Υποστήριξη  

- **Ζητήματα**: [Αναφορά σφαλμάτων και αιτήματα λειτουργιών](https://github.com/microsoft/azd-for-beginners/issues)  
- **Συζητήσεις**: [Microsoft Azure Discord Community Q&A και συζητήσεις](https://discord.gg/microsoft-azure)  
- **Ειδική Υποστήριξη AI**: Εγγραφείτε στο [#Azure κανάλι](https://discord.gg/microsoft-azure) για συζητήσεις AZD + AI Foundry  
- **Email**: Για ιδιωτικές ερωτήσεις  
- **Microsoft Learn**: [Επίσημη τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Ενημερώσεις Κοινότητας από το Discord του Azure AI Foundry  

**Αποτελέσματα Δημοσκόπησης από το #Azure Κανάλι:**  
- **45%** των προγραμματιστών θέλουν να χρησιμοποιήσουν το AZD για φόρτους εργασίας AI  
- **Κύριες προκλήσεις**: Αναπτύξεις πολλαπλών υπηρεσιών, διαχείριση διαπιστευτηρίων, ετοιμότητα παραγωγής  
- **Πιο ζητούμενα**: Πρότυπα ειδικά για AI, οδηγοί αντιμετώπισης προβλημάτων, βέλτιστες πρακτικές  

**Εγγραφείτε στην κοινότητά μας για να:**  
- Μοιραστείτε τις εμπειρίες σας με AZD + AI και λάβετε βοήθεια  
- Αποκτήστε πρώιμες προεπισκοπήσεις νέων προτύπων AI  
- Συνεισφέρετε στις βέλτιστες πρακτικές ανάπτυξης AI  
- Επηρεάστε τη μελλοντική ανάπτυξη λειτουργιών AI + AZD  

## Άδεια  

Αυτό το έργο έχει άδεια χρήσης υπό την άδεια MIT - δείτε το αρχείο [LICENSE](../../LICENSE) για λεπτομέρειες.  

## Άλλα Μαθήματα  

Η ομάδα μας παράγει άλλα μαθήματα! Δείτε:  

- [**ΝΕΟ** Πρωτόκολλο Πλαισίου Μοντέλου (MCP) για Αρχάριους](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents για Αρχάριους](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Γενετική AI για Αρχάριους χρησιμοποιώντας .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Γενετική AI για Αρχάριους](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Γενετική AI για Αρχάριους χρησιμοποιώντας Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML για Αρχάριους](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Επιστήμη Δεδομένων για Αρχάριους](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI για Αρχάριους](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Κυβερνοασφάλεια για Αρχάριους](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Web Dev για Αρχάριους](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT για Αρχάριους](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [Ανάπτυξη XR για Αρχάριους](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Mastering GitHub Copilot για AI Συνεργατική Προγραμματιστική](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Mastering GitHub Copilot για Προγραμματιστές C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Choose Your Own Copilot Adventure](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**Πλοήγηση**  
- **Επόμενο Μάθημα**: [Βασικά AZD](docs/getting-started/azd-basics.md)  

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.