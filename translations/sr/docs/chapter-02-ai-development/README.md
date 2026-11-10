# Поглавље 2: AI-прво развијање

**📚 Курс**: [AZD за почетнике](../../README.md) | **⏱️ Трајање**: 4-5 сати укључујући радионицу | **⭐ Комплексност**: Средњи ниво

---

## Преглед

Ово поглавље се фокусира на распоређивање апликација са вештачком интелигенцијом користећи Azure Developer CLI и Microsoft Foundry сервисе. Од једноставних AI ћаскања до интелигентних агената са алатима.

> **Преглед издања (2026-11-04):** Упутство за AI CLI је проверено у односу на објављену документацију/извор `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, и `azure.ai.evaluations` `1.0.0-beta.2`. Користите `azd >= 1.37.0` за комбиновани ток рада. Евалуације сада користе засебни простор имена `azd ai eval`; погледајте [промене издања и смернице за миграцију](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Ово није валидација уживо распореда.

## Циљеви учења

Завршетком овог поглавља, научићете:
- Како распоредити AI апликације користећи унапред дефинисане AZD шаблоне
- Разумевање интеграције Microsoft Foundry са AZD
- Како конфигурисати и прилагодити AI агенте са алатима
- Како распоредити RAG (Retrieval-Augmented Generation) апликације

---

## 📚 Лекције

| # | Лекција | Опис | Време |
|---|--------|-------------|------|
| 1 | [Интеграција Microsoft Foundry](microsoft-foundry-integration.md) | Повежите AZD са Foundry сервисима | 30 мин |
| 2 | [Водич за AI агенте](agents.md) | Распоредите интелигентне агенте са алатима | 45 мин |
| 3 | [Распоређивање AI модела](ai-model-deployment.md) | Распоредите и конфигуришите AI моделе | 30 мин |
| 4 | [AI радионица лабораторија](ai-workshop-lab.md) | Практично: Истражите шаблон и планирајте вашу конверзију | 2-3 сата |

---

## 🚀 Брз почетак

Изаберите једну опцију у новом празном директоријуму. Завршни `.` инициализује тренутни директоријум; иначе AZD може креирати поддиректоријум без промене радног директоријума вашег терминала.

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

## 🤖 Истакнути AI шаблони

| Шаблон | Опис | Сервиси |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG чет са навођењем извора | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI агент са алатима | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Основни AI чет | OpenAI + Container Apps |

---

## 💰 Свесност о трошковима

Ово су илустративни рангови, а не понуде или ограничења; саобраћај модела, Search/compute SKUs, регион и опционе функције могу их превазићи. Прегледајте актуелна упутства за цене изабраног примера пре креирања.

| Окружење | Процењени месечни трошак |
|-------------|----------------------|
| Развој | $80-150 |
| Припрема | $150-300 |
| Производња | $300-3,500+ |

**Савет:** Покрените `azd down` након тестирања како бисте избегли таксе.

---

## 🔗 Навигација

| Смер | Поглавље |
|-----------|---------|
| **Претходно** | [Поглавље 1: Основање](../chapter-01-foundation/README.md) |
| **Следеће** | [Поглавље 3: Конфигурација](../chapter-03-configuration/README.md) |
| **Прескочи на** | [Поглавље 8: Обрасци производње](../chapter-08-production/README.md) |

---

## 📖 Повезани ресурси

- [Решавање проблема са AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Производне AI праксе](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->