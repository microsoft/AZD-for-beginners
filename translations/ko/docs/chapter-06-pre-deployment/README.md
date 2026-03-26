# Chapter 6: 배포 전 계획 및 검증

**📚 과정**: [초보자를 위한 AZD](../../README.md) | **⏱️ 소요 시간**: 1시간 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 애플리케이션을 배포하기 전에 필요한 계획 및 검증 단계를 다룹니다. 적절한 용량 계획, SKU 선택, 사전 점검을 통해 비용이 많이 드는 실수를 방지하는 방법을 배웁니다.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- 배포 전에 사전 점검 수행
- 용량 계획 및 리소스 요구사항 산정
- 비용 최적화를 위한 적절한 SKU 선택
- 모니터링을 위한 Application Insights 구성
- 팀 협업 패턴 이해

---

## 📚 수업

| # | 수업 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [사전 점검](preflight-checks.md) | 배포 전 구성 검증 | 15분 |
| 2 | [용량 계획](capacity-planning.md) | 리소스 요구사항 산정 | 20분 |
| 3 | [SKU 선택](sku-selection.md) | 적절한 가격 등급 선택 | 15분 |
| 4 | [Application Insights](application-insights.md) | 모니터링 구성 | 20분 |
| 5 | [협업 패턴](coordination-patterns.md) | 팀 배포 워크플로우 | 15분 |

---

## 🚀 빠른 시작

```bash
# 구독 할당량 확인
az vm list-usage --location eastus --output table

# 배포 미리보기 (리소스 생성 안 함)
azd provision --preview

# Bicep 구문 검증
az bicep build --file infra/main.bicep

# 환경 구성 확인
azd env get-values
```

---

## ☑️ 배포 전 체크리스트

### `azd provision` 이전

- [ ] 지역별 할당량 확인
- [ ] SKU 적절히 선택
- [ ] 비용 추정 검토
- [ ] 명명 규칙 일관성 유지
- [ ] 보안/RBAC 구성

### `azd deploy` 이전

- [ ] 환경 변수 설정
- [ ] Key Vault에 비밀 저장
- [ ] 연결 문자열 검증
- [ ] 상태 점검 구성

---

## 💰 SKU 선택 가이드

| 워크로드 | 개발 | 운영 |
|----------|-------------|------------|
| 컨테이너 앱 | 소비량 기반 | 전용 D4 |
| 앱 서비스 | B1/B2 | P1v3 이상 |
| Microsoft Foundry 모델 | 표준 | 표준 + PTU |
| AI 검색 | 기본 | 표준 S2 이상 |

---

## 🔗 탐색

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
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하였으나, 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원본 문서의 원어 버전이 권위 있는 출처로 간주되어야 합니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역 사용으로 발생하는 오해 또는 오해에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->