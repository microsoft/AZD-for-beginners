# فصل ۷: عیب‌یابی و رفع اشکال

**📚 Course**: [AZD برای مبتدیان](../../README.md) | **⏱️ Duration**: ۱–۱.۵ ساعت | **⭐ Complexity**: متوسط

---

## مرور کلی

این فصل به شما کمک می‌کند تا مسائل رایج هنگام کار با Azure Developer CLI را تشخیص داده و حل کنید. از شکست‌های استقرار تا مشکلات خاص هوش مصنوعی.

> اعتبارسنجی شده با `azd 1.25.6` در ژوئن ۲۰۲۶.

## اهداف یادگیری

با تکمیل این فصل، شما:
- شناسایی شکست‌های رایج استقرار AZD
- عیب‌یابی مشکلات احراز هویت و دسترسی‌ها
- رفع مشکلات اتصال سرویس‌های هوش مصنوعی
- استفاده از Azure Portal و CLI برای عیب‌یابی

---

## 📚 درس‌ها

| # | درس | توضیح | زمان |
|---|--------|-------------|------|
| 1 | [مسائل رایج](common-issues.md) | مشکلاتی که اغلب مشاهده می‌شوند | ۳۰ دقیقه |
| 2 | [راهنمای عیب‌یابی](debugging.md) | استراتژی‌های گام‌به‌گام برای رفع اشکال | ۴۵ دقیقه |
| 3 | [عیب‌یابی AI](ai-troubleshooting.md) | مسائل خاص هوش مصنوعی | ۳۰ دقیقه |

---

## 🚨 رفع سریع مشکلات

### مشکلات احراز هویت
```bash
# برای گردش‌کارهای AZD لازم است
azd auth login

# اختیاری است اگر مستقیماً از دستورات Azure CLI نیز استفاده می‌کنید
az login

azd auth status
```

### خطاهای پروویژن
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### تعارض منابع
```bash
azd down --force --purge
azd env new different-name
azd up
```

### تجاوز از سهمیه
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 مرجع کدهای خطا

| خطا | علت | راه‌حل |
|-------|-------|----------|
| `AuthenticationError` | ورود انجام نشده | `azd auth login` |
| `ResourceNotFound` | منبع موجود نیست | نام منابع را بررسی کنید |
| `QuotaExceeded` | محدودیت‌های اشتراک | درخواست افزایش سهمیه |
| `InvalidTemplate` | خطای نحو Bicep | `az bicep build` |
| `Conflict` | منبع وجود دارد | از نام جدید استفاده کنید یا آن را حذف کنید |
| `Forbidden` | مجوزهای ناکافی | نقش‌های RBAC را بررسی کنید |

---

## 🔄 بازنشانی و بازیابی

```bash
# بازنشانی نرم (حفظ منابع، استقرار مجدد کد)
azd deploy --force

# بازنشانی سخت (حذف همه‌چیز، شروع از نو)
azd down --force --purge
azd up
```

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
- [گزارش‌های GitHub مربوط به AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->