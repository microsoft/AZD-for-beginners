# Φέρε τη δική σου εφαρμογή - Πρόσθεσε azd σε ένα υπάρχον έργο

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD για αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 1 - Βάσεις & Γρήγορη Εκκίνηση
- **⬅️ Προηγούμενο**: [Το πρώτο σας έργο](first-project.md)
- **➡️ Επόμενο**: [Dev Containers & Codespaces](dev-containers.md)

> Επικυρώθηκε με `azd 1.25.6` τον Ιούνιο 2026.

## Εισαγωγή

Στο [Το πρώτο σας έργο](first-project.md) αναπτύξατε μια εφαρμογή ξεκινώντας από ένα πρότυπο. Αλλά τις περισσότερες φορές ήδη έχετε μια εφαρμογή — μια Node.js API, μια υπηρεσία Python Flask, μια .NET web εφαρμογή — που βρίσκεται σε έναν φάκελο στον υπολογιστή σας. Αυτό το μάθημα δείχνει πώς να προσθέσετε azd σε αυτόν τον υπάρχοντα κώδικα ώστε να μπορείτε να τον αναπτύξετε με `azd up`, χωρίς να χρειάζεται πρότυπο.

## Στόχοι Μάθησης

Στο τέλος αυτού του μαθήματος, θα:
- Κατανοείτε τους τρεις τρόπους για να ξεκινήσετε ένα έργο azd
- Τρέξετε `azd init` μέσα σε έναν υπάρχοντα κώδικα
- Κατανοείτε τι κάνουν το `azure.yaml` και ο φάκελος `infra/` για την εφαρμογή σας
- Ξέρετε πότε να αφήσετε το azd να δημιουργήσει τη υποδομή και πότε να γράψετε τη δική σας
- Αναπτύξετε την υπάρχουσα εφαρμογή σας στο Azure με `azd up`

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε να:
- Αρχικοποιήσετε το azd σε ένα έργο που ήδη έχετε
- Διαβάζετε και επεξεργάζεστε ένα βασικό αρχείο `azure.yaml`
- Δημιουργείτε αρχική υποδομή με `azd infra generate`
- Επιλέγετε κατάλληλο Azure host για την εφαρμογή σας
- Αναπτύσσετε και καθαρίζετε τη δική σας εφαρμογή

---

## Τρεις Τρόποι να Ξεκινήσετε ένα έργο azd

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Για εκμάθηση, ή για να ξεκινήσετε μια νέα εφαρμογή από ένα δοκιμασμένο δείγμα |
| **From your existing code** | `azd init` (in your project folder) | Έχετε ήδη μια εφαρμογή και θέλετε να την αναπτύξετε |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Υιοθέτηση του azd για ένα υπάρχον αποθετήριο |

Έχετε ήδη εξασκηθεί στην πρώτη επιλογή. Αυτό το μάθημα καλύπτει τη δεύτερη — το πιο κοινό σενάριο στην πράξη.

---

## Βήμα 1: Τρέξτε `azd init` στο Έργο σας

Ανοίξτε ένα τερματικό **μέσα στον υπάρχοντα φάκελο του έργου σας** και τρέξτε:

```bash
cd my-existing-app
azd init
```

Το azd θα ρωτήσει πώς θέλετε να αρχικοποιήσετε. Επιλέξτε:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Επιλέξτε **"Use code in the current directory."** Το azd στη συνέχεια σαρώσει τον φάκελό σας, ανιχνεύει τη γλώσσα και το πλαίσιο εργασίας, και προτείνει έναν host.

### Τι ανιχνεύει το azd

Το azd ψάχνει για σημάδια όπως `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, ή ένα `Dockerfile`, και προτείνει έναν αντίστοιχο Azure host:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Επιβεβαιώστε την ανιχνευμένη υπηρεσία(ες), και το azd δημιουργεί τα αρχεία που χρειάζεστε.

---

## Βήμα 2: Κατανοήστε Τι Δημιούργησε το azd

Μετά την init, θα έχετε δύο νέα πράγματα στο έργο σας:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — ο ορισμός του έργου

Αυτό είναι η καρδιά ενός έργου azd. Ένα ελάχιστο δείγμα μοιάζει έτσι:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Το μπλοκ `services` είναι το κεντρικό μέρος: κάθε εγγραφή αντιστοιχίζει έναν φάκελο του κώδικά σας σε έναν Azure host. Εάν η εφαρμογή σας έχει frontend και API, θα έχετε δύο υπηρεσίες.

### `infra/` — οι Azure πόροι σας ως κώδικας

Ο φάκελος `infra/` περιέχει αρχεία Bicep που ορίζουν τους Azure πόρους που χρειάζεται η εφαρμογή σας (το App Service, τη βάση δεδομένων, κ.λπ.). Δεν χρειάζεται να τα γράψετε χειροκίνητα — το azd δημιουργεί ένα λειτουργικό σημείο εκκίνησης. Μπορείτε να τα επεξεργαστείτε αργότερα για να προσθέσετε πόρους ή να ενισχύσετε την ασφάλεια (περιλαμβάνεται στο [Κεφάλαιο 4](../chapter-04-infrastructure/README.md)).

> **Συμβουλή:** Θέλετε να δείτε ή να προσαρμόσετε την παραγόμενη υποδομή πριν την ανάπτυξη; Τρέξτε `azd infra generate` (διατίθεται επίσης ως `azd infra synth`) για να γράψετε το IaC στον δίσκο ώστε να μπορείτε να το ανασκοπήσετε και να το βγάλετε σε έλεγχο εκδόσεων.

---

## Βήμα 3: Ορίστε τις Απαιτούμενες Ρυθμίσεις

Εάν η εφαρμογή σας χρειάζεται ρυθμίσεις ή μυστικά (μία connection string, ένα API key), μην τα σκληροκωδικοποιείτε. Χρησιμοποιήστε τιμές περιβάλλοντος:

```bash
# Δημιουργήστε ένα περιβάλλον
azd env new dev

# Ορίστε μια μη μυστική τιμή
azd env set API_VERSION 1.0.0
```

Για πραγματικά μυστικά, αποθηκεύστε τα στο Key Vault και αναφερθείτε σε αυτά από την υποδομή σας—δείτε [Κεφάλαιο 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Βήμα 4: Ανάπτυξη

Τώρα χρησιμοποιήστε το ίδιο workflow που ήδη γνωρίζετε:

```bash
# Αυθεντικοποίηση (απαιτείται για το azd)
azd auth login

# Προεπισκόπηση των πόρων που θα δημιουργηθούν
azd provision --preview

# Παροχή υποδομής και ανάπτυξη του κώδικά σας
azd up
```

Όταν τελειώσει, το azd θα εμφανίσει το URL της εφαρμογής σας. Επαληθεύστε το με τον ίδιο τρόπο όπως οποιαδήποτε εφαρμογή azd:

```bash
azd show           # εμφάνιση σημείων τερματισμού
azd monitor --logs # ελέγξτε τα αρχεία καταγραφής αν χρειαστεί
```

---

## Συνηθισμένα Προβλήματα την Πρώτη Φορά

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Προσθέστε το manifest, ή επιλέξτε τον host χειροκίνητα κατά το `azd init` |
| Build fails during `azd up` | App needs a build step | Προσθέστε `buildCommand`/`outputPath` κάτω από την υπηρεσία στο `azure.yaml` |
| App starts but returns errors | Missing config/secret | Ορίστε τιμές με `azd env set` ή συνδέστε το Key Vault |
| Wrong host chosen | Auto-detection guessed | Επεξεργαστείτε το `host:` στο `azure.yaml` και τρέξτε ξανά `azd up` |

Για περισσότερα, δείτε [Κεφάλαιο 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## Καθαρισμός

```bash
azd down --force --purge
```

---

## Περίληψη

- `azd init` → **"Use code in the current directory"** προσθέτει το azd σε μια εφαρμογή που ήδη έχετε.
- Το `azure.yaml` αντιστοιχίζει τους φακέλους του κώδικά σας σε Azure hosts· το `infra/` ορίζει τους πόρους ως Bicep.
- Το `azd infra generate` σας επιτρέπει να ανασκοπήσετε ή να προσαρμόσετε την παραγόμενη υποδομή.
- Μόλις αρχικοποιηθεί, η υπάρχουσα εφαρμογή σας χρησιμοποιεί το ίδιο workflow `azd up` / `azd down` όπως μια εφαρμογή που βασίζεται σε πρότυπο.

---

## 🔗 Πλοήγηση

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Το πρώτο σας έργο](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Σχετικοί Πόροι

- [AZD Basics](azd-basics.md)
- [Κεφάλαιο 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuration & Authentication](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->