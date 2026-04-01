# Поглавље 2: Развој вођен вештачком интелигенцијом

**📚 Course**: [AZD за почетнике](../../README.md) | **⏱️ Duration**: 1-2 hours | **⭐ Complexity**: Intermediate

---

## Преглед

Ово поглавље фокусира се на распоређивање апликација које покреће вештачка интелигенција коришћењем Azure Developer CLI и Microsoft Foundry услуга. Од једноставних AI chat апликација до интелигентних агената са алатима.

> **Напомена о валидацији (2026-03-25):** Ток команда и смернице за екстензије у овом поглављу прегледани су у односу на `azd` `1.23.12` и тренутно preview издање AI agent екстензије `azure.ai.agents` `0.1.18-preview`. Ако користите старију AZD верзију, прво ажурирајте, па наставите са вежбама.

## Циљеви учења

Завршетком овог поглавља, ви ћете:
- Разместити AI апликације користећи унапред изграђене AZD шаблоне
- Разумети интеграцију Microsoft Foundry са AZD
- Конфигурисати и прилагодити AI агенте са алатима
- Разместити RAG (Retrieval-Augmented Generation) апликације

---

## 📚 Лекције

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Интеграција Microsoft Foundry](microsoft-foundry-integration.md) | Повежите AZD са Foundry услугама | 30 мин |
| 2 | [Водич за AI агенте](agents.md) | Размештање интелигентних агената са алаткама | 45 мин |
| 3 | [Размештање AI модела](ai-model-deployment.md) | Размештање и конфигурисање AI модела | 30 мин |
| 4 | [AI радионица - лабораторија](ai-workshop-lab.md) | Практично: Припремите своје AI решење за AZD | 60 мин |

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

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG ћаскање са цитатима | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI агент са алаткама | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Основно AI ћаскање | OpenAI + Container Apps |

---

## 💰 Свесност о трошковима

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Савет:** Покрените `azd down` након тестирања да бисте избегли наплату.

---

## 🔗 Навигација

| Direction | Chapter |
|-----------|---------|
| **Претходно** | [Поглавље 1: Основа](../chapter-01-foundation/README.md) |
| **Следеће** | [Поглавље 3: Конфигурација](../chapter-03-configuration/README.md) |
| **Прескочи на** | [Поглавље 8: Обрасци за продукцију](../chapter-08-production/README.md) |

---

## 📖 Повезани ресурси

- [Решавање проблема са AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Праксе AI у продукцији](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Овај документ је преведен помоћу AI услуге за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, имајте на уму да аутоматизовани преводи могу садржати грешке или нетачности. Изворни документ на његовом оригиналном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Не одговарамо за било какве неспоразуме или погрешне тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->