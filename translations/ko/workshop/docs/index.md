# AI 개발자를 위한 AZD 워크숍

> 이 자료는 2026년 11월 4일 기준 AZD 1.37.2를 참조하여 검토되었습니다. 스크린샷은 예시이며, 서비스 가용성, 포털 라벨 및 템플릿 기본값은 변경될 수 있습니다.

> [!IMPORTANT]  
> **이 워크숍은 로컬 브라우저에서 미리 볼 수 있는 워크숍 가이드가 포함되어 있습니다. 시작하려면 GitHub Codespaces, 개발 컨테이너 또는 MkDocs가 설치된 로컬 클론에서 리포지토리를 열고, VS Code 터미널이 활성화될 때까지 기다린 후 아래 명령어를 입력하세요:**  
> 과정 리포지토리 루트에서 `requirements-dev.txt`를 설치한 다음, `python -m mkdocs serve --config-file workshop/mkdocs.yml`를 포어그라운드로 실행하세요.
> **미리 보기 페이지를 브라우저에서 열기 위한 팝업 대화상자가 나타나야 합니다.**

AI 애플리케이션 배포에 중점을 둔 Azure Developer CLI(AZD)를 학습하는 실습 워크숍에 오신 것을 환영합니다. 이 워크숍은 다음 3단계로 AZD 템플릿에 대한 실질적인 이해를 도와드립니다:

1. <strong>발견</strong> - 자신에게 맞는 템플릿 찾기.
1. <strong>배포</strong> - 배포하고 작동을 확인하기.
1. <strong>맞춤화</strong> - 수정하고 반복하여 나만의 것으로 만들기!

워크숍 전반에 걸쳐 핵심 개발 도구와 워크플로우도 소개하여 엔드 투 엔드 개발 여정을 효율화할 수 있도록 지원합니다.

| | | 
|:---|:---|
| **📚 강좌 홈**| [AZD 초보자를 위한](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 문서** | [AI 템플릿 시작하기](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI 템플릿** | [Microsoft Foundry 템플릿](https://ai.azure.com/templates) |
|**🚀 다음 단계** | [도전 과제 참여하기](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## 워크숍 개요

**소요 시간:** 3-4 시간  
**레벨:** 초급부터 중급  
**사전 요구 사항:** Azure, AI 개념, VS Code 및 커맨드라인 도구에 대한 기본 지식.

이 워크숍은 직접 실습하면서 배우는 과정입니다. 연습을 완료한 후에는 AZD 초보자 과정을 검토하여 보안 및 생산성 모범 사례 관련 학습을 이어가길 권장합니다.

| 시간| 모듈  | 목표 |
|:---|:---|:---|
| 15분 | 소개 | 목표 설정 및 이해 |
| 30분 | AI 템플릿 선택 | 옵션 탐색 및 시작 템플릿 선택 | 
| 30분 | AI 템플릿 검증 | 기본 솔루션을 Azure에 배포 |
| 30분 | AI 템플릿 분석 | 구조 및 구성 탐색 |
| 30분 | AI 템플릿 구성 | 기능 활성화 및 사용 |
| 30분 | AI 템플릿 맞춤화 | 템플릿을 필요에 맞게 조정 |
| 30분 | 인프라 해체 | 정리 및 리소스 해제 |
| 15분 | 정리 및 다음 단계 | 학습 자료 및 워크숍 챌린지 |
| | |

## 학습 목표

AZD 템플릿을 Microsoft Foundry의 엔드 투 엔드 개발을 위한 다양한 기능과 도구를 탐색하는 학습 샌드박스로 생각하세요. 이 워크숍이 끝나면 관련 도구와 개념에 대해 직관적인 이해를 갖추게 될 것입니다.

| 개념  | 목표 |
|:---|:---|
| **Azure Developer CLI** | 도구 명령과 워크플로우 이해 |
| **AZD 템플릿**| 프로젝트 구조 및 구성 이해 |
| **Azure AI 에이전트**| Microsoft Foundry 프로젝트 프로비저닝 및 배포 |
| **Azure AI 검색**| 에이전트를 활용한 컨텍스트 엔지니어링 활성화 |
| **관찰 가능성**| 추적, 모니터링 및 평가 탐색 |
| **레드 팀 활동**| 적대적 테스트 및 대응책 탐색 |
| | |

## 워크숍 모듈

시작할 준비가 되셨나요? 워크숍 모듈을 탐색하세요:

- [모듈 1: AI 템플릿 선택](instructions/1-Select-AI-Template.md)
- [모듈 2: AI 템플릿 검증](instructions/2-Validate-AI-Template.md) 
- [모듈 3: AI 템플릿 분석](instructions/3-Deconstruct-AI-Template.md)
- [모듈 4: AI 템플릿 구성](instructions/4-Configure-AI-Template.md)
- [모듈 5: AI 템플릿 맞춤화](instructions/5-Customize-AI-Template.md)
- [모듈 6: 인프라 해체](instructions/6-Teardown-Infrastructure.md)
- [모듈 7: 정리 및 다음 단계](instructions/7-Wrap-up.md)

## 피드백이 있나요?

이 리포지토리에 이슈를 게시하거나(태그: `Workshop`), [Discord](https://aka.ms/foundry/discord)에서 우리 `#get-help` 채널에 참여하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->