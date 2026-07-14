# Δημιουργία του δικού σας προτύπου azd

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 4 - Υποδομή ως Κώδικας & Ανάπτυξη
- **⬅️ Προηγούμενο**: [Οδηγός Ανάπτυξης](deployment-guide.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 5: Πολλαπλοί Πράκτορες](../chapter-05-multi-agent/README.md)

> Επικυρώθηκε με `azd 1.27.1` τον Ιούλιο του 2026.

## Εισαγωγή

Μέχρι στιγμής έχετε *καταναλώσει* πρότυπα με την εντολή `azd init --template <name>`. Όμως μόλις έχετε μια διάταξη έργου που αρέσει στην ομάδα σας — π.χ. μια εφαρμογή Container App με μια Cosmos DB και το σωστό monitoring — θα θέλετε να τη μετατρέψετε σε ένα επαναχρησιμοποιήσιμο πρότυπο δικό σας. Ένα πρότυπο είναι απλώς ένα αποθετήριο Git με μια προβλέψιμη δομή που το azd ξέρει να διαβάζει. Αυτό το μάθημα σας δείχνει πώς να δημιουργήσετε ένα από το μηδέν, να το δοκιμάσετε, και (προαιρετικά) να το δημοσιεύσετε στην κοινότητα.

## Στόχοι Μάθησης

Στο τέλος αυτού του μαθήματος, θα:
- Κατανοήσετε τι κάνει έναν φάκελο "πρότυπο azd"
- Γνωρίζετε τα απαιτούμενα αρχεία και τη δομή φακέλων
- Προσθέσετε ένα `azure.yaml` και `infra/` που άλλοι μπορούν να ξαναχρησιμοποιήσουν
- Δοκιμάσετε το πρότυπό σας τοπικά πριν το μοιραστείτε
- Δημοσιεύσετε και (προαιρετικά) να το υποβάλετε στο community gallery του Awesome AZD

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε να:
- Δημιουργήσετε ένα νέο αποθετήριο προτύπου
- Παραμετροποιήσετε την υποδομή έτσι ώστε να λειτουργεί σε οποιαδήποτε συνδρομή
- Επικυρώσετε ένα πρότυπο με τις εντολές `azd init` και `azd up`
- Προσθέσετε τα μεταδεδομένα που απαιτεί η κοινότητα gallery

---

## Τι Είναι Ένα Πρότυπο Πραγματικά;

Ένα πρότυπο azd είναι **ένα αποθετήριο Git** που περιέχει, τουλάχιστον:

| Αρχείο / φάκελος | Σκοπός | Απαιτείται; |
|---------------|---------|-----------|
| `azure.yaml` | Περιγράφει υπηρεσίες, hosts, και πάροχο υποδομής | ✅ Ναι |
| `infra/` | Bicep, Terraform, ή Pulumi που προμηθεύει πόρους | ✅ Ναι |
| `src/` (ή ο κώδικάς σας) | Ο κώδικας εφαρμογής που αναπτύσσει το azd | ✅ Ναι |
| `README.md` | Πώς να χρησιμοποιήσετε το πρότυπο | ✅ Ισχυρώς συνιστώμενο |
| `.azdo/` ή `.github/` | Ορισμοί pipeline CI/CD | Προαιρετικό |
| `.devcontainer/` | Αναπαραγώγιμο περιβάλλον ανάπτυξης | Προαιρετικό |
| `azure.yaml` `metadata` | Πληροφορίες gallery + τηλεμετρίας | Προαιρετικό (απαραίτητο για δημοσίευση) |

Δεν υπάρχει τίποτα μαγικό εδώ: όταν τρέχετε `azd init --template you/your-repo`, το azd κλωνοποιεί το αποθετήριο και διαβάζει το `azure.yaml`.

---

## Βήμα 1: Δημιουργία του Αποθετηρίου

Δημιουργήστε τη δομή των φακέλων με το χέρι ή ξεκινήστε από ένα ελάχιστο πρότυπο και επεξεργαστείτε το:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Δημιουργήστε την τυπική διάταξη
mkdir -p src infra
```

Μια τυπική ολοκληρωμένη διάταξη είναι ως εξής:

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

## Βήμα 2: Γράψτε το `azure.yaml`

Αυτό είναι η καρδιά του προτύπου. Λέει στο azd τι να αναπτύξει και πώς:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Το πεδίο `metadata.template` είναι αυτό που χρησιμοποιεί η τηλεμετρία της gallery για να μετρήσει τη χρήση. Χρησιμοποιήστε τη σύμβαση `name@version`.

---

## Βήμα 3: Παραμετροποιήστε την Υποδομή

Ο πιο σημαντικός κανόνας για ένα *επαναχρησιμοποιήσιμο* πρότυπο: **ποτέ μην σκληροκωδικοποιείτε ονόματα, περιοχές ή τιμές συγκεκριμένες για συνδρομή.** Χρησιμοποιήστε παραμέτρους και το πρότυπο resource token ώστε το ίδιο πρότυπο να λειτουργεί σε οποιαδήποτε συνδρομή.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Δύο πράγματα κάνουν αυτό το πρότυπο φιλικό στο πρότυπο:

1. **Η ετικέτα `azd-env-name`** — το azd τη χρησιμοποιεί για να παρακολουθεί και να καθαρίζει πόρους ανά περιβάλλον.
2. **Ο resource token `uniqueString(...)`** — παράγει ένα σταθερό, παγκοσμίως μοναδικό επίθημα ώστε τα ονόματα να μην συγκρούονται.

Παρέχετε ένα αντίστοιχο αρχείο παραμέτρων που διαβάζει τιμές που το azd εγχέει από το περιβάλλον:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

Το azd υποκαθιστά αυτόματα τα `${AZURE_ENV_NAME}` και `${AZURE_LOCATION}` από το τρέχον περιβάλλον.

---

## Βήμα 4: Δοκιμάστε το Πρότυπό σας Τοπικά

Πριν τη διανομή, αποδείξτε ότι το πρότυπο λειτουργεί από καθαρή κατάσταση.

**Δοκιμάστε από τον τοπικό φάκελο** (δεν απαιτείται ώθηση στο Git):

```bash
# Από έναν κενό φάκελο, ξεκινήστε χρησιμοποιώντας την τοπική διαδρομή προτύπου σας
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Προετοιμασία + ανάπτυξη από την αρχή έως το τέλος
azd auth login
azd up
```

**Στη συνέχεια δοκιμάστε το teardown** — ένα καλό πρότυπο καθαρίζει πλήρως:

```bash
azd down --force --purge
```

Αν η εντολή `azd down` αφήνει πίσω πόρους, πιθανότατα ξεχάσατε την ετικέτα `azd-env-name` σε κάποιο πόρο.

> **Συμβουλή:** Τρέξτε πρώτα `azd provision --preview`. Εκτελεί ένα what-if και εμφανίζει σφάλματα προτύπου πριν δημιουργηθεί οποιοσδήποτε πόρος.

---

## Βήμα 5: Δημοσιεύστε το Πρότυπο

Σπρώξτε το αποθετήριο στο GitHub (δημόσιο αν θέλετε να το χρησιμοποιούν άλλοι):

```bash
gh repo create my-azd-template --public --source=. --push
```

Οποιοσδήποτε μπορεί τώρα να το χρησιμοποιήσει:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Βήμα 6 (Προαιρετικό): Υποβολή στο Awesome AZD

Η [γκαλερί Awesome AZD](https://azure.github.io/awesome-azd/) καταγράφει πρότυπα από την κοινότητα. Για να καταχωρηθεί το αποθετήριό σας θα πρέπει να περιλαμβάνει:

- ✅ Ένα σαφές `README.md` με προαπαιτούμενα, διάγραμμα αρχιτεκτονικής, και σημειώσεις κόστους
- ✅ Ένα λειτουργικό `azure.yaml` με `metadata.template`
- ✅ Υποδομή που προμηθεύεται καθαρά σε μια νέα συνδρομή
- ✅ Ένα αρχείο `LICENSE`
- ✅ (Συνιστώμενο) Έναν `.devcontainer/` για ανάπτυξη με ένα κλικ σε Codespaces

Κάντε υποβολή ανοίγοντας ένα pull request που προσθέτει το πρότυπό σας στο αρχείο δεδομένων της gallery, ακολουθώντας τον οδηγό συμβολής στο [αποθετήριο Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Συνηθισμένα Σφάλματα

| Σφάλμα | Διόρθωση |
|---------|-----|
| Σκληροκωδικοποιημένα ονόματα πόρων | Χρησιμοποιήστε το resource token `uniqueString()` |
| Η εντολή `azd down` αφήνει πόρους | Επισημάνετε κάθε πόρο (ή την ομάδα πόρων) με `azd-env-name` |
| Το πρότυπο δουλεύει για εσάς, αποτυγχάνει για άλλους | Αφαιρέστε τα IDs συνδρομών, tenant IDs, και υποθέσεις περιοχής |
| Εκροές που δεν συνδέονται στην εφαρμογή | Εξάγετε το `SERVICE_<NAME>_ENDPOINT_URL` και άλλες εκροές `AZURE_*` |
| Απορρίφθηκε η υποβολή στην gallery | Προσθέστε `README.md`, `LICENSE`, και `metadata.template` |

---

## Συνοπτικά

- Ένα πρότυπο είναι απλώς ένα αποθετήριο Git με `azure.yaml`, `infra/`, και τον κώδικά σας.
- Παραμετροποιήστε τα πάντα — ονόματα, περιοχές, και IDs — έτσι ώστε να λειτουργεί παντού.
- Πάντα επισημαίνετε τους πόρους με `azd-env-name` ώστε να λειτουργεί το `azd down`.
- Δοκιμάστε το τοπικά με `azd init --template <local-path>` πριν το δημοσιεύσετε.
- Προσθέστε μεταδεδομένα και README για υποβολή στο Awesome AZD.

---

## 🔗 Πλοήγηση

| Κατεύθυνση | Πόρος |
|-----------|----------|
| **Προηγούμενο** | [Οδηγός Ανάπτυξης](deployment-guide.md) |
| **Αρχική Κεφαλαίου** | [Κεφάλαιο 4: Υποδομή ως Κώδικας](README.md) |
| **Επόμενο Κεφάλαιο** | [Κεφάλαιο 5: Πολλαπλοί Πράκτορες](../chapter-05-multi-agent/README.md) |

## 📖 Σχετικοί Πόροι

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Επίσημη τεκμηρίωση προτύπου azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->