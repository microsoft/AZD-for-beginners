# ഡിപ്പ്ലോയ്മെന്റ് ഗൈഡ് - AZD ഡിപ്പ്ലോയ്മെന്റുകൾ നിപുണമായി കൈകാര്യം ചെയ്യുക

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD തുടക്കക്കാർക്ക്](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 4 - കോഡിലൂടെ നിർമിക്കുന്ന ഇൻഫ്രാസ്ട്രക്ചർ & ഡിപ്പ്ലോയ്മെന്റ്
- **⬅️ മുൻപ് അധ്യായം**: [അധ്യായം 3: ക്രമീകരണം](../chapter-03-configuration/configuration.md)
- **➡️ അടുത്തത്**: [റിസോഴ്സ്‌സ് ഒരുക്കൽ](provisioning.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 5: മൾട്ടി-ഏജന്റ് AI സൊല്യൂഷനുകൾ](../../examples/retail-scenario.md)

## പരിചയം

ഈ## ഡിപ്പ്ലോയ്മെന്റ് പ്രക്രിയ മനസ്സിലാക്കൽസമഗ്രമായ ഗൈഡ് Azure Developer CLI ഉപയോഗിച്ച് ആപ്ലിക്കേഷനുകൾ ഡിപ്പ്ലോയ് ചെയ്യുന്നതിനെക്കുറിച്ച് നിങ്ങൾക്കു അറിയേണ്ടതെല്ലാം ഉൾക്കൊള്ളുന്നു — ബേസിക് സിംഗിൾ-കമാൻഡ് ഡിപ്പ്ലോയ്മെന്റുകളിൽ നിന്ന് കസ്റ്റം ഹുക്കുകൾ, متعدد എൻവയിരോൺമെന്റുകൾ, CI/CD സംയോജനവുമുള്ള അഡ്വാൻസ്ഡ് പ്രൊഡക്ഷൻ സന്നിയായിടങ്ങളേക്കുള്ളവ വരെ. പ്രായോഗിക ഉദാഹരണങ്ങളുടേയും മികച്ച പ്രാക്ടിസുകളുടേയും സഹായത്തോടെ സമ്പൂർണ്ണ ഡിപ്പ്ലോയ്മെന്റ് ലൈഫ്‌സൈക്കിൾ നിപുണമായി കൈകാര്യം ചെയ്യുക.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ ഗൈഡ് പൂർത്തിയാക്കിയാൽ നിങ്ങൾക്ക്:
- Azure Developer CLI ഡിപ്പ്ലോയ്മെന്റ് കമാൻഡുകൾക്കും വർക്‌ഫ്ലോകൾക്കും മുഴുവൻ നിപുണത നേടുക
- പ്രൊവിഷനിംഗിൽ നിന്ന് മോണിറ്ററിംഗിലേക്കുള്ള സമ്പൂർണ്ണ ഡിപ്പ്ലോയ്മെന്റ് ലൈഫ്സൈക്കിൾ മനസ്സിലാക്കുക
- പ്രീ-യും പോസ്റ്റ്-ഡിപ്പ്ലോയ്മെന്റ് ഓട്ടോമേഷനിൽ കസ്റ്റം ഡിപ്പ്ലോയ്മെന്റ് ഹുക്കുകൾ നടപ്പിലാക്കുക
- എൻവയിരോൺമെന്റ്-നിര്ദ്ദിഷ്ട പാരാമീറ്ററുകൾ ഉപയോഗിച്ച് നിരവധി എൻവയിരോൺമെന്റുകൾ ക്രമീകരിക്കുക
- ബ്ലൂ-ഗ്രീൻ, കാനറി തുടങ്ങി അഡ്വാൻസ്ഡ് ഡിപ്പ്ലോയ്മെന്റ് തന്ത്രങ്ങൾ ക്രമീകരിക്കുക
- azd ഡിപ്പ്ലോയ്മെന്റുകൾ CI/CD പൈപ്പ്ലൈനുകളിലും DevOps വർക്‌ഫ്ലോകളിലുമായി സംയോജിപ്പിക്കുക

## പഠന ഫലങ്ങൾ

പഠനം പൂർത്തിയായപ്പോള്‍ നിങ്ങള്‍ക്ക് കഴിയുന്നതാണ്:
- എല്ലാ azd ഡിപ്പ്ലോയ്മെന്റ് വർക്‌ഫ്ലോകളും স্বাধীনമായി 실행 ചെയ്ത് പ്രശ്നപരിഹാരം ചെയ്യുക
- ഹുക്കുകൾ ഉപയോഗിച്ച് കസ്റ്റം ഡിപ്പ്ലോയ്മെന്റ് ഓട്ടോമേഷൻ ഡിസൈൻ ചെയ്ത് നടപ്പിലാക്കുക
- ഉത്പാദനത്തിനായി സുരക്ഷയും മോണിറ്ററിംഗും ശരിയായി കാണിച്ചുള്ള ഡിപ്പ്ലോയ്മെന്റുകൾ ക്രമീകരിക്കുക
- കോംപ്ലക്സ് മൾട്ടി-എൻവയിരോൺമെന്റ് ഡിപ്പ്ലോയ്മെന്റ് സന്നിയായിടങ്ങൾ കൈകാര്യം ചെയ്യുക
- ഡിപ്പ്ലോയ്മെന്റ് പ്രകടനം ഒപ്റ്റിമൈസ് ചെയ്ത് റോള്ബാക്ക് തന്ത്രങ്ങൾ നടപ്പിലാക്കുക
- ആന്റർപ്രൈസ് DevOps പ്രാക്ടിസുകളിൽ azd ഡിപ്പ്ലോയ്മെന്റുകൾ സംയോജിപ്പിക്കുക

## ഡിപ്പ്ലോയ്മെന്റ് അവലോകനം

Azure Developer CLI ചില ഡിപ്പ്ലോയ്മെന്റ് കമാൻഡുകൾ നൽകുന്നു:
- `azd up` - സമ്പൂർണ്ണ വർക്‌ഫ്ലോ (പ്രൊവിഷൻ + ഡിപ്ലോയ്)
- `azd provision` - Azure റിസോഴ്സുകൾ മാത്രം സൃഷ്ടിക്കുക/അപ്ഡേറ്റ് ചെയ്യുക
- `azd deploy` - ആപ്ലിക്കേഷൻ കോഡ് മാത്രം ഡിപ്ലോയ് ചെയ്യുക
- `azd package` - ആപ്ലിക്കേഷൻ നിർമ്മിച്ച് പാക്കേജ് ചെയ്യുക

## അടിസ്ഥാന ഡിപ്പ്ലോയ്മെന്റ് വർക്‌ഫ്ലോകൾ

### സമ്പൂർണ്ണ ഡിപ്പ്ലോയ്മെന്റ് (azd up)
പുതിയ പ്രോജക്റ്റുകൾക്കുള്ള ഏറ്റവും പൊതു വർക്ക്‌ഫ്ലോ:
```bash
# ആദ്യമുതൽ എല്ലാം ഡിപ്ലോയ് ചെയ്യുക
azd up

# നിർദിഷ്ട പരിസ്ഥിതിയിൽ డിപ്ലോയ് చేయുക
azd up --environment production

# കస్టം പാരామീറ്ററുകളോടെ డిప്ലോയ് ചെയ്യുക
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ഇൻഫ്രാസ്ട്രക്ചർ-ഓൺലി ഡിപ്പ്ലോയ്മെന്റ്
രിസോഴ്സ് അപ്ഡേറ്റ് മാത്രമേ വേണമെങ്കിൽ:
```bash
# അടിസ്ഥാന സൗകര്യങ്ങൾ ഒരുക്കുക/അപ്‌ഡേറ്റ് ചെയ്യുക
azd provision

# മാറ്റങ്ങൾ മുൻകൂർ കാണാൻ ഡ്രൈ-റൺ ഉപയോഗിച്ച് ഒരുക്കുക
azd provision --preview

# നിർദ്ദിഷ്ട സേവനങ്ങൾ ഒരുക്കുക
azd provision --service database
```

### കോഡ്-ഓൺലി ഡിപ്പ്ലോയ്മെന്റ്
ത്വരിത ആപ്ലിക്കേഷൻ അപ്‌ഡേറ്റുകൾക്കായി:
```bash
# എല്ലാ സേവനങ്ങളും ഡിപ്ലോയ് ചെയ്യുക
azd deploy

# പ്രതീക്ഷിച്ച ഔട്ട്‌പുട്ട്:
# സേവനങ്ങൾ ഡിപ്ലോയ് ചെയ്യുന്നു (azd deploy)
# - web: ഡിപ്ലോയ് ചെയ്യുന്നു... പൂർത്തിയായി
# - api: ഡിപ്ലോയ് ചെയ്യുന്നു... പൂർത്തിയായി
# വിജയം: നിങ്ങളുടെ വിന്യാസം 2 മിനിറ്റ് 15 സെക്കൻഡിൽ പൂർത്തിയായി

# നിർദ്ദിഷ്ട സേവനം ഡിപ്ലോയ് ചെയ്യുക
azd deploy --service web
azd deploy --service api

# കസ്റ്റം ബിൽഡ് പാരാമീറ്ററുകളുമായി ഡിപ്ലോയ് ചെയ്യുക
azd deploy --service api --build-arg NODE_ENV=production

# വിന്യാസം സ്ഥിരീകരിക്കുക
azd show --output json | jq '.services'
```

### ✅ ഡിപ്പ്ലോയ്മെന്റ് സ്ഥിരീകരണം

ഏതെങ്കിലും ഡിപ്പ്ലോയ്മെന്റിനുശേഷം വിജയമോന്നായി പരിശോധിക്കുക:

```bash
# എല്ലാ സർവീസുകളും പ്രവർത്തിക്കുകയാണെന്ന് പരിശോധിക്കുക
azd show

# ഹെൽത്ത് എൻഡ്‌പോയിന്റുകൾ പരിശോധിക്കുക
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# പിശകുകൾ നിരീക്ഷിക്കുക (ഡീഫോൾട്ടായി ബ്രൗസറിൽ തുറക്കുന്നു)
azd monitor --logs
```

**വിജയം മാനകങ്ങൾ:**
- ✅ എല്ലാ സർവീസുകളും "Running" നില കാണിക്കുന്നു
- ✅ ഹെൽത്ത് എൻഡ്പോയിന്റുകൾ HTTP 200 റിട്ടേൺ ചെയ്യുന്നു
- ✅ കഴിഞ്ഞ 5 മിനിറ്റിൽ പിശക് ലോഗുകൾ ഇല്ല
- ✅ ആപ്ലിക്കേഷൻ ടെസ്റ്റ് അഭ്യർഥനകളിക്ക് പ്രതികരിക്കുന്നു

## 🏗️ ഡിപ്പ്ലോയ്മെന്റ് പ്രക്രിയ മനസ്സിലാക്കുക

### ഘട്ടം 1: പ്രീ-പ്രൊവിഷൻ ഹുക്ക്‌സ്
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
- ഇൻഫ്രാസ്ട്രക്ചർ ടെംപ്ലേറ്റുകൾ (Bicep/Terraform) വായിക്കുന്നു
- Azure റിസോഴ്സുകൾ സൃഷ്ടിക്കുകയോ അപ്ഡേറ്റ് ചെയ്യുകയോ ചെയ്യുന്നു
- നെറ്റ്വർക്കിംഗ് மற்றும் സുരക്ഷ ക്രമീകരിക്കുന്നു
- മോണിറ്ററിംഗ് മഹസൂത്രവും ലോഗ്ഗിംഗ് സജ്ജമാക്കുന്നു

### ഘട്ടം 3: പോസ്റ്റ്-പ്രൊവിഷൻ ഹുക്ക്‌സ്
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
- ആപ്ലിക്കേഷൻ കോഡ് നിര്‍മ്മിക്കുന്നു
- ഡിപ്പ്ലോയ്മെന്റ് ആർട്ടിഫാക്ടുകൾ സൃഷ്ടിക്കുന്നു
- ചൈതയ ലക്ഷ്യ പ്ലാറ്റ്ഫോംക്കായി പാക്കേജ് ചെയ്യുന്നു (കൺടെയ്‌നറുകൾ, ZIP ഫയലുകൾ തുടങ്ങിയവ)

### ഘട്ടം 5: പ്രീ-ഡിപ്ലോയ് ഹുക്ക്‌സ്
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

### ഘട്ടം 6: ആപ്ലിക്കേഷൻ ഡिप്ലോയ്‌മെന്റ്
- പാക്കേജുചെയ്‌ത ആപ്ലിക്കേഷനുകൾ Azure സർവീസുകളിൽ ഡിപ്പ്ലോയ് ചെയ്യുന്നു
- കോൺഫിഗറേഷൻ സെറ്റിംഗുകൾ അപ്ഡേറ്റ് ചെയ്യുന്നു
- സർവീസുകൾ തുടങ്ങുന്നതും/റിക്സ്ടാർട്ട് ചെയ്യുന്നതും ചെയ്യുന്നു

### ഘട്ടം 7: പോസ്റ്റ്-ഡിപ്ലോയ് ഹുക്ക്‌സ്
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

### സർവിസ്-നിർദ്ദിഷ്ട ഡിപ്പ്ലോയ്മെന്റ് സെറ്റിംഗ്‌സ്
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

### എൻവയിരോൺമെന്റ്-നിർദ്ദിഷ്ട കോൺഫിഗറേഷനുകൾ
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

## 🔧 അഡ്വാൻസ്ഡ് ഡിപ്പ്ലോയ്മെന്റ് സന്നിയായിടങ്ങൾ

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
# ബ്ലൂ പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new production-blue
azd up --environment production-blue

# ബ്ലൂ പരിസ്ഥിതി പരീക്ഷിക്കുക
./scripts/test-environment.sh production-blue

# ട്രാഫിക് ബ്ലൂയിലേക്ക് മാറ്റുക (മാനുവൽ DNS/ലോഡ് ബാലൻസർ അപ്‌ഡേറ്റ്)
./scripts/switch-traffic.sh production-blue

# ഗ്രീൻ പരിസ്ഥിതി ശുദ്ധീകരിക്കുക
azd env select production-green
azd down --force
```

### കാനറി ഡിപ്പ്ലോയ്മെന്റുകൾ
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

### ഘട്ടത്തിലാണ് ഡിപ്പ്ലോയ്മെന്റുകൾ
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

## 🐳 കൺടെയ്‌നർ ഡിപ്പ്ലോയ്മെന്റുകൾ

### കൺടെയ്‌നർ ആപ്പ് ഡിപ്പ്ലോയ്മെന്റുകൾ
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

### മൾട്ടി-സ്റ്റേജ് Dockerfile ഓപ്റ്റിമൈസേഷൻ
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

## ⚡ പ്രകടന ഒപ്റ്റിമൈസേഷൻ

### സർവിസ്-നിർദ്ദിഷ്ട ഡിപ്പ്ലോയ്മെന്റുകൾ
```bash
# വേഗതയേറിയ ആവർത്തനത്തിനായി ഒരു പ്രത്യേക സേവനം വിന്യസിക്കുക
azd deploy --service web
azd deploy --service api

# എല്ലാ സേവനങ്ങളും വിന്യസിക്കുക
azd deploy
```

### 빌ഡ് ക്യാഷിംഗ്
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
# കോഡ് മാത്രം മാറ്റങ്ങൾക്ക് azd deploy (azd up അല്ല) ഉപയോഗിക്കുക
# ഇത് ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷനിംഗ് ഒഴിവാക്കും, അതിനാൽ വളരെ വേഗമാണ്
azd deploy

# ഏറ്റവും വേഗമുള്ള ആവർത്തനത്തിനായി നിർദിഷ്ട സേവനം വിന്യസിക്കുക
azd deploy --service api
```

## 🔍 ഡിപ്പ്ലോയ്മെന്റ് മോണിറ്ററിംഗ്

### റിയൽ-ടൈം ഡിപ്പ്ലോയ്മെന്റ് മോണിറ്ററിംഗ്
```bash
# അപ്ലിക്കേഷൻ റിയൽ ടൈമിൽ നിരീക്ഷിക്കുക
azd monitor --live

# അപ്ലിക്കേഷൻ ലോഗുകൾ കാണുക
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

### പോസ്റ്റ്-ഡിപ്പ്ലോയ്മെന്റ് വാലിഡേഷൻ
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# അപ്ലിക്കേഷന്റെ ആരോഗ്യ നില പരിശോധിക്കുക
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

### സീക്രറ്റ്സ് മാനേജ്മെന്റ്
```bash
# രഹസ്യങ്ങൾ безопасность-മായി സംഭരിക്കുക
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml-ൽ രഹസ്യങ്ങളെ റഫറൻസ് ചെയ്യുക
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

### നെറ്റ്‌വർക്കിംഗ് സുരക്ഷ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ഐഡന്റിറ്റി ആൻഡ് ആക്‌സസ് മാനേജ്‌മെന്റ്
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

## 🚨 റോള്ബാക്ക് തന്ത്രങ്ങൾ

### ക്വിക്ക് റോള്ബാക്ക്
```bash
# AZD-യ്ക്ക് ഇൻബിൽറ്റ് റോള്ബാക്ക് സൗകര്യം ഇല്ല. ശിപാർശ ചെയ്ത സമീപനങ്ങൾ:

# ഓപ്‌ഷൻ 1: Git-ൽ നിന്ന് വീണ്ടും ഡിപ്ലോയ് ചെയ്യുക (ശിപാർശ ചെയ്യുന്നു)
git revert HEAD  # പ്രശ്‌നകാരിയായ കമ്മിറ്റ് തിരിച്ചാക്കുക
git push
azd deploy

# ഓപ്‌ഷൻ 2: പ്രത്യേക കമ്മിറ്റ് വീണ്ടും ഡിപ്ലോയ് ചെയ്യുക
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ഇൻഫ്രാസ്ട്രക്ചർ റോള്ബാക്ക്
```bash
# പ്രയോഗിക്കുന്നതിന് മുമ്പ് ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ മുൻകൂട്ടി പരിശോധിക്കുക
azd provision --preview

# ഇൻഫ്രാസ്ട്രക്ചർ റോള്ബാക്ക് ചെയ്യാനുള്ളതിന് വേർഷൻ കണ്ട്രോൾ ഉപയോഗിക്കുക:
git revert HEAD  # ഇൻഫ്രാസ്ട്രക്ചറിലെ മാറ്റങ്ങൾ മടക്കുക
azd provision    # മുൻ ഇൻഫ്രാസ്ട്രക്ചർ അവസ്ഥ പ്രയോഗിക്കുക
```

### ഡാറ്റാബേസ് മൈഗ്രേഷൻ റോള്ബാക്ക്
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ഡിപ്പ്ലോയ്മെന്റ് മെട്രിക്‌സ്

### ഡിപ്പ്ലോയ്മെന്റ് പ്രകടനം ട്രാക്ക് ചെയ്യുക
```bash
# നിലവിലെ ഡിപ്ലോയ്‌മെന്റ് നില കാണുക
azd show

# ആപ്ലിക്കേഷൻကို Application Insights ഉപയോഗിച്ച് നിരീക്ഷിക്കുക
azd monitor --overview

# ലൈവ് മെട്രിക്കുകൾ കാണുക
azd monitor --live
```

### കസ്റ്റം മെട്രിക്‍സ് ശേഖരണം
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

## 🎯 മികച്ച പ്രാക്ടിസുകൾ

### 1. എൻവരയിരോൺമെന്റ് ഏകത്വം
```bash
# സ്ഥിരമായ നാമകരണം ഉപയോഗിക്കുക
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# പരിസ്ഥിതികളുടെ സമതുല്യം നിലനിർത്തുക
./scripts/sync-environments.sh
```

### 2. ഇൻഫ്രാസ്ട്രക്ചർ സ്ഥിരീകരണം
```bash
# ഡിപ്ലോയ്മെന്റിന് മുമ്പ് ഇൻഫ്രാസ്ട്രക്ചർ മാറ്റങ്ങൾ മുൻകൂട്ടി പരിശോധിക്കുക
azd provision --preview

# ARM/Bicep ലിന്തിംഗ് ഉപയോഗിക്കുക
az bicep lint --file infra/main.bicep

# Bicep സിന്റാക്‌സ് സാധുതയുണ്ടെന്ന് സ്ഥിരീകരിക്കുക
az bicep build --file infra/main.bicep
```

### 3. ടെസ്റ്റിംഗ് സംയോജനം
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

### 4. ഡോക്യുമെന്റേഷൻ և ലോഗ്ഗിംഗ്
```bash
# ഡിപ്ലോയ്‌മെന്റ് പ്രക്രിയകൾ രേഖപ്പെടുത്തുക
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## അടുത്ത പടികൾ

- [റിസോഴ്സ്‌സ് ഒരുക്കൽ](provisioning.md) - ഇൻഫ്രാസ്ട്രക്ചർ മാനേജ്മെന്റിൽ ഡീപ് ഡൈവ്
- [പ്രീ-ഡിപ്പ്ലോയ്മെന്റ് പ്ലാനിംഗ്](../chapter-06-pre-deployment/capacity-planning.md) - നിങ്ങളുടെ ഡിപ്പ്ലോയ്മെന്റ് തന്ത്രം പ്ലാൻ ചെയ്യുക
- [സാധാരണ പ്രശ്നങ്ങൾ](../chapter-07-troubleshooting/common-issues.md) - ഡിപ്പ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- [മികച്ച പ്രാക്ടിസുകൾ](../chapter-07-troubleshooting/debugging.md) - പ്രൊഡക്ഷൻ-റഡീ ഡിപ്പ്ലോയ്മെന്റ് തന്ത്രങ്ങൾ

## 🎯 പ്രായോഗിക ഡിപ്പ്ലോയ്മെന്റ് അഭ്യാസങ്ങൾ

### ആശയം 1: ഇൻക്രിമെന്റൽ ഡിപ്പ്ലോയ്മെന്റ് വർക്‌ഫ്ലോ (20 മിനിറ്റ്)
**ലക്ഷ്യം**: ഫുൾ ഉം ഇൻക്രിമെന്റൽ ഡിപ്പ്ലോയ്മെന്റുകളുടെ വ്യത്യാസം നിപുണമായി മനസ്സിലാക്കുക

```bash
# ആദ്യ വിന്യാസം
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ആദ്യ വിന്യാസത്തിന്റെ സമയത്തെ രേഖപ്പെടുത്തുക
echo "Full deployment: $(date)" > deployment-log.txt

# കോഡിൽ മാറ്റം വരുത്തുക
echo "// Updated $(date)" >> src/api/src/server.js

# കോഡ് മാത്രം വിന്യാസിക്കുക (വേഗത്തിൽ)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# സമയങ്ങൾ താരതമ്യം ചെയ്യുക
cat deployment-log.txt

# ശുചീകരിക്കുക
azd down --force --purge
```

**വിജയം മാനദണ്ഡങ്ങൾ:**
- [ ] ഫുൾ ഡിപ്പ്ലോയ്മെന്റ് 5-15 മിനിറ്റിൽ കഴിയണം
- [ ] കോഡ്-ഓൺലി ഡിപ്പ്ലോയ്മെന്റ് 2-5 മിനിറ്റിൽ ജില്ലിക്കുക
- [ ] കോഡ് മാറ്റങ്ങൾ ഡിപ്പ്ലോയ്മെൻറിൽ പ്രതിഫലിച്ചിരിക്കണം
- [ ] `azd deploy` ശേഷം ഇൻഫ്രാസ്ട്രക്ചർ മാറാത്തിരിക്കണം

**പഠന ഫലം**: `azd deploy` കോഡ് മാറ്റങ്ങൾക്ക് `azd up` നേക്കാൾ 50-70% വേഗത്തിൽ ആണ്

### ആശയം 2: കസ്റ്റം ഡിപ്പ്ലോയ്മെന്റ് ഹുക്കുകൾ (30 മിനിറ്റ്)
**ലക്ഷ്യം**: പ്രീ- և പോസ്റ്റ്-ഡിപ്പ്ലോയ്മെന്റ് ഓട്ടോമേഷൻ നടപ്പിലാക്കുക

```bash
# ഡെപ്ലോയ് ചെയ്യുന്നതിന് മുമ്പുള്ള പരിശോധനാ സ്ക്രിപ്റ്റ് സൃഷ്ടിക്കുക
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ടെസ്റ്റുകൾ വിജയിച്ചതാണോ എന്ന് പരിശോധിക്കുക
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# കമ്മിറ്റ് ചെയ്യാത്ത മാറ്റങ്ങൾ ഉള്ളതോ എന്ന് പരിശോധിക്കുക
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ഡിപ്ലോയിന് ശേഷമുള്ള സ്‌മോക്ക് ടെസ്റ്റ് സൃഷ്ടിക്കുക
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

# azure.yaml-ലേക്ക് ഹൂക്കുകൾ ചേർക്കുക
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ഹൂക്കുകളോടുകൂടി ഡിപ്ലോയ്മെന്റ് പരീക്ഷിക്കുക
azd deploy
```

**വിജയം മാനദണ്ഡങ്ങൾ:**
- [ ] പ്രീ-ഡിപ്ലോയ് സ്ക്രിപ്റ്റ് ഡിപ്പ്ലോയ്മെന്റിനു മുമ്പ് 실행ിക്കണം
- [ ] ടെസ്റ്റുകൾ പരാജയപ്പെടുകയാണെങ്കിൽ ഡിപ്പ്ലോയ്മെന്റ് നിർത്തണം
- [ ] പോസ്റ്റ്-ഡിപ്ലോയ് സ്മോക്ക് ടെസ്റ്റ് ഹെൽത്ത് സ്ഥിരീകരിക്കുന്നു
- [ ] ഹുക്കുകൾ ശരിയായ ഓർഡറിൽ 실행ിക്കുന്നു

### ആശയം 3: മൾടി-എൻവയირോൺമെന്റ് ഡിപ്പ്ലോയ്മെന്റ് തന്ത്രം (45 മിനിറ്റ്)
**ലക്ഷ്യം**: ഘടിത ഡിപ്പ്ലോയ്മെന്റ് വർക്‌ഫ്ലോ നടപ്പിലാക്കുക (dev → staging → production)

```bash
# ഡിപ്ലോയ്‌മെന്റ് സ്ക്രിപ്റ്റ് സൃഷ്ടിക്കുക
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# പടി 1: ഡെവിലേക്ക് ഡിപ്ലോയ് ചെയ്യുക
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# പടി 2: സ്റ്റേജിംഗിലേക്ക് ഡിപ്ലോയ് ചെയ്യുക
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# പടി 3: പ്രൊഡക്ഷനിന് മാനുവൽ അംഗീകാരം
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

# ഘട്ടമായി ഡിപ്ലോയ്‌മെന്റ് നടത്തുക
./deploy-staged.sh
```

**വിജയം മാനദണ്ഡങ്ങൾ:**
- [ ] Dev എൻവയിരോൺമെന്റ് വിജയകരമായി ഡിപ്ലോയ് ചെയ്യണം
- [ ] Staging എൻവയിരോൺമെന്റ് വിജയകരമായി ഡിപ്ലോയ് ചെയ്യണം
- [ ] പ്രൊഡക്ഷനിലേക്ക് മാനുവൽ അംഗീകാരം ആവശ്യമുണ്ട്
- [ ] എല്ലാ എൻവയിരോൺമെന്റുകളും പ്രവർത്തനക്ഷമ ഹെൽത്ത് ചെക്കുകൾ ഉള്ളവയാണ്
- [ ] ആവശ്യമെങ്കിൽ റോള്ബാക്ക് ചെയ്യാൻ കഴിയും

### ആശയം 4: റോള്ബാക്ക് തന്ത്രം (25 മിനിറ്റ്)
**ലക്ഷ്യം**: Git ഉപയോഗിച്ച് ഡിപ്ലോയ്മെന്റ് റോള്ബാക്ക് നടപ്പിലാക്കി പരിശോധന നടത്തുക

```bash
# v1 ഡിപ്ലോ ചെയ്യുക
azd env set APP_VERSION "1.0.0"
azd up

# v1 കമ്മിറ്റ് ഹാഷ് സേവ് ചെയ്യുക
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ബ്രേക്കിംഗ് ചേഞ്ച് ഉള്ള v2 ഡിപ്ലോ ചെയ്യുക
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ഫെയില്യർ കണ്ടെത്തി റോള്ബാക്ക് ചെയ്യുക
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ഉപയോഗിച്ച് റോള്ബാക്ക് ചെയ്യുക
    git revert HEAD --no-edit
    
    # പരിസ്ഥിതി റോള്ബാക്ക് ചെയ്യുക
    azd env set APP_VERSION "1.0.0"
    
    # v1 വീണ്ടും ഡിപ്ലോ ചെയ്യുക
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**വിജയം മാനദണ്ഡങ്ങൾ:**
- [ ] ഡിപ്ലോയ്മെന്റ് തകരാറുകൾ കണ്ടെത്താൻ സാധിക്കണം
- [ ] റോള്ബാക്ക് സ്ക്രിപ്റ്റ് സ്വയം പ്രവർത്തിപ്പിക്കണം
- [ ] ആപ്ലിക്കേഷൻ വീണ്ടും പ്രവർത്തനക്ഷമ സ്ഥാനത്തിലേക്ക് മടങ്ങണം
- [ ] റോള്ബാക്ക് കഴിഞ്ഞ് ഹെൽത്ത് ചെക്കുകൾ വിജയകരമാകണം

## 📊 ഡിപ്പ്ലോയ്മെന്റ് മെട്രിക്‌സ് ട്രാക്കിംഗ്

### നിങ്ങളുടെ ഡിപ്പ്ലോയ്മെന്റ് പ്രകടനം ട്രാക്ക് ചെയ്യുക

```bash
# ഡിപ്ലോയ്മെന്റ് മെട്രിക്‌സ് സ്ക്രിപ്റ്റ് സൃഷ്ടിക്കുക
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

**മെട്രിക്‌സ് വിസ്ലേഷണം:**
```bash
# ഡിപ്ലോയ്‌മെന്റിന്റെ ചരിത്രം കാണുക
cat deployment-metrics.csv

# ശരാശരി ഡിപ്ലോയ്‌മെന്റ് സമയം കണക്കാക്കുക
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## അധിക ഉറവിടങ്ങൾ

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**നാവിഗേഷൻ**
- **മുൻപത്തെ പാഠം**: [നിങ്ങളുടെ ആദ്യ പ്രോജക്റ്റ്](../chapter-01-foundation/first-project.md)
- **അടുത്ത പാഠം**: [റിസോഴ്സ്‌സ് ഒരുക്കൽ](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഡിസ്ക്ലെയിമർ:
ഈ രേഖ AI പരിഭാഷാ സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി പരിശ്രമിച്ചിട്ടുണ്ടെങ്കിലും, ഓട്ടോമേറ്റഡ് വിവർത്തനങ്ങളിൽ പിശകുകൾ կամ അസാധുതകൾ ഉണ്ടായിരിക്കാമെന്നത് ദയവായി ശ്രദ്ധിക്കുക. പ്രമാണത്തിന്റെ സ്വദേശീയ ഭാഷയിലെ യഥാർത്ഥ പതിപ്പ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കണം. നിർണ്ണായക വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മനുഷ്യപരിഭാഷ ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ചതിൽ നിന്നുള്ള ഏതെങ്കിലും തെറ്റിദ്ധാരണകൾക്കും വ്യാഖ്യാനപിശകുകൾക്കും ഞങ്ങൾക്ക് ഉത്തരവാദിത്വമില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->