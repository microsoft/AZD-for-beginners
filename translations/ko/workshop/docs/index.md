# AZD for AI 개발자 워크숍

> `azd 1.23.12`에 대해 2026년 3월에 검증됨.

> [!IMPORTANT]  
> **이 워크숍에는 로컬 브라우저에서 미리 볼 수 있는 워크숍 가이드가 포함되어 있습니다. 시작하려면 리포지토리를 GitHub Codespaces, 개발 컨테이너 또는 MkDocs가 설치된 로컬 클론에서 열고—활성 VS Code 터미널이 표시될 때까지 기다린 후 다음을 입력하세요:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **브라우저에서 미리보기 페이지를 열라는 팝업 대화상자가 표시됩니다.**

Azure Developer CLI(AZD)를 배우고 AI 애플리케이션 배포에 중점을 둔 실습 워크숍에 오신 것을 환영합니다. 이 워크숍은 AZD 템플릿을 적용해 보는 3단계 학습을 도와드립니다:

1. **탐색(Discovery)** - 자신에게 적합한 템플릿 찾기
1. **배포(Deployment)** - 배포하고 작동 여부 확인하기
1. **맞춤화(Customization)** - 수정하고 반복하여 자신만의 것으로 만들기!

이 워크숍을 진행하면서 핵심 개발 도구와 워크플로도 소개되어 엔드투엔드 개발 여정을 효율화하는 데 도움이 됩니다.

| | | 
|:---|:---|
| **📚 강좌 홈**| [AZD For Beginners](../README.md)|
| **📖 문서** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI 템플릿** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 다음 단계** | [Take The Challenge](#workshop-challenge) |
| | |

## 워크숍 개요

**기간:** 3-4시간  
**수준:** 초급 ~ 중급  
**전제 조건:** Azure, AI 개념, VS Code 및 명령줄 도구에 대한 기본 지식.

이 워크숍은 실습 중심으로 진행됩니다. 연습 문제를 완료한 후에는 보안 및 생산성 모범 사례로 학습을 이어가기 위해 AZD For Beginners 커리큘럼을 검토하는 것을 권장합니다.

| 시간| 모듈  | 목표 |
|:---|:---|:---|
| 15 mins | 소개 | 배경 설정, 목표 이해 |
| 30 mins | AI 템플릿 선택 | 옵션 탐색 및 시작 템플릿 선택 | 
| 30 mins | AI 템플릿 검증 | 기본 솔루션을 Azure에 배포 |
| 30 mins | AI 템플릿 분해 | 구조 및 구성 탐색 |
| 30 mins | AI 템플릿 구성 | 사용 가능한 기능 활성화 및 시도 |
| 30 mins | AI 템플릿 맞춤화 | 템플릿을 요구에 맞게 조정 |
| 30 mins | 인프라 정리 | 리소스 정리 및 해제 |
| 15 mins | 정리 및 다음 단계 | 학습 자료, 워크숍 과제 |
| | |

## 학습할 내용

AZD 템플릿을 Microsoft Foundry에서의 엔드투엔드 개발을 탐험하기 위한 학습 샌드박스로 생각하세요. 워크숍이 끝나면 이 맥락에서 다양한 도구와 개념에 대한 직관적인 이해를 갖게 될 것입니다.

| 개념  | 목표 |
|:---|:---|
| **Azure Developer CLI** | 도구 명령 및 워크플로 이해|
| **AZD 템플릿**| 프로젝트 구조 및 구성 이해|
| **Azure AI Agent**| Microsoft Foundry 프로젝트 프로비저닝 및 배포  |
| **Azure AI Search**| 에이전트와 함께 컨텍스트 엔지니어링 활성화 |
| <strong>관찰성</strong>| 추적, 모니터링 및 평가 탐색 |
| **Red Teaming**| 적대적 테스트 및 완화 방안 탐색 |
| | |

## 워크숍 모듈

시작할 준비가 되었나요? 워크숍 모듈을 통해 진행하세요:

- [모듈 1: AI 템플릿 선택](instructions/1-Select-AI-Template.md)
- [모듈 2: AI 템플릿 검증](instructions/2-Validate-AI-Template.md) 
- [모듈 3: AI 템플릿 분해](instructions/3-Deconstruct-AI-Template.md)
- [모듈 4: AI 템플릿 구성](instructions/4-Configure-AI-Template.md)
- [모듈 5: AI 템플릿 맞춤화](instructions/5-Customize-AI-Template.md)
- [모듈 6: 인프라 정리](instructions/6-Teardown-Infrastructure.md)
- [모듈 7: 정리 및 다음 단계](instructions/7-Wrap-up.md)

## 피드백이 있으신가요?

이 리포지토리에 이슈를 게시하세요(태그: `Workshop`) 또는 [Discord](https://aka.ms/foundry/discord)에 참여하여 `#get-help` 채널에 게시하세요

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원문(원어)의 문서를 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문 번역가에 의한 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 어떠한 오해나 잘못된 해석에 대해서도 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->