<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-19T21:08:08+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "ko"
}
-->
# Microsoft SQL 데이터베이스와 웹 앱을 AZD로 배포하기

⏱️ **예상 소요 시간**: 20-30분 | 💰 **예상 비용**: 약 $15-25/월 | ⭐ **난이도**: 중급

이 **완전한 작동 예제**는 [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/)를 사용하여 Python Flask 웹 애플리케이션과 Microsoft SQL 데이터베이스를 Azure에 배포하는 방법을 보여줍니다. 모든 코드가 포함되어 있으며 테스트 완료—외부 종속성은 필요하지 않습니다.

## 학습 목표

이 예제를 완료하면 다음을 배울 수 있습니다:
- 인프라 코드로 웹 앱과 데이터베이스를 포함한 다중 계층 애플리케이션 배포
- 비밀을 하드코딩하지 않고 안전한 데이터베이스 연결 구성
- Application Insights를 사용하여 애플리케이션 상태 모니터링
- AZD CLI로 Azure 리소스를 효율적으로 관리
- 보안, 비용 최적화, 관찰 가능성에 대한 Azure 모범 사례 따르기

## 시나리오 개요
- **웹 앱**: 데이터베이스 연결이 포함된 Python Flask REST API
- **데이터베이스**: 샘플 데이터가 포함된 Azure SQL Database
- **인프라**: Bicep을 사용하여 프로비저닝 (모듈화된 재사용 가능한 템플릿)
- **배포**: `azd` 명령으로 완전 자동화
- **모니터링**: 로그와 텔레메트리를 위한 Application Insights

## 사전 준비

### 필수 도구

시작하기 전에 다음 도구가 설치되어 있는지 확인하세요:

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

4. **[Docker](https://www.docker.com/get-started)** (선택 사항, 로컬 컨테이너 개발용)
   ```sh
   docker --version
   # 예상 출력: Docker 버전 20.10 이상
   ```

### Azure 요구 사항

- 활성화된 **Azure 구독** ([무료 계정 생성](https://azure.microsoft.com/free/))
- 구독에서 리소스를 생성할 수 있는 권한
- 구독 또는 리소스 그룹에서 **소유자** 또는 **기여자** 역할

### 지식 요구 사항

이 예제는 **중급 수준**입니다. 다음에 익숙해야 합니다:
- 기본적인 명령줄 작업
- 클라우드 기본 개념 (리소스, 리소스 그룹)
- 웹 애플리케이션과 데이터베이스에 대한 기본 이해

**AZD가 처음인가요?** 먼저 [시작 가이드](../../docs/getting-started/azd-basics.md)를 확인하세요.

## 아키텍처

이 예제는 웹 애플리케이션과 SQL 데이터베이스를 포함한 2계층 아키텍처를 배포합니다:

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
- **리소스 그룹**: 모든 리소스를 포함하는 컨테이너
- **App Service Plan**: Linux 기반 호스팅 (B1 티어, 비용 효율적)
- **웹 앱**: Python 3.11 런타임과 Flask 애플리케이션
- **SQL 서버**: TLS 1.2 최소 요구 사항을 갖춘 관리형 데이터베이스 서버
- **SQL 데이터베이스**: 기본 티어 (2GB, 개발/테스트에 적합)
- **Application Insights**: 모니터링 및 로깅
- **Log Analytics Workspace**: 중앙 집중식 로그 저장소

**비유**: 이 구조를 레스토랑(웹 앱)과 냉동 창고(데이터베이스)로 생각해보세요. 고객은 메뉴(API 엔드포인트)에서 주문하고, 주방(Flask 앱)은 냉동 창고에서 재료(데이터)를 가져옵니다. 레스토랑 매니저(Application Insights)는 모든 활동을 추적합니다.

## 폴더 구조

이 예제에는 모든 파일이 포함되어 있으며 외부 종속성이 필요하지 않습니다:

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

**각 파일의 역할:**
- **azure.yaml**: AZD가 무엇을 어디에 배포할지 정의
- **infra/main.bicep**: 모든 Azure 리소스를 조정
- **infra/resources/*.bicep**: 개별 리소스 정의 (재사용 가능하도록 모듈화)
- **src/web/app.py**: 데이터베이스 로직이 포함된 Flask 애플리케이션
- **requirements.txt**: Python 패키지 종속성
- **Dockerfile**: 배포를 위한 컨테이너화 지침

## 빠른 시작 (단계별)

### 1단계: 클론 및 이동

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ 성공 확인**: `azure.yaml`과 `infra/` 폴더가 보이는지 확인하세요:
```sh
ls
# 예상: README.md, azure.yaml, infra/, src/
```

### 2단계: Azure 인증

```sh
azd auth login
```

브라우저가 열리며 Azure 인증을 진행합니다. Azure 자격 증명으로 로그인하세요.

**✓ 성공 확인**: 다음 메시지가 표시됩니다:
```
Logged in to Azure.
```

### 3단계: 환경 초기화

```sh
azd init
```

**발생하는 일**: AZD가 배포를 위한 로컬 구성을 생성합니다.

**보게 될 프롬프트**:
- **환경 이름**: 짧은 이름 입력 (예: `dev`, `myapp`)
- **Azure 구독**: 목록에서 구독 선택
- **Azure 위치**: 지역 선택 (예: `eastus`, `westeurope`)

**✓ 성공 확인**: 다음 메시지가 표시됩니다:
```
SUCCESS: New project initialized!
```

### 4단계: Azure 리소스 프로비저닝

```sh
azd provision
```

**발생하는 일**: AZD가 모든 인프라를 배포합니다 (5-8분 소요):
1. 리소스 그룹 생성
2. SQL 서버 및 데이터베이스 생성
3. App Service Plan 생성
4. 웹 앱 생성
5. Application Insights 생성
6. 네트워킹 및 보안 구성

**프롬프트에서 요청받는 정보**:
- **SQL 관리자 사용자 이름**: 사용자 이름 입력 (예: `sqladmin`)
- **SQL 관리자 비밀번호**: 강력한 비밀번호 입력 (저장 필수!)

**✓ 성공 확인**: 다음 메시지가 표시됩니다:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ 시간**: 5-8분

### 5단계: 애플리케이션 배포

```sh
azd deploy
```

**발생하는 일**: AZD가 Flask 애플리케이션을 빌드하고 배포합니다:
1. Python 애플리케이션 패키징
2. Docker 컨테이너 빌드
3. Azure 웹 앱에 푸시
4. 샘플 데이터로 데이터베이스 초기화
5. 애플리케이션 시작

**✓ 성공 확인**: 다음 메시지가 표시됩니다:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ 시간**: 3-5분

### 6단계: 애플리케이션 탐색

```sh
azd browse
```

브라우저에서 배포된 웹 앱을 엽니다: `https://app-<unique-id>.azurewebsites.net`

**✓ 성공 확인**: JSON 출력이 표시됩니다:
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

**단일 제품 가져오기**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ 성공 확인**: 모든 엔드포인트가 오류 없이 JSON 데이터를 반환합니다.

---

**🎉 축하합니다!** AZD를 사용하여 데이터베이스가 포함된 웹 애플리케이션을 Azure에 성공적으로 배포했습니다.

## 구성 심층 분석

### 환경 변수

비밀은 Azure App Service 구성에서 안전하게 관리되며 **소스 코드에 하드코딩되지 않습니다**.

**AZD에 의해 자동으로 구성됨**:
- `SQL_CONNECTION_STRING`: 암호화된 자격 증명을 포함한 데이터베이스 연결
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: 모니터링 텔레메트리 엔드포인트
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: 자동 종속성 설치 활성화

**비밀 저장 위치**:
1. `azd provision` 중 SQL 자격 증명을 안전한 프롬프트를 통해 제공
2. AZD가 이를 로컬 `.azure/<env-name>/.env` 파일에 저장 (git-무시됨)
3. AZD가 이를 Azure App Service 구성에 주입 (암호화된 상태로 저장)
4. 애플리케이션이 런타임에 `os.getenv()`를 통해 읽음

### 로컬 개발

로컬 테스트를 위해 샘플 `.env` 파일을 생성하세요:

```sh
cp .env.sample .env
# 로컬 데이터베이스 연결로 .env를 편집하세요
```

**로컬 개발 워크플로**:
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

모든 Azure 리소스는 **Bicep 템플릿** (`infra/` 폴더)에 정의되어 있습니다:

- **모듈화 디자인**: 각 리소스 유형은 재사용성을 위해 별도의 파일로 분리
- **매개변수화**: SKU, 지역, 명명 규칙 사용자 정의 가능
- **모범 사례**: Azure 명명 표준 및 보안 기본값 준수
- **버전 관리**: 인프라 변경 사항은 Git에서 추적 가능

**사용자 정의 예제**:
데이터베이스 티어를 변경하려면 `infra/resources/sql-database.bicep`을 수정하세요:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## 보안 모범 사례

이 예제는 Azure 보안 모범 사례를 따릅니다:

### 1. **소스 코드에 비밀 없음**
- ✅ 자격 증명은 Azure App Service 구성에 저장 (암호화됨)
- ✅ `.env` 파일은 `.gitignore`를 통해 Git에서 제외
- ✅ 비밀은 프로비저닝 중 안전한 매개변수로 전달

### 2. **암호화된 연결**
- ✅ SQL 서버에 TLS 1.2 최소 요구 사항
- ✅ 웹 앱에 HTTPS만 허용
- ✅ 데이터베이스 연결은 암호화된 채널 사용

### 3. **네트워크 보안**
- ✅ SQL 서버 방화벽은 Azure 서비스만 허용하도록 구성
- ✅ 공용 네트워크 액세스 제한 (Private Endpoints로 추가 잠금 가능)
- ✅ 웹 앱에서 FTPS 비활성화

### 4. **인증 및 권한 부여**
- ⚠️ **현재**: SQL 인증 (사용자 이름/비밀번호)
- ✅ **프로덕션 권장 사항**: Azure Managed Identity를 사용하여 비밀번호 없는 인증

**Managed Identity로 업그레이드** (프로덕션용):
1. 웹 앱에서 Managed Identity 활성화
2. SQL 권한을 Identity에 부여
3. 연결 문자열을 Managed Identity로 업데이트
4. 비밀번호 기반 인증 제거

### 5. **감사 및 규정 준수**
- ✅ Application Insights는 모든 요청과 오류를 기록
- ✅ SQL 데이터베이스 감사 활성화 (규정 준수를 위해 구성 가능)
- ✅ 모든 리소스는 거버넌스를 위해 태그 지정됨

**프로덕션 전 보안 체크리스트**:
- [ ] Azure Defender for SQL 활성화
- [ ] SQL 데이터베이스에 Private Endpoints 구성
- [ ] 웹 애플리케이션 방화벽 (WAF) 활성화
- [ ] Azure Key Vault를 사용하여 비밀 회전 구현
- [ ] Azure AD 인증 구성
- [ ] 모든 리소스에 대한 진단 로깅 활성화

## 비용 최적화

**예상 월간 비용** (2025년 11월 기준):

| 리소스 | SKU/티어 | 예상 비용 |
|--------|----------|-----------|
| App Service Plan | B1 (기본) | 약 $13/월 |
| SQL 데이터베이스 | 기본 (2GB) | 약 $5/월 |
| Application Insights | 사용량 기준 | 약 $2/월 (저트래픽 기준) |
| **합계** | | **약 $20/월** |

**💡 비용 절감 팁**:

1. **학습용 무료 티어 사용**:
   - App Service: F1 티어 (무료, 제한된 시간)
   - SQL 데이터베이스: Azure SQL Database 서버리스 사용
   - Application Insights: 월 5GB 무료 수집

2. **사용하지 않을 때 리소스 중지**:
   ```sh
   # 웹 앱 중지 (데이터베이스는 여전히 요금 부과됨)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # 필요 시 다시 시작
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **테스트 후 모든 리소스 삭제**:
   ```sh
   azd down
   ```
   모든 리소스를 제거하고 비용 발생을 중지합니다.

4. **개발 vs. 프로덕션 SKU**:
   - **개발**: 기본 티어 (이 예제에서 사용됨)
   - **프로덕션**: 표준/프리미엄 티어로 중복성 제공

**비용 모니터링**:
- [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)에서 비용 확인
- 비용 알림 설정으로 예기치 않은 비용 방지
- 모든 리소스에 `azd-env-name` 태그를 추가하여 추적

**무료 티어 대안**:
학습 목적으로 `infra/resources/app-service-plan.bicep`을 수정하세요:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**참고**: 무료 티어는 제한이 있습니다 (일일 CPU 60분, 항상 켜짐 기능 없음).

## 모니터링 및 관찰 가능성

### Application Insights 통합

이 예제는 **Application Insights**를 포함하여 포괄적인 모니터링을 제공합니다:

**모니터링 항목**:
- ✅ HTTP 요청 (지연 시간, 상태 코드, 엔드포인트)
- ✅ 애플리케이션 오류 및 예외
- ✅ Flask 앱의 사용자 정의 로그
- ✅ 데이터베이스 연결 상태
- ✅ 성능 메트릭 (CPU, 메모리)

**Application Insights 액세스**:
1. [Azure Portal](https://portal.azure.com) 열기
2. 리소스 그룹으로 이동 (`rg-<env-name>`)
3. Application Insights 리소스 클릭 (`appi-<unique-id>`)

**유용한 쿼리** (Application Insights → Logs):

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

**상태 확인 엔드포인트**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL 데이터베이스 감사

**SQL 데이터베이스 감사가 활성화됨**:
- 데이터베이스 액세스 패턴
- 로그인 실패 시도
- 스키마 변경
- 데이터 액세스 (규정 준수 목적)

**감사 로그 액세스**:
1. Azure Portal → SQL 데이터베이스 → 감사
2. Log Analytics 워크스페이스에서 로그 보기

### 실시간 모니터링

**실시간 메트릭 보기**:
1. Application Insights → 실시간 메트릭
2. 요청, 실패, 성능을 실시간으로 확인

**알림 설정**:
중요 이벤트에 대한 알림 생성:
- HTTP 500 오류 > 5회/5분
- 데이터베이스 연결 실패
- 높은 응답 시간 (>2초)

**경고 생성 예시**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## 문제 해결

### 일반적인 문제와 해결책

#### 1. `azd provision`이 "사용할 수 없는 위치" 오류로 실패함

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
- SQL 서버 방화벽이 Azure 서비스를 허용하는지 확인 (자동으로 구성됨)
- `azd provision` 중 SQL 관리자 비밀번호를 올바르게 입력했는지 확인
- SQL 서버가 완전히 프로비저닝되었는지 확인 (2-3분 소요될 수 있음)

**연결 확인**:
```sh
# Azure 포털에서 SQL Database → Query editor로 이동하세요
# 자격 증명을 사용하여 연결을 시도하세요
```

#### 3. 웹 앱이 "애플리케이션 오류"를 표시함

**증상**:
브라우저에 일반적인 오류 페이지가 표시됨.

**해결책**:
애플리케이션 로그를 확인하세요:
```sh
# 최근 로그 보기
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**일반적인 원인**:
- 환경 변수가 누락됨 (App Service → Configuration 확인)
- Python 패키지 설치 실패 (배포 로그 확인)
- 데이터베이스 초기화 오류 (SQL 연결 확인)

#### 4. `azd deploy`가 "빌드 오류"로 실패함

**증상**:
```
Error: Failed to build project
```

**해결책**:
- `requirements.txt`에 구문 오류가 없는지 확인
- `infra/resources/web-app.bicep`에 Python 3.11이 지정되었는지 확인
- Dockerfile에 올바른 베이스 이미지가 있는지 확인

**로컬에서 디버그**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD 명령 실행 시 "권한 없음" 오류 발생

**증상**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**해결책**:
Azure에 다시 인증하세요:
```sh
azd auth login
az login
```

구독에 대한 올바른 권한(Contributor 역할)이 있는지 확인하세요.

#### 6. 높은 데이터베이스 비용

**증상**:
예상치 못한 Azure 청구서.

**해결책**:
- 테스트 후 `azd down`을 실행하는 것을 잊지 않았는지 확인
- SQL 데이터베이스가 Basic 계층(프리미엄 아님)을 사용하는지 확인
- Azure 비용 관리에서 비용 검토
- 비용 경고 설정

### 도움 받기

**모든 AZD 환경 변수 보기**:
```sh
azd env get-values
```

**배포 상태 확인**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**애플리케이션 로그 액세스**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**추가 도움이 필요하신가요?**
- [AZD 문제 해결 가이드](../../docs/troubleshooting/common-issues.md)
- [Azure App Service 문제 해결](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL 문제 해결](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## 실습 과제

### 과제 1: 배포 확인 (초급)

**목표**: 모든 리소스가 배포되고 애플리케이션이 작동하는지 확인합니다.

**단계**:
1. 리소스 그룹의 모든 리소스를 나열하세요:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **예상 결과**: 6-7개의 리소스(Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. 모든 API 엔드포인트를 테스트하세요:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **예상 결과**: 모두 오류 없이 유효한 JSON 반환

3. Application Insights 확인:
   - Azure Portal에서 Application Insights로 이동
   - "Live Metrics"로 이동
   - 웹 앱에서 브라우저 새로고침
   **예상 결과**: 실시간으로 요청이 표시됨

**성공 기준**: 6-7개의 리소스가 존재하고, 모든 엔드포인트가 데이터를 반환하며, Live Metrics에서 활동이 표시됨.

---

### 과제 2: 새로운 API 엔드포인트 추가 (중급)

**목표**: Flask 애플리케이션에 새로운 엔드포인트를 추가합니다.

**시작 코드**: `src/web/app.py`의 현재 엔드포인트

**단계**:
1. `src/web/app.py`를 편집하고 `get_product()` 함수 뒤에 새로운 엔드포인트를 추가하세요:
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

2. 업데이트된 애플리케이션을 배포하세요:
   ```sh
   azd deploy
   ```

3. 새로운 엔드포인트를 테스트하세요:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **예상 결과**: "laptop"과 일치하는 제품 반환

**성공 기준**: 새로운 엔드포인트가 작동하고, 필터링된 결과를 반환하며, Application Insights 로그에 표시됨.

---

### 과제 3: 모니터링 및 경고 추가 (고급)

**목표**: 경고가 포함된 사전 모니터링을 설정합니다.

**단계**:
1. HTTP 500 오류에 대한 경고를 생성하세요:
   ```sh
   # 애플리케이션 인사이트 리소스 ID 가져오기
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # 경고 생성
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. 오류를 유발하여 경고를 트리거하세요:
   ```sh
   # 존재하지 않는 제품 요청
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. 경고가 작동했는지 확인하세요:
   - Azure Portal → Alerts → Alert Rules
   - 이메일 확인(구성된 경우)

**성공 기준**: 경고 규칙이 생성되고, 오류 발생 시 트리거되며, 알림이 수신됨.

---

### 과제 4: 데이터베이스 스키마 변경 (고급)

**목표**: 새로운 테이블을 추가하고 애플리케이션이 이를 사용하도록 수정합니다.

**단계**:
1. Azure Portal Query Editor를 통해 SQL 데이터베이스에 연결

2. 새로운 `categories` 테이블을 생성하세요:
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

3. `src/web/app.py`를 업데이트하여 응답에 카테고리 정보를 포함

4. 배포 및 테스트

**성공 기준**: 새로운 테이블이 존재하고, 제품에 카테고리 정보가 표시되며, 애플리케이션이 여전히 작동함.

---

### 과제 5: 캐싱 구현 (전문가)

**목표**: 성능 향상을 위해 Azure Redis Cache를 추가합니다.

**단계**:
1. `infra/main.bicep`에 Redis Cache를 추가
2. `src/web/app.py`를 업데이트하여 제품 쿼리를 캐싱
3. Application Insights로 성능 향상 측정
4. 캐싱 전후 응답 시간 비교

**성공 기준**: Redis가 배포되고, 캐싱이 작동하며, 응답 시간이 50% 이상 개선됨.

**힌트**: [Azure Cache for Redis 문서](https://learn.microsoft.com/azure/azure-cache-for-redis/)를 참고하세요.

---

## 정리

지속적인 비용을 방지하려면 작업 완료 후 모든 리소스를 삭제하세요:

```sh
azd down
```

**확인 프롬프트**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

`y`를 입력하여 확인하세요.

**✓ 성공 확인**: 
- Azure Portal에서 모든 리소스가 삭제됨
- 지속적인 비용 없음
- 로컬 `.azure/<env-name>` 폴더 삭제 가능

**대안** (인프라 유지, 데이터 삭제):
```sh
# 리소스 그룹만 삭제 (AZD 구성 유지)
az group delete --name rg-<env-name> --yes
```
## 추가 학습

### 관련 문서
- [Azure Developer CLI 문서](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database 문서](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service 문서](https://learn.microsoft.com/azure/app-service/)
- [Application Insights 문서](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep 언어 참조](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### 이 과정의 다음 단계
- **[컨테이너 앱 예제](../../../../examples/container-app)**: Azure Container Apps로 마이크로서비스 배포
- **[AI 통합 가이드](../../../../docs/ai-foundry)**: 앱에 AI 기능 추가
- **[배포 모범 사례](../../docs/deployment/deployment-guide.md)**: 프로덕션 배포 패턴

### 고급 주제
- **Managed Identity**: 비밀번호 제거 및 Azure AD 인증 사용
- **Private Endpoints**: 가상 네트워크 내에서 데이터베이스 연결 보안
- **CI/CD 통합**: GitHub Actions 또는 Azure DevOps로 배포 자동화
- **다중 환경**: 개발, 스테이징, 프로덕션 환경 설정
- **데이터베이스 마이그레이션**: Alembic 또는 Entity Framework를 사용한 스키마 버전 관리

### 다른 접근 방식과의 비교

**AZD vs. ARM Templates**:
- ✅ AZD: 고수준 추상화, 간단한 명령어
- ⚠️ ARM: 더 자세하고 세밀한 제어 가능

**AZD vs. Terraform**:
- ✅ AZD: Azure 네이티브, Azure 서비스와 통합
- ⚠️ Terraform: 멀티 클라우드 지원, 더 큰 생태계

**AZD vs. Azure Portal**:
- ✅ AZD: 반복 가능, 버전 관리 가능, 자동화 가능
- ⚠️ Portal: 수동 클릭, 재현 어려움

**AZD를 이렇게 생각하세요**: Azure를 위한 Docker Compose—복잡한 배포를 위한 간소화된 구성.

---

## 자주 묻는 질문

**Q: 다른 프로그래밍 언어를 사용할 수 있나요?**  
A: 네! `src/web/`를 Node.js, C#, Go 또는 다른 언어로 교체하세요. `azure.yaml`과 Bicep을 적절히 업데이트하세요.

**Q: 데이터베이스를 더 추가하려면 어떻게 하나요?**  
A: `infra/main.bicep`에 또 다른 SQL Database 모듈을 추가하거나 Azure Database 서비스에서 PostgreSQL/MySQL을 사용하세요.

**Q: 프로덕션에 사용할 수 있나요?**  
A: 이 프로젝트는 시작점입니다. 프로덕션을 위해서는 관리 ID, 프라이빗 엔드포인트, 중복성, 백업 전략, WAF, 향상된 모니터링 등을 추가하세요.

**Q: 코드 배포 대신 컨테이너를 사용하고 싶다면?**  
A: [컨테이너 앱 예제](../../../../examples/container-app)를 확인하세요. 여기서는 Docker 컨테이너를 전반적으로 사용합니다.

**Q: 로컬 머신에서 데이터베이스에 연결하려면 어떻게 하나요?**  
A: SQL 서버 방화벽에 IP를 추가하세요:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: 새 데이터베이스를 생성하지 않고 기존 데이터베이스를 사용할 수 있나요?**  
A: 네, `infra/main.bicep`을 수정하여 기존 SQL 서버를 참조하고 연결 문자열 매개변수를 업데이트하세요.

---

> **참고:** 이 예제는 AZD를 사용하여 데이터베이스와 함께 웹 앱을 배포하는 모범 사례를 보여줍니다. 작동하는 코드, 포괄적인 문서, 학습을 강화하기 위한 실습 과제가 포함되어 있습니다. 프로덕션 배포를 위해서는 보안, 확장성, 규정 준수, 비용 요구 사항을 검토하세요.

**📚 과정 탐색:**
- ← 이전: [컨테이너 앱 예제](../../../../examples/container-app)
- → 다음: [AI 통합 가이드](../../../../docs/ai-foundry)
- 🏠 [과정 홈](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->