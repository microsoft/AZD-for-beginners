# Chapter 6: 배포 전 계획 및 검증

**📚 코스**: [AZD For Beginners](../../README.md) | **⏱️ 소요 시간**: 1시간 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 애플리케이션을 배포하기 전에 필요한 필수 계획 및 검증 단계를 다룹니다. 적절한 용량 계획, SKU 선택 및 사전 점검을 통해 비용이 많이 드는 실수를 방지하는 방법을 배우세요.

## 학습 목표

이 장을 완료하면 다음을 수행할 수 있습니다:
- 배포 전에 사전 점검 실행
- 용량을 계획하고 리소스 요구 사항을 추정
- 비용 최적화를 위해 적절한 SKU 선택
- 모니터링을 위해 Application Insights 구성
- 팀 조정 패턴 이해

---

## 📚 강의

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | 배포 전 구성 유효성 검사 | 15분 |
| 2 | [Capacity Planning](capacity-planning.md) | 리소스 요구 사항 추정 | 20분 |
| 3 | [SKU Selection](sku-selection.md) | 적절한 가격 책정 계층 선택 | 15분 |
| 4 | [Application Insights](application-insights.md) | 모니터링 구성 | 20분 |
| 5 | [Coordination Patterns](coordination-patterns.md) | 팀 배포 워크플로우 | 15분 |

---

## 🚀 빠른 시작

```bash
# 구독 할당량 확인
az vm list-usage --location eastus --output table

# 배포 미리보기 (리소스가 생성되지 않음)
azd provision --preview

# Bicep 구문 검증
az bicep build --file infra/main.bicep

# 환경 구성 확인
azd env get-values
```

---

## ☑️ 배포 전 체크리스트

### `azd provision` 전에

- [ ] 리전 쿼터 확인됨
- [ ] SKU가 적절히 선택됨
- [ ] 비용 추정 검토됨
- [ ] 네이밍 규칙 일관성 확인됨
- [ ] 보안/RBAC 구성됨

### `azd deploy` 전에

- [ ] 환경 변수 설정됨
- [ ] Key Vault에 비밀(Secrets) 저장됨
- [ ] 연결 문자열 확인됨
- [ ] 헬스 체크 구성됨

---

## 💰 SKU 선택 가이드

| 워크로드 | 개발 | 운영 |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 탐색

| 방향 | 챕터 |
|-----------|---------|
| **이전** | [챕터 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **다음** | [챕터 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 관련 자료

- [구성 가이드](../chapter-03-configuration/configuration.md)
- [배포 가이드](../chapter-04-infrastructure/deployment-guide.md)
- [일반적인 문제](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책 조항:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원문(원어) 문서를 권위 있는 출처로 간주하시기 바랍니다. 중요한 정보의 경우 전문적인 사람에 의한 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해 또는 잘못된 해석에 대해서는 당사가 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->