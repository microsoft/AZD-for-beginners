# فصل ۴: زیرساخت به‌عنوان کد و استقرار

**📚 دوره**: [AZD برای مبتدیان](../../README.md) | **⏱️ مدت زمان**: ۲-۳ ساعت مطالعه؛ زمان اضافی برای تمرین‌های استقرار در نظر گرفته شود | **⭐ پیچیدگی**: متوسط

---

## مروری کلی

این فصل الگوهای زیرساخت به‌عنوان کد (IaC) با قالب‌های Bicep، تأمین منابع و استراتژی‌های استقرار با استفاده از Azure Developer CLI را پوشش می‌دهد.

> هدف بررسی دستورات و پیکربندی: `azd 1.37.2` (نوامبر ۲۰۲۶). در طول بررسی تأمین منابع زنده Azure اجرا نشده است.

## اهداف یادگیری

با انجام این فصل، شما خواهید:
- ساختار و نگارش قالب Bicep را درک کنید
- تأمین منابع Azure با `azd provision`
- استقرار برنامه‌ها با `azd deploy`
- پیاده‌سازی استراتژی‌های استقرار blue-green و rolling

---

## 📚 درس‌ها

| # | درس | توضیحات | زمان |
|---|--------|-------------|------|
| 1 | [تأمین منابع](provisioning.md) | مدیریت منابع Azure با AZD | ۴۵ دقیقه |
| 2 | [راهنمای استقرار](deployment-guide.md) | استراتژی‌های استقرار برنامه | ۴۵ دقیقه |
| 3 | [نویسندگی قالب خود](custom-templates.md) | ساخت و انتشار قالب‌های قابل استفاده مجدد azd | ۳۰ دقیقه |

---

## 🚀 شروع سریع

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
| `azd init` | مقداردهی اولیه پروژه |
| `azd provision` | ایجاد منابع Azure |
| `azd deploy` | استقرار کد برنامه |
| `azd up` | تأمین + استقرار |
| `azd down` | حذف همه منابع |

---

## 🔗 پیمایش

| جهت | فصل |
|-----------|---------|
| **قبلی** | [فصل ۳: پیکربندی](../chapter-03-configuration/README.md) |
| **بعدی** | [فصل ۵: راه‌حل‌های چندعاملی](../chapter-05-multi-agent/README.md) |

---

## 📖 منابع مرتبط

- [بررسی‌های پیش از استقرار](../chapter-06-pre-deployment/README.md)
- [نمونه‌های برنامه Container App](../../examples/container-app/README.md)
- [نمونه برنامه دیتابیس](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->