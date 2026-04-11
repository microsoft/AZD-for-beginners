# Container App Deployment Examples with AZD

This directory contains comprehensive examples for deploying containerized applications to Azure Container Apps using Azure Developer CLI (AZD). These examples demonstrate real-world patterns, best practices, and production-ready configurations.

## 📚 Inhaltsverzeichnis

- [Überblick](#overview)
- [Voraussetzungen](#prerequisites)
- [Schnellstart-Beispiele](#quick-start-examples)
- [Produktionsbeispiele](#production-examples)
- [Erweiterte Muster](#advanced-patterns)
- [Bewährte Verfahren](#bewährte-verfahren)

## Overview

Azure Container Apps is a fully managed serverless container platform that enables you to run microservices and containerized applications without managing infrastructure. When combined with AZD, you get:

- **Vereinfachte Bereitstellung**: Single command deploys containers with infrastructure
- **Automatische Skalierung**: Scale to zero and scale out based on HTTP traffic or events
- **Integriertes Networking**: Built-in service discovery and traffic splitting
- **Managed Identity**: Secure authentication to Azure resources
- **Kostenoptimierung**: Pay only for resources you use

## Prerequisites

Before getting started, ensure you have:

```bash
# Überprüfen Sie die AZD-Installation
azd version

# Überprüfen Sie die Azure CLI
az version

# Überprüfen Sie Docker (zum Erstellen benutzerdefinierter Images)
docker --version

# Für AZD-Bereitstellungen authentifizieren
azd auth login

# Optional: Melden Sie sich bei der Azure CLI an, wenn Sie planen, az-Befehle direkt auszuführen.
az login
```

**Erforderliche Azure-Ressourcen:**
- Aktives Azure-Abonnement
- Berechtigungen zum Erstellen von Ressourcengruppen
- Zugriff auf die Container Apps-Umgebung

## Quick Start Examples

### 1. Einfache Web-API (Python Flask)

Deploy a basic REST API with Azure Container Apps.

**Beispiel: Python Flask API**

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

**Bereitstellungsschritte:**

```bash
# Aus Vorlage initialisieren
azd init --template todo-python-mongo

# Infrastruktur bereitstellen und ausrollen
azd up

# Die Bereitstellung testen
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Hauptmerkmale:**
- Auto-Skalierung von 0 bis 10 Replikaten
- Gesundheitsprüfungen und Liveness-Prüfungen
- Injektion von Umgebungsvariablen
- Integration mit Application Insights

### 2. Node.js Express-API

Deploy a Node.js backend with MongoDB integration.

```bash
# Node.js-API-Vorlage initialisieren
azd init --template todo-nodejs-mongo

# Umgebungsvariablen konfigurieren
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Bereitstellen
azd up

# Protokolle über Azure Monitor anzeigen
azd monitor --logs
```

**Infrastruktur-Highlights:**
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

### 3. Statisches Frontend + API-Backend

Deploy a full-stack application with React frontend and API backend.

```bash
# Full-Stack-Vorlage initialisieren
azd init --template todo-csharp-sql-swa-func

# Konfiguration überprüfen
cat azure.yaml

# Beide Dienste bereitstellen
azd up

# Anwendung öffnen
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Production Examples

### Beispiel 1: Microservices-Architektur

**Szenario**: E-Commerce-Anwendung mit mehreren Microservices

**Verzeichnisstruktur:**
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

**azure.yaml-Konfiguration:**
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

**Bereitstellung:**
```bash
# Projekt initialisieren
azd init

# Produktionsumgebung festlegen
azd env new production

# Produktionseinstellungen konfigurieren
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Alle Dienste bereitstellen
azd up

# Bereitstellung überwachen
azd monitor --overview
```

### Beispiel 2: KI-gestützte Container-App

**Szenario**: KI-Chat-Anwendung mit Microsoft Foundry Models Integration

**Datei: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Verwenden Sie Managed Identity für sicheren Zugriff
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Holen Sie den OpenAI-Schlüssel aus dem Key Vault
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

**Datei: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Datei: infra/main.bicep**
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

**Bereitstellungsbefehle:**
```bash
# Umgebung einrichten
azd init --template ai-chat-app
azd env new dev

# OpenAI konfigurieren
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4.1"

# Bereitstellen
azd up

# API testen
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Beispiel 3: Hintergrund-Worker mit Warteschlangenverarbeitung

**Szenario**: Bestellverarbeitungssystem mit Nachrichtenwarteschlange

**Verzeichnisstruktur:**
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

**Datei: src/worker/processor.py**
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
            # Bestellung verarbeiten
            print(f"Processing order: {message.content}")
            
            # Nachricht vervollständigen
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Datei: azure.yaml**
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

**Bereitstellung:**
```bash
# Initialisieren
azd init

# Mit Warteschlangenkonfiguration bereitstellen
azd up

# Worker anhand der Warteschlangenlänge skalieren
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Advanced Patterns

### Muster 1: Blue-Green-Bereitstellung

```bash
# Neue Revision erstellen ohne Traffic
azd deploy api --revision-suffix blue --no-traffic

# Die neue Revision testen
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Traffic aufteilen (20% auf blau, 80% auf die aktuelle Revision)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Vollständige Umstellung auf blau
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Muster 2: Canary-Bereitstellung mit AZD

**Datei: .azure/dev/config.json**
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

**Bereitstellungsskript:**
```bash
#!/bin/bash
# deploy-canary.sh

# Neue Revision mit 10 % des Verkehrs bereitstellen
azd deploy api --revision-mode multiple

# Metriken überwachen
azd monitor --service api --duration 5m

# Den Verkehr schrittweise erhöhen
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 Minuten warten
done
```

### Muster 3: Mehrregionale Bereitstellung

**Datei: azure.yaml**
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

**Datei: infra/multi-region.bicep**
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

**Bereitstellung:**
```bash
# In alle Regionen bereitstellen
azd up

# Endpunkte überprüfen
azd show --output json | jq '.services.api.endpoints'
```

### Muster 4: Dapr-Integration

**Datei: infra/app/dapr-enabled.bicep**
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

**Anwendungs-Code mit Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Zustand speichern
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Ereignis veröffentlichen
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Bewährte Verfahren

### 1. Ressourcenorganisation

```bash
# Verwenden Sie konsistente Namenskonventionen
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Markieren Sie Ressourcen zur Kostenverfolgung
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Sicherheit — Best Practices

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

### 3. Leistungsoptimierung

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

### 4. Überwachung und Beobachtbarkeit

```bash
# Application Insights aktivieren
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Protokolle in Echtzeit anzeigen
azd monitor --logs
# Oder verwenden Sie die Azure CLI für Container-Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Metriken überwachen
azd monitor --live

# Warnungen erstellen
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Kostenoptimierung

```bash
# Bei Nichtgebrauch auf null skalieren
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Spot-Instanzen für Entwicklungsumgebungen verwenden
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Budgetwarnungen einrichten
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD-Integration

**GitHub Actions-Beispiel:**
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

## Übersicht gängiger Befehle

```bash
# Neues Container-App-Projekt initialisieren
azd init --template <template-name>

# Infrastruktur und Anwendung bereitstellen
azd up

# Nur Anwendungscode bereitstellen (Infrastruktur überspringen)
azd deploy

# Nur Infrastruktur bereitstellen
azd provision

# Bereitgestellte Ressourcen anzeigen
azd show

# Protokolle mit azd monitor oder der Azure CLI streamen
azd monitor --logs
# az containerapp logs show --name <service-name> --resource-group <rg-name> --follow

# Anwendung überwachen
azd monitor --overview

# Ressourcen bereinigen
azd down --force --purge
```

## Fehlerbehebung

### Problem: Container startet nicht

```bash
# Protokolle mit der Azure CLI überprüfen
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Container-Ereignisse anzeigen
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Lokal testen
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problem: Zugriff auf den Endpunkt der Container-App nicht möglich

```bash
# Überprüfe die Ingress-Konfiguration
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Prüfe, ob interner Ingress aktiviert ist
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problem: Leistungsprobleme

```bash
# Ressourcenauslastung überprüfen
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Ressourcen hochskalieren
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Weitere Ressourcen und Beispiele
- [Microservices-Beispiel](./microservices/README.md)
- [Einfaches Flash-API-Beispiel](./simple-flask-api/README.md)
- [Azure Container Apps Dokumentation](https://learn.microsoft.com/azure/container-apps/)
- [AZD-Templates-Galerie](https://azure.github.io/awesome-azd/)
- [Container Apps-Beispiele](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep-Vorlagen](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Beitragen

Um neue Container-App-Beispiele beizutragen:

1. Erstellen Sie ein neues Unterverzeichnis mit Ihrem Beispiel
2. Fügen Sie vollständige `azure.yaml`, `infra/` und `src/`-Dateien bei
3. Fügen Sie ein umfassendes README mit Bereitstellungsanweisungen hinzu
4. Testen Sie die Bereitstellung mit `azd up`
5. Reichen Sie einen Pull Request ein

---

**Brauchen Sie Hilfe?** Treten Sie der [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)-Community für Unterstützung und Fragen bei.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in der Ausgangssprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->