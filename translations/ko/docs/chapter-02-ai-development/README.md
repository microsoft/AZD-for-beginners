# 챕터 2: AI 우선 개발

**📚 과정**: [초보자를 위한 AZD](../../README.md) | **⏱️ 소요 시간**: 1-2 시간 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 Azure Developer CLI와 Microsoft Foundry 서비스를 사용하여 AI 기반 애플리케이션을 배포하는 데 중점을 둡니다. 단순한 AI 채팅 앱부터 도구를 갖춘 지능형 에이전트까지.

> **검증 참고 (2026-03-25):** 이 장의 명령 흐름과 확장 가이드는 `azd` `1.23.12` 및 현재 프리뷰 AI 에이전트 확장 릴리스 `azure.ai.agents` `0.1.18-preview`를 기준으로 검토되었습니다. 이전 AZD 빌드를 사용 중이라면 먼저 업데이트한 후 연습을 계속하세요.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- 사전 빌드된 AZD 템플릿을 사용하여 AI 애플리케이션 배포
- AZD와 Microsoft Foundry 통합 이해
- 도구를 사용하여 AI 에이전트를 구성하고 맞춤화
- RAG(검색 증강 생성) 애플리케이션 배포

---

## 📚 강의

| # | 강의 | 설명 | 소요 시간 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 통합](microsoft-foundry-integration.md) | AZD를 Foundry 서비스와 연결 | 30분 |
| 2 | [AI 에이전트 가이드](agents.md) | 도구를 사용하는 지능형 에이전트 배포 | 45분 |
| 3 | [AI 모델 배포](ai-model-deployment.md) | AI 모델 배포 및 구성 | 30분 |
| 4 | [AI 워크숍 실습](ai-workshop-lab.md) | 실습: AI 솔루션을 AZD에 맞게 준비 | 60분 |

---

## 🚀 빠른 시작

```bash
# 옵션 1: RAG 채팅 애플리케이션
azd init --template azure-search-openai-demo
azd up

# 옵션 2: AI 에이전트
azd init --template get-started-with-ai-agents
azd up

# 옵션 3: 빠른 채팅 앱
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 추천 AI 템플릿

| 템플릿 | 설명 | 서비스 |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 출처가 있는 RAG 채팅 | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 도구를 갖춘 AI 에이전트 | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 기본 AI 채팅 | OpenAI + Container Apps |

---

## 💰 비용 안내

| 환경 | 예상 월 비용 |
|-------------|----------------------|
| 개발 | $80-150 |
| 스테이징 | $150-300 |
| 프로덕션 | $300-3,500+ |

**팁:** 테스트 후 요금 발생을 피하려면 `azd down`을 실행하세요.

---

## 🔗 탐색

| 이동 | 챕터 |
|-----------|---------|
| <strong>이전</strong> | [챕터 1: 기초](../chapter-01-foundation/README.md) |
| <strong>다음</strong> | [챕터 3: 구성](../chapter-03-configuration/README.md) |
| <strong>건너뛰기</strong> | [챕터 8: 프로덕션 패턴](../chapter-08-production/README.md) |

---

## 📖 관련 자료

- [AI 문제 해결](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [프로덕션 AI 실무](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 고지**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원문(원어로 된 문서)을 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우에는 전문 번역사에 의한 번역을 권장합니다. 이 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->