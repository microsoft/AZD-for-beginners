# 2. 템플릿 검증하기

!!! tip "이 모듈이 끝날 때까지 할 수 있게 됩니다"

    - [ ] AI 솔루션 아키텍처 분석하기
    - [ ] AZD 배포 워크플로우 이해하기
    - [ ] AZD 사용법에 대해 GitHub Copilot 도움 받기
    - [ ] **실습 2:** AI Agents 템플릿 배포 및 검증

---


## 1. 소개

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) 또는 `azd`는 Azure에 애플리케이션을 구축 및 배포할 때 개발자 워크플로우를 간소화하는 오픈 소스 명령줄 도구입니다. 

[AZD 템플릿](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates)은 샘플 애플리케이션 코드, _인프라스트럭처 코드_ 자산 및 `azd` 구성 파일을 포함하는 표준화된 저장소로, 일관된 솔루션 아키텍처를 제공합니다. 인프라 프로비저닝은 `azd provision` 명령어 하나로 간단해지고, `azd up`을 사용하면 인프라 프로비저닝과 애플리케이션 배포를 한 번에 수행할 수 있습니다!

결과적으로, 애플리케이션 개발 프로세스를 시작하는 것은 가장 적합한 _AZD 스타터 템플릿_을 찾아 애플리케이션과 인프라 요구사항을 충족하도록 저장소를 맞춤 설정하는 것만큼 간단할 수 있습니다.

시작하기 전에 Azure Developer CLI가 설치되어 있는지 확인합시다.

1. VS Code 터미널을 열고 다음 명령어를 입력하세요:

      ```bash title="" linenums="0"
      azd version
      ```

1. 다음과 비슷한 내용이 보여야 합니다!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**이제 azd로 템플릿을 선택하고 배포할 준비가 되었습니다**

---

## 2. 템플릿 선택

Microsoft Foundry 플랫폼은 _멀티 에이전트 워크플로우 자동화_ 및 _멀티 모달 콘텐츠 처리_와 같은 인기 솔루션 시나리오를 다루는 [추천 AZD 템플릿 세트](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)를 제공합니다. 또한 Microsoft Foundry 포털에서 이 템플릿들을 찾아볼 수도 있습니다.

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) 방문
1. 로그인 화면에서 Microsoft Foundry 포털에 로그인하면 다음과 같은 화면이 나타납니다.

![Pick](../../../../../translated_images/ko/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** 옵션은 시작 템플릿입니다:

1. [ ] [AI 채팅 시작하기](https://github.com/Azure-Samples/get-started-with-ai-chat)는 사용자의 데이터를 사용해 기본 채팅 애플리케이션을 Azure Container Apps에 배포합니다. 기본 AI 챗봇 시나리오를 탐색할 때 사용합니다.
1. [X] [AI Agents 시작하기](https://github.com/Azure-Samples/get-started-with-ai-agents)는 표준 AI Agent(Foundry 에이전트 포함)를 배포합니다. 도구와 모델이 포함된 에이전트형 AI 솔루션에 익숙해지기 위해 사용하세요.

두 번째 링크를 새 브라우저 탭에서 열거나 관련 카드의 `Open in GitHub`를 클릭하세요. 이 AZD 템플릿의 저장소가 표시됩니다. README 파일을 잠시 살펴보세요. 애플리케이션 아키텍처는 다음과 같습니다:

![Arch](../../../../../translated_images/ko/architecture.8cec470ec15c65c7.webp)

---

## 3. 템플릿 활성화

이 템플릿을 배포해보고 유효한지 확인해 봅시다. [시작하기](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 섹션의 지침을 따릅니다.

1. [이 링크](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents)를 클릭하고 기본 동작인 `Create codespace`를 확인하세요.
1. 새 브라우저 탭이 열리고 GitHub Codespaces 세션이 로드될 때까지 기다리세요.
1. Codespaces 내 VS Code 터미널을 열고 다음 명령어를 입력하세요:

   ```bash title="" linenums="0"
   azd up
   ```

워크플로우 단계를 완료하세요:

1. Azure 로그인 요청이 나타나면 인증 지침을 따르세요.
1. 고유한 환경 이름을 입력하세요 - 예: 저는 `nitya-mshack-azd`를 사용했습니다.
1. `.azure/` 폴더가 생성되며, 환경 이름의 하위 폴더가 보입니다.
1. 구독 이름을 선택하라는 메시지가 나타나면 기본값을 선택하세요.
1. 위치를 묻는 메시지가 나타나면 `East US 2`를 사용하세요.

이제 프로비저닝 완료를 기다리세요. **10-15분 정도 소요됩니다**

1. 완료되면 콘솔에 다음과 같은 성공 메시지가 표시됩니다:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure Portal에 환경 이름으로 프로비저닝된 리소스 그룹이 생성됩니다:

      ![Infra](../../../../../translated_images/ko/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **이제 배포된 인프라와 애플리케이션을 검증할 준비가 되었습니다.**

---

## 4. 템플릿 검증

1. Azure Portal [리소스 그룹](https://portal.azure.com/#browse/resourcegroups) 페이지를 방문하고 로그인하세요.
1. 환경 이름으로 된 RG를 클릭하면 위 페이지가 나타납니다.

      - Azure Container Apps 리소스를 클릭하세요.
      - _Essentials_ 섹션(오른쪽 상단)의 애플리케이션 URL을 클릭하세요.

1. 다음과 같은 호스팅된 애플리케이션 프런트엔드 UI가 표시됩니다:

   ![App](../../../../../translated_images/ko/03-test-application.471910da12c3038e.webp)

1. [샘플 질문](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)을 몇 개 시도해 보세요.

      1. 질문: ```프랑스의 수도는 어디입니까?``` 
      1. 질문: ```2명용으로 가격이 200달러 미만인 최고의 텐트는 무엇이며 어떤 기능이 있나요?```

1. 다음과 비슷한 답변을 받게 됩니다. _그런데 이것이 어떻게 작동하나요?_ 

      ![App](../../../../../translated_images/ko/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 에이전트 검증

Azure Container App은 이 템플릿을 위해 Microsoft Foundry 프로젝트에 프로비저닝된 AI Agent에 연결되는 엔드포인트로 배포합니다. 이것이 무엇을 의미하는지 살펴봅시다.

1. Azure Portal에서 리소스 그룹 _개요_ 페이지로 돌아가세요.

1. 목록에서 `Microsoft Foundry` 리소스를 클릭하세요.

1. 다음이 보입니다. `Go to Microsoft Foundry Portal` 버튼을 클릭하세요. 
   ![Foundry](../../../../../translated_images/ko/04-view-foundry-project.fb94ca41803f28f3.webp)

1. AI 애플리케이션에 대한 Foundry 프로젝트 페이지가 나타납니다.
   ![Project](../../../../../translated_images/ko/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents`를 클릭하면 프로젝트에 프로비저닝된 기본 에이전트를 볼 수 있습니다.
   ![Agents](../../../../../translated_images/ko/06-visit-agents.bccb263f77b00a09.webp)

1. 선택하면 에이전트 세부 정보가 표시됩니다. 다음을 유의하세요:

      - 에이전트는 기본적으로 항상 파일 검색을 사용합니다.
      - 에이전트 `Knowledge`에는 32개의 업로드된 파일이 표시됩니다 (파일 검색용)
      ![Agents](../../../../../translated_images/ko/07-view-agent-details.0e049f37f61eae62.webp)

1. 왼쪽 메뉴에서 `Data+indexes` 옵션을 찾아 클릭하세요.

      - 32개의 지식용 데이터 파일이 업로드된 것을 볼 수 있습니다.
      - 이는 `src/files` 폴더 내 12개의 고객 파일과 20개의 제품 파일에 해당합니다.
      ![Data](../../../../../translated_images/ko/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**에이전트 작동을 검증했습니다!** 

1. 에이전트 답변은 해당 파일들에 담긴 지식에 기반합니다. 
1. 이제 해당 데이터와 관련된 질문을 하여 근거 있는 답변을 받을 수 있습니다.
1. 예: `customer_info_10.json`은 "Amanda Perez"가 구매한 3개의 내역을 설명합니다.

컨테이너 앱 엔드포인트가 열린 브라우저 탭으로 돌아가 `Amanda Perez가 소유한 제품은 무엇입니까?`라고 질문해 보세요. 다음과 비슷한 답변이 나올 것입니다:

![Data](../../../../../translated_images/ko/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 에이전트 플레이그라운드

Microsoft Foundry의 기능을 조금 더 직관적으로 이해하기 위해, 에이전트를 에이전트 플레이그라운드에서 직접 사용해 봅시다.

1. Microsoft Foundry에서 `Agents` 페이지로 돌아가서 기본 에이전트를 선택하세요.
1. `Try in Playground` 옵션을 클릭하면 다음과 같은 플레이그라운드 UI가 표시됩니다.
1. 똑같은 질문을 해 보세요: `Amanda Perez가 소유한 제품은 무엇입니까?`

    ![Data](../../../../../translated_images/ko/09-ask-in-playground.a1b93794f78fa676.webp)

비슷한 답변(또는 동일한 답변)을 받지만, 에이전트 앱의 품질, 비용 및 성능을 이해하는 데 도움이 되는 추가 정보도 볼 수 있습니다. 예를 들어:

1. 응답에는 답변을 "근거"하는 데 사용된 데이터 파일들이 인용됩니다.
1. 파일 레이블에 마우스를 올려보세요 - 데이터가 질문 및 응답과 일치합니까?

응답 바로 아래에 _stats_ 행이 있습니다.

1. 임의의 지표에 마우스를 올려보세요 - 예: 안전성(Safety). 다음과 같이 나타납니다.
1. 평가된 등급이 응답 안전성 수준에 대한 직관과 일치합니까?

      ![Data](../../../../../translated_images/ko/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 내장 관찰 가능성

관찰 가능성(Observability)은 애플리케이션이 데이터를 생성하도록 계측하여 운영을 이해하고, 디버깅하며, 최적화할 수 있도록 하는 것입니다. 이를 경험하기 위해:

1. `View Run Info` 버튼을 클릭하면 다음 뷰가 나타납니다. 이는 [에이전트 추적](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground)의 예시입니다. _상위 메뉴에서 Thread Logs를 클릭해도 이 뷰를볼 수 있습니다_.

   - 에이전트가 수행한 실행 단계와 사용한 도구를 파악하세요.
   - 응답에 사용된 전체 토큰 수(응답 출력 토큰 대비)를 이해하세요.
   - 실행 지연 시간과 시간이 소비된 부분을 파악하세요.

      ![Agent](../../../../../translated_images/ko/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` 탭을 클릭하면 나중에 문제 해결에 유용할 수 있는 추가 실행 속성을 볼 수 있습니다.   

      ![Agent](../../../../../translated_images/ko/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` 탭을 클릭하면 에이전트 응답에 대한 자동 평가 결과를 볼 수 있습니다. 여기에는 안전성 평가(예: 자해 위험) 및 에이전트 특정 평가(예: 의도 해석, 작업 준수)가 포함됩니다.

      ![Agent](../../../../../translated_images/ko/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 마지막으로, 사이드바 메뉴에서 `Monitoring` 탭을 클릭하세요.

      - 표시된 페이지에서 `Resource usage` 탭을 선택하고 메트릭을 확인하세요.
      - 비용(토큰) 및 부하(요청) 측면에서 애플리케이션 사용량을 추적하세요.
      - 첫 바이트 처리 시간(입력 처리) 및 마지막 바이트 처리 시간(출력)을 추적하세요.

      ![Agent](../../../../../translated_images/ko/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 환경 변수

지금까지는 브라우저에서 배포 과정을 살펴보고 인프라가 프로비저닝되고 애플리케이션이 운영 중임을 확인했습니다. 하지만 애플리케이션을 _코드 중심_으로 다루려면, 관련 리소스 작업에 필요한 변수를 로컬 개발 환경에 구성해야 합니다. `azd`를 사용하면 쉽습니다.

1. Azure Developer CLI는 [환경 변수](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash)를 사용해 애플리케이션 배포 구성 설정을 저장 및 관리합니다.

1. 환경 변수는 `.azure/<env-name>/.env`에 저장되어 `env-name` 환경에 스코프를 지정하고, 동일 저장소 내 서로 다른 배포 대상 간 환경을 분리하는 데 도움이 됩니다.

1. 특정 명령어(예: `azd up`)를 실행할 때마다 `azd` 명령이 환경 변수를 자동으로 로드합니다. OS 수준의 환경 변수(쉘에 설정된 등)는 자동으로 읽지 않으므로, 스크립트 내에서 `azd set env` 및 `azd get env`를 사용해 정보를 전달하세요.


몇 가지 명령을 시도해 봅시다:

1. 이 환경에서 azd에 설정된 모든 환경 변수를 가져옵니다:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      다음과 비슷한 내용이 표시됩니다:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 특정 값을 가져옵니다 - 예를 들어 `AZURE_AI_AGENT_MODEL_NAME` 값이 설정되었는지 확인해 봅니다.

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      다음과 비슷하게 표시됩니다 - 기본적으로 설정되어 있지 않았습니다!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. azd에 새로운 환경 변수를 설정합니다. 여기서는 에이전트 모델 이름을 업데이트합니다. _참고: 변경 사항은 즉시 `.azure/<env-name>/.env` 파일에 반영됩니다.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      이제 값이 설정된 것을 확인할 수 있습니다:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 일부 리소스(예: 모델 배포)는 지속적이므로 단순히 `azd up` 명령만으로 다시 배포되지 않을 수 있습니다. 원본 배포를 제거하고 변경된 환경 변수로 다시 배포해 보겠습니다.

1. **새로 고침** 이전에 azd 템플릿으로 인프라를 배포했었다면, 다음 명령어를 사용하여 로컬 환경 변수 상태를 현재 Azure 배포 상태에 맞게 _새로 고침_할 수 있습니다:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      이것은 두 개 이상의 로컬 개발 환경(예: 여러 개발자가 있는 팀) 간에 환경 변수를 _동기화_하는 강력한 방법입니다 - 배포된 인프라가 환경 변수 상태에 대한 근거 진실 역할을 하도록 합니다. 팀원들은 간단히 변수를 _새로 고침_하여 동기화를 다시 맞출 수 있습니다.

---

## 9. 축하합니다 🏆

당신은 다음과 같은 엔드 투 엔드 워크플로를 완료했습니다:

- [X] 사용하려는 AZD 템플릿 선택
- [X] GitHub Codespaces로 템플릿 시작
- [X] 템플릿을 배포하고 작동하는지 확인

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 내용이 포함될 수 있음을 유의하시기 바랍니다. 원본 문서가 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역 사용으로 인해 발생하는 모든 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->