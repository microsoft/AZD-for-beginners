# فصل ۳: پیکربندی و احراز هویت

**📚 دوره**: [AZD برای مبتدی‌ها](../../README.md) | **⏱️ مدت زمان**: ۹۰-۱۵۰ دقیقه شامل تمرین‌های یکپارچه‌سازی | **⭐ پیچیدگی**: متوسط

---

## مرور کلی

این فصل به پیکربندی محیط، الگوهای احراز هویت و بهترین شیوه‌های امنیتی برای پیاده‌سازی‌های Azure Developer CLI می‌پردازد.

> هدف بررسی دستورات و پیکربندی: `azd 1.37.2` (نوامبر ۲۰۲۶). در زمان بررسی، تامین زنده Azure اجرا نشد.

## اهداف یادگیری

با تکمیل این فصل، شما قادر خواهید بود:
- تسلط بر سلسله مراتب پیکربندی AZD
- مدیریت چند محیط (توسعه، تست، تولید)
- پیاده‌سازی احراز هویت امن با هویت‌های مدیریت‌شده
- پیکربندی تنظیمات مخصوص هر محیط

---

## 📚 درس‌ها

| شماره | درس | توضیحات | زمان |
|---|--------|-------------|------|
| ۱ | [راهنمای پیکربندی](configuration.md) | راه‌اندازی و مدیریت محیط | ۳۰ دقیقه |
| ۲ | [احراز هویت و امنیت](authsecurity.md) | الگوهای هویت مدیریت‌شده و RBAC | ۳۰ دقیقه |

---

## 🚀 شروع سریع

از ریشه یک **برنامه azd که قبلاً مقداردهی اولیه شده است** اجرا کنید، نه از مخزن دوره. اگر این محیط‌ها وجود دارند، نام‌های محیط استفاده نشده را انتخاب کنید.

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

`SKU_NAME` مثالی است: فقط در صورتی که قالب شما به‌صراحت از آن استفاده کند، زیرساخت را تحت تاثیر قرار می‌دهد. مقادیر معمولی `azd env set` به‌صورت متن ساده به‌صورت محلی ذخیره می‌شوند؛ این‌ها ذخیره‌سازی اسرار امن نیستند.

---

## 🔧 سلسله مراتب پیکربندی

سه سطح مختلف پیکربندی را جدا نگه دارید: تنظیمات سراسری (`azd config`)، ساختار پروژه (`azure.yaml`) و مقادیر هر محیط (`azd env`). فلگ‌ها فقط تنظیماتی را که پشتیبانی می‌کنند بازنویسی می‌کنند؛ هیچ پوشش کلی از متغیرهای محیطی دلخواه روی `azure.yaml` یا Bicep وجود ندارد.

---

## 🔐 بهترین شیوه‌های امنیتی

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

## 🔗 ناوبری

| جهت | فصل |
|-----------|---------|
| **قبلی** | [فصل ۲: توسعه هوش مصنوعی](../chapter-02-ai-development/README.md) |
| **بعدی** | [فصل ۴: زیرساخت](../chapter-04-infrastructure/README.md) |

---

## 📖 منابع مرتبط

- [بررسی‌های پیش از استقرار](../chapter-06-pre-deployment/README.md)
- [رفع اشکال](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->