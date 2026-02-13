# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮಾರ್ಗದರ್ಶಿ - AZD ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳಲ್ಲಿ ಪರಿಣತಿ

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 ಕೋರ್ಸ್ ಹೋಮ್**: [ಆರಂಭಿಕರಿಗೆ AZD](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: Chapter 4 - ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಅನ್ನು ಕೋಡ್ ಆಗಿ & ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್
- **⬅️ Previous Chapter**: [ಅಧ್ಯಾಯ 3: ಸಂರಚನೆ](../chapter-03-configuration/configuration.md)
- **➡️ Next**: [ಸಂಪನ್ಮೂಲಗಳ ನಿಯೋಜನೆ](provisioning.md)
- **🚀 Next Chapter**: [ಅಧ್ಯಾಯ 5: ಬಹು-ಏಜೆಂಟ್ AI ಪರಿಹಾರಗಳು](../../examples/retail-scenario.md)

## ಪರಿಚಯ

ಈ## ನಿಯೋಜನೆ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದೇ ಸಂಪೂರ್ಣ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI ಬಳಸಿ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿಯೋಜಿಸುವ ಬಗ್ಗೆ ಮೂಲಭೂತ ಏಕ-ಕಮಾಂಡ್ ನಿಯೋಜನೆಗಳಿಂದ ಉನ್ನತ ಉತ್ಪಾದನಾ ದೃಶ್ಯಗಳವರೆಗೆ, ಕಸ್ಟಮ್ ಹುಕ್‌ಗಳು, ಬಹು ಪರಿಸರಗಳು ಮತ್ತು CI/CD ಏಕೀಕರಣವುಳ್ಳವರೆಗೆ ಅವಶ್ಯಕವಾದ ಎಲ್ಲವನ್ನೂ ಒಳಗೊಂಡಿದೆ. ಪ್ರಾಯೋಗಿಕ ಉದಾಹರಣೆಗಳು ಮತ್ತು ಉತ್ತಮ ಅಭ್ಯಾಸಗಳೊಂದಿಗೆ ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ ಜೀವನಚಕ್ರವನ್ನು ನಿಭಾಯಿಸಿಕೊಳ್ಳಿ.

## ಕಲಿಕೆಯ ಗುರಿಗಳು

ಈ ಮಾರ್ಗದರ್ಶಿಯನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದರೆ, ನೀವು:
- Azure Developer CLI ನ ಎಲ್ಲಾ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಆಜ್ಞೆಗಳು ಮತ್ತು ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ನಿಖರವಾಗಿ ತಿಳಿದುಕೊಳ್ಳುವುದು
- Provisioning ರಿಂದ ಮಾನిటರಿಂಗ್ ತನಕ ಸಂಪೂರ್ಣ ನಿಯೋಜನೆ ಜೀವನಚಕ್ರವನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- ಪ್ರಿ ಮತ್ತು ಪೋಸ್ಟ್-ಡೆಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ವಯಂಚಾಲನೆಗಾಗಿ ಕಸ್ಟಮ್ ಹುಕ್‌ಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು
- ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳೊಂದಿಗೆ ಬಹು ಪರಿಸರಗಳನ್ನು ಸಂರಚಿಸುವುದು
- ಬ್ಲೂ-ಗ್ರೀನ್ ಮತ್ತು ಕ್ಯಾನರಿ ಡೆಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳನ್ನು ಒಳಗೊಂಡ ಸುಧಾರಿತ ನಿಯೋಜನೆ ತಂತ್ರಗಳನ್ನು ಸ್ಥಾಪಿಸುವುದು
- azd ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳನ್ನು CI/CD ಪೈಪ್‌ಲೈನ್‌ಗಳು ಮತ್ತು DevOps ಕಾರ್ಯಪ್ರವಾಹಗಳೊಂದಿಗೆ ಏಕೀಕರಿಸುವುದು

## ಕಲಿಕೆ ಫಲಿತಾಂಶಗಳು

ಸಂಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ನಿರ್ವಹಿಸಬಲ್ಲಿರಿ:
- ಎಲ್ಲಾ `azd` ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾರ್ಯಪ್ರವಾಹಗಳನ್ನು ಸ್ವತಂತ್ರವಾಗಿ ನಿರ್ವಹಿಸಿ ಸಮಸ್ಯೆ ಪರಿಹರಿಸು
- ಹುಕ್‌ಗಳನ್ನು ಬಳಸಿ ಕಸ್ಟಮ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ವಯಂಚಾಲನೆಯನ್ನು ವಿನ್ಯಾಸಗೊಳಿಸಿ ಮತ್ತು ಅನುಷ್ಠಾನಗೊಳಿಸು
- ಸೂಕ್ತ ಸುರಕ್ಷತೆ ಮತ್ತು ಮಾನಿಟರಿಂಗ್‌ನೊಂದಿಗೆ ಉತ್ಪಾದನೆ-ಸಿದ್ಧ ನಿಯೋಜನೆಗಳನ್ನು ಕಾನ್ಫಿಗರ್‌ ಮಾಡು
- ಸಂಕೀರ್ಣ ಬಹು-ಪರಿಸರ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ದೃಶ್ಯಗಳನ್ನು ನಿರ್ವಹಿಸು
- ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು tốiಮೈಜ್ ಮಾಡಿ ಮತ್ತು ರೋಲ್ಬ್ಯಾಕ್ ತಂತ್ರಗಳನ್ನು ಅನ್ವಯಿಸು
- ಎಂಟರ್ಪ್ರೈಸ್ DevOps ಅಭ್ಯಾಸಗಳಿಗೆ azd ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳನ್ನು ಏಕೀಕರಿಸು

## ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಅವಲೋಕನ

Azure Developer CLI ಕೆಲವು ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಆಜ್ಞೆಗಳನ್ನು ಒದಗಿಸುತ್ತದೆ:
- `azd up` - ಪೂರ್ಣ ಕಾರ್ಯಪ್ರವಾಹ (provision + deploy)
- `azd provision` - Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಮಾತ್ರ ಸೃಷ್ಟಿಸುವುದು/ನವೀಕರಿಸುವುದು
- `azd deploy` - ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ಮಾತ್ರ ಡಿಪ್ಲಾಯ್ ಮಾಡುವುದು
- `azd package` - ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು ನಿರ್ಮಿಸಿ ಮತ್ತು ಪ್ಯಾಕೇಜ್ ಮಾಡುವುದು

## ಮೂಲ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾರ್ಯಪ್ರವಾಹಗಳು

### ಪೂರ್ಣ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ (azd up)
The most common workflow for new projects:
```bash
# ಎಲ್ಲವನ್ನೂ ಆರಂಭದಿಂದ ನಿಯೋಜಿಸಿ
azd up

# ನಿರ್ದಿಷ್ಟ ಪರಿಸರದೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up --environment production

# ಕಸ್ಟಮ್ ಪ್ಯಾರಾಮೀಟರ್‌ಗಳೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್-ಮಾತ್ರ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್
When you only need to update Azure resources:
```bash
# ಮೂಲಭೂತ ಸೌಕರ್ಯವನ್ನು ಒದಗಿಸುವ/ನವೀಕರಿಸುವ
azd provision

# ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವದೃಶ್ಯಗೊಳಿಸಲು ಡ್ರೈ-ರನ್ ಬಳಸಿ ನಿಗದಿಪಡಿಸುವ
azd provision --preview

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಗಳನ್ನು ಒದಗಿಸುವ
azd provision --service database
```

### ಕೋಡ್-ಮಾತ್ರ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್
For quick application updates:
```bash
# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd deploy

# ನಿರೀಕ್ಷಿತ ಔಟ್‌ಪುಟ್:
# ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಲಾಗುತ್ತಿದೆ (azd deploy)
# - web: ನಿಯೋಜಿಸಲಾಗುತ್ತಿದೆ... ಮುಗಿಯಿತು
# - api: ನಿಯೋಜಿಸಲಾಗುತ್ತಿದೆ... ಮುಗಿಯಿತು
# ಯಶಸ್ಸು: ನಿಮ್ಮ ನಿಯೋಜನೆ 2 ನಿಮಿಷ 15 ಸೆಕೆಂಡುಗಳಲ್ಲಿ ಪೂರ್ಣಗೊಂಡಿತು

# ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --service web
azd deploy --service api

# ಕಸ್ಟಮ್ ನಿರ್ಮಾಣ ಆರ್ಗ್ಯುಮೆಂಟ್‌ಗಳೊಂದಿಗೆ ನಿಯೋಜಿಸಿ
azd deploy --service api --build-arg NODE_ENV=production

# ನಿಯೋಜನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show --output json | jq '.services'
```

### ✅ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಪರಿಶೀಲನೆ

ಯಾವುದೇ ನಿಯೋಜನೆಯ ನಂತರ, ಯಶಸ್ಸನ್ನು ಪರಿಶೀಲಿಸಿ:

```bash
# ಎಲ್ಲಾ ಸೇವೆಗಳು ಚಲಿಸುತ್ತಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
azd show

# ಆರೋಗ್ಯ ಎಂಡ್‌ಪಾಯಿಂಟ್‌ಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ದೋಷಗಳನ್ನು ವೀಕ್ಷಿಸಿ (ಡೀಫಾಲ್ಟ್ ಆಗಿ ಬ್ರೌಸರ್‌ನಲ್ಲಿ ತೆರೆಯುತ್ತದೆ)
azd monitor --logs
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- ✅ ಎಲ್ಲಾ ಸೇವೆಗಳು "Running" ಸ್ಥಿತಿಯನ್ನು ತೋರಿಸುತ್ತವೆ
- ✅ Health ಎಂಡ್ಪಾಯಿಂಟ್‌ಗಳು HTTP 200 ಅನ್ನು ಹಿಂತಿರುಗಿಸುತ್ತವೆ
- ✅ ಕೊನೆಯ 5 ನಿಮಿಷಗಳಲ್ಲಿ ದೋಷ ಲಾಗ್‌ಗಳು ಇಲ್ಲ
- ✅ ಅಪ್ಲಿಕೇಶನ್ ಪರೀಕ್ಷಾ ವಿನಂತಿಗಳಿಗೆ ಪ್ರತಿಕ್ರಿಯಿಸುತ್ತದೆ

## 🏗️ ನಿಯೋಜನೆ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

### ಹಂತ 1: ಪ್ರೀ-ಪ್ರೊವಿಷನ್ ಹುಕ್‌ಗಳು
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

### ಹಂತ 2: ಮೂಲಸೌಕರ್ಯ ಪ್ರೊವಿಷನಿಂಗ್
- ಇನ್‌ಫ್ರಾಸ್ಟ್ರಕ್ಚರ್ ಟೇಂಪ್ಲೇಟುಗಳನ್ನು ಓದುತ್ತದೆ (Bicep/Terraform)
- Azure ಸಂಪನ್ಮೂಲಗಳನ್ನು ಸೃಷ್ಟಿಸುತ್ತದೆ ಅಥವಾ ನವೀಕರಿಸುತ್ತದೆ
- ನೆಟ್‌ವರ್ಕಿಂಗ್ ಮತ್ತು ಸುರಕ್ಷತೆಯನ್ನು ಕಾನ್ಫಿಗರ್ ಮಾಡುತ್ತದೆ
- ಮಾನಿಟರಿಂಗ್ ಮತ್ತು ಲಾಗಿಂಗ್ ಅನ್ನು ಸೆಟ್ ಅಪ್ ಮಾಡುತ್ತದೆ

### ಹಂತ 3: ಪೋಸ್ಟ್-ಪ್ರೊವಿಷನ್ ಹುಕ್‌ಗಳು
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
- ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ ಅನ್ನು ನಿರ್ಮಿಸುತ್ತದೆ
- ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಲೆಕಗಳನ್ನು ಸೃಷ್ಟಿಸುತ್ತದೆ
- ಗುರಿ ಪ್ಲ್ಯಾಟ್‌ಫಾರ್ಮ್‌ಗಾಗಿ ಪ್ಯಾಕೇಜ್ ಮಾಡುತ್ತದೆ (ಕಂಟೈನರ್‌ಗಳು, ZIP ಕಡತಗಳು, ಇತ್ಯಾದಿ)

### ಹಂತ 5: ಪ್ರೀ-ಡೆಪ್ಲಾಯ್ ಹುಕ್‌ಗಳು
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

### ಹಂತ 6: ಅಪ್ಲಿಕೇಶನ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್
- ಪ್ಯಾಕೇಜ್ ಮಾಡಿದ ಅಪ್ಲಿಕೇಶನ್‌ಗಳನ್ನು Azure ಸೇವೆಗಳಿಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡುತ್ತದೆ
- ಕಾನ್ಫಿಗರೇಶನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ನವೀಕರಿಸುತ್ತದೆ
- ಸೇವೆಗಳನ್ನು ಪ್ರಾರಂಭಿಸುತ್ತದೆ/ಮತ್ತೆ ಆರಂಭಿಸುತ್ತದೆ

### ಹಂತ 7: ಪೋಸ್ಟ್-ಡೆಪ್ಲಾಯ್ ಹುಕ್‌ಗಳು
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

## 🎛️ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸಂರಚನೆ

### ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸೆಟ್ಟಿಂಗ್ಸ್
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

### ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಕಾನ್ಫಿಗರೇಶನ್ಗಳು
```bash
# ಅಭಿವೃದ್ಧಿ ಪರಿಸರ
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

## 🔧 ಸುಧಾರಿತ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ದೃಶ್ಯಗಳು

### ಬಹು-ಸೇವಾ ಅಪ್ಲಿಕೇಶನ్లు
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

### ಬ್ಲೂ-ಗ್ರೀನ್ ಡೆಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು
```bash
# ನೀಲಿ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new production-blue
azd up --environment production-blue

# ನೀಲಿ ಪರಿಸರವನ್ನು ಪರೀಕ್ಷಿಸಿ
./scripts/test-environment.sh production-blue

# ಟ್ರಾಫಿಕನ್ನು ನೀಲಿಗೆ ಬದಲಿಸಿ (ಹಸ್ತಚಾಲಿತ DNS/ಲೋಡ್ ಬ್ಯಾಲನ್ಸರ್ ನವೀಕರಣ)
./scripts/switch-traffic.sh production-blue

# ಹಸಿರು ಪರಿಸರವನ್ನು ತೆರವುಗೊಳಿಸಿ
azd env select production-green
azd down --force
```

### ಕ್ಯಾನರಿ ಡೆಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು
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

### ಹಂತಾರೋಗ್ಯಿತ (Staged) ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು
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

## 🐳 ಕಂಟೇನರ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು

### ಕಂಟೇನರ್ ಅಪ್ಲಿಕೇಶನ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು
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

### ಮಲ್ಟಿ-ಸ್ಟೇಜ್ Dockerfile ಆಪ್ಟಿಮೈಜೆಷನ್
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

## ⚡ ಕಾರ್ಯಕ್ಷಮತೆ ಆಪ್ಟಿಮೈಜೆಷನ್

### ಸೇವಾ-ನಿರ್ದಿಷ್ಟ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು
```bash
# ತ್ವರಿತ ಪುನರಾವರ್ತನೆಗಾಗಿ ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ನಿಯೋಜಿಸಿ
azd deploy --service web
azd deploy --service api

# ಎಲ್ಲಾ ಸೇವೆಗಳನ್ನು ನಿಯೋಜಿಸಿ
azd deploy
```

### ಬಿಲ್ಡ್ ಕ್ಯಾಶಿಂಗ್
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### ಪರಿಣಾಮಕಾರಿ ಕೋಡ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್‌ಗಳು
```bash
# ಕೇವಲ ಕೋಡ್ ಬದಲಾವಣೆಗಳಿಗಾಗಿ azd deploy ಅನ್ನು ಬಳಸಿ (azd up ಅಲ್ಲ)
# ಇದು ಮೂಲಸೌಕರ್ಯ ಒದಗಿಸುವಿಕೆಯನ್ನು ಬಿಟ್ಟುಕೊಳ್ಳುತ್ತದೆ ಮತ್ತು ಬಹಳ ವೇಗವಾಗಿದೆ
azd deploy

# ಅತಿ ವೇಗದ ಪುನರಾವರ್ತನೆಗಾಗಿ ನಿರ್ದಿಷ್ಟ ಸೇವೆಯನ್ನು ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
azd deploy --service api
```

## 🔍 ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮಾನಿಟರಿಂಗ್

### ರಿಯಲ್-ಟೈಮ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮಾನಿಟರಿಂಗ್
```bash
# ಅನ್ವಯವನ್ನು ನೇರ ಸಮಯದಲ್ಲಿ ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡಿ
azd monitor --live

# ಅನ್ವಯದ ಲಾಗ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --logs

# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ
azd show
```

### ಆರೋಗ್ಯ ಪರೀಕ್ಷೆಗಳು
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

### ಪೋಸ್ಟ್-ಡೆಪ್ಲಾಯ್ ಮಾನ್ಯತೆ
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# ಅಪ್ಲಿಕೇಶನ್ ಆರೋಗ್ಯ ಪರಿಶೀಲಿಸಿ
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

## 🔐 ಸುರಕ್ಷತಾ ಪರಿಗಣನೆಗಳು

### ರಹಸ್ಯಗಳ ನಿರ್ವಹಣೆ
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

### ಜಾಲ ಸುರಕ್ಷತೆ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ಗುರುತು 및 ಪ್ರವೇಶ ನಿರ್ವಹಣೆ
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

### ತ್ವರಿತ ರೋಲ್ಬ್ಯಾಕ್
```bash
# AZDಗೆ ಒಳಗೊಂಡಿರುವ ರೋಲ್‌ಬ್ಯಾಕ್ ಸೌಲಭ್ಯವಿಲ್ಲ. ಶಿಫಾರಸು ಮಾಡಲಾದ ವಿಧಾನಗಳು:

# ಆಯ್ಕೆ 1: Git ನಿಂದ ಮತ್ತೆ ನಿಯೋಜಿಸಿ (ಶಿಫಾರಸು)
git revert HEAD  # ಸಮಸ್ಯೆ ಉಂಟುಮಾಡಿದ ಕಮಿಟ್ ಅನ್ನು ಹಿಂತಿರುಗಿಸಿ
git push
azd deploy

# ಆಯ್ಕೆ 2: ನಿರ್ದಿಷ್ಟ ಕಮಿಟ್ ಅನ್ನು ಮತ್ತೆ ನಿಯೋಜಿಸಿ
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ಮೂಲಸೌಕರ್ಯ ರೋಲ್ಬ್ಯಾಕ್
```bash
# ಅನ್ವಯಿಸುವ ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವವೀಕ್ಷಿಸಿ
azd provision --preview

# ಮೂಲಸೌಕರ್ಯ ರೋಲ್‌ಬ್ಯಾಕ್‌ಗಾಗಿ ಆವೃತ್ತಿ ನಿಯಂತ್ರಣವನ್ನು ಬಳಸಿ:
git revert HEAD  # ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಹಿಂತಿರುಗಿಸಿ
azd provision    # ಹಿಂದಿನ ಮೂಲಸೌಕರ್ಯದ ಸ್ಥಿತಿಯನ್ನು ಅನ್ವಯಿಸಿ
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

## 📊 ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮೆಟ್ರಿಕ್ಸ್

### ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ
```bash
# ಪ್ರಸ್ತುತ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸ್ಥಿತಿಯನ್ನು ವೀಕ್ಷಿಸಿ
azd show

# Application Insights ಬಳಸಿ ಅಪ್ಲಿಕೇಶನ್ ಅನ್ನು ನಿಗಾ ವಹಿಸಿ
azd monitor --overview

# ಸಜೀವ ಮಾಪನಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd monitor --live
```

### ಕಸ್ಟಮ್ ಮೆಟ್ರಿಕ್ಸ್ ಸಂಗ್ರಹಣೆ
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

### 1. ಪರಿಸರ ಸ್ಥಿರತೆ
```bash
# ಒಗ್ಗಟ್ಟಾದ ಹೆಸರುಕರಣವನ್ನು ಬಳಸಿ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ಪರಿಸರ ಸಾಮ್ಯತೆಯನ್ನು ಕಾಪಾಡಿ
./scripts/sync-environments.sh
```

### 2. ಮೂಲಸೌಕರ್ಯ ಪರಿಶೀಲನೆ
```bash
# ನಿಯೋಜನೆಗಿಂತ ಮೊದಲು ಮೂಲಸೌಕರ್ಯ ಬದಲಾವಣೆಗಳನ್ನು ಪೂರ್ವದೃಶ್ಯಿಸಿ
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

### 4. ಡಾಕ್ಯುಮೆಂಟೇಶನ್ ಮತ್ತು ಲಾಗಿಂಗ್
```bash
# ಡിപ್ಲಾಯ್‌ಮೆಂಟ್ ಪ್ರಕ್ರಿಯೆಗಳನ್ನು ದಾಖಲೆಗೊಳಿಸಿ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ಮುಂದಿನ ಹಂತಗಳು

- [ಸಂಪನ್ಮೂಲಗಳ ನಿಯೋಜನೆ](provisioning.md) - ಮೂಲಸೌಕರ್ಯ ನಿರ್ವಹಣೆಯ ಬಗ್ಗೆ ತಗ್ಗುಹಚ್ಚು
- [ಪ್ರಿ-ಡೆಪ್ಲಾಯ್ ಯೋಜನೆ](../chapter-06-pre-deployment/capacity-planning.md) - ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ತಂತ್ರವನ್ನು ಯೋಜಿಸಿ
- [ಸಾಮಾನ್ಯ ಸಮಸ್ಯೆಗಳು](../chapter-07-troubleshooting/common-issues.md) - ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸಮಸ್ಯೆಗಳನ್ನು ಪರಿಹರಿಸಿ
- [ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು](../chapter-07-troubleshooting/debugging.md) - ಉತ್ಪಾದನೆ-ಸಿದ್ಧ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ತಂತ್ರಗಳು

## 🎯 ಪ್ರಾಯೋಗಿಕ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಅಭ್ಯಾಸಗಳು

### ಅಭ್ಯಾಸ 1: ಕ್ರಮೇಣ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾರ್ಯಪ್ರವಾಹ (20 ನಿಮಿಷ)
**ಲಕ್ಷ್ಯ**: ಪೂರ್ಣ ಮತ್ತು ಕ್ರಮೇಣ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ಗಳ ನಡುವೆ ಇರುವ ವ್ಯತ್ಯಾಸವನ್ನು ಪರಿಣಯಿಸು

```bash
# ಆರಂಭಿಕ ನಿಯೋಜನೆ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ಆರಂಭಿಕ ನಿಯೋಜನೆಯ ಸಮಯವನ್ನು ದಾಖಲಿಸಿ
echo "Full deployment: $(date)" > deployment-log.txt

# ಕೋಡ್‌ನಲ್ಲಿ ಬದಲಾವಣೆ ಮಾಡಿ
echo "// Updated $(date)" >> src/api/src/server.js

# ಕೇವಲ ಕೋಡ್ ಅನ್ನು ನಿಯೋಜಿಸಿ (ವೇಗವಾಗಿ)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# ಸಮಯಗಳನ್ನು ಹೋಲಿಸಿ
cat deployment-log.txt

# ಸ್ವಚ್ಛಗೊಳಿಸಿ
azd down --force --purge
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಪೂರ್ಣ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ 5-15 ನಿಮಿಷಗಳಲ್ಲಿ ಆಗಬೇಕು
- [ ] ಕೋಡ್-ಮಾತ್ರ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ 2-5 ನಿಮಿಷಗಳಲ್ಲಿ ಆಗಬೇಕು
- [ ] ಕೋಡ್ ಬದಲಾವಣೆಗಳು ನಿಯೋಜಿತ ಅಪ್ಲಿಕೇಶನ್‌ನಲ್ಲಿ ಪ್ರತಿಬಿಂಬಿಸಬೇಕು
- [ ] `azd deploy` ನಂತರ ಮೂಲಸೌಕರ್ಯ ಬದಲಾಗಬಾರದು

**ಕಲಿಕೆಯ ಫಲಿತಾಂಶ**: `azd deploy` ಕೋಡ್ ಬದಲಾವಣೆಗಳಿಗಾಗಿ `azd up` ಹೋಲಿಕೆಯಲ್ಲಿ 50-70% ವೇಗವಾಗಿರುತ್ತದೆ

### ಅಭ್ಯಾಸ 2: ಕಸ್ಟಮ್ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಹುಕ್‌ಗಳು (30 ನಿಮಿಷ)
**ಲಕ್ಷ್ಯ**: ಪ್ರಿ ಮತ್ತು ಪೋಸ್ಟ್-ಡೆಪ್ಲಾಯ್ ಸ್ವಯಂಚಾಲನೆಯನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ

```bash
# ಡೆಪ್ಲಾಯ್ ಮಾಡಲು ಮುನ್ನ ಮಾನ್ಯತೆ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ಟೆಸ್ಟ್‌ಗಳು ಉತ್ತೀರ್ಣವಾಗಿದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಿ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ಕಮಿಟ್ ಆಗದ ಬದಲಾವಣೆಗಳಿಗಾಗಿ ಪರಿಶೀಲಿಸಿ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ಡೆಪ್ಲಾಯ್ ನಂತರ ಸ್ಮೋಕ್ ಟೆಸ್ಟ್ ರಚಿಸಿ
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

# ಹುಕ್‌ಗಳೊಂದಿಗೆ ಡಿಪ್ಲಾಯ್ಮೆಂಟ್ ಅನ್ನು ಪರೀಕ್ಷಿಸಿ
azd deploy
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಪ್ರಿ-ಡೆಪ್ಲಾಯ್ ಸ್ಕ್ರಿಪ್ಟ್ ನಿಯೋಜನೆಗಿಂತ ಮುಂಚೆ ಚಾಲನೆಗೊಳ್ಳಬೇಕು
- [ ] ಪರೀಕ್ಷೆಗಳು ವಿಫಲವಾದರೆ ನಿಯೋಜನೆ ರದ್ದಾಗಬೇಕು
- [ ] ಪೋಸ್ಟ್-ಡೆಪ್ಲಾಯ್ ಸ್ಮೋಕ್ ಟೆಸ್ಟ್ ಆರೋಗ್ಯವನ್ನು ಪರಿಶೀಲಿಸಬೇಕು
- [ ] ಹುಕ್‌ಗಳು ಸರಿಯಾದ ಕ್ರಮದಲ್ಲಿ ನಡವಬೇಕು

### ಅಭ್ಯಾಸ 3: ಬಹು-ಪರಿಸರ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ತಂತ್ರ (45 ನಿಮಿಷ)
**ಲಕ್ಷ್ಯ**: ಹಂತಾನುವಾರದ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾರ್ಯಪ್ರವಾಹ (dev → staging → production) ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ

```bash
# ಡಿಪ್ಲಾಯ್ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ಹಂತ 1: dev ಗೆ ಡಿಪ್ಲಾಯ್ ಮಾಡಿ
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

# ಹಂತಗਤ ನಿಯೋಜನೆಯನ್ನು ನಡೆಸಿ
./deploy-staged.sh
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] Dev ಪರಿಸರ ಯಶಸ್ವಿಯಾಗಿ ಡಿಪ್ಲಾಯ್ ಆಗಿರಬೇಕು
- [ ] Staging ಪರಿಸರ ಯಶಸ್ವಿಯಾಗಿ ಡಿಪ್ಲಾಯ್ ಆಗಿರಬೇಕು
- [ ] ಉತ್ಪಾದನೆಗೆ ಕೈಯಿಂದ ಅಂಗೀಕಾರ ಅಗತ್ಯವಿರಬೇಕು
- [ ] ಎಲ್ಲಾ ಪರಿಸರಗಳಿಗೆ ಕಾರ್ಯನಿರ್ವಹಿಸುವ ಆರೋಗ್ಯ ಪರಿಶೀಲನೆಗಳು ಇರುವವ
- [ ] ಅಗತ್ಯವಿದ್ದರೆ ಹಿಂಜರಿಸಬಹುದಾಗಿರಲಿ

### ಅಭ್ಯಾಸ 4: ರೋಲ್ಬ್ಯಾಕ್ ತಂತ್ರ (25 ನಿಮಿಷ)
**ಲಕ್ಷ್ಯ**: Git ಬಳಸಿ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ರೋಲ್ಬ್ಯಾಕ್ ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಿ ಮತ್ತು ಪರೀಕ್ಷಿಸಿ

```bash
# v1 ಅನ್ನು ನಿಯೋಜಿಸಿ
azd env set APP_VERSION "1.0.0"
azd up

# v1 ಕಮಿಟ್ ಹ್ಯಾಶ್ ಅನ್ನು ಉಳಿಸಿ
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ಭೇದಕಾರಿ ಬದಲಾವಣೆಯೊಂದಿಗೆ v2 ಅನ್ನು ನಿಯೋಜಿಸಿ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ವಿಫಲತೆ ಕಂಡುಹಿಡಿಸಿ ಮತ್ತು ರೋಲ್ಬ್ಯಾಕ್ ಮಾಡಿ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ಬಳಸಿ ರೋಲ್ಬ್ಯಾಕ್ ಮಾಡಿ
    git revert HEAD --no-edit
    
    # ಪರಿಸರವನ್ನು ರೋಲ್ಬ್ಯಾಕ್ ಮಾಡಿ
    azd env set APP_VERSION "1.0.0"
    
    # v1 ಅನ್ನು ಮರುನಿಯೋಜಿಸಿ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**ಯಶಸ್ಸಿನ ಮಾನದಂಡಗಳು:**
- [ ] ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ವೈಫಲ್ಯಗಳನ್ನು ಕಂಡುಹಿಡಿಯಬಲ್ಲದು
- [ ] ರೋಲ್ಬ್ಯಾಕ್ ಸ್ಕ್ರಿಪ್ಟ್ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಕಾರ್ಯನಿರ್ವಹಿಸಬೇಕು
- [ ] ಅಪ್ಲಿಕೇಶನ್ ಕಾರ್ಯನಿರ್ವಹಿಸುತಿರುವ ಸ್ಥಿತಿಗೆ ಮರಳಬೇಕು
- [ ] ರೋಲ್ಬ್ಯಾಕ್ ನಂತರ ಆರೋಗ್ಯ ಪರೀಕ್ಷೆಗಳು ಕಳುಹಿಸಬೇಕು

## 📊 ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮೆಟ್ರಿಕ್ಸ್ ಟ್ರ್ಯಾಕಿಂಗ್

### ನಿಮ್ಮ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಕಾರ್ಯಕ್ಷಮತೆಯನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ

```bash
# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಮಾಪಕಗಳ ಸ್ಕ್ರಿಪ್ಟ್ ರಚಿಸಿ
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

# ಫೈಲಿಗೆ ಲಾಗ್ ಮಾಡಿ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ಅದನ್ನು ಬಳಸಿ
./track-deployment.sh
```

**ನಿಮ್ಮ ಮೆಟ್ರಿಕ್ಸ್‌ಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಿ:**
```bash
# ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಇತಿಹಾಸವನ್ನು ವೀಕ್ಷಿಸಿ
cat deployment-metrics.csv

# ಸರಾಸರಿ ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ಸಮಯವನ್ನು ಲೆಕ್ಕಿಸಿ
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## ಹೆಚ್ಚುವರಿ ಸಂಪನ್ಮೂಲಗಳು

- [Azure Developer CLI ಡಿಪ್ಲಾಯ್‌ಮೆಂಟ್ ರೆಫರೆನ್ಸ್](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service ಡೆಪ್ಲಾಯ್‌ಮೆಂಟ್](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps ಡೆಪ್ಲಾಯ್‌ಮೆಂಟ್](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions ನಿಯೋಜನೆ](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ನ್ಯಾವಿಗೇಶನ್**
- **Previous Lesson**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](../chapter-01-foundation/first-project.md)
- **Next Lesson**: [ಸಂಪನ್ಮೂಲಗಳ ನಿಯೋಜನೆ](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ನಿರಾಕರಣೆ**:
ಈ ದಸ್ತಾವೇಜನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗಾಗಿ ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ತಪ್ಪುಗಳು ಅಥವಾ ಅಸತ್ಯತೆಗಳು ಇರಬಹುದು ಎಂದು ದಯವಿಟ್ಟು ಗಮನದಲ್ಲಿರಲಿ. ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅದರ ಮೂಲ ಭಾಷೆಯಲ್ಲಿ ಪ್ರಾಮಾಣಿಕ ಮತ್ತು ಅಧಿಕೃತ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಮಹತ್ವದ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅಸಮಂಜಸ್ಯತೆಗಳು ಅಥವಾ ತಪ್ಪು ಪ್ರಮಾಣೀಕರಣಗಳಿಗೆ ನಾವು ಹೊಣೆಗಾರರಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->