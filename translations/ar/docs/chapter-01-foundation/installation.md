# دليل التثبيت والإعداد

**الملاحة بين الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD For Beginners](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساسيات والبدء السريع
- **⬅️ السابق**: [AZD Basics](azd-basics.md)
- **➡️ التالي**: [مشروعك الأول](first-project.md)
- **🚀 الفصل التالي**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## مقدمة

سيأخذك هذا الدليل الشامل عبر خطوات تثبيت وتكوين Azure Developer CLI (azd) على نظامك. ستتعلم طرق تثبيت متعددة لأنظمة تشغيل مختلفة، إعداد المصادقة، والتكوين الأولي لتحضير بيئة التطوير الخاصة بك لنشر الموارد على Azure.

## أهداف التعلم

بنهاية هذا الدرس، ستتمكن من:
- تثبيت Azure Developer CLI بنجاح على نظام التشغيل الخاص بك
- تكوين المصادقة مع Azure بعدة أساليب
- إعداد بيئة التطوير مع المتطلبات الأساسية اللازمة
- فهم خيارات التثبيت المختلفة ومتى تستخدم كل منها
- استكشاف وإصلاح مشاكل التثبيت والإعداد الشائعة

## مخرجات التعلم

بعد إكمال هذا الدرس، ستكون قادراً على:
- تثبيت azd باستخدام الطريقة المناسبة لمنصتك
- المصادقة مع Azure باستخدام azd auth login
- التحقق من تثبيتك وتجربة أوامر azd الأساسية
- تكوين بيئة التطوير لاستخدام azd بشكل مثالي
- حل مشكلات التثبيت الشائعة بشكل مستقل

سيساعدك هذا الدليل على تثبيت وتكوين Azure Developer CLI على نظامك، بغض النظر عن نظام التشغيل أو بيئة التطوير التي تستخدمها.

## المتطلبات المسبقة

قبل تثبيت azd، تأكد من أن لديك:
- **اشتراك Azure** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - للمصادقة وإدارة الموارد
- **Git** - لاستنساخ القوالب والتحكم في الإصدارات
- **Docker** (اختياري) - للتطبيقات المحوّمة بالحاويات

## طرق التثبيت

### Windows

#### الخيار 1: PowerShell (موصى به)
```powershell
# شغّل كمسؤول أو بامتيازات مرتفعة
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### الخيار 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### الخيار 3: Chocolatey
```cmd
choco install azd
```

#### الخيار 4: التثبيت اليدوي
1. قم بتنزيل الإصدار الأحدث من [GitHub](https://github.com/Azure/azure-dev/releases)
2. فك الضغط إلى `C:\Program Files\azd\`
3. أضف إلى متغير البيئة PATH

### macOS

#### الخيار 1: Homebrew (موصى به)
```bash
brew tap azure/azd
brew install azd
```

#### الخيار 2: برنامج التثبيت عبر سكربت
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### الخيار 3: التثبيت اليدوي
```bash
# تنزيل وتثبيت
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### الخيار 1: سكربت التثبيت (موصى به)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### الخيار 2: مديرو الحزم

**Ubuntu/Debian:**
```bash
# أضف مستودع حزم مايكروسوفت
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# قم بتثبيت azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# أضف مستودع حزم مايكروسوفت
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

يأتي azd مثبتًا مسبقًا في GitHub Codespaces. ما عليك سوى إنشاء codespace والبدء في استخدام azd فورًا.

### Docker

```bash
# تشغيل azd داخل حاوية
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# إنشاء اختصار لتسهيل الاستخدام
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ التحقق من التثبيت

بعد التثبيت، تحقق أن azd يعمل بشكل صحيح:

```bash
# تحقق من الإصدار
azd version

# عرض المساعدة
azd --help

# قائمة القوالب المتاحة
azd template list
```

المخرجات المتوقعة:
```
azd version 1.x.x (commit xxxxxx)
```

**ملاحظة**: رقم الإصدار الفعلي سيختلف. تحقق من [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) للحصول على أحدث إصدار.

**✅ قائمة تحقق لنجاح التثبيت:**
- [ ] `azd version` يعرض رقم الإصدار بدون أخطاء
- [ ] `azd --help` يعرض توثيق الأوامر
- [ ] `azd template list` يعرض القوالب المتاحة
- [ ] `az account show` يعرض اشتراك Azure الخاص بك
- [ ] يمكنك إنشاء دليل اختبار وتشغيل `azd init` بنجاح

**إذا نجحت كل الفحوص، فأنت جاهز للانتقال إلى [مشروعك الأول](first-project.md)!**

## إعداد المصادقة

### مصادقة Azure CLI (موصى بها)
```bash
# قم بتثبيت Azure CLI إذا لم يكن مثبتًا بالفعل
# Windows: شغّل الأمر winget install Microsoft.AzureCLI
# macOS: شغّل الأمر brew install azure-cli
# Linux: شغّل الأمر curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# سجّل الدخول إلى Azure
az login

# تحقق من المصادقة
az account show
```

### مصادقة عبر رمز الجهاز
إذا كنت على نظام بدون واجهة أو تواجه مشكلات في المتصفح:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
لبيئات الأتمتة:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## التكوين

### التكوين العام
```bash
# تعيين الاشتراك الافتراضي
azd config set defaults.subscription <subscription-id>

# تعيين الموقع الافتراضي
azd config set defaults.location eastus2

# عرض جميع الإعدادات
azd config list
```

### متغيرات البيئة
أضف إلى ملف تعريف الشل الخاص بك (`.bashrc`, `.zshrc`, `.profile`):
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
قم بتثبيت امتداد Azure Developer CLI:
1. افتح VS Code
2. اذهب إلى الإضافات (Ctrl+Shift+X)
3. ابحث عن "Azure Developer CLI"
4. قم بتثبيت الامتداد

الميزات:
- IntelliSense لملف azure.yaml
- أوامر مدمجة في الطرفية
- تصفح القوالب
- مراقبة النشر

### GitHub Codespaces
قم بإنشاء `.devcontainer/devcontainer.json`:
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
1. قم بتثبيت ملحق Azure
2. قم بتكوين بيانات اعتماد Azure
3. استخدم الطرفية المدمجة لأوامر azd

## 🐛 استكشاف أخطاء التثبيت وإصلاحها

### المشاكل الشائعة

#### إذن مرفوض (Windows)
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

# تخطي التحقق من SSL (لا يُنصح به في بيئة الإنتاج)
azd config set http.insecure true
```

#### تعارضات الإصدارات
```bash
# إزالة التثبيتات القديمة
# ويندوز: winget uninstall Microsoft.Azd
# ماك أو إس: brew uninstall azd
# لينكس: sudo apt remove azd

# تنظيف الإعدادات
rm -rf ~/.azd
```

### الحصول على مزيد من المساعدة
```bash
# تمكين تسجيلات تصحيح الأخطاء
export AZD_DEBUG=true
azd <command> --debug

# عرض التكوين الحالي
azd config list

# عرض حالة النشر الحالية
azd show
```

## تحديث azd

### التحديثات التلقائية
سيقوم azd بإعلامك عند توفر تحديثات:
```bash
azd version --check-for-updates
```

### التحديث اليدوي

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 الأسئلة الشائعة

<details>
<summary><strong>ما الفرق بين azd و az CLI؟</strong></summary>

**Azure CLI (az)**: أداة منخفضة المستوى لإدارة موارد Azure الفردية
- `az webapp create`, `az storage account create`
- مورد واحد في كل مرة
- تركيز على إدارة البنية التحتية

**Azure Developer CLI (azd)**: أداة عالية المستوى لنشر التطبيقات كاملة
- `azd up` ينشر التطبيق بأكمله مع كل الموارد
- سير عمل معتمد على القوالب
- تركيز على إنتاجية المطور

**أنت بحاجة إلى كلاهما**: يستخدم azd أداة az CLI للمصادقة
</details>

<details>
<summary><strong>هل يمكنني استخدام azd مع موارد Azure الموجودة بالفعل؟</strong></summary>

نعم! يمكنك:
1. استيراد الموارد الموجودة إلى بيئات azd
2. الإشارة إلى الموارد الموجودة في قوالب Bicep الخاصة بك
3. استخدام azd للنشر الجديد بجانب البنية التحتية الحالية

انظر [Configuration Guide](configuration.md) للتفاصيل.
</details>

<details>
<summary><strong>هل يعمل azd مع Azure Government أو Azure China؟</strong></summary>

نعم، قم بتكوين السحابة:
```bash
# أزور الحكومة
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
- تكامل مع GitHub Actions
- دعم Azure DevOps
- مصادقة عبر service principal
- وضع غير تفاعلي

انظر [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) لأنماط CI/CD.
</details>

<details>
<summary><strong>ما تكلفة استخدام azd؟</strong></summary>

azd نفسه **مجانًا تمامًا** ومفتوح المصدر. ستدفع فقط مقابل:
- موارد Azure التي تنشرها
- تكاليف استهلاك Azure (الحوسبة، التخزين، إلخ)

استخدم `azd provision --preview` لتقدير التكاليف قبل النشر.
</details>

## الخطوات التالية

1. **أكمل المصادقة**: تأكد من أنك قادر على الوصول إلى اشتراك Azure الخاص بك
2. **جرّب نشرك الأول**: اتبع [First Project Guide](first-project.md)
3. **استعرض القوالب**: تصفح القوالب المتاحة عبر `azd template list`
4. **قم بتكوين IDE الخاص بك**: اضبط بيئة التطوير

## الدعم

إذا واجهت مشكلات:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - احصل على إرشادات أوامر Azure مباشرة في محررك باستخدام `npx skills add microsoft/github-copilot-for-azure`

---

**الملاحة بين الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD For Beginners](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساسيات والبدء السريع
- **⬅️ السابق**: [AZD Basics](azd-basics.md) 
- **➡️ التالي**: [مشروعك الأول](first-project.md)
- **🚀 الفصل التالي**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ تم اكتمال التثبيت!** تابع إلى [مشروعك الأول](first-project.md) للبدء في البناء باستخدام azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
إخلاء المسؤولية:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى إلى الدقة، يُرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. ينبغي اعتبار الوثيقة الأصلية بلغتها الأصلية المصدر المرجعي المعتمد. بالنسبة للمعلومات الحساسة أو الحرجة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن لا نتحمل أي مسؤولية عن أي سوء فهم أو تفسير خاطئ ينشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->