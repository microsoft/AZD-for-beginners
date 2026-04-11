# 2. I-validate ang Template

> Na-validate laban sa `azd 1.23.12` noong Marso 2026.

!!! tip "SA PAGTATAPOS NG MODULONG ITO MAGAGAWA MO"

    - [ ] Suriin ang Arkitektura ng Solusyon ng AI
    - [ ] Unawain ang AZD Deployment Workflow
    - [ ] Gamitin ang GitHub Copilot para makatulong sa paggamit ng AZD
    - [ ] **Lab 2:** I-deploy at I-validate ang AI Agents template

---


## 1. Panimula

Ang [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) o `azd` ay isang open-source na command-line tool na nagpapadali sa daloy ng trabaho ng developer kapag nagbuo at nag-deploy ng mga application sa Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ay mga standardized na repositoryo na naglalaman ng sample application code, _infrastructure-as-code_ assets, at mga `azd` configuration file para sa buong arkitektura ng solusyon. Ang pag-provision ng imprastruktura ay nagiging kasing-simple ng isang `azd provision` na utos - habang ang paggamit ng `azd up` ay nagpapahintulot sa iyo na i-provision ang imprastruktura **at** i-deploy ang iyong application nang sabay!

Bilang resulta, ang pagsisimula ng iyong proseso ng pag-develop ng application ay maaaring maging kasing-simple ng paghahanap ng tamang _AZD Starter template_ na pinakamalapit sa iyong mga pangangailangan sa application at imprastruktura - at pagkatapos ay i-customize ang repositoryo upang umangkop sa iyong mga kinakailangan sa scenario.

Bago tayo magsimula, siguraduhin na naka-install ang Azure Developer CLI.

1. Buksan ang terminal ng VS Code at i-type ang utos na ito:

      ```bash title="" linenums="0"
      azd version
      ```

1. Makakakita ka ng ganito!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Handa ka na ngayong pumili at mag-deploy ng template gamit ang azd**

---

## 2. Pagpili ng Template

Ang Microsoft Foundry platform ay may kasamang [hanay ng inirerekomendang AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) na sumasaklaw sa mga karaniwang senaryo ng solusyon tulad ng _pag-automate ng multi-agent workflow_ at _pagproseso ng multi-modal na nilalaman_. Maaari mo ring tuklasin ang mga template na ito sa pagbisita sa Microsoft Foundry portal.

1. Bisitahin [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Mag-log in sa Microsoft Foundry portal kapag na-prompt - makakakita ka ng ganito.

![Pumili](../../../../../translated_images/tl/01-pick-template.60d2d5fff5ebc374.webp)


Ang mga **Basic** na opsyon ay ang iyong mga starter template:

1. [ ] [Magsimula sa AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) na nag-de-deploy ng isang basic na chat application _na may iyong data_ sa Azure Container Apps. Gamitin ito para tuklasin ang isang basic na AI chatbot na senaryo.
1. [X] [Magsimula sa AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) na nag-de-deploy din ng isang standard AI Agent (kasama ang Foundry Agents). Gamitin ito para maging pamilyar sa agentic AI solutions na may kasamang tools at models.

Buksan ang pangalawang link sa isang bagong tab ng browser (o i-click ang `Open in GitHub` para sa kaugnay na card). Makikita mo ang repositoryo para sa AZD Template na ito. Maglaan ng sandali upang siyasatin ang README. Ganito ang hitsura ng arkitektura ng application:

![Arkitektura](../../../../../translated_images/tl/architecture.8cec470ec15c65c7.webp)

---

## 3. Pag-activate ng Template

Subukan nating i-deploy ang template na ito at tiyaking valid ito. Susundan natin ang mga gabay sa seksyong [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Pumili ng working environment para sa template repository:

      - **GitHub Codespaces**: I-click ang [link na ito](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) at i-confirm ang `Create codespace`
      - **Local clone or dev container**: I-clone ang `Azure-Samples/get-started-with-ai-agents` at buksan ito sa VS Code

1. Maghintay hanggang maging handa ang terminal ng VS Code, pagkatapos i-type ang sumusunod na utos:

   ```bash title="" linenums="0"
   azd up
   ```

Kumpletuhin ang mga hakbang ng workflow na i-trigger nito:

1. Hihilingin sa iyo na mag-log in sa Azure - sundin ang mga instruksyon para mag-authenticate
1. Ilagay ang isang natatanging pangalan ng environment para sa iyo - hal., ginamit ko ang `nitya-mshack-azd`
1. Lilikha ito ng folder na `.azure/` - makakakita ka ng subfolder na may pangalan ng env
1. Hihilingin sa iyo pumili ng pangalan ng subscription - piliin ang default
1. Hihilingin ang lokasyon - gamitin ang `East US 2`

Ngayon, maghintay para matapos ang provisioning. **Ito ay tumatagal ng 10-15 minuto**

1. Kapag tapos na, magpapakita ang console ng mensaheng SUCCESS tulad nito:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Ang iyong Azure Portal ay magkakaroon na ngayon ng provisioned resource group na may pangalang env na iyon:

      ![Imprastruktura](../../../../../translated_images/tl/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Handa ka na ngayong i-validate ang na-deploy na imprastruktura at application**.

---

## 4. Pag-validate ng Template

1. Bumisita sa Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) page - mag-log in kapag na-prompt
1. I-click ang RG para sa iyong pangalan ng environment - makikita mo ang pahina sa itaas

      - i-click ang Azure Container Apps resource
      - i-click ang Application Url sa _Essentials_ section (kanang itaas)

1. Makakakita ka ng naka-host na application front-end UI tulad nito:

   ![Aplikasyon](../../../../../translated_images/tl/03-test-application.471910da12c3038e.webp)

1. Subukang magtanong ng ilang [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Tanungin: ```What is the capital of France?``` 
      1. Tanungin: ```What's the best tent under $200 for two people, and what features does it include?```

1. Dapat kang makakuha ng mga sagot na katulad ng ipinapakita sa ibaba. _Ngunit paano ito gumagana?_ 

      ![Aplikasyon](../../../../../translated_images/tl/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Pag-validate ng Agent

Ang Azure Container App ay nag-de-deploy ng endpoint na kumokonekta sa AI Agent na na-provision sa Microsoft Foundry project para sa template na ito. Tingnan natin kung ano ang ibig sabihin nito.

1. Bumalik sa Azure Portal _Overview_ page para sa iyong resource group

1. I-click ang resource na `Microsoft Foundry` sa listahang iyon

1. Makikita mo ito. I-click ang button na `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/tl/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Makikita mo ang Foundry Project page para sa iyong AI application
   ![Proyekto](../../../../../translated_images/tl/05-visit-foundry-portal.d734e98135892d7e.webp)

1. I-click ang `Agents` - makikita mo ang default Agent na na-provision sa iyong proyekto
   ![Mga-Agent](../../../../../translated_images/tl/06-visit-agents.bccb263f77b00a09.webp)

1. Piliin ito - at makikita mo ang mga detalye ng Agent. Tandaan ang mga sumusunod:

      - Ang agent ay gumagamit ng File Search bilang default (palagi)
      - Ipinapakita ng `Knowledge` ng agent na mayroon itong 32 file na na-upload (para sa file search)
      ![Detalye ng Agent](../../../../../translated_images/tl/07-view-agent-details.0e049f37f61eae62.webp)

1. Hanapin ang `Data+indexes` option sa kaliwang menu at i-click para sa detalye. 

      - Makikita mo ang 32 data file na na-upload para sa knowledge.
      - Ito ay katumbas ng 12 customer files at 20 product files sa ilalim ng `src/files` 
      ![Data](../../../../../translated_images/tl/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Napatunayan mo ang operasyon ng Agent!** 

1. Ang mga tugon ng agent ay nakabatay sa kaalaman mula sa mga file na iyon. 
1. Maaari ka nang magtanong ng mga katanungan na may kaugnayan sa data na iyon, at makakuha ng mga tugon na may batayan.
1. Halimbawa: `customer_info_10.json` ay naglalarawan ng 3 pagbili na ginawa ni "Amanda Perez"

Bumalik sa tab ng browser na may Container App endpoint at itanong: `What products does Amanda Perez own?`. Makakakita ka ng ganito:

![Data](../../../../../translated_images/tl/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Magbuo tayo ng kaunting intuwisyon para sa mga kakayahan ng Microsoft Foundry, sa pamamagitan ng pagkuha ng Agent para subukan sa Agents Playground. 

1. Bumalik sa pahina ng `Agents` sa Microsoft Foundry - piliin ang default agent
1. I-click ang `Try in Playground` option - makakakuha ka ng Playground UI na ganito
1. Itanong ang parehong tanong: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/tl/09-ask-in-playground.a1b93794f78fa676.webp)

Makakakuha ka ng parehong (o katulad na) tugon - ngunit makakakuha ka rin ng karagdagang impormasyon na magagamit mo upang maunawaan ang kalidad, gastos, at performance ng iyong agentic app. Halimbawa:

1. Tandaan na ang tugon ay nagsisipi ng mga data file na ginamit upang "i-ground" ang tugon
1. I-hover ang cursor sa anumang label ng file na ito - nagmamatch ba ang data sa iyong query at ipinakitang tugon?

Makikita mo rin ang isang hilera ng _stats_ sa ilalim ng tugon. 

1. I-hover ang cursor sa anumang metric - hal., Safety. Makakakita ka ng ganito
1. Tumutugma ba ang na-assess na rating sa iyong intuwisyon para sa antas ng kaligtasan ng tugon?

      ![Data](../../../../../translated_images/tl/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Ang observability ay tungkol sa pag-iinstrument ng iyong application upang makabuo ng data na magagamit upang maunawaan, i-debug, at i-optimize ang operasyon nito. Para magkaroon ng ideya tungkol dito:

1. I-click ang `View Run Info` button - makikita mo ang view na ito. Ito ay isang halimbawa ng [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) sa aksyon. _Makukuha mo rin ang view na ito sa pag-click ng Thread Logs sa top-level menu_.

   - Makakuha ng ideya sa mga hakbang ng run at mga tool na ginamit ng agent
   - Unawain ang kabuuang bilang ng Token (kumpara sa paggamit ng output tokens) para sa tugon
   - Unawain ang latency at kung saan ginugugol ang oras sa pagpapatupad

      ![Agent](../../../../../translated_images/tl/10-view-run-info.b20ebd75fef6a1cc.webp)

1. I-click ang `Metadata` tab upang makita ang karagdagang mga attribute para sa run, na maaaring magbigay ng kapaki-pakinabang na konteksto para sa pag-debug ng mga isyu mamaya.   

      ![Agent](../../../../../translated_images/tl/11-view-run-info-metadata.7966986122c7c2df.webp)


1. I-click ang `Evaluations` tab upang makita ang mga auto-assessment na ginawa sa tugon ng agent. Kabilang dito ang mga pagsusuri sa kaligtasan (hal., Self-harm) at mga evaluation na partikular sa agent (hal., Intent resolution, Task adherence).

      ![Agent](../../../../../translated_images/tl/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Huli ngunit hindi pinakamababa, i-click ang `Monitoring` tab sa sidebar menu.

      - Piliin ang `Resource usage` tab sa ipinakitang pahina - at tingnan ang mga metrics.
      - Subaybayan ang paggamit ng application sa mga tuntunin ng gastos (tokens) at load (requests).
      - Subaybayan ang latency ng application mula sa unang byte (input processing) hanggang sa huling byte (output).

      ![Agent](../../../../../translated_images/tl/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Mga Environment Variables

Sa ngayon, tinahak na natin ang deployment sa browser - at na-validate na naka-provision ang ating imprastruktura at gumagana ang application. Ngunit para gumana sa application nang _code-first_, kailangan nating i-configure ang lokal na development environment natin gamit ang mga kaugnay na variable na kinakailangan para makatrabaho ang mga resource na ito. Pinapadali ito ng `azd`.

1. Ang Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) upang i-store at i-manage ang mga configuration setting para sa mga deployment ng application.

1. Ang mga environment variables ay naka-store sa `.azure/<env-name>/.env` - ini-scope nito ang mga ito sa `env-name` environment na ginamit sa deployment at tumutulong sa paghiwalay ng mga environment sa pagitan ng iba't ibang deployment targets sa parehong repo.

1. Awtomatikong niloload ng `azd` ang mga environment variables kapag nagpapatakbo ito ng isang partikular na utos (hal., `azd up`). Tandaan na ang `azd` ay hindi awtomatikong nagbabasa ng _OS-level_ environment variables (hal., naka-set sa shell) - sa halip gamitin ang `azd set env` at `azd get env` upang maglipat ng impormasyon sa loob ng mga script.


Subukan natin ang ilang utos:

1. Kunin ang lahat ng environment variables na na-set para sa `azd` sa environment na ito:

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

1. Kunin ang isang partikular na value - hal., gusto kong malaman kung na-set namin ang `AZURE_AI_AGENT_MODEL_NAME` na halaga

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Makakakita ka ng ganitong bagay - hindi ito na-set bilang default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Mag-set ng bagong environment variable para sa `azd`. Dito, ini-update namin ang agent model name. _Tandaan: ang anumang pagbabago ay agad na makikita sa `.azure/<env-name>/.env` file._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Ngayon, makikita natin na na-set ang halaga:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Tandaan na ang ilang resources ay persistent (hal., model deployments) at mangangailangan ng higit pa sa isang `azd up` upang pilitin ang redeployment. Subukan nating i-tear down ang orihinal na deployment at i-redeploy na may binagong env vars.

1. **Refresh** Kung nag-deploy ka na dati ng imprastruktura gamit ang isang azd template - maaari mong i-_refresh_ ang estado ng iyong lokal na environment variables batay sa kasalukuyang estado ng iyong Azure deployment gamit ang utos na ito:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Ito ay isang makapangyarihang paraan para _i-sync_ ang mga environment variable sa pagitan ng dalawa o higit pang lokal na development environment (hal., isang team na may maraming developer) - na nagpapahintulot sa na-deploy na imprastruktura na magsilbing pinagkakatiwalaang batayan para sa estado ng mga environment variable. Kailangan lang ng mga miyembro ng team na _i-refresh_ ang mga variable para muling maging naka-sync.

---

## 9. Binabati namin kayo 🏆

Katatapos mo lang ng isang end-to-end na workflow kung saan ginawa mo ang mga sumusunod:

- [X] Pinili ang AZD Template na Gusto Mong Gamitin
- [X] Binuksan ang template sa isang suportadong development environment
- [X] Na-deploy ang Template at pinatunayan na gumagana ito

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang mga hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->