# परिनियोजन मार्गदर्शिका - AZD परिनियोजनमा निपुणता

**अध्याय नेभिगेसन:**
- **📚 पाठ्यक्रम गृह**: [AZD For Beginners](../../README.md)
- **📖 हालको अध्याय**: अध्याय 4 - Infrastructure as Code & Deployment
- **⬅️ अघिल्लो अध्याय**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ अर्को**: [Provisioning Resources](provisioning.md)
- **🧩 यस अध्यायमा पनि**: [Authoring Your Own Template](custom-templates.md)
- **🚀 अर्को अध्याय**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## परिचय

यो व्यापक मार्गदर्शिकाले Azure Developer CLI प्रयोग गरी आवेदनहरू परिनियोजन गर्ने बारेमा आवश्यक सबै कुरा समेट्छ — आधारभूत एक-कमाण्ड परिनियोजनदेखि लिएर अनुकूल हुकहरू, बहु वातावरण, र CI/CD एकीकरण भएका उन्नत उत्पादन परिदृश्यहरू सम्म। व्यवहारिक उदाहरणहरू र उत्कृष्ट अभ्यासहरूसँग पूरा परिनियोजन लाइफसाइकलमा निपुण हुनुहोस्।

## सिक्ने लक्ष्यहरू

यस मार्गदर्शिका पूरा गरेपछि, तपाईं:
- सबै Azure Developer CLI परिनियोजन कमाण्डहरू र वर्कफ्लोहरूमा निपुण हुन
- प्रोभिजनिंगदेखि मनिटरिङसम्म पूर्ण परिनियोजन लाइफसाइकल बुझ्न
- प्रि र पोस्ट-परिनियोजन स्वचालनका लागि कस्टम हुकहरू लागू गर्न
- वातावरण-विशेष प्यारामिटरहरूसहित बहु वातावरण कन्फिगर गर्न
- ब्लू-ग्रीन र क्यानरी जस्ता उन्नत परिनियोजन रणनीतिहरू सेटअप गर्न
- azd परिनियोजनहरूलाई CI/CD पाइपलाइन र DevOps वर्कफ्लोहरूसँग एकीकृत गर्न

## सिकाइ परिणामहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- सबै azd परिनियोजन वर्कफ्लोहरू स्वतन्त्र रूपमा चलाउन र समस्या निवारण गर्न
- हुकहरू प्रयोग गरेर कस्टम परिनियोजन स्वचालन डिजाइन र लागू गर्न
- उपयुक्त सुरक्षा र मनिटरिङ सहित उत्पादन-तयार परिनियोजनहरू कन्फिगर गर्न
- जटिल बहु-वातावरण परिनियोजन अवस्था व्यवस्थापन गर्न
- परिनियोजन प्रदर्शन अनुकूलन र रोलब्याक रणनीतिहरू लागू गर्न
- एंटरप्राइज DevOps अभ्यासहरूमा azd परिनियोजनहरू एकीकृत गर्न

## परिनियोजन अवलोकन

Azure Developer CLI ले धेरै परिनियोजन कमाण्डहरू प्रदान गर्छ:
- `azd up` - पुरा वर्कफ्लो (provision + deploy)
- `azd provision` - केवल Azure स्रोतहरू सिर्जना/अपडेट गर्ने
- `azd deploy` - केवल आवेदन कोड परिनियोजन गर्ने
- `azd package` - एप्लिकेसनहरू निर्माण र प्याकेज गर्ने

## आधारभूत परिनियोजन वर्कफ्लोहरू

### पूरा परिनियोजन (azd up)
नयाँ परियोजनाहरूका लागि सबैभन्दा सामान्य वर्कफ्लो:
```bash
# सबै कुरा सुरुबाट परिनियोजन गर्नुहोस्
azd up

# विशिष्ट वातावरणमा परिनियोजन गर्नुहोस्
azd up --environment production

# कस्टम प्यारामिटरहरूसँग परिनियोजन गर्नुहोस्
azd up --parameter location=westus2 --parameter sku=P1v2
```

### केवल पूर्वाधार परिनियोजन
जब तपाईंले केवल Azure स्रोतहरू अपडेट गर्नु आवश्यक हुन्छ:
```bash
# पूर्वाधार प्रावधान/अद्यावधिक गर्नुहोस्
azd provision

# परिवर्तनहरू पूर्वावलोकन गर्न ड्राइ-रनसहित प्रावधान गर्नुहोस्
azd provision --preview

# निर्दिष्ट सेवाहरू प्रावधान गर्नुहोस्
azd provision --service database
```

### केवल कोड परिनियोजन
छिटो आवेदन अपडेटहरूको लागि:
```bash
# सबै सेवाहरू तैनाथ गर्नुहोस्
azd deploy

# अपेक्षित नतिजा:
# सेवाहरू तैनाथ गर्दै (azd deploy)
# - web: तैनाथ गर्दै... सम्पन्न
# - api: तैनाथ गर्दै... सम्पन्न
# सफल: तपाईंको तैनाती २ मिनेट १५ सेकेन्डमा पूरा भयो

# विशिष्ट सेवा तैनाथ गर्नुहोस्
azd deploy --service web
azd deploy --service api

# सानुकूल निर्माण तर्कहरूसँग तैनाथ गर्नुहोस्
azd deploy --service api --build-arg NODE_ENV=production

# तैनाती जाँच गर्नुहोस्
azd show --output json | jq '.services'
```

### ✅ परिनियोजन प्रमाणीकरण

कुनै पनि परिनियोजन पछि सफलताको जाँच गर्नुहोस्:

```bash
# सबै सेवाहरू चलिरहेका छन् कि छैनन् जाँच गर्नुहोस्
azd show

# स्वास्थ्य एन्डपोइन्टहरू परीक्षण गर्नुहोस्
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# त्रुटिहरूको निगरानी गर्नुहोस् (पूर्वनिर्धारित रूपमा ब्राउजरमा खुल्छ)
azd monitor --logs
```

**सफलता मापदण्ड:**
- ✅ सबै सेवाहरू "Running" स्थितिमा देखिनु
- ✅ हेल्थ एन्डप्वाइण्टहरूले HTTP 200 फिर्ता गर्नु
- ✅ पछिल्लो 5 मिनेटमा कुनै त्रुटि लगहरू नहुनु
- ✅ आवेदनले परीक्षण अनुरोधहरूमा प्रतिक्रिया दिनु

## 🏗️ परिनियोजन प्रक्रियालाई बुझ्ने

### हुकहरूमा नयाँ? यहाँबाट सुरु गर्नुहोस्

एक **हुक** भनेको azd ले परिनियोजन प्रक्रियाको कुनै विशेष क्षणमा स्वतः चलाउने कमाण्ड हो — provision गर्नु अघि वा पछि, र तपाईंको कोड परिनियोजन गर्नु अघि वा पछि। तिनीहरूले परिनियोजनसँग सधैं संलग्न साना कामहरूलाई स्वचालित बनाउन मद्दत गर्छन्: डेटाबेसमा बीउ हाल्ने, माइग्रेशन चलाउने, एसेटहरू बनाउने, वा लाइभ एपको स्मोक-टेस्ट गर्ने।

| Hook | Runs… | Common use |
|------|-------|------------|
| `preprovision` | Before resources are created | पूर्वापेक्षाहरूलाई मान्यता दिनु, रजिस्ट्रीमा लग इन गर्नु |
| `postprovision` | After resources exist | स्रोतहरू कन्फिगर गर्नु, डेटाबेस सेटअप गर्नु |
| `predeploy` | Before code is deployed | फ्रन्ट-एन्ड एसेटहरू बनाउने, यूनिट टेस्टहरू चलाउने |
| `postdeploy` | After code is live | DB माइग्रेशनहरू चलाउने, एन्डप्वाइन्ट स्मोक-टेस्ट गर्ने |

हुकहरू तपाईंको `azure.yaml` भित्र बस्छन्। यहाँ सबैभन्दा सानो सम्भव उदाहरण छ — यसले परिनियोजनपछि सन्देश मात्र प्रिन्ट गर्छ:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

यत्ति हो — अर्को पटक तपाईं `azd up` चलाउँदा सन्देश स्वतः प्रिन्ट हुनेछ। तपाईं पूर्ण परिनियोजन बिना मात्र हुकलाई पनि अलगै चलाउन सक्नुहुन्छ, जुन परीक्षणका लागि शानदार हुन्छ:

```bash
azd hooks run postdeploy
```

तलका चरणहरूले प्रत्येक चरणका लागि वास्तविक-विश्व हुकहरू (माइग्रेशनहरू, टेस्टहरू, मान्यता) देखाउँछन्।

### चरण 1: प्रि-प्रोभिजन हुकहरू
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

### चरण 2: पूर्वाधार प्रोभिजनिङ
- पूर्वाधार टेम्प्लेटहरू (Bicep/Terraform) पढ्छ
- Azure स्रोतहरू सिर्जना वा अपडेट गर्छ
- नेटवर्किङ र सुरक्षा कन्फिगर गर्छ
- मनिटरिङ र लगिङ सेटअप गर्छ

### चरण 3: पोस्ट-प्रोभिजन हुकहरू
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

### चरण 4: एप्लिकेसन प्याकेजिङ
- आवेदन कोड निर्माण गर्छ
- परिनियोजन आर्टिफ्याक्टहरू सिर्जना गर्छ
- लक्षित प्लेटफर्मका लागि प्याकेज गर्छ (कन्टेनरहरू, ZIP फाइलहरू, आदि)

### चरण 5: प्रि-डिप्लोय हुकहरू
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

### चरण 6: एप्लिकेसन परिनियोजन
- प्याकेज गरिएका आवेदनहरू Azure सेवाहरूमा परिनियोजन गर्छ
- कन्फिगरेसन सेटिङहरू अपडेट गर्छ
- सेवाहरू सुरु/रिस्टार्ट गर्छ

### चरण 7: पोस्ट-डिप्लोय हुकहरू
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

### हुक त्रुटिहरूको ह्यान्डलिङ

डिफ़ल्ट रूपमा, **यदि हुक कमाण्डले नोन्-ज़िरो कोडसँग बाहिरिन्छ भने, azd सम्पूर्ण अपरेसन रोक्छ।** सामान्यतया यही चाहिने व्यवहार हो — असफल माइग्रेशनले परिनियोजन रोक्नुपर्छ, एउटा भत्किएको एप पठाउन होइन। तर यसको अर्थ हुकहरू सावधानीपूर्वक लेखिनु पर्छ।

**1. असफलताहरूलाई जोरदार र जानाजानी बनाउनुहोस्।** हुक तब असफल हुन्छ जब यसको अन्तिम कमाण्डले नोन्-ज़िरो एग्जिट कोड फिर्ता गर्छ। शेल स्क्रिप्टहरूमा, `set -e` थप्नुहोस् ताकि हुकले पहिलो असफल कमाण्डमा नै रोकियोस् र चुपचाप जारी नरोयो:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. एक हुकलाई azd रोक्न नदिई असफल हुन दिनुहोस्।** गैर-आवश्यमक चरणहरू (वैकल्पिक क्यास वर्म-अप, प्रयास-आधारित सूचना) का लागि, `continueOnError: true` सेट गर्नुहोस्। azd असफलता लग गर्छ तर जारी राख्छ:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. पूर्ण रन अघि हुकहरू अलग्गै टेस्ट गर्नुहोस्।** तपाईंले हुक डिबग गर्न `azd up` चलाउन आवश्यक छैन — यसलाई अलग्गै चलाउनुहोस् र छिटो पुनरावृत्ति गर्नुहोस्:

```bash
azd hooks run predeploy          # सिर्फ predeploy हुक चलाउँछ
azd hooks run postdeploy --service api
```

**4. OS-विशिष्ट शेलहरूमा ध्यान दिनुहोस्।** `shell: pwsh` प्रयोग गर्ने हुकलाई त्यो मेसिनमा PowerShell इन्स्टल हुनु आवश्यक छ (CI एजेन्टहरू समेत)। सबैभन्दा व्यापक पोर्टेबिलिटीका लागि `shell: sh` प्रयोग गर्नुहोस्, वा `windows` र `posix` दुबै भर्सनहरू प्रदान गर्नुहोस्:

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

> **डिबगिङ सुझाव:** कुनै पनि azd कमाण्ड `--debug` सहित चलाउनुहोस् ताकि ठ्याक्कै हुक कमाण्ड लाइन र यसको पूरा आउटपुट देखियोस् — जब हुक लोकलमा काम गर्छ तर CI मा असफल हुन्छ तब यो अमूल्य हुन्छ।

## 🎛️ परिनियोजन कन्फिगरेसन

### सेवा-विशेष परिनियोजन सेटिङहरू
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

### वातावरण-विशेष कन्फिगरेसनहरू
```bash
# विकास वातावरण
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# स्टेजिङ वातावरण
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

## 🔧 उन्नत परिनियोजन परिदृश्यहरू

### बहु-सेवा आवेदनहरू
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

### ब्लू-ग्रीन परिनियोजन
```bash
# नीलो वातावरण सिर्जना गर्नुहोस्
azd env new production-blue
azd up --environment production-blue

# नीलो वातावरण परीक्षण गर्नुहोस्
./scripts/test-environment.sh production-blue

# ट्राफिकलाई नीलोतर्फ स्विच गर्नुहोस् (म्यानुअल DNS/लोड बेलान्सर अद्यावधिक)
./scripts/switch-traffic.sh production-blue

# हरियो वातावरण सफा गर्नुहोस्
azd env select production-green
azd down --force
```

### क्यानरी परिनियोजन
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

### स्टेज गरिएको परिनियोजन
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

## 🐳 कन्टेनर परिनियोजनहरू

### Container App परिनियोजनहरू
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

### मल्टि-स्टेज Dockerfile अनुकूलन
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

### सेवा-विशेष परिनियोजनहरू
```bash
# छिटो पुनरावृत्तिका लागि विशेष सेवा तैनाथ गर्नुहोस्
azd deploy --service web
azd deploy --service api

# सबै सेवाहरू तैनाथ गर्नुहोस्
azd deploy
```

### बिल्ड क्यासिङ
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### प्रभावकारी कोड परिनियोजनहरू
```bash
# केवल कोड परिवर्तनहरूको लागि azd deploy प्रयोग गर्नुहोस् (azd up होइन)
# यसले पूर्वाधारको प्रावधान छोड्छ र धेरै छिटो हुन्छ
azd deploy

# सबैभन्दा छिटो पुनरावृत्तिका लागि विशिष्ट सेवा तैनाथ गर्नुहोस्
azd deploy --service api
```

## 🔍 परिनियोजन मनिटरिङ

### वास्तविक-समय परिनियोजन मनिटरिङ
```bash
# अनुप्रयोगलाई वास्तविक-समयमा अनुगमन गर्नुहोस्
azd monitor --live

# अनुप्रयोगका लगहरू हेर्नुहोस्
azd monitor --logs

# परिनियोजन स्थिति जाँच गर्नुहोस्
azd show
```

### हेल्थ चेकहरू
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

### पोस्ट-परिनियोजन मान्यता
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# अनुप्रयोगको स्वास्थ्य जाँच गर्नुहोस्
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

## 🔐 सुरक्षा सम्बन्धी विचारहरू

### सिक्रेट्स व्यवस्थापन
```bash
# रहस्यहरू सुरक्षित रूपमा भण्डारण गर्नुहोस्
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml मा रहस्यहरूको सन्दर्भ गर्नुहोस्
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

### पहिचान र पहुँच व्यवस्थापन
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

## 🚨 रोलब्याक रणनीतिहरू

### छिटो रोलब्याक
```bash
# AZD मा अन्तर्निर्मित रोलब्याक छैन। सिफारिस गरिएका दृष्टिकोणहरू:

# विकल्प 1: Git बाट पुनः तैनाथ गर्नुहोस् (सिफारिस गरिएको)
git revert HEAD  # समस्याग्रस्त कमिटलाई उल्टाउनुहोस्
git push
azd deploy

# विकल्प 2: विशेष कमिट पुनः तैनाथ गर्नुहोस्
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### पूर्वाधार रोलब्याक
```bash
# लागू गर्नु अघि पूर्वाधार परिवर्तनहरूको पूर्वावलोकन गर्नुहोस्
azd provision --preview

# पूर्वाधार रोलब्याकका लागि संस्करण नियन्त्रण प्रयोग गर्नुहोस्:
git revert HEAD  # पूर्वाधार परिवर्तनहरू पूर्ववत् गर्नुहोस्
azd provision    # अघिल्लो पूर्वाधार अवस्था लागू गर्नुहोस्
```

### डेटाबेस माइग्रेशन रोलब्याक
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 परिनियोजन मेट्रिक्स

### परिनियोजन प्रदर्शन ट्र्याक गर्नुहोस्
```bash
# हालको परिनियोजन स्थिति हेर्नुहोस्
azd show

# Application Insights प्रयोग गरेर अनुप्रयोग अनुगमन गर्नुहोस्
azd monitor --overview

# प्रत्यक्ष मेट्रिक्स हेर्नुहोस्
azd monitor --live
```

### कस्टम मेट्रिक्स सङ्कलन
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

## 🎯 उत्कृष्ट अभ्यासहरू

### 1. वातावरण一致ता
```bash
# सुसंगत नामकरण प्रयोग गर्नुहोस्
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# वातावरणको समानता कायम राख्नुहोस्
./scripts/sync-environments.sh
```

### 2. पूर्वाधार मान्यता
```bash
# परिनियोजन गर्नु अघि पूर्वाधार परिवर्तनहरूको पूर्वावलोकन गर्नुहोस्
azd provision --preview

# ARM/Bicep लिन्टिङ प्रयोग गर्नुहोस्
az bicep lint --file infra/main.bicep

# Bicep वाक्यविन्यास मान्य गर्नुहोस्
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

### 4. दस्तावेजीकरण र लगिङ
```bash
# परिनियोजन प्रक्रियाहरू दस्तावेज गर्नुहोस्
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## अर्को कदमहरू

- [Provisioning Resources](provisioning.md) - पूर्वाधार व्यवस्थापनमा गहिराइमा हेर्नुहोस्
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - आफ्नो परिनियोजन रणनीति योजना बनाउनुहोस्
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - परिनियोजन समस्याहरू समाधान गर्नुहोस्
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - उत्पादन-तयार परिनियोजन रणनीतिहरू

## 🎯 प्रयोगात्मक परिनियोजन अभ्यासहरू

### अभ्यास 1: क्रमिक परिनियोजन वर्कफ्लो (20 मिनेट)
**लक्ष्य**: पूर्ण र क्रमिक परिनियोजनहरू बीचको भिन्नता निपुण हुन

```bash
# प्रारम्भिक तैनाती
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# प्रारम्भिक तैनातीको समय रेकर्ड गर्नुहोस्
echo "Full deployment: $(date)" > deployment-log.txt

# कोडमा परिवर्तन गर्नुहोस्
echo "// Updated $(date)" >> src/api/src/server.js

# केवल कोड तैनात गर्नुहोस् (छिटो)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# समयहरू तुलना गर्नुहोस्
cat deployment-log.txt

# सफा गर्नुहोस्
azd down --force --purge
```

**सफलता मापदण्ड:**
- [ ] पूर्ण परिनियोजन 5-15 मिनेट लिन्छ
- [ ] केवल कोड परिनियोजन 2-5 मिनेट लिन्छ
- [ ] कोड परिवर्तनहरू परिनियोजित एपमा प्रतिबिम्बित हुन्छन्
- [ ] `azd deploy` पछि पूर्वाधार अप्रभावित रहन्छ

**सिकाइ नतिजा**: `azd deploy` कोड परिवर्तनहरूका लागि `azd up` भन्दा 50-70% छिटो हुन्छ

### अभ्यास 2: कस्टम परिनियोजन हुकहरू (30 मिनेट)
**लक्ष्य**: प्रि र पोस्ट-परिनियोजन स्वचालन लागू गर्नु

```bash
# पूर्व-डिप्लोय मान्यकरण स्क्रिप्ट सिर्जना गर्नुहोस्
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# परीक्षणहरू पास भए कि जाँच गर्नुहोस्
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# कमिट नभएका परिवर्तनहरूको जाँच गर्नुहोस्
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# डिप्लोयपछि स्मोक टेस्ट सिर्जना गर्नुहोस्
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

# azure.yaml मा हुकहरू थप्नुहोस्
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# हुकहरू सहित डिप्लोयमेन्ट परीक्षण गर्नुहोस्
azd deploy
```

**सफलता मापदण्ड:**
- [ ] प्रि-डिप्लोय स्क्रिप्ट परिनियोजनअघि चल्छ
- [ ] टेस्टहरू असफल भएमा परिनियोजन निरस्त हुन्छ
- [ ] पोस्ट-डिप्लोय स्मोक टेस्टले हेल्थ मान्य गर्छ
- [ ] हुकहरू सही क्रममा कार्यान्वयन हुन्छन्

### अभ्यास 3: बहु-पर्यावरण परिनियोजन रणनीति (45 मिनेट)
**लक्ष्य**: स्टेज गरिएको परिनियोजन वर्कफ्लो लागू गर्नु (dev → staging → production)

```bash
# परिनियोजन स्क्रिप्ट सिर्जना गर्नुहोस्
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# चरण 1: विकास (dev) मा परिनियोजन गर्नुहोस्
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# चरण 2: स्टेजिङ (staging) मा परिनियोजन गर्नुहोस्
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# चरण 3: उत्पादन (production) का लागि म्यानुअल अनुमोदन
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

# वातावरणहरू सिर्जना गर्नुहोस्
azd env new dev
azd env new staging
azd env new production

# स्टेज गरिएको परिनियोजन चलाउनुहोस्
./deploy-staged.sh
```

**सफलता मापदण्ड:**
- [ ] Dev वातावरण सफलतापूर्वक परिनियोजित हुन्छ
- [ ] Staging वातावरण सफलतापूर्वक परिनियोजित हुन्छ
- [ ] उत्पादनका लागि म्यानुअल अनुमोदन आवश्यक छ
- [ ] सबै वातावरणहरूमा काम गर्ने हेल्थ चेकहरू छन्
- [ ] आवश्यकता परेको खण्डमा रोलब्याक गर्न सकिन्छ

### अभ्यास 4: रोलब्याक रणनीति (25 मिनेट)
**लक्ष्य**: Git प्रयोग गरी परिनियोजन रोलब्याक लागू र टेस्ट गर्नु

```bash
# v1 तैनाथ गर्नुहोस्
azd env set APP_VERSION "1.0.0"
azd up

# v1 कमिट ह्यास सुरक्षित गर्नुहोस्
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# विफल पार्ने परिवर्तन सहित v2 तैनाथ गर्नुहोस्
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# असफलता पत्ता लगाएर रोलब्याक गर्नुहोस्
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git प्रयोग गरी रोलब्याक गर्नुहोस्
    git revert HEAD --no-edit
    
    # वातावरण रोलब्याक गर्नुहोस्
    azd env set APP_VERSION "1.0.0"
    
    # v1 पुनः तैनाथ गर्नुहोस्
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**सफलता मापदण्ड:**
- [ ] परिनियोजन असफलताहरू पत्ता लगाउनसक्ने
- [ ] रोलब्याक स्क्रिप्ट स्वतः कार्यान्वयन हुन्छ
- [ ] आवेदन कार्यरत अवस्थामा फिर्ता आउँछ
- [ ] रोलब्याक पछि हेल्थ चेकहरू पास हुन्छन्

## 📊 परिनियोजन मेट्रिक्स ट्र्याकिङ

### आफ्नो परिनियोजन प्रदर्शन ट्र्याक गर्नुहोस्

```bash
# तैनाती मेट्रिक्स स्क्रिप्ट सिर्जना गर्नुहोस्
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

# फाइलमा लग गर्नुहोस्
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# यसलाई प्रयोग गर्नुहोस्
./track-deployment.sh
```

**तपाईंका मेट्रिक्स विश्लेषण गर्नुहोस्:**
```bash
# डिप्लोयमेन्ट इतिहास हेर्नुहोस्
cat deployment-metrics.csv

# औसत डिप्लोयमेन्ट समय गणना गर्नुहोस्
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## थप स्रोतहरू

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [Your First Project](../chapter-01-foundation/first-project.md)
- **अर्को पाठ**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->