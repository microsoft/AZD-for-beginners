<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T23:31:56+00:00",
  "source_file": "workshop/README.md",
  "language_code": "sr"
}
-->
# AZD за радионицу за AI програмере

**Претходно:** [Водич за решавање проблема са AI](../docs/troubleshooting/ai-troubleshooting.md) | **Следеће:** [Модули радионице](../../../workshop)

Добродошли на практичну радионицу за учење Azure Developer CLI (AZD) са фокусом на примену AI апликација. Ова радионица је осмишљена да вас води од основа AZD-а до примене AI решења спремних за производњу.

## Преглед радионице

**Трајање:** 2-3 сата  
**Ниво:** Почетни до средњи  
**Предуслови:** Основно знање о Azure-у, алатима командне линије и AI концептима

### Шта ћете научити

- **Основе AZD-а**: Разумевање инфраструктуре као кода са AZD-ом
- 🤖 **Интеграција AI услуга**: Примена Azure OpenAI, AI Search и других AI услуга
- **Примена контејнера**: Коришћење Azure Container Apps за AI апликације
- **Најбоље праксе за безбедност**: Имплементација Managed Identity и сигурних конфигурација
- **Праћење и видљивост**: Постављање Application Insights за AI радне оптерећења
- **Шаблони за производњу**: Стратегије примене спремне за предузећа

## Структура радионице

### Модул 1: Основе AZD-а (30 минута)
- Инсталирање и конфигурисање AZD-а
- Разумевање структуре AZD пројекта
- Ваша прва AZD примена
- **Лабораторија**: Примените једноставну веб апликацију

### Модул 2: Интеграција Azure OpenAI-а (45 минута)
- Постављање Azure OpenAI ресурса
- Стратегије примене модела
- Конфигурисање API приступа и аутентификације
- **Лабораторија**: Примените апликацију за ћаскање са GPT-4

### Модул 3: RAG апликације (45 минута)
- Интеграција Azure AI Search-а
- Обрада докумената са Azure Document Intelligence
- Векторске уградње и семантичка претрага
- **Лабораторија**: Направите систем за Q&A докумената

### Модул 4: Примена у производњи (30 минута)
- Конфигурација Container Apps-а
- Оптимизација скалирања и перформанси
- Праћење и логовање
- **Лабораторија**: Примените у производњу са видљивошћу

### Модул 5: Напредни шаблони (15 минута)
- Примене у више окружења
- Интеграција CI/CD-а
- Стратегије оптимизације трошкова
- **Закључак**: Контролна листа спремности за производњу

## Предуслови

### Потребни алати

Молимо вас да инсталирате ове алате пре радионице:

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

### Постављање Azure налога

1. **Azure претплата**: [Пријавите се бесплатно](https://azure.microsoft.com/free/)  
2. **Приступ Azure OpenAI-у**: [Затражите приступ](https://aka.ms/oai/access)  
3. **Потребне дозволе**:  
   - Улога Contributor на претплати или групи ресурса  
   - User Access Administrator (за RBAC доделе)

### Проверите предуслове

Покрените овај скрипт да проверите вашу конфигурацију:

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

## Материјали за радионицу

### Лабораторијске вежбе

Сваки модул укључује практичне лабораторије са почетним кодом и упутствима корак по корак:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Ваша прва AZD примена  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Апликација за ћаскање са Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG апликација са AI Search-ом  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Шаблони примене у производњи  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Напредни сценарији примене  

### Референтни материјали

- **[Водич за интеграцију AI Foundry-а](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Комплетни шаблони интеграције  
- **[Водич за примену AI модела](../docs/ai-foundry/ai-model-deployment.md)** - Најбоље праксе за примену модела  
- **[Практике за производњу AI-а](../docs/ai-foundry/production-ai-practices.md)** - Шаблони примене за предузећа  
- **[Водич за решавање проблема са AI](../docs/troubleshooting/ai-troubleshooting.md)** - Уобичајени проблеми и решења  

### Пример шаблона

Шаблони за брзи почетак за уобичајене AI сценарије:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Почетак

### Опција 1: GitHub Codespaces (Препоручено)

Најбржи начин за почетак радионице:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Опција 2: Локални развој

1. **Клонирајте репозиторијум радионице:**  
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Пријавите се на Azure:**  
```bash
az login
azd auth login
```

3. **Почните са лабораторијом 1:**  
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Опција 3: Радионица са инструктором

Ако присуствујете радионици са инструктором:

- 🎥 **Снимање радионице**: [Доступно на захтев](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord заједница**: [Придружите се за подршку уживо](https://aka.ms/foundry/discord)  
- **Повратне информације о радионици**: [Поделите своје искуство](https://aka.ms/azd-workshop-feedback)  

## Време радионице

### Учење сопственим темпом (3 сата)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Сесија са инструктором (2.5 сата)

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

## Критеријуми успеха

До краја ове радионице, бићете у могућности да:

✅ **Примените AI апликације** користећи AZD шаблоне  
✅ **Конфигуришете Azure OpenAI** услуге са одговарајућом безбедношћу  
✅ **Направите RAG апликације** са интеграцијом Azure AI Search-а  
✅ **Имплементирате шаблоне за производњу** за AI радне оптерећења у предузећима  
✅ **Пратите и решавате проблеме** у примени AI апликација  
✅ **Примените стратегије оптимизације трошкова** за AI радне оптерећења  

## Заједница и подршка

### Током радионице

- 🙋 **Питања**: Користите чет радионице или подигните руку  
- 🐛 **Проблеми**: Проверите [водич за решавање проблема](../docs/troubleshooting/ai-troubleshooting.md)  
- **Савети**: Поделите открића са другим учесницима  

### Након радионице

- 💬 **Discord**: [Azure AI Foundry заједница](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [Пријавите проблеме са шаблонима](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Повратне информације**: [Форма за евалуацију радионице](https://aka.ms/azd-workshop-feedback)  

## Следећи кораци

### Наставите учење

1. **Напредни сценарији**: Истражите [примене у више региона](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **Интеграција CI/CD-а**: Поставите [GitHub Actions токове рада](../docs/deployment/github-actions.md)  
3. **Прилагођени шаблони**: Направите своје [AZD шаблоне](../docs/getting-started/custom-templates.md)  

### Примените у својим пројектима

1. **Процена**: Користите нашу [контролну листу спремности](./production-readiness-checklist.md)  
2. **Шаблони**: Почните са нашим [AI специфичним шаблонима](../../../workshop/templates)  
3. **Подршка**: Придружите се [Azure AI Foundry Discord-у](https://aka.ms/foundry/discord)  

### Поделите свој успех

- ⭐ **Оцените репозиторијум** ако вам је радионица помогла  
- 🐦 **Поделите на друштвеним мрежама** са #AzureDeveloperCLI #AzureAI  
- 📝 **Напишите блог пост** о вашем путу примене AI-а  

---

## Повратне информације о радионици

Ваше повратне информације нам помажу да побољшамо искуство радионице:

| Аспект | Оцена (1-5) | Коментари |
|--------|--------------|----------|
| Квалитет садржаја | ⭐⭐⭐⭐⭐ | |
| Практичне лабораторије | ⭐⭐⭐⭐⭐ | |
| Документација | ⭐⭐⭐⭐⭐ | |
| Ниво тежине | ⭐⭐⭐⭐⭐ | |
| Укупно искуство | ⭐⭐⭐⭐⭐ | |

**Пошаљите повратне информације**: [Форма за евалуацију радионице](https://aka.ms/azd-workshop-feedback)

---

**Претходно:** [Водич за решавање проблема са AI](../docs/troubleshooting/ai-troubleshooting.md) | **Следеће:** Почните са [Лабораторијом 1: Основе AZD-а](../../../workshop/lab-1-azd-basics)

**Спремни да почнете са изградњом AI апликација уз AZD?**

[Почните лабораторију 1: Основе AZD-а →](./lab-1-azd-basics/README.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да превод буде тачан, молимо вас да имате у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод од стране људског преводиоца. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу произаћи из коришћења овог превода.