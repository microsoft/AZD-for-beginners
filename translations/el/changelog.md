# Αρχείο αλλαγών - AZD For Beginners

## Εισαγωγή

Αυτό το αρχείο αλλαγών καταγράφει όλες τις αξιοσημείωτες αλλαγές, ενημερώσεις και βελτιώσεις στο αποθετήριο AZD For Beginners. Ακολουθούμε τις αρχές του semantic versioning και διατηρούμε αυτό το αρχείο για να βοηθήσουμε τους χρήστες να κατανοήσουν τι έχει αλλάξει μεταξύ των εκδόσεων.

## Στόχοι Μάθησης

Με την ανασκόπηση αυτού του αρχείου αλλαγών, θα:
- Μείνετε ενημερωμένοι για νέες λειτουργίες και προσθήκες περιεχομένου
- Κατανοήσετε τις βελτιώσεις που έγιναν στην υπάρχουσα τεκμηρίωση
- Παρακολουθήσετε επιδιορθώσεις σφαλμάτων και διορθώσεις για να διασφαλίσετε την ακρίβεια
- Ακολουθήσετε την εξέλιξη του εκπαιδευτικού υλικού με την πάροδο του χρόνου

## Αποτελέσματα Μάθησης

Μετά την ανασκόπηση των καταχωρήσεων του αρχείου αλλαγών, θα μπορείτε να:
- Εντοπίζετε νέο περιεχόμενο και διαθέσιμους πόρους για μάθηση
- Κατανοείτε ποιες ενότητες έχουν ενημερωθεί ή βελτιωθεί
- Σχεδιάζετε τη μαθησιακή σας πορεία με βάση τα πιο ενημερωμένα υλικά
- Συνεισφέρετε σχόλια και προτάσεις για μελλοντικές βελτιώσεις

## Ιστορικό Εκδόσεων

### [v3.18.0] - 2026-03-16

#### Εντολές AZD AI CLI, Επικύρωση Περιεχομένου & Επέκταση Προτύπων
**Αυτή η έκδοση προσθέτει κάλυψη των εντολών `azd ai`, `azd extension` και `azd mcp` σε όλα τα κεφάλαια που σχετίζονται με την AI, διορθώνει σπασμένους συνδέσμους και ξεπερασμένο κώδικα στο agents.md, ενημερώνει το cheat sheet και ανασχηματίζει την ενότητα Example Templates με επικυρωμένες περιγραφές και νέα Azure AI AZD templates.**

#### Προστέθηκε
- **🤖 Κάλυψη AZD AI CLI** σε 7 αρχεία (προηγουμένως μόνο στο Κεφάλαιο 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Νέα ενότητα "Extensions and AI Commands" που εισάγει `azd extension`, `azd ai agent init`, και `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Επιλογή 4: `azd ai agent init` με πίνακα σύγκρισης (προσέγγιση template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Υποενότητες "AZD Extensions for Foundry" και "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Το Quick Start δείχνει πλέον και τις διαδρομές ανάπτυξης βασισμένες σε template και manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Η ενότητα Deploy πλέον περιλαμβάνει την επιλογή `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Υποενότητα "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Νέα ενότητα "AI & Extensions Commands" με `azd extension`, `azd ai agent init`, `azd mcp`, και `azd infra generate`
- **📦 Νέα AZD AI example templates** στο `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat με Blazor WebAssembly, Semantic Kernel, και υποστήριξη φωνητικής συνομιλίας
  - **azure-search-openai-demo-java** — Java RAG chat χρησιμοποιώντας Langchain4J με επιλογές ανάπτυξης ACA/AKS
  - **contoso-creative-writer** — Εφαρμογή δημιουργικής γραφής multi-agent με χρήση Azure AI Agent Service, Bing Grounding, και Prompty
  - **serverless-chat-langchainjs** — Serverless RAG με Azure Functions + LangChain.js + Cosmos DB με υποστήριξη τοπικής ανάπτυξης Ollama
  - **chat-with-your-data-solution-accelerator** — Επιταχυντής Enterprise RAG με portal διαχείρισης, ενσωμάτωση Teams, και επιλογές PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Αναφορά εφαρμογής ορχήστρωσης multi-agent MCP με servers σε .NET, Python, Java, και TypeScript
  - **azd-ai-starter** — Ελάχιστο starter template Bicep για υποδομή Azure AI
  - **🔗 Awesome AZD AI Gallery link** — Αναφορά στο [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Διορθώθηκε
- **🔗 agents.md πλοήγηση**: Οι σύνδεσμοι Προηγούμενο/Επόμενο πλέον ταιριάζουν με τη σειρά μαθημάτων στο README του Κεφαλαίου 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md σπασμένοι σύνδεσμοι**: `production-ai-practices.md` διορθώθηκε σε `../chapter-08-production/production-ai-practices.md` (3 εμφανίσεις)
- **📦 agents.md ξεπερασμένος κώδικας**: Αντικαταστάθηκε το `opencensus` με `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md μη έγκυρο API**: Μετακινήθηκε το `max_tokens` από `create_agent()` σε `create_run()` ως `max_completion_tokens`
- **🔢 agents.md καταμέτρηση tokens**: Αντικαταστάθηκε η πρόχειρη εκτίμηση `len//4` με `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Διορθώθηκαν οι υπηρεσίες από "Cognitive Search + App Service" σε "Azure AI Search + Azure Container Apps" (προεπιλεγμένος host αλλάχθηκε Οκτ 2024)
- **contoso-chat**: Ενημερώθηκε η περιγραφή για να αναφέρεται σε Azure AI Foundry + Prompty, ταιριάζοντας με τον πραγματικό τίτλο και το τεχνολογικό στοίχο του repo

#### Αφαιρέθηκε
- **ai-document-processing**: Αφαιρέθηκε αναφορά σε μη λειτουργικό template (το repo δεν είναι δημόσια προσβάσιμο ως AZD template)

#### Βελτιώθηκε
- **📝 agents.md ασκήσεις**: Η Άσκηση 1 δείχνει τώρα την αναμενόμενη έξοδο και το βήμα `azd monitor`; Η Άσκηση 2 περιλαμβάνει πλήρη κώδικα εγγραφής `FunctionTool`; Η Άσκηση 3 αντικαθιστά ασαφείς οδηγίες με συγκεκριμένες εντολές `prepdocs.py`
- **📚 agents.md πόροι**: Ενημερώθηκαν οι σύνδεσμοι τεκμηρίωσης προς τα τρέχοντα docs και quickstart του Azure AI Agent Service
- **📋 agents.md Πίνακας Επόμενων Βημάτων**: Προστέθηκε σύνδεσμος για το AI Workshop Lab για πλήρη κάλυψη κεφαλαίου

#### Αρχεία που ενημερώθηκαν
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
**Αυτή η έκδοση βελτιώνει την πλοήγηση README.md των κεφαλαίων με ένα βελτιωμένο μορφότυπο πίνακα.**

#### Αλλαγές
- **Πίνακας Χάρτη Μαθήματος**: Βελτιώθηκε με άμεσους συνδέσμους μαθημάτων, εκτιμήσεις διάρκειας και βαθμολογίες πολυπλοκότητας
- **Καθάρισμα Φακέλων**: Αφαιρέθηκαν επαναλαμβανόμενοι παλιοί φάκελοι (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Επικύρωση Συνδέσμων**: Επαληθεύτηκαν όλοι οι 21+ εσωτερικοί σύνδεσμοι στον Πίνακα Χάρτη Μαθήματος

### [v3.16.0] - 2026-02-05

#### Ενημερώσεις Ονομάτων Προϊόντων
**Αυτή η έκδοση ενημερώνει τις αναφορές προϊόντων ώστε να αντανακλούν τη τρέχουσα εμπορική ονομασία της Microsoft.**

#### Αλλαγές
- **Microsoft Foundry → Microsoft Foundry**: Όλες οι αναφορές ενημερώθηκαν σε μη-μεταφραστικά αρχεία
- **Azure AI Agent Service → Foundry Agents**: Το όνομα της υπηρεσίας ενημερώθηκε για να αντικατοπτρίζει την τρέχουσα επωνυμία

#### Αρχεία που ενημερώθηκαν
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Μεγάλη Αναδιάρθρωση Αποθετηρίου: Ονόματα Φακέλων με Βάση Κεφάλαια
**Αυτή η έκδοση αναδιαρθρώνει την τεκμηρίωση σε αφιερωμένους φακέλους κεφαλαίων για πιο σαφή πλοήγηση.**

#### Μετονομασίες Φακέλων
Old folders have been replaced with chapter-numbered folders:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Προστέθηκε
- **📚 Αρχεία README κεφαλαίων**: Δημιουργήθηκε README.md σε κάθε φάκελο κεφαλαίου με:
  - Στόχους μάθησης και διάρκεια
  - Πίνακα μαθημάτων με περιγραφές
  - Εντολές γρήγορης εκκίνησης
  - Πλοήγηση σε άλλα κεφάλαια

#### Αλλαγές
- **🔗 Ενημέρωση όλων των εσωτερικών συνδέσμων**: 78+ διαδρομές ενημερώθηκαν σε όλα τα έγγραφα
- **🗺️ Κύριο README.md**: Ενημερώθηκε ο Χάρτης Μαθήματος με τη νέα δομή κεφαλαίων
- **📝 examples/README.md**: Ενημερώθηκαν οι διασταυρούμενες αναφορές προς τους φακέλους κεφαλαίων

#### Αφαιρέθηκε
- Παλιή δομή φακέλων (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Αναδιάρθρωση Αποθετηρίου: Πλοήγηση Κεφαλαίων
**Αυτή η έκδοση πρόσθεσε αρχεία README πλοήγησης κεφαλαίων (υπερκερασμένο από v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Νέος Οδηγός AI Agents
**Αυτή η έκδοση προσθέτει έναν ολοκληρωμένο οδηγό για την ανάπτυξη AI agents με Azure Developer CLI.**

#### Προστέθηκε
- **🤖 docs/microsoft-foundry/agents.md**: Ολοκληρωμένος οδηγός που καλύπτει:
  - Τι είναι οι AI agents και πώς διαφέρουν από τα chatbots
  - Τρία quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Πρότυπα αρχιτεκτονικής agent (single agent, RAG, multi-agent)
  - Ρύθμιση εργαλείων και παραμετροποίηση
  - Παρακολούθηση και μετρικές
  - Οικονομικές επιπτώσεις και βελτιστοποίηση κόστους
  - Συνήθη σενάρια αντιμετώπισης προβλημάτων
  - Τρεις πρακτικές ασκήσεις με κριτήρια επιτυχίας

#### Δομή Περιεχομένου
- **Εισαγωγή**: Έννοιες agents για αρχάριους
- **Quick Start**: Ανάπτυξη agents με `azd init --template get-started-with-ai-agents`
- **Πρότυπα Αρχιτεκτονικής**: Οπτικά διαγράμματα προτύπων agent
- **Διαμόρφωση**: Ρύθμιση εργαλείων και μεταβλητές περιβάλλοντος
- **Παρακολούθηση**: Ενσωμάτωση Application Insights
- **Ασκήσεις**: Προοδευτική πρακτική μάθηση (20-45 λεπτά η κάθε μία)

---

### [v3.12.0] - 2026-02-05

#### Ενημέρωση Περιβάλλοντος DevContainer
**Αυτή η έκδοση ενημερώνει τη διαμόρφωση του development container με σύγχρονα εργαλεία και καλύτερες προεπιλογές για την εμπειρία μάθησης AZD.**

#### Αλλαγές
- **🐳 Base Image**: Ενημερώθηκε από `python:3.12-bullseye` σε `python:3.12-bookworm` (τελευταίο σταθερό Debian)
- **📛 Container Name**: Μετονομάστηκε από "Python 3" σε "AZD for Beginners" για σαφήνεια

#### Προστέθηκε
- **🔧 Νέα Χαρακτηριστικά Dev Container**:
  - `azure-cli` με ενεργοποιημένη υποστήριξη Bicep
  - `node:20` (LTS έκδοση για πρότυπα AZD)
  - `github-cli` για διαχείριση προτύπων
  - `docker-in-docker` για αναπτύξεις container app

- **🔌 Προώθηση θυρών**: Προ-διαμορφωμένες θύρες για κοινή ανάπτυξη:
  - 8000 (προεπισκόπηση MkDocs)
  - 3000 (Web εφαρμογές)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Νέες Επεκτάσεις VS Code**:
  - `ms-python.vscode-pylance` - Βελτιωμένο Python IntelliSense
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

- **⚙️ Ρυθμίσεις VS Code**: Προστέθηκαν προεπιλεγμένες ρυθμίσεις για τον interpreter Python, format on save, και αποκοπή κενών

- **📦 Ενημερωμένο requirements-dev.txt**:
  - Προστέθηκε plugin ελαχιστοποίησης για MkDocs
  - Προστέθηκε pre-commit για ποιότητα κώδικα
  - Προστέθηκαν πακέτα Azure SDK (azure-identity, azure-mgmt-resource)

#### Διορθώθηκε
- **Εντολή Μετά τη Δημιουργία**: Τώρα επαληθεύει την εγκατάσταση AZD και Azure CLI κατά την εκκίνηση του container

---

### [v3.11.0] - 2026-02-05

#### Αναθεώρηση README Φιλική προς Αρχάριους
**Αυτή η έκδοση βελτιώνει σημαντικά το README.md για να είναι πιο προσιτό σε αρχάριους και προσθέτει βασικούς πόρους για προγραμματιστές AI.**

#### Προστέθηκε
- **🆚 Σύγκριση Azure CLI vs AZD**: Σαφής εξήγηση για το πότε να χρησιμοποιείτε κάθε εργαλείο με πρακτικά παραδείγματα
- **🌟 Εξαιρετικοί Σύνδεσμοι AZD**: Άμεσοι σύνδεσμοι στη γκαλερί προτύπων της κοινότητας και πόροι για συνεισφορές:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ έτοιμα προς ανάπτυξη πρότυπα
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Συμβολή της κοινότητας
- **🎯 Οδηγός Γρήγορης Εκκίνησης**: Απλοποιημένη ενότητα 3 βημάτων για εκκίνηση (Εγκατάσταση → Σύνδεση → Ανάπτυξη)
- **📊 Πίνακας Πλοήγησης Βασισμένος στην Εμπειρία**: Σαφής καθοδήγηση για το από πού να ξεκινήσει κανείς ανάλογα με την εμπειρία του προγραμματιστή

#### Τροποποιήθηκε
- **Δομή README**: Αναδιοργανώθηκε για προοδευτική αποκάλυψη - βασικές πληροφορίες πρώτες
- **Ενότητα Εισαγωγής**: Επαναδιατυπώθηκε για να εξηγήσει "Η Μαγεία του `azd up`" για απόλυτους αρχάριους
- **Αφαιρέθηκε Διπλό Περιεχόμενο**: Εξαλείφθηκε διπλή ενότητα αντιμετώπισης προβλημάτων
- **Εντολές Αντιμετώπισης Προβλημάτων**: Διορθώθηκε η αναφορά `azd logs` για να χρησιμοποιεί το έγκυρο `azd monitor --logs`

#### Διορθώθηκε
- **🔐 Εντολές Πιστοποίησης**: Προστέθηκαν `azd auth login` και `azd auth logout` στο cheat-sheet.md
- **Μη Έγκυρες Αναφορές Εντολών**: Αφαιρέθηκε η υπόλοιπη αναφορά σε `azd logs` από την ενότητα αντιμετώπισης προβλημάτων του README

#### Σημειώσεις
- **Πεδίο εφαρμογής**: Οι αλλαγές εφαρμόστηκαν στο κύριο README.md και στο resources/cheat-sheet.md
- **Στόχος κοινού**: Οι βελτιώσεις απευθύνονται ειδικά σε προγραμματιστές νέους στο AZD

---

### [v3.10.0] - 2026-02-05

#### Ενημέρωση Ακρίβειας Εντολών Azure Developer CLI
**Αυτή η έκδοση διορθώνει μη υπάρχουσες εντολές AZD σε όλη την τεκμηρίωση, διασφαλίζοντας ότι όλα τα παραδείγματα κώδικα χρησιμοποιούν έγκυρη σύνταξη του Azure Developer CLI.**

#### Διορθώθηκε
- **🔧 Αφαιρέθηκαν Μη Υπάρχουσες Εντολές AZD**: Εκτενής έλεγχος και διόρθωση μη έγκυρων εντολών:
  - `azd logs` (δεν υπάρχει) → αντικαταστάθηκε με `azd monitor --logs` ή εναλλακτικές Azure CLI
  - Υποεντολές `azd service` (δεν υπάρχουν) → αντικαταστάθηκαν με `azd show` και Azure CLI
  - `azd infra import/export/validate` (δεν υπάρχουν) → αφαιρέθηκαν ή αντικαταστάθηκαν με έγκυρες εναλλακτικές
  - Σημαίες `azd deploy --rollback/--incremental/--parallel/--detect-changes` (δεν υπάρχουν) → αφαιρέθηκαν
  - Σημαίες `azd provision --what-if/--rollback` (δεν υπάρχουν) → ενημερώθηκαν για χρήση του `--preview`
  - `azd config validate` (δεν υπάρχει) → αντικαταστάθηκε με `azd config list`
  - `azd info`, `azd history`, `azd metrics` (δεν υπάρχουν) → αφαιρέθηκαν

- **📚 Αρχεία Ενημερωμένα με Διορθώσεις Εντολών**:
  - `resources/cheat-sheet.md`: Εκτενής ανασχεδιασμός αναφοράς εντολών
  - `docs/deployment/deployment-guide.md`: Διορθώθηκαν στρατηγικές επαναφοράς και ανάπτυξης
  - `docs/troubleshooting/debugging.md`: Διορθώθηκαν ενότητες ανάλυσης καταγραφών
  - `docs/troubleshooting/common-issues.md`: Ενημερώθηκαν εντολές αντιμετώπισης προβλημάτων
  - `docs/troubleshooting/ai-troubleshooting.md`: Διορθώθηκε ενότητα debugging AZD
  - `docs/getting-started/azd-basics.md`: Διορθώθηκαν εντολές παρακολούθησης
  - `docs/getting-started/first-project.md`: Ενημερώθηκαν παραδείγματα παρακολούθησης και debugging
  - `docs/getting-started/installation.md`: Διορθώθηκαν παραδείγματα βοήθειας και έκδοσης
  - `docs/pre-deployment/application-insights.md`: Διορθώθηκαν εντολές προβολής καταγραφών
  - `docs/pre-deployment/coordination-patterns.md`: Διορθώθηκαν εντολές debugging agents

- **📝 Ενημέρωση Αναφοράς Έκδοσης**: 
  - `docs/getting-started/installation.md`: Αλλαγή της σταθερής έκδοσης `1.5.0` σε γενική `1.x.x` με σύνδεσμο προς releases

#### Τροποποιήθηκε
- **Στρατηγικές Επαναφοράς**: Ενημέρωση τεκμηρίωσης για χρήση επαναφοράς βασισμένης στο Git (το AZD δεν διαθέτει εγγενή επαναφορά)
- **Προβολή Καταγραφών**: Αντικατάσταση αναφορών `azd logs` με `azd monitor --logs`, `azd monitor --live`, και εντολές Azure CLI
- **Ενότητα Απόδοσης**: Αφαιρέθηκαν μη υπάρχουσες σημαίες παράλληλης/αυξητικής ανάπτυξης, προτάθηκαν έγκυρες εναλλακτικές

#### Τεχνικές Λεπτομέρειες
- **Έγκυρες Εντολές AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Έγκυρες Σημαίες azd monitor**: `--live`, `--logs`, `--overview`
- **Αφαιρούμενα Χαρακτηριστικά**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Σημειώσεις
- **Επαλήθευση**: Οι εντολές επαληθεύτηκαν έναντι του Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ολοκλήρωση Εργαστηρίου και Ενημέρωση Ποιότητας Τεκμηρίωσης
**Αυτή η έκδοση ολοκληρώνει τα διαδραστικά modules του εργαστηρίου, διορθώνει όλους τους σπασμένους συνδέσμους τεκμηρίωσης και βελτιώνει την συνολική ποιότητα περιεχομένου για προγραμματιστές AI που χρησιμοποιούν το Microsoft AZD.**

#### Προστέθηκε
- **📝 CONTRIBUTING.md**: Νέο έγγραφο οδηγιών συνεισφοράς με:
  - Σαφείς οδηγίες για αναφορά σφαλμάτων και προτάσεις αλλαγών
  - Πρότυπα τεκμηρίωσης για νέο περιεχόμενο
  - Οδηγίες παραδειγμάτων κώδικα και συμβάσεων μηνυμάτων commit
  - Πληροφορίες εμπλοκής της κοινότητας

#### Ολοκληρώθηκε
- **🎯 Module Εργαστηρίου 7 (Επίλογος)**: Πλήρως ολοκληρωμένο module επίλογου με:
  - Συνοπτική περίληψη των επιτευγμάτων του εργαστηρίου
  - Ενότητα βασικών εννοιών που καλύπτει AZD, πρότυπα και Microsoft Foundry
  - Προτάσεις για συνέχιση της μαθησιακής πορείας
  - Ασκήσεις προκλήσεων εργαστηρίου με βαθμολογία δυσκολίας
  - Σύνδεσμοι υποστήριξης και ανατροφοδότησης της κοινότητας

- **📚 Module Εργαστηρίου 3 (Αποδόμηση)**: Ενημερωμένοι εκπαιδευτικοί στόχοι με:
  - Οδηγίες ενεργοποίησης GitHub Copilot με διακομιστές MCP
  - Κατανόηση της δομής φακέλων προτύπων AZD
  - Πρότυπα οργάνωσης Infrastructure-as-code (Bicep)
  - Οδηγίες εργαστηρίου hands-on

- **🔧 Module Εργαστηρίου 6 (Καθαρισμός/Κατάργηση)**: Ολοκληρώθηκε με:
  - Στόχους καθαρισμού πόρων και διαχείρισης κόστους
  - Χρήση `azd down` για ασφαλή απεγκατάσταση υποδομών
  - Οδηγίες ανάκτησης soft-deleted cognitive services
  - Προτάσεις για επιπλέον εξερεύνηση του GitHub Copilot και του Azure Portal

#### Διορθώθηκε
- **🔗 Διορθώσεις Σπασμένων Συνδέσμων**: Επιδιορθώθηκαν 15+ σπασμένοι εσωτερικοί σύνδεσμοι τεκμηρίωσης:
  - `docs/ai-foundry/ai-model-deployment.md`: Διορθώθηκαν μονοπάτια προς microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Διορθώθηκαν μονοπάτια ai-model-deployment.md και production-ai-practices.md
  - `docs/getting-started/first-project.md`: Αντικαταστάθηκε το μη υπαρκτό cicd-integration.md με deployment-guide.md
  - `examples/retail-scenario.md`: Διορθώθηκαν μονοπάτια FAQ και οδηγού αντιμετώπισης προβλημάτων
  - `examples/container-app/microservices/README.md`: Διορθώθηκαν μονοπάτια course home και deployment guide
  - `resources/faq.md` και `resources/glossary.md`: Ενημερώθηκαν αναφορές κεφαλαίου AI
  - `course-outline.md`: Διορθώθηκαν αναφορές οδηγού εκπαιδευτή και εργαστηρίων AI

- **📅 Κλασικό Banner Κατάστασης Εργαστηρίου**: Ενημερώθηκε από "Under Construction" σε ενεργή κατάσταση εργαστηρίου με ημερομηνία Φεβρουάριος 2026

- **🔗 Πλοήγηση Εργαστηρίου**: Διορθώθηκαν σπασμένες συνδέσεις πλοήγησης στο workshop README.md που έδειχναν σε μη υπαρκτό φάκελο lab-1-azd-basics

#### Τροποποιήθηκε
- **Παρουσίαση Εργαστηρίου**: Αφαιρέθηκε η προειδοποίηση "under construction", το εργαστήριο είναι πλέον ολοκληρωμένο και έτοιμο για χρήση
- **Συνέπεια Πλοήγησης**: Εξασφαλίστηκε ότι όλα τα modules του εργαστηρίου έχουν σωστή διασύνδεση μεταξύ τους
- **Αναφορές Μονοπατιών Μάθησης**: Ενημερώθηκαν οι διασταυρούμενες αναφορές κεφαλαίων για χρήση σωστών microsoft-foundry μονοπατιών

#### Επικυρώθηκε
- ✅ Όλα τα αγγλικά αρχεία markdown έχουν έγκυρους εσωτερικούς συνδέσμους
- ✅ Τα modules εργαστηρίου 0-7 είναι πλήρη με εκπαιδευτικούς στόχους
- ✅ Η πλοήγηση μεταξύ κεφαλαίων και modules λειτουργεί σωστά
- ✅ Το περιεχόμενο είναι κατάλληλο για προγραμματιστές AI που χρησιμοποιούν Microsoft AZD
- ✅ Η γλώσσα και η δομή είναι φιλικές προς αρχάριους σε όλο το περιεχόμενο
- ✅ Το CONTRIBUTING.md παρέχει σαφείς οδηγίες για συνεισφέροντες της κοινότητας

#### Τεχνική Υλοποίηση
- **Επαλήθευση Συνδέσμων**: Αυτόματο PowerShell script επαλήθευσε όλους τους .md εσωτερικούς συνδέσμους
- **Έλεγχος Περιεχομένου**: Χειροκίνητη αναθεώρηση της πληρότητας του εργαστηρίου και της καταλληλότητας για αρχάριους
- **Σύστημα Πλοήγησης**: Εφαρμοσμένα συνεπή μοτίβα πλοήγησης κεφαλαίων και modules

#### Σημειώσεις
- **Πεδίο εφαρμογής**: Οι αλλαγές εφαρμόστηκαν μόνο στην αγγλική τεκμηρίωση
- **Μεταφράσεις**: Οι φάκελοι μεταφράσεων δεν ενημερώθηκαν σε αυτή την έκδοση (η αυτόματη μετάφραση θα συγχρονιστεί αργότερα)
- **Διάρκεια Εργαστηρίου**: Το ολοκληρωμένο εργαστήριο τώρα παρέχει 3-4 ώρες πρακτικής μάθησης

---

### [v3.8.0] - 2025-11-19

#### Προηγμένη Τεκμηρίωση: Παρακολούθηση, Ασφάλεια και Πολυ-Πρακτικά Πρότυπα
**Αυτή η έκδοση προσθέτει ολοκληρωμένα μαθήματα επιπέδου A για ενσωμάτωση Application Insights, πρότυπα αυθεντικοποίησης, και συντονισμό πολλαπλών πρακτόρων για παραγωγικές αναπτύξεις.**

#### Προστέθηκε
- **📊 Μάθημα Ενσωμάτωσης Application Insights**: στο `docs/pre-deployment/application-insights.md`:
  - Ανάπτυξη επικεντρωμένη στο AZD με αυτόματη παροχέα
  - Πλήρη Bicep προτυπα για Application Insights + Log Analytics
  - Λειτουργικές Python εφαρμογές με προσαρμοσμένη τηλεμετρία (1.200+ γραμμές)
  - Πρότυπα παρακολούθησης AI/LLM (παρακολούθηση token/κόστους μοντέλων Microsoft Foundry)
  - 6 διαγράμματα Mermaid (αρχιτεκτονική, distributed tracing, ροή τηλεμετρίας)
  - 3 ασκήσεις hands-on (alerts, dashboards, AI monitoring)
  - Παραδείγματα ερωτημάτων Kusto και στρατηγικές βελτιστοποίησης κόστους
  - Live streaming μετρικών και απομακρυσμένη αποσφαλμάτωση
  - Χρόνος εκμάθησης 40-50 λεπτά με πρότυπα έτοιμα για παραγωγή

- **🔐 Μάθημα Αυθεντικοποίησης & Ασφάλειας**: στο `docs/getting-started/authsecurity.md`:
  - 3 πρότυπα αυθεντικοποίησης (connection strings, Key Vault, managed identity)
  - Πλήρη Bicep πρότυπα υποδομής για ασφαλείς αναπτύξεις
  - Κώδικας εφαρμογής Node.js με ενσωμάτωση Azure SDK
  - 3 ολοκληρωμένες ασκήσεις (ενεργοποίηση managed identity, user-assigned identity, rotation Key Vault)
  - Βέλτιστες πρακτικές ασφάλειας και διαμορφώσεις RBAC
  - Οδηγός αντιμετώπισης προβλημάτων και ανάλυση κόστους
  - Πρότυπα passwordless authentication έτοιμα για παραγωγή

- **🤖 Μάθημα Προτύπων Συντονισμού Πολυ-Πρακτόρων**: στο `docs/pre-deployment/coordination-patterns.md`:
  - 5 πρότυπα συντονισμού (αλυσιδωτό, παράλληλο, ιεραρχικό, event-driven, consensus)
  - Πλήρης υλοποίηση orchestrator service (Python/Flask, 1.500+ γραμμές)
  - 3 εξειδικευμένες υλοποιήσεις πρακτόρων (Research, Writer, Editor)
  - Ενσωμάτωση Service Bus για ουρές μηνυμάτων
  - Διαχείριση κατάστασης με Cosmos DB για κατανεμημένα συστήματα
  - 6 διαγράμματα Mermaid που δείχνουν αλληλεπιδράσεις πρακτόρων
  - 3 προηγμένες ασκήσεις (χειρισμός χρονικού ορίου, λογική επαναπροσπάθειας, circuit breaker)
  - Ανάλυση κόστους ($240-565/month) με στρατηγικές βελτιστοποίησης
  - Ενσωμάτωση Application Insights για παρακολούθηση

#### Ενισχύθηκε
- **Κεφάλαιο Προ-ανάπτυξης**: Τώρα περιλαμβάνει ολοκληρωμένη παρακολούθηση και πρότυπα συντονισμού
- **Κεφάλαιο Εισαγωγής**: Ενισχυμένο με επαγγελματικά πρότυπα αυθεντικοποίησης
- **Ετοιμότητα για Παραγωγή**: Πλήρης κάλυψη από ασφάλεια έως παρατηρησιμότητα
- **Πλάνο Μαθήματος**: Ενημερώθηκε για να αναφέρεται στα νέα μαθήματα στα Κεφάλαια 3 και 6

#### Τροποποιήθηκε
- **Πρόοδος Μάθησης**: Καλύτερη ενσωμάτωση ασφάλειας και παρακολούθησης σε όλη την πορεία
- **Ποιότητα Τεκμηρίωσης**: Συνεπής A-grade πρότυπα (95-97%) σε όλα τα νέα μαθήματα
- **Πρότυπα Παραγωγής**: Πλήρης κάλυψη από άκρο σε άκρο για επιχειρησιακές αναπτύξεις

#### Βελτιώθηκε
- **Developer Experience**: Σαφής πορεία από την ανάπτυξη έως την παραγωγική παρακολούθηση
- **Security Standards**: Επαγγελματικά πρότυπα για την αυθεντικοποίηση και τη διαχείριση μυστικών
- **Observability**: Πλήρης ενσωμάτωση Application Insights με AZD
- **AI Workloads**: Εξειδικευμένη παρακολούθηση για Microsoft Foundry Models και συστήματα πολλαπλών πρακτόρων

#### Validated
- ✅ Όλα τα μαθήματα περιλαμβάνουν πλήρες λειτουργικό κώδικα (όχι αποσπασματικά)
- ✅ Διαγράμματα Mermaid για οπτική μάθηση (συνολικά 19 σε 3 μαθήματα)
- ✅ Πρακτικές ασκήσεις με βήματα επαλήθευσης (συνολικά 9)
- ✅ Έτοιμα για παραγωγή πρότυπα Bicep αναπτύξιμα μέσω `azd up`
- ✅ Ανάλυση κόστους και στρατηγικές βελτιστοποίησης
- ✅ Οδηγοί αντιμετώπισης προβλημάτων και βέλτιστες πρακτικές
- ✅ Σημεία γνώσης με εντολές επαλήθευσης

#### Documentation Grading Results
- **docs/pre-deployment/application-insights.md**: - Ολοκληρωμένος οδηγός παρακολούθησης
- **docs/getting-started/authsecurity.md**: - Επαγγελματικά πρότυπα ασφάλειας
- **docs/pre-deployment/coordination-patterns.md**: - Προηγμένες αρχιτεκτονικές πολλαπλών πρακτόρων
- **Overall New Content**: - Συνεπής υψηλού επιπέδου ποιότητας

#### Technical Implementation
- **Application Insights**: Log Analytics + προσαρμοσμένη τηλεμετρία + κατανεμημένη ανίχνευση
- **Authentication**: Managed Identity + Key Vault + πρότυπα RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + ορχηστρωσία
- **Monitoring**: Live metrics + Kusto queries + ειδοποιήσεις + πίνακες ελέγχου
- **Cost Management**: Στρατηγικές δειγματοληψίας, πολιτικές διατήρησης, έλεγχος προϋπολογισμού

### [v3.7.0] - 2025-11-19

#### Documentation Quality Improvements and New Microsoft Foundry Models Example
**Αυτή η έκδοση ενισχύει την ποιότητα της τεκμηρίωσης σε ολόκληρο το αποθετήριο και προσθέτει πλήρες παράδειγμα ανάπτυξης Microsoft Foundry Models με διεπαφή chat gpt-4.1.**

#### Added
- **🤖 Microsoft Foundry Models Chat Example**: Πλήρης ανάπτυξη gpt-4.1 με λειτουργική υλοποίηση στο `examples/azure-openai-chat/`:
  - Πλήρης υποδομή Microsoft Foundry Models (ανάπτυξη μοντέλου gpt-4.1)
  - Διεπαφή συνομιλίας γραμμής εντολών Python με ιστορικό συζητήσεων
  - Ενσωμάτωση Key Vault για ασφαλή αποθήκευση κλειδιών API
  - Παρακολούθηση χρήσης tokens και εκτίμηση κόστους
  - Περιορισμός ρυθμού και χειρισμός σφαλμάτων
  - Ολοκληρωμένο README με οδηγό ανάπτυξης 35-45 λεπτών
  - 11 αρχεία έτοιμα για παραγωγή (πρότυπα Bicep, εφαρμογή Python, διαμόρφωση)
- **📚 Documentation Exercises**: Προστέθηκαν πρακτικές ασκήσεις στον οδηγό διαμόρφωσης:
  - Άσκηση 1: Παραμετροποίηση πολλαπλών περιβαλλόντων (15 λεπτά)
  - Άσκηση 2: Άσκηση διαχείρισης μυστικών (10 λεπτά)
  - Σαφή κριτήρια επιτυχίας και βήματα επαλήθευσης
- **✅ Deployment Verification**: Προστέθηκε τμήμα επαλήθευσης στον οδηγό ανάπτυξης:
  - Διαδικασίες ελέγχου υγείας
  - Λίστα ελέγχου κριτηρίων επιτυχίας
  - Αναμενόμενα αποτελέσματα για όλες τις εντολές ανάπτυξης
  - Γρήγορη αναφορά αντιμετώπισης προβλημάτων

#### Enhanced
- **examples/README.md**: Ενημερώθηκε σε ποιότητα A (93%):
  - Προστέθηκε azure-openai-chat σε όλες τις σχετικές ενότητες
  - Ο αριθμός τοπικών παραδειγμάτων ενημερώθηκε από 3 σε 4
  - Προστέθηκε στον πίνακα Παραδειγμάτων Εφαρμογών AI
  - Ενσωματώθηκε στο Quick Start για χρήστες μεσαίου επιπέδου
  - Προστέθηκε στην ενότητα Προτύπων Microsoft Foundry
  - Ενημερώθηκε ο Πίνακας Σύγκρισης και τα τμήματα εύρεσης τεχνολογιών
- **Documentation Quality**: Βελτιώθηκε από B+ (87%) → A- (92%) σε όφειλα του φακέλου docs:
  - Προστέθηκαν αναμενόμενα αποτελέσματα σε κρίσιμα παραδείγματα εντολών
  - Συμπεριλήφθηκαν βήματα επαλήθευσης για αλλαγές διαμόρφωσης
  - Ενισχυμένη hands-on μάθηση με πρακτικές ασκήσεις

#### Changed
- **Learning Progression**: Καλύτερη ενσωμάτωση παραδειγμάτων AI για μεσαίου επιπέδου μαθητές
- **Documentation Structure**: Περισσότερες εφαρμόσιμες ασκήσεις με σαφή αποτελέσματα
- **Verification Process**: Προστέθηκαν ρητά κριτήρια επιτυχίας σε βασικές ροές εργασίας

#### Improved
- **Developer Experience**: Η ανάπτυξη Microsoft Foundry Models τώρα διαρκεί 35-45 λεπτά (αντί 60-90 για σύνθετες εναλλακτικές)
- **Cost Transparency**: Σαφείς εκτιμήσεις κόστους ($50-200/month) για το παράδειγμα Microsoft Foundry Models
- **Learning Path**: Οι προγραμματιστές AI έχουν σαφή σημείο εισόδου με το azure-openai-chat
- **Documentation Standards**: Συνεπείς αναμενόμενες εξόδους και βήματα επαλήθευσης

#### Validated
- ✅ Το παράδειγμα Microsoft Foundry Models λειτουργεί πλήρως με `azd up`
- ✅ Όλα τα 11 αρχεία υλοποίησης είναι συντακτικά σωστά
- ✅ Οι οδηγίες README αντιστοιχούν στην πραγματική εμπειρία ανάπτυξης
- ✅ Οι σύνδεσμοι τεκμηρίωσης ενημερώθηκαν σε 8+ τοποθεσίες
- ✅ Ο κατάλογος παραδειγμάτων αντικατοπτρίζει με ακρίβεια 4 τοπικά παραδείγματα
- ✅ Δεν υπάρχουν διπλοί εξωτερικοί σύνδεσμοι σε πίνακες
- ✅ Όλες οι αναφορές πλοήγησης είναι σωστές

#### Technical Implementation
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + μοτίβο Container Apps
- **Security**: Έτοιμο Managed Identity, μυστικά στο Key Vault
- **Monitoring**: Ενσωμάτωση Application Insights
- **Cost Management**: Παρακολούθηση tokens και βελτιστοποίηση χρήσης
- **Deployment**: Εντολή `azd up` για πλήρη εγκατάσταση

### [v3.6.0] - 2025-11-19

#### Major Update: Container App Deployment Examples
**Αυτή η έκδοση εισάγει ολοκληρωμένα, έτοιμα για παραγωγή παραδείγματα ανάπτυξης container εφαρμογών χρησιμοποιώντας το Azure Developer CLI (AZD), με πλήρη τεκμηρίωση και ενσωμάτωση στη μαθησιακή πορεία.**

#### Added
- **🚀 Container App Examples**: Νέα τοπικά παραδείγματα στο `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Πλήρης επισκόπηση των containerized αναπτύξεων, γρήγορη εκκίνηση, παραγωγή και προχωρημένα μοτίβα
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Φιλική για αρχάριους REST API με scale-to-zero, health probes, παρακολούθηση και αντιμετώπιση προβλημάτων
  - [Microservices Architecture](../../examples/container-app/microservices): Παραγωγικής ποιότητας πολυεφαρμοστική ανάπτυξη (API Gateway, Product, Order, User, Notification), ασύγχρονη ανταλλαγή μηνυμάτων, Service Bus, Cosmos DB, Azure SQL, κατανεμημένη ανίχνευση, blue-green/canary ανάπτυξη
- **Best Practices**: Ασφάλεια, παρακολούθηση, βελτιστοποίηση κόστους και οδηγίες CI/CD για workloads container
- **Code Samples**: Ολοκληρωμένα `azure.yaml`, πρότυπα Bicep και υλοποιήσεις υπηρεσιών σε πολλαπλές γλώσσες (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: Σενάρια end-to-end δοκιμών, εντολές παρακολούθησης, οδηγίες αντιμετώπισης προβλημάτων

#### Changed
- **README.md**: Ενημερώθηκε για προβολή και σύνδεση των νέων παραδειγμάτων container app στην ενότητα "Local Examples - Container Applications"
- **examples/README.md**: Ενημερώθηκε για να τονίσει τα παραδείγματα container app, να προσθέσει εγγραφές στον πίνακα σύγκρισης και να ενημερώσει αναφορές τεχνολογίας/αρχιτεκτονικής
- **Course Outline & Study Guide**: Ενημερώθηκαν για να αναφέρουν τα νέα παραδείγματα container app και τα μοτίβα ανάπτυξης στα σχετικά κεφάλαια

#### Validated
- ✅ Όλα τα νέα παραδείγματα μπορούν να αναπτυχθούν με `azd up` και ακολουθούν βέλτιστες πρακτικές
- ✅ Ενημερώθηκαν οι διασταυρούμενοι σύνδεσμοι τεκμηρίωσης και η πλοήγηση
- ✅ Τα παραδείγματα καλύπτουν σενάρια από αρχάριους έως προχωρημένους, συμπεριλαμβανομένων παραγωγικών μικροϋπηρεσιών

#### Notes
- **Scope**: Μόνο αγγλικά αρχεία τεκμηρίωσης και παραδείγματα
- **Next Steps**: Επέκταση με πρόσθετα προχωρημένα μοτίβα container και αυτοματοποίηση CI/CD σε μελλοντικές εκδόσεις

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Αυτή η έκδοση εφαρμόζει μία ολοκληρωμένη αλλαγή ονομασίας προϊόντος από "Microsoft Foundry" σε "Microsoft Foundry" σε όλη την αγγλική τεκμηρίωση, αντικατοπτρίζοντας το επίσημο rebranding της Microsoft.**

#### Changed
- **🔄 Product Name Update**: Ολοκληρωμένο rebranding από "Microsoft Foundry" σε "Microsoft Foundry"
  - Ενημερώθηκαν όλες οι αναφορές σε όλη την αγγλική τεκμηρίωση στο φάκελο `docs/`
  - Μετονομάστηκε φάκελος: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Μετονομασία αρχείου: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Σύνολο: 23 ενημερώσεις αναφορών περιεχομένου σε 7 αρχεία τεκμηρίωσης

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` μετονομάστηκε σε `docs/microsoft-foundry/`
  - Ενημερώθηκαν όλες οι διασταυρούμενες αναφορές για να αντικατοπτρίζουν τη νέα δομή φακέλων
  - Ελέγχθηκαν και επικυρώθηκαν οι σύνδεσμοι πλοήγησης σε όλη την τεκμηρίωση

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Όλοι οι εσωτερικοί σύνδεσμοι ενημερώθηκαν για να αναφέρονται στο νέο όνομα αρχείου

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ενημερώσεις συνδέσμων πλοήγησης
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 αναφορές προϊόντος ενημερώθηκαν
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ήδη χρησιμοποιεί Microsoft Foundry (από προηγούμενες ενημερώσεις)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 αναφορές ενημερώθηκαν (επισκόπηση, ανατροφοδότηση κοιότητας, τεκμηρίωση)
  - `docs/getting-started/azd-basics.md` - 4 διασταυρούμενοι σύνδεσμοι ενημερώθηκαν
  - `docs/getting-started/first-project.md` - 2 σύνδεσμοι πλοήγησης κεφαλαίων ενημερώθηκαν
  - `docs/getting-started/installation.md` - 2 σύνδεσμοι επόμενου κεφαλαίου ενημερώθηκαν
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 αναφορές ενημερώθηκαν (πλοήγηση, κοινότητα Discord)
  - `docs/troubleshooting/common-issues.md` - 1 σύνδεσμος πλοήγησης ενημερώθηκε
  - `docs/troubleshooting/debugging.md` - 1 σύνδεσμος πλοήγησης ενημερώθηκε

- **Course Structure Files** (2 files):
  - `README.md` - 17 αναφορές ενημερώθηκαν (επισκόπηση μαθήματος, τίτλοι κεφαλαίων, ενότητα προτύπων, συμπεράσματα κοινότητας)
  - `course-outline.md` - 14 αναφορές ενημερώθηκαν (επισκόπηση, μαθησιακοί στόχοι, πόροι κεφαλαίων)

#### Validated
- ✅ Μηδενικές εναπομείνασες αναφορές φακέλου "ai-foundry" στην αγγλική τεκμηρίωση
- ✅ Μηδενικές εναπομείνασες αναφορές ονόματος προϊόντος "Microsoft Foundry" στην αγγλική τεκμηρίωση
- ✅ Όλοι οι σύνδεσμοι πλοήγησης λειτουργούν με τη νέα δομή φακέλων
- ✅ Η μετονομασία αρχείων και φακέλων ολοκληρώθηκε επιτυχώς
- ✅ Οι διασταυρούμενες αναφορές μεταξύ κεφαλαίων επικυρώθηκαν

#### Notes
- **Scope**: Οι αλλαγές εφαρμόστηκαν μόνο στα αγγλικά αρχεία τεκμηρίωσης στο φάκελο `docs/`
- **Translations**: Οι φάκελοι μετάφρασης (`translations/`) δεν ενημερώθηκαν σε αυτή την έκδοση
- **Workshop**: Το υλικό εργαστηρίου (`workshop/`) δεν ενημερώθηκε σε αυτή την έκδοση
- **Examples**: Αρχεία παραδειγμάτων ενδέχεται να εξακολουθούν να αναφέρονται σε παλαιά ονόματα (θα αντιμετωπιστεί σε μελλοντική ενημέρωση)
- **External Links**: Οι εξωτερικές διευθύνσεις URL και οι αναφορές στο GitHub παραμένουν αμετάβλητες

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Ενημερώστε τις αναφορές φακέλων: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ενημερώστε τις αναφορές αρχείων: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Αντικαταστήστε το όνομα προϊόντος: "Microsoft Foundry" → "Microsoft Foundry"
4. Επαληθεύστε ότι όλοι οι εσωτερικοί σύνδεσμοι τεκμηρίωσης λειτουργούν ακόμα

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Αυτή η έκδοση εισάγει ολοκληρωμένη υποστήριξη για τη νέα προεπισκόπηση χαρακτηριστικού του Azure Developer CLI και βελτιώνει την εμπειρία του χρήστη στο εργαστήριο.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Ολοκληρωμένη κάλυψη της νέας δυνατότητας προεπισκόπησης υποδομής
  - Αναφορά εντολών και παραδείγματα χρήσης στο cheat sheet
  - Λεπτομερής ενσωμάτωση στον οδηγό παροχής υποδομής με περιπτώσεις χρήσης και οφέλη
  - Ενσωμάτωση ελέγχων προ-πτήσης για ασφαλέστερη επικύρωση ανάπτυξης
  - Ενημερώσεις στον οδηγό εκκίνησης με πρακτικές ασφάλειας πρώτα στην ανάπτυξη
- **🚧 Workshop Status Banner**: Επαγγελματικό HTML banner που υποδεικνύει την κατάσταση ανάπτυξης του εργαστηρίου
  - Σχεδίαση με gradient και δείκτες κατασκευής για σαφή επικοινωνία προς τον χρήστη
  - Χρονικό σήμα τελευταίας ενημέρωσης για διαφάνεια
  - Σχεδίαση φιλική προς κινητές συσκευές για όλους τους τύπους συσκευών

#### Enhanced
- **Infrastructure Safety**: Η λειτουργία προεπισκόπησης ενσωματώθηκε σε όλη την τεκμηρίωση ανάπτυξης
- **Pre-deployment Validation**: Τα αυτοματοποιημένα scripts πλέον περιλαμβάνουν δοκιμές προεπισκόπησης υποδομής
- **Developer Workflow**: Ενημερώθηκαν οι αλληλουχίες εντολών για να συμπεριλάβουν την προεπισκόπηση ως βέλτιστη πρακτική
- **Workshop Experience**: Ορίστηκαν σαφείς προσδοκίες προς τους χρήστες σχετικά με την κατάσταση ανάπτυξης περιεχομένου

#### Changed
- **Deployment Best Practices**: Η ροή εργασίας με προτεραιότητα στην προεπισκόπηση προτείνεται πλέον ως προτεινόμενη προσέγγιση
- **Documentation Flow**: Η επικύρωση υποδομής μεταφέρθηκε νωρίτερα στη μαθησιακή διαδικασία
- **Workshop Presentation**: Επαγγελματική επικοινωνία κατάστασης με σαφές χρονοδιάγραμμα ανάπτυξης

#### Improved
- **Safety-First Approach**: Οι αλλαγές υποδομής μπορούν τώρα να επικυρωθούν πριν την ανάπτυξη
- **Team Collaboration**: Τα αποτελέσματα προεπισκόπησης μπορούν να κοινοποιηθούν για αναθεώρηση και έγκριση
- **Cost Awareness**: Καλύτερη κατανόηση του κόστους πόρων πριν την παροχή
- **Risk Mitigation**: Μειωμένες αποτυχίες ανάπτυξης μέσω προ-επικύρωσης

#### Technical Implementation
- **Multi-document Integration**: Η λειτουργία προεπισκόπησης τεκμηριώνεται σε 4 βασικά αρχεία
- **Command Patterns**: Συνεπής σύνταξη και παραδείγματα σε όλη την τεκμηρίωση
- **Best Practice Integration**: Η προεπισκόπηση συμπεριλήφθηκε στις ροές εργασίας επικύρωσης και στα scripts
- **Visual Indicators**: Σαφείς μαρκάρισμα νέου χαρακτηριστικού για ευκολότερη ανεύρεση

#### Workshop Infrastructure
- **Status Communication**: Επαγγελματικό HTML banner με styling gradient
- **User Experience**: Η σαφής κατάσταση ανάπτυξης αποτρέπει τη σύγχυση
- **Professional Presentation**: Διατηρεί την αξιοπιστία του αποθετηρίου ενώ θέτει προσδοκίες
- **Timeline Transparency**: Χρονική ένδειξη τελευταίας ενημέρωσης Οκτώβριος 2025 για λογοδοσία

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**Αυτή η έκδοση εισάγει ολοκληρωμένο υλικό εργαστηρίου με διαδραστικούς οδηγούς που λειτουργούν στο πρόγραμμα περιήγησης και δομημένες μαθησιακές πορείες.**

#### Added
- **🎥 Οδηγός Διαδραστικού Εργαστηρίου**: Εμπειρία εργαστηρίου μέσω προγράμματος περιήγησης με δυνατότητα προεπισκόπησης MkDocs
- **📝 Δομημένες Οδηγίες Εργαστηρίου**: 7-βηματική καθοδηγούμενη διαδρομή μάθησης από την ανακάλυψη έως την προσαρμογή
  - 0-Introduction: Επισκόπηση εργαστηρίου και ρύθμιση
  - 1-Select-AI-Template: Διαδικασία ανακάλυψης και επιλογής προτύπου
  - 2-Validate-AI-Template: Διαδικασίες ανάπτυξης και επικύρωσης
  - 3-Deconstruct-AI-Template: Κατανόηση της αρχιτεκτονικής του προτύπου
  - 4-Configure-AI-Template: Διαμόρφωση και προσαρμογή
  - 5-Customize-AI-Template: Προχωρημένες τροποποιήσεις και επαναλήψεις
  - 6-Teardown-Infrastructure: Καθαρισμός και διαχείριση πόρων
  - 7-Wrap-up: Σύνοψη και επόμενα βήματα
- **🛠️ Εργαλεία Εργαστηρίου**: Διαμόρφωση MkDocs με θέμα Material για βελτιωμένη εμπειρία μάθησης
- **🎯 Πρακτική Διαδρομή Μάθησης**: 3-βηματική μεθοδολογία (Ανακάλυψη → Ανάπτυξη → Προσαρμογή)
- **📱 Ενσωμάτωση GitHub Codespaces**: Αδιάλειπτη ρύθμιση περιβάλλοντος ανάπτυξης

#### Ενισχυμένο
- **AI Workshop Lab**: Επεκτάθηκε με ολοκληρωμένη δομημένη εμπειρία μάθησης 2-3 ωρών
- **Τεκμηρίωση Εργαστηρίου**: Επαγγελματική παρουσίαση με πλοήγηση και οπτικά βοηθήματα
- **Πρόοδος Μάθησης**: Σαφής καθοδήγηση βήμα προς βήμα από την επιλογή προτύπου έως την ανάπτυξη σε παραγωγή
- **Εμπειρία Προγραμματιστή**: Ενσωματωμένα εργαλεία για ομαλές ροές εργασίας ανάπτυξης

#### Βελτιωμένα
- **Προσβασιμότητα**: Διεπαφή μέσω προγράμματος περιήγησης με λειτουργία αναζήτησης, αντιγραφής και εναλλαγή θέματος
- **Αυτορυθμιζόμενη Μάθηση**: Ευέλικτη δομή εργαστηρίου που προσαρμόζεται σε διαφορετικούς ρυθμούς μάθησης
- **Πρακτική Εφαρμογή**: Σενάρια ανάπτυξης προτύπων AI από πραγματικό κόσμο
- **Ενσωμάτωση Κοινότητας**: Ενσωμάτωση Discord για υποστήριξη εργαστηρίου και συνεργασία

#### Χαρακτηριστικά Εργαστηρίου
- **Ενσωματωμένη Αναζήτηση**: Γρήγορη ανακάλυψη λέξεων-κλειδιών και μαθημάτων
- **Αντιγραφή Μπλοκ Κώδικα**: Λειτουργία αιώρησης για αντιγραφή όλων των παραδειγμάτων κώδικα
- **Εναλλαγή Θέματος**: Υποστήριξη σκοτεινής/ανοιχτής λειτουργίας για διαφορετικές προτιμήσεις
- **Οπτικά Υλικά**: Στιγμιότυπα οθόνης και διαγράμματα για καλύτερη κατανόηση
- **Ενσωμάτωση Βοήθειας**: Άμεση πρόσβαση σε Discord για υποστήριξη της κοινότητας

### [v3.2.0] - 2025-09-17

#### Μεγάλη Αναδιάρθρωση Πλοήγησης και Σύστημα Μάθησης Βασισμένο σε Κεφάλαια
**Αυτή η έκδοση εισάγει μια ολοκληρωμένη δομή μάθησης βάσει κεφαλαίων με βελτιωμένη πλοήγηση σε ολόκληρο το αποθετήριο.**

#### Προστέθηκε
- **📚 Σύστημα Μάθησης Βασισμένο σε Κεφάλαια**: Αναδιαρθρώθηκε ολόκληρο το μάθημα σε 8 προοδευτικά κεφάλαια μάθησης
  - Chapter 1: Βάσεις & Γρήγορη Εκκίνηση (⭐ - 30-45 λεπτά)
  - Chapter 2: Ανάπτυξη με προτεραιότητα στο AI (⭐⭐ - 1-2 ώρες)
  - Chapter 3: Διαμόρφωση & Αυθεντικοποίηση (⭐⭐ - 45-60 λεπτά)
  - Chapter 4: Υποδομή ως Κώδικας & Ανάπτυξη (⭐⭐⭐ - 1-1.5 ώρες)
  - Chapter 5: Λύσεις AI με Πολλαπλούς Πράκτορες (⭐⭐⭐⭐ - 2-3 ώρες)
  - Chapter 6: Επαλήθευση & Σχεδιασμός πριν την Ανάπτυξη (⭐⭐ - 1 ώρα)
  - Chapter 7: Επίλυση Προβλημάτων & Αποσφαλμάτωση (⭐⭐ - 1-1.5 ώρες)
  - Chapter 8: Παραγωγή & Εταιρικά Πρότυπα (⭐⭐⭐⭐ - 2-3 ώρες)
- **📚 Ολοκληρωμένο Σύστημα Πλοήγησης**: Συνεπή κεφαλίδες και υποσέλιδα πλοήγησης σε όλη την τεκμηρίωση
- **🎯 Παρακολούθηση Προόδου**: Λίστα ελέγχου ολοκλήρωσης μαθήματος και σύστημα επαλήθευσης μάθησης
- **🗺️ Οδηγίες Διαδρομής Μάθησης**: Σαφείς σημεία εισόδου για διαφορετικά επίπεδα εμπειρίας και στόχους
- **🔗 Διασταυρούμενη Πλοήγηση**: Σχετικά κεφάλαια και προαπαιτούμενα σαφώς συνδεδεμένα

#### Ενισχυμένο
- **Δομή README**: Μετατράπηκε σε δομημένη πλατφόρμα μάθησης με οργάνωση βάσει κεφαλαίων
- **Πλοήγηση Τεκμηρίωσης**: Κάθε σελίδα πλέον περιλαμβάνει πλαίσιο κεφαλαίου και οδηγίες προόδου
- **Οργάνωση Προτύπων**: Παραδείγματα και πρότυπα αντιστοιχισμένα σε κατάλληλα κεφάλαια μάθησης
- **Ενσωμάτωση Πόρων**: Φύλλα συνοπτικής πληροφόρησης, Συχνές Ερωτήσεις και οδηγοί μελέτης συνδεδεμένοι με σχετικά κεφάλαια
- **Ενσωμάτωση Εργαστηρίου**: Πρακτικά εργαστήρια αντιστοιχισμένα σε πολλαπλούς στόχους μάθησης κεφαλαίων

#### Τροποποιήσεις
- **Πρόοδος Μάθησης**: Μετατράπηκε από γραμμική τεκμηρίωση σε ευέλικτο μάθημα βάσει κεφαλαίων
- **Τοποθέτηση Διαμόρφωσης**: Ανατοποθετήθηκε ο οδηγός διαμόρφωσης ως Κεφάλαιο 3 για καλύτερη ροή μάθησης
- **Ενσωμάτωση Περιεχομένου AI**: Καλύτερη ενσωμάτωση περιεχομένου ειδικού για AI σε όλη τη διαδρομή μάθησης
- **Περιεχόμενο Παραγωγής**: Προχωρημένα πρότυπα ενοποιήθηκαν στο Κεφάλαιο 8 για εκπαιδευόμενους επιχειρήσεων

#### Βελτιώθηκε
- **Εμπειρία Χρήστη**: Σαφή breadcrumbs πλοήγησης και δείκτες προόδου κεφαλαίων
- **Προσβασιμότητα**: Συνεπή πρότυπα πλοήγησης για ευκολότερη περιήγηση στο μάθημα
- **Επαγγελματική Παρουσίαση**: Δομή μαθήματος με στυλ πανεπιστημίου κατάλληλη για ακαδημαϊκή και εταιρική εκπαίδευση
- **Αποδοτικότητα Μάθησης**: Μειωμένος χρόνος εύρεσης σχετικού περιεχομένου μέσω βελτιωμένης οργάνωσης

#### Τεχνική Υλοποίηση
- **Κεφαλίδες Πλοήγησης**: Τυποποιημένη πλοήγηση κεφαλαίων σε 40+ αρχεία τεκμηρίωσης
- **Υποσέλιδο Πλοήγησης**: Συνεπής καθοδήγηση προόδου και δείκτες ολοκλήρωσης κεφαλαίων
- **Διασταυρούμενοι Σύνδεσμοι**: Ολοκληρωμένο σύστημα εσωτερικών συνδέσμων που συνδέει συναφείς έννοιες
- **Χαρτογράφηση Κεφαλαίων**: Πρότυπα και παραδείγματα σαφώς συσχετισμένα με στόχους μάθησης

#### Βελτίωση Οδηγού Μελέτης
- **📚 Ολοκληρωμένοι Στόχοι Μάθησης**: Οδηγός μελέτης αναδιαρθρώθηκε για ευθυγράμμιση με το σύστημα 8 κεφαλαίων
- **🎯 Αξιολόγηση Βασισμένη σε Κεφάλαια**: Κάθε κεφάλαιο περιλαμβάνει συγκεκριμένους στόχους μάθησης και πρακτικές ασκήσεις
- **📋 Παρακολούθηση Προόδου**: Εβδομαδιαίο πρόγραμμα μάθησης με μετρήσιμα αποτελέσματα και λίστες ελέγχου ολοκλήρωσης
- **❓ Ερωτήσεις Αξιολόγησης**: Ερωτήσεις επαλήθευσης γνώσεων για κάθε κεφάλαιο με επαγγελματικά αποτελέσματα
- **🛠️ Πρακτικές Ασκήσεις**: Πρακτικές δραστηριότητες με πραγματικά σενάρια ανάπτυξης και αντιμετώπισης προβλημάτων
- **📊 Πρόοδος Δεξιοτήτων**: Σαφής εξέλιξη από βασικές έννοιες σε εταιρικά πρότυπα με έμφαση στην ανάπτυξη καριέρας
- **🎓 Πλαίσιο Πιστοποίησης**: Επαγγελματικά αποτελέσματα ανάπτυξης και σύστημα αναγνώρισης από την κοινότητα
- **⏱️ Διαχείριση Χρονοδιαγράμματος**: Δομημένο 10-εβδομάδων πρόγραμμα μάθησης με επικύρωση σημαντικών σταδίων

### [v3.1.0] - 2025-09-17

#### Ενισχυμένες Λύσεις AI με Πολλαπλούς Πράκτορες
**Αυτή η έκδοση βελτιώνει τη λύση λιανικής με πολλούς πράκτορες με καλύτερη ονομασία πρακτόρων και βελτιωμένη τεκμηρίωση.**

#### Αλλαγές
- **Ορολογία Πολλαπλών Πρακτόρων**: Αντικαταστάθηκε το "Cora agent" με το "Customer agent" σε όλη τη λύση λιανικής πολλαπλών πρακτόρων για πιο σαφή κατανόηση
- **Αρχιτεκτονική Πρακτόρων**: Ενημερώθηκε ολόκληρη η τεκμηρίωση, τα ARM templates και τα παραδείγματα κώδικα για να χρησιμοποιούν συνεπή ονομασία "Customer agent"
- **Παραδείγματα Διαμόρφωσης**: Εξελιγμένα πρότυπα διαμόρφωσης πρακτόρων με ενημερωμένες ονομασίες
- **Συνέπεια Τεκμηρίωσης**: Διασφαλίστηκε ότι όλες οι αναφορές χρησιμοποιούν επαγγελματικά, περιγραφικά ονόματα πρακτόρων

#### Ενισχυμένο
- **ARM Template Package**: Ενημερώθηκε το retail-multiagent-arm-template με αναφορές Customer agent
- **Διαγράμματα Αρχιτεκτονικής**: Ενημερώθηκαν τα διαγράμματα Mermaid με ανανεωμένη ονομασία πρακτόρων
- **Παραδείγματα Κώδικα**: Κλάσεις Python και παραδείγματα υλοποίησης πλέον χρησιμοποιούν την ονομασία CustomerAgent
- **Μεταβλητές Περιβάλλοντος**: Ενημερώθηκαν όλα τα σενάρια ανάπτυξης για να χρησιμοποιούν τα conventions CUSTOMER_AGENT_NAME

#### Βελτιώθηκε
- **Εμπειρία Προγραμματιστή**: Πιο σαφείς ρόλοι και ευθύνες πρακτόρων στην τεκμηρίωση
- **Έτοιμο για Παραγωγή**: Καλύτερη ευθυγράμμιση με εταιρικές ονομασίες
- **Υλικά Μάθησης**: Πιο διαισθητική ονομασία πρακτόρων για εκπαιδευτικούς σκοπούς
- **Χρηστικότητα Προτύπου**: Απλοποιημένη κατανόηση των λειτουργιών πρακτόρων και προτύπων ανάπτυξης

#### Τεχνικές Λεπτομέρειες
- Ενημερώθηκαν διαγράμματα αρχιτεκτονικής Mermaid με αναφορές CustomerAgent
- Αντικαταστάθηκαν ονόματα κλάσεων CoraAgent με CustomerAgent σε παραδείγματα Python
- Τροποποιήθηκαν τα ARM template JSON configurations για να χρησιμοποιούν τον τύπο πράκτορα "customer"
- Ενημερώθηκαν οι μεταβλητές περιβάλλοντος από CORA_AGENT_* σε CUSTOMER_AGENT_* patterns
- Ανανεώθηκαν όλες οι εντολές ανάπτυξης και οι ρυθμίσεις κοντέινερ

### [v3.0.0] - 2025-09-12

#### Σημαντικές Αλλαγές - Επικέντρωση στους Προγραμματιστές AI και Ενσωμάτωση Microsoft Foundry
**Αυτή η έκδοση μετασχηματίζει το αποθετήριο σε ένα ολοκληρωμένο εκπαιδευτικό πόρο με έμφαση στους προγραμματιστές AI και ενσωμάτωση με το Microsoft Foundry.**

#### Προστέθηκε
- **🤖 AI-First Learning Path**: Πλήρης αναδιάρθρωση με προτεραιότητα στους προγραμματιστές και μηχανικούς AI
- **Microsoft Foundry Integration Guide**: Ολοκληρωμένη τεκμηρίωση για τη σύνδεση του AZD με υπηρεσίες Microsoft Foundry
- **AI Model Deployment Patterns**: Αναλυτικός οδηγός που καλύπτει επιλογή μοντέλου, διαμόρφωση και στρατηγικές ανάπτυξης σε παραγωγή
- **AI Workshop Lab**: Πρακτικό εργαστήριο 2-3 ωρών για τη μετατροπή εφαρμογών AI σε λύσεις αναπτυσσόμενες με AZD
- **Production AI Best Practices**: Πρότυπα έτοιμα για την επιχείρηση για κλιμάκωση, παρακολούθηση και ασφάλεια φορτίων AI
- **AI-Specific Troubleshooting Guide**: Ολοκληρωμένος οδηγός αντιμετώπισης προβλημάτων για Microsoft Foundry Models, Cognitive Services και ζητήματα ανάπτυξης AI
- **AI Template Gallery**: Επιλεγμένη συλλογή προτύπων Microsoft Foundry με αξιολογήσεις πολυπλοκότητας
- **Workshop Materials**: Πλήρης δομή εργαστηρίου με πρακτικά εργαστήρια και αναφορικά υλικά

#### Ενισχυμένο
- **README Structure**: Εστιασμένο στους προγραμματιστές AI με δεδομένα 45% ενδιαφέροντος της κοινότητας από το Microsoft Foundry Discord
- **Learning Paths**: Αφιερωμένη διαδρομή προγραμματιστή AI παράλληλα με παραδοσιακές διαδρομές για μαθητές και μηχανικούς DevOps
- **Template Recommendations**: Επιλεγμένα πρότυπα AI όπως azure-search-openai-demo, contoso-chat και openai-chat-app-quickstart
- **Community Integration**: Ενισχυμένη υποστήριξη κοινότητας στο Discord με κανάλια και συζητήσεις ειδικές για AI

#### Εστίαση Ασφάλειας & Παραγωγής
- **Managed Identity Patterns**: Ειδικές για AI ρυθμίσεις πιστοποίησης και ασφάλειας
- **Cost Optimization**: Παρακολούθηση χρήσης token και έλεγχοι προϋπολογισμού για φορτία AI
- **Multi-Region Deployment**: Στρατηγικές για παγκόσμια ανάπτυξη εφαρμογών AI
- **Performance Monitoring**: Διαγράμματα μετρικών ειδικά για AI και ενσωμάτωση Application Insights

#### Ποιότητα Τεκμηρίωσης
- **Linear Course Structure**: Λογική πρόοδος από αρχάριους έως προχωρημένα πρότυπα ανάπτυξης AI
- **Validated URLs**: Όλοι οι εξωτερικοί σύνδεσμοι αποθετηρίων επαληθεύτηκαν και είναι προσπελάσιμοι
- **Complete Reference**: Όλοι οι εσωτερικοί σύνδεσμοι τεκμηρίωσης επαληθεύτηκαν και λειτουργούν
- **Production Ready**: Πρότυπα ανάπτυξης για επιχειρήσεις με πραγματικά παραδείγματα

### [v2.0.0] - 2025-09-09

#### Σημαντικές Αλλαγές - Αναδιάρθρωση Αποθετηρίου και Επαγγελματική Βελτίωση
**Αυτή η έκδοση αντιπροσωπεύει μια σημαντική αναθεώρηση της δομής και της παρουσίασης του περιεχομένου του αποθετηρίου.**

#### Προστέθηκε
- **Δομημένο Πλαίσιο Μάθησης**: Όλες οι σελίδες τεκμηρίωσης πλέον περιλαμβάνουν Εισαγωγή, Στόχους Μάθησης και Τμήματα Αποτελεσμάτων Μάθησης
- **Σύστημα Πλοήγησης**: Προστέθηκαν σύνδεσμοι Previous/Next μάθήματος σε όλα τα έγγραφα για καθοδηγούμενη πρόοδο
- **Study Guide**: Ολοκληρωμένο study-guide.md με στόχους μάθησης, ασκήσεις πρακτικής και υλικά αξιολόγησης
- **Επαγγελματική Παρουσίαση**: Αφαιρέθηκαν όλα τα emoji για βελτιωμένη προσβασιμότητα και επαγγελματική εμφάνιση
- **Βελτιωμένη Δομή Περιεχομένου**: Βελτιωμένη οργάνωση και ροή υλικού μάθησης

#### Αλλαγές
- **Μορφή Τεκμηρίωσης**: Τυποποιήθηκε όλη η τεκμηρίωση με συνεπή δομή επικεντρωμένη στη μάθηση
- **Ροή Πλοήγησης**: Υλοποιήθηκε λογική πρόοδος σε όλα τα υλικά μάθησης
- **Παρουσίαση Περιεχομένου**: Αφαιρέθηκαν διακοσμητικά στοιχεία προς όφελος καθαρής, επαγγελματικής μορφοποίησης
- **Δομή Συνδέσμων**: Ενημερώθηκαν όλοι οι εσωτερικοί σύνδεσμοι για να υποστηρίξουν το νέο σύστημα πλοήγησης

#### Βελτιώθηκε
- **Προσβασιμότητα**: Αφαιρέθηκε η εξάρτηση από emoji για καλύτερη συμβατότητα με αναγνώστες οθόνης
- **Επαγγελματική Εμφάνιση**: Καθαρή, ακαδημαϊκού τύπου παρουσίαση κατάλληλη για επιχειρησιακή μάθηση
- **Εμπειρία Μάθησης**: Δομημένη προσέγγιση με σαφείς στόχους και αποτελέσματα για κάθε μάθημα
- **Οργάνωση Περιεχομένου**: Καλύτερη λογική ροή και σύνδεση μεταξύ σχετικών θεμάτων

### [v1.0.0] - 2025-09-09

#### Αρχική Έκδοση - Ολοκληρωμένο AZD Εκπαιδευτικό Αποθετήριο

#### Προστέθηκε
- **Βασική Δομή Τεκμηρίωσης**
  - Πλήρης σειρά οδηγών getting-started
  - Ολοκληρωμένη τεκμηρίωση ανάπτυξης και παροχής πόρων
  - Λεπτομερείς πόροι επίλυσης προβλημάτων και οδηγοί αποσφαλμάτωσης
  - Εργαλεία και διαδικασίες προ-ανάπτυξης για επαλήθευση

- **Getting Started Module**
  - AZD Basics: Βασικές έννοιες και ορολογία
  - Installation Guide: Οδηγίες εγκατάστασης ανά πλατφόρμα
  - Configuration Guide: Ρυθμίσεις περιβάλλοντος και πιστοποίηση
  - First Project Tutorial: Βήμα-βήμα πρακτική εκπαίδευση

- **Deployment and Provisioning Module**
  - Deployment Guide: Πλήρης τεκμηρίωση ροής εργασίας
  - Provisioning Guide: Υποδομή ως Κώδικας με Bicep
  - Βέλτιστες πρακτικές για αναπτύξεις σε παραγωγή
  - Πρότυπα αρχιτεκτονικής πολλαπλών υπηρεσιών

- **Pre-deployment Validation Module**
  - Capacity Planning: Επαλήθευση διαθεσιμότητας πόρων Azure
  - SKU Selection: Οδηγίες για επιλογή επιπέδων υπηρεσιών
  - Pre-flight Checks: Αυτοματοποιημένα σενάρια επαλήθευσης (PowerShell and Bash)
  - Εκτίμηση κόστους και εργαλεία προγραμματισμού προϋπολογισμού

- **Troubleshooting Module**
  - Common Issues: Συχνά προβλήματα και λύσεις
  - Debugging Guide: Συστηματικές μεθοδολογίες αντιμετώπισης σφαλμάτων
  - Προχωρημένες τεχνικές διαγνωστικών και εργαλεία
  - Παρακολούθηση επιδόσεων και βελτιστοποίηση

- **Resources and References**
  - Command Cheat Sheet: Γρήγορη αναφορά για βασικές εντολές
  - Glossary: Ολοκληρωμένο λεξικό όρων και συντομογραφιών
  - FAQ: Λεπτομερείς απαντήσεις σε συχνές ερωτήσεις
  - Εξωτερικοί σύνδεσμοι και συνδέσεις με την κοινότητα

- **Examples and Templates**
  - Παράδειγμα απλής web εφαρμογής
  - Πρότυπο ανάπτυξης στατικού ιστότοπου
  - Διαμόρφωση εφαρμογής με κοντέινερ
  - Πρότυπα ενσωμάτωσης βάσης δεδομένων
  - Παραδείγματα αρχιτεκτονικής μικροϋπηρεσιών
  - Υλοποιήσεις serverless λειτουργιών

#### Χαρακτηριστικά
- **Υποστήριξη Πολλών Πλατφορμών**: Οδηγοί εγκατάστασης και ρύθμισης για Windows, macOS και Linux
- **Πολλαπλά Επίπεδα Δεξιοτήτων**: Περιεχόμενο σχεδιασμένο για μαθητές έως επαγγελματίες προγραμματιστές
- **Πρακτικό Εστιασμένο**: Πρακτικά παραδείγματα και σενάρια από τον πραγματικό κόσμο
- **Ολοκληρωμένη Κάλυψη**: Από βασικές έννοιες έως προχωρημένα εταιρικά πρότυπα
- **Προσέγγιση με Προτεραιότητα στην Ασφάλεια**: Ενσωματωμένες βέλτιστες πρακτικές ασφαλείας
- **Βελτιστοποίηση Κόστους**: Οδηγίες για αποδοτικές οικονομικά αναπτύξεις και διαχείριση πόρων

#### Ποιότητα Τεκμηρίωσης
- **Λεπτομερή Παραδείγματα Κώδικα**: Πρακτικά, ελεγμένα παραδείγματα κώδικα
- **Οδηγίες Βήμα-βήμα**: Σαφής, εφαρμόσιμη καθοδήγηση
- **Ολοκληρωμένος Έλεγχος Σφαλμάτων**: Αντιμετώπιση κοινών προβλημάτων
- **Ενσωμάτωση Βέλτιστων Πρακτικών**: Βιομηχανικά πρότυπα και προτεινόμενες μεθοδολογίες
- **Συμβατότητα Εκδόσεων**: Ενημερωμένο με τις τελευταίες υπηρεσίες Azure και δυνατότητες azd

## Σχεδιασμένες Μελλοντικές Βελτιώσεις

### Version 3.1.0 (Planned)
#### Επέκταση Πλατφόρμας AI
- **Υποστήριξη Πολλαπλών Μοντέλων**: Πρότυπα ενσωμάτωσης για Hugging Face, Azure Machine Learning και προσαρμοσμένα μοντέλα
- **Πλαίσια Πρακτόρων AI**: Πρότυπα για αναπτύξεις LangChain, Semantic Kernel και AutoGen
- **Προηγμένα Πρότυπα RAG**: Επιλογές βάσεων διανυσμάτων πέραν του Azure AI Search (Pinecone, Weaviate, κ.ά.)
- **Παρατηρησιμότητα AI**: Ενισχυμένη παρακολούθηση απόδοσης μοντέλων, χρήσης tokens και ποιότητας απαντήσεων

#### Εμπειρία Προγραμματιστή
- **Επέκταση VS Code**: Ενσωματωμένη εμπειρία ανάπτυξης AZD + Microsoft Foundry
- **Ενσωμάτωση GitHub Copilot**: Δημιουργία προτύπων AZD με βοήθεια AI
- **Διαδραστικά Σεμινάρια**: Πρακτικές ασκήσεις κωδικοποίησης με αυτόματη επικύρωση για σενάρια AI
- **Περιεχόμενο Βίντεο**: Συμπληρωματικά βίντεο-μαθήματα για οπτικούς μαθητές με έμφαση σε αναπτύξεις AI

### Έκδοση 4.0.0 (Προγραμματισμένη)
#### Πρότυπα Επιχειρησιακού AI
- **Πλαίσιο Διακυβέρνησης**: Διακυβέρνηση μοντέλων AI, συμμόρφωση και ίχνη ελέγχου
- **Πολυενοικιαστικό AI**: Πρότυπα για την εξυπηρέτηση πολλών πελατών με απομονωμένες υπηρεσίες AI
- **Ανάπτυξη Edge AI**: Ενσωμάτωση με Azure IoT Edge και περιστατικά κοντέινερ
- **Υβριδικό Cloud AI**: Πρότυπα πολλαπλών cloud και υβριδικής ανάπτυξης για φόρτο εργασίας AI

#### Προηγμένες Δυνατότητες
- **Αυτοματοποίηση Pipeline AI**: Ενσωμάτωση MLOps με pipelines του Azure Machine Learning
- **Προηγμένη Ασφάλεια**: Πρότυπα zero-trust, ιδιωτικά endpoints και προηγμένη προστασία από απειλές
- **Βελτιστοποίηση Απόδοσης**: Προηγμένες στρατηγικές ρύθμισης και κλιμάκωσης για εφαρμογές AI υψηλής διεκπεραιωσιμότητας
- **Παγκόσμια Κατανομή**: Πρότυπα παράδοσης περιεχομένου και caching στο edge για εφαρμογές AI

### Έκδοση 3.0.0 (Προγραμματισμένη) - Αντικαταστάθηκε από την τρέχουσα έκδοση
#### Προτεινόμενες Προσθήκες - Τώρα Υλοποιήθηκαν στην v3.0.0
- ✅ **Περιεχόμενο Εστιασμένο στο AI**: Ολοκληρωμένη ενσωμάτωση Microsoft Foundry (Ολοκληρώθηκε)
- ✅ **Διαδραστικά Σεμινάρια**: Πρακτικό εργαστήριο AI (Ολοκληρώθηκε)
- ✅ **Προηγμένο Μοντέλο Ασφαλείας**: Πρότυπα ασφάλειας ειδικά για AI (Ολοκληρώθηκε)
- ✅ **Βελτιστοποίηση Απόδοσης**: Στρατηγικές ρύθμισης για φόρτο εργασίας AI (Ολοκληρώθηκε)

### Έκδοση 2.1.0 (Προγραμματισμένη) - Μερικώς Υλοποιήθηκε στην v3.0.0
#### Μικρές Βελτιώσεις - Μερικές Ολοκληρώθηκαν στην τρέχουσα έκδοση
- ✅ **Επιπλέον Παραδείγματα**: Σενάρια ανάπτυξης εστιασμένα στο AI (Ολοκληρώθηκε)
- ✅ **Εκτεταμένες Συχνές Ερωτήσεις**: Ερωτήσεις και αντιμετώπιση προβλημάτων ειδικά για AI (Ολοκληρώθηκε)
- **Ενσωμάτωση Εργαλείων**: Βελτιωμένοι οδηγοί ενσωμάτωσης IDE και επεξεργαστών
- ✅ **Επέκταση Παρακολούθησης**: Πρότυπα παρακολούθησης και ειδοποίησης ειδικά για AI (Ολοκληρώθηκε)

#### Ακόμα Σχεδιασμένο για Μελλοντική Έκδοση
- **Τεκμηρίωση Φιλική προς Κινητά**: Σχεδιασμός responsive για μάθηση μέσω κινητών
- **Πρόσβαση Εκτός Σύνδεσης**: Πακέτα τεκμηρίωσης για λήψη
- **Βελτιωμένη Ενσωμάτωση IDE**: Επέκταση VS Code για ροές εργασίας AZD + AI
- **Πίνακας Κοινότητας**: Μετρικές κοινότητας σε πραγματικό χρόνο και παρακολούθηση συνεισφορών

## Συνεισφορά στο αρχείο αλλαγών

### Αναφορά αλλαγών
Όταν συμβάλλετε σε αυτό το αποθετήριο, βεβαιωθείτε ότι οι εγγραφές στο αρχείο αλλαγών περιλαμβάνουν:

1. **Αριθμός Έκδοσης**: Ακολουθώντας την σημειολογική ονοματοδοσία εκδόσεων (major.minor.patch)
2. **Ημερομηνία**: Ημερομηνία κυκλοφορίας ή ενημέρωσης σε μορφή YYYY-MM-DD
3. **Κατηγορία**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Σαφής Περιγραφή**: Συνοπτική περιγραφή του τι άλλαξε
5. **Εκτίμηση Επιπτώσεων**: Πώς οι αλλαγές επηρεάζουν τους υπάρχοντες χρήστες

### Κατηγορίες Αλλαγών

#### Προστέθηκε
- Νέα χαρακτηριστικά, τμήματα τεκμηρίωσης ή δυνατότητες
- Νέα παραδείγματα, πρότυπα ή εκπαιδευτικοί πόροι
- Επιπλέον εργαλεία, scripts ή βοηθήματα

#### Τροποποιήθηκε
- Τροποποιήσεις σε υπάρχουσα λειτουργικότητα ή τεκμηρίωση
- Ενημερώσεις για βελτίωση σαφήνειας ή ακρίβειας
- Αναδιάρθρωση περιεχομένου ή οργάνωσης

#### Αποσυρόμενο
- Δυνατότητες ή προσεγγίσεις που σταδιακά καταργούνται
- Τμήματα τεκμηρίωσης προγραμματισμένα για αφαίρεση
- Μέθοδοι που έχουν καλύτερες εναλλακτικές

#### Αφαιρέθηκε
- Δυνατότητες, τεκμηρίωση ή παραδείγματα που δεν είναι πλέον σχετικά
- Παρωχημένες πληροφορίες ή αποσυρόμενες προσεγγίσεις
- Πλεονάζον ή ενοποιημένο περιεχόμενο

#### Διορθώθηκε
- Διορθώσεις σφαλμάτων στην τεκμηρίωση ή τον κώδικα
- Επίλυση αναφερόμενων ζητημάτων ή προβλημάτων
- Βελτιώσεις στην ακρίβεια ή τη λειτουργικότητα

#### Ασφάλεια
- Βελτιώσεις ή διορθώσεις σχετικές με την ασφάλεια
- Ενημερώσεις σχετικά με τις βέλτιστες πρακτικές ασφάλειας
- Επίλυση ευπαθειών ασφαλείας

### Οδηγίες Σημασιολογικής Ονοματοδοσίας Εκδόσεων

#### Κύρια έκδοση (X.0.0)
- Αλλαγές που σπάνε συμβατότητα και απαιτούν ενέργεια από τον χρήστη
- Σημαντική αναδιάρθρωση περιεχομένου ή οργάνωσης
- Αλλαγές που τροποποιούν τη θεμελιώδη προσέγγιση ή μεθοδολογία

#### Δευτερεύουσα έκδοση (X.Y.0)
- Νέα χαρακτηριστικά ή προσθήκες περιεχομένου
- Βελτιώσεις που διατηρούν τη συμβατότητα προς τα πίσω
- Επιπλέον παραδείγματα, εργαλεία ή πόροι

#### Έκδοση επιδιόρθωσης (X.Y.Z)
- Διορθώσεις σφαλμάτων και επιδιορθώσεις
- Μικρές βελτιώσεις στο υπάρχον περιεχόμενο
- Διευκρινίσεις και μικρές βελτιώσεις

## Ανατροφοδότηση και Προτάσεις Κοινότητας

Ενθαρρύνουμε ενεργά την ανατροφοδότηση της κοινότητας για τη βελτίωση αυτού του εκπαιδευτικού πόρου:

### Πώς να δώσετε ανατροφοδότηση
- **GitHub Issues**: Αναφέρετε προβλήματα ή προτείνετε βελτιώσεις (ζητήματα ειδικά για AI ευπρόσδεκτα)
- **Discord Discussions**: Μοιραστείτε ιδέες και συμμετέχετε στην κοινότητα Microsoft Foundry
- **Pull Requests**: Συνεισφέρετε άμεσες βελτιώσεις στο περιεχόμενο, ειδικά σε πρότυπα και οδηγούς AI
- **Microsoft Foundry Discord**: Συμμετάσχετε στο κανάλι #Azure για συζητήσεις AZD + AI
- **Community Forums**: Συμμετέχετε σε ευρύτερες συζητήσεις προγραμματιστών Azure

### Κατηγορίες Ανατροφοδότησης
- **Ακρίβεια περιεχομένου AI**: Διορθώσεις στην πληροφορία ενσωμάτωσης και ανάπτυξης υπηρεσιών AI
- **Εμπειρία μάθησης**: Προτάσεις για βελτιωμένη ροή μάθησης προγραμματιστών AI
- **Ελλείπον περιεχόμενο AI**: Αιτήματα για επιπλέον πρότυπα, μοτίβα ή παραδείγματα AI
- **Προσβασιμότητα**: Βελτιώσεις για ποικίλες μαθησιακές ανάγκες
- **Ενσωμάτωση εργαλείων AI**: Προτάσεις για καλύτερη ενσωμάτωση ροής εργασίας ανάπτυξης AI
- **Πρότυπα παραγωγικού AI**: Αιτήματα για πρότυπα ανάπτυξης επιχειρησιακού AI

### Δέσμευση Απάντησης
- **Απόκριση σε ζητήματα**: Εντός 48 ωρών για αναφερόμενα προβλήματα
- **Αιτήματα χαρακτηριστικών**: Αξιολόγηση εντός μίας εβδομάδας
- **Συνεισφορές κοινότητας**: Ανασκόπηση εντός μίας εβδομάδας
- **Ζητήματα ασφάλειας**: Άμεση προτεραιότητα με επιταχυνόμενη απάντηση

## Πρόγραμμα Συντήρησης

### Κανονικές Ενημερώσεις
- **Μηνιαίες Ανασκοπήσεις**: Ακρίβεια περιεχομένου και επαλήθευση συνδέσμων
- **Τριμηνιαίες Ενημερώσεις**: Μεγάλες προσθήκες περιεχομένου και βελτιώσεις
- **Εξαμηνιαίες Ανασκοπήσεις**: Ολοκληρωμένη αναδιάρθρωση και βελτίωση
- **Ετήσιες Κυκλοφορίες**: Ενημερώσεις κύριων εκδόσεων με σημαντικές βελτιώσεις

### Παρακολούθηση και Διασφάλιση Ποιότητας
- **Αυτοματοποιημένες Δοκιμές**: Κανονική επαλήθευση παραδειγμάτων κώδικα και συνδέσμων
- **Ενσωμάτωση Ανατροφοδότησης της Κοινότητας**: Κανονική ενσωμάτωση προτάσεων χρηστών
- **Ενημερώσεις Τεχνολογίας**: Ευθυγράμμιση με τις τελευταίες υπηρεσίες Azure και κυκλοφορίες azd
- **Έλεγχοι Προσβασιμότητας**: Κανονική ανασκόπηση για αρχές σχεδιασμού περιεκτικού χαρακτήρα

## Πολιτική Υποστήριξης Εκδόσεων

### Υποστήριξη τρέχουσας έκδοσης
- **Τελευταία κύρια έκδοση**: Πλήρης υποστήριξη με τακτικές ενημερώσεις
- **Προηγούμενη κύρια έκδοση**: Ενημερώσεις ασφαλείας και κρίσιμες επιδιορθώσεις για 12 μήνες
- **Παλιές εκδόσεις**: Μόνο υποστήριξη από την κοινότητα, χωρίς επίσημες ενημερώσεις

### Οδηγίες μετανάστευσης
Όταν εκδίδονται κύριες εκδόσεις, παρέχουμε:
- **Οδηγοί Μετανάστευσης**: Οδηγίες βήμα-βήμα για μετάβαση
- **Σημειώσεις Συμβατότητας**: Λεπτομέρειες για αλλαγές που σπάνε συμβατότητα
- **Υποστήριξη Εργαλείων**: Scripts ή βοηθήματα για βοήθεια στη μετανάστευση
- **Υποστήριξη Κοινότητας**: Αφιερωμένα φόρουμ για ερωτήσεις μετανάστευσης

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Οδηγός μελέτης](resources/study-guide.md)
- **Επόμενο Μάθημα**: Επιστροφή στο [Κύριο README](README.md)

**Μείνετε Ενημερωμένοι**: Παρακολουθήστε αυτό το αποθετήριο για ειδοποιήσεις σχετικά με νέες κυκλοφορίες και σημαντικές ενημερώσεις στα εκπαιδευτικά υλικά.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για οποιεσδήποτε παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύψουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->