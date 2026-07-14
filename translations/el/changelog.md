# Αλλαγές - AZD Για Αρχάριους

## Εισαγωγή

Αυτό το αρχείο αλλαγών καταγράφει όλες τις αξιοσημείωτες αλλαγές, ενημερώσεις και βελτιώσεις στο αποθετήριο AZD Για Αρχάριους. Ακολουθούμε τις αρχές της σημασιολογικής εκδόσεως και διατηρούμε αυτό το αρχείο για να βοηθήσουμε τους χρήστες να κατανοήσουν τι έχει αλλάξει μεταξύ των εκδόσεων.

## Στόχοι Μάθησης

Με την ανασκόπηση αυτού του αρχείου αλλαγών, θα:
- Μείνετε ενημερωμένοι για νέες λειτουργίες και προσθήκες περιεχομένου
- Κατανοήσετε τις βελτιώσεις που έγιναν στην υπάρχουσα τεκμηρίωση
- Παρακολουθείτε τις διορθώσεις σφαλμάτων και διορθώσεις για να εξασφαλίσετε ακρίβεια
- Ακολουθείτε την εξέλιξη των μαθησιακών υλικών με την πάροδο του χρόνου

## Αποτελέσματα Μάθησης

Μετά την ανασκόπηση των καταχωρήσεων αρχείου αλλαγών, θα μπορείτε να:
- Αναγνωρίζετε νέο περιεχόμενο και πόρους διαθέσιμους για μάθηση
- Κατανοείτε ποιες ενότητες έχουν ενημερωθεί ή βελτιωθεί
- Σχεδιάζετε τη μαθησιακή διαδρομή σας με βάση τα πιο τρέχοντα υλικά
- Συμβάλλετε με σχόλια και προτάσεις για μελλοντικές βελτιώσεις

## Ιστορικό Εκδόσεων

### [v3.23.0] - 2026-07-13

#### Ανανεωμένη Έκδοση AZD 1.27.1: Ενημέρωση Νομισμάτων Έκδοσης
**Αυτή η έκδοση επανελέγχει το μάθημα έναντι του `azd` `1.27.1` (Ιούλιος 2026, πιο πρόσφατη σταθερή έκδοση) και της τρέχουσας επέκτασης προεπισκόπησης AI agent `azure.ai.agents` `1.0.0-beta.5`, φέρνοντας κάθε μπάνερ "ελεγμένο έναντι" στην πιο πρόσφατη κατάσταση μετά τις εκδόσεις 1.26.0, 1.27.0 και 1.27.1.**

#### Αλλαγές
- **✅ Η βάση επικύρωσης ενημερώθηκε** από `azd 1.25.6` (Ιούνιος 2026) σε `azd 1.27.1` (Ιούλιος 2026) σε όλο το αρχικό README, όλα τα README κεφαλαίων, το μάθημα του Chapter 1 dev-container (συμπεριλαμβανομένων παραδειγμάτων με πινέζα έκδοσης), το μάθημα προσαρμοσμένων προτύπων του Chapter 4, το μάθημα πολλαπλών πρακτόρων του Chapter 5, και τα έγγραφα εργαστηρίου
- **🤖 Ανανέωση βάσης του Chapter 2** από `azd 1.23.12` (Μάρτιος 2026) σε `azd 1.27.1` στα `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, και `microsoft-foundry-integration.md`; ενημέρωση ημερομηνιών σημειώσεων επικύρωσης σε 2026-07-13
- **🧩 Αναβάθμιση επέκτασης AI agent** από `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` στην τρέχουσα έκδοση `1.0.0-beta.5` στο README του Chapter 2 και στο `agents.md`
- **🧪 Παράδειγμα επικύρωσης εργαστηρίου** (έξοδος `azd version`) ενημερώθηκε σε `1.27.1`

#### Σημειώσεις για σχετικές εκδόσεις azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Υποστήριξη Go για Azure Functions στο Flex Consumption, φίλτρα συνδρομής ανά μισθωτή `azd config sub-filter`, αυτόνομα πακέτα επεκτάσεων (`azd x pack --bundle`), και `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Άμεση μοντελοποίηση έργων/πρακτόρων Azure AI Foundry σε `azure.yaml` (έναρξη χωρίς Bicep ή Terraform), υποστήριξη ανάπτυξης container για App Service (`host: appservice` + `language: docker`), απευθείας `-s/--source` για εντολές `azd extension`, και `azd tool uninstall`
- **1.27.1 (2026-07-09):** Σημαία `--no-dependencies` για `azd extension install`, εξαιρούνται αυτόματα παρωχημένα μοντέλα από προτροπές καταλόγου/ποσόστωσης, και διάφορες διορθώσεις σφαλμάτων

#### Ενημερωμένα Αρχεία
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

#### Συμπλήρωμα Κενών για Αρχάριους #2: Δημιουργία Προτύπων, Dev Containers, Pulumi, Azure DevOps, Εξουσιοδοτήσεις Υπηρεσίας και Άλλα
**Αυτή η έκδοση κλείνει τα ενδιάμεσα κενά που εντοπίστηκαν από την ανάλυση azd-coverage: πώς να δημιουργήσετε και να δημοσιεύσετε το δικό σας πρότυπο, επαναπαραγόμενα περιβάλλοντα dev-container/Codespaces, τον πάροχο υποδομής Pulumi, μια περιήγηση CI/CD στο Azure DevOps, αυθεντικοποίηση εξουσιοδότησης υπηρεσίας, οδηγίες επιλογής host (AKS/Spring Apps), εξηγήσεις για `azd restore`/`azd package`, χειρισμό σφαλμάτων hooks, και πρακτικές ομαδικού/κοινού περιβάλλοντος.**

#### Προσθήκες
- **🧱 Νέο μάθημα Chapter 4** `docs/chapter-04-infrastructure/custom-templates.md` — δημιουργία του δικού σας προτύπου azd: απαιτούμενη δομή (`azure.yaml`, `infra/`, `src/`), το πεδίο `metadata.template`, παραμετροποίηση υποδομής με το μοναδικό αναγνωριστικό πόρου `uniqueString()` και ετικέτα `azd-env-name`, τοπικές δοκιμές με `azd init --template <local-path>`, δημοσίευση στο GitHub, και υποβολή στην συλλογή Awesome AZD
- **📦 Νέο μάθημα Chapter 1** `docs/chapter-01-foundation/dev-containers.md` — επαναπαραγόμενα περιβάλλοντα azd με Dev Containers και GitHub Codespaces: ένα ελάχιστο `.devcontainer/devcontainer.json` χρησιμοποιώντας το επίσημο χαρακτηριστικό `ghcr.io/azure/azure-dev/azd`, χαρακτηριστικά ανά γλώσσα, `docker-in-docker` για container hosts, και `azd auth login --use-device-code` για απομακρυσμένη σύνδεση
- **🧩 Pulumi με azd** ενότητα στο `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, διάταξη φακέλου Pulumi, στοίβες αντιστοιχισμένες σε περιβάλλοντα azd, απαιτούμενες εξαγωγές/ετικέτες, και η ίδια ροή εργασίας `azd up` / `azd down`
- **🎯 Οδηγίες επιλογής host** στο `docs/chapter-04-infrastructure/provisioning.md` — φιλική για αρχάριους σύγκριση μεταξύ `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, και `springapp`, με οδηγίες για το πότε να επιλέξετε AKS ή Azure Spring Apps
- **🛠️ Περιήγηση Azure DevOps CI/CD** στο `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, σύνδεση υπηρεσίας με ομοσπονδία ταυτότητας φόρτου εργασίας (OIDC), το παραγόμενο `azure-dev.yml`, και ρύθμιση ομάδας μεταβλητών
- **🔑 Υπηρεσιακοί Πράκτορες (Pattern 4)** προστέθηκε στο `docs/chapter-03-configuration/authsecurity.md` — δημιουργία με `az ad sp create-for-rbac`, μη αλληλεπιδραστικό `azd auth login` με μυστικό πελάτη σε σύγκριση με πιστοποιητικά ομοσπονδίας/OIDC, πότε να χρησιμοποιούνται, και ασφαλής αποθήκευση διαπιστευτηρίων
- **🪝 Υποενότητα χειρισμού σφαλμάτων hook** στο `docs/chapter-04-infrastructure/deployment-guide.md` — κωδικοί εξόδου και `set -e`, `continueOnError`, δοκιμές hooks απομονωμένα με `azd hooks run`, κελύφη ειδικά για το λειτουργικό σύστημα, και `--debug`
- **👥 Ομαδικά / κοινόχρηστα περιβάλλοντα** ενότητα στο `docs/chapter-03-configuration/configuration.md` — τι βρίσκεται στο `.azure/`, τι να αγνοείται στο git, περιβάλλοντα ανά προγραμματιστή, `azd env list`/`select`, και παροχή τιμών περιβάλλοντος σε CI/CD
- **🧰 Εξηγήσεις για `azd restore` και εκτεταμένο `azd package`** στο `resources/cheat-sheet.md` — αποκατάσταση εξαρτήσεων και κατασκευή αναπτύξιμου αντικειμένου χωρίς ανάπτυξη

#### Αλλαγές
- **🧭 Πίνακας μαθημάτων Chapter 4** ενημερώθηκε για να συμπεριλάβει το νέο μάθημα "Δημιουργώντας το δικό σας πρότυπο" (Μάθημα 3)
- **🧭 Πίνακας μαθημάτων Chapter 1** ενημερώθηκε για να προσθέσει το νέο μάθημα "Dev Containers & Codespaces" (Μάθημα 5); οι υποσέλιδες πλοήγησης συνδέουν μεταξύ `bring-your-own-app.md` και `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Συμπλήρωμα Κενών για Αρχάριους: Μάθημα Πολλαπλών Πρακτόρων με Πρακτική, "Φέρε τη δική σου Εφαρμογή", Terraform και Περιήγηση CI/CD
**Αυτή η έκδοση γεμίζει τα μεγαλύτερα κενά για έναν ολοκληρωμένο οδηγό αρχάριων με δύο νέα πρακτικά μαθήματα (μια αναπαραγωγίσιμη περιήγηση πολλαπλών πρακτόρων και η προσθήκη azd σε υπάρχουσα εφαρμογή), εισαγωγή φιλική σε αρχάριους στα hooks, ενότητα Terraform με azd, βήμα προς βήμα περιήγηση στο pipeline GitHub Actions, εξήγηση των νέων επεκτάσεων προεπισκόπησης, και έναν ρητό κατάλογο ελέγχου επαλήθευσης ανάπτυξης.**

#### Προσθήκες
- **🤝 Νέο μάθημα Chapter 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — μια πλήρως πρακτική, αναπτυσσόμενη περιήγηση με δύο πράκτορες (ορχηστρωτής + ειδικοί) χρησιμοποιώντας ένα πραγματικό πρότυπο (`contoso-creative-writer`), καλύπτοντας πότε να χρησιμοποιηθεί multi-agent, τη ροή εργασίας `azd up`, κατανόηση των αναπτυγμένων πόρων, διασταυρούμενη παρακολούθηση πρακτόρων, προσαρμογές, και καθαρισμό
- **📦 Νέο μάθημα Chapter 1** `docs/chapter-01-foundation/bring-your-own-app.md` — πώς να προσθέσετε azd σε υπάρχον έργο με `azd init` ("χρήση κώδικα στον τρέχοντα κατάλογο"), κατανόηση του `azure.yaml` και `infra/`, `azd infra generate`, ανίχνευση host, και ανάπτυξη με `azd up`
- **🌐 Ενότητα Terraform με azd** προστέθηκε στο `docs/chapter-04-infrastructure/provisioning.md` — ρύθμιση `infra.provider: terraform`, διάταξη φακέλου `.tf`, απαραίτητα εξαγόμενα `AZURE_*` και ετικέτες `azd-env-name`, και η ίδια ροή εργασίας `azd up` / `azd down` (καλύπτει το κενό όπου η υποστήριξη Terraform αναφέρθηκε αλλά εμφανίστηκε μόνο το Bicep)
- **⚙️ Περιήγηση βήμα προς βήμα GitHub Actions** στο `docs/chapter-08-production/production-ai-practices.md` — από την αποθήκη GitHub έως τις αυτοματοποιημένες αναπτύξεις: `azd pipeline config`, προνόμια ταυτότητας ομοσπονδίας OIDC (χωρίς αποθηκευμένα μυστικά), το παραγόμενο `azure-dev.yml`, και οδηγίες για μυστικά σε σχέση με μεταβλητές
- **🪝 Εισαγωγή για αρχάριους "Καινούργιος στα hooks;"** στο `docs/chapter-04-infrastructure/deployment-guide.md` — τι είναι ένα hook, πίνακας σταδίων hook, ένα ελάχιστο πρώτο hook, και χειροκίνητη εκτέλεση hooks με `azd hooks run`
- **✅ Προστέθηκε κατάλογος ελέγχου "Επαλήθευσε την ανάπτυξή σου"** στο Βήμα 5 του `docs/chapter-01-foundation/first-project.md` — δοκιμή καπνού, έλεγχος σημεία υγείας, και ρητά κριτήρια επιτυχίας
- **🧩 Εξήγηση για τις νέες επεκτάσεις προεπισκόπησης** `azure.ai.skills` και `azure.ai.connections` (τι είναι και πότε να τις χρησιμοποιήσεις) στο `docs/chapter-08-production/production-ai-practices.md`

#### Αλλαγές
- **🧭 Διορθωμένος πίνακας μαθημάτων Chapter 5**: το `multi-agent-basics.md` είναι πλέον Μάθημα 1 (το μόνο πλήρως πρακτικό μάθημα), με ειλικρινή επισήμανση πως το Μάθημα 2 βρίσκεται στο Chapter 6 και το σενάριο Retail είναι ένα αρχιτεκτονικό σχέδιο, όχι πρότυπο με μια εντολή
- **🧭 Πίνακας μαθημάτων Chapter 1** τώρα περιλαμβάνει το νέο μάθημα "Φέρε τη δική σου Εφαρμογή" (Μάθημα 4)
- **🔗 Ανανεωμένες υποσέλιδες πλοήγησης**: το `first-project.md` συνδέει πλέον μπροστά στο `bring-your-own-app.md`

#### Διορθώσεις
- **🧱 Κλείσιμο του "υποσχόμενου αλλά ελλείποντος" κενού Terraform** — το μάθημα προηγουμένως ανέφερε υποστήριξη Terraform χωρίς να την εμφανίζει
- **🔀 Διόρθωση παραπλανητικών διασυνδέσεων του Chapter 5** που υποδήλωναν ότι υπήρχε πλήρης υλοποίηση πολλαπλών πρακτόρων όταν στην πραγματικότητα ήταν μόνο αρχιτεκτονικό σχέδιο

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

#### Ανανεωμένη AZD 1.25.6, Πλήρεις Εντολές Κύκλου Ζωής Πράκτορα & Rebrand Aspire

**Αυτή η έκδοση επικυρώνει ξανά το μάθημα με το `azd` `1.25.6` (Ιούνιος 2026) και την επέκταση `azure.ai.agents` `0.1.40-preview`, επεκτείνει την καθοδήγηση AI από το "κατασκευή πράκτορα" στο πλήρες κύκλο ζωής του πράκτορα (δοκιμή → αξιολόγηση → βελτιστοποίηση → επιθεώρηση → διαγραφή), παρουσιάζει τις νέες προεπισκοπικές επεκτάσεις `azure.ai.skills` και `azure.ai.connections` και σημειώνει το rebrand του προϊόντος ".NET Aspire" → "Aspire".**

#### Προστέθηκε
- **🔁 Πλήρης κάλυψη κύκλου ζωής πράκτορα** για αρχάριους και μηχανικούς AI σε όλη τη τεκμηρίωση:
  - `docs/chapter-01-foundation/azd-basics.md` — Προστέθηκε πίνακας κύκλου ζωής (κατασκευή → δοκιμή → μέτρηση → βελτίωση → επιθεώρηση → καθαρισμός) στην ενότητα Επεκτάσεις και Εντολές AI
  - `docs/chapter-08-production/production-ai-practices.md` — Νέα ενότητα "Διαχείριση Κύκλου Ζωής Πράκτορα" που καλύπτει τις εντολές `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` και `delete --force`
  - `resources/cheat-sheet.md` — Επεκτάθηκαν οι Εντολές Πράκτορα AI με `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` και `delete --force`
- **🧩 Νέες προεπισκοπικές επεκτάσεις** τεκμηριωμένες: `azure.ai.skills` (επανχρησιμοποιήσιμες δεξιότητες πράκτορα) και `azure.ai.connections` (συνδέσεις Foundry) προστέθηκαν στον πίνακα επεκτάσεων και το cheat sheet
- **⏱️ Καθοδήγηση χρονισμού απόκρισης** — Τα παραδείγματα `azd ai agent invoke` τώρα σημειώνουν ότι εμφανίζει τη συνολική καθυστέρηση και τον χρόνο έως το πρώτο byte
- **📌 Μπάνερ έκδοσης** στο κύριο README που δείχνει στους μαθητές τις εντολές `azd version` και `azd upgrade`

#### Αλλαγές
- **✅ Ενημέρωση βασικής γραμμής επικύρωσης** από `azd 1.23.12` (Μάρτιος 2026) σε `azd 1.25.6` (Ιούνιος 2026) σε όλα τα README των κεφαλαίων και τα έγγραφα εργαστηρίου
- **🤖 Ενημέρωση σημείωσης επέκτασης κεφαλαίου 2** από `azure.ai.agents` `0.1.18-preview` σε `0.1.40-preview`
- **🧪 Ενημέρωση παραδείγματος επικύρωσης εργαστηρίου** (έξοδος `azd version`) σε `1.25.6`
- **🧭 Ανανέωση README "Τι Νέο στο azd Σήμερα"** για ανάδειξη του πλήρους κύκλου ζωής πράκτορα, νέων επεκτάσεων AI και πρόσφατων βελτιώσεων ποιότητας ζωής (`azd init` επαναληπτική δυνατότητα, εκκαθάριση παλαιού διακριτικού στο `azd auth login`, πρότροπος πρώτης εκτέλεσης `azd tool`)
- **📖 agents.md κεφαλαίου 2 (Επιλογή 4)** τώρα κατευθύνει τους μαθητές σε εντολές κύκλου ζωής μετά την ανάπτυξη αντί να σταματά στο `azd up`

#### Διορθώσεις
- **🏷️ Ονομασία προϊόντος** — Προστέθηκε σημείωση για rebrand Aspire (".NET Aspire" πλέον απλώς "Aspire"); η υποστήριξη του azd για Aspire παραμένει αμετάβλητη
- **🔎 Επαλήθευση live έκδοσης** επιβεβαιώθηκε με το κανάλι κυκλοφορίας Azure Developer CLI: σταθερό CLI `1.25.6` (2026-06-12) και `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Αρχεία Ενημερωμένα
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

#### Διευκρίνιση Εισαγωγής Αρχαρίων, Επικύρωση Ρυθμίσεων & Τελικός Καθαρισμός Εντολών AZD
**Αυτή η έκδοση ακολουθεί τη σάρωση επικύρωσης AZD 1.23 με μια διόλου επικεντρωμένη στους αρχάριους ανασκόπηση τεκμηρίωσης: διευκρινίζει την καθοδήγηση αυθεντικοποίησης AZD-first, προσθέτει τοπικά σενάρια επικύρωσης ρυθμίσεων, επαληθεύει βασικές εντολές με το ζωντανό AZD CLI και απομακρύνει τις τελευταίες ξεπερασμένες αναφορές εντολών που προέρχονται από αγγλικό πρωτότυπο εκτός του changelog.**

#### Προστέθηκε
- **🧪 Σενάρια επικύρωσης ρυθμίσεων αρχαρίων** με `validate-setup.ps1` και `validate-setup.sh` για να επιβεβαιώσουν οι μαθητές τη διαθεσιμότητα των απαιτούμενων εργαλείων πριν την έναρξη του Κεφαλαίου 1
- **✅ Βήματα επικύρωσης ρυθμίσεων εκ των προτέρων** στο κύριο README και στο README του Κεφαλαίου 1 ώστε να εντοπίζονται οι ελλείψεις προαπαιτούμενων πριν το `azd up`

#### Αλλαγές
- **🔐 Καθοδήγηση αυθεντικοποίησης αρχαρίων** τώρα αντιμετωπίζει σταθερά το `azd auth login` ως την κύρια διαδρομή για ροές εργασίας AZD, με το `az login` να αναφέρεται ως προαιρετικό εκτός αν χρησιμοποιούνται απευθείας εντολές Azure CLI
- **📚 Διαδικασία εισαγωγής κεφαλαίου 1** τώρα απευθύνει τους μαθητές στην επικύρωση της τοπικής εγκατάστασης προτού από την εγκατάσταση, την αυθεντικοποίηση και τα πρώτα βήματα ανάπτυξης
- **🛠️ Μηνυματοδοσία επικυρωτή** τώρα διαχωρίζει καθαρά τις απαιτήσεις που μπλοκάρουν από τις προειδοποιήσεις Azure CLI που είναι προαιρετικές για τη διαδρομή μόνο AZD αρχαρίων
- **📖 Τεκμηρίωση ρυθμίσεων, αντιμετώπισης προβλημάτων και παραδειγμάτων** τώρα διακρίνει μεταξύ απαιτούμενης αυθεντικοποίησης AZD και προαιρετικής σύνδεσης Azure CLI όπου προηγουμένως παρουσιάζονταν αδιάκριτα

#### Διορθώσεις
- **📋 Υπόλοιπες αναφορές αγγλικών εντολών** ενημερώθηκαν στις τρέχουσες μορφές AZD, συμπεριλαμβανομένου του `azd config show` στο cheat sheet και του `azd monitor --overview` όπου προβλεπόταν η επισκόπηση Azure Portal
- **🧭 Δηλώσεις αρχαρίων στο Κεφάλαιο 1** μαλακώθηκαν για να αποφευχθεί η υπερεκτιμημένη εγγύηση μηδενικών σφαλμάτων ή συμπεριφοράς αναίρεσης σε όλα τα πρότυπα και πόρους Azure
- **🔎 Επαλήθευση ζωντανού CLI** επιβεβαίωσε την τρέχουσα υποστήριξη για `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` και `azd down --force --purge`

#### Αρχεία Ενημερωμένα
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

#### Επικύρωση AZD 1.23.12, Επέκταση Περιβάλλοντος Εργαστηρίου & Ανανεώσεις Μοντέλου AI
**Αυτή η έκδοση πραγματοποιεί σάρωση επικύρωσης τεκμηρίωσης με το `azd` `1.23.12`, ενημερώνει παρωχημένα παραδείγματα εντολών AZD, ανανεώνει την καθοδήγηση μοντέλου AI με τις τρέχουσες προεπιλογές και διευρύνει τις οδηγίες εργαστηρίου πέρα από το GitHub Codespaces ώστε να υποστηρίζει επίσης dev containers και τοπικά αντίγραφα.**

#### Προστέθηκε
- **✅ Σημειώσεις επικύρωσης σε βασικά κεφάλαια και έγγραφα εργαστηρίου** για να καταστήσουν σαφές το δοκιμασμένο βασικό επίπεδο AZD στους μαθητές που χρησιμοποιούν νεότερες ή παλαιότερες εκδόσεις CLI
- **⏱️ Οδηγίες χρονικού ορίου ανάπτυξης** για μακροχρόνιες αναπτύξεις εφαρμογών AI με χρήση `azd deploy --timeout 1800`
- **🔎 Βήματα επιθεώρησης επέκτασης** με `azd extension show azure.ai.agents` σε έγγραφα ροής εργασίας AI
- **🌐 Ευρύτερες οδηγίες εργαστηρίου** που καλύπτουν GitHub Codespaces, dev containers και τοπικά αντίγραφα με MkDocs

#### Αλλαγές
- **📚 Εισαγωγικά README κεφαλαίων** τώρα αναφέρουν συνεπώς την επικύρωση με `azd 1.23.12` στα κεφάλαια θεμελίωσης, ρυθμίσεων, υποδομής, πολλαπλών πρακτόρων, προανάπτυξης, αντιμετώπισης προβλημάτων και παραγωγής
- **🛠️ Αναφορές εντολών AZD** ενημερώθηκαν σε τρέχουσες μορφές σε όλη τη τεκμηρίωση:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ή `azd env get-value(s)` ανάλογα με το περιβάλλον
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` όπου προβλέπεται επισκόπηση Application Insights
- **🧪 Απλοποιημένα παραδείγματα προεπισκόπησης παροχής πόρων** σε τρέχουσα υποστηριζόμενη χρήση όπως `azd provision --preview` και `azd provision --preview -e production`
- **🧭 Ροή εργαστηρίου** ενημερώθηκε ώστε οι μαθητές να μπορούν να ολοκληρώσουν τα εργαστήρια σε Codespaces, dev container ή τοπικό αντίγραφο αντί να υποθέτουν αποκλειστική εκτέλεση σε Codespaces
- **🔐 Καθοδήγηση αυθεντικοποίησης** τώρα προτιμήται το `azd auth login` για ροές εργασίας AZD, με το `az login` ως προαιρετικό όταν χρησιμοποιούνται απευθείας εντολές Azure CLI

#### Διορθώσεις
- **🪟 Εντολές εγκατάστασης Windows** ομαλοποιήθηκαν ώστε να έχουν τη σωστή κεφαλαιοποίηση του `winget` στον οδηγό εγκατάστασης
- **🐧 Οδηγίες εγκατάστασης Linux** διορθώθηκαν για να αποφευχθούν μη υποστηριζόμενες διανομές και οδηγίες διαχειριστή πακέτων `azd`, ενώ κατευθύνουν σε κατάλληλα assets κυκλοφορίας
- **📦 Παραδείγματα μοντέλων AI** ανανεώθηκαν από παλαιότερα προεπιλεγμένα όπως `gpt-35-turbo` και `text-embedding-ada-002` σε τρέχοντα όπως `gpt-4.1-mini`, `gpt-4.1` και `text-embedding-3-large`
- **📋 Αποσπάσματα ανάπτυξης και διαγνωστικών** διορθώθηκαν για να χρησιμοποιούν τρέχουσες εντολές περιβάλλοντος και κατάστασης στα αρχεία καταγραφής, τα σενάρια και τα βήματα αντιμετώπισης προβλημάτων
- **⚙️ Καθοδήγηση GitHub Actions** ενημερώθηκε από `Azure/setup-azd@v1.0.0` σε `Azure/setup-azd@v2`
- **🤖 Καθοδήγηση συναίνεσης MCP/Copilot** ενημερώθηκε από `azd mcp consent` σε `azd copilot consent list`

#### Βελτιώσεις
- **🧠 Καθοδήγηση κεφαλαίου AI** τώρα εξηγεί καλύτερα τη συμπεριφορά `azd ai` που επηρεάζεται από προεπισκόπηση, σύνδεση ανά ενοικιαστή, τρέχουσα χρήση επεκτάσεων και συστάσεις ενημερωμένης ανάπτυξης μοντέλων
- **🧪 Οδηγίες εργαστηρίου** τώρα χρησιμοποιούν πιο ρεαλιστικά παραδείγματα εκδόσεων και πιο καθαρή γλώσσα ρύθμισης περιβάλλοντος για εργαστήρια πρακτικής
- **📈 Τεκμηρίωση παραγωγής και αντιμετώπισης προβλημάτων** ευθυγραμμίζεται καλύτερα με τρέχοντα παραδείγματα παρακολούθησης, εφεδρικού μοντέλου και επιπέδου κόστους

#### Αρχεία Ενημερωμένα
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

#### Εντολές CLI AI AZD, Επικύρωση Περιεχομένου & Επέκταση Προτύπων
**Αυτή η έκδοση προσθέτει την κάλυψη εντολών `azd ai`, `azd extension` και `azd mcp` σε όλα τα κεφάλαια σχετικά με το AI, διορθώνει σπασμένους συνδέσμους και παρωχημένο κώδικα στο agents.md, ενημερώνει το cheat sheet και αναμορφώνει την ενότητα Παράδειγμα Προτύπων με επικυρωμένες περιγραφές και νέα πρότυπα Azure AI AZD.**

#### Προστέθηκε
- **🤖 Κάλυψη CLI AI AZD** σε 7 αρχεία (προηγουμένως μόνο στο Κεφάλαιο 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Νέα ενότητα "Επεκτάσεις και Εντολές AI" που εισάγει τις εντολές `azd extension`, `azd ai agent init` και `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Επιλογή 4: `azd ai agent init` με πίνακα σύγκρισης (πρότυπο έναντι προσεγγιστικής διαμόρφωσης)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Υποενότητες "Επεκτάσεις AZD για Foundry" και "Ανάπτυξη με Πράκτορα Πρώτα"

  - `docs/chapter-05-multi-agent/README.md` — Η γρήγορη εκκίνηση εμφανίζει πλέον και τις διαδρομές ανάπτυξης βασισμένες σε πρότυπο και σε manifesto
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Η ενότητα Ανάπτυξης τώρα περιλαμβάνει την επιλογή `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Υποενότητα "Εντολές επεκτάσεων AZD AI για διαγνωστικούς ελέγχους"
  - `resources/cheat-sheet.md` — Νέα ενότητα "Εντολές AI & Επεκτάσεων" με `azd extension`, `azd ai agent init`, `azd mcp`, και `azd infra generate`
- **📦 Νέα πρότυπα παραδειγμάτων AZD AI** στο `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG συνομιλία με Blazor WebAssembly, Semantic Kernel, και υποστήριξη φωνητικής συνομιλίας
  - **azure-search-openai-demo-java** — Java RAG συνομιλία με Langchain4J και επιλογές ανάπτυξης ACA/AKS
  - **contoso-creative-writer** — Εφαρμογή δημιουργικής γραφής πολλαπλών πρακτόρων με Azure AI Agent Service, Bing Grounding, και Prompty
  - **serverless-chat-langchainjs** — Serverless RAG με Azure Functions + LangChain.js + Cosmos DB με υποστήριξη τοπικής ανάπτυξης Ollama
  - **chat-with-your-data-solution-accelerator** — Επιχειρησιακός RAG επιταχυντής με portal διαχείρισης, ενσωμάτωση Teams, και επιλογές PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Εφαρμογή αναφοράς ορχήστρωσης MCP πολλαπλών πρακτόρων με servers σε .NET, Python, Java, και TypeScript
  - **azd-ai-starter** — Ελάχιστο πρότυπο εκκίνησης υποδομής Azure AI με Bicep
  - **🔗 Υπέροχος σύνδεσμος στη συλλογή AZD AI** — Αναφορά στη [σπουδαία συλλογή AZD AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ πρότυπα)

#### Διορθώσεις
- **🔗 πλοήγηση agents.md**: Τώρα οι σύνδεσμοι Προηγούμενο/Επόμενο ταιριάζουν με τη σειρά μαθημάτων README κεφαλαίου 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 σπασμένοι σύνδεσμοι agents.md**: Διορθώθηκε `production-ai-practices.md` σε `../chapter-08-production/production-ai-practices.md` (3 εμφανίσεις)
- **📦 αποσυρμένος κώδικας agents.md**: Αντικαταστάθηκε το `opencensus` με `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 άκυρο API agents.md**: Μετακινήθηκε το `max_tokens` από `create_agent()` σε `create_run()` ως `max_completion_tokens`
- **🔢 καταμέτρηση tokens agents.md**: Αντικαταστάθηκε η αδρή εκτίμηση `len//4` με `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Διορθώθηκαν οι υπηρεσίες από "Cognitive Search + App Service" σε "Azure AI Search + Azure Container Apps" (προεπιλεγμένος host άλλαξε Οκτ 2024)
- **contoso-chat**: Ενημερώθηκε η περιγραφή για αναφορά στο Azure AI Foundry + Prompty, ταιριάζοντας με τον πραγματικό τίτλο και τεχνολογικό στοίβας του αποθετηρίου

#### Αφαιρέθηκε
- **ai-document-processing**: Αφαιρέθηκε μη λειτουργική αναφορά προτύπου (το αποθετήριο δεν είναι δημόσια προσβάσιμο ως πρότυπο AZD)

#### Βελτιώσεις
- **📝 ασκήσεις agents.md**: Η Άσκηση 1 τώρα εμφανίζει την αναμενόμενη έξοδο και το βήμα `azd monitor`; Η Άσκηση 2 περιλαμβάνει πλήρη κώδικα εγγραφής `FunctionTool`; Η Άσκηση 3 αντικαθιστά ασαφείς οδηγίες με συγκεκριμένες εντολές `prepdocs.py`
- **📚 πόροι agents.md**: Ενημερωμένοι σύνδεσμοι τεκμηρίωσης προς τα τρέχοντα έγγραφα Azure AI Agent Service και γρήγορης εκκίνησης
- **📋 Πίνακας επόμενων βημάτων agents.md**: Προστέθηκε σύνδεσμος εργαστηρίου AI Workshop για πλήρη κάλυψη κεφαλαίου

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

#### Βελτίωση πλοήγησης μαθήματος
**Αυτή η έκδοση βελτιώνει την πλοήγηση κεφαλαίων στο README.md με μια εμπλουτισμένη μορφή πίνακα.**

#### Αλλαγές
- **Πίνακας Χάρτης Μαθήματος**: Εμπλουτισμένος με άμεσους συνδέσμους μαθημάτων, εκτιμήσεις διάρκειας, και βαθμολογίες πολυπλοκότητας
- **Καθαρισμός φακέλων**: Αφαιρέθηκαν περιττοί παλιοί φάκελοι (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Επαλήθευση συνδέσμων**: Επαληθεύτηκαν όλοι οι 21+ εσωτερικοί σύνδεσμοι στον πίνακα Χάρτη Μαθήματος

### [v3.16.0] - 2026-02-05

#### Ενημερώσεις ονομάτων προϊόντων
**Αυτή η έκδοση ενημερώνει τις αναφορές προϊόντων με τα τρέχοντα επώνυμα της Microsoft.**

#### Αλλαγές
- **Microsoft Foundry → Microsoft Foundry**: Ολες οι αναφορές ενημερώθηκαν σε μη αρχεία μετάφρασης
- **Azure AI Agent Service → Foundry Agents**: Το όνομα υπηρεσίας ενημερώθηκε για να αντανακλά το τρέχον εμπορικό σήμα

#### Ενημερωμένα αρχεία
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

#### Σημαντική Αναδιάρθρωση Αποθετηρίου: Ονομασίες Φακέλων με βάση Κεφάλαια
**Αυτή η έκδοση αναδιοργανώνει την τεκμηρίωση σε αφιερωμένους φακέλους κεφαλαίων για πιο καθαρή πλοήγηση.**

#### Μετονομασίες φακέλων
Οι παλιοί φάκελοι αντικαταστάθηκαν από φακέλους με αριθμούς κεφαλαίων:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Προστέθηκε νέος: `docs/chapter-05-multi-agent/`

#### Μεταφορές αρχείων
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
| Όλα τα αρχεία προ-ανάπτυξης | pre-deployment/ | chapter-06-pre-deployment/ |
| Όλα τα αρχεία αντιμετώπισης προβλημάτων | troubleshooting/ | chapter-07-troubleshooting/ |

#### Προσθήκες
- **📚 Αρχεία README κεφαλαίων**: Δημιουργήθηκαν README.md σε κάθε φάκελο κεφαλαίου με:
  - Στόχους μάθησης και διάρκεια
  - Πίνακα μαθημάτων με περιγραφές
  - Εντολές γρήγορης εκκίνησης
  - Πλοήγηση σε άλλα κεφάλαια

#### Αλλαγές
- **🔗 Ενημερώθηκαν όλοι οι εσωτερικοί σύνδεσμοι**: 78+ διαδρομές ενημερωμένες σε όλα τα αρχεία τεκμηρίωσης
- **🗺️ Κύριο README.md**: Ενημέρωση Χάρτη Μαθήματος με νέα δομή κεφαλαίων
- **📝 examples/README.md**: Ενημέρωση διασταυρούμενων αναφορών σε φακέλους κεφαλαίων

#### Αφαιρέθηκε
- Παλιές δομές φακέλων (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Αναδιάρθρωση Αποθετηρίου: Πλοήγηση Κεφαλαίων
**Αυτή η έκδοση πρόσθεσε αρχεία README πλοήγησης κεφαλαίων (καταργήθηκαν στην v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Νέος Οδηγός Πρακτόρων AI
**Αυτή η έκδοση προσθέτει έναν ολοκληρωμένο οδηγό για ανάπτυξη πρακτόρων AI με το Azure Developer CLI.**

#### Προσθέσεις
- **🤖 docs/microsoft-foundry/agents.md**: Πλήρης οδηγός που καλύπτει:
  - Τι είναι οι πράκτορες AI και πώς διαφέρουν από chatbots
  - Τρία πρότυπα γρήγορης εκκίνησης πρακτόρων (Foundry Agents, Prompty, RAG)
  - Προτύπα αρχιτεκτονικής πρακτόρων (μοναδικός πράκτορας, RAG, πολλαπλοί πράκτορες)
  - Ρυθμίσεις και παραμετροποιήσεις εργαλείων
  - Παρακολούθηση και μετρικές απόδοσης
  - Παραμέτροι κόστους και βελτιστοποίησης
  - Συνηθισμένα σενάρια αντιμετώπισης προβλημάτων
  - Τρεις πρακτικές ασκήσεις με κριτήρια επιτυχίας

#### Δομή Περιεχομένου
- **Εισαγωγή**: Βασικές έννοιες πρακτόρων για αρχάριους
- **Γρήγορη Εκκίνηση**: Ανάπτυξη πρακτόρων με `azd init --template get-started-with-ai-agents`
- **Προτύπα Αρχιτεκτονικής**: Οπτικά διαγράμματα προτύπων πρακτόρων
- **Ρυθμίσεις**: Διαμόρφωση εργαλείων και μεταβλητές περιβάλλοντος
- **Παρακολούθηση**: Ενσωμάτωση Application Insights
- **Ασκήσεις**: Σταδιακή πρακτική μάθηση (20-45 λεπτά η κάθε μία)

---

### [v3.12.0] - 2026-02-05

#### Ενημέρωση Περιβάλλοντος DevContainer
**Αυτή η έκδοση ενημερώνει τη διαμόρφωση του κοντέινερ ανάπτυξης με σύγχρονα εργαλεία και καλύτερες προεπιλογές για την εμπειρία μάθησης AZD.**

#### Αλλαγές
- **🐳 Βασική Εικόνα**: Ενημερώθηκε από `python:3.12-bullseye` σε `python:3.12-bookworm` (τελευταία σταθερή έκδοση Debian)
- **📛 Όνομα Κοντέινερ**: Μετονομάστηκε από "Python 3" σε "AZD για Αρχάριους" για περισσότερη σαφήνεια

#### Προσθήκες
- **🔧 Νέα χαρακτηριστικά Dev Container**:
  - `azure-cli` με ενεργοποιημένη υποστήριξη Bicep
  - `node:20` (LTS έκδοση για πρότυπα AZD)
  - `github-cli` για διαχείριση προτύπων
  - `docker-in-docker` για ανάπτυξη εφαρμογών κοντέινερ

- **🔌 Εκχώρηση θυρών**: Προρυθμισμένες θύρες για κοινή ανάπτυξη:
  - 8000 (προεπισκόπηση MkDocs)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Νέες επεκτάσεις VS Code**:
  - `ms-python.vscode-pylance` - Ενισχυμένη Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Υποστήριξη Azure Functions
  - `ms-azuretools.vscode-docker` - Υποστήριξη Docker
  - `ms-azuretools.vscode-bicep` - Υποστήριξη γλώσσας Bicep
  - `ms-azure-devtools.azure-resource-groups` - Διαχείριση πόρων Azure
  - `yzhang.markdown-all-in-one` - Επεξεργασία Markdown
  - `DavidAnson.vscode-markdownlint` - Έλεγχος ποιότητας Markdown
  - `bierner.markdown-mermaid` - Υποστήριξη διαγραμμάτων Mermaid
  - `redhat.vscode-yaml` - Υποστήριξη YAML (για azure.yaml)
  - `eamodio.gitlens` - Οπτικοποίηση Git
  - `mhutchie.git-graph` - Ιστορικό Git

- **⚙️ Ρυθμίσεις VS Code**: Προσθήκη προεπιλεγμένων ρυθμίσεων για διερμηνέα Python, αυτόματη διαμόρφωση κατά αποθήκευση, και αφαίρεση πλεονάζοντων κενού

- **📦 Ενημερωμένο requirements-dev.txt**:
  - Προστέθηκε το πρόσθετο ελαχιστοποίησης MkDocs
  - Προστέθηκε pre-commit για ποιότητα κώδικα
  - Προστέθηκαν πακέτα Azure SDK (azure-identity, azure-mgmt-resource)

#### Διορθώσεις
- **Εντολή Post-Create**: Τώρα επαληθεύει την εγκατάσταση AZD και Azure CLI κατά την εκκίνηση κοντέινερ

---

### [v3.11.0] - 2026-02-05

#### Αναθεώρηση README φιλική προς αρχάριους
**Αυτή η έκδοση βελτιώνει σημαντικά το README.md για να γίνει πιο προσβάσιμο σε αρχάριους και προσθέτει βασικούς πόρους για προγραμματιστές AI.**

#### Προσθέσεις
- **🆚 Σύγκριση Azure CLI vs AZD**: Σαφής εξήγηση για το πότε να χρησιμοποιείται κάθε εργαλείο με πρακτικά παραδείγματα
- **🌟 Υπέροχοι σύνδεσμοι AZD**: Άμεσοι σύνδεσμοι σε γκαλερί προτύπων κοινότητας και πόρους συμβολής:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ πρότυπα έτοιμα για ανάπτυξη
  - [Υποβολή Προτύπου](https://github.com/Azure/awesome-azd/issues) - Συμβολή κοινότητας
- **🎯 Οδηγός γρήγορης εκκίνησης**: Απλοποιημένη ενότητα 3 βημάτων (Εγκατάσταση → Είσοδος → Ανάπτυξη)
- **📊 Πίνακας πλοήγησης βάσει εμπειρίας**: Σαφείς οδηγίες για το πού να ξεκινήσει κάποιος ανάλογα με την εμπειρία του προγραμματιστή

#### Αλλαγές
- **Δομή README**: Αναδιοργάνωση για σταδιακή αποκαλυπτική παρουσίαση - βασικές πληροφορίες πρώτα
- **Ενότητα Εισαγωγής**: Επαναγραφή για να εξηγεί "Η μαγεία του `azd up`" για εντελώς αρχάριους
- **Αφαίρεση διπλού περιεχομένου**: Εξάλειψη διπλότυπης ενότητας αντιμετώπισης προβλημάτων
- **Εντολές αντιμετώπισης προβλημάτων**: Διόρθωση αναφοράς `azd logs` σε έγκυρη εντολή `azd monitor --logs`

#### Διορθώσεις

- **🔐 Εντολές Πιστοποίησης**: Προστέθηκαν `azd auth login` και `azd auth logout` στο cheat-sheet.md
- **Μη Έγκυρες Αναφορές Εντολών**: Αφαιρέθηκε το υπόλοιπο `azd logs` από το τμήμα αντιμετώπισης προβλημάτων του README

#### Σημειώσεις
- **Εύρος**: Οι αλλαγές εφαρμόστηκαν στα κύρια README.md και resources/cheat-sheet.md
- **Στοχευόμενο Κοινό**: Βελτιώσεις ειδικά για προγραμματιστές νέους στο AZD

---

### [v3.10.0] - 2026-02-05

#### Ενημέρωση Ακρίβειας Εντολών Azure Developer CLI
**Αυτή η έκδοση διορθώνει μη-υπάρχουσες εντολές AZD σε όλη την τεκμηρίωση, διασφαλίζοντας ότι όλα τα παραδείγματα κώδικα χρησιμοποιούν έγκυρη σύνταξη Azure Developer CLI.**

#### Διορθώσεις
- **🔧 Αφαίρεση μη Υπάρχουσων Εντολών AZD**: Εκτενής έλεγχος και διόρθωση μη έγκυρων εντολών:
  - `azd logs` (δεν υπάρχει) → αντικαταστάθηκε με `azd monitor --logs` ή εναλλακτικές Azure CLI
  - Υποεντολές `azd service` (δεν υπάρχουν) → αντικαταστάθηκαν με `azd show` και Azure CLI
  - `azd infra import/export/validate` (δεν υπάρχουν) → αφαιρέθηκαν ή αντικαταστάθηκαν με έγκυρες εναλλακτικές
  - Σημαίες `azd deploy --rollback/--incremental/--parallel/--detect-changes` (δεν υπάρχουν) → αφαιρέθηκαν
  - Σημαίες `azd provision --what-if/--rollback` (δεν υπάρχουν) → ενημερώθηκαν σε χρήση `--preview`
  - `azd config validate` (δεν υπάρχει) → αντικαταστάθηκε με `azd config list`
  - `azd info`, `azd history`, `azd metrics` (δεν υπάρχουν) → αφαιρέθηκαν

- **📚 Αρχεία Ενημερωμένα με Διορθώσεις Εντολών**:
  - `resources/cheat-sheet.md`: Εκτενής αναδιαμόρφωση αναφοράς εντολών
  - `docs/deployment/deployment-guide.md`: Διορθώσεις στις στρατηγικές rollback και ανάπτυξης
  - `docs/troubleshooting/debugging.md`: Διορθώσεις σε τμήματα ανάλυσης αρχείων καταγραφής
  - `docs/troubleshooting/common-issues.md`: Ενημέρωση εντολών αντιμετώπισης προβλημάτων
  - `docs/troubleshooting/ai-troubleshooting.md`: Διόρθωση ενότητας αποσφαλμάτωσης AZD
  - `docs/getting-started/azd-basics.md`: Διόρθωση εντολών παρακολούθησης
  - `docs/getting-started/first-project.md`: Ενημέρωση παραδειγμάτων παρακολούθησης και αποσφαλμάτωσης
  - `docs/getting-started/installation.md`: Διόρθωση παραδειγμάτων βοήθειας και έκδοσης
  - `docs/pre-deployment/application-insights.md`: Διόρθωση εντολών προβολής αρχείων καταγραφής
  - `docs/pre-deployment/coordination-patterns.md`: Διόρθωση εντολών αποσφαλμάτωσης πρακτόρων

- **📝 Ενημέρωση Αναφοράς Έκδοσης**: 
  - `docs/getting-started/installation.md`: Αλλαγή από σκληρά κωδικοποιημένη έκδοση `1.5.0` σε γενική `1.x.x` με σύνδεσμο σε εκδόσεις

#### Αλλαγές
- **Στρατηγικές Rollback**: Ενημέρωση τεκμηρίωσης για χρήση rollback με βάση το Git (το AZD δεν έχει εγγενές rollback)
- **Προβολή Αρχείων Καταγραφής**: Αντικατάσταση αναφορών `azd logs` με `azd monitor --logs`, `azd monitor --live` και εντολές Azure CLI
- **Ενότητα Απόδοσης**: Αφαίρεση μη υπάρχουσων σημαίων παράλληλης/σταδιακής ανάπτυξης, παροχή έγκυρων εναλλακτικών

#### Τεχνικές Λεπτομέρειες
- **Έγκυρες Εντολές AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Έγκυρες Σημαίες azd monitor**: `--live`, `--logs`, `--overview`
- **Καταργημένα Χαρακτηριστικά**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Σημειώσεις
- **Επικύρωση**: Εντολές επικυρωμένες με βάση το Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ολοκλήρωση Εργαστηρίου και Βελτίωση Ποιότητας Τεκμηρίωσης
**Αυτή η έκδοση ολοκληρώνει τα διαδραστικά modules εργαστηρίου, διορθώνει όλους τους σπασμένους συνδέσμους τεκμηρίωσης και βελτιώνει τη συνολική ποιότητα περιεχομένου για προγραμματιστές AI που χρησιμοποιούν το Microsoft AZD.**

#### Προσθήκες
- **📝 CONTRIBUTING.md**: Νέο έγγραφο κατευθυντήριων οδηγιών συνεισφοράς με:
  - Σαφείς οδηγίες για αναφορά προβλημάτων και προτάσεις αλλαγών
  - Πρότυπα τεκμηρίωσης για νέο περιεχόμενο
  - Οδηγίες παραδειγμάτων κώδικα και συμβάσεις μηνυμάτων commit
  - Πληροφορίες εμπλοκής κοινότητας

#### Ολοκληρώθηκαν
- **🎯 Εργαστήριο Module 7 (Επίλογος)**: Πλήρης ολοκλήρωση ενότητος επίλογου με:
  - Εκτενές σύνοψη επιτευγμάτων εργαστηρίου
  - Τμήμα βασικών εννοιών που καλύπτει AZD, πρότυπα και Microsoft Foundry
  - Συστάσεις συνέχισης μαθησιακής πορείας
  - Ασκήσεις προκλήσεων εργαστηρίου με βαθμολογίες δυσκολίας
  - Σύνδεσμοι ανατροφοδότησης και υποστήριξης κοινότητας

- **📚 Εργαστήριο Module 3 (Ανάλυση)**: Ενημέρωση μαθησιακών στόχων με:
  - Οδηγίες ενεργοποίησης GitHub Copilot με MCP servers
  - Κατανόηση δομής φακέλου προτύπων AZD
  - Πρότυπα οργάνωσης υποδομής ως κώδικα (Bicep)
  - Οδηγίες εργαστηριακών ασκήσεων

- **🔧 Εργαστήριο Module 6 (Αποσυναρμολόγηση)**: Ολοκληρώθηκε με:
  - Στόχοι καθαρισμού πόρων και διαχείρισης κόστους
  - Χρήση `azd down` για ασφαλή αποδιδασκαλία υποδομής
  - Οδηγίες ανάκτησης μαλακά διαγραμμένων γνωστικών υπηρεσιών
  - Πρόσθετα ερευνητικά κίνητρα για GitHub Copilot και Azure Portal

#### Διορθώσεις
- **🔗 Διορθώσεις Σπασμένων Συνδέσμων**: Επίλυση 15+ σπασμένων εσωτερικών συνδέσμων τεκμηρίωσης:
  - `docs/ai-foundry/ai-model-deployment.md`: Διόρθωση διαδρομών για microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Διόρθωση διαδρομών ai-model-deployment.md και production-ai-practices.md
  - `docs/getting-started/first-project.md`: Αντικατάσταση μη υπάρχοντος cicd-integration.md με deployment-guide.md
  - `examples/retail-scenario.md`: Διόρθωση διαδρομών FAQ και οδηγού αντιμετώπισης προβλημάτων
  - `examples/container-app/microservices/README.md`: Διόρθωση διαδρομών αρχικής σελίδας μαθήματος και οδηγού ανάπτυξης
  - `resources/faq.md` και `resources/glossary.md`: Ενημερώσεις αναφορών κεφαλαίου AI
  - `course-outline.md`: Διόρθωση αναφορών οδηγού εκπαιδευτών και εργαστηριακών ασκήσεων AI εργαστηρίου

- **📅 Μπάνερ Κατάστασης Εργαστηρίου**: Ενημερώθηκε από "Σε Κατασκευή" σε ενεργή κατάσταση εργαστηρίου με ημερομηνία Φεβρουάριος 2026

- **🔗 Πλοήγηση Εργαστηρίου**: Διόρθωση σπασμένων συνδέσμων πλοήγησης στο README.md εργαστηρίου που δείχνουν σε μη υπάρχον φάκελο lab-1-azd-basics

#### Αλλαγές
- **Παρουσίαση Εργαστηρίου**: Αφαίρεση προειδοποίησης "σε κατασκευή", το εργαστήριο πλέον ολοκληρωμένο και έτοιμο για χρήση
- **Συνέπεια Πλοήγησης**: Διασφάλιση σωστής πλοήγησης μεταξύ modules εργαστηρίου
- **Αναφορές Μαθησιακής Διαδρομής**: Ενημέρωση διασταυρούμενων αναφορών κεφαλαίων με σωστές διαδρομές microsoft-foundry

#### Επικυρωμένα
- ✅ Όλα τα αγγλικά αρχεία markdown έχουν έγκυρους εσωτερικούς συνδέσμους
- ✅ Τα modules εργαστηρίου 0-7 είναι πλήρη με μαθησιακούς στόχους
- ✅ Η πλοήγηση μεταξύ κεφαλαίων και modules λειτουργεί σωστά
- ✅ Το περιεχόμενο είναι κατάλληλο για προγραμματιστές AI που χρησιμοποιούν Microsoft AZD
- ✅ Διατηρείται φιλική γλώσσα και δομή για αρχάριους σε όλη την έκταση
- ✅ Το CONTRIBUTING.md παρέχει σαφείς οδηγίες για συνεισφέροντες της κοινότητας

#### Τεχνική Υλοποίηση
- **Επικύρωση Συνδέσμων**: Αυτοματοποιημένο PowerShell script επαλήθευσε όλους τους εσωτερικούς συνδέσμους .md
- **Έλεγχος Περιεχομένου**: Χειροκίνητος έλεγχος πληρότητας εργαστηρίου και κατάλληλοτητας για αρχάριους
- **Σύστημα Πλοήγησης**: Εφαρμογή συνεπών προτύπων πλοήγησης κεφαλαίων και modules

#### Σημειώσεις
- **Εύρος**: Οι αλλαγές εφαρμόστηκαν μόνο στην αγγλική τεκμηρίωση
- **Μεταφράσεις**: Οι φάκελοι μετάφρασης δεν ενημερώθηκαν σε αυτή την έκδοση (η αυτόματη μετάφραση θα συγχρονιστεί αργότερα)
- **Διάρκεια Εργαστηρίου**: Το πλήρες εργαστήριο παρέχει τώρα 3-4 ώρες πρακτικής μάθησης

---

### [v3.8.0] - 2025-11-19

#### Προηγμένη Τεκμηρίωση: Παρακολούθηση, Ασφάλεια και Πρότυπα Πολυπρακτόρων
**Αυτή η έκδοση προσθέτει ολοκληρωμένα μαθήματα επιπέδου Α για την ενσωμάτωση Application Insights, πρότυπα πιστοποίησης και συντονισμό πολλών πρακτόρων για παραγωγικές αναπτύξεις.**

#### Προσθήκες
- **📊 Μάθημα Ενσωμάτωσης Application Insights**: στο `docs/pre-deployment/application-insights.md`:
  - Ανάπτυξη με επίκεντρο το AZD με αυτόματη διδασκαλία
  - Πλήρη πρότυπα Bicep για Application Insights + Log Analytics
  - Λειτουργικές εφαρμογές Python με προσαρμοσμένη τηλεμετρία (1.200+ γραμμές)
  - Πρότυπα παρακολούθησης AI/LLM (παρακολούθηση διακριτικών/κόστους Microsoft Foundry Models)
  - 6 διαγράμματα Mermaid (αρχιτεκτονική, κατανεμημένη ανίχνευση, ροή τηλεμετρίας)
  - 3 πρακτικές ασκήσεις (ειδοποιήσεις, dashboard, παρακολούθηση AI)
  - Παραδείγματα ερωτημάτων Kusto και στρατηγικές βελτιστοποίησης κόστους
  - Ζωντανή ροή μετρικών και αποσφαλμάτωση σε πραγματικό χρόνο
  - 40-50 λεπτά μάθησης με πρότυπα έτοιμα για παραγωγή

- **🔐 Μάθημα Πρότυπων Πιστοποίησης & Ασφαλείας**: στο `docs/getting-started/authsecurity.md`:
  - 3 πρότυπα πιστοποίησης (αλυσίδες σύνδεσης, Key Vault, διαχειριζόμενη ταυτότητα)
  - Πλήρη πρότυπα υποδομής Bicep για ασφαλείς αναπτύξεις
  - Κώδικας εφαρμογής Node.js με ενσωμάτωση Azure SDK
  - 3 ολοκληρωμένες ασκήσεις (ενεργοποίηση διαχειριζόμενης ταυτότητας, ταυτότητα ορισμένη από χρήστη, περιστροφή Key Vault)
  - Καλές πρακτικές ασφαλείας και διαμορφώσεις RBAC
  - Οδηγός αντιμετώπισης προβλημάτων και ανάλυση κόστους
  - Πρότυπα πιστοποίησης χωρίς κωδικούς πρόσβασης έτοιμα για παραγωγή

- **🤖 Μάθημα Προτύπων Συντονισμού Πολυπρακτόρων**: στο `docs/pre-deployment/coordination-patterns.md`:
  - 5 πρότυπα συντονισμού (διαδοχικός, παράλληλος, ιεραρχικός, συμβάντος, συναίνεσης)
  - Πλήρης υλοποίηση υπηρεσίας ορχηστρωτή (Python/Flask, 1.500+ γραμμές)
  - 3 ειδικές υλοποιήσεις πρακτόρων (Έρευνα, Συγγραφέας, Συντάκτης)
  - Ενσωμάτωση Service Bus για ουρά μηνυμάτων
  - Διαχείριση κατάστασης Cosmos DB για κατανεμημένα συστήματα
  - 6 διαγράμματα Mermaid που εμφανίζουν αλληλεπιδράσεις πρακτόρων
  - 3 προχωρημένες ασκήσεις (χειρισμός χρονικού ορίου, λογική επανάληψης, διακόπτης κυκλώματος)
  - Ανάλυση κόστους ($240-565/μήνα) με στρατηγικές βελτιστοποίησης
  - Ενσωμάτωση Application Insights για παρακολούθηση

#### Ενισχύσεις
- **Κεφάλαιο Προ-Ανάπτυξης**: Τώρα περιλαμβάνει πλήρη πρότυπα παρακολούθησης και συντονισμού
- **Κεφάλαιο Έναρξης**: Ενισχυμένο με επαγγελματικά πρότυπα πιστοποίησης
- **Ετοιμότητα Παραγωγής**: Πλήρης κάλυψη από ασφάλεια έως παρατηρησιμότητα
- **Διάγραμμα Μαθήματος**: Ενημερωμένο για να αναφέρεται σε νέα μαθήματα στα Κεφάλαια 3 και 6

#### Αλλαγές
- **Πρόοδος Μάθησης**: Καλύτερη ενσωμάτωση ασφαλείας και παρακολούθησης σε όλο το μάθημα
- **Ποιότητα Τεκμηρίωσης**: Συνεπείς προδιαγραφές επιπέδου Α (95-97%) στα νέα μαθήματα
- **Πρότυπα Παραγωγής**: Πλήρης κάλυψη end-to-end για αναπτύξεις επιχειρήσεων

#### Βελτιώσεις
- **Εμπειρία Προγραμματιστή**: Σαφής διαδρομή από την ανάπτυξη έως την παρακολούθηση παραγωγής
- **Πρότυπα Ασφάλειας**: Επαγγελματικά πρότυπα για πιστοποίηση και διαχείριση μυστικών
- **Παρατηρησιμότητα**: Πλήρης ενσωμάτωση Application Insights με AZD
- **Φορτία AI**: Εξειδικευμένη παρακολούθηση για Microsoft Foundry Models και συστήματα πολλών πρακτόρων

#### Επικυρώσεις
- ✅ Όλα τα μαθήματα περιλαμβάνουν πλήρη λειτουργικό κώδικα (όχι αποσπάσματα)
- ✅ Διαγράμματα Mermaid για οπτική μάθηση (19 συνολικά σε 3 μαθήματα)
- ✅ Πρακτικές ασκήσεις με βήματα επαλήθευσης (9 συνολικά)
- ✅ Πρότυπα Bicep έτοιμα για παραγωγή, αναπτυσσόμενα μέσω `azd up`
- ✅ Ανάλυση κόστους και στρατηγικές βελτιστοποίησης
- ✅ Οδηγοί αντιμετώπισης προβλημάτων και βέλτιστες πρακτικές
- ✅ Σημεία ελέγχου γνώσης με εντολές επαλήθευσης

#### Αποτελέσματα Βαθμολόγησης Τεκμηρίωσης
- **docs/pre-deployment/application-insights.md**: - Ολοκληρωμένος οδηγός παρακολούθησης
- **docs/getting-started/authsecurity.md**: - Επαγγελματικά πρότυπα ασφαλείας
- **docs/pre-deployment/coordination-patterns.md**: - Προηγμένες αρχιτεκτονικές πολυπρακτόρων
- **Συνολικό Νέο Περιεχόμενο**: - Συνεπείς υψηλής ποιότητας προδιαγραφές

#### Τεχνική Υλοποίηση
- **Application Insights**: Log Analytics + προσαρμοσμένη τηλεμετρία + κατανεμημένη ανίχνευση
- **Πιστοποίηση**: Διαχειριζόμενη Ταυτότητα + Key Vault + πρότυπα RBAC
- **Πολύπρακτορες**: Service Bus + Cosmos DB + Container Apps + ορχηστρωτής
- **Παρακολούθηση**: Ζωντανές μετρήσεις + ερωτήματα Kusto + ειδοποιήσεις + dashboards
- **Διαχείριση Κόστους**: Στρατηγικές δειγματοληψίας, πολιτικές διατήρησης, έλεγχοι προϋπολογισμού

### [v3.7.0] - 2025-11-19

#### Βελτιώσεις Ποιότητας Τεκμηρίωσης και Νέο Παράδειγμα Microsoft Foundry Models
**Αυτή η έκδοση βελτιώνει την ποιότητα τεκμηρίωσης σε όλο το αποθετήριο και προσθέτει ένα πλήρες παράδειγμα ανάπτυξης Microsoft Foundry Models με διεπαφή συνομιλίας gpt-4.1.**

#### Προσθήκες
- **🤖 Παράδειγμα Συνομιλίας Microsoft Foundry Models**: Πλήρης ανάπτυξη gpt-4.1 με λειτουργική υλοποίηση στο `examples/azure-openai-chat/`:
  - Πλήρης υποδομή Microsoft Foundry Models (ανάπτυξη μοντέλου gpt-4.1)
  - Διεπαφή συνομιλίας Python γραμμής εντολών με ιστορικό συνομιλιών
  - Ενσωμάτωση Key Vault για ασφαλή αποθήκευση κλειδιών API
  - Παρακολούθηση χρήσης διακριτικών και εκτίμηση κόστους
  - Περιορισμός ρυθμού και διαχείριση σφαλμάτων
  - Ολοκληρωμένο README με οδηγό ανάπτυξης 35-45 λεπτών
  - 11 αρχεία έτοιμα για παραγωγή (πρότυπα Bicep, εφαρμογή Python, διαμόρφωση)
- **📚 Ασκήσεις Τεκμηρίωσης**: Προστέθηκαν πρακτικές ασκήσεις στον οδηγό διαμόρφωσης:
  - Άσκηση 1: Διαμόρφωση για πολλαπλά περιβάλλοντα (15 λεπτά)
  - Άσκηση 2: Άσκηση διαχείρισης μυστικών (10 λεπτά)
  - Σαφή κριτήρια επιτυχίας και βήματα επαλήθευσης
- **✅ Επαλήθευση Ανάπτυξης**: Προστέθηκε τμήμα επαλήθευσης στον οδηγό ανάπτυξης:
  - Διαδικασίες ελέγχου υγείας
  - Λίστα κριτηρίων επιτυχίας
  - Αναμενόμενες εξόδους για όλες τις εντολές ανάπτυξης
  - Γρήγορη αναφορά αντιμετώπισης προβλημάτων

#### Ενισχύσεις
- **examples/README.md**: Ενημερώθηκε σε ποιότητα επιπέδου Α (93%):
  - Προστέθηκε το azure-openai-chat σε όλα τα σχετικά τμήματα
  - Ενημερώθηκε ο αριθμός τοπικών παραδειγμάτων από 3 σε 4
  - Προστέθηκε στον πίνακα Παραδειγμάτων AI Εφαρμογών
  - Ενσωματώθηκε στο Quick Start για ενδιάμεσους χρήστες
  - Προστέθηκε στην ενότητα Προτύπων Microsoft Foundry
  - Ενημερώθηκε πίνακας σύγκρισης και τμήματα ευρέσεως τεχνολογίας
- **Ποιότητα Τεκμηρίωσης**: Βελτίωση από B+ (87%) σε A- (92%) σε όλο το φάκελο docs:

  - Προστέθηκαν αναμενόμενα αποτελέσματα στα κρίσιμα παραδείγματα εντολών
  - Περιλήφθηκαν βήματα επαλήθευσης για αλλαγές ρυθμίσεων
  - Ενισχυμένη πρακτική μάθηση με πρακτικές ασκήσεις

#### Αλλαγές
- **Πρόοδος Μάθησης**: Καλύτερη ενσωμάτωση παραδειγμάτων AI για ενδιάμεσους μαθητές
- **Δομή Τεκμηρίωσης**: Πιο πρακτικές ασκήσεις με σαφή αποτελέσματα
- **Διαδικασία Επαλήθευσης**: Προστέθηκαν ρητά κριτήρια επιτυχίας σε βασικές ροές εργασίας

#### Βελτιώσεις
- **Εμπειρία Προγραμματιστή**: Η ανάπτυξη μοντέλων Microsoft Foundry τώρα διαρκεί 35-45 λεπτά (έναντι 60-90 για σύνθετες εναλλακτικές)
- **Διαφάνεια Κόστους**: Ξεκάθαρες εκτιμήσεις κόστους ($50-200/μήνα) για το παράδειγμα Microsoft Foundry Models
- **Μονοπάτι Μάθησης**: Οι προγραμματιστές AI έχουν ξεκάθαρο σημείο εισόδου με το azure-openai-chat
- **Πρότυπα Τεκμηρίωσης**: Συνεπή αναμενόμενα αποτελέσματα και βήματα επαλήθευσης

#### Επαληθεύτηκε
- ✅ Το παράδειγμα Microsoft Foundry Models λειτουργεί πλήρως με `azd up`
- ✅ Όλα τα 11 αρχεία υλοποίησης συντακτικά σωστά
- ✅ Οι οδηγίες README ταιριάζουν με την πραγματική εμπειρία ανάπτυξης
- ✅ Οι συνδέσεις τεκμηρίωσης ενημερώθηκαν σε πάνω από 8 τοποθεσίες
- ✅ Ο κατάλογος παραδειγμάτων απεικονίζει με ακρίβεια 4 τοπικά παραδείγματα
- ✅ Δεν υπάρχουν διπλοί εξωτερικοί σύνδεσμοι στους πίνακες
- ✅ Όλες οι αναφορές πλοήγησης σωστές

#### Τεχνική Υλοποίηση
- **Αρχιτεκτονική Microsoft Foundry Models**: Σχέδιο gpt-4.1 + Key Vault + Container Apps
- **Ασφάλεια**: Έτοιμο Managed Identity, μυστικά στο Key Vault
- **Παρακολούθηση**: Ενσωμάτωση Application Insights
- **Διαχείριση Κόστους**: Παρακολούθηση token και βελτιστοποίηση χρήσης
- **Ανάπτυξη**: Μία εντολή `azd up` για πλήρη εγκατάσταση

### [v3.6.0] - 2025-11-19

#### Μεγάλη Ενημέρωση: Παραδείγματα Ανάπτυξης Container App
**Αυτή η έκδοση εισάγει ολοκληρωμένα παραδείγματα παραγωγικής ανάπτυξης container εφαρμογών χρησιμοποιώντας το Azure Developer CLI (AZD), με πλήρη τεκμηρίωση και ενσωμάτωση στο μονοπάτι μάθησης.**

#### Προστέθηκε
- **🚀 Παραδείγματα Container App**: Νέα τοπικά παραδείγματα στο `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Πλήρης επισκόπηση containerized αναπτύξεων, γρήγορη έναρξη, παραγωγή και προχωρημένα πρότυπα
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Φιλικό προς αρχάριους REST API με scale-to-zero, health probes, παρακολούθηση και αντιμετώπιση προβλημάτων
  - [Microservices Architecture](../../examples/container-app/microservices): Παραγωγική multi-service ανάπτυξη (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Βέλτιστες Πρακτικές**: Ασφάλεια, παρακολούθηση, βελτιστοποίηση κόστους και οδηγίες CI/CD για container εργασίες
- **Δείγματα Κώδικα**: Πλήρες `azure.yaml`, Bicep templates και πολυγλωσσικές υλοποιήσεις υπηρεσιών (Python, Node.js, C#, Go)
- **Δοκιμές & Αντιμετώπιση Προβλημάτων**: Ενδο-σενάρια τεστ, εντολές παρακολούθησης, οδηγίες αντιμετώπισης

#### Αλλαγές
- **README.md**: Ενημερώθηκε για να εμφανίζει και να συνδέει νέα παραδείγματα container app υπό "Τοπικά Παραδείγματα - Container Εφαρμογές"
- **examples/README.md**: Ενημερώθηκε για να τονίζει παραδείγματα container app, να προσθέτει καταχωρήσεις πίνακα σύγκρισης και να ανανεώνει αναφορές τεχνολογίας/αρχιτεκτονικής
- **Πρόγραμμα Μαθήματος & Οδηγός Μελέτης**: Ενημερώθηκαν για να αναφέρουν νέα παραδείγματα container app και πρότυπα ανάπτυξης σε σχετικά κεφάλαια

#### Επαληθεύτηκε
- ✅ Όλα τα νέα παραδείγματα αναπτύσσονται με `azd up` και ακολουθούν τις βέλτιστες πρακτικές
- ✅ Ενημερωμένες διασυνδέσεις τεκμηρίωσης και πλοήγησης
- ✅ Τα παραδείγματα καλύπτουν σενάρια από αρχάριους μέχρι προχωρημένους, συμπεριλαμβανομένων παραγωγικών microservices

#### Σημειώσεις
- **Έκταση**: Μόνο αγγλική τεκμηρίωση και παραδείγματα
- **Επόμενα Βήματα**: Επέκταση με επιπλέον προχωρημένα πρότυπα container και αυτοματοποίηση CI/CD σε μελλοντικές εκδόσεις

### [v3.5.0] - 2025-11-19

#### Επαναχάραξη Προϊόντος: Microsoft Foundry
**Αυτή η έκδοση εφαρμόζει ολοκληρωμένη αλλαγή ονόματος προϊόντος από "Microsoft Foundry" σε "Microsoft Foundry" σε όλη την αγγλική τεκμηρίωση, αντανακλώντας την επίσημη επαναχάραξη της Microsoft.**

#### Αλλαγές
- **🔄 Ενημέρωση Ονόματος Προϊόντος**: Ολοκληρωμένη επωνυμία από "Microsoft Foundry" σε "Microsoft Foundry"
  - Ενημερωμένες όλες οι αναφορές στην αγγλική τεκμηρίωση στον φάκελο `docs/`
  - Μετονομασία φακέλου: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Μετονομασία αρχείου: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Σύνολο: 23 αναφορές περιεχομένου ενημερώθηκαν σε 7 αρχεία τεκμηρίωσης

- **📁 Αλλαγές στη Δομή Φακέλων**:
  - `docs/ai-foundry/` μετονομάστηκε σε `docs/microsoft-foundry/`
  - Όλες οι διασταυρούμενες αναφορές ενημερώθηκαν για να αντανακλούν τη νέα δομή φακέλων
  - Επαληθεύτηκαν οι σύνδεσμοι πλοήγησης σε όλη την τεκμηρίωση

- **📄 Μετονομασίες Αρχείων**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Όλοι οι εσωτερικοί σύνδεσμοι ενημερώθηκαν να αναφέρονται στο νέο όνομα αρχείου

#### Ενημερωμένα Αρχεία
- **Τεκμηρίωση Κεφαλαίων** (7 αρχεία):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ενημερώσεις συνδέσμων πλοήγησης
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 ενημερώσεις αναφορών ονόματος προϊόντος
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ήδη χρησιμοποιεί Microsoft Foundry (από προηγούμενες ενημερώσεις)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 ενημερώσεις αναφορών (επισκόπηση, σχόλια κοινότητας, τεκμηρίωση)
  - `docs/getting-started/azd-basics.md` - 4 ενημερώσεις διασταυρούμενων συνδέσμων
  - `docs/getting-started/first-project.md` - 2 ενημερώσεις συνδέσμων πλοήγησης κεφαλαίων
  - `docs/getting-started/installation.md` - 2 ενημερώσεις επόμενων συνδέσεων κεφαλαίων
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 ενημερώσεις αναφορών (πλοήγηση, κοινότητα Discord)
  - `docs/troubleshooting/common-issues.md` - 1 ενημέρωση συνδέσμου πλοήγησης
  - `docs/troubleshooting/debugging.md` - 1 ενημέρωση συνδέσμου πλοήγησης

- **Αρχεία Δομής Μαθήματος** (2 αρχεία):
  - `README.md` - 17 ενημερώσεις αναφορών (επισκόπηση μαθήματος, τίτλοι κεφαλαίων, τμήμα προτύπων, πληροφορίες κοινότητας)
  - `course-outline.md` - 14 ενημερώσεις αναφορών (επισκόπηση, στόχοι μάθησης, πόροι κεφαλαίων)

#### Επαληθεύτηκε
- ✅ Μηδενικές εναπομείνασες αναφορές σε φάκελο "ai-foundry" στα αγγλικά docs
- ✅ Μηδενικές εναπομείνασες αναφορές στο όνομα προϊόντος "Microsoft Foundry" στα αγγλικά docs
- ✅ Όλοι οι σύνδεσμοι πλοήγησης λειτουργούν με τη νέα δομή φακέλου
- ✅ Οι μετονομασίες αρχείων και φακέλων ολοκληρώθηκαν επιτυχώς
- ✅ Οι διασταυρώσεις ανάμεσα σε κεφάλαια επαληθεύτηκαν

#### Σημειώσεις
- **Έκταση**: Οι αλλαγές εφαρμόστηκαν μόνο στην αγγλική τεκμηρίωση στον φάκελο `docs/`
- **Μεταφράσεις**: Οι φάκελοι μεταφράσεων (`translations/`) δεν ενημερώθηκαν σε αυτή την έκδοση
- **Εργαστήριο**: Το υλικό εργαστηρίου (`workshop/`) δεν ενημερώθηκε σε αυτή την έκδοση
- **Παραδείγματα**: Τα αρχεία παραδειγμάτων μπορεί να αναφέρουν ακόμα παλιά ονόματα (θα διορθωθεί σε μελλοντική ενημέρωση)
- **Εξωτερικοί Σύνδεσμοι**: Οι εξωτερικές διευθύνσεις URL και οι αναφορές στο GitHub παραμένουν αμετάβλητες

#### Οδηγός Μετακίνησης για Συνεργάτες
Αν έχετε τοπικά branches ή τεκμηρίωση που αναφέρονται στην παλιά δομή:
1. Ενημερώστε τις αναφορές φακέλων: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ενημερώστε τις αναφορές αρχείων: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Αντικαταστήστε το όνομα προϊόντος: "Microsoft Foundry" → "Microsoft Foundry"
4. Επαληθεύστε ότι όλοι οι εσωτερικοί σύνδεσμοι λειτουργούν ακόμα

---

### [v3.4.0] - 2025-10-24

#### Βελτιώσεις Προεπισκόπησης Υποδομής και Επαλήθευσης
**Αυτή η έκδοση εισάγει ολοκληρωμένη υποστήριξη για το νέο χαρακτηριστικό προεπισκόπησης Azure Developer CLI και ενισχύει την εμπειρία χρήστη του εργαστηρίου.**

#### Προστέθηκε
- **🧪 Τεκμηρίωση χαρακτηριστικού azd provision --preview**: Ολοκληρωμένη κάλυψη της νέας δυνατότητας προεπισκόπησης υποδομής
  - Αναφορά εντολής και παραδείγματα χρήσης σε cheat sheet
  - Λεπτομερής ενσωμάτωση στον οδηγό παροχής με περιπτώσεις χρήσης και οφέλη
  - Ενσωμάτωση ελέγχου προ-πτήσης για ασφαλέστερη επικύρωση ανάπτυξης
  - Ενημερώσεις οδηγού έναρξης με πρακτικές ανάπτυξης με προτεραιότητα στην ασφάλεια
- **🚧 Banner Κατάστασης Εργαστηρίου**: Επαγγελματικό HTML banner που υποδεικνύει την κατάσταση ανάπτυξης του εργαστηρίου
  - Σχεδιασμός με gradient και δείκτες κατασκευής για σαφή επικοινωνία προς τον χρήστη
  - Χρονική σήμανση τελευταίας ενημέρωσης για διαφάνεια
  - Σχεδιασμός προσαρμοστικός για όλες τις συσκευές

#### Ενισχυμένες
- **Ασφάλεια Υποδομής**: Ενσωμάτωση λειτουργικότητας προεπισκόπησης σε όλη την τεκμηρίωση ανάπτυξης
- **Επαλήθευση Πριν την Ανάπτυξη**: Τα αυτοματοποιημένα scripts πλέον περιλαμβάνουν δοκιμές προεπισκόπησης υποδομής
- **Ροές Εργασίας Προγραμματιστή**: Ενημέρωση ακολουθιών εντολών ώστε να συμπεριλαμβάνουν την προεπισκόπηση ως βέλτιστη πρακτική
- **Εμπειρία Εργαστηρίου**: Καθορισμένα σαφή αναμενόμενα για τους χρήστες σχετικά με την κατάσταση ανάπτυξης υλικού

#### Αλλαγές
- **Βέλτιστες Πρακτικές Ανάπτυξης**: Ο ρόλος προεπισκόπησης πρώτα προτείνεται ως προσέγγιση
- **Ροή Τεκμηρίωσης**: Η επαλήθευση υποδομής μετατέθηκε νωρίτερα στη διαδικασία μάθησης
- **Παρουσίαση Εργαστηρίου**: Επαγγελματική επικοινωνία κατάστασης με σαφές χρονοδιάγραμμα ανάπτυξης

#### Βελτιώσεις
- **Προσέγγιση με Προτεραιότητα Ασφαλείας**: Τώρα οι αλλαγές υποδομής μπορούν να επαληθευτούν πριν την ανάπτυξη
- **Συνεργασία Ομάδας**: Τα αποτελέσματα προεπισκόπησης μπορούν να μοιραστούν για αναθεώρηση και έγκριση
- **Ενημέρωση Κόστους**: Καλύτερη κατανόηση κόστους πόρων πριν την παροχή
- **Μείωση Κινδύνου**: Μειωμένες αποτυχίες ανάπτυξης μέσω προχωρημένης επαλήθευσης

#### Τεχνική Υλοποίηση
- **Ενσωμάτωση Πολλών Αρχείων**: Το χαρακτηριστικό προεπισκόπησης τεκμηριώνεται σε 4 βασικά αρχεία
- **Πρότυπα Εντολών**: Συνεπής σύνταξη και παραδείγματα σε όλη την τεκμηρίωση
- **Ενσωμάτωση Βέλτιστων Πρακτικών**: Η προεπισκόπηση συμπεριλαμβάνεται σε ροές επαλήθευσης και scripts
- **Οπτικοί Δείκτες**: Σαφείς ενδείξεις ΝΕΟΥ χαρακτηριστικού για εύκολη ανακάλυψη

#### Υποδομή Εργαστηρίου
- **Επικοινωνία Κατάστασης**: Επαγγελματικό HTML banner με στυλ gradient
- **Εμπειρία Χρήστη**: Σαφής κατάσταση ανάπτυξης για αποφυγή σύγχυσης
- **Επαγγελματική Παρουσίαση**: Διατηρεί τη φήμη του αποθετηρίου ενώ θέτει προσδοκίες
- **Διαφάνεια Χρονοδιαγράμματος**: Χρονική σήμανση τελευταίας ενημέρωσης Οκτωβρίου 2025 για υπευθυνότητα

### [v3.3.0] - 2025-09-24

#### Ενισχυμένο Υλικό Εργαστηρίου και Διαδραστική Εμπειρία Μάθησης
**Αυτή η έκδοση εισάγει ολοκληρωμένο υλικό εργαστηρίου με διαδραστικούς οδηγούς βασισμένους σε πρόγραμμα περιήγησης και δομημένα μονοπάτια μάθησης.**

#### Προστέθηκε
- **🎥 Διαδραστικός Οδηγός Εργαστηρίου**: Εμπειρία εργαστηρίου που λειτουργεί στον browser με δυνατότητα προεπισκόπησης MkDocs
- **📝 Δομημένες Οδηγίες Εργαστηρίου**: 7βήμα καθοδηγούμενο μονοπάτι μάθησης από την ανακάλυψη έως την προσαρμογή
  - 0-Εισαγωγή: Επισκόπηση εργαστηρίου και εγκατάσταση
  - 1-Επιλογή-Προτύπου-AI: Διαδικασία ανακάλυψης και επιλογής προτύπου
  - 2-Επαλήθευση-Προτύπου-AI: Διαδικασίες ανάπτυξης και επαλήθευσης
  - 3-Αποδόμηση-Προτύπου-AI: Κατανόηση αρχιτεκτονικής προτύπου
  - 4-Διαμόρφωση-Προτύπου-AI: Ρύθμιση και προσαρμογή
  - 5-Προσαρμογή-Προτύπου-AI: Προχωρημένες τροποποιήσεις και επαναλήψεις
  - 6-Καθαρισμός-Υποδομής: Εκκαθάριση και διαχείριση πόρων
  - 7-Ολοκλήρωση: Περίληψη και επόμενα βήματα
- **🛠️ Εργαλεία Εργαστηρίου**: Ρύθμιση MkDocs με θέμα Material για βελτιωμένη εμπειρία μάθησης
- **🎯 Μονοπάτι Πρακτικής Μάθησης**: Μεθοδολογία 3 βημάτων (Ανακάλυψη → Ανάπτυξη → Προσαρμογή)
- **📱 Ενσωμάτωση GitHub Codespaces**: Αδιάλειπτη ρύθμιση περιβάλλοντος ανάπτυξης

#### Ενισχυμένες
- **AI Workshop Lab**: Επεκτάθηκε με ολοκληρωμένη εμπειρία μάθησης 2-3 ωρών
- **Τεκμηρίωση Εργαστηρίου**: Επαγγελματική παρουσίαση με πλοήγηση και οπτικά βοηθήματα
- **Πρόοδος Μάθησης**: Σαφείς οδηγίες βήμα προς βήμα από την επιλογή προτύπου έως την παραγωγική ανάπτυξη
- **Εμπειρία Προγραμματιστή**: Ενσωματωμένα εργαλεία για ομαλές ροές εργασίας ανάπτυξης

#### Βελτιώσεις
- **Προσβασιμότητα**: Διεπαφή βασισμένη σε browser με λειτουργία αναζήτησης, δυνατότητα αντιγραφής και αλλαγή θέματος
- **Αυτορυθμιζόμενη Μάθηση**: Ευέλικτη δομή εργαστηρίου που επιτρέπει διαφορετικούς ρυθμούς μάθησης
- **Πρακτική Εφαρμογή**: Σενάρια ανάπτυξης προτύπων AI στην πράξη
- **Ενσωμάτωση Κοινότητας**: Ενσωμάτωση Discord για υποστήριξη και συνεργασία στο εργαστήριο

#### Χαρακτηριστικά Εργαστηρίου
- **Ενσωματωμένη Αναζήτηση**: Γρήγορη ανακάλυψη λέξεων-κλειδιών και μαθημάτων
- **Αντιγραφή Κωδικών Μπλοκ**: Λειτουργία hover-to-copy για όλα τα παραδείγματα κώδικα
- **Αλλαγή Θέματος**: Υποστήριξη σκοτεινής/φωτεινής λειτουργίας για διαφορετικές προτιμήσεις
- **Οπτικά Αποτελέσματα**: Στιγμιότυπα οθόνης και διαγράμματα για βελτιωμένη κατανόηση
- **Ενσωμάτωση Βοήθειας**: Άμεση πρόσβαση σε Discord για υποστήριξη κοινότητας

### [v3.2.0] - 2025-09-17

#### Μεγάλη Αναδιάρθρωση Πλοήγησης και Σύστημα Μάθησης Βασισμένο σε Κεφάλαια
**Αυτή η έκδοση εισάγει μια ολοκληρωμένη δομή μάθησης βασισμένη σε κεφάλαια με βελτιωμένη πλοήγηση σε όλο το αποθετήριο.**

#### Προστέθηκε
- **📚 Σύστημα Μάθησης Βασισμένο σε Κεφάλαια**: Αναδιαρθρώθηκε ολόκληρο το μάθημα σε 8 προοδευτικά κεφάλαια μάθησης
  - Κεφάλαιο 1: Βάσεις & Γρήγορη Εκκίνηση (⭐ - 30-45 λεπτά)
  - Κεφάλαιο 2: AI-First Ανάπτυξη (⭐⭐ - 1-2 ώρες)
  - Κεφάλαιο 3: Ρύθμιση & Πιστοποίηση (⭐⭐ - 45-60 λεπτά)
  - Κεφάλαιο 4: Υποδομή ως Κώδικας & Ανάπτυξη (⭐⭐⭐ - 1-1.5 ώρες)
  - Κεφάλαιο 5: Πολλαπλοί Πράκτορες AI (⭐⭐⭐⭐ - 2-3 ώρες)
  - Κεφάλαιο 6: Επαλήθευση & Σχεδιασμός πριν την Ανάπτυξη (⭐⭐ - 1 ώρα)
  - Κεφάλαιο 7: Αντιμετώπιση Προβλημάτων & Αποσφαλμάτωση (⭐⭐ - 1-1.5 ώρες)
  - Κεφάλαιο 8: Παραγωγή & Πρότυπα Επιχειρήσεων (⭐⭐⭐⭐ - 2-3 ώρες)
- **📚 Ολοκληρωμένο Σύστημα Πλοήγησης**: Συνεπείς επικεφαλίδες και υποσέλιδα πλοήγησης σε όλη την τεκμηρίωση
- **🎯 Παρακολούθηση Προόδου**: Λίστα ελέγχου ολοκλήρωσης μαθήματος και σύστημα επαλήθευσης μάθησης
- **🗺️ Καθοδήγηση Μονοπατιού Μάθησης**: Ξεκάθαρα σημεία εισόδου για διαφορετικά επίπεδα εμπειρίας και στόχους
- **🔗 Διασταυρούμενη Πλοήγηση**: Σχετικά κεφάλαια και προαπαιτούμενα με σαφείς συνδέσεις

#### Ενισχυμένες
- **Δομή README**: Μετατράπηκε σε δομημένη πλατφόρμα μάθησης με οργάνωση βασισμένη σε κεφάλαια
- **Πλοήγηση Τεκμηρίωσης**: Κάθε σελίδα τώρα περιλαμβάνει συμφραζόμενα κεφαλαίου και καθοδήγηση προόδου
- **Οργάνωση Προτύπων**: Παραδείγματα και πρότυπα χαρτογραφημένα στα κατάλληλα κεφάλαια μάθησης

- **Ενσωμάτωση Πόρων**: Φύλλα απάτης, Συχνές Ερωτήσεις, και οδηγοί μελέτης συνδεδεμένοι με σχετικά κεφάλαια
- **Ενσωμάτωση Εργαστηρίου**: Πρακτικά εργαστήρια αντιστοιχισμένα σε πολλαπλούς μαθησιακούς στόχους κεφαλαίων

#### Αλλαγές
- **Πρόοδος Μάθησης**: Μετακινήθηκε από γραμμική τεκμηρίωση σε ευέλικτη μάθηση βάσει κεφαλαίων
- **Τοποθέτηση Διαμόρφωσης**: Μεταθετοποίηση του οδηγού διαμόρφωσης ως Κεφάλαιο 3 για καλύτερη ροή μάθησης
- **Ενσωμάτωση Περιεχομένου AI**: Καλύτερη ενσωμάτωση περιεχομένου ειδικά για AI σε όλη τη μαθησιακή διαδρομή
- **Παραγωγικό Περιεχόμενο**: Συγκεντρωμένα προηγμένα πρότυπα στο Κεφάλαιο 8 για εκπαίδευση επιχειρήσεων

#### Βελτιώσεις
- **Εμπειρία Χρήστη**: Σαφείς ενδείξεις πλοήγησης και προόδου κεφαλαίων
- **Προσβασιμότητα**: Συνεπή πρότυπα πλοήγησης για ευκολότερη διαδρομή στο μάθημα
- **Επαγγελματική Παρουσίαση**: Δομή μαθημάτων τύπου πανεπιστημίου κατάλληλη για ακαδημαϊκή και εταιρική εκπαίδευση
- **Αποδοτικότητα Μάθησης**: Μειωμένος χρόνος εύρεσης σχετικού περιεχομένου μέσω βελτιωμένης οργάνωσης

#### Τεχνική Υλοποίηση
- **Κεφαλίδες Πλοήγησης**: Τυποποιημένη πλοήγηση κεφαλαίων σε πάνω από 40 αρχεία τεκμηρίωσης
- **Πλοήγηση Υποσέλιδου**: Συνεπής καθοδήγηση προόδου και ενδείξεις ολοκλήρωσης κεφαλαίων
- **Εσωτερική Διασύνδεση**: Ολοκληρωμένο σύστημα εσωτερικών συνδέσμων που συνδέει σχετικές έννοιες
- **Αντιστοίχιση Κεφαλαίων**: Πρότυπα και παραδείγματα σαφώς συνδεδεμένα με μαθησιακούς στόχους

#### Βελτίωση Οδηγού Μελέτης
- **📚 Ολοκληρωμένοι Μαθησιακοί Στόχοι**: Αναδιάρθρωση του οδηγού μελέτης για ευθυγράμμιση με σύστημα 8 κεφαλαίων
- **🎯 Αξιολόγηση βάσει Κεφαλαίων**: Κάθε κεφάλαιο περιλαμβάνει συγκεκριμένους μαθησιακούς στόχους και πρακτικές ασκήσεις
- **📋 Παρακολούθηση Προόδου**: Εβδομαδιαίο πρόγραμμα μάθησης με μετρήσιμα αποτελέσματα και λίστες ελέγχου ολοκλήρωσης
- **❓ Ερωτήσεις Αξιολόγησης**: Ερωτήσεις επαλήθευσης γνώσεων για κάθε κεφάλαιο με επαγγελματικά αποτελέσματα
- **🛠️ Πρακτικές Ασκήσεις**: Πρακτικές δραστηριότητες με πραγματικά σενάρια ανάπτυξης και επίλυσης προβλημάτων
- **📊 Πρόοδος Δεξιοτήτων**: Σαφής εξέλιξη από βασικές έννοιες σε πρότυπα επιχειρήσεων με εστίαση στην καριέρα
- **🎓 Πλαίσιο Πιστοποίησης**: Αποτελέσματα επαγγελματικής ανάπτυξης και σύστημα αναγνώρισης κοινότητας
- **⏱️ Διαχείριση Χρονοδιαγράμματος**: Δομημένο 10-εβδομαδιαίο πρόγραμμα μάθησης με επικύρωση ορόσημων

### [v3.1.0] - 2025-09-17

#### Βελτιωμένες Λύσεις Πολυ-Πράκτορα AI
**Αυτή η έκδοση βελτιώνει τη λύση πολυ-πράκτορα λιανικής με καλύτερη ονομασία πρακτόρων και βελτιωμένη τεκμηρίωση.**

#### Αλλαγές
- **Ορολογία Πολυ-Πράκτορα**: Αντικατέστησε το "Cora agent" με "Customer agent" σε όλη τη λύση πολυ-πράκτορα λιανικής για καλύτερη κατανόηση
- **Αρχιτεκτονική Πράκτορα**: Ενημερώθηκαν όλα τα έγγραφα, τα πρότυπα ARM, και παραδείγματα κώδικα με συνεπή ονομασία "Customer agent"
- **Παραδείγματα Διαμόρφωσης**: Ενημερωμένα πρότυπα διαμόρφωσης πράκτορα με αναθεωρημένες ονομασίες
- **Συνέπεια Τεκμηρίωσης**: Βεβαιώθηκαν ότι όλες οι αναφορές χρησιμοποιούν επαγγελματικά, περιγραφικά ονόματα πρακτόρων

#### Βελτιώσεις
- **Πακέτο Προτύπου ARM**: Ενημερώθηκε retail-multiagent-arm-template με αναφορές σε Customer agent
- **Διαγράμματα Αρχιτεκτονικής**: Ανανεώθηκαν διαγράμματα Mermaid με ενημερωμένες ονομασίες πρακτόρων
- **Παραδείγματα Κώδικα**: Κλάσεις Python και παραδείγματα υλοποίησης τώρα χρησιμοποιούν ονομασία CustomerAgent
- **Μεταβλητές Περιβάλλοντος**: Ενημερώθηκαν όλα τα σενάρια ανάπτυξης για χρήση συμβάσεων CUSTOMER_AGENT_NAME

#### Βελτιώσεις
- **Εμπειρία Προγραμματιστή**: Πιο καθαρές ρόλοι και ευθύνες πράκτορα στην τεκμηρίωση
- **Ετοιμότητα Παραγωγής**: Καλύτερη ευθυγράμμιση με ονομασίες επιχειρήσεων
- **Υλικά Μάθησης**: Πιο διαισθητική ονομασία πρακτόρων για εκπαιδευτικούς σκοπούς
- **Χρηστικότητα Προτύπου**: Απλοποιημένη κατανόηση λειτουργιών πράκτορα και προτύπων ανάπτυξης

#### Τεχνικές Λεπτομέρειες
- Ενημερωμένα διαγράμματα αρχιτεκτονικής Mermaid με αναφορές CustomerAgent
- Αντικαταστάθηκαν ονόματα κλάσεων CoraAgent με CustomerAgent σε παραδείγματα Python
- Τροποποιημένες ρυθμίσεις JSON προτύπων ARM για χρήση τύπου πράκτορα "customer"
- Ενημερώθηκαν μεταβλητές περιβάλλοντος από CORA_AGENT_* σε CUSTOMER_AGENT_*
- Ανανεώθηκαν όλες οι εντολές ανάπτυξης και ρυθμίσεις κοντέινερ

### [v3.0.0] - 2025-09-12

#### Μεγάλες Αλλαγές - Εστίαση σε AI Developers και Ενσωμάτωση Microsoft Foundry
**Αυτή η έκδοση μετατρέπει το αποθετήριο σε ολοκληρωμένη πηγή μάθησης με επίκεντρο το AI και ενσωμάτωση Microsoft Foundry.**

#### Προστέθηκαν
- **🤖 Διαδρομή Μαθησιας AI-First**: Πλήρης αναδιάρθρωση με προτεραιότητα σε developers και μηχανικούς AI
- **Οδηγός Ενσωμάτωσης Microsoft Foundry**: Ολοκληρωμένη τεκμηρίωση σύνδεσης AZD με υπηρεσίες Microsoft Foundry
- **Πρότυπα Ανάπτυξης Μοντέλων AI**: Λεπτομερής οδηγός επιλογής μοντέλων, ρύθμισης και στρατηγικών παραγωγής
- **AI Εργαστήριο**: Πρακτικό εργαστήριο 2-3 ωρών για μετατροπή εφαρμογών AI σε λύσεις αναπτύξιμες με AZD
- **Καλές Πρακτικές Παραγωγής AI**: Πρότυπα έτοιμα για επιχειρήσεις για κλιμάκωση, παρακολούθηση και ασφάλεια AI φορτίων
- **Οδηγός Επίλυσης Προβλημάτων AI**: Ολοκληρωμένη αντιμετώπιση προβλημάτων Microsoft Foundry Models, Cognitive Services και AI ανάπτυξης
- **Γκαλερί Προτύπων AI**: Επιλεγμένη συλλογή προτύπων Microsoft Foundry με βαθμολογία πολυπλοκότητας
- **Υλικά Εργαστηρίου**: Πλήρης δομή εργαστηρίου με πρακτικά εργαστήρια και υλικά αναφοράς

#### Βελτιώσεις
- **Δομή README**: Εστίαση σε AI προγραμματιστές με δεδομένα 45% ενδιαφέροντος κοινότητας από Microsoft Foundry Discord
- **Μονοπάτια Μάθησης**: Αφιερωμένη διαδρομή AI δίπλα σε παραδοσιακά μονοπάτια για φοιτητές και μηχανικούς DevOps
- **Προτάσεις Προτύπων**: Επιλεγμένα πρότυπα AI όπως azure-search-openai-demo, contoso-chat, και openai-chat-app-quickstart
- **Ενσωμάτωση Κοινότητας**: Ενισχυμένη υποστήριξη κοινότητας Discord με κανάλια και συζητήσεις ειδικά για AI

#### Εστίαση σε Ασφάλεια & Παραγωγή
- **Πρότυπα Διαχείρισης Ταυτότητας**: Ειδικές για AI ρυθμίσεις αυθεντικοποίησης και ασφάλειας
- **Βελτιστοποίηση Κόστους**: Παρακολούθηση χρήσης τοκεν και έλεγχοι προϋπολογισμού για AI φορτία
- **Ανάπτυξη σε Πολλαπλές Περιοχές**: Στρατηγικές παγκόσμιας ανάπτυξης εφαρμογών AI
- **Παρακολούθηση Απόδοσης**: Μετρικές ειδικές για AI και ενσωμάτωση Application Insights

#### Ποιότητα Τεκμηρίωσης
- **Γραμμική Δομή Μαθήματος**: Λογική πρόοδος από αρχάριο σε προχωρημένα πρότυπα ανάπτυξης AI
- **Ελεγμένα URLs**: Όλοι οι εξωτερικοί σύνδεσμοι αποθετηρίου επαληθευμένοι και προσβάσιμοι
- **Πλήρης Αναφορά**: Όλοι εσωτερικοί σύνδεσμοι τεκμηρίωσης επαληθευμένοι και λειτουργικοί
- **Έτοιμο για Παραγωγή**: Πρότυπα ανάπτυξης επιχειρήσεων με παραδείγματα πραγματικού κόσμου

### [v2.0.0] - 2025-09-09

#### Μεγάλες Αλλαγές - Αναδιάρθρωση Αποθετηρίου και Επαγγελματική Βελτίωση
**Αυτή η έκδοση αποτελεί σημαντική αναθεώρηση της δομής του αποθετηρίου και παρουσίασης περιεχομένου.**

#### Προστέθηκαν
- **Δομημένο Πλαίσιο Μάθησης**: Όλες οι σελίδες τεκμηρίωσης περιλαμβάνουν τώρα Εισαγωγή, Στόχους Μάθησης και Αποτελέσματα Μάθησης
- **Σύστημα Πλοήγησης**: Προστέθηκαν σύνδεσμοι Προηγούμενο/Επόμενο μάθημα σε όλη την τεκμηρίωση για καθοδηγούμενη πρόοδο μάθησης
- **Οδηγός Μελέτης**: Ολοκληρωμένος study-guide.md με μαθησιακούς στόχους, πρακτικές ασκήσεις και υλικά αξιολόγησης
- **Επαγγελματική Παρουσίαση**: Αφαιρέθηκαν όλα τα emoji για βελτιωμένη προσβασιμότητα και επαγγελματική εμφάνιση
- **Βελτιωμένη Δομή Περιεχομένου**: Βελτιωμένη οργάνωση και ροή υλικών μάθησης

#### Αλλαγές
- **Μορφή Τεκμηρίωσης**: Τυποποιήθηκαν όλα τα έγγραφα με συνεπή δομή προσανατολισμένη στη μάθηση
- **Ροή Πλοήγησης**: Υλοποιήθηκε λογική πρόοδος μέσα σε όλα τα υλικά μάθησης
- **Παρουσίαση Περιεχομένου**: Αφαιρέθηκαν διακοσμητικά στοιχεία υπέρ καθαρού, επαγγελματικού μορφοποίησης
- **Δομή Συνδέσμων**: Ενημερώθηκαν όλοι οι εσωτερικοί σύνδεσμοι για υποστήριξη του νέου συστήματος πλοήγησης

#### Βελτιώσεις
- **Προσβασιμότητα**: Αφαιρέθηκαν εξαρτήσεις από emoji για καλύτερη συμβατότητα με αναγνώστες οθόνης
- **Επαγγελματική Εμφάνιση**: Καθαρή, ακαδημαϊκού τύπου παρουσίαση κατάλληλη για μάθηση επιχειρήσεων
- **Εμπειρία Μάθησης**: Δομημένη προσέγγιση με σαφείς στόχους και αποτελέσματα για κάθε μάθημα
- **Οργάνωση Περιεχομένου**: Καλύτερη λογική ροή και σύνδεση μεταξύ σχετικών θεμάτων

### [v1.0.0] - 2025-09-09

#### Αρχική Έκδοση - Ολοκληρωμένο Αποθετήριο Μάθησης AZD

#### Προστέθηκαν
- **Βασική Δομή Τεκμηρίωσης**
  - Πλήρης σειρά οδηγιών για την εκκίνηση
  - Ολοκληρωμένη τεκμηρίωση ανάπτυξης και προμήθειας
  - Αναλυτικοί πόροι αντιμετώπισης προβλημάτων και οδηγοί αποσφαλμάτωσης
  - Εργαλεία και διαδικασίες επαλήθευσης πριν την ανάπτυξη

- **Μονάδα Εκκίνησης**
  - Βασικά AZD: Βασικές έννοιες και ορολογία
  - Οδηγός Εγκατάστασης: Οδηγίες ρύθμισης πλατφόρμας
  - Οδηγός Διαμόρφωσης: Ρύθμιση περιβάλλοντος και αυθεντικοποίηση
  - Πρώτο Πρότζεκτ Tutorial: Βήμα-βήμα πρακτική μάθηση

- **Μονάδα Ανάπτυξης και Προμήθειας**
  - Οδηγός Ανάπτυξης: Πλήρης τεκμηρίωση ροής εργασίας
  - Οδηγός Προμήθειας: Υποδομή ως Κώδικας με Bicep
  - Καλές πρακτικές για ανάπτυξη σε παραγωγή
  - Πρότυπα αρχιτεκτονικής πολλαπλών υπηρεσιών

- **Μονάδα Επαλήθευσης Πριν την Ανάπτυξη**
  - Σχεδιασμός Χωρητικότητας: Επαλήθευση διαθεσιμότητας πόρων Azure
  - Επιλογή SKU: Οδηγίες για επίπεδα υπηρεσιών
  - Έλεγχοι Προ - πτήσης: Αυτοματοποιημένα σενάρια επαλήθευσης (PowerShell και Bash)
  - Εργαλεία εκτίμησης κόστους και προγραμματισμού προϋπολογισμού

- **Μονάδα Αντιμετώπισης Προβλημάτων**
  - Συνήθη προβλήματα: Συχνά ζητήματα και λύσεις
  - Οδηγός αποσφαλμάτωσης: Συστηματικές μεθοδολογίες αντιμετώπισης προβλημάτων
  - Προηγμένες τεχνικές και εργαλεία διάγνωσης
  - Παρακολούθηση και βελτιστοποίηση απόδοσης

- **Πόροι και Αναφορές**
  - Φύλλο απλών εντολών: Γρήγορη αναφορά βασικών εντολών
  - Γλωσσάρι: Ολοκληρωμένος ορισμός όρων και ακρωνυμίων
  - Συχνές Ερωτήσεις: Λεπτομερείς απαντήσεις σε κοινές ερωτήσεις
  - Εξωτερικοί σύνδεσμοι πόρων και συνδέσεις κοινότητας

- **Παραδείγματα και Πρότυπα**
  - Παράδειγμα απλής web εφαρμογής
  - Πρότυπο ανάπτυξης στατικής ιστοσελίδας
  - Ρύθμιση εφαρμογής κοντέινερ
  - Πρότυπα ενσωμάτωσης βάσεων δεδομένων
  - Παραδείγματα αρχιτεκτονικής μικροϋπηρεσιών
  - Υλοποιήσεις serverless λειτουργιών

#### Χαρακτηριστικά
- **Υποστήριξη Πολλαπλών Πλατφορμών**: Οδηγοί εγκατάστασης και ρύθμισης για Windows, macOS, και Linux
- **Πολλαπλά Επίπεδα Ικανοτήτων**: Περιεχόμενο σχεδιασμένο από φοιτητές έως επαγγελματίες προγραμματιστές
- **Πρακτική Εστίαση**: Πρακτικά παραδείγματα και σενάρια πραγματικού κόσμου
- **Ολοκληρωμένη Κάλυψη**: Από βασικές έννοιες έως προηγμένα πρότυπα επιχειρήσεων
- **Προσέγγιση Ασφάλειας-Πρώτα**: Καλές πρακτικές ασφάλειας ενσωματωμένες παντού
- **Βελτιστοποίηση Κόστους**: Οδηγίες για οικονομικές αναπτύξεις και διαχείριση πόρων

#### Ποιότητα Τεκμηρίωσης
- **Λεπτομερή Παραδείγματα Κώδικα**: Πρακτικά, δοκιμασμένα δείγματα κώδικα
- **Οδηγίες Βήμα-Βήμα**: Καθαρές, εφαρμόσιμες οδηγίες
- **Ολοκληρωμένη Διαχείριση Σφαλμάτων**: Αντιμετώπιση κοινού προβλημάτων
- **Ενσωμάτωση Καλών Πρακτικών**: Πρότυπα και συστάσεις βιομηχανίας
- **Συμβατότητα Έκδοσης**: Ενημερωμένο με τις τελευταίες υπηρεσίες Azure και χαρακτηριστικά azd

## Προγραμματισμένες Μελλοντικές Βελτιώσεις

### Έκδοση 3.1.0 (Προγραμματισμένη)
#### Επέκταση Πλατφόρμας AI
- **Υποστήριξη Πολλαπλών Μοντέλων**: Πρότυπα ενσωμάτωσης για Hugging Face, Azure Machine Learning, και προσαρμοσμένα μοντέλα
- **Πλαίσια Πράκτορα AI**: Πρότυπα για υλοποιήσεις LangChain, Semantic Kernel, και AutoGen
- **Προηγμένα Πρότυπα RAG**: Επιλογές βάσης δεδομένων διανυσμάτων πέραν Azure AI Search (Pinecone, Weaviate, κ.ά.)
- **Παρατηρησιμότητα AI**: Βελτιωμένη παρακολούθηση απόδοσης μοντέλων, χρήσης τοκεν και ποιότητας απόκρισης

#### Εμπειρία Προγραμματιστή
- **Επέκταση VS Code**: Ενσωματωμένη εμπειρία ανάπτυξης AZD + Microsoft Foundry
- **Ενσωμάτωση GitHub Copilot**: Δημιουργία προτύπων AZD με βοήθεια AI
- **Διαδραστικά Tutorials**: Πρακτικές ασκήσεις κώδικα με αυτοματοποιημένη επικύρωση για σενάρια AI
- **Βίντεο Περιεχόμενο**: Συμπληρωματικά βίντεο tutorials για οπτικούς μαθητές εστιασμένα σε αναπτύξεις AI

### Έκδοση 4.0.0 (Προγραμματισμένη)
#### Πρότυπα Επιχειρηματικού AI
- **Πλαίσιο Διακυβέρνησης**: Διακυβέρνηση μοντέλων AI, συμμόρφωση και ίχνη ελέγχου
- **Πολυενοικιακό AI**: Πρότυπα για εξυπηρέτηση πολλών πελατών με απομονωμένες υπηρεσίες AI
- **Ανάπτυξη AI στο Edge**: Ενσωμάτωση με Azure IoT Edge και instances κοντέινερ
- **Υβριδικό Cloud AI**: Πρότυπα πολλαπλών και υβριδικών cloud για AI φορτία

#### Προηγμένα Χαρακτηριστικά
- **Αυτοματοποίηση Pipeline AI**: Ενσωμάτωση MLOps με Azure Machine Learning pipelines
- **Προηγμένη Ασφάλεια**: Πρότυπα zero-trust, ιδιωτικά endpoints και προχωρημένη προστασία απειλών
- **Βελτιστοποίηση Απόδοσης**: Προηγμένες στρατηγικές ρύθμισης και κλιμάκωσης για εφαρμογές AI υψηλής απόδοσης
- **Παγκόσμια Διανομή**: Πρότυπα διανομής περιεχομένου και caching στο edge για εφαρμογές AI

### Έκδοση 3.0.0 (Προγραμματισμένη) - Αντικαταστάθηκε από Τρέχουσα Έκδοση
#### Προτεινόμενες Προσθήκες - Τώρα Υλοποιημένες στην v3.0.0
- ✅ **Περιεχόμενο Εστιασμένο σε AI**: Ολοκληρωμένη ενσωμάτωση Microsoft Foundry (Ολοκληρώθηκε)
- ✅ **Διαδραστικά Tutorials**: Πρακτικό εργαστήριο AI (Ολοκληρώθηκε)
- ✅ **Προηγμένη Μονάδα Ασφάλειας**: Πρότυπα ασφάλειας ειδικά για AI (Ολοκληρώθηκε)
- ✅ **Βελτιστοποίηση Απόδοσης**: Στρατηγικές ρύθμισης φορτίων AI (Ολοκληρώθηκε)

### Έκδοση 2.1.0 (Προγραμματισμένη) - Μερικώς Υλοποιημένη στην v3.0.0
#### Μικρές Βελτιώσεις - Μερικές Ολοκληρωμένες στην Τρέχουσα Έκδοση
- ✅ **Πρόσθετα Παραδείγματα**: Σενάρια ανάπτυξης εστιασμένα σε AI (Ολοκληρώθηκε)
- ✅ **Εκτενές FAQ**: Ερωτήσεις και αντιμετώπιση προβλημάτων ειδικά για AI (Ολοκληρώθηκε)
- **Ενσωμάτωση Εργαλείων**: Οδηγοί ενσωμάτωσης IDE και επεξεργαστών
- ✅ **Επέκταση Παρακολούθησης**: Πρότυπα παρακολούθησης και ειδοποιήσεων ειδικά για AI (Ολοκληρώθηκε)

#### Ακόμα Προγραμματισμένα για Μελλοντική Έκδοση
- **Τεκμηρίωση Φιλική προς Κινητά**: Responsive σχεδιασμός για μάθηση μέσω κινητών
- **Πρόσβαση Offline**: Πακέτα τεκμηρίωσης διαθέσιμα για λήψη
- **Ενισχυμένη Ενσωμάτωση IDE**: Επέκταση VS Code για ροές εργασίας AZD + AI
- **Πίνακας Κοινότητας**: Μετρικές κοινότητας σε πραγματικό χρόνο και παρακολούθηση συνεισφορών

## Συνεισφορά στο Αρχείο Αλλαγών

### Αναφορά Αλλαγών
Κατά τη συνεισφορά σε αυτό το αποθετήριο, παρακαλούμε βεβαιωθείτε ότι οι καταχωρήσεις αλλαγών περιλαμβάνουν:

1. **Αριθμός Έκδοσης**: Σύμφωνα με τη σημασιολογική έκδοση (major.minor.patch)
2. **Ημερομηνία**: Ημερομηνία έκδοσης ή ενημέρωσης σε μορφή YYYY-MM-DD
3. **Κατηγορία**: Προστέθηκε, Αλλάχθηκε, Απαγορεύτηκε, Αφαιρέθηκε, Διορθώθηκε, Ασφάλεια
4. **Σαφής Περιγραφή**: Συνοπτική περιγραφή του τι άλλαξε
5. **Αξιολόγηση Επίδρασης**: Πώς οι αλλαγές επηρεάζουν τους υπάρχοντες χρήστες

### Κατηγορίες Αλλαγών

#### Προστέθηκαν
- Νέα χαρακτηριστικά, ενότητες τεκμηρίωσης ή δυνατότητες
- Νέα παραδείγματα, πρότυπα ή μαθησιακοί πόροι
- Πρόσθετα εργαλεία, σενάρια ή βοηθήματα

#### Αλλάχθηκαν
- Τροποποιήσεις σε υπάρχουσες λειτουργίες ή τεκμηρίωση
- Ενημερώσεις για βελτίωση σαφήνειας ή ακρίβειας
- Αναδιάρθρωση περιεχομένου ή οργάνωσης

#### Απαγορεύτηκαν
- Χαρακτηριστικά ή προσεγγίσεις που καταργούνται
- Ενότητες τεκμηρίωσης που προγραμματίζονται για αφαίρεση
- Μέθοδοι που έχουν καλύτερες εναλλακτικές

#### Αφαιρέθηκαν
- Χαρακτηριστικά, τεκμηρίωση ή παραδείγματα που δεν είναι πλέον σχετικά
- Πληροφορίες ξεπερασμένες ή απαρχαιωμένες προσεγγίσεις
- Περιεχόμενο πλεοναστικό ή συγχωνευμένο

#### Διορθώθηκαν
- Διορθώσεις σφαλμάτων σε τεκμηρίωση ή κώδικα
- Επίλυση αναφερόμενων ζητημάτων ή προβλημάτων
- Βελτιώσεις ακρίβειας ή λειτουργικότητας


#### Ασφάλεια
- Βελτιώσεις ή διορθώσεις σχετικές με την ασφάλεια
- Ενημερώσεις στις βέλτιστες πρακτικές ασφάλειας
- Επίλυση ευπαθειών ασφαλείας

### Οδηγίες Σημασιολογικής Εκδόσεως

#### Κύρια Έκδοση (X.0.0)
- Σημαντικές αλλαγές που απαιτούν ενέργεια από τον χρήστη
- Σημαντική αναδιάρθρωση περιεχομένου ή οργάνωσης
- Αλλαγές που μεταβάλλουν τον θεμελιώδη τρόπο ή μεθοδολογία

#### Δευτερεύουσα Έκδοση (X.Y.0)
- Νέα χαρακτηριστικά ή προσθήκες περιεχομένου
- Βελτιώσεις που διατηρούν την συμβατότητα προς τα πίσω
- Πρόσθετα παραδείγματα, εργαλεία ή πόροι

#### Διόρθωση (X.Y.Z)
- Διορθώσεις σφαλμάτων και διορθώσεις
- Μικρές βελτιώσεις στο υπάρχον περιεχόμενο
- Διευκρινίσεις και μικρές βελτιώσεις

## Ανατροφοδότηση και Προτάσεις από την Κοινότητα

Ενθαρρύνουμε ενεργά την ανατροφοδότηση της κοινότητας για τη βελτίωση αυτού του εκπαιδευτικού πόρου:

### Πώς να Παρέχετε Ανατροφοδότηση
- **GitHub Issues**: Αναφέρετε προβλήματα ή προτείνετε βελτιώσεις (ζητήματα ειδικά για AI είναι ευπρόσδεκτα)
- **Discord Discussions**: Μοιραστείτε ιδέες και συμμετάσχετε στην κοινότητα Microsoft Foundry
- **Pull Requests**: Προσφέρετε απευθείας βελτιώσεις στο περιεχόμενο, ειδικά σε πρότυπα και οδηγούς για AI
- **Microsoft Foundry Discord**: Συμμετοχή στο κανάλι #Azure για συζητήσεις AZD + AI
- **Community Forums**: Συμμετοχή σε ευρύτερες συζητήσεις για προγραμματιστές Azure

### Κατηγορίες Ανατροφοδότησης
- **Ακρίβεια Περιεχομένου AI**: Διορθώσεις στην ολοκλήρωση και ανάπτυξη υπηρεσιών AI
- **Εμπειρία Μάθησης**: Προτάσεις για βελτιωμένη ροή μάθησης AI για προγραμματιστές
- **Ελλιπές Περιεχόμενο AI**: Αιτήματα για πρόσθετα πρότυπα, μοτίβα ή παραδείγματα AI
- **Προσβασιμότητα**: Βελτιώσεις για διαφορετικές μαθησιακές ανάγκες
- **Ολοκλήρωση Εργαλείων AI**: Προτάσεις για καλύτερη ενσωμάτωση ροής εργασιών ανάπτυξης AI
- **Πρότυπα Παραγωγής AI**: Αιτήματα για μοτίβα ανάπτυξης AI επιχειρήσεων

### Δεσμεύσεις Ανταπόκρισης
- **Ανταπόκριση σε Θέματα**: Εντός 48 ωρών για αναφερόμενα προβλήματα
- **Αιτήματα Χαρακτηριστικών**: Αξιολόγηση εντός μιας εβδομάδας
- **Συνεισφορές Κοινότητας**: Αναθεώρηση εντός μιας εβδομάδας
- **Θέματα Ασφαλείας**: Άμεση προτεραιότητα με επιταχυνόμενη ανταπόκριση

## Πρόγραμμα Συντήρησης

### Τακτικές Ενημερώσεις
- **Μηνιαίοι Έλεγχοι**: Ακρίβεια περιεχομένου και επικύρωση συνδέσμων
- **Τριμηνιαίες Ενημερώσεις**: Σημαντικές προσθήκες και βελτιώσεις περιεχομένου
- **Εξαμηνιαίοι Έλεγχοι**: Ολοκληρωμένη αναδιάρθρωση και βελτίωση
- **Ετήσιες Εκδόσεις**: Κύριες ενημερώσεις εκδόσεων με σημαντικές βελτιώσεις

### Παρακολούθηση και Διασφάλιση Ποιότητας
- **Αυτοματοποιημένες Δοκιμές**: Τακτική επικύρωση παραδειγμάτων κώδικα και συνδέσμων
- **Ενσωμάτωση Ανατροφοδότησης Κοινότητας**: Τακτική ενσωμάτωση προτάσεων χρηστών
- **Ενημερώσεις Τεχνολογίας**: Ευθυγράμμιση με τις τελευταίες υπηρεσίες Azure και εκδόσεις azd
- **Έλεγχοι Προσβασιμότητας**: Τακτική ανασκόπηση για αρχές ολιστικού σχεδιασμού

## Πολιτική Υποστήριξης Εκδόσεων

### Υποστήριξη Τρεχουσών Εκδόσεων
- **Τελευταία Κύρια Έκδοση**: Πλήρης υποστήριξη με τακτικές ενημερώσεις
- **Προηγούμενη Κύρια Έκδοση**: Ενημερώσεις ασφαλείας και κρίσιμες διορθώσεις για 12 μήνες
- **Παλιότερες Εκδόσεις**: Μόνο υποστήριξη κοινότητας, χωρίς επίσημες ενημερώσεις

### Οδηγίες Μετανάστευσης
Όταν κυκλοφορούν κύριες εκδόσεις, παρέχουμε:
- **Οδηγοί Μετανάστευσης**: Βήμα προς βήμα οδηγίες μετάβασης
- **Σημειώσεις Συμβατότητας**: Λεπτομέρειες για αλλαγές που σπάνε συμβατότητα
- **Υποστήριξη Εργαλείων**: Scripts ή βοηθητικά προγράμματα για τη διευκόλυνση της μετανάστευσης
- **Υποστήριξη Κοινότητας**: Αφιερωμένα φόρουμ για ερωτήματα μετανάστευσης

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Study Guide](resources/study-guide.md)
- **Επόμενο Μάθημα**: Επιστροφή στο [Main README](README.md)

**Μείνετε Ενημερωμένοι**: Παρακολουθήστε αυτό το αποθετήριο για ειδοποιήσεις σχετικά με νέες εκδόσεις και σημαντικές ενημερώσεις στα εκπαιδευτικά υλικά.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->