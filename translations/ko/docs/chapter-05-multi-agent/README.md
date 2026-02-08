# 챕터 5: 다중 에이전트 AI 솔루션

**📚 과정**: [AZD For Beginners](../../README.md) | **⏱️ 소요 시간**: 2-3시간 | **⭐ 난이도**: 고급

---

## 개요

이 장에서는 고급 다중 에이전트 아키텍처 패턴, 에이전트 오케스트레이션, 복잡한 시나리오를 위한 프로덕션 준비 AI 배포에 대해 다룹니다.

## 학습 목표

이 장을 완료하면 다음을 학습하게 됩니다:
- 다중 에이전트 아키텍처 패턴 이해
- 협업하는 AI 에이전트 시스템 배포
- 에이전트 간 통신 구현
- 프로덕션 준비된 다중 에이전트 솔루션 구축

---

## 📚 강의

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [리테일 다중 에이전트 솔루션](../../examples/retail-scenario.md) | 전체 구현 안내 | 90 min |
| 2 | [조정 패턴](../chapter-06-pre-deployment/coordination-patterns.md) | 에이전트 오케스트레이션 전략 | 30 min |
| 3 | [ARM 템플릿 배포](../../examples/retail-multiagent-arm-template/README.md) | 원클릭 배포 | 30 min |

---

## 🚀 빠른 시작

```bash
# 리테일 멀티 에이전트 솔루션을 배포합니다
cd examples/retail-multiagent-arm-template
./deploy.sh

# 또는 템플릿을 직접 사용합니다
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 다중 에이전트 아키텍처

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 추천 솔루션: 리테일 다중 에이전트

The [리테일 다중 에이전트 솔루션](../../examples/retail-scenario.md) 시연 내용:

- **고객 에이전트**: 사용자 상호작용 및 선호도 처리
- **재고 에이전트**: 재고 및 주문 처리 관리
- **오케스트레이터**: 에이전트 간 조정
- **공유 메모리**: 에이전트 간 컨텍스트 관리

### 사용된 서비스

| Service | Purpose |
|---------|---------|
| Azure OpenAI | 언어 이해 |
| Azure AI Search | 상품 카탈로그 |
| Cosmos DB | 에이전트 상태 및 메모리 |
| Container Apps | 에이전트 호스팅 |
| Application Insights | 모니터링 |

---

## 🔗 탐색

| Direction | Chapter |
|-----------|---------|
| **이전** | [챕터 4: 인프라](../chapter-04-infrastructure/README.md) |
| **다음** | [챕터 6: 사전 배포](../chapter-06-pre-deployment/README.md) |

---

## 📖 관련 자료

- [AI 에이전트 가이드](../chapter-02-ai-development/agents.md)
- [프로덕션 AI 실무](../chapter-08-production/production-ai-practices.md)
- [AI 문제해결](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책사항:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용해 번역되었습니다. 정확성을 위해 최선을 다했으나 자동 번역에는 오류나 부정확성이 포함될 수 있음을 알려드립니다. 원문(해당 문서의 원어 버전)을 권위 있는 자료로 간주하시기 바랍니다. 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 이 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 당사가 책임지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->