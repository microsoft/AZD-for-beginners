# دليل التثبيت والإعداد

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساس والانطلاق السريع
- **⬅️ السابق**: [أساسيات AZD](azd-basics.md)
- **➡️ التالي**: [مشروعك الأول](first-project.md)
- **🚀 الفصل التالي**: [الفصل 2: تطوير بقيادة الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)

## مقدمة

سيسيرك هذا الدليل الشامل خلال عملية تثبيت وتكوين Azure Developer CLI (azd) على نظامك. ستتعلم طرق تثبيت متعددة لأنظمة تشغيل مختلفة، إعداد المصادقة، والتكوين الأولي لتحضير بيئة التطوير الخاصة بك لنشر موارد Azure.

## أهداف التعلم

بحلول نهاية هذا الدرس، ستتمكن من:
- تثبيت Azure Developer CLI بنجاح على نظام التشغيل الخاص بك
- تكوين المصادقة مع Azure باستخدام طرق متعددة
- إعداد بيئة التطوير الخاصة بك مع المتطلبات المسبقة اللازمة
- فهم خيارات التثبيت المختلفة ومتى تستخدم كلٍ منها
- استكشاف مشكلات التثبيت والإعداد الشائعة وإصلاحها

## مخرجات التعلم

بعد إكمال هذا الدرس، ستتمكن من:
- تثبيت azd باستخدام الطريقة المناسبة لمنصتك
- المصادقة مع Azure باستخدام `azd auth login`
- التحقق من التثبيت واختبار أوامر azd الأساسية
- تكوين بيئة التطوير الخاصة بك لاستخدام azd بشكل أمثل
- حل مشكلات التثبيت الشائعة بشكل مستقل

سيساعدك هذا الدليل على تثبيت وتكوين Azure Developer CLI على نظامك، بغض النظر عن نظام التشغيل أو بيئة التطوير التي تستخدمها.

## المتطلبات المسبقة

قبل تثبيت azd، تأكد من أن لديك:
- **اشتراك Azure** - [إنشاء حساب مجاني](https://azure.microsoft.com/free/)
- **Azure CLI** - للمصادقة وإدارة الموارد
- **Git** - لاستنساخ القوالب والتحكم في الإصدارات
- **Docker** (اختياري) - للتطبيقات الحاوية

## طرق التثبيت

### ويندوز

#### Option 1: Windows Package Manager (Recommended)
```cmd
winget install microsoft.azd
```

#### Option 2: PowerShell Install Script
```powershell
# مفيد عندما يكون winget غير متاح
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. قم بتنزيل الإصدار الأحدث من [GitHub](https://github.com/Azure/azure-dev/releases)
2. فك الضغط إلى `C:\Program Files\azd\`
3. أضف إلى متغير البيئة PATH

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# قم بتنزيل وتثبيت
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Manual installation from release assets:**
```bash
# قم بتنزيل أحدث أرشيف لمعمارية Linux الخاصة بك من:
# https://github.com/Azure/azure-dev/releases
# ثم استخرجه وأضف الملف التنفيذي azd إلى متغير PATH الخاص بك.
```

### GitHub Codespaces

بعض Codespaces وبيئات الحاويات التطويرية تتضمن بالفعل `azd`، ولكن يجب عليك التحقق من ذلك بدلاً من الافتراض:

```bash
azd version
```

If `azd` is missing, install it with the standard script for the environment.

### Docker

```bash
# تشغيل azd داخل حاوية
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# إنشاء اسم مستعار لتسهيل الاستخدام
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ التحقق من التثبيت

بعد التثبيت، تحقق من أن azd يعمل بشكل صحيح:

```bash
# تحقق من الإصدار
azd version

# عرض المساعدة
azd --help

# عرض القوالب المتاحة
azd template list
```

الناتج المتوقع:
```
azd version 1.x.x (commit xxxxxx)
```

**ملاحظة**: رقم النسخة الفعلي قد يختلف. تحقق من [إصدارات Azure Developer CLI](https://github.com/Azure/azure-dev/releases) لأحدث إصدار.

**✅ قائمة فحص نجاح التثبيت:**
- [ ] يعرض `azd version` رقم الإصدار بدون أخطاء
- [ ] يعرض `azd --help` توثيق الأوامر
- [ ] يعرض `azd template list` القوالب المتاحة
- [ ] يمكنك إنشاء دليل اختبار وتشغيل `azd init` بنجاح

**إذا اجتازت جميع الفحوص، فأنت جاهز للانتقال إلى [مشروعك الأول](first-project.md)!**

## إعداد المصادقة

### إعداد موصى به للمبتدئين

لمسارات العمل التي تبدأ بـ AZD، سجّل الدخول باستخدام `azd auth login`.

```bash
# مطلوب لأوامر AZD مثل azd up
azd auth login

# تحقق من حالة مصادقة AZD
azd auth login --check-status
```

استخدم تسجيل الدخول عبر Azure CLI فقط عندما تخطط لتشغيل أوامر `az` بنفسك خلال الدورة.

### مصادقة Azure CLI (اختياري)
```bash
# ثبّت Azure CLI إذا لم يكن مثبتًا بالفعل
# ويندوز: winget install Microsoft.AzureCLI
# ماك أو إس: brew install azure-cli
# لينكس: راجع مستندات تثبيت Azure CLI الخاصة بتوزيعتك

# سجّل الدخول إلى Azure
az login

# تحقق من المصادقة
az account show
```

### أي تدفق تسجيل دخول يجب أن تستخدم؟

- استخدم `azd auth login` إذا كنت تتبع مسار AZD للمبتدئين وتنفذ أوامر `azd` بشكل رئيسي.
- استخدم `az login` أيضًا عندما تريد تشغيل أوامر Azure CLI مثل `az account show` أو فحص الموارد مباشرةً.
- إذا تضمن التمرين أوامر `azd` و `az` معًا، فشغّل كلا أمرَي تسجيل الدخول مرة واحدة في البداية.

### مصادقة رمز الجهاز
إذا كنت على نظام بدون واجهة رسومية أو تواجه مشاكل في المتصفح:
```bash
azd auth login --use-device-code
```

### مُعَرِّف الخدمة (CI/CD)
لبيئات التشغيل الآلي:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### التحقق من إعدادك الكامل

إذا كنت تريد فحص جاهزية سريع قبل بدء الفصل 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## التكوين

### التكوين العام
```bash
# تعيين الاشتراك الافتراضي
azd config set defaults.subscription <subscription-id>

# تعيين الموقع الافتراضي
azd config set defaults.location eastus2

# عرض جميع الإعدادات
azd config show
```

### متغيرات البيئة
أضف إلى ملف تعريف الصدفة الخاص بك (`.bashrc`، `.zshrc`، `.profile`):
```bash
# تكوين Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# تكوين azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # تمكين تسجيلات التصحيح
```

## تكامل بيئة التطوير المتكاملة (IDE)

### Visual Studio Code
ثبت امتداد Azure Developer CLI:
1. افتح VS Code
2. اذهب إلى الامتدادات (Ctrl+Shift+X)
3. ابحث عن "Azure Developer CLI"
4. ثبت الامتداد

الميزات:
- IntelliSense لملف azure.yaml
- أوامر الطرفية المدمجة
- تصفح القوالب
- مراقبة النشر

### GitHub Codespaces
أنشئ ملف `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. ثبّت ملحق Azure
2. قم بتكوين بيانات اعتماد Azure
3. استخدم الطرفية المدمجة لأوامر azd

## 🐛 استكشاف أخطاء التثبيت وإصلاحها

### المشكلات الشائعة

#### رفض الإذن (Windows)
```powershell
# قم بتشغيل PowerShell كمسؤول
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### مشاكل PATH
أضف azd إلى PATH يدويًا:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### مشاكل الشبكة/الوكيل
```bash
# تكوين الوكيل
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# تخطي التحقق من SSL (غير موصى به في بيئات الإنتاج)
azd config set http.insecure true
```

#### تعارضات الإصدارات
```bash
# إزالة التثبيتات القديمة
# ويندوز: winget uninstall microsoft.azd
# ماك أو إس: brew uninstall azd
# لينكس: أزل الملف الثنائي السابق لـ azd أو الارتباط الرمزي قبل إعادة التثبيت

# تنظيف التكوين
rm -rf ~/.azd
```

### الحصول على مزيد من المساعدة
```bash
# تمكين تسجيلات التصحيح
export AZD_DEBUG=true
azd <command> --debug

# عرض التكوين الحالي
azd config show

# عرض حالة النشر الحالية
azd show
```

## تحديث azd

### التحقق من التحديث
يُنبه azd عندما يتوفر إصدار أحدث، ويمكنك تأكيد البناء الحالي الخاص بك باستخدام:
```bash
azd version
```

### التحديثات اليدوية

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 الأسئلة المتداولة

<details>
<summary><strong>ما الفرق بين azd و az CLI؟</strong></summary>

**Azure CLI (az)**: أداة منخفضة المستوى لإدارة موارد Azure الفردية
- `az webapp create`, `az storage account create`
- مورد واحد في كل مرة
- تركيز على إدارة البنية التحتية

**Azure Developer CLI (azd)**: أداة عالية المستوى لنشر التطبيقات بالكامل
- `azd up` ينشر التطبيق الكامل مع كل الموارد
- سير عمل قائم على القوالب
- تركيز على إنتاجية المطور

**ستحتاج إلى كلتا الأداتين**: يستخدم azd أداة az CLI للمصادقة
</details>

<details>
<summary><strong>هل يمكنني استخدام azd مع موارد Azure الموجودة بالفعل؟</strong></summary>

نعم! يمكنك:
1. استيراد الموارد الموجودة إلى بيئات azd
2. الإشارة إلى الموارد الموجودة في قوالب Bicep الخاصة بك
3. استخدام azd للنشر الجديد جنبًا إلى جنب مع البنية التحتية الموجودة

راجع [Configuration Guide](configuration.md) للتفاصيل.
</details>

<details>
<summary><strong>هل يعمل azd مع Azure Government أو Azure China؟</strong></summary>

نعم، قم بتكوين السحابة:
```bash
# أزور للحكومة
az cloud set --name AzureUSGovernment
az login

# أزور الصين
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>هل يمكنني استخدام azd في خطوط CI/CD؟</strong></summary>

بالتأكيد! تم تصميم azd للأتمتة:
- تكامل GitHub Actions
- دعم Azure DevOps
- مصادقة مُعَرِّف الخدمة
- وضع غير تفاعلي

راجع [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) لأنماط CI/CD.
</details>

<details>
<summary><strong>ما تكلفة استخدام azd؟</strong></summary>

azd نفسه **مجاني تمامًا** ومفتوح المصدر. أنت تدفع فقط مقابل:
- موارد Azure التي تنشرها
- تكاليف استهلاك Azure (الحوسبة، التخزين، إلخ)

استخدم `azd provision --preview` لتقدير التكاليف قبل النشر.
</details>

## الخطوات التالية

1. **أكمل المصادقة**: تأكد من قدرتك على الوصول إلى اشتراك Azure الخاص بك
2. **جرّب نشرك الأول**: اتبع [دليل المشروع الأول](first-project.md)
3. **استعرض القوالب**: تصفح القوالب المتاحة باستخدام `azd template list`
4. **قم بتكوين IDE الخاص بك**: أعد إعداد بيئة التطوير الخاصة بك

## الدعم

إذا واجهت مشكلات:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - احصل على إرشادات أوامر Azure مباشرة في محررك باستخدام `npx skills add microsoft/github-copilot-for-azure`

---

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساس والانطلاق السريع
- **⬅️ السابق**: [أساسيات AZD](azd-basics.md) 
- **➡️ التالي**: [مشروعك الأول](first-project.md)
- **🚀 الفصل التالي**: [الفصل 2: تطوير بقيادة الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ تم اكتمال التثبيت!** تابع إلى [مشروعك الأول](first-project.md) لبدء البناء باستخدام azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:
تم ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق به. للمعلومات الحرجة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تأويل ينشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->