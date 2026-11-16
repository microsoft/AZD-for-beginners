# Поглавље 4: Инфраструктура као код & Деплојмент

**📚 Курс**: [AZD за почетнике](../../README.md) | **⏱️ Трајање**: 2-3 сата читања; оставите додатно време за вежбе деплојмента | **⭐ Сложеност**: Средњи ниво

---

## Преглед

Ово поглавље покрива шаблоне Infrastructure as Code (IaC) са Bicep шаблонима, обезбеђивање ресурса и стратегије деплојмента користећи Azure Developer CLI.

> Циљ прегледа команди и конфигурација: `azd 1.37.2` (новембар 2026). Ливе Azure обезбеђење није извршено током прегледа.

## Циљеви учења

Завршетком овог поглавља ћете:
- Разумети структуру и синтаксу Bicep шаблона
- Обезбедити Azure ресурсе са `azd provision`
- Деплојовати апликације са `azd deploy`
- Имплементирати blue-green и rolling стратегије деплојмента

---

## 📚 Лекције

| # | Лекција | Опис | Време |
|---|--------|-------------|------|
| 1 | [Обезбеђивање ресурса](provisioning.md) | Управљање Azure ресурсима са AZD | 45 мин |
| 2 | [Водич за деплојмент](deployment-guide.md) | Стратегије деплојмента апликација | 45 мин |
| 3 | [Ауторски шаблон](custom-templates.md) | Креирање и објава поновно употребљивих azd шаблона | 30 мин |

---

## 🚀 Брзи почетак

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 Структура AZD пројекта

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Основне команде

| Команда | Опис |
|---------|-------------|
| `azd init` | Иницијализуј пројекат |
| `azd provision` | Креирај Azure ресурсе |
| `azd deploy` | Деплојуј код апликације |
| `azd up` | обезбеђивање + деплојм |
| `azd down` | Обриши све ресурсе |

---

## 🔗 Навигација

| Правец | Поглавље |
|-----------|---------|
| **Претходно** | [Поглавље 3: Конфигурација](../chapter-03-configuration/README.md) |
| **Следеће** | [Поглавље 5: Мулти-Агент решења](../chapter-05-multi-agent/README.md) |

---

## 📖 Повезани ресурси

- [Провере пре деплојмента](../chapter-06-pre-deployment/README.md)
- [Примери Container App](../../examples/container-app/README.md)
- [Пример базе података апликације](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->