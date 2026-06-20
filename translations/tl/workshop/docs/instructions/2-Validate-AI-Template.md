# 2. I-validate ang Template

> Napatunayan laban sa `azd 1.25.6` noong Hunyo 2026.

!!! tip "PAGKATAPOS NG MODULONG ITO MAAARI MONG"

    - [ ] Suriin ang arkitektura ng solusyon ng AI
    - [ ] Unawain ang workflow ng pag-deploy gamit ang AZD
    - [ ] Gamitin ang GitHub Copilot upang humingi ng tulong sa paggamit ng AZD
    - [ ] **Lab 2:** I-deploy at i-validate ang template ng AI Agents

---


## 1. Panimula

Ang [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) o `azd` ay isang open-source commandline tool na nagpapadali sa workflow ng developer kapag bumubuo at nagde-deploy ng mga aplikasyon sa Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ay mga standardized na repositoryo na naglalaman ng sample application code, mga asset ng _infrastructure-as-code_, at mga `azd` configuration file para sa isang magkakaugnay na solution architecture. Ang pag-provision ng imprastraktura ay nagiging kasing simple ng isang `azd provision` na command - habang ang paggamit ng `azd up` ay nagpapahintulot sa iyo na sabay na i-provision ang imprastraktura **at** i-deploy ang iyong aplikasyon nang sabay!

Bilang resulta, ang pag-simula ng iyong proseso ng pag-develop ng aplikasyon ay maaaring maging kasing simple ng paghahanap ng tamang _AZD Starter template_ na pinakamalapit sa iyong pangangailangan sa aplikasyon at imprastraktura - at pagkatapos i-customize ang repository ayon sa iyong scenario requirements.

Bago tayo magsimula, siguraduhin muna nating naka-install ang Azure Developer CLI.

1. Buksan ang terminal ng VS Code at i-type ang utos na ito:

      ```bash title="" linenums="0"
      azd version
      ```

1. Makakakita ka ng ganito!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Handa ka na ngayong pumili at mag-deploy ng template gamit ang azd**

---

## 2. Pagpili ng Template

Ang Microsoft Foundry platform ay may [mga inirerekomendang AZD template](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) na sumasaklaw sa mga popular na solution scenario tulad ng _multi-agent workflow atomation_ at _multi-modal content processing_. Maaari mo ring matuklasan ang mga template na ito sa pamamagitan ng pagbisita sa Microsoft Foundry portal.

1. Bisitahin ang [https://ai.azure.com/templates]
1. Mag-log in sa Microsoft Foundry portal kapag hinihingi - makakakita ka ng ganito.

![Pumili](../../../../../translated_images/tl/01-pick-template.60d2d5fff5ebc374.webp)


Ang mga **Basic** na opsyon ay iyong mga panimulang template:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) na nagde-deploy ng isang basic na chat application _na may iyong data_ sa Azure Container Apps. Gamitin ito upang tuklasin ang isang basic na AI chatbot na senaryo.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) na nagde-deploy din ng isang standard na AI Agent (kasama ang Foundry Agents). Gamitin ito upang maging pamilyar sa agentic AI solutions na gumagamit ng mga tool at modelo.

Buksan ang pangalawang link sa isang bagong browser tab (o i-click ang `Open in GitHub` para sa kaugnay na card). Makikita mo ang repository para sa AZD Template na ito. Maglaan ng sandali upang silipin ang README. Ganito ang hitsura ng architecture ng aplikasyon:

![Arkitektura](../../../../../translated_images/tl/architecture.8cec470ec15c65c7.webp)

---

## 3. Pag-activate ng Template

Subukan nating i-deploy ang template na ito at tiyaking ito ay valid. Susundin natin ang mga patnubay sa seksyong [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Pumili ng working environment para sa template repository:

      - **GitHub Codespaces**: Mag-click sa [link na ito](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) at kumpirmahin ang `Create codespace`
      - **Local clone or dev container**: I-clone ang `Azure-Samples/get-started-with-ai-agents` at buksan ito sa VS Code

1. Hintayin hanggang maging handa ang terminal ng VS Code, pagkatapos i-type ang sumusunod na utos:

   ```bash title="" linenums="0"
   azd up
   ```

Kumpletuhin ang mga workflow step na ito na ipapa-trigger:

1. Hihilingin sa iyo na mag-log in sa Azure - sundin ang mga tagubilin para mag-authenticate
1. Mag-enter ng natatanging pangalan ng environment para sa iyo - hal., ginamit ko ang `nitya-mshack-azd`
1. Lilikha ito ng `.azure/` na folder - makakakita ka ng isang subfolder na may pangalan ng env
1. Hihilingin sa iyo na pumili ng subscription name - piliin ang default
1. Hihilingin din sa iyo ng lokasyon - gamitin ang `East US 2`

Ngayon, maghihintay ka para matapos ang provisioning. **Aabutin ito ng 10-15 minuto**

1. Kapag tapos na, magpapakita ang iyong console ng isang SUCCESS message gaya ng ito:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Ngayon, magkakaroon na ang iyong Azure Portal ng isang provisioned resource group na may pangalang iyon ng env:

      ![Imprastraktura](../../../../../translated_images/tl/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Handa ka na ngayong i-validate ang na-deploy na imprastraktura at aplikasyon**.

---

## 4. Pag-validate ng Template

1. Bisitahin ang Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) page - mag-log in kapag hinihingi
1. I-click ang RG para sa pangalan ng iyong environment - makikita mo ang pahina sa itaas

      - i-click ang Azure Container Apps resource
      - i-click ang Application Url sa seksyong _Essentials_ (itaas kanan)

1. Makakakita ka ng isang naka-host na front-end UI ng aplikasyon na ganito:

   ![Aplikasyon](../../../../../translated_images/tl/03-test-application.471910da12c3038e.webp)

1. Subukan magtanong ng ilang [mga sample na tanong]

      1. Ask: ```What is the capital of France?``` 
      1. Ask: ```What's the best tent under $200 for two people, and what features does it include?```

1. Makakatanggap ka ng mga sagot na katulad ng ipinapakita sa ibaba. _Ngunit paano ito gumagana?_ 

      ![Aplikasyon-sagot](../../../../../translated_images/tl/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agent Validation

Ang Azure Container App ay nag-de-deploy ng isang endpoint na kumokonekta sa AI Agent na na-provision sa Microsoft Foundry project para sa template na ito. Tingnan natin kung ano ang ibig sabihin nito.

1. Bumitaw sa Azure Portal _Overview_ page para sa iyong resource group

1. I-click ang `Microsoft Foundry` resource sa listahang iyon

1. Makikita mo ito. I-click ang `Go to Microsoft Foundry Portal` na button. 
   ![Foundry-portal](../../../../../translated_images/tl/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Makikita mo ang Foundry Project page para sa iyong AI application
   ![Proyekto](../../../../../translated_images/tl/05-visit-foundry-portal.d734e98135892d7e.webp)

1. I-click ang `Agents` - makikita mo ang default na Agent na na-provision sa iyong proyekto
   ![Mga Agent](../../../../../translated_images/tl/06-visit-agents.bccb263f77b00a09.webp)

1. Piliin ito - at makikita mo ang mga detalye ng Agent. Pansinin ang mga sumusunod:

      - Ang agent ay gumagamit ng File Search bilang default (palagi)
      - Ipinapakita ng `Knowledge` ng agent na may 32 file na na-upload (para sa file search)
      ![Detalye-ng-Agent](../../../../../translated_images/tl/07-view-agent-details.0e049f37f61eae62.webp)

1. Hanapin ang `Data+indexes` na opsyon sa kaliwang menu at i-click para sa detalye. 

      - Makikita mo ang 32 data file na na-upload para sa knowledge.
      - Ito ay tumutugma sa 12 customer files at 20 product files sa ilalim ng `src/files` 
      ![Data-indexes](../../../../../translated_images/tl/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Napatunayan mong gumagana ang Agent!** 

1. Ang mga tugon ng agent ay nakabatay sa knowledge sa mga file na iyon. 
1. Maaari ka nang magtanong ng mga kaugnay na tanong tungkol sa data na iyon, at makakuha ng mga grounded na tugon.
1. Halimbawa: ang `customer_info_10.json` ay naglalarawan ng 3 pagbili na ginawa ni "Amanda Perez"

Bumalik sa browser tab na may Container App endpoint at magtanong: `What products does Amanda Perez own?`. Makakakita ka ng ganito:

![Data-ACA](../../../../../translated_images/tl/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Magbuo tayo ng karagdagang intuwisyon para sa mga kakayahan ng Microsoft Foundry, sa pamamagitan ng pag-ikot ng Agent sa Agents Playground. 

1. Bumalik sa `Agents` page sa Microsoft Foundry - piliin ang default agent
1. I-click ang `Try in Playground` na opsyon - makakakuha ka ng isang Playground UI na ganito
1. Itanong ang parehong tanong: `What products does Amanda Perez own?`

    ![Playground](../../../../../translated_images/tl/09-ask-in-playground.a1b93794f78fa676.webp)

Makakakuha ka ng parehong (o katulad) na tugon - ngunit makakakita ka rin ng karagdagang impormasyon na makakatulong sa pag-unawa sa kalidad, gastos, at performance ng iyong agentic app. Halimbawa:

1. Pansinin na sinisipi ng tugon ang mga data file na ginamit upang "i-ground" ang tugon
1. I-hover ang cursor sa alinman sa mga file label na ito - tumutugma ba ang data sa iyong query at ipinakitang tugon?

Makikita mo rin ang isang _stats_ row sa ibaba ng tugon. 

1. I-hover ang cursor sa alinmang metric - hal., Safety. Makakakita ka ng ganitong view
1. Tumutugma ba ang na-assess na rating sa iyong intuwisyon para sa antas ng kaligtasan ng tugon?

      ![Run-info-meter](../../../../../translated_images/tl/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Nakapaloob na Observability

Ang observability ay tungkol sa pag-instrument ng iyong aplikasyon upang makabuo ng data na magagamit para maunawaan, i-debug, at i-optimize ang operasyon nito. Upang makakuha ng pakiramdam dito:

1. I-click ang `View Run Info` na button - makikita mo ang view na ito. Ito ay isang halimbawa ng [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) na gumagana. _Makukuha mo rin ang view na ito sa pamamagitan ng pag-click ng Thread Logs sa top-level menu_.

   - Makakuha ng pakiramdam para sa mga run step at mga tool na ginamit ng agent
   - Unawain ang kabuuang bilang ng Token (kabalikat ng output tokens usage) para sa tugon
   - Unawain ang latency at kung saan nagagugol ang oras sa pagpapatupad

      ![Agent-run-info](../../../../../translated_images/tl/10-view-run-info.b20ebd75fef6a1cc.webp)

1. I-click ang `Metadata` tab upang makita ang karagdagang attributes para sa run, na maaaring magbigay ng kapaki-pakinabang na konteksto para sa pag-debug ng mga isyu sa hinaharap.   

      ![Metadata-run](../../../../../translated_images/tl/11-view-run-info-metadata.7966986122c7c2df.webp)


1. I-click ang `Evaluations` tab upang makita ang mga auto-assessment na ginawa sa tugon ng agent. Kabilang dito ang mga safety evaluations (e.g., Self-harm) at agent-specifc evaluations (e.g., Intent resolution, Task adherence).

      ![Evaluations-run](../../../../../translated_images/tl/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Huli ngunit hindi pinakamababa, i-click ang `Monitoring` tab sa sidebar menu.

      - Piliin ang `Resource usage` tab sa ipinakitang pahina - at tingnan ang mga metrics.
      - Subaybayan ang paggamit ng aplikasyon sa termino ng gastos (tokens) at load (requests).
      - Subaybayan ang latency ng aplikasyon mula sa first byte (input processing) hanggang last byte (output).

      ![Monitoring-resources](../../../../../translated_images/tl/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Mga Environment Variables

Hanggang ngayon, naglakad tayo sa pamamagitan ng deployment sa browser - at na-validate na na-provision ang ating imprastraktura at ang aplikasyon ay operational. Ngunit upang magtrabaho sa application _code-first_, kailangan nating i-configure ang lokal na development environment sa mga kaugnay na variable na kinakailangan para gumana sa mga resource na ito. Pinapadali ito ng `azd`.

1. Ang Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) upang i-store at i-manage ang mga configuration setting para sa mga deployment ng aplikasyon.

1. Ang mga environment variable ay naka-imbak sa `.azure/<env-name>/.env` - inii-scope nito ang mga ito sa `env-name` environment na ginamit sa panahon ng deployment at nakakatulong sa iyo na ihiwalay ang mga environment sa pagitan ng iba't ibang deployment target sa parehong repo.

1. Awtomatikong niloload ang mga environment variable ng command na `azd` tuwing magpapatakbo ito ng isang partikular na command (hal., `azd up`). Tandaan na ang `azd` ay hindi awtomatikong nagbabasa ng mga _OS-level_ environment variables (hal., naka-set sa shell) - sa halip gamitin ang `azd set env` at `azd get env` upang maglipat ng impormasyon sa loob ng mga script.


Subukan natin ang ilang mga utos:

1. Kunin ang lahat ng environment variable na naka-set para sa `azd` sa environment na ito:

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

1. Kunin ang isang partikular na value - hal., gusto kong malaman kung na-set namin ang `AZURE_AI_AGENT_MODEL_NAME` value

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Makakakita ka ng ganito - hindi ito na-set bilang default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Mag-set ng bagong environment variable para sa `azd`. Dito, ina-update natin ang agent model name. _Tandaan: anumang pagbabago ay agad na makikita sa `.azure/<env-name>/.env` file._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Ngayon, dapat makita natin na na-set ang value:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Tandaan na ang ilang resources ay persistent (hal., model deployments) at mangangailangan ng higit pa kaysa sa isang `azd up` upang pilitin ang redeployment. Subukan nating i-tear down ang orihinal na deployment at i-redeploy na may binagong env vars.

1. **Refresh** Kung dati ka nang nag-deploy ng imprastraktura gamit ang isang azd template - maaari mong i-_refresh_ ang estado ng iyong lokal na environment variables batay sa kasalukuyang estado ng iyong Azure deployment gamit ang utos na ito:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Ito ay isang makapangyarihang paraan upang i-_sync_ ang mga environment variable sa pagitan ng dalawa o higit pang lokal na development environment (hal., koponan na may maraming developer) - pinapayagan ang na-deploy na imprastruktura na magsilbing tunay na batayan para sa estado ng mga environment variable. Kailangan lamang ng mga miyembro ng koponan na i-_refresh_ ang mga variable upang muling maging naka-sync.

---

## 9. Pagbati 🏆

Katatapos mo lang kumpletuhin ang isang end-to-end na workflow kung saan:

- [X] Pinili ang AZD Template na nais mong gamitin
- [X] Binuksan ang template sa isang sinusuportahang development environment
- [X] Na-deploy ang Template at pinatunayan na ito ay gumagana

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->