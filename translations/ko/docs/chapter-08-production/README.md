# 챕터 8: 프로덕션 및 엔터프라이즈 패턴

**📚 코스**: [AZD For Beginners](../../README.md) | **⏱️ 소요 시간**: 2-3시간 | **⭐ 난이도**: 고급

---

## 개요

이 장에서는 엔터프라이즈 수준의 배포 패턴, 보안 강화, 모니터링 및 운영 AI 워크로드를 위한 비용 최적화를 다룹니다.

> 2026년 3월에 `azd 1.23.12`로 검증됨.

## 학습 목표

이 장을 완료하면 다음을 수행할 수 있습니다:
- 다중 지역에 걸쳐 복원력 있는 애플리케이션 배포
- 엔터프라이즈 보안 패턴 구현
- 종합 모니터링 구성
- 대규모 비용 최적화
- AZD로 CI/CD 파이프라인 설정

---

## 📚 강의

| # | 강의 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [프로덕션 AI 관행](production-ai-practices.md) | 엔터프라이즈 배포 패턴 | 90분 |

---

## 🚀 프로덕션 체크리스트

- [ ] 복원력을 위한 다중 지역 배포
- [ ] 인증을 위한 관리형 ID 사용 (키 없음)
- [ ] 모니터링을 위한 Application Insights
- [ ] 비용 예산 및 경고 구성
- [ ] 보안 스캐닝 활성화
- [ ] CI/CD 파이프라인 통합
- [ ] 재해 복구 계획

---

## 🏗️ 아키텍처 패턴

### 패턴 1: 마이크로서비스 AI

```mermaid
graph LR
    Gateway[API 게이트웨이] --> AI[AI 서비스] --> Models[Microsoft Foundry 모델]
    Gateway --> Auth[인증 서비스]
    AI --> Data[데이터 저장소]
```
### 패턴 2: 이벤트 기반 AI

```mermaid
graph LR
    EventGrid[이벤트 그리드] --> Functions[함수] --> Pipeline[AI 파이프라인]
```
---

## 🔐 보안 모범 사례

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 비용 최적화

| 전략 | 절감 |
|----------|---------|
| 스케일 투 제로 (Container Apps) | 60-80% |
| 개발에 소비 기반 계층 사용 | 50-70% |
| 예약된 스케일링 | 30-50% |
| 예약 용량 | 20-40% |

```bash
# 예산 알림 설정
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 모니터링 설정

```bash
# 스트림 로그
azd monitor --logs

# 애플리케이션 인사이트 확인
azd monitor --overview

# 지표 보기
az monitor metrics list --resource <resource-id>
```

---

## 🔗 네비게이션

| 방향 | 챕터 |
|-----------|---------|
| <strong>이전</strong> | [챕터 7: 문제 해결](../chapter-07-troubleshooting/README.md) |
| **코스 완료** | [코스 홈](../../README.md) |

---

## 📖 관련 자료

- [AI 에이전트 가이드](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [다중 에이전트 솔루션](../chapter-05-multi-agent/README.md)
- [마이크로서비스 예제](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만 자동 번역에는 오류나 부정확성이 있을 수 있음을 유의하시기 바랍니다. 원문을 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문 번역가에 의한 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 어떠한 오해나 잘못된 해석에 대해서도 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->