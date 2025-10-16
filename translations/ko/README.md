<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be5fd7bf2b02d878efdb442580d98d96",
  "translation_date": "2025-10-16T15:29:46+00:00",
  "source_file": "README.md",
  "language_code": "ko"
}
-->
# AZD 초보자를 위한 학습 여정

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ko.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## 이 과정 시작하기

AZD 학습 여정을 시작하려면 다음 단계를 따르세요:

1. **저장소 포크하기**: 클릭 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **저장소 클론하기**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **커뮤니티 가입하기**: [Azure Discord 커뮤니티](https://discord.com/invite/ByRwuEEgH4)에서 전문가 지원 받기
4. **학습 경로 선택하기**: 아래에서 자신의 경험 수준에 맞는 챕터를 선택하세요

### 다국어 지원

#### 자동 번역 (항상 최신 상태)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](./README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 과정 개요

Azure Developer CLI (azd)를 체계적인 챕터를 통해 마스터하세요. **Azure AI Foundry 통합을 활용한 AI 애플리케이션 배포에 특별 초점.**

### 이 과정이 현대 개발자에게 필수적인 이유

Azure AI Foundry Discord 커뮤니티의 통찰에 따르면, **개발자의 45%가 AZD를 AI 워크로드에 사용하고 싶어하지만** 다음과 같은 문제를 겪고 있습니다:
- 복잡한 다중 서비스 AI 아키텍처
- 프로덕션 AI 배포 모범 사례  
- Azure AI 서비스 통합 및 구성
- AI 워크로드 비용 최적화
- AI 특화 배포 문제 해결

### 학습 목표

이 체계적인 과정을 완료하면 다음을 달성할 수 있습니다:
- **AZD 기본 사항 마스터**: 핵심 개념, 설치 및 구성
- **AI 애플리케이션 배포**: AZD와 Azure AI Foundry 서비스 사용
- **코드로 인프라 구현**: Bicep 템플릿으로 Azure 리소스 관리
- **배포 문제 해결**: 일반적인 문제 해결 및 디버깅
- **프로덕션 최적화**: 보안, 확장, 모니터링 및 비용 관리
- **다중 에이전트 솔루션 구축**: 복잡한 AI 아키텍처 배포

## 📚 학습 챕터

*경험 수준과 목표에 따라 학습 경로를 선택하세요*

### 🚀 챕터 1: 기초 및 빠른 시작
**필수 조건**: Azure 구독, 기본 명령줄 지식  
**소요 시간**: 30-45분  
**난이도**: ⭐

#### 학습 내용
- Azure Developer CLI 기본 사항 이해
- 플랫폼에 AZD 설치
- 첫 번째 성공적인 배포

#### 학습 자료
- **🎯 시작하기**: [Azure Developer CLI란?](../..)
- **📖 이론**: [AZD 기본 사항](docs/getting-started/azd-basics.md) - 핵심 개념 및 용어
- **⚙️ 설정**: [설치 및 설정](docs/getting-started/installation.md) - 플랫폼별 가이드
- **🛠️ 실습**: [첫 번째 프로젝트](docs/getting-started/first-project.md) - 단계별 튜토리얼
- **📋 빠른 참조**: [명령어 치트 시트](resources/cheat-sheet.md)

#### 실습 과제
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 챕터 결과**: AZD를 사용하여 Azure에 간단한 웹 애플리케이션을 성공적으로 배포

---

### 🤖 챕터 2: AI 중심 개발 (AI 개발자 추천)
**필수 조건**: 챕터 1 완료  
**소요 시간**: 1-2시간  
**난이도**: ⭐⭐

#### 학습 내용
- AZD와 Azure AI Foundry 통합
- AI 기반 애플리케이션 배포
- AI 서비스 구성 이해

#### 학습 자료
- **🎯 시작하기**: [Azure AI Foundry 통합](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 패턴**: [AI 모델 배포](docs/ai-foundry/ai-model-deployment.md) - AI 모델 배포 및 관리
- **🛠️ 워크숍**: [AI 워크숍 랩](docs/ai-foundry/ai-workshop-lab.md) - AI 솔루션을 AZD에 적합하게 만들기
- **🎥 인터랙티브 가이드**: [워크숍 자료](workshop/README.md) - MkDocs * DevContainer 환경을 활용한 브라우저 기반 학습
- **📋 템플릿**: [Azure AI Foundry 템플릿](../..)

#### 실습 과제
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 챕터 결과**: RAG 기능을 갖춘 AI 기반 채팅 애플리케이션 배포 및 구성

---

### ⚙️ 챕터 3: 구성 및 인증
**필수 조건**: 챕터 1 완료  
**소요 시간**: 45-60분  
**난이도**: ⭐⭐

#### 학습 내용
- 환경 구성 및 관리
- 인증 및 보안 모범 사례
- 리소스 명명 및 조직화

#### 학습 자료
- **📖 구성**: [구성 가이드](docs/getting-started/configuration.md) - 환경 설정
- **🔐 보안**: 인증 패턴 및 관리 ID
- **📝 예제**: [데이터베이스 앱 예제](../../examples/database-app) - 구성 패턴

#### 실습 과제
- 여러 환경 구성 (개발, 스테이징, 프로덕션)
- 관리 ID 인증 설정
- 환경별 구성 구현

**💡 챕터 결과**: 적절한 인증 및 보안을 갖춘 여러 환경 관리

---

### 🏗️ 챕터 4: 코드로 인프라 구현 및 배포
**필수 조건**: 챕터 1-3 완료  
**소요 시간**: 1-1.5시간  
**난이도**: ⭐⭐⭐

#### 학습 내용
- 고급 배포 패턴
- Bicep을 활용한 코드로 인프라 구현
- 리소스 프로비저닝 전략

#### 학습 자료
- **📖 배포**: [배포 가이드](docs/deployment/deployment-guide.md) - 전체 워크플로우
- **🏗️ 프로비저닝**: [리소스 프로비저닝](docs/deployment/provisioning.md) - Azure 리소스 관리
- **📝 예제**: [컨테이너 앱 예제](../../examples/container-app) - 컨테이너화된 배포

#### 실습 과제
- 맞춤형 Bicep 템플릿 생성
- 다중 서비스 애플리케이션 배포
- 블루-그린 배포 전략 구현

**💡 챕터 결과**: 맞춤형 인프라 템플릿을 사용하여 복잡한 다중 서비스 애플리케이션 배포

---

### 🎯 챕터 5: 다중 에이전트 AI 솔루션 (고급)
**필수 조건**: 챕터 1-2 완료  
**소요 시간**: 2-3시간  
**난이도**: ⭐⭐⭐⭐

#### 학습 내용
- 다중 에이전트 아키텍처 패턴
- 에이전트 오케스트레이션 및 조정
- 프로덕션 준비된 AI 배포

#### 학습 자료
- **🤖 추천 프로젝트**: [소매 다중 에이전트 솔루션](examples/retail-scenario.md) - 완전한 구현
- **🛠️ ARM 템플릿**: [ARM 템플릿 패키지](../../examples/retail-multiagent-arm-template) - 원클릭 배포
- **📖 아키텍처**: 다중 에이전트 조정 패턴

#### 실습 과제
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 챕터 결과**: 고객 및 재고 에이전트를 포함한 프로덕션 준비된 다중 에이전트 AI 솔루션 배포 및 관리

---

### 🔍 챕터 6: 사전 배포 검증 및 계획
**필수 조건**: 챕터 4 완료  
**소요 시간**: 1시간  
**난이도**: ⭐⭐

#### 학습 내용
- 용량 계획 및 리소스 검증
- SKU 선택 전략
- 사전 점검 및 자동화

#### 학습 자료
- **📊 계획**: [용량 계획](docs/pre-deployment/capacity-planning.md) - 리소스 검증
- **💰 선택**: [SKU 선택](docs/pre-deployment/sku-selection.md) - 비용 효율적인 선택
- **✅ 검증**: [사전 점검](docs/pre-deployment/preflight-checks.md) - 자동화된 스크립트

#### 실습 과제
- 용량 검증 스크립트 실행
- 비용 최적화를 위한 SKU 선택
- 자동화된 사전 배포 점검 구현

**💡 챕터 결과**: 배포 실행 전에 검증 및 최적화 완료

---

### 🚨 챕터 7: 문제 해결 및 디버깅
**필수 조건**: 배포 챕터 중 하나 완료  
**소요 시간**: 1-1.5시간  
**난이도**: ⭐⭐

#### 학습 내용
- 체계적인 디버깅 접근법
- 일반적인 문제 및 해결책
- AI 특화 문제 해결

#### 학습 자료
- **🔧 일반 문제**: [일반 문제](docs/troubleshooting/common-issues.md) - FAQ 및 해결책
- **🕵️ 디버깅**: [디버깅 가이드](docs/troubleshooting/debugging.md) - 단계별 전략
- **🤖 AI 문제**: [AI 특화 문제 해결](docs/troubleshooting/ai-troubleshooting.md) - AI 서비스 문제

#### 실습 과제
- 배포 실패 진단
- 인증 문제 해결
- AI 서비스 연결 디버깅

**💡 챕터 결과**: 일반적인 배포 문제를 독립적으로 진단하고 해결

---

### 🏢 챕터 8: 프로덕션 및 엔터프라이즈 패턴
**필수 조건**: 챕터 1-4 완료  
**소요 시간**: 2-3시간  
**복잡도**: ⭐⭐⭐⭐

#### 학습 내용
- 프로덕션 배포 전략
- 엔터프라이즈 보안 패턴
- 모니터링 및 비용 최적화

#### 학습 자료
- **🏭 프로덕션**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - 엔터프라이즈 패턴
- **📝 예제**: [Microservices Example](../../examples/microservices) - 복잡한 아키텍처
- **📊 모니터링**: Application Insights 통합

#### 실습 과제
- 엔터프라이즈 보안 패턴 구현
- 종합적인 모니터링 설정
- 적절한 거버넌스를 통해 프로덕션 배포

**💡 챕터 결과**: 완전한 프로덕션 기능을 갖춘 엔터프라이즈 애플리케이션 배포

---

## 🎓 워크숍 개요: 실습 학습 경험

### 인터랙티브 워크숍 자료
**브라우저 기반 도구와 가이드 실습을 통한 포괄적인 실습 학습**

워크숍 자료는 위 챕터 기반 커리큘럼을 보완하는 구조화된 인터랙티브 학습 경험을 제공합니다. 워크숍은 자율 학습과 강사 주도 세션 모두에 적합하게 설계되었습니다.

#### 🛠️ 워크숍 특징
- **브라우저 기반 인터페이스**: 검색, 복사, 테마 기능을 갖춘 MkDocs 기반 워크숍
- **GitHub Codespaces 통합**: 원클릭 개발 환경 설정
- **구조화된 학습 경로**: 7단계 가이드 실습 (총 3.5시간)
- **탐색 → 배포 → 맞춤화**: 점진적 방법론
- **인터랙티브 DevContainer 환경**: 사전 구성된 도구 및 종속성

#### 📚 워크숍 구조
워크숍은 **탐색 → 배포 → 맞춤화** 방법론을 따릅니다:

1. **탐색 단계** (45분)
   - Azure AI Foundry 템플릿 및 서비스 탐색
   - 멀티 에이전트 아키텍처 패턴 이해
   - 배포 요구사항 및 사전 조건 검토

2. **배포 단계** (2시간)
   - AZD를 사용한 AI 애플리케이션의 실습 배포
   - Azure AI 서비스 및 엔드포인트 구성
   - 보안 및 인증 패턴 구현

3. **맞춤화 단계** (45분)
   - 특정 사용 사례에 맞게 애플리케이션 수정
   - 프로덕션 배포를 위한 최적화
   - 모니터링 및 비용 관리 구현

#### 🚀 워크숍 시작하기
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 워크숍 학습 결과
워크숍을 완료하면 참가자는 다음을 수행할 수 있습니다:
- **프로덕션 AI 애플리케이션 배포**: AZD와 Azure AI Foundry 서비스를 사용
- **멀티 에이전트 아키텍처 숙달**: 협력 AI 에이전트 솔루션 구현
- **보안 모범 사례 구현**: 인증 및 액세스 제어 구성
- **확장 최적화**: 비용 효율적이고 성능이 뛰어난 배포 설계
- **배포 문제 해결**: 일반적인 문제를 독립적으로 해결

#### 📖 워크숍 자료
- **🎥 인터랙티브 가이드**: [Workshop Materials](workshop/README.md) - 브라우저 기반 학습 환경
- **📋 단계별 지침**: [Guided Exercises](../../workshop/docs/instructions) - 상세한 워크스루
- **🛠️ AI 워크숍 랩**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI 중심 실습
- **💡 빠른 시작**: [Workshop Setup Guide](workshop/README.md#quick-start) - 환경 구성

**적합 대상**: 기업 교육, 대학 과정, 자율 학습, 개발자 부트캠프

---

## 📖 Azure Developer CLI란?

Azure Developer CLI (azd)는 애플리케이션을 Azure에 빌드하고 배포하는 과정을 가속화하는 개발자 중심 명령줄 인터페이스입니다. 주요 기능은 다음과 같습니다:

- **템플릿 기반 배포** - 일반적인 애플리케이션 패턴을 위한 사전 제작된 템플릿 사용
- **코드로서의 인프라** - Bicep 또는 Terraform을 사용하여 Azure 리소스 관리  
- **통합 워크플로** - 애플리케이션을 원활하게 프로비저닝, 배포 및 모니터링
- **개발자 친화적** - 개발자 생산성과 경험을 최적화

### **AZD + Azure AI Foundry: AI 배포에 최적화**

**AI 솔루션에 AZD를 사용하는 이유?** AZD는 AI 개발자가 직면하는 주요 과제를 해결합니다:

- **AI 준비 템플릿** - Azure OpenAI, Cognitive Services, ML 워크로드를 위한 사전 구성된 템플릿
- **보안 AI 배포** - AI 서비스, API 키, 모델 엔드포인트를 위한 내장 보안 패턴  
- **프로덕션 AI 패턴** - 확장 가능하고 비용 효율적인 AI 애플리케이션 배포를 위한 모범 사례
- **엔드 투 엔드 AI 워크플로** - 모델 개발부터 적절한 모니터링을 갖춘 프로덕션 배포까지
- **비용 최적화** - AI 워크로드를 위한 스마트 리소스 할당 및 확장 전략
- **Azure AI Foundry 통합** - AI Foundry 모델 카탈로그 및 엔드포인트와의 원활한 연결

---

## 🎯 템플릿 및 예제 라이브러리

### 추천: Azure AI Foundry 템플릿
**AI 애플리케이션을 배포하려면 여기서 시작하세요!**

| 템플릿 | 챕터 | 복잡도 | 서비스 |
|----------|---------|------------|----------|
| [**AI 채팅 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 챕터 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI 에이전트 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 챕터 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**멀티 에이전트 워크플로 자동화**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 챕터 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**데이터에서 문서 생성**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 챕터 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**클라이언트 미팅 개선**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 챕터 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**코드 현대화**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 챕터 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**대화형 에이전트 구축**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 챕터 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**대화 데이터에서 인사이트 도출**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 챕터 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**멀티모달 콘텐츠 처리**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 챕터 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### 추천: 완전한 학습 시나리오
**학습 챕터에 매핑된 프로덕션 준비 애플리케이션 템플릿**

| 템플릿 | 학습 챕터 | 복잡도 | 주요 학습 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 챕터 2 | ⭐ | 기본 AI 배포 패턴 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 챕터 2 | ⭐⭐ | Azure AI Search를 활용한 RAG 구현 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 챕터 4 | ⭐⭐ | 문서 인텔리전스 통합 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 챕터 5 | ⭐⭐⭐ | 에이전트 프레임워크 및 함수 호출 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 챕터 8 | ⭐⭐⭐ | 엔터프라이즈 AI 오케스트레이션 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 챕터 5 | ⭐⭐⭐⭐ | 고객 및 재고 에이전트를 포함한 멀티 에이전트 아키텍처 |

### 예제 유형별 학습

#### 간단한 애플리케이션 (챕터 1-2)
- [Simple Web App](../../examples/simple-web-app) - 기본 배포 패턴
- [Static Website](../../examples/static-site) - 정적 콘텐츠 배포
- [Basic API](../../examples/basic-api) - REST API 배포

#### 데이터베이스 통합 (챕터 3-4)  
- [Database App](../../examples/database-app) - 데이터베이스 연결 패턴
- [Data Processing](../../examples/data-processing) - ETL 워크플로 배포

#### 고급 패턴 (챕터 4-8)
- [Container Apps](../../examples/container-app) - 컨테이너화된 배포
- [Microservices](../../examples/microservices) - 멀티 서비스 아키텍처  
- [Enterprise Solutions](../../examples/enterprise) - 프로덕션 준비 패턴

### 외부 템플릿 컬렉션
- [**공식 AZD 템플릿 갤러리**](https://azure.github.io/awesome-azd/) - 공식 및 커뮤니티 템플릿의 큐레이션된 컬렉션
- [**Azure Developer CLI 템플릿**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 템플릿 문서
- [**예제 디렉토리**](examples/README.md) - 상세 설명이 포함된 로컬 학습 예제

---

## 📚 학습 자료 및 참고 문헌

### 빠른 참고 자료
- [**명령어 치트 시트**](resources/cheat-sheet.md) - 챕터별 필수 azd 명령어 정리
- [**용어집**](resources/glossary.md) - Azure 및 azd 용어
- [**FAQ**](resources/faq.md) - 학습 챕터별 자주 묻는 질문
- [**학습 가이드**](resources/study-guide.md) - 포괄적인 실습 과제

### 실습 워크숍
- [**AI 워크숍 랩**](docs/ai-foundry/ai-workshop-lab.md) - AI 솔루션을 AZD로 배포 가능하게 만들기 (2-3시간)
- [**인터랙티브 워크숍 가이드**](workshop/README.md) - MkDocs 및 DevContainer 환경을 활용한 브라우저 기반 워크숍
- [**구조화된 학습 경로**](../../workshop/docs/instructions) - 7단계 가이드 실습 (탐색 → 배포 → 맞춤화)
- [**AZD 초보자 워크숍**](workshop/README.md) - GitHub Codespaces 통합을 포함한 완전한 실습 워크숍 자료

### 외부 학습 자료
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 과정 완료 및 인증

### 학습 진행 상황 추적
각 챕터를 통해 학습 진행 상황을 추적하세요:

- [ ] **챕터 1**: 기초 및 빠른 시작 ✅
- [ ] **챕터 2**: AI 우선 개발 ✅  
- [ ] **챕터 3**: 구성 및 인증 ✅
- [ ] **챕터 4**: 코드로서의 인프라 및 배포 ✅
- [ ] **챕터 5**: 멀티 에이전트 AI 솔루션 ✅
- [ ] **챕터 6**: 사전 배포 검증 및 계획 ✅
- [ ] **챕터 7**: 문제 해결 및 디버깅 ✅
- [ ] **챕터 8**: 프로덕션 및 엔터프라이즈 패턴 ✅

### 학습 검증
각 챕터를 완료한 후, 다음을 통해 지식을 확인하세요:
1. **실습 과제**: 챕터의 실습 배포 완료
2. **지식 점검**: 해당 챕터의 FAQ 섹션 검토
3. **커뮤니티 토론**: Azure Discord에서 경험 공유
4. **다음 챕터**: 다음 복잡도 수준으로 이동

### 과정 완료 혜택
모든 챕터를 완료하면 다음을 얻을 수 있습니다:
- **프로덕션 경험**: 실제 AI 애플리케이션을 Azure에 배포
- **전문 기술**: 엔터프라이즈 준비 배포 역량  
- **커뮤니티 인정**: Azure 개발자 커뮤니티의 적극적인 멤버
- **경력 발전**: AZD 및 AI 배포 전문 지식

---

## 🤝 커뮤니티 및 지원

### 도움 및 지원 받기
- **기술 문제**: [버그 신고 및 기능 요청](https://github.com/microsoft/azd-for-beginners/issues)
- **학습 질문**: [Microsoft Azure Discord 커뮤니티](https://discord.gg/microsoft-azure)
- **AI 관련 도움**: AZD + AI Foundry 논의를 위한 [#Azure 채널](https://discord.gg/microsoft-azure) 참여
- **문서**: [공식 Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord 커뮤니티 인사이트

**#Azure 채널의 최근 설문조사 결과:**
- **45%**의 개발자가 AI 워크로드에 AZD를 사용하고 싶어함
- **주요 과제**: 멀티 서비스 배포, 자격 증명 관리, 프로덕션 준비  
- **가장 요청된 항목**: AI 전용 템플릿, 문제 해결 가이드, 모범 사례

**커뮤니티에 참여하여:**
- AZD + AI 경험을 공유하고 도움 받기
- 새로운 AI 템플릿의 초기 미리보기 액세스
- AI 배포 모범 사례 기여
- 향후 AI + AZD 기능 개발에 영향 미치기

### 과정에 기여하기
기여를 환영합니다! [Contributing Guide](CONTRIBUTING.md)를 읽고 다음에 대해 자세히 알아보세요:
- **콘텐츠 개선**: 기존 챕터 및 예제 향상
- **새로운 예제**: 실제 사례와 템플릿 추가  
- **번역**: 다국어 지원 유지에 도움  
- **버그 보고**: 정확성과 명확성 개선  
- **커뮤니티 표준**: 포괄적인 커뮤니티 가이드라인 준수  

---

## 📄 코스 정보

### 라이선스
이 프로젝트는 MIT 라이선스에 따라 제공됩니다 - 자세한 내용은 [LICENSE](../../LICENSE) 파일을 참조하세요.

### 관련 Microsoft 학습 자료

우리 팀은 다른 포괄적인 학습 코스를 제작합니다:

- [초보자를 위한 모델 컨텍스트 프로토콜 (MCP)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 AI 에이전트](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [.NET을 사용한 초보자를 위한 생성 AI](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 생성 AI](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Java를 사용한 초보자를 위한 생성 AI](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 머신러닝](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 데이터 과학](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 AI](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 사이버 보안](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [초보자를 위한 웹 개발](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 IoT](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [초보자를 위한 XR 개발](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI 페어드 프로그래밍을 위한 GitHub Copilot 마스터하기](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [C#/.NET 개발자를 위한 GitHub Copilot 마스터하기](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot 모험 선택하기](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ 코스 네비게이션

**🚀 학습을 시작할 준비가 되셨나요?**

**초보자**: [1장: 기초 및 빠른 시작](../..)부터 시작하세요  
**AI 개발자**: [2장: AI-우선 개발](../..)로 바로 이동하세요  
**경험 많은 개발자**: [3장: 구성 및 인증](../..)부터 시작하세요

**다음 단계**: [1장 시작하기 - AZD 기본](docs/getting-started/azd-basics.md) →

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어를 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임지지 않습니다.