# دليل التثبيت والإعداد

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساسيات والبداية السريعة
- **⬅️ السابق**: [أساسيات AZD](azd-basics.md)
- **➡️ التالي**: [مشروعك الأول](first-project.md)
- **🚀 الفصل التالي**: [الفصل 2: التطوير باستخدام الذكاء الاصطناعي أولاً](../chapter-02-ai-development/microsoft-foundry-integration.md)

## مقدمة

سيرشدك هذا الدليل الشامل خلال تثبيت وتكوين Azure Developer CLI (azd) على نظامك. ستتعلم طرق تثبيت متعددة لأنظمة تشغيل مختلفة، وإعداد المصادقة، والتكوين الأولي لإعداد بيئة التطوير الخاصة بك لنشرات Azure.

## أهداف التعلم

بحلول نهاية هذا الدرس، ستكون قادرًا على:
- تثبيت Azure Developer CLI بنجاح على نظام التشغيل الخاص بك
- تكوين المصادقة مع Azure باستخدام طرق متعددة
- إعداد بيئة التطوير الخاصة بك مع المتطلبات اللازمة
- فهم خيارات التثبيت المختلفة ومتى تستخدم كل منها
- استكشاف وحل مشاكل التثبيت والإعداد الشائعة

## مخرجات التعلم

بعد إتمام هذا الدرس، ستكون قادرًا على:
- تثبيت azd باستخدام الطريقة المناسبة لمنصتك
- المصادقة مع Azure باستخدام الأمر azd auth login
- التحقق من التثبيت واختبار أوامر azd الأساسية
- تكوين بيئة التطوير لاستخدام azd بشكل مثالي
- حل مشاكل التثبيت الشائعة بشكل مستقل

سيساعدك هذا الدليل على تثبيت وتكوين Azure Developer CLI على نظامك، بغض النظر عن نظام التشغيل أو بيئة التطوير الخاصة بك.

## المتطلبات المسبقة

قبل تثبيت azd، تأكد من أن لديك:
- **اشتراك Azure** - [إنشاء حساب مجاني](https://azure.microsoft.com/free/)
- **Azure CLI** (اختياري) - للأمثلة التي تستخدم صراحة `az`؛ حيث أن azd يقوم بالمصادقة بشكل مستقل
- **Git** - لاستنساخ القوالب والتحكم في الإصدارات
- **Docker** (اختياري) - لتطبيقات الحاويات

**مسار الإصدار العام Foundry في الفصل 2:** استخدم AZD **1.37.0 أو أحدث**، ثبت الحزمة باستخدام `azd ext install microsoft.foundry`، واستخدم Python **3.13+** ونسخة **uv** الحالية لعينة الوكيل المستضاف. وضع نشر التعليمات البرمجية فيها يتم عن بُعد، لذا لا يتطلب بناء Docker محلي. لا تزال أذونات Foundry وتوفر نموذج الإقليم والحدود مطلوبة؛ راجع [إعداد الوكيل المستضاف](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## طرق التثبيت

### ويندوز

#### الخيار 1: مدير حزم ويندوز (موصى به)
```cmd
winget install microsoft.azd
```

#### الخيار 2: سكربت التثبيت PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### الخيار 3: Chocolatey
```cmd
choco install azd
```

#### الخيار 4: التثبيت اليدوي
1. قم بتنزيل الإصدار الأحدث من [GitHub](https://github.com/Azure/azure-dev/releases)
2. قم بفك الضغط إلى `C:\Program Files\azd\`
3. أضف إلى متغير البيئة PATH

### ماك أو إس

#### الخيار 1: Homebrew (موصى به)
```bash
brew tap azure/azd
brew install azd
```

#### الخيار 2: سكربت التثبيت
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### الخيار 3: التثبيت اليدوي
قم بتنزيل الأرشيف المعماري لنظام macOS من [أصول الإصدار](https://github.com/Azure/azure-dev/releases)، فكّه، وأضف الثنائي `azd` إلى `PATH` الخاص بك.

### لينكس

#### الخيار 1: سكربت التثبيت (موصى به)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### الخيار 2: مدراء الحزم

**التثبيت اليدوي من أصول الإصدار:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

بعض بيئات Codespaces وحاويات التطوير تتضمن بالفعل `azd`، لكن من الأفضل التحقق بدلاً من الافتراض:

```bash
azd version
```

إذا كان `azd` مفقودًا، قم بتثبيته باستخدام السكربت القياسي للبيئة.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

هذه الحاوية المؤقتة لا تحتفظ بحالة تسجيل الدخول بين التشغيلات. للنشرات المتكررة، استخدم [إعداد حاوية التطوير](dev-containers.md)؛ كما أن بناء الحاوية يتطلب أن يكون Docker daemon متاحًا من داخل الحاوية.

## ✅ تحقق من التثبيت

بعد التثبيت، تحقق من عمل azd بشكل صحيح:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

المخرجات المتوقعة:
```
azd version 1.x.x (commit xxxxxx)
```

**ملاحظة**: رقم النسخة الفعلي قد يختلف. تحقق من [إصدارات Azure Developer CLI](https://github.com/Azure/azure-dev/releases) لأحدث نسخة.

**✅ قائمة تحقق نجاح التثبيت:**
- [ ] `azd version` يعرض رقم النسخة بدون أخطاء
- [ ] `azd --help` يعرض توثيق الأوامر
- [ ] `azd template list` يعرض القوالب المتاحة
- [ ] يمكنك إنشاء دليل اختبار وتشغيل `azd init` بنجاح

**إذا مرت جميع الفحوصات، فأنت جاهز للانتقال إلى [مشروعك الأول](first-project.md)!**

## إعداد المصادقة

### الإعداد الموصى به للمبتدئين

في سير عمل AZD الأوّلي، قم بتسجيل الدخول باستخدام `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

استخدم تسجيل الدخول عبر Azure CLI فقط عندما تخطط لتشغيل أوامر `az` بنفسك خلال الدورة.

### مصادقة Azure CLI (اختياري)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### أي سير تسجيل دخول يجب أن تستخدم؟

- استخدم `azd auth login` إذا كنت تتبع مسار مبتدئ AZD وتغلب على تشغيل أوامر `azd`.
- استخدم `az login` أيضًا عندما ترغب في تشغيل أوامر Azure CLI مثل `az account show` أو فحص الموارد مباشرة.
- إذا كانت هناك تمرين يتضمن أوامر كل من `azd` و`az`، قم بتشغيل كلا أمرَي تسجيل الدخول مرة واحدة في البداية.

### مصادقة الكود عبر الجهاز
إذا كنت على نظام بدون واجهة رسومية أو تواجه مشاكل في المتصفح:
```bash
azd auth login --use-device-code
```

### المفتاح الخدمي (CI/CD)
للبيئات المؤتمتة:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### تحقق من إعدادك الكامل

إذا كنت تريد فحص جاهزية سريع قبل بدء الفصل 1:

**ويندوز:**
```powershell
.\validate-setup.ps1
```

**ماك أو إس / لينكس:**
```bash
bash ./validate-setup.sh
```

## التكوين

### التكوين العام
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### متغيرات البيئة
أضف إلى ملف تعريف الشل الخاص بك (`.bashrc`، `.zshrc`، `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## تكامل IDE

### Visual Studio Code
تثبيت إضافة Azure Developer CLI:
1. افتح VS Code
2. اذهب إلى الإضافات (Ctrl+Shift+X)
3. ابحث عن "Azure Developer CLI"
4. قم بتثبيت الإضافة

الميزات:
- IntelliSense ل azure.yaml
- أوامر الطرفية المدمجة
- تصفح القوالب
- مراقبة النشر

### GitHub Codespaces
أنشئ `.devcontainer/devcontainer.json`:
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
1. ثبت إضافة Azure
2. قم بتكوين بيانات اعتماد Azure
3. استخدم الطرفية المدمجة لأوامر azd

## 🐛 استكشاف مشاكل التثبيت

### المشاكل الشائعة

#### رفض الإذن (ويندوز)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### مشاكل PATH
أضف azd يدويًا إلى PATH الخاص بك:

**ويندوز:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**ماك أو إس/لينكس:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### مشاكل الشبكة/الوكيل
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### تعارضات النسخ
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### الحصول على مزيد من المساعدة
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## تحديث azd

### فحص التحديث
يحذرك azd عندما يتوفر إصدار أحدث، ويمكنك تأكيد النسخة الحالية باستخدام:
```bash
azd version
```

### التحديثات اليدوية

**ويندوز (winget):**
```cmd
winget upgrade microsoft.azd
```

**ماك أو إس (Homebrew):**
```bash
brew upgrade azd
```

**لينكس:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 أسئلة شائعة

<details>
<summary><strong>ما الفرق بين azd و az CLI؟</strong></summary>

**Azure CLI (az)**: أداة منخفضة المستوى لإدارة موارد Azure الفردية
- `az webapp create`، `az storage account create`
- مورد واحد في كل مرة
- تركيز على إدارة البنية التحتية

**Azure Developer CLI (azd)**: أداة عالية المستوى لنشر التطبيقات كاملة
- `azd up` ينشر التطبيق كاملًا مع كافة الموارد
- سير عمل قائم على القوالب
- تركيز على إنتاجية المطور

**هما مستقلان**: يستخدم azd مصادقته الخاصة بشكل افتراضي. قم بتثبيت وتسجيل الدخول إلى Azure CLI فقط من أجل أوامر `az`، أو اشترك صراحة في `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>هل يمكنني استخدام azd مع موارد Azure الحالية؟</strong></summary>

نعم! يمكنك:
1. استيراد الموارد الحالية إلى بيئات azd
2. الرجوع إلى الموارد الحالية في قوالب Bicep الخاصة بك
3. استخدام azd للنشرات الجديدة إلى جانب البنية التحتية القائمة

راجع [دليل التكوين](../chapter-03-configuration/configuration.md) للتفاصيل.
</details>

<details>
<summary><strong>هل يعمل azd مع Azure Government أو Azure China؟</strong></summary>

نعم، قم بتكوين السحابة:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

إذا كنت تستخدم Azure CLI أيضًا، قم بتكوين `az cloud set --name ...` بشكل منفصل. تختلف خدمات القوالب وتوافر النماذج حسب السحابة.
</details>

<details>
<summary><strong>هل يمكنني استخدام azd في خطوط أنابيب CI/CD؟</strong></summary>

بالتأكيد! تم تصميم azd للأتمتة:
- تكامل مع GitHub Actions
- دعم Azure DevOps
- مصادقة باستخدام المفتاح الخدمي
- وضع غير تفاعلي

راجع [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) لنماذج CI/CD.
</details>

<details>
<summary><strong>ما تكلفة استخدام azd؟</strong></summary>

azd نفسه **مجاني تمامًا** ومفتوح المصدر. تدفع فقط مقابل:
- موارد Azure التي تنشرها
- تكاليف استهلاك Azure (الحوسبة، التخزين، إلخ)

استخدم `azd provision --preview` لفحص الموارد المقترحة، ثم قدّر تكلفتها باستخدام [حاسبة تسعير Azure](https://azure.microsoft.com/pricing/calculator/). المعاينة لا تحسب الأسعار.
</details>

## الخطوات التالية

1. **أكمل المصادقة**: تأكد من إمكانية الوصول إلى اشتراك Azure الخاص بك
2. **جرب أول نشر لك**: اتبع [دليل المشروع الأول](first-project.md)
3. **استعرض القوالب**: تصفح القوالب المتاحة باستخدام `azd template list`
4. **كوّن IDE الخاص بك**: أعد إعداد بيئة التطوير الخاصة بك

## الدعم

إذا واجهت مشاكل:
- [التوثيق الرسمي](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [الإبلاغ عن المشاكل](https://github.com/Azure/azure-dev/issues)
- [مناقشات المجتمع](https://github.com/Azure/azure-dev/discussions)
- [دعم Azure](https://azure.microsoft.com/support/)
- [**مهارات وكيل Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - احصل على إرشادات أوامر Azure مباشرة في محررك مع `npx skills add microsoft/github-copilot-for-azure`

---

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساسيات والبداية السريعة
- **⬅️ السابق**: [أساسيات AZD](azd-basics.md) 
- **➡️ التالي**: [مشروعك الأول](first-project.md)
- **🚀 الفصل التالي**: [الفصل 2: التطوير باستخدام الذكاء الاصطناعي أولاً](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ تم اكتمال التثبيت!** تابع إلى [مشروعك الأول](first-project.md) للبدء في البناء باستخدام azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->