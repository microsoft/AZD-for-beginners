# വിന്യസന മാർഗ്ഗനിർദേശം - AZD വിന്യസനങ്ങളിൽ പ്രാവീണ്യം നേടുക

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD തുടക്കക്കാർക്ക്](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 4 - ഇൻഫ്രാസ്ട്രക്ചർ അസ്സ് കോഡ് & വിന്യസനം
- **⬅️ മുമ്പ് വന്ന അദ്ധ്യായം**: [അദ്ധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)
- **➡️ അടുത്തത്**: [റിസോഴ്‌സുകൾ പ്രൊവിഷനിംഗ്](provisioning.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 5: മൾട്ടി-ഏജന്റ് AI സൊല്യൂഷനുകൾ](../../examples/retail-scenario.md)

## പരിചയം

Azure Developer CLI ഉപയോഗിച്ച് ആപ്ലിക്കേഷനുകൾ വിന്യസിക്കുന്നതിന് ആവശ്യമായ എല്ലാ കാര്യങ്ങളിലും ഈ സമഗ്ര മാർഗ്ഗനിർദേശമാണ് ഉൾപ്പെടുത്തിയിരിക്കുന്നത്, അവങ്ങളിൽ അടിയന്തര ഏക കമാൻഡ് വിന്യസനങ്ങളിൽ നിന്നു്, കസ്റ്റം ഹുക്കുകൾ, മൾട്ടി എൻവയരവെന്റ്, CI/CD ഇന്റഗ്രേഷൻ എന്നിവ ഉൾപ്പെടുന്ന പുരോഗമന ഉത്പാദന സാഹചര്യങ്ങൾ വരെയായി. പ്രായോഗിക ഉദാഹരണങ്ങളിലൂടെയും മികച്ച പ്രാക്ടീസുകളുടേയും സഹായത്തോടെ പൂർണ്ണ വിന്യസന ലൈഫ്സൈക്കിൾ കൈകാര്യം ചെയ്യുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തീകരിച്ചാൽ, നിങ്ങൾക്ക് സാധിക്കട്ടെ:
- എല്ലാ Azure Developer CLI വിന്യസന കമാൻഡുകളും വർക്ക്ഫ്ലോകളും പ്രാവീണ്യമാക്കുക
- പ്രൊവിഷനിംഗിൽ നിന്ന് നിരീക്ഷണത്തേയ്ക്ക് പൂർണ്ണ വിന്യസന ലൈഫ്സൈക്കിൾ മനസ്സിലാക്കുക
- മുൻകൂട്ടി, ശേഷം വിന്യസനം ഓട്ടോമേഷൻ വേണ്ടി കസ്റ്റം ഹുക്കുകൾ നടപ്പാക്കുക
- എൻവയരവെന്റ്-പ്രത്യെക പരാമീറ്ററുകളുള്ള മൾട്ടി എൻവയരവെന്റുകൾ കോൺഫിഗർ ചെയ്യുക
- ബ്ലൂ-ഗ്രീൻ, കനറി വിന്യസനം ഉൾപ്പെടെ അഭിവൃദ്ധി വിന്യസന സ്ട്രാറ്റജികൾ ക്രമീകരിക്കുക
- azd വിന്യസനങ്ങൾ CI/CD പൈപ്പ്ലൈനുകളും DevOps വർക്ക്ഫ്ലോകളുമായ ഇന്റഗ്രേറ്റ് ചെയ്യുക

## പഠന ഫലങ്ങൾ

പൂർത്തീകരണതിന് ശേഷം, നിങ്ങൾക്ക് ശേഷിക്കട്ടെ:
- എല്ലാ azd വിന്യസന വർക്ക്ഫ്ലോകളും സ്വതന്ത്രമായി നടത്തുകയും പ്രശ്നപരിഹാരം നടത്തുകയും ചെയ്യുക
- ഹുക്കുകൾ ഉപയോഗിച്ച് കസ്റ്റം വിന്യസന ഓട്ടോമേഷന് രൂപകൽപ്പന ചെയ്ത് നടപ്പിലാക്കുക
- ശരിയായ സുരക്ഷയും നിരീക്ഷണവുമുള്ള ഉത്പാദന-സജ്ജ വിന്യസനങ്ങൾ കോൺഫിഗർ ചെയ്യുക
- സങ്കീർണ്ണ മൾട്ടി-എൻവയരവെന്റ് വിന്യസന സാഹചര്യങ്ങൾ കൈകാര്യം ചെയ്യുക
- വിന്യസന പ്രകടനം മെച്ചപ്പെടുത്തുകയും റോള്ബാക്ക് സ്ട്രാറ്റജികൾ നടപ്പിലാക്കുകയും ചെയ്യുക
- azd വിന്യസനങ്ങൾ എന്റർപ്രൈസ് DevOps പ്രാക്ടീസുകളിൽ ഉൾപ്പെടുത്തുക

## വിന്യസന അവലോകനം

Azure Developer CLI നിരവധി വിന്യസന കമാൻഡുകൾ നൽകുന്നു:
- `azd up` - പൂർണ വർക്ക്ഫ്ലോ (പ്രൊവിഷൻ + വിന്യസനം)
- `azd provision` - Azure റിസോഴ്‌സുകൾ സൃഷ്ടിക്കുക/പുതുക്കുക മാത്രം
- `azd deploy` - ആപ്ലിക്കേഷൻ കോഡ് വിന്യസിക്കുക മാത്രം
- `azd package` - ആപ്ലിക്കേഷനുകൾ ബിൽഡ് ചെയ്ത് പാക്കേജ് ചെയ്യുക

## അടിസ്ഥാന വിന്യസന വർക്ക്ഫ്ലോകൾ

### പൂർണ്ണ വിന്യസനം (azd up)
പുതിയ പദ്ധതികളിലേക്കുള്ള ഏറ്റവും സാധാരണവരുന്ന വർക്ക്ഫ്ലോ:
```bash
# എല്ലാം പൂർണമായും സ്ഥാപിക്കുക
azd up

# പ്രത്യേക പരിസ്ഥിതിക്ക് അനുയോജ്യമായി സ്ഥാപിക്കുക
azd up --environment production

# ഇഷ്ടാനുസൃത പാരാമീറ്ററുകളോടെ സ്ഥാപിക്കുക
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ഇൻഫ്രാസ്ട്രക്ചർ-മാത്രം വിന്യസനം
നിങ്ങൾക്ക് Azure റിസോഴ്‌സുകൾ മാത്രം പുതുക്കേണ്ടതുണ്ടെങ്കിൽ:
```bash
# അടിസ്ഥാന സൗകര്യം ഒരുക്കുക/പുതുക്കുക
azd provision

# മാറ്റങ്ങൾ മുൻകൂട്ടി കാണാനായി ഡ്രൈ-റൺ ഉപയോഗിച്ച് ഒരുക്കുക
azd provision --preview

# പ്രത്യേക സേവനങ്ങൾ ഒരുക്കുക
azd provision --service database
```

### കോഡ് മാത്രം വിന്യസനം
വേഗത്തിൽ ആപ്ലിക്കേഷൻ അപ്ഡേറ്റുകൾക്കായി:
```bash
# എല്ലാ സേവനങ്ങളും വിന്യസിക്കുക
azd deploy

# പ്രതീക്ഷിക്കപ്പെട്ട ഔട്ട്‌പുട്ട്:
# സേവനങ്ങൾ വിന്യസിക്കുന്നു (azd deploy)
# - വെബ്: വിന്യസിക്കുന്നു... പൂർത്തിയായി
# - ആപി: വിന്യസിക്കുന്നു... പൂർത്തിയായി
# വിജയം: നിങ്ങളുടെ വിന്യാസം 2 മിനിറ്റ് 15 സെക്കൻഡിൽ പൂർത്തിയായി

# പ്രത്യേക സേവനം വിന്യസിക്കുക
azd deploy --service web
azd deploy --service api

# സ്വന്തമായ ബിൽഡ്_ARGUMENTS കൾ ഉപയോഗിച്ച് വിന്യസിക്കുക
azd deploy --service api --build-arg NODE_ENV=production

# വിന്യാസം സ്ഥിരീകരിക്കുക
azd show --output json | jq '.services'
```

### ✅ വിന്യസന പരിശോధന

ഏതു വിന്യസനത്തിനും ശേഷം വിജയം പരിശോധിക്കുക:

```bash
# എല്ലാ സേവനങ്ങളും നടത്തപ്പെട്ടു കൊണ്ട് ఉందെന്ന് പരിശോദിക്കുക
azd show

# ആരോഗ്യ എന്റ്പോയിന്റുകൾ പരിശോദിക്കുക
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# പിശകുകൾക്കായി നിരീക്ഷിക്കുക (ഡിഫോൾട്ടായി ബ്രൗസറിൽ തുറക്കും)
azd monitor --logs
```

**വിജയം മാനദണ്ഡങ്ങൾ:**
- ✅ എല്ലാ സേവനങ്ങളും "രunning" സ്ഥിതിയിലാണ്
- ✅ ഹെൽത്ത് എൻഡ്പോയിന്റുകൾ HTTP 200 പ്രതികരിക്കുന്നു
- ✅ കഴിഞ്ഞ 5 മിനിറ്റിൽ പിശക് ലോഗുകൾ ഇല്ല
- ✅ ആപ്ലിക്കേഷൻ ടെസ്റ്റ് അഭ്യർത്ഥനകളെ പ്രതികരിക്കുന്നു

## 🏗️ വിന്യസന പ്രക്രിയ മനസ്സിലാക്കൽ

### ഘട്ടം 1: മുൻ- പ്രൊവിഷൻ ഹുക്കുകൾ
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

### ഘട്ടം 2: ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ്
- ഇൻഫ്രാസ്ട്രക്ചർ ടെംപ്ലേറ്റുകൾ വായിക്കുന്നു (Bicep/Terraform)
- Azure റിസോഴ്‌സുകൾ സൃഷ്ടിക്കുകയും പുതുക്കുകയും ചെയ്യുന്നു
- നെറ്റ്വർക്കിംഗ്, സുരക്ഷാ സംവിധാനം ക്രമീകരിക്കുന്നു
- നിരീക്ഷണവും ലോഗും സജ്ജമാക്കുന്നു

### ഘട്ടം 3: ശേഷിപ്പർവ്വ പ്രൊവിഷൻ ഹുക്കുകൾ
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

### ഘട്ടം 4: ആപ്ലിക്കേഷൻ പാക്കേജിംഗ്
- ആപ്ലിക്കേഷൻ കോഡ് ബിൽഡ് ചെയ്യുന്നു
- വിന്യസന ആർട്ടിഫാക്റ്റുകൾ സൃഷ്ടിക്കുന്നു
- ലക്ഷ്യ പ്ലാറ്റ്ഫോമിന് (കണ്ടെയ്‌നറുകൾ, ZIP ഫയലുകൾ തുടങ്ങിയവ) പാക്കേജ് ചെയ്യുന്നു

### ഘട്ടം 5: മുൻ- വിന്യസനം ഹുക്കുകൾ
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

### ഘട്ടം 6: ആപ്ലിക്കേഷൻ വിന്യസനം
- പാക്കേഡായ ആപ്ലിക്കേഷനുകൾ Azure സേവനങ്ങളിൽ വിന്യസിക്കുന്നു
- കോൺഫിഗറേഷൻ സെറ്റിങ്ങുകൾ പുതുക്കുന്നു
- സേവനങ്ങൾ ആരംഭിക്കുന്നതു്/പുനരാരംഭിക്കുന്നതു്

### ഘട്ടം 7: ശേഷിപ്പർവ്വ വിന്യസനം ഹുക്കുകൾ
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

## 🎛️ വിന്യസന കോൺഫിഗറേഷൻ

### സേവന-പ്രത്യേക വിന്യസന ക്രമീകരണങ്ങൾ
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

### എൻവയരവെന്റ്-പ്രത്യേക കോൺഫിഗറേഷനുകൾ
```bash
# വികസന പരിസ്ഥിതി
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# സ്റ്റേജിംഗ് പരിസ്ഥിതി
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ഉത്പാദന പരിസ്ഥിതി
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 അഭിവൃദ്ധി വിന്യസന പ്രസംഗങ്ങൾ

### മൾട്ടി-സേവീസ് ആപ്ലിക്കേഷനുകൾ
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

### ബ്ലൂ-ഗ്രീൻ വിന്യസനങ്ങൾ
```bash
# നീല പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new production-blue
azd up --environment production-blue

# നീല പരിസ്ഥിതി പരിശോധന നടത്തുക
./scripts/test-environment.sh production-blue

# ട്രാഫിക് നീലത്തിലേക്ക് മാറുക (മാനുവൽ DNS/ലോഡ് ബാലൻസർ അപ്ഡേറ്റ്)
./scripts/switch-traffic.sh production-blue

# പച്ച പരിസ്ഥിതി ശുചീകരിക്കുക
azd env select production-green
azd down --force
```

### കനറി വിന്യസനങ്ങൾ
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

### ഘട്ടം അടിസ്ഥാന വിന്യസനങ്ങൾ
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

## 🐳 കൺടെയ്‌നർ വിന്യസനങ്ങൾ

### കൺടെയ്‌നർ ആപ്പ് വിന്യസനങ്ങൾ
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

### മൾട്ടി-ഘട്ട ഡോക്കർഫൈൽ ഒപ്റ്റിമൈസേഷൻ
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

## ⚡ പ്രകടനം മെച്ചപ്പെടുത്തൽ

### സേവന-പ്രത്യേക വിന്യസനങ്ങൾ
```bash
# വേഗതയുള്ള പുനരാവൃത്തി വേണ്ടി ഒരു നിർദ്ദിഷ്ട സേവനം വിന്യസിക്കുക
azd deploy --service web
azd deploy --service api

# എല്ലാ സേവനങ്ങളും വിന്യസിക്കുക
azd deploy
```

### ബിൽഡ് കാഷിംഗ്
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### കാര്യക്ഷമമായ കോഡ് വിന്യസനങ്ങൾ
```bash
# കോഡ്-മാത്രം മാറ്റങ്ങൾക്ക് azd deploy (azd up അല്ല ) ഉപയോഗിക്കുക
# ഇത് ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് ഒഴിവാക്കുകയും അതിനാൽ വേഗത്തിൽ പ്രവർത്തിക്കുകയും ചെയ്യുന്നു
azd deploy

# ഏറ്റവും വേഗം ആവർത്തനത്തിനായി പ്രത്യേക സേവനം ഡീപ്ലോ ചെയ്യുക
azd deploy --service api
```

## 🔍 വിന്യസന നിരീക്ഷണം

### യഥാർത്ഥകാല വിന്യസന നിരീക്ഷണം
```bash
# റിയൽ ടൈമിൽ അപ്ലിക്കേഷൻ നിരീക്ഷിക്കുക
azd monitor --live

# അപ്ലിക്കേഷൻ ലോഗുകൾ കാണുക
azd monitor --logs

# വിന്യാസ സ്റ്റാറ്റസ് പരിശോധിക്കുക
azd show
```

### ഹെൽത്ത് ചെക്കുകൾ
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

### വിന്യസനം കഴിഞ്ഞുള്ള പരിശോധന
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# ആപ്പിന്റെ ആരോഗ്യ പരിശോധന നടത്തുക
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

## 🔐 സുരക്ഷാ പരിഗണനകൾ

### രഹസ്യങ്ങൾ മാനേജ്മെന്റ്
```bash
# രഹസ്യങ്ങൾ സുരക്ഷിതമായി സൂക്ഷിക്കുക
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml ൽ രഹസ്യങ്ങളെ റഫറൻസ് ചെയ്യുക
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

### നെറ്റ്വർക്ക് സുരക്ഷ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ഐഡന്റിറ്റി ആൻഡ് ആക്‌സസ് മാനേജ്മെന്റ്
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

## 🚨 റോള്ബാക്ക് സ്ട്രാറ്റജികൾ

### ത्वरിത റോള്ബാക്ക്
```bash
# AZD-നു നടപ്പാക്കിയ വഴിമാറൽ ആണ് ഇല്ല. ശുപാർശ ചെയ്ത സമീപനങ്ങൾ:

# ഓപ്ഷൻ 1: ഗിറ്റിൽ നിന്ന് വീണ്ടും വിനിയോഗിക്കുക (ശുപാർശ ചെയ്യുന്നു)
git revert HEAD  # പ്രശ്നമുള്ള കമിറ്റ് മടങ്ങിപ്പിടിക്കുക
git push
azd deploy

# ഓപ്ഷൻ 2: പ്രത്യേക കമിറ്റ് വീണ്ടും വിനിയോഗിക്കുക
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ഇൻഫ്രാസ്ട്രക്ചർ റോള്ബാക്ക്
```bash
# തുടർന്ന് പ്രയോഗിക്കുന്നതിനു മുമ്പ് ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ കാണുക
azd provision --preview

# ഇൻഫ്രാസ്ട്രക്ചർ റോള്ബാക്കിനായി, പതിപ്പ് നിയന്ത്രണം ഉപയോഗിക്കുക:
git revert HEAD  # ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ മടക്കി മാറ്റുക
azd provision    # മുൻ നടപടിയിൽ ഉണ്ടായിരുന്ന ഇൻഫ്രാസ്ട്രക്ചർ നില പ്രയോഗിക്കുക
```

### ഡേറ്റാബേസ് മൈഗ്രേഷൻ റോള്ബാക്ക്
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 വിന്യസന മെട്രിക്‌സ്

### വിന്യസന പ്രകടനം ട്രാക്ക് ചെയ്യുക
```bash
# നിലവിലെ വിന്യാസ സ്ഥിതി കാണുക
azd show

# അപേക്ഷ അപ്പ്ലിക്കേഷൻ ഇൻസൈറ്റ്സിനൊപ്പം നിരീക്ഷിക്കുക
azd monitor --overview

# ലൈവ് ഉപമാനങ്ങൾ കാണുക
azd monitor --live
```

### കസ്റ്റം മെട്രിക്‌സ് ശേഖരണം
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

## 🎯 മികച്ച പ്രാക്ടീസുകൾ

### 1. എൻവയരവെന്റ് സ്ഥിരത
```bash
# ഏകോപിതമായ പേരു നാമകരണം ഉപയോഗിക്കുക
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# പരിസ്ഥിതി സാമ്യമുണ്ടാക്കുക
./scripts/sync-environments.sh
```

### 2. ഇൻഫ്രാസ്ട്രക്ചർ പരിശോധന
```bash
# വിന്യാസം നിരീക്ഷണത്തിനു മുമ്പു അടിസ്ഥാനസൗകര്യ മാറ്റങ്ങള്‍ മുമ്പാക്കുക
azd provision --preview

# ARM/Bicep ലിന്റിംഗ് ഉപയോഗിക്കുക
az bicep lint --file infra/main.bicep

# Bicep വാക്യരചന പരിശോധന നടത്തുക
az bicep build --file infra/main.bicep
```

### 3. ടെസ്റ്റിംഗ് ഇന്റഗ്രേഷൻ
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

### 4. ഡോക്യുമെന്റേഷൻ & ലോഗിംഗ്
```bash
# പ്രമേയ പ്രയോജന നിർവഹണ നടപടികൾ രേഖപ്പെടുത്തുക
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## അടുത്ത പടികള്‍

- [റിസോഴ്‌സുകൾ പ്രൊവിഷനിംഗ്](provisioning.md) - ഇൻഫ്രാസ്ട്രക്ചർ മാനേജ്മെന്റിലേക്ക് ഗഹനമായി
- [മുൻ-വിന്യസന പദ്ധതി](../chapter-06-pre-deployment/capacity-planning.md) - നിങ്ങളുടെ വിന്യസന തന്ത്രം തയ്യാറാക്കുക
- [സാധാരണ പ്രശ്നങ്ങൾ](../chapter-07-troubleshooting/common-issues.md) - വിന്യസന പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- [മികച്ച പ്രാക്ടീസുകൾ](../chapter-07-troubleshooting/debugging.md) - ഉത്പാദന-സജ്ജ വിന്യസന സ്ട്രാറ്റജികൾ

## 🎯 കൈകഴിവ് വിന്യസന അഭ്യാസങ്ങൾ

### അഭ്യാസം 1: ഇൻക്രീമെൻറൽ വിന്യസന വർക്ക്ഫ്ലോ (20 മിനിറ്റ്)
**ലക്ഷ്യം**: പൂർണ്ണവും ഇൻക്രീമെൻറലുമായ വിന്യസനങ്ങളിൽ വ്യത്യാസം പ്രാവീണ്യമാക്കുക

```bash
# പ്രാഥമിക വിന്യാസം
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# പ്രാഥമിക വിന്യാസ സമയത്തെ രേഖപ്പെടുത്തുക
echo "Full deployment: $(date)" > deployment-log.txt

# കോഡ് മാറ്റം ചെയ്യുക
echo "// Updated $(date)" >> src/api/src/server.js

# കോഡ് മാത്രം വിന്യസിക്കുക (വേഗം)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# സമയങ്ങൾ താരതമ്യം ചെയ്യുക
cat deployment-log.txt

# ശുചീകരണം നടത്തുക
azd down --force --purge
```

**വിജയം മാനദണ്ഡങ്ങൾ:**
- [ ] പൂർണ്ണ വിന്യസനം 5-15 മിനിറ്റ് എടുക്കണം
- [ ] കോഡ് മാത്രം വിന്യസനം 2-5 മിനിറ്റ് എടുക്കണം
- [ ] വിന്യസിച്ച ആപ്പിൽ കോഡ് മാറ്റങ്ങൾ പ്രതിഫലിക്കുന്നത്
- [ ] `azd deploy` കഴിഞ്ഞു ഇൻഫ്രാസ്ട്രക്ചർ അപ്രസക്തം

**പഠന ഫലം**: കോഡ് മാറ്റങ്ങൾ ആശ്രയിച്ച് `azd deploy` `azd up`ന്റെ 50-70% വേഗതയിൽ പ്രവർത്തിക്കുന്നു

### അഭ്യാസം 2: കസ്റ്റം വിന്യസന ഹുക്കുകൾ (30 മിനിറ്റ്)
**ലക്ഷ്യം**: മുൻ-വിന്യസനവും ശേഷിപ്പർവ്വ വിന്യസനവും ഓട്ടോമേറ്റ് ചെയ്യുക

```bash
# പ്രീ-ഡിപ്ലോയ് വാലിഡേഷൻ സ്ക്രിപ್ಟ್ സൃഷ്ടിക്കുക
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ടെസ്റ്റുകൾ പാസാകുന്നുണ്ടോ എന്ന് പരിശോധിക്കുക
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# കമ്മിറ്റ്ചെയ്യാത്ത മാറ്റങ്ങൾ ഉണ്ടോ എന്ന് പരിശോധിക്കുക
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# പോസ്റ്റ്-ഡിപ്ലോയ് സ്മോക്ക് ടെസ്റ്റ് സൃഷ്ടിക്കുക
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

# ആസ്യൂർ.yaml ലേക്ക് ഹൂക്കുകൾ ചേർക്കുക
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ഹൂക്കുകൾ ഉപയോഗിച്ച് ഡിപ്ലോയ്‌മെന്റ് ടെസ്റ്റ് ചെയ്യുക
azd deploy
```

**വിജയം മാനദണ്ഡങ്ങൾ:**
- [ ] മുൻ-വിന്യസന സ്ക്രിപ്റ്റ് വിന്യസനത്തിനു മുമ്പ് പ്രവർത്തണം
- [ ] ടെസ്റ്റുകളിൽ പരാജയം വന്നാൽ വിന്യസനം നിർത്തൽ
- [ ] ശേഷിപ്പർവ്വ സ്മോക്ക് ടെസ്റ്റ് ഹെൽത്ത് പരിശോധന നടത്തണം
- [ ] ഹുക്കുകൾ ശരിയായ ക്രമത്തിൽ പ്രവർത്തണം

### അഭ്യാസം 3: മൾട്ടി-എൻവയരവെന്റ് വിന്യസന തന്ത്രം (45 മിനിറ്റ്)
**ലക്ഷ്യം**: ഘട്ടം അടിസ്ഥാന വിന്യസന വർക്ക്ഫ്ലോ നടപ്പാക്കുക (dev → staging → production)

```bash
# ഡിപ്ലോയ്മെന്റ് സ്ക്രിപ്റ്റ് സൃഷ്ടിക്കുക
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ഘട്ടം 1: ഡെവിൽ ഡിപ്ലോയ് ചെയ്യുക
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ഘട്ടം 2: സ്റ്റേജിംഗ് ഡിപ്ലോയ് ചെയ്യുക
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ഘട്ടം 3: പ്രൊഡക്ഷനായി മാനുവൽ അംഗീകാരം
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

# പരിസരങ്ങൾ സൃഷ്ടിക്കുക
azd env new dev
azd env new staging
azd env new production

# സ്റ്റേജ്ഡ് ഡിപ്ലോയ്മെന്റ് চালിക്കുക
./deploy-staged.sh
```

**വിജയം മാനദണ്ഡങ്ങൾ:**
- [ ] ഡെവ് എൻവയരവെന്റ് വിജയകരമായി വിന്യസിക്കുകയും ചെയ്യുന്നു
- [ ] സ്റ്റേജിംഗ് എൻവയരവെന്റ് വിജയകരമായി വിന്യസിക്കുകയും ചെയ്യുന്നു
- [ ] ഉത്പാദനത്തിന് മാനുവൽ അംഗീകാരം ആവശ്യമാണ്
- [ ] എല്ലാ എൻവയരവെന്റിലും പ്രവർത്തനക്ഷമ ഹെൽത്ത് ചെക്കുകൾ ഉണ്ട്
- [ ] ആവശ്യമെങ്കിലു് റോള്ബാക്ക് നടത്താം

### അഭ്യാസം 4: റോള്ബാക്ക് സ്ട്രാറ്റജി (25 മിനിറ്റ്)
**ലക്ഷ്യം**: Git ഉപയോഗിച്ച് വിന്യസനം റോള്ബാക്ക് നടപ്പാക്കുകയും പരിശോധിക്കുകയും ചെയ്യുക

```bash
# v1 വിന്യസിക്കുക
azd env set APP_VERSION "1.0.0"
azd up

# v1 കമ്മിറ്റ് ഹാഷ് സംരക്ഷിക്കുക
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ബ്രേക്കിംഗ് മാറ്റവുമായി v2 വിന്യസിക്കുക
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# പരാജയം തിരിച്ചറിയുക, റോള്ബാക്ക് ചെയ്യുക
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ഉപയോഗിച്ച് റോള്ബാക്ക് ചെയ്യുക
    git revert HEAD --no-edit
    
    # പരിസ്ഥിതി റോള്ബാക്ക് ചെയ്യുക
    azd env set APP_VERSION "1.0.0"
    
    # v1 പുനഃവിന്യസിക്കുക
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**വിജയം മാനദണ്ഡങ്ങൾ:**
- [ ] വിന്യസന പരാജയങ്ങൾ കണ്ടെത്താൻ കഴിയും
- [ ] റോള്ബാക്ക് സ്ക്രിപ്റ്റ് സ്വയമേധയാ പ്രവർത്തിക്കുന്നു
- [ ] ആപ്ലിക്കേഷൻ പ്രവർത്തനക്ഷമമായ നിലയിലെത്തുന്നു
- [ ] റോള്ബാക്ക് ശേഷം ഹെൽത്ത് ചെക്കുകൾ വിജയകരമാണ്

## 📊 വിന്യസന മെട്രിക്‌സ് ട്രാക്കിംഗ്

### നിങ്ങളുടെ വിന്യസന പ്രകടനം ട്രാക്കുചെയ്യുക

```bash
# ഡിപ്ലോയ്മെന്റ് മെറ്റ്രിക്‌സ് സ്‌ക്രിപ്റ്റ് സൃഷ്ടിക്കുക
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

# ഫയലിൽ ലോഗ് ചെയ്യുക
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ഇത് ഉപയോഗിക്കുക
./track-deployment.sh
```

**നിങ്ങളുടെ മെട്രിക്‌സ് വിശകലനം ചെയ്യുക:**
```bash
# വിന്യസന ചരിത്രം കാണുക
cat deployment-metrics.csv

# ശരാശരി വിന്യസന സമയം കണക്കാക്കുക
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## അധിക സ്രോതസുകൾ

- [Azure Developer CLI വിന്യസന റഫറൻസ്](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service വിന്യസനം](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps വിന്യസനം](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions വിന്യസനം](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [നിങ്ങളുടെ ആദ്യ പദ്ധതി](../chapter-01-foundation/first-project.md)
- **അടുത്ത പാഠം**: [റിസോഴ്‌സുകൾ പ്രൊവിഷനിംഗ്](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**കുറിപ്പ്**:  
ഈ പ്രമാണം AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. നമുക്ക് സാധ്യമായത്ര ശുദ്ധിശുദ്ധമായ വിവർത്തനം സാധ്യമാക്കുവാൻ ശ്രമിച്ചാലും, യന്ത്രവൽക്കൃത പരിഭാഷകളിൽ പിശകുകളും അപവർത്തനങ്ങളും ഉണ്ടാകാനിടയുണ്ടെന്ന് ദയവായി മനസ്സിലാക്കുക. ആസലിലുള്ള ഭാഷയിൽ ഉള്ള മൂല പ്രമാണം മാത്രമാണ് അതിന്റെ അവകാശപ്രമാണം. സുപ്രധാന വിവരങ്ങൾക്കായി, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം നിർദ്ദേശിക്കപ്പെടുന്നു. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽനിന്ന് ഉണ്ടാകാവുന്ന কোনো തെറ്റിദ്ധാരണകൾക്കോ തെറ്റുനിരൂപണങ്ങൾക്കോ ഞങ്ങൾ ഉത്തരവാദിത്തം വഹിക്കുന്നില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->