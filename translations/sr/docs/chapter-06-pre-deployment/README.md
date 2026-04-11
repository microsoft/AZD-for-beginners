# Chapter 6: Pre-Deployment Planning & Validation

**📚 Course**: [AZD за почетнике](../../README.md) | **⏱️ Duration**: 1 hour | **⭐ Complexity**: Средњи

---

## Overview

Ово поглавље обухвата основне кораке планирања и валидације пре распоређивања ваше апликације. Научите како да избегнете скупе грешке уз правилно планирање капацитета, избор SKU-ова и проверу пре лета.

> Проверено са `azd 1.23.12` у марту 2026.

## Learning Objectives

Показавши ово поглавље, ви ћете:
- Покренути preflight провере пре распоређивања
- Планирати капацитет и проценити захтеве за ресурсима
- Одабрати одговарајуће SKU-ове за оптимизацију трошкова
- Конфигурисати Application Insights за праћење
- Разумети образце координације тима

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Провере пре распоређивања](preflight-checks.md) | Валидирајте конфигурацију пре распоређивања | 15 мин |
| 2 | [Планирање капацитета](capacity-planning.md) | Процените захтеве за ресурсима | 20 мин |
| 3 | [Избор SKU](sku-selection.md) | Одаберите одговарајуће ценовне нивое | 15 мин |
| 4 | [Application Insights](application-insights.md) | Конфигуришите мониторинг | 20 мин |
| 5 | [Обрасци координације](coordination-patterns.md) | Радни токови тима за распоређивање | 15 мин |

---

## 🚀 Quick Start

```bash
# Провери квоте претплате
az vm list-usage --location eastus --output table

# Преглед распоређивања (ресурси се неће креирати)
azd provision --preview

# Провери синтаксу Bicep-а
az bicep build --file infra/main.bicep

# Провери конфигурацију окружења
azd env get-values
```

---

## ☑️ Pre-Deployment Checklist

### Before `azd provision`

- [ ] Квота проверена за регион
- [ ] SKU-ови одабрани правилно
- [ ] Процена трошкова прегледана
- [ ] Конвенција именовања доследна
- [ ] Безбедност/RBAC конфигурисана

### Before `azd deploy`

- [ ] Променљиве окружења подешене
- [ ] Тајне у Key Vault
- [ ] Проверени низови за повезивање
- [ ] Провере стања (health checks) конфигурисане

---

## 💰 SKU Selection Guide

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Поглавље 5: Мулти-агент](../chapter-05-multi-agent/README.md) |
| **Next** | [Поглавље 7: Решавање проблема](../chapter-07-troubleshooting/README.md) |

---

## 📖 Related Resources

- [Водич за конфигурацију](../chapter-03-configuration/configuration.md)
- [Водич за распоређивање](../chapter-04-infrastructure/deployment-guide.md)
- [Чести проблеми](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Искључење одговорности**:
Овај документ је преведен уз помоћ услуге за превод помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да будемо прецизни, имајте у виду да аутоматизовани преводи могу да садрже грешке или нетачности. Оригинални документ на оригиналном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешне тумачења која проистичу из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->