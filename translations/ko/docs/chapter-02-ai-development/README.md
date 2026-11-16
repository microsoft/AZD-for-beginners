# 2장: AI-퍼스트 개발

**📚 코스**: [초보자를 위한 AZD](../../README.md) | **⏱️ 소요 시간**: 워크숍 포함 4-5 시간 | **⭐ 난이도**: 중급

---

## 개요

이 장에서는 Azure Developer CLI와 Microsoft Foundry 서비스를 사용하여 AI 기반 애플리케이션을 배포하는 방법에 대해 다룹니다. 간단한 AI 채팅 앱부터 도구가 포함된 지능형 에이전트까지.

> **출시 검토 (2026-11-04):** AI CLI 지침은 공개된 `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, 및 `azure.ai.evaluations` `1.0.0-beta.2` 문서/소스와 대조하여 검토되었습니다. 결합된 워크플로우에는 `azd >= 1.37.0`를 사용하세요. 평가에는 이제 별도의 `azd ai eval` 네임스페이스를 사용합니다; [출시 변경 사항 및 마이그레이션 지침](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes)을 참조하세요. 이는 실시간 배포 검증이 아닙니다.

## 학습 목표

이 장을 완료하면 다음을 할 수 있습니다:
- 사전 제작된 AZD 템플릿을 사용하여 AI 애플리케이션 배포
- AZD와 Microsoft Foundry 통합 이해
- 도구로 AI 에이전트 구성 및 맞춤화
- RAG(검색 기반 생성) 애플리케이션 배포

---

## 📚 수업

| # | 수업 | 설명 | 시간 |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry 통합](microsoft-foundry-integration.md) | AZD와 Foundry 서비스 연결 | 30 분 |
| 2 | [AI 에이전트 안내서](agents.md) | 도구가 포함된 지능형 에이전트 배포 | 45 분 |
| 3 | [AI 모델 배포](ai-model-deployment.md) | AI 모델 배포 및 구성 | 30 분 |
| 4 | [AI 워크숍 실습](ai-workshop-lab.md) | 실습: 템플릿 탐색 및 전환 계획 | 2-3 시간 |

---

## 🚀 빠른 시작

빈 새 디렉터리에서 옵션 하나를 선택하세요. 뒤에 오는 `.`는 현재 디렉터리를 초기화합니다; 그렇지 않으면 AZD가 하위 디렉터리를 생성하지만 쉘 작업 디렉터리는 변경하지 않습니다.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 추천 AI 템플릿

| 템플릿 | 설명 | 서비스 |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | 인용이 포함된 RAG 채팅 | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | 도구가 포함된 AI 에이전트 | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | 기본 AI 채팅 | OpenAI + Container Apps |

---

## 💰 비용 인식

이는 예시 범위일 뿐이며 견적이나 한도가 아닙니다; 모델 트래픽, Search/컴퓨트 SKU, 지역 및 선택적 기능에 따라 초과할 수 있습니다. 프로비저닝 전에 선택한 샘플의 현재 가격 지침을 검토하세요.

| 환경 | 예상 월별 비용 |
|-------------|----------------------|
| 개발 | $80-150 |
| 스테이징 | $150-300 |
| 운영 | $300-3,500+ |

**팁:** 테스트 후 `azd down`를 실행하여 비용 청구를 방지하세요.

---

## 🔗 탐색

| 방향 | 장 |
|-----------|---------|
| <strong>이전</strong> | [1장: 기초](../chapter-01-foundation/README.md) |
| <strong>다음</strong> | [3장: 구성](../chapter-03-configuration/README.md) |
| <strong>건너뛰기</strong> | [8장: 운영 패턴](../chapter-08-production/README.md) |

---

## 📖 관련 자료

- [AI 문제 해결](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [운영 AI 관행](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->