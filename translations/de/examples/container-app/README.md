# Container-App-Bereitstellungsbeispiele mit AZD

Dieses Verzeichnis enthält umfassende Beispiele für die Bereitstellung containerisierter Anwendungen in Azure Container Apps mithilfe der Azure Developer CLI (AZD). Diese Beispiele zeigen praxisnahe Muster, bewährte Verfahren und produktionsreife Konfigurationen.

## 📚 Table of Contents

- [Overview](../../../../examples/container-app)
- [Prerequisites](../../../../examples/container-app)
- [Quick Start Examples](../../../../examples/container-app)
- [Production Examples](../../../../examples/container-app)
- [Advanced Patterns](../../../../examples/container-app)
- [Best Practices](../../../../examples/container-app)

## Overview

Azure Container Apps ist eine vollständig verwaltete serverlose Containerplattform, die es ermöglicht, Microservices und containerisierte Anwendungen zu betreiben, ohne die Infrastruktur zu verwalten. In Kombination mit AZD erhalten Sie:

- **Vereinfachte Bereitstellung**: Ein einzelner Befehl stellt Container zusammen mit der Infrastruktur bereit
- **Automatische Skalierung**: Skalierung auf null und Ausweitung basierend auf HTTP-Verkehr oder Ereignissen
- **Integrierte Netzwerkfunktionen**: Integrierte Service-Erkennung und Verkehrsteilung
- **Verwaltete Identität**: Sichere Authentifizierung zu Azure-Ressourcen
- **Kostenoptimierung**: Bezahlen Sie nur für die Ressourcen, die Sie nutzen

## Prerequisites

Bevor Sie beginnen, stellen Sie sicher, dass Sie Folgendes haben:

```bash
# AZD-Installation überprüfen
azd version

# Azure CLI überprüfen
az version

# Docker überprüfen (zum Erstellen benutzerdefinierter Images)
docker --version

# Bei Azure anmelden
azd auth login
az login
```

**Erforderliche Azure-Ressourcen:**
- Aktives Azure-Abonnement
- Berechtigung zur Erstellung von Ressourcengruppen
- Zugriff auf Container Apps-Umgebung

## Quick Start Examples

### 1. Simple Web API (Python Flask)

Stellt eine einfache REST-API mit Azure Container Apps bereit.

**Beispiel: Python Flask-API**

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

# Infrastruktur bereitstellen und deployen
azd up

# Die Bereitstellung testen
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Hauptmerkmale:**
- Auto-Skalierung von 0 auf 10 Replikate
- Gesundheitsprüfungen und Liveness-Checks
- Einfügen von Umgebungsvariablen
- Integration mit Application Insights

### 2. Node.js Express API

Stellen Sie ein Node.js-Backend mit MongoDB-Integration bereit.

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

### 3. Static Frontend + API Backend

Stellen Sie eine Full-Stack-Anwendung mit React-Frontend und API-Backend bereit.

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

**Szenario**: KI-Chat-Anwendung mit Integration von Microsoft Foundry Models

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
    
    # OpenAI-Schlüssel aus dem Key Vault abrufen
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

**Szenario**: Auftragsverarbeitungssystem mit Nachrichtenwarteschlange

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
            # Auftrag verarbeiten
            print(f"Processing order: {message.content}")
            
            # Nachricht abschließen
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

# Worker basierend auf der Warteschlangenlänge skalieren
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
# Neue Revision ohne Datenverkehr erstellen
azd deploy api --revision-suffix blue --no-traffic

# Neue Revision testen
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Traffic aufteilen (20% auf blue, 80% auf die aktuelle Version)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Vollständige Umstellung auf blue
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

# Neue Revision mit 10 % des Traffics bereitstellen
azd deploy api --revision-mode multiple

# Metriken überwachen
azd monitor --service api --duration 5m

# Traffic schrittweise erhöhen
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5 Minuten warten
done
```

### Muster 3: Multi-Region-Bereitstellung

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
# In alle Regionen ausrollen
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

**Anwendungscode mit Dapr:**
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

## Best Practices

### 1. Ressourcenorganisation

```bash
# Verwenden Sie konsistente Namenskonventionen
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Ressourcen zur Kostenverfolgung kennzeichnen
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Sicherheits-Best Practices

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
# Bei Nichtgebrauch auf Null skalieren
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

## Common Commands Reference

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

## Troubleshooting

### Problem: Container startet nicht

```bash
# Protokolle mit der Azure CLI überprüfen
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Containerereignisse anzeigen
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Lokal testen
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problem: Zugriff auf Container-App-Endpunkt nicht möglich

```bash
# Überprüfen Sie die Ingress-Konfiguration
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Überprüfen Sie, ob interner Ingress aktiviert ist
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problem: Leistungsprobleme

```bash
# Ressourcenauslastung prüfen
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

## Additional Resources and Examples
- [Microservices Example](./microservices/README.md)
- [Simple Flash API Example](./simple-flask-api/README.md)
- [Azure Container Apps-Dokumentation](https://learn.microsoft.com/azure/container-apps/)
- [AZD-Vorlagengalerie](https://azure.github.io/awesome-azd/)
- [Container-Apps-Beispiele](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep-Vorlagen](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contributing

Um neue Container-App-Beispiele beizutragen:

1. Erstellen Sie ein neues Unterverzeichnis mit Ihrem Beispiel
2. Fügen Sie vollständige `azure.yaml`-, `infra/`- und `src/`-Dateien bei
3. Fügen Sie eine umfassende README mit Bereitstellungsanweisungen hinzu
4. Testen Sie die Bereitstellung mit `azd up`
5. Reichen Sie einen Pull Request ein

---

**Brauchen Sie Hilfe?** Treten Sie der [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) Community für Unterstützung und Fragen bei.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst Co‑op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Bei kritischen Informationen empfehlen wir eine professionelle menschliche Übersetzung. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->