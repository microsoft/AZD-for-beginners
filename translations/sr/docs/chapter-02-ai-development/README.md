# Поглавље 2: Развој са AI у првом плану

**📚 Course**: [AZD за почетнике](../../README.md) | **⏱️ Trajanje**: 1-2 сата | **⭐ Комплексност**: Средњи

---

## Преглед

Ово поглавље се фокусира на развршавање AI-покретаних апликација користећи Azure Developer CLI и Microsoft Foundry услуге. Од једноставних AI чат апликација до интелигентних агената са алаткама.

## Циљеви учења

Пре завршетка овог поглавља, ви ћете:
- Размештите AI апликације користећи унапред припремљене AZD шаблоне
- Разумете интеграцију Microsoft Foundry са AZD
- Конфигуришете и прилагодите AI агенте са алаткама
- Размештите RAG (Retrieval-Augmented Generation) апликације

---

## 📚 Лекције

| # | Лекција | Опис | Време |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Повежите AZD са Foundry сервисима | 30 мин |
| 2 | [AI Agents Guide](agents.md) | Размештајте интелигентне агенте са алаткама | 45 мин |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Размештајте и конфигуришите AI моделе | 30 мин |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Практично: Припремите своје AI решење за AZD | 60 мин |

---

## 🚀 Брзи почетак

```bash
# Опција 1: РАГ апликација за ћаскање
azd init --template azure-search-openai-demo
azd up

# Опција 2: АИ агенти
azd init --template get-started-with-ai-agents
azd up

# Опција 3: Брза апликација за ћаскање
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Изабрани AI шаблони

| Шаблон | Опис | Сервиси |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG ћаскање са цитатима | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI агент са алаткама | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Основно AI ћаскање | OpenAI + Container Apps |

---

## 💰 Свест о трошковима

| Окружење | Процењени месечни трошак |
|-------------|----------------------|
| Развој | $80-150 |
| Тестно | $150-300 |
| Продукција | $300-3,500+ |

**Савет:** Покрените `azd down` након тестирања да бисте избегли додатне трошкове.

---

## 🔗 Навигација

| Смер | Поглавље |
|-----------|---------|
| **Previous** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Next** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Skip to** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Повезани ресурси

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Изјава о одрицању одговорности:
Овај документ је преведен помоћу сервиса за превод вештачке интелигенције Co-op Translator (https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било какве неспоразуме или погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->