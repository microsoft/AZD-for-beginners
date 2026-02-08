# فصل 8: الگوهای تولید و سازمانی

**📚 دوره**: [AZD For Beginners](../../README.md) | **⏱️ مدت زمان**: 2-3 ساعت | **⭐ سطح دشواری**: پیشرفته

---

## مرور کلی

این فصل الگوهای استقرار آماده سازمان، تقویت امنیت، مانیتورینگ و بهینه‌سازی هزینه را برای بارهای کاری AI در محیط تولید پوشش می‌دهد.

## اهداف آموزشی

با تکمیل این فصل، شما:
- استقرار برنامه‌های مقاوم در چند منطقه را انجام خواهید داد
- الگوهای امنیتی سازمانی را پیاده‌سازی خواهید کرد
- مانیتورینگ جامع را پیکربندی خواهید کرد
- هزینه‌ها را در مقیاس بهینه‌سازی خواهید کرد
- خط لوله‌های CI/CD را با AZD راه‌اندازی خواهید کرد

---

## 📚 درس‌ها

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Production AI Practices](production-ai-practices.md) | الگوهای استقرار سازمانی | 90 دقیقه |

---

## 🚀 چک‌لیست تولید

- [ ] استقرار در چند منطقه برای تحمل خطا
- [ ] شناسهٔ مدیریت‌شده برای احراز هویت (بدون کلید)
- [ ] Application Insights برای مانیتورینگ
- [ ] بودجه‌ها و هشدارهای هزینه پیکربندی شده
- [ ] اسکن امنیتی فعال
- [ ] ادغام خط لوله CI/CD
- [ ] برنامهٔ بازیابی در شرایط فاجعه

---

## 🏗️ الگوهای معماری

### الگو 1: ریزسرویس‌های AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### الگو 2: AI مبتنی بر رویداد

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 بهترین شیوه‌های امنیتی

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 بهینه‌سازی هزینه

| Strategy | Savings |
|----------|---------|
| Scale to zero (Container Apps) | 60-80% |
| Use consumption tiers for dev | 50-70% |
| Scheduled scaling | 30-50% |
| Reserved capacity | 20-40% |

```bash
# هشدارهای بودجه را تنظیم کنید
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 تنظیمات مانیتورینگ

```bash
# جریان لاگ‌ها
azd monitor --logs

# Application Insights را بررسی کنید
azd monitor

# مشاهده معیارها
az monitor metrics list --resource <resource-id>
```

---

## 🔗 ناوبری

| Direction | Chapter |
|-----------|---------|
| **قبلی** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |
| **پایان دوره** | [Course Home](../../README.md) |

---

## 📖 منابع مرتبط

- [AI Agents Guide](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Multi-Agent Solutions](../chapter-05-multi-agent/README.md)
- [Microservices Example](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
سلب مسئولیت:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی Co‑op Translator (https://github.com/Azure/co-op-translator) ترجمه شده است. اگرچه ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطا یا نادرستی باشند. سند اصلی به زبان مبدأ باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، استفاده از ترجمهٔ حرفه‌ای توسط انسان توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا برداشت نادرستی که از استفاده از این ترجمه ناشی شود، مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->