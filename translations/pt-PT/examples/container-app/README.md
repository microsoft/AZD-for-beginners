# Exemplos de Implementação de Container App com AZD

Este diretório contém exemplos abrangentes para implementar aplicações conteinerizadas no Azure Container Apps usando a Azure Developer CLI (AZD). Estes exemplos demonstram padrões do mundo real, melhores práticas e configurações prontas para produção.

## 📚 Índice

- [Visão Geral](../../../../examples/container-app)
- [Pré-requisitos](../../../../examples/container-app)
- [Exemplos de Arranque Rápido](../../../../examples/container-app)
- [Exemplos de Produção](../../../../examples/container-app)
- [Padrões Avançados](../../../../examples/container-app)
- [Melhores Práticas](../../../../examples/container-app)

## Visão Geral

O Azure Container Apps é uma plataforma de contentores serverless totalmente gerida que permite executar microsserviços e aplicações conteinerizadas sem gerir infraestrutura. Quando combinado com o AZD, obtém:

- **Implementação Simplificada**: Único comando para implementar contentores com infraestrutura
- **Escalonamento Automático**: Escala para zero e escala para cima com base no tráfego HTTP ou eventos
- **Rede Integrada**: Descoberta de serviço e divisão de tráfego incorporadas
- **Identidade Gerida**: Autenticação segura aos recursos Azure
- **Otimização de Custos**: Pague apenas pelos recursos que utilizar

## Pré-requisitos

Antes de começar, certifique-se de que tem:

```bash
# Verificar a instalação do AZD
azd version

# Verificar o Azure CLI
az version

# Verificar o Docker (para construir imagens personalizadas)
docker --version

# Iniciar sessão no Azure
azd auth login
az login
```

**Recursos Azure Necessários:**
- Subscrição Azure ativa
- Permissões para criar grupos de recursos
- Acesso ao ambiente Container Apps

## Exemplos de Arranque Rápido

### 1. API Web Simples (Python Flask)

Implemente uma API REST básica com Azure Container Apps.

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

**Passos de Implementação:**

```bash
# Inicializar a partir do modelo
azd init --template todo-python-mongo

# Prover infraestruturas e implementar
azd up

# Testar a implementação
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**Funcionalidades-Chave:**
- Autoescalonamento de 0 a 10 réplicas
- Probes de saúde e verificações de liveness
- Injeção de variáveis de ambiente
- Integração com Application Insights

### 2. API Node.js Express

Implemente um backend Node.js com integração MongoDB.

```bash
# Inicializar template da API Node.js
azd init --template todo-nodejs-mongo

# Configurar variáveis de ambiente
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# Implantar
azd up

# Visualizar logs através do Azure Monitor
azd monitor --logs
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

Implemente uma aplicação full-stack com frontend React e backend API.

```bash
# Iniciar template full-stack
azd init --template todo-csharp-sql-swa-func

# Rever configuração
cat azure.yaml

# Implementar ambos os serviços
azd up

# Abrir a aplicação
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## Exemplos de Produção

### Exemplo 1: Arquitetura de Microsserviços

**Cenário**: Aplicação de comércio eletrónico com múltiplos microsserviços

**Estrutura do Diretório:**
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

**Implementação:**
```bash
# Inicializar projeto
azd init

# Definir ambiente de produção
azd env new production

# Configurar definições de produção
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# Implementar todos os serviços
azd up

# Monitorizar implementação
azd monitor --overview
```

### Exemplo 2: Container App com IA

**Cenário**: Aplicação de chat IA com integração Azure OpenAI

**Ficheiro: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# Utilize Identidade Gerida para acesso seguro
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

**Ficheiro: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**Ficheiro: infra/main.bicep**
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

**Comandos de Implementação:**
```bash
# Configurar o ambiente
azd init --template ai-chat-app
azd env new dev

# Configurar OpenAI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# Implementar
azd up

# Testar a API
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### Exemplo 3: Trabalhador Background com Processamento de Fila

**Cenário**: Sistema de processamento de encomendas com fila de mensagens

**Estrutura do Diretório:**
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

**Ficheiro: src/worker/processor.py**
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
            # Processar encomenda
            print(f"Processing order: {message.content}")
            
            # Mensagem completa
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**Ficheiro: azure.yaml**
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

**Implementação:**
```bash
# Inicializar
azd init

# Implementar com configuração de fila
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

### Padrão 1: Implementação Blue-Green

```bash
# Criar nova revisão sem tráfego
azd deploy api --revision-suffix blue --no-traffic

# Testar a nova revisão
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# Dividir o tráfego (20% para azul, 80% para atual)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# Mudança total para azul
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### Padrão 2: Implementação Canary com AZD

**Ficheiro: .azure/dev/config.json**
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

**Script de Implementação:**
```bash
#!/bin/bash
# deploy-canary.sh

# Desplegar nova revisão com 10% do tráfego
azd deploy api --revision-mode multiple

# Monitorizar métricas
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

### Padrão 3: Implementação Multi-Região

**Ficheiro: azure.yaml**
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

**Ficheiro: infra/multi-region.bicep**
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

**Implementação:**
```bash
# Implementar em todas as regiões
azd up

# Verificar pontos finais
azd show --output json | jq '.services.api.endpoints'
```

### Padrão 4: Integração com Dapr

**Ficheiro: infra/app/dapr-enabled.bicep**
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

**Código da Aplicação com Dapr:**
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

## Melhores Práticas

### 1. Organização de Recursos

```bash
# Utilize convenções de nomenclatura consistentes
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# Marque os recursos para rastreamento de custos
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

### 3. Otimização de Performance

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

### 4. Monitorização e Observabilidade

```bash
# Ativar o Application Insights
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# Ver logs em tempo real
azd monitor --logs
# Ou usar a Azure CLI para Container Apps:
az containerapp logs show --name api --resource-group rg-myapp --follow

# Monitorizar métricas
azd monitor --live

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
# Escalar para zero quando não estiver em uso
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# Usar instâncias spot para ambientes de desenvolvimento
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# Configurar alertas de orçamento
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. Integração CI/CD

**Exemplo GitHub Actions:**
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
# Inicializar novo projeto de aplicação de contentor
azd init --template <template-name>

# Desplegar infraestrutura e aplicação
azd up

# Desplegar apenas código da aplicação (ignorar infraestrutura)
azd deploy

# Provisionar apenas infraestrutura
azd provision

# Ver recursos implantados
azd show

# Transmitir logs usando azd monitor ou Azure CLI
azd monitor --logs
# az containerapp logs show --name <nome-do-serviço> --resource-group <nome-do-grupo> --follow

# Monitorizar aplicação
azd monitor --overview

# Limpar recursos
azd down --force --purge
```

## Resolução de Problemas

### Problema: O contentor não inicia

```bash
# Verificar registos usando Azure CLI
az containerapp logs show --name api --resource-group rg-myapp --tail 100

# Ver eventos do contentor
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# Testar localmente
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### Problema: Não é possível aceder ao endpoint do container app

```bash
# Verificar configuração de ingresso
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# Verificar se o ingresso interno está ativado
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### Problema: Problemas de performance

```bash
# Verificar a utilização dos recursos
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Aumentar os recursos
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## Recursos e Exemplos Adicionais
- [Exemplo de Microsserviços](./microservices/README.md)
- [Exemplo Simples API Flask](./simple-flask-api/README.md)
- [Documentação Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Galeria de Templates AZD](https://azure.github.io/awesome-azd/)
- [Exemplos Container Apps](https://github.com/Azure-Samples/container-apps-samples)
- [Templates Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## Contribuir

Para contribuir com novos exemplos de container app:

1. Crie um novo subdiretório com o seu exemplo
2. Inclua ficheiros completos `azure.yaml`, `infra/` e `src/`
3. Adicione um README abrangente com instruções de implementação
4. Teste a implementação com `azd up`
5. Submeta um pull request

---

**Precisa de Ajuda?** Junte-se à comunidade [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) para suporte e dúvidas.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, tenha em atenção que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte oficial. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->