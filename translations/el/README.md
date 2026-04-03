# AZD Για Αρχάριους: Ένα Δομημένο Ταξίδι Μάθησης

![AZD-για-αρχάριους](../../translated_images/el/azdbeginners.5527441dd9f74068.webp) 

[![Παρατηρητές GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Διακλαδώσεις GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Αστέρια GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Αυτόματες Μεταφράσεις (Πάντα Ενημερωμένες)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Αραβικά](../ar/README.md) | [Μπενγκάλι](../bn/README.md) | [Βουλγαρικά](../bg/README.md) | [Βιρμανικά (Μιανμάρ)](../my/README.md) | [Κινεζικά (Απλοποιημένα)](../zh-CN/README.md) | [Κινεζικά (Παραδοσιακά, Χονγκ Κονγκ)](../zh-HK/README.md) | [Κινεζικά (Παραδοσιακά, Μακάο)](../zh-MO/README.md) | [Κινεζικά (Παραδοσιακά, Ταϊβάν)](../zh-TW/README.md) | [Κροατικά](../hr/README.md) | [Τσέχικα](../cs/README.md) | [Δανικά](../da/README.md) | [Ολλανδικά](../nl/README.md) | [Εσθονικά](../et/README.md) | [Φινλανδικά](../fi/README.md) | [Γαλλικά](../fr/README.md) | [Γερμανικά](../de/README.md) | [Ελληνικά](./README.md) | [Εβραϊκά](../he/README.md) | [Χίντι](../hi/README.md) | [Ουγγρικά](../hu/README.md) | [Ινδονησιακά](../id/README.md) | [Ιταλικά](../it/README.md) | [Ιαπωνικά](../ja/README.md) | [Κανάντα](../kn/README.md) | [Χμερικά](../km/README.md) | [Κορεατικά](../ko/README.md) | [Λιθουανικά](../lt/README.md) | [Μαλαϊκά](../ms/README.md) | [Μαλαγιάλαμ](../ml/README.md) | [Μαραθικά](../mr/README.md) | [Νεπαλικά](../ne/README.md) | [Νιγηριανό Pidgin](../pcm/README.md) | [Νορβηγικά](../no/README.md) | [Περσικά (Φαρσί)](../fa/README.md) | [Πολωνικά](../pl/README.md) | [Πορτογαλικά (Βραζιλία)](../pt-BR/README.md) | [Πορτογαλικά (Πορτογαλία)](../pt-PT/README.md) | [Πουντζαβικά (Gurmukhi)](../pa/README.md) | [Ρουμάνικα](../ro/README.md) | [Ρωσικά](../ru/README.md) | [Σερβικά (Κυριλλικά)](../sr/README.md) | [Σλοβακικά](../sk/README.md) | [Σλοβενικά](../sl/README.md) | [Ισπανικά](../es/README.md) | [Σουαχίλι](../sw/README.md) | [Σουηδικά](../sv/README.md) | [Ταγκάλογκ (Φιλιππινέζικα)](../tl/README.md) | [Ταμίλ](../ta/README.md) | [Τελούγκου](../te/README.md) | [Ταϊλανδικά](../th/README.md) | [Τουρκικά](../tr/README.md) | [Ουκρανικά](../uk/README.md) | [Ουρντού](../ur/README.md) | [Βιετναμέζικα](../vi/README.md)

> **Προτιμάτε να κλωνοποιήσετε τοπικά;**
>
> Αυτό το αποθετήριο περιλαμβάνει 50+ μεταφράσεις γλωσσών οι οποίες αυξάνουν σημαντικά το μέγεθος λήψης. Για να κλωνοποιήσετε χωρίς μεταφράσεις, χρησιμοποιήστε sparse checkout:
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

Το Azure Developer CLI έχει επεκταθεί πέρα από τις παραδοσιακές web εφαρμογές και APIs. Σήμερα, το azd είναι το μοναδικό εργαλείο για την ανάπτυξη οποιασδήποτε εφαρμογής στο Azure — συμπεριλαμβανομένων εφαρμογών με δυνατότητες AI και έξυπνων πρακτόρων.

Τι σημαίνει αυτό για εσάς:

- **Οι πράκτορες AI είναι πλέον πρώτης τάξης φορτία εργασίας του azd.** Μπορείτε να αρχικοποιήσετε, να αναπτύξετε και να διαχειριστείτε έργα πρακτόρων AI χρησιμοποιώντας την ίδια ροή εργασίας `azd init` → `azd up` που ήδη γνωρίζετε.
- **Η ενσωμάτωση με το Microsoft Foundry** φέρνει την ανάπτυξη μοντέλων, τη φιλοξενία πρακτόρων και τη διαμόρφωση υπηρεσιών AI απευθείας στο οικοσύστημα προτύπων azd.
- **Η κύρια ροή εργασίας δεν έχει αλλάξει.** Είτε αναπτύσσετε μια εφαρμογή todo, ένα μικρο-υπηρεσιακό, είτε μια λύση πολλαπλών πρακτόρων AI, οι εντολές είναι οι ίδιες.

Αν έχετε χρησιμοποιήσει το azd πριν, η υποστήριξη AI είναι μια φυσική επέκταση — όχι ένα ξεχωριστό εργαλείο ή ένας προχωρημένος κλάδος. Αν ξεκινάτε από την αρχή, θα μάθετε μια ροή εργασίας που λειτουργεί για τα πάντα.

---

## 🚀 Τι είναι το Azure Developer CLI (azd);

**Azure Developer CLI (azd)** είναι ένα φιλικό προς τον προγραμματιστή εργαλείο γραμμής εντολών που κάνει απλή την ανάπτυξη εφαρμογών στο Azure. Αντί να δημιουργείτε και να συνδέετε χειροκίνητα δεκάδες πόρους Azure, μπορείτε να αναπτύξετε ολόκληρες εφαρμογές με μία εντολή.

### Η Μαγεία του `azd up`

```bash
# Αυτή η εντολή κάνει τα πάντα:
# ✅ Δημιουργεί όλους τους πόρους του Azure
# ✅ Ρυθμίζει το δίκτυο και την ασφάλεια
# ✅ Κατασκευάζει τον κώδικα της εφαρμογής σας
# ✅ Αναπτύσσει στο Azure
# ✅ Σας δίνει μια λειτουργική διεύθυνση URL
azd up
```

**Αυτό ήταν!** Χωρίς κλικ στο Azure Portal, χωρίς πολύπλοκα ARM templates που πρέπει να μάθετε πρώτα, χωρίς χειροκίνητη διαμόρφωση — μόνο εφαρμογές να λειτουργούν στο Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Ποια είναι η Διαφορά;

Αυτή είναι η πιο συνηθισμένη ερώτηση που κάνουν οι αρχάριοι. Να η απλή απάντηση:

| Χαρακτηριστικό | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Σκοπός** | Διαχείριση μεμονωμένων πόρων Azure | Ανάπτυξη ολοκληρωμένων εφαρμογών |
| **Νοοτροπία** | Εστίαση στην υποδομή | Εστίαση στην εφαρμογή |
| **Παράδειγμα** | `az webapp create --name myapp...` | `azd up` |
| **Καμπύλη μάθησης** | Απαιτεί γνώση των υπηρεσιών Azure | Αρκεί να γνωρίζετε την εφαρμογή σας |
| **Καλύτερο για** | DevOps, Υποδομές | Προγραμματιστές, Πρωτοτυποποίηση |

### Απλή Παρομοίωση

- **Azure CLI** είναι σαν να έχετε όλα τα εργαλεία για να χτίσετε ένα σπίτι - σφυριά, πριόνια, καρφιά. Μπορείτε να χτίσετε οτιδήποτε, αλλά πρέπει να γνωρίζετε την κατασκευή.
- **Azure Developer CLI** είναι σαν να προσλαμβάνετε έναν εργολάβο - περιγράφετε τι θέλετε και αυτός αναλαμβάνει την κατασκευή.

### Πότε να Χρησιμοποιήσετε Κάθε Ένα

| Σενάριο | Χρήση |
|----------|----------|
| "Θέλω να αναπτύξω την web εφαρμογή μου γρήγορα" | `azd up` |
| "Χρειάζομαι να δημιουργήσω μόνο έναν storage account" | `az storage account create` |
| "Κατασκευάζω μια πλήρη εφαρμογή AI" | `azd init --template azure-search-openai-demo` |
| "Πρέπει να αποσφαλματώσω έναν συγκεκριμένο πόρο Azure" | `az resource show` |
| "Θέλω ανάπτυξη έτοιμη για παραγωγή σε λίγα λεπτά" | `azd up --environment production` |

### Συνεργάζονται!

Το AZD χρησιμοποιεί το Azure CLI στο παρασκήνιο. Μπορείτε να χρησιμοποιήσετε και τα δύο:
```bash
# Αναπτύξτε την εφαρμογή σας με το AZD
azd up

# Στη συνέχεια, βελτιστοποιήστε συγκεκριμένους πόρους με το Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Βρείτε Πρότυπα στο Awesome AZD

Μην ξεκινάτε από την αρχή! Το **Awesome AZD** είναι η συλλογή της κοινότητας με έτοιμα πρότυπα για ανάπτυξη:

| Πόρος | Περιγραφή |
|----------|-------------|
| 🔗 [**Συλλογή Awesome AZD**](https://azure.github.io/awesome-azd/) | Περιηγηθείτε σε 200+ πρότυπα με ανάπτυξη με ένα κλικ |
| 🔗 [**Υποβάλετε Ένα Πρότυπο**](https://github.com/Azure/awesome-azd/issues) | Συμβάλετε το δικό σας πρότυπο στην κοινότητα |
| 🔗 [**Αποθετήριο GitHub**](https://github.com/Azure/awesome-azd) | Βάλτε αστέρι και εξερευνήστε τον κώδικα |

### Δημοφιλή Πρότυπα AI από το Awesome AZD

```bash
# Συνομιλία RAG με Μοντέλα Microsoft Foundry + Αναζήτηση AI
azd init --template azure-search-openai-demo

# Γρήγορη Εφαρμογή Συνομιλίας AI
azd init --template openai-chat-app-quickstart

# Πράκτορες AI με Πράκτορες Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Ξεκινήστε σε 3 Βήματα

Πριν ξεκινήσετε, βεβαιωθείτε ότι ο υπολογιστής σας είναι έτοιμος για το πρότυπο που θέλετε να αναπτύξετε:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Αν οποιαδήποτε απαιτούμενος έλεγχος αποτύχει, διορθώστε το πρώτα και στη συνέχεια συνεχίστε με την γρήγορη εκκίνηση.

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

### Βήμα 2: Πιστοποίηση για το AZD

```bash
# Προαιρετικό εάν σκοπεύετε να χρησιμοποιήσετε εντολές Azure CLI απευθείας σε αυτό το μάθημα
az login

# Απαραίτητο για ροές εργασίας AZD
azd auth login
```

Αν δεν είστε σίγουροι ποιο από αυτά χρειάζεστε, ακολουθήστε την πλήρη ροή ρύθμισης στην ενότητα [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Βήμα 3: Αναπτύξτε την Πρώτη σας Εφαρμογή

```bash
# Αρχικοποίηση από ένα πρότυπο
azd init --template todo-nodejs-mongo

# Ανάπτυξη στο Azure (δημιουργεί τα πάντα!)
azd up
```

**🎉 Αυτό ήταν!** Η εφαρμογή σας είναι πλέον ζωντανή στο Azure.

### Καθαρισμός (Μην το Ξεχάσετε!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Πώς να Χρησιμοποιήσετε Αυτό το Μάθημα

Αυτό το μάθημα είναι σχεδιασμένο για **προοδευτική μάθηση** - ξεκινήστε εκεί που νιώθετε άνετα και προχωρήστε σταδιακά:

| Η Εμπειρία Σας | Ξεκινήστε Εδώ |
|-----------------|------------|
| **Τελείως νέος στο Azure** | [Κεφάλαιο 1: Βάσεις](#-chapter-1-foundation--quick-start) |
| **Γνωρίζετε το Azure, νέο στο AZD** | [Κεφάλαιο 1: Βάσεις](#-chapter-1-foundation--quick-start) |
| **Θέλετε να αναπτύξετε εφαρμογές AI** | [Κεφάλαιο 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Θέλετε πρακτική εξάσκηση** | [🎓 Διαδραστικό Εργαστήριο](workshop/README.md) - 3-4 ώρες καθοδηγούμενο εργαστήριο |
| **Χρειάζεστε πρότυπα παραγωγής** | [Κεφάλαιο 8: Παραγωγή & Επιχειρησιακά](#-chapter-8-production--enterprise-patterns) |

### Γρήγορη Ρύθμιση

1. **Δημιουργήστε Fork αυτού του Αποθετηρίου**: [![Διακλαδώσεις GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Κλωνοποιήστε το**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Λάβετε Βοήθεια**: [Κοινότητα Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Προτιμάτε να κλωνοποιήσετε τοπικά;**
>
> Αυτό το αποθετήριο περιλαμβάνει 50+ μεταφράσεις γλωσσών οι οποίες αυξάνουν σημαντικά το μέγεθος λήψης. Για να κλωνοποιήσετε χωρίς μεταφράσεις, χρησιμοποιήστε sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Αυτό σας δίνει όλα όσα χρειάζεστε για να ολοκληρώσετε το μάθημα με πολύ πιο γρήγορη λήψη.


## Επισκόπηση Μαθήματος

Κατακτήστε το Azure Developer CLI (azd) μέσω δομημένων κεφαλαίων σχεδιασμένων για προοδευτική μάθηση. **Ειδική εστίαση στην ανάπτυξη εφαρμογών AI με ενσωμάτωση Microsoft Foundry.**

### Γιατί αυτό το μάθημα είναι ουσιαστικό για τους σύγχρονους προγραμματιστές

Με βάση πληροφορίες από την κοινότητα Microsoft Foundry Discord, **το 45% των προγραμματιστών θέλει να χρησιμοποιήσει το AZD για φορτία εργασίας AI** αλλά συναντούν προκλήσεις με:
- Πολύπλοκες αρχιτεκτονικές AI με πολλαπλές υπηρεσίες
- Βέλτιστες πρακτικές για ανάπτυξη AI σε παραγωγή  
- Ενσωμάτωση και διαμόρφωση υπηρεσιών Azure AI
- Βελτιστοποίηση κόστους για φορτία εργασίας AI
- Επίλυση προβλημάτων ανάπτυξης ειδικών για AI

### Στόχοι Μάθησης

Ολοκληρώνοντας αυτό το δομημένο μάθημα, θα:
- **Κατακτήσετε τα Βασικά του AZD**: Κύριες έννοιες, εγκατάσταση και διαμόρφωση
- **Αναπτύξετε Εφαρμογές AI**: Χρησιμοποιήστε το AZD με υπηρεσίες Microsoft Foundry
- **Εφαρμόσετε Υποδομή ως Κώδικα**: Διαχειριστείτε πόρους Azure με πρότυπα Bicep
- **Αντιμετωπίσετε Προβλήματα Αναπτύξεων**: Επίλυση κοινών ζητημάτων και αποσφαλμάτωση
- **Βελτιστοποιήσετε για Παραγωγή**: Ασφάλεια, κλιμάκωση, παρακολούθηση και διαχείριση κόστους
- **Κατασκευάσετε Λύσεις Πολλαπλών Πρακτόρων**: Αναπτύξτε σύνθετες αρχιτεκτονικές AI

## Πριν Ξεκινήσετε: Λογαριασμοί, Πρόσβαση και Υποθέσεις

Πριν αρχίσετε το Κεφάλαιο 1, βεβαιωθείτε ότι έχετε τα παρακάτω στη θέση τους. Τα βήματα εγκατάστασης αργότερα σε αυτόν τον οδηγό υποθέτουν ότι αυτές οι βασικές ρυθμίσεις έχουν ήδη γίνει.
- **Μια συνδρομή Azure**: Μπορείτε να χρησιμοποιήσετε μια υπάρχουσα συνδρομή από την εργασία ή τον προσωπικό σας λογαριασμό, ή να δημιουργήσετε μια [δοκιμή δωρεάν](https://aka.ms/azurefreetrial) για να ξεκινήσετε.
- **Άδεια για δημιουργία πόρων Azure**: Για τις περισσότερες ασκήσεις, θα πρέπει να έχετε τουλάχιστον πρόσβαση **Contributor** στη στοχευόμενη συνδρομή ή ομάδα πόρων. Ορισμένα κεφάλαια μπορεί επίσης να υποθέτουν ότι μπορείτε να δημιουργήσετε ομάδες πόρων, managed identities και RBAC αναθέσεις.
- [**Ένας λογαριασμός GitHub**](https://github.com): Αυτό είναι χρήσιμο για το fork του αποθετηρίου, την παρακολούθηση των δικών σας αλλαγών και τη χρήση του GitHub Codespaces για το εργαστήριο.
- **Προαπαιτούμενα χρόνου εκτέλεσης προτύπων**: Ορισμένα πρότυπα χρειάζονται τοπικά εργαλεία όπως Node.js, Python, Java ή Docker. Εκτελέστε τον validator ρύθμισης πριν ξεκινήσετε ώστε να εντοπίσετε νωρίς τυχόν ελλείποντα εργαλεία.
- **Βασική εξοικείωση με το τερματικό**: Δεν χρειάζεται να είστε ειδικός, αλλά πρέπει να αισθάνεστε άνετα εκτελώντας εντολές όπως `git clone`, `azd auth login`, και `azd up`.

> **Δουλεύετε σε εταιρική συνδρομή;**
> Εάν το περιβάλλον Azure σας διαχειρίζεται από έναν διαχειριστή, επιβεβαιώστε εκ των προτέρων ότι μπορείτε να αναπτύσσετε πόρους στη συνδρομή ή την ομάδα πόρων που σκοπεύετε να χρησιμοποιήσετε. Εάν όχι, ζητήστε μια sandbox συνδρομή ή πρόσβαση Contributor πριν ξεκινήσετε.

> **Νέος στο Azure;**
> Ξεκινήστε με τη δική σας δοκιμή Azure ή συνδρομή pay-as-you-go στο https://aka.ms/azurefreetrial ώστε να μπορείτε να ολοκληρώσετε τις ασκήσεις από άκρη σε άκρη χωρίς να περιμένετε εγκρίσεις επιπέδου tenant.

## 🗺️ Χάρτης Μαθήματος: Γρήγορη Πλοήγηση ανά Κεφάλαιο

Each chapter has a dedicated README with learning objectives, quick starts, and exercises:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Κεφ. 1: Θεμέλια](docs/chapter-01-foundation/README.md)** | Εισαγωγή | [Βασικά AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Εγκατάσταση](docs/chapter-01-foundation/installation.md) &#124; [Πρώτο Έργο](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Κεφ. 2: Ανάπτυξη AI](docs/chapter-02-ai-development/README.md)** | Εφαρμογές AI-First | [Ενσωμάτωση Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Ανάπτυξη Μοντέλου](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Εργαστήριο](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Κεφ. 3: Διαμόρφωση](docs/chapter-03-configuration/README.md)** | Auth & Security | [Διαμόρφωση](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Κεφ. 4: Υποδομή](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Οδηγός Ανάπτυξης](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Κεφ. 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Σενάριο Λιανικής](examples/retail-scenario.md) &#124; [Συντονιστικά Μοτίβα](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Κεφ. 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Σχεδιασμός & Επαλήθευση | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Επιλογή SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Κεφ. 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Συνηθισμένα Προβλήματα](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Προβλήματα AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Κεφ. 8: Παραγωγή](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Πρακτικές Παραγωγής](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Εισαγωγή](workshop/docs/instructions/0-Introduction.md) &#124; [Επιλογή](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Επικύρωση](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Αποδόμηση](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Διαμόρφωση](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Προσαρμογή](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Κατάργηση Υποδομής](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Επίλογος](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Συνολική Διάρκεια Μαθήματος:** ~10-14 hours | **Εξέλιξη Δεξιοτήτων:** Beginner → Production-Ready

---

## 📚 Κεφάλαια Μάθησης

*Επιλέξτε τη διαδρομή μάθησης με βάση το επίπεδο εμπειρίας και τους στόχους σας*

### 🚀 Κεφ. 1: Θεμέλια & Γρήγορη Εκκίνηση
**Προαπαιτούμενα**: συνδρομή Azure, βασικές γνώσεις γραμμής εντολών  
**Διάρκεια**: 30-45 λεπτά  
**Πολυπλοκότητα**: ⭐

#### Τι θα μάθετε
- Κατανόηση των θεμελιωδών του Azure Developer CLI
- Εγκατάσταση του AZD στην πλατφόρμα σας
- Η πρώτη σας επιτυχής ανάπτυξη

#### Πόροι Μάθησης
- **🎯 Ξεκινήστε Εδώ**: [Τι είναι το Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Θεωρία**: [Βασικά AZD](docs/chapter-01-foundation/azd-basics.md) - Βασικές έννοιες και ορολογία
- **⚙️ Ρύθμιση**: [Εγκατάσταση & Ρύθμιση](docs/chapter-01-foundation/installation.md) - Οδηγοί ανά πλατφόρμα
- **🛠️ Πρακτική**: [Πρώτο Έργο](docs/chapter-01-foundation/first-project.md) - Βήμα προς βήμα tutorial
- **📋 Γρήγορη Αναφορά**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Πρακτικές Ασκήσεις
```bash
# Γρήγορος έλεγχος εγκατάστασης
azd version

# Αναπτύξτε την πρώτη σας εφαρμογή
azd init --template todo-nodejs-mongo
azd up
```

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε επιτυχώς μια απλή web εφαρμογή στο Azure χρησιμοποιώντας το AZD

**✅ Επιβεβαίωση Επιτυχίας:**
```bash
# Μετά την ολοκλήρωση του Κεφαλαίου 1, θα πρέπει να μπορείτε να:
azd version              # Εμφανίζει την εγκατεστημένη έκδοση
azd init --template todo-nodejs-mongo  # Αρχικοποιεί το έργο
azd up                  # Αναπτύσσει στο Azure
azd show                # Εμφανίζει το URL της εκτελούμενης εφαρμογής
# Η εφαρμογή ανοίγει στο πρόγραμμα περιήγησης και λειτουργεί
azd down --force --purge  # Καθαρίζει τους πόρους
```

**📊 Χρόνος Επένδυσης:** 30-45 λεπτά  
**📈 Επίπεδο Δεξιοτήτων μετά:** Μπορεί να αναπτύσσει βασικές εφαρμογές ανεξάρτητα
**📈 Επίπεδο Δεξιοτήτων μετά:** Μπορεί να αναπτύσσει βασικές εφαρμογές ανεξάρτητα

---

### 🤖 Κεφ. 2: Ανάπτυξη AI-First (Συνιστάται για προγραμματιστές AI)
**Προαπαιτούμενα**: Ολοκληρωμένο Κεφ. 1  
**Διάρκεια**: 1-2 ώρες  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα μάθετε
- Ενσωμάτωση Microsoft Foundry με το AZD
- Ανάπτυξη εφαρμογών με δυνατότητα AI
- Κατανόηση των ρυθμίσεων υπηρεσιών AI

#### Πόροι Μάθησης
- **🎯 Ξεκινήστε Εδώ**: [Ενσωμάτωση Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [Οδηγός AI Agents](docs/chapter-02-ai-development/agents.md) - Αναπτύξτε έξυπνους πράκτορες με το AZD
- **📖 Μοτίβα**: [Ανάπτυξη Μοντέλου AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Ανάπτυξη και διαχείριση μοντέλων AI
- **🛠️ Εργαστήριο**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Προετοιμάστε τις λύσεις AI σας για AZD
- **🎥 Διαδραστικός Οδηγός**: [Workshop Materials](workshop/README.md) - Μάθηση μέσω προγράμματος περιήγησης με MkDocs * DevContainer Environment
- **📋 Πρότυπα**: [Microsoft Foundry Templates](#πόροι-εργαστηρίου)
- **📝 Παραδείγματα**: [Παραδείγματα Ανάπτυξης AZD](examples/README.md)

#### Πρακτικές Ασκήσεις
```bash
# Αναπτύξτε την πρώτη σας εφαρμογή τεχνητής νοημοσύνης
azd init --template azure-search-openai-demo
azd up

# Δοκιμάστε επιπλέον πρότυπα τεχνητής νοημοσύνης
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε και διαμορφώστε μια εφαρμογή συνομιλίας με δυνατότητες RAG

**✅ Επιβεβαίωση Επιτυχίας:**
```bash
# Μετά το Κεφάλαιο 2, θα πρέπει να μπορείτε να:
azd init --template azure-search-openai-demo
azd up
# Να δοκιμάσετε τη διεπαφή συνομιλίας με AI
# Να κάνετε ερωτήσεις και να λαμβάνετε απαντήσεις υποβοηθούμενες από AI με πηγές
# Να επαληθεύσετε ότι η ενσωμάτωση αναζήτησης λειτουργεί
azd monitor  # Να ελέγξετε ότι το Application Insights εμφανίζει τηλεμετρία
azd down --force --purge
```

**📊 Χρόνος Επένδυσης:** 1-2 ώρες  
**📈 Επίπεδο Δεξιοτήτων μετά:** Μπορεί να αναπτύσσει και να διαμορφώνει εφαρμογές AI έτοιμες για παραγωγή  
**💰 Ενημέρωση για το Κόστος:** Κατανοήστε κόστη ανάπτυξης $80-150/μήνα, κόστη παραγωγής $300-3500/μήνα

#### 💰 Παράγοντες Κόστους για Αναπτύξεις AI

**Περιβάλλον Ανάπτυξης (Εκτιμώμενο $80-150/μήνα):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/μήνα (ανάλογα με τη χρήση tokens)
- AI Search (βασικό επίπεδο): $75/μήνα
- Container Apps (Consumption): $0-20/μήνα
- Storage (Standard): $1-5/μήνα

**Περιβάλλον Παραγωγής (Εκτιμώμενο $300-3,500+/μήνα):**
- Microsoft Foundry Models (PTU για συνεπή απόδοση): $3,000+/μήνα Ή Pay-as-go με μεγάλο όγκο
- AI Search (Standard tier): $250/μήνα
- Container Apps (Dedicated): $50-100/μήνα
- Application Insights: $5-50/μήνα
- Storage (Premium): $10-50/μήνα

**💡 Συμβουλές Βελτιστοποίησης Κόστους:**
- Χρησιμοποιήστε **Free Tier** Microsoft Foundry Models για εκμάθηση (Azure OpenAI 50,000 tokens/μήνα συμπεριλαμβάνονται)
- Εκτελέστε `azd down` για να αποεκαταστήσετε πόρους όταν δεν αναπτύσσετε ενεργά
- Ξεκινήστε με χρέωση κατανάλωσης, αναβαθμίστε σε PTU μόνο για παραγωγή
- Χρησιμοποιήστε `azd provision --preview` για να εκτιμήσετε κόστη πριν την ανάπτυξη
- Ενεργοποιήστε auto-scaling: πληρώνετε μόνο για την πραγματική χρήση

**Παρακολούθηση Κόστους:**
```bash
# Ελέγξτε τις εκτιμώμενες μηνιαίες χρεώσεις
azd provision --preview

# Παρακολουθήστε τα πραγματικά κόστη στην Πύλη Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Κεφ. 3: Διαμόρφωση & Πιστοποίηση
**Προαπαιτούμενα**: Ολοκληρωμένο Κεφ. 1  
**Διάρκεια**: 45-60 λεπτά  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα μάθετε
- Διαμόρφωση και διαχείριση περιβάλλοντος
- Έλεγχος ταυτότητας και βέλτιστες πρακτικές ασφάλειας
- Ονομασία και οργάνωση πόρων

#### Πόροι Μάθησης
- **📖 Διαμόρφωση**: [Οδηγός Διαμόρφωσης](docs/chapter-03-configuration/configuration.md) - Ρύθμιση περιβάλλοντος
- **🔐 Ασφάλεια**: [Σχήματα ελέγχου ταυτότητας και managed identity](docs/chapter-03-configuration/authsecurity.md) - Σχήματα ελέγχου ταυτότητας
- **📝 Παραδείγματα**: [Παράδειγμα Database App](examples/database-app/README.md) - Παραδείγματα AZD Database

#### Πρακτικές Ασκήσεις
- Διαμορφώστε πολλαπλά περιβάλλοντα (dev, staging, prod)
- Ρυθμίστε πιστοποίηση μέσω managed identity
- Εφαρμόστε ρυθμίσεις ειδικές για κάθε περιβάλλον

**💡 Αποτέλεσμα Κεφαλαίου**: Διαχειριστείτε πολλαπλά περιβάλλοντα με κατάλληλη πιστοποίηση και ασφάλεια

---

### 🏗️ Κεφ. 4: Υποδομή ως Κώδικας & Ανάπτυξη
**Προαπαιτούμενα**: Ολοκληρωμένα Κεφ. 1-3  
**Διάρκεια**: 1-1.5 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐

#### Τι θα μάθετε
- Προχωρημένα μοτίβα ανάπτυξης
- Υποδομή ως Κώδικας με Bicep
- Στρατηγικές παροχής πόρων

#### Πόροι Μάθησης
- **📖 Ανάπτυξη**: [Οδηγός Ανάπτυξης](docs/chapter-04-infrastructure/deployment-guide.md) - Πλήρη workflows
- **🏗️ Provisioning**: [Προμήθεια Πόρων](docs/chapter-04-infrastructure/provisioning.md) - Διαχείριση πόρων Azure
- **📝 Παραδείγματα**: [Παράδειγμα Container App](../../examples/container-app) - Αναπτύξεις με containers

#### Πρακτικές Ασκήσεις
- Δημιουργήστε προσαρμοσμένα πρότυπα Bicep
- Αναπτύξτε εφαρμογές πολλαπλών υπηρεσιών
- Εφαρμόστε στρατηγικές blue-green deployment

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε σύνθετες εφαρμογές πολλαπλών υπηρεσιών χρησιμοποιώντας προσαρμοσμένα πρότυπα υποδομής

---

### 🎯 Κεφ. 5: Λύσεις Multi-Agent AI (Προχωρημένο)
**Προαπαιτούμενα**: Ολοκληρωμένα Κεφ. 1-2  
**Διάρκεια**: 2-3 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐⭐

#### Τι θα μάθετε
- Μοτίβα αρχιτεκτονικής για πολυπρακτορικά συστήματα
- Ορχήστρωση και συντονισμός πρακτόρων
- Αναπτύξεις AI έτοιμες για παραγωγή

#### Πόροι Μάθησης
- **🤖 Επιλεγμένο Έργο**: [Λύση Multi-Agent για Λιανική](examples/retail-scenario.md) - Πλήρης υλοποίηση
- **🛠️ ARM Templates**: [Πακέτο ARM Templates](../../examples/retail-multiagent-arm-template) - One-click ανάπτυξη
- **📖 Αρχιτεκτονική**: [Μοτίβα συντονισμού πολυπρακτόρων](docs/chapter-06-pre-deployment/coordination-patterns.md) - Μοτίβα

#### Πρακτικές Ασκήσεις
```bash
# Αναπτύξτε την πλήρη λύση πολλαπλών πρακτόρων για το λιανεμπόριο
cd examples/retail-multiagent-arm-template
./deploy.sh

# Εξερευνήστε τις διαμορφώσεις των πρακτόρων
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε και διαχειριστείτε μια λύση multi-agent AI έτοιμη για παραγωγή με πράκτορες Customer και Inventory

---

### 🔍 Κεφ. 6: Επαλήθευση & Σχεδιασμός πριν την Ανάπτυξη
**Προαπαιτούμενα**: Ολοκληρωμένο Κεφ. 4  
**Διάρκεια**: 1 ώρα  
**Πολυπλοκότητα**: ⭐⭐
#### Τι θα Μάθετε
- Σχεδιασμός χωρητικότητας και επαλήθευση πόρων
- Στρατηγικές επιλογής SKU
- Έλεγχοι προ-εκτέλεσης και αυτοματοποίηση

#### Πόροι Μάθησης
- **📊 Σχεδιασμός**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Επαλήθευση πόρων
- **💰 Επιλογή**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Οικονομικά αποδοτικές επιλογές
- **✅ Επαλήθευση**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Αυτοματοποιημένα σενάρια

#### Πρακτικές Ασκήσεις
- Εκτελέστε σενάρια επαλήθευσης χωρητικότητας
- Βελτιστοποιήστε τις επιλογές SKU για κόστος
- Υλοποιήστε αυτοματοποιημένους ελέγχους πριν την ανάπτυξη

**💡 Αποτέλεσμα Κεφαλαίου**: Επαληθεύστε και βελτιστοποιήστε τις αναπτύξεις πριν την εκτέλεση

---

### 🚨 Κεφάλαιο 7: Επίλυση Προβλημάτων & Αποσφαλμάτωση
**Προαπαιτούμενα**: Οποιοδήποτε κεφάλαιο ανάπτυξης ολοκληρωμένο  
**Διάρκεια**: 1-1.5 ώρες  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα Μάθετε
- Συστηματικές προσεγγίσεις αποσφαλμάτωσης
- Συνήθη προβλήματα και λύσεις
- Επίλυση προβλημάτων ειδικά για AI

#### Πόροι Μάθησης
- **🔧 Συνηθισμένα Προβλήματα**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - Συχνές ερωτήσεις και λύσεις
- **🕵️ Αποσφαλμάτωση**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Στρατηγικές βήμα-βήμα
- **🤖 Θέματα AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Προβλήματα υπηρεσιών AI

#### Πρακτικές Ασκήσεις
- Διαγνώστε αποτυχίες ανάπτυξης
- Επίλυση ζητημάτων πιστοποίησης
- Αποσφαλμάτωση συνδεσιμότητας υπηρεσιών AI

**💡 Αποτέλεσμα Κεφαλαίου**: Διάγνωση και επίλυση κοινών προβλημάτων ανάπτυξης ανεξάρτητα

---

### 🏢 Κεφάλαιο 8: Παραγωγή & Επιχειρησιακά Πρότυπα
**Προαπαιτούμενα**: Κεφάλαια 1-4 ολοκληρωμένα  
**Διάρκεια**: 2-3 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐⭐

#### Τι θα Μάθετε
- Στρατηγικές ανάπτυξης σε παραγωγή
- Επιχειρησιακά πρότυπα ασφάλειας
- Παρακολούθηση και βελτιστοποίηση κόστους

#### Πόροι Μάθησης
- **🏭 Παραγωγή**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Επιχειρησιακά πρότυπα
- **📝 Παραδείγματα**: [Microservices Example](../../examples/microservices) - Σύνθετες αρχιτεκτονικές
- **📊 Παρακολούθηση**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Παρακολούθηση

#### Πρακτικές Ασκήσεις
- Υλοποιήστε επιχειρησιακά πρότυπα ασφάλειας
- Ρυθμίστε ολοκληρωμένη παρακολούθηση
- Αναπτύξτε σε παραγωγή με σωστή διακυβέρνηση

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε εφαρμογές έτοιμες για επιχείρηση με πλήρεις δυνατότητες παραγωγής

---

## 🎓 Επισκόπηση Εργαστηρίου: Πρακτική Εμπειρία Μάθησης

> **⚠️ ΚΑΤΑΣΤΑΣΗ ΕΡΓΑΣΤΗΡΙΟΥ: Σε Ενεργή Ανάπτυξη**  
> Το υλικό του εργαστηρίου βρίσκεται υπό ανάπτυξη και βελτίωση. Οι βασικές ενότητες λειτουργούν, αλλά ορισμένα προχωρημένα τμήματα είναι ατελή. Εργαζόμαστε ενεργά για να ολοκληρώσουμε όλο το περιεχόμενο. [Track progress →](workshop/README.md)

### Διαδραστικά Υλικά Εργαστηρίου
**Περιεκτική, πρακτική εμπειρία μάθησης με εργαλεία βασισμένα σε περιηγητή και καθοδηγούμενες ασκήσεις**

Τα υλικά του εργαστηρίου παρέχουν μια δομημένη, διαδραστική εμπειρία μάθησης που συμπληρώνει το κεφαλαιοποιημένο πρόγραμμα σπουδών παραπάνω. Το εργαστήριο είναι σχεδιασμένο τόσο για αυτορυθμιζόμενη μάθηση όσο και για συνεδρίες υπό καθοδήγηση.

#### 🛠️ Χαρακτηριστικά Εργαστηρίου
- **Διεπαφή Βασισμένη σε Περιηγητή**: Πλήρες εργαστήριο με MkDocs με αναζήτηση, αντιγραφή και λειτουργίες θέματος
- **Ενσωμάτωση GitHub Codespaces**: Ένα κλικ για ρύθμιση περιβάλλοντος ανάπτυξης
- **Δομημένη Διαδρομή Μάθησης**: 8-μονάδων καθοδηγούμενες ασκήσεις (3-4 ώρες συνολικά)
- **Προοδευτική Μεθοδολογία**: Εισαγωγή → Επιλογή → Επαλήθευση → Αποδόμηση → Διαμόρφωση → Προσαρμογή → Καθαρισμός → Συνοψή
- **Διαδραστικό Περιβάλλον DevContainer**: Προ-διαμορφωμένα εργαλεία και εξαρτήσεις

#### 📚 Δομή Μονάδων Εργαστηρίου
Το εργαστήριο ακολουθεί μια προοδευτική μεθοδολογία 8 μονάδων που σας οδηγεί από την ανακάλυψη μέχρι την κυριαρχία στην ανάπτυξη:

| Ενότητα | Θέμα | Τι θα κάνετε | Διάρκεια |
|--------|-------|----------------|----------|
| **0. Introduction** | Επισκόπηση Εργαστηρίου | Κατανοήστε τους στόχους μάθησης, τα προαπαιτούμενα και τη δομή του εργαστηρίου | 15 λεπτά |
| **1. Selection** | Εύρεση Προτύπων | Εξερευνήστε πρότυπα AZD και επιλέξτε το κατάλληλο AI πρότυπο για το σενάριό σας | 20 λεπτά |
| **2. Validation** | Ανάπτυξη & Επαλήθευση | Αναπτύξτε το πρότυπο με `azd up` και επαληθεύστε ότι η υποδομή λειτουργεί | 30 λεπτά |
| **3. Deconstruction** | Κατανόηση Δομής | Χρησιμοποιήστε GitHub Copilot για να εξερευνήσετε την αρχιτεκτονική του προτύπου, αρχεία Bicep και οργάνωση κώδικα | 30 λεπτά |
| **4. Configuration** | Εμβάθυνση στο azure.yaml | Εξοικειωθείτε με τη ρύθμιση `azure.yaml`, hooks κύκλου ζωής και μεταβλητές περιβάλλοντος | 30 λεπτά |
| **5. Customization** | Κάντε το δικό σας | Ενεργοποιήστε AI Search, tracing, evaluation, και προσαρμόστε για το σενάριό σας | 45 λεπτά |
| **6. Teardown** | Καθαρισμός | Απενεργοποιήστε με ασφάλεια πόρους με `azd down --purge` | 15 λεπτά |
| **7. Wrap-up** | Επόμενα Βήματα | Ανασκόπηση επιτευγμάτων, βασικών εννοιών, και συνέχιση της μαθησιακής σας πορείας | 15 λεπτά |

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
# Κάντε κλικ στο "Κώδικας" → "Δημιουργία codespace στο main" στο αποθετήριο

# Επιλογή 2: Τοπική ανάπτυξη
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Ακολουθήστε τις οδηγίες εγκατάστασης στο workshop/README.md
```

#### 🎯 Στόχοι Μάθησης Εργαστηρίου
Ολοκληρώνοντας το εργαστήριο, οι συμμετέχοντες θα:
- **Αναπτύξουν Εφαρμογές AI Παραγωγής**: Χρησιμοποιήστε AZD με Microsoft Foundry υπηρεσίες
- **Κατακτήσουν Αρχιτεκτονικές Πολυ-Πρακτόρων**: Υλοποιήστε συντονισμένες λύσεις με AI πράκτορες
- **Υλοποιήσουν Βέλτιστες Πρακτικές Ασφάλειας**: Ρυθμίστε πιστοποίηση και έλεγχο πρόσβασης
- **Βελτιστοποιήσουν για Κλίμακα**: Σχεδιάστε οικονομικά αποδοτικές, αποδοτικές αναπτύξεις
- **Επιλύσουν Προβλήματα Ανάπτυξης**: Διευθετήσουν κοινά ζητήματα ανεξάρτητα

#### 📖 Πόροι Εργαστηρίου
- **🎥 Διαδραστικός Οδηγός**: [Workshop Materials](workshop/README.md) - Περιβάλλον μάθησης βασισμένο σε περιηγητή
- **📋 Οδηγίες Μονάδα-προς-Μονάδα**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Επισκόπηση εργαστηρίου και στόχοι
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Βρείτε και επιλέξτε AI πρότυπα
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Αναπτύξτε και επαληθεύστε πρότυπα
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Εξερευνήστε την αρχιτεκτονική προτύπου
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Εξοικειωθείτε με το azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Προσαρμόστε για το σενάριό σας
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Καθαρισμός πόρων
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Ανασκόπηση και επόμενα βήματα
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ασκήσεις με έμφαση στο AI
- **💡 Γρήγορη Εκκίνηση**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ρύθμιση περιβάλλοντος

**Ιδανικό για**: Εταιρική εκπαίδευση, πανεπιστημιακά μαθήματα, αυτορυθμιζόμενη μάθηση και bootcamps προγραμματιστών.

---

## 📖 Εμβάθυνση: Δυνατότητες AZD

Πέρα από τα βασικά, το AZD παρέχει ισχυρές λειτουργίες για αναπτύξεις παραγωγής:

- **Αναπτύξεις με βάση πρότυπα** - Χρησιμοποιήστε προκατασκευασμένα πρότυπα για κοινά πρότυπα εφαρμογών
- **Υποδομή ως Κώδικας** - Διαχειριστείτε πόρους Azure χρησιμοποιώντας Bicep ή Terraform  
- **Ενοποιημένες ροές εργασίας** - Προμηθεύστε, αναπτύξτε και παρακολουθήστε εφαρμογές αδιατάραχτα
- **Φιλικό προς τον Προγραμματιστή** - Βελτιστοποιημένο για παραγωγικότητα και εμπειρία προγραμματιστή

### **AZD + Microsoft Foundry: Ιδανικό για Αναπτύξεις AI**

**Γιατί AZD για λύσεις AI;** Το AZD αντιμετωπίζει τις κορυφαίες προκλήσεις που αντιμετωπίζουν οι προγραμματιστές AI:

- **Πρότυπα Έτοιμα για AI** - Προ-διαμορφωμένα πρότυπα για Microsoft Foundry Models, Cognitive Services και ML workloads
- **Ασφαλείς Αναπτύξεις AI** - Ενσωματωμένα πρότυπα ασφάλειας για υπηρεσίες AI, API keys, και endpoints μοντέλων  
- **Πρότυπα Παραγωγής για AI** - Βέλτιστες πρακτικές για κλιμακώσιμες, οικονομικά αποδοτικές αναπτύξεις εφαρμογών AI
- **Ολοκληρωμένες Ροές Εργασίας AI** - Από την ανάπτυξη μοντέλου έως την παραγωγή με σωστή παρακολούθηση
- **Βελτιστοποίηση Κόστους** - Έξυπνη κατανομή πόρων και στρατηγικές κλιμάκωσης για workloads AI
- **Ενσωμάτωση με Microsoft Foundry** - Αδιάλειπτη σύνδεση με τον κατάλογο μοντέλων και τα endpoints του Microsoft Foundry

---

## 🎯 Βιβλιοθήκη Προτύπων & Παραδειγμάτων

### Επιλεγμένα: Πρότυπα Microsoft Foundry
**Ξεκινήστε εδώ αν αναπτύσσετε εφαρμογές AI!**

> **Σημείωση:** Αυτά τα πρότυπα δείχνουν διάφορα πρότυπα AI. Κάποια είναι εξωτερικά Azure Samples, άλλα είναι τοπικές υλοποιήσεις.

| Πρότυπο | Κεφάλαιο | Πολυπλοκότητα | Υπηρεσίες | Τύπος |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Κεφάλαιο 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Εξωτερικό |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Κεφάλαιο 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Εξωτερικό |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Κεφάλαιο 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Εξωτερικό |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Κεφάλαιο 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Εξωτερικό |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Κεφάλαιο 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Εξωτερικό |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Κεφάλαιο 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Εξωτερικό |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Κεφάλαιο 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Τοπικό** |

### Επιλεγμένα: Πλήρη Σενάρια Μάθησης
**Πρότυπα παραγωγής χαμηλής εισόδου αντιστοιχισμένα με κεφάλαια μάθησης**

| Πρότυπο | Κεφάλαιο Μάθησης | Πολυπλοκότητα | Κύρια Μαθήματα |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Κεφάλαιο 2 | ⭐ | Βασικά πρότυπα ανάπτυξης AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Κεφάλαιο 2 | ⭐⭐ | Υλοποίηση RAG με Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Κεφάλαιο 4 | ⭐⭐ | Ενσωμάτωση Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Κεφάλαιο 5 | ⭐⭐⭐ | Πλαίσιο πρακτόρων και function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Κεφάλαιο 8 | ⭐⭐⭐ | Ορχήστρωση Enterprise AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Κεφάλαιο 5 | ⭐⭐⭐⭐ | Αρχιτεκτονική πολυ-πρακτόρων με πράκτορες Πελατών και Αποθεμάτων |

### Μάθηση με Παραδείγματα ανά Τύπο

> **📌 Τοπικά vs. Εξωτερικά Παραδείγματα:**  
> **Τοπικά Παραδείγματα** (σε αυτό το repo) = Έτοιμα για άμεση χρήση  
> **Εξωτερικά Παραδείγματα** (Azure Samples) = Κλωνοποιήστε από τα συνδεδεμένα αποθετήρια

#### Τοπικά Παραδείγματα (Έτοιμα προς Χρήση)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Πλήρης υλοποίηση έτοιμη για παραγωγή με ARM templates
  - Αρχιτεκτονική πολυ-πρακτόρων (Πράκτορας Πελάτη + Πράκτορας Αποθέματος)
  - Ολοκληρωμένη παρακολούθηση και αξιολόγηση
  - Μία εντολή ανάπτυξης μέσω ARM template

#### Τοπικά Παραδείγματα - Εφαρμογές Container (Κεφάλαια 2-5)
**Πλήρη παραδείγματα ανάπτυξης container σε αυτό το αποθετήριο:**
- [**Container App Examples**](examples/container-app/README.md) - Πλήρης οδηγός για containerized αναπτύξεις
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Βασικό REST API με scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Παραγωγής multi-service ανάπτυξη
  - Quick Start, Production, and Advanced deployment patterns
  - Οδηγίες για παρακολούθηση, ασφάλεια και βελτιστοποίηση κόστους

#### Εξωτερικά Παραδείγματα - Απλές Εφαρμογές (Κεφάλαια 1-2)
**Κλωνοποιήστε αυτά τα αποθετήρια Azure Samples για να ξεκινήσετε:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Βασικά πρότυπα ανάπτυξης
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Ανάπτυξη στατικού περιεχομένου
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Ανάπτυξη REST API

#### Εξωτερικά Παραδείγματα - Ενσωμάτωση Βάσης Δεδομένων (Κεφάλαιο 3-4)
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Πρότυπα συνδεσιμότητας βάσεων δεδομένων
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Ροή εργασίας δεδομένων χωρίς διακομιστή

#### Εξωτερικά Παραδείγματα - Προηγμένα Πρότυπα (Κεφάλαια 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Αρχιτεκτονικές πολλαπλών υπηρεσιών
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Επεξεργασία στο παρασκήνιο  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Πρότυπα ML έτοιμα για παραγωγή

### Εξωτερικές Συλλογές Προτύπων
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Επιμελημένη συλλογή επίσημων και κοινοτικών προτύπων
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Τεκμηρίωση προτύπων Microsoft Learn
- [**Examples Directory**](examples/README.md) - Τοπικά παραδείγματα εκμάθησης με λεπτομερείς επεξηγήσεις

---

## 📚 Πόροι Μάθησης & Αναφορές

### Γρήγορες Αναφορές
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Βασικές εντολές azd οργανωμένες κατά κεφάλαιο
- [**Glossary**](resources/glossary.md) - Ορολογία Azure και azd  
- [**FAQ**](resources/faq.md) - Συχνές ερωτήσεις οργανωμένες ανά κεφάλαιο μάθησης
- [**Study Guide**](resources/study-guide.md) - Ολοκληρωμένες ασκήσεις πρακτικής

### Πρακτικά Εργαστήρια
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Κάντε τις λύσεις AI σας κατάλληλες για ανάπτυξη με AZD (2-3 ώρες)
- [**Interactive Workshop**](workshop/README.md) - Καθοδηγούμενες ασκήσεις 8 μονάδων με MkDocs και GitHub Codespaces
  - Ακολουθεί: Εισαγωγή → Επιλογή → Επικύρωση → Αποδόμηση → Διαμόρφωση → Προσαρμογή → Κατάργηση → Σύνοψη

### Εξωτερικοί Πόροι Μάθησης
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### Δεξιότητες Πρακτόρων AI για τον Επεξεργαστή σας
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 ανοιχτές δεξιότητες πρακτόρων για Azure AI, Foundry, ανάπτυξη, διαγνωστικά, βελτιστοποίηση κόστους και άλλα. Εγκαταστήστε τις στο GitHub Copilot, Cursor, Claude Code ή οποιονδήποτε υποστηριζόμενο πράκτορα:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

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
# Δοκιμάστε διαφορετική περιοχή του Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ή χρησιμοποιήστε μικρότερα SKUs κατά την ανάπτυξη
# Επεξεργαστείτε το infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

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
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Επαναέλεγχος ταυτότητας για το AZD
azd auth logout
azd auth login

# Προαιρετικό: ανανεώστε επίσης το Azure CLI εάν εκτελείτε εντολές az
az logout
az login

# Επαληθεύστε την αυθεντικοποίηση
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# Το AZD δημιουργεί μοναδικά ονόματα, αλλά σε περίπτωση σύγκρουσης:
azd down --force --purge

# Στη συνέχεια δοκιμάστε ξανά με νέο περιβάλλον
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Κανονικοί χρόνοι αναμονής:**
- Απλή web εφαρμογή: 5-10 λεπτά
- Εφαρμογή με βάση δεδομένων: 10-15 λεπτά
- Εφαρμογές AI: 15-25 λεπτά (η προμήθεια του OpenAI είναι αργή)

```bash
# Ελέγξτε την πρόοδο
azd show

# Εάν κολλήσετε >30 λεπτά, ελέγξτε την Πύλη του Azure:
azd monitor --overview
# Αναζητήστε αποτυχημένες αναπτύξεις
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Ελέγξτε τον ρόλο σας στο Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Χρειάζεστε τουλάχιστον τον ρόλο "Contributor"
# Ζητήστε από τον διαχειριστή Azure σας να παραχωρήσει:
# - Contributor (για πόρους)
# - User Access Administrator (για αναθέσεις ρόλων)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Εμφάνιση όλων των τελικών σημείων υπηρεσίας
azd show

# Ή άνοιξε το Azure Portal
azd monitor

# Έλεγχος συγκεκριμένης υπηρεσίας
azd env get-values
# Αναζήτηση μεταβλητών *_URL
```
</details>

### 📚 Πλήρεις Πόροι Αντιμετώπισης Προβλημάτων

- **Οδηγός Συνηθισμένων Προβλημάτων:** [Λεπτομερείς Λύσεις](docs/chapter-07-troubleshooting/common-issues.md)
- **Ζητήματα Σχετικά με AI:** [Αντιμετώπιση Προβλημάτων AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Οδηγός Εντοπισμού Σφαλμάτων:** [Βήμα-βήμα Εντοπισμός Σφαλμάτων](docs/chapter-07-troubleshooting/debugging.md)
- **Λάβετε Βοήθεια:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ολοκλήρωση Μαθήματος & Πιστοποίηση

### Παρακολούθηση Προόδου
Παρακολουθήστε την πρόοδό σας ανά κεφάλαιο:

- [ ] **Κεφάλαιο 1**: Βασικές Αρχές & Γρήγορη Εκκίνηση ✅
- [ ] **Κεφάλαιο 2**: AI-Πρώτη Ανάπτυξη ✅  
- [ ] **Κεφάλαιο 3**: Διαμόρφωση & Αυθεντικοποίηση ✅
- [ ] **Κεφάλαιο 4**: Υποδομή ως Κώδικας & Ανάπτυξη ✅
- [ ] **Κεφάλαιο 5**: AI Λύσεις Πολλαπλών Πρακτόρων ✅
- [ ] **Κεφάλαιο 6**: Επικύρωση & Σχεδιασμός πριν την Ανάπτυξη ✅
- [ ] **Κεφάλαιο 7**: Αντιμετώπιση Προβλημάτων & Εντοπισμός Σφαλμάτων ✅
- [ ] **Κεφάλαιο 8**: Πρότυπα Παραγωγής & Επιχειρησιακά ✅

### Επαλήθευση Μαθησιακών Αποτελεσμάτων
Μετά την ολοκλήρωση κάθε κεφαλαίου, επαληθεύστε τις γνώσεις σας κάνοντας:
1. **Πρακτική Άσκηση**: Ολοκληρώστε την πρακτική ανάπτυξη του κεφαλαίου
2. **Έλεγχος Γνώσεων**: Επισκοπήστε την ενότητα Συχνών Ερωτήσεων για το κεφάλαιό σας
3. **Συζήτηση στην Κοινότητα**: Μοιραστείτε την εμπειρία σας στο Azure Discord
4. **Επόμενο Κεφάλαιο**: Μεταβείτε στο επόμενο επίπεδο πολυπλοκότητας

### Οφέλη Ολοκλήρωσης Μαθήματος
Με την ολοκλήρωση όλων των κεφαλαίων, θα έχετε:
- **Εμπειρία Παραγωγής**: Ανάπτυξη πραγματικών εφαρμογών AI στο Azure
- **Επαγγελματικές Δεξιότητες**: Ικανότητες ανάπτυξης έτοιμες για επιχειρήσεις  
- **Αναγνώριση στην Κοινότητα**: Ενεργό μέλος της κοινότητας προγραμματιστών Azure
- **Προώθηση Καριέρας**: Περιζήτητες γνώσεις AZD και ανάπτυξης AI

---

## 🤝 Κοινότητα & Υποστήριξη

### Λάβετε Βοήθεια & Υποστήριξη
- **Τεχνικά Ζητήματα**: [Αναφορά σφαλμάτων και αιτήματα χαρακτηριστικών](https://github.com/microsoft/azd-for-beginners/issues)
- **Ερωτήσεις Εκμάθησης**: [Κοινότητα Microsoft Azure στο Discord](https://discord.gg/microsoft-azure) και [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Βοήθεια Ειδικά για AI**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Τεκμηρίωση**: [Επίσημη τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Γνώσεις Κοινότητας από το Microsoft Foundry Discord

**Πρόσφατα Αποτελέσματα Δημοσκόπησης από το Κανάλι #Azure:**
- **45%** των προγραμματιστών θέλουν να χρησιμοποιήσουν το AZD για εργασίες AI
- **Κύριες προκλήσεις**: Αναπτύξεις πολλαπλών υπηρεσιών, διαχείριση διαπιστευτηρίων, ετοιμότητα για παραγωγή  
- **Τα πιο ζητούμενα**: Πρότυπα ειδικά για AI, οδηγοί αντιμετώπισης προβλημάτων, βέλτιστες πρακτικές

**Γίνετε μέλος της κοινότητάς μας για να:**
- Μοιραστείτε τις εμπειρίες σας με AZD + AI και λάβετε βοήθεια
- Έχετε πρόσβαση σε πρώιμες προεπισκοπήσεις νέων προτύπων AI
- Συνεισφέρετε σε βέλτιστες πρακτικές ανάπτυξης AI
- Επηρεάστε τη μελλοντική ανάπτυξη λειτουργιών AI + AZD

### Συμμετοχή στο Μάθημα
Καλωσορίζουμε τις συνεισφορές! Παρακαλούμε διαβάστε τον [Contributing Guide](CONTRIBUTING.md) για λεπτομέρειες σχετικά με:
- **Βελτιώσεις Περιεχομένου**: Βελτιώστε υπάρχοντα κεφάλαια και παραδείγματα
- **Νέα Παραδείγματα**: Προσθέστε σενάρια και πρότυπα πραγματικού κόσμου  
- **Μετάφραση**: Βοηθήστε στη διατήρηση υποστήριξης πολλαπλών γλωσσών
- **Αναφορές Σφαλμάτων**: Βελτιώστε την ακρίβεια και την σαφήνεια
- **Πρότυπα Κοινότητας**: Ακολουθήστε τις οδηγίες συμπεριφοράς της κοινότητάς μας

---

## 📄 Πληροφορίες Μαθήματος

### Άδεια
Αυτό το έργο διατίθεται υπό την άδεια MIT - δείτε το αρχείο [LICENSE](../../LICENSE) για λεπτομέρειες.

### Σχετικοί Πόροι Μάθησης της Microsoft

Η ομάδα μας παράγει και άλλα ολοκληρωμένα μαθήματα μάθησης:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Πράκτορες
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Σειρά Γενετικού AI
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Βασική Μάθηση
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Επιστήμη Δεδομένων για Αρχάριους](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Τεχνητή Νοημοσύνη για Αρχάριους](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Κυβερνοασφάλεια για Αρχάριους](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Ανάπτυξη Web για Αρχάριους](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT για Αρχάριους](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Ανάπτυξη XR για Αρχάριους](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Σειρά Copilot
[![Copilot για Προγραμματισμό σε Ζεύγη με AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot για C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Περιπέτεια Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Πλοήγηση Μαθήματος

**🚀 Έτοιμοι να Ξεκινήσετε;**

**Αρχάριοι**: Ξεκινήστε με [Κεφάλαιο 1: Θεμέλια & Γρήγορη Εκκίνηση](#-chapter-1-foundation--quick-start)  
**Προγραμματιστές AI**: Μεταβείτε στο [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στην AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Έμπειροι Προγραμματιστές**: Ξεκινήστε με [Κεφάλαιο 3: Διαμόρφωση & Πιστοποίηση](#️-chapter-3-configuration--authentication)

**Επόμενα Βήματα**: [Ξεκινήστε το Κεφάλαιο 1 - Βασικά AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να σημειώσετε ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το αρχικό έγγραφο στην πρωτότυπη γλώσσα του πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->