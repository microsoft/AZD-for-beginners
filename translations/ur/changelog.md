# تبدیلی کی فہرست - AZD برائے نو آموز

## تعارف

یہ تبدیلی کی فہرست AZD برائے نو آموز رپوزیٹری میں تمام قابل ذکر تبدیلیوں، اپڈیٹس، اور بہتریوں کو دستاویزی شکل میں فراہم کرتی ہے۔ ہم سیمنٹک ورژننگ کے اصولوں کی پیروی کرتے ہیں اور یہ لاگ برقرار رکھتے ہیں تاکہ صارفین کو سمجھنے میں مدد ملے کہ ورژنز کے درمیان کیا تبدیلی آئی ہے۔

## سیکھنے کے مقاصد

اس تبدیلی کی فہرست کا جائزہ لے کر، آپ:
- نئی خصوصیات اور مواد میں اضافے کے بارے میں باخبر رہیں گے
- پہلے سے موجود دستاویزات میں کی گئی بہتریوں کو سمجھیں گے
- بگز کی اصلاحات اور تصحیحات کا ٹریک رکھیں گے تاکہ درستگی یقینی بنائیں
- وقت کے ساتھ سیکھنے کے مواد کی ترقی کا جائزہ لیں گے

## سیکھنے کے نتائج

تبدیلی کی فہرست کے اندراجات کا جائزہ لینے کے بعد، آپ کرنے کے قابل ہوں گے:
- سیکھنے کے لیے دستیاب نئے مواد اور وسائل کی شناخت کریں گے
- سمجھیں گے کہ کون سے سیکشنز کو اپڈیٹ یا بہتر بنایا گیا ہے
- موجودہ مواد کی بنیاد پر اپنی سیکھنے کا راستہ منصوبہ بند کریں گے
- مستقبل کی بہتری کے لیے تاثرات اور تجاویز فراہم کریں گے

## ورژن کی تاریخ

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 ریفریش: ورژن کرنسی اپڈیٹ
**یہ ورژن `azd` `1.27.1` (جولائی 2026، تازہ ترین مستحکم ریلیز) اور موجودہ پریویو AI ایجنٹ ایکسٹینشن `azure.ai.agents` `1.0.0-beta.5` کے خلاف کورس کی دوبارہ توثیق کرتا ہے، 1.26.0، 1.27.0، اور 1.27.1 ریلیزز کے بعد ہر "validated against" بینر کو اپ ٹو ڈیٹ لاتے ہوئے۔**

#### تبدیلیاں
- **✅ توثیقی بنیاد کو اپڈیٹ کیا گیا** `azd 1.25.6` (جون 2026) سے `azd 1.27.1` (جولائی 2026) تک، تمام روٹ README، تمام چپٹر READMEs، چپٹر 1 ڈیو کنٹینر سبق (مثالوں کے ساتھ)، چپٹر 4 کسٹم ٹیمپلیٹس سبق، چپٹر 5 ملٹی ایجنٹ سبق، اور ورکشاپ دستاویزات میں
- **🤖 چپٹر 2 کی بنیاد کو ریفریش کیا گیا** `azd 1.23.12` (مارچ 2026) سے `azd 1.27.1` تک `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, اور `microsoft-foundry-integration.md` میں؛ توثیقی نوٹ کی تاریخیں 2026-07-13 پر اپڈیٹ کی گئیں
- **🧩 AI ایجنٹ ایکسٹینشن کو اپ گریڈ کیا گیا** `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` سے موجودہ `1.0.0-beta.5` ریلیز میں چپٹر 2 README اور `agents.md` میں
- **🧪 ورکشاپ توثیق کی مثال** (`azd version` آؤٹ پٹ) کو `1.27.1` پر اپڈیٹ کیا گیا

#### متعلقہ azd ریلیزز پر نوٹس (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Azure Functions کے لیے Flex Consumption کی Go سپورٹ، `azd config sub-filter` فی ٹیننٹ سبسکرپشن فلٹرز، سیلف کنٹینڈ ایکسٹینشن بنڈلز (`azd x pack --bundle`)، اور `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** `azure.yaml` میں براہ راست Azure AI Foundry پروجیکٹس/ایجنٹس کی ماڈلنگ (بِسپ-لیس/ٹیرافارم-لیس انیشی ایشن)، App Service کے لیے کنٹینر ڈپلائمنٹ سپورٹ (`host: appservice` + `language: docker`)، `azd extension` کمانڈز کے لیے براہ راست `-s/--source`، اور `azd tool uninstall`
- **1.27.1 (2026-07-09):** `azd extension install` کے لیے `--no-dependencies` فلیگ، ڈیپریکیٹڈ ماڈلز کو ڈیفالٹ کے طور پر کیٹلاگ/کوٹا پرامپٹس سے خارج کرنا، اور کئی بگ فکسز

#### اپڈیٹ کی گئی فائلز
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### نو آموز کے لیے خلاء بھرنا #2: ٹیمپلیٹ تخلیق، ڈیو کنٹینرز، پلومی، ایزور ڈیو اوپس، سروس پرنسپلز، اور مزید
**یہ ورژن azd-coverage تجزیہ سے سامنے آنے والے باقی درمیانی خلاء کو پورا کرتا ہے: اپنے ٹیمپلیٹ کو تخلیق اور شائع کرنا، قابل تکرار ڈیو کنٹینر/کوڈ اسپیس ماحول، پلومی انفراسٹرکچر فراہم کنندہ، Azure DevOps CI/CD گائیڈ، سروس پرنسپل توثیق، ہوسٹ انتخاب کے رہنما (AKS/Spring Apps)، `azd restore`/`azd package` کی وضاحتیں، ہک ایرر ہینڈلنگ، اور ٹیم/مشترکہ ماحول کے طریقے۔**

#### شامل کیا گیا
- **🧱 نیا چپٹر 4 سبق** `docs/chapter-04-infrastructure/custom-templates.md` — اپنا azd ٹیمپلیٹ تخلیق کرنا: مطلوبہ ساخت (`azure.yaml`, `infra/`, `src/`)، `metadata.template` فیلڈ، انفراسٹرکچر کو پیرامیٹرائز کرنا `uniqueString()` ریسورس ٹوکن اور `azd-env-name` ٹیگ کے ساتھ، `azd init --template <local-path>` کے ذریعے لوکل ٹیسٹنگ، GitHub پر شائع کرنا، اور Awesome AZD گیلری میں جمع کرانا
- **📦 نیا چپٹر 1 سبق** `docs/chapter-01-foundation/dev-containers.md` — قابل تکرار azd ماحول ڈیو کنٹینرز اور GitHub Codespaces کے ساتھ: ایک کم سے کم `.devcontainer/devcontainer.json` سرکاری `ghcr.io/azure/azure-dev/azd` فیچر کے ساتھ، زبان مخصوص فیچرز، کنٹینر ہوسٹس کے لیے `docker-in-docker`، اور دور سے سائن ان کے لیے `azd auth login --use-device-code`
- **🧩 azd کے ساتھ پلومی** سیکشن `docs/chapter-04-infrastructure/provisioning.md` میں — `infra.provider: pulumi`, پلومی فولڈر کی ترتیب، stacks کو azd ماحول سے ملانا، مطلوبہ آؤٹ پٹس/ٹیگنگ، اور `azd up` / `azd down` کا یکساں ورک فلو
- **🎯 ہوسٹ انتخاب کی رہنمائی** `docs/chapter-04-infrastructure/provisioning.md` میں — ابتدائیوں کے لیے `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, اور `springapp` کا موازنہ، اور AKS یا Azure Spring Apps منتخب کرنے کی رہنمائی
- **🛠️ Azure DevOps CI/CD گائیڈ** `docs/chapter-08-production/production-ai-practices.md` میں — `azd pipeline config --provider azdo`, ورک لوڈ شناخت فیڈریشن کے ساتھ سروس کنکشن (OIDC), تیار شدہ `azure-dev.yml`, اور ویری ایبل گروپ سیٹ اپ
- **🔑 سروس پرنسپلز (پیٹرن 4)** `docs/chapter-03-configuration/authsecurity.md` میں شامل — `az ad sp create-for-rbac`, کلائنٹ سیکرٹ بمقابلہ فیڈریٹڈ/OIDC اسناد کے ساتھ غیر متقابل `azd auth login`, کب استعمال کریں، اور محفوظ اسناد ذخیرہ کرنا
- **🪝 ہک ایرر ہینڈلنگ** سب سیکشن `docs/chapter-04-infrastructure/deployment-guide.md` میں — ایگزٹ کوڈز اور `set -e`, `continueOnError`, `azd hooks run` کے ساتھ الگ تھلگ ہک ٹیسٹنگ، OS مخصوص شیلز، اور `--debug`
- **👥 ٹیم / مشترکہ ماحول** سیکشن `docs/chapter-03-configuration/configuration.md` میں — `.azure/` میں کیا رہتا ہے، gitignore کیا کریں، فی ڈویلپر ماحول، `azd env list`/`select`, اور CI/CD میں ماحول کی قدریں فراہم کرنا
- **🧰 `azd restore` اور توسیع شدہ `azd package`** وضاحتیں `resources/cheat-sheet.md` میں — انحصار کو بحال کرنا اور بغیر تعیناتی کے تعیناتی قابل آرٹیفیکٹ بنانا

#### تبدیلیاں
- **🧭 چپٹر 4 سبقوں کی جدول** کو نئے "اپنا ٹیمپلیٹ تخلیق کریں" سبق (سبق 3) کے ساتھ اپڈیٹ کیا گیا
- **🧭 چپٹر 1 سبقوں کی جدول** کو نئے "ڈیو کنٹینرز اور کوڈ اسپیسز" سبق (سبق 5) کے ساتھ اپڈیٹ کیا گیا؛ `bring-your-own-app.md` اور `dev-containers.md` کے درمیان نیویگیشن فوٹرز جوڑے گئے

### [v3.21.0] - 2026-06-16

#### نو آموز کے لیے خلاء بھرنا: ہاتھوں سے ملٹی ایجنٹ سبق، "اپنا ایپ لے کر آئیں"، ٹیرافارم، اور CI/CD گائیڈ
**یہ ورژن مکمل نو آموز گائیڈ کے سب سے بڑے خلاء کو بند کرتا ہے، دو نئے عملی اسباق شامل کرکے (ایک تعیناتی قابل ملٹی ایجنٹ گائیڈ اور موجودہ ایپ میں azd شامل کرنا)، نو آموزوں کے لیے ہکس تعارف، azd کے ساتھ ٹیرافارم سیکشن، مرحلہ وار GitHub Actions پائپ لائن گائیڈ، نئے پریویو ایکسٹینشنز کے لیے وضاحت، اور واضح تعیناتی توثیقی چیک لسٹ۔**

#### شامل کیا گیا
- **🤝 نیا چپٹر 5 سبق** `docs/chapter-05-multi-agent/multi-agent-basics.md` — مکمل عملی، تعیناتی قابل دو ایجنٹ کا گائیڈ (آرکیسٹریٹر + اسپیشلسٹ) حقیقی ٹیمپلیٹ (`contoso-creative-writer`) کے ساتھ، کب ملٹی ایجنٹ استعمال کرنا ہے، `azd up` ورک فلو، تعینات شدہ وسائل کو سمجھنا، کراس ایجنٹ ٹریسنگ، تخصیص، اور صفائی
- **📦 نیا چپٹر 1 سبق** `docs/chapter-01-foundation/bring-your-own-app.md` — موجودہ پروجیکٹ میں azd شامل کرنا `azd init` کے ساتھ ("موجودہ ڈائریکٹری میں کوڈ استعمال کریں")، `azure.yaml` اور `infra/` کو سمجھنا، `azd infra generate`, ہوسٹ کی شناخت، اور `azd up` کے ساتھ تعیناتی
- **🌐 azd کے ساتھ ٹیرافارم** سیکشن `docs/chapter-04-infrastructure/provisioning.md` میں شامل — `infra.provider: terraform` کنفیگریشن، `.tf` فولڈر ترتیب، ضروری `AZURE_*` آؤٹ پٹس اور `azd-env-name` ٹیگنگ، اور یکساں `azd up` / `azd down` ورک فلو (وہ جگہ جہاں صرف بپیس دکھائی گئی تھی، وہاں ٹیرافارم سپورٹ کا دعویٰ پورا کیا)
- **⚙️ مرحلہ وار GitHub Actions گائیڈ** `docs/chapter-08-production/production-ai-practices.md` میں — GitHub ریپو سے خودکار تعیناتیاں: `azd pipeline config`, OIDC فیڈریٹڈ اسناد (کوئی محفوظ شدہ سیکرٹس نہیں), تیار شدہ `azure-dev.yml`, سیکرٹس بمقابلہ ویری ایبلز کی رہنمائی
- **🪝 نو آموز "نئے ہکس؟" تعارف** `docs/chapter-04-infrastructure/deployment-guide.md` میں — ہک کیا ہے، ہک اسٹیج جدول، ایک کم سے کم پہلا ہک، اور `azd hooks run` کے ساتھ دستی طور پر ہکس چلانا
- **✅ "اپنی تعیناتی کی تصدیق کریں" چیک لسٹ** `docs/chapter-01-foundation/first-project.md` کے مرحلہ 5 میں شامل — دھواں ٹیسٹ، صحت کے اینڈ پوائنٹ کی جانچ، اور واضح کامیابی کے معیار
- **🧩 نئے پریویو ایکسٹینشنز کی وضاحت** `azure.ai.skills` اور `azure.ai.connections` کیا ہیں اور کب استعمال کریں `docs/chapter-08-production/production-ai-practices.md` میں

#### تبدیلیاں
- **🧭 چپٹر 5 سبقوں کا جدول درست کیا گیا**: `multi-agent-basics.md` اب سبق 1 ہے (واحد مکمل عملی سبق)، ایماندارانہ طور پر لیبلنگ کہ سبق 2 چپٹر 6 میں ہے اور ریٹیل منظر نامہ ایک آرکیٹیکچر بلیو پرنٹ ہے، ایک ایک کمانڈ ٹیمپلیٹ نہیں
- **🧭 چپٹر 1 سبقوں کی جدول** اب نئے "اپنا ایپ لے کر آئیں" سبق (سبق 4) کو شامل کرتی ہے
- **🔗 نیویگیشن فوٹرز** اپڈیٹ کیے گئے: `first-project.md` اب آگے کی طرف `bring-your-own-app.md` سے لنک کرتا ہے

#### درست کیا گیا
- **🧱 "دعوی کیا گیا لیکن غائب" ٹیرافارم خلاء بند کیا گیا** — کورس نے پہلے ٹیرافارم سپورٹ کا حوالہ دیا تھا لیکن صرف بپیس دکھائی گئی تھی
- **🔀 گمراہ کن چپٹر 5 کراس لنکس درست کیے گئے** جو ظاہر کرتے تھے کہ مکمل ملٹی ایجنٹ امپلیمینٹیشن موجود ہے جب کہ صرف ایک آرکیٹیکچر بلیو پرنٹ تھا

#### اپڈیٹ کی گئی فائلز
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

#### AZD 1.25.6 ریفریش، مکمل ایجنٹ لائف سائیکل کمانڈز اور Aspire ری برانڈ

**یہ ورژن کورس کو `azd` `1.25.6` (جون 2026) اور `azure.ai.agents` `0.1.40-preview` ایکسٹینشن کے خلاف دوبارہ توثیق کرتا ہے، AI رہنمائی کو "ایجنٹ تیار کریں" سے مکمل ایجنٹ کے زندگی کے چکر (ٹیسٹ → جائزہ لیں → بہتر بنائیں → معائنہ کریں → حذف کریں) تک وسعت دیتا ہے، نئے `azure.ai.skills` اور `azure.ai.connections` پریویو ایکسٹینشنز کو ظاہر کرتا ہے، اور ".NET Aspire" → "Aspire" پراڈکٹ کے ری برانڈ کی نشاندہی کرتا ہے۔**

#### شامل کیا گیا
- **🔁 مکمل ایجنٹ کے زندگی کے چکر کی کوریج** شروع کرنے والوں اور AI انجینیئرز کے لیے دستاویزات میں:
  - `docs/chapter-01-foundation/azd-basics.md` — ایکسٹینشنز اور AI کمانڈز سیکشن میں زندگی کے چکر کی جدول (اسکافولڈ → ٹیسٹ → ناپیں → بہتر بنائیں → معائنہ کریں → صفائی کریں) شامل کی گئی
  - `docs/chapter-08-production/production-ai-practices.md` — نیا "ایجنٹ کے زندگی کے چکر کا انتظام" سیکشن جو `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, اور `delete --force` کو کور کرتا ہے
  - `resources/cheat-sheet.md` — AI ایجنٹ کمانڈز کو `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, اور `delete --force` کے ساتھ وسعت دی گئی
- **🧩 نئے پریویو ایکسٹینشنز** دستاویز کیے گئے: `azure.ai.skills` (دوبارہ قابل استعمال ایجنٹ مہارتیں) اور `azure.ai.connections` (Foundry کنیکشنز) کو ایکسٹینشنز کی جدول اور چیٹ شیٹ میں شامل کیا گیا
- **⏱️ ردعمل کی وقت کاری کی رہنمائی** — `azd ai agent invoke` کی مثالیں اب نوٹ کرتی ہیں کہ یہ مکمل تاخیر اور پہلے بائٹ کا وقت پرنٹ کرتی ہے
- **📌 ورژن بینر** جڑ README میں سیکھنے والوں کو `azd version` اور `azd upgrade` کی طرف نشان دہی کرتا ہے

#### تبدیل کیا گیا
- **✅ توثیقی بنیاد کو اپ ڈیٹ کیا گیا** `azd 1.23.12` (مارچ 2026) سے `azd 1.25.6` (جون 2026) تک تمام چیپٹر READMEs اور ورکشاپ دستاویزات میں
- **🤖 چیپٹر 2 ایکسٹینشن نوٹ** کو `azure.ai.agents` `0.1.18-preview` سے `0.1.40-preview` میں اپ ڈیٹ کیا گیا
- **🧪 ورکشاپ توثیق کی مثال** (`azd version` آؤٹ پٹ) کو `1.25.6` میں اپ ڈیٹ کیا گیا
- **🧭 README "آج azd میں کیا نیا ہے"** کو تازہ کیا گیا تاکہ مکمل ایجنٹ کے زندگی کے چکر، نئے AI ایکسٹینشنز، اور حالیہ معیار زندگی کی اصلاحات (جیسے `azd init` کی آئڈیمپوٹنسی، `azd auth login` اسٹیل ٹوکن کی صفائی، `azd tool` کا پہلی بار چلانے کا پرامپٹ) کو نمایاں کیا جا سکے
- **📖 چیپٹر 2 agents.md (آپشن 4)** اب سیکھنے والوں کو تعیناتی کے بعد کی زندگی کے چکر کی کمانڈز کی طرف اشارہ کرتا ہے بجائے کہ `azd up` پر رک جائے

#### درست کیا گیا
- **🏷️ پراڈکٹ کا نام تبدیل کرنا** — Aspire ری برانڈ نوٹ شامل کیا گیا (".NET Aspire" اب صرف "Aspire" ہے)؛ azd کی Aspire سپورٹ میں تبدیلی نہیں ہوئی
- **🔎 لائیو ریلیز کی توثیق** Azure Developer CLI ریلیز فیڈ کے خلاف کی گئی: مستحکم CLI `1.25.6` (2026-06-12) اور `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### اپ ڈیٹ کی گئی فائلیں
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

#### ابتدائی شمولیت کی وضاحت، سیٹ اپ توثیق اور آخری AZD کمانڈ کلین اپ
**یہ ورژن AZD 1.23 توثیقی جاٸزے کے بعد ابتدائی صارفین کے لیے دستاویزات میں بہتری لاتا ہے: یہ AZD-پر مبنی توثیقی رہنمائی کو واضح کرتا ہے، مقامی سیٹ اپ کی توثیق کے اسکرپٹس شامل کرتا ہے، اہم کمانڈز کو زندہ AZD CLI کے خلاف ویریفائی کرتا ہے، اور چیینج لاگ کے باہر پرانی انگریزی ذرائع کمانڈ حوالہ جات کو حذف کرتا ہے۔**

#### شامل کیا گیا
- **🧪 ابتدائی سیٹ اپ توثیقی اسکرپٹس** `validate-setup.ps1` اور `validate-setup.sh` کے ساتھ تاکہ سیکھنے والے باب 1 شروع کرنے سے پہلے ضروری ٹولز کی تصدیق کر سکیں
- **✅ روبرو سیٹ اپ توثیق کے اقدامات** جڑ README اور باب 1 README میں تاکہ `azd up` پہلے گم شدہ ضروریات پکڑی جا سکیں

#### تبدیل کیا گیا
- **🔐 ابتدائی توثیق کی رہنمائی** اب مسلسل `azd auth login` کو AZD ورک فلو کے لیے بنیادی طریقہ کے طور پر سمجھتی ہے، اور `az login` کو اختیاری قرار دیتی ہے جب تک کہ Azure CLI کمانڈز براہ راست استعمال نہ ہوں
- **📚 باب 1 کی شمولیت کا بہاؤ** اب سیکھنے والوں کو انسٹالیشن، توثیق، اور پہلی تعیناتی کے اقدامات سے پہلے اپنے مقامی سیٹ اپ کی توثیق کرنے کی ہدایت دیتا ہے
- **🛠️ توثیق کنندہ کا پیغام رسانی** اب واضح طور پر AZD-صرف ابتدائی راستے کے لیے رکاوٹ والے تقاضوں کو اختیاری Azure CLI وارننگز سے الگ کرتا ہے
- **📖 ترتیب، مسئلہ حل کرنے، اور مثالیں والی دستاویزات** اب AZD توثیق کو لازمی اور Azure CLI سائن ان کو اختیاری کے طور پر فرق کرتی ہیں جہاں پہلے دونوں بغیر سیاق و سباق پیش کیے گئے تھے

#### درست کیا گیا
- **📋 باقی انگریزی مواد کی کمانڈ حوالہ جات** موجودہ AZD فارمز میں اپ ڈیٹ کیے گئے، جن میں `azd config show` چیٹ شیٹ میں اور `azd monitor --overview` شامل ہیں جہاں Azure Portal جائزہ رہنمائی مقصود تھی
- **🧭 باب 1 میں ابتدائی دعوے** نرم کیے گئے تاکہ تمام ٹیمپلیٹس اور Azure وسائل میں صفر-خرابی یا رول بیک کے یقینی رویے کا ضرورت سے زیادہ وعدہ نہ کریں
- **🔎 لائیو CLI توثیق** پورے سہولت کے ساتھ `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, اور `azd down --force --purge` کے لیے کی گئی

#### اپ ڈیٹ کی گئی فائلیں
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

#### AZD 1.23.12 توثیق، ورکشاپ ماحول کی توسیع اور AI ماڈل کا تجدید
**یہ ورژن `azd` `1.23.12` کے خلاف دستاویز کی توثیق کرتا ہے، پرانے AZD کمانڈز کی مثالوں کو تازہ کرتا ہے، AI ماڈل رہنمائی کو موجودہ ڈیفالٹس پر اپ ڈیٹ کرتا ہے، اور ورکشاپ انسٹرکشنز کو GitHub Codespaces کے علاوہ ڈیولپمنٹ کنٹینرز اور مقامی کلونز کی حمایت کے لیے بڑھاتا ہے۔**

#### شامل کیا گیا
- **✅ تمام اہم چیپٹرز اور ورکشاپ دستاویزات میں توثیقی نوٹس** تاکہ سیکھنے والوں کو استعمال ہونے والے AZD بیس لائن کی وضاحت ہو، چاہے وہ نئی یا پرانی CLI تعمیرات استعمال کر رہے ہوں
- **⏱️ تعیناتی کی ٹائم آؤٹ کی رہنمائی** لمبے دورانیے کی AI ایپ تعیناتیاں کے لیے `azd deploy --timeout 1800`
- **🔎 ایکسٹینشن معائنہ کے اقدامات** AI ورک فلو دستاویزات میں `azd extension show azure.ai.agents` کے ساتھ
- **🌐 ورکشاپ ماحول کی وسیع رہنمائی** GitHub Codespaces، ڈیولپمنٹ کنٹینرز، اور مقامی کلونز کے لیے MkDocs کے ساتھ

#### تبدیل کیا گیا
- **📚 چیپٹر تعارفی READMEs** اب مستقل طور پر `azd 1.23.12` کے خلاف توثیق کا نوٹ دیتے ہیں: فاؤنڈیشن، کنفیگریشن، انفراسٹرکچر، ملٹی ایجنٹ، پری ڈیپلائمنٹ، ٹربل شوٹنگ، اور پروڈکشن سیکشنز میں
- **🛠️ AZD کمانڈ حوالہ جات** اب دستاویزات میں موجودہ صورتوں کے مطابق اپ ڈیٹ کیے گئے:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` یا `azd env get-value(s)` سیاق و سباق کے مطابق
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` جہاں اپلیکیشن انسائٹس کا جائزہ مطلوب ہو
- **🧪 پروویژن پریویو مثالیں** اس طرح سادہ کی گئی ہیں کہ موجودہ حمایت شدہ استعمال جیسے `azd provision --preview` اور `azd provision --preview -e production`
- **🧭 ورکشاپ کا بہاؤ** اپ ڈیٹ کیا گیا تاکہ سیکھنے والے لیبز کو Codespaces، ڈیولپمنٹ کنٹینرز، یا مقامی کلون میں مکمل کر سکیں، بجائے اس کے کہ صرف Codespaces پر انحصار کیا جائے
- **🔐 توثیق کی رہنمائی** اب AZD ورک فلو کے لیے `azd auth login` کو ترجیح دیتی ہے، جب کہ `az login` کو اختیاری قرار دیا گیا ہے اگر Azure CLI کمانڈز براہ راست استعمال ہو رہے ہوں

#### درست کیا گیا
- **🪟 ونڈوز انسٹال کمانڈز** انسٹالیشن گائیڈ میں `winget` پیکیج کا موجودہ کیسنگ کے ساتھ ہم آہنگ کیے گئے
- **🐧 لینکس انسٹال رہنمائی** درست کی گئی تاکہ وہ غیر معاون ڈسٹری مخصوص `azd` پیکیج مینیجر انسٹرکشنز سے بچ سکے اور مناسب جگہ پر ریلیز اثاثوں کی طرف اشارہ کرے
- **📦 AI ماڈل کی مثالیں** پرانے ڈیفالٹس جیسے `gpt-35-turbo` اور `text-embedding-ada-002` سے تازہ کی گئی ہیں موجودہ مثالوں جیسے `gpt-4.1-mini`, `gpt-4.1`, اور `text-embedding-3-large`
- **📋 تعیناتی اور تشخیصی سنپٹس** موجودہ ماحول اور اسٹیٹس کمانڈز کے ساتھ لاگز، اسکرپٹس، اور مسئلہ حل کرنے کے مراحل میں درست کیے گئے
- **⚙️ GitHub Actions کی رہنمائی** `Azure/setup-azd@v1.0.0` سے `Azure/setup-azd@v2` میں اپ ڈیٹ کی گئی
- **🤖 MCP/Copilot رضامندی کی رہنمائی** `azd mcp consent` سے `azd copilot consent list` میں اپ ڈیٹ کی گئی

#### بہتر بنایا گیا
- **🧠 AI چیپٹر کی رہنمائی** اب پریویو حساس `azd ai` رویے، ٹیننٹ مخصوص لاگ ان، موجودہ ایکسٹینشنز کے استعمال، اور اپ ڈیٹ کی گئی ماڈل تعیناتی کی سفارشات کو بہتر طریقے سے بیان کرتی ہے
- **🧪 ورکشاپ کی ہدایات** اب زیادہ حقیقی ورژن مثالیں اور واضح ماحول کی ترتیب کی زبان استعمال کرتی ہیں ہاتھ سے کرنے والی لیبز کے لیے
- **📈 پروڈکشن اور مسئلہ حل کرنے والی دستاویزات** اب موجودہ نگرانی، فیل بیک ماڈل، اور لاگت کی سطح کی مثالوں کے ساتھ بہتر مطابقت رکھتی ہیں

#### اپ ڈیٹ کی گئی فائلیں
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

#### AZD AI CLI کمانڈز، مواد کی توثیق اور ٹیمپلیٹ میں وسعت
**یہ ورژن تمام AI سے متعلق چیپٹرز میں `azd ai`, `azd extension`, اور `azd mcp` کمانڈز کا احاطہ کرتا ہے، agents.md میں ٹوٹے ہوئے لنکس اور منسوخ شدہ کوڈ کو درست کرتا ہے، چیٹ شیٹ کو اپ ڈیٹ کرتا ہے، اور مثال ٹیمپلیٹس کے سیکشن کو تصدیق شدہ وضاحتوں اور نئے Azure AI AZD ٹیمپلیٹس کے ساتھ مکمل طور پر نئے سرے سے تیار کرتا ہے۔**

#### شامل کیا گیا
- **🤖 AZD AI CLI کی کوریج** 7 فائلوں میں (پہلے صرف چیپٹر 8 میں):
  - `docs/chapter-01-foundation/azd-basics.md` — نیا "Extensions and AI Commands" سیکشن جس میں `azd extension`, `azd ai agent init`, اور `azd mcp` شامل ہیں
  - `docs/chapter-02-ai-development/agents.md` — آپشن 4: `azd ai agent init` موازنہ جدول کے ساتھ (ٹیمپلیٹ بمقابلہ مینفسٹ طریقہ)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" اور "Agent-First Deployment" ذیلی سیکشنز

  - `docs/chapter-05-multi-agent/README.md` — کوئیک اسٹارٹ اب ٹیمپلیٹ اور مینفسٹ پر مبنی ڈیپلائمنٹ دونوں راستے دکھاتا ہے
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — ڈپلائمنٹ سیکشن میں اب `azd ai agent init` آپشن شامل ہے
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI توسیع کمانڈز برائے تشخیص" ذیلی سیکشن
  - `resources/cheat-sheet.md` — نیا "AI & توسیعات کے کمانڈز" سیکشن، جس میں `azd extension`, `azd ai agent init`, `azd mcp`, اور `azd infra generate` شامل ہیں
- **📦 نئے AZD AI مثال ٹیمپلیٹس** `microsoft-foundry-integration.md` میں:
  - **azure-search-openai-demo-csharp** — .NET RAG چیٹ بلاذر ویب اسمبلی، سیمانٹک کرنل، اور وائس چیٹ سپورٹ کے ساتھ
  - **azure-search-openai-demo-java** — جاوا RAG چیٹ Langchain4J کے ساتھ ACA/AKS ڈیپلائمنٹ آپشنز کے تحت
  - **contoso-creative-writer** — ملٹی ایجنٹ تخلیقی لکھائی کا ایپ Azure AI ایجنٹ سروس، بنگ گراؤنڈنگ، اور پرامپٹی کے ساتھ
  - **serverless-chat-langchainjs** — سرورلیس RAG Azure فنکشنز + LangChain.js + Cosmos DB کے ساتھ Ollama مقامی ڈیولپمنٹ سپورٹ کے ساتھ
  - **chat-with-your-data-solution-accelerator** — انٹرپرائز RAG ایکسیلیریٹر ایڈمن پورٹل، ٹیمز انٹیگریشن، اور PostgreSQL/Cosmos DB آپشنز کے ساتھ
  - **azure-ai-travel-agents** — ملٹی ایجنٹ MCP آرکیسٹریشن ریفرنس ایپ .NET، پائتھون، جاوا، اور ٹائپ اسکرپٹ میں سرورز کے ساتھ
  - **azd-ai-starter** — مہم Azure AI انفراسٹرکچر بائسٹرٹر ٹیمپلیٹ
  - **🔗 شاندار AZD AI گیلری لنک** — [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) کا حوالہ (80+ ٹیمپلیٹس)

#### درست کیا گیا
- **🔗 agents.md نیویگیشن**: پچھلے/اگلے لنکس اب باب 2 README سبق کے آرڈر سے میل کھاتے ہیں (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ٹوٹے ہوئے لنکس**: `production-ai-practices.md` کو درست کر کے `../chapter-08-production/production-ai-practices.md` کیا گیا (3 جگہیں)
- **📦 agents.md پرانی کوڈ**: `opencensus` کو `azure-monitor-opentelemetry` + OpenTelemetry SDK سے بدل دیا گیا
- **🐛 agents.md غلط API**: `max_tokens` کو `create_agent()` سے `create_run()` میں `max_completion_tokens` کے طور پر منتقل کیا گیا
- **🔢 agents.md ٹوکن گنتی**: تخمینہ `len//4` کی جگہ `tiktoken.encoding_for_model()` استعمال کیا گیا
- **azure-search-openai-demo**: خدمات کو "Cognitive Search + App Service" سے "Azure AI Search + Azure Container Apps" میں درست کیا گیا (ڈیفالٹ ہوسٹ اکتوبر 2024 کو تبدیل ہوا)
- **contoso-chat**: تفصیل کو اپ ڈیٹ کر کے Azure AI Foundry + Prompty کا حوالہ دیا، جیسا کہ ریپو کے اصلی عنوان اور ٹیک اسٹیک سے میل کھاتا ہے

#### خارج کیا گیا
- **ai-document-processing**: غیر فعال ٹیمپلیٹ حوالہ (ریپو عوامی طور پر AZD ٹیمپلیٹ کے طور پر دستیاب نہیں) کو ہٹا دیا گیا

#### بہتری کی گئی
- **📝 agents.md مشقیں**: مشق 1 میں متوقع آؤٹ پٹ اور `azd monitor` کا مرحلہ دکھایا گیا؛ مشق 2 میں مکمل `FunctionTool` رجسٹریشن کوڈ شامل؛ مشق 3 میں غیر واضح رہنمائی کی جگہ واضح `prepdocs.py` کمانڈز دی گئی
- **📚 agents.md وسائل**: دستاویزات کے لنکس کو موجودہ Azure AI Agent Service کی دستاویزات اور کوئیک اسٹارٹ کے ساتھ اپ ڈیٹ کیا گیا
- **📋 agents.md اگلے اقدامات کی جدول**: مکمل باب کی کوریج کے لیے AI ورکشاپ لیب کا لنک شامل کیا گیا

#### اپ ڈیٹ کی گئی فائلیں
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### کورس نیویگیشن کی بہتری
**یہ ورژن README.md کے باب کی نیویگیشن کو بہتر جدول کی شکل دے کر بہتر بناتا ہے۔**

#### تبدیلیاں
- **کورس میپ ٹیبل**: براہ راست سبق کے لنکس، دورانیہ کے اندازے، اور پیچیدگی کی درجہ بندی کے ساتھ بہتر کیا گیا
- **فولڈر کی صفائی**: غیر ضروری پرانے فولڈرز کو حذف کیا گیا (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **لنک کی توثیق**: کورس میپ ٹیبل میں موجود تمام 21+ اندرونی لنکس کی تصدیق کی گئی

### [v3.16.0] - 2026-02-05

#### پروڈکٹ نام اپ ڈیٹس
**یہ ورژن پروڈکٹ حوالہ جات کو موجودہ مائیکروسافٹ برانڈنگ کے مطابق اپ ڈیٹ کرتا ہے۔**

#### تبدیلیاں
- **Microsoft Foundry → Microsoft Foundry**: تمام حوالہ جات غیر ترجمہ شدہ فائلوں میں اپ ڈیٹ کیے گئے
- **Azure AI Agent Service → Foundry Agents**: سروس کا نام موجودہ برانڈنگ کی عکاسی کے لیے اپ ڈیٹ کیا گیا

#### اپ ڈیٹ کی گئی فائلیں
- `README.md` - مرکزی کورس کا لینڈنگ صفحہ
- `changelog.md` - ورژن کی تاریخ
- `course-outline.md` - کورس کی ساخت
- `docs/chapter-02-ai-development/agents.md` - AI ایجنٹس گائیڈ
- `examples/README.md` - مثالوں کی دستاویزات
- `workshop/README.md` - ورکشاپ لینڈنگ صفحہ
- `workshop/docs/index.md` - ورکشاپ انڈیکس
- `workshop/docs/instructions/*.md` - تمام ورکشاپ انسٹرکشن فائلیں

---

### [v3.15.0] - 2026-02-05

#### بڑے ریپوزٹری کی ساخت نو: باب کی بنیاد پر فولڈر نام
**یہ ورژن دستاویزات کو مخصوص بابوں کے فولڈرز میں منظم کرتا ہے تاکہ نیویگیشن واضح ہو جائے۔**

#### فولڈر کے نام تبدیل ہوئے
پرانے فولڈرز کو باب کی نمبروں والے فولڈرز سے بدل دیا گیا ہے:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- نیا شامل کیا گیا: `docs/chapter-05-multi-agent/`

#### فائلوں کی منتقلی
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### شامل کیا گیا
- **📚 چپٹر README فائلیں**: ہر چپٹر فولڈر میں README.md تخلیق کی گئی جس میں:
  - سیکھنے کے مقاصد اور مدت
  - اسباق کی میز جس میں تفصیلات دی گئی ہیں
  - فوری شروع کرنے کے کمانڈز
  - دوسرے چپٹرز کی نیویگیشن

#### تبدیل کیا گیا
- **🔗 تمام اندرونی لنکس اپ ڈیٹ کی گئیں**: 78+ راستے تمام ڈاکیومنٹیشن فائلز میں اپ ڈیٹ
- **🗺️ مین README.md**: نئے چپٹر اسٹرکچر کے ساتھ کورس میپ اپ ڈیٹ کیا گیا
- **📝 examples/README.md**: چپٹر فولڈرز کے کراس ریفرنس اپ ڈیٹ کیے گئے

#### حذف کیا گیا
- پرانا فولڈر اسٹرکچر (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### ریپوزیٹری کی تعمیر نو: چپٹر نیویگیشن
**اس ورژن میں چپٹر نیویگیشن README فائلیں شامل کی گئیں (جو v3.15.0 کے ذریعے مسترد ہو گئی ہیں).**

---

### [v3.13.0] - 2026-02-05

#### نیا AI ایجنٹس گائیڈ
**یہ ورژن Azure Developer CLI کے ساتھ AI ایجنٹس کو تعینات کرنے کے لئے جامع رہنمائی شامل کرتا ہے۔**

#### شامل کیا گیا
- **🤖 docs/microsoft-foundry/agents.md**: مکمل گائیڈ شامل:
  - AI ایجنٹس کیا ہیں اور یہ چیٹ بوٹس سے کیسے مختلف ہیں
  - تین فوری شروع کرنے کے ایجنٹ ٹیمپلیٹس (Foundry Agents, Prompty, RAG)
  - ایجنٹ آرکیٹیکچر پیٹرنز (سنگل ایجنٹ، RAG، ملٹی ایجنٹ)
  - ٹول کنفیگریشن اور حسب ضرورت
  - مانیٹرنگ اور میٹرکس کی نگرانی
  - لاگت کے عوامل اور اصلاح
  - عام مسئلہ حل کرنے کے منظرنامے
  - تین عملی مشقیں جس کے کامیابی کے معیار ہیں

#### مواد کی ساخت
- **تعارف**: ابتدائیوں کے لئے ایجنٹ کے تصورات
- **فوری آغاز**: ایجنٹس کو `azd init --template get-started-with-ai-agents` کے ساتھ تعینات کریں
- **آرکیٹیکچر پیٹرنز**: ایجنٹ پیٹرنز کے بصری خاکے
- **کنفیگریشن**: ٹول سیٹ اپ اور ماحول کے متغیرات
- **مانیٹرنگ**: ایپلیکیشن انسائٹس انٹیگریشن
- **مشقیں**: مرحلہ وار عملی سیکھنا (20-45 منٹ ہر ایک)

---

### [v3.12.0] - 2026-02-05

#### ڈیولپمنٹ کنٹینر ماحول کی تازہ کاری
**یہ ورژن AZD لرننگ تجربے کے لیے جدید اوزار اور بہتر ڈیفالٹس کے ساتھ ڈویلپمنٹ کنٹینر کی کنفیگریشن کو اپ ڈیٹ کرتا ہے۔**

#### تبدیل کیا گیا
- **🐳 بیس امیج**: `python:3.12-bullseye` سے `python:3.12-bookworm` (ڈیبیان کے تازہ ترین مستحکم ورژن) میں اپ ڈیٹ کیا گیا
- **📛 کنٹینر کا نام**: وضاحت کے لیے "Python 3" سے "AZD for Beginners" میں تبدیل کیا گیا

#### شامل کیا گیا
- **🔧 نئے ڈیو کنٹینر فیچرز**:
  - `azure-cli` جس میں بائس سپورٹ فعال ہے
  - `node:20` (AZD ٹیمپلیٹس کے لیے LTS ورژن)
  - ٹیمپلیٹ مینجمنٹ کے لیے `github-cli`
  - کنٹینر ایپ کی تعیناتی کے لیے `docker-in-docker`

- **🔌 پورٹ فارورڈنگ**: عام ڈویلپمنٹ کے لیے پہلے سے ترتیب دی گئی پورٹس:
  - 8000 (MkDocs پریویو)
  - 3000 (ویب ایپس)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 نئے VS کوڈ ایکسٹینشنز**:
  - `ms-python.vscode-pylance` - بہتر پائتھن انٹیلی سینس
  - `ms-azuretools.vscode-azurefunctions` - Azure فنکشنز کی سپورٹ
  - `ms-azuretools.vscode-docker` - ڈوکر کی سپورٹ
  - `ms-azuretools.vscode-bicep` - بائس زبان کی سپورٹ
  - `ms-azure-devtools.azure-resource-groups` - Azure ریسورس مینجمنٹ
  - `yzhang.markdown-all-in-one` - مارکڈاؤن ایڈیٹنگ
  - `DavidAnson.vscode-markdownlint` - مارکڈاؤن لنٹنگ
  - `bierner.markdown-mermaid` - مرمیڈ ڈایاگرام سپورٹ
  - `redhat.vscode-yaml` - YAML کی سپورٹ (azure.yaml کے لیے)
  - `eamodio.gitlens` - گٹ کی بصری نمائندگی
  - `mhutchie.git-graph` - گٹ کی تاریخ دیکھنا

- **⚙️ VS کوڈ سیٹنگز**: پائتھن انٹرپریٹر کے لیے ڈیفالٹ سیٹنگز، فارمیٹ آن سیو، اور وائٹ اسپیس ٹرم کرنے کی سیٹنگز شامل کیں

- **📦 requirements-dev.txt اپ ڈیٹ ہوا**:
  - MkDocs منیفائی پلگ ان شامل کیا گیا
  - کوڈ کوالٹی کے لیے pre-commit شامل کیا گیا
  - Azure SDK پیکجز (azure-identity, azure-mgmt-resource) شامل کیے گئے

#### درست کیا گیا
- **Post-Create کمانڈ**: اب کنٹینر شروع ہونے پر AZD اور Azure CLI کی تنصیب کی تصدیق کرتا ہے

---

### [v3.11.0] - 2026-02-05

#### ابتدائیوں کے لیے README کا مکمل جائزہ
**یہ ورژن README.md کو ابتدائیوں کے لیے زیادہ قابل رسائی بناتا ہے اور AI ڈویلپرز کے لیے اہم وسائل شامل کرتا ہے۔**

#### شامل کیا گیا
- **🆚 Azure CLI بمقابلہ AZD موازنہ**: ہر ٹول استعمال کرنے کے واضح وضاحت اور عملی مثالیں
- **🌟 شاندار AZD لنکس**: کمیونٹی ٹیمپلیٹ گیلری اور تعاون کے وسائل کے براہ راست لنکس:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ تعیناتی کے لیے تیار ٹیمپلیٹس
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - کمیونٹی تعاون
- **🎯 فوری شروع کی رہنمائی**: آسان 3 قدمی آغاز کا سیکشن (انسٹال → لاگ ان → تعینات)
- **📊 تجربے کی بنیاد پر نیویگیشن ٹیبل**: ڈویلپر کے تجربے کی بنیاد پر واضح رہنمائی

#### تبدیل کیا گیا
- **README کی ساخت**: تدریجی انکشاف کے لیے دوبارہ منظم کیا گیا - اہم معلومات سب سے پہلے
- **تعارفی سیکشن**: "The Magic of `azd up`" کو مکمل ابتدائیوں کے لیے وضاحت کے ساتھ دوبارہ لکھا گیا
- **دوہرے مواد کو حذف کیا گیا**: مسئلہ حل کرنے والے سیکشن کی نقل ختم کی گئی

- **مسائل کو حل کرنے کے کمانڈز**: `azd logs` کے حوالے کو درست کر کے درست `azd monitor --logs` استعمال کیا گیا

#### درست کیا گیا

- **🔐 توثیقی کمانڈز**: `azd auth login` اور `azd auth logout` کو cheat-sheet.md میں شامل کیا گیا
- **غلط کمانڈ حوالہ جات**: README کے troubleshooting سیکشن سے باقی بچی ہوئی `azd logs` کو ہٹا دیا گیا

#### نوٹس
- **دائرہ کار**: بنیادی README.md اور resources/cheat-sheet.md میں تبدیلیاں کی گئیں
- **مخصوص سامعین**: خاص طور پر AZD کے لیے نئے ڈویلپرز کے لیے بہتریاں کی گئیں

---

### [v3.10.0] - 2026-02-05

#### Azure Developer CLI کمانڈ درستگی کی تازہ کاری
**یہ ورژن دستاویزات میں غیر موجود AZD کمانڈز کو درست کرتا ہے، اس بات کو یقینی بناتے ہوئے کہ تمام کوڈ مثالیں درست Azure Developer CLI نحو استعمال کریں۔**

#### درست کیے گئے
- **🔧 غیر موجود AZD کمانڈز ہٹائیں**: غیر درست کمانڈز کا مکمل آڈٹ اور اصلاح:
  - `azd logs` (موجود نہیں) → `azd monitor --logs` یا Azure CLI کے متبادل سے بدل دیا گیا
  - `azd service` کے سب کمانڈز (موجود نہیں) → `azd show` اور Azure CLI سے بدل دیا گیا
  - `azd infra import/export/validate` (موجود نہیں) → ہٹا دیا گیا یا درست متبادل سے بدل دیا گیا
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (موجود نہیں) → ہٹا دیا گیا
  - `azd provision --what-if/--rollback` flags (موجود نہیں) → `--preview` استعمال کرنے کے لیے اپ ڈیٹ کیا گیا
  - `azd config validate` (موجود نہیں) → `azd config list` سے بدل دیا گیا
  - `azd info`, `azd history`, `azd metrics` (موجود نہیں) → ہٹا دیا گیا

- **📚 کمانڈ اصلاحات کے ساتھ فائلیں اپ ڈیٹ ہوئیں**:
  - `resources/cheat-sheet.md`: کمانڈ حوالہ جات کا مکمل جائزہ
  - `docs/deployment/deployment-guide.md`: رول بیک اور تعیناتی حکمت عملیاں درست کی گئیں
  - `docs/troubleshooting/debugging.md`: لاگ تجزیہ کے سیکشن درست کیے گئے
  - `docs/troubleshooting/common-issues.md`: حل مسائل کے کمانڈز کو اپ ڈیٹ کیا گیا
  - `docs/troubleshooting/ai-troubleshooting.md`: AZD ڈی بگنگ سیکشن درست کیا گیا
  - `docs/getting-started/azd-basics.md`: مانیٹرنگ کمانڈز درست کیے گئے
  - `docs/getting-started/first-project.md`: مانیٹرنگ اور ڈی بگنگ کی مثالیں اپ ڈیٹ کی گئیں
  - `docs/getting-started/installation.md`: ہیلب اور ورژن کی مثالیں درست کی گئیں
  - `docs/pre-deployment/application-insights.md`: لاگ دیکھنے کے کمانڈ درست کیے گئے
  - `docs/pre-deployment/coordination-patterns.md`: ایجنٹ ڈی بگنگ کمانڈز درست کیے گئے

- **📝 ورژن ریفرنس اپ ڈیٹ**: 
  - `docs/getting-started/installation.md`: ہارڈ کوڈڈ `1.5.0` ورژن کو عام `1.x.x` میں تبدیل کیا گیا اور ریلیزز کا لنک دیا گیا

#### بدلے گئے
- **رول بیک حکمت عملی**: دستاویزات کو Git-based رول بیک استعمال کرنے کے لیے اپ ڈیٹ کیا گیا (AZD میں مقامی رول بیک نہیں ہے)
- **لاگ دیکھنا**: `azd logs` حوالہ جات کو `azd monitor --logs`, `azd monitor --live`, اور Azure CLI کمانڈز سے بدل دیا گیا
- **کارکردگی کا سیکشن**: غیر موجود متوازی/تدریجی تعیناتی flags ہٹائے گئے، اور درست متبادل فراہم کیے گئے

#### تکنیکی تفصیلات
- **موجودہ AZD کمانڈز**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **موجودہ azd monitor flags**: `--live`, `--logs`, `--overview`
- **ہٹائی گئی خصوصیات**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### نوٹس
- **تصدیق**: کمانڈز Azure Developer CLI v1.23.x کے خلاف تصدیق شدہ

---

### [v3.9.0] - 2026-02-05

#### ورکشاپ مکمل اور دستاویزات معیار کی تازہ کاری
**یہ ورژن انٹرایکٹو ورکشاپ ماڈیولز کو مکمل کرتا ہے، تمام ٹوٹے ہوئے دستاویزی لنکس کو درست کرتا ہے، اور Microsoft AZD استعمال کرنے والے AI ڈویلپرز کے لیے مجموعی مواد کے معیار کو بہتر بناتا ہے۔**

#### شامل کیا گیا
- **📝 CONTRIBUTING.md**: نئی شراکت داری کے رہنما خطوط والی دستاویز:
  - مسئلے کی رپورٹنگ اور تبدیلیوں کی تجویز کے لیے واضح ہدایات
  - نئے مواد کے لیے دستاویزی معیارات
  - کوڈ مثالوں کے رہنما اصول اور کمیٹ پیغامات کے طریقے
  - کمیونٹی کی جھڑپ کی معلومات

#### مکمل کیے گئے
- **🎯 ورکشاپ ماڈیول 7 (اختتام)**: مکمل اختتامی ماڈیول کے ساتھ:
  - ورکشاپ کی کامیابیوں کا جامع خلاصہ
  - AZD، ٹیمپلیٹس، اور Microsoft Foundry کے اہم تصورات کا سیکشن
  - سیکھنے کے سفر کی مسلسل ترقی کی سفارشات
  - ورکشاپ چیلنج مشقیں اور مشکل درجہ بندی
  - کمیونٹی کی رائے اور سپورٹ لنکس

- **📚 ورکشاپ ماڈیول 3 (تجزیہ)**: تعلیمی مقاصد کو اپ ڈیٹ کیا گیا:
  - GitHub Copilot کے ساتھ MCP سرورز فعال کرنے کی رہنمائی
  - AZD ٹیمپلیٹ فولڈر کی ساخت کی تفہیم
  - انفراسٹرکچر بطور کوڈ (بائسِپ) تنظیم کے نمونے
  - عملی لیب کے ہدایات

- **🔧 ورکشاپ ماڈیول 6 (ٹھہراؤ)**: مکمل ہدف:
  - وسائل کی صفائی اور لاگت انتظام کے مقاصد
  - محفوظ انفراسٹرکچر ڈیپروویژن کے لیے `azd down` کا استعمال
  - نرم حذف شدہ علمی خدمات کی بازیابی کی رہنمائی
  - GitHub Copilot اور Azure Portal کے لیے اضافی دریافت کے اشارے

#### درست کیے گئے
- **🔗 ٹوٹے ہوئے لنکس کی اصلاح**: 15+ ٹوٹے ہوئے اندرونی دستاویزی لنکس حل کیے گئے:
  - `docs/ai-foundry/ai-model-deployment.md`: microsoft-foundry-integration.md کے راستے درست کیے گئے
  - `docs/troubleshooting/ai-troubleshooting.md`: ai-model-deployment.md اور production-ai-practices.md کے راستے درست کیے گئے
  - `docs/getting-started/first-project.md`: غیر موجود cicd-integration.md کو deployment-guide.md سے بدل دیا گیا
  - `examples/retail-scenario.md`: FAQ اور troubleshooting guide کے راستے درست کیے گئے
  - `examples/container-app/microservices/README.md`: کورس ہوم اور تعیناتی گائیڈ کے راستے درست کیے گئے
  - `resources/faq.md` اور `resources/glossary.md`: AI باب کے حوالہ جات اپ ڈیٹ کیے گئے
  - `course-outline.md`: انسٹرکٹر گائیڈ اور AI ورکشاپ لیب کے حوالہ جات درست کیے گئے

- **📅 ورکشاپ اسٹیٹس بینر**: "Under Construction" سے اپ ڈیٹ کرکے فعال ورکشاپ کی حیثیت دیکھی گئی (فروری 2026 کی تاریخ کے ساتھ)

- **🔗 ورکشاپ نیویگیشن**: ورکشاپ README.md میں ٹوٹے ہوئے نیویگیشن لنکس درست کیے گئے جو غیر موجود lab-1-azd-basics فولڈر کی طرف اشارہ کر رہے تھے

#### بدلے گئے
- **ورکشاپ پریزنٹیشن**: "under construction" انتباہ ہٹایا گیا، ورکشاپ اب مکمل اور استعمال کے لیے تیار ہے
- **نیویگیشن میں تسلسل**: یقینی بنایا گیا کہ تمام ورکشاپ ماڈیولز میں مناسب انٹر-ماڈیول نیویگیشن ہو
- **سیکھنے کے راستے کے حوالہ جات**: بابوں کے متقابل حوالہ جات کو صحیح microsoft-foundry راستوں سے اپ ڈیٹ کیا گیا

#### تصدیق شدہ
- ✅ تمام انگلش مارک ڈاؤن فائلوں میں درست اندرونی لنکس موجود ہیں
- ✅ ورکشاپ ماڈیولز 0-7 تعلیمی مقاصد کے ساتھ مکمل ہیں
- ✅ بابوں اور ماڈیولز کے درمیان نیویگیشن درست طریقے سے کام کرتا ہے
- ✅ مواد Microsoft AZD استعمال کرنے والے AI ڈویلپرز کے لیے موزوں ہے
- ✅ شروع کرنے والوں کے لیے دوستانہ زبان اور ساخت مستقل برقرار رکھی گئی ہے
- ✅ CONTRIBUTING.md کمیونٹی کے شراکت داروں کے لیے واضح رہنمائی فراہم کرتا ہے

#### تکنیکی عمل درآمد
- **لنک کی تصدیق**: خودکار PowerShell اسکرپٹ نے تمام .md اندرونی لنکس کی جانچ کی
- **مواد کا آڈٹ**: ورکشاپ کی مکملیت اور ابتدائی مطابقت کے لیے دستی جائزہ
- **نیویگیشن سسٹم**: باب اور ماڈیول نیویگیشن کے مستقل نمونے نافذ کیے گئے

#### نوٹس
- **دائرہ کار**: تبدیلیاں صرف انگلش دستاویزات پر لاگو ہوئیں
- **ترجمے**: ترجمہ والی فولڈرز اس ورژن میں اپ ڈیٹ نہیں ہوئے (خودکار ترجمہ بعد میں ہم آہنگ ہوگا)
- **ورکشاپ کا دورانیہ**: مکمل ورکشاپ اب 3-4 گھنٹے کی عملی تعلیم فراہم کرتی ہے

---

### [v3.8.0] - 2025-11-19

#### جدید دستاویزات: مانیٹرنگ، سیکیورٹی، اور ملٹی ایجنٹ پیٹرنز
**یہ ورژن Application Insights انٹیگریشن، توثیقی نمونے، اور پیداوار کی تعیناتیوں کے لیے ملٹی ایجنٹ کوآرڈینیشن پر جامع A-گریڈ سبق شامل کرتا ہے۔**

#### شامل کیا گیا
- **📊 Application Insights انٹیگریشن سبق**: `docs/pre-deployment/application-insights.md` میں:
  - خودکار پروویژننگ کے ساتھ AZD-مرکوز تعیناتی
  - Application Insights + Log Analytics کے مکمل بائسِپ ٹیمپلیٹس
  - کسٹم ٹیلی میٹری کے ساتھ کام کرنے والی پائتھون ایپلیکیشنز (1,200+ لائنیں)
  - AI/LLM مانیٹرنگ پیٹرنز (Microsoft Foundry ماڈلز کے ٹوکن/لاگت کی نگرانی)
  - 6 مرمیڈ ڈایاگرامز (معماری، تقسیم شدہ ٹریسنگ، ٹیلی میٹری فلو)
  - 3 عملی مشقیں (التعریفات، ڈیش بورڈز، AI مانیٹرنگ)
  - کسٹو کوئری کی مثالیں اور لاگت کی اصلاح کی حکمت عملی
  - براہِ راست میٹرکس اسٹریم اور حقیقی وقت کی ڈی بگنگ
  - 40-50 منٹ کا سیکھنے کا وقت پیداوار کے لیے تیار پیٹرنز کے ساتھ

- **🔐 توثیق اور سیکیورٹی پیٹرنز سبق**: `docs/getting-started/authsecurity.md` میں:
  - 3 توثیقی نمونے (کنکشن سٹرنگز، Key Vault، منیجڈ شناخت)
  - محفوظ تعیناتیوں کے لیے مکمل بائسِپ انفراسٹرکچر ٹیمپلیٹس
  - Azure SDK انٹیگریشن کے ساتھ Node.js ایپلیکیشن کوڈ
  - 3 مکمل مشقیں (منیجڈ شناخت فعال کرنا، یوزر-اسائنڈ شناخت، Key Vault کی گردش)
  - سیکیورٹی کی بہترین مشقیں اور RBAC کنفیگریشنز
  - حل مسائل کے رہنما اور لاگت کا تجزیہ
  - پیداوار کے لیے تیار پاس ورڈ لیس توثیقی نمونے

- **🤖 ملٹی ایجنٹ کوآرڈینیشن پیٹرنز سبق**: `docs/pre-deployment/coordination-patterns.md` میں:
  - 5 کوآرڈینیشن پیٹرنز (تسلسلی، متوازی، درجہ بندی شدہ، ایونٹ سے چلنے والے، اتفاق رائے)
  - مکمل آرکیسٹریٹر سروس عملدرآمد (Python/Flask، 1,500+ لائنیں)
  - 3 مخصوص ایجنٹ عملدرآمد (تحقیقی، مصنف، مدیر)
  - پیغام قطار بندی کے لیے سروس بس انٹیگریشن
  - تقسیم شدہ نظام کے لیے Cosmos DB ریاست کا انتظام
  - ایجنٹ کے تعاملات دکھانے والے 6 مرمیڈ ڈایاگرامز
  - 3 اعلیٰ مشقیں (ٹائم آؤٹ ہینڈلنگ، دوبارہ کوشش کرنے کا منطق، سرکٹ بریکَر)
  - لاگت کا تخمینہ ($240-565/ماہ) اور اصلاح کی حکمت عملی
  - مانیٹرنگ کے لیے Application Insights انٹیگریشن

#### بہتر بنایا گیا
- **پری ڈیپلوئمنٹ باب**: اب جامع مانیٹرنگ اور کوآرڈینیشن پیٹرنز شامل ہیں
- **شروع کرنے کا باب**: پیشہ ورانہ توثیقی پیٹرنز کے ساتھ بہتر کیا گیا
- **پیداوار کی تیاری**: سیکیورٹی سے لے کر قابل مشاہدہ تک مکمل کوریج
- **کورس آؤٹ لائن**: اب باب 3 اور 6 میں نئے اسباق کا حوالہ

#### بدلے گئے
- **سیکھنے کی ترقی**: سیکیورٹی اور مانیٹرنگ کو کورس کے دوران بہتر مربوط کیا گیا
- **دستاویزی معیار**: نئے اسباق میں مسلسل A-گریڈ معیار (95-97%)
- **پیداوار کے نمونے**: کاروباری تعیناتیوں کے لیے مکمل اختتام تک کوریج

#### بہتر بنایا گیا
- **ڈویلپر کا تجربہ**: ترقی سے لے کر پیداوار میں مانیٹرنگ تک واضح راستہ
- **سیکیورٹی کے معیار**: توثیق اور رازوں کے انتظام کے لیے پیشہ ورانہ پیٹرنز
- **قابل مشاہدگی**: AZD کے ساتھ مکمل Application Insights انٹیگریشن
- **AI کے کام**: Microsoft Foundry ماڈلز اور ملٹی ایجنٹ نظام کے لیے مخصوص مانیٹرنگ

#### تصدیق شدہ
- ✅ تمام اسباق مکمل ورکنگ کوڈ شامل کرتے ہیں (جزوی کوڈ نہیں)
- ✅ بصری سیکھنے کے لیے مرمیڈ ڈایاگرامز (3 اسباق میں کل 19)
- ✅ تصدیقی مراحل کے ساتھ عملی مشقیں (کل 9)
- ✅ پیداوار کے لیے تیار بائسِپ ٹیمپلیٹس `azd up` کے ذریعے تعینات ہونے کے قابل
- ✅ لاگت کا تجزیہ اور اصلاح کی حکمت عملی
- ✅ حل مسائل کے رہنما اور بہترین مشقیں
- ✅ تصدیقی کمانڈز کے ساتھ علم کے چیک پوائنٹس

#### دستاویزی گریڈنگ کے نتائج
- **docs/pre-deployment/application-insights.md**: - جامع مانیٹرنگ گائیڈ
- **docs/getting-started/authsecurity.md**: - پیشہ ورانہ سیکیورٹی پیٹرنز
- **docs/pre-deployment/coordination-patterns.md**: - اعلیٰ درجے کی ملٹی ایجنٹ آرکیٹیکچرز
- **مجموعی نیا مواد**: - مستقل اعلیٰ معیار

#### تکنیکی عمل درآمد
- **Application Insights**: Log Analytics + کسٹم ٹیلی میٹری + تقسیم شدہ ٹریسنگ
- **توثیق**: منیجڈ شناخت + Key Vault + RBAC پیٹرنز
- **ملٹی ایجنٹ**: سروس بس + Cosmos DB + کنٹینر ایپس + آرکیسٹریشن
- **مانیٹرنگ**: لائیو میٹرکس + کسٹو کوئریز + التنبیہات + ڈیش بورڈز
- **لاگت کا انتظام**: سیمپلنگ حکمت عملیاں، برقرار رکھنے کی پالیسیاں، بجٹ کنٹرول

### [v3.7.0] - 2025-11-19

#### دستاویزی معیار کی بہتریاں اور نیا Microsoft Foundry Models مثال
**یہ ورژن مخزن بھر میں دستاویزی معیار کو بہتر بناتا ہے اور gpt-4.1 چیٹ انٹرفیس کے ساتھ مکمل Microsoft Foundry Models تعیناتی کی مثال شامل کرتا ہے۔**

#### شامل کیا گیا
- **🤖 Microsoft Foundry Models چیٹ مثال**: `examples/azure-openai-chat/` میں مکمل gpt-4.1 تعیناتی کے ساتھ کام کرنے والی مثال:
  - مکمل Microsoft Foundry Models انفراسٹرکچر (gpt-4.1 ماڈل تعیناتی)
  - گفتگو کے تاریخ کے ساتھ پائتھون کمانڈ لائن چیٹ انٹرفیس
  - محفوظ API کلید کے لیے Key Vault انٹیگریشن
  - ٹوکن استعمال کی نگرانی اور لاگت کا تخمینہ
  - ریٹ لمیٹنگ اور ایرر ہینڈلنگ
  - 35-45 منٹ کی تعیناتی گائیڈ کے ساتھ جامع README
  - 11 پیداوار کے لیے تیار فائلیں (بائسِپ ٹیمپلیٹس، پائتھون ایپ، کنفیگریشن)
- **📚 دستاویزی مشقیں**: کنفیگریشن گائیڈ میں عملی مشقیں شامل کیں:
  - مشق 1: کثیر ماحول کی کنفیگریشن (15 منٹ)
  - مشق 2: رازوں کا انتظام کی مشق (10 منٹ)
  - واضح کامیابی کے معیار اور تصدیقی مراحل
- **✅ تعیناتی کی تصدیق**: تعیناتی گائیڈ میں تصدیقی سیکشن شامل کیا گیا:
  - صحت چیک کے طریقے
  - کامیابی کے معیار کی فہرست
  - تمام تعیناتی کمانڈز کے متوقع نتائج
  - فوری حل مسائل کا حوالہ

#### بہتر بنایا گیا
- **examples/README.md**: A-گریڈ معیار (93%) تک اپ ڈیٹ کیا گیا:
  - azure-openai-chat کو تمام متعلقہ سیکشنز میں شامل کیا گیا
  - مقامی مثال کی تعداد 3 سے 4 کی گئی
  - AI ایپلیکیشن مثالوں کے جدول میں شامل کیا گیا
  - درمیانے درجے کے صارفین کے لیے کوئیک اسٹارٹ میں انضمام کیا گیا
  - Microsoft Foundry ٹیمپلیٹس سیکشن میں شامل کیا گیا
  - موازنہ میٹرکس اور ٹیکنالوجی تلاش سیکشنز کو اپ ڈیٹ کیا گیا
- **دستاویزی معیار**: docs فولڈر میں B+ (87%) سے بہتر کر کے A- (92%) کیا گیا

  - اہم کمانڈ مثالوں میں متوقع نتائج شامل کیے گئے
  - کنفیگریشن تبدیلیوں کی تصدیق کے اقدامات شامل کیے گئے
  - عملی مشقوں کے ساتھ ہینڈز آن لرننگ کو بہتر بنایا گیا

#### تبدیل شدہ
- **تعلیمی ترقی**: درمیانے درجے کے سیکھنے والوں کے لیے AI کی مثالوں کا بہتر انضمام
- **دستاویزات کی ساخت**: واضح نتائج کے ساتھ مزید قابل عمل مشقیں
- **تصدیقی عمل**: اہم ورک فلو میں واضح کامیابی کے معیار شامل کیے گئے

#### بہتر کیا گیا
- **ڈویلپر کا تجربہ**: Microsoft Foundry Models کی تعیناتی اب 35-45 منٹ میں ہوتی ہے (مقابلے میں جہاں پیچیدہ متبادلات کے لیے 60-90 منٹ ہوتے تھے)
- **لاگت کی شفافیت**: Microsoft Foundry Models کی مثال کے لئے واضح لاگت کے اندازے ($50-200/ماہ)
- **سیکھنے کا راستہ**: AI ڈویلپرز کے لیے azure-openai-chat کے ساتھ واضح اندراج نقطہ
- **دستاویزات کے معیارات**: مستقل متوقع نتائج اور تصدیقی اقدامات

#### تصدیق شدہ
- ✅ Microsoft Foundry Models کی مثال مکمل طور پر `azd up` کے ساتھ کام کر رہی ہے
- ✅ تمام 11 نافذ کرنے والی فائلیں نحوی طور پر درست ہیں
- ✅ README ہدایات اصل تعیناتی کے تجربے کے مطابق ہیں
- ✅ دستاویزات کے لنکس 8+ جگہوں پر اپ ڈیٹ کیے گئے ہیں
- ✅ مثالوں کا انڈیکس 4 مقامی مثالوں کی صحیح عکاسی کرتا ہے
- ✅ ٹیبلز میں کوئی ڈپلیکٹ خارجی لنکس نہیں ہیں
- ✅ تمام نیوی گیشن ریفرنسز درست ہیں

#### تکنیکی نفاذ
- **Microsoft Foundry Models کی ساخت**: gpt-4.1 + کی والٹ + کنٹینر ایپس پیٹرن
- **سیکورٹی**: منیجڈ آئیڈینٹی تیار، کی والٹ میں سیکرٹس
- **مانیٹرنگ**: ایپلیکیشن انسائٹس کا انضمام
- **لاگت کا انتظام**: ٹوکن ٹریکنگ اور استعمال کی بہتر کاری
- **تعیناتی**: مکمل سیٹ اپ کے لیے واحد `azd up` کمانڈ

### [v3.6.0] - 2025-11-19

#### بڑا اپ ڈیٹ: کنٹینر ایپ تعیناتی کی مثالیں
**یہ ورژن Azure Developer CLI (AZD) کا استعمال کرتے ہوئے مکمل، پروڈکشن کے لیے تیار کنٹینر ایپلیکیشن کی تعیناتی کی مثالوں کو متعارف کراتا ہے، جس میں مکمل دستاویزات اور سیکھنے کے راستے میں انضمام شامل ہے۔**

#### شامل کیا گیا
- **🚀 کنٹینر ایپ مثالیں**: نئے مقامی مثالیں `examples/container-app/` میں:
  - [ماسٹر گائیڈ](examples/container-app/README.md): کنٹینرائزڈ تعیناتیوں کا مکمل جائزہ، فوری آغاز، پروڈکشن، اور جدید پیٹرن
  - [سادہ Flask API](../../examples/container-app/simple-flask-api): مبتدیوں کے لیے REST API جس میں scale-to-zero، ہیلتھ پروبز، مانیٹرنگ، اور مسئلہ حل کرنا شامل ہے
  - [مائیکرو سروسز آرکیٹیکچر](../../examples/container-app/microservices): پروڈکشن کے لیے تیار ملٹی سروس تعیناتی (API گیٹ وے، پروڈکٹ، آرڈر، یوزر، نوٹیفیکیشن)، ایسینک میسجنگ، سروس بس، کاسموس DB، Azure SQL، تقسیم شدہ ٹریسنگ، بلیو-گرین/کینری تعیناتی
- **بہترین طریقے**: کنٹینرائزڈ ورکلوڈز کے لئے سیکورٹی، مانیٹرنگ، لاگت کی بہتر کاری، اور CI/CD گائیڈنس
- **کوڈ نمونے**: مکمل `azure.yaml`، بائسک ٹیمپلیٹس، اور کثیر زبان سروس نفاذ (Python, Node.js, C#, Go)
- **ٹیسٹنگ اور مسئلہ حل کرنا**: آغاز سے آخر تک کے ٹیسٹ منظرنامے، مانیٹرنگ کمانڈز، مسئلہ حل کرنے کی رہنمائی

#### تبدیل شدہ
- **README.md**: نئی کنٹینر ایپ مثالوں کی خصوصیات اور "مقامی مثالیں - کنٹینر ایپلیکیشن" کے تحت لنکس اپ ڈیٹ کیے گئے
- **examples/README.md**: کنٹینر ایپ مثالوں کو نمایاں کرنے، موازنہ میٹرکس اندراجات شامل کرنے، اور ٹیکنالوجی/آرکیٹیکچر کے ریفرنس اپ ڈیٹ کیے گئے
- **کورس آؤٹ لائن اور اسٹڈی گائیڈ**: متعلقہ ابواب میں نئی کنٹینر ایپ مثالوں اور تعیناتی پیٹرنز کے حوالہ جات اپ ڈیٹ کیے گئے

#### تصدیق شدہ
- ✅ تمام نئی مثالیں `azd up` کے ساتھ تعینات کی جا سکتی ہیں اور بہترین طریقوں کی پیروی کرتی ہیں
- ✅ دستاویزات کے کراس لنکس اور نیوی گیشن اپ ڈیٹ کیے گئے
- ✅ مثالیں ابتدائی سے لے کر جدید سیناریوز تک ہیں، بشمول پروڈکشن مائیکرو سروسز

#### نوٹس
- **دائرہ کار**: انگریزی دستاویزات اور مثالیں صرف
- **آگے کے مراحل**: مستقبل میں اضافی جدید کنٹینر پیٹرنز اور CI/CD خودکاری کے ساتھ توسیع

### [v3.5.0] - 2025-11-19

#### پروڈکٹ ری برانڈنگ: Microsoft Foundry
**یہ ورژن تمام انگریزی دستاویزات میں "Microsoft Foundry" کے رسمی برانڈنگ کی عکاسی کرتے ہوئے مکمل پروڈکٹ نام کی تبدیلی کو نافذ کرتا ہے۔**

#### تبدیل شدہ
- **🔄 پروڈکٹ نام کی تازہ کاری**: مکمل ری برانڈنگ "Microsoft Foundry" سے "Microsoft Foundry" میں
  - `docs/` فولڈر میں انگریزی دستاویزات کے تمام حوالے اپ ڈیٹ کیے گئے
  - فولڈر کا نام تبدیل کیا گیا: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - فائل کا نام تبدیل کیا گیا: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - مجموعی طور پر 7 دستاویزی فائلوں میں 23 مواد کے حوالے اپ ڈیٹ کیے گئے

- **📁 فولڈر کی ساخت میں تبدیلیاں**:
  - `docs/ai-foundry/` کا نام تبدیل کر کے `docs/microsoft-foundry/` رکھا گیا
  - نئے فولڈر ڈھانچے کی عکاسی کے لیے تمام کراس ریفرنسز اپ ڈیٹ کیے گئے
  - تمام دستاویزات میں نیوی گیشن لنکس کی تصدیق کی گئی

- **📄 فائل ناموں کی تبدیلیاں**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - تمام داخلی لنکس نئے فائل نام کے مطابق اپ ڈیٹ کیے گئے

#### اپ ڈیٹ شدہ فائلیں
- **چیپٹر دستاویزات** (7 فائلیں):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 نیوی گیشن لنک اپ ڈیٹس
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 پروڈکٹ نام کے حوالے اپ ڈیٹ کیے گئے
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - پہلے سے Microsoft Foundry استعمال ہو رہا ہے (پچھلے اپ ڈیٹس سے)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 حوالے اپ ڈیٹ کیے گئے (جائزہ، کمیونٹی فیڈبیک، دستاویزات)
  - `docs/getting-started/azd-basics.md` - 4 کراس ریفرنس لنک اپ ڈیٹس
  - `docs/getting-started/first-project.md` - 2 چیپٹر نیویگیشن لنک اپ ڈیٹس
  - `docs/getting-started/installation.md` - 2 اگلے چیپٹر لنک اپ ڈیٹس
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 حوالے اپ ڈیٹ کیے گئے (نیویگیشن، Discord کمیونٹی)
  - `docs/troubleshooting/common-issues.md` - 1 نیویگیشن لنک اپ ڈیٹ
  - `docs/troubleshooting/debugging.md` - 1 نیوی گیشن لنک اپ ڈیٹ

- **کورس کی ساخت کی فائلیں** (2 فائلیں):
  - `README.md` - 17 حوالے اپ ڈیٹ کیے گئے (کورس کا جائزہ، چیپٹر کے عنوانات، ٹیمپلیٹس سیکشن، کمیونٹی انسائٹس)
  - `course-outline.md` - 14 حوالے اپ ڈیٹ کیے گئے (جائزہ، سیکھنے کے مقاصد، چیپٹر کے وسائل)

#### تصدیق شدہ
- ✅ انگریزی دستاویزات میں "ai-foundry" فولڈر راستہ کے کوئی باقی حوالے نہیں ہیں
- ✅ انگریزی دستاویزات میں "Microsoft Foundry" پروڈکٹ نام کے کوئی باقی حوالے نہیں ہیں
- ✅ نئے فولڈر ڈھانچے کے ساتھ تمام نیوی گیشن لنکس کام کر رہے ہیں
- ✅ فائل اور فولڈر نام کی تبدیلیاں کامیابی کے ساتھ مکمل ہوئیں
- ✅ ابواب کے درمیان کراس ریفرنسز کی تصدیق کی گئی

#### نوٹس
- **دائرہ کار**: تبدیلیاں صرف `docs/` فولڈر میں انگریزی دستاویزات پر لاگو ہوتی ہیں
- **ترجمے**: اس ورژن میں ترجمہ فولڈرز (`translations/`) کو اپ ڈیٹ نہیں کیا گیا
- **ورکشاپ**: اس ورژن میں ورکشاپ مواد (`workshop/`) کو اپ ڈیٹ نہیں کیا گیا
- **مثالیں**: مثال کی فائلیں ہوسکتا ہے پرانی ناموں کا حوالہ دیتی رہیں (مستقبل کی اپ ڈیٹ میں درست کی جائیں گی)
- **بیرونی لنکس**: بیرونی URLs اور GitHub ریپوزیٹری کے حوالے بغیر تبدیلی کے رہیں گے

#### شراکت داروں کے لیے مائگریشن گائیڈ
اگر آپ کے پاس پرانی ساخت کا حوالہ دینے والی لوکل برانچز یا دستاویزات ہیں:
1. فولڈر کے حوالے اپ ڈیٹ کریں: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. فائل کے حوالے اپ ڈیٹ کریں: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. پروڈکٹ نام تبدیل کریں: "Microsoft Foundry" → "Microsoft Foundry"
4. تمام داخلی دستاویزات کے لنکس کی درستگی کی تصدیق کریں

---

### [v3.4.0] - 2025-10-24

#### انفراسٹرکچر پریویو اور تصدیقی بہتریاں
**یہ ورژن نئے Azure Developer CLI پریویو فیچر کے لیے مکمل حمایت متعارف کراتا ہے اور ورکشاپ صارف کے تجربے کو بہتر بناتا ہے۔**

#### شامل کیا گیا
- **🧪 azd provision --preview فیچر دستاویزات**: نئے انفراسٹرکچر پریویو صلاحیت کا جامع احاطہ
  - کمانڈ ریفرنس اور چیٹ شیٹ میں استعمال کی مثالیں
  - پروویژنگ گائیڈ میں تفصیلی انضمام، استعمال کے کیسز اور فوائد کے ساتھ
  - محفوظ تعیناتی تصدیق کے لیے پری فلائٹ چیک انضمام
  - سیفٹی-فرسٹ تعیناتی طریقہ کار کے ساتھ شروع کرنے کی رہنمائی اپ ڈیٹ
- **🚧 ورکشاپ اسٹیٹس بینر**: ورکشاپ کی ترقی کی حالت ظاہر کرنے والا پیشہ ورانہ HTML بینر
  - واضح صارف ابلاغ کے لیے گریڈینٹ ڈیزائن اور ساختی اشارے
  - شفافیت کے لیے تازہ ترین اپ ڈیٹ کا وقت شامل
  - تمام ڈیوائس اقسام کے لیے موبائل ریسپانسیو ڈیزائن

#### بہتر کیا گیا
- **انفراسٹرکچر کی حفاظت**: تعیناتی کی دستاویزات میں پریویو فعالیت کا انضمام
- **قبل از تعیناتی تصدیق**: اب خودکار اسکرپٹس میں انفراسٹرکچر پریویو ٹیسٹنگ شامل ہے
- **ڈویلپر ورک فلو**: کمانڈ سلسلے اب بہترین عمل کے طور پر پریویو شامل کرتے ہیں
- **ورکشاپ کا تجربہ**: صارفین کے لیے مواد کی ترقی کی صورتحال کی واضح توقعات

#### تبدیل شدہ
- **تعیناتی کے بہترین طریقے**: اب پریویو-فرسٹ ورک فلو سفارش کی جاتی ہے
- **دستاویزات کا بہاؤ**: سیکھنے کے عمل میں انفراسٹرکچر کی تصدیق کو ابتدائی مقام پر منتقل کیا گیا
- **ورکشاپ کی پیشکش**: واضح ترقیاتی ٹائم لائن کے ساتھ پیشہ ورانہ اسٹیٹس ابلاغ

#### بہتر کیا گیا
- **حفاظتی نقطہ نظر**: تعیناتی سے پہلے انفراسٹرکچر کی تبدیلیوں کی تصدیق کی جا سکتی ہے
- **ٹیم تعاون**: جائزے اور منظوری کے لیے پریویو نتائج کا اشتراک ممکن
- **لاگت کا شعور**: پروویژننگ سے پہلے وسائل کی لاگت کی بہتر سمجھ
- **رسک کی کمی**: پیشگی تصدیق کے ذریعے تعیناتی کی ناکامیوں میں کمی

#### تکنیکی نفاذ
- **کثیر دستاویز انضمام**: پریویو فیچر کو 4 کلیدی فائلوں میں دستاویزی شکل دی گئی
- **کمانڈ پیٹرنز**: دستاویزات میں مستقل نحو اور مثالیں
- **بہترین طریقہ انضمام**: تصدیقی ورک فلو اور اسکرپٹس میں پریویو شامل ہے
- **بصری اشارے**: نئی خصوصیت کی واضح نشاندہی کے لیے نشانیاں

#### ورکشاپ انفراسٹرکچر
- **اسٹیٹس ابلاغ**: گریڈینٹ اسٹائلنگ کے ساتھ پیشہ ورانہ HTML بینر
- **صارف کا تجربہ**: واضح ترقیاتی حالت الجھن کو روکتی ہے
- **پیشہ ورانہ پیشکش**: توقعات کے تعین کے دوران ریپوزیٹری کی معتبر حیثیت برقرار رکھتا ہے
- **ٹائم لائن کی شفافیت**: اکتوبر 2025 کا تازہ ترین اپ ڈیٹ وقت برائے احتساب

### [v3.3.0] - 2025-09-24

#### بہتر کردہ ورکشاپ میٹریلز اور انٹرایکٹو تعلیمی تجربہ
**یہ ورژن براؤزر پر مبنی انٹرایکٹو گائیڈز اور منظم تعلیمی راستوں کے ساتھ مکمل ورکشاپ مواد متعارف کراتا ہے۔**

#### شامل کیا گیا
- **🎥 انٹرایکٹو ورکشاپ گائیڈ**: MkDocs پریویو صلاحیت کے ساتھ براؤزر پر مبنی ورکشاپ تجربہ
- **📝 منظم ورکشاپ ہدایات**: دریافت سے تخصیص تک 7 مراحل کا رہنمائی سیکھنے کا راستہ
  - 0-تعارف: ورکشاپ کا جائزہ اور سیٹ اپ
  - 1-AI ٹیمپلیٹ کا انتخاب: ٹیمپلیٹ کی دریافت اور انتخاب کا عمل
  - 2-AI ٹیمپلیٹ کی تصدیق: تعیناتی اور تصدیقی طریقہ کار
  - 3-AI ٹیمپلیٹ کی تجزیہ: ٹیمپلیٹ کی ساخت کی سمجھ
  - 4-AI ٹیمپلیٹ کی کنفیگریشن: تشکیل اور تخصیص
  - 5-AI ٹیمپلیٹ کی تخصیص: جدید ترمیمات اور تکرار
  - 6-انفراسٹرکچر کی صفائی: وسائل کا انتظام اور صفائی
  - 7-اختتام: خلاصہ اور اگلے اقدامات
- **🛠️ ورکشاپ ٹولنگ**: بہتر تعلیمی تجربے کے لیے MkDocs کی تشکیل اور Material تھیم
- **🎯 ہینڈز آن لرننگ پاتھ**: 3-مرحلہ طریقہ کار (دریافت → تعیناتی → تخصیص)
- **📱 GitHub Codespaces انضمام**: آسان ترقیاتی ماحول کی ترتیب

#### بہتر کیا گیا
- **AI ورکشاپ لیب**: جامع 2-3 گھنٹے کا منظم تعلیمی تجربہ شامل کیا گیا
- **ورکشاپ دستاویزات**: پیشہ ورانہ پیشکش کے ساتھ نیوی گیشن اور بصری معاونت
- **تعلیمی ترقی**: ٹیمپلیٹ انتخاب سے پروڈکشن تعیناتی تک واضح قدم بہ قدم رہنمائی
- **ڈویلپر کا تجربہ**: مربوط ٹولنگ کے ذریعے ترقیاتی ورک فلو کو آسان بنایا گیا

#### بہتر کیا گیا
- **رسائی**: سرچ، کاپی فنکشن، اور تھیم ٹوگل کے ساتھ براؤزر پر مبنی انٹرفیس
- **خود رفتار سیکھنا**: مختلف سیکھنے کی رفتار کو سہولت دینے والا ورکشاپ ڈھانچہ
- **عملی اطلاق**: حقیقی دنیا کے AI ٹیمپلیٹ تعیناتی کے منظرنامے
- **کمیونٹی انضمام**: ورکشاپ سپورٹ اور تعاون کے لیے Discord انضمام

#### ورکشاپ کی خصوصیات
- **بلٹ ان سرچ**: تیزی سے کی ورڈ اور سبق کی دریافت
- **کوڈ بلاکس کی کاپی**: تمام کوڈ مثالوں کے لیے ہور-ٹو-کاپی فنکشنالٹی
- **تھیم ٹوگل**: مختلف ترجیحات کے لیے ڈارک/لائٹ موڈ سپورٹ
- **بصری اثاثے**: بہتر سمجھ کے لیے اسکرین شاٹس اور ڈایاگرامز
- **مدد انضمام**: کمیونٹی سپورٹ کے لیے براہ راست Discord رسائی

### [v3.2.0] - 2025-09-17

#### بڑا نیویگیشن کی ساخت نو اور چیپٹر پر مبنی تعلیمی نظام
**یہ ورژن مکمل چیپٹر پر مبنی تعلیمی ساخت اور پورے ریپوزیٹری میں بہتر نیویگیشن متعارف کراتا ہے۔**

#### شامل کیا گیا
- **📚 چیپٹر پر مبنی تعلیمی نظام**: پورے کورس کو 8 ترقی پذیر تعلیمی ابواب میں ترتیب دیا گیا
  - چیپٹر 1: بنیاد اور فوری آغاز (⭐ - 30-45 منٹ)
  - چیپٹر 2: AI-فرسٹ ترقی (⭐⭐ - 1-2 گھنٹے)
  - چیپٹر 3: کنفیگریشن اور توثیق (⭐⭐ - 45-60 منٹ)
  - چیپٹر 4: کوڈ کے طور پر انفراسٹرکچر اور تعیناتی (⭐⭐⭐ - 1-1.5 گھنٹے)
  - چیپٹر 5: ملٹی ایجنٹ AI حل (⭐⭐⭐⭐ - 2-3 گھنٹے)
  - چیپٹر 6: قبل از تعیناتی تصدیق اور منصوبہ بندی (⭐⭐ - 1 گھنٹہ)
  - چیپٹر 7: مسئلہ حل کرنا اور ڈیبگنگ (⭐⭐ - 1-1.5 گھنٹے)
  - چیپٹر 8: پروڈکشن اور انٹرپرائز پیٹرنز (⭐⭐⭐⭐ - 2-3 گھنٹے)
- **📚 جامع نیویگیشن سسٹم**: تمام دستاویزات میں مستقل نیویگیشن ہیڈر اور فوٹرز
- **🎯 پیشرفت کی ٹریکنگ**: کورس مکمل ہونے کی چیک لسٹ اور سیکھنے کی تصدیقی نظام
- **🗺️ سیکھنے کا راستہ رہنمائی**: مختلف تجربہ کی سطحوں اور اہداف کے لیے واضح اندراج نقاط
- **🔗 کراس ریفرنس نیویگیشن**: متعلقہ ابواب اور پری ریکویزٹس کا واضح لنک

#### بہتر کیا گیا
- **README ساخت**: چیپٹر پر مبنی تنظیم کے ساتھ منظم تعلیمی پلیٹ فارم میں تبدیل کیا گیا
- **دستاویزات کی نیویگیشن**: ہر صفحے میں اب چیپٹر کا سیاق و سباق اور ترقی کی رہنمائی شامل ہے
- **ٹیمپلیٹ تنظیم**: مثالیں اور ٹیمپلیٹس کو مناسب تعلیمی ابواب کے ساتھ نقشہ بنایا گیا

- **وسائل کا انضمام**: چیٹ شیٹس، اکثر پوچھے جانے والے سوالات، اور مطالعہ کے رہنما متعلقہ ابواب سے جڑے ہوئے
- **ورکشاپ انضمام**: متعدد بابوں کے تعلیمی مقاصد کے مطابق ہینڈز آن لیبز

#### تبدیل شدہ
- **تعلیمی پیش رفت**: خطی دستاویزات سے لچکدار بابوں پر مبنی تعلیم کی طرف منتقلی
- **ترتیب کی جگہ**: بہتر تعلیمی بہاؤ کے لیے ترتیب گائیڈ کو باب 3 کے طور پر دوبارہ رکھا گیا
- **AI مواد کا انضمام**: تعلیمی سفر کے دوران AI مخصوص مواد کا بہتر انضمام
- **پروڈکشن مواد**: انٹرپرائز سیکھنے والوں کے لیے باب 8 میں ایڈوانس پیٹرنز کا یکجا کرنا

#### بہتری
- **صارف کا تجربہ**: واضح نیویگیشن بریڈکرمز اور باب کی پیش رفت کے اشارے
- **رسائی**: آسان کورس کی روانی کے لیے ہم آہنگ نیویگیشن پیٹرنز
- **پروفیشنل پیش کش**: تعلیمی اور کارپوریٹ تربیت کے لیے یونیورسٹی طرز کا کورس ڈھانچہ
- **تعلیمی کارکردگی**: بہتر تنظیم کے ذریعے متعلقہ مواد تلاش کرنے کا وقت کم کیا گیا

#### تکنیکی نفاذ
- **نیویگیشن ہیڈرز**: 40+ دستاویزی فائلوں میں باب کی نیویگیشن کو یکساں بنایا گیا
- **فوٹر نیویگیشن**: تسلسل کی ہدایت اور باب کے مکمل ہونے کے اشارے یکساں
- **کراس لنکنگ**: متعلقہ تصورات کو آپس میں جوڑنے والا مکمل اندرونی روابط کا نظام
- **باب کا نقشہ**: ٹیمپلیٹس اور مثالیں واضح طور پر تعلیمی مقاصد سے منسلک

#### مطالعہ گائیڈ میں بہتری
- **📚 جامع تعلیمی مقاصد**: مطالعہ گائیڈ کو 8 باب کے نظام کے مطابق نئے سرے سے ترتیب دیا گیا
- **🎯 باب پر مبنی جائزہ**: ہر باب میں مخصوص تعلیمی مقاصد اور عملی مشقیں شامل
- **📋 پیش رفت کی نگرانی**: ہفتہ وار تعلیمی شیڈول جس میں قابل پیمائش نتائج اور تکمیل چیک لسٹس
- **❓ جائزہ سوالات**: ہر باب کے لیے علم کی تصدیق کے سوالات اور پیشہ ورانہ نتائج
- **🛠️ عملی مشقیں**: حقیقی تعیناتی منظرناموں اور دشواریوں کے حل کے ساتھ ہینڈز آن سرگرمیاں
- **📊 مہارت کی پیش رفت**: بنیادی تصورات سے لے کر انٹرپرائز پیٹرنز تک واضح ترقی، کیریئر کی ترقی پر توجہ کے ساتھ
- **🎓 سرٹیفیکیشن فریم ورک**: پیشہ ورانہ ترقی کے نتائج اور کمیونٹی کی پہچان کا نظام
- **⏱️ ٹائم لائن مینجمنٹ**: منظم 10 ہفتے کا تعلیمی منصوبہ، سنگ میل کی تصدیق کے ساتھ

### [v3.1.0] - 2025-09-17

#### بہتر شدہ ملٹی ایجنٹ AI حل
**یہ ورژن ملٹی ایجنٹ ریٹیل حل کو بہتر ایجنٹ کے نام اور بہتر دستاویزات کے ساتھ بہتر بناتا ہے۔**

#### تبدیل شدہ
- **ملٹی ایجنٹ اصطلاحات**: پورے ریٹیل ملٹی ایجنٹ حل میں "کورا ایجنٹ" کو "کسٹمر ایجنٹ" سے تبدیل کیا گیا تاکہ بہتر سمجھ آئے
- **ایجنٹ ساخت**: تمام دستاویزات، ARM ٹیمپلیٹس، اور کوڈ کی مثالوں میں یکساں "کسٹمر ایجنٹ" نام استعمال کرنے کے لیے اپ ڈیٹ
- **تشکیل کی مثالیں**: ایجنٹ تشکیل کے پیٹرنز کو جدید بنانے کے لیے اسمیت نام کے معیارات کو اپ ڈیٹ کیا گیا
- **دستاویز کی یکسانیت**: تمام حوالہ جات میں پیشہ ورانہ، وضاحتی ایجنٹ ناموں کا استعمال یقینی بنایا گیا

#### بہتر شدہ
- **ARM ٹیمپلیٹ پیکیج**: retail-multiagent-arm-template کو کسٹمر ایجنٹ حوالہ جات کے ساتھ اپ ڈیٹ کیا گیا
- **ساخت کے خاکے**: مرمیڈ ڈایاگرام کو اپ ڈیٹ شدہ ایجنٹ نام کے ساتھ تازہ کیا گیا
- **کوڈ مثالیں**: پائتھون کلاسز اور نفاذ کی مثالوں میں اب CustomerAgent نام استعمال ہوتا ہے
- **ماحول کے متغیرات**: تمام ڈیپلائمنٹ اسکرپٹس CUSTOMER_AGENT_NAME معیارات استعمال کرنے کے لیے اپ ڈیٹ کیے گئے

#### بہتری
- **ڈویلپر تجربہ**: دستاویزات میں ایجنٹ کے کردار اور ذمہ داریوں کو واضح کیا گیا
- **پروڈکشن کی تیاری**: انٹرپرائز نامگذاری کے ساتھ بہتر مطابقت
- **تعلیمی مواد**: تعلیمی مقاصد کے لیے مزید بصری اور آسان ایجنٹ نام گذاری
- **ٹیمپلیٹ کی استعمال کی آسانی**: ایجنٹ فنکشنز اور ڈپلائمنٹ پیٹرنز کی سمجھ آسان بنائی گئی

#### تکنیکی تفصیلات
- مرمیڈ ساختی خاکے CustomerAgent حوالہ جات کے ساتھ اپ ڈیٹ کیے گئے
- Python مثالوں میں CoraAgent کلاس کے نام CustomerAgent سے تبدیل کیے گئے
- ARM ٹیمپلیٹ JSON کنفیگریشنز کو "customer" ایجنٹ ٹائپ کے استعمال کے لیے تبدیل کیا گیا
- ماحول کے متغیرات کو CORA_AGENT_* سے CUSTOMER_AGENT_* پیٹرنز میں اپ ڈیٹ کیا گیا
- تمام تعیناتی کمانڈز اور کنٹینر کنفیگریشنز کو تازہ کیا گیا

### [v3.0.0] - 2025-09-12

#### بڑے تبدیلیاں - AI ڈویلپر فوکس اور مائیکروسافٹ فاؤنڈری انضمام
**یہ ورژن ریپوزیٹری کو ایک جامع AI مرکوز تعلیمی وسائل میں تبدیل کرتا ہے، جس میں مائیکروسافٹ فاؤنڈری کا انضمام شامل ہے۔**

#### شامل شدہ
- **🤖 AI-فرسٹ تعلیمی راستہ**: AI ڈویلپرز اور انجینئرز کو ترجیح دیتے ہوئے مکمل نئی ساخت
- **مائیکروسافٹ فاؤنڈری انضمام گائیڈ**: AZD کو مائیکروسافٹ فاؤنڈری سروسز سے جوڑنے کی مکمل دستاویزات
- **AI ماڈل تعیناتی کے پیٹرنز**: ماڈل کے انتخاب، ترتیب، اور پیداواری تعیناتی حکمت عملیوں کا مفصل گائیڈ
- **AI ورکشاپ لیب**: AI ایپلیکیشنز کو AZD-ڈپلائی ایبل حل میں تبدیل کرنے کے لیے 2-3 گھنٹے کا ہینڈز آن ورکشاپ
- **پروڈکشن AI بہترین طریقے**: انٹرپرائز کے لیے قابل پیمائش، مانیٹرنگ، اور AI ورک لوڈ سیکیور کرنے کے پیٹرنز
- **AI مخصوص دشواری حل گائیڈ**: مائیکروسافٹ فاؤنڈری ماڈلز، کوگنیٹیو سروسز، اور AI تعیناتی مسائل کے لیے جامع دشواری حل
- **AI ٹیمپلیٹ گیلری**: مائیکروسافٹ فاؤنڈری ٹیمپلیٹس کا منتخب مجموعہ، جس میں مشکل کی درجہ بندی شامل ہے
- **ورکشاپ مواد**: مکمل ورکشاپ کی ساخت ہینڈز آن لیبز اور حوالہ مواد کے ساتھ

#### بہتر شدہ
- **README ساخت**: AI-ڈویلپرز پر مرتکز، 45% کمیونٹی دلچسپی کا ڈیٹا مائیکروسافٹ فاؤنڈری ڈسکارڈ سے
- **تعلیمی راستے**: روایتی راستوں کے ساتھ ساتھ AI ڈویلپر کا مخصوص سفر
- **ٹیمپلیٹ کی سفارشات**: شامل AI ٹیمپلیٹس میں azure-search-openai-demo، contoso-chat، اور openai-chat-app-quickstart شامل ہیں
- **کمیونٹی انضمام**: AI مخصوص چینلز اور مباحثوں کے ساتھ ڈسکارڈ کمیونٹی سپورٹ میں بہتری

#### سیکیورٹی اور پروڈکشن فوکس
- **مینجڈ آئیڈینٹیٹی پیٹرنز**: AI مخصوص توثیق اور سیکیورٹی کی ترتیبات
- **لاگت کی بچت**: AI ورک لوڈ کے لیے ٹوکن کے استعمال کی نگرانی اور بجٹ کنٹرولز
- **کثیر خطّہ تعیناتی**: عالمی AI ایپلیکیشن تعیناتی کے لیے حکمت عملیاں
- **کارکردگی کی نگرانی**: AI مخصوص میٹرکس اور ایپلیکیشن انسائٹس انضمام

#### دستاویزات کا معیار
- **خطی کورس ساخت**: مبتدی سے ایڈوانس AI تعیناتی پیٹرنز تک منطقی پیش رفت
- **توثیق شدہ URLs**: تمام بیرونی ریپوزیٹری لنکس چیک کیے گئے اور قابل رسائی
- **مکمل حوالہ**: تمام اندرونی دستاویزی روابط کی تصدیق اور کارکردگی
- **پروڈکشن کے قابل**: انٹرپرائز تعیناتی پیٹرنز کے ساتھ حقیقی دنیا کی مثالیں

### [v2.0.0] - 2025-09-09

#### بڑے تبدیلیاں - ریپوزیٹری کی ساخت نو اور پیشہ ورانہ بہتری
**یہ ورژن ریپوزیٹری کی ساخت اور مواد کی پیش کش میں نمایاں بہتری کی نمائندگی کرتا ہے۔**

#### شامل شدہ
- **منظم تعلیمی فریم ورک**: تمام دستاویزی صفحات میں اب تعارف، تعلیمی اہداف، اور تعلیمی نتائج شامل ہیں
- **نیویگیشن سسٹم**: تمام دستاویزات میں پچھلے/اگلے سبق کے لنکس شامل کیے گئے ہیں تاکہ تعلیمی پیش رفت مانی جا سکے
- **مطالعہ گائیڈ**: جامع study-guide.md جس میں تعلیمی مقاصد، عملی مشقیں، اور جائزہ مواد شامل ہیں
- **پیشہ ورانہ پیش کش**: بہتر رسائی اور پیشہ ورانہ دکھاوے کے لیے تمام ایموجی آئیکنز ہٹا دیے گئے
- **مواد کی بہتر ساخت**: تعلیمی مواد کی تنظیم اور بہاؤ میں بہتری

#### تبدیل شدہ
- **دستاویزات کا فارمیٹ**: مستقل تعلیمی مرکوز ساخت کے ساتھ تمام دستاویزات معیاری بنائی گئیں
- **نیویگیشن کا بہاؤ**: تمام تعلیمی مواد میں منطقی پیش رفت کو نافذ کیا گیا
- **مواد کی پیش کش**: واضح، پیشہ ورانہ فارمیٹنگ کے حق میں سجاؤ سنوار کے عناصر کو ہٹایا گیا
- **لنک ڈھانچہ**: نئے نیویگیشن نظام کی حمایت کے لیے تمام اندرونی لنکس کو اپ ڈیٹ کیا گیا

#### بہتری
- **رسائی**: بہتر اسکرین ریڈر مطابقت کے لیے ایموجی انحصار ختم کیا گیا
- **پیشہ ورانہ شکل**: صاف، تعلیمی طرز کی پیشکش، انٹرپرائز سیکھنے کے لیے موزوں
- **تعلیمی تجربہ**: ہر سبق کے لیے واضح مقاصد اور نتائج کے ساتھ منظم طریقہ کار
- **مواد کی تنظیم**: متعلقہ موضوعات کے مابین بہتر منطقی بہاؤ اور ربط

### [v1.0.0] - 2025-09-09

#### ابتدائی ریلیز - جامع AZD تعلیمی ریپوزیٹری

#### شامل شدہ
- **بنیادی دستاویزی ڈھانچہ**
  - مکمل شروع کرنے والی گائیڈ سیریز
  - جامع تعیناتی اور پروویژننگ دستاویزات
  - تفصیلی دشواری حل کے وسائل اور ڈیبگنگ گائیڈز
  - پیشگی تعیناتی کی تصدیقی ٹولز اور طریقہ کار

- **شروع کرنے والا ماڈیول**
  - AZD کی بنیادیں: اہم تصورات اور اصطلاحات
  - انسٹالیشن گائیڈ: مخصوص پلیٹ فارم سیٹ اپ ہدایات
  - ترتیب گائیڈ: ماحول کی ترتیب اور تصدیق
  - پہلا پروجیکٹ ٹیوٹوریل: مرحلہ وار ہینڈز آن تعلیم

- **تعیناتی اور پروویژننگ ماڈیول**
  - تعیناتی گائیڈ: مکمل ورک فلو دستاویزات
  - پروویژننگ گائیڈ: Bicep کے ساتھ انفراسٹرکچر ایز کوڈ
  - پروڈکشن تعیناتی کے بہترین طریقے
  - ملٹی سروس آرکیٹیکچر پیٹرنز

- **پیشگی تصدیق ماڈیول**
  - صلاحیت کی منصوبہ بندی: Azure وسائل کی دستیابی کی تصدیق
  - SKU انتخاب: جامع سروس ٹیر گائیڈنس
  - پری فلائٹ چیکس: خودکار تصدیقی اسکرپٹس (PowerShell اور Bash)
  - لاگت کا تخمینہ اور بجٹ کی منصوبہ بندی کے اوزار

- **دشواری حل ماڈیول**
  - عام مسائل: اکثر پیش آنے والے مسائل اور حل
  - ڈی بگنگ گائیڈ: منظم دشواری حل کے طریقے
  - ایڈوانس تشخیصی تکنیک اور اوزار
  - کارکردگی کی نگرانی اور بہتر بنانا

- **وسائل اور حوالہ جات**
  - کمانڈ چیٹ شیٹ: اہم کمانڈز کے لیے فوری حوالہ
  - گلوسری: جامع اصطلاحات اور مخففات کی وضاحت
  - FAQ: عام سوالات کے تفصیلی جواب
  - بیرونی وسائل کے لنکس اور کمیونٹی روابط

- **مثالیں اور ٹیمپلیٹس**
  - سادہ ویب ایپلیکیشن کی مثال
  - جامد ویب سائٹ تعیناتی ٹیمپلیٹ
  - کنٹینر ایپلیکیشن ترتیب
  - ڈیٹا بیس انضمام پیٹرنز
  - مائیکرو سروسز آرکیٹیکچر کی مثالیں
  - سرور لیس فنکشن نفاذ

#### خصوصیات
- **کثیر پلیٹ فارم سپورٹ**: ونڈوز، میک او ایس، اور لینکس کے لیے انسٹالیشن اور ترتیب گائیڈز
- **متعدد مہارت کی سطحیں**: طلبا سے لے کر پیشہ ورانہ ڈویلپرز کے لیے مواد
- **عملی توجہ**: ہینڈز آن مثالیں اور حقیقی دنیا کے منظرنامے
- **جامع کوریج**: بنیادی تصورات سے لے کر ایڈوانس انٹرپرائز پیٹرنز
- **سیکیورٹی فرسٹ اپروچ**: سیکیورٹی کے بہترین طریقے شامل کیے گئے ہیں
- **لاگت کی بچت**: مؤثر تعیناتی اور وسائل کے انتظام کی ہدایات

#### دستاویزات کا معیار
- **تفصیلی کوڈ مثالیں**: عملی، آزمودہ کوڈ کے نمونے
- **مرحلہ وار ہدایات**: واضح، عملی رہنمائی
- **جامع خرابی ہینڈلنگ**: عام مسائل کے دشواری حل
- **بہترین طریقوں کا انضمام**: صنعتی معیار اور سفارشات
- **ورژن مطابقت**: تازہ ترین Azure سروسز اور azd فیچرز کے ساتھ ہم آہنگ

## منصوبہ بند آئندہ بہتریاں

### ورژن 3.1.0 (منصوبہ بند)
#### AI پلیٹ فارم کی توسیع
- **کثیر ماڈل سپورٹ**: Hugging Face، Azure Machine Learning، اور کسٹم ماڈلز کے انضمامی پیٹرنز
- **AI ایجنٹ فریم ورکس**: LangChain، Semantic Kernel، اور AutoGen تعیناتی کے ٹیمپلیٹس
- **ایڈوانس RAG پیٹرنز**: Azure AI Search سے آگے ویکٹر ڈیٹا بیس کے اختیارات (Pinecone, Weaviate وغیرہ)
- **AI آبزرویبلیٹی**: ماڈل کی کارکردگی، ٹوکن کے استعمال، اور جوابی معیار کی بہتر نگرانی

#### ڈویلپر تجربہ
- **VS کوڈ ایکسٹینشن**: یکجا AZD اور مائیکروسافٹ فاؤنڈری کی ترقیاتی تجربات
- **GitHub کوپائلٹ انضمام**: AI معاون AZD ٹیمپلیٹ جنریشن
- **تفاعلی ٹیوٹوریلز**: AI منظرناموں کے لیے خودکار تصدیق کے ساتھ ہینڈز آن کوڈنگ مشقیں
- **ویڈیو مواد**: بصری سیکھنے والوں کے لیے سپلیمنٹری ویڈیو ٹیوٹوریلز جو AI تعیناتیوں پر مرکوز ہیں

### ورژن 4.0.0 (منصوبہ بند)
#### انٹرپرائز AI پیٹرنز
- **گورننس فریم ورک**: AI ماڈل گورننس، تعمیل، اور آڈٹ ٹریل
- **کثیر کرایہ دار AI**: متعدد صارفین کو الگ تھلگ AI سروسز کی فراہمی کے پیٹرنز
- **ایج AI تعیناتی**: Azure IoT Edge اور کنٹینر انسٹینسز کے ساتھ انضمام
- **ہائبرڈ کلاؤڈ AI**: AI ورک لوڈز کے لیے ملٹی کلاؤڈ اور ہائبرڈ تعیناتی کے پیٹرنز

#### ایڈوانس خصوصیات
- **AI پائپ لائن آٹومیشن**: Azure Machine Learning پائپ لائنز کے ساتھ MLOps انضمام
- **ایڈوانس سیکیورٹی**: زیرو ٹرسٹ پیٹرنز، پرائیویٹ اینڈ پوائنٹس، اور ایڈوانس تھریٹ پروٹیکشن
- **کارکردگی کی بہتری**: ہائی تھروپٹ AI ایپلیکیشنز کے لیے ایڈوانس ٹیوننگ اور اسکیلنگ حکمت عملی
- **عالمی تقسیم**: AI ایپلیکیشنز کے لیے مواد کی ترسیل اور ایج کیشنگ پیٹرنز

### ورژن 3.0.0 (منسوخ) - موجودہ ریلیز نے اسے ختم کر دیا ہے
#### تجویز کردہ اضافے - اب v3.0.0 میں نافذ
- ✅ **AI مرکوز مواد**: جامع مائیکروسافٹ فاؤنڈری انضمام (مکمل)
- ✅ **تفاعلی ٹیوٹوریلز**: ہینڈز آن AI ورکشاپ لیب (مکمل)
- ✅ **ایڈوانس سیکیورٹی ماڈیول**: AI مخصوص سیکیورٹی پیٹرنز (مکمل)
- ✅ **کارکردگی کی بہتری**: AI ورک لوڈ ٹیوننگ حکمت عملی (مکمل)

### ورژن 2.1.0 (منصوبہ بند) - جزوی طور پر v3.0.0 میں نافذ
#### معمولی بہتریاں - کچھ موجودہ ریلیز میں مکمل ہوئیں
- ✅ **اضافی مثالیں**: AI مرکوز تعیناتی منظرنامے (مکمل)
- ✅ **موسیع FAQ**: AI مخصوص سوالات اور دشواری حل (مکمل)
- **ٹول انضمام**: IDE اور ایڈیٹر انضمام گائیڈز میں بہتری
- ✅ **مانیٹرنگ کی توسیع**: AI مخصوص نگرانی اور الرٹنگ پیٹرنز (مکمل)

#### آئندہ ریلیز کے لیے ابھی منصوبہ بند
- **موبائل دوستانہ دستاویزات**: موبائل تعلیم کے لیے جوابی ڈیزائن
- **آف لائن رسائی**: قابل ڈاؤن لوڈ دستاویزاتی پیکیجز
- **بہتر IDE انضمام**: AZD + AI ورک فلو کے لیے VS کوڈ ایکسٹینشن
- **کمیونٹی ڈیش بورڈ**: حقیقی وقت کمیونٹی میٹرکس اور شراکت کی نگرانی

## تبدیلیوں کے لاگ میں حصہ لینا

### تبدیلیوں کی رپورٹنگ
اس ریپوزیٹری میں حصہ لیتے وقت، براہ کرم یقینی بنائیں کہ تبدیلیوں کے لاگ میں شامل ہوں:

1. **ورژن نمبر**: سیمینٹک ورژننگ کے مطابق (مجرّد.ثانوی.پیچ)
2. **تاریخ**: جاری کرنے یا اپ ڈیٹ کی تاریخ YYYY-MM-DD فارمیٹ میں
3. **زمرہ**: شامل، تبدیل شدہ، ناکارہ، حذف شدہ، درست، سیکیورٹی
4. **واضح وضاحت**: مختصر وضاحت کہ کیا بدلا ہے
5. **اثرات کا جائزہ**: تبدیلیاں موجودہ صارفین کو کیسے متاثر کرتی ہیں

### تبدیلی کی اقسام

#### شامل شدہ
- نئی خصوصیات، دستاویزی سیکشنز، یا صلاحیتیں
- نئی مثالیں، ٹیمپلیٹس، یا تعلیمی وسائل
- اضافی ٹولز، اسکرپٹس، یا یوزر ٹیلٹیز

#### تبدیل شدہ
- موجودہ فنکشنالٹی یا دستاویزات میں تبدیلیاں
- وضاحت یا درستگی بہتر بنانے کے لیے اپ ڈیٹس
- مواد یا تنظیم کی ساخت نو

#### ناکارہ شدہ
- ایسی خصوصیات یا طریقہ کار جو ختم ہو رہے ہیں
- دستاویزی سیکشنز جنہیں ہٹانے کا شیڈول ہے
- ایسے طریقے جن کے بہتر متبادل موجود ہیں

#### حذف شدہ
- خصوصیات، دستاویزات، یا مثالیں جو اب متعلقہ نہیں رہیں
- پرانی معلومات یا ناکارہ طریقہ کار
- غیر ضروری یا یکجا کیا گیا مواد

#### درست شدہ
- دستاویز یا کوڈ میں غلطیوں کی اصلاحات
- رپورٹ کیے گئے مسائل یا مشکلات کا حل
- درستگی یا فنکشنالٹی میں بہتری


#### سیکیورٹی
- سیکیورٹی سے متعلق بہتریاں یا اصلاحات
- سیکیورٹی کی بہترین عملی طریقوں میں تازہ کاری
- سیکیورٹی کی کمزوریوں کا حل

### سیمانٹک ورژننگ کے رہنما اصول

#### میجر ورژن (X.0.0)
- توڑنے والی تبدیلیاں جن کے لیے صارف کی کارروائی ضروری ہو
- مواد یا تنظیم کا اہم دوبارہ ساخت
- تبدیلیاں جو بنیادی نقطہ نظر یا طریقہ کار کو بدل دیتی ہیں

#### مائنر ورژن (X.Y.0)
- نئی خصوصیات یا مواد کے اضافے
- ایسی بہتریاں جو پچھلے ورژنز کے ساتھ مطابقت رکھتی ہوں
- اضافی مثالیں، ٹولز، یا وسائل

#### پیچ ورژن (X.Y.Z)
- بگ فکسز اور اصلاحات
- موجودہ مواد میں معمولی بہتریاں
- وضاحتیں اور چھوٹی بہتریاں

## کمیونٹی کی رائے اور تجاویز

ہم اس تعلیمی وسائل کو بہتر بنانے کے لیے کمیونٹی کی رائے کی بھرپور حوصلہ افزائی کرتے ہیں:

### فیڈبیک کیسے دیں
- **GitHub Issues**: مسائل رپورٹ کریں یا بہتری کی تجاویز دیں (خصوصی طور پر AI کے مسائل کا خیرمقدم ہے)
- **Discord Discussions**: خیالات کا تبادلہ کریں اور Microsoft Foundry کمیونٹی کے ساتھ مشغول ہوں
- **Pull Requests**: مواد میں براہِ راست بہتریاں شامل کریں، خاص طور پر AI ٹیمپلیٹس اور گائیڈز
- **Microsoft Foundry Discord**: #Azure چینل میں AZD + AI مباحثوں میں حصہ لیں
- **Community Forums**: وسیع Azure ڈویلپر مباحثوں میں حصہ لیں

### فیڈبیک کے زمروں
- **AI مواد کی درستگی**: AI سروس انضمام اور تعیناتی کی معلومات میں اصلاحات
- **تعلیمی تجربہ**: AI ڈویلپر کے سیکھنے کے عمل کو بہتر بنانے کی تجاویز
- **غیر موجود AI مواد**: اضافی AI ٹیمپلیٹس، پیٹرنز، یا مثالوں کی درخواستیں
- **دستیابی**: مختلف تعلیمی ضروریات کے لیے بہتریاں
- **AI ٹول انضمام**: AI ڈیولپمنٹ کے ورک فلو میں بہتر انضمام کی تجاویز
- **پروڈکشن AI پیٹرنز**: ادارہ جاتی AI تعیناتی کے پیٹرنز کی درخواستیں

### جواب دہی کی ذمہ داری
- **مسئلہ کا جواب**: رپورٹ شدہ مسائل کے لیے 48 گھنٹوں کے اندر
- **خصوصیات کی درخواستیں**: ایک ہفتے کے اندر جائزہ
- **کمیونٹی کے تعاون**: ایک ہفتے کے اندر جائزہ
- **سیکیورٹی مسائل**: فوری ترجیح اور فوری جواب

## دیکھ بھال کا شیڈیول

### باقاعدہ اپ ڈیٹس
- **ماہانہ جائزے**: مواد کی درستگی اور لنک کی توثیق
- **ربع سالانہ اپ ڈیٹس**: بڑے مواد کے اضافے اور بہتریاں
- **نصف سالانہ جائزے**: جامع دوبارہ ساخت اور اصلاحات
- **سالانہ ریلیزز**: میجر ورژن کی اپ ڈیٹس کے ساتھ اہم بہتریاں

### نگرانی اور معیار کی یقین دہانی
- **خودکار ٹیسٹنگ**: کوڈ مثالوں اور لنکس کی باقاعدہ تصدیق
- **کمیونٹی کی رائے کا انضمام**: صارف کی تجاویز کی باقاعدہ شمولیت
- **ٹیکنالوجی کی تازہ کاری**: تازہ ترین Azure خدمات اور azd ریلیز کے ساتھ ہم آہنگی
- **دستیابی کے آڈٹ**: جامع ڈیزائن کے اصولوں کا باقاعدہ جائزہ

## ورژن سپورٹ پالیسی

### موجودہ ورژن کی حمایت
- **تازہ ترین میجر ورژن**: مکمل حمایت کے ساتھ باقاعدہ اپ ڈیٹس
- **پچھلا میجر ورژن**: 12 ماہ کے لیے سیکیورٹی اپ ڈیٹس اور اہم اصلاحات
- **پرانی ورژنز**: صرف کمیونٹی کی حمایت، کوئی سرکاری اپ ڈیٹس نہیں

### مائیگریشن کے رہنما اصول
جب میجر ورژنز ریلیز ہوتے ہیں، ہم فراہم کرتے ہیں:
- **مائیگریشن گائیڈز**: مرحلہ وار منتقلی کی ہدایات
- **مطابقت کے نوٹس**: توڑنے والی تبدیلیوں کی تفصیلات
- **ٹول سپورٹ**: مائیگریشن میں مدد کے لیے اسکرپٹس یا یوٹیلٹیز
- **کمیونٹی سپورٹ**: مائیگریشن سوالات کے لیے وقف فورمز

---

**نیویگیشن**
- **پچھلا سبق**: [مطالعہ رہنما](resources/study-guide.md)
- **اگلا سبق**: واپس جائیں [مین README](README.md)

**اپ ٹو ڈیٹ رہیں**: اس ریپوزیٹری کو واچ کریں تاکہ نئی ریلیزز اور تعلیمی مواد کی اہم اپ ڈیٹس کی اطلاعات ملتی رہیں۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->