# Οδηγός Ανάπτυξης - Μαθαίνοντας τις Αναπτύξεις AZD

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 4 - Υποδομή ως Κώδικας & Ανάπτυξη
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)
- **➡️ Επόμενο**: [Provisioning Πόρων](provisioning.md)
- **🧩 Επίσης σε αυτό το κεφάλαιο**: [Δημιουργία του δικού σας Προτύπου](custom-templates.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 5: Πολυ-Πράκτορες Λύσεις AI](../../examples/retail-scenario.md)

## Εισαγωγή

> Εξετάστηκε με βάση `azd 1.37.2` (Νοέμβριος 2026). Οι εντολές χρησιμοποιούν Bash· παραδείγματα JSON απαιτούν `jq`. Εκτός από την ρητά αρχικοποιημένη άσκηση todo, τα προηγμένα παραδείγματα είναι **θραύσματα ενσωμάτωσης**: παρέχετε τη δική σας πηγή, υποδομή, δοκιμές και σενάρια. Καμία ανάπτυξη Azure δεν εκτελέστηκε σε αυτήν την αναθεώρηση.

Αυτός ο ολοκληρωμένος οδηγός καλύπτει ό,τι χρειάζεστε για την ανάπτυξη εφαρμογών χρησιμοποιώντας το Azure Developer CLI, από βασικές αναπτύξεις με μια εντολή έως προχωρημένα σενάρια παραγωγής με προσαρμοσμένα hooks, πολλαπλά περιβάλλοντα και ενσωμάτωση CI/CD. Κατακτήστε ολόκληρο τον κύκλο ζωής ανάπτυξης με πρακτικά παραδείγματα και βέλτιστες πρακτικές.

## Στόχοι Μάθησης

Ολοκληρώνοντας αυτόν τον οδηγό, θα:
- Κατακτήσετε όλες τις εντολές και ροές εργασίας ανάπτυξης του Azure Developer CLI
- Κατανοήσετε τον πλήρη κύκλο ζωής ανάπτυξης από το provisioning έως την παρακολούθηση
- Εφαρμόσετε προσαρμοσμένα hooks ανάπτυξης για αυτοματοποίηση πριν και μετά την ανάπτυξη
- Διαμορφώσετε πολλαπλά περιβάλλοντα με παραμέτρους ειδικές για κάθε περιβάλλον
- Ρυθμίσετε προχωρημένες στρατηγικές ανάπτυξης όπως blue-green και canary deployments
- Ενσωματώσετε τις αναπτύξεις azd σε pipelines CI/CD και ροές εργασίας DevOps

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση, θα μπορείτε να:
- Εκτελείτε και αντιμετωπίζετε προβλήματα σε όλες τις ροές εργασίας ανάπτυξης azd ανεξάρτητα
- Σχεδιάζετε και υλοποιείτε προσαρμοσμένη αυτοματοποίηση ανάπτυξης χρησιμοποιώντας hooks
- Διαμορφώνετε ανάπτυξη έτοιμη για παραγωγή με κατάλληλη ασφάλεια και παρακολούθηση
- Διαχειρίζεστε πολύπλοκα σενάρια ανάπτυξης πολλαπλών περιβαλλόντων
- Βελτιστοποιείτε την απόδοση ανάπτυξης και εφαρμόζετε στρατηγικές επαναφοράς
- Ενσωματώνετε τις αναπτύξεις azd σε επιχειρησιακές πρακτικές DevOps

## Επισκόπηση Ανάπτυξης

Το Azure Developer CLI παρέχει αρκετές εντολές ανάπτυξης:
- `azd up` - Πλήρης ροή εργασίας (provision + deploy)
- `azd provision` - Δημιουργία/ενημέρωση μόνο πόρων Azure
- `azd deploy` - Ανάπτυξη μόνο κώδικα εφαρμογής
- `azd package` - Δημιουργία και πακετάρισμα εφαρμογών

## Βασικές Ροές Εργασίας Ανάπτυξης

### Πλήρης Ανάπτυξη (azd up)
Η πιο κοινή ροή εργασίας για νέα έργα:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### Ανάπτυξη Μόνο Υποδομής
Όταν χρειάζεται να ενημερώσετε μόνο πόρους Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### Ανάπτυξη Μόνο Κώδικα
Για γρήγορες ενημερώσεις εφαρμογής:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ Επαλήθευση Ανάπτυξης

Μετά από οποιαδήποτε ανάπτυξη, επαληθεύστε την επιτυχία:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**Κριτήρια Επιτυχίας:**
- ✅ `azd show` επιλύει αναμενόμενους στόχους/URL υπηρεσιών
- ✅ Τα αιτήματα προς τις πραγματικές διαδρομές της εφαρμογής επιστρέφουν την αναμενόμενη κατάσταση και σώμα
- ✅ Καμία καταχώρηση σφάλματος κατά τα τελευταία 5 λεπτά
- ✅ Η εφαρμογή ανταποκρίνεται σε δοκιμαστικά αιτήματα

## 🏗️ Κατανόηση της Διαδικασίας Ανάπτυξης

### Νέος στα hooks; Ξεκινήστε εδώ

Ένα **hook** είναι μια εντολή που τρέχει αυτόματα το azd σε συγκεκριμένη στιγμή της διαδικασίας ανάπτυξης—πριν ή μετά το provisioning, και πριν ή μετά την ανάπτυξη του κώδικα σας. Σας επιτρέπουν να αυτοματοποιείτε τις μικρές δουλειές που πάντα συνοδεύουν μια ανάπτυξη: γέμισμα βάσης δεδομένων, εκτέλεση μεταναστεύσεων, δημιουργία assets ή smoke-testing της ζωντανής εφαρμογής.

| Hook | Τρέχει… | Συνήθης χρήση |
|------|-------|------------|
| `preprovision` | Πριν δημιουργηθούν πόροι | Επικύρωση προϋποθέσεων, είσοδος σε registry |
| `postprovision` | Μετά την ύπαρξη πόρων | Διαμόρφωση πόρων, ρύθμιση βάσης δεδομένων |
| `predeploy` | Πριν από την ανάπτυξη κώδικα | Δημιουργία front-end assets, εκτέλεση unit tests |
| `postdeploy` | Μετά την ανάδυση κώδικα live | Εκτέλεση μεταναστεύσεων DB, smoke-test του endpoint |

Τα hooks ζουν στο `azure.yaml` σας. Να ένα μικρότερο παράδειγμα—τυπώνει απλά ένα μήνυμα μετά την ανάπτυξη:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

Αυτό ήταν—την επόμενη φορά που θα τρέξετε `azd up`, το μήνυμα εκτυπώνεται αυτόματα. Μπορείτε επίσης να τρέξετε ένα hook μόνο του, χωρίς πλήρη ανάπτυξη, που είναι ιδανικό για δοκιμές:

```bash
azd hooks run postdeploy
```

Οι παρακάτω φάσεις δείχνουν hooks πραγματικού κόσμου (μεταναστεύσεις, δοκιμές, επικύρωση) για κάθε στάδιο.

### Φάση 1: Hooks πριν το Provision
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### Φάση 2: Provision Υποδομής
- Διαβάζει πρότυπα υποδομής (Bicep/Terraform)
- Δημιουργεί ή ενημερώνει πόρους Azure
- Ρυθμίζει δικτύωση και ασφάλεια
- Ρυθμίζει παρακολούθηση και καταγραφή

### Φάση 3: Hooks μετά το Provision
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### Φάση 4: Πακέτα Εφαρμογής
- Δημιουργεί κώδικα εφαρμογής
- Δημιουργεί αντικείμενα ανάπτυξης
- Πακετάρει για στοχευμένη πλατφόρμα (containers, αρχεία ZIP, κλπ.)

### Φάση 5: Hooks πριν την Ανάπτυξη
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### Φάση 6: Ανάπτυξη Εφαρμογής
- Αναπτύσσει πακεταρισμένες εφαρμογές σε υπηρεσίες Azure
- Ενημερώνει ρυθμίσεις διαμόρφωσης
- Ξεκινά/επαναφέρει υπηρεσίες

### Φάση 7: Hooks μετά την Ανάπτυξη
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### Διαχείριση Σφαλμάτων Hooks

Από προεπιλογή, **αν μια εντολή hook τερματίσει με μη μηδενικό κωδικό, το azd σταματά όλη την λειτουργία.** Αυτό συνήθως είναι το επιθυμητό—μια αποτυχημένη μετανάστευση πρέπει να σταματά την ανάπτυξη, όχι να αποστέλλει μια σπασμένη εφαρμογή. Αλλά σημαίνει ότι τα hooks πρέπει να γράφονται προσεκτικά.

**1. Κάντε τις αποτυχίες ηχηρές και σκόπιμες.** Ένα hook αποτυγχάνει όταν η τελευταία εντολή του επιστρέφει μη μηδενικό κωδικό εξόδου. Στα shell scripts, προσθέστε `set -e` ώστε το hook να σταματά στην πρώτη αποτυχημένη εντολή αντί να συνεχίζει αθόρυβα:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. Επιτρέψτε σε ένα hook να αποτύχει χωρίς να σταματήσει το azd.** Για μη κρίσιμα βήματα (προαιρετική ζεστασιά cache, ενημέρωση με καλύτερη προσπάθεια), ορίστε `continueOnError: true`. Το azd καταγράφει την αποτυχία αλλά συνεχίζει:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. Δοκιμάστε hooks απομονωμένα πριν από πλήρη εκτέλεση.** Δεν χρειάζεται να τρέξετε `azd up` για να διορθώσετε ένα hook—τρέξτε το μόνο του και κάντε γρήγορες επαναλήψεις:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. Προσέξτε για κέλυφη ειδικά λειτουργικού συστήματος.** Ένα hook που χρησιμοποιεί `shell: pwsh` χρειάζεται το PowerShell εγκατεστημένο στο μηχάνημα που το τρέχει (συμπεριλαμβανομένων των agents CI). Χρησιμοποιήστε `shell: sh` για τη μεγαλύτερη φορητότητα, ή παρέχετε και τις παραλλαγές `windows` και `posix`:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **Συμβουλή αποσφαλμάτωσης:** τρέξτε οποιαδήποτε εντολή azd με `--debug` για να δείτε την ακριβή γραμμή εντολής hook και την πλήρη έξοδό της—ανεκτίμητο όταν ένα hook δουλεύει τοπικά αλλά αποτυγχάνει στο CI.

## 🎛️ Διαμόρφωση Ανάπτυξης

### Ρυθμίσεις Ανάπτυξης Ειδικές Υπηρεσίας
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### Περιβαλλοντικές Διαμορφώσεις

Αυτές είναι μόνο τοπικές τιμές azd. Χαρτογραφήστε τις ρητά σε υποδομή/διαμόρφωση runtime. Το `NODE_ENV` είναι συνήθως `production` για εφαρμογή Node που έχει αναπτυχθεί, συμπεριλαμβανομένης ανάπτυξης staging· χρησιμοποιήστε ξεχωριστή μεταβλητή φίλου εφαρμογής για να διακρίνετε τα στάδια ανάπτυξης.

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Προχωρημένα Σενάρια Ανάπτυξης

### Εφαρμογές Πολλών Υπηρεσιών
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### Blue-Green Αναπτύξεις

**Εικονογραφημένο επιχειρησιακό σκίτσο:** πρέπει να παρέχετε και τα δύο περιβάλλοντα, μια κοινή στρώση δρομολόγησης κυκλοφορίας και τα δύο παρακάτω σενάρια. Το azd δεν αλλάζει αυτόματα την κυκλοφορία ή επικυρώνει την ετοιμότητα επαναφοράς. Κρατήστε πράσινο μέχρι το μπλε να περάσει δοκιμές και να μην χρειάζεται πια επαναφορά.

```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### Canary Αναπτύξεις
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

Ο διαχωρισμός κυκλοφορίας ανήκει στη διαμόρφωση Container Apps (Bicep ή Azure CLI), όχι σε `azure.yaml` `trafficSplit` ιδιότητα. Η προεπισκόπηση/provisioning και οι επόμενες αναπτύξεις πρέπει να διατηρούν τον επιλεγμένο τρόπο αναθεώρησης και τους κανόνες δρομολόγησης.

### Σταδιακές Αναπτύξεις
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 Αναπτύξεις Container

### Αναπτύξεις Container App
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

Διαμορφώστε μυστικά runtime με `configuration.secrets`/`secretRef` (ή αναφορές Key Vault) και κλιμάκωση με `template.scale` στην υποδομή Container App. Μην εφευρίσκετε υπηρεσιακές ιδιότητες `secrets` ή `scale` στο `azure.yaml`.

### Βελτιστοποίηση Dockerfile Πολλαπλών Σταδίων
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Βελτιστοποίηση Απόδοσης

### Αναπτύξεις Ειδικές Υπηρεσίας
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### Cache της Δομής
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

Η τυπική ροή εργασίας Node χρησιμοποιεί script πακέτων· τα hooks υπηρεσίας `prepackage` μπορούν να προσθέσουν απαραίτητα βήματα. Το caching επιπέδου Docker είναι ξεχωριστό από τον ορισμό εντολής δομής υπηρεσίας.

### Αποδοτικές Αναπτύξεις Κώδικα
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 Παρακολούθηση Ανάπτυξης

### Παρακολούθηση Ανάπτυξης σε Πραγματικό Χρόνο
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### Έλεγχοι Υγείας
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

Η εφαρμογή σας πρέπει να υλοποιεί `/health`· δεν παρέχεται αυτόματα από το azd. Δεν υπάρχει γενική ιδιότητα υπηρεσίας `azure.yaml` `healthCheck`.

### Επικύρωση Μετά την Ανάπτυξη
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 Θέματα Ασφαλείας

### Διαχείριση Μυστικών
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

Το `azd env set ... --secret` είναι άκυρο. Οι απλές τιμές περιβάλλοντος είναι τοπικό απλό κείμενο· μην υποθέτετε ότι οι εντολές ανάγνωσης τις αποκρύπτουν. Οι παραπάνω εντολές αποθηκεύουν αναφορές Key Vault, αλλά η υποδομή/εφαρμογή σας πρέπει ακόμα να καταναλώνει τα μυστικά και να χορηγεί πρόσβαση runtime identity.

### Δικτυακή Ασφάλεια
Δηλώστε και καταναλώστε δικτυακές παραμέτρους σε Bicep, και χαρτογραφήστε τις στο `infra/main.parameters.json`. Δεν υπάρχει γενική επικάλυψη `infra.parameters` στο `azure.yaml`. Τα παραδείγματα τεκμηρίωσης `203.0.113.0/24` και `198.51.100.0/24` δεν είναι πραγματικά δίκτυα γραφείων/VPN· αντικαταστήστε τα με εξουσιοδοτημένα εύρη δικτύων.

### Διαχείριση Ταυτότητας και Πρόσβασης
Ενεργοποιήστε το `identity` του Container App σε Bicep και αναθέστε το απαραίτητο ρόλο επίπεδου δεδομένων Key Vault στο εύρος του Vault. Διαμορφώστε ονομασμένα μυστικά βασισμένα σε Key Vault και αναφορές runtime σε αυτόν τον πόρο· το `identity` και `keyVault` δεν είναι γενικές ιδιότητες υπηρεσίας azd. Δείτε [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md).

## 🚨 Στρατηγικές Επαναφοράς

### Γρήγορη Επαναφορά
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### Επαναφορά Υποδομής
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### Επαναφορά Μετανάστευσης Βάσης Δεδομένων
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Μετρικές Ανάπτυξης

### Παρακολούθηση Απόδοσης Ανάπτυξης
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### Συλλογή Προσαρμοσμένων Μετρικών
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 Βέλτιστες Πρακτικές

### 1. Συνοχή Περιβάλλοντος
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. Επικύρωση Υποδομής
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. Ενσωμάτωση Δοκιμών
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. Τεκμηρίωση και Καταγραφή
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Επόμενα Βήματα

- [Provisioning Πόρων](provisioning.md) - Εκτενής εισαγωγή στη διαχείριση υποδομής
- [Σχεδιασμός πριν την Ανάπτυξη](../chapter-06-pre-deployment/capacity-planning.md) - Προγραμματίστε τη στρατηγική ανάπτυξής σας
- [Συνηθισμένα Προβλήματα](../chapter-07-troubleshooting/common-issues.md) - Επίλυση προβλημάτων ανάπτυξης
- [Βέλτιστες Πρακτικές](../chapter-07-troubleshooting/debugging.md) - Στρατηγικές ανάπτυξης έτοιμες για παραγωγή

## 🎯 Πρακτικές Ασκήσεις Ανάπτυξης

### Άσκηση 1: Ροή Εργασίας Αύξησης Ανάπτυξης (20 λεπτά)
**Στόχος**: Κατακτήστε τη διαφορά μεταξύ πλήρους και αύξησης αναπτύξεων

**Αρχικό σημείο:** Bash, Node.js 22, Git, σύνδεση azd και συνδρομή Azure με δικαιώματα ανάπτυξης. Τρέξτε σε νέο φάκελο· αναμένονται χρεώσιμες υπηρεσίες App Service/Cosmos DB. Οι χρόνοι εξαρτώνται από την περιοχή και το πρότυπο.

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Καταγράψτε τον χρόνο εκτέλεσης και για τις δύο εντολές (δεν υπάρχει εγγυημένη διάρκεια)
- [ ] Οι δύο εντολές ολοκληρώνονται επιτυχώς
- [ ] Το API παραμένει λειτουργικό· η επεξεργασία μόνο σχολίων δεν αλλάζει το UI ορατά
- [ ] Η υποδομή παραμένει αμετάβλητη μετά το `azd deploy`

**Αποτέλεσμα Μάθησης**: Το `azd deploy` παρακάμπτει το provisioning υποδομής. Συγκρίνετε τους μετρημένους χρόνους αντί να υποθέτετε σταθερή επιτάχυνση ποσοστού.

### Άσκηση 2: Προσαρμοσμένα Hooks Ανάπτυξης (30 λεπτά)
**Στόχος**: Υλοποιήστε αυτοματοποίηση πριν και μετά την ανάπτυξη

**Αρχικό σημείο:** το αρχικοποιημένο `deployment-practice` έργο παραπάνω. Αν το καθαρίσατε, τρέξτε ξανά `azd up` πριν δοκιμάσετε ανάπτυξη μόνο κώδικα. Η παρακάτω επικύρωση χρησιμοποιεί το πραγματικό build script του API, όχι ένα ανύπαρκτο root `test:unit` script. Οι δοκιμές API του προτύπου χρειάζονται διαμορφωμένη πρόσβαση βάσης δεδομένων· δεν είναι απομονωμένες unit tests.

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**Κριτήρια Επιτυχίας:**
- [ ] Το pre-deploy script τρέχει πριν την ανάπτυξη
- [ ] Η ανάπτυξη ακυρώνεται αν η επικύρωση build αποτύχει
- [ ] Το post-deploy smoke test επικυρώνει την υγεία
- [ ] Τα hooks εκτελούνται στη σωστή σειρά

### Άσκηση 3: Στρατηγική Ανάπτυξης Πολλαπλών Περιβαλλόντων (45 λεπτά)
**Στόχος**: Υλοποιήστε ροή εργασίας σκαλοπατωτής ανάπτυξης (dev → staging → παραγωγή)

**Σημείο εκκίνησης:** το ίδιο αρχικοποιημένο έργο todo με `jq`. Δημιουργήστε τα παρακάτω περιβάλλοντα με πραγματικές τιμές συνδρομής/τοποθεσίας (ή ορίστε `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` σε καθένα) **πριν** εκτελέσετε τη ροή εργασίας χωρίς προτροπή. Αποτυγχάνει σκοπίμως αντί να εφεύρει τις ελλείπουσες τιμές. Χρησιμοποιήστε μόνο προσωρινά περιβάλλοντα εκπαίδευσης, όχι μια πραγματική συνδρομή παραγωγής.

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**Κριτήρια Επιτυχίας:**
- [ ] Το περιβάλλον ανάπτυξης υλοποιείται με επιτυχία
- [ ] Το περιβάλλον σταδιακής ανάπτυξης υλοποιείται με επιτυχία
- [ ] Απαιτείται χειροκίνητη έγκριση για την παραγωγή
- [ ] Όλα τα περιβάλλοντα έχουν λειτουργικούς ελέγχους υγείας
- [ ] Μπορεί να γίνει επαναφορά αν χρειαστεί

### Άσκηση 4: Στρατηγική Επαναφοράς (25 λεπτά)
**Στόχος**: Εφαρμόστε και δοκιμάστε την επαναφορά ανάπτυξης χρησιμοποιώντας Git

**Σημείο εκκίνησης:** μια απομονωμένη εκπαιδευτική αντιγραφή του προτύπου todo με όλο τον βασικό κώδικα δεσμευμένο, ένα καθαρό δέντρο εργασίας Git και ένα προσωρινά ρυθμισμένο περιβάλλον. Μην εισάγετε σκόπιμα αποτυχίες σε ένα πραγματικό έργο παραγωγής. `APP_VERSION` παρακάτω είναι μόνο για λογιστική εκτός εάν το συνδέσετε ρητά στην εφαρμογή.

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**Κριτήρια Επιτυχίας:**
- [ ] Μπορεί να ανιχνεύσει αποτυχίες ανάπτυξης
- [ ] Το σενάριο επαναφοράς εκτελείται αυτόματα
- [ ] Η εφαρμογή επανέρχεται σε λειτουργική κατάσταση
- [ ] Οι έλεγχοι υγείας περνούν μετά την επαναφορά

## 📊 Παρακολούθηση Μετρικών Ανάπτυξης

### Παρακολουθήστε την Απόδοση της Ανάπτυξής σας

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**Αναλύστε τις μετρικές σας:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Επιπλέον Πόροι

- [Αναφορά ανάπτυξης Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Ανάπτυξη Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Ανάπτυξη Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Ανάπτυξη Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Το Πρώτο σας Έργο](../chapter-01-foundation/first-project.md)
- **Επόμενο Μάθημα**: [Παροχή Πόρων](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->