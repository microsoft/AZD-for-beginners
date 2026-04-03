# Chapter 6: Pre-Deployment Planning & Validation

**📚 과정**: [AZD For Beginners](../../README.md) | **⏱️ 소요 시간**: 1시간 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 애플리케이션을 배포하기 전에 필요한 필수 계획 및 검증 단계를 다룹니다. 적절한 용량 계획, SKU 선택 및 사전 점검을 통해 비용이 많이 드는 실수를 피하는 방법을 배우세요.

> `azd 1.23.12`에 대해 2026년 3월에 검증됨.

## 학습 목표

이 장을 완료하면 다음을 수행할 수 있습니다:
- 배포 전에 사전 점검을 실행합니다
- 용량을 계획하고 리소스 요구 사항을 추정합니다
- 비용 최적화를 위한 적절한 SKU를 선택합니다
- 모니터링을 위해 Application Insights를 구성합니다
- 팀 조정 패턴을 이해합니다

---

## 📚 Lessons

| # | 강의 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [사전 점검](preflight-checks.md) | 배포 전에 구성을 검증합니다 | 15 min |
| 2 | [용량 계획](capacity-planning.md) | 리소스 요구사항을 추정합니다 | 20 min |
| 3 | [SKU 선택](sku-selection.md) | 적절한 가격 책정 등급을 선택합니다 | 15 min |
| 4 | [Application Insights](application-insights.md) | 모니터링을 구성합니다 | 20 min |
| 5 | [조정 패턴](coordination-patterns.md) | 팀 배포 워크플로우 | 15 min |

---

## 🚀 빠른 시작

```bash
# 구독 쿼터 확인
az vm list-usage --location eastus --output table

# 배포 미리보기(리소스가 생성되지 않음)
azd provision --preview

# Bicep 구문 검증
az bicep build --file infra/main.bicep

# 환경 구성 확인
azd env get-values
```

---

## ☑️ 배포 전 체크리스트

### `azd provision` 전에

- [ ] 리전 쿼터 확인
- [ ] SKU 적절히 선택됨
- [ ] 비용 추정 검토됨
- [ ] 명명 규칙 일관성 확인
- [ ] 보안/RBAC 구성됨

### `azd deploy` 전에

- [ ] 환경 변수 설정
- [ ] Key Vault에 비밀 저장
- [ ] 연결 문자열 확인
- [ ] 헬스 체크 구성

---

## 💰 SKU 선택 가이드

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 네비게이션

| 이동 | 챕터 |
|-----------|---------|
| <strong>이전</strong> | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| <strong>다음</strong> | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 관련 자료

- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- [Common Issues](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 있을 수 있음을 양지해 주십시오. 원문을 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 이 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->