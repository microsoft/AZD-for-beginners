<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T16:20:27+00:00",
  "source_file": "workshop/README.md",
  "language_code": "lt"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Dirbtuvės kuriamos 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Šios dirbtuvės šiuo metu aktyviai kuriamos.</strong><br>
      Turinys gali būti neišsamus arba keistis. Grįžkite netrukus, kad pamatytumėte naujienas!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Paskutinį kartą atnaujinta: Spalis 2025
      </span>
    </div>
  </div>
</div>

# AZD dirbtuvės AI kūrėjams

Sveiki atvykę į praktines dirbtuves, skirtas išmokti naudotis Azure Developer CLI (AZD), akcentuojant AI programų diegimą. Šios dirbtuvės padės jums įgyti praktinį AZD šablonų supratimą per 3 žingsnius:

1. **Atranka** - suraskite jums tinkamą šabloną.
1. **Diegimas** - įdiekite ir patikrinkite, ar jis veikia.
1. **Pritaikymas** - modifikuokite ir pritaikykite jį sau!

Dirbtuvių metu taip pat susipažinsite su pagrindiniais kūrėjų įrankiais ir darbo procesais, kurie padės optimizuoti jūsų viso kūrimo kelionę.

<br/>

## Naršyklės pagrindu sukurtas vadovas

Dirbtuvių pamokos pateiktos Markdown formatu. Jas galite naršyti tiesiogiai GitHub arba paleisti naršyklės pagrindu sukurtą peržiūrą, kaip parodyta žemiau esančiame ekrano vaizde.

![Dirbtuvės](../../../translated_images/lt/workshop.75906f133e6f8ba0.png)

Norėdami naudotis šia galimybe - nukopijuokite sau šį saugyklą ir paleiskite GitHub Codespaces. Kai VS Code terminalas bus aktyvus, įveskite šią komandą:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Po kelių sekundžių pamatysite iššokantį dialogo langą. Pasirinkite parinktį `Atidaryti naršyklėje`. Naršyklės pagrindu sukurtas vadovas dabar atsidarys naujame naršyklės lange. Šios peržiūros privalumai:

1. **Integruota paieška** - greitai raskite raktinius žodžius ar pamokas.
1. **Kopijavimo piktograma** - užveskite pelės žymeklį ant kodo blokų, kad pamatytumėte šią parinktį.
1. **Temos perjungimas** - perjunkite tarp tamsios ir šviesios temos.
1. **Pagalba** - spustelėkite Discord piktogramą poraštėje, kad prisijungtumėte!

<br/>

## Dirbtuvių apžvalga

**Trukmė:** 3-4 valandos  
**Lygis:** Pradedantysis iki vidutinio lygio  
**Būtinos žinios:** Susipažinimas su Azure, AI koncepcijomis, VS Code ir komandų eilutės įrankiais.

Tai praktinės dirbtuvės, kuriose mokysitės veikdami. Baigę užduotis, rekomenduojame peržiūrėti AZD pradedantiesiems mokymo programą, kad tęstumėte mokymosi kelionę apie saugumo ir produktyvumo geriausias praktikas.

| Laikas | Modulis  | Tikslas |
|:---|:---|:---|
| 15 min | [Įvadas](docs/instructions/0-Introduction.md) | Nustatyti tikslus ir kontekstą |
| 30 min | [Pasirinkite AI šabloną](docs/instructions/1-Select-AI-Template.md) | Ištirkite galimybes ir pasirinkite pradžią | 
| 30 min | [Patvirtinkite AI šabloną](docs/instructions/2-Validate-AI-Template.md) | Įdiekite numatytąjį sprendimą į Azure |
| 30 min | [Dekonstruokite AI šabloną](docs/instructions/3-Deconstruct-AI-Template.md) | Ištirkite struktūrą ir konfigūraciją |
| 30 min | [Konfigūruokite AI šabloną](docs/instructions/4-Configure-AI-Template.md) | Aktyvuokite ir išbandykite galimas funkcijas |
| 30 min | [Pritaikykite AI šabloną](docs/instructions/5-Customize-AI-Template.md) | Pritaikykite šabloną savo poreikiams |
| 30 min | [Išardykite infrastruktūrą](docs/instructions/6-Teardown-Infrastructure.md) | Išvalykite ir atlaisvinkite išteklius |
| 15 min | [Apibendrinimas ir kiti žingsniai](docs/instructions/7-Wrap-up.md) | Mokymosi ištekliai, dirbtuvių iššūkis |

<br/>

## Ką išmoksite

AZD šabloną galite laikyti mokymosi smėlio dėže, kurioje tyrinėjate įvairias galimybes ir įrankius, skirtus visapusiškam kūrimui Azure AI Foundry platformoje. Baigę dirbtuves, turėtumėte intuityviai suprasti įvairius įrankius ir koncepcijas šiame kontekste.

| Koncepcija  | Tikslas |
|:---|:---|
| **Azure Developer CLI** | Suprasti įrankio komandas ir darbo eigas |
| **AZD šablonai**| Suprasti projekto struktūrą ir konfigūraciją |
| **Azure AI agentas**| Paruošti ir įdiegti Azure AI Foundry projektą |
| **Azure AI paieška**| Įgalinti konteksto inžineriją su agentais |
| **Stebėjimas**| Ištirti sekimą, stebėjimą ir vertinimus |
| **Raudonųjų komandų testavimas**| Ištirti priešiškus testus ir jų sprendimus |

<br/>

## Dirbtuvių struktūra

Dirbtuvės struktūruotos taip, kad nuvestų jus nuo šablono atradimo iki diegimo, dekonstruavimo ir pritaikymo, naudojant oficialų [Pradėti su AI agentais](https://github.com/Azure-Samples/get-started-with-ai-agents) pradinį šabloną kaip pagrindą.

### [1 modulis: Pasirinkite AI šabloną](docs/instructions/1-Select-AI-Template.md) (30 min)

- Kas yra AI šablonai?
- Kur galima rasti AI šablonus?
- Kaip pradėti kurti AI agentus?
- **Laboratorija**: Greitas startas su GitHub Codespaces

### [2 modulis: Patvirtinkite AI šabloną](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Kas yra AI šablono architektūra?
- Kas yra AZD kūrimo darbo eiga?
- Kaip gauti pagalbos su AZD kūrimu?
- **Laboratorija**: Įdiekite ir patvirtinkite AI agentų šabloną

### [3 modulis: Dekonstruokite AI šabloną](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Ištirkite aplinką `.azure/` 
- Ištirkite išteklių nustatymus `infra/` 
- Ištirkite AZD konfigūraciją `azure.yaml`s
- **Laboratorija**: Modifikuokite aplinkos kintamuosius ir iš naujo įdiekite

### [4 modulis: Konfigūruokite AI šabloną](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Ištirkite: Retrieval Augmented Generation
- Ištirkite: Agentų vertinimą ir raudonųjų komandų testavimą
- Ištirkite: Sekimą ir stebėjimą
- **Laboratorija**: Ištirkite AI agentą + stebėjimą 

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
|2. **Pritaikykite savo scenarijui**  | Pabandykite parašyti PRD (Produkto reikalavimų dokumentą) kitam scenarijui. Tada naudokite GitHub Copilot savo šablono saugykloje Agent Model režimu - ir paprašykite jo sugeneruoti pritaikymo darbo eigą jums. _Ką išmokote? Kaip galėtumėte patobulinti šiuos pasiūlymus?_|
| | |

## Turite atsiliepimų?

1. Pateikite problemą šiame saugykloje - pažymėkite ją `Workshop`, kad būtų patogiau.
1. Prisijunkite prie Azure AI Foundry Discord - susisiekite su kolegomis!


| | | 
|:---|:---|
| **📚 Kurso pradžia**| [AZD pradedantiesiems](../README.md)|
| **📖 Dokumentacija** | [Pradėti su AI šablonais](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI šablonai** | [Azure AI Foundry šablonai](https://ai.azure.com/templates) |
|**🚀 Kiti žingsniai** | [Priimkite iššūkį](../../../workshop) |
| | |

<br/>

---

**Ankstesnis:** [AI trikčių šalinimo vadovas](../docs/troubleshooting/ai-troubleshooting.md) | **Kitas:** Pradėkite nuo [Laboratorija 1: AZD pagrindai](../../../workshop/lab-1-azd-basics)

**Pasiruošę pradėti kurti AI programas su AZD?**

[Pradėkite Laboratoriją 1: AZD pagrindai →](./lab-1-azd-basics/README.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.