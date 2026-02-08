# 1. 템플릿 선택하기

!!! tip "이 모듈이 끝나면 할 수 있는 것"

    - [ ] AZD 템플릿이 무엇인지 설명할 수 있습니다
    - [ ] AI용 AZD 템플릿을 발견하고 사용할 수 있습니다
    - [ ] AI 에이전트 템플릿으로 시작할 수 있습니다
    - [ ] **랩 1:** GitHub Codespaces와 함께하는 AZD 빠른 시작

---

## 1. 건축가 비유

완전히 새로부터 현대적인 엔터프라이즈 준비된 AI 애플리케이션을 구축하는 것은 벅찰 수 있습니다. 이건 마치 벽돌 하나하나를 쌓아 집을 직접 짓는 것과 비슷합니다. 네, 할 수는 있습니다! 하지만 원하는 최종 결과를 얻는 가장 효과적인 방법은 아닙니다!

대신, 우리는 종종 기존의 _설계 청사진_ 으로 시작해서 건축가와 함께 개인적인 요구 사항에 맞게 맞춤화하는 방식을 택합니다. 지능형 애플리케이션을 빌드할 때도 같은 접근법을 취해야 합니다. 먼저, 당신의 문제 영역에 맞는 좋은 설계 아키텍처를 찾으세요. 그 다음 솔루션 건축가와 협력해 특정 시나리오에 맞게 솔루션을 맞춤 개발합니다.

그런데 이러한 설계 청사진은 어디에서 찾을 수 있을까요? 자신이 직접 이 청사진을 맞춤화하고 배포하는 방법을 가르쳐 줄 건축가는 어디에서 만날 수 있을까요? 이 워크숍에서는 세 가지 기술을 소개하며 이러한 질문에 답합니다:

1. [Azure Developer CLI](https://aka.ms/azd) - 로컬 개발(빌드)에서 클라우드 배포(출시)까지 개발자의 경로를 가속화하는 오픈 소스 툴입니다.
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - AI 솔루션 아키텍처 배포를 위한 샘플 코드, 인프라, 구성 파일이 포함된 표준화된 오픈 소스 저장소입니다.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - Azure 지식 기반의 코딩 에이전트로, 자연어를 사용해 코드베이스 탐색과 수정 안내를 제공합니다.

이 도구들을 활용하면 적절한 템플릿을 _발견_ 하고, 제대로 작동하는지 검증하기 위해 _배포_ 한 뒤, 특정 시나리오에 맞게 _맞춤화_ 할 수 있습니다. 이제 이들이 어떻게 작동하는지 살펴봅시다.

---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)(`azd`)는 개발자 친화적인 명령어 세트를 제공하여 IDE(개발)와 CI/CD(데브옵스) 환경 전반에 걸쳐 일관되게 동작하며, 코드에서 클라우드까지 여정을 가속하는 오픈 소스 커맨드라인 툴입니다.

`azd`를 사용하면 배포 여정이 다음과 같이 간단할 수 있습니다:

- `azd init` - 기존 AZD 템플릿을 기반으로 새 AI 프로젝트를 초기화합니다.
- `azd up` - 인프라를 프로비저닝하고 애플리케이션을 한 번에 배포합니다.
- `azd monitor` - 배포된 애플리케이션의 실시간 모니터링과 진단 정보를 받습니다.
- `azd pipeline config` - Azure로의 자동 배포를 위한 CI/CD 파이프라인을 설정합니다.

**🎯 | 실습**: <br/> GitHub Codespaces 환경에서 `azd` 커맨드라인 툴을 탐색해보세요. 다음 명령어를 입력해 무엇을 할 수 있는지 확인해보십시오:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/ko/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD 템플릿

이 모든 것을 가능하게 하려면 `azd`는 프로비저닝할 인프라, 적용할 구성 설정, 배포할 애플리케이션을 알아야 합니다. 이 부분이 [AZD 템플릿](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) 의 역할입니다.

AZD 템플릿은 샘플 코드와 솔루션 아키텍처 배포에 필요한 인프라 및 구성 파일을 결합한 오픈 소스 저장소입니다.
_인프라-코드화_(IaC) 방식을 사용해 템플릿 리소스 정의 및 구성 설정을 (앱 소스 코드처럼) 버전 관리할 수 있어, 해당 프로젝트 사용자들에게 재사용 가능하고 일관된 워크플로우를 만듭니다.

_당신의_ 시나리오를 위해 AZD 템플릿을 생성하거나 재사용할 때 다음 질문들을 고려하세요:

1. 무엇을 만들고 있나요? → 해당 시나리오에 맞는 시작 코드가 포함된 템플릿이 있나요?
1. 솔루션 아키텍처는 어떻게 되어 있나요? → 필요한 리소스가 포함된 템플릿이 있나요?
1. 어떻게 솔루션을 배포하나요? → `azd deploy`에 선/후처리 훅이 있나요?
1. 어떻게 더 최적화할 수 있나요? → 내장 모니터링과 자동화 파이프라인을 생각하세요!

**🎯 | 실습**: <br/> [Awesome AZD](https://azure.github.io/awesome-azd/) 갤러리에 방문해 필터를 사용하여 현재 제공 중인 250개 이상의 템플릿을 탐색해보세요. _자신_의 시나리오 요구사항에 맞는 템플릿을 찾아보세요.

![Code](../../../../../translated_images/ko/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI 앱 템플릿

AI 기반 애플리케이션용으로 Microsoft는 **Microsoft Foundry** 와 **Foundry Agents** 가 포함된 전문 템플릿을 제공합니다. 이 템플릿들은 지능형, 프로덕션 준비 애플리케이션 구축 경로를 빠르게 해줍니다.

### Microsoft Foundry & Foundry Agents 템플릿

아래 템플릿 중 하나를 선택해 배포하세요. 모든 템플릿은 [Awesome AZD](https://azure.github.io/awesome-azd/) 에 있으며 단일 명령으로 초기화할 수 있습니다.

| 템플릿 | 설명 | 배포 명령 |
|----------|-------------|----------------|
| **[RAG를 활용한 AI 채팅](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Microsoft Foundry를 활용한 검색 보강 생성(Chat) 채팅 애플리케이션 | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry 에이전트 서비스 스타터](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Foundry Agents를 사용해 자율 작업 수행 에이전트 구축 | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[멀티 에이전트 오케스트레이션](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | 복잡한 워크플로우를 위한 다수 Foundry Agents 조정 | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI 문서 인텔리전스](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Microsoft Foundry 모델로 문서 추출 및 분석 | `azd init -t azure-samples/ai-document-processing` |
| **[대화형 AI 봇](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Microsoft Foundry 통합으로 지능형 챗봇 구축 | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI 이미지 생성](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Microsoft Foundry에서 DALL-E를 사용한 이미지 생성 | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel 에이전트](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Foundry Agents와 함께 Semantic Kernel을 사용하는 AI 에이전트 | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen 다중 에이전트](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | AutoGen 프레임워크를 사용한 다중 에이전트 시스템 | `azd init -t azure-samples/autogen-multi-agent` |

### 빠른 시작

1. **템플릿 둘러보기**: [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) 방문 후 `AI`, `Agents`, 또는 `Microsoft Foundry` 필터 적용
2. **템플릿 선택**: 사용 사례에 맞는 템플릿 선택
3. **초기화**: 선택한 템플릿으로 `azd init` 명령 실행
4. **배포**: `azd up` 명령으로 프로비저닝 및 배포

**🎯 | 실습**: <br/>
위 템플릿 중 시나리오에 맞는 것을 선택하세요:

- **챗봇을 만들고 있나요?** → **RAG를 활용한 AI 채팅** 또는 **대화형 AI 봇** 으로 시작하세요
- **자율 에이전트가 필요하나요?** → **Foundry 에이전트 서비스 스타터** 또는 **멀티 에이전트 오케스트레이션** 을 시도하세요
- **문서 처리 중인가요?** → **AI 문서 인텔리전스** 를 사용하세요
- **AI 코딩 도움을 원하나요?** → **Semantic Kernel 에이전트** 또는 **AutoGen 다중 에이전트** 를 탐색하세요

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "더 많은 템플릿 탐색"
    [Awesome AZD 갤러리](https://azure.github.io/awesome-azd/)에는 250개 이상의 템플릿이 있습니다. 필터를 사용해 언어, 프레임워크, Azure 서비스별로 특정 요구사항에 맞는 템플릿을 찾아보세요.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역은 오류나 부정확성이 포함될 수 있음을 유의해 주시기 바랍니다. 원본 문서는 해당 언어의 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우에는 전문 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->