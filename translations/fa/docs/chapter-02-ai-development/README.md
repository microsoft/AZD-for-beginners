# فصل 2: توسعه با محوریت هوش مصنوعی

**📚 Course**: [AZD برای مبتدیان](../../README.md) | **⏱️ Duration**: ۱–۲ ساعت | **⭐ Complexity**: متوسط

---

## مرور کلی

این فصل بر استقرار برنامه‌های مبتنی بر هوش مصنوعی با استفاده از Azure Developer CLI و خدمات Microsoft Foundry تمرکز دارد. از برنامه‌های چت ساده تا عامل‌های هوشمند مجهز به ابزارها.

> **یادداشت اعتبارسنجی (2026-03-25):** جریان دستورات و راهنمایی‌های افزونه در این فصل با `azd` `1.23.12` و نسخه پیش‌نمایش فعلی افزونه عامل هوش مصنوعی `azure.ai.agents` `0.1.18-preview` بررسی شده‌اند. اگر از نسخه قدیمی‌تری از AZD استفاده می‌کنید، ابتدا به‌روزرسانی کنید و سپس با تمرین‌ها ادامه دهید.

## اهداف یادگیری

با تکمیل این فصل، شما قادر خواهید بود:
- استقرار برنامه‌های هوش مصنوعی با استفاده از قالب‌های آماده AZD
- درک یکپارچه‌سازی Microsoft Foundry با AZD
- پیکربندی و سفارشی‌سازی عامل‌های هوش مصنوعی با ابزارها
- استقرار برنامه‌های RAG (تولید تقویت‌شده با بازیابی)

---

## 📚 درس‌ها

| # | درس | توضیحات | زمان |
|---|--------|-------------|------|
| 1 | [یکپارچه‌سازی Microsoft Foundry](microsoft-foundry-integration.md) | اتصال AZD به سرویس‌های Foundry | ۳۰ دقیقه |
| 2 | [راهنمای عامل‌های هوش مصنوعی](agents.md) | استقرار عامل‌های هوشمند با ابزارها | ۴۵ دقیقه |
| 3 | [استقرار مدل‌های هوش مصنوعی](ai-model-deployment.md) | استقرار و پیکربندی مدل‌های هوش مصنوعی | ۳۰ دقیقه |
| 4 | [کارگاه عملی هوش مصنوعی](ai-workshop-lab.md) | عملی: آماده‌سازی راهکار هوش مصنوعی شما برای AZD | ۶۰ دقیقه |

---

## 🚀 شروع سریع

```bash
# گزینهٔ ۱: اپلیکیشن چت RAG
azd init --template azure-search-openai-demo
azd up

# گزینهٔ ۲: عامل‌های هوش مصنوعی
azd init --template get-started-with-ai-agents
azd up

# گزینهٔ ۳: اپلیکیشن چت سریع
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 قالب‌های برجسته هوش مصنوعی

| قالب | توضیحات | سرویس‌ها |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | چت RAG با ارجاعات | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | عامل هوش مصنوعی با ابزارها | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | چت پایه‌ای هوش مصنوعی | OpenAI + Container Apps |

---

## 💰 آگاهی از هزینه‌ها

| محیط | هزینه ماهیانهٔ تخمینی |
|-------------|----------------------|
| توسعه | $80-150 |
| پیش‌تولید | $150-300 |
| تولید | $300-3,500+ |

**نکته:** پس از آزمایش برای جلوگیری از هزینه‌ها دستور `azd down` را اجرا کنید.

---

## 🔗 ناوبری

| جهت | فصل |
|-----------|---------|
| **قبلی** | [فصل 1: مبانی](../chapter-01-foundation/README.md) |
| **بعدی** | [فصل 3: پیکربندی](../chapter-03-configuration/README.md) |
| **پرش به** | [فصل 8: الگوهای تولید](../chapter-08-production/README.md) |

---

## 📖 منابع مرتبط

- [عیب‌یابی هوش مصنوعی](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [شیوه‌های تولید در هوش مصنوعی](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است.
در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند.
نسخهٔ اصلی سند به زبان بومی آن باید به‌عنوان منبع معتبر در نظر گرفته شود.
برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود.
ما در قبال هرگونه سوءتفاهم یا تفسیر نادرستی که ناشی از استفاده از این ترجمه باشد، مسئول نیستیم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->