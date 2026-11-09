# 7. Закључак и следећи кораци

!!! tip "ГЛАВНЕ ПОУКЕ СУ"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Шта сте постигли

Честитамо! На овом радионици сте успешно:

| Модул | Постигао сте |
|:---|:---|
| **Модул 1** | Упознали сте Azure Developer CLI и одабрали AI шаблон |
| **Модул 2** | Деплојовали и проверили комплетно решење за AI агенте |
| **Модул 3** | Разложили шаблон да бисте разумели његову архитектуру |
| **Модул 4** | Истражили сте `azure.yaml` конфигурацију и животни циклус |
| **Модул 5** | Прилагодили сте шаблон за свој сценарио |
| **Модул 6** | Безбедно сте уклонили инфраструктуру и управљали ресурсима |

---

## 2. Кључни појмови које сте савладали

### Azure Developer CLI (azd)
- `azd init` - Иницијализација пројеката из шаблона
- `azd up` - Постављање и деплој у једној команди
- `azd env` - Управљање променљивима окружења
- `azd down` - Безбедно чишћење ресурса

### Структура AZD шаблона
- `azure.yaml` - Конфигурација и хук функције за деплој
- `infra/` - Bicep инфраструктура као код
- `src/` - Изворни код апликације
- `scripts/` - Скрипте за аутоматизацију и подешавање

### Могућности Microsoft Foundry-а
- AI агент сервис за интелигентне помоћнике
- Трагање у фајловима и Azure AI претрага за проналажење знања
- Уграђено праћење, мониторинг и евалуација
- Red teaming за валидацију безбедности AI

---

## 3. Наставите своје учење

### Препоручени следећи кораци

| Пут | Ресурс | Време |
|:---|:---|:---|
| **Комплетан курс** | [AZD for Beginners Curriculum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Самостално |
| **Испробајте други шаблон** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 сата |
| **Дубинско проучавање** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Континуирано |
| **Заједница** | [Azure Discord](https://aka.ms/foundry/discord) | Придружите се данас! |

### Предложени шаблони за испробавање

1. **[Започните са AI Четом](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Основни разговор са вашим подацима
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Напредни RAG шаблони
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Пословни сценарији у трговини

---

## 4. Изазови радионице

Спремни да тестирате своје вештине? Испробајте ове изазове:

| Изазов | Опис | Тежина |
|:---|:---|:---|
| **1. Сценарио са више агената** | Деплојујте и прилагодите за другу индустрију (нпр. здравство, финансије) | ⭐⭐ |
| **2. Прилагођена база знања** | Додајте своје датотеке и направите прилагођени индекс претраге | ⭐⭐⭐ |
| **3. Продукцијски деплој** | Подесите CI/CD са GitHub Actions користећи `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Поделите своје мишљење

Ваше мишљење нам помаже да побољшамо ову радионицу!

- **GitHub Issues**: [Поставите повратну информацију](https://github.com/microsoft/azd-for-beginners/issues) - означите са `Workshop`
- **Discord**: Придружите се [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - објавите у `#get-help`
- **Доприноси**: Помозите у побољшању радионице слањем pull захтева!

---

## Хвала вам! 🎉

Хвала вам што сте завршили радионицу AZD for AI Developers. Надамо се да вас је ово искуство опремило вештинама и самопоуздањем за изградњу и деплој AI апликација на Azure.

**Наставите да развијате, наставите да учите и добродошли у Azure AI заједницу програмера!**

---

| | |
|:---|:---|
| **📚 Почетна страница курса** | [AZD For Beginners](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Документација** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI шаблони** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Заједница** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->