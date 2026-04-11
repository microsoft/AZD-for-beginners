# Αρχείο αλλαγών - AZD για Αρχάριους

## Εισαγωγή

Αυτό το αρχείο αλλαγών καταγράφει όλες τις σημαντικές αλλαγές, ενημερώσεις και βελτιώσεις στο αποθετήριο AZD For Beginners. Ακολουθούμε τις αρχές semantic versioning και διατηρούμε αυτό το αρχείο για να βοηθήσουμε τους χρήστες να κατανοήσουν τι έχει αλλάξει μεταξύ των εκδόσεων.

## Στόχοι Μάθησης

Με την ανασκόπηση αυτού του αρχείου αλλαγών, θα:
- Παραμείνετε ενημερωμένοι για νέες λειτουργίες και προσθήκες περιεχομένου
- Κατανοήσετε τις βελτιώσεις που έγιναν στην υπάρχουσα τεκμηρίωση
- Παρακολουθείτε επιδιορθώσεις σφαλμάτων και διορθώσεις για να διασφαλιστεί η ακρίβεια
- Ακολουθείτε την εξέλιξη των εκπαιδευτικών υλικών με την πάροδο του χρόνου

## Αποτελέσματα Μάθησης

Μετά την ανασκόπηση των εγγραφών του αρχείου αλλαγών, θα μπορείτε να:
- Αναγνωρίζετε νέο περιεχόμενο και διαθέσιμους πόρους για μάθηση
- Κατανοείτε ποιες ενότητες έχουν ενημερωθεί ή βελτιωθεί
- Σχεδιάζετε τη διαδρομή μάθησής σας βάσει των πιο ενημερωμένων υλικών
- Συνεισφέρετε σχόλια και προτάσεις για μελλοντικές βελτιώσεις

## Ιστορικό Εκδόσεων

### [v3.19.1] - 2026-03-27

#### Διευκρίνιση εισαγωγής για αρχάριους, επικύρωση ρύθμισης & τελικός καθαρισμός εντολών AZD
**Αυτή η έκδοση ακολουθεί την επανεξέταση επικύρωσης AZD 1.23 με μια προσέγγιση τεκμηρίωσης επικεντρωμένη σε αρχάριους: διευκρινίζει τις οδηγίες πιστοποίησης με προτεραιότητα στο AZD, προσθέτει τοπικά scripts επικύρωσης ρύθμισης, επαληθεύει βασικές εντολές έναντι του ζωντανού AZD CLI, και αφαιρεί τις τελευταίες παρωχημένες αναφορές εντολών στην αγγλική πηγή εκτός του αρχείου αλλαγών.**

#### Προστέθηκε
- **🧪 Scripts επικύρωσης ρύθμισης για αρχάριους** με `validate-setup.ps1` και `validate-setup.sh` ώστε οι εκπαιδευόμενοι να μπορούν να επιβεβαιώσουν τα απαιτούμενα εργαλεία πριν ξεκινήσουν το Κεφάλαιο 1
- **✅ Βήματα επικύρωσης ρύθμισης εκ των προτέρων** στο root README και στο README του Κεφαλαίου 1 ώστε τα ελλείποντα προαπαιτούμενα να εντοπίζονται πριν από το `azd up`

#### Αλλαγές
- **🔐 Οδηγίες πιστοποίησης για αρχάριους** τώρα αντιμετωπίζουν σταθερά το `azd auth login` ως τον κύριο δρόμο για ροές εργασίας AZD, με το `az login` να σημειώνεται ως προαιρετικό εκτός εάν χρησιμοποιούνται άμεσα εντολές Azure CLI
- **📚 Το flow εισαγωγής του Κεφαλαίου 1** τώρα κατευθύνει τους εκπαιδευόμενους να επικυρώσουν την τοπική τους ρύθμιση πριν από την εγκατάσταση, την πιστοποίηση και τα πρώτα βήματα ανάπτυξης
- **🛠️ Μηνύματα του Validator** τώρα ξεχωρίζουν σαφώς τα απαιτούμενα που μπλοκάρουν από τα προαιρετικά προειδοποιητικά μηνύματα Azure CLI για την μονοεπίπεδη διαδρομή για αρχάριους με μόνο AZD
- **📖 Έγγραφα ρυθμίσεων, αντιμετώπισης προβλημάτων και παραδειγμάτων** τώρα διακρίνουν μεταξύ της απαιτούμενης πιστοποίησης AZD και της προαιρετικής σύνδεσης Azure CLI όπου προηγουμένως παρουσιαζόντουσαν χωρίς συμφραζόμενα

#### Διορθώθηκε
- **📋 Εναπομείνασες αναφορές εντολών στην αγγλική πηγή** ενημερώθηκαν στις τρέχουσες μορφές AZD, συμπεριλαμβανομένου του `azd config show` στο cheat sheet και του `azd monitor --overview` όπου προοριζόταν καθοδήγηση επισκόπησης του Azure Portal
- **🧭 Δηλώσεις για αρχάριους στο Κεφάλαιο 1** μετριάστηκαν για να αποφευχθεί η υπερβολική υπόσχεση για εγγυημένη απουσία σφαλμάτων ή συμπεριφορά rollback σε όλα τα templates και τους πόρους Azure
- **🔎 Επικύρωση με ζωντανό CLI** επιβεβαίωσε την τρέχουσα υποστήριξη για `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, και `azd down --force --purge`

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

#### Επικύρωση AZD 1.23.12, επέκταση περιβάλλοντος εργαστηρίου & ανανέωση μοντέλων AI
**Αυτή η έκδοση πραγματοποιεί σάρωση επικύρωσης τεκμηρίωσης έναντι του `azd` `1.23.12`, ενημερώνει παλιά παραδείγματα εντολών AZD, ανανεώνει τις οδηγίες για μοντέλα AI στα τρέχοντα προεπιλεγμένα και διευρύνει τις οδηγίες εργαστηρίου πέρα από τα GitHub Codespaces ώστε να υποστηρίζονται επίσης dev containers και τοπικά clones.**

#### Προστέθηκε
- **✅ Σημειώσεις επικύρωσης σε βασικά κεφάλαια και έγγραφα εργαστηρίου** για να γίνει ρητό το δοκιμασμένο baseline AZD για εκπαιδευόμενους που χρησιμοποιούν νεότερες ή παλαιότερες builds του CLI
- **⏱️ Οδηγίες χρονικού ορίου ανάπτυξης** για αναπτύξεις AI εφαρμογών που διαρκούν πολύ με χρήση `azd deploy --timeout 1800`
- **🔎 Βήματα επιθεώρησης επεκτάσεων** με `azd extension show azure.ai.agents` στα έγγραφα ροής εργασίας AI
- **🌐 Ευρύτερες οδηγίες περιβάλλοντος εργαστηρίου** που καλύπτουν GitHub Codespaces, dev containers και τοπικά clones με MkDocs

#### Αλλαγές
- **📚 README εισαγωγής κεφαλαίων** τώρα αναφέρουν σταθερά την επικύρωση έναντι `azd 1.23.12` στα sections foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting και production
- **🛠️ Αναφορές εντολών AZD** ενημερώθηκαν στις τρέχουσες μορφές σε όλη την τεκμηρίωση:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ή `azd env get-value(s)` ανάλογα με τα συμφραζόμενα
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` όπου προορίζεται επισκόπηση Application Insights
- **🧪 Παραδείγματα preview προμηθειών** απλουστεύτηκαν στη τρέχουσα υποστηριζόμενη χρήση όπως `azd provision --preview` και `azd provision --preview -e production`
- **🧭 Το flow του εργαστηρίου** ενημερώθηκε ώστε οι εκπαιδευόμενοι να μπορούν να ολοκληρώσουν τα εργαστήρια σε Codespaces, dev container ή τοπικό clone αντί να υποθέτεται εκτέλεση μόνο σε Codespaces
- **🔐 Οδηγίες πιστοποίησης** τώρα προτιμούν το `azd auth login` για ροές εργασίας AZD, με το `az login` να τοποθετείται ως προαιρετικό όταν χρησιμοποιούνται άμεσα εντολές Azure CLI

#### Διορθώθηκε
- **🪟 Εντολές εγκατάστασης Windows** εξομαλύνθηκαν στην τρέχουσα χρήση πεζοκεφαλαίων πακέτου `winget` στον οδηγό εγκατάστασης
- **🐧 Οδηγίες εγκατάστασης Linux** διορθώθηκαν για να αποφευχθούν μη υποστηριζόμενες διανομές ειδικές εντολές διαχειριστή πακέτων `azd` και αντίθετα να παραπέμπουν σε release assets όπου είναι κατάλληλο
- **📦 Παραδείγματα μοντέλων AI** ανανεώθηκαν από παλαιότερα προεπιλεγμένα όπως `gpt-35-turbo` και `text-embedding-ada-002` σε τρέχοντα παραδείγματα όπως `gpt-4.1-mini`, `gpt-4.1`, και `text-embedding-3-large`
- **📋 Snippets ανάπτυξης και διαγνωστικών** διορθώθηκαν για να χρησιμοποιούν τις τρέχουσες εντολές περιβάλλοντος και κατάστασης σε logs, scripts και βήματα αντιμετώπισης προβλημάτων
- **⚙️ Οδηγίες GitHub Actions** ενημερώθηκαν από `Azure/setup-azd@v1.0.0` σε `Azure/setup-azd@v2`
- **🤖 Οδηγίες συγκατάθεσης MCP/Copilot** ενημερώθηκαν από `azd mcp consent` σε `azd copilot consent list`

#### Βελτιώθηκε
- **🧠 Η ενότητα AI** τώρα εξηγεί καλύτερα την προεπισκόπηση ευαίσθητη συμπεριφορά του `azd ai`, την είσοδο ανά tenant, την τρέχουσα χρήση επεκτάσεων και τις ενημερωμένες προτάσεις για ανάπτυξη μοντέλων
- **🧪 Οι οδηγίες του εργαστηρίου** τώρα χρησιμοποιούν πιο ρεαλιστικά παραδείγματα εκδόσεων και πιο σαφή γλώσσα ρύθμισης περιβάλλοντος για εργαστήρια hands-on
- **📈 Τα έγγραφα παραγωγής και αντιμετώπισης προβλημάτων** τώρα εναρμονίζονται καλύτερα με την τρέχουσα παρακολούθηση, προτάσεις fallback μοντέλων και παραδείγματα επιπέδων κόστους

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

#### Εντολές AZD AI CLI, επικύρωση περιεχομένου & επέκταση προτύπων
**Αυτή η έκδοση προσθέτει κάλυψη εντολών `azd ai`, `azd extension` και `azd mcp` σε όλα τα κεφάλαια σχετικά με το AI, διορθώνει σπασμένους συνδέσμους και παρωχημένο κώδικα στο agents.md, ενημερώνει το cheat sheet και αναδομεί την ενότητα Παραδειγμάτων Προτύπων με επικυρωμένες περιγραφές και νέα πρότυπα Azure AI AZD.**

#### Προστέθηκε
- **🤖 Κάλυψη AZD AI CLI** σε 7 αρχεία (προηγουμένως μόνο στο Κεφάλαιο 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Νέα ενότητα "Extensions and AI Commands" που εισάγει `azd extension`, `azd ai agent init`, και `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Επιλογή 4: `azd ai agent init` με πίνακα σύγκρισης (προσέγγιση template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Υποενότητες "AZD Extensions for Foundry" και "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Το Quick Start τώρα δείχνει και διαδρομές ανάπτυξης βασισμένες σε template και manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Η ενότητα Deploy τώρα περιλαμβάνει επιλογή `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Υποενότητα "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Νέα ενότητα "AI & Extensions Commands" με `azd extension`, `azd ai agent init`, `azd mcp`, και `azd infra generate`
- **📦 Νέα πρότυπα AZD AI παραδείγματα** στο `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat με Blazor WebAssembly, Semantic Kernel, και υποστήριξη φωνητικής συνομιλίας
  - **azure-search-openai-demo-java** — Java RAG chat που χρησιμοποιεί Langchain4J με επιλογές ανάπτυξης σε ACA/AKS
  - **contoso-creative-writer** — Εφαρμογή πολλαπλών πρακτόρων για δημιουργική συγγραφή χρησιμοποιώντας Azure AI Agent Service, Bing Grounding, και Prompty
  - **serverless-chat-langchainjs** — Serverless RAG που χρησιμοποιεί Azure Functions + LangChain.js + Cosmos DB με τοπική υποστήριξη ανάπτυξης Ollama
  - **chat-with-your-data-solution-accelerator** — Επιχειρησιακός επιταχυντής RAG με portal διαχείρισης, ενσωμάτωση Teams, και επιλογές PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Αναφορά εφαρμογής πολλαπλού πράκτορα MCP orchestration με διακομιστές σε .NET, Python, Java, και TypeScript
  - **azd-ai-starter** — Ελάχιστο Bicep starter template για υποδομή Azure AI
  - **🔗 Σύνδεσμος στην awesome-azd συλλογή AI** — Αναφορά στην [awesome-azd συλλογή AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Διορθώθηκε
- **🔗 Πλοήγηση agents.md**: Οι σύνδεσμοι Previous/Next τώρα αντιστοιχούν στη σειρά μαθημάτων του README του Κεφαλαίου 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Σπασμένοι σύνδεσμοι agents.md**: `production-ai-practices.md` διορθώθηκε σε `../chapter-08-production/production-ai-practices.md` (3 εμφανίσεις)
- **📦 Παρωχημένος κώδικας agents.md**: Αντικαταστάθηκε το `opencensus` με `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Μη έγκυρο API agents.md**: Μετακινήθηκε το `max_tokens` από το `create_agent()` στο `create_run()` ως `max_completion_tokens`
- **🔢 Καταμέτρηση tokens agents.md**: Αντικαταστάθηκε η αδρή εκτίμηση `len//4` με `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Διορθώθηκαν οι υπηρεσίες από "Cognitive Search + App Service" σε "Azure AI Search + Azure Container Apps" (προεπιλεγμένος host άλλαξε Οκτ 2024)
- **contoso-chat**: Ενημερώθηκε η περιγραφή για να αναφερθεί το Azure AI Foundry + Prompty, ευθυγραμμιζόμενη με τον πραγματικό τίτλο και στοίβα τεχνολογιών του repo

#### Αφαιρέθηκε
- **ai-document-processing**: Αφαιρέθηκε η αναφορά μη λειτουργικού template (το repo δεν είναι δημόσια προσβάσιμο ως AZD template)

#### Βελτιώθηκε
- **📝 agents.md ασκήσεις**: Η Άσκηση 1 τώρα δείχνει το αναμενόμενο αποτέλεσμα και το βήμα `azd monitor`; Η Άσκηση 2 περιλαμβάνει πλήρη κώδικα εγγραφής `FunctionTool`; Η Άσκηση 3 αντικαθιστά την ασαφή καθοδήγηση με συγκεκριμένες εντολές `prepdocs.py`
- **📚 agents.md πόροι**: Ενημερώθηκαν οι σύνδεσμοι τεκμηρίωσης προς τα τρέχοντα Azure AI Agent Service docs και το quickstart
- **📋 agents.md Πίνακας Επόμενα Βήματα**: Προστέθηκε σύνδεσμος AI Workshop Lab για πλήρη κάλυψη κεφαλαίου

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

#### Βελτίωση πλοήγησης του μαθήματος
**Αυτή η έκδοση βελτιώνει την πλοήγηση των κεφαλαίων στο README.md με μια βελτιωμένη μορφή πίνακα.**

#### Αλλαγές
- **Course Map Table**: Ενισχυμένος με άμεσους συνδέσμους μαθημάτων, εκτιμήσεις διάρκειας και βαθμολογίες πολυπλοκότητας
- **Folder Cleanup**: Αφαιρέθηκαν περιττοί παλιοί φάκελοι (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Επαληθεύτηκαν όλοι οι 21+ εσωτερικοί σύνδεσμοι στον Πίνακα Χάρτη Μαθήματος

### [v3.16.0] - 2026-02-05

#### Ενημερώσεις ονομάτων προϊόντων
**Αυτή η έκδοση ενημερώνει τις αναφορές προϊόντων ώστε να αντανακλούν την τρέχουσα επωνυμία της Microsoft.**

#### Αλλαγές
- **Microsoft Foundry → Microsoft Foundry**: Όλες οι αναφορές ενημερώθηκαν σε μη-μεταφραζόμενα αρχεία
- **Azure AI Agent Service → Foundry Agents**: Ενημερώθηκε το όνομα της υπηρεσίας για να αντικατοπτρίζει την τρέχουσα επωνυμία

#### Ενημερωμένα αρχεία
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

#### Σημαντική Αναδιάρθρωση Αποθετηρίου: Ονόματα φακέλων βάσει κεφαλαίων
**Αυτή η έκδοση αναδιαρθρώνει την τεκμηρίωση σε αφιερωμένους φακέλους κεφαλαίων για πιο ξεκάθαρη πλοήγηση.**

#### Μετονομασίες φακέλων
Οι παλιοί φάκελοι έχουν αντικατασταθεί με φακέλους αριθμημένους ανά κεφάλαιο:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Μετακινήσεις αρχείων
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
- **📚 Αρχεία README κεφαλαίου**: Δημιουργήθηκε README.md σε κάθε φάκελο κεφαλαίου με:
  - Στόχοι μάθησης και διάρκεια
  - Πίνακας μαθημάτων με περιγραφές
  - Εντολές γρήγορης έναρξης
  - Πλοήγηση σε άλλα κεφάλαια

#### Αλλαγές
- **🔗 Ενημερώθηκαν όλοι οι εσωτερικοί σύνδεσμοι**: 78+ διαδρομές ενημερώθηκαν σε όλα τα αρχεία τεκμηρίωσης
- **🗺️ Main README.md**: Ενημερώθηκε ο Χάρτης Μαθήματος με τη νέα δομή κεφαλαίων
- **📝 examples/README.md**: Ενημερώθηκαν διασταυρούμενες αναφορές προς φακέλους κεφαλαίων

#### Αφαιρέθηκαν
- Αφαιρέθηκε η παλιά δομή φακέλων (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Αναδιάρθρωση Αποθετηρίου: Πλοήγηση Κεφαλαίων
**Αυτή η έκδοση πρόσθεσε αρχεία README πλοήγησης κεφαλαίων (υπερκεράστηκε από την v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Νέος Οδηγός για AI Agents
**Αυτή η έκδοση προσθέτει έναν ολοκληρωμένο οδηγό για ανάπτυξη AI agents με την Azure Developer CLI.**

#### Προστέθηκε
- **🤖 docs/microsoft-foundry/agents.md**: Πλήρης οδηγός που καλύπτει:
  - Τι είναι οι AI agents και πώς διαφέρουν από τα chatbots
  - Τρία πρότυπα agents γρήγορης εκκίνησης (Foundry Agents, Prompty, RAG)
  - Πρότυπα αρχιτεκτονικής agent (μονός agent, RAG, multi-agent)
  - Ρύθμιση εργαλείων και προσαρμογή
  - Παρακολούθηση και καταγραφή μετρικών
  - Παραμέτροι κόστους και βελτιστοποίηση
  - Συνήθη σενάρια αντιμετώπισης προβλημάτων
  - Τρεις πρακτικές ασκήσεις με κριτήρια επιτυχίας

#### Δομή περιεχομένου
- **Εισαγωγή**: Έννοιες agents για αρχάριους
- **Γρήγορη εκκίνηση**: Αναπτύξτε agents με `azd init --template get-started-with-ai-agents`
- **Πρότυπα Αρχιτεκτονικής**: Οπτικά διαγράμματα προτύπων agents
- **Διαμόρφωση**: Ρύθμιση εργαλείων και μεταβλητές περιβάλλοντος
- **Παρακολούθηση**: Ενσωμάτωση με Application Insights
- **Ασκήσεις**: Προοδευτική πρακτική εκμάθηση (20-45 λεπτά η κάθε μία)

---

### [v3.12.0] - 2026-02-05

#### Ενημέρωση Περιβάλλοντος DevContainer
**Αυτή η έκδοση ενημερώνει τη διαμόρφωση του development container με σύγχρονα εργαλεία και καλύτερες προεπιλογές για την εμπειρία εκμάθησης του AZD.**

#### Αλλαγές
- **🐳 Βασική εικόνα**: Ενημερώθηκε από `python:3.12-bullseye` σε `python:3.12-bookworm` (τελευταία σταθερή έκδοση Debian)
- **📛 Όνομα κοντέινερ**: Μετονομάστηκε από "Python 3" σε "AZD for Beginners" για σαφήνεια

#### Προστέθηκε
- **🔧 Νέες λειτουργίες Dev Container**:
  - `azure-cli` με ενεργοποιημένη υποστήριξη Bicep
  - `node:20` (έκδοση LTS για πρότυπα AZD)
  - `github-cli` για διαχείριση προτύπων
  - `docker-in-docker` για αναπτύξεις εφαρμογών κοντέινερ

- **🔌 Προώθηση θυρών**: Προ-διαμορφωμένες θύρες για κοινή ανάπτυξη:
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

- **⚙️ Ρυθμίσεις VS Code**: Προστέθηκαν προεπιλεγμένες ρυθμίσεις για interpreter Python, format on save και αφαίρεση κενών
- **📦 Ενημερωμένο requirements-dev.txt**:
  - Προστέθηκε plugin minify για MkDocs
  - Προστέθηκε pre-commit για ποιότητα κώδικα
  - Προστέθηκαν πακέτα Azure SDK (azure-identity, azure-mgmt-resource)

#### Διορθώθηκε
- **Post-Create Command**: Τώρα επαληθεύει την εγκατάσταση AZD και Azure CLI κατά την εκκίνηση του container

---

### [v3.11.0] - 2026-02-05

#### Ριζική Αναθεώρηση README φιλική προς αρχάριους
**Αυτή η έκδοση βελτιώνει σημαντικά το README.md για να είναι πιο προσιτό σε αρχάριους και προσθέτει βασικούς πόρους για προγραμματιστές AI.**

#### Προστέθηκε
- **🆚 Azure CLI vs AZD Σύγκριση**: Σαφής εξήγηση για το πότε να χρησιμοποιείται κάθε εργαλείο με πρακτικά παραδείγματα
- **🌟 Συνδέσεις Awesome AZD**: Άμεσοι σύνδεσμοι στη συλλογή προτύπων της κοινότητας και πόρους συνεισφοράς:
  - [Υπέροχη Συλλογή AZD](https://azure.github.io/awesome-azd/) - 200+ έτοιμα προς ανάπτυξη πρότυπα
  - [Υποβολή προτύπου](https://github.com/Azure/awesome-azd/issues) - Συνεισφορά κοινότητας
- **🎯 Οδηγός Γρήγορης Εκκίνησης**: Απλοποιημένο τμήμα εκκίνησης 3 βημάτων (Install → Login → Deploy)
- **📊 Πίνακας Πλοήγησης Βασισμένος στην Εμπειρία**: Σαφείς οδηγίες για το πού να ξεκινήσετε ανάλογα με την εμπειρία προγραμματιστή

#### Αλλαγές
- **Δομή README**: Αναδιοργανώθηκε για προοδευτική αποκάλυψη - οι βασικές πληροφορίες πρώτα
- **Ενότητα Εισαγωγής**: Επανέγραψε για να εξηγήσει "The Magic of `azd up`" για απολύτως αρχάριους
- **Αφαιρεμένο Διπλό Περιεχόμενο**: Εξαλείφθηκε το διπλό τμήμα αντιμετώπισης προβλημάτων
- **Εντολές αντιμετώπισης προβλημάτων**: Διορθώθηκε η αναφορά `azd logs` για να χρησιμοποιεί την έγκυρη `azd monitor --logs`

#### Διορθώθηκε
- **🔐 Εντολές πιστοποίησης**: Προστέθηκαν `azd auth login` και `azd auth logout` στο cheat-sheet.md
- **Μη έγκυρες αναφορές εντολών**: Αφαιρέθηκε το υπόλοιπο `azd logs` από την ενότητα αντιμετώπισης προβλημάτων του README

#### Σημειώσεις
- **Πεδίο**: Οι αλλαγές εφαρμόστηκαν στο κύριο README.md και στο resources/cheat-sheet.md
- **Στοχευόμενο κοινό**: Οι βελτιώσεις απευθύνονται ειδικά σε προγραμματιστές νέους στο AZD

---

### [v3.10.0] - 2026-02-05

#### Ενημέρωση ακρίβειας εντολών Azure Developer CLI
**Αυτή η έκδοση διορθώνει μη υπαρκτές εντολές AZD σε όλη την τεκμηρίωση, εξασφαλίζοντας ότι όλα τα παραδείγματα κώδικα χρησιμοποιούν έγκυρη σύνταξη της Azure Developer CLI.**

#### Διορθώθηκε
- **🔧 Αφαίρεση μη-υπαρχόντων εντολών AZD**: Εκτενής έλεγχος και διόρθωση μη έγκυρων εντολών:
  - `azd logs` (δεν υπάρχει) → αντικαταστάθηκε με `azd monitor --logs` ή εναλλακτικές Azure CLI
  - `azd service` subcommands (δεν υπάρχουν) → αντικαταστάθηκαν με `azd show` και Azure CLI
  - `azd infra import/export/validate` (δεν υπάρχουν) → αφαιρέθηκαν ή αντικαταστάθηκαν με έγκυρες εναλλακτικές
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (δεν υπάρχουν) → αφαιρέθηκαν
  - `azd provision --what-if/--rollback` flags (δεν υπάρχουν) → ενημερώθηκαν για χρήση `--preview`
  - `azd config validate` (δεν υπάρχει) → αντικαταστάθηκε με `azd config list`
  - `azd info`, `azd history`, `azd metrics` (δεν υπάρχουν) → αφαιρέθηκαν

- **📚 Ενημερωμένα αρχεία με διορθώσεις εντολών**:
  - `resources/cheat-sheet.md`: Μεγάλη αναθεώρηση του πίνακα εντολών
  - `docs/deployment/deployment-guide.md`: Διορθώσεις για στρατηγικές επαναφοράς και ανάπτυξης
  - `docs/troubleshooting/debugging.md`: Διορθώσεις σε ενότητες ανάλυσης logs
  - `docs/troubleshooting/common-issues.md`: Ενημερωμένες εντολές αντιμετώπισης προβλημάτων
  - `docs/troubleshooting/ai-troubleshooting.md`: Διόρθωση ενότητας debugging AZD
  - `docs/getting-started/azd-basics.md`: Διορθώσεις εντολών παρακολούθησης
  - `docs/getting-started/first-project.md`: Ενημερωμένα παραδείγματα παρακολούθησης και αποσφαλμάτωσης
  - `docs/getting-started/installation.md`: Διορθώσεις βοηθητικών και παραδειγμάτων έκδοσης
  - `docs/pre-deployment/application-insights.md`: Διορθώσεις εντολών προβολής logs
  - `docs/pre-deployment/coordination-patterns.md`: Διορθώσεις εντολών debugging agents

- **📝 Ενημερωμένη αναφορά έκδοσης**:
  - `docs/getting-started/installation.md`: Αλλαγή της σκληρά κωδικοποιημένης έκδοσης `1.5.0` σε γενική `1.x.x` με σύνδεσμο προς releases

#### Αλλαγές
- **Στρατηγικές επαναφοράς**: Η τεκμηρίωση ενημερώθηκε για χρήση επαναφοράς βασισμένης σε Git (το AZD δεν έχει εγγενή rollback)
- **Προβολή logs**: Οι αναφορές `azd logs` αντικαταστάθηκαν με `azd monitor --logs`, `azd monitor --live` και εντολές Azure CLI
- **Ενότητα απόδοσης**: Αφαιρέθηκαν μη-υπάρχες flags παράλληλης/επικαιροποιημένης ανάπτυξης και προτείνονται έγκυρες εναλλακτικές

#### Τεχνικές Λεπτομέρειες
- **Έγκυρες εντολές AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Έγκυρες σημαίες azd monitor**: `--live`, `--logs`, `--overview`
- **Καταργημένα χαρακτηριστικά**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Σημειώσεις
- **Επαλήθευση**: Εντολές επικυρωμένες έναντι του Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ολοκλήρωση εργαστηρίου και ενημέρωση ποιότητας τεκμηρίωσης
**Αυτή η έκδοση ολοκληρώνει τα διαδραστικά modules εργαστηρίου, επιδιορθώνει όλους τους σπασμένους συνδέσμους τεκμηρίωσης και βελτιώνει τη συνολική ποιότητα περιεχομένου για προγραμματιστές AI που χρησιμοποιούν το Microsoft AZD.**

#### Προστέθηκε
- **📝 CONTRIBUTING.md**: Νέο έγγραφο οδηγιών συνεισφοράς με:
  - Σαφείς οδηγίες για την αναφορά προβλημάτων και την πρόταση αλλαγών
  - Πρότυπα τεκμηρίωσης για νέο περιεχόμενο
  - Οδηγίες για παραδείγματα κώδικα και συμβάσεις μηνυμάτων commit
  - Πληροφορίες για εμπλοκή της κοινότητας

#### Ολοκληρώθηκε
- **🎯 Ενότητα εργαστηρίου 7 (Σύνοψη)**: Πλήρως ολοκληρωμένη ενότητα σύνοψης με:
  - Εκτενή περίληψη των επιτευγμάτων του εργαστηρίου
  - Τμήμα βασικών εννοιών που καλύπτει το AZD, τα πρότυπα και το Microsoft Foundry
  - Συστάσεις για τη συνέχεια της μαθησιακής πορείας
  - Ασκήσεις προκλήσεων εργαστηρίου με βαθμολογίες δυσκολίας
  - Σύνδεσμοι για σχόλια της κοινότητας και υποστήριξη

- **📚 Ενότητα εργαστηρίου 3 (Αποδόμηση)**: Ενημερωμένοι μαθησιακοί στόχοι με:
  - Οδηγίες ενεργοποίησης του GitHub Copilot με διακομιστές MCP
  - Κατανόηση της δομής φακέλων προτύπων AZD
  - Πρότυπα οργάνωσης Infrastructure-as-Code (Bicep)
  - Οδηγίες εργαστηρίου πρακτικής άσκησης

- **🔧 Ενότητα εργαστηρίου 6 (Καθαρισμός/Teardown)**: Ολοκληρώθηκε με:
  - Στόχους καθαρισμού πόρων και διαχείρισης κόστους
  - Χρήση `azd down` για ασφαλή αποδέσμευση υποδομής
  - Οδηγίες ανάκτησης μαλακά διαγραμμένων γνωστικών υπηρεσιών
  - Πρόσθετες προτροπές εξερεύνησης για το GitHub Copilot και το Azure Portal

#### Διορθώθηκε
- **🔗 Διορθώσεις σπασμένων συνδέσμων**: Επιδιορθώθηκαν 15+ σπασμένοι εσωτερικοί σύνδεσμοι τεκμηρίωσης:
  - `docs/ai-foundry/ai-model-deployment.md`: Διορθώθηκαν διαδρομές προς microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Διορθώθηκαν διαδρομές προς ai-model-deployment.md και production-ai-practices.md
  - `docs/getting-started/first-project.md`: Αντικαταστάθηκε το μη υπάρχον cicd-integration.md με deployment-guide.md
  - `examples/retail-scenario.md`: Διορθώθηκαν διαδρομές FAQ και οδηγού αντιμετώπισης προβλημάτων
  - `examples/container-app/microservices/README.md`: Διορθώθηκαν διαδρομές course home και deployment guide
  - `resources/faq.md` και `resources/glossary.md`: Ενημερώθηκαν αναφορές κεφαλαίου AI
  - `course-outline.md`: Διορθώθηκαν αναφορές instructor guide και εργαστηριακών ασκήσεων AI

- **📅 Πανό κατάστασης εργαστηρίου**: Ενημερώθηκε από "Under Construction" σε ενεργή κατάσταση εργαστηρίου με ημερομηνία Φεβρουάριος 2026

- **🔗 Πλοήγηση εργαστηρίου**: Διορθώθηκαν σπασμένοι σύνδεσμοι πλοήγησης στο README.md του εργαστηρίου που έδειχναν στον μη υπάρχοντα φάκελο lab-1-azd-basics

#### Αλλαγές
- **Παρουσίαση εργαστηρίου**: Αφαιρέθηκε η προειδοποίηση "Under Construction", το εργαστήριο είναι πλέον ολοκληρωμένο και έτοιμο προς χρήση
- **Συνέπεια πλοήγησης**: Εξασφαλίστηκε ότι όλες οι ενότητες εργαστηρίου διαθέτουν σωστή δια-ενότητας πλοήγηση
- **Αναφορές διαδρομής μάθησης**: Ενημερώθηκαν οι δια-αναφορές κεφαλαίων ώστε να χρησιμοποιούν τις σωστές microsoft-foundry διαδρομές

#### Επικυρώθηκε
- ✅ Όλα τα αγγλικά αρχεία markdown έχουν έγκυρους εσωτερικούς συνδέσμους
- ✅ Οι ενότητες εργαστηρίου 0-7 είναι πλήρεις με μαθησιακούς στόχους
- ✅ Η πλοήγηση μεταξύ κεφαλαίων και ενοτήτων λειτουργεί σωστά
- ✅ Το περιεχόμενο είναι κατάλληλο για προγραμματιστές AI που χρησιμοποιούν το Microsoft AZD
- ✅ Η γλώσσα και η δομή παραμένουν φιλικές προς αρχάριους
- ✅ Το CONTRIBUTING.md παρέχει σαφείς οδηγίες για συνεισφέροντες της κοινότητας

#### Τεχνική υλοποίηση
- **Επικύρωση συνδέσμων**: Ένα αυτοματοποιημένο script PowerShell επαλήθευσε όλους τους εσωτερικούς συνδέσμους .md
- **Έλεγχος περιεχομένου**: Χειροκίνητη ανασκόπηση της πληρότητας του εργαστηρίου και της καταλληλότητας για αρχάριους
- **Σύστημα πλοήγησης**: Εφαρμόστηκαν συνεπή πρότυπα πλοήγησης κεφαλαίων και ενοτήτων

#### Σημειώσεις
- **Πεδίο**: Οι αλλαγές εφαρμόστηκαν μόνο στην αγγλική τεκμηρίωση
- **Μεταφράσεις**: Οι φάκελοι μεταφράσεων δεν ενημερώθηκαν σε αυτή την έκδοση (η αυτοματοποιημένη μετάφραση θα συγχρονιστεί αργότερα)
- **Διάρκεια εργαστηρίου**: Το ολοκληρωμένο εργαστήριο παρέχει τώρα 3-4 ώρες πρακτικής μάθησης

---

### [v3.8.0] - 2025-11-19

#### Προηγμένη τεκμηρίωση: Παρακολούθηση, Ασφάλεια και Μοτίβα Πολυ-πρακτόρων
**Αυτή η έκδοση προσθέτει ολοκληρωμένα μαθήματα επιπέδου A για την ενσωμάτωση του Application Insights, μοτίβα πιστοποίησης και συντονισμού πολλαπλών πρακτόρων για παραγωγικές αναπτύξεις.**

#### Προστέθηκε
- **📊 Μάθημα ενσωμάτωσης Application Insights**: στο `docs/pre-deployment/application-insights.md`:
  - Ανάπτυξη με επίκεντρο το AZD με αυτόματη παροχή
  - Πλήρη Bicep templates για Application Insights + Log Analytics
  - Λειτουργικές εφαρμογές Python με προσαρμοσμένη τηλεμετρία (1,200+ γραμμές)
  - Μοτίβα παρακολούθησης AI/LLM (παρακολούθηση tokens/cost για Microsoft Foundry Models)
  - 6 διαγράμματα Mermaid (αρχιτεκτονική, κατανεμημένη ιχνηλασία, ροή τηλεμετρίας)
  - 3 εργαστηριακές ασκήσεις (alerts, dashboards, παρακολούθηση AI)
  - Παραδείγματα ερωτημάτων Kusto και στρατηγικές βελτιστοποίησης κόστους
  - Ροή μετρήσεων σε πραγματικό χρόνο και εντοπισμός σφαλμάτων
  - Χρόνος μάθησης 40-50 λεπτά με παραγωγικά μοτίβα

- **🔐 Μάθημα Πιστοποίησης & Ασφάλειας**: στο `docs/getting-started/authsecurity.md`:
  - 3 μοτίβα πιστοποίησης (connection strings, Key Vault, managed identity)
  - Πλήρη Bicep templates υποδομής για ασφαλείς αναπτύξεις
  - Κώδικας εφαρμογής Node.js με ενσωμάτωση Azure SDK
  - 3 πλήρεις εργασίες (ενεργοποίηση managed identity, user-assigned identity, rotation Key Vault)
  - Καλές πρακτικές ασφάλειας και ρυθμίσεις RBAC
  - Οδηγός αντιμετώπισης προβλημάτων και ανάλυση κόστους
  - Παραγωγικά μοτίβα authentication χωρίς κωδικούς πρόσβασης

- **🤖 Μάθημα Μοτίβων Συντονισμού Πολυ-πρακτόρων**: στο `docs/pre-deployment/coordination-patterns.md`:
  - 5 μοτίβα συντονισμού (διαδοχικό, παράλληλο, ιεραρχικό, event-driven, consensus)
  - Ολοκληρωμένη υλοποίηση υπηρεσίας ορχήστρωσης (Python/Flask, 1,500+ γραμμές)
  - 3 εξειδικευμένες υλοποιήσεις πρακτόρων (Research, Writer, Editor)
  - Ενσωμάτωση Service Bus για ουρές μηνυμάτων
  - Διαχείριση κατάστασης με Cosmos DB για κατανεμημένα συστήματα
  - 6 διαγράμματα Mermaid που δείχνουν αλληλεπιδράσεις πρακτόρων
  - 3 προχωρημένες ασκήσεις (διαχείριση timeout, λογική επαναπροσπάθειας, circuit breaker)
  - Ανάλυση κόστους ($240-565/month) με στρατηγικές βελτιστοποίησης
  - Ενσωμάτωση Application Insights για παρακολούθηση

#### Βελτιώθηκε
- **Κεφάλαιο Pre-deployment**: Τώρα περιλαμβάνει πλήρεις οδηγίες παρακολούθησης και μοτίβα συντονισμού
- **Κεφάλαιο Getting Started**: Εμπλουτίστηκε με επαγγελματικά μοτίβα πιστοποίησης
- **Ετοιμότητα για Παραγωγή**: Πλήρης κάλυψη από ασφάλεια έως παρατηρησιμότητα
- **Πρόγραμμα Μαθήματος**: Ενημερώθηκε για να αναφέρει τα νέα μαθήματα στα Κεφάλαια 3 και 6

#### Αλλαγές
- **Πορεία μάθησης**: Καλύτερη ενσωμάτωση ασφάλειας και παρακολούθησης σε όλο το μάθημα
- **Ποιότητα τεκμηρίωσης**: Συνεπείς προδιαγραφές επιπέδου A (95-97%) σε νέα μαθήματα
- **Μοτίβα παραγωγής**: Πλήρης κάλυψη end-to-end για επιχειρησιακές αναπτύξεις

#### Βελτιώσεις
- **Εμπειρία προγραμματιστή**: Σαφής διαδρομή από ανάπτυξη σε παραγωγική παρακολούθηση
- **Πρότυπα ασφάλειας**: Επαγγελματικά μοτίβα για διαχείριση μυστικών και authentication
- **Παρατηρησιμότητα**: Ολοκληρωμένη ενσωμάτωση Application Insights με AZD
- **Workloads AI**: Εξειδικευμένη παρακολούθηση για Microsoft Foundry Models και συστήματα πολλαπλών πρακτόρων

#### Επικυρώθηκε
- ✅ Όλα τα μαθήματα περιλαμβάνουν πλήρη λειτουργικό κώδικα (όχι αποσπάσματα)
- ✅ Διαγράμματα Mermaid για οπτική μάθηση (19 συνολικά σε 3 μαθήματα)
- ✅ Εργασίες πρακτικής με βήματα επαλήθευσης (9 συνολικά)
- ✅ Παραγωγικά Bicep templates αναπτυσσόμενα μέσω `azd up`
- ✅ Ανάλυση κόστους και στρατηγικές βελτιστοποίησης
- ✅ Οδηγοί αντιμετώπισης προβλημάτων και βέλτιστες πρακτικές
- ✅ Σημεία ελέγχου γνώσης με εντολές επαλήθευσης

#### Βαθμολόγηση τεκμηρίωσης
- **docs/pre-deployment/application-insights.md**: - Ολοκληρωμένος οδηγός παρακολούθησης
- **docs/getting-started/authsecurity.md**: - Επαγγελματικά μοτίβα ασφάλειας
- **docs/pre-deployment/coordination-patterns.md**: - Προχωρημένες αρχιτεκτονικές πολυ-πρακτόρων
- **Νέο περιεχόμενο συνολικά**: - Συνεπείς υψηλής ποιότητας προδιαγραφές

#### Τεχνική υλοποίηση
- **Application Insights**: Log Analytics + προσαρμοσμένη τηλεμετρία + κατανεμημένη ιχνηλασία
- **Authentication**: Managed Identity + Key Vault + μοτίβα RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + ορχήστρωση
- **Monitoring**: Live metrics + Kusto ερωτήματα + alerts + dashboards
- **Διαχείριση κόστους**: Στρατηγικές δειγματοληψίας, πολιτικές retention, έλεγχοι προϋπολογισμού

### [v3.7.0] - 2025-11-19

#### Βελτιώσεις ποιότητας τεκμηρίωσης και νέο παράδειγμα Microsoft Foundry Models
**Αυτή η έκδοση βελτιώνει την ποιότητα τεκμηρίωσης σε όλο το αποθετήριο και προσθέτει ένα πλήρες παράδειγμα ανάπτυξης Microsoft Foundry Models με διεπαφή συνομιλίας gpt-4.1.**

#### Προστέθηκε
- **🤖 Παράδειγμα συνομιλίας Microsoft Foundry Models**: Πλήρης ανάπτυξη gpt-4.1 με λειτουργική υλοποίηση στο `examples/azure-openai-chat/`:
  - Ολοκληρωμένη υποδομή Microsoft Foundry Models (ανάπτυξη μοντέλου gpt-4.1)
  - Διεπαφή συνομιλίας γραμμής εντολών Python με ιστορικό συνομιλιών
  - Ενσωμάτωση Key Vault για ασφαλή αποθήκευση κλειδιών API
  - Παρακολούθηση χρήσης tokens και εκτίμηση κόστους
  - Περιορισμός ρυθμού (rate limiting) και χειρισμός σφαλμάτων
  - Περιεκτικό README με οδηγό ανάπτυξης 35-45 λεπτών
  - 11 αρχεία παραγωγικής υλοποίησης (Bicep templates, Python app, ρυθμίσεις)
- **📚 Ασκήσεις τεκμηρίωσης**: Προστέθηκαν εργασίες πρακτικής στον οδηγό ρυθμίσεων:
  - Άσκηση 1: Παραμετροποίηση πολλαπλών περιβαλλόντων (15 λεπτά)
  - Άσκηση 2: Πρακτική διαχείρισης μυστικών (10 λεπτά)
  - Σαφή κριτήρια επιτυχίας και βήματα επαλήθευσης
- **✅ Επαλήθευση ανάπτυξης**: Προστέθηκε ενότητα επαλήθευσης στον οδηγό ανάπτυξης:
  - Διαδικασίες health check
  - Λίστα ελέγχου κριτηρίων επιτυχίας
  - Αναμενόμενες εξόδους για όλες τις εντολές ανάπτυξης
  - Γρήγορη αναφορά αντιμετώπισης προβλημάτων

#### Βελτιώθηκε
- **examples/README.md**: Ενημερώθηκε σε ποιότητα A-grade (93%):
  - Προστέθηκε το azure-openai-chat σε όλες τις σχετικές ενότητες
  - Ενημερώθηκε ο αριθμός τοπικών παραδειγμάτων από 3 σε 4
  - Προστέθηκε στον Πίνακα Παραδειγμάτων Εφαρμογών AI
  - Ενσωματώθηκε στο Quick Start για ενδιάμεσους χρήστες
  - Προστέθηκε στη ενότητα Microsoft Foundry Templates
  - Ενημερώθηκε ο Πίνακας Σύγκρισης και τμήμα εύρεσης τεχνολογιών
- **Ποιότητα τεκμηρίωσης**: Βελτιώθηκε από B+ (87%) → A- (92%) σε όλο τον φάκελο docs:
  - Προστέθηκαν αναμενόμενες εξόδοι σε κρίσιμα παραδείγματα εντολών
  - Συμπεριλήφθηκαν βήματα επαλήθευσης για αλλαγές ρυθμίσεων
  - Ενισχυμένη πρακτική μάθηση με πρακτικές ασκήσεις

#### Αλλαγές
- **Πορεία μάθησης**: Καλύτερη ενσωμάτωση παραδειγμάτων AI για ενδιάμεσους μαθητές
- **Δομή τεκμηρίωσης**: Πιο πρακτικές ασκήσεις με σαφή αποτελέσματα
- **Διαδικασία επαλήθευσης**: Προστέθηκαν ρητά κριτήρια επιτυχίας σε βασικές ροές εργασίας

#### Βελτιώσεις
- **Εμπειρία προγραμματιστή**: Η ανάπτυξη Microsoft Foundry Models τώρα απαιτεί 35-45 λεπτά (αντί 60-90 για πολύπλοκες εναλλακτικές)
- **Διαφάνεια κόστους**: Σαφείς εκτιμήσεις κόστους ($50-200/month) για το παράδειγμα Microsoft Foundry Models
- **Διαδρομή μάθησης**: Οι προγραμματιστές AI έχουν σαφή σημείο εισόδου με το azure-openai-chat
- **Προδιαγραφές τεκμηρίωσης**: Συνεπείς αναμενόμενες εξόδους και βήματα επαλήθευσης

#### Επικυρώθηκε
- ✅ Το παράδειγμα Microsoft Foundry Models λειτουργεί πλήρως με `azd up`
- ✅ Όλα τα 11 αρχεία υλοποίησης είναι σύντακτικά σωστά
- ✅ Οι οδηγίες του README ταιριάζουν με την πραγματική εμπειρία ανάπτυξης
- ✅ Ενημερώθηκαν σύνδεσμοι τεκμηρίωσης σε 8+ τοποθεσίες
- ✅ Ο δείκτης παραδειγμάτων αντανακλά σωστά 4 τοπικά παραδείγματα
- ✅ Δεν υπάρχουν διπλοί εξωτερικοί σύνδεσμοι σε πίνακες
- ✅ Όλες οι αναφορές πλοήγησης είναι σωστές

#### Τεχνική υλοποίηση
- **Αρχιτεκτονική Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps μοτίβο
- **Ασφάλεια**: Έτοιμο για Managed Identity, μυστικά στο Key Vault
- **Παρακολούθηση**: Ενσωμάτωση Application Insights
- **Διαχείριση κόστους**: Παρακολούθηση tokens και βελτιστοποίηση χρήσης
- **Ανάπτυξη**: Ενιαία εντολή `azd up` για πλήρη ρύθμιση

### [v3.6.0] - 2025-11-19

#### Μεγάλη ενημέρωση: Παραδείγματα ανάπτυξης Container App
**Αυτή η έκδοση εισάγει ολοκληρωμένα, παραγωγικά παραδείγματα ανάπτυξης container εφαρμογών χρησιμοποιώντας το Azure Developer CLI (AZD), με πλήρη τεκμηρίωση και ενσωμάτωση στη μαθησιακή πορεία.**

#### Προστέθηκε
- **🚀 Παραδείγματα Container App**: Νέα τοπικά παραδείγματα στο `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Πλήρης επισκόπηση containerized αναπτύξεων, quick start, παραγωγή και προηγμένα μοτίβα
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Φιλική προς αρχάριους REST API με scale-to-zero, health probes, παρακολούθηση και αντιμετώπιση προβλημάτων
  - [Microservices Architecture](../../examples/container-app/microservices): Παραγωγικής λειτουργίας πολλαπλών υπηρεσιών ανάπτυξη (API Gateway, Product, Order, User, Notification), ασύγχρονη ανταλλαγή μηνυμάτων, Service Bus, Cosmos DB, Azure SQL, διανεμημένη ιχνηλασία, blue-green/canary deployment
- **Καλές πρακτικές**: Ασφάλεια, παρακολούθηση, βελτιστοποίηση κόστους και οδηγίες CI/CD για containerized φορτία εργασίας
- **Δείγματα κώδικα**: Πλήρη `azure.yaml`, Bicep templates και υλοποιήσεις υπηρεσιών σε πολλαπλές γλώσσες (Python, Node.js, C#, Go)
- **Δοκιμές & Αντιμετώπιση προβλημάτων**: Σενάρια end-to-end δοκιμών, εντολές παρακολούθησης, οδηγίες αντιμετώπισης προβλημάτων

#### Αλλαγές
- **README.md**: Ενημερώθηκε ώστε να παρουσιάζει και να συνδέει νέα παραδείγματα εφαρμογών container κάτω από "Τοπικά Παραδείγματα - Εφαρμογές Container"
- **examples/README.md**: Ενημερώθηκε για να τονίζει τα παραδείγματα εφαρμογών container, να προσθέτει καταχωρήσεις στον πίνακα σύγκρισης και να ενημερώνει αναφορές τεχνολογίας/αρχιτεκτονικής
- **Course Outline & Study Guide**: Ενημερώθηκε για να αναφέρει τα νέα παραδείγματα εφαρμογών container και τα πρότυπα ανάπτυξης στα σχετικά κεφάλαια

#### Επικυρώθηκε
- ✅ Όλα τα νέα παραδείγματα αναπτύξιμα με `azd up` και ακολουθούν τις βέλτιστες πρακτικές
- ✅ Οι διασταυρούμενοι σύνδεσμοι τεκμηρίωσης και η πλοήγηση ενημερώθηκαν
- ✅ Τα παραδείγματα καλύπτουν σενάρια από αρχάριους έως προχωρημένους, συμπεριλαμβανομένων παραγωγικών μικροϋπηρεσιών

#### Σημειώσεις
- **Εύρος**: Μόνο αγγλική τεκμηρίωση και παραδείγματα
- **Επόμενα Βήματα**: Επέκταση με πρόσθετα προχωρημένα πρότυπα container και αυτοματοποίηση CI/CD σε μελλοντικές εκδόσεις

### [v3.5.0] - 2025-11-19

#### Επαναονομασία Προϊόντος: Microsoft Foundry
**Αυτή η έκδοση υλοποιεί μια ολοκληρωμένη αλλαγή ονομασίας προϊόντος από "Microsoft Foundry" σε "Microsoft Foundry" σε όλη την αγγλική τεκμηρίωση, αντανακλώντας την επίσημη αλλαγή εμπορικού σήματος της Microsoft.**

#### Αλλαγές
- **🔄 Ενημέρωση Ονόματος Προϊόντος**: Πλήρης επανατοποθέτηση ονομασίας από "Microsoft Foundry" σε "Microsoft Foundry"
  - Ενημερώθηκαν όλες οι αναφορές στην αγγλόφωνη τεκμηρίωση στον φάκελο `docs/`
  - Μετονομασία φακέλου: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Μετονομασία αρχείου: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Σύνολο: 23 αναφορές περιεχομένου ενημερώθηκαν σε 7 αρχεία τεκμηρίωσης

- **📁 Αλλαγές Δομής Φακέλων**:
  - `docs/ai-foundry/` μετονομάστηκε σε `docs/microsoft-foundry/`
  - Όλες οι διασταυρούμενες αναφορές ενημερώθηκαν για να αντικατοπτρίζουν τη νέα δομή φακέλων
  - Οι σύνδεσμοι πλοήγησης επαληθεύτηκαν σε όλη την τεκμηρίωση

- **📄 Μετονομασίες Αρχείων**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Όλοι οι εσωτερικοί σύνδεσμοι ενημερώθηκαν για να αναφέρονται στο νέο όνομα αρχείου

#### Ενημερωμένα Αρχεία
- **Τεκμηρίωση Κεφαλαίων** (7 αρχεία):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 ενημερώσεις συνδέσμων πλοήγησης
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 αναφορές ονόματος προϊόντος ενημερώθηκαν
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ήδη χρησιμοποιεί το Microsoft Foundry (από προηγούμενες ενημερώσεις)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 αναφορές ενημερώθηκαν (επισκόπηση, ανατροφοδότηση κοινότητας, τεκμηρίωση)
  - `docs/getting-started/azd-basics.md` - 4 διασταυρούμενοι σύνδεσμοι ενημερώθηκαν
  - `docs/getting-started/first-project.md` - 2 σύνδεσμοι πλοήγησης κεφαλαίου ενημερώθηκαν
  - `docs/getting-started/installation.md` - 2 σύνδεσμοι επόμενου κεφαλαίου ενημερώθηκαν
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 αναφορές ενημερώθηκαν (πλοήγηση, κοινότητα Discord)
  - `docs/troubleshooting/common-issues.md` - 1 σύνδεσμος πλοήγησης ενημερώθηκε
  - `docs/troubleshooting/debugging.md` - 1 σύνδεσμος πλοήγησης ενημερώθηκε

- **Αρχεία Δομής Μαθήματος** (2 αρχεία):
  - `README.md` - 17 αναφορές ενημερώθηκαν (επισκόπηση μαθήματος, τίτλοι κεφαλαίων, ενότητα προτύπων, πληροφορίες κοινότητας)
  - `course-outline.md` - 14 αναφορές ενημερώθηκαν (επισκόπηση, μαθησιακοί στόχοι, πόροι κεφαλαίου)

#### Επικυρώθηκε
- ✅ Μηδέν απομείναντες αναφορές μονοπατιού φακέλου "ai-foundry" στην αγγλική τεκμηρίωση
- ✅ Μηδέν απομείνασες αναφορές προϊόντος "Microsoft Foundry" στην αγγλική τεκμηρίωση
- ✅ Όλοι οι σύνδεσμοι πλοήγησης λειτουργικοί με τη νέα δομή φακέλων
- ✅ Οι μετονομασίες αρχείων και φακέλων ολοκληρώθηκαν επιτυχώς
- ✅ Οι διασταυρούμενες αναφορές μεταξύ κεφαλαίων επαληθεύτηκαν

#### Σημειώσεις
- **Εύρος**: Οι αλλαγές εφαρμόστηκαν μόνο στην αγγλική τεκμηρίωση στον φάκελο `docs/`
- **Μεταφράσεις**: Οι φάκελοι μεταφράσεων (`translations/`) δεν ενημερώθηκαν σε αυτή την έκδοση
- **Εργαστήριο**: Το υλικό εργαστηρίου (`workshop/`) δεν ενημερώθηκε σε αυτή την έκδοση
- **Παραδείγματα**: Τα αρχεία παραδειγμάτων ενδέχεται να εξακολουθούν να αναφέρονται στην παλιά ονοματολογία (θα αντιμετωπιστεί σε μελλοντική ενημέρωση)
- **Εξωτερικοί Σύνδεσμοι**: Οι εξωτερικές διευθύνσεις URL και οι αναφορές αποθετηρίου GitHub παραμένουν αμετάβλητες

#### Οδηγός Μετανάστευσης για Συνεισφέροντες
Εάν έχετε τοπικά branches ή τεκμηρίωση που αναφέρεται στην παλιά δομή:
1. Ενημερώστε τις αναφορές φακέλων: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Ενημερώστε τις αναφορές αρχείων: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Αντικαταστήστε το όνομα προϊόντος: "Microsoft Foundry" → "Microsoft Foundry"
4. Επαληθεύστε ότι όλοι οι εσωτερικοί σύνδεσμοι τεκμηρίωσης λειτουργούν

---

### [v3.4.0] - 2025-10-24

#### Βελτιώσεις Προεπισκόπησης Υποδομής και Επικύρωσης
**Αυτή η έκδοση εισάγει ολοκληρωμένη υποστήριξη για τη νέα λειτουργία προεπισκόπησης Azure Developer CLI και βελτιώνει την εμπειρία χρήστη του εργαστηρίου.**

#### Προστέθηκε
- **🧪 azd provision --preview Feature Documentation**: Ολοκληρωμένη κάλυψη της νέας δυνατότητας προεπισκόπησης υποδομής
  - Αναφορά εντολών και παραδείγματα χρήσης στον οδηγό γρήγορης αναφοράς
  - Λεπτομερής ενσωμάτωση στον οδηγό προετοιμασίας με περιπτώσεις χρήσης και οφέλη
  - Ενσωμάτωση ελέγχων προ-εκτέλεσης για πιο ασφαλή επικύρωση ανάπτυξης
  - Ενημερώσεις οδηγού εκκίνησης με πρακτικές ανάπτυξης με προτεραιότητα στην ασφάλεια
- **🚧 Workshop Status Banner**: Επαγγελματικό HTML μπάνερ που υποδεικνύει την κατάσταση ανάπτυξης του εργαστηρίου
  - Σχεδίαση με διαβάθμιση και δείκτες κατασκευής για σαφή επικοινωνία με τον χρήστη
  - Σήμανση τελευταίας ενημέρωσης για διαφάνεια
  - Σχεδίαση προσαρμοστική για κινητά για όλους τους τύπους συσκευών

#### Ενισχυμένο
- **Ασφάλεια Υποδομής**: Η λειτουργία προεπισκόπησης ενσωματώθηκε σε όλη την τεκμηρίωση ανάπτυξης
- **Επικύρωση πριν από την ανάπτυξη**: Τα αυτοματοποιημένα σενάρια πλέον περιλαμβάνουν δοκιμές προεπισκόπησης υποδομής
- **Ροή Εργασίας Προγραμματιστή**: Ενημερωμένες ακολουθίες εντολών για να περιλαμβάνουν την προεπισκόπηση ως βέλτιστη πρακτική
- **Εμπειρία Εργαστηρίου**: Καθορισμένες σαφείς προσδοκίες για τους χρήστες σχετικά με την κατάσταση ανάπτυξης του περιεχομένου

#### Αλλαγές
- **Βέλτιστες Πρακτικές Ανάπτυξης**: Προτεινόμενη τώρα η ροή εργασίας με προτεραιότητα στην προεπισκόπηση
- **Ροή Τεκμηρίωσης**: Η επικύρωση υποδομής μετακινήθηκε νωρίτερα στη μαθησιακή διαδικασία
- **Παρουσίαση Εργαστηρίου**: Επαγγελματική επικοινωνία κατάστασης με σαφές χρονοδιάγραμμα ανάπτυξης

#### Βελτιώθηκε
- **Προσέγγιση Ασφάλειας Πρώτα**: Οι αλλαγές υποδομής μπορούν πλέον να επικυρωθούν πριν την ανάπτυξη
- **Συνεργασία Ομάδας**: Τα αποτελέσματα της προεπισκόπησης μπορούν να κοινοποιηθούν για αναθεώρηση και έγκριση
- **Ενημέρωση Κόστους**: Καλύτερη κατανόηση του κόστους πόρων πριν την προμήθεια
- **Μείωση Κινδύνων**: Μείωση αποτυχιών ανάπτυξης μέσω πρόωρης επικύρωσης

#### Τεχνική Υλοποίηση
- **Πολυ-ένταξη Εγγράφων**: Η λειτουργία προεπισκόπησης τεκμηριώθηκε σε 4 βασικά αρχεία
- **Πρότυπα Εντολών**: Συνεπής σύνταξη και παραδείγματα σε όλη την τεκμηρίωση
- **Ενσωμάτωση Βέλτιστων Πρακτικών**: Η προεπισκόπηση περιλήφθηκε σε ροές επικύρωσης και σενάρια
- **Οπτικοί Δείκτες**: Σαφείς σημάνσεις ΝΕΩΝ λειτουργιών για ευκολότερη ανεύρεση

#### Υποδομή Εργαστηρίου
- **Επικοινωνία Κατάστασης**: Επαγγελματικό HTML μπάνερ με στυλ διαβάθμισης
- **Εμπειρία Χρήστη**: Η σαφής κατάσταση ανάπτυξης αποτρέπει παρεξηγήσεις
- **Επαγγελματική Παρουσίαση**: Διατηρεί την αξιοπιστία του αποθετηρίου ενώ θέτει προσδοκίες
- **Διαφάνεια Χρονοδιαγράμματος**: Σφραγίδα τελευταίας ενημέρωσης Οκτώβριος 2025 για λογοδοσία

### [v3.3.0] - 2025-09-24

#### Βελτιωμένα Υλικά Εργαστηρίου και Διαδραστική Εμπειρία Μάθησης
**Αυτή η έκδοση εισάγει ολοκληρωμένα υλικά εργαστηρίου με διαδραστικούς οδηγούς στο πρόγραμμα περιήγησης και δομημένες διαδρομές μάθησης.**

#### Προστέθηκε
- **🎥 Διαδραστικός Οδηγός Εργαστηρίου**: Εμπειρία εργαστηρίου βασισμένη σε πρόγραμμα περιήγησης με δυνατότητα προεπισκόπησης MkDocs
- **📝 Δομημένες Οδηγίες Εργαστηρίου**: Διαδρομή μάθησης 7 βημάτων από την ανακάλυψη έως την προσαρμογή
  - 0-Introduction: Επισκόπηση εργαστηρίου και ρύθμιση
  - 1-Select-AI-Template: Ανακάλυψη προτύπου και διαδικασία επιλογής
  - 2-Validate-AI-Template: Διαδικασίες ανάπτυξης και επικύρωσης
  - 3-Deconstruct-AI-Template: Κατανόηση της αρχιτεκτονικής του προτύπου
  - 4-Configure-AI-Template: Διαμόρφωση και προσαρμογή
  - 5-Customize-AI-Template: Προχωρημένες τροποποιήσεις και επαναλήψεις
  - 6-Teardown-Infrastructure: Καθαρισμός και διαχείριση πόρων
  - 7-Wrap-up: Περίληψη και επόμενα βήματα
- **🛠️ Εργαλεία Εργαστηρίου**: Διαμόρφωση MkDocs με θέμα Material για βελτιωμένη εμπειρία μάθησης
- **🎯 Πρακτική Διαδρομή Μάθησης**: Μεθοδολογία 3 βημάτων (Ανακάλυψη → Ανάπτυξη → Προσαρμογή)
- **📱 Ενσωμάτωση GitHub Codespaces**: Ομαλή ρύθμιση περιβάλλοντος ανάπτυξης

#### Ενισχυμένο
- **Εργαστήριο AI**: Επεκτάθηκε με ολοκληρωμένη δομημένη εμπειρία μάθησης 2-3 ωρών
- **Τεκμηρίωση Εργαστηρίου**: Επαγγελματική παρουσίαση με πλοήγηση και οπτικά βοηθήματα
- **Πρόοδος Μάθησης**: Σαφής καθοδήγηση βήμα προς βήμα από την επιλογή προτύπου έως την ανάπτυξη σε παραγωγή
- **Εμπειρία Προγραμματιστή**: Ενσωματωμένα εργαλεία για απλοποιημένες ροές εργασίας ανάπτυξης

#### Βελτιώθηκε
- **Προσβασιμότητα**: Διεπαφή βασισμένη σε πρόγραμμα περιήγησης με αναζήτηση, λειτουργία αντιγραφής και επιλογή θέματος
- **Αυτορυθμιζόμενη Μάθηση**: Ευέλικτη δομή εργαστηρίου που προσαρμόζεται σε διαφορετικούς ρυθμούς μάθησης
- **Πρακτική Εφαρμογή**: Σενάρια ανάπτυξης προτύπων AI στον πραγματικό κόσμο
- **Ενσωμάτωση Κοινότητας**: Ενσωμάτωση Discord για υποστήριξη εργαστηρίου και συνεργασία

#### Χαρακτηριστικά Εργαστηρίου
- **Ενσωματωμένη Αναζήτηση**: Γρήγορη ανεύρεση λέξεων-κλειδιών και μαθημάτων
- **Αντιγραφή Μπλοκ Κώδικα**: Λειτουργία αιώρησης για αντιγραφή σε όλα τα παραδείγματα κώδικα
- **Επιλογή Θέματος**: Υποστήριξη σκοτεινής/ανοιχτής λειτουργίας για διαφορετικές προτιμήσεις
- **Οπτικά Περιουσιακά Στοιχεία**: Στιγμιότυπα οθόνης και διαγράμματα για καλύτερη κατανόηση
- **Ενσωμάτωση Βοήθειας**: Άμεση πρόσβαση στο Discord για υποστήριξη κοινότητας

### [v3.2.0] - 2025-09-17

#### Ριζική Αναδόμηση Πλοήγησης και Σύστημα Μάθησης Βασισμένο σε Κεφάλαια
**Αυτή η έκδοση εισάγει μια ολοκληρωμένη δομή μάθησης βασισμένη σε κεφάλαια με βελτιωμένη πλοήγηση σε όλο το αποθετήριο.**

#### Προστέθηκε
- **📚 Σύστημα Μάθησης με Βάση τα Κεφάλαια**: Αναδιαρθρώθηκε ολόκληρο το μάθημα σε 8 προοδευτικά κεφάλαια μάθησης
  - Chapter 1: Θεμέλια & Γρήγορη Εκκίνηση (⭐ - 30-45 λεπτά)
  - Chapter 2: Ανάπτυξη με Προτεραιότητα στο AI (⭐⭐ - 1-2 ώρες)
  - Chapter 3: Διαμόρφωση & Επαλήθευση Ταυτότητας (⭐⭐ - 45-60 λεπτά)
  - Chapter 4: Υποδομή ως Κώδικας & Ανάπτυξη (⭐⭐⭐ - 1-1.5 ώρες)
  - Chapter 5: Λύσεις Multi-Agent AI (⭐⭐⭐⭐ - 2-3 ώρες)
  - Chapter 6: Επικύρωση & Σχεδιασμός πριν την Ανάπτυξη (⭐⭐ - 1 ώρα)
  - Chapter 7: Αντιμετώπιση Προβλημάτων & Εντοπισμός Σφαλμάτων (⭐⭐ - 1-1.5 ώρες)
  - Chapter 8: Πρότυπα Παραγωγής & Επιχειρησιακά Πρότυπα (⭐⭐⭐⭐ - 2-3 ώρες)
- **📚 Ολοκληρωμένο Σύστημα Πλοήγησης**: Συνεπή κεφαλίδες και υποσέλιδα πλοήγησης σε όλη την τεκμηρίωση
- **🎯 Παρακολούθηση Προόδου**: Λίστα ελέγχου ολοκλήρωσης μαθήματος και σύστημα επαλήθευσης μάθησης
- **🗺️ Καθοδήγηση Διαδρομής Μάθησης**: Σαφή σημεία εισόδου για διαφορετικά επίπεδα εμπειρίας και στόχους
- **🔗 Πλοήγηση Διασταυρούμενων Αναφορών**: Σχετικά κεφάλαια και προαπαιτούμενα σαφώς συνδεδεμένα

#### Ενισχυμένο
- **Δομή README**: Μετασχηματίστηκε σε μια δομημένη πλατφόρμα μάθησης με οργάνωση βάσει κεφαλαίων
- **Πλοήγηση Τεκμηρίωσης**: Κάθε σελίδα πλέον περιλαμβάνει πλαίσιο κεφαλαίου και καθοδήγηση προόδου
- **Οργάνωση Προτύπων**: Τα παραδείγματα και τα πρότυπα αντιστοιχίστηκαν στα κατάλληλα κεφάλαια μάθησης
- **Ενσωμάτωση Πόρων**: Cheat sheets, FAQs και οδηγοί μελετών συνδεδεμένοι με σχετικά κεφάλαια
- **Ενσωμάτωση Εργαστηρίων**: Πρακτικά εργαστήρια χαρτογραφημένα σε πολλαπλούς μαθησιακούς στόχους κεφαλαίων

#### Αλλαγές
- **Πρόοδος Μάθησης**: Μετακινήθηκε από γραμμική τεκμηρίωση σε ευέλικτη οργάνωση βάσει κεφαλαίων
- **Τοποθέτηση Διαμόρφωσης**: Η οδηγία διαμόρφωσης μετατοπίστηκε στο Κεφάλαιο 3 για καλύτερη ροή μάθησης
- **Ενσωμάτωση Περιεχομένου AI**: Καλύτερη ενσωμάτωση περιεχομένου σχετικού με AI καθ' όλη τη μαθησιακή διαδρομή
- **Περιεχόμενο Παραγωγής**: Προχωρημένα πρότυπα συγκεντρώθηκαν στο Κεφάλαιο 8 για εκπαιδευόμενους επιχειρήσεων

#### Βελτιώθηκε
- **Εμπειρία Χρήστη**: Σαφή breadcrumbs πλοήγησης και δείκτες προόδου κεφαλαίων
- **Προσβασιμότητα**: Συνεπείς προτύποι πλοήγησης για ευκολότερη περιήγηση στο μάθημα
- **Επαγγελματική Παρουσίαση**: Δομή τύπου πανεπιστημίου κατάλληλη για ακαδημαϊκή και εταιρική εκπαίδευση
- **Αποτελεσματικότητα Μάθησης**: Μείωση χρόνου εύρεσης σχετικού υλικού μέσω βελτιωμένης οργάνωσης

#### Τεχνική Υλοποίηση
- **Κεφαλίδες Πλοήγησης**: Τυποποιημένη πλοήγηση κεφαλαίων σε 40+ αρχεία τεκμηρίωσης
- **Υποσέλιδο Πλοήγησης**: Συνεπής καθοδήγηση προόδου και δείκτες ολοκλήρωσης κεφαλαίων
- **Διασταυρούμενοι Σύνδεσμοι**: Ολοκληρωμένο σύστημα εσωτερικών συνδέσμων που συνδέει σχετικές έννοιες
- **Χαρτογράφηση Κεφαλαίων**: Τα πρότυπα και τα παραδείγματα συνδέονται σαφώς με τους μαθησιακούς στόχους

#### Βελτίωση Οδηγού Σπουδών
- **📚 Ολοκληρωμένοι Μαθησιακοί Στόχοι**: Οδηγός μελετών αναδιαρθρωμένος ώστε να ευθυγραμμίζεται με το σύστημα 8 κεφαλαίων
- **🎯 Αξιολόγηση ανά Κεφάλαιο**: Κάθε κεφάλαιο περιλαμβάνει συγκεκριμένους μαθησιακούς στόχους και πρακτικές ασκήσεις
- **📋 Παρακολούθηση Προόδου**: Εβδομαδιαίο πρόγραμμα μάθησης με μετρήσιμα αποτελέσματα και λίστες ελέγχου ολοκλήρωσης
- **❓ Ερωτήσεις Αξιολόγησης**: Ερωτήσεις επαλήθευσης γνώσεων για κάθε κεφάλαιο με επαγγελματικά αποτελέσματα
- **🛠️ Πρακτικές Ασκήσεις**: Χρήσιμες δραστηριότητες με σενάρια πραγματικής ανάπτυξης και αντιμετώπισης προβλημάτων
- **📊 Πρόοδος Δεξιοτήτων**: Σαφής προώθηση από βασικές έννοιες σε προχωρημένα πρότυπα με επικέντρωση στην ανάπτυξη καριέρας
- **🎓 Πλαίσιο Πιστοποίησης**: Επαγγελματικά αποτελέσματα ανάπτυξης και αναγνώριση από την κοινότητα
- **⏱️ Διαχείριση Χρονοδιαγράμματος**: Δομημένο 10-εβδομάδων πλάνο μάθησης με επικύρωση ορόσημων

### [v3.1.0] - 2025-09-17

#### Βελτιωμένες Λύσεις Multi-Agent AI
**Αυτή η έκδοση βελτιώνει τη λύση πολλαπλών πρακτόρων για το λιανικό εμπόριο με πιο σαφή ονομασία πρακτόρων και ενισχυμένη τεκμηρίωση.**

#### Αλλαγές
- **Ορολογία Multi-Agent**: Αντικαταστάθηκε το "Cora agent" με το "Customer agent" σε όλη τη λύση λιανικής πολλαπλών πρακτόρων για πιο σαφή κατανόηση
- **Αρχιτεκτονική Πρακτόρων**: Ενημερώθηκαν όλα τα έγγραφα, τα ARM templates και τα παραδείγματα κώδικα για να χρησιμοποιούν τη συνεπή ονομασία "Customer agent"
- **Παραδείγματα Διαμόρφωσης**: Μοντέρνα πρότυπα διαμόρφωσης πρακτόρων με ενημερωμένες συμβάσεις ονοματολογίας
- **Συνέπεια Τεκμηρίωσης**: Εξασφαλίστηκε ότι όλες οι αναφορές χρησιμοποιούν επαγγελματικά, περιγραφικά ονόματα πρακτόρων

#### Ενισχυμένο
- **Πακέτο ARM Template**: Updated retail-multiagent-arm-template with Customer agent references
- **Διαγράμματα Αρχιτεκτονικής**: Refreshed Mermaid diagrams with updated agent naming
- **Παραδείγματα Κώδικα**: Python classes and implementation examples now use CustomerAgent naming
- **Μεταβλητές Περιβάλλοντος**: Updated all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Βελτιώσεις
- **Εμπειρία Προγραμματιστή**: Clearer agent roles and responsibilities in documentation
- **Ετοιμότητα για Παραγωγή**: Better alignment with enterprise naming conventions
- **Υλικά Μάθησης**: More intuitive agent naming for educational purposes
- **Χρηστικότητα Προτύπου**: Simplified understanding of agent functions and deployment patterns

#### Τεχνικές Λεπτομέρειες
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Σημαντικές Αλλαγές - Εστίαση στους Προγραμματιστές AI και Ενσωμάτωση με Microsoft Foundry
**Αυτή η έκδοση μεταμορφώνει το αποθετήριο σε έναν ολοκληρωμένο πόρο μάθησης εστιασμένο στο AI με ενσωμάτωση Microsoft Foundry.**

#### Προστέθηκαν
- **🤖 Διαδρομή Μάθησης με Προτεραιότητα στο AI**: Complete restructure prioritizing AI developers and engineers
- **Οδηγός Ενσωμάτωσης Microsoft Foundry**: Comprehensive documentation for connecting AZD with Microsoft Foundry services
- **Πρότυπα Ανάπτυξης Μοντέλων AI**: Detailed guide covering model selection, configuration, and production deployment strategies
- **Εργαστήριο AI**: 2-3 hour hands-on workshop for converting AI applications to AZD-deployable solutions
- **Καλές Πρακτικές AI για Παραγωγή**: Enterprise-ready patterns for scaling, monitoring, and securing AI workloads
- **Οδηγός Επίλυσης Προβλημάτων Ειδικά για AI**: Comprehensive troubleshooting for Microsoft Foundry Models, Cognitive Services, and AI deployment issues
- **Συλλογή Προτύπων AI**: Featured collection of Microsoft Foundry templates with complexity ratings
- **Υλικά Εργαστηρίου**: Complete workshop structure with hands-on labs and reference materials

#### Βελτιώσεις
- **Δομή README**: AI-developer focused with 45% community interest data from Microsoft Foundry Discord
- **Διαδρομές Μάθησης**: Dedicated AI developer journey alongside traditional paths for students and DevOps engineers
- **Συστάσεις Προτύπων**: Featured AI templates including azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Ενσωμάτωση Κοινότητας**: Enhanced Discord community support with AI-specific channels and discussions

#### Εστίαση στην Ασφάλεια & Παραγωγή
- **Πρότυπα Διαχειριζόμενης Ταυτότητας**: AI-specific authentication and security configurations
- **Βελτιστοποίηση Κόστους**: Token usage tracking and budget controls for AI workloads
- **Ανάπτυξη σε Πολλές Περιοχές**: Strategies for global AI application deployment
- **Παρακολούθηση Απόδοσης**: AI-specific metrics and Application Insights integration

#### Ποιότητα Τεκμηρίωσης
- **Γραμμική Δομή Μαθήματος**: Logical progression from beginner to advanced AI deployment patterns
- **Ελεγμένα URLs**: All external repository links verified and accessible
- **Πλήρης Αναφορά**: All internal documentation links validated and functional
- **Έτοιμο για Παραγωγή**: Enterprise deployment patterns with real-world examples

### [v2.0.0] - 2025-09-09

#### Σημαντικές Αλλαγές - Αναδιάρθρωση Αποθετηρίου και Επαγγελματική Βελτίωση
**Αυτή η έκδοση αντιπροσωπεύει μια σημαντική αναθεώρηση της δομής του αποθετηρίου και της παρουσίασης του περιεχομένου.**

#### Προστέθηκαν
- **Δομημένο Πλαίσιο Μάθησης**: All documentation pages now include Introduction, Learning Goals, and Learning Outcomes sections
- **Σύστημα Πλοήγησης**: Added Previous/Next lesson links throughout all documentation for guided learning progression
- **Οδηγός Σπουδών**: Comprehensive study-guide.md with learning objectives, practice exercises, and assessment materials
- **Επαγγελματική Παρουσίαση**: Removed all emoji icons for improved accessibility and professional appearance
- **Ενισχυμένη Δομή Περιεχομένου**: Improved organization and flow of learning materials

#### Αλλαγές
- **Μορφή Τεκμηρίωσης**: Standardized all documentation with consistent learning-focused structure
- **Ροή Πλοήγησης**: Implemented logical progression through all learning materials
- **Παρουσίαση Περιεχομένου**: Removed decorative elements in favor of clear, professional formatting
- **Δομή Συνδέσμων**: Updated all internal links to support new navigation system

#### Βελτιώσεις
- **Προσβασιμότητα**: Removed emoji dependencies for better screen reader compatibility
- **Επαγγελματική Εμφάνιση**: Clean, academic-style presentation suitable for enterprise learning
- **Εμπειρία Μάθησης**: Structured approach with clear objectives and outcomes for each lesson
- **Οργάνωση Περιεχομένου**: Better logical flow and connection between related topics

### [v1.0.0] - 2025-09-09

#### Αρχική Κυκλοφορία - Ολοκληρωμένο Αποθετήριο Εκμάθησης AZD

#### Προστέθηκαν
- **Βασική Δομή Τεκμηρίωσης**
  - Πλήρης σειρά οδηγιών εκκίνησης
  - Περιεκτική τεκμηρίωση ανάπτυξης και παροχής πόρων
  - Λεπτομερείς πόροι επίλυσης προβλημάτων και οδηγοί αποσφαλμάτωσης
  - Εργαλεία και διαδικασίες επαλήθευσης πριν την ανάπτυξη

- **Μονάδα Εισαγωγής**
  - Βασικά του AZD: Core concepts and terminology
  - Οδηγός Εγκατάστασης: Platform-specific setup instructions
  - Οδηγός Διαμόρφωσης: Environment setup and authentication
  - Εισαγωγικό Tutorial Προγράμματος: Step-by-step hands-on learning

- **Μονάδα Ανάπτυξης και Παροχής Πόρων**
  - Οδηγός Ανάπτυξης: Complete workflow documentation
  - Οδηγός Παροχής Πόρων: Infrastructure as Code with Bicep
  - Καλές πρακτικές για αναπτύξεις σε παραγωγή
  - Πρότυπα αρχιτεκτονικής πολλαπλών υπηρεσιών

- **Μονάδα Προ-επαλήθευσης Ανάπτυξης**
  - Σχεδιασμός Χωρητικότητας: Azure resource availability validation
  - Επιλογή SKU: Comprehensive service tier guidance
  - Έλεγχοι Προ-πτήσης: Automated validation scripts (PowerShell and Bash)
  - Εργαλεία εκτίμησης κόστους και προγραμματισμού προϋπολογισμού

- **Μονάδα Επίλυσης Προβλημάτων**
  - Συνηθισμένα Θέματα: Frequently encountered problems and solutions
  - Οδηγός Αποσφαλμάτωσης: Systematic troubleshooting methodologies
  - Προχωρημένες τεχνικές και εργαλεία διάγνωσης
  - Παρακολούθηση απόδοσης και βελτιστοποίηση

- **Πόροι και Αναφορές**
  - Συνοπτική Λίστα Εντολών: Quick reference for essential commands
  - Γλωσσάριο: Comprehensive terminology and acronym definitions
  - Συχνές Ερωτήσεις (FAQ): Detailed answers to common questions
  - Σύνδεσμοι εξωτερικών πόρων και συνδέσεις με την κοινότητα

- **Παραδείγματα και Πρότυπα**
  - Παράδειγμα Απλής Web Εφαρμογής
  - Πρότυπο ανάπτυξης Στατικής Ιστοσελίδας
  - Διαμόρφωση Εφαρμογής με Container
  - Πρότυπα ενσωμάτωσης βάσης δεδομένων
  - Παραδείγματα αρχιτεκτονικής μικρο-υπηρεσιών
  - Υλοποιήσεις serverless function

#### Χαρακτηριστικά
- **Υποστήριξη Πολλών Πλατφορμών**: Installation and configuration guides for Windows, macOS, and Linux
- **Διάφορα Επίπεδα Δεξιοτήτων**: Content designed for students through professional developers
- **Πρακτική Εστίαση**: Hands-on examples and real-world scenarios
- **Περιεκτική Κάλυψη**: From basic concepts to advanced enterprise patterns
- **Προσέγγιση με Προτεραιότητα στην Ασφάλεια**: Security best practices integrated throughout
- **Βελτιστοποίηση Κόστους**: Guidance for cost-effective deployments and resource management

#### Ποιότητα Τεκμηρίωσης
- **Λεπτομερή Παραδείγματα Κώδικα**: Practical, tested code samples
- **Οδηγίες Βήμα-Βήμα**: Clear, actionable guidance
- **Περιεκτικός Χειρισμός Σφαλμάτων**: Troubleshooting for common issues
- **Ενσωμάτωση Βέλτιστων Πρακτικών**: Industry standards and recommendations
- **Συμβατότητα Εκδόσεων**: Up-to-date with latest Azure services and azd features

## Σχεδιαζόμενες Μελλοντικές Βελτιώσεις

### Έκδοση 3.1.0 (Σχεδιάζεται)
#### Επέκταση Πλατφόρμας AI
- **Υποστήριξη Πολλών Μοντέλων**: Integration patterns for Hugging Face, Azure Machine Learning, and custom models
- **Πλαίσια Πρακτόρων AI**: Templates for LangChain, Semantic Kernel, and AutoGen deployments
- **Προηγμένα Πρότυπα RAG**: Vector database options beyond Azure AI Search (Pinecone, Weaviate, etc.)
- **Παρατηρησιμότητα AI**: Enhanced monitoring for model performance, token usage, and response quality

#### Εμπειρία Προγραμματιστή
- **Επέκταση VS Code**: Integrated AZD + Microsoft Foundry development experience
- **Ενσωμάτωση GitHub Copilot**: AI-assisted AZD template generation
- **Διαδραστικά Tutorials**: Hands-on coding exercises with automated validation for AI scenarios
- **Βίντεο Περιεχόμενο**: Supplementary video tutorials for visual learners focusing on AI deployments

### Έκδοση 4.0.0 (Σχεδιάζεται)
#### Πρότυπα Επιχειρησιακού AI
- **Πλαίσιο Διακυβέρνησης**: AI model governance, compliance, and audit trails
- **Πολυ-ενοικιαστικό AI**: Patterns for serving multiple customers with isolated AI services
- **Ανάπτυξη Edge AI**: Integration with Azure IoT Edge and container instances
- **Υβριδικό Cloud AI**: Multi-cloud and hybrid deployment patterns for AI workloads

#### Προηγμένα Χαρακτηριστικά
- **Αυτοματοποίηση Αγωγών AI**: MLOps integration with Azure Machine Learning pipelines
- **Προηγμένη Ασφάλεια**: Zero-trust patterns, private endpoints, and advanced threat protection
- **Βελτιστοποίηση Απόδοσης**: Advanced tuning and scaling strategies for high-throughput AI applications
- **Παγκόσμια Διανομή**: Content delivery and edge caching patterns for AI applications

### Έκδοση 3.0.0 (Σχεδιάζεται) - Αντικαταστάθηκε από την Τρέχουσα Έκδοση
#### Προτεινόμενες Προσθήκες - Τώρα Υλοποιημένες στην v3.0.0
- ✅ **Περιεχόμενο Εστιασμένο στο AI**: Comprehensive Microsoft Foundry integration (Completed)
- ✅ **Διαδραστικά Tutorials**: Hands-on AI workshop lab (Completed)
- ✅ **Προηγμένη Ενότητα Ασφάλειας**: AI-specific security patterns (Completed)
- ✅ **Βελτιστοποίηση Απόδοσης**: AI workload tuning strategies (Completed)

### Έκδοση 2.1.0 (Σχεδιάζεται) - Μερικώς Υλοποιημένο στην v3.0.0
#### Μικρές Βελτιώσεις - Κάποιες Ολοκληρώθηκαν στην Τρέχουσα Έκδοση
- ✅ **Επιπλέον Παραδείγματα**: AI-focused deployment scenarios (Completed)
- ✅ **Επεκταμένο FAQ**: AI-specific questions and troubleshooting (Completed)
- **Ενσωμάτωση Εργαλείων**: Enhanced IDE and editor integration guides
- ✅ **Επέκταση Παρακολούθησης**: AI-specific monitoring and alerting patterns (Completed)

#### Ακόμα Σχεδιαζόμενο για μελλοντική έκδοση
- **Τεκμηρίωση Φιλική προς Κινητά**: Responsive design for mobile learning
- **Πρόσβαση Εκτός Σύνδεσης**: Downloadable documentation packages
- **Ενισχυμένη Ενσωμάτωση IDE**: VS Code extension for AZD + AI workflows
- **Πίνακας Ελέγχου Κοινότητας**: Real-time community metrics and contribution tracking

## Συμμετοχή στο Changelog

### Αναφορά Αλλαγών
Κατά τη συνεισφορά σε αυτό το αποθετήριο, βεβαιωθείτε ότι οι εγγραφές στο changelog περιλαμβάνουν:

1. **Αριθμός Έκδοσης**: Following semantic versioning (major.minor.patch)
2. **Ημερομηνία**: Release or update date in YYYY-MM-DD format
3. **Κατηγορία**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Σαφής Περιγραφή**: Concise description of what changed
5. **Αξιολόγηση Επιπτώσεων**: How changes affect existing users

### Κατηγορίες Αλλαγών

#### Προστέθηκε
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Αλλαγές
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Αποσυρμένο
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Αφαιρέθηκε
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Διορθώθηκε
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Ασφάλεια
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Οδηγίες Σεμαντικής Έκδοσης

#### Μεγάλη Έκδοση (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Δευτερεύουσα Έκδοση (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Έκδοση (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Ανατροφοδότηση και Προτάσεις της Κοινότητας

Ενθαρρύνουμε ενεργά την ανατροφοδότηση της κοινότητας για τη βελτίωση αυτού του πόρου μάθησης:

### Πώς να Παρέχετε Ανατροφοδότηση
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Συζητήσεις Discord**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Φόρουμ Κοινότητας**: Participate in broader Azure developer discussions

### Κατηγορίες Ανατροφοδότησης
- **Ακρίβεια Περιεχομένου AI**: Corrections to AI service integration and deployment information
- **Εμπειρία Μάθησης**: Suggestions for improved AI developer learning flow
- **Ελλείπον Περιεχόμενο AI**: Requests for additional AI templates, patterns, or examples
- **Προσβασιμότητα**: Improvements for diverse learning needs
- **Ενσωμάτωση Εργαλείων AI**: Suggestions for better AI development workflow integration
- **Πρότυπα Παραγωγής AI**: Enterprise AI deployment pattern requests

### Δέσμευση Απαντήσεων
- **Ανταπόκριση σε Θέματα**: Within 48 hours for reported problems
- **Αιτήματα Χαρακτηριστικών**: Evaluation within one week
- **Συνεισφορές Κοινότητας**: Review within one week
- **Θέματα Ασφαλείας**: Immediate priority with expedited response

## Πρόγραμμα Συντήρησης

### Τακτικές Ενημερώσεις
- **Μηνιαίοι Έλεγχοι**: Content accuracy and link validation
- **Τριμηνιαίες Ενημερώσεις**: Major content additions and improvements
- **Εξαμηνιαίοι Έλεγχοι**: Comprehensive restructuring and enhancement
- **Ετήσιες Κυκλοφορίες**: Major version updates with significant improvements

### Παρακολούθηση και Διασφάλιση Ποιότητας
- **Αυτοματοποιημένος Έλεγχος**: Regular validation of code examples and links
- **Ενσωμάτωση Ανατροφοδότησης Κοινότητας**: Regular incorporation of user suggestions
- **Ενημερώσεις Τεχνολογίας**: Alignment with latest Azure services and azd releases
- **Έλεγχοι Προσβασιμότητας**: Regular review for inclusive design principles

## Πολιτική Υποστήριξης Εκδόσεων

### Υποστήριξη Τρέχουσας Έκδοσης
- **Latest Major Version**: Πλήρης υποστήριξη με τακτικές ενημερώσεις
- **Previous Major Version**: Ενημερώσεις ασφαλείας και κρίσιμες διορθώσεις για 12 μήνες
- **Legacy Versions**: Μόνο υποστήριξη από την κοινότητα, χωρίς επίσημες ενημερώσεις

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: Οδηγίες μετάβασης βήμα-βήμα
- **Compatibility Notes**: Λεπτομέρειες σχετικά με αλλαγές που σπάνε τη συμβατότητα
- **Tool Support**: Σενάρια ή βοηθητικά προγράμματα για βοήθεια στη μετάβαση
- **Community Support**: Αφιερωμένα φόρουμ για ερωτήσεις σχετικά με τη μετάβαση

---

**Navigation**
- **Previous Lesson**: [Οδηγός Μελέτης](resources/study-guide.md)
- **Next Lesson**: Return to [Κύριο README](README.md)

**Stay Updated**: Μείνετε ενημερωμένοι: Παρακολουθήστε αυτό το αποθετήριο για ειδοποιήσεις σχετικά με νέες κυκλοφορίες και σημαντικές ενημερώσεις στο εκπαιδευτικό υλικό.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που επιδιώκουμε την ακρίβεια, να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->