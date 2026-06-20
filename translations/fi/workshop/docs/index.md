# AZD AI-kehittäjien työpaja

> Vahvistettu versiolla `azd 1.25.6` kesäkuussa 2026.

> [!IMPORTANT]  
> **Tässä työpajassa on mukana opas, jonka voit esikatsella paikallisessa selaimessasi. Aloittaaksesi avaa repositorio GitHub Codespacesissa, dev containerissa tai paikallisessa kloonissa, jossa MkDocs on asennettuna—sitten odota kunnes näet aktiivisen VS Code -terminaalin ja kirjoita:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Näet ponnahdusikkunan, jolla voit avata esikatselusivun selaimessa.**

Tervetuloa käytännönläheiseen työpajaan, jossa opit Azure Developer CLI:tä (AZD) keskittyen AI-sovellusten käyttöönottoon. Tämä työpaja auttaa sinua saamaan käytännön ymmärryksen AZD-malleista kolmessa vaiheessa:

1. **Tutustuminen** - löydä sinulle sopiva malli.
1. **Käyttöönotto** - ota ratkaisu käyttöön ja varmista, että se toimii
1. **Mukauttaminen** - muokkaa ja iteroi tehdäksesi siitä oman!

Tämän työpajan aikana tutustut myös ydinkehitystyökaluihin ja työnkulkuihin, jotta voit tehostaa loppuun asti ulottuvaa kehitysprosessia.

| | | 
|:---|:---|
| **📚 Kurssin etusivu**| [AZD For Beginners](../README.md)|
| **📖 Dokumentaatio** | [Get started with AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI-mallit** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Seuraavat askeleet** | [Take The Challenge](#workshop-challenge) |
| | |

## Työpajan yleiskatsaus

**Kesto:** 3-4 tuntia  
**Taso:** Aloittelija–keskitaso  
**Esivaatimukset:** Tuntemus Azuresta, tekoälystä, VS Codesta ja komentorivityökaluista.

Tämä on käytännönläheinen työpaja, jossa opit tekemällä. Kun olet suorittanut harjoitukset, suosittelemme tutustumaan AZD For Beginners -sisältöön jatkaaksesi oppimista tietoturvaan ja tuottavuuteen liittyvissä parhaissa käytännöissä.

| Aika| Moduuli  | Tavoite |
|:---|:---|:---|
| 15 mins | Johdanto | Aseta lähtökohdat ja ymmärrä tavoitteet |
| 30 mins | Valitse AI-malli | Tutki vaihtoehtoja ja valitse lähtömalli | 
| 30 mins | Varmista AI-malli | Ota oletusratkaisu käyttöön Azureen |
| 30 mins | Pura AI-malli | Tutki rakennetta ja konfiguraatiota |
| 30 mins | Konfiguroi AI-malli | Aktivoi ja kokeile käytettävissä olevia ominaisuuksia |
| 30 mins | Mukauta AI-malli | Sovita malli tarpeisiisi |
| 30 mins | Infrastruktuurin purku | Siivoa ja vapauta resurssit |
| 15 mins | Yhteenveto & seuraavat askeleet | Oppimateriaalit, työpajahaaste |
| | |

## Mitä opit

Ajattele AZD-mallia oppimisalueena, jossa voit tutkia erilaisia ominaisuuksia ja työkaluja end-to-end -kehitykseen Microsoft Foundryssa. Tämän työpajan päätteeksi sinulla pitäisi olla intuitiivinen käsitys eri työkaluista ja käsitteistä tässä kontekstissa.

| Käsite  | Tavoite |
|:---|:---|
| **Azure Developer CLI** | Ymmärrä työkalun komennot ja työnkulut|
| **AZD Templates**| Ymmärrä projektin rakenne ja konfiguraatio|
| **Azure AI Agent**| Provisioi ja ota käyttöön Microsoft Foundry -projekti |
| **Azure AI Search**| Ota käyttöön kontekstin rakentaminen agenteilla |
| **Havaittavuus**| Tutustu jäljitykseen, valvontaan ja arviointeihin |
| **Red Teaming**| Tutustu hyökkäystestaukseen ja lieventämistoimiin |
| | |

## Työpajan moduulit

Valmiina aloittamaan? Siirry työpajan moduuleihin:

- [Moduuli 1: Valitse AI-malli](instructions/1-Select-AI-Template.md)
- [Moduuli 2: Varmista AI-malli](instructions/2-Validate-AI-Template.md) 
- [Moduuli 3: Pura AI-malli](instructions/3-Deconstruct-AI-Template.md)
- [Moduuli 4: Konfiguroi AI-malli](instructions/4-Configure-AI-Template.md)
- [Moduuli 5: Mukauta AI-malli](instructions/5-Customize-AI-Template.md)
- [Moduuli 6: Infrastruktuurin purku](instructions/6-Teardown-Infrastructure.md)
- [Moduuli 7: Yhteenveto & seuraavat askeleet](instructions/7-Wrap-up.md)

## Onko sinulla palautetta?

Lähetä issue tähän repositorioon (merkitse se `Workshop`) tai liity [Discordiin](https://aka.ms/foundry/discord) ja julkaise viesti kanavallemme `#get-help`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->