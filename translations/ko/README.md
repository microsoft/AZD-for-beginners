<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-09T16:25:16+00:00",
  "source_file": "README.md",
  "language_code": "ko"
}
-->
# AZD 초보자를 위한 가이드

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.ko.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

다음 단계를 따라 이 리소스를 사용해보세요:  
1. **저장소 포크하기**: 클릭 [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **저장소 클론하기**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Azure Discord 커뮤니티에 참여하여 전문가 및 다른 개발자들과 만나보세요**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 다국어 지원

#### GitHub Action을 통해 지원 (자동화 및 항상 최신 상태 유지)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](./README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**추가 번역 언어를 지원받고 싶다면 [여기](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)를 확인하세요.**

## 소개

Azure Developer CLI (azd)에 대한 종합 가이드에 오신 것을 환영합니다. 이 저장소는 학생부터 전문 개발자까지 모든 수준의 개발자가 Azure Developer CLI를 배우고 숙달하여 효율적인 클라우드 배포를 할 수 있도록 돕기 위해 설계되었습니다. 이 구조화된 학습 리소스는 Azure 클라우드 배포, 일반적인 문제 해결, 성공적인 AZD 템플릿 배포를 위한 모범 사례 구현에 대한 실습 경험을 제공합니다.

## 학습 목표

이 저장소를 통해 다음을 배울 수 있습니다:
- Azure Developer CLI의 기본 및 핵심 개념 숙달
- 코드로 인프라를 사용하여 Azure 리소스를 배포 및 프로비저닝하는 방법 학습
- 일반적인 AZD 배포 문제에 대한 문제 해결 기술 개발
- 사전 배포 검증 및 용량 계획 이해
- 보안 모범 사례 및 비용 최적화 전략 구현
- Azure에 프로덕션 준비 애플리케이션을 배포하는 자신감 구축

## 학습 결과

이 과정을 완료한 후, 다음을 수행할 수 있습니다:
- Azure Developer CLI를 성공적으로 설치, 구성 및 사용
- AZD 템플릿을 사용하여 애플리케이션 생성 및 배포
- 인증, 인프라 및 배포 문제 해결
- 용량 계획 및 SKU 선택을 포함한 사전 배포 점검 수행
- 모니터링, 보안 및 비용 관리 모범 사례 구현
- AZD 워크플로를 CI/CD 파이프라인에 통합

## 목차

- [Azure Developer CLI란 무엇인가?](../..)
- [빠른 시작](../..)
- [문서](../..)
- [예제 및 템플릿](../..)
- [리소스](../..)
- [기여](../..)

## Azure Developer CLI란 무엇인가?

Azure Developer CLI (azd)는 Azure에 애플리케이션을 구축하고 배포하는 과정을 가속화하는 개발자 중심의 명령줄 인터페이스입니다. 주요 기능은 다음과 같습니다:

- **템플릿 기반 배포** - 일반적인 애플리케이션 패턴을 위한 사전 제작된 템플릿 사용
- **코드로 인프라 관리** - Bicep 또는 Terraform을 사용하여 Azure 리소스 관리
- **통합 워크플로** - 애플리케이션 프로비저닝, 배포 및 모니터링을 원활하게 수행
- **개발자 친화적** - 개발자 생산성과 경험을 최적화

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

## 문서

### 시작하기
- [**AZD 기본 사항**](docs/getting-started/azd-basics.md) - 핵심 개념 및 용어
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

### 문제 해결
- [**일반적인 문제**](docs/troubleshooting/common-issues.md) - 자주 발생하는 문제와 해결책
- [**디버깅 가이드**](docs/troubleshooting/debugging.md) - 단계별 디버깅 전략

## 예제 및 템플릿

### 시작 템플릿
- [**간단한 웹 애플리케이션**](../../examples/simple-web-app) - 기본 Node.js 웹 애플리케이션 배포
- [**정적 웹사이트**](../../examples/static-website) - Azure Storage에서 정적 웹사이트 호스팅
- [**컨테이너 애플리케이션**](../../examples/container-app) - 컨테이너화된 애플리케이션 배포
- [**데이터베이스 애플리케이션**](../../examples/database-app) - 데이터베이스 통합 웹 애플리케이션

### 고급 시나리오
- [**마이크로서비스**](../../examples/microservices) - 다중 서비스 애플리케이션 아키텍처
- [**서버리스 함수**](../../examples/serverless-function) - Azure Functions 배포
- [**구성 예제**](../../examples/configurations) - 재사용 가능한 구성 패턴

## 리소스

### 빠른 참조
- [**명령어 치트 시트**](resources/cheat-sheet.md) - 필수 azd 명령어
- [**용어집**](resources/glossary.md) - Azure 및 azd 용어
- [**FAQ**](resources/faq.md) - 자주 묻는 질문
- [**학습 가이드**](resources/study-guide.md) - 종합적인 학습 목표 및 연습 문제

### 외부 리소스
- [Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure 가격 계산기](https://azure.microsoft.com/pricing/calculator/)
- [Azure 상태](https://status.azure.com/)

## 학습 경로

### 학생 및 초보자를 위한 경로
1. [AZD 기본 사항](docs/getting-started/azd-basics.md)부터 시작
2. [설치 가이드](docs/getting-started/installation.md) 따라하기
3. [첫 번째 프로젝트](docs/getting-started/first-project.md) 완료하기
4. [간단한 웹 애플리케이션 예제](../../examples/simple-web-app) 연습하기

### 개발자를 위한 경로
1. [구성 가이드](docs/getting-started/configuration.md) 검토
2. [배포 가이드](docs/deployment/deployment-guide.md) 학습
3. [데이터베이스 애플리케이션 예제](../../examples/database-app) 작업
4. [컨테이너 애플리케이션 예제](../../examples/container-app) 탐색

### DevOps 엔지니어를 위한 경로
1. [리소스 프로비저닝](docs/deployment/provisioning.md) 숙달
2. [사전 점검](docs/pre-deployment/preflight-checks.md) 구현
3. [용량 계획](docs/pre-deployment/capacity-planning.md) 연습
4. 고급 [마이크로서비스 예제](../../examples/microservices) 실습

## 기여

기여를 환영합니다! [기여 가이드](CONTRIBUTING.md)를 읽고 다음에 대해 자세히 알아보세요:
- 문제 및 기능 요청 제출 방법
- 코드 기여 지침
- 문서 개선
- 커뮤니티 표준

## 지원

- **문제**: [버그 보고 및 기능 요청](https://github.com/microsoft/azd-for-beginners/issues)  
- **토론**: [Microsoft Azure Discord 커뮤니티 Q&A 및 토론](https://discord.gg/microsoft-azure)  
- **이메일**: 비공개 문의  
- **Microsoft Learn**: [공식 Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## 라이선스

이 프로젝트는 MIT 라이선스에 따라 라이선스가 부여됩니다 - 자세한 내용은 [LICENSE](../../LICENSE) 파일을 참조하세요.

## 🎒 다른 강좌

우리 팀이 제작한 다른 강좌를 확인하세요:

- [**NEW** Model Context Protocol (MCP) 초보자를 위한 가이드](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents 초보자를 위한 가이드](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI 초보자를 위한 .NET 사용 강좌](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI 초보자를 위한 강좌](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI 초보자를 위한 Java 사용 강좌](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML 초보자를 위한 강좌](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [데이터 과학 초보자를 위한 강좌](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI 초보자를 위한 강좌](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [사이버 보안 초보자를 위한 강좌](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [초보자를 위한 웹 개발](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [초보자를 위한 IoT](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [초보자를 위한 XR 개발](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI 페어드 프로그래밍을 위한 GitHub Copilot 마스터하기](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [C#/.NET 개발자를 위한 GitHub Copilot 마스터하기](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [나만의 Copilot 모험 선택하기](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**탐색**  
- **다음 강의**: [AZD 기본](docs/getting-started/azd-basics.md)  

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서를 해당 언어로 작성된 상태에서 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.