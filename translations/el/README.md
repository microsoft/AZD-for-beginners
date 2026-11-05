# AZD για Αρχάριους: Ένα Δομημένο Μαθησιακό Ταξίδι

![AZD-for-beginners](../../translated_images/el/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Αυτόματες Μεταφράσεις (Πάντα Ενημερωμένες)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Αραβικά](../ar/README.md) | [Μπενγκάλι](../bn/README.md) | [Βουλγαρικά](../bg/README.md) | [Βιρμανικά (Μυανμάρ)](../my/README.md) | [Κινέζικα (Απλοποιημένα)](../zh-CN/README.md) | [Κινέζικα (Παραδοσιακά, Χονγκ Κονγκ)](../zh-HK/README.md) | [Κινέζικα (Παραδοσιακά, Μακάο)](../zh-MO/README.md) | [Κινέζικα (Παραδοσιακά, Ταϊβάν)](../zh-TW/README.md) | [Κροατικά](../hr/README.md) | [Τσέχικα](../cs/README.md) | [Δανικά](../da/README.md) | [Ολλανδικά](../nl/README.md) | [Εσθονικά](../et/README.md) | [Φινλανδικά](../fi/README.md) | [Γαλλικά](../fr/README.md) | [Γερμανικά](../de/README.md) | [Ελληνικά](./README.md) | [Εβραϊκά](../he/README.md) | [Χίντι](../hi/README.md) | [Ουγγρικά](../hu/README.md) | [Ινδονησιακά](../id/README.md) | [Ιταλικά](../it/README.md) | [Ιαπωνικά](../ja/README.md) | [Κανάντα](../kn/README.md) | [Χμερ](../km/README.md) | [Κορεάτικα](../ko/README.md) | [Λιθουανικά](../lt/README.md) | [Μαλαισιανά](../ms/README.md) | [Μαλαγιαλάμ](../ml/README.md) | [Μανιπουρί (Μεϊτεϊ Μαϊέκ)](../mni/README.md) | [Μαράθι](../mr/README.md) | [Νεπάλ](../ne/README.md) | [Νιγηριανό Πίτζιν](../pcm/README.md) | [Νορβηγικά](../no/README.md) | [Περσικά (Φαρσί)](../fa/README.md) | [Πολωνικά](../pl/README.md) | [Πορτογαλικά (Βραζιλίας)](../pt-BR/README.md) | [Πορτογαλικά (Πορτογαλίας)](../pt-PT/README.md) | [Πουντζάμπι (Γκουρκούχι)](../pa/README.md) | [Ρουμανικά](../ro/README.md) | [Ρωσικά](../ru/README.md) | [Σερβικά (Κυριλλικά)](../sr/README.md) | [Σλοβακικά](../sk/README.md) | [Σλοβενικά](../sl/README.md) | [Ισπανικά](../es/README.md) | [Σουαχίλι](../sw/README.md) | [Σουηδικά](../sv/README.md) | [Ταγαλογκ (Φιλιππινέζικα)](../tl/README.md) | [Ταμίλ](../ta/README.md) | [Τελούγκου](../te/README.md) | [Ταϊλανδικά](../th/README.md) | [Τουρκικά](../tr/README.md) | [Ουκρανικά](../uk/README.md) | [Ουρντού](../ur/README.md) | [Βιετναμέζικα](../vi/README.md)

> **Προτιμάτε να κάνετε κλωνοποίηση τοπικά;**
>
> Αυτό το αποθετήριο περιλαμβάνει πάνω από 50 μεταφράσεις γλωσσών που αυξάνουν σημαντικά το μέγεθος λήψης. Για να κάνετε κλωνοποίηση χωρίς μεταφράσεις, χρησιμοποιήστε sparse checkout:
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
> Αυτό σας παρέχει ό,τι χρειάζεστε για να ολοκληρώσετε το μάθημα με πολύ γρηγορότερη λήψη.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Τι νέο υπάρχει στο azd Σήμερα

> 📌 Αυτό το μάθημα είναι επικυρωμένο με βάση **`azd 1.27.1`** (Ιούλιος 2026). Εκτελέστε `azd version` για να ελέγξετε την κατασκευή σας, και `azd upgrade` για να λάβετε την τελευταία έκδοση.

Το Azure Developer CLI έχει εξελιχθεί πέρα από τις παραδοσιακές εφαρμογές ιστού και API. Σήμερα, το azd είναι το μοναδικό εργαλείο για την ανάπτυξη **οποιασδήποτε** εφαρμογής στο Azure—συμπεριλαμβανομένων εφαρμογών με τεχνητή νοημοσύνη και ευφυείς πράκτορες.

Αυτό σημαίνει τα εξής για εσάς:

- **Οι πράκτορες AI είναι πλέον πρώτης τάξης workloads στο azd.** Μπορείτε να αρχικοποιήσετε, να αναπτύξετε και να διαχειριστείτε έργα AI πρακτόρων χρησιμοποιώντας την ίδια ροή εργασίας `azd init` → `azd up` που ήδη γνωρίζετε.
- **Ολοκληρωμένος κύκλος ζωής πράκτορα από το CLI.** Η επέκταση `azure.ai.agents` καλύπτει πλέον ολόκληρο το ταξίδι—`azd ai agent init` για scaffolding, `azd ai agent invoke` για δοκιμή (με έξοδο χρονισμού απόκρισης), `azd ai agent eval generate` και `azd ai agent optimize` για μέτρηση και βελτίωση της ποιότητας, και `azd ai agent delete` για καθαρισμό.
- **Περισσότερα δομικά στοιχεία AI.** Νέες προεπισκοπικές επεκτάσεις—`azure.ai.skills` και `azure.ai.connections`—σας επιτρέπουν να διαχειρίζεστε επαναχρησιμοποιήσιμες δεξιότητες πρακτόρων και συνδέσεις Foundry άμεσα με το azd.
- **Ενσωμάτωση με Microsoft Foundry** που φέρνει την ανάπτυξη μοντέλων, τη φιλοξενία πρακτόρων, και τη διαμόρφωση υπηρεσιών AI απευθείας στο οικοσύστημα προτύπων azd.
- **Ομαλότερα βασικά καθημερινά.** Πρόσφατες εκδόσεις έκαναν το `azd init` αναίρετο (ασφαλές για επανεκτέλεση), το `azd auth login` να καθαρίζει αυτόματα τα παλιά διακριτικά, και πρόσθεσαν ένα φιλικό `azd tool` προτροπή πρώτης εκτέλεσης.
- **Η βασική ροή εργασίας δεν έχει αλλάξει.** Είτε αναπτύσσετε μια εφαρμογή todo, μικροϋπηρεσία, είτε μια λύση πολλαπλών πρακτόρων AI, οι εντολές είναι οι ίδιες.

> **Σημείωση για χρήστες Aspire:** Η Microsoft αναφέρεται πλέον στο προϊόν απλώς ως **Aspire** (πρώην ".NET Aspire"). Η υποστήριξη του azd για Aspire παραμένει αμετάβλητη—μόνο το όνομα ενημερώθηκε.

Αν έχετε χρησιμοποιήσει το azd προηγουμένως, η υποστήριξη AI είναι μια φυσική επέκταση—όχι ξεχωριστό εργαλείο ή προχωρημένη διαδρομή. Αν ξεκινάτε από την αρχή, θα μάθετε μία ροή εργασίας που λειτουργεί για τα πάντα.

---

## 🚀 Τι είναι το Azure Developer CLI (azd);

**Azure Developer CLI (azd)** είναι ένα φιλικό προς τον προγραμματιστή εργαλείο γραμμής εντολών που καθιστά απλή την ανάπτυξη εφαρμογών στο Azure. Αντί να δημιουργείτε και να συνδέετε χειροκίνητα δεκάδες πόρους Azure, μπορείτε να αναπτύξετε ολόκληρες εφαρμογές με μία εντολή.

### Η Μαγεία του `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**Αυτό ήταν!** Χωρίς κλικ στο Azure Portal, χωρίς πολύπλοκα πρότυπα ARM για εκμάθηση πρώτα, χωρίς χειροκίνητη ρύθμιση - μόνο λειτουργικές εφαρμογές στο Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Ποια η Διαφορά;

Αυτό είναι το πιο συχνό ερώτημα που κάνουν οι αρχάριοι. Να η απλή απάντηση:

| Χαρακτηριστικό | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Σκοπός** | Διαχείριση μεμονωμένων πόρων Azure | Ανάπτυξη ολοκληρωμένων εφαρμογών |
| **Νοοτροπία** | Εστίαση σε υποδομή | Εστίαση σε εφαρμογές |
| **Παράδειγμα** | `az webapp create --name myapp...` | `azd up` |
| **Καμύλας μάθησης** | Πρέπει να γνωρίζετε υπηρεσίες Azure | Απλώς να γνωρίζετε την εφαρμογή σας |
| **Ιδανικό για** | DevOps, Υποδομή | Προγραμματιστές, Πρωτοτυποποίηση |

### Απλή Αναλογία

- **Azure CLI** είναι σαν να έχετε όλα τα εργαλεία για να χτίσετε ένα σπίτι - σφυριά, πριόνια, καρφιά. Μπορείτε να φτιάξετε οτιδήποτε, αλλά πρέπει να ξέρετε κατασκευή.
- **Azure Developer CLI** είναι σαν να προσλαμβάνετε έναν εργολάβο - περιγράφετε τι θέλετε και αυτός αναλαμβάνει την κατασκευή.

### Πότε να Χρησιμοποιήσετε το Καθένα

| Σενάριο | Χρησιμοποιήστε Αυτό |
|----------|----------|
| "Θέλω να αναπτύξω γρήγορα την εφαρμογή ιστού μου" | `azd up` |
| "Χρειάζομαι μόνο έναν λογαριασμό αποθήκευσης" | `az storage account create` |
| "Χτίζω μια πλήρη εφαρμογή AI" | `azd init --template azure-search-openai-demo` |
| "Πρέπει να εντοπίσω σφάλματα σε συγκεκριμένο πόρο Azure" | `az resource show` |
| "Θέλω ανάπτυξη έτοιμη για παραγωγή σε λίγα λεπτά" | `azd up --environment production` |

### Λειτουργούν Μαζί!

Το AZD χρησιμοποιεί το Azure CLI από κάτω. Μπορείτε να τα χρησιμοποιήσετε και τα δύο:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Βρείτε Πρότυπα στο Awesome AZD

Μην ξεκινήσετε από το μηδέν! Το **Awesome AZD** είναι η συλλογή της κοινότητας με πρότυπα έτοιμα για ανάπτυξη:

| Πόρος | Περιγραφή |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Περιηγηθείτε σε 200+ πρότυπα με ανάπτυξη με ένα κλικ |
| 🔗 [**Υποβολή Προτύπου**](https://github.com/Azure/awesome-azd/issues) | Συμβάλλετε με το δικό σας πρότυπο στην κοινότητα |
| 🔗 [**Αποθετήριο GitHub**](https://github.com/Azure/awesome-azd) | Αστεροποίηση και εξερεύνηση του κώδικα πηγής |

### Δημοφιλή Πρότυπα AI από το Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Ξεκινώντας σε 3 Βήματα

Πριν ξεκινήσετε, βεβαιωθείτε ότι ο υπολογιστής σας είναι έτοιμος για το πρότυπο που θέλετε να αναπτύξετε:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Αν κάποιος από τους απαιτούμενους ελέγχους αποτύχει, διορθώστε το πρώτα και μετά συνεχίστε με την γρήγορη εκκίνηση.

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

### Βήμα 2: Πιστοποιηθείτε για το AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Αν δεν είστε σίγουροι ποιο χρειάζεστε, ακολουθήστε τη πλήρη ροή ρύθμισης στο [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Βήμα 3: Αναπτύξτε την Πρώτη σας Εφαρμογή

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Αυτό ήταν!** Η εφαρμογή σας είναι τώρα ζωντανή στο Azure.

### Καθαρισμός (Μην το Ξεχνάτε!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Πώς να Χρησιμοποιήσετε Αυτό το Μάθημα

Αυτό το μάθημα έχει σχεδιαστεί για **προοδευτική μάθηση** - ξεκινήστε εκεί που αισθάνεστε άνετα και προχωρήστε:

| Η Εμπειρία σας | Ξεκινήστε Εδώ |
|-----------------|------------|
| **Τελείως νέος στο Azure** | [Κεφάλαιο 1: Θεμέλια](#-chapter-1-foundation--quick-start) |
| **Γνωρίζω το Azure, νέο στο AZD** | [Κεφάλαιο 1: Θεμέλια](#-chapter-1-foundation--quick-start) |
| **Θέλω να αναπτύξω εφαρμογές AI** | [Κεφάλαιο 2: Ανάπτυξη Πρώτα με AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Θέλω πρακτική εξάσκηση** | [🎓 Διαδραστικό Εργαστήριο](workshop/README.md) - Οδηγούμενο εργαστήριο 3-4 ωρών |
| **Χρειάζομαι πρότυπα παραγωγής** | [Κεφάλαιο 8: Παραγωγή & Επιχειρήσεις](#-chapter-8-production--enterprise-patterns) |

### Γρήγορη Ρύθμιση

1. **Κάντε Fork Αυτό το Αποθετήριο**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Κλωνοποιήστε το**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Λάβετε Βοήθεια**: [Κοινότητα Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Προτιμάτε να κάνετε κλωνοποίηση τοπικά;**

> Αυτό το αποθετήριο περιλαμβάνει πάνω από 50 μεταφράσεις γλωσσών που αυξάνουν σημαντικά το μέγεθος λήψης. Για να κάνετε κλωνοποίηση χωρίς μεταφράσεις, χρησιμοποιήστε sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Αυτό σας παρέχει ό,τι χρειάζεστε για να ολοκληρώσετε το μάθημα με πολύ γρηγορότερη λήψη.


## Επισκόπηση Μαθήματος

Κατακτήστε το Azure Developer CLI (azd) μέσω δομημένων κεφαλαίων σχεδιασμένων για προοδευτική μάθηση. **Ιδιαίτερη έμφαση στην ανάπτυξη εφαρμογών AI με ενσωμάτωση Microsoft Foundry.**

### Γιατί αυτό το μάθημα είναι απαραίτητο για σύγχρονους προγραμματιστές

Βάσει των αποκαλύψεων της κοινότητας Microsoft Foundry Discord, **το 45% των προγραμματιστών θέλουν να χρησιμοποιήσουν το AZD για workloads AI** αλλά αντιμετωπίζουν προκλήσεις με:
- Σύνθετες αρχιτεκτονικές AI πολλαπλών υπηρεσιών
- Βέλτιστες πρακτικές παραγωγικής ανάπτυξης AI  
- Ενσωμάτωση και ρύθμιση υπηρεσιών Azure AI
- Βελτιστοποίηση κόστους για workloads AI
- Επίλυση προβλημάτων ειδικών στην ανάπτυξη AI

### Μαθησιακοί Στόχοι

Ολοκληρώνοντας αυτό το δομημένο μάθημα, θα:
- **Κατακτήσετε τα Θεμελιώδη του AZD**: Βασικές έννοιες, εγκατάσταση και ρύθμιση
- **Αναπτύξετε Εφαρμογές AI**: Χρησιμοποιήστε το AZD με υπηρεσίες Microsoft Foundry
- **Εφαρμογή Υποδομής ως Κώδικα**: Διαχειριστείτε πόρους Azure με πρότυπα Bicep
- **Επίλυση Προβλημάτων Αναπτύξεων**: Επίλυση κοινών θεμάτων και αποσφαλμάτωση προβλημάτων
- **Βελτιστοποίηση για Παραγωγή**: Ασφάλεια, κλιμάκωση, παρακολούθηση και διαχείριση κόστους
- **Δημιουργία Λύσεων Πολλαπλών Πρακτόρων**: Ανάπτυξη πολύπλοκων αρχιτεκτονικών AI

## Πριν Ξεκινήσετε: Λογαριασμοί, Πρόσβαση και Υποθέσεις

Πριν ξεκινήσετε το Κεφάλαιο 1, βεβαιωθείτε ότι έχετε έτοιμα τα εξής. Τα βήματα εγκατάστασης αργότερα σε αυτόν τον οδηγό υποθέτουν ότι αυτά τα βασικά έχουν ήδη διευθετηθεί.

- **Συνδρομή Azure**: Μπορείτε να χρησιμοποιήσετε μια υπάρχουσα συνδρομή από τη δουλειά ή τον δικό σας λογαριασμό, ή να δημιουργήσετε μια [δωρεάν δοκιμή](https://aka.ms/azurefreetrial) για να ξεκινήσετε.
- **Άδεια δημιουργίας πόρων Azure**: Για τις περισσότερες ασκήσεις, θα πρέπει να έχετε τουλάχιστον πρόσβαση **Contributor** στη στοχευόμενη συνδρομή ή ομάδα πόρων. Κάποια κεφάλαια μπορεί επίσης να υποθέτουν ότι μπορείτε να δημιουργήσετε ομάδες πόρων, διαχειριζόμενες ταυτότητες και αναθέσεις RBAC.
- [**Λογαριασμός GitHub**](https://github.com): Αυτό είναι χρήσιμο για να κάνετε fork το αποθετήριο, να παρακολουθείτε τις δικές σας αλλαγές και να χρησιμοποιείτε το GitHub Codespaces για το εργαστήριο.
- **Προαπαιτούμενα εκτέλεσης προτύπων**: Ορισμένα πρότυπα χρειάζονται τοπικά εργαλεία όπως Node.js, Python, Java ή Docker. Εκτελέστε τον επικυρωτή ρυθμίσεων πριν ξεκινήσετε ώστε να εντοπίσετε νωρίς τυχόν ελλείποντα εργαλεία.
- **Βασική εξοικείωση με το τερματικό**: Δεν χρειάζεται να είστε ειδικός, αλλά πρέπει να νιώθετε άνετα να εκτελείτε εντολές όπως `git clone`, `azd auth login` και `azd up`.

> **Εργάζεστε σε συνδρομή επιχείρησης;**
> Αν το περιβάλλον Azure διαχειρίζεται από διαχειριστή, επιβεβαιώστε εκ των προτέρων ότι μπορείτε να αναπτύξετε πόρους στη συνδρομή ή την ομάδα πόρων που σκοπεύετε να χρησιμοποιήσετε. Αν όχι, ζητήστε μια συνδρομή sandbox ή πρόσβαση Contributor πριν ξεκινήσετε.

> **Νέος στο Azure;**
> Ξεκινήστε με τη δική σας δοκιμαστική συνδρομή Azure ή pay-as-you-go στο https://aka.ms/azurefreetrial ώστε να ολοκληρώσετε τις ασκήσεις χωρίς να περιμένετε εγκρίσεις σε επίπεδο tenant.

## 🗺️ Χάρτης Μαθήματος: Γρήγορη Πλοήγηση ανά Κεφάλαιο

Κάθε κεφάλαιο έχει ένα αφιερωμένο README με μαθησιακούς στόχους, γρήγορες εκκινήσεις και ασκήσεις:

| Κεφάλαιο | Θέμα | Μαθήματα | Διάρκεια | Πολυπλοκότητα |
|---------|-------|---------|----------|------------|
| **[Κεφ 1: Βάση](docs/chapter-01-foundation/README.md)** | Εισαγωγή | [Βασικά AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Εγκατάσταση](docs/chapter-01-foundation/installation.md) &#124; [Πρώτο Project](docs/chapter-01-foundation/first-project.md) | 30-45 λεπτά | ⭐ |
| **[Κεφ 2: Ανάπτυξη AI](docs/chapter-02-ai-development/README.md)** | Εφαρμογές AI-Πρώτου | [Ενσωμάτωση Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Πράκτορες AI](docs/chapter-02-ai-development/agents.md) &#124; [Ανάπτυξη Μοντέλου](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Εργαστήριο](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ώρες | ⭐⭐ |
| **[Κεφ 3: Διαμόρφωση](docs/chapter-03-configuration/README.md)** | Εξουσιοδότηση & Ασφάλεια | [Διαμόρφωση](docs/chapter-03-configuration/configuration.md) &#124; [Εξουσιοδότηση & Ασφάλεια](docs/chapter-03-configuration/authsecurity.md) | 45-60 λεπτά | ⭐⭐ |
| **[Κεφ 4: Υποδομή](docs/chapter-04-infrastructure/README.md)** | IaC & Ανάπτυξη | [Οδηγός Ανάπτυξης](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Πρόβλεψη](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ώρες | ⭐⭐⭐ |
| **[Κεφ 5: Πολλαπλοί Πράκτορες](docs/chapter-05-multi-agent/README.md)** | Λύσεις Πράκτορα AI | [Σενάριο Λιανικής](examples/retail-scenario.md) &#124; [Πρότυπα Συντονισμού](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ώρες | ⭐⭐⭐⭐ |
| **[Κεφ 6: Προ-Ανάπτυξη](docs/chapter-06-pre-deployment/README.md)** | Σχεδιασμός & Επικύρωση | [Έλεγχοι Προ-Πτήσης](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Προγραμματισμός Χωρητικότητας](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Επιλογή SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ώρα | ⭐⭐ |
| **[Κεφ 7: Επίλυση Προβλημάτων](docs/chapter-07-troubleshooting/README.md)** | Αποσφαλμάτωση & Διόρθωση | [Κοινά Θέματα](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Αποσφαλμάτωση](docs/chapter-07-troubleshooting/debugging.md) &#124; [Θέματα AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ώρες | ⭐⭐ |
| **[Κεφ 8: Παραγωγή](docs/chapter-08-production/README.md)** | Πρότυπα Επιχείρησης | [Πρακτικές Παραγωγής](docs/chapter-08-production/production-ai-practices.md) | 2-3 ώρες | ⭐⭐⭐⭐ |
| **[🎓 Εργαστήριο](workshop/README.md)** | Εργαστήριο | [Εισαγωγή](workshop/docs/instructions/0-Introduction.md) &#124; [Επιλογή](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Επικύρωση](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Ανάλυση](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Διαμόρφωση](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Προσαρμογή](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Καταστροφή](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Ολοκλήρωση](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ώρες | ⭐⭐ |

**Συνολική Διάρκεια Μαθήματος:** ~10-14 ώρες | **Προχωρημένη Ικανότητα:** Αρχάριος → Έτοιμος για Παραγωγή

---

## 📚 Κεφάλαια Μάθησης

*Επιλέξτε τη διαδρομή μάθησής σας ανάλογα με το επίπεδο εμπειρίας και τους στόχους*

### 🚀 Κεφάλαιο 1: Βάση & Γρήγορη Εκκίνηση
**Προαπαιτούμενα**: Συνδρομή Azure, βασικές γνώσεις γραμμής εντολών  
**Διάρκεια**: 30-45 λεπτά  
**Πολυπλοκότητα**: ⭐

#### Τι Θα Μάθετε
- Κατανόηση των θεμελιωδών εννοιών του Azure Developer CLI
- Εγκατάσταση του AZD στην πλατφόρμα σας
- Την πρώτη σας επιτυχημένη ανάπτυξη

#### Πόροι Μάθησης
- **🎯 Ξεκινήστε Εδώ**: [Τι είναι το Azure Developer CLI;](#what-is-azure-developer-cli)
- **📖 Θεωρία**: [Βασικά AZD](docs/chapter-01-foundation/azd-basics.md) - Κύριες έννοιες και ορολογία
- **⚙️ Ρύθμιση**: [Εγκατάσταση & Ρύθμιση](docs/chapter-01-foundation/installation.md) - Οδηγοί ανά πλατφόρμα
- **🛠️ Πρακτική**: [Το Πρώτο σας Project](docs/chapter-01-foundation/first-project.md) - Βήμα-βήμα εκμάθηση
- **📋 Γρήγορη Αναφορά**: [Φύλλο Απάτης Εντολών](resources/cheat-sheet.md)

#### Πρακτικές Ασκήσεις
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Αποτέλεσμα Κεφαλαίου**: Επιτυχημένη ανάπτυξη μιας απλής διαδικτυακής εφαρμογής στο Azure χρησιμοποιώντας AZD

**✅ Επικύρωση Επιτυχίας:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Επένδυση Χρόνου:** 30-45 λεπτά  
**📈 Επίπεδο Ικανότητας Μετά:** Μπορεί να αναπτύξει βασικές εφαρμογές αυτόνομα
**📈 Επίπεδο Ικανότητας Μετά:** Μπορεί να αναπτύξει βασικές εφαρμογές αυτόνομα

---

### 🤖 Κεφάλαιο 2: Ανάπτυξη AI-Πρώτου (Συνιστάται για AI Προγραμματιστές)
**Προαπαιτούμενα**: Ολοκλήρωση Κεφαλαίου 1  
**Διάρκεια**: 1-2 ώρες  
**Πολυπλοκότητα**: ⭐⭐

#### Τι Θα Μάθετε
- Ενσωμάτωση Microsoft Foundry με AZD
- Ανάπτυξη εφαρμογών με δυνατότητες AI
- Κατανόηση ρυθμίσεων υπηρεσιών AI

#### Πόροι Μάθησης
- **🎯 Ξεκινήστε Εδώ**: [Ενσωμάτωση Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Πράκτορες AI**: [Οδηγός Πρακτόρων AI](docs/chapter-02-ai-development/agents.md) - Ανάπτυξη έξυπνων πρακτόρων με AZD
- **📖 Πρότυπα**: [Ανάπτυξη Μοντέλου AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Ανάπτύξτε και διαχειριστείτε μοντέλα AI
- **🛠️ Εργαστήριο**: [Εργαστήριο AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Κάντε τις λύσεις AI έτοιμες για AZD
- **🎥 Διαδραστικός Οδηγός**: [Υλικά Εργαστηρίου](workshop/README.md) - Μάθηση σε πρόγραμμα περιήγησης με MkDocs * Περιβάλλον DevContainer
- **📋 Πρότυπα**: [Πρότυπα Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Παραδείγματα**: [Παραδείγματα Ανάπτυξης AZD](examples/README.md)

#### Πρακτικές Ασκήσεις
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Αποτέλεσμα Κεφαλαίου**: Ανάπτυξη και διαμόρφωση εφαρμογής chat με δυνατότητες RAG

**✅ Επικύρωση Επιτυχίας:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Επένδυση Χρόνου:** 1-2 ώρες  
**📈 Επίπεδο Ικανότητας Μετά:** Μπορεί να αναπτύξει και να διαμορφώσει παραγωγικές εφαρμογές AI  
**💰 Ενημέρωση Κόστους:** Κατανοήστε κόστη ανάπτυξης $80-150/μήνα, κόστη παραγωγής $300-3500/μήνα

#### 💰 Σκέψεις Κόστους για Ανάπτυξη AI

**Περιβάλλον Ανάπτυξης (Εκτιμώμενο $80-150/μήνα):**
- Μοντέλα Microsoft Foundry (Pay-as-you-go): $0-50/μήνα (ανάλογα με τη χρήση tokens)
- AI Search (Βασικό επίπεδο): $75/μήνα
- Εφαρμογές Containers (Κατανάλωση): $0-20/μήνα
- Αποθήκευση (Standard): $1-5/μήνα

**Περιβάλλον Παραγωγής (Εκτιμώμενο $300-3,500+/μήνα):**
- Μοντέλα Microsoft Foundry (PTU για συνεπή απόδοση): $3.000+/μήνα ή Pay-as-you-go με μεγάλο όγκο
- AI Search (Τυπικό επίπεδο): $250/μήνα
- Εφαρμογές Containers (Αφιερωμένο): $50-100/μήνα
- Application Insights: $5-50/μήνα
- Αποθήκευση (Premium): $10-50/μήνα

**💡 Συμβουλές Βελτιστοποίησης Κόστους:**
- Χρησιμοποιήστε **Δωρεάν Επίπεδο** Μοντέλων Microsoft Foundry για εκμάθηση (περιλαμβάνονται 50.000 tokens/μήνα από Azure OpenAI)
- Εκτελέστε `azd down` για να απελευθερώνετε πόρους όταν δεν αναπτύσσετε ενεργά
- Ξεκινήστε με χρέωση βάσει κατανάλωσης, αναβαθμίστε σε PTU μόνο για παραγωγή
- Χρησιμοποιήστε `azd provision --preview` για να εκτιμήσετε κόστη πριν από την ανάπτυξη
- Ενεργοποιήστε αυτόματη κλιμάκωση: πληρώνετε μόνο για την πραγματική χρήση

**Παρακολούθηση Κόστους:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Κεφάλαιο 3: Διαμόρφωση & Εξουσιοδότηση
**Προαπαιτούμενα**: Ολοκλήρωση Κεφαλαίου 1  
**Διάρκεια**: 45-60 λεπτά  
**Πολυπλοκότητα**: ⭐⭐

#### Τι Θα Μάθετε
- Διαχείριση και διαμόρφωση περιβάλλοντος
- Καλές πρακτικές εξουσιοδότησης και ασφάλειας
- Ονοματοδοσία και οργάνωση πόρων

#### Πόροι Μάθησης
- **📖 Διαμόρφωση**: [Οδηγός Διαμόρφωσης](docs/chapter-03-configuration/configuration.md) - Ρυθμίσεις περιβάλλοντος
- **🔐 Ασφάλεια**: [Πρότυπα εξουσιοδότησης και διαχειριζόμενη ταυτότητα](docs/chapter-03-configuration/authsecurity.md) - Πρότυπα εξουσιοδότησης
- **📝 Παραδείγματα**: [Παράδειγμα Βάσης Δεδομένων Εφαρμογής](examples/database-app/README.md) - Παραδείγματα βάσης δεδομένων AZD

#### Πρακτικές Ασκήσεις
- Ρύθμιση πολλαπλών περιβαλλόντων (dev, staging, prod)
- Ρύθμιση εξουσιοδότησης με διαχειριζόμενη ταυτότητα
- Εφαρμογή διαμορφώσεων ειδικών για το περιβάλλον

**💡 Αποτέλεσμα Κεφαλαίου**: Διαχείριση πολλαπλών περιβαλλόντων με σωστή εξουσιοδότηση και ασφάλεια

---

### 🏗️ Κεφάλαιο 4: Υποδομή ως Κώδικας & Ανάπτυξη
**Προαπαιτούμενα**: Ολοκλήρωση Κεφαλαίων 1-3  
**Διάρκεια**: 1-1.5 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐

#### Τι Θα Μάθετε
- Προχωρημένα πρότυπα ανάπτυξης
- Υποδομή ως Κώδικας με Bicep
- Στρατηγικές παροχής πόρων

#### Πόροι Μάθησης
- **📖 Ανάπτυξη**: [Οδηγός Ανάπτυξης](docs/chapter-04-infrastructure/deployment-guide.md) - Πλήρεις ροές εργασίας
- **🏗️ Πρόβλεψη**: [Διαχείριση Πόρων](docs/chapter-04-infrastructure/provisioning.md) - Διαχείριση πόρων Azure
- **📝 Παραδείγματα**: [Παράδειγμα Εφαρμογής Container](../../examples/container-app) - Ανάπτυξη με containers

#### Πρακτικές Ασκήσεις
- Δημιουργία προσαρμοσμένων προτύπων Bicep
- Ανάπτυξη εφαρμογών πολλαπλών υπηρεσιών
- Εφαρμογή στρατηγικών blue-green ανάπτυξης

**💡 Αποτέλεσμα Κεφαλαίου**: Ανάπτυξη πολύπλοκων εφαρμογών πολλαπλών υπηρεσιών με προσαρμοσμένα πρότυπα υποδομής

---

### 🎯 Κεφάλαιο 5: Λύσεις Multi-Agent AI (Προχωρημένο)
**Προαπαιτούμενα**: Ολοκλήρωση Κεφαλαίων 1-2  
**Διάρκεια**: 2-3 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐⭐

#### Τι Θα Μάθετε
- Πρότυπα αρχιτεκτονικής πολλαπλών πρακτόρων
- Ορχήστρωση και συντονισμός πρακτόρων
- Παραγωγικές αναπτύξεις AI

#### Πόροι Μάθησης
- **🤖 Ανάδειξη Έργου**: [Λύση Multi-Agent Λιανικής](examples/retail-scenario.md) - Πλήρης υλοποίηση
- **🛠️ ΠΡΟΤΥΠΑ ARM**: [Πακέτο Προτύπων ARM](../../examples/retail-multiagent-arm-template) - Ανάπτυξη με ένα κλικ
- **📖 Αρχιτεκτονική**: [Πρότυπα συντονισμού πολλαπλών πρακτόρων](docs/chapter-06-pre-deployment/coordination-patterns.md) - Πρότυπα

#### Πρακτικές Ασκήσεις
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Αποτέλεσμα Κεφαλαίου**: Ανάπτυξη και διαχείριση παραγωγικής λύσης Multi-Agent AI με πράκτορες Πελάτη και Αποθεμάτων

---

### 🔍 Κεφάλαιο 6: Προ-Ανάπτυξη Επικύρωση & Σχεδιασμός
**Προαπαιτούμενα**: Ολοκλήρωση Κεφαλαίου 4  
**Διάρκεια**: 1 ώρα  
**Πολυπλοκότητα**: ⭐⭐

#### Τι Θα Μάθετε
- Σχεδιασμός χωρητικότητας και επικύρωση πόρων
- Στρατηγικές επιλογής SKU
- Προ-πτήσεις ελέγχους και αυτοματοποίηση

#### Πόροι Μάθησης
- **📊 Σχεδιασμός**: [Σχεδιασμός Δυναμικότητας](docs/chapter-06-pre-deployment/capacity-planning.md) - Επικύρωση πόρων
- **💰 Επιλογή**: [Επιλογή SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Οικονομικές επιλογές
- **✅ Επικύρωση**: [Προ-ελέγχους](docs/chapter-06-pre-deployment/preflight-checks.md) - Αυτοματοποιημένα σενάρια

#### Πρακτικές Ασκήσεις
- Εκτέλεση σεναρίων επικύρωσης δυναμικότητας
- Βελτιστοποίηση επιλογών SKU ως προς το κόστος
- Εφαρμογή αυτοματοποιημένων προ-αναπτυξιακών ελέγχων

**💡 Αποτέλεσμα Κεφαλαίου**: Επικυρώστε και βελτιστοποιήστε τις αναπτύξεις πριν την εκτέλεση

---

### 🚨 Κεφάλαιο 7: Επίλυση Προβλημάτων & Αποσφαλμάτωση
**Προαπαιτούμενα**: Ολοκλήρωση οποιουδήποτε κεφαλαίου ανάπτυξης  
**Διάρκεια**: 1-1.5 ώρες  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα μάθετε
- Συστηματικές προσεγγίσεις αποσφαλμάτωσης
- Συνηθισμένα προβλήματα και λύσεις
- Επίλυση προβλημάτων ειδικά για AI

#### Πόροι Μάθησης
- **🔧 Συνηθισμένα Προβλήματα**: [Συνηθισμένα Προβλήματα](docs/chapter-07-troubleshooting/common-issues.md) - Συχνές ερωτήσεις και λύσεις
- **🕵️ Αποσφαλμάτωση**: [Οδηγός Αποσφαλμάτωσης](docs/chapter-07-troubleshooting/debugging.md) - Βήμα-βήμα στρατηγικές
- **🤖 Προβλήματα AI**: [Επίλυση Προβλημάτων AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Προβλήματα υπηρεσιών AI

#### Πρακτικές Ασκήσεις
- Διάγνωση αποτυχιών ανάπτυξης
- Επίλυση προβλημάτων πιστοποίησης
- Αποσφαλμάτωση συνδεσιμότητας υπηρεσιών AI

**💡 Αποτέλεσμα Κεφαλαίου**: Αυτόνομη διάγνωση και επίλυση κοινών προβλημάτων ανάπτυξης

---

### 🏢 Κεφάλαιο 8: Παραγωγή & Enterprise Patterns
**Προαπαιτούμενα**: Ολοκλήρωση κεφαλαίων 1-4  
**Διάρκεια**: 2-3 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐⭐

#### Τι θα μάθετε
- Στρατηγικές παραγωγικής ανάπτυξης
- Πρότυπα ασφάλειας επιχείρησης
- Παρακολούθηση και βελτιστοποίηση κόστους

#### Πόροι Μάθησης
- **🏭 Παραγωγή**: [Βέλτιστες Πρακτικές Microsoft Foundry AI](docs/chapter-08-production/production-ai-practices.md) - Πρότυπα επιχείρησης
- **📝 Παραδείγματα**: [Παράδειγμα Microservices](../../examples/microservices) - Σύνθετες αρχιτεκτονικές
- **📊 Παρακολούθηση**: [Ενσωμάτωση Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Παρακολούθηση

#### Πρακτικές Ασκήσεις
- Εφαρμογή προτύπων ασφάλειας επιχείρησης
- Ρύθμιση ολοκληρωμένης παρακολούθησης
- Ανάπτυξη σε παραγωγή με σωστή διακυβέρνηση

**💡 Αποτέλεσμα Κεφαλαίου**: Ανάπτυξη εφαρμογών έτοιμων για επιχειρησιακή χρήση με πλήρεις παραγωγικές δυνατότητες

---

## 🎓 Επισκόπηση Εργαστηρίου: Διαδραστική Εμπειρία Μάθησης

> **⚠️ ΚΑΤΑΣΤΑΣΗ ΕΡΓΑΣΤΗΡΙΟΥ: Ενεργή Ανάπτυξη**  
> Τα υλικά του εργαστηρίου αναπτύσσονται και βελτιώνονται αυτή τη στιγμή. Οι βασικές ενότητες είναι λειτουργικές, αλλά ορισμένα προχωρημένα τμήματα δεν έχουν ολοκληρωθεί. Εργαζόμαστε ενεργά για την ολοκλήρωση όλων των περιεχομένων. [Παρακολούθηση προόδου →](workshop/README.md)

### Διαδραστικά Υλικά Εργαστηρίου
**Ολοκληρωμένη, πρακτική μάθηση με εργαλεία σε περιβάλλον browser και καθοδηγούμενες ασκήσεις**

Τα υλικά του εργαστηρίου προσφέρουν μια δομημένη, διαδραστική εμπειρία μάθησης που συμπληρώνει το κεφαλαιομετρικό εκπαιδευτικό πρόγραμμα παραπάνω. Το εργαστήριο προορίζεται για αυτόνομη μάθηση αλλά και για καθοδηγούμενες συνεδρίες.

#### 🛠️ Χαρακτηριστικά Εργαστηρίου
- **Περιβάλλον Βάση Browser**: Πλήρες εργαστήριο με βάση MkDocs, με λειτουργίες αναζήτησης, αντιγραφής και θεμάτων
- **Ενσωμάτωση GitHub Codespaces**: Ρύθμιση περιβάλλοντος ανάπτυξης με ένα κλικ
- **Δομημένη Διαδρομή Μάθησης**: 8 καθοδηγούμενες ενότητες (3-4 ώρες συνολικά)
- **Προοδευτική Μεθοδολογία**: Εισαγωγή → Επιλογή → Επικύρωση → Αποσύνθεση → Διαμόρφωση → Προσαρμογή → Καθαρισμός → Σύνοψη
- **Διαδραστικό Περιβάλλον DevContainer**: Προδιαμορφωμένα εργαλεία και εξαρτήσεις

#### 📚 Δομή Ενοτήτων Εργαστηρίου
Το εργαστήριο ακολουθεί μια **προοδευτική μεθοδολογία 8 ενοτήτων** που σας οδηγεί από την ανακάλυψη μέχρι την τελειότητα στην ανάπτυξη:

| Ενότητα | Θέμα | Τι θα κάνετε | Διάρκεια |
|--------|-------|----------------|----------|
| **0. Εισαγωγή** | Επισκόπηση Εργαστηρίου | Κατανόηση στόχων μάθησης, προαπαιτούμενα και δομή εργαστηρίου | 15 λεπτά |
| **1. Επιλογή** | Ανακάλυψη Προτύπων | Εξερεύνηση προτύπων AZD και επιλογή κατάλληλου προτύπου AI για το σενάριό σας | 20 λεπτά |
| **2. Επικύρωση** | Ανάπτυξη & Επαλήθευση | Ανάπτυξη προτύπου με `azd up` και επικύρωση υποδομής | 30 λεπτά |
| **3. Αποσύνθεση** | Κατανόηση Δομής | Χρήση GitHub Copilot για εξερεύνηση αρχιτεκτονικής προτύπου, αρχείων Bicep και οργάνωσης κώδικα | 30 λεπτά |
| **4. Διαμόρφωση** | Βαθιά Εξέταση azure.yaml | Κυριαρχία στη διαμόρφωση `azure.yaml`, hooks ζωής και μεταβλητές περιβάλλοντος | 30 λεπτά |
| **5. Προσαρμογή** | Κάνε το δικό σου | Ενεργοποίηση AI Search, παρακολούθηση, αξιολόγηση και προσαρμογή στο σενάριό σας | 45 λεπτά |
| **6. Καθαρισμός** | Καθαρισμός | Ασφαλής διαγραφή πόρων με `azd down --purge` | 15 λεπτά |
| **7. Σύνοψη** | Επόμενα Βήματα | Ανασκόπηση επιτευγμάτων, βασικών εννοιών και συνέχιση ταξιδιού μάθησης | 15 λεπτά |

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
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Αποτελέσματα Μάθησης Εργαστηρίου
Με την ολοκλήρωση του εργαστηρίου, οι συμμετέχοντες θα:
- **Αναπτύσσουν Παραγωγικές Εφαρμογές AI**: Χρησιμοποιούν AZD με υπηρεσίες Microsoft Foundry
- **Κατακτούν Αρχιτεκτονικές Πολλαπλών Πρακτόρων**: Υλοποιούν συντονισμένες λύσεις πρακτόρων AI
- **Εφαρμόζουν Βέλτιστες Πρακτικές Ασφαλείας**: Διαμορφώνουν πιστοποίηση και έλεγχο πρόσβασης
- **Βελτιστοποιούν για Κλίμακα**: Σχεδιάζουν οικονομικές και αποδοτικές αναπτύξεις
- **Επιλύουν Προβλήματα Αναπτύξεων**: Λύνουν κοινά ζητήματα αυτόνομα

#### 📖 Πόροι Εργαστηρίου
- **🎥 Διαδραστικός Οδηγός**: [Υλικά Εργαστηρίου](workshop/README.md) - Περιβάλλον μάθησης μέσα σε browser
- **📋 Οδηγίες ανά Ενότητα**:
  - [0. Εισαγωγή](workshop/docs/instructions/0-Introduction.md) - Επισκόπηση και στόχοι εργαστηρίου
  - [1. Επιλογή](workshop/docs/instructions/1-Select-AI-Template.md) - Εύρεση και επιλογή προτύπων AI
  - [2. Επικύρωση](workshop/docs/instructions/2-Validate-AI-Template.md) - Ανάπτυξη και επαλήθευση προτύπων
  - [3. Αποσύνθεση](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Εξερεύνηση αρχιτεκτονικής προτύπου
  - [4. Διαμόρφωση](workshop/docs/instructions/4-Configure-AI-Template.md) - Κυριαρχία στο azure.yaml
  - [5. Προσαρμογή](workshop/docs/instructions/5-Customize-AI-Template.md) - Προσαρμογή στο σενάριό σας
  - [6. Καθαρισμός](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Καθαρισμός πόρων
  - [7. Σύνοψη](workshop/docs/instructions/7-Wrap-up.md) - Ανασκόπηση και επόμενα βήματα
- **🛠️ AI Εργαστήριο**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ασκήσεις επικεντρωμένες σε AI
- **💡 Γρήγορη Εκκίνηση**: [Οδηγός Ρύθμισης Εργαστηρίου](workshop/README.md#quick-start) - Διαμόρφωση περιβάλλοντος

**Ιδανικό για**: Εταιρική εκπαίδευση, πανεπιστημιακά μαθήματα, αυτόνομη μάθηση και προγράμματα ανάπτυξης δεξιοτήτων.

---

## 📖 Βαθιά Κατανόηση: Δυνατότητες AZD

Πέρα από τα βασικά, το AZD προσφέρει ισχυρές δυνατότητες για παραγωγικές αναπτύξεις:

- **Αναπτύξεις με Πρότυπα** - Χρήση προ-χτισμένων προτύπων για κοινά προτύπα εφαρμογών
- **Υποδομή ως Κώδικας** - Διαχείριση πόρων Azure με Bicep ή Terraform  
- **Ενσωματωμένες ροές εργασίας** - Ομαλή παροχή, ανάπτυξη και παρακολούθηση εφαρμογών
- **Φιλικό προς τον προγραμματιστή** - Βελτιστοποιημένο για παραγωγικότητα και εμπειρία προγραμματιστή

### **AZD + Microsoft Foundry: Ιδανικό για Αναπτύξεις AI**

**Γιατί AZD για λύσεις AI;** Το AZD αντιμετωπίζει τις κορυφαίες προκλήσεις των προγραμματιστών AI:

- **Έτοιμα Πρότυπα AI** - Προ-διαμορφωμένα πρότυπα για Microsoft Foundry Models, Azure AI Services και φορτία ML
- **Ασφαλείς Αναπτύξεις AI** - Ένθετα πρότυπα ασφάλειας για υπηρεσίες AI, κλειδιά API και τελικά σημεία μοντέλων  
- **Παραγωγικά Πρότυπα AI** - Βέλτιστες πρακτικές για κλιμακούμενες, οικονομικές αναπτύξεις εφαρμογών AI
- **Ροές εργασίας από άκρο σε άκρο για AI** - Από την ανάπτυξη μοντέλων μέχρι παραγωγική ανάπτυξη με επαρκή παρακολούθηση
- **Βελτιστοποίηση Κόστους** - Έξυπνη κατανομή και κλιμάκωση πόρων για φορτία AI
- **Ενσωμάτωση Microsoft Foundry** - Αδιάλειπτη σύνδεση με τον κατάλογο μοντέλων και τα τελικά σημεία του Microsoft Foundry

---

## 🎯 Βιβλιοθήκη Προτύπων & Παραδειγμάτων

### Επιλεγμένα: Πρότυπα Microsoft Foundry
**Ξεκινήστε εδώ αν αναπτύσσετε εφαρμογές AI!**

> **Σημείωση:** Αυτά τα πρότυπα παρουσιάζουν διάφορα πρότυπα AI. Μερικά είναι εξωτερικά δείγματα Azure, άλλα τοπικές υλοποιήσεις.

| Πρότυπο | Κεφάλαιο | Πολυπλοκότητα | Υπηρεσίες | Τύπος |
|----------|---------|------------|----------|------|
| [**Ξεκινήστε με AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Κεφάλαιο 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Εξωτερικό |
| [**Ξεκινήστε με AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Κεφάλαιο 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Εξωτερικό |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Κεφάλαιο 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Εξωτερικό |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Κεφάλαιο 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Εξωτερικό |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Κεφάλαιο 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Εξωτερικό |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Κεφάλαιο 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Εξωτερικό |
| [**Λύση λιανικής πολλαπλών πρακτόρων**](examples/retail-scenario.md) | Κεφάλαιο 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Τοπικό** |

### Επιλεγμένα: Ολοκληρωμένα Σενάρια Μάθησης
**Πρότυπα εφαρμογών έτοιμα για παραγωγή, αντιστοιχισμένα σε κεφάλαια μάθησης**

| Πρότυπο | Κεφάλαιο Μάθησης | Πολυπλοκότητα | Κύρια Μάθηση |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Κεφάλαιο 2 | ⭐ | Βασικά πρότυπα ανάπτυξης AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Κεφάλαιο 2 | ⭐⭐ | Υλοποίηση RAG με Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Κεφάλαιο 4 | ⭐⭐ | Ενσωμάτωση νοημοσύνης εγγράφων |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Κεφάλαιο 5 | ⭐⭐⭐ | Πλαίσιο πρακτόρων και κλήση συναρτήσεων |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Κεφάλαιο 8 | ⭐⭐⭐ | Επιχειρησιακή ορχήστρωση AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Κεφάλαιο 5 | ⭐⭐⭐⭐ | Αρχιτεκτονική πολλαπλών πρακτόρων με πρακτόρους πελατών και αποθέματος |

### Μάθηση με βάση τον τύπο παραδείγματος

> **📌 Τοπικά vs. Εξωτερικά Παραδείγματα:**  
> **Τοπικά Παραδείγματα** (σε αυτό το αποθετήριο) = Έτοιμα για άμεση χρήση  
> **Εξωτερικά Παραδείγματα** (Azure Samples) = Κλωνοποίηση από συνδεδεμένα αποθετήρια

#### Τοπικά Παραδείγματα (Έτοιμα για Χρήση)
- [**Λύση λιανικής πολλαπλών πρακτόρων**](examples/retail-scenario.md) - Ολοκληρωμένη παραγωγική υλοποίηση με ARM templates
  - Αρχιτεκτονική πολλαπλών πρακτόρων (Πελάτης + Πράκτορες αποθέματος)
  - Ολοκληρωμένη παρακολούθηση και αξιολόγηση
  - Ανάπτυξη με ένα κλικ μέσω ARM template

#### Τοπικά Παραδείγματα - Εφαρμογές Container (Κεφάλαια 2-5)
**Ολοκληρωμένα παραδείγματα ανάπτυξης κοντέινερ σε αυτό το αποθετήριο:**
- [**Παραδείγματα Container App**](examples/container-app/README.md) - Πλήρης οδηγός για αναπτύξεις σε κοντέινερ
  - [Απλό Flask API](../../examples/container-app/simple-flask-api) - Βασικό REST API με κλιμάκωση στο μηδέν
  - [Αρχιτεκτονική Microservices](../../examples/container-app/microservices) - Παραγωγική ανάπτυξη πολυ-υπηρεσιών
  - Γρήγορο ξεκίνημα, παραγωγή και προχωρημένα πρότυπα ανάπτυξης
  - Οδηγίες παρακολούθησης, ασφάλειας και βελτιστοποίησης κόστους

#### Εξωτερικά Παραδείγματα - Απλές Εφαρμογές (Κεφάλαια 1-2)
**Κλωνοποιήστε αυτά τα Azure Samples αποθετήρια για να ξεκινήσετε:**
- [Απλή Web Εφαρμογή - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Βασικά πρότυπα ανάπτυξης
- [Στατική Ιστοσελίδα - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Ανάπτυξη στατικού περιεχομένου
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Ανάπτυξη REST API

#### Εξωτερικά Παραδείγματα - Ενσωμάτωση Βάσης Δεδομένων (Κεφάλαια 3-4)  
- [Εφαρμογή Βάσης Δεδομένων - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Πρότυπα σύνδεσης βάσης δεδομένων
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless ροή δεδομένων

#### Εξωτερικά Παραδείγματα - Προχωρημένα Πρότυπα (Κεφάλαια 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Αρχιτεκτονικές πολυ-υπηρεσιών
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Επεξεργασία στο παρασκήνιο  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Παραγωγικά πρότυπα ML

### Συλλογές Εξωτερικών Προτύπων
- [**Επίσημη Συλλογή Προτύπων AZD**](https://azure.github.io/awesome-azd/) - Επιμελημένη συλλογή επίσημων και κοινοτικών προτύπων
- [**Πρότυπα Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Τεκμηρίωση προτύπων Microsoft Learn
- [**Κατάλογος Παραδειγμάτων**](examples/README.md) - Τοπικά παραδείγματα μάθησης με λεπτομερείς επεξηγήσεις

---

## 📚 Πόροι Μάθησης & Αναφορές

### Γρήγορες Αναφορές
- [**Φύλλο Απάτης Εντολών**](resources/cheat-sheet.md) - Βασικές εντολές azd οργανωμένες κατά κεφάλαιο
- [**Γλωσσάριο**](resources/glossary.md) - Ορολογία Azure και azd  
- [**Συχνές Ερωτήσεις**](resources/faq.md) - Κοινές ερωτήσεις οργανωμένες κατά κεφάλαιο μάθησης
- [**Οδηγός Μελέτης**](resources/study-guide.md) - Περιεκτικές ασκήσεις πρακτικής

### Εργαστήρια Hands-On
- [**Εργαστήριο AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Κάντε τις λύσεις AI σας ικανές για ανάπτυξη με AZD (2-3 ώρες)
- [**Διαδραστικό Εργαστήριο**](workshop/README.md) - Οδηγούμενες ασκήσεις 8 μονάδων με MkDocs και GitHub Codespaces
  - Ακολουθεί: Εισαγωγή → Επιλογή → Επικύρωση → Αποδόμηση → Διαμόρφωση → Προσαρμογή → Αποσυναρμολόγηση → Σύνοψη

### Εξωτερικοί Πόροι Μάθησης
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Κέντρο Αρχιτεκτονικής Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Υπολογιστής Τιμολόγησης Azure](https://azure.microsoft.com/pricing/calculator/)
- [Κατάσταση Azure](https://status.azure.com/)

### Δεξιότητες Πράκτορα AI για τον Επεξεργαστή σας
- [**Δεξιότητες Microsoft Azure στο skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 ανοιχτές δεξιότητες πρακτόρων για Azure AI, Foundry, ανάπτυξη, διαγνωστικά, βελτιστοποίηση κόστους, και άλλα. Εγκαταστήστε τα σε GitHub Copilot, Cursor, Claude Code ή σε οποιονδήποτε υποστηριζόμενο πράκτορα:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Γρήγορος Οδηγός Επίλυσης Προβλημάτων

**Συνήθη προβλήματα που αντιμετωπίζουν οι αρχάριοι και άμεσες λύσεις:**

<details>
<summary><strong>❌ "azd: εντολή δεν βρέθηκε"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "Δεν βρέθηκε συνδρομή" ή "Η συνδρομή δεν ορίστηκε"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" ή "Περιορισμός υπερβήθηκε"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" αποτυγχάνει στη μέση της διαδικασίας</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Απέτυχε η ταυτοποίηση" ή "Λήξη token"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Ο πόρος υπάρχει ήδη" ή διενέξεις ονοματοδοσίας</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Η ανάπτυξη προτύπου διαρκεί πολύ</strong></summary>

**Κανονικοί χρόνοι αναμονής:**
- Απλή web εφαρμογή: 5-10 λεπτά
- Εφαρμογή με βάση δεδομένων: 10-15 λεπτά
- Εφαρμογές AI: 15-25 λεπτά (Η παροχή OpenAI είναι αργή)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Άρνηση άδειας" ή "Απαγορεύεται"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Δεν μπορεί να βρεθεί το URL της αναπτυγμένης εφαρμογής</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Πλήρεις Πόροι Επίλυσης Προβλημάτων

- **Οδηγός Συνήθων Προβλημάτων:** [Λεπτομερείς Λύσεις](docs/chapter-07-troubleshooting/common-issues.md)
- **Προβλήματα AI:** [Επίλυση Προβλημάτων AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Οδηγός Εντοπισμού Σφαλμάτων:** [Βήμα προς Βήμα Εντοπισμός Σφαλμάτων](docs/chapter-07-troubleshooting/debugging.md)
- **Λάβετε Βοήθεια:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ολοκλήρωση Μαθήματος & Πιστοποίηση

### Παρακολούθηση Προόδου
Παρακολουθήστε την πρόοδο μάθησής σας μέσω κάθε κεφαλαίου:

- [ ] **Κεφάλαιο 1**: Βάση & Γρήγορη Εκκίνηση ✅
- [ ] **Κεφάλαιο 2**: Ανάπτυξη με Προτεραιότητα στο AI ✅  
- [ ] **Κεφάλαιο 3**: Διαμόρφωση & Ταυτοποίηση ✅
- [ ] **Κεφάλαιο 4**: Υποδομή ως Κώδικας & Ανάπτυξη ✅
- [ ] **Κεφάλαιο 5**: Λύσεις Πολυπρακτόρων AI ✅
- [ ] **Κεφάλαιο 6**: Επιβεβαίωση & Σχεδιασμός Προ-Ανάπτυξης ✅
- [ ] **Κεφάλαιο 7**: Επίλυση Προβλημάτων & Εντοπισμός Σφαλμάτων ✅
- [ ] **Κεφάλαιο 8**: Παραγωγικά & Επιχειρηματικά Πρότυπα ✅

### Επαλήθευση Μάθησης
Μετά την ολοκλήρωση κάθε κεφαλαίου, επαληθεύστε τις γνώσεις σας κάνοντας:
1. **Πρακτική Άσκηση**: Ολοκληρώστε την εφαρμογή του κεφαλαίου
2. **Έλεγχος Γνώσεων**: Ανασκόπηση της ενότητας Συχνών Ερωτήσεων για το κεφάλαιο σας
3. **Συζήτηση στην Κοινότητα**: Μοιραστείτε την εμπειρία σας στο Azure Discord
4. **Επόμενο Κεφάλαιο**: Προχωρήστε στο επόμενο επίπεδο πολυπλοκότητας

### Οφέλη Ολοκλήρωσης Μαθήματος
Μετά την ολοκλήρωση όλων των κεφαλαίων, θα έχετε:
- **Εμπειρία Παραγωγής**: Αναπτύξει πραγματικές εφαρμογές AI στο Azure
- **Επαγγελματικές Δεξιότητες**: Δυνατότητες ανάπτυξης έτοιμης για την επιχείρηση  
- **Αναγνώριση Κοινότητας**: Ενεργό μέλος της κοινότητας προγραμματιστών Azure
- **Επαγγελματική Ανάπτυξη**: Απαραίτητη εμπειρογνωμοσύνη AZD και ανάπτυξης AI

---

## 🤝 Κοινότητα & Υποστήριξη

### Λάβετε Βοήθεια & Υποστήριξη
- **Τεχνικά Ζητήματα**: [Αναφορά σφαλμάτων και αιτήσεων χαρακτηριστικών](https://github.com/microsoft/azd-for-beginners/issues)
- **Ερωτήσεις Μάθησης**: [Κοινότητα Microsoft Azure Discord](https://discord.gg/microsoft-azure) και [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Βοήθεια για AI**: Ενταχθείτε στο [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Τεκμηρίωση**: [Επίσημη τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Απόψεις της Κοινότητας από το Microsoft Foundry Discord

**Πρόσφατα αποτελέσματα δημοσκόπησης από το κανάλι #Azure:**
- **45%** των προγραμματιστών θέλουν να χρησιμοποιούν AZD για εργασίες AI
- **Κύρια προβλήματα**: Ανάπτυξη πολλαπλών υπηρεσιών, διαχείριση διαπιστευτηρίων, ετοιμότητα παραγωγής  
- **Πιο ζητούμενα**: Πρότυπα ειδικά για AI, οδηγοί επίλυσης προβλημάτων, βέλτιστες πρακτικές

**Ενταχθείτε στην κοινότητά μας για:**
- Μοιραστείτε τις εμπειρίες σας με AZD + AI και λάβετε βοήθεια
- Πρόσβαση σε πρώιμες προεπισκοπήσεις νέων προτύπων AI
- Συνεισφορά στις βέλτιστες πρακτικές ανάπτυξης AI
- Επηρεάστε μελλοντική ανάπτυξη χαρακτηριστικών AI + AZD

### Συνεισφορά στο Μάθημα
Καλωσορίζουμε τις συνεισφορές! Παρακαλούμε διαβάστε τον [Οδηγό Συνεισφοράς](CONTRIBUTING.md) για λεπτομέρειες σχετικά με:
- **Βελτιώσεις Περιεχομένου**: Βελτιώστε υπάρχοντα κεφάλαια και παραδείγματα
- **Νέα Παραδείγματα**: Προσθέστε σενάρια και πρότυπα πραγματικού κόσμου  
- **Μετάφραση**: Βοηθήστε στη διατήρηση της υποστήριξης πολλών γλωσσών
- **Αναφορές Σφαλμάτων**: Βελτιώστε την ακρίβεια και την σαφήνεια
- **Πρότυπα Κοινότητας**: Ακολουθήστε τις συμπεριληπτικές οδηγίες της κοινότητας

---

## 📄 Πληροφορίες Μαθήματος

### Άδεια Χρήσης
Το έργο αυτό είναι αδειοδοτημένο υπό την άδεια MIT - δείτε το αρχείο [LICENSE](../../LICENSE) για λεπτομέρειες.

### Σχετικοί Πόροι Μάθησης της Microsoft

Η ομάδα μας παράγει άλλα ολοκληρωμένα μαθήματα μάθησης:

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
[![Πράκτορες AI για Αρχάριους](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Σειρά Γενετικής AI
[![Γενετική AI για Αρχάριους](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Γενετική AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Γενετική AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Γενετική AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Βασική Μάθηση
[![ML για Αρχάριους](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Επιστήμη Δεδομένων για Αρχάριους](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI για Αρχάριους](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Κυβερνοασφάλεια για Αρχάριους](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Ανάπτυξη Ιστού για Αρχάριους](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT για Αρχάριους](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Ανάπτυξη XR για Αρχάριους](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Σειρά Copilot
[![Copilot για Προγραμματισμό AI σε Ζευγάρι](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot για C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Περιπέτεια Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Πλοήγηση Μαθήματος

**🚀 Έτοιμοι να Ξεκινήσετε τη Μάθηση;**

**Αρχάριοι**: Ξεκινήστε με το [Κεφάλαιο 1: Βάση & Γρήγορη Εκκίνηση](#-chapter-1-foundation--quick-start)  
**Προγραμματιστές AI**: Μεταβείτε στο [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στο AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Έμπειροι Προγραμματιστές**: Ξεκινήστε με το [Κεφάλαιο 3: Διαμόρφωση & Ταυτοποίηση](#️-chapter-3-configuration--authentication)

**Επόμενα Βήματα**: [Ξεκινήστε το Κεφάλαιο 1 - Βασικά AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->