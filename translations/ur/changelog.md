# تبدیلیوں کی فہرست - AZD برائے نو آموز

## تعارف

یہ تبدیلیوں کی فہرست AZD برائے نو آموز ریپوزیٹری میں تمام قابل ذکر تبدیلیوں، اپ ڈیٹس، اور اصلاحات کو دستاویزی شکل دیتی ہے۔ ہم سیمانٹک ورژننگ اصولوں کی پیروی کرتے ہیں اور یہ لاگ اس لیے رکھتے ہیں تاکہ صارفین کو یہ سمجھنے میں مدد ملے کہ ورژن کے درمیان کیا تبدیلیاں ہوئی ہیں۔

## سیکھنے کے مقاصد

اس تبدیلیوں کی فہرست کا جائزہ لینے سے آپ:
- نئی خصوصیات اور مواد کی اضافے سے آگاہ رہیں گے
- موجودہ دستاویزات میں کی گئی اصلاحات کو سمجھیں گے
- درستگی کے لیے بگ فکسز اور اصلاحات کو ٹریک کریں گے
- سیکھنے کے مواد کے وقت کے ساتھ ارتقاء کو فالو کریں گے

## سیکھنے کے نتائج

تبدیلیوں کی فہرست کو دیکھنے کے بعد، آپ قابل ہوں گے:
- دستیاب نئے مواد اور وسائل کی نشاندہی کریں
- سمجھیں کہ کون سے حصے اپ ڈیٹ یا بہتر کیے گئے ہیں
- جدید ترین مواد کی بنیاد پر اپنا سیکھنے کا راستہ تیار کریں
- آئندہ بہتری کے لیے رائے اور تجاویز دیں

## ورژن کی تاریخ

### [v3.22.0] - 2026-06-16

#### نو آموز خلاء بھرنا #2: ٹیمپلیٹ تالیف، ڈیو کنٹینرز، پولومی، ایزور ڈیولپ آپس، سروس پرنسپلز، اور مزید
**یہ ورژن azd-coverage تجزیے کی طرف سے سامنے آنے والے باقی درمیانے درجے کے خلاؤں کو بند کرتا ہے: اپنی ٹیمپلیٹ کیسے تخلیق اور شائع کریں، دوبارہ پیدا ہونے والے ڈیو-کنٹینر/کوڈ اسپیسز ماحول، پولومی انفراسٹرکچر فراہم کنندہ، ایزور ڈیولپ آپس CI/CD واک تھرو، سروس پرنسپل توثیق، ہوسٹ منتخب کرنے کی رہنمائی (AKS/Spring Apps)، `azd restore`/`azd package` کی وضاحتیں، ہک ایرر ہینڈلنگ، اور ٹیم/مشترکہ ماحول کی عملی طریقے۔**

#### شامل کیا گیا
- **🧱 نیا باب 4 سبق** `docs/chapter-04-infrastructure/custom-templates.md` — اپنی azd ٹیمپلیٹ کی تخلیق: مطلوبہ ڈھانچہ (`azure.yaml`, `infra/`, `src/`), `metadata.template` فیلڈ، `uniqueString()` ریسورس ٹوکن اور `azd-env-name` ٹیگ کے ساتھ انفرسٹرکچر پیرامیٹرائز کرنا، لوکل ٹیسٹنگ `azd init --template <local-path>` کے ذریعے، GitHub پر شائع کرنا، اور Awesome AZD گیلری کو جمع کروانا
- **📦 نیا باب 1 سبق** `docs/chapter-01-foundation/dev-containers.md` — ڈیو کنٹینرز اور GitHub کوڈ اسپیسز کے ساتھ دوبارہ پیدا ہونے والے azd ماحول: ایک کم سے کم `.devcontainer/devcontainer.json` جو سرکاری `ghcr.io/azure/azure-dev/azd` فیچر استعمال کرتا ہے، زبان کی مخصوص خصوصیات، کنٹینر ہوسٹس کے لیے `docker-in-docker`، اور ریموٹ سائن ان کے لیے `azd auth login --use-device-code`
- **🧩 پولومی کے ساتھ azd** سیکشن `docs/chapter-04-infrastructure/provisioning.md` میں — `infra.provider: pulumi`, پولومی فولڈر لے آؤٹ، اسٹیکس جو azd ماحول سے منسلک ہیں، مطلوبہ آؤٹ پٹس/ٹیگنگ، اور وہی `azd up` / `azd down` ورک فلو
- **🎯 ہوسٹ منتخب کرنے کی رہنمائی** `docs/chapter-04-infrastructure/provisioning.md` میں — نو آموزوں کے لیے `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, اور `springapp` کا موازنہ، اور AKS یا ایزور اسپرنگ ایپس کب منتخب کریں کی رہنمائی
- **🛠️ ایزور ڈیولپ آپس CI/CD واک تھرو** `docs/chapter-08-production/production-ai-practices.md` میں — `azd pipeline config --provider azdo`, ورک لوڈ آئڈینٹی فیڈریشن (OIDC) کے ساتھ سروس کنکشن، بنائی گئی `azure-dev.yml`, اور ویریبل گروپ سیٹ اپ
- **🔑 سروس پرنسپلز (پیٹرن 4)** کو `docs/chapter-03-configuration/authsecurity.md` میں شامل کیا گیا — `az ad sp create-for-rbac`, کلائنٹ سیکرٹ کے ساتھ غیر متعامل `azd auth login` بمقابلہ فیڈریٹڈ/OIDC اسناد، استعمال کے اوقات، اور محفوظ اسناد اسٹوریج
- **🪝 ہک ایرر ہینڈلنگ** ذیلی سیکشن `docs/chapter-04-infrastructure/deployment-guide.md` میں — ایگزٹ کوڈز اور `set -e`, `continueOnError`, ہک کے تنہائی میں ٹیسٹ کرنا `azd hooks run` کے ذریعے، OS مخصوص شیلز، اور `--debug`
- **👥 ٹیم / مشترکہ ماحول** سیکشن `docs/chapter-03-configuration/configuration.md` میں — `.azure/` میں کیا رہتا ہے، gitignore میں کیا شامل کریں، ہر ڈیولپر کے ماحول، `azd env list`/`select`, اور CI/CD میں ماحول کی ویلیوز فراہم کرنا
- **🧰 `azd restore` اور وسعت یافتہ `azd package`** وضاحتیں `resources/cheat-sheet.md` میں — انحصاریوں کی بحالی اور بغیر تعیناتی کے قابل تنصیب آرٹیفیکٹ بنانا

#### تبدیل شدہ
- **🧭 باب 4 اسباق کی جدول** نئی "اپنی ٹیمپلیٹ تخلیق کریں" سبق (سبق 3) شامل کرنے کے لیے اپ ڈیٹ کی گئی
- **🧭 باب 1 اسباق کی جدول** نئی "ڈیو کنٹینرز اور کوڈ اسپیسز" سبق (سبق 5) شامل کرنے کے لیے اپ ڈیٹ کی گئی؛ `bring-your-own-app.md` اور `dev-containers.md` کے درمیان نیویگیشن فُٹرز منسلک کیے گئے

### [v3.21.0] - 2026-06-16

#### نو آموز خلاء بھرنا: ہینڈز آن ملٹی-ایجنٹ سبق، "اپنی ایپ لائیں," ٹیری فارم، اور CI/CD واک تھرو
**یہ ورژن مکمل نو آموزوں کے رہنما کے لیے سب سے بڑے خلاؤں کو دو نئے ہینڈز آن اسباق (ایک قابل تعیناتی ملٹی ایجنٹ واک تھرو اور موجودہ ایپ میں azd کا اضافہ)، ایک نو آموز دوستانہ ہکس تعارف، ٹیری فارم/azd سیکشن، GitHub ایکشنز پائپ لائن واک تھرو، نئے پریویو ایکسٹینشنز کی وضاحت، اور واضح تعیناتی تصدیق چیک لسٹ شامل کرکے بند کرتا ہے۔**

#### شامل کیا گیا
- **🤝 نیا باب 5 سبق** `docs/chapter-05-multi-agent/multi-agent-basics.md` — مکمل ہینڈز آن، قابل تعیناتی دوایجنٹ واک تھرو (آرکیسٹریٹر + اسپیشلسٹس) حقیقی ٹیمپلیٹ (`contoso-creative-writer`) کے ساتھ، ملٹی ایجنٹ استعمال کرنے کے اوقات، `azd up` ورک فلو، تعینات شدہ وسائل کو سمجھنا، کراس ایجنٹ ٹریسنگ، تخصیص، اور صفائی
- **📦 نیا باب 1 سبق** `docs/chapter-01-foundation/bring-your-own-app.md` — موجودہ پروجیکٹ میں `azd init` کے ذریعے azd کو کیسے شامل کریں ("موجودہ ڈائریکٹری میں کوڈ استعمال کریں"), `azure.yaml` اور `infra/` کو سمجھنا، `azd infra generate`, ہوسٹ کی شناخت، اور `azd up` کے ساتھ تعیناتی
- **🌐 azd کے ساتھ ٹیری فارم** سیکشن `docs/chapter-04-infrastructure/provisioning.md` میں شامل — `infra.provider: terraform` کنفیگریشن، `.tf` فولڈر لے آؤٹ، مطلوبہ `AZURE_*` آؤٹ پٹس اور `azd-env-name` ٹیگنگ، اور وہی `azd up` / `azd down` ورک فلو (جہاں ٹیری فارم سپورٹ کا دعویٰ تھا لیکن صرف بائسک دکھایا گیا تھا، وہ خلا بند کیا گیا)
- **⚙️ قدم بہ قدم GitHub ایکشنز واک تھرو** `docs/chapter-08-production/production-ai-practices.md` میں — GitHub ریپو سے خودکار تعیناتی تک: `azd pipeline config`, OIDC فیڈریٹڈ اسناد (کوئی محفوظ راز نہیں)، بنائی گئی `azure-dev.yml`, اور راز بمقابلہ ویریبلز کی رہنمائی
- **🪝 نو آموز "نئے ہکس کے لیے؟" تعارف** `docs/chapter-04-infrastructure/deployment-guide.md` میں — ہک کیا ہے، ہک اسٹیجز کی جدول، ایک کم سے کم پہلا ہک، اور `azd hooks run` کے ساتھ ہاتھ سے ہکس چلانا
- **✅ "اپنی تعیناتی کی تصدیق کریں" چیک لسٹ** `docs/chapter-01-foundation/first-project.md` کے مرحلہ 5 میں شامل — سموک ٹیسٹ، صحت کے اینڈ پوائنٹ کی جانچ، اور واضح کامیابی کے معیار
- **🧩 نئے پریویو ایکسٹینشنز کی وضاحت** `azure.ai.skills` اور `azure.ai.connections` (یہ کیا ہیں اور کب استعمال کریں) `docs/chapter-08-production/production-ai-practices.md` میں

#### تبدیل شدہ
- **🧭 باب 5 اسباق کی جدول** درست کی گئی: `multi-agent-basics.md` اب سبق 1 ہے (واحد مکمل ہینڈز آن سبق)، ایماندار لیبلنگ کے ساتھ کہ سبق 2 باب 6 میں ہے اور ریٹیل منظر نامہ آرکیٹیکچر بلیو پرنٹ ہے، نہ کہ ایک کمانڈ ٹیمپلیٹ
- **🧭 باب 1 اسباق کی جدول** اب نئی "اپنی ایپ لائیں" سبق (سبق 4) شامل ہے
- **🔗 نیویگیشن فُٹرز** اپ ڈیٹ کیے گئے: `first-project.md` اب آگے لنک کرتا ہے `bring-your-own-app.md` کی طرف

#### درست کیا گیا
- **🧱 "دعوے لیکن غائب" ٹیری فارم خلا کو بند کیا گیا** — کورس نے پہلے ٹیری فارم سپورٹ کا حوالہ دیا تھا لیکن دکھایا نہیں تھا
- **🔀 باب 5 کراس لنکس کو درست کیا گیا** جو یہ ظاہر کرتے تھے کہ مکمل ملٹی ایجنٹ نفاذ موجود ہے جبکہ صرف آرکیٹیکچر بلیو پرنٹ تھا

#### اپ ڈیٹ کی گئی فائلز
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(نئی)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(نئی)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 ریفریش، مکمل ایجنٹ لائف سائیکل کمانڈز اور اسپائر ری برانڈ
**یہ ورژن کورس کو `azd` `1.25.6` (جون 2026) اور `azure.ai.agents` `0.1.40-preview` ایکسٹینشن کے خلاف دوبارہ درست کرتا ہے، AI کی رہنمائی کو "ایجنٹ تخلیق کریں" سے مکمل ایجنٹ لائف سائیکل (ٹیسٹ → جائزہ → بہتر بنائیں → معائنہ → حذف کریں) تک بڑھاتا ہے، نئے `azure.ai.skills` اور `azure.ai.connections` پریویو ایکسٹینشنز کو سامنے لاتا ہے، اور ".NET Aspire" → "Aspire" پروڈکٹ ریبرانڈ کا نوٹ دیتا ہے۔**

#### شامل کیا گیا
- **🔁 مکمل ایجنٹ لائف سائیکل کوریج** نو آموزوں اور AI انجینئرز کے لیے دستاویزات میں:
  - `docs/chapter-01-foundation/azd-basics.md` — لائف سائیکل جدول (تخلیق → ٹیسٹ → ناپیں → بہتر کریں → معائنہ کریں → صفائی کریں) ایکسٹینشنز اور AI کمانڈز سیکشن میں شامل کی گئی
  - `docs/chapter-08-production/production-ai-practices.md` — "ایجنٹ لائف سائیکل کا انتظام" کا نیا سیکشن، `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, اور `delete --force` کو کور کرتا ہے
  - `resources/cheat-sheet.md` — AI ایجنٹ کمانڈز میں `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, اور `delete --force` شامل کیے گئے
- **🧩 نئے پریویو ایکسٹینشنز** کی دستاویزات: `azure.ai.skills` (دوبارہ قابل استعمال ایجنٹ مہارتیں) اور `azure.ai.connections` (فاؤنڈری کنکشنز) ایکسٹینشنز کی جدول اور چیٹ شیٹ میں شامل
- **⏱️ جوابی وقت کی رہنمائی** — `azd ai agent invoke` مثالیں اب کل تاخیر اور پہلے بائٹ کے وقت کو پرنٹ کرنے کا ذکر کرتی ہیں
- **📌 ورژن بینر** روٹ README میں سیکھنے والوں کو `azd version` اور `azd upgrade` کی طرف متوجہ کرنے کے لیے

#### تبدیل شدہ
- **✅ ویلیڈیشن بیس لائن اپ ڈیٹ** `azd 1.23.12` (مارچ 2026) سے `azd 1.25.6` (جون 2026) تک تمام بابوں کے README اور ورکشاپ دستاویزات میں
- **🤖 باب 2 ایکسٹینشن نوٹ** `azure.ai.agents` `0.1.18-preview` سے `0.1.40-preview` تک اپ ڈیٹ کیا گیا
- **🧪 ورکشاپ ویلیڈیشن مثال** (`azd version` آؤٹ پٹ) کو `1.25.6` میں اپ ڈیٹ کیا گیا
- **🧭 README "آج azd میں کیا نیا ہے"** کو مکمل ایجنٹ لائف سائیکل، نئے AI ایکسٹینشنز، اور حالیہ کوالٹی آف لائیف فکسز (جیسے `azd init` کی ایڈمپوٹینسی، `azd auth login` سٹیل ٹوکن کی صفائی، `azd tool` پہلی بار پرامپٹ) کو نمایاں کرتے ہوئے ریفریش کیا گیا
- **📖 باب 2 agents.md (اختیار 4)** اب سیکھنے والوں کو تعیناتی کے بعد کے لائف سائیکل کمانڈز کی طرف اشارہ کرتا ہے بجائے `azd up` پر رکے

#### درست کیا گیا
- **🏷️ پروڈکٹ نام کی تصحیح** — اسپائر ری برانڈ نوٹ شامل کیا گیا (".NET Aspire" اب صرف "Aspire" ہے)؛ azd کی اسپائر سپورٹ میں کوئی تبدیلی نہیں
- **🔎 لائیو ریلیز ویلیڈیشن** ایزور ڈیولپر CLI ریلیز فیڈ کے خلاف تصدیق شدہ: مستحکم CLI `1.25.6` (2026-06-12) اور `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### اپ ڈیٹ کی گئی فائلز
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### مبتدئ کے لیے آن بورڈنگ وضاحت، سیٹ اپ کی تصدیق اور آخری AZD کمانڈ صفائی  
**یہ ورژن AZD 1.23 کی تصدیقی جانچ کے بعد مبتدئین کے لیے دستاویزات کا جائزہ پیش کرتا ہے: یہ AZD-فرسٹ تصدیق کے رہنما اصول کو واضح کرتا ہے، مقامی سیٹ اپ کی جانچ کے اسکرپٹس شامل کرتا ہے، اہم کمانڈز کو لائیو AZD CLI کے خلاف جانچتا ہے، اور چینج لاگ کے علاوہ آخری پرانی انگریزی ماخذ کمانڈ حوالہ جات کو ہٹاتا ہے۔**

#### شامل کیا گیا  
- **🧪 مبتدئین کے سیٹ اپ کی تصدیق کے اسکرپٹس** `validate-setup.ps1` اور `validate-setup.sh` کے ساتھ تاکہ سیکھنے والے باب 1 شروع کرنے سے پہلے مطلوبہ ٹولز کی تصدیق کر سکیں  
- **✅ ابتدائی سیٹ اپ کی تصدیقی مراحل** روٹ README اور باب 1 README میں تاکہ `azd up` چلانے سے پہلے گمشدہ ضروریات کو پکڑا جا سکے  

#### تبدیل کیا گیا  
- **🔐 مبتدئین کی توثیق کی رہنمائی** اب مستقل طور پر `azd auth login` کو AZD ورک فلو کے لیے بنیادی راستہ سمجھتی ہے، جبکہ `az login` کو اختیاری بتایا گیا ہے جب تک کہ Azure CLI کمانڈز براہ راست استعمال نہ کی جائیں  
- **📚 باب 1 آن بورڈنگ کا بہاؤ** اب سیکھنے والوں کو انسٹالیشن، توثیق، اور پہلے تعیناتی کے مراحل سے پہلے ان کے مقامی سیٹ اپ کی تصدیق کرنے کی ہدایت دیتا ہے  
- **🛠️ ویلڈیٹر کے پیغامات** اب AZD کے صرف مبتدئین کے راستے کے لیے بلاکنگ ضروریات کو واضح طور پر Azure CLI کی اختیاری انتباہات سے جدا کرتے ہیں  
- **📖 کنفیگریشن، مسائل حل کرنے اور مثال کی دستاویزات** اب واضح کرتی ہیں کہ لازمی AZD توثیق اور اختیاری Azure CLI سائن ان کہاں کہاں ہے، جبکہ پہلے دونوں بغیر پس منظر کے پیش کیے جاتے تھے  

#### درست کیا گیا  
- **📋 باقی ماندہ انگریزی ماخذ کمانڈ حوالہ جات** موجودہ AZD فارم میں اپ ڈیٹ کیے گئے، بشمول `azd config show` چیٹ شیٹ میں اور `azd monitor --overview` جہاں Azure پورٹل اوور ویو رہنمائی مطلوب تھی  
- **🧭 باب 1 میں مبتدئ دعوے** نرم کیے گئے تاکہ تمام ٹیمپلیٹ اور Azure وسائل میں بلکل صفر خرابی یا رول بیک کے وعدے سے بچا جا سکے  
- **🔎 لائیو CLI تصدیق** نے موجودہ سپورٹ کی تصدیق کی جیسے `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, اور `azd down --force --purge`  

#### اپ ڈیٹ شدہ فائلز  
- `README.md`  
- `changelog.md`  
- `docs/chapter-01-foundation/README.md`  
- `docs/chapter-01-foundation/azd-basics.md`  
- `docs/chapter-01-foundation/installation.md`  
- `docs/chapter-01-foundation/first-project.md`  
- `docs/chapter-03-configuration/README.md`  
- `docs/chapter-07-troubleshooting/README.md`  
- `examples/container-app/README.md`  
- `examples/database-app/README.md`  
- `resources/cheat-sheet.md`  
- `validate-setup.ps1`  
- `validate-setup.sh`  

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 کی تصدیق، ورکشاپ ماحول کی توسیع اور AI ماڈل کی تجدید  
**یہ ورژن `azd` `1.23.12` کے خلاف دستاویزات کی تصدیقی جانچ کرتا ہے، پرانی AZD کمانڈ کی مثالوں کو اپ ڈیٹ کرتا ہے، AI ماڈل کی رہنمائی کو موجودہ ڈیفالٹس کے مطابق تازہ کرتا ہے، اور ورکشاپ کی ہدایات کو GitHub Codespaces کے علاوہ ڈیولپمنٹ کنٹینرز اور مقامی کلونز کی بھی سپورٹ دیتا ہے۔**

#### شامل کیا گیا  
- **✅ بنیادی ابواب اور ورکشاپ دستاویزات میں تصدیقی نوٹس** تاکہ نئے یا پرانے CLI کلائنٹس استعمال کرنے والے سیکھنے والوں کے لیے ٹیسٹ شدہ AZD کی بنیاد واضح ہو  
- **⏱️ طویل AI ایپ تعیناتیوں کے لیے ٹائم آؤٹ رہنمائی** `azd deploy --timeout 1800` کے استعمال کے ساتھ  
- **🔎 ایکسٹینشن معائنہ کے مراحل** AI ورک فلو دستاویزات میں `azd extension show azure.ai.agents` کے ساتھ  
- **🌐 ورکشاپ ماحول کی وسیع تر رہنمائی** جس میں GitHub Codespaces، ڈویلپمنٹ کنٹینرز، اور مقامی کلونز کو MkDocs کے ساتھ کور کیا گیا ہے  

#### تبدیل کیا گیا  
- **📚 ابواب کے تعارفی README** مستقل طور پر نوٹ کرتے ہیں کہ `azd 1.23.12` کے خلاف تصدیق کی گئی ہے بنیادی، کنفیگریشن، انفراسٹرکچر، ملٹی ایجنٹ، پری ڈپلائمنٹ، مسائل حل کرنے، اور پروڈکشن سیکشنز میں  
- **🛠️ AZD کمانڈ کے حوالہ جات** موجودہ شکلوں میں اپ ڈیٹ کیے گئے:  
  - `azd config list` → `azd config show`  
  - `azd env show` → `azd env list` یا `azd env get-value(s)` سیاق و سباق کے مطابق  
  - `azd auth whoami` → `azd auth status`  
  - `azd monitor` → `azd monitor --overview` جہاں ایپلیکیشن انسائٹس اوور ویو مطلوب ہو  
- **🧪 پروویژن پریویو کی مثالیں** موجودہ سپورٹ شدہ استعمال میں سادگی کے ساتھ جیسے `azd provision --preview` اور `azd provision --preview -e production`  
- **🧭 ورکشاپ کا بہاؤ** اپ ڈیٹ کیا گیا تاکہ سیکھنے والے لیبز Codespaces، ڈویلپمنٹ کنٹینر، یا مقامی کلون میں مکمل کر سکیں بجائے اس کے کہ صرف Codespaces میں فرض کیا جائے  
- **🔐 توثیق کی رہنمائی** اب AZD ورک فلو کے لیے `azd auth login` کو ترجیح دیتی ہے، جبکہ `az login` کو اختیاری قرار دیا گیا جب Azure CLI کمانڈز براہ راست استعمال ہوں  

#### درست کیا گیا  
- **🪟 ونڈوز انسٹال کمانڈ** انسٹالیشن گائیڈ میں موجودہ `winget` پیکیج کیسنگ کے مطابق معمول پر لائے گئے  
- **🐧 لینکس انسٹال رہنمائی** ایسی تقسیم کے مخصوص `azd` پیکیج مینیجر ہدایات سے بچنے کے لیے درست کی گئی اور جہاں مناسب ہو ریلیز اثاثوں کی طرف اشارہ کیا گیا  
- **📦 AI ماڈل کی مثالیں** پرانے ڈیفالٹس جیسے `gpt-35-turbo` اور `text-embedding-ada-002` سے موجودہ مثالوں جیسے `gpt-4.1-mini`, `gpt-4.1`، اور `text-embedding-3-large` میں تجدید کی گئی  
- **📋 تعیناتی اور تشخیصی کوڈ کے نمونے** موجودہ ماحول اور اسٹیٹس کمانڈز کے استعمال کے لیے درست کیے گئے، بشمول لاگز، اسکرپٹس، اور مسئلہ حل کرنے کے مراحل  
- **⚙️ GitHub Actions رہنمائی** کو `Azure/setup-azd@v1.0.0` سے `Azure/setup-azd@v2` میں اپ ڈیٹ کیا گیا  
- **🤖 MCP/Copilot رضامندی کی رہنمائی** کو `azd mcp consent` سے `azd copilot consent list` میں اپ ڈیٹ کیا گیا  

#### بہتر بنایا گیا  
- **🧠 AI باب کی رہنمائی** اب پریویو حساس `azd ai` رویے، ٹیننٹ مخصوص لاگ ان، موجودہ ایکسٹینشن استعمال، اور اپ ڈیٹ شدہ ماڈل تعیناتی کی سفارشات کو بہتر وضاحت دیتی ہے  
- **🧪 ورکشاپ کی ہدایات** اب زیادہ حقیقت پسندانہ ورژن کی مثالیں اور واضح ماحول ترتیب کی زبان استعمال کرتی ہیں ہینڈز آن لیبز کے لیے  
- **📈 پروڈکشن اور مسئلہ حل کرنے کی دستاویزات** اب موجودہ مانیٹرنگ، بیک اپ ماڈل، اور لاگت کی سطح کی مثالوں کے ساتھ بہتر ہم آہنگ ہیں  

#### اپ ڈیٹ شدہ فائلیں  
- `docs/chapter-01-foundation/README.md`  
- `docs/chapter-01-foundation/azd-basics.md`  
- `docs/chapter-01-foundation/installation.md`  
- `docs/chapter-02-ai-development/README.md`  
- `docs/chapter-02-ai-development/agents.md`  
- `docs/chapter-02-ai-development/ai-model-deployment.md`  
- `docs/chapter-02-ai-development/ai-workshop-lab.md`  
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`  
- `docs/chapter-03-configuration/README.md`  
- `docs/chapter-03-configuration/configuration.md`  
- `docs/chapter-04-infrastructure/README.md`  
- `docs/chapter-04-infrastructure/deployment-guide.md`  
- `docs/chapter-04-infrastructure/provisioning.md`  
- `docs/chapter-05-multi-agent/README.md`  
- `docs/chapter-06-pre-deployment/README.md`  
- `docs/chapter-06-pre-deployment/preflight-checks.md`  
- `docs/chapter-07-troubleshooting/README.md`  
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`  
- `docs/chapter-07-troubleshooting/common-issues.md`  
- `docs/chapter-08-production/README.md`  
- `docs/chapter-08-production/production-ai-practices.md`  
- `workshop/README.md`  
- `workshop/docs/index.md`  
- `workshop/docs/instructions/1-Select-AI-Template.md`  
- `workshop/docs/instructions/2-Validate-AI-Template.md`  
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`  
- `workshop/docs/instructions/5-Customize-AI-Template.md`  

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI کمانڈز، مواد کی تصدیق اور ٹیمپلیٹ کی توسیع  
**یہ ورژن تمام AI متعلقہ ابواب میں `azd ai`, `azd extension`, اور `azd mcp` کمانڈز کا احاطہ کرتا ہے، agents.md میں خراب روابط اور متروک کوڈ درست کرتا ہے، چیٹ شیٹ کو اپ ڈیٹ کرتا ہے، اور مثال ٹیمپلیٹس کے سیکشن کی مکمل تزئین و آرائش کرتا ہے جس میں تصدیق شدہ وضاحتیں اور نئے Azure AI AZD ٹیمپلیٹس شامل ہیں۔**

#### شامل کیا گیا  
- **🤖 AZD AI CLI کوریج** 7 فائلوں میں (پہلے صرف باب 8 میں):  
  - `docs/chapter-01-foundation/azd-basics.md` — نیا "Extensions and AI Commands" سیکشن جو `azd extension`, `azd ai agent init`, اور `azd mcp` متعارف کراتا ہے  
  - `docs/chapter-02-ai-development/agents.md` — آپشن 4: `azd ai agent init` کے ساتھ موازنہ ٹیبل (ٹیمپلیٹ بمقابلہ مینی فیسٹ طریقہ)  
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" اور "Agent-First Deployment" ذیلی حصے  
  - `docs/chapter-05-multi-agent/README.md` — تیز آغاز اب ٹیمپلیٹ اور مینی فیسٹ کی بنیاد پر تعیناتی کے راستے دکھاتا ہے  
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — تعیناتی سیکشن اب `azd ai agent init` آپشن شامل کرتا ہے  
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" ذیلی سیکشن  
  - `resources/cheat-sheet.md` — نیا "AI & Extensions Commands" سیکشن جس میں `azd extension`, `azd ai agent init`, `azd mcp`, اور `azd infra generate` شامل ہیں  
- **📦 نئے AZD AI مثال ٹیمپلیٹس** `microsoft-foundry-integration.md` میں:  
  - **azure-search-openai-demo-csharp** — .NET RAG چیٹ بلےزر ویب اسمبلی، سیمانٹک کرنل، اور وائس چیٹ سپورٹ کے ساتھ  
  - **azure-search-openai-demo-java** — جاوا RAG چیٹ Langchain4J کے ساتھ ACA/AKS تعیناتی اختیارات کے ساتھ  
  - **contoso-creative-writer** — ملٹی ایجنٹ تخلیقی تحریری ایپ Azure AI Agent سروس، Bing Grounding، اور Prompty کے ساتھ  
  - **serverless-chat-langchainjs** — سرور لیس RAG Azure Functions + LangChain.js + Cosmos DB کے ساتھ Ollama مقامی ڈیولپمنٹ سپورٹ کے ساتھ  
  - **chat-with-your-data-solution-accelerator** — انٹرپرائز RAG ایکسلریٹر ایڈمن پورٹل، ٹیمز انٹیگریشن، اور PostgreSQL/Cosmos DB اختیارات کے ساتھ  
  - **azure-ai-travel-agents** — ملٹی ایجنٹ MCP آرکسٹریشن حوالہ ایپ .NET, پائتھون، جاوا، اور ٹائپ اسکرپٹ میں سرورز کے ساتھ  
  - **azd-ai-starter** — کم سے کم Azure AI انفراسٹرکچر بائسپ اسٹارٹر ٹیمپلیٹ  
  - **🔗 شاندار AZD AI گیلری لنک** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ ٹیمپلیٹس) کا حوالہ  

#### درست کیا گیا  
- **🔗 agents.md نیوی گیشن**: پچھلے/اگلے لنکس اب باب 2 README سبق کے ترتیب کے مطابق ہیں (Microsoft Foundry Integration → Agents → AI Model Deployment)  
- **🔗 agents.md خراب لنکس**: `production-ai-practices.md` کو `../chapter-08-production/production-ai-practices.md` میں درست کیا گیا (3 جگہ)  
- **📦 agents.md متروک کوڈ**: `opencensus` کو `azure-monitor-opentelemetry` + OpenTelemetry SDK سے تبدیل کیا گیا  
- **🐛 agents.md غیر درست API**: `max_tokens` کو `create_agent()` سے `create_run()` میں `max_completion_tokens` کے طور پر منتقل کیا گیا  
- **🔢 agents.md ٹوکن گنتی**: تخمینہ `len//4` کو `tiktoken.encoding_for_model()` کے ساتھ بدلا گیا  
- **azure-search-openai-demo**: سروسز کو "Cognitive Search + App Service" سے "Azure AI Search + Azure Container Apps" میں درست کیا گیا (اکتوبر 2024 میں ڈیفالٹ ہوسٹ تبدیل ہوا)  
- **contoso-chat**: وضاحت کو Azure AI Foundry + Prompty کے حوالے سے اپ ڈیٹ کیا گیا، ریپو کے اصل عنوان اور ٹیک اسٹیک کے مطابق  

#### ہٹایا گیا  
- **ai-document-processing**: غیر فعال ٹیمپلیٹ حوالہ ہٹایا گیا (ریپو عوامی طور پر AZD ٹیمپلیٹ کے طور پر دستیاب نہیں)  

#### بہتر بنایا گیا  
- **📝 agents.md مشقیں**: مشق 1 اب متوقع آؤٹ پٹ اور `azd monitor` مرحلہ دکھاتی ہے؛ مشق 2 میں مکمل `FunctionTool` رجسٹریشن کوڈ شامل ہے؛ مشق 3 مبہم رہنمائی کو واضح `prepdocs.py` کمانڈز سے بدل دیا گیا  
- **📚 agents.md وسائل**: دستاویزات کے روابط کو موجودہ Azure AI Agent سروس کی دستاویزات اور کوئیک اسٹارٹ سے اپ ڈیٹ کیا گیا  
- **📋 agents.md اگلے مراحل کی جدول**: AI ورکشاپ لیب لنک شامل کی گئی مکمل باب  کور کرنے کے لیے  

#### اپ ڈیٹ شدہ فائلیں  
- `docs/chapter-01-foundation/azd-basics.md`  
- `docs/chapter-02-ai-development/agents.md`  
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`  
- `docs/chapter-05-multi-agent/README.md`  
- `docs/chapter-06-pre-deployment/coordination-patterns.md`  
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`  
- `resources/cheat-sheet.md`  

---

### [v3.17.0] - 2026-02-05
#### بہتری برائے نیویگیشن کورس  
**یہ ورژن README.md کے چیپٹر نیویگیشن کو بہتر ٹیبل فارمیٹ کے ساتھ بہتر بناتا ہے۔**

#### تبدیلیاں  
- **کورس میپ ٹیبل**: براہ راست اسباق کے لنکس، دورانیہ کی تخمینے، اور پیچیدگی کی درجہ بندی کے ساتھ بہتر بنایا گیا  
- **فولڈر کلین اپ**: پرانے غیر ضروری فولڈرز ہٹائے گئے (deployment/, getting-started/, pre-deployment/, troubleshooting/)  
- **لنک ویلیڈیشن**: کورس میپ ٹیبل میں موجود 21+ داخلی لنکس کی تصدیق کی گئی  

### [v3.16.0] - 2026-02-05  

#### پروڈکٹ کے نام کی اپڈیٹس  
**یہ ورژن موجودہ مائیکروسافٹ برانڈنگ کے مطابق پروڈکٹ ریفرنسز کو اپ ڈیٹ کرتا ہے۔**

#### تبدیلیاں  
- **Microsoft Foundry → Microsoft Foundry**: ترجمہ سے استثنیٰ غیر ترجمہ فائلوں میں تمام حوالے اپڈیٹ کیے گئے  
- **Azure AI Agent Service → Foundry Agents**: سروس کا نام موجودہ برانڈنگ کے مطابق اپڈیٹ کیا گیا  

#### اپڈیٹ کردہ فائلز  
- `README.md` - مین کورس لینڈیگ پیج  
- `changelog.md` - ورژن ہسٹری  
- `course-outline.md` - کورس کا ڈھانچہ  
- `docs/chapter-02-ai-development/agents.md` - AI ایجنٹس گائیڈ  
- `examples/README.md` - مثالوں کی دستاویز  
- `workshop/README.md` - ورکشاپ لینڈنگ پیج  
- `workshop/docs/index.md` - ورکشاپ انڈیکس  
- `workshop/docs/instructions/*.md` - تمام ورکشاپ انسٹرکشن فائلز  

---

### [v3.15.0] - 2026-02-05  

#### مرکزی ریپوزیٹری کا بڑے پیمانے پر ساخت نو: چیپٹر بیسڈ فولڈر نام  
**یہ ورژن دستاویزات کو واضح نیویگیشن کے لیے مخصوص چیپٹر فولڈرز میں منظم کرتا ہے۔**

#### فولڈرز کے نام تبدیل ہوئے  
پرانے فولڈرز چیپٹر نمبر والے فولڈرز سے تبدیل کیے گئے:  
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`  
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`  
- `docs/deployment/` → `docs/chapter-04-infrastructure/`  
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`  
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`  
- نیا شامل: `docs/chapter-05-multi-agent/`  

#### فائل مائیگریشنز  
| فائل | سے | کو |  
|------|------|---|  
| azd-basics.md | getting-started/ | chapter-01-foundation/ |  
| installation.md | getting-started/ | chapter-01-foundation/ |  
| first-project.md | getting-started/ | chapter-01-foundation/ |  
| configuration.md | getting-started/ | chapter-03-configuration/ |  
| authsecurity.md | getting-started/ | chapter-03-configuration/ |  
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |  
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |  
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |  
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |  
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |  
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |  
| provisioning.md | deployment/ | chapter-04-infrastructure/ |  
| تمام pre-deployment فائلز | pre-deployment/ | chapter-06-pre-deployment/ |  
| تمام troubleshooting فائلز | troubleshooting/ | chapter-07-troubleshooting/ |  

#### شامل کیا گیا  
- **📚 چیپٹر README فائلز**: ہر چیپٹر فولڈر میں README.md بنایا گیا جس میں:  
  - سیکھنے کے مقاصد اور دورانیہ  
  - اسباق کی ٹیبل جن میں وضاحتیں  
  - جلد شروع کرنے کے کمانڈز  
  - دوسرے چیپٹرز کے لیے نیویگیشن  

#### تبدیلیاں  
- **🔗 تمام داخلی لنکس اپڈیٹ کیے گئے**: 78+ پاتھز تمام دستاویزات میں اپڈیٹ ہوئے  
- **🗺️ مین README.md**: کورس میپ نئی چیپٹر ساخت کے ساتھ اپڈیٹ کیا گیا  
- **📝 examples/README.md**: چیپٹر فولڈرز کے کراس ریفرنسز اپڈیٹ کیے گئے  

#### ہٹایا گیا  
- پرانا فولڈر ڈھانچہ (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)  

---

### [v3.14.0] - 2026-02-05  

#### ریپوزیٹری کی ساخت نو: چیپٹر نیویگیشن  
**اس ورژن میں چیپٹر نیویگیشن کے README فائلز شامل کیے گئے جو v3.15.0 سے تبدیل ہو چکے ہیں۔**  

---

### [v3.13.0] - 2026-02-05  

#### نیا AI ایجنٹس گائیڈ  
**یہ ورژن Azure Developer CLI کے ساتھ AI ایجنٹس کی تعیناتی کے لیے مکمل گائیڈ شامل کرتا ہے۔**

#### شامل کیا گیا  
- **🤖 docs/microsoft-foundry/agents.md**: مکمل گائیڈ جو درج ذیل پر مشتمل ہے:  
  - AI ایجنٹس کیا ہیں اور وہ چیٹ بوٹس سے کیسے مختلف ہیں  
  - تین کوئیک اسٹارٹ ایجنٹ ٹیمپلیٹس (Foundry Agents, Prompty, RAG)  
  - ایجنٹ آرکیٹیکچر پیٹرنز (سنگل ایجنٹ، RAG، ملٹی ایجنٹ)  
  - ٹول کی ترتیب اور تخصیص  
  - مانیٹرنگ اور میٹرکس کا تعاقب  
  - لاگت کے پہلو اور بہتر بنانا  
  - عمومی مسئلہ حل کرنے کے مناظر  
  - تین عملی مشقیں جن کے کامیابی کے معیار ہیں  

#### مواد کی ساخت  
- **تعارف**: ابتدائیوں کے لیے ایجنٹ تصورات  
- **کوئیک اسٹارٹ**: `azd init --template get-started-with-ai-agents` کے ساتھ ایجنٹس کی تعیناتی  
- **آرکیٹیکچر پیٹرنز**: ایجنٹ پیٹرنز کے بصری خاکے  
- **تشکیل**: ٹول سیٹ اپ اور ماحول کی متغیرات  
- **مانیٹرنگ**: اپلیکیشن انسائٹس انٹیگریشن  
- **مشقیں**: قدم بہ قدم عملی سیکھائی (ہر ایک 20-45 منٹ)  

---

### [v3.12.0] - 2026-02-05  

#### DevContainer ماحول کی اپڈیٹ  
**یہ ورژن AZD سیکھنے کے تجربے کے لیے جدید ٹولز اور بہتر ڈیفالٹس کے ساتھ ڈیولپمنٹ کنٹینر کی ترتیب اپڈیٹ کرتا ہے۔**

#### تبدیلیاں  
- **🐳 بیس امیج**: `python:3.12-bullseye` سے `python:3.12-bookworm` (جدید ترین Debian مستحکم) میں اپڈیٹ  
- **📛 کنٹینر کا نام**: "Python 3" سے "AZD for Beginners" میں واضح بنانے کے لیے تبدیل کیا گیا  

#### شامل کیا گیا  
- **🔧 نئے ڈیو کنٹینر فیچرز**:  
  - `azure-cli` بائسِپ سپورٹ کے ساتھ فعال  
  - `node:20` (AZD ٹیمپلیٹس کے لیے LTS ورژن)  
  - `github-cli` ٹیمپلیٹ مینجمنٹ کے لیے  
  - `docker-in-docker` کنٹینر ایپ تعیناتیوں کے لیے  

- **🔌 پورٹ فارورڈنگ**: عام ڈیولپمنٹ کے لیے پہلے سے ترتیب شدہ پورٹس:  
  - 8000 (MkDocs پریویو)  
  - 3000 (ویب ایپس)  
  - 5000 (Python Flask)  
  - 8080 (APIs)  

- **🧩 نئے VS کوڈ ایکسٹینشنز**:  
  - `ms-python.vscode-pylance` - بہتر Python IntelliSense  
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions کی حمایت  
  - `ms-azuretools.vscode-docker` - Docker کی حمایت  
  - `ms-azuretools.vscode-bicep` - Bicep لینگویج سپورٹ  
  - `ms-azure-devtools.azure-resource-groups` - Azure ریسورس مینجمنٹ  
  - `yzhang.markdown-all-in-one` - مارک ڈاؤن ایڈیٹنگ  
  - `DavidAnson.vscode-markdownlint` - مارک ڈاؤن لنٹنگ  
  - `bierner.markdown-mermaid` - Mermaid ڈایاگرام سپورٹ  
  - `redhat.vscode-yaml` - YAML سپورٹ (azure.yaml کے لیے)  
  - `eamodio.gitlens` - گٹ وژولائزیشن  
  - `mhutchie.git-graph` - گٹ ہسٹری  

- **⚙️ VS کوڈ سیٹنگز**: Python انٹرپریٹر، سیو پر فارمیٹ، اور وائٹ اسپیس ٹرم کرنے کے لیے ڈیفالٹ سیٹنگز شامل کی گئیں  

- **📦 requirements-dev.txt اپڈیٹ**:  
  - MkDocs منیفائی پلگ ان شامل کیا گیا  
  - کوڈ کوالٹی کے لیے pre-commit شامل کیا گیا  
  - Azure SDK پیکجز شامل کیے گئے (azure-identity, azure-mgmt-resource)  

#### درست کیا گیا  
- **Post-Create کمانڈ**: کنٹینر اسٹارٹ پر AZD اور Azure CLI کی تنصیب کی تصدیق کرتا ہے  

---

### [v3.11.0] - 2026-02-05  

#### ابتدائیوں کے لیے README کا بڑے پیمانے پر احیاء  
**یہ ورژن README.md کو ابتدائیوں کے لیے آسان بناتا ہے اور AI ڈویلپرز کے لیے اہم وسائل شامل کرتا ہے۔**

#### شامل کیا گیا  
- **🆚 Azure CLI بمقابلہ AZD موازنہ**: ہر ٹول کے استعمال کا وقت واضح وضاحت کے ساتھ عملی مثالیں  
- **🌟 بہترین AZD لنکس**: کمیونٹی ٹیمپلیٹ گیلری اور حصہ لینے کے وسائل کے ڈائریکٹ لنکس:  
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ریڈی ٹو ڈیپلائے ٹیمپلیٹس  
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - کمیونٹی شراکت  
- **🎯 کوئیک اسٹارٹ گائیڈ**: سادہ 3-مرحلہ وار شروع کرنے کا سیکشن (انسٹال → لاگ ان → تعیناتی)  
- **📊 تجربے کی بنیاد پر نیویگیشن ٹیبل**: ڈویلپر کے تجربے کی بنیاد پر واضح رہنمائی  

#### تبدیلیاں  
- **README کی ساخت**: مرحلہ وار انکشاف کے لیے دوبارہ ترتیب دیا گیا - اہم معلومات پہلے  
- **تعارفی سیکشن**: مکمل ابتدائیوں کے لیے "The Magic of `azd up`" کی وضاحت کی گئی  
- **ڈوپلیکٹ مواد ہٹایا گیا**: ڈپلیکٹ ٹربل شوٹنگ سیکشن ختم کیا گیا  
- **ٹربل شوٹنگ کمانڈز**: `azd logs` کی جگہ درست `azd monitor --logs` استعمال کرنے کا حوالہ دیا گیا  

#### درست کیا گیا  
- **🔐 توثیق کمانڈز**: cheat-sheet.md میں `azd auth login` اور `azd auth logout` شامل کیے گئے  
- **غلط کمانڈ ریفرنسز**: README کے ٹربل شوٹنگ سیکشن سے باقی `azd logs` ہٹائے گئے  

#### نوٹس  
- **دائرہ کار**: تبدیلیاں مین README.md اور resources/cheat-sheet.md پر نافذ  
- **ہدف کی ٹارگٹ آڈینس**: خاص طور پر AZD کے نو وارد ڈویلپرز کے لیے بہتریاں  

---

### [v3.10.0] - 2026-02-05  

#### Azure Developer CLI کمانڈ درستگی کی اپڈیٹ  
**یہ ورژن دستاویزات میں غیر موجود AZD کمانڈز کی اصلاح کرتا ہے، یہ یقینی بناتا ہے کہ تمام کوڈ کی مثالیں درست Azure Developer CLI نحو استعمال کرتی ہیں۔**

#### درست کیا گیا  
- **🔧 غیر موجود AZD کمانڈز ہٹائیں**: غلط کمانڈز کا جامع آڈٹ اور اصلاح:  
  - `azd logs` (موجود نہیں) → `azd monitor --logs` یا Azure CLI متبادل  
  - `azd service` سب کمانڈز (موجود نہیں) → `azd show` اور Azure CLI سے تبدیل  
  - `azd infra import/export/validate` (موجود نہیں) → ہٹایا یا درست متبادل سے تبدیل  
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` فلیگز (موجود نہیں) → ہٹائے گئے  
  - `azd provision --what-if/--rollback` فلیگز (موجود نہیں) → `--preview` استعمال کیا گیا  
  - `azd config validate` (موجود نہیں) → `azd config list` سے تبدیل  
  - `azd info`, `azd history`, `azd metrics` (موجود نہیں) → ہٹائے گئے  

- **📚 کمانڈ اصلاحات کے ساتھ اپڈیٹ شدہ فائلز**:  
  - `resources/cheat-sheet.md`: کمانڈ ریفرنس میں بڑی اصلاح  
  - `docs/deployment/deployment-guide.md`: رول بیک اور تعیناتی حکمت عملی صحیح کی  
  - `docs/troubleshooting/debugging.md`: لاگ تجزیہ سیکشن درست کیے  
  - `docs/troubleshooting/common-issues.md`: ٹربل شوٹنگ کمانڈز اپڈیٹ  
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD ڈیبگنگ سیکشن درست کیا  
  - `docs/getting-started/azd-basics.md`: مانیٹرنگ کمانڈز درست کیں  
  - `docs/getting-started/first-project.md`: مانیٹرنگ اور ڈیبگنگ مثالیں اپڈیٹ  
  - `docs/getting-started/installation.md`: ہیلپ اور ورژن مثالیں درست کیں  
  - `docs/pre-deployment/application-insights.md`: لاگ دیکھنے والے کمانڈز درست کیے  
  - `docs/pre-deployment/coordination-patterns.md`: ایجنٹ ڈیبگنگ کمانڈز درست کیے  

- **📝 ورژن ریفرنس اپڈیٹ**:  
  - `docs/getting-started/installation.md`: ہارڈ کوڈڈ `1.5.0` ورژن کو عام `1.x.x` سے بدل کر ریلیزز کا لنک دیا گیا  

#### تبدیلیاں  
- **رول بیک حکمت عملیاں**: دستاویزات کو Git-based رول بیک کے استعمال کے لیے اپڈیٹ کیا گیا (AZD میں مقامی رول بیک نہیں ہے)  
- **لاگ دیکھنا**: `azd logs` حوالہ جات کی جگہ `azd monitor --logs`, `azd monitor --live`، اور Azure CLI کمانڈز استعمال کیے گئے  
- **کارکردگی کا سیکشن**: غیر موجود متوازی/انکریمنٹل تعیناتی فلیگز ہٹا دیے گئے، درست متبادل فراہم کیے گئے  

#### تکنیکی تفصیلات  
- **درست AZD کمانڈز**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`  
- **درست azd monitor فلیگز**: `--live`, `--logs`, `--overview`  
- **ہٹائے گئے فیچرز**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`  

#### نوٹس  
- **تصدیق**: کمانڈز Azure Developer CLI v1.23.x کے مطابق تصدیق شدہ  

---

### [v3.9.0] - 2026-02-05  

#### ورکشاپ مکمل اور دستاویزات کی معیار کی بہتری  
**یہ ورژن انٹرایکٹو ورکشاپ ماڈیولز مکمل کرتا ہے، تمام ٹوٹے ہوئے دستاویزات لنکس ٹھیک کرتا ہے، اور مائیکروسافٹ AZD استعمال کرنے والے AI ڈویلپرز کے لیے مجموعی مواد کے معیار کو بہتر بناتا ہے۔**

#### شامل کیا گیا  
- **📝 CONTRIBUTING.md**: نیا کنٹریبیوشن گائیڈ لائنز دستاویز جس میں:  
  - مسائل رپورٹ کرنے اور تبدیلی کی تجاویز دینے کی واضح ہدایات  
  - نئے مواد کے لیے دستاویزاتی معیار
  - کوڈ مثال کی رہنما خطوط اور کمیٹ پیغام کے قوانین
  - کمیونٹی کی شرکت کی معلومات

#### مکمل شدہ
- **🎯 ورکشاپ ماڈیول 7 (اختتام)**: مکمل طور پر اختتام ماڈیول کے ساتھ:
  - ورکشاپ کی کامیابیوں کا جامع خلاصہ
  - اہم تصورات کی سیکشن جس میں AZD، ٹیمپلیٹس، اور مائیکروسافٹ فاؤنڈری شامل ہیں
  - سیکھنے کے سفر کو جاری رکھنے کی سفارشات
  - ورکشاپ چیلنج مشقیں مشکلات کی درجہ بندی کے ساتھ
  - کمیونٹی کی رائے اور سپورٹ کے لنکس

- **📚 ورکشاپ ماڈیول 3 (تجزئیہ)**: سیکھنے کے مقاصد کو اپ ڈیٹ کیا گیا:
  - MCP سرورز کے ساتھ GitHub Copilot کو فعال کرنے کی رہنمائی
  - AZD ٹیمپلیٹ فولڈر کی ساخت کی سمجھ
  - انفراسٹرکچر-از-کوڈ (بائسکپ) تنظیمی نمونے
  - عملی لیب کی ہدایات

- **🔧 ورکشاپ ماڈیول 6 (صفائی)**: مکمل کیا گیا:
  - وسائل کی صفائی اور لاگت مینجمنٹ کے مقاصد
  - `azd down` کا استعمال محفوظ انفراسٹرکچر کو ختم کرنے کے لیے
  - نرم حذف شدہ علمی خدمات کی بازیافت کی رہنمائی
  - GitHub Copilot اور Azure پورٹل کے لیے اضافی دریافت کے اشارے

#### درست شدہ
- **🔗 ٹوٹے ہوئے لنک کی مرمت**: 15+ اندرونی دستاویزات کے ٹوٹے ہوئے لنکس حل کیے:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md کے راستے درست کیے گئے
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md اور production-ai-practices.md کے راستے درست کیے گئے
  - `docs/getting-started/first-project.md`: غیر موجود cicd-integration.md کو deployment-guide.md سے تبدیل کیا گیا
  - `examples/retail-scenario.md`: FAQ اور رکاوٹ دور کرنے کے رہنما کے راستے درست کیے گئے
  - `examples/container-app/microservices/README.md`: کورس ہوم اور ڈیپلائیمنٹ گائیڈ کے راستے درست کیے گئے
  - `resources/faq.md` اور `resources/glossary.md`: AI باب کے حوالے اپ ڈیٹ کیے گئے
  - `course-outline.md`: انسٹرکٹر گائیڈ اور AI ورکشاپ لیب کے حوالے درست کیے گئے

- **📅 ورکشاپ اسٹیٹس بینر**: "Under Construction" سے فعال ورکشاپ کی حالت پر اپ ڈیٹ، تاریخ فروری 2026

- **🔗 ورکشاپ نیویگیشن**: ورکشاپ README.md میں ٹوٹے ہوئے نیویگیشن لنکس درست کیے جو غیر موجود lab-1-azd-basics فولڈر کی طرف اشارہ کر رہے تھے

#### تبدیل شدہ
- **ورکشاپ پیشکش**: "under construction" وارننگ ہٹا دی گئی، ورکشاپ اب مکمل اور استعمال کے لیے تیار ہے
- **نیویگیشن کی ہم آہنگی**: تمام ورکشاپ ماڈیول میں مناسب بین ماڈیول نیویگیشن یقینی بنائی گئی
- **سیکھنے کے راستے کے حوالے**: باب 3 اور 6 میں درست microsoft-foundry راستے اپ ڈیٹ کیے گئے

#### تصدیق شدہ
- ✅ تمام انگریزی مارک ڈاؤن فائلوں میں درست اندرونی لنکس ہیں
- ✅ ورکشاپ ماڈیول 0-7 مکمل ہیں سیکھنے کے مقاصد کے ساتھ
- ✅ ابواب اور ماڈیولز کے درمیان نیویگیشن درست کام کرتی ہے
- ✅ مواد AI ڈویلپرز کے لیے Microsoft AZD استعمال کرنے کے قابل ہے
- ✅ مبتدی دوستانہ زبان اور ساخت برقرار رکھی گئی ہے
- ✅ CONTRIBUTING.md کمیونٹی تعاون کے لیے واضح رہنمائی فراہم کرتا ہے

#### تکنیکی نفاذ
- **لنک کی توثیق**: خودکار PowerShell اسکرپٹ نے تمام .md اندرونی لنکس کی جانچ کی
- **مواد کا آڈٹ**: ورکشاپ کی مکملتا اور مبتدئہ موافقت کے لیے دستی جائزہ
- **نیویگیشن سسٹم**: ابواب اور ماڈیول نیویگیشن کے پیٹرنز مسلسل لاگو کیے گئے

#### نوٹس
- **دائرہ کار**: تبدیلیاں صرف انگریزی دستاویزات پر لاگو کی گئیں
- **ترجمے**: اس ورژن میں ترجمہ فولڈرز کو اپ ڈیٹ نہیں کیا گیا (خودکار ترجمہ بعد میں ہم آہنگ کیا جائے گا)
- **ورکشاپ دورانیہ**: مکمل ورکشاپ اب 3-4 گھنٹے کے عملی سیکھنے کی فراہمی کرتی ہے

---

### [v3.8.0] - 2025-11-19

#### جدید دستاویزات: مانیٹرنگ، سیکیورٹی، اور کثیر ایجنٹ پیٹرنز
**یہ ورژن ایپلیکیشن انسائٹس انٹیگریشن، توثیق کے نمونے، اور پیداواری تعیناتیوں کے لیے کثیر ایجنٹ تعاون پر جامع A-گریڈ اسباق شامل کرتا ہے۔**

#### شامل کیا گیا
- **📊 ایپلیکیشن انسائٹس انٹیگریشن سبق**: `docs/pre-deployment/application-insights.md` میں:
  - AZD مرکوز تعیناتی کے ساتھ خودکار پروویژننگ
  - ایپلیکیشن انسائٹس + لاگ اینالٹیکس کے مکمل بائسکپ ٹیمپلیٹس
  - حسب ضرورت ٹیلیمیٹری کے ساتھ کام کرنے والے پائیتھن ایپلیکیشنز (1,200+ لائنیں)
  - AI/LLM مانیٹرنگ پیٹرنز (Microsoft Foundry ماڈلز ٹوکن/لاگت کا سراغ لگانا)
  - 6 مریمڈ ڈایاگرام (فن تعمیر، تقسیم شدہ ٹریسنگ، ٹیلیمیٹری فلو)
  - 3 عملی مشقیں (الرٹس، ڈیش بورڈز، AI مانیٹرنگ)
  - کسٹو کوئری کی مثالیں اور لاگت کی اصلاح کی حکمت عملی
  - لائیو میٹرکس اسٹریمنگ اور ریئل ٹائم ڈیبگنگ
  - 40-50 منٹ کا سیکھنے کا وقت پروڈکشن کے لیے تیار پیٹرنز کے ساتھ

- **🔐 توثیق اور سیکیورٹی پیٹرنز سبق**: `docs/getting-started/authsecurity.md` میں:
  - 3 توثیق کے نمونے (کنکشن سٹرنگ، کی ویالٹ، منیجڈ شناخت)
  - محفوظ تعیناتیوں کے لیے مکمل بائسک انفراسٹرکچر ٹیمپلیٹس
  - Azure SDK انٹیگریشن کے ساتھ Node.js ایپلیکیشن کوڈ
  - 3 مکمل مشقیں (منیجڈ شناخت کو فعال کرنا، یوزر-اسائنڈ شناخت، کی ویالٹ روٹیشن)
  - سیکیورٹی کی بہترین مشقیں اور RBAC کنفیگریشنز
  - مسئلے حل کرنے کے رہنما اور لاگت کا تجزیہ
  - پیداواری پاس ورڈ لیس توثیق کے نمونے

- **🤖 کثیر ایجنٹ تعاون کے نمونے سبق**: `docs/pre-deployment/coordination-patterns.md` میں:
  - 5 تعاون کے نمونے (تسلسل، متوازی، درجہ بندی، ایونٹ پر مبنی، اتفاق رائے)
  - مکمل آرکیسٹریٹر سروس نفاذ (پائیتھن/فلاسک، 1,500+ لائنیں)
  - 3 مخصوص ایجنٹ نفاز (ریسرچ، رائٹر، ایڈیٹر)
  - میسج کیوئنگ کے لیے سروس بس انٹیگریشن
  - Cosmos DB ریاست مینجمنٹ برائے تقسیم شدہ نظام
  - 6 مریمڈ ڈایاگرام ایجنٹ تعاملات دکھاتے ہوئے
  - 3 اعلیٰ سطح کی مشقیں (ٹائم آؤٹ ہینڈلنگ، ریٹری لاجک، سرکٹ بریکڑ)
  - لاگت کا تجزیہ ($240-565/ماہ) اور اصلاحی حکمت عملی
  - مانیٹرنگ کے لیے ایپلیکیشن انسائٹس انٹیگریشن

#### بہتر کیا گیا
- **پری-ڈیپلائمنٹ باب**: اب جامع مانیٹرنگ اور تعاون کے نمونے شامل ہیں
- **ابتدائی رہنمائی باب**: پیشہ ورانہ توثیقی نمونوں کے ساتھ مضبوط کیا گیا
- **پیداواری تیاریاں**: سیکیورٹی سے مشاہدہ تک مکمل کوریج
- **کورس آؤٹ لائن**: اب نئے اسباق کے حوالے باب 3 اور 6 میں شامل کیے گئے

#### تبدیل شدہ
- **سیکھنے کی پیشرفت**: سیکیورٹی اور مانیٹرنگ کا بہتر انضمام پورے کورس میں
- **دستاویزات کا معیار**: نئے اسباق میں مستقل A-گریڈ معیار (95-97%)  
- **پیداواری نمونے**: انٹرپرائز تعیناتیوں کے لیے مکمل اختتام سے اختتام تک کوریج

#### بہتر بنایا گیا
- **ڈویلپر کا تجربہ**: ترقی سے پیداواری مانیٹرنگ تک واضح راستہ
- **سیکیورٹی معیار**: توثیق اور راز مینجمنٹ کے لیے پیشہ ورانہ نمونے
- **مشاہداتی صلاحیت**: AZD کے ساتھ مکمل ایپلیکیشن انسائٹس انٹیگریشن
- **AI ورکلوڈز**: Microsoft Foundry ماڈلز اور کثیر ایجنٹ نظاموں کے لیے مخصوص مانیٹرنگ

#### تصدیق شدہ
- ✅ تمام اسباق میں مکمل کام کرنے والا کوڈ شامل ہے (چھوٹے حصے نہیں)
- ✅ بصری سیکھنے کے لیے مریمڈ ڈایاگرام (3 اسباق میں 19 کل)
- ✅ ہاتھوں پر مشقیں تصدیقی مراحل کے ساتھ (کل 9)
- ✅ `azd up` کے ذریعے تعیناتی کے قابل پیداواری بائسک ٹیمپلیٹس
- ✅ لاگت کا تجزیہ اور اصلاح کی حکمت عملی
- ✅ مسئلہ حل کرنے کے رہنما اور بہترین مشقیں
- ✅ علم کے نقاط تصدیقی کمانڈز کے ساتھ

#### دستاویزات گریڈنگ کے نتائج
- **docs/pre-deployment/application-insights.md**: - جامع مانیٹرنگ گائیڈ
- **docs/getting-started/authsecurity.md**: - پیشہ ورانہ سیکیورٹی نمونے
- **docs/pre-deployment/coordination-patterns.md**: - جدید کثیر ایجنٹ فن تعمیرات
- **مجموعی طور پر نیا مواد**: - مستقل اعلیٰ معیار

#### تکنیکی نفاذ
- **ایپلیکیشن انسائٹس**: لاگ اینالٹیکس + حسب ضرورت ٹیلیمیٹری + تقسیم شدہ ٹریسنگ
- **توثیق**: منیجڈ شناخت + کی ویالٹ + RBAC نمونے
- **کثیر ایجنٹ**: سروس بس + Cosmos DB + کنٹینر ایپس + آرکیسٹریشن
- **مانیٹرنگ**: لائیو میٹرکس + کسٹو کوئریز + الرٹس + ڈیش بورڈز
- **لاگت مینجمنٹ**: سیمپلنگ حکمت عملی، ڈیٹا کی حفاظت کی پالیسیاں، بجٹ کنٹرول

### [v3.7.0] - 2025-11-19

#### دستاویزات کے معیار میں بہتری اور نیا Microsoft Foundry ماڈلز مثال
**یہ ورژن ریپوزیٹری میں دستاویزات کے معیار کو بہتر کرتا ہے اور gpt-4.1 چیٹ انٹرفیس کے ساتھ مکمل Microsoft Foundry ماڈلز کی تعیناتی کی مثال شامل کرتا ہے۔**

#### شامل کیا گیا
- **🤖 Microsoft Foundry Models چیٹ مثال**: مکمل gpt-4.1 تعیناتی `examples/azure-openai-chat/` میں کام کرنے والے نفاذ کے ساتھ:
  - Microsoft Foundry ماڈلز کا مکمل انفراسٹرکچر (gpt-4.1 ماڈل تعیناتی)
  - گفتگو کی تاریخ کے ساتھ پائیتھن کمانڈ لائن چیٹ انٹرفیس
  - محفوظ API کی اسٹوریج کے لیے کی ویالٹ انٹیگریشن
  - ٹوکن استعمال کا سراغ لگانا اور لاگت کا تخمینہ
  - ریٹ لمٹنگ اور ایرر ہینڈلنگ
  - جامع README جس میں 35-45 منٹ کی تعیناتی ہدایات ہیں
  - 11 پیداواری فائلیں (بائسک ٹیمپلیٹس، پائیتھن ایپ، کنفیگریشن)

- **📚 دستاویزاتی مشقیں**: کنفیگریشن گائیڈ میں عملی مشقیں شامل کی گئیں:
  - مشق 1: کثیر ماحول کنفیگریشن (15 منٹ)
  - مشق 2: راز مینجمنٹ کی مشق (10 منٹ)
  - واضح کامیابی کے معیار اور تصدیقی مراحل

- **✅ تعیناتی کی تصدیق**: تعیناتی گائیڈ میں تصدیقی سیکشن شامل کیا گیا:
  - صحت کی جانچ کے طریقہ کار
  - کامیابی کے معیار کی چیک لسٹ
  - تمام تعیناتی کمانڈز کے متوقع نتائج
  - مسئلہ حل کرنے کے فوری حوالہ

#### بہتر کیا گیا
- **examples/README.md**: A-گریڈ معیار (93%) پر اپ ڈیٹ کیا گیا:
  - azure-openai-chat کو تمام متعلقہ سیکشنز میں شامل کیا گیا
  - مقامی مثالوں کی تعداد 3 سے 4 تک اپ ڈیٹ کی گئی
  - AI ایپلیکیشن مثالوں کی جدول میں شامل کیا گیا
  - انٹرمیڈیٹ صارفین کے لئے کوئیک اسٹارٹ میں ضم کیا گیا
  - Microsoft Foundry ٹیمپلیٹس سیکشن میں شامل کیا گیا
  - تقابلی میٹرکس اور ٹیکنالوجی تلاش کے سیکشنز اپ ڈیٹ کیے گئے  

- **دستاویزات کے معیار**: B+ (87٪) سے A- (92٪) تک بہتری داکی گئی:
  - اہم کمانڈ مثالوں میں متوقع نتائج شامل کیے گئے
  - کنفیگریشن تبدیلیوں کے لیے تصدیقی مراحل شامل کیے گئے
  - عملی مشقوں کے ساتھ ہاتھوں پر سیکھنے میں اضافہ

#### تبدیل شدہ
- **سیکھنے کی پیشرفت**: انٹرمیڈیٹ سیکھنے والوں کے لیے AI مثالوں کا بہتر انضمام
- **دستاویزات کی ساخت**: واضح نتائج کے ساتھ مزید قابل عمل مشقیں
- **تصدیقی عمل**: کلیدی ورک فلو میں واضح کامیابی کے معیار شامل کیے گئے

#### بہتر بنایا گیا
- **ڈویلپر تجربہ**: Microsoft Foundry Models تعیناتی اب 35-45 منٹ لیتی ہے (مقابلے میں 60-90 منٹ پیچیدہ متبادل کے لیے)
- **لاگت کی شفافیت**: Microsoft Foundry Models مثال کے لیے واضح لاگت کے تخمینے ($50-200/ماہ)
- **سیکھنے کا راستہ**: AI ڈویلپرز کے لیے azure-openai-chat کے ساتھ واضح نقطہ آغاز
- **دستاویزی معیار**: مستقل متوقع نتائج اور تصدیقی مراحل

#### تصدیق شدہ
- ✅ Microsoft Foundry Models مثال مکمل کام کر رہی ہے `azd up` کے ساتھ
- ✅ تمام 11 نفاذ کی فائلیں نحوی طور پر درست ہیں
- ✅ README ہدایات حقیقی تعیناتی کے تجربے سے میل کھاتی ہیں
- ✅ دستاویزی لنکس 8+ مقامات پر اپ ڈیٹ کیے گئے
- ✅ مثالوں کی فہرست صحیح طور پر 4 مقامی مثالوں کی عکاسی کرتی ہے
- ✅ جدولوں میں کوئی ڈپلیکیٹ خارجی لنکس نہیں ہیں
- ✅ تمام نیویگیشن کے حوالے درست ہیں

#### تکنیکی نفاذ
- **Microsoft Foundry Models فن تعمیر**: gpt-4.1 + کی ویالٹ + کنٹینر ایپس پیٹرن
- **سیکیورٹی**: منیجڈ شناخت تیار، راز کی ویالٹ میں محفوظ
- **مانیٹرنگ**: ایپلیکیشن انسائٹس انٹیگریشن
- **لاگت مینجمنٹ**: ٹوکن ٹریکنگ اور استعمال کی اصلاح
- **تعیناتی**: مکمل سیٹ اپ کے لیے واحد `azd up` کمانڈ

### [v3.6.0] - 2025-11-19

#### بڑی اپ ڈیٹ: کنٹینر ایپ تعیناتی کی مثالیں
**یہ ورژن Azure Developer CLI (AZD) کے استعمال سے مکمل، پیداوار کے لیے تیار کنٹینر ایپ تعیناتی کی مثالیں پیش کرتا ہے، مکمل دستاویزات اور سیکھنے کے راستے میں انضمام کے ساتھ۔**

#### شامل کیا گیا
- **🚀 کنٹینر ایپ مثالیں**: نئے مقامی مثالیں `examples/container-app/` میں:
  - [ماسٹر گائیڈ](examples/container-app/README.md): کنٹینرائزڈ تعیناتیوں کا مکمل جائزہ، فوری آغاز، پیداوار، اور جدید پیٹرنز
  - [سادہ فلاسک API](../../examples/container-app/simple-flask-api): مبتدئہ دوستانہ REST API، scale-to-zero، ہیلتھ پروبس، مانیٹرنگ، اور مسئلہ حل کرنا
  - [مائیکرو سروسز فن تعمیر](../../examples/container-app/microservices): پیداوار کے لیے تیار کثیر سروس تعیناتی (API گیٹ وے، پروڈکٹ، آرڈر، یوزر، نوٹیفیکیشن)، غیر متوازی میسجنگ، سروس بس، Cosmos DB، Azure SQL، تقسیم شدہ ٹریسنگ، نیلا-سبز/کینیری تعیناتی

- **بہترین مشقیں**: سیکیورٹی، مانیٹرنگ، لاگت کی اصلاح، اور CI/CD رہنمائی برائے کنٹینرائزڈ ورک لوڈز  
- **کوڈ نمونے**: مکمل `azure.yaml`، بائسک ٹیمپلیٹس، اور زبانوں میں متعدد سروس نفاذ (پائیتھن، نوڈ.جے ایس، C#، گو)  
- **ٹیسٹنگ اور مسئلہ حل کرنا**: اختتام سے اختتام تک ٹیسٹ منظرنامے، مانیٹرنگ کمانڈز، مسئلہ حل کرنے کی رہنمائی  

#### تبدیل شدہ
- **README.md**: "Local Examples - Container Applications" کے تحت نئی کنٹینر ایپ مثالوں کو نمایاں کیا اور لنک اپ ڈیٹ کیا  
- **examples/README.md**: کنٹینر ایپ مثالوں کو اجاگر کیا، تقابلی میٹرکس اندراجات شامل کیے، اور ٹیکنالوجی/فن تعمیر کے حوالے اپ ڈیٹ کیے  
- **کورس آؤٹ لائن اور اسٹڈی گائیڈ**: متعلقہ ابواب میں نئی کنٹینر ایپ مثالوں اور تعیناتی کے نمونوں کے حوالے شامل کیے  

#### تصدیق شدہ
- ✅ تمام نئی مثالیں `azd up` کے ساتھ تعینات کرنے کے قابل اور بہترین مشقوں پر عمل کرتی ہیں  
- ✅ دستاویزات کے کراس لنکس اور نیویگیشن اپ ڈیٹ ہوئے  
- ✅ مثالیں مبتدئہ سے اعلیٰ درجے کے منظرناموں کو کور کرتی ہیں، جس میں پیداوار مائیکرو سروسز شامل ہیں  

#### نوٹس
- **دائرہ کار**: صرف انگریزی دستاویزات اور مثالیں  
- **اگلے اقدامات**: مستقبل کے ورژنز میں اضافی جدید کنٹینر پیٹرنز اور CI/CD آٹومیشن میں توسیع  

### [v3.5.0] - 2025-11-19

#### پراڈکٹ ریبرانڈنگ: Microsoft Foundry
**یہ ورژن تمام انگریزی دستاویزات میں "Microsoft Foundry" کے پراڈکٹ نام کی مکمل تبدیلی کو بروئے کار لاتا ہے، جو مائیکروسافٹ کی سرکاری ریبرانڈنگ کی عکاسی کرتا ہے۔**

#### تبدیل شدہ
- **🔄 پراڈکٹ نام کی اپ ڈیٹ**: "Microsoft Foundry" سے "Microsoft Foundry" تک مکمل ریبرانڈنگ
  - `docs/` فولڈر میں تمام حوالہ جات اپ ڈیٹ کیے گئے
  - فولڈر کا نام تبدیل کیا گیا: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - فائل کا نام تبدیل کیا گیا: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - کل: 23 مواد کے حوالہ جات کو 7 دستاویزات کی فائلوں میں اپ ڈیٹ کیا گیا

- **📁 فولڈر کی ساخت میں تبدیلیاں**:
  - `docs/ai-foundry/` کو `docs/microsoft-foundry/` میں تبدیل کیا گیا
  - تمام کراس ریفرنسز کو نئے فولڈر کی ساخت کے مطابق اپ ڈیٹ کیا گیا
  - تمام دستاویزات میں نیویگیشن لنکس کی تصدیق کی گئی

- **📄 فائل کے نام تبدیل کیے گئے**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - تمام اندرونی روابط کو نئے فائل نام کی طرف اپ ڈیٹ کیا گیا

#### اپ ڈیٹ شدہ فائلیں
- **باب کی دستاویزات** (7 فائلیں):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 نیویگیشن لنکس اپ ڈیٹ کیے گئے
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 پروڈکٹ نام کے حوالہ جات اپ ڈیٹ کیے گئے
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - پہلے سے Microsoft Foundry استعمال ہو رہا ہے (پچھلے اپ ڈیٹس سے)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 حوالہ جات اپ ڈیٹ کیے گئے (جائزہ، کمیونٹی فیڈبیک، دستاویزات)
  - `docs/getting-started/azd-basics.md` - 4 کراس ریفرنس لنکس اپ ڈیٹ کیے گئے
  - `docs/getting-started/first-project.md` - 2 باب نیویگیشن لنکس اپ ڈیٹ کیے گئے
  - `docs/getting-started/installation.md` - 2 اگلے باب کے لنکس اپ ڈیٹ کیے گئے
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 حوالہ جات اپ ڈیٹ کیے گئے (نیویگیشن، Discord کمیونٹی)
  - `docs/troubleshooting/common-issues.md` - 1 نیویگیشن لنک اپ ڈیٹ کیا گیا
  - `docs/troubleshooting/debugging.md` - 1 نیویگیشن لنک اپ ڈیٹ کیا گیا

- **کورس کی ساخت کی فائلیں** (2 فائلیں):
  - `README.md` - 17 حوالہ جات اپ ڈیٹ کیے گئے (کورس کا جائزہ، باب کے عنوانات، ٹیمپلیٹس سیکشن، کمیونٹی کے بصیرت)
  - `course-outline.md` - 14 حوالہ جات اپ ڈیٹ کیے گئے (جائزہ، تعلیمی مقاصد، باب وسائل)

#### تصدیق شدہ
- ✅ انگریزی دستاویزات میں "ai-foundry" فولڈر راستے کے کوئی باقی ماندہ حوالہ جات نہیں
- ✅ انگریزی دستاویزات میں "Microsoft Foundry" پروڈکٹ نام کے کوئی باقی ماندہ حوالہ جات نہیں
- ✅ تمام نیویگیشن لنکس نئے فولڈر ڈھانچے کے ساتھ فعال ہیں
- ✅ فائل اور فولڈر کے نام تبدیل کرنے کا عمل کامیابی سے مکمل ہو گیا
- ✅ ابواب کے بیچ کراس ریفرنسز کی تصدیق کی گئی

#### نوٹس
- **دائرہ کار**: تبدیلیاں صرف `docs/` فولڈر میں انگریزی دستاویزات پر لاگو کی گئی ہیں
- **ترجمے**: ترجمہ فولڈرز (`translations/`) اس ورژن میں اپ ڈیٹ نہیں ہوئے
- **ورکشاپ**: ورکشاپ مواد (`workshop/`) اس ورژن میں اپ ڈیٹ نہیں ہوئے
- **مثالیں**: مثال فائلیں اب بھی پرانے نام استعمال کر سکتی ہیں (مستقبل کے اپ ڈیٹ میں اس پر توجہ دی جائے گی)
- **بیرونی روابط**: بیرونی URLs اور GitHub ریپوزیٹری حوالہ جات بغیر تبدیلی کے رہیں گے

#### کنٹری بیوٹرز کے لیے مائیگریشن گائیڈ
اگر آپ کے پاس لوکل برانچز یا دستاویزات میں پرانی ساخت کے حوالہ جات ہیں:
1. فولڈر کے حوالہ جات کو اپ ڈیٹ کریں: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. فائل کے حوالہ جات کو اپ ڈیٹ کریں: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. پروڈکٹ نام تبدیل کریں: "Microsoft Foundry" → "Microsoft Foundry"
4. تمام اندرونی دستاویزات کے لنکس کی فعالیت کی تصدیق کریں

---

### [v3.4.0] - 2025-10-24

#### انفراسٹرکچر پریویو اور ویلیڈیشن میں بہتریاں
**یہ ورژن نئے Azure Developer CLI پریویو فیچر کے لیے جامع سپورٹ متعارف کراتا ہے اور ورکشاپ کے صارف تجربے کو بڑھاتا ہے۔**

#### شامل کیا گیا
- **🧪 azd provision --preview فیچر کی دستاویزات**: نئے انفراسٹرکچر پریویو صلاحیت کا مکمل احاطہ
  - کمانڈ ریفرنس اور استعمال کی مثالیں چیٹ شیٹ میں
  - پروویژننگ گائیڈ میں کیس استعمال اور فوائد کے ساتھ تفصیلی انضمام
  - پیشگی جانچ کے عمل کی شمولیت برائے محفوظ تعیناتی کی توثیق
  - حفاظتی پہلے تعیناتی کی مشقوں کے ساتھ شروعاتی گائیڈ اپ ڈیٹس
- **🚧 ورکشاپ اسٹیٹس بینر**: ورکشاپ کی ترقی کی صورتحال ظاہر کرنے والا پیشہ ورانہ HTML بینر
  - تعمیر کی نشاندہی کے ساتھ گریڈیئنٹ ڈیزائن تاکہ صارف کو واضح اطلاع ملے
  - شفافیت کے لیے آخری اپ ڈیٹ کا ٹائم اسٹیمپ
  - تمام ڈیوائس اقسام کے لیے موبائل کے موافق ڈیزائن

#### بہتر کیا گیا
- **انفراسٹرکچر کی حفاظت**: تعیناتی کی دستاویزات میں پریویو فنکشنالٹی شامل کی گئی
- **پیشگی جانچ**: خودکار اسکرپٹس اب انفراسٹرکچر پریویو ٹیسٹنگ شامل کرتے ہیں
- **ڈیولپر ورک فلو**: کمانڈ سیکوینسز کو اپ ڈیٹ کیا گیا تاکہ پریویو کو بہترین عمل کے طور پر شامل کیا جا سکے
- **ورکشاپ تجربہ**: مواد کی ترقی کی صورتحال کے بارے میں صارفین کے لیے واضح توقعات قائم کی گئیں

#### تبدیل کیا گیا
- **تعیناتی کے بہترین طریقے**: پریویو-پہلے ورک فلو کو اب تجویز کردہ طریقہ کار بنایا گیا
- **دستاویزات کا بہاؤ**: انفراسٹرکچر ویلیڈیشن پڑھائی کے عمل میں جلد تر منتقل کی گئی
- **ورکشاپ کی پیشکش**: ترقیاتی ٹائم لائن کی واضح معلومات کے ساتھ پیشہ ورانہ اسٹیٹس کمیونیکیشن

#### بہتر کیا گیا
- **حفاظتی طرز عمل**: اب انفراسٹرکچر میں تبدیلیوں کو تعیناتی سے پہلے ویریفائی کیا جا سکتا ہے
- **ٹیم تعاون**: پریویو کے نتائج جائزے اور منظوری کے لیے شیئر کیے جا سکتے ہیں
- **لاگت کی آگاہی**: پروویژننگ سے پہلے وسائل کی قیمتوں کا بہتر فہم
- **خطرہ کم کرنا**: پیشگی توثیق کے ذریعے تعیناتی کی ناکامیوں میں کمی

#### تکنیکی نفاذ
- **کثیر دستاویزی انضمام**: 4 کلیدی فائلوں میں پریویو فیچر کی دستاویزات
- **کمانڈ کے نمونے**: تمام دستاویزات میں مستقل نحو اور مثالیں
- **بہترین طریقہ انضمام**: ویلیڈیشن ورک فلو اور اسکرپٹس میں پریویو شامل
- **بصری اشارے**: دریافت کے لیے واضح نئے فیچر کے نشان

#### ورکشاپ انفراسٹرکچر
- **اسٹیٹس کی معلومات**: گریڈینٹ اسٹائلنگ کے ساتھ پیشہ ورانہ HTML بینر
- **صارف تجربہ**: ترقی کی صورت حال واضح کرنے سے الجھن کم
- **پیشہ ورانہ پیشکش**: ریپوزیٹری کی وقار برقرار رکھتے ہوئے توقعات قائم کرنا
- **ٹائم لائن میں شفافیت**: اکتوبر 2025 کا آخری اپ ڈیٹ ٹائم اسٹیمپ برائے جوابدہی

### [v3.3.0] - 2025-09-24

#### جامع ورکشاپ مواد اور متعامل تعلمی تجربہ
**یہ ورژن براؤزر پر مبنی متعامل رہنماؤں اور ساختہ سیکھنے کے راستوں کے ساتھ جامع ورکشاپ مواد متعارف کراتا ہے۔**

#### شامل کیا گیا
- **🎥 متعامل ورکشاپ گائیڈ**: MkDocs پریویو صلاحیت کے ساتھ براؤزر میں ورکشاپ تجربہ
- **📝 ساختہ ورکشاپ ہدایات**: دریافت سے تخصیص تک 7 مراحل پر مشتمل رہنمائی
  - 0-تعارف: ورکشاپ کا جائزہ اور سیٹ اپ
  - 1-ای آئی ٹیمپلیٹ منتخب کریں: ٹیمپلیٹ کی دریافت اور انتخاب کا عمل
  - 2-ای آئی ٹیمپلیٹ کی توثیق: تعیناتی اور جانچ کے طریقہ کار
  - 3-ای آئی ٹیمپلیٹ کا تجزیہ: ٹیمپلیٹ کے فن تعمیر کو سمجھنا
  - 4-ای آئی ٹیمپلیٹ کی ترتیب: ترتیب اور تخصیص
  - 5-ای آئی ٹیمپلیٹ کی حسب ضرورت تبدیلی: جدید ترمیمات اور دہرائی
  - 6-انفراسٹرکچر کا خاتمہ: صفائی اور وسائل کا انتظام
  - 7-خلاصہ: سمری اور اگلے اقدامات
- **🛠️ ورکشاپ ٹولنگ**: بہتر سیکھنے کے تجربے کے لیے MkDocs کنفیگریشن میٹیریل تھیم کے ساتھ
- **🎯 عملی سیکھنے کا راستہ**: 3 مرحلوں کی طریقہ کار (دریافت → تعیناتی → تخصیص)
- **📱 GitHub Codespaces انضمام**: آسان ترقیاتی ماحول کی ترتیب

#### بہتر کیا گیا
- **AI ورکشاپ لیب**: 2-3 گھنٹے کی جامع ساختہ تعلمی تجربے کے ساتھ اضافہ
- **ورکشاپ دستاویزات**: نیویگیشن اور بصری معاونات کے ساتھ پیشہ ورانہ پیشکش
- **تعلیمی ترقی**: ٹیمپلیٹ کے انتخاب سے پروڈکشن تعیناتی تک مرحلہ وار رہنمائی
- **ڈیولپر تجربہ**: مربوط ٹولنگ برائے آسان ترقیاتی ورک فلو

#### بہتر کیا گیا
- **رسائی**: تلاش، نقل کی سہولت، اور تھیم ٹوگل کے ساتھ براؤزر پر مبنی انٹرفیس
- **خود رفتار سیکھنا**: مختلف تعلیمی رفتار کے لیے لچکدار ورکشاپ ڈھانچہ
- **عملی استعمال**: حقیقی دنیا کے AI ٹیمپلیٹ تعیناتی کے منظرنامے
- **کمیونٹی انضمام**: ورکشاپ معاونت اور تعاون کے لیے Discord انضمام

#### ورکشاپ کی خصوصیات
- **بلٹ ان سرچ**: فوری کلیدی لفظ اور سبق کی دریافت
- **کوڈ بلاکس کی کاپی**: تمام کوڈ مثالوں کے لیے ہوور پر کاپی کی سہولت
- **تھیم ٹوگل**: مختلف ترجیحات کے لیے ڈارک/لائٹ موڈ کی حمایت
- **بصری مواد**: بہتر فہم کے لیے اسکرین شاٹس اور خاکے
- **مدد انضمام**: کمیونٹی سپورٹ کے لیے براہِ راست Discord رسائی

### [v3.2.0] - 2025-09-17

#### بڑے پیمانے پر نیویگیشن کا از سر نو ترتیب اور باب کی بنیاد پر تعلیمی نظام
**یہ ورژن جامع باب کی بنیاد پر تعلیمی ڈھانچہ متعارف کراتا ہے جس سے پورے ریپوزیٹری میں نیویگیشن کو بہتر بنایا گیا ہے۔**

#### شامل کیا گیا
- **📚 باب کی بنیاد پر تعلیمی نظام**: پورے کورس کو 8 ترقی پذیر تعلیمی ابواب میں منظم کیا گیا
  - باب 1: بنیاد اور فوری آغاز (⭐ - 30-45 منٹ)
  - باب 2: AI-فرسٹ ڈیولپمنٹ (⭐⭐ - 1-2 گھنٹے)
  - باب 3: ترتیب اور توثیق (⭐⭐ - 45-60 منٹ)
  - باب 4: انفراسٹرکچر از کوڈ اور تعیناتی (⭐⭐⭐ - 1-1.5 گھنٹے)
  - باب 5: ملٹی-ایجنٹ AI حل (⭐⭐⭐⭐ - 2-3 گھنٹے)
  - باب 6: پیشگی تعیناتی کی جانچ اور منصوبہ بندی (⭐⭐ - 1 گھنٹہ)
  - باب 7: مسئلہ حل اور ڈیبگنگ (⭐⭐ - 1-1.5 گھنٹے)
  - باب 8: پیداوار اور انٹرپرائز پیٹرنز (⭐⭐⭐⭐ - 2-3 گھنٹے)
- **📚 جامع نیویگیشن نظام**: تمام دستاویزات میں مستقل نیویگیشن ہیڈرز اور فوٹرز
- **🎯 پیش رفت کا تعاقب**: کورس مکمل کرنے کی چیک لسٹ اور سیکھنے کی تصدیق کا نظام
- **🗺️ سیکھنے کے راستے کی رہنمائی**: مختلف تجربے کی سطحوں اور مقاصد کے لیے واضح داخلی پوائنٹس
- **🔗 کراس ریفرنس نیویگیشن**: متعلقہ ابواب اور پیشگی شرائط کے واضح روابط

#### بہتر کیا گیا
- **README کی ساخت**: باب کی بنیاد پر تنظیم کے ساتھ منظم تعلیمی پلیٹ فارم میں تبدیل
- **دستاویزات کی نیویگیشن**: ہر صفحہ میں اباب کا سیاق و سباق اور ترقی کی رہنمائی شامل
- **ٹیمپلیٹس کی تنظیم**: مثالیں اور ٹیمپلیٹس متعلقہ تعلیمی ابواب کے ساتھ منسلک
- **وسائل کا انضمام**: چیٹ شیٹس، اکثر پوچھے جانے والے سوالات، اور مطالعہ گائیڈز متعلقہ ابواب سے منسلک
- **ورکشاپ انضمام**: کئی اباب کے تعلمی مقاصد کے لیے ہاتھ پر مبنی لیب میپنگ

#### تبدیل کیا گیا
- **تعلیمی ترقی**: طرز دستاویزی سے لچکدار باب کی بنیاد پر تعلیمی نظام کی جانب منتقلی
- **ترتیب کی جگہ**: باب 3 کے طور پر ترتیب گائیڈ کی بہتر تعلیمی بہاؤ کے لیے تبدیلی
- **AI مواد کا انضمام**: پورے تعلیمی سفر میں AI مخصوص مواد کا بہتر انضمام
- **پیداواری مواد**: انٹرپرائز سیکھنے والوں کے لیے باب 8 میں جدید پیٹرنز کا ایکجا کرنا

#### بہتر کیا گیا
- **صارف کا تجربہ**: واضح نیویگیشن بریکمبرمز اور اباب میں پیش رفت کے اشارے
- **رسائی**: کورس کی آسان رہنمائی کے لیے مستقل نیویگیشن پیٹرنز
- **پیشہ ورانہ پیشکش**: تعلیمی اور کارپوریٹ تربیت کے لیے یونیورسٹی طرز کا کورس ڈھانچہ
- **تعلیمی کارکردگی**: بہتر تنظیم کی بدولت متعلقہ مواد کی تلاش میں وقت کی بچت

#### تکنیکی نفاذ
- **نیویگیشن ہیڈرز**: 40+ دستاویزی فائلوں میں اباب کی نیویگیشن معیار بنائی گئی
- **فوٹر نیویگیشن**: مستقل ترقی کی رہنمائی اور اباب کی تکمیل کے اشارے
- **کراس لنکنگ**: متعلقہ تصورات کو جوڑنے والا مکمل اندرونی لنکنگ نظام
- **اباب کی میپنگ**: ٹیمپلیٹس اور مثالیں واضح طور پر تعلیمی مقاصد سے منسلک

#### مطالعہ گائیڈ کی بہتری
- **📚 جامع تعلیمی مقاصد**: 8-باب کے نظام کے مطابق ازسرنو ترتیب شدہ مطالعہ گائیڈ
- **🎯 باب کی بنیاد پر جانچ**: ہر باب میں مخصوص تعلیمی اہداف اور عملی مشقیں
- **📋 پیش رفت کا تعاقب**: قابل پیمائش نتائج اور تکمیل کی چیک لسٹ کے ساتھ ہفتہ وار سیکھنے کے شیڈول
- **❓ جانچ کے سوالات**: ہر باب کے لیے علم کی تصدیق کے سوالات اور پیشہ ورانہ نتائج
- **🛠️ عملی مشقیں**: حقیقی تعیناتی کے منظرناموں اور مسئلہ حل کے ساتھ ہاتھ پر مبنی سرگرمیاں
- **📊 مہارت کی ترقی**: بنیادی تصورات سے انٹرپرائز پیٹرنز تک واضح ترقی کے ساتھ کیریئر پر توجہ
- **🎓 تصدیقی فریم ورک**: پیشہ ورانہ ترقی کے نتائج اور کمیونٹی شناختی نظام
- **⏱️ ٹائم لائن مینجمنٹ**: معیارات کی توثیق کے ساتھ 10 ہفتوں کا منظم سیکھنے کا منصوبہ

### [v3.1.0] - 2025-09-17

#### بہتری شدہ ملٹی-ایجنٹ AI حل
**یہ ورژن ملٹی-ایجنٹ ریٹیل حل کو بہتر ایجنٹ ناموں اور بہتر دستاویزات کے ساتھ بہتر بناتا ہے۔**

#### تبدیل کیا گیا
- **ملٹی-ایجنٹ اصطلاحات**: "Cora agent" کو "Customer agent" سے تبدیل کیا گیا تاکہ ریٹیل ملٹی-ایجنٹ حل میں واضح فہم ہو
- **ایجنٹ فن تعمیر**: تمام دستاویزات، ARM ٹیمپلیٹس، اور کوڈ مثالوں کو "Customer agent" نام سے ہم آہنگ کیا گیا
- **کنفیگریشن کی مثالیں**: جدید ایجنٹ کنفیگریشن پیٹرنز کو اپ ڈیٹ شدہ نام کے ساتھ دوبارہ ترتیب دیا گیا
- **دستاویزات کی ہم آہنگی**: تمام حوالہ جات کو پیشہ ورانہ اور وضاحتی ایجنٹ ناموں کے ساتھ یقینی بنایا گیا

#### بہتر کیا گیا
- **ARM ٹیمپلیٹ پیکج**: ریٹیل-ملٹی ایجنٹ-ARM-ٹیمپلیٹ کو Customer agent حوالہ جات کے ساتھ اپ ڈیٹ کیا گیا
- **فن تعمیر کے خاکے**: Mermaid ڈایاگرامز کو ایجنٹ کے نئے نام کے ساتھ تازہ کیا گیا
- **کوڈ مثالیں**: Python کلاسز اور اطلاق کی مثالیں اب CustomerAgent نام استعمال کرتی ہیں
- **ماحول کی متغیرات**: تمام تعیناتی اسکرپٹس کو CUSTOMER_AGENT_NAME کنونشن کے ساتھ اپ ڈیٹ کیا گیا

#### بہتر کیا گیا
- **ڈیولپر تجربہ**: دستاویزات میں واضح شدہ ایجنٹ کردار اور ذمہ داریاں
- **پیداواری تیاری**: انٹرپرائز نام کاری کے ساتھ بہتر ہم آہنگی
- **تعلیمی مواد**: تعلیمی مقاصد کے لیے مزید قابل فہم ایجنٹ نام
- **ٹیمپلیٹ کی افادیت**: ایجنٹ کے کردار اور تعیناتی کے پیٹرنز کو آسان فہم بنایا گیا

#### تکنیکی تفصیلات
- Mermaid فن تعمیر کے ڈایاگرامز کو CustomerAgent حوالہ جات کے ساتھ اپ ڈیٹ کیا گیا
- Python مثالوں میں CoraAgent کلاس نام کو CustomerAgent سے تبدیل کیا گیا
- ARM ٹیمپلیٹ JSON ترتیب کو "customer" ایجنٹ ٹائپ استعمال کرنے کے لیے تبدیل کیا گیا
- ماحول کی متغیرات کو CORA_AGENT_* سے CUSTOMER_AGENT_* کنونشن میں اپ ڈیٹ کیا گیا
- تمام تعیناتی کمانڈز اور کنٹینر کنفیگریشنز کو تازہ کیا گیا

### [v3.0.0] - 2025-09-12

#### بڑے پیمانے پر تبدیلیاں - AI ڈویلپر فوکس اور Microsoft Foundry انٹیگریشن
**یہ ورژن ریپوزیٹری کو مکمل AI مرکزیت سیکھنے کے وسائل میں تبدیل کرتا ہے اور Microsoft Foundry انٹیگریشن متعارف کراتا ہے۔**

#### شامل کیا گیا
- **🤖 AI-فرسٹ سیکھنے کا راستہ**: AI ڈویلپرز اور انجینئروں کو اولین ترجیح دیتے ہوئے مکمل دوبارہ ترتیب
- **Microsoft Foundry انضمام گائیڈ**: AZD کو Microsoft Foundry سروسز کے ساتھ جوڑنے کی تفصیلی دستاویزات
- **AI ماڈل تعیناتی کے پیٹرنز**: ماڈل انتخاب، ترتیب، اور پیداوار تعیناتی حکمت عملیوں پر تفصیلی رہنمائی
- **AI ورکشاپ لیب**: AI ایپلیکیشنز کو AZD-تعیین شدہ حل میں تبدیل کرنے کے لیے 2-3 گھنٹے کا عملی ورکشاپ  
- **پروڈکشن AI بہترین عمل**: AI ورک لوڈز کے اسکیلنگ، مانیٹرنگ، اور سیکیورٹی کے لیے انٹرپرائز تیار پیٹرنز  
- **AI مخصوص ٹربل شوٹنگ گائیڈ**: مائیکروسافٹ فاؤنڈری ماڈلز، کاگنیٹو سروسز، اور AI تعیناتی کے مسائل کے لیے جامع ٹربل شوٹنگ  
- **AI ٹیمپلیٹ گیلری**: مائیکروسافٹ فاؤنڈری ٹیمپلیٹس کا منتخب مجموعہ جس کے پیچیدگی کے ریٹنگز کے ساتھ  
- **ورکشاپ مواد**: ہاتھوں پر مبنی لیبس اور حوالہ مواد کے ساتھ مکمل ورکشاپ ڈھانچہ  

#### بہتری شدہ  
- **README ڈھانچہ**: AI ڈویلپرز کے لیے مرکوز، مائیکروسافٹ فاؤنڈری ڈسکارڈ سے 45% کمیونٹی دلچسپی کے ڈیٹا کے ساتھ  
- **سیکھنے کے راستے**: روایتی راستوں کے ساتھ AI ڈویلپر کے مخصوص سفر، طالب علموں اور ڈی اوپس انجینئرز کے لیے  
- **ٹیمپلیٹ کی سفارشات**: منتخب AI ٹیمپلیٹس بشمول azure-search-openai-demo، contoso-chat، اور openai-chat-app-quickstart  
- **کمیونٹی انضمام**: AI مخصوص چینلز اور مباحثوں کے ساتھ ڈسکارڈ کمیونٹی کی حمایت میں بہتری  

#### سیکیورٹی اور پروڈکشن فوکس  
- **مینج شدہ شناخت پیٹرنز**: AI مخصوص توثیق اور سیکیورٹی کنفیگریشنز  
- **لاگت کی اصلاح**: AI ورک لوڈز کے لیے ٹوکن استعمال کی نگرانی اور بجٹ کنٹرولز  
- **کئی خطوں میں تعیناتی**: عالمی AI ایپلیکیشن کی تعیناتی کے لیے حکمت عملی  
- **کارکردگی کی مانیٹرنگ**: AI مخصوص میٹرکس اور اپلیکیشن انسائٹ کے انضمام  

#### دستاویزات کا معیار  
- **لکیری کورس ڈھانچہ**: مبتدی سے اعلی AI تعیناتی پیٹرنز کی منطقی پیش رفت  
- **توثیق شدہ URLs**: تمام بیرونی ریپوزیٹری لنکس کی تصدیق اور قابل رسائی  
- **مکمل حوالہ**: تمام اندرونی دستاویزات لنکس کی تصدیق اور فعالیت  
- **پروڈکشن ریڈی**: انٹرپرائز تعیناتی پیٹرنز حقیقی دنیا کی مثالوں کے ساتھ  

### [v2.0.0] - 2025-09-09  

#### بڑے تبدیلیاں - ریپوزیٹری کا ڈھانچہ اور پروفیشنل بہتری  
**یہ ورژن ریپوزیٹری کے ڈھانچے اور مواد کی پیشکش میں ایک اہم تبدیلی کی نمائندگی کرتا ہے۔**  

#### شامل کیا گیا  
- **منظم سیکھنے کا فریم ورک**: اب تمام دستاویزی صفحات میں تعارف، سیکھنے کے اہداف، اور سیکھنے کے نتائج کے سیکشن شامل ہیں  
- **نیویگیشن سسٹم**: تمام دستاویزات میں پچھلے/اگلے سبق کے روابط شامل کیے گئے تاکہ رہنمائی کے ساتھ سیکھنے کی پیش رفت ہو  
- **مطالعہ گائیڈ**: جامع study-guide.md سیکھنے کے مقاصد، عملی مشقات، اور تخمینہ مواد کے ساتھ  
- **پیشہ ورانہ پیشکش**: بہتری اور پیشہ ورانہ ظاہری شکل کے لیے تمام ایموجی آئیکنز ہٹائے گئے  
- **مواد کا بہتربنایا گیا ڈھانچہ**: سیکھنے کے مواد کی تنظیم اور بہاؤ میں بہتری  

#### تبدیل کیا گیا  
- **دستاویزات کا فارمیٹ**: تمام دستاویزات کو معیاری، سیکھنے مرکوز ڈھانچے کے ساتھ یکساں بنایا گیا  
- **نیویگیشن کا بہاؤ**: تمام سیکھنے کے مواد میں منطقی پیش رفت نافذ کی گئی  
- **مواد کی پیشکش**: واضح اور پیشہ ورانہ ترتیب کے لیے سجاوٹ والے عناصر ہٹائے گئے  
- **لنک ڈھانچہ**: نئے نیویگیشن سسٹم کی حمایت کے لیے تمام اندرونی روابط کو اپ ڈیٹ کیا گیا  

#### بہتر کیا گیا  
- **رسائی کی بہتری**: بہتر اسکرین ریڈر مطابقت کے لیے ایموجی انحصار کم کیا گیا  
- **پیشہ ورانہ ظاہری شکل**: صاف، تعلیمی طرز کی پیشکش جو انٹرپرائز سیکھنے کے لیے موزوں ہے  
- **سیکھنے کا تجربہ**: ہر سبق کے لیے واضح اہداف اور نتائج کے ساتھ منظم طریقہ کار  
- **مواد کی تنظیم**: متعلقہ موضوعات کے درمیان بہتر منطقی بہاؤ اور تعلق  

### [v1.0.0] - 2025-09-09  

#### ابتدائی ریلیز - جامع AZD سیکھنے کا ذخیرہ  

#### شامل کیا گیا  
- **کور دستاویزات کا ڈھانچہ**  
  - مکمل گائیڈ سیریز برائے شروع کرنے کے لیے  
  - جامع تعیناتی اور فراہمی کی دستاویزات  
  - تفصیلی ٹربل شوٹنگ وسائل اور ڈی بگنگ گائیڈز  
  - پری-ڈپلائمنٹ کی تصدیقی اوزار اور طریقہ کار  

- **شروع کرنے کا ماڈیول**  
  - AZD بنیادیات: بنیادی تصورات اور اصطلاحات  
  - انسٹالیشن گائیڈ: پلیٹ فارم مخصوص سیٹ اپ ہدایات  
  - کنفیگریشن گائیڈ: ماحول کی ترتیب اور تصدیق  
  - پہلا پروجیکٹ سبق: قدم بہ قدم عملی سیکھنے کا طریقہ  

- **تعیناتی اور فراہمی ماڈیول**  
  - تعیناتی گائیڈ: مکمل ورک فلو دستاویزات  
  - فراہمی گائیڈ: انفراسٹرکچر از کوڈ بائیسیپ کے ساتھ  
  - پروڈکشن تعیناتی کے بہترین طریقے  
  - ملٹی سروس آرکیٹیکچر پیٹرنز  

- **پری-ڈپلائمنٹ تصدیق ماڈیول**  
  - صلاحیت کی منصوبہ بندی: Azure وسائل کی دستیابی کی توثیق  
  - SKU انتخاب: جامع سروس ٹائیر گائیڈنس  
  - پری فلائٹ چیکس: خودکار توثیقی اسکرپٹس (پاور شیل اور باش)  
  - لاگت کا تخمینہ اور بجٹ منصوبہ بندی کے اوزار  

- **ٹربل شوٹنگ ماڈیول**  
  - عام مسائل: اکثر پیش آنے والے مسائل اور حل  
  - ڈی بگنگ گائیڈ: منظم ٹربل شوٹنگ طریقہ کار  
  - جدید تشخیصی تکنیک اور اوزار  
  - کارکردگی کی نگرانی اور اصلاح  

- **وسائل اور حوالہ جات**  
  - کمانڈ چیٹ شیٹ: ضروری کمانڈز کے لیے فوری حوالہ  
  - گلوسری: جامع اصطلاحات اور مخففات کی وضاحت  
  - FAQ: عام سوالات کے تفصیلی جوابات  
  - بیرونی وسائل کے روابط اور کمیونٹی کنکشنز  

- **مثالیں اور ٹیمپلیٹس**  
  - سادہ ویب ایپلیکیشن کی مثال  
  - جامد ویب سائٹ تعیناتی ٹیمپلیٹ  
  - کنٹینر ایپلیکیشن کنفیگریشن  
  - ڈیٹابیس انضمام پیٹرنز  
  - مائیکرو سروسز آرکیٹیکچر کی مثالیں  
  - سرورلیس فنکشنز کی تنفیذات  

#### خصوصیات  
- **ملٹی پلیٹ فارم سپورٹ**: ونڈوز، میک او ایس، اور لینکس کے لیے انسٹالیشن اور کنفیگریشن گائیڈز  
- **مختلف مہارت کی سطحیں**: طلباء سے لیکر پیشہ ورانہ ڈویلپرز کے لیے ڈیزائن کیا گیا مواد  
- **عملی توجہ**: عملی مثالیں اور حقیقی دنیا کے منظرنامے  
- **جامع کوریج**: بنیادی تصورات سے لے کر اعلی انٹرپرائز پیٹرنز تک  
- **سیکیورٹی-اولین نقطہ نظر**: سیکیورٹی کے بہترین طریقے مکمل شامل  
- **لاگت کی اصلاح**: لاگت مؤثر تعیناتیوں اور وسائل کی انتظامیہ کے لیے رہنمائی  

#### دستاویزات کا معیار  
- **تفصیلی کوڈ مثالیں**: عملی، جانچے ہوئے کوڈ کے نمونے  
- **قدم بہ قدم ہدایات**: واضح، عملی رہنمائی  
- **جامع ایرر ہینڈلنگ**: عام مسائل کے لیے ٹربل شوٹنگ  
- **بہترین عمل کا انضمام**: صنعتی معیارات اور سفارشات  
- **ورژن مطابقت**: تازہ ترین Azure سروسز اور azd خصوصیات کے مطابق  

## مستقبل کی منصوبہ بندی شدہ بہتریاں  

### ورژن 3.1.0 (منصوبہ بند)  
#### AI پلیٹ فارم کی توسیع  
- **ملٹی ماڈل سپورٹ**: Hugging Face، Azure Machine Learning، اور کسٹم ماڈلز کے انضمام پیٹرنز  
- **AI ایجنٹ فریم ورکس**: LangChain، Semantic Kernel، اور AutoGen تعیناتیوں کے ٹیمپلیٹس  
- **جدید RAG پیٹرنز**: Azure AI سرچ سے آگے ویکٹر ڈیٹابیس کے اختیارات (Pinecone, Weaviate وغیرہ)  
- **AI مشاہدتی صلاحیت**: ماڈل کارکردگی، ٹوکن استعمال، اور جواب کے معیار کی بہتری شدہ نگرانی  

#### ڈویلپر تجربہ  
- **VS کوڈ ایکسٹینشن**: AZD + مائیکروسافٹ فاؤنڈری ڈویلپمنٹ تجربے کا انضمام  
- **GitHub Copilot انضمام**: AI مدد یافتہ AZD ٹیمپلیٹ جنریشن  
- **انٹرایکٹو ٹیوٹوریلز**: AI منظرناموں کے لیے عملی کوڈنگ مشقیں اور خودکار تصدیق  
- **ویڈیو مواد**: بصری سیکھنے والوں کے لیے AI تعیناتیوں پر مبنی سپلیمنٹری ویڈیو ٹیوٹوریلز  

### ورژن 4.0.0 (منصوبہ بند)  
#### انٹرپرائز AI پیٹرنز  
- **گورننس فریم ورک**: AI ماڈل گورننس، تعمیل، اور آڈٹ ٹریلز  
- **کئی کرایہ دار AI**: متعدد گاہکوں کو الگ AI سروسز فراہم کرنے کے پیٹرنز  
- **ایج AI تعیناتی**: Azure IoT Edge اور کنٹینر انسٹینسز کے ساتھ انضمام  
- **ہائبرڈ کلاؤڈ AI**: AI ورک لوڈز کے لیے ملٹی کلاؤڈ اور ہائبرڈ تعیناتی پیٹرنز  

#### جدید خصوصیات  
- **AI پائپ لائن آٹومیشن**: Azure Machine Learning پائپ لائنز کے ساتھ MLOps انضمام  
- **جدید سیکیورٹی**: زیرو-ٹرسٹ پیٹرنز، پرائیویٹ اینڈ پوائنٹس، اور جدید خطرے کی حفاظت  
- **کارکردگی کی اصلاح**: اعلی تھروپٹ AI ایپلیکیشنز کے لیے جدید ٹیوننگ اور اسکیلنگ حکمت عملی  
- **عالمی تقسیم**: AI ایپلیکیشنز کے لیے مواد کی ترسیل اور ایج کیشنگ پیٹرنز  

### ورژن 3.0.0 (منصوبہ بند) - موجودہ ریلیز کی جانب سے متروک  
#### تجویز کردہ اضافے - اب v3.0.0 میں نافذ  
- ✅ **AI مرکوز مواد**: مائیکروسافٹ فاؤنڈری کا جامع انضمام (مکمل)  
- ✅ **انٹرایکٹو ٹیوٹوریلز**: عملی AI ورکشاپ لیب (مکمل)  
- ✅ **جدید سیکیورٹی ماڈیول**: AI مخصوص سیکیورٹی پیٹرنز (مکمل)  
- ✅ **کارکردگی کی اصلاح**: AI ورک لوڈ ٹیوننگ حکمت عملیاں (مکمل)  

### ورژن 2.1.0 (منصوبہ بند) - جزوی طور پر v3.0.0 میں نافذ  
#### معمولی بہتریاں - کچھ موجودہ ریلیز میں مکمل  
- ✅ **مزید مثالیں**: AI مرکوز تعیناتی کے منظرنامے (مکمل)  
- ✅ **وسیع شدہ FAQs**: AI مخصوص سوالات اور ٹربل شوٹنگ (مکمل)  
- **ٹول انضمام**: بہتر IDE اور ایڈیٹر انضمام گائیڈز  
- ✅ **مانیٹرنگ کی توسیع**: AI مخصوص نگرانی اور الرٹ پیٹرنز (مکمل)  

#### مستقبل کی ریلیز کے لیے ابھی بھی منصوبہ بند  
- **موبائل فرینڈلی دستاویزات**: موبائل سیکھنے کے لیے ریسپانسیو ڈیزائن  
- **آف لائن رسائی**: قابل ڈاؤن لوڈ دستاویزات کے پیکیجز  
- **بہتر IDE انضمام**: AZD + AI ورک فلو کے لیے VS کوڈ ایکسٹینشن  
- **کمیونٹی ڈیش بورڈ**: کمیونٹی میٹرکس اور شراکت کی حقیقی وقت کی ٹریکنگ  

## چینج لاگ میں تعاون  

### تبدیلیوں کی اطلاع  
جب اس ریپوزیٹری میں تعاون کریں، برائے مہربانی چینج لاگ اندراجات درج ذیل شامل کریں:  

1. **ورژن نمبر**: سیمینٹک ورژننگ کے مطابق (major.minor.patch)  
2. **تاریخ**: ریلیز یا اپ ڈیٹ کی تاریخ YYYY-MM-DD فارمیٹ میں  
3. **زمرہ**: شامل کیا گیا، تبدیل کیا گیا، منسوخ، نکالا گیا، درست کیا گیا، سیکیورٹی  
4. **واضح تفصیل**: مختصر بیان کہ کیا تبدیل ہوا  
5. **اثر کا تجزیہ**: موجودہ صارفین پر تبدیلیوں کے اثرات  

### تبدیلیوں کے زمرے  

#### شامل کیا گیا  
- نئی خصوصیات، دستاویزات کے سیکشن، یا صلاحیتیں  
- نئی مثالیں، ٹیمپلیٹس، یا سیکھنے کے وسائل  
- اضافی اوزار، اسکرپٹس، یا افادیتیں  

#### تبدیل کیا گیا  
- موجودہ فعالیت یا دستاویزات میں ترمیم  
- وضاحت یا درستگی کے لیے اپ ڈیٹس  
- مواد یا تنظیم نو کا دوبارہ ڈھانچہ  

#### منسوخ  
- وہ خصوصیات یا طریقے جو ختم کیے جا رہے ہیں  
- دستاویزی سیکشنز جو حذف کیے جائیں گے  
- ایسے طریقے جن کے بہتر متبادل موجود ہیں  

#### نکالا گیا  
- وہ خصوصیات، دستاویزات، یا مثالیں جو اب قابل اطلاق نہیں  
- پرانی معلومات یا منسوخ طریقے  
- غیر ضروری یا یکجا شدہ مواد  

#### درست کیا گیا  
- دستاویزات یا کوڈ میں غلطیوں کی اصلاح  
- رپورٹ شدہ مسائل یا مشکلات کا حل  
- درستگی یا فعالیت میں بہتری  

#### سیکیورٹی  
- سیکیورٹی سے متعلق اصلاحات یا بہتریاں  
- سیکیورٹی بہترین عمل کی اپ ڈیٹس  
- سیکیورٹی خطرات کا حل  

### سیمینٹک ورژننگ کی رہنما اصول  

#### بڑے ورژن (X.0.0)  
- ایسی تبدیلیاں جو صارف کی کارروائی کا تقاضا کرتی ہیں  
- مواد یا تنظیم نو کا نمایاں ڈھانچہ  
- بنیادی طریقہ کار یا نقطہ نظر میں تبدیلیاں  

#### معمولی ورژن (X.Y.0)  
- نئی خصوصیات یا مواد کے اضافہ  
- تبدیلیاں جو پچھلے ورژن کے ساتھ مطابقت رکھتی ہیں  
- اضافی مثالیں، اوزار، یا وسائل  

#### پیچ ورژن (X.Y.Z)  
- بگ فکسز اور اصلاحات  
- موجودہ مواد میں معمولی بہتریاں  
- وضاحتیں اور چھوٹے اضافے  

## کمیونٹی کی رائے اور تجاویز  

ہم اس سیکھنے کے وسیلہ کو بہتر بنانے کے لیے کمیونٹی کی رائے کی بھرپور حوصلہ افزائی کرتے ہیں:  

### رائے فراہم کرنے کا طریقہ  
- **GitHub Issues**: مسائل رپورٹ کریں یا بہتری کی تجاویز دیں (AI مخصوص مسائل کا خیرمقدم)  
- **ڈسکارڈ مباحثے**: آئیڈیاز شیئر کریں اور مائیکروسافٹ فاؤنڈری کمیونٹی میں شامل ہوں  
- **پُل ریکویسٹ**: مواد میں براہ راست بہتریوں میں تعاون کریں، خاص طور پر AI ٹیمپلیٹس اور گائیڈز  
- **مائیکروسافٹ فاؤنڈری ڈسکارڈ**: #Azure چینل میں AZD + AI مباحثوں میں شامل ہوں  
- **کمیونٹی فورمز**: وسیع Azure ڈویلپر مباحثوں میں شرکت کریں  

### رائے کے زمرے  
- **AI مواد کی درستگی**: AI سروس انضمام اور تعیناتی کے معلومات میں اصلاحات  
- **سیکھنے کا تجربہ**: AI ڈویلپر سیکھنے کے بہاؤ کے لیے تجاویز  
- **غائب AI مواد**: اضافی AI ٹیمپلیٹس، پیٹرنز، یا مثالوں کی درخواست  
- **رسائی**: متنوع سیکھنے کی ضروریات کے لیے بہتریاں  
- **AI ٹول انضمام**: بہتر AI ڈویلپمنٹ ورک فلو کے لیے تجاویز  
- **پروڈکشن AI پیٹرنز**: انٹرپرائز AI تعیناتی پیٹرنز کی درخواستیں  

### جواب دینے کا عزم  
- **مسئلے کا جواب**: رپورٹ شدہ مسائل کے لیے 48 گھنٹوں کے اندر  
- **خصوصیات کی درخواستیں**: ایک ہفتے کے اندر جائزہ  
- **کمیونٹی تعاون**: ایک ہفتے کے اندر جائزہ  
- **سیکیورٹی مسائل**: فوری ترجیح اور جلد جواب  

## دیکھ بھال کا شیڈول  

### باقاعدہ اپ ڈیٹس  
- **ماہانہ جائزے**: مواد کی درستگی اور لنک کی توثیق  
- **ماہانہ سہ ماہی اپ ڈیٹس**: بڑے مواد میں اضافہ اور بہتریاں  
- **نیم سالانہ جائزے**: جامع تنظیم نو اور بہتری  
- **سالانہ ریلیزز**: اہم ورژن اپ ڈیٹس کے ساتھ نمایاں بہتریاں  

### نگرانی اور معیار کی یقین دہانی  
- **خودکار ٹیسٹنگ**: کوڈ مثالوں اور لنکس کی باقاعدہ توثیق  
- **کمیونٹی رائے کا انضمام**: صارف کی تجاویز کی باقاعدہ شمولیت  
- **ٹیکنالوجی اپ ڈیٹس**: تازہ ترین Azure سروسز اور azd ریلیزز کے ساتھ ہم آہنگی  
- **رسائی کے آڈٹ**: جامع ڈیزائن اصولوں کے لیے باقاعدہ جائزہ  

## ورژن سپورٹ پالیسی  

### موجودہ ورژن کی حمایت  
- **تازہ ترین بڑے ورژن**: مکمل سپورٹ اور باقاعدہ اپ ڈیٹس  
- **پچھلے بڑے ورژن**: 12 مہینوں کی سیکیورٹی اپ ڈیٹس اور اہم اصلاحات  
- **پرانی ورژنز**: صرف کمیونٹی سپورٹ، سرکاری اپ ڈیٹس نہیں  

### منتقلی کے لیے رہنمائی  
جب بڑے ورژنز جاری ہوں، ہم فراہم کرتے ہیں:  
- **منتقلی کے گائیڈز**: قدم بہ قدم منتقلی کی ہدایات  
- **مطابقت کے نوٹس**: بریکنگ چینجز کی تفصیلات  
- **ٹول سپورٹ**: منتقلی میں مدد دینے والے اسکرپٹس یا اوزار  
- **کمیونٹی سپورٹ**: منتقلی کے سوالات کے لیے وقف فورمز  

---

**نیویگیشن**  
- **پچھلا سبق**: [مطالعہ گائیڈ](resources/study-guide.md)  
- **اگلا سبق**: واپس جائیں [مین README](README.md)  

**اپ ڈیٹ رہیں**: اس ریپوزیٹری کو نئے اجرا اور سیکھنے کے مواد کی اہم اپ ڈیٹس کے نوٹیفیکیشن کے لیے دیکھتے رہیں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->