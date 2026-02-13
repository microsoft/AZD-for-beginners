# 마이크로서비스 아키텍처 - 컨테이너 앱 예제

⏱️ **예상 소요 시간**: 25-35분 | 💰 **예상 비용**: 약 $50-100/월 | ⭐ **복잡도**: 고급

AZD CLI를 사용하여 Azure Container Apps에 배포된 **단순하지만 실용적인** 마이크로서비스 아키텍처입니다. 이 예제는 서비스 간 통신, 컨테이너 오케스트레이션, 모니터링을 실제 2-서비스 구성으로 보여줍니다.

> **📚 학습 접근법**: 이 예제는 실제로 배포하고 학습할 수 있는 최소 2-서비스 아키텍처(API 게이트웨이 + 백엔드 서비스)부터 시작합니다. 기본기를 마스터한 후, 완전한 마이크로서비스 생태계로 확장하는 방법을 안내합니다.

## 학습 목표

이 예제를 완료하면 다음을 할 수 있습니다:
- 여러 컨테이너를 Azure Container Apps에 배포
- 내부 네트워킹을 통한 서비스 간 통신 구현
- 환경 기반 스케일링 및 상태 검사 구성
- Application Insights로 분산 애플리케이션 모니터링
- 마이크로서비스 배포 패턴과 모범 사례 이해
- 단순 구조에서 복잡한 아키텍처로 점진적 확장 학습

## 아키텍처

### 1단계: 구축할 내용 (이 예제에 포함됨)

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

**왜 단순하게 시작할까?**
- ✅ 빠르게 배포하고 이해 가능 (25-35분)
- ✅ 복잡성 없이 핵심 마이크로서비스 패턴 학습
- ✅ 수정 및 실험 가능한 동작 코드
- ✅ 학습용 저비용 (~$50-100/월 vs $300-1400/월)
- ✅ 데이터베이스 및 메시지 큐 추가 전 자신감 향상

**비유**: 운전 배우는 과정처럼, 빈 주차장(2개 서비스)부터 기본기부터 익힌 후 도심 교통(5개 이상 서비스와 DB)으로 나아갑니다.

### 2단계: 향후 확장 (참고 아키텍처)

2-서비스 아키텍처를 마스터하면 다음과 같이 확장 가능합니다:

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

자세한 단계별 지침은 마지막의 "확장 가이드" 섹션을 참조하세요.

## 포함된 기능

✅ **서비스 디스커버리**: 컨테이너 간 DNS 기반 자동 탐색  
✅ **로드 밸런싱**: 복제본 간 내장 로드 밸런싱  
✅ **자동 스케일링**: HTTP 요청 기반 서비스별 독립 스케일링  
✅ **상태 모니터링**: 두 서비스 모두에 대한 라이브니스와 레디니스 프로브  
✅ **분산 로깅**: Application Insights 중앙 로깅  
✅ **내부 네트워킹**: 안전한 서비스 간 통신  
✅ **컨테이너 오케스트레이션**: 자동 배포 및 스케일링  
✅ **무중단 업데이트**: 리비전 관리가 포함된 롤링 업데이트  

## 사전 준비 사항

### 필수 도구

시작 전에 다음 도구가 설치되어 있는지 확인하세요:

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

### Azure 요구 조건

- 활성화된 **Azure 구독** ([무료 계정 만들기](https://azure.microsoft.com/free/))
- 구독 내 리소스 생성 권한
- 구독 또는 리소스 그룹에 대한 **기여자** 역할

### 사전 지식

이 예제는 **고급** 수준입니다. 다음을 알고 있어야 합니다:
- [Simple Flask API 예제](../../../../../examples/container-app/simple-flask-api) 완료
- 마이크로서비스 아키텍처 기본 이해
- REST API 및 HTTP 친숙
- 컨테이너 개념 이해

**컨테이너 앱에 익숙하지 않나요?** 먼저 [Simple Flask API 예제](../../../../../examples/container-app/simple-flask-api)로 기본기를 배우세요.

## 빠른 시작 (단계별)

### 1단계: 복제 및 이동

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ 성공 확인**: `azure.yaml` 파일이 있는지 확인:
```bash
ls
# 예상: README.md, azure.yaml, infra/, src/
```

### 2단계: Azure 인증

```bash
azd auth login
```

브라우저가 열리면 Azure 자격 증명으로 로그인하세요.

**✓ 성공 확인**: 다음을 확인해야 합니다:
```
Logged in to Azure.
```

### 3단계: 환경 초기화

```bash
azd init
```

**나오는 프롬프트**:
- **환경 이름**: 짧은 이름 입력 (예: `microservices-dev`)
- **Azure 구독**: 사용 중인 구독 선택
- **Azure 위치**: 지역 선택 (예: `eastus`, `westeurope`)

**✓ 성공 확인**: 다음 메시지가 보입니다:
```
SUCCESS: New project initialized!
```

### 4단계: 인프라 및 서비스 배포

```bash
azd up
```

**진행 상황** (8-12분 소요):
1. Container Apps 환경 생성
2. 모니터링용 Application Insights 생성
3. API 게이트웨이 컨테이너 빌드 (Node.js)
4. 제품 서비스 컨테이너 빌드 (Python)
5. 두 컨테이너를 Azure에 배포
6. 네트워킹 및 상태 검사 구성
7. 모니터링 및 로깅 설정

**✓ 성공 확인**: 다음과 같은 메시지가 보여야 함:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ 소요 시간**: 8-12분

### 5단계: 배포 테스트

```bash
# 게이트웨이 엔드포인트 가져오기
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API 게이트웨이 상태 테스트
curl $GATEWAY_URL/health

# 예상 출력:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**게이트웨이를 통해 제품 서비스 테스트**:
```bash
# 제품 목록
curl $GATEWAY_URL/api/products

# 예상 출력:
# [
#   {"id":1,"name":"노트북","price":999.99,"stock":50},
#   {"id":2,"name":"마우스","price":29.99,"stock":200},
#   {"id":3,"name":"키보드","price":79.99,"stock":150}
# ]
```

**✓ 성공 확인**: 두 엔드포인트가 오류 없이 JSON 데이터를 반환합니다.

---

**🎉 축하합니다!** Azure에 마이크로서비스 아키텍처를 성공적으로 배포했습니다!

## 프로젝트 구조

모든 구현 파일이 포함되어 있는 완성된 실습 예제입니다:

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

**각 구성요소 역할**:

**인프라(infra/)**:
- `main.bicep`: 모든 Azure 리소스 및 종속성 오케스트레이션
- `core/container-apps-environment.bicep`: Container Apps 환경 및 Azure Container Registry 생성
- `core/monitor.bicep`: 분산 로깅용 Application Insights 설정
- `app/*.bicep`: 스케일링과 상태 검사가 포함된 개별 컨테이너 앱 정의

**API 게이트웨이(src/api-gateway/)**:
- 공개 접근 서비스로 백엔드 서비스로 요청 라우팅
- 로깅, 오류 처리, 요청 전달 구현
- 서비스 간 HTTP 통신 시연

**제품 서비스(src/product-service/)**:
- 제품 카탈로그를 제공하는 내부 서비스 (간단한 인메모리)
- REST API 및 상태 검사 제공
- 백엔드 마이크로서비스 패턴의 예

## 서비스 개요

### API 게이트웨이 (Node.js/Express)

**포트**: 8080  
**접근**: 공개(외부 인그레스)  
**역할**: 들어오는 요청을 적절한 백엔드 서비스로 라우팅  

**엔드포인트**:
- `GET /` - 서비스 정보
- `GET /health` - 상태 검사 엔드포인트
- `GET /api/products` - 제품 서비스에 포워딩 (전체 목록)
- `GET /api/products/:id` - 제품 서비스에 포워딩 (ID별 조회)

**핵심 기능**:
- axios를 사용하는 요청 라우팅
- 중앙 집중식 로깅
- 오류 처리 및 타임아웃 관리
- 환경변수 기반 서비스 디스커버리
- Application Insights 통합

**주요 코드** (`src/api-gateway/app.js`):
```javascript
// 내부 서비스 통신
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### 제품 서비스 (Python/Flask)

**포트**: 8000  
**접근**: 내부 전용 (외부 인그레스 없음)  
**역할**: 메모리 내 제품 카탈로그 관리  

**엔드포인트**:
- `GET /` - 서비스 정보
- `GET /health` - 상태 검사 엔드포인트
- `GET /products` - 모든 제품 목록
- `GET /products/<id>` - ID별 제품 조회

**핵심 기능**:
- Flask 기반 RESTful API
- 인메모리 제품 저장소 (간단하며 DB 불필요)
- 라이브니스 및 레디니스 프로브를 이용한 상태 모니터링
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

**왜 내부 전용인가?**
제품 서비스는 공개되지 않습니다. 모든 요청은 API 게이트웨이를 통해서만 접근 가능하며, 이는:
- 보안: 통제된 접근 지점 제공
- 유연성: 클라이언트에 영향 없이 백엔드 변경 가능
- 모니터링: 중앙 집중식 요청 로깅 제공

## 서비스 간 통신 이해하기

### 서비스 간 통신 방식

이 예제에서 API 게이트웨이는 제품 서비스와 **내부 HTTP 호출**로 통신합니다:

```javascript
// API 게이트웨이 (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// 내부 HTTP 요청 만들기
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**중요 사항**:

1. **DNS 기반 발견**: Container Apps는 내부 서비스용 DNS를 자동 제공
   - 제품 서비스 FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - 간단히: `http://product-service` (Container Apps가 해결)

2. **공개 노출 없음**: 제품 서비스는 Bicep에서 `external: false` 설정
   - Container Apps 환경 내부에서만 접근 가능
   - 인터넷에서는 접근 불가

3. **환경 변수 주입**: 서비스 URL은 배포 시 주입됨
   - Bicep이 내부 FQDN을 게이트웨이에 전달
   - 애플리케이션 코드에 하드코딩된 URL 없음

**비유**: 사무실 건물에서, API 게이트웨이는 접수 데스크(공개 쪽), 제품 서비스는 내부 사무실입니다. 방문자는 반드시 접수를 거쳐야 사무실에 들어갈 수 있습니다.

## 배포 옵션

### 전체 배포 (권장)

```bash
# 인프라와 두 서비스를 배포합니다
azd up
```

다음 항목 배포:
1. Container Apps 환경
2. Application Insights
3. 컨테이너 레지스트리
4. API 게이트웨이 컨테이너
5. 제품 서비스 컨테이너

**소요 시간**: 8-12분

### 개별 서비스 배포

```bash
# 하나의 서비스만 배포 (초기 azd up 이후)
azd deploy api-gateway

# 또는 product 서비스 배포
azd deploy product-service
```

**용도**: 한 서비스에서 코드를 변경 후 해당 서비스만 재배포할 때 사용.

### 구성 업데이트

```bash
# 스케일링 매개변수 변경
azd env set GATEWAY_MAX_REPLICAS 30

# 새 구성으로 재배포
azd up
```

## 구성

### 스케일링 구성

두 서비스 모두 Bicep 파일에 HTTP 기반 자동 스케일링 설정됨:

**API 게이트웨이**:
- 최소 복제본: 2 (항상 2 이상 유지)
- 최대 복제본: 20
- 스케일 트리거: 복제본당 50 동시 요청

**제품 서비스**:
- 최소 복제본: 1 (필요 시 0까지 축소 가능)
- 최대 복제본: 10
- 스케일 트리거: 복제본당 100 동시 요청

**스케일링 사용자 지정** (`infra/app/*.bicep`):
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

**제품 서비스**:
- CPU: 0.5 vCPU
- 메모리: 1 GiB
- 이유: 가벼운 인메모리 작업

### 상태 검사

두 서비스 모두 라이브니스 및 레디니스 프로브 포함:

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

**의미**:
- **라이브니스**: 건강 상태 검사 실패 시 Container Apps가 컨테이너 재시작
- **레디니스**: 준비 상태가 아니면 해당 복제본으로 트래픽 방지



## 모니터링 및 관찰성

### 서비스 로그 보기

```bash
# azd monitor를 사용하여 로그 보기
azd monitor --logs

# 또는 특정 컨테이너 앱에 대해 Azure CLI 사용:
# API Gateway에서 로그 스트리밍
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# 최근 제품 서비스 로그 보기
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**예상 출력**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights 쿼리

Azure Portal의 Application Insights에서 다음 쿼리 실행:

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

### 모니터링 대시보드 접근

```bash
# Application Insights 세부 정보 가져오기
azd env get-values | grep APPLICATIONINSIGHTS

# Azure 포털 모니터링 열기
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### 라이브 메트릭

1. Azure Portal에서 Application Insights로 이동
2. "라이브 메트릭" 클릭
3. 실시간 요청, 실패, 성능 확인
4. 다음 명령어로 테스트: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## 실습 과제

[참고: 상세한 단계별 실습은 위 "Practical Exercises" 섹션에 있습니다. 배포 확인, 데이터 수정, 자동 스케일링 테스트, 오류 처리, 3번째 서비스 추가 등을 포함합니다.]

## 비용 분석

### 이 2-서비스 예제의 예상 월간 비용

| 리소스 | 구성 | 예상 비용 |
|----------|--------------|----------------|
| API 게이트웨이 | 2-20 복제본, 1 vCPU, 2GB RAM | $30-150 |
| 제품 서비스 | 1-10 복제본, 0.5 vCPU, 1GB RAM | $15-75 |
| 컨테이너 레지스트리 | 기본 등급 | $5 |
| Application Insights | 1-2 GB/월 | $5-10 |
| Log Analytics | 1 GB/월 | $3 |
| **총계** | | **$58-243/월** |

**사용량별 비용 내역**:
- **적은 트래픽** (테스트/학습): 약 $60/월
- **중간 트래픽** (소규모 운영): 약 $120/월
- **높은 트래픽** (바쁜 시기): 약 $240/월

### 비용 최적화 팁

1. **개발 시 제로 스케일링 사용**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Cosmos DB 추가 시 소비 계획 사용**:
   - 사용한 만큼만 비용 지불
   - 최소 요금 없음

3. **Application Insights 샘플링 설정**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // 요청의 50% 샘플링하기
   ```

4. **필요없을 때 자원 정리**:
   ```bash
   azd down
   ```

### 무료 등급 옵션
학습/테스트용으로 고려하세요:
- Azure 무료 크레딧 사용(첫 30일)
- 최소 복제본 유지
- 테스트 후 삭제(지속 비용 없음)

---

## 정리

지속 비용을 방지하려면 모든 리소스를 삭제하세요:

```bash
azd down --force --purge
```

**확인 요청**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

확인을 위해 `y` 입력.

**삭제 대상**:
- 컨테이너 앱 환경
- 두 컨테이너 앱(게이트웨이 & 상품 서비스)
- 컨테이너 레지스트리
- Application Insights
- 로그 분석 작업 영역
- 리소스 그룹

**✓ 정리 확인**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

빈 결과를 반환해야 합니다.

---

## 확장 가이드: 2개에서 5개 이상 서비스로

2서비스 아키텍처를 숙달한 후 확장하는 방법은 다음과 같습니다:

### 1단계: 데이터베이스 지속성 추가 (다음 단계)

**상품 서비스에 Cosmos DB 추가**:

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

2. 상품 서비스가 메모리 데이터 대신 Cosmos DB 사용하도록 업데이트

3. 예상 추가 비용: 월 약 $25 (서버리스)

### 2단계: 세 번째 서비스 추가 (주문 관리)

**주문 서비스 생성**:

1. 새 폴더: `src/order-service/` (Python/Node.js/C#)
2. 새 Bicep 파일: `infra/app/order-service.bicep`
3. API 게이트웨이에서 `/api/orders` 경로 라우팅 추가
4. 주문 지속성용 Azure SQL Database 추가

**아키텍처는 다음과 같이 변경**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### 3단계: 비동기 통신 추가 (서비스 버스)

**이벤트 기반 아키텍처 구현**:

1. Azure Service Bus 추가: `infra/core/servicebus.bicep`
2. 상품 서비스는 "ProductCreated" 이벤트 발행
3. 주문 서비스는 상품 이벤트 구독
4. 이벤트 처리용 알림 서비스 추가

**패턴**: 요청/응답(HTTP) + 이벤트 기반(서비스 버스)

### 4단계: 사용자 인증 추가

**사용자 서비스 구현**:

1. `src/user-service/` 생성(Go/Node.js)
2. Azure AD B2C 또는 커스텀 JWT 인증 추가
3. API 게이트웨이에서 토큰 검증
4. 서비스에서 사용자 권한 확인

### 5단계: 운영 준비

**다음 구성요소 추가**:
- Azure Front Door (글로벌 부하 분산)
- Azure Key Vault (비밀 관리)
- Azure Monitor Workbooks (커스텀 대시보드)
- CI/CD 파이프라인 (GitHub Actions)
- 블루-그린 배포
- 모든 서비스용 관리형 아이덴티티

**전체 운영 아키텍처 비용**: 월 약 $300-1,400

---

## 더 알아보기

### 관련 문서
- [Azure Container Apps 문서](https://learn.microsoft.com/azure/container-apps/)
- [마이크로서비스 아키텍처 가이드](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [분산 추적을 위한 Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure 개발자 CLI 문서](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### 이 강의의 다음 단계
- ← 이전: [간단한 Flask API](../../../../../examples/container-app/simple-flask-api) - 초보용 단일 컨테이너 예제
- → 다음: [AI 통합 가이드](../../../../../examples/docs/ai-foundry) - AI 기능 추가
- 🏠 [강의 홈](../../README.md)

### 비교: 언제 무엇을 사용할까

**단일 컨테이너 앱** (간단한 Flask API 예시):
- ✅ 간단한 애플리케이션
- ✅ 모놀리식 아키텍처
- ✅ 빠른 배포
- ❌ 확장성 제한
- **비용**: 월 약 $15-50

**마이크로서비스** (이 예시):
- ✅ 복잡한 애플리케이션
- ✅ 서비스별 독립적 확장
- ✅ 팀 자율성 (서비스별 팀 분리)
- ❌ 관리 복잡도 증가
- **비용**: 월 약 $60-250

**쿠버네티스 (AKS)**:
- ✅ 최대 제어 및 유연성
- ✅ 멀티 클라우드 이식성
- ✅ 고급 네트워킹
- ❌ 쿠버네티스 전문 지식 필요
- **비용**: 최소 월 약 $150-500

**추천**: 처음에는 Container Apps(이 예시)를 시작하고, 쿠버네티스 특징이 필요할 때 AKS로 전환하세요.

---

## 자주 묻는 질문

**Q: 왜 5개 이상이 아니라 2개의 서비스인가요?**  
A: 교육용 단계별 진행입니다. 간단한 예로 서비스 통신, 모니터링, 확장 기본기를 익히고 나서 복잡도를 올립니다. 여기서 배운 패턴은 100개 서비스 아키텍처에도 적용됩니다.

**Q: 제가 직접 더 많은 서비스를 추가할 수 있나요?**  
A: 물론입니다! 위 확장 가이드를 따르세요. 새 서비스마다 src 폴더 생성, Bicep 파일 작성, azure.yaml 업데이트, 배포 순서입니다.

**Q: 이게 운영 환경에 적합한가요?**  
A: 탄탄한 기반입니다. 운영 환경에서는 관리형 아이덴티티, Key Vault, 지속성 데이터베이스, CI/CD 파이프라인, 모니터링 알림, 백업 전략 등을 추가하세요.

**Q: 왜 Dapr나 다른 서비스 메시는 사용하지 않나요?**  
A: 학습 목적상 단순화를 위해서입니다. Container Apps 네이티브 네트워킹을 이해한 후 고급 시나리오에서 Dapr을 추가할 수 있습니다.

**Q: 로컬에서 어떻게 디버깅하나요?**  
A: Docker로 서비스들을 로컬 실행하세요:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: 다른 프로그래밍 언어도 사용할 수 있나요?**  
A: 네! 이 예시는 Node.js(게이트웨이) + Python(상품 서비스) 조합입니다. 컨테이너 실행 가능한 모든 언어를 혼용할 수 있습니다.

**Q: Azure 크레딧이 없으면 어떻게 하나요?**  
A: Azure 무료 티어(신규 계정 첫 30일) 사용하거나 짧은 테스트 후 바로 삭제하세요.

---

> **🎓 학습 요약**: 자동 확장, 내부 네트워킹, 중앙 집중식 모니터링, 운영 준비 패턴을 갖춘 다중 서비스 아키텍처 배포법을 익혔습니다. 이 기반은 복잡한 분산 시스템 및 기업용 마이크로서비스 아키텍처 준비에 도움을 줍니다.

**📚 강의 내비게이션:**
- ← 이전: [간단한 Flask API](../../../../../examples/container-app/simple-flask-api)
- → 다음: [데이터베이스 통합 예제](../../../../../examples/database-app)
- 🏠 [강의 홈](../../../README.md)
- 📖 [Container Apps 모범 사례](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역에는 오류나 부정확성이 있을 수 있음을 알려드립니다. 원본 문서는 해당 언어의 원문이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역 사용으로 인해 발생하는 오해나 오해석에 대해서는 당사가 책임지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->