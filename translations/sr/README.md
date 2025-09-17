<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6c3d0f9ef66c2cd692a55a2811d9c3e5",
  "translation_date": "2025-09-15T15:34:29+00:00",
  "source_file": "README.md",
  "language_code": "sr"
}
-->
# AZD За Почетнике

![AZD-za-pocetnike](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sr.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

Следите ове кораке да бисте започели коришћење ових ресурса:
1. **Fork-ујте Репозиторијум**: Кликните [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Клонирајте Репозиторијум**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Придружите се Azure Discord заједницама и упознајте стручњаке и друге програмере**](https://discord.com/invite/ByRwuEEgH4)

### Подршка за више језика

#### Подржано преко GitHub Action (Аутоматски и увек ажурирано)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](./README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**Ако желите да се додају додатни језици, подржани језици су наведени [овде](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Увод

Добродошли у свеобухватни водич за Azure Developer CLI (azd). Овај репозиторијум је осмишљен да помогне програмерима свих нивоа, од студената до професионалних програмера, да науче и савладају Azure Developer CLI за ефикасно постављање у облак, **са посебним фокусом на постављање AI апликација користећи Azure AI Foundry**. Овај структурирани ресурс за учење пружа практично искуство са Azure cloud постављањем, решавањем уобичајених проблема и применом најбољих пракси за успешне AZD шаблоне.

### **Зашто је овај водич важан за AI програмере**
На основу недавне анкете Azure AI Foundry Discord заједнице, **45% програмера је заинтересовано за коришћење AZD за AI радне задатке**, али се суочавају са изазовима као што су:
- Комплексне AI архитектуре са више услуга
- Најбоље праксе за постављање AI у продукцију
- Интеграција и конфигурација Azure AI услуга
- Оптимизација трошкова за AI радне задатке
- Решавање проблема специфичних за AI постављање

## Циљеви учења

Радећи кроз овај репозиторијум, научићете:
- Основе и кључне концепте Azure Developer CLI
- Како поставити и обезбедити Azure ресурсе користећи Infrastructure as Code
- Вештине решавања проблема за уобичајене AZD проблеме
- Валидацију пре постављања и планирање капацитета
- Примена најбољих пракси за безбедност и оптимизацију трошкова
- Стицање самопоуздања у постављању апликација спремних за продукцију на Azure

## Резултати учења

Након завршетка овог курса, моћи ћете:
- Успешно инсталирати, конфигурисати и користити Azure Developer CLI
- Креирати и поставити апликације користећи AZD шаблоне
- Решавати проблеме са аутентификацијом, инфраструктуром и постављањем
- Извршити провере пре постављања, укључујући планирање капацитета и избор SKU-а
- Применити најбоље праксе за мониторинг, безбедност и управљање трошковима
- Интегрисати AZD токове рада у CI/CD процесе

## Садржај

- [Шта је Azure Developer CLI?](../..)
- [Брзи Почетак](../..)
- [Пут Учења](../..)
  - [За AI Програмере (Препоручени Почетак!)](../..)
  - [За Студенте и Почетнике](../..)
  - [За Програмере](../..)
  - [За DevOps Инжењере](../..)
- [Документација](../..)
  - [Почетак](../..)
  - [Постављање и Обезбеђивање](../..)
  - [Провере Пре Постављања](../..)
  - [AI и Azure AI Foundry](../..)
  - [Решавање Проблема](../..)
- [Примери и Шаблони](../..)
  - [Истакнуто: Azure AI Foundry Шаблони](../..)
  - [Истакнуто: Azure AI Foundry E2E Сценарији](../..)
  - [Додатни AZD Шаблони](../..)
  - [Практичне Радионице](../..)
- [Ресурси](../..)
- [Допринос](../..)
- [Подршка](../..)
- [Заједница](../..)

## Шта је Azure Developer CLI?

Azure Developer CLI (azd) је командна линија усмерена на програмере која убрзава процес креирања и постављања апликација на Azure. Пружа:

- **Постављање на основу шаблона** - Користите унапред припремљене шаблоне за уобичајене обрасце апликација
- **Infrastructure as Code** - Управљање Azure ресурсима користећи Bicep или Terraform
- **Интегрисани токови рада** - Беспрекорно обезбеђивање, постављање и праћење апликација
- **Прилагођено програмерима** - Оптимизовано за продуктивност и искуство програмера

### **AZD + Azure AI Foundry: Савршено за AI Постављања**

**Зашто AZD за AI решења?** AZD решава главне изазове са којима се суочавају AI програмери:

- **Шаблони спремни за AI** - Унапред конфигурисани шаблони за Azure OpenAI, Cognitive Services и ML радне задатке
- **Безбедна AI Постављања** - Уграђени безбедносни обрасци за AI услуге, API кључеве и моделе
- **Обрасци за AI у Продукцији** - Најбоље праксе за скалабилна и економична AI постављања
- **Крај-до-крај AI Токови** - Од развоја модела до продукције са правилним мониторингом
- **Оптимизација Трошкова** - Паметне стратегије за алокацију ресурса и скалирање AI радних задатака
- **Интеграција са Azure AI Foundry** - Беспрекорна веза са каталогом модела и крајњим тачкама AI Foundry

## Брзи Почетак

### Предуслови
- Azure претплата
- Инсталиран Azure CLI
- Git (за клонирање шаблона)

### Инсталација
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Ваше Прво Постављање
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### Ваше Прво AI Постављање
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

## Пут Учења

### За AI Програмере (Препоручени Почетак!)
1. **Брзи Почетак**: Пробајте [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) шаблон
2. **Научите Основе**: [AZD Основе](docs/getting-started/azd-basics.md) + [Интеграција са Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **Практична Вежба**: Завршите [AI Радионицу](docs/ai-foundry/ai-workshop-lab.md)
4. **Спремно за Продукцију**: Прегледајте [Најбоље Праксе за AI у Продукцији](docs/ai-foundry/production-ai-practices.md)
5. **Напредно**: Поставите [contoso-chat](https://github.com/Azure-Samples/contoso-chat) шаблон за предузећа

### За Студенте и Почетнике
1. Почните са [AZD Основама](docs/getting-started/azd-basics.md)
2. Пратите [Водич за Инсталацију](docs/getting-started/installation.md)
3. Завршите [Ваш Први Пројекат](docs/getting-started/first-project.md)
4. Вежбајте са [Примером Једноставне Веб Апликације](../../examples/simple-web-app)

### За Програмере
1. Прегледајте [Водич за Конфигурацију](docs/getting-started/configuration.md)
2. Проучите [Водич за Постављање](docs/deployment/deployment-guide.md)
3. Радите на [Примеру Апликације са Базом Података](../../examples/database-app)
4. Истражите [Пример Апликације у Контејнеру](../../examples/container-app)

### За DevOps Инжењере
1. Савладајте [Обезбеђивање Ресурса](docs/deployment/provisioning.md)
2. Примените [Провере Пре Постављања](docs/pre-deployment/preflight-checks.md)
3. Вежбајте [Планирање Капацитета](docs/pre-deployment/capacity-planning.md)
4. Напредни [Пример Микросервиса](../../examples/microservices)

## Документација

### Почетак
- [**AZD Основе**](docs/getting-started/azd-basics.md) - Основни концепти и терминологија
- [**Инсталација и Подешавање**](docs/getting-started/installation.md) - Водичи за инсталацију специфични за платформу
- [**Конфигурација**](docs/getting-started/configuration.md) - Подешавање окружења и аутентификација
- [**Ваш Први Пројекат**](docs/getting-started/first-project.md) - Водич корак по корак

### Постављање и Обезбеђивање
- [**Водич за Постављање**](docs/deployment/deployment-guide.md) - Комплетни токови постављања
- [**Обезбеђивање Ресурса**](docs/deployment/provisioning.md) - Управљање Azure ресурсима

### Провере Пре Постављања
- [**Планирање Капацитета**](docs/pre-deployment/capacity-planning.md) - Валидација капацитета Azure ресурса
- [**Избор SKU-а**](docs/pre-deployment/sku-selection.md) - Избор одговарајућих Azure SKU-ова
- [**Провере Пре Лета**](docs/pre-deployment/preflight-checks.md) - Аутоматизовани скриптови за валидацију

### AI и Azure AI Foundry
- [**Интеграција са Azure AI Foundry**](docs/ai-foundry/azure-ai-foundry-integration.md) - Повезивање AZD са Azure AI Foundry услугама
- [**Обрасци за Постављање AI Модела**](docs/ai-foundry/ai-model-deployment.md) - Постављање и управљање AI моделима са AZD
- [**AI Радионица**](docs/ai-foundry/ai-workshop-lab.md) - Практична радионица: Припрема AI решења за AZD
- [**Најбоље Праксе за AI у Продукцији**](docs/ai-foundry/production-ai-practices.md) - Безбедност, скалирање и мониторинг за AI радне задатке

### Решавање Проблема
- [**Уобичајени Проблеми**](docs/troubleshooting/common-issues.md) - Најчешћи проблеми и решења
- [**Водич за отклањање грешака**](docs/troubleshooting/debugging.md) - Стратегије за отклањање грешака корак по корак  
- [**Отклањање грешака специфичних за AI**](docs/troubleshooting/ai-troubleshooting.md) - Проблеми са AI услугама и постављањем модела  

## Примери и шаблони  

### [Истакнуто: Azure AI Foundry шаблони](https://ai.azure.com/resource/build/templates)  
**Почните овде ако постављате AI апликације!**  

| Шаблон | Опис | Комплексност | Услуге |  
|----------|-------------|------------|----------|  
| [**Почните са AI четом**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Направите и поставите основну чет апликацију интегрисану са вашим подацима и увидима у телеметрију користећи Azure Container Apps |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**Почните са AI агентима**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Направите и поставите основну апликацију агента са акцијама и увидима у телеметрију користећи Azure Container Apps. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**Аутоматизација радних токова са више агената**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Побољшајте планирање задатака и аутоматизацију оркестрирањем и управљањем групом AI агената.|⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Генеришите документе из ваших података**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Убрзајте генерисање докумената као што су уговори, фактуре и инвестициони предлози проналажењем и сумирањем релевантних информација из ваших података. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**Побољшајте састанке са клијентима помоћу агената**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Мигрирајте застарели код на модерне језике уз помоћ тима агената. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**Модернизујте свој код помоћу агената**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Направите и поставите основну чет апликацију интегрисану са вашим подацима и увидима у телеметрију користећи Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**Направите свог конверзационог агента**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Искористите напредно разумевање конверзације за креирање и побољшање четботова и агената са детерминистичким и контролисаним радним токовима. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**Откључајте увиде из конверзационих података**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Побољшајте ефикасност контакт центра откривањем увида из великих аудио и текстуалних скупова података користећи напредне могућности разумевања садржаја. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**Обрада мултимодалног садржаја**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Брзо и прецизно обрадите захтеве, фактуре, уговоре и друге документе извлачењем информација из неструктурисаног садржаја и мапирањем у структуриран формат. Овај шаблон подржава текст, слике, табеле и графиконе. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### Истакнуто: Azure AI Foundry E2E сценарији  
**Почните овде ако постављате AI апликације!**  

| Шаблон | Опис | Комплексност | Услуге |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Једноставан интерфејс за чет са Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-омогућена чет апликација са Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Анализа докумената помоћу AI услуга | ⭐⭐ | Azure Document Intelligence + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | AI оквир агента са позивом функција | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Ентерпрајз чет са AI оркестрацијом | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |  

### Додатни AZD шаблони  
- [**Директоријум примера**](examples/README.md) - Практични примери, шаблони и сценарији из стварног света  
- [**Azure-Samples AZD шаблони**](https://github.com/Azure-Samples/azd-templates) - Званични Microsoft шаблони  
- [**Awesome AZD галерија**](https://azure.github.io/awesome-azd/) - Шаблони које је допринела заједница  

### Практичне лабораторије и радионице  
- [**AI радионица лабораторија**](docs/ai-foundry/ai-workshop-lab.md) - **НОВО**: Учините своја AI решења спремним за AZD  
- [**AZD радионица за почетнике**](workshop/README.md) - Фокус на постављање AI Agents AZD шаблона  

## Ресурси  

### Брзе референце  
- [**Листa команди**](resources/cheat-sheet.md) - Основне azd команде  
- [**Речник**](resources/glossary.md) - Azure и azd терминологија  
- [**Често постављана питања**](resources/faq.md) - Често постављана питања  
- [**Водич за учење**](resources/study-guide.md) - Свеобухватни циљеви учења и вежбе  

### Спољни ресурси  
- [Azure Developer CLI документација](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)  
- [Azure Status](https://status.azure.com/)  

## Доприноси  

Добродошли су доприноси! Молимо вас да прочитате наш [Водич за доприносе](CONTRIBUTING.md) за детаље о:  
- Како пријавити проблеме и затражити функције  
- Упутства за допринос коду  
- Побољшања документације  
- Стандарди заједнице  

## Подршка  

- **Проблеми**: [Пријавите грешке и затражите функције](https://github.com/microsoft/azd-for-beginners/issues)  
- **Дискусије**: [Microsoft Azure Discord заједница Q&A и дискусије](https://discord.gg/microsoft-azure)  
- **Подршка специфична за AI**: Придружите се [#Azure каналу](https://discord.gg/microsoft-azure) за AZD + AI Foundry дискусије  
- **Е-пошта**: За приватне упите  
- **Microsoft Learn**: [Званична Azure Developer CLI документација](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Увид из заједнице Azure AI Foundry Discord  

**Резултати анкете из #Azure канала:**  
- **45%** програмера жели да користи AZD за AI радне оптерећења  
- **Главни изазови**: Постављање више услуга, управљање акредитивима, спремност за производњу  
- **Највише тражено**: AI специфични шаблони, водичи за отклањање грешака, најбоље праксе  

**Придружите се нашој заједници да:**  
- Поделите своја AZD + AI искуства и добијете помоћ  
- Приступите раним прегледима нових AI шаблона  
- Допринесете најбољим праксама за постављање AI  
- Утичете на будући развој функција AI + AZD  

## Лиценца  

Овај пројекат је лиценциран под MIT лиценцом - погледајте [LICENSE](../../LICENSE) датотеку за детаље.  

## Остали курсеви  

Наш тим производи друге курсеве! Погледајте:  

- [**НОВО** Протокол контекста модела (MCP) за почетнике](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI агенти за почетнике](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Генеративни AI за почетнике користећи .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Генеративни AI за почетнике](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Генеративни AI за почетнике користећи Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML за почетнике](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Наука о подацима за почетнике](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI за почетнике](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Сајбер безбедност за почетнике](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Веб развој за почетнике](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT за почетнике](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [XR развој за почетнике](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Овладавање GitHub Copilot-ом за AI парно програмирање](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Овладавање GitHub Copilot-ом за C#/.NET програмере](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Изаберите своју авантуру са Copilot-ом](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**Навигација**  
- **Следећи час**: [AZD Основе](docs/getting-started/azd-basics.md)  

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод од стране људи. Не сносимо одговорност за било каква неспоразумевања или погрешна тумачења која могу произаћи из коришћења овог превода.