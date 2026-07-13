# 2. 템플릿 검증

> 2026년 7월에 `azd 1.27.1`로 검증됨.

!!! tip "이 모듈을 끝내면 할 수 있습니다"

    - [ ] AI 솔루션 아키텍처 분석
    - [ ] AZD 배포 워크플로우 이해
    - [ ] AZD 사용법에 대해 GitHub Copilot 활용
    - [ ] **랩 2:** AI 에이전트 템플릿 배포 및 검증

---


## 1. 소개

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) 또는 `azd`는 Azure에 애플리케이션을 구축하고 배포하는 개발자 워크플로우를 간소화하는 오픈 소스 명령줄 도구입니다.

[AZD 템플릿](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates)은 샘플 애플리케이션 코드, _인프라스트럭처 코드_ 에셋 및 `azd` 구성 파일이 포함된 표준화된 저장소로 통합 솔루션 아키텍처를 제공합니다. 인프라 프로비저닝은 `azd provision` 명령 한 번으로 간단하며, `azd up`을 사용하면 인프라를 프로비저닝하고 애플리케이션을 한 번에 배포할 수 있습니다!

결과적으로, 애플리케이션 개발을 시작하는 것은 애플리케이션 및 인프라 요구 사항에 가장 근접한 적합한 _AZD 스타터 템플릿_을 찾고 저장소를 시나리오 요구에 맞게 사용자 지정하는 것만큼 간단할 수 있습니다.

시작하기 전에 Azure Developer CLI가 설치되어 있는지 확인해 봅시다.

1. VS Code 터미널을 열고 다음 명령을 입력하세요:

      ```bash title="" linenums="0"
      azd version
      ```

1. 이와 유사한 결과가 표시될 것입니다!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**이제 azd로 템플릿을 선택하고 배포할 준비가 되었습니다**

---

## 2. 템플릿 선택

Microsoft Foundry 플랫폼에는 _멀티 에이전트 워크플로우 자동화_ 및 _멀티모달 콘텐츠 처리_와 같은 인기 솔루션 시나리오를 다루는 [추천 AZD 템플릿 세트](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)가 포함되어 있습니다. 또한 Microsoft Foundry 포털을 방문하여 이 템플릿들을 탐색할 수 있습니다.

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) 방문
1. 로그인하라는 메시지가 뜨면 Microsoft Foundry 포털에 로그인하세요 - 다음과 유사한 화면을 볼 것입니다.

![Pick](../../../../../translated_images/ko/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** 옵션은 스타터 템플릿입니다:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)은 기본 채팅 애플리케이션을 _데이터와 함께_ Azure 컨테이너 앱에 배포합니다. 기본 AI 챗봇 시나리오를 탐색하는 데 사용하세요.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)은 Foundry Agents가 포함된 표준 AI 에이전트를 배포합니다. 도구와 모델이 포함된 에이전틱 AI 솔루션에 익숙해지는 데 사용하세요.

두 번째 링크를 새 브라우저 탭에서 열거나 관련 카드의 `Open in GitHub` 를 클릭하세요. 해당 AZD 템플릿의 저장소가 표시됩니다. README를 잠시 탐색해 보세요. 애플리케이션 아키텍처는 다음과 같습니다:

![Arch](../../../../../translated_images/ko/architecture.8cec470ec15c65c7.webp)

---

## 3. 템플릿 활성화

이 템플릿을 배포하여 유효한지 확인해 봅시다. [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 섹션의 지침을 따릅니다.

1. 템플릿 저장소를 위한 작업 환경 선택:

      - **GitHub Codespaces**: [이 링크](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents)를 클릭하고 `Create codespace` 확인
      - **로컬 클론 또는 개발 컨테이너**: `Azure-Samples/get-started-with-ai-agents` 클론 후 VS Code에서 열기

1. VS Code 터미널이 준비될 때까지 기다린 후 다음 명령을 입력하세요:

   ```bash title="" linenums="0"
   azd up
   ```

이로 인해 트리거되는 워크플로 단계를 완료하세요:

1. Azure 로그인하라는 메시지가 표시됩니다 - 지침에 따라 인증하세요
1. 고유한 환경 이름을 입력하세요 - 예: 저는 `nitya-mshack-azd`를 사용했습니다
1. `.azure/` 폴더가 생성되고 환경 이름의 하위 폴더가 생성됩니다
1. 구독 이름 선택하라는 메시지가 표시됩니다 - 기본값 선택
1. 위치 선택하라는 메시지가 표시됩니다 - `East US 2` 사용

이제 프로비저닝이 완료될 때까지 기다립니다. **10-15분 정도 걸립니다**

1. 완료되면 콘솔에 다음과 같은 성공 메시지가 표시됩니다:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure 포털에 해당 환경 이름으로 프로비저닝된 리소스 그룹이 생성됩니다:

      ![Infra](../../../../../translated_images/ko/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **이제 배포된 인프라 및 애플리케이션을 검증할 준비가 되었습니다**.

---

## 4. 템플릿 검증

1. Azure 포털 [리소스 그룹](https://portal.azure.com/#browse/resourcegroups) 페이지 방문 - 로그인하라는 메시지 뜨면 로그인
1. 환경 이름으로 된 리소스 그룹 클릭 - 위와 같은 페이지가 표시됩니다

      - Azure 컨테이너 앱 리소스 클릭
      - _Essentials_ 섹션(우측 상단)의 애플리케이션 URL 클릭

1. 다음과 같이 호스트된 애플리케이션 프런트엔드 UI가 표시됩니다:

   ![App](../../../../../translated_images/ko/03-test-application.471910da12c3038e.webp)

1. [샘플 질문](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)을 몇 개 시도해 보세요

      1. 질문: ```프랑스의 수도는 어디인가요?```
      1. 질문: ```두 사람이 사용할 수 있는 200달러 이하 최고의 텐트는 무엇이며, 어떤 기능들이 있나요?```

1. 다음과 유사한 답변을 받게 됩니다. _그런데 이게 어떻게 작동하나요?_

      ![App](../../../../../translated_images/ko/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 에이전트 검증

Azure 컨테이너 앱은 이 템플릿에 대해 Microsoft Foundry 프로젝트 안에 프로비저닝된 AI 에이전트에 연결되는 엔드포인트를 배포합니다. 이 점을 살펴봅시다.

1. Azure 포털에서 리소스 그룹 _개요_ 페이지로 돌아가기

1. 해당 목록에서 `Microsoft Foundry` 리소스 클릭

1. 다음 화면이 표시됩니다. `Go to Microsoft Foundry Portal` 버튼 클릭.
   ![Foundry](../../../../../translated_images/ko/04-view-foundry-project.fb94ca41803f28f3.webp)

1. AI 애플리케이션용 Foundry 프로젝트 페이지가 표시됩니다
   ![Project](../../../../../translated_images/ko/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` 클릭 - 프로젝트에 프로비저닝된 기본 에이전트가 표시됩니다
   ![Agents](../../../../../translated_images/ko/06-visit-agents.bccb263f77b00a09.webp)

1. 선택하면 에이전트 세부 사항이 표시됩니다. 다음 사항에 주목하세요:

      - 에이전트는 기본적으로 파일 검색을 사용합니다 (언제나)
      - 에이전트 `Knowledge` 는 32개의 파일이 업로드되었음을 나타냅니다 (파일 검색용)
      ![Agents](../../../../../translated_images/ko/07-view-agent-details.0e049f37f61eae62.webp)

1. 왼쪽 메뉴에서 `Data+indexes` 옵션을 찾아 클릭하여 세부정보 확인

      - 지식을 위한 32개의 데이터 파일이 업로드된 것을 확인할 수 있습니다.
      - `src/files`에 있는 12개의 고객 파일과 20개의 제품 파일에 해당합니다.
      ![Data](../../../../../translated_images/ko/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**에이전트 작동을 검증했습니다!**

1. 에이전트 응답은 해당 파일들에 포함된 지식을 기반으로 합니다.
1. 이제 그 데이터를 기반으로 질문하고 근거 있는 답변을 받을 수 있습니다.
1. 예: `customer_info_10.json`은 “Amanda Perez”가 한 3건의 구매 내용을 설명합니다.

컨테이너 앱 엔드포인트가 열려있는 브라우저 탭으로 돌아가서 다음과 같이 물어보세요: `Amanda Perez가 소유한 제품은 무엇입니까?` 다음과 유사한 결과가 표시됩니다:

![Data](../../../../../translated_images/ko/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 에이전트 플레이그라운드

Microsoft Foundry의 기능에 대한 직관을 좀 더 키워보겠습니다. 에이전트를 에이전트 플레이그라운드에서 실행해 봅시다.

1. Microsoft Foundry의 `Agents` 페이지로 돌아가 기본 에이전트를 선택하세요
1. `Try in Playground` 옵션 클릭 - 다음과 같은 플레이그라운드 UI가 표시됩니다
1. 똑같은 질문을 해보세요: `Amanda Perez가 소유한 제품은 무엇입니까?`

    ![Data](../../../../../translated_images/ko/09-ask-in-playground.a1b93794f78fa676.webp)

비슷하거나 같은 응답을 받지만, 추가로 에이전틱 앱의 품질, 비용 및 성능을 이해하는데 도움이 되는 정보도 얻게 됩니다. 예를 들어:

1. 응답에 "근거"가 된 데이터 파일들이 인용되었음을 주목하세요.
1. 이 파일 레이블 위에 마우스를 올려보세요 - 데이터가 질문과 표시된 응답과 일치합니까?

아래쪽에 _통계_ 행도 보입니다.

1. 임의의 측정항목 (예: Safety) 위에 마우스를 올려보세요. 다음과 같이 표시됩니다.
1. 평가된 등급이 응답의 안전성 수준에 대한 여러분의 직관과 일치합니까?

      ![Data](../../../../../translated_images/ko/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 내장 관측성

관측성이란 애플리케이션에 계측을 하여 이해, 디버깅 및 최적화에 활용 가능한 데이터를 생성하는 것입니다. 직접 체험해 봅시다:

1. `View Run Info` 버튼 클릭 - 다음 화면이 보입니다. 이는 [에이전트 추적](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground)의 예입니다. _상단 메뉴에서 Thread Logs를 클릭해도 이 화면을 볼 수 있습니다_.

   - 에이전트가 실행한 단계 및 사용한 도구를 확인
   - 응답에 대한 전체 토큰 수 (출력 토큰 사용량 대비) 이해
   - 실행 중 시간 지연 및 어디에 시간이 소요되었는지 이해

      ![Agent](../../../../../translated_images/ko/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` 탭 클릭하여 나중에 문제 디버깅에 유용할 수 있는 추가 속성 보기

      ![Agent](../../../../../translated_images/ko/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` 탭 클릭하여 에이전트 응답에 대해 자동 평가된 내용 보기. 여기에는 안전성 평가(예: 자해 위험) 및 에이전트 특화 평가(예: 의도 해석, 작업 준수)가 포함됩니다.

      ![Agent](../../../../../translated_images/ko/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 마지막으로 사이드바 메뉴의 `Monitoring` 탭 클릭

      - 표시된 페이지에서 `Resource usage` 탭 선택 후 메트릭 확인
      - 애플리케이션 사용량(토큰 비용)과 부하(요청 수) 추적
      - 첫 바이트(입력 처리) 및 마지막 바이트(출력) 대기 시간 추적

      ![Agent](../../../../../translated_images/ko/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 환경 변수

지금까지 브라우저에서 배포 및 인프라 프로비저닝과 애플리케이션 작동을 검증해 봤습니다. 하지만 _코드 우선_ 작업을 위해서는 관련 리소스에 대해 작업할 수 있도록 로컬 개발 환경을 환경 변수로 구성해야 합니다. `azd`을 사용하면 쉽습니다.

1. Azure Developer CLI는 애플리케이션 배포 구성을 저장 및 관리하기 위해 [환경 변수](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash)를 사용합니다.

1. 환경 변수는 `.azure/<env-name>/.env`에 저장되며, 이는 배포 시 사용된 `env-name` 환경으로 변수 범위를 제한하고 동일 저장소 내에서 서로 다른 배포 대상 간 환경을 분리하는 데 도움이 됩니다.

1. 환경 변수는 특정 명령 실행 시(`azd up` 등) `azd` 명령이 자동으로 로드합니다. 단, `azd`는 OS 수준 환경 변수(셸에 설정된)는 자동으로 읽지 않으므로 대신 스크립트 내에서 정보를 전달할 때 `azd set env`와 `azd get env`를 사용해야 합니다.


몇 가지 명령을 실행해 봅시다:

1. 이 환경에서 `azd`를 위해 설정된 모든 환경 변수 가져오기:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      다음과 비슷한 내용을 볼 수 있습니다:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 특정 변수 값 가져오기 - 예를 들어 `AZURE_AI_AGENT_MODEL_NAME` 값이 설정되어 있는지 확인

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      다음과 같이 나타납니다 - 기본값으로 설정되어 있지 않았습니다!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. 새 환경 변수를 `azd`에 설정합니다. 여기서는 에이전트 모델 이름을 업데이트합니다. _참고: 변경 사항은 즉시 `.azure/<env-name>/.env` 파일에 반영됩니다._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      이제 이 값이 설정되었는지 확인합니다:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 일부 리소스(예: 모델 배포)는 지속적이므로 단순히 `azd up`만으로 재배포되지 않을 수 있습니다. 원래 배포를 해제하고 변경된 환경 변수로 재배포해 봅시다.

1. **새로 고침** 이전에 azd 템플릿으로 인프라를 배포한 경우, 이 명령을 사용해 현재 Azure 배포 상태를 기반으로 로컬 환경 변수 상태를 _새로 고침_할 수 있습니다:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      이것은 두 개 이상의 로컬 개발 환경(예: 여러 개발자가 있는 팀)에서 환경 변수를 _동기화_하는 강력한 방법으로, 배포된 인프라가 환경 변수 상태의 근거로 작동하게 합니다. 팀원들은 단순히 변수를 _새로 고침_하여 다시 동기화 상태를 유지할 수 있습니다.

---

## 9. 축하합니다 🏆

여러분은 다음 작업들을 완료하는 엔드 투 엔드 워크플로를 방금 마쳤습니다:

- [X] 사용하려는 AZD 템플릿 선택
- [X] 지원되는 개발 환경에서 템플릿 열기
- [X] 템플릿을 배포하고 정상 작동하는지 검증

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->