# AZD για Αρχάριους: Ένα Δομημένο Ταξίδι Μάθησης

![AZD-για-αρχάριους](../../translated_images/el/azdbeginners.5527441dd9f74068.webp) 

[![Παρατηρητές GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks στο GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Αστέρια GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord του Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Αυτόματες Μεταφράσεις (Πάντα Ενημερωμένες)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Αραβικά](../ar/README.md) | [Μπενγκάλι](../bn/README.md) | [Βουλγαρικά](../bg/README.md) | [Βιρμανικά (Μιανμάρ)](../my/README.md) | [Κινέζικα (Απλοποιημένα)](../zh-CN/README.md) | [Κινέζικα (Παραδοσιακά, Χονγκ Κονγκ)](../zh-HK/README.md) | [Κινέζικα (Παραδοσιακά, Μακάο)](../zh-MO/README.md) | [Κινέζικα (Παραδοσιακά, Ταϊβάν)](../zh-TW/README.md) | [Κροατικά](../hr/README.md) | [Τσεχικά](../cs/README.md) | [Δανικά](../da/README.md) | [Ολλανδικά](../nl/README.md) | [Εσθονικά](../et/README.md) | [Φινλανδικά](../fi/README.md) | [Γαλλικά](../fr/README.md) | [Γερμανικά](../de/README.md) | [Ελληνικά](./README.md) | [Εβραϊκά](../he/README.md) | [Χίντι](../hi/README.md) | [Ουγγρικά](../hu/README.md) | [Ινδονησιακά](../id/README.md) | [Ιταλικά](../it/README.md) | [Ιαπωνικά](../ja/README.md) | [Κανάντα](../kn/README.md) | [Χμερ](../km/README.md) | [Κορεατικά](../ko/README.md) | [Λιθουανικά](../lt/README.md) | [Μαλαιικά](../ms/README.md) | [Μαλαγιαλάμ](../ml/README.md) | [Μαραθικά](../mr/README.md) | [Νεπαλικά](../ne/README.md) | [Νιγηριανή Πινγκίν](../pcm/README.md) | [Νορβηγικά](../no/README.md) | [Περσικά (Φαρσί)](../fa/README.md) | [Πολωνικά](../pl/README.md) | [Πορτογαλικά (Βραζιλία)](../pt-BR/README.md) | [Πορτογαλικά (Πορτογαλία)](../pt-PT/README.md) | [Πουντζαμπί (Γκουρμούκι)](../pa/README.md) | [Ρουμανικά](../ro/README.md) | [Ρωσικά](../ru/README.md) | [Σερβικά (Κυριλλικά)](../sr/README.md) | [Σλοβάκικα](../sk/README.md) | [Σλοβενικά](../sl/README.md) | [Ισπανικά](../es/README.md) | [Σουαχίλι](../sw/README.md) | [Σουηδικά](../sv/README.md) | [Ταγκάλογκ (Φιλιππινέζικα)](../tl/README.md) | [Ταμίλ](../ta/README.md) | [Τελούγκου](../te/README.md) | [Ταϊλανδέζικα](../th/README.md) | [Τουρκικά](../tr/README.md) | [Ουκρανικά](../uk/README.md) | [Ουρντού](../ur/README.md) | [Βιετναμέζικα](../vi/README.md)

> **Προτιμάτε να κλωνοποιήσετε τοπικά;**
>
> Αυτό το αποθετήριο περιλαμβάνει πάνω από 50 μεταφράσεις, κάτι που αυξάνει σημαντικά το μέγεθος λήψης. Για να κλωνοποιήσετε χωρίς τις μεταφράσεις, χρησιμοποιήστε sparse checkout:
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

## 🆕 Τι Νέο στο azd Σήμερα

> 📌 Αυτό το μάθημα έχει επικυρωθεί με **`azd 1.25.6`** (Ιούνιος 2026). Εκτελέστε `azd version` για να ελέγξετε την έκδοσή σας, και `azd upgrade` για να λάβετε την τελευταία.

Το Azure Developer CLI έχει εξελιχθεί πέρα από τις παραδοσιακές web εφαρμογές και τα APIs. Σήμερα, το azd είναι το ενιαίο εργαλείο για την ανάπτυξη **οποιασδήποτε** εφαρμογής στο Azure — συμπεριλαμβανομένων εφαρμογών με τεχνητή νοημοσύνη και ευφυών πρακτόρων.

Τι σημαίνει αυτό για εσάς:

- **Οι πράκτορες AI είναι πλέον κύρια φορτία εργασίας στο azd.** Μπορείτε να αρχικοποιήσετε, να αναπτύξετε και να διαχειριστείτε έργα πρακτόρων AI χρησιμοποιώντας την ίδια ροή εργασίας `azd init` → `azd up` που ήδη γνωρίζετε.
- **Πλήρης κύκλος ζωής πράκτορα από το CLI.** Η επέκταση `azure.ai.agents` καλύπτει τώρα ολόκληρο το ταξίδι — `azd ai agent init` για δημιουργία σκελετού, `azd ai agent invoke` για δοκιμή (με έξοδο χρονισμού απόκρισης), `azd ai agent eval generate` και `azd ai agent optimize` για μέτρηση και βελτίωση της ποιότητας, και `azd ai agent delete` για καθαρισμό.
- **Περισσότερα δομικά στοιχεία AI.** Νέες προεπισκοπικές επεκτάσεις — `azure.ai.skills` και `azure.ai.connections` — σας επιτρέπουν να διαχειρίζεστε επαναχρησιμοποιήσιμες δεξιότητες πρακτόρων και συνδέσεις Foundry απευθείας με το azd.
- **Η ενσωμάτωση με το Microsoft Foundry** φέρνει την ανάπτυξη μοντέλων, τη φιλοξενία πρακτόρων και τη διαμόρφωση υπηρεσιών AI άμεσα στο οικοσύστημα προτύπων azd.
- **Ομαλότερα καθημερινά βασικά.** Οι πρόσφατες εκδόσεις έκαναν το `azd init` ασφαλές για επανεκτέλεση, έκαναν το `azd auth login` να καθαρίζει αυτόματα παλιούς tokens, και πρόσθεσαν μια φιλική προτροπή ρύθμισης πρώτης εκτέλεσης για το `azd tool`.
- **Η βασική ροή εργασίας δεν έχει αλλάξει.** Είτε αναπτύσσετε μια εφαρμογή todo, μια μικρο-υπηρεσία, είτε μια λύση πολλαπλών πρακτόρων AI, οι εντολές είναι οι ίδιες.

> **Σημείωση για χρήστες Aspire:** Η Microsoft πλέον αναφέρεται στο προϊόν απλώς ως **Aspire** (παλαιότερα «.NET Aspire»). Η υποστήριξη Aspire στο azd παραμένει αμετάβλητη — μόνο το όνομα ενημερώθηκε.

Αν έχετε χρησιμοποιήσει το azd πριν, η υποστήριξη AI είναι μια φυσική επέκταση — όχι ένα ξεχωριστό εργαλείο ή ένας προχωρημένος κλάδος. Αν ξεκινάτε από την αρχή, θα μάθετε μια ροή εργασίας που λειτουργεί για τα πάντα.

---

## 🚀 Τι είναι το Azure Developer CLI (azd);

**Azure Developer CLI (azd)** είναι ένα φιλικό προς τους προγραμματιστές εργαλείο γραμμής εντολών που καθιστά απλή την ανάπτυξη εφαρμογών στο Azure. Αντί να δημιουργείτε και να συνδέετε χειροκίνητα δεκάδες πόρους Azure, μπορείτε να αναπτύξετε ολόκληρες εφαρμογές με μία εντολή.

### Η μαγεία του `azd up`

```bash
# Αυτή η εντολή κάνει τα πάντα:
# ✅ Δημιουργεί όλους τους πόρους Azure
# ✅ Ρυθμίζει το δίκτυο και την ασφάλεια
# ✅ Δημιουργεί τον κώδικα της εφαρμογής σας
# ✅ Αναπτύσσει στο Azure
# ✅ Σας δίνει μια λειτουργική διεύθυνση URL
azd up
```

**Αυτό ήταν!** Χωρίς κλικ στο Azure Portal, χωρίς πολύπλοκα ARM templates που πρέπει να μάθετε πρώτα, χωρίς χειροκίνητη διαμόρφωση - μόνο λειτουργικές εφαρμογές στο Azure.

---

## ❓ Azure Developer CLI έναντι Azure CLI: Ποια είναι η Διαφορά;

Αυτή είναι η πιο συνηθισμένη ερώτηση που κάνουν οι αρχάριοι. Να η απλή απάντηση:

| Χαρακτηριστικό | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Σκοπός** | Διαχείριση μεμονωμένων πόρων Azure | Ανάπτυξη ολοκληρωμένων εφαρμογών |
| **Νοοτροπία** | Εστίαση στην υποδομή | Εστίαση στην εφαρμογή |
| **Παράδειγμα** | `az webapp create --name myapp...` | `azd up` |
| **Καμπύλη Μάθησης** | Πρέπει να γνωρίζετε τις υπηρεσίες Azure | Αρκεί να γνωρίζετε την εφαρμογή σας |
| **Καλύτερο για** | DevOps, Υποδομή | Προγραμματιστές, Πρωτοτυποποίηση |

### Απλή Αναλογία

- **Azure CLI** είναι σαν να έχετε όλα τα εργαλεία για να χτίσετε ένα σπίτι - σφυριά, πριόνια, καρφιά. Μπορείτε να κατασκευάσετε οτιδήποτε, αλλά πρέπει να ξέρετε την κατασκευή.
- **Azure Developer CLI** είναι σαν να προσλαμβάνετε έναν εργολάβο - περιγράφετε τι θέλετε, και αυτός αναλαμβάνει την κατασκευή.

### Πότε να Χρησιμοποιήσετε Κάθε Ένα

| Σενάριο | Χρησιμοποιήστε αυτό |
|----------|----------|
| "Θέλω να αναπτύξω την web εφαρμογή μου γρήγορα" | `azd up` |
| "Χρειάζομαι μόνο να δημιουργήσω έναν λογαριασμό αποθήκευσης" | `az storage account create` |
| "Δημιουργώ μια πλήρη εφαρμογή AI" | `azd init --template azure-search-openai-demo` |
| "Χρειάζεται να εντοπίσω σφάλματα σε έναν συγκεκριμένο πόρο Azure" | `az resource show` |
| "Θέλω ανάπτυξη έτοιμη για παραγωγή σε λίγα λεπτά" | `azd up --environment production` |

### Δουλεύουν Μαζί!

Το AZD χρησιμοποιεί το Azure CLI από κάτω. Μπορείτε να χρησιμοποιήσετε και τα δύο:
```bash
# Αναπτύξτε την εφαρμογή σας με το AZD
azd up

# Στη συνέχεια ρυθμίστε συγκεκριμένους πόρους με το Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Βρείτε Πρότυπα στο Awesome AZD

Μην ξεκινάτε από το μηδέν! Το **Awesome AZD** είναι η κοινότητα συλλογής προτύπων έτοιμων για ανάπτυξη:

| Πόρος | Περιγραφή |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Περιηγηθείτε σε 200+ πρότυπα με ανάπτυξη με ένα κλικ |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Συνεισφέρετε το δικό σας πρότυπο στην κοινότητα |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Κάντε star και εξερευνήστε τον κώδικα πηγής |

### Δημοφιλή Πρότυπα AI από το Awesome AZD

```bash
# Συνομιλία RAG με τα μοντέλα Microsoft Foundry + Αναζήτηση AI
azd init --template azure-search-openai-demo

# Γρήγορη εφαρμογή συνομιλίας AI
azd init --template openai-chat-app-quickstart

# Πράκτορες AI με πράκτορες Foundry
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

If any required check fails, fix that first and then continue with the quick start.

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

### Βήμα 2: Πιστοποίηση για το AZD

```bash
# Προαιρετικό αν σκοπεύετε να χρησιμοποιήσετε εντολές Azure CLI απευθείας σε αυτό το μάθημα
az login

# Απαραίτητο για ροές εργασίας AZD
azd auth login
```

If you are not sure which one you need, follow the full setup flow in [Εγκατάσταση & Ρύθμιση](docs/chapter-01-foundation/installation.md#authentication-setup).

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

Αυτό το μάθημα είναι σχεδιασμένο για **προοδευτική μάθηση** - ξεκινήστε από εκεί που είστε άνετοι και προχωρήστε προς τα πάνω:

| Η Εμπειρία Σας | Ξεκινήστε Εδώ |
|-----------------|------------|
| **Τελείως νέος στο Azure** | [Κεφάλαιο 1: Θεμέλια](#-chapter-1-foundation--quick-start) |
| **Γνωρίζετε το Azure, νέος στο AZD** | [Κεφάλαιο 1: Θεμέλια](#-chapter-1-foundation--quick-start) |
| **Θέλετε να αναπτύξετε εφαρμογές AI** | [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα το AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Θέλετε πρακτική εξάσκηση** | [🎓 Διαδραστικό Εργαστήριο](workshop/README.md) - καθοδηγούμενο εργαστήριο 3-4 ωρών |
| **Χρειάζεστε πρότυπα για παραγωγή** | [Κεφάλαιο 8: Παραγωγή & Επιχειρησιακά](#-chapter-8-production--enterprise-patterns) |

### Γρήγορη Ρύθμιση

1. **Κάντε Fork Αυτό το Αποθετήριο**: [![Forks στο GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Κλωνοποιήστε το**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Λάβετε Βοήθεια**: [Κοινότητα Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Προτιμάτε να κλωνοποιήσετε τοπικά?**
>
> Αυτό το αποθετήριο περιλαμβάνει πάνω από 50 μεταφράσεις, κάτι που αυξάνει σημαντικά το μέγεθος λήψης. Για να κλωνοποιήσετε χωρίς τις μεταφράσεις, χρησιμοποιήστε sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Αυτό σας δίνει όλα όσα χρειάζεστε για να ολοκληρώσετε το μάθημα με πολύ πιο γρήγορη λήψη.


## Επισκόπηση Μαθήματος

Κατακτήστε το Azure Developer CLI (azd) μέσα από δομημένα κεφάλαια σχεδιασμένα για προοδευτική μάθηση. **Ειδική έμφαση στην ανάπτυξη εφαρμογών AI με ενσωμάτωση στο Microsoft Foundry.**
### Γιατί αυτό το μάθημα είναι απαραίτητο για τους σύγχρονους προγραμματιστές

Βάσει των πληροφοριών της κοινότητας Microsoft Foundry στο Discord, **το 45% των προγραμματιστών θέλει να χρησιμοποιήσει το AZD για εργασίες AI** αλλά αντιμετωπίζει προκλήσεις με:
- Σύνθετες αρχιτεκτονικές πολλαπλών υπηρεσιών για AI
- Καλές πρακτικές ανάπτυξης AI σε παραγωγή  
- Ενσωμάτωση και διαμόρφωση υπηρεσιών Azure AI
- Βελτιστοποίηση κόστους για εργασίες AI
- Επίλυση σφαλμάτων ειδικών για αναπτύξεις AI

### Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του δομημένου μαθήματος, θα:
- **Κατακτήσετε τα Θεμελιώδη του AZD**: Βασικές έννοιες, εγκατάσταση και ρύθμιση
- **Αναπτύξετε Εφαρμογές AI**: Χρησιμοποιώντας το AZD με υπηρεσίες Microsoft Foundry
- **Εφαρμόσετε Υποδομή ως Κώδικα**: Διαχείριση πόρων Azure με templates Bicep
- **Αντιμετωπίσετε Σφάλματα Αναπτύξεων**: Επίλυση κοινών προβλημάτων και αποσφαλμάτωση
- **Βελτιστοποιήσετε για Παραγωγή**: Ασφάλεια, κλιμάκωση, παρακολούθηση και διαχείριση κόστους
- **Κατασκευάσετε Πολυ-Πρακτορικές Λύσεις**: Ανάπτυξη σύνθετων αρχιτεκτονικών AI

## Πριν Ξεκινήσετε: Λογαριασμοί, Πρόσβαση και Υποθέσεις

Πριν ξεκινήσετε το Κεφάλαιο 1, βεβαιωθείτε ότι έχετε τα εξής. Τα βήματα εγκατάστασης πιο κάτω σε αυτόν τον οδηγό υποθέτουν ότι αυτά τα βασικά έχουν ήδη διευθετηθεί.

- **Ένα συνδρομητικό λογαριασμό Azure**: Μπορείτε να χρησιμοποιήσετε υπάρχουσα συνδρομή από την εργασία σας ή τον προσωπικό σας λογαριασμό, ή να δημιουργήσετε μια [free trial](https://aka.ms/azurefreetrial) για να ξεκινήσετε.
- **Δικαιώματα δημιουργίας πόρων στο Azure**: Για τις περισσότερες ασκήσεις, θα πρέπει να έχετε τουλάχιστον πρόσβαση **Contributor** στη στοχευόμενη συνδρομή ή στο resource group. Κάποια κεφάλαια ενδέχεται επίσης να υποθέτουν ότι μπορείτε να δημιουργήσετε resource groups, διαχειριζόμενες ταυτότητες και αναθέσεις RBAC.
- [**Ένας λογαριασμός GitHub**](https://github.com): Αυτό είναι χρήσιμο για το fork του αποθετηρίου, την παρακολούθηση των αλλαγών σας και τη χρήση του GitHub Codespaces για το εργαστήριο.
- **Προαπαιτούμενα χρόνου εκτέλεσης προτύπου**: Κάποια πρότυπα χρειάζονται τοπικά εργαλεία όπως Node.js, Python, Java ή Docker. Εκτελέστε τον validator εγκατάστασης πριν ξεκινήσετε ώστε να εντοπίσετε νωρίς τα ελλείποντα εργαλεία.
- **Βασική εξοικείωση με τερματικό**: Δεν χρειάζεται να είστε ειδικός, αλλά θα πρέπει να είστε άνετοι στην εκτέλεση εντολών όπως `git clone`, `azd auth login`, και `azd up`.

> **Εργάζεστε σε συνδρομή επιχείρησης;**
> Εάν το περιβάλλον Azure σας διαχειρίζεται από διαχειριστή, επιβεβαιώστε εγκαίρως ότι μπορείτε να αναπτύξετε πόρους στη συνδρομή ή στο resource group που σκοπεύετε να χρησιμοποιήσετε. Εάν όχι, ζητήστε μια sandbox συνδρομή ή πρόσβαση Contributor πριν ξεκινήσετε.

> **Νέος στο Azure;**
> Ξεκινήστε με τη δική σας δοκιμαστική συνδρομή Azure ή συνδρομή pay-as-you-go στο https://aka.ms/azurefreetrial ώστε να μπορείτε να ολοκληρώσετε τις ασκήσεις από άκρο σε άκρο χωρίς να περιμένετε εγκρίσεις σε επίπεδο tenant.

## 🗺️ Χάρτης Μαθήματος: Γρήγορη Πλοήγηση ανά Κεφάλαιο

Κάθε κεφάλαιο έχει ένα αποκλειστικό README με στόχους μάθησης, γρήγορα ξεκινήματα και ασκήσεις:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Ξεκινώντας | [Βασικά του AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Εγκατάσταση](docs/chapter-01-foundation/installation.md) &#124; [Πρώτο Έργο](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | Εφαρμογές με προτεραιότητα AI | [Ενσωμάτωση Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Ανάπτυξη Μοντέλου](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Εργαστήριο](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Πιστοποίηση & Ασφάλεια | [Διαμόρφωση](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | Υποδομή ως Κώδικας & Ανάπτυξη | [Οδηγός Ανάπτυξης](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Λύσεις Πρακτόρων AI | [Σενάριο Λιανικής](examples/retail-scenario.md) &#124; [Σχήματα Συντονισμού](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Σχεδιασμός & Επαλήθευση | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Εντοπισμός Σφαλμάτων & Διόρθωση | [Συνήθη Προβλήματα](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Αποσφαλμάτωση](docs/chapter-07-troubleshooting/debugging.md) &#124; [Προβλήματα AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Επιχειρησιακά Πρότυπα | [Πρακτικές Παραγωγής](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Εργαστήριο | [Εισαγωγή](workshop/docs/instructions/0-Introduction.md) &#124; [Επιλογή](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Επαλήθευση](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Αποδόμηση](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Διαμόρφωση](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Προσαρμογή](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Αποσυναρμολόγηση Υποδομής](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Ολοκλήρωση](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Συνολική Διάρκεια Μαθήματος:** ~10-14 hours | **Εξέλιξη Δεξιοτήτων:** Beginner → Production-Ready

---

## 📚 Κεφάλαια Μάθησης

*Επιλέξτε τη διαδρομή μάθησής σας με βάση το επίπεδο εμπειρίας και τους στόχους*

### 🚀 Κεφάλαιο 1: Θεμέλιο & Γρήγορη Εκκίνηση
**Προαπαιτούμενα**: Συνδρομή Azure, βασικές γνώσεις γραμμής εντολών  
**Διάρκεια**: 30-45 λεπτά  
**Πολυπλοκότητα**: ⭐

#### Τι θα Μάθετε
- Κατανόηση των βασικών του Azure Developer CLI
- Εγκατάσταση του AZD στην πλατφόρμα σας
- Η πρώτη σας επιτυχημένη ανάπτυξη

#### Πόροι Μάθησης
- **🎯 Ξεκινήστε Εδώ**: [Τι είναι το Azure Developer CLI;](#what-is-azure-developer-cli)
- **📖 Θεωρία**: [Βασικά του AZD](docs/chapter-01-foundation/azd-basics.md) - Βασικές έννοιες και ορολογία
- **⚙️ Εγκατάσταση**: [Εγκατάσταση & Ρύθμιση](docs/chapter-01-foundation/installation.md) - Οδηγοί ανά πλατφόρμα
- **🛠️ Πρακτικά**: [Το πρώτο σας έργο](docs/chapter-01-foundation/first-project.md) - Βήμα-βήμα tutorial
- **📋 Γρήγορη Αναφορά**: [Πίνακας εντολών](resources/cheat-sheet.md)

#### Πρακτικές Ασκήσεις
```bash
# Γρήγορος έλεγχος εγκατάστασης
azd version

# Αναπτύξτε την πρώτη σας εφαρμογή
azd init --template todo-nodejs-mongo
azd up
```

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε με επιτυχία μια απλή web εφαρμογή στο Azure χρησιμοποιώντας το AZD

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
**📈 Επίπεδο Δεξιοτήτων Μετά:** Μπορεί να αναπτύσσει βασικές εφαρμογές ανεξάρτητα

---

### 🤖 Κεφάλαιο 2: AI-First Development (Συνιστάται για Προγραμματιστές AI)
**Προαπαιτούμενα**: Ολοκληρωμένο το Κεφάλαιο 1  
**Διάρκεια**: 1-2 ώρες  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα Μάθετε
- Ενσωμάτωση Microsoft Foundry με AZD
- Ανάπτυξη εφαρμογών με τεχνητή νοημοσύνη
- Κατανόηση των ρυθμίσεων υπηρεσιών AI

#### Πόροι Μάθησης
- **🎯 Ξεκινήστε Εδώ**: [Ενσωμάτωση Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [Οδηγός AI Agents](docs/chapter-02-ai-development/agents.md) - Ανάπτυξη ευφυών πρακτόρων με AZD
- **📖 Σχήματα**: [Ανάπτυξη Μοντέλου AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Ανάπτυξη και διαχείριση μοντέλων AI
- **🛠️ Εργαστήριο**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Κάντε τις λύσεις AI έτοιμες για AZD
- **🎥 Διαδραστικός Οδηγός**: [Workshop Materials](workshop/README.md) - Μάθηση μέσω προγράμματος περιήγησης με MkDocs * DevContainer Environment
- **📋 Πρότυπα**: [Microsoft Foundry Templates](#πόροι-εργαστηρίου)
- **📝 Παραδείγματα**: [Παραδείγματα ανάπτυξης AZD](examples/README.md)

#### Πρακτικές Ασκήσεις
```bash
# Αναπτύξτε την πρώτη σας εφαρμογή τεχνητής νοημοσύνης
azd init --template azure-search-openai-demo
azd up

# Δοκιμάστε επιπλέον πρότυπα τεχνητής νοημοσύνης
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε και διαμορφώστε μια εφαρμογή chat με δυνατότητες RAG

**✅ Επιβεβαίωση Επιτυχίας:**
```bash
# Μετά το Κεφάλαιο 2, θα πρέπει να μπορείτε να:
azd init --template azure-search-openai-demo
azd up
# Δοκιμάσετε τη διεπαφή συνομιλίας της τεχνητής νοημοσύνης
# Κάνετε ερωτήσεις και λαμβάνετε απαντήσεις από την Τεχνητή Νοημοσύνη με πηγές
# Επαληθεύσετε ότι η ενσωμάτωση αναζήτησης λειτουργεί
azd monitor  # Ελέγξετε ότι το Application Insights εμφανίζει τηλεμετρία
azd down --force --purge
```

**📊 Χρόνος Επένδυσης:** 1-2 ώρες  
**📈 Επίπεδο Δεξιοτήτων Μετά:** Μπορεί να αναπτύσσει και να διαμορφώνει εφαρμογές AI έτοιμες για παραγωγή  
**💰 Ενημέρωση για Κόστη:** Κατανόηση κόστους ανάπτυξης $80-150/μήνα, κόστους παραγωγής $300-3,500/μήνα

#### 💰 Θεωρήσεις Κόστους για Αναπτύξεις AI

**Περιβάλλον Ανάπτυξης (Εκτιμώμενο $80-150/μήνα):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/μήνα (με βάση τη χρήση tokens)
- AI Search (Basic tier): $75/μήνα
- Container Apps (Consumption): $0-20/μήνα
- Storage (Standard): $1-5/μήνα

**Περιβάλλον Παραγωγής (Εκτιμώμενο $300-3,500+/μήνα):**
- Microsoft Foundry Models (PTU για συνεπή απόδοση): $3,000+/μήνα Ή Pay-as-go με μεγάλο όγκο
- AI Search (Standard tier): $250/μήνα
- Container Apps (Dedicated): $50-100/μήνα
- Application Insights: $5-50/μήνα
- Storage (Premium): $10-50/μήνα

**💡 Συμβουλές Βελτιστοποίησης Κόστους:**
- Χρησιμοποιήστε **Free Tier** Microsoft Foundry Models για μάθηση (Azure OpenAI 50,000 tokens/μήνα συμπεριλαμβάνονται)
- Εκτελέστε `azd down` για να απελευθερώσετε πόρους όταν δεν αναπτύσσετε ενεργά
- Ξεκινήστε με χρέωση βάσει κατανάλωσης, αναβαθμίστε σε PTU μόνο για παραγωγή
- Χρησιμοποιήστε `azd provision --preview` για να εκτιμήσετε τα κόστη πριν την ανάπτυξη
- Ενεργοποιήστε auto-scaling: πληρώνετε μόνο για την πραγματική χρήση

**Παρακολούθηση Κόστους:**
```bash
# Ελέγξτε τα εκτιμώμενα μηνιαία κόστη
azd provision --preview

# Παρακολουθήστε τα πραγματικά κόστη στο Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Κεφάλαιο 3: Διαμόρφωση & Πιστοποίηση
**Προαπαιτούμενα**: Ολοκληρωμένο το Κεφάλαιο 1  
**Διάρκεια**: 45-60 λεπτά  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα Μάθετε
- Διαμόρφωση και διαχείριση περιβαλλόντων
- Καλές πρακτικές πιστοποίησης και ασφάλειας
- Ονομασία και οργάνωση πόρων

#### Πόροι Μάθησης
- **📖 Διαμόρφωση**: [Οδηγός Διαμόρφωσης](docs/chapter-03-configuration/configuration.md) - Ρύθμιση περιβάλλοντος
- **🔐 Ασφάλεια**: [Πρότυπα πιστοποίησης και διαχειριζόμενη ταυτότητα](docs/chapter-03-configuration/authsecurity.md) - Πρότυπα πιστοποίησης
- **📝 Παραδείγματα**: [Παράδειγμα Εφαρμογής Βάσης Δεδομένων](examples/database-app/README.md) - Παραδείγματα AZD για βάσεις δεδομένων

#### Πρακτικές Ασκήσεις
- Διαμορφώστε πολλαπλά περιβάλλοντα (dev, staging, prod)
- Ρυθμίστε πιστοποίηση με διαχειριζόμενη ταυτότητα
- Εφαρμόστε ρυθμίσεις συγκεκριμένες για κάθε περιβάλλον

**💡 Αποτέλεσμα Κεφαλαίου**: Διαχειριστείτε πολλαπλά περιβάλλοντα με σωστή πιστοποίηση και ασφάλεια

---

### 🏗️ Κεφάλαιο 4: Υποδομή ως Κώδικας & Ανάπτυξη
**Προαπαιτούμενα**: Ολοκληρωμένα τα Κεφάλαια 1-3  
**Διάρκεια**: 1-1.5 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐

#### Τι θα Μάθετε
- Προχωρημένα μοτίβα ανάπτυξης
- Υποδομή ως Κώδικας με Bicep
- Στρατηγικές παροχής πόρων

#### Πόροι Μάθησης
- **📖 Ανάπτυξη**: [Οδηγός Ανάπτυξης](docs/chapter-04-infrastructure/deployment-guide.md) - Ολοκληρωμένα workflows
- **🏗️ Provisioning**: [Provisioning Πόρων](docs/chapter-04-infrastructure/provisioning.md) - Διαχείριση πόρων Azure
- **📝 Παραδείγματα**: [Παράδειγμα Container App](../../examples/container-app) - Containerized αναπτύξεις

#### Πρακτικές Ασκήσεις
- Δημιουργήστε προσαρμοσμένα templates Bicep
- Αναπτύξτε εφαρμογές πολλαπλών υπηρεσιών
- Εφαρμόστε στρατηγικές blue-green deployment

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε σύνθετες εφαρμογές πολλαπλών υπηρεσιών χρησιμοποιώντας προσαρμοσμένα templates υποδομής
### 🎯 Κεφάλαιο 5: Λύσεις AI με Πολλαπλούς Πράκτορες (Για Προχωρημένους)
**Προαπαιτούμενα**: Κεφάλαια 1-2 ολοκληρωμένα  
**Διάρκεια**: 2-3 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐⭐

#### Τι θα μάθετε
- Σχήματα αρχιτεκτονικής πολλαπλών πρακτόρων
- Ορχήστρωση και συντονισμός πρακτόρων
- Αναπτύξεις AI έτοιμες για παραγωγή

#### Πηγές Μάθησης
- **🤖 Προτεινόμενο Έργο**: [Λύση Πολλαπλών Πρακτόρων για Λιανική](examples/retail-scenario.md) - Πλήρης υλοποίηση
- **🛠️ Πρότυπα ARM**: [Πακέτο Προτύπων ARM](../../examples/retail-multiagent-arm-template) - Ανάπτυξη με ένα κλικ
- **📖 Αρχιτεκτονική**: [Σχήματα συντονισμού πολλαπλών πρακτόρων](docs/chapter-06-pre-deployment/coordination-patterns.md) - Σχήματα

#### Πρακτικές Ασκήσεις
```bash
# Αναπτύξτε την πλήρη λύση πολλαπλών πρακτόρων για το λιανικό εμπόριο
cd examples/retail-multiagent-arm-template
./deploy.sh

# Εξερευνήστε τις διαμορφώσεις των πρακτόρων
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε και διαχειριστείτε μια λύση AI πολλαπλών πρακτόρων έτοιμη για παραγωγή με πράκτορες Πελάτη και Αποθεμάτων

---

### 🔍 Κεφάλαιο 6: Επικύρωση και Σχεδιασμός πριν την Ανάπτυξη
**Προαπαιτούμενα**: Κεφάλαιο 4 ολοκληρωμένο  
**Διάρκεια**: 1 ώρα  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα μάθετε
- Σχεδιασμός χωρητικότητας και επικύρωση πόρων
- Στρατηγικές επιλογής SKU
- Έλεγχοι πριν την ανάπτυξη και αυτοματοποίηση

#### Πηγές Μάθησης
- **📊 Σχεδιασμός**: [Σχεδιασμός Χωρητικότητας](docs/chapter-06-pre-deployment/capacity-planning.md) - Επικύρωση πόρων
- **💰 Επιλογή**: [Επιλογή SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Οικονομικά αποδοτικές επιλογές
- **✅ Επικύρωση**: [Έλεγχοι προ-ανάπτυξης](docs/chapter-06-pre-deployment/preflight-checks.md) - Αυτοματοποιημένα σενάρια

#### Πρακτικές Ασκήσεις
- Εκτέλεση σεναρίων επικύρωσης χωρητικότητας
- Βελτιστοποίηση επιλογής SKU για κόστος
- Υλοποίηση αυτοματοποιημένων ελέγχων πριν την ανάπτυξη

**💡 Αποτέλεσμα Κεφαλαίου**: Επικυρώστε και βελτιστοποιήστε τις αναπτύξεις πριν την εκτέλεση

---

### 🚨 Κεφάλαιο 7: Επίλυση Προβλημάτων & Αποσφαλμάτωση
**Προαπαιτούμενα**: Οποιοδήποτε κεφάλαιο ανάπτυξης ολοκληρωμένο  
**Διάρκεια**: 1-1.5 ώρες  
**Πολυπλοκότητα**: ⭐⭐

#### Τι θα μάθετε
- Συστηματικές προσεγγίσεις αποσφαλμάτωσης
- Συνήθη προβλήματα και λύσεις
- Επίλυση προβλημάτων ειδικά για AI

#### Πηγές Μάθησης
- **🔧 Συνήθη Προβλήματα**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - Συχνές ερωτήσεις και λύσεις
- **🕵️ Οδηγός Αποσφαλμάτωσης**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Βήμα-βήμα στρατηγικές
- **🤖 Επίλυση Προβλημάτων για AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Προβλήματα υπηρεσιών AI

#### Πρακτικές Ασκήσεις
- Διαγνώστε αποτυχίες ανάπτυξης
- Επιλύστε προβλήματα αυθεντικοποίησης
- Αποσφαλμάτωση συνδεσιμότητας υπηρεσιών AI

**💡 Αποτέλεσμα Κεφαλαίου**: Διαγνώστε και επιλύστε ανεξάρτητα κοινά προβλήματα ανάπτυξης

---

### 🏢 Κεφάλαιο 8: Πρότυπα Παραγωγής & Επιχειρήσεων
**Προαπαιτούμενα**: Κεφάλαια 1-4 ολοκληρωμένα  
**Διάρκεια**: 2-3 ώρες  
**Πολυπλοκότητα**: ⭐⭐⭐⭐

#### Τι θα μάθετε
- Στρατηγικές ανάπτυξης για παραγωγή
- Πρότυπα ασφάλειας για επιχειρήσεις
- Παρακολούθηση και βελτιστοποίηση κόστους

#### Πηγές Μάθησης
- **🏭 Παραγωγή**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Πρότυπα για επιχειρήσεις
- **📝 Παραδείγματα**: [Microservices Example](../../examples/microservices) - Σύνθετες αρχιτεκτονικές
- **📊 Παρακολούθηση**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Παρακολούθηση

#### Πρακτικές Ασκήσεις
- Εφαρμογή προτύπων ασφάλειας για επιχειρήσεις
- Ρύθμιση ολοκληρωμένης παρακολούθησης
- Ανάπτυξη σε παραγωγή με κατάλληλη διακυβέρνηση

**💡 Αποτέλεσμα Κεφαλαίου**: Αναπτύξτε εφαρμογές έτοιμες για επιχειρήσεις με πλήρεις δυνατότητες παραγωγής

---

## 🎓 Επισκόπηση Εργαστηρίου: Εμπειρία Πρακτικής Μάθησης

> **⚠️ ΚΑΤΑΣΤΑΣΗ ΕΡΓΑΣΤΗΡΙΟΥ: Σε Ενεργή Ανάπτυξη**  
> Το υλικό του εργαστηρίου βρίσκεται επί του παρόντος υπό ανάπτυξη και βελτίωση. Οι βασικές ενότητες λειτουργούν, αλλά κάποιοι προχωρημένοι τομείς είναι ελλιπείς. Εργαζόμαστε ενεργά για να ολοκληρώσουμε όλο το περιεχόμενο. [Παρακολουθήστε την πρόοδο →](workshop/README.md)

### Διαδραστικά Υλικά Εργαστηρίου
**Ολοκληρωμένη πρακτική μάθηση με εργαλεία στο πρόγραμμα περιήγησης και καθοδηγούμενες ασκήσεις**

Τα υλικά του εργαστηρίου μας παρέχουν μια δομημένη, διαδραστική εμπειρία μάθησης που συμπληρώνει το κεφαλαίο-βασισμένο εκπαιδευτικό πρόγραμμα παραπάνω. Το εργαστήριο σχεδιάστηκε για αυτορυθμιζόμενη μάθηση και καθοδηγούμενες συνεδρίες.

#### 🛠️ Χαρακτηριστικά Εργαστηρίου
- **Διεπαφή με Πρόγραμμα Περιήγησης**: Πλήρες εργαστήριο με MkDocs με δυνατότητες αναζήτησης, αντιγραφής και θεμάτων
- **Ενσωμάτωση GitHub Codespaces**: Ρύθμιση περιβάλλοντος ανάπτυξης με ένα κλικ
- **Δομημένη Διαδρομή Μάθησης**: 8-ενότητες καθοδηγούμενων ασκήσεων (συνολικά 3-4 ώρες)
- **Προοδευτική Μεθοδολογία**: Εισαγωγή → Επιλογή → Επικύρωση → Αποδόμηση → Διαμόρφωση → Προσαρμογή → Αποσυναρμολόγηση → Περίληψη
- **Διαδραστικό Περιβάλλον DevContainer**: Προ-διαμορφωμένα εργαλεία και εξαρτήσεις

#### 📚 Δομή Μονάδων Εργαστηρίου
Το εργαστήριο ακολουθεί μια **8-ενότητες προοδευτική μεθοδολογία** που σας οδηγεί από την ανακάλυψη στην κυριαρχία της ανάπτυξης:

| Ενότητα | Θέμα | Τι θα κάνετε | Διάρκεια |
|--------|-------|----------------|----------|
| **0. Εισαγωγή** | Επισκόπηση Εργαστηρίου | Κατανοήστε τους στόχους μάθησης, τα προαπαιτούμενα και τη δομή του εργαστηρίου | 15 λεπτά |
| **1. Επιλογή** | Ανακάλυψη Προτύπων | Εξερευνήστε πρότυπα AZD και επιλέξτε το κατάλληλο πρότυπο AI για το σενάριό σας | 20 λεπτά |
| **2. Επικύρωση** | Ανάπτυξη & Επαλήθευση | Αναπτύξτε το πρότυπο με `azd up` και επικυρώστε ότι η υποδομή λειτουργεί | 30 λεπτά |
| **3. Αποδόμηση** | Κατανόηση Δομής | Χρησιμοποιήστε το GitHub Copilot για να εξερευνήσετε την αρχιτεκτονική του προτύπου, τα αρχεία Bicep και την οργάνωση κώδικα | 30 λεπτά |
| **4. Διαμόρφωση** | Εμβάθυνση στο azure.yaml | Εξειδικευτείτε στη διαμόρφωση `azure.yaml`, τα lifecycle hooks και τις μεταβλητές περιβάλλοντος | 30 λεπτά |
| **5. Προσαρμογή** | Κάντε το δικό σας | Ενεργοποιήστε το AI Search, το tracing, την αξιολόγηση και προσαρμόστε το στο σενάριό σας | 45 λεπτά |
| **6. Αποσυναρμολόγηση** | Καθαρισμός | Αποδεσμεύστε με ασφάλεια πόρους με `azd down --purge` | 15 λεπτά |
| **7. Περίληψη** | Επόμενα Βήματα | Επανεξετάστε τα επιτεύγματα, τις βασικές έννοιες και συνεχίστε το ταξίδι μάθησής σας | 15 λεπτά |

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
# Κάντε κλικ στο «Code» → «Δημιουργία codespace στο main» στο αποθετήριο

# Επιλογή 2: Τοπική ανάπτυξη
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Ακολουθήστε τις οδηγίες ρύθμισης στο workshop/README.md
```

#### 🎯 Αποτελέσματα Μάθησης Εργαστηρίου
Με την ολοκλήρωση του εργαστηρίου, οι συμμετέχοντες θα:
- **Αναπτύξτε Εφαρμογές AI για Παραγωγή**: Χρησιμοποιήστε AZD με τις υπηρεσίες Microsoft Foundry
- **Κατακτήστε Αρχιτεκτονικές Πολλαπλών Πρακτόρων**: Υλοποιήστε συντονισμένες λύσεις πρακτόρων AI
- **Εφαρμόστε Βέλτιστες Πρακτικές Ασφαλείας**: Διαμορφώστε την αυθεντικοποίηση και τον έλεγχο πρόσβασης
- **Βελτιστοποιήστε για Κλίμακα**: Σχεδιάστε οικονομικά αποδοτικές, υψηλής απόδοσης αναπτύξεις
- **Επίλυση Προβλημάτων Αναπτύξεων**: Επιλύστε κοινά προβλήματα ανεξάρτητα

#### 📖 Πόροι Εργαστηρίου
- **🎥 Διαδραστικός Οδηγός**: [Υλικά Εργαστηρίου](workshop/README.md) - Περιβάλλον μάθησης βασισμένο σε πρόγραμμα περιήγησης
- **📋 Οδηγίες Ενότητα-προς-Ενότητα**:
  - [0. Εισαγωγή](workshop/docs/instructions/0-Introduction.md) - Επισκόπηση εργαστηρίου και στόχοι
  - [1. Επιλογή](workshop/docs/instructions/1-Select-AI-Template.md) - Εντοπίστε και επιλέξτε πρότυπα AI
  - [2. Επικύρωση](workshop/docs/instructions/2-Validate-AI-Template.md) - Αναπτύξτε και επαληθεύστε πρότυπα
  - [3. Αποδόμηση](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Εξερευνήστε την αρχιτεκτονική του προτύπου
  - [4. Διαμόρφωση](workshop/docs/instructions/4-Configure-AI-Template.md) - Εξειδικευτείτε στο azure.yaml
  - [5. Προσαρμογή](workshop/docs/instructions/5-Customize-AI-Template.md) - Προσαρμόστε για το σενάριό σας
  - [6. Αποσυναρμολόγηση](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Καθαρίστε πόρους
  - [7. Περίληψη](workshop/docs/instructions/7-Wrap-up.md) - Επανεξέταση και επόμενα βήματα
- **🛠️ Εργαστήριο AI**: [Εργαστήριο AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Ασκήσεις εστιασμένες στο AI
- **💡 Γρήγορη Έναρξη**: [Οδηγός Ρυθμίσεων Εργαστηρίου](workshop/README.md#quick-start) - Ρύθμιση περιβάλλοντος

**Κατάλληλο για**: Εταιρική εκπαίδευση, πανεπιστημιακά μαθήματα, αυτορυθμιζόμενη μάθηση και bootcamps για προγραμματιστές.

---

## 📖 Εμβάθυνση: Δυνατότητες AZD

Πέρα από τα βασικά, το AZD προσφέρει ισχυρές λειτουργίες για αναπτύξεις σε παραγωγή:

- **Αναπτύξεις βασισμένες σε πρότυπα** - Χρησιμοποιήστε προκατασκευασμένα πρότυπα για κοινά πρότυπα εφαρμογών
- **Υποδομή ως Κώδικας** - Διαχειριστείτε πόρους Azure χρησιμοποιώντας Bicep ή Terraform  
- **Ενσωματωμένες ροές εργασίας** - Παρέχουν απρόσκοπτη παροχή, ανάπτυξη και παρακολούθηση εφαρμογών
- **Φιλικό προς τον προγραμματιστή** - Βελτιστοποιημένο για παραγωγικότητα και εμπειρία προγραμματιστών

### **AZD + Microsoft Foundry: Ιδανικό για αναπτύξεις AI**

**Γιατί AZD για λύσεις AI;** Το AZD αντιμετωπίζει τις κορυφαίες προκλήσεις που αντιμετωπίζουν οι προγραμματιστές AI:

- **Πρότυπα έτοιμα για AI** - Προ-διαμορφωμένα πρότυπα για Microsoft Foundry Models, Azure AI Services και φορτία εργασίας ML
- **Ασφαλείς αναπτύξεις AI** - Ενσωματωμένα πρότυπα ασφάλειας για υπηρεσίες AI, κλειδιά API και model endpoints  
- **Πρότυπα AI για παραγωγή** - Βέλτιστες πρακτικές για επεκτάσιμες, οικονομικά αποδοτικές αναπτύξεις εφαρμογών AI
- **Ολοκληρωμένες ροές εργασίας AI** - Από την ανάπτυξη μοντέλου έως την ανάπτυξη σε παραγωγή με κατάλληλη παρακολούθηση
- **Βελτιστοποίηση κόστους** - Έξυπνη κατανομή πόρων και στρατηγικές κλιμάκωσης για φορτία εργασίας AI
- **Ενσωμάτωση Microsoft Foundry** - Απρόσκοπτη σύνδεση με τον κατάλογο μοντέλων Microsoft Foundry και τα endpoints

---

## 🎯 Βιβλιοθήκη Προτύπων & Παραδειγμάτων

### Επιλεγμένα: Πρότυπα Microsoft Foundry
**Ξεκινήστε εδώ αν αναπτύσσετε εφαρμογές AI!**

> **Σημείωση:** Αυτά τα πρότυπα δείχνουν διάφορα πρότυπα AI. Κάποια είναι εξωτερικά Azure Samples, άλλα είναι τοπικές υλοποιήσεις.

| Πρότυπο | Κεφάλαιο | Πολυπλοκότητα | Υπηρεσίες | Τύπος |
|----------|---------|------------|----------|------|
| [**Ξεκινήστε με το AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Κεφάλαιο 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Εξωτερικό |
| [**Ξεκινήστε με πράκτορες AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Κεφάλαιο 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Εξωτερικό |
| [**Επίδειξη Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Κεφάλαιο 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Εξωτερικό |
| [**OpenAI Chat App - Γρήγορη Εκκίνηση**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Κεφάλαιο 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Εξωτερικό |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Κεφάλαιο 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Εξωτερικό |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Κεφάλαιο 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Εξωτερικό |
| [**Λύση Πολλαπλών Πρακτόρων για Λιανική**](examples/retail-scenario.md) | Κεφάλαιο 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Τοπικό** |

### Επιλεγμένα: Πλήρη Σενάρια Μάθησης
**Πρότυπα εφαρμογών έτοιμα για παραγωγή αντιστοιχισμένα με κεφάλαια μάθησης**

| Πρότυπο | Εκπαιδευτικό Κεφάλαιο | Πολυπλοκότητα | Κύριο Μάθημα |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Κεφάλαιο 2 | ⭐ | Βασικά πρότυπα ανάπτυξης AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Κεφάλαιο 2 | ⭐⭐ | Υλοποίηση RAG με Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Κεφάλαιο 4 | ⭐⭐ | Ενσωμάτωση Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Κεφάλαιο 5 | ⭐⭐⭐ | Πλαίσιο πρακτόρων και κλήσεις συναρτήσεων |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Κεφάλαιο 8 | ⭐⭐⭐ | Ορχήστρωση AI για επιχειρήσεις |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Κεφάλαιο 5 | ⭐⭐⭐⭐ | Αρχιτεκτονική πολλαπλών πρακτόρων με πράκτορες Πελάτη και Αποθεμάτων |

### Μάθηση μέσω Παραδείγματος ανά Τύπο

> **📌 Τοπικά vs. Εξωτερικά Παραδείγματα:**  
> **Τοπικά Παραδείγματα** (σε αυτό το repo) = Έτοιμα για άμεση χρήση  
> **Εξωτερικά Παραδείγματα** (Azure Samples) = Κλωνοποιήστε από τα συνδεδεμένα αποθετήρια

#### Τοπικά Παραδείγματα (Έτοιμα για Χρήση)
- [**Λύση Πολλαπλών Πρακτόρων για Λιανική**](examples/retail-scenario.md) - Πλήρης υλοποίηση έτοιμη για παραγωγή με πρότυπα ARM
  - Αρχιτεκτονική πολλαπλών πρακτόρων (Πράκτορες Πελάτη + Αποθεμάτων)
  - Ολοκληρωμένη παρακολούθηση και αξιολόγηση
  - Ανάπτυξη με ένα κλικ μέσω προτύπου ARM

#### Τοπικά Παραδείγματα - Εφαρμογές Container (Κεφάλαια 2-5)
**Ολοκληρωμένα παραδείγματα ανάπτυξης κοντέινερ σε αυτό το αποθετήριο:**
- [**Παραδείγματα Container App**](examples/container-app/README.md) - Πλήρης οδηγός για αναπτύξεις με κοντέινερ
  - [Απλό Flask API](../../examples/container-app/simple-flask-api) - Βασικό REST API με δυνατότητα scale-to-zero
  - [Αρχιτεκτονική μικροϋπηρεσιών](../../examples/container-app/microservices) - Ανάπτυξη πολλαπλών υπηρεσιών έτοιμη για παραγωγή
  - Πρότυπα ανάπτυξης: Γρήγορη εκκίνηση, Παραγωγή και Προχωρημένα
  - Παρακολούθηση, ασφάλεια και οδηγίες βελτιστοποίησης κόστους

#### Εξωτερικά Παραδείγματα - Απλές Εφαρμογές (Κεφάλαια 1-2)
**Κλωνοποιήστε αυτά τα αποθετήρια Azure Samples για να ξεκινήσετε:**
- [Απλή Web Εφαρμογή - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Βασικά πρότυπα ανάπτυξης
- [Στατικός Ιστότοπος - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Ανάπτυξη στατικού περιεχομένου
- [Εφαρμογή Container - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Ανάπτυξη REST API

#### Εξωτερικά Παραδείγματα - Ενσωμάτωση Βάσης Δεδομένων (Κεφάλαια 3-4)  
- [Εφαρμογή Βάσης Δεδομένων - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Πρότυπα σύνδεσης με βάση δεδομένων
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Ροή εργασίας δεδομένων χωρίς διακομιστή

#### Εξωτερικά Παραδείγματα - Προχωρημένα Πρότυπα (Κεφάλαια 4-8)
- [Μικροϋπηρεσίες Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Αρχιτεκτονικές πολλαπλών υπηρεσιών
- [Εργασίες Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Επεξεργασία στο παρασκήνιο  
- [Pipeline ML για επιχειρήσεις](https://github.com/Azure-Samples/mlops-v2) - Πρότυπα ML έτοιμα για παραγωγή

### Συλλογές Εξωτερικών Προτύπων
- [**Επίσημη Συλλογή Προτύπων AZD**](https://azure.github.io/awesome-azd/) - Επιμελημένη συλλογή επίσημων και κοινοτικών προτύπων
- [**Πρότυπα Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Τεκμηρίωση προτύπων Microsoft Learn
- [**Κατάλογος Παραδειγμάτων**](examples/README.md) - Τοπικά παραδείγματα εκμάθησης με λεπτομερείς εξηγήσεις

---

## 📚 Πόροι Μάθησης & Αναφορές

### Σύντομες Αναφορές
- [**Σύντομη Αναφορά Εντολών**](resources/cheat-sheet.md) - Βασικές εντολές azd οργανωμένες κατά κεφάλαιο
- [**Γλωσσάριο**](resources/glossary.md) - Ορολογία Azure και azd  
- [**Συχνές Ερωτήσεις (FAQ)**](resources/faq.md) - Συνήθεις ερωτήσεις οργανωμένες κατά κεφάλαιο μάθησης
- [**Οδηγός Μελέτης**](resources/study-guide.md) - Ολοκληρωμένες ασκήσεις πρακτικής

### Πρακτικά Εργαστήρια
- [**Εργαστήριο AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Κάντε τις λύσεις AI σας αναπτύξιμες με AZD (2-3 ώρες)
- [**Διαδραστικό Εργαστήριο**](workshop/README.md) - 8-module καθοδηγούμενες ασκήσεις με MkDocs και GitHub Codespaces
  - Ακολουθεί: Εισαγωγή → Επιλογή → Επικύρωση → Αποδόμηση → Διαμόρφωση → Προσαρμογή → Κατάργηση → Ανασκόπηση

### Εξωτερικοί Πόροι Μάθησης
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Κέντρο Αρχιτεκτονικής Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Υπολογιστής Τιμολόγησης Azure](https://azure.microsoft.com/pricing/calculator/)
- [Κατάσταση Azure](https://status.azure.com/)

### Δεξιότητες Agent AI για τον Επεξεργαστή σας
- [**Δεξιότητες Microsoft Azure στο skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 ανοιχτές δεξιότητες agent για Azure AI, Foundry, ανάπτυξη, διαγνωστικά, βελτιστοποίηση κόστους και άλλα. Εγκαταστήστε τις σε GitHub Copilot, Cursor, Claude Code, ή οποιονδήποτε υποστηριζόμενο agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Γρήγορος Οδηγός Επίλυσης Προβλημάτων

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

# Ή χρησιμοποιήστε μικρότερα SKUs στην ανάπτυξη
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

# Επιλογή 2: Απλώς διορθώστε την υποδομή
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
# Επαναεπικύρωση ταυτότητας για το AZD
azd auth logout
azd auth login

# Προαιρετικό: ανανεώστε επίσης το Azure CLI εάν εκτελείτε εντολές az
az logout
az login

# Επαληθεύστε την ταυτότητα
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD δημιουργεί μοναδικά ονόματα, αλλά αν υπάρξει σύγκρουση:
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
- Εφαρμογές AI: 15-25 λεπτά (η προμήθεια OpenAI είναι αργή)

```bash
# Ελέγξτε την πρόοδο
azd show

# Αν κολλήσετε για περισσότερα από 30 λεπτά, ελέγξτε το Azure Portal:
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
# Ζητήστε από τον διαχειριστή Azure σας να χορηγήσει:
# - Contributor (για πόρους)
# - User Access Administrator (για αναθέσεις ρόλων)
```
</details>

<details>
<summary><strong>❌ Δεν μπορεί να βρεθεί το URL της αναπτυγμένης εφαρμογής</strong></summary>

```bash
# Εμφανίστε όλα τα σημεία τερματισμού υπηρεσιών
azd show

# Ή ανοίξτε το Azure Portal
azd monitor

# Ελέγξτε συγκεκριμένη υπηρεσία
azd env get-values
# Αναζητήστε μεταβλητές *_URL
```
</details>

### 📚 Πλήρεις Πόροι Επίλυσης Προβλημάτων

- **Οδηγός Συνήθων Προβλημάτων:** [Λεπτομερείς Λύσεις](docs/chapter-07-troubleshooting/common-issues.md)
- **Ζητήματα ειδικά για AI:** [Επίλυση Προβλημάτων AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Οδηγός Αποσφαλμάτωσης:** [Αποσφαλμάτωση βήμα-βήμα](docs/chapter-07-troubleshooting/debugging.md)
- **Λήψη Βοήθειας:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Ολοκλήρωση Μαθήματος & Πιστοποίηση

### Παρακολούθηση Προόδου
Παρακολουθήστε την πρόοδο μάθησής σας σε κάθε κεφάλαιο:

- [ ] **Κεφάλαιο 1**: Βάσεις & Γρήγορη Εκκίνηση ✅
- [ ] **Κεφάλαιο 2**: Ανάπτυξη με προτεραιότητα το AI ✅  
- [ ] **Κεφάλαιο 3**: Διαμόρφωση & Πιστοποίηση ✅
- [ ] **Κεφάλαιο 4**: Υποδομή ως Κώδικας & Ανάπτυξη ✅
- [ ] **Κεφάλαιο 5**: Λύσεις AI με πολλούς πράκτορες ✅
- [ ] **Κεφάλαιο 6**: Επικύρωση και Σχεδιασμός πριν την Ανάπτυξη ✅
- [ ] **Κεφάλαιο 7**: Επίλυση Προβλημάτων & Αποσφαλμάτωση ✅
- [ ] **Κεφάλαιο 8**: Πρότυπα Παραγωγής & Επιχειρήσεων ✅

### Επαλήθευση Μάθησης
Μετά την ολοκλήρωση κάθε κεφαλαίου, επαληθεύστε τις γνώσεις σας με:
1. **Πρακτική Άσκηση**: Ολοκληρώστε την πρακτική ανάπτυξη του κεφαλαίου
2. **Έλεγχος Γνώσεων**: Εξετάστε την ενότητα Συχνές Ερωτήσεις για το κεφάλαιό σας
3. **Συζήτηση στην Κοινότητα**: Μοιραστείτε την εμπειρία σας στο Azure Discord
4. **Επόμενο Κεφάλαιο**: Προχωρήστε στο επόμενο επίπεδο πολυπλοκότητας

### Οφέλη Ολοκλήρωσης Μαθήματος
Μετά την ολοκλήρωση όλων των κεφαλαίων, θα έχετε:
- **Εμπειρία Παραγωγής**: Έχετε αναπτύξει πραγματικές εφαρμογές AI στο Azure
- **Επαγγελματικές Δεξιότητες**: Ικανότητες ανάπτυξης έτοιμες για επιχειρήσεις  
- **Αναγνώριση στην Κοινότητα**: Ενεργό μέλος της κοινότητας προγραμματιστών Azure
- **Προώθηση Καριέρας**: Ζητούμενες δεξιότητες ανάπτυξης AZD και AI

---

## 🤝 Κοινότητα & Υποστήριξη

### Λήψη Βοήθειας & Υποστήριξη
- **Τεχνικά Θέματα:** [Αναφέρετε σφάλματα και ζητήστε δυνατότητες](https://github.com/microsoft/azd-for-beginners/issues)
- **Ερωτήσεις Μάθησης:** [Κοινότητα Microsoft Azure Discord](https://discord.gg/microsoft-azure) and [![Discord της Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Βοήθεια Ειδικά για AI:** Join the [![Discord της Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Τεκμηρίωση:** [Επίσημη τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Συμπεράσματα Κοινότητας από το Discord του Microsoft Foundry

**Πρόσφατα Αποτελέσματα Δημοσκόπησης από το κανάλι #Azure:**
- **45%** των προγραμματιστών θέλουν να χρησιμοποιήσουν το AZD για φόρτους εργασίας AI
- **Κύριες προκλήσεις**: Αναπτύξεις πολλαπλών υπηρεσιών, διαχείριση διαπιστευτηρίων, ετοιμότητα για παραγωγή  
- **Τα πιο ζητούμενα**: Πρότυπα ειδικά για AI, οδηγοί αντιμετώπισης προβλημάτων, βέλτιστες πρακτικές

**Εγγραφείτε στην κοινότητά μας για να:**
- Μοιραστείτε τις εμπειρίες σας με AZD + AI και λάβετε βοήθεια
- Αποκτήστε πρόσβαση σε πρώιμες προεπισκοπήσεις νέων προτύπων AI
- Συνεισφέρετε στις βέλτιστες πρακτικές ανάπτυξης AI
- Επηρεάστε τη μελλοντική ανάπτυξη χαρακτηριστικών AI + AZD

### Συνεισφορά στο Μάθημα
Καλωσορίζουμε τις συνεισφορές! Διαβάστε τον [Οδηγό Συνεισφοράς](CONTRIBUTING.md) για λεπτομέρειες σχετικά με:
- **Βελτιώσεις Περιεχομένου**: Βελτιώστε υπάρχοντα κεφάλαια και παραδείγματα
- **Νέα Παραδείγματα**: Προσθέστε πραγματικά σενάρια και πρότυπα  
- **Μεταφράσεις**: Βοηθήστε στη διατήρηση υποστήριξης πολλών γλωσσών
- **Αναφορές Σφαλμάτων**: Βελτιώστε την ακρίβεια και τη σαφήνεια
- **Πρότυπα Κοινότητας**: Ακολουθήστε τις περιεκτικές οδηγίες της κοινότητάς μας

---

## 📄 Πληροφορίες Μαθήματος

### Άδεια
Αυτό το έργο αδειοδοτείται υπό την άδεια MIT - δείτε το αρχείο [LICENSE](../../LICENSE) για λεπτομέρειες.

### Σχετικοί Πόροι Εκμάθησης της Microsoft

Η ομάδα μας παράγει και άλλα ολοκληρωμένα μαθήματα εκμάθησης:

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
[![Γενετική Τεχνητή Νοημοσύνη (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Κύρια Μαθήματα
[![Μηχανική Μάθηση για Αρχάριους](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Επιστήμη Δεδομένων για Αρχάριους](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Τεχνητή Νοημοσύνη για Αρχάριους](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
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

**Αρχάριοι**: Ξεκινήστε με [Κεφάλαιο 1: Θεμέλια & Γρήγορη Εκκίνηση](#-chapter-1-foundation--quick-start)  
**Προγραμματιστές AI**: Μεταβείτε στο [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα την AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Έμπειροι Προγραμματιστές**: Ξεκινήστε με [Κεφάλαιο 3: Διαμόρφωση & Αυθεντικοποίηση](#️-chapter-3-configuration--authentication)

**Επόμενα Βήματα**: [Ξεκινήστε το Κεφάλαιο 1 - Βασικά AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->