# 다중 에이전트 조정 패턴

⏱️ **예상 소요 시간**: 60-75분 | 💰 **예상 비용**: 약 $100-300/월 | ⭐ <strong>난이도</strong>: 고급

**📚 학습 경로:**
- ← 이전: [용량 계획](capacity-planning.md) - 리소스 크기 조정 및 확장 전략
- 🎯 **현재 위치**: 다중 에이전트 조정 패턴 (오케스트레이션, 통신, 상태 관리)
- → 다음: [SKU 선택](sku-selection.md) - 적절한 Azure 서비스 선택
- 🏠 [코스 홈](../../README.md)

---

## 학습 내용

이 수업을 완료하면 다음을 할 수 있습니다:
- **다중 에이전트 아키텍처** 패턴과 사용 시기 이해
- **오케스트레이션 패턴** 구현 (중앙 집중식, 분산식, 계층식)
- **에이전트 통신** 전략 설계 (동기식, 비동기식, 이벤트 기반)
- 분산 에이전트 간 **공유 상태** 관리
- AZD를 사용하여 **다중 에이전트 시스템** Azure에 배포
- 실세계 AI 시나리오에 맞는 **조정 패턴** 적용
- 분산 에이전트 시스템 모니터링 및 디버깅

## 다중 에이전트 조정이 중요한 이유

### 진화: 단일 에이전트에서 다중 에이전트로

**단일 에이전트 (간단함):**
```
User → Agent → Response
```
- ✅ 이해 및 구현이 쉬움
- ✅ 간단한 작업에 빠름
- ❌ 단일 모델의 한계
- ❌ 복잡한 작업 병렬화 불가
- ❌ 전문화 없음

**다중 에이전트 시스템 (고급):**
```mermaid
graph TD
    Orchestrator[Orchestrator] --> Agent1[Agent1<br/>계획]
    Orchestrator --> Agent2[Agent2<br/>코드]
    Orchestrator --> Agent3[Agent3<br/>검토]
```- ✅ 특정 작업에 특화된 에이전트
- ✅ 속도를 위한 병렬 실행
- ✅ 모듈식이며 유지 관리 가능
- ✅ 복잡한 워크플로우에 강함
- ⚠️ 조정 로직 필요

<strong>비유</strong>: 단일 에이전트는 한 사람이 모든 일을 하는 것과 같음. 다중 에이전트는 팀으로 각 멤버가 전문 기술(연구, 코딩, 리뷰, 작성)을 가지고 협력하는 상황과 같음.

---

## 핵심 조정 패턴

### 패턴 1: 순차적 조정 (책임 연쇄)

**사용 시기**: 작업들이 특정 순서로 완료되어야 하며, 각 에이전트가 이전 출력에 기반함.

```mermaid
sequenceDiagram
    participant User
    participant Orchestrator
    participant Agent1 as 연구 에이전트
    participant Agent2 as 작성 에이전트
    participant Agent3 as 편집 에이전트
    
    User->>Orchestrator: "AI에 관한 기사 작성"
    Orchestrator->>Agent1: 주제 조사
    Agent1-->>Orchestrator: 조사 결과
    Orchestrator->>Agent2: 초안 작성 (조사 활용)
    Agent2-->>Orchestrator: 초안 기사
    Orchestrator->>Agent3: 편집 및 개선
    Agent3-->>Orchestrator: 최종 기사
    Orchestrator-->>User: 다듬어진 기사
    
    Note over User,Agent3: 순차적: 각 단계는 이전 단계를 기다림
```
**장점:**
- ✅ 명확한 데이터 흐름
- ✅ 디버깅 용이
- ✅ 예측 가능한 실행 순서

**제한 사항:**
- ❌ 느림 (병렬 처리 불가)
- ❌ 한 곳 실패 시 전체 연쇄 중단
- ❌ 상호 의존 작업 처리 불가

**예시 사용 사례:**
- 콘텐츠 제작 파이프라인 (연구 → 작성 → 편집 → 발행)
- 코드 생성 (계획 → 구현 → 테스트 → 배포)
- 보고서 생성 (데이터 수집 → 분석 → 시각화 → 요약)

---

### 패턴 2: 병렬 조정 (Fan-Out/Fan-In)

**사용 시기**: 독립적인 작업들을 동시에 실행하고 결과를 최종에 결합할 때.

```mermaid
graph TB
    User[사용자 요청]
    Orchestrator[조율자]
    Agent1[분석 에이전트]
    Agent2[연구 에이전트]
    Agent3[데이터 에이전트]
    Aggregator[결과 집계기]
    Response[통합 응답]
    
    User --> Orchestrator
    Orchestrator --> Agent1
    Orchestrator --> Agent2
    Orchestrator --> Agent3
    Agent1 --> Aggregator
    Agent2 --> Aggregator
    Agent3 --> Aggregator
    Aggregator --> Response
    
    style Orchestrator fill:#2196F3,stroke:#1976D2,stroke-width:3px,color:#fff
    style Aggregator fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
**장점:**
- ✅ 빠름 (병렬 실행)
- ✅ 내결함성 (일부 결과 허용)
- ✅ 수평 확장 용이

**제한 사항:**
- ⚠️ 결과가 순서 없이 도착할 수 있음
- ⚠️ 집계 로직 필요
- ⚠️ 복잡한 상태 관리

**예시 사용 사례:**
- 다중 소스 데이터 수집 (API + DB + 웹 스크래핑)
- 경쟁 분석 (다수 모델이 해결책 생성 후 최적 선택)
- 번역 서비스 (여러 언어 동시 번역)

---

### 패턴 3: 계층적 조정 (관리자-작업자)

**사용 시기**: 복잡한 워크플로우 및 하위 작업 위임이 필요한 경우.

```mermaid
graph TB
    Master[마스터 오케스트레이터]
    Manager1[연구 관리자]
    Manager2[콘텐츠 관리자]
    W1[웹 스크레이퍼]
    W2[논문 분석기]
    W3[작가]
    W4[편집자]
    
    Master --> Manager1
    Master --> Manager2
    Manager1 --> W1
    Manager1 --> W2
    Manager2 --> W3
    Manager2 --> W4
    
    style Master fill:#FF9800,stroke:#F57C00,stroke-width:3px,color:#fff
    style Manager1 fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style Manager2 fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
```
**장점:**
- ✅ 복잡한 워크플로우 처리 가능
- ✅ 모듈화 및 유지 관리 용이
- ✅ 명확한 책임 구역

**제한 사항:**
- ⚠️ 더 복잡한 아키텍처
- ⚠️ 높은 지연 시간 (여러 조정 계층)
- ⚠️ 정교한 오케스트레이션 필요

**예시 사용 사례:**
- 기업 문서 처리 (분류 → 경로지정 → 처리 → 보관)
- 다단계 데이터 파이프라인 (수집 → 정제 → 변환 → 분석 → 보고)
- 복잡한 자동화 워크플로우 (계획 → 리소스 할당 → 실행 → 모니터링)

---

### 패턴 4: 이벤트 기반 조정 (퍼블리시-서브스크라이브)

**사용 시기**: 에이전트가 이벤트에 반응해야 하고, 느슨한 결합이 필요할 때.

```mermaid
sequenceDiagram
    participant Agent1 as 데이터 수집기
    participant EventBus as Azure 서비스 버스
    participant Agent2 as 분석기
    participant Agent3 as 알림기
    participant Agent4 as 보관기
    
    Agent1->>EventBus: "데이터수신" 이벤트 발행
    EventBus->>Agent2: 구독: 데이터 분석
    EventBus->>Agent3: 구독: 알림 전송
    EventBus->>Agent4: 구독: 데이터 보관
    
    Note over Agent1,Agent4: 모든 구독자는 독립적으로 처리
    
    Agent2->>EventBus: "분석완료" 이벤트 발행
    EventBus->>Agent3: 구독: 분석 보고서 전송
```
**장점:**
- ✅ 에이전트 간 느슨한 결합
- ✅ 새 에이전트 추가 용이 (구독만 하면 됨)
- ✅ 비동기 처리 가능
- ✅ 메시지 지속성으로 내결함성 보장

**제한 사항:**
- ⚠️ 최종적 일관성 보장
- ⚠️ 디버깅 복잡
- ⚠️ 메시지 순서 문제

**예시 사용 사례:**
- 실시간 모니터링 시스템 (알림, 대시보드, 로그)
- 다채널 알림 (이메일, SMS, 푸시, Slack)
- 데이터 처리 파이프라인 (동일 데이터에 대한 다중 소비자)

---

### 패턴 5: 합의 기반 조정 (투표/쿼럼)

**사용 시기**: 진행 전에 다수 에이전트의 동의가 필요할 때.

```mermaid
graph TB
    Input[입력 작업]
    Agent1[에이전트 1: gpt-4.1]
    Agent2[에이전트 2: Claude]
    Agent3[에이전트 3: Gemini]
    Voter[합의 투표자]
    Output[합의된 출력]
    
    Input --> Agent1
    Input --> Agent2
    Input --> Agent3
    Agent1 --> Voter
    Agent2 --> Voter
    Agent3 --> Voter
    Voter --> Output
    
    style Voter fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
```
**장점:**
- ✅ 높은 정확도 (다수 의견)
- ✅ 내결함성 (소수 실패 허용)
- ✅ 품질 보증 내장

**제한 사항:**
- ❌ 비용 높음 (여러 모델 호출)
- ❌ 느림 (모든 에이전트 대기)
- ⚠️ 충돌 해결 필요

**예시 사용 사례:**
- 콘텐츠 검열 (여러 모델이 콘텐츠 검토)
- 코드 리뷰 (여러 린터/분석기)
- 의료 진단 (여러 AI 모델과 전문가 검증)

---

## 아키텍처 개요

### Azure에서 완전한 다중 에이전트 시스템

```mermaid
graph TB
    User[사용자/API 클라이언트]
    APIM[Azure API 관리]
    Orchestrator[오케스트레이터 서비스<br/>컨테이너 앱]
    ServiceBus[Azure 서비스 버스<br/>이벤트 허브]
    
    Agent1[연구 에이전트<br/>컨테이너 앱]
    Agent2[작성 에이전트<br/>컨테이너 앱]
    Agent3[분석가 에이전트<br/>컨테이너 앱]
    Agent4[검토자 에이전트<br/>컨테이너 앱]
    
    CosmosDB[(코스모스 DB<br/>공유 상태)]
    Storage[Azure 저장소<br/>아티팩트]
    AppInsights[애플리케이션 인사이트<br/>모니터링]
    
    User --> APIM
    APIM --> Orchestrator
    
    Orchestrator --> ServiceBus
    ServiceBus --> Agent1
    ServiceBus --> Agent2
    ServiceBus --> Agent3
    ServiceBus --> Agent4
    
    Agent1 --> CosmosDB
    Agent2 --> CosmosDB
    Agent3 --> CosmosDB
    Agent4 --> CosmosDB
    
    Agent1 --> Storage
    Agent2 --> Storage
    Agent3 --> Storage
    Agent4 --> Storage
    
    Orchestrator -.-> AppInsights
    Agent1 -.-> AppInsights
    Agent2 -.-> AppInsights
    Agent3 -.-> AppInsights
    Agent4 -.-> AppInsights
    
    style Orchestrator fill:#FF9800,stroke:#F57C00,stroke-width:3px,color:#fff
    style ServiceBus fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style CosmosDB fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
**주요 구성 요소:**

| 구성 요소 | 목적 | Azure 서비스 |
|-----------|---------|---------------|
| **API 게이트웨이** | 진입점, 속도 제한, 인증 | API Management |
| <strong>오케스트레이터</strong> | 에이전트 워크플로우 조정 | Container Apps |
| **메시지 큐** | 비동기 통신 | Service Bus / Event Hubs |
| <strong>에이전트</strong> | 특화된 AI 작업자 | Container Apps / Functions |
| **상태 저장소** | 공유 상태, 작업 추적 | Cosmos DB |
| **아티팩트 저장소** | 문서, 결과, 로그 | Blob Storage |
| <strong>모니터링</strong> | 분산 추적, 로그 | Application Insights |

---

## 전제 조건

### 필요 도구

```bash
# Azure 개발자 CLI 확인
azd version
# ✅ 예상: azd 버전 1.0.0 이상

# Azure CLI 확인
az --version
# ✅ 예상: azure-cli 2.50.0 이상

# Docker 확인 (로컬 테스트용)
docker --version
# ✅ 예상: Docker 버전 20.10 이상
```

### Azure 필요 사항

- 활성화된 Azure 구독
- 다음 생성 권한:
  - Container Apps
  - Service Bus 네임스페이스
  - Cosmos DB 계정
  - 스토리지 계정
  - Application Insights

### 지식 전제 조건

다음 내용을 완료했어야 합니다:
- [구성 관리](../chapter-03-configuration/configuration.md)
- [인증 및 보안](../chapter-03-configuration/authsecurity.md)
- [마이크로서비스 예제](../../../../examples/microservices)

---

## 구현 가이드

### 프로젝트 구조

```
multi-agent-system/
├── azure.yaml                    # AZD configuration
├── infra/
│   ├── main.bicep               # Main infrastructure
│   ├── core/
│   │   ├── servicebus.bicep     # Message queue
│   │   ├── cosmos.bicep         # State store
│   │   ├── storage.bicep        # Artifact storage
│   │   └── monitoring.bicep     # Application Insights
│   └── app/
│       ├── orchestrator.bicep   # Orchestrator service
│       └── agent.bicep          # Agent template
└── src/
    ├── orchestrator/            # Orchestration logic
    │   ├── app.py
    │   ├── workflows.py
    │   └── Dockerfile
    ├── agents/
    │   ├── research/            # Research agent
    │   ├── writer/              # Writer agent
    │   ├── analyst/             # Analyst agent
    │   └── reviewer/            # Reviewer agent
    └── shared/
        ├── state_manager.py     # Shared state logic
        └── message_handler.py   # Message handling
```

---

## 수업 1: 순차적 조정 패턴

### 구현: 콘텐츠 제작 파이프라인

연구 → 작성 → 편집 → 발행 순서의 파이프라인 구축

### 1. AZD 구성

**파일: `azure.yaml`**

```yaml
name: content-pipeline
metadata:
  template: multi-agent-sequential@1.0.0

services:
  orchestrator:
    project: ./src/orchestrator
    language: python
    host: containerapp
  
  research-agent:
    project: ./src/agents/research
    language: python
    host: containerapp
  
  writer-agent:
    project: ./src/agents/writer
    language: python
    host: containerapp
  
  editor-agent:
    project: ./src/agents/editor
    language: python
    host: containerapp
```

### 2. 인프라: 조정을 위한 Service Bus

**파일: `infra/core/servicebus.bicep`**

```bicep
param name string
param location string
param tags object = {}

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: name
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
  properties: {
    minimumTlsVersion: '1.2'
  }
}

// Queue for orchestrator → research agent
resource researchQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'research-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
    deadLetteringOnMessageExpiration: true
  }
}

// Queue for research agent → writer agent
resource writerQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'writer-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
  }
}

// Queue for writer agent → editor agent
resource editorQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'editor-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
  }
}

output namespace string = serviceBusNamespace.name
output connectionString string = listKeys('${serviceBusNamespace.id}/AuthorizationRules/RootManageSharedAccessKey', serviceBusNamespace.apiVersion).primaryConnectionString
```

### 3. 공유 상태 관리자

**파일: `src/shared/state_manager.py`**

```python
from azure.cosmos import CosmosClient, PartitionKey
from datetime import datetime
import os

class StateManager:
    """Manages shared state across agents using Cosmos DB"""
    
    def __init__(self):
        endpoint = os.environ['COSMOS_ENDPOINT']
        key = os.environ['COSMOS_KEY']
        
        self.client = CosmosClient(endpoint, key)
        self.database = self.client.get_database_client('agent-state')
        self.container = self.database.get_container_client('tasks')
    
    def create_task(self, task_id: str, task_type: str, input_data: dict):
        """Create a new task"""
        task = {
            'id': task_id,
            'type': task_type,
            'status': 'pending',
            'input': input_data,
            'created_at': datetime.utcnow().isoformat(),
            'steps': []
        }
        self.container.create_item(task)
        return task
    
    def update_task_step(self, task_id: str, step_name: str, result: dict):
        """Update task with completed step"""
        task = self.container.read_item(task_id, partition_key=task_id)
        
        task['steps'].append({
            'name': step_name,
            'completed_at': datetime.utcnow().isoformat(),
            'result': result
        })
        
        self.container.replace_item(task_id, task)
        return task
    
    def complete_task(self, task_id: str, final_result: dict):
        """Mark task as complete"""
        task = self.container.read_item(task_id, partition_key=task_id)
        task['status'] = 'completed'
        task['result'] = final_result
        task['completed_at'] = datetime.utcnow().isoformat()
        self.container.replace_item(task_id, task)
        return task
    
    def get_task(self, task_id: str):
        """Retrieve task state"""
        return self.container.read_item(task_id, partition_key=task_id)
```

### 4. 오케스트레이터 서비스

**파일: `src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# 서비스 버스 연결
servicebus_connection_str = os.environ['SERVICEBUS_CONNECTION_STRING']
servicebus_client = ServiceBusClient.from_connection_string(servicebus_connection_str)

@app.route('/health', methods=['GET'])
def health():
    return jsonify({'status': 'healthy', 'service': 'orchestrator'})

@app.route('/create-content', methods=['POST'])
def create_content():
    """
    Sequential workflow: Research → Write → Edit → Publish
    """
    data = request.json
    topic = data.get('topic')
    
    if not topic:
        return jsonify({'error': 'Topic required'}), 400
    
    # 상태 저장소에 작업 생성
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # 연구 에이전트에게 메시지 전송 (첫 번째 단계)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # 결과를 보낼 위치
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    return jsonify({
        'task_id': task_id,
        'status': 'started',
        'workflow': 'sequential',
        'steps': ['research', 'write', 'edit', 'publish'],
        'message': 'Content creation pipeline initiated'
    }), 202

@app.route('/task/<task_id>', methods=['GET'])
def get_task_status(task_id):
    """Check task status"""
    try:
        task = state_manager.get_task(task_id)
        return jsonify(task)
    except Exception as e:
        return jsonify({'error': str(e)}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

### 5. 연구 에이전트

**파일: `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# 클라이언트 초기화
state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_research_task(message_data):
    """Process research request and pass to writer"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    next_queue = message_data['next_queue']
    
    print(f"🔬 Researching: {topic}")
    
    # 연구를 위해 Microsoft Foundry 모델 호출
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # 상태 업데이트
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # 다음 에이전트(작성자)에게 전송
    sender = servicebus_client.get_queue_sender(next_queue)
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'research': research_results,
            'next_queue': 'editor-tasks'
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    print(f"✅ Research complete for task {task_id}")

def main():
    """Listen to research queue"""
    receiver = servicebus_client.get_queue_receiver('research-tasks')
    
    print("🔬 Research Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_research_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error processing message: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 6. 작성자 에이전트

**파일: `src/agents/writer/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_writing_task(message_data):
    """Write article based on research"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    research = message_data['research']
    next_queue = message_data['next_queue']
    
    print(f"✍️ Writing article: {topic}")
    
    # Microsoft Foundry 모델을 호출하여 기사 작성
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # 상태 업데이트
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # 편집자에게 전송
    sender = servicebus_client.get_queue_sender(next_queue)
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'draft': article_draft
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    print(f"✅ Article draft complete for task {task_id}")

def main():
    """Listen to writer queue"""
    receiver = servicebus_client.get_queue_receiver('writer-tasks')
    
    print("✍️ Writer Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_writing_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 7. 편집자 에이전트

**파일: `src/agents/editor/app.py`**

```python
from azure.servicebus import ServiceBusClient
from openai import AzureOpenAI
import json
import os
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_editing_task(message_data):
    """Edit and finalize article"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    draft = message_data['draft']
    
    print(f"📝 Editing article: {topic}")
    
    # 편집을 위해 Microsoft Foundry 모델 호출
    response = openai_client.chat.completions.create(
        model="gpt-4.1",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # 작업을 완료로 표시
    state_manager.complete_task(
        task_id=task_id,
        final_result={
            'topic': topic,
            'final_article': final_article,
            'word_count': len(final_article.split())
        }
    )
    
    print(f"✅ Article finalized for task {task_id}")

def main():
    """Listen to editor queue"""
    receiver = servicebus_client.get_queue_receiver('editor-tasks')
    
    print("📝 Editor Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_editing_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 8. 배포 및 테스트

```bash
# 옵션 A: 템플릿 기반 배포
azd init
azd up

# 옵션 B: 에이전트 매니페스트 배포(확장 필요)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> 모든 `azd ai` 플래그 및 옵션은 [AZD AI CLI 명령](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 참고.

```bash
# 오케스트레이터 URL 가져오기
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# 콘텐츠 생성하기
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ 예상 출력:**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**작업 진행 확인:**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ 예상 출력 (완료됨):**
```json
{
  "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "type": "content_creation",
  "status": "completed",
  "steps": [
    {
      "name": "research",
      "completed_at": "2025-11-19T10:30:00Z",
      "result": {"research": "..."}
    },
    {
      "name": "writing",
      "completed_at": "2025-11-19T10:32:00Z",
      "result": {"draft": "..."}
    }
  ],
  "result": {
    "topic": "The Future of AI in Healthcare",
    "final_article": "...",
    "word_count": 1500
  }
}
```

---

## 수업 2: 병렬 조정 패턴

### 구현: 다중 소스 연구 집계기

여러 소스에서 정보를 동시에 수집하는 병렬 시스템 구축

### 병렬 오케스트레이터

**파일: `src/orchestrator/parallel_workflow.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

@app.route('/research-parallel', methods=['POST'])
def research_parallel():
    """
    Parallel workflow: Multiple agents work simultaneously
    """
    data = request.json
    query = data.get('query')
    
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='parallel_research',
        input_data={
            'query': query,
            'agents': ['web', 'academic', 'news', 'social']
        }
    )
    
    # 팬아웃: 모든 에이전트에게 동시에 전송
    agents = [
        ('web-research-queue', 'web'),
        ('academic-research-queue', 'academic'),
        ('news-research-queue', 'news'),
        ('social-research-queue', 'social')
    ]
    
    for queue_name, agent_type in agents:
        sender = servicebus_client.get_queue_sender(queue_name)
        message = ServiceBusMessage(
            body=json.dumps({
                'task_id': task_id,
                'query': query,
                'agent_type': agent_type,
                'result_queue': 'aggregation-queue'
            }),
            content_type='application/json'
        )
        
        with sender:
            sender.send_messages(message)
    
    return jsonify({
        'task_id': task_id,
        'status': 'started',
        'workflow': 'parallel',
        'agents_dispatched': 4,
        'message': 'Parallel research initiated'
    }), 202

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

### 집계 로직

**파일: `src/agents/aggregator/app.py`**

```python
from azure.servicebus import ServiceBusClient
import json
import os
from collections import defaultdict
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

# 작업별 결과 추적
task_results = defaultdict(list)
expected_agents = 4  # 웹, 학술, 뉴스, 소셜

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # 결과 저장
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # 모든 에이전트 완료 여부 확인 (팬 인)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # 결과 결합
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # 완료 표시
        state_manager.complete_task(task_id, aggregated)
        
        # 정리 작업
        del task_results[task_id]
        
        print(f"✅ Aggregation complete for task {task_id}")

def generate_summary(results):
    """Generate summary from all sources"""
    summaries = [r['data'].get('summary', '') for r in results]
    return '\n\n'.join(summaries)

def main():
    """Listen to aggregation queue"""
    receiver = servicebus_client.get_queue_receiver('aggregation-queue')
    
    print("📊 Aggregator started, listening for results...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_result(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

**병렬 패턴의 장점:**
- ⚡ **4배 빠름** (에이전트 동시 실행)
- 🔄 <strong>내결함성</strong> (일부 결과 허용)
- 📈 <strong>확장성</strong> (에이전트 추가 용이)

---

## 실습

### 실습 1: 타임아웃 처리 추가 ⭐⭐ (중간)

<strong>목표</strong>: 느린 에이전트를 위해 집계기가 무한 대기하지 않도록 타임아웃 로직 구현.

<strong>단계</strong>:

1. **집계기에 타임아웃 추적 추가:**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> 만료 시간

def process_result(message_data):
    task_id = message_data['task_id']
    
    # 첫 번째 결과에 타임아웃 설정
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # 완료되었는지 또는 시간 초과되었는지 확인
    if len(task_results[task_id]) == expected_agents or \
       datetime.utcnow() > task_timeouts[task_id]:
        
        print(f"📊 Aggregating with {len(task_results[task_id])}/{expected_agents} results")
        
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'completed_agents': len(task_results[task_id]),
            'timed_out': len(task_results[task_id]) < expected_agents
        }
        
        state_manager.complete_task(task_id, aggregated)
        
        # 정리 작업
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **인위적 지연 테스트:**

```python
# 한 에이전트에서 느린 처리를 시뮬레이션하기 위해 지연 추가
import time
time.sleep(35)  # 30초 타임아웃을 초과함
```

3. **배포 및 검증:**

```bash
azd deploy aggregator

# 작업 제출
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# 30초 후 결과 확인
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ 성공 기준:**
- ✅ 작업이 30초 후에 완료됨, 에이전트 완료 안 된 경우라도
- ✅ 응답에 부분 결과임을 나타내는 `"timed_out": true`
- ✅ 이용 가능한 결과가 반환됨 (4개 중 3개 에이전트)

**소요 시간**: 20-25분

---

### 실습 2: 재시도 로직 구현 ⭐⭐⭐ (고급)

<strong>목표</strong>: 실패한 에이전트 작업을 자동으로 재시도하다가 포기

<strong>단계</strong>:

1. **오케스트레이터에 재시도 추적 추가:**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # message_id -> 재시도_횟수

def send_with_retry(queue_name: str, message_data: dict, retry_config: RetryConfig):
    """Send message with retry metadata"""
    message_id = message_data.get('message_id', str(uuid.uuid4()))
    message_data['message_id'] = message_id
    message_data['retry_count'] = retry_counts.get(message_id, 0)
    message_data['max_retries'] = retry_config.max_retries
    
    sender = servicebus_client.get_queue_sender(queue_name)
    message = ServiceBusMessage(
        body=json.dumps(message_data),
        content_type='application/json',
        message_id=message_id
    )
    
    with sender:
        sender.send_messages(message)
```

2. **에이전트에 재시도 핸들러 추가:**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # 메시지 처리
        process_func(message_data)
        
        # 성공 - 완료
        receiver.complete_message(message)
        
    except Exception as e:
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # 재시도: 포기하고 시도 횟수를 증가시켜 재대기열
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # 지연 후 동일한 대기열로 다시 발송
            time.sleep(5 * (retry_count + 1))  # 지수 백오프
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # 원본 제거
        else:
            # 최대 재시도 횟수 초과 - 데드 레터 대기열로 이동
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **데드레터 큐 모니터링:**

```python
def monitor_dead_letters():
    """Check dead letter queue for failed messages"""
    receiver = servicebus_client.get_queue_receiver(
        'research-queue',
        sub_queue='deadletter'
    )
    
    with receiver:
        messages = receiver.receive_messages(max_wait_time=5)
        for message in messages:
            print(f"☠️ Dead letter: {message.message_id}")
            print(f"Reason: {message.dead_letter_reason}")
            print(f"Description: {message.dead_letter_error_description}")
```

**✅ 성공 기준:**
- ✅ 실패 작업 자동 재시도 (최대 3회)
- ✅ 재시도 사이 지수 백오프 (5초, 10초, 15초)
- ✅ 최대 재시도 후 메시지 데드레터 큐로 이동
- ✅ 데드레터 큐 모니터링 및 재생 가능

**소요 시간**: 30-40분

---

### 실습 3: 서킷 브레이커 구현 ⭐⭐⭐ (고급)

<strong>목표</strong>: 실패하는 에이전트에 대한 요청 차단으로 연쇄 고장 방지

<strong>단계</strong>:

1. **서킷 브레이커 클래스 생성:**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # 정상 작동
    OPEN = "open"          # 실패, 요청 거부
    HALF_OPEN = "half_open"  # 복구 여부 테스트

class CircuitBreaker:
    def __init__(self, failure_threshold=5, timeout_seconds=60):
        self.failure_threshold = failure_threshold
        self.timeout_seconds = timeout_seconds
        self.failure_count = 0
        self.last_failure_time = None
        self.state = CircuitState.CLOSED
    
    def call(self, func):
        """Execute function with circuit breaker protection"""
        if self.state == CircuitState.OPEN:
            # 시간 초과 여부 확인
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # 성공
            if self.state == CircuitState.HALF_OPEN:
                self.state = CircuitState.CLOSED
                self.failure_count = 0
                print("✅ Circuit breaker: CLOSED (recovered)")
            
            return result
            
        except Exception as e:
            self.failure_count += 1
            self.last_failure_time = datetime.utcnow()
            
            if self.failure_count >= self.failure_threshold:
                self.state = CircuitState.OPEN
                print(f"🔴 Circuit breaker: OPEN (too many failures)")
            
            raise e
```

2. **에이전트 호출에 적용:**

```python
# 오케스트레이터에서
agent_circuits = {
    'web': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'academic': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'news': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'social': CircuitBreaker(failure_threshold=5, timeout_seconds=60)
}

def send_to_agent(agent_type, message_data):
    """Send with circuit breaker protection"""
    circuit = agent_circuits[agent_type]
    
    try:
        circuit.call(lambda: send_message(agent_type, message_data))
    except Exception as e:
        print(f"⚠️ Skipping {agent_type} agent: {e}")
        # 다른 에이전트로 계속 진행
```

3. **서킷 브레이커 테스트:**

```bash
# 반복 실패 시뮬레이션 (한 에이전트 중지)
az containerapp stop --name web-research-agent --resource-group rg-agents

# 여러 요청 보내기
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# 로그 확인 - 5번 실패 후 회로가 열려야 함
# Azure CLI를 사용하여 컨테이너 앱 로그 확인:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ 성공 기준:**
- ✅ 5회 실패 후 서킷이 열림 (요청 거부)
- ✅ 60초 후 서킷이 반열림 (복구 시험)
- ✅ 다른 에이전트 정상 작동
- ✅ 에이전트 복구 시 자동으로 서킷 닫힘

**소요 시간**: 40-50분

---

## 모니터링 및 디버깅

### Application Insights를 통한 분산 추적

**파일: `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# 추적 설정
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# 추적기 생성
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# 로깅 구성
logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(connection_string=connection_string))
logger.setLevel(logging.INFO)

def trace_agent_call(agent_name, task_id, operation):
    """Trace agent operations"""
    with tracer.span(name=f'{agent_name}.{operation}') as span:
        span.add_attribute('agent', agent_name)
        span.add_attribute('task_id', task_id)
        span.add_attribute('operation', operation)
        
        try:
            result = operation()
            span.add_attribute('status', 'success')
            return result
        except Exception as e:
            span.add_attribute('status', 'error')
            span.add_attribute('error', str(e))
            raise
```

### Application Insights 쿼리

**다중 에이전트 워크플로우 추적:**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**에이전트 성능 비교:**

```kusto
// Compare agent execution times
dependencies
| where name contains "agent"
| summarize 
    avg_duration = avg(duration),
    p95_duration = percentile(duration, 95),
    count = count()
  by agent = tostring(customDimensions.agent)
| order by avg_duration desc
```

**실패 분석:**

```kusto
// Find which agents fail most
exceptions
| where customDimensions.agent != ""
| summarize 
    failure_count = count(),
    unique_errors = dcount(outerMessage)
  by agent = tostring(customDimensions.agent)
| order by failure_count desc
```

---

## 비용 분석

### 다중 에이전트 시스템 비용 (월간 추정)

| 구성 요소 | 구성 | 비용 |
|-----------|--------------|------|
| <strong>오케스트레이터</strong> | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 에이전트** | 4 Container Apps (0.5 vCPU, 1GB 각각) | $60-120 |
| **Service Bus** | 표준 계층, 1천만 메시지 | $10-20 |
| **Cosmos DB** | 서버리스, 5GB 저장소, 100만 RUs | $25-50 |
| **Blob Storage** | 10GB 저장소, 10만 오퍼레이션 | $5-10 |
| **Application Insights** | 5GB 인제스트 | $10-15 |
| **Microsoft Foundry Models** | gpt-4.1, 천만 토큰 | $100-300 |
| <strong>총합</strong> | | **$240-565/월** |

### 비용 최적화 전략

1. **가능한 곳에 서버리스 사용:**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **유휴 시 에이전트 스케일 투 제로:**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Service Bus에 배치 처리 사용:**
   ```python
   # 메시지를 한 번에 묶어서 보내기(더 저렴함)
   sender.send_messages([message1, message2, message3])
   ```

4. **자주 사용하는 결과 캐시:**
   ```python
   # Azure Cache for Redis 사용
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## 모범 사례

### ✅ 해야 할 것:

1. **멱등 연산 사용**
   ```python
   # 에이전트는 동일한 메시지를 여러 번 안전하게 처리할 수 있습니다
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # 작업 처리 중...
   ```

2. **광범위한 로깅 구현**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **상관 ID 사용**
   ```python
   # 작업 ID를 전체 워크플로우에 전달
   message_data = {
       'task_id': task_id,  # 상관 관계 ID
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **메시지 TTL (유효 기간) 설정**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **데드레터 큐 모니터링**
   ```python
   # 실패한 메시지의 정기적인 모니터링
   monitor_dead_letters()
   ```

### ❌ 하지 말아야 할 것:

1. **순환 의존성 생성 금지**
   ```python
   # ❌ 나쁨: 에이전트 A → 에이전트 B → 에이전트 A (무한 루프)
   # ✅ 좋음: 명확한 방향성 비순환 그래프(DAG)를 정의하기
   ```

2. **에이전트 스레드 차단 금지**
   ```python
   # ❌ 나쁨: 동기식 대기
   while not task_complete:
       time.sleep(1)
   
   # ✅ 좋음: 메시지 큐 콜백 사용
   ```

3. **부분 실패 무시 금지**
   ```python
   # ❌ 나쁨: 한 에이전트가 실패하면 전체 워크플로우 실패
   # ✅ 좋음: 오류 표시와 함께 부분 결과 반환
   ```

4. **무한 재시도 사용하지 않기**
   ```python
   # ❌ 나쁨: 무한 재시도
   # ✅ 좋음: max_retries = 3, 그 후 데드레터
   ```

---

## 문제 해결 가이드

### 문제: 메시지가 큐에 갇힘

**증상:**
- 메시지가 큐에 쌓임
- 에이전트가 처리하지 않음
- 작업 상태가 "보류 중" 상태로 멈춤

**진단:**
```bash
# 큐 깊이 확인
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Azure CLI를 사용하여 에이전트 로그 확인
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**해결 방법:**

1. **에이전트 복제본 수 늘리기:**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **데드 레터 큐 확인:**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### 문제: 작업 시간 초과/완료되지 않음

**증상:**
- 작업 상태가 "진행 중"으로 유지됨
- 일부 에이전트는 완료, 일부는 완료하지 않음
- 오류 메시지 없음

**진단:**
```bash
# 작업 상태 확인
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Application Insights 확인
# 쿼리 실행: traces | where customDimensions.task_id == "..."
```

**해결 방법:**

1. **집계기에서 타임아웃 구현 (연습 1)**

2. **Azure Monitor를 사용하여 에이전트 실패 확인:**
   ```bash
   # azd 모니터를 통해 로그를 확인하세요
   azd monitor --logs
   
   # 또는 Azure CLI를 사용하여 특정 컨테이너 앱 로그를 확인하세요
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **모든 에이전트가 실행 중인지 확인:**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## 자세히 알아보기

### 공식 문서
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [다중 에이전트 디자인 패턴](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### 이 강좌의 다음 단계
- ← 이전: [용량 계획](capacity-planning.md)
- → 다음: [SKU 선택](sku-selection.md)
- 🏠 [강좌 홈](../../README.md)

### 관련 예제
- [마이크로서비스 예제](../../../../examples/microservices) - 서비스 통신 패턴
- [Microsoft Foundry 모델 예제](../../../../examples/azure-openai-chat) - AI 통합

---

## 요약

**배운 내용:**
- ✅ 다섯 가지 조정 패턴 (순차, 병렬, 계층, 이벤트 기반, 합의)
- ✅ Azure 기반 다중 에이전트 아키텍처 (Service Bus, Cosmos DB, Container Apps)
- ✅ 분산 에이전트 간 상태 관리
- ✅ 타임아웃 처리, 재시도, 회로 차단기
- ✅ 분산 시스템 모니터링 및 디버깅
- ✅ 비용 최적화 전략

**핵심 요점:**
1. **적절한 패턴 선택** - 순차는 순서가 중요한 워크플로, 병렬은 속도, 이벤트 기반은 유연성
2. **상태를 신중히 관리** - 공유 상태는 Cosmos DB 등 사용
3. **실패를 우아하게 처리** - 타임아웃, 재시도, 회로 차단기, 데드 레터 큐
4. **모든 것을 모니터링** - 분산 추적은 디버깅에 필수
5. **비용 최적화** - 0으로 스케일링, 서버리스 활용, 캐싱 구현

**다음 단계:**
1. 실습 과제 완료하기
2. 사용 사례에 맞는 다중 에이전트 시스템 구축하기
3. 성능과 비용 최적화를 위해 [SKU 선택](sku-selection.md) 학습하기

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나 자동 번역에는 오류나 부정확성이 있을 수 있음을 유의하시기 바랍니다. 원문 문서는 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 이 번역의 사용으로 인한 어떤 오해나 잘못된 해석에 대해 당사는 책임지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->