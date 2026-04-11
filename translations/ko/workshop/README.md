<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AI 개발자를 위한 AZD 워크숍
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Azure Developer CLI로 AI 애플리케이션을 구축하는 실습 워크숍입니다.</strong><br>
      AZD 템플릿과 AI 배포 워크플로를 마스터할 수 있도록 7개 모듈을 완료하세요.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 최종 업데이트: 2026년 3월
      </span>
    </div>
  </div>
</div>

# AI 개발자를 위한 AZD 워크숍

Azure Developer CLI(AZD)를 중심으로 AI 애플리케이션 배포를 학습하는 실습형 워크숍에 오신 것을 환영합니다. 이 워크숍은 AZD 템플릿을 실습으로 이해하도록 3단계로 구성되어 있습니다:

1. <strong>탐색</strong> - 나에게 맞는 템플릿을 찾기
1. <strong>배포</strong> - 배포하고 정상 동작을 검증하기
1. <strong>커스터마이즈</strong> - 수정하고 반복하여 내 것으로 만들기!

워크숍 전반에 걸쳐 핵심 개발 도구와 워크플로도 소개하여 엔드투엔드 개발 여정을 간소화하는 데 도움을 드립니다.

<br/>

## 브라우저 기반 가이드

워크숍 강의는 Markdown으로 되어 있습니다. GitHub에서 직접 탐색하거나 아래 스크린샷에 표시된 것처럼 브라우저 기반 미리보기를 실행할 수 있습니다.

![워크숍](../../../translated_images/ko/workshop.75906f133e6f8ba0.webp)

이 옵션을 사용하려면 리포지토리를 내 프로필로 포크한 다음 GitHub Codespaces를 실행하세요. VS Code 터미널이 활성화되면 다음 명령을 입력하세요:

This browser preview works in GitHub Codespaces, dev containers, or a local clone with Python and MkDocs installed.

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

In a few seconds, you will see a pop-up dialog. Select the option to `Open in browser`. The web-based guide will now open in a new browser tab. Some benefits of this preview:

1. **내장 검색** - 키워드나 강의를 빠르게 찾기
1. **복사 아이콘** - 코드블록 위로 마우스를 올리면 이 옵션이 표시됩니다
1. **테마 토글** - 다크/라이트 테마 전환
1. **도움 받기** - 참여하려면 푸터의 Discord 아이콘을 클릭하세요!

<br/>

## 워크숍 개요

**소요 시간:** 3-4시간  
**레벨:** 초급~중급  
**필수 조건:** Azure, AI 개념, VS Code 및 명령줄 도구에 대한 익숙함.

이 워크숍은 실습을 통해 배우는 형식입니다. 연습 문제를 완료한 후에는 AZD 초보자 가이드 커리큘럼을 검토하여 보안 및 생산성 모범 사례에 대한 학습을 계속할 것을 권장합니다.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | [소개](docs/instructions/0-Introduction.md) | 목표 설정, 이해 |
| 30 mins | [AI 템플릿 선택](docs/instructions/1-Select-AI-Template.md) | 옵션 탐색 및 시작 템플릿 선택 | 
| 30 mins | [AI 템플릿 검증](docs/instructions/2-Validate-AI-Template.md) | 기본 솔루션을 Azure에 배포 |
| 30 mins | [AI 템플릿 분해](docs/instructions/3-Deconstruct-AI-Template.md) | 구조 및 구성 탐색 |
| 30 mins | [AI 템플릿 구성](docs/instructions/4-Configure-AI-Template.md) | 기능 활성화 및 사용해보기 |
| 30 mins | [AI 템플릿 맞춤화](docs/instructions/5-Customize-AI-Template.md) | 템플릿을 필요에 맞게 조정 |
| 30 mins | [인프라 정리](docs/instructions/6-Teardown-Infrastructure.md) | 리소스 정리 및 해제 |
| 15 mins | [마무리 및 다음 단계](docs/instructions/7-Wrap-up.md) | 학습 자료, 워크숍 과제 |

<br/>

## 학습 내용

AZD 템플릿을 Microsoft Foundry에서 엔드투엔드 개발을 탐색할 수 있는 학습 샌드박스로 생각하세요. 워크숍이 끝나면 이 맥락에서 다양한 도구와 개념에 대한 직관적인 감각을 갖게 될 것입니다.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | 도구 명령어 및 워크플로 이해|
| **AZD 템플릿**| 프로젝트 구조 및 구성 이해|
| **Azure AI Agent**| Microsoft Foundry 프로젝트 프로비저닝 및 배포  |
| **Azure AI Search**| 에이전트와 함께 컨텍스트 엔지니어링 활성화 |
| <strong>관찰성</strong>| 추적, 모니터링 및 평가 탐색 |
| **레드팀 테스트**| 적대적 테스트 및 완화 방법 탐색 |

<br/>

## 워크숍 구성

워크숍은 템플릿 탐색에서 배포, 분해, 커스터마이즈까지의 여정을 안내하도록 구성되어 있으며 공식 [AI 에이전트 시작하기](https://github.com/Azure-Samples/get-started-with-ai-agents) 스타터 템플릿을 기반으로 합니다.

### [모듈 1: AI 템플릿 선택](docs/instructions/1-Select-AI-Template.md) (30분)

- AI 템플릿이란 무엇인가?
- AI 템플릿은 어디에서 찾을 수 있나?
- AI 에이전트 구축을 어떻게 시작하나?
- <strong>실습</strong>: Codespaces 또는 개발 컨테이너에서 빠르게 시작

### [모듈 2: AI 템플릿 검증](docs/instructions/2-Validate-AI-Template.md) (30분)

- AI 템플릿 아키텍처는 무엇인가?
- AZD 개발 워크플로는 무엇인가?
- AZD 개발 관련 도움은 어떻게 받을 수 있나?
- <strong>실습</strong>: AI 에이전트 템플릿 배포 및 검증

### [모듈 3: AI 템플릿 분해](docs/instructions/3-Deconstruct-AI-Template.md) (30분)

- `.azure/`에서 환경을 살펴보기 
- `infra/`에서 리소스 설정 살펴보기 
- `azure.yaml`에서 AZD 구성 살펴보기
- <strong>실습</strong>: 환경 변수 수정 및 재배포

### [모듈 4: AI 템플릿 구성](docs/instructions/4-Configure-AI-Template.md) (30분)
- 탐색: Retrieval Augmented Generation(검색 보강 생성)
- 탐색: 에이전트 평가 및 레드팀
- 탐색: 추적 및 모니터링
- <strong>실습</strong>: AI 에이전트 + 관찰성 탐색 

### [모듈 5: AI 템플릿 맞춤화](docs/instructions/5-Customize-AI-Template.md) (30분)
- 정의: 시나리오 요구사항이 포함된 PRD 작성
- 구성: AZD용 환경 변수 설정
- 구현: 추가 작업을 위한 라이프사이클 훅
- <strong>실습</strong>: 내 시나리오에 맞게 템플릿 맞춤화

### [모듈 6: 인프라 정리](docs/instructions/6-Teardown-Infrastructure.md) (30분)
- 요약: AZD 템플릿이란?
- 요약: Azure Developer CLI를 사용하는 이유는?
- 다음 단계: 다른 템플릿 시도해보기!
- <strong>실습</strong>: 인프라 프로비저닝 해제 및 정리

<br/>

## 워크숍 챌린지

더 도전하고 싶으신가요? 다음은 몇 가지 프로젝트 제안입니다 - 또는 아이디어를 공유해 주세요!!

| 프로젝트 | 설명 |
|:---|:---|
|1. **복잡한 AI 템플릿 분해** | 우리가 설명한 워크플로와 도구를 사용하여 다른 AI 솔루션 템플릿을 배포, 검증 및 커스터마이즈할 수 있는지 확인해 보세요. _무엇을 배웠나요?_|
|2. **시나리오에 맞춰 맞춤화**  | 다른 시나리오에 대한 PRD(제품 요구사항 문서)를 작성해 보세요. 그런 다음 Agent Model에서 템플릿 리포지토리의 GitHub Copilot을 사용하여 커스터마이즈 워크플로를 생성하도록 요청하세요. _무엇을 배웠나요? 이러한 제안을 어떻게 개선할 수 있을까요?_|
| | |

## 피드백이 있으신가요?

1. 이 리포지토리에 이슈를 등록하세요 - 편의를 위해 태그를 `Workshop`으로 지정하세요.
1. Microsoft Foundry Discord에 참여하여 동료들과 연결하세요!


| | | 
|:---|:---|
| **📚 코스 홈**| [AZD 초보자 가이드](../README.md)|
| **📖 문서** | [AI 템플릿 시작하기](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI 템플릿** | [Microsoft Foundry 템플릿](https://ai.azure.com/templates) |
|**🚀 다음 단계** | [워크숍 시작](#워크숍-개요) |
| | |

<br/>

---

**탐색:** [메인 코스](../README.md) | [소개](docs/instructions/0-Introduction.md) | [모듈 1: AI 템플릿 선택](docs/instructions/1-Select-AI-Template.md)

**AZD로 AI 애플리케이션을 구축할 준비가 되셨나요?**

[워크숍 시작: 소개 →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역에는 오류나 부정확성이 있을 수 있음을 알려드립니다. 원문(원어로 작성된 문서)을 권위 있는 공식 출처로 간주하시기 바랍니다. 중요한 정보의 경우 전문 번역(인간 번역)을 권장합니다. 이 번역의 사용으로 인해 발생한 오해나 오해의 소지에 대해서는 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->