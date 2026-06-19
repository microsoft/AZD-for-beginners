# Δημιουργία του δικού σας προτύπου azd

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 4 - Υποδομή ως Κώδικας & Ανάπτυξη
- **⬅️ Προηγούμενο**: [Deployment Guide](deployment-guide.md)
- **🚀 Επόμενο Κεφάλαιο**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> Επαληθεύτηκε με `azd 1.25.6` τον Ιούνιο 2026.

## Εισαγωγή

Μέχρι τώρα έχετε *καταναλώσει* πρότυπα με `azd init --template <name>`. Αλλά μόλις έχετε μια διάταξη έργου που αρέσει στην ομάδα σας — για παράδειγμα, ένα Container App με ένα Cosmos DB και το σωστό monitoring — θα θελήσετε να το μετατρέψετε σε ένα επαναχρησιμοποιήσιμο πρότυπο δικό σας. Ένα πρότυπο είναι απλώς ένα αποθετήριο Git με μια προβλέψιμη δομή που το azd ξέρει πώς να διαβάσει. Αυτό το μάθημα σας δείχνει πώς να φτιάξετε ένα από το μηδέν, να το δοκιμάσετε, και (προαιρετικά) να το δημοσιεύσετε στη gallery της κοινότητας.

## Στόχοι Μάθησης

Στο τέλος αυτού του μαθήματος, θα:
- Κατανοείτε τι κάνει έναν φάκελο "πρότυπο azd"
- Γνωρίζετε τα απαιτούμενα αρχεία και τη διάταξη φακέλων
- Προσθέσετε ένα `azure.yaml` και `infra/` που άλλοι μπορούν να επαναχρησιμοποιήσουν
- Δοκιμάσετε το πρότυπό σας τοπικά πριν το μοιραστείτε
- Το δημοσιεύσετε και (προαιρετικά) το υποβάλετε στο Awesome AZD

## Αποτέλεσμα Μάθησης

Μετά την ολοκλήρωση αυτού του μαθήματος, θα είστε σε θέση να:
- Δημιουργήσετε ένα νέο αποθετήριο προτύπου
- Παραμετροποιήσετε την υποδομή ώστε να λειτουργεί σε οποιαδήποτε συνδρομή
- Επικυρώσετε ένα πρότυπο με `azd init` και `azd up`
- Προσθέσετε τα μεταδεδομένα που απαιτεί η gallery της κοινότητας

---

## Τι είναι πραγματικά ένα Πρότυπο;

Ένα πρότυπο azd είναι **ένα αποθετήριο Git** που περιέχει, το ελάχιστο:

| Αρχείο / φάκελος | Σκοπός | Απαιτείται; |
|------------------|--------|-------------|
| `azure.yaml` | Περιγράφει υπηρεσίες, hosts και τον πάροχο υποδομής | ✅ Ναι |
| `infra/` | Bicep, Terraform, ή Pulumi που προμηθεύει πόρους | ✅ Ναι |
| `src/` (ή ο κώδικάς σας) | Ο κώδικας της εφαρμογής που αναπτύσσει το azd | ✅ Ναι |
| `README.md` | Πώς να χρησιμοποιήσετε το πρότυπο | ✅ Ισχυρά συνιστάται |
| `.azdo/` ή `.github/` | Ορισμοί pipeline CI/CD | Προαιρετικό |
| `.devcontainer/` | Αναπαραγώγιμο περιβάλλον ανάπτυξης | Προαιρετικό |
| `azure.yaml` `metadata` | Πληροφορίες gallery + τηλεμετρίας | Προαιρετικό (απαιτείται για δημοσίευση) |

Δεν υπάρχει τίποτα μαγικό εδώ: όταν εκτελείτε `azd init --template you/your-repo`, το azd κλωνοποιεί το repo και διαβάζει το `azure.yaml`.

---

## Βήμα 1: Σκελετός του Αποθετηρίου

Δημιουργήστε τη δομή φακέλων χειροκίνητα ή ξεκινήστε από ένα ελάχιστο πρότυπο και επεξεργαστείτε το:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Δημιουργήστε την πρότυπη διάταξη
mkdir -p src infra
```

Μια τυπική τελική διάταξη μοιάζει με αυτήν:

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

## Βήμα 3: Παραμετροποίηση της Υποδομής

Ο πιο σημαντικός κανόνας για ένα *επαναχρησιμοποιήσιμο* πρότυπο: **μην ενσωματώνετε σκληρά ονόματα, περιοχές ή τιμές ειδικές για συνδρομές.** Χρησιμοποιήστε παραμέτρους και το pattern resource token ώστε το ίδιο πρότυπο να λειτουργεί σε οποιαδήποτε συνδρομή.

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

Δύο πράγματα κάνουν αυτό το πρότυπο φιλικό για πρότυπα:

1. **ετικέτα `azd-env-name`** — το azd τη χρησιμοποιεί για να παρακολουθεί και να καθαρίζει πόρους ανά περιβάλλον.
2. **το resource token `uniqueString(...)`** — παράγει ένα σταθερό, παγκοσμίως μοναδικό επίθημα ώστε τα ονόματα να μην συγκρούονται.

Παρέχετε ένα αντίστοιχο αρχείο παραμέτρων που διαβάζει τιμές που το azd εισάγει από το περιβάλλον:

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

Το azd αντικαθιστά `${AZURE_ENV_NAME}` και `${AZURE_LOCATION}` από το τρέχον περιβάλλον αυτόματα.

---

## Βήμα 4: Δοκιμάστε το Πρότυπό σας Τοπικά

Πριν το μοιραστείτε, αποδείξτε ότι το πρότυπο λειτουργεί από ένα καθαρό state.

**Δοκιμάστε από τον τοπικό φάκελο** (δεν απαιτείται προώθηση Git):

```bash
# Από έναν άδειο φάκελο, αρχικοποιήστε χρησιμοποιώντας τη διαδρομή τοπικού προτύπου
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Παροχή + ανάπτυξη από άκρο σε άκρο
azd auth login
azd up
```

**Έπειτα δοκιμάστε την αποδόμηση** — ένα καλό πρότυπο καθαρίζει τελείως:

```bash
azd down --force --purge
```

Εάν το `azd down` αφήνει πόρους πίσω, πιθανότατα παραβλέψατε την ετικέτα `azd-env-name` σε κάποιον πόρο.

> **Συμβουλή:** εκτελέστε πρώτα `azd provision --preview`. Εκτελεί ένα what-if και φανερώνει σφάλματα προτύπου πριν δημιουργηθεί οποιοσδήποτε πόρος.

---

## Βήμα 5: Δημοσιεύστε το Πρότυπο

Προωθήστε το αποθετήριο στο GitHub (δημόσιο αν θέλετε άλλοι να το χρησιμοποιήσουν):

```bash
gh repo create my-azd-template --public --source=. --push
```

Οποιοσδήποτε μπορεί τώρα να το χρησιμοποιήσει:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Βήμα 6 (Προαιρετικό): Υποβολή στο Awesome AZD

Η [Awesome AZD gallery](https://azure.github.io/awesome-azd/) καταγράφει πρότυπα της κοινότητας. Για να συμπεριληφθεί το repo σας θα πρέπει να περιλαμβάνει:

- ✅ Ένα σαφές `README.md` με προαπαιτούμενα, διάγραμμα αρχιτεκτονικής, και σημειώσεις κόστους
- ✅ Ένα λειτουργικό `azure.yaml` με `metadata.template`
- ✅ Υποδομή που προμηθεύεται καθαρά σε μια φρέσκια συνδρομή
- ✅ Ένα αρχείο `LICENSE`
- ✅ (Συνιστάται) Ένα `.devcontainer/` για one-click Codespaces

Υποβάλετε ανοίγοντας ένα pull request που προσθέτει το πρότυπό σας στο αρχείο δεδομένων της gallery, ακολουθώντας τον οδηγό συνεισφοράς στο [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Συνήθη Σφάλματα

| Σφάλμα | Διόρθωση |
|--------|----------|
| Σκληροκωδικοποιημένα ονόματα πόρων | Χρησιμοποιήστε το resource token `uniqueString()` |
| Το `azd down` αφήνει πόρους | Ετικετοποιήστε κάθε πόρο (ή την resource group) με `azd-env-name` |
| Το πρότυπο λειτουργεί για εσάς, αποτυγχάνει για άλλους | Αφαιρέστε IDs συνδρομής, tenant IDs, και υποθέσεις για περιοχές |
| Outputs που δεν συνδέονται με την εφαρμογή | Εξάγετε `SERVICE_<NAME>_ENDPOINT_URL` και άλλα `AZURE_*` outputs |
| Η υποβολή στη gallery απορρίφθηκε | Προσθέστε `README.md`, `LICENSE`, και `metadata.template` |

---

## Περίληψη

- Ένα πρότυπο είναι απλώς ένα Git repo με `azure.yaml`, `infra/`, και τον κώδικά σας.
- Παραμετροποιήστε τα πάντα — ονόματα, περιοχές και IDs — ώστε να τρέχει παντού.
- Πάντα ετικετοποιείτε τους πόρους με `azd-env-name` ώστε το `azd down` να λειτουργεί.
- Δοκιμάστε το τοπικά με `azd init --template <local-path>` πριν τη δημοσίευση.
- Προσθέστε μεταδεδομένα και ένα README για να το υποβάλετε στο Awesome AZD.

---

## 🔗 Πλοήγηση

| Κατεύθυνση | Πόρος |
|-----------|-------|
| **Προηγούμενο** | [Deployment Guide](deployment-guide.md) |
| **Αρχή Κεφαλαίου** | [Chapter 4: Infrastructure as Code](README.md) |
| **Επόμενο Κεφάλαιο** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 Σχετικοί Πόροι

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Επίσημη τεκμηρίωση προτύπων azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->