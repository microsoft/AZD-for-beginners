# Поглавље 6: Планирање и валидација пре објављивања

**📚 Курс**: [AZD за почетнике](../../README.md) | **⏱️ Трајање**: 1 сат | **⭐ Комплексност**: Средњи

---

## Преглед

Ово поглавље покрива суштинске кораке планирања и валидације пре распореде ваше апликације. Научите како да избегнете скупе грешке уз правилно планирање капацитета, избор SKU-ова и прелетне (preflight) провере.

## Циљеви учења

Кроз ово поглавље ћете:
- Покренути прелетне провере пре распореда
- Планирати капацитет и проценити захтеве за ресурсима
- Одабрати одговарајуће SKU-ове за оптимизацију трошкова
- Конфигурисати Application Insights за надгледање
- Разумети моделe тимске координације

---

## 📚 Лекције

| # | Лекција | Опис | Време |
|---|--------|-------------|------|
| 1 | [Провере пре објављивања](preflight-checks.md) | Validate configuration before deployment | 15 мин |
| 2 | [Планирање капацитета](capacity-planning.md) | Estimate resource requirements | 20 мин |
| 3 | [Избор SKU-а](sku-selection.md) | Choose appropriate pricing tiers | 15 мин |
| 4 | [Application Insights](application-insights.md) | Configure monitoring | 20 мин |
| 5 | [Шаблони координације](coordination-patterns.md) | Team deployment workflows | 15 мин |

---

## 🚀 Брзи почетак

```bash
# Проверите квоте претплате
az vm list-usage --location eastus --output table

# Преглед распоређивања (без креирања ресурса)
azd provision --preview

# Проверите синтаксу Bicep-а
az bicep build --file infra/main.bicep

# Проверите конфигурацију окружења
azd env get-values
```

---

## ☑️ Контролна листа пре објављивања

### Before `azd provision`

- [ ] Квота проверена за регион
- [ ] Изабрани одговарајући SKU-ови
- [ ] Процењени трошкови прегледани
- [ ] Конвенција именовања усклађена
- [ ] Безбедност/RBAC конфигурисана

### Before `azd deploy`

- [ ] Постављене променљиве окружења
- [ ] Тајне у Key Vault-у
- [ ] Низови за повезивање проверени
- [ ] Провере здравља конфигурисане

---

## 💰 Водич за избор SKU-а

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Навигација

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Поглавље 5: Мулти-агент](../chapter-05-multi-agent/README.md) |
| **Next** | [Поглавље 7: Решавање проблема](../chapter-07-troubleshooting/README.md) |

---

## 📖 Повезани ресурси

- [Водич за конфигурацију](../chapter-03-configuration/configuration.md)
- [Водич за распоређивање](../chapter-04-infrastructure/deployment-guide.md)
- [Чести проблеми](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање од одговорности**:
Овај документ је преведен помоћу услуге превођења помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, имајте на уму да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на свом изворном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или за погрешна тумачења која произилазе из употребе овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->