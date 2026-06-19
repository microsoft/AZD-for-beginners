# فصل 2: توسعه مبتنی بر هوش مصنوعی

**📚 دوره**: [AZD For Beginners](../../README.md) | **⏱️ مدت**: 1-2 ساعت | **⭐ پیچیدگی**: متوسط

---

## بررسی اجمالی

این فصل بر استقرار برنامه‌های توانمند شده با هوش مصنوعی با استفاده از Azure Developer CLI و سرویس‌های Microsoft Foundry تمرکز دارد. از برنامه‌های ساده چت هوش مصنوعی تا عامل‌های هوشمند مجهز به ابزارها.

> **یادداشت اعتبارسنجی (2026-06-15):** جریان دستور و راهنمایی افزونه در این فصل در مقایسه با `azd` `1.25.6` و انتشار پیش‌نمایش فعلی افزونه عامل هوش مصنوعی `azure.ai.agents` `0.1.40-preview` بررسی شده‌اند. اگر روی یک نسخه قدیمی‌تر AZD هستید، ابتدا به‌روزرسانی کنید و سپس تمرین‌ها را ادامه دهید.

## اهداف یادگیری

با تکمیل این فصل، شما:
- استقرار برنامه‌های هوش مصنوعی با استفاده از الگوهای از پیش‌ساخته AZD
- درک یکپارچگی Microsoft Foundry با AZD
- پیکربندی و سفارشی‌سازی عامل‌های هوش مصنوعی با ابزارها
- استقرار برنامه‌های RAG (تولید تقویت‌شده با بازیابی)

---

## 📚 دروس

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | اتصال AZD به سرویس‌های Foundry | 30 min |
| 2 | [AI Agents Guide](agents.md) | استقرار عامل‌های هوشمند با ابزارها | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | استقرار و پیکربندی مدل‌های هوش مصنوعی | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | کار عملی: آماده‌سازی راهکار هوش مصنوعی شما برای AZD | 60 min |

---

## 🚀 شروع سریع

```bash
# گزینه ۱: اپلیکیشن چت RAG
azd init --template azure-search-openai-demo
azd up

# گزینه ۲: عامل‌های هوش مصنوعی
azd init --template get-started-with-ai-agents
azd up

# گزینه ۳: اپلیکیشن چت سریع
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 الگوهای برجسته هوش مصنوعی

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | گفتگوی RAG با ارجاع‌ها | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | عامل هوش مصنوعی با ابزارها | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | چت پایه‌ای هوش مصنوعی | OpenAI + Container Apps |

---

## 💰 آگاهی از هزینه

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**نکته:** پس از آزمایش برای جلوگیری از هزینه‌ها، `azd down` را اجرا کنید.

---

## 🔗 ناوبری

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Next** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Skip to** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 منابع مرتبط

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->