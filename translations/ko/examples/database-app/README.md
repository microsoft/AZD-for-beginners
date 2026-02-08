# AZD를 사용하여 Microsoft SQL 데이터베이스 및 웹 앱 배포하기

⏱️ **예상 소요 시간**: 20-30분 | 💰 **예상 비용**: 약 $15-25/월 | ⭐ **난이도**: 중급

이 **완전한 작동 예제**는 [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/)를 사용하여 Microsoft SQL 데이터베이스와 함께 Python Flask 웹 애플리케이션을 Azure에 배포하는 방법을 보여줍니다. 모든 코드가 포함되어 있고 테스트되어 있으며, 외부 종속성이 필요하지 않습니다.

## 배우게 될 내용

이 예제를 완료하면 다음을 할 수 있습니다:
- 인프라 코드 기반으로 다계층 애플리케이션(웹 앱 + 데이터베이스) 배포하기
- 비밀값을 하드코딩하지 않고 안전한 데이터베이스 연결 구성하기
- Application Insights로 애플리케이션 상태 모니터링하기
- AZD CLI로 Azure 리소스 효율적으로 관리하기
- 보안, 비용 최적화, 관측성에 대한 Azure 모범 사례 따르기

## 시나리오 개요
- **웹 앱**: 데이터베이스 연결이 포함된 Python Flask REST API
- **데이터베이스**: 샘플 데이터가 포함된 Azure SQL 데이터베이스
- **인프라**: Bicep(모듈식, 재사용 가능 템플릿) 사용하여 프로비저닝
- **배포**: `azd` 명령어로 완전 자동화
- **모니터링**: 로그 및 원격분석을 위한 Application Insights

## 사전 준비 사항

### 필요한 도구

시작하기 전에 다음 도구들이 설치되어 있는지 확인하세요:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (버전 2.50.0 이상)
   ```sh
   az --version
   # 예상 출력: azure-cli 2.50.0 이상
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (버전 1.0.0 이상)
   ```sh
   azd version
   # 예상 출력: azd 버전 1.0.0 이상
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (로컬 개발용)
   ```sh
   python --version
   # 예상 출력: Python 3.8 이상
   ```

4. **[Docker](https://www.docker.com/get-started)** (선택사항, 로컬 컨테이너 개발용)
   ```sh
   docker --version
   # 예상 출력: Docker 버전 20.10 이상
   ```

### Azure 요구 사항

- 활성화된 **Azure 구독** ([무료 계정 만들기](https://azure.microsoft.com/free/))
- 구독 내에서 리소스를 생성할 권한
- 구독 또는 리소스 그룹에 대한 **소유자** 또는 **기여자** 역할

### 지식 사전 조건

이 예제는 **중급 수준**입니다. 다음에 익숙해야 합니다:
- 기본 명령줄 작업
- 클라우드 기본 개념(리소스, 리소스 그룹)
- 웹 애플리케이션 및 데이터베이스에 대한 기본 이해

**AZD가 처음인가요?** 우선 [시작하기 안내서](../../docs/chapter-01-foundation/azd-basics.md)를 참조하세요.

## 아키텍처

이 예제는 웹 애플리케이션과 SQL 데이터베이스로 구성된 2계층 아키텍처를 배포합니다:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**리소스 배포:**
- **리소스 그룹**: 모든 리소스의 컨테이너
- **앱 서비스 플랜**: 리눅스 기반 호스팅(B1 티어, 비용 효율적)
- **웹 앱**: Flask 애플리케이션이 실행되는 Python 3.11 런타임
- **SQL 서버**: TLS 1.2 이상을 사용하는 관리형 데이터베이스 서버
- **SQL 데이터베이스**: 기본 티어(2GB, 개발/테스트 적합)
- **Application Insights**: 모니터링 및 로깅
- **Log Analytics 작업 영역**: 중앙 집중식 로그 저장소

**비유**: 식당(웹 앱)과 보관고(데이터베이스)로 생각하세요. 고객은 메뉴(API 엔드포인트)에서 주문하고 주방(Flask 앱)이 보관고에서 재료(데이터)를 꺼냅니다. 식당 관리자(Application Insights)는 모든 일을 추적합니다.

## 폴더 구조

이 예제에는 모든 파일이 포함되어 있어 외부 종속성이 필요하지 않습니다:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**각 파일 역할:**
- **azure.yaml**: AZD가 무엇을 어디에 배포할지 지정
- **infra/main.bicep**: 모든 Azure 리소스 오케스트레이션
- **infra/resources/*.bicep**: 개별 리소스 정의(재사용 가능한 모듈)
- **src/web/app.py**: 데이터베이스 로직이 포함된 Flask 애플리케이션
- **requirements.txt**: Python 패키지 종속성
- **Dockerfile**: 배포용 컨테이너화 지침

## 빠른 시작 (단계별)

### 1단계: 클론 후 폴더 이동

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ 성공 확인**: `azure.yaml`과 `infra/` 폴더가 보여야 합니다:
```sh
ls
# 예상됨: README.md, azure.yaml, infra/, src/
```

### 2단계: Azure 인증

```sh
azd auth login
```

브라우저가 열리고 Azure 인증을 요청합니다. Azure 자격증명으로 로그인하세요.

**✓ 성공 확인**: 다음을 확인할 수 있습니다:
```
Logged in to Azure.
```

### 3단계: 환경 초기화

```sh
azd init
```

**무슨 일이 일어나는가**: AZD가 배포용 로컬 구성을 생성합니다.

**출력 프롬프트**:
- **환경 이름**: 짧은 이름 입력(예: `dev`, `myapp`)
- **Azure 구독**: 목록에서 구독 선택
- **Azure 위치**: 지역 선택(예: `eastus`, `westeurope`)

**✓ 성공 확인**: 다음과 비슷한 메시지 표시:
```
SUCCESS: New project initialized!
```

### 4단계: Azure 리소스 프로비저닝

```sh
azd provision
```

**무슨 일이 일어나는가**: AZD가 모든 인프라를 배포합니다(5-8분 소요):
1. 리소스 그룹 생성
2. SQL 서버 및 데이터베이스 생성
3. 앱 서비스 플랜 생성
4. 웹 앱 생성
5. Application Insights 생성
6. 네트워킹 및 보안 구성

**프롬프트 입력 필요**:
- **SQL 관리자 사용자 이름**: 사용자 이름 입력(예: `sqladmin`)
- **SQL 관리자 비밀번호**: 강력한 비밀번호 입력(꼭 저장!)

**✓ 성공 확인**: 다음과 같은 메시지를 확인하세요:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ 소요 시간**: 5-8분

### 5단계: 애플리케이션 배포

```sh
azd deploy
```

**무슨 일이 일어나는가**: AZD가 Flask 애플리케이션을 빌드하고 배포합니다:
1. Python 애플리케이션 패키징
2. Docker 컨테이너 빌드
3. Azure 웹 앱으로 푸시
4. 샘플 데이터로 데이터베이스 초기화
5. 애플리케이션 시작

**✓ 성공 확인**: 다음을 볼 수 있습니다:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ 소요 시간**: 3-5분

### 6단계: 애플리케이션 브라우징

```sh
azd browse
```

브라우저가 열리며 배포된 웹 앱이 `https://app-<unique-id>.azurewebsites.net` 에서 실행됩니다.

**✓ 성공 확인**: JSON 출력이 표시되어야 합니다:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### 7단계: API 엔드포인트 테스트

**상태 확인** (데이터베이스 연결 확인):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**예상 응답**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**제품 목록** (샘플 데이터):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**예상 응답**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**단일 제품 조회**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ 성공 확인**: 모든 엔드포인트가 오류 없이 JSON 데이터를 반환합니다.

---

**🎉 축하합니다!** AZD를 사용하여 데이터베이스가 포함된 웹 애플리케이션을 Azure에 성공적으로 배포했습니다.

## 구성 상세 설명

### 환경 변수

비밀값은 Azure App Service 구성에서 안전하게 관리됩니다—**소스 코드에는 절대 하드코딩하지 않습니다**.

**AZD가 자동으로 구성하는 항목**:
- `SQL_CONNECTION_STRING`: 암호화된 자격증명이 포함된 데이터베이스 연결 문자열
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: 모니터링 원격분석 엔드포인트
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: 배포 중 의존성 자동 설치 활성화

**비밀값 저장 위치**:
1. `azd provision` 실행 중 안전한 프롬프트를 통해 SQL 자격증명 입력
2. 로컬 `.azure/<env-name>/.env` 파일에 저장(깃에서 무시됨)
3. AZD가 Azure App Service 구성에 이를 주입(저장 시 암호화됨)
4. 애플리케이션이 `os.getenv()`로 런타임에 읽음

### 로컬 개발

로컬 테스트용으로 샘플에서 `.env` 파일 생성:

```sh
cp .env.sample .env
# 로컬 데이터베이스 연결 정보로 .env를 수정하세요
```

**로컬 개발 워크플로우**:
```sh
# 종속성 설치
cd src/web
pip install -r requirements.txt

# 환경 변수 설정
export SQL_CONNECTION_STRING="your-local-connection-string"

# 애플리케이션 실행
python app.py
```

**로컬 테스트**:
```sh
curl http://localhost:8000/health
# 예상: {"status": "healthy", "database": "connected"}
```

### 인프라 코드

모든 Azure 리소스는 **Bicep 템플릿**(`infra/` 폴더)으로 정의되어 있습니다:

- **모듈화 설계**: 각 리소스 유형별 별도 파일, 재사용 용이
- **매개변수화 가능**: SKU, 지역, 이름 지정 규칙 커스터마이즈 가능
- **모범 사례 준수**: Azure 명명 표준 및 보안 기본값 준수
- **버전 관리**: Git을 통해 인프라 변경 사항 추적

**커스터마이징 예시**:
데이터베이스 티어 변경은 `infra/resources/sql-database.bicep` 파일 수정:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## 보안 모범 사례

이 예제는 Azure 보안 모범 사례를 따릅니다:

### 1. **소스 코드 내 비밀값 없음**
- ✅ Azure App Service 구성에 자격증명 저장(암호화됨)
- ✅ `.env` 파일은 `.gitignore`로 Git 제외
- ✅ 프로비저닝 단계에서 안전한 매개변수로 비밀값 전달

### 2. **암호화된 연결**
- ✅ SQL 서버에 TLS 1.2 이상 적용
- ✅ 웹 앱에서 HTTPS만 허용
- ✅ 데이터베이스 연결에 암호화 채널 사용

### 3. **네트워크 보안**
- ✅ SQL 서버 방화벽은 Azure 서비스만 허용하도록 설정
- ✅ 공개 네트워크 접근 제한(Private Endpoint로 추가 제한 가능)
- ✅ 웹 앱에서 FTPS 비활성화

### 4. **인증 및 권한 부여**
- ⚠️ **현재**: SQL 인증(사용자 이름/비밀번호)
- ✅ **운영 환경 권장**: Azure Managed Identity를 통한 무비밀번호 인증

**운영 환경에서 Managed Identity로 업그레이드 방법**:
1. 웹 앱에서 관리 ID 활성화
2. SQL 권한을 관리 ID에 부여
3. 연결 문자열을 관리 ID용으로 업데이트
4. 비밀번호 인증 제거

### 5. **감사 및 규정 준수**
- ✅ Application Insights가 모든 요청 및 오류 로그 기록
- ✅ SQL 데이터베이스 감사 활성화(규정 준수용 설정 가능)
- ✅ 모든 리소스에 거버넌스용 태그 부여

**운영 전 보안 점검 리스트**:
- [ ] Azure Defender for SQL 활성화
- [ ] SQL Database용 Private Endpoint 구성
- [ ] 웹 애플리케이션 방화벽(WAF) 활성화
- [ ] Azure Key Vault를 통한 비밀값 교체 구현
- [ ] Azure AD 인증 구성
- [ ] 모든 리소스에 진단 로깅 활성화

## 비용 최적화

**월별 예상 비용** (2025년 11월 기준):

| 리소스 | SKU/티어 | 예상 비용 |
|----------|----------|----------------|
| 앱 서비스 플랜 | B1 (기본) | 약 $13/월 |
| SQL 데이터베이스 | 기본 (2GB) | 약 $5/월 |
| Application Insights | 종량제 | 약 $2/월 (트래픽 적음) |
| **총합** | | **약 $20/월** |

**💡 비용 절감 팁**:

1. **학습용 무료 티어 사용**:
   - 앱 서비스: F1 티어(무료, 제한 시간 있음)
   - SQL 데이터베이스: Azure SQL Database 서버리스 사용
   - Application Insights: 월 5GB 무료 수집 용량

2. **사용하지 않을 때 리소스 중지**:
   ```sh
   # 웹 앱 중지 (데이터베이스는 여전히 요금 부과)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # 필요할 때 재시작
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **테스트 후 모든 리소스 삭제**:
   ```sh
   azd down
   ```
   이 작업으로 모든 리소스 삭제 및 비용 청구 중지.

4. **개발과 운영을 위한 SKU 구분**:
   - **개발**: 기본 티어 (이 예제와 동일)
   - **운영**: 표준/프리미엄 티어, 중복성 포함

**비용 모니터링**:
- [Azure 비용 관리](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)에서 비용 조회
- 비용 알림 설정으로 예기치 않은 지출 방지
- `azd-env-name` 태그로 모든 리소스 추적

**무료 티어 대체안**:
학습용으로 `infra/resources/app-service-plan.bicep` 수정:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**참고**: 무료 티어는 제한 사항(60분/일 CPU, 항상 켜기 불가) 있음.

## 모니터링 및 관측성

### Application Insights 통합

이 예제에는 포괄적인 모니터링을 위한 **Application Insights**가 포함되어 있습니다:

**모니터링 항목**:
- ✅ HTTP 요청(지연 시간, 상태 코드, 엔드포인트)
- ✅ 애플리케이션 오류 및 예외
- ✅ Flask 앱에서 보낸 사용자 정의 로그
- ✅ 데이터베이스 연결 상태
- ✅ 성능 지표(CPU, 메모리)

**Application Insights 접근**:
1. [Azure Portal](https://portal.azure.com) 접속
2. 리소스 그룹(`rg-<env-name>`)으로 이동
3. Application Insights 리소스(`appi-<unique-id>`) 클릭

**유용한 쿼리** (Application Insights → 로그):

**모든 요청 보기**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**오류 찾기**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**상태 확인 엔드포인트 점검**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL 데이터베이스 감사

**SQL 데이터베이스 감사가 활성화되어 있어** 다음을 추적합니다:
- 데이터베이스 접근 패턴
- 실패한 로그인 시도
- 스키마 변경
- 데이터 접근(규정 준수용)

**감사 로그 접근**:
1. Azure Portal → SQL 데이터베이스 → 감사
2. Log Analytics 작업 영역에서 로그 확인

### 실시간 모니터링

**실시간 지표 보기**:
1. Application Insights → 실시간 지표(Live Metrics)
2. 요청, 실패, 성능 실시간 확인

**경고 설정**:
중요 이벤트에 대한 알림 생성:
- 5분 내 HTTP 500 오류 5회 초과
- 데이터베이스 연결 실패
- 높은 응답 시간 (>2초)

**예제 알림 생성**:  
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```
  
## 문제 해결

### 일반 문제 및 해결책

#### 1. `azd provision`이 "Location not available" 오류 발생

**증상**:  
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```
  
**해결책**:  
다른 Azure 지역을 선택하거나 리소스 공급자를 등록하세요:  
```sh
az provider register --namespace Microsoft.Insights
```
  
#### 2. 배포 중 SQL 연결 실패

**증상**:  
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```
  
**해결책**:  
- SQL Server 방화벽이 Azure 서비스를 허용하는지 확인 (자동 구성됨)  
- `azd provision` 시 SQL 관리자 비밀번호가 정확히 입력되었는지 확인  
- SQL Server가 완전히 프로비저닝되었는지 확인 (2-3분 소요될 수 있음)  

**연결 확인**:  
```sh
# Azure 포털에서 SQL 데이터베이스 → 쿼리 편집기로 이동하세요
# 자격 증명을 사용하여 연결을 시도하세요
```
  
#### 3. 웹 앱에서 "Application Error" 표시

**증상**:  
브라우저에 일반 오류 페이지가 표시됨.

**해결책**:  
애플리케이션 로그 확인:  
```sh
# 최근 로그 보기
az webapp log tail --name <app-name> --resource-group <rg-name>
```
  
**주요 원인**:  
- 환경 변수 누락 (App Service → 구성 확인)  
- Python 패키지 설치 실패 (배포 로그 확인)  
- 데이터베이스 초기화 오류 (SQL 연결 확인)

#### 4. `azd deploy`가 "Build Error"로 실패

**증상**:  
```
Error: Failed to build project
```
  
**해결책**:  
- `requirements.txt`에 문법 오류가 없는지 확인  
- `infra/resources/web-app.bicep`에서 Python 3.11이 명시되었는지 확인  
- Dockerfile의 기본 이미지가 올바른지 확인  

**로컬 디버깅**:  
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```
  
#### 5. AZD 명령어 실행 시 "Unauthorized" 오류

**증상**:  
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```
  
**해결책**:  
Azure 인증을 다시 수행하세요:  
```sh
azd auth login
az login
```
  
구독에 올바른 권한(Contributor 역할)이 있는지 확인하세요.

#### 6. 높은 데이터베이스 비용

**증상**:  
예상치 못한 Azure 청구서 발생.

**해결책**:  
- 테스트 후 `azd down` 명령을 잊지 않았는지 확인  
- SQL Database가 Basic 티어인지 확인 (Premium 아님)  
- Azure 비용 관리에서 비용 검토  
- 비용 알림 설정

### 도움 받기

**모든 AZD 환경 변수 보기**:  
```sh
azd env get-values
```
  
**배포 상태 확인**:  
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```
  
**애플리케이션 로그 접근**:  
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```
  
**추가 지원 필요?**  
- [AZD 문제 해결 가이드](../../docs/chapter-07-troubleshooting/common-issues.md)  
- [Azure App Service 문제 해결](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)  
- [Azure SQL 문제 해결](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## 실습 과제

### 연습 1: 배포 확인 (초급)

**목표**: 모든 리소스가 배포되고 애플리케이션이 작동하는지 확인.

**단계**:  
1. 리소스 그룹 내 모든 리소스 나열:  
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
  
  **예상**: 6-7개 리소스 (웹 앱, SQL 서버, SQL 데이터베이스, App Service 계획, Application Insights, Log Analytics)

2. 모든 API 엔드포인트 테스트:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
  
  **예상**: 모두 오류 없이 유효한 JSON 반환

3. Application Insights 확인:  
   - Azure 포털에서 Application Insights 열기  
   - "Live Metrics"로 이동  
   - 웹 앱에서 브라우저 새로고침  
   **예상**: 실시간으로 요청이 보임

**성공 기준**: 6-7개 리소스 존재, 모든 엔드포인트가 데이터를 반환하며 Live Metrics 활동 표시

---

### 연습 2: 새 API 엔드포인트 추가 (중급)

**목표**: Flask 애플리케이션에 새 엔드포인트 확장.

**스타터 코드**: 현재 `src/web/app.py` 내 엔드포인트

**단계**:  
1. `src/web/app.py` 편집, `get_product()` 함수 다음에 새 엔드포인트 추가:  
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```
  
2. 업데이트한 애플리케이션 배포:  
   ```sh
   azd deploy
   ```
  
3. 새 엔드포인트 테스트:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
  
  **예상**: "laptop"과 일치하는 제품 반환

**성공 기준**: 새 엔드포인트가 작동하고, 필터링된 결과를 반환하며, Application Insights 로그에 기록됨

---

### 연습 3: 모니터링 및 알림 추가 (고급)

**목표**: 사전 대응 모니터링 및 알림 설정.

**단계**:  
1. HTTP 500 오류에 대한 알림 생성:  
   ```sh
   # 애플리케이션 인사이트 리소스 ID 가져오기
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # 경고 생성하기
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```
  
2. 오류를 유발하여 알림 트리거:  
   ```sh
   # 존재하지 않는 제품 요청
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```
  
3. 알림 발생 여부 확인:  
   - Azure 포털 → 알림 → 알림 규칙  
   - 이메일 확인 (설정한 경우)

**성공 기준**: 알림 규칙이 생성되어 오류 발생 시 트리거되고, 알림이 수신됨

---

### 연습 4: 데이터베이스 스키마 변경 (고급)

**목표**: 새 테이블 추가 및 애플리케이션에서 사용하도록 수정.

**단계**:  
1. Azure 포털 쿼리 편집기를 통해 SQL 데이터베이스 연결

2. 새 `categories` 테이블 생성:  
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```
  
3. `src/web/app.py` 업데이트하여 응답에 카테고리 정보 포함

4. 배포 및 테스트

**성공 기준**: 새 테이블 존재, 제품이 카테고리 정보를 표시하며 애플리케이션 정상 작동

---

### 연습 5: 캐시 구현 (전문가)

**목표**: Azure Redis 캐시 추가로 성능 향상.

**단계**:  
1. `infra/main.bicep`에 Redis 캐시 추가  
2. `src/web/app.py`에서 제품 쿼리 캐싱 구현  
3. Application Insights로 성능 개선 측정  
4. 캐싱 전후 응답 시간 비교

**성공 기준**: Redis가 배포되고 캐싱이 제대로 작동하며 응답 시간이 50% 이상 개선

**힌트**: [Azure Cache for Redis 문서](https://learn.microsoft.com/azure/azure-cache-for-redis/)를 참고하세요.

---

## 정리

지속 비용 방지를 위해 완료 후 모든 리소스 삭제:  

```sh
azd down
```
  
**확인 프롬프트**:  
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```
  
`y` 입력하여 확인.

**✓ 성공 확인**:  
- Azure 포털에서 모든 리소스 삭제  
- 지속되는 비용 없음  
- 로컬 `.azure/<env-name>` 폴더 삭제 가능

**대안** (인프라는 유지, 데이터만 삭제):  
```sh
# 리소스 그룹만 삭제합니다 (AZD 구성은 유지).
az group delete --name rg-<env-name> --yes
```
  
## 더 알아보기

### 관련 문서  
- [Azure Developer CLI 문서](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Azure SQL Database 문서](https://learn.microsoft.com/azure/azure-sql/database/)  
- [Azure App Service 문서](https://learn.microsoft.com/azure/app-service/)  
- [Application Insights 문서](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)  
- [Bicep 언어 참조](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### 이 과정의 다음 단계  
- **[컨테이너 앱 예제](../../../../examples/container-app)**: Azure 컨테이너 앱으로 마이크로서비스 배포  
- **[AI 통합 가이드](../../../../docs/ai-foundry)**: 앱에 AI 기능 추가  
- **[배포 모범 사례](../../docs/chapter-04-infrastructure/deployment-guide.md)**: 프로덕션 배포 패턴

### 고급 주제  
- **Managed Identity**: 비밀번호 제거 및 Azure AD 인증 사용  
- **Private Endpoints**: 가상 네트워크 내 데이터베이스 연결 보안  
- **CI/CD 통합**: GitHub Actions 또는 Azure DevOps로 배포 자동화  
- **다중 환경**: 개발, 스테이징, 프로덕션 환경 구성  
- **데이터베이스 마이그레이션**: Alembic 또는 Entity Framework로 스키마 버전 관리

### 다른 접근법과 비교

**AZD vs. ARM 템플릿**:  
- ✅ AZD: 고수준 추상화, 더 간단한 명령어  
- ⚠️ ARM: 더 상세하고 복잡한 제어

**AZD vs. Terraform**:  
- ✅ AZD: Azure 네이티브, Azure 서비스와 통합  
- ⚠️ Terraform: 멀티클라우드 지원, 더 큰 생태계

**AZD vs. Azure 포털**:  
- ✅ AZD: 반복 가능, 버전 관리, 자동화 가능  
- ⚠️ 포털: 수동 클릭, 재현 어려움

**AZD를 생각하라**: Azure용 Docker Compose - 복잡한 배포를 단순화하는 구성 도구.

---

## 자주 묻는 질문

**Q: 다른 프로그래밍 언어를 사용할 수 있나요?**  
A: 네! `src/web/` 폴더를 Node.js, C#, Go 등 원하는 언어로 대체하세요. `azure.yaml`과 Bicep 파일도 업데이트하세요.

**Q: 데이터베이스를 더 추가하려면 어떻게 하나요?**  
A: `infra/main.bicep`에 추가 SQL Database 모듈을 넣거나 Azure Database 서비스의 PostgreSQL/MySQL을 사용하세요.

**Q: 이걸 프로덕션에 사용할 수 있나요?**  
A: 이 예제는 시작점입니다. 프로덕션 환경에는 관리형 ID, 프라이빗 엔드포인트, 중복성, 백업 전략, WAF, 강화된 모니터링이 필요합니다.

**Q: 코드 배포 대신 컨테이너를 사용하려면?**  
A: [컨테이너 앱 예제](../../../../examples/container-app)를 참고하세요. Docker 컨테이너를 활용합니다.

**Q: 로컬 머신에서 데이터베이스에 연결하려면?**  
A: SQL 서버 방화벽에 IP를 추가하세요:  
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```
  

**Q: 새 데이터베이스 대신 기존 데이터베이스를 사용할 수 있나요?**  
A: 네, `infra/main.bicep`에서 기존 SQL 서버를 참조하도록 수정하고 연결 문자열 매개변수를 업데이트하세요.

---

> **참고:** 이 예제는 AZD를 사용하여 데이터베이스가 있는 웹 앱을 배포하는 모범 사례를 보여줍니다. 작동하는 코드, 포괄적인 문서, 실습 과제가 포함되어 있습니다. 프로덕션 배포 시에는 조직별 보안, 스케일링, 준수, 비용 요구사항을 반드시 검토하세요.

**📚 코스 네비게이션:**  
- ← 이전: [컨테이너 앱 예제](../../../../examples/container-app)  
- → 다음: [AI 통합 가이드](../../../../docs/ai-foundry)  
- 🏠 [강의 홈](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확한 부분이 있을 수 있음을 양지해 주시기 바랍니다. 원본 문서는 해당 언어의 원문이 권위 있는 자료임을 인정해 주십시오. 중요한 정보에 대해서는 전문적인 인간 번역을 권장합니다. 본 번역물의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->