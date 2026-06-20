# Поглавље 2: AI-прво развијање

**📚 Курс**: [AZD за почетнике](../../README.md) | **⏱️ Трајање**: 1-2 сата | **⭐ Сложеност**: Средњи

---

## Преглед

Ово поглавље се фокусира на разгештавање апликација покретаних вештачком интелигенцијом користећи Azure Developer CLI и Microsoft Foundry сервисе. Од једноставних AI чат апликација до интелигентних агената са алатима.

> **Напомена о валидацији (2026-06-15):** Ток команди и смернице за екстензије у овом поглављу прегледани су у односу на `azd` `1.25.6` и тренутно preview издање AI agent екстензије `azure.ai.agents` `0.1.40-preview`. Ако сте на старијој AZD верзији, ажурирајте прво и онда наставите са вежбама.

## Циљеви учења

By completing this chapter, you will:
- Разместити AI апликације помоћу унапред направљених AZD шаблона
- Разумети интеграцију Microsoft Foundry са AZD
- Конфигурисати и прилагодити AI агенте са алатима
- Разместити RAG (генерација проширена претрагом) апликације

---

## 📚 Лекције

| # | Лекција | Опис | Време |
|---|--------|-------------|------|
| 1 | [Интеграција Microsoft Foundry](microsoft-foundry-integration.md) | Повежите AZD са Foundry услугама | 30 мин |
| 2 | [Водич за AI агенте](agents.md) | Разместити интелигентне агенте са алатима | 45 мин |
| 3 | [Размештање AI модела](ai-model-deployment.md) | Разместити и конфигурисати AI моделе | 30 мин |
| 4 | [AI радионица](ai-workshop-lab.md) | Практично: Припремите своје AI решење за AZD | 60 мин |

---

## 🚀 Брзи почетак

```bash
# Опција 1: RAG апликација за ћаскање
azd init --template azure-search-openai-demo
azd up

# Опција 2: AI агенти
azd init --template get-started-with-ai-agents
azd up

# Опција 3: Брза апликација за ћаскање
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Истакнути AI шаблони

| Шаблон | Опис | Услуге |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG ћаскање са цитатима | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI агент са алатима | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Основно AI ћаскање | OpenAI + Container Apps |

---

## 💰 Свест о трошковима

| Окружење | Процењени месечни трошкови |
|-------------|----------------------|
| Development | $80-150 |
| Стейџинг | $150-300 |
| Производња | $300-3,500+ |

**Савет:** Покрените `azd down` након тестирања да бисте избегли наплате.

---

## 🔗 Навигација

| Правец | Поглавље |
|-----------|---------|
| **Претходно** | [Поглавље 1: Основа](../chapter-01-foundation/README.md) |
| **Следеће** | [Поглавље 3: Конфигурација](../chapter-03-configuration/README.md) |
| **Прескочи на** | [Поглавље 8: Обрасци за производњу](../chapter-08-production/README.md) |

---

## 📖 Повезани ресурси

- [Решавање проблема са AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Практике за AI у производњи](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->