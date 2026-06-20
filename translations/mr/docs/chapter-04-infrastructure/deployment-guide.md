# तैनाती मार्गदर्शक - AZD तैनातींमध्ये प्रावीणता मिळवा

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय 4 - इन्फ्रास्ट्रक्चर as कोड & तैनात करणे
- **⬅️ मागील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)
- **➡️ पुढे**: [संसाधनांचे प्राविजनिंग](provisioning.md)
- **🧩 या अध्यायात देखील**: [तुमचा स्वतःचा टेम्प्लेट तयार करणे](custom-templates.md)
- **🚀 पुढील अध्याय**: [अध्याय 5: मल्टी-एजंट AI सोल्यूशन्स](../../examples/retail-scenario.md)

## परिचय

हा संपूर्ण मार्गदर्शक Azure Developer CLI वापरून अनुप्रयोग तैनात करण्याबाबत तुम्हाला जे काही ज्ञान आवश्यक आहे ते सर्व काही कव्हर करतो, मूलभूत एकाच कमांडच्या तैनातींपासून ते कस्टम हुक्स, अनेक पर्यावरणे आणि CI/CD एकत्रीकरण सह प्रगत उत्पादन परिस्थितीपर्यंत. व्यावहारिक उदाहरणे आणि सर्वोत्तम पद्धतींसह संपूर्ण तैनाती जीवनचक्रात प्रावीणता मिळवा.

## शिकण्याचे उद्दिष्टे

हा मार्गदर्शक पूर्ण केल्यावर, तुम्ही:
- Azure Developer CLI मधील सर्व तैनात कमांड्स आणि वर्कफ्लोजमध्ये प्रावीणता मिळवाल
- प्राविजनिंग पासून मॉनिटरिंग पर्यंत संपूर्ण तैनाती जीवनचक्र समजून घ्याल
- तैनातीपूर्व आणि तैनाती नंतर स्वयंचलितता करण्यासाठी कस्टम तैनात हुक्स लागू कराल
- पर्यावरण-विशिष्ट पॅरामिटर्ससह अनेक पर्यावरणे कॉन्फिगर कराल
- ब्लू-ग्रीन आणि कॅनरी तैनातीसह प्रगत तैनाती धोरणे सेट कराल
- azd तैनातींना CI/CD पाइपलाइन्स आणि DevOps वर्कफ्लोजमध्ये समाकलित कराल

## शिकण्याचे निकाल

पूर्ण केल्यावर, तुम्ही सक्षम असाल:
- सर्व azd तैनात वर्कफ्लोज स्वतंत्रपणे चालवणे आणि समस्यांचे निवारण करणे
- हुक्सचा वापर करून कस्टम तैनात स्वयंचलितता डिझाइन आणि अंमलात आणणे
- योग्य सुरक्षा आणि मॉनिटरिंगसह उत्पादन-सज्ज तैनाती कॉन्फिगर करणे
- गुंतागुंतीच्या मल्टी-पर्यावरण तैनाती परिस्थितीचे व्यवस्थापन करणे
- तैनाती कार्यक्षमता ऑप्टिमायझ करा आणि रोलबॅक धोरणे राबवा
- azd तैनातींचे एंटरप्राइझ DevOps पद्धतींमध्ये समाकलन करणे

## तैनाती आढावा

Azure Developer CLI कडे अनेक तैनात कमांड्स आहेत:
- `azd up` - संपूर्ण वर्कफ्लो (प्राविजन + तैनात करणे)
- `azd provision` - Azure संसाधने तयार/अपडेट करणे फक्त
- `azd deploy` - अनुप्रयोग कोड फक्त तैनात करणे
- `azd package` - अनुप्रयोग बांधणी आणि पॅकेजिंग

## मूलभूत तैनाती वर्कफ्लोज

### संपूर्ण तैनात (azd up)
नव्या प्रोजेक्टसाठी सर्वात सामान्य वर्कफ्लो:
```bash
# सर्व काही नवीनून तैनात करा
azd up

# विशिष्ट पर्यावरणासह तैनात करा
azd up --environment production

# सानुकूल पॅरामीटर्ससह तैनात करा
azd up --parameter location=westus2 --parameter sku=P1v2
```

### फक्त इन्फ्रास्ट्रक्चर तैनात करणे
जेव्हा तुम्हाला केवळ Azure संसाधने अपडेट करायची असतील तेव्हा:
```bash
# पायाभूत सुविधा प्रदान करा/अद्ययावत करा
azd provision

# बदलांची पूर्वदृश्य पाहण्यासाठी ड्राय-रनसह पुरवठा करा
azd provision --preview

# विशिष्ट सेवा पुरवठा करा
azd provision --service database
```

### फक्त कोड तैनात करणे
त्वरित अनुप्रयोग अपडेटसाठी:
```bash
# सर्व सेवा तैनात करा
azd deploy

# अपेक्षित आउटपुट:
# सेवा तैनात करत आहे (azd deploy)
# - वेब: तैनात करत आहे... पूर्ण झाले
# - एपीआय: तैनात करत आहे... पूर्ण झाले
# यशस्वी: तुमचे तैनाती २ मिनिटे १५ सेकंदात पूर्ण झाली

# विशिष्ट सेवा तैनात करा
azd deploy --service web
azd deploy --service api

# सानुकूल बिल्ड आर्ग्युमेंटसह तैनात करा
azd deploy --service api --build-arg NODE_ENV=production

# तैनातीची पडताळणी करा
azd show --output json | jq '.services'
```

### ✅ तैनाती पडताळणी

कोणत्याही तैनाती नंतर, यशस्वीपणा तपासा:

```bash
# सर्व सेवा चालू आहेत का तपासा
azd show

# हेल्थ एंडपॉइंट्सची चाचणी करा
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# त्रुटींसाठी निरीक्षण करा (डिफॉल्टने ब्राउझरमध्ये उघडते)
azd monitor --logs
```

**यशाची निकषे:**
- ✅ सर्व सेवा "रनिंग" स्थितीत आहेत
- ✅ हेल्थ एंडपॉइंट्स HTTP 200 परत करतात
- ✅ मागील ५ मिनिटांत कोणतेही त्रुटी लॉग नाहीत
- ✅ अनुप्रयोग चाचणी विनंत्यांना प्रतिसाद देतो

## 🏗️ तैनात प्रक्रियेचे आकलन

### हुक्समध्ये नवीन आहात? इथे सुरू करा

**हुक** म्हणजे azd हे तैनाती प्रक्रियेतील विशिष्ट टप्प्यावर स्वयंचलित चालवलेले एक कमांड आहे—प्राविजनिंगपूर्वी किंवा नंतर, आणि कोड तैनात करण्यापूर्वी किंवा नंतर. ते तुम्हाला तैनातीभोवती नेहमी असलेल्या लहान कामांमध्ये स्वयंचलितता आणण्यास मदत करतात: डेटाबेसमध्ये बियाणे पेरणे, माइग्रेशन्स चालवणे, ऍसेट्स बांधणे, किंवा लाईव्ह अनुप्रयोगाचे स्मोक-चाचणी करणे.

| हुक | चालतो… | सामान्य वापर |
|------|-------|------------|
| `preprovision` | संसाधने तयार होण्याच्या आधी | पूर्वतयारीची पडताळणी, रजिस्ट्रीमध्ये लॉगिन |
| `postprovision` | संसाधने अस्तित्वात झाल्यानंतर | संसाधने कॉन्फिगर करणे, डेटाबेस सेट करणे |
| `predeploy` | कोड तैनात करण्यापूर्वी | फ्रंट-end ऍसेट बांधणे, युनिट टेस्ट चालवणे |
| `postdeploy` | कोड लाइव्ह झाल्यानंतर | DB माइग्रेशन्स चालवणे, एंडपॉईंटची स्मोक-चाचणी |

हुक्स तुमच्या `azure.yaml` मध्ये राहतात. हे सगळ्यात लहान उदाहरण आहे—जो फक्त तैनाती नंतर एक संदेश प्रिंट करतो:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

बस इतकंच—पुढच्या वेळी `azd up` चालवल्यानंतर तो संदेश आपोआप प्रिंट होतो. तुम्ही फक्त हुक देखील स्वतंत्रपणे चालवू शकता, पूर्ण तैनात न करता, ज्यामुळे चाचणी करणे सोपे होते:

```bash
azd hooks run postdeploy
```

खालील टप्पे खऱ्या जगातील हुक्स दाखवतात (माइग्रेशन्स, चाचण्या, पडताळणी) प्रत्येक टप्प्यासाठी.

### टप्पा 1: प्री-प्राविजन हुक्स
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

### टप्पा 2: इन्फ्रास्ट्रक्चर प्राविजनिंग
- इन्फ्रास्ट्रक्चर टेम्प्लेट्स वाचतो (Bicep/Terraform)
- Azure संसाधने तयार किंवा अपडेट करतो
- नेटवर्किंग आणि सुरक्षा कॉन्फिगर करतो
- मॉनिटरिंग आणि लॉगिंग सेट करतो

### टप्पा 3: पोस्ट-प्राविजन हुक्स
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

### टप्पा 4: अनुप्रयोग पॅकेजिंग
- अनुप्रयोग कोड बांधतो
- तैनात करण्यासाठी आर्टिफॅक्ट्स तयार करतो
- लक्ष्य प्लॅटफॉर्मसाठी पॅकेज करतो (कंटेनर, ZIP फाईल्स इ.)

### टप्पा 5: प्री-डिप्लॉय हुक्स
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

### टप्पा 6: अनुप्रयोग तैनात करणे
- पॅकेज केलेले अनुप्रयोग Azure सेवांवर तैनात करतो
- कॉन्फिगरेशन सेटिंग्ज अपडेट करतो
- सेवा सुरू/रिस्टार्ट करतो

### टप्पा 7: पोस्ट-डिप्लॉय हुक्स
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

### हुक त्रुटी कसे हाताळायच्या

डिफॉल्टप्रमाणे, **जर हुक कमांड नॉन-झीरो कोडने बाहेर पडली तर azd संपूर्ण ऑपरेशन थांबवतो.** हा सहसा तुमचा हवा असलेला परिणाम असतो—मायग्रेशन अयशस्वी झाल्यास तैनाती थांबावी, अपूर्ण अनुप्रयोग पाठवू नये. पण यामुळे हुक्स नीटनेटके लिहिले पाहिजेत.

**1. अयशस्वी घटना जोरात व उद्देशाने करा.** हुक अयशस्वी होतो जेव्हा त्याचा शेवटचा कमांड नॉन-झीरो एग्झिट कोड परत करतो. शेल स्क्रिप्टमध्ये `set -e` जोडा जेणेकरून पहिला अपयशी कमांड आढळल्यावर हुक पुढे silently चालू ठेवत न राहता थांबतो:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. हुक अयशस्वी होऊ दे पण azd थांबू नये.** नॉन-क्रिटिकल स्टेप्ससाठी (ऐच्छिक कॅश वॉर्म-अप, सर्वोत्तम प्रयत्न सूचना) `continueOnError: true` सेट करा. azd अयशस्वीपणा लॉग करते पण पुढे चालू ठेवते:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. पूर्ण चालण्यापूर्वी हुक्स स्वतंत्रपणे चाचणी करा.** `azd up` चालवण्याची गरज नाही—फक्त हुक स्वतंत्रपणे चालवून वेगाने सुधारणा करा:

```bash
azd hooks run predeploy          # फक्त प्रीडिप्लॉय हुक चालवतो
azd hooks run postdeploy --service api
```

**4. OS-विशिष्ट शेल्ससाठी लक्ष ठेवा.** `shell: pwsh` वापरणारा हुक सीआय एजंटसह मशीनवर PowerShell असणे आवश्यक आहे. सर्वाधिक पोर्टेबिलिटीसाठी `shell: sh` वापरा, किंवा दोन्ही `windows` आणि `posix` वेरिएंट द्या:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **डीबगिंग टिप:** `--debug` सह कोणताही azd कमांड चालवा, तेव्हा नेमके हुक कमांड लाइन आणि त्याचा पूर्ण आउटपुट पहा—जेव्हा हुक स्थानिक स्वरूपात काम करतो पण CI मध्ये अयशस्वी होतो तेव्हा अप्रतिम.

## 🎛️ तैनाती कॉन्फिगरेशन

### सेवा-विशिष्ट तैनात सेटिंग्ज
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

### पर्यावरण-विशिष्ट कॉन्फिगरेशन्स
```bash
# विकास पर्यावरण
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# चाचणी पर्यावरण
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# उत्पादन पर्यावरण
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 प्रगत तैनात परिदृश्ये

### मल्टी-सेवा अनुप्रयोग
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

### ब्लू-ग्रीन तैनाती
```bash
# निळे पर्यावरण तयार करा
azd env new production-blue
azd up --environment production-blue

# निळे पर्यावरण तपासा
./scripts/test-environment.sh production-blue

# ट्रॅफिक निळ्याकडे वळवा (मॅन्युअल DNS/लोड बॅलन्सर अपडेट)
./scripts/switch-traffic.sh production-blue

# हिरव्या पर्यावरणाची स्वच्छता करा
azd env select production-green
azd down --force
```

### कॅनरी तैनाती
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

### टप्प्याटप्प्याने तैनाती
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

## 🐳 कंटेनर तैनाती

### कंटेनर अ‍ॅप तैनाती
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

### मल्टी-टप्पा डॉकरेकामध्ये ऑप्टिमायझेशन
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

## ⚡ कार्यक्षमता ऑप्टिमायझेशन

### सेवा-विशिष्ट तैनाती
```bash
# जलद पुनरावृत्तीसाठी विशिष्ट सेवा तैनात करा
azd deploy --service web
azd deploy --service api

# सर्व सेवा तैनात करा
azd deploy
```

### बिल्ड कॅशिंग
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### कार्यक्षम कोड तैनात करणे
```bash
# फक्त कोड बदलांसाठी azd deploy वापरा (azd up नाही)
# हे इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग वगळते आणि खूप जलद आहे
azd deploy

# सर्वात वेगवान पुनरावृत्तींसाठी विशिष्ट सेवा तैनात करा
azd deploy --service api
```

## 🔍 तैनात मॉनिटरिंग

### रिअल-टाइम तैनात मॉनिटरिंग
```bash
# ऍप्लिकेशनची रिअल-टाइममध्ये देखरेख करा
azd monitor --live

# ऍप्लिकेशन लॉग्स पहा
azd monitor --logs

# तैनातीची स्थिती तपासा
azd show
```

### हेल्थ चेक्स
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

### पोस्ट-तैनात पडताळणी
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# अनुप्रयोगाची आरोग्य तपासा
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

## 🔐 सुरक्षा विचार

### सीक्रेट्स व्यवस्थापन
```bash
# गुपिते सुरक्षितपणे संग्रहित करा
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml मध्ये गुपितांचा संदर्भ द्या
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

### नेटवर्क सुरक्षा
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ओळख आणि प्रवेश व्यवस्थापन
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

## 🚨 रोलबॅक धोरणे

### त्वरीत रोलबॅक
```bash
# AZD मध्ये अंगभूत रोलबॅक नाही. शिफारस केलेले उपाय:

# पर्याय 1: Git मधून पुन्हा डिप्लॉय करा (शिफारसीय)
git revert HEAD  # समस्या निर्माण करणारी कमिट पूर्ववत करा
git push
azd deploy

# पर्याय 2: विशिष्ट कमिट पुन्हा डिप्लॉय करा
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### इन्फ्रास्ट्रक्चर रोलबॅक
```bash
# लागू करण्यापूर्वी इन्फ्रास्ट्रक्चर बदलांचे पूर्वावलोकन करा
azd provision --preview

# इन्फ्रास्ट्रक्चर रोलबॅकसाठी, आवृत्ती नियंत्रण वापरा:
git revert HEAD  # इन्फ्रास्ट्रक्चर बदल परत करा
azd provision    # मागील इन्फ्रास्ट्रक्चर स्थिती लागू करा
```

### डेटाबेस माइग्रेशन रोलबॅक
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 तैनात मेट्रिक्स

### तैनात कार्यक्षमता ट्रॅक करा
```bash
# सध्याच्या तैनातीची स्थिती पहा
azd show

# Application Insights सह अनुप्रयोग मॉनिटर करा
azd monitor --overview

# लाइव्ह मेट्रिक्स पहा
azd monitor --live
```

### कस्टम मेट्रिक्स संकलन
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

## 🎯 सर्वोत्तम पद्धती

### 1. पर्यावरण सुसंगती
```bash
# सातत्यपूर्ण नावं वापरा
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# पर्यावरण समतोल राखा
./scripts/sync-environments.sh
```

### 2. इन्फ्रास्ट्रक्चर पडताळणी
```bash
# तैनातीपूर्वी पायाभूत सुविधांतील बदल पूर्वावलोकन करा
azd provision --preview

# ARM/Bicep लिंटिंग वापरा
az bicep lint --file infra/main.bicep

# Bicep सिंटॅक्स सत्यापित करा
az bicep build --file infra/main.bicep
```

### 3. चाचणी समाकलन
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

### 4. दस्तऐवजीकरण आणि लॉगिंग
```bash
# दस्तऐवज तैनाती प्रक्रिया
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## पुढील पावले

- [संसाधनांचे प्राविजनिंग](provisioning.md) - इन्फ्रास्ट्रक्चर व्यवस्थापनाचा सविस्तर अभ्यास
- [तैनातीपूर्व नियोजन](../chapter-06-pre-deployment/capacity-planning.md) - तुमची तैनात धोरणे नियोजित करा
- [सामान्य समस्या](../chapter-07-troubleshooting/common-issues.md) - तैनात समस्या सोडवा
- [सर्वोत्तम पद्धती](../chapter-07-troubleshooting/debugging.md) - उत्पादन-सज्ज तैनाती धोरणे

## 🎯 हाताळणी तैनाती सराव

### सराव 1: वाढत्या तैनाती वर्कफ्लो (20 मिनिटे)
**उद्दिष्ट:** संपूर्ण आणि वाढत्या तैनातींमधील फरकावर प्रभुत्व मिळवा

```bash
# प्रारंभिक वितरण
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# प्रारंभिक वितरण वेळ नोंदवा
echo "Full deployment: $(date)" > deployment-log.txt

# कोड बदल करा
echo "// Updated $(date)" >> src/api/src/server.js

# फक्त कोड वितरित करा (जलद)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# वेळांची तुलना करा
cat deployment-log.txt

# साफसफाई करा
azd down --force --purge
```

**यशाची निकषे:**
- [ ] संपूर्ण तैनाती 5-15 मिनिटे लागते
- [ ] कोड-फक्त तैनाती 2-5 मिनिटे लागते
- [ ] कोड बदल तैनात केलेल्या अनुप्रयोगात प्रतिबिंबित होतात
- [ ] `azd deploy` नंतर इन्फ्रास्ट्रक्चर अपरिवर्तित राहते

**शिकण्याचा निकाल:** कोड बदलांसाठी `azd deploy` `azd up` पेक्षा 50-70% वेगवान आहे

### सराव 2: कस्टम तैनात हुक्स (30 मिनिटे)
**उद्दिष्ट:** प्री आणि पोस्ट-तैनात स्वयंचलितता अंमलात आणा

```bash
# प्री-डिप्लॉय व्हॅलिडेशन स्क्रिप्ट तयार करा
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# चाचण्या पास झाल्या आहेत का तपासा
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# अनकमिट केलेल्या बदलांची तपासणी करा
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# पोस्ट-डिप्लॉय स्मोक टेस्ट तयार करा
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

# azure.yaml मध्ये हुक्स जोडा
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# हुक्ससह डिप्लॉयमेंटची चाचणी करा
azd deploy
```

**यशाची निकषे:**
- [ ] प्री-डिप्लॉय स्क्रिप्ट तैनात करण्यापूर्वी चालतो
- [ ] चाचण्या अयशस्वी झाल्यास तैनात थांबते
- [ ] पोस्ट-डिप्लॉय स्मोक चाचणी आरोग्य सत्यापित करते
- [ ] हुक्स योग्य क्रमाने चालतात

### सराव 3: मल्टी-पर्यावरण तैनात धोरण (45 मिनिटे)
**उद्दिष्ट:** टप्प्याटप्प्याने तैनात वर्कफ्लो अंमलात आणा (डेव → स्टेजिंग → प्रॉडक्शन)

```bash
# तैनाती स्क्रिप्ट तयार करा
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# पावलं 1: डेव्हlopment मध्ये तैनाती करा
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# पावलं 2: स्टेजिंग मध्ये तैनाती करा
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# पावलं 3: उत्पादनासाठी मॅन्युअल मंजुरी
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

# वातावरण तयार करा
azd env new dev
azd env new staging
azd env new production

# स्टेज केलेली तैनाती चालवा
./deploy-staged.sh
```

**यशाची निकषे:**
- [ ] डेव्ह पर्यावरण यशस्वीपणे तैनात आहे
- [ ] स्टेजिंग पर्यावरण यशस्वीपणे तैनात आहे
- [ ] उत्पादनासाठी मॅन्युअल मान्यता आवश्यक
- [ ] सर्व पर्यावरणांमध्ये कार्यरत हेल्थ चेक्स आहेत
- [ ] आवश्यक असल्यास रोलबॅक करू शकता

### सराव 4: रोलबॅक धोरण (25 मिनिटे)
**उद्दिष्ट:** Git वापरून तैनात रोलबॅक राबवणे आणि चाचणी करणे

```bash
# v1 तैनात करा
azd env set APP_VERSION "1.0.0"
azd up

# v1 कमिट हॅश जतन करा
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# तोडफोड करणारा बदलासह v2 तैनात करा
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# अपयश ओळखा आणि परत रोलबॅक करा
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git वापरून रोलबॅक करा
    git revert HEAD --no-edit
    
    # पर्यावरण रोलबॅक करा
    azd env set APP_VERSION "1.0.0"
    
    # v1 पुन्हा तैनात करा
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**यशाची निकषे:**
- [ ] तैनाती अपयश ओळखू शकतो
- [ ] रोलबॅक स्क्रिप्ट आपोआप चालतो
- [ ] अनुप्रयोग कार्यरत स्थितीत परत येतो
- [ ] रोलबॅक नंतर हेल्थ चेक्स पास होतात

## 📊 तैनात मेट्रिक्स ट्रॅकिंग

### तुमची तैनात कार्यक्षमता ट्रॅक करा

```bash
# डिप्लॉयमेंट मेट्रिक्स स्क्रिप्ट तयार करा
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

# फाइलमध्ये लॉग करा
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# याचा वापर करा
./track-deployment.sh
```

**तुमचे मेट्रिक्स विश्लेषण करा:**
```bash
# तैनातीचा इतिहास पहा
cat deployment-metrics.csv

# तैनातीचा सरासरी वेळ मोजा
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## अतिरिक्त स्त्रोत

- [Azure Developer CLI तैनात संदर्भ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service तैनात](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps तैनात](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions तैनात](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेव्हिगेशन**
- **मागील धडा**: [तुमचा पहिला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **पुढील धडा**: [संसाधनांचे प्राविजनिंग](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->