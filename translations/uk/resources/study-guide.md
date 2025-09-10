<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-10T07:19:48+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "uk"
}
-->
# Навчальний посібник - AZD для початківців

## Вступ

Цей детальний навчальний посібник пропонує структуровані навчальні цілі, ключові концепції, практичні вправи та матеріали для оцінювання, щоб допомогти вам опанувати Azure Developer CLI (azd). Використовуйте цей посібник для відстеження вашого прогресу та переконайтеся, що ви охопили всі важливі теми.

## Цілі навчання

Завершивши цей навчальний посібник, ви:
- Опануєте всі базові та розширені концепції Azure Developer CLI
- Розвинете практичні навички розгортання та управління додатками в Azure
- Набудете впевненості у вирішенні проблем та оптимізації розгортань
- Зрозумієте практики розгортання для продакшн-середовища та аспекти безпеки

## Результати навчання

Після завершення всіх розділів цього посібника ви зможете:
- Проєктувати, розгортати та управляти архітектурою додатків за допомогою azd
- Реалізовувати комплексні стратегії моніторингу, безпеки та оптимізації витрат
- Самостійно вирішувати складні проблеми розгортання
- Створювати власні шаблони та робити внесок у спільноту azd

## Структура курсу

### Модуль 1: Початок роботи (1-2 тижні)

#### Цілі навчання
- Зрозуміти основи та ключові концепції Azure Developer CLI
- Успішно встановити та налаштувати azd у вашому середовищі розробки
- Виконати перше розгортання за допомогою існуючого шаблону
- Ознайомитися зі структурою проєкту azd та зрозуміти основні компоненти

#### Ключові концепції для освоєння
- Шаблони, середовища та сервіси
- Структура конфігурації azure.yaml
- Основні команди azd (init, up, down, deploy)
- Принципи Infrastructure as Code
- Аутентифікація та авторизація в Azure

#### Практичні вправи

**Вправа 1.1: Встановлення та налаштування**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Вправа 1.2: Перше розгортання**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Вправа 1.3: Аналіз структури проєкту**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Питання для самостійної оцінки
1. Які три основні концепції архітектури azd?
2. Яке призначення файлу azure.yaml?
3. Як середовища допомагають управляти різними цілями розгортання?
4. Які методи аутентифікації можна використовувати з azd?
5. Що відбувається при першому запуску `azd up`?

### Модуль 2: Конфігурація та середовища (3 тиждень)

#### Цілі навчання
- Опанувати управління середовищами та конфігурацією
- Зрозуміти розширені конфігурації azure.yaml
- Реалізувати налаштування та змінні для конкретних середовищ
- Налаштувати аутентифікацію для різних сценаріїв

#### Ключові концепції для освоєння
- Ієрархія середовищ та пріоритет змінних
- Конфігурація сервісів та параметри
- Хуки та події життєвого циклу
- Методи аутентифікації (користувач, сервісний обліковий запис, керована ідентичність)
- Управління файлами конфігурації

#### Практичні вправи

**Вправа 2.1: Налаштування кількох середовищ**
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Вправа 2.2: Розширена конфігурація**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Вправа 2.3: Налаштування безпеки**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Питання для самостійної оцінки
1. Як azd обробляє пріоритет змінних середовища?
2. Що таке хуки розгортання і коли їх слід використовувати?
3. Як налаштувати різні SKU для різних середовищ?
4. Які наслідки для безпеки мають різні методи аутентифікації?
5. Як управляти секретами та конфіденційними даними конфігурації?

### Модуль 3: Розгортання та забезпечення ресурсів (4 тиждень)

#### Цілі навчання
- Опанувати робочі процеси розгортання та найкращі практики
- Зрозуміти Infrastructure as Code за допомогою шаблонів Bicep
- Реалізувати складні архітектури з кількома сервісами
- Оптимізувати продуктивність та надійність розгортання

#### Ключові концепції для освоєння
- Структура шаблонів Bicep та модулі
- Залежності ресурсів та порядок виконання
- Стратегії розгортання (blue-green, rolling updates)
- Розгортання в кількох регіонах
- Міграції баз даних та управління даними

#### Практичні вправи

**Вправа 3.1: Кастомна інфраструктура**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Вправа 3.2: Додаток з кількома сервісами**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Вправа 3.3: Інтеграція бази даних**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Питання для самостійної оцінки
1. Які переваги використання Bicep над ARM шаблонами?
2. Як обробляти міграції баз даних у розгортаннях azd?
3. Які стратегії існують для розгортання без простоїв?
4. Як управляти залежностями між сервісами?
5. Які аспекти слід враховувати при розгортанні в кількох регіонах?

### Модуль 4: Перевірка перед розгортанням (5 тиждень)

#### Цілі навчання
- Реалізувати комплексні перевірки перед розгортанням
- Опанувати планування ресурсів та перевірку їх доступності
- Зрозуміти вибір SKU та оптимізацію витрат
- Створити автоматизовані конвеєри перевірки

#### Ключові концепції для освоєння
- Квоти та обмеження ресурсів Azure
- Критерії вибору SKU та наслідки для витрат
- Автоматизовані скрипти та інструменти перевірки
- Методології планування ресурсів
- Тестування продуктивності та оптимізація

#### Практичні вправи

**Вправа 4.1: Планування ресурсів**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Вправа 4.2: Перевірка перед розгортанням**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Вправа 4.3: Оптимізація SKU**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Питання для самостійної оцінки
1. Які фактори повинні впливати на вибір SKU?
2. Як перевірити доступність ресурсів Azure перед розгортанням?
3. Які ключові компоненти системи перевірки перед розгортанням?
4. Як оцінити та контролювати витрати на розгортання?
5. Який моніторинг є необхідним для планування ресурсів?

### Модуль 5: Вирішення проблем та налагодження (6 тиждень)

#### Цілі навчання
- Опанувати систематичні методології вирішення проблем
- Розвинути експертизу у налагодженні складних проблем розгортання
- Реалізувати комплексний моніторинг та оповіщення
- Створити процедури реагування на інциденти та відновлення

#### Ключові концепції для освоєння
- Типові шаблони помилок розгортання
- Аналіз логів та техніки кореляції
- Моніторинг продуктивності та оптимізація
- Виявлення та реагування на інциденти безпеки
- Відновлення після аварій та забезпечення безперервності бізнесу

#### Практичні вправи

**Вправа 5.1: Сценарії вирішення проблем**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Вправа 5.2: Реалізація моніторингу**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Вправа 5.3: Реагування на інциденти**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Питання для самостійної оцінки
1. Який систематичний підхід до вирішення проблем розгортання azd?
2. Як корелювати логи між кількома сервісами та ресурсами?
3. Які метрики моніторингу є найважливішими для раннього виявлення проблем?
4. Як реалізувати ефективні процедури відновлення після аварій?
5. Які ключові компоненти плану реагування на інциденти?

### Модуль 6: Розширені теми та найкращі практики (7-8 тижні)

#### Цілі навчання
- Реалізувати шаблони розгортання корпоративного рівня
- Опанувати інтеграцію та автоматизацію CI/CD
- Розробляти власні шаблони та робити внесок у спільноту
- Зрозуміти розширені вимоги до безпеки та відповідності

#### Ключові концепції для освоєння
- Шаблони інтеграції CI/CD
- Розробка та розповсюдження власних шаблонів
- Корпоративне управління та відповідність
- Розширені конфігурації мережі та безпеки
- Оптимізація продуктивності та управління витратами

#### Практичні вправи

**Вправа 6.1: Інтеграція CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Вправа 6.2: Розробка власного шаблону**
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Вправа 6.3: Реалізація корпоративного рівня**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Питання для самостійної оцінки
1. Як інтегрувати azd у існуючі робочі процеси CI/CD?
2. Які ключові аспекти слід враховувати при розробці власних шаблонів?
3. Як реалізувати управління та відповідність у розгортаннях azd?
4. Які найкращі практики для розгортань корпоративного масштабу?
5. Як ефективно робити внесок у спільноту azd?

## Практичні проєкти

### Проєкт 1: Персональний вебсайт-портфоліо
**Складність**: Початковий рівень  
**Тривалість**: 1-2 тижні

Створіть та розгорніть персональний вебсайт-портфоліо, використовуючи:
- Хостинг статичного вебсайту на Azure Storage
- Налаштування власного домену
- Інтеграцію CDN для глобальної продуктивності
- Автоматизований конвеєр розгортання

**Результати**:
- Робочий вебсайт, розгорнутий на Azure
- Власний шаблон azd для розгортання портфоліо
- Документація процесу розгортання
- Рекомендації щодо аналізу витрат та оптимізації

### Проєкт 2: Додаток для управління завданнями
**Складність**: Середній рівень  
**Тривалість**: 2-3 тижні

Створіть повноцінний додаток для управління завданнями з:
- Фронтендом на React, розгорнутим на App Service
- Бекендом на Node.js з аутентифікацією
- Базою даних PostgreSQL з міграціями
- Моніторингом через Application Insights

**Результати**:
- Завершений додаток з аутентифікацією користувачів
- Схема бази даних та скрипти міграції
- Панелі моніторингу та правила оповіщення
- Конфігурація розгортання для кількох середовищ

### Проєкт 3: Платформа електронної комерції на мікросервісах
**Складність**: Високий рівень  
**Тривалість**: 4-6 тижнів

Розробіть та реалізуйте платформу електронної комерції на основі мікросервісів:
- Кілька API-сервісів (каталог, замовлення, платежі, користувачі)
- Інтеграція черги повідомлень через Service Bus
- Кешування Redis для оптимізації продуктивності
- Комплексний логінг та моніторинг

**Результати**:
- Завершена архітектура мікросервісів
- Шаблони взаємодії між сервісами
- Тестування продуктивності та оптимізація
- Реалізація безпеки для продакшн-середовища

## Оцінювання та сертифікація

### Перевірка знань

Завершіть ці оцінювання після кожного модуля:

**Оцінювання модуля 1**: Основні концепції та встановлення
- Тестові питання на основні концепції
- Практичні завдання з встановлення та налаштування
- Проста вправа з розгортання

**Оцінювання модуля 2**: Конфігурація та середовища
- Сценарії управління середовищами
- Вправи з усунення проблем конфігурації
- Реалізація налаштувань безпеки

**Оцінювання модуля 3**: Розгортання та забезпечення ресурсів
- Завдання з проєктування інфраструктури
- Сценарії розгортання з кількома сервісами
- Вправи з оптимізації продуктивності

**Оцінювання модуля 4**: Перевірка перед розгортанням
- Кейси планування ресурсів
- Сценарії оптимізації витрат
- Реалізація конвеєра перевірки

**Оцінювання модуля 5**: Вирішення проблем та налагодження
- Завдання з діагностики проблем
- Реалізація моніторингу
- Симуляції реагування на інциденти

**Оцінювання модуля 6**: Розширені теми
- Проєктування конвеєра CI/CD
- Розробка власного шаблону
- Сценарії архітектури корпоративного рівня

### Фінальний проєкт

Розробіть та реалізуйте повне рішення, яке демонструє освоєння всіх концепцій:

**Вимоги**:
- Багатошарова архітектура додатків
- Кілька середовищ розгортання
- Комплексний моніторинг та оповіщення
- Реалізація безпеки та відповідності
- Оптимізація витрат та продуктивності
- Повна документація та інструкції

**Критерії оцінювання**:
- Якість технічної реалізації
- Повнота документації
- Дотримання безпеки та найкращих практик
- Оптимізація продуктивності та витрат
- Ефективність моніторингу та вирішення проблем

## Ресурси для навчання та посилання

### Офіційна документація
- [Документація Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Документація Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Центр архітектури Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Ресурси спільноти
- [Галерея шаблонів AZD](https://azure.github.io/awesome-azd/)
- [Організація Azure-Samples на GitHub](https://github.com/Azure-Samples)
- [Репозиторій Azure Developer CLI на GitHub](https://github.com/Azure/azure-dev)

### Практичні середовища
- [Безкоштовний обліковий запис Azure](https://azure.microsoft.com/free/)
- [Безкоштовний рівень Azure DevOps](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Додаткові інструменти
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Пакет розширень Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Рекомен
3. **Сприяйте розвитку Open Source**: Діліться своїми шаблонами та рішеннями з спільнотою  
4. **Навчайте інших**: Пояснення концепцій іншим допомагає краще зрозуміти їх самому  
5. **Будьте допитливими**: Постійно досліджуйте нові сервіси Azure та інтеграційні шаблони  

---

**Навігація**  
- **Попередній урок**: [FAQ](faq.md)  
- **Наступний урок**: [Changelog](../changelog.md)  

**Відстеження прогресу навчання**: Використовуйте цей посібник для відстеження вашого навчального шляху та забезпечення всебічного охоплення всіх концепцій і практик Azure Developer CLI.  

---

**Відмова від відповідальності**:  
Цей документ було перекладено за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, зверніть увагу, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ мовою оригіналу слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.