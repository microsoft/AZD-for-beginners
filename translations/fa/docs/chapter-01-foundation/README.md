# فصل ۱: پایه و شروع سریع

**📚 دوره**: [AZD برای مبتدیان](../../README.md) | **⏱️ مدت زمان**: ۷۵-۱۲۰ دقیقه شامل اولین استقرار؛ تمرینات اضافی زمان بیشتری می‌برد | **⭐ پیچیدگی**: مبتدی

---

## مرور کلی

این فصل اصول اولیه Azure Developer CLI (azd) را معرفی می‌کند. شما مفاهیم اصلی را یاد می‌گیرید، ابزارها را نصب می‌کنید و اولین برنامه خود را در Azure مستقر می‌کنید.

> هدف بازبینی فرمان و پیکربندی: `azd 1.37.2` (نوامبر ۲۰۲۶). تأمین زنده Azure در زمان بازبینی اجرا نشده است.

## اهداف یادگیری

با تکمیل این فصل، شما:
- درک می‌کنید Azure Developer CLI چیست و چگونه با Azure CLI تفاوت دارد
- AZD را روی پلتفرم خود نصب و پیکربندی می‌کنید
- اولین برنامه خود را با `azd up` در Azure مستقر می‌کنید
- منابع را با `azd down` پاکسازی می‌کنید

---

## 📚 درس‌ها

| شماره | درس | توضیحات | زمان |
|---|--------|-------------|------|
| ۱ | [مبانی AZD](azd-basics.md) | مفاهیم اصلی، اصطلاحات و ساختار پروژه | ۱۵ دقیقه |
| ۲ | [نصب و راه‌اندازی](installation.md) | راهنمای نصب مخصوص پلتفرم | ۱۰ دقیقه |
| ۳ | [اولین پروژه شما](first-project.md) | عملی: استقرار یک برنامه وب در Azure | ۲۰ دقیقه |
| ۴ | [افزودن برنامه خود](bring-your-own-app.md) | افزودن azd به پروژه موجود | ۱۵ دقیقه |
| ۵ | [کانتینرهای توسعه و Codespaces](dev-containers.md) | محیط‌های تکرارشونده azd با کانتینرهای توسعه | ۱۵ دقیقه |

---

## ✅ شروع اینجا: اعتبارسنجی تنظیمات شما

قبل از شروع، اطمینان حاصل کنید که ماشین محلی شما آماده قالب فصل ۱ است:

**ویندوز:**
```powershell
.\validate-setup.ps1
```

**macOS / لینوکس:**
```bash
bash ./validate-setup.sh
```

اگر اسکریپت ابزارهای مفقود را گزارش داد، ابتدا آنها را رفع کنید و سپس فصل را ادامه دهید.

---

## 🚀 شروع سریع

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ معیارهای موفقیت

پس از تکمیل این فصل، شما باید بتوانید:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 ناوبری

| جهت | فصل |
|-----------|---------|
| **بعدی** | [فصل ۲: توسعه هوش مصنوعی-محور](../chapter-02-ai-development/README.md) |
| **پرش به** | [فصل ۳: پیکربندی](../chapter-03-configuration/README.md) |

---

## 📖 منابع مرتبط

- [برگه تقلب دستورات](../../resources/cheat-sheet.md)
- [پرسش‌های متداول](../../resources/faq.md)
- [واژه‌نامه](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->