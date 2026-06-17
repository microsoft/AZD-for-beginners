# Chapter 7: Troubleshooting & Debugging

**📚 Course**: [AZD за почетнике](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Средњи

---

## Преглед

Ово поглавље вам помаже да дијагностикујете и решите често сусретане проблеме при раду са Azure Developer CLI. Од неуспелих распоређивања до специфичних проблема везаних за AI.

> Потврђено са `azd 1.25.6` у јуну 2026.

## Циљеви учења

По завршетку овог поглавља, ви ћете:
- Дијагностикујете уобичајене неуспехе при деплоју AZD
- Отстраните грешке при аутентификацији и проблеме са дозволама
- Решите проблеме повезаности AI сервиса
- Користите Azure портал и CLI за решавање проблема

---

## 📚 Лекције

| # | Лекција | Опис | Време |
|---|--------|-------------|------|
| 1 | [Уобичајени проблеми](common-issues.md) | Често наилажени проблеми | 30 min |
| 2 | [Водич за отклањање грешака](debugging.md) | Стратегије отклањања грешака корак по корак | 45 min |
| 3 | [Отклањање грешака за AI](ai-troubleshooting.md) | Проблеми специфични за AI | 30 min |

---

## 🚨 Брза решења

### Проблеми са аутентификацијом
```bash
# Потребно за AZD радне токове
azd auth login

# Опционо ако такође директно користите Azure CLI команде
az login

azd auth status
```

### Неуспеси при провизионисању
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Конфликти ресурса
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Квота премашена
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Референца кодова грешака

| Error | Cause | Solution |
|-------|-------|----------|
| `AuthenticationError` | Није пријављен | `azd auth login` |
| `ResourceNotFound` | Недостаје ресурс | Проверите имена ресурса |
| `QuotaExceeded` | Ограничења претплате | Захтевајте повећање квоте |
| `InvalidTemplate` | Синтаксна грешка у Bicep | `az bicep build` |
| `Conflict` | Ресурс постоји | Користите ново име или обришите |
| `Forbidden` | Недовољне дозволе | Проверите RBAC улоге |

---

## 🔄 Ресетовање и опоравак

```bash
# Меко ресетовање (задржати ресурсе, поново распоредити код)
azd deploy --force

# Тврдо ресетовање (обрисати све, почети изнова)
azd down --force --purge
azd up
```

---

## 🔗 Навигација

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Поглавље 6: Пре-распоређивање](../chapter-06-pre-deployment/README.md) |
| **Next** | [Поглавље 8: Продукција](../chapter-08-production/README.md) |

---

## 📖 Повезани ресурси

- [Провере пре распоређивања](../chapter-06-pre-deployment/preflight-checks.md)
- [Водич за конфигурацију](../chapter-03-configuration/configuration.md)
- [GitHub проблеми за AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->