# Αρχείο αλλαγών - AZD Για Αρχάριους

## Εισαγωγή

Αυτό το αρχείο αλλαγών καταγράφει όλες τις αξιοσημείωτες αλλαγές, ενημερώσεις και βελτιώσεις στο αποθετήριο AZD Για Αρχάριους. Ακολουθούμε τις αρχές της σημασιολογικής εκδόσεως και διατηρούμε αυτό το αρχείο για να βοηθήσουμε τους χρήστες να κατανοήσουν τι έχει αλλάξει μεταξύ των εκδόσεων.

## Στόχοι μάθησης

Εξετάζοντας αυτό το αρχείο αλλαγών, θα:
- Διατηρείστε ενημερωμένοι σχετικά με νέες λειτουργίες και προσθήκες περιεχομένου
- Κατανοήστε τις βελτιώσεις που έγιναν στην υπάρχουσα τεκμηρίωση
- Παρακολουθείτε επισκευές σφαλμάτων και διορθώσεις για να εξασφαλίσετε ακρίβεια
- Ακολουθείστε την εξέλιξη των μαθησιακών υλικών με την πάροδο του χρόνου

## Αποτελέσματα μάθησης

Μετά την εξέταση των καταχωρήσεων στο αρχείο αλλαγών, θα μπορείτε να:
- Αναγνωρίζετε νέο περιεχόμενο και πόρους διαθέσιμους για μάθηση
- Κατανοείτε ποιες ενότητες έχουν ενημερωθεί ή βελτιωθεί
- Σχεδιάζετε το μαθησιακό σας μονοπάτι με βάση τα πιο τρέχοντα υλικά
- Συνεισφέρετε σχόλια και προτάσεις για μελλοντικές βελτιώσεις

## Ιστορικό Εκδόσεων

### [v3.25.0] - 2026-11-09

#### Η επέκταση Microsoft Foundry 1.0 είναι πλέον διαθέσιμη σε γενικές γραμμές

Το `microsoft.foundry` 1.0 πακέτο είναι **ζωντανό και διαθέσιμο γενικά**, όπως ανακοινώθηκε στις [5 Νοεμβρίου 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Το μάθημα τώρα διδάσκει την κυκλοφορημένη ροή εργασίας GA, όχι μια επερχόμενη έκδοση. Ξεκινήστε με AZD **1.37.0 ή μεταγενέστερο** και `azd ext install microsoft.foundry`.

#### Διαθέσιμο σε αυτήν την ενημέρωση μαθήματος
- Η αγγλική καθοδήγηση χρησιμοποιεί το πακέτο GA ως προεπιλεγμένη διαδρομή εγκατάστασης και εξηγεί τις επτά ανεξάρτητα εκδιδόμενες βασικές επεκτάσεις του.
- Ένας [περπατητικός οδηγός με hosted-agent](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) καλύπτει το δείγμα API Απαντήσεων Πλαισίου Python Agent upstream, τον τρέχοντα uv, Python 3.13+, την επιλογή νέου/υφιστάμενου έργου, την επαναχρησιμοποίηση μοντέλου και την ανασκόπηση του `azure.yaml`.
- Η ροή εργασίας τοπικό-προς-cloud καλύπτει δοκιμές Agent Inspector, το κόστος κλήσεων μοντέλου υποστηριζόμενο από Azure, απομακρυσμένες κατασκευές κώδικα, αναπτύξεις κλήσεων, ιχνηλάτηση στο cloud, προεπισκόπηση ανάπτυξης, αρχεία καταγραφής και διαγνωστικά.
- Ξεχωριστή καθοδήγηση αξιολόγησης καλύπτει τη δημιουργία και ανασκόπηση συνόλων δεδομένων/κριτηρίων, τη διαμόρφωση ονομασμένης αξιολόγησης, την καταχώριση πόρων και την επιθεώρηση αποτελεσμάτων. Οι παλαιότερες οδηγίες αξιολόγησης/βελτιστοποίησης μένουν ως ιστορικό μετανάστευσης, όχι η τρέχουσα βάση έκδοσης.
- Η καθοδήγηση Foundry CI/CD περιλαμβάνει εγκατάσταση επεκτάσεων runner, αυθεντικοποιημένη ανάπτυξη, πρόσβαση/πόρους αξιολόγησης και μια ρητή πύλη ποιότητας.
- Η καθοδήγηση καθαρισμού διακρίνει νέα και επαναχρησιμοποιημένα έργα Foundry. Το εργαστήριο συνδέεται με την ξεχωριστή άσκηση GA χωρίς να αντικαθιστά τις ειδικές δοκιμές του δείγματος.
- Η πλοήγηση στο μάθημα, οι μαθησιακοί στόχοι, οι προαπαιτούμενες ρυθμίσεις, η σύντομη αναφορά, οι συχνές ερωτήσεις και ο οδηγός μελέτης αντικατοπτρίζουν τη ροή εργασίας GA. Οι παραγόμενες μεταφράσεις δεν επιμελούνται χειροκίνητα.

#### Πεδίο ανασκόπησης
- Βασισμένο στην ανακοίνωση GA, στη συνδεδεμένη καθοδήγηση Microsoft Learn και στην upstream δειγματοληπτική ρύθμιση. Δεν πραγματοποιήθηκε ζωντανή παροχή Azure, ανάπτυξη, κλήση μοντέλου ή αξιολόγηση.
- Η έκδοση πακέτου GA δεν σηματοδοτεί GA για κάθε προαιρετική λειτουργία, ανεξάρτητη επέκταση ή SDK, ούτε πιστοποιεί τα παραδείγματα για παραγωγική χρήση.

### [v3.24.0]- 2026-11-04

#### Διορθώσεις
- Επιδιορθώθηκε η πλοήγηση αγγλικού μαθήματος, οι διαδρομές μετακινημένων σελίδων, τα ελλιπή άγκιστρα και οι παρωχημένες εξωτερικές αναφορές, συμπεριλαμβανομένου του συνδέσμου Κεφαλαίου 2 για τον οδηγό παραγωγής AI.
- Ανασκοπήθηκε η τρέχουσα καθοδήγηση σε σύγκριση με το δημοσιευμένο AZD 1.37.2, τους agents 1.0.0-beta.23 και τις αξιολογήσεις 1.0.0-beta.2. Τεκμηριώθηκε η ξεχωριστή ροή εργασίας `azd ai eval` και η μετανάστευση διαμόρφωσης βελτιστοποίησης.
- Διορθώθηκαν μη υποστηριζόμενες σημαίες CLI, όρια αυθεντικοποίησης, οδηγίες περιβάλλοντος/μυστικού απλού κειμένου, ενημερώσεις υποδομής, διαμόρφωση μοντέλου και παραδείγματα καταστροφικής ανάκτησης.
- Ανανεώθηκε το εργαστήριο έναντι του τρέχοντος AI Agents δείγματος, συμπεριλαμβανομένων πραγματικών hooks, εισόδων διαμόρφωσης, δοκιμών αξιολόγησης, σημείων εισόδου red-teaming και παρατηρησιμότητας.
- Διορθώθηκαν ισχυρισμοί υλοποίησης παραδειγμάτων και επιδιορθώθηκαν συσχετιζόμενα ζητήματα εφαρμογής/υποδομής/διαμόρφωσης. Το υλικό αρχιτεκτονικής λιανικής διακρίνεται ρητά από μια πλήρη λειτουργική εφαρμογή.
- Επαναφέρθηκε ο πίνακας γλωσσών CodeQL, επιλέχθηκε υποστηριζόμενη Node.js 24 για το dev container και οι επιταχυντές εγκατάστασης αναφέρουν αποτυχημένες εντολές εκδόσεων.

#### Προσθήκες
- Ένα μόνο αγγλικό εργαλείο ελέγχου offline συνδέσμων/αγκίστρων, δοκιμές παλινδρόμησης και μια ροή εργασίας τεκμηρίωσης που ετοιμάζει το εργαστήριο σε αυστηρή λειτουργία. Οι παραγόμενες μεταφράσεις και οι μεταφρασμένες εικόνες εξαιρούνται.

#### Πεδίο επικύρωσης
- Έλεγχοι πηγής, σύνταξης, διαμόρφωσης, τοπικής συμπεριφοράς και δικτυακών συνδέσμων δεν αποδεικνύουν ζωντανή δυνατότητα ανάπτυξης Azure, ποσόστωσης, RBAC, διαθεσιμότητας μοντέλου ανά περιοχή, χρέωσης, συμμόρφωσης ασφαλείας ή ετοιμότητας παραγωγής.
- Παλαιότερες καταχωρήσεις παρακάτω είναι ιστορικά αρχεία, όχι τρέχουσες εντολές ή οδηγίες έκδοσης.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Αναζωογόνηση: Ενημέρωση Ισοτιμίας Έκδοσης
**Αυτή η έκδοση επικυρώνει ξανά το μάθημα έναντι `azd` `1.27.1` (Ιούλιος 2026, τελευταία σταθερή έκδοση) και της τρέχουσας προεπισκόπησης επέκτασης AI agent `azure.ai.agents` `1.0.0-beta.5`, ενημερώνοντας κάθε μπάνερ "επικυρωμένο έναντι" μετά τις εκδόσεις 1.26.0, 1.27.0 και 1.27.1.**

#### Αλλαγές
- **✅ Αναβαθμισμένη βάση επικύρωσης** από `azd 1.25.6` (Ιούνιος 2026) σε `azd 1.27.1` (Ιούλιος 2026) σε όλα τα README αρχικά, όλων των κεφαλαίων, το μάθημα dev-container στο Κεφάλαιο 1 (συμπεριλαμβανομένων παραδειγμάτων καρφιτσωμένων εκδόσεων), το μάθημα προσαρμοσμένων προτύπων του Κεφαλαίου 4, το μάθημα πολλαπλών πρακτόρων του Κεφαλαίου 5 και τα έγγραφα εργαστηρίων
- **🤖 Ανανεώθηκε η βάση του Κεφαλαίου 2** από `azd 1.23.12` (Μάρτιος 2026) σε `azd 1.27.1` σε `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` και `microsoft-foundry-integration.md`· ενημερώθηκαν οι ημερομηνίες σημειώματος επικύρωσης σε 2026-07-13
- **🧩 Αναβαθμίστηκε η επέκταση AI agent** από `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` στην τρέχουσα έκδοση `1.0.0-beta.5` στο README του Κεφαλαίου 2 και `agents.md`
- **🧪 Ενημέρωση παράδειγμα επικύρωσης εργαστηρίου** (`azd version` έξοδος) σε `1.27.1`

#### Σημειώσεις σχετικά με τις σχετικές εκδόσεις azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Υποστήριξη Go για Azure Functions σε Flex Consumption, `azd config sub-filter` φίλτρα συνδρομών ανά ενοικιαστή, αυτόνομα πακέτα επεκτάσεων (`azd x pack --bundle`) και `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Μοντέλα έργων/πρακτόρων Azure AI Foundry απευθείας σε `azure.yaml` (εκκίνηση χωρίς Bicep/Terraform), υποστήριξη ανάπτυξης κοντέινερ για App Service (`host: appservice` + `language: docker`), απευθείας `-s/--source` για εντολές `azd extension` και `azd tool uninstall`
- **1.27.1 (2026-07-09):** Σημαία `--no-dependencies` για `azd extension install`, τα ξεπερασμένα μοντέλα εξαιρούνται από προτροπές καταλόγου/ποσόστωσης από προεπιλογή, και πολλές διορθώσεις σφαλμάτων

#### Ενημερωμένα αρχεία
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Συμπλήρωμα τομών αρχαρίων #2: Δημιουργία Προτύπων, Dev Containers, Pulumi, Azure DevOps, Service Principals και άλλα
**Αυτή η έκδοση κλείνει τα εναπομείναντα ενδιάμεσα κενά που έδειξε η ανάλυση azd-coverage: πώς να δημιουργήσετε και να δημοσιεύσετε το δικό σας πρότυπο, αναπαραγόμενα περιβάλλοντα dev-container/Codespaces, τον πάροχο υποδομής Pulumi, έναν οδηγό Azure DevOps CI/CD, πιστοποίηση υπηρεσιών, καθοδήγηση επιλογής host (AKS/Spring Apps), εξηγήσεις `azd restore`/`azd package`, διαχείριση σφαλμάτων hooks και πρακτικές ομάδας/κοινόχρηστου περιβάλλοντος.**

#### Προσθήκες
- **🧱 Νέο μάθημα Κεφαλαίου 4** `docs/chapter-04-infrastructure/custom-templates.md` — δημιουργία του δικού σας προτύπου azd: απαιτούμενη δομή (`azure.yaml`, `infra/`, `src/`), το πεδίο `metadata.template`, παραμετροποίηση υποδομής με το `uniqueString()` resource token και το `azd-env-name` tag, τοπικός έλεγχος με `azd init --template <local-path>`, δημοσίευση στο GitHub και υποβολή στην γκαλερί Awesome AZD
- **📦 Νέο μάθημα Κεφαλαίου 1** `docs/chapter-01-foundation/dev-containers.md` — αναπαραγόμενα περιβάλλοντα azd με Dev Containers και GitHub Codespaces: ένα ελάχιστο `.devcontainer/devcontainer.json` χρησιμοποιώντας τη επίσημη λειτουργία `ghcr.io/azure/azure-dev/azd`, λειτουργίες ειδικές γλώσσας, `docker-in-docker` για container hosts και `azd auth login --use-device-code` για απομακρυσμένη σύνδεση
- **🧩 Pulumi με azd** ενότητα στο `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, διάταξη φακέλων Pulumi, στοίβες συνδεδεμένες με περιβάλλοντα azd, απαιτούμενα `azd up` / `azd down` εξόδους και την ίδια ροή εργασίας
- **🎯 Καθοδήγηση επιλογής host** στο `docs/chapter-04-infrastructure/provisioning.md` — μια φιλική προς αρχάριους σύγκριση `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` και `springapp`, με οδηγίες για το πότε να επιλέξετε AKS ή Azure Spring Apps
- **🛠️ Οδηγός Azure DevOps CI/CD** στο `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, σύνδεση υπηρεσίας με workload identity federation (OIDC), το παραγόμενο `azure-dev.yml` και ρύθμιση ομάδας μεταβλητών
- **🔑 Service Principals (Pattern 4)** προστέθηκε στο `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, μη αλληλεπιδραστική `azd auth login` με client secret vs. διαπιστευτήρια ομοσπονδίας/OIDC, πότε να χρησιμοποιείται και ασφαλής αποθήκευση διαπιστευτηρίων
- **🪝 Διαχείριση σφαλμάτων hook** υποενότητα στο `docs/chapter-04-infrastructure/deployment-guide.md` — κωδικοί εξόδου και `set -e`, `continueOnError`, απομόνωση δοκιμών hooks με `azd hooks run`, περιβάλλοντα γραμμής εντολών OS και `--debug`
- **👥 Ομαδικά / κοινόχρηστα περιβάλλοντα** ενότητα στο `docs/chapter-03-configuration/configuration.md` — τι ζει στο `.azure/`, τι να gitignore, περιβάλλοντα ανά προγραμματιστή, `azd env list`/`select` και παροχή τιμών περιβάλλοντος σε CI/CD
- **🧰 Επεξηγήσεις `azd restore` και επεκτάσεις `azd package`** στο `resources/cheat-sheet.md` — αποκατάσταση εξαρτήσεων και κατασκευή αναπτύξιμου αντικειμένου χωρίς ανάπτυξη

#### Αλλαγές
- **🧭 Πίνακας μαθημάτων Κεφαλαίου 4** ενημερώθηκε για να συμπεριλάβει το νέο μάθημα "Δημιουργία του δικού σας προτύπου" (Μάθημα 3)
- **🧭 Πίνακας μαθημάτων Κεφαλαίου 1** ενημερώθηκε για να συμπεριλάβει το νέο μάθημα "Dev Containers & Codespaces" (Μάθημα 5)· υποσέλιδα πλοήγησης συνδέθηκαν μεταξύ `bring-your-own-app.md` και `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Συμπλήρωμα τομών αρχαρίων: Πρακτικό Μάθημα Πολλαπλών Πρακτόρων, "Φέρτε τη δική σας εφαρμογή," Terraform και οδηγός CI/CD
**Αυτή η έκδοση κλείνει τα μεγαλύτερα κενά για έναν πλήρη οδηγό αρχαρίων προσθέτοντας δύο νέα πρακτικά μαθήματα (ένα αναπτυσσόμενο walkthrough πολλαπλών πρακτόρων και την προσθήκη azd σε υπάρχουσα εφαρμογή), μια φιλική προς αρχαρίους εισαγωγή στα hooks, ενότητα Terraform με azd, οδηγό βήμα-βήμα GitHub Actions pipeline, εξήγηση για τις νέες επεκτάσεις προεπισκόπησης και μια ρητή λίστα ελέγχου επαλήθευσης ανάπτυξης.**

#### Προσθήκες
- **🤝 Νέο μάθημα Κεφαλαίου 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — πλήρως πρακτικό, αναπτυσσόμενο walkthrough με δύο πράκτορες (ορχηστρωτής + ειδικοί) χρησιμοποιώντας πραγματικό πρότυπο (`contoso-creative-writer`), καλύπτοντας πότε να χρησιμοποιήσετε πολλούς πράκτορες, τη ροή εργασίας `azd up`, κατανόηση των αναπτυγμένων πόρων, διασταυρούμενη ιχνηλάτηση πρακτόρων, προσαρμογή και καθαρισμό
- **📦 Νέο μάθημα Κεφαλαίου 1** `docs/chapter-01-foundation/bring-your-own-app.md` — πώς να προσθέσετε azd σε υπάρχον έργο με `azd init` ("χρήση κώδικα στον τρέχοντα κατάλογο"), κατανόηση των `azure.yaml` και `infra/`, `azd infra generate`, ανίχνευση host και ανάπτυξη με `azd up`
- **🌐 Terraform με azd** ενότητα προστέθηκε στο `docs/chapter-04-infrastructure/provisioning.md` — διαμόρφωση `infra.provider: terraform`, διάταξη φακέλων `.tf`, απαιτούμενες `AZURE_*` εξόδους και ετικέτα `azd-env-name`, και η ίδια ροή εργασίας `azd up` / `azd down` (κλείνει το κενό όπου ισχυριζόταν υποστήριξη Terraform αλλά παρουσιάστηκε μόνο Bicep)
- **⚙️ Βήμα προς βήμα παρουσίαση των GitHub Actions** στο `docs/chapter-08-production/production-ai-practices.md` — από το αποθετήριο GitHub έως τις αυτοματοποιημένες αναπτύξεις: `azd pipeline config`, πιστοποιητικά διαμοιρασμένης ταυτότητας OIDC (χωρίς αποθηκευμένα μυστικά), το παραγόμενο `azure-dev.yml` και οδηγίες για μυστικά έναντι μεταβλητών
- **🪝 Εισαγωγή για αρχάριους "Νέοι στα hooks;"** στο `docs/chapter-04-infrastructure/deployment-guide.md` — τι είναι ένα hook, ένας πίνακας σταδίων hook, ένα ελάχιστο πρώτο hook και τρόπος εκτέλεσης hooks χειροκίνητα με `azd hooks run`
- **✅ Προσθήκη λίστας ελέγχου "Επαλήθευση της Ανάπτυξής σας"** στο Βήμα 5 του `docs/chapter-01-foundation/first-project.md` — δοκιμή λειτουργικότητας, έλεγχος endpoint υγείας και ρητά κριτήρια επιτυχίας
- **🧩 Επεξήγηση για νέες επεκτάσεις προεπισκόπησης** `azure.ai.skills` και `azure.ai.connections` (τι είναι και πότε να τις επιλέξετε) στο `docs/chapter-08-production/production-ai-practices.md`

#### Τροποποιημένα
- **🧭 Διόρθωση πίνακα μαθημάτων Κεφαλαίου 5**: το `multi-agent-basics.md` είναι πια το Μάθημα 1 (το μόνο πλήρως πρακτικό μάθημα), με ειλικρινή επισήμανση ότι το Μάθημα 2 βρίσκεται στο Κεφάλαιο 6 και το σενάριο Retail είναι ένα αρχιτεκτονικό σχέδιο και όχι ένα πρότυπο εντολής
- **🧭 Ο πίνακας μαθημάτων Κεφαλαίου 1** τώρα περιλαμβάνει το νέο μάθημα "Φέρε τη δική σου εφαρμογή" (Μάθημα 4)
- **🔗 Ενημερώσεις στα υποσέλιδα πλοήγησης**: `first-project.md` πλέον συνδέει προς τα εμπρός στο `bring-your-own-app.md`

#### Διορθώσεις
- **🧱 Κάλυψη του "υποστηριζόμενου αλλά ελλείποντος" κενού Terraform** — το μάθημα προηγουμένως αναφερόταν στη στήριξη Terraform χωρίς να την εμφανίζει
- **🔀 Διόρθωση παραπλανητικών διασυνδέσεων Κεφαλαίου 5** που υπαινίσσονταν ύπαρξη πλήρους υλοποίησης πολλαπλών πρακτόρων ενώ υπήρχε μόνο αρχιτεκτονικό σχέδιο

#### Ενημερωμένα αρχεία
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(νέο)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(νέο)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Ενημέρωση AZD 1.25.6, Πλήρεις Εντολές Κύκλου Ζωής Πράκτορα & Επανεμπορική Ονομασία Aspire
**Αυτή η έκδοση επαληθεύει ξανά το μάθημα έναντι `azd` `1.25.6` (Ιούνιος 2026) και της επέκτασης `azure.ai.agents` `0.1.40-preview`, επεκτείνει τις οδηγίες AI από "δημιουργία πράκτορα" σε πλήρη κύκλο ζωής πράκτορα (δοκιμή → αξιολόγηση → βελτιστοποίηση → επιθεώρηση → διαγραφή), εμφανίζει τις νέες επεκτάσεις προεπισκόπησης `azure.ai.skills` και `azure.ai.connections` και σημειώνει την αλλαγή επωνυμίας προϊόντος από ".NET Aspire" σε "Aspire".**

#### Προσθήκες
- **🔁 Πλήρης κάλυψη κύκλου ζωής πράκτορα** για αρχάριους και μηχανικούς AI σε όλη την τεκμηρίωση:
  - `docs/chapter-01-foundation/azd-basics.md` — Πίνακας κύκλου ζωής (δημιουργία → δοκιμή → μέτρηση → βελτίωση → επιθεώρηση → καθαρισμός) προστέθηκε στην ενότητα Επεκτάσεων και Εντολών AI
  - `docs/chapter-08-production/production-ai-practices.md` — Νέα ενότητα "Διαχείριση κύκλου ζωής πράκτορα" που καλύπτει `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` και `delete --force`
  - `resources/cheat-sheet.md` — Επεκτάσεις εντολών AI Agent με `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` και `delete --force`
- **🧩 Νέες επεκτάσεις προεπισκόπησης** τεκμηριωμένες: `azure.ai.skills` (ξαναχρησιμοποιούμενες δεξιότητες πράκτορα) και `azure.ai.connections` (συνδέσεις Foundry) προστέθηκαν στον πίνακα επεκτάσεων και στο φύλλο απάτης
- **⏱️ Οδηγίες χρονομέτρησης απόκρισης** — τα παραδείγματα `azd ai agent invoke` τώρα αναφέρουν ότι τυπώνει τη συνολική καθυστέρηση και τον χρόνο μέχρι τον πρώτο byte
- **📌 Πλαϊνή ενημέρωση έκδοσης** στο κύριο README που κατευθύνει τους εκπαιδευόμενους προς `azd version` και `azd upgrade`

#### Τροποποιημένα
- **✅ Ενημέρωση βάσης επαλήθευσης** από `azd 1.23.12` (Μάρτιος 2026) σε `azd 1.25.6` (Ιούνιος 2026) σε όλα τα README των κεφαλαίων και της τεκμηρίωσης εργαστηρίου
- **🤖 Σημείωση επέκτασης Κεφαλαίου 2** ενημερώθηκε από `azure.ai.agents` `0.1.18-preview` σε `0.1.40-preview`
- **🧪 Παράδειγμα επαλήθευσης εργαστηρίου** (έξοδος `azd version`) ενημερώθηκε σε `1.25.6`
- **🧭 Ενημέρωση README "Τι νέο υπάρχει στο azd σήμερα"** για ανάδειξη του πλήρους κύκλου ζωής πράκτορα, νέων επεκτάσεων AI και πρόσφατων βελτιώσεων (ακεραιότητα `azd init`, καθαρισμός εκκρεμών `azd auth login`, προτροπή πρώτης εκτέλεσης `azd tool`)
- **📖 Το agents.md Κεφαλαίου 2 (Επιλογή 4)** κατευθύνει πλέον τους εκπαιδευόμενους στις εντολές κύκλου ζωής μετά την ανάπτυξη και όχι στην `azd up`

#### Διορθώσεις
- **🏷️ Ονομασία προϊόντος** — Προστέθηκε σημείωση αλλαγής επωνυμίας Aspire (".NET Aspire" τώρα απλά "Aspire"); η υποστήριξη azd για Aspire παραμένει αμετάβλητη
- **🔎 Επαλήθευση ζωντανής έκδοσης** επιβεβαιώθηκε με το Azure Developer CLI release feed: σταθερό CLI `1.25.6` (2026-06-12) και `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Ενημερωμένα Αρχεία
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### Διευκρίνιση Εγγραφής Αρχαρίων, Επαλήθευση Ρύθμισης & Τελικός Καθαρισμός Εντολών AZD
**Αυτή η έκδοση ακολουθεί τον έλεγχο επαλήθευσης της AZD 1.23 με μια δέσμη τεκμηρίωσης εστιασμένη σε αρχάριους: διευκρινίζει την προτίμηση πιστοποίησης AZD, προσθέτει τοπικά σενάρια επαλήθευσης ρύθμισης, επαληθεύει βασικές εντολές απέναντι στο ζωντανό CLI της AZD και αφαιρεί τις τελευταίες παρωχημένες αναφορές εντολών πηγής Αγγλικών εκτός του changelog.**

#### Προσθήκες
- **🧪 Σενάρια επαλήθευσης ρύθμισης για αρχάριους** με `validate-setup.ps1` και `validate-setup.sh` ώστε οι εκπαιδευόμενοι να επιβεβαιώσουν τα απαιτούμενα εργαλεία πριν ξεκινήσουν το Κεφάλαιο 1
- **✅ Βήματα επαλήθευσης ρύθμισης στην αρχή** στο κύριο README και στο README του Κεφαλαίου 1 ώστε να πιάνονται τα ελλείποντα προαπαιτούμενα πριν το `azd up`

#### Τροποποιημένα
- **🔐 Οδηγίες πιστοποίησης για αρχάριους** τώρα αντιμετωπίζουν σταθερά το `azd auth login` ως τον βασικό δρόμο για ροές εργασίας AZD, με το `az login` να αναφέρεται ως προαιρετικό εκτός αν χρησιμοποιούνται απευθείας εντολές Azure CLI
- **📚 Ροή εγγραφής του Κεφαλαίου 1** τώρα κατευθύνει τους εκπαιδευόμενους να επαληθεύσουν τοπική ρύθμιση πριν την εγκατάσταση, πιστοποίηση και τα πρώτα βήματα ανάπτυξης
- **🛠️ Μηνύματα επαλήθευσης** τώρα ξεχωρίζουν καθαρά τις αποτρεπτικές απαιτήσεις από τα προαιρετικά προειδοποιητικά μηνύματα Azure CLI για την αποκλειστική διαδρομή αρχαρίων AZD
- **📖 Τεκμηρίωση ρυθμίσεων, αντιμετώπισης προβλημάτων και παραδειγμάτων** τώρα διαχωρίζει τις απαιτούμενες πιστοποιήσεις AZD από τις προαιρετικές συνδέσεις Azure CLI όπου προηγουμένως παρουσιάζονταν χωρίς πλαίσιο

#### Διορθώσεις
- **📋 Ενημερώσεις υπολοίπων αναφορών εντολών πηγής Αγγλικών** στις τρέχουσες μορφές AZD, συμπεριλαμβανομένων `azd config show` στο cheat sheet και `azd monitor --overview` όπου προοριζόταν οδηγίες επισκόπησης Azure Portal
- **🧭 Υποσχέσεις αρχαρίων στο Κεφάλαιο 1** μειώθηκαν για αποφυγή υπεραπλουστεύσεων περί εγγυημένης μηδενικής αποτυχίας ή επαναφοράς σε όλα τα πρότυπα και πόρους Azure
- **🔎 Ζωντανή επαλήθευση CLI** επιβεβαιώνει τρέχουσα υποστήριξη για `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` και `azd down --force --purge`

#### Ενημερωμένα Αρχεία
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### Επαλήθευση AZD 1.23.12, Επέκταση Περιβάλλοντος Εργαστηρίου & Ανανέωση Μοντέλου AI
**Αυτή η έκδοση πραγματοποιεί έναν έλεγχο τεκμηρίωσης έναντι `azd` `1.23.12`, ενημερώνει παρωχημένα παραδείγματα εντολών AZD, ανανεώνει τις οδηγίες μοντέλου AI στους τρέχοντες προεπιλογές και διευρύνει τις οδηγίες εργαστηρίου πέρα από το GitHub Codespaces ώστε να υποστηρίζει επίσης κοντέινερ ανάπτυξης και τοπικά κλωνοποιημένα αποθετήρια.**

#### Προσθήκες
- **✅ Σημειώσεις επαλήθευσης σε βασικά κεφάλαια και τεκμηρίωση εργαστηρίου** για να είναι ρητή η δοκιμασμένη βάση AZD για εκπαιδευόμενους με νεότερες ή παλαιότερες εκδόσεις CLI
- **⏱️ Οδηγίες χρονικού ορίου ανάπτυξης** για μακροχρόνιες αναπτύξεις εφαρμογών AI με `azd deploy --timeout 1800`
- **🔎 Βήματα επιθεώρησης επέκτασης** με `azd extension show azure.ai.agents` στην τεκμηρίωση ροής εργασίας AI
- **🌐 Ενημερωμένες οδηγίες εργαστηρίου** που καλύπτουν GitHub Codespaces, κοντέινερ dev και τοπικά κλωνοποιημένα αποθετήρια με MkDocs

#### Τροποποιημένα
- **📚 README εισαγωγής κεφαλαίων** τώρα δηλώνουν σταθερά επαλήθευση έναντι `azd 1.23.12` σε τμήματα βάσης, ρυθμίσεων, υποδομής, πολλαπλών πρακτόρων, προ-ανάπτυξης, αντιμετώπισης προβλημάτων και παραγωγής
- **🛠️ Αναφορές εντολών AZD** ενημερώθηκαν σε τρέχουσες μορφές σε όλη την τεκμηρίωση:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ή `azd env get-value(s)` ανάλογα με το πλαίσιο
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` όπου προορίζεται επισκόπηση Application Insights
- **🧪 Απλοποιημένα παραδείγματα προεπισκόπησης προμήθειας** σε τρέχουσα υποστηριζόμενη χρήση όπως `azd provision --preview` και `azd provision --preview -e production`
- **🧭 Ροή εργαστηρίου** ενημερώθηκε ώστε οι εκπαιδευόμενοι να μπορούν να ολοκληρώσουν τα εργαστήρια σε Codespaces, κοντέινερ dev ή τοπικό κλώνο αντί να υποθέτουν αποκλειστική εκτέλεση στο Codespaces
- **🔐 Οδηγίες πιστοποίησης** τώρα προτιμούν `azd auth login` για ροές εργασίας AZD, με `az login` ως προαιρετικό όταν χρησιμοποιούνται απευθείας εντολές Azure CLI

#### Διορθώσεις
- **🪟 Εντολές εγκατάστασης Windows** ομαλοποιήθηκαν σύμφωνα με την τρέχουσα ονομασία πακέτου `winget` στον οδηγό εγκατάστασης
- **🐧 Οδηγίες εγκατάστασης Linux** διορθώθηκαν για αποφυγή μη υποστηριζόμενων οδηγιών διαχειριστή πακέτου διανομής `azd` και αντί αυτού να κατευθύνουν σε διαθέσιμα αρχεία έκδοσης όπου απαιτείται
- **📦 Παραδείγματα μοντέλων AI** ανανεώθηκαν από παλαιότερες προεπιλογές όπως `gpt-35-turbo` και `text-embedding-ada-002` σε τρέχοντα παραδείγματα όπως `gpt-4.1-mini`, `gpt-4.1` και `text-embedding-3-large`
- **📋 Κομμάτια ανάπτυξης και διαγνωστικών** διορθώθηκαν για χρήση τρεχόντων εντολών περιβάλλοντος και κατάστασης στα αρχεία καταγραφής, σενάρια και βήματα αντιμετώπισης προβλημάτων
- **⚙️ Οδηγίες GitHub Actions** ενημερώθηκαν από `Azure/setup-azd@v1.0.0` σε `Azure/setup-azd@v2`
- **🤖 Οδηγίες συγκατάθεσης MCP/Copilot** ενημερώθηκαν από `azd mcp consent` σε `azd copilot consent list`

#### Βελτιώσεις
- **🧠 Οδηγίες κεφαλαίου AI** τώρα εξηγούν καλύτερα την ευαισθησία στην προεπισκόπηση συμπεριφοράς `azd ai`, τη σύνδεση συγκεκριμένου μισθωτή, τη χρήση τρεχουσών επεκτάσεων και τις ενημερωμένες προτάσεις ανάπτυξης μοντέλων
- **🧪 Οδηγίες εργαστηρίου** χρησιμοποιούν πλέον πιο ρεαλιστικά παραδείγματα εκδόσεων και σαφέστερη γλώσσα ρύθμισης περιβάλλοντος για πρακτικά εργαστήρια
- **📈 Τεκμηρίωση παραγωγής και αντιμετώπισης προβλημάτων** ευθυγραμμίζονται καλύτερα με τρέχοντα παραδείγματα παρακολούθησης, εναλλακτικού μοντέλου και επιπέδων κόστους

#### Ενημερωμένα Αρχεία
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### Εντολές AZD AI CLI, Επαλήθευση Περιεχομένου & Επέκταση Προτύπων
**Αυτή η έκδοση προσθέτει κάλυψη εντολών `azd ai`, `azd extension`, και `azd mcp` σε όλα τα κεφάλαια σχετικά με την ΤΝ, διορθώνει σπασμένους συνδέσμους και ξεπερασμένο κώδικα στο agents.md, ενημερώνει τον κατάλογο συντομεύσεων και αναδιοργανώνει την ενότητα Προτύπων Παραδειγμάτων με επικυρωμένες περιγραφές και νέα πρότυπα Azure AI AZD.**

#### Προστέθηκαν
- **🤖 Κάλυψη AZD AI CLI** σε 7 αρχεία (προηγουμένως μόνο στο Κεφάλαιο 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Νέα ενότητα "Επεκτάσεις και Εντολές AI" που εισάγει `azd extension`, `azd ai agent init`, και `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Επιλογή 4: `azd ai agent init` με πίνακα σύγκρισης (προσέγγιση προτύπου έναντι αρχείου manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Υποενότητες "Επεκτάσεις AZD για Foundry" και "Ανάπτυξη με Προτεραιότητα στον Πράκτορα"
  - `docs/chapter-05-multi-agent/README.md` — Η γρήγορη εκκίνηση δείχνει τώρα και τους δύο τρόπους ανάπτυξης με πρότυπο και manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Η ενότητα ανάπτυξης περιλαμβάνει πλέον επιλογή `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Υποενότητα "Εντολές Επέκτασης AZD AI για Διαγνωστικά"
  - `resources/cheat-sheet.md` — Νέα ενότητα "Εντολές AI & Επεκτάσεων" με `azd extension`, `azd ai agent init`, `azd mcp`, και `azd infra generate`
- **📦 Νέα πρότυπα παραδειγμάτων AZD AI** σε `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Συνομιλία RAG .NET με Blazor WebAssembly, Semantic Kernel, και υποστήριξη φωνητικής συνομιλίας
  - **azure-search-openai-demo-java** — Συνομιλία RAG Java με Langchain4J και επιλογές ανάπτυξης ACA/AKS
  - **contoso-creative-writer** — Εφαρμογή δημιουργικής γραφής με πολλαπλούς πράκτορες που χρησιμοποιεί Azure AI Agent Service, Bing Grounding, και Prompty
  - **serverless-chat-langchainjs** — Serverless RAG με Azure Functions + LangChain.js + Cosmos DB, με τοπική υποστήριξη ανάπτυξης Ollama
  - **chat-with-your-data-solution-accelerator** — Επιταχυντής RAG για επιχειρήσεις με portal διαχείρισης, ενσωμάτωση Teams, και επιλογές PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Εφαρμογή αναφοράς πολλαπλών πρακτόρων MCP με servers σε .NET, Python, Java, και TypeScript
  - **azd-ai-starter** — Ελάχιστο πρότυπο εκκίνησης Azure AI υποδομής σε Bicep
  - **🔗 Σύνδεσμος Καταπληκτικής Συλλογής AZD AI** — Αναφορά στη [καταπληκτική γκαλερί AZD AI](https://azure.github.io/awesome-azd/?tags=ai) (πάνω από 80 πρότυπα)

#### Διορθώθηκαν
- **🔗 Πλοήγηση agents.md**: Οι σύνδεσμοι Προηγούμενο/Επόμενο πλέον αντιστοιχούν στη σειρά μαθημάτων του Κεφαλαίου 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Σπασμένοι σύνδεσμοι στο agents.md**: `production-ai-practices.md` διορθώθηκε σε `../chapter-08-production/production-ai-practices.md` (3 εμφανίσεις)
- **📦 Ξεπερασμένος κώδικας agents.md**: Αντικαταστάθηκε `opencensus` με `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Μη έγκυρο API agents.md**: Μετακινήθηκε `max_tokens` από `create_agent()` σε `create_run()` ως `max_completion_tokens`
- **🔢 Μέτρηση tokens agents.md**: Αντικαταστάθηκε η πρόχειρη εκτίμηση `len//4` με `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Διορθώθηκαν οι υπηρεσίες από "Cognitive Search + App Service" σε "Azure AI Search + Azure Container Apps" (η προεπιλεγμένη φιλοξενία άλλαξε τον Οκτώβριο 2024)
- **contoso-chat**: Ενημερώθηκε η περιγραφή για να αναφέρεται στο Azure AI Foundry + Prompty, σύμφωνα με τον πραγματικό τίτλο και τεχνολογικό στοίβα του αποθετηρίου

#### Αφαιρέθηκαν
- **ai-document-processing**: Αφαιρέθηκε αναφορά σε πρότυπο μη λειτουργικό (το αποθετήριο δεν είναι δημόσια προσβάσιμο ως πρότυπο AZD)

#### Βελτιώσεις
- **📝 Ασκήσεις agents.md**: Η Άσκηση 1 τώρα δείχνει την αναμενόμενη έξοδο και το βήμα `azd monitor`· Η Άσκηση 2 περιλαμβάνει πλήρη κώδικα εγγραφής `FunctionTool`· Η Άσκηση 3 αντικαθιστά ασαφείς οδηγίες με συγκεκριμένες εντολές `prepdocs.py`
- **📚 Πόροι agents.md**: Ενημερώθηκαν οι σύνδεσμοι τεκμηρίωσης στα τρέχοντα έγγραφα Azure AI Agent Service και quickstart
- **📋 Πίνακας Επόμενων Βημάτων agents.md**: Προστέθηκε σύνδεσμος σε εργαστήριο AI Workshop για πλήρη κάλυψη κεφαλαίου

#### Ενημερωμένα Αρχεία
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Βελτίωση Πλοήγησης Μαθήματος
**Αυτή η έκδοση βελτιώνει την πλοήγηση στα κεφάλαια του README.md με βελτιωμένη μορφή πίνακα.**

#### Αλλαγές
- **Πίνακας Χάρτη Μαθήματος**: Ενισχυμένος με άμεσους συνδέσμους μαθημάτων, εκτιμήσεις διάρκειας και αξιολογήσεις πολυπλοκότητας
- **Καθαρισμός Φακέλων**: Αφαιρέθηκαν παλιοί πλεοναστικοί φάκελοι (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Επαλήθευση Συνδέσμων**: Επαληθεύτηκαν όλοι οι 21+ εσωτερικοί σύνδεσμοι στον πίνακα Χάρτη Μαθήματος

### [v3.16.0] - 2026-02-05

#### Ενημερώσεις Ονομάτων Προϊόντων
**Αυτή η έκδοση ενημερώνει τις αναφορές προϊόντων με το τρέχον branding της Microsoft.**

#### Αλλαγές
- **Microsoft Foundry → Microsoft Foundry**: Ενημερώθηκαν όλες οι αναφορές σε μη μεταφρασμένα αρχεία
- **Azure AI Agent Service → Foundry Agents**: Το όνομα της υπηρεσίας ενημερώθηκε για να αντικατοπτρίζει το τρέχον branding

#### Ενημερωμένα Αρχεία
- `README.md` - Κύρια σελίδα μαθήματος
- `changelog.md` - Ιστορικό εκδόσεων
- `course-outline.md` - Δομή μαθήματος
- `docs/chapter-02-ai-development/agents.md` - Οδηγός πρακτόρων AI
- `examples/README.md` - Τεκμηρίωση παραδειγμάτων
- `workshop/README.md` - Σελίδα εργαστηρίου
- `workshop/docs/index.md` - Ευρετήριο εργαστηρίου
- `workshop/docs/instructions/*.md` - Όλα τα αρχεία οδηγιών εργαστηρίου

---

### [v3.15.0] - 2026-02-05

#### Μεγάλη Αναδιάρθρωση Αποθετηρίου: Ονομασίες Φακέλων με Βάση Κεφάλαια
**Αυτή η έκδοση αναδιοργανώνει την τεκμηρίωση σε αφιερωμένους φακέλους κεφαλαίων για σαφέστερη πλοήγηση.**

#### Μετονομασίες Φακέλων
Οι παλιοί φάκελοι αντικαταστάθηκαν με φακέλους αριθμημένων κεφαλαίων:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Προστέθηκε νέο: `docs/chapter-05-multi-agent/`

#### Μεταφορές Αρχείων
| Αρχείο | Από | Προς |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| Όλα τα αρχεία pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Όλα τα αρχεία troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Προστέθηκαν
- **📚 Αρχεία README κεφαλαίων**: Δημιουργία README.md σε κάθε φάκελο κεφαλαίου με:
  - Στόχους μάθησης και διάρκεια
  - Πίνακα μαθημάτων με περιγραφές
  - Εντολές γρήγορης εκκίνησης
  - Πλοήγηση σε άλλα κεφάλαια

#### Αλλαγές
- **🔗 Ενημέρωση όλων των εσωτερικών συνδέσμων**: 78+ διαδρομές ενημερώθηκαν σε όλα τα αρχεία τεκμηρίωσης
- **🗺️ Κύριο README.md**: Ενημερώθηκε ο Χάρτης Μαθήματος με τη νέα δομή κεφαλαίων
- **📝 examples/README.md**: Ενημερώθηκαν οι διασταυρούμενες αναφορές σε φακέλους κεφαλαίων

#### Αφαιρέθηκαν
- Παλιά δομή φακέλων (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Αναδιάρθρωση Αποθετηρίου: Πλοήγηση Κεφαλαίων
**Αυτή η έκδοση πρόσθεσε αρχεία README πλοήγησης κεφαλαίων (αντικαταστάθηκαν από την έκδοση v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Νέος Οδηγός Πρακτόρων ΤΝ
**Αυτή η έκδοση προσθέτει έναν πλήρη οδηγό για την ανάπτυξη πρακτόρων ΤΝ με το Azure Developer CLI.**

#### Προστέθηκαν
- **🤖 docs/microsoft-foundry/agents.md**: Πλήρης οδηγός που καλύπτει:
  - Τι είναι οι πράκτορες ΤΝ και πώς διαφέρουν από τα chatbots
  - Τρία πρότυπα γρήγορης εκκίνησης πρακτόρων (Foundry Agents, Prompty, RAG)
  - Πρότυπα αρχιτεκτονικής πρακτόρων (μονός πράκτορας, RAG, πολλαπλοί πράκτορες)
  - Παραμετροποίηση και προσαρμογή εργαλείων
  - Παρακολούθηση και μετρικές
  - Θέματα κόστους και βελτιστοποίηση
  - Συνηθισμένα σενάρια αντιμετώπισης προβλημάτων
  - Τρεις πρακτικές ασκήσεις με κριτήρια επιτυχίας

#### Δομή Περιεχομένου
- **Εισαγωγή**: Έννοιες πρακτόρων για αρχάριους
- **Γρήγορη Εκκίνηση**: Ανάπτυξη πρακτόρων με `azd init --template get-started-with-ai-agents`
- **Πρότυπα Αρχιτεκτονικής**: Οπτικά διαγράμματα προτύπων πρακτόρων
- **Παραμετροποίηση**: Ρύθμιση εργαλείων και μεταβλητών περιβάλλοντος
- **Παρακολούθηση**: Ενσωμάτωση Application Insights
- **Ασκήσεις**: Προοδευτική πρακτική μάθηση (20-45 λεπτά η κάθε μία)

---

### [v3.12.0] - 2026-02-05

#### Ενημέρωση Περιβάλλοντος DevContainer
**Αυτή η έκδοση ενημερώνει τη διαμόρφωση του κοντέινερ ανάπτυξης με σύγχρονα εργαλεία και καλύτερες προεπιλογές για την εμπειρία μάθησης του AZD.**

#### Αλλαγές
- **🐳 Βασική Εικόνα**: Ενημερώθηκε από `python:3.12-bullseye` σε `python:3.12-bookworm` (τελευταία έκδοση Debian stable)
- **📛 Όνομα Κοντέινερ**: Μετονομάστηκε από "Python 3" σε "AZD for Beginners" για περισσότερη σαφήνεια

#### Προστέθηκαν
- **🔧 Νέα Χαρακτηριστικά Dev Container**:
  - `azure-cli` με ενεργοποιημένη υποστήριξη Bicep
  - `node:20` (έκδοση LTS για πρότυπα AZD)
  - `github-cli` για διαχείριση προτύπων
  - `docker-in-docker` για αναπτύξεις εφαρμογών container

- **🔌 Προώθηση Θυρών**: Προδιαμορφωμένες θύρες για κοινή ανάπτυξη:
  - 8000 (προεπισκόπηση MkDocs)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Νέες Επεκτάσεις VS Code**:
  - `ms-python.vscode-pylance` - Βελτιωμένη Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Υποστήριξη Azure Functions
  - `ms-azuretools.vscode-docker` - Υποστήριξη Docker
  - `ms-azuretools.vscode-bicep` - Υποστήριξη γλώσσας Bicep
  - `ms-azure-devtools.azure-resource-groups` - Διαχείριση πόρων Azure
  - `yzhang.markdown-all-in-one` - Επεξεργασία Markdown
  - `DavidAnson.vscode-markdownlint` - Έλεγχος Markdown
  - `bierner.markdown-mermaid` - Υποστήριξη διαγραμμάτων Mermaid
  - `redhat.vscode-yaml` - Υποστήριξη YAML (για azure.yaml)
  - `eamodio.gitlens` - Οπτικοποίηση Git
  - `mhutchie.git-graph` - Ιστορικό Git

- **⚙️ Ρυθμίσεις VS Code**: Προστέθηκαν προεπιλεγμένες ρυθμίσεις για Python interpreter, μορφοποίηση κατά αποθήκευση και αφαίρεση κενών

- **📦 Ενημέρωση requirements-dev.txt**:
  - Προστέθηκε το plugin ελαχιστοποίησης MkDocs
  - Προστέθηκε pre-commit για ποιότητα κώδικα
  - Προστέθηκαν πακέτα Azure SDK (azure-identity, azure-mgmt-resource)

#### Διορθώσεις
- **Post-Create Command**: Τώρα ελέγχει την εγκατάσταση AZD και Azure CLI κατά την εκκίνηση του κοντέινερ

---

### [v3.11.0] - 2026-02-05

#### Αναδιοργάνωση README Φιλική προς Αρχαρίους
**Αυτή η έκδοση βελτιώνει σημαντικά το README.md για καλύτερη προσβασιμότητα αρχαρίων και προσθέτει βασικούς πόρους για προγραμματιστές ΤΝ.**

#### Προστέθηκαν
- **🆚 Σύγκριση Azure CLI και AZD**: Καθαρή εξήγηση πότε να χρησιμοποιείται κάθε εργαλείο με πρακτικά παραδείγματα
- **🌟 Καταπληκτικοί Σύνδεσμοι AZD**: Άμεσοι σύνδεσμοι στη γκαλερί προτύπων κοινότητας και πόρους συνεισφοράς:
  - [Καταπληκτική Γκαλερί AZD](https://azure.github.io/awesome-azd/) - 200+ έτοιμα πρότυπα προς ανάπτυξη
  - [Υποβολή Προτύπου](https://github.com/Azure/awesome-azd/issues) - Συνεισφορά κοινότητας
- **🎯 Οδηγός Γρήγορης Εκκίνησης**: Απλοποιημένο τμήμα τριών βημάτων (Εγκατάσταση → Σύνδεση → Ανάπτυξη)
- **📊 Πίνακας Πλοήγησης βάσει Εμπειρίας**: Ξεκάθαρη καθοδήγηση για το πού να ξεκινήσει κανείς με βάση την εμπειρία προγραμματιστή

#### Αλλαγές
- **Δομή README**: Αναδιοργανώθηκε για προοδευτική αποκάλυψη - σημαντικές πληροφορίες πρώτες
- **Ενότητα Εισαγωγής**: Αναγράφηκε εκ νέου για να εξηγήσει "Τη Μαγεία του `azd up`" για πλήρεις αρχάριους
- **Αφαιρέθηκε Διπλό Περιεχόμενο**: Εξαλείφθηκε η διπλή ενότητα αντιμετώπισης προβλημάτων
- **Εντολές Επίλυσης Προβλημάτων**: Διορθώθηκε η αναφορά `azd logs` για να χρησιμοποιήσει έγκυρη `azd monitor --logs`

#### Διορθώθηκε
- **🔐 Εντολές Πιστοποίησης**: Προστέθηκαν οι `azd auth login` και `azd auth logout` στο cheat-sheet.md
- **Μη Έγκυρες Αναφορές Εντολών**: Αφαιρέθηκαν οι υπόλοιπες `azd logs` από την ενότητα αντιμετώπισης προβλημάτων του README

#### Σημειώσεις
- **Πεδίο Εφαρμογής**: Αλλαγές εφαρμοσμένες στο κύριο README.md και στο resources/cheat-sheet.md
- **Στοχευμένο Κοινό**: Βελτιώσεις ειδικά για προγραμματιστές νέους στο AZD

---

### [v3.10.0] - 2026-02-05

#### Ενημέρωση Ακρίβειας Εντολών Azure Developer CLI
**Αυτή η έκδοση διορθώνει ανύπαρκτες εντολές AZD σε όλη την τεκμηρίωση, διασφαλίζοντας ότι όλα τα παραδείγματα κώδικα χρησιμοποιούν έγκυρη σύνταξη Azure Developer CLI.**

#### Διορθώθηκε
- **🔧 Αφαιρέθηκαν Ανύπαρκτες Εντολές AZD**: Εκτενής έλεγχος και διόρθωση μη έγκυρων εντολών:
  - `azd logs` (δεν υπάρχει) → αντικαταστάθηκε με `azd monitor --logs` ή εναλλακτικές Azure CLI
  - υποεντολές `azd service` (δεν υπάρχουν) → αντικαταστάθηκαν με `azd show` και Azure CLI
  - `azd infra import/export/validate` (δεν υπάρχουν) → αφαιρέθηκαν ή αντικαταστάθηκαν με έγκυρες εναλλακτικές
  - σημαίες `azd deploy --rollback/--incremental/--parallel/--detect-changes` (δεν υπάρχουν) → αφαιρέθηκαν
  - σημαίες `azd provision --what-if/--rollback` (δεν υπάρχουν) → ενημερώθηκαν για χρήση `--preview`
  - `azd config validate` (δεν υπάρχει) → αντικαταστάθηκε με `azd config list`
  - `azd info`, `azd history`, `azd metrics` (δεν υπάρχουν) → αφαιρέθηκαν

- **📚 Αρχεία Ενημερωμένα με Διορθώσεις Εντολών**:
  - `resources/cheat-sheet.md`: Εκτενής αναθεώρηση αναφοράς εντολών
  - `docs/deployment/deployment-guide.md`: Διορθώθηκαν στρατηγικές rollback και ανάπτυξης
  - `docs/troubleshooting/debugging.md`: Διορθώθηκαν ενότητες ανάλυσης καταγραφών
  - `docs/troubleshooting/common-issues.md`: Ενημερώθηκαν εντολές επίλυσης προβλημάτων
  - `docs/troubleshooting/ai-troubleshooting.md`: Διορθώθηκε ενότητα εντοπισμού σφαλμάτων AZD
  - `docs/getting-started/azd-basics.md`: Διορθώθηκαν εντολές παρακολούθησης
  - `docs/getting-started/first-project.md`: Ενημερώθηκαν παραδείγματα παρακολούθησης και αποσφαλμάτωσης
  - `docs/getting-started/installation.md`: Διορθώθηκαν παραδείγματα βοήθειας και έκδοσης
  - `docs/pre-deployment/application-insights.md`: Διορθώθηκαν εντολές προβολής καταγραφών
  - `docs/pre-deployment/coordination-patterns.md`: Διορθώθηκαν εντολές αποσφαλμάτωσης πράκτορα

- **📝 Ενημέρωση Αναφοράς Έκδοσης**: 
  - `docs/getting-started/installation.md`: Αλλαγή της σκληροκωδικοποιημένης έκδοσης `1.5.0` σε γενική `1.x.x` με σύνδεσμο σε εκδόσεις

#### Αλλαγές
- **Στρατηγικές Rollback**: Ενημερώθηκε η τεκμηρίωση για χρήση rollback βασισμένου σε Git (το AZD δεν έχει εγγενές rollback)
- **Προβολή Καταγραφών**: Αντικαταστάθηκαν οι αναφορές `azd logs` με `azd monitor --logs`, `azd monitor --live` και εντολές Azure CLI
- **Ενότητα Απόδοσης**: Αφαιρέθηκαν ανύπαρκτες σημαίες παράλληλης/incremental ανάπτυξης, παρέχοντας έγκυρες εναλλακτικές

#### Τεχνικές Λεπτομέρειες
- **Έγκυρες Εντολές AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Έγκυρες σημαίες azd monitor**: `--live`, `--logs`, `--overview`
- **Αφαιρούμενα Χαρακτηριστικά**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Σημειώσεις
- **Επαλήθευση**: Οι εντολές επαληθεύθηκαν με βάση το Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ολοκλήρωση Εργαστηρίου και Ενημέρωση Ποιότητας Τεκμηρίωσης
**Αυτή η έκδοση ολοκληρώνει τα διαδραστικά εργαστηριακά modules, διορθώνει όλους τους σπασμένους συνδέσμους τεκμηρίωσης και βελτιώνει τη συνολική ποιότητα περιεχομένου για προγραμματιστές AI που χρησιμοποιούν Microsoft AZD.**

#### Προστέθηκαν
- **📝 CONTRIBUTING.md**: Νέο έγγραφο οδηγιών συνεισφοράς με:
  - Σαφείς οδηγίες για αναφορά προβλημάτων και προτάσεις αλλαγών
  - Πρότυπα τεκμηρίωσης για νέο περιεχόμενο
  - Οδηγίες παραδειγμάτων κώδικα και συμβάσεις μηνυμάτων commit
  - Πληροφορίες εμπλοκής κοινότητας

#### Ολοκληρώθηκε
- **🎯 Εργαστηριακό Module 7 (Ολοκλήρωση)**: Πλήρης ολοκλήρωση του τελικού module με:
  - Εκτενή σύνοψη επιτευγμάτων εργαστηρίου
  - Ενότητα βασικών εννοιών που καλύπτει AZD, πρότυπα και Microsoft Foundry
  - Προτάσεις για συνέχεια εκπαιδευτικού ταξιδιού
  - Ασκήσεις προκλήσεων εργαστηρίου με βαθμολογίες δυσκολίας
  - Ανατροφοδότηση κοινότητας και σύνδεσμοι υποστήριξης

- **📚 Εργαστηριακό Module 3 (Αποδόμηση)**: Ενημερωμένοι μαθησιακοί στόχοι με:
  - Οδηγίες ενεργοποίησης GitHub Copilot με MCP servers
  - Κατανόηση δομής φακέλων προτύπων AZD
  - Μοτίβα υποδομής ως κώδικα (Bicep)
  - Οδηγίες hands-on εργαστηρίου

- **🔧 Εργαστηριακό Module 6 (Καθαρισμός)**: Ολοκληρώθηκε με:
  - Στόχους καθαρισμού πόρων και διαχείρισης κόστους
  - Χρήση `azd down` για ασφαλή αποδέσμευση υποδομής
  - Οδηγίες ανάκτησης απαλώς διαγραμμένων γνωστικών υπηρεσιών
  - Επιπλέον διερευνητικές προτάσεις για GitHub Copilot και Azure Portal

#### Διορθώθηκε
- **🔗 Διορθώσεις Σπασμένων Συνδέσμων**: Επιδιορθώθηκαν 15+ σπασμένοι εσωτερικοί σύνδεσμοι τεκμηρίωσης:
  - `docs/ai-foundry/ai-model-deployment.md`: Διορθώθηκαν διαδρομές για microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Διορθώθηκαν διαδρομές ai-model-deployment.md και production-ai-practices.md
  - `docs/getting-started/first-project.md`: Αντικαταστάθηκε μη υπάρχον cicd-integration.md με deployment-guide.md
  - `examples/retail-scenario.md`: Διορθώθηκαν διαδρομές FAQ και οδηγού αντιμετώπισης προβλημάτων
  - `examples/container-app/microservices/README.md`: Διορθώθηκαν διαδρομές αρχικής σελίδας μαθήματος και οδηγού ανάπτυξης
  - `resources/faq.md` και `resources/glossary.md`: Ενημερώθηκαν αναφορές κεφαλαίων AI
  - `course-outline.md`: Διορθώθηκαν αναφορές οδηγού εκπαιδευτή και εργαστηρίου AI

- **📅 Banner Κατάστασης Εργαστηρίου**: Ενημερώθηκε από "Υπό Κατασκευή" σε ενεργή κατάσταση εργαστηρίου με ημερομηνία Φεβρουάριος 2026

- **🔗 Πλοήγηση Εργαστηρίου**: Διορθώθηκαν σπασμένοι σύνδεσμοι πλοήγησης στο README.md του εργαστηρίου που οδηγούσαν σε ανύπαρκτο φάκελο lab-1-azd-basics

#### Αλλαγές
- **Παρουσίαση Εργαστηρίου**: Αφαιρέθηκε προειδοποίηση "υπό κατασκευή", το εργαστήριο είναι πλέον ολοκληρωμένο και έτοιμο προς χρήση
- **Συνέπεια Πλοήγησης**: Διασφαλίστηκε σωστή εσωτερική πλοήγηση μεταξύ των εργαστηριακών μονάδων
- **Αναφορές Διαδρομών Μάθησης**: Ενημερώθηκαν αναφορές κεφαλαίων με σωστές διαδρομές microsoft-foundry

#### Επαληθεύτηκε
- ✅ Όλα τα αρχεία markdown στα αγγλικά έχουν έγκυρους εσωτερικούς συνδέσμους
- ✅ Τα εργαστηριακά modules 0-7 είναι πλήρη με μαθησιακούς στόχους
- ✅ Η πλοήγηση μεταξύ κεφαλαίων και modules λειτουργεί σωστά
- ✅ Το περιεχόμενο είναι κατάλληλο για προγραμματιστές AI που χρησιμοποιούν Microsoft AZD
- ✅ Εφαρμόζεται φιλική προς αρχάριους γλώσσα και δομή
- ✅ Το CONTRIBUTING.md παρέχει σαφείς οδηγίες για συνεισφέροντες της κοινότητας

#### Τεχνική Υλοποίηση
- **Επαλήθευση Συνδέσμων**: Αυτόματο σενάριο PowerShell επαλήθευσε όλους τους εσωτερικούς συνδέσμους .md
- **Έλεγχος Περιεχομένου**: Χειροκίνητη ανασκόπηση πληρότητας εργαστηρίου και καταλληλότητας για αρχάριους
- **Σύστημα Πλοήγησης**: Εφαρμογή συνεπών μοτίβων πλοήγησης κεφαλαίων και modules

#### Σημειώσεις
- **Πεδίο Εφαρμογής**: Αλλαγές εφαρμόστηκαν μόνο στην αγγλική τεκμηρίωση
- **Μεταφράσεις**: Οι φάκελοι μεταφράσεων δεν ενημερώθηκαν σε αυτήν την έκδοση (η αυτόματη μετάφραση θα συγχρονιστεί αργότερα)
- **Διάρκεια Εργαστηρίου**: Το ολοκληρωμένο εργαστήριο προσφέρει τώρα 3-4 ώρες πρακτικής μάθησης

---

### [v3.8.0] - 2025-11-19

#### Προηγμένη Τεκμηρίωση: Παρακολούθηση, Ασφάλεια και Πρότυπα Πολυ-Πράκτορα
**Αυτή η έκδοση προσθέτει εκτενείς μαθήματα επιπέδου A για ενσωμάτωση Application Insights, πρότυπα πιστοποίησης και συντονισμό πολλαπλών πρακτόρων για παραγωγικές αναπτύξεις.**

#### Προστέθηκαν
- **📊 Μάθημα Ενσωμάτωσης Application Insights**: στο `docs/pre-deployment/application-insights.md`:
  - Ανάπτυξη με επίκεντρο το AZD με αυτόματη παροχή
  - Πλήρη πρότυπα Bicep για Application Insights + Log Analytics
  - Λειτουργικές εφαρμογές Python με προσαρμοσμένη τηλεμετρία (1.200+ γραμμές)
  - Πρότυπα παρακολούθησης AI/LLM (παρακολούθηση token/κόστους Microsoft Foundry Models)
  - 6 διαγράμματα Mermaid (αρχιτεκτονική, διανεμημένη αναζήτηση, ροή τηλεμετρίας)
  - 3 πρακτικές ασκήσεις (ειδοποιήσεις, dashboards, παρακολούθηση AI)
  - Παραδείγματα ερωτήσεων Kusto και στρατηγικές βελτιστοποίησης κόστους
  - Ροή ζωντανών μετρικών και αποσφαλμάτωση σε πραγματικό χρόνο
  - Χρόνος μάθησης 40-50 λεπτών με παραγωγικά πρότυπα

- **🔐 Μάθημα Προτύπων Πιστοποίησης & Ασφάλειας**: στο `docs/getting-started/authsecurity.md`:
  - 3 πρότυπα πιστοποίησης (connection strings, Key Vault, διαχειριζόμενη ταυτότητα)
  - Πλήρη πρότυπα υποδομής Bicep για ασφαλείς αναπτύξεις
  - Κώδικας εφαρμογής Node.js με ενσωμάτωση Azure SDK
  - 3 ολοκληρωμένες ασκήσεις (ενεργοποίηση διαχειριζόμενης ταυτότητας, ταυτότητα εκχωρημένη σε χρήστη, περιστροφή Key Vault)
  - Καλές πρακτικές ασφαλείας και ρυθμίσεις RBAC
  - Οδηγός αντιμετώπισης προβλημάτων και ανάλυση κόστους
  - Παραγωγικά πρότυπα αυθεντικοποίησης χωρίς κωδικούς πρόσβασης

- **🤖 Μάθημα Προτύπων Συντονισμού Πολυ-Πρακτόρα**: στο `docs/pre-deployment/coordination-patterns.md`:
  - 5 πρότυπα συντονισμού (διαδοχικό, παράλληλο, ιεραρχικό, βασισμένο σε συμβάντα, συναίνεσης)
  - Πλήρης υλοποίηση υπηρεσίας ορχήστρωσης (Python/Flask, 1.500+ γραμμές)
  - 3 εξειδικευμένες υλοποιήσεις πρακτόρων (Έρευνα, Συγγραφέας, Επεξεργαστής)
  - Ενσωμάτωση Service Bus για ουρά μηνυμάτων
  - Διαχείριση κατάστασης Cosmos DB για κατανεμημένα συστήματα
  - 6 διαγράμματα Mermaid που εμφανίζουν αλληλεπιδράσεις πρακτόρων
  - 3 προχωρημένες ασκήσεις (χειρισμός timeout, λογική επαναπροσπάθειας, circuit breaker)
  - Ανάλυση κόστους ($240-565/μήνα) με στρατηγικές βελτιστοποίησης
  - Ενσωμάτωση Application Insights για παρακολούθηση

#### Βελτιωμένα
- **Κεφάλαιο Προ-ανάπτυξης**: Τώρα περιλαμβάνει εκτενή πρότυπα παρακολούθησης και συντονισμού
- **Κεφάλαιο Εισαγωγής**: Ενισχυμένο με επαγγελματικά πρότυπα πιστοποίησης
- **Ετοιμότητα Παραγωγής**: Πλήρης κάλυψη από ασφάλεια έως παρατηρησιμότητα
- **Διάρθρωση Μαθήματος**: Ενημερωμένη για αναφορά νέων μαθημάτων στα Κεφάλαια 3 και 6

#### Αλλαγές
- **Πρόοδος Μάθησης**: Καλύτερη ενσωμάτωση ασφάλειας και παρακολούθησης σε όλο το μάθημα
- **Ποιότητα Τεκμηρίωσης**: Συνεπής βαθμολογία επιπέδου A (95-97%) σε νέα μαθήματα
- **Πρότυπα Παραγωγής**: Πλήρης κάλυψη από άκρο σε άκρο για επιχειρησιακές αναπτύξεις

#### Βελτιώσεις
- **Εμπειρία Προγραμματιστή**: Σαφής πορεία από ανάπτυξη σε παρακολούθηση παραγωγής
- **Πρότυπα Ασφαλείας**: Επαγγελματικά πρότυπα για πιστοποίηση και διαχείριση μυστικών
- **Παρατηρησιμότητα**: Πλήρης ενσωμάτωση Application Insights με AZD
- **Φορτία Εργασίας AI**: Εξειδικευμένη παρακολούθηση για Microsoft Foundry Models και πολυ-πρακτορικά συστήματα

#### Επαληθεύσεις
- ✅ Όλα τα μαθήματα περιλαμβάνουν πλήρη λειτουργικό κώδικα (όχι αποσπάσματα)
- ✅ Διαγράμματα Mermaid για οπτική μάθηση (19 συνολικά σε 3 μαθήματα)
- ✅ Πρακτικές ασκήσεις με βήματα επαλήθευσης (9 συνολικά)
- ✅ Παραγωγικά πρότυπα Bicep αναπτύξιμα μέσω `azd up`
- ✅ Ανάλυση κόστους και στρατηγικές βελτιστοποίησης
- ✅ Οδηγοί αντιμετώπισης προβλημάτων και βέλτιστες πρακτικές
- ✅ Σημεία ελέγχου γνώσης με εντολές επαλήθευσης

#### Αποτελέσματα Βαθμολόγησης Τεκμηρίωσης
- **docs/pre-deployment/application-insights.md**: - Εκτενής οδηγός παρακολούθησης
- **docs/getting-started/authsecurity.md**: - Επαγγελματικά πρότυπα ασφαλείας
- **docs/pre-deployment/coordination-patterns.md**: - Προηγμένες αρχιτεκτονικές πολυ-πρακτόρα
- **Συνολικό Νέο Περιεχόμενο**: - Συνεπείς υψηλές προδιαγραφές ποιότητας

#### Τεχνική Υλοποίηση
- **Application Insights**: Log Analytics + προσαρμοσμένη τηλεμετρία + κατανεμημένη αναζήτηση
- **Αυθεντικοποίηση**: Διαχειριζόμενη Ταυτότητα + Key Vault + πρότυπα RBAC
- **Πολυ-Πράκτορας**: Service Bus + Cosmos DB + Container Apps + ορχήστρωση
- **Παρακολούθηση**: Ζωντανές μετρικές + ερωτήσεις Kusto + ειδοποιήσεις + πίνακες εργαλείων
- **Διαχείριση Κόστους**: Στρατηγικές δειγματοληψίας, πολιτικές διατήρησης, έλεγχοι προϋπολογισμού

### [v3.7.0] - 2025-11-19

#### Βελτιώσεις Ποιότητας Τεκμηρίωσης και Νέο Παράδειγμα Microsoft Foundry Models
**Αυτή η έκδοση βελτιώνει την ποιότητα της τεκμηρίωσης σε όλο το αποθετήριο και προσθέτει ένα πλήρες παράδειγμα ανάπτυξης Microsoft Foundry Models με διεπαφή συνομιλίας gpt-4.1.**

#### Προστέθηκαν
- **🤖 Παράδειγμα Συνομιλίας Microsoft Foundry Models**: Πλήρης ανάπτυξη gpt-4.1 με λειτουργική υλοποίηση στο `examples/azure-openai-chat/`:
  - Πλήρης υποδομή Microsoft Foundry Models (ανάπτυξη μοντέλου gpt-4.1)
  - Διεπαφή συνομιλίας γραμμής εντολών Python με ιστορικό συζητήσεων
  - Ενσωμάτωση Key Vault για ασφαλή αποθήκευση API key
  - Παρακολούθηση χρήσης token και εκτίμηση κόστους
  - Περιορισμός ρυθμού και διαχείριση σφαλμάτων
  - Εκτενές README με οδηγό ανάπτυξης 35-45 λεπτών
  - 11 αρχεία έτοιμα για παραγωγή (πρότυπα Bicep, εφαρμογή Python, ρύθμιση)
- **📚 Ασκήσεις Τεκμηρίωσης**: Προστέθηκαν πρακτικές ασκήσεις στον οδηγό ρύθμισης:
  - Άσκηση 1: Ρύθμιση πολλαπλών περιβαλλόντων (15 λεπτά)
  - Άσκηση 2: Πρακτική διαχείρισης μυστικών (10 λεπτά)
  - Σαφή κριτήρια επιτυχίας και βήματα επαλήθευσης
- **✅ Επαλήθευση Ανάπτυξης**: Προστέθηκε τμήμα επαλήθευσης στον οδηγό ανάπτυξης:
  - Διαδικασίες ελέγχου υγείας
  - Λίστα ελέγχου κριτηρίων επιτυχίας
  - Αναμενόμενες εξόδους για όλες τις εντολές ανάπτυξης
  - Γρήγορος οδηγός αντιμετώπισης προβλημάτων

#### Βελτιώθηκαν
- **examples/README.md**: Ενημερώθηκε σε ποιότητα επιπέδου A (93%):
  - Προστέθηκε azure-openai-chat σε όλες τις σχετικές ενότητες
  - Ενημερώθηκε ο αριθμός τοπικών παραδειγμάτων από 3 σε 4
  - Προστέθηκε στον πίνακα παραδειγμάτων εφαρμογών AI
  - Ενσωματώθηκε στο Quick Start για ενδιάμεσους χρήστες
  - Προστέθηκε στην ενότητα προτύπων Microsoft Foundry
  - Ενημερώθηκε ο Πίνακας Σύγκρισης και οι ενότητες εύρεσης τεχνολογίας
- **Ποιότητα Τεκμηρίωσης**: Βελτιώθηκε από B+ (87%) σε A- (92%) σε όλα τα αρχεία τεκμηρίωσης:
  - Προστέθηκαν αναμενόμενα αποτελέσματα σε κρίσιμα παραδείγματα εντολών
  - Συμπεριλήφθηκαν βήματα επαλήθευσης για αλλαγές στην παραμετροποίηση
  - Ενισχύθηκε η πρακτική μάθηση με ασκήσεις

#### Αλλαγές
- **Πρόοδος Μάθησης**: Καλύτερη ενσωμάτωση παραδειγμάτων ΤΝ για μεσαίου επιπέδου εκπαιδευόμενους
- **Δομή Τεκμηρίωσης**: Περισσότερες εφαρμόσιμες ασκήσεις με σαφή αποτελέσματα
- **Διαδικασία Επαλήθευσης**: Προστέθηκαν ρητά κριτήρια επιτυχίας σε βασικές ροές εργασιών

#### Βελτιώσεις
- **Εμπειρία Προγραμματιστή**: Η ανάπτυξη των Microsoft Foundry Models διαρκεί τώρα 35-45 λεπτά (αντί 60-90 για πιο σύνθετες λύσεις)
- **Διαφάνεια Κόστους**: Σαφείς εκτιμήσεις κόστους (50-200 $/μήνα) για τα παραδείγματα Microsoft Foundry Models
- **Μονοπάτι Μάθησης**: Οι προγραμματιστές ΤΝ έχουν σαφή σημείο εισόδου με azure-openai-chat
- **Πρότυπα Τεκμηρίωσης**: Συνεπή αναμενόμενα αποτελέσματα και βήματα επαλήθευσης

#### Επικυρωμένο
- ✅ Το παράδειγμα Microsoft Foundry Models λειτουργεί πλήρως με `azd up`
- ✅ Όλα τα 11 αρχεία υλοποίησης είναι συντακτικά σωστά
- ✅ Οι οδηγίες README ταιριάζουν με την πραγματική εμπειρία ανάπτυξης
- ✅ Οι σύνδεσμοι τεκμηρίωσης ενημερώθηκαν σε πάνω από 8 τοποθεσίες
- ✅ Το ευρετήριο παραδειγμάτων αντανακλά με ακρίβεια 4 τοπικά παραδείγματα
- ✅ Δεν υπάρχουν διπλοί εξωτερικοί σύνδεσμοι σε πίνακες
- ✅ Όλες οι αναφορές πλοήγησης είναι σωστές

#### Τεχνική Υλοποίηση
- **Αρχιτεκτονική Microsoft Foundry Models**: πρότυπο gpt-4.1 + Key Vault + Container Apps
- **Ασφάλεια**: Έτοιμο Managed Identity, κρυφά στη Key Vault
- **Παρακολούθηση**: Ενσωμάτωση Application Insights
- **Διαχείριση Κόστους**: Παρακολούθηση token και βελτιστοποίηση χρήσης
- **Ανάπτυξη**: Μία εντολή `azd up` για πλήρη εγκατάσταση

### [v3.6.0] - 2025-11-19

#### Μεγάλη Ενημέρωση: Παραδείγματα Ανάπτυξης Container App
**Αυτή η έκδοση εισάγει εκτενή παραδείγματα ανάπτυξης εφαρμογών container έτοιμων για παραγωγή χρησιμοποιώντας το Azure Developer CLI (AZD), με πλήρη τεκμηρίωση και ενσωμάτωση στο μονοπάτι μάθησης.**

#### Προστέθηκαν
- **🚀 Παραδείγματα Container App**: Νέα τοπικά παραδείγματα στο `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Πλήρης επισκόπηση ανάπτυξης με container, γρήγορη εκκίνηση, παραγωγή και προχωρημένα πρότυπα
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Εύχρηστο REST API με scale-to-zero, ελέγχους υγείας, παρακολούθηση και αντιμετώπιση προβλημάτων
  - [Microservices Architecture](../../examples/container-app/microservices): Παραγωγική ανάπτυξη πολλών υπηρεσιών (API Gateway, Προϊόν, Παραγγελία, Χρήστης, Ειδοποίηση), ασύγχρονη αποστολή μηνυμάτων, Service Bus, Cosmos DB, Azure SQL, κατανεμημένη παρακολούθηση, blue-green/canary deployment
- **Καλύτερες Πρακτικές**: Ασφάλεια, παρακολούθηση, βελτιστοποίηση κόστους, και οδηγίες CI/CD για workloads με container
- **Δείγματα Κώδικα**: Πλήρης `azure.yaml`, πρότυπα Bicep και υλοποιήσεις υπηρεσιών σε πολλές γλώσσες (Python, Node.js, C#, Go)
- **Δοκιμές & Αντιμετώπιση Προβλημάτων**: Σενάρια end-to-end, εντολές παρακολούθησης, οδηγίες αντιμετώπισης προβλημάτων

#### Αλλαγές
- **README.md**: Ενημερώθηκε για να παρουσιάζει και να συνδέει τα νέα παραδείγματα container app υπό το «Local Examples - Container Applications»
- **examples/README.md**: Ενημερώθηκε για να αναδεικνύει παραδείγματα container app, να προσθέτει καταχωρήσεις πίνακα σύγκρισης και να ενημερώνει τις αναφορές τεχνολογίας/αρχιτεκτονικής
- **Course Outline & Study Guide**: Ενημερώθηκε για να αναφέρεται σε νέα παραδείγματα container app και πρότυπα ανάπτυξης σε σχετικές ενότητες

#### Επικυρωμένο
- ✅ Όλα τα νέα παραδείγματα αναπτύξιμα με `azd up` και ακολουθούν βέλτιστες πρακτικές
- ✅ Διασύνδεση και πλοήγηση τεκμηρίωσης ενημερωμένες
- ✅ Παραδείγματα καλύπτουν σενάρια από αρχάριους έως προχωρημένους, συμπεριλαμβανομένων παραγωγικών microservices

#### Σημειώσεις
- **Πεδίο**: Μόνο αγγλική τεκμηρίωση και παραδείγματα
- **Επόμενα Βήματα**: Επέκταση με επιπλέον προχωρημένα πρότυπα container και αυτοματοποίηση CI/CD σε μελλοντικές εκδόσεις

### [v3.5.0] - 2025-11-19

#### Επανασηματοδότηση Προϊόντος: Microsoft Foundry
**Αυτή η έκδοση υλοποιεί μια συνολική αλλαγή ονόματος προϊόντος από «Microsoft Foundry» σε «Microsoft Foundry» σε όλη την αγγλική τεκμηρίωση, αντανακλώντας την επίσημη επανασηματοδότηση της Microsoft.**

#### Αλλαγές
- **🔄 Ενημέρωση Ονόματος Προϊόντος**: Πλήρης επανασηματοδότηση από «Microsoft Foundry» σε «Microsoft Foundry»
  - Ενημερώθηκαν όλες οι αναφορές σε όλη την αγγλική τεκμηρίωση στον φάκελο `docs/`
  - Μετονομάσθηκε φάκελος: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Μετονομάσθηκε αρχείο: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Συνολικά: 23 αναφορές περιεχομένου ενημερώθηκαν σε 7 αρχεία τεκμηρίωσης

- **📁 Αλλαγές Δομής Φακέλων**:
  - `docs/ai-foundry/` μετονομάσθηκε σε `docs/microsoft-foundry/`
  - Ενημερώθηκαν όλες οι διασταυρούμενες αναφορές για να αντανακλούν τη νέα δομή φακέλων
  - Οι σύνδεσμοι πλοήγησης επικυρώθηκαν σε όλη την τεκμηρίωση

- **📄 Μετονομασίες Αρχείων**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Όλοι οι εσωτερικοί σύνδεσμοι ενημερώθηκαν για να αναφέρονται στο νέο όνομα αρχείου

#### Ενημερωμένα Αρχεία
- **Τεκμηρίωση Κεφαλαίων** (7 αρχεία):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ενημερώσεις συνδέσμων πλοήγησης
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ενημερώσεις αναφορών ονόματος προϊόντος
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ήδη χρησιμοποιεί Microsoft Foundry (από προηγούμενες ενημερώσεις)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 ενημερώσεις αναφορών (επισκόπηση, ανατροφοδότηση κοινότητας, τεκμηρίωση)
  - `docs/getting-started/azd-basics.md` - 4 ενημερώσεις διασταυρούμενων συνδέσμων
  - `docs/getting-started/first-project.md` - 2 ενημερώσεις συνδέσμων πλοήγησης κεφαλαίου
  - `docs/getting-started/installation.md` - 2 ενημερώσεις συνδέσμων επόμενου κεφαλαίου
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 ενημερώσεις αναφορών (πλοήγηση, κοινότητα Discord)
  - `docs/troubleshooting/common-issues.md` - 1 ενημέρωση συνδέσμου πλοήγησης
  - `docs/troubleshooting/debugging.md` - 1 ενημέρωση συνδέσμου πλοήγησης

- **Αρχεία Δομής Μαθήματος** (2 αρχεία):
  - `README.md` - 17 ενημερώσεις αναφορών (επισκόπηση μαθήματος, τίτλοι κεφαλαίων, ενότητα προτύπων, εισοδηγήματα κοινότητας)
  - `course-outline.md` - 14 ενημερώσεις αναφορών (επισκόπηση, στόχοι μάθησης, πόροι κεφαλαίων)

#### Επικυρωμένο
- ✅ Μηδενικές εναπομένουσες αναφορές φακέλου "ai-foundry" στην αγγλική τεκμηρίωση
- ✅ Μηδενικές εναπομένουσες αναφορές ονόματος προϊόντος "Microsoft Foundry" στην αγγλική τεκμηρίωση
- ✅ Όλοι οι σύνδεσμοι πλοήγησης λειτουργικοί με τη νέα δομή φακέλων
- ✅ Οι μετονομασίες αρχείων και φακέλων ολοκληρώθηκαν επιτυχώς
- ✅ Επιβεβαιώθηκαν οι διασταυρούμενες αναφορές μεταξύ κεφαλαίων

#### Σημειώσεις
- **Πεδίο**: Οι αλλαγές εφαρμόστηκαν μόνο στον φάκελο αγγλικής τεκμηρίωσης `docs/`
- **Μεταφράσεις**: Οι φάκελοι μεταφράσεων (`translations/`) δεν ενημερώθηκαν σε αυτή την έκδοση
- **Εργαστήριο**: Τα υλικά εργαστηρίου (`workshop/`) δεν ενημερώθηκαν σε αυτή την έκδοση
- **Παραδείγματα**: Αρχεία παραδειγμάτων ενδέχεται να αναφέρουν παλιά ονόματα (θα διορθωθεί σε επόμενη ενημέρωση)
- **Εξωτερικοί Σύνδεσμοι**: Οι εξωτερικοί σύνδεσμοι URL και οι αναφορές αποθετηρίων GitHub παραμένουν αμετάβλητοι

#### Οδηγός Μετάβασης για Συνεργάτες
Εάν έχετε τοπικά branches ή τεκμηρίωση που αναφέρεται στην παλιά δομή:
1. Ενημερώστε τις αναφορές φακέλου: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ενημερώστε τις αναφορές αρχείων: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Αντικαταστήστε το όνομα προϊόντος: "Microsoft Foundry" → "Microsoft Foundry"
4. Επικυρώστε ότι όλοι οι εσωτερικοί σύνδεσμοι τεκμηρίωσης λειτουργούν κανονικά

---

### [v3.4.0] - 2025-10-24

#### Βελτιώσεις Προεπισκόπησης και Επαλήθευσης Υποδομής
**Αυτή η έκδοση εισάγει πλήρη υποστήριξη για τη νέα δυνατότητα preview του Azure Developer CLI και βελτιώνει την εμπειρία χρήστη στο εργαστήριο.**

#### Προστέθηκαν
- **🧪 τεκμηρίωση εντολής azd provision --preview**: Εκτενής κάλυψη της νέας δυνατότητας προεπισκόπησης υποδομής
  - Αναφορά εντολών και παραδείγματα χρήσης σε σύντομο οδηγό
  - Λεπτομερής ενσωμάτωση στον οδηγό παροχής με περιπτώσεις χρήσης και οφέλη
  - Ενσωμάτωση ελέγχου πριν από την εκτέλεση για ασφαλέστερη επικύρωση ανάπτυξης
  - Ενημερώσεις οδηγού εκκίνησης με πρακτικές ανάπτυξης που δίνουν προτεραιότητα στην ασφάλεια
- **🚧 Πάνω Μπάρα Κατάστασης Εργαστηρίου**: Επαγγελματική μπάντα HTML που δείχνει την κατάσταση ανάπτυξης του εργαστηρίου
  - Σχεδιασμός με κλίση και δείκτες κατασκευής για σαφή επικοινωνία με τον χρήστη
  - Χρονοσφραγίδα τελευταίας ενημέρωσης για διαφάνεια
  - Σχεδιασμός φιλικός προς κινητές συσκευές

#### Ενισχύθηκε
- **Ασφάλεια Υποδομής**: Η λειτουργία preview ενσωματώθηκε σε όλα τα έγγραφα ανάπτυξης
- **Προ-ανάπτυξη Επαλήθευση**: Αυτοματοποιημένα σενάρια τώρα περιλαμβάνουν δοκιμές υποδομής preview
- **Ροή Εργασίας Προγραμματιστή**: Ενημερωμένη σειρά εντολών που περιλαμβάνει το preview ως βέλτιστη πρακτική
- **Εμπειρία Εργαστηρίου**: Ορισμός σαφών προσδοκιών σχετικά με την κατάσταση ανάπτυξης για τους χρήστες

#### Αλλαγές
- **Βέλτιστες Πρακτικές Ανάπτυξης**: Πρώτη προτίμηση η ροή εργασίας με preview
- **Ροή Τεκμηρίωσης**: Η επαλήθευση υποδομής μεταφέρθηκε νωρίτερα στη διαδικασία μάθησης
- **Παρουσίαση Εργαστηρίου**: Επαγγελματική επικοινωνία κατάστασης με σαφή χρονοδιάγραμμα ανάπτυξης

#### Βελτιώθηκε
- **Προσέγγιση με Ασφάλεια Πρώτα**: Τώρα οι αλλαγές υποδομής μπορούν να επικυρωθούν πριν από την ανάπτυξη
- **Συνεργασία Ομάδας**: Τα αποτελέσματα preview μπορούν να κοινοποιηθούν για ανασκόπηση και έγκριση
- **Ενημέρωση για Κόστος**: Καλύτερη κατανόηση κόστους πόρων πριν από την παροχή
- **Μείωση Κινδύνου**: Μειώθηκαν αποτυχίες ανάπτυξης μέσω προχωρημένης επαλήθευσης

#### Τεχνική Υλοποίηση
- **Ενσωμάτωση πολλαπλών εγγράφων**: Η δυνατότητα preview τεκμηριώθηκε σε 4 βασικά αρχεία
- **Πρότυπα Εντολών**: Συνοχή σύνταξης και παραδειγμάτων σε όλα τα έγγραφα
- **Ενσωμάτωση Βέλτιστων Πρακτικών**: Το preview περιλαμβάνεται στις ροές επαλήθευσης και στα σενάρια
- **Οπτικοί Δείκτες**: Σαφείς σημάνσεις νέας δυνατότητας για ευκολία ανακάλυψης

#### Υποδομή Εργαστηρίου
- **Επικοινωνία Κατάστασης**: Επαγγελματική μπάντα HTML με στυλ κλίσης
- **Εμπειρία Χρήστη**: Καθαρή κατάσταση ανάπτυξης αποτρέπει σύγχυση
- **Επαγγελματική Παρουσίαση**: Διατηρεί αξιοπιστία αποθετηρίου ενώ καθορίζει προσδοκίες
- **Διαφάνεια Χρονοδιαγράμματος**: Χρονοσφραγίδα τελευταίας ενημέρωσης Οκτωβρίου 2025 για υπευθυνότητα

### [v3.3.0] - 2025-09-24

#### Βελτιωμένα Υλικά Εργαστηρίου και Διαδραστική Εμπειρία Μάθησης
**Αυτή η έκδοση εισάγει εκτενή υλικά εργαστηρίου με οδηγούς βασισμένους σε περιηγητή και δομημένα μονοπάτια μάθησης.**

#### Προστέθηκαν
- **🎥 Διαδραστικός Οδηγός Εργαστηρίου**: Εμπειρία εργαστηρίου σε περιηγητή με δυνατότητα προεπισκόπησης MkDocs
- **📝 Δομημένες Οδηγίες Εργαστηρίου**: 7-βηματικό καθοδηγούμενο μονοπάτι μάθησης από την ανακάλυψη ως την παραμετροποίηση
  - 0-Εισαγωγή: Επισκόπηση και ρυθμίσεις εργαστηρίου
  - 1-Επιλογή-Προτύπου-ΤΝ: Διαδικασία ανακάλυψης και επιλογής προτύπου
  - 2-Επαλήθευση-Προτύπου-ΤΝ: Διαδικασίες ανάπτυξης και επαλήθευσης
  - 3-Ανάλυση-Προτύπου-ΤΝ: Κατανόηση Αρχιτεκτονικής προτύπου
  - 4-Παραμετροποίηση-Προτύπου-ΤΝ: Ρυθμίσεις και προσαρμογές
  - 5-Προσαρμογή-Προτύπου-ΤΝ: Προχωρημένες τροποποιήσεις και επαναλήψεις
  - 6-Καθαρισμός-Υποδομής: Απομάκρυνση και διαχείριση πόρων
  - 7-Τελικό Συμπέρασμα: Περίληψη και επόμενα βήματα
- **🛠️ Εργαλεία Εργαστηρίου**: Ρύθμιση MkDocs με θέμα Material για ενισχυμένη εμπειρία μάθησης
- **🎯 Μονοπάτι Πρακτικής Μάθησης**: Μεθοδολογία 3 βημάτων (Ανακάλυψη → Ανάπτυξη → Προσαρμογή)
- **📱 Ενσωμάτωση GitHub Codespaces**: Ομαλή ρύθμιση περιβάλλοντος ανάπτυξης

#### Ενισχύθηκε
- **Εργαστήριο ΤΝ**: Επεκτάθηκε με ολοκληρωμένη δομημένη εμπειρία μάθησης 2-3 ωρών
- **Τεκμηρίωση Εργαστηρίου**: Επαγγελματική παρουσίαση με πλοήγηση και οπτικά βοηθήματα
- **Πρόοδος Μάθησης**: Σαφής καθοδήγηση βήμα-βήμα από την επιλογή προτύπου μέχρι την παραγωγική ανάπτυξη
- **Εμπειρία Προγραμματιστή**: Ενσωματωμένα εργαλεία για ομαλές ροές εργασίας ανάπτυξης

#### Βελτιώσεις
- **Προσβασιμότητα**: Διεπαφή μέσω περιηγητή με δυνατότητα αναζήτησης, αντιγραφής και αλλαγής θέματος
- **Αυτορυθμιζόμενη Μάθηση**: Ευέλικτη δομή εργαστηρίου για διαφορετικούς ρυθμούς μάθησης
- **Πρακτική Εφαρμογή**: Σενάρια ανάπτυξης προτύπων ΤΝ σε πραγματικές συνθήκες
- **Ενσωμάτωση Κοινότητας**: Διασύνδεση Discord για υποστήριξη και συνεργασία στο εργαστήριο

#### Χαρακτηριστικά Εργαστηρίου
- **Ενσωματωμένη Αναζήτηση**: Γρήγορη εύρεση λεξεων κλειδιών και μαθημάτων
- **Αντιγραφή Τμημάτων Κώδικα**: Λειτουργία hover-to-copy για όλα τα παραδείγματα κώδικα
- **Εναλλαγή Θέματος**: Υποστήριξη σκοτεινής/φωτεινής λειτουργίας για διαφορετικές προτιμήσεις
- **Οπτικά Αποτελέσματα**: Στιγμιότυπα και διαγράμματα για καλύτερη κατανόηση
- **Ενσωμάτωση Βοήθειας**: Άμεση πρόσβαση στο Discord για υποστήριξη κοινότητας

### [v3.2.0] - 2025-09-17

#### Μεγάλη Αναδιάταξη Πλοήγησης και Σύστημα Μάθησης Βασισμένο σε Κεφάλαια
**Αυτή η έκδοση εισάγει μια ολοκληρωμένη δομή μάθησης βασισμένη σε κεφάλαια με βελτιωμένη πλοήγηση σε ολόκληρο το αποθετήριο.**

#### Προστέθηκαν
- **📚 Σύστημα Μάθησης Βασισμένο σε Κεφάλαια**: Αναδιοργάνωση όλου του μαθήματος σε 8 προοδευτικά κεφάλαια μάθησης
  - Κεφάλαιο 1: Βάσεις & Γρήγορη Εκκίνηση (⭐ - 30-45 λεπτά)
  - Κεφάλαιο 2: AI-First Ανάπτυξη (⭐⭐ - 1-2 ώρες)
  - Κεφάλαιο 3: Παραμετροποίηση & Πιστοποίηση (⭐⭐ - 45-60 λεπτά)
  - Κεφάλαιο 4: Υποδομή ως Κώδικας & Ανάπτυξη (⭐⭐⭐ - 1-1.5 ώρες)
  - Κεφάλαιο 5: Πολυ-πράκτορες Λύσεις AI (⭐⭐⭐⭐ - 2-3 ώρες)
  - Κεφάλαιο 6: Προ-ανάπτυξη Επαλήθευση & Σχεδιασμός (⭐⭐ - 1 ώρα)
  - Κεφάλαιο 7: Αντιμετώπιση Προβλημάτων & Αποσφαλμάτωση (⭐⭐ - 1-1.5 ώρες)
  - Κεφάλαιο 8: Παραγωγή & Επιχειρηματικά Πρότυπα (⭐⭐⭐⭐ - 2-3 ώρες)
- **📚 Ολοκληρωμένο Σύστημα Πλοήγησης**: Συνεπείς κεφαλίδες και υποσέλιδα πλοήγησης σε όλη την τεκμηρίωση
- **🎯 Παρακολούθηση Προόδου**: Λίστα ελέγχου ολοκλήρωσης μαθήματος και σύστημα επαλήθευσης μάθησης
- **🗺️ Καθοδήγηση Μονοπατιού Μάθησης**: Σαφή σημεία εισόδου για διαφορετικά επίπεδα εμπειρίας και στόχους
- **🔗 Διασταυρούμενη Πλοήγηση**: Σύνδεσμοι σχετικών κεφαλαίων και προαπαιτούμενα

#### Ενισχύθηκαν
- **Δομή README**: Μετασχηματίστηκε σε οργανωμένη πλατφόρμα μάθησης βασισμένη σε κεφάλαια
- **Πλοήγηση Τεκμηρίωσης**: Κάθε σελίδα περιλαμβάνει πλέον πλαίσιο κεφαλαίου και καθοδήγηση προόδου
- **Οργάνωση Προτύπων**: Παραδείγματα και πρότυπα συνδεδεμένα με κατάλληλα κεφάλαια μάθησης
- **Ενσωμάτωση Πόρων**: Cheatsheets, Συχνές Ερωτήσεις, και οδηγοί σπουδών συνδεδεμένοι με σχετικά κεφάλαια
- **Ενσωμάτωση Εργαστηρίου**: Πρακτικά εργαστήρια συνδεδεμένα με πολλούς μαθησιακούς στόχους κεφαλαίων

#### Αλλαγές
- **Πρόοδος Μάθησης**: Μετατοπίστηκε από γραμμική τεκμηρίωση σε ευέλικτη μάθηση βασισμένη σε κεφάλαια  
- **Τοποθέτηση Παραμετροποίησης**: Μετατοπίστηκε ο οδηγός παραμετροποίησης ως Κεφάλαιο 3 για καλύτερη ροή μάθησης  
- **Ενσωμάτωση Περιεχομένου AI**: Καλύτερη ενσωμάτωση περιεχομένου ειδικού για τεχνητή νοημοσύνη σε όλη τη διαδρομή μάθησης  
- **Παραγωγικό Περιεχόμενο**: Προηγμένα μοτίβα ενοποιημένα στο Κεφάλαιο 8 για εκπαιδευόμενους επιχειρήσεων  

#### Βελτιωμένα  
- **Εμπειρία Χρήστη**: Καθαροί δείκτες πλοήγησης και προόδου κεφαλαίων  
- **Προσβασιμότητα**: Συνεπή μοτίβα πλοήγησης για ευκολότερη περιήγηση στο μάθημα  
- **Επαγγελματική Παρουσίαση**: Δομή μαθήματος τύπου πανεπιστημίου κατάλληλη για ακαδημαϊκή και εταιρική εκπαίδευση  
- **Αποδοτικότητα Μάθησης**: Μειωμένος χρόνος εύρεσης σχετικού περιεχομένου μέσω βελτιωμένης οργάνωσης  

#### Τεχνική Εφαρμογή  
- **Κεφαλίδες Πλοήγησης**: Τυποποιημένη πλοήγηση κεφαλαίων σε πάνω από 40 αρχεία τεκμηρίωσης  
- **Πλοήγηση Υποσέλιδου**: Συνεπής καθοδήγηση προόδου και δείκτες ολοκλήρωσης κεφαλαίων  
- **Διασύνδεση**: Ολοκληρωμένο σύστημα εσωτερικών συνδέσμων που συνδέει σχετικές έννοιες  
- **Χάρτης Κεφαλαίων**: Πρότυπα και παραδείγματα σαφώς συνδεδεμένα με μαθησιακούς στόχους  

#### Ενίσχυση Οδηγού Μελέτης  
- **📚 Ολοκληρωμένοι Μαθησιακοί Στόχοι**: Ανασχεδιασμένος οδηγός μελέτης για ευθυγράμμιση με το σύστημα 8 κεφαλαίων  
- **🎯 Αξιολόγηση Βασισμένη σε Κεφάλαια**: Κάθε κεφάλαιο περιλαμβάνει συγκεκριμένους μαθησιακούς στόχους και πρακτικές ασκήσεις  
- **📋 Παρακολούθηση Προόδου**: Εβδομαδιαίο πρόγραμμα μάθησης με μετρήσιμα αποτελέσματα και λίστες ελέγχου ολοκλήρωσης  
- **❓ Ερωτήσεις Αξιολόγησης**: Ερωτήσεις επιβεβαίωσης γνώσεων για κάθε κεφάλαιο με επαγγελματικά αποτελέσματα  
- **🛠️ Πρακτικές Ασκήσεις**: Εργαστηριακές δραστηριότητες με πραγματικά σενάρια ανάπτυξης και αντιμετώπισης προβλημάτων  
- **📊 Πρόοδος Δεξιοτήτων**: Σαφής εξέλιξη από βασικές έννοιες σε επιχειρησιακά μοτίβα με επίκεντρο την επαγγελματική ανάπτυξη  
- **🎓 Πλαίσιο Πιστοποίησης**: Αποτελέσματα επαγγελματικής ανάπτυξης και σύστημα αναγνώρισης κοινότητας  
- **⏱️ Διαχείριση Χρονοδιαγράμματος**: Δομημένο σχέδιο μάθησης 10 εβδομάδων με επικύρωση ορόσημων  

### [v3.1.0] - 2025-09-17  

#### Βελτιωμένες Λύσεις Πολυ-πράκτορα AI  
**Αυτή η έκδοση βελτιώνει τη λύση πολυ-πράκτορα για το λιανικό εμπόριο με καλύτερη ονομασία πρακτόρων και ενισχυμένη τεκμηρίωση.**  

#### Αλλαγές  
- **Ορολογία Πολυ-πράκτορα**: Αντικαταστάθηκε ο "πράκτορας Cora" με "πράκτορα πελάτη" σε όλη τη λύση πολυ-πράκτορα λιανικού εμπορίου για πιο σαφή κατανόηση  
- **Αρχιτεκτονική Πράκτορα**: Ανανεώθηκε όλη η τεκμηρίωση, τα πρότυπα ARM και τα παραδείγματα κώδικα για ομοιόμορφη χρήση ονομασίας "πράκτορα πελάτη"  
- **Παραδείγματα Παραμετροποίησης**: Σύγχρονα μοτίβα παραμετροποίησης πρακτόρων με ενημερωμένες ονομασίες  
- **Συνέπεια Τεκμηρίωσης**: Εξασφαλίστηκε ότι όλες οι αναφορές χρησιμοποιούν επαγγελματικές, περιγραφικές ονομασίες πρακτόρων  

#### Βελτιώσεις  
- **Πακέτο Προτύπου ARM**: Ενημερώθηκε το retail-multiagent-arm-template με αναφορές στον πράκτορα πελάτη  
- **Διαγράμματα Αρχιτεκτονικής**: Ανανεωμένα διαγράμματα Mermaid με ενημερωμένη ονομασία πρακτόρων  
- **Παραδείγματα Κώδικα**: Οι κλάσεις Python και τα παραδείγματα υλοποίησης τώρα χρησιμοποιούν την ονομασία CustomerAgent  
- **Μεταβλητές Περιβάλλοντος**: Ενημερώθηκαν όλα τα σενάρια ανάπτυξης για χρήση της σύμβασης CUSTOMER_AGENT_NAME  

#### Βελτιωμένη  
- **Εμπειρία Προγραμματιστή**: Πιο ξεκάθαροι ρόλοι και ευθύνες πρακτόρων στην τεκμηρίωση  
- **Ετοιμότητα Παραγωγής**: Καλύτερη ευθυγράμμιση με επιχειρησιακές ονομασίες  
- **Υλικά Μάθησης**: Πιο διαισθητική ονομασία πρακτόρων για εκπαιδευτικούς σκοπούς  
- **Χρηστικότητα Προτύπων**: Απλοποιημένη κατανόηση λειτουργιών πρακτόρων και προτύπων ανάπτυξης  

#### Τεχνικές Λεπτομέρειες  
- Ανανεώθηκαν τα διαγράμματα αρχιτεκτονικής Mermaid με αναφορές στο CustomerAgent  
- Αντικαταστάθηκαν τα ονόματα κλάσεων CoraAgent με CustomerAgent στα παραδείγματα Python  
- Τροποποιήθηκαν οι JSON ρυθμίσεις προτύπων ARM για χρήση τύπου πράκτορα "customer"  
- Ενημερώθηκαν οι μεταβλητές περιβάλλοντος από CORA_AGENT_* σε CUSTOMER_AGENT_*  
- Ανανεώθηκαν όλες οι εντολές ανάπτυξης και οι ρυθμίσεις κοντέινερ  

### [v3.0.0] - 2025-09-12  

#### Σημαντικές Αλλαγές - Εστίαση σε Προγραμματιστές AI και Ενσωμάτωση Microsoft Foundry  
**Αυτή η έκδοση μετατρέπει το αποθετήριο σε εκτενή πόρο μάθησης εστιασμένο στην AI με ενσωμάτωση Microsoft Foundry.**  

#### Προσθήκες  
- **🤖 AI-Πρώτη Διαδρομή Μάθησης**: Πλήρης αναδιάρθρωση με προτεραιότητα σε προγραμματιστές και μηχανικούς AI  
- **Οδηγός Ενσωμάτωσης Microsoft Foundry**: Ολοκληρωμένη τεκμηρίωση για σύνδεση του AZD με υπηρεσίες Microsoft Foundry  
- **Πρότυπα Ανάπτυξης AI Μοντέλων**: Λεπτομερής οδηγός για επιλογή, παραμετροποίηση και στρατηγικές παραγωγικής ανάπτυξης μοντέλων  
- **Εργαστήριο AI**: Εργαστήριο 2-3 ωρών με πρακτική μετατροπή εφαρμογών AI σε λύσεις αναπτυσσόμενες με AZD  
- **Βέλτιστες Πρακτικές Παραγωγής AI**: Ετοιμα μοτίβα για κλιμάκωση, παρακολούθηση και ασφάλεια φορτίων εργασίας AI σε επιχειρήσεις  
- **Οδηγός Αντιμετώπισης Προβλημάτων AI**: Ολοκληρωμένος διαγνωστικός οδηγός για μοντέλα Microsoft Foundry, Cognitive Services και αναπτύξεις AI  
- **Πανόραμα Προτύπων AI**: Επιλεγμένη συλλογή προτύπων Microsoft Foundry με βαθμολογίες πολυπλοκότητας  
- **Υλικά Εργαστηρίου**: Πλήρης δομή εργαστηρίου με εργαστηριακές ασκήσεις και υλικό αναφοράς  

#### Βελτιώσεις  
- **Δομή README**: Εστίαση σε προγραμματιστές AI με στοιχεία ενδιαφέροντος 45% από κοινότητα Discord Microsoft Foundry  
- **Διαδρομές Μάθησης**: Αφιερωμένη πορεία AI δίπλα σε παραδοσιακές για φοιτητές και μηχανικούς DevOps  
- **Συστάσεις Προτύπων**: Επιλεγμένα πρότυπα AI όπως azure-search-openai-demo, contoso-chat, και openai-chat-app-quickstart  
- **Ενσωμάτωση Κοινότητας**: Ενισχυμένη υποστήριξη κοινότητας Discord με AI-ειδικά κανάλια και συζητήσεις  

#### Ασφάλεια & Παραγωγή  
- **Πρότυπα Διαχειριζόμενης Ταυτότητας**: AI-ειδικές ρυθμίσεις πιστοποίησης και ασφάλειας  
- **Βελτιστοποίηση Κόστους**: Παρακολούθηση χρήσης tokens και έλεγχος προϋπολογισμού για φορτία AI  
- **Πολυ-περιοχική Ανάπτυξη**: Στρατηγικές για παγκόσμια ανάπτυξη εφαρμογών AI  
- **Παρακολούθηση Απόδοσης**: AI-ειδικά μετρικά και ενσωμάτωση Application Insights  

#### Ποιότητα Τεκμηρίωσης  
- **Γραμμική Δομή Μαθήματος**: Λογική πρόοδος από αρχάριο σε προχωρημένα μοτίβα ανάπτυξης AI  
- **Επαληθευμένοι Σύνδεσμοι**: Όλοι οι εξωτερικοί σύνδεσμοι αποθετηρίων επαληθευμένοι και προσβάσιμοι  
- **Πλήρης Αναφορά**: Όλοι οι εσωτερικοί σύνδεσμοι τεκμηρίωσης επαληθευμένοι και λειτουργικοί  
- **Έτοιμα για Παραγωγή**: Επιχειρησιακά μοτίβα με παραδείγματα πραγματικού κόσμου  

### [v2.0.0] - 2025-09-09  

#### Σημαντικές Αλλαγές - Αναδιάρθρωση Αποθετηρίου και Επαγγελματική Αναβάθμιση  
**Αυτή η έκδοση αντιπροσωπεύει σημαντική αναθεώρηση της δομής του αποθετηρίου και της παρουσίασης περιεχομένου.**  

#### Προσθήκες  
- **Δομημένο Πλαίσιο Μάθησης**: Όλες οι σελίδες τεκμηρίωσης περιλαμβάνουν πλέον ενότητες Εισαγωγής, Στόχων Μάθησης, και Αποτελεσμάτων  
- **Σύστημα Πλοήγησης**: Προστέθηκαν σύνδεσμοι Πίσω/Επόμενο μάθημα για καθοδηγούμενη πρόοδο μάθησης  
- **Οδηγός Μελέτης**: Ολοκληρωμένος study-guide.md με μαθησιακούς στόχους, πρακτικές ασκήσεις και υλικό αξιολόγησης  
- **Επαγγελματική Παρουσίαση**: Αφαιρέθηκαν όλα τα emoji για βελτιωμένη προσβασιμότητα και επαγγελματική εμφάνιση  
- **Βελτιωμένη Δομή Περιεχομένου**: Βελτιωμένη οργάνωση και ροή εκπαιδευτικού υλικού  

#### Αλλαγές  
- **Μορφή Τεκμηρίωσης**: Τυποποιήθηκε όλη η τεκμηρίωση με συνεπή δομή εστιασμένη στη μάθηση  
- **Ροή Πλοήγησης**: Εφαρμόστηκε λογική πρόοδος μέσα σε όλο το εκπαιδευτικό υλικό  
- **Παρουσίαση Περιεχομένου**: Αφαιρέθηκαν διακοσμητικά στοιχεία υπέρ καθαρής, επαγγελματικής διαμόρφωσης  
- **Δομή Συνδέσμων**: Ενημερώθηκαν όλοι οι εσωτερικοί σύνδεσμοι για υποστήριξη του νέου συστήματος πλοήγησης  

#### Βελτιώσεις  
- **Προσβασιμότητα**: Αφαιρέθηκαν εξαρτήσεις από emoji για καλύτερη συμβατότητα με αναγνώστες οθόνης  
- **Επαγγελματική Εμφάνιση**: Καθαρή, ακαδημαϊκού τύπου παρουσίαση κατάλληλη για επιχειρησιακή μάθηση  
- **Εμπειρία Μάθησης**: Δομημένη προσέγγιση με σαφείς στόχους και αποτελέσματα για κάθε μάθημα  
- **Οργάνωση Περιεχομένου**: Καλύτερη λογική ροή και σύνδεση μεταξύ σχετικών θεμάτων  

### [v1.0.0] - 2025-09-09  

#### Αρχική Κυκλοφορία - Ολοκληρωμένο Αποθετήριο Μάθησης AZD  

#### Προσθήκες  
- **Βασική Δομή Τεκμηρίωσης**  
  - Ολοκληρωμένη σειρά οδηγών για αρχή  
  - Ολοκληρωμένη τεκμηρίωση ανάπτυξης και παροχής υπηρεσιών  
  - Λεπτομερής οδηγός αντιμετώπισης προβλημάτων και αποσφαλμάτωσης  
  - Εργαλεία και διαδικασίες επικύρωσης πριν την ανάπτυξη  

- **Μονάδα Ξεκινήματος**  
  - Βασικές έννοιες και ορολογία AZD  
  - Οδηγός εγκατάστασης: Οδηγίες για κάθε πλατφόρμα  
  - Οδηγός παραμετροποίησης: Ρυθμίσεις περιβάλλοντος και πιστοποίησης  
  - Πρώτο έργο: Βήμα-βήμα πρακτική μάθηση  

- **Μονάδα Ανάπτυξης και Παροχής Υπηρεσιών**  
  - Οδηγός ανάπτυξης: Πλήρης τεκμηρίωση ροής εργασίας  
  - Οδηγός παροχής υποδομών ως κώδικα με Bicep  
  - Βέλτιστες πρακτικές για παραγωγικές αναπτύξεις  
  - Μοτίβα αρχιτεκτονικής πολυ-υπηρεσιών  

- **Μονάδα Επικύρωσης πριν την Ανάπτυξη**  
  - Προγραμματισμός χωρητικότητας: Επικύρωση διαθεσιμότητας πόρων Azure  
  - Επιλογή SKU: Οδηγίες για επίπεδα υπηρεσιών  
  - Έλεγχοι πριν την ανάπτυξη: Αυτόματα σενάρια επικύρωσης (PowerShell και Bash)  
  - Εκτίμηση κόστους και εργαλεία προϋπολογισμού  

- **Μονάδα Αντιμετώπισης Προβλημάτων**  
  - Συνηθισμένα προβλήματα και λύσεις  
  - Οδηγός αποσφαλμάτωσης με συστηματικές μεθοδολογίες  
  - Προηγμένες τεχνικές και εργαλεία διάγνωσης  
  - Παρακολούθηση και βελτιστοποίηση απόδοσης  

- **Πόροι και Αναφορές**  
  - Φυλλάδιο εντολών: Γρήγορη αναφορά βασικών εντολών  
  - Γλωσσάρι: Λεπτομερείς ορισμοί ορολογίας και ακρώνυμων  
  - Συχνές Ερωτήσεις: Αναλυτικές απαντήσεις σε κοινές ερωτήσεις  
  - Εξωτερικοί σύνδεσμοι και συνδέσεις κοινότητας  

- **Παραδείγματα και Πρότυπα**  
  - Παράδειγμα απλής διαδικτυακής εφαρμογής  
  - Πρότυπο ανάπτυξης στατικού ιστότοπου  
  - Παραμετροποίηση εφαρμογής κοντέινερ  
  - Μοτίβα ενσωμάτωσης βάσεων δεδομένων  
  - Παραδείγματα αρχιτεκτονικής μικροϋπηρεσιών  
  - Υλοποιήσεις λειτουργιών χωρίς διακομιστή (serverless)  

#### Χαρακτηριστικά  
- **Υποστήριξη Πολλαπλών Πλατφορμών**: Οδηγοί εγκατάστασης και παραμετροποίησης για Windows, macOS, και Linux  
- **Πολλαπλά Επίπεδα Δεξιοτήτων**: Περιεχόμενο σχεδιασμένο για φοιτητές μέχρι επαγγελματίες προγραμματιστές  
- **Πρακτική Εστίαση**: Παραδείγματα και σενάρια πραγματικού κόσμου  
- **Ολοκληρωμένη Κάλυψη**: Από βασικές έννοιες μέχρι προχωρημένα μοτίβα επιχειρήσεων  
- **Προσέγγιση με Προτεραιότητα Ασφάλειας**: Ενσωματωμένες βέλτιστες πρακτικές ασφαλείας σε όλο το περιεχόμενο  
- **Βελτιστοποίηση Κόστους**: Οδηγίες για οικονομικές αναπτύξεις και διαχείριση πόρων  

#### Ποιότητα Τεκμηρίωσης  
- **Λεπτομερή Παραδείγματα Κώδικα**: Πρακτικά και ελεγμένα παραδείγματα κώδικα  
- **Οδηγίες Βήμα-Βήμα**: Καθαρή και εφαρμόσιμη καθοδήγηση  
- **Ολοκληρωμένη Διαχείριση Σφαλμάτων**: Αντιμετώπιση κοινών προβλημάτων  
- **Ενσωμάτωση Βέλτιστων Πρακτικών**: Βιομηχανικά πρότυπα και συστάσεις  
- **Συμβατότητα Έκδοσης**: Ενημερωμένο με τις τελευταίες υπηρεσίες Azure και χαρακτηριστικά azd  

## Προγραμματισμένες Μελλοντικές Βελτιώσεις  

### Έκδοση 3.1.0 (Προγραμματισμένη)  
#### Επέκταση Πλατφόρμας AI  
- **Υποστήριξη Πολλαπλών Μοντέλων**: Μοτίβα ενσωμάτωσης για Hugging Face, Azure Machine Learning, και προσαρμοσμένα μοντέλα  
- **Πλαίσια Πρακτόρων AI**: Πρότυπα για LangChain, Semantic Kernel, και AutoGen ανάπτυξεις  
- **Προηγμένα Μοτίβα RAG**: Επιλογές βάσεων δεδομένων διανυσμάτων πέραν του Azure AI Search (Pinecone, Weaviate, κ.ά.)  
- **Παρατηρησιμότητα AI**: Ενισχυμένη παρακολούθηση απόδοσης μοντέλων, χρήσης tokens, και ποιότητας απαντήσεων  

#### Εμπειρία Προγραμματιστή  
- **Επέκταση VS Code**: Ενοποιημένη εμπειρία ανάπτυξης AZD + Microsoft Foundry  
- **Ενσωμάτωση GitHub Copilot**: Δημιουργία προτύπων AZD με βοήθεια AI  
- **Διαδραστικά Μαθήματα**: Πρακτικές ασκήσεις κώδικα με αυτοματοποιημένη επαλήθευση για σενάρια AI  
- **Περιεχόμενο Βίντεο**: Συμπληρωματικά βίντεο για οπτικούς μαθητές με εστίαση σε αναπτύξεις AI  

### Έκδοση 4.0.0 (Προγραμματισμένη)  
#### Επιχειρησιακά Μοτίβα AI  
- **Πλαίσιο Διακυβέρνησης**: Διακυβέρνηση μοντέλων AI, συμμόρφωση, και ίχνη ελέγχου  
- **Πολυ-ενοικιαζόμενο AI**: Μοτίβα για εξυπηρέτηση πολλών πελατών με απομονωμένες υπηρεσίες AI  
- **Ανάπτυξη Edge AI**: Ενσωμάτωση με Azure IoT Edge και περιπτώσεις κοντέινερ  
- **Υβριδικό Cloud AI**: Μοτίβα πολλαπλών και υβριδικών υπολογιστικών νεφών για φορτία AI  

#### Προηγμένα Χαρακτηριστικά  
- **Αυτοματοποίηση AI Pipeline**: Ενσωμάτωση MLOps με pipelines Azure Machine Learning  
- **Προηγμένη Ασφάλεια**: Μοτίβα zero-trust, ιδιωτικά endpoints, και προηγμένη προστασία απειλών  
- **Βελτιστοποίηση Απόδοσης**: Προηγμένος συντονισμός και κλιμάκωση για εφαρμογές AI με υψηλή διαμεταγωγή  
- **Παγκόσμια Κατανομή**: Μοτίβα παράδοσης περιεχομένου και edge caching για εφαρμογές AI  

### Έκδοση 3.0.0 (Προγραμματισμένη) - Υπερκεράστηκε από την Τρέχουσα Έκδοση  
#### Προτεινόμενες Προσθήκες - Τώρα Υλοποιημένες στην v3.0.0  
- ✅ **Περιεχόμενο Εστιασμένο στην AI**: Ολοκληρωμένη ενσωμάτωση Microsoft Foundry (Ολοκληρώθηκε)  
- ✅ **Διαδραστικά Εργαστήρια**: Πρακτικό εργαστήριο AI (Ολοκληρώθηκε)  
- ✅ **Προηγμένη Ενότητα Ασφάλειας**: AI-ειδικά μοτίβα ασφάλειας (Ολοκληρώθηκε)  
- ✅ **Βελτιστοποίηση Απόδοσης**: Στρατηγικές ρύθμισης φορτίων AI (Ολοκληρώθηκε)  

### Έκδοση 2.1.0 (Προγραμματισμένη) - Μερικώς Υλοποιημένη στην v3.0.0  
#### Μικρές Βελτιώσεις - Μερικές Ολοκληρώθηκαν στην Τρέχουσα Έκδοση  
- ✅ **Επιπλέον Παραδείγματα**: Σενάρια ανάπτυξης εστιασμένα στην AI (Ολοκληρώθηκε)  
- ✅ **Εκτεταμένο FAQ**: Ερωτήσεις και αντιμετώπιση προβλημάτων AI (Ολοκληρώθηκε)  
- **Ενσωμάτωση Εργαλείων**: Βελτιωμένοι οδηγοί για IDE και συντάκτες  
- ✅ **Επέκταση Παρακολούθησης**: AI-ειδικά μοτίβα παρακολούθησης και ειδοποιήσεων (Ολοκληρώθηκε)  

#### Ακόμα Προγραμματισμένες για Μελλοντική Έκδοση  
- **Τεκμηρίωση Φιλική σε Κινητές Συσκευές**: Ανταποκρινόμενος σχεδιασμός για κινητή μάθηση  
- **Πρόσβαση εκτός Σύνδεσης**: Πακέτα τεκμηρίωσης για κατέβασμα  
- **Βελτιωμένη Ενσωμάτωση IDE**: Επέκταση VS Code για ροές εργασίας AZD + AI  
- **Πίνακας Ελέγχου Κοινότητας**: Σε πραγματικό χρόνο μετρικά και παρακολούθηση συνεισφορών  

## Συμμετοχή στο Changelog  

### Αναφορά Αλλαγών  
Κατά τη συνεισφορά σε αυτό το αποθετήριο, παρακαλώ βεβαιωθείτε ότι οι καταχωρήσεις changelog περιλαμβάνουν:  

1. **Αριθμό Έκδοσης**: Σύμφωνα με το semantic versioning (major.minor.patch)  
2. **Ημερομηνία**: Ημερομηνία κυκλοφορίας ή ενημέρωσης σε μορφή YYYY-MM-DD  
3. **Κατηγορία**: Προστέθηκε, Αλλάχθηκε, Αποσυρμένο, Αφαιρέθηκε, Διορθώθηκε, Ασφάλεια  
4. **Σαφής Περιγραφή**: Συνοπτική περιγραφή των αλλαγών  
5. **Αξιολόγηση Επιπτώσεων**: Πώς επηρεάζουν οι αλλαγές τους υπάρχοντες χρήστες  

### Κατηγορίες Αλλαγών  

#### Προστέθηκε  
- Νέα χαρακτηριστικά, τμήματα τεκμηρίωσης ή δυνατότητες  
- Νέα παραδείγματα, πρότυπα ή πόροι μάθησης  
- Επιπλέον εργαλεία, σενάρια ή βοηθητικά προγράμματα  

#### Αλλάχθηκε  
- Τροποποιήσεις σε υπάρχουσες λειτουργίες ή τεκμηρίωση  
- Ενημερώσεις για βελτίωση της σαφήνειας ή ακρίβειας  
- Αναδιοργάνωση περιεχομένου ή δομής  

#### Αποσυρμένο  
- Χαρακτηριστικά ή προσεγγίσεις που σταδιακά καταργούνται  
- Τμήματα τεκμηρίωσης προγραμματισμένα για αφαίρεση  
- Μέθοδοι που έχουν καλύτερες εναλλακτικές  

#### Αφαιρέθηκε  
- Χαρακτηριστικά, τεκμηρίωση ή παραδείγματα που δεν είναι πλέον σχετικά  
- Παλαιές πληροφορίες ή αποσυρμένα μοτίβα  
- Υπερβολικό ή ενοποιημένο περιεχόμενο  

#### Διορθώθηκε  
- Διορθώσεις σφαλμάτων σε τεκμηρίωση ή κώδικα  
- Επίλυση αναφερόμενων προβλημάτων  
- Βελτιώσεις ακρίβειας ή λειτουργικότητας  

#### Ασφάλεια  
- Βελτιώσεις ή επιδιορθώσεις σχετικές με την ασφάλεια  
- Ενημερώσεις βέλτιστων πρακτικών ασφαλείας  
- Επίλυση ευπαθειών ασφαλείας  

### Οδηγίες Semantic Versioning  

#### Μεγάλη Έκδοση (X.0.0)  
- Αλλαγές που απαιτούν δράση του χρήστη
- Σημαντική αναδιάρθρωση του περιεχομένου ή της οργάνωσης
- Αλλαγές που αλλάζουν τη βασική προσέγγιση ή μεθοδολογία

#### Ελάσσονα Έκδοση (X.Y.0)
- Νέες δυνατότητες ή προσθήκες περιεχομένου
- Βελτιώσεις που διατηρούν την συμβατότητα προς τα πίσω
- Πρόσθετα παραδείγματα, εργαλεία ή πόροι

#### Έκδοση Patch (X.Y.Z)
- Διορθώσεις σφαλμάτων και επανορθώσεις
- Μικρές βελτιώσεις στο υπάρχον περιεχόμενο
- Διευκρινίσεις και μικρές ενισχύσεις

## Ανάδραση και Προτάσεις της Κοινότητας

Ενθαρρύνουμε ενεργά την ανάδραση της κοινότητας για τη βελτίωση αυτού του εκπαιδευτικού υλικού:

### Πώς να Παρέχετε Ανάδραση
- **GitHub Issues**: Αναφέρετε προβλήματα ή προτείνετε βελτιώσεις (ζητήματα ειδικά για AI ευπρόσδεκτα)
- **Συζητήσεις Discord**: Μοιραστείτε ιδέες και αλληλεπιδράστε με την κοινότητα Microsoft Foundry
- **Pull Requests**: Συμβάλετε με απευθείας βελτιώσεις στο περιεχόμενο, ιδιαίτερα για πρότυπα και οδηγούς AI
- **Microsoft Foundry Discord**: Συμμετέχετε στο κανάλι #Azure για συζητήσεις AZD + AI
- **Φόρουμ Κοινότητας**: Συμμετοχή σε ευρύτερες συζητήσεις προγραμματιστών Azure

### Κατηγορίες Ανάδρασης
- **Ακρίβεια Περιεχομένου AI**: Διορθώσεις πληροφοριών ενσωμάτωσης και ανάπτυξης υπηρεσιών AI
- **Εμπειρία Μάθησης**: Προτάσεις για βελτίωση της ροής μάθησης AI προγραμματιστών
- **Ελλείπον Περιεχόμενο AI**: Αιτήματα για πρόσθετα πρότυπα, μοτίβα ή παραδείγματα AI
- **Προσβασιμότητα**: Βελτιώσεις για ποικίλες ανάγκες μάθησης
- **Ενσωμάτωση Εργαλείων AI**: Προτάσεις για καλύτερη ενσωμάτωση της ροής εργασίας ανάπτυξης AI
- **Παραγωγικά Μοτίβα AI**: Αιτήματα μοτίβων ανάπτυξης AI για επιχειρήσεις

### Δέσμευση Απάντησης
- **Απάντηση σε Ζητήματα**: Εντός 48 ωρών για αναφερόμενα προβλήματα
- **Αιτήματα Χαρακτηριστικών**: Αξιολόγηση εντός μιας εβδομάδας
- **Συνεισφορές Κοινότητας**: Αξιολόγηση εντός μιας εβδομάδας
- **Θέματα Ασφαλείας**: Άμεση προτεραιότητα με επιταχυνόμενη απάντηση

## Πρόγραμμα Συντήρησης

### Κανονικές Ενημερώσεις
- **Μηνιαίοι Έλεγχοι**: Ακρίβεια περιεχομένου και επαλήθευση συνδέσμων
- **Τριμηνιαίες Ενημερώσεις**: Μεγάλες προσθήκες και βελτιώσεις περιεχομένου
- **Εξαμηνιαίοι Έλεγχοι**: Εκτεταμένη αναδιάρθρωση και ενίσχυση
- **Ετήσιες Κυκλοφορίες**: Μεγάλες ενημερώσεις έκδοσης με σημαντικές βελτιώσεις

### Παρακολούθηση και Διασφάλιση Ποιότητας
- **Αυτοματοποιημένες Δοκιμές**: Κανονικός έλεγχος παραδειγμάτων κώδικα και συνδέσμων
- **Ενσωμάτωση Ανάδρασης Κοινότητας**: Κανονική ενσωμάτωση προτάσεων χρηστών
- **Τεχνολογικές Ενημερώσεις**: Ευθυγράμμιση με τις τελευταίες υπηρεσίες Azure και εκδόσεις azd
- **Έλεγχοι Προσβασιμότητας**: Κανονική ανασκόπηση για αρχές σχεδιασμού περιλαμβανόμενου σχεδιασμού

## Πολιτική Υποστήριξης Έκδοσης

### Υποστήριξη Τρέχουσας Έκδοσης
- **Τελευταία Κύρια Έκδοση**: Πλήρης υποστήριξη με κανονικές ενημερώσεις
- **Προηγούμενη Κύρια Έκδοση**: Ενημερώσεις ασφαλείας και κρίσιμες διορθώσεις για 12 μήνες
- **Παλαιότερες Εκδόσεις**: Μόνο υποστήριξη κοινότητας, χωρίς επίσημες ενημερώσεις

### Οδηγίες Μεταφοράς
Όταν κυκλοφορούν μεγάλες εκδόσεις, παρέχουμε:
- **Οδηγοί Μεταφοράς**: Βήμα προς βήμα οδηγίες μετάβασης
- **Σημειώσεις Συμβατότητας**: Λεπτομέρειες για αλλαγές που «σπάνε» τη συμβατότητα
- **Υποστήριξη Εργαλείων**: Σενάρια ή εργαλεία για διευκόλυνση της μεταφοράς
- **Υποστήριξη Κοινότητας**: Αφιερωμένα φόρουμ για ερωτήματα μεταφοράς

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Study Guide](resources/study-guide.md)
- **Επόμενο Μάθημα**: Επιστροφή στο [Main README](README.md)

**Μείνετε Ενημερωμένοι**: Παρακολουθήστε αυτό το αποθετήριο για ειδοποιήσεις σχετικά με νέες εκδόσεις και σημαντικές ενημερώσεις του εκπαιδευτικού υλικού.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->