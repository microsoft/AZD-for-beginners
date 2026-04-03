# Οδηγός Ανάπτυξης - Κατάκτηση των Αναπτύξεων AZD

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική του Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 4 - Υποδομή ως Κώδικας και Ανάπτυξη
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)
- **➡️ Επόμενο**: [Παροχή Πόρων](provisioning.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 5: Λύσεις AI με Πολλούς Πράκτορες](../../examples/retail-scenario.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός καλύπτει όσα χρειάζεται να γνωρίζετε για την ανάπτυξη εφαρμογών χρησιμοποιώντας Azure Developer CLI, από βασικές αναπτύξεις με μία εντολή έως προηγμένα σενάρια παραγωγής με προσαρμοσμένα hooks, πολλαπλά περιβάλλοντα και ενσωμάτωση CI/CD. Κατακτήστε ολόκληρο τον κύκλο ζωής ανάπτυξης με πρακτικά παραδείγματα και βέλτιστες πρακτικές.

## Στόχοι Μάθησης

Ολοκληρώνοντας αυτόν τον οδηγό, θα:
- Κατακτήσετε όλες τις εντολές και ροές εργασίας ανάπτυξης του Azure Developer CLI
- Κατανοήσετε τον πλήρη κύκλο ζωής ανάπτυξης από την παροχή πόρων μέχρι την παρακολούθηση
- Εφαρμόσετε προσαρμοσμένα hooks ανάπτυξης για αυτοματοποίηση πριν και μετά την ανάπτυξη
- Διαμορφώσετε πολλαπλά περιβάλλοντα με παραμέτρους ειδικές για κάθε περιβάλλον
- Ρυθμίσετε προηγμένες στρατηγικές ανάπτυξης, συμπεριλαμβανομένων blue-green και canary deployments
- Ενσωματώσετε αναπτύξεις azd με pipelines CI/CD και ροές εργασίας DevOps

## Μαθησιακά Αποτελέσματα

Με την ολοκλήρωση, θα μπορείτε να:
- Εκτελείτε και αντιμετωπίζετε προβλήματα με όλες τις ροές εργασίας ανάπτυξης azd ανεξάρτητα
- Σχεδιάσετε και υλοποιήσετε προσαρμοσμένη αυτοματοποίηση ανάπτυξης χρησιμοποιώντας hooks
- Διαμορφώσετε αναπτύξεις έτοιμες για παραγωγή με κατάλληλη ασφάλεια και παρακολούθηση
- Διαχειριστείτε σύνθετα σενάρια ανάπτυξης με πολλαπλά περιβάλλοντα
- Βελτιστοποιήσετε την απόδοση ανάπτυξης και υλοποιήσετε στρατηγικές επαναφοράς (rollback)
- Ενσωματώσετε τις αναπτύξεις azd στις πρακτικές DevOps επιχείρησης

## Επισκόπηση Ανάπτυξης

Το Azure Developer CLI παρέχει αρκετές εντολές ανάπτυξης:
- `azd up` - Πλήρης ροή εργασίας (παροχή πόρων + ανάπτυξη)
- `azd provision` - Δημιουργία/ενημέρωση μόνο πόρων Azure
- `azd deploy` - Αναπτύσσει μόνο τον κώδικα εφαρμογής
- `azd package` - Δημιουργεί και πακετάρει εφαρμογές

## Βασικές Ροές Εργασίας Ανάπτυξης

### Πλήρης Ανάπτυξη (azd up)
The most common workflow for new projects:
```bash
# Αναπτύξτε τα πάντα από το μηδέν
azd up

# Αναπτύξτε σε συγκεκριμένο περιβάλλον
azd up --environment production

# Αναπτύξτε με προσαρμοσμένες παραμέτρους
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Ανάπτυξη Μόνο Υποδομής
Όταν χρειάζεται μόνο να ενημερώσετε πόρους Azure:
```bash
# Παροχή/ενημέρωση υποδομής
azd provision

# Παροχή με δοκιμαστική εκτέλεση (dry-run) για προεπισκόπηση αλλαγών
azd provision --preview

# Παροχή συγκεκριμένων υπηρεσιών
azd provision --service database
```

### Ανάπτυξη Μόνο Κώδικα
Για γρήγορες ενημερώσεις εφαρμογής:
```bash
# Αναπτύξτε όλες τις υπηρεσίες
azd deploy

# Αναμενόμενη έξοδος:
# Ανάπτυξη υπηρεσιών (azd deploy)
# - web: Αναπτύσσεται... Ολοκληρώθηκε
# - api: Αναπτύσσεται... Ολοκληρώθηκε
# ΕΠΙΤΥΧΙΑ: Η ανάπτυξή σας ολοκληρώθηκε σε 2 λεπτά 15 δευτερόλεπτα

# Αναπτύξτε συγκεκριμένη υπηρεσία
azd deploy --service web
azd deploy --service api

# Αναπτύξτε με προσαρμοσμένες παραμέτρους κατασκευής
azd deploy --service api --build-arg NODE_ENV=production

# Επαληθεύστε την ανάπτυξη
azd show --output json | jq '.services'
```

### ✅ Επαλήθευση Ανάπτυξης

Μετά από κάθε ανάπτυξη, επαληθεύστε την επιτυχία:

```bash
# Ελέγξτε ότι όλες οι υπηρεσίες εκτελούνται
azd show

# Δοκιμάστε τα endpoints υγείας
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Παρακολουθήστε για σφάλματα (ανοίγει στον περιηγητή από προεπιλογή)
azd monitor --logs
```

**Κριτήρια Επιτυχίας:**
- ✅ Όλες οι υπηρεσίες εμφανίζουν κατάσταση «Σε λειτουργία»
- ✅ Τα endpoints υγείας επιστρέφουν HTTP 200
- ✅ Καμία καταγραφή σφάλματος στα τελευταία 5 λεπτά
- ✅ Η εφαρμογή ανταποκρίνεται σε δοκιμαστικά αιτήματα

## 🏗️ Κατανόηση της Διαδικασίας Ανάπτυξης

### Φάση 1: Hooks πριν την παροχή πόρων
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

### Φάση 2: Παροχή Υποδομής
- Διαβάζει πρότυπα υποδομής (Bicep/Terraform)
- Δημιουργεί ή ενημερώνει πόρους Azure
- Διαμορφώνει δίκτυα και ασφάλεια
- Ρυθμίζει παρακολούθηση και καταγραφή

### Φάση 3: Hooks μετά την παροχή πόρων
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

### Φάση 4: Πακετάρισμα Εφαρμογής
- Κατασκευάζει τον κώδικα της εφαρμογής
- Δημιουργεί αρχεία ανάπτυξης
- Πακετάρει για την στοχευμένη πλατφόρμα (containers, αρχεία ZIP, κ.λπ.)

### Φάση 5: Hooks πριν την ανάπτυξη
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
- Εκκινεί/επανεκκινεί υπηρεσίες

### Φάση 7: Hooks μετά την ανάπτυξη
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

## 🎛️ Ρύθμιση Ανάπτυξης

### Ρυθμίσεις Ανάπτυξης ανά Υπηρεσία
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### Διαμορφώσεις ειδικές για κάθε Περιβάλλον
```bash
# Περιβάλλον ανάπτυξης
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Περιβάλλον προπαραγωγής
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Περιβάλλον παραγωγής
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 Προηγμένα Σενάρια Ανάπτυξης

### Εφαρμογές με Πολλές Υπηρεσίες
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

### Αναπτύξεις Blue-Green
```bash
# Δημιουργήστε το μπλε περιβάλλον
azd env new production-blue
azd up --environment production-blue

# Δοκιμάστε το μπλε περιβάλλον
./scripts/test-environment.sh production-blue

# Μεταφέρετε την κυκλοφορία στο μπλε περιβάλλον (χειροκίνητη ενημέρωση DNS/εξισορρόπησης φορτίου)
./scripts/switch-traffic.sh production-blue

# Καθαρίστε το πράσινο περιβάλλον
azd env select production-green
azd down --force
```

### Αναπτύξεις Canary
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### Σταδιακές Αναπτύξεις
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
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
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### Βελτιστοποίηση Πολυστάδιου Dockerfile
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ Βελτιστοποίηση Απόδοσης

### Αναπτύξεις ανά Υπηρεσία
```bash
# Αναπτύξτε μια συγκεκριμένη υπηρεσία για γρηγορότερη επανάληψη
azd deploy --service web
azd deploy --service api

# Αναπτύξτε όλες τις υπηρεσίες
azd deploy
```

### Cache Κατασκευής
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### Αποτελεσματικές Αναπτύξεις Κώδικα
```bash
# Χρησιμοποιήστε azd deploy (όχι azd up) για αλλαγές που αφορούν μόνο τον κώδικα
# Αυτό παρακάμπτει την παροχή υποδομών και είναι πολύ πιο γρήγορο
azd deploy

# Αναπτύξτε συγκεκριμένη υπηρεσία για ταχύτερη επανάληψη
azd deploy --service api
```

## 🔍 Παρακολούθηση Ανάπτυξης

### Παρακολούθηση Ανάπτυξης σε Πραγματικό Χρόνο
```bash
# Παρακολούθηση εφαρμογής σε πραγματικό χρόνο
azd monitor --live

# Προβολή αρχείων καταγραφής εφαρμογής
azd monitor --logs

# Έλεγχος κατάστασης ανάπτυξης
azd show
```

### Έλεγχοι Υγείας
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### Επικύρωση μετά την Ανάπτυξη
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Έλεγχος υγείας εφαρμογής
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
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
# Αποθηκεύστε τα μυστικά με ασφάλεια
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Αναφέρετε τα μυστικά στο azure.yaml
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### Ασφάλεια Δικτύου
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Διαχείριση Ταυτότητας και Πρόσβασης
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 Στρατηγικές Επαναφοράς (Rollback)

### Γρήγορη Επαναφορά
```bash
# Το AZD δεν έχει ενσωματωμένη λειτουργία επαναφοράς. Συνιστώμενες προσεγγίσεις:

# Επιλογή 1: Επαναανάπτυξη από το Git (συνιστάται)
git revert HEAD  # Αναστρέψτε το προβληματικό commit
git push
azd deploy

# Επιλογή 2: Επαναανάπτυξη συγκεκριμένου commit
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### Επαναφορά Υποδομής
```bash
# Προεπισκόπηση αλλαγών στην υποδομή πριν την εφαρμογή
azd provision --preview

# Για επαναφορά της υποδομής, χρησιμοποιήστε τον έλεγχο εκδόσεων:
git revert HEAD  # Αναίρεση αλλαγών στην υποδομή
azd provision    # Εφαρμογή προηγούμενης κατάστασης της υποδομής
```

### Επαναφορά Μεταφοράς Βάσης Δεδομένων
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
# Προβολή τρέχουσας κατάστασης ανάπτυξης
azd show

# Παρακολούθηση της εφαρμογής με το Application Insights
azd monitor --overview

# Προβολή ζωντανών μετρικών
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
# Χρησιμοποιήστε συνεπή ονοματοδοσία
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Διατηρήστε την ομοιομορφία μεταξύ των περιβαλλόντων
./scripts/sync-environments.sh
```

### 2. Επικύρωση Υποδομής
```bash
# Προεπισκοπήστε τις αλλαγές στην υποδομή πριν την ανάπτυξη
azd provision --preview

# Χρησιμοποιήστε linting για ARM/Bicep
az bicep lint --file infra/main.bicep

# Επικυρώστε τη σύνταξη του Bicep
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
# Τεκμηριώστε τις διαδικασίες ανάπτυξης
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Επόμενα Βήματα

- [Παροχή Πόρων](provisioning.md) - Εμβάθυνση στη διαχείριση υποδομής
- [Σχεδιασμός πριν την Ανάπτυξη](../chapter-06-pre-deployment/capacity-planning.md) - Σχεδιάστε τη στρατηγική ανάπτυξής σας
- [Συνήθη Προβλήματα](../chapter-07-troubleshooting/common-issues.md) - Επίλυση προβλημάτων ανάπτυξης
- [Βέλτιστες Πρακτικές](../chapter-07-troubleshooting/debugging.md) - Στρατηγικές ανάπτυξης έτοιμες για παραγωγή

## 🎯 Πρακτικές Ασκήσεις Ανάπτυξης

### Άσκηση 1: Ροή Εργασίας Βηματικής Ανάπτυξης (20 λεπτά)
**Στόχος**: Κατακτήστε τη διαφορά μεταξύ πλήρων και βηματικών αναπτύξεων

```bash
# Αρχική ανάπτυξη
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Καταγράψτε τον χρόνο αρχικής ανάπτυξης
echo "Full deployment: $(date)" > deployment-log.txt

# Κάντε μια αλλαγή στον κώδικα
echo "// Updated $(date)" >> src/api/src/server.js

# Αναπτύξτε μόνο τον κώδικα (γρήγορα)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Συγκρίνετε τους χρόνους
cat deployment-log.txt

# Καθαρίστε
azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Η πλήρης ανάπτυξη διαρκεί 5-15 λεπτά
- [ ] Η ανάπτυξη μόνο του κώδικα διαρκεί 2-5 λεπτά
- [ ] Οι αλλαγές στον κώδικα εμφανίζονται στην αναπτυχθείσα εφαρμογή
- [ ] Η υποδομή παραμένει αμετάβλητη μετά το `azd deploy`

**Μαθησιακό Αποτέλεσμα**: Το `azd deploy` είναι 50-70% ταχύτερο από το `azd up` για αλλαγές κώδικα

### Άσκηση 2: Προσαρμοσμένα Hooks Ανάπτυξης (30 λεπτά)
**Στόχος**: Υλοποιήστε αυτοματοποίηση πριν και μετά την ανάπτυξη

```bash
# Δημιουργήστε σενάριο επικύρωσης πριν την ανάπτυξη
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# Ελέγξτε αν περνούν οι δοκιμές
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# Ελέγξτε για μη δεσμευμένες αλλαγές
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Δημιουργήστε δοκιμή smoke μετά την ανάπτυξη
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Προσθέστε hooks στο azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Δοκιμάστε την ανάπτυξη με hooks
azd deploy
```

**Κριτήρια Επιτυχίας:**
- [ ] Το script πριν την ανάπτυξη εκτελείται πριν την ανάπτυξη
- [ ] Η ανάπτυξη ακυρώνεται εάν αποτύχουν οι δοκιμές
- [ ] Το smoke test μετά την ανάπτυξη επικυρώνει την υγεία
- [ ] Τα hooks εκτελούνται στη σωστή σειρά

### Άσκηση 3: Στρατηγική Ανάπτυξης για Πολλαπλά Περιβάλλοντα (45 λεπτά)
**Στόχος**: Υλοποιήστε ροή σταδιακής ανάπτυξης (dev → staging → production)

```bash
# Δημιουργία σεναρίου ανάπτυξης
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Βήμα 1: Ανάπτυξη στο dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Βήμα 2: Ανάπτυξη στο staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# Βήμα 3: Χειροκίνητη έγκριση για παραγωγή
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Δημιουργία περιβαλλόντων
azd env new dev
azd env new staging
azd env new production

# Εκτέλεση σταδιακής ανάπτυξης
./deploy-staged.sh
```

**Κριτήρια Επιτυχίας:**
- [ ] Το περιβάλλον dev αναπτύσσεται επιτυχώς
- [ ] Το περιβάλλον staging αναπτύσσεται επιτυχώς
- [ ] Απαιτείται χειροκίνητη έγκριση για την παραγωγή
- [ ] Όλα τα περιβάλλοντα έχουν λειτουργικούς ελέγχους υγείας
- [ ] Μπορεί να γίνει επαναφορά εάν χρειαστεί

### Άσκηση 4: Στρατηγική Επαναφοράς (25 λεπτά)
**Στόχος**: Υλοποιήστε και δοκιμάστε επαναφορά ανάπτυξης χρησιμοποιώντας Git

```bash
# Ανάπτυξη v1
azd env set APP_VERSION "1.0.0"
azd up

# Αποθήκευση hash commit v1
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Ανάπτυξη v2 με ασύμβατη αλλαγή
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# Εντοπισμός αποτυχίας και επαναφορά
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Επαναφορά χρησιμοποιώντας git
    git revert HEAD --no-edit
    
    # Επαναφορά περιβάλλοντος
    azd env set APP_VERSION "1.0.0"
    
    # Επαναανάπτυξη v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Κριτήρια Επιτυχίας:**
- [ ] Μπορεί να εντοπίσει αποτυχίες ανάπτυξης
- [ ] Το script επαναφοράς εκτελείται αυτόματα
- [ ] Η εφαρμογή επιστρέφει σε λειτουργική κατάσταση
- [ ] Οι έλεγχοι υγείας περνούν μετά την επαναφορά

## 📊 Παρακολούθηση Μετρικών Ανάπτυξης

### Παρακολουθήστε την Απόδοση της Ανάπτυξής σας

```bash
# Δημιουργήστε σενάριο μετρήσεων ανάπτυξης
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Καταγράψτε σε αρχείο
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Χρησιμοποιήστε το
./track-deployment.sh
```

**Αναλύστε τις μετρικές σας:**
```bash
# Προβολή ιστορικού ανάπτυξης
cat deployment-metrics.csv

# Υπολογισμός μέσου χρόνου ανάπτυξης
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## Πρόσθετοι Πόροι

- [Αναφορά Ανάπτυξης Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Ανάπτυξη Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Ανάπτυξη Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Ανάπτυξη Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Το Πρώτο σας Έργο](../chapter-01-foundation/first-project.md)
- **Επόμενο Μάθημα**: [Παροχή Πόρων](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση Ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρότι επιδιώκουμε την ακρίβεια, παρακαλούμε να λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η επικρατούσα πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για οποιεσδήποτε παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->