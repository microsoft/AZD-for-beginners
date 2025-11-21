<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b2e94dc30cab0675918a6ad34863b05d",
  "translation_date": "2025-11-21T06:12:28+00:00",
  "source_file": "README.md",
  "language_code": "el"
}
-->
# AZD Για Αρχάριους: Μια Δομημένη Εκπαιδευτική Διαδρομή

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.el.png) 

## Ξεκινώντας με Αυτό το Μάθημα

Ακολουθήστε αυτά τα βήματα για να ξεκινήσετε το ταξίδι σας με το AZD:

1. **Κάντε Fork το Αποθετήριο**: Πατήστε [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Κλωνοποιήστε το Αποθετήριο**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Γίνετε Μέλος της Κοινότητας**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) για υποστήριξη από ειδικούς
4. **Επιλέξτε τη Διαδρομή Μάθησης σας**: Επιλέξτε ένα κεφάλαιο παρακάτω που ταιριάζει στο επίπεδο εμπειρίας σας

### Υποστήριξη Πολλών Γλωσσών

#### Αυτόματες Μεταφράσεις (Πάντα Ενημερωμένες)

## Επισκόπηση Μαθήματος

Κατακτήστε το Azure Developer CLI (azd) μέσα από δομημένα κεφάλαια σχεδιασμένα για προοδευτική μάθηση. **Ειδική έμφαση στην ανάπτυξη εφαρμογών AI με ενσωμάτωση του Microsoft Foundry.**

### Γιατί Αυτό το Μάθημα Είναι Απαραίτητο για Σύγχρονους Προγραμματιστές

Βάσει των πληροφοριών της κοινότητας Microsoft Foundry Discord, **το 45% των προγραμματιστών θέλουν να χρησιμοποιήσουν το AZD για AI εργασίες** αλλά αντιμετωπίζουν προκλήσεις με:
- Πολύπλοκες αρχιτεκτονικές AI πολλαπλών υπηρεσιών
- Βέλτιστες πρακτικές ανάπτυξης AI σε παραγωγή  
- Ενσωμάτωση και ρύθμιση υπηρεσιών Azure AI
- Βελτιστοποίηση κόστους για AI εργασίες
- Επίλυση προβλημάτων ανάπτυξης AI

### Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του δομημένου μαθήματος, θα:
- **Κατακτήσετε τα Βασικά του AZD**: Βασικές έννοιες, εγκατάσταση και ρύθμιση
- **Αναπτύξετε Εφαρμογές AI**: Χρησιμοποιήστε το AZD με υπηρεσίες του Microsoft Foundry
- **Εφαρμόσετε Infrastructure as Code**: Διαχειριστείτε πόρους Azure με Bicep templates
- **Επιλύσετε Προβλήματα Ανάπτυξης**: Αντιμετωπίστε κοινά ζητήματα και εντοπίστε προβλήματα
- **Βελτιστοποιήσετε για Παραγωγή**: Ασφάλεια, κλιμάκωση, παρακολούθηση και διαχείριση κόστους
- **Δημιουργήσετε Λύσεις Πολλαπλών Πρακτόρων**: Αναπτύξτε σύνθετες αρχιτεκτονικές AI

## 📚 Κεφάλαια Μάθησης

*Επιλέξτε τη διαδρομή μάθησης σας βάσει του επιπέδου εμπειρίας και των στόχων σας*

### 🚀 Κεφάλαιο 1: Βάσεις & Γρήγορη Εκκίνηση
**Προαπαιτούμενα**: Συνδρομή Azure, βασικές γνώσεις γραμμής εντολών  
**Διάρκεια**: 30-45 λεπτά  
**Πολυπλοκότητα**: ⭐

#### Τι Θα Μάθετε
- Κατανόηση των βασικών του Azure Developer CLI
- Εγκατάσταση του AZD στην πλατφόρμα σας
- Η πρώτη σας επιτυχημένη ανάπτυξη

#### Πόροι Μάθησης
- **🎯 Ξεκινήστε Εδώ**: [Τι είναι το Azure Developer CLI;](../..)
- **📖 Θεωρία**: [Βασικά του AZD](docs/getting-started/azd-basics.md) - Βασικές έννοιες και ορολογία
- **⚙️ Ρύθμιση**: [Εγκατάσταση & Ρύθμιση](docs/getting-started/installation.md) - Οδηγοί για συγκεκριμένες πλατφόρμες
- **🛠️ Πρακτική**: [Το Πρώτο σας Έργο](docs/getting-started/first-project.md) - Βήμα προς βήμα οδηγός
- **📋 Γρήγορη Αναφορά**: [Φύλλο Εντολών](resources/cheat-sheet.md)

#### Πρακτικές Ασκήσεις
```bash
# Γρήγορος έλεγχος εγκατάστασης
azd version

# Αναπτύξτε την πρώτη σας εφαρμογή
azd init --template todo-nodejs-mongo
azd up
```

**💡 Αποτέλεσμα Κεφαλαίου**: Επιτυχής ανάπτυξη μιας απλής web εφαρμογής στο Azure χρησιμοποιώντας το AZD

**✅ Επιβεβαίωση Επιτυχίας:**
```bash
# Μετά την ολοκλήρωση του Κεφαλαίου 1, θα πρέπει να μπορείτε να:
azd version              # Εμφανίζει την εγκατεστημένη έκδοση
azd init --template todo-nodejs-mongo  # Αρχικοποιεί το έργο
azd up                  # Αναπτύσσει στο Azure
azd show                # Εμφανίζει τη διεύθυνση URL της εφαρμογής που εκτελείται
# Η εφαρμογή ανοίγει στον περιηγητή και λειτουργεί
azd down --force --purge  # Καθαρίζει τους πόρους
```

**📊 Επένδυση Χρόνου:** 30-45 λεπτά  
**📈 Επίπεδο Δεξιοτήτων Μετά:** Μπορείτε να αναπτύξετε βασικές εφαρμογές ανεξάρτητα

---

### 🤖 Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στο AI (Συνιστάται για Προγραμματιστές AI)
**Προαπαιτούμενα**: Ολοκλήρωση Κεφαλαίου 1  
**Διάρκεια**: 1-2 ώρες  
**Πολυπλοκότητα**: ⭐⭐

#### Τι Θα Μάθετε
- Ενσωμάτωση του Microsoft Foundry με το AZD
- Ανάπτυξη εφαρμογών με AI
- Κατανόηση ρυθμίσεων υπηρεσιών AI

#### Πόροι Μάθησης
- **🎯 Ξεκινήστε Εδώ**: [Ενσωμάτωση Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Μοτίβα**: [Ανάπτυξη Μοντέλων AI](docs/microsoft-foundry/ai-model-deployment.md) - Ανάπτυξη και διαχείριση μοντέλων AI
- **🛠️ Εργαστήριο**: [Εργαστήριο AI](docs/microsoft-foundry/ai-workshop-lab.md) - Κάντε τις λύσεις AI σας έτοιμες για AZD
- **🎥 Διαδραστικός Οδηγός**: [Υλικά Εργαστηρίου](workshop/README.md) - Μάθηση μέσω browser με MkDocs * DevContainer Environment
- **📋 Πρότυπα**: [Πρότυπα Microsoft Foundry](../..)
- **📝 Παραδείγματα**: [Παραδείγματα Ανάπτυξης AZD](examples/README.md)

#### Πρακτικές Ασκήσεις
```bash
# Αναπτύξτε την πρώτη σας εφαρμογή AI
azd init --template azure-search-openai-demo
azd up

# Δοκιμάστε επιπλέον πρότυπα AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Αποτέλεσμα Κεφαλαίου**: Ανάπτυξη και ρύθμιση μιας εφαρμογής συνομιλίας με AI και δυνατότητες RAG

**✅ Επιβεβαίωση Επιτυχίας:**
```bash
# Μετά το Κεφάλαιο 2, θα πρέπει να μπορείτε να:
azd init --template azure-search-openai-demo
azd up
# Δοκιμάστε τη διεπαφή συνομιλίας AI
# Κάντε ερωτήσεις και λάβετε απαντήσεις με τεχνητή νοημοσύνη και πηγές
# Επαληθεύστε ότι η ενσωμάτωση αναζήτησης λειτουργεί
azd monitor  # Ελέγξτε ότι το Application Insights δείχνει τηλεμετρία
azd down --force --purge
```

**📊 Επένδυση Χρόνου:** 1-2 ώρες  
**📈 Επίπεδο Δεξιοτήτων Μετά:** Μπορείτε να αναπτύξετε και να ρυθμίσετε εφαρμογές AI έτοιμες για παραγωγή  
**💰 Ενημέρωση Κόστους:** Κατανόηση κόστους $80-150/μήνα για ανάπτυξη, $300-3500/μήνα για παραγωγή

#### 💰 Σκέψεις Κόστους για Ανάπτυξη AI

**Περιβάλλον Ανάπτυξης (Εκτιμώμενο $80-150/μήνα):**
- Azure OpenAI (Pay-as-you-go): $0-50/μήνα (βάσει χρήσης token)
- AI Search (Βασικό επίπεδο): $75/μήνα
- Container Apps (Κατανάλωση): $0-20/μήνα
- Αποθήκευση (Standard): $1-5/μήνα

**Περιβάλλον Παραγωγής (Εκτιμώμενο $300-3,500+/μήνα):**
- Azure OpenAI (PTU για σταθερή απόδοση): $3,000+/μήνα Ή Pay-as-go με υψηλό όγκο
- AI Search (Standard επίπεδο): $250/μήνα
- Container Apps (Αφιερωμένο): $50-100/μήνα
- Application Insights: $5-50/μήνα
- Αποθήκευση (Premium): $10-50/μήνα

**💡 Συμβουλές Βελτιστοποίησης Κόστους:**
- Χρησιμοποιήστε **Δωρεάν Επίπεδο** Azure OpenAI για μάθηση (50,000 tokens/μήνα περιλαμβάνονται)
- Εκτελέστε `azd down` για αποδέσμευση πόρων όταν δεν αναπτύσσετε ενεργά
- Ξεκινήστε με χρέωση βάσει κατανάλωσης, αναβαθμίστε σε PTU μόνο για παραγωγή
- Χρησιμοποιήστε `azd provision --preview` για εκτίμηση κόστους πριν την ανάπτυξη
- Ενεργοποιήστε την αυτόματη κλιμάκωση: πληρώστε μόνο για πραγματική χρήση

**Παρακολούθηση Κόστους:**
```bash
# Ελέγξτε τις εκτιμώμενες μηνιαίες δαπάνες
azd provision --preview

# Παρακολουθήστε τις πραγματικές δαπάνες στο Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Κεφάλαιο 3: Ρύθμιση & Αυθεντικοποίηση
**Προαπαιτούμενα**: Ολοκλήρωση Κεφαλαίου 1  
**Διάρκεια**: 45-60 λεπτά  
**Πολυπλοκότητα**: ⭐⭐

#### Τι Θα Μάθετε
- Ρύθμιση και διαχείριση περιβάλλοντος
- Βέλτιστες πρακτικές αυθεντικοποίησης και ασφάλειας
- Ονοματοδοσία και οργάνωση πόρων

#### Πόροι Μάθησης
- **📖 Ρύθμιση**: [Οδηγός Ρύθμισης](docs/getting-started/configuration.md) - Ρύθμιση περιβάλλοντος
- **🔐 Ασφάλεια**: [Μοτίβα αυθεντικοποίησης και διαχειριζόμενη ταυτότητα](docs/getting-started/authsecurity.md) - Μοτίβα αυθεντικοποίησης
- **📝 Παραδείγματα**: [Παράδειγμα Εφαρμογής Βάσης Δεδομένων](examples/database-app/README.md) - Παραδείγματα βάσης δεδομένων AZD

#### Πρακτικές Ασκήσεις
- Ρύθμιση πολλαπλών περιβαλλόντων (dev, staging, prod)
- Ρύθμιση αυθεντικοποίησης με διαχειριζόμενη ταυτότητα
- Εφαρμογή ρυθμίσεων συγκεκριμένων για περιβάλλον

**💡 Αποτέλεσμα Κεφαλαίου**: Διαχείριση πολλαπλών περιβαλλόντων με σωστή αυθεντικοποίηση και ασφάλεια

---

### 🏗️ Κεφάλαιο 4: Infrastructure as Code & Ανάπτυξη
**Προαπαιτούμενα**: Ολοκλήρωση Κεφαλαίων 1-3  
**Διάρκεια**: 1-1.5 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐

#### Τι Θα Μάθετε
- Προηγμένα μοτίβα ανάπτυξης
- Infrastructure as Code με Bicep
- Στρατηγικές παροχής πόρων

#### Πόροι Μάθησης
- **📖 Ανάπτυξη**: [Οδηγός Ανάπτυξης](docs/deployment/deployment-guide.md) - Πλήρεις ροές εργασίας
- **🏗️ Παροχή**: [Παροχή Πόρων](docs/deployment/provisioning.md) - Διαχείριση πόρων Azure
- **📝 Παραδείγματα**: [Παράδειγμα Εφαρμογής Container](../../examples/container-app) - Ανάπτυξη containerized

#### Πρακτικές Ασκήσεις
- Δημιουργία προσαρμοσμένων Bicep templates
- Ανάπτυξη εφαρμογών πολλαπλών υπηρεσιών
- Εφαρμογή στρατηγικών ανάπτυξης blue-green

**💡 Αποτέλεσμα Κεφαλαίου**: Ανάπτυξη σύνθετων εφαρμογών πολλαπλών υπηρεσιών χρησιμοποιώντας προσαρμοσμένα templates υποδομής

---

### 🎯 Κεφάλαιο 5: Λύσεις AI Πολλαπλών Πρακτόρων (Προχωρημένο)
**Προαπαιτούμενα**: Ολοκλήρωση Κεφαλαίων 1-2  
**Διάρκεια**: 2-3 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐⭐

#### Τι Θα Μάθετε
- Μοτίβα αρχιτεκτονικής πολλαπλών πρακτόρων
- Ορχήστρωση και συντονισμός πρακτόρων
- Ανάπτυξη AI έτοιμη για παραγωγή

#### Πόροι Μάθησης
- **🤖 Προτεινόμενο Έργο**: [Λύση Λιανικής Πολλαπλών Πρακτόρων](examples/retail-scenario.md) - Πλήρης υλοποίηση
- **🛠️ ARM Templates**: [Πακέτο ARM Template](../../examples/retail-multiagent-arm-template) - Ανάπτυξη με ένα κλικ
- **📖 Αρχιτεκτονική**: [Μοτίβα συντονισμού πολλαπλών πρακτόρων](/docs/pre-deployment/coordination-patterns.md) - Μοτίβα

#### Πρακτικές Ασκήσεις
```bash
# Αναπτύξτε την πλήρη λύση πολλαπλών πρακτόρων λιανικής
cd examples/retail-multiagent-arm-template
./deploy.sh

# Εξερευνήστε τις διαμορφώσεις πρακτόρων
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Αποτέλεσμα Κεφαλαίου**: Ανάπτυξη και διαχείριση μιας έτοιμης για παραγωγή λύσης AI πολλαπλών πρακτόρων με πράκτορες Πελάτη και Αποθέματος

---

### 🔍 Κεφάλαιο 6: Επικύρωση & Σχεδιασμός πριν την Ανάπτυξη
**Προαπαιτούμενα**: Ολοκληρωμένο Κεφάλαιο 4  
**Διάρκεια**: 1 ώρα  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα μάθετε
- Σχεδιασμός χωρητικότητας και επικύρωση πόρων
- Στρατηγικές επιλογής SKU
- Έλεγχοι πριν την ανάπτυξη και αυτοματοποίηση

#### Πηγές Μάθησης
- **📊 Σχεδιασμός**: [Σχεδιασμός Χωρητικότητας](docs/pre-deployment/capacity-planning.md) - Επικύρωση πόρων
- **💰 Επιλογή**: [Επιλογή SKU](docs/pre-deployment/sku-selection.md) - Οικονομικές επιλογές
- **✅ Επικύρωση**: [Έλεγχοι πριν την ανάπτυξη](docs/pre-deployment/preflight-checks.md) - Αυτοματοποιημένα scripts

#### Πρακτικές Ασκήσεις
- Εκτέλεση scripts επικύρωσης χωρητικότητας
- Βελτιστοποίηση επιλογών SKU για κόστος
- Εφαρμογή αυτοματοποιημένων ελέγχων πριν την ανάπτυξη

**💡 Αποτέλεσμα Κεφαλαίου**: Επικύρωση και βελτιστοποίηση αναπτύξεων πριν την εκτέλεση

---

### 🚨 Κεφάλαιο 7: Εντοπισμός Σφαλμάτων & Αποσφαλμάτωση
**Προαπαιτούμενα**: Οποιοδήποτε κεφάλαιο ανάπτυξης ολοκληρωμένο  
**Διάρκεια**: 1-1.5 ώρες  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα μάθετε
- Συστηματικές προσεγγίσεις αποσφαλμάτωσης
- Συνηθισμένα προβλήματα και λύσεις
- Εντοπισμός σφαλμάτων ειδικά για AI

#### Πηγές Μάθησης
- **🔧 Συνηθισμένα Προβλήματα**: [Συνηθισμένα Προβλήματα](docs/troubleshooting/common-issues.md) - FAQ και λύσεις
- **🕵️ Αποσφαλμάτωση**: [Οδηγός Αποσφαλμάτωσης](docs/troubleshooting/debugging.md) - Στρατηγικές βήμα προς βήμα
- **🤖 Προβλήματα AI**: [Εντοπισμός Σφαλμάτων AI](docs/troubleshooting/ai-troubleshooting.md) - Προβλήματα υπηρεσιών AI

#### Πρακτικές Ασκήσεις
- Διάγνωση αποτυχιών ανάπτυξης
- Επίλυση προβλημάτων πιστοποίησης
- Εντοπισμός σφαλμάτων συνδεσιμότητας υπηρεσιών AI

**💡 Αποτέλεσμα Κεφαλαίου**: Αυτόνομη διάγνωση και επίλυση συνηθισμένων προβλημάτων ανάπτυξης

---

### 🏢 Κεφάλαιο 8: Παραγωγή & Εταιρικά Μοτίβα
**Προαπαιτούμενα**: Ολοκληρωμένα Κεφάλαια 1-4  
**Διάρκεια**: 2-3 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐⭐

#### Τι θα μάθετε
- Στρατηγικές ανάπτυξης παραγωγής
- Εταιρικά μοτίβα ασφαλείας
- Παρακολούθηση και βελτιστοποίηση κόστους

#### Πηγές Μάθησης
- **🏭 Παραγωγή**: [Βέλτιστες Πρακτικές AI Παραγωγής](docs/microsoft-foundry/production-ai-practices.md) - Εταιρικά μοτίβα
- **📝 Παραδείγματα**: [Παράδειγμα Μικροϋπηρεσιών](../../examples/microservices) - Σύνθετες αρχιτεκτονικές
- **📊 Παρακολούθηση**: [Ενσωμάτωση Application Insights](docs/pre-deployment/application-insights.md) - Παρακολούθηση

#### Πρακτικές Ασκήσεις
- Εφαρμογή εταιρικών μοτίβων ασφαλείας
- Ρύθμιση ολοκληρωμένης παρακολούθησης
- Ανάπτυξη στην παραγωγή με σωστή διακυβέρνηση

**💡 Αποτέλεσμα Κεφαλαίου**: Ανάπτυξη εφαρμογών έτοιμων για εταιρική παραγωγή με πλήρεις δυνατότητες παραγωγής

---

## 🎓 Επισκόπηση Εργαστηρίου: Εμπειρία Μάθησης με Πρακτική Εφαρμογή

> **⚠️ ΚΑΤΑΣΤΑΣΗ ΕΡΓΑΣΤΗΡΙΟΥ: Ενεργή Ανάπτυξη**  
> Τα υλικά του εργαστηρίου βρίσκονται υπό ανάπτυξη και βελτίωση. Οι βασικές ενότητες είναι λειτουργικές, αλλά ορισμένα προχωρημένα τμήματα είναι ημιτελή. Εργαζόμαστε ενεργά για την ολοκλήρωση όλου του περιεχομένου. [Παρακολούθηση προόδου →](workshop/README.md)

### Διαδραστικά Υλικά Εργαστηρίου
**Ολοκληρωμένη πρακτική μάθηση με εργαλεία βασισμένα σε περιηγητή και καθοδηγούμενες ασκήσεις**

Τα υλικά του εργαστηρίου παρέχουν μια δομημένη, διαδραστική εμπειρία μάθησης που συμπληρώνει το πρόγραμμα σπουδών που βασίζεται στα κεφάλαια παραπάνω. Το εργαστήριο είναι σχεδιασμένο τόσο για αυτοκατευθυνόμενη μάθηση όσο και για συνεδρίες με εκπαιδευτή.

#### 🛠️ Χαρακτηριστικά Εργαστηρίου
- **Διαδραστική Διεπαφή Περιηγητή**: Ολοκληρωμένο εργαστήριο με MkDocs με δυνατότητες αναζήτησης, αντιγραφής και θεμάτων
- **Ενσωμάτωση GitHub Codespaces**: Ρύθμιση περιβάλλοντος ανάπτυξης με ένα κλικ
- **Δομημένο Μονοπάτι Μάθησης**: 7 βήματα καθοδηγούμενων ασκήσεων (συνολικά 3.5 ώρες)
- **Ανακάλυψη → Ανάπτυξη → Προσαρμογή**: Προοδευτική μεθοδολογία
- **Διαδραστικό Περιβάλλον DevContainer**: Προρυθμισμένα εργαλεία και εξαρτήσεις

#### 📚 Δομή Εργαστηρίου
Το εργαστήριο ακολουθεί τη μεθοδολογία **Ανακάλυψη → Ανάπτυξη → Προσαρμογή**:

1. **Φάση Ανακάλυψης** (45 λεπτά)
   - Εξερεύνηση προτύπων και υπηρεσιών Microsoft Foundry
   - Κατανόηση μοτίβων αρχιτεκτονικής πολλαπλών πρακτόρων
   - Ανασκόπηση απαιτήσεων και προαπαιτούμενων ανάπτυξης

2. **Φάση Ανάπτυξης** (2 ώρες)
   - Πρακτική ανάπτυξη εφαρμογών AI με AZD
   - Ρύθμιση υπηρεσιών Azure AI και τελικών σημείων
   - Εφαρμογή μοτίβων ασφαλείας και πιστοποίησης

3. **Φάση Προσαρμογής** (45 λεπτά)
   - Τροποποίηση εφαρμογών για συγκεκριμένες περιπτώσεις χρήσης
   - Βελτιστοποίηση για ανάπτυξη παραγωγής
   - Εφαρμογή παρακολούθησης και διαχείρισης κόστους

#### 🚀 Ξεκινώντας με το Εργαστήριο
```bash
# Επιλογή 1: GitHub Codespaces (Συνιστάται)
# Κάντε κλικ στο "Code" → "Create codespace on main" στο αποθετήριο

# Επιλογή 2: Τοπική Ανάπτυξη
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Ακολουθήστε τις οδηγίες ρύθμισης στο workshop/README.md
```

#### 🎯 Αποτελέσματα Μάθησης Εργαστηρίου
Με την ολοκλήρωση του εργαστηρίου, οι συμμετέχοντες θα:
- **Αναπτύξουν Εφαρμογές AI Παραγωγής**: Χρησιμοποιήσουν το AZD με υπηρεσίες Microsoft Foundry
- **Κατακτήσουν Αρχιτεκτονικές Πολλαπλών Πρακτόρων**: Εφαρμόσουν συντονισμένες λύσεις AI πρακτόρων
- **Εφαρμόσουν Βέλτιστες Πρακτικές Ασφαλείας**: Ρυθμίσουν πιστοποίηση και έλεγχο πρόσβασης
- **Βελτιστοποιήσουν για Κλίμακα**: Σχεδιάσουν οικονομικές, αποδοτικές αναπτύξεις
- **Εντοπίσουν Σφάλματα Αναπτύξεων**: Επίλυση συνηθισμένων προβλημάτων αυτόνομα

#### 📖 Πηγές Εργαστηρίου
- **🎥 Διαδραστικός Οδηγός**: [Υλικά Εργαστηρίου](workshop/README.md) - Περιβάλλον μάθησης βασισμένο σε περιηγητή
- **📋 Οδηγίες Βήμα προς Βήμα**: [Καθοδηγούμενες Ασκήσεις](../../workshop/docs/instructions) - Λεπτομερής καθοδήγηση
- **🛠️ Εργαστήριο AI**: [Εργαστήριο AI](docs/microsoft-foundry/ai-workshop-lab.md) - Ασκήσεις εστιασμένες στο AI
- **💡 Γρήγορη Έναρξη**: [Οδηγός Ρύθμισης Εργαστηρίου](workshop/README.md#quick-start) - Ρύθμιση περιβάλλοντος

**Ιδανικό για**: Εταιρική εκπαίδευση, πανεπιστημιακά μαθήματα, αυτοκατευθυνόμενη μάθηση και bootcamps προγραμματιστών.

---

## 📖 Τι είναι το Azure Developer CLI;

Το Azure Developer CLI (azd) είναι μια γραμμή εντολών προσανατολισμένη στους προγραμματιστές που επιταχύνει τη διαδικασία δημιουργίας και ανάπτυξης εφαρμογών στο Azure. Παρέχει:

- **Αναπτύξεις βασισμένες σε πρότυπα** - Χρησιμοποιήστε προκαθορισμένα πρότυπα για κοινά μοτίβα εφαρμογών
- **Υποδομή ως Κώδικας** - Διαχειριστείτε πόρους Azure χρησιμοποιώντας Bicep ή Terraform  
- **Ενσωματωμένες ροές εργασίας** - Προμήθεια, ανάπτυξη και παρακολούθηση εφαρμογών χωρίς προβλήματα
- **Φιλικό προς τους προγραμματιστές** - Βελτιστοποιημένο για παραγωγικότητα και εμπειρία προγραμματιστών

### **AZD + Microsoft Foundry: Ιδανικό για Αναπτύξεις AI**

**Γιατί AZD για Λύσεις AI;** Το AZD αντιμετωπίζει τις κορυφαίες προκλήσεις που αντιμετωπίζουν οι προγραμματιστές AI:

- **Πρότυπα Έτοιμα για AI** - Προρυθμισμένα πρότυπα για Azure OpenAI, Cognitive Services και ML φόρτους εργασίας
- **Ασφαλείς Αναπτύξεις AI** - Ενσωματωμένα μοτίβα ασφαλείας για υπηρεσίες AI, κλειδιά API και τελικά σημεία μοντέλων  
- **Μοτίβα AI Παραγωγής** - Βέλτιστες πρακτικές για κλιμακούμενες, οικονομικές αναπτύξεις εφαρμογών AI
- **Ροές Εργασίας AI από Άκρο σε Άκρο** - Από την ανάπτυξη μοντέλων έως την ανάπτυξη παραγωγής με σωστή παρακολούθηση
- **Βελτιστοποίηση Κόστους** - Έξυπνη κατανομή πόρων και στρατηγικές κλιμάκωσης για φόρτους εργασίας AI
- **Ενσωμάτωση Microsoft Foundry** - Απρόσκοπτη σύνδεση με τον κατάλογο μοντέλων και τα τελικά σημεία του Microsoft Foundry

---

## 🎯 Βιβλιοθήκη Προτύπων & Παραδειγμάτων

### Προτεινόμενα: Πρότυπα Microsoft Foundry
**Ξεκινήστε εδώ αν αναπτύσσετε εφαρμογές AI!**

> **Σημείωση:** Αυτά τα πρότυπα δείχνουν διάφορα μοτίβα AI. Ορισμένα είναι εξωτερικά δείγματα Azure, άλλα είναι τοπικές υλοποιήσεις.

| Πρότυπο | Κεφάλαιο | Πολυπλοκότητα | Υπηρεσίες | Τύπος |
|----------|---------|------------|----------|------|
| [**Ξεκινήστε με AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Κεφάλαιο 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Εξωτερικό |
| [**Ξεκινήστε με AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Κεφάλαιο 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Εξωτερικό |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Κεφάλαιο 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Εξωτερικό |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Κεφάλαιο 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Εξωτερικό |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Κεφάλαιο 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Εξωτερικό |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Κεφάλαιο 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Εξωτερικό |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Κεφάλαιο 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Τοπικό** |

### Προτεινόμενα: Ολοκληρωμένα Σενάρια Μάθησης
**Πρότυπα εφαρμογών έτοιμα για παραγωγή, αντιστοιχισμένα στα κεφάλαια μάθησης**

| Πρότυπο | Κεφάλαιο Μάθησης | Πολυπλοκότητα | Κύρια Μάθηση |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Κεφάλαιο 2 | ⭐ | Βασικά μοτίβα ανάπτυξης AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Κεφάλαιο 2 | ⭐⭐ | Εφαρμογή RAG με Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Κεφάλαιο 4 | ⭐⭐ | Ενσωμάτωση Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Κεφάλαιο 5 | ⭐⭐⭐ | Πλαίσιο πρακτόρων και κλήση λειτουργιών |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Κεφάλαιο 8 | ⭐⭐⭐ | Ορχήστρωση AI για επιχειρήσεις |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Κεφάλαιο 5 | ⭐⭐⭐⭐ | Αρχιτεκτονική πολλαπλών πρακτόρων με πράκτορες Πελάτη και Αποθέματος |

### Μάθηση μέσω Παραδειγμάτων

> **📌 Τοπικά vs. Εξωτερικά Παραδείγματα:**  
> **Τοπικά Παραδείγματα** (σε αυτό το repo) = Έτοιμα για άμεση χρήση  
> **Εξωτερικά Παραδείγματα** (Azure Samples) = Κλωνοποίηση από συνδεδεμένα αποθετήρια

#### Τοπικά Παραδείγματα (Έτοιμα για Χρήση)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Πλήρης υλοποίηση έτοιμη για παραγωγή με πρότυπα ARM
  - Αρχιτεκτονική πολλαπλών πρακτόρων (Πελάτης + Απόθεμα)
  - Ολοκληρωμένη παρακολούθηση και αξιολόγηση
  - Ανάπτυξη με ένα κλικ μέσω προτύπου ARM

#### Τοπικά Παραδείγματα - Εφαρμογές Container (Κεφάλαια 2-5)
**Ολοκληρωμένα παραδείγματα ανάπτυξης container σε αυτό το αποθετήριο:**
- [**Παραδείγματα Εφαρμογών Container**](examples/container-app/README.md) - Πλήρης οδηγός για ανάπτυξη container
  - [Απλό Flask API](../../examples/container-app/simple-flask-api) - Βασικό REST API με scale-to-zero
  - [Αρχιτεκτονική Μικροϋπηρεσιών](../../examples/container-app/microservices) - Ανάπτυξη πολλαπλών υπηρεσιών έτοιμη για παραγωγή

### Εργαστήρια Πρακτικής Εξάσκησης
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Κάντε τις λύσεις AI σας έτοιμες για ανάπτυξη με AZD (2-3 ώρες)
- [**Οδηγός Διαδραστικού Εργαστηρίου**](workshop/README.md) - Εργαστήριο μέσω προγράμματος περιήγησης με MkDocs και DevContainer Environment
- [**Δομημένη Διαδρομή Μάθησης**](../../workshop/docs/instructions) - Καθοδηγούμενες ασκήσεις 7 βημάτων (Ανακάλυψη → Ανάπτυξη → Προσαρμογή)
- [**Εργαστήριο για Αρχάριους στο AZD**](workshop/README.md) - Πλήρες υλικό πρακτικής εξάσκησης με ενσωμάτωση GitHub Codespaces

### Εξωτερικοί Πόροι Μάθησης
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Κέντρο Αρχιτεκτονικής Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Υπολογιστής Τιμών Azure](https://azure.microsoft.com/pricing/calculator/)
- [Κατάσταση Azure](https://status.azure.com/)

---

## 🔧 Γρήγορος Οδηγός Αντιμετώπισης Προβλημάτων

**Συνηθισμένα προβλήματα που αντιμετωπίζουν οι αρχάριοι και άμεσες λύσεις:**

### ❌ "azd: command not found"

```bash
# Εγκαταστήστε πρώτα το AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Επαληθεύστε την εγκατάσταση
azd version
```

### ❌ "No subscription found" ή "Subscription not set"

```bash
# Λίστα διαθέσιμων συνδρομών
az account list --output table

# Ορισμός προεπιλεγμένης συνδρομής
az account set --subscription "<subscription-id-or-name>"

# Ορισμός για περιβάλλον AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Επαλήθευση
az account show
```

### ❌ "InsufficientQuota" ή "Quota exceeded"

```bash
# Δοκιμάστε διαφορετική περιοχή Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ή χρησιμοποιήστε μικρότερα SKUs στην ανάπτυξη
# Επεξεργαστείτε το infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" αποτυγχάνει στη μέση

```bash
# Επιλογή 1: Καθαρισμός και επανάληψη
azd down --force --purge
azd up

# Επιλογή 2: Απλώς διόρθωση της υποδομής
azd provision

# Επιλογή 3: Έλεγχος λεπτομερών αρχείων καταγραφής
azd show
azd logs
```

### ❌ "Authentication failed" ή "Token expired"

```bash
# Επαναπιστοποίηση
az logout
az login

azd auth logout
azd auth login

# Επαλήθευση πιστοποίησης
az account show
```

### ❌ "Resource already exists" ή συγκρούσεις ονομάτων

```bash
# Το AZD δημιουργεί μοναδικά ονόματα, αλλά αν υπάρχει σύγκρουση:
azd down --force --purge

# Τότε δοκιμάστε ξανά με νέο περιβάλλον
azd env new dev-v2
azd up
```

### ❌ Η ανάπτυξη προτύπου διαρκεί πολύ

**Κανονικοί χρόνοι αναμονής:**
- Απλή web εφαρμογή: 5-10 λεπτά
- Εφαρμογή με βάση δεδομένων: 10-15 λεπτά
- Εφαρμογές AI: 15-25 λεπτά (η παροχή OpenAI είναι αργή)

```bash
# Ελέγξτε την πρόοδο
azd show

# Εάν κολλήσει >30 λεπτά, ελέγξτε το Azure Portal:
azd monitor
# Αναζητήστε αποτυχημένες αναπτύξεις
```

### ❌ "Permission denied" ή "Forbidden"

```bash
# Ελέγξτε τον ρόλο σας στο Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Χρειάζεστε τουλάχιστον τον ρόλο "Συνεισφέρων"
# Ζητήστε από τον διαχειριστή του Azure να παραχωρήσει:
# - Συνεισφέρων (για πόρους)
# - Διαχειριστής Πρόσβασης Χρηστών (για αναθέσεις ρόλων)
```

### ❌ Δεν μπορώ να βρω το URL της αναπτυγμένης εφαρμογής

```bash
# Εμφάνιση όλων των τελικών σημείων υπηρεσίας
azd show

# Ή ανοίξτε το Azure Portal
azd monitor

# Ελέγξτε συγκεκριμένη υπηρεσία
azd env get-values
# Αναζητήστε μεταβλητές *_URL
```

### 📚 Πλήρεις Πόροι Αντιμετώπισης Προβλημάτων

- **Οδηγός Συνηθισμένων Προβλημάτων:** [Λεπτομερείς Λύσεις](docs/troubleshooting/common-issues.md)
- **Προβλήματα AI:** [Αντιμετώπιση Προβλημάτων AI](docs/troubleshooting/ai-troubleshooting.md)
- **Οδηγός Εντοπισμού Σφαλμάτων:** [Βήμα προς Βήμα Εντοπισμός Σφαλμάτων](docs/troubleshooting/debugging.md)
- **Λάβετε Βοήθεια:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Γρήγορος Οδηγός Αντιμετώπισης Προβλημάτων

**Συνηθισμένα προβλήματα που αντιμετωπίζουν οι αρχάριοι και άμεσες λύσεις:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Εγκαταστήστε πρώτα το AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Επαληθεύστε την εγκατάσταση
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" ή "Subscription not set"</strong></summary>

```bash
# Λίστα διαθέσιμων συνδρομών
az account list --output table

# Ορισμός προεπιλεγμένης συνδρομής
az account set --subscription "<subscription-id-or-name>"

# Ορισμός για περιβάλλον AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Επαλήθευση
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" ή "Quota exceeded"</strong></summary>

```bash
# Δοκιμάστε διαφορετική περιοχή Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ή χρησιμοποιήστε μικρότερα SKUs στην ανάπτυξη
# Επεξεργαστείτε το infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" αποτυγχάνει στη μέση</strong></summary>

```bash
# Επιλογή 1: Καθαρισμός και επανάληψη
azd down --force --purge
azd up

# Επιλογή 2: Απλώς διόρθωση της υποδομής
azd provision

# Επιλογή 3: Έλεγχος λεπτομερών καταγραφών
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" ή "Token expired"</strong></summary>

```bash
# Επαναπιστοποίηση
az logout
az login

azd auth logout
azd auth login

# Επαλήθευση πιστοποίησης
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" ή συγκρούσεις ονομάτων</strong></summary>

```bash
# Το AZD δημιουργεί μοναδικά ονόματα, αλλά αν υπάρχει σύγκρουση:
azd down --force --purge

# Τότε δοκιμάστε ξανά με νέο περιβάλλον
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Η ανάπτυξη προτύπου διαρκεί πολύ</strong></summary>

**Κανονικοί χρόνοι αναμονής:**
- Απλή web εφαρμογή: 5-10 λεπτά
- Εφαρμογή με βάση δεδομένων: 10-15 λεπτά
- Εφαρμογές AI: 15-25 λεπτά (η παροχή OpenAI είναι αργή)

```bash
# Ελέγξτε την πρόοδο
azd show

# Εάν κολλήσει >30 λεπτά, ελέγξτε το Azure Portal:
azd monitor
# Αναζητήστε αποτυχημένες αναπτύξεις
```
</details>

<details>
<summary><strong>❌ "Permission denied" ή "Forbidden"</strong></summary>

```bash
# Ελέγξτε τον ρόλο σας στο Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Χρειάζεστε τουλάχιστον τον ρόλο "Συνεισφέρων"
# Ζητήστε από τον διαχειριστή του Azure να παραχωρήσει:
# - Συνεισφέρων (για πόρους)
# - Διαχειριστής Πρόσβασης Χρηστών (για αναθέσεις ρόλων)
```
</details>

<details>
<summary><strong>❌ Δεν μπορώ να βρω το URL της αναπτυγμένης εφαρμογής</strong></summary>

```bash
# Εμφάνιση όλων των τελικών σημείων υπηρεσίας
azd show

# Ή ανοίξτε το Azure Portal
azd monitor

# Ελέγξτε συγκεκριμένη υπηρεσία
azd env get-values
# Αναζητήστε μεταβλητές *_URL
```
</details>

### 📚 Πλήρεις Πόροι Αντιμετώπισης Προβλημάτων

- **Οδηγός Συνηθισμένων Προβλημάτων:** [Λεπτομερείς Λύσεις](docs/troubleshooting/common-issues.md)
- **Προβλήματα AI:** [Αντιμετώπιση Προβλημάτων AI](docs/troubleshooting/ai-troubleshooting.md)
- **Οδηγός Εντοπισμού Σφαλμάτων:** [Βήμα προς Βήμα Εντοπισμός Σφαλμάτων](docs/troubleshooting/debugging.md)
- **Λάβετε Βοήθεια:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ολοκλήρωση Μαθήματος & Πιστοποίηση

### Παρακολούθηση Προόδου
Παρακολουθήστε την πρόοδό σας μέσα από κάθε κεφάλαιο:

- [ ] **Κεφάλαιο 1**: Βασικά & Γρήγορη Εκκίνηση ✅
- [ ] **Κεφάλαιο 2**: Ανάπτυξη με Προτεραιότητα στο AI ✅  
- [ ] **Κεφάλαιο 3**: Ρύθμιση & Αυθεντικοποίηση ✅
- [ ] **Κεφάλαιο 4**: Υποδομή ως Κώδικας & Ανάπτυξη ✅
- [ ] **Κεφάλαιο 5**: Λύσεις AI με Πολλαπλούς Παράγοντες ✅
- [ ] **Κεφάλαιο 6**: Επικύρωση & Σχεδιασμός πριν την Ανάπτυξη ✅
- [ ] **Κεφάλαιο 7**: Αντιμετώπιση Προβλημάτων & Εντοπισμός Σφαλμάτων ✅
- [ ] **Κεφάλαιο 8**: Παραγωγή & Πρότυπα Επιχειρήσεων ✅

### Επαλήθευση Μάθησης
Μετά την ολοκλήρωση κάθε κεφαλαίου, επαληθεύστε τις γνώσεις σας:
1. **Πρακτική Άσκηση**: Ολοκληρώστε την πρακτική ανάπτυξη του κεφαλαίου
2. **Έλεγχος Γνώσεων**: Ανασκόπηση της ενότητας FAQ του κεφαλαίου
3. **Συζήτηση στην Κοινότητα**: Μοιραστείτε την εμπειρία σας στο Azure Discord
4. **Επόμενο Κεφάλαιο**: Μετάβαση στο επόμενο επίπεδο πολυπλοκότητας

### Οφέλη Ολοκλήρωσης Μαθήματος
Με την ολοκλήρωση όλων των κεφαλαίων, θα έχετε:
- **Εμπειρία Παραγωγής**: Αναπτύξει πραγματικές εφαρμογές AI στο Azure
- **Επαγγελματικές Δεξιότητες**: Ικανότητες ανάπτυξης έτοιμες για επιχειρήσεις  
- **Αναγνώριση Κοινότητας**: Ενεργό μέλος της κοινότητας προγραμματιστών Azure
- **Επαγγελματική Εξέλιξη**: Περιζήτητη εξειδίκευση σε AZD και ανάπτυξη AI

---

## 🤝 Κοινότητα & Υποστήριξη

### Λάβετε Βοήθεια & Υποστήριξη
- **Τεχνικά Θέματα**: [Αναφορά σφαλμάτων και αιτήματα χαρακτηριστικών](https://github.com/microsoft/azd-for-beginners/issues)
- **Ερωτήσεις Μάθησης**: [Κοινότητα Microsoft Azure Discord](https://discord.gg/microsoft-azure) και [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Βοήθεια για AI**: Συμμετοχή στο [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Τεκμηρίωση**: [Επίσημη τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Ενημερώσεις Κοινότητας από το Microsoft Foundry Discord

**Πρόσφατα Αποτελέσματα Δημοσκοπήσεων από το Κανάλι #Azure:**
- **45%** των προγραμματιστών θέλουν να χρησιμοποιήσουν το AZD για AI εργασίες
- **Κορυφαίες προκλήσεις**: Αναπτύξεις πολλαπλών υπηρεσιών, διαχείριση διαπιστευτηρίων, ετοιμότητα παραγωγής  
- **Πιο ζητούμενα**: Πρότυπα ειδικά για AI, οδηγοί αντιμετώπισης προβλημάτων, βέλτιστες πρακτικές

**Συμμετέχετε στην κοινότητά μας για να:**
- Μοιραστείτε τις εμπειρίες σας με AZD + AI και λάβετε βοήθεια
- Αποκτήσετε πρώιμη πρόσβαση σε νέα πρότυπα AI
- Συμβάλετε στις βέλτιστες πρακτικές ανάπτυξης AI
- Επηρεάσετε την ανάπτυξη μελλοντικών χαρακτηριστικών AI + AZD

### Συμβολή στο Μάθημα
Καλωσορίζουμε τις συνεισφορές! Διαβάστε τον [Οδηγό Συνεισφοράς](CONTRIBUTING.md) για λεπτομέρειες σχετικά με:
- **Βελτιώσεις Περιεχομένου**: Βελτιώστε υπάρχοντα κεφάλαια και παραδείγματα
- **Νέα Παραδείγματα**: Προσθέστε σενάρια και πρότυπα πραγματικού κόσμου  
- **Μετάφραση**: Βοηθήστε στη διατήρηση υποστήριξης πολλών γλωσσών
- **Αναφορές Σφαλμάτων**: Βελτιώστε την ακρίβεια και τη σαφήνεια
- **Πρότυπα Κοινότητας**: Ακολουθήστε τις κατευθυντήριες γραμμές της κοινότητάς μας

---

## 📄 Πληροφορίες Μαθήματος

### Άδεια Χρήσης
Αυτό το έργο είναι αδειοδοτημένο υπό την Άδεια MIT - δείτε το αρχείο [LICENSE](../../LICENSE) για λεπτομέρειες.

### Σχετικοί Πόροι Μάθησης της Microsoft

Η ομάδα μας παράγει και άλλα ολοκληρωμένα μαθήματα:

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Σειρά Generative AI
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Βασική Μάθηση
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT για Αρχάριους](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
[![Ανάπτυξη XR για Αρχάριους](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### Σειρά Copilot  
[![Copilot για Συνεργατικό Προγραμματισμό με AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
[![Copilot για C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
[![Περιπέτεια Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Πλοήγηση Μαθήματος

**🚀 Έτοιμοι να Ξεκινήσετε τη Μάθηση;**

**Αρχάριοι**: Ξεκινήστε με [Κεφάλαιο 1: Βάσεις & Γρήγορη Εκκίνηση](../..)  
**Προγραμματιστές AI**: Μεταβείτε στο [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα την AI](../..)  
**Έμπειροι Προγραμματιστές**: Ξεκινήστε με [Κεφάλαιο 3: Ρύθμιση & Αυθεντικοποίηση](../..)

**Επόμενα Βήματα**: [Ξεκινήστε το Κεφάλαιο 1 - Βασικά του AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->