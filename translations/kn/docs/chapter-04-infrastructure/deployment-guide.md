# ನಿಯೋಜನೆ ಗೈಡ್ - AZD ನಿಯೋಜನೆಗಳನ್ನು ಮಾಸ್ಟರ್ ಮಾಡುವುದು

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆರ್ಝಿಡಿ ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 4 - ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಕೋಡ್ & ನಿಯೋಜನೆ
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)
- **➡️ ಮುಂದಿನದು**: [ಸಂಪನ್ಮೂಲಗಳ ನಿರ್ವಹಣೆ](provisioning.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 5: ಬಹು-ಏಜೆಂಟ್ AI ಪರಿಹಾರಗಳು](../../examples/retail-scenario.md)

## ಪರಿಚയം

ಈ ಸಂಪೂರ್ಣ ಮಾರ್ಗದರ್ಶಿ ಅಝುರ್ ಡೆವಲಪರ್ CLI ಬಳಸಿ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವ ಬಗ್ಗೆ ನೀವು ತಿಳಿಸಬೇಕಾದ ಎಲ್ಲವನ್ನೂ ಒಳಗೊಂಡಿದೆ, ಸರಳ ಒಂದು ಆದೇಶ ನಿಯೋಜನೆಗಳಿಂದ ಪ್ರಥಮಿಕತೆಗೆ ಹೊಕ್‌ಗಳು, ಬಹುನಿರ್ವಹಣಾ ವಾತಾವರಣಗಳು ಮತ್ತು CI/CD ಏಕೀಕರಣವುಳ್ಳ ಪ್ರಗತಿಕರ ಉತ್ಪಾದನಾ ದೃಶ್ಯಗಳವರೆಗೆ. ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳು ಮತ್ತು ಉತ್ತಮ ಅಭ್ಯಾಸಗಳೊಂದಿಗೆ ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ ಚಕ್ರವನ್ನು ಮಾಸ್ಟರ್ ಮಾಡಿ.

## ಕಲಿಕೆ ಗುರಿಗಳು

ಈ ಗೈಡ್ ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- ಅಝುರ್ ಡೆವಲಪರ್ CLI ನಿಯೋಜನೆ ಆದೇಶಗಳು ಮತ್ತು ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ಮಾಸ್ಟರ್ ಮಾಡುತ್ತೀರಿ
- ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ ವಯಸ್ಕದ ಚಕ್ರವನ್ನು ಪರಿಬೋಧನೆದಿಂದ ಪರಿವೀಕ್ಷಣೆಗೆ ತಿಳಿದುಕೊಳ್ಳುತ್ತೀರಿ
- ನಿಯೋಜನೆAutomationಗಾಗಿ ಕಸ್ಟಮೈಸ್ ಮಾಡಿದ ಹೊಕ್‌ಗಳನ್ನು ಜಾರಿಗೆ ತರಬೇಕು
- ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಪರಿಮಾಣಗಳೊಂದಿಗೆ ಬಹುನಿರ್ವಹಣಾ ವಾತಾವರಣಗಳನ್ನು ಸಂರಚಿಸಬೇಕು
- ಬ್ಲೂ-ಹಸಿರು ಮತ್ತು ಕ್ಯಾನರಿ ನಿಯೋಜನೆಗಳನ್ನು ಸೇರಿದಂತೆ ಸುದ್ಧಿಗೊಂಡ ನಿಯೋಜನೆ ತಂತ್ರಗಳನ್ನು ಸಮರ್ಪಕವಾಗಿ ಹೊಂದಿಸಬೇಕು
- CI/CD ಪೈಪ್ಲೈನ್‌ಗಳು ಮತ್ತು ಡೆವ್ಓಪ್ಸ್ ಕಾರ್ಯಪ್ರವಾಹಗಳೊಂದಿಗೆ azd ನಿಯೋಜನೆಗಳನ್ನು ಏಕೀಕರಿಸಬೇಕು

## ಕಲಿಕೆ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು:
- ಎಲ್ಲಾ azd ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ಸ್ವತಂತ್ರವಾಗಿ ಕಾರ್ಯಗತಗೊಳಿಸಿ ತೊಂದರೆ ನಿವಾರಣೆಯನ್ನು ಮಾಡಬಹುದು
- ಹೊಕ್‌ಗಳನ್ನು ಬಳಸಿ ಕಸ್ಟಮ್ ನಿಯೋಜನೆ Automation ವಿನ್ಯಾಸಗೊಳಿಸಿ ಜಾರಿಗೊಳಿಸಬಹುದು
- ಸರಿಯಾದ ಭದ್ರತೆ ಮತ್ತು ಪರವೀಕ್ಷಣೆಯೊಂದಿಗೆ ಉತ್ಪಾದನಾ ಸಿದ್ಧ ನಿಯೋಜನೆಗಳನ್ನು ಸಂರಚಿಸಬಹುದು
- ಸಂಕೀರ್ಣ ಬಹು-ವಾತಾವರಣ ನಿಯೋಜನೆ ದೃಶ್ಯಗಳನ್ನು ನಿರ್ವಹಿಸಬಹುದು
- ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಆಪ್ಟಿಮೈಸ್ ಮಾಡಿ ರೋಲ್ಬ್ಯಾಕ್ ತಂತ್ರಗಳನ್ನು ಜಾರಿಗೆ ತರಬಹುದು
- ಅಝಿಡಿ ನಿಯೋಜನೆಗಳನ್ನು ಎಂಟರ್‌ಪ್ರೈಸ್ ಡೆವ್ಓಪ್ಸ್ ಪ್ರಾಕ್ಟೀಸ್‌ಗಳಲ್ಲಿ ಸೇರಿಸಬಹುದು

## ನಿಯೋಜನೆ ಅವಲೋಕನ

ಅಝುರ್ ಡೆವಲಪರ್ CLI ಹಲವಾರು ನಿಯೋಜನೆ ಆದೇಶಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ:
- `azd up` - ಸಂಪೂರ್ಣ ಕಾರ್ಯಪ್ರವಾಹ (ಪ್ರೊವಿಷನ್ + ನಿಯೋಜನೆ)
- `azd provision` - ಕೇವಲ ಅಝುರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುವುದು/ನವೀಕರಿಸುವುದು
- `azd deploy` - ಕೇವಲ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸುವುದು
- `azd package` - ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಿ ಪ್ಯಾಕೇಜ್ ಮಾಡುವುದು

## ಮೂಲ ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹಗಳು

### ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ (azd up)
ಹೊಸ ಯೋಜನೆಗಳಿಗೆ ಅತ್ಯಂತ ಸಾಮಾನ್ಯ ಕಾರ್ಯಪ್ರವಾಹ:
```bash
# ಎಲ್ಲವನ್ನೂ ಶೂನ್ಯಸ್ಥಿತಿಯಿಂದ ನಿಯೋಜಿಸಿ
azd up

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರದೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up --environment production

# ಕಸ್ಟಮ್ ಪರಿಮಾಣಗಳೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್-ಮಾತ್ರ ನಿಯೋಜನೆ
ನೀವು ಕೇವಲ ಅಝುರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ನವೀಕರಿಸಬೇಕಾದಾಗ:
```bash
# ವ್ಯವಸ್ಥೆಯನ್ನು ಒದಗಿಸಲಾಗುತ್ತಿದೆ/ನವೀಕರಿಸಲಾಗುತ್ತಿದೆ
azd provision

# ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವದೃಶ್ಯ ಮಾಡಲು ಡ್ರೈ-ರನ್ ಮೂಲಕ ಒದಗಿಸಲಾಗುತ್ತಿದೆ
azd provision --preview

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಗಳನ್ನು ಒದಗಿಸಲಾಗುತ್ತಿದೆ
azd provision --service database
```

### ಕೋಡ್-ಮಾತ್ರ ನಿಯೋಜನೆ
ವೇಗವಾದ ಅಪ್ಲಿಕೇಶನ್ ನವೀಕರಣಗಳಿಗೆ:
```bash
# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd deploy

# ನಿರೀಕ್ಷಿತ_OUTPUT:
# ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಲಾಗುತ್ತಿದೆ (azd deploy)
# - ವೆಬ್: ನಿಯೋಜಿಸಲಾಗುತ್ತಿದೆ... ಸಂಪೂರ್ಣವಾಗಿದೆ
# - API: ನಿಯೋಜಿಸಲಾಗುತ್ತಿದೆ... ಸಂಪೂರ್ಣವಾಗಿದೆ
# ಯಶಸ್ಸು: ನಿಮ್ಮ ನಿಯೋಜನೆ 2 ನಿಮಿಷ 15 ಸೆಕೆಂಡುಗಳಲ್ಲಿ ಪೂರ್ಣಗೊಂಡಿದೆ

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿಯೋಜಿ
azd deploy --service web
azd deploy --service api

# ಕಸ್ಟಮ್ ಬಿಳ್ಡ್ ಆರ್ಗ್ಯುಮೆಂಟ್‌ಗಳೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd deploy --service api --build-arg NODE_ENV=production

# ನಿಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json | jq '.services'
```

### ✅ ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ

ಯಾವುದೇ ನಿಯೋಜನೆ ನಂತರ ಯಶಸ್ಸನ್ನು ಪರಿಶೀಲಿಸಿ:

```bash
# ಎಲ್ಲಾ ಸೇವೆಗಳು ನಡೆಯುತ್ತಿವೆಯೇ ಪರಿಶೀಲಿಸಿ
azd show

# ಆರೋಗ್ಯ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ದೋಷಗಳಿಗಾಗಿ ನಿಗಾ ವಹಿಸಿ (ಹೆಚ್ಚು ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯಲಾಗುತ್ತದೆ)
azd monitor --logs
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- ✅ ಎಲ್ಲಾ ಸೇವೆಗಳು "ಚಲಿತ" ಸ್ಥಿತಿಯನ್ನು ತೋರಿಸುತ್ತಿವೆ
- ✅ ಆರೋಗ್ಯ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು HTTP 200 ಅನ್ನು ನೀಡುತ್ತಿರುವುದು
- ✅ ಕಳೆದ 5 ನಿಮಿಷಗಳಲ್ಲಿ ಯಾವುದೇ ದೋಷ ಲಾಗ್ ಇಲ್ಲ
- ✅ ಅಪ್ಲಿಕೇಶನ್ ಪರೀಕ್ಷಾ ವಿನಂತಿಗಳಿಗೆ ಪ್ರತಿಕ್ರಿಯಿಸುತ್ತಿದೆ

## 🏗️ ನಿಯೋಜನೆ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### ಹಂತ 1: ಪೂರ್ವ-ಪ್ರೊವಿಷನ್ ಹೊಕ್‌ಗಳು
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

### ಹಂತ 2: ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಪ್ರೊವಿಷನಿಂಗ್
- ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಟೆಂಪ್ಲೇಟುಗಳ (ಬಿಸಿಪ್/ಟೆರ್ರಾಫಾರಂ) ಓದಿಕೆ
- ಅಝುರ್ ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುವುದು ಅಥವಾ ನವೀಕರಿಸುವುದು
- ನেট್ವರ್ಕಿಂಗ್ ಮತ್ತು ಭದ್ರತೆಯನ್ನು ಸಂರಚಿಸುವುದು
- ನಿರೀಕ್ಷಣೆ ಮತ್ತು ಲಾಗಿಂಗ್ ಅನ್ನು ಹೊಂದಿಸುವುದು

### ಹಂತ 3: ನಂತರದ-ಪ್ರೊವಿಷನ್ ಹೊಕ್‌ಗಳು
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

### ಹಂತ 4: ಅಪ್ಲಿಕೇಶನ್ ಪ್ಯಾಕೇಜಿಂಗ್
- ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿರ್ಮಿಸುವುದು
- ನಿಯೋಜನೆ ಕಲಿಕಾ ವಸ್ತುಗಳನ್ನು ರಚಿಸುವುದು
- ಗುರಿ ವೇದಿಕೆಯ (ಕಂಟೈನರ್‌ಗಳು, ZIP ಫೈಲ್‌ಗಳು ಇತ್ಯಾದಿ) ಪ್ಯಾಕೇಜ್ ಮಾಡುವುದು

### ಹಂತ 5: ಪೂರ್ವ-ನಿಯೋಜನೆ ಹೊಕ್‌ಗಳು
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

### ಹಂತ 6: ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ
- ಪ್ಯಾಕೇಜ್ ಮಾಡಲಾದ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ಅಝುರ್ ಸೇವೆಗಳಿಗೆ ನಿಯೋಜಿಸುವುದು
- ಸಂರಚನಾ ಸೆಟ್ಟಿಂಗ್ಗಳನ್ನು ನವೀಕರಿಸುವುದು
- ಸೇವೆಗಳನ್ನು ಪ್ರಾರಂಭಿಸುವುದು/ಮತ್ತೆ ಪ್ರಾರಂಭಿಸುವುದು

### ಹಂತ 7: ನಂತರ-ನಿಯೋಜನೆ ಹೊಕ್‌ಗಳು
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

## 🎛️ ನಿಯೋಜನೆ ಸಂರಚನೆ

### ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ನಿಯೋಜನೆ ಸೆಟ್ಟಿಂಗ್ಗಳು
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

### ವಾತಾವರಣ-ನಿರ್ದಿಷ್ಟ ಸಂರಚನೆಗಳು
```bash
# ಅಭಿವೃದ್ಧಿ ಪರಿಸರ
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# ಹಂತ ನಿರೀಕ್ಷಣಾ ಪರಿಸರ
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ಉತ್ಪಾದನಾ ಪರಿಸರ
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 ಪ್ರಗತಿಶೀಲ ನಿಯೋಜನೆ ದೃಶ್ಯಗಳು

### ಬಹು-ಸೇವಾ ಅಪ್ಲಿಕೇಶನ್‌ಗಳು
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

### ಬ್ಲೂ-ಹಸಿರು ನಿಯೋಜನೆಗಳು
```bash
# ನೀಲಿ ಪರಿಸರವನ್ನು ನಿರ್ಮಿಸಿ
azd env new production-blue
azd up --environment production-blue

# ನೀಲಿ ಪರಿಸರವನ್ನು ಪರೀಕ್ಷಿಸಿ
./scripts/test-environment.sh production-blue

# ಟ್ರಾಫಿಕ್ ಅನ್ನು ನೀಲಿಗೆ ಬದಲಿಸಿ (ಮಾನ್ಯುಯಲ್ DNS/ಲೋಡ್ ಬಲಾನ್ಸರ್ ನವೀಕರಣ)
./scripts/switch-traffic.sh production-blue

# ಹಸಿರು ಪರಿಸರವನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd env select production-green
azd down --force
```

### ಕ್ಯಾನರಿ ನಿಯೋಜನೆಗಳು
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

### ಹಂತಬದ್ಧ ನಿಯೋಜನೆಗಳು
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

## 🐳 ಕಂಟೈನರ್ ನಿಯೋಜನೆಗಳು

### ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಗಳು
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

### ಬಹು-ಹಂತ ಡೋಕರ್‌ಫೈಲ್ ಆಪ್ಟಿಮೈಜೆಷನ್
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

## ⚡ ಕಾರ್ಯಕ್ಷಮತೆ ಆಪ್ಟಿಮೈಜೇಶನ್

### ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ನಿಯೋಜನೆಗಳು
```bash
# ವೇಗದ ಪುನರಾವೃತ್ತಿಗಾಗಿ ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --service web
azd deploy --service api

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd deploy
```

### ನಿರ್ಮಾಣ ಕ್ಯಾಶಿಂಗ್
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### ಪರಿಣಾಮಕಾರಿ ಕೋಡ್ ನಿಯೋಜನೆಗಳು
```bash
# ಕೋಡ್-ಮಾತ್ರ ಬದಲಾವಣೆಗಳಿಗೆ azd deploy (azd up ಅಲ್ಲ) ಬಳಸಿ
# ಇದು ಮೂಲಭೂತ ಸೌಲಭ್ಯಗಳ ಒದಗಿಕೆಯನ್ನು ತಿರಸ್ಕರಿಸಿ ಮತ್ತು ಬಹಳವೇ ವೇಗವಾಗಿದೆ
azd deploy

# ಅತಿ ವೇಗದ ಪುನರಾವೃತ್ತಿಗೆ ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸು
azd deploy --service api
```

## 🔍 ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ

### ರಿಯಲ್-ಟೈಮ್ ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ
```bash
# ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನೇರ ಸಮಯದಲ್ಲಿ ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor --live

# ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# ನಿಯೋಜನೆ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show
```

### ಆರೋಗ್ಯ ತಪಾಸಣೆಗಳು
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

### ನಂತರ-ನಿಯೋಜನೆ ಮಾನ್ಯತೆ
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# ಆಪ್ಲಿಕೇಶನ್ ಆರೋಗ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ
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

## 🔐 ಭದ್ರತೆ ಪರಿಗಣನೆಗಳು

### ರಹಸ್ಯ ನಿರ್ವಹಣೆ
```bash
# ರಹಸ್ಯಗಳನ್ನು ಸುರಕ್ಷಿತವಾಗಿ ಸಂಗ್ರಹಿಸಿ
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml ನಲ್ಲಿ ರಹಸ್ಯಗಳನ್ನು ಉಲ್ಲೇಖಿಸಿ
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

### ಜಾಲ ಭದ್ರತೆ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ಗುರುತು ಮತ್ತು ಪ್ರವೇಶ ನಿರ್ವಹಣೆ
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

## 🚨 ರೋಲ್ಬ್ಯಾಕ್ ತಂತ್ರಗಳು

### ವೇಗವಾದ ರೋಲ್ಬ್ಯಾಕ್
```bash
# AZDಗೆ ಒಳಗೊಂಡಿರುವ ರೋಲ್ಬ್ಯಾಕ್ ಇಲ್ಲ. ಶಿಫಾರಸು ಮಾಡಲಾದ ವಿಧಾನಗಳು:

# ಆಯ್ಕೆಯು 1: ಗಿಟ್ ನಿಂದ ಪುನಃನಿಯೋಜಿಸು (ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ)
git revert HEAD  # ಸಮಸ್ಯೆಯುಳ್ಳ ಕಮಿಟ್ ಅನ್ನು ಹಿಂತಿರುಗಿಸಿ
git push
azd deploy

# ಆಯ್ಕೆಯು 2: ನಿರ್ದಿಷ್ಟ ಕಮಿಟ್ ಅನ್ನು ಪುನಃನಿಯೋಜಿಸು
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ರೋಲ್ಬ್ಯಾಕ್
```bash
# ಅನ್ವಯಿಸುವ ಮುನ್ನ ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವಾವಲೋಕನ ಮಾಡಿ
azd provision --preview

# ಮೂಲಸೌಕರ್ಯ ಪ್ರಮಾಣಪತ್ರಕ್ಕೆ, ಆವೃತ್ತಿ ನಿಯಂತ್ರಣವನ್ನು ಬಳಸಿ:
git revert HEAD  # ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಹಿಂದಿರುಗಿಸಿ
azd provision    # ಹಳೆಯ ಮೂಲಸೌಕರ್ಯ ಸ್ಥಿತಿಯನ್ನು ಅನ್ವಯಿಸಿ
```

### ಡೇಟಾಬೇಸ್ ಮೈಗ್ರೇಶನ್ ರೋಲ್ಬ್ಯಾಕ್
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ನಿಯೋಜನೆ ಮೆಟ್ರಿಕ್ಸ್

### ನಿಯೋಜನೆ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ
```bash
# ಪ್ರಸ್ತುತ ನಿಯೋಜನೆ ಸ್ಥಿತಿಯನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# ಆಪ್ಲಿಕೇಶನ್ ಇನ್ಸೈಟ್ಸ್ ಮೂಲಕ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಹಾಗೂ ನೋಡಿರಿ
azd monitor --overview

# ನೇರ ಸಮಯ ಮಾಪಕಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --live
```

### ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್ ಸಂಗ್ರಹಣೆ
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

## 🎯 ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### 1. ವಾತಾವರಣ ಸಕ್ರಮತೆ
```bash
# ಸಾವುಪಟ್ಟ ಹೆಸರು ಉಪಯೋಗಿಸಿ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ಪರಿಸರ ಸಮತೋಲವನ್ನು ಕಾಯ್ದುಕೊಳ್ಳಿ
./scripts/sync-environments.sh
```

### 2. ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಮಾನ್ಯತೆ
```bash
# ನಿಯೋಜನೆ ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವದೃಂದೂಪಣ ಮಾಡಿ
azd provision --preview

# ARM/Bicep ಲಿಂಟಿಂಗ್ ಬಳಸಿ
az bicep lint --file infra/main.bicep

# Bicep ವಾಕ್ಯರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
az bicep build --file infra/main.bicep
```

### 3. ಪರೀಕ್ಷಾ ಏಕೀಕರಣ
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

### 4. ಡಾಕ್ಯুমೆಂಟೇಶನ್ ಮತ್ತು ಲಾಗಿಂಗ್
```bash
# ದಾಖಲೆ ನಿಯೋಜನೆ ಪ್ರಕ್ರಿಯೆಗಳು
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ಮುಂದಿನ ಹಂತಗಳು

- [ಸಂಪನ್ಮೂಲಗಳ ನಿರ್ವಹಣೆ](provisioning.md) - ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ನಿರ್ವಹಣೆಯಲ್ಲಿನ ಆಸಕ್ತಿಕರ ಅಧ್ಯಯನ
- [ನಿಯೋಜನೆ ಪೂರ್ವ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md) - ನಿಮ್ಮ ನಿಯೋಜನೆ ತಂತ್ರವನ್ನು ಯೋಜಿಸಿ
- [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](../chapter-07-troubleshooting/common-issues.md) - ನಿಯೋಜನೆ ವಿಷಯಗಳ ಪರಿಹಾರ
- [ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು](../chapter-07-troubleshooting/debugging.md) - ಉತ್ಪಾದನಾ ಸಿದ್ಧ ನಿಯೋಜನೆ ನೀತಿಗಳು

## 🎯 ಕೈಯಲ್ಲಿ ನಿಯೋಜನೆ ವ್ಯಾಯಾಮಗಳು

### ವ್ಯಾಯಾಮ 1: ಕ್ರಮಸಿದ್ಧ ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹ (20 ನಿಮಿಷಗಳು)
**ಗುರಿ**: ಪೂರ್ಣ ಮತ್ತು ಕ್ರಮಸಿದ್ಧ ನಿಯೋಜನೆಗಳ ನಡುವಿನ ವ್ಯತ್ಯಾಸವನ್ನು ಮಾಸ್ಟರ್ ಮಾಡುವುದು

```bash
# ಪ್ರಾರಂಭಿಕ ನಿಯೋಜನೆ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ಪ್ರಾರಂಭಿಕ ನಿಯೋಜನೆ ಸಮಯವನ್ನು ದಾಖಲಿಸಿ
echo "Full deployment: $(date)" > deployment-log.txt

# ಕೋಡ್ ಬದಲಾವಣೆಯನ್ನು ಮಾಡಿ
echo "// Updated $(date)" >> src/api/src/server.js

# ಕೇವಲ ಕೋಡ್ ನಿಯೋಜಿಸಿ (ವೇಗವಾಗಿ)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# ಸಮಯಗಳನ್ನು ಹೋಲಿಸಿ
cat deployment-log.txt

# ಸ್ವಚ್ಛತೆ ಮಾಡಿ
azd down --force --purge
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಪೂರ್ಣ ನಿಯೋಜನೆಗೆ 5-15 ನಿಮಿಷಗಳು ಬೇಕು
- [ ] ಕೋಡ್-ಮಾತ್ರ ನಿಯೋಜನೆಗೆ 2-5 ನಿಮಿಷಗಳು ಬೇಕು
- [ ] ಕೋಡ್ ಬದಲಾವಣೆಗಳು ನಿಯೋಜಿತ ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ಪ್ರತಿಬಿಂಬಿಸುತ್ತವೆ
- [ ] `azd deploy` ನಂತರ ಇನ್ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅಸಂಪೂರ್ಣವಾಗಿರುತ್ತದೆ

**ಕಲಿಕೆಯ ಫಲಿತಾಂಶ**: ಕೋಡ್ ಬದಲಾವಣೆಗಳಿಗೆ `azd deploy` ಗಾಗಿ `azd up`ಿಗಿಂತ 50-70% ವೇಗವಾಗಿರುತ್ತದೆ

### ವ್ಯಾಯಾಮ 2: ಕಸ್ಟಮ್ ನಿಯೋಜನೆ ಹೊಕ್‌ಗಳು (30 ನಿಮಿಷಗಳು)
**ಗುರಿ**: ಪೂರ್ವ ಮತ್ತು ನಂತರ ನಿಯೋಜನೆ Automation ಅನ್ನು ಜಾರಿಗೆ ತರುವುದು

```bash
# ಮುಂಚಿತ-ವೃದ್ಧಿ ಮಾನ್ಯತೆ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ಪರೀಕ್ಷೆಗಳು ಪಾಸ್ ಆಗಿದೆಯೇ ನೋಡಿ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ಕಮಿಟ್ ಮಾಡದ ಬದಲಾವಣೆಗಳ ಪರಿಶೀಲನೆ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ನಂತರದ ವೃದ್ಧಿ ಸ್ಮೋಕ್ ಟೆಸ್ಟ್ ರಚಿಸಿ
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

# hooks ಅನ್ನು azure.yaml ಗೆ ಸೇರಿಸಿ
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# hooks ಜೊತೆ ವೃದ್ಧಿಯನ್ನು ಪರೀಕ್ಷಿ
azd deploy
```

**ಯಶಸ್ಸಿನಮಾನದಂಡಗಳು:**
- [ ] ಪೂರ್ವ-ನಿಯೋಜನೆ ಸ್ಕ್ರಿಪ್ಟ್ ನಿಯೋಜನೆಗೆ ಮುಂಚಿತವಾಗಿ ನಡೆಯಬೇಕು
- [ ] ಪರೀಕ್ಷೆಗಳು ವಿಫಲವಾದರೆ ನಿಯೋಜನೆ ನಿಲ್ಲಿಸಬೇಕು
- [ ] ನಂತರ-ನಿಯೋಜನೆ ಸ್ಮೋಕ್ ಟೆಸ್ಟ್ ಆರೋಗ್ಯವನ್ನು ಪರಿಶೀಲಿಸುತ್ತದೆ
- [ ] ಹೊಕ್‌ಗಳು ಸರಿಯಾದ ಕ್ರಮದಲ್ಲಿ ನಡೆಯಬೇಕು

### ವ್ಯಾಯಾಮ 3: ಬಹು-ವಾತಾವರಣ ನಿಯೋಜನೆ ತಂತ್ರ (45 ನಿಮಿಷಗಳು)
**ಗುರಿ**: ಹಂತಬದ್ಧ ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹ (dev → staging → production) ಜಾರಿ ಮಾಡುವುದು

```bash
# ನಿಯೋಜನೆ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ಹಂತ 1: ಡೆವ್‌ಗೆ ನಿಯೋಜಿಸಿ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ಹಂತ 2: ಸ್ಟೇಜಿಂಗ್‌ಗೆ ನಿಯೋಜಿಸಿ
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ಹಂತ 3: ಉತ್ಪಾದನೆಗಾಗಿ ಕೈಯಿಂದ ಅನುಮೋದನೆ
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

# ವಾತಾವರಣಗಳನ್ನು ರಚಿಸಿ
azd env new dev
azd env new staging
azd env new production

# ಹಂತಬದ್ಧ ನಿಯೋಜನೆಯನ್ನು ನಡಿಸಿ
./deploy-staged.sh
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಡೆವ್ ವಾತಾವರಣ ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಿತು
- [ ] ಸ್ಟೇಜಿಂಗ್ ವಾತಾವರಣ ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಿತು
- [ ] ಉತ್ಪಾದನೆಗೆ ಕೈಯಿಂದ ಅನುಮೋದನೆ ಅವಶ್ಯಕ
- [ ] ಎಲ್ಲ ವಾತಾವರಣಕ್ಕೂ ಕಾರ್ಯನಿರ್ವಹಣೆಯ ಆರೋಗ್ಯ ತಪಾಸಣೆಗಳಿವೆ
- [ ] ಅಗತ್ಯವಿದ್ದರೆ ಹಿಂದಕ್ಕೆ ಎರಿತಲಾಗಬಹುದು

### ವ್ಯಾಯಾಮ 4: ರೋಲ್ಬ್ಯಾಕ್ ತಂತ್ರ (25 ನಿಮಿಷಗಳು)
**ಗುರಿ**: Git ಬಳಸಿ ನಿಯೋಜನೆ ರೋಲ್ಬ್ಯಾಕ್ ಜಾರಿಗೊಳಿಸಿ ಪರೀಕ್ಷೆ ಮಾಡುವುದು

```bash
# ಎಂಮಾಡಿ v1
azd env set APP_VERSION "1.0.0"
azd up

# v1 ಕಮಿಟ್ ಹ್ಯಾಶ್ ಉಳಿಸಿ
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ಬ್ರೇಕಿಂಗ್‌ ಬದಲಾವಣೆಯೊಂದಿಗೆ v2 ಅನ್ನು نشر ಮಾಡಿ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ವೈಫಲ್ಯವನ್ನು ಪತ್ತೆ ಹಚ್ಚಿ ಮತ್ತು ಹಿಂದಿರುಗಿ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # ಗಿಟ್ ಬಳಸಿ ಹಿಂದಿರುಗಿಸಿ
    git revert HEAD --no-edit
    
    # ಪರಿಸರವನ್ನು ಹಿಂದಿರುಗಿಸಿ
    azd env set APP_VERSION "1.0.0"
    
    # ಪುನಃ v1 ಅನ್ನು نشر ಮಾಡಿ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ನಿಯೋಜನೆ ವೈಫಲ್ಯಗಳನ್ನು ಗುರುತಿಸಲು ಸಾಧ್ಯ
- [ ] ರೋಲ್ಬ್ಯಾಕ್ ಸ್ಕ್ರಿಪ್ಟ್ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತದೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯನಿರ್ವಹಣೆಯ ಸ್ಥಿತಿಗೆ ಮರಳುತ್ತದೆ
- [ ] ರೋಲ್ಬ್ಯಾಕ್ ನಂತರ ಆರೋಗ್ಯ ತಪಾಸಣೆಗಳು ಪಾಸಾಗಿವೆ

## 📊 ನಿಯೋಜನೆ ಮೆಟ್ರಿಕ್ ಟ್ರ್ಯಾಕಿಂಗ್

### ನಿಮ್ಮ ನಿಯೋಜನೆ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ

```bash
# ನಿಯೋಜನೆ ಮೌಲ್ಯಮಾಪನ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ
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

# ಫೈಲ್‌ಗೆ ಲಾಗ್ ಮಾಡಿ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ಅದನ್ನು ಬಳಸಿರಿ
./track-deployment.sh
```

**ನಿಮ್ಮ ಮೆಟ್ರಿಕ್ಸ್ ವಿಶ್ಲೇಷಿಸಿ:**
```bash
# ನಿಯೋಜನೆ ઇતિહાસ ansehen
cat deployment-metrics.csv

# ಸರಾಸರಿ ನಿಯೋಜನೆ સમય berechnen
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

- [ಅಝುರ್ ಡೆವಲಪರ್ CLI ನಿಯೋಜನೆ ಸೂಚ-reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [ಅಝುರ್ ಅಪ್ಲಿಕೇಶನ್ ಸೇವೆ ನಿಯೋಜನೆ](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [ಅಝುರ್ ಕಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [ಅಝುರ್ ಫಂಕ್ಷನ್ಸ್ ನಿಯೋಜನೆ](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ನ್ಯಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ನಿಮ್ಮ ಮೊದಲ ಯೋಜನೆ](../chapter-01-foundation/first-project.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಸಂಪನ್ಮೂಲಗಳ ನಿರ್ವಹಣೆ](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅस्वೀಕಾರ ಪತ್ರ**:  
ಈ ದಾಖಲೆಯನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗಾಗಿ ಪ್ರಯತ್ನಿಸುವುದಾಗಿಯೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಶುದ್ಧಿಗಳು ಇರಬಹುದಾಗಿದೆ ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನಿಸಿರಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿ ಇದ್ದ ಮೂಲ ದಾಖಲೆ ಅನುಮೋದಿತ ಮೂಲವಾಗಿ ಪರಿಗಣಿಸಲಾಗಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವತು<|vq_image_263|><|vq_image_4713|><|vq_image_15366|><|vq_image_1414|><|vq_image_7693|><|vq_image_9467|><|vq_image_4731|><|vq_image_7804|><|vq_image_2819|><|vq_image_12152|><|vq_image_1231|><|vq_image_15732|><|vq_image_9024|><|vq_image_9870|><|vq_image_1989|><|vq_image_15400|><|vq_image_13221|><|vq_image_15992|><|vq_image_8837|><|vq_image_15272|><|vq_image_12026|><|vq_image_12904|><|vq_image_6947|><|vq_image_13068|><|vq_image_10929|><|image_border_908|><|vq_image_10421|><|vq_image_15377|><|vq_image_13861|><|vq_image_1095|><|vq_image_13481|><|vq_image_15377|><|vq_image_7216|><|vq_image_15377|><|vq_image_4745|><|vq_image_2925|><|vq_image_16291|><|vq_image_13861|><|vq_image_15377|><|vq_image_11748|><|vq_image_14701|><|vq_image_15274|><|vq_image_15309|><|vq_image_5231|><|vq_image_606|><|vq_image_15377|><|vq_image_7672|><|vq_image_300|><|vq_image_5979|><|vq_image_4268|><|vq_image_5919|><|vq_image_3600|><|vq_image_5856|><|vq_image_15653|><|vq_image_6516|><|vq_image_2703|><|vq_image_15400|><|vq_image_10294|><|vq_image_4921|><|vq_image_13860|><|vq_image_11162|><|vq_image_3301|><|vq_image_6636|><|vq_image_3888|><|vq_image_13270|><|vq_image_13155|><|vq_image_9057|><|vq_image_9164|><|vq_image_9179|><|vq_image_12932|><|vq_image_8235|><|vq_image_12932|><|vq_image_5410|><|vq_image_7350|><|image_border_909|><|vq_image_4010|><|vq_image_8210|><|vq_image_11626|><|vq_image_4826|><|vq_image_4687|><|vq_image_7299|><|vq_image_9477|><|vq_image_5639|><|vq_image_5639|><|vq_image_5639|><|vq_image_5639|><|vq_image_5639|><|vq_image_5639|><|vq_image_5639|><|vq_image_5639|><|vq_image_5639|><|vq_image_5639|><|vq_image_8341|><|vq_image_2292|><|vq_image_13321|><|vq_image_13121|><|vq_image_9266|><|vq_image_4825|><|vq_image_2804|><|vq_image_2628|><|vq_image_11120|><|vq_image_16343|><|vq_image_4266|><|vq_image_6259|><|vq_image_10401|><|vq_image_382|><|vq_image_3809|><|vq_image_10476|><|vq_image_10589|><|vq_image_5230|><|vq_image_5488|><|vq_image_11106|><|vq_image_7456|><|vq_image_9428|><|vq_image_850|><|vq_image_16058|><|vq_image_6680|><|vq_image_10248|><|vq_image_7045|><|vq_image_512|><|vq_image_15595|><|vq_image_7639|><|vq_image_5260|><|image_border_910|><|vq_image_14363|><|vq_image_12998|><|vq_image_8473|><|vq_image_6764|><|vq_image_332|><|vq_image_1502|><|vq_image_13410|><|vq_image_2292|><|vq_image_11681|><|vq_image_2292|><|vq_image_11681|><|vq_image_11681|><|vq_image_11681|><|vq_image_11681|><|vq_image_11681|><|vq_image_11681|><|vq_image_9477|><|vq_image_13687|><|vq_image_11337|><|vq_image_16128|><|vq_image_12520|><|vq_image_2865|><|vq_image_7244|><|vq_image_7072|><|vq_image_7747|><|vq_image_1799|><|vq_image_2862|><|vq_image_11248|><|vq_image_13601|><|vq_image_15386|><|vq_image_4629|><|vq_image_5893|><|vq_image_7711|><|vq_image_6641|><|vq_image_8525|><|vq_image_9337|><|vq_image_11205|><|vq_image_1636|><|vq_image_4974|><|vq_image_2737|><|vq_image_8804|><|vq_image_3565|><|vq_image_10610|><|vq_image_15589|><|vq_image_2611|><|vq_image_12402|><|vq_image_3396|><|vq_image_2736|><|image_border_911|><|vq_image_14157|><|vq_image_1696|><|vq_image_10972|><|vq_image_13726|><|vq_image_13121|><|vq_image_3229|><|vq_image_2057|><|vq_image_9966|><|vq_image_7548|><|vq_image_7548|><|vq_image_7548|><|vq_image_7548|><|vq_image_7548|><|vq_image_7548|><|vq_image_7548|><|vq_image_7548|><|vq_image_7548|><|vq_image_14806|><|vq_image_15418|><|vq_image_773|><|vq_image_7364|><|vq_image_8995|><|vq_image_2091|><|vq_image_12493|><|vq_image_14472|><|vq_image_1446|><|vq_image_13028|><|vq_image_2929|><|vq_image_4259|><|vq_image_1774|><|vq_image_10076|><|vq_image_12895|><|vq_image_3793|><|vq_image_5064|><|vq_image_8761|><|vq_image_6639|><|vq_image_14911|><|vq_image_1729|><|vq_image_12718|><|vq_image_15258|><|vq_image_1178|><|vq_image_13562|><|vq_image_1455|><|vq_image_8967|><|vq_image_6342|><|vq_image_2458|><|vq_image_10222|><|vq_image_14249|><|image_border_912|><|vq_image_15182|><|vq_image_8089|><|vq_image_9717|><|vq_image_8757|><|vq_image_851|><|vq_image_13352|><|vq_image_8733|><|vq_image_14127|><|vq_image_1156|><|vq_image_8733|><|vq_image_1156|><|vq_image_8733|><|vq_image_1156|><|vq_image_14127|><|vq_image_1156|><|vq_image_1252|><|vq_image_10837|><|vq_image_1227|><|vq_image_10751|><|vq_image_1377|><|vq_image_4451|><|vq_image_1057|><|vq_image_3257|><|vq_image_4516|><|vq_image_14339|><|vq_image_14359|><|vq_image_4674|><|vq_image_485|><|vq_image_8228|><|vq_image_4261|><|vq_image_9910|><|vq_image_2336|><|vq_image_13214|><|vq_image_14677|><|vq_image_13239|><|vq_image_15269|><|vq_image_11161|><|vq_image_6089|><|vq_image_10997|><|vq_image_9141|><|vq_image_3990|><|vq_image_8249|><|vq_image_11242|><|vq_image_2797|><|vq_image_12392|><|vq_image_800|><|vq_image_15281|><|vq_image_14375|><|image_border_913|><|vq_image_965|><|vq_image_12136|><|vq_image_4366|><|vq_image_10334|><|vq_image_346|><|vq_image_8421|><|vq_image_15777|><|vq_image_5358|><|vq_image_13135|><|vq_image_13135|><|vq_image_13135|><|vq_image_13135|><|vq_image_13135|><|vq_image_13135|><|vq_image_13135|><|vq_image_13135|><|vq_image_13135|><|vq_image_13811|><|vq_image_15141|><|vq_image_12268|><|vq_image_8143|><|vq_image_9997|><|vq_image_3316|><|vq_image_7974|><|vq_image_6208|><|vq_image_9307|><|vq_image_1446|><|vq_image_1264|><|vq_image_13023|><|vq_image_15380|><|vq_image_3834|><|vq_image_5611|><|vq_image_7617|><|vq_image_13578|><|vq_image_12084|><|vq_image_14522|><|vq_image_13605|><|vq_image_7558|><|vq_image_15674|><|vq_image_6462|><|vq_image_6417|><|vq_image_9567|><|vq_image_9567|><|vq_image_6351|><|vq_image_6869|><|vq_image_6887|><|vq_image_14547|><|vq_image_2534|><|image_border_914|><|vq_image_13656|><|vq_image_7273|><|vq_image_2123|><|vq_image_14126|><|vq_image_15882|><|vq_image_5087|><|vq_image_3800|><|vq_image_10696|><|vq_image_14201|><|vq_image_11705|><|vq_image_6980|><|vq_image_11705|><|vq_image_2979|><|vq_image_11705|><|vq_image_11705|><|vq_image_11705|><|vq_image_11705|><|vq_image_11332|><|vq_image_10747|><|vq_image_6701|><|vq_image_10685|><|vq_image_7938|><|vq_image_6286|><|vq_image_14898|><|vq_image_2593|><|vq_image_788|><|vq_image_8981|><|vq_image_828|><|vq_image_9567|><|vq_image_1572|><|vq_image_1446|><|vq_image_10117|><|vq_image_7962|><|vq_image_11572|><|vq_image_8241|><|vq_image_6385|><|vq_image_3258|><|vq_image_2780|><|vq_image_9392|><|vq_image_16306|><|vq_image_13738|><|vq_image_15044|><|vq_image_15296|><|vq_image_12057|><|vq_image_2607|><|vq_image_12627|><|vq_image_1674|><|vq_image_12099|><|image_border_915|><|vq_image_7960|><|vq_image_4862|><|vq_image_1297|><|vq_image_10900|><|vq_image_16239|><|vq_image_4627|><|vq_image_16013|><|vq_image_277|><|vq_image_632|><|vq_image_632|><|vq_image_632|><|vq_image_9088|><|vq_image_632|><|vq_image_632|><|vq_image_632|><|vq_image_632|><|vq_image_4543|><|vq_image_13208|><|vq_image_10121|><|vq_image_6149|><|vq_image_4537|><|vq_image_10882|><|vq_image_1446|><|vq_image_10244|><|vq_image_202|><|vq_image_9551|><|vq_image_1424|><|vq_image_4134|><|vq_image_14138|><|vq_image_2256|><|vq_image_2456|><|vq_image_13168|><|vq_image_10931|><|vq_image_6244|><|vq_image_7157|><|vq_image_15531|><|vq_image_14147|><|vq_image_2147|><|vq_image_15374|><|vq_image_11556|><|vq_image_10503|><|vq_image_6079|><|vq_image_2469|><|vq_image_6704|><|vq_image_11777|><|vq_image_15236|><|vq_image_11158|><|vq_image_4316|><|image_border_916|><|vq_image_5280|><|vq_image_15077|><|vq_image_13893|><|vq_image_16005|><|vq_image_10040|><|vq_image_7762|><|vq_image_3014|><|vq_image_13135|><|vq_image_13135|><|vq_image_13135|><|vq_image_10696|><|vq_image_14065|><|vq_image_14065|><|vq_image_14065|><|vq_image_14065|><|vq_image_351|><|vq_image_10696|><|vq_image_10942|><|vq_image_11812|><|vq_image_344|><|vq_image_5488|><|vq_image_10761|><|vq_image_10691|><|vq_image_1110|><|vq_image_1110|><|vq_image_11695|><|vq_image_5140|><|vq_image_12809|><|vq_image_2607|><|vq_image_6477|><|vq_image_3543|><|vq_image_6527|><|vq_image_9011|><|vq_image_14310|><|vq_image_13941|><|vq_image_13965|><|vq_image_10291|><|vq_image_2147|><|vq_image_6250|><|vq_image_13095|><|vq_image_518|><|vq_image_3176|><|vq_image_3176|><|vq_image_5149|><|vq_image_11945|><|vq_image_10426|><|vq_image_8439|><|vq_image_13193|><|image_border_917|><|vq_image_16068|><|vq_image_13226|><|vq_image_14596|><|vq_image_6763|><|vq_image_10777|><|vq_image_12105|><|vq_image_13135|><|vq_image_10696|><|vq_image_14126|><|vq_image_14126|><|vq_image_14126|><|vq_image_14126|><|vq_image_14126|><|vq_image_14126|><|vq_image_14126|><|vq_image_4543|><|vq_image_12329|><|vq_image_5415|><|vq_image_2790|><|vq_image_15424|><|vq_image_12490|><|vq_image_9262|><|vq_image_1914|><|vq_image_4549|><|vq_image_9910|><|vq_image_7607|><|vq_image_10975|><|vq_image_6439|><|vq_image_13249|><|vq_image_10117|><|vq_image_2683|><|vq_image_6527|><|vq_image_1446|><|vq_image_12178|><|vq_image_14318|><|vq_image_15589|><|vq_image_9910|><|vq_image_3565|><|vq_image_13947|><|vq_image_8986|><|vq_image_3641|><|vq_image_1663|><|vq_image_3054|><|vq_image_9275|><|vq_image_4652|><|vq_image_12292|><|vq_image_13653|><|vq_image_13144|><|image_border_918|><|vq_image_13028|><|vq_image_5060|><|vq_image_11205|><|vq_image_3011|><|vq_image_15357|><|vq_image_10496|><|vq_image_14126|><|vq_image_14126|><|vq_image_14126|><|vq_image_14126|><|vq_image_14126|><|vq_image_14126|><|vq_image_14126|><|vq_image_14126|><|vq_image_4543|><|vq_image_5129|><|vq_image_1970|><|vq_image_8426|><|vq_image_10325|><|vq_image_7854|><|vq_image_15751|><|vq_image_5073|><|vq_image_6869|><|vq_image_963|><|vq_image_15014|><|vq_image_6490|><|vq_image_2|><|vq_image_8023|><|vq_image_14811|><|vq_image_12042|><|vq_image_13426|><|vq_image_13493|><|vq_image_7764|><|vq_image_8795|><|vq_image_2730|><|vq_image_15786|><|vq_image_13841|><|vq_image_2683|><|vq_image_6634|><|vq_image_13340|><|vq_image_4718|><|vq_image_5633|><|vq_image_5144|><|vq_image_7429|><|vq_image_16143|><|vq_image_7863|><|vq_image_8313|><|vq_image_14547|><|image_border_919|><|vq_image_12897|><|vq_image_13383|><|vq_image_5379|><|vq_image_2703|><|vq_image_8255|><|vq_image_10402|><|vq_image_8668|><|vq_image_2737|><|vq_image_2737|><|vq_image_2737|><|vq_image_2737|><|vq_image_2737|><|vq_image_2737|><|vq_image_2737|><|vq_image_2737|><|vq_image_351|><|vq_image_12756|><|vq_image_9626|><|vq_image_8105|><|vq_image_11428|><|vq_image_11137|><|vq_image_7898|><|vq_image_7406|><|vq_image_6577|><|vq_image_6667|><|vq_image_13971|><|vq_image_16139|><|vq_image_15669|><|vq_image_10572|><|vq_image_129|><|vq_image_9910|><|vq_image_1446|><|vq_image_112|><|vq_image_764|><|vq_image_1446|><|vq_image_8242|><|vq_image_5043|><|vq_image_15500|><|vq_image_3177|><|vq_image_635|><|vq_image_8749|><|vq_image_3548|><|vq_image_3458|><|vq_image_2141|><|vq_image_3044|><|vq_image_10885|><|vq_image_14003|><|vq_image_4190|><|image_border_920|><|vq_image_8908|><|vq_image_8394|><|vq_image_16156|><|vq_image_7541|><|vq_image_10900|><|vq_image_9088|><|vq_image_3159|><|vq_image_3159|><|vq_image_11332|><|vq_image_14126|><|vq_image_13135|><|vq_image_13135|><|vq_image_8255|><|vq_image_1403|><|vq_image_1403|><|vq_image_14387|><|vq_image_7106|><|vq_image_4007|><|vq_image_16323|><|vq_image_7532|><|vq_image_3215|><|vq_image_8307|><|vq_image_3211|><|vq_image_13635|><|vq_image_12976|><|vq_image_14974|><|vq_image_11998|><|vq_image_9980|><|vq_image_6560|><|vq_image_6702|><|vq_image_11731|><|vq_image_11845|><|vq_image_13918|><|vq_image_3434|><|vq_image_5713|><|vq_image_14318|><|vq_image_12117|><|vq_image_4516|><|vq_image_6674|><|vq_image_12020|><|vq_image_7121|><|vq_image_8855|><|vq_image_10942|><|vq_image_5225|><|vq_image_9649|><|vq_image_9456|><|vq_image_10237|><|vq_image_8241|><|image_border_921|><|vq_image_14760|><|vq_image_10490|><|vq_image_8563|><|vq_image_10656|><|vq_image_9229|><|vq_image_2931|><|vq_image_5909|><|vq_image_11202|><|vq_image_12028|><|vq_image_6407|><|vq_image_9088|><|vq_image_9088|><|vq_image_9088|><|vq_image_1403|><|vq_image_1403|><|vq_image_15187|><|vq_image_743|><|vq_image_3344|><|vq_image_8|><|vq_image_379|><|vq_image_8915|><|vq_image_376|><|vq_image_6705|><|vq_image_5232|><|vq_image_11108|><|vq_image_12060|><|vq_image_12577|><|vq_image_4756|><|vq_image_9697|><|vq_image_13835|><|vq_image_7406|><|vq_image_5913|><|vq_image_6327|><|vq_image_12500|><|vq_image_3546|><|vq_image_6609|><|vq_image_2340|><|vq_image_9792|><|vq_image_3258|><|vq_image_1674|><|vq_image_11827|><|vq_image_3239|><|vq_image_1740|><|vq_image_343|><|vq_image_1844|><|vq_image_3757|><|vq_image_15223|><|vq_image_14607|><|image_border_922|><|vq_image_4765|><|vq_image_15138|><|vq_image_379|><|vq_image_7617|><|vq_image_4624|><|vq_image_3913|><|vq_image_5598|><|vq_image_4701|><|vq_image_10886|><|vq_image_15256|><|vq_image_11805|><|vq_image_3990|><|vq_image_4707|><|vq_image_2788|><|vq_image_13746|><|vq_image_1607|><|vq_image_2071|><|vq_image_7651|><|vq_image_13502|><|vq_image_6569|><|vq_image_9197|><|vq_image_376|><|vq_image_14385|><|vq_image_4567|><|vq_image_12611|><|vq_image_13524|><|vq_image_3255|><|vq_image_1031|><|vq_image_12693|><|vq_image_1435|><|vq_image_10267|><|vq_image_5945|><|vq_image_13023|><|vq_image_3021|><|vq_image_3434|><|vq_image_11776|><|vq_image_2539|><|vq_image_14926|><|vq_image_2539|><|vq_image_15111|><|vq_image_3718|><|vq_image_648|><|vq_image_11252|><|vq_image_9649|><|vq_image_12188|><|vq_image_9084|><|vq_image_13954|><|vq_image_4134|><|image_border_923|><|vq_image_15509|><|vq_image_4407|><|vq_image_12928|><|vq_image_12928|><|vq_image_12928|><|vq_image_12928|><|vq_image_4407|><|vq_image_4407|><|vq_image_12928|><|vq_image_2549|><|vq_image_16068|><|vq_image_14846|><|vq_image_6243|><|vq_image_8999|><|vq_image_10486|><|vq_image_8477|><|vq_image_15527|><|vq_image_12525|><|vq_image_14732|><|vq_image_715|><|vq_image_376|><|vq_image_5019|><|vq_image_3445|><|vq_image_3882|><|vq_image_15623|><|vq_image_13596|><|vq_image_8978|><|vq_image_11798|><|vq_image_7473|><|vq_image_15391|><|vq_image_8087|><|end_of_task|
<!-- CO-OP TRANSLATOR DISCLAIMER END -->