# 6. 인프라 해체

!!! tip "이 모듈이 끝날 때쯤에는 다음을 할 수 있습니다"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## 보너스 연습문제

프로젝트를 해체하기 전에 잠시 시간을 내어 자유롭게 탐색해 보세요.

!!! info "다음 탐색 프롬프트를 시도해 보세요"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## 인프라 해제

!!! warning "GA 호스티드 에이전트 연습문제를 완료한 경우"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. 인프라 해체는 다음처럼 간단합니다:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. 선택한 환경을 확인하고 삭제할 리소스를 검토하세요. 이 작업은 Azure 리소스를 제거하고 데이터를 삭제할 수 있습니다. 이 학습 워크플로우에서는 확인 프롬프트를 유지하세요. 완료되면 다음과 유사한 출력이 표시됩니다:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. 포털에서 삭제를 확인하고 배포 범위 밖의 리소스를 점검하세요. 비용 보고와 쿼터 업데이트는 지연될 수 있습니다. 로컬 `.azure` 구성은 명시적으로 제거하지 않는 한 남아 있습니다.

1. `azd down --purge` 는 지원되는 소프트 삭제된 리소스를 영구 삭제하도록 추가 요청합니다. 복구가 필요 없고 보존/정리 보호 정책을 이해할 때만 사용하세요. 즉각적인 쿼터 해제를 보장하지 않습니다.

1. 정리를 확인하려고 재배포하지 마세요. 이후에 의도적으로 수행하는 `azd up` 가 남은 로컬 입력을 사용해 리소스를 다시 생성하며, 비용이 다시 발생합니다. 모델 업데이트는 일반적으로 해체가 아닌 지원되는 프로비저닝 변경을 사용합니다.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->