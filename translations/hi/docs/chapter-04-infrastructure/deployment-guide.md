# डिप्लॉयमेंट गाइड - AZD डिप्लॉयमेंट्स में महारत

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 4 - इन्फ्रास्ट्रक्चर ऐज़ कोड और परिनियोजन
- **⬅️ पिछला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)
- **➡️ अगला**: [संसाधन प्रोविज़निंग](provisioning.md)
- **🧩 इस अध्याय में भी**: [अपना टेम्पलेट बनाना](custom-templates.md)
- **🚀 अगला अध्याय**: [अध्याय 5: मल्टी-एजेंट AI समाधान](../../examples/retail-scenario.md)

## परिचय

यह व्यापक मार्गदर्शिका Azure Developer CLI का उपयोग करके एप्लिकेशन परिनियोजन के बारे में आपको जानने की सभी बातों को कवर करती है — बुनियादी एक-कमांड डिप्लॉयमेंट से लेकर कस्टम हुक्स, बहु-पर्यावरण और CI/CD एकीकरण के साथ उन्नत प्रोडक्शन परिदृश्यों तक। व्यावहारिक उदाहरणों और सर्वोत्तम प्रथाओं के साथ संपूर्ण डिप्लॉयमेंट जीवनचक्र में महारत हासिल करें।

## सीखने के लक्ष्य

इस मार्गदर्शिका को पूरा करके, आप:
- Azure Developer CLI के सभी डिप्लॉयमेंट कमांड और वर्कफ़्लो में महारत हासिल करेंगे
- प्रोविजनिंग से मॉनिटरिंग तक संपूर्ण डिप्लॉयमेंट जीवनचक्र को समझेंगे
- प्री और पोस्ट-डिप्लॉयमेंट ऑटोमेशन के लिए कस्टम डिप्लॉयमेंट हुक्स लागू करेंगे
- वातावरण-विशिष्ट पैरामीटर के साथ कई वातावरण कॉन्फ़िगर करेंगे
- ब्लू-ग्रीन और कैनेरी जैसी उन्नत डिप्लॉयमेंट रणनीतियों को सेट अप करेंगे
- azd डिप्लॉयमेंट्स को CI/CD पाइपलाइनों और DevOps वर्कफ़्लो के साथ एकीकृत करेंगे

## सीखने के परिणाम

पूरा करने पर, आप सक्षम होंगे:
- सभी azd डिप्लॉयमेंट वर्कफ़्लो को स्वतंत्र रूप से निष्पादित और त्रुटि निवारण करना
- हुक्स का उपयोग करके कस्टम डिप्लॉयमेंट ऑटोमेशन डिज़ाइन और लागू करना
- उचित सुरक्षा और मॉनिटरिंग के साथ प्रोडक्शन-रेडी डिप्लॉयमेंट कॉन्फ़िगर करना
- जटिल बहु-पर्यावरण डिप्लॉयमेंट परिदृश्यों का प्रबंधन करना
- डिप्लॉयमेंट प्रदर्शन का अनुकूलन और रोलबैक रणनीतियाँ लागू करना
- एंटरप्राइज़ DevOps प्रथाओं में azd डिप्लॉयमेंट्स को एकीकृत करना

## डिप्लॉयमेंट का अवलोकन

Azure Developer CLI कई डिप्लॉयमेंट कमांड प्रदान करता है:
- `azd up` - पूर्ण वर्कफ़्लो (प्रोविजन + डिप्लॉय)
- `azd provision` - केवल Azure संसाधन बनाएं/अपडेट करें
- `azd deploy` - केवल एप्लिकेशन कोड डिप्लॉय करें
- `azd package` - एप्लिकेशन बिल्ड और पैकेज करें

## बुनियादी डिप्लॉयमेंट वर्कफ़्लो

### पूर्ण डिप्लॉयमेंट (azd up)
नए प्रोजेक्ट्स के लिए सबसे सामान्य वर्कफ़्लो:
```bash
# शुरू से सब कुछ तैनात करें
azd up

# विशिष्ट वातावरण के साथ तैनात करें
azd up --environment production

# कस्टम पैरामीटरों के साथ तैनात करें
azd up --parameter location=westus2 --parameter sku=P1v2
```

### इन्फ्रास्ट्रक्चर-केवल डिप्लॉयमेंट
जब आपको केवल Azure संसाधनों को अपडेट करने की आवश्यकता हो:
```bash
# बुनियादी ढांचे का प्रावधान/अद्यतन
azd provision

# परिवर्तनों का पूर्वावलोकन करने हेतु ड्राई-रन के साथ प्रावधान
azd provision --preview

# विशिष्ट सेवाओं का प्रावधान
azd provision --service database
```

### केवल कोड डिप्लॉयमेंट
त्वरित एप्लिकेशन अपडेट्स के लिए:
```bash
# सभी सेवाओं को तैनात करें
azd deploy

# अपेक्षित आउटपुट:
# सेवाएँ तैनात की जा रही हैं (azd deploy)
# - web: तैनात किया जा रहा है... हो गया
# - api: तैनात किया जा رہا है... हो गया
# SUCCESS: आपकी तैनाती 2 मिनट 15 सेकंड में पूरी हुई

# किसी विशिष्ट सेवा को तैनात करें
azd deploy --service web
azd deploy --service api

# कस्टम निर्माण तर्कों के साथ तैनात करें
azd deploy --service api --build-arg NODE_ENV=production

# तैनाती सत्यापित करें
azd show --output json | jq '.services'
```

### ✅ डिप्लॉयमेंट सत्यापन

किसी भी डिप्लॉयमेंट के बाद, सफलता सत्यापित करें:

```bash
# सुनिश्चित करें कि सभी सेवाएँ चल रही हैं
azd show

# हेल्थ एंडपॉइंट्स का परीक्षण करें
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# त्रुटियों के लिए निगरानी करें (डिफ़ॉल्ट रूप से ब्राउज़र में खुलता है)
azd monitor --logs
```

**सफलता मानदंड:**
- ✅ सभी सेवाओं में "Running" स्थिति दिखती है
- ✅ हेल्थ एंडपॉइंट HTTP 200 लौटाते हैं
- ✅ पिछले 5 मिनट में कोई त्रुटि लॉग नहीं
- ✅ एप्लिकेशन परीक्षण अनुरोधों का उत्तर देता है

## 🏗️ डिप्लॉयमेंट प्रक्रिया को समझना

### हुक्स में नए हैं? यहाँ से शुरू करें

एक **हुक** एक कमांड है जिसे azd डिप्लॉय प्रक्रिया के एक विशिष्ट क्षण पर स्वतः चलाता है—प्रोविजनिंग से पहले या बाद में, और आपके कोड को डिप्लॉय करने से पहले या बाद में। ये उन छोटे कार्यों को स्वचालित करने देते हैं जो हमेशा किसी डिप्लॉयमेंट के साथ आते हैं: डेटाबेस में बीज डालना, माइग्रेशन्स चलाना, एसेट्स बनाना, या लाइव ऐप का स्मोक-टेस्ट करना।

| Hook | Runs… | Common use |
|------|-------|------------|
| `preprovision` | Before resources are created | Validate prerequisites, log in to a registry |
| `postprovision` | After resources exist | Configure resources, set up the database |
| `predeploy` | Before code is deployed | Build front-end assets, run unit tests |
| `postdeploy` | After code is live | Run DB migrations, smoke-test the endpoint |

हुक्स आपके `azure.yaml` में रहते हैं। यहाँ सबसे छोटा संभव उदाहरण है—यह डिप्लॉयमेंट के बाद सिर्फ एक संदेश प्रिंट करता है:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

बस इतना ही—अगली बार जब आप `azd up` चलाएंगे, संदेश स्वतः प्रिंट होगा। आप एक हुक को अकेले भी चला सकते हैं, बिना पूर्ण डिप्लॉय के, जो परीक्षण के लिए शानदार है:

```bash
azd hooks run postdeploy
```

नीचे के चरण वास्तविक-विश्व हुक्स (माइग्रेशन्स, परीक्षण, सत्यापन) दिखाते हैं जो प्रत्येक चरण के लिए उपयोग होते हैं।

### चरण 1: प्री-प्रोविजन हुक्स
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

### चरण 2: इन्फ्रास्ट्रक्चर प्रोविजनिंग
- इन्फ्रास्ट्रक्चर टेम्पलेट्स (Bicep/Terraform) पढ़ता है
- Azure संसाधन बनाता या अपडेट करता है
- नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
- मॉनिटरिंग और लॉगिंग सेट अप करता है

### चरण 3: पोस्ट-प्रोविजन हुक्स
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

### चरण 4: एप्लिकेशन पैकेजिंग
- एप्लिकेशन कोड को बिल्ड करता है
- डिप्लॉयमेंट आर्टिफैक्ट बनाता है
- लक्षित प्लेटफ़ॉर्म के लिए पैकेज करता है (कंटेनर, ZIP फ़ाइलें, आदि)

### चरण 5: प्री-डिप्लॉय हुक्स
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

### चरण 6: एप्लिकेशन डिप्लॉयमेंट
- पैकेज किए गए एप्लिकेशन को Azure सेवाओं पर डिप्लॉय करता है
- कॉन्फ़िगरेशन सेटिंग्स अपडेट करता है
- सेवाओं को स्टार्ट/रीस्टार्ट करता है

### चरण 7: पोस्ट-डिप्लॉय हुक्स
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

### हुक त्रुटियों को संभालना

डिफ़ॉल्ट रूप से, **यदि कोई हुक कमांड नॉन-ज़ीरो कोड के साथ बाहर निकलता है, तो azd पूरे ऑपरेशन को रोक देता है।** यह आमतौर पर वही चाहिए—एक विफल माइग्रेशन को डिप्लॉय रोक देना चाहिए, न कि एक टूटा हुआ ऐप भेजना। लेकिन इसका अर्थ है कि हुक्स को सावधानी से लिखने की ज़रूरत है।

**1. विफलताओं को ज़ोरदार और इरादतन बनाएं।** एक हुक तभी विफल होता है जब उसकी आखिरी कमांड नॉन-ज़ीरो exit कोड लौटाती है। शेल स्क्रिप्ट्स में, `set -e` जोड़ें ताकि हुक पहली विफल कमांड पर रुक जाए न कि चुपचाप जारी रहे:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. एक हुक को azd रोकने के बिना विफल होने दें।** गैर-आवश्यक चरणों (एक वैकल्पिक कैश वार्म-अप, एक बेस्ट-एफ़र्ट सूचनाआदि) के लिए, `continueOnError: true` सेट करें। azd विफलता को लॉग करता है पर जारी रहता है:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. पूर्ण रन से पहले हुक्स का अलग से परीक्षण करें।** आपको हुक डिबग करने के लिए `azd up` चलाने की ज़रूरत नहीं—इसे अकेले चलाएँ और जल्दी से सुधार करें:

```bash
azd hooks run predeploy          # सिर्फ़ predeploy हुक चलाता है
azd hooks run postdeploy --service api
```

**4. OS-विशिष्ट शेल्स के लिए देखें।** `shell: pwsh` का उपयोग करने वाला हुक उस मशीन पर PowerShell की आवश्यकता रखता है जहाँ यह चलता है (CI एजेंट्स सहित)। सबसे व्यापक पोर्टेबिलिटी के लिए `shell: sh` का उपयोग करें, या दोनों `windows` और `posix` वैरिएंट प्रदान करें:

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

> **डिबगिंग टिप:** किसी भी azd कमांड को `--debug` के साथ चलाएँ ताकि सटीक हुक कमांड लाइन और इसका पूरा आउटपुट दिखे—यह बहुत उपयोगी होता है जब हुक स्थानीय रूप से काम करता है पर CI में विफल होता है।

## 🎛️ डिप्लॉयमेंट कॉन्फ़िगरेशन

### सर्विस-विशिष्ट डिप्लॉयमेंट सेटिंग्स
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

### वातावरण-विशिष्ट कॉन्फ़िगरेशन
```bash
# विकास वातावरण
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# स्टेजिंग वातावरण
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# उत्पादन वातावरण
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 उन्नत डिप्लॉयमेंट परिदृश्य

### मल्टी-सर्विस एप्लिकेशन
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

### ब्लू-ग्रीन डिप्लॉयमेंट्स
```bash
# नीला वातावरण बनाएं
azd env new production-blue
azd up --environment production-blue

# नीले वातावरण का परीक्षण करें
./scripts/test-environment.sh production-blue

# ट्रैफ़िक को नीले वातावरण पर स्विच करें (मैन्युअल DNS/लोड बैलेंसर अपडेट)
./scripts/switch-traffic.sh production-blue

# हरे वातावरण को साफ़ करें
azd env select production-green
azd down --force
```

### कैनेरी डिप्लॉयमेंट्स
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

### स्टेज्ड डिप्लॉयमेंट्स
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

## 🐳 कंटेनर डिप्लॉयमेंट्स

### कंटेनर ऐप डिप्लॉयमेंट्स
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

### मल्टी-स्टेज Dockerfile अनुकूलन
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

## ⚡ प्रदर्शन अनुकूलन

### सर्विस-विशिष्ट डिप्लॉयमेंट्स
```bash
# तेज़ पुनरावर्तन के लिए किसी विशिष्ट सेवा को तैनात करें
azd deploy --service web
azd deploy --service api

# सभी सेवाओं को तैनात करें
azd deploy
```

### बिल्ड कैशिंग
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### कुशल कोड डिप्लॉयमेंट्स
```bash
# केवल कोड-परिवर्तनों के लिए azd deploy (azd up नहीं) का उपयोग करें
# यह इन्फ्रास्ट्रक्चर प्रोविजनिंग को छोड़ देता है और बहुत तेज़ है
azd deploy

# सबसे तेज़ पुनरावृत्ति के लिए किसी विशिष्ट सेवा को तैनात करें
azd deploy --service api
```

## 🔍 डिप्लॉयमेंट मॉनिटरिंग

### रियल-टाइम डिप्लॉयमेंट मॉनिटरिंग
```bash
# वास्तविक समय में एप्लिकेशन की निगरानी करें
azd monitor --live

# एप्लिकेशन लॉग देखें
azd monitor --logs

# तैनाती की स्थिति जांचें
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

### पोस्ट-डिप्लॉयमेंट वैलिडेशन
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# एप्लिकेशन के स्वास्थ्य की जांच करें
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

### सीक्रेट्स प्रबंधन
```bash
# गुप्त जानकारी सुरक्षित रूप से संग्रहीत करें
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml में गुप्त जानकारी का संदर्भ करें
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

### पहचान और एक्सेस प्रबंधन
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

## 🚨 रोलबैक रणनीतियाँ

### त्वरित रोलबैक
```bash
# AZD में बिल्ट-इन रोलबैक नहीं है। अनुशंसित तरीके:

# विकल्प 1: Git से पुनःतैनात करना (अनुशंसित)
git revert HEAD  # समस्या उत्पन्न करने वाले कमिट को पूर्ववत करें
git push
azd deploy

# विकल्प 2: विशिष्ट कमिट को पुनःतैनात करें
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### इन्फ्रास्ट्रक्चर रोलबैक
```bash
# लागू करने से पहले बुनियादी ढांचे में होने वाले परिवर्तनों का पूर्वावलोकन करें
azd provision --preview

# बुनियादी ढांचे को रोलबैक करने के लिए संस्करण नियंत्रण का उपयोग करें:
git revert HEAD  # बुनियादी ढांचे में किए गए परिवर्तनों को पूर्ववत करें
azd provision    # बुनियादी ढांचे की पिछली स्थिति लागू करें
```

### डेटाबेस माइग्रेशन रोलबैक
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 डिप्लॉयमेंट मीट्रिक्स

### डिप्लॉयमेंट प्रदर्शन ट्रैक करें
```bash
# वर्तमान तैनाती की स्थिति देखें
azd show

# Application Insights के साथ एप्लिकेशन की निगरानी करें
azd monitor --overview

# लाइव मेट्रिक्स देखें
azd monitor --live
```

### कस्टम मीट्रिक्स कलेक्शन
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

## 🎯 सर्वोत्तम प्रथाएँ

### 1. वातावरण की संगति
```bash
# सुसंगत नामकरण का उपयोग करें
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# पर्यावरणों में समानता बनाए रखें
./scripts/sync-environments.sh
```

### 2. इन्फ्रास्ट्रक्चर वैलिडेशन
```bash
# डिप्लॉयमेंट से पहले इन्फ्रास्ट्रक्चर परिवर्तनों का पूर्वावलोकन करें
azd provision --preview

# ARM/Bicep लिंटिंग का उपयोग करें
az bicep lint --file infra/main.bicep

# Bicep वाक्यविन्यास को मान्य करें
az bicep build --file infra/main.bicep
```

### 3. परीक्षण एकीकरण
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

### 4. दस्तावेज़ीकरण और लॉगिंग
```bash
# तैनाती प्रक्रियाओं को दस्तावेज़ित करें
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## अगले कदम

- [संसाधन प्रोविज़निंग](provisioning.md) - इन्फ्रास्ट्रक्चर प्रबंधन में गहरा गोता
- [प्री-डिप्लॉयमेंट योजना](../chapter-06-pre-deployment/capacity-planning.md) - अपनी डिप्लॉयमेंट रणनीति योजना बनाएं
- [सामान्य समस्याएँ](../chapter-07-troubleshooting/common-issues.md) - डिप्लॉयमेंट समस्याओं का समाधान करें
- [सर्वोत्तम प्रथाएँ](../chapter-07-troubleshooting/debugging.md) - प्रोडक्शन-रेडी डिप्लॉयमेंट रणनीतियाँ

## 🎯 हैंड्स-ऑन डिप्लॉयमेंट अभ्यास

### अभ्यास 1: इंक्रीमेंटल डिप्लॉयमेंट वर्कफ़्लो (20 मिनट)
**लक्ष्य**: पूर्ण और इंक्रीमेंटल डिप्लॉयमेंट के बीच का अंतर समझें

```bash
# प्रारंभिक परिनियोजन
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# प्रारंभिक परिनियोजन का समय रिकॉर्ड करें
echo "Full deployment: $(date)" > deployment-log.txt

# कोड में परिवर्तन करें
echo "// Updated $(date)" >> src/api/src/server.js

# केवल कोड परिनियोजित करें (तेज़)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# समय की तुलना करें
cat deployment-log.txt

# साफ़ करें
azd down --force --purge
```

**सफलता मानदंड:**
- [ ] पूर्ण डिप्लॉयमेंट में 5-15 मिनट लगते हैं
- [ ] केवल कोड डिप्लॉयमेंट में 2-5 मिनट लगते हैं
- [ ] कोड परिवर्तनों का प्रतिबिंब डिप्लॉय किए गए ऐप में दिखाई देता है
- [ ] `azd deploy` के बाद इन्फ्रास्ट्रक्चर अपरिवर्तित रहता है

**सीखने का परिणाम**: `azd deploy` कोड परिवर्तनों के लिए `azd up` से 50-70% तेज़ होता है

### अभ्यास 2: कस्टम डिप्लॉयमेंट हुक्स (30 मिनट)
**लक्ष्य**: प्री और पोस्ट-डिप्लॉयमेंट ऑटोमेशन लागू करें

```bash
# पूर्व-तैनाती सत्यापन स्क्रिप्ट बनाएं
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# जांचें कि परीक्षण पास हुए हैं या नहीं
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# अनकमिट किए गए परिवर्तनों की जाँच करें
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# तैनाती के बाद स्मोक टेस्ट बनाएं
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

# azure.yaml में हुक्स जोड़ें
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# हुक्स के साथ तैनाती का परीक्षण करें
azd deploy
```

**सफलता मानदंड:**
- [ ] प्री-डिप्लॉय स्क्रिप्ट डिप्लॉयमेंट से पहले चलती है
- [ ] यदि परीक्षण विफल होते हैं तो डिप्लॉयमेंट रद्द हो जाता है
- [ ] पोस्ट-डिप्लॉय स्मोक टेस्ट हेल्थ को वैलिडेट करता है
- [ ] हुक्स सही क्रम में निष्पादित होते हैं

### अभ्यास 3: मल्टी-पर्यावरण डिप्लॉयमेंट रणनीति (45 मिनट)
**लक्ष्य**: स्टेज्ड डिप्लॉयमेंट वर्कफ़्लो लागू करें (dev → staging → production)

```bash
# डिप्लॉयमेंट स्क्रिप्ट बनाएँ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# चरण 1: dev पर डिप्लॉय करें
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# चरण 2: स्टेजिंग पर डिप्लॉय करें
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# चरण 3: प्रोडक्शन के लिए मैनुअल अनुमोदन
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

# एनवायरनमेंट्स बनाएँ
azd env new dev
azd env new staging
azd env new production

# स्टेज्ड डिप्लॉयमेंट चलाएँ
./deploy-staged.sh
```

**सफलता मानदंड:**
- [ ] Dev वातावरण सफलतापूर्वक डिप्लॉय होता है
- [ ] Staging वातावरण सफलतापूर्वक डिप्लॉय होता है
- [ ] प्रोडक्शन के लिए मैनुअल अनुमोदन आवश्यक है
- [ ] सभी वातावरणों में कार्यरत हेल्थ चेक्स हैं
- [ ] आवश्यकता होने पर रोलबैक किया जा सकता है

### अभ्यास 4: रोलबैक रणनीति (25 मिनट)
**लक्ष्य**: Git का उपयोग करके डिप्लॉयमेंट रोलबैक लागू और परीक्षण करें

```bash
# v1 तैनात करें
azd env set APP_VERSION "1.0.0"
azd up

# v1 कमिट हैश सहेजें
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# v2 को ब्रेकिंग परिवर्तन के साथ तैनात करें
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# असफलता का पता लगाएँ और रोलबैक करें
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git का उपयोग करके रोलबैक करें
    git revert HEAD --no-edit
    
    # पर्यावरण को रोलबैक करें
    azd env set APP_VERSION "1.0.0"
    
    # v1 को पुनः तैनात करें
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**सफलता मानदंड:**
- [ ] डिप्लॉयमेंट विफलताओं का पता लगा सकते हैं
- [ ] रोलबैक स्क्रिप्ट स्वचालित रूप से निष्पादित होती है
- [ ] एप्लिकेशन कार्यरत स्थिति में लौट आता है
- [ ] रोलबैक के बाद हेल्थ चेक्स पास होते हैं

## 📊 डिप्लॉयमेंट मीट्रिक्स ट्रैक करना

### अपने डिप्लॉयमेंट प्रदर्शन को ट्रैक करें

```bash
# तैनाती मेट्रिक्स स्क्रिप्ट बनाएं
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

# लॉग को फ़ाइल में लिखें
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# इसे उपयोग करें
./track-deployment.sh
```

**अपने मीट्रिक्स का विश्लेषण करें:**
```bash
# परिनियोजन इतिहास देखें
cat deployment-metrics.csv

# औसत परिनियोजन समय की गणना करें
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## अतिरिक्त संसाधन

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेविगेशन**
- **पिछला पाठ**: [आपका पहला प्रोजेक्ट](../chapter-01-foundation/first-project.md)
- **अगला पाठ**: [संसाधन प्रोविज़निंग](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->