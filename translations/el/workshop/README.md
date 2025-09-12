<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T21:58:07+00:00",
  "source_file": "workshop/README.md",
  "language_code": "el"
}
-->
# AZD για Εργαστήριο Ανάπτυξης AI

**Προηγούμενο:** [Οδηγός Επίλυσης Προβλημάτων AI](../docs/troubleshooting/ai-troubleshooting.md) | **Επόμενο:** [Εργαστηριακές Ενότητες](../../../workshop)

Καλώς ήρθατε στο πρακτικό εργαστήριο για την εκμάθηση του Azure Developer CLI (AZD) με έμφαση στην ανάπτυξη εφαρμογών AI. Αυτό το εργαστήριο έχει σχεδιαστεί για να σας καθοδηγήσει από τα βασικά του AZD μέχρι την ανάπτυξη λύσεων AI έτοιμων για παραγωγή.

## Επισκόπηση Εργαστηρίου

**Διάρκεια:** 2-3 ώρες  
**Επίπεδο:** Αρχάριος έως Μεσαίο  
**Προαπαιτούμενα:** Βασικές γνώσεις Azure, εργαλείων γραμμής εντολών και εννοιών AI

### Τι θα μάθετε

- **Βασικά του AZD**: Κατανόηση της Υποδομής ως Κώδικα με το AZD
- 🤖 **Ενσωμάτωση Υπηρεσιών AI**: Ανάπτυξη του Azure OpenAI, AI Search και άλλων υπηρεσιών AI
- **Ανάπτυξη Containers**: Χρήση του Azure Container Apps για εφαρμογές AI
- **Βέλτιστες Πρακτικές Ασφαλείας**: Εφαρμογή Managed Identity και ασφαλών ρυθμίσεων
- **Παρακολούθηση & Παρατηρησιμότητα**: Ρύθμιση του Application Insights για φόρτους εργασίας AI
- **Παραγωγικά Μοτίβα**: Στρατηγικές ανάπτυξης έτοιμες για επιχειρήσεις

## Δομή Εργαστηρίου

### Ενότητα 1: Βασικά του AZD (30 λεπτά)
- Εγκατάσταση και ρύθμιση του AZD
- Κατανόηση της δομής έργου του AZD
- Η πρώτη σας ανάπτυξη με AZD
- **Εργαστήριο**: Ανάπτυξη μιας απλής εφαρμογής web

### Ενότητα 2: Ενσωμάτωση του Azure OpenAI (45 λεπτά)
- Ρύθμιση πόρων του Azure OpenAI
- Στρατηγικές ανάπτυξης μοντέλων
- Ρύθμιση πρόσβασης API και αυθεντικοποίησης
- **Εργαστήριο**: Ανάπτυξη εφαρμογής συνομιλίας με GPT-4

### Ενότητα 3: Εφαρμογές RAG (45 λεπτά)
- Ενσωμάτωση του Azure AI Search
- Επεξεργασία εγγράφων με το Azure Document Intelligence
- Ενσωματώσεις διανυσμάτων και σημασιολογική αναζήτηση
- **Εργαστήριο**: Δημιουργία συστήματος ερωτήσεων και απαντήσεων για έγγραφα

### Ενότητα 4: Ανάπτυξη για Παραγωγή (30 λεπτά)
- Ρύθμιση Container Apps
- Βελτιστοποίηση κλιμάκωσης και απόδοσης
- Παρακολούθηση και καταγραφή
- **Εργαστήριο**: Ανάπτυξη για παραγωγή με παρατηρησιμότητα

### Ενότητα 5: Προχωρημένα Μοτίβα (15 λεπτά)
- Αναπτύξεις πολλαπλών περιβαλλόντων
- Ενσωμάτωση CI/CD
- Στρατηγικές βελτιστοποίησης κόστους
- **Επίλογος**: Λίστα ελέγχου ετοιμότητας για παραγωγή

## Προαπαιτούμενα

### Απαιτούμενα Εργαλεία

Παρακαλούμε εγκαταστήστε αυτά τα εργαλεία πριν το εργαστήριο:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Ρύθμιση Λογαριασμού Azure

1. **Συνδρομή Azure**: [Εγγραφείτε δωρεάν](https://azure.microsoft.com/free/)  
2. **Πρόσβαση στο Azure OpenAI**: [Αιτηθείτε πρόσβαση](https://aka.ms/oai/access)  
3. **Απαιτούμενα Δικαιώματα**:
   - Ρόλος Contributor στη συνδρομή ή την ομάδα πόρων
   - User Access Administrator (για αναθέσεις RBAC)

### Επαλήθευση Προαπαιτούμενων

Εκτελέστε αυτό το script για να επαληθεύσετε τη ρύθμιση σας:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Υλικά Εργαστηρίου

### Εργαστηριακές Ασκήσεις

Κάθε ενότητα περιλαμβάνει πρακτικά εργαστήρια με αρχικό κώδικα και οδηγίες βήμα προς βήμα:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Η πρώτη σας ανάπτυξη με AZD
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Εφαρμογή συνομιλίας με το Azure OpenAI
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - Εφαρμογή RAG με AI Search
- **[lab-4-production/](../../../workshop/lab-4-production)** - Μοτίβα ανάπτυξης για παραγωγή
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Προχωρημένα σενάρια ανάπτυξης

### Υλικά Αναφοράς

- **[Οδηγός Ενσωμάτωσης AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Ολοκληρωμένα μοτίβα ενσωμάτωσης
- **[Οδηγός Ανάπτυξης Μοντέλων AI](../docs/ai-foundry/ai-model-deployment.md)** - Βέλτιστες πρακτικές ανάπτυξης μοντέλων
- **[Πρακτικές AI για Παραγωγή](../docs/ai-foundry/production-ai-practices.md)** - Μοτίβα ανάπτυξης για επιχειρήσεις
- **[Οδηγός Επίλυσης Προβλημάτων AI](../docs/troubleshooting/ai-troubleshooting.md)** - Συνηθισμένα προβλήματα και λύσεις

### Δείγματα Προτύπων

Πρότυπα γρήγορης εκκίνησης για κοινά σενάρια AI:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Ξεκινώντας

### Επιλογή 1: GitHub Codespaces (Συνιστάται)

Ο πιο γρήγορος τρόπος για να ξεκινήσετε το εργαστήριο:

[![Άνοιγμα στο GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Επιλογή 2: Τοπική Ανάπτυξη

1. **Κλωνοποιήστε το αποθετήριο του εργαστηρίου:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Συνδεθείτε στο Azure:**
```bash
az login
azd auth login
```

3. **Ξεκινήστε με την Ενότητα 1:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Επιλογή 3: Εργαστήριο με Εκπαιδευτή

Αν παρακολουθείτε μια συνεδρία με εκπαιδευτή:

- 🎥 **Εγγραφή Εργαστηρίου**: [Διαθέσιμη κατ' απαίτηση](https://aka.ms/azd-ai-workshop)  
- 💬 **Κοινότητα Discord**: [Συμμετοχή για ζωντανή υποστήριξη](https://aka.ms/foundry/discord)  
- **Ανατροφοδότηση Εργαστηρίου**: [Μοιραστείτε την εμπειρία σας](https://aka.ms/azd-workshop-feedback)

## Χρονοδιάγραμμα Εργαστηρίου

### Αυτοκαθοδηγούμενη Μάθηση (3 ώρες)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Συνεδρία με Εκπαιδευτή (2.5 ώρες)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## Κριτήρια Επιτυχίας

Μέχρι το τέλος αυτού του εργαστηρίου, θα μπορείτε να:

✅ **Αναπτύξετε εφαρμογές AI** χρησιμοποιώντας πρότυπα AZD  
✅ **Ρυθμίσετε το Azure OpenAI** με σωστή ασφάλεια  
✅ **Δημιουργήσετε εφαρμογές RAG** με ενσωμάτωση του Azure AI Search  
✅ **Εφαρμόσετε μοτίβα παραγωγής** για φόρτους εργασίας AI σε επιχειρήσεις  
✅ **Παρακολουθήσετε και επιλύσετε προβλήματα** στις αναπτύξεις εφαρμογών AI  
✅ **Εφαρμόσετε στρατηγικές βελτιστοποίησης κόστους** για φόρτους εργασίας AI  

## Κοινότητα & Υποστήριξη

### Κατά τη Διάρκεια του Εργαστηρίου

- 🙋 **Ερωτήσεις**: Χρησιμοποιήστε τη συνομιλία του εργαστηρίου ή σηκώστε το χέρι σας  
- 🐛 **Προβλήματα**: Ελέγξτε τον [οδηγό επίλυσης προβλημάτων](../docs/troubleshooting/ai-troubleshooting.md)  
- **Συμβουλές**: Μοιραστείτε ανακαλύψεις με άλλους συμμετέχοντες  

### Μετά το Εργαστήριο

- 💬 **Discord**: [Κοινότητα Azure AI Foundry](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [Αναφορά προβλημάτων προτύπων](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Ανατροφοδότηση**: [Φόρμα αξιολόγησης εργαστηρίου](https://aka.ms/azd-workshop-feedback)

## Επόμενα Βήματα

### Συνεχίστε τη Μάθηση

1. **Προχωρημένα Σενάρια**: Εξερευνήστε [αναπτύξεις πολλαπλών περιοχών](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **Ενσωμάτωση CI/CD**: Ρυθμίστε [ροές εργασίας GitHub Actions](../docs/deployment/github-actions.md)  
3. **Προσαρμοσμένα Πρότυπα**: Δημιουργήστε τα δικά σας [πρότυπα AZD](../docs/getting-started/custom-templates.md)  

### Εφαρμόστε στα Έργα σας

1. **Αξιολόγηση**: Χρησιμοποιήστε τη [λίστα ελέγχου ετοιμότητας](./production-readiness-checklist.md)  
2. **Πρότυπα**: Ξεκινήστε με τα [πρότυπα AI](../../../workshop/templates)  
3. **Υποστήριξη**: Συμμετοχή στο [Azure AI Foundry Discord](https://aka.ms/foundry/discord)  

### Μοιραστείτε την Επιτυχία σας

- ⭐ **Αξιολογήστε το αποθετήριο** αν αυτό το εργαστήριο σας βοήθησε  
- 🐦 **Μοιραστείτε στα κοινωνικά δίκτυα** με #AzureDeveloperCLI #AzureAI  
- 📝 **Γράψτε ένα άρθρο** για το ταξίδι σας στην ανάπτυξη AI  

---

## Ανατροφοδότηση Εργαστηρίου

Η ανατροφοδότησή σας μας βοηθά να βελτιώσουμε την εμπειρία του εργαστηρίου:

| Παράμετρος | Βαθμολογία (1-5) | Σχόλια |
|------------|------------------|--------|
| Ποιότητα Περιεχομένου | ⭐⭐⭐⭐⭐ | |
| Πρακτικά Εργαστήρια | ⭐⭐⭐⭐⭐ | |
| Τεκμηρίωση | ⭐⭐⭐⭐⭐ | |
| Επίπεδο Δυσκολίας | ⭐⭐⭐⭐⭐ | |
| Συνολική Εμπειρία | ⭐⭐⭐⭐⭐ | |

**Υποβολή ανατροφοδότησης**: [Φόρμα αξιολόγησης εργαστηρίου](https://aka.ms/azd-workshop-feedback)

---

**Προηγούμενο:** [Οδηγός Επίλυσης Προβλημάτων AI](../docs/troubleshooting/ai-troubleshooting.md) | **Επόμενο:** Ξεκινήστε με [Ενότητα 1: Βασικά του AZD](../../../workshop/lab-1-azd-basics)

**Έτοιμοι να ξεκινήσετε την ανάπτυξη εφαρμογών AI με το AZD;**

[Ξεκινήστε την Ενότητα 1: Βασικά του AZD →](./lab-1-azd-basics/README.md)

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.