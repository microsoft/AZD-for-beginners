# دليل التثبيت والإعداد

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساسيات والبدء السريع
- **⬅️ السابق**: [أساسيات AZD](azd-basics.md)
- **➡️ التالي**: [مشروعك الأول](first-project.md)
- **🚀 الفصل التالي**: [الفصل 2: تطوير يعتمد على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)

## مقدمة

سيرشدك هذا الدليل الشامل خلال تثبيت وتكوين Azure Developer CLI (azd) على نظامك. ستتعلم عدة طرق تثبيت لأنظمة تشغيل مختلفة، إعداد المصادقة، والتكوين الأولي لتحضير بيئة تطويرك لنشر Azure.

## أهداف التعلم

بنهاية هذا الدرس، ستتمكن من:
- تثبيت Azure Developer CLI بنجاح على نظام تشغيلك
- تكوين المصادقة مع Azure باستخدام طرق متعددة
- إعداد بيئة التطوير الخاصة بك مع المتطلبات الأساسية اللازمة
- فهم خيارات التثبيت المختلفة ومتى تستخدم كل منها
- استكشاف وحل المشكلات الشائعة أثناء التثبيت والإعداد

## نواتج التعلم

بعد إكمال هذا الدرس، ستتمكن من:
- تثبيت azd باستخدام الطريقة المناسبة لمنصتك
- المصادقة مع Azure باستخدام azd auth login
- التحقق من التثبيت واختبار أوامر azd الأساسية
- تكوين بيئة التطوير الخاصة بك لاستخدام azd بشكل مثالي
- حل المشاكل الشائعة للتثبيت بشكل مستقل

سيساعدك هذا الدليل على تثبيت وتكوين Azure Developer CLI على نظامك بغض النظر عن نظام التشغيل أو بيئة التطوير الخاصة بك.

## المتطلبات السابقة

قبل تثبيت azd، تأكد من وجود:
- **اشتراك Azure** - [إنشاء حساب مجاني](https://azure.microsoft.com/free/)
- **Azure CLI** (اختياري) - للأمثلة التي تستخدم `az` صراحةً؛ حيث azd يعتمِد على مصادقة مستقلة
- **Git** - لاستنساخ القوالب والتحكم في الإصدارات
- **Docker** (اختياري) - للتطبيقات المحتواة

## طرق التثبيت

### ويندوز

#### الخيار 1: مدير حزم ويندوز (موصى به)
```cmd
winget install microsoft.azd
```

#### الخيار 2: سكريبت التثبيت PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### الخيار 3: Chocolatey
```cmd
choco install azd
```

#### الخيار 4: التثبيت اليدوي
1. قم بتحميل الإصدار الأحدث من [GitHub](https://github.com/Azure/azure-dev/releases)
2. فك الضغط إلى `C:\Program Files\azd\`
3. أضف إلى متغير بيئة PATH

### ماك أو إس

#### الخيار 1: Homebrew (موصى به)
```bash
brew tap azure/azd
brew install azd
```

#### الخيار 2: سكريبت التثبيت
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### الخيار 3: التثبيت اليدوي
قم بتحميل الأرشيف الخاص بهندسة macOS من [موجودات الإصدار](https://github.com/Azure/azure-dev/releases)، فكّه، وأضف الثنائي `azd` إلى `PATH` الخاص بك.

### لينكس

#### الخيار 1: سكريبت التثبيت (موصى به)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### الخيار 2: مدراء الحزم

**التثبيت اليدوي من موجودات الإصدار:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

بعض بيئات Codespaces وحاويات التطوير تتضمن `azd` بالفعل، ولكن يجب عليك التحقق بدلاً من الافتراض:

```bash
azd version
```

إذا كان `azd` مفقودًا، قم بتثبيته باستخدام السكريبت القياسي للبيئة.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

هذه الحاوية العابرة لا تحتفظ بحالة تسجيل الدخول بين مرات التشغيل. للاستخدامات المتكررة في النشر، استخدم [إعداد حاوية التطوير](dev-containers.md); تبني الحاويات يتطلب أيضًا وجود خادم Docker يمكن الوصول إليه من داخل الحاوية.

## ✅ التحقق من التثبيت

بعد التثبيت، تحقق من أن azd يعمل بشكل صحيح:

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

**ملاحظة**: ستختلف النسخة الفعلية. تحقق من [إصدارات Azure Developer CLI](https://github.com/Azure/azure-dev/releases) لأحدث نسخة.

**✅ قائمة التحقق من نجاح التثبيت:**
- [ ] `azd version` يعرض رقم النسخة بدون أخطاء
- [ ] `azd --help` يعرض توثيق الأوامر
- [ ] `azd template list` يعرض القوالب المتاحة
- [ ] يمكنك إنشاء مجلد اختبار وتشغيل `azd init` بنجاح

**إذا اجتازت جميع الفحوصات، أنت جاهز للانتقال إلى [مشروعك الأول](first-project.md)!**

## إعداد المصادقة

### إعداد المبتدئين الموصى به

في تدفقات عمل AZD-الأولى، سجّل الدخول باستخدام `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

استخدم تسجيل الدخول عبر Azure CLI فقط عندما تخطط لتشغيل أوامر `az` بنفسك أثناء الدورة.

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

### أي تدفق تسجيل دخول يجب أن تستخدم؟

- استخدم `azd auth login` إذا كنت تتبع مسار AZD للمبتدئين وتشغل بشكل رئيسي أوامر `azd`.
- استخدم `az login` أيضًا عندما تريد تشغيل أوامر Azure CLI مثل `az account show` أو فحص الموارد مباشرةً.
- إذا تضمن تمرين كلًا من أوامر `azd` و `az`، نفّذ كلا أمرَي تسجيل الدخول مرة واحدة في البداية.

### مصادقة باستخدام رمز الجهاز
إذا كنت على نظام بدون واجهة أو تواجه مشكلات في المتصفح:
```bash
azd auth login --use-device-code
```

### الخدمة الرئيسية (CI/CD)
للبيئات المؤتمتة:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### تحقق من الإعداد الكامل الخاص بك

إذا أردت فحص جاهزية سريع قبل بدء الفصل 1:

**ويندوز:**
```powershell
.\validate-setup.ps1
```

**ماك أو إس / لينكس:**
```bash
bash ./validate-setup.sh
```

## التكوين

### التكوين العالمي
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### متغيرات البيئة
أضف إلى ملف تعريف القشرة الخاص بك (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## تكامل بيئة التطوير المتكاملة (IDE)

### Visual Studio Code
قم بتثبيت ملحق Azure Developer CLI:
1. افتح VS Code
2. انتقل إلى الإضافات (Ctrl+Shift+X)
3. ابحث عن "Azure Developer CLI"
4. ثبّت الملحق

الميزات:
- التكميل الذكي ل azure.yaml
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
1. ثبّت ملحق Azure
2. قم بتكوين بيانات اعتماد Azure
3. استخدم الطرفية المدمجة لأوامر azd

## 🐛 استكشاف أخطاء التثبيت

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

**ماك أو إس / لينكس:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### مشاكل الشبكة / الوكيل
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

### التحقق من التحديث
يحذرك azd عند وجود إصدار أحدث، ويمكنك تأكيد إصدارك الحالي بـ:
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

## 💡 الأسئلة الشائعة

<details>
<summary><strong>ما الفرق بين azd و az CLI؟</strong></summary>

**Azure CLI (az)**: أداة منخفضة المستوى لإدارة موارد Azure الفردية
- `az webapp create`، `az storage account create`
- مورد واحد في كل مرة
- تركيز على إدارة البنية التحتية

**Azure Developer CLI (azd)**: أداة عالية المستوى لنشر التطبيقات كاملة
- `azd up` تنشر التطبيق كاملاً مع جميع الموارد
- سير عمل يعتمد على القوالب
- تركيز على إنتاجية المطور

**هما مستقلان**: azd يستخدم مصادقة خاصة به بشكل افتراضي. ثبت وسجّل الدخول إلى Azure CLI فقط لأوامر `az`، أو اختر صراحةً الدخول عبر `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>هل يمكنني استخدام azd مع موارد Azure الموجودة؟</strong></summary>

نعم! يمكنك:
1. استيراد الموارد الموجودة إلى بيئات azd
2. الإشارة إلى الموارد الموجودة في قوالب Bicep الخاصة بك
3. استخدام azd لعمليات نشر جديدة إلى جانب البنية التحتية القائمة

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

إذا كنت تستخدم Azure CLI أيضًا، قم بتكوين `az cloud set --name ...` بشكل منفصل. خدمات القوالب وتوافر النماذج تختلف حسب السحابة.
</details>

<details>
<summary><strong>هل يمكنني استخدام azd في خطوط CI/CD؟</strong></summary>

بالتأكيد! azd مصمم للأتمتة:
- التكامل مع GitHub Actions
- دعم Azure DevOps
- مصادقة الخدمة الرئيسية
- وضع غير تفاعلي

راجع [دليل النشر](../chapter-04-infrastructure/deployment-guide.md) لأنماط CI/CD.
</details>

<details>
<summary><strong>ما تكلفة استخدام azd؟</strong></summary>

azd نفسه مجاني تمامًا ومفتوح المصدر. أنت تدفع فقط مقابل:
- موارد Azure التي تنشرها
- تكاليف استهلاك Azure (الحوسبة، التخزين، إلخ)

استخدم `azd provision --preview` لفحص الموارد المقترحة، ثم قدّر تكاليفها باستخدام [حاسبة أسعار Azure](https://azure.microsoft.com/pricing/calculator/). المعاينة لا تحسب الأسعار.
</details>

## الخطوات التالية

1. **أكمل المصادقة**: تأكد من إمكانية الوصول إلى اشتراك Azure الخاص بك
2. **جرّب أول نشر لك**: اتبع [دليل المشروع الأول](first-project.md)
3. **استكشف القوالب**: تصفح القوالب المتاحة باستخدام `azd template list`
4. **كوّن IDE الخاص بك**: جهز بيئة التطوير الخاصة بك

## الدعم

إذا واجهت مشكلات:
- [التوثيق الرسمي](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [الإبلاغ عن المشكلات](https://github.com/Azure/azure-dev/issues)
- [مناقشات المجتمع](https://github.com/Azure/azure-dev/discussions)
- [دعم Azure](https://azure.microsoft.com/support/)
- [**مهارات Azure Agent**](https://skills.sh/microsoft/github-copilot-for-azure) - احصل على إرشادات أوامر Azure مباشرة في محررك مع `npx skills add microsoft/github-copilot-for-azure`

---

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 1 - الأساسيات والبدء السريع
- **⬅️ السابق**: [أساسيات AZD](azd-basics.md) 
- **➡️ التالي**: [مشروعك الأول](first-project.md)
- **🚀 الفصل التالي**: [الفصل 2: تطوير يعتمد على الذكاء الاصطناعي](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ تم إكمال التثبيت!** استمر إلى [مشروعك الأول](first-project.md) لبدء البناء باستخدام azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->