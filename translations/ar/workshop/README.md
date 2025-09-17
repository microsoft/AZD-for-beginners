<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-17T18:25:50+00:00",
  "source_file": "workshop/README.md",
  "language_code": "ar"
}
-->
# ورشة عمل AZD لمطوري الذكاء الاصطناعي

**التنقل في الورشة**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../README.md)
- **📖 الفصول ذات الصلة**: تغطي [الفصل الأول](../README.md#-chapter-1-foundation--quick-start)، [الفصل الثاني](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)، و [الفصل الخامس](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **🛠️ مختبر عملي**: [مختبر ورشة عمل الذكاء الاصطناعي](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 الخطوات التالية**: [وحدات مختبر الورشة](../../../workshop)

مرحبًا بكم في ورشة العمل العملية لتعلم Azure Developer CLI (AZD) مع التركيز على نشر تطبيقات الذكاء الاصطناعي. تم تصميم هذه الورشة لنقلك من أساسيات AZD إلى نشر حلول الذكاء الاصطناعي الجاهزة للإنتاج.

## نظرة عامة على الورشة

**المدة:** 2-3 ساعات  
**المستوى:** مبتدئ إلى متوسط  
**المتطلبات الأساسية:** معرفة أساسية بـ Azure، أدوات سطر الأوامر، ومفاهيم الذكاء الاصطناعي

### ما ستتعلمه

- **أساسيات AZD**: فهم البنية التحتية ككود باستخدام AZD
- 🤖 **دمج خدمات الذكاء الاصطناعي**: نشر Azure OpenAI، البحث الذكي، وخدمات الذكاء الاصطناعي الأخرى
- **نشر الحاويات**: استخدام تطبيقات الحاويات في Azure لتطبيقات الذكاء الاصطناعي
- **أفضل ممارسات الأمان**: تنفيذ الهوية المُدارة وتكوينات الأمان
- **المراقبة والرصد**: إعداد Application Insights لأعباء عمل الذكاء الاصطناعي
- **أنماط الإنتاج**: استراتيجيات النشر الجاهزة للمؤسسات

## هيكل الورشة

### الوحدة الأولى: أساسيات AZD (30 دقيقة)
- تثبيت وتكوين AZD
- فهم هيكل مشروع AZD
- أول نشر باستخدام AZD
- **مختبر**: نشر تطبيق ويب بسيط

### الوحدة الثانية: دمج Azure OpenAI (45 دقيقة)
- إعداد موارد Azure OpenAI
- استراتيجيات نشر النماذج
- تكوين الوصول إلى API والمصادقة
- **مختبر**: نشر تطبيق دردشة باستخدام GPT-4

### الوحدة الثالثة: تطبيقات RAG (45 دقيقة)
- دمج البحث الذكي في Azure
- معالجة المستندات باستخدام Azure Document Intelligence
- تضمين المتجهات والبحث الدلالي
- **مختبر**: بناء نظام أسئلة وأجوبة للمستندات

### الوحدة الرابعة: النشر للإنتاج (30 دقيقة)
- تكوين تطبيقات الحاويات
- تحسين الأداء والتوسع
- المراقبة وتسجيل الأحداث
- **مختبر**: النشر للإنتاج مع الرصد

### الوحدة الخامسة: الأنماط المتقدمة (15 دقيقة)
- النشر في بيئات متعددة
- دمج CI/CD
- استراتيجيات تحسين التكلفة
- **الخاتمة**: قائمة التحقق من الجاهزية للإنتاج

## المتطلبات الأساسية

### الأدوات المطلوبة

يرجى تثبيت هذه الأدوات قبل الورشة:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### إعداد حساب Azure

1. **اشتراك Azure**: [اشترك مجانًا](https://azure.microsoft.com/free/)  
2. **الوصول إلى Azure OpenAI**: [طلب الوصول](https://aka.ms/oai/access)  
3. **الأذونات المطلوبة**:  
   - دور المساهم على الاشتراك أو مجموعة الموارد  
   - مسؤول الوصول للمستخدم (لتعيينات RBAC)

### التحقق من المتطلبات الأساسية

قم بتشغيل هذا البرنامج النصي للتحقق من الإعداد الخاص بك:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## مواد الورشة

### تمارين المختبر

تتضمن كل وحدة مختبرات عملية مع كود البداية وتعليمات خطوة بخطوة:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - أول نشر باستخدام AZD  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - تطبيق دردشة باستخدام Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - تطبيق RAG مع البحث الذكي  
- **[lab-4-production/](../../../workshop/lab-4-production)** - أنماط النشر للإنتاج  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - سيناريوهات النشر المتقدمة  

### مواد مرجعية

- **[دليل دمج AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - أنماط دمج شاملة  
- **[دليل نشر نماذج الذكاء الاصطناعي](../docs/ai-foundry/ai-model-deployment.md)** - أفضل ممارسات نشر النماذج  
- **[ممارسات الذكاء الاصطناعي للإنتاج](../docs/ai-foundry/production-ai-practices.md)** - أنماط النشر للمؤسسات  
- **[دليل استكشاف أخطاء الذكاء الاصطناعي](../docs/troubleshooting/ai-troubleshooting.md)** - المشكلات الشائعة والحلول  

### قوالب نموذجية

قوالب البداية السريعة لسيناريوهات الذكاء الاصطناعي الشائعة:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## البدء

### الخيار الأول: GitHub Codespaces (موصى به)

أسرع طريقة لبدء الورشة:

[![فتح في GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### الخيار الثاني: التطوير المحلي

1. **استنساخ مستودع الورشة:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **تسجيل الدخول إلى Azure:**
```bash
az login
azd auth login
```

3. **ابدأ مع المختبر الأول:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### الخيار الثالث: ورشة عمل بقيادة مدرب

إذا كنت تحضر جلسة بقيادة مدرب:

- 🎥 **تسجيل الورشة**: [متاح عند الطلب](https://aka.ms/azd-ai-workshop)  
- 💬 **مجتمع Discord**: [انضم للحصول على الدعم المباشر](https://aka.ms/foundry/discord)  
- **ملاحظات الورشة**: [شارك تجربتك](https://aka.ms/azd-workshop-feedback)  

## جدول الورشة

### التعلم الذاتي (3 ساعات)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### جلسة بقيادة مدرب (2.5 ساعة)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## معايير النجاح

بنهاية هذه الورشة، ستكون قادرًا على:

✅ **نشر تطبيقات الذكاء الاصطناعي** باستخدام قوالب AZD  
✅ **تكوين خدمات Azure OpenAI** مع الأمان المناسب  
✅ **بناء تطبيقات RAG** مع دمج البحث الذكي في Azure  
✅ **تنفيذ أنماط الإنتاج** لأعباء عمل الذكاء الاصطناعي للمؤسسات  
✅ **مراقبة واستكشاف الأخطاء** في نشر تطبيقات الذكاء الاصطناعي  
✅ **تطبيق استراتيجيات تحسين التكلفة** لأعباء عمل الذكاء الاصطناعي  

## المجتمع والدعم

### أثناء الورشة

- 🙋 **الأسئلة**: استخدم دردشة الورشة أو ارفع يدك  
- 🐛 **المشكلات**: تحقق من [دليل استكشاف الأخطاء](../docs/troubleshooting/ai-troubleshooting.md)  
- **النصائح**: شارك اكتشافاتك مع المشاركين الآخرين  

### بعد الورشة

- 💬 **Discord**: [مجتمع Azure AI Foundry](https://aka.ms/foundry/discord)  
- **مشكلات GitHub**: [الإبلاغ عن مشكلات القوالب](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **الملاحظات**: [نموذج تقييم الورشة](https://aka.ms/azd-workshop-feedback)  

## الخطوات التالية

### متابعة التعلم

1. **سيناريوهات متقدمة**: استكشاف [النشر متعدد المناطق](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **دمج CI/CD**: إعداد [مهام GitHub Actions](../docs/deployment/github-actions.md)  
3. **قوالب مخصصة**: إنشاء [قوالب AZD الخاصة بك](../docs/getting-started/custom-templates.md)  

### التطبيق في مشاريعك

1. **التقييم**: استخدم [قائمة التحقق من الجاهزية](./production-readiness-checklist.md)  
2. **القوالب**: ابدأ بـ [القوالب الخاصة بالذكاء الاصطناعي](../../../workshop/templates)  
3. **الدعم**: انضم إلى [Discord الخاص بـ Azure AI Foundry](https://aka.ms/foundry/discord)  

### مشاركة نجاحك

- ⭐ **قم بتقييم المستودع** إذا ساعدتك هذه الورشة  
- 🐦 **شارك على وسائل التواصل الاجتماعي** باستخدام #AzureDeveloperCLI #AzureAI  
- 📝 **اكتب منشور مدونة** عن رحلتك في نشر الذكاء الاصطناعي  

---

## ملاحظات الورشة

ملاحظاتك تساعدنا في تحسين تجربة الورشة:

| الجانب | التقييم (1-5) | التعليقات |
|--------|--------------|----------|
| جودة المحتوى | ⭐⭐⭐⭐⭐ | |
| المختبرات العملية | ⭐⭐⭐⭐⭐ | |
| التوثيق | ⭐⭐⭐⭐⭐ | |
| مستوى الصعوبة | ⭐⭐⭐⭐⭐ | |
| التجربة العامة | ⭐⭐⭐⭐⭐ | |

**إرسال الملاحظات**: [نموذج تقييم الورشة](https://aka.ms/azd-workshop-feedback)

---

**السابق:** [دليل استكشاف أخطاء الذكاء الاصطناعي](../docs/troubleshooting/ai-troubleshooting.md) | **التالي:** ابدأ مع [المختبر الأول: أساسيات AZD](../../../workshop/lab-1-azd-basics)

**هل أنت جاهز لبدء بناء تطبيقات الذكاء الاصطناعي باستخدام AZD؟**

[ابدأ المختبر الأول: أساسيات AZD →](./lab-1-azd-basics/README.md)

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.