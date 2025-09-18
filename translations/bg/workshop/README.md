<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-18T11:25:11+00:00",
  "source_file": "workshop/README.md",
  "language_code": "bg"
}
-->
# AZD за AI разработчици - Уъркшоп

**Навигация в уъркшопа**
- **📚 Начало на курса**: [AZD за начинаещи](../README.md)
- **📖 Свързани глави**: Обхваща [Глава 1](../README.md#-chapter-1-foundation--quick-start), [Глава 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers) и [Глава 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **🛠️ Практическа лаборатория**: [AI Workshop Lab](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 Следващи стъпки**: [Модули на уъркшопа](../../../workshop)

Добре дошли в практическата работилница за изучаване на Azure Developer CLI (AZD) с акцент върху внедряването на AI приложения. Този уъркшоп е създаден, за да ви преведе от основите на AZD до внедряването на готови за производство AI решения.

## Преглед на уъркшопа

**Продължителност:** 2-3 часа  
**Ниво:** Начинаещ до средно напреднал  
**Предварителни изисквания:** Основни познания за Azure, инструменти за команден ред и AI концепции

### Какво ще научите

- **Основи на AZD**: Разбиране на инфраструктурата като код с AZD
- 🤖 **Интеграция на AI услуги**: Внедряване на Azure OpenAI, AI Search и други AI услуги
- **Внедряване на контейнери**: Използване на Azure Container Apps за AI приложения
- **Най-добри практики за сигурност**: Прилагане на Managed Identity и сигурни конфигурации
- **Мониторинг и наблюдение**: Настройка на Application Insights за AI натоварвания
- **Производствени модели**: Стратегии за внедряване, готови за предприятия

## Структура на уъркшопа

### Модул 1: Основи на AZD (30 минути)
- Инсталиране и конфигуриране на AZD
- Разбиране на структурата на AZD проектите
- Вашето първо внедряване с AZD
- **Лаборатория**: Внедряване на просто уеб приложение

### Модул 2: Интеграция на Azure OpenAI (45 минути)
- Настройка на ресурси за Azure OpenAI
- Стратегии за внедряване на модели
- Конфигуриране на API достъп и автентикация
- **Лаборатория**: Внедряване на чат приложение с GPT-4

### Модул 3: RAG приложения (45 минути)
- Интеграция на Azure AI Search
- Обработка на документи с Azure Document Intelligence
- Векторни ембединг и семантично търсене
- **Лаборатория**: Създаване на система за въпроси и отговори на документи

### Модул 4: Производствено внедряване (30 минути)
- Конфигурация на Container Apps
- Оптимизация на мащабиране и производителност
- Мониторинг и логване
- **Лаборатория**: Внедряване в производство с наблюдение

### Модул 5: Разширени модели (15 минути)
- Внедряване в много среди
- Интеграция на CI/CD
- Стратегии за оптимизация на разходите
- **Заключение**: Контролен списък за готовност за производство

## Предварителни изисквания

### Необходими инструменти

Моля, инсталирайте тези инструменти преди уъркшопа:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Настройка на Azure акаунт

1. **Абонамент за Azure**: [Регистрирайте се безплатно](https://azure.microsoft.com/free/)
2. **Достъп до Azure OpenAI**: [Заявете достъп](https://aka.ms/oai/access)
3. **Необходими разрешения**:
   - Роля Contributor за абонамент или ресурсна група
   - User Access Administrator (за RBAC назначения)

### Проверка на предварителните изисквания

Изпълнете този скрипт, за да проверите вашата настройка:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Материали за уъркшопа

### Лабораторни упражнения

Всеки модул включва практически лаборатории със стартов код и инструкции стъпка по стъпка:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Вашето първо внедряване с AZD
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Чат приложение с Azure OpenAI
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG приложение с AI Search
- **[lab-4-production/](../../../workshop/lab-4-production)** - Модели за производствено внедряване
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Разширени сценарии за внедряване

### Референтни материали

- **[Ръководство за интеграция на AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Комплексни модели за интеграция
- **[Ръководство за внедряване на AI модели](../docs/ai-foundry/ai-model-deployment.md)** - Най-добри практики за внедряване на модели
- **[Практики за производствен AI](../docs/ai-foundry/production-ai-practices.md)** - Модели за внедряване в предприятия
- **[Ръководство за отстраняване на проблеми с AI](../docs/troubleshooting/ai-troubleshooting.md)** - Често срещани проблеми и решения

### Примерни шаблони

Шаблони за бърз старт за често срещани AI сценарии:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Започнете

### Опция 1: GitHub Codespaces (Препоръчително)

Най-бързият начин да започнете уъркшопа:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Опция 2: Локално разработване

1. **Клонирайте репозиторията на уъркшопа:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Влезте в Azure:**
```bash
az login
azd auth login
```

3. **Започнете с Лаборатория 1:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Опция 3: Уъркшоп с инструктор

Ако участвате в сесия с инструктор:

- 🎥 **Запис на уъркшопа**: [Достъпен при поискване](https://aka.ms/azd-ai-workshop)
- 💬 **Discord общност**: [Присъединете се за помощ на живо](https://aka.ms/foundry/discord)
- **Обратна връзка за уъркшопа**: [Споделете вашия опит](https://aka.ms/azd-workshop-feedback)

## Хронология на уъркшопа

### Самостоятелно обучение (3 часа)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Сесия с инструктор (2.5 часа)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## Критерии за успех

До края на този уъркшоп ще можете:

✅ **Да внедрявате AI приложения** с AZD шаблони  
✅ **Да конфигурирате Azure OpenAI** услуги със сигурност  
✅ **Да създавате RAG приложения** с интеграция на Azure AI Search  
✅ **Да прилагате производствени модели** за AI натоварвания в предприятия  
✅ **Да наблюдавате и отстранявате проблеми** при внедряването на AI приложения  
✅ **Да прилагате стратегии за оптимизация на разходите** за AI натоварвания  

## Общност и поддръжка

### По време на уъркшопа

- 🙋 **Въпроси**: Използвайте чата на уъркшопа или вдигнете ръка
- 🐛 **Проблеми**: Проверете [ръководството за отстраняване на проблеми](../docs/troubleshooting/ai-troubleshooting.md)
- **Съвети**: Споделете откритията си с други участници

### След уъркшопа

- 💬 **Discord**: [Azure AI Foundry Community](https://aka.ms/foundry/discord)
- **GitHub Issues**: [Докладвайте проблеми с шаблони](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **Обратна връзка**: [Форма за оценка на уъркшопа](https://aka.ms/azd-workshop-feedback)

## Следващи стъпки

### Продължете обучението

1. **Разширени сценарии**: Изследвайте [внедряване в много региони](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)
2. **Интеграция на CI/CD**: Настройте [GitHub Actions workflows](../docs/deployment/github-actions.md)
3. **Персонализирани шаблони**: Създайте свои [AZD шаблони](../docs/getting-started/custom-templates.md)

### Приложете в своите проекти

1. **Оценка**: Използвайте нашия [контролен списък за готовност](./production-readiness-checklist.md)
2. **Шаблони**: Започнете с нашите [AI-специфични шаблони](../../../workshop/templates)
3. **Поддръжка**: Присъединете се към [Azure AI Foundry Discord](https://aka.ms/foundry/discord)

### Споделете успеха си

- ⭐ **Оценете репозиторията**, ако този уъркшоп ви е помогнал
- 🐦 **Споделете в социалните медии** с #AzureDeveloperCLI #AzureAI
- 📝 **Напишете блог пост** за вашето AI внедряване

---

## Обратна връзка за уъркшопа

Вашата обратна връзка ни помага да подобрим уъркшопа:

| Аспект | Оценка (1-5) | Коментари |
|--------|--------------|----------|
| Качество на съдържанието | ⭐⭐⭐⭐⭐ | |
| Практически лаборатории | ⭐⭐⭐⭐⭐ | |
| Документация | ⭐⭐⭐⭐⭐ | |
| Ниво на трудност | ⭐⭐⭐⭐⭐ | |
| Общо преживяване | ⭐⭐⭐⭐⭐ | |

**Изпратете обратна връзка**: [Форма за оценка на уъркшопа](https://aka.ms/azd-workshop-feedback)

---

**Предишно:** [Ръководство за отстраняване на проблеми с AI](../docs/troubleshooting/ai-troubleshooting.md) | **Следващо:** Започнете с [Лаборатория 1: Основи на AZD](../../../workshop/lab-1-azd-basics)

**Готови ли сте да започнете да създавате AI приложения с AZD?**

[Започнете Лаборатория 1: Основи на AZD →](./lab-1-azd-basics/README.md)

---

**Отказ от отговорност**:  
Този документ е преведен с помощта на AI услуга за превод [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля, имайте предвид, че автоматизираните преводи може да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за недоразумения или погрешни интерпретации, произтичащи от използването на този превод.