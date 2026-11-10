# 6장: 배포 전 계획 및 검증

**📚 코스**: [AZD 초보자용](../../README.md) | **⏱️ 소요 시간**: 2-4시간 읽기; 적응형 실습 추가 시간 | **⭐ 난이도**: 중급–고급

---

## 개요

이 장에서는 애플리케이션 배포 전에 필수적인 계획 및 검증 단계를 다룹니다. 적절한 용량 계획, SKU 선택 및 사전 검사로 비용이 많이 드는 실수를 방지하는 법을 배우세요.

> 배포된 `azd 1.37.2` 참조를 기준으로 명령어 지침을 검토했습니다. 클라우드 배포는 실행하지 않았습니다. 긴 강의에는 완전한 로컬 배포 프로젝트가 아닌 예시 조각이 포함되어 있습니다.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- 배포 전에 사전 검사를 실행
- 용량 계획 수립 및 리소스 요구 사항 추정
- 비용 최적화를 위한 적절한 SKU 선택
- 모니터링을 위한 Application Insights 구성
- 다중 에이전트 조정 패턴 및 배포 요구 사항 이해

---

## 📚 강의

| # | 강의 | 설명 | 소요 시간 |
|---|--------|-------------|------|
| 1 | [사전 검사](preflight-checks.md) | 배포 전 구성 검증 | 15분 |
| 2 | [용량 계획](capacity-planning.md) | 리소스 요구 사항 추정 | 20분 |
| 3 | [SKU 선택](sku-selection.md) | 적합한 가격 등급 선택 | 15분 |
| 4 | [Application Insights](application-insights.md) | 모니터링 구성 | 20분 |
| 5 | [조정 패턴](coordination-patterns.md) | 고급 다중 에이전트 오케스트레이션 설계 | 60-75분 |

---

## 🚀 빠른 시작

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ 배포 전 체크리스트

### `azd provision` 이전

- [ ] 리전 쿼터 확인
- [ ] SKU 적절하게 선택됨
- [ ] 비용 추정 검토됨
- [ ] 명명 규칙 일관성 유지
- [ ] 보안/RBAC 구성

### `azd deploy` 이전

- [ ] 환경 변수 설정
- [ ] Key Vault에 비밀 저장
- [ ] 연결 문자열 확인
- [ ] 상태 검진 구성

---

## 💰 SKU 선택 가이드

| 워크로드 | 개발 | 운영 |
|----------|-------------|------------|
| 컨테이너 앱 | 소비 기반 | 측정된 부하에 따른 소비 기반 또는 전용 워크로드 프로필 |
| 앱 서비스 | B1/B2 | P1v3 이상 |
| Azure OpenAI 모델 | 지원되는 종량제 배포 유형 | 종량제 또는 프로비저닝 처리량; 모델/리전별 다름 |
| AI 검색 | 제한 내 무료/기본 | 인덱스, 복제본 및 쿼리 부하에 맞춘 기본 또는 표준 등급 |

---

## 🔗 이동

| 방향 | 장 |
|-----------|---------|
| <strong>이전</strong> | [5장: 다중 에이전트](../chapter-05-multi-agent/README.md) |
| <strong>다음</strong> | [7장: 문제해결](../chapter-07-troubleshooting/README.md) |

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