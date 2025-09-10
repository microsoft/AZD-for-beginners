<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-10T05:38:05+00:00",
  "source_file": "README.md",
  "language_code": "sr"
}
-->
# AZD За Почетнике

![AZD-za-pocetnike](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sr.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

Следите ове кораке да бисте започели коришћење ових ресурса:  
1. **Fork-ујте репозиторијум**: Кликните [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Клонирајте репозиторијум**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Придружите се Azure Discord заједницама и упознајте стручњаке и друге програмере**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 Подршка за више језика

#### Подржано преко GitHub Action (Аутоматски и увек ажурирано)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](./README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**Ако желите да се додају додатни језици, подржани језици су наведени [овде](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## Увод

Добродошли у свеобухватни водич за Azure Developer CLI (azd). Овај репозиторијум је осмишљен да помогне програмерима свих нивоа, од студената до професионалаца, да науче и савладају Azure Developer CLI за ефикасно коришћење облака. Овај структурирани ресурс за учење пружа практично искуство са Azure cloud деплојментима, решавањем уобичајених проблема и применом најбољих пракси за успешне AZD шаблоне.

## Циљеви учења

Радећи кроз овај репозиторијум, научићете:  
- Основе и кључне концепте Azure Developer CLI  
- Како да деплојујете и обезбедите Azure ресурсе користећи Infrastructure as Code  
- Вештине решавања проблема у AZD деплојментима  
- Провере пре деплојмента и планирање капацитета  
- Примена најбољих пракси за безбедност и оптимизацију трошкова  
- Стицање самопоуздања у деплојменту апликација спремних за продукцију на Azure  

## Резултати учења

Након завршетка курса, бићете у могућности да:  
- Успешно инсталирате, конфигуришете и користите Azure Developer CLI  
- Креирате и деплојујете апликације користећи AZD шаблоне  
- Решавате проблеме са аутентификацијом, инфраструктуром и деплојментом  
- Извршите провере пре деплојмента, укључујући планирање капацитета и избор SKU-а  
- Примените најбоље праксе за мониторинг, безбедност и управљање трошковима  
- Интегришете AZD токове рада у CI/CD процесе  

## Садржај

- [Шта је Azure Developer CLI?](../..)  
- [Брзи почетак](../..)  
- [Документација](../..)  
- [Примери и шаблони](../..)  
- [Ресурси](../..)  
- [Доприноси](../..)  

## Шта је Azure Developer CLI?

Azure Developer CLI (azd) је командна линија усмерена на програмере која убрзава процес изградње и деплојмента апликација на Azure. Пружа:  

- **Деплојменте засноване на шаблонима** - Користите унапред направљене шаблоне за уобичајене апликационе обрасце  
- **Infrastructure as Code** - Управљајте Azure ресурсима користећи Bicep или Terraform  
- **Интегрисане токове рада** - Лако обезбеђујте, деплојујте и мониторишите апликације  
- **Прилагођено програмерима** - Оптимизовано за продуктивност и искуство програмера  

## Брзи почетак

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

### Ваш први деплојмент  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

## Документација

### Почетак  
- [**Основе AZD**](docs/getting-started/azd-basics.md) - Кључни концепти и терминологија  
- [**Инсталација и подешавање**](docs/getting-started/installation.md) - Водичи за инсталацију по платформама  
- [**Конфигурација**](docs/getting-started/configuration.md) - Подешавање окружења и аутентификација  
- [**Ваш први пројекат**](docs/getting-started/first-project.md) - Водич корак по корак  

### Деплојмент и обезбеђивање  
- [**Водич за деплојмент**](docs/deployment/deployment-guide.md) - Комплетни токови деплојмента  
- [**Обезбеђивање ресурса**](docs/deployment/provisioning.md) - Управљање Azure ресурсима  

### Провере пре деплојмента  
- [**Планирање капацитета**](docs/pre-deployment/capacity-planning.md) - Валидација капацитета Azure ресурса  
- [**Избор SKU-а**](docs/pre-deployment/sku-selection.md) - Избор одговарајућих Azure SKU-ова  
- [**Провере пре деплојмента**](docs/pre-deployment/preflight-checks.md) - Аутоматизовани скриптови за валидацију  

### Решавање проблема  
- [**Уобичајени проблеми**](docs/troubleshooting/common-issues.md) - Често сусретани проблеми и решења  
- [**Водич за дебаговање**](docs/troubleshooting/debugging.md) - Стратегије дебаговања корак по корак  

## Примери и шаблони

### Почетни шаблони  
- [**Једноставна веб апликација**](../../examples/simple-web-app) - Основни деплојмент Node.js веб апликације  
- [**Статички веб сајт**](../../examples/static-website) - Хостовање статичког сајта на Azure Storage  
- [**Апликација у контејнеру**](../../examples/container-app) - Деплојмент апликације у контејнеру  
- [**Апликација са базом података**](../../examples/database-app) - Веб апликација са интеграцијом базе података  

### Напредни сценарији  
- [**Микросервисна архитектура**](../../examples/microservices) - Апликација са више сервиса  
- [**Серверлес функције**](../../examples/serverless-function) - Деплојмент Azure Functions  
- [**Примери конфигурација**](../../examples/configurations) - Поново употребљиви обрасци конфигурације  

## Ресурси

### Брзе референце  
- [**Листa команди**](resources/cheat-sheet.md) - Основне azd команде  
- [**Речник**](resources/glossary.md) - Терминологија Azure и azd  
- [**Често постављана питања**](resources/faq.md) - Одговори на уобичајена питања  
- [**Водич за учење**](resources/study-guide.md) - Циљеви учења и вежбе  

### Спољни ресурси  
- [Документација Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)  
- [Azure Status](https://status.azure.com/)  

## Пут учења

### За студенте и почетнике  
1. Почните са [Основама AZD](docs/getting-started/azd-basics.md)  
2. Пратите [Водич за инсталацију](docs/getting-started/installation.md)  
3. Завршите [Ваш први пројекат](docs/getting-started/first-project.md)  
4. Вежбајте са [Примером једноставне веб апликације](../../examples/simple-web-app)  

### За програмере  
1. Прегледајте [Водич за конфигурацију](docs/getting-started/configuration.md)  
2. Проучите [Водич за деплојмент](docs/deployment/deployment-guide.md)  
3. Радите на [Примеру апликације са базом података](../../examples/database-app)  
4. Истражите [Пример апликације у контејнеру](../../examples/container-app)  

### За DevOps инжењере  
1. Савладајте [Обезбеђивање ресурса](docs/deployment/provisioning.md)  
2. Примените [Провере пре деплојмента](docs/pre-deployment/preflight-checks.md)  
3. Вежбајте [Планирање капацитета](docs/pre-deployment/capacity-planning.md)  
4. Напредни [Пример микросервиса](../../examples/microservices)  

## Доприноси

Поздрављамо доприносе! Молимо вас да прочитате наш [Водич за доприносе](CONTRIBUTING.md) за детаље о:  
- Како пријавити проблеме и затражити функције  
- Водич за допринос коду  
- Побољшања документације  
- Стандарди заједнице  

## Подршка

- **Проблеми**: [Пријавите грешке и затражите функције](https://github.com/microsoft/azd-for-beginners/issues)  
- **Дискусије**: [Microsoft Azure Discord заједница за Q&A и дискусије](https://discord.gg/microsoft-azure)  
- **Е-пошта**: За приватне упите  
- **Microsoft Learn**: [Званична документација Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## Лиценца

Овај пројекат је лиценциран под MIT лиценцом - погледајте [LICENSE](../../LICENSE) за детаље.  

## 🎒 Остали курсеви

Наш тим производи и друге курсеве! Погледајте:  

- [**НОВО** Model Context Protocol (MCP) За Почетнике](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Агенти за Почетнике](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Генеративна AI за Почетнике користећи .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Генеративна AI за Почетнике](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Генеративна AI за Почетнике користећи Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML за Почетнике](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Наука о подацима за Почетнике](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI за Почетнике](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Сајбер безбедност за Почетнике](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Веб развој за почетнике](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [Интернет ствари (IoT) за почетнике](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR развој за почетнике](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Усавршавање GitHub Copilot-а за парно програмирање са вештачком интелигенцијом](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Усавршавање GitHub Copilot-а за C#/.NET програмере](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Изаберите своју Copilot авантуру](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Навигација**
- **Следећи час**: [Основе AZD](docs/getting-started/azd-basics.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације, препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.