# 2. 템플릿 검증

> 다음과 같이 검증됨: `azd 1.23.12` (2026년 3월).

!!! tip "이 모듈을 완료하면 다음을 수행할 수 있습니다"

    - [ ] AI 솔루션 아키텍처 분석
    - [ ] AZD 배포 워크플로우 이해
    - [ ] AZD 사용에 대해 GitHub Copilot 활용
    - [ ] **실습 2:** AI Agents 템플릿 배포 및 검증

---


## 1. 소개

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) 또는 `azd`는 애플리케이션을 Azure에 빌드하고 배포할 때 개발자 워크플로우를 간소화하는 오픈 소스 명령줄 도구입니다. 

[AZD 템플릿](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates)은 샘플 애플리케이션 코드, _인프라스트럭처-애즈-코드_ 자산 및 일관된 솔루션 아키텍처를 위한 `azd` 구성 파일을 포함하는 표준화된 리포지토리입니다. 인프라 프로비저닝은 `azd provision` 명령 한 번으로 간단하게 이루어지며, `azd up`을 사용하면 인프라를 프로비저닝하고 애플리케이션을 한 번에 배포할 수 있습니다!

결과적으로, 애플리케이션 개발 프로세스를 빠르게 시작하려면 애플리케이션 및 인프라 요구 사항에 가장 근접한 _AZD 스타터 템플릿_을 찾아 리포지토리를 시나리오 요구에 맞게 맞춤 설정하면 됩니다.

시작하기 전에 Azure Developer CLI가 설치되어 있는지 확인해봅시다.

1. VS Code 터미널을 열고 다음 명령을 입력하세요:

      ```bash title="" linenums="0"
      azd version
      ```

1. 다음과 유사한 출력을 볼 수 있습니다!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**이제 azd로 템플릿을 선택하고 배포할 준비가 되었습니다**

---

## 2. 템플릿 선택

Microsoft Foundry 플랫폼에는 _다중 에이전트 워크플로우 자동화_ 및 _다중 모달 콘텐츠 처리_와 같은 인기 있는 솔루션 시나리오를 다루는 [권장 AZD 템플릿 모음](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)이 제공됩니다. 또한 Microsoft Foundry 포털을 방문하여 이러한 템플릿을 찾아볼 수 있습니다.

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) 를 방문하세요
1. 프롬프트가 표시되면 Microsoft Foundry 포털에 로그인하세요 - 다음과 같은 화면을 보게 됩니다.

![템플릿 선택](../../../../../translated_images/ko/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** 옵션은 시작 템플릿입니다:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) 는 기본 챗 애플리케이션을 _당신의 데이터와 함께_ Azure Container Apps에 배포합니다. 기본 AI 챗봇 시나리오를 탐색하는 데 사용하세요.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) 는 표준 AI Agent(Foundry Agents 포함)를 배포합니다. 도구와 모델을 포함한 에이전트형 AI 솔루션에 익숙해지는 데 사용하세요.

두 번째 링크를 새 브라우저 탭에서 열거나(관련 카드의 `Open in GitHub` 클릭) 방문하세요. 이 AZD 템플릿의 리포지토리를 볼 수 있습니다. README를 잠시 살펴보세요. 애플리케이션 아키텍처는 다음과 같습니다:

![아키텍처](../../../../../translated_images/ko/architecture.8cec470ec15c65c7.webp)

---

## 3. 템플릿 활성화

이 템플릿을 배포하여 유효한지 확인해봅시다. [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 섹션의 지침을 따르겠습니다.

1. 템플릿 리포지토리를 위한 작업 환경을 선택하세요:

      - **GitHub Codespaces**: [이 링크](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents)를 클릭하고 `Create codespace`를 확인하세요
      - **로컬 클론 또는 개발 컨테이너**: `Azure-Samples/get-started-with-ai-agents`를 클론하고 VS Code에서 엽니다

1. VS Code 터미널이 준비될 때까지 기다린 다음 다음 명령을 입력하세요:

   ```bash title="" linenums="0"
   azd up
   ```

완료하면 이로 인해 트리거되는 워크플로우 단계를 완료하세요:

1. Azure에 로그인하라는 프롬프트가 표시됩니다 - 지침에 따라 인증하세요
1. 환경 이름을 고유하게 입력하세요 - 예: 저는 `nitya-mshack-azd`를 사용했습니다
1. This  will create a `.azure/` folder - you will see a subfolder with the env name
1. 구독 이름을 선택하라는 프롬프트가 표시됩니다 - 기본값을 선택하세요
1. 위치를 묻는 프롬프트가 표시됩니다 - `East US 2`를 사용하세요

이제 프로비저닝이 완료될 때까지 기다리세요. **약 10-15분이 소요됩니다**

1. 완료되면 콘솔에 다음과 같은 SUCCESS 메시지가 표시됩니다:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure 포털에 해당 환경 이름으로 프로비저닝된 리소스 그룹이 생성됩니다:

      ![프로비저닝된 인프라](../../../../../translated_images/ko/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **이제 배포된 인프라 및 애플리케이션을 검증할 준비가 되었습니다**.

---

## 4. 템플릿 검증

1. Azure 포털의 [리소스 그룹](https://portal.azure.com/#browse/resourcegroups) 페이지를 방문하세요 - 프롬프트가 표시되면 로그인하세요
1. 환경 이름의 RG를 클릭하세요 - 위의 페이지가 표시됩니다

      - Azure Container Apps 리소스를 클릭하세요
      - _Essentials_ 섹션(오른쪽 상단)에 있는 Application Url을 클릭하세요

1. 다음과 같은 호스팅된 애플리케이션 프런트엔드 UI를 볼 수 있습니다:

   ![앱](../../../../../translated_images/ko/03-test-application.471910da12c3038e.webp)

1. 몇 가지 [샘플 질문](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)을 시도해 보세요

      1. 질문: ```What is the capital of France?``` 
      1. 질문: ```What's the best tent under $200 for two people, and what features does it include?```

1. 아래와 유사한 답변을 받게 됩니다. _그런데 이게 어떻게 작동하나요?_ 

      ![앱](../../../../../translated_images/ko/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 에이전트 검증

Azure Container App은 이 템플릿을 위해 프로비저닝된 Microsoft Foundry 프로젝트의 AI Agent에 연결되는 엔드포인트를 배포합니다. 이것이 무엇을 의미하는지 살펴봅시다.

1. 리소스 그룹의 Azure 포털 _개요(Overview)_ 페이지로 돌아가세요

1. 목록에서 `Microsoft Foundry` 리소스를 클릭하세요

1. 다음을 보게 됩니다. `Go to Microsoft Foundry Portal` 버튼을 클릭하세요. 
   ![Foundry](../../../../../translated_images/ko/04-view-foundry-project.fb94ca41803f28f3.webp)

1. AI 애플리케이션에 대한 Foundry 프로젝트 페이지가 표시됩니다
   ![프로젝트](../../../../../translated_images/ko/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents`를 클릭하세요 - 프로젝트에 프로비저닝된 기본 Agent가 표시됩니다
   ![에이전트](../../../../../translated_images/ko/06-visit-agents.bccb263f77b00a09.webp)

1. 선택하면 에이전트 세부정보가 표시됩니다. 다음을 확인하세요:

      - 에이전트는 기본적으로 File Search를 사용합니다(항상)
      - 에이전트의 `Knowledge`에는 업로드된 파일이 32개라고 표시됩니다 (파일 검색용)
      ![에이전트](../../../../../translated_images/ko/07-view-agent-details.0e049f37f61eae62.webp)

1. 왼쪽 메뉴에서 `Data+indexes` 옵션을 찾아 클릭하여 세부정보를 확인하세요. 

      - 지식으로 업로드된 32개의 데이터 파일을 볼 수 있어야 합니다.
      - 이는 `src/files` 아래의 12개 고객 파일과 20개 제품 파일에 해당합니다
      ![데이터](../../../../../translated_images/ko/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**에이전트 동작을 검증했습니다!**

1. 에이전트 응답은 해당 파일의 지식에 근거합니다. 
1. 이제 해당 데이터와 관련된 질문을 하고 근거 있는 응답을 받을 수 있습니다.
1. 예: `customer_info_10.json`에는 "Amanda Perez"가 한 3건의 구매가 설명되어 있습니다

Container App 엔드포인트가 열린 브라우저 탭으로 돌아가서 다음을 묻습니다: `What products does Amanda Perez own?`. 다음과 유사한 결과가 표시되어야 합니다:

![데이터](../../../../../translated_images/ko/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 에이전트 플레이그라운드

Agents Playground에서 에이전트를 직접 실행해 보며 Microsoft Foundry의 기능에 대한 직관을 더 키워봅시다. 

1. Microsoft Foundry의 `Agents` 페이지로 돌아가서 기본 에이전트를 선택하세요
1. `Try in Playground` 옵션을 클릭하세요 - 다음과 같은 Playground UI가 표시됩니다
1. 동일한 질문을 해보세요: `What products does Amanda Perez own?`

    ![데이터](../../../../../translated_images/ko/09-ask-in-playground.a1b93794f78fa676.webp)

동일(또는 유사한) 응답을 받게 되지만, 에이전트형 앱의 품질, 비용 및 성능을 이해하는 데 사용할 수 있는 추가 정보를 얻을 수 있습니다. 예를 들면:

1. 응답이 근거로 사용한 데이터 파일을 인용하는 것을 확인하세요
1. 이러한 파일 레이블 위로 마우스를 올려보세요 - 데이터가 쿼리 및 표시된 응답과 일치하나요?

응답 아래에 _stats_ 행도 표시됩니다. 

1. 예: Safety와 같은 지표 위에 마우스를 올려보세요. 다음과 유사한 정보를 볼 수 있습니다
1. 평가된 등급이 응답의 안전성 수준에 대한 당신의 직관과 일치하나요?

      ![데이터](../../../../../translated_images/ko/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 내장된 관찰성(Observability)

관찰성은 애플리케이션을 계측하여 운영을 이해하고 디버그하며 최적화하는 데 사용할 수 있는 데이터를 생성하도록 하는 것입니다. 이를 감각적으로 이해하려면:

1. `View Run Info` 버튼을 클릭하세요 - 이 뷰를 볼 수 있습니다. 이는 동작 중인 [Agent 추적](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground)의 예입니다. _이 뷰는 상위 메뉴에서 Thread Logs를 클릭하여서도 확인할 수 있습니다_.

   - 실행 단계와 에이전트가 사용한 도구를 파악하세요
   - 응답을 위해 사용된 총 토큰 수(대 출력 토큰 사용량)를 이해하세요
   - 대기 시간과 실행 중 시간이 어디에 소비되는지 이해하세요

      ![에이전트](../../../../../translated_images/ko/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` 탭을 클릭하여 이후 문제 디버깅에 유용할 수 있는 실행의 추가 속성을 확인하세요.   

      ![에이전트](../../../../../translated_images/ko/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` 탭을 클릭하여 에이전트 응답에 대해 자동으로 수행된 평가를 확인하세요. 여기에는 안전성 평가(예: 자해 관련)와 에이전트 특정 평가(예: 의도 해결, 작업 준수)가 포함됩니다.

      ![에이전트](../../../../../translated_images/ko/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 마지막으로 사이드바 메뉴에서 `Monitoring` 탭을 클릭하세요.

      - 표시된 페이지에서 `Resource usage` 탭을 선택하고 메트릭을 확인하세요.
      - 비용(토큰) 및 부하(요청) 측면에서 애플리케이션 사용량을 추적하세요.
      - 첫 바이트(입력 처리) 및 마지막 바이트(출력)에 대한 애플리케이션 지연 시간을 추적하세요.

      ![에이전트](../../../../../translated_images/ko/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 환경 변수

지금까지 브라우저에서 배포 과정을 따라오며 인프라가 프로비저닝되고 애플리케이션이 작동함을 검증했습니다. 하지만 코드 중심으로 애플리케이션을 다루려면 이러한 리소스와 작업하는 데 필요한 관련 변수를 로컬 개발 환경에 구성해야 합니다. `azd`를 사용하면 이 작업이 쉬워집니다.

1. Azure Developer CLI는 애플리케이션 배포를 위한 구성 설정을 저장하고 관리하기 위해 [환경 변수](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash)를 사용합니다.

1. 환경 변수는 `.azure/<env-name>/.env`에 저장됩니다 - 이는 배포 중에 사용된 `env-name` 환경으로 범위를 지정하여 동일한 리포지토리 내의 서로 다른 배포 대상 간에 환경을 격리하는 데 도움이 됩니다.

1. 환경 변수는 `azd`가 특정 명령(예: `azd up`)을 실행할 때 자동으로 로드됩니다. `azd`가 OS 수준의 환경 변수(예: 셸에서 설정된 변수)를 자동으로 읽지는 않으므로, 스크립트 내에서 정보를 전송하려면 `azd set env` 및 `azd get env`를 사용하세요.


몇 가지 명령을 시도해봅시다:

1. 이 환경에서 `azd`에 설정된 모든 환경 변수를 가져옵니다:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      다음과 유사한 출력이 표시됩니다:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 특정 값을 가져옵니다 - 예: `AZURE_AI_AGENT_MODEL_NAME` 값이 설정되었는지 알고 싶습니다

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      다음과 유사한 출력이 표시됩니다 - 기본적으로 설정되지 않았습니다!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd`에 대한 새 환경 변수를 설정합니다. 여기서는 에이전트 모델 이름을 업데이트합니다. _Note: any changes made will be immediately reflected in the `.azure/<env-name>/.env` file.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      이제 값이 설정된 것을 확인할 수 있습니다:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 일부 리소스(예: 모델 배포)는 영구적이며 재배포를 강제하려면 단순한 `azd up` 이상의 작업이 필요할 수 있습니다. 원래 배포를 해체하고 변경된 환경 변수로 다시 배포해봅시다.

1. **새로 고침(Refresh)** 이전에 azd 템플릿을 사용하여 인프라를 배포한 적이 있다면, 다음 명령을 사용하여 로컬 환경 변수 상태를 현재 Azure 배포 상태에 맞게 _새로 고침_할 수 있습니다:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      이것은 배포된 인프라를 환경 변수 상태에 대한 기준으로 삼을 수 있게 하여, 두 개 이상의 로컬 개발 환경(예: 여러 개발자가 있는 팀) 간에 환경 변수를 _동기화_하는 강력한 방법입니다. 팀 구성원은 단순히 변수를 _새로 고침_하여 다시 동기화 상태로 돌아옵니다.

---

## 9. 축하합니다 🏆

당신은 방금 다음과 같은 엔드투엔드 워크플로를 완료했습니다:

- [X] 사용하려는 AZD 템플릿을 선택했습니다
- [X] 지원되는 개발 환경에서 템플릿을 열었습니다
- [X] 템플릿을 배포하고 정상 동작을 확인했습니다

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나 자동 번역에는 오류나 부정확성이 있을 수 있습니다. 원문(원어) 문서는 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우 전문 번역가에 의한 인간 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->