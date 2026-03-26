# AZD Για Αρχάριους: Ένα Δομημένο Μονοπάτι Μάθησης

![AZD για αρχάριους](../../translated_images/el/azdbeginners.5527441dd9f74068.webp) 

[![Παρακολουθητές GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Αστέρια GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Αυτοματοποιημένες Μεταφράσεις (Πάντα Ενημερωμένες)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Αραβικά](../ar/README.md) | [Μπενγκάλι](../bn/README.md) | [Βουλγαρικά](../bg/README.md) | [Βιρμανικά (Μιανμάρ)](../my/README.md) | [Κινέζικα (Απλοποιημένα)](../zh-CN/README.md) | [Κινέζικα (Παραδοσιακά, Χονγκ Κονγκ)](../zh-HK/README.md) | [Κινέζικα (Παραδοσιακά, Μακάο)](../zh-MO/README.md) | [Κινέζικα (Παραδοσιακά, Ταϊβάν)](../zh-TW/README.md) | [Κροατικά](../hr/README.md) | [Τσέχικα](../cs/README.md) | [Δανέζικα](../da/README.md) | [Ολλανδικά](../nl/README.md) | [Εσθονικά](../et/README.md) | [Φινλανδικά](../fi/README.md) | [Γαλλικά](../fr/README.md) | [Γερμανικά](../de/README.md) | [Ελληνικά](./README.md) | [Εβραϊκά](../he/README.md) | [Χίντι](../hi/README.md) | [Ουγγρικά](../hu/README.md) | [Ινδονησιακά](../id/README.md) | [Ιταλικά](../it/README.md) | [Ιαπωνικά](../ja/README.md) | [Κανάντα](../kn/README.md) | [Κορεατικά](../ko/README.md) | [Λιθουανικά](../lt/README.md) | [Μαλαιικά](../ms/README.md) | [Μαλαγιαλάμ](../ml/README.md) | [Μαράθι](../mr/README.md) | [Νεπάλικα](../ne/README.md) | [Νιγηριανό Πίτζιν](../pcm/README.md) | [Νορβηγικά](../no/README.md) | [Περσικά (Φαρσί)](../fa/README.md) | [Πολωνικά](../pl/README.md) | [Πορτογαλικά (Βραζιλία)](../pt-BR/README.md) | [Πορτογαλικά (Πορτογαλία)](../pt-PT/README.md) | [Πουντζάμπι (Gurmukhi)](../pa/README.md) | [Ρουμανικά](../ro/README.md) | [Ρωσικά](../ru/README.md) | [Σερβικά (Κυριλλικά)](../sr/README.md) | [Σλοβακικά](../sk/README.md) | [Σλοβενικά](../sl/README.md) | [Ισπανικά](../es/README.md) | [Σουαχίλι](../sw/README.md) | [Σουηδικά](../sv/README.md) | [Ταγκάλογκ (Φιλιππινέζικα)](../tl/README.md) | [Ταμίλ](../ta/README.md) | [Τελούγκου](../te/README.md) | [Ταϊλανδικά](../th/README.md) | [Τουρκικά](../tr/README.md) | [Ουκρανικά](../uk/README.md) | [Ουρντού](../ur/README.md) | [Βιετναμέζικα](../vi/README.md)

> **Προτιμάτε να κλωνοποιήσετε τοπικά;**
>
> Αυτό το αποθετήριο περιλαμβάνει 50+ μεταφράσεις που αυξάνουν σημαντικά το μέγεθος λήψης. Για να κάνετε clone χωρίς μεταφράσεις, χρησιμοποιήστε sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Αυτό σας δίνει όλα όσα χρειάζεστε για να ολοκληρώσετε το μάθημα με πολύ πιο γρήγορη λήψη.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Τι νέο υπάρχει στο azd σήμερα

Το Azure Developer CLI έχει εξελιχθεί πέρα από τις παραδοσιακές web εφαρμογές και τα APIs. Σήμερα, το azd είναι το μοναδικό εργαλείο για την ανάπτυξη οποιασδήποτε εφαρμογής στο Azure — συμπεριλαμβανομένων εφαρμογών με δυνατότητες AI και έξυπνων πρακτόρων.

Τι σημαίνει αυτό για εσάς:

- **Οι πράκτορες AI είναι πλέον κύρια workloads του azd.** Μπορείτε να αρχικοποιήσετε, να αναπτύξετε και να διαχειριστείτε έργα πράκτορα AI χρησιμοποιώντας την ίδια ροή εργασίας `azd init` → `azd up` που ήδη γνωρίζετε.
- **Η ενσωμάτωση του Microsoft Foundry** φέρνει την ανάπτυξη μοντέλων, τη φιλοξενία πρακτόρων και τη ρύθμιση υπηρεσιών AI απευθείας στο οικοσύστημα προτύπων του azd.
- **Η βασική ροή εργασίας δεν έχει αλλάξει.** Είτε αναπτύσσετε μια εφαρμογή todo, ένα microservice ή μια λύση πολλαπλών πρακτόρων AI, οι εντολές είναι οι ίδιες.

Αν έχετε χρησιμοποιήσει το azd προηγουμένως, η υποστήριξη AI είναι μια φυσική επέκταση — όχι ένα ξεχωριστό εργαλείο ή ένα προχωρημένο μάθημα. Αν ξεκινάτε από την αρχή, θα μάθετε μια ροή εργασίας που λειτουργεί για τα πάντα.

---

## 🚀 Τι είναι το Azure Developer CLI (azd);

**Το Azure Developer CLI (azd)** είναι ένα φιλικό προς τον προγραμματιστή εργαλείο γραμμής εντολών που κάνει απλή την ανάπτυξη εφαρμογών στο Azure. Αντί να δημιουργείτε και να συνδέετε χειροκίνητα δεκάδες πόρους Azure, μπορείτε να αναπτύξετε ολόκληρες εφαρμογές με μία εντολή.

### Το Μαγικό του `azd up`

```bash
# Αυτή η εντολή κάνει τα πάντα:
# ✅ Δημιουργεί όλους τους πόρους του Azure
# ✅ Διαμορφώνει το δίκτυο και την ασφάλεια
# ✅ Δημιουργεί τον κώδικα της εφαρμογής σας
# ✅ Αναπτύσσει στο Azure
# ✅ Σας δίνει μια λειτουργική διεύθυνση URL
azd up
```

**Αυτό είναι!** Καμία κλικ στο Azure Portal, κανένα σύνθετο ARM template που πρέπει να μάθετε πρώτα, καμία χειροκίνητη ρύθμιση - απλά λειτουργικές εφαρμογές στο Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Ποια είναι η Διαφορά;

Αυτή είναι η πιο συνηθισμένη ερώτηση που κάνουν οι αρχάριοι. Εδώ είναι η απλή απάντηση:

| Χαρακτηριστικό | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Σκοπός** | Διαχείριση μεμονωμένων πόρων Azure | Ανάπτυξη ολοκληρωμένων εφαρμογών |
| **Νοοτροπία** | Εστίαση στην υποδομή | Εστίαση στην εφαρμογή |
| **Παράδειγμα** | `az webapp create --name myapp...` | `azd up` |
| **Καμπύλη Μάθησης** | Πρέπει να γνωρίζετε τις υπηρεσίες Azure | Απλώς γνωρίστε την εφαρμογή σας |
| **Καλύτερο Για** | DevOps, Υποδομή | Προγραμματιστές, Πρωτοτυποποίηση |

### Απλή Αναλογία

- **Azure CLI** είναι σαν να έχετε όλα τα εργαλεία για να χτίσετε ένα σπίτι - σφυριά, πριόνια, καρφιά. Μπορείτε να φτιάξετε οτιδήποτε, αλλά πρέπει να ξέρετε κατασκευή.
- **Azure Developer CLI** είναι σαν να προσλαμβάνετε έναν εργολάβο - περιγράφετε τι θέλετε, και αυτός αναλαμβάνει την κατασκευή.

### Πότε να Χρησιμοποιήσετε Κάθε Ένα

| Σενάριο | Χρησιμοποιήστε Αυτό |
|----------|----------|
| "Θέλω να αναπτύξω την web εφαρμογή μου γρήγορα" | `azd up` |
| "Χρειάζομαι να δημιουργήσω μόνο έναν λογαριασμό αποθήκευσης" | `az storage account create` |
| "Κατασκευάζω μια πλήρη εφαρμογή AI" | `azd init --template azure-search-openai-demo` |
| "Πρέπει να εντοπίσω σφάλμα σε συγκεκριμένο πόρο Azure" | `az resource show` |
| "Θέλω ανάπτυξη έτοιμη για παραγωγή σε λίγα λεπτά" | `azd up --environment production` |

### Συνεργάζονται!

Το AZD χρησιμοποιεί το Azure CLI στο παρασκήνιο. Μπορείτε να χρησιμοποιήσετε και τα δύο:
```bash
# Αναπτύξτε την εφαρμογή σας με AZD
azd up

# Στη συνέχεια, βελτιώστε συγκεκριμένους πόρους με το Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Βρείτε Πρότυπα στο Awesome AZD

Μην ξεκινάτε από το μηδέν! **Awesome AZD** είναι η συλλογή της κοινότητας με έτοιμα προς ανάπτυξη πρότυπα:

| Πόρος | Περιγραφή |
|----------|-------------|
| 🔗 [**Amazing AZD Gallery**](https://azure.github.io/awesome-azd/) | Περιηγηθείτε σε 200+ πρότυπα με ανάπτυξη με ένα κλικ |
| 🔗 [**Υποβάλετε ένα Πρότυπο**](https://github.com/Azure/awesome-azd/issues) | Συνεισφέρετε το δικό σας πρότυπο στην κοινότητα |
| 🔗 [**Αποθετήριο GitHub**](https://github.com/Azure/awesome-azd) | Βάλτε αστέρι και εξερευνήστε τον κώδικα |

### Δημοφιλή Πρότυπα AI από το Awesome AZD

```bash
# RAG Συνομιλία με Μοντέλα Microsoft Foundry + Αναζήτηση AI
azd init --template azure-search-openai-demo

# Γρήγορη Εφαρμογή Συνομιλίας AI
azd init --template openai-chat-app-quickstart

# Πράκτορες AI με Πράκτορες Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Ξεκινώντας σε 3 Βήματα

### Βήμα 1: Εγκατάσταση AZD (2 λεπτά)

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

### Βήμα 2: Σύνδεση στο Azure

```bash
azd auth login
```

### Βήμα 3: Αναπτύξτε την Πρώτη σας Εφαρμογή

```bash
# Αρχικοποίηση από ένα πρότυπο
azd init --template todo-nodejs-mongo

# Ανάπτυξη στο Azure (δημιουργεί τα πάντα!)
azd up
```

**🎉 Αυτό είναι!** Η εφαρμογή σας είναι τώρα ζωντανή στο Azure.

### Καθαρισμός (Μην το Ξεχάσετε!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Πώς να Χρησιμοποιήσετε Αυτό το Μάθημα

Αυτό το μάθημα έχει σχεδιαστεί για **προοδευτική μάθηση** - ξεκινήστε από εκεί που αισθάνεστε άνετα και προχωρήστε:

| Η Εμπειρία Σας | Ξεκινήστε Εδώ |
|-----------------|------------|
| **Εντελώς νέος στο Azure** | [Κεφ. 1: Θεμέλια](../..) |
| **Γνωρίζετε το Azure, νέος στο AZD** | [Κεφ. 1: Θεμέλια](../..) |
| **Θέλετε να αναπτύξετε εφαρμογές AI** | [Κεφ. 2: Ανάπτυξη Πρώτα για AI](../..) |
| **Θέλετε πρακτική εξάσκηση** | [🎓 Διαδραστικό Εργαστήριο](workshop/README.md) - 3-4 hour guided lab |
| **Χρειάζεστε πρότυπα παραγωγής** | [Κεφ. 8: Παραγωγή & Επιχειρησιακά](../..) |

### Γρήγορη Ρύθμιση

1. **Fork Αυτό το Αποθετήριο**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Κλωνοποιήστε το**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Λάβετε Βοήθεια**: [Κοινότητα Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Προτιμάτε να κλωνοποιήσετε τοπικά;**
>
> Αυτό το αποθετήριο περιλαμβάνει 50+ μεταφράσεις που αυξάνουν σημαντικά το μέγεθος λήψης. Για να κάνετε clone χωρίς μεταφράσεις, χρησιμοποιήστε sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Αυτό σας δίνει όλα όσα χρειάζεστε για να ολοκληρώσετε το μάθημα με πολύ πιο γρήγορη λήψη.


## Επισκόπηση Μαθήματος

Κατακτήστε το Azure Developer CLI (azd) μέσα από δομημένα κεφάλαια σχεδιασμένα για προοδευτική μάθηση. **Ειδική έμφαση στην ανάπτυξη εφαρμογών AI με ενσωμάτωση Microsoft Foundry.**

### Γιατί Αυτό το Μάθημα Είναι Απαραίτητο για Σύγχρονους Προγραμματιστές

Βάσει των πληροφοριών της κοινότητας Microsoft Foundry Discord, **το 45% των προγραμματιστών θέλει να χρησιμοποιήσει το AZD για workloads AI** αλλά αντιμετωπίζει προκλήσεις με:
- Σύνθετες πολυ-υπηρεσιακές αρχιτεκτονικές AI
- Καλές πρακτικές ανάπτυξης AI σε παραγωγή  
- Ενσωμάτωση και ρύθμιση υπηρεσιών Azure AI
- Βελτιστοποίηση κόστους για workloads AI
- Επίλυση σφαλμάτων ειδικών για ανάπτυξη AI

### Στόχοι Μάθησης

Ολοκληρώνοντας αυτό το δομημένο μάθημα, θα:
- **Κατακτήσετε τα Βασικά του AZD**: Κύριες έννοιες, εγκατάσταση και ρύθμιση
- **Αναπτύξετε Εφαρμογές AI**: Χρησιμοποιήστε το AZD με τις υπηρεσίες Microsoft Foundry
- **Υλοποιήσετε Υποδομή ως Κώδικα**: Διαχειριστείτε πόρους Azure με πρότυπα Bicep
- **Επιλύσετε Προβλήματα Αναπτύξεων**: Επίλυση κοινών ζητημάτων και αποσφαλμάτωση
- **Βελτιστοποιήσετε για Παραγωγή**: Ασφάλεια, κλιμάκωση, παρακολούθηση και διαχείριση κόστους
- **Δημιουργήσετε Λύσεις Πολλών Πρακτόρων**: Αναπτύξτε σύνθετες αρχιτεκτονικές AI

## 🗺️ Χάρτης Μαθήματος: Γρήγορη Πλοήγηση ανά Κεφάλαιο

Κάθε κεφάλαιο έχει ένα αφιερωμένο README με στόχους μάθησης, γρήγορα ξεκινήματα και ασκήσεις:

| Κεφάλαιο | Θέμα | Μαθήματα | Διάρκεια | Πολυπλοκότητα |
|---------|-------|---------|----------|------------|
| **[Κεφ. 1: Θεμέλια](docs/chapter-01-foundation/README.md)** | Ξεκινώντας | [Βασικά του AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Εγκατάσταση](docs/chapter-01-foundation/installation.md) &#124; [Πρώτο Έργο](docs/chapter-01-foundation/first-project.md) | 30-45 λεπτά | ⭐ |
| **[Κεφ. 2: Ανάπτυξη AI](docs/chapter-02-ai-development/README.md)** | Εφαρμογές AI-First | [Ενσωμάτωση Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Πράκτορες AI](docs/chapter-02-ai-development/agents.md) &#124; [Ανάπτυξη Μοντέλου](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Εργαστήριο](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ώρες | ⭐⭐ |
| **[Κεφ. 3: Διαμόρφωση](docs/chapter-03-configuration/README.md)** | Ταυτοποίηση & Ασφάλεια | [Διαμόρφωση](docs/chapter-03-configuration/configuration.md) &#124; [Ταυτοποίηση & Ασφάλεια](docs/chapter-03-configuration/authsecurity.md) | 45-60 λεπτά | ⭐⭐ |
| **[Κεφ. 4: Υποδομή](docs/chapter-04-infrastructure/README.md)** | IaC & Ανάπτυξη | [Οδηγός Ανάπτυξης](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Παροχή Πόρων](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ώρες | ⭐⭐⭐ |
| **[Κεφ. 5: Πολλαπλοί Πράκτορες](docs/chapter-05-multi-agent/README.md)** | Λύσεις Πρακτόρων AI | [Σενάριο Λιανικής](examples/retail-scenario.md) &#124; [Σχήματα Συντονισμού](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ώρες | ⭐⭐⭐⭐ |
| **[Κεφ. 6: Προ-Ανάπτυξη](docs/chapter-06-pre-deployment/README.md)** | Σχεδιασμός & Επικύρωση | [Έλεγχοι Πριν την Ανάπτυξη](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Σχεδιασμός Χωρητικότητας](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Επιλογή SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ώρα | ⭐⭐ |
| **[Κεφ. 7: Αντιμετώπιση προβλημάτων](docs/chapter-07-troubleshooting/README.md)** | Αποσφαλμάτωση & Επιδιόρθωση | [Συνηθισμένα Προβλήματα](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Αποσφαλμάτωση](docs/chapter-07-troubleshooting/debugging.md) &#124; [Προβλήματα AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ώρες | ⭐⭐ |
| **[Κεφ. 8: Παραγωγή](docs/chapter-08-production/README.md)** | Επιχειρησιακά Σχήματα | [Πρακτικές Παραγωγής](docs/chapter-08-production/production-ai-practices.md) | 2-3 ώρες | ⭐⭐⭐⭐ |
| **[🎓 Εργαστήριο](workshop/README.md)** | Πρακτικό Εργαστήριο | [Εισαγωγή](workshop/docs/instructions/0-Introduction.md) &#124; [Επιλογή](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Επικύρωση](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Αποσύνθεση](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Διαμόρφωση](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Προσαρμογή](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Κατάργηση υποδομής](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Σύνοψη](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ώρες | ⭐⭐ |

**Συνολική Διάρκεια Μαθήματος:** ~10-14 ώρες | **Πρόοδος Δεξιοτήτων:** Αρχάριος → Έτοιμος για Παραγωγή

---

## 📚 Κεφάλαια Μάθησης

*Επιλέξτε το μονοπάτι μάθησής σας με βάση το επίπεδο εμπειρίας και τους στόχους*

### 🚀 Κεφάλαιο 1: Βάσεις & Γρήγορη Εκκίνηση
**Προαπαιτούμενα**: Συνδρομή Azure, βασικές γνώσεις γραμμής εντολών  
**Διάρκεια**: 30-45 λεπτά  
**Πολυπλοκότητα**: ⭐

#### Τι Θα Μάθετε
- Κατανόηση των βασικών του Azure Developer CLI
- Εγκατάσταση του AZD στην πλατφόρμα σας
- Η πρώτη σας επιτυχής ανάπτυξη

#### Πόροι Μάθησης
- **🎯 Ξεκινήστε Εδώ**: [Τι είναι το Azure Developer CLI?](../..)
- **📖 Θεωρία**: [Βασικά AZD](docs/chapter-01-foundation/azd-basics.md) - Βασικές έννοιες και ορολογία
- **⚙️ Ρύθμιση**: [Εγκατάσταση & Ρύθμιση](docs/chapter-01-foundation/installation.md) - Οδηγοί ανά πλατφόρμα
- **🛠️ Πρακτικά**: [Το Πρώτο Σας Έργο](docs/chapter-01-foundation/first-project.md) - Βήμα-βήμα σεμινάριο
- **📋 Σύντομη Αναφορά Εντολών**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Πρακτικές Ασκήσεις
```bash
# Γρήγορος έλεγχος εγκατάστασης
azd version

# Αναπτύξτε την πρώτη σας εφαρμογή
azd init --template todo-nodejs-mongo
azd up
```

**💡 Αποτέλεσμα Κεφαλαίου**: Να αναπτύξετε επιτυχώς μια απλή διαδικτυακή εφαρμογή στο Azure χρησιμοποιώντας το AZD

**✅ Επαλήθευση Επιτυχίας:**
```bash
# Μετά την ολοκλήρωση του Κεφαλαίου 1, θα πρέπει να μπορείτε να:
azd version              # Εμφανίζει την εγκατεστημένη έκδοση
azd init --template todo-nodejs-mongo  # Αρχικοποιεί το έργο
azd up                  # Αναπτύσσει στο Azure
azd show                # Εμφανίζει τη διεύθυνση URL της εφαρμογής που εκτελείται
# Η εφαρμογή ανοίγει στον περιηγητή και λειτουργεί
azd down --force --purge  # Καθαρίζει τους πόρους
```

**📊 Χρόνος Επένδυσης:** 30-45 λεπτά  
**📈 Επίπεδο Δεξιότητας Μετά:** Μπορεί να αναπτύσσει βασικές εφαρμογές ανεξάρτητα
**📈 Επίπεδο Δεξιότητας Μετά:** Μπορεί να αναπτύσσει βασικές εφαρμογές ανεξάρτητα

---

### 🤖 Κεφάλαιο 2: Ανάπτυξη με Έμφαση στο AI (Συνιστάται για προγραμματιστές AI)
**Προαπαιτούμενα**: Ολοκληρωμένο το Κεφάλαιο 1  
**Διάρκεια**: 1-2 ώρες  
**Πολυπλοκότητα**: ⭐⭐

#### Τι Θα Μάθετε
- Ενσωμάτωση Microsoft Foundry με το AZD
- Ανάπτυξη εφαρμογών με δυνατότητες AI
- Κατανόηση ρυθμίσεων υπηρεσιών AI

#### Πόροι Μάθησης
- **🎯 Ξεκινήστε Εδώ**: [Ενσωμάτωση Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Πράκτορες AI**: [Οδηγός Πρακτόρων AI](docs/chapter-02-ai-development/agents.md) - Ανάπτυξη ευφυών πρακτόρων με AZD
- **📖 Μοτίβα**: [Ανάπτυξη Μοντέλου AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Ανάπτυξη και διαχείριση μοντέλων AI
- **🛠️ Εργαστήριο**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Κάντε τις λύσεις AI σας έτοιμες για AZD
- **🎥 Διαδραστικός Οδηγός**: [Υλικά Εργαστηρίου](workshop/README.md) - Μάθηση μέσω προγράμματος περιήγησης με MkDocs * DevContainer Environment
- **📋 Πρότυπα**: [Πρότυπα Microsoft Foundry](../..)
- **📝 Παραδείγματα**: [Παραδείγματα Ανάπτυξης AZD](examples/README.md)

#### Πρακτικές Ασκήσεις
```bash
# Ανάπτυξε την πρώτη σου εφαρμογή τεχνητής νοημοσύνης
azd init --template azure-search-openai-demo
azd up

# Δοκίμασε επιπλέον πρότυπα τεχνητής νοημοσύνης
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε και ρυθμίστε μια συνομιλιακή εφαρμογή με AI και δυνατότητες RAG

**✅ Επαλήθευση Επιτυχίας:**
```bash
# Μετά το Κεφάλαιο 2, θα πρέπει να μπορείτε να:
azd init --template azure-search-openai-demo
azd up
# Δοκιμάστε τη διεπαφή συνομιλίας τεχνητής νοημοσύνης
# Κάντε ερωτήσεις και λάβετε απαντήσεις από τεχνητή νοημοσύνη με πηγές
# Επαληθεύστε ότι η ενσωμάτωση αναζήτησης λειτουργεί
azd monitor  # Ελέγξτε ότι το Application Insights εμφανίζει τηλεμετρία
azd down --force --purge
```

**📊 Χρόνος Επένδυσης:** 1-2 ώρες  
**📈 Επίπεδο Δεξιότητας Μετά:** Μπορεί να αναπτύσσει και να ρυθμίζει εφαρμογές AI έτοιμες για παραγωγή  
**💰 Ευαισθητοποίηση Κόστους:** Κατανοήστε το κόστος ανάπτυξης $80-150/μήνα, κόστος παραγωγής $300-3500/μήνα

#### 💰 Επιπτώσεις Κόστους για Αναπτύξεις AI

**Περιβάλλον Ανάπτυξης (Εκτιμώμενο $80-150/μήνα):**
- Μοντέλα Microsoft Foundry (Pay-as-you-go): $0-50/μήνα (με βάση τη χρήση tokens)
- AI Search (βασικό επίπεδο): $75/μήνα
- Container Apps (Κατανάλωση): $0-20/μήνα
- Storage (Standard): $1-5/μήνα

**Περιβάλλον Παραγωγής (Εκτιμώμενο $300-3,500+/μήνα):**
- Μοντέλα Microsoft Foundry (PTU για συνεπή απόδοση): $3,000+/μήνα Ή Pay-as-go με υψηλό όγκο
- AI Search (Standard tier): $250/μήνα
- Container Apps (Αφιερωμένο): $50-100/μήνα
- Application Insights: $5-50/μήνα
- Storage (Premium): $10-50/μήνα

**💡 Συμβουλές Βελτιστοποίησης Κόστους:**
- Χρησιμοποιήστε **Free Tier** Μοντέλα Microsoft Foundry για μάθηση (Azure OpenAI 50,000 tokens/μήνα περιλαμβάνονται)
- Εκτελέστε `azd down` για να απελευθερώσετε πόρους όταν δεν αναπτύσσετε ενεργά
- Ξεκινήστε με χρέωση βάσει κατανάλωσης, αναβαθμίστε σε PTU μόνο για παραγωγή
- Χρησιμοποιήστε `azd provision --preview` για να εκτιμήσετε το κόστος πριν την ανάπτυξη
- Ενεργοποιήστε αυτόματο κλιμάκωμα: πληρώνετε μόνο για την πραγματική χρήση

**Παρακολούθηση Κόστους:**
```bash
# Ελέγξτε τα εκτιμώμενα μηνιαία έξοδα
azd provision --preview

# Παρακολουθήστε τα πραγματικά έξοδα στο Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Κεφάλαιο 3: Διαμόρφωση & Ταυτοποίηση
**Προαπαιτούμενα**: Ολοκληρωμένο το Κεφάλαιο 1  
**Διάρκεια**: 45-60 λεπτά  
**Πολυπλοκότητα**: ⭐⭐

#### Τι Θα Μάθετε
- Διαμόρφωση και διαχείριση περιβάλλοντος
- Καλύτερες πρακτικές ταυτοποίησης και ασφάλειας
- Ονομασία πόρων και οργάνωση

#### Πόροι Μάθησης
- **📖 Διαμόρφωση**: [Οδηγός Διαμόρφωσης](docs/chapter-03-configuration/configuration.md) - Ρύθμιση περιβάλλοντος
- **🔐 Ασφάλεια**: [Πρότυπα ταυτοποίησης και managed identity](docs/chapter-03-configuration/authsecurity.md) - Πρότυπα ταυτοποίησης
- **📝 Παραδείγματα**: [Παράδειγμα Εφαρμογής Βάσης Δεδομένων](examples/database-app/README.md) - Παραδείγματα Βάσης Δεδομένων AZD

#### Πρακτικές Ασκήσεις
- Διαμορφώστε πολλαπλά περιβάλλοντα (dev, staging, prod)
- Ρυθμίστε ταυτοποίηση με managed identity
- Υλοποιήστε ρυθμίσεις ειδικές για κάθε περιβάλλον

**💡 Αποτέλεσμα Κεφαλαίου**: Διαχειριστείτε πολλαπλά περιβάλλοντα με σωστή ταυτοποίηση και ασφάλεια

---

### 🏗️ Κεφάλαιο 4: Υποδομή ως Κώδικας & Ανάπτυξη
**Προαπαιτούμενα**: Ολοκληρωμένα τα Κεφάλαια 1-3  
**Διάρκεια**: 1-1.5 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐

#### Τι Θα Μάθετε
- Προηγμένα μοτίβα ανάπτυξης
- Υποδομή ως Κώδικας με Bicep
- Στρατηγικές παροχής πόρων

#### Πόροι Μάθησης
- **📖 Ανάπτυξη**: [Οδηγός Ανάπτυξης](docs/chapter-04-infrastructure/deployment-guide.md) - Πλήρεις ροές εργασίας
- **🏗️ Παροχή Πόρων**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Διαχείριση πόρων Azure
- **📝 Παραδείγματα**: [Παράδειγμα Εφαρμογής Container](../../examples/container-app) - Ανάπτυξη με containers

#### Πρακτικές Ασκήσεις
- Δημιουργήστε προσαρμοσμένα πρότυπα Bicep
- Αναπτύξτε εφαρμογές πολλαπλών υπηρεσιών
- Υλοποιήστε στρατηγικές blue-green ανάπτυξης

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε σύνθετες εφαρμογές πολλαπλών υπηρεσιών χρησιμοποιώντας προσαρμοσμένα πρότυπα υποδομής

---

### 🎯 Κεφάλαιο 5: Λύσεις AI με Πολλαπλούς Πράκτορες (Προχωρημένο)
**Προαπαιτούμενα**: Ολοκληρωμένα τα Κεφάλαια 1-2  
**Διάρκεια**: 2-3 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐⭐

#### Τι Θα Μάθετε
- Μοτίβα αρχιτεκτονικής πολλαπλών πρακτόρων
- Ορχήστρωση και συντονισμός πρακτόρων
- Αναπτύξεις AI έτοιμες για παραγωγή

#### Πόροι Μάθησης
- **🤖 Διακεκριμένο Έργο**: [Λύση Πολλαπλών Πρακτόρων για Λιανική](examples/retail-scenario.md) - Πλήρης υλοποίηση
- **🛠️ ARM Πρότυπα**: [Πακέτο ARM Template](../../examples/retail-multiagent-arm-template) - Ανάπτυξη με ένα κλικ
- **📖 Αρχιτεκτονική**: [Σχήματα συντονισμού πολλαπλών πρακτόρων](docs/chapter-06-pre-deployment/coordination-patterns.md) - Μοτίβα

#### Πρακτικές Ασκήσεις
```bash
# Αναπτύξτε την πλήρη λύση πολλαπλών πρακτόρων για τη λιανική
cd examples/retail-multiagent-arm-template
./deploy.sh

# Εξερευνήστε τις ρυθμίσεις των πρακτόρων
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε και διαχειριστείτε μια λύση AI με πολλούς πράκτορες έτοιμη για παραγωγή με πράκτορες Πελατών και Αποθεμάτων

---

### 🔍 Κεφάλαιο 6: Επικύρωση & Σχεδιασμός πριν την Ανάπτυξη
**Προαπαιτούμενα**: Ολοκληρωμένο το Κεφάλαιο 4  
**Διάρκεια**: 1 ώρα  
**Πολυπλοκότητα**: ⭐⭐

#### Τι Θα Μάθετε
- Σχεδιασμός χωρητικότητας και επικύρωση πόρων
- Στρατηγικές επιλογής SKU
- Προ-ελεγχοι και αυτοματοποίηση

#### Πόροι Μάθησης
- **📊 Σχεδιασμός**: [Σχεδιασμός Χωρητικότητας](docs/chapter-06-pre-deployment/capacity-planning.md) - Επικύρωση πόρων
- **💰 Επιλογή**: [Επιλογή SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Οικονομικά αποδοτικές επιλογές
- **✅ Επικύρωση**: [Έλεγχοι Πριν την Ανάπτυξη](docs/chapter-06-pre-deployment/preflight-checks.md) - Αυτοματοποιημένα σενάρια

#### Πρακτικές Ασκήσεις
- Εκτελέστε σενάρια επικύρωσης χωρητικότητας
- Βελτιστοποιήστε τις επιλογές SKU για κόστος
- Εφαρμόστε αυτοματοποιημένους ελέγχους πριν την ανάπτυξη

**💡 Αποτέλεσμα Κεφαλαίου**: Επικυρώστε και βελτιστοποιήστε τις αναπτύξεις πριν την εκτέλεση

---

### 🚨 Κεφάλαιο 7: Αντιμετώπιση Προβλημάτων & Αποσφαλμάτωση
**Προαπαιτούμενα**: Οποιοδήποτε κεφάλαιο ανάπτυξης έχει ολοκληρωθεί  
**Διάρκεια**: 1-1.5 ώρες  
**Πολυπλοκότητα**: ⭐⭐

#### Τι Θα Μάθετε
- Συστηματικές προσεγγίσεις αποσφαλμάτωσης
- Συνήθη προβλήματα και λύσεις
- Ειδική για AI αντιμετώπιση προβλημάτων

#### Πόροι Μάθησης
- **🔧 Συνηθισμένα Προβλήματα**: [Συνηθισμένα Προβλήματα](docs/chapter-07-troubleshooting/common-issues.md) - Συχνές ερωτήσεις και λύσεις
- **🕵️ Αποσφαλμάτωση**: [Οδηγός Αποσφαλμάτωσης](docs/chapter-07-troubleshooting/debugging.md) - Στρατηγικές βήμα-βήμα
- **🤖 Προβλήματα AI**: [Αντιμετώπιση Προβλημάτων Ειδικά για AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Προβλήματα υπηρεσιών AI

#### Πρακτικές Ασκήσεις
- Διαγνώστε αποτυχίες ανάπτυξης
- Επίλυση προβλημάτων ταυτοποίησης
- Αποσφαλμάτωση συνδεσιμότητας υπηρεσιών AI

**💡 Αποτέλεσμα Κεφαλαίου**: Διαγνώστε και επιλύστε ανεξάρτητα συνήθη προβλήματα ανάπτυξης

---

### 🏢 Κεφάλαιο 8: Παραγωγή & Επιχειρησιακά Μοτίβα
**Προαπαιτούμενα**: Ολοκληρωμένα τα Κεφάλαια 1-4  
**Διάρκεια**: 2-3 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐⭐

#### Τι Θα Μάθετε
- Στρατηγικές ανάπτυξης για παραγωγή
- Επιχειρησιακά μοτίβα ασφάλειας
- Παρακολούθηση και βελτιστοποίηση κόστους

#### Πόροι Μάθησης
- **🏭 Παραγωγή**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Σχήματα επιχειρήσεων
- **📝 Παραδείγματα**: [Microservices Example](../../examples/microservices) - Σύνθετες αρχιτεκτονικές
- **📊 Παρακολούθηση**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Παρακολούθηση

#### Πρακτικές Ασκήσεις
- Υλοποιήστε πρότυπα ασφάλειας για επιχειρήσεις
- Ρυθμίστε ολοκληρωμένη παρακολούθηση
- Αναπτύξτε σε παραγωγή με κατάλληλη διακυβέρνηση

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε εφαρμογές έτοιμες για επιχειρήσεις με πλήρεις δυνατότητες παραγωγής

---

## 🎓 Επισκόπηση Εργαστηρίου: Πρακτική Εκπαιδευτική Εμπειρία

> **⚠️ ΚΑΤΑΣΤΑΣΗ ΕΡΓΑΣΤΗΡΙΟΥ: Ενεργή Ανάπτυξη**  
> Το υλικό του εργαστηρίου αναπτύσσεται και βελτιώνεται επί του παρόντος. Οι βασικές ενότητες λειτουργούν, αλλά ορισμένα προχωρημένα τμήματα είναι ατελή. Εργαζόμαστε ενεργά για να ολοκληρώσουμε όλο το περιεχόμενο. [Παρακολουθήστε την πρόοδο →](workshop/README.md)

### Διαδραστικά Υλικά Εργαστηρίου
**Ολοκληρωμένη πρακτική μάθηση με εργαλεία στο πρόγραμμα περιήγησης και καθοδηγούμενες ασκήσεις**

Τα υλικά του εργαστηρίου παρέχουν μια δομημένη, διαδραστική εμπειρία μάθησης που συμπληρώνει το κεφαλαίο πρόγραμμα σπουδών παραπάνω. Το εργαστήριο είναι σχεδιασμένο τόσο για αυτο-ρυθμιζόμενη μάθηση όσο και για συνεδρίες με καθοδηγητή.

#### 🛠️ Χαρακτηριστικά Εργαστηρίου
- **Διεπαφή μέσω Προγράμματος Περιήγησης**: Πλήρες εργαστήριο με MkDocs με λειτουργίες αναζήτησης, αντιγραφής και θέματος
- **Ενσωμάτωση GitHub Codespaces**: Ρύθμιση περιβάλλοντος ανάπτυξης με ένα κλικ
- **Δομημένη Πορεία Μάθησης**: 8-μονάδων καθοδηγούμενες ασκήσεις (3-4 ώρες συνολικά)
- **Προοδευτική Μεθοδολογία**: Εισαγωγή → Επιλογή → Επικύρωση → Αποσύνθεση → Διαμόρφωση → Προσαρμογή → Κατάργηση → Ανασκόπηση
- **Διαδραστικό Περιβάλλον DevContainer**: Προρυθμισμένα εργαλεία και εξαρτήσεις

#### 📚 Δομή Μονάδων Εργαστηρίου
Το εργαστήριο ακολουθεί μια **8-μονάδων προοδευτική μεθοδολογία** που σας οδηγεί από την ανακάλυψη στην κυριαρχία ανάπτυξης:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Εισαγωγή** | Επισκόπηση Εργαστηρίου | Κατανοήστε τους στόχους μάθησης, τις προαπαιτούμενες γνώσεις και τη δομή του εργαστηρίου | 15 min |
| **1. Επιλογή** | Εύρεση Προτύπου | Εξερευνήστε πρότυπα AZD και επιλέξτε το κατάλληλο πρότυπο AI για το σενάριό σας | 20 min |
| **2. Επικύρωση** | Ανάπτυξη & Επαλήθευση | Αναπτύξτε το πρότυπο με `azd up` και επικυρώστε ότι η υποδομή λειτουργεί | 30 min |
| **3. Αποσύνθεση** | Κατανόηση Δομής | Χρησιμοποιήστε GitHub Copilot για να εξερευνήσετε την αρχιτεκτονική του προτύπου, αρχεία Bicep και την οργάνωση κώδικα | 30 min |
| **4. Διαμόρφωση** | Εμβάθυνση στο azure.yaml | Εφαρμόστε πλήρως τη ρύθμιση `azure.yaml`, hooks κύκλου ζωής και μεταβλητές περιβάλλοντος | 30 min |
| **5. Προσαρμογή** | Προσαρμόστε στη δική σας περίπτωση | Ενεργοποιήστε AI Search, tracing, αξιολόγηση και προσαρμόστε για το σενάριό σας | 45 min |
| **6. Κατάργηση** | Καθαρισμός | Ασφαλής αποδέσμευση πόρων με `azd down --purge` | 15 min |
| **7. Ανασκόπηση** | Επόμενα Βήματα | Ανασκόπηση επιτευγμάτων, βασικών εννοιών και συνέχιση της μαθησιακής πορείας | 15 min |

**Flow Εργαστηρίου:**
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
# Κάντε κλικ στο "Code" → "Δημιουργία codespace στο main" στο αποθετήριο

# Επιλογή 2: Τοπική ανάπτυξη
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Ακολουθήστε τις οδηγίες ρύθμισης στο workshop/README.md
```

#### 🎯 Μαθησιακά Αποτελέσματα Εργαστηρίου
Με την ολοκλήρωση του εργαστηρίου, οι συμμετέχοντες θα:
- **Αναπτύξουν Εφαρμογές AI για Παραγωγή**: Χρησιμοποιήστε AZD με Microsoft Foundry υπηρεσίες
- **Κατακτήσουν Αρχιτεκτονικές Πολλαπλών Πρακτόρων**: Υλοποιήστε συντονισμένες λύσεις AI πρακτόρων
- **Υλοποιήσουν Καλές Πρακτικές Ασφαλείας**: Διαμορφώστε έλεγχο ταυτότητας και έλεγχο πρόσβασης
- **Βελτιστοποιήσουν για Κλίμακα**: Σχεδιάστε οικονομικές, αποδοτικές για απόδοση αναπτύξεις
- **Αντιμετωπίσουν Προβλήματα Ανεξάρτητα**: Επίλυση κοινών θεμάτων ανάπτυξης

#### 📖 Πόροι Εργαστηρίου
- **🎥 Διαδραστικός Οδηγός**: [Workshop Materials](workshop/README.md) - Περιβάλλον μάθησης μέσω προγράμματος περιήγησης
- **📋 Οδηγίες ανά Μονάδα**:
  - [0. Εισαγωγή](workshop/docs/instructions/0-Introduction.md) - Επισκόπηση εργαστηρίου και στόχοι
  - [1. Επιλογή](workshop/docs/instructions/1-Select-AI-Template.md) - Βρείτε και επιλέξτε πρότυπα AI
  - [2. Επικύρωση](workshop/docs/instructions/2-Validate-AI-Template.md) - Αναπτύξτε και επαληθεύστε πρότυπα
  - [3. Αποσύνθεση](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Εξερευνήστε την αρχιτεκτονική προτύπου
  - [4. Διαμόρφωση](workshop/docs/instructions/4-Configure-AI-Template.md) - Κατανοήστε σε βάθος το azure.yaml
  - [5. Προσαρμογή](workshop/docs/instructions/5-Customize-AI-Template.md) - Προσαρμογή για το σενάριό σας
  - [6. Κατάργηση](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Καθαρισμός πόρων
  - [7. Ανασκόπηση](workshop/docs/instructions/7-Wrap-up.md) - Ανασκόπηση και επόμενα βήματα
- **🛠️ Εργαστήριο AI Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ασκήσεις επικεντρωμένες στο AI
- **💡 Γρήγορη Εκκίνηση**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ρύθμιση περιβάλλοντος

**Ιδανικό για**: Εκπαίδευση εταιρειών, πανεπιστημιακά μαθήματα, αυτο-ρυθμιζόμενη μάθηση και bootcamps για προγραμματιστές.

---

## 📖 Εμβάθυνση: Δυνατότητες AZD

Πέρα από τα βασικά, το AZD παρέχει ισχυρές λειτουργίες για αναπτύξεις παραγωγής:

- **Αναπτύξεις με βάση πρότυπα** - Χρησιμοποιήστε προ-χτισμένα πρότυπα για συνήθη πρότυπα εφαρμογών
- **Υποδομή ως Κώδικας** - Διαχειριστείτε πόρους Azure χρησιμοποιώντας Bicep ή Terraform  
- **Ενσωματωμένα ροή εργασιών** - Προμηθεύστε, αναπτύξτε και παρακολουθήστε εφαρμογές χωρίς ρήγματα
- **Φιλικό προς τον Προγραμματιστή** - Βελτιστοποιημένο για παραγωγικότητα και εμπειρία προγραμματιστή

### **AZD + Microsoft Foundry: Ιδανικό για αναπτύξεις AI**

**Γιατί AZD για λύσεις AI;** Το AZD αντιμετωπίζει τις κύριες προκλήσεις που συναντούν οι προγραμματιστές AI:

- **Έτοιμα Πρότυπα για AI** - Προδιαμορφωμένα πρότυπα για Microsoft Foundry Models, Cognitive Services και φορτία ML
- **Ασφαλείς Αναπτύξεις AI** - Ενσωματωμένα πρότυπα ασφαλείας για υπηρεσίες AI, κλειδιά API και endpoints μοντέλων  
- **Πρότυπα Παραγωγής για AI** - Καλές πρακτικές για κλιμακούμενες, οικονομικές αναπτύξεις εφαρμογών AI
- **End-to-End Ροές Εργασίας AI** - Από την ανάπτυξη μοντέλου έως την παραγωγή με κατάλληλη παρακολούθηση
- **Βελτιστοποίηση Κόστους** - Έξυπνη κατανομή πόρων και στρατηγικές κλιμάκωσης για φορτία AI
- **Ενσωμάτωση Microsoft Foundry** - Απρόσκοπτη σύνδεση με τον κατάλογο μοντέλων και τα endpoints του Microsoft Foundry

---

## 🎯 Βιβλιοθήκη Προτύπων & Παραδειγμάτων

### Επιλεγμένα: Πρότυπα Microsoft Foundry
**Ξεκινήστε εδώ αν αναπτύσσετε εφαρμογές AI!**

> **Σημείωση:** Αυτά τα πρότυπα επιδεικνύουν διάφορα πρότυπα AI. Μερικά είναι εξωτερικά Azure Samples, άλλα είναι τοπικές υλοποιήσεις.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Ξεκινήστε με AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Κεφάλαιο 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Εξωτερικό |
| [**Ξεκινήστε με AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Κεφάλαιο 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Εξωτερικό |
| [**Azure Search + OpenAI Παράδειγμα**](https://github.com/Azure-Samples/azure-search-openai-demo) | Κεφάλαιο 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Εξωτερικό |
| [**Γρήγορη εκκίνηση OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Κεφάλαιο 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Εξωτερικό |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Κεφάλαιο 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Εξωτερικό |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Κεφάλαιο 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Εξωτερικό |
| [**Λύση Λιανικής με Πολλαπλούς Πράκτορες**](examples/retail-scenario.md) | Κεφάλαιο 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Τοπικό** |

### Επιλεγμένα: Πλήρη Σενάρια Μάθησης
**Πρότυπα έτοιμα για παραγωγή χαρτογραφημένα σε κεφάλαια μάθησης**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Κεφάλαιο 2 | ⭐ | Βασικά πρότυπα ανάπτυξης AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Κεφάλαιο 2 | ⭐⭐ | Υλοποίηση RAG με Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Κεφάλαιο 4 | ⭐⭐ | Ενσωμάτωση Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Κεφάλαιο 5 | ⭐⭐⭐ | Πλαίσιο πρακτόρων και function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Κεφάλαιο 8 | ⭐⭐⭐ | Ορχήστρωση επιχειρησιακού AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Κεφάλαιο 5 | ⭐⭐⭐⭐ | Αρχιτεκτονική πολλαπλών πρακτόρων με πράκτορες Πελάτη και Αποθέματος |

### Μάθηση με βάση τον τύπο παραδείγματος

> **📌 Τοπικά vs. Εξωτερικά Παραδείγματα:**  
> **Τοπικά Παραδείγματα** (σε αυτό το repo) = Έτοιμα για άμεση χρήση  
> **Εξωτερικά Παραδείγματα** (Azure Samples) = Κλωνοποιήστε από τα συνδεδεμένα αποθετήρια

#### Τοπικά Παραδείγματα (Έτοιμα για Χρήση)
- [**Λύση Λιανικής με Πολλαπλούς Πράκτορες**](examples/retail-scenario.md) - Πλήρης υλοποίηση έτοιμη για παραγωγή με ARM templates
  - Αρχιτεκτονική πολλαπλών πρακτόρων (Πράκτορας Πελάτης + Πράκτορας Αποθέματος)
  - Ολοκληρωμένη παρακολούθηση και αξιολόγηση
  - Ανάπτυξη με ένα κλικ μέσω ARM template

#### Τοπικά Παραδείγματα - Εφαρμογές Container (Κεφάλαια 2-5)
**Ολοκληρωμένα παραδείγματα ανάπτυξης με containers σε αυτό το αποθετήριο:**
- [**Παραδείγματα Container App**](examples/container-app/README.md) - Οδηγός για containerized αναπτύξεις
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Βασικό REST API με scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Παραγωγική ανάπτυξη πολλαπλών υπηρεσιών
  - Γρήγορη εκκίνηση, Παραγωγή και Προχωρημένα πρότυπα ανάπτυξης
  - Οδηγίες για παρακολούθηση, ασφάλεια και βελτιστοποίηση κόστους

#### Εξωτερικά Παραδείγματα - Απλές Εφαρμογές (Κεφάλαια 1-2)
**Κλωνοποιήστε αυτά τα αποθετήρια Azure Samples για να ξεκινήσετε:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Βασικά πρότυπα ανάπτυξης
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Ανάπτυξη στατικού περιεχομένου
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Ανάπτυξη REST API

#### Εξωτερικά Παραδείγματα - Ενσωμάτωση Βάσης Δεδομένων (Κεφάλαια 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Πρότυπα σύνδεσης βάσης δεδομένων
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless ροές δεδομένων

#### Εξωτερικά Παραδείγματα - Προχωρημένα Πρότυπα (Κεφάλαια 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Αρχιτεκτονικές πολλαπλών υπηρεσιών
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Επεξεργασία υποβάθρου  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Παραγωγικά πρότυπα ML

### Συλλογές Εξωτερικών Προτύπων
- [**Επίσημη Συλλογή Προτύπων AZD**](https://azure.github.io/awesome-azd/) - Επιλεγμένη συλλογή επίσημων και κοινοτικών προτύπων
- [**Πρότυπα Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Τεκμηρίωση προτύπων Microsoft Learn
- [**Κατάλογος Παραδειγμάτων**](examples/README.md) - Τοπικά παραδείγματα μάθησης με λεπτομερείς εξηγήσεις

---

## 📚 Πόροι Μάθησης & Αναφορές

### Σύντομες Αναφορές
- [**Cheat Sheet Εντολών**](resources/cheat-sheet.md) - Βασικές εντολές azd οργανωμένες ανά κεφάλαιο
- [**Γλωσσάρι**](resources/glossary.md) - Ορολογία Azure και azd  
- [**Συχνές Ερωτήσεις**](resources/faq.md) - Συνήθεις ερωτήσεις οργανωμένες ανά κεφάλαιο μάθησης
- [**Οδηγός Μελέτης**](resources/study-guide.md) - Ολοκληρωμένες ασκήσεις πρακτικής

### Πρακτικά Εργαστήρια
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Κάντε τις λύσεις AI σας αναπτύξιμες με AZD (2-3 ώρες)
- [**Διαδραστικό Εργαστήριο**](workshop/README.md) - 8-μονάδων καθοδηγούμενες ασκήσεις με MkDocs και GitHub Codespaces
  - Ακολουθεί: Εισαγωγή → Επιλογή → Επικύρωση → Αποσύνθεση → Διαμόρφωση → Προσαρμογή → Κατάργηση → Ανασκόπηση

### Εξωτερικοί Πόροι Μάθησης
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Κέντρο Αρχιτεκτονικής Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Υπολογιστής Τιμολόγησης Azure](https://azure.microsoft.com/pricing/calculator/)
- [Κατάσταση Azure](https://status.azure.com/)

### Δεξιότητες πρακτόρων AI για τον επεξεργαστή σας
- [**Δεξιότητες Microsoft Azure στο skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 ανοιχτές δεξιότητες πρακτόρων για Azure AI, Foundry, ανάπτυξη, διάγνωση, βελτιστοποίηση κόστους και άλλα. Εγκαταστήστε τις στο GitHub Copilot, Cursor, Claude Code, ή σε οποιονδήποτε υποστηριζόμενο πράκτορα:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Γρήγορος Οδηγός Επίλυσης Προβλημάτων

**Συνήθη προβλήματα που αντιμετωπίζουν οι αρχάριοι και άμεσες λύσεις:**

<details>
<summary><strong>❌ "azd: εντολή δεν βρέθηκε"</strong></summary>

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
<summary><strong>❌ "Δεν βρέθηκε συνδρομή" ή "Η συνδρομή δεν έχει οριστεί"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" ή "Υπέρβαση ορίου"</strong></summary>

```bash
# Δοκιμάστε διαφορετική περιοχή του Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ή χρησιμοποιήστε μικρότερα SKUs σε περιβάλλον ανάπτυξης
# Επεξεργαστείτε το infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" αποτυγχάνει στα μισά</strong></summary>

```bash
# Επιλογή 1: Καθαρίστε και δοκιμάστε ξανά
azd down --force --purge
azd up

# Επιλογή 2: Απλώς επιδιορθώστε την υποδομή
azd provision

# Επιλογή 3: Ελέγξτε την λεπτομερή κατάσταση
azd show

# Επιλογή 4: Ελέγξτε τα αρχεία καταγραφής στο Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Αποτυχία πιστοποίησης" ή "Το token έχει λήξει"</strong></summary>

```bash
# Επανααυθεντικοποίηση
az logout
az login

azd auth logout
azd auth login

# Επαληθεύστε την αυθεντικοποίηση
az account show
```
</details>

<details>
<summary><strong>❌ "Ο πόρος υπάρχει ήδη" ή "συγκρούσεις ονομάτων"</strong></summary>

```bash
# AZD δημιουργεί μοναδικά ονόματα, αλλά σε περίπτωση σύγκρουσης:
azd down --force --purge

# Στη συνέχεια δοκιμάστε ξανά με νέο περιβάλλον
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Η ανάπτυξη του προτύπου διαρκεί πολύ</strong></summary>

**Κανονικοί χρόνοι αναμονής:**
- Απλή εφαρμογή ιστού: 5-10 λεπτά
- Εφαρμογή με βάση δεδομένων: 10-15 λεπτά
- Εφαρμογές AI: 15-25 λεπτά (η παροχή OpenAI είναι αργή)

```bash
# Ελέγξτε την πρόοδο
azd show

# Εάν κολλήσετε πάνω από 30 λεπτά, ελέγξτε το Azure Portal:
azd monitor
# Αναζητήστε αποτυχημένες αναπτύξεις
```
</details>

<details>
<summary><strong>❌ "Άρνηση πρόσβασης" ή "Απαγορευμένο"</strong></summary>

```bash
# Ελέγξτε τον ρόλο σας στο Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Χρειάζεστε τουλάχιστον τον ρόλο "Contributor"
# Ζητήστε από τον διαχειριστή Azure σας να χορηγήσει:
# - Contributor (για πόρους)
# - User Access Administrator (για αναθέσεις ρόλων)
```
</details>

<details>
<summary><strong>❌ Δεν μπορεί να βρεθεί το URL της αναπτυγμένης εφαρμογής</strong></summary>

```bash
# Εμφανίστε όλα τα τελικά σημεία υπηρεσιών
azd show

# Ή ανοίξτε το Azure Portal
azd monitor

# Ελέγξτε μια συγκεκριμένη υπηρεσία
azd env get-values
# Αναζητήστε μεταβλητές *_URL
```
</details>

### 📚 Πλήρεις Πόροι Επίλυσης Προβλημάτων

- **Οδηγός Συνήθων Προβλημάτων:** [Λεπτομερείς Λύσεις](docs/chapter-07-troubleshooting/common-issues.md)
- **Προβλήματα ειδικά για AI:** [Επίλυση προβλημάτων AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Οδηγός Αποσφαλμάτωσης:** [Αποσφαλμάτωση βήμα-βήμα](docs/chapter-07-troubleshooting/debugging.md)
- **Λάβετε Βοήθεια:** [Discord του Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ολοκλήρωση Μαθήματος & Πιστοποίηση

### Παρακολούθηση Προόδου
Παρακολουθήστε την πρόοδο της μάθησής σας σε κάθε κεφάλαιο:

- [ ] **Κεφάλαιο 1**: Βάσεις & Γρήγορη εκκίνηση ✅
- [ ] **Κεφάλαιο 2**: Ανάπτυξη με προτεραιότητα το AI ✅  
- [ ] **Κεφάλαιο 3**: Διαμόρφωση & Αυθεντικοποίηση ✅
- [ ] **Κεφάλαιο 4**: Υποδομή ως Κώδικας & Ανάπτυξη ✅
- [ ] **Κεφάλαιο 5**: Λύσεις AI με πολλούς πράκτορες ✅
- [ ] **Κεφάλαιο 6**: Προ-αναπτυξιακή επικύρωση & Σχεδιασμός ✅
- [ ] **Κεφάλαιο 7**: Επίλυση Προβλημάτων & Αποσφαλμάτωση ✅
- [ ] **Κεφάλαιο 8**: Παραγωγή & Πρότυπα Επιχειρήσεων ✅

### Επαλήθευση Μάθησης
Αφού ολοκληρώσετε κάθε κεφάλαιο, επαληθεύστε τις γνώσεις σας κάνοντας:
1. **Πρακτική Άσκηση**: Ολοκληρώστε την πρακτική ανάπτυξη του κεφαλαίου
2. **Έλεγχος Γνώσεων**: Ελέγξτε την ενότητα Συχνών Ερωτήσεων για το κεφάλαιό σας
3. **Συζήτηση Κοινότητας**: Μοιραστείτε την εμπειρία σας στο Discord του Azure
4. **Επόμενο Κεφάλαιο**: Προχωρήστε στο επόμενο επίπεδο πολυπλοκότητας

### Οφέλη Ολοκλήρωσης Μαθήματος
Μετά την ολοκλήρωση όλων των κεφαλαίων, θα έχετε:
- **Εμπειρία Παραγωγής**: Αναπτύξατε πραγματικές εφαρμογές AI στο Azure
- **Επαγγελματικές Δεξιότητες**: Δυνατότητες ανάπτυξης έτοιμες για επιχειρήσεις  
- **Αναγνώριση στην Κοινότητα**: Ενεργό μέλος της κοινότητας προγραμματιστών Azure
- **Επαγγελματική Ανάπτυξη**: Ζητούμενη τεχνογνωσία σε AZD και ανάπτυξη AI

---

## 🤝 Κοινότητα & Υποστήριξη

### Λάβετε Βοήθεια & Υποστήριξη
- **Τεχνικά Ζητήματα**: [Αναφέρετε σφάλματα και ζητήστε δυνατότητες](https://github.com/microsoft/azd-for-beginners/issues)
- **Ερωτήσεις Εκμάθησης**: [Κοινότητα Discord του Microsoft Azure](https://discord.gg/microsoft-azure) και [![Discord του Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Βοήθεια ειδικά για AI**: Εγγραφείτε στο [![Discord του Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Τεκμηρίωση**: [Επίσημη τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Εμπειρίες Κοινότητας από το Discord του Microsoft Foundry

**Πρόσφατα Αποτελέσματα Δημοσκόπησης από το κανάλι #Azure:**
- **45%** των προγραμματιστών θέλουν να χρησιμοποιήσουν το AZD για φόρτο εργασίας AI
- **Κύριες προκλήσεις**: Αναπτύξεις πολλαπλών υπηρεσιών, διαχείριση διαπιστευτηρίων, ετοιμότητα για παραγωγή  
- **Πιο ζητούμενα**: Πρότυπα ειδικά για AI, οδηγοί αντιμετώπισης προβλημάτων, βέλτιστες πρακτικές

### Ενταχθείτε στην κοινότητά μας για να:
- Κοινοποιήστε τις εμπειρίες σας με AZD + AI και λάβετε βοήθεια
- Πρόσβαση σε πρώιμες προεπισκοπήσεις νέων προτύπων AI
- Συνεισφέρετε στις βέλτιστες πρακτικές ανάπτυξης AI
- Επηρεάστε την μελλοντική ανάπτυξη χαρακτηριστικών AI + AZD

### Συνεισφορά στο Μάθημα
Καλωσορίζουμε τις συνεισφορές! Παρακαλούμε διαβάστε τον [Οδηγό Συνεισφοράς](CONTRIBUTING.md) για λεπτομέρειες σχετικά με:
- **Βελτιώσεις Περιεχομένου**: Βελτιώστε υπάρχοντα κεφάλαια και παραδείγματα
- **Νέα Παραδείγματα**: Προσθέστε σενάρια και πρότυπα από πραγματικό κόσμο  
- **Μετάφραση**: Βοηθήστε στη διατήρηση της υποστήριξης πολλαπλών γλωσσών
- **Αναφορές Σφαλμάτων**: Βελτιώστε την ακρίβεια και τη σαφήνεια
- **Πρότυπα Κοινότητας**: Ακολουθήστε τις συμπεριληπτικές οδηγίες της κοινότητάς μας

---

## 📄 Πληροφορίες Μαθήματος

### Άδεια
Αυτό το έργο διανέμεται υπό την άδεια MIT - δείτε το αρχείο [LICENSE](../../LICENSE) για λεπτομέρειες.

### Σχετικοί Πόροι Μάθησης της Microsoft

Η ομάδα μας παράγει και άλλα ολοκληρωμένα εκπαιδευτικά μαθήματα:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j για Αρχάριους](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js για Αρχάριους](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain για Αρχάριους](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Πράκτορες
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
 
### Core Learning
[![ML για Αρχάριους](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Επιστήμη Δεδομένων για Αρχάριους](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI για Αρχάριους](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Κυβερνοασφάλεια για Αρχάριους](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Ανάπτυξη Ιστού για Αρχάριους](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
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

**🚀 Έτοιμοι να ξεκινήσετε;**

**Αρχάριοι**: Ξεκινήστε με [Κεφάλαιο 1: Θεμέλια & Γρήγορη Εκκίνηση](../..)  
**Προγραμματιστές AI**: Μεταβείτε στο [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στο AI](../..)  
**Έμπειροι Προγραμματιστές**: Ξεκινήστε με [Κεφάλαιο 3: Διαμόρφωση & Πιστοποίηση](../..)

**Επόμενα Βήματα**: [Ξεκινήστε το Κεφάλαιο 1 - Βασικά του AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης τεχνητής νοημοσύνης Co-op Translator (https://github.com/Azure/co-op-translator). Παρόλο που καταβάλουμε προσπάθειες για την ακρίβεια, παρακαλούμε να λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το αρχικό έγγραφο στη γλώσσα του πρέπει να θεωρείται η αυθεντική/επίσημη πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->