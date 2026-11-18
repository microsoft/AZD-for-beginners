# Поглавље 2: Развој у првом плану са вештачком интелигенцијом

**📚 Курс**: [AZD за почетнике](../../README.md) | **⏱️ Трајање**: 4-5 сати укључујући радионицу | **⭐ Комплексност**: Средњи ниво

---

## Преглед

Ово поглавље се фокусира на развојање апликација које користе вештачку интелигенцију помоћу Azure Developer CLI и Microsoft Foundry услуга. Од једноставних AI чат апликација до интелигентних агената са алатима.

> **Foundry GA ажурирање (2026-11-09):** Пакет `microsoft.foundry` 1.0 је [опште доступан](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Користите `azd >= 1.37.0`; евалуације остану као посебна инсталација. [Поступак кроз hosted-agent](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) обухвата локално тестирање Agent Inspectora и даљинско постављање кода. Ово је преглед документације, а не валидација директне имплементације; опционе preview функције задржавају свој статус.

## Циљеви учења

Завршетком овог поглавља, научићете да:
- Постављате AI апликације користећи унапред направљене AZD шаблоне
- Разумете интеграцију Microsoft Foundry са AZD-ом
- Инсталирате GA пакет и тестирате hosted agent локално пре него што извори буду постављени у Foundry
- Прегледате `azure.yaml`, евалуациони материјал и чишћење нових у односу на поново коришћене пројекте
- Конфигуришете и прилагодите AI агенте уз помоћ алата
- Постављате RAG (Retrieval-Augmented Generation) апликације

---

## 📚 Лекције

| # | Лекција | Опис | Време |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry интеграција](microsoft-foundry-integration.md) | GA пакет, локални до cloud workflow hosted-agenta и евалуације | 60 мин |
| 2 | [Водич за AI агенте](agents.md) | Постављање интелигентних агената уз помоћ алата | 45 мин |
| 3 | [Постављање AI модела](ai-model-deployment.md) | Постављање и конфигурисање AI модела | 30 мин |
| 4 | [AI радионица и лабораторија](ai-workshop-lab.md) | Практично: Истражите шаблон и планирајте конверзију | 2-3 сата |

---

## 🚀 Брзи почетак

Изаберите једну опцију у новом празном директоријуму. Трајлинг `.` иницијализује текући директоријум; иначе AZD може да направи поддиректоријум без промене радног директоријума вашег терминала.

За **GA hosted-agent putanja за постављање кода**, започните са [вођеним поступком](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Потребан је AZD 1.37.0+, актуелни uv, Python 3.13+, Foundry дозволе и квота модела. Потпуни шаблони апликација испод су алтернативе, а не предуслов за тај поступак.

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

| Шаблон | Опис | Услуге |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG чат са изворима | OpenAI + AI претраживач |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI агент са алатима | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Основни AI чат | OpenAI + Container Apps |

---

## 💰 Свесност о трошковима

Ово су илустративни опсези, не понуде или лимити; саобраћај модела, SKU-ови претраживања/рачунарства, регион и опциoналне функције могу их прећи. Прегледајте актуелне цене изабраног узорка пре него што започнете постављање.

| Средина | Процењени месечни трошак |
|-------------|----------------------|
| Развој | $80-150 |
| Продукцијa | $150-300 |
| Производња | $300-3,500+ |

**Чишћење:** Прегледајте `azd down` пре потврде: за новостворени Foundry пројекат брише resource group и све у њој. За поново коришћени Foundry пројекат, оставља пројекат и ресурсе агента на месту; пратите [препоруке за чишћење у упутству](microsoft-foundry-integration.md#7-clean-up-deliberately) да одвојено уклоните непожељне ресурсе.

---

## 🔗 Навигација

| Смерац | Поглавље |
|-----------|---------|
| **Претходно** | [Поглавље 1: Основа](../chapter-01-foundation/README.md) |
| **Следеће** | [Поглавље 3: Конфигурација](../chapter-03-configuration/README.md) |
| **Прескочи на** | [Поглавље 8: Производни обрасци](../chapter-08-production/README.md) |

---

## 📖 Повезани ресурси

- [Решавање проблема са AI-јем](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Производне AI праксе](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->