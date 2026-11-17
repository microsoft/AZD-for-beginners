# वितरण मार्गदर्शक - AZD वितरणांवर प्रभुत्व प्राप्त करणे

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 सध्याचा अध्याय**: अध्याय 4 - इन्फ्रास्ट्रक्चर एज कोड & वितरण
- **⬅️ मागील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)
- **➡️ पुढील**: [संसाधने पुरवठा करणे](provisioning.md)
- **🧩 या अध्यायामध्येही**: [आपले स्वतःचे टेम्पलेट तयार करणे](custom-templates.md)
- **🚀 पुढील अध्याय**: [अध्याय 5: बहु-एजंट AI सोल्युशन्स](../../examples/retail-scenario.md)

## परिचय

> `azd 1.37.2` शी पुनरावलोकन केले (नोव्हेंबर २०२६). आदेश Bash वापरतात; JSON उदाहरणांसाठी `jq` आवश्यक आहे. स्पष्टपणे प्रारंभ केलेल्या todo व्यायामाविषयी वगळता, प्रगत उदाहरणे **इंटीग्रेशन तुकडे** आहेत: स्वतःचा स्रोत, इन्फ्रास्ट्रक्चर, चाचण्या आणि स्क्रिप्ट प्रदान करा. या पुनरावलोकनात कोणतीही Azure वितरणे केली जाणार नाहीत.

हा सर्वसमावेशक मार्गदर्शक Azure Developer CLI वापरून अनुप्रयोग वितरित करण्याबाबत तुम्हाला सर्व काही शिकवतो, सोप्या एक-कमांड वितरणांपासून ते सानुकूल होक्स, बहु-परिसर आणि CI/CD एकात्मिकरणासह प्रगत उत्पादन परिस्थितींपर्यंत. व्यावहारिक उदाहरणे आणि सर्वोत्तम पद्धतींसह पूर्ण वितरण जीवनचक्रात पारंगत व्हा.

## शिकण्याचे उद्दिष्टे

या मार्गदर्शक पूर्ण करून, तुम्ही:
- सर्व Azure Developer CLI वितरण आदेश आणि कार्यप्रवाहे पारंगत व्हाल
- पुरवठ्यापासून निरीक्षणापर्यंतचे पूर्ण वितरण जीवनचक्र समजाल
- पूर्व आणि पश्चात वितरण स्वयंचलनासाठी सानुकूल वितरण होक्स लागू कराल
- प्रत्येक पर्यावरणासाठी विशिष्ट पॅरामीटर्ससह बहु-परिसर संरचित कराल
- निळा-हिरवा (blue-green) आणि केनरी वितरण यांसह प्रगत वितरण धोरणे सेट कराल
- azd वितरणांना CI/CD पाइपलाइन्स आणि DevOps कार्यप्रवाहांशी एकत्र कराल

## शिकण्याची परिणामकारकता

पूर्ण झाल्यानंतर, तुम्ही खालील गोष्टी करू शकाल:
- स्वतंत्रपणे सर्व azd तैनात करण्याच्या कार्यप्रवाहांवर अमल करणे आणि समस्या निवारण करणे
- हुक्स वापरून सानुकूल तैनात स्वयंचलन डिझाइन आणि अमल करणे
- योग्य सुरक्षा आणि देखरेखीसह उत्पादन-तयार तैनाती कॉन्फिगर करणे
- क्लिष्ट मल्टी-पर्यावरण तैनाती परिस्थिती व्यवस्थापित करणे
- तैनाती कामगिरी सुधारित करणे आणि रोलबॅक धोरणे अमलात आणणे
- एंटरप्राइझ डेव्हऑप्स पद्धतींमध्ये azd तैनाती समाकलित करणे

## तैनाती अवलोकन

Azure Developer CLI काही तैनात आदेश प्रदान करते:
- `azd up` - संपूर्ण कार्यप्रवाह (प्राव्हिजन + तैनात)
- `azd provision` - फक्त Azure संसाधने तयार/अपडेट करा
- `azd deploy` - फक्त अनुप्रयोग कोड तैनात करा
- `azd package` - अनुप्रयोग तयार करा आणि पॅकेज करा

## मूलभूत तैनात कार्यप्रवाह

### पूर्ण तैनाती (azd up)
नवीन प्रकल्पांसाठी सर्वात सामान्य कार्यप्रवाह:
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

### फक्त इन्फ्रास्ट्रक्चर तैनाती
जेव्हा तुम्हाला फक्त Azure संसाधने अपडेट करायची असतात:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### फक्त कोड तैनाती
जलद अनुप्रयोग अपडेटसाठी:
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

### ✅ तैनातीची पडताळणी

कोणतीही तैनाती केल्यानंतर, यशस्वी असल्याचे प्रमाणित करा:

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

**यशाच्या निकषा:**
- ✅ `azd show` अपेक्षित सेवा लक्ष्य/URL सोडवते
- ✅ वास्तविक अनुप्रयोग राऊट्सकडे विनंत्या अपेक्षित स्थिती आणि बॉडी परत करतात
- ✅ मागील 5 मिनिटांत कोणतेही त्रुटी लॉग नाहीत
- ✅ अनुप्रयोग चाचणी विनंत्यांना प्रतिसाद देतो

## 🏗️ तैनात प्रक्रियेचे आकलन

### हुक्समध्ये नवीन आहात? येथे सुरुवात करा

**हुक** हा एक कमांड आहे जो azd स्वयंचलितपणे तैनाती प्रक्रियेच्या विशिष्ट वेळी चालवतो—प्राविजनिंगपूर्वी किंवा नंतर, आणि तुमचा कोड तैनात करण्यापूर्वी किंवा नंतर. ते तैनातीच्या भोवती नेहमी असलेल्या लहान कामे स्वयंचलित करण्याची परवानगी देतात: डेटाबेसची सुरुवात करणे, मायग्रेशन्स चालवणे, संसाधने तयार करणे, किंवा लाईव्ह अ‍ॅपची स्मोक-चाचणी करणे.

| हुक | चालतो… | सामान्य वापर |
|------|-------|------------|
| `preprovision` | संसाधने तयार होण्यापूर्वी | अटी पडताळा, रजिस्ट्रीमध्ये लॉगिन करा |
| `postprovision` | संसाधने अस्तित्वात आली की | संसाधने संरचीत करा, डेटाबेस सेटअप करा |
| `predeploy` | कोड तैनात होण्यापूर्वी | फ्रंट-एंड संसाधने तयार करा, युनिट चाचण्या चालवा |
| `postdeploy` | कोड लाईव्ह झाल्यानंतर | डेटाबेस मायग्रेशन्स चालवा, एंडपॉइंटची स्मोक-चाचणी करा |

हुक्स तुमच्या `azure.yaml` मध्ये राहतात. येथे एक छोटा शक्यतोउदाहरण आहे—ते फक्त तैनाती नंतर संदेश छापते:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

एवढेच—पुढील वेळी तुम्ही `azd up` चालविल्यावर, संदेश आपोआपच छापेल. तुम्ही पूर्ण तैनाती न करता एकहूनठेक हुक देखील चालवू शकता, जे चाचणीसाठी छान आहे:

```bash
azd hooks run postdeploy
```

खालील टप्प्यांमध्ये वास्तविक जगातील हुक्स (मायग्रेशन्स, चाचण्या, वॅलिडेशन) दाखवले आहेत प्रत्येक टप्प्यासाठी.

### टप्पा 1: प्री-प्रोव्हिजन हुक्स
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

### टप्पा 2: पायाभूत सुविधा प्रोव्हिजनिंग
- पायाभूत सुविधा टेम्पलेट वाचतो (Bicep/Terraform)
- Azure संसाधने तयार किंवा अपडेट करतो
- नेटवर्किंग आणि सुरक्षा कॉन्फिगर करतो
- मॉनिटरिंग आणि लॉगिंग सेट करतो

### टप्पा 3: पोस्ट-प्रोव्हिजन हुक्स
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

### टप्पा 4: अ‍ॅप्लिकेशन पॅकेजिंग
- अ‍ॅप्लिकेशन कोड बिल्ड करतो
- तैनाती आर्टिफॅक्ट तयार करतो
- लक्ष्य प्लॅटफॉर्मसाठी पॅकेजेस बनवतो (कंटेनर्स, ZIP फाइल्स इ.)

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

### टप्पा 6: अ‍ॅप्लिकेशन तैनाती
- पॅकेज केलेल्या अ‍ॅप्लिकेशन्सना Azure सेवांवर तैनात करतो
- कॉन्फिगरेशन सेटिंग्ज अपडेट करतो
- सेवा सुरू / पुन्हा सुरू करतो

### टप्पा 7: पोस्ट-डिप्लॉय हुक्स
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

### हुक त्रुटी हाताळणी

डीफॉल्टनुसार, **जर हुक कमांड नॉन-झिरो कोडसह बाहेर पडली, तर azd संपूर्ण ऑपरेशन थांबवतो.** सहसा हेच तुम्हाला हवे असते—अपयशी मायग्रेशनने तैनाती थांबवायला हवे, खराब अ‍ॅप पाठवायला नको. पण याचा अर्थ हुक्स काळजीपूर्वक लिहिलेले पाहिजेत.

**1. अपयशांस मोठ्या आवाजात आणि मनोदयाने करा.** जेव्हा हुकचा शेवटचा कमांड नॉन-झिरो exit code परत करते तेव्हा हुक फेल होतो. शेल स्क्रिप्ट्समध्ये, पहिल्या अपयशी कमांडवर हुक थांबण्यासाठी `set -e` जोडा, गुपचूप पुढे न वाढता:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. हुक फेल होऊ दे पण azd थांबवू नये.** नॉन-क्रिटिकल स्टेपसाठी (ऐच्छिक कॅश वार्म-अप, बेस्ट-एफर्ट नोटिफिकेशन) `continueOnError: true` सेट करा. azd अपयश लॉग करतो पण पुढे चालू ठेवतो:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. पूर्ण रनच्या आधी हुक्स वेगळेच तपासा.** हुक डिबग करण्यासाठी तुम्हाला `azd up` चालवण्याची गरज नाही—ते स्वतंत्रपणे चालवा आणि वेगाने सुधारणा करा:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. OS-विशिष्ट शेल्ससाठी लक्ष ठेवा.** `shell: pwsh` वापरणारे हुक मशीनवर PowerShell असणे आवश्यक आहे (CI एजंटसह). सर्वात विस्तृत पोर्टेबिलिटीसाठी `shell: sh` वापरा, किंवा दोन्ही `windows` आणि `posix` प्रकार द्या:

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

> **डिबगिंग टीप:** कोणतीही azd कमांड `--debug` सह चालवा जेणेकरून अचूक हुक कमांड लाइन आणि त्याचा पूर्ण आउटपुट पाहता येईल—जेव्हा हुक लोकलमध्ये चालतो पण CI मध्ये फेल होतो तेव्हा फार उपयुक्त आहे.

## 🎛️ तैनाती कॉन्फिगरेशन

### सेवा-विशिष्ट तैनाती सेटिंग्ज
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

### पर्यावरण-विशिष्ट कॉन्फिगरेशन्स

हे फक्त स्थानीय azd मूल्ये आहेत. त्यांना स्पष्टपणे पायाभूत सुविधा / रनटाइम कॉन्फिगरशी नकाशित करा. सामान्यतः `NODE_ENV` हे एक डिप्लॉय केलेल्या Node अ‍ॅपसाठी `production` असते, ज्यामध्ये स्टेजिंग तैनाती समाविष्ट आहे; तैनाती टप्पे वेगळे करण्यासाठी स्वतंत्र अ‍ॅप-विशिष्ट चल वापरा.

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

## 🔧 प्रगत तैनाती परिस्थिती

### बहु-सेवा अ‍ॅप्लिकेशन्स
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

**सांकेतिक ऑपरेशनल स्केच:** तुम्हाला दोन्ही वातावरणे, एक सामायिक ट्रॅफिक-राऊटिंग थर, आणि खालील दोन स्क्रिप्ट्स दिल्या पाहिजेत. azd ट्रॅफिक आपोआप स्वरूपांतरित करत नाही किंवा रोलबॅक तयार असल्याची पुष्टी करत नाही. निळा चाचणी पूर्ण होईपर्यंत आणि रोलबॅकची गरज नसल्याचे निश्चित होईपर्यंत हिरवा ठेवा.

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

### कॅनरी डिप्लॉयमेंट्स
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

ट्रॅफिक स्प्लिटिंग कंटेनर ॲप्स कॉन्फिगरेशन (Bicep किंवा Azure CLI) अंतर्गत येते, नाहीतर `azure.yaml` `trafficSplit` मालमत्तेच्या अंतर्गत नाही. पूर्वावलोकन/प्रोव्हीजनिंग आणि नंतरच्या डिप्लॉयमेंट्समध्ये तुम्हाला तुमचा निवडलेला पुनरीक्षण प्रकार आणि राऊटिंग नियम जपावे लागतील.

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

### कंटेनर ॲप डिप्लॉयमेंट्स
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

कंटेनर ॲप इन्फ्रास्ट्रक्चरमध्ये `configuration.secrets`/`secretRef` (किंवा की व्हॉल्ट संदर्भ) सोबत रनटाइम सीक्रेट्स कॉन्फिगर करा आणि `template.scale` सह स्केलिंग करा. समर्पक सर्व्हिस-स्तरीय `secrets` किंवा `scale` मालमत्ता `azure.yaml` मध्ये आपोआप तयार करू नका.

### मल्टी-स्टेज डॉकरफाइल ऑप्टिमायझेशन
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

## ⚡ कार्यक्षमता ऑप्टिमायझेशन

### सेवा-विशिष्ट डिप्लॉयमेंट्स
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### बिल्ड कॅशिंग
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

स्टँडर्ड नोड वर्कफ्लो पॅकेज स्क्रिप्ट्स वापरतो; सेवा `prepackage` हुक्स आवश्यकता असलेले टप्पे जोडू शकतात. डॉकर लेयर कॅशिंग ही सेवा बिल्ड कमांडनिर्मितीपासून स्वतंत्र आहे.

### कार्यक्षम कोड डिप्लॉयमेंट्स
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 डिप्लॉयमेंट मॉनिटरिंग

### रिअल-टाइम डिप्लॉयमेंट मॉनिटरिंग
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

तुमच्या ॲपने `/health` लागू करणे आवश्यक आहे; ते azd द्वारे आपोआप पुरवले जात नाही. कोणतीही सामान्य `azure.yaml` `healthCheck` सेवा मालमत्ता नाही.

### डिप्लॉयमेंट नंतर तपासणी
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

## 🔐 सुरक्षा बाबी

### सीक्रेट्स व्यवस्थापन
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` अवैध आहे. सामान्य वातावरणातील मूल्ये स्थानिक प्लेनटेक्स्ट असतात; वाचन आदेश त्यांना गुप्त ठेवतील असे मानू नका. वर दिलेले आदेश की व्हॉल्ट संदर्भ जतन करतात, पण तुमच्या इन्फ्रास्ट्रक्चर/अॅप्लिकेशनने अजूनही सीक्रेट्स वापरून त्यांना रनटाइम ओळख देणे आवश्यक आहे.

### नेटवर्क सुरक्षा
बिसेप मध्ये नेटवर्क पॅरामीटर्स घोषित करा आणि वापरा, आणि ते `infra/main.parameters.json` मध्ये मॅप करा. `azure.yaml` मध्ये कोणतेही सामान्य `infra.parameters` ओव्हरले नाही. उदाहरणात्मक दस्तऐवजामध्ये दिलेले सीमा `203.0.113.0/24` आणि `198.51.100.0/24` प्रत्यक्ष कार्यालय/व्हीपीएन नेटवर्क नाहीत; त्याऐवजी अधिकृत नेटवर्क सीमा वापरा.

### ओळख आणि प्रवेश व्यवस्थापन
बिसेप मध्ये कंटेनर ॲपचा `identity` सक्रिय करा आणि व्हॉल्ट प्रमाणात आवश्यक की व्हॉल्ट डेटा-प्लेन भूमिका द्या. त्या संसाधनामध्ये नामित की व्हॉल्ट-बॅकड सीक्रेट्स आणि रनटाइम संदर्भ कॉन्फिगर करा; `identity` आणि `keyVault` हे सामान्य azd सेवा मालमत्ता नाहीत. [ऑथेन्टिकेशन & मॅनेज्ड ओळख](../chapter-03-configuration/authsecurity.md) पहा.

## 🚨 रोलबॅक धोरणे

### जलद रोलबॅक
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

### इन्फ्रास्ट्रक्चर रोलबॅक
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
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

## 📊 डिप्लॉयमेंट मेट्रिक्स

### डिप्लॉयमेंट कार्यक्षमता ट्रॅक करा
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### सानुकूल मेट्रिक्स संग्रह
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

## 🎯 सर्वोत्तम पध्दती

### 1. पर्यावरण सुसंगतता
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. पायाभूत सुविधा पडताळणी
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. चाचणी एकत्रीकरण
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
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## पुढील पावले

- [प्रोव्हिजनिंग संसाधने](provisioning.md) - पायाभूत व्यवस्थापनाचा सखोल अभ्यास
- [पूर्व-तैनाती नियोजन](../chapter-06-pre-deployment/capacity-planning.md) - आपल्या तैनाती धोरणाची योजना करा
- [सामान्य समस्या](../chapter-07-troubleshooting/common-issues.md) - तैनाती समस्या सोडवा
- [सर्वोत्तम पद्धती](../chapter-07-troubleshooting/debugging.md) - उत्पादन-तयार तैनाती धोरणे

## 🎯 प्रत्यक्ष तैनाती व्यायाम

### व्यायाम 1: वाढत जाणारी तैनाती कार्यप्रवाह (20 मिनिटे)
**उद्दिष्ट:** संपूर्ण आणि वाढत जाणाऱ्या तैनाती यामधील फरक मास्टर करा

**सुरुवातीचा बिंदू:** Bash, Node.js 22, Git, azd साइन-इन, आणि तैनाती परवानग्या असलेली Azure सदस्यता. नवीन निर्देशिकेत चालवा; बिल करण्यायोग्य App Service/Cosmos DB संसाधने अपेक्षित आहेत. वेळ क्षेत्र आणि साच्यांवर अवलंबून आहे.

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

**यशस्वी निकष:**
- [ ] दोन्ही आदेशांसाठी घालवलेली वेळ नोंदवा (किंवा निश्चित कालावधी नाही)
- [ ] दोन्ही आदेश यशस्वीपणे पूर्ण झाले
- [ ] API कार्यरत राहिली; फक्त टिप्पणी संपादन ही दिसणारी UI बदल नाही
- [ ] `azd deploy` नंतर पायाभूत सुविधा अपरिवर्तित राहिली

**शिकण्याचा परिणाम**: `azd deploy` पायाभूत सुविधा प्रोव्हिजनिंग वगळतो. एक निश्चित टक्केवारी वेग वाढीऐवजी मोजलेली वेळ तुलना करा.

### व्यायाम 2: सानुकूल तैनाती हुक्स (30 मिनिटे)
**उद्दिष्ट:** पूर्व व पोस्ट-तैनाती ऑटोमेशनची अंमलबजावणी करा

**सुरुवातीचा बिंदू:** वर दर्शविलेला आरंभिक `deployment-practice` प्रकल्प. जर आपण तो स्वच्छ केला असेल, तर कोड-केवळ तैनाती चाचणीपूर्वी पुन्हा `azd up` चालवा. खालील पडताळणी API च्या प्रत्यक्ष बिल्ड स्क्रिप्टचा वापर करते, अस्तित्वात नसलेल्या root `test:unit` स्क्रिप्टचा नव्हे. साच्यातील API चाचण्यांना कॉन्फिगर केलेल्या डेटाबेस प्रवेशाची गरज आहे; ते स्वतंत्र युनिट चाचण्या नाहीत.

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

**यशस्वी निकष:**
- [ ] पूर्व-तैनाती स्क्रिप्ट तैनातीपूर्वी चालते
- [ ] बिल्ड पडताळणी अपयशी झाल्यास तैनाती रद्द होते
- [ ] पोस्ट-तैनाती स्मोक चाचणी आरोग्याची खात्री करते
- [ ] हुक्स योग्य क्रमाने चालतात

### व्यायाम 3: बहु-पर्यावरण तैनाती धोरण (45 मिनिटे)
**उद्दिष्ट:** स्तरित तैनाती कार्यप्रवाहीची अंमलबजावणी करा (dev → staging → production)

**प्रारंभिक बिंदू:** `jq` सह एकसारखा प्रारंभ केलेला todo प्रकल्प. वास्तविक सदस्यता/स्थान मूल्यांसह खालील पर्यावरण तयार करा (किंवा प्रत्येकात `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` सेट करा) **कोणतीही सूचना न देता व्हर्कफ्लो सुरू करण्याआधी**. तो जाणूनबुजून चुकतो, हरवलेले मूल्ये बनवण्याऐवजी. फक्त वापरायचे असलेले प्रशिक्षण पर्यावरण वापरा, खऱ्या उत्पादन सदस्यतेऐवजी.

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

**यशस्वी निकष:**
- [ ] डेव्हलपमेंट पर्यावरण यशस्वीपणे तैनात होणे
- [ ] स्टेजिंग पर्यावरण यशस्वीपणे तैनात होणे
- [ ] उत्पादनासाठी मॅन्युअल मंजुरी आवश्यक
- [ ] सर्व पर्यावरणांमध्ये कार्यरत हेल्थ चेक्स
- [ ] आवश्यक असल्यास रोलबॅक करणे शक्य असणे

### व्यायाम ४: रोलबॅक धोरण (२५ मिनिटे)
**ध्येय**: Git वापरून तैनाती रोलबॅक राबविणे आणि चाचणी करणे

**प्रारंभिक बिंदू:** todo टेम्पलेटच्या एकांत प्रशिक्षण चेकआऊट सह ज्यात सर्व बेसलाइन स्रोत कमिट केलेले आहे, एक स्वच्छ Git कार्यरत शाखा, आणि एक वापरायोग्य कॉन्फिगर केलेले पर्यावरण. कधीही खऱ्या उत्पादन प्रकल्पात प्रसिद्ध चुका आणू नका. खालील `APP_VERSION` फक्त बुककीपिंगसाठी आहे जोपर्यंत तुम्ही ते अॅपमध्ये स्पष्टपणे जोडत नाही.

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

**यशस्वी निकष:**
- [ ] तैनाती अपयश ओळखू शकणे
- [ ] रोलबॅक स्क्रिप्ट आपोआप चालवली जाते
- [ ] अर्ज कार्यरत स्थितीत परत येतो
- [ ] रोलबॅक नंतर हेल्थ चेक्स उत्तीर्ण होणे

## 📊 तैनाती मेट्रिक्स ट्रॅक करणे

### तुमच्या तैनातीच्या कामगिरीचा मागोवा घ्या

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

**तुमचे मेट्रिक्स विश्लेषित करा:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## अतिरिक्त संसाधने

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेव्हिगेशन**
- **मागील धडा**: [तुमचा पहिला प्रकल्प](../chapter-01-foundation/first-project.md)
- **पुढील धडा**: [संसाधने प्रदान करणे](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->