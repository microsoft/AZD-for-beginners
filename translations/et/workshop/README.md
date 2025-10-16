<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T16:24:24+00:00",
  "source_file": "workshop/README.md",
  "language_code": "et"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Töötuba on ehitamisel 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>See töötuba on hetkel aktiivses arenduses.</strong><br>
      Sisu võib olla puudulik või muutuda. Tule varsti tagasi, et näha uuendusi!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Viimati uuendatud: oktoober 2025
      </span>
    </div>
  </div>
</div>

# AZD töötuba AI arendajatele

Tere tulemast praktilisse töötuppa, kus õpitakse Azure Developer CLI (AZD) kasutamist, keskendudes AI rakenduste juurutamisele. See töötuba aitab teil omandada praktilise arusaama AZD mallidest 3 sammuga:

1. **Avastamine** - leia endale sobiv mall.
1. **Juurutamine** - juuruta ja veendu, et see töötab.
1. **Kohandamine** - muuda ja arenda, et see vastaks sinu vajadustele!

Töötoa käigus tutvustatakse ka peamisi arendustööriistu ja töövooge, mis aitavad teil sujuvamaks muuta kogu arendusprotsessi.

<br/>

## Brauseripõhine juhend

Töötoa materjalid on Markdown formaadis. Saate neid otse GitHubis sirvida või avada brauseripõhise eelvaate, nagu alloleval ekraanipildil näidatud.

![Töötuba](../../../translated_images/workshop.75906f133e6f8ba07ab0302ce17f67ff90f357513f3d4c4bbafa5978b10f058b.et.png)

Selle valiku kasutamiseks - tehke repositooriumist oma profiilile fork ja avage GitHub Codespaces. Kui VS Code terminal on aktiivne, sisestage järgmine käsk:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Mõne sekundi pärast ilmub hüpikaken. Valige valik `Open in browser`. Veebipõhine juhend avaneb nüüd uues brauseri vahekaardis. Selle eelvaate eelised:

1. **Sisseehitatud otsing** - leidke märksõnu või õppetunde kiiresti.
1. **Kopeerimise ikoon** - liikuge koodiplokkide kohale, et näha seda valikut.
1. **Teema vahetus** - lülitage tumeda ja heleda teema vahel.
1. **Abi saamine** - klõpsake jaluses Discordi ikooni, et liituda!

<br/>

## Töötoa ülevaade

**Kestus:** 3-4 tundi  
**Tase:** Algaja kuni kesktase  
**Eeldused:** Azure'i, AI kontseptsioonide, VS Code'i ja käsurea tööriistade tundmine.

See on praktiline töötuba, kus õpitakse läbi tegevuse. Kui olete harjutused lõpetanud, soovitame tutvuda AZD algajatele mõeldud õppekavaga, et jätkata oma õppe teekonda turvalisuse ja produktiivsuse parimate praktikate suunas.

| Aeg | Moodul  | Eesmärk |
|:---|:---|:---|
| 15 min | [Sissejuhatus](docs/instructions/0-Introduction.md) | Seadke eesmärgid, mõistke sihte |
| 30 min | [AI malli valimine](docs/instructions/1-Select-AI-Template.md) | Uurige võimalusi ja valige alustamiseks mall | 
| 30 min | [AI malli valideerimine](docs/instructions/2-Validate-AI-Template.md) | Juurutage vaikimisi lahendus Azure'i |
| 30 min | [AI malli lahtivõtmine](docs/instructions/3-Deconstruct-AI-Template.md) | Uurige struktuuri ja konfiguratsiooni |
| 30 min | [AI malli seadistamine](docs/instructions/4-Configure-AI-Template.md) | Aktiveerige ja proovige saadaolevaid funktsioone |
| 30 min | [AI malli kohandamine](docs/instructions/5-Customize-AI-Template.md) | Kohandage mall vastavalt oma vajadustele |
| 30 min | [Infrastruktuuri eemaldamine](docs/instructions/6-Teardown-Infrastructure.md) | Puhastage ja vabastage ressursid |
| 15 min | [Kokkuvõte ja järgmised sammud](docs/instructions/7-Wrap-up.md) | Õppematerjalid, töötoa väljakutse |

<br/>

## Mida õpid

Mõtle AZD mallist kui õppimise liivakastist, kus uurida erinevaid võimalusi ja tööriistu Azure AI Foundry arenduse jaoks. Töötoa lõpuks peaks sul olema intuitiivne arusaam erinevatest tööriistadest ja kontseptsioonidest selles kontekstis.

| Kontseptsioon  | Eesmärk |
|:---|:---|
| **Azure Developer CLI** | Mõista tööriista käske ja töövooge |
| **AZD mallid**| Mõista projekti struktuuri ja konfiguratsiooni |
| **Azure AI Agent**| Azure AI Foundry projekti ettevalmistamine ja juurutamine |
| **Azure AI Search**| Konteksti inseneri võimaldamine agentidega |
| **Jälgitavus**| Uurige jälgimist, monitooringut ja hindamisi |
| **Punane meeskond**| Uurige vastase testimist ja leevendusi |

<br/>

## Töötoa struktuur

Töötuba on üles ehitatud viisil, mis viib teid teekonnale alates malli avastamisest kuni juurutamise, lahtivõtmise ja kohandamiseni - kasutades ametlikku [AI agentidega alustamise](https://github.com/Azure-Samples/get-started-with-ai-agents) algusmalli.

### [Moodul 1: AI malli valimine](docs/instructions/1-Select-AI-Template.md) (30 min)

- Mis on AI mallid?
- Kust leida AI malle?
- Kuidas alustada AI agentide loomist?
- **Labor:** Kiirstart GitHub Codespaces'iga

### [Moodul 2: AI malli valideerimine](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Mis on AI malli arhitektuur?
- Mis on AZD arenduse töövoog?
- Kuidas saada abi AZD arendusega?
- **Labor:** Juurutage ja valideerige AI agentide mall

### [Moodul 3: AI malli lahtivõtmine](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Uurige oma keskkonda `.azure/` kaustas
- Uurige oma ressursside seadistust `infra/` kaustas
- Uurige oma AZD konfiguratsiooni `azure.yaml` failides
- **Labor:** Muutke keskkonnamuutujaid ja juurutage uuesti

### [Moodul 4: AI malli seadistamine](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Uurige: Retrieval Augmented Generation
- Uurige: Agentide hindamine ja punane meeskond
- Uurige: Jälgimine ja monitooring
- **Labor:** Uurige AI agenti + jälgitavust 

### [Moodul 5: AI malli kohandamine](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Määratlege: PRD koos stsenaariumi nõuetega
- Seadistage: Keskkonnamuutujad AZD jaoks
- Rakendage: Elutsükli konksud lisatööde jaoks
- **Labor:** Kohandage mall oma stsenaariumi jaoks

### [Moodul 6: Infrastruktuuri eemaldamine](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Kokkuvõte: Mis on AZD mallid?
- Kokkuvõte: Miks kasutada Azure Developer CLI-d?
- Järgmised sammud: Proovige teist malli!
- **Labor:** Eemaldage infrastruktuur ja puhastage

<br/>

## Töötoa väljakutse

Kas soovite end rohkem proovile panna? Siin on mõned projektiideed - või jagage oma ideid meiega!!

| Projekt | Kirjeldus |
|:---|:---|
|1. **Kompleksse AI malli lahtivõtmine** | Kasutage töövoogu ja tööriistu, mida me kirjeldasime, ning proovige juurutada, valideerida ja kohandada teist AI lahenduse malli. _Mida õppisite?_|
|2. **Kohandamine oma stsenaariumiga**  | Proovige kirjutada PRD (tootenõuete dokument) teise stsenaariumi jaoks. Seejärel kasutage GitHub Copilotit oma malli repositooriumis Agent Modelis - ja paluge sellel genereerida kohandamise töövoog teie jaoks. _Mida õppisite? Kuidas saaksite neid ettepanekuid täiustada?_|
| | |

## Tagasiside?

1. Postitage probleem selle repositooriumi kohta - lisage sildiks `Workshop`, et oleks mugavam.
1. Liituge Azure AI Foundry Discordiga - ühenduge oma eakaaslastega!


| | | 
|:---|:---|
| **📚 Kursuse avaleht**| [AZD algajatele](../README.md)|
| **📖 Dokumentatsioon** | [AI mallidega alustamine](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI mallid** | [Azure AI Foundry mallid](https://ai.azure.com/templates) |
|**🚀 Järgmised sammud** | [Võtke väljakutse vastu](../../../workshop) |
| | |

<br/>

---

**Eelmine:** [AI tõrkeotsingu juhend](../docs/troubleshooting/ai-troubleshooting.md) | **Järgmine:** Alustage [Labor 1: AZD põhialused](../../../workshop/lab-1-azd-basics)

**Kas olete valmis alustama AI rakenduste loomist AZD-ga?**

[Alustage Labor 1: AZD põhialused →](./lab-1-azd-basics/README.md)

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.