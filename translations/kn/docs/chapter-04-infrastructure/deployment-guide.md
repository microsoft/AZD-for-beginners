# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮಾರ್ಗದರ್ಶಿ - AZD ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳಲ್ಲಿ ನಿಪುಣತೆ

**ಅಧ್ಯಾಯ ನವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [AZD ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 4 - Infrastructure as Code ಮತ್ತು ನಿಯೋಜನೆ
- **⬅️ ಹಿಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)
- **➡️ ಮುಂದಿನ**: [ಸಂಪನ್ಮೂಲಗಳ ಪ್ರೊವಿಷನಿಂಗ್](provisioning.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 5: ಬಹು-ಏಜೆಂಟ್ AI ಪರಿಹಾರಗಳು](../../examples/retail-scenario.md)

## ಪರಿಚಯ

ಈ ವಿಸ್ತೃತ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI ಬಳಸಿಕೊಂಡು ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವಿಕೆ ಕುರಿತಾಗಿ ನಿಮಗೆ ಬೇಕಾದ ಎಲ್ಲವನ್ನು ಒಳಗೊಂಡಿದೆ, ಸರಳ ಏಕ-ಕರುನ ನಿಯೋಜನೆಗಳಿಂದ ಆರಂಭಿಸಿ ಕಸ್ಟಮ್ ಹುಕ್‌ಗಳು, ಹಲವು ಪರಿಸರಗಳು ಮತ್ತು CI/CD ಅಳವಡಿಕೆಯನ್ನು ಒಳಗೊಂಡ ಸುಧಾರಿತ ಉತ್ಪನ್ನ ಪರಿಸ್ಥಿತಿಗಳವರೆಗೆ. ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳು ಮತ್ತು ಉತ್ತಮ ಅಭ್ಯಾಸಗಳೊಂದಿಗೆ ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ ಚಕ್ರವನ್ನು ನಿಪುಣತೆಯಿಂದ ಕವರ್ ಮಾಡಿ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸುವ ಮೂಲಕ ನೀವು:
- Azure Developer CLI ನಿಯೋಜನಾ ಆಜ್ಞೆಗಳು ಮತ್ತು ವರ್ಕ್‌ಫ್ಲೋಗಳನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ನೈಪುಣ್ಯಗೊಳ್ಳಿ
- ಪ್ರೊವಿಷನಿಂಗ್‌ನಿಂದ ಮಾನಿಟರಿಂಗ್‌ವರೆಗಿನ ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ ಚಕ್ರವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಿ
- ಪೂರ್ವ ಮತ್ತು ಪೋಸ್ಟ್-ನಿಯೋಜನೆ ಸ್ವಯಂಚಾಲಿತತೆಗಾಗಿ ಕಸ್ಟಮ್ ಹುಕ್‌ಗಳನ್ನು ಜಾರಿಗೆ ತರಲು ತಿಳಿದುಕೊಳ್ಳಿ
- ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಪರಾಮಿತಿಗಳೊಂದಿಗೆ ಬಹು-ಪರಿಸರಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ
- ಬ್ಲೂ-ಗ್ರೀನ್ ಮತ್ತು ಕ್ಯಾನರಿ ನಿಯೋಜನೆಗಳನ್ನು ಒಳಗೊಂಡ ಸುಧಾರಿತ ನಿಯೋಜನೆ ತಂತ್ರಗಳನ್ನು ಹೊಂದಿಸಿ
- azd ನಿಯೋಜನೆಗಳನ್ನು CI/CD ಪೈಪ್‌ಲೈನ್ಸ್ ಮತ್ತು DevOps ವರ್ಕ್‌ಫ್ಲೋಗಳೊಂದಿಗೆ ಜೋಡಿಸಿ

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಸಾಧ್ಯವಾಗುವುದು:
- azd ನಿಯೋಜನಾ ಎಲ್ಲಾ ವರ್ಕ್‌ಫ್ಲೋಗಳನ್ನು ಸ್ವತಂತ್ರವಾಗಿ ಕಾರ್ಯಗತಗೊಳಿಸಿ ಮತ್ತು ತೊಂದರೆ ಪರಿಹರಿಸು
- ಹುಕ್‌ಗಳನ್ನು ಬಳಸಿ ಕಸ್ಟಮ್ ನಿಯೋಜನಾ ಸ್ವಯಂಕ್ರಿಯೆಯನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಿ ಮತ್ತು ಜಾರಿಗೆ ತುರು
- ಸರಿಯಾದ ಭದ್ರತೆ ಮತ್ತು ಮಾನಿಟರಿಂಗ್ ಹೊಂದಿರುವ ಉತ್ಪನ್ನ-ಸಜ್ಜು ನಿಯೋಜನೆಗಳನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡಿ
-複雑ವಾದ (complex) ಬಹು-ಪರಿಸರ ನಿಯೋಜನಾ ದೃಶ್ಯಗಳನ್ನು ನಿರ್ವಹಿಸಿ
- ನಿಯೋಜನೆ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಉನ್ನತಗೊಳಿಸಿ ಮತ್ತು रोल್ಬ್ಯಾಕ್ ತಂತ್ರಗಳನ್ನು ಜಾರಿಗೆ ತರಲು
- azd ನಿಯೋಜನೆಗಳನ್ನು ಎಂಟರ್‌ಪ್ರೈಸ್ DevOps ಅಭ್ಯಾಸಗಳಲ್ಲಿ ಸಂಯೋಜಿಸಿ

## ನಿಯೋಜನೆ ಅವಲೋಕನ

Azure Developer CLI ಹಲವಾರು ನಿಯೋಜನೆ ಆಜ್ಞೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ:
- `azd up` - ಸಂಪೂರ್ಣ ವರ್ಕ್‌ಫ್ಲೋ (ಪ್ರೊವಿಷನ್ + ನಿಯೋಜನೆ)
- `azd provision` - ಕೇವಲ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸಿ/ಅಪ್ಡೇಟ್ ಮಾಡಿ
- `azd deploy` - ಕೇವಲ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ
- `azd package` - ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಿ ಮತ್ತು ಪ್ಯಾಕೇಜ್ ಮಾಡಿ

## ಮೂಲ ನಿಯೋಜನೆ ವರ್ಕ್‌ಫ್ಲೋ

### ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ (azd up)
ಹೊಸ ಪ್ರಾಜೆಕ್ಟ್‌ಗಳಿಗಾಗಿ ಅತ್ಯಂತ ಸಾಮಾನ್ಯ ವರ್ಕ್‌ಫ್ಲೋ:
```bash
# ಎಲ್ಲವನ್ನೂ ಆರಂಭದಿಂದ ನಿಯೋಜಿಸಿ
azd up

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರದೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up --environment production

# ಕಸ್ಟಮ್ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ಮೂಲಸೌಕರ್ಯ-ಮಾತ್ರ ನಿಯೋಜನೆ
ನೀವು ಕೇವಲ Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಅಪ್ಡೇಟ್ ಮಾಡುವಾಗ:
```bash
# ಮೂಲಸೌಕರ್ಯವನ್ನು ಒದಗಿಸುವುದು/ನವೀಕರಿಸುವುದು
azd provision

# ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವದೃಶ್ಯವಾಗಿ ನೋಡುವುದಕ್ಕಾಗಿ ಡ್ರೈ-ರನ್ ಜೊತೆಗೆ ಒದಗಿಸುವುದು
azd provision --preview

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಗಳನ್ನು ಒದಗಿಸುವುದು
azd provision --service database
```

### ಕೋಡ್-ಮಾತ್ರ ನಿಯೋಜನೆ
ವೇಗದ ಅಪ್ಲಿಕೇಶನ್ ಅಪ್ಡೇಟ್ಗಾಗಿ:
```bash
# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd deploy

# ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:
# ಸೇವೆಗಳನ್ನು ನಿಯೋಜಲಾಗುತ್ತಿದೆ (azd deploy)
# - web: ನಿಯೋಜಿಸಲಾಗುತ್ತಿದೆ... ಪೂರ್ಣವಾಗಿದೆ
# - api: ನಿಯೋಜಲಾಗುತ್ತಿದೆ... ಪೂರ್ಣವಾಗಿದೆ
# ಯಶಸ್ವಿ: ನಿಮ್ಮ ನಿಯೋಜನೆ 2 ನಿಮಿಷ 15 ಸೆಕೆಂಡುಗಳಲ್ಲಿ ಪೂರ್ಣಗೊಂಡಿತು

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --service web
azd deploy --service api

# ಕಸ್ಟಮ್ ನಿರ್ಮಾಣ ಆರ್ಗ್ಯುಮೆಂಟ್‌ಗಳೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd deploy --service api --build-arg NODE_ENV=production

# ನಿಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json | jq '.services'
```

### ✅ ನಿಯೋಜನೆ ಪರಿಶೀಲನೆ

ಯಾವುದೇ ನಿಯೋಜನೆಯಾದ ನಂತರ, ಯಶಸ್ಸನ್ನು ಪರಿಶೀಲಿಸಿ:

```bash
# ಎಲ್ಲಾ ಸೇವೆಗಳು ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
azd show

# ಹೆಲ್ತ್ ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ದೋಷಗಳಿಗಾಗಿ ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ (ಡೀಫಾಲ್ಟ್‌ವಾಗಿ ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯುತ್ತದೆ)
azd monitor --logs
```

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- ✅ ಎಲ್ಲಾ ಸೇವೆಗಳು "Running" ಸ್ಥಿತಿಯನ್ನು ತೋರಿಸುತ್ತಿವೆ
- ✅ ಹೀಲ್‌ತ್ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳು HTTP 200 ಅನ್ನು 반환ಿಸುತ್ತಿವೆ
- ✅ ಕಳೆದ 5 ನಿಮಿಷಗಳಲ್ಲಿ ಯಾವುದೇ ದೋಷ ಲಾಗ್‌ಗಳು ಇಲ್ಲ
- ✅ ಅಪ್ಲಿಕೇಶನ್ ಪರೀಕ್ಷಾ ವಿನಂತಿಗಳಿಗೆ ಪ್ರತಿಕ್ರಿಯಿಸುತ್ತದೆ

## 🏗️ ನಿಯೋಜನೆ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### ಪರ್ಯಾಯ 1: ಪೂರ್ವ-ಪ್ರೊವಿಷನ್ ಹುಕ್‌ಗಳು
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

### ಪರ್ಯಾಯ 2: ಮೂಲಸೌಕರ್ಯ ಪ್ರೊವಿಷನಿಂಗ್
- ಮೂಲಸೌಕರ್ಯ ಟೆಂಪ್ಲೇಟ್ಗಳನ್ನು ಓದುತ್ತದೆ (Bicep/Terraform)
- Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚಿಸುತ್ತದೆ ಅಥವಾ ಅಪ್ಡೇಟ್ ಮಾಡುತ್ತದೆ
- ನೆಟ್ವರ್ಕಿಂಗ್ ಮತ್ತು ಭದ್ರತೆಯನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡುತ್ತದೆ
- ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಲಾಗಿಂಗ್‌ನ್ನು ಸ್ಥಾಪಿಸುತ್ತದೆ

### ಪರ್ಯಾಯ 3: ಪೋಸ್ಟ್-ಪ್ರೊವಿಷನ್ ಹುಕ್‌ಗಳು
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

### ಪರ್ಯಾಯ 4: ಅಪ್ಲಿಕೇಶನ್ ಪ್ಯಾಕೇಜಿಂಗ್
- ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿರ್ಮಿಸಲಾಗುತ್ತದೆ
- ನಿಯೋಜನೆ ಆರ್ಚಿಫ್ಯಾಕ್ಟ್ಗಳು ರಚಿಸಲಾಗುತ್ತವೆ
- ಗುರಿ ಪ್ಲಾಟ್‌ಫಾರ್ಮ್‌ಗಾಗಿ ಪ್ಯಾಕೇಜ್ ಮಾಡಲಾಗುತ್ತದೆ (ಕಾಂಟೈನರ್‌ಗಳು, ZIP ಫೈಲ್‌ಗಳು, ಇತ್ಯಾದಿ)

### ಪರ್ಯಾಯ 5: ಪೂರ್ವ-ನಿಯೋಜನೆ ಹುಕ್‌ಗಳು
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

### ಪರ್ಯಾಯ 6: ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆ
- ಪ್ಯಾಕೇಜ್ ಮಾಡಿದ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು Azure ಸೇವೆಗಳಿಗೆ ನಿಯೋಜಿಸುತ್ತದೆ
- ಕಾನ್ಫಿಗರೇಶನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ಅಪ್ಡೇಟ್ ಮಾಡುತ್ತದೆ
- ಸೇವೆಗಳನ್ನು ಪ್ರಾರಂಭ/ಮರುಪ್ರಾರಂಭ ಮಾಡುತ್ತದೆ

### ಪರ್ಯಾಯ 7: ಪೋಸ್ಟ್-ನಿಯೋಜನೆ ಹುಕ್‌ಗಳು
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

### ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ನಿಯೋಜನೆ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
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

### ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಸಂರಚನೆಗಳು
```bash
# ವಿಕಾಸ ಪರಿಸರ
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರ
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

## 🔧 ಸುಧಾರಿತ ನಿಯೋಜನೆ ದೃಶ್ಯಗಳು

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

### ಬ್ಲೂ-ಗ್ರೀನ್ ನಿಯೋಜನೆಗಳು
```bash
# ನೀಲಿ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new production-blue
azd up --environment production-blue

# ನೀಲಿ ಪರಿಸರವನ್ನು ಪರೀಕ್ಷಿಸಿ
./scripts/test-environment.sh production-blue

# ಟ್ರಾಫಿಕ್ ಅನ್ನು ನೀಲಿಗೆ ಬದಲಿಸಿ (ಹಸ್ತಚಾಲಿತ DNS/ಲೋಡ್ ಬಾಲೆನ್ಸರ್ ನವೀಕರಣ)
./scripts/switch-traffic.sh production-blue

# ಹಸಿರು ಪರಿಸರವನ್ನು ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd env select production-green
azd down --force
```

### ಕ್ಯಾನರಿ ನಿರ್ವಹಣೆ
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

### ಹಂತ-ಆಧಾರಿತ ನಿಯೋಜನೆಗಳು
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

## 🐳 ಕಾಂಟೈನರ್ ನಿಯೋಜನೆಗಳು

### ಕಾಂಟೈನರ್ ಅಪ್ಲಿಕೇಶನ್ ನಿಯೋಜನೆಗಳು
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

### ಬಹು-ಹಂತ Dockerfile ಆಪ್ಟಿಮೈಜೇಶನ್
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

## ⚡ ಕಾರ್ಯಕ್ಷಮತೆಯ ಸುಧಾರಣೆ

### ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ನಿಯೋಜನೆಗಳು
```bash
# ತ್ವರಿತ ಪುನರಾವೃತ್ತಿಗಾಗಿ ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --service web
azd deploy --service api

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd deploy
```

### ಕಟ್ಟಡ ಕ್ಯಾಶಿಂಗ್
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### ಪರಿಣಾಮಕಾರಿಯಾದ ಕೋಡ್ ನಿಯೋಜನೆಗಳು
```bash
# ಕೋಡ್-ಮಾತ್ರ ಬದಲಾವಣೆಗಳಿಗೆ azd deploy (azd up ಅಲ್ಲ) ಬಳಸಿ
# ಇದು ಮೂಲಸೌಕರ್ಯ ಒದಗಿಸುವಿಕೆಯನ್ನು ಬಿಟ್ಟುಬಿಡುತ್ತದೆ ಮತ್ತು ಬಹಳವೇ ವೇಗವಾಗಿದೆ
azd deploy

# ಅತಿ ವೇಗದ ಪುನರಾವೃತ್ತಿಗಾಗಿ ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --service api
```

## 🔍 ನಿಯೋಜನೆ ನಿಗಾ

### ರಿಯಲ್-ಟೈಮ್ ನಿಯೋಜನೆ ನಿಗಾ
```bash
# ನೇರ ಸಮಯದಲ್ಲಿ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ಮೇಲ್ವೀಕ್ಷಿಸಿ
azd monitor --live

# ಅಪ್ಲಿಕೇಶನ್ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show
```

### ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳು
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

### ನಿಯೋಜನೆ ನಂತರದ ಮಾನ್ಯತೆ
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# ಅಪ್ಲಿಕೇಶನ್‌ನ ಆರೋಗ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ
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

## 🔐 ಭದ್ರತಾ ಪರಿಗಣನೆಗಳು

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

### ನೆಟ್‌ವರ್ಕ್ ಭದ್ರತೆ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ಐಡಂಟಿಟಿ ಮತ್ತು ಪ್ರವೇಶ ನಿರ್ವಹಣೆ
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

## 🚨 ರೋಲ್‌ಬ್ಯಾಕ್ ರಣನೀತಿಗಳು

### ದ್ರುತ ರೋಲ್‌ಬ್ಯಾಕ್
```bash
# AZD ಗೆ ಆಂತರಿಕ ರೋಲ್ಬ್ಯಾಕ್ ಸೌಲಭ್ಯವಿಲ್ಲ. ಶಿಫಾರಸು ಮಾಡಿದ ವಿಧಾನಗಳು:

# ಆಯ್ಕೆ 1: Git ನಿಂದ ಪುನಃ ನಿಯೋಜಿಸಿ (ಶಿಫಾರಸು)
git revert HEAD  # ಸಮಸ್ಯೆಯನ್ನು ಉಂಟುಮಾಡಿದ ಕಮಿಟ್ ಅನ್ನು ಹಿಂದಿರುಗಿಸಿ
git push
azd deploy

# ಆಯ್ಕೆ 2: ನಿರ್ದಿಷ್ಟ ಕಮಿಟ್ ಅನ್ನು ಪುನಃ ನಿಯೋಜಿಸಿ
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ಮೂಲಸೌಕರ್ಯ ರೋಲ್‌ಬ್ಯಾಕ್
```bash
# ಅನ್ವಯಿಸುವ ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಮುನ್ನೋಟ ಮಾಡಿ
azd provision --preview

# ಮೂಲಸೌಕರ್ಯ ರೋಲ್ಬ್ಯಾಕ್‌ಗಾಗಿ ಆವೃತ್ತಿ ನಿಯಂತ್ರಣವನ್ನು ಬಳಸಿ:
git revert HEAD  # ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಹಿಂದಕ್ಕೆ ತಿರುಗಿಸಿ
azd provision    # ಹಿಂದಿನ ಮೂಲಸೌಕರ್ಯದ ಸ್ಥಿತಿಯನ್ನು ಅನ್ವಯಿಸಿ
```

### ಡೇಟಾಬೇಸ್ ಮೈಸಿಗ್ರೇಷನ್ ರೋಲ್‌ಬ್ಯಾಕ್
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
# ಪ್ರಸ್ತುತ ನಿಯೋಜನೆಯ ಸ್ಥಿತಿಯನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# Application Insights ಮೂಲಕ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಗಾ ವಹಿಸಿ
azd monitor --overview

# ನೇರ ಸಮಯದ ಮಾಪಕಗಳನ್ನು ವೀಕ್ಷಿಸಿ
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

### 1. ಪರಿಸರ ಸತತತೆ
```bash
# ಸತತ ನಾಮಕರಣವನ್ನು ಬಳಸಿ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ಪರಿಸರಗಳ ಸಮಾನತೆ ಕಾಪಾಡಿ
./scripts/sync-environments.sh
```

### 2. ಮೂಲಸೌಕರ್ಯ ಮಾನ್ಯತೆ
```bash
# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗೆ ಮೊದಲು ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವ ವೀಕ್ಷಣೆ ಮಾಡಿ
azd provision --preview

# ARM/Bicep ಲಿಂಟಿಂಗ್ ಅನ್ನು ಬಳಸಿ
az bicep lint --file infra/main.bicep

# Bicep ವಾಕ್ಯರಚನೆಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
az bicep build --file infra/main.bicep
```

### 3. ಪರೀಕ್ಷೆ ಸಂಯೋಜನೆ
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

### 4. ದಸ್ತಾವೇಜು ಮತ್ತು ಲಾಗಿಂಗ್
```bash
# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ದಾಖಲಿಸಿ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ಮುಂದಿನ ಹಂತಗಳು

- [Provisioning Resources](provisioning.md) - ಮೂಲಸೌಕರ್ಯ ನಿರ್ವಹಣೆಯಲ್ಲಿ ಆಳವಾದ ಅರ್ಥ
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - ನಿಮ್ಮ ನಿಯೋಜನೆ ತಂತ್ರವನ್ನು ಯೋಜಿಸಿ
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - ನಿಯೋಜನೆ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಿ
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - ಉತ್ಪಾದನ-ತಯಾರ ನಿಯೋಜನೆ ತಂತ್ರಗಳು

## 🎯 ಪ್ರಾಯೋಗಿಕ ನಿಯೋಜನೆ ಅಭ್ಯಾಸಗಳು

### ಅಭ್ಯಾಸ 1: ಕ್ರಮೇಣ ನಿಯೋಜನೆ ವರ್ಕ್‌ಫ್ಲೋ (20 ನಿಮಿಷ)
**ಗುರಿ**: ಪೂರ್ಣ ಮತ್ತು ಕ್ರಮೇಣ ನಿಯೋಜನೆಗಳ ನಡುವಿನ ವ್ಯತ್ಯಾಸವನ್ನು ಅಭ್ಯಾಸ ಮಾಡಿ

```bash
# ಆರಂಭಿಕ ನಿಯೋಜನೆ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ಆರಂಭಿಕ ನಿಯೋಜನೆಯ ಸಮಯವನ್ನು ದಾಖಲಿಸಿ
echo "Full deployment: $(date)" > deployment-log.txt

# ಕೋಡ್ ಬದಲಾವಣೆ ಮಾಡಿ
echo "// Updated $(date)" >> src/api/src/server.js

# ಕೇವಲ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ (ವೇಗವಾಗಿ)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# ಸಮಯಗಳನ್ನು ಹೋಲಿಸಿ
cat deployment-log.txt

# ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd down --force --purge
```

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- [ ] ಪೂರ್ಣ ನಿಯೋಜನೆ 5-15 ನಿಮಿಷಗಳಲ್ಲಿ ನಡೆಯುತ್ತದೆ
- [ ] ಕೋಡ್-ಮಾತ್ರ ನಿಯೋಜನೆ 2-5 ನಿಮಿಷಗಳಲ್ಲಿ ನಡೆಯುತ್ತದೆ
- [ ] ಕೋಡ್ ಬದಲಾವಣೆಗಳು ನಿಯೋಜಿತ ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ತೋರಿಸಿವೆ
- [ ] `azd deploy` ಬಳಿಕ ಮೂಲಸೌಕರ್ಯ ಅಪ್ರೇರಣವಾಗಿಲ್ಲ

**ಕಲಿಕೆಯ ಫಲಿತಾಂಶ**: `azd deploy` ಕೋಡ್ ಬದಲಾವಣೆಗಳಿಗಾಗಿ `azd up` ಕ್ಕಿಂತ 50-70% ವೇಗವಾಗಿರುತ್ತದೆ

### ಅಭ್ಯಾಸ 2: ಕಸ್ಟಮ್ ನಿಯೋಜನೆ ಹುಕ್‌ಗಳು (30 ನಿಮಿಷ)
**ಗುರಿ**: ಪೂರ್ವ ಮತ್ತು ಪೋಸ್ಟ್-ನಿಯೋಜನೆ ಸ್ವಯಂಚಾಲಿತತೆಯನ್ನು ಜಾರಿಗೆ ತರಲು

```bash
# ಡಿಪ್ಲಾಯ್ ಮಾಡುವ ಮೊದಲು ಮಾನ್ಯತೆ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ಟೆಸ್ಟ್‌ಗಳು ಉತ್ತೀರ್ಣವಾಗಿದ್ದಾರೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ಕಮಿಟ್ ಮಾಡದ ಬದಲಾವಣೆಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ಡಿಪ್ಲಾಯ್ ನಂತರದ ಸ್ಮೋಕ್ ಟೆಸ್ಟ್ ರಚಿಸಿ
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

# azure.yaml ಗೆ ಹುಕ್‌ಗಳನ್ನು ಸೇರಿಸಿ
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# ಹುಕ್‌ಗಳೊಂದಿಗೆ ನಿಯೋಜನೆಯನ್ನು ಪರೀಕ್ಷಿಸಿ
azd deploy
```

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- [ ] ಪೂರ್ವ-ನಿಯೋಜನೆ ಸ್ಕ್ರಿಪ್ಟ್ ನಿಯೋಜನೆಯ ಮೊದಲು ನಡೆಯುತ್ತದೆ
- [ ] ಟೆಸ್ಟ್‌ಗಳು ವಿಫಲವಾದರೆ ನಿಯೋಜನೆ ರದ್ದಾಗುತ್ತದೆ
- [ ] ಪೋಸ್ಟ್-ನಿಯೋಜನೆ ಸ್ಮೋಕ್ ಟೆಸ್ಟ್ ಆರೋಗ್ಯವನ್ನು ಮಾನ್ಯತೆ ಮಾಡುತ್ತದೆ
- [ ] ಹುಕ್‌ಗಳು ಸರಿಯಾದ ಕ್ರಮದಲ್ಲಿ ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತವೆ

### ಅಭ್ಯಾಸ 3: ಬಹು-ಪರಿಸರ ನಿಯೋಜನೆ ತಂತ್ರ (45 ನಿಮಿಷ)
**ಗುರಿ**: ಹಂತಬದ್ಧ ನಿಯೋಜನೆ ವರ್ಕ್‌ಫ್ಲೋವನ್ನು ಜಾರಿಗೆ ತರಲು (dev → staging → production)

```bash
# ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ಹಂತ 1: ಡೆವ್‌ಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ಹಂತ 2: ಸ್ಟೇಜಿಂಗ್‌ಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
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

# ಪರಿಸರಗಳನ್ನು ರಚಿಸಿ
azd env new dev
azd env new staging
azd env new production

# ಹಂತಗತ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಅನ್ನು ನಡೆಸಿ
./deploy-staged.sh
```

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- [ ] Dev ಪರಿಸರ ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲಾಗುತ್ತದೆ
- [ ] Staging ಪರಿಸರ ಯಶಸ್ವಿಯಾಗಿ ನಿಯೋಜಿಸಲಾಗುತ್ತದೆ
- [ ] ಉತ್ಪಾದನೆಗೆ ಕೈಯೊಪ್ಪು ಅಗತ್ಯವಿದೆ
- [ ] ಎಲ್ಲಾ ಪರಿಸರಗಳಿಗೆ ಕೆಲಸಮಾಡುವ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳಿವೆ
- [ ] ಅಗತ್ಯವಿದ್ದರೆ ರೋಲ್‌ಬ್ಯಾಕ್ ಮಾಡಬಹುದು

### ಅಭ್ಯಾಸ 4: ರೋಲ್‌ಬ್ಯಾಕ್ ತಂತ್ರ (25 ನಿಮಿಷ)
**ಗುರಿ**: Git ಬಳಸಿ ನಿಯೋಜನೆ ರೋಲ್‌ಬ್ಯಾಕ್ ಅನ್ನು ಜಾರಿಗೆ ತರಲು ಮತ್ತು ಪರೀಕ್ಷಿಸಲು

```bash
# v1 ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd env set APP_VERSION "1.0.0"
azd up

# v1 ಕಮಿಟ್ ಹ್ಯಾಷ್ ಅನ್ನು ಉಳಿಸಿ
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ಬ್ರೇಕಿಂಗ್ ಬದಲಾವಣೆಯೊಂದಿಗೆ v2 ಅನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ವಿಫಲತೆಯನ್ನು ಪತ್ತೆಮಾಡಿ ಮತ್ತು ರೋಲ್‌ಬ್ಯಾಕ್ ಮಾಡಿ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ಬಳಸಿ ರೋಲ್‌ಬ್ಯಾಕ್ ಮಾಡಿ
    git revert HEAD --no-edit
    
    # ಪರಿಸರವನ್ನು ರೋಲ್‌ಬ್ಯಾಕ್ ಮಾಡಿ
    azd env set APP_VERSION "1.0.0"
    
    # v1 ಅನ್ನು ಮರುಡಿಪ್ಲಾಯ್ ಮಾಡಿ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**ಯಶಸ್ವಿ ಮಾನದಂಡಗಳು:**
- [ ] ನಿಯೋಜನೆ ವೈಫಲ್ಯಗಳನ್ನು ಪತ್ತೆ ಹಚ್ಚಬಹುದು
- [ ] ರೋಲ್‌ಬ್ಯಾಕ್ ಸ್ಕ್ರಿಪ್ಟ್ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಕಾರ್ಯಗತಗೊಳ್ಳುತ್ತದೆ
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯನಿರ್ವಹಣ ಸ್ಥಿತಿಗೆ ಮರುಳುತ್ತದೆ
- [ ] ರೋಲ್‌ಬ್ಯಾಕ್ ನಂತರ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳು ಪಾಸಾಗಿವೆ

## 📊 ನಿಯೋಜನೆ ಮೆಟ್ರಿಕ್ಸ್ ಟ್ರ್ಯಾಕಿಂಗ್

### ನಿಮ್ಮ ನಿಯೋಜನೆ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ

```bash
# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮೆಟ್ರಿಕ್ಸ್ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ
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

# ಫೈಲ್‌ಗೆ ಲಾಗ್ ಮಾಡಿ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ಇದನ್ನು ಬಳಸಿ
./track-deployment.sh
```

**ನಿಮ್ಮ ಮೆಟ್ರಿಕ್ಸ್ ವಿಶ್ಲೇಷಿಸಿ:**
```bash
# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಇತಿಹಾಸವನ್ನು ವೀಕ್ಷಿಸಿ
cat deployment-metrics.csv

# ಸರಾಸರಿ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸಮಯವನ್ನು ಲೆಕ್ಕಿಸಿ
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ನಾವಿಗೇಶನ್**
- **ಹಿಂದಿನ ಪಾಠ**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](../chapter-01-foundation/first-project.md)
- **ಮುಂದಿನ ಪಾಠ**: [ಸಂಪನ್ಮೂಲಗಳ ಪ್ರೊವಿಷನಿಂಗ್](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ સેવા [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗೆ ಪ್ರಯತ್ನಿಸಿದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ತಪ್ಪುಗಳು ಇರಬಹುದು ಎಂಬುದನ್ನು ದಯವಿಟ್ಟು ಗಮನದಲ್ಲಿರಿಸಿ. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಗಂಭೀರ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಭಾಷಾಂತರವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅರ್ಥವ್ಯತ್ಯಯಗಳು ಅಥವಾ ತಪ್ಪಾದ ವ್ಯಾಖ್ಯಾನಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->