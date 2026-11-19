# ۵. سفارشی‌سازی یک قالب

!!! tip "در پایان این ماژول قادر خواهید بود"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## ۵.۱ ایجاد یک خط‌مبنا

از مخزن [شروع با عامل‌های هوش مصنوعی](https://github.com/Azure-Samples/get-started-with-ai-agents) که در ماژول‌های قبلی مقداردهی اولیه شده است استفاده کنید. قبل از ایجاد هر گونه تغییر، نسخه قالب، نسخه AZD، محیط انتخاب‌شده، استقرار مدل و پرسش‌های نمونه کاری را ثبت کنید.

نمونه یک برنامه چت پشتیبانی شده توسط عامل را پیاده‌سازی می‌کند. **تنها با تنظیم متغیرهای محیطی یا ذخیره فایل‌های دستورالعمل اضافی، به یک سیستم خرده‌فروشی دو عامله تبدیل نمی‌شود.** عوامل اضافی، مدیریت ابزار، مسیر‌دهی، مجوزها و دسترسی به داده‌ها نیازمند کد برنامه هستند.

دستورالعمل‌ها و ابزارهای عامل مستقر شده فعلی را در Foundry بررسی کنید. یک سوال واقعی، یک سوال بازیابی و یک سوال که داده‌های نمونه نمی‌توانند به آن پاسخ دهند، آزمایش کنید. ارجاعات را با مدارک منبع واقعی تطبیق دهید و فرض نکنید پاسخ روان صحیح است.

## ۵.۲ سفارشی‌سازی بازیابی دانش

قالب از بازیابی مبتنی بر فایل و ادغام اختیاری Azure AI Search پشتیبانی می‌کند. برای ایندکس کردن و پیکربندی ابزار، راهنمای [Azure AI Search جاری](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) را دنبال کنید.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

فعال‌کردن سرویس تنها بخشی از بازیابی است. قبل از بارگذاری داده‌های خود:

۱. مطمئن شوید اجازه استفاده از اسناد را دارید و اطلاعات حساس را حذف کنید.
۲. یک مدل جاسازی پشتیبانی شده در منطقه خود انتخاب کرده و نسخه، نوع استقرار و ابعاد برداری سازگار آن را تنظیم کنید.
۳. ایندکس را با استفاده از روند مستند نمونه ایجاد/تکمیل کنید.
۴. ابزار بازیابی عامل را پیکربندی کنید تا از آن ایندکس استفاده کند.
۵. بازیابی، ارجاعات، مجوزها و رفتار در صورت عدم وجود سند مرتبط را آزمایش کنید.

بدون بررسی ابعاد و بازسازی/بازاندیس‌گذاری بردارها، از مدل جاسازی `text-embedding-3-small` به مدل دیگری تغییر ندهید. نامی مانند `retail-products` یک کاتالوگ پیاده‌سازی شده یا سیاست کنترل دسترسی نیست.

## ۵.۳ ردیابی و نظارت

راهنمای [قابلیت مشاهده نمونه](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring) را دنبال کنید. اطمینان حاصل کنید منبع و اتصال Application Insights مورد نیاز قبلاً وجود دارند؛ اگر تنظیمات زیرساخت را تغییر می‌دهید، از `azd up` استفاده کنید.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

یک درخواست آزمایشی ارسال کرده، سپس لاگ‌های برنامه Container App و نمای ردیابی عامل در Foundry را بررسی کنید. تأخیر، فراخوانی ابزارها، خطاها و همبستگی بین درخواست و ردگیری را چک کنید. فرض نکنید تلمتری فقط به‌خاطر موفقیت استقرار متصل است.

مگر اینکه صراحتاً رضایت، حذف، نگهداری و کنترل‌های دسترسی را بررسی کرده باشید، `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` را غیرفعال نگه دارید. ردگیری‌ها ممکن است شامل آرگومان‌های حساس ابزار یا محتوای اسناد باشند حتی زمانی که لاگ‌های معمولی برنامه بی‌ضرر به نظر می‌رسند.

## ۵.۴ ارزیابی عامل

نقطه ورود ارزیابی نمونه اکنون [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py) است، نه دایرکتوری `evals/`. از ریشه نمونه، از محیط پایتونی که الزامات مستند آن را دارد استفاده کنید:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

قبل از اجرا، [پیش‌نیازهای ارزیابی](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md) را کامل کنید. تست‌ها پیکربندی را از `.azure/<environment>/.env` انتخاب‌شده بارگذاری می‌کنند؛ اطمینان حاصل کنید محیط مورد نظر انتخاب شده است. ورودی‌های مهم شامل:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`، با فرمت مورد نیاز نمونه جاری (نسخه بازبینی شده از `agent_name:agent_version` استفاده می‌کند)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`، به عنوان استقرار مدل قاضی

تست‌ها را بررسی کنید تا انتخاب ارزیاب، آستانه‌ها، نقش‌های مورد نیاز و هزینه‌های مدل را بفهمید. اجرای کامل به‌طور خودکار کیفیت را تضمین نمی‌کند؛ امتیازها، موارد ناموفق/خطادار و نتایج لینک شده Foundry را بررسی کنید.

### افزودنی ارزیابی جداگانه AZD

تست پایتون بالا یک **گردش کار مربوط به نمونه** است. افزودنی اختیاری `azure.ai.evaluations` گردش کاری متفاوتی با پیکربندی `evals/azure.eval.yaml` خود دارد. این افزونه به صورت جداگانه نصب می‌شود و در مجموعه عمومی `microsoft.foundry` 1.0 گنجانده نشده است:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

برای تنظیم کامل افزودنی، راهنمای [گردش‌های کاری ارزیابی و مهاجرت](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md) را ببینید. از زمان افزودنی عوامل نسخه بتا ۲۲، از دستورات حذف شده `azd ai agent eval` استفاده نکنید. نصب افزودنی ارزیابی، تست‌های پایتون نمونه را تبدیل نمی‌کند یا به‌طور خودکار پیکربندی ارزیابی ایجاد نمی‌کند.

برای یک **تمرین عامل میزبانی GA جداگانه**، از یک پوشه خالی خارج از نمونه این کارگاه استفاده کرده و راهنمای [Foundry محلی به ابری](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) را دنبال کنید. این از AZD 1.37.0+، بسته `microsoft.foundry`، پایتون 3.13+ و uv جاری استفاده می‌کند. شما `azure.yaml` را بررسی خواهید کرد، به‌صورت محلی با Agent Inspector آزمایش می‌کنید، منبع را برای ساخت ابری از راه دور مستقر می‌کنید و پیش از پیکربندی `azd ai eval init --name quality` مجموعه داده و روبریک تولید/بررسی می‌کنید. تست‌های این نمونه را جایگزین نکنید و فرض نکنید نصب بسته مدل میزبانی آن را تغییر می‌دهد.

## ۵.۵ آزمایش تیم قرمز هوش مصنوعی و ارزیابی مستمر

نمونه جاری [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py) را فراهم می‌کند. پیش‌نیازهای آن را کامل کرده و هدف مورد نظر و هزینه‌ها را قبل از اجرا بررسی کنید:

```bash
pytest tests/test_red_teaming.py -s
```

از استقرار تست مجاز و داده‌های ساختگی استفاده کنید. حملات و نتایج تولید شده را بازبینی کنید؛ این اسکن امنیت یا انطباق برنامه را تضمین نمی‌کند.

راهنمای [قابلیت مشاهده](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) همچنین ارزیابی مستمر در زمان راه‌اندازی کانتینر را توضیح می‌دهد. این ارزیابی تعاملات واقعی کاربران را بررسی می‌کند، نه ترافیک تست ساخته شده، و پشتیبانی ارزیاب بر اساس منطقه متفاوت است. اگر تعاملی نباشد، ورودی ارزیابی نیز وجود ندارد. نسخه نمونه نصب شده و پیکربندی ارزیاب را تأیید کنید و فرض نکنید همه استقرارها پیش‌فرض مشابه دارند.

احراز هویت از ارزیابی جداست. تنظیمات شناسه/دسترسی مستند شده نمونه را دنبال کنید. «بازگشت به احراز هویت پایه» مستندسازی نشده و برای حفاظت از یک نقطه پایانی عمومی قابل اعتماد نیست.

## ۵.۶ تمرین طراحی: سفارشی‌سازی خرده‌فروشی

!!! warning "تمرین طراحی، نه استقرار کامل"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

یک برنامه کوتاه به شرح زیر بنویسید:

| حوزه | تصمیم و شواهد مورد جمع‌آوری |
|------|----------------------------------|
| مسئولیت‌های عامل | شروع با یک عامل، یا توجیه عاملان جداگانه Shopper و Loyalty و منطق مسیر‌دهی |
| داده‌ها | تعریف یک مجموعه داده کاتالوگ/جوایز ساختگی و مالکیت بروزرسانی‌ها |
| ابزارها | ابتدا مدیریت‌کننده‌های فقط خواندنی را پیاده‌سازی کنید؛ مجوزها و اعتبارسنجی را برای هر نوشتن مشخص کنید |
| مدل‌ها | ترکیب‌های موجود مدل/نسخه/SKU را انتخاب کرده و سهمیه را تأیید کنید؛ از فراهم‌کردن مدل‌های استفاده‌نشده خودداری کنید |
| بازیابی | تعریف ایندکسینگ، ابعاد جاسازی، ارجاعات و کنترل‌های دسترسی در سطح سند |
| ارزیابی | اضافه کردن موارد پاسخ مورد انتظار، سوالات پشتیبانی نشده، استفاده از ابزار و ایمنی با آستانه‌های صریح |
| عملیات | تعریف تلمتری، تأخیر/بودجه خطا، محدودیت هزینه و مالکیت پاکسازی |

ذخیره `custom-agents/shopper-agent-instructions.md` باعث بارگذاری آن توسط نمونه نمی‌شود. کد برنامه‌ای که عامل را ایجاد/به‌روزرسانی می‌کند پیدا کنید، دستورالعمل‌های بازبینی شما را به آن متصل کنید و نسخه عامل حاصل را قبل از آزمایش تأیید کنید. دستورالعمل‌ها نمی‌توانند دسترسی به داده‌ها یا ابزارهایی که پیاده‌سازی نکرده‌اید را اعطا کنند.

هر بار فقط یک تغییر اعمال کنید، مؤلفه‌های تحت تأثیر را دوباره مستقر کرده و سوالات خط‌مبنای خود و ارزیابی‌ها را دوباره اجرا کنید. یک نسخه کاری برای مقایسه نگه دارید. برای الهام از معماری، به [نقشه راه خرده‌فروشی](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md) مراجعه کنید، که آن نیز برنامه کامل خرده‌فروشی نیست.

!!! quote "در پایان این آزمایشگاه باید داشته باشید"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

ادامه به [برچیدن زیرساخت‌ها](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->