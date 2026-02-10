# Συχνές Ερωτήσεις (FAQ)

**Λάβετε Βοήθεια ανά Κεφάλαιο**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD για Αρχάριους](../README.md)
- **🚆 Προβλήματα Εγκατάστασης**: [Κεφάλαιο 1: Εγκατάσταση & Ρυθμίσεις](../docs/getting-started/installation.md)
- **🤖 Ερωτήσεις για AI**: [Κεφάλαιο 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Αντιμετώπιση Προβλημάτων**: [Κεφάλαιο 7: Αντιμετώπιση & Αποσφαλμάτωση](../docs/troubleshooting/common-issues.md)

## Εισαγωγή

Αυτό το ολοκληρωμένο FAQ παρέχει απαντήσεις στις πιο συνηθισμένες ερωτήσεις σχετικά με το Azure Developer CLI (azd) και τις αναπτύξεις στο Azure. Βρείτε γρήγορες λύσεις για κοινά προβλήματα, κατανοήστε βέλτιστες πρακτικές και λάβετε διευκρινίσεις για έννοιες και ροές εργασίας του azd.

## Στόχοι Μάθησης

Μελετώντας αυτό το FAQ, θα:
- Βρείτε γρήγορες απαντήσεις σε κοινές ερωτήσεις και προβλήματα του Azure Developer CLI
- Κατανοήσετε βασικές έννοιες και ορολογία μέσω πρακτικών ερωτήσεων & απαντήσεων
- Έχετε πρόσβαση σε λύσεις αντιμετώπισης προβλημάτων για συχνά σενάρια σφαλμάτων
- Μάθετε βέλτιστες πρακτικές μέσω συχνά ζητούμενων ερωτήσεων για βελτιστοποίηση
- Ανακαλύψετε προχωρημένα χαρακτηριστικά και δυνατότητες μέσω ερωτήσεων σε επίπεδο ειδικών
- Συμβουλευτείτε οδηγίες για κόστη, ασφάλεια και στρατηγική ανάπτυξης αποτελεσματικά

## Αποτελέσματα Μάθησης

Με τακτική αναφορά σε αυτό το FAQ, θα μπορείτε να:
- Επίλυση κοινών προβλημάτων του Azure Developer CLI ανεξάρτητα χρησιμοποιώντας τις παρεχόμενες λύσεις
- Λαμβάνετε τεκμηριωμένες αποφάσεις για στρατηγικές και ρυθμίσεις ανάπτυξης
- Κατανοείτε τη σχέση μεταξύ του azd και άλλων εργαλείων και υπηρεσιών Azure
- Εφαρμόζετε βέλτιστες πρακτικές βάσει εμπειρίας της κοινότητας και συστάσεων ειδικών
- Αντιμετωπίζετε προβλήματα αυθεντικοποίησης, ανάπτυξης και ρύθμισης αποτελεσματικά
- Βελτιστοποιείτε κόστη και απόδοση χρησιμοποιώντας γνώσεις και προτάσεις από το FAQ

## Περιεχόμενα

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) είναι ένα εργαλείο γραμμής εντολών προσανατολισμένο στον προγραμματιστή που επιταχύνει τον χρόνο που χρειάζεστε για να μεταφέρετε την εφαρμογή σας από το τοπικό περιβάλλον ανάπτυξης στο Azure. Παρέχει βέλτιστες πρακτικές μέσω προτύπων και βοηθά σε όλο τον κύκλο ζωής της ανάπτυξης.

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Εργαλείο γενικής χρήσης για τη διαχείριση πόρων Azure
- **azd**: Εργαλείο εστιασμένο στον προγραμματιστή για ροές εργασίας ανάπτυξης εφαρμογών
- azd χρησιμοποιεί το Azure CLI εσωτερικά αλλά παρέχει αφαιρέσεις υψηλότερου επιπέδου για κοινά σενάρια ανάπτυξης
- azd περιλαμβάνει πρότυπα, διαχείριση περιβαλλόντων και αυτοματοποίηση ανάπτυξης

### Q: Do I need Azure CLI installed to use azd?
**A**: Ναι, το azd απαιτεί το Azure CLI για αυθεντικοποίηση και ορισμένες λειτουργίες. Εγκαταστήστε πρώτα το Azure CLI και στη συνέχεια εγκαταστήστε το azd.

### Q: What programming languages does azd support?
**A**: Το azd είναι ανεξάρτητο από γλώσσα. Λειτουργεί με:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Στατικές ιστοσελίδες
- Εφαρμογές σε κοντέινερ

### Q: Can I use azd with existing projects?
**A**: Ναι! Μπορείτε είτε:
1. Να χρησιμοποιήσετε `azd init` για να προσθέσετε ρυθμίσεις azd σε υπάρχοντα έργα
2. Να προσαρμόσετε υπάρχοντα έργα ώστε να ταιριάξουν στη δομή προτύπου του azd
3. Να δημιουργήσετε προσαρμοσμένα πρότυπα βασισμένα στην υπάρχουσα αρχιτεκτονική σας

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: Χρησιμοποιήστε `azd auth login` το οποίο θα ανοίξει ένα παράθυρο προγράμματος περιήγησης για αυθεντικοποίηση στο Azure. Για σενάρια CI/CD, χρησιμοποιήστε service principals ή managed identities.

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Ναι. Χρησιμοποιήστε `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` για να καθορίσετε ποια συνδρομή θα χρησιμοποιείται για κάθε περιβάλλον.

### Q: What permissions do I need to deploy with azd?
**A**: Συνήθως χρειάζεστε:
- **Contributor** ρόλο στην ομάδα πόρων ή στη συνδρομή
- **User Access Administrator** εάν αναπτύσσετε πόρους που απαιτούν ανάθεση ρόλων
- Οι συγκεκριμένες άδειες ποικίλλουν ανάλογα με το πρότυπο και τους πόρους που αναπτύσσονται

### Q: Can I use azd in CI/CD pipelines?
**A**: Απολύτως! Το azd έχει σχεδιαστεί για ενσωμάτωση σε CI/CD. Χρησιμοποιήστε service principals για αυθεντικοποίηση και ορίστε μεταβλητές περιβάλλοντος για ρύθμιση.

### Q: How do I handle authentication in GitHub Actions?
**A**: Χρησιμοποιήστε την ενέργεια Azure Login με διαπιστευτήρια service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- Επίσημα πρότυπα: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Πρότυπα κοινότητας: Αναζήτηση στο GitHub για "azd-template"
- Χρησιμοποιήστε `azd template list` για να περιηγηθείτε στα διαθέσιμα πρότυπα

### Q: How do I create a custom template?
**A**: 
1. Ξεκινήστε με μια υπάρχουσα δομή προτύπου
2. Τροποποιήστε το `azure.yaml`, αρχεία υποδομής και τον κώδικα εφαρμογής
3. Δοκιμάστε διεξοδικά με `azd up`
4. Δημοσιεύστε στο GitHub με κατάλληλες ετικέτες

### Q: Can I use azd without a template?
**A**: Ναι, χρησιμοποιήστε `azd init` σε ένα υπάρχον έργο για να δημιουργήσετε τα απαιτούμενα αρχεία ρύθμισης. Θα χρειαστεί να ρυθμίσετε χειροκίνητα το `azure.yaml` και τα αρχεία υποδομής.

### Q: What's the difference between official and community templates?
**A**: 
- **Επίσημα πρότυπα**: Συντηρούνται από τη Microsoft, ενημερώνονται τακτικά, πλήρης τεκμηρίωση
- **Πρότυπα κοινότητας**: Δημιουργούνται από προγραμματιστές, μπορεί να έχουν εξειδικευμένες χρήσεις, ποικίλη ποιότητα και συντήρηση

### Q: How do I update a template in my project?
**A**: Τα πρότυπα δεν ενημερώνονται αυτόματα. Μπορείτε:
1. Να συγκρίνετε και να συγχωνεύσετε χειροκίνητα αλλαγές από το πρότυπο πηγής
2. Να ξεκινήσετε εκ νέου με `azd init` χρησιμοποιώντας το ενημερωμένο πρότυπο
3. Να επιλέξετε συγκεκριμένες βελτιώσεις από τα ενημερωμένα πρότυπα

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: Το azd μπορεί να αναπτύξει οποιαδήποτε υπηρεσία Azure μέσω Bicep/ARM προτύπων, συμπεριλαμβανομένων:
- App Services, Container Apps, Functions
- Βάσεις δεδομένων (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Δίκτυα, ασφάλεια και εργαλεία παρακολούθησης

### Q: Can I deploy to multiple regions?
**A**: Ναι, ρυθμίστε πολλαπλές περιοχές στα Bicep πρότυπά σας και ορίστε ανάλογα την παράμετρο location για κάθε περιβάλλον.

### Q: How do I handle database schema migrations?
**A**: Χρησιμοποιήστε hooks ανάπτυξης στο `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: Ναι, χρησιμοποιήστε `azd provision` για να αναπτύξετε μόνο τα στοιχεία υποδομής που ορίζονται στα πρότυπά σας.

### Q: How do I deploy to existing Azure resources?
**A**: Αυτό είναι σύνθετο και δεν υποστηρίζεται άμεσα. Μπορείτε:
1. Να εισαγάγετε υπάρχοντες πόρους στα Bicep πρότυπα σας
2. Να χρησιμοποιήσετε αναφορές σε υπάρχοντες πόρους στα πρότυπα
3. Να τροποποιήσετε τα πρότυπα ώστε να δημιουργούν ή να αναφέρονται σε πόρους υπό προϋποθέσεις

### Q: Can I use Terraform instead of Bicep?
**A**: Προς το παρόν, το azd υποστηρίζει κυρίως Bicep/ARM πρότυπα. Η υποστήριξη για Terraform δεν είναι επίσημα διαθέσιμη, αν και μπορεί να υπάρχουν λύσεις της κοινότητας.

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: Δημιουργήστε ξεχωριστά περιβάλλοντα με `azd env new <environment-name>` και ρυθμίστε διαφορετικές ρυθμίσεις για κάθε ένα:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: Στο φάκελο `.azure` μέσα στον κατάλογο του έργου σας. Κάθε περιβάλλον έχει τον δικό του φάκελο με αρχεία ρύθμισης.

### Q: How do I set environment-specific configuration?
**A**: Χρησιμοποιήστε `azd env set` για να ρυθμίσετε μεταβλητές περιβάλλοντος:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: Ο φάκελος `.azure` περιέχει ευαίσθητες πληροφορίες και δεν πρέπει να προστεθεί στον έλεγχο έκδοσης. Αντίθετα:
1. Τεκμηριώστε τις απαιτούμενες μεταβλητές περιβάλλοντος
2. Χρησιμοποιήστε σενάρια ανάπτυξης για να ρυθμίσετε τα περιβάλλοντα
3. Χρησιμοποιήστε Azure Key Vault για ευαίσθητες ρυθμίσεις

### Q: How do I override template defaults?
**A**: Ορίστε μεταβλητές περιβάλλοντος που αντιστοιχούν σε παραμέτρους προτύπου:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: Συνηθισμένοι λόγοι:
1. **Προβλήματα αυθεντικοποίησης**: Εκτελέστε `azd auth login`
2. **Ανεπαρκείς άδειες**: Ελέγξτε τις αναθέσεις ρόλων στο Azure
3. **Σύγκρουση ονομάτων πόρων**: Αλλάξτε το AZURE_ENV_NAME
4. **Προβλήματα όγκου/ποσόστωσης**: Ελέγξτε τη διαθεσιμότητα ανά περιοχή
5. **Σφάλματα προτύπων**: Επικυρώστε τα Bicep πρότυπα

### Q: How do I debug deployment failures?
**A**: 
1. Χρησιμοποιήστε `azd deploy --debug` για λεπτομερή έξοδο
2. Ελέγξτε το ιστορικό αναπτύξεων στο Azure portal
3. Ανασκοπήστε το Activity Log στο Azure portal
4. Χρησιμοποιήστε `azd show` για να εμφανίσετε την τρέχουσα κατάσταση του περιβάλλοντος

### Q: Why are my environment variables not working?
**A**: Ελέγξτε:
1. Τα ονόματα των μεταβλητών να ταιριάζουν ακριβώς με τις παραμέτρους του προτύπου
2. Οι τιμές να είναι σωστά σε εισαγωγικά αν περιέχουν κενά
3. Το περιβάλλον να είναι επιλεγμένο: `azd env select <environment>`
4. Οι μεταβλητές να έχουν οριστεί στο σωστό περιβάλλον

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
Αυτό αφαιρεί όλους τους πόρους και τη ρύθμιση του περιβάλλοντος.

### Q: Why is my application not accessible after deployment?
**A**: Ελέγξτε:
1. Η ανάπτυξη ολοκληρώθηκε με επιτυχία
2. Η εφαρμογή εκτελείται (ελέγξτε τα logs στο Azure portal)
3. Τα Network Security Groups επιτρέπουν την κίνηση
4. Τα DNS/προσαρμοσμένα domains είναι ρυθμισμένα σωστά

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: Τα κόστη εξαρτώνται από:
- Τις υπηρεσίες Azure που αναπτύσσονται
- Τα επιλεγμένα επίπεδα υπηρεσιών/SKUs
- Διαφορές τιμολόγησης ανά περιοχή
- Πρότυπα χρήσης

Χρησιμοποιήστε τον [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) για εκτιμήσεις.

### Q: How do I control costs in azd deployments?
**A**: 
1. Χρησιμοποιήστε χαμηλότερα επίπεδα SKUs για περιβάλλοντα ανάπτυξης
2. Ρυθμίστε προϋπολογισμούς και ειδοποιήσεις στο Azure
3. Χρησιμοποιήστε `azd down` για να αφαιρείτε πόρους όταν δεν χρειάζονται
4. Επιλέξτε κατάλληλες περιοχές (τα κόστη διαφέρουν ανά τοποθεσία)
5. Χρησιμοποιήστε εργαλεία Azure Cost Management

### Q: Are there free tier options for azd templates?
**A**: Πολλές υπηρεσίες Azure προσφέρουν δωρεάν επίπεδα:
- App Service: Διαθέσιμο δωρεάν επίπεδο
- Azure Functions: 1M δωρεάν εκτελέσεις/μήνα
- Cosmos DB: Δωρεάν επίπεδο με 400 RU/s
- Application Insights: Τα πρώτα 5GB/μήνα δωρεάν

Διαμορφώστε τα πρότυπα ώστε να χρησιμοποιούν δωρεάν επίπεδα όπου είναι διαθέσιμα.

### Q: How do I estimate costs before deployment?
**A**: 
1. Ελέγξτε το `main.bicep` του προτύπου για να δείτε ποιους πόρους δημιουργεί
2. Χρησιμοποιήστε τον Azure Pricing Calculator με συγκεκριμένα SKUs
3. Αναπτύξτε πρώτα σε περιβάλλον ανάπτυξης για να παρακολουθήσετε πραγματικά κόστη
4. Χρησιμοποιήστε το Azure Cost Management για λεπτομερή ανάλυση κόστους

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. Κρατήστε τον κώδικα εφαρμογής ξεχωριστά από την υποδομή
2. Χρησιμοποιήστε περιγραφικά ονόματα υπηρεσιών στο `azure.yaml`
3. Εφαρμόστε σωστή διαχείριση σφαλμάτων στα build scripts
4. Χρησιμοποιήστε ρυθμίσεις ανά περιβάλλον
5. Συμπεριλάβετε πλήρη τεκμηρίωση

### Q: How should I organize multiple services in azd?
**A**: Χρησιμοποιήστε τη συνιστώμενη δομή:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Should I commit the `.azure` folder to version control?
**A**: **Όχι!** Ο φάκελος `.azure` περιέχει ευαίσθητες πληροφορίες. Προσθέστε τον στο `.gitignore`:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. Χρησιμοποιήστε Azure Key Vault για μυστικά
2. Αναφερθείτε στα μυστικά του Key Vault στη ρύθμιση της εφαρμογής
3. Μην δεσμεύετε ποτέ μυστικά στον έλεγχο έκδοσης
4. Χρησιμοποιήστε managed identities για αυθεντικοποίηση υπηρεσίας προς υπηρεσία

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. Χρησιμοποιήστε ξεχωριστά περιβάλλοντα για κάθε στάδιο (dev/staging/prod)
2. Εφαρμόστε αυτοματοποιημένες δοκιμές πριν την ανάπτυξη
3. Χρησιμοποιήστε service principals για αυθεντικοποίηση
4. Αποθηκεύστε ευαίσθητες ρυθμίσεις στα μυστικά/μεταβλητές των pipeline
5. Εφαρμόστε πύλες έγκρισης για αναπτύξεις σε παραγωγή

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: Ναι, μέσω hooks ανάπτυξης στο `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. Χρησιμοποιήστε εντολές azd σε υπάρχοντα σενάρια pipeline
2. Τυποποιήστε τα πρότυπα azd σε ομάδες
3. Ενσωματώστε με υπάρχοντα εργαλεία παρακολούθησης και ειδοποίησης
4. Χρησιμοποιήστε το JSON output του azd για ενσωμάτωση σε pipeline

### Q: Can I use azd with Azure DevOps?
**A**: Ναι, το azd λειτουργεί με οποιοδήποτε σύστημα CI/CD. Δημιουργήστε Azure DevOps pipelines που χρησιμοποιούν εντολές azd.

### Q: How do I contribute to azd or create community templates?
**A**:
1. **εργαλείο azd**: Συνεισφέρετε στο [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Πρότυπα**: Δημιουργήστε πρότυπα σύμφωνα με τις [οδηγίες προτύπων](https://github.com/Azure-Samples/awesome-azd)
3. **Τεκμηρίωση**: Συνεισφέρετε στα docs στο [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Ερώτηση: Ποιος είναι ο οδικός χάρτης για το azd;
**Α**: Ελέγξτε τον [επίσημο οδικό χάρτη](https://github.com/Azure/azure-dev/projects) για προγραμματισμένες δυνατότητες και βελτιώσεις.

### Ερώτηση: Πώς να μεταφερθώ από άλλα εργαλεία ανάπτυξης στο azd;
**Α**: 
1. Αναλύστε την τρέχουσα αρχιτεκτονική ανάπτυξης
2. Δημιουργήστε αντίστοιχα πρότυπα Bicep
3. Διαμορφώστε `azure.yaml` ώστε να ταιριάζει με τις τρέχουσες υπηρεσίες
4. Δοκιμάστε διεξοδικά στο περιβάλλον ανάπτυξης
5. Μεταφέρετε σταδιακά τα περιβάλλοντα

---

## Έχετε ακόμα ερωτήσεις;

### **Αναζητήστε πρώτα**
- Ελέγξτε την [επίσημη τεκμηρίωση](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Αναζητήστε [GitHub issues](https://github.com/Azure/azure-dev/issues) για παρόμοια προβλήματα

### **Λάβετε βοήθεια**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Υποστήριξη κοινότητας
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Τεχνικές ερωτήσεις
- [Azure Discord](https://discord.gg/azure) - Συνομιλία κοινότητας σε πραγματικό χρόνο

### **Αναφέρετε Προβλήματα**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Αναφορές σφαλμάτων και αιτήματα χαρακτηριστικών
- Συμπεριλάβετε σχετικά αρχεία καταγραφής, μηνύματα σφάλματος και βήματα για την αναπαραγωγή

### **Μάθετε Περισσότερα**
- [Τεκμηρίωση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Κέντρο Αρχιτεκτονικής Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Πλαίσιο Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Αυτό το FAQ ενημερώνεται τακτικά. Τελευταία ενημέρωση: 9 Σεπτεμβρίου 2025*

---

**Πλοήγηση**
- **Προηγούμενο μάθημα**: [Glossary](glossary.md)
- **Επόμενο μάθημα**: [Study Guide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης με τεχνητή νοημοσύνη Co-op Translator (https://github.com/Azure/co-op-translator). Παρότι καταβάλουμε προσπάθειες για ακρίβεια, παρακαλούμε να λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται μετάφραση από επαγγελματία μεταφραστή. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->