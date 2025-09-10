<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:26:17+00:00",
  "source_file": "examples/README.md",
  "language_code": "sr"
}
-->
# Примери - Практични AZD шаблони и конфигурације

## Увод

Овај директоријум садржи практичне примере, шаблоне и сценарије из стварног света који ће вам помоћи да научите Azure Developer CLI кроз практичну примену. Сваки пример пружа комплетан радни код, инфраструктурне шаблоне и детаљна упутства за различите архитектуре апликација и обрасце за имплементацију.

## Циљеви учења

Радећи кроз ове примере, научићете:
- Практиковање Azure Developer CLI радних токова са реалистичним сценаријима апликација
- Разумевање различитих архитектура апликација и њихових azd имплементација
- Савладавање образаца Infrastructure as Code за различите Azure услуге
- Примена стратегија управљања конфигурацијом и деплојмента специфичних за окружење
- Имплементација образаца за мониторинг, безбедност и скалабилност у практичним контекстима
- Стицање искуства у решавању проблема и отклањању грешака у стварним сценаријима деплојмента

## Резултати учења

По завршетку ових примера, бићете у могућности да:
- Са самопоуздањем деплојујете различите типове апликација користећи Azure Developer CLI
- Прилагодите пружене шаблоне својим захтевима апликације
- Дизајнирате и имплементирате прилагођене инфраструктурне обрасце користећи Bicep
- Конфигуришете сложене апликације са више услуга уз правилне зависности
- Примените најбоље праксе за безбедност, мониторинг и перформансе у стварним сценаријима
- Решавате проблеме и оптимизујете деплојменте на основу практичног искуства

## Структура директоријума

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Примери за брзи почетак

### За почетнике
1. **[Једноставна веб апликација - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Деплојовање Node.js Express веб апликације са MongoDB
2. **[Статички сајт - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Хостовање React статичког сајта са Azure Static Web Apps
3. **[Апликација у контејнеру - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Деплојовање Python Flask апликације у контејнеру

### За кориснике средњег нивоа
4. **[Апликација са базом података - C# са Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Веб апликација са C# API и Azure SQL базом података
5. **[Серверлес функција - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions са HTTP тригерима и Cosmos DB
6. **[Микросервисна архитектура - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Вишесервисна Java апликација са Container Apps и API gateway

### Azure AI Foundry шаблони

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Интелигентна апликација за ћаскање са Azure OpenAI
2. **[AI обрада докумената](https://github.com/Azure-Samples/azure-ai-document-processing)** - Анализа докумената користећи Azure AI услуге
3. **[Машинско учење - Пипелининг](https://github.com/Azure-Samples/mlops-v2)** - MLOps радни ток са Azure Machine Learning

## 📋 Упутства за коришћење

### Локално покретање примера

1. **Клонирајте или копирајте пример**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Иницијализујте AZD окружење**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Конфигуришите окружење**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Деплој**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Прилагођавање примера

Сваки пример укључује:
- **README.md** - Детаљна упутства за подешавање и прилагођавање
- **azure.yaml** - AZD конфигурација са коментарима
- **infra/** - Bicep шаблони са објашњењима параметара
- **src/** - Пример кода апликације
- **scripts/** - Помоћни скриптови за уобичајене задатке

## 🎯 Циљеви учења

### Категорије примера

#### **Основни деплојменти**
- Апликације са једном услугом
- Једноставни инфраструктурни обрасци
- Основно управљање конфигурацијом
- Исплативи развојни сетапи

#### **Напредни сценарији**
- Архитектуре са више услуга
- Сложене конфигурације мрежа
- Обрасци интеграције база података
- Имплементације безбедности и усклађености

#### **Шаблони спремни за продукцију**
- Конфигурације високе доступности
- Мониторинг и опсервабилност
- Интеграција CI/CD
- Сетапи за опоравак од катастрофе

## 📖 Опис примера

### Једноставна веб апликација - Node.js Express
**Технологије**: Node.js, Express, MongoDB, Container Apps  
**Комплексност**: Почетник  
**Концепти**: Основни деплојмент, REST API, интеграција NoSQL базе података

### Статички сајт - React SPA
**Технологије**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Комплексност**: Почетник  
**Концепти**: Статичко хостовање, серверлес бекенд, модерни веб развој

### Апликација у контејнеру - Python Flask
**Технологије**: Python Flask, Docker, Container Apps, Container Registry  
**Комплексност**: Почетник  
**Концепти**: Контејнеризација, архитектура микросервиса, развој API-ја

### Апликација са базом података - C# са Azure SQL
**Технологије**: C# ASP.NET Core, Azure SQL Database, App Service  
**Комплексност**: Средњи ниво  
**Концепти**: Entity Framework, конекције са базом података, развој веб API-ја

### Серверлес функција - Python Azure Functions
**Технологије**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Комплексност**: Средњи ниво  
**Концепти**: Архитектура заснована на догађајима, серверлес рачунарство, развој целокупног стека

### Микросервисна архитектура - Java Spring Boot
**Технологије**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Комплексност**: Средњи ниво  
**Концепти**: Комуникација микросервиса, дистрибуирани системи, обрасци за предузећа

### Azure AI Foundry примери

#### Azure OpenAI Chat App
**Технологије**: Azure OpenAI, Cognitive Search, App Service  
**Комплексност**: Средњи ниво  
**Концепти**: RAG архитектура, претрага вектора, интеграција LLM-а

#### AI обрада докумената
**Технологије**: Azure AI Document Intelligence, Storage, Functions  
**Комплексност**: Средњи ниво  
**Концепти**: Анализа докумената, OCR, екстракција података

#### Машинско учење - Пипелининг
**Технологије**: Azure ML, MLOps, Container Registry  
**Комплексност**: Напредни ниво  
**Концепти**: Тренинг модела, деплојмент пипелини, мониторинг

## 🛠 Примери конфигурације

Директоријум `configurations/` садржи компоненте које се могу поново користити:

### Конфигурације окружења
- Подешавања за развојно окружење
- Конфигурације за тестно окружење
- Конфигурације спремне за продукцију
- Сетапи за деплојмент у више региона

### Bicep модули
- Компоненте инфраструктуре које се могу поново користити
- Уобичајени обрасци ресурса
- Шаблони са побољшаном безбедношћу
- Конфигурације оптимизоване за трошкове

### Помоћни скриптови
- Аутоматизација подешавања окружења
- Скриптови за миграцију базе података
- Алатке за валидацију деплојмента
- Алатке за праћење трошкова

## 🔧 Водич за прилагођавање

### Прилагођавање примера за ваше потребе

1. **Прегледајте предуслове**
   - Проверите захтеве за Azure услуге
   - Потврдите ограничења претплате
   - Разумите импликације трошкова

2. **Измените конфигурацију**
   - Ажурирајте дефиниције услуга у `azure.yaml`
   - Прилагодите Bicep шаблоне
   - Подесите променљиве окружења

3. **Тестирајте темељно**
   - Прво деплојујте у развојно окружење
   - Потврдите функционалност
   - Тестирајте скалабилност и перформансе

4. **Преглед безбедности**
   - Прегледајте контроле приступа
   - Имплементирајте управљање тајнама
   - Омогућите мониторинг и упозорења

## 📊 Матрица поређења

| Пример | Услуге | База података | Аутентификација | Мониторинг | Комплексност |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | Основно | Основно | ⭐ |
| React SPA + Functions | 3 | ✅ | Основно | Потпуно | ⭐ |
| Python Flask Container | 2 | ❌ | Основно | Потпуно | ⭐ |
| C# Web API + SQL | 2 | ✅ | Потпуно | Потпуно | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Потпуно | Потпуно | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Потпуно | Потпуно | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Потпуно | Потпуно | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Основно | Потпуно | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Потпуно | Потпуно | ⭐⭐⭐⭐ |

## 🎓 Пут учења

### Препоручени напредак

1. **Почните са једноставном веб апликацијом**
   - Научите основне AZD концепте
   - Разумите радни ток деплојмента
   - Вежбајте управљање окружењем

2. **Испробајте статички сајт**
   - Истражите различите опције хостовања
   - Научите о интеграцији CDN-а
   - Разумите конфигурацију DNS-а

3. **Прелазак на апликацију у контејнеру**
   - Научите основе контејнеризације
   - Разумите концепте скалабилности
   - Вежбајте са Docker-ом

4. **Додајте интеграцију базе података**
   - Научите провизију базе података
   - Разумите конекционе стрингове
   - Вежбајте управљање тајнама

5. **Истражите серверлес**
   - Разумите архитектуру засновану на догађајима
   - Научите о тригерима и везама
   - Вежбајте са API-јима

6. **Изградите микросервисе**
   - Научите комуникацију услуга
   - Разумите дистрибуиране системе
   - Вежбајте сложене деплојменте

## 🔍 Проналажење правог примера

### По технолошком стеку
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Контејнери**: Python Flask Container App, Java Microservices
- **Базе података**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### По архитектурном обрасцу
- **Монолитна**: Node.js Express Todo, C# Web API + SQL
- **Статички + серверлес**: React SPA + Functions, Python Functions + SPA
- **Микросервисна**: Java Spring Boot Microservices
- **Контејнеризована**: Python Flask Container App
- **AI-покретана**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### По нивоу комплексности
- **Почетник**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Средњи ниво**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Напредни ниво**: ML Pipeline

## 📚 Додатни ресурси

### Линкови ка документацији
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep документација](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Примери из заједнице
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Најбоље праксе
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Допринос примерима

Имате користан пример за поделу? Добродошли су сви доприноси!

### Упутства за подношење
1. Пратите утврђену структуру директоријума
2. Укључите свеобухватан README.md
3. Додајте коментаре у конфигурационе датотеке
4. Темељно тестирајте пре подношења
5. Укључите процене трошкова и предуслове

### Структура шаблона примера
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Савет**: Почните са најједноставнијим примером који одговара вашем технолошком стеку, а затим постепено напредујте ка сложенијим сценаријима. Сваки пример гради на концептима из претходних!

**Следећи кораци**: 
- Изаберите пример који одговара вашем нивоу вештина
- Пратите упутства за подешавање у README датотеци примера
- Експериментишите са прилагођавањем
- Поделите своја искуства са заједницом

---

**Навигација**
- **Претходна лекција**: [Водич

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, молимо вас да имате у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.