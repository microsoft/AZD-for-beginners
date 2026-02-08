# AZD 초보자를 위한 과정 개요 및 학습 프레임워크

## 과정 개요

점진적인 학습을 위해 설계된 체계적인 챕터를 통해 Azure Developer CLI (azd)를 마스터하세요. **Microsoft Foundry 통합을 통한 AI 애플리케이션 배포에 특별히 중점을 둡니다.**

### 이 과정이 현대 개발자에게 필수인 이유

Microsoft Foundry Discord 커뮤니티 인사이트에 따르면, **개발자의 45%가 AI 워크로드에 AZD를 사용하기를 원하지만** 다음과 같은 문제에 직면합니다:
- 복잡한 다중 서비스 AI 아키텍처
- 프로덕션 AI 배포 모범 사례  
- Azure AI 서비스 통합 및 구성
- AI 워크로드 비용 최적화
- AI 관련 배포 문제 해결

### 핵심 학습 목표

이 체계화된 과정을 완료하면 다음을 할 수 있습니다:
- **AZD 기초 마스터**: 핵심 개념, 설치 및 구성
- **AI 애플리케이션 배포**: Microsoft Foundry 서비스와 함께 AZD 사용
- **인프라를 코드로 구현**: Bicep 템플릿으로 Azure 리소스 관리
- **배포 문제 해결**: 일반적인 문제 해결 및 디버깅
- **프로덕션 최적화**: 보안, 확장, 모니터링 및 비용 관리
- **멀티 에이전트 솔루션 구축**: 복잡한 AI 아키텍처 배포

## 🎓 워크숍 학습 경험

### 유연한 학습 제공 옵션
이 과정은 **자기주도 학습**과 **강사 진행 워크숍 세션**을 모두 지원하도록 설계되어 학습자가 인터랙티브한 실습을 통해 AZD를 직접 다루며 실무 능력을 개발할 수 있습니다.

#### 🚀 자기주도 학습 모드
**개별 개발자와 지속적 학습에 적합**

**특징:**
- **브라우저 기반 인터페이스**: 모든 웹 브라우저에서 접근 가능한 MkDocs 기반 워크숍
- **GitHub Codespaces 통합**: 사전 구성된 도구가 포함된 원클릭 개발 환경
- **인터랙티브 DevContainer 환경**: 로컬 설정 불필요 - 즉시 코딩 시작
- **진행 추적**: 내장 체크포인트 및 검증 연습
- **커뮤니티 지원**: 질문 및 협업을 위한 Azure Discord 채널 접근

**학습 구조:**
- **유연한 일정**: 며칠 또는 몇 주에 걸쳐 자신만의 속도로 챕터 완료
- **체크포인트 시스템**: 복잡한 주제로 넘어가기 전에 학습 검증
- **리소스 라이브러리**: 포괄적인 문서, 예제 및 문제 해결 가이드
- **포트폴리오 개발**: 전문 포트폴리오에 사용할 배포 가능한 프로젝트 구축

**시작하기 (자기주도):**
```bash
# 옵션 1: GitHub Codespaces (권장)
# 리포지토리로 이동하여 "Code" → "Create codespace on main"을 클릭하세요

# 옵션 2: 로컬 개발
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md의 설정 지침을 따르세요
```

#### 🏛️ 강사 진행 워크숍 세션
**기업 교육, 부트캠프 및 교육 기관에 이상적**

**워크숍 형식 옵션:**

**📚 학술 과정 통합 (8-12주)**
- **대학 프로그램**: 주당 2시간 세션으로 한 학기 과정
- **부트캠프 형식**: 매일 6-8시간 세션으로 진행되는 집중 3-5일 프로그램
- **기업 교육**: 실무 프로젝트 구현을 포함한 월간 팀 세션
- **평가 프레임워크**: 채점 과제, 동료 검토 및 기말 프로젝트

**🚀 집중 워크숍 (1-3일)**
- **1일차**: 기초 + AI 개발 (챕터 1-2) - 6시간
- **2일차**: 구성 + 인프라 (챕터 3-4) - 6시간  
- **3일차**: 고급 패턴 + 프로덕션 (챕터 5-8) - 8시간
- **후속 지원**: 프로젝트 완료를 위한 선택적 2주 멘토십

**⚡ 경영진 브리핑 (4-6 시간)**
- **전략 개요**: AZD 가치 제안 및 비즈니스 영향 (1시간)
- **핸즈온 데모**: AI 애플리케이션 엔드투엔드 배포 (2시간)
- **아키텍처 검토**: 엔터프라이즈 패턴 및 거버넌스 (1시간)
- **구현 계획**: 조직 채택 전략 (1-2시간)

#### 🛠️ 워크숍 학습 방법론
실습 능력 개발을 위한 **발견 → 배포 → 맞춤화** 접근법

**1단계: 발견 (45분)**
- **템플릿 탐색**: Microsoft Foundry 템플릿 및 서비스 평가
- **아키텍처 분석**: 멀티 에이전트 패턴 및 배포 전략 이해
- **요구사항 평가**: 조직의 요구사항 및 제약 식별
- **환경 설정**: 개발 환경 및 Azure 리소스 구성

**2단계: 배포 (2시간)**
- **가이드 구현**: AZD로 AI 애플리케이션 단계별 배포
- **서비스 구성**: Azure AI 서비스, 엔드포인트 및 인증 구성
- **보안 구현**: 엔터프라이즈 보안 패턴 및 접근 제어 적용
- **유효성 검사 테스트**: 배포 검증 및 일반적인 문제 해결

**3단계: 맞춤화 (45분)**
- **애플리케이션 수정**: 특정 사용 사례 및 요구사항에 맞게 템플릿 조정
- **프로덕션 최적화**: 모니터링, 비용 관리 및 확장 전략 구현
- **고급 패턴**: 멀티 에이전트 조정 및 복잡한 아키텍처 탐색
- **다음 단계 계획**: 지속적 기술 개발을 위한 학습 경로 정의

#### 🎯 워크숍 학습 성과
**실습을 통해 개발되는 측정 가능한 기술**

**기술 역량:**
- **프로덕션 AI 애플리케이션 배포**: AI 기반 솔루션을 성공적으로 배포하고 구성
- **인프라 코드(IaC) 숙달**: 사용자 정의 Bicep 템플릿 생성 및 관리
- **멀티 에이전트 아키텍처**: 조정된 AI 에이전트 솔루션 구현
- **운영 준비성**: 보안, 모니터링 및 거버넌스 패턴 적용
- **문제 해결 전문성**: 배포 및 구성 문제를 독립적으로 해결

**전문적 역량:**
- **프로젝트 리더십**: 클라우드 배포 이니셔티브에서 기술 팀 리드
- **아키텍처 설계**: 확장 가능하고 비용 효율적인 Azure 솔루션 설계
- **지식 전수**: 동료에게 AZD 모범 사례 교육 및 멘토링
- **전략적 기획**: 조직의 클라우드 채택 전략에 영향

#### 📋 워크숍 리소스 및 자료
강사와 학습자를 위한 종합 툴킷

**강사용:**
- **강사용 안내서**: [워크숍 개요](workshop/README.md) - 세션 계획 및 진행 가이드
- **발표 자료**: 슬라이드, 아키텍처 다이어그램 및 데모 스크립트
- **평가 도구**: 실습 과제, 지식 점검 및 평가 루브릭
- **기술 설정**: 환경 구성, 문제 해결 가이드 및 백업 계획

**학습자용:**
- **인터랙티브 워크숍 환경**: [워크숍 자료](workshop/README.md) - 브라우저 기반 학습 플랫폼
- **단계별 지침**: [가이드 연습](../../workshop/docs/instructions) - 자세한 구현 워크스루  
- **참고 문서**: [AI 워크숍 실습](docs/microsoft-foundry/ai-workshop-lab.md) - AI 중심 심층 학습
- **커뮤니티 리소스**: Azure Discord 채널, GitHub 토론 및 전문가 지원

#### 🏢 엔터프라이즈 워크숍 구현
조직 배포 및 교육 전략

**기업 교육 프로그램:**
- **개발자 온보딩**: AZD 기초를 포함한 신입사원 오리엔테이션 (2-4주)
- **팀 역량 강화**: 기존 개발 팀을 위한 분기별 워크숍 (1-2일)
- **아키텍처 검토**: 수석 엔지니어 및 아키텍트를 위한 월간 세션 (4시간)
- **리더십 브리핑**: 기술 의사결정자를 위한 경영진 워크숍 (반나절)

**구현 지원:**
- **맞춤형 워크숍 설계**: 특정 조직 요구에 맞춘 맞춤형 콘텐츠
- **파일럿 프로그램 관리**: 성공 지표 및 피드백 루프를 포함한 구조화된 롤아웃  
- **지속적 멘토링**: 워크숍 이후 프로젝트 구현 지원
- **커뮤니티 구축**: 내부 Azure AI 개발자 커뮤니티 및 지식 공유

**성공 지표:**
- **기술 습득**: 기술 역량 성장을 측정하는 사전/사후 평가
- **배포 성공률**: 프로덕션 애플리케이션을 성공적으로 배포한 참가자 비율
- **생산성 전환 시간**: 새로운 Azure AI 프로젝트의 온보딩 시간 단축
- **지식 유지**: 워크숍 후 3-6개월 시점의 후속 평가

## 8장 학습 구조

### 챕터 1: 기초 및 빠른 시작 (30-45분) 🌱
**필수 조건**: Azure 구독, 기본 명령줄 지식  
**복잡도**: ⭐

#### 학습 내용
- Azure Developer CLI 기초 이해
- AZD를 플랫폼에 설치하기  
- 처음으로 성공적인 배포 수행
- 핵심 개념 및 용어

#### 학습 자료
- [AZD 기초](docs/getting-started/azd-basics.md) - 핵심 개념
- [설치 및 설정](docs/getting-started/installation.md) - 플랫폼별 가이드
- [첫 번째 프로젝트](docs/getting-started/first-project.md) - 실습 튜토리얼
- [명령 치트시트](resources/cheat-sheet.md) - 빠른 참조

#### 실습 결과
AZD를 사용해 Azure에 간단한 웹 애플리케이션을 성공적으로 배포합니다

---

### 챕터 2: AI 우선 개발 (1-2시간) 🤖
**필수 조건**: 챕터 1 완료  
**복잡도**: ⭐⭐

#### 학습 내용
- AZD와 Microsoft Foundry 통합
- AI 기반 애플리케이션 배포
- AI 서비스 구성 이해
- RAG (Retrieval-Augmented Generation) 패턴

#### 학습 자료
- [Microsoft Foundry 통합](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [AI 모델 배포](docs/microsoft-foundry/ai-model-deployment.md)
- [AI 워크숍 실습](docs/microsoft-foundry/ai-workshop-lab.md) - **신규**: 포괄적인 2-3시간 실습 랩
- [인터랙티브 워크숍 가이드](workshop/README.md) - **신규**: MkDocs 미리보기를 제공하는 브라우저 기반 워크숍
- [Microsoft Foundry 템플릿](README.md#featured-microsoft-foundry-templates)
- [Workshop Instructions](../../workshop/docs/instructions) - **신규**: 단계별 가이드 연습

#### 실습 결과
RAG 기능을 갖춘 AI 기반 채팅 애플리케이션을 배포하고 구성합니다

#### 워크숍 학습 경로 (선택적 확장)
**신규 인터랙티브 경험**: [전체 워크숍 가이드](workshop/README.md)
1. **발견** (30분): 템플릿 선택 및 평가
2. **배포** (45분): AI 템플릿 기능 배포 및 검증  
3. **분해** (30분): 템플릿 아키텍처 및 구성 요소 이해
4. **구성** (30분): 설정 및 매개변수 사용자화
5. **맞춤화** (45분): 수정 및 반복하여 자신의 것으로 만드세요
6. **해체** (15분): 리소스 정리 및 라이프사이클 이해
7. **정리** (15분): 다음 단계 및 고급 학습 경로

---

### 챕터 3: 구성 및 인증 (45-60분) ⚙️
**필수 조건**: 챕터 1 완료  
**복잡도**: ⭐⭐

#### 학습 내용
- 환경 구성 및 관리
- 인증 및 보안 모범 사례
- 리소스 명명 및 구성
- 다중 환경 배포

#### 학습 자료
- [구성 가이드](docs/getting-started/configuration.md) - 환경 설정
- [인증 및 보안 패턴](docs/getting-started/authsecurity.md) - 관리형 ID 및 Key Vault 통합
- 다중 환경 예제

#### 실습 결과
적절한 인증과 보안을 갖춰 여러 환경을 관리합니다

---

### 챕터 4: 인프라를 코드로(IaC) & 배포 (1-1.5시간) 🏗️
**필수 조건**: 챕터 1-3 완료  
**복잡도**: ⭐⭐⭐

#### 학습 내용
- 고급 배포 패턴
- Bicep을 사용한 인프라 코드(IaC)
- 리소스 프로비저닝 전략
- 사용자 정의 템플릿 생성

- Azure Container Apps 및 AZD를 사용한 컨테이너화된 애플리케이션 배포

#### 학습 자료
- [배포 가이드](docs/deployment/deployment-guide.md) - 전체 워크플로
- [리소스 프로비저닝](docs/deployment/provisioning.md) - 리소스 관리
- 컨테이너 및 마이크로서비스 예제
- [컨테이너 앱 예제](examples/container-app/README.md) - 빠른 시작, 프로덕션 및 고급 배포 패턴

#### 실습 결과
사용자 정의 인프라 템플릿을 사용하여 복잡한 다중 서비스 애플리케이션을 배포합니다

---

### 챕터 5: 멀티 에이전트 AI 솔루션 (2-3시간) 🤖🤖
**필수 조건**: 챕터 1-2 완료  
**복잡도**: ⭐⭐⭐⭐

#### 학습 내용
- 멀티 에이전트 아키텍처 패턴
- 에이전트 오케스트레이션 및 조정
- 프로덕션 준비된 AI 배포
- 고객 및 재고 에이전트 구현

- 에이전트 기반 솔루션의 일부로 컨테이너화된 마이크로서비스 통합

#### 학습 자료
- [리테일 멀티 에이전트 솔루션](examples/retail-scenario.md) - 전체 구현
- [ARM 템플릿 패키지](../../examples/retail-multiagent-arm-template) - 원클릭 배포
- 멀티 에이전트 조정 패턴
- [마이크로서비스 아키텍처 예제](../../examples/container-app/microservices) - 서비스 간 통신, 비동기 메시징 및 프로덕션 배포

#### 실습 결과
프로덕션 준비된 멀티 에이전트 AI 솔루션을 배포하고 관리합니다

---

### 챕터 6: 배포 전 검증 및 계획 (1 시간) 🔍
**필수 조건**: 챕터 4 완료  
**복잡도**: ⭐⭐

#### 학습 내용
- 용량 계획 및 리소스 검증
- SKU 선택 전략
- 사전 점검 및 자동화
- 비용 최적화 계획

#### 학습 자료
- [용량 계획](docs/pre-deployment/capacity-planning.md) - 리소스 검증
- [SKU 선택](docs/pre-deployment/sku-selection.md) - 비용 효율적인 선택
- [사전 점검](docs/pre-deployment/preflight-checks.md) - 자동화 스크립트
- [Application Insights 통합](docs/pre-deployment/application-insights.md) - 모니터링 및 관찰성
- [멀티 에이전트 조정 패턴](docs/pre-deployment/coordination-patterns.md) - 에이전트 오케스트레이션 전략

#### 실습 결과
실행 전에 배포를 검증하고 최적화합니다
---

### Chapter 7: 문제 해결 및 디버깅 (1-1.5 hours) 🔧
**Prerequisites**: Any deployment chapter completed  
**Complexity**: ⭐⭐

#### What You'll Learn
- 체계적인 디버깅 접근법
- 일반적인 문제 및 해결책
- AI 특화 문제 해결
- 성능 최적화

#### Learning Resources
- [일반적인 문제](docs/troubleshooting/common-issues.md) - FAQ 및 솔루션
- [디버깅 가이드](docs/troubleshooting/debugging.md) - 단계별 전략
- [AI 특화 문제 해결](docs/troubleshooting/ai-troubleshooting.md) - AI 서비스 문제

#### Practical Outcome
일반적인 배포 문제를 독립적으로 진단하고 해결할 수 있음

---

### Chapter 8: Production & Enterprise Patterns (2-3 hours) 🏢
**Prerequisites**: Chapters 1-4 completed  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- 프로덕션 배포 전략
- 엔터프라이즈 보안 패턴
- 모니터링 및 비용 최적화
- 확장성 및 거버넌스

- 프로덕션 컨테이너 앱 배포를 위한 모범 사례(보안, 모니터링, 비용, CI/CD)

#### Learning Resources
- [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - 엔터프라이즈 패턴
- 마이크로서비스 및 엔터프라이즈 예제
- 모니터링 및 거버넌스 프레임워크
- [Microservices Architecture Example](../../examples/container-app/microservices) - 블루-그린/카나리 배포, 분산 추적, 비용 최적화

#### Practical Outcome
완전한 프로덕션 기능을 갖춘 엔터프라이즈 준비 애플리케이션 배포

---

## Learning Progression and Complexity

### Progressive Skill Building

- **🌱 Beginners**: Chapter 1 (기초) → Chapter 2 (AI 개발)부터 시작
- **🔧 Intermediate**: Chapter 3-4 (구성 및 인프라) → Chapter 6 (검증)
- **🚀 Advanced**: Chapter 5 (멀티 에이전트 솔루션) → Chapter 7 (문제 해결)
- **🏢 Enterprise**: 모든 챕터 완료, Chapter 8 (프로덕션 패턴)에 중점

- **Container App Path**: Chapter 4 (컨테이너화된 배포), Chapter 5 (마이크로서비스 통합), Chapter 8 (프로덕션 모범 사례)

### Complexity Indicators

- **⭐ Basic**: 단일 개념, 안내형 튜토리얼, 30-60분
- **⭐⭐ Intermediate**: 다중 개념, 실습 위주, 1-2시간  
- **⭐⭐⭐ Advanced**: 복잡한 아키텍처, 맞춤형 솔루션, 1-3시간
- **⭐⭐⭐⭐ Expert**: 프로덕션 시스템, 엔터프라이즈 패턴, 2-4시간

### Flexible Learning Paths

#### 🎯 AI Developer Fast Track (4-6 hours)
1. **Chapter 1**: Foundation & Quick Start (45 mins)
2. **Chapter 2**: AI-First Development (2 hours)  
3. **Chapter 5**: Multi-Agent AI Solutions (3 hours)
4. **Chapter 8**: Production AI Best Practices (1 hour)

#### 🛠️ Infrastructure Specialist Path (5-7 hours)
1. **Chapter 1**: Foundation & Quick Start (45 mins)
2. **Chapter 3**: Configuration & Authentication (1 hour)
3. **Chapter 4**: Infrastructure as Code & Deployment (1.5 hours)
4. **Chapter 6**: Pre-Deployment Validation & Planning (1 hour)
5. **Chapter 7**: Troubleshooting & Debugging (1.5 hours)
6. **Chapter 8**: Production & Enterprise Patterns (2 hours)

#### 🎓 Complete Learning Journey (8-12 hours)
모든 8개 챕터를 순차적으로 완료하고 실습 및 검증 수행

## Course Completion Framework

### Knowledge Validation
- **Chapter Checkpoints**: 측정 가능한 결과가 있는 실습 과제
- **Hands-On Verification**: 각 챕터별로 작동하는 솔루션 배포
- **Progress Tracking**: 시각적 표시 및 완료 배지
- **Community Validation**: Azure Discord 채널에서 경험 공유

### Learning Outcomes Assessment

#### Chapter 1-2 Completion (Foundation + AI)
- ✅ AZD를 사용하여 기본 웹 애플리케이션 배포
- ✅ RAG를 사용한 AI 기반 채팅 애플리케이션 배포
- ✅ AZD 핵심 개념 및 AI 통합 이해

#### Chapter 3-4 Completion (Configuration + Infrastructure)  
- ✅ 다중 환경 배포 관리
- ✅ 커스텀 Bicep 인프라 템플릿 생성
- ✅ 보안 인증 패턴 구현

#### Chapter 5-6 Completion (Multi-Agent + Validation)
- ✅ 복잡한 멀티 에이전트 AI 솔루션 배포
- ✅ 용량 계획 및 비용 최적화 수행
- ✅ 자동화된 사전 배포 검증 구현

#### Chapter 7-8 Completion (Troubleshooting + Production)
- ✅ 배포 문제를 독립적으로 디버그 및 해결  
- ✅ 엔터프라이즈급 모니터링 및 보안 구현
- ✅ 거버넌스를 갖춘 프로덕션 준비 애플리케이션 배포

### Certification and Recognition
- **Course Completion Badge**: 실습 검증을 포함해 8개 챕터 모두 완료
- **Community Recognition**: Microsoft Foundry Discord에서 적극적인 참여
- **Professional Development**: 업계 관련 AZD 및 AI 배포 기술
- **Career Advancement**: 엔터프라이즈 준비된 클라우드 배포 역량

## 🎓 Comprehensive Learning Outcomes

### Foundation Level (Chapters 1-2)
기초 챕터 완료 시 학습자는 다음을 수행할 수 있습니다:

**Technical Capabilities:**
- AZD 명령을 사용하여 간단한 웹 애플리케이션을 Azure에 배포
- RAG 기능을 갖춘 AI 기반 채팅 애플리케이션 구성 및 배포
- AZD의 핵심 개념 이해: 템플릿, 환경, 프로비저닝 워크플로우
- Microsoft Foundry 서비스를 AZD 배포와 통합
- Azure AI 서비스 구성 및 API 엔드포인트 탐색

**Professional Skills:**
- 일관된 결과를 위한 구조화된 배포 워크플로우 준수
- 로그 및 문서를 사용하여 기본 배포 문제를 해결
- 클라우드 배포 프로세스에 대해 효과적으로 커뮤니케이션
- 안전한 AI 서비스 통합을 위한 모범 사례 적용

**Learning Verification:**
- ✅ `todo-nodejs-mongo` 템플릿 성공적으로 배포
- ✅ RAG와 함께 `azure-search-openai-demo` 배포 및 구성
- ✅ 인터랙티브 워크숍 과제(Discovery 단계) 완료
- ✅ Azure Discord 커뮤니티 토론 참여

### Intermediate Level (Chapters 3-4)
중급 챕터 완료 시 학습자는 다음을 수행할 수 있습니다:

**Technical Capabilities:**
- 다중 환경 배포(dev, staging, production) 관리
- 인프라 코드용 커스텀 Bicep 템플릿 생성
- 관리형 ID를 사용한 보안 인증 패턴 구현
- 맞춤 구성으로 복잡한 다중 서비스 애플리케이션 배포
- 비용 및 성능을 고려한 리소스 프로비저닝 전략 최적화

**Professional Skills:**
- 확장 가능한 인프라 아키텍처 설계
- 클라우드 배포를 위한 보안 모범 사례 구현
- 팀 협업을 위한 인프라 패턴 문서화
- 요구사항에 적합한 Azure 서비스 평가 및 선택

**Learning Verification:**
- ✅ 환경별 설정으로 분리된 환경 구성
- ✅ 다중 서비스 애플리케이션용 커스텀 Bicep 템플릿 생성 및 배포
- ✅ 보안 액세스를 위한 관리형 ID 인증 구현
- ✅ 실제 시나리오 기반 구성 관리 실습 완료

### Advanced Level (Chapters 5-6)
고급 챕터 완료 시 학습자는 다음을 수행할 수 있습니다:

**Technical Capabilities:**
- 조정된 워크플로우로 멀티 에이전트 AI 솔루션 배포 및 오케스트레이션
- 리테일 시나리오용 Customer 및 Inventory 에이전트 아키텍처 구현
- 종합적인 용량 계획 및 리소스 검증 수행
- 자동화된 사전 배포 검증 및 최적화 실행
- 워크로드 요구사항에 기반한 비용 효율적인 SKU 선택 설계

**Professional Skills:**
- 프로덕션 환경을 위한 복잡한 AI 솔루션 아키텍처 설계
- AI 배포 전략에 대한 기술적 논의 주도
- AZD 및 AI 배포 모범 사례에 대해 주니어 개발자 멘토링
- 비즈니스 요구사항에 맞는 AI 아키텍처 패턴 평가 및 권고

**Learning Verification:**
- ✅ ARM 템플릿으로 완전한 리테일 멀티 에이전트 솔루션 배포
- ✅ 에이전트 간 조정 및 워크플로우 오케스트레이션 시연
- ✅ 실제 리소스 제약을 고려한 용량 계획 실습 완료
- ✅ 자동화된 사전 비행 검사로 배포 준비 검증

### Expert Level (Chapters 7-8)
전문가 챕터 완료 시 학습자는 다음을 수행할 수 있습니다:

**Technical Capabilities:**
- 복잡한 배포 문제를 독립적으로 진단 및 해결
- 엔터프라이즈급 보안 패턴 및 거버넌스 프레임워크 구현
- 포괄적인 모니터링 및 경고 전략 설계
- 규모, 비용 및 성능을 위한 프로덕션 배포 최적화
- 적절한 테스트 및 검증을 포함한 CI/CD 파이프라인 구축

**Professional Skills:**
- 엔터프라이즈 클라우드 전환 이니셔티브 주도
- 조직 배포 표준 설계 및 구현
- 고급 AZD 실무에 대해 개발팀 교육 및 멘토링
- 엔터프라이즈 AI 배포를 위한 기술적 의사결정에 영향력 행사

**Learning Verification:**
- ✅ 복잡한 다중 서비스 배포 실패 해결
- ✅ 규정 준수를 고려한 엔터프라이즈 보안 패턴 구현
- ✅ Application Insights를 이용한 프로덕션 모니터링 설계 및 배포
- ✅ 엔터프라이즈 거버넌스 프레임워크 구현 완료

## 🎯 Course Completion Certification

### Progress Tracking Framework
구조화된 체크포인트를 통해 학습 진행 상황 추적:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### Verification Process
각 챕터를 완료한 후 다음을 통해 지식을 검증:

1. **Practical Exercise Completion**: 각 챕터에 대해 작동하는 솔루션 배포
2. **Knowledge Assessment**: FAQ 섹션 검토 및 자가 평가 완료
3. **Community Engagement**: Azure Discord에서 경험 공유 및 피드백 받기
4. **Portfolio Development**: 배포 및 학습 내용 문서화
5. **Peer Review**: 다른 학습자와 복잡한 시나리오 협업

### Course Completion Benefits
모든 챕터를 검증과 함께 완료하면 졸업생은 다음을 보유하게 됩니다:

**Technical Expertise:**
- **Production Experience**: 실제 AI 애플리케이션을 Azure 환경에 배포한 경험
- **Professional Skills**: 엔터프라이즈 수준의 배포 및 문제 해결 역량  
- **Architecture Knowledge**: 멀티 에이전트 AI 솔루션 및 복잡한 인프라 패턴
- **Troubleshooting Mastery**: 배포 및 구성 문제의 독립적 해결 능력

**Professional Development:**
- **Industry Recognition**: 수요가 높은 AZD 및 AI 배포 분야에서 검증 가능한 기술
- **Career Advancement**: 클라우드 아키텍트 및 AI 배포 전문가 역할에 대한 자격
- **Community Leadership**: Azure 개발자 및 AI 커뮤니티의 적극적인 멤버십
- **Continuous Learning**: 고급 Microsoft Foundry 전문화의 기초

**Portfolio Assets:**
- **Deployed Solutions**: AI 애플리케이션 및 인프라 패턴의 작동 예제
- **Documentation**: 포괄적인 배포 가이드 및 문제 해결 절차  
- **Community Contributions**: Azure 커뮤니티와 공유한 토론, 예제 및 개선사항
- **Professional Network**: Azure 전문가 및 AI 배포 실무자와의 연결

### Post-Course Learning Path
졸업생은 다음 고급 전문화 준비가 됨:
- **Microsoft Foundry Expert**: AI 모델 배포 및 오케스트레이션에 대한 심화 전문화
- **Cloud Architecture Leadership**: 엔터프라이즈 규모 배포 설계 및 거버넌스
- **Developer Community Leadership**: Azure 샘플 및 커뮤니티 리소스 기여
- **Corporate Training**: 조직 내에서 AZD 및 AI 배포 기술 교육 제공

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책 조항:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 내용이 포함될 수 있음을 유의하시기 바랍니다. 원문(원어로 작성된 문서)이 공식적인 출처로 간주되어야 합니다. 중요한 정보의 경우 전문 번역가에 의한 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 당사가 책임지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->