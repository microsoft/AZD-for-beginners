# AZD AI arendajatele töötuba

> Kinnitatud versiooniga `azd 1.27.1` juulis 2026.

> [!IMPORTANT]  
> **See töötuba on varustatud töötoa juhendiga, mida saate oma lokaalses brauseris eelvaadata. Alustamiseks avage hoidla GitHub Codespaces'is, arendus konteineris või kohalikus kloonis, kus on installitud MkDocs—seejärel oodake, kuni näete aktiivset VS Code terminali ja tippige:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Te peaksite nägema hüpikdialoogi, mis kutsub avama eelvaatelehe brauseris.**

Tere tulemast praktilisse töötuppa, kus õpitakse Azure Developer CLI-d (AZD) keskendudes AI rakenduste juurutamisele. See töötuba aitab teil omandada rakendusliku arusaama AZD mallidest 3 sammu kaudu:

1. **Avastamine** - leidke endale sobiv mall.
1. **Juurutamine** - juurutage ja kontrollige, et see töötab
1. **Kohandamine** - muutke ja iteratiivselt täiustage, et see oleks teie oma!

Selle töötuba jooksul tutvustatakse teile ka põhjalikke arendusvahendeid ja töövooge, et aidata teil sujuvalt läbida oma arendusprotsessi algusest lõpuni.

| | | 
|:---|:---|
| **📚 Kursuse avaleht**| [AZD algajatele](../README.md)|
| **📖 Dokumentatsioon** | [AI mallide kasutuselevõtt](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Mallid** | [Microsoft Foundry mallid](https://ai.azure.com/templates) |
|**🚀 Järgmised sammud** | [Võta väljakutse vastu](#workshop-challenge) |
| | |

## Töötoa ülevaade

**Kestus:** 3-4 tundi  
**Tase:** Algaja kuni kesktase  
**Eeltingimused:** Tutvumine Azure, AI kontseptsioonide, VS Code ja käsurea tööriistadega.

See on praktiline töötuba, kus õpite tegevuste käigus. Pärast harjutuste lõpetamist soovitame üle vaadata AZD algajate õppekava, et jätkata õppimist turvalisuse ja produktiivsuse parimate tavade osas.

| Aeg| Moodul | Eesmärk |
|:---|:---|:---|
| 15 minutit | Sissejuhatus | Määrake lähtekoht, mõistke eesmärke |
| 30 minutit | AI malli valimine | Uurige võimalusi ja valige stardimall | 
| 30 minutit | AI malli valideerimine | Juurutage vaikimisi lahendus Azure'i |
| 30 minutit | AI malli lagundamine | Uurige struktuuri ja konfiguratsiooni |
| 30 minutit | AI malli konfigureerimine | Aktiveerige ja proovige saadaval olevaid funktsioone |
| 30 minutit | AI malli kohandamine | Kohandage malli vastavalt oma vajadustele |
| 30 minutit | Taristu kokkupaneku lõpetamine | Puhastage ja vabastage ressursid |
| 15 minutit | Kokkuvõte ja järgmised sammud | Õppevahendid, töötoa väljakutse |
| | |

## Mida õpite

Mõelge AZD mallile kui õpiliivakastile, kus saate avastada Microsoft Foundry lõpp-lõpuni arendamise erinevaid võimalusi ja tööriistu. Selle töötuba lõpuks peaks teil olema intuitiivne arusaam erinevatest tööriistadest ja kontseptsioonidest selles kontekstis.

| Kontseptsioon | Eesmärk |
|:---|:---|
| **Azure Developer CLI** | Mõista tööriista käske ja töövooge|
| **AZD mallid**| Mõista projekti struktuuri ja konfiguratsiooni|
| **Azure AI agent**| Microsoft Foundry projekti loomiseks ja juurutamiseks  |
| **Azure AI otsing**| Konteksti inseneri võimaldamine agentidega |
| **Jälgitavus**| Uurige jälgimist, monitooringut ja hindamist |
| **Punase meeskonna testimine**| Uurige vastaste testimist ja leevendusi |
| | |

## Töötoa moodulid

Valmis alustama? Liikuge töötoa moodulite vahel:

- [Moodul 1: AI malli valimine](instructions/1-Select-AI-Template.md)
- [Moodul 2: AI malli valideerimine](instructions/2-Validate-AI-Template.md) 
- [Moodul 3: AI malli lagundamine](instructions/3-Deconstruct-AI-Template.md)
- [Moodul 4: AI malli konfigureerimine](instructions/4-Configure-AI-Template.md)
- [Moodul 5: AI malli kohandamine](instructions/5-Customize-AI-Template.md)
- [Moodul 6: Taristu kokkupaneku lõpetamine](instructions/6-Teardown-Infrastructure.md)
- [Moodul 7: Kokkuvõte ja järgmised sammud](instructions/7-Wrap-up.md)

## Kas teil on tagasisidet?

Looge selle hoidla kohta probleem (märksõnaga `Workshop`) või liituge meiega [Discordis](https://aka.ms/foundry/discord) ja postitage meie `#get-help` kanalisse

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->