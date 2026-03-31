# പ്രയോഗനിർഭന്ധ ഗൈഡ് - AZD ഡിപ്പ്ലോയ്മെന്റുകൾ ആധികാരി

**അദ്ധ്യായം നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 4 - കണക്സ്ട്രക്ഷൻ കോഡ് & ഡിപ്പ്ലോയ്മെന്റ്
- **⬅️ മുൻ അദ്ധ്യായം**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [Provisioning Resources](provisioning.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## പരിചയം

Azure Developer CLI ഉപയോഗിച്ച് ആപ്ലിക്കേഷനുകൾ ഡിപ്പ്ലോ ചെയ്‌തെടുക്കാനുള്ള എല്ലാ വിഷയങ്ങളും ഉൾക്കൊള്ളുന്ന ഈ സവിശേഷ ഗൈഡ്, അടിസ്ഥാന ഒറ്റ കമാൻഡിൽ നിന്നു കസ്റ്റം ഹൂക്കുകൾ, ഒന്നിലധികം പരിസ്ഥിതികൾ, CI/CD ഇന്റഗ്രേഷൻ എന്നിവയുണർന്ന ഉത്പാദന senario കളിലേക്ക് പ്രായോഗിക ഉദാഹരണങ്ങളോടും മികച്ച രീതികളോടും കൂടെയാണ്. സമഗ്രമായ ഡിപ്പ്ലോയ്മെന്റ് ജീവിതചക്രം ഈ ഗൈഡ് വഴി കൈവരിക്കും.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂര്‍ത്തീകരിച്ചാൽ, നിങ്ങൾക്ക്:
- Azure Developer CLI ഡിപ്പ്ലോയ്മെന്റ് കമാൻഡുകളും വർക്ഫ്‌ലോകളും കേന്ദ്രീകരിച്ച് അഭ്യസിക്കാൻ കഴിയും
- പ്രൊവിഷനിംഗ് മുതൽ നിരീക്ഷണം വരെ മുഴുവൻ ഡിപ്പ്ലോയ്മെന്റ് ജീവിതചക്രം മനസിലാക്കാം
- മുൻപും പിന്നീട് ഡിപ്പ്ലോയ്മെന്റ് ഓട്ടോമേഷനു കസ്റ്റം ഹൂക്കുകൾ നടപ്പാക്കുക
- പരിസ്ഥിതികൾക്ക് പ്രത്യേക പാരാമീറ്ററുകളോടെ ഒന്നിലധികം പരിസ്ഥിതികൾ ക്രമീകരിക്കുക
- ബ്ലൂ-ഗ്രീൻ, കനറി ഡിപ്പ്ലോയ്മെന്റ് പോലുള്ള ആധുനിക ഡിപ്പ്ലോയ്മെന്റ് സ്ട്രാറ്റജികൾ സജ്ജമാക്കുക
- azd ഡിപ്പ്ലോയ്മെന്റുകൾ CI/CD പൈപ്പ്ലൈനുകൾക്കും ഡെവ്‌ഓപ്സ് വർക്ഫ്‌ലോകൾക്കും ഇന്റഗ്രേറ്റ് ചെയ്യുക

## പഠനഫലം

പൂർത്തിയാക്കിയതിനു ശേഷം നിങ്ങൾക്ക് കഴിയും:
- azd ഡിപ്പ്ലോയ്മെന്റ് വർക്ഫ്‌ലോകൾ സ്വതന്ത്രമായി എക്‌സിക്യൂട്ട് ചെയ്ത് പ്രശ്നപരിഹാരം കാണുക
- ഹൂക്കുകൾ ഉപയോഗിച്ച് കസ്റ്റം ഡിപ്പ്ലോയ്മെന്റ് ഓട്ടോമേഷൻ രൂപകല്‌പന ചെയ്ത് നടപ്പിലാക്കുക
- ഉത്പാദന-സജ്ജമായ ഡിപ്പ്ലോയ്മെന്റ് സുരക്ഷയും നിരീക്ഷണവും ഉൾക്കൊള്ളിച്ച് ക്രമീകരിക്കുക
- സങ്കീർണ്ണമായ ഒന്നിലധികം പരിസ്ഥിതികളിലെ ഡിപ്പ്ലോയ്മെന്റ് സേനാര്യങ്ങൾ മാനേജ് ചെയ്യുക
- ഡിപ്പ്ലോയ്മെന്റ് പ്രവർത്തനക്ഷമത മെച്ചപ്പെടുത്തുകയും റോള്ബാക്ക് സ്ട്രാറ്റജികൾ നടപ്പാക്കുകയും ചെയ്യുക
- azd ഡിപ്പ്ലോയ്മെന്റുകൾ എന്റർപ്രൈസ് ഡെവ്‌ഓപ്സ് പ്രാക്ടീസുകളിൽ ഇന്റഗ്രേറ്റ് ചെയ്യുക

## ഡിപ്പ്ലോയ്മെന്റ് അവലോകനം

Azure Developer CLI താഴെപ്പറയുന്ന ചില ഡിപ്പ്ലോയ്മെന്റ് കമാൻഡുകൾ നൽകുന്നു:
- `azd up` - സമഗ്ര വർക്ഫ്‌ളോ (പ്രൊവിഷൻ + ഡിപ്പ്ലോയ്)
- `azd provision` - Azure വിഭവങ്ങൾ സൃഷ്ടിക്കുക/അപ്ഡേറ്റ് ചെയ്യുക മാത്രം
- `azd deploy` - ആപ്ലിക്കേഷൻ കോഡ് മാത്രം ഡിപ്പ്ലോയ് ചെയ്യുക
- `azd package` - ആപ്ലിക്കേഷനുകൾ നിർമ്മിച്ച് പാക്കേജ് ചെയ്യുക

## അടിസ്ഥാന ഡിപ്പ്ലോയ്മെന്റ് വർക്ഫ്‌ലോകൾ

### സമ്പൂർണ ഡിപ്പ്ലോയ്മെന്റ് (azd up)
പുതിയ പ്രോജക്റ്റുകൾക്ക് ഏറ്റവും സാധാരണമുള്ള വർക്ഫ്‌ളോ:
```bash
# എല്ലാം തുടങ്ങിയത് കൊണ്ട് വിന്യസ് ചെയ്യുക
azd up

# പ്രത്യേക പരിതസ്ഥിതിയുമായി വിന്യസ് ചെയ്യുക
azd up --environment production

# നിലവാരമുണർത്തിയ പാരാമീറ്ററുകളോടുകൂടി വിന്യസ് ചെയ്യുക
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ഇൻഫ്രാസ്ട്രക്ചർ മാത്രം ഡിപ്പ്ലോയ്മെന്റ്
നിങ്ങൾക്ക് Azure വിഭവങ്ങൾ മാത്രം അപ്ഡേറ്റ് ചെയ്യേണ്ടത്:
```bash
# അടിസ്ഥാനസൗകര്യം ഒരുക്കുക/പുതുക്കുക
azd provision

# മാറ്റങ്ങൾ സംക്ഷിപ്തമായി കാണാൻ ഡ്രൈ-റൺ ഉപയോഗിച്ച് ഒരുക്കുക
azd provision --preview

# പ്രത്യേക സേവനങ്ങൾ ഒരുക്കുക
azd provision --service database
```

### കോഡ് മാത്രം ഡിപ്പ്ലോയ്മെന്റ്
വേഗത്തിലുള്ള ആപ്ലിക്കേഷൻ അപ്ഡേറ്റുകൾക്കായി:
```bash
# എല്ലാ സേവനങ്ങളും വിന്യസിക്കുക
azd deploy

# പ്രതീക്ഷിക്കപ്പെട്ട പുറത്താക്കൽ:
# സേവനങ്ങൾ വിന്യസിക്കുന്നു (azd deploy)
# - വെബ്: വിന്യസം തുടരുന്നു... പൂർത്തിയായി
# - എപി.ഐ: വിന്യസം തുടരുന്നു... പൂർത്തിയായി
# വിജയം: നിങ്ങളുടെ വിന്യസം 2 മിനിറ്റ് 15 സെക്കൻഡിൽ പൂർത്തിയായി

# പ്രത്യേക സേവനം വിന്യസിക്കുക
azd deploy --service web
azd deploy --service api

# ആസ്വദിച്ച ബിൽഡ് വാദങ്ങളോടെ വിന്യസിക്കുക
azd deploy --service api --build-arg NODE_ENV=production

# വിന്യസം സ്ഥിരീകരിക്കുക
azd show --output json | jq '.services'
```

### ✅ ഡിപ്പ്ലോയ്മെന്റ് സ്ഥിരീകരണം

ഏതൊരു ഡിപ്പ്ലോയ്മെന്റിനും ശേഷം വിജയകരമാണോയെന്ന് പരിശോധിക്കുക:

```bash
# എല്ലാ സേവനങ്ങളും പ്രവർത്തിച്ചുവരുന്നതാണോ ഇല്ലയോ എന്ന് പരിശോധന നടത്തുക
azd show

# ഹെൽത്ത് എന്റ്പോയിന്റുകൾ പരിശോധിക്കുക
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# പിശകുകൾ നിരീക്ഷിക്കുക (ഡിഫോൾട്ട് ആയി ബ്രൗസറിൽ തുറക്കും)
azd monitor --logs
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- ✅ എല്ലാ സർവീസുകളും "Running" സ്ഥിതിയിളവിൽ കാണിക്കുന്നു
- ✅ ഹെൽത്ത് എണ്ട്പോയിന്റുകൾ HTTP 200 തിരികെ നൽകുന്നു
- ✅ കഴിഞ്ഞ 5 മിനുട്ടിനിടെയുള്ള അസംബന്ധ പിശകുകൾ ഇല്ല
- ✅ ആപ്ലിക്കേഷൻ ടെസ്റ്റ് അഭ്യർത്ഥനകളോട് പ്രതികരിക്കുന്നു

## 🏗️ ഡിപ്പ്ലോയ്മെന്റ് പ്രക്രിയ മനസ്സിലാക്കുക

### ഘട്ടം 1: മുൻ-പ്രൊവിഷൻ ഹൂക്കുകൾ
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
- ഇൻഫ്രാസ്ട്രക്ചർ ടെംപ്ലേറ്റുകൾ വായിക്കുക (Bicep/Terraform)
- Azure വിഭവങ്ങൾ സൃഷ്ടിക്കുകയും അപ്ഡേറ്റ് ചെയ്യുകയും ചെയ്യുക
- നെറ്റ്വർക്ക് സുരക്ഷ ക്രമീകരിക്കുക
- നിരീക്ഷണവും ലോഗിങ്ങും സജ്ജമാക്കുക

### ഘട്ടം 3: ശേഷം-പ്രൊവിഷൻ ഹൂക്കുകൾ
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
- ആപ്ലിക്കേഷൻ കോഡ് നിർമ്മിക്കുന്നു
- ഡിപ്പ്ലോയ്മെന്റ് ആർട്ടിഫാക്ടുകൾ സൃഷ്ടിക്കുന്നു
- ലക്ഷ്യ പ്ലാറ്റ്‌ഫോമിനായി പാക്കേജ് ചെയ്യുന്നു (കണ്ടെയ്‌നറുകൾ, ZIP ഫയലുകൾ, എന്നിവ)

### ഘട്ടം 5: മുൻ-ഡിപ്പ്ലേ ഹൂക്കുകൾ
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

### ഘട്ടം 6: ആപ്ലിക്കേഷൻ ഡിപ്പ്ലോയ്മെന്റ്
- പാക്കേജ് ചെയ്ത ആപ്ലിക്കേഷനുകൾ Azure സർവീസുകളിലേക്ക് ഡിപ്പ്ലോയ് ചെയ്യുന്നു
- കോൺഫിഗറേഷൻ സജ്ജീകരണങ്ങൾ അപ്ഡേറ്റ് ചെയ്യുന്നു
- സേവനങ്ങൾ ആരംഭിക്കുകയും പുനർആരംഭിക്കുകയും ചെയ്യുന്നു

### ഘട്ടം 7: ശേഷം-ഡിപ്പ്ലേ ഹൂക്കുകൾ
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

## 🎛️ ഡിപ്പ്ലോയ്മെന്റ് കോൺഫിഗറേഷൻ

### സർവിസ്-സ്പെസിഫിക് ഡിപ്പ്ലോയ്മെന്റ് ക്രമീകരണങ്ങൾ
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

### പരിസ്ഥിതി-സ്പെസിഫിക് കോൺഫിഗറേഷനുകൾ
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

## 🔧 ആധുനിക ഡിപ്പ്ലോയ്മെന്റ് സേനാര്യങ്ങൾ

### മൾട്ടി-സർവിസ് ആപ്ലിക്കേഷനുകൾ
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

### ബ്ലൂ-ഗ്രീൻ ഡിപ്പ്ലോയ്മെന്റുകൾ
```bash
# നീല പരിസരമൊരുക്കുക
azd env new production-blue
azd up --environment production-blue

# നീല പരിസരം പരീക്ഷിക്കുക
./scripts/test-environment.sh production-blue

# ട്രാഫിക് നീലത്തിലേക്ക് മാറ്റുക (മാനുവൽ DNS/ലോഡ് ബാലൻസർ അപ്‌ഡേറ്റ്)
./scripts/switch-traffic.sh production-blue

# പച്ച പരിസരം ശുചിയാക്കുക
azd env select production-green
azd down --force
```

### കനറി ഡിപ്പ്ലോയ്മെന്റുകൾ
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

### സ്റ്റേജ്ഡ് ഡിപ്പ്ലോയ്മെന്റുകൾ
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

## 🐳 കണ്ടെയ്‌നർ ഡിപ്പ്ലോയ്മെന്റുകൾ

### കണ്ടെയ്‌നർ ആപ്പ് ഡിപ്പ്ലോയ്മെന്റുകൾ
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

### മൾട്ടി-സ്റ്റെജ് ഡോകർഫൈൽ ഓപ്റ്റിമൈസേഷൻ
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

## ⚡ പ്രകടന മെച്ചപ്പെടുത്തൽ

### സർവിസ്-സ്പെസിഫിക് ഡിപ്പ്ലോയ്മെന്റുകൾ
```bash
# വേഗത്തിലുള്ള ആവർത്തനത്തിനായി ഒരു പ്രത്യേക സേവനം വിന്യസിക്കുക
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

### കാര്യക്ഷമമായ കോഡ് ഡിപ്പ്ലോയ്മെന്റുകൾ
```bash
# കോഡ് മാത്രം മാറ്റങ്ങൾക്കായി azd deploy (azd up അല്ല) ഉപയോഗിക്കുക
# ഇത് ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് ഒഴിവാക്കി വളരെ വേഗത്തിലാണ്
azd deploy

# ഏറ്റവും വേഗം ആവർത്തനത്തിനായി പ്രത്യേക സർവീസ് ഡിപ്ലോയ്മെന്റ് ചെയ്യുക
azd deploy --service api
```

## 🔍 ഡിപ്പ്ലോയ്മെന്റ് നിരീക്ഷണം

### റിയൽ-ടൈം ഡിപ്പ്ലോയ്മെന്റ് നിരീക്ഷണം
```bash
# ആപ്ലിക്കേഷൻ റിയൽ ടൈമിൽ നിരീക്ഷിക്കുക
azd monitor --live

# ആപ്ലിക്കേഷൻ ലോഗുകൾ കാണുക
azd monitor --logs

# ഡിപ്ലോയ്മെന്റ് നില പരിശോധിക്കുക
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

### ശേഷം-ഡിപ്പ്ലോയ്മെന്റ് പരിശോധന
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# ആപ്പ്ലിക്കേഷൻ ആരോഗ്യ പരിശോധന
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

### ഗുപ്ത സമർപ്പണം
```bash
# രഹസ്യങ്ങൾ സുരക്ഷിതമായി സഞ്ചയിക്കുക
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml ൽ രഹസ്യങ്ങൾ പരാമർശിക്കുക
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

### ഐഡന്റിറ്റി ആൻഡ് ആക്സസ് മാനേജ്മെന്റ്
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

### വേഗത്തിലുള്ള റോള്ബാക്ക്
```bash
# AZD നിൽ റെറോൾക്ക് ബിൽറ്റ്-ഇൻ സപ്പോർട്ട് ഇല്ല. ശിപാർശ ചെയ്യപ്പെട്ട സമീപനങ്ങൾ:

# ഓപ്ഷൻ 1: ഗിറ്റിൽ നിന്ന് പുനഃപ്രവർത്തനം (ശിപാർശചെയ്യുന്നു)
git revert HEAD  # പ്രശ്നമുണ്ടാക്കിയ കമ്മിറ്റ് തിരിച്ച് മാറ്റുക
git push
azd deploy

# ഓപ്ഷൻ 2: നിർദ്ദിഷ്ട കമ്മിറ്റ് പുനഃപ്രവർത്തനം ചെയ്യുക
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ഇൻഫ്രാസ്ട്രക്ചർ റോള്ബാക്ക്
```bash
# പ്രയോഗിക്കുന്നതിന് മുമ്പ് ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ മുൻകൂട്ടി കാണുക
azd provision --preview

# ഇൻഫ്രാസ്ട്രക്ചർ റോള്ബാക്കിനായി, വേർഷൻ കൺട്രോൾ ഉപയോഗിക്കുക:
git revert HEAD  # ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ പഴയ നിലയ്ക്ക് തിരികെ മാറ്റുക
azd provision    # മുൻപ് ഉണ്ടായിരുന്ന ഇൻഫ്രാസ്ട്രക്ചർ നില പ്രയോഗിക്കുക
```

### ഡാറ്റാബേസ് മൈഗ്രേഷൻ റോള്ബാക്ക്
```bash
#!/bin/bash
# സ്ക്രിപ്റ്റുകൾ/റോൾബാക്ക്-ഡാറ്റാബേസ്.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ഡിപ്പ്ലോയ്മെന്റ് മെട്രിക്‌സുകൾ

### ഡിപ്പ്ലോയ്മെന്റ് പ്രകടനം ട്രാക്ക് ചെയ്യുക
```bash
# നിലവിലെ വിന്യാസ സ്ഥിതിയാണ് കാണുക
azd show

# അപ്ലിക്കേഷനുമായി അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സിനോടൊപ്പം നിരീക്ഷിക്കുക
azd monitor --overview

# ലൈവ് മെറ്റ്രിക്‌സ് കാണുക
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

## 🎯 മികച്ച പ്രായോഗിക മാർഗ്ഗങ്ങൾ

### 1. പരിസ്ഥിതി ഒത്തുചേരൽ
```bash
# സ്ഥിരമായ നാമകരണങ്ങൾ ഉപയോഗിക്കുക
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# പരിസ്ഥിതി സമത്വം നിലനിർത്തുക
./scripts/sync-environments.sh
```

### 2. ഇൻഫ്രാസ്ട്രക്ചർ പരിശോധന
```bash
# വിന്യാസമൂലം മാറ്റങ്ങൾ വിന്യസിക്കാനുള്ള മുൻവ്യവസ്ഥ കാണുക
azd provision --preview

# ARM/Bicep ലിന്റിംഗ് ഉപയോഗിക്കുക
az bicep lint --file infra/main.bicep

# Bicep نحوശാസ്ത്രം സ്ഥിരീകരിക്കുക
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

### 4. ഡോക്യുമെന്റേഷൻ & ലോഗിങ്ങ്
```bash
# പ്രമാണം വിന്യാസ നടപടികൾ രേഖപ്പെടുത്തുക
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## അടുത്ത വഴികൾ

- [Provisioning Resources](provisioning.md) - ഇൻഫ്രാസ്ട്രക്ചർ മാനേജുമെന്റിൽ സമഗ്രമായ പഠനം
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - നിങ്ങളുടെ ഡിപ്പ്ലോയ്മെന്റ് സ്ട്രാറ്റജികൾ ആസൂത്രണം ചെയ്യുക
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - ഡിപ്പ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - ഉത്പാദന-സജ്ജമായ ഡിപ്പ്ലോയ്മെന്റ് സ്ട്രാറ്റജികൾ

## 🎯 പ്രായോഗിക ഡിപ്പ്ലോയ്മെന്റ് അഭ്യാസങ്ങൾ

### അഭ്യാസം 1: വർധന ഡിപ്പ്ലോയ്മെന്റ് വർക്ഫ്ലോ (20 മിനിറ്റ്)
**ലക്ഷ്യം**: പൂർണ്ണവും വർദ്ധനവുമായ ഡിപ്പ്ലോയ്മെന്റുകളുടെ വ്യത്യാസം കൈവരിക്കുക

```bash
# പ്രാഥമിക വിന്യസനം
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# പ്രാഥമിക വിന്യസന സമയവും രേഖപ്പെടുത്തുക
echo "Full deployment: $(date)" > deployment-log.txt

# ഒരു കോഡ് മാറ്റം ചെയ്യുക
echo "// Updated $(date)" >> src/api/src/server.js

# കോഡേ മാത്രം വിന്യസിക്കുക (വേഗതയായത്)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# സമയങ്ങൾ താരതമ്യം ചെയ്യുക
cat deployment-log.txt

# ശുദ്ധീകരണം നിർവഹിക്കുക
azd down --force --purge
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] പൂർണ ഡിപ്പ്ലോയ്മെന്റ് 5-15 മിനിറ്റ് സമയം എടുക്കും
- [ ] കോഡ് മാത്രം ഡിപ്പ്ലോയ്മെന്റ് 2-5 മിനിറ്റ് സമയം എടുക്കും
- [ ] കോഡ് മാറ്റങ്ങൾ ഡിപ്പ്ലോയ്മെന്റ് ആപ്പിൽ പ്രതിഫലിക്കും
- [ ] `azd deploy` ചെയ്തതിനു ശേഷം ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റമില്ല

**പഠനഫലം**: കോഡ് മാറ്റങ്ങൾക്കായി `azd deploy` `azd up`നേക്കാൾ 50-70% വേഗത്തിൽ പ്രവർത്തിക്കും

### അഭ്യാസം 2: കസ്റ്റം ഡിപ്പ്ലോയ്മെന്റ് ഹൂക്കുകൾ (30 മിനിറ്റ്)
**ലക്ഷ്യം**: മുൻപും ശേഷം-ഡിപ്പ്ലോയ്മെന്റ് ഓട്ടോമേഷൻ നടപ്പിലാക്കുക

```bash
# പ്രീ-ഡീപ്ലോയ് സാക്ഷ്യപത്രം സൃഷ്ടിക്കുക
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# പരിശോധനകൾ വിജയിച്ചുവോ എന്ന് പരിശോധിക്കുക
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# കമ്മിറ്റ് ചെയ്തിട്ടില്ലാത്ത മാറ്റങ്ങൾ പരിശോധിക്കുക
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# പോസ്റ്റ്-ഡീപ്ലോയ് സ്മോക്ക് ടെസ്റ്റ് സൃഷ്ടിക്കുക
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

# azure.yaml ൽ ഹുക്കുകൾ ചേർക്കുക
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ഹുക്കുകളോടെ ഡീപ്ലോയ്മെന്റ് ടെസ്റ്റ് ചെയ്യുക
azd deploy
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] മുൻ-ഡിപ്പ്ലോയ് സ്ക്രിപ്റ്റ് ഡിപ്പ്ലോയ്മെന്റിന് മുമ്പേ പ്രവർത്തിക്കുന്നു
- [ ] ടെസ്റ്റുകൾ പരാജയപ്പെടുന്നെങ്കിൽ ഡിപ്പ്ലോയ്മെന്റ് നിർത്തുന്നു
- [ ] ശേഷം-ഡിപ്പ്ലോയ് സ്മോക്ക് ടെസ്റ്റ് ഹെൽത്ത് സ്ഥിരീകരിക്കുന്നു
- [ ] ഹൂക്കുകൾ ശരിയായ ക്രമത്തിൽ പ്രവർത്തിക്കുന്നു

### അഭ്യാസം 3: മൾട്ടി-എൻവയൺമെന്റ് ഡിപ്പ്ലോയ്മെന്റ് സ്ട്രാറ്റജി (45 മിനിറ്റ്)
**ലക്ഷ്യം**: സ്റ്റേജ്ഡ് ഡിപ്പ്ലോയ്മെന്റ് വർക്ഫ്ലോ (dev → staging → production) നടപ്പിലാക്കുക

```bash
# ഡിപ്ലോയ്മെന്റ് സ്ക്രിപ്റ്റ് സൃഷ്ടിക്കുക
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ഘട്ടം 1: ഡെവിലേക്ക് ഡിപ്ലോയ് ചെയ്യുക
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ഘട്ടം 2: സ്റ്റേജിംഗിലേക്ക് ഡിപ്ലോയ് ചെയ്യുക
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ഘട്ടം 3: പ്രൊഡക്ഷന് വേണ്ടി മാന്വൽ അംഗീകാരം
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

# പരിസ്ഥിതികൾ സൃഷ്ടിക്കുക
azd env new dev
azd env new staging
azd env new production

# സ്റ്റേജ്ഡ് ഡിപ്ലോയ്മെന്റ് ഓടിക്കുക
./deploy-staged.sh
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] ഡെവ് പരിസ്ഥിതി വിജയകരമായി ഡിപ്പ്ലോയ്മെന്റ് ചെയ്തു
- [ ] സ്റ്റേജിംഗ് പരിസ്ഥിതി വിജയകരമായി ഡിപ്പ്ലോയ്മെന്റ് ചെയ്തു
- [ ] ഉത്പാദനത്തിനായി മാനുവൽ അംഗീകാരം ആവശ്യമാണ്
- [ ] എല്ലാ പരിസ്ഥിതികൾക്കും പ്രവർത്തിക്കുന്ന ഹെൽത്ത് ചെക്കുകൾ ഉണ്ട്
- [ ] ആവശ്യപ്പെട്ടാൽ റോള്ബാക്ക് നടത്താൻ കഴിയും

### അഭ്യാസം 4: റോള്ബാക്ക് സ്ട്രാറ്റജി (25 മിനിറ്റ്)
**ലക്ഷ്യം**: Git ഉപയോഗിച്ച് ഡിപ്പ്ലോയ്മെന്റ് റോള്ബാക്ക് നടപ്പിലാക്കി പരിശ്രമിക്കുക

```bash
# പതിപ്പ് v1 വിന്യസിക്കുക
azd env set APP_VERSION "1.0.0"
azd up

# v1 കമ്മിറ്റ് ഹാഷ് സംരക്ഷിക്കുക
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ബ്രീക്കിംഗ് മാറ്റവുമായ v2 വിന്യസിക്കുക
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# പരാജയം കണ്ടെത്തി റോള്ബാക്ക് നടത്തുക
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ഉപയോഗിച്ച് റോള്ബാക്ക് ചെയ്യുക
    git revert HEAD --no-edit
    
    # പരിസ്ഥിതിയെ റോള്ബാക്ക് ചെയ്യുക
    azd env set APP_VERSION "1.0.0"
    
    # v1 പുതുക്കി വിന്യസിക്കുക
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] ഡിപ്പ്ലോയ്മെന്റ് പരാജയങ്ങൾ കണ്ടെത്താൻ കഴിയും
- [ ] റോള്ബാക്ക് സ്ക്രിപ്റ്റ് സ്വയം പ്രവർത്തിക്കും
- [ ] ആപ്ലിക്കേഷൻ പ്രവർത്തനക്ഷമമായ അവസ്ഥയിലേയ്ക്ക് മടങ്ങും
- [ ] റോള്ബാക്കിന് ശേഷം ഹെൽത്ത് ചെക്കുകൾ പാസ്സാകും

## 📊 ഡിപ്പ്ലോയ്മെന്റ് മെട്രിക്‌സ് ട്രാക്കിംഗ്

### നിങ്ങളുടെ ഡിപ്പ്ലോയ്മെന്റ് പ്രകടനം ട്രാക്ക് ചെയ്യുക

```bash
# ഡിപ്ലോയ്മെന്റ് മെട്രിക്ക്‌സ് സ്ക്രിപ്റ്റ് സൃഷ്ടിക്കുക
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

# ഫയലിലേക്ക് ലോഗ് ചെയ്യുക
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ഇത് ഉപയോഗിക്കുക
./track-deployment.sh
```

**മെട്രിക്‌സ് വിശകലനം:**
```bash
# വിന്യസന ചരിത്രം കാണുക
cat deployment-metrics.csv

# ശരാശരി വിന്യസന സമയം കണക്കാക്കുക
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## πρόσθετοι πόροι

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [Your First Project](../chapter-01-foundation/first-project.md)
- **അടുത്ത പാഠം**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**തള്ളിപ്പറയലുകൾ**:  
ഈ ഡോക്യുമെന്റ് AI വിവർത്തന സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തു. നാം കൃത്യത പ്രാപിക്കാനായി ശ്രമിച്ചിട്ടും, സ്വയമേവ生成ിച്ച വിവർത്തനങ്ങളിൽ തകരാറുകൾ അല്ലെങ്കിൽ തെറ്റുകൾ ഉണ്ടാകാമെന്ന് ദയവായി ശ്രദ്ധിക്കുക. മാതൃഭാഷയിൽ ഉള്ള ഒറിജിനൽ ഡോക്യुमെന്റ് തന്നെ പ്രാധാന്യമുള്ള ഉറവിടമായിരിക്കണം. ഗൗരവമുള്ള വിവരങ്ങൾക്കായി, പ്രൊഫഷണൽ മാനവ വിവർത്തനം നിർദേശിക്കപ്പെടുന്നു. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽ ഉണ്ടാകാവുന്ന തെറ്റിദ്ധാരണകൾക്കോ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കോ ഞങ്ങൾ ഉത്തരവാദിത്വം വഹിക്കുന്നില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->