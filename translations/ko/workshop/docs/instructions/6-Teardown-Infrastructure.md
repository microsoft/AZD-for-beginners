# 6. 인프라 해체

!!! tip "이 모듈을 마치면 할 수 있게 됩니다"

    - [ ] 리소스 정리와 비용 관리의 중요성 이해
    - [ ] `azd down`을 사용해 인프라를 안전하게 해체
    - [ ] 필요 시 소프트 삭제된 Azure AI 서비스 복구
    - [ ] **실습 6:** Azure 리소스 정리 및 제거 확인

---

## 보너스 연습

프로젝트를 해체하기 전에 몇 분간 자유롭게 탐색해 보세요.

!!! info "다음 탐색 질문을 시도해 보세요"

    **GitHub Copilot으로 실험하기:**
    
    1. 물어보기: `멀티 에이전트 시나리오에 적합한 다른 AZD 템플릿은 무엇이 있을까요?`
    2. 물어보기: `헬스케어 사용 사례에 맞게 에이전트 지침을 어떻게 맞춤 설정할 수 있을까요?`
    3. 물어보기: `비용 최적화를 조절하는 환경 변수는 무엇인가요?`
    
    **Azure 포털 탐색하기:**
    
    1. 배포된 Application Insights 메트릭 검토
    2. 프로비저닝 된 리소스의 비용 분석 확인
    3. Microsoft Foundry 포털 에이전트 플레이그라운드 다시 탐색

---

## 인프라 해제

1. 인프라 해체는 다음처럼 간단합니다:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. `--purge` 플래그는 소프트 삭제된 인지 서비스 리소스도 정리하여 해당 리소스가 차지한 할당량을 해제합니다. 완료되면 다음과 같은 메시지를 볼 수 있습니다:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (선택 사항) 이제 `azd up`을 다시 실행하면 환경 변수 변경 사항이 로컬 `.azure` 폴더에 저장되어 gpt-4.1 모델이 배포되는 것을 확인할 수 있습니다.

      아래는 **배포 이전** 모델 상태입니다:

      ![Initial](../../../../../translated_images/ko/14-deploy-initial.30e4cf1c29b587bc.webp)

      그리고 이것이 **배포 이후** 상태입니다:
      ![New](../../../../../translated_images/ko/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->