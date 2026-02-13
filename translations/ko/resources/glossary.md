# Glossary - Azure 및 AZD 용어집

**모든 장의 참고 자료**  
- **📚 강좌 홈**: [AZD 초보자용](../README.md)  
- **📖 기본 학습**: [1장: AZD 기본](../docs/getting-started/azd-basics.md)  
- **🤖 AI 용어**: [2장: AI-우선 개발](../docs/microsoft-foundry/microsoft-foundry-integration.md)  

## 소개

이 종합 용어집은 Azure Developer CLI와 Azure 클라우드 개발에서 사용되는 용어, 개념 및 약어들의 정의를 제공합니다. 기술 문서 이해, 문제 해결 및 azd 프로젝트와 Azure 서비스에 대해 효과적으로 소통하는 데 필수적인 참고 자료입니다.

## 학습 목표

이 용어집을 사용하여:
- 필수 Azure Developer CLI 용어와 개념을 이해합니다  
- Azure 클라우드 개발 어휘 및 기술 용어를 숙달합니다  
- Infrastructure as Code 및 배포 용어를 효율적으로 참조합니다  
- Azure 서비스 이름, 약어 및 용도를 파악합니다  
- 문제 해결 및 디버깅 용어의 정의에 접근합니다  
- 고급 Azure 아키텍처 및 개발 개념을 학습합니다  

## 학습 결과

이 용어집을 정기적으로 참고하면:
- 올바른 Azure Developer CLI 용어를 사용하여 효과적으로 소통할 수 있습니다  
- 기술 문서 및 오류 메시지를 더 명확하게 이해할 수 있습니다  
- Azure 서비스 및 개념을 자신 있게 탐색할 수 있습니다  
- 적절한 기술 용어를 사용하여 문제를 해결할 수 있습니다  
- 정확한 기술 언어로 팀 토론에 기여할 수 있습니다  
- 체계적으로 Azure 클라우드 개발 지식을 확장할 수 있습니다  

## A

**ARM Template**  
Azure Resource Manager 템플릿. Azure 리소스를 선언적으로 정의 및 배포하는 JSON 기반 Infrastructure as Code 형식입니다.

**App Service**  
Azure의 플랫폼형 서비스(PaaS)로, 인프라 관리 없이 웹 애플리케이션, REST API 및 모바일 백엔드를 호스팅합니다.

**Application Insights**  
Azure의 애플리케이션 성능 모니터링(APM) 서비스로, 애플리케이션 성능, 가용성 및 사용에 대한 심층 정보를 제공합니다.

**Azure CLI**  
Azure 리소스 관리를 위한 명령줄 인터페이스입니다. azd에서 인증 및 일부 작업에 사용됩니다.

**Azure Developer CLI (azd)**  
템플릿과 Infrastructure as Code를 사용하여 Azure로 애플리케이션을 신속하게 구축하고 배포하는 개발자 중심 명령줄 도구입니다.

**azure.yaml**  
azd 프로젝트의 주요 구성 파일로, 서비스, 인프라, 배포 훅을 정의합니다.

**Azure Resource Manager (ARM)**  
리소스 생성, 업데이트 및 삭제를 위한 관리 계층을 제공하는 Azure의 배포 및 관리 서비스입니다.

## B

**Bicep**  
Azure 리소스 배포를 위해 Microsoft가 개발한 도메인 특화 언어(DSL)입니다. ARM 템플릿보다 간단한 문법을 제공하며 ARM으로 컴파일됩니다.

**Build**  
소스 코드 컴파일, 종속성 설치 및 배포 준비 과정을 말합니다.

**Blue-Green Deployment**  
두 개의 동일한 운영 환경(블루와 그린)을 사용하여 다운타임과 위험을 최소화하는 배포 전략입니다.

## C

**Container Apps**  
복잡한 인프라 관리 없이 컨테이너화된 애플리케이션을 실행할 수 있는 Azure의 서버리스 컨테이너 서비스입니다.

**CI/CD**  
지속적 통합/지속적 배포. 코드 변경 통합과 애플리케이션 배포를 자동화하는 방법론입니다.

**Cosmos DB**  
전 세계적으로 분산된 멀티모델 데이터베이스 서비스로, 처리량, 대기 시간, 가용성 및 일관성에 대한 포괄적인 SLA를 제공합니다.

**Configuration**  
애플리케이션 동작 및 배포 옵션을 제어하는 설정 및 매개변수입니다.

## D

**Deployment**  
애플리케이션과 그 종속성을 대상 인프라에 설치하고 구성하는 과정입니다.

**Docker**  
컨테이너화 기술을 사용하여 애플리케이션을 개발, 배송 및 실행하는 플랫폼입니다.

**Dockerfile**  
Docker 컨테이너 이미지를 빌드하기 위한 명령이 들어 있는 텍스트 파일입니다.

## E

**Environment**  
애플리케이션의 특정 인스턴스를 나타내는 배포 대상입니다(예: 개발, 스테이징, 운영).

**Environment Variables**  
애플리케이션이 런타임에 접근할 수 있는 키-값 쌍으로 저장된 구성 값입니다.

**Endpoint**  
애플리케이션 또는 서비스에 접근할 수 있는 URL 또는 네트워크 주소입니다.

## F

**Function App**  
인프라 관리 없이 이벤트 기반 코드를 실행할 수 있는 Azure의 서버리스 컴퓨팅 서비스입니다.

## G

**GitHub Actions**  
GitHub 리포지토리에 통합된 CI/CD 플랫폼으로 워크플로우 자동화를 지원합니다.

**Git**  
소스 코드 변경을 추적하는 분산 버전 관리 시스템입니다.

## H

**Hooks**  
배포 수명주기 중 특정 시점(프로비저닝 전/후, 배포 전/후)에 실행되는 사용자 정의 스크립트 또는 명령입니다.

**Host**  
애플리케이션이 배포될 Azure 서비스 유형입니다(예: appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
수동 작업 대신 코드를 통해 인프라를 정의하고 관리하는 실천법입니다.

**Init**  
일반적으로 템플릿을 사용해 새 azd 프로젝트를 초기화하는 과정입니다.

## J

**JSON**  
JavaScript Object Notation. 구성 파일 및 API 응답에 자주 사용되는 데이터 교환 형식입니다.

**JWT**  
JSON Web Token. JSON 객체로 정보를 안전하게 전송하는 표준입니다.

## K

**Key Vault**  
비밀, 키, 인증서를 안전하게 저장 및 관리하는 Azure 서비스입니다.

**Kusto Query Language (KQL)**  
Azure Monitor, Application Insights 등 Azure 서비스의 데이터 분석에 사용되는 쿼리 언어입니다.

## L

**Load Balancer**  
들어오는 네트워크 트래픽을 여러 서버 또는 인스턴스에 분산하는 서비스입니다.

**Log Analytics**  
클라우드 및 온프레미스 환경에서 수집한 텔레메트리 데이터를 분석 및 처리하는 Azure 서비스입니다.

## M

**Managed Identity**  
Azure 서비스가 다른 Azure 서비스에 인증할 수 있도록 자동으로 관리되는 ID를 제공하는 기능입니다.

**Microservices**  
애플리케이션을 작고 독립적인 서비스 모음으로 구축하는 아키텍처 접근법입니다.

**Monitor**  
애플리케이션 및 인프라 전반에 대한 전체 스택 가시성을 제공하는 Azure 통합 모니터링 솔루션입니다.

## N

**Node.js**  
Chrome의 V8 JavaScript 엔진 위에서 빌드된 서버 측 애플리케이션용 JavaScript 런타임입니다.

**npm**  
Node.js용 패키지 관리자이며, 종속성 및 패키지를 관리합니다.

## O

**Output**  
인프라 배포로부터 반환되어 애플리케이션이나 다른 리소스에서 사용할 수 있는 값입니다.

## P

**Package**  
애플리케이션 코드와 종속성을 배포할 준비를 하는 과정입니다.

**Parameters**  
배포 맞춤화를 위해 인프라 템플릿에 전달하는 입력 값입니다.

**PostgreSQL**  
Azure에서 관리형 서비스로 지원되는 오픈소스 관계형 데이터베이스 시스템입니다.

**Provisioning**  
인프라 템플릿에 정의된 Azure 리소스를 생성하고 구성하는 과정입니다.

## Q

**Quota**  
Azure 구독 또는 지역에서 생성할 수 있는 리소스 양에 대한 제한입니다.

## R

**Resource Group**  
수명주기, 권한 및 정책을 공유하는 Azure 리소스의 논리적 컨테이너입니다.

**Resource Token**  
azd에서 배포 간 리소스 이름의 고유성을 보장하기 위해 생성하는 고유 문자열입니다.

**REST API**  
HTTP 메서드를 사용한 네트워크 애플리케이션 설계를 위한 아키텍처 스타일입니다.

**Rollback**  
애플리케이션 또는 인프라 구성의 이전 버전으로 되돌리는 과정입니다.

## S

**Service**  
azure.yaml에 정의된 애플리케이션의 구성 요소입니다(예: 웹 프론트엔드, API 백엔드, 데이터베이스).

**SKU**  
Azure 리소스의 다양한 서비스 계층 또는 성능 수준을 나타내는 단위입니다.

**SQL Database**  
Microsoft SQL Server를 기반으로 하는 Azure 관리형 관계형 데이터베이스 서비스입니다.

**Static Web Apps**  
소스 코드 저장소로부터 전체 스택 웹 애플리케이션을 구축 및 배포하는 Azure 서비스입니다.

**Storage Account**  
블롭, 파일, 큐, 테이블 등의 데이터 오브젝트 저장을 제공하는 Azure 클라우드 스토리지 서비스입니다.

**Subscription**  
리소스 그룹 및 리소스를 보유하며 청구 및 액세스 관리를 담당하는 Azure 계정 컨테이너입니다.

## T

**Template**  
애플리케이션 코드, 인프라 정의 및 공통 시나리오 구성을 포함하는 사전 구축된 프로젝트 구조입니다.

**Terraform**  
Azure를 포함한 여러 클라우드 공급자를 지원하는 오픈소스 Infrastructure as Code 도구입니다.

**Traffic Manager**  
글로벌 Azure 지역 간 트래픽 분산을 위한 Azure의 DNS 기반 트래픽 부하 분산기입니다.

## U

**URI**  
Uniform Resource Identifier. 특정 리소스를 식별하는 문자열입니다.

**URL**  
Uniform Resource Locator. 리소스 위치와 접근 방법을 지정하는 URI의 한 종류입니다.

## V

**Virtual Network (VNet)**  
Azure에서 사설 네트워크를 구축하는 기본 구성 요소로, 격리 및 분할을 제공합니다.

**VS Code**  
Visual Studio Code. Azure 및 azd 통합이 뛰어난 인기 코드 편집기입니다.

## W

**Webhook**  
특정 이벤트에 의해 트리거되는 HTTP 콜백으로, CI/CD 파이프라인에서 자주 사용됩니다.

**What-if**  
배포를 실제 실행하지 않고도 어떤 변경이 발생할지 보여주는 Azure 기능입니다.

## Y

**YAML**  
YAML Ain't Markup Language. azure.yaml 같은 구성 파일에 사용되는 사람이 읽기 쉬운 데이터 직렬화 표준입니다.

## Z

**Zone**  
Azure 리전 내 물리적으로 분리된 위치로, 중복성 및 고가용성을 제공합니다.

---

## 일반 약어

| 약어 | 전체 이름 | 설명 |
|---------|-----------|-------------|
| AAD | Azure Active Directory | ID 및 액세스 관리 서비스 |
| ACR | Azure Container Registry | 컨테이너 이미지 레지스트리 서비스 |
| AKS | Azure Kubernetes Service | 관리형 쿠버네티스 서비스 |
| API | Application Programming Interface | 소프트웨어 구축을 위한 프로토콜 집합 |
| ARM | Azure Resource Manager | Azure의 배포 및 관리 서비스 |
| CDN | Content Delivery Network | 분산 서버 네트워크 |
| CI/CD | Continuous Integration/Continuous Deployment | 자동화된 개발 관행 |
| CLI | Command Line Interface | 텍스트 기반 사용자 인터페이스 |
| DNS | Domain Name System | 도메인 이름을 IP 주소로 변환하는 시스템 |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP의 보안 버전 |
| IaC | Infrastructure as Code | 코드를 통한 인프라 관리 |
| JSON | JavaScript Object Notation | 데이터 교환 형식 |
| JWT | JSON Web Token | 안전한 정보 전송을 위한 토큰 형식 |
| KQL | Kusto Query Language | Azure 데이터 서비스용 쿼리 언어 |
| RBAC | Role-Based Access Control | 사용자 역할 기반 접근 제어 |
| REST | Representational State Transfer | 웹 서비스 아키텍처 스타일 |
| SDK | Software Development Kit | 개발 도구 모음 |
| SLA | Service Level Agreement | 서비스 가용성/성능에 대한 약속 |
| SQL | Structured Query Language | 관계형 데이터베이스 관리용 언어 |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 암호화 프로토콜 |
| URI | Uniform Resource Identifier | 리소스 식별 문자열 |
| URL | Uniform Resource Locator | 리소스 위치 지정 URI 유형 |
| VM | Virtual Machine | 컴퓨터 시스템 에뮬레이션 |
| VNet | Virtual Network | Azure 내 사설 네트워크 |
| YAML | YAML Ain't Markup Language | 데이터 직렬화 표준 |

---

## Azure 서비스 이름 매핑

| 일반 이름 | 공식 Azure 서비스 이름 | azd Host 유형 |
|-------------|------------------------------|---------------|
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
- **Hot Reload**: 개발 중 애플리케이션을 재시작 없이 자동 업데이트  
- **Build Pipeline**: 코드 빌드 및 테스트 자동화 과정  
- **Deployment Slot**: App Service 내의 스테이징 환경  
- **Environment Parity**: 개발, 스테이징, 운영 환경을 유사하게 유지  

### 보안 용어
- **Managed Identity**: 자동 자격 증명 관리를 제공하는 Azure 기능  
- **Key Vault**: 비밀, 키 및 인증서의 안전한 저장소  
- **RBAC**: Azure 리소스에 대한 역할 기반 접근 제어  
- **Network Security Group**: 네트워크 트래픽 제어를 위한 가상 방화벽  

### 모니터링 용어
- **Telemetry**: 측정치 및 데이터 자동 수집  
- **Application Performance Monitoring (APM)**: 소프트웨어 성능 모니터링  
- **Log Analytics**: 로그 데이터 수집 및 분석 서비스  
- **Alert Rules**: 메트릭 또는 조건에 기반한 자동 알림  

### 배포 용어
- **Blue-Green Deployment**: 무중단 배포 전략  
- **Canary Deployment**: 일부 사용자 대상 점진적 롤아웃  
- **Rolling Update**: 순차적 애플리케이션 인스턴스 교체  
- **Rollback**: 이전 애플리케이션 버전으로 복구  

---

**사용 팁**: `Ctrl+F`를 사용해 이 용어집 내 특정 용어를 빠르게 검색하세요. 용어는 관련된 경우 교차 참조됩니다.

---

**내비게이션**  
- **이전 강의**: [Cheat Sheet](cheat-sheet.md)  
- **다음 강의**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역에는 오류나 부정확한 부분이 있을 수 있음을 유념해 주시기 바랍니다. 원문이 포함된 원본 문서가 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인한 오해나 잘못된 해석에 대해서는 저희가 책임지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->