<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6832562a3a3c5cfa9d8b172025ae2fa4",
  "translation_date": "2025-09-17T22:40:21+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "el"
}
-->
# Οδηγός Ανάπτυξης - Κατακτώντας τις Αναπτύξεις με AZD

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 4 - Υποδομή ως Κώδικας & Ανάπτυξη
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 3: Ρύθμιση](../getting-started/configuration.md)
- **➡️ Επόμενο**: [Διάθεση Πόρων](provisioning.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 5: Λύσεις AI με Πολλαπλούς Πράκτορες](../../examples/retail-scenario.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός καλύπτει όλα όσα χρειάζεστε για να αναπτύξετε εφαρμογές χρησιμοποιώντας το Azure Developer CLI, από βασικές αναπτύξεις με μία εντολή έως προηγμένα σενάρια παραγωγής με προσαρμοσμένα hooks, πολλαπλά περιβάλλοντα και ενσωμάτωση CI/CD. Κατακτήστε τον πλήρη κύκλο ζωής ανάπτυξης με πρακτικά παραδείγματα και βέλτιστες πρακτικές.

## Στόχοι Μάθησης

Με την ολοκλήρωση αυτού του οδηγού, θα:
- Κατανοήσετε όλες τις εντολές και τις ροές εργασίας ανάπτυξης του Azure Developer CLI
- Κατανοήσετε τον πλήρη κύκλο ζωής ανάπτυξης από τη διάθεση έως την παρακολούθηση
- Εφαρμόσετε προσαρμοσμένα hooks για αυτοματοποίηση πριν και μετά την ανάπτυξη
- Ρυθμίσετε πολλαπλά περιβάλλοντα με παραμέτρους συγκεκριμένες για κάθε περιβάλλον
- Εφαρμόσετε προηγμένες στρατηγικές ανάπτυξης, όπως blue-green και canary deployments
- Ενσωματώσετε τις αναπτύξεις azd σε pipelines CI/CD και workflows DevOps

## Αποτελέσματα Μάθησης

Με την ολοκλήρωση, θα μπορείτε να:
- Εκτελείτε και να αντιμετωπίζετε προβλήματα σε όλες τις ροές εργασίας ανάπτυξης azd ανεξάρτητα
- Σχεδιάζετε και να υλοποιείτε προσαρμοσμένη αυτοματοποίηση ανάπτυξης χρησιμοποιώντας hooks
- Ρυθμίζετε αναπτύξεις έτοιμες για παραγωγή με σωστή ασφάλεια και παρακολούθηση
- Διαχειρίζεστε σύνθετα σενάρια ανάπτυξης πολλαπλών περιβαλλόντων
- Βελτιστοποιείτε την απόδοση ανάπτυξης και να εφαρμόζετε στρατηγικές επαναφοράς
- Ενσωματώνετε τις αναπτύξεις azd σε πρακτικές DevOps για επιχειρήσεις

## Επισκόπηση Ανάπτυξης

Το Azure Developer CLI παρέχει διάφορες εντολές ανάπτυξης:
- `azd up` - Πλήρης ροή εργασίας (διάθεση + ανάπτυξη)
- `azd provision` - Δημιουργία/ενημέρωση μόνο πόρων Azure
- `azd deploy` - Ανάπτυξη μόνο του κώδικα εφαρμογής
- `azd package` - Δημιουργία και πακετάρισμα εφαρμογών

## Βασικές Ροές Εργασίας Ανάπτυξης

### Πλήρης Ανάπτυξη (azd up)
Η πιο συνηθισμένη ροή εργασίας για νέα έργα:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### Ανάπτυξη Μόνο Υποδομής
Όταν χρειάζεται να ενημερώσετε μόνο τους πόρους Azure:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### Ανάπτυξη Μόνο Κώδικα
Για γρήγορες ενημερώσεις εφαρμογών:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ Κατανόηση της Διαδικασίας Ανάπτυξης

### Φάση 1: Hooks Πριν τη Διάθεση
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

### Φάση 2: Διάθεση Υποδομής
- Διαβάζει πρότυπα υποδομής (Bicep/Terraform)
- Δημιουργεί ή ενημερώνει πόρους Azure
- Ρυθμίζει δικτύωση και ασφάλεια
- Εγκαθιστά παρακολούθηση και καταγραφή

### Φάση 3: Hooks Μετά τη Διάθεση
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
- Δημιουργεί τον κώδικα της εφαρμογής
- Δημιουργεί αντικείμενα ανάπτυξης
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
- Αναπτύσσει πακεταρισμένες εφαρμογές σε υπηρεσίες Azure
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

### Ρυθμίσεις Ανάπτυξης Ειδικές για Υπηρεσίες
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

### Ρυθμίσεις Ειδικές για Περιβάλλοντα
```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
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

## 🐳 Αναπτύξεις Containers

### Αναπτύξεις Εφαρμογών Container
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
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### Cache Δημιουργίας
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
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 Παρακολούθηση Ανάπτυξης

### Παρακολούθηση Ανάπτυξης σε Πραγματικό Χρόνο
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
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

### Επικύρωση Μετά την Ανάπτυξη
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Check application health
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
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
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
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### Επαναφορά Υποδομής
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### Επαναφορά Μετατροπής Βάσης Δεδομένων
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 Μετρήσεις Ανάπτυξης

### Παρακολούθηση Απόδοσης Ανάπτυξης
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
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
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## Επόμενα Βήματα

- [Διάθεση Πόρων](provisioning.md) - Εμβάθυνση στη διαχείριση υποδομής
- [Σχεδιασμός Πριν την Ανάπτυξη](../pre-deployment/capacity-planning.md) - Σχεδιάστε τη στρατηγική ανάπτυξής σας
- [Συνηθισμένα Προβλήματα](../troubleshooting/common-issues.md) - Επίλυση προβλημάτων ανάπτυξης
- [Βέλτιστες Πρακτικές](../troubleshooting/debugging.md) - Στρατηγικές ανάπτυξης έτοιμες για παραγωγή

## Πρόσθετοι Πόροι

- [Αναφορά Ανάπτυξης Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Ανάπτυξη Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Ανάπτυξη Azure Container Apps](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Ανάπτυξη Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Το Πρώτο σας Έργο](../getting-started/first-project.md)
- **Επόμενο Μάθημα**: [Διάθεση Πόρων](provisioning.md)

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.