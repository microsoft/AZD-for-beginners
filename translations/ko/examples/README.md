# 예제 - 실용적인 AZD 템플릿 및 구성

**예제를 통해 배우기 - 챕터별로 정리됨**
- **📚 코스 홈**: [AZD 초보자를 위한 가이드](../README.md)
- **📖 챕터 매핑**: 학습 난이도에 따라 정리된 예제
- **🚀 로컬 예제**: [소매 다중 에이전트 솔루션](retail-scenario.md)
- **🤖 외부 AI 예제**: Azure Samples 저장소 링크

> **📍 중요: 로컬 vs 외부 예제**  
> 이 저장소에는 **4개의 완전한 로컬 예제**가 포함되어 있습니다:  
> - **Azure OpenAI Chat** (채팅 인터페이스를 포함한 GPT-4 배포)  
> - **Container Apps** (간단한 Flask API + 마이크로서비스)  
> - **Database App** (웹 + SQL 데이터베이스)  
> - **소매 다중 에이전트** (엔터프라이즈 AI 솔루션)  
>  
> 추가 예제는 Azure-Samples 저장소의 **외부 참조**로, 클론하여 사용할 수 있습니다.

## 소개

이 디렉토리는 Azure Developer CLI를 실습을 통해 배우는 데 도움이 되는 실용적인 예제와 참조를 제공합니다. 소매 다중 에이전트 시나리오는 이 저장소에 포함된 완전한 프로덕션 준비 구현입니다. 추가 예제는 다양한 AZD 패턴을 보여주는 공식 Azure Samples를 참조합니다.

### 난이도 평가 기준

- ⭐ **초급** - 기본 개념, 단일 서비스, 15-30분
- ⭐⭐ **중급** - 다중 서비스, 데이터베이스 통합, 30-60분
- ⭐⭐⭐ **고급** - 복잡한 아키텍처, AI 통합, 1-2시간
- ⭐⭐⭐⭐ **전문가** - 프로덕션 준비, 엔터프라이즈 패턴, 2시간 이상

## 🎯 이 저장소에 실제로 포함된 내용

### ✅ 로컬 구현 (즉시 사용 가능)

#### [Azure OpenAI 채팅 애플리케이션](azure-openai-chat/README.md) 🆕
**이 저장소에 포함된 채팅 인터페이스를 갖춘 완전한 GPT-4 배포**

- **위치:** `examples/azure-openai-chat/`
- **난이도:** ⭐⭐ (중급)
- **포함된 내용:**
  - 완전한 Azure OpenAI 배포 (GPT-4)
  - Python 명령줄 채팅 인터페이스
  - API 키 보안을 위한 Key Vault 통합
  - Bicep 인프라 템플릿
  - 토큰 사용 및 비용 추적
  - 속도 제한 및 오류 처리

**빠른 시작:**
```bash
# 예제로 이동
cd examples/azure-openai-chat

# 모든 것을 배포
azd up

# 종속성을 설치하고 채팅 시작
pip install -r src/requirements.txt
python src/chat.py
```

**기술:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [컨테이너 앱 예제](container-app/README.md) 🆕
**이 저장소에 포함된 포괄적인 컨테이너 배포 예제**

- **위치:** `examples/container-app/`
- **난이도:** ⭐-⭐⭐⭐⭐ (초급부터 고급까지)
- **포함된 내용:**
  - [마스터 가이드](container-app/README.md) - 컨테이너 배포에 대한 완전한 개요
  - [간단한 Flask API](../../../examples/container-app/simple-flask-api) - 기본 REST API 예제
  - [마이크로서비스 아키텍처](../../../examples/container-app/microservices) - 프로덕션 준비 다중 서비스 배포
  - 빠른 시작, 프로덕션 및 고급 패턴
  - 모니터링, 보안 및 비용 최적화

**빠른 시작:**
```bash
# 마스터 가이드 보기
cd examples/container-app

# 간단한 Flask API 배포
cd simple-flask-api
azd up

# 마이크로서비스 예제 배포
cd ../microservices
azd up
```

**기술:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [소매 다중 에이전트 솔루션](retail-scenario.md) 🆕
**이 저장소에 포함된 완전한 프로덕션 준비 구현**

- **위치:** `examples/retail-multiagent-arm-template/`
- **난이도:** ⭐⭐⭐⭐ (고급)
- **포함된 내용:**
  - 완전한 ARM 배포 템플릿
  - 다중 에이전트 아키텍처 (고객 + 재고 관리)
  - Azure OpenAI 통합
  - RAG를 활용한 AI 검색
  - 포괄적인 모니터링
  - 원클릭 배포 스크립트

**빠른 시작:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**기술:** Azure OpenAI, AI 검색, Container Apps, Cosmos DB, Application Insights

---

## 🔗 외부 Azure Samples (클론하여 사용)

다음 예제는 공식 Azure-Samples 저장소에서 유지 관리됩니다. 다양한 AZD 패턴을 탐색하려면 클론하세요.

### 간단한 애플리케이션 (챕터 1-2)

| 템플릿 | 저장소 | 난이도 | 서비스 |
|:-------|:-------|:-------|:-------|
| **Python Flask API** | [로컬: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **마이크로서비스** | [로컬: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | 다중 서비스, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask 컨테이너** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**사용 방법:**
```bash
# 예제를 복제하세요
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 배포
azd up
```

### AI 애플리케이션 예제 (챕터 2, 5, 8)

| 템플릿 | 저장소 | 난이도 | 초점 |
|:-------|:-------|:-------|:-----|
| **Azure OpenAI Chat** | [로컬: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 배포 |
| **AI Chat 빠른 시작** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 기본 AI 채팅 |
| **AI 에이전트** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 에이전트 프레임워크 |
| **검색 + OpenAI 데모** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 패턴 |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 엔터프라이즈 AI |

### 데이터베이스 및 고급 패턴 (챕터 3-8)

| 템플릿 | 저장소 | 난이도 | 초점 |
|:-------|:-------|:-------|:-----|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 데이터베이스 통합 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL 서버리스 |
| **Java 마이크로서비스** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 다중 서비스 |
| **ML 파이프라인** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 학습 목표

이 예제를 통해 다음을 실습할 수 있습니다:
- 현실적인 애플리케이션 시나리오를 통해 Azure Developer CLI 워크플로우를 연습
- 다양한 애플리케이션 아키텍처와 AZD 구현 이해
- 다양한 Azure 서비스에 대한 코드로 인프라 패턴 마스터
- 구성 관리 및 환경별 배포 전략 적용
- 실용적인 맥락에서 모니터링, 보안 및 확장 패턴 구현
- 실제 배포 시나리오에서 문제 해결 및 디버깅 경험 쌓기

## 학습 결과

이 예제를 완료하면 다음을 수행할 수 있습니다:
- Azure Developer CLI를 사용하여 다양한 애플리케이션 유형을 자신 있게 배포
- 제공된 템플릿을 자신의 애플리케이션 요구사항에 맞게 조정
- Bicep을 사용하여 맞춤형 인프라 패턴 설계 및 구현
- 적절한 종속성을 가진 복잡한 다중 서비스 애플리케이션 구성
- 실제 시나리오에서 보안, 모니터링 및 성능 모범 사례 적용
- 실용적인 경험을 바탕으로 배포 문제를 해결하고 최적화

## 디렉토리 구조

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## 빠른 시작 예제

> **💡 AZD가 처음인가요?** 예제 #1 (Flask API)부터 시작하세요 - 약 20분 소요되며 핵심 개념을 배울 수 있습니다.

### 초보자를 위한 예제
1. **[컨테이너 앱 - Python Flask API](../../../examples/container-app/simple-flask-api)** (로컬) ⭐  
   간단한 REST API를 배포하고 자동 축소  
   **시간:** 20-25분 | **비용:** 월 $0-5  
   **배울 내용:** 기본 azd 워크플로우, 컨테이너화, 상태 확인  
   **예상 결과:** 모니터링이 포함된 "Hello, World!"를 반환하는 작동 API 엔드포인트

2. **[간단한 웹 앱 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB를 사용하는 Node.js Express 웹 애플리케이션 배포  
   **시간:** 25-35분 | **비용:** 월 $10-30  
   **배울 내용:** 데이터베이스 통합, 환경 변수, 연결 문자열  
   **예상 결과:** 생성/읽기/업데이트/삭제 기능이 있는 Todo 리스트 앱

3. **[정적 웹사이트 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps를 사용하여 React 정적 웹사이트 호스팅  
   **시간:** 20-30분 | **비용:** 월 $0-10  
   **배울 내용:** 정적 호스팅, 서버리스 함수, CDN 배포  
   **예상 결과:** API 백엔드가 포함된 React UI, 자동 SSL, 글로벌 CDN

### 중급 사용자용 예제
4. **[Azure OpenAI 채팅 애플리케이션](../../../examples/azure-openai-chat)** (로컬) ⭐⭐  
   GPT-4와 채팅 인터페이스 및 안전한 API 키 관리 배포  
   **시간:** 35-45분 | **비용:** 월 $50-200  
   **배울 내용:** Azure OpenAI 배포, Key Vault 통합, 토큰 추적  
   **예상 결과:** GPT-4와 비용 모니터링이 포함된 작동 채팅 애플리케이션

5. **[컨테이너 앱 - 마이크로서비스](../../../examples/container-app/microservices)** (로컬) ⭐⭐⭐⭐  
   프로덕션 준비 다중 서비스 아키텍처  
   **시간:** 45-60분 | **비용:** 월 $50-150  
   **배울 내용:** 서비스 간 통신, 메시지 큐잉, 분산 추적  
   **예상 결과:** 모니터링이 포함된 2-서비스 시스템 (API Gateway + Product Service)

6. **[데이터베이스 앱 - C#과 Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API와 Azure SQL 데이터베이스를 사용하는 웹 애플리케이션  
   **시간:** 30-45분 | **비용:** 월 $20-80  
   **배울 내용:** Entity Framework, 데이터베이스 마이그레이션, 연결 보안  
   **예상 결과:** 자동 스키마 배포가 포함된 C# API와 Azure SQL 백엔드

7. **[서버리스 함수 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP 트리거와 Cosmos DB를 사용하는 Python Azure Functions  
   **시간:** 30-40분 | **비용:** 월 $10-40  
   **배울 내용:** 이벤트 기반 아키텍처, 서버리스 확장, NoSQL 통합  
   **예상 결과:** Cosmos DB 저장소를 사용하는 HTTP 요청에 응답하는 함수 앱

8. **[마이크로서비스 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps와 API 게이트웨이를 사용하는 다중 서비스 Java 애플리케이션  
   **시간:** 60-90분 | **비용:** 월 $80-200  
   **배울 내용:** Spring Boot 배포, 서비스 메시, 로드 밸런싱  
   **예상 결과:** 서비스 검색 및 라우팅이 포함된 다중 서비스 Java 시스템

### Azure AI Foundry 템플릿

1. **[Azure OpenAI 채팅 앱 - 로컬 예제](../../../examples/azure-openai-chat)** ⭐⭐  
   채팅 인터페이스를 갖춘 완전한 GPT-4 배포  
   **시간:** 35-45분 | **비용:** 월 $50-200  
   **예상 결과:** 토큰 추적 및 비용 모니터링이 포함된 작동 채팅 애플리케이션

2. **[Azure 검색 + OpenAI 데모](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG 아키텍처를 활용한 지능형 채팅 애플리케이션  
   **시간:** 60-90분 | **비용:** 월 $100-300  
   **예상 결과:** 문서 검색 및 인용이 포함된 RAG 기반 채팅 인터페이스

3. **[AI 문서 처리](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI 서비스를 사용한 문서 분석  
   **시간:** 40-60분 | **비용:** 월 $20-80  
   **예상 결과:** 업로드된 문서에서 텍스트, 표 및 엔티티를 추출하는 API

4. **[머신 러닝 파이프라인](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure Machine Learning을 활용한 MLOps 워크플로우  
   **시간:** 2-3시간 | **비용:** 월 $150-500  
   **예상 결과:** 학습, 배포 및 모니터링이 포함된 자동화된 ML 파이프라인

### 실제 시나리오

#### **소매 다중 에이전트 솔루션** 🆕
**[완전한 구현 가이드](./retail-scenario.md)**

AZD를 사용한 엔터프라이즈급 AI 애플리케이션 배포를 보여주는 포괄적이고 프로덕션 준비된 다중 에이전트 고객 지원 솔루션. 이 시나리오는 다음을 제공합니다:

- **완전한 아키텍처**: 고객 서비스 및 재고 관리 에이전트가 포함된 다중 에이전트 시스템
- **프로덕션 인프라**: 다중 지역 Azure OpenAI 배포, AI 검색, 컨테이너 앱, 종합적인 모니터링
- **즉시 배포 가능한 ARM 템플릿**: 한 번의 클릭으로 여러 구성 모드(최소/표준/프리미엄)로 배포 가능
- **고급 기능**: 보안 검증을 위한 레드 팀 테스트, 에이전트 평가 프레임워크, 비용 최적화 및 문제 해결 가이드
- **실제 비즈니스 사례**: 파일 업로드, 검색 통합, 동적 확장을 포함한 소매업 고객 지원 사례

**기술**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**복잡도**: ⭐⭐⭐⭐ (고급 - 엔터프라이즈 프로덕션 준비 완료)

**적합 대상**: AI 개발자, 솔루션 아키텍트, 프로덕션 멀티 에이전트 시스템을 구축하는 팀

**빠른 시작**: 포함된 ARM 템플릿을 사용하여 `./deploy.sh -g myResourceGroup` 명령으로 30분 이내에 전체 솔루션 배포

## 📋 사용 지침

### 사전 요구 사항

예제를 실행하기 전에:
- ✅ 소유자 또는 기여자 권한이 있는 Azure 구독
- ✅ Azure Developer CLI 설치 ([설치 가이드](../docs/getting-started/installation.md))
- ✅ Docker Desktop 실행 중 (컨테이너 예제용)
- ✅ 적절한 Azure 할당량 (예제별 요구 사항 확인)

> **💰 비용 경고:** 모든 예제는 실제 Azure 리소스를 생성하며 비용이 발생합니다. 개별 README 파일에서 비용 추정치를 확인하세요. 완료 후 `azd down`을 실행하여 지속적인 비용을 방지하세요.

### 로컬에서 예제 실행

1. **예제 복제 또는 복사**
   ```bash
   # 원하는 예제로 이동하십시오
   cd examples/simple-web-app
   ```

2. **AZD 환경 초기화**
   ```bash
   # 기존 템플릿으로 초기화
   azd init
   
   # 또는 새 환경 생성
   azd env new my-environment
   ```

3. **환경 구성**
   ```bash
   # 필수 변수를 설정합니다
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **배포**
   ```bash
   # 인프라 및 애플리케이션 배포
   azd up
   ```

5. **배포 확인**
   ```bash
   # 서비스 엔드포인트 가져오기
   azd env get-values
   
   # 엔드포인트 테스트 (예시)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **성공 지표:**
   - ✅ `azd up`이 오류 없이 완료됨
   - ✅ 서비스 엔드포인트가 HTTP 200 반환
   - ✅ Azure 포털에서 "Running" 상태 표시
   - ✅ Application Insights에서 텔레메트리 수신

> **⚠️ 문제 발생 시?** 배포 문제 해결을 위해 [일반 문제](../docs/troubleshooting/common-issues.md)를 참조하세요.

### 예제 수정

각 예제에는 다음이 포함됩니다:
- **README.md** - 상세한 설정 및 사용자 정의 지침
- **azure.yaml** - 주석이 포함된 AZD 구성
- **infra/** - 매개변수 설명이 포함된 Bicep 템플릿
- **src/** - 샘플 애플리케이션 코드
- **scripts/** - 일반 작업을 위한 도우미 스크립트

## 🎯 학습 목표

### 예제 카테고리

#### **기본 배포**
- 단일 서비스 애플리케이션
- 간단한 인프라 패턴
- 기본 구성 관리
- 비용 효율적인 개발 환경

#### **고급 시나리오**
- 다중 서비스 아키텍처
- 복잡한 네트워킹 구성
- 데이터베이스 통합 패턴
- 보안 및 규정 준수 구현

#### **프로덕션 준비 패턴**
- 고가용성 구성
- 모니터링 및 가시성
- CI/CD 통합
- 재해 복구 설정

## 📖 예제 설명

### 간단한 웹 앱 - Node.js Express
**기술**: Node.js, Express, MongoDB, Container Apps  
**복잡도**: 초급  
**개념**: 기본 배포, REST API, NoSQL 데이터베이스 통합

### 정적 웹사이트 - React SPA
**기술**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**복잡도**: 초급  
**개념**: 정적 호스팅, 서버리스 백엔드, 현대적 웹 개발

### 컨테이너 앱 - Python Flask
**기술**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**복잡도**: 초급  
**개념**: 컨테이너화, REST API, 제로 스케일링, 상태 점검, 모니터링  
**위치**: [로컬 예제](../../../examples/container-app/simple-flask-api)

### 컨테이너 앱 - 마이크로서비스 아키텍처
**기술**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**복잡도**: 고급  
**개념**: 다중 서비스 아키텍처, 서비스 간 통신, 메시지 큐잉, 분산 추적  
**위치**: [로컬 예제](../../../examples/container-app/microservices)

### 데이터베이스 앱 - C#과 Azure SQL
**기술**: C# ASP.NET Core, Azure SQL Database, App Service  
**복잡도**: 중급  
**개념**: Entity Framework, 데이터베이스 연결, 웹 API 개발

### 서버리스 함수 - Python Azure Functions
**기술**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**복잡도**: 중급  
**개념**: 이벤트 기반 아키텍처, 서버리스 컴퓨팅, 풀스택 개발

### 마이크로서비스 - Java Spring Boot
**기술**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**복잡도**: 중급  
**개념**: 마이크로서비스 통신, 분산 시스템, 엔터프라이즈 패턴

### Azure AI Foundry 예제

#### Azure OpenAI 채팅 앱
**기술**: Azure OpenAI, Cognitive Search, App Service  
**복잡도**: 중급  
**개념**: RAG 아키텍처, 벡터 검색, LLM 통합

#### AI 문서 처리
**기술**: Azure AI Document Intelligence, Storage, Functions  
**복잡도**: 중급  
**개념**: 문서 분석, OCR, 데이터 추출

#### 머신러닝 파이프라인
**기술**: Azure ML, MLOps, Container Registry  
**복잡도**: 고급  
**개념**: 모델 학습, 배포 파이프라인, 모니터링

## 🛠 구성 예제

`configurations/` 디렉터리에는 재사용 가능한 구성 요소가 포함되어 있습니다:

### 환경 구성
- 개발 환경 설정
- 스테이징 환경 구성
- 프로덕션 준비 구성
- 다중 지역 배포 설정

### Bicep 모듈
- 재사용 가능한 인프라 구성 요소
- 일반적인 리소스 패턴
- 보안 강화 템플릿
- 비용 최적화 구성

### 도우미 스크립트
- 환경 설정 자동화
- 데이터베이스 마이그레이션 스크립트
- 배포 검증 도구
- 비용 모니터링 유틸리티

## 🔧 사용자 정의 가이드

### 예제를 사용 사례에 맞게 조정

1. **사전 요구 사항 검토**
   - Azure 서비스 요구 사항 확인
   - 구독 한도 확인
   - 비용 영향을 이해

2. **구성 수정**
   - `azure.yaml` 서비스 정의 업데이트
   - Bicep 템플릿 사용자 정의
   - 환경 변수 조정

3. **철저히 테스트**
   - 먼저 개발 환경에 배포
   - 기능 검증
   - 확장 및 성능 테스트

4. **보안 검토**
   - 액세스 제어 검토
   - 비밀 관리 구현
   - 모니터링 및 경고 활성화

## 📊 비교 매트릭스

| 예제 | 서비스 | 데이터베이스 | 인증 | 모니터링 | 복잡도 |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (로컬) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (로컬) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (로컬) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (로컬) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 학습 경로

### 추천 학습 순서

1. **간단한 웹 앱으로 시작**
   - 기본 AZD 개념 학습
   - 배포 워크플로 이해
   - 환경 관리 연습

2. **정적 웹사이트 시도**
   - 다양한 호스팅 옵션 탐색
   - CDN 통합 학습
   - DNS 구성 이해

3. **컨테이너 앱으로 이동**
   - 컨테이너화 기본 학습
   - 확장 개념 이해
   - Docker 연습

4. **데이터베이스 통합 추가**
   - 데이터베이스 프로비저닝 학습
   - 연결 문자열 이해
   - 비밀 관리 연습

5. **서버리스 탐색**
   - 이벤트 기반 아키텍처 이해
   - 트리거 및 바인딩 학습
   - API 연습

6. **마이크로서비스 구축**
   - 서비스 간 통신 학습
   - 분산 시스템 이해
   - 복잡한 배포 연습

## 🔍 적합한 예제 찾기

### 기술 스택별
- **컨테이너 앱**: [Python Flask API (로컬)](../../../examples/container-app/simple-flask-api), [Microservices (로컬)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (로컬)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (로컬)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (로컬)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (로컬)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (로컬)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **컨테이너**: [Python Flask (로컬)](../../../examples/container-app/simple-flask-api), [Microservices (로컬)](../../../examples/container-app/microservices), Java Microservices
- **데이터베이스**: [Microservices (로컬)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (로컬)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **멀티 에이전트 시스템**: **Retail Multi-Agent Solution**
- **OpenAI 통합**: **[Azure OpenAI Chat (로컬)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **엔터프라이즈 프로덕션**: [Microservices (로컬)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 아키텍처 패턴별
- **간단한 REST API**: [Python Flask API (로컬)](../../../examples/container-app/simple-flask-api)
- **모놀리식**: Node.js Express Todo, C# Web API + SQL
- **정적 + 서버리스**: React SPA + Functions, Python Functions + SPA
- **마이크로서비스**: [Production Microservices (로컬)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **컨테이너화**: [Python Flask (로컬)](../../../examples/container-app/simple-flask-api), [Microservices (로컬)](../../../examples/container-app/microservices)
- **AI 기반**: **[Azure OpenAI Chat (로컬)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **멀티 에이전트 아키텍처**: **Retail Multi-Agent Solution**
- **엔터프라이즈 다중 서비스**: [Microservices (로컬)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### 복잡도 수준별
- **초급**: [Python Flask API (로컬)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **중급**: **[Azure OpenAI Chat (로컬)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **고급**: ML Pipeline
- **엔터프라이즈 프로덕션 준비 완료**: [Microservices (로컬)](../../../examples/container-app/microservices) (메시지 큐잉 포함 다중 서비스), **Retail Multi-Agent Solution** (ARM 템플릿 배포를 포함한 완전한 멀티 에이전트 시스템)

## 📚 추가 자료

### 문서 링크
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### 커뮤니티 예제
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [C#와 Azure SQL을 사용한 Todo 앱](https://github.com/Azure-Samples/todo-csharp-sql)
- [Python과 MongoDB를 사용한 Todo 앱](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js와 PostgreSQL을 사용한 Todo 앱](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API를 사용하는 React 웹 앱](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps 작업](https://github.com/Azure-Samples/container-apps-jobs)
- [Java를 사용한 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 모범 사례
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 예제 기여하기

유용한 예제를 공유하고 싶으신가요? 기여를 환영합니다!

### 제출 지침
1. 정해진 디렉토리 구조를 따르세요
2. 포괄적인 README.md를 포함하세요
3. 설정 파일에 주석을 추가하세요
4. 제출 전에 철저히 테스트하세요
5. 비용 추정치와 사전 요구 사항을 포함하세요

### 예제 템플릿 구조
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**팁**: 사용 중인 기술 스택에 맞는 가장 간단한 예제부터 시작한 후 점차 복잡한 시나리오로 진행하세요. 각 예제는 이전 예제의 개념을 기반으로 구축됩니다!

## 🚀 시작할 준비가 되셨나요?

### 학습 경로

1. **완전 초보자이신가요?** → [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20분)부터 시작하세요
2. **AZD 기본 지식이 있으신가요?** → [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60분)를 시도해보세요
3. **AI 앱을 구축 중이신가요?** → [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35분)부터 시작하거나 [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2시간 이상)를 탐색하세요
4. **특정 기술 스택이 필요하신가요?** → [적합한 예제 찾기](../../../examples) 섹션을 활용하세요

### 다음 단계

- ✅ 위의 [사전 요구 사항](../../../examples)을 검토하세요
- ✅ 자신의 기술 수준에 맞는 예제를 선택하세요 ([복잡도 레전드](../../../examples) 참조)
- ✅ 배포 전에 예제의 README를 철저히 읽으세요
- ✅ 테스트 후 `azd down`을 실행할 알림을 설정하세요
- ✅ GitHub Issues 또는 Discussions를 통해 경험을 공유하세요

### 도움이 필요하신가요?

- 📖 [FAQ](../resources/faq.md) - 자주 묻는 질문에 대한 답변
- 🐛 [문제 해결 가이드](../docs/troubleshooting/common-issues.md) - 배포 문제 해결
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - 커뮤니티에 질문하기
- 📚 [학습 가이드](../resources/study-guide.md) - 학습 강화

---

**내비게이션**
- **📚 코스 홈**: [AZD For Beginners](../README.md)
- **📖 학습 자료**: [학습 가이드](../resources/study-guide.md) | [요약 자료](../resources/cheat-sheet.md) | [용어집](../resources/glossary.md)
- **🔧 리소스**: [FAQ](../resources/faq.md) | [문제 해결](../docs/troubleshooting/common-issues.md)

---

*최종 업데이트: 2025년 11월 | [문제 보고](https://github.com/microsoft/AZD-for-beginners/issues) | [예제 기여](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서를 해당 언어로 작성된 상태에서 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->