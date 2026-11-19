# 5. ប្តូរតម្លាស់ម៉ូដែលមួយ

!!! tip "នៅចុងបញ្ចប់នៃមូឌុលនេះ អ្នកនឹងអាច"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 បង្កើតមូលដ្ឋានមួយ

ប្រើឃ្លាំង [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) ដែលបានចាប់ផ្តើមពីមូឌុលមុន។ កត់ត្រាកំណែម៉ូដែល, កំណែ AZD, ពហុបរិយាកាសដែលបានជ្រើស, ការតម្លើងម៉ូឌែល, និងសំណួរគំរូមុនការផ្លាស់ប្តូរអ្វីៗ។

គំរូនេះអនុវត្តកម្មវិធីចាត់ជាភ្នាក់ងារ។ វាមិនក្លាយជាប្រព័ន្ធលក់រាយពីរភ្នាក់ងារដោយគ្រាន់តែកំណត់អថេរបរិយាកាសឬរក្សាទុកឯកសារណែនាំបន្ថែមនោះទេ។ ភ្នាក់ងារ, កម្មវិធីគ្រប់គ្រងឧបករណ៍, ការបញ្ជូន, អនុញ្ញាត និងការចូលប្រើទិន្នន័យបន្ថែមតម្រូវឲ្យមានកូដកម្មវិធី។

ពិនិត្យនូវការណែនាំ និងឧបករណ៍របស់ភ្នាក់ងារដែលបានដាក់ឲ្យប្រើនៅ Foundry។ សាកល្បងសំណួរពិតមួយ, សំណួរស្វែងរកមួយ, និងសំណួរមួយដែលទិន្នន័យគំរូមិនអាចឆ្លើយបាន។ ផ្ទៀងផ្ទាត់ឯកសារបញ្ជាក់ខ្នាតត្រូវនឹងឯកសារប្រភពពិត បោះបង់កំណត់អនុស្សាវរីយ៍ឆ្លើយតបទាក់ទង។

## 5.2 ប្តូរផ្លូវការស្វែងរកចំណេះដឹង

ម៉ូដែលគំរូគាំទ្រការស្វែងរកដោយផ្អែកលើឯកសារ និងការបញ្ចូលជាជម្រើសរបស់ Azure AI Search។ អនុវត្តតាម [មគ្គុទ្ទេសក៍ AI Search បច្ចុប្បន្ន](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) សម្រាប់ការបញ្ជូន និងការកំណត់ឧបករណ៍។

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

ការបើកបរោយសេវាកម្មគឺជាផ្លូវមួយតែប៉ុណ្ណោះនៃការស្វែងរក។ មុននឹងផ្ទុកទិន្នន័យផ្ទាល់ខ្លួន៖

1. បញ្ជាក់ថាអ្នកមានសិទ្ធិប្រើឯកសារ និងលុបចេញព័ត៌មានងាយរងគ្រោះ។
2. ជ្រើសម៉ូដែលណែនាំដែលគាំទ្រនៅតំបន់របស់អ្នក និងកំណត់កំណែសមស្រប ប្រភេទតម្លើង និងវិមាត្រវិចទ័រ។
3. បង្កើត/បំពេញសន្ទស្សន៍ដោយប្រើដំណើរការដែលបានរៀបរាប់ក្នុងគំរូ។
4. កំណត់ឧបករណ៍ស្វែងរករបស់ភ្នាក់ងារដើម្បីប្រើសន្ទស្សន៍នោះ។
5. សាកល្បងការស្វែងរក, ការបញ្ជាក់, អនុញ្ញាត, និងអាកប្បកិរិយា​នៅពេលគ្មានឯកសារដែលពាក់ព័ន្ធ។

កុំប្តូរ​ពី `text-embedding-3-small` ទៅម៉ូដែលណែនាំផ្សេងទៀតដោយមិនពិនិត្យវិមាត្រ និងសាងសង់ឡើងវិញ/រៀបចំវិចទ័រ៕ឈ្មោះដូចជា `retail-products` មិនមែនជាបញ្ជីឯកសារដែលអនុវត្តបាន ឬគោលនយោបាយគ្រប់គ្រងការចូលប្រើទេ។

## 5.3 ការតាមដាន និងត្រួតពិនិត្យ

អនុវត្តតាម [មគ្គុទ្ទេសក៍មើលឃើញគំរូ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring)។ ប្រាកដថាមានធនធាននិងការតភ្ជាប់ Application Insights ដែលត្រូវការ; ប្រសិនបើផ្លាស់ប្តូរកំណត់ហេដ្ឋារចនាសម្ព័ន្ធ ប្រើ `azd up`។

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

បញ្ជូនសំណើសាកល្បង បន្ទាប់មកពិនិត្យកំណត់ត្រាកម្មវិធី Container App និងការមើលតាមដានភ្នាក់ងារ​នៅក្នុង Foundry។ ពិនិត្យពេលយឺត ការហៅឧបករណ៍ កំហុស និងការតភ្ជាប់ចន្លោះសំណើនិងរបាយការណ៍។ កុំសន្មត់ថាត្រួតពិនិត្យត្រូវបានភ្ជាប់តែក្រោមសោភ័ណភាពការតម្លើងបានជោគជ័យ។

បិទ `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` លើកលែងតែលោកអ្នកបានពិនិត្យការយល់ព្រម បំបែក រក្សាទុក និងគ្រប់គ្រងការចូលប្រើយ៉ាងច្បាស់។ របាយការណ៍អាចមានអាគ្គីកម្មឧបករណ៍ ឬអត្ថបទឯកសារបានបង្ហាញ ដូចជាការដាក់កំណត់កម្មវិធីធម្មតាថាអរគុណ។

## 5.4 ការវាយតម្លៃភ្នាក់ងារ

ចំណុចចូលវាយតម្លៃគំរូឥឡូវនេះគឺ [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py) មិនមែនថត `evals/` ទេ។ ពីគំរូមូលដ្ឋាន ប្រើបរិយាកាស Python ដែលបំពេញតម្រូវការដែលបានរៀបរាប់៖

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

មុនរត់ សូមបញ្ចប់ [លក្ខខណ្ឌវាយតម្លៃ](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md)។ ការតេស្តភ្ជាប់ការកំណត់ពី `.azure/<environment>/.env` ដែលបានជ្រើសរើស។ ប្រាកដថាបរិយាកាសដែលចង់បានត្រូវបានជ្រើសរើស។ បញ្ចូល​សំខាន់រួមមាន៖

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID` ប្រើទ្រង់ទ្រាយដែលត្រូវការដោយគំរូបច្ចុប្បន្ន (កំណែបានពិនិត្យប្រើ `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME` ប្រើជាតម្លើងម៉ូដែលតុលាការ

ពិនិត្យតេស្តដើម្បីយល់ពីជម្រើសវាយតម្លៃ កម្រិត តួនាទីចាំបាច់ និងថ្លៃម៉ូដែល។ ការរត់បញ្ចប់មិនមែនជាប្រភេទច្រកគុណភាពជាប់ជ័យជំនះដាច់ដោយឡែកទេ; ពិនិត្យពិន្ទុ ករណីបរាជ័យ/កំហុស និងលទ្ធផល Foundry ដែលភ្ជាប់។

### ការបន្ថែមវាយតម្លៃ AZD ផ្សេងទៀត

ការតេស្ត Python ខាងលើគឺជា **ដំណើរការងារបុព្វហេតុគំរូ**។ ការបន្ថែម `azure.ai.evaluations` ជាជម្រើស គឺជាបែបដំណើរការផ្សេង មានការកំណត់ `evals/azure.eval.yaml` ផ្ទាល់ខ្លួន។ វាត្រូវបានដំឡើងដោយឡែក មិនរួមបញ្ចូលក្នុងក្របខណ្ឌ `microsoft.foundry` 1.0 ដែលមានស្រាប់ទេ៖

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

សម្រាប់ការដំឡើងបន្ថែមពេញលេញ សូមមើល [ដំណើរការវាយតម្លៃ និងការផ្លាស់ប្តូរ](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md)។ តាំងពី agents extension beta.22 មក កុំប្រើបញ្ជា `azd ai agent eval` ដែលបានដកចេញ។ ការដំឡើងការបន្ថែមវាយតម្លៃមិនបំលែងតេស្ត Python គំរូ ឬបង្កើតការកំណត់វាយតម្លៃដោយស្វ័យប្រវត្តិទេ។

សម្រាប់ **លំហាត់ភ្នាក់ងារគាំទ្រ GA ផ្សេងទៀត**, ប្រើថតទទេនៅក្រៅគំរូ នៃ ប្រតិបត្តិការនេះ ហើយអនុវត្តតាម [មគ្គុទ្ទេសក៍ Foundry ពីក្នុងមូលដ្ឋានទៅពពក](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga)។ វាប្រើ AZD 1.37.0+, ក្របខណ្ឌ `microsoft.foundry`, Python 3.13+, និង uv បច្ចុប្បន្ន។ អ្នកនឹងពិនិត្យ `azure.yaml`, សាកល្បងក្នុងតំបន់ជាមួយ Agent Inspector, តម្លើងប្រភពសម្រាប់សំណង់ Foundry ពីចម្ងាយ, និងបង្កើត/ពិនិត្យទិន្នន័យនិងកម្រិតមុនកំណត់ `azd ai eval init --name quality`។ កុំជំនួសតេស្តគំរូនេះ ឬសន្មត់ថាការដំឡើងក្របខណ្ឌផ្លាស់ប្តូររចនាម៉ូដែលផ្ទុករបស់វា។

## 5.5 ការវាយតម្លៃក្រុមក្រមសីលធម៌ AI និងការវាយតម្លៃបន្ត

ឧទាហរណ៍បច្ចុប្បន្នផ្ដល់ជូន [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py)។ បញ្ចប់លក្ខខណ្ឌមុនរបស់វា ហើយពិនិត្យអត្រាគោលដៅ និងចំណាយដែលគ្រោងទុកមុនពេលបើកដំណើរការ៖

```bash
pytest tests/test_red_teaming.py -s
```

ប្រើការតំឡើងតេស្តដែលមានអាជ្ញាបណ្ណ និងទិន្នន័យស្រីនធីទិក។ ពិនិត្យការវាយប្រហារ និងលទ្ធផលដែលបានបង្កើតឡើង; ការស្កេននេះមិនកំណត់ថាកម្មវិធីមានសុវត្ថិភាពឬគោរពបទបញ្ជាទេ។

មគ្គុទេសក៍ [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) ក៏ពិពណ៌នាអំពីការវាយតម្លៃអនុវត្តបន្តបន្ទាប់ដែលបានកំណត់នៅពេលចាប់ផ្តើម container។ វាវាយតម្លៃប្រតិបត្តិការអ្នកប្រើប្រាស់ជាក់ស្តែង មិនមែនលំហូរប្រឡងដែលបានបង្កើតឡើងទេ ហើយការគាំទ្រពីអ្នកវាយតម្លៃមានការផ្លាស់ប្តូរតាមតំបន់។ ប្រតិបត្តិការមិនមានមានន័យថាមិនមានការបញ្ចូលការវាយតម្លៃ។ សូមផ្ទៀងផ្ទាត់កំណែគំរូបានតំឡើង និងការកំណត់អ្នកវាយតម្លៃជំនួសការសន្មត់ឲ្យថាការចេញផ្សាយគឺមានលក្ខណៈដូចគ្នាទាំងអស់។

ការផ្ទៀងផ្ទាត់អត្តសញ្ញាណបំបែកខុសពីការវាយតម្លៃ។ អនុវត្តតាមការតំឡើងអត្តសញ្ញាណ/ការចូល ប្រើដែលបានរៀបរាប់ក្នុងគំរូ។ មិនមាន “basic auth fallback” ដែលបានរៀបរាប់សម្រាប់ការពារតំណរភ្ជាប់សាធារណៈឡើយ។

## 5.6 ការអនុវត្តរចនាសម្ព័ន្ធ៖ ការប្ដូរតាមលក្ខណៈរាយជាងទំនិញ

!!! warning "ការអនុវត្តរចនាសម្ព័ន្ធ មិនមែនជាការចេញផ្សាយសកម្មភាពបញ្ចប់"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

សរសេរផែនការយ៉ាងខ្លី ឆ្លើយតប:

| តំបន់ | ការសម្រេចចិត្ត និងភស្តុតាងត្រូវប្រមូល |
|------|----------------------------------|
| ភារកិច្ចភ្នាក់ងារ | ចាប់ផ្តើមជាមួយភ្នាក់ងារម្នាក់ ឬពន្យល់សមិទ្ធផលភ្នាក់ងារ Shopper និង Loyalty ជាបន្ទាន់ និងយុត្តិធម៌ផ្លូវដំណើរ |
| ទិន្នន័យ | កំណត់ទិន្នន័យ catalog/rewards សំរាប់បង្កើតនិងជាការជួសជុល | 
| ឧបករណ៍ | អនុវត្តអ្នកដំណើរការអានតែថែមមុន; កំណត់ការអនុញ្ញាត និងការត្រួតពិនិត្យសម្រាប់ការសរសេរណាមួយ |
| គំរូ | ជ្រើសយកកំណែ/ម៉ូដែល/SKU ដែលមានស្រាប់ និងផ្ទៀងផ្ទាត់ quota; មិនត្រូវផ្គត់ផ្គង់គំរូដែលមិនបានប្រើ |
| ការទាញយក | កំណត់ការវាយតម្លៃនិយមន័យ indexing, embedding dimensions, citations និងការគ្រប់គ្រងការចូលដំណើរការដល់ឯកសារ |
| ការវាយតម្លៃ | បន្ថែមករណីចម្លើយរំពឹង, សំណួរមិនគាំទ្រ, ការប្រើឧបករណ៍ និងករណីសុវត្ថិភាពជាមួយសន្ទស្សន៍ច្បាស់លាស់ |
| ប្រតិបត្តិការ | កំណត់ telemetry, latency/error budgets, ដែនកំណត់ចំណាយ និងម្ចាស់ការដែលក្រោយសម្អាត |

ការ រក្សាទុក `custom-agents/shopper-agent-instructions.md` មិនបណ្តាលអោយគំរូផ្ទុកវាទេ។ ស្វែងរកកូដកម្មវិធីដែលបង្កើត/ធ្វើបច្ចុប្បន្នភាពភ្នាក់ងារ តភ្ជាប់អនុក្រឹត្យដែលអ្នកបានពិនិត្យនៅទីនោះ ហើយផ្ទៀងផ្ទាត់កំណែភ្នាក់ងារដែលបានបង្កើតមុនពេលសាកល្បង។ ការណែនាំមិនអាចផ្តល់ការចូលដំណើរការចំពោះទិន្នន័យ ឬឧបករណ៍ដែលអ្នកមិនបានអនុវត្ត។

អនុវត្តការផ្លាស់ប្តូរតែមួយពេល តម្កល់ឡើងវិញរបស់ឧបករណ៍ដែលមានផលប៉ះពាល់ ហើយអនុវត្តសំណួរចាំបាច់ និងការវាយតម្លៃរបស់អ្នកម្តងទៀត។ រក្សាកំណែដែលដំណើរការបានសម្រាប់ការប្រៀបធៀប។ សម្រាប់លទ្ធផលច្នៃប្រឌិតរចនាសម្ព័ន្ធ សូមមើល [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md) ដែលក៏មិនមែនជា កម្មវិធីលក់រាយពេញលេញដែរ។

!!! quote "នៅចុងបញ្ចប់កម្មវិធីសិក្សានេះ អ្នកគួរតែមាន"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

បន្តទៅ [Teardown Infrastructure](6-Teardown-Infrastructure.md)។

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->