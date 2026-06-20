# AI 개발자를 위한 AZD 워크숍

> 2026년 6월 `azd 1.25.6` 버전에서 검증됨.

> [!IMPORTANT]  
> **이 워크숍은 로컬 브라우저에서 미리 볼 수 있는 워크숍 가이드가 함께 제공됩니다. 시작하려면 GitHub Codespaces, 개발 컨테이너, 또는 MkDocs가 설치된 로컬 클론에서 저장소를 연 후—활성 VS Code 터미널이 나타날 때까지 기다리고 다음을 입력하세요:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **브라우저에서 미리보기 페이지를 열라는 팝업 대화 상자가 나타납니다.**

Azure Developer CLI(AZD)에 대해 배우고 AI 애플리케이션 배포에 중점을 둔 실습 워크숍에 오신 것을 환영합니다. 이 워크숍은 세 단계로 AZD 템플릿을 직접 경험할 수 있도록 돕습니다:

1. <strong>발견</strong> - 자신에게 맞는 템플릿 찾기.
1. <strong>배포</strong> - 배포 후 작동 확인.
1. <strong>맞춤화</strong> - 수정하고 반복하여 자신만의 것으로 만들기!

이 워크숍 동안 핵심 개발 도구와 워크플로우도 소개되어, 전체 개발 여정을 간소화하는 데 도움을 드립니다.

| | | 
|:---|:---|
| **📚 강좌 홈**| [초보자를 위한 AZD](../README.md)|
| **📖 문서** | [AI 템플릿 시작하기](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI 템플릿** | [Microsoft Foundry 템플릿](https://ai.azure.com/templates) |
|**🚀 다음 단계** | [도전과제 참여하기](#workshop-challenge) |
| | |

## 워크숍 개요

**소요 시간:** 3-4시간  
**수준:** 초급에서 중급  
**선행 조건:** Azure, AI 개념, VS Code 및 커맨드라인 도구에 대한 기본 지식

이 워크숍은 직접 해보며 배우는 실습형입니다. 연습 문제를 완료한 후에는 보안을 비롯한 생산성 모범 사례 학습을 위해 AZD 초보자 커리큘럼을 검토하는 것을 권장합니다.

| 시간| 모듈  | 목표 |
|:---|:---|:---|
| 15분 | 소개 | 기본 개념 설정, 목표 이해 |
| 30분 | AI 템플릿 선택 | 옵션 탐색 및 시작 템플릿 선택 | 
| 30분 | AI 템플릿 검증 | 기본 솔루션 Azure에 배포 |
| 30분 | AI 템플릿 해체 | 구조와 구성 탐색 |
| 30분 | AI 템플릿 구성 | 활성화 및 사용 가능한 기능 시도 |
| 30분 | AI 템플릿 맞춤화 | 템플릿을 필요에 맞게 조정 |
| 30분 | 인프라 해체 | 정리 및 자원 해제 |
| 15분 | 마무리 및 다음 단계 | 학습 자료, 워크숍 도전과제 |
| | |

## 학습 내용

AZD 템플릿을 Microsoft Foundry의 엔드투엔드 개발을 위한 다양한 기능과 도구를 탐색하는 학습 샌드박스라고 생각하세요. 이 워크숍이 끝나면 이 맥락에서 여러 도구와 개념에 대한 직관적인 감각을 가지게 될 것입니다.

| 개념  | 목표 |
|:---|:---|
| **Azure Developer CLI** | 도구 명령어와 워크플로우 이해 |
| **AZD 템플릿** | 프로젝트 구조와 구성 이해 |
| **Azure AI Agent** | Microsoft Foundry 프로젝트 프로비저닝 및 배포 |
| **Azure AI Search** | 에이전트를 통한 컨텍스트 엔지니어링 활성화 |
| **관측 가능성** | 추적, 모니터링, 평가 탐색 |
| **레드 팀 활동** | 적대적 테스트 및 완화 방안 탐색 |
| | |

## 워크숍 모듈

시작할 준비가 되셨나요? 다음 워크숍 모듈을 따라가세요:

- [모듈 1: AI 템플릿 선택](instructions/1-Select-AI-Template.md)
- [모듈 2: AI 템플릿 검증](instructions/2-Validate-AI-Template.md) 
- [모듈 3: AI 템플릿 해체](instructions/3-Deconstruct-AI-Template.md)
- [모듈 4: AI 템플릿 구성](instructions/4-Configure-AI-Template.md)
- [모듈 5: AI 템플릿 맞춤화](instructions/5-Customize-AI-Template.md)
- [모듈 6: 인프라 해체](instructions/6-Teardown-Infrastructure.md)
- [모듈 7: 마무리 및 다음 단계](instructions/7-Wrap-up.md)

## 의견이 있으신가요?

이 저장소에 이슈를 게시하시거나(`Workshop` 태그), [Discord](https://aka.ms/foundry/discord)에 접속해 `#get-help` 채널에 문의하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->