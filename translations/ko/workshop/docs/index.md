# AI 개발자를 위한 AZD 워크숍

> [!IMPORTANT]  
> **이 워크숍은 로컬 브라우저에서 미리 볼 수 있는 워크숍 가이드가 함께 제공됩니다. 시작하려면, 리포지토리에서 GitHub Codespaces를 실행한 후 VS Code 터미널이 활성화될 때까지 기다린 다음 다음 명령어를 입력하세요:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **브라우저에서 미리보기 페이지를 열기 위한 팝업 대화 상자가 나타납니다.**

AI 애플리케이션 배포에 중점을 둔 Azure Developer CLI (AZD)를 학습하기 위한 실습 워크숍에 오신 것을 환영합니다. 이 워크숍은 3단계로 AZD 템플릿에 대한 실용적인 이해를 돕습니다:

1. **탐색** - 나에게 맞는 템플릿 찾기
1. **배포** - 배포하고 정상 작동 확인
1. **사용자 지정** - 수정하고 반복하여 나만의 것으로 만들기!

워크숍 동안 핵심 개발 도구 및 워크플로우도 소개하여, 끝에서 끝까지 개발 여정을 간소화하는 데 도움을 드립니다.

| | | 
|:---|:---|
| **📚 코스 홈** | [초보자를 위한 AZD](../README.md) |
| **📖 문서** | [AI 템플릿 시작하기](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) |
| **🛠️ AI 템플릿** | [Microsoft Foundry 템플릿](https://ai.azure.com/templates) |
| **🚀 다음 단계** | [챌린지 도전하기](../../../../workshop/docs) |
| | |

## 워크숍 개요

**소요 시간:** 3-4시간  
**난이도:** 초급에서 중급  
**사전 조건:** Azure, AI 개념, VS Code 및 명령줄 도구에 익숙함

이 워크숍은 직접 실습하며 배우는 형식입니다. 연습 문제를 마친 후에는 AZD 초보자 커리큘럼을 검토하여 보안 및 생산성 모범 사례 학습을 이어가시길 권장합니다.

| 시간 | 모듈 | 목표 |
|:---|:---|:---|
| 15분 | 소개 | 배경 설정, 목표 이해 |
| 30분 | AI 템플릿 선택 | 옵션 탐색 및 시작 템플릿 선택 |
| 30분 | AI 템플릿 검증 | 기본 솔루션 Azure에 배포 |
| 30분 | AI 템플릿 분해 | 구조 및 구성 탐색 |
| 30분 | AI 템플릿 구성 | 기능 활성화 및 사용해보기 |
| 30분 | AI 템플릿 사용자 지정 | 템플릿을 필요에 맞게 조정 |
| 30분 | 인프라 해체 | 정리 및 리소스 해제 |
| 15분 | 마무리 및 다음 단계 | 학습 자료, 워크숍 챌린지 |
| | |

## 학습할 내용

AZD 템플릿을 Microsoft Foundry에서 엔드 투 엔드 개발을 위한 다양한 기능과 도구를 탐색하는 학습 샌드박스로 생각하세요. 이 워크숍이 끝나면 해당 맥락에서 다양한 도구와 개념을 직관적으로 이해할 수 있게 될 것입니다.

| 개념 | 목표 |
|:---|:---|
| **Azure Developer CLI** | 도구 명령어와 워크플로우 이해 |
| **AZD 템플릿** | 프로젝트 구조 및 구성 이해 |
| **Azure AI 에이전트** | Microsoft Foundry 프로젝트 프로비저닝 및 배포 |
| **Azure AI 검색** | 에이전트를 통한 컨텍스트 엔지니어링 활성화 |
| **관측 가능성** | 추적, 모니터링 및 평가 탐색 |
| **레드 팀 테스트** | 적대적 테스트 및 완화 방법 탐색 |
| | |

## 워크숍 모듈

시작할 준비가 되셨나요? 워크숍 모듈을 따라가 보세요:

- [모듈 1: AI 템플릿 선택](instructions/1-Select-AI-Template.md)
- [모듈 2: AI 템플릿 검증](instructions/2-Validate-AI-Template.md) 
- [모듈 3: AI 템플릿 분해](instructions/3-Deconstruct-AI-Template.md)
- [모듈 4: AI 템플릿 구성](instructions/4-Configure-AI-Template.md)
- [모듈 5: AI 템플릿 사용자 지정](instructions/5-Customize-AI-Template.md)
- [모듈 6: 인프라 해체](instructions/6-Teardown-Infrastructure.md)
- [모듈 7: 마무리 및 다음 단계](instructions/7-Wrap-up.md)

## 의견이 있으신가요?

이 리포지토리에 이슈를 올리고(`Workshop` 태그 사용) 또는 [Discord](https://aka.ms/foundry/discord)에서 `#get-help` 채널에 참여하여 의견을 공유하세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원본 문서는 해당 언어의 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우 전문 인력에 의한 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 어떠한 오해나 잘못된 해석에 대해서도 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->