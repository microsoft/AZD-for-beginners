# الفصل 1: الأساسيات والبداية السريعة

**📚 الدورة**: [AZD للمبتدئين](../../README.md) | **⏱️ المدة**: 75-120 دقيقة بما في ذلك النشر الأول؛ تستغرق التمارين الإضافية وقتًا أطول | **⭐ التعقيد**: مبتدئ

---

## نظرة عامة

يقدم هذا الفصل أساسيات Azure Developer CLI (azd). ستتعلم المفاهيم الأساسية، تثبيت الأدوات، ونشر تطبيقك الأول على Azure.

> هدف مراجعة الأوامر والتكوين: `azd 1.37.2` (نوفمبر 2026). لم يتم تشغيل تزويد Azure المباشر أثناء المراجعة.

## أهداف التعلم

عند إكمال هذا الفصل، ستكون قادرًا على:
- فهم ما هو Azure Developer CLI وكيف يختلف عن Azure CLI
- تثبيت وتكوين AZD على منصتك
- نشر تطبيقك الأول على Azure باستخدام `azd up`
- تنظيف الموارد باستخدام `azd down`

---

## 📚 الدروس

| # | الدرس | الوصف | الوقت |
|---|--------|-------------|------|
| 1 | [أساسيات AZD](azd-basics.md) | المفاهيم الأساسية، المصطلحات، وهيكل المشروع | 15 دقيقة |
| 2 | [التثبيت والإعداد](installation.md) | إرشادات التثبيت الخاصة بالمنصة | 10 دقائق |
| 3 | [مشروعك الأول](first-project.md) | تمرين عملي: نشر تطبيق ويب على Azure | 20 دقيقة |
| 4 | [إحضار تطبيقك الخاص](bring-your-own-app.md) | إضافة azd إلى مشروع موجود لديك بالفعل | 15 دقيقة |
| 5 | [حاويات التطوير و Codespaces](dev-containers.md) | بيئات azd قابلة لإعادة الإنتاج باستخدام حاويات التطوير | 15 دقيقة |

---

## ✅ ابدأ هنا: تحقق من إعدادك

قبل أن تبدأ، تأكد من أن جهازك المحلي جاهز لقالب الفصل 1:

**ويندوز:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

إذا أبلغ البرنامج النصي عن أدوات مفقودة، قم بإصلاحها أولاً ثم تابع مع الفصل.

---

## 🚀 البداية السريعة

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

## ✅ معايير النجاح

بعد إكمال هذا الفصل، يجب أن تكون قادرًا على:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 التنقل

| الاتجاه | الفصل |
|-----------|---------|
| **التالي** | [الفصل 2: التطوير المعتمد على الذكاء الاصطناعي](../chapter-02-ai-development/README.md) |
| **تجاوز إلى** | [الفصل 3: التكوين](../chapter-03-configuration/README.md) |

---

## 📖 الموارد ذات الصلة

- [ورقة غش الأوامر](../../resources/cheat-sheet.md)
- [الأسئلة المتكررة](../../resources/faq.md)
- [مسرد المصطلحات](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->