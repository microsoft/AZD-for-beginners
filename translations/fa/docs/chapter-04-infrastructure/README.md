# فصل ۴: زیرساخت به‌عنوان کد و استقرار

**📚 دوره**: [AZD For Beginners](../../README.md) | **⏱️ مدت زمان**: 1-1.5 hours | **⭐ پیچیدگی**: متوسط

---

## مروری کلی

این فصل الگوهای زیرساخت به‌عنوان کد (IaC) با قالب‌های Bicep، تأمین منابع و راهبردهای استقرار را با استفاده از Azure Developer CLI پوشش می‌دهد.

> تایید شده با `azd 1.25.6` در ژوئن 2026.

## اهداف یادگیری

با تکمیل این فصل، شما:
- درک ساختار و نحو قالب‌های Bicep
- تأمین منابع Azure با `azd provision`
- استقرار برنامه‌ها با `azd deploy`
- پیاده‌سازی استراتژی‌های استقرار Blue-Green و Rolling

---

## 📚 درس‌ها

| # | درس | توضیحات | زمان |
|---|--------|-------------|------|
| 1 | [تأمین منابع](provisioning.md) | مدیریت منابع Azure با AZD | 45 min |
| 2 | [راهنمای استقرار](deployment-guide.md) | راهبردهای استقرار برنامه | 45 min |
| 3 | [نوشتن قالب سفارشی](custom-templates.md) | ساخت و انتشار قالب‌های قابل استفاده مجدد azd | 30 min |

---

## 🚀 شروع سریع

```bash
# از قالب مقداردهی اولیه
azd init --template azure-functions-python-v2-http

# پیش‌نمایش آنچه ایجاد خواهد شد
azd provision --preview

# فقط فراهم‌سازی زیرساخت
azd provision

# فقط استقرار کد
azd deploy

# یا هر دو با هم
azd up
```

---

## 📁 ساختار پروژه AZD

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

## 🔧 دستورات ضروری

| دستور | توضیحات |
|---------|-------------|
| `azd init` | راه‌اندازی پروژه |
| `azd provision` | ایجاد منابع Azure |
| `azd deploy` | استقرار کد برنامه |
| `azd up` | ایجاد منابع + استقرار |
| `azd down` | حذف همه منابع |

---

## 🔗 ناوبری

| جهت | فصل |
|-----------|---------|
| **Previous** | [فصل 3: پیکربندی](../chapter-03-configuration/README.md) |
| **Next** | [فصل 5: راه‌حل‌های چندعاملی](../chapter-05-multi-agent/README.md) |

---

## 📖 منابع مرتبط

- [بررسی‌های پیش از استقرار](../chapter-06-pre-deployment/README.md)
- [نمونه‌های برنامه کانتینری](../../examples/container-app/README.md)
- [نمونه برنامه پایگاه‌داده](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->