# 6장: 배포 전 계획 및 검증

**📚 강의**: [초보자를 위한 AZD](../../README.md) | **⏱️ 소요 시간**: 1시간 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 애플리케이션 배포 전에 필수적인 계획 및 검증 단계를 다룹니다. 적절한 용량 계획, SKU 선택 및 사전 점검을 통해 비용이 많이 드는 실수를 방지하는 방법을 배웁니다.

> 2026년 7월에 `azd 1.27.1`로 검증 완료.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- 배포 전 사전 점검 수행
- 용량 계획 수립 및 자원 요구량 추정
- 비용 최적화를 위한 적절한 SKU 선택
- 모니터링을 위한 Application Insights 구성
- 팀 협업 패턴 이해

---

## 📚 강의 목록

| # | 강의 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [사전 점검](preflight-checks.md) | 배포 전 구성 검증 | 15분 |
| 2 | [용량 계획](capacity-planning.md) | 자원 요구사항 추정 | 20분 |
| 3 | [SKU 선택](sku-selection.md) | 적절한 요금제 선택 | 15분 |
| 4 | [Application Insights](application-insights.md) | 모니터링 구성 | 20분 |
| 5 | [협업 패턴](coordination-patterns.md) | 팀 배포 워크플로우 | 15분 |

---

## 🚀 빠른 시작

```bash
# 구독 할당량 확인
az vm list-usage --location eastus --output table

# 배포 미리보기 (리소스 생성 없음)
azd provision --preview

# Bicep 구문 검증
az bicep build --file infra/main.bicep

# 환경 구성 확인
azd env get-values
```

---

## ☑️ 배포 전 체크리스트

### `azd provision` 전에

- [ ] 지역별 쿼터 확인 완료
- [ ] SKU 적절히 선택됨
- [ ] 비용 추정 검토됨
- [ ] 명명 규칙 일관성 있음
- [ ] 보안/RBAC 구성됨

### `azd deploy` 전에

- [ ] 환경 변수 설정됨
- [ ] Key Vault에 비밀 저장됨
- [ ] 연결 문자열 확인됨
- [ ] 상태 점검 구성됨

---

## 💰 SKU 선택 가이드

| 작업 부하 | 개발 | 운영 |
|----------|-------------|------------|
| Container Apps | 소비 기반 | 전용 D4 |
| App Service | B1/B2 | P1v3 이상 |
| Microsoft Foundry Models | 스탠다드 | 스탠다드 + PTU |
| AI 검색 | 기본 | 스탠다드 S2 이상 |

---

## 🔗 이동

| 방향 | 장 |
|-----------|---------|
| <strong>이전</strong> | [5장: 멀티 에이전트](../chapter-05-multi-agent/README.md) |
| <strong>다음</strong> | [7장: 문제 해결](../chapter-07-troubleshooting/README.md) |

---

## 📖 관련 자료

- [구성 가이드](../chapter-03-configuration/configuration.md)
- [배포 가이드](../chapter-04-infrastructure/deployment-guide.md)
- [일반 문제](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->