# דוגמאות לפריסת אפליקציות מכולות עם AZD

תיקיה זו מכילה דוגמאות מקיפות לפריסת אפליקציות מכולות ל-Azure Container Apps באמצעות Azure Developer CLI (AZD). דוגמאות אלו מציגות תבניות עבודה מהעולם האמיתי, שיטות עבודה מומלצות, ותצורות מוכנות לייצור.

## 📚 תכולת העניינים

- [סקירה כללית](../../../../examples/container-app)
- [דרישות מוקדמות](../../../../examples/container-app)
- [דוגמאות התחלה מהירה](../../../../examples/container-app)
- [דוגמאות לייצור](../../../../examples/container-app)
- [תבניות מתקדמות](../../../../examples/container-app)
- [שיטות עבודה מומלצות](../../../../examples/container-app)

## סקירה כללית

Azure Container Apps היא פלטפורמת מכולות מנוהלת לחלוטין ללא שרתים, המאפשרת להריץ מיקרו-שירותים ואפליקציות מכולות ללא ניהול תשתית. בשילוב עם AZD, אתה מקבל:

- **פריסה מפושטת**: פקודה אחת לפריסת מכולות עם תשתית
- **קנה מידה אוטומטי**: קנה מידה לאפס ופריסה בהתאם לתעבורת HTTP או אירועים
- **רשת משולבת**: גילוי שירות מובנה והפרדת תעבורה
- **זהות מנוהלת**: אימות מאובטח למשאבי Azure
- **אופטימיזציית עלויות**: תשלום רק עבור המשאבים שבהם אתה משתמש

## דרישות מוקדמות

לפני שמתחילים, ודא שיש לך:

```bash
# בדוק התקנת AZD
azd version

# בדוק את Azure CLI
az version

# בדוק את Docker (לבניית תמונות מותאמות אישית)
docker --version

# התחבר ל-Azure
azd auth login
az login
```

**משאבי Azure נדרשים:**
- מנוי Azure פעיל
- הרשאות ליצירת קבוצת משאבים
- גישה לסביבת Container Apps

## דוגמאות התחלה מהירה

### 1. API ווב פשוט (Python Flask)

פרוס API REST בסיסי עם Azure Container Apps.

**דוגמה: Python Flask API**

```yaml
# azure.yaml
name: flask-api-demo
metadata:
  template: flask-api-demo@0.0.1-beta
services:
  api:
    project: ./src/api
    language: python
    host: containerapp
```

**שלבי פריסה:**

```bash
# אתחול מתבנית
azd init --template todo-python-mongo

# הקצה תשתית ופרוס
azd up

# בדוק את הפריסה
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**תכונות עיקריות:**
- קנה מידה אוטומטי מ-0 עד 10 שכפולים
- בדיקות בריאות ובדיקות חיות
- הזרקת משתני סביבה
- אינטגרציה עם Application Insights

### 2. Node.js Express API

פרוס backend ב-Node.js עם אינטגרציה ל-MongoDB.

```bash
# אתחול תבנית API של Node.js
azd init --template todo-nodejs-mongo

# קבע משתני סביבה
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# פרוס
azd up

# הצג יומנים באמצעות Azure Monitor
azd monitor --logs
```

**היבטי תשתית מרכזיים:**
```bicep
// Bicep snippet from infra/main.bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'api-${resourceToken}'
  location: location
  properties: {
    managedEnvironmentId: containerEnv.id
    configuration: {
      ingress: {
        external: true
        targetPort: 3000
        transport: 'auto'
      }
      secrets: [
        {
          name: 'mongodb-connection'
          value: mongoConnection
        }
      ]
    }
    template: {
      containers: [
        {
          name: 'api'
          image: containerImage
          env: [
            {
              name: 'DATABASE_URL'
              secretRef: 'mongodb-connection'
            }
          ]
        }
      ]
      scale: {
        minReplicas: 0
        maxReplicas: 10
      }
    }
  }
}
```

### 3. Frontend סטטי + backend API

פרוס אפליקציית full-stack עם React ב-front ו-API ב-backend.

```bash
# אתחול תבנית פול-סטאק
azd init --template todo-csharp-sql-swa-func

# סקירת תצורה
cat azure.yaml

# פריסה של שני השירותים
azd up

# פתיחת היישום
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## דוגמאות לייצור

### דוגמה 1: ארכיטקטורת מיקרו-שירותים

**תרחיש**: אפליקציית e-commerce עם מיקרו-שירותים מרובים

**מבנה תיקיות:**
```
microservices-demo/
├── azure.yaml
├── infra/
│   ├── main.bicep
│   ├── app/
│   │   ├── container-env.bicep
│   │   ├── product-service.bicep
│   │   ├── order-service.bicep
│   │   └── payment-service.bicep
│   └── core/
│       ├── storage.bicep
│       └── database.bicep
└── src/
    ├── product-service/
    ├── order-service/
    └── payment-service/
```

**תצורת azure.yaml:**
```yaml
name: microservices-ecommerce
services:
  product-service:
    project: ./src/product-service
    language: python
    host: containerapp
    
  order-service:
    project: ./src/order-service
    language: csharp
    host: containerapp
    
  payment-service:
    project: ./src/payment-service
    language: nodejs
    host: containerapp
```

**פריסה:**
```bash
# אתחול הפרויקט
azd init

# הגדר סביבת ייצור
azd env new production

# קבע הגדרות ייצור
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# פרוס את כל השירותים
azd up

# עקוב אחרי הפריסה
azd monitor --overview
```

### דוגמה 2: אפליקציית מכולה עם בינה מלאכותית

**תרחיש**: אפליקציית שיחה מבוססת AI עם אינטגרציה ל-Azure OpenAI

**קובץ: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# השתמש בזהות מנוהלת לגישה מאובטחת
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # קבל מפתח OpenAI מ-Key Vault
    openai_key = client.get_secret("openai-api-key").value
    openai.api_key = openai_key
    
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[{"role": "user", "content": user_message}]
    )
    
    return jsonify({"response": response.choices[0].message.content})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
```

**קובץ: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**קובץ: infra/main.bicep**
```bicep
param location string = resourceGroup().location
param environmentName string

var resourceToken = uniqueString(subscription().id, environmentName, location)

// Container Apps Environment
module containerEnv './app/container-env.bicep' = {
  name: 'container-env-${resourceToken}'
  params: {
    location: location
    environmentName: environmentName
  }
}

// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: 'kv-${resourceToken}'
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
  }
}

// Container App with Managed Identity
module aiChatApp './app/container-app.bicep' = {
  name: 'ai-chat-app-${resourceToken}'
  params: {
    location: location
    environmentId: containerEnv.outputs.environmentId
    containerImage: 'your-registry.azurecr.io/ai-chat:latest'
    keyVaultName: keyVault.name
  }
}
```

**פקודות פריסה:**
```bash
# להגדיר סביבה
azd init --template ai-chat-app
azd env new dev

# להגדיר את OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# לפרוס
azd up

# לבדוק את ה-API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### דוגמה 3: עובד רקע עם עיבוד תורים

**תרחיש**: מערכת עיבוד הזמנות עם תור הודעות

**מבנה תיקיות:**
```
queue-worker/
├── azure.yaml
├── infra/
│   ├── main.bicep
│   ├── app/
│   │   ├── api.bicep
│   │   └── worker.bicep
│   └── core/
│       ├── storage-queue.bicep
│       └── servicebus.bicep
└── src/
    ├── api/
    └── worker/
```

**קובץ: src/worker/processor.py**
```python
import os
from azure.storage.queue import QueueClient
from azure.identity import DefaultAzureCredential

def process_orders():
    credential = DefaultAzureCredential()
    queue_url = os.getenv('AZURE_QUEUE_URL')
    
    queue_client = QueueClient.from_queue_url(
        queue_url=queue_url,
        credential=credential
    )
    
    while True:
        messages = queue_client.receive_messages(max_messages=10)
        for message in messages:
            # לעבד הזמנה
            print(f"Processing order: {message.content}")
            
            # הודעה מלאה
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**קובץ: azure.yaml**
```yaml
name: order-processing
services:
  api:
    project: ./src/api
    language: python
    host: containerapp
    
  worker:
    project: ./src/worker
    language: python
    host: containerapp
```

**פריסה:**
```bash
# אתחול
azd init

# פריסה עם תצורת תור
azd up

# להתאים את סקייל העובד לפי אורך התור
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## תבניות מתקדמות

### תבנית 1: פריסת כחולה-ירוקה

```bash
# צור גרסה חדשה ללא תנועה
azd deploy api --revision-suffix blue --no-traffic

# בדוק את הגרסה החדשה
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# חלק את התנועה (20% לכחול, 80% לנוכחי)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# העברה מלאה לכחול
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### תבנית 2: פריסת קנרי עם AZD

**קובץ: .azure/dev/config.json**
```json
{
  "deploymentStrategy": "canary",
  "canary": {
    "initialTrafficPercentage": 10,
    "incrementPercentage": 10,
    "intervalMinutes": 5
  }
}
```

**סקריפט פריסה:**
```bash
#!/bin/bash
# deploy-canary.sh

# לפרוס גרסה חדשה עם 10% מהתנועה
azd deploy api --revision-mode multiple

# לנטר מדדים
azd monitor --service api --duration 5m

# להגדיל את התנועה בהדרגה
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # המתן 5 דקות
done
```

### תבנית 3: פריסה רב-אזורית

**קובץ: azure.yaml**
```yaml
name: global-app
services:
  api:
    project: ./src/api
    language: python
    host: containerapp
    regions:
      - eastus
      - westeurope
      - southeastasia
```

**קובץ: infra/multi-region.bicep**
```bicep
param regions array = ['eastus', 'westeurope', 'southeastasia']

module containerApps './app/container-app.bicep' = [for region in regions: {
  name: 'app-${region}'
  params: {
    location: region
    environmentName: environmentName
  }
}]

// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficManagerProfiles@2022-04-01' = {
  name: 'tm-global-app'
  location: 'global'
  properties: {
    trafficRoutingMethod: 'Performance'
    endpoints: [for i in range(0, length(regions)): {
      name: 'endpoint-${regions[i]}'
      type: 'Microsoft.Network/trafficManagerProfiles/externalEndpoints'
      properties: {
        target: containerApps[i].outputs.fqdn
        endpointStatus: 'Enabled'
      }
    }]
  }
}
```

**פריסה:**
```bash
# פרוס לכל האזורים
azd up

# אמת את נקודות הקצה
azd show --output json | jq '.services.api.endpoints'
```

### תבנית 4: אינטגרציית Dapr

**קובץ: infra/app/dapr-enabled.bicep**
```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'dapr-app'
  properties: {
    configuration: {
      dapr: {
        enabled: true
        appId: 'order-service'
        appPort: 8000
        appProtocol: 'http'
      }
    }
    template: {
      containers: [
        {
          name: 'app'
          image: containerImage
        }
      ]
    }
  }
}
```

**קוד אפליקציה עם Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # שמור מצב
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # פרסם אירוע
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## שיטות עבודה מומלצות

### 1. ארגון משאבים

```bash
# השתמש בקונבנציות שמות עקביות
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# תייג משאבים למעקב עלויות
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. שיטות אבטחה מומלצות

```bicep
// Always use managed identity
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  identity: {
    type: 'SystemAssigned'
  }
}

// Store secrets in Key Vault
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  properties: {
    enableRbacAuthorization: true
    networkAcls: {
      defaultAction: 'Deny'
      bypass: 'AzureServices'
    }
  }
}

// Use private endpoints
resource privateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  properties: {
    subnet: {
      id: subnetId
    }
    privateLinkServiceConnections: [
      {
        name: 'containerapp-connection'
        properties: {
          privateLinkServiceId: containerApp.id
        }
      }
    ]
  }
}
```

### 3. אופטימיזציית ביצועים

```yaml
# azure.yaml with performance settings
services:
  api:
    project: ./src/api
    host: containerapp
    resources:
      cpu: 1.0
      memory: 2Gi
    scale:
      minReplicas: 2
      maxReplicas: 20
      rules:
        - name: http-rule
          http:
            concurrent: 100
```

### 4. ניטור ותצפית

```bash
# הפעלת Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# הצג יומנים בזמן אמת
azd monitor --logs
# או השתמש ב-Azure CLI עבור Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# ניטור מדדים
azd monitor --live

# צור התראות
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. אופטימיזציית עלויות

```bash
# להקטין לאפס כשהמערכת לא בשימוש
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# השתמש במקרים ספוט לסביבות פיתוח
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# להגדיר התראות תקציב
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. אינטגרציית CI/CD

**דוגמה ל-GitHub Actions:**
```yaml
name: Deploy to Azure Container Apps

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup AZD
        uses: Azure/setup-azd@v1
      
      - name: Login to Azure
        run: |
          azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        run: azd up --no-prompt
        env:
          AZURE_ENV_NAME: ${{ secrets.AZURE_ENV_NAME }}
          AZURE_LOCATION: ${{ secrets.AZURE_LOCATION }}
```

## הפניות לפקודות נפוצות

```bash
# אתחול פרויקט אפליקציית קונטיינר חדשה
azd init --template <template-name>

# פרוס תשתית ואפליקציה
azd up

# פרוס רק קוד אפליקציה (דלג על תשתית)
azd deploy

# ספק רק תשתית
azd provision

# הצג משאבים שפורסמו
azd show

# הזרם יומנים באמצעות azd monitor או Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# נטר אפליקציה
azd monitor --overview

# נקה משאבים
azd down --force --purge
```

## פתרון בעיות

### בעיה: המכולה נכשלת בפתיחה

```bash
# בדוק יומנים באמצעות Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# הצג אירועים של מכולות
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# בדוק מקומית
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### בעיה: אין גישה לנקודת הקצה של אפליקציית המכולה

```bash
# אמת תצורת ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# בדוק אם ingress פנימי מופעל
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### בעיה: בעיות ביצועים

```bash
# בדוק שימוש במשאבים
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# הגדל את המשאבים
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## משאבים ודוגמאות נוספים
- [דוגמה למיקרו-שירותים](./microservices/README.md)
- [דוגמה פשוטה ל-Flash API](./simple-flask-api/README.md)
- [תיעוד Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [גלריית תבניות AZD](https://azure.github.io/awesome-azd/)
- [דוגמאות Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [תבניות Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## תרומה

לתרום דוגמאות חדשות לאפליקציות מכולות:

1. צור תיקיית משנה חדשה עם הדוגמה שלך
2. כלול קבצי `azure.yaml`, `infra/`, ו-`src/` מלאים
3. הוסף קובץ README מקיף עם הוראות פריסה
4. בדוק פריסה עם `azd up`
5. הגש בקשת משיכה

---

**צריך עזרה?** הצטרף לקהילה של [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) לתמיכה ושאלות.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום מבוסס בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדייק, יש להיות מודעים לכך שתרגומים אוטומטיים עלולים לכלול שגיאות או אי דיוקים. המסמך המקורי בשפת המקור מהווה את המקור הסמכותי. למידע קריטי מומלץ לפנות לתרגום מקצועי על ידי אדם. אנו לא נושאים באחריות על כל אי הבנה או פרשנות שגויה הנובעת משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->