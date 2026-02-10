# AZD για Αρχάριους: Ένα Δομημένο Μαθησιακό Ταξίδι

![AZD-για-αρχάριους](../../translated_images/el/azdbeginners.5527441dd9f74068.webp) 

[![Παρατηρητές GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks στο GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Αστέρια GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord του Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord του Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Αυτόματες Μεταφράσεις (Πάντα Ενημερωμένες)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Αραβικά](../ar/README.md) | [Μπενγκάλι](../bn/README.md) | [Βουλγαρικά](../bg/README.md) | [Βιρμανικά (Μιανμάρ)](../my/README.md) | [Κινέζικα (Απλοποιημένα)](../zh-CN/README.md) | [Κινέζικα (Παραδοσιακά, Χονγκ Κονγκ)](../zh-HK/README.md) | [Κινέζικα (Παραδοσιακά, Μακάο)](../zh-MO/README.md) | [Κινέζικα (Παραδοσιακά, Ταϊβάν)](../zh-TW/README.md) | [Κροατικά](../hr/README.md) | [Τσέχικα](../cs/README.md) | [Δανικά](../da/README.md) | [Ολλανδικά](../nl/README.md) | [Εσθονικά](../et/README.md) | [Φινλανδικά](../fi/README.md) | [Γαλλικά](../fr/README.md) | [Γερμανικά](../de/README.md) | [Ελληνικά](./README.md) | [Εβραϊκά](../he/README.md) | [Χίντι](../hi/README.md) | [Ουγγρικά](../hu/README.md) | [Ινδονησιακά](../id/README.md) | [Ιταλικά](../it/README.md) | [Ιαπωνικά](../ja/README.md) | [Κανάντα](../kn/README.md) | [Κορεατικά](../ko/README.md) | [Λιθουανικά](../lt/README.md) | [Μαλαισιανά](../ms/README.md) | [Μαλαγιαλάμ](../ml/README.md) | [Μαράθι](../mr/README.md) | [Νεπάλι](../ne/README.md) | [Νιγηριανό Πίτζιν](../pcm/README.md) | [Νορβηγικά](../no/README.md) | [Περσικά (Φαρσί)](../fa/README.md) | [Πολωνικά](../pl/README.md) | [Πορτογαλικά (Βραζιλία)](../pt-BR/README.md) | [Πορτογαλικά (Πορτογαλία)](../pt-PT/README.md) | [Πουντζάμπι (Gurmukhi)](../pa/README.md) | [Ρουμανικά](../ro/README.md) | [Ρωσικά](../ru/README.md) | [Σερβικά (Κυριλλικά)](../sr/README.md) | [Σλοβακικά](../sk/README.md) | [Σλοβενικά](../sl/README.md) | [Ισπανικά](../es/README.md) | [Σουαχίλι](../sw/README.md) | [Σουηδικά](../sv/README.md) | [Ταγκάλογκ (Φιλιππινέζικα)](../tl/README.md) | [Ταμίλ](../ta/README.md) | [Τελούγκου](../te/README.md) | [Ταϊλανδέζικα](../th/README.md) | [Τουρκικά](../tr/README.md) | [Ουκρανικά](../uk/README.md) | [Ουρντού](../ur/README.md) | [Βιετναμέζικα](../vi/README.md)

> **Προτιμάτε να κλωνοποιήσετε τοπικά;**

> Αυτό το αποθετήριο περιλαμβάνει πάνω από 50 μεταφράσεις γλωσσών που αυξάνουν σημαντικά το μέγεθος λήψης. Για να κλωνοποιήσετε χωρίς τις μεταφράσεις, χρησιμοποιήστε sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Αυτό σας δίνει ό,τι χρειάζεστε για να ολοκληρώσετε το μάθημα με πολύ γρηγορότερη λήψη.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Τι είναι το Azure Developer CLI (azd);

**Azure Developer CLI (azd)** είναι ένα εργαλείο γραμμής εντολών φιλικό προς τον προγραμματιστή που κάνει απλή την ανάπτυξη εφαρμογών στο Azure. Αντί να δημιουργείτε και να συνδέετε χειροκίνητα δεκάδες πόρους Azure, μπορείτε να αναπτύξετε ολόκληρες εφαρμογές με μία εντολή.

### Το Μαγικό του `azd up`

```bash
# Αυτή η εντολή κάνει τα πάντα:
# ✅ Δημιουργεί όλους τους πόρους Azure
# ✅ Διαμορφώνει το δίκτυο και την ασφάλεια
# ✅ Δημιουργεί τον κώδικα της εφαρμογής σας
# ✅ Κάνει την ανάπτυξη στο Azure
# ✅ Σας παρέχει μια λειτουργική διεύθυνση URL
azd up
```

**Αυτό είναι!** Χωρίς κλικ στο Azure Portal, χωρίς πολύπλοκα ARM templates που πρέπει να μάθετε πρώτα, χωρίς χειροκίνητη διαμόρφωση - απλά λειτουργικές εφαρμογές στο Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Ποια είναι η Διαφορά;

Αυτή είναι η πιο συνηθισμένη ερώτηση που κάνουν οι αρχάριοι. Να η απλή απάντηση:

| Χαρακτηριστικό | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Σκοπός** | Διαχείριση μεμονωμένων πόρων Azure | Ανάπτυξη πλήρων εφαρμογών |
| **Νοοτροπία** | Εστίαση στην υποδομή | Εστίαση στην εφαρμογή |
| **Παράδειγμα** | `az webapp create --name myapp...` | `azd up` |
| **Καμπύλη Μάθησης** | Απαιτεί γνώση των υπηρεσιών Azure | Αρκεί να γνωρίζετε την εφαρμογή σας |
| **Καλύτερο Για** | DevOps, Υποδομή | Προγραμματιστές, Πρωτοτυποποίηση |

### Απλή Αναλογία

- **Azure CLI** είναι σαν να έχετε όλα τα εργαλεία για να χτίσετε ένα σπίτι - σφυριά, πριόνια, καρφιά. Μπορείτε να φτιάξετε οτιδήποτε, αλλά πρέπει να ξέρετε κατασκευή.
- **Azure Developer CLI** είναι σαν να προσλαμβάνετε έναν εργολάβο - περιγράφετε τι θέλετε και αυτός αναλαμβάνει την κατασκευή.

### Πότε να Χρησιμοποιήσετε Κάθε Ένα

| Σενάριο | Χρησιμοποιήστε Αυτό |
|----------|----------|
| "Θέλω να αναπτύξω την web εφαρμογή μου γρήγορα" | `azd up` |
| "Χρειάζομαι να δημιουργήσω μόνο έναν λογαριασμό αποθήκευσης" | `az storage account create` |
| "Δημιουργώ μια πλήρη εφαρμογή AI" | `azd init --template azure-search-openai-demo` |
| "Χρειάζομαι να εντοπίσω σφάλματα σε έναν συγκεκριμένο πόρο Azure" | `az resource show` |
| "Θέλω ανάπτυξη κατάλληλη για παραγωγή σε λίγα λεπτά" | `azd up --environment production` |

### Συνεργάζονται!

Το AZD χρησιμοποιεί το Azure CLI στο παρασκήνιο. Μπορείτε να χρησιμοποιήσετε και τα δύο:
```bash
# Αναπτύξτε την εφαρμογή σας με το AZD
azd up

# Στη συνέχεια, προσαρμόστε συγκεκριμένους πόρους με το Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Βρείτε Προτύπα στο Awesome AZD

Μην ξεκινάτε από το μηδέν! **Awesome AZD** είναι η συλλογή της κοινότητας με πρότυπα έτοιμα για ανάπτυξη:

| Πόρος | Περιγραφή |
|----------|-------------|
| 🔗 [**Γκαλερί Awesome AZD**](https://azure.github.io/awesome-azd/) | Περιηγηθείτε σε πάνω από 200 πρότυπα με ανάπτυξη με ένα κλικ |
| 🔗 [**Υποβάλετε ένα Πρότυπο**](https://github.com/Azure/awesome-azd/issues) | Συνεισφέρετε το δικό σας πρότυπο στην κοινότητα |
| 🔗 [**Αποθετήριο GitHub**](https://github.com/Azure/awesome-azd) | Βάλτε αστέρι και εξερευνήστε τον πηγαίο κώδικα |

### Δημοφιλή Πρότυπα AI από το Awesome AZD

```bash
# Συνομιλία RAG με Azure OpenAI + AI Αναζήτηση
azd init --template azure-search-openai-demo

# Γρήγορη Εφαρμογή Συνομιλίας AI
azd init --template openai-chat-app-quickstart

# Πράκτορες AI με Πράκτορες Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Ξεκινώντας σε 3 Βήματα

### Βήμα 1: Εγκαταστήστε το AZD (2 λεπτά)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Βήμα 2: Συνδεθείτε στο Azure

```bash
azd auth login
```

### Βήμα 3: Αναπτύξτε την Πρώτη Σας Εφαρμογή

```bash
# Αρχικοποίηση από ένα πρότυπο
azd init --template todo-nodejs-mongo

# Ανάπτυξη στο Azure (δημιουργεί τα πάντα!)
azd up
```

**🎉 Αυτό είναι!** Η εφαρμογή σας είναι τώρα ενεργή στο Azure.

### Καθαρισμός (Μην το Ξεχάσετε!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Πώς να Χρησιμοποιήσετε Αυτό το Μάθημα

Αυτό το μάθημα είναι σχεδιασμένο για **προοδευτική μάθηση** - ξεκινήστε από όπου νιώθετε άνετα και ανεβείτε σταδιακά:

| Η Εμπειρία Σας | Ξεκινήστε Εδώ |
|-----------------|------------|
| **Νέος/Νέα στο Azure** | [Κεφάλαιο 1: Θεμέλια](../..) |
| **Γνωρίζετε το Azure, νέος στο AZD** | [Κεφάλαιο 1: Θεμέλια](../..) |
| **Θέλετε να αναπτύξετε εφαρμογές AI** | [Κεφάλαιο 2: Ανάπτυξη AI](../..) |
| **Θέλετε πρακτική εξάσκηση** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 ώρες καθοδηγούμενο εργαστήριο |
| **Χρειάζεστε πρότυπα παραγωγής** | [Κεφάλαιο 8: Παραγωγή & Επιχειρησιακά](../..) |

### Γρήγορη Ρύθμιση

1. **Fork Αυτό το Αποθετήριο**: [![Forks στο GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Κλωνοποιήστε το**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Λάβετε Βοήθεια**: [Κοινότητα Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Προτιμάτε να κλωνοποιήσετε τοπικά;**

> Αυτό το αποθετήριο περιλαμβάνει πάνω από 50 μεταφράσεις γλωσσών που αυξάνουν σημαντικά το μέγεθος λήψης. Για να κλωνοποιήσετε χωρίς τις μεταφράσεις, χρησιμοποιήστε sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Αυτό σας δίνει ό,τι χρειάζεστε για να ολοκληρώσετε το μάθημα με πολύ γρηγορότερη λήψη.


## Επισκόπηση Μαθήματος

Κατακτήστε το Azure Developer CLI (azd) μέσω δομημένων κεφαλαίων σχεδιασμένων για προοδευτική μάθηση. **Ειδική έμφαση στην ανάπτυξη εφαρμογών AI με ενσωμάτωση Microsoft Foundry.**

### Γιατί Αυτό το Μάθημα Είναι Απαραίτητο για Σύγχρονους Προγραμματιστές

Βάσει των πληροφοριών της κοινότητας Microsoft Foundry στο Discord, **το 45% των προγραμματιστών θέλει να χρησιμοποιήσει το AZD για φόρτους εργασίας AI** αλλά αντιμετωπίζει προκλήσεις με:
- Πολύπλοκες πολυ-υπηρεσιακές αρχιτεκτονικές AI
- Βέλτιστες πρακτικές για ανάπτυξη AI σε παραγωγή  
- Ενσωμάτωση και διαμόρφωση υπηρεσιών Azure AI
- Βελτιστοποίηση κόστους για φόρτους εργασίας AI
- Επίλυση προβλημάτων συγκεκριμένων στην ανάπτυξη AI

### Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του δομημένου μαθήματος, θα:
- **Κατακτήσετε τα Θεμελιώδη του AZD**: Κύριες έννοιες, εγκατάσταση και διαμόρφωση
- **Αναπτύξετε Εφαρμογές AI**: Χρησιμοποιήστε το AZD με υπηρεσίες Microsoft Foundry
- **Εφαρμόσετε Υποδομή ως Κώδικα**: Διαχειριστείτε πόρους Azure με Bicep templates
- **Εντοπίσετε και Επιδιορθώσετε Προβλήματα Ανάπτυξης**: Επίλυση κοινών ζητημάτων και αποσφαλμάτωση
- **Βελτιστοποιήσετε για Παραγωγή**: Ασφάλεια, κλιμάκωση, παρακολούθηση και διαχείριση κόστους
- **Δημιουργήσετε Λύσεις με Πολλούς Πράκτορες**: Αναπτύξτε σύνθετες αρχιτεκτονικές AI

## 🗺️ Χάρτης Μαθήματος: Γρήγορη Πλοήγηση ανά Κεφάλαιο

Κάθε κεφάλαιο έχει ένα αποκλειστικό README με στόχους μάθησης, γρήγορα ξεκινήματα και ασκήσεις:

| Κεφάλαιο | Θέμα | Μαθήματα | Διάρκεια | Πολυπλοκότητα |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Getting Started | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Κεφ. 5: Πολλαπλών Πρακτόρων](docs/chapter-05-multi-agent/README.md)** | Λύσεις Πρακτόρων AI | [Σενάριο Λιανικής](examples/retail-scenario.md) &#124; [Μοτίβα Συντονισμού](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ώρες | ⭐⭐⭐⭐ |
| **[Κεφ. 6: Προ-Ανάπτυξη](docs/chapter-06-pre-deployment/README.md)** | Σχεδιασμός & Επικύρωση | [Προελέγχοι](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Σχεδιασμός Χωρητικότητας](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Επιλογή SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ώρα | ⭐⭐ |
| **[Κεφ. 7: Αντιμετώπιση Προβλημάτων](docs/chapter-07-troubleshooting/README.md)** | Αποσφαλμάτωση & Επιδιόρθωση | [Συνηθισμένα Ζητήματα](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Αποσφαλμάτωση](docs/chapter-07-troubleshooting/debugging.md) &#124; [Ζητήματα AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ώρες | ⭐⭐ |
| **[Κεφ. 8: Παραγωγή](docs/chapter-08-production/README.md)** | Πρότυπα Επιχειρήσεων | [Πρακτικές Παραγωγής](docs/chapter-08-production/production-ai-practices.md) | 2-3 ώρες | ⭐⭐⭐⭐ |
| **[🎓 Εργαστήριο](workshop/README.md)** | Πρακτικό Εργαστήριο | [Εισαγωγή](workshop/docs/instructions/0-Introduction.md) &#124; [Επιλογή](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Επικύρωση](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Αποδόμηση](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Διαμόρφωση](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Προσαρμογή](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Αποδόμηση Υποδομής](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Απολογισμός](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ώρες | ⭐⭐ |

**Συνολική Διάρκεια Μαθήματος:** ~10-14 ώρες | **Εξέλιξη Δεξιοτήτων:** Αρχάριος → Έτοιμος για Παραγωγή

---

## 📚 Κεφάλαια Μάθησης

*Επιλέξτε τη διαδρομή μάθησής σας ανάλογα με το επίπεδο εμπειρίας και τους στόχους*

### 🚀 Κεφάλαιο 1: Βασικά & Γρήγορη Εκκίνηση
**Προαπαιτούμενα**: Συνδρομή Azure, βασικές γνώσεις γραμμής εντολών  
**Διάρκεια**: 30-45 λεπτά  
**Πολυπλοκότητα**: ⭐

#### Τι θα μάθετε
- Κατανόηση των θεμελιωδών του Azure Developer CLI
- Εγκατάσταση του AZD στην πλατφόρμα σας
- Η πρώτη σας επιτυχημένη ανάπτυξη

#### Πόροι Μάθησης
- **🎯 Ξεκινήστε Εδώ**: [Τι είναι το Azure Developer CLI;](../..)
- **📖 Θεωρία**: [Βασικά του AZD](docs/chapter-01-foundation/azd-basics.md) - Κύριες έννοιες και ορολογία
- **⚙️ Εγκατάσταση**: [Εγκατάσταση & Ρύθμιση](docs/chapter-01-foundation/installation.md) - Οδηγοί ανά πλατφόρμα
- **🛠️ Πρακτικά**: [Το Πρώτο σας Έργο](docs/chapter-01-foundation/first-project.md) - Βήμα-βήμα σεμινάριο
- **📋 Γρήγορη Αναφορά**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Πρακτικές Ασκήσεις
```bash
# Γρήγορος έλεγχος εγκατάστασης
azd version

# Αναπτύξτε την πρώτη σας εφαρμογή
azd init --template todo-nodejs-mongo
azd up
```

**💡 Αποτέλεσμα Κεφαλαίου**: Ανάπτυξη με επιτυχία μιας απλής διαδικτυακής εφαρμογής στο Azure χρησιμοποιώντας AZD

**✅ Επιβεβαίωση Επιτυχίας:**
```bash
# Μετά την ολοκλήρωση του Κεφαλαίου 1, θα πρέπει να μπορείτε να:
azd version              # Εμφανίζει την εγκατεστημένη έκδοση
azd init --template todo-nodejs-mongo  # Αρχικοποιεί το έργο
azd up                  # Αναπτύσσει στο Azure
azd show                # Εμφανίζει το URL της εφαρμογής που εκτελείται
# Η εφαρμογή ανοίγει στον περιηγητή και λειτουργεί
azd down --force --purge  # Καθαρίζει τους πόρους
```

**📊 Χρόνος Επένδυσης:** 30-45 λεπτά  
**📈 Επίπεδο Δεξιοτήτων Μετά:** Μπορεί να αναπτύσσει βασικές εφαρμογές ανεξάρτητα

**✅ Επιβεβαίωση Επιτυχίας:**
```bash
# Μετά την ολοκλήρωση του Κεφαλαίου 1, θα πρέπει να μπορείτε να:
azd version              # Εμφανίζει την εγκατεστημένη έκδοση
azd init --template todo-nodejs-mongo  # Αρχικοποιεί το έργο
azd up                  # Αναπτύσσει στο Azure
azd show                # Εμφανίζει το URL της εφαρμογής που εκτελείται
# Η εφαρμογή ανοίγει στο πρόγραμμα περιήγησης και λειτουργεί
azd down --force --purge  # Καθαρίζει τους πόρους
```

**📊 Χρόνος Επένδυσης:** 30-45 λεπτά  
**📈 Επίπεδο Δεξιοτήτων Μετά:** Μπορεί να αναπτύσσει βασικές εφαρμογές ανεξάρτητα

---

### 🤖 Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στο AI (Συνιστάται για Προγραμματιστές AI)
**Προαπαιτούμενα**: Ολοκληρωμένο το Κεφάλαιο 1  
**Διάρκεια**: 1-2 ώρες  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα μάθετε
- Ενσωμάτωση Microsoft Foundry με το AZD
- Ανάπτυξη εφαρμογών με δυνατότητες AI
- Κατανόηση των ρυθμίσεων υπηρεσιών AI

#### Πόροι Μάθησης
- **🎯 Ξεκινήστε Εδώ**: [Ενσωμάτωση Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Πράκτορες AI**: [Οδηγός Πρακτόρων AI](docs/chapter-02-ai-development/agents.md) - Ανάπτυξη έξυπνων πρακτόρων με AZD
- **📖 Πρότυπα**: [Ανάπτυξη Μοντέλου AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Ανάπτυξη και διαχείριση μοντέλων AI
- **🛠️ Εργαστήριο**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Κάντε τις λύσεις AI έτοιμες για AZD
- **🎥 Διαδραστικός Οδηγός**: [Workshop Materials](workshop/README.md) - Μάθηση στο πρόγραμμα περιήγησης με MkDocs * DevContainer Environment
- **📋 Πρότυπα**: [Microsoft Foundry Templates](../..)
- **📝 Παραδείγματα**: [AZD Deployment Examples](examples/README.md)

#### Πρακτικές Ασκήσεις
```bash
# Αναπτύξτε την πρώτη σας εφαρμογή τεχνητής νοημοσύνης
azd init --template azure-search-openai-demo
azd up

# Δοκιμάστε επιπλέον πρότυπα τεχνητής νοημοσύνης
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε και διαμορφώστε μια εφαρμογή συνομιλίας με δυνατότητες AI και RAG

**✅ Επιβεβαίωση Επιτυχίας:**
```bash
# Μετά το Κεφάλαιο 2, θα πρέπει να μπορείτε να:
azd init --template azure-search-openai-demo
azd up
# Δοκιμάστε τη διεπαφή συνομιλίας τεχνητής νοημοσύνης
# Κάντε ερωτήσεις και λάβετε απαντήσεις με υποστήριξη τεχνητής νοημοσύνης και με πηγές
# Επαληθεύστε ότι η ενσωμάτωση της αναζήτησης λειτουργεί
azd monitor  # Ελέγξτε ότι το Application Insights εμφανίζει τηλεμετρία
azd down --force --purge
```

**📊 Χρόνος Επένδυσης:** 1-2 ώρες  
**📈 Επίπεδο Δεξιοτήτων Μετά:** Μπορεί να αναπτύσσει και να διαμορφώνει εφαρμογές AI έτοιμες για παραγωγή  
**💰 Συνείδηση Κόστους:** Κατανόηση κόστους ανάπτυξης $80-150/μήνα, κόστους παραγωγής $300-3500/μήνα

#### 💰 Εκτιμήσεις Κόστους για Αναπτύξεις AI

**Περιβάλλον Ανάπτυξης (Εκτιμώμενο $80-150/μήνα):**
- Azure OpenAI (Pay-as-you-go): $0-50/μήνα (βάσει χρήσης token)
- AI Search (Basic tier): $75/μήνα
- Container Apps (Consumption): $0-20/μήνα
- Storage (Standard): $1-5/μήνα

**Περιβάλλον Παραγωγής (Εκτιμώμενο $300-3,500+/μήνα):**
- Azure OpenAI (PTU για συνεπή απόδοση): $3,000+/μήνα Η ή Pay-as-go με υψηλό όγκο
- AI Search (Standard tier): $250/μήνα
- Container Apps (Dedicated): $50-100/μήνα
- Application Insights: $5-50/μήνα
- Storage (Premium): $10-50/μήνα

**💡 Συμβουλές Βελτιστοποίησης Κόστους:**
- Χρησιμοποιήστε **Free Tier** του Azure OpenAI για μάθηση (50,000 tokens/μήνα συμπεριλαμβάνονται)
- Εκτελέστε `azd down` για αποδέσμευση πόρων όταν δεν αναπτύσσετε ενεργά
- Ξεκινήστε με χρέωση βάσει κατανάλωσης, αναβαθμίστε σε PTU μόνο για παραγωγή
- Χρησιμοποιήστε `azd provision --preview` για εκτίμηση κόστους πριν την ανάπτυξη
- Ενεργοποιήστε το auto-scaling: πληρώνετε μόνο για την πραγματική χρήση

**Παρακολούθηση Κόστους:**
```bash
# Ελέγξτε τις εκτιμώμενες μηνιαίες δαπάνες
azd provision --preview

# Παρακολουθήστε τις πραγματικές μηνιαίες δαπάνες στο Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Κεφάλαιο 3: Ρύθμιση & Αυθεντικοποίηση
**Προαπαιτούμενα**: Ολοκληρωμένο το Κεφάλαιο 1  
**Διάρκεια**: 45-60 λεπτά  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα μάθετε
- Ρύθμιση και διαχείριση περιβάλλοντος
- Πρακτικές αυθεντικοποίησης και ασφάλειας
- Ονοματοδοσία πόρων και οργάνωση

#### Πόροι Μάθησης
- **📖 Ρύθμιση**: [Οδηγός Ρύθμισης](docs/chapter-03-configuration/configuration.md) - Ρύθμιση περιβάλλοντος
- **🔐 Ασφάλεια**: [Πρότυπα αυθεντικοποίησης και managed identity](docs/chapter-03-configuration/authsecurity.md) - Πρότυπα αυθεντικοποίησης
- **📝 Παραδείγματα**: [Παράδειγμα Εφαρμογής Βάσης Δεδομένων](examples/database-app/README.md) - Παραδείγματα AZD για βάσεις δεδομένων

#### Πρακτικές Ασκήσεις
- Ρυθμίστε πολλαπλά περιβάλλοντα (dev, staging, prod)
- Ρυθμίστε αυθεντικοποίηση managed identity
- Εφαρμόστε ρυθμίσεις ειδικές για κάθε περιβάλλον

**💡 Αποτέλεσμα Κεφαλαίου**: Διαχειριστείτε πολλαπλά περιβάλλοντα με σωστή αυθεντικοποίηση και ασφάλεια

---

### 🏗️ Κεφάλαιο 4: Υποδομή ως Κώδικας & Ανάπτυξη
**Προαπαιτούμενα**: Ολοκληρωμένα τα Κεφάλαια 1-3  
**Διάρκεια**: 1-1.5 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐

#### Τι θα μάθετε
- Προηγμένα μοτίβα ανάπτυξης
- Υποδομή ως Κώδικας με Bicep
- Στρατηγικές παροχής πόρων

#### Πόροι Μάθησης
- **📖 Ανάπτυξη**: [Οδηγός Ανάπτυξης](docs/chapter-04-infrastructure/deployment-guide.md) - Πλήρη workflows
- **🏗️ Παροχή Πόρων**: [Παροχή Πόρων](docs/chapter-04-infrastructure/provisioning.md) - Διαχείριση πόρων Azure
- **📝 Παραδείγματα**: [Παράδειγμα Container App](../../examples/container-app) - Κοντέινερized αναπτύξεις

#### Πρακτικές Ασκήσεις
- Δημιουργήστε προσαρμοσμένα πρότυπα Bicep
- Αναπτύξτε εφαρμογές πολλαπλών υπηρεσιών
- Εφαρμόστε στρατηγικές blue-green deployment

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε σύνθετες εφαρμογές πολλαπλών υπηρεσιών χρησιμοποιώντας προσαρμοσμένα πρότυπα υποδομής

---

### 🎯 Κεφάλαιο 5: Λύσεις AI Πολλαπλών Πρακτόρων (Προχωρημένο)
**Προαπαιτούμενα**: Ολοκληρωμένα τα Κεφάλαια 1-2  
**Διάρκεια**: 2-3 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐⭐

#### Τι θα μάθετε
- Μοτίβα αρχιτεκτονικής πολλαπλών πρακτόρων
- Ορχήστρωση και συντονισμός πρακτόρων
- Αναπτύξεις AI έτοιμες για παραγωγή

#### Πόροι Μάθησης
- **🤖 Προτεινόμενο Έργο**: [Λύση Πολλαπλών Πρακτόρων για Λιανική](examples/retail-scenario.md) - Πλήρης υλοποίηση
- **🛠️ ARM Templates**: [Πακέτο Προτύπων ARM](../../examples/retail-multiagent-arm-template) - Ανάπτυξη με ένα κλικ
- **📖 Αρχιτεκτονική**: [Μοτίβα συντονισμού πολλαπλών πρακτόρων](docs/chapter-06-pre-deployment/coordination-patterns.md) - Πρότυπα

#### Πρακτικές Ασκήσεις
```bash
# Αναπτύξτε την πλήρη λύση πολλαπλών πρακτόρων για τη λιανική
cd examples/retail-multiagent-arm-template
./deploy.sh

# Εξερευνήστε τις διαμορφώσεις πρακτόρων
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε και διαχειριστείτε μια λύση AI πολλαπλών πρακτόρων έτοιμη για παραγωγή με πράκτορες Πελατών και Αποθεμάτων

---

### 🔍 Κεφάλαιο 6: Επικύρωση & Σχεδιασμός πριν την Ανάπτυξη
**Προαπαιτούμενα**: Ολοκληρωμένο το Κεφάλαιο 4  
**Διάρκεια**: 1 ώρα  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα μάθετε
- Σχεδιασμός χωρητικότητας και επικύρωση πόρων
- Στρατηγικές επιλογής SKU
- Προ-ελέγχοι και αυτοματισμός

#### Πόροι Μάθησης
- **📊 Σχεδιασμός**: [Σχεδιασμός Χωρητικότητας](docs/chapter-06-pre-deployment/capacity-planning.md) - Επικύρωση πόρων
- **💰 Επιλογή**: [Επιλογή SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Οικονομικά αποδοτικές επιλογές
- **✅ Επικύρωση**: [Προελέγχοι](docs/chapter-06-pre-deployment/preflight-checks.md) - Αυτοματοποιημένα scripts

#### Πρακτικές Ασκήσεις
- Εκτελέστε scripts επικύρωσης χωρητικότητας
- Βελτιστοποιήστε επιλογές SKU για κόστος
- Εφαρμόστε αυτοματοποιημένους προ-ελέγχους πριν την ανάπτυξη

**💡 Αποτέλεσμα Κεφαλαίου**: Επικυρώστε και βελτιστοποιήστε αναπτύξεις πριν την εκτέλεση

---

### 🚨 Κεφάλαιο 7: Αντιμετώπιση Προβλημάτων & Αποσφαλμάτωση
**Προαπαιτούμενα**: Οποιοδήποτε κεφάλαιο ανάπτυξης ολοκληρωμένο  
**Διάρκεια**: 1-1.5 ώρες  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα μάθετε
- Συστηματικές προσεγγίσεις αποσφαλμάτωσης
- Συνήθη προβλήματα και λύσεις
- Αντιμετώπιση προβλημάτων ειδική για AI

#### Πόροι Μάθησης
- **🔧 Συνηθισμένα Ζητήματα**: [Συνηθισμένα Ζητήματα](docs/chapter-07-troubleshooting/common-issues.md) - Συχνές ερωτήσεις και λύσεις
- **🕵️ Αποσφαλμάτωση**: [Οδηγός Αποσφαλμάτωσης](docs/chapter-07-troubleshooting/debugging.md) - Στρατηγικές βήμα-βήμα
- **🤖 Ζητήματα AI**: [Αντιμετώπιση Προβλημάτων AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Προβλήματα υπηρεσιών AI

#### Πρακτικές Ασκήσεις
- Διαγνώστε αποτυχίες ανάπτυξης
- Επιδιορθώστε ζητήματα αυθεντικοποίησης
- Αποσφαλματώστε συνδεσιμότητα υπηρεσιών AI

**💡 Αποτέλεσμα Κεφαλαίου**: Διαγνώστε και επιλύστε ανεξάρτητα κοινά προβλήματα ανάπτυξης

---

### 🏢 Κεφάλαιο 8: Παραγωγή & Πρότυπα Επιχειρήσεων
**Προαπαιτούμενα**: Ολοκληρωμένα τα Κεφάλαια 1-4  
**Διάρκεια**: 2-3 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐⭐

#### Τι θα μάθετε
- Στρατηγικές ανάπτυξης για παραγωγή
- Πρότυπα ασφάλειας για επιχειρήσεις
- Παρακολούθηση και βελτιστοποίηση κόστους

#### Πόροι Μάθησης
- **🏭 Παραγωγή**: [Καλές Πρακτικές AI για Παραγωγή](docs/chapter-08-production/production-ai-practices.md) - Πρότυπα επιχειρήσεων
- **📝 Παραδείγματα**: [Παράδειγμα Microservices](../../examples/microservices) - Σύνθετες αρχιτεκτονικές
- **📊 Παρακολούθηση**: [Ενσωμάτωση Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Παρακολούθηση

#### Πρακτικές Ασκήσεις
- Εφαρμόστε πρότυπα ασφάλειας για επιχειρήσεις
- Ρυθμίστε ολοκληρωμένη παρακολούθηση
- Αναπτύξτε σε παραγωγή με σωστή διακυβέρνηση

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε εφαρμογές έτοιμες για επιχειρήσεις με πλήρεις δυνατότητες παραγωγής

---

## 🎓 Επισκόπηση Εργαστηρίου: Πρακτική Μαθησιακή Εμπειρία

> **⚠️ ΚΑΤΑΣΤΑΣΗ ΕΡΓΑΣΤΗΡΙΟΥ: Σε Ενεργή Ανάπτυξη**  
> Το υλικό του εργαστηρίου αναπτύσσεται και βελτιώνεται αυτή τη στιγμή. Οι βασικές ενότητες λειτουργούν, αλλά ορισμένα προχωρημένα τμήματα είναι ατελή. Εργαζόμαστε ενεργά για να ολοκληρώσουμε όλο το περιεχόμενο. [Παρακολούθηση προόδου →](workshop/README.md)

### Διαδραστικά Υλικά Εργαστηρίου
**Ολοκληρωμένη πρακτική μάθηση με εργαλεία προγράμματος περιήγησης και καθοδηγούμενες ασκήσεις**
Τα υλικά του εργαστηρίου μας παρέχουν μια δομημένη, διαδραστική εμπειρία μάθησης που συμπληρώνει το παραπάνω πρόγραμμα σπουδών βάσει κεφαλαίων. Το εργαστήριο έχει σχεδιαστεί για αυτοκατευθυνόμενη μάθηση και συνεδρίες υπό καθοδήγηση εκπαιδευτή.

#### 🛠️ Χαρακτηριστικά Εργαστηρίου
- **Διεπαφή μέσω προγράμματος περιήγησης**: Πλήρες εργαστήριο με MkDocs, με δυνατότητες αναζήτησης, αντιγραφής και θεμάτων
- **Ενσωμάτωση GitHub Codespaces**: Ρύθμιση περιβάλλοντος ανάπτυξης με ένα κλικ
- **Δομημένη Διαδρομή Μάθησης**: Καθοδηγούμενες ασκήσεις 8 ενοτήτων (συνολικά 3-4 ώρες)
- **Προοδευτική Μεθοδολογία**: Εισαγωγή → Επιλογή → Επικύρωση → Αποδόμηση → Διαμόρφωση → Προσαρμογή → Κατάργηση → Ολοκλήρωση
- **Διαδραστικό Περιβάλλον DevContainer**: Προετοιμασμένα εργαλεία και εξαρτήσεις

#### 📚 Δομή Ενοτήτων του Εργαστηρίου
Το εργαστήριο ακολουθεί μια **προοδευτική μεθοδολογία 8 ενοτήτων** που σας οδηγεί από την ανακάλυψη στην επάρκεια στην ανάπτυξη:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Εισαγωγή** | Επισκόπηση Εργαστηρίου | Κατανόηση στόχων μάθησης, προαπαιτούμενων και δομής του εργαστηρίου | 15 λεπτά |
| **1. Επιλογή** | Ανακάλυψη προτύπων | Εξερευνήστε πρότυπα AZD και επιλέξτε το κατάλληλο πρότυπο AI για το σενάριό σας | 20 λεπτά |
| **2. Επικύρωση** | Ανάπτυξη & Επαλήθευση | Αναπτύξτε το πρότυπο με `azd up` και επαληθεύστε ότι η υποδομή λειτουργεί | 30 λεπτά |
| **3. Αποδόμηση** | Κατανόηση Δομής | Χρησιμοποιήστε το GitHub Copilot για να εξερευνήσετε την αρχιτεκτονική του προτύπου, τα αρχεία Bicep και την οργάνωση του κώδικα | 30 λεπτά |
| **4. Διαμόρφωση** | Εμβάθυνση σε azure.yaml | Εξοικειωθείτε με τη διαμόρφωση `azure.yaml`, τα lifecycle hooks, και τις μεταβλητές περιβάλλοντος | 30 λεπτά |
| **5. Προσαρμογή** | Κάντε το δικό σας | Ενεργοποιήστε το AI Search, tracing, αξιολόγηση και προσαρμόστε το για το σενάριό σας | 45 λεπτά |
| **6. Κατάργηση** | Καθαρισμός | Ασφαλής αποδέσμευση των πόρων με `azd down --purge` | 15 λεπτά |
| **7. Ολοκλήρωση** | Επόμενα Βήματα | Ανασκόπηση επιτευγμάτων, βασικών εννοιών και συνέχιση της μαθησιακής σας πορείας | 15 λεπτά |

**Ροή Εργαστηρίου:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Ξεκινώντας με το Εργαστήριο
```bash
# Επιλογή 1: GitHub Codespaces (Συνιστάται)
# Κάντε κλικ στο "Code" → "Create codespace on main" στο αποθετήριο

# Επιλογή 2: Τοπική ανάπτυξη
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Ακολουθήστε τις οδηγίες ρύθμισης στο workshop/README.md
```

#### 🎯 Μαθησιακά Αποτελέσματα Εργαστηρίου
Ολοκληρώνοντας το εργαστήριο, οι συμμετέχοντες θα:
- **Αναπτύξουν Παραγωγικές Εφαρμογές AI**: Χρήση του AZD με υπηρεσίες Microsoft Foundry
- **Εξειδικευτούν στις Αρχιτεκτονικές Πολλαπλών Πρακτόρων**: Υλοποίηση συντονισμένων λύσεων με AI πράκτορες
- **Εφαρμόσουν Βέλτιστες Πρακτικές Ασφαλείας**: Διαμόρφωση ταυτοποίησης και ελέγχου πρόσβασης
- **Βελτιστοποιήσουν για Κλίμακα**: Σχεδιασμός αποδοτικών ως προς το κόστος και υψηλής απόδοσης αναπτύξεων
- **Επιλύουν Προβλήματα Αναπτύξεων**: Επίλυση κοινών προβλημάτων ανεξάρτητα

#### 📖 Πόροι Εργαστηρίου
- **🎥 Διαδραστικός Οδηγός**: [Υλικά Εργαστηρίου](workshop/README.md) - Περιβάλλον μάθησης μέσω προγράμματος περιήγησης
- **📋 Οδηγίες ανά Ενότητα**:
  - [0. Εισαγωγή](workshop/docs/instructions/0-Introduction.md) - Επισκόπηση εργαστηρίου και στόχοι
  - [1. Επιλογή](workshop/docs/instructions/1-Select-AI-Template.md) - Βρείτε και επιλέξτε πρότυπα AI
  - [2. Επικύρωση](workshop/docs/instructions/2-Validate-AI-Template.md) - Αναπτύξτε και επαληθεύστε πρότυπα
  - [3. Αποδόμηση](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Εξερευνήστε την αρχιτεκτονική του προτύπου
  - [4. Διαμόρφωση](workshop/docs/instructions/4-Configure-AI-Template.md) - Εμβάθυνση στο azure.yaml
  - [5. Προσαρμογή](workshop/docs/instructions/5-Customize-AI-Template.md) - Προσαρμογή για το σενάριό σας
  - [6. Κατάργηση](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Καθαρισμός πόρων
  - [7. Ολοκλήρωση](workshop/docs/instructions/7-Wrap-up.md) - Ανασκόπηση και επόμενα βήματα
- **🛠️ Εργαστήριο AI**: [Εργαστήριο AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ασκήσεις με έμφαση στο AI
- **💡 Γρήγορη Εκκίνηση**: [Οδηγός Γρήγορης Εκκίνησης Εργαστηρίου](workshop/README.md#quick-start) - Διαμόρφωση περιβάλλοντος

**Ιδανικό για**: Εταιρική εκπαίδευση, μαθήματα πανεπιστημίου, αυτοκατευθυνόμενη μάθηση και bootcamps για προγραμματιστές.

---

## 📖 Εμβάθυνση: Δυνατότητες AZD

Πέρα από τα βασικά, το AZD παρέχει ισχυρές δυνατότητες για παραγωγικές αναπτύξεις:

- **Αναπτύξεις βάσει προτύπων** - Χρησιμοποιήστε προ-κατασκευασμένα πρότυπα για κοινά μοτίβα εφαρμογών
- **Υποδομή ως Κώδικας** - Διαχειριστείτε πόρους Azure χρησιμοποιώντας Bicep ή Terraform  
- **Ενοποιημένες ροές εργασίας** - Παροχή, ανάπτυξη και παρακολούθηση εφαρμογών χωρίς ραφή
- **Φιλικό προς τον προγραμματιστή** - Βελτιστοποιημένο για παραγωγικότητα και εμπειρία προγραμματιστή

### **AZD + Microsoft Foundry: Ιδανικό για Αναπτύξεις AI**

**Γιατί το AZD για λύσεις AI;** Το AZD αντιμετωπίζει τις κορυφαίες προκλήσεις που έχουν οι προγραμματιστές AI:

- **Πρότυπα Έτοιμα για AI** - Προετοιμασμένα πρότυπα για Azure OpenAI, Cognitive Services και φορτία εργασίας ML
- **Ασφαλείς Αναπτύξεις AI** - Ενσωματωμένα πρότυπα ασφάλειας για υπηρεσίες AI, κλειδιά API και endpoints μοντέλων  
- **Μοτίβα Παραγωγικού AI** - Βέλτιστες πρακτικές για κλιμακούμενες, οικονομικές αναπτύξεις εφαρμογών AI
- **Ε2Ε Ροές Εργασίας AI** - Από την ανάπτυξη μοντέλου έως την παραγωγική ανάπτυξη με κατάλληλη παρακολούθηση
- **Βελτιστοποίηση Κόστους** - Έξυπνη κατανομή πόρων και στρατηγικές κλιμάκωσης για φορτία εργασίας AI
- **Ενσωμάτωση Microsoft Foundry** - Αδιάλειπτη σύνδεση στο κατάλογο μοντέλων και στα endpoints του Microsoft Foundry

---

## 🎯 Βιβλιοθήκη Προτύπων & Παραδειγμάτων

### Επιλεγμένα: Πρότυπα Microsoft Foundry
**Ξεκινήστε εδώ αν αναπτύσσετε εφαρμογές AI!**

> **Σημείωση:** Αυτά τα πρότυπα δείχνουν διάφορα μοτίβα AI. Κάποια είναι εξωτερικά Azure Samples, άλλα είναι τοπικές υλοποιήσεις.

| Πρότυπο | Κεφάλαιο | Πολυπλοκότητα | Υπηρεσίες | Τύπος |
|----------|---------|------------|----------|------|
| [**Ξεκινήστε με AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Κεφάλαιο 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Εξωτερικό |
| [**Ξεκινήστε με AI πράκτορες**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Κεφάλαιο 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Εξωτερικό |
| [**Δείγμα Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Κεφάλαιο 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Εξωτερικό |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Κεφάλαιο 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Εξωτερικό |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Κεφάλαιο 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Εξωτερικό |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Κεφάλαιο 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Εξωτερικό |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Κεφάλαιο 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Τοπικό** |

### Επιλεγμένα: Πλήρη Σενάρια Μάθησης
**Πρότυπα εφαρμογών έτοιμα για παραγωγή αντιστοιχισμένα σε κεφάλαια μάθησης**

| Πρότυπο | Κεφάλαιο Μάθησης | Πολυπλοκότητα | Κύριος Στόχος Μάθησης |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Κεφάλαιο 2 | ⭐ | Βασικά μοτίβα ανάπτυξης AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Κεφάλαιο 2 | ⭐⭐ | Υλοποίηση RAG με Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Κεφάλαιο 4 | ⭐⭐ | Ενσωμάτωση Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Κεφάλαιο 5 | ⭐⭐⭐ | Πλαίσιο πρακτόρων και function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Κεφάλαιο 8 | ⭐⭐⭐ | Επιχειρησιακή ορχήστρωση AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Κεφάλαιο 5 | ⭐⭐⭐⭐ | Αρχιτεκτονική πολλαπλών πρακτόρων με Πράκτορες Πελάτη και Αποθεμάτων |

### Μάθηση με βάση τον τύπο παραδείγματος

> **📌 Τοπικά vs. Εξωτερικά Παραδείγματα:**  
> **Τοπικά Παραδείγματα** (σε αυτό το repo) = Έτοιμα για άμεση χρήση  
> **Εξωτερικά Παραδείγματα** (Azure Samples) = Κλωνοποιήστε από τους συνδεδεμένους αποθετήριους

#### Τοπικά Παραδείγματα (Έτοιμα για Χρήση)
- [**Λύση Πολλαπλών Πρακτόρων για Λιανική**](examples/retail-scenario.md) - Πλήρης υλοποίηση έτοιμη για παραγωγή με ARM templates
  - Αρχιτεκτονική πολλαπλών πρακτόρων (Πράκτορας Πελάτη + Πράκτορας Αποθεμάτων)
  - Ολοκληρωμένη παρακολούθηση και αξιολόγηση
  - Ανάπτυξη με ένα κλικ μέσω ARM template

#### Τοπικά Παραδείγματα - Εφαρμογές Container (Κεφάλαια 2-5)
**Ολοκληρωμένα παραδείγματα ανάπτυξης κοντέινερ σε αυτό το αποθετήριο:**
- [**Παραδείγματα Εφαρμογών Container**](examples/container-app/README.md) - Πλήρης οδηγός για αναπτύξεις σε κοντέινερ
  - [Απλό Flask API](../../examples/container-app/simple-flask-api) - Βασικό REST API με scale-to-zero
  - [Αρχιτεκτονική Microservices](../../examples/container-app/microservices) - Παραγωγική ανάπτυξη πολλαπλών υπηρεσιών
  - Γρήγορη Εκκίνηση, Παραγωγή και Προηγμένα πρότυπα ανάπτυξης
  - Οδηγίες για παρακολούθηση, ασφάλεια και βελτιστοποίηση κόστους

#### Εξωτερικά Παραδείγματα - Απλές Εφαρμογές (Κεφάλαια 1-2)
**Κλωνοποιήστε αυτά τα αποθετήρια Azure Samples για να ξεκινήσετε:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Βασικά μοτίβα ανάπτυξης
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Ανάπτυξη στατικού περιεχομένου
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Ανάπτυξη REST API

#### Εξωτερικά Παραδείγματα - Ενσωμάτωση Βάσεων Δεδομένων (Κεφάλαια 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Πρότυπα συνδεσιμότητας με βάσεις δεδομένων
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless ροές εργασίας δεδομένων

#### Εξωτερικά Παραδείγματα - Προηγμένα Μοτίβα (Κεφάλαια 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Αρχιτεκτονικές πολλαπλών υπηρεσιών
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Επεξεργασία στο παρασκήνιο  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Παραγωγικά μοτίβα ML

### Εξωτερικές Συλλογές Προτύπων
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Επιμελημένη συλλογή επίσημων και κοινοτικών προτύπων
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Τεκμηρίωση προτύπων Microsoft Learn
- [**Examples Directory**](examples/README.md) - Τοπικά παραδείγματα μάθησης με λεπτομερείς επεξηγήσεις

---

## 📚 Πόροι Μάθησης & Αναφορές

### Γρήγορες Αναφορές
- [**Σύντομος Οδηγός Εντολών**](resources/cheat-sheet.md) - Σημαντικές εντολές azd οργανωμένες ανά κεφάλαιο
- [**Γλωσσάριο**](resources/glossary.md) - Όροι Azure και azd  
- [**Συχνές Ερωτήσεις**](resources/faq.md) - Συνήθεις ερωτήσεις οργανωμένες ανά κεφάλαιο μάθησης
- [**Οδηγός Μελέτης**](resources/study-guide.md) - Ολοκληρωμένες ασκήσεις πρακτικής

### Πρακτικά Εργαστήρια
- [**Εργαστήριο AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Κάντε τις λύσεις AI σας ικανές για ανάπτυξη με AZD (2-3 ώρες)
- [**Διαδραστικό Εργαστήριο**](workshop/README.md) - Καθοδηγούμενες ασκήσεις 8 ενοτήτων με MkDocs και GitHub Codespaces
  - Ακολουθεί: Εισαγωγή → Επιλογή → Επικύρωση → Αποδόμηση → Διαμόρφωση → Προσαρμογή → Κατάργηση → Ολοκλήρωση

### Εξωτερικοί Πόροι Μάθησης
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Γρήγορος Οδηγός Αντιμετώπισης Προβλημάτων

**Συνήθη προβλήματα που αντιμετωπίζουν οι αρχάριοι και άμεσες λύσεις:**

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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Λίστα διαθέσιμων συνδρομών
az account list --output table

# Ορισμός προεπιλεγμένης συνδρομής
az account set --subscription "<subscription-id-or-name>"

# Ορισμός για το περιβάλλον AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Επαλήθευση
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Δοκιμάστε διαφορετική περιοχή Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ή χρησιμοποιήστε μικρότερα SKUs στην ανάπτυξη
# Επεξεργαστείτε infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>
```bash
# Επιλογή 1: Καθαρισμός και επαναδοκιμή
azd down --force --purge
azd up

# Επιλογή 2: Απλώς διορθώστε την υποδομή
azd provision

# Επιλογή 3: Ελέγξτε την αναλυτική κατάσταση
azd show

# Επιλογή 4: Ελέγξτε τα αρχεία καταγραφής στο Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Αποτυχία πιστοποίησης" ή "Το διακριτικό έχει λήξει"</strong></summary>

```bash
# Επαναέλεγχος ταυτότητας
az logout
az login

azd auth logout
azd auth login

# Επαληθεύστε τον έλεγχο ταυτότητας
az account show
```
</details>

<details>
<summary><strong>❌ "Ο πόρος υπάρχει ήδη" ή συγκρούσεις ονομασίας</strong></summary>

```bash
# Το AZD δημιουργεί μοναδικά ονόματα, αλλά σε περίπτωση σύγκρουσης:
azd down --force --purge

# Τότε δοκιμάστε ξανά με νέο περιβάλλον
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Η ανάπτυξη του προτύπου διαρκεί πολύ</strong></summary>

**Κανονικοί χρόνοι αναμονής:**
- Απλή web εφαρμογή: 5-10 λεπτά
- Εφαρμογή με βάση δεδομένων: 10-15 λεπτά
- Εφαρμογές AI: 15-25 λεπτά (η προμήθεια του OpenAI είναι αργή)

```bash
# Ελέγξτε την πρόοδο
azd show

# Αν κολλήσετε πάνω από 30 λεπτά, ελέγξτε το Azure Portal:
azd monitor
# Αναζητήστε αποτυχημένες αναπτύξεις
```
</details>

<details>
<summary><strong>❌ "Άρνηση πρόσβασης" ή "Απαγορεύεται"</strong></summary>

```bash
# Ελέγξτε τον ρόλο σας στο Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Χρειάζεστε τουλάχιστον τον ρόλο «Contributor»
# Ζητήστε από τον διαχειριστή Azure σας να χορηγήσει:
# - Contributor (για πόρους)
# - User Access Administrator (για την ανάθεση ρόλων)
```
</details>

<details>
<summary><strong>❌ Δεν βρέθηκε το URL της αναπτυγμένης εφαρμογής</strong></summary>

```bash
# Εμφανίστε όλα τα τελικά σημεία υπηρεσίας
azd show

# Ή ανοίξτε το Azure Portal
azd monitor

# Ελέγξτε συγκεκριμένη υπηρεσία
azd env get-values
# Αναζητήστε μεταβλητές *_URL
```
</details>

### 📚 Πλήρεις Πόροι Αντιμετώπισης Προβλημάτων

- **Οδηγός Συνηθισμένων Προβλημάτων:** [Λεπτομερείς Λύσεις](docs/chapter-07-troubleshooting/common-issues.md)
- **Ζητήματα ειδικά για AI:** [Αντιμετώπιση προβλημάτων AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Οδηγός Εντοπισμού Σφαλμάτων:** [Εντοπισμός Σφαλμάτων βήμα-βήμα](docs/chapter-07-troubleshooting/debugging.md)
- **Λάβετε Βοήθεια:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ολοκλήρωση Μαθήματος & Πιστοποίηση

### Παρακολούθηση Προόδου
Παρακολουθήστε την πρόοδό σας σε κάθε κεφάλαιο:

- [ ] **Κεφάλαιο 1**: Θεμέλια & Γρήγορη Εκκίνηση ✅
- [ ] **Κεφάλαιο 2**: Ανάπτυξη με επίκεντρο το AI ✅  
- [ ] **Κεφάλαιο 3**: Διαμόρφωση & Ταυτοποίηση ✅
- [ ] **Κεφάλαιο 4**: Υποδομή ως Κώδικας & Ανάπτυξη ✅
- [ ] **Κεφάλαιο 5**: Λύσεις AI με πολλούς πράκτορες ✅
- [ ] **Κεφάλαιο 6**: Επαλήθευση πριν την Ανάπτυξη & Σχεδιασμός ✅
- [ ] **Κεφάλαιο 7**: Αντιμετώπιση Προβλημάτων & Εντοπισμός Σφαλμάτων ✅
- [ ] **Κεφάλαιο 8**: Πρότυπα Παραγωγής & Επιχειρησιακά ✅

### Επαλήθευση Μάθησης
Μετά την ολοκλήρωση κάθε κεφαλαίου, επαληθεύστε τις γνώσεις σας με:
1. **Πρακτική Άσκηση**: Ολοκληρώστε την πρακτική ανάπτυξη του κεφαλαίου
2. **Έλεγχος Γνώσης**: Επισκοπήστε την ενότητα Συχνών Ερωτήσεων για το κεφάλαιό σας
3. **Συζήτηση στην Κοινότητα**: Μοιραστείτε την εμπειρία σας στο Azure Discord
4. **Επόμενο Κεφάλαιο**: Προχωρήστε στο επόμενο επίπεδο πολυπλοκότητας

### Οφέλη Ολοκλήρωσης Μαθήματος
Μετά την ολοκλήρωση όλων των κεφαλαίων, θα έχετε:
- **Εμπειρία σε Παραγωγή**: Έχετε αναπτύξει πραγματικές εφαρμογές AI στο Azure
- **Επαγγελματικές Δεξιότητες**: Ικανότητες ανάπτυξης έτοιμες για επιχειρήσεις  
- **Αναγνώριση στην Κοινότητα**: Ενεργό μέλος της κοινότητας προγραμματιστών Azure
- **Προώθηση Καριέρας**: Περιζήτητη εμπειρογνωμοσύνη στην ανάπτυξη AZD και AI

---

## 🤝 Κοινότητα & Υποστήριξη

### Λάβετε Βοήθεια & Υποστήριξη
- **Τεχνικά Θέματα**: [Αναφέρετε σφάλματα και ζητήστε λειτουργίες](https://github.com/microsoft/azd-for-beginners/issues)
- **Ερωτήσεις Μάθησης**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) και [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Βοήθεια ειδικά για AI**: Εγγραφείτε στο [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Τεκμηρίωση**: [Επίσημη τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Συμπεράσματα Κοινότητας από το Microsoft Foundry Discord

**Πρόσφατα Αποτελέσματα Δημοσκόπησης από το κανάλι #Azure:**
- **45%** των προγραμματιστών θέλουν να χρησιμοποιήσουν το AZD για εφαρμογές AI
- **Κορυφαίες προκλήσεις**: Αναπτύξεις πολλών υπηρεσιών, διαχείριση διαπιστευτηρίων, ετοιμότητα για παραγωγή  
- **Τα πιο ζητούμενα**: Προτύπα ειδικά για AI, οδηγοί αντιμετώπισης προβλημάτων, βέλτιστες πρακτικές

**Συμμετάσχετε στην κοινότητά μας για να:**
- Μοιραστείτε τις εμπειρίες σας με AZD + AI και λάβετε βοήθεια
- Έχετε πρόσβαση σε πρώιμες προεπισκοπήσεις νέων προτύπων AI
- Συνεισφέρετε στις βέλτιστες πρακτικές ανάπτυξης AI
- Επηρεάστε τη μελλοντική ανάπτυξη δυνατοτήτων AI + AZD

### Συνεισφορά στο Μάθημα
Καλωσορίζουμε τις συνεισφορές! Διαβάστε τον [Οδηγό Συνεισφορών](CONTRIBUTING.md) για λεπτομέρειες σχετικά με:
- **Βελτιώσεις Περιεχομένου**: Βελτιώστε υπάρχοντα κεφάλαια και παραδείγματα
- **Νέα Παραδείγματα**: Προσθέστε πραγματικά σενάρια και πρότυπα  
- **Μετάφραση**: Βοηθήστε στη διατήρηση υποστήριξης πολλαπλών γλωσσών
- **Αναφορές Σφαλμάτων**: Βελτιώστε την ακρίβεια και τη σαφήνεια
- **Πρότυπα Κοινότητας**: Ακολουθήστε τις περιεκτικές οδηγίες της κοινότητάς μας

---

## 📄 Πληροφορίες Μαθήματος

### Άδεια
Αυτό το έργο έχει άδεια υπό την MIT License - δείτε το αρχείο [LICENSE](../../LICENSE) για λεπτομέρειες.

### Σχετικοί Πόροι Μάθησης της Microsoft

Η ομάδα μας παράγει και άλλα ολοκληρωμένα εκπαιδευτικά μαθήματα:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j για Αρχάριους](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js για Αρχάριους](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain για Αρχάριους](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD για Αρχάριους](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI για Αρχάριους](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP για Αρχάριους](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents για Αρχάριους](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI για Αρχάριους](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Βασικά Μαθήματα
[![ML για Αρχάριους](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science για Αρχάριους](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI για Αρχάριους](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Κυβερνοασφάλεια για Αρχάριους](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev για Αρχάριους](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT για Αρχάριους](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Ανάπτυξη XR για Αρχάριους](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Σειρά Copilot
[![Copilot για AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot για C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Πλοήγηση Μαθήματος

**🚀 Έτοιμοι να ξεκινήσετε;**

**Αρχάριοι**: Ξεκινήστε με [Κεφάλαιο 1: Θεμέλια & Γρήγορη Εκκίνηση](../..)  
**Προγραμματιστές AI**: Μεταβείτε στο [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στην AI](../..)  
**Έμπειροι Προγραμματιστές**: Ξεκινήστε με [Κεφάλαιο 3: Διαμόρφωση & Πιστοποίηση](../..)

**Επόμενα Βήματα**: [Ξεκινήστε Κεφάλαιο 1 - Βασικά του AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:
Το παρόν έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, παρακαλούμε να λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από άνθρωπο. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->