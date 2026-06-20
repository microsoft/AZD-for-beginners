# 2. 템플릿 검증

> 2026년 6월 기준 `azd 1.25.6`에서 검증됨.

!!! tip "이 모듈이 끝나면 다음을 할 수 있습니다"

    - [ ] AI 솔루션 아키텍처 분석
    - [ ] AZD 배포 워크플로우 이해
    - [ ] GitHub Copilot을 사용하여 AZD 사용 도움 받기
    - [ ] **랩 2:** AI Agents 템플릿 배포 및 검증

---


## 1. 소개

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) 또는 `azd`는 Azure에 애플리케이션을 빌드하고 배포할 때 개발자 워크플로우를 간소화하는 오픈 소스 명령줄 도구입니다.

[AZD 템플릿](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates)은 샘플 애플리케이션 코드, _인프라스트럭처 코드화_ 자산, 그리고 일관된 솔루션 아키텍처를 위한 `azd` 구성 파일이 포함된 표준화된 저장소입니다. 인프라 프로비저닝은 단지 `azd provision` 명령어만으로 간단하며, `azd up`을 사용하면 인프라를 프로비저닝하고 애플리케이션을 한 번에 배포할 수 있습니다!

결과적으로, 애플리케이션 개발 프로세스를 시작하는 것은 애플리케이션 및 인프라 요구 사항에 가장 근접한 적절한 _AZD 스타터 템플릿_을 찾은 후, 저장소를 시나리오 요구 사항에 맞게 커스터마이즈하는 것만큼 간단해질 수 있습니다.

시작에 앞서 Azure Developer CLI가 설치되어 있는지 확인해봅니다.

1. VS Code 터미널을 열고 다음 명령을 입력하세요:

      ```bash title="" linenums="0"
      azd version
      ```

1. 다음과 같은 결과를 볼 수 있을 것입니다!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**이제 azd로 템플릿을 선택하고 배포할 준비가 되었습니다**

---

## 2. 템플릿 선택

Microsoft Foundry 플랫폼에는 _멀티 에이전트 워크플로우 자동화_ 및 _멀티 모달 콘텐츠 처리_ 같은 인기 솔루션 시나리오를 다루는 [추천 AZD 템플릿 세트](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)가 제공됩니다. 또한 Microsoft Foundry 포털을 방문하여 이 템플릿을 발견할 수 있습니다.

1. [https://ai.azure.com/templates](https://ai.azure.com/templates) 방문
1. 로그인 프롬프트가 뜨면 Microsoft Foundry 포털에 로그인 - 다음과 비슷한 화면을 보게 됩니다.

![Pick](../../../../../translated_images/ko/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** 옵션은 스타터 템플릿입니다:

1. [ ] Azure Container Apps에 기본 챗 애플리케이션을 _데이터와 함께_ 배포하는 [AI 챗 시작하기](https://github.com/Azure-Samples/get-started-with-ai-chat). 기본 AI 챗봇 시나리오를 탐색할 수 있습니다.
1. [X] Foundry Agents가 포함된 표준 AI 에이전트를 배포하는 [AI Agents 시작하기](https://github.com/Azure-Samples/get-started-with-ai-agents). 도구와 모델이 포함된 에이전트형 AI 솔루션에 익숙해질 수 있도록 합니다.

두 번째 링크를 새 브라우저 탭에서 열거나 관련 카드의 `Open in GitHub`을 클릭하세요. 이 AZD 템플릿의 저장소를 볼 수 있습니다. README를 잠시 탐색해보세요. 애플리케이션 아키텍처는 다음과 같습니다:

![Arch](../../../../../translated_images/ko/architecture.8cec470ec15c65c7.webp)

---

## 3. 템플릿 활성화

이제 이 템플릿을 배포해보고 유효성을 확인해 보겠습니다. [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) 섹션 가이드라인을 따릅니다.

1. 템플릿 저장소를 위한 작업 환경 선택:

      - **GitHub Codespaces**: [이 링크](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents)를 클릭하고 `Create codespace` 확인
      - **로컬 클론 또는 개발 컨테이너**: `Azure-Samples/get-started-with-ai-agents`를 클론하고 VS Code에서 열기

1. VS Code 터미널이 준비될 때까지 기다렸다가 다음 명령어를 입력하세요:

   ```bash title="" linenums="0"
   azd up
   ```

이 작업으로 시작되는 워크플로우 단계를 완료하세요:

1. Azure 로그인을 요구받으면 안내에 따라 인증 수행
1. 고유한 환경 이름 입력 - 예: 저는 `nitya-mshack-azd` 사용
1. `.azure/` 폴더 생성됨 - 환경 이름 하위 폴더가 생성됨
1. 구독 이름 선택 요청 받음 - 기본값 선택
1. 위치 선택 요청 받음 - `East US 2` 사용

지금부터 프로비저닝이 완료될 때까지 기다립니다. **10~15분 소요됩니다**

1. 완료되면 콘솔에 다음과 같은 SUCCESS 메시지가 표시됩니다:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure Portal에는 해당 환경 이름으로 프로비저닝 된 리소스 그룹이 생성돼 있습니다:

      ![Infra](../../../../../translated_images/ko/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **이제 배포된 인프라와 애플리케이션을 검증할 준비가 되었습니다**.

---

## 4. 템플릿 검증

1. Azure Portal [리소스 그룹](https://portal.azure.com/#browse/resourcegroups) 페이지 방문 - 로그인 프롬프트 표시 시 로그인
1. 환경 이름으로 된 RG 클릭 - 위 페이지가 보임

      - Azure Container Apps 리소스 클릭
      - _Essentials_ 섹션 (우측 상단)에서 애플리케이션 URL 클릭

1. 호스팅된 애플리케이션 프론트엔드 UI가 다음과 같이 보여야 합니다:

   ![App](../../../../../translated_images/ko/03-test-application.471910da12c3038e.webp)

1. [샘플 질문들](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)을 몇 가지 물어보세요:

      1. 질문: ```프랑스의 수도는 어디인가요?``` 
      1. 질문: ```2인을 위한 200달러 이하 최적의 텐트는 무엇이고, 어떤 기능들이 있나요?```

1. 다음과 비슷한 답변을 받을 수 있습니다. _그런데 어떻게 작동하는 걸까요?_

      ![App](../../../../../translated_images/ko/03-test-question.521c1e863cbaddb6.webp)

---

## 5. 에이전트 검증

Azure Container App은 이 템플릿을 위해 Microsoft Foundry 프로젝트에서 프로비저닝된 AI 에이전트에 연결되는 엔드포인트를 배포합니다. 이것이 의미하는 바를 살펴봅시다.

1. Azure Portal에서 리소스 그룹 _개요_ 페이지로 돌아갑니다

1. 목록에서 `Microsoft Foundry` 리소스 클릭

1. 다음 화면이 나타납니다. `Go to Microsoft Foundry Portal` 버튼 클릭.
   ![Foundry](../../../../../translated_images/ko/04-view-foundry-project.fb94ca41803f28f3.webp)

1. AI 애플리케이션에 대한 Foundry 프로젝트 페이지가 표시됩니다.
   ![Project](../../../../../translated_images/ko/05-visit-foundry-portal.d734e98135892d7e.webp)

1. `Agents` 클릭 - 프로젝트에 프로비저닝된 기본 Agent가 보입니다.
   ![Agents](../../../../../translated_images/ko/06-visit-agents.bccb263f77b00a09.webp)

1. 선택하면 Agent 상세 정보가 나옵니다. 다음을 참고하세요:

      - 에이전트는 기본적으로 (항상) 파일 검색을 사용
      - 에이전트 `Knowledge`는 32개의 업로드된 파일이 있음을 나타냅니다 (파일 검색용)
      ![Agents](../../../../../translated_images/ko/07-view-agent-details.0e049f37f61eae62.webp)

1. 왼쪽 메뉴에서 `Data+indexes` 옵션을 찾아 클릭해 상세 정보 확인.

      - 32개 지식 데이터 파일이 업로드된 것을 볼 수 있음
      - 이는 `src/files`의 12개 고객 파일, 20개 제품 파일과 일치함
      ![Data](../../../../../translated_images/ko/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**에이전트가 정상 작동하는 것을 검증했습니다!** 

1. 에이전트 응답은 해당 파일 내 지식에 기반합니다.
1. 이제 관련 데이터를 바탕으로 질문하고 근거 있는 응답을 얻을 수 있습니다.
1. 예: `customer_info_10.json`은 "Amanda Perez"가 한 3건의 구매 내역을 설명합니다.

엔드포인트가 있는 컨테이너 앱 브라우저 탭으로 돌아가 `Amanda Perez가 소유한 제품은 무엇인가요?`라고 질문하세요. 다음과 비슷하게 나올 것입니다:

![Data](../../../../../translated_images/ko/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. 에이전트 플레이그라운드

Microsoft Foundry의 기능에 대해 더 많은 직관을 쌓기 위해, 에이전트를 Agents Playground에서 시험해봅시다.

1. Microsoft Foundry의 `Agents` 페이지로 돌아가 기본 에이전트 선택
1. `Try in Playground` 옵션 클릭 - 다음과 같은 플레이그라운드 UI가 나타납니다
1. 같은 질문: `Amanda Perez가 소유한 제품은 무엇인가요?` 물어보기

    ![Data](../../../../../translated_images/ko/09-ask-in-playground.a1b93794f78fa676.webp)

같거나 비슷한 응답을 받게 되지만, 추가로 에이전트 앱의 응답 품질, 비용 및 성능을 이해하는 데 도움이 되는 정보를 볼 수 있습니다. 예를 들어:

1. 응답이 근거로 사용하는 데이터 파일을 인용함에 주목
1. 해당 파일 레이블 위에 마우스를 올려 데이터가 질문 및 표시된 응답과 일치하는지 확인

응답 하단에는 _통계_ 행도 표시됩니다.

1. 임의의 지표 위에 마우스를 올려보세요 - 예: Safety. 다음과 같은 정보가 표시됨
1. 평가된 등급이 귀하가 느끼는 응답 안전성 수준과 일치하는지 확인

      ![Data](../../../../../translated_images/ko/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. 내장 관측성

관측성이란 애플리케이션을 계측하여 실행 데이터를 생성하고 이 데이터를 사용해 운영을 이해, 디버그, 최적화하는 것입니다. 이를 체감해 봅시다:

1. `View Run Info` 버튼 클릭 - 아래와 같은 모습이 보일 것입니다. 이는 [에이전트 추적](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground)의 예시입니다. _또한 최상위 메뉴에서 Thread Logs를 클릭해도 이 뷰를 볼 수 있습니다_.

   - 에이전트가 실행한 단계와 사용된 도구를 확인
   - 응답에 대한 총 토큰 수(대 출력 토큰 사용량)를 파악
   - 실행 지연 및 호출 시간 분포 이해

      ![Agent](../../../../../translated_images/ko/10-view-run-info.b20ebd75fef6a1cc.webp)

1. `Metadata` 탭 클릭 - 이후 디버깅 시 유용한 추가 메타데이터 속성을 볼 수 있습니다.

      ![Agent](../../../../../translated_images/ko/11-view-run-info-metadata.7966986122c7c2df.webp)


1. `Evaluations` 탭 클릭 - 에이전트 응답에 대해 자동 평가된 결과를 볼 수 있습니다. 여기에는 안전성 평가(예: 자해 위험) 및 에이전트 특화 평가(예: 의도 해석, 작업 준수)가 포함됩니다.

      ![Agent](../../../../../translated_images/ko/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. 마지막으로 사이드바 메뉴에서 `Monitoring` 탭 클릭.

      - 표시된 페이지에서 `Resource usage` 탭 선택 후 메트릭 확인
      - 비용(토큰) 및 부하(요청) 측면에서 애플리케이션 사용 추적
      - 첫 바이트 도달 시간(입력 처리) 및 마지막 바이트 시간(출력) 등 애플리케이션 지연 시간 추적

      ![Agent](../../../../../translated_images/ko/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. 환경 변수

지금까지는 브라우저에서 배포하고 인프라가 프로비저닝되었고 애플리케이션이 작동함을 검증했습니다. 하지만 애플리케이션을 _코드 우선_으로 다루려면, 해당 리소스를 다루는 데 필요한 관련 변수를 로컬 개발 환경에 구성해야 합니다. `azd`를 사용하면 쉽게 할 수 있습니다.

1. Azure Developer CLI는 애플리케이션 배포 설정을 저장하고 관리하기 위해 [환경 변수를 사용](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash)합니다.

1. 환경 변수는 `.azure/<env-name>/.env`에 저장되며, 이는 배포 시 사용된 `env-name` 환경에 범위를 지정해 동일 저장소 내 다양한 배포 대상 환경을 분리할 수 있도록 돕습니다.

1. 환경 변수는 `azd` 명령이 특정 명령어(예: `azd up`)를 실행할 때 자동으로 로드됩니다. 단, `azd`가 OS 레벨 환경 변수(예: 셸에 설정된 변수)를 자동으로 읽지 않으므로 스크립트 내에서는 `azd set env` 및 `azd get env`를 사용해 정보를 전달해야 합니다.

몇 가지 명령을 실행해봅시다:

1. 이 환경에서 `azd`에 설정된 모든 환경 변수 확인:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      다음과 비슷한 결과가 보일 것입니다:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. 특정 값 조회 - 예: `AZURE_AI_AGENT_MODEL_NAME` 값이 설정되었는지 확인

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      다음과 같이 기본 설정되어 있지 않음을 볼 수 있습니다!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. `azd`용 새 환경 변수 설정. 여기서는 에이전트 모델 이름을 업데이트 합니다. _참고: 변경사항은 `.azure/<env-name>/.env` 파일에 즉시 반영됩니다._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      이제 해당 값이 설정되었는지 확인:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. 일부 리소스(예: 모델 배포)는 영속적이며 단순히 `azd up`만으로는 재배포가 강제되지 않습니다. 원래 배포를 해체한 후 환경 변수 변경과 함께 다시 배포해 봅시다.

1. <strong>갱신</strong> 이전에 azd 템플릿을 사용해 인프라를 배포했다면, 다음 명령어로 현재 Azure 배포 상태에 기반해 로컬 환경 변수 상태를 _갱신_할 수 있습니다:

      ```bash title="" linenums="0"
      azd env refresh
      ```

이것은 두 개 이상의 로컬 개발 환경(예: 여러 개발자가 있는 팀) 간에 환경 변수를 _동기화_하는 강력한 방법입니다. 배포된 인프라는 환경 변수 상태에 대한 기준 진실로 사용됩니다. 팀원들은 단순히 변수를 _새로 고침_하여 다시 동기화할 수 있습니다.

---

## 9. 축하합니다 🏆

아래의 작업을 완료하는 종단 간 워크플로우를 방금 완료했습니다:

- [X] 사용하려는 AZD 템플릿 선택
- [X] 지원되는 개발 환경에서 템플릿 열기
- [X] 템플릿 배포 및 작동 여부 검증

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->