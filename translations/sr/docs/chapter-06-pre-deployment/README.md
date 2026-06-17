# Поглавље 6: Планирање и верификација пре распоређивања

**📚 Course**: [AZD за почетнике](../../README.md) | **⏱️ Duration**: 1 сат | **⭐ Complexity**: Средњи

---

## Преглед

Ово поглавље обухвата суштинске кораке планирања и верификације пре него што распоредите вашу апликацију. Научите како да избегнете скупе грешке уз правилно планирање капацитета, избор SKU-ова и предполетне провере.

> Верификовано са `azd 1.25.6` у јуну 2026.

## Циљеви учења

По завршетку овог поглавља, ви ћете:
- Извршити preflight провере пре распореда
- Планирати капацитет и проценити потребе за ресурсима
- Одабрати одговарајуће SKU-ове за оптимизацију трошкова
- Конфигурисати Application Insights за надзор
- Разумети обрасце координације тима

---

## 📚 Лекције

| # | Лекција | Опис | Време |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Верификовати конфигурацију пре распореда | 15 мин |
| 2 | [Capacity Planning](capacity-planning.md) | Проценити потребе за ресурсима | 20 мин |
| 3 | [SKU Selection](sku-selection.md) | Одабрати одговарајуће ценовне нивое | 15 мин |
| 4 | [Application Insights](application-insights.md) | Конфигурисати надзор | 20 мин |
| 5 | [Coordination Patterns](coordination-patterns.md) | Радни токови тима за распореде | 15 мин |

---

## 🚀 Брзи старт

```bash
# Проверите квоте претплате
az vm list-usage --location eastus --output table

# Преглед распоређивања (ресурси нису креирани)
azd provision --preview

# Проверите синтаксу Bicep-а
az bicep build --file infra/main.bicep

# Проверите конфигурацију окружења
azd env get-values
```

---

## ☑️ Контролна листа пре распореда

### Пре `azd provision`

- [ ] Квота проверена за регион
- [ ] SKU-ови одабрани правилно
- [ ] Прегледана процена трошкова
- [ ] Конвенција именовања усклађена
- [ ] Безбедност/RBAC конфигурисана

### Пре `azd deploy`

- [ ] Постављене променљиве окружења
- [ ] Тајне у Key Vault-у
- [ ] Проверени низови за повезивање
- [ ] Провере здравља конфигурисане

---

## 💰 Водич за избор SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Навигација

| Смер | Поглавље |
|-----------|---------|
| **Претходно** | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Следеће** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 Повезани ресурси

- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- [Common Issues](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->