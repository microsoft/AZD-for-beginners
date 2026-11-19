# परिनियोजन गाइड - AZD परिनियोजनों में महारत हासिल करना

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [शुरुआत के लिए AZD](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 4 - इन्फ्रास्ट्रक्चर ऐज़ कोड और परिनियोजन
- **⬅️ पिछला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)
- **➡️ अगला**: [रिसोर्सेज़ का प्रावधान](provisioning.md)
- **🧩 इस अध्याय में भी**: [अपना स्वयं का टेम्प्लेट लेखन](custom-templates.md)
- **🚀 अगला अध्याय**: [अध्याय 5: मल्टी-एजेंट एआई समाधान](../../examples/retail-scenario.md)

## परिचय

> `azd 1.37.2` के खिलाफ समीक्षा की गई (नवंबर 2026)। कमांड Bash का उपयोग करते हैं; JSON उदाहरणों के लिए `jq` आवश्यक है। स्पष्ट रूप से प्रारंभ किए गए todo अभ्यास को छोड़कर, उन्नत उदाहरण **इंटीग्रेशन फ्रैगमेंट्स** हैं: अपने स्वयं के स्रोत, इन्फ्रास्ट्रक्चर, टेस्ट और स्क्रिप्ट प्रदान करें। इस समीक्षा में कोई Azure डिप्लॉयमेंट निष्पादित नहीं किया गया।

यह व्यापक गाइड Azure Developer CLI का उपयोग करके एप्लिकेशन डिप्लॉय करने के बारे में आपको सब कुछ कवर करता है, सरल एक-कमांड डिप्लॉयमेंट्स से लेकर कस्टम हुक्स, मल्टीपल वातावरण, और CI/CD इंटीग्रेशन के साथ उन्नत प्रोडक्शन परिदृश्यों तक। व्यावहारिक उदाहरणों और सर्वोत्तम प्रथाओं के साथ पूर्ण डिप्लॉयमेंट लाइफसाइकल पर महारत हासिल करें।

## सीखने के लक्ष्य

इस गाइड को पूरा करके, आप:
- Azure Developer CLI के सभी डिप्लॉयमेंट कमांड्स और वर्कफ़्लोज़ में महारत हासिल करेंगे
- प्रोविजनिंग से लेकर मॉनिटरिंग तक पूरा डिप्लॉयमेंट लाइफसाइकल समझेंगे
- प्री और पोस्ट-डिप्लॉयमेंट ऑटोमेशन के लिए कस्टम डिप्लॉयमेंट हुक्स लागू करेंगे
- वातावरण-विशिष्ट पैरामीटर्स के साथ मल्टीपल वातावरण कॉन्फ़िगर करेंगे
- ब्लू-ग्रीन और कैनरी डिप्लॉयमेंट सहित उन्नत डिप्लॉयमेंट रणनीतियाँ सेटअप करेंगे
- azd डिप्लॉयमेंट्स को CI/CD पाइपलाइंस और DevOps वर्कफ़्लोज़ में इंटीग्रेट करेंगे

## सीखने के परिणाम

पूरा करने पर, आप सक्षम होंगे:
- सभी azd डिप्लॉयमेंट वर्कफ़्लोज़ को स्वतंत्र रूप से निष्पादित और समस्या-निवारण करें
- हुक्स का उपयोग करके कस्टम डिप्लॉयमेंट ऑटोमेशन डिज़ाइन और लागू करें
- उचित सुरक्षा और मॉनिटरिंग के साथ प्रोडक्शन-तैयार डिप्लॉयमेंट्स कॉन्फ़िगर करें
- जटिल मल्टी-एनवायरनमेंट डिप्लॉयमेंट परिदृश्यों का प्रबंधन करें
- डिप्लॉयमेंट प्रदर्शन को अनुकूलित करें और रोलबैक रणनीतियाँ लागू करें
- azd डिप्लॉयमेंट्स को एंटरप्राइज़ DevOps प्रथाओं में इंटीग्रेट करें

## डिप्लॉयमेंट अवलोकन

Azure Developer CLI कई डिप्लॉयमेंट कमांड्स प्रदान करता है:
- `azd up` - पूर्ण वर्कफ़्लो (प्रोविजन + डिप्लॉय)
- `azd provision` - केवल Azure संसाधन बनाएँ/अपडेट करें
- `azd deploy` - केवल एप्लिकेशन कोड डिप्लॉय करें
- `azd package` - एप्लिकेशन बिल्ड और पैकेज करें

## मूल डिप्लॉयमेंट वर्कफ़्लोज़

### पूर्ण डिप्लॉयमेंट (azd up)
नए प्रोजेक्ट्स के लिए सबसे सामान्य वर्कफ़्लो:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### केवल इन्फ्रास्ट्रक्चर डिप्लॉयमेंट
जब आपको केवल Azure संसाधनों को अपडेट करना हो:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### केवल कोड डिप्लॉयमेंट
त्वरित एप्लिकेशन अपडेट्स के लिए:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ डिप्लॉयमेंट सत्यापन

किसी भी डिप्लॉयमेंट के बाद, सफलता की जांच करें:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**सफलता के मानदंड:**
- ✅ `azd show` अपेक्षित सेवा लक्ष्यों/URLs को हल करता है
- ✅ वास्तविक एप्लिकेशन मार्गों के अनुरोध अपेक्षित स्थिति और बॉडी वापस करते हैं
- ✅ पिछले 5 मिनटों में कोई त्रुटि लॉग नहीं
- ✅ एप्लिकेशन परीक्षण अनुरोधों का जवाब देता है

## 🏗️ डिप्लॉयमेंट प्रक्रिया की समझ

### हुक्स के लिए नए हैं? यहाँ शुरू करें

एक **हुक** वह कमांड है जिसे azd डिप्लॉय प्रक्रिया में एक विशिष्ट क्षण पर स्वचालित रूप से चलाता है — प्रोविजनिंग से पहले या बाद में, और आपके कोड को डिप्लॉय करने से पहले या बाद में। वे आपको डिप्लॉयमेंट के हमेशा साथ रहने वाले छोटे कार्यों को स्वचालित करने देते हैं: डेटाबेस सीडिंग, माइग्रेशंस चलाना, असेट बनाना, या लाइव ऐप का स्मोक-टेस्ट करना।

| हुक | कब चलता है… | आम उपयोग |
|------|-------|------------|
| `preprovision` | संसाधन बनाए जाने से पहले | पूर्वापेक्षाएँ सत्यापित करें, रजिस्ट्री में लॉगिन करें |
| `postprovision` | संसाधन मौजूद होने के बाद | संसाधनों को कॉन्फ़िगर करें, डेटाबेस सेटअप करें |
| `predeploy` | कोड डिप्लॉय होने से पहले | फ्रंट-एंड असेट बनाएं, यूनिट टेस्ट चलाएं |
| `postdeploy` | कोड लाइव होने के बाद | DB माइग्रेशन चलाएं, एंडपॉइंट का स्मोक-टेस्ट करें |

हुक्स आपके `azure.yaml` में रहते हैं। यहाँ सबसे छोटा संभव उदाहरण है — यह डिप्लॉयमेंट के बाद एक संदेश प्रिंट करता है:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

बस इतना ही — अगली बार जब आप `azd up` चलाएंगे, तो संदेश स्वचालित रूप से प्रिंट होगा। आप हुक को अकेले भी चला सकते हैं, बिना पूर्ण डिप्लॉय के, जो परीक्षण के लिए अच्छा है:

```bash
azd hooks run postdeploy
```

नीचे चरण वास्तविक दुनिया के हुक्स (माइग्रेशन्स, टेस्ट्स, सत्यापन) दिखाते हैं हर चरण के लिए।

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
- इन्फ्रास्ट्रक्चर टेम्प्लेट पढ़ता है (Bicep/Terraform)
- Azure संसाधन बनाता या अपडेट करता है
- नेटवर्किंग और सुरक्षा कॉन्फ़िगर करता है
- मॉनिटरिंग और लॉगिंग सेटअप करता है

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
- एप्लिकेशन कोड बिल्ड करता है
- डिप्लॉयमेंट आर्टिफैक्ट बनाता है
- लक्षित प्लेटफ़ॉर्म के लिए पैकेज करता है (कंटेनर्स, ZIP फाइलें आदि)

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
- पैक किए गए एप्लिकेशन Azure सेवाओं पर डिप्लॉय करता है
- कॉन्फ़िगरेशन सेटिंग्स अपडेट करता है
- सेवाओं को शुरू/रीस्टार्ट करता है

### चरण 7: पोस्ट-डिप्लॉय हुक्स
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### हुक त्रुटियों को संभालना

डिफ़ॉल्ट रूप से, **यदि कोई हुक कमांड गैर-शून्य कोड के साथ बाहर निकलता है, तो azd पूरी प्रक्रिया रोक देता है।** यह आमतौर पर वही होता है जो आप चाहते हैं — असफल माइग्रेशन को डिप्लॉय रोकना चाहिए, न कि एक टूटी हुई ऐप भेजना। लेकिन इसका मतलब है कि हुक्स को सावधानी से लिखा जाना चाहिए।

**1. विफलताओं को जोरदार और इरादतन बनाएं।** हुक तब विफल होता है जब इसका आखिरी कमांड गैर-शून्य निकास कोड लौटाता है। शेल स्क्रिप्ट्स में, जोड़ें `set -e` ताकि हुक पहली असफल कमांड पर रुक जाए, चुपचाप जारी रखने के बजाय:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. हुक को azd को रोके बिना विफल होने की अनुमति दें।** गैर-आवश्यक चरणों के लिए (वैकल्पिक कैश वार्म-अप, उतना ही प्रयास अधिसूचना), सेट करें `continueOnError: true`। azd विफलता लॉग करता है लेकिन जारी रहता है:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. पूर्ण रन से पहले हुक्स का अलग से परीक्षण करें।** आप डिबग के लिए `azd up` नहीं चलाना चाहते—इसे अकेले चलाएं और जल्दी पुनरावृत्ति करें:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. OS-विशिष्ट शेल्स के लिए सावधान रहें।** जो हुक `shell: pwsh` का उपयोग करता है उसे उस मशीन पर PowerShell होना चाहिए जो इसे चलाता है (जिसमें CI एजेंट्स शामिल हैं)। सबसे व्यापक पोर्टेबिलिटी के लिए `shell: sh` का उपयोग करें, या दोनों संस्करण प्रदान करें `windows` और `posix`:

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

> **डिबग टिप:** किसी भी azd कमांड को `--debug` के साथ चलाएं ताकि सही हुक कमांड लाइन और इसका पूरा आउटपुट देखा जा सके — अमूल्य जब हुक स्थानीय रूप से काम करता है लेकिन CI में विफल होता है।

## 🎛️ डिप्लॉयमेंट कॉन्फ़िगरेशन

### सेवा-विशिष्ट डिप्लॉयमेंट सेटिंग्स
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### वातावरण-विशिष्ट कॉन्फ़िगरेशन

ये केवल स्थानीय azd मान हैं। उन्हें स्पष्ट रूप से इन्फ्रास्ट्रक्चर/रनटाइम कॉन्फ़िगरेशन से मैप करें। `NODE_ENV` सामान्यतः `production` है एक डिप्लॉय की गई Node ऐप के लिए, जिसमें स्टेजिंग डिप्लॉयमेंट शामिल है; डिप्लॉयमेंट चरणों को अलग दिखाने के लिए अलग ऐप-विशिष्ट वेरिएबल का उपयोग करें।

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
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

**उदाहरणात्मक संचालन स्केच:** आपको दोनों वातावरण, एक साझा ट्रैफ़िक-रूटिंग लेयर, और नीचे दिए गए दो स्क्रिप्ट प्रदान करने होंगे। azd ट्रैफ़िक स्विच नहीं करता और न ही स्वतः रोलबैक तैयारी जांचता है। स्विच केवल तब करें जब ब्लू ने परीक्षण पूरा कर लिया हो और रोलबैक की आवश्यकता न हो।

```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### कैनरी डिप्लॉयमेंट्स
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

ट्रैफिक विभाजन कंटेनर ऐप्स कॉन्फ़िगरेशन (Bicep या Azure CLI) का हिस्सा है, न कि `azure.yaml` `trafficSplit` संपत्ति। प्रीव्यू/प्रोविजनिंग और बाद के डिप्लॉयमेंट्स को आपके चयनित संशोधन मोड और रूटिंग नियमों को बनाए रखना चाहिए।

### स्टेज्ड डिप्लॉयमेंट्स
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
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
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

कंटेनर ऐप इन्फ्रास्ट्रक्चर में `configuration.secrets`/`secretRef` (या Key Vault संदर्भों) के साथ रनटाइम सीक्रेट्स कॉन्फ़िगर करें और `template.scale` के साथ स्केलिंग करें। सेवा-स्तरीय `secrets` या `scale` संपत्तियाँ `azure.yaml` में न बनाएं।

### मल्टी-स्टेज Dockerfile ऑप्टीमाइज़ेशन
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ प्रदर्शन अनुकूलन

### सेवा-विशिष्ट डिप्लॉयमेंट्स
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### बिल्ड कैशिंग
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

मानक Node वर्कफ़्लो पैकेज स्क्रिप्ट्स का उपयोग करता है; सेवा `prepackage` हुक्स आवश्यक चरण जोड़ सकते हैं। Docker लेयर कैशिंग सेवा बिल्ड कमांड परिभाषित करने से अलग है।

### कुशल कोड डिप्लॉयमेंट्स
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 डिप्लॉयमेंट मॉनिटरिंग

### रियल-टाइम डिप्लॉयमेंट मॉनिटरिंग
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### हेल्थ चेक्स
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

आपकी ऐप को `/health` लागू करनी होगी; इसे azd द्वारा स्वचालित रूप से प्रदान नहीं किया जाता। कोई सामान्य `azure.yaml` `healthCheck` सेवा संपत्ति नहीं है।

### पोस्ट-डिप्लॉयमेंट सत्यापन
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
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
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` अमान्य है। सामान्य पर्यावरण मान स्थानीय प्लेनटेक्स्ट हैं; मान लें कि रीड कमांड उन्हें रिडैक्ट नहीं करते। ऊपर दिए गए कमांड Key Vault संदर्भों को सहेजते हैं, लेकिन आपकी इन्फ्रास्ट्रक्चर/एप्लिकेशन अभी भी सीक्रेट्स का उपभोग करे और रनटाइम पहचान पहुंच प्रदान करे।

### नेटवर्क सुरक्षा
नेटवर्क पैरामीटर्स को Bicep में घोषित और उपभोग करें, और उन्हें `infra/main.parameters.json` में मैप करें। `azure.yaml` में कोई सामान्य `infra.parameters` ओवरले नहीं है। उदाहरण दस्तावेज़ीकरण रेंज `203.0.113.0/24` और `198.51.100.0/24` असली ऑफिस/VPN नेटवर्क नहीं हैं; उन्हें अधिकृत नेटवर्क रेंज से बदलें।

### पहचान और पहुँच प्रबंधन
कंटेनर ऐप के `identity` को Bicep में सक्षम करें और आवश्यक Key Vault डेटा-प्लेन भूमिका को वॉल्ट स्कोप पर सौंपें। नामित Key Vault आधारित सीक्रेट्स और रनटाइम संदर्भों को उस संसाधन में कॉन्फ़िगर करें; `identity` और `keyVault` सामान्य azd सेवा संपत्तियाँ नहीं हैं। देखें [Authentication & Managed Identity](../chapter-03-configuration/authsecurity.md)।

## 🚨 रोलबैक रणनीतियाँ

### त्वरित रोलबैक
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### इन्फ्रास्ट्रक्चर रोलबैक
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### कस्टम मीट्रिक्स संग्रह
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

### 1. पर्यावरण संगति
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. इन्फ्रास्ट्रक्चर सत्यापन
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. परीक्षण इंटीग्रेशन
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## अगले कदम

- [प्रोविजनिंग संसाधन](provisioning.md) - इन्फ्रास्ट्रक्चर प्रबंधन में गहरी जानकारी
- [प्री-डिप्लॉयमेंट योजना](../chapter-06-pre-deployment/capacity-planning.md) - अपनी डिप्लॉयमेंट रणनीति योजना बनाएं
- [सामान्य समस्याएँ](../chapter-07-troubleshooting/common-issues.md) - डिप्लॉयमेंट समस्याओं का समाधान करें
- [सर्वोत्तम प्रथाएँ](../chapter-07-troubleshooting/debugging.md) - प्रोडक्शन-तैयार डिप्लॉयमेंट रणनीतियाँ

## 🎯 हैंड्स-ऑन डिप्लॉयमेंट अभ्यास

### अभ्यास 1: क्रमिक डिप्लॉयमेंट वर्कफ़्लो (20 मिनट)
**लक्ष्य**: पूर्ण और क्रमिक डिप्लॉयमेंट्स के बीच का अंतर समझना

**शुरुआती बिंदु:** Bash, Node.js 22, Git, azd साइन-इन, और डिप्लॉयमेंट अनुमतियों के साथ एक Azure सदस्यता। नए निर्देशिका में चलाएं; बिल योग्य App Service/Cosmos DB संसाधनों की उम्मीद करें। समय क्षेत्र और टेम्प्लेट पर निर्भर करता है।

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**सफलता के मानदंड:**
- [ ] दोनों कमांड्स के लिए समय रिकॉर्ड करें (कोई निश्चित अवधि नहीं है)
- [ ] दोनों कमांड सफलतापूर्वक पूरी हों
- [ ] API कार्यात्मक रहे; केवल टिप्पणी-संपादन दृश्य UI परिवर्तन नहीं है
- [ ] `azd deploy` के बाद इन्फ्रास्ट्रक्चर अपरिवर्तित रहे

**सीखने का परिणाम**: `azd deploy` इन्फ्रास्ट्रक्चर प्रोविजनिंग छोड़ देता है। मापे गए समयों की तुलना करें न कि किसी निश्चित प्रतिशत के स्पीडअप का अनुमान लगाएं।

### अभ्यास 2: कस्टम डिप्लॉयमेंट हुक्स (30 मिनट)
**लक्ष्य**: प्री और पोस्ट-डिप्लॉयमेंट ऑटोमेशन लागू करें

**शुरुआती बिंदु:** ऊपर प्रारंभ किया गया `deployment-practice` प्रोजेक्ट। यदि आपने इसे साफ़ किया है, तो परीक्षण कोड-केवल डिप्लॉयमेंट से पहले फिर से `azd up` चलाएं। नीचे दिए गए सत्यापन में API का वास्तविक बिल्ड स्क्रिप्ट उपयोग होता है, कोई मौजूद नहीं मूल `test:unit` स्क्रिप्ट नहीं। टेम्प्लेट के API टेस्ट में कॉन्फ़िगर किया गया डेटाबेस एक्सेस आवश्यक है; वे अलग-थलग यूनिट टेस्ट नहीं हैं।

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**सफलता के मानदंड:**
- [ ] प्री-डिप्लॉय स्क्रिप्ट डिप्लॉयमेंट से पहले चले
- [ ] बिल्ड सत्यापन विफल होने पर डिप्लॉयमेंट रद्द हो
- [ ] पोस्ट-डिप्लॉय स्मोक टेस्ट हेल्थ वैध करे
- [ ] हुक ठीक क्रम में निष्पादित हों

### अभ्यास 3: मल्टी-एनवायरनमेंट डिप्लॉयमेंट रणनीति (45 मिनट)
**लक्ष्य**: स्टेज्ड डिप्लॉयमेंट वर्कफ़्लो लागू करें (डेव → स्टेजिंग → प्रोडक्शन)

**प्रारंभिक बिंदु:** `jq` के साथ उसी इनिशियलाइज़्ड टूडो प्रोजेक्ट से। नीचे दिए गए वातावरण बनाएं जिनमें वास्तविक सदस्यता/स्थान मान हों (या प्रत्येक में `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` सेट करें) **कोई-प्रम्प्ट वर्कफ़्लो को कॉल करने से पहले।** यह जानबूझकर विफल हो जाता है बजाय कि गुम मानों को बनाएं। केवल डिस्पोजेबल प्रशिक्षण वातावरण का उपयोग करें, वास्तविक उत्पादन सदस्यता का नहीं।

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**सफलता के मानदंड:**
- [ ] देव वातावरण सफलतापूर्वक तैनात हो
- [ ] स्टेजिंग वातावरण सफलतापूर्वक तैनात हो
- [ ] उत्पादन के लिए मैनुअल स्वीकृति आवश्यक हो
- [ ] सभी वातावरणों में काम करने वाले हेल्थ चेक हों
- [ ] आवश्यकता होने पर रोल बैक किया जा सके

### अभ्यास 4: रोलबैक रणनीति (25 मिनट)
**लक्ष्य**: Git का उपयोग करके तैनाती रोलबैक को लागू और परीक्षण करना

**प्रारंभिक बिंदु:** टूडो टेम्पलेट के एक अलग प्रशिक्षण चेकआउट के साथ जिसमें सभी बेसलाइन स्रोत कमिट किए गए हों, एक साफ़ Git वर्किंग ट्री हो, और एक डिस्पोजेबल कॉन्फ़िगर किया हुआ वातावरण हो। कभी भी एक वास्तविक उत्पादन परियोजना में जानबूझकर असफलताएं न डालें। नीचे दिया गया `APP_VERSION` केवल बहीखाता है जब तक कि आप इसे स्पष्ट रूप से ऐप में शामिल न करें।

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**सफलता के मानदंड:**
- [ ] तैनाती की असफलताएं पहचान सके
- [ ] रोलबैक स्क्रिप्ट स्वचालित रूप से चालू हो
- [ ] एप्लिकेशन कार्यशील स्थिति में वापस आए
- [ ] रोलबैक के बाद हेल्थ चेक पास हों

## 📊 तैनाती मीट्रिक्स ट्रैकिंग

### अपने तैनाती प्रदर्शन को ट्रैक करें

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**अपने मीट्रिक्स का विश्लेषण करें:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## अतिरिक्त संसाधन

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेविगेशन**
- **पूर्व पाठ**: [आपकी पहली परियोजना](../chapter-01-foundation/first-project.md)
- **अगला पाठ**: [संसाधनों की प्रोविजनिंग](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->