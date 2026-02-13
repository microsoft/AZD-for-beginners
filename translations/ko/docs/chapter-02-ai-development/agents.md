# AI Agents with Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD 초보자용](../../README.md)
- **📖 Current Chapter**: 챕터 2 - AI 우선 개발
- **⬅️ Previous**: [AI 모델 배포](ai-model-deployment.md)
- **➡️ Next**: [프로덕션 AI 실무](production-ai-practices.md)
- **🚀 Advanced**: [다중 에이전트 솔루션](../../examples/retail-scenario.md)

---

## 소개

AI 에이전트는 환경을 인식하고 의사결정을 내리며 특정 목표를 달성하기 위해 행동을 취할 수 있는 자율 프로그램입니다. 프롬프트에 단순히 응답하는 챗봇과 달리, 에이전트는:

- **도구 사용** - API 호출, 데이터베이스 검색, 코드 실행
- **계획 및 추론** - 복잡한 작업을 단계로 분해
- **컨텍스트에서 학습** - 메모리를 유지하고 행동을 적응
- **협업** - 다른 에이전트와 협력(다중 에이전트 시스템)

이 가이드는 Azure Developer CLI(azd)를 사용하여 AI 에이전트를 Azure에 배포하는 방법을 보여줍니다.

## 학습 목표

이 가이드를 완료하면 다음을 할 수 있습니다:
- 에이전트가 무엇이며 챗봇과 어떻게 다른지 이해
- AZD를 사용하여 사전 구축된 AI 에이전트 템플릿 배포
- 사용자 정의 에이전트를 위한 Foundry Agents 구성
- 기본 에이전트 패턴(도구 사용, RAG, 다중 에이전트) 구현
- 배포된 에이전트 모니터링 및 디버깅

## 학습 성과

완료 후 다음을 수행할 수 있습니다:
- 단일 명령으로 AI 에이전트 애플리케이션을 Azure에 배포
- 에이전트 도구 및 기능 구성
- 에이전트와 함께 검색 증강 생성(RAG) 구현
- 복잡한 워크플로를 위한 다중 에이전트 아키텍처 설계
- 일반적인 에이전트 배포 문제 해결

---

## 🤖 에이전트가 챗봇과 다른 점은?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Behavior** | 프롬프트에 응답 | 자율적으로 행동 수행 |
| **Tools** | 없음 | API 호출, 검색, 코드 실행 가능 |
| **Memory** | 세션 기반만 | 세션 간 지속 메모리 |
| **Planning** | 단일 응답 | 다단계 추론 |
| **Collaboration** | 단일 엔터티 | 다른 에이전트와 협력 가능 |

### 간단한 비유

- **챗봇** = 안내 데스크에서 질문에 답하는 친절한 직원
- **AI 에이전트** = 전화를 걸고, 약속을 잡고, 작업을 대신 처리해 주는 개인 비서

---

## 🚀 빠른 시작: 첫 에이전트 배포

### 옵션 1: Foundry Agents 템플릿 (권장)

```bash
# AI 에이전트 템플릿 초기화
azd init --template get-started-with-ai-agents

# Azure에 배포
azd up
```

**배포되는 항목:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (RAG용)
- ✅ Azure Container Apps (웹 인터페이스)
- ✅ Application Insights (모니터링)

**소요 시간:** ~15-20분
**비용:** ~$100-150/month (개발 환경)

### 옵션 2: Prompty를 사용한 OpenAI 에이전트

```bash
# Prompty 기반 에이전트 템플릿을 초기화
azd init --template agent-openai-python-prompty

# Azure에 배포
azd up
```

**배포되는 항목:**
- ✅ Azure Functions (서버리스 에이전트 실행)
- ✅ Azure OpenAI
- ✅ Prompty 구성 파일
- ✅ 샘플 에이전트 구현

**소요 시간:** ~10-15분
**비용:** ~$50-100/month (개발 환경)

### 옵션 3: RAG 채팅 에이전트

```bash
# RAG 채팅 템플릿 초기화
azd init --template azure-search-openai-demo

# Azure에 배포
azd up
```

**배포되는 항목:**
- ✅ Azure OpenAI
- ✅ 샘플 데이터가 포함된 Azure AI Search
- ✅ 문서 처리 파이프라인
- ✅ 인용이 포함된 채팅 인터페이스

**소요 시간:** ~15-25분
**비용:** ~$80-150/month (개발 환경)

---

## 🏗️ 에이전트 아키텍처 패턴

### 패턴 1: 도구를 가진 단일 에이전트

가장 단순한 에이전트 패턴 - 여러 도구를 사용할 수 있는 한 명의 에이전트.

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**적합한 용도:**
- 고객 지원 봇
- 리서치 어시스턴트
- 데이터 분석 에이전트

**AZD 템플릿:** `azure-search-openai-demo`

### 패턴 2: RAG 에이전트 (검색 증강 생성)

응답을 생성하기 전에 관련 문서를 검색하는 에이전트.

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**적합한 용도:**
- 엔터프라이즈 지식 베이스
- 문서 Q&A 시스템
- 컴플라이언스 및 법률 조사

**AZD 템플릿:** `azure-search-openai-demo`

### 패턴 3: 다중 에이전트 시스템

복잡한 작업을 함께 수행하는 여러 전문화된 에이전트들.

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**적합한 용도:**
- 복잡한 콘텐츠 생성
- 다단계 워크플로
- 다양한 전문성이 필요한 작업

**자세히 보기:** [다중 에이전트 조정 패턴](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ 에이전트 도구 구성

에이전트는 도구를 사용할 수 있을 때 강력해집니다. 일반적인 도구를 구성하는 방법은 다음과 같습니다:

### Foundry Agents에서의 도구 구성

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# 사용자 정의 도구 정의
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# 도구를 사용하여 에이전트 생성
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### 환경 구성

```bash
# 에이전트별 환경 변수를 설정합니다
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# 업데이트된 구성으로 배포합니다
azd deploy
```

---

## 📊 에이전트 모니터링

### Application Insights 통합

모든 AZD 에이전트 템플릿에는 모니터링을 위한 Application Insights가 포함되어 있습니다:

```bash
# 모니터링 대시보드 열기
azd monitor --overview

# 실시간 로그 보기
azd monitor --logs

# 실시간 메트릭 보기
azd monitor --live
```

### 추적할 주요 지표

| Metric | Description | Target |
|--------|-------------|--------|
| 응답 지연 시간 | 응답 생성 시간 | < 5초 |
| 토큰 사용량 | 요청당 토큰 | 비용 모니터링 |
| 도구 호출 성공률 | 성공적인 도구 실행 비율 | > 95% |
| 오류 비율 | 실패한 에이전트 요청 | < 1% |
| 사용자 만족도 | 피드백 점수 | > 4.0/5.0 |

### 에이전트용 맞춤 로깅

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 비용 고려사항

### 패턴별 예상 월별 비용

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| 단일 에이전트 | $50-100 | $200-500 |
| RAG 에이전트 | $80-150 | $300-800 |
| 다중 에이전트 (2-3 에이전트) | $150-300 | $500-1,500 |
| 엔터프라이즈 다중 에이전트 | $300-500 | $1,500-5,000+ |

### 비용 최적화 팁

1. **간단한 작업에는 GPT-4o-mini 사용**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **반복되는 쿼리에 대해 캐싱 구현**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **토큰 제한 설정**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # 응답 길이 제한
   )
   ```

4. **사용하지 않을 때는 스케일 투 제로**
   ```bash
   # Container Apps는 자동으로 0까지 축소됩니다.
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 에이전트 문제 해결

### 일반적인 문제 및 해결책

<details>
<summary><strong>❌ 에이전트가 도구 호출에 응답하지 않음</strong></summary>

```bash
# 도구가 올바르게 등록되었는지 확인
azd show

# OpenAI 배포를 확인
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# 에이전트 로그를 확인
azd monitor --logs
```

**일반적인 원인:**
- 도구 함수 시그니처 불일치
- 필수 권한 누락
- API 엔드포인트에 접근 불가
</details>

<details>
<summary><strong>❌ 에이전트 응답의 높은 지연 시간</strong></summary>

```bash
# 병목 현상이 있는지 Application Insights를 확인하세요
azd monitor --live

# 더 빠른 모델 사용을 고려하세요
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**최적화 팁:**
- 스트리밍 응답 사용
- 응답 캐싱 구현
- 컨텍스트 창 크기 줄이기
</details>

<details>
<summary><strong>❌ 에이전트가 부정확하거나 환각 같은 정보를 반환함</strong></summary>

```python
# 더 나은 시스템 프롬프트로 개선하기
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# 근거 제공을 위해 검색 기능 추가하기
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # 응답을 문서에 근거시키기
)
```
</details>

<details>
<summary><strong>❌ 토큰 한도 초과 오류</strong></summary>

```python
# 컨텍스트 창 관리 구현
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # 대략적인 추정
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 실습 과제

### 실습 1: 기본 에이전트 배포 (20분)

**목표:** AZD를 사용하여 첫 AI 에이전트 배포

```bash
# 1단계: 템플릿 초기화
azd init --template get-started-with-ai-agents

# 2단계: Azure에 로그인
azd auth login

# 3단계: 배포
azd up

# 4단계: 에이전트 테스트
# 출력에 표시된 URL 열기

# 5단계: 정리
azd down --force --purge
```

**성공 기준:**
- [ ] 에이전트가 질문에 응답함
- [ ] 모니터링 대시보드에 접근할 수 있음
- [ ] 리소스가 성공적으로 정리됨

### 실습 2: 맞춤 도구 추가 (30분)

**목표:** 에이전트에 맞춤 도구 확장

1. 에이전트 템플릿 배포
2. 새로운 도구 함수 생성:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # 날씨 서비스에 대한 API 호출
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. 에이전트에 도구 등록
4. 에이전트가 새 도구를 사용하는지 테스트

**성공 기준:**
- [ ] 에이전트가 날씨 관련 질의를 인식함
- [ ] 도구가 올바르게 호출됨
- [ ] 응답에 날씨 정보가 포함됨

### 실습 3: RAG 에이전트 구축 (45분)

**목표:** 문서에서 질문에 답하는 에이전트 생성

```bash
# RAG 템플릿을 배포하세요
azd init --template azure-search-openai-demo
azd up

# 문서를 업로드하세요
# (템플릿의 데이터 수집 가이드를 따르세요)

# 도메인별 질문으로 테스트하세요
```

**성공 기준:**
- [ ] 에이전트가 업로드된 문서에서 답변함
- [ ] 응답에 출처(인용)가 포함됨
- [ ] 범위를 벗어난 질문에 대해 환각 없음

---

## 📚 다음 단계

이제 AI 에이전트를 이해했으므로 다음 고급 주제를 탐색하세요:

| Topic | Description | Link |
|-------|-------------|------|
| **다중 에이전트 시스템** | 여러 협력 에이전트로 시스템 구축 | [소매 다중 에이전트 예제](../../examples/retail-scenario.md) |
| **조정 패턴** | 오케스트레이션 및 통신 패턴 학습 | [조정 패턴](../chapter-06-pre-deployment/coordination-patterns.md) |
| **프로덕션 배포** | 엔터프라이즈 준비된 에이전트 배포 | [프로덕션 AI 실무](production-ai-practices.md) |
| **에이전트 평가** | 에이전트 성능 테스트 및 평가 | [AI 문제 해결](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 추가 자료

### 공식 문서
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### 에이전트용 AZD 템플릿
- [AI 에이전트 시작하기](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI 데모](https://github.com/Azure-Samples/azure-search-openai-demo)

### 커뮤니티 자료
- [Awesome AZD - 에이전트 템플릿](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigation**
- **Previous Lesson**: [AI 모델 배포](ai-model-deployment.md)
- **Next Lesson**: [프로덕션 AI 실무](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책사항:
이 문서는 AI 번역 서비스 Co-op Translator(https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 저희는 정확성을 위해 노력하지만 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의해 주시기 바랍니다. 원문(원어) 문서는 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 오역에 대해서는 당사가 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->