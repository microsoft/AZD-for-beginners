# 초보자를 위한 AZD: 체계적인 학습 여정

![AZD-for-beginners](../../translated_images/ko/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### 자동 번역 (항상 최신 상태)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[아랍어](../ar/README.md) | [벵골어](../bn/README.md) | [불가리아어](../bg/README.md) | [버마어 (미얀마)](../my/README.md) | [중국어 (간체)](../zh-CN/README.md) | [중국어 (번체, 홍콩)](../zh-HK/README.md) | [중국어 (번체, 마카오)](../zh-MO/README.md) | [중국어 (번체, 대만)](../zh-TW/README.md) | [크로아티아어](../hr/README.md) | [체코어](../cs/README.md) | [덴마크어](../da/README.md) | [네덜란드어](../nl/README.md) | [에스토니아어](../et/README.md) | [핀란드어](../fi/README.md) | [프랑스어](../fr/README.md) | [독일어](../de/README.md) | [그리스어](../el/README.md) | [히브리어](../he/README.md) | [힌디어](../hi/README.md) | [헝가리어](../hu/README.md) | [인도네시아어](../id/README.md) | [이탈리아어](../it/README.md) | [일본어](../ja/README.md) | [칸나다어](../kn/README.md) | [한국어](./README.md) | [리투아니아어](../lt/README.md) | [말레이어](../ms/README.md) | [말라얄람어](../ml/README.md) | [마라티어](../mr/README.md) | [네팔어](../ne/README.md) | [나이지리아 피징어](../pcm/README.md) | [노르웨이어](../no/README.md) | [페르시아어 (파르시)](../fa/README.md) | [폴란드어](../pl/README.md) | [포르투갈어 (브라질)](../pt-BR/README.md) | [포르투갈어 (포르투갈)](../pt-PT/README.md) | [펀자브어 (구르무키)](../pa/README.md) | [루마니아어](../ro/README.md) | [러시아어](../ru/README.md) | [세르비아어 (키릴문자)](../sr/README.md) | [슬로바키아어](../sk/README.md) | [슬로베니아어](../sl/README.md) | [스페인어](../es/README.md) | [스와힐리어](../sw/README.md) | [스웨덴어](../sv/README.md) | [타갈로그어 (필리핀어)](../tl/README.md) | [타밀어](../ta/README.md) | [텔루구어](../te/README.md) | [태국어](../th/README.md) | [터키어](../tr/README.md) | [우크라이나어](../uk/README.md) | [우르두어](../ur/README.md) | [베트남어](../vi/README.md)

> **로컬에서 클론하는 것을 선호하시나요?**

> 이 저장소에는 50개 이상의 언어 번역이 포함되어 있어 다운로드 용량이 크게 증가합니다. 번역 없이 클론하려면 sparse checkout을 사용하세요:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 이 방법은 훨씬 빠른 다운로드로 코스를 완료하는 데 필요한 모든 것을 제공합니다.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd)란?

**Azure Developer CLI (azd)**는 개발자 친화적인 커맨드 라인 도구로, 애플리케이션을 Azure에 간편하게 배포할 수 있게 해줍니다. 수십 개의 Azure 리소스를 수동으로 만들고 연결하는 대신 단일 명령어로 전체 애플리케이션을 배포할 수 있습니다.

### `azd up` 커맨드의 마법

```bash
# 이 단일 명령어로 모든 작업을 수행합니다:
# ✅ 모든 Azure 리소스를 생성합니다
# ✅ 네트워킹과 보안을 구성합니다
# ✅ 애플리케이션 코드를 빌드합니다
# ✅ Azure에 배포합니다
# ✅ 작동하는 URL을 제공합니다
azd up
```

**그게 다입니다!** Azure 포털 클릭, 복잡한 ARM 템플릿을 배우거나 수동으로 구성할 필요 없이 바로 작동하는 애플리케이션이 Azure에 배포됩니다.

---

## ❓ Azure Developer CLI와 Azure CLI의 차이점은?

초보자들이 가장 많이 묻는 질문입니다. 간단한 답변은 다음과 같습니다:

| 기능 | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **목적** | 개별 Azure 리소스 관리 | 완전한 애플리케이션 배포 |
| **관점** | 인프라 중심 | 애플리케이션 중심 |
| **예시** | `az webapp create --name myapp...` | `azd up` |
| **학습 곡선** | Azure 서비스 이해 필요 | 애플리케이션만 알면 됨 |
| **적합 대상** | DevOps, 인프라 | 개발자, 프로토타이핑 |

### 간단한 비유

- **Azure CLI**는 집을 짓기 위한 모든 도구(망치, 톱, 못 등)를 갖춘 것과 같습니다. 뭐든지 만들 수 있지만 건축 지식을 알아야 합니다.
- **Azure Developer CLI**는 계약자를 고용하는 것과 같습니다. 원하는 것을 설명하면 그들이 건물을 지어줍니다.

### 언제 어떤 것을 사용할까?

| 상황 | 사용하기 |
|----------|----------|
| "웹 앱을 빠르게 배포하고 싶다" | `azd up` |
| "저장소 계정 하나만 만들고 싶다" | `az storage account create` |
| "완전한 AI 애플리케이션을 만들고 있다" | `azd init --template azure-search-openai-demo` |
| "특정 Azure 리소스를 디버깅해야 한다" | `az resource show` |
| "몇 분 내에 프로덕션 배포가 필요하다" | `azd up --environment production` |

### 두 도구는 함께 작동합니다!

AZD는 내부적으로 Azure CLI를 사용합니다. 두 도구를 모두 사용할 수 있습니다:
```bash
# AZD로 앱을 배포하세요
azd up

# 그런 다음 Azure CLI로 특정 리소스를 미세 조정하세요
az webapp config set --name myapp --always-on true
```

---

## 🌟 Amazing AZD에서 템플릿 찾기

처음부터 시작하지 마세요! **Amazing AZD**는 커뮤니티에서 준비한 즉시 배포 가능한 템플릿 모음입니다:

| 리소스 | 설명 |
|----------|-------------|
| 🔗 [**Amazing AZD 갤러리**](https://azure.github.io/awesome-azd/) | 200개 이상의 템플릿을 원클릭 배포 |
| 🔗 [**템플릿 제출하기**](https://github.com/Azure/awesome-azd/issues) | 여러분의 템플릿을 커뮤니티에 기여하기 |
| 🔗 [**GitHub 저장소**](https://github.com/Azure/awesome-azd) | 소스 코드 탐색 및 스타 표시 |

### Amazing AZD의 인기 AI 템플릿

```bash
# Azure OpenAI와 AI Search를 사용하는 RAG 채팅
azd init --template azure-search-openai-demo

# 빠른 AI 채팅 애플리케이션
azd init --template openai-chat-app-quickstart

# Foundry Agents와 함께하는 AI 에이전트
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

**🎉 완료!** 이제 애플리케이션이 Azure에서 라이브 상태입니다.

### 정리하기 (잊지 마세요!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 이 코스 활용법

이 과정은 **점진적인 학습**을 위해 설계되었습니다 - 편한 곳에서 시작해 점차 진행하세요:

| 경험 수준 | 시작 위치 |
|-----------------|------------|
| **Azure가 처음인 분** | [1장: 기초](../..) |
| **Azure는 알지만 AZD는 처음인 분** | [1장: 기초](../..) |
| **AI 앱을 배포하고 싶은 분** | [2장: AI 우선 개발](../..) |
| **실습 중심을 선호하는 분** | [🎓 인터랙티브 워크숍](workshop/README.md) - 3~4시간 가이드 실습 |
| **프로덕션 패턴이 필요한 분** | [8장: 프로덕션 및 엔터프라이즈](../..) |

### 빠른 시작

1. **이 저장소 포크하기**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **클론하기**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **도움 받기**: [Azure Discord 커뮤니티](https://discord.com/invite/ByRwuEEgH4)

> **로컬에서 클론하는 것을 선호하시나요?**

> 이 저장소에는 50개 이상의 언어 번역이 포함되어 있어 다운로드 용량이 크게 증가합니다. 번역 없이 클론하려면 sparse checkout을 사용하세요:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 이렇게 하면 훨씬 빠른 다운로드로 코스를 완료하는 데 필요한 모든 것을 얻을 수 있습니다.


## 코스 개요

점진적인 학습을 목표로 구성된 챕터를 통해 Azure Developer CLI (azd)를 마스터하십시오. **특히 Microsoft Foundry 통합을 통한 AI 애플리케이션 배포에 중점.**

### 이 코스가 현대 개발자에게 중요한 이유

Microsoft Foundry Discord 커뮤니티의 인사이트에 따르면, **45%의 개발자가 AI 워크로드에 AZD를 사용하고 싶어하지만** 다음과 같은 문제에 직면하고 있습니다:
- 복잡한 다중 서비스 AI 아키텍처
- 프로덕션 AI 배포 모범 사례  
- Azure AI 서비스 통합 및 구성
- AI 워크로드 비용 최적화
- AI 관련 배포 문제 해결

### 학습 목표

이 구조화된 과정을 완료하면:
- **AZD 기본기 마스터**: 핵심 개념, 설치 및 구성
- **AI 애플리케이션 배포**: Microsoft Foundry 서비스와 함께 AZD 활용
- **인프라 코드 구현**: Bicep 템플릿으로 Azure 리소스 관리
- **배포 문제 해결**: 일반 문제 진단 및 디버깅
- **프로덕션 최적화**: 보안, 확장, 모니터링 및 비용 관리
- **다중 에이전트 솔루션 구축**: 복잡한 AI 아키텍처 배포

## 🗺️ 코스 맵: 챕터별 빠른 이동

각 챕터는 학습 목표, 빠른 시작, 연습 문제를 포함한 전용 README가 있습니다:

| 챕터 | 주제 | 학습 내용 | 소요 시간 | 난이도 |
|---------|-------|---------|----------|------------|
| **[1장: 기초](docs/chapter-01-foundation/README.md)** | 시작하기 | [AZD 기본](docs/chapter-01-foundation/azd-basics.md) &#124; [설치](docs/chapter-01-foundation/installation.md) &#124; [첫 프로젝트](docs/chapter-01-foundation/first-project.md) | 30-45분 | ⭐ |
| **[2장: AI 개발](docs/chapter-02-ai-development/README.md)** | AI 우선 앱 | [Foundry 통합](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI 에이전트](docs/chapter-02-ai-development/agents.md) &#124; [모델 배포](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [워크숍](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2시간 | ⭐⭐ |
| **[3장: 구성](docs/chapter-03-configuration/README.md)** | 인증 및 보안 | [구성](docs/chapter-03-configuration/configuration.md) &#124; [인증 및 보안](docs/chapter-03-configuration/authsecurity.md) | 45-60분 | ⭐⭐ |
| **[4장: 인프라](docs/chapter-04-infrastructure/README.md)** | IaC 및 배포 | [배포 가이드](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [프로비저닝](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5시간 | ⭐⭐⭐ |
| **[Ch 5: 멀티 에이전트](docs/chapter-05-multi-agent/README.md)** | AI 에이전트 솔루션 | [리테일 시나리오](examples/retail-scenario.md) &#124; [조정 패턴](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 시간 | ⭐⭐⭐⭐ |
| **[Ch 6: 배포 전 단계](docs/chapter-06-pre-deployment/README.md)** | 계획 및 검증 | [사전 점검](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [용량 계획](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU 선택](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [앱 인사이트](docs/chapter-06-pre-deployment/application-insights.md) | 1 시간 | ⭐⭐ |
| **[Ch 7: 문제 해결](docs/chapter-07-troubleshooting/README.md)** | 디버깅 및 수정 | [일반 문제](docs/chapter-07-troubleshooting/common-issues.md) &#124; [디버깅](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI 문제](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 시간 | ⭐⭐ |
| **[Ch 8: 프로덕션](docs/chapter-08-production/README.md)** | 엔터프라이즈 패턴 | [프로덕션 실습](docs/chapter-08-production/production-ai-practices.md) | 2-3 시간 | ⭐⭐⭐⭐ |
| **[🎓 워크숍](workshop/README.md)** | 핸즈온 실습 | [소개](workshop/docs/instructions/0-Introduction.md) &#124; [선택](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [검증](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [분해](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [설정](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [맞춤화](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [철거](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [정리](workshop/docs/instructions/7-Wrap-up.md) | 3-4 시간 | ⭐⭐ |

**총 강의 시간:** 약 10-14 시간 | **기술 수준 진척:** 초급 → 프로덕션 준비 완료

---

## 📚 학습 챕터

*경험 수준과 목표에 따라 학습 경로 선택*

### 🚀 1장: 기초 및 빠른 시작
**전제 조건**: Azure 구독, 기본 커맨드 라인 지식  
**기간**: 30-45 분  
**난이도**: ⭐

#### 학습 내용
- Azure Developer CLI 기초 이해
- 사용 중인 플랫폼에 AZD 설치
- 첫 번째 성공적인 배포

#### 학습 자료
- **🎯 시작 위치**: [Azure Developer CLI란?](../..)
- **📖 이론**: [AZD 기본](docs/chapter-01-foundation/azd-basics.md) - 핵심 개념과 용어
- **⚙️ 설치 및 설정**: [설치 및 설정](docs/chapter-01-foundation/installation.md) - 플랫폼별 가이드
- **🛠️ 실습**: [첫 번째 프로젝트](docs/chapter-01-foundation/first-project.md) - 단계별 튜토리얼
- **📋 빠른 참고**: [명령어 치트 시트](resources/cheat-sheet.md)

#### 실습 과제
```bash
# 빠른 설치 확인
azd version

# 첫 번째 애플리케이션 배포
azd init --template todo-nodejs-mongo
azd up
```

**💡 챕터 목적**: AZD를 사용하여 간단한 웹 애플리케이션을 Azure에 성공적으로 배포

**✅ 성공 평가:**
```bash
# 1장을 완료한 후, 다음을 할 수 있어야 합니다:
azd version              # 설치된 버전을 표시합니다
azd init --template todo-nodejs-mongo  # 프로젝트를 초기화합니다
azd up                  # Azure에 배포합니다
azd show                # 실행 중인 앱 URL을 표시합니다
# 애플리케이션이 브라우저에서 열리고 작동합니다
azd down --force --purge  # 리소스를 정리합니다
```

**📊 시간 투자:** 30-45 분  
**📈 완료 후 수준:** 기본 애플리케이션을 독립적으로 배포할 수 있음

**✅ 성공 평가:**
```bash
# 1장을 완료한 후에는 다음을 수행할 수 있어야 합니다:
azd version              # 설치된 버전을 표시합니다
azd init --template todo-nodejs-mongo  # 프로젝트를 초기화합니다
azd up                  # Azure에 배포합니다
azd show                # 실행 중인 앱 URL을 표시합니다
# 애플리케이션이 브라우저에서 열리고 작동합니다
azd down --force --purge  # 리소스를 정리합니다
```

**📊 시간 투자:** 30-45 분  
**📈 완료 후 수준:** 기본 애플리케이션을 독립적으로 배포할 수 있음

---

### 🤖 2장: AI 우선 개발 (AI 개발자 추천)
**전제 조건**: 1장 완료  
**기간**: 1-2 시간  
**난이도**: ⭐⭐

#### 학습 내용
- Microsoft Foundry와 AZD 통합
- AI 기반 애플리케이션 배포
- AI 서비스 구성 이해

#### 학습 자료
- **🎯 시작 위치**: [Microsoft Foundry 통합](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI 에이전트**: [AI 에이전트 가이드](docs/chapter-02-ai-development/agents.md) - AZD로 지능형 에이전트 배포
- **📖 패턴**: [AI 모델 배포](docs/chapter-02-ai-development/ai-model-deployment.md) - AI 모델 배포 및 관리
- **🛠️ 워크숍**: [AI 워크숍 실습](docs/chapter-02-ai-development/ai-workshop-lab.md) - AZD 준비된 AI 솔루션 구성
- **🎥 인터랙티브 가이드**: [워크숍 자료](workshop/README.md) - MkDocs 기반 브라우저 학습 * DevContainer 환경
- **📋 템플릿**: [Microsoft Foundry 템플릿](../..)
- **📝 예제**: [AZD 배포 예제](examples/README.md)

#### 실습 과제
```bash
# 첫 번째 AI 애플리케이션 배포하기
azd init --template azure-search-openai-demo
azd up

# 추가 AI 템플릿 시도하기
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 챕터 목적**: RAG 기능이 포함된 AI 지원 채팅 애플리케이션 배포 및 구성

**✅ 성공 평가:**
```bash
# 2장을 마치면 다음을 할 수 있어야 합니다:
azd init --template azure-search-openai-demo
azd up
# AI 채팅 인터페이스를 테스트하세요
# 질문을 하고 출처가 있는 AI 기반 응답을 받으세요
# 검색 통합이 작동하는지 확인하세요
azd monitor  # Application Insights가 원격 측정을 표시하는지 확인하세요
azd down --force --purge
```

**📊 시간 투자:** 1-2 시간  
**📈 완료 후 수준:** 프로덕션 준비된 AI 애플리케이션을 배포 및 구성할 수 있음  
**💰 비용 인식:** 월 $80-150 개발 비용, $300-3500 프로덕션 비용 이해

#### 💰 AI 배포 비용 고려사항

**개발 환경 (예상 월 $80-150):**
- Azure OpenAI (종량제): 월 $0-50 (토큰 사용량 기준)
- AI 검색 (기본 등급): 월 $75
- 컨테이너 앱 (소비 모델): 월 $0-20
- 스토리지 (표준): 월 $1-5

**프로덕션 환경 (예상 월 $300-3,500 이상):**
- Azure OpenAI (일관된 성능 위한 PTU): 월 $3,000 이상 또는 고용량 종량제
- AI 검색 (표준 등급): 월 $250
- 컨테이너 앱 (전용): 월 $50-100
- 애플리케이션 인사이트: 월 $5-50
- 스토리지 (프리미엄): 월 $10-50

**💡 비용 최적화 팁:**
- 학습용으로 **무료 등급** Azure OpenAI 사용 (월 50,000 토큰 포함)
- 개발 중이 아닐 때 `azd down`으로 리소스 할당 해제
- 처음에는 소비 기반 청구를 사용하고 프로덕션에서만 PTU로 업그레이드
- 배포 전 `azd provision --preview`로 비용 추정
- 자동 확장 활성화: 실제 사용량에 대해서만 비용 지불

**비용 모니터링:**
```bash
# 예상 월간 비용 확인
azd provision --preview

# Azure 포털에서 실제 비용 모니터링
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 3장: 구성 및 인증
**전제 조건**: 1장 완료  
**기간**: 45-60 분  
**난이도**: ⭐⭐

#### 학습 내용
- 환경 구성 및 관리
- 인증 및 보안 모범 사례
- 리소스 네이밍과 조직화

#### 학습 자료
- **📖 구성**: [구성 가이드](docs/chapter-03-configuration/configuration.md) - 환경 설정
- **🔐 보안**: [인증 패턴과 관리형 ID](docs/chapter-03-configuration/authsecurity.md) - 인증 패턴
- **📝 예제**: [데이터베이스 앱 예제](examples/database-app/README.md) - AZD 데이터베이스 예제

#### 실습 과제
- 여러 환경(dev, staging, prod) 구성
- 관리형 ID 인증 설정
- 환경별 구성 적용

**💡 챕터 목적**: 올바른 인증과 보안으로 다중 환경 관리

---

### 🏗️ 4장: 코드형 인프라 & 배포
**전제 조건**: 1-3장 완료  
**기간**: 1-1.5 시간  
**난이도**: ⭐⭐⭐

#### 학습 내용
- 고급 배포 패턴
- Bicep을 이용한 코드형 인프라
- 리소스 프로비저닝 전략

#### 학습 자료
- **📖 배포**: [배포 가이드](docs/chapter-04-infrastructure/deployment-guide.md) - 완전한 워크플로우
- **🏗️ 프로비저닝**: [리소스 프로비저닝](docs/chapter-04-infrastructure/provisioning.md) - Azure 리소스 관리
- **📝 예제**: [컨테이너 앱 예제](../../examples/container-app) - 컨테이너화된 배포

#### 실습 과제
- 맞춤형 Bicep 템플릿 작성
- 다중 서비스 애플리케이션 배포
- 블루-그린 배포 전략 구현

**💡 챕터 목적**: 맞춤형 인프라 템플릿으로 복잡한 다중 서비스 앱 배포

---

### 🎯 5장: 멀티 에이전트 AI 솔루션 (고급)
**전제 조건**: 1-2장 완료  
**기간**: 2-3 시간  
**난이도**: ⭐⭐⭐⭐

#### 학습 내용
- 멀티 에이전트 아키텍처 패턴
- 에이전트 오케스트레이션 및 조정
- 프로덕션 준비된 AI 배포

#### 학습 자료
- **🤖 주요 프로젝트**: [리테일 멀티 에이전트 솔루션](examples/retail-scenario.md) - 완전 구현
- **🛠️ ARM 템플릿**: [ARM 템플릿 패키지](../../examples/retail-multiagent-arm-template) - 원클릭 배포
- **📖 아키텍처**: [멀티 에이전트 조정 패턴](docs/chapter-06-pre-deployment/coordination-patterns.md) - 패턴

#### 실습 과제
```bash
# 완전한 소매 다중 에이전트 솔루션 배포
cd examples/retail-multiagent-arm-template
./deploy.sh

# 에이전트 구성을 탐색하기
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 챕터 목적**: 고객 및 재고 에이전트를 포함하는 프로덕션 준비 멀티 에이전트 AI 솔루션 배포 및 관리

---

### 🔍 6장: 배포 전 검증 및 계획
**전제 조건**: 4장 완료  
**기간**: 1 시간  
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
- 비용 최적화를 위한 SKU 선택
- 자동화된 사전 배포 점검 구현

**💡 챕터 목적**: 실행 전 배포 검증 및 최적화

---

### 🚨 7장: 문제 해결 및 디버깅
**전제 조건**: 배포 중 한 장 완료  
**기간**: 1-1.5 시간  
**난이도**: ⭐⭐

#### 학습 내용
- 체계적인 디버깅 접근법
- 흔한 문제 및 해결책
- AI 관련 문제 해결

#### 학습 자료
- **🔧 일반 문제**: [일반 문제](docs/chapter-07-troubleshooting/common-issues.md) - FAQ 및 해결책
- **🕵️ 디버깅**: [디버깅 가이드](docs/chapter-07-troubleshooting/debugging.md) - 단계별 전략
- **🤖 AI 문제**: [AI 특정 문제 해결](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI 서비스 문제

#### 실습 과제
- 배포 실패 진단
- 인증 문제 해결
- AI 서비스 연결 문제 디버깅

**💡 챕터 목적**: 주요 배포 문제를 독립적으로 진단하고 해결

---

### 🏢 8장: 프로덕션 및 엔터프라이즈 패턴
**전제 조건**: 1-4장 완료  
**기간**: 2-3 시간  
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
- 엔터프라이즈 보안 패턴 구현
- 종합 모니터링 설정
- 적절한 거버넌스 하에 프로덕션 배포

**💡 챕터 목적**: 완전한 프로덕션 기능을 갖춘 엔터프라이즈 준비 애플리케이션 배포

---

## 🎓 워크숍 개요: 실습 학습 경험

> **⚠️ 워크숍 상태: 활성 개발 중**  
> 워크숍 자료는 현재 개발 및 개선 중입니다. 핵심 모듈은 작동하지만 일부 고급 부분은 완료되지 않았습니다. 모든 콘텐츠 완성을 위해 적극 작업 중입니다. [진행 상황 추적 →](workshop/README.md)

### 인터랙티브 워크숍 자료
**브라우저 기반 도구와 안내된 실습이 포함된 종합 학습 자료**
우리 워크숍 자료는 위의 장별 커리큘럼을 보완하는 체계적이고 인터랙티브한 학습 경험을 제공합니다. 이 워크숍은 자기 주도 학습과 강사 주도 세션 모두에 적합하도록 설계되었습니다.

#### 🛠️ 워크숍 특징
- **브라우저 기반 인터페이스**: 검색, 복사, 테마 기능을 갖춘 MkDocs 기반 워크숍 완성
- **GitHub Codespaces 통합**: 원클릭 개발 환경 설정
- **구조화된 학습 경로**: 8개 모듈의 단계별 연습(총 3-4시간)
- **진행식 방법론**: 소개 → 선택 → 검증 → 분해 → 구성 → 맞춤화 → 해체 → 마무리
- **인터랙티브 DevContainer 환경**: 사전 구성된 도구 및 종속성 제공

#### 📚 워크숍 모듈 구성
워크숍은 발견부터 배포 마스터까지 안내하는 **8개 모듈 진행식 방법론**을 따릅니다:

| 모듈 | 주제 | 수행 내용 | 소요 시간 |
|--------|-------|----------------|----------|
| **0. 소개** | 워크숍 개요 | 학습 목표, 전제 조건 및 워크숍 구조 이해 | 15분 |
| **1. 선택** | 템플릿 탐색 | AZD 템플릿을 살펴보고 시나리오에 적합한 AI 템플릿 선택 | 20분 |
| **2. 검증** | 배포 및 확인 | `azd up`으로 템플릿 배포 및 인프라 작동 확인 | 30분 |
| **3. 분해** | 구조 이해 | GitHub Copilot을 활용해 템플릿 아키텍처, Bicep 파일, 코드 구성 탐색 | 30분 |
| **4. 구성** | azure.yaml 심층 분석 | `azure.yaml` 구성, 라이프사이클 훅, 환경 변수 익히기 | 30분 |
| **5. 맞춤화** | 나만의 맞춤형 제작 | AI 검색, 추적, 평가 활성화 및 시나리오 맞춤화 | 45분 |
| **6. 해체** | 정리 작업 | `azd down --purge`로 안전하게 리소스 정리 | 15분 |
| **7. 마무리** | 다음 단계 | 달성 내용 검토, 주요 개념 요약 및 학습 여정 계속 | 15분 |

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
# 저장소에서 "Code" → "main에서 codespace 생성"을 클릭하세요

# 옵션 2: 로컬 개발
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md에 있는 설정 지침을 따르세요
```
  
#### 🎯 워크숍 학습 성과  
워크숍을 완료하면 참가자는 다음을 할 수 있습니다:  
- **프로덕션 AI 애플리케이션 배포**: Microsoft Foundry 서비스와 함께 AZD 사용  
- **다중 에이전트 아키텍처 마스터**: 협력 AI 에이전트 솔루션 구현  
- **보안 모범 사례 구현**: 인증 및 접근 제어 구성  
- **규모에 맞게 최적화**: 비용 효율적이고 성능 뛰어난 배포 설계  
- **배포 문제 해결**: 일반적인 문제를 독립적으로 해결  

#### 📖 워크숍 자료
- **🎥 인터랙티브 가이드**: [워크숍 자료](workshop/README.md) - 브라우저 기반 학습 환경  
- **📋 모듈별 지침**:
  - [0. 소개](workshop/docs/instructions/0-Introduction.md) - 워크숍 개요 및 목표  
  - [1. 선택](workshop/docs/instructions/1-Select-AI-Template.md) - AI 템플릿 찾기 및 선택  
  - [2. 검증](workshop/docs/instructions/2-Validate-AI-Template.md) - 템플릿 배포 및 확인  
  - [3. 분해](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - 템플릿 아키텍처 탐색  
  - [4. 구성](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml 마스터  
  - [5. 맞춤화](workshop/docs/instructions/5-Customize-AI-Template.md) - 시나리오 맞춤화  
  - [6. 해체](workshop/docs/instructions/6-Teardown-Infrastructure.md) - 리소스 정리  
  - [7. 마무리](workshop/docs/instructions/7-Wrap-up.md) - 검토 및 다음 단계  
- **🛠️ AI 워크숍 실습실**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 중심 연습  
- **💡 빠른 시작**: [워크숍 설정 가이드](workshop/README.md#quick-start) - 환경 구성  

**적합 대상**: 기업 교육, 대학 강의, 자기 주도 학습, 개발자 부트캠프.

---

## 📖 심층 분석: AZD 기능

기본을 넘어서 AZD는 프로덕션 배포를 위한 강력한 기능을 제공합니다:

- **템플릿 기반 배포** - 일반 애플리케이션 패턴을 위한 사전 제작 템플릿 사용  
- **코드로서의 인프라** - Bicep 또는 Terraform 사용해 Azure 리소스 관리  
- **통합 워크플로우** - 애플리케이션 프로비저닝, 배포, 모니터링 무결성 제공  
- **개발자 친화적** - 개발자 생산성과 경험 최적화  

### **AZD + Microsoft Foundry: AI 배포에 완벽한 조합**

**왜 AI 솔루션에 AZD인가?** AZD는 AI 개발자가 직면하는 주요 과제를 해결합니다:

- **AI 준비된 템플릿** - Azure OpenAI, Cognitive Services, ML 워크로드용 사전 구성 템플릿  
- **안전한 AI 배포** - AI 서비스, API 키, 모델 엔드포인트용 내장 보안 패턴  
- **프로덕션 AI 패턴** - 확장 가능하고 비용 효율적인 AI 앱 배포 모범 사례  
- **엔드 투 엔드 AI 워크플로우** - 모델 개발부터 프로덕션 배포 및 적절한 모니터링  
- **비용 최적화** - AI 워크로드를 위한 스마트 리소스 할당과 스케일링 전략  
- **Microsoft Foundry 통합** - Microsoft Foundry 모델 카탈로그 및 엔드포인트와 원활한 연결  

---

## 🎯 템플릿 및 예제 라이브러리

### 추천: Microsoft Foundry 템플릿  
**AI 애플리케이션 배포 시 여기를 시작하세요!**

> **참고:** 이 템플릿들은 다양한 AI 패턴을 보여줍니다. 일부는 외부 Azure 샘플이고, 일부는 로컬 구현입니다.

| 템플릿 | 장 | 난이도 | 서비스 | 유형 |
|----------|---------|------------|----------|------|
| [**AI 채팅 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2장 | ⭐⭐ | AzureOpenAI + Azure AI 모델 추론 API + Azure AI 검색 + Azure Container Apps + Application Insights | 외부 |
| [**AI 에이전트 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2장 | ⭐⭐ | Foundry 에이전트 + AzureOpenAI + Azure AI 검색 + Azure Container Apps + Application Insights | 외부 |
| [**Azure Search + OpenAI 데모**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2장 | ⭐⭐ | AzureOpenAI + Azure AI 검색 + App Service + 스토리지 | 외부 |
| [**OpenAI 채팅 앱 빠른 시작**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2장 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 외부 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5장 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 외부 |
| [**컨토소 채팅 RAG**](https://github.com/Azure-Samples/contoso-chat) | 8장 | ⭐⭐⭐⭐ | AzureOpenAI + AI 검색 + Cosmos DB + Container Apps | 외부 |
| [**소매 다중 에이전트 솔루션**](examples/retail-scenario.md) | 5장 | ⭐⭐⭐⭐ | AzureOpenAI + AI 검색 + 스토리지 + Container Apps + Cosmos DB | **로컬** |

### 추천: 완성된 학습 시나리오  
**학습 장과 매핑된 프로덕션 준비 애플리케이션 템플릿**

| 템플릿 | 학습 장 | 난이도 | 주요 학습 내용 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2장 | ⭐ | 기본 AI 배포 패턴 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2장 | ⭐⭐ | Azure AI 검색과 RAG 구현 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4장 | ⭐⭐ | 문서 인텔리전스 통합 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5장 | ⭐⭐⭐ | 에이전트 프레임워크 및 함수 호출 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8장 | ⭐⭐⭐ | 기업 AI 오케스트레이션 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5장 | ⭐⭐⭐⭐ | 고객 및 재고 에이전트 기반 다중 에이전트 아키텍처 |

### 유형별 학습 예제

> **📌 로컬 vs. 외부 예제:**  
> **로컬 예제** (본 저장소 내) = 즉시 사용 가능  
> **외부 예제** (Azure Samples) = 연결된 저장소에서 클론

#### 로컬 예제 (즉시 사용 가능)
- [**소매 다중 에이전트 솔루션**](examples/retail-scenario.md) - ARM 템플릿 기반 완성된 프로덕션 구현  
  - 다중 에이전트 아키텍처 (고객 + 재고 에이전트)  
  - 종합 모니터링 및 평가  
  - ARM 템플릿을 통한 원클릭 배포  

#### 로컬 예제 - 컨테이너 애플리케이션 (2-5장)
**본 저장소 내 종합 컨테이너 배포 예제:**  
- [**컨테이너 앱 예제**](examples/container-app/README.md) - 컨테이너화 배포 완전 가이드  
  - [간단한 Flask API](../../examples/container-app/simple-flask-api) - 기본 REST API 및 스케일 투 제로  
  - [마이크로서비스 아키텍처](../../examples/container-app/microservices) - 프로덕션급 멀티서비스 배포  
  - 빠른 시작, 프로덕션, 고급 배포 패턴  
  - 모니터링, 보안, 비용 최적화 지침  

#### 외부 예제 - 간단 애플리케이션 (1-2장)
**시작을 위한 Azure Samples 저장소 클론:**  
- [단순 웹 앱 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 기본 배포 패턴  
- [정적 웹사이트 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 정적 콘텐츠 배포  
- [컨테이너 앱 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 배포  

#### 외부 예제 - 데이터베이스 통합 (3-4장)  
- [데이터베이스 앱 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 데이터베이스 연결 패턴  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 서버리스 데이터 워크플로우  

#### 외부 예제 - 고급 패턴 (4-8장)
- [Java 마이크로서비스](https://github.com/Azure-Samples/java-microservices-aca-lab) - 멀티서비스 아키텍처  
- [컨테이너 앱 작업](https://github.com/Azure-Samples/container-apps-jobs) - 백그라운드 처리  
- [기업 ML 파이프라인](https://github.com/Azure-Samples/mlops-v2) - 프로덕션급 ML 패턴  

### 외부 템플릿 모음
- [**공식 AZD 템플릿 갤러리**](https://azure.github.io/awesome-azd/) - 공식 및 커뮤니티 템플릿 큐레이션  
- [**Azure Developer CLI 템플릿**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 템플릿 문서  
- [**예제 디렉터리**](examples/README.md) - 로컬 학습 예제 및 상세 설명  

---

## 📚 학습 자료 및 참고문헌

### 빠른 참조
- [**명령어 치트시트**](resources/cheat-sheet.md) - 장별로 정리된 필수 azd 명령어  
- [**용어집**](resources/glossary.md) - Azure 및 azd 용어  
- [**자주 묻는 질문(FAQ)**](resources/faq.md) - 학습 장별 흔한 질문  
- [**학습 가이드**](resources/study-guide.md) - 종합 실습 문제  

### 실습 워크숍
- [**AI 워크숍 실습실**](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI 솔루션을 AZD 배포 가능하게 만들기 (2-3시간)  
- [**인터랙티브 워크숍**](workshop/README.md) - MkDocs 및 GitHub Codespaces를 활용한 8개 모듈 안내 연습  
  - 진행 순서: 소개 → 선택 → 검증 → 분해 → 구성 → 맞춤화 → 해체 → 마무리  

### 외부 학습 자료
- [Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure 가격 계산기](https://azure.microsoft.com/pricing/calculator/)  
- [Azure 상태](https://status.azure.com/)  

---

## 🔧 빠른 문제 해결 가이드

**초보자가 자주 겪는 문제 및 즉각 해결책:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" 또는 "Quota exceeded"</strong></summary>

```bash
# 다른 Azure 지역을 시도하세요
azd env set AZURE_LOCATION "westus2"
azd up

# 또는 개발 시 더 작은 SKU를 사용하세요
# infra/main.parameters.json 파일을 편집하세요:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up"가 중간에 실패할 때</strong></summary>
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
# 다시 인증하기
az logout
az login

azd auth logout
azd auth login

# 인증 확인하기
az account show
```
</details>

<details>
<summary><strong>❌ "리소스가 이미 존재" 또는 이름 충돌</strong></summary>

```bash
# AZD는 고유한 이름을 생성하지만, 충돌이 발생하면:
azd down --force --purge

# 새 환경으로 다시 시도합니다
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

# 30분 이상 멈추면 Azure 포털을 확인하세요:
azd monitor
# 실패한 배포를 확인하세요
```
</details>

<details>
<summary><strong>❌ "권한 거부" 또는 "금지됨"</strong></summary>

```bash
# Azure 역할을 확인하세요
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 최소한 "기여자(Contributor)" 역할이 필요합니다
# Azure 관리자에게 다음 권한 요청:
# - 기여자(Contributor) (리소스용)
# - 사용자 액세스 관리자(User Access Administrator) (역할 할당용)
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
# *_URL 변수를 찾기
```
</details>

### 📚 전체 문제해결 리소스

- **일반 문제 가이드:** [상세 솔루션](docs/chapter-07-troubleshooting/common-issues.md)
- **AI 관련 문제:** [AI 문제해결](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **디버깅 가이드:** [단계별 디버깅](docs/chapter-07-troubleshooting/debugging.md)
- **도움 받기:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 과정 완료 및 인증

### 진행 상황 추적
각 챕터별 학습 진행 상황을 추적하세요:

- [ ] **챕터 1**: 기초 및 빠른 시작 ✅
- [ ] **챕터 2**: AI 우선 개발 ✅  
- [ ] **챕터 3**: 구성 및 인증 ✅
- [ ] **챕터 4**: 코드형 인프라 및 배포 ✅
- [ ] **챕터 5**: 다중 에이전트 AI 솔루션 ✅
- [ ] **챕터 6**: 사전 배포 검증 및 계획 ✅
- [ ] **챕터 7**: 문제해결 및 디버깅 ✅
- [ ] **챕터 8**: 프로덕션 및 엔터프라이즈 패턴 ✅

### 학습 검증
각 챕터를 완료한 후, 다음으로 학습 내용을 검증하세요:
1. **실습 과제**: 챕터별 실습 배포 완료
2. **지식 확인**: 챕터별 FAQ 섹션 검토
3. **커뮤니티 토론**: Azure Discord에서 경험 공유
4. **다음 챕터 이동**: 다음 난이도 레벨로 이동

### 과정 완료 혜택
모든 챕터를 완료하면 다음을 얻게 됩니다:
- **프로덕션 경험**: 실제 AI 애플리케이션 Azure 배포 경험
- **전문성**: 엔터프라이즈 준비된 배포 역량  
- **커뮤니티 인정**: Azure 개발자 커뮤니티 활발한 회원
- **경력 발전**: 수요 높은 AZD 및 AI 배포 전문성

---

## 🤝 커뮤니티 및 지원

### 도움 및 지원 받기
- **기술 문제**: [버그 신고 및 기능 요청](https://github.com/microsoft/azd-for-beginners/issues)
- **학습 관련 질문**: [Microsoft Azure Discord 커뮤니티](https://discord.gg/microsoft-azure) 및 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 관련 도움**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) 참여
- **문서**: [공식 Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord에서의 커뮤니티 인사이트

**#Azure 채널 최신 설문 결과:**
- **45%** 개발자가 AI 워크로드에 AZD 사용 원함
- **주요 과제**: 다중 서비스 배포, 자격 증명 관리, 프로덕션 준비  
- **가장 요청 많은 항목**: AI 전용 템플릿, 문제해결 가이드, 모범 사례

**커뮤니티에 참여하세요:**
- AZD + AI 경험 공유 및 도움 받기
- 새로운 AI 템플릿 조기 미리보기 접근
- AI 배포 모범 사례 기여
- 향후 AI + AZD 기능 개발 영향력 행사

### 과정 기여 안내
기여를 환영합니다! 자세한 내용은 [기여 안내서](CONTRIBUTING.md)를 참고하세요:
- **콘텐츠 개선**: 기존 챕터 및 예제 향상
- **새로운 예제**: 실제 시나리오 및 템플릿 추가  
- **번역**: 다국어 지원 유지보수
- **버그 신고**: 정확도 및 명확성 향상
- **커뮤니티 규범**: 포용적 커뮤니티 지침 준수

---

## 📄 과정 정보

### 라이선스
이 프로젝트는 MIT 라이선스로 배포됩니다 - 자세한 내용은 [LICENSE](../../LICENSE) 파일을 참고하세요.

### 관련 Microsoft 학습 리소스

저희 팀은 다른 종합 학습 과정을 제공합니다:

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
 
### Copilot 시리즈
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ 과정 내비게이션

**🚀 학습 시작할 준비가 되었나요?**

**초보자**: [챕터 1: 기초 및 빠른 시작](../..)부터 시작하세요  

**AI 개발자**: [2장: AI-우선 개발](../..)로 이동  
**경험이 있는 개발자**: [3장: 구성 및 인증](../..)부터 시작

**다음 단계**: [1장 시작 - AZD 기초](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다했으나, 자동 번역은 오류나 부정확성을 포함할 수 있음을 유념하시기 바랍니다. 원본 문서는 해당 언어의 공식 자료로 간주되어야 합니다. 중요한 정보에 대해서는 전문가의 인간 번역을 권장합니다. 이 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->