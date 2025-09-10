<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T21:45:08+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "el"
}
-->
# Συνηθισμένα Προβλήματα & Λύσεις

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός αντιμετώπισης προβλημάτων καλύπτει τα πιο συχνά ζητήματα που προκύπτουν κατά τη χρήση του Azure Developer CLI. Μάθετε πώς να διαγνώσετε, να επιλύσετε και να αντιμετωπίσετε προβλήματα που σχετίζονται με την αυθεντικοποίηση, την ανάπτυξη, την παροχή υποδομής και τη διαμόρφωση εφαρμογών. Κάθε πρόβλημα περιλαμβάνει λεπτομερή συμπτώματα, αιτίες και βήματα επίλυσης.

## Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του οδηγού, θα:
- Κατακτήσετε τεχνικές διάγνωσης για ζητήματα του Azure Developer CLI
- Κατανοήσετε συνηθισμένα προβλήματα αυθεντικοποίησης και δικαιωμάτων και τις λύσεις τους
- Επιλύσετε αποτυχίες ανάπτυξης, σφάλματα παροχής υποδομής και ζητήματα διαμόρφωσης
- Εφαρμόσετε στρατηγικές προληπτικής παρακολούθησης και εντοπισμού σφαλμάτων
- Χρησιμοποιήσετε συστηματικές μεθοδολογίες αντιμετώπισης προβλημάτων για σύνθετα ζητήματα
- Ρυθμίσετε σωστή καταγραφή και παρακολούθηση για την αποφυγή μελλοντικών προβλημάτων

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση, θα μπορείτε να:
- Διαγνώσετε ζητήματα του Azure Developer CLI χρησιμοποιώντας ενσωματωμένα εργαλεία διάγνωσης
- Επιλύσετε προβλήματα αυθεντικοποίησης, συνδρομής και δικαιωμάτων ανεξάρτητα
- Αντιμετωπίσετε αποτυχίες ανάπτυξης και σφάλματα παροχής υποδομής αποτελεσματικά
- Εντοπίσετε σφάλματα διαμόρφωσης εφαρμογών και προβλήματα που σχετίζονται με το περιβάλλον
- Εφαρμόσετε παρακολούθηση και ειδοποιήσεις για την προληπτική αναγνώριση πιθανών ζητημάτων
- Χρησιμοποιήσετε βέλτιστες πρακτικές για καταγραφή, εντοπισμό σφαλμάτων και ροές εργασίας επίλυσης προβλημάτων

## Γρήγορη Διάγνωση

Πριν εμβαθύνετε σε συγκεκριμένα ζητήματα, εκτελέστε αυτές τις εντολές για να συλλέξετε πληροφορίες διάγνωσης:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Ζητήματα Αυθεντικοποίησης

### Πρόβλημα: "Αποτυχία λήψης διακριτικού πρόσβασης"
**Συμπτώματα:**
- Το `azd up` αποτυγχάνει με σφάλματα αυθεντικοποίησης
- Οι εντολές επιστρέφουν "μη εξουσιοδοτημένος" ή "πρόσβαση απορρίφθηκε"

**Λύσεις:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Πρόβλημα: "Ανεπαρκή δικαιώματα" κατά την ανάπτυξη
**Συμπτώματα:**
- Η ανάπτυξη αποτυγχάνει με σφάλματα δικαιωμάτων
- Δεν είναι δυνατή η δημιουργία συγκεκριμένων πόρων Azure

**Λύσεις:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Πρόβλημα: Προβλήματα αυθεντικοποίησης πολλαπλών ενοικιαστών
**Λύσεις:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Σφάλματα Παροχής Υποδομής

### Πρόβλημα: Συγκρούσεις ονομάτων πόρων
**Συμπτώματα:**
- Σφάλματα "Το όνομα του πόρου υπάρχει ήδη"
- Η ανάπτυξη αποτυγχάνει κατά τη δημιουργία πόρων

**Λύσεις:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Πρόβλημα: Η τοποθεσία/περιοχή δεν είναι διαθέσιμη
**Συμπτώματα:**
- "Η τοποθεσία 'xyz' δεν είναι διαθέσιμη για τον τύπο πόρου"
- Ορισμένα SKUs δεν είναι διαθέσιμα στην επιλεγμένη περιοχή

**Λύσεις:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Πρόβλημα: Σφάλματα υπέρβασης ποσοστώσεων
**Συμπτώματα:**
- "Υπέρβαση ποσοστώσεων για τον τύπο πόρου"
- "Έχει επιτευχθεί ο μέγιστος αριθμός πόρων"

**Λύσεις:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Πρόβλημα: Σφάλματα προτύπων Bicep
**Συμπτώματα:**
- Αποτυχίες επικύρωσης προτύπων
- Συντακτικά σφάλματα στα αρχεία Bicep

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

### Πρόβλημα: Αποτυχίες δημιουργίας
**Συμπτώματα:**
- Η εφαρμογή αποτυγχάνει να δημιουργηθεί κατά την ανάπτυξη
- Σφάλματα εγκατάστασης πακέτων

**Λύσεις:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Πρόβλημα: Αποτυχίες ανάπτυξης κοντέινερ
**Συμπτώματα:**
- Οι εφαρμογές κοντέινερ αποτυγχάνουν να ξεκινήσουν
- Σφάλματα λήψης εικόνας

**Λύσεις:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Πρόβλημα: Σφάλματα σύνδεσης βάσης δεδομένων
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

## 🔧 Ζητήματα Διαμόρφωσης

### Πρόβλημα: Οι μεταβλητές περιβάλλοντος δεν λειτουργούν
**Συμπτώματα:**
- Η εφαρμογή δεν μπορεί να διαβάσει τιμές διαμόρφωσης
- Οι μεταβλητές περιβάλλοντος εμφανίζονται κενές

**Λύσεις:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Πρόβλημα: Προβλήματα πιστοποιητικών SSL/TLS
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

### Πρόβλημα: Προβλήματα διαμόρφωσης CORS
**Συμπτώματα:**
- Το frontend δεν μπορεί να καλέσει το API
- Αποκλεισμός αιτήσεων cross-origin

**Λύσεις:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Ζητήματα Διαχείρισης Περιβάλλοντος

### Πρόβλημα: Προβλήματα εναλλαγής περιβάλλοντος
**Συμπτώματα:**
- Χρησιμοποιείται λάθος περιβάλλον
- Η διαμόρφωση δεν αλλάζει σωστά

**Λύσεις:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Πρόβλημα: Καταστροφή περιβάλλοντος
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

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Ζητήματα Απόδοσης

### Πρόβλημα: Αργοί χρόνοι ανάπτυξης
**Συμπτώματα:**
- Οι αναπτύξεις διαρκούν πολύ
- Χρονικά όρια κατά την ανάπτυξη

**Λύσεις:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Πρόβλημα: Προβλήματα απόδοσης εφαρμογής
**Συμπτώματα:**
- Αργοί χρόνοι απόκρισης
- Υψηλή χρήση πόρων

**Λύσεις:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Εργαλεία και Εντολές Αντιμετώπισης Προβλημάτων

### Εντολές Εντοπισμού Σφαλμάτων
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Ανάλυση Καταγραφών
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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

## 🆘 Λήψη Επιπλέον Βοήθειας

### Πότε να Κλιμακώσετε
- Τα ζητήματα αυθεντικοποίησης επιμένουν μετά από όλες τις λύσεις
- Προβλήματα υποδομής με υπηρεσίες Azure
- Ζητήματα χρέωσης ή συνδρομής
- Θέματα ασφαλείας ή περιστατικά

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

### Πληροφορίες που Πρέπει να Συλλέξετε
Πριν επικοινωνήσετε με την υποστήριξη, συλλέξτε:
- Έξοδο `azd version`
- Έξοδο `azd info`
- Μηνύματα σφάλματος (πλήρες κείμενο)
- Βήματα για την αναπαραγωγή του ζητήματος
- Λεπτομέρειες περιβάλλοντος (`azd env show`)
- Χρονοδιάγραμμα έναρξης του ζητήματος

### Σενάριο Συλλογής Καταγραφών
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Πρόληψη Ζητημάτων

### Λίστα Ελέγχου Πριν την Ανάπτυξη
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
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Τακτική Συντήρηση
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Σχετικοί Πόροι

- [Οδηγός Εντοπισμού Σφαλμάτων](debugging.md) - Προχωρημένες τεχνικές εντοπισμού σφαλμάτων
- [Παροχή Πόρων](../deployment/provisioning.md) - Αντιμετώπιση προβλημάτων υποδομής
- [Σχεδιασμός Χωρητικότητας](../pre-deployment/capacity-planning.md) - Καθοδήγηση σχεδιασμού πόρων
- [Επιλογή SKU](../pre-deployment/sku-selection.md) - Συστάσεις επιπέδων υπηρεσιών

---

**Συμβουλή**: Κρατήστε αυτόν τον οδηγό σελιδοδεικνυμένο και ανατρέξτε σε αυτόν όποτε αντιμετωπίζετε προβλήματα. Τα περισσότερα ζητήματα έχουν ήδη εμφανιστεί και έχουν καθιερωμένες λύσεις!

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Παροχή Πόρων](../deployment/provisioning.md)
- **Επόμενο Μάθημα**: [Οδηγός Εντοπισμού Σφαλμάτων](debugging.md)

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.