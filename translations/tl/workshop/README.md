<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD para sa mga AI Developer - Workshop
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Isang praktikal na workshop para sa pagbuo ng mga AI application gamit ang Azure Developer CLI.</strong><br>
      Kumpletuhin ang 7 module upang masanay sa mga AZD template at mga workflow ng AI deployment.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Huling Na-update: Pebrero 2026
      </span>
    </div>
  </div>
</div>

# AZD para sa mga AI Developer - Workshop

Maligayang pagdating sa praktikal na workshop para matutunan ang Azure Developer CLI (AZD) na nakatuon sa deployment ng AI application. Tutulungan ka ng workshop na ito na magkaroon ng praktikal na pag-unawa sa mga AZD template sa 3 hakbang:

1. **Discovery** - hanapin ang template na angkop para sa iyo.
1. **Deployment** - i-deploy at i-validate na gumagana ito
1. **Customization** - i-modify at i-iterate upang maging iyo!

Sa kabuuan ng workshop na ito, ipakikilala ka rin sa mga pangunahing developer tool at mga workflow, upang matulungan kang gawing mas maayos ang iyong end-to-end na paglalakbay sa pag-develop.

<br/>

## Gabay na Batay sa Browser

Ang mga leksyon ng workshop ay nasa Markdown. Maaari mo itong i-navigate nang direkta sa GitHub - o i-launch ang preview na batay sa browser tulad ng ipinapakita sa screenshot sa ibaba.

![Workshop](../../../translated_images/tl/workshop.75906f133e6f8ba0.webp)

Upang gamitin ang opsyong ito - i-fork ang repositoryo sa iyong profile, at i-launch ang GitHub Codespaces. Kapag aktibo na ang terminal ng VS Code, i-type ang command na ito:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Sa loob ng ilang segundo, makakakita ka ng pop-up dialog. Piliin ang opsyon na `Open in browser`. Magbubukas na ang web-based na gabay sa isang bagong tab ng browser. Ilan sa mga benepisyo ng preview na ito:

1. **Built-in search** - hanapin ang mga keyword o leksyon nang mabilis.
1. **Copy icon** - i-hover ang mga codeblock upang makita ang opsyong ito
1. **Theme toggle** - lumipat sa pagitan ng dark at light na tema
1. **Get help** - i-click ang Discord icon sa footer upang sumali!

<br/>

## Pangkalahatang-ideya ng Workshop

**Tagal:** 3-4 oras  
**Antas:** Nagsisimula hanggang Katamtaman  
**Mga Kinakailangan:** Pamilyaridad sa Azure, mga konsepto ng AI, VS Code & mga command-line na tool.

Ito ay isang praktikal na workshop kung saan natututo ka sa pamamagitan ng paggawa. Kapag nakumpleto mo na ang mga exercise, nirerekomenda naming repasuhin ang AZD For Beginners na kurikulum upang ipagpatuloy ang iyong pag-aaral patungo sa mga pinakamahusay na kasanayan sa Security at Productivity.

| Oras| Module  | Layunin |
|:---|:---|:---|
| 15 minuto | [Panimula](docs/instructions/0-Introduction.md) | Ihanda ang entablado, unawain ang mga layunin |
| 30 minuto | [Pumili ng AI Template](docs/instructions/1-Select-AI-Template.md) | Tuklasin ang mga opsyon at pumili ng panimulang template | 
| 30 minuto | [I-validate ang AI Template](docs/instructions/2-Validate-AI-Template.md) | I-deploy ang default na solusyon sa Azure |
| 30 minuto | [I-deconstruct ang AI Template](docs/instructions/3-Deconstruct-AI-Template.md) | Suriin ang istruktura at configuration |
| 30 minuto | [I-configure ang AI Template](docs/instructions/4-Configure-AI-Template.md) | I-activate at subukan ang mga magagamit na feature |
| 30 minuto | [I-customize ang AI Template](docs/instructions/5-Customize-AI-Template.md) | I-angkop ang template sa iyong mga pangangailangan |
| 30 minuto | [I-teardown ang Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) | Linisin at i-release ang mga resources |
| 15 minuto | [Wrap-Up & Next Steps](docs/instructions/7-Wrap-up.md) | Mga mapagkukunan sa pagkatuto, Hamon ng Workshop |

<br/>

## Ano ang Matututuhan Mo

Isipin ang AZD Template bilang isang learning sandbox upang tuklasin ang iba't ibang kakayahan at tool para sa end-to-end na pag-develop sa Microsoft Foundry. Sa pagtatapos ng workshop na ito, dapat mayroon kang intuitibong pang-unawa sa iba't ibang tool at konsepto sa kontekstong ito.

| Konsepto  | Layunin |
|:---|:---|
| **Azure Developer CLI** | Unawain ang mga utos ng tool at mga workflow|
| **AZD Templates**| Unawain ang estruktura ng proyekto at configuration|
| **Azure AI Agent**| Mag-provision at mag-deploy ng Microsoft Foundry project  |
| **Azure AI Search**| Paganahin ang context engineering gamit ang agents |
| **Observability**| Suriin ang tracing, monitoring at mga pagsusuri |
| **Red Teaming**| Suriin ang adversarial testing at mga mitigasyon |

<br/>

## Estruktura ng Workshop

Ang workshop ay nakaayos upang dalhin ka sa isang paglalakbay mula sa paghahanap ng template, hanggang sa deployment, deconstruction, at customization - gamit ang opisyal na [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) starter template bilang batayan.

### [Module 1: Pumili ng AI Template](docs/instructions/1-Select-AI-Template.md) (30 mins)

- Ano ang mga AI Template?
- Saan ko makikita ang mga AI Template?
- Paano ako makapagsisimula sa pagbuo ng AI Agents?
- **Lab**: Mabilis na pagsisimula gamit ang GitHub Codespaces

### [Module 2: I-validate ang AI Template](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- Ano ang Arkitektura ng AI Template?
- Ano ang AZD Development Workflow?
- Paano ako makakakuha ng tulong sa AZD Development?
- **Lab**: I-deploy at i-validate ang AI Agents template

### [Module 3: I-deconstruct ang AI Template](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Suriin ang iyong environment sa `.azure/` 
- Suriin ang iyong setup ng resources sa `infra/` 
- Suriin ang iyong AZD configuration sa `azure.yaml`s
- **Lab**: Baguhin ang Mga Environment Variable & I-redeploy

### [Module 4: I-configure ang AI Template](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Suriin: Retrieval Augmented Generation
- Suriin: Agent Evaluation & Red Teaming
- Suriin: Tracing & Monitoring
- **Lab**: Suriin ang AI Agent + Observability 

### [Module 5: I-customize ang AI Template](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Tukuyin: PRD na may Scenario Requirements
- I-configure: Mga Environment Variable para sa AZD
- I-implement: Lifecycle Hooks para sa karagdagang mga gawain
- **Lab**: I-customize ang template para sa aking scenario

### [Module 6: I-teardown ang Infrastructure](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Balikan: Ano ang AZD Templates?
- Balikan: Bakit gamitin ang Azure Developer CLI?
- Mga Susunod na Hakbang: Subukan ang ibang template!
- **Lab**: I-deprovision ang infrastructure at linisin

<br/>

## Hamong Workshop

Gusto mo bang hamunin ang sarili na gumawa pa ng higit? Narito ang ilang suhestiyon ng proyekto - o ibahagi ang iyong mga ideya sa amin!!

| Project | Description |
|:---|:---|
|1. **I-deconstruct ang Isang Komplikadong AI Template** | Gamitin ang workflow at mga tool na inilatag namin at tingnan kung kaya mong i-deploy, i-validate, at i-customize ang ibang AI solution template. _Ano ang iyong natutunan?_|
|2. **I-customize Ayon sa Iyong Scenario**  | Subukang magsulat ng isang PRD (Product Requirements Document) para sa ibang scenario. Pagkatapos gamitin ang GitHub Copilot sa iyong template repo sa Agent Model - at hilingin dito na gumawa ng isang customization workflow para sa iyo. _Ano ang iyong natutunan? Paano mo mapapabuti ang mga suhestyong ito?_|
| | |

## May feedback?

1. Mag-post ng isyu sa repo na ito - i-tag ito bilang `Workshop` para sa kaginhawaan.
1. Sumali sa Microsoft Foundry Discord - kumonekta sa iyong mga kasamahan!


| | | 
|:---|:---|
| **📚 Tahanan ng Kurso**| [AZD For Beginners](../README.md)|
| **📖 Dokumentasyon** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Mga AI Template** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Mga Susunod na Hakbang** | [Simulan ang Workshop](../../../workshop) |
| | |

<br/>

---

**Navigasyon:** [Pangunahing Kurso](../README.md) | [Panimula](docs/instructions/0-Introduction.md) | [Module 1: Pumili ng Template](docs/instructions/1-Select-AI-Template.md)

**Handa ka na bang magsimulang bumuo ng mga AI application gamit ang AZD?**

[Simulan ang Workshop: Panimula →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang serbisyong AI na pagsasalin na Co-op Translator (https://github.com/Azure/co-op-translator). Bagaman sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong sanggunian. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->