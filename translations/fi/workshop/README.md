<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD tekoälykehittäjille -työpaja
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Käytännönläheinen työpaja AI-sovellusten rakentamiseen Azure Developer CLI:llä.</strong><br>
      Suorita 7 moduulia hallitaksesi AZD-malleja ja tekoälyn käyttöönoton työnkulkuja.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Viimeksi päivitetty: helmikuu 2026
      </span>
    </div>
  </div>
</div>

# AZD tekoälykehittäjille -työpaja

Tervetuloa käytännönläheiseen työpajaan, jossa opit Azure Developer CLI:tä (AZD) keskittyen tekoälysovellusten käyttöönottoon. Tämä työpaja auttaa sinua saamaan käytännön ymmärryksen AZD-malleista kolmessa vaiheessa:

1. **Tutustuminen** - löydä sinulle sopiva malli.
1. **Käyttöönotto** - ota käyttöön ja varmista, että se toimii
1. **Mukauttaminen** - muokkaa ja tee siitä omasi!

Kursin aikana tutustut myös keskeisiin kehittäjätyökaluihin ja työnkulkuihin, jotka auttavat virtaviivaistamaan koko kehitysprosessiasi.

<br/>

## Selainpohjainen opas

Työpajan oppitunnit ovat Markdown-muodossa. Voit selata niitä suoraan GitHubissa - tai käynnistää selaimessa toimivan esikatselun kuten kuvakaappauksessa on esitetty.

![Työpaja](../../../translated_images/fi/workshop.75906f133e6f8ba0.webp)

Käyttääksesi tätä vaihtoehtoa - tee fork repositoriosta omaan profiiliisi ja käynnistä GitHub Codespaces. Kun VS Code -terminaali on aktiivinen, kirjoita tämä komento:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Muutaman sekunnin kuluttua näet ponnahdusikkunan. Valitse vaihtoehto `Avaa selaimessa`. Selainpohjainen opas avautuu nyt uuteen selaimen välilehteen. Tämän esikatselun etuja:

1. **Sisäänrakennettu haku** - löydä avainsanoja tai oppitunteja nopeasti.
1. **Kopiointikuvake** - vie hiiri koodilohkojen päälle nähdäksesi tämän vaihtoehdon
1. **Teematila** - vaihda tumman ja vaalean teeman välillä
1. **Hanki apua** - klikkaa Discord-kuvaketta alatunnisteessa liittyäksesi!

<br/>

## Työpajan yleiskatsaus

**Kesto:** 3-4 tuntia  
**Taso:** Aloittelijasta keskitasolle  
**Esivaatimukset:** Tuntemus Azuresta, tekoälykonsepteista, VS Code -työkalusta ja komentorivityökaluista.

Tämä on käytännönläheinen työpaja, jossa opit tekemällä. Kun olet suorittanut harjoitukset, suosittelemme tutustumaan AZD For Beginners -opetussuunnitelmaan jatkaaksesi oppimista tietoturvan ja tuottavuuden parhaiden käytäntöjen parissa.

| Aika| Moduuli  | Tavoite |
|:---|:---|:---|
| 15 mins | [Johdanto](docs/instructions/0-Introduction.md) | Aseta lähtökohdat, ymmärrä tavoitteet |
| 30 mins | [Valitse AI-malli](docs/instructions/1-Select-AI-Template.md) | Tutki vaihtoehtoja ja valitse lähtömalli | 
| 30 mins | [Varmista AI-malli](docs/instructions/2-Validate-AI-Template.md) | Ota oletusratkaisu käyttöön Azureen |
| 30 mins | [Pura AI-malli](docs/instructions/3-Deconstruct-AI-Template.md) | Tutki rakennetta ja määrityksiä |
| 30 mins | [Määritä AI-malli](docs/instructions/4-Configure-AI-Template.md) | Ota käyttöön ja kokeile saatavilla olevia ominaisuuksia |
| 30 mins | [Mukauta AI-malli](docs/instructions/5-Customize-AI-Template.md) | Sovita malli tarpeisiisi |
| 30 mins | [Pura infrastruktuuri](docs/instructions/6-Teardown-Infrastructure.md) | Siivoa ja vapauta resurssit |
| 15 mins | [Yhteenveto & seuraavat askeleet](docs/instructions/7-Wrap-up.md) | Oppimisresurssit, työpajan haaste |

<br/>

## Mitä opit

Ajattele AZD-mallia oppimisalueena, jossa voit tutkia erilaisia ominaisuuksia ja työkaluja Microsoft Foundry -ympäristössä koko kehitysprosessin ajan. Työpajan lopussa sinulla pitäisi olla intuitiivinen käsitys eri työkaluista ja käsitteistä tässä kontekstissa.

| Käsite  | Tavoite |
|:---|:---|
| **Azure Developer CLI** | Ymmärrä työkalun komennot ja työnkulut|
| **AZD Templates**| Ymmärrä projektin rakenne ja määritykset|
| **Azure AI Agent**| Provisionoi ja ota käyttöön Microsoft Foundry -projekti |
| **Azure AI Search**| Ota käyttöön kontekstin rakentaminen agenttien avulla |
| **Observability**| Tutki jäljitystä, valvontaa ja arviointeja |
| **Red Teaming**| Tutki hyökkäystestausta ja lieventämiskeinoja |

<br/>

## Työpajan rakenne

Työpaja on rakennettu viemään sinut matkalle mallin löytämisestä käyttöönottoon, purkamiseen ja mukauttamiseen - käyttäen virallista [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) -aloitusmallia pohjana.

### [Moduuli 1: Valitse AI-malli](docs/instructions/1-Select-AI-Template.md) (30 mins)

- Mitä AI-mallit ovat?
- Mistä löydän AI-malleja?
- Miten pääsen alkuun AI-agenttien rakentamisessa?
- **Lab**: Nopean aloituksen GitHub Codespacesilla

### [Moduuli 2: Varmista AI-malli](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- Mikä on AI-mallin arkkitehtuuri?
- Mikä on AZD-kehitystyönkulku?
- Mistä saan apua AZD-kehitykseen?
- **Lab**: Ota käyttöön ja varmista AI-agenttien malli

### [Moduuli 3: Pura AI-malli](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Tutki ympäristöäsi kansiossa `.azure/` 
- Tutki resurssiasetuksiasi kansiossa `infra/` 
- Tutki AZD-määritystäsi `azure.yaml`s-tiedostoissa
- **Lab**: Muokkaa ympäristömuuttujia & ota uudelleen käyttöön

### [Moduuli 4: Määritä AI-malli](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Tutki: Retrieval Augmented Generation
- Tutki: Agenttien arviointi & Red Teaming
- Tutki: Jäljittäminen & Valvonta
- **Lab**: Tutki AI-agenttia + havaittavuutta 

### [Moduuli 5: Mukauta AI-malli](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Määrittele: PRD skenaariovaatimuksineen
- Määritä: Ympäristömuuttujat AZD:lle
- Toteuta: Elinkaarikoukut lisätehtäville
- **Lab**: Mukauta mallia omaan skenaarioosi

### [Moduuli 6: Pura infrastruktuuri](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Kertaus: Mitä AZD-mallit ovat?
- Kertaus: Miksi käyttää Azure Developer CLI:tä?
- Seuraavat askeleet: Kokeile eri mallia!
- **Lab**: Poista infrastruktuuri käytöstä ja siivoa

<br/>

## Työpajan haaste

Haluatko haastaa itsesi tekemään enemmän? Tässä on joitakin projektiehdotuksia - tai jaa ideasi kanssamme!!

| Projekti | Kuvaus |
|:---|:---|
|1. **Pura monimutkainen AI-malli** | Käytä läpikäytyjä työnkulkuja ja työkaluja ja katso, pystytkö ottamaan käyttöön, varmistamaan ja mukauttamaan toisen AI-ratkaisumallin. _Mitä opit?_|
|2. **Mukauta oman skenaariosi mukaan**  | Kokeile kirjoittaa PRD (Product Requirements Document) eri skenaariota varten. Käytä sitten GitHub Copilotia mallivarastossasi Agent Model -tilassa - ja pyydä sitä luomaan mukautustyönkulku sinulle. _Mitä opit? Miten voisit parantaa näitä ehdotuksia?_|
| | |

## Palautetta?

1. Luo issue tähän repositorioon - merkitse se `Workshop` helpottamiseksi.
1. Liity Microsoft Foundry Discordiin - verkotu muiden osallistujien kanssa!


| | | 
|:---|:---|
| **📚 Course Home**| [AZD Aloittelijoille](../README.md)|
| **📖 Documentation** | [Aloita AI-mallien kanssa](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Microsoft Foundry -mallit](https://ai.azure.com/templates) |
|**🚀 Next Steps** | [Aloita työpaja](../../../workshop) |
| | |

<br/>

---

**Navigation:** [Pääkurssi](../README.md) | [Johdanto](docs/instructions/0-Introduction.md) | [Moduuli 1: Valitse AI-malli](docs/instructions/1-Select-AI-Template.md)

**Valmis aloittamaan AI-sovellusten rakentamisen AZD:llä?**

[Aloita työpaja: Johdanto →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua Co-op Translator (https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automatisoiduissa käännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä on pidettävä määräävänä lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaisen ihmiskääntäjän tekemää käännöstä. Emme vastaa tämän käännöksen käytöstä mahdollisesti aiheutuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->