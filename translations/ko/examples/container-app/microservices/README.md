<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-19T20:53:17+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "ko"
}
-->
# 마이크로서비스 아키텍처 - 컨테이너 앱 예제

⏱️ **예상 소요 시간**: 25-35분 | 💰 **예상 비용**: 약 $50-100/월 | ⭐ **난이도**: 고급

AZD CLI를 사용하여 Azure Container Apps에 배포된 **간단하지만 기능적인** 마이크로서비스 아키텍처입니다. 이 예제는 서비스 간 통신, 컨테이너 오케스트레이션, 모니터링을 실용적인 2개의 서비스 설정으로 보여줍니다.

> **📚 학습 접근법**: 이 예제는 실제로 배포하고 학습할 수 있는 최소한의 2개 서비스 아키텍처(API 게이트웨이 + 백엔드 서비스)로 시작합니다. 이 기초를 마스터한 후, 전체 마이크로서비스 생태계로 확장하는 가이드를 제공합니다.

## 학습 내용

이 예제를 완료하면 다음을 배울 수 있습니다:
- 여러 컨테이너를 Azure Container Apps에 배포
- 내부 네트워킹을 통한 서비스 간 통신 구현
- 환경 기반 스케일링 및 상태 확인 구성
- Application Insights를 사용한 분산 애플리케이션 모니터링
- 마이크로서비스 배포 패턴 및 모범 사례 이해
- 간단한 아키텍처에서 복잡한 아키텍처로 점진적 확장 학습

## 아키텍처

### 1단계: 우리가 구축할 것 (이 예제에 포함됨)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**왜 간단하게 시작하나요?**
- ✅ 빠르게 배포하고 이해 가능 (25-35분)
- ✅ 복잡성 없이 핵심 마이크로서비스 패턴 학습
- ✅ 수정하고 실험할 수 있는 작동 코드 제공
- ✅ 학습 비용 절감 (~$50-100/월 vs $300-1400/월)
- ✅ 데이터베이스와 메시지 큐를 추가하기 전에 자신감 구축

**비유**: 운전을 배우는 것과 같습니다. 빈 주차장에서 시작(2개의 서비스), 기본을 마스터한 후 도시 교통으로 진행(5개 이상의 서비스와 데이터베이스).

### 2단계: 미래 확장 (참조 아키텍처)

2개 서비스 아키텍처를 마스터한 후 다음으로 확장할 수 있습니다:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

"확장 가이드" 섹션에서 단계별 지침을 확인하세요.

## 포함된 기능

✅ **서비스 검색**: 컨테이너 간 자동 DNS 기반 검색  
✅ **로드 밸런싱**: 복제본 간 내장 로드 밸런싱  
✅ **자동 스케일링**: HTTP 요청에 따라 서비스별 독립적 스케일링  
✅ **상태 모니터링**: 두 서비스에 대한 라이브니스 및 레디니스 프로브  
✅ **분산 로깅**: Application Insights를 통한 중앙 집중식 로깅  
✅ **내부 네트워킹**: 안전한 서비스 간 통신  
✅ **컨테이너 오케스트레이션**: 자동 배포 및 스케일링  
✅ **무중단 업데이트**: 리비전 관리와 함께 롤링 업데이트  

## 사전 준비 사항

### 필수 도구

시작하기 전에 다음 도구가 설치되어 있는지 확인하세요:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (버전 1.0.0 이상)
   ```bash
   azd version
   # 예상 출력: azd 버전 1.0.0 이상
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (버전 2.50.0 이상)
   ```bash
   az --version
   # 예상 출력: azure-cli 2.50.0 이상
   ```

3. **[Docker](https://www.docker.com/get-started)** (로컬 개발/테스트용 - 선택 사항)
   ```bash
   docker --version
   # 예상 출력: Docker 버전 20.10 이상
   ```

### Azure 요구 사항

- 활성화된 **Azure 구독** ([무료 계정 생성](https://azure.microsoft.com/free/))
- 구독에서 리소스를 생성할 수 있는 권한
- 구독 또는 리소스 그룹에 대한 **Contributor** 역할

### 지식 요구 사항

이 예제는 **고급 수준**입니다. 다음을 알고 있어야 합니다:
- [Simple Flask API 예제](../../../../../examples/container-app/simple-flask-api) 완료
- 마이크로서비스 아키텍처에 대한 기본 이해
- REST API와 HTTP에 대한 친숙함
- 컨테이너 개념 이해

**Container Apps가 처음인가요?** 먼저 [Simple Flask API 예제](../../../../../examples/container-app/simple-flask-api)를 통해 기본을 배우세요.

## 빠른 시작 (단계별)

### 1단계: 클론 및 이동

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ 성공 확인**: `azure.yaml` 파일이 보이는지 확인:
```bash
ls
# 예상: README.md, azure.yaml, infra/, src/
```

### 2단계: Azure 인증

```bash
azd auth login
```

브라우저가 열리며 Azure 인증을 진행합니다. Azure 자격 증명으로 로그인하세요.

**✓ 성공 확인**: 다음이 표시되어야 합니다:
```
Logged in to Azure.
```

### 3단계: 환경 초기화

```bash
azd init
```

**보게 될 프롬프트**:
- **환경 이름**: 짧은 이름 입력 (예: `microservices-dev`)
- **Azure 구독**: 구독 선택
- **Azure 위치**: 지역 선택 (예: `eastus`, `westeurope`)

**✓ 성공 확인**: 다음이 표시되어야 합니다:
```
SUCCESS: New project initialized!
```

### 4단계: 인프라 및 서비스 배포

```bash
azd up
```

**발생하는 일** (8-12분 소요):
1. Container Apps 환경 생성
2. 모니터링을 위한 Application Insights 생성
3. API 게이트웨이 컨테이너(Node.js) 빌드
4. Product Service 컨테이너(Python) 빌드
5. 두 컨테이너를 Azure에 배포
6. 네트워킹 및 상태 확인 구성
7. 모니터링 및 로깅 설정

**✓ 성공 확인**: 다음이 표시되어야 합니다:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ 시간**: 8-12분

### 5단계: 배포 테스트

```bash
# 게이트웨이 엔드포인트 가져오기
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API 게이트웨이 상태 확인
curl $GATEWAY_URL/health

# 예상 출력:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**게이트웨이를 통해 제품 서비스 테스트**:
```bash
# 제품 나열
curl $GATEWAY_URL/api/products

# 예상 출력:
# [
#   {"id":1,"name":"노트북","price":999.99,"stock":50},
#   {"id":2,"name":"마우스","price":29.99,"stock":200},
#   {"id":3,"name":"키보드","price":79.99,"stock":150}
# ]
```

**✓ 성공 확인**: 두 엔드포인트가 JSON 데이터를 오류 없이 반환.

---

**🎉 축하합니다!** Azure에 마이크로서비스 아키텍처를 배포했습니다!

## 프로젝트 구조

모든 구현 파일이 포함되어 있습니다—완전하고 작동하는 예제입니다:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**각 구성 요소의 역할**:

**인프라 (infra/)**:
- `main.bicep`: 모든 Azure 리소스와 종속성을 오케스트레이션
- `core/container-apps-environment.bicep`: Container Apps 환경 및 Azure Container Registry 생성
- `core/monitor.bicep`: 분산 로깅을 위한 Application Insights 설정
- `app/*.bicep`: 개별 컨테이너 앱 정의(스케일링 및 상태 확인 포함)

**API 게이트웨이 (src/api-gateway/)**:
- 백엔드 서비스로 요청을 라우팅하는 공개 서비스
- 로깅, 오류 처리, 요청 전달 구현
- 서비스 간 HTTP 통신 예제

**Product Service (src/product-service/)**:
- 간단한 인메모리 제품 카탈로그를 가진 내부 서비스
- 상태 확인이 포함된 REST API
- 백엔드 마이크로서비스 패턴 예제

## 서비스 개요

### API 게이트웨이 (Node.js/Express)

**포트**: 8080  
**접근**: 공개 (외부 인그레스)  
**목적**: 들어오는 요청을 적절한 백엔드 서비스로 라우팅  

**엔드포인트**:
- `GET /` - 서비스 정보
- `GET /health` - 상태 확인 엔드포인트
- `GET /api/products` - 제품 서비스로 전달 (전체 목록)
- `GET /api/products/:id` - 제품 서비스로 전달 (ID별 조회)

**주요 기능**:
- axios를 사용한 요청 라우팅
- 중앙 집중식 로깅
- 오류 처리 및 타임아웃 관리
- 환경 변수를 통한 서비스 검색
- Application Insights 통합

**코드 하이라이트** (`src/api-gateway/app.js`):
```javascript
// 내부 서비스 통신
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**포트**: 8000  
**접근**: 내부 전용 (외부 인그레스 없음)  
**목적**: 인메모리 데이터를 사용한 제품 카탈로그 관리  

**엔드포인트**:
- `GET /` - 서비스 정보
- `GET /health` - 상태 확인 엔드포인트
- `GET /products` - 전체 제품 목록
- `GET /products/<id>` - ID별 제품 조회

**주요 기능**:
- Flask를 사용한 RESTful API
- 간단한 인메모리 제품 저장소(데이터베이스 불필요)
- 프로브를 사용한 상태 모니터링
- 구조화된 로깅
- Application Insights 통합

**데이터 모델**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**왜 내부 전용인가요?**
제품 서비스는 공개적으로 노출되지 않습니다. 모든 요청은 API 게이트웨이를 통해야 하며, 이는 다음을 제공합니다:
- 보안: 제어된 접근 지점
- 유연성: 클라이언트에 영향을 주지 않고 백엔드 변경 가능
- 모니터링: 중앙 집중식 요청 로깅

## 서비스 간 통신 이해

### 서비스가 서로 통신하는 방법

이 예제에서 API 게이트웨이는 **내부 HTTP 호출**을 사용하여 Product Service와 통신합니다:

```javascript
// API 게이트웨이 (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// 내부 HTTP 요청 만들기
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**핵심 포인트**:

1. **DNS 기반 검색**: Container Apps는 내부 서비스에 대해 자동으로 DNS를 제공합니다
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - 간소화된 형태: `http://product-service` (Container Apps가 이를 해결)

2. **공개 노출 없음**: Product Service는 Bicep에서 `external: false`로 설정
   - Container Apps 환경 내에서만 접근 가능
   - 인터넷에서 접근 불가

3. **환경 변수**: 서비스 URL은 배포 시 주입됨
   - Bicep이 내부 FQDN을 게이트웨이에 전달
   - 애플리케이션 코드에 하드코딩된 URL 없음

**비유**: 이를 사무실 방으로 생각하세요. API 게이트웨이는 접수 데스크(공개), Product Service는 사무실 방(내부 전용)입니다. 방문자는 접수를 통해서만 사무실에 접근할 수 있습니다.

## 배포 옵션

### 전체 배포 (권장)

```bash
# 인프라와 두 서비스를 배포합니다
azd up
```

이 배포는 다음을 포함합니다:
1. Container Apps 환경
2. Application Insights
3. Container Registry
4. API 게이트웨이 컨테이너
5. Product Service 컨테이너

**시간**: 8-12분

### 개별 서비스 배포

```bash
# 초기 azd up 후 하나의 서비스만 배포
azd deploy api-gateway

# 또는 제품 서비스를 배포
azd deploy product-service
```

**사용 사례**: 코드가 업데이트된 서비스만 재배포하고 싶을 때.

### 구성 업데이트

```bash
# 스케일링 매개변수 변경
azd env set GATEWAY_MAX_REPLICAS 30

# 새 구성으로 다시 배포
azd up
```

## 구성

### 스케일링 구성

두 서비스는 Bicep 파일에서 HTTP 기반 자동 스케일링으로 구성됩니다:

**API 게이트웨이**:
- 최소 복제본: 2 (항상 최소 2개로 가용성 유지)
- 최대 복제본: 20
- 스케일 트리거: 복제본당 50개의 동시 요청

**Product Service**:
- 최소 복제본: 1 (필요 시 0으로 스케일 가능)
- 최대 복제본: 10
- 스케일 트리거: 복제본당 100개의 동시 요청

**스케일링 사용자 정의** (`infra/app/*.bicep`에서):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### 리소스 할당

**API 게이트웨이**:
- CPU: 1.0 vCPU
- 메모리: 2 GiB
- 이유: 모든 외부 트래픽 처리

**Product Service**:
- CPU: 0.5 vCPU
- 메모리: 1 GiB
- 이유: 경량 인메모리 작업

### 상태 확인

두 서비스는 라이브니스 및 레디니스 프로브를 포함합니다:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**이 의미**:
- **라이브니스**: 상태 확인 실패 시 Container Apps가 컨테이너를 재시작
- **레디니스**: 준비되지 않은 경우 Container Apps가 해당 복제본으로 트래픽 라우팅 중지

## 모니터링 및 관찰 가능성

### 서비스 로그 보기

```bash
# API Gateway에서 로그 스트림
azd logs api-gateway --follow

# 최근 제품 서비스 로그 보기
azd logs product-service --tail 100

# 두 서비스의 모든 로그 보기
azd logs --follow
```

**예상 출력**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights 쿼리

Azure Portal에서 Application Insights에 액세스한 후 다음 쿼리를 실행하세요:

**느린 요청 찾기**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**서비스 간 호출 추적**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**서비스별 오류율**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**시간별 요청량**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### 모니터링 대시보드 액세스

```bash
# 애플리케이션 인사이트 세부 정보 가져오기
azd env get-values | grep APPLICATIONINSIGHTS

# Azure 포털 모니터링 열기
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### 실시간 메트릭

1. Azure Portal에서 Application Insights로 이동
2. "Live Metrics" 클릭
3. 실시간 요청, 실패 및 성능 확인
4. 테스트 실행: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## 실습 과제

[참고: 배포 확인, 데이터 수정, 자동 스케일링 테스트, 오류 처리, 세 번째 서비스 추가를 포함한 단계별 실습은 "실습 과제" 섹션에서 자세히 확인하세요.]

## 비용 분석

### 예상 월간 비용 (이 2개 서비스 예제 기준)

| 리소스 | 구성 | 예상 비용 |
|--------|------|----------|
| API 게이트웨이 | 2-20 복제본, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 복제본, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | 기본 등급 | $5 |
| Application Insights | 1-2 GB/월 | $5-10 |
| Log Analytics | 1 GB/월 | $3 |
| **합계** | | **$58-243/월** |

**사용량별 비용 분류**:
- **가벼운 트래픽** (테스트/학습): 약 $60/월
- **중간 트래픽** (소규모 프로덕션): 약 $120/월
- **높은 트래픽** (바쁜 기간): 약 $240/월

### 비용 최적화 팁

1. **개발용으로 0으로 스케일링**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Cosmos DB에 소비 계획 사용** (추가 시):
   - 사용한 만큼만 지불
   - 최소 요금 없음

3. **Application Insights 샘플링 설정**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // 요청의 50%를 샘플링합니다
   ```

4. **필요하지 않을 때 정리**:
   ```bash
   azd down
   ```

### 무료 등급 옵션


학습/테스트를 위해 고려하세요:
- Azure 무료 크레딧 사용 (첫 30일)
- 최소 복제본 유지
- 테스트 후 삭제 (지속적인 비용 없음)

---

## 정리 작업

지속적인 비용을 피하기 위해 모든 리소스를 삭제하세요:

```bash
azd down --force --purge
```

**확인 프롬프트**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

`y`를 입력하여 확인하세요.

**삭제되는 항목**:
- 컨테이너 앱 환경
- 두 개의 컨테이너 앱 (게이트웨이 & 제품 서비스)
- 컨테이너 레지스트리
- 애플리케이션 인사이트
- 로그 분석 작업 공간
- 리소스 그룹

**✓ 정리 확인**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

빈 결과가 반환되어야 합니다.

---

## 확장 가이드: 2개에서 5개 이상의 서비스로

2개 서비스 아키텍처를 익힌 후, 다음과 같이 확장할 수 있습니다:

### 1단계: 데이터베이스 지속성 추가 (다음 단계)

**제품 서비스에 Cosmos DB 추가**:

1. `infra/core/cosmos.bicep` 생성:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. 제품 서비스를 메모리 내 데이터 대신 Cosmos DB를 사용하도록 업데이트

3. 예상 추가 비용: 약 $25/월 (서버리스)

### 2단계: 세 번째 서비스 추가 (주문 관리)

**주문 서비스 생성**:

1. 새 폴더 생성: `src/order-service/` (Python/Node.js/C#)
2. 새 Bicep 파일 생성: `infra/app/order-service.bicep`
3. API 게이트웨이를 `/api/orders`로 라우팅하도록 업데이트
4. 주문 지속성을 위해 Azure SQL Database 추가

**아키텍처는 다음과 같이 변경됩니다**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### 3단계: 비동기 통신 추가 (Service Bus)

**이벤트 기반 아키텍처 구현**:

1. Azure Service Bus 추가: `infra/core/servicebus.bicep`
2. 제품 서비스가 "ProductCreated" 이벤트를 발행
3. 주문 서비스가 제품 이벤트를 구독
4. 이벤트를 처리하는 알림 서비스 추가

**패턴**: 요청/응답 (HTTP) + 이벤트 기반 (Service Bus)

### 4단계: 사용자 인증 추가

**사용자 서비스 구현**:

1. `src/user-service/` 생성 (Go/Node.js)
2. Azure AD B2C 또는 사용자 정의 JWT 인증 추가
3. API 게이트웨이가 토큰을 검증
4. 서비스가 사용자 권한을 확인

### 5단계: 프로덕션 준비

**다음 구성 요소 추가**:
- Azure Front Door (글로벌 로드 밸런싱)
- Azure Key Vault (비밀 관리)
- Azure Monitor Workbooks (사용자 정의 대시보드)
- CI/CD 파이프라인 (GitHub Actions)
- 블루-그린 배포
- 모든 서비스에 대한 관리 ID

**전체 프로덕션 아키텍처 비용**: 약 $300-1,400/월

---

## 더 알아보기

### 관련 문서
- [Azure Container Apps 문서](https://learn.microsoft.com/azure/container-apps/)
- [마이크로서비스 아키텍처 가이드](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [분산 추적을 위한 Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI 문서](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### 이 과정의 다음 단계
- ← 이전: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - 초보자를 위한 단일 컨테이너 예제
- → 다음: [AI 통합 가이드](../../../../../examples/docs/ai-foundry) - AI 기능 추가
- 🏠 [코스 홈](../../README.md)

### 비교: 언제 무엇을 사용할지

**단일 컨테이너 앱** (Simple Flask API 예제):
- ✅ 간단한 애플리케이션
- ✅ 모놀리식 아키텍처
- ✅ 빠른 배포
- ❌ 확장성 제한
- **비용**: 약 $15-50/월

**마이크로서비스** (이 예제):
- ✅ 복잡한 애플리케이션
- ✅ 서비스별 독립적 확장
- ✅ 팀 자율성 (다른 서비스, 다른 팀)
- ❌ 관리 복잡성 증가
- **비용**: 약 $60-250/월

**쿠버네티스 (AKS)**:
- ✅ 최대한의 제어 및 유연성
- ✅ 멀티 클라우드 이식성
- ✅ 고급 네트워킹
- ❌ 쿠버네티스 전문 지식 필요
- **비용**: 최소 약 $150-500/월

**추천**: 컨테이너 앱(이 예제)으로 시작하고, 쿠버네티스 전용 기능이 필요할 때 AKS로 이동하세요.

---

## 자주 묻는 질문

**Q: 왜 5개 이상의 서비스 대신 2개만 사용하나요?**  
A: 학습의 점진적 진행을 위해서입니다. 간단한 예제를 통해 서비스 간 통신, 모니터링, 확장성을 익힌 후 복잡성을 추가하세요. 여기서 배운 패턴은 100개 서비스 아키텍처에도 적용됩니다.

**Q: 제가 직접 더 많은 서비스를 추가할 수 있나요?**  
A: 물론입니다! 위의 확장 가이드를 따르세요. 각 새로운 서비스는 동일한 패턴을 따릅니다: src 폴더 생성, Bicep 파일 생성, azure.yaml 업데이트, 배포.

**Q: 이게 프로덕션 준비가 되었나요?**  
A: 탄탄한 기초입니다. 프로덕션을 위해서는 관리 ID, Key Vault, 지속성 데이터베이스, CI/CD 파이프라인, 모니터링 알림, 백업 전략을 추가하세요.

**Q: 왜 Dapr 또는 다른 서비스 메시를 사용하지 않나요?**  
A: 학습을 단순하게 유지하기 위해서입니다. 기본 컨테이너 앱 네트워킹을 이해한 후, 고급 시나리오를 위해 Dapr을 추가할 수 있습니다.

**Q: 로컬에서 디버그하려면 어떻게 하나요?**  
A: Docker로 로컬에서 서비스를 실행하세요:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: 다른 프로그래밍 언어를 사용할 수 있나요?**  
A: 네! 이 예제는 Node.js(게이트웨이)와 Python(제품 서비스)을 보여줍니다. 컨테이너에서 실행되는 모든 언어를 혼합할 수 있습니다.

**Q: Azure 크레딧이 없으면 어떻게 하나요?**  
A: Azure 무료 계층(새 계정의 첫 30일) 또는 짧은 테스트 기간 동안 배포하고 즉시 삭제하세요.

---

> **🎓 학습 경로 요약**: 자동 확장, 내부 네트워킹, 중앙 집중식 모니터링, 프로덕션 준비 패턴을 갖춘 다중 서비스 아키텍처를 배포하는 방법을 배웠습니다. 이 기초는 복잡한 분산 시스템 및 엔터프라이즈 마이크로서비스 아키텍처를 준비하는 데 도움이 됩니다.

**📚 코스 네비게이션:**
- ← 이전: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → 다음: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [코스 홈](../../README.md)
- 📖 [컨테이너 앱 모범 사례](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서를 해당 언어로 작성된 상태에서 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->