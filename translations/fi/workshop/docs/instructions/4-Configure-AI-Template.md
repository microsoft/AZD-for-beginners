# 4. Määritä malli

!!! tip "TÄMÄN MODUULIN LOPPUUN MENNESSÄ OSAA"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Aloita varsinaisesta mallista

Avaa [`azure.yaml` Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) -varastosta, jonka olet alustanut. Ylävirran malli voi muuttua riippumatta tästä työpajasta. Seuraava **ote** tarkistettiin 4. marraskuuta 2026; se ei korvaa koko tiedostoa:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` tunnistaa AZD-projektin; `metadata.template` kirjaa mallin version.
- `requiredVersions.azd` on mallin vähimmäisvaatimus, ei suositus vanhaan CLI:hin pysymisestä. Käytä nykyistä tuettua AZD-julkaisua.
- `services` määrittelee sovelluksen käyttöönoton kohteet. Tämä malli ottaa käyttöön Python-rajapinnan ja etupään yhtenä Container Apps -palveluna.
- `project` on suhteessa `azure.yaml`.
- `remoteBuild` pyytää etäkontin rakennetta. Henkilölläsi tulee silti olla tarvittavat Azure-oikeudet.

Mallin Bicep-tiedostot `infra/` alla, eivät pelkästään `services` lista, määrittelevät resurssit kuten Microsoft Foundry, mallien käyttöönotot, tallennustilan ja valinnaisen AI Searchin.

## 2. Ymmärrä elinkaarikoukut

Tarkastele `hooks` osiota ja siihen viitattuja skriptejä ennen mallin suorittamista. Tarkasteltu versio sisältää:

| Koukun nimi | Tarkoitus | Tärkeä toiminta |
|------|---------|--------------------|
| `preup` | Vahvista mallin ympäristösyötteet ennen `up` työnkulkua | Alustakohtaiset shell-skriptit voivat pysäyttää työnkulun virheen yhteydessä |
| `postdeploy` | Suorita malliukohtainen käyttöönoton jälkeinen asennus | Tarkista `continueOnError` ja skriptin tuloste; onnistunut käyttöönotto ei takaa, että kaikki asennustehtävät onnistuivat |

Tässä versiossa **ei** ole vanhempaa `postprovision` / `write_env` -koukkua, joka näkyi aikaisemmassa työpajamateriaalissa. Älä kopioi koukkureferenssejä skripteihin, joita ei enää ole olemassa.

Koukkunäppäimet valitsevat elinkaaritapahtumat; `posix` ja `windows` valitsevat alustatoteutukset. `shell`, `run`, `interactive`, ja `continueOnError` hallitsevat suoritusta. Nämä ovat suoritettavia skriptejä lupiesi kanssa, joten tarkista ne aivan kuten sovelluskoodi.

Katso täydellinen elinkaari [AZD-koukkudokumentaatiosta](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility).

## 3. Jäljitä ympäristön syötteet infrastruktuuriin

Suorita nämä komennot alustetusta esimerkkivarastosta:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Tarkastele `infra/main.parameters.json` nähdäksesi, mitä ympäristömuuttujia malli todella käyttää. Satunnaisen nimen asettaminen `azd env set`:lla ei automaattisesti muuta Azure-resurssia.

Tarkistettuina oletusarvoina ovat:

| Syöte | Oletus / tarkoitus |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; kiintiöyksiköt riippuvat mallista ja käyttöönoton tyypistä |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; pidä pois päältä, ellei tietojen käsittelyä ole tarkistettu |

Nämä ovat esimerkkikohtaisia syötteitä, eivät globaalit AZD-asetukset. Tarkista [mallin ja alueen tukidokumentaatio](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) ja tilauksesi kiintiö ennen mallin, SKU:n, kapasiteetin tai sijainnin valintaa. Älä tulkitse jokaista kapasiteettiyksikköä 1 000 tokeniksi minuutissa.

Valitaksesi eri chat-mallin päivitä sen yhteensopivat **nimi, versio, muoto, SKU ja kapasiteetti yhdessä**, seuraamalla [esimerkin mukautusopasta](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Pelkästään nimen muuttaminen voi jättää yhteensopimattoman version tai käyttöönoton tyypin.

## 4. Lab: ota käyttöön valinnainen haku ja jäljitys

!!! warning "Nämä asetukset voivat lisätä veloitettuja resursseja"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Infrastruktuurin muutokset vaativat provisioinnin; pelkkä `azd deploy` ottaa käyttöön vain sovelluspalvelut. Hakemistoinnille ja tuetuille noutovaihtoehdoille noudata [AI Search -opasta](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Seurannan osalta noudata [havaittavuusopasta](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Älä ota käyttöön kehotteen/vastauksen sisällön tallennusta oikeille asiakastiedoille ilman tarvittavaa suostumusta, käyttöoikeuksien hallintaa, säilytyskäytäntöä ja sensuuria.

## 5. Olemassa olevat resurssit ja CI/CD

Uudelleenkäyttääksesi Foundryn projektin noudata esimerkin [olemassa olevien resurssien ohjeita](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` asettaminen muuttaa käyttöönoton polun; tässä tilanteessa malli ei luo sinulle Application Insights -tai AI Search -palveluja. Varmista riippuvuudet, roolimääritykset ja mallin käyttöönotot erikseen.

`pipeline.variables`-osio ohjaa arvoja, jotka välitetään luotuun putkeen; se ei ole salaisuuksien säilytyspaikka eikä luo Azure-resursseja. Suosi sovelluksessa hallittua tunnistetta ja OIDC:tä CI/CD:ssä. AZD-ympäristötiedostot ovat tavallista tekstiä, eikä niitä tule sitoa versiohallintaan.

AZD tukee luotettavan, paikallisesti valmistellun dotenv-tiedoston tuontia:

```bash
azd env set --file .env
```

Tarkista tiedosto ennen sen tuomista, äläkä tulosta salaisuuksia sisältäviä ympäristötiedostoja jaetuissa päätelaitteissa tai CI-lokeissa.

## 6. Tarkista ymmärryksesi

- Mikä `azure.yaml`-palvelu ottaa käyttöön sovelluksen?
- Mikä infrastruktuuriparametri käyttää jokaista muuttamaasi arvoa?
- Mitkä muutokset vaativat käyttöönoton pelkän käyttöönoton sijaan?
- Tukivatko valittu alue ja tilaus mallia ja kiintiöitä?
- Onko kaikki asetettavat koukut onnistuneet, ja voitko vahvistaa käyttöönotetun sovelluksen toiminnan?

Jatka kohtaan [Mukauta mallia](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->