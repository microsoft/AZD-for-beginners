# فصل ۷: عیب‌یابی و رفع مشکلات

**📚 دوره**: [AZD برای مبتدیان](../../README.md) | **⏱️ مدت زمان**: ۱-۱.۵ ساعت | **⭐ سطح دشواری**: متوسط

---

## مرور کلی

این فصل به شما در تشخیص و رفع مشکلات رایج هنگام کار با Azure Developer CLI کمک می‌کند. از شکست‌های استقرار تا مشکلات خاص هوش مصنوعی.

> راهنمایی‌های دستور با مرجع منتشر شده `azd 1.37.2` بررسی شده‌اند. استقرارهای ابری اجرا نشده‌اند. قبل از استفاده از دستورات، نام‌ها و شناسه‌های منابع نمونه را جایگزین کنید.

## اهداف یادگیری

با تکمیل این فصل، شما:
- شکست‌های رایج استقرار AZD را تشخیص می‌دهید
- مسائل احراز هویت و مجوزها را عیب‌یابی می‌کنید
- مشکلات اتصال سرویس‌های هوش مصنوعی را رفع می‌کنید
- از پرتال Azure و CLI برای عیب‌یابی استفاده می‌کنید

---

## 📚 درس‌ها

| شماره | درس | توضیح | زمان |
|---|--------|-------------|------|
| ۱ | [مسائل رایج](common-issues.md) | مشکلاتی که اغلب رخ می‌دهند | ۳۰ دقیقه |
| ۲ | [راهنمای عیب‌یابی](debugging.md) | راهبردهای گام به گام عیب‌یابی | ۴۵ دقیقه |
| ۳ | [عیب‌یابی هوش مصنوعی](ai-troubleshooting.md) | مشکلات خاص هوش مصنوعی | ۳۰ دقیقه |

---

## 🚨 رفع سریع مشکلات

### مشکلات احراز هویت
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### شکست‌های تامین منابع
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### تعارضات منابع
ابتدا خطاهای موجود در منابع و استقرار را بررسی کنید. برای رفع تضاد نام‌گذاری، محیط مشترک یا تولید را حذف نکنید. برای **محیط جدید و موقت** از یک نام یکتا استفاده کنید:

```bash
azd env new different-name
azd up
```

### تجاوز از سهمیه
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

تغییر `AZURE_LOCATION` منابع موجود را منتقل نمی‌کند و می‌تواند باعث تعارض موقعیت مکانی در استقرار مجدد شود.

---

## 📋 مرجع کدهای خطا

| خطا | علت | راه حل |
|-------|-------|----------|
| `AuthenticationError` | وارد نشده | `azd auth login` |
| `ResourceNotFound` | منبع گم‌شده | نام منابع را بررسی کنید |
| `QuotaExceeded` | محدودیت‌های اشتراک | درخواست افزایش سهمیه دهید |
| `InvalidTemplate` | خطای سینتکس Bicep | `az bicep build` |
| `Conflict` | منبع وجود دارد | از نام جدید استفاده کنید یا حذف کنید |
| `Forbidden` | مجوزهای ناکافی | نقش‌های RBAC را بررسی کنید |

---

## 🔄 بازنشانی و بازیابی

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

بازنشانی سخت داده‌ها را حذف می‌کند و ممکن است نقاط انتهایی را تغییر دهد. ابتدا نسخه پشتیبان بگیرید و اعلان‌های تعاملی حذف را مرور کنید. `--force --purge` فقط برای محیط‌های موقت و در صورت قصد حذف غیرقابل برگشت مناسب است.

---

## 🔗 ناوبری

| جهت | فصل |
|-----------|---------|
| **قبلی** | [فصل ۶: پیش از استقرار](../chapter-06-pre-deployment/README.md) |
| **بعدی** | [فصل ۸: تولید](../chapter-08-production/README.md) |

---

## 📖 منابع مرتبط

- [بررسی‌های پیش از استقرار](../chapter-06-pre-deployment/preflight-checks.md)
- [راهنمای پیکربندی](../chapter-03-configuration/configuration.md)
- [مسائل GitHub AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->