<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6c3d0f9ef66c2cd692a55a2811d9c3e5",
  "translation_date": "2025-09-15T15:32:58+00:00",
  "source_file": "README.md",
  "language_code": "bg"
}
-->
# AZD За Начинаещи

![AZD-за-начинаещи](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.bg.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

Следвайте тези стъпки, за да започнете да използвате тези ресурси:
1. **Направете Fork на хранилището**: Кликнете [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонирайте хранилището**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Присъединете се към Azure Discord общностите и се свържете с експерти и други разработчици**](https://discord.com/invite/ByRwuEEgH4)

### Поддръжка на много езици

#### Поддържано чрез GitHub Action (Автоматизирано и винаги актуално)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](./README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**Ако желаете да бъдат добавени допълнителни езици, списъкът с поддържани езици е наличен [тук](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Въведение

Добре дошли в изчерпателното ръководство за Azure Developer CLI (azd). Това хранилище е създадено, за да помогне на разработчици от всички нива - от студенти до професионалисти - да научат и овладеят Azure Developer CLI за ефективни облачни внедрения, **с особен акцент върху внедряването на AI приложения с помощта на Azure AI Foundry**. Този структуриран учебен ресурс предоставя практически опит с внедрявания в Azure, решаване на често срещани проблеми и прилагане на най-добрите практики за успешни внедрения на AZD шаблони.

### **Защо това ръководство е важно за AI разработчици**
Според последната анкета в Azure AI Foundry Discord общността, **45% от разработчиците се интересуват от използването на AZD за AI работни натоварвания**, но срещат трудности с:
- Сложни AI архитектури с множество услуги
- Най-добри практики за внедряване на AI в продукция
- Интеграция и конфигурация на Azure AI услуги
- Оптимизация на разходите за AI работни натоварвания
- Решаване на специфични за AI проблеми при внедряване

## Цели на обучението

Работейки с това хранилище, ще:
- Овладеете основите и основните концепции на Azure Developer CLI
- Научите как да внедрявате и осигурявате ресурси в Azure с помощта на Infrastructure as Code
- Развиете умения за решаване на често срещани проблеми при внедряване с AZD
- Разберете предварителната проверка преди внедряване и планиране на капацитета
- Прилагате най-добрите практики за сигурност и оптимизация на разходите
- Станете уверени в внедряването на приложения, готови за продукция, в Azure

## Резултати от обучението

След завършване на курса ще можете:
- Успешно да инсталирате, конфигурирате и използвате Azure Developer CLI
- Да създавате и внедрявате приложения с помощта на AZD шаблони
- Да решавате проблеми с автентикация, инфраструктура и внедряване
- Да извършвате проверки преди внедряване, включително планиране на капацитета и избор на SKU
- Да прилагате най-добрите практики за мониторинг, сигурност и управление на разходите
- Да интегрирате AZD работни потоци в CI/CD пайплайни

## Съдържание

- [Какво е Azure Developer CLI?](../..)
- [Бърз старт](../..)
- [Път на обучение](../..)
  - [За AI разработчици (Препоръчително начало тук!)](../..)
  - [За студенти и начинаещи](../..)
  - [За разработчици](../..)
  - [За DevOps инженери](../..)
- [Документация](../..)
  - [Първи стъпки](../..)
  - [Внедряване и осигуряване](../..)
  - [Проверки преди внедряване](../..)
  - [AI и Azure AI Foundry](../..)
  - [Решаване на проблеми](../..)
- [Примери и шаблони](../..)
  - [Препоръчани: Шаблони за Azure AI Foundry](../..)
  - [Препоръчани: E2E сценарии за Azure AI Foundry](../..)
  - [Допълнителни AZD шаблони](../..)
  - [Практически лаборатории и работилници](../..)
- [Ресурси](../..)
- [Принос](../..)
- [Поддръжка](../..)
- [Общност](../..)

## Какво е Azure Developer CLI?

Azure Developer CLI (azd) е команден интерфейс, ориентиран към разработчици, който ускорява процеса на създаване и внедряване на приложения в Azure. Той предоставя:

- **Внедряване на базата на шаблони** - Използвайте предварително изградени шаблони за често срещани модели на приложения
- **Infrastructure as Code** - Управлявайте ресурси в Azure с помощта на Bicep или Terraform
- **Интегрирани работни потоци** - Безпроблемно осигуряване, внедряване и мониторинг на приложения
- **Ориентиран към разработчици** - Оптимизиран за продуктивност и опит на разработчиците

### **AZD + Azure AI Foundry: Идеален за AI внедрения**

**Защо AZD за AI решения?** AZD адресира основните предизвикателства, пред които са изправени AI разработчиците:

- **Шаблони, готови за AI** - Предварително конфигурирани шаблони за Azure OpenAI, Cognitive Services и ML работни натоварвания
- **Сигурни AI внедрения** - Вградени модели за сигурност за AI услуги, API ключове и крайни точки на модели
- **Модели за AI в продукция** - Най-добри практики за мащабируеми и икономически ефективни AI внедрения
- **Крайни AI работни потоци** - От разработка на модели до внедряване в продукция с подходящ мониторинг
- **Оптимизация на разходите** - Умно разпределение на ресурси и стратегии за мащабиране за AI работни натоварвания
- **Интеграция с Azure AI Foundry** - Безпроблемна връзка с каталога на модели и крайните точки на AI Foundry

## Бърз старт

### Предварителни изисквания
- Абонамент за Azure
- Инсталиран Azure CLI
- Git (за клониране на шаблони)

### Инсталация
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Вашето първо внедряване
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### Вашето първо AI внедряване
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## Път на обучение

### За AI разработчици (Препоръчително начало тук!)
1. **Бърз старт**: Опитайте [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) шаблон
2. **Научете основите**: [AZD Основи](docs/getting-started/azd-basics.md) + [Интеграция с Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **Практически опит**: Завършете [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md)
4. **Готовност за продукция**: Прегледайте [Най-добри практики за AI в продукция](docs/ai-foundry/production-ai-practices.md)
5. **Напреднали**: Внедрете [contoso-chat](https://github.com/Azure-Samples/contoso-chat) корпоративен шаблон

### За студенти и начинаещи
1. Започнете с [AZD Основи](docs/getting-started/azd-basics.md)
2. Следвайте [Ръководството за инсталация](docs/getting-started/installation.md)
3. Завършете [Вашият първи проект](docs/getting-started/first-project.md)
4. Практикувайте с [Пример за проста уеб апликация](../../examples/simple-web-app)

### За разработчици
1. Прегледайте [Ръководство за конфигурация](docs/getting-started/configuration.md)
2. Изучете [Ръководство за внедряване](docs/deployment/deployment-guide.md)
3. Работете с [Пример за приложение с база данни](../../examples/database-app)
4. Разгледайте [Пример за контейнерно приложение](../../examples/container-app)

### За DevOps инженери
1. Овладейте [Осигуряване на ресурси](docs/deployment/provisioning.md)
2. Прилагайте [Проверки преди внедряване](docs/pre-deployment/preflight-checks.md)
3. Практикувайте [Планиране на капацитета](docs/pre-deployment/capacity-planning.md)
4. Напреднали [Пример за микросервиси](../../examples/microservices)

## Документация

### Първи стъпки
- [**AZD Основи**](docs/getting-started/azd-basics.md) - Основни концепции и терминология
- [**Инсталация и настройка**](docs/getting-started/installation.md) - Ръководства за инсталация според платформата
- [**Конфигурация**](docs/getting-started/configuration.md) - Настройка на среда и автентикация
- [**Вашият първи проект**](docs/getting-started/first-project.md) - Стъпка по стъпка ръководство

### Внедряване и осигуряване
- [**Ръководство за внедряване**](docs/deployment/deployment-guide.md) - Пълни работни потоци за внедряване
- [**Осигуряване на ресурси**](docs/deployment/provisioning.md) - Управление на ресурси в Azure

### Проверки преди внедряване
- [**Планиране на капацитета**](docs/pre-deployment/capacity-planning.md) - Валидация на капацитета на ресурси в Azure
- [**Избор на SKU**](docs/pre-deployment/sku-selection.md) - Избор на подходящи SKU за Azure
- [**Проверки преди внедряване**](docs/pre-deployment/preflight-checks.md) - Автоматизирани скриптове за валидация

### AI и Azure AI Foundry
- [**Интеграция с Azure AI Foundry**](docs/ai-foundry/azure-ai-foundry-integration.md) - Свързване на AZD с услугите на Azure AI Foundry
- [**Модели за внедряване на AI**](docs/ai-foundry/ai-model-deployment.md) - Внедряване и управление на AI модели с AZD
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Практическа лаборатория: Подготовка на AI решения за AZD
- [**Най-добри практики за AI в продукция**](docs/ai-foundry/production-ai-practices.md) - Сигурност, мащабиране и мониторинг за AI работни натоварвания

### Решаване на проблеми
- [**Често срещани проблеми**](docs/troubleshooting/common-issues.md) - Често срещани проблеми и решения
- [**Ръководство за отстраняване на грешки**](docs/troubleshooting/debugging.md) - Стратегии за отстраняване на грешки стъпка по стъпка  
- [**AI-специфично отстраняване на грешки**](docs/troubleshooting/ai-troubleshooting.md) - Проблеми с AI услуги и внедряване на модели  

## Примери и шаблони  

### [Препоръчано: Шаблони на Azure AI Foundry](https://ai.azure.com/resource/build/templates)  
**Започнете тук, ако внедрявате AI приложения!**  

| Шаблон | Описание | Сложност | Услуги |  
|----------|-------------|------------|----------|  
| [**Започнете с AI чат**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Създайте и внедрете основно чат приложение, интегрирано с вашите данни и телеметрични прозрения, използвайки Azure Container Apps |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**Започнете с AI агенти**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Създайте и внедрете основно приложение за агенти с действия и телеметрични прозрения, използвайки Azure Container Apps. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**Автоматизация на работни процеси с множество агенти**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Подобрете планирането на задачи и автоматизацията чрез оркестриране и управление на група AI агенти.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Генериране на документи от вашите данни**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Ускорете създаването на документи като договори, фактури и инвестиционни предложения, като намерите и обобщите релевантна информация от вашите данни. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**Подобрете клиентските срещи с агенти**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Мигрирайте наследствен код към модерни езици, използвайки екип от агенти. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**Модернизирайте вашия код с агенти**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Създайте и внедрете основно чат приложение, интегрирано с вашите данни и телеметрични прозрения, използвайки Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Създайте вашия разговорен агент**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Използвайте усъвършенствано разбиране на разговори, за да създадете и подобрите чатботове и агенти с детерминистични и контролируеми от човека работни процеси. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**Отключете прозрения от разговорни данни**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Подобрете ефективността на контактния център, като откриете прозрения от големи аудио и текстови набори данни, използвайки усъвършенствани възможности за разбиране на съдържание. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**Мултимодална обработка на съдържание**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Обработвайте искове, фактури, договори и други документи бързо и точно, като извличате информация от неструктурирано съдържание и я преобразувате в структурирана форма. Този шаблон поддържа текст, изображения, таблици и графики. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### Препоръчано: Azure AI Foundry E2E сценарии  
**Започнете тук, ако внедрявате AI приложения!**  

| Шаблон | Описание | Сложност | Услуги |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Прост интерфейс за чат с Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-активирано чат приложение с Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Анализ на документи с AI услуги | ⭐⭐ | Azure Document Intelligence + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | AI агентна рамка с извикване на функции | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Корпоративен чат с AI оркестрация | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |  

### Допълнителни AZD шаблони  
- [**Директория с примери**](examples/README.md) - Практически примери, шаблони и реални сценарии  
- [**Azure-Samples AZD шаблони**](https://github.com/Azure-Samples/azd-templates) - Официални примерни шаблони на Microsoft  
- [**Галерия Awesome AZD**](https://azure.github.io/awesome-azd/) - Шаблони, създадени от общността  

### Практически лаборатории и работилници  
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - **НОВО**: Направете вашите AI решения готови за AZD внедряване  
- [**AZD за начинаещи работилница**](workshop/README.md) - Фокус върху внедряването на шаблони за AI агенти с AZD  

## Ресурси  

### Бързи справки  
- [**Команден лист**](resources/cheat-sheet.md) - Основни azd команди  
- [**Речник**](resources/glossary.md) - Терминология на Azure и azd  
- [**Често задавани въпроси**](resources/faq.md) - Често задавани въпроси  
- [**Ръководство за обучение**](resources/study-guide.md) - Обширни учебни цели и практически упражнения  

### Външни ресурси  
- [Документация за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Център за архитектура на Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Калкулатор за ценообразуване на Azure](https://azure.microsoft.com/pricing/calculator/)  
- [Статус на Azure](https://status.azure.com/)  

## Принос  

Приветстваме приноси! Моля, прочетете нашето [Ръководство за принос](CONTRIBUTING.md) за подробности относно:  
- Как да подавате проблеми и заявки за функции  
- Насоки за принос към кода  
- Подобрения в документацията  
- Стандарти на общността  

## Поддръжка  

- **Проблеми**: [Докладвайте за грешки и поискайте функции](https://github.com/microsoft/azd-for-beginners/issues)  
- **Дискусии**: [Общност на Microsoft Azure в Discord - Q&A и дискусии](https://discord.gg/microsoft-azure)  
- **AI-специфична поддръжка**: Присъединете се към [#Azure канала](https://discord.gg/microsoft-azure) за дискусии относно AZD + AI Foundry  
- **Имейл**: За лични запитвания  
- **Microsoft Learn**: [Официална документация за Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Прозрения от общността в Discord на Azure AI Foundry  

**Резултати от анкета в #Azure канала:**  
- **45%** от разработчиците искат да използват AZD за AI работни натоварвания  
- **Основни предизвикателства**: Внедряване на множество услуги, управление на идентификационни данни, готовност за производство  
- **Най-много искания**: AI-специфични шаблони, ръководства за отстраняване на грешки, добри практики  

**Присъединете се към нашата общност, за да:**  
- Споделите вашия опит с AZD + AI и да получите помощ  
- Достъп до ранни версии на нови AI шаблони  
- Принос към добри практики за внедряване на AI  
- Влияние върху бъдещото развитие на функции за AI + AZD  

## Лиценз  

Този проект е лицензиран под MIT License - вижте файла [LICENSE](../../LICENSE) за подробности.  

## Други курсове  

Нашият екип създава и други курсове! Вижте:  

- [**НОВО** Протокол за контекст на модела (MCP) за начинаещи](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI агенти за начинаещи](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Генеративен AI за начинаещи с .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Генеративен AI за начинаещи](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Генеративен AI за начинаещи с Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML за начинаещи](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Наука за данни за начинаещи](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI за начинаещи](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Киберсигурност за начинаещи](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Уеб разработка за начинаещи](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT за начинаещи](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [XR разработка за начинаещи](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Овладяване на GitHub Copilot за AI програмиране в двойка](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Овладяване на GitHub Copilot за C#/.NET разработчици](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Изберете своето собствено приключение с Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**Навигация**  
- **Следващ урок**: [Основи на AZD](docs/getting-started/azd-basics.md)  

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Не носим отговорност за недоразумения или погрешни интерпретации, произтичащи от използването на този превод.