<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-20T01:36:36+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "pl"
}
-->
# Przykłady wdrażania aplikacji kontenerowych z AZD

Ten katalog zawiera kompleksowe przykłady wdrażania aplikacji kontenerowych do Azure Container Apps za pomocą Azure Developer CLI (AZD). Przykłady te pokazują rzeczywiste wzorce, najlepsze praktyki i konfiguracje gotowe do produkcji.

## 📚 Spis treści

- [Przegląd](../../../../examples/container-app)
- [Wymagania wstępne](../../../../examples/container-app)
- [Przykłady szybkiego startu](../../../../examples/container-app)
- [Przykłady produkcyjne](../../../../examples/container-app)
- [Zaawansowane wzorce](../../../../examples/container-app)
- [Najlepsze praktyki](../../../../examples/container-app)

## Przegląd

Azure Container Apps to w pełni zarządzana platforma kontenerowa typu serverless, która umożliwia uruchamianie mikrousług i aplikacji kontenerowych bez zarządzania infrastrukturą. W połączeniu z AZD otrzymujesz:

- **Uproszczone wdrażanie**: Jedno polecenie wdraża kontenery wraz z infrastrukturą
- **Automatyczne skalowanie**: Skalowanie do zera i skalowanie w górę w oparciu o ruch HTTP lub zdarzenia
- **Zintegrowana sieć**: Wbudowane wykrywanie usług i podział ruchu
- **Zarządzana tożsamość**: Bezpieczne uwierzytelnianie do zasobów Azure
- **Optymalizacja kosztów**: Płacisz tylko za używane zasoby

## Wymagania wstępne

Przed rozpoczęciem upewnij się, że masz:

```bash
# Sprawdź instalację AZD
azd version

# Sprawdź Azure CLI
az version

# Sprawdź Docker (do budowania niestandardowych obrazów)
docker --version

# Zaloguj się do Azure
azd auth login
az login
```

**Wymagane zasoby Azure:**
- Aktywna subskrypcja Azure
- Uprawnienia do tworzenia grup zasobów
- Dostęp do środowiska Container Apps

## Przykłady szybkiego startu

### 1. Proste API Web (Python Flask)

Wdróż podstawowe REST API z Azure Container Apps.

**Przykład: Python Flask API**

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

**Kroki wdrażania:**

```bash
# Zainicjuj z szablonu
azd init --template todo-python-mongo

# Przygotuj infrastrukturę i wdrożenie
azd up

# Przetestuj wdrożenie
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Kluczowe funkcje:**
- Automatyczne skalowanie od 0 do 10 replik
- Proby zdrowotne i sprawdzanie żywotności
- Wstrzykiwanie zmiennych środowiskowych
- Integracja z Application Insights

### 2. API Node.js Express

Wdróż backend Node.js z integracją MongoDB.

```bash
# Zainicjuj szablon API Node.js
azd init --template todo-nodejs-mongo

# Skonfiguruj zmienne środowiskowe
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Wdróż
azd up

# Wyświetl logi
azd logs api
```

**Najważniejsze elementy infrastruktury:**
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

### 3. Statyczny frontend + backend API

Wdróż aplikację full-stack z frontendem React i backendem API.

```bash
# Zainicjuj szablon full-stack
azd init --template todo-csharp-sql-swa-func

# Przejrzyj konfigurację
cat azure.yaml

# Wdróż oba serwisy
azd up

# Otwórz aplikację
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Przykłady produkcyjne

### Przykład 1: Architektura mikrousług

**Scenariusz**: Aplikacja e-commerce z wieloma mikrousługami

**Struktura katalogów:**
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

**Konfiguracja azure.yaml:**
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

**Wdrażanie:**
```bash
# Zainicjuj projekt
azd init

# Ustaw środowisko produkcyjne
azd env new production

# Skonfiguruj ustawienia produkcyjne
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Wdróż wszystkie usługi
azd up

# Monitoruj wdrożenie
azd monitor --overview
```

### Przykład 2: Aplikacja kontenerowa z AI

**Scenariusz**: Aplikacja czatu AI z integracją Azure OpenAI

**Plik: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Użyj zarządzanej tożsamości dla bezpiecznego dostępu
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Pobierz klucz OpenAI z Key Vault
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

**Plik: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Plik: infra/main.bicep**
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

**Polecenia wdrażania:**
```bash
# Ustaw środowisko
azd init --template ai-chat-app
azd env new dev

# Skonfiguruj OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Wdróż
azd up

# Przetestuj API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Przykład 3: Pracownik w tle z przetwarzaniem kolejki

**Scenariusz**: System przetwarzania zamówień z kolejką wiadomości

**Struktura katalogów:**
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

**Plik: src/worker/processor.py**
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
            # Przetwórz zamówienie
            print(f"Processing order: {message.content}")
            
            # Ukończ wiadomość
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Plik: azure.yaml**
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

**Wdrażanie:**
```bash
# Inicjalizuj
azd init

# Wdróż z konfiguracją kolejki
azd up

# Skaluj pracownika w oparciu o długość kolejki
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Zaawansowane wzorce

### Wzorzec 1: Wdrażanie Blue-Green

```bash
# Utwórz nową wersję bez ruchu
azd deploy api --revision-suffix blue --no-traffic

# Przetestuj nową wersję
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Podziel ruch (20% na niebieski, 80% na obecny)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Pełne przełączenie na niebieski
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Wzorzec 2: Wdrażanie Canary z AZD

**Plik: .azure/dev/config.json**
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

**Skrypt wdrażania:**
```bash
#!/bin/bash
# deploy-canary.sh

# Wdróż nową wersję z 10% ruchem
azd deploy api --revision-mode multiple

# Monitoruj metryki
azd monitor --service api --duration 5m

# Stopniowo zwiększaj ruch
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Poczekaj 5 minut
done
```

### Wzorzec 3: Wdrażanie wieloregionowe

**Plik: azure.yaml**
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

**Plik: infra/multi-region.bicep**
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

**Wdrażanie:**
```bash
# Wdróż we wszystkich regionach
azd up

# Zweryfikuj punkty końcowe
azd show --output json | jq '.services.api.endpoints'
```

### Wzorzec 4: Integracja z Dapr

**Plik: infra/app/dapr-enabled.bicep**
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

**Kod aplikacji z Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Zapisz stan
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Opublikuj zdarzenie
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Najlepsze praktyki

### 1. Organizacja zasobów

```bash
# Używaj spójnych konwencji nazewnictwa
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Oznacz zasoby do śledzenia kosztów
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Najlepsze praktyki bezpieczeństwa

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

### 3. Optymalizacja wydajności

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

### 4. Monitorowanie i obserwowalność

```bash
# Włącz Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Przeglądaj logi w czasie rzeczywistym
azd logs api --follow

# Monitoruj metryki
azd monitor --service api

# Twórz alerty
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Optymalizacja kosztów

```bash
# Skaluj do zera, gdy nie jest używane
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Używaj instancji spot dla środowisk deweloperskich
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Skonfiguruj alerty budżetowe
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Integracja CI/CD

**Przykład GitHub Actions:**
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

## Referencje do często używanych poleceń

```bash
# Zainicjuj nowy projekt aplikacji kontenerowej
azd init --template <template-name>

# Wdróż infrastrukturę i aplikację
azd up

# Wdróż tylko kod aplikacji (pomiń infrastrukturę)
azd deploy

# Przygotuj tylko infrastrukturę
azd provision

# Wyświetl wdrożone zasoby
azd show

# Strumieniuj logi
azd logs <service-name> --follow

# Monitoruj aplikację
azd monitor --overview

# Usuń zasoby
azd down --force --purge
```

## Rozwiązywanie problemów

### Problem: Kontener nie uruchamia się

```bash
# Sprawdź logi
azd logs api --tail 100

# Wyświetl zdarzenia kontenera
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Przetestuj lokalnie
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problem: Brak dostępu do punktu końcowego aplikacji kontenerowej

```bash
# Zweryfikuj konfigurację ingress
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Sprawdź, czy wewnętrzny ingress jest włączony
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problem: Problemy z wydajnością

```bash
# Sprawdź wykorzystanie zasobów
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Skaluj zasoby w górę
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Dodatkowe zasoby i przykłady
- [Przykład mikrousług](./microservices/README.md)
- [Przykład prostego Flash API](./simple-flask-api/README.md)
- [Dokumentacja Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galeria szablonów AZD](https://azure.github.io/awesome-azd/)
- [Przykłady Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Szablony Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Współtworzenie

Aby dodać nowe przykłady aplikacji kontenerowych:

1. Utwórz nowy podkatalog z przykładem
2. Dołącz kompletne pliki `azure.yaml`, `infra/` i `src/`
3. Dodaj szczegółowy README z instrukcjami wdrażania
4. Przetestuj wdrażanie za pomocą `azd up`
5. Złóż pull request

---

**Potrzebujesz pomocy?** Dołącz do społeczności [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) w celu uzyskania wsparcia i zadawania pytań.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->