# Chapter 5: 다중 에이전트 AI 솔루션

**📚 강의**: [AZD 초보자용](../../README.md) | **⏱️ 소요시간**: 2-3시간 | **⭐ 난이도**: 고급

---

## 개요

이 장에서는 고급 다중 에이전트 아키텍처 패턴, 에이전트 오케스트레이션, 복잡한 시나리오를 위한 프로덕션 준비 AI 배포를 다룹니다.

> `azd 1.25.6` 기준, 2026년 6월 검증됨.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- 다중 에이전트 아키텍처 패턴 이해
- 협업하는 AI 에이전트 시스템 배포
- 에이전트 간 통신 구현
- 프로덕션 준비 다중 에이전트 솔루션 구축

---

## 📚 강의 목록

| # | 강의 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [다중 에이전트 기본](multi-agent-basics.md) | 실습: `azd up`으로 작동하는 다중 에이전트 앱 배포 | 45분 |
| 2 | [조정 패턴](../chapter-06-pre-deployment/coordination-patterns.md) | 에이전트 오케스트레이션 전략 (6장에 계속) | 30분 |
| 3 | [ARM 템플릿 배포](../../examples/retail-multiagent-arm-template/README.md) | 원클릭 배포 예제 | 30분 |

> **1강부터 시작하세요.** 이 장에서 유일하게 완전한 실습 및 배포가 가능한 강의입니다. 2강은 6장에 있으며(사전 배포 계획과 공유), [리테일 다중 에이전트 솔루션](../../examples/retail-scenario.md)은 아키텍처 청사진—설계 참조이며 원클릭 템플릿이 아닙니다.

---

## 🚀 빠른 시작

```bash
# 옵션 1: 템플릿에서 배포
azd init --template agent-openai-python-prompty
azd up

# 옵션 2: 에이전트 매니페스트에서 배포 (azure.ai.agents 확장 필요)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **어떤 방식을 선택할까요?** 작동하는 샘플에서 시작하려면 `azd init --template`을 사용하세요. 자체 에이전트 매니페스트가 있다면 `azd ai agent init`을 사용하세요. 전체 내용은 [AZD AI CLI 참조](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions)를 참조하세요.

---

## 🤖 다중 에이전트 아키텍처

```mermaid
graph TD
    Orchestrator[오케스트레이터 에이전트<br/>요청 라우팅, 워크플로우 관리] --> Customer[고객 에이전트<br/>사용자 문의, 선호도]
    Orchestrator --> Inventory[재고 에이전트<br/>재고 수준, 주문]
```

---

## 🎯 주요 솔루션: 리테일 다중 에이전트

[리테일 다중 에이전트 솔루션](../../examples/retail-scenario.md)은 다음을 보여줍니다:

- **고객 에이전트**: 사용자 상호작용 및 선호 처리
- **재고 에이전트**: 재고 및 주문 처리 관리
- <strong>오케스트레이터</strong>: 에이전트 간 조정
- **공유 메모리**: 에이전트 간 컨텍스트 관리

### 사용된 서비스

| 서비스 | 용도 |
|---------|---------|
| Microsoft Foundry Models | 언어 이해 |
| Azure AI Search | 제품 카탈로그 |
| Cosmos DB | 에이전트 상태 및 메모리 |
| Container Apps | 에이전트 호스팅 |
| Application Insights | 모니터링 |

---

## 🔗 네비게이션

| 방향 | 장 |
|-----------|---------|
| <strong>이전</strong> | [4장: 인프라](../chapter-04-infrastructure/README.md) |
| <strong>다음</strong> | [6장: 사전 배포](../chapter-06-pre-deployment/README.md) |

---

## 📖 관련 자료

- [AI 에이전트 가이드](../chapter-02-ai-development/agents.md)
- [프로덕션 AI 실습](../chapter-08-production/production-ai-practices.md)
- [AI 문제 해결](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->