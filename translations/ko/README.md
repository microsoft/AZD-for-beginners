# AZD 초보자용: 체계적인 학습 여정

![AZD-for-beginners](../../translated_images/ko/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## 이 과정 시작하기

아래 단계에 따라 AZD 학습 여정을 시작하세요:

1. **리포지토리 포크하기**: 클릭 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **리포지토리 클론하기**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **커뮤니티 참여하기**: 전문가 지원을 위한 [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4)
4. **학습 경로 선택하기**: 아래에서 본인 경험 수준에 맞는 챕터 선택

### 다국어 지원

#### 자동 번역 (항상 최신 유지)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](./README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **로컬에서 클론하는 것을 선호하시나요?**

> 이 리포지토리는 50개 이상의 언어 번역을 포함하여 다운로드 크기가 크게 증가합니다. 번역 없이 클론하려면 sparse checkout을 사용하세요:  
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> 이렇게 하면 과정 완료에 필요한 모든 것을 훨씬 빠르게 다운로드할 수 있습니다.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 과정 개요

체계적인 챕터를 통해 Azure Developer CLI(azd)를 마스터하세요. **Microsoft Foundry 통합을 활용한 AI 애플리케이션 배포에 특별 초점.**

### 이 과정이 현대 개발자에게 필수적인 이유

Microsoft Foundry Discord 커뮤니티 인사이트에 따르면, **개발자의 45%가 AI 워크로드에 AZD를 사용하길 원하지만** 다음과 같은 어려움을 겪습니다:
- 복잡한 다중 서비스 AI 아키텍처
- 운영 환경 AI 배포 모범 사례
- Azure AI 서비스 통합 및 구성
- AI 워크로드 비용 최적화
- AI 관련 배포 문제 해결

### 학습 목표

이 체계적인 과정을 완료하면:
- **AZD 기본 사항 마스터**: 핵심 개념, 설치, 구성
- **AI 애플리케이션 배포**: Microsoft Foundry 서비스와 AZD 활용
- **인프라 코드로 구현**: Bicep 템플릿으로 Azure 리소스 관리
- **배포 문제 해결**: 흔한 문제 해결 및 디버깅
- **운영 최적화**: 보안, 확장, 모니터링, 비용 관리
- **다중 에이전트 솔루션 구축**: 복잡한 AI 아키텍처 배포

## 📚 학습 챕터

*경험 수준과 목표에 따라 학습 경로 선택*

### 🚀 챕터 1: 기초 및 빠른 시작
**사전 조건**: Azure 구독, 기본 명령줄 지식  
**소요 시간**: 30-45분  
**난이도**: ⭐

#### 학습 내용
- Azure Developer CLI 기본 이해
- AZD 플랫폼별 설치 방법
- 첫 번째 성공적인 배포

#### 학습 자료
- **🎯 시작하기**: [Azure Developer CLI란?](../..)
- **📖 이론**: [AZD 기본](docs/getting-started/azd-basics.md) - 핵심 개념 및 용어
- **⚙️ 설정**: [설치 및 설정](docs/getting-started/installation.md) - 플랫폼별 가이드
- **🛠️ 실습**: [첫 프로젝트](docs/getting-started/first-project.md) - 단계별 튜토리얼
- **📋 빠른 참고**: [명령어 치트 시트](resources/cheat-sheet.md)

#### 실습 과제
```bash
# 빠른 설치 확인
azd version

# 첫 번째 애플리케이션 배포
azd init --template todo-nodejs-mongo
azd up
```

**💡 챕터 결과물**: AZD를 사용하여 간단한 웹 애플리케이션을 Azure에 성공적으로 배포

**✅ 성공 검증:**
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
**📈 학습 후 수준:** 기본 애플리케이션 독립 배포 가능

**✅ 성공 검증:**
```bash
# 1장을 완료한 후 다음을 할 수 있어야 합니다:
azd version              # 설치된 버전 표시
azd init --template todo-nodejs-mongo  # 프로젝트 초기화
azd up                  # Azure에 배포
azd show                # 실행 중인 앱 URL 표시
# 애플리케이션이 브라우저에서 열리고 작동함
azd down --force --purge  # 리소스 정리
```

**📊 예상 소요 시간:** 30-45분  
**📈 학습 후 수준:** 기본 애플리케이션 독립 배포 가능

---

### 🤖 챕터 2: AI 퍼스트 개발 (AI 개발자 권장)
**사전 조건**: 챕터 1 완료  
**소요 시간**: 1-2시간  
**난이도**: ⭐⭐

#### 학습 내용
- Microsoft Foundry와 AZD 통합
- AI 기반 애플리케이션 배포
- AI 서비스 구성 이해

#### 학습 자료
- **🎯 시작하기**: [Microsoft Foundry 통합](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 패턴**: [AI 모델 배포](docs/microsoft-foundry/ai-model-deployment.md) - AI 모델 배포 및 관리
- **🛠️ 워크숍**: [AI 워크숍 실습](docs/microsoft-foundry/ai-workshop-lab.md) - AI 솔루션 AZD 준비
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

**💡 챕터 결과물**: RAG 기능이 포함된 AI 기반 채팅 애플리케이션 배포 및 구성

**✅ 성공 검증:**
```bash
# 2장 이후에, 당신은 다음을 할 수 있을 것입니다:
azd init --template azure-search-openai-demo
azd up
# AI 채팅 인터페이스를 테스트하세요
# 질문을 하고 출처가 있는 AI 기반 응답을 받으세요
# 검색 통합이 작동하는지 확인하세요
azd monitor  # 애플리케이션 인사이트가 원격 측정을 표시하는지 확인하세요
azd down --force --purge
```

**📊 예상 소요 시간:** 1-2시간  
**📈 학습 후 수준:** 운영 준비 완료 AI 애플리케이션 배포 및 구성 가능  
**💰 비용 인식:** 개발 비용 월 $80-150, 운영 비용 월 $300-3500 이해

#### 💰 AI 배포 비용 고려사항

**개발 환경 (예상 $80-150/월):**
- Azure OpenAI (사용량 기반 과금): $0-50/월 (토큰 사용량에 따라)
- AI Search (기본 티어): $75/월
- 컨테이너 앱 (소비 기반): $0-20/월
- 스토리지 (표준): $1-5/월

**운영 환경 (예상 $300-3,500+/월):**
- Azure OpenAI (일관된 성능 위한 PTU): $3,000+/월 또는 대량 사용 시 소비 기반
- AI Search (표준 티어): $250/월
- 컨테이너 앱 (전용): $50-100/월
- Application Insights: $5-50/월
- 스토리지 (프리미엄): $10-50/월

**💡 비용 최적화 팁:**
- 학습용으로 **무료 티어** Azure OpenAI 사용 (월 50,000 토큰 포함)
- 적극 개발하지 않을 때 `azd down`으로 리소스 할당 해제
- 소비 기반 청구로 시작하고 운영 시 PTU로 업그레이드
- 배포 전에 `azd provision --preview`로 비용 추정
- 자동 확장 기능 활성화: 실제 사용량만 비용 지불

**비용 모니터링:**
```bash
# 예상 월간 비용 확인
azd provision --preview

# Azure 포털에서 실제 비용 모니터링
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ 챕터 3: 구성 및 인증
**사전 조건**: 챕터 1 완료  
**소요 시간**: 45-60분  
**난이도**: ⭐⭐

#### 학습 내용
- 환경 구성 및 관리
- 인증과 보안 모범 사례
- 리소스 명명법 및 조직화

#### 학습 자료
- **📖 구성**: [구성 가이드](docs/getting-started/configuration.md) - 환경 설정
- **🔐 보안**: [인증 패턴 및 관리되는 ID](docs/getting-started/authsecurity.md) - 인증 패턴
- **📝 예제**: [데이터베이스 앱 예제](examples/database-app/README.md) - AZD 데이터베이스 예제

#### 실습 과제
- 다중 환경(개발, 스테이징, 운영) 구성
- 관리되는 ID 인증 설정
- 환경별 구성 구현

**💡 챕터 결과물**: 적절한 인증과 보안으로 다중 환경 관리

---

### 🏗️ 챕터 4: 인프라 코드 및 배포
**사전 조건**: 챕터 1-3 완료  
**소요 시간**: 1-1.5시간  
**난이도**: ⭐⭐⭐

#### 학습 내용
- 고급 배포 패턴
- Bicep을 이용한 인프라 코드
- 리소스 프로비저닝 전략

#### 학습 자료
- **📖 배포**: [배포 가이드](docs/deployment/deployment-guide.md) - 전체 워크플로우
- **🏗️ 프로비저닝**: [리소스 프로비저닝](docs/deployment/provisioning.md) - Azure 리소스 관리
- **📝 예제**: [컨테이너 앱 예제](../../examples/container-app) - 컨테이너 배포

#### 실습 과제
- 맞춤형 Bicep 템플릿 작성
- 다중 서비스 애플리케이션 배포
- 블루-그린 배포 전략 구현

**💡 챕터 결과물**: 맞춤형 인프라 템플릿으로 복잡한 다중 서비스 애플리케이션 배포

---

### 🎯 챕터 5: 다중 에이전트 AI 솔루션 (고급)
**사전 조건**: 챕터 1-2 완료  
**소요 시간**: 2-3시간  
**난이도**: ⭐⭐⭐⭐
#### 배우게 될 내용
- 다중 에이전트 아키텍처 패턴
- 에이전트 오케스트레이션 및 조정
- 프로덕션 준비 완료 AI 배포

#### 학습 자료
- **🤖 주요 프로젝트**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - 완전 구현
- **🛠️ ARM 템플릿**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - 원클릭 배포
- **📖 아키텍처**: [다중 에이전트 조정 패턴](/docs/pre-deployment/coordination-patterns.md) - 패턴

#### 실습 과제
```bash
# 완전한 소매 다중 에이전트 솔루션 배포
cd examples/retail-multiagent-arm-template
./deploy.sh

# 에이전트 구성 탐색
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 챕터 목표**: 고객 및 인벤토리 에이전트와 함께 프로덕션 준비 완료 다중 에이전트 AI 솔루션을 배포하고 관리하기

---

### 🔍 6장: 사전 배포 검증 및 계획
**전제 조건**: 4장 완료  
**소요 시간**: 1시간  
**난이도**: ⭐⭐

#### 배우게 될 내용
- 용량 계획 및 리소스 검증
- SKU 선택 전략
- 사전 점검 및 자동화

#### 학습 자료
- **📊 계획**: [용량 계획](docs/pre-deployment/capacity-planning.md) - 리소스 검증
- **💰 선택**: [SKU 선택](docs/pre-deployment/sku-selection.md) - 비용 효율적 선택
- **✅ 검증**: [사전 점검](docs/pre-deployment/preflight-checks.md) - 자동화 스크립트

#### 실습 과제
- 용량 검증 스크립트 실행
- 비용 최적화를 위한 SKU 선택 최적화
- 자동화된 사전 배포 점검 구현

**💡 챕터 목표**: 실행 전에 배포를 검증하고 최적화하기

---

### 🚨 7장: 문제 해결 및 디버깅
**전제 조건**: 배포 관련 챕터 중 하나 완료  
**소요 시간**: 1-1.5시간  
**난이도**: ⭐⭐

#### 배우게 될 내용
- 체계적 디버깅 접근법
- 일반 문제점과 해결책
- AI 특화 문제 해결

#### 학습 자료
- **🔧 일반 문제**: [일반 문제](docs/troubleshooting/common-issues.md) - FAQ 및 해결책
- **🕵️ 디버깅**: [디버깅 가이드](docs/troubleshooting/debugging.md) - 단계별 전략
- **🤖 AI 문제**: [AI 특화 문제 해결](docs/troubleshooting/ai-troubleshooting.md) - AI 서비스 문제

#### 실습 과제
- 배포 실패 진단
- 인증 문제 해결
- AI 서비스 연결 디버깅

**💡 챕터 목표**: 일반적인 배포 문제를 독립적으로 진단하고 해결하기

---

### 🏢 8장: 프로덕션 및 엔터프라이즈 패턴
**전제 조건**: 1-4장 완료  
**소요 시간**: 2-3시간  
**난이도**: ⭐⭐⭐⭐

#### 배우게 될 내용
- 프로덕션 배포 전략
- 엔터프라이즈 보안 패턴
- 모니터링 및 비용 최적화

#### 학습 자료
- **🏭 프로덕션**: [프로덕션 AI 모범 사례](docs/microsoft-foundry/production-ai-practices.md) - 엔터프라이즈 패턴
- **📝 예제**: [마이크로서비스 예제](../../examples/microservices) - 복잡한 아키텍처
- **📊 모니터링**: [Application Insights 통합](docs/pre-deployment/application-insights.md) - 모니터링

#### 실습 과제
- 엔터프라이즈 보안 패턴 구현
- 종합 모니터링 설정
- 적절한 거버넌스하에 프로덕션 배포

**💡 챕터 목표**: 완전한 프로덕션 기능을 갖춘 엔터프라이즈급 애플리케이션 배포

---

## 🎓 워크숍 개요: 실습 학습 경험

> **⚠️ 워크숍 상태: 개발 중**  
> 워크숍 자료는 현재 개발 및 개선 중입니다. 핵심 모듈은 작동 중이지만 일부 고급 섹션은 아직 완성되지 않았습니다. 모든 콘텐츠 완성을 위해 적극 작업하고 있습니다. [진행 상황 보기 →](workshop/README.md)

### 인터랙티브 워크숍 자료
**브라우저 기반 도구와 단계별 실습을 통한 종합 실습 학습**

본 워크숍 자료는 위 챕터 기반 커리큘럼을 보완하는 구조화되고 상호작용적인 학습 경험을 제공합니다. 워크숍은 자율 학습과 강사 주도 세션 모두에 적합합니다.

#### 🛠️ 워크숍 특징
- **브라우저 기반 인터페이스**: 검색, 복사, 테마 기능을 갖춘 완전한 MkDocs 기반 워크숍
- **GitHub Codespaces 통합**: 원클릭 개발 환경 설정
- **구조화된 학습 경로**: 7단계의 안내된 실습(총 3.5시간)
- **발견 → 배포 → 맞춤화**: 점진적 학습 방법론
- **인터랙티브 DevContainer 환경**: 사전 구성된 도구와 종속성

#### 📚 워크숍 구조
워크숍은 **발견 → 배포 → 맞춤화** 방법론을 따릅니다:

1. **발견 단계** (45분)
   - Microsoft Foundry 템플릿 및 서비스 탐색
   - 다중 에이전트 아키텍처 패턴 이해
   - 배포 요구사항 및 전제 조건 검토

2. **배포 단계** (2시간)
   - AZD를 사용한 AI 애플리케이션 실습 배포
   - Azure AI 서비스 및 엔드포인트 구성
   - 보안 및 인증 패턴 구현

3. **맞춤화 단계** (45분)
   - 특정 사용 사례에 맞게 애플리케이션 수정
   - 프로덕션 배포 최적화
   - 모니터링 및 비용 관리 구현

#### 🚀 워크숍 시작하기
```bash
# 옵션 1: GitHub Codespaces (추천됨)
# 저장소에서 "Code" → "Create codespace on main"을 클릭하세요

# 옵션 2: 로컬 개발
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md의 설정 지침을 따르세요
```

#### 🎯 워크숍 학습 목표
워크숍을 완료하면 참여자는:
- **프로덕션 AI 애플리케이션 배포**: Microsoft Foundry 서비스와 함께 AZD 사용
- **다중 에이전트 아키텍처 마스터**: 조정된 AI 에이전트 솔루션 구현
- **보안 모범 사례 적용**: 인증 및 접근 제어 구성
- **규모 최적화**: 비용 효율적이고 성능 좋은 배포 설계
- **배포 문제 해결**: 일반 문제 독립적 해결

#### 📖 워크숍 자료
- **🎥 인터랙티브 가이드**: [워크숍 자료](workshop/README.md) - 브라우저 기반 학습 환경
- **📋 단계별 안내서**: [안내 실습](../../workshop/docs/instructions) - 상세 워크스루
- **🛠️ AI 워크숍 실습실**: [AI 워크숍 실습실](docs/microsoft-foundry/ai-workshop-lab.md) - AI 중심 실습 과제
- **💡 빠른 시작**: [워크숍 설정 가이드](workshop/README.md#quick-start) - 환경 구성

**적합 대상**: 기업 교육, 대학 강좌, 자기 주도 학습, 개발자 부트캠프

---

## 📖 Azure 개발자 CLI란?

Azure Developer CLI(azd)는 애플리케이션을 Azure에 구축하고 배포하는 프로세스를 가속화하는 개발자 중심 명령줄 인터페이스입니다. 제공 기능은 다음과 같습니다:

- **템플릿 기반 배포** - 공통 애플리케이션 패턴용 사전 구축 템플릿 사용
- **코드형 인프라 관리** - Bicep 또는 Terraform으로 Azure 리소스 관리  
- **통합 워크플로우** - 애플리케이션 프로비저닝, 배포 및 모니터링을 원활하게 연결
- **개발자 친화적** - 개발 생산성과 경험에 최적화

### **AZD + Microsoft Foundry: AI 배포에 완벽한 조합**

**AI 솔루션에 AZD가 적합한 이유** AZD는 AI 개발자가 직면한 주요 과제를 해결합니다:

- **AI 준비 템플릿** - Azure OpenAI, Cognitive Services, ML 워크로드용 사전 구성 템플릿
- **안전한 AI 배포** - AI 서비스, API 키 및 모델 엔드포인트에 대한 내장 보안 패턴  
- **프로덕션 AI 패턴** - 확장 가능하고 비용 효율적인 AI 애플리케이션 배포 모범 사례
- **엔드투엔드 AI 워크플로우** - 모델 개발부터 프로덕션 배포, 적절한 모니터링까지
- **비용 최적화** - AI 워크로드용 스마트 리소스 할당 및 스케일링 전략
- **Microsoft Foundry 통합** - Microsoft Foundry 모델 카탈로그 및 엔드포인트와 원활한 연결

---

## 🎯 템플릿 및 예제 라이브러리

### 추천: Microsoft Foundry 템플릿
**AI 애플리케이션을 배포하려면 여기서 시작하세요!**

> **참고:** 이 템플릿들은 다양한 AI 패턴을 보여줍니다. 일부는 외부 Azure 샘플이고, 일부는 로컬 구현입니다.

| 템플릿 | 챕터 | 난이도 | 서비스 | 유형 |
|----------|---------|------------|----------|------|
| [**AI 채팅 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-chat) | 2장 | ⭐⭐ | AzureOpenAI + Azure AI 모델 추론 API + Azure AI 검색 + Azure Container Apps + Application Insights | 외부 |
| [**AI 에이전트 시작하기**](https://github.com/Azure-Samples/get-started-with-ai-agents) | 2장 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI 검색 + Azure Container Apps + Application Insights | 외부 |
| [**Azure Search + OpenAI 데모**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2장 | ⭐⭐ | AzureOpenAI + Azure AI 검색 + App Service + Storage | 외부 |
| [**OpenAI 채팅 앱 빠른 시작**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2장 | ⭐ | AzureOpenAI + Container Apps + Application Insights | 외부 |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5장 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | 외부 |
| [**Contoso 채팅 RAG**](https://github.com/Azure-Samples/contoso-chat) | 8장 | ⭐⭐⭐⭐ | AzureOpenAI + AI 검색 + Cosmos DB + Container Apps | 외부 |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | 5장 | ⭐⭐⭐⭐ | AzureOpenAI + AI 검색 + Storage + Container Apps + Cosmos DB | **로컬** |

### 추천: 완성 학습 시나리오
**학습 챕터별 매핑된 프로덕션 준비 애플리케이션 템플릿**

| 템플릿 | 학습 챕터 | 난이도 | 주요 학습 내용 |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 2장 | ⭐ | 기본 AI 배포 패턴 |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | 2장 | ⭐⭐ | Azure AI 검색 기반 RAG 구현 |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | 4장 | ⭐⭐ | 문서 인텔리전스 통합 |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | 5장 | ⭐⭐⭐ | 에이전트 프레임워크 및 함수 호출 |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | 8장 | ⭐⭐⭐ | 엔터프라이즈 AI 오케스트레이션 |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | 5장 | ⭐⭐⭐⭐ | 고객 및 인벤토리 에이전트를 사용하는 다중 에이전트 아키텍처 |

### 예제로 학습하기 유형

> **📌 로컬 vs. 외부 예제:**  
> **로컬 예제** (이 리포지토리 내) = 즉시 사용 가능  
> **외부 예제** (Azure 샘플) = 연결된 리포지토리에서 클론 필요

#### 로컬 예제 (즉시 사용 가능)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM 템플릿을 포함한 완전한 프로덕션 준비 구현
  - 다중 에이전트 아키텍처 (고객 + 인벤토리 에이전트)
  - 종합 모니터링 및 평가
  - ARM 템플릿 통한 원클릭 배포

#### 로컬 예제 - 컨테이너 애플리케이션 (2-5장)
**이 저장소 내 포괄적 컨테이너 배포 예제:**
- [**Container App 예제**](examples/container-app/README.md) - 컨테이너화된 배포 완전 가이드
  - [단순 Flask API](../../examples/container-app/simple-flask-api) - 스케일 투 제로 기본 REST API
  - [마이크로서비스 아키텍처](../../examples/container-app/microservices) - 프로덕션 준비 다중 서비스 배포
  - 빠른 시작, 프로덕션, 고급 배포 패턴
  - 모니터링, 보안, 비용 최적화 안내

#### 외부 예제 - 간단 애플리케이션 (1-2장)
**아래 Azure 샘플 리포지토리 클론으로 시작:**
- [간단 웹 앱 - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - 기본 배포 패턴
- [정적 웹사이트 - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - 정적 콘텐츠 배포
- [컨테이너 앱 - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API 배포

#### 외부 예제 - 데이터베이스 통합 (3-4장)  
- [데이터베이스 앱 - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - 데이터베이스 연결 패턴
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - 서버리스 데이터 워크플로우

#### 외부 예제 - 고급 패턴 (4-8장)
- [Java 마이크로서비스](https://github.com/Azure-Samples/java-microservices-aca-lab) - 다중 서비스 아키텍처
- [컨테이너 앱 작업](https://github.com/Azure-Samples/container-apps-jobs) - 백그라운드 처리  
- [엔터프라이즈 ML 파이프라인](https://github.com/Azure-Samples/mlops-v2) - 프로덕션 준비 ML 패턴

### 외부 템플릿 모음
- [**공식 AZD 템플릿 갤러리**](https://azure.github.io/awesome-azd/) - 공식 및 커뮤니티 템플릿 모음 curated
- [**Azure Developer CLI 템플릿**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn 템플릿 문서
- [**예제 디렉터리**](examples/README.md) - 자세한 설명이 포함된 로컬 학습 예제

---

## 📚 학습 자료 및 참고 문서

### 빠른 참조
- [**명령어 치트 시트**](resources/cheat-sheet.md) - 챕터별로 정리된 필수 azd 명령어
- [**용어집**](resources/glossary.md) - Azure 및 azd 용어
- [**자주 묻는 질문(FAQ)**](resources/faq.md) - 학습 챕터별로 정리된 일반적인 질문
- [**학습 가이드**](resources/study-guide.md) - 포괄적인 실습 문제

### 실습 워크숍
- [**AI 워크숍 실습실**](docs/microsoft-foundry/ai-workshop-lab.md) - AZD 배포 가능한 AI 솔루션 만들기 (2-3시간)
- [**인터랙티브 워크숍 가이드**](workshop/README.md) - MkDocs 및 DevContainer 환경을 사용하는 브라우저 기반 워크숍
- [**체계적 학습 경로**](../../workshop/docs/instructions) - 7단계 가이드 연습 (발견 → 배포 → 맞춤화)
- [**초보자를 위한 AZD 워크숍**](workshop/README.md) - GitHub Codespaces 통합이 포함된 완전한 실습 워크숍 자료

### 외부 학습 자료
- [Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 가격 계산기](https://azure.microsoft.com/pricing/calculator/)
- [Azure 상태](https://status.azure.com/)

---

## 🔧 빠른 문제 해결 가이드

**초보자가 자주 겪는 문제와 즉각적인 해결책:**

### ❌ "azd: command not found"

```bash
# 먼저 AZD를 설치하세요
# 윈도우즈 (파워셸):
winget install microsoft.azd

# 맥OS:
brew tap azure/azd && brew install azd

# 리눅스:
curl -fsSL https://aka.ms/install-azd.sh | bash

# 설치 확인
azd version
```

### ❌ "No subscription found" 또는 "Subscription not set"

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

### ❌ "InsufficientQuota" 또는 "Quota exceeded"

```bash
# 다른 Azure 지역을 시도하세요
azd env set AZURE_LOCATION "westus2"
azd up

# 또는 개발 환경에서는 더 작은 SKU를 사용하세요
# infra/main.parameters.json 파일을 편집하세요:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" 명령 도중 실패

```bash
# 옵션 1: 정리하고 다시 시도
azd down --force --purge
azd up

# 옵션 2: 인프라만 수정
azd provision

# 옵션 3: 상세 로그 확인
azd show
azd logs
```

### ❌ "Authentication failed" 또는 "Token expired"

```bash
# 다시 인증하세요
az logout
az login

azd auth logout
azd auth login

# 인증을 확인하세요
az account show
```

### ❌ "Resource already exists" 또는 이름 충돌 문제

```bash
# AZD는 고유한 이름을 생성하지만, 충돌이 발생하면:
azd down --force --purge

# 새 환경에서 다시 시도합니다
azd env new dev-v2
azd up
```

### ❌ 템플릿 배포 시간이 너무 오래 걸림

**일반적인 대기 시간:**
- 간단한 웹 앱: 5-10분
- 데이터베이스가 포함된 앱: 10-15분
- AI 애플리케이션: 15-25분 (OpenAI 프로비저닝이 느림)

```bash
# 진행 상황 확인
azd show

# 30분 이상 멈춘 경우, Azure 포털 확인:
azd monitor
# 실패한 배포 확인
```

### ❌ "Permission denied" 또는 "Forbidden"

```bash
# Azure 역할을 확인하세요
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 최소한 "기여자" 역할이 필요합니다
# Azure 관리자에게 다음 권한 부여를 요청하세요:
# - 기여자 (리소스용)
# - 사용자 액세스 관리자 (역할 할당용)
```

### ❌ 배포된 애플리케이션 URL을 찾을 수 없음

```bash
# 모든 서비스 엔드포인트 표시
azd show

# 또는 Azure 포털 열기
azd monitor

# 특정 서비스 확인
azd env get-values
# *_URL 변수 찾기
```

### 📚 전체 문제 해결 자료

- **일반 문제 안내:** [상세 솔루션](docs/troubleshooting/common-issues.md)
- **AI 관련 문제:** [AI 문제 해결](docs/troubleshooting/ai-troubleshooting.md)
- **디버깅 가이드:** [단계별 디버깅](docs/troubleshooting/debugging.md)
- **도움 받기:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

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

# AZD 환경으로 설정
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

# 개발 환경에서는 더 작은 SKU를 사용하세요
# infra/main.parameters.json을 수정하세요:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" 명령 도중 실패</strong></summary>

```bash
# 옵션 1: 정리하고 다시 시도하기
azd down --force --purge
azd up

# 옵션 2: 인프라만 수정하기
azd provision

# 옵션 3: 상세 로그 확인하기
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" 또는 "Token expired"</strong></summary>

```bash
# 다시 인증하십시오
az logout
az login

azd auth logout
azd auth login

# 인증을 확인하십시오
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" 또는 이름 충돌 문제</strong></summary>

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

**일반적인 대기 시간:**
- 간단한 웹 앱: 5-10분
- 데이터베이스가 포함된 앱: 10-15분
- AI 애플리케이션: 15-25분 (OpenAI 프로비저닝이 느림)

```bash
# 진행 상황 확인
azd show

# 30분 이상 멈췄다면 Azure 포털 확인:
azd monitor
# 실패한 배포 찾기
```
</details>

<details>
<summary><strong>❌ "Permission denied" 또는 "Forbidden"</strong></summary>

```bash
# Azure 역할을 확인하세요
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 최소 "기여자" 역할이 필요합니다
# Azure 관리자에게 다음 권한 부여를 요청하세요:
# - 기여자 (리소스용)
# - 사용자 액세스 관리자 (역할 할당용)
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
# *_URL 변수 찾아보기
```
</details>

### 📚 전체 문제 해결 자료

- **일반 문제 안내:** [상세 솔루션](docs/troubleshooting/common-issues.md)
- **AI 관련 문제:** [AI 문제 해결](docs/troubleshooting/ai-troubleshooting.md)
- **디버깅 가이드:** [단계별 디버깅](docs/troubleshooting/debugging.md)
- **도움 받기:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 과정 완료 및 인증

### 진행 상황 추적
각 챕터를 따라 학습 진행 상황을 추적하세요:

- [ ] **챕터 1**: 기본 및 빠른 시작 ✅
- [ ] **챕터 2**: AI-퍼스트 개발 ✅  
- [ ] **챕터 3**: 구성 및 인증 ✅
- [ ] **챕터 4**: 코드형 인프라 및 배포 ✅
- [ ] **챕터 5**: 다중 에이전트 AI 솔루션 ✅
- [ ] **챕터 6**: 배포 전 검증 및 계획 ✅
- [ ] **챕터 7**: 문제 해결 및 디버깅 ✅
- [ ] **챕터 8**: 프로덕션 및 엔터프라이즈 패턴 ✅

### 학습 검증
각 챕터를 완료한 후 지식을 확인하세요:
1. **실습 과제**: 챕터별 실습 배포 완료
2. **지식 확인**: 해당 챕터 FAQ 섹션 검토
3. **커뮤니티 토론**: Azure Discord에서 경험 공유
4. **다음 챕터 진행**: 다음 난이도로 이동

### 과정 완료 혜택
모든 챕터를 완료하면 다음을 얻게 됩니다:
- **프로덕션 경험**: 실제 AI 애플리케이션을 Azure에 배포
- **전문 기술**: 엔터프라이즈 수준 배포 능력  
- **커뮤니티 인정**: Azure 개발자 커뮤니티의 활발한 멤버
- **경력 발전**: 수요가 높은 AZD 및 AI 배포 전문성

---

## 🤝 커뮤니티 및 지원

### 도움 및 지원 받기
- **기술 문제**: [버그 신고 및 기능 요청](https://github.com/microsoft/azd-for-beginners/issues)
- **학습 질문**: [Microsoft Azure Discord 커뮤니티](https://discord.gg/microsoft-azure) 및 [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI 관련 도움**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)에 참여
- **문서**: [공식 Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord의 커뮤니티 인사이트

**#Azure 채널 최근 설문 결과:**
- **45%**의 개발자가 AI 작업에 AZD를 사용하고 싶어 함
- **주요 어려움**: 멀티 서비스 배포, 자격 증명 관리, 프로덕션 준비  
- **가장 요청 많은 내용**: AI 전용 템플릿, 문제 해결 가이드, 모범 사례

**우리 커뮤니티에 참여하여:**
- AZD + AI 경험을 공유하고 도움 받기
- 새로운 AI 템플릿 초기 미리보기 액세스
- AI 배포 모범 사례에 기여
- 향후 AI + AZD 기능 개발에 영향력 행사

### 과정 기여 안내
기여를 환영합니다! 자세한 내용은 [기여 안내서](CONTRIBUTING.md)를 참고하세요:
- **내용 개선**: 기존 챕터 및 예제 향상
- **새 예제 추가**: 실제 사례와 템플릿 추가  
- **번역 지원**: 다국어 지원 유지보수
- **버그 신고**: 정확성과 명확성 향상
- **커뮤니티 기준**: 포용적인 커뮤니티 가이드라인 준수

---

## 📄 과정 정보

### 라이선스
이 프로젝트는 MIT 라이선스 하에 있으며 자세한 내용은 [LICENSE](../../LICENSE) 파일을 참조하세요.

### 관련 Microsoft 학습 자료

우리 팀은 다른 포괄적인 학습 과정을 제작합니다:

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

---
 
### 코파일럿 시리즈

---

## 🗺️ 강좌 내비게이션

**🚀 학습을 시작할 준비가 되셨나요?**

**초보자**: [1장: 기초 및 빠른 시작](../..)부터 시작하세요  
**AI 개발자**: [2장: AI-퍼스트 개발](../..)으로 바로 가기  
**경험 있는 개발자**: [3장: 구성 및 인증](../..)부터 시작하세요

**다음 단계**: [1장 시작 - AZD 기본](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원본 문서의 원어 버전을 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인력에 의한 번역을 권장합니다. 본 번역의 사용으로 인한 오해나 잘못된 해석에 대해서는 저희가 책임지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->