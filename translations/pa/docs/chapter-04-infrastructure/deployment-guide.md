# ਡੀਪਲੋਇਮੈਂਟ ਗਾਈਡ - AZD ਡੀਪਲੋਇਮੈਂਟ ਵਿੱਚ ਮਾਹਰ

**ਚੈਪਟਰ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [ਆਰੰਭਿਕਾਂ ਲਈ AZD](../../README.md)
- **📖 ਵਰਤਮਾਨ ਚੈਪਟਰ**: ਚੈਪਟਰ 4 - ਕੋਡ ਦੇ ਰੂਪ ਵਿੱਚ ਢਾਂਚਾ ਅਤੇ ਡੀਪਲੋਇਮੈਂਟ
- **⬅️ ਪਿਛਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 3: ਕਨਫਿਗਰੇਸ਼ਨ](../chapter-03-configuration/configuration.md)
- **➡️ ਅਗਲਾ**: [ਸੰਸਾਧਨ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ](provisioning.md)
- **🚀 ਅਗਲਾ ਚੈਪਟਰ**: [ਚੈਪਟਰ 5: ਮਲਟੀ-ਏਜੰਟ AI ਹੱਲ](../../examples/retail-scenario.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡੀਪਲੋਇਟ ਕਰਨ ਬਾਰੇ ਸਭ ਕੁਝ ਢੱਕਦੀ ਹੈ, ਸਾਦਾ ਇਕ-ਕਮਾਂਡ ਡੀਪਲੋਇਮੈਂਟ ਤੋਂ ਲੈ ਕੇ ਕਸਟਮ ਹੋਕਸ, ਕਈ ਮਾਹੌਲ ਅਤੇ CI/CD ਇਕੀਕਰਨ ਵਾਲੇ ਉੱਨਤ ਪ੍ਰੋਡਕਸ਼ਨ ਪਰਿਸਥਿਤੀਆਂ ਤਕ। ਵਿਹਾਰਿਕ ਉਦਾਹਰਨਾਂ ਅਤੇ ਸਰਵੋਤਮ ਅਭਿਆਸਾਂ ਨਾਲ ਪੂਰੇ ਡੀਪਲੋਇਮੈਂਟ ਲਾਈਫਸਾਈਕਲ 'ਤੇ ਮਹਾਰਤ ਹਾਸਲ ਕਰੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਹ ਗਾਈਡ ਪੂਰੀ ਕਰਨ ਉਪਰੰਤ, ਤੁਸੀਂ:
- Azure Developer CLI ਦੇ ਸਾਰੇ ਡੀਪਲੋਇਮੈਂਟ ਕਮਾਂਡ ਅਤੇ ਵਰਕਫਲੋਜ਼ 'ਤੇ ਮਹਾਰਤ ਹਾਸਲ ਕਰੋ
- ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਤੋਂ ਮਾਨੀਟਰਿੰਗ ਤੱਕ ਪੂਰੇ ਡੀਪਲੋਇਮੈਂਟ ਲਾਈਫਸਾਈਕਲ ਨੂੰ ਸਮਝੋ
- ਪ੍ਰੀ ਅਤੇ ਪੋਸਟ-ਡੀਪਲੋਇਮੈਂਟ ਆਟੋਮੇਸ਼ਨ ਲਈ ਕਸਟਮ ਡੀਪਲੋਇਮੈਂਟ ਹੋਕਸ ਲਾਗੂ ਕਰੋ
- ਮਾਹੌਲ-ਨਿਰਧਾਰਿਤ ਪੈਰਾਮੀਟਰਾਂ ਨਾਲ ਕਈ ਮਾਹੌਲ ਕੰਫਿਗਰ ਕਰੋ
- ਬਲੂ-ਗ੍ਰੀਨ ਅਤੇ ਕੈਨਾਰੀ ਸਮੇਤ ਉन्नਤ ਡੀਪਲੋਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਸੈਟਅਪ ਕਰੋ
- CI/CD ਪਾਈਪਲਾਈਨ ਅਤੇ DevOps ਵਰਕਫਲੋਜ਼ ਨਾਲ `azd` ਡੀਪਲੋਇਮੈਂਟ ਇਕੀਕ੍ਰਿਤ ਕਰੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਉਪਰੰਤ, ਤੁਸੀਂ ਯੋਗ ਹੋਵੋਗੇ:
- `azd` ਡੀਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋਜ਼ ਨੂੰ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ ਚਲਾਉਣਾ ਅਤੇ ਟਰਬਲਸ਼ੂਟ ਕਰਨਾ
- ਹੋਕਸ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕਸਟਮ ਡੀਪਲੋਇਮੈਂਟ ਆਟੋਮੇਸ਼ਨ ਡਿਜ਼ਾਈਨ ਅਤੇ ਲਾਗੂ ਕਰਨਾ
- ਠੀਕ ਸੁਰੱਖਿਆ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਨਾਲ ਪ੍ਰੋਡਕਸ਼ਨ-ਰੇਡੀ ਡੀਪਲੋਇਮੈਂਟ ਕੰਫਿਗਰ ਕਰਨਾ
- ਜਟਿਲ ਬਹੁ-ਮਾਹੌਲ ਡੀਪਲੋਇਮੈਂਟ ਸੰਦਰਭਾਂ ਦਾ ਪ੍ਰਬੰਧ ਕਰਨਾ
- ਡੀਪਲੋਇਮੈਂਟ ਪ੍ਰਦਰਸ਼ਨ ਨੂੰ ਅਪਟਿਮਾਈਜ਼ ਕਰਨਾ ਅਤੇ ਰੋਲਬੈਕ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰਨਾ
- `azd` ਡੀਪਲੋਇਮੈਂਟਸ ਨੂੰ ਐਂਟਰਪ੍ਰਾਈਜ਼ DevOps ਅਭਿਆਸਾਂ ਵਿੱਚ ਸ਼ਾਮਿਲ ਕਰਨਾ

## ਡੀਪਲੋਇਮੈਂਟ ਓਵਰਵਿਊ

Azure Developer CLI ਕਈ ਡੀਪਲੋਇਮੈਂਟ ਕਮਾਂਡਸ ਦਿੰਦਾ ਹੈ:
- `azd up` - ਪੂਰਾ ਵਰਕਫਲੋ (ਪ੍ਰੋਵਿਜ਼ਨ + ਡੀਪਲੋਇਮੈਂਟ)
- `azd provision` - ਸਿਰਫ Azure ਰਿਸੋਰਸ ਬਣਾਓ/ਅਪਡੇਟ ਕਰੋ
- `azd deploy` - ਸਿਰਫ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡੀਪਲੋਇਟ ਕਰੋ
- `azd package` - ਐਪ ਨੂੰ ਬਿਲਡ ਅਤੇ ਪੈਕੇਜ ਕਰੋ

## ਬੁਨਿਆਦੀ ਡੀਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋਜ਼

### ਸੰਪੂਰਨ ਡੀਪਲੋਇਮੈਂਟ (`azd up`)
ਨਵੇਂ ਪ੍ਰੋਜੈਕਟਾਂ ਲਈ ਸਭ ਤੋਂ ਆਮ ਵਰਕਫਲੋ:
```bash
# ਸ਼ੁਰੂ ਤੋਂ ਹੀ ਸਭ ਕੁਝ ਤੈਨਾਤ ਕਰੋ
azd up

# ਖਾਸ ਮਾਹੌਲ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up --environment production

# ਕਸਟਮ ਪੈਰਾਮੀਟਰਾਂ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ਸਿਰਫ ਢਾਂਚਾ ਡੀਪਲੋਇਮੈਂਟ
ਜਦੋਂ ਤੁਹਾਨੂੰ ਸਿਰਫ Azure ਰਿਸੋਰਸ ਅਪਡੇਟ ਕਰਨੇ ਹੋਣ:
```bash
# ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਪ੍ਰਦਾਨ/ਅਪਡੇਟ ਕਰੋ
azd provision

# ਬਦਲਾਵਾਂ ਦੀ ਪਹਿਲਾਂ ਹੀ ਝਲਕ ਵੇਖਣ ਲਈ ਡ੍ਰਾਈ-ਰਨ ਨਾਲ ਪ੍ਰਦਾਨ ਕਰੋ
azd provision --preview

# ਨਿਰਧਾਰਤ ਸੇਵਾਵਾਂ ਪ੍ਰਦਾਨ ਕਰੋ
azd provision --service database
```

### ਕੇਵਲ ਕੋਡ ਡੀਪਲੋਇਮੈਂਟ
ਤੇਜ਼ ਐਪਲਿਕੇਸ਼ਨ ਅਪਡੇਟ ਲਈ:
```bash
# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰੋ
azd deploy

# ਉਮੀਦ ਕੀਤਾ ਨਤੀਜਾ:
# ਸੇਵਾਵਾਂ ਡਿਪਲੌਇ ਕੀਤੀਆਂ ਜਾ ਰਹੀਆਂ ਹਨ (azd deploy)
# - web: ਡਿਪਲੌਇ ਕੀਤਾ ਜਾ ਰਿਹਾ... ਹੋ ਗਿਆ
# - api: ਡਿਪਲੌਇ ਕੀਤਾ ਜਾ ਰਿਹਾ... ਹੋ ਗਿਆ
# ਸਫਲ: ਤੁਹਾਡੀ ਡਿਪਲੌਇਮੈਂਟ 2 ਮਿੰਟ 15 ਸਕਿੰਟ ਵਿੱਚ ਪੂਰੀ ਹੋ ਗਈ

# ਖਾਸ ਸੇਵਾ ਡਿਪਲੌਇ ਕਰੋ
azd deploy --service web
azd deploy --service api

# ਕਸਟਮ ਬਿਲਡ ਆਰਗੁਮੈਂਟਸ ਨਾਲ ਡਿਪਲੌਇ ਕਰੋ
azd deploy --service api --build-arg NODE_ENV=production

# ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd show --output json | jq '.services'
```

### ✅ ਡੀਪਲੋਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ

ਕਿਸੇ ਵੀ ਡੀਪਲੋਇਮੈਂਟ ਤੋਂ ਬਾਦ, ਸਫਲਤਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:

```bash
# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਚੱਲ ਰਹੀਆਂ ਹਨ ਜਾਂ ਨਹੀਂ, ਚੈੱਕ ਕਰੋ
azd show

# ਹੈਲਥ ਐਂਡਪਾਇੰਟਸ ਦੀ ਜਾਂਚ ਕਰੋ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ਤ੍ਰੁੱਟੀਆਂ ਲਈ ਨਿਗਰਾਨੀ ਕਰੋ (ਡਿਫਾਲਟ ਤੌਰ 'ਤੇ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਖੁਲਦਾ ਹੈ)
azd monitor --logs
```

**ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ:**
- ✅ ਸਾਰੇ ਸਰਵਿਸਾਂ "Running" ਸਥਿਤੀ ਦਿਖਾਉਂਦੇ ਹਨ
- ✅ ਹੈਲਥ ਐਂਡਪਾਇੰਟ HTTP 200 ਵਾਪਸ ਕਰਦੇ ਹਨ
- ✅ ਆਖਰੀ 5 ਮਿੰਟਾਂ ਵਿੱਚ ਕੋਈ ਐਰਰ ਲੌਗ ਨਹੀਂ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਟੈਸਟ ਰਿਕਵੇਸਟਾਂ ਨੂੰ ਜਵਾਬ ਦਿੰਦੀ ਹੈ

## 🏗️ ਡੀਪਲੋਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਸਮਝਣਾ

### ਫੇਜ਼ 1: ਪ੍ਰੀ-ਪ੍ਰੋਵਿਜ਼ਨ ਹੋਕਸ
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

### ਫੇਜ਼ 2: ਇੰਫਰਾਸਟਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- ਇੰਫਰਾਸਟਰਕਚਰ ਟੈਮਪਲੇਟਾਂ (Bicep/Terraform) ਨੂੰ ਪੜ੍ਹਦਾ ਹੈ
- Azure ਰਿਸੋਰਸ ਬਣਾਉਂਦਾ ਜਾਂ ਅਪਡੇਟ ਕਰਦਾ ਹੈ
- ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਕਨਫਿਗਰ ਕਰਦਾ ਹੈ
- ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਸੈਟਅਪ ਕਰਦਾ ਹੈ

### ਫੇਜ਼ 3: ਪੋਸਟ-ਪ੍ਰੋਵਿਜ਼ਨ ਹੋਕਸ
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

### ਫੇਜ਼ 4: ਐਪਲੀਕੇਸ਼ਨ ਪੈਕਜਿੰਗ
- ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਬਿਲਡ ਕਰਦਾ ਹੈ
- ਡીਪਲੋਇਮੈਂਟ ਆਰਟੀਫੈਕਟ ਬਣਾਉਂਦਾ ਹੈ
- ਟਾਰਗਟ ਪਲੇਟਫਾਰਮ ਲਈ ਪੈਕੇਜ ਕਰਦਾ ਹੈ (ਕੰਟੇਨਰ, ZIP ਫਾਇਲਾਂ, ਆਦਿ)

### ਫੇਜ਼ 5: ਪ੍ਰੀ-ਡੀਪਲੋਇਮੈਂਟ ਹੋਕਸ
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

### ਫੇਜ਼ 6: ਐਪਲੀਕੇਸ਼ਨ ਡੀਪਲੋਇਮੈਂਟ
- ਪੈਕੇਜ ਕੀਤੀਆਂ ਐਪਲੀਕੇਸ਼ਨਜ਼ ਨੂੰ Azure ਸੇਵਾਵਾਂ 'ਤੇ ਡੀਪਲੋਇਟ ਕਰਦਾ ਹੈ
- ਕੰਫਿਗਰੇਸ਼ਨ ਸੈਟਿੰਗਸ ਅਪਡੇਟ ਕਰਦਾ ਹੈ
- ਸੇਵਾਵਾਂ ਨੂੰ ਸ਼ੁਰੂ/ਰੀਸਟਾਰਟ ਕਰਦਾ ਹੈ

### ਫੇਜ਼ 7: ਪੋਸਟ-ਡੀਪਲੋਇਮੈਂਟ ਹੋਕਸ
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

## 🎛️ ਡੀਪਲੋਇਮੈਂਟ ਕੰਫਿਗਰੇਸ਼ਨ

### ਸਰਵਿਸ-ਨਿਰਧਾਰਿਤ ਡੀਪਲੋਇਮੈਂਟ ਸੈਟਿੰਗਸ
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

### ਮਾਹੌਲ-ਨਿਰਧਾਰਿਤ ਕੰਫਿਗਰੇਸ਼ਨ
```bash
# ਵਿਕਾਸ ਵਾਤਾਵਰਣ
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ਉਤਪਾਦਨ ਵਾਤਾਵਰਣ
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 ਉন্নਤ ਡੀਪਲੋਇਮੈਂਟ ਸੰਦਰਭ

### ਬਹੁ-ਸੇਵਾ ਐਪਲੀਕੇਸ਼ਨ
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

### ਬਲੂ-ਗ੍ਰੀਨ ਡੀਪਲੋਇਮੈਂਟ
```bash
# ਨੀਲਾ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new production-blue
azd up --environment production-blue

# ਨੀਲਾ ਵਾਤਾਵਰਣ ਦੀ ਜਾਂਚ ਕਰੋ
./scripts/test-environment.sh production-blue

# ਟ੍ਰੈਫਿਕ ਨੂੰ ਨੀਲੇ ਵਾਤਾਵਰਣ ਵੱਲ ਬਦਲੋ (ਮੈਨੁਅਲ DNS/ਲੋਡ ਬੈਲੈਂਸਰ ਅਪਡੇਟ)
./scripts/switch-traffic.sh production-blue

# ਹਰੇ ਵਾਤਾਵਰਣ ਨੂੰ ਸਾਫ ਕਰੋ
azd env select production-green
azd down --force
```

### ਕੈਨਾਰੀ ਡੀਪਲੋਇਮੈਂਟ
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

### ਸਟੇਜਡ ਡੀਪਲੋਇਮੈਂਟ
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

## 🐳 ਕੰਟੇਨਰ ਡੀਪਲੋਇਮੈਂਟ

### ਕੰਟੇਨਰ ਐਪ ਡੀਪਲੋਇਮੈਂਟ
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

### ਬਹੁ-ਮੰਚ Dockerfile ਆਪਟੀਮਾਈਜ਼ੇਸ਼ਨ
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

## ⚡ ਪ੍ਰਦਰਸ਼ਨ ਆਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

### ਸਰਵਿਸ-ਨਿਰਧਾਰਿਤ ਡੀਪਲੋਇਮੈਂਟਸ
```bash
# ਤੇਜ਼ ਇਟਰੇਸ਼ਨ ਲਈ ਇੱਕ ਖਾਸ ਸੇਵਾ ਤੈਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# ਸਭ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd deploy
```

### ਬਿਲਡ ਕੈਸ਼ਿੰਗ
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਕੋਡ ਡੀਪਲੋਇਮੈਂਟਸ
```bash
# ਕੋਡ-ਕੇਵਲ ਤਬਦੀਲੀਆਂ ਲਈ azd deploy (azd up ਨਹੀਂ) ਵਰਤੋਂ
# ਇਹ ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਨੂੰ ਛੱਡ ਦਿੰਦਾ ਹੈ ਅਤੇ ਕਾਫੀ ਤੇਜ਼ ਹੈ
azd deploy

# ਸਭ ਤੋਂ ਤੇਜ਼ ਇਟਰੇਸ਼ਨ ਲਈ ਕਿਸੇ ਖਾਸ ਸੇਵਾ ਨੂੰ ਡਿਪਲੋਯ ਕਰੋ
azd deploy --service api
```

## 🔍 ਡੀਪਲੋਇਮੈਂਟ ਮਾਨੀਟਰਿੰਗ

### ਰੀਅਲ-ਟਾਈਮ ਡੀਪਲੋਇਮੈਂਟ ਮਾਨੀਟਰਿੰਗ
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --live

# ਐਪਲੀਕੇਸ਼ਨ ਲਾਗਾਂ ਵੇਖੋ
azd monitor --logs

# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show
```

### ਹੈਲਥ ਚੈਕਸ
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

### ਪੋਸਟ-ਡੀਪਲੋਇਮੈਂਟ ਵੈਧਤਾ
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਸਿਹਤ ਦੀ ਜਾਂਚ ਕਰੋ
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

## 🔐 ਸੁਰੱਖਿਆ ਸੰਬੰਧੀ ਗੱਲਾਂ

### ਸੀਕ੍ਰੇਟਸ ਪ੍ਰਬੰਧਨ
```bash
# ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਨੂੰ ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਸਟੋਰ ਕਰੋ
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml ਵਿੱਚ ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਦਾ ਹਵਾਲਾ ਦਿਓ
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

### ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ਆਈਡੈਂਟੀਟੀ ਅਤੇ ਐਕਸੈਸ ਪ੍ਰਬੰਧਨ
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

## 🚨 ਰੋਲਬੈਕ ਰਣਨੀਤੀਆਂ

### ਤੁਰੰਤ ਰੋਲਬੈਕ
```bash
# AZD ਕੋਲ ਅੰਦਰੂਨੀ ਰੋਲਬੈਕ ਨਹੀਂ ਹੈ। ਸੁਝਾਏ ਗਏ ਤਰੀਕੇ:

# ਵਿਕਲਪ 1: Git ਤੋਂ ਮੁੜ-ਤੈਨਾਤ ਕਰੋ (ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ)
git revert HEAD  # ਸਮੱਸਿਆਜਨਕ ਕਮਿੱਟ ਨੂੰ ਵਾਪਸ ਕਰੋ
git push
azd deploy

# ਵਿਕਲਪ 2: ਕਿਸੇ ਨਿਰਧਾਰਿਤ ਕਮਿੱਟ ਨੂੰ ਮੁੜ-ਤੈਨਾਤ ਕਰੋ
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ਇੰਫਰਾਸਟਰਕਚਰ ਰੋਲਬੈਕ
```bash
# ਲਾਗੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਢਾਂਚਾਗਤ ਬਦਲਾਵਾਂ ਦੀ ਪੂਰਵ-ਸਮੀਖਿਆ ਕਰੋ
azd provision --preview

# ਢਾਂਚੇ ਦੀ ਵਾਪਸੀ ਲਈ ਵਰਜ਼ਨ ਕੰਟਰੋਲ ਵਰਤੋ:
git revert HEAD  # ਢਾਂਚੇ ਵਿੱਚ ਕੀਤੇ ਬਦਲਾਵਾਂ ਨੂੰ ਵਾਪਸ ਕਰੋ
azd provision    # ਪਿਛਲੇ ਢਾਂਚੇ ਦੀ ਸਥਿਤੀ ਲਾਗੂ ਕਰੋ
```

### ਡੇਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨ ਰੋਲਬੈਕ
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ਡੀਪਲੋਇਮੈਂਟ ਮੈਟ੍ਰਿਕਸ

### ਡੀਪਲੋਇਮੈਂਟ ਪ੍ਰਦਰਸ਼ਨ ਨੂੰ ਟ੍ਰੈਕ ਕਰੋ
```bash
# ਮੌਜੂਦਾ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਵੇਖੋ
azd show

# Application Insights ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --overview

# ਲਾਈਵ ਮੈਟ੍ਰਿਕਸ ਵੇਖੋ
azd monitor --live
```

### ਕਸਟਮ ਮੈਟ੍ਰਿਕਸ ਸੰਗ੍ਰਹਿ
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

## 🎯 ਸਰਵੋਤਮ ਅਭਿਆਸ

### 1. ਮਾਹੌਲ ਵਿੱਚ ਇਕਸਾਰਤਾ
```bash
# ਨਾਂਕਰਨ ਵਿਚ ਇਕਸਾਰਤਾ ਵਰਤੋ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ਮਾਹੌਲ ਦੀ ਸਮਰੂਪਤਾ ਬਣਾਈ ਰੱਖੋ
./scripts/sync-environments.sh
```

### 2. ਇੰਫਰਾਸਟਰਕਚਰ ਦੀ ਵੈਧਤਾ
```bash
# ਤੈਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਵਿੱਚ ਹੋਣ ਵਾਲੀਆਂ ਤਬਦੀਲੀਆਂ ਦਾ ਪੂਰਵ-ਨਿਰੀਖਣ ਕਰੋ
azd provision --preview

# ARM/Bicep ਲਿੰਟਿੰਗ ਵਰਤੋ
az bicep lint --file infra/main.bicep

# Bicep ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
az bicep build --file infra/main.bicep
```

### 3. ਟੈਸਟਿੰਗ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
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

### 4. ਦਸਤਾਵੇਜ਼ੀਕਰਨ ਅਤੇ ਲੌਗਿੰਗ
```bash
# ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆਵਾਂ ਨੂੰ ਦਸਤਾਵੇਜ਼ ਕਰੋ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ਅਗਲੇ ਕਦਮ

- [ਸੰਸਾਧਨ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ](provisioning.md) - ਢਾਂਚਾ ਪ੍ਰਬੰਧਨ ਵਿੱਚ ਗਹਿਰਾਈ ਨਾਲ ਵੇਰਵਾ
- [ਪ੍ਰੀ-ਡੀਪਲੋਇਮੈਂਟ ਯੋਜਨਾ](../chapter-06-pre-deployment/capacity-planning.md) - ਆਪਣੀ ਡੀਪਲੋਇਮੈਂਟ ਰਣਨੀਤੀ ਦੀ ਯੋਜਨਾ ਬਣਾਓ
- [ਆਮ ਸਮੱਸਿਆਵਾਂ](../chapter-07-troubleshooting/common-issues.md) - ਡੀਪਲੋਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰੋ
- [ਸਰਵੋਤਮ ਅਭਿਆਸ](../chapter-07-troubleshooting/debugging.md) - ਪ੍ਰੋਡਕਸ਼ਨ-ਰੇਡੀ ਡੀਪਲੋਇਮੈਂਟ ਰਣਨੀਤੀਆਂ

## 🎯 ਹੈਂਡਸ-ਆਨ ਡੀਪਲੋਇਮੈਂਟ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਇੰਕਰੀਮੈਂਟਲ ਡੀਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ (20 ਮਿੰਟ)
**ਉਦੇਸ਼**: ਪੂਰੇ ਅਤੇ ਇੰਕਰੀਮੈਂਟਲ ਡੀਪਲੋਇਮੈਂਟ ਵਿੱਚ ਫ਼ਰਕ 'ਤੇ ਮਾਹਰ ਹੋਵੋ

```bash
# ਪਹਿਲੀ ਤੈਨਾਤੀ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ਪਹਿਲੀ ਤੈਨਾਤੀ ਦਾ ਸਮਾਂ ਦਰਜ ਕਰੋ
echo "Full deployment: $(date)" > deployment-log.txt

# ਕੋਡ ਵਿੱਚ ਬਦਲਾਅ ਕਰੋ
echo "// Updated $(date)" >> src/api/src/server.js

# ਸਿਰਫ਼ ਕੋਡ ਤੈਨਾਤ ਕਰੋ (ਤੇਜ਼)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# ਸਮਿਆਂ ਦੀ ਤੁਲਨਾ ਕਰੋ
cat deployment-log.txt

# ਸਾਫ਼ ਕਰੋ
azd down --force --purge
```

**ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਪੂਰਾ ਡੀਪਲੋਇਮੈਂਟ 5-15 ਮਿੰਟ ਲੈਂਦਾ ਹੈ
- [ ] ਕੇਵਲ ਕੋਡ ਡੀਪਲੋਇਮੈਂਟ 2-5 ਮਿੰਟ ਲੈਂਦਾ ਹੈ
- [ ] ਕੋਡ ਬਦਲਾਅ ਡੀਪਲਾਇਡ ਐਪ ਵਿੱਚ ਦਰਸਾਏ ਜਾਂਦੇ ਹਨ
- [ ] `azd deploy` ਤੋਂ ਬਾਅਦ ਇੰਫਰਾਸਟਰਕਚਰ ਅਣਬਦਲ ਰਹਿੰਦਾ ਹੈ

**ਸਿੱਖਣ ਦਾ ਨਤੀਜਾ**: ਕੋਡ ਬਦਲਾਅ ਲਈ `azd deploy` `azd up` ਨਾਲੋਂ 50-70% ਤੇਜ਼ ਹੈ

### ਅਭਿਆਸ 2: ਕਸਟਮ ਡੀਪਲੋਇਮੈਂਟ ਹੋਕਸ (30 ਮਿੰਟ)
**ਉਦੇਸ਼**: ਪ੍ਰੀ ਅਤੇ ਪੋਸਟ-ਡੀਪਲੋਇਮੈਂਟ ਆਟੋਮੇਸ਼ਨ ਲਾਗੂ ਕਰੋ

```bash
# ਪ੍ਰੀ-ਡਿਪਲੋਇ ਵੈਧਤਾ ਸਕ੍ਰਿਪਟ ਬਣਾਓ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ਜਾਂਚ ਕਰੋ ਕਿ ਟੈਸਟ ਪਾਸ ਹੋ ਰਹੇ ਹਨ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ਅਣ-ਕਮਿੱਟ ਕੀਤੇ ਬਦਲਾਵਾਂ ਲਈ ਜਾਂਚ ਕਰੋ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਬਾਅਦ ਦਾ ਸਮੋਕ ਟੈਸਟ ਬਣਾਓ
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

# azure.yaml ਵਿੱਚ hooks ਜੋੜੋ
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# hooks ਨਾਲ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਜਾਂਚ ਕਰੋ
azd deploy
```

**ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਪ੍ਰੀ-ਡਿਪਲੋਈ ਸਕ੍ਰਿਪਟ ਡੀਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਚਲਦੀ ਹੈ
- [ ] ਜੇ ਟੈਸਟ ਫੇਲ ਹੋਣ ਤਾਂ ਡੀਪਲੋਇਮੈਂਟ ਰੱਦ ਹੋ ਜਾਵੇ
- [ ] ਪੋਸਟ-ਡੀਪਲੋਇਮੈਂਟ ਸਮੋਕ ਟੈਸਟ ਹੈਲਥ ਦੀ ਤਸਦੀਕ ਕਰਦਾ ਹੈ
- [ ] ਹੋਕਸ ਸਹੀ ਕ੍ਰਮ ਵਿੱਚ ਚਲਦੇ ਹਨ

### ਅਭਿਆਸ 3: ਬਹੁ-ਮਾਹੌਲ ਡੀਪਲੋਇਮੈਂਟ ਰਣਨੀਤੀ (45 ਮਿੰਟ)
**ਉਦੇਸ਼**: ਸਟੇਜਡ ਡੀਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋ ਲਾਗੂ ਕਰੋ (dev → staging → production)

```bash
# ਡਿਪਲੋਇਮੈਂਟ ਸਕ੍ਰਿਪਟ ਬਣਾਓ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ਕਦਮ 1: ਡੈਵ ਤੇ ਡਿਪਲੋਇ ਕਰੋ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ਕਦਮ 2: ਸਟੇਜਿੰਗ ਤੇ ਡਿਪਲੋਇ ਕਰੋ
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ਕਦਮ 3: ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਮੈਨੂਅਲ ਮਨਜ਼ੂਰੀ
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

# ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new dev
azd env new staging
azd env new production

# ਸਟੇਜ ਕੀਤੀ ਡਿਪਲੋਇਮੈਂਟ ਚਲਾਓ
./deploy-staged.sh
```

**ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ:**
- [ ] Dev ਮਾਹੌਲ ਸਫਲਤਾਪੂਰਵਕ ਡੀਪਲੋਇਟ ਹੁੰਦਾ ਹੈ
- [ ] Staging ਮਾਹੌਲ ਸਫਲਤਾਪੂਰਵਕ ਡੀਪਲੋਇਟ ਹੁੰਦਾ ਹੈ
- [ ] ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਹੱਥੋਂ ਮਨਜ਼ੂਰੀ ਦੀ ਲੋੜ ਹੈ
- [ ] ਸਾਰੇ ਮਾਹੌਲਾਂ ਵਿੱਚ ਕੰਮ ਕਰਨ ਵਾਲੇ ਹੈਲਥ ਚੈਕ ਹਨ
- [ ] ਜਰੂਰਤ ਪੈਣ 'ਤੇ ਰੋਲਬੈਕ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ

### ਅਭਿਆਸ 4: ਰੋਲਬੈਕ ਰਣਨੀਤੀ (25 ਮਿੰਟ)
**ਉਦੇਸ਼**: Git ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡੀਪਲੋਇਮੈਂਟ ਰੋਲਬੈਕ ਲਾਗੂ ਅਤੇ ਟੈਸਟ ਕਰੋ

```bash
# v1 ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd env set APP_VERSION "1.0.0"
azd up

# v1 ਦਾ ਕਮਿਟ ਹੈਸ਼ ਸੇਵ ਕਰੋ
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# v2 ਨੂੰ ਤੈਨਾਤ ਕਰੋ ਜਿਸ ਵਿੱਚ ਟੁੱਟਣ ਵਾਲਾ ਬਦਲਾਅ ਹੈ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ਅਸਫਲਤਾ ਦਾ ਪਤਾ ਲਗਾਓ ਅਤੇ ਰੋਲਬੈਕ ਕਰੋ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਰੋਲਬੈਕ ਕਰੋ
    git revert HEAD --no-edit
    
    # ਵਾਤਾਵਰਨ ਨੂੰ ਰੋਲਬੈਕ ਕਰੋ
    azd env set APP_VERSION "1.0.0"
    
    # v1 ਨੂੰ ਮੁੜ ਤੈਨਾਤ ਕਰੋ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਡੀਪਲੋਇਮੈਂਟ ਦੀਆਂ ਨਾਕਾਮੀਆਂ ਦਾ ਪਤਾ ਲਗਾ ਸਕਦੇ ਹਨ
- [ ] ਰੋਲਬੈਕ ਸਕ੍ਰਿਪਟ ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ ਚਲਦੀ ਹੈ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਕਾਰਜਮੂਲ ਅਵਸਥਾ ਵਿੱਚ ਵਾਪਸ ਆ ਜਾਂਦੀ ਹੈ
- [ ] ਰੋਲਬੈਕ ਤੋਂ ਬਾਅਦ ਹੈਲਥ ਚੈਕ ਪਾਸ ਹੁੰਦੇ ਹਨ

## 📊 ਡੀਪਲੋਇਮੈਂਟ ਮੈਟ੍ਰਿਕਸ ਟਰੈਕਿੰਗ

### ਆਪਣੀ ਡੀਪਲੋਇਮੈਂਟ ਪ੍ਰਦਰਸ਼ਨ ਨੂੰ ਟ੍ਰੈਕ ਕਰੋ

```bash
# ਡਿਪਲੋਇਮੈਂਟ ਮੈਟ੍ਰਿਕਸ ਲਈ ਸਕ੍ਰਿਪਟ ਬਣਾਓ
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

# ਫਾਇਲ ਵਿੱਚ ਲੌਗ ਕਰੋ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ਇਸਨੂੰ ਵਰਤੋ
./track-deployment.sh
```

**ਆਪਣੀਆਂ ਮੈਟ੍ਰਿਕਸ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ:**
```bash
# ਡਿਪਲੋਇਮੈਂਟ ਇਤਿਹਾਸ ਵੇਖੋ
cat deployment-metrics.csv

# ਡਿਪਲੋਇਮੈਂਟ ਦੇ ਔਸਤ ਸਮੇਂ ਦੀ ਗਣਨਾ ਕਰੋ
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## ਵਾਧੂ ਸਰੋਤ

- [Azure Developer CLI ਡੀਪਲੋਇਮੈਂਟ ਰੈਫਰੈਂਸ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service ਡੀਪਲੋਇਮੈਂਟ](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps ਡੀਪਲੋਇਮੈਂਟ](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions ਡੀਪਲੋਇਮੈਂਟ](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](../chapter-01-foundation/first-project.md)
- **ਅਗਲਾ ਪਾਠ**: [ਸੰਸਾਧਨ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰਤਾ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਯਤਨ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸ਼ੁੱਧੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਸੰਵੇਦਨਸ਼ੀਲ ਜਾਂ ਅਹਿਮ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫ਼ਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->