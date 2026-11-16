# Κοινά Προβλήματα και Λύσεις

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 7 - Επίλυση Προβλημάτων & Αποσφαλμάτωση
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 6: Έλεγχοι πριν την Πτήση](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Επόμενο**: [Οδηγός Αποσφαλμάτωσης](debugging.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 8: Παραγωγικά & Επιχειρηματικά Μοντέλα](../chapter-08-production/production-ai-practices.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός επίλυσης προβλημάτων καλύπτει τα πιο συχνά προβλήματα που αντιμετωπίζονται κατά τη χρήση του Azure Developer CLI. Μάθετε να διαγιγνώσκετε, να επιλύετε και να αντιμετωπίζετε κοινά προβλήματα με τον έλεγχο ταυτότητας, την ανάπτυξη, την προμήθεια υποδομής και τη διαμόρφωση εφαρμογών. Κάθε ζήτημα περιλαμβάνει λεπτομερή συμπτώματα, αιτίες και βήματα επίλυσης.

## Στόχοι Μάθησης

Ολοκληρώνοντας αυτόν τον οδηγό, θα:
- Κυριαρχήσετε τις τεχνικές διάγνωσης για θέματα του Azure Developer CLI
- Κατανοήσετε κοινά προβλήματα ελέγχου ταυτότητας και δικαιωμάτων και τις λύσεις τους
- Επιλύσετε αποτυχίες ανάπτυξης, σφάλματα παροχής υποδομής και ζητήματα διαμόρφωσης
- Εφαρμόσετε προληπτικές μεθόδους παρακολούθησης και αποσφαλμάτωσης
- Εφαρμόσετε συστηματικές μεθοδολογίες επίλυσης για σύνθετα προβλήματα
- Ρυθμίσετε σωστή καταγραφή και παρακολούθηση για να αποφύγετε μελλοντικά προβλήματα

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση, θα μπορείτε:
- Να διαγιγνώσκετε προβλήματα Azure Developer CLI χρησιμοποιώντας ενσωματωμένα διαγνωστικά εργαλεία
- Να επιλύετε ανεξάρτητα ζητήματα ελέγχου ταυτότητας, συνδρομής και δικαιωμάτων
- Να επιλύετε αποτελεσματικά αποτυχίες ανάπτυξης και σφάλματα παροχής υποδομής
- Να αποσφαλματώνετε ζητήματα διαμόρφωσης εφαρμογής και περιβαλλοντικά προβλήματα
- Να εφαρμόζετε παρακολούθηση και ειδοποιήσεις για την προληπτική αναγνώριση πιθανών προβλημάτων
- Να εφαρμόζετε βέλτιστες πρακτικές για καταγραφή, αποσφαλμάτωση και ροές εργασίας επίλυσης προβλημάτων

## Γρήγορη Διάγνωση

> Αντικαταστήστε παραδείγματα ονομάτων/ταυτοτήτων με τις τιμές του περιβάλλοντός σας. Τα αποσπάσματα Bash, Bicep, JavaScript και αρχείων παραμέτρων είναι επισημασμένα ξεχωριστά παρακάτω· δεν είναι ένα εκτελέσιμο σενάριο. Εξετάστε τις καταστροφικές ενέργειες και αποκόψτε μυστικά πριν μοιραστείτε διαγνωστικά. `azd monitor --logs` ανοίγει πρόγραμμα περιήγησης· δεν μεταδίδει καταγραφές τερματικού.

Πριν εμβαθύνετε σε συγκεκριμένα προβλήματα, εκτελέστε αυτές τις εντολές για να συγκεντρώσετε πληροφορίες διάγνωσης:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## Προβλήματα Ελέγχου Ταυτότητας

### Ζήτημα: "Απέτυχε η λήψη του access token"
**Συμπτώματα:**
- `azd up` αποτυγχάνει με σφάλματα ελέγχου ταυτότητας
- Οι εντολές επιστρέφουν "μη εξουσιοδοτημένο" ή "πρόσβαση αρνήθηκε"

**Λύσεις:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### Ζήτημα: "Ανεπαρκή δικαιώματα" κατά την ανάπτυξη
**Συμπτώματα:**
- Η ανάπτυξη αποτυγχάνει με σφάλματα αδειών
- Δεν μπορεί να δημιουργηθούν ορισμένοι πόροι του Azure

**Λύσεις:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Ζήτημα: Προβλήματα ελέγχου ταυτότητας πολλαπλών ενοίκων
**Λύσεις:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Σφάλματα Παροχής Υποδομής

### Ζήτημα: Συγκρούσεις ονομάτων πόρων
**Συμπτώματα:**
- Σφάλματα "Το όνομα πόρου υπάρχει ήδη"
- Η ανάπτυξη αποτυγχάνει κατά τη δημιουργία πόρων

**Λύσεις:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### Ζήτημα: Τοποθεσία/Περιοχή μη διαθέσιμη
**Συμπτώματα:**
- "Η τοποθεσία 'xyz' δεν είναι διαθέσιμη για τον τύπο πόρου"
- Ορισμένα SKUs δεν είναι διαθέσιμα στην επιλεγμένη περιοχή

**Λύσεις:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Η αλλαγή της μεταβλητής τοποθεσίας δεν μεταφέρει τους ήδη υπάρχοντες πόρους. Μία υπάρχουσα ομάδα πόρων ή πόρος μπορεί να απορρίψει την αλλαγή τοποθεσίας· χρησιμοποιήστε ξεχωριστό περιβάλλον για περιφερειακή επαναανάπτυξη.

### Ζήτημα: Σφάλματα υπέρβασης ποσόστωσης
**Συμπτώματα:**
- "Υπέρβαση ποσόστωσης για τύπο πόρου"
- "Έφτασε ο μέγιστος αριθμός πόρων"

**Λύσεις:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Για ανάπτυξη, επιλέξτε υποστηριζόμενο μικρότερο SKU στο `infra/main.parameters.json`:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Ζήτημα: Σφάλματα προτύπου Bicep
**Συμπτώματα:**
- Αποτυχίες επικύρωσης προτύπου
- Συντακτικά σφάλματα σε αρχεία Bicep

**Λύσεις:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 Αποτυχίες Ανάπτυξης

### Ζήτημα: Αποτυχίες κατασκευής
**Συμπτώματα:**
- Η εφαρμογή αποτυγχάνει να κατασκευαστεί κατά την ανάπτυξη
- Σφάλματα εγκατάστασης πακέτων

**Λύσεις:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Ζήτημα: Αποτυχίες ανάπτυξης κοντέινερ
**Συμπτώματα:**
- Οι εφαρμογές κοντέινερ δεν ξεκινούν
- Σφάλματα λήψης εικόνας

**Λύσεις:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Ζήτημα: Αποτυχίες σύνδεσης βάσης δεδομένων
**Συμπτώματα:**
- Η εφαρμογή δεν μπορεί να συνδεθεί στη βάση δεδομένων
- Σφάλματα χρονικού ορίου σύνδεσης

**Λύσεις:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Προβλήματα Διαμόρφωσης

### Ζήτημα: Οι μεταβλητές περιβάλλοντος δεν λειτουργούν
**Συμπτώματα:**
- Η εφαρμογή δεν διαβάζει τιμές διαμόρφωσης
- Οι μεταβλητές περιβάλλοντος εμφανίζονται κενές

**Λύσεις:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Ζήτημα: Προβλήματα πιστοποιητικών SSL/TLS
**Συμπτώματα:**
- Το HTTPS δεν λειτουργεί
- Σφάλματα επικύρωσης πιστοποιητικών

**Λύσεις:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Ζήτημα: Προβλήματα διαμόρφωσης CORS
**Συμπτώματα:**
- Το frontend δεν μπορεί να καλέσει το API
- Αποκλεισμένο αίτημα cross-origin

**Λύσεις:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Ενημερώστε την υπάρχουσα εφαρμογή Express (με εισαγωγή `cors`):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 Προβλήματα Διαχείρισης Περιβάλλοντος

### Ζήτημα: Προβλήματα εναλλαγής περιβάλλοντος
**Συμπτώματα:**
- Χρήση λάθους περιβάλλοντος
- Η διαμόρφωση δεν αλλάζει σωστά

**Λύσεις:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Ζήτημα: Διαφθορά περιβάλλοντος
**Συμπτώματα:**
- Το περιβάλλον εμφανίζει μη έγκυρη κατάσταση
- Οι πόροι δεν ταιριάζουν με τη διαμόρφωση

**Λύσεις:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Προβλήματα Απόδοσης

### Ζήτημα: Αργοί χρόνοι ανάπτυξης
**Συμπτώματα:**
- Οι αναπτύξεις διαρκούν πολύ
- Χρονικά όρια κατά την ανάπτυξη

**Λύσεις:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### Ζήτημα: Προβλήματα απόδοσης εφαρμογής
**Συμπτώματα:**
- Αργοί χρόνοι απόκρισης
- Υψηλή χρήση πόρων

**Λύσεις:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Εργαλεία και Εντολές Επίλυσης Προβλημάτων

### Εντολές Αποσφαλμάτωσης
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Ανάλυση Καταγραφών
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Έρευνα Πόρων
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Λήψη Πρόσθετης Βοήθειας

### Πότε να Ανυψώσετε το Πρόβλημα
- Τα προβλήματα ελέγχου ταυτότητας επιμένουν μετά από όλες τις λύσεις
- Προβλήματα υποδομής με υπηρεσίες Azure
- Ζητήματα χρέωσης ή συνδρομής
- Θέματα ασφάλειας ή περιστατικά

### Κανάλια Υποστήριξης
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Πληροφορίες προς Συλλογή
Πριν επικοινωνήσετε με την υποστήριξη, συγκεντρώστε:
- Έξοδο `azd version`
- Έξοδο `azd config show`
- Έξοδο `azd show` (τρέχουσα κατάσταση ανάπτυξης)
- Μηνύματα σφάλματος (πλήρες κείμενο)
- Βήματα αναπαραγωγής προβλήματος
- Αποκομμένες λεπτομέρειες περιβάλλοντος (μην μοιράζεστε ποτέ ακατέργαστα `azd env get-values` που μπορεί να περιέχουν μυστικά)
- Χρονοδιάγραμμα έναρξης του προβλήματος

### Σενάριο Συλλογής Καταγραφών
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Πρόληψη Προβλημάτων

### Λίστα Ελέγχου πριν την Ανάπτυξη
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### Ρύθμιση Παρακολούθησης
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### Τακτική Συντήρηση
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Σχετικοί Πόροι

- [Οδηγός Αποσφαλμάτωσης](debugging.md) - Προηγμένες τεχνικές αποσφαλμάτωσης
- [Παροχή Πόρων](../chapter-04-infrastructure/provisioning.md) - Επίλυση προβλημάτων υποδομής
- [Σχεδιασμός Χωρητικότητας](../chapter-06-pre-deployment/capacity-planning.md) - Οδηγίες σχεδιασμού πόρων
- [Επιλογή SKU](../chapter-06-pre-deployment/sku-selection.md) - Προτάσεις επιπέδου υπηρεσίας

---

**Συμβουλή**: Κρατήστε αυτόν τον οδηγό σελιδοδεικτούν και ανατρέξτε σε αυτόν όποτε αντιμετωπίζετε προβλήματα. Τα περισσότερα προβλήματα έχουν ήδη εμφανιστεί και έχουν καθιερωμένες λύσεις!

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Παροχή Πόρων](../chapter-04-infrastructure/provisioning.md)
- **Επόμενο Μάθημα**: [Οδηγός Αποσφαλμάτωσης](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->