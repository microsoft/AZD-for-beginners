# 초보자를 위한 AZD: 체계적인 학습 여정

![AZD-for-beginners](../../translated_images/ko/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 자동 번역 (항상 최신 상태 유지)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[아랍어](../ar/README.md) | [벵골어](../bn/README.md) | [불가리아어](../bg/README.md) | [버마어 (미얀마)](../my/README.md) | [중국어 (간체)](../zh-CN/README.md) | [중국어 (번체, 홍콩)](../zh-HK/README.md) | [중국어 (번체, 마카오)](../zh-MO/README.md) | [중국어 (번체, 대만)](../zh-TW/README.md) | [크로아티아어](../hr/README.md) | [체코어](../cs/README.md) | [덴마크어](../da/README.md) | [네덜란드어](../nl/README.md) | [에스토니아어](../et/README.md) | [핀란드어](../fi/README.md) | [프랑스어](../fr/README.md) | [독일어](../de/README.md) | [그리스어](../el/README.md) | [히브리어](../he/README.md) | [힌디어](../hi/README.md) | [헝가리어](../hu/README.md) | [인도네시아어](../id/README.md) | [이탈리아어](../it/README.md) | [일본어](../ja/README.md) | [칸나다어](../kn/README.md) | [한국어](./README.md) | [리투아니아어](../lt/README.md) | [말레이어](../ms/README.md) | [말라얄람어](../ml/README.md) | [마라티어](../mr/README.md) | [네팔어](../ne/README.md) | [나이지리아 피진](../pcm/README.md) | [노르웨이어](../no/README.md) | [페르시아어 (파르시)](../fa/README.md) | [폴란드어](../pl/README.md) | [포르투갈어 (브라질)](../pt-BR/README.md) | [포르투갈어 (포르투갈)](../pt-PT/README.md) | [펀자브어 (구르무키)](../pa/README.md) | [루마니아어](../ro/README.md) | [러시아어](../ru/README.md) | [세르비아어 (키릴어)](../sr/README.md) | [슬로바키아어](../sk/README.md) | [슬로베니아어](../sl/README.md) | [스페인어](../es/README.md) | [스와힐리어](../sw/README.md) | [스웨덴어](../sv/README.md) | [따갈로그어 (필리핀어)](../tl/README.md) | [타밀어](../ta/README.md) | [텔루구어](../te/README.md) | [태국어](../th/README.md) | [터키어](../tr/README.md) | [우크라이나어](../uk/README.md) | [우르두어](../ur/README.md) | [베트남어](../vi/README.md)

> **로컬에 복제하시겠습니까?**
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
> 훨씬 빠른 다운로드로 과정 완수에 필요한 모든 것을 얻을 수 있습니다.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 오늘 azd의 새로운 기능

Azure Developer CLI는 기존의 웹 앱 및 API를 넘어 성장했습니다. 오늘날 azd는 AI 기반 애플리케이션과 지능형 에이전트를 포함하여 <strong>모든</strong> 애플리케이션을 Azure에 배포하는 단일 도구입니다.

이는 다음을 의미합니다:

- **AI 에이전트가 이제 1급 azd 워크로드입니다.** 이미 알고 있는 `azd init` → `azd up` 워크플로우를 사용해 AI 에이전트 프로젝트를 초기화, 배포 및 관리할 수 있습니다.
- <strong>Microsoft Foundry 통합</strong>을 통해 모델 배포, 에이전트 호스팅 및 AI 서비스 구성이 azd 템플릿 생태계에 직접 포함됩니다.
- **핵심 워크플로우는 변하지 않았습니다.** 투두 앱, 마이크로서비스, 또는 다중 에이전트 AI 솔루션을 배포할 때도 명령어는 동일합니다.

이전에 azd를 사용해본 적 있다면, AI 지원은 자연스러운 확장이며 별도의 도구나 고급 트랙이 아닙니다. 처음 시작하는 경우 모든 것에 적용되는 하나의 워크플로우를 배우게 됩니다.

---

## 🚀 Azure Developer CLI (azd)란?

<strong>Azure Developer CLI (azd)</strong>는 개발자 친화적인 명령줄 도구로, 애플리케이션을 Azure에 간단히 배포할 수 있게 합니다. 수십 개의 Azure 리소스를 수동으로 만들고 연결하는 대신, 한 번의 명령어로 전체 애플리케이션을 배포할 수 있습니다.

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

**그게 전부입니다!** Azure 포털에서 클릭할 필요도, 복잡한 ARM 템플릿을 먼저 배울 필요도, 수동 구성도 없이 Azure에서 작동하는 애플리케이션을 바로 사용할 수 있습니다.

---

## ❓ Azure Developer CLI와 Azure CLI: 차이점은?

초보자들이 가장 많이 묻는 질문입니다. 간단한 답변은 다음과 같습니다:

| 기능 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| <strong>목적</strong> | 개별 Azure 리소스 관리 | 전체 애플리케이션 배포 |
| <strong>마인드셋</strong> | 인프라 중심 | 애플리케이션 중심 |
| <strong>예시</strong> | `az webapp create --name myapp...` | `azd up` |
| **학습 곡선** | Azure 서비스 이해 필요 | 앱만 알면 됨 |
| **추천 대상** | DevOps, 인프라 | 개발자, 프로토타이핑 |

### 간단한 비유

- <strong>Azure CLI</strong>는 집을 짓기 위한 모든 도구(망치, 톱, 못)를 가진 것과 같습니다. 뭐든 만들 수 있지만, 건축 지식이 필요합니다.
- <strong>Azure Developer CLI</strong>는 시공사를 고용하는 것과 같습니다. 원하는 것을 설명하면, 시공사가 건물을 완성합니다.

### 각각을 언제 사용하는가

| 시나리오 | 사용 도구 |
|----------|----------|
| "내 웹 앱을 빨리 배포하고 싶다" | `azd up` |
| "스토리지 계정만 만들고 싶다" | `az storage account create` |
| "전체 AI 애플리케이션을 구축 중이다" | `azd init --template azure-search-openai-demo` |
| "특정 Azure 리소스를 디버깅해야 한다" | `az resource show` |
| "몇 분 만에 프로덕션용 배포를 원한다" | `azd up --environment production` |

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

처음부터 시작하지 마세요! <strong>Awesome AZD</strong>는 배포 준비가 된 커뮤니티 템플릿 모음입니다:

| 리소스 | 설명 |
|----------|-------------|
| 🔗 [**Awesome AZD 갤러리**](https://azure.github.io/awesome-azd/) | 원클릭 배포가 가능한 200개 이상의 템플릿 찾아보기 |
| 🔗 [**템플릿 제출하기**](https://github.com/Azure/awesome-azd/issues) | 커뮤니티에 나만의 템플릿 기여하기 |
| 🔗 [**GitHub 저장소**](https://github.com/Azure/awesome-azd) | 스타 누르고 소스 탐색하기 |

### Awesome AZD의 인기 AI 템플릿

```bash
# Microsoft Foundry 모델과 AI 검색을 활용한 RAG 채팅
azd init --template azure-search-openai-demo

# 빠른 AI 채팅 애플리케이션
azd init --template openai-chat-app-quickstart

# Foundry 에이전트와 함께하는 AI 에이전트
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

# Azure에 배포(모든 것을 생성함!)
azd up
```

**🎉 완료!** 이제 앱이 Azure에서 실행 중입니다.

### 정리 (잊지 마세요!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 이 강의를 사용하는 방법

이 과정은 <strong>점진적 학습</strong>을 위해 설계되었습니다 - 편한 곳에서 시작해 점차 발전하세요:

| 당신의 경험 | 여기서 시작하세요 |
|-----------------|------------|
| **Azure를 처음 접하는 분** | [1장: 기초](#-chapter-1-foundation--quick-start) |
| **Azure는 알지만 AZD는 처음인 분** | [1장: 기초](#-chapter-1-foundation--quick-start) |
| **AI 앱 배포를 원하시는 분** | [2장: AI 우선 개발](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **실습을 원하시는 분** | [🎓 인터랙티브 워크숍](workshop/README.md) - 3~4시간 가이드 실습 |
| **프로덕션 패턴이 필요한 분** | [8장: 프로덕션 및 엔터프라이즈](#-chapter-8-production--enterprise-patterns) |

### 빠른 설정

1. **이 저장소 포크하기**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. <strong>클론하기</strong>: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. <strong>도움받기</strong>: [Azure Discord 커뮤니티](https://discord.com/invite/ByRwuEEgH4)

> **로컬 복제를 선호하나요?**

> 이 저장소에는 50개 이상의 언어 번역본이 포함되어 있어 다운로드 크기가 크게 증가합니다. 번역 없이 복제하려면 sparse checkout을 사용하세요:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 훨씬 빠른 다운로드로 과정 완수에 필요한 모든 것을 얻을 수 있습니다.


## 강의 개요

체계적인 장별 구성으로 Azure Developer CLI (azd)를 마스터하세요. <strong>Microsoft Foundry 통합을 통해 AI 애플리케이션 배포에 특별히 중점</strong>을 두었습니다.

### 이 강의가 현대 개발자에게 중요한 이유

Microsoft Foundry Discord 커뮤니티 인사이트에 따르면, **개발자의 45%가 AZD를 AI 워크로드에 사용하고자 하나 다음과 같은 어려움을 겪고 있습니다:**
- 복잡한 다중 서비스 AI 아키텍처
- 프로덕션 AI 배포 모범 사례  
- Azure AI 서비스 통합 및 구성
- AI 워크로드 비용 최적화
- AI 특화 배포 문제 해결

### 학습 목표

이 체계적인 과정을 완료하면:
- **AZD 기본기 마스터**: 핵심 개념, 설치 및 구성
- **AI 애플리케이션 배포**: Microsoft Foundry 서비스와 함께 AZD 사용
- **인프라 코드화 구현**: Bicep 템플릿으로 Azure 리소스 관리
- **배포 문제 해결**: 일반적인 문제 해결 및 디버깅
- **프로덕션 최적화**: 보안, 확장, 모니터링, 비용 관리
- **다중 에이전트 솔루션 구축**: 복잡한 AI 아키텍처 배포

## 🗺️ 강의 지도: 장별 빠른 이동

각 장별 README에 학습 목표, 빠른 시작, 연습문제가 포함되어 있습니다:

| 장 | 주제 | 강의 | 소요 시간 | 난이도 |
|---------|-------|---------|----------|------------|
| **[1장: 기초](docs/chapter-01-foundation/README.md)** | 시작하기 | [AZD 기본](docs/chapter-01-foundation/azd-basics.md) &#124; [설치](docs/chapter-01-foundation/installation.md) &#124; [첫 프로젝트](docs/chapter-01-foundation/first-project.md) | 30-45 분 | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-First 앱 | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 시간 | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | 인증 및 보안 | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 분 | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC 및 배포 | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 시간 | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI 에이전트 솔루션 | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 시간 | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | 계획 및 검증 | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 시간 | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | 디버그 및 고치기 | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 시간 | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | 엔터프라이즈 패턴 | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 시간 | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | 실습 랩 | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 시간 | ⭐⭐ |

**총 강의 시간:** 약 10-14 시간 | **기술 발전 단계:** 초급 → 프로덕션 준비 완료

---

## 📚 학습 챕터

*경험 수준과 목표에 따라 학습 경로 선택*

### 🚀 챕터 1: 기초 및 빠른 시작  
**전제 조건**: Azure 구독, 기본 명령줄 지식  
<strong>기간</strong>: 30-45 분  
<strong>복잡도</strong>: ⭐

#### 배울 내용  
- Azure Developer CLI 기초 이해  
- AZD 설치 방법  
- 첫 성공적인 배포 경험

#### 학습 자료  
- **🎯 시작점**: [Azure Developer CLI란?](#what-is-azure-developer-cli)  
- **📖 이론**: [AZD 기본](docs/chapter-01-foundation/azd-basics.md) - 핵심 개념 및 용어  
- **⚙️ 설치**: [설치 및 설정](docs/chapter-01-foundation/installation.md) - 플랫폼별 가이드  
- **🛠️ 실습**: [첫 프로젝트](docs/chapter-01-foundation/first-project.md) - 단계별 튜토리얼  
- **📋 요약**: [명령어 치트시트](resources/cheat-sheet.md)

#### 실습 과제  
```bash
# 빠른 설치 확인
azd version

# 첫 번째 애플리케이션 배포하기
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 챕터 결과물**: AZD를 사용해 간단한 웹 애플리케이션을 성공적으로 Azure에 배포

**✅ 성공 검증:**  
```bash
# 1장을 완료한 후, 당신은 할 수 있어야 합니다:
azd version              # 설치된 버전을 보여줍니다
azd init --template todo-nodejs-mongo  # 프로젝트를 초기화합니다
azd up                  # Azure에 배포합니다
azd show                # 실행 중인 앱 URL을 표시합니다
# 애플리케이션이 브라우저에서 열리고 작동합니다
azd down --force --purge  # 리소스를 정리합니다
```
  
**📊 소요 시간:** 30-45 분  
**📈 완료 후 수준:** 기본 애플리케이션을 독립적으로 배포 가능

---

### 🤖 챕터 2: AI-First 개발 (AI 개발자 추천)  
**전제 조건**: 챕터 1 완료  
<strong>기간</strong>: 1-2 시간  
<strong>복잡도</strong>: ⭐⭐

#### 배울 내용  
- AZD와 Microsoft Foundry 통합  
- AI 기반 애플리케이션 배포  
- AI 서비스 구성 이해

#### 학습 자료  
- **🎯 시작점**: [Microsoft Foundry 통합](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 AI 에이전트**: [AI 에이전트 가이드](docs/chapter-02-ai-development/agents.md) - AZD로 지능형 에이전트 배포  
- **📖 패턴**: [AI 모델 배포](docs/chapter-02-ai-development/ai-model-deployment.md) - AI 모델 배포 및 관리  
- **🛠️ 워크숍**: [AI 워크숍 랩](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 솔루션 AZD 준비  
- **🎥 인터랙티브 가이드**: [워크숍 자료](workshop/README.md) - MkDocs * DevContainer 환경에서 브라우저 학습  
- **📋 템플릿**: [Microsoft Foundry 템플릿](#워크숍-자료)  
- **📝 예제**: [AZD 배포 예제](examples/README.md)

#### 실습 과제  
```bash
# 첫 번째 AI 애플리케이션 배포하기
azd init --template azure-search-openai-demo
azd up

# 추가 AI 템플릿 사용해보기
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 챕터 결과물**: RAG 기능을 갖춘 AI 기반 채팅 애플리케이션을 배포 및 구성

**✅ 성공 검증:**  
```bash
# 2장을 마친 후, 당신은 다음을 할 수 있어야 합니다:
azd init --template azure-search-openai-demo
azd up
# AI 채팅 인터페이스를 테스트하세요
# 질문을 하고 출처가 있는 AI 기반 응답을 받으세요
# 검색 통합이 작동하는지 확인하세요
azd monitor  # 애플리케이션 인사이트가 원격 측정 데이터를 표시하는지 확인하세요
azd down --force --purge
```
  
**📊 소요 시간:** 1-2 시간  
**📈 완료 후 수준:** 프로덕션 준비된 AI 애플리케이션 배포 및 구성 가능  
**💰 비용 인식:** 개발 환경 월 $80-150, 프로덕션 월 $300-3500 예상

#### 💰 AI 배포 비용 고려 사항

**개발 환경 (월 약 $80-150):**  
- Microsoft Foundry 모델 (사용량 기반 과금): 월 $0-50 (토큰 사용량에 따름)  
- AI Search (기본 등급): 월 $75  
- Container Apps (소비 기반): 월 $0-20  
- 스토리지 (표준): 월 $1-5

**프로덕션 환경 (월 약 $300-3,500+):**  
- Microsoft Foundry 모델 (일관된 성능 PTU): 월 $3,000+ 또는 대량 사용량 기준 과금  
- AI Search (표준 등급): 월 $250  
- Container Apps (전용): 월 $50-100  
- Application Insights: 월 $5-50  
- 스토리지 (프리미엄): 월 $10-50

**💡 비용 최적화 팁:**  
- 학습용으로 **무료 등급** Microsoft Foundry 모델 사용 (Azure OpenAI 50,000 토큰/월 포함)  
- 개발 시가 아닐 때 `azd down`으로 리소스 할당 해제  
- 시작은 소비 기반 과금, 프로덕션에선 PTU로 전환  
- 배포 전에 `azd provision --preview`로 비용 추산  
- 자동 스케일링 활성화: 실제 사용량만 요금 부과

**비용 모니터링:**  
```bash
# 예상 월별 비용 확인
azd provision --preview

# Azure 포털에서 실제 비용 모니터링
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ 챕터 3: 구성 및 인증  
**전제 조건**: 챕터 1 완료  
<strong>기간</strong>: 45-60 분  
<strong>복잡도</strong>: ⭐⭐

#### 배울 내용  
- 환경 구성 및 관리  
- 인증 및 보안 모범 사례  
- 리소스 명명 및 조직화

#### 학습 자료  
- **📖 구성**: [구성 가이드](docs/chapter-03-configuration/configuration.md) - 환경 설정  
- **🔐 보안**: [인증 패턴 및 관리 ID](docs/chapter-03-configuration/authsecurity.md)  
- **📝 예제**: [데이터베이스 앱 예제](examples/database-app/README.md) - AZD 데이터베이스 예제

#### 실습 과제  
- 여러 환경 구성(dev, staging, prod)  
- 관리 ID 인증 설정  
- 환경별 구성 적용

**💡 챕터 결과물**: 적절한 인증과 보안으로 여러 환경 관리

---

### 🏗️ 챕터 4: 코드로서의 인프라 및 배포  
**전제 조건**: 챕터 1-3 완료  
<strong>기간</strong>: 1-1.5 시간  
<strong>복잡도</strong>: ⭐⭐⭐

#### 배울 내용  
- 고급 배포 패턴  
- Bicep을 이용한 코드형 인프라  
- 리소스 프로비저닝 전략

#### 학습 자료  
- **📖 배포**: [배포 가이드](docs/chapter-04-infrastructure/deployment-guide.md) - 전체 워크플로우  
- **🏗️ 프로비저닝**: [리소스 프로비저닝](docs/chapter-04-infrastructure/provisioning.md) - Azure 리소스 관리  
- **📝 예제**: [컨테이너 앱 예제](../../examples/container-app) - 컨테이너 배포

#### 실습 과제  
- 맞춤 Bicep 템플릿 작성  
- 다중 서비스 애플리케이션 배포  
- 블루-그린 배포 전략 구현

**💡 챕터 결과물**: 맞춤 인프라 템플릿으로 복잡한 다중 서비스 애플리케이션 배포

---

### 🎯 챕터 5: 다중 에이전트 AI 솔루션 (고급)  
**전제 조건**: 챕터 1-2 완료  
<strong>기간</strong>: 2-3 시간  
<strong>복잡도</strong>: ⭐⭐⭐⭐

#### 배울 내용  
- 다중 에이전트 아키텍처 패턴  
- 에이전트 오케스트레이션 및 조정  
- 프로덕션 준비된 AI 배포

#### 학습 자료  
- **🤖 추천 프로젝트**: [리테일 다중 에이전트 솔루션](examples/retail-scenario.md) - 완전 구현  
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
  
**💡 챕터 결과물**: 고객 및 재고 에이전트를 포함한 프로덕션 준비 다중 에이전트 AI 솔루션 배포 및 관리

---

### 🔍 챕터 6: 사전 배포 검증 및 계획  
**전제 조건**: 챕터 4 완료  
<strong>기간</strong>: 1 시간  
<strong>복잡도</strong>: ⭐⭐

#### 배울 내용  
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
- 자동화된 사전 배포 점검 구현

**💡 챕터 결과물**: 배포 전 검증 및 최적화 수행

---

### 🚨 챕터 7: 문제 해결 및 디버깅  
**전제 조건**: 배포 챕터 중 하나 이상 완료  
<strong>기간</strong>: 1-1.5 시간  
<strong>복잡도</strong>: ⭐⭐

#### 배울 내용  
- 체계적 디버깅 방법론  
- 흔한 문제와 해결책  
- AI 관련 문제 해결

#### 학습 자료  
- **🔧 흔한 문제**: [일반 문제](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 및 솔루션  
- **🕵️ 디버깅**: [디버깅 가이드](docs/chapter-07-troubleshooting/debugging.md) - 단계별 전략  
- **🤖 AI 문제**: [AI 전용 문제 해결](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 서비스 문제

#### 실습 과제  
- 배포 실패 진단  
- 인증 문제 해결  
- AI 서비스 연결 문제 디버깅

**💡 챕터 결과물**: 일반적인 배포 문제 독립적으로 진단 및 해결

---

### 🏢 챕터 8: 프로덕션 및 엔터프라이즈 패턴  
**전제 조건**: 챕터 1-4 완료  
<strong>기간</strong>: 2-3 시간  
<strong>복잡도</strong>: ⭐⭐⭐⭐

#### 배울 내용  
- 프로덕션 배포 전략  
- 엔터프라이즈 보안 패턴  
- 모니터링 및 비용 최적화

#### 학습 자료
- **🏭 프로덕션**: [프로덕션 AI 모범 사례](docs/chapter-08-production/production-ai-practices.md) - 엔터프라이즈 패턴  
- **📝 예제**: [마이크로서비스 예제](../../examples/microservices) - 복잡한 아키텍처  
- **📊 모니터링**: [Application Insights 통합](docs/chapter-06-pre-deployment/application-insights.md) - 모니터링  

#### 실습 과제  
- 엔터프라이즈 보안 패턴 구현  
- 종합 모니터링 설정  
- 적절한 거버넌스로 프로덕션 배포  

**💡 챕터 결과**: 완전한 프로덕션 기능을 갖춘 엔터프라이즈 준비 애플리케이션 배포  

---

## 🎓 워크숍 개요: 실습 학습 경험  

> **⚠️ 워크숍 상태: 개발 중**  
> 워크숍 자료가 현재 개발 및 개선 중입니다. 핵심 모듈은 작동하지만 일부 고급 섹션이 미완성입니다. 모든 내용을 완성하기 위해 적극적으로 작업 중입니다. [진행 상황 확인 →](workshop/README.md)  

### 인터랙티브 워크숍 자료  
**브라우저 기반 도구와 안내된 연습 문제를 통한 종합적 실습 학습**  

본 워크숍 자료는 위의 챕터 기반 커리큘럼을 보완하는 구조화된 인터랙티브 학습 경험을 제공합니다. 워크숍은 자기주도 학습과 강사 주도 세션 모두에 적합하게 설계되었습니다.  

#### 🛠️ 워크숍 특징  
- **브라우저 기반 인터페이스**: 검색, 복사, 테마 기능을 갖춘 MkDocs 기반 완전한 워크숍  
- **GitHub Codespaces 통합**: 원클릭 개발 환경 설정  
- **구조화된 학습 경로**: 8개 모듈 가이드 연습 (총 3~4시간)  
- **점진적 방법론**: 도입 → 선택 → 검증 → 해체 → 구성 → 사용자 지정 → 정리 → 마무리  
- **인터랙티브 DevContainer 환경**: 사전 구성된 도구 및 종속성  

#### 📚 워크숍 모듈 구성  
워크숍은 <strong>8개 모듈의 점진적 방법론</strong>을 따라 발견부터 배포 마스터까지 안내합니다:  

| 모듈 | 주제 | 활동 내용 | 소요 시간 |  
|--------|-------|----------------|----------|  
| **0. 도입** | 워크숍 개요 | 학습 목표, 전제 조건 및 워크숍 구조 이해 | 15분 |  
| **1. 선택** | 템플릿 탐색 | AZD 템플릿을 탐색하고 시나리오에 맞는 AI 템플릿 선택 | 20분 |  
| **2. 검증** | 배포 및 검증 | `azd up`으로 템플릿 배포 및 인프라 유효성 확인 | 30분 |  
| **3. 해체** | 구조 이해 | GitHub Copilot으로 템플릿 아키텍처, Bicep 파일, 코드 구성 탐색 | 30분 |  
| **4. 구성** | azure.yaml 심층 학습 | `azure.yaml` 구성, 라이프사이클 훅, 환경 변수 숙달 | 30분 |  
| **5. 사용자 지정** | 맞춤화 적용 | AI 검색, 추적, 평가 활성화 및 시나리오 맞춤화 | 45분 |  
| **6. 정리** | 리소스 정리 | `azd down --purge`로 안전하게 리소스 정리 | 15분 |  
| **7. 마무리** | 다음 단계 | 성과 검토, 핵심 개념 이해 및 학습 여정 지속 | 15분 |  

**워크숍 흐름:**  
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
# 저장소에서 "Code" → "main에서 codespace 생성"을 클릭하세요

# 옵션 2: 로컬 개발
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md의 설치 지침을 따르세요
```
  
#### 🎯 워크숍 학습 결과  
워크숍을 완료하면 참가자는 다음을 수행할 수 있습니다:  
- **프로덕션용 AI 애플리케이션 배포**: Microsoft Foundry 서비스와 AZD 사용  
- **다중 에이전트 아키텍처 마스터**: 조정된 AI 에이전트 솔루션 구현  
- **보안 모범 사례 구현**: 인증 및 접근 제어 구성  
- **규모 최적화**: 비용 효율적이고 성능 좋은 배포 설계  
- **배포 문제 해결**: 일반 문제를 독립적으로 해결  

#### 📖 워크숍 자료  
- **🎥 인터랙티브 가이드**: [워크숍 자료](workshop/README.md) - 브라우저 기반 학습 환경  
- **📋 모듈별 안내서**:  
  - [0. 도입](workshop/docs/instructions/0-Introduction.md) - 워크숍 개요 및 목표  
  - [1. 선택](workshop/docs/instructions/1-Select-AI-Template.md) - AI 템플릿 찾기 및 선택  
  - [2. 검증](workshop/docs/instructions/2-Validate-AI-Template.md) - 템플릿 배포 및 검증  
  - [3. 해체](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 템플릿 아키텍처 탐색  
  - [4. 구성](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml 숙달  
  - [5. 사용자 지정](workshop/docs/instructions/5-Customize-AI-Template.md) - 시나리오 맞춤화  
  - [6. 정리](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 리소스 정리  
  - [7. 마무리](workshop/docs/instructions/7-Wrap-up.md) - 복습 및 다음 단계  
- **🛠️ AI 워크숍 연구실**: [AI 워크숍 연구실](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 집중 실습  
- **💡 빠른 시작**: [워크숍 설정 가이드](workshop/README.md#quick-start) - 환경 구성  

**적합 대상**: 기업 교육, 대학 강의, 자기주도 학습, 개발자 부트캠프  

---

## 📖 심층 탐구: AZD 기능  

기본 기능을 넘어, AZD는 프로덕션 배포를 위한 강력한 기능을 제공합니다:  

- **템플릿 기반 배포** - 일반 애플리케이션 패턴을 위한 미리 만들어진 템플릿 활용  
- **코드로서 인프라** - Bicep 또는 Terraform을 통한 Azure 리소스 관리  
- **통합 워크플로우** - 애플리케이션 프로비저닝, 배포, 모니터링의 원활한 통합  
- **개발자 친화적** - 개발자 생산성과 경험에 최적화됨  

### **AZD + Microsoft Foundry: AI 배포에 완벽한 조합**  

**왜 AI 솔루션에 AZD인가?** AZD는 AI 개발자가 직면한 주요 과제를 해결합니다:  

- **AI 준비 템플릿** - Microsoft Foundry 모델, Cognitive Services, ML 워크로드에 맞춘 사전 구성 템플릿  
- **안전한 AI 배포** - AI 서비스, API 키, 모델 엔드포인트를 위한 내장 보안 패턴  
- **프로덕션 AI 패턴** - 확장 가능하고 비용 효율적인 AI 애플리케이션 배포 베스트 프랙티스  
- **종단 간 AI 워크플로우** - 모델 개발에서 프로덕션 배포 및 모니터링까지  
- **비용 최적화** - AI 워크로드를 위한 스마트한 리소스 할당 및 스케일링 전략  
- **Microsoft Foundry 통합** - Microsoft Foundry 모델 카탈로그 및 엔드포인트와 무결점 연결  

---

## 🎯 템플릿 & 예제 라이브러리  

### 추천: Microsoft Foundry 템플릿  
**AI 애플리케이션 배포 시 여기서 시작하세요!**  

> **참고:** 이 템플릿들은 다양한 AI 패턴을 보여줍니다. 일부는 외부 Azure 샘플이며, 일부는 로컬 구현입니다.  

| 템플릿 | 챕터 | 복잡도 | 서비스 | 유형 |  
|----------|---------|------------|----------|------|  
| [**AI 채팅 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2장 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | 외부 |  
| [**AI 에이전트 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2장 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | 외부 |  
| [**Azure Search + OpenAI 데모**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2장 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | 외부 |  
| [**OpenAI 채팅 앱 빠른 시작**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2장 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 외부 |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5장 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 외부 |  
| [**Contoso 채팅 RAG**](https://github.com/Azure-Samples/contoso-chat) | 8장 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | 외부 |  
| [**Retail 다중 에이전트 솔루션**](examples/retail-scenario.md) | 5장 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | <strong>로컬</strong> |  

### 추천: 완성된 학습 시나리오  
**학습 챕터에 매핑된 프로덕션 준비 애플리케이션 템플릿**  

| 템플릿 | 학습 챕터 | 복잡도 | 주요 학습 내용 |  
|----------|------------------|------------|--------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2장 | ⭐ | 기본 AI 배포 패턴 |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2장 | ⭐⭐ | Azure AI Search를 이용한 RAG 구현 |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4장 | ⭐⭐ | 문서 인텔리전스 통합 |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5장 | ⭐⭐⭐ | 에이전트 프레임워크 및 함수 호출 |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8장 | ⭐⭐⭐ | 엔터프라이즈 AI 조율 |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5장 | ⭐⭐⭐⭐ | 고객 및 재고 에이전트를 갖춘 다중 에이전트 아키텍처 |  

### 유형별 학습 예제  

> **📌 로컬 vs. 외부 예제:**  
> **로컬 예제** (이 저장소 내) = 바로 사용 가능  
> **외부 예제** (Azure 샘플) = 연결된 저장소에서 클론 가능  

#### 로컬 예제 (즉시 사용 가능)  
- [**Retail 다중 에이전트 솔루션**](examples/retail-scenario.md) - ARM 템플릿을 사용한 완전한 프로덕션 구현  
  - 다중 에이전트 아키텍처 (고객 + 재고 에이전트)  
  - 종합 모니터링 및 평가  
  - ARM 템플릿 통한 원클릭 배포  

#### 로컬 예제 - 컨테이너 애플리케이션 (2-5장)  
**이 저장소에 있는 종합 컨테이너 배포 예제:**  
- [**컨테이너 앱 예제**](examples/container-app/README.md) - 컨테이너화된 배포 완전 가이드  
  - [간단한 Flask API](../../examples/container-app/simple-flask-api) - 스케일-투-제로를 지원하는 기본 REST API  
  - [마이크로서비스 아키텍처](../../examples/container-app/microservices) - 프로덕션 준비 다중 서비스 배포  
  - 빠른 시작, 프로덕션, 고급 배포 패턴  
  - 모니터링, 보안, 비용 최적화 안내  

#### 외부 예제 - 간단한 애플리케이션 (1-2장)  
**다음 Azure 샘플 저장소를 클론하여 시작하세요:**  
- [간단한 웹 앱 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 기본 배포 패턴  
- [정적 웹사이트 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 정적 콘텐츠 배포  
- [컨테이너 앱 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 배포  

#### 외부 예제 - 데이터베이스 통합 (3-4장)  
- [데이터베이스 앱 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 데이터베이스 연결 패턴  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 서버리스 데이터 워크플로우  

#### 외부 예제 - 고급 패턴 (4-8장)  
- [Java 마이크로서비스](https://github.com/Azure-Samples/java-microservices-aca-lab) - 다중 서비스 아키텍처  
- [컨테이너 앱 잡](https://github.com/Azure-Samples/container-apps-jobs) - 백그라운드 처리  
- [엔터프라이즈 ML 파이프라인](https://github.com/Azure-Samples/mlops-v2) - 프로덕션 준비 ML 패턴  

### 외부 템플릿 모음  
- [**공식 AZD 템플릿 갤러리**](https://azure.github.io/awesome-azd/) - 공식 및 커뮤니티 템플릿 엄선 모음  
- [**Azure Developer CLI 템플릿**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 템플릿 문서  
- [**예제 디렉터리**](examples/README.md) - 상세 설명 포함 로컬 학습 예제  

---

## 📚 학습 자료 및 참고문헌  

### 빠른 참조  
- [**명령어 치트시트**](resources/cheat-sheet.md) - 챕터별 필수 azd 명령어 정리  
- [<strong>용어집</strong>](resources/glossary.md) - Azure 및 azd 용어  
- [**자주 묻는 질문(FAQ)**](resources/faq.md) - 챕터별 자주 묻는 질문  
- [**학습 가이드**](resources/study-guide.md) - 종합 실습 문제  

### 실습 워크숍  
- [**AI 워크숍 연구실**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 솔루션 AZD 배포 가능하게 만들기 (2-3시간)  
- [**인터랙티브 워크숍**](workshop/README.md) - MkDocs 및 GitHub Codespaces를 활용한 8개 모듈 가이드 연습  
  - 도입 → 선택 → 검증 → 해체 → 구성 → 사용자 지정 → 정리 → 마무리  

### 외부 학습 자료
- [Azure 개발자 CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 가격 계산기](https://azure.microsoft.com/pricing/calculator/)
- [Azure 상태](https://status.azure.com/)

### 편집기용 AI 에이전트 스킬
- [**skills.sh의 Microsoft Azure 스킬**](https://skills.sh/microsoft/github-copilot-for-azure) - Azure AI, Foundry, 배포, 진단, 비용 최적화 등 37개의 오픈 에이전트 스킬. GitHub Copilot, Cursor, Claude Code 또는 지원되는 에이전트에 설치하세요:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 빠른 문제 해결 가이드

**초보자들이 자주 겪는 문제와 즉시 해결책:**

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
<summary><strong>❌ "구독을 찾을 수 없음" 또는 "구독이 설정되지 않음"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" 또는 "할당량 초과"</strong></summary>

```bash
# 다른 Azure 지역을 시도하세요
azd env set AZURE_LOCATION "westus2"
azd up

# 또는 개발 중에는 더 작은 SKU를 사용하세요
# infra/main.parameters.json 파일을 편집하세요:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" 중간에 실패함</strong></summary>

```bash
# 옵션 1: 정리 후 재시도
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
<summary><strong>❌ "리소스가 이미 존재함" 또는 이름 충돌 문제</strong></summary>

```bash
# AZD는 고유한 이름을 생성하지만, 충돌이 발생하면:
azd down --force --purge

# 새 환경으로 다시 시도합니다
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ 템플릿 배포 시간이 너무 오래 걸림</strong></summary>

**정상 대기 시간:**
- 간단한 웹 앱: 5-10분
- 데이터베이스 있는 앱: 10-15분
- AI 애플리케이션: 15-25분 (OpenAI 프로비저닝이 느림)

```bash
# 진행 상황 확인
azd show

# 30분 이상 멈춘 경우, Azure 포털을 확인하세요:
azd monitor
# 실패한 배포를 찾아보세요
```
</details>

<details>
<summary><strong>❌ "권한 거부" 또는 "금지됨"</strong></summary>

```bash
# Azure 역할을 확인하세요
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 최소한 "기여자(Contributor)" 역할이 필요합니다
# Azure 관리자에게 다음 권한 부여를 요청하세요:
# - 기여자(리소스용)
# - 사용자 액세스 관리자(역할 할당용)
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
# *_URL 변수 찾기
```
</details>

### 📚 전체 문제 해결 자료

- **일반 문제 가이드:** [상세 해결책](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 관련 문제:** [AI 문제 해결](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **디버깅 가이드:** [단계별 디버깅](docs/chapter-07-troubleshooting/debugging.md)
- **도움 받기:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 과정 완료 및 인증

### 진행 상황 추적
각 챕터별 학습 진행 상황을 추적하세요:

- [ ] **1장**: 기초 및 빠른 시작 ✅
- [ ] **2장**: AI 우선 개발 ✅  
- [ ] **3장**: 구성 및 인증 ✅
- [ ] **4장**: 코드형 인프라 및 배포 ✅
- [ ] **5장**: 다중 에이전트 AI 솔루션 ✅
- [ ] **6장**: 사전 배포 검증 및 계획 ✅
- [ ] **7장**: 문제 해결 및 디버깅 ✅
- [ ] **8장**: 운영 및 엔터프라이즈 패턴 ✅

### 학습 검증
각 챕터 완료 후 지식을 검증하려면:
1. **실습 수행**: 챕터별 실습 배포 완료
2. **지식 확인**: 챕터의 FAQ 섹션 검토
3. **커뮤니티 토론**: Azure Discord에서 경험 공유
4. **다음 챕터**: 다음 난이도 단계로 이동

### 과정 완료 혜택
모든 챕터를 완료하면 다음을 얻을 수 있습니다:
- **실무 경험**: Azure에 실제 AI 애플리케이션 배포
- **전문 기술**: 엔터프라이즈 수준 배포 능력  
- **커뮤니티 인정**: Azure 개발자 커뮤니티의 활동 멤버
- **진로 발전**: 수요 높은 AZD 및 AI 배포 전문성

---

## 🤝 커뮤니티 및 지원

### 도움 및 지원 받기
- **기술 문제**: [버그 신고 및 기능 요청](https://github.com/microsoft/azd-for-beginners/issues)
- **학습 질문**: [Microsoft Azure Discord 커뮤니티](https://discord.gg/microsoft-azure) 및 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 관련 도움**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) 참여
- <strong>문서</strong>: [공식 Azure 개발자 CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord의 커뮤니티 의견

**#Azure 채널 최근 설문 결과:**
- 개발자의 <strong>45%</strong>가 AI 워크로드에 AZD 사용 희망
- **주요 어려움**: 다중 서비스 배포, 자격 증명 관리, 운영 준비  
- **최다 요청**: AI 전용 템플릿, 문제 해결 가이드, 모범 사례

**우리 커뮤니티에 참여하여:**
- AZD + AI 경험 공유 및 도움 받기
- 새로운 AI 템플릿 얼리 프리뷰 접근
- AI 배포 모범 사례 기여
- 미래 AI + AZD 기능 개발에 영향력 행사

### 과정 기여 안내
기여를 환영합니다! 자세한 내용은 [기여 안내서](CONTRIBUTING.md)를 확인하세요:
- **콘텐츠 개선**: 기존 챕터 및 예제 향상
- **새 예제 추가**: 실제 시나리오 및 템플릿 제공  
- <strong>번역</strong>: 다국어 지원 유지 보수
- **버그 리포트**: 정확성과 명확성 향상
- **커뮤니티 기준**: 포용적 커뮤니티 지침 준수

---

## 📄 과정 정보

### 라이선스
이 프로젝트는 MIT 라이선스 하에 배포됩니다 - 자세한 내용은 [LICENSE](../../LICENSE) 파일 참조.

### 관련 Microsoft 학습 자료

우리 팀이 제공하는 다른 포괄적 학습 과정:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / 에이전트
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### 생성 AI 시리즈
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

## 🗺️ 코스 내비게이션

**🚀 학습을 시작할 준비가 되셨나요?**

<strong>초보자</strong>: [1장: 기초 및 빠른 시작](#-chapter-1-foundation--quick-start)부터 시작하세요  
**AI 개발자**: [2장: AI 우선 개발](#-chapter-2-ai-first-development-recommended-for-ai-developers)으로 바로 이동하세요  
**경험 많은 개발자**: [3장: 구성 및 인증](#️-chapter-3-configuration--authentication)부터 시작하세요

**다음 단계**: [1장 시작 - AZD 기초](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역에는 오류나 부정확성이 있을 수 있음을 알려드립니다. 원본 문서는 해당 언어의 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->