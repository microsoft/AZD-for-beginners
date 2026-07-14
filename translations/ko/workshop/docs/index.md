# AI 개발자를 위한 AZD 워크숍

> 2026년 7월 `azd 1.27.1` 버전으로 검증됨.

> [!IMPORTANT]  
> **이 워크숍은 로컬 브라우저에서 미리 볼 수 있는 워크숍 가이드가 포함되어 있습니다. 시작하려면 GitHub Codespaces, 개발 컨테이너 또는 MkDocs가 설치된 로컬 클론에서 리포를 연 후, 활성화된 VS 코드 터미널이 보일 때까지 기다렸다가 다음 명령을 입력하세요:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **브라우저에서 미리보기 페이지를 열기 위한 팝업 대화상자가 표시되어야 합니다.**

Azure Developer CLI (AZD)를 배우며 AI 애플리케이션 배포에 중점을 둔 실습 워크숍에 오신 것을 환영합니다. 이 워크숍은 AZD 템플릿을 3단계로 실습할 수 있게 도와줍니다:

1. **발견(Discovery)** - 자신에게 맞는 템플릿을 찾기
1. **배포(Deployment)** - 배포하고 작동하는지 검증하기
1. **커스터마이즈(Customization)** - 수정하고 반복하여 나만의 것으로 만들기!

이 워크숍 동안 핵심 개발 도구와 워크플로우도 소개되어, 엔드투엔드 개발 여정을 간소화하는 데 도움이 됩니다.

| | | 
|:---|:---|
| **📚 과정 홈**| [초보자를 위한 AZD](../README.md)|
| **📖 문서** | [AI 템플릿 시작하기](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI 템플릿** | [Microsoft Foundry 템플릿](https://ai.azure.com/templates) |
|**🚀 다음 단계** | [챌린지 도전하기](#workshop-challenge) |
| | |

## 워크숍 개요

**소요 시간:** 3-4시간  
**수준:** 초급에서 중급  
**사전 조건:** Azure, AI 개념, VS Code 및 명령줄 도구에 익숙한 분.

본 워크숍은 실습 중심으로 진행되며, 연습 문제를 완료한 후에는 보안 및 생산성 모범 사례 학습을 계속하기 위해 AZD 초보자 커리큘럼을 검토할 것을 권장합니다.

| 시간| 모듈  | 목표 |
|:---|:---|:---|
| 15분 | 소개 | 목적 설정 및 목표 이해 |
| 30분 | AI 템플릿 선택 | 옵션 탐색 및 시작 템플릿 선택 | 
| 30분 | AI 템플릿 검증 | 기본 솔루션을 Azure에 배포 |
| 30분 | AI 템플릿 분해 | 구조와 설정 탐색 |
| 30분 | AI 템플릿 구성 | 활성화 및 사용 가능한 기능 시험 |
| 30분 | AI 템플릿 맞춤화 | 템플릿을 필요에 맞게 조정 |
| 30분 | 인프라 해체 | 정리 및 리소스 해제 |
| 15분 | 마무리 및 다음 단계 | 학습 자료, 워크숍 챌린지 |
| | |

## 배우게 될 내용

AZD 템플릿을 Microsoft Foundry에서 엔드투엔드 개발을 위한 다양한 기능과 도구를 탐색할 수 있는 학습 샌드박스로 생각하세요. 이 워크숍이 끝나면 이 환경에서 다양한 도구와 개념에 대한 직관적인 이해를 갖게 될 것입니다.

| 개념  | 목표 |
|:---|:---|
| **Azure Developer CLI** | 도구 명령어 및 워크플로우 이해 |
| **AZD 템플릿**| 프로젝트 구조 및 구성 이해 |
| **Azure AI Agent**| Microsoft Foundry 프로젝트 프로비저닝 및 배포  |
| **Azure AI Search**| 에이전트를 통한 컨텍스트 엔지니어링 활성화 |
| **관측성(Observability)**| 추적, 모니터링 및 평가 탐색 |
| **레드팀(Red Teaming)**| 적대적 테스트 및 완화책 탐색 |
| | |

## 워크숍 모듈

시작할 준비가 되셨나요? 워크숍 모듈을 탐색해 보세요:

- [모듈 1: AI 템플릿 선택](instructions/1-Select-AI-Template.md)
- [모듈 2: AI 템플릿 검증](instructions/2-Validate-AI-Template.md) 
- [모듈 3: AI 템플릿 분해](instructions/3-Deconstruct-AI-Template.md)
- [모듈 4: AI 템플릿 구성](instructions/4-Configure-AI-Template.md)
- [모듈 5: AI 템플릿 맞춤화](instructions/5-Customize-AI-Template.md)
- [모듈 6: 인프라 해체](instructions/6-Teardown-Infrastructure.md)
- [모듈 7: 마무리 및 다음 단계](instructions/7-Wrap-up.md)

## 피드백이 있나요?

이 리포에 이슈를 게시하세요(태그는 `Workshop`), 또는 [Discord](https://aka.ms/foundry/discord)에 참여하여 `#get-help` 채널에 글을 남기세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->