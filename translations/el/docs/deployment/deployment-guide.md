# Οδηγός Ανάπτυξης - Κατακτώντας τις Αναπτύξεις με AZD

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 4 - Υποδομή ως Κώδικας & Ανάπτυξη
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 3: Ρύθμιση](../getting-started/configuration.md)
- **➡️ Επόμενο**: [Δημιουργία Πόρων](provisioning.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 5: Λύσεις AI με Πολλαπλούς Πράκτορες](../../examples/retail-scenario.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός καλύπτει όλα όσα χρειάζεστε για να αναπτύξετε εφαρμογές χρησιμοποιώντας το Azure Developer CLI, από βασικές αναπτύξεις με μία εντολή έως προηγμένα σενάρια παραγωγής με προσαρμοσμένα hooks, πολλαπλά περιβάλλοντα και ενσωμάτωση CI/CD. Κατακτήστε τον πλήρη κύκλο ζωής ανάπτυξης με πρακτικά παραδείγματα και βέλτιστες πρακτικές.

## Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του οδηγού, θα:
- Κατανοήσετε όλες τις εντολές και τις ροές εργασίας ανάπτυξης του Azure Developer CLI
- Κατανοήσετε τον πλήρη κύκλο ζωής ανάπτυξης από τη δημιουργία πόρων έως την παρακολούθηση
- Εφαρμόσετε προσαρμοσμένα hooks ανάπτυξης για αυτοματοποίηση πριν και μετά την ανάπτυξη
- Ρυθμίσετε πολλαπλά περιβάλλοντα με παραμέτρους συγκεκριμένες για κάθε περιβάλλον
- Εφαρμόσετε προηγμένες στρατηγικές ανάπτυξης, όπως blue-green και canary deployments
- Ενσωματώσετε τις αναπτύξεις azd σε pipelines CI/CD και workflows DevOps

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση, θα μπορείτε να:
- Εκτελέσετε και να αντιμετωπίσετε προβλήματα σε όλες τις ροές εργασίας ανάπτυξης azd ανεξάρτητα
- Σχεδιάσετε και να υλοποιήσετε προσαρμοσμένη αυτοματοποίηση ανάπτυξης χρησιμοποιώντας hooks
- Ρυθμίσετε αναπτύξεις έτοιμες για παραγωγή με σωστή ασφάλεια και παρακολούθηση
- Διαχειριστείτε σύνθετα σενάρια ανάπτυξης πολλαπλών περιβαλλόντων
- Βελτιστοποιήσετε την απόδοση ανάπτυξης και να εφαρμόσετε στρατηγικές επαναφοράς
- Ενσωματώσετε τις αναπτύξεις azd σε πρακτικές DevOps για επιχειρήσεις

## Επισκόπηση Ανάπτυξης

Το Azure Developer CLI παρέχει διάφορες εντολές ανάπτυξης:
- `azd up` - Πλήρης ροή εργασίας (δημιουργία πόρων + ανάπτυξη)
- `azd provision` - Δημιουργία/ενημέρωση μόνο πόρων Azure
- `azd deploy` - Ανάπτυξη μόνο του κώδικα εφαρμογής
- `azd package` - Δημιουργία και πακετάρισμα εφαρμογών

## Βασικές Ροές Εργασίας Ανάπτυξης

### Πλήρης Ανάπτυξη (azd up)
Η πιο συνηθισμένη ροή εργασίας για νέα έργα:
```bash
# Αναπτύξτε τα πάντα από την αρχή
azd up

# Αναπτύξτε με συγκεκριμένο περιβάλλον
azd up --environment production

# Αναπτύξτε με προσαρμοσμένες παραμέτρους
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Ανάπτυξη Μόνο Υποδομής
Όταν χρειάζεται να ενημερώσετε μόνο τους πόρους Azure:
```bash
# Παροχή/ενημέρωση υποδομής
azd provision

# Παροχή με dry-run για προεπισκόπηση αλλαγών
azd provision --preview

# Παροχή συγκεκριμένων υπηρεσιών
azd provision --service database
```

### Ανάπτυξη Μόνο Κώδικα
Για γρήγορες ενημερώσεις εφαρμογών:
```bash
# Ανάπτυξη όλων των υπηρεσιών
azd deploy

# Αναμενόμενο αποτέλεσμα:
# Ανάπτυξη υπηρεσιών (azd deploy)
# - web: Ανάπτυξη... Ολοκληρώθηκε
# - api: Ανάπτυξη... Ολοκληρώθηκε
# ΕΠΙΤΥΧΙΑ: Η ανάπτυξή σας ολοκληρώθηκε σε 2 λεπτά και 15 δευτερόλεπτα

# Ανάπτυξη συγκεκριμένης υπηρεσίας
azd deploy --service web
azd deploy --service api

# Ανάπτυξη με προσαρμοσμένα επιχειρήματα κατασκευής
azd deploy --service api --build-arg NODE_ENV=production

# Επαλήθευση ανάπτυξης
azd show --output json | jq '.services'
```

### ✅ Επαλήθευση Ανάπτυξης

Μετά από κάθε ανάπτυξη, επαληθεύστε την επιτυχία:

```bash
# Ελέγξτε ότι όλες οι υπηρεσίες λειτουργούν
azd show

# Δοκιμάστε τα endpoints υγείας
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# Ελέγξτε τα αρχεία καταγραφής για σφάλματα
azd logs --service api --since 5m | grep -i error
```

**Κριτήρια Επιτυχίας:**
- ✅ Όλες οι υπηρεσίες εμφανίζουν κατάσταση "Running"
- ✅ Τα endpoints υγείας επιστρέφουν HTTP 200
- ✅ Δεν υπάρχουν σφάλματα στα logs των τελευταίων 5 λεπτών
- ✅ Η εφαρμογή ανταποκρίνεται σε αιτήματα δοκιμής

## 🏗️ Κατανόηση της Διαδικασίας Ανάπτυξης

### Φάση 1: Hooks Πριν τη Δημιουργία Πόρων
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

### Φάση 2: Δημιουργία Υποδομής
- Διαβάζει πρότυπα υποδομής (Bicep/Terraform)
- Δημιουργεί ή ενημερώνει πόρους Azure
- Ρυθμίζει δικτύωση και ασφάλεια
- Εγκαθιστά παρακολούθηση και καταγραφή

### Φάση 3: Hooks Μετά τη Δημιουργία Πόρων
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
- Δημιουργεί τον κώδικα εφαρμογής
- Δημιουργεί artifacts ανάπτυξης
- Πακετάρει για την πλατφόρμα στόχο (containers, αρχεία ZIP, κ.λπ.)

### Φάση 5: Hooks Πριν την Ανάπτυξη
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
- Αναπτύσσει πακεταρισμένες εφαρμογές στις υπηρεσίες Azure
- Ενημερώνει ρυθμίσεις παραμέτρων
- Ξεκινά/επανεκκινεί υπηρεσίες

### Φάση 7: Hooks Μετά την Ανάπτυξη
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

### Ρυθμίσεις Ανάπτυξης Ανά Υπηρεσία
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

### Ρυθμίσεις Ανά Περιβάλλον
```bash
# Περιβάλλον ανάπτυξης
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Περιβάλλον δοκιμών
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

### Εφαρμογές Πολλαπλών Υπηρεσιών
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

### Blue-Green Deployments
```bash
# Δημιουργήστε μπλε περιβάλλον
azd env new production-blue
azd up --environment production-blue

# Δοκιμάστε το μπλε περιβάλλον
./scripts/test-environment.sh production-blue

# Μεταφέρετε την κίνηση στο μπλε (χειροκίνητη ενημέρωση DNS/φορτωτή εξισορρόπησης)
./scripts/switch-traffic.sh production-blue

# Καθαρίστε το πράσινο περιβάλλον
azd env select production-green
azd down --force
```

### Canary Deployments
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

## 🐳 Ανάπτυξη Containers

### Ανάπτυξη Εφαρμογών Container
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

### Βελτιστοποίηση Dockerfile Πολλαπλών Σταδίων
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

### Παράλληλες Αναπτύξεις
```bash
# Διαμόρφωση παράλληλης ανάπτυξης
azd config set deploy.parallelism 5

# Ανάπτυξη υπηρεσιών παράλληλα
azd deploy --parallel
```

### Caching Κατασκευής
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### Επαυξητικές Αναπτύξεις
```bash
# Αναπτύξτε μόνο τις υπηρεσίες που έχουν αλλάξει
azd deploy --incremental

# Αναπτύξτε με ανίχνευση αλλαγών
azd deploy --detect-changes
```

## 🔍 Παρακολούθηση Ανάπτυξης

### Παρακολούθηση Ανάπτυξης σε Πραγματικό Χρόνο
```bash
# Παρακολουθήστε την πρόοδο της ανάπτυξης
azd deploy --follow

# Δείτε τα αρχεία καταγραφής της ανάπτυξης
azd logs --follow --service api

# Ελέγξτε την κατάσταση της ανάπτυξης
azd show --service api
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

### Επαλήθευση Μετά την Ανάπτυξη
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Ελέγξτε την υγεία της εφαρμογής
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

## 🔐 Σκέψεις Ασφαλείας

### Διαχείριση Μυστικών
```bash
# Αποθηκεύστε τα μυστικά με ασφάλεια
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Αναφορά μυστικών στο azure.yaml
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

## 🚨 Στρατηγικές Επαναφοράς

### Γρήγορη Επαναφορά
```bash
# Επαναφορά στην προηγούμενη ανάπτυξη
azd deploy --rollback

# Επαναφορά συγκεκριμένης υπηρεσίας
azd deploy --service api --rollback

# Επαναφορά σε συγκεκριμένη έκδοση
azd deploy --service api --version v1.2.3
```

### Επαναφορά Υποδομής
```bash
# Επαναφορά αλλαγών υποδομής
azd provision --rollback

# Προεπισκόπηση αλλαγών επαναφοράς
azd provision --rollback --preview
```

### Επαναφορά Μετακίνησης Βάσης Δεδομένων
```bash
#!/bin/bash
# scripts/αναίρεση-βάσης-δεδομένων.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Μετρήσεις Ανάπτυξης

### Παρακολούθηση Απόδοσης Ανάπτυξης
```bash
# Ενεργοποίηση μετρήσεων ανάπτυξης
azd config set telemetry.deployment.enabled true

# Προβολή ιστορικού ανάπτυξης
azd history

# Λήψη στατιστικών ανάπτυξης
azd metrics --type deployment
```

### Συλλογή Προσαρμοσμένων Μετρήσεων
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

### 1. Συνέπεια Περιβάλλοντος
```bash
# Χρησιμοποιήστε συνεπή ονοματοδοσία
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Διατηρήστε την ισοτιμία περιβάλλοντος
./scripts/sync-environments.sh
```

### 2. Επαλήθευση Υποδομής
```bash
# Επικύρωση πριν από την ανάπτυξη
azd provision --preview
azd provision --what-if

# Χρησιμοποιήστε ARM/Bicep linting
az bicep lint --file infra/main.bicep
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
# Τεκμηρίωση διαδικασιών ανάπτυξης
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Επόμενα Βήματα

- [Δημιουργία Πόρων](provisioning.md) - Εμβάθυνση στη διαχείριση υποδομής
- [Σχεδιασμός Πριν την Ανάπτυξη](../pre-deployment/capacity-planning.md) - Σχεδιάστε τη στρατηγική ανάπτυξής σας
- [Συνηθισμένα Προβλήματα](../troubleshooting/common-issues.md) - Επίλυση προβλημάτων ανάπτυξης
- [Βέλτιστες Πρακτικές](../troubleshooting/debugging.md) - Στρατηγικές ανάπτυξης έτοιμες για παραγωγή

## 🎯 Ασκήσεις Ανάπτυξης

### Άσκηση 1: Ροή Εργασίας Επαυξητικής Ανάπτυξης (20 λεπτά)
**Στόχος**: Κατανοήστε τη διαφορά μεταξύ πλήρους και επαυξητικής ανάπτυξης

```bash
# Αρχική ανάπτυξη
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# Καταγραφή χρόνου αρχικής ανάπτυξης
echo "Full deployment: $(date)" > deployment-log.txt

# Κάντε μια αλλαγή στον κώδικα
echo "// Updated $(date)" >> src/api/src/server.js

# Αναπτύξτε μόνο τον κώδικα (γρήγορα)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Συγκρίνετε τους χρόνους
cat deployment-log.txt

# Καθαρισμός
azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Η πλήρης ανάπτυξη διαρκεί 5-15 λεπτά
- [ ] Η ανάπτυξη μόνο κώδικα διαρκεί 2-5 λεπτά
- [ ] Οι αλλαγές στον κώδικα αντικατοπτρίζονται στην εφαρμογή
- [ ] Η υποδομή παραμένει αμετάβλητη μετά το `azd deploy`

**Αποτέλεσμα Μάθησης**: Το `azd deploy` είναι 50-70% ταχύτερο από το `azd up` για αλλαγές κώδικα

### Άσκηση 2: Προσαρμοσμένα Hooks Ανάπτυξης (30 λεπτά)
**Στόχος**: Εφαρμόστε αυτοματοποίηση πριν και μετά την ανάπτυξη

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

# Δημιουργήστε δοκιμή καπνού μετά την ανάπτυξη
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

# Προσθέστε γάντζους στο azure.yaml
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# Δοκιμάστε την ανάπτυξη με γάντζους
azd deploy
```

**Κριτήρια Επιτυχίας:**
- [ ] Το script πριν την ανάπτυξη εκτελείται πριν την ανάπτυξη
- [ ] Η ανάπτυξη ακυρώνεται αν αποτύχουν οι δοκιμές
- [ ] Το smoke test μετά την ανάπτυξη επαληθεύει την υγεία
- [ ] Τα hooks εκτελούνται με τη σωστή σειρά

### Άσκηση 3: Στρατηγική Ανάπτυξης Πολλαπλών Περιβαλλόντων (45 λεπτά)
**Στόχος**: Εφαρμόστε ροή εργασίας σταδιακής ανάπτυξης (dev → staging → production)

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
- [ ] Απαιτείται χειροκίνητη έγκριση για το production
- [ ] Όλα τα περιβάλλοντα έχουν λειτουργικούς ελέγχους υγείας
- [ ] Μπορεί να γίνει επαναφορά αν χρειαστεί

### Άσκηση 4: Στρατηγική Επαναφοράς (25 λεπτά)
**Στόχος**: Εφαρμόστε και δοκιμάστε επαναφορά ανάπτυξης

```bash
# Ανάπτυξη v1
azd env set APP_VERSION "1.0.0"
azd up

# Αποθήκευση ρύθμισης v1
cp -r .azure/production .azure/production-v1-backup

# Ανάπτυξη v2 με αλλαγή που προκαλεί προβλήματα
echo "throw new Error('Intentional break')" >> src/api/src/server.js
azd env set APP_VERSION "2.0.0"
azd deploy

# Ανίχνευση αποτυχίας
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Επαναφορά κώδικα
    git checkout src/api/src/server.js
    
    # Επαναφορά περιβάλλοντος
    azd env set APP_VERSION "1.0.0"
    
    # Επαναανάπτυξη v1
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**Κριτήρια Επιτυχίας:**
- [ ] Μπορεί να εντοπιστούν αποτυχίες ανάπτυξης
- [ ] Το script επαναφοράς εκτελείται αυτόματα
- [ ] Η εφαρμογή επιστρέφει σε λειτουργική κατάσταση
- [ ] Οι έλεγχοι υγείας περνούν μετά την επαναφορά

## 📊 Παρακολούθηση Μετρήσεων Ανάπτυξης

### Παρακολουθήστε την Απόδοση Ανάπτυξής σας

```bash
# Δημιουργία σεναρίου μετρήσεων ανάπτυξης
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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Καταγραφή σε αρχείο
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# Χρησιμοποίησέ το
./track-deployment.sh
```

**Αναλύστε τις μετρήσεις σας:**
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
- **Προηγούμενο Μάθημα**: [Το Πρώτο σας Έργο](../getting-started/first-project.md)
- **Επόμενο Μάθημα**: [Δημιουργία Πόρων](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->