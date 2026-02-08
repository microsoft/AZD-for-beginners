# 챕터 2: AI 중심 개발

**📚 과정**: [AZD For Beginners](../../README.md) | **⏱️ 소요 시간**: 1-2시간 | **⭐ 난이도**: 중급

---

## 개요

이 장은 Azure Developer CLI와 Microsoft Foundry 서비스를 사용하여 AI 기반 애플리케이션을 배포하는 데 중점을 둡니다. 간단한 AI 채팅 앱부터 도구를 갖춘 지능형 에이전트까지 다룹니다.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- 사전 제작된 AZD 템플릿을 사용하여 AI 애플리케이션을 배포합니다
- AZD와 Microsoft Foundry 통합을 이해합니다
- 도구를 사용하여 AI 에이전트를 구성하고 맞춤화합니다
- RAG(검색 보강 생성) 애플리케이션을 배포합니다

---

## 📚 수업

| # | 강의 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD를 Foundry 서비스와 연결 | 30분 |
| 2 | [AI Agents Guide](agents.md) | 도구가 포함된 지능형 에이전트 배포 | 45분 |
| 3 | [AI Model Deployment](ai-model-deployment.md) | AI 모델 배포 및 구성 | 30분 |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | 실습: AI 솔루션을 AZD에 맞게 준비 | 60분 |

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

| Template | 설명 | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 인용 포함 RAG 채팅 | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 도구가 포함된 AI 에이전트 | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 기본 AI 채팅 | OpenAI + Container Apps |

---

## 💰 비용 안내

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Tip:** 과금 방지를 위해 테스트 후 `azd down`을 실행하세요.

---

## 🔗 탐색

| Direction | Chapter |
|-----------|---------|
| **Previous** | [챕터 1: 기초](../chapter-01-foundation/README.md) |
| **Next** | [챕터 3: 구성](../chapter-03-configuration/README.md) |
| **Skip to** | [챕터 8: 운영 패턴](../chapter-08-production/README.md) |

---

## 📖 관련 자료

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [프로덕션 AI 모범 사례](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책 조항:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나 자동 번역에는 오류나 부정확성이 있을 수 있음을 양해해 주시기 바랍니다. 원문(원어) 문서를 권위 있는 출처로 간주하십시오. 중요한 정보의 경우 전문 번역가에 의한 번역을 권장합니다. 이 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->