# Ejemplos de Despliegue de Aplicaciones en Contenedores con AZD

Este directorio contiene ejemplos completos para desplegar aplicaciones en contenedores en Azure Container Apps utilizando Azure Developer CLI (AZD). Estos ejemplos demuestran patrones del mundo real, mejores prácticas y configuraciones listas para producción.

## 📚 Tabla de Contenidos

- [Descripción General](../../../../examples/container-app)
- [Requisitos Previos](../../../../examples/container-app)
- [Ejemplos de Inicio Rápido](../../../../examples/container-app)
- [Ejemplos de Producción](../../../../examples/container-app)
- [Patrones Avanzados](../../../../examples/container-app)
- [Mejores Prácticas](../../../../examples/container-app)

## Descripción General

Azure Container Apps es una plataforma de contenedores sin servidor completamente administrada que te permite ejecutar microservicios y aplicaciones en contenedores sin gestionar infraestructura. Combinado con AZD, obtienes:

- **Despliegue Simplificado**: Un solo comando despliega contenedores con infraestructura
- **Escalado Automático**: Escala a cero y escala hacia afuera basado en tráfico HTTP o eventos
- **Red Integrada**: Descubrimiento de servicios y división de tráfico integrados
- **Identidad Administrada**: Autenticación segura a recursos de Azure
- **Optimización de Costos**: Paga solo por los recursos que utilizas

## Requisitos Previos

Antes de comenzar, asegúrate de tener:

```bash
# Verificar la instalación de AZD
azd version

# Verificar Azure CLI
az version

# Verificar Docker (para construir imágenes personalizadas)
docker --version

# Iniciar sesión en Azure
azd auth login
az login
```

**Recursos de Azure Requeridos:**
- Suscripción activa de Azure
- Permisos para crear grupos de recursos
- Acceso al entorno de Container Apps

## Ejemplos de Inicio Rápido

### 1. API Web Simple (Python Flask)

Despliega una API REST básica con Azure Container Apps.

**Ejemplo: API Python Flask**

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

**Pasos de Despliegue:**

```bash
# Inicializar desde la plantilla
azd init --template todo-python-mongo

# Proveer infraestructura y desplegar
azd up

# Probar el despliegue
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Características Clave:**
- Escalado automático de 0 a 10 réplicas
- Comprobaciones de salud y de estado
- Inyección de variables de entorno
- Integración con Application Insights

### 2. API Node.js Express

Despliega un backend Node.js con integración MongoDB.

```bash
# Inicializar la plantilla de API de Node.js
azd init --template todo-nodejs-mongo

# Configurar variables de entorno
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Desplegar
azd up

# Ver registros
azd logs api
```

**Aspectos Destacados de la Infraestructura:**
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

### 3. Frontend Estático + Backend API

Despliega una aplicación full-stack con frontend React y backend API.

```bash
# Inicializar plantilla de pila completa
azd init --template todo-csharp-sql-swa-func

# Revisar configuración
cat azure.yaml

# Desplegar ambos servicios
azd up

# Abrir la aplicación
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Ejemplos de Producción

### Ejemplo 1: Arquitectura de Microservicios

**Escenario**: Aplicación de comercio electrónico con múltiples microservicios

**Estructura de Directorios:**
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

**Configuración azure.yaml:**
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

**Despliegue:**
```bash
# Inicializar proyecto
azd init

# Establecer entorno de producción
azd env new production

# Configurar ajustes de producción
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Desplegar todos los servicios
azd up

# Monitorear el despliegue
azd monitor --overview
```

### Ejemplo 2: Aplicación en Contenedor Potenciada por IA

**Escenario**: Aplicación de chat con integración de Azure OpenAI

**Archivo: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Usar Identidad Administrada para acceso seguro
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Obtener la clave de OpenAI desde el Key Vault
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

**Archivo: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Archivo: infra/main.bicep**
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

**Comandos de Despliegue:**
```bash
# Configurar el entorno
azd init --template ai-chat-app
azd env new dev

# Configurar OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Desplegar
azd up

# Probar la API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Ejemplo 3: Trabajador en Segundo Plano con Procesamiento de Colas

**Escenario**: Sistema de procesamiento de pedidos con cola de mensajes

**Estructura de Directorios:**
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

**Archivo: src/worker/processor.py**
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
            # Procesar pedido
            print(f"Processing order: {message.content}")
            
            # Mensaje completo
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Archivo: azure.yaml**
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

**Despliegue:**
```bash
# Inicializar
azd init

# Implementar con configuración de cola
azd up

# Escalar trabajador basado en la longitud de la cola
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Patrones Avanzados

### Patrón 1: Despliegue Blue-Green

```bash
# Crear nueva revisión sin tráfico
azd deploy api --revision-suffix blue --no-traffic

# Probar la nueva revisión
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Dividir el tráfico (20% a azul, 80% al actual)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Cambio completo a azul
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Patrón 2: Despliegue Canary con AZD

**Archivo: .azure/dev/config.json**
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

**Script de Despliegue:**
```bash
#!/bin/bash
# deploy-canary.sh

# Implementar nueva revisión con 10% de tráfico
azd deploy api --revision-mode multiple

# Monitorear métricas
azd monitor --service api --duration 5m

# Incrementar el tráfico gradualmente
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Esperar 5 minutos
done
```

### Patrón 3: Despliegue Multi-Región

**Archivo: azure.yaml**
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

**Archivo: infra/multi-region.bicep**
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

**Despliegue:**
```bash
# Desplegar en todas las regiones
azd up

# Verificar puntos finales
azd show --output json | jq '.services.api.endpoints'
```

### Patrón 4: Integración con Dapr

**Archivo: infra/app/dapr-enabled.bicep**
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

**Código de Aplicación con Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Guardar estado
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # Publicar evento
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## Mejores Prácticas

### 1. Organización de Recursos

```bash
# Usar convenciones de nomenclatura consistentes
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Etiquetar recursos para el seguimiento de costos
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Mejores Prácticas de Seguridad

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

### 3. Optimización del Rendimiento

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

### 4. Monitoreo y Observabilidad

```bash
# Habilitar Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Ver registros en tiempo real
azd logs api --follow

# Monitorear métricas
azd monitor --service api

# Crear alertas
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Optimización de Costos

```bash
# Escalar a cero cuando no esté en uso
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Usar instancias spot para entornos de desarrollo
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Configurar alertas de presupuesto
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Integración CI/CD

**Ejemplo con GitHub Actions:**
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

## Referencia de Comandos Comunes

```bash
# Inicializar nuevo proyecto de aplicación de contenedor
azd init --template <template-name>

# Desplegar infraestructura y aplicación
azd up

# Desplegar solo el código de la aplicación (omitir infraestructura)
azd deploy

# Proveer solo infraestructura
azd provision

# Ver recursos desplegados
azd show

# Transmitir registros
azd logs <service-name> --follow

# Monitorear aplicación
azd monitor --overview

# Limpiar recursos
azd down --force --purge
```

## Resolución de Problemas

### Problema: El contenedor no se inicia

```bash
# Verificar registros
azd logs api --tail 100

# Ver eventos del contenedor
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Probar localmente
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problema: No se puede acceder al endpoint de la aplicación en contenedor

```bash
# Verificar la configuración de ingreso
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Comprobar si el ingreso interno está habilitado
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problema: Problemas de rendimiento

```bash
# Verificar la utilización de recursos
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Escalar los recursos
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Recursos y Ejemplos Adicionales
- [Ejemplo de Microservicios](./microservices/README.md)
- [Ejemplo de API Simple Flask](./simple-flask-api/README.md)
- [Documentación de Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galería de Plantillas AZD](https://azure.github.io/awesome-azd/)
- [Ejemplos de Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Plantillas Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contribuir

Para contribuir con nuevos ejemplos de aplicaciones en contenedores:

1. Crea un nuevo subdirectorio con tu ejemplo
2. Incluye archivos completos `azure.yaml`, `infra/` y `src/`
3. Agrega un README completo con instrucciones de despliegue
4. Prueba el despliegue con `azd up`
5. Envía una solicitud de extracción (pull request)

---

**¿Necesitas Ayuda?** Únete a la comunidad [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) para soporte y preguntas.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->