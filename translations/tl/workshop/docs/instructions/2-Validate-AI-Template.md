# 2. I-validate ang isang Template

> Na-validate laban sa `azd 1.27.1` noong Hulyo 2026.

!!! tip "SA PAGWAWAKAS NG MODULONG ITO, MAGAGAWA MO NA NG"

    - [ ] Suriin ang AI Solution Architecture
    - [ ] Unawain ang AZD Deployment Workflow
    - [ ] Gamitin ang GitHub Copilot upang makatulong sa paggamit ng AZD
    - [ ] **Lab 2:** I-deploy at I-validate ang AI Agents template

---


## 1. Panimula

Ang [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) o `azd` ay isang open-source na commandline tool na nagpapadali sa workflow ng developer sa pagbuo at pag-deploy ng mga aplikasyon sa Azure.

Ang [AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ay mga standardized na repositoryo na naglalaman ng sample application code, mga _infrastructure-as-code_ na assets, at mga `azd` configuration files para sa isang magkakaugnay na solution architecture. Ang pag-provision ng imprastruktura ay kasing dali ng isang `azd provision` na utos - habang ang paggamit ng `azd up` ay nagpapahintulot sa iyo na  mag-provision ng imprastruktura **at** mag-deploy ng application nang sabay!

Bilang resulta, ang pagsisimula ng iyong proseso ng pag-develop ng aplikasyon ay maaaring maging kasing dali ng paghahanap ng tamang _AZD Starter template_ na pinakamalapit sa iyong pangangailangan sa aplikasyon at imprastruktura - pagkatapos ay i-customize ang repositoryo upang umangkop sa iyong mga pangangailangan.

Bago tayo magsimula, tiyakin muna natin na naka-install ang Azure Developer CLI.

1. Buksan ang terminal ng VS Code at i-type ang utos na ito:

      ```bash title="" linenums="0"
      azd version
      ```

1. Dapat kang makakita ng ganito!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Handa ka na ngayon na pumili at mag-deploy ng template gamit ang azd**

---

## 2. Pagpili ng Template

Ang Microsoft Foundry platform ay may kasamang [hanay ng mga inirerekomendang AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) na sumasaklaw sa mga sikat na senaryo ng solusyon tulad ng _multi-agent workflow automation_ at _multi-modal content processing_. Maaari mo ring tuklasin ang mga template na ito sa pamamagitan ng pagbisita sa Microsoft Foundry portal.

1. Bisitahin ang [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Mag-log in sa Microsoft Foundry portal kapag na-prompt - makikita mo ang ganito.

![Pick](../../../../../translated_images/tl/01-pick-template.60d2d5fff5ebc374.webp)


Ang mga **Basic** na opsyon ay iyong mga pang-simulang template:

1. [ ] [Magsimula sa AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) na nagde-deploy ng basic chat application _kasama ang iyong data_ sa Azure Container Apps. Gamitin ito upang tuklasin ang basic na senaryo ng AI chatbot.
1. [X] [Magsimula sa AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) na nagde-deploy din ng karaniwang AI Agent (kasama ang Foundry Agents). Gamitin ito upang maging pamilyar sa mga agentic AI solutions na may kasamang tools at models.

Bisitahin ang pangalawang link sa bagong browser tab (o i-click ang `Open in GitHub` para sa kaugnay na card). Dapat mong makita ang repositoryo para sa AZD Template na ito. Maglaan ng sandali upang tuklasin ang README. Ganito ang hitsura ng application architecture:

![Arch](../../../../../translated_images/tl/architecture.8cec470ec15c65c7.webp)

---

## 3. Pag-activate ng Template

Subukan nating i-deploy ang template na ito at tiyaking valid ito. Susundin natin ang mga gabay sa seksyong [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Pumili ng working environment para sa template repository:

      - **GitHub Codespaces**: I-click ang [link na ito](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) at kumpirmahin ang `Create codespace`
      - **Local clone o dev container**: I-clone ang `Azure-Samples/get-started-with-ai-agents` at buksan ito sa VS Code

1. Maghintay hanggang maging handa ang terminal ng VS Code, pagkatapos ay i-type ang sumusunod na utos:

   ```bash title="" linenums="0"
   azd up
   ```

Kumpletuhin ang mga hakbang sa workflow na ito ay magtitrigger:

1. Hihilingin kang mag-log in sa Azure - sundin ang mga tagubilin para sa pag-authenticate
1. Maglagay ng natatanging pangalan ng environment para sa iyo - hal., ginamit ko ang `nitya-mshack-azd`
1. Lilikha ito ng `.azure/` na folder - makikita mo ang subfolder na may pangalan ng environment
1. Hihilingin kang pumili ng pangalan ng subscription - piliin ang default
1. Hihilingin kang pumili ng lokasyon - gamitin ang `East US 2`

Ngayon, maghintay hanggang matapos ang provisioning. **Ito ay tumatagal ng 10-15 minuto**

1. Kapag tapos na, makikita mo sa console ang mensaheng SUCCESS na ganito:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Ngayon, mayroon nang provisioned resource group sa iyong Azure Portal na may pangalang iyon:

      ![Infra](../../../../../translated_images/tl/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Handa ka na ngayon upang i-validate ang na-deploy na infrastraktura at aplikasyon**.

---

## 4. Pag-validate ng Template

1. Bisitahin ang Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) page - mag-log in kapag na-prompt
1. I-click ang RG para sa pangalan ng inyong environment - makikita mo ang pahina sa itaas

      - i-click ang Azure Container Apps resource
      - i-click ang Application Url sa _Essentials_ na seksyon (kanang itaas)

1. Dapat kang makakita ng naka-host na application front-end UI na ganito:

   ![App](../../../../../translated_images/tl/03-test-application.471910da12c3038e.webp)

1. Subukang magtanong ng ilang [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Magsabi ng: ```Ano ang kabisera ng France?``` 
      1. Magsabi ng: ```Ano ang pinakamagandang tent sa ilalim ng $200 para sa dalawang tao, at anu-ano ang mga tampok nito?```

1. Dapat kang makakuha ng mga sagot na katulad ng ipinakita sa ibaba. _Pero paano ito gumagana?_

      ![App](../../../../../translated_images/tl/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Pag-validate ng Agent

Ang Azure Container App ay nagde-deploy ng endpoint na kumokonekta sa AI Agent na na-provision sa proyekto ng Microsoft Foundry para sa template na ito. Tingnan natin kung ano ang ibig sabihin nito.

1. Bumalik sa Azure Portal _Overview_ page para sa iyong resource group

1. I-click ang `Microsoft Foundry` resource sa listahan

1. Dapat mong makita ito. I-click ang `Go to Microsoft Foundry Portal` button. 
   ![Foundry](../../../../../translated_images/tl/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Makikita mo ang Foundry Project page para sa iyong AI application
   ![Project](../../../../../translated_images/tl/05-visit-foundry-portal.d734e98135892d7e.webp)

1. I-click ang `Agents` - makikita mo ang default Agent na na-provision sa iyong proyekto
   ![Agents](../../../../../translated_images/tl/06-visit-agents.bccb263f77b00a09.webp)

1. Piliin ito - at makikita mo ang mga detalye ng Agent. Pansinin ang mga sumusunod:

      - Ang agent ay laging gumagamit ng File Search bilang default
      - Ang agent `Knowledge` ay nagpapakita na mayroong 32 file na na-upload (para sa file search)
      ![Agents](../../../../../translated_images/tl/07-view-agent-details.0e049f37f61eae62.webp)

1. Hanapin ang opsyon na `Data+indexes` sa kaliwang menu at i-click para sa mga detalye. 

      - Makikita mo ang 32 data files na na-upload para sa knowledge.
      - Ito ay tumutugma sa 12 customer files at 20 product files sa ilalim ng `src/files` 
      ![Data](../../../../../translated_images/tl/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Na-validate mo ang operasyon ng Agent!**

1. Ang mga sagot ng agent ay naka-base sa knowledge ng mga files na iyon. 
1. Maaari ka nang magtanong ng mga katanungan na may kaugnayan sa data na iyon, at makakuha ng mga grounded na sagot.
1. Halimbawa: ang `customer_info_10.json` ay naglalarawan ng 3 bumili ni "Amanda Perez"

Bumalik sa browser tab na may endpoint ng Container App at itanong: `Anu-ano ang mga produkto na pag-aari ni Amanda Perez?`. Dapat kang makakita ng ganito:

![Data](../../../../../translated_images/tl/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Palalalimin natin ang intuwisyon para sa mga kakayahan ng Microsoft Foundry, sa pamamagitan ng pagsubok sa Agent sa Agents Playground.

1. Bumalik sa `Agents` page sa Microsoft Foundry - piliin ang default agent
1. I-click ang `Try in Playground` option - makikita mo ang Playground UI na ganito
1. Itanong ang parehong tanong: `Anu-ano ang mga produkto na pag-aari ni Amanda Perez?`

    ![Data](../../../../../translated_images/tl/09-ask-in-playground.a1b93794f78fa676.webp)

Makukuha mo ang parehong (o katulad) na sagot - ngunit makikita mo rin ang karagdagang impormasyon na makakatulong upang maunawaan ang kalidad, gastos, at performance ng iyong agentic app. Halimbawa:

1. Pansinin na ang sagot ay naglalaman ng data files na ginamit upang "i-ground" ang sagot
1. I-hover ang cursor sa alinman sa mga label ng file na ito - tumutugma ba ang data sa iyong query at ipinakitang sagot?

Makikita mo rin ang isang _stats_ na hilera sa ilalim ng sagot.

1. I-hover ang cursor sa anumang metric - hal., Safety. Makikita mo ang ganito
1. Tugma ba ang nasabing rating sa iyong intuwisyon para sa antas ng kaligtasan ng sagot?

      ![Data](../../../../../translated_images/tl/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Ang observability ay tungkol sa pag-instrument ng iyong aplikasyon upang lumikha ng data na maaaring gamitin upang maunawaan, i-debug, at i-optimize ang mga operasyon nito. Para magkaroon ng ideya:

1. I-click ang `View Run Info` button - makikita mo ang ganitong view. Ito ay halimbawa ng [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) na ginagamit. _Makukuha mo rin ang view na ito sa pamamagitan ng pag-click ng Thread Logs sa top-level menu_.

   - Magkaroon ng pang-unawa sa mga hakbang at tools na ginagamit ng agent
   - Unawain ang kabuuang bilang ng Tokens (kumpara sa output tokens usage) para sa sagot
   - Unawain ang latency at saan ginugugol ang oras sa pagpapatupad

      ![Agent](../../../../../translated_images/tl/10-view-run-info.b20ebd75fef6a1cc.webp)

1. I-click ang `Metadata` tab upang makita ang karagdagang attributes para sa run, na maaaring magbigay ng kapaki-pakinabang na konteksto para sa pag-debug sa hinaharap.   

      ![Agent](../../../../../translated_images/tl/11-view-run-info-metadata.7966986122c7c2df.webp)


1. I-click ang `Evaluations` tab upang makita ang auto-assessments na ginawa sa sagot ng agent. Kasama dito ang safety evaluations (hal., Self-harm) at mga agent-specific evaluations (hal., Intent resolution, Task adherence).

      ![Agent](../../../../../translated_images/tl/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. At panghuli, i-click ang `Monitoring` tab sa sidebar menu.

      - Piliin ang `Resource usage` tab sa ipinakitang pahina - at tingnan ang mga metrics.
      - Subaybayan ang paggamit ng aplikasyon ayon sa gastos (tokens) at load (requests).
      - Subaybayan ang latency ng aplikasyon mula sa first byte (input processing) hanggang last byte (output).

      ![Agent](../../../../../translated_images/tl/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Mga Environment Variables

Hanggang ngayon, dumaan tayo sa deployment sa browser - at na-validate na ang ating infrastraktura ay na-provision at ang aplikasyon ay gumagana. Pero para magtrabaho gamit ang aplikasyon nang _code-first_, kailangan nating i-configure ang ating lokal na development environment gamit ang mga kaugnay na variables na kailangan para gamitin ang mga resources na ito. Ginagawang madali ito ng `azd`.

1. Ang Azure Developer CLI [gumagamit ng environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) para mag-imbak at mag-manage ng configuration settings para sa application deployments.

1. Ang mga environment variables ay naka-imbak sa `.azure/<env-name>/.env` - ito ay para lamang sa environment na `env-name` na ginamit sa deployment at tumutulong sa iyo upang mai-separate ang mga environments sa pagitan ng iba't ibang deployment targets sa parehong repo.

1. Ang mga environment variables ay awtomatikong niloload ng `azd` command tuwing mag-eexecute ito ng isang partikular na command (hal., `azd up`). Tandaan na ang `azd` ay hindi awtomatikong binabasa ang _OS-level_ environment variables (hal., na-set sa shell) - imbes, gamitin ang `azd set env` at `azd get env` para ilipat ang impormasyon sa loob ng mga script.


Subukan natin ang ilang utos:

1. Kuhanin lahat ng environment variables na naka-set para sa `azd` sa environment na ito:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Makakakita ka ng ganito:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Kuhanin ang isang partikular na halaga - hal., gusto kong malaman kung na-set ba ang `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Makikita mo ang ganito - hindi ito na-set bilang default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Mag-set ng bagong environment variable para sa `azd`. Dito, ina-update natin ang pangalan ng agent model. _Tandaan: ang anumang pagbabagong ginawa ay agad na makikita sa `.azure/<env-name>/.env` file.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Ngayon, dapat makita natin na na-set na ang value:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Tandaan na ang ilang mga resources ay persistent (hal., model deployments) at mangangailangan ng higit pa sa `azd up` para pilitin ang muling pag-deploy. Subukan nating i-tear down ang orihinal na deployment at muling i-deploy gamit ang binagong environment variables.

1. **I-refresh** Kung dati ka nang nag-deploy ng infrastructure gamit ang isang azd template - maaari mong i-_refresh_ ang estado ng iyong lokal na environment variables batay sa kasalukuyang estado ng iyong Azure deployment gamit ang utos na ito:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Isang makapangyarihang paraan ito upang _i-sync_ ang mga environment variable sa dalawa o higit pang lokal na mga development environment (hal., koponan na may maraming developer) - na nagpapahintulot sa na-deploy na imprastraktura na magsilbing ground truth para sa estado ng env variable. Kinakailangang _i-refresh_ lang ng mga miyembro ng koponan ang mga variable upang maitama ang pagkaka-sync.

---

## 9. Congratulations 🏆

Kakakatapos mo lang ng isang end-to-end na workflow kung saan:

- [X] Pinili ang AZD Template na Gusto Mong Gamitin
- [X] Binuksan ang template sa isang suportadong development environment
- [X] Na-deploy ang Template at napatunayan na gumagana ito

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->