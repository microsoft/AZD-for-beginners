<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1a87eaee8309cd74837981fdc6834dd9",
  "translation_date": "2025-10-11T15:42:33+00:00",
  "source_file": "workshop/docs/index.md",
  "language_code": "et"
}
-->
# AZD töötuba tehisintellekti arendajatele

> [!IMPORTANT]  
> **See töötuba on varustatud juhendiga, mida saate oma kohalikus brauseris eelvaadata. Alustamiseks peate avama GitHub Codespaces'i selles repositooriumis—seejärel oodake, kuni näete aktiivset VS Code terminali, ja sisestage:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Te peaksite nägema hüpikakent, mis võimaldab eelvaate lehe avamist brauseris.**

Tere tulemast praktilisse töötuppa, kus õpitakse kasutama Azure Developer CLI-d (AZD) keskendudes tehisintellekti rakenduste juurutamisele. See töötuba aitab teil omandada praktilise arusaama AZD mallidest kolme sammuga:

1. **Avastamine** - leidke endale sobiv mall.
1. **Juurutamine** - juurutage ja veenduge, et see töötab.
1. **Kohandamine** - muutke ja täiustage, et see vastaks teie vajadustele!

Töötoa käigus tutvustatakse teile ka põhilisi arendustööriistu ja töövooge, mis aitavad teil oma arendusteekonda sujuvamaks muuta.

| | | 
|:---|:---|
| **📚 Kursuse avaleht**| [AZD algajatele](../README.md)|
| **📖 Dokumentatsioon** | [Alustamine AI mallidega](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI mallid** | [Azure AI Foundry mallid](https://ai.azure.com/templates) |
|**🚀 Järgmised sammud** | [Võta vastu väljakutse](../../../../workshop/docs) |
| | |

## Töötoa ülevaade

**Kestus:** 3-4 tundi  
**Tase:** Algaja kuni kesktase  
**Eeltingimused:** Tutvumine Azure'i, tehisintellekti kontseptsioonide, VS Code'i ja käsurea tööriistadega.

See on praktiline töötuba, kus õpitakse läbi tegemise. Kui olete harjutused lõpetanud, soovitame teil üle vaadata AZD algajatele mõeldud õppekava, et jätkata oma õpiteekonda turvalisuse ja tootlikkuse parimate tavadega.

| Aeg | Moodul  | Eesmärk |
|:---|:---|:---|
| 15 min | Sissejuhatus | Seadke eesmärgid ja mõistke töötoa sisu |
| 30 min | AI malli valimine | Uurige võimalusi ja valige algmall | 
| 30 min | AI malli valideerimine | Juurutage vaikimisi lahendus Azure'is |
| 30 min | AI malli lahtivõtmine | Uurige struktuuri ja konfiguratsiooni |
| 30 min | AI malli seadistamine | Aktiveerige ja proovige saadaolevaid funktsioone |
| 30 min | AI malli kohandamine | Kohandage mall vastavalt oma vajadustele |
| 30 min | Infrastruktuuri eemaldamine | Puhastage ja vabastage ressursid |
| 15 min | Kokkuvõte ja järgmised sammud | Õppematerjalid, töötoa väljakutse |
| | |

## Mida te õpite

Mõelge AZD mallist kui õppimise liivakastist, kus saate uurida erinevaid võimalusi ja tööriistu Azure AI Foundry lõpp-to-lõpp arenduseks. Selle töötoa lõpuks peaksite omandama intuitiivse arusaama erinevatest tööriistadest ja kontseptsioonidest selles kontekstis.

| Kontseptsioon  | Eesmärk |
|:---|:---|
| **Azure Developer CLI** | Mõista tööriista käske ja töövooge |
| **AZD mallid**| Mõista projekti struktuuri ja konfiguratsiooni |
| **Azure AI Agent**| Azure AI Foundry projekti ettevalmistamine ja juurutamine |
| **Azure AI Search**| Konteksti inseneeria võimaldamine agentidega |
| **Jälgitavus**| Uurige jälgimist, monitooringut ja hindamisi |
| **Punase meeskonna testimine**| Uurige vastase testimist ja leevendusi |
| | |

## Töötoa moodulid

Valmis alustama? Liikuge läbi töötoa moodulite:

- [Moodul 1: AI malli valimine](instructions/1-Select-AI-Template.md)
- [Moodul 2: AI malli valideerimine](instructions/2-Validate-AI-Template.md) 
- [Moodul 3: AI malli lahtivõtmine](instructions/3-Deconstruct-AI-Template.md)
- [Moodul 4: AI malli seadistamine](instructions/4-Configure-AI-Template.md)
- [Moodul 5: AI malli kohandamine](instructions/5-Customize-AI-Template.md)
- [Moodul 6: Infrastruktuuri eemaldamine](instructions/6-Teardown-Infrastructure.md)
- [Moodul 7: Kokkuvõte ja järgmised sammud](instructions/7-Wrap-up.md)

## Kas teil on tagasisidet?

Postitage probleem selle repositooriumi kohta (märgistage see `Workshop`) või liituge meiega [Discordis](https://aka.ms/foundry/discord) ja postitage meie `#get-help` kanalisse.

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.