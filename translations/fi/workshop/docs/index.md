# AZD tekoälykehittäjien työpaja

> Varmennettu versiolla `azd 1.23.12` maaliskuussa 2026.
> 
> [!IMPORTANT]  
> **Tämä työpaja sisältää työpajaoppaan, jonka voit esikatsella paikallisessa selaimessasi. Aloittaaksesi avaa repositorio GitHub Codespacesissa, dev containerissa tai paikallisessa kloonissa, jossa MkDocs on asennettuna — odota, kunnes näet aktiivisen VS Code -terminaalin ja kirjoita:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Sinulle pitäisi tulla ponnahdusikkuna, jonka kautta voit avata esikatselusivun selaimessa.**

Tervetuloa käytännön työpajaan Azure Developer CLI:n (AZD) opiskeluun, keskittyen tekoälysovellusten käyttöönottoon. Tässä työpajassa opit käytännönläheisesti AZD-mallipohjien käytön kolmessa vaiheessa:

1. **Löytäminen** - löydä sinulle sopiva malli.
1. **Käyttöönotto** - ota käyttöön ja varmista, että se toimii
1. **Mukauttaminen** - muokkaa ja iteroi, jotta siitä tulee sinun!

Tämän työpajan aikana tutustut myös keskeisiin kehittäjätyökaluihin ja työnkulkuihin, jotka auttavat virtaviivaistamaan koko kehitysprosessiasi.

| | | 
|:---|:---|
| **📚 Kurssin etusivu**| [AZD For Beginners](../README.md)|
| **📖 Dokumentaatio** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI-mallit** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Seuraavat askeleet** | [Ota haaste vastaan](#workshop-challenge) |
| | |

## Työpajan yleiskatsaus

**Kesto:** 3-4 tuntia  
**Taso:** Aloittelijasta keskitasolle  
**Edellytykset:** Perusymmärrys Azuresta, tekoälyn käsitteistä, VS Codesta ja komentorivityökaluista.

Tämä on käytännönläheinen työpaja, jossa opit tekemällä. Kun olet suorittanut harjoitukset, suosittelemme tarkastelemaan AZD For Beginners -oppimäärää jatkaaksesi oppimismatkaa kohti tietoturvaa ja tuottavuutta koskevia parhaita käytäntöjä.

| Aika| Moduuli  | Tavoite |
|:---|:---|:---|
| 15 min | Johdanto | Määrittele lähtökohdat, ymmärrä tavoitteet |
| 30 min | Valitse AI-malli | Tutustu vaihtoehtoihin ja valitse lähtömalli | 
| 30 min | Vahvista AI-malli | Ota oletusratkaisu käyttöön Azureen |
| 30 min | Pura AI-malli | Tutki rakennetta ja konfiguraatioita |
| 30 min | Konfiguroi AI-malli | Ota käyttöön ja kokeile saatavilla olevia ominaisuuksia |
| 30 min | Mukauta AI-malli | Muokkaa mallia omiin tarpeisiisi |
| 30 min | Poista infrastruktuuri | Siivoa ja vapauta resurssit |
| 15 min | Yhteenveto & seuraavat askeleet | Oppimateriaalit, työpajan haaste |
| | |

## Mitä opit

Ajattele AZD-mallipohjaa oppimisalueena, jossa voit kokeilla erilaisia ominaisuuksia ja työkaluja end-to-end-kehitykseen Microsoft Foundryssa. Työpajan loppuun mennessä sinulla pitäisi olla intuitiivinen käsitys tähän kontekstiin liittyvistä työkaluista ja käsitteistä.

| Käsite  | Tavoite |
|:---|:---|
| **Azure Developer CLI** | Ymmärrä työkalun komennot ja työnkulut|
| **AZD Templates**| Ymmärrä projektirakenne ja konfiguraatio|
| **Azure AI Agent**| Provisionoi ja ota käyttöön Microsoft Foundry -projekti  |
| **Azure AI Search**| Mahdollistaa kontekstinhallinnan agenteilla |
| **Observability**| Tutustu jäljitykseen, valvontaan ja arviointeihin |
| **Red Teaming**| Tutustu hyökkäävään testaukseen ja lieventämiskeinoihin |
| | |

## Työpajan moduulit

Valmiina aloittamaan? Siirry työpajan moduuleihin:

- [Moduuli 1: Valitse AI-malli](instructions/1-Select-AI-Template.md)
- [Moduuli 2: Vahvista AI-malli](instructions/2-Validate-AI-Template.md) 
- [Moduuli 3: Pura AI-malli](instructions/3-Deconstruct-AI-Template.md)
- [Moduuli 4: Konfiguroi AI-malli](instructions/4-Configure-AI-Template.md)
- [Moduuli 5: Mukauta AI-malli](instructions/5-Customize-AI-Template.md)
- [Moduuli 6: Poista infrastruktuuri](instructions/6-Teardown-Infrastructure.md)
- [Moduuli 7: Yhteenveto & seuraavat askeleet](instructions/7-Wrap-up.md)

## Palautetta?

Luo issue tässä repossa (merkitse se tunnisteella `Workshop`) tai liity [Discord](https://aka.ms/foundry/discord)-yhteisöömme ja julkaise viesti `#get-help`-kanavalle

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automatisoiduissa käännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisessä kielessä tulisi pitää määräävänä lähteenä. Kriittisten tietojen osalta suosittelemme ammattimaista ihmiskäännöstä. Emme ole vastuussa mahdollisista väärinymmärryksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->