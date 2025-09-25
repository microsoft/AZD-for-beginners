<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9cc966416ab431c38b2ab863884b196c",
  "translation_date": "2025-09-25T01:54:44+00:00",
  "source_file": "workshop/README.md",
  "language_code": "lt"
}
-->
# AZD dirbtinio intelekto kūrėjų dirbtuvės

Sveiki atvykę į praktines dirbtuves, skirtas išmokti naudotis Azure Developer CLI (AZD) su pagrindiniu dėmesiu dirbtinio intelekto programų diegimui. Šios dirbtuvės padės jums įgyti praktinių žinių apie AZD šablonus per 3 žingsnius:

1. **Atranka** - suraskite jums tinkamiausią šabloną.
1. **Diegimas** - įdiekite ir patikrinkite, ar jis veikia.
1. **Pritaikymas** - modifikuokite ir pritaikykite jį savo poreikiams!

Dirbtuvių metu taip pat susipažinsite su pagrindiniais kūrėjų įrankiais ir darbo procesais, kurie padės optimizuoti jūsų visapusišką kūrimo kelionę.

<br/>

## Naršyklės pagrindu sukurtas vadovas

Dirbtuvių pamokos pateiktos Markdown formatu. Jas galite peržiūrėti tiesiogiai GitHub arba paleisti naršyklės pagrindu sukurtą peržiūrą, kaip parodyta žemiau esančiame ekrano vaizde.

![Dirbtuvės](../../../translated_images/workshop.75906f133e6f8ba07ab0302ce17f67ff90f357513f3d4c4bbafa5978b10f058b.lt.png)

Norėdami naudotis šia galimybe, nukopijuokite sau šį repozitoriją ir paleiskite GitHub Codespaces. Kai VS Code terminalas bus aktyvus, įveskite šią komandą:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Po kelių sekundžių pamatysite iššokantį dialogo langą. Pasirinkite parinktį `Open in browser`. Naršyklės pagrindu sukurtas vadovas atsidarys naujame naršyklės lange. Šios peržiūros privalumai:

1. **Integruota paieška** - greitai raskite raktinius žodžius ar pamokas.
1. **Kopijavimo piktograma** - užveskite pelės žymeklį virš kodo blokų, kad pamatytumėte šią parinktį.
1. **Temos perjungimas** - perjunkite tamsią ir šviesią temas.
1. **Pagalba** - spustelėkite Discord piktogramą apačioje, kad prisijungtumėte!

<br/>

## Dirbtuvių apžvalga

**Trukmė:** 3-4 valandos  
**Lygis:** Pradedantysis iki vidutinio lygio  
**Būtinos žinios:** Susipažinimas su Azure, dirbtinio intelekto koncepcijomis, VS Code ir komandų eilutės įrankiais.

Tai praktinės dirbtuvės, kuriose mokomasi per praktiką. Baigę užduotis, rekomenduojame peržiūrėti AZD pradedantiesiems mokymo programą, kad tęstumėte mokymosi kelionę apie saugumo ir produktyvumo geriausias praktikas.

| Laikas | Modulis  | Tikslas |
|:---|:---|:---|
| 15 min | [Įvadas](docs/instructions/0-Introduction.md) | Nustatyti tikslus ir suprasti užduotis |
| 30 min | [Pasirinkite AI šabloną](docs/instructions/1-Select-AI-Template.md) | Ištyrinėkite galimybes ir pasirinkite pradinį šabloną | 
| 30 min | [Patvirtinkite AI šabloną](docs/instructions/2-Validate-AI-Template.md) | Įdiekite numatytąjį sprendimą į Azure |
| 30 min | [Dekonstruokite AI šabloną](docs/instructions/3-Deconstruct-AI-Template.md) | Ištyrinėkite struktūrą ir konfigūraciją |
| 30 min | [Konfigūruokite AI šabloną](docs/instructions/4-Configure-AI-Template.md) | Aktyvuokite ir išbandykite galimas funkcijas |
| 30 min | [Pritaikykite AI šabloną](docs/instructions/5-Customize-AI-Template.md) | Pritaikykite šabloną savo poreikiams |
| 30 min | [Išardykite infrastruktūrą](docs/instructions/6-Teardown-Infrastructure.md) | Išvalykite ir atlaisvinkite išteklius |
| 15 min | [Apibendrinimas ir kiti žingsniai](docs/instructions/7-Wrap-up.md) | Mokymosi ištekliai, dirbtuvių iššūkis |

<br/>

## Ką išmoksite

AZD šabloną galite laikyti mokymosi smėlio dėže, kurioje tyrinėjate įvairias galimybes ir įrankius, skirtus visapusiškam kūrimui Azure AI Foundry aplinkoje. Baigę dirbtuves, turėtumėte intuityviai suprasti įvairius įrankius ir koncepcijas šiame kontekste.

| Koncepcija  | Tikslas |
|:---|:---|
| **Azure Developer CLI** | Suprasti įrankio komandas ir darbo eigą |
| **AZD šablonai**| Suprasti projekto struktūrą ir konfigūraciją |
| **Azure AI Agentas**| Paruošti ir įdiegti Azure AI Foundry projektą |
| **Azure AI Paieška**| Įgalinti konteksto inžineriją su agentais |
| **Stebėjimas**| Tyrinėti sekimą, stebėjimą ir vertinimus |
| **Raudonosios komandos testavimas**| Tyrinėti priešiškus testus ir jų sprendimus |

<br/>

## Dirbtuvių struktūra

Dirbtuvės struktūruotos taip, kad nuvestų jus nuo šablono atrankos iki diegimo, dekonstruavimo ir pritaikymo, naudojant oficialų [Pradėti su AI agentais](https://github.com/Azure-Samples/get-started-with-ai-agents) pradinį šabloną kaip pagrindą.

### [1 modulis: Pasirinkite AI šabloną](docs/instructions/1-Select-AI-Template.md) (30 min)

- Kas yra AI šablonai?
- Kur galima rasti AI šablonus?
- Kaip pradėti kurti AI agentus?
- **Laboratorija**: Greitas startas su GitHub Codespaces

### [2 modulis: Patvirtinkite AI šabloną](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Kas yra AI šablono architektūra?
- Kas yra AZD kūrimo darbo eiga?
- Kaip gauti pagalbą su AZD kūrimu?
- **Laboratorija**: Įdiekite ir patvirtinkite AI agentų šabloną

### [3 modulis: Dekonstruokite AI šabloną](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Ištyrinėkite aplinką `.azure/` 
- Ištyrinėkite išteklių nustatymus `infra/` 
- Ištyrinėkite AZD konfigūraciją `azure.yaml` failuose
- **Laboratorija**: Modifikuokite aplinkos kintamuosius ir iš naujo įdiekite

### [4 modulis: Konfigūruokite AI šabloną](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Tyrinėkite: Informacijos paieškos sustiprintą generavimą
- Tyrinėkite: Agentų vertinimą ir raudonosios komandos testavimą
- Tyrinėkite: Sekimą ir stebėjimą
- **Laboratorija**: Tyrinėkite AI agentą + stebėjimą

### [5 modulis: Pritaikykite AI šabloną](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Apibrėžkite: PRD su scenarijaus reikalavimais
- Konfigūruokite: Aplinkos kintamuosius AZD
- Įgyvendinkite: Gyvavimo ciklo kabliukus papildomoms užduotims
- **Laboratorija**: Pritaikykite šabloną savo scenarijui

### [6 modulis: Išardykite infrastruktūrą](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Apibendrinkite: Kas yra AZD šablonai?
- Apibendrinkite: Kodėl naudoti Azure Developer CLI?
- Kiti žingsniai: Išbandykite kitą šabloną!
- **Laboratorija**: Išardykite infrastruktūrą ir išvalykite

<br/>

## Dirbtuvių iššūkis

Norite išbandyti save ir padaryti daugiau? Štai keletas projekto pasiūlymų - arba pasidalinkite savo idėjomis su mumis!!

| Projektas | Aprašymas |
|:---|:---|
|1. **Dekonstruokite sudėtingą AI šabloną** | Naudokite mūsų aprašytą darbo eigą ir įrankius, kad įdiegtumėte, patvirtintumėte ir pritaikytumėte kitą AI sprendimo šabloną. _Ką išmokote?_|
|2. **Pritaikykite savo scenarijui**  | Pabandykite parašyti PRD (Produkto reikalavimų dokumentą) kitam scenarijui. Tada naudokite GitHub Copilot savo šablono repozitorijoje Agent Model režimu ir paprašykite, kad jis sugeneruotų pritaikymo darbo eigą jums. _Ką išmokote? Kaip galėtumėte patobulinti šiuos pasiūlymus?_|
| | |

## Turite atsiliepimų?

1. Pateikite problemą šiame repozitorijoje - pažymėkite ją `Workshop` patogumui.
1. Prisijunkite prie Azure AI Foundry Discord - susisiekite su kolegomis!

| | | 
|:---|:---|
| **📚 Kurso pradžia**| [AZD pradedantiesiems](../README.md)|
| **📖 Dokumentacija** | [Pradėkite su AI šablonais](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI šablonai** | [Azure AI Foundry šablonai](https://ai.azure.com/templates) |
|**🚀 Kiti žingsniai** | [Priimkite iššūkį](../../../workshop) |
| | |

<br/>

---

**Ankstesnis:** [AI trikčių šalinimo vadovas](../docs/troubleshooting/ai-troubleshooting.md) | **Kitas:** Pradėkite nuo [1 laboratorijos: AZD pagrindai](../../../workshop/lab-1-azd-basics)

**Pasiruošę pradėti kurti dirbtinio intelekto programas su AZD?**

[Pradėkite 1 laboratoriją: AZD pagrindai →](./lab-1-azd-basics/README.md)

---

