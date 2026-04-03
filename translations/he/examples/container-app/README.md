# דוגמאות לפריסת אפליקציות מכולות עם AZD

תיקיה זו מכילה דוגמאות מקיפות לפריסת אפליקציות מכולות ל-Azure Container Apps באמצעות Azure Developer CLI (AZD). דוגמאות אלו ממחישות דגמים מהעולם האמיתי, שיטות עבודה מומלצות, וקונפיגורציות מוכנות לפרודקשן.

## 📚 תוכן עניינים

- [סקירה כללית](#סקירה-כללית)
- [דרישות מוקדמות](#דרישות-מוקדמות)
- [דוגמאות התחלה מהירה](#דוגמאות-התחלה-מהירה)
- [דוגמאות לפרודקשן](#דוגמאות-לפרודקשן)
- [דגמים מתקדמים](#דגמים-מתקדמים)
- [שיטות עבודה מומלצות](#שיטות-עבודה-מומלצות)

## סקירה כללית

Azure Container Apps היא פלטפורמת מכולות מנוהלת מלאה ללא שרתים, שמאפשרת להריץ מיקרו-שירותים ואפליקציות מכולות ללא ניהול תשתית. בשילוב עם AZD, תקבלו:

- **פריסה פשוטה**: פריסה בפקודה אחת של מכולות עם תשתית
- **התאמה אוטומטית של קנה מידה**: התאמת קנה מידה לאפס והרחבה על בסיס תעבורת HTTP או אירועים
- **רשת משולבת**: גילוי שירות ואיזון עומסים מובנים
- **זהות מנוהלת**: אימות מאובטח למשאבי Azure
- **אופטימיזציה של עלויות**: תשלום רק עבור המשאבים בהם אתם משתמשים

## דרישות מוקדמות

לפני שמתחילים, ודאו שיש לכם:

```bash
# בדוק התקנת AZD
azd version

# בדוק את Azure CLI
az version

# בדוק את Docker (לבניית תמונות מותאמות אישית)
docker --version

# אמת עבור פריסות AZD
azd auth login

# אופציונלי: היכנס ל-Azure CLI אם אתה מתכנן להריץ פקודות az ישירות
az login
```

**משאבי Azure דרושים:**
- מנוי Azure פעיל
- הרשאות ליצירת קבוצת משאבים
- גישה לסביבת Container Apps

## דוגמאות התחלה מהירה

### 1. Web API פשוט (Python Flask)

פריסת REST API בסיסי עם Azure Container Apps.

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

**שלבי הפריסה:**

```bash
# אתחול מהתבנית
azd init --template todo-python-mongo

# הפעלת תשתית ופריסה
azd up

# בדוק את הפריסה
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**תכונות עיקריות:**
- התאמה אוטומטית של קנה מידה מ-0 עד 10 מופעים
- בדיקות בריאות ובדיקות קיימות
- הזרקת משתני סביבה
- אינטגרציה עם Application Insights

### 2. Node.js Express API

פריסת Backend ב-Node.js עם אינטגרציה ל-MongoDB.

```bash
# לאתחל תבנית API של Node.js
azd init --template todo-nodejs-mongo

# להגדיר משתני סביבה
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# לפרוס
azd up

# לצפות ביומנים דרך Azure Monitor
azd monitor --logs
```

**הדגשים תשתיתיים:**
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

### 3. Frontend סטטי + Backend API

פריסת אפליקציית Full-stack עם React כ-Frontend ו-API כ-Backend.

```bash
# אתחל תבנית פול-סטאק
azd init --template todo-csharp-sql-swa-func

# בדוק את ההגדרות
cat azure.yaml

# פרוס את שני השירותים
azd up

# פתח את האפליקציה
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## דוגמאות לפרודקשן

### דוגמה 1: ארכיטקטורת מיקרו-שירותים

**תרחיש**: אפליקציית e-commerce עם מיקרו-שירותים מרובים

**מבנה התיקיות:**
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

**קובץ azure.yaml:**
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
# לאתחל את הפרויקט
azd init

# להגדיר סביבת ייצור
azd env new production

# לתצבר את הגדרות הייצור
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# לפרוס את כל השירותים
azd up

# לנטר את הפריסה
azd monitor --overview
```

### דוגמה 2: אפליקציית מכולות עם בינה מלאכותית

**תרחיש**: אפליקציית צ׳אט מבוססת בינה מלאכותית עם אינטגרציה ל-Microsoft Foundry Models

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
    
    # קבל את מפתח OpenAI מ-Key Vault
    openai_key = client.get_secret("openai-api-key").value
    openai.api_key = openai_key
    
    response = openai.ChatCompletion.create(
        model="gpt-4.1",
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
# הגדר סביבה
azd init --template ai-chat-app
azd env new dev

# הגדר את OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# פרוס
azd up

# בדוק את ה-API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### דוגמה 3: עובד רקע עם עיבוד תור הודעות

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
            # עיבוד הזמנה
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

# פרוס עם תצורת תור
azd up

# הרחב את העובד בהתאם לאורך התור
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## דגמים מתקדמים

### דגם 1: פריסה Blue-Green

```bash
# צור גרסה חדשה ללא תנועה
azd deploy api --revision-suffix blue --no-traffic

# בדוק את הגרסה החדשה
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# חלק תנועה (20% לכחול, 80% לנוכחי)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# מעבר מלא לכחול
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### דגם 2: פריסת Canary עם AZD

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

# לעקוב אחרי מדדים
azd monitor --service api --duration 5m

# להגדיל את התנועה בהדרגה
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # להמתין 5 דקות
done
```

### דגם 3: פריסה מרובה אזורים

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
# הפריסה לכל האזורים
azd up

# אמת נקודות קצה
azd show --output json | jq '.services.api.endpoints'
```

### דגם 4: אינטגרציית Dapr

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
# השתמש בשמות עקביים
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

# צפייה ביומנים בזמן אמת
azd monitor --logs
# או השתמש ב-Azure CLI עבור Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# ניטור מדדים
azd monitor --live

# יצירת התראות
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. אופטימיזציה של עלויות

```bash
# התאם לגודל אפס כשלא בשימוש
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# השתמש במופעים ספוט לסביבות פיתוח
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# הגדר התראות תקציב
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. אינטגרציית CI/CD

**דוגמת GitHub Actions:**
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

## הפניות לפקודות שכיחות

```bash
# אתחל פרויקט אפליקציית מכולות חדשה
azd init --template <template-name>

# פרוס תשתית ואפליקציה
azd up

# פרוס רק קוד אפליקציה (דלג על תשתית)
azd deploy

# ספק רק תשתית
azd provision

# הצג משאבים שפרסת
azd show

# זרם יומני רישום באמצעות azd monitor או Azure CLI
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# נטר את האפליקציה
azd monitor --overview

# נקה משאבים
azd down --force --purge
```

## פתרון תקלות

### בעיה: המכולה לא מצליחה להידלק

```bash
# בדוק יומני רישום באמצעות Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# הצג אירועי מיכל
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# בדוק מקומית
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### בעיה: לא מצליחים לגשת לנקודת הקצה של אפליקציית המכולה

```bash
# אמת את תצורת הכניסה
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# בדוק אם הכניסה הפנימית מופעלת
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
- [דוגמת Flash API פשוטה](./simple-flask-api/README.md)
- [תיעוד Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [גלריית תבניות AZD](https://azure.github.io/awesome-azd/)
- [דוגמאות Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [תבניות Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## תרומה

כדי לתרום דוגמאות חדשות לאפליקציות מכולות:

1. צרו תיקיית משנה חדשה עם הדוגמה שלכם
2. כללו את הקבצים המלאים `azure.yaml`, `infra/`, ו-`src/`
3. הוסיפו README מפורט עם הוראות פריסה
4. בדקו את הפריסה עם `azd up`
5. הגישו Pull Request

---

**צריך עזרה?** הצטרפו לקהילת [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) לתמיכה ושאלות.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:  
מסמך זה תורגם באמצעות שירות תרגום בינה מלאכותית [Co-op Translator](https://github.com/Azure/co-op-translator). בעוד שאנו שואפים לדייק, יש לקחת בחשבון כי תרגומים אוטומטיים עלולים להכיל שגיאות או אי דיוקים. יש להעלות את המסמך המקורי בשפת המקור כמקור הסמכותי. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי אדם. איננו אחראים על כל אי הבנות או פרשנויות שגויות הנובעות משימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->