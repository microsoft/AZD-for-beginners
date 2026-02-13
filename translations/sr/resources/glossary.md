# Речник - Azure и AZD терминологија

**Референца за све поглавља**
- **📚 Course Home**: [AZD For Beginners](../README.md)
- **📖 Learn Basics**: [Поглавље 1: Основе AZD](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Поглавље 2: Развој оријентисан на AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Увод

Ова свеобухватна речник даје дефиниције појмова, концепата и скраћеница који се користе у Azure Developer CLI и развоју у Azure облаку. Суставан је референтни материјал за разумевање техничке документације, решавање проблема и ефикасну комуникацију о azd пројектима и Azure услугама.

## Циљеви учења

Коришћењем овог речника, ви ћете:
- Разумети основну терминологију и концепте Azure Developer CLI
- Усвојити вокабулар и техничке термине за развој у Azure облаку
- Ефикасно се позивати на појмове Infrastructure as Code и терминологију развоза
- Схватити имена Azure услуга, скраћенице и њихову сврху
- Доступити дефиниције за терминологију која се односи на решавање проблема и дебаговање
- Научити напредне концепте архитектуре и развоја у Azure

## Резултати учења

Редовним коришћењем овог речника, бићете у стању да:
- Ефикасно комуницирате користећи исправну терминологију Azure Developer CLI
- Јасније разумете техничку документацију и поруке о грешкама
- Са поверењем се крећете по услугама и појмовима Azure-а
- Решавате проблеме користећи одговарајући технички речник
- Придоносетe тимским дискусијама тачним техничким језиком
- Систематски проширујете своје знање о развоју у Azure облаку

## A

**ARM Template**  
ARM шаблон. JSON-базирани Infrastructure as Code формат који се користи за декларативно дефинисање и развој Azure ресурса.

**App Service**  
Azure-ова платформа као услуга (PaaS) за хостовање веб апликација, REST API-ја и мобилних бекенда без управљања инфраструктуром.

**Application Insights**  
Azure-ова услуга за праћење перформанси апликација (APM) која пружа дубоке увиде у перформансе апликације, доступност и коришћење.

**Azure CLI**  
Командни интерфејс за управљање Azure ресурсима. Користи се од стране azd за аутентификацију и неке операције.

**Azure Developer CLI (azd)**  
Командни алат оријентисан на развојне инжењере који убрзава процес прављења и развоза апликација у Azure користећи шаблоне и Infrastructure as Code.

**azure.yaml**  
Главни конфигурациони фајл за azd пројекат који дефинише сервисе, инфраструктуру и хукове за развоз.

**Azure Resource Manager (ARM)**  
Azure-ова услуга за распореди и управљање која пружа слој за управљање за креирање, ажурирање и брисање ресурса.

## B

**Bicep**  
Домени-специфичан језик (DSL) који је развио Microsoft за распореде Azure ресурса. Пружа једноставнију синтаксу у односу на ARM шаблоне, док се компајлира у ARM.

**Build**  
Процес компајлирања изворног кода, инсталације зависности и припреме апликација за развоз.

**Blue-Green Deployment**  
Стратегија распореда која користи два идентична продукциона окружења (плаво и зелено) да би се свело на минимум време недоступности и ризик.

## C

**Container Apps**  
Azure-ова серверлес услуга за контејнере која омогућава покретање контејнеризованих апликација без управљања сложеном инфраструктуром.

**CI/CD**  
Continuous Integration/Continuous Deployment. Аутоматизоване праксе за интеграцију промена у коду и развоз апликација.

**Cosmos DB**  
Azure-ова глобално распоређена, мулти-моделска база података која пружа свеобухватне SLA-ове за пропусност, латенцију, доступност и конзистентност.

**Configuration**  
Подешавања и параметри који контролишу понашање апликације и опције распореда.

## D

**Deployment**  
Процес инсталирања и конфигурисања апликација и њихових зависности на циљној инфраструктури.

**Docker**  
Платформа за развој, испоруку и покретање апликација коришћењем технологије контејнеризације.

**Dockerfile**  
Текстуални фајл који садржи инструкције за израду Docker контейнер имиджа.

## E

**Environment**  
Циљ распореда који представља специфичну инстанцу ваше апликације (нпр. development, staging, production).

**Environment Variables**  
Вредности конфигурације које се чувају као парови кључ-вредност и које апликације могу приступити при извршавању.

**Endpoint**  
URL или мрежна адреса на којој се апликација или услуга може приступити.

## F

**Function App**  
Azure-ова серверлес рачунска услуга која омогућава покретање догађајима покретаног кода без управљања инфраструктуром.

## G

**GitHub Actions**  
CI/CD платформа интегрисана са GitHub репозиторијумима за аутоматизацију радних токова.

**Git**  
Дистрибуирани систем за контролу верзија који се користи за праћење промена у изворном коду.

## H

**Hooks**  
Прилагођени скрипти или команде које се извршавају у одређеним тачкама током животног циклуса распореда (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Тип Azure услуге где ће апликација бити распореди (нпр. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Пракса дефинисања и управљања инфраструктуром кроз код уместо ручних процеса.

**Init**  
Процес иницијализације новог azd пројекта, обично из шаблона.

## J

**JSON**  
JavaScript Object Notation. Формат за размену података који се често користи за конфигурационе фајлове и одговоре API-ја.

**JWT**  
JSON Web Token. Стандард за безбедни пренос информација између страна као JSON објекат.

## K

**Key Vault**  
Azure-ова услуга за сигурно чување и управљање тајнама, кључевима и сертификатима.

**Kusto Query Language (KQL)**  
Језик упита који се користи за анализу података у Azure Monitor, Application Insights и другим Azure услугама.

## L

**Load Balancer**  
Услуга која распоређује долазни мрежни саобраћај преко више сервера или инстанци.

**Log Analytics**  
Azure услуга за прикупљање, анализу и реаговање на телеметријске податке из облачних и on‑premises окружења.

## M

**Managed Identity**  
Функција Azure-а која пружа Azure услугама аутоматски управљану идентификацију за аутентификацију према другим Azure услугама.

**Microservices**  
Архитектонски приступ у којем су апликације изграђене као збирка малих, независних сервиса.

**Monitor**  
Azure-ово уједињено решење за мониторинг које пружа опсервабилност целог стека преко апликација и инфраструктуре.

## N

**Node.js**  
Извршно окружење за JavaScript изграђено на Chrome-овом V8 JavaScript енџину за развој серверских апликација.

**npm**  
Менаџер пакета за Node.js који управља зависностима и пакетима.

## O

**Output**  
Вредности враћене из распореда инфраструктуре које се могу користити од стране апликација или других ресурса.

## P

**Package**  
Процес припреме кода апликације и зависности за развоз.

**Parameters**  
Улазне вредности прослеђене инфраструктурним шаблонима за прилагођавање распореда.

**PostgreSQL**  
Отворени систем релационих база података подржан као управљана услуга у Azure-у.

**Provisioning**  
Процес креирања и конфигурисања Azure ресурса дефинисаних у инфраструктурним шаблонима.

## Q

**Quota**  
Ограничења у погледу количине ресурса која се могу креирати у Azure претплати или регији.

## R

**Resource Group**  
Логички контејнер за Azure ресурсе који деле исти животни циклус, дозволе и политике.

**Resource Token**  
Јединствени низ који генерише azd да би обезбедио јединственост имена ресурса преко распореда.

**REST API**  
Архитектонски стил за дизајн умрежених апликација користећи HTTP методе.

**Rollback**  
Процес враћања на претходну верзију апликације или конфигурације инфраструктуре.

## S

**Service**  
Компонента ваше апликације дефинисана у azure.yaml (нпр. web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Представља различите нивоe услуге или нивоe перформанси за Azure ресурсе.

**SQL Database**  
Azure-ова управљана релациона база података базирана на Microsoft SQL Server-у.

**Static Web Apps**  
Azure услуга за изградњу и развоз full‑stack веб апликација из репозиторијума изворног кода.

**Storage Account**  
Azure услуга која пружа облачно складиште за податке као што су блобови, фајлови, редови и табеле.

**Subscription**  
Контейнер Azure налога који садржи resource group-ове и ресурсе, са повезаним наплатама и управљањем приступом.

## T

**Template**  
Унапред изграђена пројектна структура која садржи код апликације, дефиниције инфраструктуре и конфигурацију за уобичајене сценарије.

**Terraform**  
Отворени Infrastructure as Code алат који подржава више провајдера облака укључујући Azure.

**Traffic Manager**  
Azure-ов DNS-базирани балансер саобраћаја за расподелу саобраћаја преко глобалних Azure региона.

## U

**URI**  
Uniform Resource Identifier. Низ који идентификује одређени ресурс.

**URL**  
Uniform Resource Locator. Тип URI‑ја који одређује где се ресурс налази и како га преузети.

## V

**Virtual Network (VNet)**  
Фундаментални грађевински блок за приватне мреже у Azure-у, који пружа изолацију и сегментацију.

**VS Code**  
Visual Studio Code. Популаран уређивач кода са одличном интеграцијом за Azure и azd.

## W

**Webhook**  
HTTP позив који се активира одређеним догађајима, често коришћен у CI/CD токовима.

**What-if**  
Azure функција која показује које би промене биле направљене распоредом без фактичког извршавања.

## Y

**YAML**  
YAML nije језик за означавање. Хуман‑читљив стандард за серијализацију података који се користи за конфигурационе фајлове као што је azure.yaml.

## Z

**Zone**  
Физички одвојене локације унутар Azure региона које пружају редундантност и високу расположивост.

---

## Уобичајене скраћенице

| Скраћеница | Пуни назив | Опис |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Identity and access management service |
| ACR | Azure Container Registry | Container image registry service |
| AKS | Azure Kubernetes Service | Managed Kubernetes service |
| API | Апликацијски програмски интерфејс | Set of protocols for building software |
| ARM | Azure Resource Manager | Azure's deployment and management service |
| CDN | Content Delivery Network | Distributed network of servers |
| CI/CD | Континуирана интеграција/континуирано постављање | Automated development practices |
| CLI | Интерфејс командне линије | Text-based user interface |
| DNS | Domain Name System | System for translating domain names to IP addresses |
| HTTPS | Hypertext Transfer Protocol Secure | Secure version of HTTP |
| IaC | Infrastructure as Code | Managing infrastructure through code |
| JSON | JavaScript Object Notation | Data interchange format |
| JWT | JSON Web Token | Token format for secure information transmission |
| KQL | Kusto Query Language | Query language for Azure data services |
| RBAC | Role-Based Access Control | Access control method based on user roles |
| REST | Representational State Transfer | Architectural style for web services |
| SDK | Software Development Kit | Collection of development tools |
| SLA | Service Level Agreement | Commitment to service availability/performance |
| SQL | Structured Query Language | Language for managing relational databases |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Cryptographic protocols |
| URI | Uniform Resource Identifier | String identifying a resource |
| URL | Uniform Resource Locator | Type of URI specifying resource location |
| VM | Virtual Machine | Emulation of a computer system |
| VNet | Virtual Network | Private network in Azure |
| YAML | YAML Ain't Markup Language | Data serialization standard |

---

## Мапирање имена Azure услуга

| Common Name | Official Azure Service Name | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Појмови специфични за контекст

### Пojмови за развој
- **Hot Reload**: Аутоматско ажурирање апликација током развоја без рестарта
- **Build Pipeline**: Аутоматизовани процес за грађење и тестирање кода
- **Deployment Slot**: Стагирано окружење у оквиру App Service
- **Environment Parity**: Одржавање развојних, стагираних и продукционих окружења сличним

### Безбедносни појмови
- **Managed Identity**: Azure функција која обезбеђује аутоматско управљање креденцијалима
- **Key Vault**: Сигурно складиште за тајне, кључеве и сертификате
- **RBAC**: Контрола приступа на основу улога за Azure ресурсе
- **Network Security Group**: Виртуелни фајервол за контролу мрежног саобраћаја

### Појмови за мониторинг
- **Telemetry**: Аутоматизовано прикупљање мерења и података
- **Application Performance Monitoring (APM)**: Мониторинг перформанси софтвера
- **Log Analytics**: Услуга за прикупљање и анализу лог података
- **Alert Rules**: Аутоматизована обавештења заснована на метрикама или условима

### Појмови за развоз
- **Blue-Green Deployment**: Стратегија распореда без прекида услуге
- **Canary Deployment**: Постепено пуштање ограниченој групи корисника
- **Rolling Update**: Секвенцијална замена инстанци апликације
- **Rollback**: Враћање на претходну верзију апликације

---

**Савет за коришћење**: Use `Ctrl+F` to quickly search for specific terms in this glossary. Terms are cross-referenced where applicable.

---

**Навигација**
- **Претходна лекција**: [Шпаргла](cheat-sheet.md)
- **Следећа лекција**: [ЧПП](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Одрицање одговорности:
Овај документ је преведен уз помоћ AI услуге за превођење [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Изворни документ на његовом оригиналном језику сматрајте меродавним извором. За критичне информације препоручује се професионални, људски превод. Не сносимо одговорност за било какве неспоразуме или погрешна тумачења настала употребом овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->