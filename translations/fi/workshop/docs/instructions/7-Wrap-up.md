# 7. Yhteenveto ja seuraavat askeleet

!!! tip "Tärkeimmät opit"

    - [ ] AZD-mallit nopeuttavat tekoälysovellusten kehitystä päivistä tunneiksi
    - [ ] Discovery → Deployment → Customization -menetelmä tarjoaa jäsennellyn oppimispolun
    - [ ] GitHub Copilot MCP-palvelimien kanssa mahdollistaa luonnolliskielisen tutkimisen monimutkaisissa koodipohjissa
    - [ ] Microsoft Foundry tarjoaa sisäänrakennetun valvonnan, arvioinnin ja tietoturvatestauksen

---

## 1. Mitä saavutit

Onnittelut! Tässä työpajassa olet onnistuneesti:

| Moduuli | Saavutus |
|:---|:---|
| **Moduuli 1** | Tutustui Azure Developer CLI:hin ja valitsi tekoälymallin |
| **Moduuli 2** | Otti käyttöön ja varmisti täydellisen tekoälyagenttiratkaisun toimivuuden |
| **Moduuli 3** | Purki mallin ymmärtääkseen sen arkkitehtuurin |
| **Moduuli 4** | Tutki `azure.yaml`-määrityksiä ja elinkaarikoukkuja |
| **Moduuli 5** | Mukautti mallin omaan käyttötapaukseesi |
| **Moduuli 6** | Purki infrastruktuurin turvallisesti ja hallitsi resursseja |

---

## 2. Hallitsemasi keskeiset käsitteet

### Azure Developer CLI (azd)
- `azd init` - Alusta projekteja malleista
- `azd up` - Provisioi ja ota käyttöön yhdellä komennolla
- `azd env` - Hallitse ympäristömuuttujia
- `azd down` - Poista resurssit turvallisesti

### AZD-mallin rakenne
- `azure.yaml` - Konfiguraatio ja käyttöönoton koukut
- `infra/` - Bicep-infrastruktuuri koodina
- `src/` - Sovelluksen lähdekoodi
- `scripts/` - Automaatio- ja asennusskriptit

### Microsoft Foundryn ominaisuudet
- AI Agent -palvelu älykkäille avustajille
- File Search ja Azure AI Search tiedonhakua varten
- Sisäänrakennettu jäljitys, valvonta ja arviointi
- Red teaming tekoälyn turvallisuuden varmistamiseksi

---

## 3. Jatka oppimismatkaasi

### Suositellut seuraavat askeleet

| Polku | Resurssi | Aika |
|:---|:---|:---|
| **Kokonainen kurssi** | [AZD aloittelijoille - opintokokonaisuus](../../README.md) | 8-12 tuntia |
| **Kokeile toista mallia** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 tuntia |
| **Syväsukellus** | [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Jatkuva |
| **Yhteisö** | [Azure Discord](https://aka.ms/foundry/discord) | Liity tänään! |

### Suositellut mallit kokeiltavaksi seuraavaksi

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Peruschat omien tietojesi kanssa
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Edistyneet RAG-mallit
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Yrityksen vähittäiskaupan skenaariot

---

## 4. Työpajan haaste

Valmis testaamaan taitojasi? Kokeile näitä haasteita:

| Haaste | Kuvaus | Vaikeustaso |
|:---|:---|:---|
| **1. Moni-agenttinen skenaario** | Ota käyttöön ja mukauta eri toimialalle (esim. terveydenhuolto, rahoitus) | ⭐⭐ |
| **2. Räätälöity tietopohja** | Lisää omat tiedostosi ja luo mukautettu hakemisto | ⭐⭐⭐ |
| **3. Tuotantokäyttöönotto** | Määritä CI/CD GitHub Actionsilla käyttäen `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Jaa palautteesi

Palautteesi auttaa meitä parantamaan tätä työpajaa!

- **GitHub Issues**: [Jätä palaute](https://github.com/microsoft/azd-for-beginners/issues) - merkitse tagilla `Workshop`
- **Discord**: Liity [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - julkaise kanavalla `#get-help`
- **Osallistuminen**: Auta parantamaan työpajaa lähettämällä pull requesteja!

---

## Kiitos! 🎉

Kiitos, että osallistuit AZD for AI Developers -työpajaan. Toivomme, että tämä kokemus antoi sinulle taidot ja varmuuden rakentaa ja ottaa käyttöön tekoälysovelluksia Azurella.

**Jatka rakentamista, jatka oppimista, ja tervetuloa Azure AI -kehittäjäyhteisöön!**

---

| | |
|:---|:---|
| **📚 Kurssin etusivu** | [AZD For Beginners](../../README.md) |
| **📖 Dokumentaatio** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI-mallit** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Yhteisö** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää määräävänä lähteenä. Kriittisen tiedon osalta suositellaan ammattimaisen ihmiskääntäjän tekemää käännöstä. Emme ole vastuussa tämän käännöksen käytöstä johtuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->