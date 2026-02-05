# 용어집 - Azure 및 AZD 용어

**모든 챕터 참고**
- **📚 코스 홈**: [AZD 초보자용](../README.md)
- **📖 기본 학습**: [챕터 1: AZD 기본](../docs/getting-started/azd-basics.md)
- **🤖 AI 용어**: [챕터 2: AI 우선 개발](../docs/ai-foundry/azure-ai-foundry-integration.md)

## 소개

이 포괄적인 용어집은 Azure Developer CLI와 Azure 클라우드 개발에서 사용되는 용어, 개념, 약어에 대한 정의를 제공합니다. 기술 문서를 이해하고, 문제를 해결하며, azd 프로젝트와 Azure 서비스에 대해 효과적으로 소통하는 데 필수적인 참고 자료입니다.

## 학습 목표

이 용어집을 사용함으로써 다음을 배울 수 있습니다:
- 필수적인 Azure Developer CLI 용어와 개념 이해
- Azure 클라우드 개발 어휘와 기술 용어 숙달
- 코드 기반 인프라 및 배포 용어를 효율적으로 참조
- Azure 서비스 이름, 약어 및 그 목적 이해
- 문제 해결 및 디버깅 용어 정의 접근
- 고급 Azure 아키텍처 및 개발 개념 학습

## 학습 결과

이 용어집을 정기적으로 참조함으로써 다음을 할 수 있습니다:
- 적절한 Azure Developer CLI 용어를 사용하여 효과적으로 소통
- 기술 문서와 오류 메시지를 더 명확히 이해
- Azure 서비스와 개념을 자신 있게 탐색
- 적절한 기술 용어를 사용하여 문제를 해결
- 팀 논의에 정확한 기술 언어로 기여
- 체계적으로 Azure 클라우드 개발 지식을 확장

## A

**ARM 템플릿**  
Azure Resource Manager 템플릿. JSON 기반의 코드 기반 인프라 형식으로 Azure 리소스를 선언적으로 정의하고 배포하는 데 사용됩니다.

**App Service**  
웹 애플리케이션, REST API, 모바일 백엔드를 인프라 관리 없이 호스팅할 수 있는 Azure의 플랫폼 서비스(PaaS)입니다.

**Application Insights**  
애플리케이션 성능, 가용성, 사용량에 대한 심층적인 통찰력을 제공하는 Azure의 애플리케이션 성능 모니터링(APM) 서비스입니다.

**Azure CLI**  
Azure 리소스를 관리하기 위한 명령줄 인터페이스. azd에서 인증 및 일부 작업에 사용됩니다.

**Azure Developer CLI (azd)**  
템플릿과 코드 기반 인프라를 사용하여 Azure에 애플리케이션을 빌드하고 배포하는 과정을 가속화하는 개발자 중심 명령줄 도구입니다.

**azure.yaml**  
서비스, 인프라, 배포 훅을 정의하는 azd 프로젝트의 주요 구성 파일입니다.

**Azure Resource Manager (ARM)**  
Azure 리소스를 생성, 업데이트, 삭제하기 위한 관리 계층을 제공하는 Azure의 배포 및 관리 서비스입니다.

## B

**Bicep**  
Microsoft가 개발한 Azure 리소스 배포를 위한 도메인 특화 언어(DSL). ARM 템플릿보다 간단한 문법을 제공하며 ARM으로 컴파일됩니다.

**Build**  
소스 코드를 컴파일하고, 종속성을 설치하며, 애플리케이션을 배포할 준비를 하는 과정입니다.

**Blue-Green Deployment**  
다운타임과 위험을 최소화하기 위해 두 개의 동일한 프로덕션 환경(블루와 그린)을 사용하는 배포 전략입니다.

## C

**Container Apps**  
복잡한 인프라를 관리하지 않고 컨테이너화된 애플리케이션을 실행할 수 있는 Azure의 서버리스 컨테이너 서비스입니다.

**CI/CD**  
코드 변경 사항을 통합하고 애플리케이션을 배포하는 자동화된 실천 방법입니다.

**Cosmos DB**  
Azure의 글로벌 분산, 다중 모델 데이터베이스 서비스로, 처리량, 지연 시간, 가용성, 일관성에 대한 포괄적인 SLA를 제공합니다.

**Configuration**  
애플리케이션 동작과 배포 옵션을 제어하는 설정 및 매개변수입니다.

## D

**Deployment**  
애플리케이션과 그 종속성을 대상 인프라에 설치하고 구성하는 과정입니다.

**Docker**  
컨테이너화 기술을 사용하여 애플리케이션을 개발, 배포, 실행하는 플랫폼입니다.

**Dockerfile**  
Docker 컨테이너 이미지를 빌드하기 위한 지침을 포함하는 텍스트 파일입니다.

## E

**Environment**  
애플리케이션의 특정 인스턴스를 나타내는 배포 대상(예: 개발, 스테이징, 프로덕션)입니다.

**Environment Variables**  
애플리케이션이 런타임에 액세스할 수 있는 키-값 쌍으로 저장된 구성 값입니다.

**Endpoint**  
애플리케이션 또는 서비스에 액세스할 수 있는 URL 또는 네트워크 주소입니다.

## F

**Function App**  
인프라를 관리하지 않고 이벤트 기반 코드를 실행할 수 있는 Azure의 서버리스 컴퓨팅 서비스입니다.

## G

**GitHub Actions**  
GitHub 저장소와 통합된 CI/CD 플랫폼으로 워크플로를 자동화합니다.

**Git**  
소스 코드 변경 사항을 추적하기 위한 분산 버전 관리 시스템입니다.

## H

**Hooks**  
배포 라이프사이클의 특정 시점(preprovision, postprovision, predeploy, postdeploy)에 실행되는 사용자 정의 스크립트 또는 명령입니다.

**Host**  
애플리케이션이 배포될 Azure 서비스 유형(예: appservice, containerapp, function)입니다.

## I

**Infrastructure as Code (IaC)**  
수동 프로세스 대신 코드를 통해 인프라를 정의하고 관리하는 실천 방법입니다.

**Init**  
일반적으로 템플릿에서 새로운 azd 프로젝트를 초기화하는 과정입니다.

## J

**JSON**  
JavaScript Object Notation. 구성 파일 및 API 응답에 일반적으로 사용되는 데이터 교환 형식입니다.

**JWT**  
JSON Web Token. JSON 객체로 정보를 안전하게 전송하기 위한 표준입니다.

## K

**Key Vault**  
비밀, 키, 인증서를 안전하게 저장하고 관리하기 위한 Azure 서비스입니다.

**Kusto Query Language (KQL)**  
Azure Monitor, Application Insights 및 기타 Azure 서비스에서 데이터를 분석하는 데 사용되는 쿼리 언어입니다.

## L

**Load Balancer**  
들어오는 네트워크 트래픽을 여러 서버 또는 인스턴스에 분산시키는 서비스입니다.

**Log Analytics**  
클라우드 및 온프레미스 환경에서 원격 측정 데이터를 수집, 분석, 조치하는 Azure 서비스입니다.

## M

**Managed Identity**  
Azure 서비스가 다른 Azure 서비스에 인증하기 위한 자동 관리 ID를 제공하는 Azure 기능입니다.

**Microservices**  
애플리케이션을 작은 독립적인 서비스 모음으로 구축하는 아키텍처 접근 방식입니다.

**Monitor**  
애플리케이션 및 인프라 전반에 걸쳐 전체 스택 관찰성을 제공하는 Azure의 통합 모니터링 솔루션입니다.

## N

**Node.js**  
서버 측 애플리케이션을 구축하기 위한 Chrome V8 JavaScript 엔진 기반의 JavaScript 런타임입니다.

**npm**  
Node.js의 패키지 관리자이며 종속성과 패키지를 관리합니다.

## O

**Output**  
애플리케이션 또는 다른 리소스에서 사용할 수 있는 인프라 배포에서 반환된 값입니다.

## P

**Package**  
애플리케이션 코드와 종속성을 배포할 준비를 하는 과정입니다.

**Parameters**  
배포를 사용자 정의하기 위해 인프라 템플릿에 전달되는 입력 값입니다.

**PostgreSQL**  
Azure에서 관리 서비스로 지원되는 오픈 소스 관계형 데이터베이스 시스템입니다.

**Provisioning**  
인프라 템플릿에 정의된 Azure 리소스를 생성하고 구성하는 과정입니다.

## Q

**Quota**  
Azure 구독 또는 지역에서 생성할 수 있는 리소스의 양에 대한 제한입니다.

## R

**Resource Group**  
동일한 라이프사이클, 권한 및 정책을 공유하는 Azure 리소스를 위한 논리적 컨테이너입니다.

**Resource Token**  
azd에서 생성된 고유 문자열로 리소스 이름이 배포 간에 고유하도록 보장합니다.

**REST API**  
HTTP 메서드를 사용하여 네트워크 애플리케이션을 설계하기 위한 아키텍처 스타일입니다.

**Rollback**  
애플리케이션 또는 인프라 구성의 이전 버전으로 되돌리는 과정입니다.

## S

**Service**  
azure.yaml에서 정의된 애플리케이션의 구성 요소(예: 웹 프론트엔드, API 백엔드, 데이터베이스)입니다.

**SKU**  
Azure 리소스의 다양한 서비스 계층 또는 성능 수준을 나타냅니다.

**SQL Database**  
Microsoft SQL Server를 기반으로 한 Azure의 관리형 관계형 데이터베이스 서비스입니다.

**Static Web Apps**  
소스 코드 저장소에서 풀스택 웹 애플리케이션을 빌드하고 배포하기 위한 Azure 서비스입니다.

**Storage Account**  
블롭, 파일, 큐, 테이블을 포함한 데이터 객체를 위한 클라우드 스토리지를 제공하는 Azure 서비스입니다.

**Subscription**  
리소스 그룹과 리소스를 보유하며 관련된 청구 및 액세스 관리를 포함하는 Azure 계정 컨테이너입니다.

## T

**Template**  
일반적인 시나리오를 위한 애플리케이션 코드, 인프라 정의 및 구성 파일을 포함하는 사전 구축된 프로젝트 구조입니다.

**Terraform**  
Azure를 포함한 여러 클라우드 제공자를 지원하는 오픈 소스 코드 기반 인프라 도구입니다.

**Traffic Manager**  
글로벌 Azure 지역 간 트래픽을 분산시키기 위한 Azure의 DNS 기반 트래픽 로드 밸런서입니다.

## U

**URI**  
Uniform Resource Identifier. 특정 리소스를 식별하는 문자열입니다.

**URL**  
Uniform Resource Locator. 리소스의 위치와 검색 방법을 지정하는 URI 유형입니다.

## V

**Virtual Network (VNet)**  
Azure에서 격리 및 세분화를 제공하는 사설 네트워크의 기본 구성 요소입니다.

**VS Code**  
Visual Studio Code. Azure 및 azd 통합이 뛰어난 인기 있는 코드 편집기입니다.

## W

**Webhook**  
특정 이벤트에 의해 트리거되는 HTTP 콜백으로, 일반적으로 CI/CD 파이프라인에서 사용됩니다.

**What-if**  
배포를 실제로 실행하지 않고 배포가 어떤 변경을 가져올지 보여주는 Azure 기능입니다.

## Y

**YAML**  
YAML Ain't Markup Language. azure.yaml과 같은 구성 파일에 사용되는 사람이 읽기 쉬운 데이터 직렬화 표준입니다.

## Z

**Zone**  
중복성과 높은 가용성을 제공하는 Azure 지역 내 물리적으로 분리된 위치입니다.

---

## 일반 약어

| 약어 | 전체 이름 | 설명 |
|------|----------|------|
| AAD | Azure Active Directory | ID 및 액세스 관리 서비스 |
| ACR | Azure Container Registry | 컨테이너 이미지 레지스트리 서비스 |
| AKS | Azure Kubernetes Service | 관리형 Kubernetes 서비스 |
| API | Application Programming Interface | 소프트웨어를 구축하기 위한 프로토콜 세트 |
| ARM | Azure Resource Manager | Azure의 배포 및 관리 서비스 |
| CDN | Content Delivery Network | 분산 서버 네트워크 |
| CI/CD | Continuous Integration/Continuous Deployment | 자동화된 개발 실천 방법 |
| CLI | Command Line Interface | 텍스트 기반 사용자 인터페이스 |
| DNS | Domain Name System | 도메인 이름을 IP 주소로 변환하는 시스템 |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP의 보안 버전 |
| IaC | Infrastructure as Code | 코드를 통해 인프라 관리 |
| JSON | JavaScript Object Notation | 데이터 교환 형식 |
| JWT | JSON Web Token | 안전한 정보 전송을 위한 토큰 형식 |
| KQL | Kusto Query Language | Azure 데이터 서비스용 쿼리 언어 |
| RBAC | Role-Based Access Control | 사용자 역할 기반 액세스 제어 방법 |
| REST | Representational State Transfer | 웹 서비스용 아키텍처 스타일 |
| SDK | Software Development Kit | 개발 도구 모음 |
| SLA | Service Level Agreement | 서비스 가용성/성능에 대한 약속 |
| SQL | Structured Query Language | 관계형 데이터베이스 관리 언어 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 암호화 프로토콜 |
| URI | Uniform Resource Identifier | 리소스를 식별하는 문자열 |
| URL | Uniform Resource Locator | 리소스 위치를 지정하는 URI 유형 |
| VM | Virtual Machine | 컴퓨터 시스템의 에뮬레이션 |
| VNet | Virtual Network | Azure의 사설 네트워크 |
| YAML | YAML Ain't Markup Language | 데이터 직렬화 표준 |

---

## Azure 서비스 이름 매핑

| 일반 이름 | 공식 Azure 서비스 이름 | azd Host 유형 |
|-----------|-------------------------|----------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## 상황별 용어

### 개발 용어
- **Hot Reload**: 애플리케이션을 재시작하지 않고 개발 중 자동으로 업데이트
- **Build Pipeline**: 코드 빌드 및 테스트를 위한 자동화된 프로세스
- **Deployment Slot**: App Service 내의 스테이징 환경
- **Environment Parity**: 개발, 스테이징, 프로덕션 환경을 유사하게 유지

### 보안 용어
- **Managed Identity**: 자동 자격 증명 관리를 제공하는 Azure 기능
- **Key Vault**: 비밀, 키, 인증서를 안전하게 저장
- **RBAC**: Azure 리소스에 대한 역할 기반 액세스 제어
- **Network Security Group**: 네트워크 트래픽을 제어하는 가상 방화벽

### 모니터링 용어
- **Telemetry**: 측정 및 데이터를 자동으로 수집
- **Application Performance Monitoring (APM)**: 소프트웨어 성능 모니터링
- **Log Analytics**: 로그 데이터를 수집 및 분석하는 서비스
- **Alert Rules**: 메트릭 또는 조건에 따라 자동 알림

### 배포 용어
- **Blue-Green Deployment**: 다운타임 없는 배포 전략
- **Canary Deployment**: 사용자 하위 집합에 점진적으로 배포
- **Rolling Update**: 애플리케이션 인스턴스를 순차적으로 교체
- **Rollback**: 애플리케이션의 이전 버전으로 되돌리기

---

**사용 팁**: `Ctrl+F`를 사용하여 이 용어집에서 특정 용어를 빠르게 검색하세요. 용어는 관련된 경우 교차 참조됩니다.

---

**탐색**
- **이전 레슨**: [치트 시트](cheat-sheet.md)
- **다음 레슨**: [FAQ](faq.md)

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서를 해당 언어로 작성된 상태에서 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.  