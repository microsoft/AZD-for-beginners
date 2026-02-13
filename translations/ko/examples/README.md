# 예제 - 실용적인 AZD 템플릿 및 구성

**예제로 배우기 - 챕터별 정리**
- **📚 코스 홈**: [초보자를 위한 AZD](../README.md)
- **📖 챕터 매핑**: 학습 난이도별로 정리된 예제
- **🚀 로컬 예제**: [유통 다중 에이전트 솔루션](retail-scenario.md)
- **🤖 외부 AI 예제**: Azure 샘플 리포지토리 링크

> **📍 중요: 로컬 예제와 외부 예제 구분**  
> 이 리포지토리는 **4개의 완전한 로컬 예제**를 포함하고 있습니다:  
> - **Azure OpenAI 채팅** (GPT-4 배포와 채팅 인터페이스)  
> - **컨테이너 앱** (간단한 Flask API + 마이크로서비스)  
> - **데이터베이스 앱** (웹 + SQL 데이터베이스)  
> - **유통 다중 에이전트** (기업용 AI 솔루션)  
>  
> 추가 예제는 클론 가능한 Azure-Samples 리포지토리에 대한 **외부 참조**입니다.

## 소개

이 디렉터리는 실습을 통한 Azure Developer CLI 학습을 돕기 위한 실용적인 예제와 참조를 제공합니다. 유통 다중 에이전트 시나리오는 이 리포지토리에 포함된 완전한 생산 준비된 구현체입니다. 추가 예제는 다양한 AZD 패턴을 보여주는 공식 Azure 샘플을 참조합니다.

### 난이도 평가 표기

- ⭐ **초급** - 기본 개념, 단일 서비스, 15-30분
- ⭐⭐ **중급** - 다중 서비스, 데이터베이스 통합, 30-60분
- ⭐⭐⭐ **고급** - 복잡한 아키텍처, AI 통합, 1-2시간
- ⭐⭐⭐⭐ **전문가** - 생산 준비, 기업 패턴, 2시간 이상

## 🎯 이 리포지토리에 실제로 포함된 내용

### ✅ 로컬 구현 (즉시 사용 가능)

#### [Azure OpenAI 채팅 애플리케이션](azure-openai-chat/README.md) 🆕  
**이 리포지토리에 포함된 완전한 GPT-4 배포 및 채팅 인터페이스**

- **위치:** `examples/azure-openai-chat/`
- **난이도:** ⭐⭐ (중급)
- **포함 내용:**
  - Azure OpenAI 완전 배포(GPT-4)
  - 파이썬 커맨드라인 채팅 인터페이스
  - 안전한 API 키 관리를 위한 Key Vault 통합
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
**이 리포지토리에 포함된 종합 컨테이너 배포 예제**

- **위치:** `examples/container-app/`
- **난이도:** ⭐-⭐⭐⭐⭐ (초급부터 고급까지)
- **포함 내용:**
  - [마스터 가이드](container-app/README.md) - 컨테이너 배포 전체 개요
  - [간단한 Flask API](../../../examples/container-app/simple-flask-api) - 기본 REST API 예제
  - [마이크로서비스 아키텍처](../../../examples/container-app/microservices) - 생산 준비 다중 서비스 배포
  - 빠른 시작, 생산 단계, 고급 패턴
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

#### [유통 다중 에이전트 솔루션](retail-scenario.md) 🆕  
**이 리포지토리에 포함된 완전한 생산준비 구현체**

- **위치:** `examples/retail-multiagent-arm-template/`
- **난이도:** ⭐⭐⭐⭐ (고급)
- **포함 내용:**
  - 완전한 ARM 배포 템플릿
  - 다중 에이전트 아키텍처 (고객 + 재고)
  - Azure OpenAI 통합
  - RAG 기반 AI 검색
  - 종합 모니터링
  - 원클릭 배포 스크립트

**빠른 시작:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**기술:** Azure OpenAI, AI 검색, 컨테이너 앱, Cosmos DB, Application Insights

---

## 🔗 외부 Azure 샘플 (클론 후 사용)

다음 예제는 공식 Azure-Samples 리포지토리에서 관리됩니다. 클론하여 다양한 AZD 패턴을 탐험하세요:

### 간단한 애플리케이션 (1-2 챕터)

| 템플릿 | 리포지토리 | 난이도 | 서비스 |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [로컬: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **마이크로서비스** | [로컬: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | 다중 서비스, 서비스 버스, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask 컨테이너** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**사용 방법:**
```bash
# 모든 예제 복제
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# 배포
azd up
```
  
### AI 애플리케이션 예제 (2, 5, 8 챕터)

| 템플릿 | 리포지토리 | 난이도 | 포커스 |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI 채팅** | [로컬: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 배포 |
| **AI 채팅 빠른 시작** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | 기본 AI 채팅 |
| **AI 에이전트** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | 에이전트 프레임워크 |
| **검색 + OpenAI 데모** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG 패턴 |
| **Contoso 채팅** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | 기업용 AI |

### 데이터베이스 & 고급 패턴 (3-8 챕터)

| 템플릿 | 리포지토리 | 난이도 | 포커스 |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | 데이터베이스 통합 |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL 서버리스 |
| **Java 마이크로서비스** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | 다중 서비스 |
| **ML 파이프라인** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## 학습 목표

이 예제를 진행하며 다음을 배울 수 있습니다:
- 현실적인 애플리케이션 시나리오로 Azure Developer CLI 워크플로우 연습
- 다양한 애플리케이션 아키텍처 및 azd 구현 이해
- 다양한 Azure 서비스에 대한 Infrastructure as Code 패턴 마스터
- 구성 관리 및 환경별 배포 전략 적용
- 실무 환경에서 모니터링, 보안, 확장성 패턴 구현
- 실제 배포 시나리오에서 문제 해결 및 디버깅 경험 쌓기

## 학습 결과

예제 완료 후 다음이 가능합니다:
- Azure Developer CLI를 사용하여 다양한 애플리케이션 유형 자신 있게 배포
- 제공된 템플릿을 자신의 애플리케이션 요구사항에 맞게 조정
- Bicep을 사용한 맞춤형 인프라 패턴 설계 및 구현
- 적절한 종속성 설정과 함께 복잡한 다중 서비스 애플리케이션 구성
- 실제 시나리오에서 보안, 모니터링 및 성능 최적화 적용
- 실용적인 경험을 기반으로 배포 문제 해결 및 최적화

## 디렉터리 구조

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

> **💡 AZD가 처음인가요?** 예제 #1 (Flask API)부터 시작하세요 - 약 20분 소요, 핵심 개념 습득 가능.

### 초보자용
1. **[컨테이너 앱 - Python Flask API](../../../examples/container-app/simple-flask-api)** (로컬) ⭐  
   스케일 투 제로가 가능한 간단한 REST API 배포  
   **소요 시간:** 20-25분 | **비용:** 월 $0-5  
   **학습 내용:** 기본 azd 워크플로우, 컨테이너화, 헬스 프로브  
   **예상 결과:** "Hello, World!" 반환하는 작동하는 API 엔드포인트 및 모니터링

2. **[간단 웹 앱 - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   MongoDB와 함께 Node.js Express 웹 애플리케이션 배포  
   **소요 시간:** 25-35분 | **비용:** 월 $10-30  
   **학습 내용:** 데이터베이스 통합, 환경 변수, 연결 문자열  
   **예상 결과:** 생성/읽기/수정/삭제 기능이 있는 할 일 목록 앱

3. **[정적 웹사이트 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Azure Static Web Apps로 React 정적 웹사이트 호스팅  
   **소요 시간:** 20-30분 | **비용:** 월 $0-10  
   **학습 내용:** 정적 호스팅, 서버리스 함수, CDN 배포  
   **예상 결과:** API 백엔드가 있는 React UI, 자동 SSL, 글로벌 CDN

### 중급 사용자용
4. **[Azure OpenAI 채팅 애플리케이션](../../../examples/azure-openai-chat)** (로컬) ⭐⭐  
   GPT-4 및 안전한 API 키 관리와 함께 배포  
   **소요 시간:** 35-45분 | **비용:** 월 $50-200  
   **학습 내용:** Azure OpenAI 배포, Key Vault 통합, 토큰 추적  
   **예상 결과:** GPT-4가 탑재된 채팅 애플리케이션 및 비용 모니터링

5. **[컨테이너 앱 - 마이크로서비스](../../../examples/container-app/microservices)** (로컬) ⭐⭐⭐⭐  
   생산 준비용 다중 서비스 아키텍처  
   **소요 시간:** 45-60분 | **비용:** 월 $50-150  
   **학습 내용:** 서비스 간 통신, 메시지 큐잉, 분산 추적  
   **예상 결과:** 모니터링이 가능한 2-서비스 시스템 (API 게이트웨이 + 상품 서비스)

6. **[데이터베이스 앱 - C# 및 Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   C# API와 Azure SQL 데이터베이스 웹 애플리케이션  
   **소요 시간:** 30-45분 | **비용:** 월 $20-80  
   **학습 내용:** Entity Framework, 데이터베이스 마이그레이션, 연결 보안  
   **예상 결과:** Azure SQL 백엔드가 있는 C# API 및 자동 스키마 배포

7. **[서버리스 함수 - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   HTTP 트리거와 Cosmos DB가 포함된 Python Azure Functions  
   **소요 시간:** 30-40분 | **비용:** 월 $10-40  
   **학습 내용:** 이벤트 기반 아키텍처, 서버리스 확장, NoSQL 통합  
   **예상 결과:** HTTP 요청에 응답하는 함수 앱과 Cosmos DB 스토리지

8. **[마이크로서비스 - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Container Apps 및 API 게이트웨이가 포함된 다중 서비스 Java 애플리케이션  
   **소요 시간:** 60-90분 | **비용:** 월 $80-200  
   **학습 내용:** Spring Boot 배포, 서비스 메시, 로드 밸런싱  
   **예상 결과:** 서비스 검색 및 라우팅이 가능한 다중 서비스 Java 시스템

### Microsoft Foundry 템플릿

1. **[Azure OpenAI 채팅 앱 - 로컬 예제](../../../examples/azure-openai-chat)** ⭐⭐  
   완전한 GPT-4 배포 및 채팅 인터페이스  
   **소요 시간:** 35-45분 | **비용:** 월 $50-200  
   **예상 결과:** 토큰 추적 및 비용 모니터링이 가능한 채팅 애플리케이션

2. **[Azure Search + OpenAI 데모](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   RAG 아키텍처가 적용된 지능형 채팅 애플리케이션  
   **소요 시간:** 60-90분 | **비용:** 월 $100-300  
   **예상 결과:** 문서 검색 및 인용이 가능한 RAG 기반 채팅 인터페이스

3. **[AI 문서 처리](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Azure AI 서비스를 활용한 문서 분석  
   **소요 시간:** 40-60분 | **비용:** 월 $20-80  
   **예상 결과:** 업로드된 문서에서 텍스트, 표, 엔터티 추출 API

4. **[머신러닝 파이프라인](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Azure 머신러닝을 활용한 MLOps 워크플로우  
   **소요 시간:** 2-3시간 | **비용:** 월 $150-500  
   **예상 결과:** 훈련, 배포, 모니터링이 자동화된 ML 파이프라인

### 실제 시나리오

#### **유통 다중 에이전트 솔루션** 🆕  
**[완전한 구현 가이드](./retail-scenario.md)**

AZD를 사용한 엔터프라이즈급 AI 애플리케이션 배포를 보여주는 포괄적이고 생산 준비된 다중 에이전트 고객 지원 솔루션입니다. 이 시나리오는:

- **완전한 아키텍처**: 고객 서비스 및 재고 관리 전문 에이전트가 포함된 다중 에이전트 시스템
- **생산 인프라**: 다중 지역 Azure OpenAI 배포, AI 검색, 컨테이너 앱 및 포괄적인 모니터링  
- **즉시 배포 가능한 ARM 템플릿**: 여러 구성 모드(최소/표준/프리미엄)로 원클릭 배포  
- **고급 기능**: 레드 팀 보안 검증, 에이전트 평가 프레임워크, 비용 최적화 및 문제 해결 가이드  
- **실제 비즈니스 컨텍스트**: 파일 업로드, 검색 통합 및 동적 확장 기능을 갖춘 소매업체 고객 지원 사용 사례  

**기술 스택**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, 컨테이너 앱, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**복잡도**: ⭐⭐⭐⭐ (고급 - 엔터프라이즈 생산 준비)  

**적합 대상**: AI 개발자, 솔루션 아키텍트 및 다중 에이전트 시스템을 구축하는 팀  

**빠른 시작**: 포함된 ARM 템플릿을 사용하여 `./deploy.sh -g myResourceGroup` 명령어로 30분 이내에 완전한 솔루션 배포  

## 📋 사용 지침

### 사전 조건

예제를 실행하기 전에:  
- ✅ 소유자 또는 기여자 권한이 있는 Azure 구독  
- ✅ Azure Developer CLI 설치 ([설치 가이드](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop 실행 중(컨테이너 예제용)  
- ✅ 적절한 Azure 할당량(예제별 요구사항 확인)  

> **💰 비용 경고:** 모든 예제는 실제 Azure 리소스를 생성하여 요금이 발생합니다. 비용 추정치는 각 README 파일을 참조하세요. 완료 후 `azd down`을 실행하여 지속적인 비용 발생을 방지하십시오.  

### 로컬에서 예제 실행하기

1. **예제 복제 또는 복사**  
   ```bash
   # 원하는 예제로 이동
   cd examples/simple-web-app
   ```
  
2. **AZD 환경 초기화**  
   ```bash
   # 기존 템플릿으로 초기화
   azd init
   
   # 또는 새 환경을 생성하세요
   azd env new my-environment
   ```
  
3. **환경 구성**  
   ```bash
   # 필요한 변수를 설정합니다
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **배포**  
   ```bash
   # 인프라와 애플리케이션 배포
   azd up
   ```
  
5. **배포 확인**  
   ```bash
   # 서비스 엔드포인트 가져오기
   azd env get-values
   
   # 엔드포인트 테스트 (예시)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **성공 예상 지표:**  
   - ✅ `azd up`이 오류 없이 완료됨  
   - ✅ 서비스 엔드포인트에서 HTTP 200 응답  
   - ✅ Azure 포털에 "Running" 상태 표시  
   - ✅ Application Insights에서 텔레메트리 수신  

> **⚠️ 문제가 있나요?** 배포 문제 해결은 [일반 문제](../docs/chapter-07-troubleshooting/common-issues.md)를 참조하세요  

### 예제 맞춤화

각 예제에는 다음 항목이 포함됩니다:  
- **README.md** - 자세한 설정 및 맞춤화 지침  
- **azure.yaml** - 주석이 포함된 AZD 구성  
- **infra/** - 매개변수 설명과 함께 제공되는 Bicep 템플릿  
- **src/** - 샘플 애플리케이션 코드  
- **scripts/** - 일반 작업용 도우미 스크립트  

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
- 보안 및 컴플라이언스 구현  

#### **생산 준비 패턴**  
- 고가용성 구성  
- 모니터링 및 관측성  
- CI/CD 통합  
- 재해 복구 설정  

## 📖 예제 설명

### 단순 웹 앱 - Node.js Express  
**기술 스택**: Node.js, Express, MongoDB, 컨테이너 앱  
**복잡도**: 초급  
**개념**: 기본 배포, REST API, NoSQL 데이터베이스 통합  

### 정적 웹사이트 - React SPA  
**기술 스택**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**복잡도**: 초급  
**개념**: 정적 호스팅, 서버리스 백엔드, 최신 웹 개발  

### 컨테이너 앱 - Python Flask  
**기술 스택**: Python Flask, Docker, 컨테이너 앱, 컨테이너 레지스트리, Application Insights  
**복잡도**: 초급  
**개념**: 컨테이너화, REST API, 스케일 투 제로, 헬스 프로브, 모니터링  
**위치**: [로컬 예제](../../../examples/container-app/simple-flask-api)  

### 컨테이너 앱 - 마이크로서비스 아키텍처  
**기술 스택**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, 컨테이너 앱  
**복잡도**: 고급  
**개념**: 다중 서비스 아키텍처, 서비스 간 통신, 메시지 큐잉, 분산 추적  
**위치**: [로컬 예제](../../../examples/container-app/microservices)  

### 데이터베이스 앱 - C#과 Azure SQL  
**기술 스택**: C# ASP.NET Core, Azure SQL Database, App Service  
**복잡도**: 중급  
**개념**: 엔티티 프레임워크, 데이터베이스 연결, 웹 API 개발  

### 서버리스 함수 - Python Azure Functions  
**기술 스택**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**복잡도**: 중급  
**개념**: 이벤트 기반 아키텍처, 서버리스 컴퓨팅, 풀스택 개발  

### 마이크로서비스 - Java Spring Boot  
**기술 스택**: Java Spring Boot, 컨테이너 앱, Service Bus, API Gateway  
**복잡도**: 중급  
**개념**: 마이크로서비스 통신, 분산 시스템, 엔터프라이즈 패턴  

### Microsoft Foundry 예제

#### Azure OpenAI 채팅 앱  
**기술 스택**: Azure OpenAI, Cognitive Search, App Service  
**복잡도**: 중급  
**개념**: RAG 아키텍처, 벡터 검색, LLM 통합  

#### AI 문서 처리  
**기술 스택**: Azure AI Document Intelligence, Storage, Functions  
**복잡도**: 중급  
**개념**: 문서 분석, OCR, 데이터 추출  

#### 머신 러닝 파이프라인  
**기술 스택**: Azure ML, MLOps, 컨테이너 레지스트리  
**복잡도**: 고급  
**개념**: 모델 학습, 배포 파이프라인, 모니터링  

## 🛠 구성 예제

`configurations/` 디렉터리는 재사용 가능한 컴포넌트를 포함합니다:

### 환경 구성  
- 개발 환경 설정  
- 스테이징 환경 구성  
- 생산 준비 구성  
- 다중 지역 배포 설정  

### Bicep 모듈  
- 재사용 가능한 인프라 구성 요소  
- 공통 리소스 패턴  
- 보안 강화 템플릿  
- 비용 최적화 구성  

### 도우미 스크립트  
- 환경 설정 자동화  
- 데이터베이스 마이그레이션 스크립트  
- 배포 검증 도구  
- 비용 모니터링 유틸리티  

## 🔧 맞춤화 가이드

### 사용 사례에 맞게 예제 적응하기

1. **사전 조건 검토**  
   - Azure 서비스 요구사항 확인  
   - 구독 제한 사항 확인  
   - 비용 영향 이해  

2. **구성 수정**  
   - `azure.yaml` 서비스 정의 업데이트  
   - Bicep 템플릿 맞춤화  
   - 환경 변수 조정  

3. **철저한 테스트**  
   - 먼저 개발 환경에 배포  
   - 기능 검증  
   - 확장성 및 성능 테스트  

4. **보안 검토**  
   - 접근 통제 검토  
   - 비밀 관리 구현  
   - 모니터링 및 알림 활성화  

## 📊 비교 매트릭스

| 예제 | 서비스 수 | 데이터베이스 | 인증 | 모니터링 | 복잡도 |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI 채팅** (로컬) | 2 | ❌ | Key Vault | 전체 | ⭐⭐ |
| **Python Flask API** (로컬) | 1 | ❌ | 기본 | 전체 | ⭐ |
| **마이크로서비스** (로컬) | 5+ | ✅ | 엔터프라이즈 | 고급 | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | 기본 | 기본 | ⭐ |
| React SPA + Functions | 3 | ✅ | 기본 | 전체 | ⭐ |
| Python Flask 컨테이너 | 2 | ❌ | 기본 | 전체 | ⭐ |
| C# Web API + SQL | 2 | ✅ | 전체 | 전체 | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | 전체 | 전체 | ⭐⭐ |
| Java 마이크로서비스 | 5+ | ✅ | 전체 | 전체 | ⭐⭐ |
| Azure OpenAI 채팅 | 3 | ✅ | 전체 | 전체 | ⭐⭐⭐ |
| AI 문서 처리 | 2 | ❌ | 기본 | 전체 | ⭐⭐ |
| ML 파이프라인 | 4+ | ✅ | 전체 | 전체 | ⭐⭐⭐⭐ |
| **소매 다중 에이전트** (로컬) | **8+** | **✅** | **엔터프라이즈** | **고급** | **⭐⭐⭐⭐** |

## 🎓 학습 경로

### 권장 진행 순서

1. **단순 웹 앱으로 시작**  
   - 기본 AZD 개념 학습  
   - 배포 워크플로우 이해  
   - 환경 관리 연습  

2. **정적 웹사이트 시도**  
   - 다양한 호스팅 옵션 탐색  
   - CDN 통합 학습  
   - DNS 구성 이해  

3. **컨테이너 앱으로 이동**  
   - 컨테이너화 기본 학습  
   - 스케일링 개념 이해  
   - Docker 실습  

4. **데이터베이스 통합 추가**  
   - 데이터베이스 프로비저닝 학습  
   - 연결 문자열 이해  
   - 비밀 관리 연습  

5. **서버리스 탐색**  
   - 이벤트 기반 아키텍처 이해  
   - 트리거 및 바인딩 학습  
   - API 실습  

6. **마이크로서비스 구축**  
   - 서비스 통신 학습  
   - 분산 시스템 이해  
   - 복잡한 배포 연습  

## 🔍 적합한 예제 찾기

### 기술 스택별  
- **컨테이너 앱**: [Python Flask API (로컬)](../../../examples/container-app/simple-flask-api), [마이크로서비스 (로컬)](../../../examples/container-app/microservices), Java 마이크로서비스  
- **Node.js**: Node.js Express Todo 앱, [마이크로서비스 API Gateway (로컬)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (로컬)](../../../examples/container-app/simple-flask-api), [마이크로서비스 상품 서비스 (로컬)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [마이크로서비스 주문 서비스 (로컬)](../../../examples/container-app/microservices), C# Web API + SQL 데이터베이스, Azure OpenAI 채팅 앱, ML 파이프라인  
- **Go**: [마이크로서비스 사용자 서비스 (로컬)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot 마이크로서비스  
- **React**: React SPA + Functions  
- **컨테이너**: [Python Flask (로컬)](../../../examples/container-app/simple-flask-api), [마이크로서비스 (로컬)](../../../examples/container-app/microservices), Java 마이크로서비스  
- **데이터베이스**: [마이크로서비스 (로컬)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI 채팅 (로컬)](../../../examples/azure-openai-chat)**, Azure OpenAI 채팅 앱, AI 문서 처리, ML 파이프라인, **소매 다중 에이전트 솔루션**  
- **다중 에이전트 시스템**: **소매 다중 에이전트 솔루션**  
- **OpenAI 통합**: **[Azure OpenAI 채팅 (로컬)](../../../examples/azure-openai-chat)**, 소매 다중 에이전트 솔루션  
- **엔터프라이즈 생산**: [마이크로서비스 (로컬)](../../../examples/container-app/microservices), **소매 다중 에이전트 솔루션**  

### 아키텍처 패턴별  
- **단순 REST API**: [Python Flask API (로컬)](../../../examples/container-app/simple-flask-api)  
- **모놀리식**: Node.js Express Todo, C# Web API + SQL  
- **정적 + 서버리스**: React SPA + Functions, Python Functions + SPA  
- **마이크로서비스**: [생산 마이크로서비스 (로컬)](../../../examples/container-app/microservices), Java Spring Boot 마이크로서비스  
- **컨테이너화**: [Python Flask (로컬)](../../../examples/container-app/simple-flask-api), [마이크로서비스 (로컬)](../../../examples/container-app/microservices)  
- **AI 기반**: **[Azure OpenAI 채팅 (로컬)](../../../examples/azure-openai-chat)**, Azure OpenAI 채팅 앱, AI 문서 처리, ML 파이프라인, **소매 다중 에이전트 솔루션**  
- **다중 에이전트 아키텍처**: **소매 다중 에이전트 솔루션**  
- **엔터프라이즈 다중 서비스**: [마이크로서비스 (로컬)](../../../examples/container-app/microservices), **소매 다중 에이전트 솔루션**  

### 복잡도 수준별  
- **초급**: [Python Flask API (로컬)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **중급**: **[Azure OpenAI 채팅 (로컬)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java 마이크로서비스, Azure OpenAI 채팅 앱, AI 문서 처리  
- **고급**: ML 파이프라인  
- **엔터프라이즈 생산 준비**: [마이크로서비스 (로컬)](../../../examples/container-app/microservices) (메시지 큐 포함 다중 서비스), **소매 다중 에이전트 솔루션** (ARM 템플릿 배포가 포함된 완전한 다중 에이전트 시스템)  

## 📚 추가 자료

### 문서 링크  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep 문서](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)  

### 커뮤니티 예제  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI 갤러리](https://azure.github.io/awesome-azd/)  
- [C#과 Azure SQL로 만든 Todo 앱](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Python과 MongoDB로 만든 Todo 앱](https://github.com/Azure-Samples/todo-python-mongo)
- [Node.js 및 PostgreSQL로 만든 Todo 앱](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [C# API와 React 웹 앱](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps 작업](https://github.com/Azure-Samples/container-apps-jobs)
- [Java로 만든 Azure Functions](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### 모범 사례
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 예제 기여하기

유용한 예제가 있나요? 기여를 환영합니다!

### 제출 가이드라인
1. 정해진 디렉터리 구조를 따르세요
2. 포괄적인 README.md를 포함하세요
3. 구성 파일에 주석을 추가하세요
4. 제출 전에 철저히 테스트하세요
5. 비용 추정과 사전 요구사항을 포함하세요

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

**전문가 팁**: 기술 스택에 맞는 가장 간단한 예제부터 시작하여 점차 복잡한 시나리오로 확장하세요. 각 예제는 이전 예제의 개념을 기반으로 합니다!

## 🚀 시작할 준비되셨나요?

### 학습 경로

1. **완전 초보인가요?** → [Flask API](../../../examples/container-app/simple-flask-api)부터 시작하세요 (⭐, 20분)
2. **기본 AZD 지식이 있나요?** → [마이크로서비스](../../../examples/container-app/microservices)를 시도해 보세요 (⭐⭐⭐⭐, 60분)
3. **AI 앱을 만들고 있나요?** → [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35분)부터 시작하거나 [소매 멀티 에이전트](retail-scenario.md) (⭐⭐⭐⭐, 2시간 이상)를 탐색해 보세요
4. **특정 기술 스택이 필요하나요?** → 위의 [적합한 예제 찾기](../../../examples) 섹션을 참고하세요

### 다음 단계

- ✅ 위의 [사전 요구사항](../../../examples)을 검토하세요
- ✅ 자신의 숙련도에 맞는 예제를 선택하세요 ([복잡도 등급](../../../examples) 참고)
- ✅ 배포 전에 예제의 README를 꼼꼼히 읽으세요
- ✅ 테스트 후 `azd down` 명령 실행을 위한 알림을 설정하세요
- ✅ GitHub 이슈 또는 토론을 통해 경험을 공유하세요

### 도움이 필요하신가요?

- 📖 [자주 묻는 질문(FAQ)](../resources/faq.md) - 자주 묻는 질문에 대한 답변
- 🐛 [문제 해결 가이드](../docs/chapter-07-troubleshooting/common-issues.md) - 배포 문제 해결
- 💬 [GitHub 토론](https://github.com/microsoft/AZD-for-beginners/discussions) - 커뮤니티에 질문하기
- 📚 [학습 가이드](../resources/study-guide.md) - 학습 내용 강화

---

**내비게이션**
- **📚 강의 홈**: [초보자를 위한 AZD](../README.md)
- **📖 학습 자료**: [학습 가이드](../resources/study-guide.md) | [치트 시트](../resources/cheat-sheet.md) | [용어집](../resources/glossary.md)
- **🔧 리소스**: [FAQ](../resources/faq.md) | [문제 해결](../docs/chapter-07-troubleshooting/common-issues.md)

---

*마지막 업데이트: 2025년 11월 | [이슈 신고](https://github.com/microsoft/AZD-for-beginners/issues) | [예제 기여하기](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하였으나, 자동 번역 결과에는 오류나 부정확성이 있을 수 있음을 양지해 주시기 바랍니다. 원문은 해당 언어의 원본 문서가 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 어떠한 오해나 잘못된 해석에 대해서도 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->