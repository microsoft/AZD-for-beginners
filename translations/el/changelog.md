# Αρχείο αλλαγών - AZD Για Αρχάριους

## Εισαγωγή

Αυτό το αρχείο αλλαγών καταγράφει όλες τις αξιοσημείωτες αλλαγές, ενημερώσεις και βελτιώσεις στο αποθετήριο AZD Για Αρχάριους. Ακολουθούμε τις αρχές της σημασιολογικής έκδοσης και διατηρούμε αυτό το αρχείο για να βοηθήσουμε τους χρήστες να κατανοήσουν τι έχει αλλάξει μεταξύ των εκδόσεων.

## Στόχοι Μάθησης

Με την ανασκόπηση αυτού του αρχείου αλλαγών, θα:
- Παραμείνετε ενημερωμένοι για νέες λειτουργίες και προσθήκες περιεχομένου
- Κατανοήσετε τις βελτιώσεις που έγιναν στην υπάρχουσα τεκμηρίωση
- Παρακολουθείτε διορθώσεις σφαλμάτων και διορθώσεις για την εξασφάλιση ακρίβειας
- Ακολουθείτε την εξέλιξη των μαθησιακών υλικών με τον χρόνο

## Μαθησιακά Αποτελέσματα

Μετά την ανασκόπηση των καταχωρήσεων αρχείου αλλαγών, θα μπορείτε να:
- Αναγνωρίζετε νέο περιεχόμενο και πόρους διαθέσιμους για μάθηση
- Κατανοείτε ποιες ενότητες έχουν ενημερωθεί ή βελτιωθεί
- Σχεδιάζετε τη μαθησιακή σας πορεία με βάση τα πιο σύγχρονα υλικά
- Συνεισφέρετε σχόλια και προτάσεις για μελλοντικές βελτιώσεις

## Ιστορικό Εκδόσεων

### [v3.24.0]- 2026-11-04

#### Διορθώσεις
- Επισκευάστηκαν η πλοήγηση στα μαθήματα Αγγλικών, οι διαδρομές μετακινούμενων σελίδων, οι ελλείποντες σύνδεσμοι και παρωχημένες εξωτερικές αναφορές, συμπεριλαμβανομένου του συνδέσμου του Κεφαλαίου 2 στον οδηγό παραγωγής AI.
- Επανεξετάστηκε η τρέχουσα καθοδήγηση σε σχέση με το δημοσιευμένο AZD 1.37.2, agents 1.0.0-beta.23, και evaluations 1.0.0-beta.2. Τεκμηριώθηκε η ξεχωριστή ροή εργασίας `azd ai eval` και η μετεγκατάσταση διαμόρφωσης βελτιστοποίησης.
- Διορθώθηκαν μη υποστηριζόμενες σημαίες CLI, όρια αυθεντικοποίησης, καθοδήγηση περιβάλλοντος/μυστικών σε απλό κείμενο, ενημερώσεις υποδομής, διαμόρφωση μοντέλου και παραδείγματα καταστροφικής ανάκτησης.
- Ανανέωση του εργαστηρίου με δείγμα τρέχοντος AI Agents, συμπεριλαμβανομένων πραγματικών hooks, εισόδων διαμόρφωσης, δοκιμών αξιολόγησης, σημείων εισόδου red-teaming και παρατηρητικότητας.
- Διορθώθηκαν ισχυρισμοί υλοποίησης παραδειγμάτων και επισκευάστηκαν συναφή ζητήματα εφαρμογής/υποδομής/διαμόρφωσης. Το υλικό αρχιτεκτονικής λιανικής διακρίνεται ρητά από μια πλήρη λειτουργική εφαρμογή.
- Αποκαταστάθηκε ο πίνακας γλωσσών CodeQL, επιλέχθηκε υποστηριζόμενος Node.js 24 για το dev container, και έγιναν οι έλεγχοι εγκατάστασης να αναφέρουν αποτυχημένες εντολές έκδοσης.

#### Προσθήκες
- Μόνο για Αγγλικά με offline έλεγχο συνδέσμων/αγκυρών, δοκιμές παλινδρόμησης και ροή τεκμηρίωσης που επίσης κατασκευάζει το εργαστήριο σε αυστηρή λειτουργία. Εξαιρούνται μεταφράσεις που δημιουργήθηκαν και μεταφρασμένες εικόνες.

#### Πεδίο Επικύρωσης
- Έλεγχοι πηγής, σύνταξης, διαμόρφωσης, τοπικής συμπεριφοράς και συνδέσμων δικτύου δεν αποδεικνύουν ζωντανή δυνατότητα ανάπτυξης στο Azure, όριο πόρων, RBAC, διαθεσιμότητα μοντέλου στην περιοχή, χρέωση, ασφάλεια ή ετοιμότητα παραγωγής.
- Παλαιότερες καταχωρήσεις παρακάτω είναι ιστορικά αρχεία, όχι τρέχουσες εντολές ή οδηγίες έκδοσης.

### [v3.23.0] - 2026-07-13

#### Ανανέωση AZD 1.27.1: Ενημέρωση Ισχύουσας Έκδοσης
**Αυτή η έκδοση επανεπιβεβαιώνει το μάθημα απέναντι στα `azd` `1.27.1` (Ιούλιος 2026, τελευταία σταθερή έκδοση) και την τρέχουσα προεπισκοπούμενη επέκταση AI agent `azure.ai.agents` `1.0.0-beta.5`, φέρνοντας κάθε πανό "επικυρωμένο απέναντι σε" σε ενημερωμένη κατάσταση μετά τις εκδόσεις 1.26.0, 1.27.0, και 1.27.1.**

#### Αλλαγές
- **✅ Η βασική γραμμή επικύρωσης ενημερώθηκε** από `azd 1.25.6` (Ιούνιος 2026) σε `azd 1.27.1` (Ιούλιος 2026) σε όλο το αρχικό README, όλα τα README κεφαλαίων, το μάθημα dev-container του Κεφαλαίου 1 (συμπεριλαμβανομένων παραδειγμάτων με σταθερή έκδοση), το μάθημα προσαρμοσμένων προτύπων του Κεφαλαίου 4, το μάθημα πολλαπλών agents του Κεφαλαίου 5, και την τεκμηρίωση εργαστηρίου
- **🤖 Ανανέωση βασικής γραμμής Κεφαλαίου 2** από `azd 1.23.12` (Μάρτιος 2026) σε `azd 1.27.1` σε `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, και `microsoft-foundry-integration.md`; ημερομηνίες σημειώσεων επικύρωσης ενημερώθηκαν σε 2026-07-13
- **🧩 Η επέκταση AI agent αυξήθηκε** από `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` στην τρέχουσα έκδοση `1.0.0-beta.5` στο README του Κεφαλαίου 2 και `agents.md`
- **🧪 Ενημέρωση παραδείγματος επικύρωσης εργαστηρίου** (`azd version` έξοδος) σε `1.27.1`

#### Σημειώσεις για σχετικές εκδόσεις azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Υποστήριξη Go για Azure Functions στο Flex Consumption, φίλτρα συνδρομητών ανά μισθωτή `azd config sub-filter`, αυτοτελείς δέσμες επεκτάσεων (`azd x pack --bundle`), και `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Μοντελοποίηση έργων/agents Azure AI Foundry απευθείας σε `azure.yaml` (έναρξη χωρίς Bicep/Terraform), υποστήριξη ανάπτυξης container για App Service (`host: appservice` + `language: docker`), απευθείας `-s/--source` για εντολές `azd extension`, και `azd tool uninstall`
- **1.27.1 (2026-07-09):** Σημαία `--no-dependencies` για `azd extension install`, τα παραπεταμένα μοντέλα εξαιρούνται από τα αιτήματα καταλόγου/ορίου από προεπιλογή, και αρκετές διορθώσεις σφαλμάτων

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

#### Συμπλήρωση Κενών για Αρχάριους #2: Δημιουργία Υποδείγματος, Dev Containers, Pulumi, Azure DevOps, Υπηρεσιακοί Λογαριασμοί, και άλλα
**Αυτή η έκδοση κλείνει τα εναπομείναντα ενδιάμεσα κενά που αποκαλύφθηκαν από την ανάλυση azd-coverage: πώς να δημιουργήσετε και να δημοσιεύσετε το δικό σας υπόδειγμα, αναπαραγώγιμα περιβάλλοντα dev-container/Codespaces, ο πάροχος υποδομής Pulumi, περιήγηση Azure DevOps CI/CD, αυθεντικοποίηση υπηρεσιακών λογαριασμών, καθοδήγηση επιλογής host (AKS/Spring Apps), εξηγήσεις `azd restore`/`azd package`, διαχείριση σφαλμάτων hooks, και πρακτικές ομαδικών/κοινών περιβαλλόντων.**

#### Προσθήκες
- **🧱 Νέο μάθημα Κεφαλαίου 4** `docs/chapter-04-infrastructure/custom-templates.md` — συγγραφή του δικού σας υποδείγματος azd: απαιτούμενη δομή (`azure.yaml`, `infra/`, `src/`), το πεδίο `metadata.template`, παραμετροποίηση υποδομής με το τοκεν πόρου `uniqueString()` και ετικέτα `azd-env-name`, τοπική δοκιμή με `azd init --template <local-path>`, δημοσίευση στο GitHub, και υποβολή στην συλλογή Awesome AZD
- **📦 Νέο μάθημα Κεφαλαίου 1** `docs/chapter-01-foundation/dev-containers.md` — αναπαραγώγιμα περιβάλλοντα azd με Dev Containers και GitHub Codespaces: ένα ελάχιστο `.devcontainer/devcontainer.json` με χρήση της επίσημης δυνατότητας `ghcr.io/azure/azure-dev/azd`, δομές ειδικές γλώσσας, `docker-in-docker` για container hosts, και `azd auth login --use-device-code` για απομακρυσμένη σύνδεση
- **🧩 Τμήμα Pulumi με azd** σε `docs/chapter-04-infrastructure/provisioning.md` — διαμόρφωση `infra.provider: pulumi`, διάταξη φακέλου Pulumi, στοίβες χαρτογραφημένες σε περιβάλλοντα azd, απαιτούμενες εξόδους και σήμανση, και η ίδια ροή εργασίας `azd up` / `azd down`
- **🎯 Καθοδήγηση επιλογής host** σε `docs/chapter-04-infrastructure/provisioning.md` — φιλική σύγκριση για αρχάριους μεταξύ `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, και `springapp`, με οδηγιες για το πότε να επιλέξετε AKS ή Azure Spring Apps
- **🛠️ Περιήγηση Azure DevOps CI/CD** σε `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, σύνδεση υπηρεσίας με ομοσπονδία ταυτότητας εργασίας (OIDC), το παραγόμενο `azure-dev.yml`, και ρύθμιση μεταβλητών ομάδας
- **🔑 Υπηρεσιακοί Λογαριασμοί (Υπόδειγμα 4)** προστέθηκε σε `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, μη διαδραστική `azd auth login` με κλειδί πελάτη έναντι διαπιστευτηρίων ομοσπονδίας/OIDC, πότε να χρησιμοποιείται, και ασφαλής αποθήκευση διαπιστευτηρίων
- **🪝 Διαχείριση σφαλμάτων hook** υποενότητα σε `docs/chapter-04-infrastructure/deployment-guide.md` — κωδικοί εξόδου και `set -e`, `continueOnError`, δοκιμές hooks σε απομόνωση με `azd hooks run`, κελύφη ειδικά λειτουργικού συστήματος, και `--debug`
- **👥 Ομαδικά / κοινά περιβάλλοντα** τμήμα σε `docs/chapter-03-configuration/configuration.md` — τι φιλοξενείται σε `.azure/`, τι να αγνοείτε στο git, περιβάλλοντα ανά προγραμματιστή, `azd env list`/`select`, και παροχή τιμών περιβάλλοντος σε CI/CD
- **🧰 Επεξηγήσεις `azd restore` και επεκταμένες `azd package`** σε `resources/cheat-sheet.md` — αποκατάσταση εξαρτήσεων και κατασκευή αναπτύξιμου αντικειμένου χωρίς ανάπτυξη

#### Αλλαγές
- **🧭 Πίνακας μαθημάτων Κεφαλαίου 4** ενημερώθηκε για να συμπεριλάβει το νέο μάθημα "Συγγραφή του δικού σου υποδείγματος" (Μάθημα 3)
- **🧭 Πίνακας μαθημάτων Κεφαλαίου 1** ενημερώθηκε για να συμπεριλάβει το νέο μάθημα "Dev Containers & Codespaces" (Μάθημα 5); πλοήγηση υποσέλιδων διασυνδέθηκε μεταξύ `bring-your-own-app.md` και `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Συμπλήρωση Κενών για Αρχάριους: Πρακτικό μάθημα πολλαπλών agents, "Bring Your Own App", Terraform, και περιήγηση CI/CD
**Αυτή η έκδοση κλείνει τα μεγαλύτερα κενά για πλήρες οδηγό αρχαρίων, προσθέτοντας δύο νέα πρακτικά μαθήματα (μια πλήρως αναπτυσσόμενη περιήγηση με δύο agents και προσθήκη azd σε υπάρχουσα εφαρμογή), μια φιλική εισαγωγή στα hooks, ένα τμήμα Terraform με azd, μια αναλυτική περιήγηση GitHub Actions βήμα-βήμα, εξήγηση για τις νέες επεκτάσεις προεπισκόπησης, και μια ρητή λίστα ελέγχου επαλήθευσης ανάπτυξης.**

#### Προσθήκες
- **🤝 Νέο μάθημα Κεφαλαίου 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — μια πλήρως πρακτική, αναπτύξιμη περιήγηση δύο agents (ορχηστρωτής + ειδικοί) με χρήση πραγματικού υποδείγματος (`contoso-creative-writer`), που καλύπτει πότε να χρησιμοποιήσετε πολλούς agents, τη ροή εργασίας `azd up`, κατανόηση των αναπτυγμένων πόρων, διασταυρούμενη παρακολούθηση agents, προσαρμογή, και καθαρισμό
- **📦 Νέο μάθημα Κεφαλαίου 1** `docs/chapter-01-foundation/bring-your-own-app.md` — πώς να προσθέσετε azd σε υπάρχον έργο με `azd init` ("χρήση κώδικα στον τρέχοντα φάκελο"), κατανόηση `azure.yaml` και `infra/`, `azd infra generate`, ανίχνευση host, και ανάπτυξη με `azd up`
- **🌐 Τμήμα Terraform με azd** προστέθηκε σε `docs/chapter-04-infrastructure/provisioning.md` — διαμόρφωση `infra.provider: terraform`, διάταξη φακέλου `.tf`, απαιτούμενες έξοδοι `AZURE_*` και σήμανση `azd-env-name`, και η ίδια ροή εργασίας `azd up` / `azd down` (κλείνει το κενό όπου η υποστήριξη Terraform ισχυριζόταν αλλά είχε δείγμα μόνο Bicep)
- **⚙️ Βήμα-βήμα περιήγηση GitHub Actions** σε `docs/chapter-08-production/production-ai-practices.md` — από το αποθετήριο GitHub σε αυτοματοποιημένες αναπτύξεις: `azd pipeline config`, πιστοποιήσεις ομοσπονδίας OIDC (χωρίς αποθηκευμένα μυστικά), το παραγόμενο `azure-dev.yml`, και καθοδήγηση μυστικών έναντι μεταβλητών
- **🪝 Εισαγωγή αρχαρίων στα "Νέα στα hooks;"** σε `docs/chapter-04-infrastructure/deployment-guide.md` — τι είναι ένα hook, πίνακας σταδίων hook, ένας ελάχιστος πρώτος hook, και εκτέλεση hooks χειροκίνητα με `azd hooks run`
- **✅ Προσθήκη λίστας ελέγχου "Επαλήθευση της Ανάπτυξής σας"** στο Βήμα 5 του `docs/chapter-01-foundation/first-project.md` — δοκιμή καπνού, έλεγχος τελικού σημείου υγείας, και ρητά κριτήρια επιτυχίας
- **🧩 Εξηγήσεις νέων επεκτάσεων προεπισκόπησης** `azure.ai.skills` και `azure.ai.connections` (τι είναι και πότε να τις χρησιμοποιείτε) σε `docs/chapter-08-production/production-ai-practices.md`

#### Αλλαγές
- **🧭 Πίνακας μαθημάτων Κεφαλαίου 5** διορθώθηκε: `multi-agent-basics.md` είναι τώρα το Μάθημα 1 (το μόνο πλήρως πρακτικό μάθημα), με ειλικρινή σήμανση ότι το Μάθημα 2 βρίσκεται στο Κεφάλαιο 6 και το σενάριο Λιανικής είναι ένα σχέδιο αρχιτεκτονικής, όχι ένα υπόδειγμα μίας εντολής
- **🧭 Πίνακας μαθημάτων Κεφαλαίου 1** πλέον περιλαμβάνει το νέο μάθημα "Bring Your Own App" (Μάθημα 4)
- **🔗 Πλοήγηση υποσέλιδων** ενημερώθηκε: `first-project.md` τώρα συνδέεται προς τα εμπρός με `bring-your-own-app.md`

#### Διορθώσεις
- **🧱 Κλήθηκε το κενό Terraform "ισχυρίστηκε αλλά έλειπε"** — το μάθημα προηγουμένως ανέφερε υποστήριξη Terraform χωρίς να το δείχνει
- **🔀 Διορθώθηκαν παραπλανητικοί διασυνδέσεις Κεφαλαίου 5** που υποδήλωναν ότι υπήρχε πλήρης υλοποίηση πολλαπλών agents, ενώ υπήρχε μόνο σχέδιο αρχιτεκτονικής

#### Ενημερωμένα Αρχεία
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

#### Ενημέρωση AZD 1.25.6, Πλήρης Κύκλος Ζωής Πράκτορα & Επανετικέτα Aspire
**Αυτή η έκδοση επαναεπιβεβαιώνει το μάθημα έναντι των `azd` `1.25.6` (Ιούνιος 2026) και την επέκταση `azure.ai.agents` `0.1.40-preview`, διευρύνει την καθοδήγηση AI από "κατασκευή πράκτορα" σε ολόκληρο τον κύκλο ζωής του πράκτορα (δοκιμή → αξιολόγηση → βελτιστοποίηση → επιθεώρηση → διαγραφή), εμφανίζει τις νέες προεπισκοπήσεις επεκτάσεων `azure.ai.skills` και `azure.ai.connections`, και σημειώνει την επανετικέτα προϊόντος ".NET Aspire" → "Aspire".**

#### Προστέθηκε
- **🔁 Πλήρης κάλυψη κύκλου ζωής πράκτορα** για αρχάριους και μηχανικούς AI σε όλη τη τεκμηρίωση:
  - `docs/chapter-01-foundation/azd-basics.md` — Πίνακας κύκλου ζωής (κατασκευή → δοκιμή → μέτρηση → βελτίωση → επιθεώρηση → καθαρισμός) προστέθηκε στο τμήμα Επεκτάσεων και Εντολών AI
  - `docs/chapter-08-production/production-ai-practices.md` — Νέο τμήμα "Διαχείριση Κύκλου Ζωής Πράκτορα" που καλύπτει `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, και `delete --force`
  - `resources/cheat-sheet.md` — Διευρυμένες Εντολές Πράκτορα AI με `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, και `delete --force`
- **🧩 Νέες επεκτάσεις προεπισκόπησης** τεκμηριωμένες: `azure.ai.skills` (επανχρησιμοποιήσιμες δεξιότητες πράκτορα) και `azure.ai.connections` (συνδέσεις Foundry) προστέθηκαν στον πίνακα επεκτάσεων και στην cheat sheet
- **⏱️ Καθοδήγηση χρόνου απόκρισης** — παραδείγματα `azd ai agent invoke` σημειώνουν τώρα ότι εκτυπώνει συνολική καθυστέρηση και χρόνο ως το πρώτο byte
- **📌 Μπάνερ έκδοσης** στο κύριο README που καθοδηγεί τους μαθητές στα `azd version` και `azd upgrade`

#### Αλλάχτηκε
- **✅ Ενημέρωση βασικής γραμμής επικύρωσης** από `azd 1.23.12` (Μάρτιος 2026) σε `azd 1.25.6` (Ιούνιος 2026) σε όλα τα README των κεφαλαίων και τα έγγραφα εργαστηρίου
- **🤖 Ενημέρωση σημείωσης επέκτασης κεφαλαίου 2** από `azure.ai.agents` `0.1.18-preview` σε `0.1.40-preview`
- **🧪 Ενημέρωση παραδείγματος επικύρωσης εργαστηρίου** (έξοδος `azd version`) σε `1.25.6`
- **🧭 Ανανέωση README "Τι Νέο στο azd σήμερα"** για να αναδειχθεί ο πλήρης κύκλος ζωής πράκτορα, νέες επεκτάσεις AI, και πρόσφατες διορθώσεις ποιότητας ζωής (`azd init` αδρανοποίηση, `azd auth login` εκκαθάριση παρωχημένων token, `azd tool` first-run prompt)
- **📖 Το agents.md του κεφαλαίου 2 (Επιλογή 4)** τώρα καθοδηγεί τους μαθητές στις εντολές κύκλου ζωής μετά την ανάπτυξη αντί να σταματά στο `azd up`

#### Διορθώθηκε
- **🏷️ Ονομασία προϊόντος** — προστέθηκε σημείωση επανετικέτας Aspire (".NET Aspire" πλέον απλώς "Aspire"); η υποστήριξη Aspire του azd παραμένει αμετάβλητη
- **🔎 Ζωντανή επικύρωση έκδοσης** επιβεβαιωμένη έναντι ροής κυκλοφορίας Azure Developer CLI: σταθερό CLI `1.25.6` (2026-06-12) και `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Ενημερωμένα αρχεία
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

#### Διευκρίνιση Ενσωμάτωσης Αρχαρίων, Επικύρωση Ρυθμίσεων & Τελικός Καθαρισμός Εντολών AZD
**Αυτή η έκδοση ακολουθεί την επικύρωση AZD 1.23 με μια προσέγγιση εστιασμένη στους αρχάριους: διευκρινίζει την καθοδήγηση αυθεντικοποίησης AZD πρώτου βήματος, προσθέτει τοπικά σενάρια επικύρωσης ρυθμίσεων, επαληθεύει βασικές εντολές έναντι του ζωντανού AZD CLI, και αφαιρεί τις τελευταίες απαρχαιωμένες αναφορές αγγλικών εντολών εκτός του changelog.**

#### Προστέθηκε
- **🧪 Σενάρια επικύρωσης ρυθμίσεων αρχαρίων** με `validate-setup.ps1` και `validate-setup.sh` ώστε οι μαθητές να επιβεβαιώνουν τα απαιτούμενα εργαλεία πριν ξεκινήσουν το Κεφάλαιο 1
- **✅ Βήματα επικύρωσης ρυθμίσεων σε πρώτο επίπεδο** στο κύριο README και στο README του Κεφαλαίου 1 ώστε τα ελλείποντα προαπαιτούμενα να εντοπίζονται πριν το `azd up`

#### Αλλάχτηκε
- **🔐 Καθοδήγηση αυθεντικοποίησης αρχαρίων** πλέον αντιμετωπίζει το `azd auth login` ως κύρια διαδρομή για ροές εργασίας AZD, με το `az login` να αναφέρεται ως προαιρετικό εκτός αν χρησιμοποιούνται εντολές Azure CLI απευθείας
- **📚 Ροή ενσωμάτωσης Κεφαλαίου 1** τώρα οδηγεί τους μαθητές να επικυρώσουν την τοπική ρύθμιση πριν από τα βήματα εγκατάστασης, αυθεντικοποίησης και πρώτης ανάπτυξης
- **🛠️ Μηνύματα επικυρωτή** τώρα διαχωρίζουν σαφώς τις απαιτήσεις που μπλοκάρουν από τις προαιρετικές προειδοποιήσεις Azure CLI για τη διαδρομή αρχαρίων μόνο με AZD
- **📖 Ρυθμίσεις, αντιμετώπιση προβλημάτων και παραδείγματα τεκμηρίωσης** πλέον διαχωρίζουν την απαιτούμενη αυθεντικοποίηση AZD από την προαιρετική σύνδεση Azure CLI όπου προηγουμένως παρουσιάζονταν χωρίς πλαίσιο

#### Διορθώθηκε
- **📋 Απομείνασες αγγλικές αναφορές εντολών** ενημερώθηκαν στην τρέχουσα μορφή AZD, περιλαμβανομένου του `azd config show` στην cheat sheet και `azd monitor --overview` όπου υπήρχε προτροπή για επισκόπηση στο Azure Portal
- **🧭 Ισχυρισμοί αρχαρίων στο Κεφάλαιο 1** μαλακώθηκαν για να αποφευχθεί η υπερβολική υπόσχεση εγγυημένης μηδενικής αποτυχίας ή συμπεριφοράς επαναφοράς σε όλα τα πρότυπα και τους πόρους Azure
- **🔎 Ζωντανή επικύρωση CLI** επιβεβαίωσε την τρέχουσα υποστήριξη για `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, και `azd down --force --purge`

#### Ενημερωμένα αρχεία
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

#### Επικύρωση AZD 1.23.12, Επέκταση Περιβάλλοντος Εργαστηρίου & Ανανέωση Μοντέλου AI
**Αυτή η έκδοση πραγματοποιεί σάρωση επικύρωσης τεκμηρίωσης έναντι των `azd` `1.23.12`, ενημερώνει απαρχαιωμένα παραδείγματα εντολών AZD, ανανεώνει την καθοδήγηση μοντέλου AI στα τρέχοντα προεπιλεγμένα, και διευρύνει τις οδηγίες εργαστηρίου πέρα από το GitHub Codespaces για να υποστηρίζει επίσης κοντέινερ ανάπτυξης και τοπικά αντίγραφα.**

#### Προστέθηκε
- **✅ Σημειώσεις επικύρωσης σε βασικά κεφάλαια και έγγραφα εργαστηρίου** για να γίνει ρητή η δοκιμασμένη βάση AZD προς τους μαθητές που χρησιμοποιούν νεότερες ή παλαιότερες εκδόσεις CLI
- **⏱️ Καθοδήγηση χρονικού ορίου ανάπτυξης** για μακροχρόνιες αναπτύξεις εφαρμογών AI με χρήση `azd deploy --timeout 1800`
- **🔎 Βήματα επιθεώρησης επέκτασης** με `azd extension show azure.ai.agents` στην τεκμηρίωση ροών εργασίας AI
- **🌐 Διευρυμένη καθοδήγηση περιβάλλοντος εργαστηρίου** που καλύπτει GitHub Codespaces, κοντέινερ ανάπτυξης, και τοπικά αντίγραφα με MkDocs

#### Αλλάχτηκε
- **📚 README Εισαγωγής κεφαλαίων** πλέον σημειώνει σταθερά επικύρωση έναντι `azd 1.23.12` σε θεμελιώδη, ρυθμίσεις, υποδομή, πολλούς πράκτορες, προ-ανάπτυξη, αντιμετώπιση προβλημάτων, και παραγωγικές ενότητες
- **🛠️ Αναφορές εντολών AZD** ενημερώθηκαν στην τρέχουσα μορφή σε όλη τη τεκμηρίωση:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ή `azd env get-value(s)` ανάλογα με το πλαίσιο
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` όπου προορίζεται επισκόπηση Application Insights
- **🧪 Απλοποιημένα παραδείγματα preview παροχής** σε τρέχουσα υποστηριζόμενη χρήση όπως `azd provision --preview` και `azd provision --preview -e production`
- **🧭 Ροή εργαστηρίου** ενημερώθηκε ώστε οι μαθητές να μπορούν να ολοκληρώσουν τα εργαστήρια σε Codespaces, κοντέινερ ανάπτυξης ή τοπικό αντίγραφο αντί να θεωρείται μόνο εκτέλεση σε Codespaces
- **🔐 Καθοδήγηση αυθεντικοποίησης** τώρα προτιμά `azd auth login` για ροές εργασίας AZD, με `az login` ως προαιρετικό όταν χρησιμοποιούνται απευθείας εντολές Azure CLI

#### Διορθώθηκε
- **🪟 Εντολές εγκατάστασης Windows** ομαλοποιήθηκαν στην τρέχουσα μορφή συσκευασίας `winget` στον οδηγό εγκατάστασης
- **🐧 Καθοδήγηση εγκατάστασης Linux** διορθώθηκε για αποφυγή μη υποστηριζόμενων οδηγιών διαχείρισης πακέτων ειδικών διανομής `azd` και αντίθετη παραπομπή σε αρχεία κυκλοφορίας όπου απαιτείται
- **📦 Παραδείγματα μοντέλου AI** ανανεώθηκαν από παλιές προεπιλογές όπως `gpt-35-turbo` και `text-embedding-ada-002` σε τρέχοντα παραδείγματα όπως `gpt-4.1-mini`, `gpt-4.1`, και `text-embedding-3-large`
- **📋 Αποσπάσματα ανάπτυξης και διάγνωσης** διορθώθηκαν για χρήση τρεχόντων εντολών περιβάλλοντος και κατάστασης σε αρχεία καταγραφής, σεναρίων, και βήματα αντιμετώπισης προβλημάτων
- **⚙️ Καθοδήγηση GitHub Actions** ενημερώθηκε από `Azure/setup-azd@v1.0.0` σε `Azure/setup-azd@v2`
- **🤖 Καθοδήγηση συναίνεσης MCP/Copilot** ενημερώθηκε από `azd mcp consent` σε `azd copilot consent list`

#### Βελτιώθηκε
- **🧠 Καθοδήγηση κεφαλαίου AI** τώρα εξηγεί καλύτερα την ευαίσθητη στη προεπισκόπηση συμπεριφορά `azd ai`, την είσοδο ανά ενοικιαστή, τη τρέχουσα χρήση επεκτάσεων, και τις ενημερωμένες συστάσεις ανάπτυξης μοντέλων
- **🧪 Οδηγίες εργαστηρίου** τώρα χρησιμοποιούν πιο ρεαλιστικά παραδείγματα έκδοσης και πιο καθαρή γλώσσα ρύθμισης περιβάλλοντος για εργαστήρια με πρακτική άσκηση
- **📈 Έγγραφα παραγωγής και αντιμετώπισης προβλημάτων** τώρα ευθυγραμμίζονται καλύτερα με τρέχοντα παραδείγματα παρακολούθησης, εναλλακτικού μοντέλου, και κόστος-επίπεδο

#### Ενημερωμένα αρχεία
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

#### Εντολές AZD AI CLI, Επικύρωση Περιεχομένου & Επέκταση Προτύπων
**Αυτή η έκδοση προσθέτει κάλυψη εντολών `azd ai`, `azd extension`, και `azd mcp` σε όλα τα κεφάλαια σχετικά με AI, διορθώνει χαμένα links και απαρχαιωμένο κώδικα στο agents.md, ενημερώνει την cheat sheet, και αναθεωρεί το τμήμα Προτύπων Παραδειγμάτων με επικυρωμένες περιγραφές και νέα πρότυπα Azure AI AZD.**

#### Προστέθηκε
- **🤖 Κάλυψη εντολών AZD AI CLI** σε 7 αρχεία (προηγουμένως μόνο στο Κεφάλαιο 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Νέο τμήμα "Επεκτάσεις και Εντολές AI" που εισάγει `azd extension`, `azd ai agent init`, και `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Επιλογή 4: `azd ai agent init` με πίνακα σύγκρισης (πρότυπο έναντι προσεγγίσεως manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Υποενότητες "Επεκτάσεις AZD για Foundry" και "Ανάπτυξη Πράκτορα πρώτα"
  - `docs/chapter-05-multi-agent/README.md` — Γρήγορη Εκκίνηση δείχνει τώρα διαδρομές ανάπτυξης τόσο βασισμένες σε πρότυπο όσο και σε manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Τμήμα Ανάπτυξης περιλαμβάνει τώρα επιλογή `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Υποενότητα "Εντολές Επέκτασης AI AZD για Διαγνωστικά"
  - `resources/cheat-sheet.md` — Νέο τμήμα "Εντολές AI & Επεκτάσεων" με `azd extension`, `azd ai agent init`, `azd mcp`, και `azd infra generate`
- **📦 Νέα πρότυπα παραδειγμάτων AZD AI** σε `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Συνομιλία RAG .NET με Blazor WebAssembly, Semantic Kernel, και υποστήριξη φωνητικής συνομιλίας
  - **azure-search-openai-demo-java** — Συνομιλία RAG Java με χρήση Langchain4J με επιλογές ανάπτυξης ACA/AKS
  - **contoso-creative-writer** — Εφαρμογή δημιουργικής γραφής πολλαπλών πρακτόρων με χρήση Azure AI Agent Service, Bing Grounding, και Prompty
  - **serverless-chat-langchainjs** — Serverless RAG με χρήση Azure Functions + LangChain.js + Cosmos DB με τοπική υποστήριξη ανάπτυξης Ollama
  - **chat-with-your-data-solution-accelerator** — Επιταχυντής Enterprise RAG με πύλη διαχείρισης, ενσωμάτωση Teams και επιλογές PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Εφαρμογή αναφοράς ορχήστρωσης Multi-agent MCP με διακομιστές σε .NET, Python, Java, και TypeScript
  - **azd-ai-starter** — Ελάχιστο πρότυπο εκκίνησης υποδομής Azure AI Bicep
  - **🔗 Awesome AZD AI Gallery link** — Αναφορά στην [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ πρότυπα)

#### Διορθώσεις
- **🔗 agents.md πλοήγηση**: Οι σύνδεσμοι Πίσω/Επόμενο τώρα αντιστοιχούν στη σειρά μαθημάτων του Κεφαλαίου 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md σπασμένοι σύνδεσμοι**: `production-ai-practices.md` διορθώθηκε σε `../chapter-08-production/production-ai-practices.md` (3 εμφανίσεις)
- **📦 agents.md απαρχαιωμένος κώδικας**: Αντικαταστάθηκε `opencensus` με `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md μη έγκυρο API**: Μεταφέρθηκε `max_tokens` από `create_agent()` σε `create_run()` ως `max_completion_tokens`
- **🔢 agents.md καταμέτρηση tokens**: Αντικαταστάθηκε η αδρή εκτίμηση `len//4` με `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Διορθώθηκαν οι υπηρεσίες από "Cognitive Search + App Service" σε "Azure AI Search + Azure Container Apps" (προεπιλεγμένος κεντρικός αλλάζει Οκτώβριος 2024)
- **contoso-chat**: Ενημερώθηκε η περιγραφή ώστε να αναφέρεται σε Azure AI Foundry + Prompty, ταιριάζοντας με τον πραγματικό τίτλο και τεχνολογικό στοίβαγμα του αποθετηρίου

#### Αφαιρέθηκαν
- **ai-document-processing**: Αφαιρέθηκε μη λειτουργική αναφορά προτύπου (το αποθετήριο δεν είναι δημόσια προσβάσιμο ως πρότυπο AZD)

#### Βελτιώσεις
- **📝 ασκήσεις agents.md**: Η Άσκηση 1 δείχνει τώρα την αναμενόμενη έξοδο και το βήμα `azd monitor`; Η Άσκηση 2 περιλαμβάνει πλήρη κώδικα εγγραφής `FunctionTool`; Η Άσκηση 3 αντικαθιστά ασαφείς οδηγίες με συγκεκριμένες εντολές `prepdocs.py`
- **📚 πόροι agents.md**: Ενημερώθηκαν οι σύνδεσμοι τεκμηρίωσης με τις τρέχουσες σελίδες τεκμηρίωσης Azure AI Agent Service και τον οδηγό γρήγορης εκκίνησης
- **📋 πίνακας Επόμενα Βήματα agents.md**: Προστέθηκε σύνδεσμος για εργαστήριο AI Workshop για πλήρη κάλυψη κεφαλαίου

#### Ενημερωμένα αρχεία
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
**Αυτή η έκδοση βελτιώνει την πλοήγηση στο README.md του κεφαλαίου με ένα βελτιωμένο μορφότυπο πίνακα.**

#### Αλλαγές
- **Πίνακας Χάρτη Μαθήματος**: Ενισχυμένος με άμεσους συνδέσμους μαθημάτων, εκτιμήσεις διάρκειας και βαθμολογίες πολυπλοκότητας
- **Καθαρισμός Φακέλων**: Αφαιρέθηκαν πλεονασματικοί παλιοί φάκελοι (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Επαλήθευση Συνδέσμων**: Επικυρώθηκαν όλοι οι 21+ εσωτερικοί σύνδεσμοι στον πίνακα Χάρτη Μαθήματος

### [v3.16.0] - 2026-02-05

#### Ενημερώσεις Ονομάτων Προϊόντων
**Αυτή η έκδοση ενημερώνει τις αναφορές προϊόντων στο τρέχον branding της Microsoft.**

#### Αλλαγές
- **Microsoft Foundry → Microsoft Foundry**: Όλες οι αναφορές ενημερώθηκαν σε αρχεία μη μετάφρασης
- **Azure AI Agent Service → Foundry Agents**: Ενημέρωση ονόματος υπηρεσίας για να αντανακλά το τρέχον branding

#### Ενημερωμένα αρχεία
- `README.md` - Κύρια σελίδα μαθήματος
- `changelog.md` - Ιστορικό εκδόσεων
- `course-outline.md` - Δομή μαθήματος
- `docs/chapter-02-ai-development/agents.md` - Οδηγός AI agents
- `examples/README.md` - Τεκμηρίωση παραδειγμάτων
- `workshop/README.md` - Σελίδα εργαστηρίου
- `workshop/docs/index.md` - Ευρετήριο εργαστηρίου
- `workshop/docs/instructions/*.md` - Όλα τα αρχεία οδηγιών εργαστηρίου

---

### [v3.15.0] - 2026-02-05

#### Μεγάλη Αναδιάρθρωση Αποθετηρίου: Φάκελοι με Ονόματα Κεφαλαίων
**Αυτή η έκδοση αναδιαρθρώνει την τεκμηρίωση σε αφιερωμένους φακέλους για κάθε κεφάλαιο για πιο ξεκάθαρη πλοήγηση.**

#### Μετονομασίες Φακέλων
Οι παλιοί φάκελοι έχουν αντικατασταθεί με φακέλους αριθμημένους κατά κεφάλαιο:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Προστέθηκε νέος: `docs/chapter-05-multi-agent/`

#### Μετακινήσεις Αρχείων
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

#### Προσθήκες
- **📚 Αρχεία README κεφαλαίων**: Δημιουργήθηκε README.md σε κάθε φάκελο κεφαλαίου με:
  - Μαθησιακούς στόχους και διάρκεια
  - Πίνακα μαθημάτων με περιγραφές
  - Εντολές γρήγορης εκκίνησης
  - Πλοήγηση σε άλλα κεφάλαια

#### Αλλαγές
- **🔗 Ενημέρωση όλων των εσωτερικών συνδέσμων**: 78+ διαδρομές ενημερωμένες σε όλα τα αρχεία τεκμηρίωσης
- **🗺️ Κύριο README.md**: Ενημερώθηκε ο Χάρτης Μαθήματος με τη νέα δομή κεφαλαίου
- **📝 examples/README.md**: Ενημερώθηκαν οι διασταυρούμενες αναφορές στους φακέλους κεφαλαίων

#### Αφαιρέθηκαν
- Παλαιά δομή φακέλων (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Αναδιάρθρωση Αποθετηρίου: Πλοήγηση Κεφαλαίου
**Αυτή η έκδοση πρόσθεσε αρχεία πλοήγησης README κεφαλαίων (αντικαταστάθηκαν από v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Νέος Οδηγός AI Agents
**Αυτή η έκδοση προσθέτει έναν πλήρη οδηγό για ανάπτυξη AI agents με Azure Developer CLI.**

#### Προστέθηκε
- **🤖 docs/microsoft-foundry/agents.md**: Πλήρης οδηγός που καλύπτει:
  - Τι είναι οι AI agents και πώς διαφέρουν από τα chatbots
  - Τρία πρότυπα γρήγορης εκκίνησης agent (Foundry Agents, Prompty, RAG)
  - Πρότυπα αρχιτεκτονικής agent (μοναδικός agent, RAG, multi-agent)
  - Διαμόρφωση και προσαρμογή εργαλείων
  - Παρακολούθηση και μέτρηση μετρικών
  - Εκτιμήσεις κόστους και βελτιστοποίηση
  - Συνηθισμένα σενάρια αντιμετώπισης προβλημάτων
  - Τρεις πρακτικές ασκήσεις με κριτήρια επιτυχίας

#### Δομή Περιεχομένου
- **Εισαγωγή**: Έννοιες agent για αρχάριους
- **Γρήγορη Εκκίνηση**: Ανάπτυξη agents με `azd init --template get-started-with-ai-agents`
- **Πρότυπα Αρχιτεκτονικής**: Οπτικά διαγράμματα προτύπων agent
- **Διαμόρφωση**: Ρυθμίσεις εργαλείων και μεταβλητές περιβάλλοντος
- **Παρακολούθηση**: Ενσωμάτωση Application Insights
- **Ασκήσεις**: Προοδευτική πρακτική μάθηση (20-45 λεπτά η κάθε μία)

---

### [v3.12.0] - 2026-02-05

#### Ενημέρωση Περιβάλλοντος DevContainer
**Αυτή η έκδοση ενημερώνει τη διαμόρφωση κοντέινερ ανάπτυξης με σύγχρονα εργαλεία και καλύτερες προεπιλογές για την εμπειρία μάθησης AZD.**

#### Αλλαγές
- **🐳 Βασική Εικόνα**: Ενημερώθηκε από `python:3.12-bullseye` σε `python:3.12-bookworm` (τελευταία σταθερή έκδοση Debian)
- **📛 Όνομα Κοντέινερ**: Μετονομάστηκε από "Python 3" σε "AZD για Αρχάριους" για σαφήνεια

#### Προστέθηκαν
- **🔧 Νέες λειτουργίες Dev Container**:
  - `azure-cli` με ενεργοποιημένη υποστήριξη Bicep
  - `node:20` (έκδοση LTS για πρότυπα AZD)
  - `github-cli` για διαχείριση προτύπων
  - `docker-in-docker` για αναπτύξεις container app

- **🔌 Προώθηση Θυρών**: Προρυθμισμένες θύρες για συνηθισμένη ανάπτυξη:
  - 8000 (προεπισκόπηση MkDocs)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Νέες Επεκτάσεις VS Code**:
  - `ms-python.vscode-pylance` - Βελτιωμένο Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Υποστήριξη Azure Functions
  - `ms-azuretools.vscode-docker` - Υποστήριξη Docker
  - `ms-azuretools.vscode-bicep` - Υποστήριξη Bicep language
  - `ms-azure-devtools.azure-resource-groups` - Διαχείριση πόρων Azure
  - `yzhang.markdown-all-in-one` - Επεξεργασία Markdown
  - `DavidAnson.vscode-markdownlint` - Έλεγχος Markdown
  - `bierner.markdown-mermaid` - Υποστήριξη διαγραμμάτων Mermaid
  - `redhat.vscode-yaml` - Υποστήριξη YAML (για azure.yaml)
  - `eamodio.gitlens` - Οπτικοποίηση Git
  - `mhutchie.git-graph` - Ιστορικό Git

- **⚙️ Ρυθμίσεις VS Code**: Προστέθηκαν προεπιλεγμένες ρυθμίσεις για ερμηνευτή Python, μορφοποίηση κατά αποθήκευση και αφαίρεση κενών διαστημάτων

- **📦 Ενημερώθηκε requirements-dev.txt**:
  - Προστέθηκε πρόσθετο minify για MkDocs
  - Προστέθηκε pre-commit για ποιότητα κώδικα
  - Προστέθηκαν πακέτα Azure SDK (azure-identity, azure-mgmt-resource)

#### Διορθώσεις
- **Εντολή Μετά τη Δημιουργία**: Τώρα ελέγχει εγκατάσταση AZD και Azure CLI κατά την εκκίνηση κοντέινερ

---

### [v3.11.0] - 2026-02-05

#### Ολική Αναθεώρηση README για Αρχάριους
**Αυτή η έκδοση βελτιώνει σημαντικά το README.md για να είναι πιο προσιτό σε αρχάριους και προσθέτει βασικούς πόρους για προγραμματιστές AI.**

#### Προστέθηκε
- **🆚 Σύγκριση Azure CLI vs AZD**: Καθαρή εξήγηση για το πότε να χρησιμοποιείται κάθε εργαλείο με πρακτικά παραδείγματα
- **🌟 Awesome AZD Συνδέσεις**: Άμεσοι σύνδεσμοι στη γκαλερί προτύπων κοινότητας και στους πόρους συνεισφοράς:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ πρότυπα έτοιμα για ανάπτυξη
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Συμβολή κοινότητας
- **🎯 Οδηγός Γρήγορης Εκκίνησης**: Απλοποιημένη ενότητα 3 βημάτων (Εγκατάσταση → Σύνδεση → Ανάπτυξη)
- **📊 Πίνακας Πλοήγησης Βασισμένης στην Εμπειρία**: Σαφής καθοδήγηση για το πού να ξεκινήσετε ανάλογα με την εμπειρία του προγραμματιστή

#### Αλλαγές
- **Δομή README**: Αναδιοργανώθηκε για προοδευτική αποκάλυψη - πρώτα οι βασικές πληροφορίες
- **Ενότητα Εισαγωγής**: Επαναγράφηκε για να εξηγήσει "Το Μαγικό του `azd up`" για απόλυτους αρχάριους
- **Αφαίρεση Διπλού Περιεχομένου**: Εξαλείφθηκε διπλότυπη ενότητα αντιμετώπισης προβλημάτων
- **Εντολές Αντιμετώπισης Προβλημάτων**: Διορθώθηκε αναφορά `azd logs` για χρήση έγκυρου `azd monitor --logs`

#### Διορθώσεις
- **🔐 Εντολές Πιστοποίησης**: Προστέθηκαν `azd auth login` και `azd auth logout` στο cheat-sheet.md
- **Μη Έγκυρες Αναφορές Εντολών**: Αφαιρέθηκαν οι υπόλοιπες `azd logs` από την ενότητα αντιμετώπισης προβλημάτων του README

#### Σημειώσεις
- **Πεδίο Εφαρμογής**: Οι αλλαγές εφαρμόστηκαν στο βασικό README.md και στο resources/cheat-sheet.md
- **Στοχευόμενο Κοινό**: Βελτιώσεις ειδικά για προγραμματιστές νέους στο AZD

---

### [v3.10.0] - 2026-02-05

#### Διόρθωση Ακρίβειας Εντολών Azure Developer CLI
**Αυτή η έκδοση διορθώνει μη υπάρχουσες εντολές AZD σε όλη την τεκμηρίωση, διασφαλίζοντας ότι όλα τα παραδείγματα κώδικα χρησιμοποιούν έγκυρη σύνταξη Azure Developer CLI.**

#### Διορθώσεις
- **🔧 Αφαιρέθηκαν μη υπάρχουσες εντολές AZD**: Εκτενής έλεγχος και διόρθωση μη έγκυρων εντολών:
  - `azd logs` (δεν υπάρχει) → αντικαταστάθηκε με `azd monitor --logs` ή εναλλακτικές Azure CLI
  - `azd service` υποεντολές (δεν υπάρχουν) → αντικαταστάθηκαν με `azd show` και Azure CLI
  - `azd infra import/export/validate` (δεν υπάρχουν) → αφαιρέθηκαν ή αντικαταστάθηκαν με έγκυρες εναλλακτικές
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` σημαίες (δεν υπάρχουν) → αφαιρέθηκαν
  - `azd provision --what-if/--rollback` σημαίες (δεν υπάρχουν) → ενημερώθηκαν για χρήση `--preview`
  - `azd config validate` (δεν υπάρχει) → αντικαταστάθηκε με `azd config list`
  - `azd info`, `azd history`, `azd metrics` (δεν υπάρχουν) → αφαιρέθηκαν

- **📚 Ενημερωμένα Αρχεία με Διορθώσεις Εντολών**:
  - `resources/cheat-sheet.md`: Μεγάλη αναθεώρηση αναφοράς εντολών
  - `docs/deployment/deployment-guide.md`: Διορθώσεις στρατηγικών επαναφοράς και ανάπτυξης
  - `docs/troubleshooting/debugging.md`: Διορθώσεις ανάλυσης καταγραφών
  - `docs/troubleshooting/common-issues.md`: Ενημέρωση εντολών αντιμετώπισης προβλημάτων
  - `docs/troubleshooting/ai-troubleshooting.md`: Διόρθωση ενότητας αποσφαλμάτωσης AZD
  - `docs/getting-started/azd-basics.md`: Διορθωμένες εντολές παρακολούθησης
  - `docs/getting-started/first-project.md`: Ενημερωμένα παραδείγματα παρακολούθησης και αποσφαλμάτωσης
  - `docs/getting-started/installation.md`: Διορθωμένα παραδείγματα βοήθειας και έκδοσης
  - `docs/pre-deployment/application-insights.md`: Διορθωμένες εντολές προβολής καταγραφών
  - `docs/pre-deployment/coordination-patterns.md`: Διορθωμένες εντολές αποσφαλμάτωσης πράκτορα

- **📝 Ενημέρωση Αναφοράς Έκδοσης**: 
  - `docs/getting-started/installation.md`: Αλλαγή της σκληροκωδικοποιημένης έκδοσης `1.5.0` σε γενική `1.x.x` με σύνδεσμο στις εκδόσεις

#### Αλλαγές
- **Στρατηγικές Επαναφοράς**: Ενημέρωση τεκμηρίωσης για χρήση επαναφοράς βασισμένης σε Git (το AZD δεν έχει εγγενή επαναφορά)
- **Προβολή Καταγραφών**: Αντικατάσταση αναφορών `azd logs` με εντολές `azd monitor --logs`, `azd monitor --live` και Azure CLI
- **Ενότητα Απόδοσης**: Αφαίρεση μη υπαρχόντων σημαδιών παράλληλης/incremental ανάπτυξης, παροχή έγκυρων εναλλακτικών

#### Τεχνικές Λεπτομέρειες
- **Έγκυρες εντολές AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Έγκυρες σημαίες azd monitor**: `--live`, `--logs`, `--overview`
- **Αφαιρέθηκαν Λειτουργίες**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Σημειώσεις
- **Επαλήθευση**: Εντολές επικυρώθηκαν με Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ολοκλήρωση Εργαστηρίου και Ενημέρωση Ποιότητας Τεκμηρίωσης
**Αυτή η έκδοση ολοκληρώνει τα διαδραστικά modules εργαστηρίου, διορθώνει όλους τους σπασμένους συνδέσμους τεκμηρίωσης και βελτιώνει τη συνολική ποιότητα περιεχομένου για προγραμματιστές AI που χρησιμοποιούν το Microsoft AZD.**

#### Προσθήκες
- **📝 CONTRIBUTING.md**: Έγγραφο νέων οδηγιών συνεισφοράς με:
  - Σαφείς οδηγίες για αναφορά ζητημάτων και προτάσεις αλλαγών
  - Πρότυπα τεκμηρίωσης για νέο περιεχόμενο
  - Οδηγίες παραδειγμάτων κώδικα και συμβάσεις μηνυμάτων commit
  - Πληροφορίες συμμετοχής κοινότητας

#### Ολοκληρώθηκαν
- **🎯 Ενότητα Εργαστηρίου 7 (Ολοκλήρωση)**: Πλήρης ολοκλήρωση με:
  - Ολοκληρωμένη περίληψη επιτευγμάτων εργαστηρίου
  - Ενότητα βασικών εννοιών που καλύπτει AZD, πρότυπα, και Microsoft Foundry
  - Προτάσεις συνέχισης εκπαιδευτικής πορείας
  - Ασκήσεις προκλήσεων εργαστηρίου με βαθμολογίες δυσκολίας
  - Σύνδεσμοι ανατροφοδότησης και υποστήριξης κοινότητας

- **📚 Ενότητα Εργαστηρίου 3 (Αποδόμηση)**: Ενημερωμένους στόχους μάθησης με:
  - Οδηγίες ενεργοποίησης GitHub Copilot με MCP servers
  - Κατανόηση δομής φακέλων προτύπων AZD
  - Προτύπους οργάνωσης υποδομής ως κώδικα (Bicep)
  - Οδηγίες εργαστηρίων hands-on

- **🔧 Ενότητα Εργαστηρίου 6 (Καταστροφή)**: Ολοκληρωμένη με:
  - Στόχους καθαρισμού πόρων και διαχείρισης κόστους
  - Χρήση `azd down` για ασφαλή αποδόμηση υποδομής
  - Οδηγίες ανάκτησης για προσωρινά διαγραμμένες υπηρεσίες γνωστικής λειτουργίας
  - Επιπλέον προτροπές εξερεύνησης για GitHub Copilot και Azure Portal

#### Διορθώσεις
- **🔗 Διορθώσεις Σπασμένων Συνδέσμων**: Επίλυση 15+ σπασμένων εσωτερικών συνδέσμων τεκμηρίωσης:
  - `docs/ai-foundry/ai-model-deployment.md`: Διορθωμένες διαδρομές για microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Διορθωμένες διαδρομές για ai-model-deployment.md και production-ai-practices.md
  - `docs/getting-started/first-project.md`: Αντικατάσταση μη υπαρκτού cicd-integration.md με deployment-guide.md
  - `examples/retail-scenario.md`: Διορθωμένες διαδρομές FAQ και οδηγού αντιμετώπισης προβλημάτων
  - `examples/container-app/microservices/README.md`: Διορθωμένες διαδρομές αρχικής σελίδας μαθήματος και οδηγού ανάπτυξης
  - `resources/faq.md` και `resources/glossary.md`: Ενημερωμένες αναφορές κεφαλαίου AI
  - `course-outline.md`: Διορθωμένες αναφορές οδηγού εκπαιδευτή και εργαστηρίου AI

- **📅 Λωρίδα Κατάστασης Εργαστηρίου**: Ενημερώθηκε από "Υπό Κατασκευή" σε ενεργή κατάσταση εργαστηρίου με ημερομηνία Φεβρουάριος 2026

- **🔗 Πλοήγηση Εργαστηρίου**: Διορθωμένοι σπασμένοι σύνδεσμοι πλοήγησης στο README.md εργαστηρίου που έδειχναν σε μη υπάρχοντα φάκελο lab-1-azd-basics

#### Αλλαγές
- **Παρουσίαση Εργαστηρίου**: Αφαίρεση προειδοποίησης "υπό κατασκευή", το εργαστήριο είναι πλέον ολοκληρωμένο και έτοιμο για χρήση
- **Συνοχή Πλοήγησης**: Εξασφάλιση κατάλληλης εσωτερικής πλοήγησης μεταξύ όλων των modules εργαστηρίου
- **Αναφορές Εκμάθησης**: Ενημερωμένες διασταυρούμενες αναφορές κεφαλαίων με σωστές διαδρομές microsoft-foundry

#### Επαληθεύσεις
- ✅ Όλα τα αγγλικά αρχεία markdown έχουν έγκυρους εσωτερικούς συνδέσμους
- ✅ Τα εργαστηριακά modules 0-7 είναι πλήρη με στόχους μάθησης
- ✅ Η πλοήγηση μεταξύ κεφαλαίων και modules λειτουργεί σωστά
- ✅ Το περιεχόμενο είναι κατάλληλο για AI προγραμματιστές που χρησιμοποιούν Microsoft AZD
- ✅ Διατηρείται γλώσσα και δομή φιλική για αρχάριους
- ✅ Το CONTRIBUTING.md παρέχει σαφείς οδηγίες για τους συνεισφέροντες της κοινότητας

#### Τεχνική Υλοποίηση
- **Επικύρωση Συνδέσμων**: Αυτόματο σενάριο PowerShell επαλήθευσε όλους τους εσωτερικούς συνδέσμους .md
- **Έλεγχος Περιεχομένου**: Χειροκίνητη ανασκόπηση της ολοκλήρωσης του εργαστηρίου και καταλληλότητας για αρχάριους
- **Σύστημα Πλοήγησης**: Εφαρμογή συνεπών προτύπων πλοήγησης κεφαλαίων και modules

#### Σημειώσεις
- **Πεδίο**: Αλλαγές εφαρμοσμένες μόνο στην αγγλική τεκμηρίωση
- **Μεταφράσεις**: Οι φάκελοι μεταφράσεων δεν ενημερώθηκαν σε αυτήν την έκδοση (η αυτόματη μετάφραση θα συγχρονιστεί αργότερα)
- **Διάρκεια Εργαστηρίου**: Το ολοκληρωμένο εργαστήριο τώρα παρέχει 3-4 ώρες πρακτικής μάθησης

---

### [v3.8.0] - 2025-11-19

#### Προχωρημένη Τεκμηρίωση: Παρακολούθηση, Ασφάλεια και Πρότυπα Πολυ-Πράκτορα
**Αυτή η έκδοση προσθέτει ολοκληρωμένα μαθήματα επιπέδου Α σχετικά με την ενσωμάτωση Application Insights, πρότυπα πιστοποίησης, και συντονισμό πολλαπλών πρακτόρων για παραγωγικές αναπτύξεις.**

#### Προσθήκες
- **📊 Μάθημα Ενσωμάτωσης Application Insights**: στο `docs/pre-deployment/application-insights.md`:
  - Ανάπτυξη εστιασμένη στο AZD με αυτόματη προμήθεια
  - Πλήρη πρότυπα Bicep για Application Insights + Log Analytics
  - Λειτουργικές εφαρμογές Python με προσαρμοσμένη τηλεμετρία (πάνω από 1,200 γραμμές)
  - Πρότυπα παρακολούθησης AI/LLM (παρακολούθηση tokens/cost Microsoft Foundry Models)
  - 6 διαγράμματα Mermaid (αρχιτεκτονική, κατανεμημένη παρακολούθηση, ροή τηλεμετρίας)
  - 3 ασκήσεις hands-on (ειδοποιήσεις, πίνακες εργαλείων, παρακολούθηση AI)
  - Παραδείγματα ερωτημάτων Kusto και στρατηγικές βελτιστοποίησης κόστους
  - Μετάδοση ζωντανών μετρικών και αποσφαλμάτωση σε πραγματικό χρόνο
  - Χρόνος μάθησης 40-50 λεπτών με παραγωγικά πρότυπα

- **🔐 Μάθημα Προτύπων Πιστοποίησης & Ασφάλειας**: στο `docs/getting-started/authsecurity.md`:
  - 3 πρότυπα πιστοποίησης (connection strings, Key Vault, διαχειριζόμενη ταυτότητα)
  - Πλήρη πρότυπα υποδομής Bicep για ασφαλείς αναπτύξεις
  - Κώδικας εφαρμογής Node.js με ενσωμάτωση Azure SDK
  - 3 ολοκληρωμένες ασκήσεις (ενεργοποίηση managed identity, user-assigned identity, Key Vault rotation)
  - Βέλτιστες πρακτικές ασφαλείας και ρυθμίσεις RBAC
  - Οδηγός αντιμετώπισης προβλημάτων και ανάλυση κόστους
  - Παραγωγικά πρότυπα πιστοποίησης χωρίς κωδικό πρόσβασης

- **🤖 Μάθημα Προτύπων Συντονισμού Πολυ-Πρακτόρα**: στο `docs/pre-deployment/coordination-patterns.md`:
  - 5 πρότυπα συντονισμού (διαδοχικός, παράλληλος, ιεραρχικός, ενεργο-οδηγούμενος, συναίνεσης)
  - Πλήρης υλοποίηση υπηρεσίας ορχήστρας (Python/Flask, πάνω από 1,500 γραμμές)
  - 3 εξειδικευμένες υλοποιήσεις πρακτόρων (Research, Writer, Editor)
  - Ενσωμάτωση Service Bus για ουρά μηνυμάτων
  - Διαχείριση κατάστασης με Cosmos DB για κατανεμημένα συστήματα
  - 6 διαγράμματα Mermaid που εμφανίζουν αλληλεπιδράσεις πρακτόρων
  - 3 προχωρημένες ασκήσεις (χειρισμός timeout, λογική επανάληψης, circuit breaker)
  - Ανάλυση κόστους (240-565$/μήνα) με στρατηγικές βελτιστοποίησης
  - Ενσωμάτωση Application Insights για παρακολούθηση

#### Ενισχυμένα
- **Κεφάλαιο Πριν την Ανάπτυξη**: Περιλαμβάνει πλέον ολοκληρωμένα πρότυπα παρακολούθησης και συντονισμού
- **Κεφάλαιο Εισαγωγής**: Εμπλουτισμένο με επαγγελματικά πρότυπα πιστοποίησης
- **Ετοιμότητα Παραγωγής**: Ολοκληρωμένη κάλυψη από ασφάλεια έως παρατηρησιμότητα
- **Περίγραμμα Μαθήματος**: Ενημερώθηκε με αναφορές σε νέα μαθήματα στα Κεφάλαια 3 και 6

#### Αλλαγές
- **Πρόοδος Μάθησης**: Καλύτερη ενσωμάτωση ασφάλειας και παρακολούθησης σε όλο το μάθημα
- **Ποιότητα Τεκμηρίωσης**: Συνεπείς προδιαγραφές επιπέδου Α (95-97%) σε νέα μαθήματα
- **Παραγωγικά Πρότυπα**: Ολοκληρωμένη κάλυψη από άκρο σε άκρο για επιχειρησιακές αναπτύξεις

#### Βελτιώσεις
- **Εμπειρία Προγραμματιστή**: Σαφής διαδρομή από ανάπτυξη σε παραγωγική παρακολούθηση
- **Πρότυπα Ασφαλείας**: Επαγγελματικά πρότυπα για πιστοποίηση και διαχείριση μυστικών
- **Παρατηρησιμότητα**: Πλήρης ενσωμάτωση Application Insights με AZD
- **Φορτία AI**: Εξειδικευμένη παρακολούθηση για Microsoft Foundry Models και συστήματα πολλαπλών πρακτόρων

#### Επαληθεύσεις
- ✅ Όλα τα μαθήματα περιλαμβάνουν πλήρες λειτουργικό κώδικα (όχι αποσπάσματα)
- ✅ Διαγράμματα Mermaid για οπτική μάθηση (σύνολο 19 σε 3 μαθήματα)
- ✅ Πρακτικές ασκήσεις με βήματα επικύρωσης (σύνολο 9)
- ✅ Παραγωγικά πρότυπα Bicep αναπτυσσόμενα μέσω `azd up`
- ✅ Ανάλυση κόστους και στρατηγικές βελτιστοποίησης
- ✅ Οδηγοί αντιμετώπισης προβλημάτων και βέλτιστες πρακτικές
- ✅ Σημεία γνώσης με εντολές επαλήθευσης

#### Αποτελέσματα Βαθμολόγησης Τεκμηρίωσης
- **docs/pre-deployment/application-insights.md**: - Ολοκληρωμένος οδηγός παρακολούθησης
- **docs/getting-started/authsecurity.md**: - Επαγγελματικά πρότυπα ασφάλειας
- **docs/pre-deployment/coordination-patterns.md**: - Προχωρημένες αρχιτεκτονικές πολυ-πρακτόρων
- **Γενικό Νέο Περιεχόμενο**: - Συνεπείς υψηλές προδιαγραφές ποιότητας

#### Τεχνική Υλοποίηση
- **Application Insights**: Log Analytics + προσαρμοσμένη τηλεμετρία + διανεμημένη παρακολούθηση
- **Πιστοποίηση**: Managed Identity + Key Vault + πρότυπα RBAC
- **Πολυ-Πράκτορας**: Service Bus + Cosmos DB + Container Apps + ορχήστρωση
- **Παρακολούθηση**: Ζωντανές μετρικές + ερωτήματα Kusto + ειδοποιήσεις + πίνακες εργαλείων
- **Διαχείριση Κόστους**: Στρατηγικές δειγματοληψίας, πολιτικές διατήρησης, έλεγχοι προϋπολογισμού

### [v3.7.0] - 2025-11-19

#### Βελτιώσεις Ποιότητας Τεκμηρίωσης και Νέο Παράδειγμα Microsoft Foundry Models
**Αυτή η έκδοση βελτιώνει την ποιότητα τεκμηρίωσης σε όλο το αποθετήριο και προσθέτει ολοκληρωμένο παράδειγμα ανάπτυξης Microsoft Foundry Models με διεπαφή συνομιλίας gpt-4.1.**

#### Προσθήκες
- **🤖 Παράδειγμα Συνομιλίας Microsoft Foundry Models**: Πλήρης ανάπτυξη gpt-4.1 με λειτουργική υλοποίηση σε `examples/azure-openai-chat/`:
  - Ολοκληρωμένη υποδομή Microsoft Foundry Models (ανάπτυξη μοντέλου gpt-4.1)
  - Διεπαφή συνομιλίας γραμμής εντολών Python με ιστορικό συνομιλιών
  - Ενσωμάτωση Key Vault για ασφαλή αποθήκευση κλειδιού API
  - Παρακολούθηση χρήσης tokens και εκτίμηση κόστους
  - Όρια ρυθμού και χειρισμός σφαλμάτων
  - Ολοκληρωμένο README με οδηγό ανάπτυξης διάρκειας 35-45 λεπτών
  - 11 αρχεία έτοιμα για παραγωγή (πρότυπα Bicep, εφαρμογή Python, διαμόρφωση)
- **📚 Ασκήσεις Τεκμηρίωσης**: Προστέθηκαν πρακτικές ασκήσεις στον οδηγό διαμόρφωσης:
  - Άσκηση 1: Διαμόρφωση πολυ-περιβάλλοντος (15 λεπτά)
  - Άσκηση 2: Πρακτική διαχείρισης μυστικών (10 λεπτά)
  - Σαφή κριτήρια επιτυχίας και βήματα επαλήθευσης
- **✅ Επαλήθευση Ανάπτυξης**: Προστέθηκε τμήμα επαλήθευσης στον οδηγό ανάπτυξης:
  - Διαδικασίες ελέγχου υγείας
  - Λίστα κριτηρίων επιτυχίας
  - Αναμενόμενες εξόδους για όλες τις εντολές ανάπτυξης
  - Σύντομη αναφορά για την αντιμετώπιση προβλημάτων

#### Ενισχύσεις
- **examples/README.md**: Ενημερώθηκε σε ποιότητα επιπέδου Α (93%):
  - Προστέθηκε azure-openai-chat σε όλες τις σχετικές ενότητες
  - Αύξηση αριθμού τοπικών παραδειγμάτων από 3 σε 4
  - Προσθήκη στον πίνακα Παραδειγμάτων AI Εφαρμογών
  - Ενσωμάτωση στο Quick Start για Προχωρημένους Χρήστες
  - Εισαγωγή στο τμήμα Microsoft Foundry Templates
  - Ενημέρωση Πίνακα Σύγκρισης και τμημάτων εύρεσης τεχνολογίας
- **Ποιότητα Τεκμηρίωσης**: Βελτίωση από B+ (87%) σε A- (92%) στο φάκελο docs:
  - Προστέθηκαν αναμενόμενες έξοδοι σε κρίσιμα παραδείγματα εντολών
  - Συμπεριλήφθηκαν βήματα επαλήθευσης για αλλαγές διαμόρφωσης
  - Βελτιωμένη πρακτική μάθησης με πρακτικές ασκήσεις

#### Αλλαγές
- **Πρόοδος Μάθησης**: Καλύτερη ενσωμάτωση παραδειγμάτων AI για προχωρημένους
- **Δομή Τεκμηρίωσης**: Περισσότερες πρακτικές ασκήσεις με σαφή αποτελέσματα
- **Διαδικασία Επαλήθευσης**: Προσθήκη σαφών κριτηρίων επιτυχίας σε βασικές διεργασίες

#### Βελτιώσεις
- **Εμπειρία Προγραμματιστή**: Η ανάπτυξη Microsoft Foundry Models απαιτεί πλέον 35-45 λεπτά (από 60-90 για σύνθετες εναλλακτικές)
- **Διαφάνεια Κόστους**: Σαφείς εκτιμήσεις κόστους (50-200$/μήνα) για παράδειγμα Microsoft Foundry Models
- **Μονοπάτι Μάθησης**: Οι προγραμματιστές AI έχουν ξεκάθαρο σημείο εκκίνησης με azure-openai-chat
- **Πρότυπα Τεκμηρίωσης**: Συνεπείς αναμενόμενες έξοδοι και βήματα επαλήθευσης

#### Επαληθεύσεις
- ✅ Το παράδειγμα Microsoft Foundry Models λειτουργεί πλήρως με `azd up`
- ✅ Όλα τα 11 αρχεία υλοποίησης είναι συντακτικά σωστά
- ✅ Οδηγίες README αντιστοιχούν στην πραγματική εμπειρία ανάπτυξης
- ✅ Ενημερωμένοι σύνδεσμοι τεκμηρίωσης σε 8+ θέσεις
- ✅ Ο πίνακας παραδειγμάτων αναφέρει με ακρίβεια 4 τοπικά παραδείγματα
- ✅ Δεν υπάρχουν διπλοί εξωτερικοί σύνδεσμοι στους πίνακες
- ✅ Όλες οι αναφορές πλοήγησης είναι σωστές

#### Τεχνική Υλοποίηση
- **Αρχιτεκτονική Microsoft Foundry Models**: gpt-4.1 + Key Vault + πρότυπο Container Apps
- **Ασφάλεια**: Έτοιμο Managed Identity, μυστικά στο Key Vault
- **Παρακολούθηση**: Ενσωμάτωση Application Insights
- **Διαχείριση Κόστους**: Παρακολούθηση tokens και βελτιστοποίηση χρήσης
- **Ανάπτυξη**: Μία εντολή `azd up` για πλήρη ρύθμιση

### [v3.6.0] - 2025-11-19

#### Μεγάλη Ενημέρωση: Παραδείγματα Ανάπτυξης Container App
**Αυτή η έκδοση εισάγει ολοκληρωμένα, παραγωγικά παραδείγματα ανάπτυξης εφαρμογών κοντέινερ χρησιμοποιώντας Azure Developer CLI (AZD), με πλήρη τεκμηρίωση και ενσωμάτωση στο μονοπάτι μάθησης.**

#### Προσθήκες
- **🚀 Παραδείγματα Container App**: Νέα τοπικά παραδείγματα στο `examples/container-app/`:
  - [Οδηγός Master](examples/container-app/README.md): Πλήρης επισκόπηση των containerized αναπτύξεων, γρήγορη εκκίνηση, παραγωγή και προηγμένα μοτίβα
  - [Απλό Flask API](../../examples/container-app/simple-flask-api): Φιλικό προς αρχάριους REST API με scale-to-zero, health probes, monitoring και troubleshooting
  - [Αρχιτεκτονική Microservices](../../examples/container-app/microservices): Παραγωγική πολυ-υπηρεσιακή ανάπτυξη (API Gateway, Προϊόν, Παραγγελία, Χρήστης, Ειδοποίηση), ασύγχρονη αποστολή μηνυμάτων, Service Bus, Cosmos DB, Azure SQL, διανεμημένη ιχνηλάτηση, blue-green/canary ανάπτυξη
- **Καλές Πρακτικές**: Ασφάλεια, παρακολούθηση, βελτιστοποίηση κόστους και καθοδήγηση CI/CD για containerized workloads
- **Δείγματα Κώδικα**: Πλήρη `azure.yaml`, πρότυπα Bicep και υλοποιήσεις υπηρεσιών πολλαπλών γλωσσών (Python, Node.js, C#, Go)
- **Δοκιμές & Επίλυση Προβλημάτων**: Σενάρια end-to-end, εντολές παρακολούθησης, καθοδήγηση επίλυσης προβλημάτων

#### Αλλαγές
- **README.md**: Ενημερώθηκε για να παρουσιάζει και να συνδέει νέα παραδείγματα εφαρμογών container κάτω από "Τοπικά Παραδείγματα - Εφαρμογές Container"
- **examples/README.md**: Ενημερώθηκε για την ανάδειξη παραδειγμάτων εφαρμογών container, προσθήκη στοιχείων πίνακα σύγκρισης και ενημέρωση αναφορών τεχνολογίας/αρχιτεκτονικής
- **Διάγραμμα Μαθήματος & Οδηγός Μελέτης**: Ενημερώθηκαν για να αναφέρουν νέα παραδείγματα εφαρμογών container και μοτίβα ανάπτυξης σε σχετικά κεφάλαια

#### Επικυρωμένο
- ✅ Όλα τα νέα παραδείγματα αναπτύξιμα με `azd up` και ακολουθούν τις καλύτερες πρακτικές
- ✅ Ενημερωμένοι διασταυρούμενοι σύνδεσμοι και πλοήγηση τεκμηρίωσης
- ✅ Παραδείγματα που καλύπτουν σενάρια από αρχαρίους έως προχωρημένους, συμπεριλαμβανομένων παραγωγικών microservices

#### Σημειώσεις
- **Πεδίο**: Μόνο αγγλική τεκμηρίωση και παραδείγματα
- **Επόμενα Βήματα**: Επέκταση με πρόσθετα προηγμένα μοτίβα container και αυτοματοποίηση CI/CD σε μελλοντικές εκδόσεις

### [v3.5.0] - 2025-11-19

#### Επανασχεδιασμός Προϊόντος: Microsoft Foundry
**Αυτή η έκδοση υλοποιεί ολοκληρωμένη αλλαγή ονόματος προϊόντος από "Microsoft Foundry" σε "Microsoft Foundry" σε όλη την αγγλική τεκμηρίωση, αντικατοπτρίζοντας την επίσημη επαναδιάταξη της Microsoft.**

#### Αλλαγές
- **🔄 Ενημέρωση Ονόματος Προϊόντος**: Ολοκληρωμένη επαναδιάταξη από "Microsoft Foundry" σε "Microsoft Foundry"
  - Ενημερώθηκαν όλες οι αναφορές στην αγγλική τεκμηρίωση στο φάκελο `docs/`
  - Μετονομασία φακέλου: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Μετονομασία αρχείου: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Σύνολο: 23 αναφορές περιεχομένου ενημερώθηκαν σε 7 αρχεία τεκμηρίωσης

- **📁 Αλλαγές στη Δομή Φακέλων**:
  - `docs/ai-foundry/` μετονομάστηκε σε `docs/microsoft-foundry/`
  - Όλες οι διασταυρούμενες αναφορές ενημερώθηκαν για να αντικατοπτρίζουν τη νέα δομή φακέλων
  - Επικυρωμένοι σύνδεσμοι πλοήγησης σε όλη την τεκμηρίωση

- **📄 Μετονομασίες Αρχείων**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Όλοι οι εσωτερικοί σύνδεσμοι ενημερώθηκαν για να δείχνουν το νέο όνομα αρχείου

#### Ενημερωμένα Αρχεία
- **Τεκμηρίωση Κεφαλαίων** (7 αρχεία):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ενημερώσεις συνδέσμων πλοήγησης
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ενημερώσεις αναφορών ονόματος προϊόντος
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ήδη χρησιμοποιεί Microsoft Foundry (από προηγούμενες ενημερώσεις)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 αναφορές ενημερωμένες (επισκόπηση, ανάδραση κοινότητας, τεκμηρίωση)
  - `docs/getting-started/azd-basics.md` - 4 ενημερώσεις διασταυρούμενων συνδέσμων
  - `docs/getting-started/first-project.md` - 2 ενημερώσεις συνδέσμων κεφαλαίων
  - `docs/getting-started/installation.md` - 2 ενημερώσεις συνδέσμων επόμενων κεφαλαίων
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 αναφορές ενημερώθηκαν (πλοήγηση, κοινότητα Discord)
  - `docs/troubleshooting/common-issues.md` - 1 ενημέρωση συνδέσμου πλοήγησης
  - `docs/troubleshooting/debugging.md` - 1 ενημέρωση συνδέσμου πλοήγησης

- **Αρχεία Δομής Μαθήματος** (2 αρχεία):
  - `README.md` - 17 αναφορές ενημερώθηκαν (επισκόπηση μαθήματος, τίτλοι κεφαλαίων, ενότητα προτύπων, πληροφορίες κοινότητας)
  - `course-outline.md` - 14 αναφορές ενημερώθηκαν (επισκόπηση, στόχοι μάθησης, πόροι κεφαλαίων)

#### Επικυρωμένο
- ✅ Μηδενικές υπόλοιπες αναφορές διαδρομής φακέλου "ai-foundry" στην αγγλική τεκμηρίωση
- ✅ Μηδενικές υπόλοιπες αναφορές ονόματος προϊόντος "Microsoft Foundry" στην αγγλική τεκμηρίωση
- ✅ Όλοι οι σύνδεσμοι πλοήγησης λειτουργικοί με τη νέα δομή φακέλων
- ✅ Μετονομασίες αρχείων και φακέλων ολοκληρώθηκαν επιτυχώς
- ✅ Επικυρωμένες διασταυρούμενες αναφορές μεταξύ κεφαλαίων

#### Σημειώσεις
- **Πεδίο**: Οι αλλαγές εφαρμόστηκαν μόνο στην αγγλική τεκμηρίωση στο φάκελο `docs/`
- **Μεταφράσεις**: Οι φάκελοι μεταφράσεων (`translations/`) δεν ενημερώθηκαν σε αυτή την έκδοση
- **Εργαστήριο**: Το υλικό εργαστηρίου (`workshop/`) δεν ενημερώθηκε σε αυτή την έκδοση
- **Παραδείγματα**: Τα αρχεία παραδειγμάτων μπορεί να αναφέρουν ακόμη παλιές ονομασίες (θα διορθωθεί σε μελλοντική ενημέρωση)
- **Εξωτερικοί Σύνδεσμοι**: Οι εξωτερικές URL και οι αναφορές αποθετηρίου GitHub παραμένουν αμετάβλητες

#### Οδηγός Μεταφοράς για Συμβάλλοντες
Αν έχετε τοπικά branches ή τεκμηρίωση που αναφέρει την παλιά δομή:
1. Ενημερώστε τις αναφορές φακέλου: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ενημερώστε τις αναφορές αρχείων: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Αντικαταστήστε το όνομα προϊόντος: "Microsoft Foundry" → "Microsoft Foundry"
4. Επικυρώστε ότι όλοι οι εσωτερικοί σύνδεσμοι τεκμηρίωσης λειτουργούν ακόμα

---

### [v3.4.0] - 2025-10-24

#### Βελτιώσεις Προεπισκόπησης και Επικύρωσης Υποδομής
**Αυτή η έκδοση εισάγει ολοκληρωμένη υποστήριξη για την προεπισκόπηση της νέας δυνατότητας Azure Developer CLI και βελτιώνει την εμπειρία χρήστη του εργαστηρίου.**

#### Προστέθηκαν
- **🧪 Τεκμηρίωση της Δυνατότητας azd provision --preview**: Ολοκληρωμένη κάλυψη της νέας δυνατότητας προεπισκόπησης υποδομής
  - Αναφορά εντολών και παραδείγματα χρήσης σε cheat sheet
  - Λεπτομερής ενσωμάτωση στον οδηγό παροχής με περιπτώσεις χρήσης και οφέλη
  - Ενσωμάτωση ελέγχου προ της πτήσης για ασφαλέστερη επικύρωση ανάπτυξης
  - Ενημερώσεις οδηγού εκκίνησης με πρακτικές ανάπτυξης προσανατολισμένες στην ασφάλεια
- **🚧 Μπάνερ Κατάστασης Εργαστηρίου**: Επαγγελματικό HTML μπάνερ που υποδεικνύει την κατάσταση ανάπτυξης εργαστηρίου
  - Σχεδιασμός με διαβάθμιση και ενδείξεις κατασκευής για σαφή επικοινωνία προς τον χρήστη
  - Αναγραφή τελευταίας ενημέρωσης για διαφάνεια
  - Responsive σχεδιασμός για όλους τους τύπους συσκευών

#### Βελτιωμένο
- **Ασφάλεια Υποδομής**: Η λειτουργία προεπισκόπησης ενσωματώθηκε σε όλη την τεκμηρίωση ανάπτυξης
- **Επικύρωση Πριν την Ανάπτυξη**: Τα αυτοματοποιημένα σενάρια περιλαμβάνουν πλέον δοκιμές προεπισκόπησης υποδομής
- **Ροή Εργασίας Προγραμματιστή**: Ενημερωμένες αλληλουχίες εντολών που περιλαμβάνουν προεπισκόπηση ως βέλτιστη πρακτική
- **Εμπειρία Εργαστηρίου**: Σαφείς προσδοκίες καθορισμένες προς τους χρήστες σχετικά με την κατάσταση ανάπτυξης περιεχομένου

#### Αλλαγές
- **Βέλτιστες Πρακτικές Ανάπτυξης**: Η προσέγγιση preview-first προτείνεται πλέον ως μέθοδος
- **Ροή Τεκμηρίωσης**: Η επικύρωση υποδομής μεταφέρθηκε νωρίτερα στη διαδικασία εκμάθησης
- **Παρουσίαση Εργαστηρίου**: Επαγγελματική επικοινωνία κατάστασης με σαφές χρονοδιάγραμμα ανάπτυξης

#### Βελτιώσεις
- **Προσέγγιση με Προτεραιότητα την Ασφάλεια**: Οι αλλαγές υποδομής μπορούν τώρα να επικυρωθούν πριν την ανάπτυξη
- **Συνεργασία Ομάδας**: Τα αποτελέσματα προεπισκόπησης μπορούν να κοινοποιηθούν για αναθεώρηση και έγκριση
- **Ενημέρωση για το Κόστος**: Καλύτερη κατανόηση κόστους πόρων πριν την παροχή
- **Μείωση Κινδύνου**: Μείωση αποτυχιών ανάπτυξης μέσω προχωρημένης επικύρωσης

#### Τεχνική Υλοποίηση
- **Ενσωμάτωση σε Πολλαπλά Έγγραφα**: Η δυνατότητα προεπισκόπησης τεκμηριώνεται σε 4 βασικά αρχεία
- **Μοτίβα Εντολών**: Συνεπής σύνταξη και παραδείγματα σε όλη την τεκμηρίωση
- **Ενσωμάτωση Καλής Πρακτικής**: Η προεπισκόπηση συμπεριλαμβάνεται σε ροές εργασίας και σενάρια επικύρωσης
- **Οπτικοί Ενδείκτες**: Σαφείς επισημάνσεις ΝΕΑΣ δυνατότητας για ευκολότερη ανεύρεση

#### Υποδομή Εργαστηρίου
- **Επικοινωνία Κατάστασης**: Επαγγελματικό HTML μπάνερ με στυλ διαβάθμισης
- **Εμπειρία Χρήστη**: Σαφής κατάσταση ανάπτυξης που αποτρέπει σύγχυση
- **Επαγγελματική Παρουσίαση**: Διατηρεί την αξιοπιστία αποθετηρίου ενώ θέτει προσδοκίες
- **Διαφάνεια Χρονοδιαγράμματος**: Αναγραφή τελευταίας ενημέρωσης Οκτωβρίου 2025 για λογοδοσία

### [v3.3.0] - 2025-09-24

#### Βελτιωμένο Υλικό Εργαστηρίου και Διαδραστική Εμπειρία Μάθησης
**Αυτή η έκδοση εισάγει ολοκληρωμένο υλικό εργαστηρίου με διαδραστικούς οδηγούς μέσω browser και δομημένα μονοπάτια μάθησης.**

#### Προστέθηκαν
- **🎥 Διαδραστικός Οδηγός Εργαστηρίου**: Εμπειρία εργαστηρίου μέσω browser με δυνατότητα προεπισκόπησης MkDocs
- **📝 Δομημένες Οδηγίες Εργαστηρίου**: Εφτά βήματα καθοδηγούμενης μάθησης από ανακάλυψη μέχρι προσαρμογή
  - 0-Εισαγωγή: Επισκόπηση και ρύθμιση εργαστηρίου
  - 1-Επιλογή-Προτύπου-AI: Διαδικασία ανακάλυψης και επιλογής προτύπου
  - 2-Επικύρωση-Προτύπου-AI: Διαδικασίες ανάπτυξης και επικύρωσης
  - 3-Αποδόμηση-Προτύπου-AI: Κατανόηση αρχιτεκτονικής προτύπου
  - 4-Διαμόρφωση-Προτύπου-AI: Παραμετροποίηση και προσαρμογή
  - 5-Προσαρμογή-Προτύπου-AI: Προχωρημένες τροποποιήσεις και επαναλήψεις
  - 6-Καθαρισμός-Υποδομής: Καθαρισμός και διαχείριση πόρων
  - 7-Επίλογος: Περίληψη και επόμενα βήματα
- **🛠️ Εργαλεία Εργαστηρίου**: Διαμόρφωση MkDocs με θέμα Material για βελτιωμένη εμπειρία μάθησης
- **🎯 Μονοπάτι Μάθησης Hands-On**: Μεθοδολογία τριών βημάτων (Ανακάλυψη → Ανάπτυξη → Προσαρμογή)
- **📱 Ενσωμάτωση GitHub Codespaces**: Ομαλή ρύθμιση περιβάλλοντος ανάπτυξης

#### Βελτιωμένο
- **Εργαστήριο AI**: Επεκτάθηκε με ολοκληρωμένη 2-3 ώρες δομημένη μάθηση
- **Τεκμηρίωση Εργαστηρίου**: Επαγγελματική παρουσίαση με πλοήγηση και οπτικά βοηθήματα
- **Πρόοδος Μάθησης**: Σαφής καθοδήγηση βήμα προς βήμα από την επιλογή προτύπου μέχρι παραγωγική ανάπτυξη
- **Εμπειρία Προγραμματιστή**: Ενσωματωμένα εργαλεία για απλοποιημένες ροές εργασίας ανάπτυξης

#### Βελτιώσεις
- **Προσβασιμότητα**: Περιβάλλον browser με αναζήτηση, λειτουργία αντιγραφής και εναλλαγή θέματος
- **Αυτορυθμιζόμενη Μάθηση**: Ευέλικτη δομή εργαστηρίου που επιτρέπει διαφορετικούς ρυθμούς μάθησης
- **Πρακτική Εφαρμογή**: Σενάρια ανάπτυξης AI προτύπων στον πραγματικό κόσμο
- **Ενσωμάτωση Κοινότητας**: Ενσωμάτωση Discord για υποστήριξη εργαστηρίου και συνεργασία

#### Χαρακτηριστικά Εργαστηρίου
- **Ενσωματωμένη Αναζήτηση**: Γρήγορη ανακάλυψη λέξεων-κλειδιών και μαθημάτων
- **Αντιγραφή Μπλοκ Κώδικα**: Λειτουργία hover-to-copy για όλα τα παραδείγματα κώδικα
- **Εναλλαγή Θέματος**: Υποστήριξη σκοτεινού/φωτεινού τρόπου για διαφορετικές προτιμήσεις
- **Οπτικά Στοιχεία**: Στιγμιότυπα οθόνης και διαγράμματα για καλύτερη κατανόηση
- **Ενσωμάτωση Βοήθειας**: Άμεση πρόσβαση σε Discord για υποστήριξη κοινότητας

### [v3.2.0] - 2025-09-17

#### Μεγάλη Αναδιάρθρωση Πλοήγησης και Σύστημα Μάθησης Βασισμένο σε Κεφάλαια
**Αυτή η έκδοση εισάγει ολοκληρωμένη δομή εκμάθησης με κεφάλαια και βελτιωμένη πλοήγηση σε όλο το αποθετήριο.**

#### Προστέθηκαν
- **📚 Σύστημα Μάθησης Βασισμένο σε Κεφάλαια**: Αναδιαρθρώθηκε ολόκληρο το μάθημα σε 8 προοδευτικά κεφάλαια μάθησης
  - Κεφάλαιο 1: Βάση & Γρήγορη Εκκίνηση (⭐ - 30-45 λεπτά)
  - Κεφάλαιο 2: Ανάπτυξη AI-First (⭐⭐ - 1-2 ώρες)
  - Κεφάλαιο 3: Διαμόρφωση & Πιστοποίηση (⭐⭐ - 45-60 λεπτά)
  - Κεφάλαιο 4: Υποδομή ως Κώδικας & Ανάπτυξη (⭐⭐⭐ - 1-1.5 ώρες)
  - Κεφάλαιο 5: Λύσεις Πολυ-Πράκτορα AI (⭐⭐⭐⭐ - 2-3 ώρες)
  - Κεφάλαιο 6: Επικύρωση & Σχεδιασμός Πριν Ανάπτυξη (⭐⭐ - 1 ώρα)
  - Κεφάλαιο 7: Επίλυση & Εντοπισμός Σφαλμάτων (⭐⭐ - 1-1.5 ώρες)
  - Κεφάλαιο 8: Παραγωγικά & Επιχειρησιακά Μοτίβα (⭐⭐⭐⭐ - 2-3 ώρες)
- **📚 Ολοκληρωμένο Σύστημα Πλοήγησης**: Συνεπείς επικεφαλίδες και υποσέλιδα πλοήγησης σε όλη την τεκμηρίωση
- **🎯 Παρακολούθηση Προόδου**: Λίστα ελέγχου ολοκλήρωσης μαθήματος και σύστημα επαλήθευσης μάθησης
- **🗺️ Καθοδήγηση Μονοπατιού Μάθησης**: Σαφή σημεία εισόδου για διαφορετικά επίπεδα εμπειρίας και στόχους
- **🔗 Διασταυρούμενη Πλοήγηση**: Σχετικά κεφάλαια και προαπαιτούμενα συνδεδεμένα καθαρά

#### Βελτιωμένο
- **Δομή README**: Μετατράπηκε σε πλατφόρμα μάθησης δομημένη σε κεφάλαια
- **Πλοήγηση Τεκμηρίωσης**: Κάθε σελίδα περιλαμβάνει πλέον πλαίσιο κεφαλαίου και καθοδήγηση προόδου
- **Οργάνωση Προτύπων**: Παραδείγματα και πρότυπα αντιστοιχισμένα σε κατάλληλα κεφάλαια μάθησης
- **Ενσωμάτωση Πόρων**: Cheat sheets, FAQs και οδηγοί μελέτης συνδεδεμένοι με σχετικά κεφάλαια
- **Ενσωμάτωση Εργαστηρίου**: Πρακτικά εργαστήρια αντιστοιχισμένα σε πολλαπλούς στόχους μάθησης κεφαλαίων

#### Αλλαγές
- **Πρόοδος Μάθησης**: Μετακινήθηκε από γραμμική τεκμηρίωση σε ευέλικτη μάθηση βασισμένη σε κεφάλαια
- **Τοποθέτηση Διαμόρφωσης**: Οδηγός διαμόρφωσης επανατοποθετήθηκε ως Κεφάλαιο 3 για καλύτερο ροή μάθησης
- **Ενσωμάτωση Περιεχομένου AI**: Καλύτερη ενσωμάτωση περιεχομένου σχετικού με AI καθ’ όλη τη διαδρομή μάθησης
- **Παραγωγικό Περιεχόμενο**: Προηγμένα μοτίβα συγκεντρωμένα στο Κεφάλαιο 8 για εκπαιδευόμενους επιχειρήσεων

#### Βελτιώσεις
- **Εμπειρία Χρήστη**: Σαφή breadcrumbs πλοήγησης και δείκτες προόδου κεφαλαίων
- **Προσβασιμότητα**: Συνεπείς ροές πλοήγησης για ευκολότερη περιήγηση στο μάθημα
- **Επαγγελματική Παρουσίαση**: Δομή μαθήματος κατάλληλη για πανεπιστημιακή και εταιρική εκπαίδευση
- **Αποδοτικότητα Μάθησης**: Μείωση χρόνου εύρεσης σχετικού περιεχομένου μέσω βελτιωμένης οργάνωσης

#### Τεχνική Υλοποίηση
- **Επικεφαλίδες Πλοήγησης**: Τυποποιημένη πλοήγηση κεφαλαίων σε 40+ αρχεία τεκμηρίωσης
- **Υποσέλιδο Πλοήγησης**: Συνεπής καθοδήγηση προόδου και δείκτες ολοκλήρωσης κεφαλαίων
- **Ενδοσυνδέσεις**: Ολοκληρωμένο σύστημα εσωτερικών συνδέσμων που συνδέει σχετικές έννοιες
- **Αντιστοίχηση Κεφαλαίων**: Πρότυπα και παραδείγματα καθαρά συσχετισμένα με στόχους μάθησης

#### Βελτίωση Οδηγού Μελέτης
- **📚 Ολοκληρωμένοι Στόχοι Μάθησης**: Αναδιαρθρωμένος οδηγός μελέτης για να ευθυγραμμιστεί με σύστημα 8 κεφαλαίων
- **🎯 Αξιολόγηση Βασισμένη σε Κεφάλαια**: Κάθε κεφάλαιο περιλαμβάνει συγκεκριμένους στόχους μάθησης και πρακτικές ασκήσεις
- **📋 Παρακολούθηση Προόδου**: Εβδομαδιαίο πρόγραμμα μάθησης με μετρήσιμα αποτελέσματα και λίστα ελέγχου ολοκλήρωσης
- **❓ Ερωτήσεις Αξιολόγησης**: Ερωτήσεις επαλήθευσης γνώσης για κάθε κεφάλαιο με επαγγελματικά αποτελέσματα
- **🛠️ Πρακτικές Ασκήσεις**: Δραστηριότητες hands-on με πραγματικά σενάρια ανάπτυξης και επίλυσης προβλημάτων
- **📊 Πρόοδος Δεξιοτήτων**: Σαφής προώθηση από βασικές έννοιες σε επιχειρησιακά μοτίβα με έμφαση στην καριέρα
- **🎓 Πλαίσιο Πιστοποίησης**: Αποτελέσματα επαγγελματικής ανάπτυξης και σύστημα αναγνώρισης από την κοινότητα
- **⏱️ Διαχείριση Χρονοδιαγράμματος**: Δομημένο πρόγραμμα μάθησης 10 εβδομάδων με επικύρωση ορόσημων

### [v3.1.0] - 2025-09-17

#### Βελτιωμένες Λύσεις Πολυ-Πράκτορα AI
**Αυτή η έκδοση βελτιώνει τη λύση retail πολλαπλών πρακτόρων με καλύτερη ονομασία πρακτόρων και βελτιωμένη τεκμηρίωση.**

#### Αλλαγές
- **Ορολογία Πολλαπλών Πρακτόρων**: Αντικαταστάθηκε το "Cora agent" με "Customer agent" σε όλο το λιανικό πολυπρακτορικό λύση για πιο σαφή κατανόηση
- **Αρχιτεκτονική Πράκτορα**: Ενημερώθηκαν όλα τα έγγραφα, πρότυπα ARM και παραδείγματα κώδικα για να χρησιμοποιούν συνεπή ονομασία "Customer agent"
- **Παραδείγματα Ρυθμίσεων**: Εκσυγχρονίστηκαν τα πρότυπα ρύθμισης πράκτορα με ενημερωμένες ονομαστικές συμβάσεις
- **Συνέπεια Τεκμηρίωσης**: Διασφαλίστηκε ότι όλες οι αναφορές χρησιμοποιούν επαγγελματικά, περιγραφικά ονόματα πρακτόρων

#### Βελτιωμένα
- **Πακέτο Προτύπου ARM**: Ενημερώθηκε το retail-multiagent-arm-template με αναφορές Customer agent
- **Διαγράμματα Αρχιτεκτονικής**: Ανανεώθηκαν διαγράμματα Mermaid με ενημερωμένη ονομασία πρακτόρων
- **Παραδείγματα Κώδικα**: Κλάσεις Python και παραδείγματα υλοποίησης χρησιμοποιούν τώρα την ονομασία CustomerAgent
- **Μεταβλητές Περιβάλλοντος**: Ενημερώθηκαν όλα τα σενάρια ανάπτυξης για χρήση συμβάσεων CUSTOMER_AGENT_NAME

#### Βελτιωμένα
- **Εμπειρία Προγραμματιστή**: Πιο σαφείς ρόλοι και ευθύνες πρακτόρων στην τεκμηρίωση
- **Ετοιμότητα Παραγωγής**: Καλύτερος συγχρονισμός με τις ονομαστικές συμβάσεις επιχειρήσεων
- **Μαθησιακό Υλικό**: Πιο διαισθητική ονομασία πρακτόρων για εκπαιδευτικούς σκοπούς
- **Χρηστικότητα Προτύπου**: Απλοποιημένη κατανόηση των λειτουργιών πρακτόρων και προτύπων ανάπτυξης

#### Τεχνικές Λεπτομέρειες
- Ενημερώθηκαν τα διαγράμματα αρχιτεκτονικής Mermaid με αναφορές CustomerAgent
- Αντικαταστάθηκαν τα ονόματα κλάσεων CoraAgent με CustomerAgent στα παραδείγματα Python
- Τροποποιήθηκαν οι ρυθμίσεις JSON προτύπου ARM για χρήση του τύπου πράκτορα "customer"
- Ενημερώθηκαν οι μεταβλητές περιβάλλοντος από CORA_AGENT_* σε CUSTOMER_AGENT_*
- Ανανεώθηκαν όλες οι εντολές ανάπτυξης και οι ρυθμίσεις κοντέινερ

### [v3.0.0] - 2025-09-12

#### Σημαντικές Αλλαγές - Εστίαση σε AI Developer και Ενσωμάτωση Microsoft Foundry
**Αυτή η έκδοση μετατρέπει το αποθετήριο σε ολοκληρωμένο μαθησιακό πόρο εστιασμένο στην AI με ενσωμάτωση Microsoft Foundry.**

#### Προστέθηκαν
- **🤖 AI-First Διαδρομή Μάθησης**: Πλήρης αναδιάρθρωση με προτεραιότητα στους προγραμματιστές και μηχανικούς AI
- **Οδηγός Ενσωμάτωσης Microsoft Foundry**: Ενδελεχής τεκμηρίωση σύνδεσης AZD με υπηρεσίες Microsoft Foundry
- **Πρότυπα Ανάπτυξης Μοντέλων AI**: Λεπτομερής οδηγός για επιλογή μοντέλου, ρύθμιση και στρατηγικές παραγωγικής ανάπτυξης
- **Εργαστήριο AI Workshop**: Εργαστήριο 2-3 ωρών με πρακτική για μετατροπή εφαρμογών AI σε λύσεις αναπτύξιμες με AZD
- **Βέλτιστες Πρακτικές Παραγωγικής AI**: Πρότυπα έτοιμα για επιχείρηση για κλιμάκωση, παρακολούθηση και ασφάλεια φορτίων εργασίας AI
- **Οδηγός Επίλυσης Προβλημάτων AI**: Ενδελεχής καθοδήγηση για προβλήματα Microsoft Foundry Models, Cognitive Services και ανάπτυξης AI
- **Πανόραμα Προτύπων AI**: Επιλεγμένη συλλογή προτύπων Microsoft Foundry με βαθμολογίες πολυπλοκότητας
- **Υλικό Εργαστηρίου**: Πλήρης δομή εργαστηρίου με πρακτικά εργαστήρια και αναφορικά υλικά

#### Βελτιωμένα
- **Δομή README**: Εστιασμένη σε προγραμματιστές AI με δεδομένα 45% ενδιαφέροντος κοινότητας από Microsoft Foundry Discord
- **Διαδρομές Μάθησης**: Αφιερωμένη πορεία AI παράλληλα με παραδοσιακές για φοιτητές και μηχανικούς DevOps
- **Συστάσεις Προτύπων**: Επιλεγμένα πρότυπα AI όπως azure-search-openai-demo, contoso-chat και openai-chat-app-quickstart
- **Ενσωμάτωση Κοινότητας**: Ενισχυμένη υποστήριξη κοινότητας στο Discord με καναλι AI και συζητήσεις

#### Εστίαση Ασφάλειας & Παραγωγής
- **Πρότυπα Διαχειριζόμενης Ταυτότητας**: Εκδόσεις πιστοποίησης και ασφάλειας ειδικές για AI
- **Βελτιστοποίηση Κόστους**: Παρακολούθηση χρήσης token και έλεγχοι προϋπολογισμού για φορτία εργασίας AI
- **Ανάπτυξη σε Πολλαπλές Περιοχές**: Στρατηγικές για παγκόσμια ανάπτυξη εφαρμογών AI
- **Παρακολούθηση Απόδοσης**: Μετρικά ειδικά για AI και ενσωμάτωση Application Insights

#### Ποιότητα Τεκμηρίωσης
- **Γραμμική Δομή Μαθήματος**: Λογική προοδική ροή από αρχάριους σε προχωρημένα πρότυπα ανάπτυξης AI
- **Επαληθευμένα URL**: Όλοι οι σύνδεσμοι σε εξωτερικά αποθετήρια ελέγχθηκαν και είναι προσβάσιμοι
- **Πλήρης Αναφορά**: Όλες οι εσωτερικές συνδέσεις τεκμηρίωσης έχουν επικυρωθεί κι λειτουργούν
- **Έτοιμο για Παραγωγή**: Πρότυπα ανάπτυξης επιχείρησης με πραγματικά παραδείγματα

### [v2.0.0] - 2025-09-09

#### Σημαντικές Αλλαγές - Αναδιάρθρωση Αποθετηρίου και Επαγγελματική Βελτίωση
**Αυτή η έκδοση αντιπροσωπεύει  σημαντική αναθεώρηση της δομής αποθετηρίου και της παρουσίασης περιεχομένου.**

#### Προστέθηκαν
- **Δομημένο Πλαίσιο Μάθησης**: Όλες οι σελίδες τεκμηρίωσης περιλαμβάνουν τώρα Εισαγωγή, Στόχους Μάθησης, και Αποτελέσματα Μάθησης
- **Σύστημα Πλοήγησης**: Προστέθηκαν σύνδεσμοι προηγούμενου/επόμενου μαθήματος σε όλη την τεκμηρίωση για καθοδηγούμενη πρόοδο μάθησης
- **Οδηγός Μελέτης**: Πλήρης study-guide.md με μαθησιακούς στόχους, ασκήσεις πρακτικής και υλικά αξιολόγησης
- **Επαγγελματική Παρουσίαση**: Αφαιρέθηκαν όλα τα εικονίδια emoji για βελτιωμένη προσβασιμότητα και επαγγελματική εμφάνιση
- **Ενισχυμένη Δομή Περιεχομένου**: Βελτιωμένη οργάνωση και ροή μαθησιακού υλικού

#### Αλλαγές
- **Μορφή Τεκμηρίωσης**: Τυποποιήθηκε όλη η τεκμηρίωση με συνεπή δομή εστιασμένη στη μάθηση
- **Ροή Πλοήγησης**: Εφαρμόστηκε λογική προοδική ροή σε όλο το μαθησιακό υλικό
- **Παρουσίαση Περιεχομένου**: Αφαιρέθηκαν διακοσμητικά στοιχεία υπέρ καθαρής, επαγγελματικής μορφοποίησης
- **Δομή Συνδέσμων**: Ενημερώθηκαν όλοι οι εσωτερικοί σύνδεσμοι για την υποστήριξη του νέου συστήματος πλοήγησης

#### Βελτιωμένα
- **Προσβασιμότητα**: Αφαιρέθηκαν εξαρτήσεις emoji για καλύτερη συμβατότητα με αναγνώστες οθόνης
- **Επαγγελματική Εμφάνιση**: Καθαρή, ακαδημαϊκού τύπου παρουσίαση κατάλληλη για μάθηση σε επιχειρήσεις
- **Εμπειρία Μάθησης**: Δομημένη προσέγγιση με σαφείς στόχους και αποτελέσματα για κάθε μάθημα
- **Οργάνωση Περιεχομένου**: Καλύτερη λογική ροή και σύνδεση μεταξύ σχετικών θεμάτων

### [v1.0.0] - 2025-09-09

#### Αρχική Έκδοση - Ολοκληρωμένο Αποθετήριο Μάθησης AZD

#### Προστέθηκαν
- **Κύρια Δομή Τεκμηρίωσης**
  - Πλήρης σειρά οδηγών εισαγωγής
  - Εκτενής τεκμηρίωση ανάπτυξης και παροχής υποδομών
  - Αναλυτικοί πόροι επίλυσης προβλημάτων και οδηγοί αποσφαλμάτωσης
  - Εργαλεία και διαδικασίες επικύρωσης πριν από την ανάπτυξη

- **Μονάδα Εισαγωγής**
  - Βασικά AZD: Κύριες έννοιες και ορολογία
  - Οδηγός Εγκατάστασης: Οδηγίες ρύθμισης ανά πλατφόρμα
  - Οδηγός Ρύθμισης: Ρύθμιση περιβάλλοντος και πιστοποίηση
  - Πρώτο Μαθησιακό Έργο: Βήμα προς βήμα πρακτική εκμάθηση

- **Μονάδα Ανάπτυξης και Παροχής Υποδομών**
  - Οδηγός Ανάπτυξης: Πλήρης τεκμηρίωση ροής εργασίας
  - Οδηγός Παροχής Υποδομής: Υποδομή ως Κώδικας με Bicep
  - Βέλτιστες πρακτικές για παραγωγική ανάπτυξη
  - Πρότυπα πολυ-υπηρεσιακής αρχιτεκτονικής

- **Μονάδα Επικύρωσης πριν την Ανάπτυξη**
  - Σχεδιασμός Χωρητικότητας: Επικύρωση διαθεσιμότητας πόρων Azure
  - Επιλογή SKU: Οδηγίες για επίπεδα υπηρεσιών
  - Έλεγχοι Πτήσης: Αυτοματοποιημένα σενάρια επικύρωσης (PowerShell και Bash)
  - Εκτίμηση κόστους και εργαλεία προγραμματισμού προϋπολογισμού

- **Μονάδα Επίλυσης Προβλημάτων**
  - Συνήθη Προβλήματα: Συχνά ζητήματα και λύσεις
  - Οδηγός Αποσφαλμάτωσης: Συστηματικές μεθοδολογίες επίλυσης προβλημάτων
  - Προηγμένες διαγνωστικές τεχνικές και εργαλεία
  - Παρακολούθηση και βελτιστοποίηση απόδοσης

- **Πόροι και Αναφορές**
  - Φύλλο Γρήγορης Αναφοράς Εντολών: Γρήγορη αναφορά βασικών εντολών
  - Γλωσσάριο: Πλήρης ορολογία και ορισμοί ακρωνυμίων
  - Συχνές Ερωτήσεις: Αναλυτικές απαντήσεις σε κοινές ερωτήσεις
  - Εξωτερικοί σύνδεσμοι και συνδέσεις κοινότητας

- **Παραδείγματα και Πρότυπα**
  - Απλό παράδειγμα web εφαρμογής
  - Πρότυπο ανάπτυξης στατικού ιστοτόπου
  - Ρυθμίσεις εφαρμογής κοντέινερ
  - Πρότυπα ολοκλήρωσης βάσης δεδομένων
  - Παραδείγματα αρχιτεκτονικής μικροϋπηρεσιών
  - Υλοποιήσεις serverless λειτουργιών

#### Χαρακτηριστικά
- **Υποστήριξη Πολλαπλών Πλατφορμών**: Οδηγοί εγκατάστασης και ρύθμισης για Windows, macOS και Linux
- **Διάφορα Επίπεδα Δεξιοτήτων**: Περιεχόμενο σχεδιασμένο για φοιτητές έως και επαγγελματίες προγραμματιστές
- **Πρακτική Εστίαση**: Πρακτικά παραδείγματα και σενάρια πραγματικού κόσμου
- **Ολοκληρωμένη Κάλυψη**: Από βασικές έννοιες έως προχωρημένα πρότυπα επιχειρήσεων
- **Προσέγγιση Ασφάλειας Πρώτα**: Ενσωμάτωση βέλτιστων πρακτικών ασφάλειας σε όλο το υλικό
- **Βελτιστοποίηση Κόστους**: Οδηγίες για οικονομικά αποδοτικές αναπτύξεις και διαχείριση πόρων

#### Ποιότητα Τεκμηρίωσης
- **Αναλυτικά Παραδείγματα Κώδικα**: Πρακτικά, δοκιμασμένα δείγματα κώδικα
- **Οδηγίες Βήμα-βήμα**: Καθαρή, εφαρμόσιμη καθοδήγηση
- **Ολοκληρωμένη Διαχείριση Σφαλμάτων**: Επίλυση κοινών ζητημάτων
- **Ενσωμάτωση Βέλτιστων Πρακτικών**: Πρότυπα κλάδου και συστάσεις
- **Συμβατότητα Εκδόσεων**: Ενημερωμένο με τις τελευταίες υπηρεσίες Azure και δυνατότητες azd

## Προγραμματισμένες Μελλοντικές Βελτιώσεις

### Έκδοση 3.1.0 (Προγραμματισμένη)
#### Επέκταση Πλατφόρμας AI
- **Υποστήριξη Πολλαπλών Μοντέλων**: Πρότυπα ενσωμάτωσης για Hugging Face, Azure Machine Learning και προσαρμοσμένα μοντέλα
- **Πλαίσια Πρακτόρων AI**: Πρότυπα για LangChain, Semantic Kernel, και ανάπτυξη AutoGen
- **Προηγμένα Πρότυπα RAG**: Επιλογές βάσεων δεδομένων vector πέρα από Azure AI Search (Pinecone, Weaviate κ.α.)
- **Παρατηρησιμότητα AI**: Ενισχυμένη παρακολούθηση απόδοσης μοντέλων, χρήσης token και ποιότητας απόκρισης

#### Εμπειρία Προγραμματιστή
- **Επέκταση VS Code**: Ενοποιημένη εμπειρία ανάπτυξης AZD + Microsoft Foundry
- **Ενσωμάτωση GitHub Copilot**: Γεννήτρια προτύπων AZD με υποστήριξη AI
- **Διαδραστικά Μαθήματα**: Πρακτικές ασκήσεις κωδικοποίησης με αυτοματοποιημένη επικύρωση για σενάρια AI
- **Βιντεομαθήματα**: Συμπληρωματικά βίντεο μαθημάτων για οπτικούς μαθητές έμφαση στις αναπτύξεις AI

### Έκδοση 4.0.0 (Προγραμματισμένη)
#### Σχέδια Επιχειρησιακής AI
- **Πλαίσιο Διακυβέρνησης**: Διακυβέρνηση μοντέλων AI, συμμόρφωση και ίχνη ελέγχου
- **Πολυ-ενοικιαστική AI**: Πρότυπα για εξυπηρέτηση πολλαπλών πελατών με απομονωμένες υπηρεσίες AI
- **Ανάπτυξη Edge AI**: Ενσωμάτωση με Azure IoT Edge και περιπτώσεις κοντέινερ
- **Υβριδικό Cloud AI**: Πρότυπα πολυ-υπολογιστικού νέφους και υβριδικής ανάπτυξης για φορτία AI

#### Προηγμένα Χαρακτηριστικά
- **Αυτοματοποίηση Pipeline AI**: Ενσωμάτωση MLOps με pipelines Azure Machine Learning
- **Προηγμένη Ασφάλεια**: Πρότυπα μηδενικής εμπιστοσύνης, ιδιωτικά άκρα και προηγμένη προστασία απειλών
- **Βελτιστοποίηση Απόδοσης**: Προηγμένες στρατηγικές ρύθμισης και κλιμάκωσης υψηλής απόδοσης AI εφαρμογών
- **Παγκόσμια Διανομή**: Πρότυπα διανομής περιεχομένου και προσωρινής αποθήκευσης edge για AI εφαρμογές

### Έκδοση 3.0.0 (Προγραμματισμένη) - Υπερκεράστηκε από την Τρέχουσα Έκδοση
#### Προτεινόμενες Προσθήκες - Τώρα Υλοποιημένες στην v3.0.0
- ✅ **Περιεχόμενο με Εστίαση στην AI**: Ολοκληρωμένη ενσωμάτωση Microsoft Foundry (Ολοκληρώθηκε)
- ✅ **Διαδραστικά Μαθήματα**: Πρακτικό εργαστήριο AI (Ολοκληρώθηκε)
- ✅ **Προηγμένη Μονάδα Ασφάλειας**: Πρωτότυπα ασφάλειας ειδικά για AI (Ολοκληρώθηκε)
- ✅ **Βελτιστοποίηση Απόδοσης**: Στρατηγικές ρύθμισης φορτίων AI (Ολοκληρώθηκε)

### Έκδοση 2.1.0 (Προγραμματισμένη) - Μερικώς Υλοποιημένη στην v3.0.0
#### Μικρές Βελτιώσεις - Κάποιες Ολοκληρωμένες στην Τρέχουσα Έκδοση
- ✅ **Επιπλέον Παραδείγματα**: Σενάρια ανάπτυξης με εστίαση στην AI (Ολοκληρώθηκε)
- ✅ **Εκτεταμένες FAQ**: Ερωτήματα και επίλυση θεμάτων ειδικών για AI (Ολοκληρώθηκε)
- **Ενσωμάτωση Εργαλείων**: Οδηγοί ενισχυμένης ενσωμάτωσης IDE και επεξεργαστή
- ✅ **Επέκταση Παρακολούθησης**: Μοντέλα παρακολούθησης και ειδοποίησης ειδικά για AI (Ολοκληρώθηκε)

#### Ακόμα Προγραμματισμένα για Μελλοντική Έκδοση
- **Φιλική προς κινητά Τεκμηρίωση**: Σχεδιασμός ανταποκρισης για κινητές συσκευές
- **Πρόσβαση Offline**: Πακέτα τεκμηρίωσης για λήψη
- **Ενισχυμένη Ενσωμάτωση IDE**: Επέκταση VS Code για AZD + ροές εργασίας AI
- **Ταμπλό Κοινότητας**: Μετρικές σε πραγματικό χρόνο και παρακολούθηση συνεισφορών κοινότητας

## Συμμετοχή στο Αρχείο Αλλαγών

### Αναφορά Αλλαγών
Κατά τη συμβολή σε αυτό το αποθετήριο, βεβαιωθείτε ότι οι εγγραφές αρχείου αλλαγών περιλαμβάνουν:

1. **Αριθμός Έκδοσης**: Σύμφωνα με τη σημασιολογική έκδοση (major.minor.patch)
2. **Ημερομηνία**: Ημερομηνία κυκλοφορίας ή ενημέρωσης σε μορφή YYYY-MM-DD
3. **Κατηγορία**: Προστέθηκε, Αλλάχθηκε, Αποσυρμένο, Αφαιρέθηκε, Διορθώθηκε, Ασφάλεια
4. **Σαφής Περιγραφή**: Συνοπτική περιγραφή της αλλαγής
5. **Αξιολόγηση Επίπτωσης**: Πώς οι αλλαγές επηρεάζουν τους υπάρχοντες χρήστες

### Κατηγορίες Αλλαγών

#### Προστέθηκαν
- Νέες δυνατότητες, ενότητες τεκμηρίωσης ή λειτουργίες
- Νέα παραδείγματα, πρότυπα ή εκπαιδευτικοί πόροι
- Πρόσθετα εργαλεία, σκριπτά ή βοηθητικά προγράμματα

#### Αλλάχθηκαν
- Τροποποιήσεις υπάρχουσας λειτουργικότητας ή τεκμηρίωσης
- Ενημερώσεις για βελτίωση σαφήνειας ή ακρίβειας
- Αναδιάρθρωση περιεχομένου ή οργάνωσης

#### Αποσυρμένα
- Λειτουργίες ή προσπελάσεις που σταδιακά καταργούνται
- Ενότητες τεκμηρίωσης προγραμματισμένες για αφαίρεση
- Μέθοδοι με καλύτερες εναλλακτικές

#### Αφαιρέθηκαν
- Λειτουργίες, τεκμηρίωση ή παραδείγματα που δεν είναι πλέον σχετικά
- Πληροφορίες εκτός ημερομηνίας ή αποσυρμένες προσεγγίσεις
- Πλεονασματικό ή ενοποιημένο περιεχόμενο

#### Διορθώθηκαν
- Διορθώσεις σφαλμάτων σε τεκμηρίωση ή κώδικα
- Επίλυση αναφερόμενων ζητημάτων ή προβλημάτων
- Βελτιώσεις στην ακρίβεια ή λειτουργικότητα

#### Ασφάλεια
- Βελτιώσεις ή διορθώσεις σχετικές με την ασφάλεια
- Ενημερώσεις στις βέλτιστες πρακτικές ασφάλειας
- Επίλυση ευπαθειών ασφαλείας

### Οδηγίες Σημασιολογικής Έκδοσης

#### Μεγάλη Έκδοση (X.0.0)
- Αλλαγές ασυμβίβαστες που απαιτούν δράση από τον χρήστη
- Σημαντική αναδιάρθρωση περιεχομένου ή οργάνωσης
- Αλλαγές που τροποποιούν τη θεμελιώδη προσέγγιση ή μεθοδολογία

#### Μικρή Έκδοση (X.Y.0)
- Νέες λειτουργίες ή προσθήκες περιεχομένου
- Βελτιώσεις που διατηρούν συμβατότητα με προηγούμενες εκδόσεις
- Πρόσθετα παραδείγματα, εργαλεία ή πόροι

#### Έκδοση Διόρθωσης (X.Y.Z)
- Διορθώσεις σφαλμάτων και διορθώσεις
- Μικρές βελτιώσεις σε υπάρχον περιεχόμενο
- Διευκρινίσεις και μικρές ενισχύσεις

## Ανατροφοδότηση και Προτάσεις Κοινότητας

Ενθαρρύνουμε ενεργά την ανατροφοδότηση της κοινότητας για βελτίωση αυτού του μαθησιακού πόρου:

### Πώς να Δώσετε Ανατροφοδότηση
- **GitHub Issues**: Αναφέρετε προβλήματα ή προτείνετε βελτιώσεις (ειδικά θέματα AI ευπρόσδεκτα)
- **Συζητήσεις Discord**: Μοιραστείτε ιδέες και συμμετέχετε με την κοινότητα Microsoft Foundry
- **Pull Requests**: Συνεισφέρετε άμεσα βελτιώσεις στο περιεχόμενο, ειδικά σε πρότυπα και οδηγούς AI
- **Microsoft Foundry Discord**: Συμμετέχετε στο κανάλι #Azure για συζητήσεις AZD + AI
- **Φόρουμ Κοινότητας**: Συμμετοχή σε ευρύτερες συζητήσεις προγραμματιστών Azure

### Κατηγορίες Ανατροφοδότησης
- **Ακρίβεια Περιεχομένου AI**: Διορθώσεις στην ενσωμάτωση υπηρεσιών AI και πληροφορίες ανάπτυξης
- **Εμπειρία Μάθησης**: Προτάσεις για βελτιωμένη ροή μάθησης προγραμματιστών AI
- **Ελλείπον Περιεχόμενο AI**: Αιτήματα για επιπλέον πρότυπα, πρότυπα ή παραδείγματα AI
- **Προσβασιμότητα**: Βελτιώσεις για ποικίλες ανάγκες μάθησης
- **Ενσωμάτωση Εργαλείων AI**: Προτάσεις για καλύτερη ενσωμάτωση ροής εργασιών ανάπτυξης AI
- **Πρότυπα Παραγωγικής AI**: Αιτήματα προτύπων ανάπτυξης AI για επιχειρήσεις

### Δέσμευση Απάντησης
- **Απάντηση σε Θέματα**: Εντός 48 ωρών για αναφερόμενα προβλήματα
- **Αξιολόγηση Αιτημάτων Χαρακτηριστικών**: Εντός μιας εβδομάδας
- **Αξιολόγηση Συνεισφορών Κοινότητας**: Εντός μιας εβδομάδας
- **Προτεραιότητα σε Θέματα Ασφάλειας**: Άμεση προσοχή με γρήγορη απόκριση

## Πρόγραμμα Συντήρησης

### Κανονικές Ενημερώσεις
- **Μηνιαίοι Έλεγχοι**: Ακρίβεια περιεχομένου και επικύρωση συνδέσμων
- **Τριμηνιαίες Ενημερώσεις**: Σημαντικές προσθήκες και βελτιώσεις περιεχομένου
- **Εξαμηνιαίοι Έλεγχοι**: Ολοκληρωμένη αναδιάρθρωση και βελτίωση
- **Ετήσιες Εκδόσεις**: Μεγάλες αναβαθμίσεις έκδοσης με σημαντικές βελτιώσεις

### Παρακολούθηση και Διασφάλιση Ποιότητας
- **Αυτοματοποιημένος Έλεγχος**: Τακτική επαλήθευση των παραδειγμάτων κώδικα και των συνδέσμων
- **Ενσωμάτωση Ανατροφοδότησης από την Κοινότητα**: Τακτική ενσωμάτωση προτάσεων χρηστών
- **Ενημερώσεις Τεχνολογίας**: Ευθυγράμμιση με τις τελευταίες υπηρεσίες Azure και κυκλοφορίες azd
- **Έλεγχοι Προσβασιμότητας**: Τακτική ανασκόπηση για αρχές σχεδιασμού που περιλαμβάνουν όλους

## Πολιτική Υποστήριξης Έκδοσης

### Υποστήριξη Τρέχουσας Έκδοσης
- **Τελευταία Μεγάλη Έκδοση**: Πλήρης υποστήριξη με τακτικές ενημερώσεις
- **Προηγούμενη Μεγάλη Έκδοση**: Ενημερώσεις ασφαλείας και κρίσιμες διορθώσεις για 12 μήνες
- **Παλιότερες Εκδόσεις**: Μόνο υποστήριξη από την κοινότητα, χωρίς επίσημες ενημερώσεις

### Οδηγίες Μεταφοράς
Όταν κυκλοφορούν μεγάλες εκδόσεις, παρέχουμε:
- **Οδηγοί Μεταφοράς**: Βήμα-βήμα οδηγίες μετάβασης
- **Σημειώσεις Συμβατότητας**: Λεπτομέρειες για τις αλλαγές που σπάνε τη συμβατότητα
- **Υποστήριξη Εργαλείων**: Σενάρια ή βοηθητικά προγράμματα για τη διευκόλυνση της μεταφοράς
- **Υποστήριξη Κοινότητας**: Αφιερωμένα φόρουμ για ερωτήσεις σχετικά με τη μεταφορά

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Οδηγός Μελέτης](resources/study-guide.md)
- **Επόμενο Μάθημα**: Επιστροφή στο [Κύριο README](README.md)

**Μείνετε Ενημερωμένοι**: Παρακολουθήστε αυτό το αποθετήριο για ειδοποιήσεις σχετικά με νέες κυκλοφορίες και σημαντικές ενημερώσεις στα εκπαιδευτικά υλικά.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->