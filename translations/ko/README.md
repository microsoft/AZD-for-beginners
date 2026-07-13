# AZD 초보자 가이드: 체계적인 학습 여정

![AZD-for-beginners](../../translated_images/ko/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 자동 번역 (항상 최신 상태 유지)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](./README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **로컬에서 복제하시겠습니까?**
>
> 이 저장소에는 50개 이상의 언어 번역본이 포함되어 있어 다운로드 크기가 크게 증가합니다. 번역 없이 복제하려면 sparse checkout을 사용하세요:
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
> 이렇게 하면 훨씬 빠른 다운로드로 코스를 완료하는 데 필요한 모든 것을 얻을 수 있습니다.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 오늘의 azd 최신 정보

> 📌 이 코스는 **`azd 1.27.1`** (2026년 7월) 버전에 맞춰 검증되었습니다. `azd version`을 실행해 빌드를 확인하고, `azd upgrade`로 최신 버전을 받으세요.

Azure Developer CLI는 전통적인 웹 앱과 API를 넘어 확장되었습니다. 오늘날 azd는 AI 기반 애플리케이션과 지능형 에이전트를 포함한 <strong>모든</strong> 애플리케이션을 Azure에 배포하는 단일 도구입니다.

이것이 여러분에게 의미하는 바는 다음과 같습니다:

- **AI 에이전트가 이제는 azd의 기본 워크로드입니다.** 기존에 알고 있는 `azd init` → `azd up` 워크플로우로 AI 에이전트 프로젝트를 초기화, 배포 및 관리할 수 있습니다.
- **CLI를 통한 완전한 에이전트 생애주기 관리.** `azure.ai.agents` 확장은 전체 과정을 지원합니다—`azd ai agent init`으로 스캐폴딩, 응답 시간 출력과 함께 `azd ai agent invoke`로 테스트, `azd ai agent eval generate` 및 `azd ai agent optimize`로 품질 측정 및 개선, `azd ai agent delete`로 정리.
- **더 많은 AI 빌딩 블록.** 새 미리 보기 확장인 `azure.ai.skills`와 `azure.ai.connections`를 통해 재사용 가능한 에이전트 스킬과 Foundry 연결을 azd에서 직접 관리할 수 있습니다.
- <strong>Microsoft Foundry 통합</strong>으로 모델 배포, 에이전트 호스팅 및 AI 서비스 구성을 azd 템플릿 생태계에 직접 포함시켰습니다.
- **일상적인 작업이 더 원활해졌습니다.** 최근 릴리스에서 `azd init`이 다시 실행해도 안전하도록 변경되었고, `azd auth login`이 오래된 토큰을 자동 정리하며, 친절한 `azd tool` 첫 실행 설정 프롬프트가 추가되었습니다.
- **핵심 워크플로우는 변경되지 않았습니다.** 투두 앱, 마이크로서비스 또는 다중 AI 에이전트 솔루션을 배포하든 명령어는 동일합니다.

> **Aspire 사용자 참고:** Microsoft는 이제 제품명을 단순히 **Aspire** (과거 ".NET Aspire")로 부릅니다. azd의 Aspire 지원에는 변함이 없으며, 이름만 업데이트되었습니다.

이전에 azd를 사용했다면 AI 지원은 자연스러운 확장입니다—별도의 도구나 고급 과정이 아닙니다. 처음 시작하는 경우 모든 것을 위한 하나의 워크플로우를 배우게 됩니다.

---

## 🚀 Azure Developer CLI (azd)란?

<strong>Azure Developer CLI (azd)</strong>는 Azure에 애플리케이션을 손쉽게 배포할 수 있도록 설계된 개발자 친화적 명령줄 도구입니다. 여러 Azure 리소스를 수동으로 생성하고 연결하는 대신, 단일 명령어로 전체 애플리케이션을 배포할 수 있습니다.

### `azd up`의 마법

```bash
# 이 단일 명령으로 모든 작업을 수행합니다:
# ✅ 모든 Azure 리소스 생성
# ✅ 네트워킹 및 보안 구성
# ✅ 애플리케이션 코드 빌드
# ✅ Azure에 배포
# ✅ 작동하는 URL 제공
azd up
```

**그게 다입니다!** Azure 포털에서 클릭할 필요 없고, 복잡한 ARM 템플릿을 먼저 배울 필요도 없으며, 수동 구성도 필요 없습니다—단지 작동하는 애플리케이션이 Azure에 배포됩니다.

---

## ❓ Azure Developer CLI와 Azure CLI 차이점은?

초보자가 가장 자주 묻는 질문입니다. 간단한 답변은 다음과 같습니다:

| 기능 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>목적</strong> | 개별 Azure 리소스 관리 | 완전한 애플리케이션 배포 |
| <strong>관점</strong> | 인프라 중심 | 애플리케이션 중심 |
| <strong>예시</strong> | `az webapp create --name myapp...` | `azd up` |
| **학습 곡선** | Azure 서비스 숙지 필요 | 애플리케이션만 알면 됨 |
| **최적 대상** | DevOps, 인프라 관리 | 개발자, 프로토타이핑 |

### 쉬운 비유

- <strong>Azure CLI</strong>는 집을 짓기 위한 모든 도구(망치, 톱, 못 등)를 가지고 있는 것과 같습니다. 무엇이든 만들 수 있지만 건축 방법을 알아야 합니다.
- <strong>Azure Developer CLI</strong>는 계약자를 고용하는 것과 같아서 원하는 것을 설명하면 그들이 건축을 처리합니다.

### 각 도구 사용 시기

| 상황 | 사용 도구 |
|----------|----------|
| "웹 앱을 빠르게 배포하고 싶어요" | `azd up` |
| "스토리지 계정만 하나 생성하고 싶어요" | `az storage account create` |
| "완전한 AI 애플리케이션을 구축 중이에요" | `azd init --template azure-search-openai-demo` |
| "특정 Azure 리소스를 디버깅해야 해요" | `az resource show` |
| "몇 분 만에 프로덕션 준비 배포를 원해요" | `azd up --environment production` |

### 두 도구는 함께 작동합니다!

AZD는 내부적으로 Azure CLI를 사용합니다. 두 도구 모두 사용할 수 있습니다:
```bash
# AZD로 앱 배포
azd up

# 그런 다음 Azure CLI로 특정 리소스를 미세 조정하세요
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD에서 템플릿 찾기

처음부터 시작하지 마세요! <strong>Awesome AZD</strong>는 커뮤니티가 모은 즉시 배포 가능한 템플릿 모음입니다:

| 리소스 | 설명 |
|----------|-------------|
| 🔗 [**Awesome AZD 갤러리**](https://azure.github.io/awesome-azd/) | 원클릭 배포 가능한 200개 이상의 템플릿 탐색 |
| 🔗 [**템플릿 제출하기**](https://github.com/Azure/awesome-azd/issues) | 커뮤니티에 본인 템플릿 기여 |
| 🔗 [**GitHub 저장소**](https://github.com/Azure/awesome-azd) | 스타 잊지 마시고 소스 탐색 |

### Awesome AZD의 인기 AI 템플릿

```bash
# Microsoft Foundry 모델 + AI 검색을 이용한 RAG 채팅
azd init --template azure-search-openai-demo

# 빠른 AI 채팅 애플리케이션
azd init --template openai-chat-app-quickstart

# Foundry 에이전트를 사용하는 AI 에이전트
azd init --template get-started-with-ai-agents
```

---

## 🎯 3단계 시작하기

시작하기 전에, 배포할 템플릿이 사용하는 도구가 머신에 준비되어 있는지 확인하세요:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

필수 확인 사항 중 하나라도 실패하면 먼저 해결한 후 빠른 시작을 계속하세요.

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

### 2단계: AZD 인증 설정

```bash
# 이 코스에서 Azure CLI 명령을 직접 사용할 계획이라면 선택 사항입니다
az login

# AZD 워크플로에 필요합니다
azd auth login
```

어떤 인증 방식을 선택해야 할지 모르면 [설치 및 설정](docs/chapter-01-foundation/installation.md#authentication-setup)에서 전체 설정 흐름을 따라가세요.

### 3단계: 첫 번째 앱 배포

```bash
# 템플릿에서 초기화
azd init --template todo-nodejs-mongo

# Azure에 배포 (모든 것을 생성!)
azd up
```

**🎉 완료!** 앱이 이제 Azure에서 라이브 상태입니다.

### 정리 (잊지 마세요!)

```bash
# 실험이 끝나면 모든 리소스를 제거하세요
azd down --force --purge
```

---

## 📚 이 코스 활용법

이 코스는 <strong>점진적 학습</strong>을 위해 설계되었습니다 - 편한 수준에서 시작해 점차 나아가세요:

| 경험 수준 | 시작 지점 |
|-----------------|------------|
| **Azure 초보자** | [1장: 기초](#-chapter-1-foundation--quick-start) |
| **Azure를 알지만 AZD는 초보자** | [1장: 기초](#-chapter-1-foundation--quick-start) |
| **AI 앱 배포를 원함** | [2장: AI 우선 개발](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **실습 위주 학습 원함** | [🎓 인터랙티브 워크숍](workshop/README.md) - 3-4시간 가이드 랩 |
| **프로덕션 패턴 필요** | [8장: 프로덕션 및 엔터프라이즈](#-chapter-8-production--enterprise-patterns) |

### 빠른 설정

1. **이 저장소를 포크하세요**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>복제하세요</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>도움받기</strong>: [Azure Discord 커뮤니티](https://discord.com/invite/ByRwuEEgH4)

> **로컬에서 복제하시겠습니까?**

> 이 저장소에는 50개 이상의 언어 번역본이 포함되어 있어 다운로드 크기가 크게 증가합니다. 번역 없이 복제하려면 sparse checkout을 사용하세요:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 이렇게 하면 훨씬 빠른 다운로드로 코스를 완료하는 데 필요한 모든 것을 얻을 수 있습니다.


## 코스 개요

체계적인 챕터를 통해 Azure Developer CLI (azd)를 마스터하세요. **Microsoft Foundry 통합을 포함한 AI 애플리케이션 배포에 특별 집중합니다.**


### 이 과정이 현대 개발자에게 필수적인 이유

Microsoft Foundry Discord 커뮤니티의 인사이트에 따르면, **개발자의 45%가 AI 작업에 AZD를 사용하고자 하지만** 다음과 같은 문제를 겪고 있습니다:
- 복잡한 멀티 서비스 AI 아키텍처
- 프로덕션 AI 배포 모범 사례  
- Azure AI 서비스 통합 및 구성
- AI 작업 비용 최적화
- AI 특화 배포 문제 해결

### 학습 목표

이 구조화된 과정을 완료하면 다음을 하실 수 있습니다:
- **AZD 기본기 마스터**: 핵심 개념, 설치 및 구성
- **AI 애플리케이션 배포**: Microsoft Foundry 서비스와 AZD 사용
- **인프라스트럭처 코드 구현**: Bicep 템플릿으로 Azure 리소스 관리
- **배포 문제 해결**: 일반 문제 해결 및 디버깅
- **프로덕션 최적화**: 보안, 확장, 모니터링 및 비용 관리
- **멀티 에이전트 솔루션 구축**: 복잡한 AI 아키텍처 배포

## 시작 전에: 계정, 접근 권한 및 전제 조건

1장 시작 전에 다음을 준비하세요. 이 가이드의 설치 단계는 기본 사항이 이미 처리되었다고 가정합니다.

- **Azure 구독**: 회사 구독이나 개인 계정을 사용하거나, 시작을 위해 [무료 평가판](https://aka.ms/azurefreetrial)을 생성하세요.
- **Azure 리소스 생성 권한**: 대부분 실습은 대상 구독 또는 리소스 그룹에 최소 <strong>기여자 권한</strong>이 필요합니다. 일부 장은 리소스 그룹, 관리 ID, RBAC 할당 생성 권한을 가정할 수 있습니다.
- [**GitHub 계정**](https://github.com): 저장소 포크, 개인 변경 추적, GitHub Codespaces 워크샵 활용에 유용합니다.
- **템플릿 실행 환경 사전 요구사항**: 일부 템플릿은 Node.js, Python, Java, Docker 같은 로컬 도구가 필요합니다. 시작 전 설정 검증기를 실행해 누락된 도구를 확인하세요.
- **기본 터미널 사용법**: 전문가일 필요는 없지만 `git clone`, `azd auth login`, `azd up` 같은 명령 실행이 편해야 합니다.

> **기업용 구독에서 작업 중인가요?**
> Azure 환경이 관리자에 의해 관리된다면, 사용 예정인 구독이나 리소스 그룹에 리소스를 배포할 수 있는지 미리 확인하세요. 불가능하다면 시작 전에 샌드박스 구독이나 기여자 권한을 요청하세요.

> **Azure가 처음인가요?**
> https://aka.ms/azurefreetrial 에서 개인 평가판이나 종량제 구독으로 시작해 테넌트 수준 승인 대기 없이 실습을 끝까지 완료하세요.

## 🗺️ 과정 맵: 장별 빠른 이동

각 장은 학습 목표, 빠른 시작, 실습이 포함된 전용 README를 제공합니다:

| 장 | 주제 | 강의 | 소요 시간 | 난이도 |
|---------|-------|---------|----------|------------|
| **[1장: 기초](docs/chapter-01-foundation/README.md)** | 시작하기 | [AZD 기본](docs/chapter-01-foundation/azd-basics.md) &#124; [설치](docs/chapter-01-foundation/installation.md) &#124; [첫 프로젝트](docs/chapter-01-foundation/first-project.md) | 30-45 분 | ⭐ |
| **[2장: AI 개발](docs/chapter-02-ai-development/README.md)** | AI 중심 앱 | [Foundry 통합](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 에이전트](docs/chapter-02-ai-development/agents.md) &#124; [모델 배포](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [워크샵](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 시간 | ⭐⭐ |
| **[3장: 구성](docs/chapter-03-configuration/README.md)** | 인증 및 보안 | [구성](docs/chapter-03-configuration/configuration.md) &#124; [인증 및 보안](docs/chapter-03-configuration/authsecurity.md) | 45-60 분 | ⭐⭐ |
| **[4장: 인프라](docs/chapter-04-infrastructure/README.md)** | IaC 및 배포 | [배포 가이드](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [프로비저닝](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 시간 | ⭐⭐⭐ |
| **[5장: 멀티 에이전트](docs/chapter-05-multi-agent/README.md)** | AI 에이전트 솔루션 | [리테일 시나리오](examples/retail-scenario.md) &#124; [조율 패턴](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 시간 | ⭐⭐⭐⭐ |
| **[6장: 배포 전](docs/chapter-06-pre-deployment/README.md)** | 계획 및 검증 | [사전 점검](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [용량 계획](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 선택](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [앱 인사이트](docs/chapter-06-pre-deployment/application-insights.md) | 1 시간 | ⭐⭐ |
| **[7장: 문제 해결](docs/chapter-07-troubleshooting/README.md)** | 디버그 및 수정 | [일반 문제](docs/chapter-07-troubleshooting/common-issues.md) &#124; [디버깅](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 문제 해결](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 시간 | ⭐⭐ |
| **[8장: 프로덕션](docs/chapter-08-production/README.md)** | 엔터프라이즈 패턴 | [프로덕션 실무](docs/chapter-08-production/production-ai-practices.md) | 2-3 시간 | ⭐⭐⭐⭐ |
| **[🎓 워크샵](workshop/README.md)** | 실습 실험실 | [소개](workshop/docs/instructions/0-Introduction.md) &#124; [템플릿 선택](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [템플릿 검증](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [템플릿 분해](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [템플릿 구성](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [템플릿 맞춤화](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [인프라 해체](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [마무리](workshop/docs/instructions/7-Wrap-up.md) | 3-4 시간 | ⭐⭐ |

**총 과정 소요 시간:** 약 10-14시간 | **기술 수준 향상:** 초급 → 프로덕션 준비 완료

---

## 📚 학습 장

*경험 수준과 목표에 따라 학습 경로 선택*

### 🚀 1장: 기초 및 빠른 시작
**사전 조건**: Azure 구독, 기본 명령줄 지식  
**소요 시간**: 30-45분  
<strong>난이도</strong>: ⭐

#### 학습 내용
- Azure Developer CLI 기본 이해
- 플랫폼에 AZD 설치
- 첫 성공적 배포 경험

#### 학습 자료
- **🎯 시작하기:** [Azure Developer CLI란?](#what-is-azure-developer-cli)
- **📖 이론:** [AZD 기본](docs/chapter-01-foundation/azd-basics.md) - 핵심 개념 및 용어
- **⚙️ 설치:** [설치 및 설정](docs/chapter-01-foundation/installation.md) - 플랫폼별 가이드
- **🛠️ 실습:** [첫 프로젝트](docs/chapter-01-foundation/first-project.md) - 단계별 튜토리얼
- **📋 빠른 참고:** [명령어 치트 시트](resources/cheat-sheet.md)

#### 실습 과제
```bash
# 빠른 설치 검사
azd version

# 첫 번째 애플리케이션 배포
azd init --template todo-nodejs-mongo
azd up
```

**💡 장 결과:** AZD를 사용해 Azure에 간단한 웹 애플리케이션 성공적으로 배포

**✅ 성공 기준:**
```bash
# 1장을 완료한 후, 당신은 다음을 할 수 있어야 합니다:
azd version              # 설치된 버전 표시
azd init --template todo-nodejs-mongo  # 프로젝트 초기화
azd up                  # Azure에 배포
azd show                # 실행 중인 앱 URL 표시
# 애플리케이션이 브라우저에서 열리고 작동함
azd down --force --purge  # 리소스 정리
```

**📊 소요 시간:** 30-45분  
**📈 완료 후 능력:** 기본 애플리케이션 독립 배포 가능
**📈 완료 후 능력:** 기본 애플리케이션 독립 배포 가능

---

### 🤖 2장: AI-우선 개발 (AI 개발자 권장)
**사전 조건**: 1장 완료  
**소요 시간**: 1-2시간  
<strong>난이도</strong>: ⭐⭐

#### 학습 내용
- Microsoft Foundry와 AZD 통합
- AI 기반 애플리케이션 배포
- AI 서비스 구성 이해

#### 학습 자료
- **🎯 시작하기:** [Microsoft Foundry 통합](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 에이전트:** [AI 에이전트 안내](docs/chapter-02-ai-development/agents.md) - AZD로 지능형 에이전트 배포
- **📖 패턴:** [AI 모델 배포](docs/chapter-02-ai-development/ai-model-deployment.md) - AI 모델 배포 및 관리
- **🛠️ 워크샵:** [AI 워크샵 실습](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 솔루션을 AZD 준비형으로 만들기
- **🎥 인터랙티브 가이드:** [워크샵 자료](workshop/README.md) - MkDocs 기반 브라우저 학습 * DevContainer 환경
- **📋 템플릿:** [Microsoft Foundry 템플릿](#워크숍-자료)
- **📝 예제:** [AZD 배포 예제](examples/README.md)

#### 실습 과제
```bash
# 첫 번째 AI 애플리케이션 배포
azd init --template azure-search-openai-demo
azd up

# 추가 AI 템플릿 시도하기
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 장 결과:** RAG 기능이 포함된 AI 기반 채팅 애플리케이션 배포 및 구성

**✅ 성공 기준:**
```bash
# 2장 이후에 할 수 있어야 합니다:
azd init --template azure-search-openai-demo
azd up
# AI 채팅 인터페이스 테스트하기
# 질문을 하고 출처가 포함된 AI 기반 응답 받기
# 검색 통합이 제대로 작동하는지 확인하기
azd monitor  # Application Insights가 원격 측정을 표시하는지 확인하기
azd down --force --purge
```

**📊 소요 시간:** 1-2시간  
**📈 완료 후 능력:** 프로덕션 준비 AI 애플리케이션 배포 및 구성 가능  
**💰 비용 인식:** 월 $80-150 개발 비용, 월 $300-3500 프로덕션 비용 이해

#### 💰 AI 배포 비용 고려 사항

**개발 환경 (예상 $80-150/월):**
- Microsoft Foundry 모델 (종량제): $0-50/월 (토큰 사용량 기반)
- AI Search (기본 등급): $75/월
- 컨테이너 앱 (소비 기반): $0-20/월
- 스토리지 (표준): $1-5/월

**프로덕션 환경 (예상 $300-3,500+/월):**
- Microsoft Foundry 모델 (일관된 성능을 위한 PTU): 월 $3,000 이상 또는 높은 볼륨 종량제
- AI Search (표준 등급): $250/월
- 컨테이너 앱 (전용): $50-100/월
- Application Insights: $5-50/월
- 스토리지 (프리미엄): $10-50/월

**💡 비용 최적화 팁:**
- 학습용으로 **무료 등급** Microsoft Foundry 모델 사용 (Azure OpenAI 50,000 토큰/월 포함)
- 개발하지 않을 때는 `azd down` 명령으로 리소스 할당 해제
- 소비 기반 과금으로 시작, 프로덕션에만 PTU 업그레이드
- 배포 전에 `azd provision --preview`로 비용 예측
- 자동 스케일링 활성화: 실제 사용량에 대해서만 비용 지불

**비용 모니터링:**
```bash
# 예상 월별 비용 확인
azd provision --preview

# Azure 포털에서 실제 비용 모니터링
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3장: 구성 및 인증
**사전 조건**: 1장 완료  
**소요 시간**: 45-60분  
<strong>난이도</strong>: ⭐⭐

#### 학습 내용
- 환경 구성 및 관리
- 인증 및 보안 모범 사례
- 리소스 명명과 조직화

#### 학습 자료
- **📖 구성:** [구성 가이드](docs/chapter-03-configuration/configuration.md) - 환경 설정
- **🔐 보안:** [인증 패턴 및 관리 ID](docs/chapter-03-configuration/authsecurity.md) - 인증 패턴
- **📝 예:** [데이터베이스 앱 예제](examples/database-app/README.md) - AZD 데이터베이스 예제

#### 실습 과제
- 다중 환경 구성 (dev, staging, prod)
- 관리 ID 인증 설정
- 환경별 구성 구현

**💡 장 결과:** 올바른 인증과 보안으로 여러 환경 관리

---

### 🏗️ 4장: 인프라스트럭처 코드 및 배포
**사전 조건**: 1-3장 완료  
**소요 시간**: 1-1.5 시간  
<strong>난이도</strong>: ⭐⭐⭐

#### 학습 내용
- 고급 배포 패턴
- Bicep을 이용한 인프라스트럭처 코드
- 리소스 프로비저닝 전략

#### 학습 자료
- **📖 배포:** [배포 가이드](docs/chapter-04-infrastructure/deployment-guide.md) - 완전한 워크플로우
- **🏗️ 프로비저닝:** [리소스 프로비저닝](docs/chapter-04-infrastructure/provisioning.md) - Azure 리소스 관리
- **📝 예제:** [컨테이너 앱 예제](../../examples/container-app) - 컨테이너화된 배포

#### 실습 과제
- 사용자 정의 Bicep 템플릿 작성
- 멀티 서비스 애플리케이션 배포
- 블루-그린 배포 전략 구현

**💡 장 결과:** 맞춤형 인프라 템플릿으로 복잡한 멀티 서비스 앱 배포

---


### 🎯 5장: 다중 에이전트 AI 솔루션 (고급)
**선수 조건**: 1-2장 완료  
**소요 시간**: 2-3시간  
<strong>난이도</strong>: ⭐⭐⭐⭐

#### 학습 내용
- 다중 에이전트 아키텍처 패턴
- 에이전트 오케스트레이션 및 조정
- 프로덕션 준비 완료 AI 배포

#### 학습 자료
- **🤖 추천 프로젝트**: [소매 다중 에이전트 솔루션](examples/retail-scenario.md) - 완전 구현
- **🛠️ ARM 템플릿**: [ARM 템플릿 패키지](../../examples/retail-multiagent-arm-template) - 원클릭 배포
- **📖 아키텍처**: [다중 에이전트 조정 패턴](docs/chapter-06-pre-deployment/coordination-patterns.md) - 패턴

#### 실습 과제
```bash
# 완전한 소매 다중 에이전트 솔루션 배포
cd examples/retail-multiagent-arm-template
./deploy.sh

# 에이전트 구성 탐색
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 장 결과**: 고객 및 재고 에이전트가 포함된 프로덕션 준비 완료 다중 에이전트 AI 솔루션 배포 및 관리

---

### 🔍 6장: 배포 전 검증 및 계획
**선수 조건**: 4장 완료  
**소요 시간**: 1시간  
<strong>난이도</strong>: ⭐⭐

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
- 비용 최적화를 위한 SKU 선택
- 자동 배포 전 점검 구현

**💡 장 결과**: 실행 전에 배포를 검증하고 최적화

---

### 🚨 7장: 문제 해결 및 디버깅
**선수 조건**: 배포 장 중 하나 완료  
**소요 시간**: 1-1.5시간  
<strong>난이도</strong>: ⭐⭐

#### 학습 내용
- 체계적인 디버깅 접근법
- 일반적인 문제 및 해결책
- AI 특화 문제 해결

#### 학습 자료
- **🔧 일반 문제**: [일반 문제](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 및 해결책
- **🕵️ 디버깅**: [디버깅 가이드](docs/chapter-07-troubleshooting/debugging.md) - 단계별 전략
- **🤖 AI 문제**: [AI 특화 문제 해결](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 서비스 문제

#### 실습 과제
- 배포 실패 진단
- 인증 문제 해결
- AI 서비스 연결 문제 디버깅

**💡 장 결과**: 일반적인 배포 문제를 독립적으로 진단 및 해결

---

### 🏢 8장: 프로덕션 및 엔터프라이즈 패턴
**선수 조건**: 1-4장 완료  
**소요 시간**: 2-3시간  
<strong>난이도</strong>: ⭐⭐⭐⭐

#### 학습 내용
- 프로덕션 배포 전략
- 엔터프라이즈 보안 패턴
- 모니터링 및 비용 최적화

#### 학습 자료
- **🏭 프로덕션**: [프로덕션 AI 모범 사례](docs/chapter-08-production/production-ai-practices.md) - 엔터프라이즈 패턴
- **📝 예제**: [마이크로서비스 예제](../../examples/microservices) - 복잡한 아키텍처
- **📊 모니터링**: [Application Insights 통합](docs/chapter-06-pre-deployment/application-insights.md) - 모니터링

#### 실습 과제
- 엔터프라이즈 보안 패턴 구현
- 종합 모니터링 구성
- 적절한 거버넌스와 함께 프로덕션 배포

**💡 장 결과**: 완전한 프로덕션 기능을 갖춘 엔터프라이즈 준비형 애플리케이션 배포

---

## 🎓 워크숍 개요: 실습 학습 경험

> **⚠️ 워크숍 상태: 개발 중**  
> 워크숍 자료가 현재 개발 및 다듬어지고 있습니다. 핵심 모듈은 작동하지만 일부 고급 부분은 미완성입니다. 모든 내용을 완성하기 위해 적극적으로 작업 중입니다. [진행 상황 확인 →](workshop/README.md)

### 대화형 워크숍 자료
**브라우저 기반 도구와 가이드가 포함된 종합 실습 학습**

본 워크숍 자료는 위 장별 커리큘럼을 보완하는 체계적이고 대화형 학습 경험을 제공합니다. 워크숍은 자기 주도 학습과 강사 주도 세션 모두에 적합하게 설계되었습니다.

#### 🛠️ 워크숍 특징
- **브라우저 기반 인터페이스**: 검색, 복사 및 테마 기능을 갖춘 완전한 MkDocs 워크숍
- **GitHub Codespaces 통합**: 원클릭 개발 환경 설정
- **체계적 학습 경로**: 8개 모듈 가이던스 연습 (총 3-4시간)
- **점진적 방법론**: 도입 → 선택 → 검증 → 해체 → 구성 → 맞춤화 → 종료 → 마무리
- **대화형 DevContainer 환경**: 사전 구성된 도구 및 종속성

#### 📚 워크숍 모듈 구성
워크숍은 <strong>8개 모듈 점진적 방법론</strong>을 따르며 발견에서 배포 마스터까지 안내합니다:

| 모듈 | 주제 | 수행 내용 | 소요 시간 |
|--------|-------|----------------|----------|
| **0. 도입** | 워크숍 개요 | 학습 목표, 선수 조건, 워크숍 구조 이해 | 15분 |
| **1. 선택** | 템플릿 탐색 | AZD 템플릿 탐색 및 시나리오에 맞는 AI 템플릿 선택 | 20분 |
| **2. 검증** | 배포 및 검증 | `azd up`으로 템플릿 배포하고 인프라 확인 | 30분 |
| **3. 해체** | 구조 이해 | GitHub Copilot으로 템플릿 아키텍처, Bicep 파일, 코드 구성 탐색 | 30분 |
| **4. 구성** | azure.yaml 심층 분석 | `azure.yaml` 구성, 라이프사이클 훅, 환경 변수 숙달 | 30분 |
| **5. 맞춤화** | 나만의 구성 | AI 검색, 추적, 평가 활성화 및 시나리오 맞춤화 | 45분 |
| **6. 종료** | 정리 | `azd down --purge`로 안전하게 리소스 정리 | 15분 |
| **7. 마무리** | 다음 단계 | 성과 검토, 핵심 개념, 학습 여정 지속 | 15분 |

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
# 옵션 1: GitHub Codespaces (추천)
# 저장소에서 "Code" → "Create codespace on main"을 클릭하세요

# 옵션 2: 로컬 개발
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md의 설정 지침을 따르십시오
```

#### 🎯 워크숍 학습 성과
워크숍 완료 시 참가자는:
- **프로덕션 AI 애플리케이션 배포**: Microsoft Foundry 서비스와 AZD 사용
- **다중 에이전트 아키텍처 마스터**: 협력 AI 에이전트 솔루션 구현
- **보안 모범 사례 구현**: 인증 및 액세스 제어 구성
- **규모 최적화**: 비용 효과적이며 성능 좋은 배포 설계
- **배포 문제 해결**: 일반 문제 독립적 해결

#### 📖 워크숍 자료
- **🎥 대화형 가이드**: [워크숍 자료](workshop/README.md) - 브라우저 기반 학습 환경
- **📋 모듈별 지침**:
  - [0. 도입](workshop/docs/instructions/0-Introduction.md) - 워크숍 개요 및 목표
  - [1. 선택](workshop/docs/instructions/1-Select-AI-Template.md) - AI 템플릿 탐색 및 선택
  - [2. 검증](workshop/docs/instructions/2-Validate-AI-Template.md) - 템플릿 배포 및 확인
  - [3. 해체](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 템플릿 아키텍처 탐색
  - [4. 구성](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml 마스터하기
  - [5. 맞춤화](workshop/docs/instructions/5-Customize-AI-Template.md) - 시나리오에 맞게 맞춤화
  - [6. 종료](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 리소스 정리
  - [7. 마무리](workshop/docs/instructions/7-Wrap-up.md) - 검토 및 다음 단계
- **🛠️ AI 워크숍 실습실**: [AI 워크숍 실습실](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 중심 실습
- **💡 빠른 시작**: [워크숍 설정 가이드](workshop/README.md#quick-start) - 환경 구성

**적합 대상**: 기업 교육, 대학 과정, 자기 주도 학습, 개발자 부트캠프.

---

## 📖 심층 분석: AZD 기능

기본 기능을 넘어 AZD는 프로덕션 배포를 위한 강력한 기능을 제공합니다:

- **템플릿 기반 배포** - 일반 애플리케이션 패턴에 대해 사전 구축된 템플릿 사용
- **인프라 코드화** - Bicep 또는 Terraform을 사용하여 Azure 리소스 관리  
- **통합 워크플로우** - 애플리케이션 자동 프로비저닝, 배포 및 모니터링
- **개발자 친화적** - 개발자 생산성과 경험 최적화

### **AZD + Microsoft Foundry: AI 배포에 최적**

**왜 AI 솔루션에 AZD인가?** AZD는 AI 개발자가 직면하는 주요 과제를 해결합니다:

- **AI 준비 템플릿** - Microsoft Foundry 모델, Azure AI 서비스 및 ML 워크로드용 사전 구성 템플릿
- **안전한 AI 배포** - AI 서비스, API 키, 모델 엔드포인트 보안 패턴 내장  
- **프로덕션 AI 패턴** - 확장 가능하고 비용 효율적인 AI 애플리케이션 배포 모범 사례
- **종단 간 AI 워크플로우** - 모델 개발부터 프로덕션 배포, 모니터링까지 완벽 지원
- **비용 최적화** - AI 워크로드용 스마트 리소스 할당 및 확장 전략
- **Microsoft Foundry 통합** - Microsoft Foundry 모델 카탈로그 및 엔드포인트와 원활한 연결

---

## 🎯 템플릿 및 예제 라이브러리

### 추천: Microsoft Foundry 템플릿
**AI 애플리케이션 배포 시 여기를 시작하세요!**

> **참고:** 이 템플릿들은 다양한 AI 패턴을 시연합니다. 일부는 외부 Azure 샘플이고, 일부는 로컬 구현입니다.

| 템플릿 | 장 | 난이도 | 서비스 | 유형 |
|----------|---------|------------|----------|------|
| [**AI 채팅 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2장 | ⭐⭐ | AzureOpenAI + Azure AI 모델 추론 API + Azure AI 검색 + Azure 컨테이너 앱 + Application Insights | 외부 |
| [**AI 에이전트 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2장 | ⭐⭐ | Foundry 에이전트 + AzureOpenAI + Azure AI 검색 + Azure 컨테이너 앱 + Application Insights| 외부 |
| [**Azure 검색 + OpenAI 데모**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2장 | ⭐⭐ | AzureOpenAI + Azure AI 검색 + 앱 서비스 + 스토리지 | 외부 |
| [**OpenAI 채팅 앱 빠른 시작**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2장 | ⭐ | AzureOpenAI + 컨테이너 앱 + Application Insights | 외부 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5장 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 외부 |
| [**Contoso 채팅 RAG**](https://github.com/Azure-Samples/contoso-chat) | 8장 | ⭐⭐⭐⭐ | AzureOpenAI + AI 검색 + Cosmos DB + 컨테이너 앱 | 외부 |
| [**소매 다중 에이전트 솔루션**](examples/retail-scenario.md) | 5장 | ⭐⭐⭐⭐ | AzureOpenAI + AI 검색 + 스토리지 + 컨테이너 앱 + Cosmos DB | <strong>로컬</strong> |

### 추천: 완전 학습 시나리오
**학습 장에 매핑된 프로덕션 준비 완료 애플리케이션 템플릿**

| 템플릿 | 학습 장 | 난이도 | 주요 학습 내용 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2장 | ⭐ | 기본 AI 배포 패턴 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2장 | ⭐⭐ | Azure AI 검색과 함께하는 RAG 구현 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4장 | ⭐⭐ | 문서 인텔리전스 통합 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5장 | ⭐⭐⭐ | 에이전트 프레임워크 및 함수 호출 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8장 | ⭐⭐⭐ | 엔터프라이즈 AI 오케스트레이션 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5장 | ⭐⭐⭐⭐ | 고객 및 재고 에이전트가 포함된 다중 에이전트 아키텍처 |

### 예제 유형별 학습

> **📌 로컬 vs. 외부 예제:**  
> **로컬 예제** (이 저장소 내) = 즉시 사용 가능  
> **외부 예제** (Azure 샘플) = 링크된 저장소에서 클론

#### 로컬 예제 (즉시 사용 가능)
- [**소매 다중 에이전트 솔루션**](examples/retail-scenario.md) - ARM 템플릿과 함께 제공되는 완전한 프로덕션 준비 구현
  - 다중 에이전트 아키텍처 (고객 + 재고 에이전트)
  - 종합적인 모니터링 및 평가
  - ARM 템플릿을 통한 원클릭 배포

#### 로컬 예제 - 컨테이너 애플리케이션 (2-5장)
**이 저장소에 포함된 종합 컨테이너 배포 예제:**

- [**컨테이너 앱 예제**](examples/container-app/README.md) - 컨테이너화된 배포에 대한 완전한 가이드
  - [간단한 Flask API](../../examples/container-app/simple-flask-api) - 스케일 투 제로를 지원하는 기본 REST API
  - [마이크로서비스 아키텍처](../../examples/container-app/microservices) - 프로덕션 준비 다중 서비스 배포
  - 빠른 시작, 프로덕션 및 고급 배포 패턴
  - 모니터링, 보안 및 비용 최적화 지침

#### 외부 예제 - 간단한 애플리케이션 (1-2장)
**시작하려면 이 Azure Samples 리포지토리를 클론하세요:**
- [간단한 웹 앱 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 기본 배포 패턴
- [정적 웹사이트 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 정적 콘텐츠 배포
- [컨테이너 앱 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 배포

#### 외부 예제 - 데이터베이스 통합 (3-4장)  
- [데이터베이스 앱 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 데이터베이스 연결 패턴
- [펑션 + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 서버리스 데이터 워크플로우

#### 외부 예제 - 고급 패턴 (4-8장)
- [자바 마이크로서비스](https://github.com/Azure-Samples/java-microservices-aca-lab) - 다중 서비스 아키텍처
- [컨테이너 앱 작업](https://github.com/Azure-Samples/container-apps-jobs) - 백그라운드 처리  
- [엔터프라이즈 ML 파이프라인](https://github.com/Azure-Samples/mlops-v2) - 프로덕션 준비 ML 패턴

### 외부 템플릿 모음
- [**공식 AZD 템플릿 갤러리**](https://azure.github.io/awesome-azd/) - 공식 및 커뮤니티 템플릿 엄선 모음
- [**Azure 개발자 CLI 템플릿**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 템플릿 문서
- [**예제 디렉터리**](examples/README.md) - 자세한 설명이 포함된 로컬 학습 예제

---

## 📚 학습 자료 및 참고 문헌

### 빠른 참고 자료
- [**명령어 치트 시트**](resources/cheat-sheet.md) - 장별로 정리된 필수 azd 명령어
- [<strong>용어집</strong>](resources/glossary.md) - Azure 및 azd 용어 설명  
- [**자주 묻는 질문(FAQ)**](resources/faq.md) - 학습 장별로 정리된 일반 질문
- [**학습 가이드**](resources/study-guide.md) - 종합적인 실습 연습

### 실습 워크숍
- [**AI 워크숍 랩**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 솔루션을 AZD 배포 가능하게 만들기 (2-3시간)
- [**인터랙티브 워크숍**](workshop/README.md) - MkDocs 및 GitHub Codespaces와 함께하는 8개 모듈의 안내 실습
  - 순서: 소개 → 선택 → 검증 → 해체 → 구성 → 맞춤화 → 정리 → 마무리

### 외부 학습 자료
- [Azure 개발자 CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 가격 계산기](https://azure.microsoft.com/pricing/calculator/)
- [Azure 상태](https://status.azure.com/)

### 에디터용 AI 에이전트 스킬
- [**Microsoft Azure skills.sh에 있는 스킬**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, 배포, 진단, 비용 최적화 등 37개의 오픈 에이전트 스킬. GitHub Copilot, Cursor, Claude Code 또는 지원되는 에이전트에 설치:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 빠른 문제 해결 가이드

**초보자가 자주 겪는 문제와 즉각적인 해결책:**

<details>
<summary><strong>❌ "azd: 명령어를 찾을 수 없음"</strong></summary>

```bash
# 먼저 AZD를 설치하세요
# 윈도우 (파워셸):
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
<summary><strong>❌ "구독을 찾을 수 없음" 또는 "구독 설정 안 됨"</strong></summary>

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

# 개발 시 더 작은 SKU를 사용하세요
# infra/main.parameters.json을 편집하세요:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" 명령어가 중간에 실패함</strong></summary>

```bash
# 옵션 1: 정리하고 재시도
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
# AZD를 위해 다시 인증합니다
azd auth logout
azd auth login

# 선택 사항: az 명령어를 실행 중인 경우 Azure CLI도 새로고침합니다
az logout
az login

# 인증 확인
az account show
```
</details>

<details>
<summary><strong>❌ "리소스가 이미 존재함" 또는 명명 충돌</strong></summary>

```bash
# AZD는 고유한 이름을 생성하지만, 충돌이 발생하면:
azd down --force --purge

# 그러면 새로운 환경으로 다시 시도합니다
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 템플릿 배포가 너무 오래 걸림</strong></summary>

**일반 대기 시간:**
- 간단한 웹 앱: 5-10분
- 데이터베이스가 있는 앱: 10-15분
- AI 애플리케이션: 15-25분 (OpenAI 프로비저닝이 느림)

```bash
# 진행 상황 확인
azd show

# 30분 이상 멈췄다면, Azure 포털을 확인하세요:
azd monitor --overview
# 실패한 배포를 찾아보세요
```
</details>

<details>
<summary><strong>❌ "권한 거부" 또는 "금지됨"</strong></summary>

```bash
# Azure 역할을 확인하세요
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 최소 "기여자" 역할이 필요합니다
# Azure 관리자에게 다음 권한을 요청하세요:
# - 기여자 (리소스 용)
# - 사용자 액세스 관리자 (역할 할당 용)
```
</details>

<details>
<summary><strong>❌ 배포된 애플리케이션 URL을 찾을 수 없음</strong></summary>

```bash
# 모든 서비스 엔드포인트 표시
azd show

# 또는 Azure 포털 열기
azd monitor

# 특정 서비스 확인
azd env get-values
# *_URL 변수를 찾으세요
```
</details>

### 📚 전체 문제 해결 자료

- **일반 문제 가이드:** [자세한 해결책](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 관련 문제:** [AI 문제 해결](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **디버깅 가이드:** [단계별 디버깅](docs/chapter-07-troubleshooting/debugging.md)
- **지원 받기:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 과정 완료 및 인증

### 진행 상황 추적
각 장별 학습 진행 상황 추적:

- [ ] **1장**: 기초 및 빠른 시작 ✅
- [ ] **2장**: AI-First 개발 ✅  
- [ ] **3장**: 구성 및 인증 ✅
- [ ] **4장**: 코드로서의 인프라 및 배포 ✅
- [ ] **5장**: 다중 에이전트 AI 솔루션 ✅
- [ ] **6장**: 배포 전 검증 및 계획 ✅
- [ ] **7장**: 문제 해결 및 디버깅 ✅
- [ ] **8장**: 프로덕션 및 엔터프라이즈 패턴 ✅

### 학습 검증
각 장 완료 후 지식 검증 방법:
1. **실습 과제**: 해당 장의 실습 배포 완료
2. **지식 확인**: 해당 장 FAQ 섹션 검토
3. **커뮤니티 토론**: Azure Discord에서 경험 공유
4. **다음 장으로 진행**: 다음 난이도 단계로 이동

### 과정 완료 혜택
모든 장을 완료하면 다음을 얻게 됩니다:
- **프로덕션 경험**: 실제 AI 애플리케이션을 Azure에 배포함
- **전문 기술**: 엔터프라이즈 준비된 배포 역량  
- **커뮤니티 인정**: 활동적인 Azure 개발자 커뮤니티 멤버
- **커리어 발전**: 수요가 높은 AZD 및 AI 배포 전문 지식

---

## 🤝 커뮤니티 및 지원

### 도움말 및 지원 받기
- **기술 문제:** [버그 신고 및 기능 요청](https://github.com/microsoft/azd-for-beginners/issues)
- **학습 질문:** [Microsoft Azure Discord 커뮤니티](https://discord.gg/microsoft-azure) 및 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 관련 도움:** [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)에 참여하세요
- **문서:** [공식 Azure 개발자 CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord에서 얻는 커뮤니티 인사이트

**#Azure 채널에서의 최근 설문 결과:**
- **45%** 개발자가 AI 작업을 위해 AZD 사용 희망
- **주요 도전 과제**: 다중 서비스 배포, 자격 증명 관리, 프로덕션 준비  
- **가장 요청 많은 항목**: AI 전용 템플릿, 문제 해결 가이드, 모범 사례

**우리 커뮤니티에 참여하여:**
- AZD + AI 경험 공유 및 도움 받기
- 새로운 AI 템플릿의 조기 미리보기 접근
- AI 배포 모범 사례에 기여
- 미래 AI + AZD 기능 개발에 영향 미치기

### 과정 기여하기
기여를 환영합니다! 자세한 내용은 [Contributing Guide](CONTRIBUTING.md)를 읽어주세요:
- **콘텐츠 개선:** 기존 장과 예제 향상
- **새 예제:** 실무 시나리오 및 템플릿 추가  
- **번역:** 다국어 지원 유지 도움
- **버그 신고:** 정확성과 명료성 개선
- **커뮤니티 기준:** 포용적인 커뮤니티 가이드라인 준수

---

## 📄 코스 정보

### 라이선스
이 프로젝트는 MIT 라이선스 하에 있으며, 자세한 내용은 [LICENSE](../../LICENSE) 파일을 참조하세요.

### 관련 Microsoft 학습 자료

저희 팀은 다른 포괄적인 학습 과정을 제공합니다:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![초보자를 위한 LangChain4j](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![초보자를 위한 LangChain.js](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![초보자를 위한 LangChain](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / 에이전트
[![초보자를 위한 AZD](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![초보자를 위한 Edge AI](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![초보자를 위한 MCP](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![초보자를 위한 AI 에이전트](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 생성 AI 시리즈
[![초보자를 위한 생성 AI](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![생성 AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![생성 AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

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

## 🗺️ 강좌 안내

**🚀 학습을 시작할 준비가 되었나요?**

<strong>초보자</strong>: [1장: 기초 및 빠른 시작](#-chapter-1-foundation--quick-start)부터 시작하세요  
**AI 개발자**: [2장: AI 우선 개발](#-chapter-2-ai-first-development-recommended-for-ai-developers)으로 바로 이동하세요  
**경험 있는 개발자**: [3장: 구성 및 인증](#️-chapter-3-configuration--authentication)부터 시작하세요

**다음 단계**: [1장 시작 - AZD 기초](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->