# 2. I-validate ang Isang Template

!!! tip "SA PAGTATAPOS NG MODULONG ITO MAKAKAYA MO"

    - [ ] Suriin ang AI Solution Architecture
    - [ ] Unawain ang AZD Deployment Workflow
    - [ ] Gamitin ang GitHub Copilot para makatulong sa paggamit ng AZD
    - [ ] **Lab 2:** I-deploy at I-validate ang AI Agents template

---


## 1. Panimula

Ang [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) o `azd` ay isang open-source na command-line tool na nagpapasimple ng workflow ng developer kapag bumubuo at nagde-deploy ng mga aplikasyon sa Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ay mga standardized na repositoryo na naglalaman ng sample application code, _infrastructure-as-code_ assets, at mga `azd` configuration file para sa isang magkakaugnay na solution architecture. Ang pag-provision ng imprastruktura ay nagiging kasing-simple ng isang `azd provision` na command - habang ang paggamit ng `azd up` ay nagpapahintulot sa iyo na mag-provision ng imprastruktura **at** i-deploy ang iyong aplikasyon nang sabay!

Bilang resulta, ang pag-simula ng iyong proseso ng pag-develop ng aplikasyon ay maaaring maging kasing-simple ng paghahanap ng tamang _AZD Starter template_ na pinakamalapit sa iyong pangangailangan sa aplikasyon at imprastruktura - at pagkatapos ay i-customize ang repositoryo upang umangkop sa iyong scenario requirements.

Bago tayo magsimula, tiyakin muna nating naka-install ang Azure Developer CLI.

1. Buksan ang terminal ng VS Code at i-type ang utos na ito:

      ```bash title="" linenums="0"
      azd version
      ```

1. Makikita mo dapat ang ganitong bagay!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Handa ka na ngayong pumili at mag-deploy ng template gamit ang azd**

---

## 2. Pagpili ng Template

Ang Microsoft Foundry platform ay may kasamang [set of recommended AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) na sumasaklaw sa mga popular na solution scenarios tulad ng _multi-agent workflow automation_ at _multi-modal content processing_. Maaari mo ring tuklasin ang mga template na ito sa pagbisita sa Microsoft Foundry portal.

1. Bisitahin ang [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Mag-log in sa Microsoft Foundry portal kapag na-prompt - makakakita ka ng ganitong bagay.

![Pumili](../../../../../translated_images/tl/01-pick-template.60d2d5fff5ebc374.webp)


Ang mga **Basic** na pagpipilian ay ang iyong mga starter template:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) na nag-de-deploy ng isang basic na chat application _kasama ang iyong data_ sa Azure Container Apps. Gamitin ito para galugarin ang isang basic na AI chatbot scenario.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) na nag-de-deploy din ng isang standard AI Agent (kasama ang Foundry Agents). Gamitin ito para maging pamilyar sa agentic AI solutions na gumagamit ng tools at models.

Buksan ang pangalawang link sa isang bagong tab ng browser (o i-click ang `Open in GitHub` para sa kaugnay na card). Makikita mo ang repositoryo para sa AZD Template na ito. Maglaan ng sandali para galugarin ang README. Ganito ang hitsura ng architecture ng aplikasyon:

![Arkitektura](../../../../../translated_images/tl/architecture.8cec470ec15c65c7.webp)

---

## 3. Pag-activate ng Template

Subukan nating i-deploy ang template na ito at tiyakin na valid ito. Susundin natin ang mga gabay sa seksyong [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. I-click ang [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - kumpirmahin ang default action na `Create codespace`
1. Magbubukas ito ng isang bagong tab sa browser - maghintay hanggang matapos mag-load ang GitHub Codespaces session
1. Buksan ang VS Code terminal sa Codespaces - i-type ang sumusunod na utos:

   ```bash title="" linenums="0"
   azd up
   ```

Kumpletuhin ang mga workflow step na magti-trigger dito:

1. Hihilingin sa iyo na mag-log in sa Azure - sundin ang mga tagubilin para mag-authenticate
1. Mag-enter ng isang unique na pangalan ng environment para sa iyo - hal., ginamit ko ang `nitya-mshack-azd`
1. Ito  ay lilikha ng isang `.azure/` folder - makakakita ka ng isang subfolder na may pangalan ng env
1. Hihilingin mong pumili ng subscription name - piliin ang default
1. Hihilingin ka para sa isang lokasyon - gamitin ang `East US 2`

Ngayon, maghintay ka na lang para matapos ang provisioning. **Kumukuha ito ng 10-15 minuto**

1. Kapag tapos na, magpapakita ang iyong console ng SUCCESS message na gaya nito:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Magkakaroon na ngayon ang iyong Azure Portal ng isang provisioned resource group na may pangalang env na iyon:

      ![Inprastruktura](../../../../../translated_images/tl/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Handa ka na ngayong i-validate ang na-deploy na imprastruktura at aplikasyon**.

---

## 4. Pag-validate ng Template

1. Bisitahin ang Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) page - mag-log in kapag na-prompt
1. I-click ang RG para sa pangalan ng iyong environment - makikita mo ang pahina sa itaas

      - i-click ang Azure Container Apps resource
      - i-click ang Application Url sa _Essentials_ na seksyon (kanang bahagi sa itaas)

1. Makakakita ka ng isang naka-host na front-end UI ng aplikasyon na ganito:

   ![App](../../../../../translated_images/tl/03-test-application.471910da12c3038e.webp)

1. Subukan magtanong ng ilang [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Tanong: ```What is the capital of France?``` 
      1. Tanong: ```What's the best tent under $200 for two people, and what features does it include?```

1. Dapat kang makatanggap ng mga sagot na katulad ng ipinakita sa ibaba. _Pero paano ito gumagana?_ 

      ![App](../../../../../translated_images/tl/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Pag-validate ng Agent

Ang Azure Container App ay nag-de-deploy ng isang endpoint na kumokonekta sa AI Agent na na-provision sa Microsoft Foundry project para sa template na ito. Tingnan natin kung ano ang ibig sabihin noon.

1. Bumitaw sa Azure Portal _Overview_ page para sa iyong resource group

1. I-click ang `Microsoft Foundry` resource sa listahang iyon

1. Makikita mo ito. I-click ang `Go to Microsoft Foundry Portal` na button. 
   ![Foundry](../../../../../translated_images/tl/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Makikita mo ang Foundry Project page para sa iyong AI aplikasyon
   ![Proyekto](../../../../../translated_images/tl/05-visit-foundry-portal.d734e98135892d7e.webp)

1. I-click ang `Agents` - makikita mo ang default Agent na na-provision sa iyong proyekto
   ![Mga Agent](../../../../../translated_images/tl/06-visit-agents.bccb263f77b00a09.webp)

1. Piliin ito - at makikita mo ang mga detalye ng Agent. Tandaan ang mga sumusunod:

      - Ang agent ay gumagamit ng File Search bilang default (palagi)
      - Ipinapakita ng agent `Knowledge` na may 32 file na na-upload (para sa file search)
      ![Mga Agent](../../../../../translated_images/tl/07-view-agent-details.0e049f37f61eae62.webp)

1. Hanapin ang `Data+indexes` na opsyon sa kaliwang menu at i-click para sa mga detalye. 

      - Makikita mo ang 32 data files na na-upload para sa knowledge.
      - Ito ay tumutugma sa 12 customer files at 20 product files sa ilalim ng `src/files` 
      ![Data](../../../../../translated_images/tl/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Na-validate mo ang operasyon ng Agent!** 

1. Ang mga tugon ng agent ay naka-ground sa knowledge sa mga file na iyon. 
1. Maaari ka nang magtanong ng mga katanungan na may kaugnayan sa data na iyon, at makakuha ng grounded na mga sagot.
1. Halimbawa: ang `customer_info_10.json` ay naglalarawan ng 3 pagbili na ginawa ni "Amanda Perez"

Bumalik sa tab ng browser na may Container App endpoint at itanong: `What products does Amanda Perez own?`. Dapat mong makita ang ganito:

![Data](../../../../../translated_images/tl/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Gumawa tayo ng higit pang intuition para sa kakayahan ng Microsoft Foundry, sa pamamagitan ng pagpapaikot sa Agent sa Agents Playground. 

1. Bumalik sa `Agents` page sa Microsoft Foundry - piliin ang default agent
1. I-click ang `Try in Playground` na opsyon - makakakuha ka ng Playground UI na ganito
1. Itanong ang parehong tanong: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/tl/09-ask-in-playground.a1b93794f78fa676.webp)

Makukuha mo ang parehong (o katulad na) sagot - ngunit makakakita ka rin ng karagdagang impormasyon na maaari mong gamitin upang maunawaan ang kalidad, gastos, at performance ng iyong agentic na app. Halimbawa:

1. Tandaan na ang sagot ay nagsasaad ng mga data file na ginamit para i-"ground" ang tugon
1. I-hover ang anumang mga label ng file na ito - tumutugma ba ang data sa iyong query at ipinakitang tugon?

Makikita mo rin ang isang _stats_ na hilera sa ilalim ng tugon. 

1. I-hover ang anumang metric - hal., Safety. Makakakita ka ng ganito
1. Tumutugma ba ang in-assess na rating sa iyong intuition para sa antas ng kaligtasan ng tugon?

      ![Data](../../../../../translated_images/tl/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Built-in Observability

Ang observability ay tungkol sa pag-instrument ng iyong aplikasyon upang makabuo ng datos na maaaring gamitin upang maunawaan, i-debug, at i-optimize ang mga operasyon nito. Upang magkaroon ng pakiramdam nito:

1. I-click ang `View Run Info` na button - makikita mo ang view na ito. Ito ay isang halimbawa ng [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) sa aksyon. _Makukuha mo rin ang view na ito sa pamamagitan ng pag-click sa Thread Logs sa top-level menu_.

   - Kumuha ng ideya tungkol sa mga hakbang ng run at mga tool na ginamit ng agent
   - Unawain ang kabuuang Token count (vs. output tokens usage) para sa tugon
   - Unawain ang latency at kung saan ginugugol ang oras sa pag-e-execute

      ![Agent](../../../../../translated_images/tl/10-view-run-info.b20ebd75fef6a1cc.webp)

1. I-click ang `Metadata` tab upang makita ang karagdagang mga attribute para sa run, na maaaring magbigay ng kapaki-pakinabang na konteksto para sa pag-debug ng mga isyu sa hinaharap.   

      ![Agent](../../../../../translated_images/tl/11-view-run-info-metadata.7966986122c7c2df.webp)


1. I-click ang `Evaluations` tab upang makita ang auto-assessments na ginawa sa tugon ng agent. Kabilang dito ang safety evaluations (hal., Self-harm) at agent-specific evaluations (hal., Intent resolution, Task adherence).

      ![Agent](../../../../../translated_images/tl/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Huli ngunit hindi bababa, i-click ang `Monitoring` tab sa sidebar menu.

      - Piliin ang `Resource usage` tab sa ipinakitang pahina - at tingnan ang mga metrics.
      - Subaybayan ang paggamit ng aplikasyon sa mga tuntunin ng gastos (tokens) at load (requests).
      - Subaybayan ang latency ng aplikasyon hanggang sa first byte (input processing) at last byte (output).

      ![Agent](../../../../../translated_images/tl/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Environment Variables

Hanggang ngayon, tinahak natin ang deployment sa browser - at na-validate na ang ating imprastruktura ay na-provision at ang aplikasyon ay operasyonal. Ngunit upang magtrabaho sa aplikasyon nang _code-first_, kailangan nating i-configure ang ating lokal na development environment na may mga kaugnay na variable na kailangan para makipagtrabaho sa mga resource na ito. Pinapadali ito ng `azd`.

1. Ang Azure Developer CLI [gamit ang environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) upang i-store at pamahalaan ang configuration settings para sa mga deployment ng aplikasyon.

1. Ang mga environment variables ay naka-store sa `.azure/<env-name>/.env` - nililimitahan nito ang mga ito sa `env-name` na environment na ginamit sa deployment at tumutulong na paghiwalayin ang mga environment sa pagitan ng iba't ibang deployment target sa parehong repo.

1. Ang mga environment variables ay awtomatikong niloload ng `azd` command tuwing ito ay mag-eexecute ng isang partikular na command (hal., `azd up`). Tandaan na ang `azd` ay hindi awtomatikong nagbabasa ng _OS-level_ environment variables (hal., set sa shell) - sa halip gamitin ang `azd set env` at `azd get env` para mag-transfer ng impormasyon sa loob ng mga script.


Subukan natin ang ilang mga utos:

1. Kunin ang lahat ng environment variables na nakaset para sa `azd` sa environment na ito:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Makakakita ka ng ganito:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
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

1. Mag-set ng bagong environment variable para sa `azd`. Dito, in-update natin ang agent model name. _Tandaan: anumang pagbabago ay agad na makikita sa `.azure/<env-name>/.env` file._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Ngayon, dapat makita natin na na-set ang value:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Tandaan na ang ilang resources ay persistent (hal., model deployments) at mangangailangan ng higit pa sa isang `azd up` para pilitin ang redeployment. Subukan nating i-tear down ang orihinal na deployment at i-redeploy na may binagong env vars.

1. **Refresh** Kung dati ka nang nag-deploy ng imprastruktura gamit ang isang azd template - maaari mong i-_refresh_ ang estado ng iyong lokal na environment variables batay sa kasalukuyang estado ng iyong Azure deployment gamit ang utos na ito:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Ito ay isang makapangyarihang paraan upang _i-sync_ ang mga environment variable sa pagitan ng dalawa o higit pang lokal na development environment (hal., koponan na may maraming developer) - na nagpapahintulot sa naka-deploy na imprastruktura na magsilbing opisyal na batayan para sa estado ng mga environment variable. Ang mga miyembro ng koponan ay simpleng _i-refresh_ ang mga variable para muling magkasing-ayos.

---

## 9. Binabati kita 🏆

Katatapos mo lang ng isang end-to-end na workflow kung saan ginawa mo ang mga sumusunod:

- [X] Pinili ang AZD Template na gusto mong gamitin
- [X] Inilunsad ang Template gamit ang GitHub Codespaces 
- [X] Na-deploy ang Template at napatunayan mong gumagana ito

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Isinalin ang dokumentong ito gamit ang AI na serbisyo sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong salin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng saling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->