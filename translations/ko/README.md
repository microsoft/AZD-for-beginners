# AZD 초보자 가이드: 체계적인 학습 여정

![AZD-for-beginners](../../translated_images/ko/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 자동 번역 (항상 최신 상태 유지)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](./README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **로컬로 클론하는 걸 선호하시나요?**
>
> 이 저장소는 50개 이상의 언어로 번역본을 포함하고 있어 다운로드 크기가 크게 증가합니다. 번역 없이 클론하려면 스패스 체크아웃을 사용하세요:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> 이렇게 하면 훨씬 빠른 다운로드로 코스를 완료하는 데 필요한 모든 것을 받을 수 있습니다.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI(azd)란?

**Azure Developer CLI(azd)**는 개발자 친화적인 명령줄 도구로, Azure에 애플리케이션을 쉽게 배포할 수 있도록 합니다. 수십 개의 Azure 리소스를 수동으로 만들고 연결하는 대신, 단일 명령으로 전체 애플리케이션을 배포할 수 있습니다.

### `azd up`의 마법

```bash
# 이 단일 명령으로 모든 작업을 수행합니다:
# ✅ 모든 Azure 리소스를 생성합니다
# ✅ 네트워킹 및 보안을 구성합니다
# ✅ 애플리케이션 코드를 빌드합니다
# ✅ Azure에 배포합니다
# ✅ 작동하는 URL을 제공합니다
azd up
```

**이게 전부입니다!** Azure 포털 클릭 불필요, 복잡한 ARM 템플릿 학습 필요 없음, 수동 구성도 필요 없이 Azure에서 바로 작동하는 애플리케이션을 얻을 수 있습니다.

---

## ❓ Azure Developer CLI와 Azure CLI: 차이점은?

초보자가 가장 자주 묻는 질문입니다. 간단한 답변은 다음과 같습니다:

| 기능 | **Azure CLI(`az`)** | **Azure Developer CLI(`azd`)** |
|---------|---------------------|--------------------------------|
| **목적** | 개별 Azure 리소스 관리 | 완전한 애플리케이션 배포 |
| **관점** | 인프라 중심 | 애플리케이션 중심 |
| **예시** | `az webapp create --name myapp...` | `azd up` |
| **학습 난이도** | Azure 서비스에 대한 이해 필요 | 앱만 알면 됨 |
| **적합 대상** | DevOps, 인프라 | 개발자, 프로토타이핑 |

### 간단한 비유

- **Azure CLI**는 집을 짓기 위한 모든 도구(망치, 톱, 못 등)를 갖춘 것과 같아서 무엇이든 지을 수 있지만 건설 방법을 알아야 합니다.
- **Azure Developer CLI**는 계약자를 고용하는 것과 같아서 원하는 것을 말하면 건축을 알아서 처리해줍니다.

### 언제 각각을 사용할까?

| 상황 | 사용할 도구 |
|----------|----------|
| "내 웹 앱을 빨리 배포하고 싶다" | `azd up` |
| "스토리지 계정만 만들고 싶다" | `az storage account create` |
| "전체 AI 애플리케이션을 구축 중이다" | `azd init --template azure-search-openai-demo` |
| "특정 Azure 리소스를 디버깅해야 한다" | `az resource show` |
| "분 단위로 프로덕션 배포를 하고 싶다" | `azd up --environment production` |

### 둘은 함께 작동합니다!

AZD는 내부적으로 Azure CLI를 사용합니다. 두 도구를 모두 사용할 수 있습니다:
```bash
# AZD로 앱을 배포하세요
azd up

# 그런 다음 Azure CLI로 특정 리소스를 미세 조정하세요
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD에서 템플릿 찾기

처음부터 시작하지 마세요! **Awesome AZD**는 바로 배포 가능한 커뮤니티 템플릿 모음입니다:

| 리소스 | 설명 |
|----------|-------------|
| 🔗 [**Awesome AZD 갤러리**](https://azure.github.io/awesome-azd/) | 원클릭 배포가 가능한 200개 이상의 템플릿 브라우징 |
| 🔗 [**템플릿 제출하기**](https://github.com/Azure/awesome-azd/issues) | 본인의 템플릿을 커뮤니티에 기여 |
| 🔗 [**GitHub 저장소**](https://github.com/Azure/awesome-azd) | 소스를 확인하고 스타 표시하기 |

### Awesome AZD에서 인기 있는 AI 템플릿

```bash
# Azure OpenAI + AI Search를 이용한 RAG 채팅
azd init --template azure-search-openai-demo

# 빠른 AI 채팅 애플리케이션
azd init --template openai-chat-app-quickstart

# Foundry Agents를 사용하는 AI 에이전트
azd init --template get-started-with-ai-agents
```

---

## 🎯 3단계로 시작하기

### 1단계: AZD 설치 (2분)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### 2단계: Azure 로그인

```bash
azd auth login
```

### 3단계: 첫 번째 앱 배포

```bash
# 템플릿에서 초기화
azd init --template todo-nodejs-mongo

# Azure에 배포(모든 것을 생성합니다!)
azd up
```

**🎉 완료!** 이제 애플리케이션이 Azure에서 실시간으로 운영됩니다.

### 정리하기 (잊지 마세요!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 이 코스 사용법

이 코스는 **점진적인 학습**을 위해 설계되었습니다. 편한 난이도에서 시작해 점차 실력을 키워보세요:

| 경험 수준 | 시작 위치 |
|-----------------|------------|
| **Azure 초보자** | [1장: 기초](../..) |
| **Azure는 알지만 AZD는 처음인 경우** | [1장: 기초](../..) |
| **AI 앱 배포에 관심 있는 경우** | [2장: AI 우선 개발](../..) |
| **실습 위주 학습 원할 때** | [🎓 인터랙티브 워크숍](workshop/README.md) - 3~4시간 가이드 랩 |
| **프로덕션 패턴이 필요할 때** | [8장: 프로덕션 및 엔터프라이즈](../..) |

### 빠른 세팅

1. **이 저장소 포크하기**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **클론하기**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **도움 받기**: [Azure Discord 커뮤니티](https://discord.com/invite/ByRwuEEgH4)

> **로컬로 클론하는 걸 선호하시나요?**

> 이 저장소는 50개 이상의 언어 번역본을 포함하여 다운로드 크기를 많이 증가시킵니다. 번역 없이 클론하려면 스패스 체크아웃을 사용하세요:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 이렇게 하면 더 빠르게 다운로드하고 코스를 완료하는 데 필요한 모든 것을 받을 수 있습니다.

## 코스 개요

점진적인 단계의 챕터로 Azure Developer CLI(azd)를 마스터하세요. **특히 Microsoft Foundry 통합을 통한 AI 애플리케이션 배포에 중점.**

### 이 코스가 현대 개발자에게 필수인 이유

Microsoft Foundry Discord 커뮤니티 인사이트를 기반으로, **45%의 개발자가 AI 워크로드를 위해 AZD를 사용하고 싶어하지만 다음과 같은 어려움을 겪고 있습니다:**
- 복잡한 다중 서비스 AI 아키텍처
- 프로덕션 AI 배포 모범 사례
- Azure AI 서비스 통합 및 구성
- AI 워크로드 비용 최적화
- AI 특화 배포 문제 해결

### 학습 목표

이 체계적인 코스를 완료하면 다음을 달성할 수 있습니다:
- **AZD 기본기 숙달**: 핵심 개념, 설치 및 구성
- **AI 애플리케이션 배포**: AZD와 Microsoft Foundry 서비스 활용
- **코드형 인프라 구현**: Bicep 템플릿으로 Azure 리소스 관리
- **배포 문제 해결**: 일반 이슈 해결 및 디버깅
- **프로덕션 최적화**: 보안, 확장, 모니터링 및 비용 관리
- **멀티 에이전트 솔루션 구축**: 복잡한 AI 아키텍처 배포

## 🗺️ 코스 맵: 장별 빠른 네비게이션

각 장은 학습 목표, 빠른 시작, 실습을 포함한 README가 별도로 제공됩니다:

| 장 | 주제 | 수업 내용 | 소요 시간 | 난이도 |
|---------|-------|---------|----------|------------|
| **[1장: 기초](docs/chapter-01-foundation/README.md)** | 시작하기 | [AZD 기초](docs/chapter-01-foundation/azd-basics.md) &#124; [설치](docs/chapter-01-foundation/installation.md) &#124; [첫 프로젝트](docs/chapter-01-foundation/first-project.md) | 30-45 분 | ⭐ |
| **[2장: AI 개발](docs/chapter-02-ai-development/README.md)** | AI 우선 앱 | [Foundry 통합](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 에이전트](docs/chapter-02-ai-development/agents.md) &#124; [모델 배포](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [워크숍](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 시간 | ⭐⭐ |
| **[3장: 구성](docs/chapter-03-configuration/README.md)** | 인증 및 보안 | [구성](docs/chapter-03-configuration/configuration.md) &#124; [인증 및 보안](docs/chapter-03-configuration/authsecurity.md) | 45-60 분 | ⭐⭐ |
| **[4장: 인프라](docs/chapter-04-infrastructure/README.md)** | IaC 및 배포 | [배포 가이드](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [프로비저닝](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5시간 | ⭐⭐⭐ |
| **[5장: 멀티 에이전트](docs/chapter-05-multi-agent/README.md)** | AI 에이전트 솔루션 | [리테일 시나리오](examples/retail-scenario.md) &#124; [조정 패턴](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3시간 | ⭐⭐⭐⭐ |
| **[6장: 사전 배포](docs/chapter-06-pre-deployment/README.md)** | 계획 및 검증 | [사전 점검](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [용량 계획](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 선택](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [앱 인사이트](docs/chapter-06-pre-deployment/application-insights.md) | 1시간 | ⭐⭐ |
| **[7장: 문제 해결](docs/chapter-07-troubleshooting/README.md)** | 디버그 및 수정 | [일반 문제](docs/chapter-07-troubleshooting/common-issues.md) &#124; [디버깅](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 문제](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5시간 | ⭐⭐ |
| **[8장: 프로덕션](docs/chapter-08-production/README.md)** | 엔터프라이즈 패턴 | [프로덕션 실무](docs/chapter-08-production/production-ai-practices.md) | 2-3시간 | ⭐⭐⭐⭐ |
| **[🎓 워크숍](workshop/README.md)** | 실습 랩 | [소개](workshop/docs/instructions/0-Introduction.md) &#124; [선택](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [검증](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [분해](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [구성](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [커스터마이징](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [해체](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [마무리](workshop/docs/instructions/7-Wrap-up.md) | 3-4시간 | ⭐⭐ |

**총 과정 소요 시간:** 약 10-14시간 | **기술 수준 향상:** 초급 → 프로덕션 준비

---

## 📚 학습 장

*경험 수준과 목표에 따라 학습 경로를 선택하세요*

### 🚀 1장: 기초 및 빠른 시작  
**사전 지식**: Azure 구독, 기본 명령줄 지식  
**소요 시간**: 30-45분  
**난이도**: ⭐

#### 학습 내용
- Azure Developer CLI 기본 이해
- 플랫폼별 AZD 설치
- 첫 성공 배포

#### 학습 자료
- **🎯 시작하기**: [Azure Developer CLI란?](../..)
- **📖 이론**: [AZD 기본](docs/chapter-01-foundation/azd-basics.md) - 핵심 개념과 용어
- **⚙️ 설정**: [설치 및 설정](docs/chapter-01-foundation/installation.md) - 플랫폼 가이드
- **🛠️ 실습**: [첫 프로젝트](docs/chapter-01-foundation/first-project.md) - 단계별 튜토리얼
- **📋 빠른 참조**: [명령어 요약집](resources/cheat-sheet.md)

#### 실습 과제
```bash
# 빠른 설치 확인
azd version

# 첫 번째 애플리케이션 배포
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 장 결과**: AZD를 이용해 Azure에 간단한 웹앱 성공적으로 배포

**✅ 성공 기준:**  
```bash
# 1장을 완료한 후, 다음을 할 수 있어야 합니다:
azd version              # 설치된 버전 표시
azd init --template todo-nodejs-mongo  # 프로젝트 초기화
azd up                  # Azure에 배포
azd show                # 실행 중인 앱 URL 표시
# 애플리케이션이 브라우저에서 열리고 작동함
azd down --force --purge  # 리소스 정리
```
  
**📊 예상 소요 시간:** 30-45분  
**📈 습득 기술 수준:** 기본 앱을 독립적으로 배포 가능

**✅ 성공 기준:**  
```bash
# 1장을 완료하면 다음을 할 수 있어야 합니다:
azd version              # 설치된 버전을 보여줍니다
azd init --template todo-nodejs-mongo  # 프로젝트를 초기화합니다
azd up                  # Azure에 배포합니다
azd show                # 실행 중인 앱의 URL을 표시합니다
# 애플리케이션이 브라우저에서 열리고 작동합니다
azd down --force --purge  # 리소스를 정리합니다
```
  
**📊 예상 소요 시간:** 30-45분  
**📈 습득 기술 수준:** 기본 앱을 독립적으로 배포 가능

---

### 🤖 2장: AI 퍼스트 개발 (AI 개발자 권장)  
**사전 지식**: 1장 완료  
**소요 시간**: 1-2시간  
**난이도**: ⭐⭐

#### 학습 내용
- Microsoft Foundry와 AZD 통합
- AI 기반 애플리케이션 배포
- AI 서비스 구성 이해

#### 학습 자료
- **🎯 시작하기**: [Microsoft Foundry 통합](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 에이전트**: [AI 에이전트 가이드](docs/chapter-02-ai-development/agents.md) - AZD로 지능형 에이전트 배포
- **📖 패턴**: [AI 모델 배포](docs/chapter-02-ai-development/ai-model-deployment.md) - AI 모델 관리와 배포
- **🛠️ 워크숍**: [AI 워크숍 랩](docs/chapter-02-ai-development/ai-workshop-lab.md) - AZD 준비형 AI 솔루션 제작
- **🎥 인터랙티브 가이드**: [워크숍 자료](workshop/README.md) - MkDocs 및 DevContainer 환경 기반 학습
- **📋 템플릿**: [Microsoft Foundry 템플릿](../..)
- **📝 예제**: [AZD 배포 예제](examples/README.md)

#### 실습 과제
```bash
# 첫 AI 애플리케이션 배포하기
azd init --template azure-search-openai-demo
azd up

# 추가 AI 템플릿 시도하기
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 장 결과**: RAG 기능을 갖춘 AI 채팅 앱 배포 및 구성

**✅ 성공 기준:**  
```bash
# 2장 이후에, 당신은 할 수 있어야 합니다:
azd init --template azure-search-openai-demo
azd up
# AI 채팅 인터페이스 테스트하기
# 질문을 하고 출처가 있는 AI 기반 응답 받기
# 검색 통합이 작동하는지 확인하기
azd monitor  # 애플리케이션 인사이트에서 텔레메트리를 확인하기
azd down --force --purge
```
  
**📊 예상 소요 시간:** 1-2시간  
**📈 습득 기술 수준:** 생산 환경 수준의 AI 앱 배포 및 구성 가능  
**💰 비용 인지:** 개발 비용 $80-150/월, 프로덕션 비용 $300-3500/월 이해

#### 💰 AI 배포 비용 고려사항

**개발 환경 (예상 $80-150/월):**  
- Azure OpenAI (사용량 기반): $0-50/월 (토큰 사용량 기준)  
- AI 검색 (기본 등급): $75/월  
- 컨테이너 앱 (컨슈밍): $0-20/월  
- 스토리지 (표준): $1-5/월

**프로덕션 환경 (예상 $300-3,500+/월):**  
- Azure OpenAI (PTU 안정 성능): $3,000+/월 또는 고용량 사용 기반 과금  
- AI 검색 (표준 등급): $250/월  
- 컨테이너 앱 (전용): $50-100/월  
- 애플리케이션 인사이트: $5-50/월  
- 스토리지 (프리미엄): $10-50/월

**💡 비용 최적화 팁:**  
- 학습용 무료 계층 Azure OpenAI 사용 (월 50,000 토큰 포함)  
- 개발 중 아닐 때는 `azd down` 으로 리소스 할당 해제  
- 기본은 사용량 기반 과금, 프로덕션은 PTU로 업그레이드  
- 배포 전 비용 추정 위해 `azd provision --preview` 사용  
- 자동 스케일링 활성화로 실제 사용량만큼만 비용 지불

**비용 모니터링:**  
```bash
# 예상 월간 비용 확인
azd provision --preview

# Azure 포털에서 실제 비용 모니터링
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ 3장: 구성 및 인증  
**사전 지식**: 1장 완료  
**소요 시간**: 45-60분  
**난이도**: ⭐⭐

#### 학습 내용
- 환경 구성 및 관리
- 인증 및 보안 모범 사례
- 리소스 명명 및 조직화

#### 학습 자료
- **📖 구성**: [구성 가이드](docs/chapter-03-configuration/configuration.md) - 환경 설정  
- **🔐 보안**: [인증 패턴과 관리 ID](docs/chapter-03-configuration/authsecurity.md) - 인증 패턴  
- **📝 예제**: [데이터베이스 앱 예제](examples/database-app/README.md) - AZD 데이터베이스 예제

#### 실습 과제
- 개발, 스테이징, 프로덕션 다중 환경 구성  
- 관리형 ID 인증 설정  
- 환경별 구성 적용

**💡 장 결과**: 적절한 인증과 보안을 갖춘 다중 환경 관리

---

### 🏗️ 4장: 코드형 인프라 및 배포  
**사전 지식**: 1~3장 완료  
**소요 시간**: 1-1.5시간  
**난이도**: ⭐⭐⭐

#### 학습 내용
- 고급 배포 패턴  
- Bicep을 이용한 코드형 인프라  
- 리소스 프로비저닝 전략

#### 학습 자료
- **📖 배포**: [배포 가이드](docs/chapter-04-infrastructure/deployment-guide.md) - 완전한 워크플로우  
- **🏗️ 프로비저닝**: [리소스 프로비저닝](docs/chapter-04-infrastructure/provisioning.md) - Azure 리소스 관리  
- **📝 예제**: [컨테이너 앱 예제](../../examples/container-app) - 컨테이너 기반 배포

#### 실습 과제
- 맞춤 Bicep 템플릿 작성  
- 다중 서비스 앱 배포  
- 블루-그린 배포 전략 구현

**💡 장 결과**: 맞춤 인프라 템플릿으로 복잡한 다중 서비스 앱 배포

---

### 🎯 5장: 멀티 에이전트 AI 솔루션 (고급)  
**사전 지식**: 1~2장 완료  
**소요 시간**: 2-3시간  
**난이도**: ⭐⭐⭐⭐

#### 학습 내용
- 멀티 에이전트 아키텍처 패턴  
- 에이전트 조율 및 조정  
- 프로덕션급 AI 배포

#### 학습 자료
- **🤖 주요 프로젝트**: [리테일 멀티 에이전트 솔루션](examples/retail-scenario.md) - 완성된 구현  
- **🛠️ ARM 템플릿**: [ARM 템플릿 패키지](../../examples/retail-multiagent-arm-template) - 원클릭 배포  
- **📖 아키텍처**: [멀티 에이전트 조율 패턴](docs/chapter-06-pre-deployment/coordination-patterns.md)

#### 실습 과제
```bash
# 완전한 소매용 다중 에이전트 솔루션 배포하기
cd examples/retail-multiagent-arm-template
./deploy.sh

# 에이전트 구성 탐색하기
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 장 결과**: 고객 및 재고 에이전트가 포함된 프로덕션급 멀티 에이전트 AI 솔루션 배포 및 관리

---

### 🔍 6장: 사전 배포 검증 및 계획  
**사전 지식**: 4장 완료  
**소요 시간**: 1시간  
**난이도**: ⭐⭐

#### 학습 내용
- 용량 계획 및 리소스 검증  
- SKU 선택 전략  
- 사전 점검 및 자동화

#### 학습 자료
- **📊 계획**: [용량 계획](docs/chapter-06-pre-deployment/capacity-planning.md) - 리소스 검증  
- **💰 선택**: [SKU 선택](docs/chapter-06-pre-deployment/sku-selection.md) - 비용 효율적 선택  
- **✅ 검증**: [사전 점검](docs/chapter-06-pre-deployment/preflight-checks.md) - 자동화 스크립트

#### 실습 과제
- 용량 검증 스크립트 실행  
- 비용 최적화 용 SKU 선택  
- 사전 배포 자동 점검 구현

**💡 장 결과**: 배포 전 검증 및 최적화 수행

---

### 🚨 7장: 문제 해결 및 디버깅  
**사전 지식**: 어떤 배포 장이라도 완료  
**소요 시간**: 1-1.5시간  
**난이도**: ⭐⭐

#### 학습 내용
- 체계적 디버깅 방법  
- 일반적인 문제 및 해결책  
- AI 관련 문제 해결

#### 학습 자료
- **🔧 일반 문제**: [일반 문제](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 및 해결책  
- **🕵️ 디버깅**: [디버깅 가이드](docs/chapter-07-troubleshooting/debugging.md) - 단계별 전략  
- **🤖 AI 문제**: [AI 전용 문제 해결](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 서비스 문제

#### 실습 과제
- 배포 실패 진단  
- 인증 문제 해결  
- AI 서비스 연결 문제 디버그

**💡 장 결과**: 일반 배포 문제를 독립적으로 진단하고 해결 가능

---

### 🏢 8장: 프로덕션 및 엔터프라이즈 패턴  
**사전 지식**: 1~4장 완료  
**소요 시간**: 2-3시간  
**난이도**: ⭐⭐⭐⭐

#### 학습 내용
- 프로덕션 배포 전략  
- 엔터프라이즈 보안 패턴  
- 모니터링 및 비용 최적화

#### 학습 자료
- **🏭 프로덕션**: [프로덕션 AI 모범 사례](docs/chapter-08-production/production-ai-practices.md) - 엔터프라이즈 패턴  
- **📝 예제**: [마이크로서비스 예제](../../examples/microservices) - 복잡한 아키텍처  
- **📊 모니터링**: [앱 인사이트 통합](docs/chapter-06-pre-deployment/application-insights.md) - 모니터링

#### 실습 과제
- 엔터프라이즈 보안 패턴 적용  
- 종합 모니터링 구축  
- 거버넌스가 포함된 프로덕션 배포

**💡 장 결과**: 완전한 프로덕션 역량을 갖춘 엔터프라이즈 앱 배포

---

## 🎓 워크숍 개요: 실습 중심 학습 경험

> **⚠️ 워크숍 상태: 개발 중**  

> 워크숍 자료는 현재 개발 및 개선 중입니다. 핵심 모듈은 작동하지만 일부 고급 섹션은 완성되지 않았습니다. 모든 콘텐츠를 완성하기 위해 적극적으로 작업 중입니다. [진행 상황 추적 →](workshop/README.md)

### 인터랙티브 워크숍 자료
**브라우저 기반 도구와 가이드 실습으로 구성된 종합 실습 학습**

우리의 워크숍 자료는 위의 장별 커리큘럼을 보완하는 구조화되고 상호작용적인 학습 경험을 제공합니다. 워크숍은 자기 주도 학습과 강사 주도 세션 모두에 적합하게 설계되었습니다.

#### 🛠️ 워크숍 특징
- **브라우저 기반 인터페이스**: 검색, 복사, 테마 기능을 갖춘 MkDocs 기반 워크숍 완성
- **GitHub Codespaces 통합**: 원클릭 개발 환경 설정
- **구조화된 학습 경로**: 8개 모듈 가이드 실습 (총 3~4시간)
- **점진적 방법론**: 도입 → 선택 → 검증 → 분해 → 구성 → 맞춤화 → 정리 → 마무리
- **인터랙티브 DevContainer 환경**: 사전 구성된 도구와 종속성

#### 📚 워크숍 모듈 구조
워크숍은 **8개 모듈의 점진적 방법론**을 따라 탐색에서부터 배포 마스터까지 안내합니다:

| 모듈 | 주제 | 수행 내용 | 소요 시간 |
|--------|-------|----------------|----------|
| **0. 도입** | 워크숍 개요 | 학습 목표, 전제 조건, 워크숍 구조 이해 | 15분 |
| **1. 선택** | 템플릿 탐색 | AZD 템플릿 조사 및 시나리오에 맞는 AI 템플릿 선택 | 20분 |
| **2. 검증** | 배포 및 확인 | `azd up`으로 템플릿 배포 및 인프라 검증 | 30분 |
| **3. 분해** | 구조 이해 | GitHub Copilot을 사용해 템플릿 아키텍처, Bicep 파일, 코드 구조 탐색 | 30분 |
| **4. 구성** | azure.yaml 심층 분석 | `azure.yaml` 구성, 라이프사이클 후크, 환경 변수 숙달 | 30분 |
| **5. 맞춤화** | 나만의 템플릿 만들기 | AI 검색, 추적, 평가 활성화 및 시나리오에 맞게 커스터마이즈 | 45분 |
| **6. 정리** | 정리 작업 | `azd down --purge`로 리소스 안전하게 정리 | 15분 |
| **7. 마무리** | 다음 단계 | 성과, 핵심 개념 검토 및 학습 여정 지속 | 15분 |

**워크숍 진행 흐름:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 워크숍 시작하기
```bash
# 옵션 1: GitHub Codespaces (권장)
# 저장소에서 "Code" → "main에 codespace 생성" 클릭

# 옵션 2: 로컬 개발
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md의 설정 지침을 따르세요
```

#### 🎯 워크숍 학습 목표
워크숍 완료 시 참가자는 다음을 수행할 수 있습니다:
- **운영 AI 애플리케이션 배포**: Microsoft Foundry 서비스와 함께 AZD 사용
- **다중 에이전트 아키텍처 마스터**: 협업 AI 에이전트 솔루션 구현
- **보안 모범 사례 구현**: 인증 및 접근 제어 구성
- **규모에 최적화**: 비용 효율적이며 성능 좋은 배포 설계
- **배포 문제 해결**: 일반적인 문제 독립적 해결

#### 📖 워크숍 자료
- **🎥 인터랙티브 가이드**: [워크숍 자료](workshop/README.md) - 브라우저 기반 학습 환경
- **📋 모듈별 지침**:
  - [0. 도입](workshop/docs/instructions/0-Introduction.md) - 워크숍 개요 및 목표
  - [1. 선택](workshop/docs/instructions/1-Select-AI-Template.md) - AI 템플릿 찾기 및 선택
  - [2. 검증](workshop/docs/instructions/2-Validate-AI-Template.md) - 템플릿 배포 및 검증
  - [3. 분해](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 템플릿 아키텍처 탐색
  - [4. 구성](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml 마스터하기
  - [5. 맞춤화](workshop/docs/instructions/5-Customize-AI-Template.md) - 시나리오에 맞는 커스터마이즈
  - [6. 정리](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 리소스 정리
  - [7. 마무리](workshop/docs/instructions/7-Wrap-up.md) - 검토 및 다음 단계
- **🛠️ AI 워크숍 랩**: [AI 워크숍 랩](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 중심 실습
- **💡 빠른 시작**: [워크숍 설정 가이드](workshop/README.md#quick-start) - 환경 구성

**최적 대상**: 기업 교육, 대학 과정, 자기 주도 학습, 개발자 부트캠프.

---

## 📖 심층 탐구: AZD 기능

기본을 넘어서 AZD는 운영 배포에 강력한 기능을 제공합니다:

- **템플릿 기반 배포** - 일반 애플리케이션 패턴에 맞는 사전 구축 템플릿 사용
- **코드형 인프라** - Bicep 또는 Terraform을 활용한 Azure 자원 관리  
- **통합 워크플로우** - 손쉽게 프로비저닝, 배포, 모니터링 수행
- **개발자 친화적** - 생산성과 경험에 최적화

### **AZD + Microsoft Foundry: AI 배포에 완벽한 조합**

**AI 솔루션에 AZD를 선택하는 이유** AZD는 AI 개발자가 직면하는 주요 문제를 해결합니다:

- **AI 준비 템플릿** - Azure OpenAI, 인지 서비스, ML 워크로드에 맞는 사전 구성 템플릿
- **보안 AI 배포** - AI 서비스, API 키, 모델 엔드포인트용 내장 보안 패턴  
- **운영 AI 패턴** - 확장 가능하고 비용 효율적인 AI 앱 배포를 위한 모범 사례
- **엔드투엔드 AI 워크플로우** - 모델 개발부터 운영 배포와 적절한 모니터링까지
- **비용 최적화** - AI 워크로드를 위한 스마트 리소스 할당 및 확장 전략
- **Microsoft Foundry 통합** - Microsoft Foundry 모델 카탈로그 및 엔드포인트와 원활한 연결

---

## 🎯 템플릿 & 예제 라이브러리

### 추천: Microsoft Foundry 템플릿
**AI 애플리케이션 배포 시 여기서 시작하세요!**

> **참고:** 이 템플릿들은 다양한 AI 패턴을 보여줍니다. 일부는 외부 Azure 샘플이며, 일부는 로컬 구현입니다.

| 템플릿 | 장 | 복잡도 | 서비스 | 유형 |
|----------|---------|------------|----------|------|
| [**AI 채팅 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2장 | ⭐⭐ | AzureOpenAI + Azure AI 모델 추론 API + Azure AI 검색 + Azure 컨테이너 앱 + 애플리케이션 인사이트 | 외부 |
| [**AI 에이전트 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2장 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI 검색 + Azure 컨테이너 앱 + 애플리케이션 인사이트| 외부 |
| [**Azure 검색 + OpenAI 데모**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2장 | ⭐⭐ | AzureOpenAI + Azure AI 검색 + 앱 서비스 + 스토리지 | 외부 |
| [**OpenAI 채팅 앱 빠른 시작**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2장 | ⭐ | AzureOpenAI + 컨테이너 앱 + 애플리케이션 인사이트 | 외부 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5장 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 외부 |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | 8장 | ⭐⭐⭐⭐ | AzureOpenAI + AI 검색 + Cosmos DB + 컨테이너 앱 | 외부 |
| [**Retail 다중 에이전트 솔루션**](examples/retail-scenario.md) | 5장 | ⭐⭐⭐⭐ | AzureOpenAI + AI 검색 + 스토리지 + 컨테이너 앱 + Cosmos DB | **로컬** |

### 추천: 완성형 학습 시나리오
**운영 준비가 된 애플리케이션 템플릿과 학습 장별 매핑**

| 템플릿 | 학습 장 | 복잡도 | 주요 학습 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2장 | ⭐ | 기본 AI 배포 패턴 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2장 | ⭐⭐ | Azure AI 검색 기반 RAG 구현 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4장 | ⭐⭐ | 문서 인텔리전스 통합 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5장 | ⭐⭐⭐ | 에이전트 프레임워크 및 함수 호출 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8장 | ⭐⭐⭐ | 기업용 AI 오케스트레이션 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5장 | ⭐⭐⭐⭐ | 고객 및 재고 에이전트를 포함한 다중 에이전트 아키텍처 |

### 예제 유형별 학습

> **📌 로컬 vs. 외부 예제:**  
> **로컬 예제** (이 저장소 내) = 즉시 사용 가능  
> **외부 예제** (Azure 샘플) = 연결된 저장소에서 클론

#### 로컬 예제 (즉시 사용 가능)
- [**Retail 다중 에이전트 솔루션**](examples/retail-scenario.md) - ARM 템플릿 포함 완전한 운영 준비 구현
  - 다중 에이전트 아키텍처 (고객 + 재고 에이전트)
  - 포괄적 모니터링 및 평가
  - ARM 템플릿을 통한 원클릭 배포

#### 로컬 예제 - 컨테이너 애플리케이션 (2~5장)
**이 저장소에 있는 종합적인 컨테이너 배포 예제:**
- [**컨테이너 앱 예제**](examples/container-app/README.md) - 컨테이너화 배포 완벽 가이드
  - [간단한 Flask API](../../examples/container-app/simple-flask-api) - Scale-to-zero 기본 REST API
  - [마이크로서비스 아키텍처](../../examples/container-app/microservices) - 운영 준비 멀티 서비스 배포
  - 빠른 시작, 운영, 고급 배포 패턴
  - 모니터링, 보안 및 비용 최적화 지침

#### 외부 예제 - 간단한 애플리케이션 (1~2장)
**이 Azure 샘플 저장소를 클론하여 시작하세요:**
- [간단한 웹 앱 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 기본 배포 패턴
- [정적 웹사이트 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 정적 콘텐츠 배포
- [컨테이너 앱 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 배포

#### 외부 예제 - 데이터베이스 통합 (3~4장)  
- [데이터베이스 앱 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 데이터베이스 연결 패턴
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 서버리스 데이터 워크플로우

#### 외부 예제 - 고급 패턴 (4~8장)
- [Java 마이크로서비스](https://github.com/Azure-Samples/java-microservices-aca-lab) - 다중 서비스 아키텍처
- [컨테이너 앱 작업](https://github.com/Azure-Samples/container-apps-jobs) - 백그라운드 처리  
- [기업 ML 파이프라인](https://github.com/Azure-Samples/mlops-v2) - 운영 준비 ML 패턴

### 외부 템플릿 모음
- [**공식 AZD 템플릿 갤러리**](https://azure.github.io/awesome-azd/) - 공식 및 커뮤니티 템플릿 큐레이션
- [**Azure Developer CLI 템플릿**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 템플릿 문서
- [**예제 디렉터리**](examples/README.md) - 상세 설명이 포함된 로컬 학습 예제

---

## 📚 학습 자료 및 참고 문헌

### 빠른 참고 자료
- [**명령어 치트 시트**](resources/cheat-sheet.md) - 장별로 정리된 필수 azd 명령어
- [**용어집**](resources/glossary.md) - Azure 및 azd 용어  
- [**자주 묻는 질문**](resources/faq.md) - 학습 장별로 정리된 일반 질문
- [**학습 가이드**](resources/study-guide.md) - 종합 연습 문제

### 실습 워크숍
- [**AI 워크숍 랩**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 솔루션을 AZD로 배포 가능하게 만들기 (2~3시간)
- [**인터랙티브 워크숍**](workshop/README.md) - MkDocs 및 GitHub Codespaces를 활용한 8개 모듈 가이드 실습
  - 진행 단계: 도입 → 선택 → 검증 → 분해 → 구성 → 맞춤화 → 정리 → 마무리

### 외부 학습 자료
- [Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 가격 계산기](https://azure.microsoft.com/pricing/calculator/)
- [Azure 상태](https://status.azure.com/)

---

## 🔧 빠른 문제 해결 가이드

**초보자가 자주 겪는 문제와 즉각적인 해결책:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# 먼저 AZD를 설치하세요
# 윈도우 (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# 리눅스:
curl -fsSL https://aka.ms/install-azd.sh | bash

# 설치 확인
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" 또는 "Subscription not set"</strong></summary>

```bash
# 사용 가능한 구독 목록
az account list --output table

# 기본 구독 설정
az account set --subscription "<subscription-id-or-name>"

# AZD 환경 설정
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# 확인
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" 또는 "쿼터 초과"</strong></summary>

```bash
# 다른 Azure 지역을 시도하세요
azd env set AZURE_LOCATION "westus2"
azd up

# 또는 개발 환경에서는 더 작은 SKU를 사용하세요
# infra/main.parameters.json을 수정하세요:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" 도중에 실패함</strong></summary>

```bash
# 옵션 1: 정리하고 다시 시도
azd down --force --purge
azd up

# 옵션 2: 인프라만 수정
azd provision

# 옵션 3: 자세한 상태 확인
azd show

# 옵션 4: Azure Monitor에서 로그 확인
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "인증 실패" 또는 "토큰 만료"</strong></summary>

```bash
# 재인증
az logout
az login

azd auth logout
azd auth login

# 인증 확인
az account show
```
</details>

<details>
<summary><strong>❌ "리소스가 이미 존재함" 또는 이름 충돌</strong></summary>

```bash
# AZD는 고유한 이름을 생성하지만, 충돌이 발생하면:
azd down --force --purge

# 새 환경으로 다시 시도합니다
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 템플릿 배포 지연</strong></summary>

**일반 대기 시간:**
- 간단한 웹 앱: 5-10분
- 데이터베이스가 있는 앱: 10-15분
- AI 애플리케이션: 15-25분 (OpenAI 프로비저닝이 느림)

```bash
# 진행 상황 확인
azd show

# 30분 이상 멈추면 Azure 포털을 확인하세요:
azd monitor
# 실패한 배포를 찾으세요
```
</details>

<details>
<summary><strong>❌ "권한 거부됨" 또는 "금지됨"</strong></summary>

```bash
# Azure 역할을 확인하세요
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 최소한 "기여자" 역할이 필요합니다
# Azure 관리자에게 다음 권한 부여를 요청하세요:
# - 기여자 (리소스용)
# - 사용자 액세스 관리자 (역할 할당용)
```
</details>

<details>
<summary><strong>❌ 배포된 애플리케이션 URL을 찾을 수 없음</strong></summary>

```bash
# 모든 서비스 엔드포인트 보여주기
azd show

# 또는 Azure 포털 열기
azd monitor

# 특정 서비스 확인하기
azd env get-values
# *_URL 변수를 찾기
```
</details>

### 📚 전체 문제 해결 리소스

- **일반 문제 가이드:** [자세한 해결책](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 관련 문제:** [AI 문제 해결](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **디버깅 가이드:** [단계별 디버깅](docs/chapter-07-troubleshooting/debugging.md)
- **도움 받기:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 코스 완료 및 인증

### 진행 상황 추적
각 챕터별 학습 진행 상황을 추적하세요:

- [ ] **챕터 1**: 기초 및 빠른 시작 ✅
- [ ] **챕터 2**: AI-우선 개발 ✅  
- [ ] **챕터 3**: 구성 및 인증 ✅
- [ ] **챕터 4**: 코드로서의 인프라 및 배포 ✅
- [ ] **챕터 5**: 다중 에이전트 AI 솔루션 ✅
- [ ] **챕터 6**: 사전 배포 검증 및 계획 ✅
- [ ] **챕터 7**: 문제 해결 및 디버깅 ✅
- [ ] **챕터 8**: 프로덕션 및 엔터프라이즈 패턴 ✅

### 학습 검증
각 챕터 완료 후, 지식을 검증하세요:
1. **실습 연습**: 해당 챕터의 핸즈온 배포 완성
2. **지식 확인**: 챕터별 FAQ 섹션 검토
3. **커뮤니티 토론**: Azure Discord에서 경험 공유
4. **다음 챕터**: 다음 난이도 단계로 이동

### 코스 완료 혜택
모든 챕터를 완료하면:
- **실무 경험**: 실제 AI 애플리케이션을 Azure에 배포함
- **전문 역량**: 엔터프라이즈 준비 완료 배포 능력  
- **커뮤니티 인정**: 활발한 Azure 개발자 커뮤니티 회원
- **경력 향상**: 수요가 높은 AZD 및 AI 배포 전문성

---

## 🤝 커뮤니티 및 지원

### 도움 및 지원 받기
- **기술 문제**: [버그 신고 및 기능 요청](https://github.com/microsoft/azd-for-beginners/issues)
- **학습 질문**: [Microsoft Azure Discord 커뮤니티](https://discord.gg/microsoft-azure) 및 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 관련 도움**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) 참여
- **문서**: [공식 Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord의 커뮤니티 인사이트

**#Azure 채널 최근 투표 결과:**
- **45%** 개발자가 AI 워크로드에 AZD 사용 희망
- **주요 과제**: 다중 서비스 배포, 자격증명 관리, 프로덕션 준비  
- **가장 많이 요청된 것**: AI 전용 템플릿, 문제 해결 가이드, 모범 사례

**커뮤니티에 참여하면:**
- AZD + AI 경험 공유 및 도움 받기
- 새로운 AI 템플릿 조기 미리보기 접근
- AI 배포 모범 사례에 기여
- AI + AZD 향후 기능 개발에 영향력 행사

### 코스 기여하기
기여를 환영합니다! 자세한 내용은 [기여 안내서](CONTRIBUTING.md)를 참조하세요:
- **콘텐츠 개선**: 기존 챕터 및 예제 향상
- **새로운 예제**: 실세계 시나리오 및 템플릿 추가  
- **번역**: 다국어 지원 유지 도움
- **버그 리포트**: 정확성과 명료성 향상
- **커뮤니티 기준**: 포괄적인 커뮤니티 가이드라인 준수

---

## 📄 코스 정보

### 라이선스
이 프로젝트는 MIT 라이선스 하에 있으며, 상세 내용은 [LICENSE](../../LICENSE) 파일을 참조하세요.

### 관련 Microsoft 학습 리소스

저희 팀은 다른 포괄적인 학습 코스를 제공합니다:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 생성형 AI 시리즈
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### 핵심 학습
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 코파일럿 시리즈
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ 강의 안내

**🚀 학습을 시작할 준비가 되셨나요?**

**초보자**: [1장: 기초 및 빠른 시작](../..)부터 시작하세요  
**AI 개발자**: [2장: AI 우선 개발](../..)으로 바로 이동  
**경험 많은 개발자**: [3장: 구성 및 인증](../..)부터 시작하세요

**다음 단계**: [1장 시작하기 - AZD 기본](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확한 부분이 있을 수 있음을 알려드립니다. 원문은 해당 문서의 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우 전문 인간 번역을 권장합니다. 본 번역 사용으로 인한 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->