<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T22:16:03+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "el"
}
-->
# Οδηγός Μελέτης - AZD Για Αρχάριους

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός μελέτης παρέχει δομημένους μαθησιακούς στόχους, βασικές έννοιες, ασκήσεις πρακτικής και υλικό αξιολόγησης για να σας βοηθήσει να κατακτήσετε το Azure Developer CLI (azd). Χρησιμοποιήστε αυτόν τον οδηγό για να παρακολουθείτε την πρόοδό σας και να βεβαιωθείτε ότι έχετε καλύψει όλα τα βασικά θέματα.

## Στόχοι Μάθησης

Ολοκληρώνοντας αυτόν τον οδηγό μελέτης, θα:
- Κατανοήσετε όλες τις βασικές και προχωρημένες έννοιες του Azure Developer CLI
- Αναπτύξετε πρακτικές δεξιότητες στην ανάπτυξη και διαχείριση εφαρμογών Azure
- Αποκτήσετε αυτοπεποίθηση στην αντιμετώπιση προβλημάτων και τη βελτιστοποίηση αναπτύξεων
- Κατανοήσετε πρακτικές ανάπτυξης έτοιμες για παραγωγή και θέματα ασφαλείας

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση όλων των ενοτήτων αυτού του οδηγού μελέτης, θα μπορείτε να:
- Σχεδιάζετε, αναπτύσσετε και διαχειρίζεστε πλήρεις αρχιτεκτονικές εφαρμογών χρησιμοποιώντας το azd
- Εφαρμόζετε ολοκληρωμένες στρατηγικές παρακολούθησης, ασφάλειας και βελτιστοποίησης κόστους
- Αντιμετωπίζετε σύνθετα προβλήματα ανάπτυξης ανεξάρτητα
- Δημιουργείτε προσαρμοσμένα πρότυπα και συμβάλλετε στην κοινότητα του azd

## Δομή Μαθήματος

### Ενότητα 1: Ξεκινώντας (Εβδομάδες 1-2)

#### Στόχοι Μάθησης
- Κατανοήστε τα βασικά και τις κύριες έννοιες του Azure Developer CLI
- Εγκαταστήστε και ρυθμίστε με επιτυχία το azd στο περιβάλλον ανάπτυξής σας
- Ολοκληρώστε την πρώτη σας ανάπτυξη χρησιμοποιώντας ένα υπάρχον πρότυπο
- Πλοηγηθείτε στη δομή του έργου azd και κατανοήστε τα βασικά στοιχεία

#### Βασικές Έννοιες για Κατανόηση
- Πρότυπα, περιβάλλοντα και υπηρεσίες
- Δομή ρύθμισης azure.yaml
- Βασικές εντολές azd (init, up, down, deploy)
- Αρχές Infrastructure as Code
- Αυθεντικοποίηση και εξουσιοδότηση Azure

#### Ασκήσεις Πρακτικής

**Άσκηση 1.1: Εγκατάσταση και Ρύθμιση**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Άσκηση 1.2: Πρώτη Ανάπτυξη**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Άσκηση 1.3: Ανάλυση Δομής Έργου**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Ερωτήσεις Αυτοαξιολόγησης
1. Ποιες είναι οι τρεις βασικές έννοιες της αρχιτεκτονικής azd;
2. Ποιος είναι ο σκοπός του αρχείου azure.yaml;
3. Πώς βοηθούν τα περιβάλλοντα στη διαχείριση διαφορετικών στόχων ανάπτυξης;
4. Ποιες μέθοδοι αυθεντικοποίησης μπορούν να χρησιμοποιηθούν με το azd;
5. Τι συμβαίνει όταν εκτελείτε `azd up` για πρώτη φορά;

### Ενότητα 2: Ρύθμιση και Περιβάλλοντα (Εβδομάδα 3)

#### Στόχοι Μάθησης
- Κατανοήστε τη διαχείριση και τη ρύθμιση περιβάλλοντος
- Εξοικειωθείτε με προχωρημένες ρυθμίσεις azure.yaml
- Εφαρμόστε ρυθμίσεις και μεταβλητές συγκεκριμένες για περιβάλλοντα
- Ρυθμίστε την αυθεντικοποίηση για διαφορετικά σενάρια

#### Βασικές Έννοιες για Κατανόηση
- Ιεραρχία περιβάλλοντος και προτεραιότητα μεταβλητών
- Ρύθμιση υπηρεσιών και παραμέτρων
- Hooks και γεγονότα κύκλου ζωής
- Μέθοδοι αυθεντικοποίησης (χρήστης, service principal, managed identity)
- Διαχείριση αρχείων ρύθμισης

#### Ασκήσεις Πρακτικής

**Άσκηση 2.1: Ρύθμιση Πολλαπλών Περιβαλλόντων**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Άσκηση 2.2: Προχωρημένη Ρύθμιση**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Άσκηση 2.3: Ρύθμιση Ασφαλείας**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Ερωτήσεις Αυτοαξιολόγησης
1. Πώς χειρίζεται το azd την προτεραιότητα μεταβλητών περιβάλλοντος;
2. Τι είναι τα deployment hooks και πότε πρέπει να τα χρησιμοποιείτε;
3. Πώς ρυθμίζετε διαφορετικά SKUs για διαφορετικά περιβάλλοντα;
4. Ποιες είναι οι επιπτώσεις ασφαλείας των διαφορετικών μεθόδων αυθεντικοποίησης;
5. Πώς διαχειρίζεστε μυστικά και ευαίσθητα δεδομένα ρύθμισης;

### Ενότητα 3: Ανάπτυξη και Παροχή (Εβδομάδα 4)

#### Στόχοι Μάθησης
- Κατανοήστε τις ροές εργασίας ανάπτυξης και τις βέλτιστες πρακτικές
- Εξοικειωθείτε με το Infrastructure as Code μέσω προτύπων Bicep
- Εφαρμόστε σύνθετες αρχιτεκτονικές πολλαπλών υπηρεσιών
- Βελτιστοποιήστε την απόδοση και την αξιοπιστία ανάπτυξης

#### Βασικές Έννοιες για Κατανόηση
- Δομή προτύπων Bicep και modules
- Εξαρτήσεις πόρων και σειρά
- Στρατηγικές ανάπτυξης (blue-green, rolling updates)
- Αναπτύξεις πολλαπλών περιοχών
- Μετακινήσεις βάσεων δεδομένων και διαχείριση δεδομένων

#### Ασκήσεις Πρακτικής

**Άσκηση 3.1: Προσαρμοσμένη Υποδομή**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Άσκηση 3.2: Εφαρμογή Πολλαπλών Υπηρεσιών**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Άσκηση 3.3: Ενσωμάτωση Βάσης Δεδομένων**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Ερωτήσεις Αυτοαξιολόγησης
1. Ποια είναι τα πλεονεκτήματα της χρήσης Bicep αντί για ARM templates;
2. Πώς χειρίζεστε τις μετακινήσεις βάσεων δεδομένων στις αναπτύξεις azd;
3. Ποιες στρατηγικές υπάρχουν για αναπτύξεις χωρίς διακοπή λειτουργίας;
4. Πώς διαχειρίζεστε τις εξαρτήσεις μεταξύ υπηρεσιών;
5. Ποιες είναι οι παράμετροι για αναπτύξεις πολλαπλών περιοχών;

### Ενότητα 4: Επικύρωση Πριν την Ανάπτυξη (Εβδομάδα 5)

#### Στόχοι Μάθησης
- Εφαρμόστε ολοκληρωμένους ελέγχους πριν την ανάπτυξη
- Κατανοήστε τον προγραμματισμό χωρητικότητας και την επικύρωση πόρων
- Εξοικειωθείτε με την επιλογή SKU και τη βελτιστοποίηση κόστους
- Δημιουργήστε αυτοματοποιημένους αγωγούς επικύρωσης

#### Βασικές Έννοιες για Κατανόηση
- Ποσοστώσεις και όρια πόρων Azure
- Κριτήρια επιλογής SKU και επιπτώσεις κόστους
- Αυτοματοποιημένα scripts και εργαλεία επικύρωσης
- Μεθοδολογίες προγραμματισμού χωρητικότητας
- Δοκιμές απόδοσης και βελτιστοποίηση

#### Ασκήσεις Πρακτικής

**Άσκηση 4.1: Προγραμματισμός Χωρητικότητας**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Άσκηση 4.2: Επικύρωση Πριν την Ανάπτυξη**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Άσκηση 4.3: Βελτιστοποίηση SKU**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Ερωτήσεις Αυτοαξιολόγησης
1. Ποιοι παράγοντες πρέπει να επηρεάζουν τις αποφάσεις επιλογής SKU;
2. Πώς επικυρώνετε τη διαθεσιμότητα πόρων Azure πριν την ανάπτυξη;
3. Ποια είναι τα βασικά στοιχεία ενός συστήματος ελέγχου πριν την ανάπτυξη;
4. Πώς εκτιμάτε και ελέγχετε το κόστος ανάπτυξης;
5. Ποια παρακολούθηση είναι απαραίτητη για τον προγραμματισμό χωρητικότητας;

### Ενότητα 5: Αντιμετώπιση Προβλημάτων και Εντοπισμός Σφαλμάτων (Εβδομάδα 6)

#### Στόχοι Μάθησης
- Κατανοήστε μεθοδολογίες συστηματικής αντιμετώπισης προβλημάτων
- Αναπτύξτε δεξιότητες εντοπισμού σφαλμάτων σε σύνθετα προβλήματα ανάπτυξης
- Εφαρμόστε ολοκληρωμένη παρακολούθηση και ειδοποιήσεις
- Δημιουργήστε διαδικασίες αντιμετώπισης περιστατικών και ανάκαμψης

#### Βασικές Έννοιες για Κατανόηση
- Συνηθισμένα μοτίβα αποτυχίας ανάπτυξης
- Τεχνικές ανάλυσης και συσχέτισης logs
- Παρακολούθηση απόδοσης και βελτιστοποίηση
- Εντοπισμός και αντιμετώπιση περιστατικών ασφαλείας
- Ανάκαμψη από καταστροφές και επιχειρησιακή συνέχεια

#### Ασκήσεις Πρακτικής

**Άσκηση 5.1: Σενάρια Αντιμετώπισης Προβλημάτων**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Άσκηση 5.2: Εφαρμογή Παρακολούθησης**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Άσκηση 5.3: Αντιμετώπιση Περιστατικών**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Ερωτήσεις Αυτοαξιολόγησης
1. Ποια είναι η συστηματική προσέγγιση για την αντιμετώπιση προβλημάτων αναπτύξεων azd;
2. Πώς συσχετίζετε logs μεταξύ πολλαπλών υπηρεσιών και πόρων;
3. Ποιοι δείκτες παρακολούθησης είναι πιο κρίσιμοι για την έγκαιρη ανίχνευση προβλημάτων;
4. Πώς εφαρμόζετε αποτελεσματικές διαδικασίες ανάκαμψης από καταστροφές;
5. Ποια είναι τα βασικά στοιχεία ενός σχεδίου αντιμετώπισης περιστατικών;

### Ενότητα 6: Προχωρημένα Θέματα και Βέλτιστες Πρακτικές (Εβδομάδες 7-8)

#### Στόχοι Μάθησης
- Εφαρμόστε μοτίβα ανάπτυξης επιπέδου επιχείρησης
- Εξοικειωθείτε με την ενσωμάτωση και αυτοματοποίηση CI/CD
- Αναπτύξτε προσαρμοσμένα πρότυπα και συμβάλλετε στην κοινότητα
- Κατανοήστε προχωρημένες απαιτήσεις ασφαλείας και συμμόρφωσης

#### Βασικές Έννοιες για Κατανόηση
- Μοτίβα ενσωμάτωσης CI/CD
- Ανάπτυξη και διανομή προσαρμοσμένων προτύπων
- Διακυβέρνηση και συμμόρφωση επιπέδου επιχείρησης
- Προχωρημένες ρυθμίσεις δικτύου και ασφάλειας
- Βελτιστοποίηση απόδοσης και διαχείριση κόστους

#### Ασκήσεις Πρακτικής

**Άσκηση 6.1: Ενσωμάτωση CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Άσκηση 6.2: Ανάπτυξη Προσαρμοσμένων Προτύπων**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Άσκηση 6.3: Εφαρμογή Επιπέδου Επιχείρησης**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Ερωτήσεις Αυτοαξιολόγησης
1. Πώς ενσωματώνετε το azd σε υπάρχουσες ροές εργασίας CI/CD;
2. Ποια είναι τα βασικά σημεία για την ανάπτυξη προσαρμοσμένων προτύπων;
3. Πώς εφαρμόζετε διακυβέρνηση και συμμόρφωση στις αναπτύξεις azd;
4. Ποιες είναι οι βέλτιστες πρακτικές για αναπτύξεις επιπέδου επιχείρησης;
5. Πώς συμβάλλετε αποτελεσματικά στην κοινότητα του azd;

## Πρακτικά Έργα

### Έργο 1: Προσωπικός Ιστότοπος Portfolio
**Πολυπλοκότητα**: Αρχάριος  
**Διάρκεια**: 1-2 εβδομάδες

Δημιουργήστε και αναπτύξτε έναν προσωπικό ιστότοπο portfolio χρησιμοποιώντας:
- Φιλοξενία στατικού ιστότοπου στο Azure Storage
- Ρύθμιση προσαρμοσμένου domain
- Ενσωμάτωση CDN για παγκόσμια απόδοση
- Αυτοματοποιημένος αγωγός ανάπτυξης

**Παραδοτέα**:
- Λειτουργικός ιστότοπος αναπτυγμένος στο Azure
- Προσαρμοσμένο πρότυπο azd για αναπτύξεις portfolio
- Τεκμηρίωση της διαδικασίας ανάπτυξης
- Συστάσεις βελτιστοποίησης κόστους

### Έργο 2: Εφαρμογή Διαχείρισης Εργασιών
**Πολυπλοκότητα**: Μεσαίο  
**Διάρκεια**: 2-3 εβδομάδες

Δημιουργήστε μια πλήρη εφαρμογή διαχείρισης εργασιών με:
- React frontend αναπτυγμένο στο App Service
- Node.js API backend με αυθεντικοποίηση
- Βάση δεδομένων PostgreSQL με μετακινήσεις
- Παρακολούθηση μέσω Application Insights

**Παραδοτέα**:
- Πλήρης εφαρμογή με αυθεντικοποίηση χρηστών
- Σχήμα βάσης δεδομένων και scripts μετακινήσεων
- Πίνακες παρακολούθησης και κανόνες ειδοποιήσεων
- Ρύθμιση ανάπτυξης πολλαπλών περιβαλλόντων

### Έργο 3: Πλατφόρμα Ηλεκτρονικού Εμπορίου με Microservices
**Πολυπλοκότητα**: Προχωρημένο  
**Διάρκεια**: 4-6 εβδομάδες

Σχεδιάστε και υλοποιήστε μια πλατφόρμα ηλεκτρονικού εμπορίου βασισμένη σε microservices:
- Πολλαπλές υπηρεσίες API (κατάλογος, παραγγελίες, πληρωμές, χρήστες)
- Ενσωμάτωση μηνυμάτων με Service Bus
- Redis cache για βελτιστοποίηση απόδοσης
- Ολοκληρωμένη καταγραφή και παρακολούθηση

**Παραδοτέα**:
- Πλήρης αρχιτεκτονική microservices
- Μοτίβα επικοινωνίας μεταξύ υπηρεσιών
- Δοκιμές απόδοσης και βελτιστοποίηση
- Εφαρμογή ασφαλείας έτοιμη για παραγωγή

## Αξιολόγηση και Πιστοποίηση

### Έλεγχοι Γνώσεων

Ολοκληρώστε αυτές τις αξιολογήσεις μετά από κάθε ενότητα:

**Αξιολόγηση Ενότητας 1**: Βασικές έννοιες και εγκατάσταση
- Ερωτήσεις πολλαπλής επιλογής για βασικές έννοιες
- Πρακτικές εργασίες εγκατάστασης και ρύθμισης
- Απλή άσκηση ανάπτυξης

**Αξιολόγηση Ενότητας 2**: Ρύθμιση και περιβάλλοντα
- Σενάρια διαχείρισης περιβάλλοντος
- Ασκήσεις αντιμετώπισης προβλημάτων ρύθμισης
- Εφαρμογή ρύθμισης ασφαλείας

**Αξιολόγηση Ενότητας 3**: Ανάπτυξη και παροχή
- Προκλήσεις σχεδιασμού υποδομής
- Σενάρια ανάπτυξης πολλαπλών υπηρεσιών
- Ασκήσεις βελτιστοποίησης απόδοσης

**Αξιολόγηση Ενότητας 4**: Επικύρωση πριν την ανάπτυξη
- Μελέτες περίπτωσης προγραμματισμού χωρητικότητας
- Σενάρια βελτιστοποίησης κόστους
- Εφαρμογή αγωγού επικύρωσης

**Αξιολόγηση Ενότητας 5**: Αντιμετώπιση προβλημάτων και εντοπισμός σφαλμάτων
- Ασκήσεις διάγνωσης προβλημάτων
- Εργασίες εφαρμογής παρακολούθησης
- Προσομοιώσεις αντιμετώπισης περιστατικών

**Αξιολόγηση Ενότητας 6**: Προχωρημένα θέματα
- Σχεδια
3. **Συμβάλετε στο Ανοιχτό Λογισμικό**: Μοιραστείτε τα πρότυπα και τις λύσεις σας με την κοινότητα  
4. **Διδάξτε Άλλους**: Εξηγώντας έννοιες σε άλλους ενισχύετε τη δική σας κατανόηση  
5. **Μείνετε Περίεργοι**: Εξερευνήστε συνεχώς νέες υπηρεσίες Azure και μοτίβα ενσωμάτωσης  

---

**Πλοήγηση**  
- **Προηγούμενο Μάθημα**: [FAQ](faq.md)  
- **Επόμενο Μάθημα**: [Changelog](../changelog.md)  

**Παρακολούθηση Προόδου Μελέτης**: Χρησιμοποιήστε αυτόν τον οδηγό για να παρακολουθείτε την πορεία της μάθησής σας και να διασφαλίσετε την ολοκληρωμένη κάλυψη όλων των εννοιών και πρακτικών του Azure Developer CLI.  

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.