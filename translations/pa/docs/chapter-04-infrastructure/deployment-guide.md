# ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ - AZD ਡਿਪਲੋਇਮੈਂਟਸ ਵਿੱਚ ਮਾਹਰਤਾ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 4 - ਕੋਡ ਵਜੋਂ ਢਾਂਚਾ ਅਤੇ ਤਾਇਨਾਤੀ
- **⬅️ ਪਿਛਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)
- **➡️ ਅਗਲਾ**: [ਰਿਸੋਰਸ ਪ੍ਰੋਵਿਜ਼ਨ](provisioning.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 5: ਬਹੁ-ਏਜੰਟ ਏਆਈ ਹੱਲ](../../examples/retail-scenario.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਆਪਕ ਗਾਈਡ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਨਾਲ ਐਪਲੀਕੇਸ਼ਨਾਂ ਦੀ ਤਾਇਨਾਤੀ ਬਾਰੇ ਸਾਰੀਆਂ ਲੋੜੀਂਦੀਆਂ ਜਾਣਕਾਰੀਆਂ ਦਿੰਦੀ ਹੈ, ਸਧਾਰਨ ਇਕ-ਕਮਾਂਡ ਤਾਇਨਾਤੀਆਂ ਤੋਂ ਲੈ ਕੇ ਕਸਟਮ ਹੁਕ, ਬਹੁ ਵਾਤਾਵਰਣ ਅਤੇ CI/CD ਏਕੀਕਰਨ ਦੇ ਨਾਲ ਉਤਪਾਦਨ ਸਥਿਤੀਆਂ ਤੱਕ। ਵਿਹਾਰਿਕ ਉਦਾਹਰਣਾਂ ਅਤੇ ਸਰਵੋਤਮ ਅਭਿਆਸਾਂ ਦੇ ਨਾਲ ਪੂਰੇ ਤਾਇਨਾਤੀ ਲਾਈਫਸਾਈਕਲ ਵਿੱਚ ਮਾਹਰ ਹੋਵੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ ਤੁਸੀਂ:
- Azure Developer CLI ਦੀਆਂ ਸਾਰੀਆਂ ਤਾਇਨਾਤੀ ਕਮਾਂਡਾਂ ਅਤੇ ਵਰਕਫਲੋਜ਼ ਵਿੱਚ ਮਾਹਰ ਹੋਵੋਗੇ
- ਪ੍ਰੋਵਿਜ਼ਨ ਤੋਂ ਮਾਨੀਟਰਨਿੰਗ ਤੱਕ ਪੂਰੇ ਤਾਇਨਾਤੀ ਲਾਈਫਸਾਈਕਲ ਨੂੰ ਸਮਝੋਂਗੇ
- ਪ੍ਰੀ ਅਤੇ ਪੋਸਟ-ਤਾਇਨਾਤੀ ਆਟੋਮੇਸ਼ਨ ਲਈ ਕਸਟਮ ਡਿਪਲੋਇਮੈਂਟ ਹੁਕਜ਼ ਲਾਗੂ ਕਰ ਰਹੋਗੇ
- ਵਾਤਾਵਰਨ-ਖਾਸ ਪੈਰਾਮੀਟਰਾਂ ਨਾਲ ਬਹੁ ਵਾਤਾਵਰਣ ਸੰਰਚਨਾਵਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋਗੇ
- ਬਲੂ-ਗ੍ਰੀਨ ਅਤੇ ਕੈਨੇਰੀ ਸਮੇਤ ਉੱਨਤ ਤਾਇਨਾਤੀ ਰਣਨੀਤੀਆਂ ਸੈਟਅੱਪ ਕਰੋਗੇ
- azd ਤਾਇਨਾਤੀਆਂ ਨੂੰ CI/CD ਪਾਈਪਲਾਈਨਾਂ ਅਤੇ DevOps ਵਰਕਫਲੋਜ਼ ਨਾਲ ਇਕੀਕ੍ਰਿਤ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਸਾਰੇ azd ਤਾਇਨਾਤੀ ਵਰਕਫਲੋਜ਼ ਨੂੰ ਸਵਤੰਤਰ ਤੌਰ 'ਤੇ ਚਲਾਉਣ ਅਤੇ ਸਮੱਸਿਆ ਹੱਲ ਕਰਨ
- ਹੁਕਜ਼ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕਸਟਮ ਤਾਇਨਾਤੀ ਆਟੋਮੇਸ਼ਨ డਿਜ਼ਾਈਨ ਅਤੇ ਲਾਗੂ ਕਰਨ
- ਉਚਿੱਤ ਸੁਰੱਖਿਆ ਅਤੇ ਮਾਨੀਟਰਨਿੰਗ ਨਾਲ ਉਤਪਾਦਨ-ਤਿਆਰ ਤਾਇਨਾਤੀਆਂ ਸੰਰਚਿਤ ਕਰਨ
- ਜਟਿਲ ਬਹੁ-ਵਾਤਾਵਰਣ ਤਾਇਨਾਤੀ ਸਥਿਤੀਆਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰਨ
- ਤਾਇਨਾਤੀ ਕਾਰਗਿਰੀ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਅਤੇ ਰੋਲਬੈਕ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰਨ
- azd ਤਾਇਨਾਤੀਆਂ ਨੂੰ ਐਂਟਰਪ੍ਰਾਈਜ਼ DevOps ਅਭਿਆਸ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰਨ

## ਤਾਇਨਾਤੀ ਦਾ ਸਰਵੇਖਣ

Azure Developer CLI ਕਈ ਤਾਇਨਾਤੀ ਕਮਾਂਡਾਂ ਮੁਹੱਈਆ ਕਰਦਾ ਹੈ:
- `azd up` - ਪੂਰਾ ਵਰਕਫਲੋ (ਪ੍ਰੋਵਿਜ਼ਨ + ਤਾਇਨਾਤੀ)
- `azd provision` - ਸਿਰਫ਼ Azure ਸਰੋਤ ਬਣਾਓ/ਅਪਡੇਟ ਕਰੋ
- `azd deploy` - ਸਿਰਫ਼ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਤਾਇਨਾਤੀ ਕਰੋ
- `azd package` - ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਬਿਲਡ ਅਤੇ ਪੈਕੇਜ ਕਰੋ

## ਬੁਨਿਆਦੀ ਤਾਇਨਾਤੀ ਵਰਕਫਲੋਜ਼

### ਮੁਕੰਮਲ ਤਾਇਨਾਤੀ (azd up)
ਨਵੀਆਂ ਪ੍ਰੋਜੈਕਟਾਂ ਲਈ ਸਭ ਤੋਂ ਆਮ ਵਰਕਫਲੋ:
```bash
# ਸ਼ੁਰੂ ਤੋਂ ਸਭ ਕੁਝ ਤੈਨਾਤ ਕਰੋ
azd up

# ਨਿਰਧਾਰਤ ਵਾਤਾਵਰਨ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up --environment production

# ਕਸਟਮ ਪੈਰਾਮੀਟਰਾਂ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ਕੇਵਲ ਢਾਂਚਾ ਤਾਇਨਾਤੀ
ਜਦੋਂ ਤੁਹਾਨੂੰ ਸਿਰਫ਼ Azure ਸਰੋਤ ਅਪਡੇਟ ਕਰਨੇ ਹੋਣ:
```bash
# ਢਾਂਚੇ ਨੂੰ ਪ੍ਰੋਵਿਜ਼ਨ/ਅਪਡੇਟ ਕਰੋ
azd provision

# ਬਦਲਾਵਾਂ ਦੀ ਪੂਰਵ-ਜਾਂਚ ਕਰਨ ਲਈ ਡ੍ਰਾਈ-ਰਨ ਨਾਲ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋ
azd provision --preview

# ਨਿਰਧਾਰਿਤ ਸੇਵਾਵਾਂ ਦਾ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋ
azd provision --service database
```

### ਕੋਡ-ਕੇਵਲ ਤਾਇਨਾਤੀ
ਤੇਜ਼ ਐਪਲੀਕੇਸ਼ਨ ਅਪਡੇਟ ਲਈ:
```bash
# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਤਾਇਨਾਤ ਕਰੋ
azd deploy

# ਉਮੀਦ ਕੀਤੀ ਆਉਟਪੁੱਟ:
# ਸੇਵਾਵਾਂ ਤਾਇਨਾਤ ਕੀਤੀਆਂ ਜਾ ਰਹੀਆਂ ਹਨ (azd deploy)
# - web: ਤਾਇਨਾਤ ਕੀਤਾ ਜਾ ਰਿਹਾ... ਹੋ ਗਿਆ
# - api: ਤਾਇਨਾਤ ਕੀਤਾ ਜਾ ਰਿਹਾ... ਹੋ ਗਿਆ
# ਸਫਲਤਾ: ਤੁਹਾਡੀ ਤਾਇਨਾਤ 2 ਮਿੰਟ 15 ਸਕਿੰਟ ਵਿੱਚ ਪੂਰੀ ਹੋ ਗਈ

# ਕਿਸੇ ਵਿਸ਼ੇਸ਼ ਸੇਵਾ ਨੂੰ ਤਾਇਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# ਕਸਟਮ ਬਿਲਡ ਪੈਰਾਮੀਟਰਾਂ ਨਾਲ ਤਾਇਨਾਤ ਕਰੋ
azd deploy --service api --build-arg NODE_ENV=production

# ਤਾਇਨਾਤ ਦੀ ਜਾਂਚ ਕਰੋ
azd show --output json | jq '.services'
```

### ✅ ਤਾਇਨਾਤੀ ਦੀ ਪੁਸ਼ਟੀ

ਕਿਸੇ ਵੀ ਤਾਇਨਾਤੀ ਤੋਂ ਬਾਅਦ, ਸਫਲਤਾ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:

```bash
# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਚੱਲ ਰਹੀਆਂ ਹਨ ਕਿ ਨਹੀਂ ਜਾਂਚੋ
azd show

# ਹੈਲਥ ਐਂਡਪੋਇੰਟਸ ਦੀ ਜਾਂਚ ਕਰੋ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ਗਲਤੀਆਂ ਲਈ ਨਿਗਰਾਨੀ ਕਰੋ (ਡਿਫਾਲਟ ਤੌਰ 'ਤੇ ਬ੍ਰਾਊਜ਼ਰ ਵਿੱਚ ਖੁਲਦਾ ਹੈ)
azd monitor --logs
```

**ਸਫਲਤਾ ਦੇ ਮਿਆਰ:**
- ✅ ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ "ਚੱਲ ਰਹੀਆਂ" ਸਥਿਤੀ ਦਿਖਾਉਂਦੀਆਂ ਹਨ
- ✅ ਹੈਲਥ ਐਂਡਪੌਇੰਟ HTTP 200 ਵਾਪਸ ਕਰਦੇ ਹਨ
- ✅ ਪਿਛਲੇ 5 ਮਿੰਟਾਂ ਵਿੱਚ ਕੋਈ ਐਰਰ ਲੋਗ ਨਹੀਂ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਟੈਸਟ ਰਿਕਵੇਸਟਾਂ ਦਾ ਜਵਾਬ ਦਿੰਦੀ ਹੈ

## 🏗️ ਤਾਇਨਾਤੀ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਸਮਝਣਾ

### ਚਰਣ 1: ਪ੍ਰੀ-ਪ੍ਰੋਵਿਜ਼ਨ ਹੁਕ
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

### ਚਰਣ 2: ਢਾਂਚਾ ਪ੍ਰੋਵਿਜ਼ਨ
- ਢਾਂਚਾ ਟੈਮਪਲੇਟ (Bicep/Terraform) ਨੂੰ ਪੜ੍ਹਦਾ ਹੈ
- Azure ਸਰੋਤ ਬਣਾਉਂਦਾ ਜਾਂ ਅਪਡੇਟ ਕਰਦਾ ਹੈ
- ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਨੂੰ ਸੰਰਚਿਤ ਕਰਦਾ ਹੈ
- ਨਿਗਰਾਨੀ ਅਤੇ ਲੋਗਿੰਗ ਸੈਟਅੱਪ ਕਰਦਾ ਹੈ

### ਚਰਣ 3: ਪੋਸਟ-ਪ੍ਰੋਵਿਜ਼ਨ ਹੁਕ
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

### ਚਰਣ 4: ਐਪਲੀਕੇਸ਼ਨ ਪੈਕੇਜਿੰਗ
- ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਬਿਲਡ ਕਰਦਾ ਹੈ
- ਤਾਇਨਾਤੀ ਆਰਟੀਫੈਕਟ ਬਣਾਉਂਦਾ ਹੈ
- ਟਾਰਗੇਟ ਪਲੇਟਫਾਰਮ ਲਈ ਪੈਕੇਜ਼ ਬਣਾਉਂਦਾ ਹੈ (ਕੰਟੇਨਰ, ZIP ਫਾਇਲਾਂ ਆਦਿ)

### ਚਰਣ 5: ਪ੍ਰੀ-ਡਿਪਲੋਏ ਹੁਕ
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

### ਚਰਣ 6: ਐਪਲੀਕੇਸ਼ਨ ਤਾਇਨਾਤੀ
- ਪੈਕੇਜ ਕੀਤੀਆਂ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ Azure ਸੇਵਾਵਾਂ 'ਤੇ ਤਾਇਨਾਤੀ ਕਰਦਾ ਹੈ
- ਕੰਫਿਗਰੇਸ਼ਨ ਸੈਟਿੰਗਜ਼ ਅਪਡੇਟ ਕਰਦਾ ਹੈ
- ਸੇਵਾਵਾਂ ਨੂੰ ਸ਼ੁਰੂ/ਰੀਸਟਾਰਟ ਕਰਦਾ ਹੈ

### ਚਰਣ 7: ਪੋਸਟ-ਡਿਪਲੋਏ ਹੁਕ
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

## 🎛️ ਤਾਇਨਾਤੀ ਸੰਰਚਨਾ

### ਸੇਵਾ-ਖਾਸ ਤਾਇਨਾਤੀ ਸੈਟਿੰਗਾਂ
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

### ਵਾਤਾਵਰਣ-ਖਾਸ ਸੰਰਚਨਾਵਾਂ
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

## 🔧 ਉੱਨਤ ਤਾਇਨਾਤੀ ਪਰਿਸਥਿਤੀਆਂ

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

### ਬਲੂ-ਗ੍ਰੀਨ ਤਾਇਨਾਤੀਆਂ
```bash
# ਨੀਲਾ ਮਾਹੌਲ ਬਣਾਓ
azd env new production-blue
azd up --environment production-blue

# ਨੀਲੇ ਮਾਹੌਲ ਦੀ ਜਾਂਚ ਕਰੋ
./scripts/test-environment.sh production-blue

# ਟ੍ਰੈਫਿਕ ਨੂੰ ਨੀਲੇ ਮਾਹੌਲ ਵੱਲ ਬਦਲੋ (ਹੱਥੋਂ DNS/ਲੋਡ ਬੈਲੈਂਸਰ ਨੂੰ ਅਪਡੇਟ ਕਰੋ)
./scripts/switch-traffic.sh production-blue

# ਹਰਾ ਮਾਹੌਲ ਸਾਫ ਕਰੋ
azd env select production-green
azd down --force
```

### ਕੈਨੇਰੀ ਤਾਇਨਾਤੀਆਂ
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

### ਮੰਚ ਬਿਨੰਤੀ ਤਾਇਨਾਤੀਆਂ
```bash
#!/ਬਿਨ/ਬੈਸ਼
# ਡਿਪਲੋਇ-ਸਟੇਜਡ.sh

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

## 🐳 ਕੰਟੇਨਰ ਤਾਇਨਾਤੀਆਂ

### ਕੰਟੇਨਰ ਐਪ ਤਾਇਨਾਤੀਆਂ
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

### ਬਹੁ-ਚਰਣ Dockerfile ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ
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

## ⚡ ਪ੍ਰਦਰਸ਼ਨ ਸੁਧਾਰ

### ਸੇਵਾ-ਖਾਸ ਤਾਇਨਾਤੀਆਂ
```bash
# ਤੇਜ਼ ਦੁਹਰਾਈ ਲਈ ਇੱਕ ਵਿਸ਼ੇਸ਼ ਸੇਵਾ ਤਾਇਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# ਸਭ ਸੇਵਾਵਾਂ ਤਾਇਨਾਤ ਕਰੋ
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

### ਕਾਰਗਰ ਕੋਡ ਤਾਇਨਾਤੀਆਂ
```bash
# ਕੇਵਲ ਕੋਡ ਬਦਲਾਵਾਂ ਲਈ azd deploy (azd up ਨਹੀਂ) ਵਰਤੋ
# ਇਹ ਇੰਫਰਾਸਟਰੱਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਨੂੰ ਛੱਡ ਦਿੰਦਾ ਹੈ ਅਤੇ ਬਹੁਤ ਤੇਜ਼ ਹੈ
azd deploy

# ਸਭ ਤੋਂ ਤੇਜ਼ ਇਟਰੇਸ਼ਨ ਲਈ ਕਿਸੇ ਵਿਸ਼ੇਸ਼ ਸੇਵਾ ਨੂੰ ਡਿਪਲੋਇ ਕਰੋ
azd deploy --service api
```

## 🔍 ਤਾਇਨਾਤੀ ਨਿਗਰਾਨੀ

### ਰੀਅਲ-ਟਾਈਮ ਤਾਇਨਾਤੀ ਨਿਗਰਾਨੀ
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਰੀਅਲ-ਟਾਈਮ ਵਿੱਚ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --live

# ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਲੌਗ ਵੇਖੋ
azd monitor --logs

# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show
```

### ਹੈਲਥ ਚੈਕ
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

### ਪੋਸਟ-ਤਾਇਨਾਤੀ ਸੰਗ੍ਰਹਿ / ਮਾਨਤਾ
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

### ਰਹੱਸ ਪ੍ਰਬੰਧਨ
```bash
# ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਸਟੋਰ ਕਰੋ
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml ਵਿੱਚ ਰਾਜ਼ਾਂ ਦਾ ਹਵਾਲਾ ਦਿਓ
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

### ਪਹਚਾਨ ਅਤੇ ਐਕਸੈਸ ਪ੍ਰਬੰਧਨ
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

### ਤੇਜ਼ ਰੋਲਬੈਕ
```bash
# AZD ਵਿੱਚ ਅੰਦਰੂਨੀ ਰੋਲਬੈਕ ਨਹੀਂ ਹੈ। ਸਿਫਾਰਸ਼ ਕੀਤੀਆਂ ਵਿਧੀਆਂ:

# ਵਿਕਲਪ 1: Git ਤੋਂ ਦੁਬਾਰਾ ਡਿਪਲੋਏ ਕਰੋ (ਸਿਫਾਰਸ਼ ਕੀਤੀ ਗਈ)
git revert HEAD  # ਸਮੱਸਿਆਪੂਰਨ ਕਮਿਟ ਨੂੰ ਰਿਵਰਟ ਕਰੋ
git push
azd deploy

# ਵਿਕਲਪ 2: ਨਿਰਧਾਰਿਤ ਕਮਿਟ ਨੂੰ ਦੁਬਾਰਾ ਡਿਪਲੋਏ ਕਰੋ
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ਢਾਂਚਾ ਰੋਲਬੈਕ
```bash
# ਲਾਗੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਦੀਆਂ ਤਬਦੀਲੀਆਂ ਦਾ ਜਾਇਜ਼ਾ ਲਓ
azd provision --preview

# ਇੰਫ੍ਰਾਸਟਰੱਕਚर ਦੀ ਰੋਲਬੈਕ ਲਈ ਵਰਜਨ ਕੰਟਰੋਲ ਦੀ ਵਰਤੋਂ ਕਰੋ:
git revert HEAD  # ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਦੀਆਂ ਤਬਦੀਲੀਆਂ ਨੂੰ ਵਾਪਸ ਲਿਆਓ
azd provision    # ਪਿਛਲੀ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਸਥਿਤੀ ਲਾਗੂ ਕਰੋ
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

## 📊 ਤਾਇਨਾਤੀ ਮੈਟ੍ਰਿਕਸ

### ਤਾਇਨਾਤੀ ਕਾਰਗਿਰਦਗੀ ਨੂੰ ਟਰੈਕ ਕਰੋ
```bash
# ਮੌਜੂਦਾ ਡਿਪਲੋਇਮੈਂਟ ਸਥਿਤੀ ਵੇਖੋ
azd show

# Application Insights ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --overview

# ਲਾਈਵ ਮੈਟ੍ਰਿਕਸ ਵੇਖੋ
azd monitor --live
```

### ਕਸਟਮ ਮੈਟ੍ਰਿਕਸ ਇਕੱਤਰ ਕਰਨਾ
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

### 1. ਵਾਤਾਵਰਣ ਸਥਿਰਤਾ
```bash
# ਨਾਮਕਰਨ ਵਿੱਚ ਇੱਕਸਾਰਤਾ ਰੱਖੋ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ ਸਮਰੂਪਤਾ ਬਣਾਈ ਰੱਖੋ
./scripts/sync-environments.sh
```

### 2. ਢਾਂਚਾਗਤ ਤਸਦੀਕ
```bash
# ਤੈਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ ਢਾਂਚੇ ਵਿੱਚ ਹੋਣ ਵਾਲੇ ਬਦਲਾਅ ਦਾ ਪ੍ਰੀਵਿਊ ਕਰੋ
azd provision --preview

# ARM/Bicep ਲਿੰਟਿੰਗ ਵਰਤੋ
az bicep lint --file infra/main.bicep

# Bicep ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
az bicep build --file infra/main.bicep
```

### 3. ਟੈਸਟਇੰਗ ਏਕੀਕਰਨ
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

### 4. ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ ਅਤੇ ਲੋਗਿੰਗ
```bash
# ਡਿਪਲੋਇਮੈਂਟ ਦੀਆਂ ਪ੍ਰਕਿਰਿਆਵਾਂ ਦਸਤਾਵੇਜ਼ ਕਰੋ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ਅਗਲੇ ਕਦਮ

- [ਰਿਸੋਰਸ ਪ੍ਰੋਵਿਜ਼ਨ](provisioning.md) - ਢਾਂਚਾ ਪ੍ਰਬੰਧਨ ਵਿੱਚ ਡੂੰਘੀ ਛਾਨਬੀਨ
- [ਪ੍ਰੀ-ਤਾਇਨਾਤੀ ਯੋਜਨਾ](../chapter-06-pre-deployment/capacity-planning.md) - ਆਪਣੀ ਤਾਇਨਾਤੀ ਰਣਨੀਤੀ ਦੀ ਯੋਜਨਾ ਬਣਾਓ
- [ਆਮ ਸਮੱਸਿਆਵਾਂ](../chapter-07-troubleshooting/common-issues.md) - ਤਾਇਨਾਤੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰੋ
- [ਸਰਵੋਤਮ ਅਭਿਆਸ](../chapter-07-troubleshooting/debugging.md) - ਉਤਪਾਦਨ-ਤਿਆਰ ਤਾਇਨਾਤੀ ਰਣਨੀਤੀਆਂ

## 🎯 ਹੈਂਡਸ-ਆਨ ਤਾਇਨਾਤੀ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਇੰਕਰੀਮੈਂਟਲ ਤਾਇਨਾਤੀ ਵਰਕਫਲੋ (20 ਮਿੰਟ)
**ਉਦੇਸ਼**: ਪੂਰੀ ਅਤੇ ਇੰਕਰੀਮੈਂਟਲ ਤਾਇਨਾਤੀਆਂ ਦੇ ਵਿਚਕਾਰ ਫ਼ਰਕ ਵਿੱਚ ਮਾਹਰ ਹੋਣਾ

```bash
# ਸ਼ੁਰੂਆਤੀ ਡਿਪਲੌਇਮੈਂਟ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ਸ਼ੁਰੂਆਤੀ ਡਿਪਲੌਇਮੈਂਟ ਦਾ ਸਮਾਂ ਦਰਜ ਕਰੋ
echo "Full deployment: $(date)" > deployment-log.txt

# ਕੋਡ ਵਿੱਚ ਤਬਦੀਲੀ ਕਰੋ
echo "// Updated $(date)" >> src/api/src/server.js

# ਸਿਰਫ ਕੋਡ ਡਿਪਲੌਇਮੈਂਟ ਕਰੋ (ਤੇਜ਼)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# ਸਮਿਆਂ ਦੀ ਤੁਲਨਾ ਕਰੋ
cat deployment-log.txt

# ਸਾਫ਼-ਸੁਥਰਾ ਕਰੋ
azd down --force --purge
```

**ਸਫਲਤਾ ਦੇ ਮਿਆਰ:**
- [ ] ਪੂਰੀ ਤਾਇਨਾਤੀ 5-15 ਮਿੰਟ ਲੈਂਦੀ ਹੈ
- [ ] ਕੋਡ-ਕੇਵਲ ਤਾਇਨਾਤੀ 2-5 ਮਿੰਟ ਲੈਂਦੀ ਹੈ
- [ ] ਕੋਡ ਬਦਲਾਅ ਤਾਇਨਾਤ ਕੀਤੇ ਐਪ ਵਿੱਚ ਦਰਸਾਏ ਗਏ ਹਨ
- [ ] `azd deploy` ਤੋਂ ਬਾਅਦ ਢਾਂਚਾ ਅਪਰਿਵਰਤਤ ਰਹਿੰਦਾ ਹੈ

**ਸਿੱਖਣ ਨਤੀਜਾ**: `azd deploy` ਕੋਡ ਬਦਲਾਅ ਲਈ `azd up` ਨਾਲੋਂ 50-70% ਤੇਜ਼ ਹੈ

### ਅਭਿਆਸ 2: ਕਸਟਮ ਤਾਇਨਾਤੀ ਹੁਕ (30 ਮਿੰਟ)
**ਉਦੇਸ਼**: ਪ੍ਰੀ ਅਤੇ ਪੋਸਟ-ਤਾਇਨਾਤੀ ਆਟੋਮੇਸ਼ਨ ਲਾਗੂ ਕਰੋ

```bash
# ਪ੍ਰੀ-ਡਿਪਲੌਇ ਵੈਲਿਡੇਸ਼ਨ ਸਕ੍ਰਿਪਟ ਬਣਾਓ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ਜਾਂਚ ਕਰੋ ਕਿ ਟੈਸਟ ਪਾਸ ਹਨ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ਅਣਕਮਿਟ ਕੀਤੀਆਂ ਤਬਦੀਲੀਆਂ ਲਈ ਜਾਂਚ ਕਰੋ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ਡਿਪਲੌਇ ਤੋਂ ਬਾਅਦ ਸਮੋਕ ਟੈਸਟ ਬਣਾਓ
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

# azure.yaml ਵਿੱਚ hooks ਸ਼ਾਮਲ ਕਰੋ
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# hooks ਨਾਲ ਡਿਪਲੌਇਮੈਂਟ ਦੀ ਜਾਂਚ ਕਰੋ
azd deploy
```

**ਸਫਲਤਾ ਦੇ ਮਿਆਰ:**
- [ ] ਪ੍ਰੀ-ਡਿਪਲੋਏ ਸਕ੍ਰਿਪਟ ਤਾਇਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ ਚਲਦੀ ਹੈ
- [ ] ਜੇ ਟੈਸਟ ਫੇਲ ਹੁੰਦੇ ਹਨ ਤਾਂ ਤਾਇਨਾਤੀ ਰੱਦ ਹੋ ਜਾਂਦੀ ਹੈ
- [ ] ਪੋਸਟ-ਡਿਪਲੋਏ ਸਮੋਕ ਟੈਸਟ ਹੈਲਥ ਦੀ ਪੁਸ਼ਟੀ ਕਰਦਾ ਹੈ
- [ ] ਹੁਕ ਸਹੀ ਕ੍ਰਮ ਵਿੱਚ ਚਲਦੇ ਹਨ

### ਅਭਿਆਸ 3: ਬਹੁ-ਵਾਤਾਵਰਣ ਤਾਇਨਾਤੀ ਰਣਨੀਤੀ (45 ਮਿੰਟ)
**ਉਦੇਸ਼**: ਮੰਚਿਤ ਤਾਇਨਾਤੀ ਵਰਕਫਲੋ ਲਾਗੂ ਕਰੋ (dev → staging → production)

```bash
# ਡਿਪਲੋਇਮੈਂਟ ਸਕ੍ਰਿਪਟ ਬਣਾਓ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ਕਦਮ 1: ਡੈਵ 'ਤੇ ਡਿਪਲੋਇ ਕਰੋ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ਕਦਮ 2: ਸਟੇਜਿੰਗ 'ਤੇ ਡਿਪਲੋਇ ਕਰੋ
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ਕਦਮ 3: ਉਤਪਾਦਨ ਲਈ ਮੈਨੂਅਲ ਮਨਜ਼ੂਰੀ
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

# ਪੜਾਅਵਾਰ ਡਿਪਲੋਇਮੈਂਟ ਚਲਾਓ
./deploy-staged.sh
```

**ਸਫਲਤਾ ਦੇ ਮਿਆਰ:**
- [ ] Dev ਵਾਤਾਵਰਣ ਸਫਲਤਾਪੂਰਵਕ ਤਾਇਨਾਤ ਹੁੰਦੀ ਹੈ
- [ ] Staging ਵਾਤਾਵਰਣ ਸਫਲਤਾਪੂਰਵਕ ਤਾਇਨਾਤ ਹੁੰਦੀ ਹੈ
- [ ] ਉਤਪਾਦਨ ਲਈ ਮੈਨੂਅਲ ਮਨਜ਼ੂਰੀ ਲਾਜ਼ਮੀ ਹੈ
- [ ] ਸਾਰੇ ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ ਕੰਮ ਕਰਦੇ ਹੈਲਥ ਚੈਕ ਹਨ
- [ ] ਜਰੂਰਤ ਪੈਣ 'ਤੇ ਰੋਲਬੈਕ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ

### ਅਭਿਆਸ 4: ਰੋਲਬੈਕ ਰਣਨੀਤੀ (25 ਮਿੰਟ)
**ਉਦੇਸ਼**: Git ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਤਾਇਨਾਤੀ ਰੋਲਬੈਕ ਲਾਗੂ ਅਤੇ ਟੈਸਟ ਕਰੋ

```bash
# v1 ਤਾਇਨਾਤ ਕਰੋ
azd env set APP_VERSION "1.0.0"
azd up

# v1 ਕਮਿਟ ਹੈਸ਼ ਨੂੰ ਸੇਵ ਕਰੋ
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ਟੁੱਟਣ ਵਾਲੇ ਬਦਲਾਅ ਨਾਲ v2 ਤਾਇਨਾਤ ਕਰੋ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ਅਸਫਲਤਾ ਦਾ ਪਤਾ ਲਗਾਓ ਅਤੇ ਰੋਲਬੈਕ ਕਰੋ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ਦੀ ਵਰਤੋਂ ਕਰ ਕੇ ਰੋਲਬੈਕ ਕਰੋ
    git revert HEAD --no-edit
    
    # ਵਾਤਾਵਰਣ ਨੂੰ ਰੋਲਬੈਕ ਕਰੋ
    azd env set APP_VERSION "1.0.0"
    
    # v1 ਨੂੰ ਦੁਬਾਰਾ ਤਾਇਨਾਤ ਕਰੋ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**ਸਫਲਤਾ ਦੇ ਮਿਆਰ:**
- [ ] ਤਾਇਨਾਤੀ ਨਾਕਾਮੀਆਂ ਦੀ ਪਛਾਣ ਕੀਤੀ ਜਾ ਸਕਦੀ ਹੈ
- [ ] ਰੋਲਬੈਕ ਸਕ੍ਰਿਪਟ ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ ਚਲਦੀ ਹੈ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਕੰਮ ਕਰਨ ਵਾਲੀ ਸਥਿਤੀ ਵਾਪਸ ਆ ਜਾਂਦੀ ਹੈ
- [ ] ਰੋਲਬੈਕ ਤੋਂ ਬਾਅਦ ਹੈਲਥ ਚੈਕ ਪਾਸ ਹੋ ਜਾਂਦੇ ਹਨ

## 📊 ਤਾਇਨਾਤੀ ਮੈਟ੍ਰਿਕਸ ਟ੍ਰੈਕਿੰਗ

### ਆਪਣੀ ਤਾਇਨਾਤੀ ਕਾਰਗਿਰਦਗੀ ਟਰੈਕ ਕਰੋ

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
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# ਫਾਈਲ ਵਿੱਚ ਲੌਗ ਕਰੋ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ਇਸਨੂੰ ਵਰਤੋ
./track-deployment.sh
```

**ਆਪਣੇ ਮੈਟ੍ਰਿਕਸ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ:**
```bash
# ਡਿਪਲੋਇਮੈਂਟ ਇਤਿਹਾਸ ਵੇਖੋ
cat deployment-metrics.csv

# ਔਸਤ ਡਿਪਲੋਇਮੈਂਟ ਸਮੇਂ ਦੀ ਗਣਨਾ ਕਰੋ
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## ਵਾਧੂ ਸਰੋਤ

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](../chapter-01-foundation/first-project.md)
- **ਅਗਲਾ ਪਾਠ**: [ਰਿਸੋਰਸ ਪ੍ਰੋਵਿਜ਼ਨ](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰਨ**:
ਇਹ ਦਸਤਾਵੇਜ਼ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਨਾਲ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੇਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣ-ਸਹੀਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪ੍ਰੋਫੈਸ਼ਨਲ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਪੈਦਾ਼ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫ਼ਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->