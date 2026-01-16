<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T16:02:35+00:00",
  "source_file": "workshop/README.md",
  "language_code": "tl"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Workshop Sa Paggawa 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Ang workshop na ito ay kasalukuyang nasa aktibong pag-develop.</strong><br>
      Ang nilalaman ay maaaring hindi kumpleto o maaaring magbago. Balik-balik para sa mga update!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Huling Na-update: Oktubre 2025
      </span>
    </div>
  </div>
</div>

# AZD para sa AI Developers Workshop

Maligayang pagdating sa hands-on workshop para matutunan ang Azure Developer CLI (AZD) na nakatuon sa pag-deploy ng AI applications. Ang workshop na ito ay tumutulong sa iyo na magkaroon ng praktikal na kaalaman sa AZD templates sa tatlong hakbang:

1. **Pagdiskubre** - hanapin ang tamang template para sa iyo.
1. **Pag-deploy** - i-deploy at tiyakin na gumagana ito.
1. **Pag-customize** - baguhin at ulitin upang maging angkop sa iyo!

Sa kabuuan ng workshop na ito, ipakikilala rin sa iyo ang mga pangunahing tools at workflows ng developer upang makatulong sa pagpapadali ng iyong end-to-end development journey.

<br/>

## Gabay sa Browser

Ang mga aralin sa workshop ay nasa Markdown. Maaari mo itong i-navigate nang direkta sa GitHub - o mag-launch ng browser-based preview tulad ng ipinapakita sa screenshot sa ibaba.

![Workshop](../../../translated_images/tl/workshop.75906f133e6f8ba0.png)

Upang magamit ang opsyon na ito - i-fork ang repository sa iyong profile, at i-launch ang GitHub Codespaces. Kapag aktibo na ang VS Code terminal, i-type ang command na ito:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Sa loob ng ilang segundo, makakakita ka ng pop-up dialog. Piliin ang opsyon na `Open in browser`. Ang web-based guide ay magbubukas na sa isang bagong tab ng browser. Ilan sa mga benepisyo ng preview na ito:

1. **Built-in na paghahanap** - mabilis na mahanap ang mga keyword o aralin.
1. **Copy icon** - i-hover ang mouse sa codeblocks para makita ang opsyon na ito.
1. **Theme toggle** - magpalit sa pagitan ng dark at light themes.
1. **Humingi ng tulong** - i-click ang Discord icon sa footer para sumali!

<br/>

## Overview ng Workshop

**Tagal:** 3-4 oras  
**Antas:** Baguhan hanggang Intermediate  
**Mga Kinakailangan:** Pamilyar sa Azure, mga konsepto ng AI, VS Code & mga command-line tools.

Ito ay isang hands-on workshop kung saan matututo ka sa pamamagitan ng paggawa. Kapag natapos mo na ang mga exercises, inirerekomenda naming suriin ang AZD For Beginners curriculum upang ipagpatuloy ang iyong pag-aaral sa mga pinakamahusay na kasanayan sa Seguridad at Produktibidad.

| Oras | Module  | Layunin |
|:---|:---|:---|
| 15 minuto | [Panimula](docs/instructions/0-Introduction.md) | Itakda ang layunin, unawain ang mga layunin |
| 30 minuto | [Piliin ang AI Template](docs/instructions/1-Select-AI-Template.md) | Tuklasin ang mga opsyon at pumili ng panimula | 
| 30 minuto | [I-validate ang AI Template](docs/instructions/2-Validate-AI-Template.md) | I-deploy ang default na solusyon sa Azure |
| 30 minuto | [I-deconstruct ang AI Template](docs/instructions/3-Deconstruct-AI-Template.md) | Tuklasin ang istruktura at configuration |
| 30 minuto | [I-configure ang AI Template](docs/instructions/4-Configure-AI-Template.md) | I-activate at subukan ang mga available na features |
| 30 minuto | [I-customize ang AI Template](docs/instructions/5-Customize-AI-Template.md) | I-adapt ang template sa iyong pangangailangan |
| 30 minuto | [I-teardown ang Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) | Linisin at i-release ang mga resources |
| 15 minuto | [Pagwawakas at Susunod na Hakbang](docs/instructions/7-Wrap-up.md) | Mga learning resources, Workshop challenge |

<br/>

## Ano ang Matututunan Mo

Isipin ang AZD Template bilang isang learning sandbox upang tuklasin ang iba't ibang kakayahan at tools para sa end-to-end development sa Azure AI Foundry. Sa pagtatapos ng workshop na ito, dapat ay may intuitive na pag-unawa ka sa iba't ibang tools at konsepto sa kontekstong ito.

| Konsepto  | Layunin |
|:---|:---|
| **Azure Developer CLI** | Unawain ang mga command at workflows ng tool |
| **AZD Templates**| Unawain ang istruktura ng proyekto at config |
| **Azure AI Agent**| Mag-provision at mag-deploy ng Azure AI Foundry project |
| **Azure AI Search**| Paganahin ang context engineering gamit ang agents |
| **Observability**| Tuklasin ang tracing, monitoring, at evaluations |
| **Red Teaming**| Tuklasin ang adversarial testing at mitigations |

<br/>

## Estruktura ng Workshop

Ang workshop ay naka-istruktura upang dalhin ka sa isang paglalakbay mula sa pagdiskubre ng template, hanggang sa pag-deploy, pag-deconstruct, at pag-customize - gamit ang opisyal na [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) starter template bilang batayan.

### [Module 1: Piliin ang AI Template](docs/instructions/1-Select-AI-Template.md) (30 minuto)

- Ano ang AI Templates?
- Saan ko mahahanap ang AI Templates?
- Paano ako magsisimula sa paggawa ng AI Agents?
- **Lab**: Quickstart gamit ang GitHub Codespaces

### [Module 2: I-validate ang AI Template](docs/instructions/2-Validate-AI-Template.md) (30 minuto)

- Ano ang AI Template Architecture?
- Ano ang AZD Development Workflow?
- Paano ako makakakuha ng tulong sa AZD Development?
- **Lab**: I-deploy at i-validate ang AI Agents template

### [Module 3: I-deconstruct ang AI Template](docs/instructions/3-Deconstruct-AI-Template.md) (30 minuto)

- Tuklasin ang iyong environment sa `.azure/` 
- Tuklasin ang iyong resource setup sa `infra/` 
- Tuklasin ang iyong AZD configuration sa `azure.yaml`s
- **Lab**: Baguhin ang Environment Variables at i-redeploy

### [Module 4: I-configure ang AI Template](docs/instructions/4-Configure-AI-Template.md) (30 minuto)
- Tuklasin: Retrieval Augmented Generation
- Tuklasin: Agent Evaluation & Red Teaming
- Tuklasin: Tracing & Monitoring
- **Lab**: Tuklasin ang AI Agent + Observability 

### [Module 5: I-customize ang AI Template](docs/instructions/5-Customize-AI-Template.md) (30 minuto)
- Tukuyin: PRD gamit ang Scenario Requirements
- I-configure: Environment Variables para sa AZD
- I-implement: Lifecycle Hooks para sa karagdagang tasks
- **Lab**: I-customize ang template para sa aking scenario

### [Module 6: I-teardown ang Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) (30 minuto)
- Recap: Ano ang AZD Templates?
- Recap: Bakit gamitin ang Azure Developer CLI?
- Susunod na Hakbang: Subukan ang ibang template!
- **Lab**: I-deprovision ang infrastructure at linisin

<br/>

## Workshop Challenge

Gusto mo bang hamunin ang sarili mo na gumawa pa ng higit? Narito ang ilang mga mungkahi sa proyekto - o ibahagi ang iyong mga ideya sa amin!!

| Proyekto | Deskripsyon |
|:---|:---|
|1. **I-deconstruct ang Isang Complex AI Template** | Gamitin ang workflow at tools na aming itinuro at tingnan kung kaya mong i-deploy, i-validate, at i-customize ang ibang AI solution template. _Ano ang natutunan mo?_|
|2. **I-customize Gamit ang Iyong Scenario**  | Subukang magsulat ng PRD (Product Requirements Document) para sa ibang scenario. Pagkatapos gamitin ang GitHub Copilot sa iyong template repo sa Agent Model - at hilingin dito na gumawa ng customization workflow para sa iyo. _Ano ang natutunan mo? Paano mo mapapabuti ang mga mungkahi?_|
| | |

## May feedback?

1. Mag-post ng issue sa repo na ito - i-tag ito bilang `Workshop` para sa kaginhawaan.
1. Sumali sa Azure AI Foundry Discord - makipag-ugnayan sa iyong mga kapwa developer!


| | | 
|:---|:---|
| **📚 Home ng Kurso**| [AZD Para sa Mga Baguhan](../README.md)|
| **📖 Dokumentasyon** | [Simulan sa AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Azure AI Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Susunod na Hakbang** | [Subukan ang Hamon](../../../workshop) |
| | |

<br/>

---

**Nakaraan:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **Susunod:** Simulan sa [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics)

**Handa ka na bang magsimula sa paggawa ng AI applications gamit ang AZD?**

[Simulan ang Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagamat sinisikap naming maging tumpak, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na pinagmulan. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.