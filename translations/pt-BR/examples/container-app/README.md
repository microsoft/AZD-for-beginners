# Exemplos de Implantação de Aplicativos em Contêiner com AZD

Este diretório contém exemplos abrangentes para implantar aplicativos em contêiner no Azure Container Apps usando o Azure Developer CLI (AZD). Esses exemplos demonstram padrões do mundo real, melhores práticas e configurações prontas para produção.

## 📚 Índice

- [Visão Geral](../../../../examples/container-app)
- [Pré-requisitos](../../../../examples/container-app)
- [Exemplos Rápidos](../../../../examples/container-app)
- [Exemplos de Produção](../../../../examples/container-app)
- [Padrões Avançados](../../../../examples/container-app)
- [Melhores Práticas](../../../../examples/container-app)

## Visão Geral

O Azure Container Apps é uma plataforma de contêiner serverless totalmente gerenciada que permite executar microsserviços e aplicativos em contêiner sem gerenciar infraestrutura. Quando combinado com o AZD, você obtém:

- **Implantação Simplificada**: Um único comando implanta contêineres com infraestrutura
- **Escalabilidade Automática**: Escala para zero e escala horizontal com base no tráfego HTTP ou eventos
- **Rede Integrada**: Descoberta de serviços integrada e divisão de tráfego
- **Identidade Gerenciada**: Autenticação segura para recursos do Azure
- **Otimização de Custos**: Pague apenas pelos recursos que usar

## Pré-requisitos

Antes de começar, certifique-se de ter:

```bash
# Verificar instalação do AZD
azd version

# Verificar Azure CLI
az version

# Verificar Docker (para construir imagens personalizadas)
docker --version

# Fazer login no Azure
azd auth login
az login
```

**Recursos do Azure Necessários:**
- Assinatura ativa do Azure
- Permissões para criar grupos de recursos
- Acesso ao ambiente do Container Apps

## Exemplos Rápidos

### 1. API Web Simples (Python Flask)

Implante uma API REST básica com Azure Container Apps.

**Exemplo: API Python Flask**

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

**Etapas de Implantação:**

```bash
# Inicializar a partir do modelo
azd init --template todo-python-mongo

# Provisionar infraestrutura e implantar
azd up

# Testar a implantação
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Principais Recursos:**
- Escalabilidade automática de 0 a 10 réplicas
- Probes de saúde e verificações de vivacidade
- Injeção de variáveis de ambiente
- Integração com Application Insights

### 2. API Node.js Express

Implante um backend Node.js com integração ao MongoDB.

```bash
# Inicializar o template de API do Node.js
azd init --template todo-nodejs-mongo

# Configurar variáveis de ambiente
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Implantar
azd up

# Visualizar logs
azd logs api
```

**Destaques da Infraestrutura:**
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

Implante um aplicativo full-stack com frontend React e backend API.

```bash
# Inicializar o template full-stack
azd init --template todo-csharp-sql-swa-func

# Revisar configuração
cat azure.yaml

# Implantar ambos os serviços
azd up

# Abrir a aplicação
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Exemplos de Produção

### Exemplo 1: Arquitetura de Microsserviços

**Cenário**: Aplicativo de e-commerce com múltiplos microsserviços

**Estrutura de Diretórios:**
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

**Configuração azure.yaml:**
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

**Implantação:**
```bash
# Inicializar projeto
azd init

# Configurar ambiente de produção
azd env new production

# Configurar definições de produção
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Implantar todos os serviços
azd up

# Monitorar implantação
azd monitor --overview
```

### Exemplo 2: Aplicativo em Contêiner com IA

**Cenário**: Aplicativo de chat com integração ao Azure OpenAI

**Arquivo: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Use Identidade Gerenciada para acesso seguro
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # Obtenha a chave OpenAI do Key Vault
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

**Arquivo: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Arquivo: infra/main.bicep**
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

**Comandos de Implantação:**
```bash
# Configurar ambiente
azd init --template ai-chat-app
azd env new dev

# Configurar OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Implantar
azd up

# Testar a API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Exemplo 3: Worker em Segundo Plano com Processamento de Fila

**Cenário**: Sistema de processamento de pedidos com fila de mensagens

**Estrutura de Diretórios:**
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

**Arquivo: src/worker/processor.py**
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
            # Processar pedido
            print(f"Processing order: {message.content}")
            
            # Mensagem completa
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Arquivo: azure.yaml**
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

**Implantação:**
```bash
# Inicializar
azd init

# Implantar com configuração de fila
azd up

# Escalar trabalhador com base no comprimento da fila
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## Padrões Avançados

### Padrão 1: Implantação Blue-Green

```bash
# Criar nova revisão sem tráfego
azd deploy api --revision-suffix blue --no-traffic

# Testar a nova revisão
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Dividir tráfego (20% para azul, 80% para atual)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Transferência total para azul
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Padrão 2: Implantação Canary com AZD

**Arquivo: .azure/dev/config.json**
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

**Script de Implantação:**
```bash
#!/bin/bash
# deploy-canary.sh

# Implantar nova revisão com 10% de tráfego
azd deploy api --revision-mode multiple

# Monitorar métricas
azd monitor --service api --duration 5m

# Aumentar o tráfego gradualmente
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # Esperar 5 minutos
done
```

### Padrão 3: Implantação Multi-Região

**Arquivo: azure.yaml**
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

**Arquivo: infra/multi-region.bicep**
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

**Implantação:**
```bash
# Implantar em todas as regiões
azd up

# Verificar endpoints
azd show --output json | jq '.services.api.endpoints'
```

### Padrão 4: Integração com Dapr

**Arquivo: infra/app/dapr-enabled.bicep**
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

**Código do Aplicativo com Dapr:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # Salvar estado
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

## Melhores Práticas

### 1. Organização de Recursos

```bash
# Use convenções de nomenclatura consistentes
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Marque recursos para rastreamento de custos
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. Melhores Práticas de Segurança

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

### 3. Otimização de Desempenho

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

### 4. Monitoramento e Observabilidade

```bash
# Habilitar o Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Visualizar logs em tempo real
azd logs api --follow

# Monitorar métricas
azd monitor --service api

# Criar alertas
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. Otimização de Custos

```bash
# Escale para zero quando não estiver em uso
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Use instâncias spot para ambientes de desenvolvimento
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Configure alertas de orçamento
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Integração com CI/CD

**Exemplo com GitHub Actions:**
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

## Referência de Comandos Comuns

```bash
# Inicializar novo projeto de aplicativo de contêiner
azd init --template <template-name>

# Implantar infraestrutura e aplicação
azd up

# Implantar apenas o código da aplicação (pular infraestrutura)
azd deploy

# Provisionar apenas infraestrutura
azd provision

# Visualizar recursos implantados
azd show

# Transmitir logs
azd logs <service-name> --follow

# Monitorar aplicação
azd monitor --overview

# Limpar recursos
azd down --force --purge
```

## Solução de Problemas

### Problema: O contêiner não inicia

```bash
# Verificar logs
azd logs api --tail 100

# Visualizar eventos do contêiner
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testar localmente
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problema: Não é possível acessar o endpoint do aplicativo em contêiner

```bash
# Verificar configuração de entrada
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Verificar se a entrada interna está habilitada
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problema: Problemas de desempenho

```bash
# Verificar a utilização de recursos
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Escalar recursos
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Recursos e Exemplos Adicionais
- [Exemplo de Microsserviços](./microservices/README.md)
- [Exemplo de API Flask Simples](./simple-flask-api/README.md)
- [Documentação do Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galeria de Templates AZD](https://azure.github.io/awesome-azd/)
- [Exemplos de Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Templates Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contribuindo

Para contribuir com novos exemplos de aplicativos em contêiner:

1. Crie um novo subdiretório com seu exemplo
2. Inclua arquivos completos `azure.yaml`, `infra/` e `src/`
3. Adicione um README abrangente com instruções de implantação
4. Teste a implantação com `azd up`
5. Envie um pull request

---

**Precisa de Ajuda?** Participe da comunidade [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) para suporte e perguntas.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional feita por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->