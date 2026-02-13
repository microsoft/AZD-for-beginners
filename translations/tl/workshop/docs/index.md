# AZD para sa Mga AI Developer Workshop

> [!IMPORTANT]  
> **Ang workshop na ito ay may kasamang workshop guide na maaari mong i-preview sa iyong lokal na browser. Upang makapagsimula, kailangan mong ilunsad ang GitHub Codespaces sa repo—pagkatapos maghintay hanggang makita mo ang isang aktibong VS Code terminal at i-type:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Dapat kang makakita ng pop-up dialog upang buksan ang preview page sa isang browser.**

Maligayang pagdating sa praktikal na workshop para matutunan ang Azure Developer CLI (AZD) na may pokus sa deployment ng mga AI application. Tutulungan ka ng workshop na ito na magkaroon ng praktikal na pag-unawa sa mga AZD template sa 3 hakbang:

1. **Pagdiskubre** - hanapin ang template na angkop sa iyo.
1. **Pag-deploy** - i-deploy at tiyaking gumagana ito
1. **Pagpapasadya** - baguhin at ulitin para maging iyo!

Sa kabuuan ng workshop na ito, ipakikilala rin sa iyo ang mga pangunahing tool at workflow ng developer, upang matulungan kang pabilisin ang iyong end-to-end na paglalakbay sa pag-develop.

| | | 
|:---|:---|
| **📚 Tahanan ng Kurso**| [AZD Para sa Nagsisimula](../README.md)|
| **📖 Dokumentasyon** | [Magsimula sa mga AI template](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Mga AI Template** | [Mga Template ng Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Mga Susunod na Hakbang** | [Tanggapin ang Hamon](../../../../workshop/docs) |
| | |

## Pangkalahatang-ideya ng Workshop

**Tagal:** 3-4 oras  
**Antas:** Mula sa Baguhan hanggang Gitnang Antas  
**Mga Paunang Kaalaman:** Pamilyaridad sa Azure, mga konsepto ng AI, VS Code at mga tool sa command-line.

Ang workshop na ito ay praktikal at nag-aaral ka sa pamamagitan ng paggawa. Kapag natapos mo na ang mga ehersisyo, inirerekomenda naming suriin ang kurikulum ng AZD Para sa Nagsisimula upang ipagpatuloy ang iyong pag-aaral patungong mga pinakamahusay na kasanayan sa Seguridad at Produktibidad.

| Oras| Modyul  | Layunin |
|:---|:---|:---|
| 15 mins | Introduksyon | Ilatag ang konteksto, unawain ang mga layunin |
| 30 mins | Pumili ng AI Template | Suriin ang mga pagpipilian at pumili ng panimulang template | 
| 30 mins | I-validate ang AI Template | I-deploy ang default na solusyon sa Azure |
| 30 mins | Suriin ang Istruktura ng AI Template | Suriin ang istruktura at konfigurasyon |
| 30 mins | I-configure ang AI Template | I-activate at subukan ang magagamit na mga tampok |
| 30 mins | I-personalize ang AI Template | Iangkop ang template sa iyong mga pangangailangan |
| 30 mins | Pag-alis ng Imprastruktura | Linisin at pakawalan ang mga resources |
| 15 mins | Pagtatapos at Mga Susunod na Hakbang | Mga materyales sa pagkatuto, Hamon ng Workshop |
| | |

## Ano ang Matututuhan Mo

Isipin ang AZD Template bilang isang learning sandbox para tuklasin ang iba't ibang kakayahan at tool para sa end-to-end development sa Microsoft Foundry. Sa pagtatapos ng workshop na ito, dapat mayroon kang isang intuitibong pag-unawa sa iba't ibang mga tool at konsepto sa kontekstong ito.

| Konsepto  | Layunin |
|:---|:---|
| **Azure Developer CLI** | Unawain ang mga command ng tool at mga workflow|
| **AZD Templates**| Unawain ang istruktura ng proyekto at konfigurasyon|
| **Azure AI Agent**| Mag-provision at mag-deploy ng Microsoft Foundry project  |
| **Azure AI Search**| Paganahin ang context engineering gamit ang mga agent |
| **Observability**| Suriin ang tracing, monitoring at mga evaluasyon |
| **Red Teaming**| Suriin ang adversarial testing at mga mitigations |
| | |

## Mga Module ng Workshop

Handa nang magsimula? Mag-navigate sa mga module ng workshop:

- [Modyul 1: Pumili ng AI Template](instructions/1-Select-AI-Template.md)
- [Modyul 2: I-validate ang AI Template](instructions/2-Validate-AI-Template.md) 
- [Modyul 3: Suriin ang Istruktura ng AI Template](instructions/3-Deconstruct-AI-Template.md)
- [Modyul 4: I-configure ang AI Template](instructions/4-Configure-AI-Template.md)
- [Modyul 5: I-personalize ang AI Template](instructions/5-Customize-AI-Template.md)
- [Modyul 6: Pag-alis ng Imprastruktura](instructions/6-Teardown-Infrastructure.md)
- [Modyul 7: Pagtatapos & Mga Susunod na Hakbang](instructions/7-Wrap-up.md)

## May feedback?

Mag-post ng isyu sa repo na ito (tag ito `Workshop`) o sumali sa amin sa [Discord](https://aka.ms/foundry/discord) at mag-post sa aming `#get-help` channel

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI para sa pagsasalin (Co-op Translator: https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o di-tumpak na bahagi. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinagmulan ng awtoridad. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na magmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->