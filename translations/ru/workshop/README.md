<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T19:43:29+00:00",
  "source_file": "workshop/README.md",
  "language_code": "ru"
}
-->
# AZD для разработчиков AI: практический семинар

**Предыдущий:** [Руководство по устранению неполадок AI](../docs/troubleshooting/ai-troubleshooting.md) | **Следующий:** [Модули лабораторных занятий](../../../workshop)

Добро пожаловать на практический семинар по изучению Azure Developer CLI (AZD) с акцентом на развертывание AI-приложений. Этот семинар поможет вам освоить основы AZD и научиться развертывать готовые к производству AI-решения.

## Обзор семинара

**Продолжительность:** 2-3 часа  
**Уровень:** Начальный - Средний  
**Предварительные требования:** Базовые знания Azure, инструментов командной строки и концепций AI

### Чему вы научитесь

- **Основы AZD**: Понимание инфраструктуры как кода с помощью AZD
- 🤖 **Интеграция AI-сервисов**: Развертывание Azure OpenAI, AI Search и других AI-сервисов
- **Развертывание контейнеров**: Использование Azure Container Apps для AI-приложений
- **Лучшие практики безопасности**: Реализация управляемой идентичности и безопасных конфигураций
- **Мониторинг и наблюдаемость**: Настройка Application Insights для AI-нагрузок
- **Производственные шаблоны**: Стратегии развертывания для предприятий

## Структура семинара

### Модуль 1: Основы AZD (30 минут)
- Установка и настройка AZD
- Понимание структуры проекта AZD
- Ваше первое развертывание с AZD
- **Лабораторная работа**: Развертывание простого веб-приложения

### Модуль 2: Интеграция Azure OpenAI (45 минут)
- Настройка ресурсов Azure OpenAI
- Стратегии развертывания моделей
- Настройка доступа к API и аутентификации
- **Лабораторная работа**: Развертывание чат-приложения с GPT-4

### Модуль 3: Приложения RAG (45 минут)
- Интеграция Azure AI Search
- Обработка документов с помощью Azure Document Intelligence
- Векторные эмбеддинги и семантический поиск
- **Лабораторная работа**: Создание системы вопросов и ответов на основе документов

### Модуль 4: Производственное развертывание (30 минут)
- Конфигурация Container Apps
- Масштабирование и оптимизация производительности
- Мониторинг и ведение логов
- **Лабораторная работа**: Развертывание в производственной среде с наблюдаемостью

### Модуль 5: Продвинутые шаблоны (15 минут)
- Развертывание в нескольких средах
- Интеграция CI/CD
- Стратегии оптимизации затрат
- **Заключение**: Контрольный список готовности к производству

## Предварительные требования

### Необходимые инструменты

Пожалуйста, установите эти инструменты перед началом семинара:

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

### Настройка учетной записи Azure

1. **Подписка Azure**: [Зарегистрируйтесь бесплатно](https://azure.microsoft.com/free/)  
2. **Доступ к Azure OpenAI**: [Запросить доступ](https://aka.ms/oai/access)  
3. **Необходимые разрешения**:  
   - Роль Contributor для подписки или группы ресурсов  
   - User Access Administrator (для назначения RBAC)

### Проверка предварительных требований

Запустите этот скрипт, чтобы проверить вашу настройку:

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

## Материалы семинара

### Лабораторные упражнения

Каждый модуль включает практические лабораторные работы с исходным кодом и пошаговыми инструкциями:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Ваше первое развертывание с AZD  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Чат-приложение с Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - Приложение RAG с AI Search  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Шаблоны развертывания в производственной среде  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Сценарии продвинутого развертывания  

### Справочные материалы

- **[Руководство по интеграции AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Полные шаблоны интеграции  
- **[Руководство по развертыванию моделей AI](../docs/ai-foundry/ai-model-deployment.md)** - Лучшие практики развертывания моделей  
- **[Практики AI для производства](../docs/ai-foundry/production-ai-practices.md)** - Шаблоны развертывания для предприятий  
- **[Руководство по устранению неполадок AI](../docs/troubleshooting/ai-troubleshooting.md)** - Часто встречающиеся проблемы и их решения  

### Примерные шаблоны

Шаблоны для быстрого старта в распространенных сценариях AI:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Начало работы

### Вариант 1: GitHub Codespaces (рекомендуется)

Самый быстрый способ начать семинар:

[![Открыть в GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Вариант 2: Локальная разработка

1. **Клонируйте репозиторий семинара:**  
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Войдите в Azure:**  
```bash
az login
azd auth login
```

3. **Начните с лабораторной работы 1:**  
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Вариант 3: Семинар с инструктором

Если вы участвуете в семинаре с инструктором:

- 🎥 **Запись семинара**: [Доступна по запросу](https://aka.ms/azd-ai-workshop)  
- 💬 **Сообщество Discord**: [Присоединяйтесь для получения поддержки](https://aka.ms/foundry/discord)  
- **Обратная связь о семинаре**: [Поделитесь своим мнением](https://aka.ms/azd-workshop-feedback)  

## Таймлайн семинара

### Самостоятельное обучение (3 часа)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Сессия с инструктором (2,5 часа)

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

## Критерии успеха

К концу семинара вы сможете:

✅ **Развертывать AI-приложения** с использованием шаблонов AZD  
✅ **Настраивать Azure OpenAI** с соблюдением мер безопасности  
✅ **Создавать приложения RAG** с интеграцией Azure AI Search  
✅ **Реализовывать производственные шаблоны** для AI-нагрузок в предприятиях  
✅ **Мониторить и устранять неполадки** при развертывании AI-приложений  
✅ **Применять стратегии оптимизации затрат** для AI-нагрузок  

## Сообщество и поддержка

### Во время семинара

- 🙋 **Вопросы**: Используйте чат семинара или поднимите руку  
- 🐛 **Проблемы**: Ознакомьтесь с [руководством по устранению неполадок](../docs/troubleshooting/ai-troubleshooting.md)  
- **Советы**: Делитесь открытиями с другими участниками  

### После семинара

- 💬 **Discord**: [Сообщество Azure AI Foundry](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [Сообщить о проблемах с шаблонами](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Обратная связь**: [Форма оценки семинара](https://aka.ms/azd-workshop-feedback)  

## Следующие шаги

### Продолжайте обучение

1. **Продвинутые сценарии**: Изучите [развертывание в нескольких регионах](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **Интеграция CI/CD**: Настройте [рабочие процессы GitHub Actions](../docs/deployment/github-actions.md)  
3. **Пользовательские шаблоны**: Создайте свои [шаблоны AZD](../docs/getting-started/custom-templates.md)  

### Применяйте в своих проектах

1. **Оценка**: Используйте наш [контрольный список готовности](./production-readiness-checklist.md)  
2. **Шаблоны**: Начните с наших [AI-специфичных шаблонов](../../../workshop/templates)  
3. **Поддержка**: Присоединяйтесь к [Discord-сообществу Azure AI Foundry](https://aka.ms/foundry/discord)  

### Делитесь успехами

- ⭐ **Отметьте репозиторий звездой**, если семинар был полезен  
- 🐦 **Поделитесь в социальных сетях** с хэштегами #AzureDeveloperCLI #AzureAI  
- 📝 **Напишите блог** о вашем опыте развертывания AI  

---

## Обратная связь о семинаре

Ваш отзыв помогает нам улучшать семинар:

| Аспект | Оценка (1-5) | Комментарии |
|--------|--------------|------------|
| Качество контента | ⭐⭐⭐⭐⭐ | |
| Практические лабораторные работы | ⭐⭐⭐⭐⭐ | |
| Документация | ⭐⭐⭐⭐⭐ | |
| Уровень сложности | ⭐⭐⭐⭐⭐ | |
| Общий опыт | ⭐⭐⭐⭐⭐ | |

**Отправить отзыв**: [Форма оценки семинара](https://aka.ms/azd-workshop-feedback)

---

**Предыдущий:** [Руководство по устранению неполадок AI](../docs/troubleshooting/ai-troubleshooting.md) | **Следующий:** Начните с [Лабораторной работы 1: Основы AZD](../../../workshop/lab-1-azd-basics)

**Готовы начать создавать AI-приложения с AZD?**

[Начать Лабораторную работу 1: Основы AZD →](./lab-1-azd-basics/README.md)

---

**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия обеспечить точность, автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его родном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется профессиональный перевод человеком. Мы не несем ответственности за любые недоразумения или неправильные интерпретации, возникающие в результате использования данного перевода.