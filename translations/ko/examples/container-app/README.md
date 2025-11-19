<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d9a2ec55ebb3688baf26e691b1703e76",
  "translation_date": "2025-11-19T20:47:28+00:00",
  "source_file": "examples/container-app/README.md",
  "language_code": "ko"
}
-->
# AZD를 사용한 컨테이너 앱 배포 예제

이 디렉터리에는 Azure Developer CLI (AZD)를 사용하여 Azure Container Apps에 컨테이너화된 애플리케이션을 배포하는 포괄적인 예제가 포함되어 있습니다. 이 예제들은 실제 사용 사례, 모범 사례, 그리고 프로덕션 준비가 완료된 구성을 보여줍니다.

## 📚 목차

- [개요](../../../../examples/container-app)
- [사전 요구 사항](../../../../examples/container-app)
- [빠른 시작 예제](../../../../examples/container-app)
- [프로덕션 예제](../../../../examples/container-app)
- [고급 패턴](../../../../examples/container-app)
- [모범 사례](../../../../examples/container-app)

## 개요

Azure Container Apps는 인프라를 관리하지 않고도 마이크로서비스와 컨테이너화된 애플리케이션을 실행할 수 있는 완전 관리형 서버리스 컨테이너 플랫폼입니다. AZD와 결합하면 다음과 같은 이점을 얻을 수 있습니다:

- **간소화된 배포**: 단일 명령으로 컨테이너와 인프라를 배포
- **자동 확장**: HTTP 트래픽 또는 이벤트에 따라 0에서 확장 및 축소
- **통합 네트워킹**: 내장된 서비스 검색 및 트래픽 분할
- **관리형 ID**: Azure 리소스에 대한 안전한 인증
- **비용 최적화**: 사용한 리소스에 대해서만 비용 지불

## 사전 요구 사항

시작하기 전에 다음을 준비하세요:

```bash
# AZD 설치 확인
azd version

# Azure CLI 확인
az version

# Docker 확인 (사용자 정의 이미지를 빌드하기 위해)
docker --version

# Azure에 로그인
azd auth login
az login
```

**필수 Azure 리소스:**
- 활성화된 Azure 구독
- 리소스 그룹 생성 권한
- Container Apps 환경 접근 권한

## 빠른 시작 예제

### 1. 간단한 웹 API (Python Flask)

Azure Container Apps로 기본 REST API를 배포합니다.

**예제: Python Flask API**

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

**배포 단계:**

```bash
# 템플릿에서 초기화
azd init --template todo-python-mongo

# 인프라를 프로비저닝하고 배포
azd up

# 배포 테스트
azd show
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

**주요 기능:**
- 0에서 10개의 복제본으로 자동 확장
- 상태 점검 및 생존성 점검
- 환경 변수 주입
- Application Insights 통합

### 2. Node.js Express API

MongoDB 통합을 포함한 Node.js 백엔드를 배포합니다.

```bash
# Node.js API 템플릿 초기화
azd init --template todo-nodejs-mongo

# 환경 변수를 구성
azd env set DATABASE_NAME todosdb
azd env set COLLECTION_NAME todos

# 배포
azd up

# 로그 보기
azd logs api
```

**인프라 하이라이트:**
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

### 3. 정적 프론트엔드 + API 백엔드

React 프론트엔드와 API 백엔드를 포함한 풀스택 애플리케이션을 배포합니다.

```bash
# 풀스택 템플릿 초기화
azd init --template todo-csharp-sql-swa-func

# 구성 검토
cat azure.yaml

# 두 서비스를 배포
azd up

# 애플리케이션 열기
azd show --output json | jq -r '.services.web.endpoint' | xargs start
```

## 프로덕션 예제

### 예제 1: 마이크로서비스 아키텍처

**시나리오**: 여러 마이크로서비스를 포함한 전자상거래 애플리케이션

**디렉터리 구조:**
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

**azure.yaml 구성:**
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

**배포:**
```bash
# 프로젝트 초기화
azd init

# 프로덕션 환경 설정
azd env new production

# 프로덕션 설정 구성
azd env set ENVIRONMENT production
azd env set MIN_REPLICAS 2
azd env set MAX_REPLICAS 50

# 모든 서비스 배포
azd up

# 배포 모니터링
azd monitor --overview
```

### 예제 2: AI 기반 컨테이너 앱

**시나리오**: Azure OpenAI 통합을 포함한 AI 채팅 애플리케이션

**파일: src/ai-chat/app.py**
```python
from flask import Flask, request, jsonify
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import openai

app = Flask(__name__)

# 보안 액세스를 위해 관리 ID 사용
credential = DefaultAzureCredential()
vault_url = "https://{vault-name}.vault.azure.net"
client = SecretClient(vault_url=vault_url, credential=credential)

@app.route('/api/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    
    # 키 볼트에서 OpenAI 키 가져오기
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

**파일: azure.yaml**
```yaml
name: ai-chat-app
services:
  api:
    project: ./src/ai-chat
    language: python
    host: containerapp
```

**파일: infra/main.bicep**
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

**배포 명령:**
```bash
# 환경 설정
azd init --template ai-chat-app
azd env new dev

# OpenAI 구성
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_OPENAI_DEPLOYMENT "gpt-4"

# 배포
azd up

# API 테스트
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

### 예제 3: 큐 처리 백그라운드 워커

**시나리오**: 메시지 큐를 사용하는 주문 처리 시스템

**디렉터리 구조:**
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

**파일: src/worker/processor.py**
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
            # 주문 처리
            print(f"Processing order: {message.content}")
            
            # 메시지 완료
            queue_client.delete_message(message)

if __name__ == '__main__':
    process_orders()
```

**파일: azure.yaml**
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

**배포:**
```bash
# 초기화
azd init

# 대기열 구성으로 배포
azd up

# 대기열 길이에 따라 작업자 확장
az containerapp update \
  --name worker \
  --resource-group rg-order-processing \
  --scale-rule-name queue-scaling \
  --scale-rule-type azure-queue \
  --scale-rule-metadata queueName=orders accountName=storageaccount
```

## 고급 패턴

### 패턴 1: 블루-그린 배포

```bash
# 트래픽 없이 새 리비전을 생성합니다
azd deploy api --revision-suffix blue --no-traffic

# 새 리비전을 테스트합니다
curl https://api--blue.nicegrass-12345.eastus.azurecontainerapps.io/health

# 트래픽을 분할합니다 (20%는 블루, 80%는 현재로)
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight latest=80 blue=20

# 블루로 완전 전환
az containerapp ingress traffic set \
  --name api \
  --resource-group rg-myapp \
  --revision-weight blue=100
```

### 패턴 2: AZD를 사용한 카나리 배포

**파일: .azure/dev/config.json**
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

**배포 스크립트:**
```bash
#!/bin/bash
# deploy-canary.sh

# 10% 트래픽으로 새 리비전을 배포합니다
azd deploy api --revision-mode multiple

# 메트릭을 모니터링합니다
azd monitor --service api --duration 5m

# 트래픽을 점진적으로 증가시킵니다
for i in {20..100..10}; do
  echo "Increasing traffic to $i%"
  az containerapp revision set-traffic \
    --name api \
    --resource-group rg-myapp \
    --revision-weight latest=$i
  
  sleep 300  # 5분 동안 기다립니다
done
```

### 패턴 3: 다중 지역 배포

**파일: azure.yaml**
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

**파일: infra/multi-region.bicep**
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

**배포:**
```bash
# 모든 지역에 배포
azd up

# 엔드포인트 확인
azd show --output json | jq '.services.api.endpoints'
```

### 패턴 4: Dapr 통합

**파일: infra/app/dapr-enabled.bicep**
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

**Dapr를 사용하는 애플리케이션 코드:**
```python
from flask import Flask
from dapr.clients import DaprClient

app = Flask(__name__)

@app.route('/orders', methods=['POST'])
def create_order():
    with DaprClient() as client:
        # 상태 저장
        client.save_state(
            store_name='statestore',
            key='order-123',
            value={'status': 'pending'}
        )
        
        # 이벤트 게시
        client.publish_event(
            pubsub_name='pubsub',
            topic_name='orders',
            data={'orderId': '123'}
        )
    
    return {'status': 'created'}
```

## 모범 사례

### 1. 리소스 조직화

```bash
# 일관된 명명 규칙을 사용하세요
azd env set AZURE_ENV_NAME "myapp-prod"
azd env set AZURE_LOCATION "eastus"

# 비용 추적을 위해 리소스에 태그를 지정하세요
azd env set AZURE_TAGS "Environment=Production,CostCenter=Engineering"
```

### 2. 보안 모범 사례

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

### 3. 성능 최적화

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

### 4. 모니터링 및 가시성

```bash
# 애플리케이션 인사이트 활성화
azd env set APPLICATIONINSIGHTS_CONNECTION_STRING "InstrumentationKey=..."

# 실시간으로 로그 보기
azd logs api --follow

# 메트릭 모니터링
azd monitor --service api

# 알림 생성
az monitor metrics alert create \
  --name high-cpu-alert \
  --resource-group rg-myapp \
  --scopes $(azd show --output json | jq -r '.services.api.resourceId') \
  --condition "avg CPU > 80" \
  --description "Alert when CPU exceeds 80%"
```

### 5. 비용 최적화

```bash
# 사용하지 않을 때 0으로 축소
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --min-replicas 0

# 개발 환경에 스팟 인스턴스 사용
azd env set CONTAINER_APP_REPLICA_TYPE "Spot"

# 예산 알림 설정
az consumption budget create \
  --budget-name myapp-budget \
  --amount 100 \
  --time-grain Monthly \
  --threshold 80
```

### 6. CI/CD 통합

**GitHub Actions 예제:**
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

## 일반 명령어 참조

```bash
# 새 컨테이너 앱 프로젝트 초기화
azd init --template <template-name>

# 인프라 및 애플리케이션 배포
azd up

# 애플리케이션 코드만 배포 (인프라 제외)
azd deploy

# 인프라만 프로비저닝
azd provision

# 배포된 리소스 보기
azd show

# 로그 스트리밍
azd logs <service-name> --follow

# 애플리케이션 모니터링
azd monitor --overview

# 리소스 정리
azd down --force --purge
```

## 문제 해결

### 문제: 컨테이너가 시작되지 않음

```bash
# 로그 확인
azd logs api --tail 100

# 컨테이너 이벤트 보기
az containerapp revision show \
  --name api \
  --resource-group rg-myapp \
  --revision latest

# 로컬에서 테스트
docker build -t api:local ./src/api
docker run -p 8000:8000 api:local
```

### 문제: 컨테이너 앱 엔드포인트에 접근할 수 없음

```bash
# 인그레스 구성을 확인하십시오
az containerapp show \
  --name api \
  --resource-group rg-myapp \
  --query properties.configuration.ingress

# 내부 인그레스가 활성화되어 있는지 확인하십시오
az containerapp ingress update \
  --name api \
  --resource-group rg-myapp \
  --external true
```

### 문제: 성능 문제

```bash
# 리소스 사용량 확인
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# 리소스 확장
az containerapp update \
  --name api \
  --resource-group rg-myapp \
  --cpu 2.0 \
  --memory 4Gi
```

## 추가 리소스 및 예제
- [마이크로서비스 예제](./microservices/README.md)
- [간단한 Flask API 예제](./simple-flask-api/README.md)
- [Azure Container Apps 문서](https://learn.microsoft.com/azure/container-apps/)
- [AZD 템플릿 갤러리](https://azure.github.io/awesome-azd/)
- [Container Apps 샘플](https://github.com/Azure-Samples/container-apps-samples)
- [Bicep 템플릿](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

## 기여하기

새로운 컨테이너 앱 예제를 기여하려면:

1. 예제와 함께 새 하위 디렉터리를 만듭니다.
2. 완전한 `azure.yaml`, `infra/`, `src/` 파일을 포함합니다.
3. 배포 지침이 포함된 포괄적인 README를 추가합니다.
4. `azd up`으로 배포를 테스트합니다.
5. 풀 리퀘스트를 제출합니다.

---

**도움이 필요하신가요?** [Microsoft Foundry Discord](https://discord.gg/microsoft-azure) 커뮤니티에 가입하여 지원 및 질문을 받아보세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->