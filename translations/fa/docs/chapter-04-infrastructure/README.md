# فصل 4: زیرساخت به عنوان کد و استقرار

**📚 Course**: [AZD برای مبتدیان](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: متوسط

---

## مرور کلی

این فصل الگوهای Infrastructure as Code (IaC) با قالب‌های Bicep، تهیه منابع و استراتژی‌های استقرار را با استفاده از Azure Developer CLI پوشش می‌دهد.

> اعتبارسنجی شده با `azd 1.23.12` در مارس 2026.

## اهداف یادگیری

با تکمیل این فصل، شما:
- ساختار و نحو قالب‌های Bicep را می‌فهمید
- ایجاد منابع Azure با `azd provision`
- استقرار برنامه‌ها با `azd deploy`
- پیاده‌سازی استراتژی‌های استقرار blue-green و rolling

---

## 📚 دروس

| # | درس | توضیحات | زمان |
|---|--------|-------------|------|
| 1 | [تأمین منابع](provisioning.md) | مدیریت منابع Azure با AZD | 45 دقیقه |
| 2 | [راهنمای استقرار](deployment-guide.md) | استراتژی‌های استقرار برنامه | 45 دقیقه |

---

## 🚀 شروع سریع

```bash
# مقداردهی اولیه از قالب
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

| دستور | توضیح |
|---------|-------------|
| `azd init` | راه‌اندازی اولیه پروژه |
| `azd provision` | ایجاد منابع Azure |
| `azd deploy` | استقرار کد برنامه |
| `azd up` | ایجاد + استقرار |
| `azd down` | حذف تمام منابع |

---

## 🔗 ناوبری

| جهت | فصل |
|-----------|---------|
| **قبلی** | [فصل 3: پیکربندی](../chapter-03-configuration/README.md) |
| **بعدی** | [فصل 5: راهکارهای چندعاملی](../chapter-05-multi-agent/README.md) |

---

## 📖 منابع مرتبط

- [بررسی‌های پیش از استقرار](../chapter-06-pre-deployment/README.md)
- [نمونه‌های برنامه کانتینری](../../examples/container-app/README.md)
- [نمونه برنامه پایگاه‌داده](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
این سند با استفاده از سرویس ترجمهٔ ماشینی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما برای دقت تلاش می‌کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. نسخهٔ اصلی سند به زبان بومی آن باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیت نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->