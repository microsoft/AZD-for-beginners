# 4. Διαμόρφωση Προτύπου

!!! tip "ΣΤΟ ΤΕΛΟΣ ΑΥΤΟΥ ΤΟΥ ΜΑΘΗΜΑΤΟΣ ΘΑ ΕΙΣΤΕ ΙΚΑΝΟΙ ΝΑ"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Ξεκινήστε με το πραγματικό πρότυπο

Ανοίξτε το [`azure.yaml` στο Ξεκινήστε με AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) στο αποθετήριο που αρχικοποιήσατε. Το πρότυπο upstream μπορεί να αλλάξει ανεξάρτητα από αυτό το εργαστήριο. Το ακόλουθο **απόσπασμα** ελέγχθηκε στις 4 Νοεμβρίου 2026· δεν αποτελεί αντικατάσταση του πλήρους αρχείου:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` καθορίζει το έργο AZD· `metadata.template` καταγράφει την έκδοση του προτύπου.
- `requiredVersions.azd` είναι το ελάχιστο του προτύπου, όχι σύσταση για παραμονή σε παλαιό CLI. Χρησιμοποιήστε μια τρέχουσα υποστηριζόμενη έκδοση AZD.
- `services` ορίζει στόχους ανάπτυξης εφαρμογής. Αυτό το πρότυπο αναπτύσσει το API Python και το frontend ως μία υπηρεσία Container Apps.
- `project` είναι σχετικό με `azure.yaml`.
- `remoteBuild` ζητά απομακρυσμένη κατασκευή container. Η ταυτότητά σας χρειάζεται ακόμη τις απαιτούμενες άδειες Azure.

Τα αρχεία Bicep του προτύπου κάτω από `infra/`, όχι μόνο η λίστα `services`, δηλώνουν πόρους όπως Microsoft Foundry, αναπτύξεις μοντέλων, αποθήκευση και προαιρετική Αναζήτηση AI.

## 2. Κατανοήστε τα hooks κύκλου ζωής

Εξετάστε την ενότητα `hooks` και τα σχετιζόμενα σενάρια πριν εκτελέσετε το πρότυπο. Η αναθεωρημένη έκδοση περιέχει:

| Hook | Σκοπός | Σημαντική συμπεριφορά |
|------|---------|--------------------|
| `preup` | Επικύρωση εισόδων περιβάλλοντος προτύπου πριν τη ροή εργασίας `up` | Τα scripts shell ειδικά για την πλατφόρμα μπορούν να διακόψουν τη ροή εργασίας σε αποτυχία |
| `postdeploy` | Εκτέλεση ρυθμίσεων συγκεκριμένων για το πρότυπο μετά την ανάπτυξη εφαρμογής | Εξετάστε `continueOnError` και την έξοδο script· μια επιτυχημένη ανάπτυξη δεν αποδεικνύει κάθε εργασία ρύθμισης |

Αυτή η έκδοση **δεν** περιέχει το παλαιότερο hook `postprovision` / `write_env` που εμφανίζεται σε προηγούμενο υλικό εργαστηρίου. Μην αντιγράφετε αναφορές hook σε scripts που δεν υπάρχουν πλέον.

Τα κλειδιά hook επιλέγουν γεγονότα κύκλου ζωής· `posix` και `windows` επιλέγουν υλοποιήσεις πλατφόρμας. `shell`, `run`, `interactive`, και `continueOnError` ελέγχουν την εκτέλεση. Πρόκειται για εκτελέσιμα σενάρια με τις άδειές σας, οπότε εξετάστε τα όπως και τον κώδικα μιας εφαρμογής.

Δείτε την [τεκμηρίωση AZD hooks](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) για ολόκληρο τον κύκλο ζωής.

## 3. Παρακολούθηση εισόδων περιβάλλοντος στην υποδομή

Εκτελέστε αυτές τις εντολές από το αρχικοποιημένο πρότυπο δείγματος:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Εξετάστε το `infra/main.parameters.json` για να δείτε ποιες μεταβλητές περιβάλλοντος καταναλώνει πραγματικά το πρότυπο. Η ονομασία με `azd env set` δεν αλλάζει αυτόματα έναν πόρο Azure.

Οι αναθεωρημένες προεπιλογές περιλαμβάνουν:

| Είσοδος | Προεπιλογή / σκοπός |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; οι μονάδες ποσόστωσης εξαρτώνται από το μοντέλο και τον τύπο ανάπτυξης |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; αφήστε απενεργοποιημένο εκτός αν έχει εξεταστεί ο χειρισμός δεδομένων |

Αυτές είναι είσοδοι ειδικές για το δείγμα, όχι παγκόσμιες ρυθμίσεις AZD. Ελέγξτε την [τεκμηρίωση υποστήριξης μοντέλου και περιοχής](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) και το ποσόστωση της συνδρομής σας πριν επιλέξετε μοντέλο, SKU, χωρητικότητα ή τοποθεσία. Μην ερμηνεύετε κάθε μονάδα χωρητικότητας ως 1.000 tokens ανά λεπτό.

Για να επιλέξετε διαφορετικό μοντέλο συνομιλίας, ενημερώστε το συμβατό **όνομα, έκδοση, φορμά, SKU, και χωρητικότητα μαζί**, ακολουθώντας τον [οδηγό προσαρμογής του δείγματος](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Η αλλαγή μόνο του ονόματος μπορεί να αφήσει μια ασύμβατη έκδοση ή τύπο ανάπτυξης.

## 4. Εργαστήριο: ενεργοποίηση προαιρετικής αναζήτησης και παρακολούθησης

!!! warning "Αυτές οι ρυθμίσεις μπορούν να προσθέσουν χρεώσιμους πόρους"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Οι αλλαγές στην υποδομή απαιτούν προμήθεια· μόνο το `azd deploy` αναπτύσσει υπηρεσίες εφαρμογής. Για ευρετηρίαση αναζήτησης και υποστηριζόμενες επιλογές ανάκτησης, ακολουθήστε τον [οδηγό AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Για παρακολούθηση, ακολουθήστε τον [οδηγό observability](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Μην ενεργοποιείτε την καταγραφή περιεχομένου προτροπής/απάντησης σε πραγματικά δεδομένα πελατών χωρίς την απαιτούμενη συγκατάθεση, ελέγχους πρόσβασης, πολιτική διατήρησης και απόκρυψη.

## 5. Υφιστάμενοι πόροι και CI/CD

Για επαναχρησιμοποίηση ενός έργου Foundry, ακολουθήστε τις [οδηγίες για υπάρχοντες πόρους](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) του δείγματος. Ο καθορισμός του `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` αλλάζει τη διαδρομή ανάπτυξης· σε αυτήν την περίπτωση, το πρότυπο δεν δημιουργεί Application Insights ή AI Search για εσάς. Επαληθεύστε ρητά τις εξαρτήσεις, εκχωρήσεις ρόλων και αναπτύξεις μοντέλων.

Η ενότητα `pipeline.variables` ελέγχει τιμές που περνιούνται σε ένα παραγόμενο pipeline· δεν είναι μυστική αποθήκη και δεν δημιουργεί πόρους Azure. Προτιμήστε διαχειριζόμενη ταυτότητα στην εφαρμογή και OIDC για CI/CD. Τα αρχεία περιβάλλοντος AZD είναι απλό κείμενο και δεν πρέπει να καταχωρούνται.

Η AZD υποστηρίζει την εισαγωγή ενός αξιόπιστου, τοπικά προετοιμασμένου αρχείου dotenv:

```bash
azd env set --file .env
```

Εξετάστε αυτό το αρχείο πριν το εισάγετε, και μην εκτυπώνετε αρχεία περιβάλλοντος που περιέχουν μυστικά σε κοινόχρηστα τερματικά ή αρχεία καταγραφής CI.

## 6. Ελέγξτε την κατανόησή σας

- Ποια υπηρεσία `azure.yaml` αναπτύσσει την εφαρμογή;
- Ποια παράμετρος υποδομής καταναλώνει κάθε τιμή που αλλάξατε;
- Ποιες αλλαγές απαιτούν προμήθεια αντί μόνο ανάπτυξη;
- Υποστήριξε η επιλεγμένη περιοχή και συνδρομή το μοντέλο και την ποσόστωση;
- Επέτυχαν όλα τα hooks ρύθμισης, και μπορείτε να επαληθεύσετε τη συμπεριφορά της αναπτυγμένης εφαρμογής;

Συνεχίστε στο [Προσαρμογή Προτύπου](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->