<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-18T11:32:46+00:00",
  "source_file": "README.md",
  "language_code": "sr"
}
-->
# AZD За Почетнике: Структурисано Учење

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sr.png) 

## Почетак курса

Пратите ове кораке да започнете своје AZD путовање учења:

1. **Fork Репозиторијум**: Кликните [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone Репозиторијум**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Придружите се Заједници**: [Azure Discord Заједнице](https://discord.com/invite/ByRwuEEgH4) за стручну подршку
4. **Изаберите Пут Учења**: Одаберите поглавље испод које одговара вашем нивоу искуства

### Подршка за више језика

#### Аутоматизовани Преводи (Увек Ажурирани)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](./README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## Преглед курса

Овладајте Azure Developer CLI (azd) кроз структурисана поглавља која су дизајнирана за прогресивно учење. **Посебан фокус на имплементацију AI апликација уз Azure AI Foundry интеграцију.**

### Зашто је овај курс важан за савремене програмере

На основу увида из Azure AI Foundry Discord заједнице, **45% програмера жели да користи AZD за AI радне задатке**, али се суочавају са изазовима као што су:
- Комплексне AI архитектуре са више услуга
- Најбоље праксе за имплементацију AI у продукцији  
- Интеграција и конфигурација Azure AI услуга
- Оптимизација трошкова за AI радне задатке
- Решавање проблема специфичних за AI имплементацију

### Циљеви учења

Завршетком овог структурисаног курса, научићете:
- **Овладавање AZD Основама**: Основни концепти, инсталација и конфигурација
- **Имплементација AI Апликација**: Коришћење AZD са Azure AI Foundry услугама
- **Примена Инфраструктуре као Кода**: Управљање Azure ресурсима уз Bicep шаблоне
- **Решавање Проблема Имплементације**: Решавање уобичајених проблема и дебаговање
- **Оптимизација за Продукцију**: Безбедност, скалирање, мониторинг и управљање трошковима
- **Изградња Решeња са Више Агената**: Имплементација комплексних AI архитектура

## 📚 Поглавља за учење

*Изаберите свој пут учења на основу нивоа искуства и циљева*

### 🚀 Поглавље 1: Основе и Брзи Почетак
**Предуслови**: Azure претплата, основно познавање командне линије  
**Трајање**: 30-45 минута  
**Комплексност**: ⭐

#### Шта ћете научити
- Разумевање основа Azure Developer CLI
- Инсталација AZD на вашој платформи
- Ваша прва успешна имплементација

#### Ресурси за учење
- **🎯 Почните Овде**: [Шта је Azure Developer CLI?](../..)
- **📖 Теорија**: [AZD Основе](docs/getting-started/azd-basics.md) - Основни концепти и терминологија
- **⚙️ Подешавање**: [Инсталација и Подешавање](docs/getting-started/installation.md) - Водичи за специфичне платформе
- **🛠️ Практично**: [Ваш Први Пројекат](docs/getting-started/first-project.md) - Туторијал корак по корак
- **📋 Брзи Референтни Водич**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Практичне Вежбе
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Резултат Поглавља**: Успешно имплементирајте једноставну веб апликацију на Azure користећи AZD

---

### 🤖 Поглавље 2: Развој са AI као Првим Фокусом (Препоручено за AI Програмере)
**Предуслови**: Завршено Поглавље 1  
**Трајање**: 1-2 сата  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Интеграција Azure AI Foundry са AZD
- Имплементација апликација заснованих на AI
- Разумевање конфигурација AI услуга

#### Ресурси за учење
- **🎯 Почните Овде**: [Интеграција Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Шаблони**: [Имплементација AI Модела](docs/ai-foundry/ai-model-deployment.md) - Имплементација и управљање AI моделима
- **🛠️ Радионица**: [AI Радионица](docs/ai-foundry/ai-workshop-lab.md) - Припрема ваших AI решења за AZD
- **📋 Шаблони**: [Azure AI Foundry Шаблони](../..)

#### Практичне Вежбе
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Резултат Поглавља**: Имплементирајте и конфигуришите апликацију засновану на AI са RAG могућностима

---

### ⚙️ Поглавље 3: Конфигурација и Аутентификација
**Предуслови**: Завршено Поглавље 1  
**Трајање**: 45-60 минута  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Управљање конфигурацијом окружења
- Најбоље праксе за аутентификацију и безбедност
- Именовање и организација ресурса

#### Ресурси за учење
- **📖 Конфигурација**: [Водич за Конфигурацију](docs/getting-started/configuration.md) - Подешавање окружења
- **🔐 Безбедност**: Шаблони за аутентификацију и управљани идентитет
- **📝 Примери**: [Пример Апликације за Базу Података](../../examples/database-app) - Шаблони конфигурације

#### Практичне Вежбе
- Конфигуришите више окружења (развој, тестирање, продукција)
- Подесите аутентификацију са управљаним идентитетом
- Примените конфигурације специфичне за окружење

**💡 Резултат Поглавља**: Управљајте више окружења уз правилну аутентификацију и безбедност

---

### 🏗️ Поглавље 4: Инфраструктура као Код и Имплементација
**Предуслови**: Завршена Поглавља 1-3  
**Трајање**: 1-1.5 сати  
**Комплексност**: ⭐⭐⭐

#### Шта ћете научити
- Напредни шаблони имплементације
- Инфраструктура као Код уз Bicep
- Стратегије за управљање ресурсима

#### Ресурси за учење
- **📖 Имплементација**: [Водич за Имплементацију](docs/deployment/deployment-guide.md) - Комплетни радни токови
- **🏗️ Управљање Ресурсима**: [Управљање Ресурсима](docs/deployment/provisioning.md) - Управљање Azure ресурсима
- **📝 Примери**: [Пример Апликације у Контејнеру](../../examples/container-app) - Имплементација у контејнерима

#### Практичне Вежбе
- Креирајте прилагођене Bicep шаблоне
- Имплементирајте апликације са више услуга
- Примените стратегије имплементације "плаво-зелено"

**💡 Резултат Поглавља**: Имплементирајте комплексне апликације са више услуга користећи прилагођене инфраструктурне шаблоне

---

### 🎯 Поглавље 5: Решeња са Више Агената (Напредно)
**Предуслови**: Завршена Поглавља 1-2  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Шаблони архитектуре са више агената
- Оркестрација и координација агената
- Имплементација AI решења спремних за продукцију

#### Ресурси за учење
- **🤖 Истакнути Пројекат**: [Решeње за Малопродају са Више Агената](examples/retail-scenario.md) - Комплетна имплементација
- **🛠️ ARM Шаблони**: [ARM Шаблон Пакет](../../examples/retail-multiagent-arm-template) - Имплементација једним кликом
- **📖 Архитектура**: Шаблони координације агената

#### Практичне Вежбе
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Резултат Поглавља**: Имплементирајте и управљајте решењем спремним за продукцију са више агената, укључујући агента за купце и инвентар

---

### 🔍 Поглавље 6: Валидација и Планирање Пре Имплементације
**Предуслови**: Завршено Поглавље 4  
**Трајање**: 1 сат  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Планирање капацитета и валидација ресурса
- Стратегије избора SKU-а
- Провере пре имплементације и аутоматизација

#### Ресурси за учење
- **📊 Планирање**: [Планирање Капацитета](docs/pre-deployment/capacity-planning.md) - Валидација ресурса
- **💰 Избор SKU-а**: [Избор SKU-а](docs/pre-deployment/sku-selection.md) - Исплативе опције
- **✅ Валидација**: [Провере Пре Имплементације](docs/pre-deployment/preflight-checks.md) - Аутоматизовани скриптови

#### Практичне Вежбе
- Покрените скриптове за валидацију капацитета
- Оптимизујте избор SKU-а за трошкове
- Примените аутоматизоване провере пре имплементације

**💡 Резултат Поглавља**: Валидација и оптимизација имплементације пре извршења

---

### 🚨 Поглавље 7: Решавање Проблема и Дебаговање
**Предуслови**: Завршено било које поглавље о имплементацији  
**Трајање**: 1-1.5 сати  
**Комплексност**: ⭐⭐

#### Шта ћете научити
- Систематски приступи дебаговању
- Уобичајени проблеми и решења
- Решавање проблема специфичних за AI

#### Ресурси за учење
- **🔧 Уобичајени Проблеми**: [Уобичајени Проблеми](docs/troubleshooting/common-issues.md) - FAQ и решења
- **🕵️ Дебаговање**: [Водич за Дебаговање](docs/troubleshooting/debugging.md) - Стратегије корак по корак
- **🤖 AI Проблеми**: [Решавање AI Проблема](docs/troubleshooting/ai-troubleshooting.md) - Проблеми са AI услугама

#### Практичне Вежбе
- Дијагностикујте неуспехе имплементације
- Решите проблеме са аутентификацијом
- Дебагујте повезивање AI услуга

**💡 Резултат Поглавља**: Самостално дијагностикујте и решите уобичајене проблеме имплементације

---

### 🏢 Поглавље 8: Продукција и Шаблони за Ентерпрајз
**Предуслови**: Завршена Поглавља 1-4  
**Трајање**: 2-3 сата  
**Комплексност**: ⭐⭐⭐⭐

#### Шта ћете научити
- Стратегије имплементације у продукцији
- Шаблони за безбедност у ентерпрајзу
- Мониторинг и оптимизација трошкова

#### Ресурси за учење
- **🏭 Продукција**: [Најбоље Практике за AI у Продукцији](docs/ai-foundry/production-ai-practices.md) - Шаблони за ентерпрајз
- **📝 Примери**: [Пример Микросервиса](../../examples/microservices) - Комплексне архитектуре
- **📊 Праћење**: Интеграција са Application Insights

#### Практичне Вежбе
- Примените безбедносне шаблоне за предузећа
- Поставите свеобухватно праћење
- Деплојтујте у продукцију уз одговарајуће управљање

**💡 Резултат Поглавља**: Деплојтујте апликације спремне за предузећа са пуним продукционим могућностима

---

## 📖 Шта је Azure Developer CLI?

Azure Developer CLI (azd) је командна линија усмерена на програмере која убрзава процес изградње и деплојтовања апликација на Azure. Пружа:

- **Деплојтовање засновано на шаблонима** - Користите унапред припремљене шаблоне за уобичајене апликативне шаблоне
- **Инфраструктура као код** - Управљајте Azure ресурсима користећи Bicep или Terraform  
- **Интегрисани токови рада** - Беспрекорно обезбеђујте, деплојтујте и пратите апликације
- **Прилагођено програмерима** - Оптимизовано за продуктивност и искуство програмера

### **AZD + Azure AI Foundry: Савршено за AI Деплојтовање**

**Зашто AZD за AI решења?** AZD решава највеће изазове са којима се суочавају AI програмери:

- **Шаблони спремни за AI** - Унапред конфигурисани шаблони за Azure OpenAI, Cognitive Services и ML радне оптерећења
- **Безбедно AI деплојтовање** - Уграђени безбедносни шаблони за AI услуге, API кључеве и моделе  
- **Продукциони AI шаблони** - Најбоље праксе за скалабилно и економично деплојтовање AI апликација
- **Крај-до-крај AI токови рада** - Од развоја модела до продукционог деплојтовања уз одговарајуће праћење
- **Оптимизација трошкова** - Паметне стратегије алокације ресурса и скалирања за AI радне оптерећења
- **Интеграција са Azure AI Foundry** - Беспрекорна веза са каталогом модела и крајњим тачкама AI Foundry

---

## 🎯 Библиотека Шаблона и Примера

### Истакнуто: Azure AI Foundry Шаблони
**Почните овде ако деплојтујете AI апликације!**

| Шаблон | Поглавље | Комплексност | Услуге |
|----------|---------|------------|----------|
| [**Почните са AI четом**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Почните са AI агентима**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Поглавље 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Аутоматизација мулти-агентских токова рада**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Генеришите документе из ваших података**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Унапредите састанке са клијентима уз агенте**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Модернизујте ваш код уз агенте**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Изградите ваш конверзациони агент**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Откључајте увиде из конверзационих података**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Обрада мултимодалног садржаја**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Поглавље 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Истакнуто: Комплетни сценарији учења
**Шаблони апликација спремних за продукцију повезани са поглављима учења**

| Шаблон | Поглавље учења | Комплексност | Кључно учење |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Поглавље 2 | ⭐ | Основни AI шаблони деплојтовања |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Поглавље 2 | ⭐⭐ | RAG имплементација са Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Поглавље 4 | ⭐⭐ | Интеграција интелигенције докумената |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Поглавље 5 | ⭐⭐⭐ | Оквир агента и позивање функција |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Поглавље 8 | ⭐⭐⭐ | Оркестрација AI за предузећа |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Поглавље 5 | ⭐⭐⭐⭐ | Мулти-агентска архитектура са агентима за купце и инвентар |

### Учење по типу примера

#### Једноставне апликације (Поглавља 1-2)
- [Једноставна веб апликација](../../examples/simple-web-app) - Основни шаблони деплојтовања
- [Статички сајт](../../examples/static-site) - Деплојтовање статичког садржаја
- [Основни API](../../examples/basic-api) - Деплојтовање REST API-а

#### Интеграција са базом података (Поглавља 3-4)  
- [Апликација са базом података](../../examples/database-app) - Шаблони повезивања са базом података
- [Обрада података](../../examples/data-processing) - Деплојтовање ETL токова рада

#### Напредни шаблони (Поглавља 4-8)
- [Апликације у контејнерима](../../examples/container-app) - Деплојтовање у контејнерима
- [Микросервисне апликације](../../examples/microservices) - Архитектуре са више услуга  
- [Решења за предузећа](../../examples/enterprise) - Шаблони спремни за продукцију

### Спољне колекције шаблона
- [**Azure-Samples AZD Шаблони**](https://github.com/Azure-Samples/azd-templates) - Званични Microsoft примери
- [**Awesome AZD Галерија**](https://azure.github.io/awesome-azd/) - Шаблони које је допринела заједница
- [**Директоријум Примера**](examples/README.md) - Локални примери учења са детаљним објашњењима

---

## 📚 Ресурси за учење и референце

### Брзе референце
- [**Листa команди**](resources/cheat-sheet.md) - Основне azd команде организоване по поглављима
- [**Глосар**](resources/glossary.md) - Терминологија Azure и azd  
- [**Често постављана питања**](resources/faq.md) - Уобичајена питања организована по поглављима учења
- [**Водич за учење**](resources/study-guide.md) - Свеобухватне практичне вежбе

### Практичне радионице
- [**AI Радионица**](docs/ai-foundry/ai-workshop-lab.md) - Учини своја AI решења спремним за AZD деплојтовање
- [**AZD Радионица за почетнике**](workshop/README.md) - Комплетни материјали за практичну радионицу

### Спољни ресурси за учење
- [Azure Developer CLI Документација](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Архитектонски Центар](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Калкулатор Цена](https://azure.microsoft.com/pricing/calculator/)
- [Azure Статус](https://status.azure.com/)

---

## 🎓 Завршетак курса и сертификација

### Праћење напретка
Пратите свој напредак кроз свако поглавље:

- [ ] **Поглавље 1**: Основе и брзи почетак ✅
- [ ] **Поглавље 2**: Развој усмерен на AI ✅  
- [ ] **Поглавље 3**: Конфигурација и аутентификација ✅
- [ ] **Поглавље 4**: Инфраструктура као код и деплојтовање ✅
- [ ] **Поглавље 5**: Мулти-агентска AI решења ✅
- [ ] **Поглавље 6**: Валидација и планирање пре деплојтовања ✅
- [ ] **Поглавље 7**: Решавање проблема и дебаговање ✅
- [ ] **Поглавље 8**: Продукциони и предузетнички шаблони ✅

### Верификација учења
Након завршетка сваког поглавља, проверите своје знање:
1. **Практична вежба**: Завршите практично деплојтовање за поглавље
2. **Провера знања**: Прегледајте секцију Често постављаних питања за своје поглавље
3. **Дискусија у заједници**: Поделите своје искуство на Azure Discord-у
4. **Следеће поглавље**: Пређите на следећи ниво комплексности

### Предности завршетка курса
Након завршетка свих поглавља, имаћете:
- **Продукционо искуство**: Деплојтовали сте праве AI апликације на Azure
- **Професионалне вештине**: Способности за деплојтовање спремно за предузећа  
- **Признање у заједници**: Активан члан Azure програмерске заједнице
- **Напредак у каријери**: Тражене вештине за AZD и AI деплојтовање

---

## 🤝 Заједница и подршка

### Помоћ и подршка
- **Технички проблеми**: [Пријавите грешке и затражите функције](https://github.com/microsoft/azd-for-beginners/issues)
- **Питања о учењу**: [Microsoft Azure Discord Заједница](https://discord.gg/microsoft-azure)
- **Помоћ за AI**: Придружите се [#Azure каналу](https://discord.gg/microsoft-azure) за дискусије о AZD + AI Foundry
- **Документација**: [Званична документација Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Увид из Azure AI Foundry Discord-а

**Резултати недавне анкете из #Azure канала:**
- **45%** програмера жели да користи AZD за AI радне оптерећења
- **Највећи изазови**: Деплојтовање више услуга, управљање акредитивима, спремност за продукцију  
- **Највише тражено**: AI специфични шаблони, водичи за решавање проблема, најбоље праксе

**Придружите се нашој заједници да:**
- Поделите своја AZD + AI искуства и добијете помоћ
- Приступите раним прегледима нових AI шаблона
- Допринесете најбољим праксама за AI деплојтовање
- Утичете на будући развој функција за AI + AZD

### Допринос курсу
Добродошли су доприноси! Молимо вас да прочитате наш [Водич за допринос](CONTRIBUTING.md) за детаље о:
- **Унапређењу садржаја**: Побољшајте постојећа поглавља и примере
- **Новим примерима**: Додајте сценарије из стварног света и шаблоне  
- **Преводу**: Помозите у одржавању подршке за више језика
- **Пријави грешака**: Побољшајте тачност и јасноћу
- **Стандарди заједнице**: Пратите наше инклузивне смернице за заједницу

---

## 📄 Информације о курсу

### Лиценца
Овај пројекат је лиценциран под MIT лиценцом - погледајте [LICENSE](../../LICENSE) фајл за детаље.

### Повезани ресурси за учење од Microsoft-а

Наш тим производи друге свеобухватне курсеве за учење:

- [**НОВО** Протокол контекста модела (MCP) за почетнике](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Агенти за почетнике](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
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
- [Мастеринг GitHub Copilot за AI парно програмирање](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Мастеринг GitHub Copilot за C#/.NET програмере](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Изаберите своју Copilot авантуру](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Навигација кроз курс

**🚀
**Искусни програмери**: Почните са [Поглавље 3: Конфигурација и аутентикација](../..)

**Следећи кораци**: [Почните Поглавље 1 - Основе AZD](docs/getting-started/azd-basics.md) →

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људског преводиоца. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.