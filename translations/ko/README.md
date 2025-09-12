<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T16:56:22+00:00",
  "source_file": "README.md",
  "language_code": "ko"
}
-->
# AZD 초보자를 위한 가이드

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ko.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)

![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)

다음 단계를 따라 이 리소스를 사용해 보세요:
1. **저장소 포크하기**: 클릭 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **저장소 클론하기**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Azure Discord 커뮤니티에 가입하여 전문가 및 다른 개발자들과 만나보세요**](https://discord.com/invite/ByRwuEEgH4)

### 다국어 지원

#### GitHub Action을 통해 지원 (자동화 및 항상 최신 상태 유지)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](./README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**추가 번역 언어를 지원하려면 [여기](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)를 참조하세요**

## 소개

Azure Developer CLI (azd)에 대한 종합 가이드에 오신 것을 환영합니다. 이 저장소는 학생부터 전문 개발자까지 모든 수준의 개발자가 Azure Developer CLI를 배우고 숙달하여 효율적인 클라우드 배포를 수행할 수 있도록 설계되었습니다. 특히 **Azure AI Foundry를 사용한 AI 애플리케이션 배포**에 중점을 둡니다. 이 구조화된 학습 리소스는 Azure 클라우드 배포, 일반적인 문제 해결, 성공적인 AZD 템플릿 배포를 위한 모범 사례 구현에 대한 실습 경험을 제공합니다.

### **AI 개발자에게 이 가이드가 중요한 이유**
최근 Azure AI Foundry Discord 커뮤니티 설문조사에 따르면, **45%의 개발자가 AI 워크로드에 AZD를 사용하고 싶어하지만** 다음과 같은 어려움을 겪고 있습니다:
- 복잡한 다중 서비스 AI 아키텍처
- 프로덕션 AI 배포 모범 사례
- Azure AI 서비스 통합 및 구성
- AI 워크로드 비용 최적화
- AI 특화 배포 문제 해결

## 학습 목표

이 저장소를 통해 다음을 배울 수 있습니다:
- Azure Developer CLI 기본 및 핵심 개념 숙달
- 코드형 인프라를 사용하여 Azure 리소스 배포 및 프로비저닝
- 일반적인 AZD 배포 문제 해결 기술 개발
- 사전 배포 검증 및 용량 계획 이해
- 보안 모범 사례 및 비용 최적화 전략 구현
- 프로덕션 준비 애플리케이션을 Azure에 배포하는 자신감 구축

## 학습 결과

이 과정을 완료하면 다음을 수행할 수 있습니다:
- Azure Developer CLI를 성공적으로 설치, 구성 및 사용
- AZD 템플릿을 사용하여 애플리케이션 생성 및 배포
- 인증, 인프라 및 배포 문제 해결
- 용량 계획 및 SKU 선택을 포함한 사전 배포 점검 수행
- 모니터링, 보안 및 비용 관리 모범 사례 구현
- CI/CD 파이프라인에 AZD 워크플로 통합

## 목차

- [Azure Developer CLI란?](../..)
- [빠른 시작](../..)
- [학습 경로](../..)
  - [AI 개발자를 위한 학습 경로 (추천 시작점)](../..)
  - [학생 및 초보자를 위한 학습 경로](../..)
  - [개발자를 위한 학습 경로](../..)
  - [DevOps 엔지니어를 위한 학습 경로](../..)
- [문서](../..)
  - [시작하기](../..)
  - [배포 및 프로비저닝](../..)
  - [사전 배포 점검](../..)
  - [AI 및 Azure AI Foundry](../..)
  - [문제 해결](../..)
- [예제 및 템플릿](../..)
  - [추천: Azure AI Foundry 템플릿](../..)
  - [추천: Azure AI Foundry E2E 시나리오](../..)
  - [추가 AZD 템플릿](../..)
  - [실습 및 워크숍](../..)
- [리소스](../..)
- [기여](../..)
- [지원](../..)
- [커뮤니티](../..)

## Azure Developer CLI란?

Azure Developer CLI (azd)는 Azure에 애플리케이션을 빌드하고 배포하는 과정을 가속화하는 개발자 중심의 명령줄 인터페이스입니다. 주요 기능은 다음과 같습니다:

- **템플릿 기반 배포** - 일반적인 애플리케이션 패턴을 위한 사전 제작된 템플릿 사용
- **코드형 인프라** - Bicep 또는 Terraform을 사용하여 Azure 리소스 관리
- **통합 워크플로** - 애플리케이션 프로비저닝, 배포 및 모니터링을 원활하게 수행
- **개발자 친화적** - 개발자 생산성과 경험을 최적화

### **AZD + Azure AI Foundry: AI 배포에 최적화**

**AI 솔루션에 AZD를 사용하는 이유?** AZD는 AI 개발자가 직면하는 주요 문제를 해결합니다:

- **AI 준비 템플릿** - Azure OpenAI, Cognitive Services 및 ML 워크로드를 위한 사전 구성 템플릿
- **안전한 AI 배포** - AI 서비스, API 키 및 모델 엔드포인트를 위한 내장 보안 패턴
- **프로덕션 AI 패턴** - 확장 가능하고 비용 효율적인 AI 애플리케이션 배포를 위한 모범 사례
- **엔드 투 엔드 AI 워크플로** - 모델 개발부터 적절한 모니터링을 통한 프로덕션 배포까지
- **비용 최적화** - AI 워크로드를 위한 스마트 리소스 할당 및 확장 전략
- **Azure AI Foundry 통합** - AI Foundry 모델 카탈로그 및 엔드포인트와의 원활한 연결

## 빠른 시작

### 사전 준비
- Azure 구독
- Azure CLI 설치
- Git (템플릿 클론용)

### 설치
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### 첫 번째 배포
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### 첫 번째 AI 배포
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## 학습 경로

### AI 개발자를 위한 학습 경로 (추천 시작점)
1. **빠른 시작**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) 템플릿 시도
2. **기본 학습**: [AZD 기본](docs/getting-started/azd-basics.md) + [Azure AI Foundry 통합](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **실습**: [AI 워크숍 실습](docs/ai-foundry/ai-workshop-lab.md) 완료
4. **프로덕션 준비**: [프로덕션 AI 모범 사례](docs/ai-foundry/production-ai-practices.md) 검토
5. **고급 학습**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat) 엔터프라이즈 템플릿 배포

### 학생 및 초보자를 위한 학습 경로
1. [AZD 기본](docs/getting-started/azd-basics.md)부터 시작
2. [설치 가이드](docs/getting-started/installation.md) 따라하기
3. [첫 번째 프로젝트](docs/getting-started/first-project.md) 완료
4. [간단한 웹 앱 예제](../../examples/simple-web-app) 실습

### 개발자를 위한 학습 경로
1. [구성 가이드](docs/getting-started/configuration.md) 검토
2. [배포 가이드](docs/deployment/deployment-guide.md) 학습
3. [데이터베이스 앱 예제](../../examples/database-app) 실습
4. [컨테이너 앱 예제](../../examples/container-app) 탐색

### DevOps 엔지니어를 위한 학습 경로
1. [리소스 프로비저닝](docs/deployment/provisioning.md) 숙달
2. [사전 점검](docs/pre-deployment/preflight-checks.md) 구현
3. [용량 계획](docs/pre-deployment/capacity-planning.md) 실습
4. 고급 [마이크로서비스 예제](../../examples/microservices) 학습

## 문서

### 시작하기
- [**AZD 기본**](docs/getting-started/azd-basics.md) - 핵심 개념 및 용어
- [**설치 및 설정**](docs/getting-started/installation.md) - 플랫폼별 설치 가이드
- [**구성**](docs/getting-started/configuration.md) - 환경 설정 및 인증
- [**첫 번째 프로젝트**](docs/getting-started/first-project.md) - 단계별 튜토리얼

### 배포 및 프로비저닝
- [**배포 가이드**](docs/deployment/deployment-guide.md) - 완전한 배포 워크플로
- [**리소스 프로비저닝**](docs/deployment/provisioning.md) - Azure 리소스 관리

### 사전 배포 점검
- [**용량 계획**](docs/pre-deployment/capacity-planning.md) - Azure 리소스 용량 검증
- [**SKU 선택**](docs/pre-deployment/sku-selection.md) - 적합한 Azure SKU 선택
- [**사전 점검**](docs/pre-deployment/preflight-checks.md) - 자동화된 검증 스크립트

### AI 및 Azure AI Foundry
- [**Azure AI Foundry 통합**](docs/ai-foundry/azure-ai-foundry-integration.md) - AZD와 Azure AI Foundry 서비스 연결
- [**AI 모델 배포 패턴**](docs/ai-foundry/ai-model-deployment.md) - AZD를 사용한 AI 모델 배포 및 관리
- [**AI 워크숍 실습**](docs/ai-foundry/ai-workshop-lab.md) - 실습: AI 솔루션을 AZD에 적합하게 만들기
- [**프로덕션 AI 모범 사례**](docs/ai-foundry/production-ai-practices.md) - AI 워크로드를 위한 보안, 확장 및 모니터링

### 문제 해결
- [**일반적인 문제**](docs/troubleshooting/common-issues.md) - 자주 발생하는 문제와 해결 방법
- [**디버깅 가이드**](docs/troubleshooting/debugging.md) - 단계별 디버깅 전략
- [**AI 관련 문제 해결**](docs/troubleshooting/ai-troubleshooting.md) - AI 서비스 및 모델 배포 문제

## 예제 및 템플릿

### [추천: Azure AI Foundry 템플릿](https://ai.azure.com/resource/build/templates)
**AI 애플리케이션을 배포하려면 여기서 시작하세요!**

| 템플릿 | 설명 | 복잡도 | 서비스 |
|----------|-------------|------------|----------|
| [**AI 채팅 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps를 사용하여 데이터 및 텔레메트리 인사이트와 통합된 기본 채팅 애플리케이션 생성 및 배포 |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI 에이전트 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Azure Container Apps를 사용하여 액션 및 텔레메트리 인사이트를 포함한 기본 에이전트 애플리케이션 생성 및 배포 |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**다중 에이전트 워크플로 자동화**](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI 에이전트 그룹을 조율하고 관리하여 작업 계획 및 자동화를 강화합니다.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**데이터에서 문서 생성**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 데이터에서 관련 정보를 찾아 요약하여 계약서, 청구서 및 투자 제안서와 같은 문서 생성을 가속화합니다. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**클라이언트 미팅 개선**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 에이전트 팀을 활용하여 레거시 코드를 현대적인 언어로 마이그레이션합니다. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**코드 현대화**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps를 사용하여 데이터 및 텔레메트리 인사이트와 통합된 기본 채팅 애플리케이션 생성 및 배포 |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**대화형 에이전트 구축**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 고급 대화 이해를 활용하여 결정론적이고 인간이 제어 가능한 워크플로를 통해 챗봇 및 에이전트를 생성 및 개선합니다. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**대화 데이터에서 인사이트 도출**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 대규모 오디오 및 텍스트 기반 데이터 세트에서 인사이트를 발견하여 컨택 센터 효율성을 개선합니다. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**다중 모달 콘텐츠 처리**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 비정형 콘텐츠에서 정보를 추출하고 이를 구조화된 형식으로 매핑하여 청구서, 계약서 및 기타 문서를 신속하고 정확하게 처리합니다. 이 템플릿은 텍스트, 이미지, 표 및 그래프를 지원합니다. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### 추천: Azure AI Foundry E2E 시나리오
**AI 애플리케이션을 배포하려면 여기서 시작하세요!**

| 템플릿 | 설명 | 복잡도 | 서비스 |
|----------|-------------|------------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Azure OpenAI를 활용한 간단한 채팅 인터페이스 | ⭐ | AzureOpenAI + Container Apps |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG 지원 채팅 애플리케이션 | ⭐⭐ | AzureOpenAI + Search + App Service |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | AI 서비스를 활용한 문서 분석 | ⭐⭐ | Azure Document Intelligence + Functions |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 함수 호출을 포함한 AI 에이전트 프레임워크 | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | AI 오케스트레이션을 활용한 엔터프라이즈 채팅 | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |

### 추가 AZD 템플릿
- [**예제 디렉토리**](examples/README.md) - 실용적인 예제, 템플릿 및 실제 시나리오
- [**Azure-Samples AZD 템플릿**](https://github.com/Azure-Samples/azd-templates) - Microsoft 공식 샘플 템플릿  
- [**Awesome AZD 갤러리**](https://azure.github.io/awesome-azd/) - 커뮤니티 기여 템플릿

### 실습 및 워크숍
- [**AI 워크숍 랩**](docs/ai-foundry/ai-workshop-lab.md) - **NEW**: AI 솔루션을 AZD로 배포 가능하게 만들기
- [**AZD 초보자 워크숍**](workshop/README.md) - AI 에이전트 AZD 템플릿 배포에 중점

## 리소스

### 빠른 참조
- [**명령어 치트 시트**](resources/cheat-sheet.md) - 필수 azd 명령어
- [**용어집**](resources/glossary.md) - Azure 및 azd 용어
- [**FAQ**](resources/faq.md) - 자주 묻는 질문
- [**학습 가이드**](resources/study-guide.md) - 포괄적인 학습 목표 및 연습 문제

### 외부 리소스
- [Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 가격 계산기](https://azure.microsoft.com/pricing/calculator/)
- [Azure 상태](https://status.azure.com/)

## 기여

기여를 환영합니다! [기여 가이드](CONTRIBUTING.md)를 읽고 다음 내용을 확인하세요:
- 문제 및 기능 요청 제출 방법
- 코드 기여 지침
- 문서 개선
- 커뮤니티 표준

## 지원

- **문제**: [버그 보고 및 기능 요청](https://github.com/microsoft/azd-for-beginners/issues)
- **토론**: [Microsoft Azure Discord 커뮤니티 Q&A 및 토론](https://discord.gg/microsoft-azure)
- **AI 관련 지원**: AZD + AI Foundry 토론을 위한 [#Azure 채널](https://discord.gg/microsoft-azure)에 참여하세요
- **이메일**: 비공개 문의
- **Microsoft Learn**: [공식 Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord 커뮤니티 인사이트

**#Azure 채널 설문조사 결과:**
- **45%**의 개발자가 AI 워크로드에 AZD를 사용하고 싶어합니다.
- **주요 과제**: 다중 서비스 배포, 자격 증명 관리, 프로덕션 준비
- **가장 요청이 많은 항목**: AI 전용 템플릿, 문제 해결 가이드, 모범 사례

**커뮤니티에 참여하여:**
- AZD + AI 경험을 공유하고 도움을 받으세요
- 새로운 AI 템플릿의 초기 미리보기를 이용하세요
- AI 배포 모범 사례에 기여하세요
- 향후 AI + AZD 기능 개발에 영향을 미치세요

## 라이선스

이 프로젝트는 MIT 라이선스에 따라 라이선스가 부여됩니다 - 자세한 내용은 [LICENSE](../../LICENSE) 파일을 참조하세요.

## 기타 강좌

우리 팀은 다른 강좌도 제공합니다! 확인해보세요:

- [**NEW** 초보자를 위한 모델 컨텍스트 프로토콜 (MCP)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 AI 에이전트](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [.NET을 사용한 초보자를 위한 생성 AI](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 생성 AI](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Java를 사용한 초보자를 위한 생성 AI](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 ML](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 데이터 과학](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 AI](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 사이버 보안](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [초보자를 위한 웹 개발](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 IoT](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 XR 개발](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI 페어드 프로그래밍을 위한 GitHub Copilot 마스터하기](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [C#/.NET 개발자를 위한 GitHub Copilot 마스터하기](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [자신만의 Copilot 모험 선택하기](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**탐색**
- **다음 강의**: [AZD 기본](docs/getting-started/azd-basics.md)

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전을 신뢰할 수 있는 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.