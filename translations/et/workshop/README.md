<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD tehisintellekti arendajatele töötuba
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Praktiline töötuba tehisintellekti rakenduste loomiseks Azure Developer CLI-ga.</strong><br>
      Läbitakse 7 moodulit, et valda AZD malle ja tehisintellekti juurutamise töövooge.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Viimati uuendatud: veebruar 2026
      </span>
    </div>
  </div>
</div>

# AZD tehisintellekti arendajatele töötuba

Tere tulemast praktilisse töötuppa, kus õpitakse Azure Developer CLI-d (AZD) keskendudes tehisintellekti rakenduste juurutamisele. See töötuba aitab teil omandada rakendusliku arusaama AZD mallidest 3 sammuga:

1. **Avastus** – leida endale sobiv mall.
1. **Juurutamine** – juurutada ja kinnitada, et see töötab.
1. **Kohandamine** – muuta ja täiustada, et sellest oma versioon teha!

Töötoa jooksul tutvustatakse ka põhiarendaja tööriistu ja töövooge, mis aitavad teil sujuvamaks muuta kogu oma arendusprotsessi.

<br/>

## Brauseripõhine juhend

Töötuba on üles ehitatud Markdowni õppetundidena. Neis saab otse GitHubis liikuda – või avada brauseripõhise eelvaate nagu alloleval ekraanipildil.

![Workshop](../../../translated_images/et/workshop.75906f133e6f8ba0.webp)

Selle valiku kasutamiseks – loo hoidlast oma koopia (fork) ja käivita GitHub Codespaces. Kui VS Code terminal avaneb, sisesta see käsk:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Mõne sekundi pärast kuvatakse hüpikdialoog. Vali valik `Open in browser`. Veebipõhine juhend avaneb nüüd uues brauseri vahekaardis. Selle eelvaate eelised:

1. **Sisseehitatud otsing** – leia märksõnu või õppetükke kiiresti.
1. **Kopeerimise ikoon** – liiku kursoriga koodiplokkide kohale, et näha seda valikut.
1. **Teema vahetamine** – vaheta tumeda ja heleda teema vahel.
1. **Abi saamine** – klõpsa jaluse Discord ikoonil, et liituda!

<br/>

## Töötoa ülevaade

**Kestus:** 3–4 tundi  
**Tase:** Algaja kuni kesktase  
**Eelteadmised:** Azure’i, tehisintellekti mõistete ning VS Code’i ja käsureatööriistade tundmine.

See on praktiline töötuba, kus õpitakse tegutsedes. Kui harjutused on tehtud, soovitame jätkamiseks vaadata üle AZD Algajate õppekava, et süvendada teadmisi turvalisusest ja tootlikusest.

| Aeg | Moodul | Eesmärk |
|:---|:---|:---|
| 15 min | [Sissejuhatus](docs/instructions/0-Introduction.md) | Rajada alust, mõista eesmärke |
| 30 min | [Vali AI mall](docs/instructions/1-Select-AI-Template.md) | Uurida võimalusi ja valida lähtepunkt | 
| 30 min | [Kinnita AI mall](docs/instructions/2-Validate-AI-Template.md) | Juurutada vaikelahendus Azure’i peale |
| 30 min | [Lagunda AI mall](docs/instructions/3-Deconstruct-AI-Template.md) | Uurida struktuuri ja seadistust |
| 30 min | [Konfigureeri AI mall](docs/instructions/4-Configure-AI-Template.md) | Aktiveerida ja proovida saadaval olevaid funktsioone |
| 30 min | [Kohanda AI mall](docs/instructions/5-Customize-AI-Template.md) | Kohandada mall vastavalt oma vajadustele |
| 30 min | [Läbi vaata infrastruktuur](docs/instructions/6-Teardown-Infrastructure.md) | Puhastada ja vabastada ressursid |
| 15 min | [Kokkuvõte ja järgmised sammud](docs/instructions/7-Wrap-up.md) | Õppematerjalid, töötoa väljakutse |

<br/>

## Mida sa õpid

Mõtle AZD mallile nagu õpiliivalauale, kus katsetada erinevaid võimalusi ja tööriistu Microsoft Foundry lõpp-lõpuni arenduse jaoks. Selle töötoa lõpuks peaks sul olema intuitiivne tunne erinevate tööriistade ja mõistete kohta selles kontekstis.

| Mõiste | Eesmärk |
|:---|:---|
| **Azure Developer CLI** | Mõista tööriista käske ja töövooge |
| **AZD mallid** | Mõista projekti struktuuri ja konfiguratsiooni |
| **Azure AI Agent** | Pakkuda ja juurutada Microsoft Foundry projekti |
| **Azure AI Search** | Võimaldada kontekstitöötlust agentidega |
| **Jälgitavus** | Uurida jälgimist, monitooringut ja hindamisi |
| **Red Teaming** | Uurida vastastikust testimist ja leevendusi |

<br/>

## Töötoa struktuur

Töötuba on üles ehitatud nii, et viib sind avastamisest juurutamise, lagundamise ja kohandamiseni – kasutades aluseks ametlikku [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) alustavat malli.

### [Moodul 1: Vali AI mall](docs/instructions/1-Select-AI-Template.md) (30 min)

- Mis on AI mallid?
- Kus paiknevad AI mallid?
- Kuidas alustada AI agentide ehitamist?
- **Labor:** Kiirkäivitus GitHub Codespaces-is

### [Moodul 2: Kinnita AI mall](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Mis on AI malli arhitektuur?
- Mis on AZD arendusprotsess?
- Kuidas saab AZD arenduses abi?
- **Labor:** AI agentide malli juurutamine ja kontrollimine

### [Moodul 3: Lagunda AI mall](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Uuri oma keskkonda kaustas `.azure/`
- Uuri oma ressursiseadeid kaustas `infra/`
- Uuri AZD konfiguratsiooni failides `azure.yaml`
- **Labor:** Muuda keskkonnamuutujaid ja juuruta uuesti

### [Moodul 4: Konfigureeri AI mall](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Uuri: Retrieval Augmented Generation
- Uuri: Agendi hindamine ja Red Teaming
- Uuri: Jälgimist ja monitooringut
- **Labor:** Uuri AI agenti + jälgitavust

### [Moodul 5: Kohanda AI mall](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Määratle: PRD stsenaariumi nõuetega
- Seadista: keskkonnamuutujad AZD jaoks
- Rakenda: elutsükli konksud lisatööde jaoks
- **Labor:** Kohanda mall oma stsenaariumi jaoks

### [Moodul 6: Lõpeta infrastruktuur](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Korrake: mis on AZD mallid?
- Korrake: miks kasutada Azure Developer CLI-d?
- Järgmised sammud: proovi teist malli!
- **Labor:** Tühjenda infrastruktuur ja puhasta

<br/>

## Töötoa väljakutse

Tahad end rohkem proovile panna? Siin on mõned projektisoovitused – või jaga oma ideid meiega!

| Projekt | Kirjeldus |
|:---|:---|
|1. **Lagunda keerukas AI mall** | Kasuta kirjeldatud töövoogu ja tööriistu ning proovi juurutada, kinnitada ja kohandada teist AI lahenduse malli. _Mida sa õppisid?_ |
|2. **Kohanda oma stsenaariumi järgi** | Proovi kirjutada PRD (tootenõuete dokument) teise stsenaariumi jaoks. Seejärel kasuta GitHub Copilotit oma malli hoidlas Agent Modelis ja palu tal töövoog kohandamiseks genereerida. _Mida sa õppisid? Kuidas saaksid neid soovitusi parandada?_ |
| | |

## Kas on tagasisidet?

1. Esita teema selles hoidlas – märgista see mugavuse huvides sildiga `Workshop`.
1. Liitu Microsoft Foundry Discordiga – suhtle oma kolleegidega!

| | | 
|:---|:---|
| **📚 Kursuse kodu** | [AZD Algajatele](../README.md) |
| **📖 Dokumentatsioon** | [Alusta AI mallidega](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) |
| **🛠️AI mallid** | [Microsoft Foundry mallid](https://ai.azure.com/templates) |
| **🚀 Järgmised sammud** | [Alusta töötuba](../../../workshop) |
| | |

<br/>

---

**Navigeerimine:** [Põhikursus](../README.md) | [Sissejuhatus](docs/instructions/0-Introduction.md) | [Moodul 1: Vali mall](docs/instructions/1-Select-AI-Template.md)

**Valmis alustama AI rakenduste ehitamist AZD-ga?**

[Alusta töötuba: Sissejuhatus →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest vabastamine**:
See dokument on tõlgitud kasutades tehisintellektil põhinevat tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame tagada täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle emakeeles tuleb pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta tõlke kasutamisest tingitud arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->