# Поглавље 3: Конфигурација и Аутентификација

**📚 Курс**: [AZD За почетнике](../../README.md) | **⏱️ Трајање**: 90-150 минута укључујући праксу интеграције | **⭐ Комплексност**: Средњи ниво

---

## Преглед

Ово поглавље обухвата конфигурацију окружења, шаблоне аутентификације и најбоље праксе безбедности за Azure Developer CLI имплементације.

> Циљ прегледа команди и конфигурације: `azd 1.37.2` (новембар 2026). Претходна Azure провизионисања нису извршавана током прегледа.

## Циљеви учења

Завршетком овог поглавља, ви ћете:
- Савладати хијерархију AZD конфигурације
- Управљати више окружења (dev, staging, prod)
- Имплементирати безбедну аутентикацију са управљаним идентитетима
- Конфигурисати подешавања специфична за окружење

---

## 📚 Лекције

| # | Лекција | Опис | Време |
|---|--------|-------------|------|
| 1 | [Водич за конфигурацију](configuration.md) | Постављање и управљање окружењем | 30 мин |
| 2 | [Аутентикација и безбедност](authsecurity.md) | Управљани идентитет и РБАЦ шаблони | 30 мин |

---

## 🚀 Брзи почетак

Покрените из корена **већ иницијализоване azd апликације**, а не са репозиторијума курса. Користите неискоришћена имена окружења ако она већ постоје.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` је илустративно: утиче на инфраструктуру само ако га ваш шаблон експлицитно користи. Обичне `azd env set` вредности се чувају локално у простом тексту; оне нису сигурно безбедно складиште тајни.

---

## 🔧 Хијерархија конфигурације

Одржавајте три различите површине конфигурације одвојене: глобалне преференције (`azd config`), структура пројекта (`azure.yaml`) и вредности по окружењу (`azd env`). Флагови преовлађују само над подешавањима која заиста подржавају; не постоји универзално пребацивање произвољних променљивих окружења преко `azure.yaml` или Bicep.

---

## 🔐 Најбоље праксе безбедности

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Навигација

| Смер | Поглавље |
|-----------|---------|
| **Претходно** | [Поглавље 2: Развој AI](../chapter-02-ai-development/README.md) |
| **Следеће** | [Поглавље 4: Инфраструктура](../chapter-04-infrastructure/README.md) |

---

## 📖 Повезани ресурси

- [Провере пре имплементације](../chapter-06-pre-deployment/README.md)
- [Решавање проблема](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->