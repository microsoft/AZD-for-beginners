# 2장: AI-퍼스트 개발

**📚 과정**: [초보자를 위한 AZD](../../README.md) | **⏱️ 소요 시간**: 1-2시간 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 Azure Developer CLI와 Microsoft Foundry 서비스를 사용하여 AI 기반 애플리케이션을 배포하는 방법에 중점을 둡니다. 간단한 AI 채팅 앱부터 도구가 통합된 지능형 에이전트까지 다룹니다.

> **검증 참고 (2026-07-13):** 이 장의 명령 흐름과 확장 지침은 `azd` `1.27.1` 버전과 현재 프리뷰 AI 에이전트 확장판 `azure.ai.agents` `1.0.0-beta.5`와 대조하여 검토하였습니다. 이전 AZD 빌드를 사용 중이면 먼저 업데이트를 수행한 후 연습을 진행하세요.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- 사전 제작된 AZD 템플릿을 사용해 AI 애플리케이션 배포
- AZD와 Microsoft Foundry 통합 이해
- 도구가 포함된 AI 에이전트 구성 및 사용자 지정
- RAG(검색-보강 생성) 애플리케이션 배포

---

## 📚 강의

| # | 강의 | 설명 | 소요 시간 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 통합](microsoft-foundry-integration.md) | AZD와 Foundry 서비스 연결 | 30분 |
| 2 | [AI 에이전트 가이드](agents.md) | 도구가 있는 지능형 에이전트 배포 | 45분 |
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

## 🤖 대표 AI 템플릿

| 템플릿 | 설명 | 서비스 |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 인용문이 포함된 RAG 채팅 | OpenAI + AI 검색 |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 도구가 있는 AI 에이전트 | AI 에이전트 서비스 |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 기본 AI 채팅 | OpenAI + 컨테이너 앱 |

---

## 💰 비용 안내

| 환경 | 예상 월 비용 |
|-------------|----------------------|
| 개발 | $80-150 |
| 스테이징 | $150-300 |
| 운영 | $300-3,500+ |

**팁:** 테스트 후에는 요금이 발생하지 않도록 `azd down`을 실행하세요.

---

## 🔗 내비게이션

| 방향 | 챕터 |
|-----------|---------|
| <strong>이전</strong> | [1장: 기초](../chapter-01-foundation/README.md) |
| <strong>다음</strong> | [3장: 구성](../chapter-03-configuration/README.md) |
| <strong>바로가기</strong> | [8장: 운영 패턴](../chapter-08-production/README.md) |

---

## 📖 관련 자료

- [AI 문제 해결](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [운영 AI 실습](../chapter-08-production/production-ai-practices.md)
- [애플리케이션 인사이트](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->