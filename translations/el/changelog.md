# Changelog - AZD For Beginners

## Introduction

Αυτό το changelog καταγράφει όλες τις αξιοσημείωτες αλλαγές, ενημερώσεις και βελτιώσεις στο αποθετήριο AZD For Beginners. Ακολουθούμε τις αρχές σημασιολογικής έκδοσης και διατηρούμε αυτό το αρχείο για να βοηθάμε τους χρήστες να κατανοήσουν τι έχει αλλάξει μεταξύ εκδόσεων.

## Learning Goals

Με την ανασκόπηση αυτού του changelog, θα:
- Μείνετε ενημερωμένοι για νέες δυνατότητες και προσθήκες περιεχομένου
- Κατανοήσετε τις βελτιώσεις που έγιναν στην υπάρχουσα τεκμηρίωση
- Παρακολουθήσετε διορθώσεις σφαλμάτων και διορθώσεις για να εξασφαλιστεί η ακρίβεια
- Ακολουθήσετε την εξέλιξη των εκπαιδευτικών υλικών με την πάροδο του χρόνου

## Learning Outcomes

Μετά την ανασκόπηση των καταχωρήσεων του changelog, θα μπορείτε να:
- Εντοπίζετε νέο περιεχόμενο και πόρους διαθέσιμους για μάθηση
- Κατανοείτε ποιες ενότητες έχουν ενημερωθεί ή βελτιωθεί
- Σχεδιάζετε τη διαδρομή μάθησής σας βάσει των πιο πρόσφατων υλικών
- Συμβάλλετε με σχόλια και προτάσεις για μελλοντικές βελτιώσεις

## Version History

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Αυτή η έκδοση κλείνει τα υπόλοιπα ενδιάμεσα κενά που αναδείχθηκαν από την ανάλυση azd-coverage: πώς να δημιουργήσετε και να δημοσιεύσετε το δικό σας template, αναπαραγώγιμα περιβάλλοντα dev-container/Codespaces, ο provider υποδομής Pulumi, ένας οδηγός Azure DevOps CI/CD, έλεγχο ταυτότητας με service-principal, καθοδήγηση επιλογής host (AKS/Spring Apps), εξηγήσεις για `azd restore`/`azd package`, διαχείριση σφαλμάτων hooks και πρακτικές ομάδας/κοινόχρηστων περιβαλλόντων.**

#### Added
- **🧱 New Chapter 4 lesson** `docs/chapter-04-infrastructure/custom-templates.md` — δημιουργία του δικού σας azd template: απαιτούμενη δομή (`azure.yaml`, `infra/`, `src/`), το πεδίο `metadata.template`, παραμετροποίηση της υποδομής με το resource token `uniqueString()` και το tag `azd-env-name`, το τοπικό δοκιμαστικό με `azd init --template <local-path>`, δημοσίευση στο GitHub, και υποβολή στην Awesome AZD gallery
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/dev-containers.md` — αναπαραγώγιμα περιβάλλοντα azd με Dev Containers και GitHub Codespaces: ένα ελάχιστο `.devcontainer/devcontainer.json` που χρησιμοποιεί το επίσημο feature `ghcr.io/azure/azure-dev/azd`, features ανά γλώσσα, `docker-in-docker` για hosts κοντέινερ, και `azd auth login --use-device-code` για απομακρυσμένη σύνδεση
- **🧩 Pulumi with azd** section in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, διάταξη φακέλων Pulumi, stacks αντιστοιχισμένα σε περιβάλλοντα azd, απαιτούμενα outputs/tagging, και η ίδια ροή εργασίας `azd up` / `azd down`
- **🎯 Host-selection guidance** in `docs/chapter-04-infrastructure/provisioning.md` — μια φιλική προς αρχάριους σύγκριση των `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` και `springapp`, με καθοδήγηση για το πότε να επιλέξετε AKS ή Azure Spring Apps
- **🛠️ Azure DevOps CI/CD walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service connection με workload identity federation (OIDC), το παραγόμενο `azure-dev.yml`, και ρύθμιση variable-group
- **🔑 Service Principals (Pattern 4)** added to `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, μη αλληλεπιδραστικό `azd auth login` με client secret έναντι federated/OIDC credentials, πότε να χρησιμοποιούνται, και ασφαλής αποθήκευση διαπιστευτηρίων
- **🪝 Hook error-handling** subsection in `docs/chapter-04-infrastructure/deployment-guide.md` — κωδικοί εξόδου και `set -e`, `continueOnError`, δοκιμή hooks μεμονωμένα με `azd hooks run`, shells ειδικά για OS, και `--debug`
- **👥 Team / shared environments** section in `docs/chapter-03-configuration/configuration.md` — τι αποθηκεύεται στο `.azure/`, τι να αγνοείται από git, περιβάλλοντα ανά προγραμματιστή, `azd env list`/`select`, και παροχή τιμών περιβάλλοντος σε CI/CD
- **🧰 `azd restore` and expanded `azd package`** explanations in `resources/cheat-sheet.md` — επαναφορά εξαρτήσεων και δημιουργία ενός artifact έτοιμου για ανάπτυξη χωρίς την ανάπτυξη

#### Changed
- **🧭 Chapter 4 lessons table** updated to include the new "Authoring Your Own Template" lesson (Lesson 3)
- **🧭 Chapter 1 lessons table** updated to include the new "Dev Containers & Codespaces" lesson (Lesson 5); navigation footers wired between `bring-your-own-app.md` and `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Αυτή η έκδοση κλείνει τα μεγαλύτερα κενά για έναν πλήρη οδηγό για αρχάριους προσθέτοντας δύο νέα πρακτικά μαθήματα (ένας deployable multi-agent walkthrough και η προσθήκη azd σε ένα υπάρχον app), μια εισαγωγή στα hooks φιλική προς αρχάριους, μια ενότητα Terraform με azd, έναν βήμα-προς-βήμα οδηγό GitHub Actions pipeline, μια εξήγηση για τις νέες preview επεκτάσεις, και μια ρητή λίστα ελέγχου επαλήθευσης ανάπτυξης.**

#### Added
- **🤝 New Chapter 5 lesson** `docs/chapter-05-multi-agent/multi-agent-basics.md` — ένα πλήρως πρακτικό, deployable walkthrough με δύο agents (orchestrator + specialists) χρησιμοποιώντας ένα πραγματικό template (`contoso-creative-writer`), που καλύπτει πότε να χρησιμοποιήσετε multi-agent, τη ροή εργασίας `azd up`, κατανόηση των αναπτυγμένων πόρων, cross-agent tracing, προσαρμογή, και καθαρισμό
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/bring-your-own-app.md` — πώς να προσθέσετε azd σε ένα υπάρχον έργο με `azd init` ("use code in the current directory"), κατανόηση του `azure.yaml` και του `infra/`, `azd infra generate`, ανίχνευση host, και ανάπτυξη με `azd up`
- **🌐 Terraform with azd** section added to `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` config, διάταξη φακέλου `.tf`, απαιτούμενα `AZURE_*` outputs και tagging `azd-env-name`, και η ίδια ροή εργασίας `azd up` / `azd down` (κλείνει το κενό όπου η υποστήριξη Terraform αναφερόταν αλλά έδειχνε μόνο Bicep)
- **⚙️ Step-by-step GitHub Actions walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — από το repo στο GitHub έως αυτοματοποιημένες αναπτύξεις: `azd pipeline config`, OIDC federated credentials (χωρίς αποθηκευμένα μυστικά), το παραγόμενο `azure-dev.yml`, και καθοδήγηση σχετικά με secrets vs variables
- **🪝 Beginner "New to hooks?" introduction** in `docs/chapter-04-infrastructure/deployment-guide.md` — τι είναι ένα hook, πίνακας σταδίων hooks, ένα ελάχιστο πρώτο hook, και εκτέλεση hooks χειροκίνητα με `azd hooks run`
- **✅ "Verify Your Deployment" checklist** added to Step 5 of `docs/chapter-01-foundation/first-project.md` — smoke test, έλεγχος endpoint υγείας, και ρητά κριτήρια επιτυχίας
- **🧩 Explainer for new preview extensions** `azure.ai.skills` and `azure.ai.connections` (τι είναι και πότε να τις χρησιμοποιήσετε) in `docs/chapter-08-production/production-ai-practices.md`

#### Changed
- **🧭 Chapter 5 lessons table** corrected: `multi-agent-basics.md` is now Lesson 1 (the only fully hands-on lesson), with honest labeling that Lesson 2 lives in Chapter 6 and the Retail scenario is an architecture blueprint, not a one-command template
- **🧭 Chapter 1 lessons table** now includes the new "Bring Your Own App" lesson (Lesson 4)
- **🔗 Navigation footers** updated: `first-project.md` now links forward to `bring-your-own-app.md`

#### Fixed
- **🧱 Closed the "claimed but missing" Terraform gap** — το μάθημα προηγουμένως αναφερόταν σε υποστήριξη Terraform χωρίς να την παρουσιάζει
- **🔀 Corrected misleading Chapter 5 cross-links** που υπέθεταν ότι υπήρχε πλήρης multi-agent υλοποίηση ενώ ήταν μόνο ένα αρχιτεκτονικό blueprint

#### Files Updated
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Αυτή η έκδοση επαληθεύει ξανά το μάθημα έναντι του `azd` `1.25.6` (Ιούνιος 2026) και της επέκτασης `azure.ai.agents` `0.1.40-preview`, επεκτείνει την καθοδήγηση AI από το "σκαρίφημα ενός agent" σε ολόκληρο τον κύκλο ζωής του agent (test → evaluate → optimize → inspect → delete), αναδεικνύει τις νέες preview επεκτάσεις `azure.ai.skills` και `azure.ai.connections`, και σημειώνει την αλλαγή επωνυμίας προϊόντος ".NET Aspire" → "Aspire".**

#### Added
- **🔁 Full agent lifecycle coverage** για αρχάριους και AI μηχανικούς σε όλη την τεκμηρίωση:
  - `docs/chapter-01-foundation/azd-basics.md` — Πίνακας κύκλου ζωής (scaffold → test → measure → improve → inspect → clean up) προστέθηκε στην ενότητα Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — Νέα ενότητα "Managing the Agent Lifecycle" που καλύπτει `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, και `delete --force`
  - `resources/cheat-sheet.md` — Επεκταμένες εντολές AI Agent με `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, και `delete --force`
- **🧩 New preview extensions** τεκμηριωμένες: `azure.ai.skills` (επανχρησιμοποιήσιμες δεξιότητες agent) και `azure.ai.connections` (Foundry connections) προστέθηκαν στον πίνακα επεκτάσεων και στο cheat sheet
- **⏱️ Response-timing guidance** — τα παραδείγματα `azd ai agent invoke` τώρα σημειώνουν ότι εκτυπώνει συνολική καθυστέρηση και time-to-first-byte
- **📌 Version banner** στο root README που κατευθύνει τους εκπαιδευόμενους στο `azd version` και `azd upgrade`

#### Changed
- **✅ Validation baseline updated** από `azd 1.23.12` (Μάρτιος 2026) σε `azd 1.25.6` (Ιούνιος 2026) σε όλα τα README κεφαλαίων και τα workshop docs
- **🤖 Chapter 2 extension note** ενημερώθηκε από `azure.ai.agents` `0.1.18-preview` σε `0.1.40-preview`
- **🧪 Workshop validation example** (`azd version` output) ενημερώθηκε σε `1.25.6`
- **🧭 README "What's New in azd Today"** ανανεώθηκε για να τονίζει τον end-to-end κύκλο ζωής agent, τις νέες AI επεκτάσεις, και πρόσφατες βελτιώσεις ποιότητας ζωής (`azd init` idempotency, `azd auth login` καθαρισμός stale-token, `azd tool` first-run prompt)
- **📖 Chapter 2 agents.md (Option 4)** τώρα παραπέμπει τους εκπαιδευόμενους στις εντολές κύκλου ζωής μετά την ανάπτυξη αντί να σταματά στο `azd up`

#### Fixed
- **🏷️ Product naming** — προστέθηκε σημείωση για την αλλαγή επωνυμίας Aspire (".NET Aspire" είναι πλέον απλά "Aspire"); η υποστήριξη Aspire στο azd παραμένει αμετάβλητη
- **🔎 Live release validation** επιβεβαιώθηκε έναντι του Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) και `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Files Updated
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
#### Διευκρίνιση Εισαγωγής για Αρχάριους, Επαλήθευση Ρύθμισης & Τελικό Καθάρισμα Εντολών AZD
**Αυτή η έκδοση ακολουθεί την επιθεώρηση επαλήθευσης AZD 1.23 με μια προσθήκη τεκμηρίωσης επικεντρωμένη σε αρχάριους: διευκρινίζει την καθοδήγηση για πρώτη αυθεντικοποίηση με AZD, προσθέτει τοπικά σενάρια επαλήθευσης ρύθμισης, επαληθεύει βασικές εντολές έναντι του ζωντανού CLI του AZD, και αφαιρεί τις τελευταίες απαρχαιωμένες αναφορές εντολών στην αγγλική πηγή εκτός του changelog.**

#### Προστέθηκε
- **🧪 Σενάρια επαλήθευσης ρύθμισης για αρχάριους** με `validate-setup.ps1` και `validate-setup.sh` ώστε οι μαθητές να μπορούν να επιβεβαιώσουν τα απαιτούμενα εργαλεία πριν ξεκινήσουν το Κεφάλαιο 1
- **✅ Βήματα προκαταρκτικής επαλήθευσης ρύθμισης** στο root README και στο README του Κεφαλαίου 1 ώστε τυχόν ελλείποντες προαπαιτούμενοι να εντοπίζονται πριν από το `azd up`

#### Αλλαγές
- **🔐 Καθοδήγηση αυθεντικοποίησης για αρχάριους** πλέον αντιμετωπίζει σταθερά το `azd auth login` ως την κύρια διαδρομή για ροές εργασίας AZD, με το `az login` να επισημαίνεται ως προαιρετικό εκτός αν χρησιμοποιούνται άμεσα εντολές του Azure CLI
- **📚 Ροή εισαγωγής Κεφαλαίου 1** τώρα κατευθύνει τους μαθητές να επαληθεύσουν την τοπική ρύθμιση πριν από την εγκατάσταση, την αυθεντικοποίηση και τα πρώτα βήματα ανάπτυξης
- **🛠️ Μηνύματα επαληθευτή** τώρα διαχωρίζουν σαφώς τις απαιτήσεις που μπλοκάρουν από τις προαιρετικές προειδοποιήσεις του Azure CLI για την πορεία μόνο με AZD για αρχάριους
- **📖 Έγγραφα ρύθμισης, αντιμετώπισης προβλημάτων και παραδειγμάτων** τώρα διακρίνουν μεταξύ απαιτούμενης αυθεντικοποίησης AZD και προαιρετικής σύνδεσης Azure CLI όπου και τα δύο παρουσιάζονταν προηγουμένως χωρίς πλαίσιο

#### Διορθώθηκε
- **📋 Εναπομείνασες αναφορές εντολών στην αγγλική πηγή** ενημερώθηκαν στις τρέχουσες μορφές AZD, συμπεριλαμβανομένου του `azd config show` στο cheat sheet και του `azd monitor --overview` όπου προοριζόταν καθοδήγηση επισκόπησης στο Azure Portal
- **🧭 Ισχυρισμοί για αρχάριους στο Κεφάλαιο 1** απαλύνθηκαν ώστε να αποφεύγεται η υπερβολική υπόσχεση για εγγυημένη απουσία σφαλμάτων ή συμπεριφορά επαναφοράς σε όλα τα πρότυπα και τους πόρους Azure
- **🔎 Ζωντανή επαλήθευση CLI** επιβεβαίωσε τρέχουσα υποστήριξη για `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, και `azd down --force --purge`

#### Αρχεία που ενημερώθηκαν
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

#### Επαλήθευση AZD 1.23.12, Επέκταση Περιβάλλοντος Εργαστηρίου & Ανανέωση Μοντέλων AI
**Αυτή η έκδοση εκτελεί μια επιθεώρηση επαλήθευσης τεκμηρίωσης έναντι του `azd` `1.23.12`, ενημερώνει παρωχημένα παραδείγματα εντολών AZD, ανανεώνει την καθοδήγηση για μοντέλα AI στα τρέχοντα προεπιλεγμένα και διευρύνει τις οδηγίες εργαστηρίου πέρα από το GitHub Codespaces ώστε να υποστηρίζονται και τα dev containers και οι τοπικές κλωνοποιήσεις.**

#### Προστέθηκε
- **✅ Σημειώσεις επαλήθευσης σε βασικά κεφάλαια και έγγραφα εργαστηρίου** ώστε η δοκιμασμένη βάση AZD να είναι σαφής για μαθητές που χρησιμοποιούν νεότερα ή παλαιότερα builds του CLI
- **⏱️ Καθοδήγηση χρονικού ορίου ανάπτυξης** για μακροχρόνιες αναπτύξεις εφαρμογών AI χρησιμοποιώντας `azd deploy --timeout 1800`
- **🔎 Βήματα επιθεώρησης επεκτάσεων** με `azd extension show azure.ai.agents` στα έγγραφα ροής εργασίας AI
- **🌐 Ευρύτερη καθοδήγηση περιβάλλοντος εργαστηρίου** που καλύπτει GitHub Codespaces, dev containers και τοπικές κλωνοποιήσεις με MkDocs

#### Αλλαγές
- **📚 README εισαγωγής κεφαλαίων** τώρα σημειώνουν με συνέπεια την επαλήθευση έναντι του `azd 1.23.12` σε ενότητες θεμελίωσης, ρύθμισης, υποδομής, πολλαπλών πρακτόρων, προ-ανάπτυξης, αντιμετώπισης προβλημάτων και παραγωγής
- **🛠️ Αναφορές εντολών AZD** ενημερώθηκαν στις τρέχουσες μορφές στα έγγραφα:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ή `azd env get-value(s)` ανάλογα με το πλαίσιο
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` όπου προορίζεται επισκόπηση του Application Insights
- **🧪 Παραδείγματα προεπισκόπησης παροχής** απλοποιήθηκαν στην τρέχουσα υποστηριζόμενη χρήση όπως `azd provision --preview` και `azd provision --preview -e production`
- **🧭 Ροή εργαστηρίου** ενημερώθηκε ώστε οι μαθητές να μπορούν να ολοκληρώσουν τα εργαστήρια σε Codespaces, σε dev container ή σε τοπική κλωνοποίηση αντί να υποθέτεται αποκλειστικά εκτέλεση σε Codespaces
- **🔐 Καθοδήγηση αυθεντικοποίησης** τώρα προτιμά το `azd auth login` για ροές εργασίας AZD, με το `az login` να τοποθετείται ως προαιρετικό όταν χρησιμοποιούνται άμεσα εντολές του Azure CLI

#### Διορθώθηκε
- **🪟 Εντολές εγκατάστασης Windows** κανονικοποιήθηκαν στο τρέχον γράμμα πακέτου `winget` στην οδηγία εγκατάστασης
- **🐧 Οδηγίες εγκατάστασης Linux** διορθώθηκαν για να αποφευχθούν μη υποστηριζόμενες διανομητικές οδηγίες διαχειριστή πακέτων `azd` και αντ’ αυτού να παραπέμπουν σε release assets όπου αρμόζει
- **📦 Παραδείγματα μοντέλων AI** ανανεώθηκαν από παλαιότερα προεπιλεγμένα όπως `gpt-35-turbo` και `text-embedding-ada-002` σε τρέχοντα παραδείγματα όπως `gpt-4.1-mini`, `gpt-4.1`, και `text-embedding-3-large`
- **📋 Τμήματα ανάπτυξης και διάγνωσης** διορθώθηκαν ώστε να χρησιμοποιούν τρέχουσες εντολές περιβάλλοντος και κατάστασης σε logs, σενάρια και βήματα αντιμετώπισης προβλημάτων
- **⚙️ Καθοδήγηση GitHub Actions** ενημερώθηκε από `Azure/setup-azd@v1.0.0` σε `Azure/setup-azd@v2`
- **🤖 Οδηγίες συναίνεσης MCP/Copilot** ενημερώθηκαν από `azd mcp consent` σε `azd copilot consent list`

#### Βελτιώθηκε
- **🧠 Καθοδήγηση κεφαλαίου AI** πλέον εξηγεί καλύτερα τη συμπεριφορά προεπισκόπησης του `azd ai`, τη σύνδεση ανά tenant, τη χρήση επεκτάσεων και τις ενημερωμένες συστάσεις ανάπτυξης μοντέλων
- **🧪 Οδηγίες εργαστηρίου** τώρα χρησιμοποιούν πιο ρεαλιστικά παραδείγματα εκδόσεων και σαφέστερη γλώσσα ρύθμισης περιβάλλοντος για πρακτικά εργαστήρια
- **📈 Έγγραφα παραγωγής και αντιμετώπισης προβλημάτων** πλέον ευθυγραμμίζονται καλύτερα με τρέχοντα παραδείγματα παρακολούθησης, εφεδρικού μοντέλου και επιπέδων κόστους

#### Αρχεία που ενημερώθηκαν
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
**Αυτή η έκδοση προσθέτει κάλυψη εντολών `azd ai`, `azd extension` και `azd mcp` σε όλα τα κεφάλαια σχετικά με το AI, διορθώνει σπασμένους συνδέσμους και αποσυρθέντα κομμάτια κώδικα στο agents.md, ενημερώνει το cheat sheet και αναδιαμορφώνει την ενότητα Example Templates με επικυρωμένες περιγραφές και νέα πρότυπα Azure AI AZD.**

#### Προστέθηκε
- **🤖 Κάλυψη εντολών AZD AI CLI** σε 7 αρχεία (προηγουμένως μόνο στο Κεφάλαιο 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Νέα ενότητα "Extensions and AI Commands" που εισάγει τα `azd extension`, `azd ai agent init`, και `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Επιλογή 4: `azd ai agent init` με πίνακα σύγκρισης (πρότυπο vs προσέγγιση manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Υποενότητες "AZD Extensions for Foundry" και "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Το Quick Start δείχνει τώρα και τις δύο διαδρομές ανάπτυξης με πρότυπο και με manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Η ενότητα Deploy περιλαμβάνει τώρα την επιλογή `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Υποενότητα "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Νέα ενότητα "AI & Extensions Commands" με `azd extension`, `azd ai agent init`, `azd mcp`, και `azd infra generate`
- **📦 Νέα πρότυπα παραδειγμάτων AZD AI** στο `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG συνομιλία με Blazor WebAssembly, Semantic Kernel, και υποστήριξη φωνητικής συνομιλίας
  - **azure-search-openai-demo-java** — Java RAG συνομιλία χρησιμοποιώντας Langchain4J με επιλογές ανάπτυξης ACA/AKS
  - **contoso-creative-writer** — Εφαρμογή πολλαπλών πρακτόρων δημιουργικής γραφής χρησιμοποιώντας Azure AI Agent Service, Bing Grounding, και Prompty
  - **serverless-chat-langchainjs** — Serverless RAG με Azure Functions + LangChain.js + Cosmos DB με υποστήριξη τοπικής ανάπτυξης Ollama
  - **chat-with-your-data-solution-accelerator** — Επιταχυντής επιχείρησης RAG με portal διαχειριστή, ενσωμάτωση Teams, και επιλογές PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Εφαρμογή αναφοράς ορχήστρωσης πολλαπλών πρακτόρων MCP με servers σε .NET, Python, Java, και TypeScript
  - **azd-ai-starter** — Ελάχιστο αρχικό πρότυπο υποδομής Azure AI Bicep
  - **🔗 Awesome AZD AI Gallery link** — Αναφορά στο [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ πρότυπα)

#### Διορθώθηκε
- **🔗 Πλοήγηση agents.md**: Οι σύνδεσμοι Previous/Next τώρα ταιριάζουν στη σειρά μαθημάτων του README του Κεφαλαίου 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Σπασμένοι σύνδεσμοι agents.md**: `production-ai-practices.md` διορθώθηκε σε `../chapter-08-production/production-ai-practices.md` (3 εμφανίσεις)
- **📦 Αποσυρθέντα τμήματα κώδικα agents.md**: Αντικαταστάθηκε το `opencensus` με `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 Άκυρο API στο agents.md**: Το `max_tokens` μεταφέρθηκε από `create_agent()` σε `create_run()` ως `max_completion_tokens`
- **🔢 Μέτρηση token στο agents.md**: Αντικαταστάθηκε η πρόχειρη εκτίμηση `len//4` με `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Διορθώθηκαν οι υπηρεσίες από "Cognitive Search + App Service" σε "Azure AI Search + Azure Container Apps" (προεπιλεγμένος host αλλάχθηκε Οκτ 2024)
- **contoso-chat**: Η περιγραφή ενημερώθηκε για να αναφέρει Azure AI Foundry + Prompty, αντιστοιχώντας στον πραγματικό τίτλο και τεχνολογικό στοίχο του repo

#### Αφαιρέθηκε
- **ai-document-processing**: Αφαιρέθηκε αναφορά μη λειτουργικού προτύπου (repo δεν είναι δημόσια προσβάσιμο ως πρότυπο AZD)

#### Βελτιώθηκε
- **📝 Ασκήσεις agents.md**: Η Άσκηση 1 τώρα δείχνει το αναμενόμενο αποτέλεσμα και βήμα `azd monitor`; Η Άσκηση 2 περιλαμβάνει πλήρη κώδικα εγγραφής `FunctionTool`; Η Άσκηση 3 αντικαθιστά τη θολή καθοδήγηση με συγκεκριμένες εντολές `prepdocs.py`
- **📚 Πόροι agents.md**: Ενημερωμένοι σύνδεσμοι τεκμηρίωσης προς τα τρέχοντα docs και quickstart του Azure AI Agent Service
- **📋 Πίνακας Επόμενων Βημάτων agents.md**: Προστέθηκε σύνδεσμος AI Workshop Lab για πλήρη κάλυψη κεφαλαίου

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
#### Ενίσχυση Πλοήγησης Μαθήματος
**Αυτή η έκδοση βελτιώνει την πλοήγηση στα κεφάλαια του README.md με βελτιωμένη μορφή πίνακα.**

#### Αλλαγές
- **Πίνακας Χάρτη Μαθήματος**: Βελτιώθηκε με άμεσους συνδέσμους μαθημάτων, εκτιμήσεις διάρκειας και βαθμολογίες πολυπλοκότητας
- **Καθαρισμός Φακέλων**: Αφαιρέθηκαν περιττοί παλιοί φάκελοι (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Επαλήθευση Συνδέσμων**: Επαληθεύτηκαν όλοι οι 21+ εσωτερικοί σύνδεσμοι στον Πίνακα Χάρτη Μαθήματος

### [v3.16.0] - 2026-02-05

#### Ενημερώσεις Ονομασίας Προϊόντος
**Αυτή η έκδοση ενημερώνει τις αναφορές προϊόντων για τη σημερινή επωνυμία της Microsoft.**

#### Αλλαγές
- **Microsoft Foundry → Microsoft Foundry**: Όλες οι αναφορές ενημερώθηκαν σε αρχεία μη μετάφρασης
- **Azure AI Agent Service → Foundry Agents**: Το όνομα της υπηρεσίας ενημερώθηκε για να αντικατοπτρίζει την τρέχουσα επωνυμία

#### Ενημερωμένα Αρχεία
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

#### Σημαντική Αναδιάρθρωση Αποθετηρίου: Φάκελοι Βασισμένοι σε Κεφάλαια
**Αυτή η έκδοση αναδιαρθρώνει την τεκμηρίωση σε αφιερωμένους φακέλους κεφαλαίων για πιο καθαρή πλοήγηση.**

#### Μετονομασίες Φακέλων
Οι παλιοί φάκελοι αντικαταστάθηκαν με φακέλους αριθμημένους κατά κεφάλαιο:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Προστέθηκε
- **📚 Αρχεία README κεφαλαίου**: Δημιουργήθηκε README.md σε κάθε φάκελο κεφαλαίου με:
  - Στόχοι μάθησης και διάρκεια
  - Πίνακα μαθημάτων με περιγραφές
  - Εντολές γρήγορης εκκίνησης
  - Πλοήγηση σε άλλα κεφάλαια

#### Αλλαγές
- **🔗 Ενημερώθηκαν όλοι οι εσωτερικοί σύνδεσμοι**: 78+ διαδρομές ενημερώθηκαν σε όλα τα αρχεία τεκμηρίωσης
- **🗺️ Κύριο README.md**: Ενημερώθηκε ο Χάρτης Μαθήματος με τη νέα δομή κεφαλαίων
- **📝 examples/README.md**: Ενημερώθηκαν οι διασταυρούμενες αναφορές προς τους φακέλους κεφαλαίων

#### Αφαιρέθηκαν
- Παλιά δομή φακέλων (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Αναδιάρθρωση Αποθετηρίου: Πλοήγηση Κεφαλαίων
**Αυτή η έκδοση πρόσθεσε αρχεία README πλοήγησης κεφαλαίων (αντικαταστάθηκε από v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Νέος οδηγός για AI Agents
**Αυτή η έκδοση προσθέτει έναν ολοκληρωμένο οδηγό για ανάπτυξη AI agents με Azure Developer CLI.**

#### Προστέθηκε
- **🤖 docs/microsoft-foundry/agents.md**: Πλήρης οδηγός που καλύπτει:
  - Τι είναι οι AI agents και πώς διαφέρουν από τα chatbots
  - Τρία πρότυπα γρήγορης εκκίνησης agent (Foundry Agents, Prompty, RAG)
  - Πρότυπα αρχιτεκτονικής agent (μονός agent, RAG, πολλαπλοί agents)
  - Διαμόρφωση εργαλείων και εξατομίκευση
  - Παρακολούθηση και καταγραφή μετρικών
  - Θέματα κόστους και βελτιστοποίηση
  - Συνηθισμένα σενάρια αντιμετώπισης προβλημάτων
  - Τρεις πρακτικές ασκήσεις με κριτήρια επιτυχίας

#### Δομή Περιεχομένου
- **Εισαγωγή**: Έννοιες agents για αρχάριους
- **Γρήγορη Εκκίνηση**: Αναπτύξτε agents με `azd init --template get-started-with-ai-agents`
- **Πρότυπα Αρχιτεκτονικής**: Οπτικά διαγράμματα προτύπων agent
- **Διαμόρφωση**: Ρύθμιση εργαλείων και μεταβλητές περιβάλλοντος
- **Παρακολούθηση**: Ενσωμάτωση με Application Insights
- **Ασκήσεις**: Προοδευτική πρακτική μάθηση (20-45 λεπτά η κάθε μία)

---

### [v3.12.0] - 2026-02-05

#### Ενημέρωση Περιβάλλοντος DevContainer
**Αυτή η έκδοση ενημερώνει τη διαμόρφωση του development container με σύγχρονα εργαλεία και καλύτερες προεπιλογές για την εμπειρία μάθησης AZD.**

#### Αλλαγές
- **🐳 Βασική Εικόνα**: Ενημερώθηκε από `python:3.12-bullseye` σε `python:3.12-bookworm` (τελευταίο Debian stable)
- **📛 Όνομα Container**: Μετονομάστηκε από "Python 3" σε "AZD for Beginners" για σαφήνεια

#### Προστέθηκε
- **🔧 Νέα χαρακτηριστικά Dev Container**:
  - `azure-cli` με ενεργοποιημένη υποστήριξη Bicep
  - `node:20` (Έκδοση LTS για πρότυπα AZD)
  - `github-cli` για διαχείριση προτύπων
  - `docker-in-docker` για αναπτύξεις εφαρμογών container

- **🔌 Προώθηση θυρών**: Προεπιλεγμένες ρυθμίσεις θυρών για κοινή ανάπτυξη:
  - 8000 (MkDocs preview)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Νέες επεκτάσεις VS Code**:
  - `ms-python.vscode-pylance` - Βελτιωμένο Python IntelliSense
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

- **⚙️ Ρυθμίσεις VS Code**: Προστέθηκαν προεπιλεγμένες ρυθμίσεις για τον διερμηνέα Python, μορφοποίηση κατά αποθήκευση και αφαίρεση κενών

- **📦 Ενημερωμένο requirements-dev.txt**:
  - Προστέθηκε plugin συμπίεσης για MkDocs
  - Προστέθηκε pre-commit για ποιότητα κώδικα
  - Προστέθηκαν πακέτα Azure SDK (azure-identity, azure-mgmt-resource)

#### Διορθώθηκε
- **Εντολή μετά τη δημιουργία**: Τώρα επαληθεύει την εγκατάσταση του AZD και του Azure CLI κατά την εκκίνηση του container

---

### [v3.11.0] - 2026-02-05

#### Αναθεώρηση README φιλική προς αρχάριους
**Αυτή η έκδοση βελτιώνει σημαντικά το README.md ώστε να είναι πιο προσβάσιμο για αρχάριους και προσθέτει βασικούς πόρους για προγραμματιστές AI.**

#### Προστέθηκε
- **🆚 Σύγκριση Azure CLI vs AZD**: Σαφής εξήγηση πότε να χρησιμοποιείτε κάθε εργαλείο με πρακτικά παραδείγματα
- **🌟 Χρήσιμοι σύνδεσμοι AZD**: Άμεσοι σύνδεσμοι στην γκαλερί προτύπων της κοινότητας και πόρους συνεισφοράς:
  - [Εξαιρετική Συλλογή AZD](https://azure.github.io/awesome-azd/) - 200+ έτοιμα προς ανάπτυξη πρότυπα
  - [Υποβολή Προτύπου](https://github.com/Azure/awesome-azd/issues) - Συνεισφορά κοινότητας
- **🎯 Οδηγός Γρήγορης Εκκίνησης**: Απλοποιημένο τμήμα 3 βημάτων για έναρξη (Εγκατάσταση → Σύνδεση → Ανάπτυξη)
- **📊 Πίνακας Πλοήγησης με Βάση την Εμπειρία**: Σαφής καθοδήγηση για το από πού να ξεκινήσετε ανάλογα με την εμπειρία του προγραμματιστή

#### Αλλαγές
- **Δομή README**: Αναδιαρθρώθηκε για προοδευτική αποκάλυψη - οι βασικές πληροφορίες πρώτα
- **Ενότητα Εισαγωγής**: Αναγράφηκε ξανά για να εξηγεί "Το Μαγεμένο `azd up`" για απόλυτους αρχάριους
- **Αφαιρέθηκε διπλό περιεχόμενο**: Εξαλείφθηκε επαναλαμβανόμενη ενότητα αντιμετώπισης προβλημάτων
- **Εντολές Αντιμετώπισης Προβλημάτων**: Διόρθωση της αναφοράς `azd logs` για χρήση της έγκυρης `azd monitor --logs`

#### Διορθώθηκε
- **🔐 Εντολές Αυθεντικοποίησης**: Προστέθηκαν `azd auth login` και `azd auth logout` στο cheat-sheet.md
- **Μη έγκυρες αναφορές εντολών**: Αφαιρέθηκε η υπόλοιπη αναφορά `azd logs` από την ενότητα αντιμετώπισης προβλημάτων του README

#### Σημειώσεις
- **Εύρος**: Οι αλλαγές εφαρμόστηκαν στο κύριο README.md και στο resources/cheat-sheet.md
- **Στόχος**: Οι βελτιώσεις στοχεύουν ειδικά τους προγραμματιστές νέους στο AZD

---

### [v3.10.0] - 2026-02-05

#### Ενημέρωση Ακρίβειας Εντολών Azure Developer CLI
**Αυτή η έκδοση διορθώνει μη υπάρχουσες εντολές AZD σε όλη την τεκμηρίωση, εξασφαλίζοντας ότι όλα τα παραδείγματα κώδικα χρησιμοποιούν έγκυρη σύνταξη Azure Developer CLI.**

#### Διορθώθηκαν
- **🔧 Αφαιρέθηκαν μη υπαρκτές εντολές AZD**: Εκτενής έλεγχος και διόρθωση των άκυρων εντολών:
  - `azd logs` (doesn't exist) → replaced with `azd monitor --logs` or Azure CLI alternatives
  - `azd service` subcommands (don't exist) → replaced with `azd show` and Azure CLI
  - `azd infra import/export/validate` (don't exist) → removed or replaced with valid alternatives
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (don't exist) → removed
  - `azd provision --what-if/--rollback` flags (don't exist) → updated to use `--preview`
  - `azd config validate` (doesn't exist) → replaced with `azd config list`
  - `azd info`, `azd history`, `azd metrics` (don't exist) → removed

- **📚 Αρχεία Ενημερωμένα με Διορθώσεις Εντολών**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

#### Αλλαγές
- **Στρατηγικές Επαναφοράς**: Ενημέρωση της τεκμηρίωσης για χρήση επαναφοράς με βάση το Git (το AZD δεν διαθέτει εγγενή επαναφορά)
- **Προβολή Καταγραφών**: Αντικατάσταση αναφορών `azd logs` με `azd monitor --logs`, `azd monitor --live`, και εντολές Azure CLI
- **Ενότητα Απόδοσης**: Αφαιρέθηκαν μη υπαρκτές σημαίες παράλληλης/αύξουσας ανάπτυξης, παρέχοντας έγκυρες εναλλακτικές

#### Τεχνικές Λεπτομέρειες
- **Έγκυρες Εντολές AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Έγκυρες Σημαίες azd monitor**: `--live`, `--logs`, `--overview`
- **Αφαιρούμενες δυνατότητες**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Σημειώσεις
- **Επαλήθευση**: Οι εντολές επαληθεύτηκαν έναντι του Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Ολοκλήρωση Εργαστηρίου και Βελτίωση Ποιότητας Τεκμηρίωσης
**Αυτή η έκδοση ολοκληρώνει τα διαδραστικά modules εργαστηρίου, διορθώνει όλους τους σπασμένους συνδέσμους τεκμηρίωσης και βελτιώνει τη συνολική ποιότητα περιεχομένου για προγραμματιστές AI που χρησιμοποιούν Microsoft AZD.**

#### Προστέθηκε
- **📝 CONTRIBUTING.md**: Νέο έγγραφο οδηγιών συνεισφοράς με:
  - Σαφείς οδηγίες για αναφορά προβλημάτων και υποβολή προτάσεων αλλαγών
  - Πρότυπα τεκμηρίωσης για νέο περιεχόμενο
  - Οδηγίες παραδειγμάτων κώδικα και κανόνες για μηνύματα commit
  - Πληροφορίες εμπλοκής της κοινότητας

#### Ολοκληρώθηκε
- **🎯 Workshop Module 7 (Wrap-up)**: Πλήρως ολοκληρωμένη ενότητα σύνοψης με:
  - Περιεκτική περίληψη των επιτευγμάτων του εργαστηρίου
  - Ενότητα με βασικές έννοιες που κατακτήθηκαν καλύπτοντας AZD, πρότυπα και Microsoft Foundry
  - Συστάσεις για συνέχεια της μαθησιακής διαδρομής
  - Ασκήσεις προκλήσεων εργαστηρίου με βαθμολογίες δυσκολίας
  - Συνδέσεις για ανατροφοδότηση κοινότητας και υποστήριξη

- **📚 Workshop Module 3 (Deconstruct)**: Ενημερώθηκαν οι μαθησιακοί στόχοι με:
  - Οδηγίες ενεργοποίησης GitHub Copilot με MCP servers
  - Κατανόηση της δομής φακέλων προτύπων AZD
  - Πρότυπα οργάνωσης Infrastructure-as-code (Bicep)
  - Οδηγίες εργαστηρίου hands-on

- **🔧 Workshop Module 6 (Teardown)**: Ολοκληρώθηκε με:
  - Στόχους καθαρισμού πόρων και διαχείρισης κόστους
  - Χρήση του `azd down` για ασφαλή αποδέσμευση υποδομής
  - Οδηγίες ανάκτησης υπηρεσιών γνωστικής τεχνολογίας που διαγράφηκαν soft-delete
  - Πρόσθετα ερωτήματα εξερεύνησης για GitHub Copilot και Azure Portal

#### Διορθώθηκε
- **🔗 Διορθώσεις σπασμένων συνδέσμων**: Επιδιορθώθηκαν 15+ σπασμένοι εσωτερικοί σύνδεσμοι τεκμηρίωσης:
  - `docs/ai-foundry/ai-model-deployment.md`: Διορθώθηκαν διαδρομές προς microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Διορθώθηκαν διαδρομές ai-model-deployment.md και production-ai-practices.md
  - `docs/getting-started/first-project.md`: Αντικαταστάθηκε το μη υπαρκτό cicd-integration.md με deployment-guide.md
  - `examples/retail-scenario.md`: Διορθώθηκαν διαδρομές FAQ και οδηγού αντιμετώπισης προβλημάτων
  - `examples/container-app/microservices/README.md`: Διορθώθηκαν διαδρομές course home και deployment guide
  - `resources/faq.md` και `resources/glossary.md`: Ενημερώθηκαν αναφορές κεφαλαίου AI
  - `course-outline.md`: Διορθώθηκαν αναφορές instructor guide και εργαστηρίων AI

- **📅 Banner Κατάστασης Εργαστηρίου**: Ενημερώθηκε από "Under Construction" σε ενεργή κατάσταση εργαστηρίου με ημερομηνία Φεβρουάριος 2026

- **🔗 Πλοήγηση Εργαστηρίου**: Διορθώθηκαν σπασμένοι σύνδεσμοι πλοήγησης στο workshop README.md που οδηγούσαν στον μη υπαρκτό φάκελο lab-1-azd-basics

#### Αλλαγές
- **Παρουσίαση Εργαστηρίου**: Αφαιρέθηκε η προειδοποίηση "under construction", το εργαστήριο είναι πλέον ολοκληρωμένο και έτοιμο για χρήση
- **Συνοχή Πλοήγησης**: Εξασφαλίστηκε ότι όλες οι ενότητες εργαστηρίου έχουν σωστή δια-ενότητας πλοήγηση
- **Αναφορές Μονοπατιού Μάθησης**: Ενημερώθηκαν οι εσωτερικές αναφορές κεφαλαίων για να χρησιμοποιούν σωστές διαδρομές microsoft-foundry

#### Επικυρώθηκε
- ✅ Όλα τα αγγλικά αρχεία markdown έχουν έγκυρους εσωτερικούς συνδέσμους
- ✅ Οι ενότητες εργαστηρίου 0-7 είναι πλήρεις με μαθησιακούς στόχους
- ✅ Η πλοήγηση μεταξύ κεφαλαίων και ενοτήτων λειτουργεί σωστά
- ✅ Το περιεχόμενο είναι κατάλληλο για προγραμματιστές AI που χρησιμοποιούν Microsoft AZD
- ✅ Διατηρήθηκε φιλική προς αρχάριους γλώσσα και δομή
- ✅ Το CONTRIBUTING.md παρέχει σαφείς οδηγίες για συνεισφέροντες της κοινότητας

#### Τεχνική Υλοποίηση
- **Επαλήθευση Συνδέσμων**: Αυτόματο σενάριο PowerShell επαλήθευσε όλους τους .md εσωτερικούς συνδέσμους
- **Έλεγχος Περιεχομένου**: Χειροκίνητη ανασκόπηση της πληρότητας του εργαστηρίου και της καταλληλότητας για αρχάριους
- **Σύστημα Πλοήγησης**: Εφαρμόστηκαν συνεπή πρότυπα πλοήγησης κεφαλαίων και ενοτήτων

#### Σημειώσεις
- **Εύρος**: Οι αλλαγές εφαρμόστηκαν μόνο στην αγγλική τεκμηρίωση
- **Μεταφράσεις**: Οι φάκελοι μεταφράσεων δεν ενημερώθηκαν σε αυτή την έκδοση (η αυτοματοποιημένη μετάφραση θα συγχρονιστεί αργότερα)
- **Διάρκεια Εργαστηρίου**: Το πλήρες εργαστήριο προσφέρει τώρα 3-4 ώρες πρακτικής μάθησης

---

### [v3.8.0] - 2025-11-19

#### Προηγμένη Τεκμηρίωση: Παρακολούθηση, Ασφάλεια και Πρότυπα Πολυπρακτόρων
**Αυτή η έκδοση προσθέτει ολοκληρωμένα μαθήματα επιπέδου A για την ενσωμάτωση Application Insights, πρότυπα αυθεντικοποίησης και συντονισμό πολυπρακτόρων για παραγωγικές αναπτύξεις.**

#### Προστέθηκε
- **📊 Μάθημα Ενσωμάτωσης Application Insights**: στο `docs/pre-deployment/application-insights.md`:
  - Ανάπτυξη με έμφαση σε AZD με αυτόματη παροχή
  - Πλήρη πρότυπα Bicep για Application Insights + Log Analytics
  - Ενεργές εφαρμογές Python με προσαρμοσμένη τηλεμετρία (1.200+ γραμμές)
  - Πρότυπα παρακολούθησης AI/LLM (παρακολούθηση token/κόστους Microsoft Foundry Models)
  - 6 διαγράμματα Mermaid (αρχιτεκτονική, κατανεμημένη ιχνηλάτηση, ροή τηλεμετρίας)
  - 3 πρακτικές ασκήσεις (alerts, dashboards, παρακολούθηση AI)
  - Παραδείγματα ερωτημάτων Kusto και στρατηγικές βελτιστοποίησης κόστους
  - Streaming ζωντανών μετρικών και αποσφαλμάτωση σε πραγματικό χρόνο
  - Χρόνος εκμάθησης 40-50 λεπτά με πρότυπα παραγωγικής χρήσης

- **🔐 Μάθημα Προτύπων Αυθεντικοποίησης & Ασφάλειας**: στο `docs/getting-started/authsecurity.md`:
  - 3 πρότυπα αυθεντικοποίησης (connection strings, Key Vault, managed identity)
  - Πλήρη πρότυπα υποδομής Bicep για ασφαλείς αναπτύξεις
  - Κώδικας εφαρμογής Node.js με ενσωμάτωση Azure SDK
  - 3 ολοκληρωμένες ασκήσεις (ενεργοποίηση managed identity, user-assigned identity, περιστροφή Key Vault)
  - Καλές πρακτικές ασφάλειας και ρυθμίσεις RBAC
  - Οδηγός αντιμετώπισης προβλημάτων και ανάλυση κόστους
  - Πρότυπα παραγωγικής, passwordless αυθεντικοποίησης

- **🤖 Μάθημα Προτύπων Συντονισμού Πολυπρακτόρων**: στο `docs/pre-deployment/coordination-patterns.md`:
  - 5 πρότυπα συντονισμού (διαδοχικό, παράλληλο, ιεραρχικό, event-driven, consensus)
  - Πλήρης υλοποίηση υπηρεσίας orchestrator (Python/Flask, 1.500+ γραμμές)
  - 3 εξειδικευμένες υλοποιήσεις πρακτόρων (Research, Writer, Editor)
  - Ενσωμάτωση Service Bus για ουρές μηνυμάτων
  - Διαχείριση κατάστασης με Cosmos DB για κατανεμημένα συστήματα
  - 6 διαγράμματα Mermaid που δείχνουν τις αλληλεπιδράσεις των πρακτόρων
  - 3 προχωρημένες ασκήσεις (χειρισμός χρονικών ορίων, λογική επαναπροσπάθειας, circuit breaker)
  - Ανάλυση κόστους ($240-565/month) με στρατηγικές βελτιστοποίησης
  - Ενσωμάτωση Application Insights για παρακολούθηση

#### Ενισχυμένο
- **Κεφάλαιο Pre-deployment**: Τώρα περιλαμβάνει ολοκληρωμένα πρότυπα παρακολούθησης και συντονισμού
- **Κεφάλαιο Getting Started**: Εμπλουτισμένο με επαγγελματικά πρότυπα αυθεντικοποίησης
- **Ετοιμότητα για Παραγωγή**: Πλήρης κάλυψη από ασφάλεια έως παρατηρησιμότητα
- **Πρόγραμμα Μαθήματος**: Ενημερώθηκε για να αναφέρει νέα μαθήματα στα Κεφάλαια 3 και 6

#### Αλλαγές
- **Πρόοδος Μάθησης**: Καλύτερη ενσωμάτωση ασφάλειας και παρακολούθησης σε όλο το μάθημα
- **Ποιότητα Τεκμηρίωσης**: Συνεπή πρότυπα ποιότητας επιπέδου A (95-97%) στα νέα μαθήματα
- **Πρότυπα Παραγωγής**: Πλήρης κάλυψη end-to-end για επιχειρησιακές αναπτύξεις

#### Βελτιώθηκε
- **Εμπειρία Προγραμματιστή**: Ξεκάθαρη διαδρομή από την ανάπτυξη έως την παραγωγική παρακολούθηση
- **Πρότυπα Ασφαλείας**: Επαγγελματικά πρότυπα για αυθεντικοποίηση και διαχείριση μυστικών
- **Παρατηρησιμότητα**: Πλήρης ενσωμάτωση Application Insights με AZD
- **Φορτία AI**: Εξειδικευμένη παρακολούθηση για Microsoft Foundry Models και συστήματα πολυπρακτόρων

#### Επικυρώθηκε
- ✅ Όλα τα μαθήματα περιλαμβάνουν πλήρως λειτουργικό κώδικα (όχι αποσπάσματα)
- ✅ Διαγράμματα Mermaid για οπτική μάθηση (19 συνολικά σε 3 μαθήματα)
- ✅ Πρακτικές ασκήσεις με βήματα επαλήθευσης (9 συνολικά)
- ✅ Παραγωγικά πρότυπα Bicep αναπτύξιμα μέσω `azd up`
- ✅ Ανάλυση κόστους και στρατηγικές βελτιστοποίησης
- ✅ Οδηγοί αντιμετώπισης προβλημάτων και βέλτιστες πρακτικές
- ✅ Σημεία ελέγχου γνώσης με εντολές επαλήθευσης

#### Αποτελέσματα Αξιολόγησης Τεκμηρίωσης
- **docs/pre-deployment/application-insights.md**: - Περιεκτικός οδηγός παρακολούθησης
- **docs/getting-started/authsecurity.md**: - Επαγγελματικά πρότυπα ασφαλείας
- **docs/pre-deployment/coordination-patterns.md**: - Προηγμένες αρχιτεκτονικές πολυπρακτόρων
- **Συνολικό Νέο Περιεχόμενο**: - Συνεπής υψηλή ποιότητα

#### Τεχνική Υλοποίηση
- **Application Insights**: Log Analytics + προσαρμοσμένη τηλεμετρία + κατανεμημένη ιχνηλάτηση
- **Authentication**: Managed Identity + Key Vault + πρότυπα RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + ορχήστρωση
- **Monitoring**: Ζωντανές μετρικές + ερωτήματα Kusto + alerts + dashboards
- **Διαχείριση Κόστους**: Στρατηγικές δειγματοληψίας, πολιτικές retention, έλεγχοι προϋπολογισμού

### [v3.7.0] - 2025-11-19

#### Βελτιώσεις Ποιότητας Τεκμηρίωσης και Νέο Παράδειγμα Microsoft Foundry Models
**Αυτή η έκδοση βελτιώνει την ποιότητα της τεκμηρίωσης σε ολόκληρο το αποθετήριο και προσθέτει ένα πλήρες παράδειγμα ανάπτυξης Microsoft Foundry Models με διεπαφή συνομιλίας gpt-4.1.**

#### Προστέθηκε
- **🤖 Παράδειγμα Συνομιλίας Microsoft Foundry Models**: Πλήρης ανάπτυξη gpt-4.1 με λειτουργική υλοποίηση στο `examples/azure-openai-chat/`:
  - Πλήρης υποδομή Microsoft Foundry Models (ανάπτυξη μοντέλου gpt-4.1)
  - Διεπαφή συνομιλίας Python command-line με ιστορικό συνομιλιών
  - Ενσωμάτωση Key Vault για ασφαλή αποθήκευση κλειδιών API
  - Παρακολούθηση χρήσης token και εκτίμηση κόστους
  - Περιορισμός ρυθμού αιτήσεων και χειρισμός σφαλμάτων
  - Αναλυτικό README με οδηγό ανάπτυξης 35-45 λεπτών
  - 11 αρχεία έτοιμα για παραγωγή (Bicep templates, Python app, διαμόρφωση)
- **📚 Ασκήσεις Τεκμηρίωσης**: Προστέθηκαν πρακτικές ασκήσεις στον οδηγό διαμόρφωσης:
  - Άσκηση 1: Διαμόρφωση πολλαπλών περιβαλλόντων (15 λεπτά)
  - Άσκηση 2: Πρακτική διαχείρισης μυστικών (10 λεπτά)
  - Σαφή κριτήρια επιτυχίας και βήματα επαλήθευσης
- **✅ Επαλήθευση Ανάπτυξης**: Προστέθηκε ενότητα επαλήθευσης στον οδηγό ανάπτυξης:
  - Διαδικασίες ελέγχου υγείας
  - Λίστα ελέγχου κριτηρίων επιτυχίας
  - Αναμενόμενες εξόδους για όλες τις εντολές ανάπτυξης
  - Γρήγορη αναφορά αντιμετώπισης προβλημάτων

#### Ενισχυμένο
- **examples/README.md**: Ενημερώθηκε σε ποιότητα A-grade (93%):
  - Προστέθηκε το azure-openai-chat σε όλα τα σχετικά τμήματα
  - Ενημερώθηκε ο αριθμός τοπικών παραδειγμάτων από 3 σε 4
  - Προστέθηκε στον πίνακα Παραδειγμάτων Εφαρμογών AI
  - Ενσωματώθηκε στο Quick Start για Μεσαίου Επιπέδου Χρήστες
  - Προστέθηκε στην ενότητα Microsoft Foundry Templates
  - Ενημερώθηκε το Comparison Matrix και τα τμήματα εύρεσης τεχνολογίας
- **Ποιότητα Τεκμηρίωσης**: Βελτιώθηκε από B+ (87%) → A- (92%) στον φάκελο docs:
  - Προστέθηκαν αναμενόμενες έξοδοι σε κρίσιμα παραδείγματα εντολών
  - Συμπεριλήφθηκαν βήματα επαλήθευσης για αλλαγές διαμόρφωσης
  - Ενισχύθηκε η πρακτική μάθηση με πρακτικές ασκήσεις

#### Αλλαγές
- **Πρόοδος Μάθησης**: Καλύτερη ενσωμάτωση παραδειγμάτων AI για μεσαίου επιπέδου μαθητές
- **Δομή Τεκμηρίωσης**: Περισσότερες εφαρμόσιμες ασκήσεις με ξεκάθαρα αποτελέσματα
- **Διαδικασία Επαλήθευσης**: Προστίθενται ρητά κριτήρια επιτυχίας σε βασικές ροές εργασίας

#### Βελτιώθηκε
- **Εμπειρία Προγραμματιστή**: Η ανάπτυξη Microsoft Foundry Models τώρα διαρκεί 35-45 λεπτά (αντί 60-90 για πιο πολύπλοκες εναλλακτικές)
- **Διαφάνεια Κόστους**: Σαφείς εκτιμήσεις κόστους ($50-200/month) για το παράδειγμα Microsoft Foundry Models
- **Μονοπάτι Μάθησης**: Οι προγραμματιστές AI έχουν ξεκάθαρο σημείο εισόδου με το azure-openai-chat
- **Πρότυπα Τεκμηρίωσης**: Συνεπείς αναμενόμενες έξοδοι και βήματα επαλήθευσης

#### Επικυρώθηκε
- ✅ Το παράδειγμα Microsoft Foundry Models λειτουργεί πλήρως με `azd up`
- ✅ Όλα τα 11 αρχεία υλοποίησης είναι συντακτικά σωστά
- ✅ Οι οδηγίες README ανταποκρίνονται στην πραγματική εμπειρία ανάπτυξης
- ✅ Οι σύνδεσμοι τεκμηρίωσης ενημερώθηκαν σε 8+ τοποθεσίες
- ✅ Ο δείκτης παραδειγμάτων αντικατοπτρίζει σωστά 4 τοπικά παραδείγματα
- ✅ Δεν υπάρχουν διπλοί εξωτερικοί σύνδεσμοι σε πίνακες
- ✅ Όλες οι αναφορές πλοήγησης είναι σωστές

#### Τεχνική Υλοποίηση
- **Αρχιτεκτονική Microsoft Foundry Models**: gpt-4.1 + Key Vault + Container Apps pattern
- **Ασφάλεια**: Έτοιμο για Managed Identity, μυστικά στο Key Vault
- **Παρακολούθηση**: Ενσωμάτωση Application Insights
- **Διαχείριση Κόστους**: Παρακολούθηση token και βελτιστοποίηση χρήσης
- **Ανάπτυξη**: Μία εντολή `azd up` για πλήρη ρύθμιση

### [v3.6.0] - 2025-11-19

#### Μεγάλη Ενημέρωση: Παραδείγματα Ανάπτυξης Container App
**Αυτή η έκδοση εισάγει ολοκληρωμένα, έτοιμα για παραγωγή παραδείγματα ανάπτυξης container εφαρμογών χρησιμοποιώντας Azure Developer CLI (AZD), με πλήρη τεκμηρίωση και ενσωμάτωση στο μονοπάτι μάθησης.**

#### Προστέθηκε
- **🚀 Παραδείγματα Container App**: Νέα τοπικά παραδείγματα στο `examples/container-app/`:
  - [Κύριος Οδηγός](examples/container-app/README.md): Πλήρης επισκόπηση containerized αναπτύξεων, quick start, παραγωγή και προχωρημένα πρότυπα
  - [Απλό Flask API](../../examples/container-app/simple-flask-api): Φιλικό προς αρχάριους REST API με scale-to-zero, health probes, παρακολούθηση και αντιμετώπιση προβλημάτων
  - [Αρχιτεκτονική Microservices](../../examples/container-app/microservices): Παραγωγική πολλαπλών υπηρεσιών ανάπτυξη (API Gateway, Product, Order, User, Notification), ασύγχρονη ανταλλαγή μηνυμάτων, Service Bus, Cosmos DB, Azure SQL, κατανεμημένη ιχνηλάτηση, blue-green/canary deployment
- **Καλές Πρακτικές**: Ασφάλεια, παρακολούθηση, βελτιστοποίηση κόστους και οδηγίες CI/CD για workloads με containers
- **Δείγματα Κώδικα**: Πλήρη `azure.yaml`, πρότυπα Bicep, και υλοποιήσεις υπηρεσιών σε πολλές γλώσσες (Python, Node.js, C#, Go)
- **Δοκιμές & Αντιμετώπιση Προβλημάτων**: Σενάρια end-to-end testing, εντολές παρακολούθησης, οδηγίες αντιμετώπισης προβλημάτων

#### Αλλαγές
- **README.md**: Ενημερώθηκε για να προβάλλει και να συνδέει νέα παραδείγματα container app υπό "Local Examples - Container Applications"
- **examples/README.md**: Ενημερώθηκε για να τονίσει τα παραδείγματα container app, να προσθέσει καταχωρήσεις στο comparison matrix και να ενημερώσει αναφορές τεχνολογίας/αρχιτεκτονικής
- **Course Outline & Study Guide**: Ενημερώθηκαν για να αναφέρουν νέα παραδείγματα container app και πρότυπα ανάπτυξης στα σχετικά κεφάλαια

#### Επικυρώθηκε
- ✅ Όλα τα νέα παραδείγματα αναπτύσσονται με `azd up` και ακολουθούν βέλτιστες πρακτικές
- ✅ Ενημερώθηκαν οι διασυνδέσεις τεκμηρίωσης και η πλοήγηση
- ✅ Τα παραδείγματα καλύπτουν σενάρια από αρχάριους έως προχωρημένους, συμπεριλαμβανομένων παραγωγικών microservices

#### Σημειώσεις
- **Εύρος**: Αγγλική τεκμηρίωση και παραδείγματα μόνο
- **Επόμενα Βήματα**: Επέκταση με επιπλέον προχωρημένα πρότυπα container και αυτοματισμό CI/CD σε μελλοντικές εκδόσεις

### [v3.5.0] - 2025-11-19

#### Επανεπωνυμία Προϊόντος: Microsoft Foundry
**Αυτή η έκδοση εφαρμόζει μια ολοκληρωμένη αλλαγή ονομασίας προϊόντος από "Microsoft Foundry" σε "Microsoft Foundry" σε ολόκληρη την αγγλική τεκμηρίωση, αντανακλώντας την επίσημη επανασύνδεση της Microsoft.**

#### Αλλαγές
- **🔄 Ενημέρωση Ονόματος Προϊόντος**: Πλήρης επαναεπωνυμία από "Microsoft Foundry" σε "Microsoft Foundry"
  - Ενημερώθηκαν όλες οι αναφορές σε όλη την αγγλική τεκμηρίωση στον φάκελο `docs/`
  - Μετονομασία φακέλου: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Μετονομασμένο αρχείο: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Σύνολο: 23 αναφορές περιεχομένου ενημερώθηκαν σε 7 αρχεία τεκμηρίωσης

- **📁 Αλλαγές στη Δομή Φακέλων**:
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
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ήδη χρησιμοποιεί Microsoft Foundry (από προηγούμενες ενημερώσεις)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 αναφορές ενημερώθηκαν (επισκόπηση, σχόλια κοινότητας, τεκμηρίωση)
  - `docs/getting-started/azd-basics.md` - 4 διασταυρούμενοι σύνδεσμοι ενημερώθηκαν
  - `docs/getting-started/first-project.md` - 2 σύνδεσμοι πλοήγησης κεφαλαίου ενημερώθηκαν
  - `docs/getting-started/installation.md` - 2 επόμενα κεφάλαια σύνδεσμοι ενημερώθηκαν
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 αναφορές ενημερώθηκαν (πλοήγηση, κοινότητα Discord)
  - `docs/troubleshooting/common-issues.md` - 1 ενημέρωση συνδέσμου πλοήγησης
  - `docs/troubleshooting/debugging.md` - 1 ενημέρωση συνδέσμου πλοήγησης

- **Αρχεία Δομής Μαθήματος** (2 αρχεία):
  - `README.md` - 17 αναφορές ενημερώθηκαν (επισκόπηση μαθήματος, τίτλοι κεφαλαίων, ενότητα προτύπων, πληροφορίες κοινότητας)
  - `course-outline.md` - 14 αναφορές ενημερώθηκαν (επισκόπηση, μαθησιακοί στόχοι, πόροι κεφαλαίων)

#### Επαληθεύθηκε
- ✅ Μηδενικές εναπομένουσες αναφορές διαδρομής φακέλου "ai-foundry" στα αγγλικά έγγραφα
- ✅ Μηδενικές εναπομένουσες αναφορές ονόματος προϊόντος "Microsoft Foundry" στα αγγλικά έγγραφα
- ✅ Όλοι οι σύνδεσμοι πλοήγησης λειτουργικοί με τη νέα δομή φακέλων
- ✅ Οι μετονομασίες αρχείων και φακέλων ολοκληρώθηκαν με επιτυχία
- ✅ Οι διασταυρούμενες αναφορές μεταξύ κεφαλαίων επαληθεύτηκαν

#### Σημειώσεις
- **Έκταση**: Οι αλλαγές εφαρμόστηκαν μόνο στην αγγλόφωνη τεκμηρίωση στον φάκελο `docs/`
- **Μεταφράσεις**: Οι φάκελοι μετάφρασης (`translations/`) δεν ενημερώθηκαν σε αυτή την έκδοση
- **Εργαστήριο**: Το υλικό εργαστηρίου (`workshop/`) δεν ενημερώθηκε σε αυτή την έκδοση
- **Παραδείγματα**: Αρχεία παραδειγμάτων ενδέχεται να εξακολουθούν να αναφέρουν παλαιά ονόματα (θα αντιμετωπιστεί σε μελλοντική ενημέρωση)
- **Εξωτερικοί Σύνδεσμοι**: Τα εξωτερικά URLs και οι αναφορές στο αποθετήριο GitHub παραμένουν ανεπηρέαστα

#### Οδηγός Μετανάστευσης για Συνεισφέροντες
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Ενισχύσεις Προεπισκόπησης Υποδομής και Επαλήθευσης
**Αυτή η έκδοση εισάγει ολοκληρωμένη υποστήριξη για τη νέα δυνατότητα προεπισκόπησης του Azure Developer CLI και βελτιώνει την εμπειρία χρήστη του εργαστηρίου.**

#### Προστέθηκε
- **🧪 azd provision --preview Feature Documentation**: Ολοκληρωμένη κάλυψη της νέας δυνατότητας προεπισκόπησης υποδομής
  - Αναφορά εντολών και παραδείγματα χρήσης στο cheat sheet
  - Λεπτομερής ενσωμάτωση στον οδηγό παροχής με περιπτώσεις χρήσης και οφέλη
  - Ενσωμάτωση ελέγχων pre-flight για ασφαλέστερη επαλήθευση ανάπτυξης
  - Ενημερώσεις οδηγού εκκίνησης με πρακτικές πρώτης ασφάλειας ανάπτυξης
- **🚧 Workshop Status Banner**: Επαγγελματική HTML λωρίδα κατάστασης που υποδεικνύει την κατάσταση ανάπτυξης του εργαστηρίου
  - Σχεδίαση με gradient και ενδείξεις κατασκευής για σαφή επικοινωνία προς τον χρήστη
  - Χρονοσφραγίδα "τελευταία ενημέρωση" για διαφάνεια
  - Responsive σχεδιασμός για όλα τα είδη συσκευών

#### Βελτιώθηκε
- **Ασφάλεια Υποδομής**: Η λειτουργία προεπισκόπησης ενσωματώθηκε σε όλη την τεκμηρίωση ανάπτυξης
- **Προ-επικύρωση πριν την ανάπτυξη**: Τα αυτοματοποιημένα scripts τώρα περιλαμβάνουν δοκιμές προεπισκόπησης υποδομής
- **Ροή Εργασίας Ανάπτυξης**: Ενημερωμένες αλληλουχίες εντολών για να περιλαμβάνουν την προεπισκόπηση ως βέλτιστη πρακτική
- **Εμπειρία Εργαστηρίου**: Καθορισμένες σαφείς προσδοκίες προς τους χρήστες σχετικά με την κατάσταση ανάπτυξης του περιεχομένου

#### Αλλαγές
- **Βέλτιστες Πρακτικές Ανάπτυξης**: Η ροή εργασίας με πρώτη την προεπισκόπηση προτείνεται πλέον ως συνιστώμενη προσέγγιση
- **Ροή Τεκμηρίωσης**: Η επαλήθευση υποδομής μετακινήθηκε νωρίτερα στη μαθησιακή διαδικασία
- **Παρουσίαση Εργαστηρίου**: Επαγγελματική επικοινωνία κατάστασης με σαφές χρονοδιάγραμμα ανάπτυξης

#### Βελτιώσεις
- **Προσέγγιση Πρώτης Ασφάλειας**: Οι αλλαγές υποδομής μπορούν τώρα να επαληθευτούν πριν την ανάπτυξη
- **Συνεργασία Ομάδας**: Τα αποτελέσματα προεπισκόπησης μπορούν να κοινοποιηθούν για αναθεώρηση και έγκριση
- **Ενημέρωση για Κόστος**: Καλύτερη κατανόηση του κόστους πόρων πριν την παροχή
- **Μείωση Κινδύνου**: Μείωση αποτυχιών ανάπτυξης μέσω προχωρημένης επαλήθευσης

#### Τεχνική Υλοποίηση
- **Πολυ-έγγραφη Ενσωμάτωση**: Η λειτουργία προεπισκόπησης τεκμηριώθηκε σε 4 βασικά αρχεία
- **Πρότυπα Εντολών**: Συνεπής σύνταξη και παραδείγματα σε όλη την τεκμηρίωση
- **Ενσωμάτωση Βέλτιστων Πρακτικών**: Η προεπισκόπηση συμπεριλήφθηκε σε ροές εργασίας επικύρωσης και scripts
- **Οπτικοί Δείκτες**: Σαφείς ενδείξεις ΝΕΑΣ λειτουργίας για ευκολότερη ανακάλυψη

#### Υποδομή Εργαστηρίου
- **Επικοινωνία Κατάστασης**: Επαγγελματική HTML λωρίδα με gradient styling
- **Εμπειρία Χρήστη**: Σαφής ένδειξη κατάστασης ανάπτυξης για να αποφευχθεί σύγχυση
- **Επαγγελματική Παρουσίαση**: Διατηρεί την αξιοπιστία του αποθετηρίου ενώ θέτει σαφείς προσδοκίες
- **Διαφάνεια Χρονοδιαγράμματος**: Χρονοσφραγίδα τελευταίας ενημέρωσης Οκτώβριος 2025 για λογοδοσία

### [v3.3.0] - 2025-09-24

#### Βελτιωμένο Υλικό Εργαστηρίου και Διαδραστική Εμπειρία Μάθησης
**Αυτή η έκδοση εισάγει ολοκληρωμένο υλικό εργαστηρίου με οδηγούς διαδραστικούς στο πρόγραμμα περιήγησης και δομημένες διαδρομές μάθησης.**

#### Προστέθηκε
- **🎥 Interactive Workshop Guide**: Εμπειρία εργαστηρίου στο πρόγραμμα περιήγησης με δυνατότητα προεπισκόπησης MkDocs
- **📝 Structured Workshop Instructions**: Δομημένη διαδρομή μάθησης 7 βημάτων από την ανακάλυψη έως την προσαρμογή
  - 0-Introduction: Επισκόπηση εργαστηρίου και ρύθμιση
  - 1-Select-AI-Template: Διαδικασία ανακάλυψης και επιλογής προτύπου
  - 2-Validate-AI-Template: Διαδικασίες ανάπτυξης και επικύρωσης
  - 3-Deconstruct-AI-Template: Κατανόηση της αρχιτεκτονικής του προτύπου
  - 4-Configure-AI-Template: Διαμόρφωση και εξατομίκευση
  - 5-Customize-AI-Template: Προηγμένες τροποποιήσεις και επαναλήψεις
  - 6-Teardown-Infrastructure: Καθαρισμός και διαχείριση πόρων
  - 7-Wrap-up: Σύνοψη και επόμενα βήματα
- **🛠️ Workshop Tooling**: Ρύθμιση MkDocs με θέμα Material για βελτιωμένη εμπειρία μάθησης
- **🎯 Hands-On Learning Path**: Μεθοδολογία 3 βημάτων (Ανακάλυψη → Ανάπτυξη → Προσαρμογή)
- **📱 GitHub Codespaces Integration**: Απρόσκοπτη ρύθμιση περιβάλλοντος ανάπτυξης

#### Βελτιώθηκε
- **AI Workshop Lab**: Επεκτάθηκε με ολοκληρωμένη δομημένη εμπειρία 2-3 ωρών
- **Τεκμηρίωση Εργαστηρίου**: Επαγγελματική παρουσίαση με πλοήγηση και οπτικά βοηθήματα
- **Πρόοδος Μάθησης**: Σαφής καθοδήγηση βήμα-βήμα από την επιλογή προτύπου έως την ανάπτυξη σε παραγωγή
- **Εμπειρία Προγραμματιστή**: Ενσωματωμένα εργαλεία για ομαλότερες ροές εργασίας ανάπτυξης

#### Βελτιώσεις
- **Προσβασιμότητα**: Διεπαφή στο πρόγραμμα περιήγησης με αναζήτηση, λειτουργία αντιγραφής και εναλλαγή θέματος
- **Αυτορυθμιζόμενη Μάθηση**: Ευέλικτη δομή εργαστηρίου που καλύπτει διαφορετικούς ρυθμούς μάθησης
- **Πρακτική Εφαρμογή**: Σενάρια ανάπτυξης πραγματικών AI προτύπων
- **Ενσωμάτωση Κοινότητας**: Ενσωμάτωση Discord για υποστήριξη και συνεργασία στο εργαστήριο

#### Χαρακτηριστικά Εργαστηρίου
- **Ενσωματωμένη Αναζήτηση**: Γρήγορη εύρεση λέξεων-κλειδιών και μαθημάτων
- **Αντιγραφή Μπλοκ Κώδικα**: Λειτουργία hover-to-copy για όλα τα παραδείγματα κώδικα
- **Εναλλαγή Θέματος**: Υποστήριξη σκοτεινής/ανοιχτής λειτουργίας
- **Οπτικοί Πόροι**: Στιγμιότυπα οθόνης και διαγράμματα για καλύτερη κατανόηση
- **Ενσωμάτωση Βοήθειας**: Άμεση πρόσβαση στο Discord για υποστήριξη από την κοινότητα

### [v3.2.0] - 2025-09-17

#### Μεγάλη Αναδιάρθρωση Πλοήγησης και Σύστημα Μάθησης βάσει Κεφαλαίων
**Αυτή η έκδοση εισάγει ένα ολοκληρωμένο δομημένο σύστημα μάθησης βάσει κεφαλαίων με βελτιωμένη πλοήγηση σε ολόκληρο το αποθετήριο.**

#### Προστέθηκε
- **📚 Σύστημα Μάθησης βάσει Κεφαλαίων**: Αναδιαρθρώθηκε ολόκληρο το μάθημα σε 8 προοδευτικά κεφάλαια μάθησης
  - Κεφάλαιο 1: Βάση & Γρήγορη Εκκίνηση (⭐ - 30-45 λεπτά)
  - Κεφάλαιο 2: AI-First Development (⭐⭐ - 1-2 ώρες)
  - Κεφάλαιο 3: Configuration & Authentication (⭐⭐ - 45-60 λεπτά)
  - Κεφάλαιο 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 ώρες)
  - Κεφάλαιο 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 ώρες)
  - Κεφάλαιο 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 ώρα)
  - Κεφάλαιο 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 ώρες)
  - Κεφάλαιο 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 ώρες)
- **📚 Ολοκληρωμένο Σύστημα Πλοήγησης**: Συνεπείς κεφαλίδες και υποσέλιδα πλοήγησης σε όλη την τεκμηρίωση
- **🎯 Παρακολούθηση Προόδου**: Checklist ολοκλήρωσης μαθήματος και σύστημα επαλήθευσης μάθησης
- **🗺️ Καθοδήγηση Διαδρομής Μάθησης**: Σαφή σημεία εισόδου για διαφορετικά επίπεδα εμπειρίας και στόχους
- **🔗 Διασταυρούμενη Πλοήγηση**: Σχετικά κεφάλαια και προαπαιτούμενα σαφώς συνδεδεμένα

#### Βελτιώθηκε
- **Δομή README**: Μετασχηματίστηκε σε δομημένη πλατφόρμα μάθησης με οργάνωση βάσει κεφαλαίων
- **Πλοήγηση Τεκμηρίωσης**: Κάθε σελίδα τώρα περιλαμβάνει πλαίσιο κεφαλαίου και οδηγίες προόδου
- **Οργάνωση Προτύπων**: Παραδείγματα και πρότυπα αντιστοιχίστηκαν σε κατάλληλα κεφάλαια μάθησης
- **Ενσωμάτωση Πόρων**: Cheat sheets, FAQs και study guides συνδεδεμένα με σχετικά κεφάλαια
- **Ενσωμάτωση Εργαστηρίων**: Πρακτικά εργαστήρια αντιστοιχισμένα σε πολλαπλούς μαθησιακούς στόχους κεφαλαίων

#### Αλλαγές
- **Ροή Μάθησης**: Μετακινήθηκε από γραμμική τεκμηρίωση σε ευέλικτο σύστημα μάθησης βάσει κεφαλαίων
- **Τοποθέτηση Διαμόρφωσης**: Ο οδηγός διαμόρφωσης μετατέθηκε ως Κεφάλαιο 3 για καλύτερη ροή μάθησης
- **Ενσωμάτωση Περιεχομένου AI**: Καλύτερη ενσωμάτωση του AI-specific περιεχομένου σε όλη τη μαθησιακή διαδρομή
- **Περιεχόμενο Παραγωγής**: Προηγμένα μοτίβα συγκεντρώθηκαν στο Κεφάλαιο 8 για επιχειρησιακούς εκπαιδευόμενους

#### Βελτιώσεις
- **Εμπειρία Χρήστη**: Σαφή breadcrumbs πλοήγησης και δείκτες προόδου κεφαλαίων
- **Προσβασιμότητα**: Συνεπείς μοτίβο πλοήγησης για ευκολότερη περιήγηση στο μάθημα
- **Επαγγελματική Παρουσίαση**: Δομή τύπου πανεπιστημίου κατάλληλη για ακαδημαϊκή και εταιρική εκπαίδευση
- **Αποδοτικότητα Μάθησης**: Μειωμένος χρόνος εύρεσης σχετικού περιεχομένου μέσω βελτιωμένης οργάνωσης

#### Τεχνική Υλοποίηση
- **Κεφαλίδες Πλοήγησης**: Τυποποιημένη πλοήγηση κεφαλαίων σε 40+ αρχεία τεκμηρίωσης
- **Υποσέλιδο Πλοήγησης**: Συνεπής καθοδήγηση προόδου και δείκτες ολοκλήρωσης κεφαλαίων
- **Διασταυρούμενοι Σύνδεσμοι**: Ολοκληρωμένο σύστημα εσωτερικών συνδέσμων που συνδέει συναφή θέματα
- **Χαρτογράφηση Κεφαλαίων**: Πρότυπα και παραδείγματα σαφώς συνδεδεμένα με μαθησιακούς στόχους

#### Ενίσχυση Study Guide
- **📚 Ολοκληρωμένοι Μαθησιακοί Στόχοι**: Αναδιαρθρωμένος οδηγός με ευθυγράμμιση στο σύστημα 8 κεφαλαίων
- **🎯 Αξιολόγηση βάσει Κεφαλαίων**: Κάθε κεφάλαιο περιλαμβάνει συγκεκριμένους μαθησιακούς στόχους και πρακτικές ασκήσεις
- **📋 Παρακολούθηση Προόδου**: Εβδομαδιαίο πρόγραμμα μάθησης με μετρήσιμα αποτελέσματα και checklists ολοκλήρωσης
- **❓ Ερωτήσεις Αξιολόγησης**: Ερωτήσεις επαλήθευσης γνώσεων για κάθε κεφάλαιο με επαγγελματικά αποτελέσματα
- **🛠️ Πρακτικές Ασκήσεις**: Πρακτικές δραστηριότητες με σενάρια πραγματικής ανάπτυξης και αντιμετώπισης προβλημάτων
- **📊 Πρόοδος Δεξιοτήτων**: Σαφής πρόοδος από βασικές έννοιες σε επιχειρησιακά μοτίβα με εστίαση στην επαγγελματική ανάπτυξη
- **🎓 Πλαίσιο Πιστοποίησης**: Αποτελέσματα επαγγελματικής εξέλιξης και αναγνώριση από την κοινότητα
- **⏱️ Διαχείριση Χρονοδιαγράμματος**: Δομημένο 10-εβδομάδων πρόγραμμα μάθησης με επικύρωση οροσήμων

### [v3.1.0] - 2025-09-17

#### Βελτιωμένες Λύσεις Multi-Agent AI
**Αυτή η έκδοση βελτιώνει τη λύση λιανικής με πολλούς πράκτορες με καλύτερη ονοματοδοσία πρακτόρων και βελτιωμένη τεκμηρίωση.**

#### Αλλαγές
- **Ορολογία Multi-Agent**: Αντικαταστάθηκε "Cora agent" με "Customer agent" σε όλη τη λύση λιανικής πολλαπλών πρακτόρων για μεγαλύτερη σαφήνεια
- **Αρχιτεκτονική Πρακτόρων**: Ενημερώθηκε όλη η τεκμηρίωση, τα ARM templates και τα παραδείγματα κώδικα για να χρησιμοποιούν τη συνεπή ονοματοδοσία "Customer agent"
- **Παραδείγματα Διαμόρφωσης**: Εμφανίστηκαν σύγχρονα πρότυπα διαμόρφωσης πρακτόρων με ενημερωμένες συμβάσεις ονοματοδοσίας
- **Συνέπεια Τεκμηρίωσης**: Διασφαλίστηκε ότι όλες οι αναφορές χρησιμοποιούν επαγγελματικά, περιγραφικά ονόματα πρακτόρων

#### Βελτιώθηκε
- **Πακέτο ARM Template**: Ενημέρωση retail-multiagent-arm-template με αναφορές σε Customer agent
- **Διαγράμματα Αρχιτεκτονικής**: Ανανεωμένα διαγράμματα Mermaid με ενημερωμένη ονοματοδοσία πρακτόρων
- **Παραδείγματα Κώδικα**: Κλάσεις Python και παραδείγματα υλοποίησης πλέον χρησιμοποιούν CustomerAgent naming
- **Μεταβλητές Περιβάλλοντος**: Ενημέρωση όλων των scripts ανάπτυξης για χρήση των CUSTOMER_AGENT_NAME conventions

#### Βελτιώσεις
- **Εμπειρία Προγραμματιστή**: Πιο σαφείς ρόλοι και ευθύνες πρακτόρων στην τεκμηρίωση
- **Ετοιμότητα Παραγωγής**: Καλύτερη ευθυγράμμιση με ονοματοδοσίες επιχείρησης
- **Υλικό Μάθησης**: Πιο διαισθητική ονοματοδοσία πρακτόρων για εκπαιδευτικούς σκοπούς
- **Χρηστικότητα Προτύπων**: Απλούστερη κατανόηση των λειτουργιών πρακτόρων και μοτίβων ανάπτυξης

#### Τεχνικές Λεπτομέρειες
- Ενημερωμένα διαγράμματα Mermaid αρχιτεκτονικής με αναφορές CustomerAgent
- Αντικατάσταση ονομάτων κλάσεων CoraAgent με CustomerAgent σε παραδείγματα Python
- Τροποποίηση των ARM template JSON ρυθμίσεων για χρήση τύπου πράκτορα "customer"
- Ενημέρωση μεταβλητών περιβάλλοντος από CORA_AGENT_* σε CUSTOMER_AGENT_* πρότυπα
- Ανανέωση όλων των εντολών ανάπτυξης και ρυθμίσεων κοντέινερ

### [v3.0.0] - 2025-09-12

#### Μεγάλες Αλλαγές - Εστίαση στον AI Developer και Ενσωμάτωση Microsoft Foundry
**Αυτή η έκδοση μετατρέπει το αποθετήριο σε ένα ολοκληρωμένο εκπαιδευτικό πόρο επικεντρωμένο στο AI με ενσωμάτωση Microsoft Foundry.**

#### Προστέθηκε
- **🤖 AI-First Learning Path**: Πλήρης αναδιάρθρωση με προτεραιότητα σε AI developers και engineers
- **Microsoft Foundry Integration Guide**: Ολοκληρωμένη τεκμηρίωση για τη σύνδεση του AZD με υπηρεσίες Microsoft Foundry
- **AI Model Deployment Patterns**: Λεπτομερής οδηγός που καλύπτει επιλογή μοντέλων, διαμόρφωση και στρατηγικές ανάπτυξης σε παραγωγή
- **AI Workshop Lab**: Εργαστήριο πρακτικής 2-3 ωρών για τη μετατροπή εφαρμογών AI σε λύσεις αναπτύξιμες με AZD
- **Production AI Best Practices**: Σχέδια έτοιμα για επιχειρήσεις για κλιμάκωση, παρακολούθηση και ασφάλιση φορτίων εργασίας AI
- **AI-Specific Troubleshooting Guide**: Περιεκτικός οδηγός αντιμετώπισης προβλημάτων για Microsoft Foundry Models, Cognitive Services και ζητήματα ανάπτυξης AI
- **AI Template Gallery**: Επιλεγμένη συλλογή προτύπων Microsoft Foundry με βαθμολογίες πολυπλοκότητας
- **Workshop Materials**: Πλήρης δομή εργαστηρίου με εργαστήρια πρακτικής και υλικά αναφοράς

#### Enhanced
- **README Structure**: Εστιασμένο σε προγραμματιστές AI με δεδομένα κοινοτικής ενδιαφέροντος 45% από το Microsoft Foundry Discord
- **Learning Paths**: Αφιερωμένη διαδρομή προγραμματιστή AI παράλληλα με παραδοσιακές διαδρομές για φοιτητές και μηχανικούς DevOps
- **Template Recommendations**: Επιλεγμένα πρότυπα AI συμπεριλαμβανομένων των azure-search-openai-demo, contoso-chat και openai-chat-app-quickstart
- **Community Integration**: Ενισχυμένη υποστήριξη στην κοινότητα Discord με κανάλια και συζητήσεις ειδικά για AI

#### Security & Production Focus
- **Managed Identity Patterns**: Αυτοματοποιημένα μοτίβα πιστοποίησης και ρυθμίσεις ασφάλειας ειδικά για AI
- **Cost Optimization**: Παρακολούθηση χρήσης tokens και έλεγχοι προϋπολογισμού για φορτία εργασίας AI
- **Multi-Region Deployment**: Στρατηγικές για παγκόσμια ανάπτυξη εφαρμογών AI
- **Performance Monitoring**: Μετρικές ειδικές για AI και ενσωμάτωση με Application Insights

#### Documentation Quality
- **Linear Course Structure**: Λογική πρόοδος από αρχάριους σε προχωρημένα μοτίβα ανάπτυξης AI
- **Validated URLs**: Όλοι οι εξωτερικοί σύνδεσμοι αποθετηρίων επαληθευμένοι και προσβάσιμοι
- **Complete Reference**: Όλοι οι εσωτερικοί σύνδεσμοι τεκμηρίωσης επαληθευμένοι και λειτουργικοί
- **Production Ready**: Σχέδια ανάπτυξης για επιχειρήσεις με πραγματικά παραδείγματα

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: Όλες οι σελίδες τεκμηρίωσης πλέον περιλαμβάνουν Εισαγωγή, Στόχους Μάθησης και Αποτελέσματα Μάθησης
- **Navigation System**: Προστέθηκαν σύνδεσμοι Previous/Next μάθημα σε όλη την τεκμηρίωση για καθοδηγούμενη πρόοδο μάθησης
- **Study Guide**: Περιεκτικό study-guide.md με μαθησιακούς στόχους, ασκήσεις πρακτικής και υλικά αξιολόγησης
- **Professional Presentation**: Αφαιρέθηκαν όλα τα εικονίδια emoji για βελτιωμένη προσβασιμότητα και επαγγελματική εμφάνιση
- **Enhanced Content Structure**: Βελτιωμένη οργάνωση και ροή των μαθησιακών υλικών

#### Changed
- **Documentation Format**: Τυποποιήθηκε όλη η τεκμηρίωση με συνεπή δομή εστιασμένη στη μάθηση
- **Navigation Flow**: Εφαρμόστηκε λογική πρόοδος μέσα από όλα τα μαθησιακά υλικά
- **Content Presentation**: Αφαιρέθηκαν διακοσμητικά στοιχεία υπέρ σαφούς, επαγγελματικής μορφοποίησης
- **Link Structure**: Ενημερώθηκαν όλοι οι εσωτερικοί σύνδεσμοι για να υποστηρίξουν το νέο σύστημα πλοήγησης

#### Improved
- **Accessibility**: Αφαιρέθηκαν εξαρτήσεις από emoji για καλύτερη συμβατότητα με ανάγνωστρα οθόνης
- **Professional Appearance**: Καθαρή, ακαδημαϊκού τύπου παρουσίαση κατάλληλη για εταιρική μάθηση
- **Learning Experience**: Δομημένη προσέγγιση με σαφείς στόχους και αποτελέσματα για κάθε μάθημα
- **Content Organization**: Καλύτερη λογική ροή και σύνδεση μεταξύ σχετικών θεμάτων

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Πλήρης σειρά οδηγών getting-started
  - Περιεκτική τεκμηρίωση ανάπτυξης και παροχής
  - Λεπτομερείς πόροι αντιμετώπισης προβλημάτων και οδηγοί αποσφαλμάτωσης
  - Εργαλεία και διαδικασίες προεπιβεβαίωσης πριν την ανάπτυξη

- **Getting Started Module**
  - AZD Basics: Βασικές έννοιες και ορολογία
  - Installation Guide: Οδηγίες εγκατάστασης ανά πλατφόρμα
  - Configuration Guide: Ρύθμιση περιβάλλοντος και πιστοποίηση
  - First Project Tutorial: Βήμα-βήμα πρακτική εκμάθηση

- **Deployment and Provisioning Module**
  - Deployment Guide: Πλήρης τεκμηρίωση ροής εργασιών
  - Provisioning Guide: Infrastructure as Code με Bicep
  - Καλές πρακτικές για αναπτύξεις παραγωγής
  - Σχέδια αρχιτεκτονικής πολλαπλών υπηρεσιών

- **Pre-deployment Validation Module**
  - Capacity Planning: Επαλήθευση διαθεσιμότητας πόρων Azure
  - SKU Selection: Οδηγίες για επιλογή επιπέδου υπηρεσίας
  - Pre-flight Checks: Αυτοματοποιημένα scripts επαλήθευσης (PowerShell και Bash)
  - Εκτιμήσεις κόστους και εργαλεία προγραμματισμού προϋπολογισμού

- **Troubleshooting Module**
  - Common Issues: Συχνά προβλήματα και λύσεις
  - Debugging Guide: Συστηματικές μεθοδολογίες αντιμετώπισης σφαλμάτων
  - Προχωρημένες τεχνικές και εργαλεία διαγνωστικής
  - Παρακολούθηση απόδοσης και βελτιστοποίηση

- **Resources and References**
  - Command Cheat Sheet: Γρήγορη αναφορά για βασικές εντολές
  - Glossary: Περιεκτικοί ορισμοί όρων και ακρωνύμιων
  - FAQ: Αναλυτικές απαντήσεις σε συνηθισμένες ερωτήσεις
  - Σύνδεσμοι εξωτερικών πόρων και συνδέσεις με κοινότητα

- **Examples and Templates**
  - Παράδειγμα απλής Web εφαρμογής
  - Πρότυπο ανάπτυξης στατικού ιστότοπου
  - Ρυθμίσεις εφαρμογής με containers
  - Σχέδια ενσωμάτωσης βάσης δεδομένων
  - Παραδείγματα αρχιτεκτονικής microservices
  - Υλοποιήσεις serverless functions

#### Features
- **Multi-Platform Support**: Οδηγοί εγκατάστασης και ρύθμισης για Windows, macOS και Linux
- **Multiple Skill Levels**: Περιεχόμενο σχεδιασμένο για φοιτητές μέχρι επαγγελματίες προγραμματιστές
- **Practical Focus**: Παραδείγματα πρακτικής και σενάρια πραγματικού κόσμου
- **Comprehensive Coverage**: Από βασικές έννοιες μέχρι προχωρημένα μοτίβα για επιχειρήσεις
- **Security-First Approach**: Βέλτιστες πρακτικές ασφάλειας ενσωματωμένες παντού
- **Cost Optimization**: Κατευθύνσεις για οικονομικά αποδοτικές αναπτύξεις και διαχείριση πόρων

#### Documentation Quality
- **Detailed Code Examples**: Πρακτικά, ελεγμένα παραδείγματα κώδικα
- **Step-by-Step Instructions**: Σαφείς, εφαρμόσιμες οδηγίες
- **Comprehensive Error Handling**: Αντιμετώπιση σφαλμάτων για κοινά ζητήματα
- **Best Practices Integration**: Βιομηχανικά πρότυπα και συστάσεις
- **Version Compatibility**: Ενημερωμένο με τις τελευταίες υπηρεσίες Azure και δυνατότητες azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Πρότυπα ενσωμάτωσης για Hugging Face, Azure Machine Learning και προσαρμοσμένα μοντέλα
- **AI Agent Frameworks**: Πρότυπα για LangChain, Semantic Kernel και AutoGen αναπτύξεις
- **Advanced RAG Patterns**: Επιλογές βάσεων δεδομένων διανυσμάτων πέραν του Azure AI Search (Pinecone, Weaviate κ.λπ.)
- **AI Observability**: Ενισχυμένη παρακολούθηση για απόδοση μοντέλου, χρήση tokens και ποιότητα απάντησης

#### Developer Experience
- **VS Code Extension**: Ενοποιημένη εμπειρία ανάπτυξης AZD + Microsoft Foundry στο VS Code
- **GitHub Copilot Integration**: Βοηθούμενη από AI δημιουργία προτύπων AZD
- **Interactive Tutorials**: Πρακτικές ασκήσεις κώδικα με αυτοματοποιημένη επαλήθευση για σενάρια AI
- **Video Content**: Συμπληρωματικά βίντεο-μαθήματα για οπτικούς μαθητές με έμφαση σε αναπτύξεις AI

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Διακυβέρνηση μοντέλων AI, συμμόρφωση και ιχνηλασιμότητα ελέγχου
- **Multi-Tenant AI**: Μοτίβα για την εξυπηρέτηση πολλαπλών πελατών με απομονωμένες υπηρεσίες AI
- **Edge AI Deployment**: Ενσωμάτωση με Azure IoT Edge και container instances
- **Hybrid Cloud AI**: Πολυ-νεφο- και υβριδικά μοτίβα ανάπτυξης για φορτία εργασίας AI

#### Advanced Features
- **AI Pipeline Automation**: Ενοποίηση MLOps με pipelines του Azure Machine Learning
- **Advanced Security**: Μοτίβα μηδενικής εμπιστοσύνης, private endpoints και προηγμένη προστασία από απειλές
- **Performance Optimization**: Προχωρημένη ρύθμιση και στρατηγικές κλιμάκωσης για εφαρμογές AI με υψηλό throughput
- **Global Distribution**: Πρότυπα παράδοσης περιεχομένου και cache στο edge για εφαρμογές AI

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Περιεκτική ενσωμάτωση Microsoft Foundry (Ολοκληρώθηκε)
- ✅ **Interactive Tutorials**: Εργαστήριο πρακτικής AI (Ολοκληρώθηκε)
- ✅ **Advanced Security Module**: Ασφάλεια ειδική για AI (Ολοκληρώθηκε)
- ✅ **Performance Optimization**: Στρατηγικές ρύθμισης φορτίων εργασίας AI (Ολοκληρώθηκε)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: Σενάρια ανάπτυξης εστιασμένα σε AI (Ολοκληρώθηκε)
- ✅ **Extended FAQ**: Ερωτήσεις και αντιμετώπιση προβλημάτων ειδικά για AI (Ολοκληρώθηκε)
- **Tool Integration**: Ενισχυμένοι οδηγοί ενσωμάτωσης IDE και επεξεργαστών
- ✅ **Monitoring Expansion**: Επεκτάσεις παρακολούθησης και ειδοποίησης ειδικές για AI (Ολοκληρώθηκε)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Responsive σχεδίαση για μάθηση από κινητές συσκευές
- **Offline Access**: Πακέτα τεκμηρίωσης διαθέσιμα για λήψη
- **Enhanced IDE Integration**: Επέκταση VS Code για ροές εργασίας AZD + AI
- **Community Dashboard**: Πίνακας εργαλείων με μετρήσεις κοινότητας σε πραγματικό χρόνο και παρακολούθηση συνεισφορών

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Αναφέρετε προβλήματα ή προτείνετε βελτιώσεις (ζητήματα ειδικά για AI ευπρόσδεκτα)
- **Discord Discussions**: Μοιραστείτε ιδέες και συμμετέχετε με την κοινότητα Microsoft Foundry
- **Pull Requests**: Συνεισφέρετε άμεσες βελτιώσεις στο περιεχόμενο, ειδικά πρότυπα και οδηγοί AI
- **Microsoft Foundry Discord**: Συμμετάσχετε στο κανάλι #Azure για συζητήσεις AZD + AI
- **Community Forums**: Συμμετέχετε σε ευρύτερες συζητήσεις προγραμματιστών Azure

### Feedback Categories
- **AI Content Accuracy**: Διορθώσεις στην ενσωμάτωση υπηρεσιών AI και πληροφορίες ανάπτυξης
- **Learning Experience**: Προτάσεις για βελτίωση της ροής μάθησης για προγραμματιστές AI
- **Missing AI Content**: Αιτήματα για επιπλέον πρότυπα, μοτίβα ή παραδείγματα AI
- **Accessibility**: Βελτιώσεις για διαφορετικές μαθησιακές ανάγκες
- **AI Tool Integration**: Προτάσεις για καλύτερη ενσωμάτωση εργαλείων ανάπτυξης AI
- **Production AI Patterns**: Αιτήματα για μοτίβα ανάπτυξης AI σε επιχειρησιακά περιβάλλοντα

### Response Commitment
- **Issue Response**: Εντός 48 ωρών για αναφερόμενα προβλήματα
- **Feature Requests**: Αξιολόγηση εντός μίας εβδομάδας
- **Community Contributions**: Ανασκόπηση εντός μίας εβδομάδας
- **Security Issues**: Άμεση προτεραιότητα με επιταχυνόμενη απάντηση

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Ακρίβεια περιεχομένου και επαλήθευση συνδέσμων
- **Quarterly Updates**: Σημαντικές προσθήκες περιεχομένου και βελτιώσεις
- **Semi-Annual Reviews**: Περιεκτικές αναδιαρθρώσεις και βελτιώσεις
- **Annual Releases**: Μεγάλες εκδόσεις με σημαντικές βελτιώσεις

### Monitoring and Quality Assurance
- **Automated Testing**: Τακτική επαλήθευση παραδειγμάτων κώδικα και συνδέσμων
- **Community Feedback Integration**: Τακτική ενσωμάτωση προτάσεων χρηστών
- **Technology Updates**: Ευθυγράμμιση με τις τελευταίες υπηρεσίες Azure και εκδόσεις azd
- **Accessibility Audits**: Τακτική ανασκόπηση για αρχές σχεδίασης χωρίς αποκλεισμούς

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Πλήρης υποστήριξη με τακτικές ενημερώσεις
- **Previous Major Version**: Ενημερώσεις ασφάλειας και κρίσιμες διορθώσεις για 12 μήνες
- **Legacy Versions**: Μόνο υποστήριξη από την κοινότητα, χωρίς επίσημες ενημερώσεις

### Migration Guidance
When major versions are released, we provide:
- **Migration Guides**: Βήμα-βήμα οδηγίες μετάβασης
- **Compatibility Notes**: Λεπτομέρειες για αλλαγές που προκαλούν σπασίματα συμβατότητας
- **Tool Support**: Scripts ή βοηθητικά εργαλεία για υποβοήθηση μετανάστευσης
- **Community Support**: Αφιερωμένα φόρουμ για ερωτήσεις μετανάστευσης

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Επιστροφή στο [Main README](README.md)

**Stay Updated**: Παρακολουθήστε αυτό το αποθετήριο για ειδοποιήσεις σχετικά με νέες εκδόσεις και σημαντικές ενημερώσεις στα μαθησιακά υλικά.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->