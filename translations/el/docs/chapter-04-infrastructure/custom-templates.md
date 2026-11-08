# Δημιουργία του δικού σας προτύπου azd

**Περιοχή Πλοήγησης Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 4 - Υποδομή ως Κώδικας & Ανάπτυξη
- **⬅️ Προηγούμενο**: [Οδηγός Ανάπτυξης](deployment-guide.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 5: Πολυ-Πρακτικές Λύσεις](../chapter-05-multi-agent/README.md)

> Επανεξετάστηκε με βάση το `azd 1.37.2` (Νοέμβριος 2026). Αυτό είναι ένα **οδηγός δημιουργίας με μερικά αρχεία**, όχι πλήρες πρότυπο: πρέπει να παρέχετε τον κώδικα εφαρμογής και `modules/web.bicep` με το περιβάλλον, το μητρώο, την Container App και τα outputs πριν την ανάπτυξη. Η παροχή Azure δεν εκτελέστηκε σε αυτή την ανασκόπηση.

## Εισαγωγή

Μέχρι τώρα έχετε *καταναλώσει* πρότυπα με `azd init --template <name>`. Αλλά μόλις έχετε ένα διάταξη έργου που αρέσει στην ομάδα σας — πχ. μια Container App με μια Cosmos DB και την κατάλληλη παρακολούθηση — θα θέλετε να το μετατρέψετε σε ένα επαναχρησιμοποιήσιμο πρότυπο δικό σας. Ένα πρότυπο είναι απλά ένα αποθετήριο Git με μια προβλέψιμη δομή που το azd ξέρει να διαβάζει. Αυτό το μάθημα δείχνει πώς να φτιάξετε ένα από το μηδέν, να το δοκιμάσετε, και (προαιρετικά) να το δημοσιεύσετε στην κοινότητα.

## Στόχοι Μάθησης

Μέχρι το τέλος αυτού του μαθήματος, θα:
- Κατανοήσετε τι κάνει έναν φάκελο "πρότυπο azd"
- Γνωρίζετε τα απαιτούμενα αρχεία και τη διάταξη φακέλων
- Προσθέσετε `azure.yaml` και `infra/` που άλλοι μπορούν να επαναχρησιμοποιήσουν
- Δοκιμάσετε το πρότυπό σας τοπικά πριν το μοιραστείτε
- Δημοσιεύσετε και (προαιρετικά) να το υποβάλετε στο Awesome AZD

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε να:
- Δημιουργήσετε ένα νέο αποθετήριο προτύπου
- Παραμετροποιήσετε την υποδομή ώστε να λειτουργεί σε οποιαδήποτε συνδρομή
- Επικυρώσετε ένα πρότυπο με `azd init` και `azd up`
- Προσθέσετε τα μεταδεδομένα που απαιτεί η κοινότητα γκαλερί

---

## Τι Είναι Πραγματικά Ένα Πρότυπο;

Ένα πρότυπο azd είναι **ένα αποθετήριο Git** που περιέχει, τουλάχιστον:

| Αρχείο / φάκελος | Σκοπός | Απαιτείται; |
|---------------|---------|-----------|
| `azure.yaml` | Περιγράφει υπηρεσίες, κεντρικούς υπολογιστές, και πάροχο υποδομής | ✅ Ναι |
| `infra/` | Ορισμοί παροχής Bicep ή Terraform | Απαιτείται για αυτό το παράδειγμα ρητής Υποδομής-ως-Κώδικας; έργα με παράγεται υποδομή μπορούν να το παραλείψουν |
| `src/` (ή κώδικά σας) | Ο κώδικας εφαρμογής που αναπτύσσει το azd | Απαραίτητο για υπηρεσίες με βάση την πηγή; δεν έχουν όλα τα πρότυπα κώδικα εφαρμογής |
| `README.md` | Πώς να χρησιμοποιήσετε το πρότυπο | ✅ Ισχυρά συνιστώμενο |
| `.azdo/` ή `.github/` | Ορισμοί pipeline CI/CD | Προαιρετικό |
| `.devcontainer/` | Αναπαραγωγίσιμο περιβάλλον ανάπτυξης | Προαιρετικό |
| `azure.yaml` `metadata` | Ταυτότητα/τηλεμετρία προτύπου | Συνιστώμενο; η δημοσίευση ενός αποθετηρίου Git δεν το απαιτεί |

Δεν υπάρχει τίποτα μαγικό εδώ: όταν εκτελείτε `azd init --template you/your-repo`, το azd κλωνοποιεί το repo και διαβάζει `azure.yaml`.

---

## Βήμα 1: Δημιουργία του Αποθετηρίου

Δημιουργήστε τη δομή φακέλων χειροκίνητα ή ξεκινήστε από ένα ελάχιστο πρότυπο και επεξεργαστείτε το:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Μια τυπική ολοκληρωμένη διάταξη μοιάζει ως εξής:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Βήμα 2: Γράψτε `azure.yaml`

Αυτό είναι η καρδιά του προτύπου. Λέει στο azd τι να αναπτύξει και πώς:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Το πεδίο `metadata.template` είναι αυτό που χρησιμοποιεί η τηλεμετρία της γκαλερί για την καταμέτρηση χρήσης. Χρησιμοποιήστε την σύμβαση `name@version`.

---

## Βήμα 3: Παραμετροποιήστε την Υποδομή

Ο πιο σημαντικός κανόνας για ένα *επαναχρησιμοποιήσιμο* πρότυπο: **ποτέ μη σκληροκωδικοποιείτε ονόματα, περιοχές, ή τιμές συγκεκριμένες στη συνδρομή.** Χρησιμοποιήστε παραμέτρους και το πρότυπο resource token ώστε το ίδιο πρότυπο να λειτουργεί σε οποιαδήποτε συνδρομή.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Δύο πράγματα κάνουν αυτό το πρότυπο φιλικό:

1. **Ετικέτα `azd-env-name`** — το azd το χρησιμοποιεί για να παρακολουθεί και να καθαρίζει πόρους ανά περιβάλλον.
2. **`uniqueString(...)` resource token** — παράγει ένα σταθερό καταληκτικό hash για να μειώνει συγκρούσεις; δεν εγγυάται παγκόσμια μοναδικότητα.

Το λείπον `modules/web.bicep` πρέπει να δέχεται `name`, `location`, και `tags`, να παρέχει το περιβάλλον/μητρώο Container Apps και την εφαρμογή, να ετικετάρει την εφαρμογή με `azd-service-name: web`, και να εξάγει `uri`. Πρέπει επίσης να εκθέτει τιμές μητρώου που χρειάζεται η επιλεγμένη ροή build/deploy (για παράδειγμα `AZURE_CONTAINER_REGISTRY_ENDPOINT` από το root module). Μια μόνο έξοδος endpoint δεν διασυνδέει ανακάλυψη υπηρεσίας, ρυθμίσεις εφαρμογής, ή πιστοποίηση μητρώου.

Παρέχετε ένα κατάλληλο αρχείο παραμέτρων που διαβάζει τις τιμές που το azd εγχέει από το περιβάλλον:

Αποθηκεύστε το ακόλουθο ως `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

Το azd αντικαθιστά αυτόματα `${AZURE_ENV_NAME}` και `${AZURE_LOCATION}` από το τρέχον περιβάλλον.

---

## Βήμα 4: Δοκιμάστε το Πρότυπό σας Τοπικά

Πριν τη διανομή, αποδείξτε ότι το πρότυπο λειτουργεί από καθαρή κατάσταση.

**Δοκιμάστε από τον τοπικό φάκελο** (δεν απαιτείται Git push):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Έπειτα δοκιμάστε την αποδόμηση**—ένα καλό πρότυπο καθαρίζει πλήρως:

```bash
azd down --force --purge
```

Αν το `azd down` αφήνει πόρους πίσω, ελέγξτε την ανακάλυψη περιβάλλοντος/ομάδας πόρων, εξωτερικούς/κοινόχρηστους πόρους, δικαιώματα, κλειδώματα, και προστασία κάθαρσης. Το `--purge` δεν διαγράφει την τοπική κατάσταση `.azure/`.

> **Συμβουλή:** αφού παρέχετε όλα τα λείποντα αρχεία, τρέξτε πρώτα `azd provision --preview`. Ελέγξτε τα hooks πριν από την προεπισκόπηση γιατί μπορούν να εκτελέσουν εντολές με παρενέργειες. Η προεπισκόπηση δεν είναι εκτίμηση κόστους ή εγγύηση ότι η παροχή θα πετύχει.

---

## Βήμα 5: Δημοσιεύστε το Πρότυπο

Σπρώξτε το αποθετήριο στο GitHub (δημόσιο αν θέλετε άλλοι να το χρησιμοποιήσουν):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Ο καθένας πλέον μπορεί να το χρησιμοποιήσει:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Βήμα 6 (Προαιρετικό): Υποβολή στο Awesome AZD

Η [γκαλερί Awesome AZD](https://azure.github.io/awesome-azd/) καταγράφει πρότυπα κοινότητας. Για να εμφανιστεί το repo σας πρέπει να περιλαμβάνει:

- ✅ Ένα σαφές `README.md` με προαπαιτούμενα, διάγραμμα αρχιτεκτονικής, και σημειώσεις κόστους
- ✅ Ένα λειτουργικό `azure.yaml` με `metadata.template`
- ✅ Υποδομή που προμηθεύεται καθαρά σε νέα συνδρομή
- ✅ Ένα αρχείο `LICENSE`
- ✅ (Συνιστάται) Ένα `.devcontainer/` για άμεση εκκίνηση Codespaces

Υποβάλετε ανοίγοντας ένα pull request που προσθέτει το πρότυπό σας στο αρχείο δεδομένων της γκαλερί, ακολουθώντας τον οδηγό συνεισφοράς στο [αποθετήριο Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Συνήθη Σφάλματα

| Σφάλμα | Διόρθωση |
|---------|-----|
| Ονόματα πόρων σκληροκωδικοποιημένα | Χρησιμοποιήστε το `uniqueString()` resource token |
| Το `azd down` αφήνει πόρους | Ετικετάρετε κάθε πόρο (ή την ομάδα πόρων) με `azd-env-name` |
| Το πρότυπο λειτουργεί για εσάς, αποτυγχάνει για άλλους | Αφαιρέστε IDs συνδρομής, IDs ενοικιαστή, και υποθέσεις περιοχής |
| Τα outputs δεν συνδέονται στην εφαρμογή | Ταιριάξτε `azd-service-name`/`resourceName` για ανάπτυξη και χαρτογραφήστε ρητά outputs σε ρυθμίσεις εφαρμογής |
| Η υποβολή γκαλερί απορρίφθηκε | Προσθέστε `README.md`, `LICENSE`, και `metadata.template` |

---

## Περίληψη

- Ένα πρότυπο είναι απλά ένα repo Git με `azure.yaml`, `infra/`, και τον κώδικά σας.
- Παραμετροποιήστε τα πάντα — ονόματα, περιοχές, και IDs — ώστε να τρέχει παντού.
- Πάντα ετικετάρετε τους πόρους με `azd-env-name` ώστε το `azd down` να λειτουργεί.
- Δοκιμάστε το τοπικά με `azd init --template <local-path>` πριν τη δημοσίευση.
- Προσθέστε μεταδεδομένα και README για υποβολή στο Awesome AZD.

---

## 🔗 Πλοήγηση

| Κατεύθυνση | Πόρος |
|-----------|----------|
| **Προηγούμενο** | [Οδηγός Ανάπτυξης](deployment-guide.md) |
| **Αρχική Κεφαλαίου** | [Κεφάλαιο 4: Υποδομή ως Κώδικας](README.md) |
| **Επόμενο Κεφάλαιο** | [Κεφάλαιο 5: Πολυ-Πρακτικές Λύσεις](../chapter-05-multi-agent/README.md) |

## 📖 Σχετικοί Πόροι

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Επίσημη τεκμηρίωση προτύπου azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->