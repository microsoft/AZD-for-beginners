# Vähittäiskaupan moni-agenttinen infrastruktuurin runko

**Kehittynyt arkkitehtuuriesimerkki — ei toimiva moni-agenttisovellus.**

[Kurssin etusivu](../../README.md) ·
[Luku 5](../../docs/chapter-05-multi-agent/README.md) ·
[Arkkitehtuurin suunnitelma](../retail-scenario.md)

## Mitä tämä ottaa käyttöön

Tämä hakemisto sisältää ARM-mallin, parametrit ja Bash-käyttöönotto skriptin.
Ei ole **mitään `azure.yaml`- tai vähittäiskäyttöön tarkoitettua sovelluksen lähdekoodia**.

| Resurssi | Todellinen tila käyttöönoton jälkeen |
|---|---|
| Ensisijainen Azure OpenAI -tili | `gpt-4.1-chat` käyttöönotto käyttäen `gpt-4.1` versiota `2025-04-14`, `GlobalStandard` |
| Toissijainen OpenAI-tili (valinnainen) | `gpt-4.1-mini-inventory`, malli `gpt-4.1-mini` versio `2025-04-14`, `GlobalStandard` |
| Embedding-tili (valinnainen) | `text-embedding-ada-002` versio `2`, `Standard`; ei indeksointiputkea |
| Grader OpenAI -tili | `gpt-4.1-grader`, malli `gpt-4.1` versio `2025-04-14`, `GlobalStandard`; ei arvioijaa |
| AI Search | Tyhjä palvelu; ei indeksiä tai asiakirjoja |
| Tallennustila | Tyhjät `documents` ja `uploads` blob-säiliöt |
| Cosmos DB | Serverless-tili, `chathistory` tietokanta, `conversations` säiliö osioituna `/userId` mukaan, 30 päivän TTL kohteille |
| Container Apps | Reititin ja käyttöliittymä molemmat ajaa `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` portissa 80 |
| Key Vault (valinnainen) | Tyhjä RBAC-aktivoitu holvi; **ei salaisuuksia tai roolimäärityksiä** |
| Application Insights / Log Analytics (valinnainen) | Resurssit ja ympäristön lokien keruu; ei mukautettua sovellusmittausta, hälytyksiä tai hallintapaneeleja |
| Document Intelligence | S0-tili; ei asiakirjojen käsittelytyönkulkua |

Legacy Bing Search v7 poistettiin käytöstä 11. elokuuta 2025 eikä sitä ole **otettu käyttöön**.
Korvaavaa web-perustuvaa integrointia ei ole toteutettu.

**Ei sisälly:** asiakas-/varastoagentit, reititin `/chat` API, käyttöliittymän chat UI,
hakukaavan tai ingestiokäsikirjoituksia, Azure Container Registry, yksityiset päätepisteet,
hallitut identiteetit, RBAC-määritykset, automaattinen failover, Front Door, red-team
skanneri, arviointityökalu CLI, autentikointi tai CI/CD.

ARM:n onnistumisviesti vahvistaa vain resurssien käyttöönoton. Se ei takaa
sovelluksen toiminnallisuutta, turvallisuutta, käytettävyyttä tai tuotantovalmiutta.

## Edellytykset ja kustannukset

- Bash (Git Bash/WSL Windowsilla) ja
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Tilauksella on oltava oikeudet luoda kaikki listatut resurssit.
- Tarkista **jokaisen mallin/version/SKU:n saatavuus jokaisessa valitussa alueessa** ja
  tilauksesi käyttökiintiö. Oletukset ovat esimerkkejä, eivät takuita.
  Katso [mallien saatavuus](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Valitse omistettu resurssiryhmä, jonka voit poistaa testauksen jälkeen.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Oletussijainnit: ensisijainen `eastus2`, toissijainen `westus2`, embeddingit `francecentral`;
grader oletuksena ensisijaisessa alueessa ellei `graderLocation` ole annettu.
`--no-multi-region` ohittaa toissijaiset ja embedding-tilit; se ei ohita
grader-tiliä.

Search-palvelusta veloitetaan kun se on käytössä, vaikka se olisi tyhjä. Konttien vähimmäiskopiot,
tallennuksen moninkertaisuus, Cosmos DB -pyynnöt/tallennus, mallin tokenit, Document Intelligence
-kutsut ja lokien vastaanotto/tallennus voivat lisätä kuluja. Ei ole olemassa **kiinteää tai validoitua
kuukausittaista kokonaissummaa**. Arvioi tarkat SKU:t
[Azure-hinnoittelulaskurilla](https://azure.microsoft.com/pricing/calculator/) ja
määritä budjetti ennen käyttöönottoa.

### Käyttöönottotilat

Nämä asetukset koskevat resurssikokoja, **eivät tuotanto- tai SLA-sertifikaatteja**:

| Tila | Chat / mini / embedding / grader kapasiteettiyksiköt | Reitittimen replikaatiot | Frontend-replikaatiot | Hakukerros | Tallennus |
|---|---|---|---|---|---|
| minimaalinen | 10 / 10 / 20 / 5 | 0–3 | 1–2 | perus, 1 replika | Standard_LRS |
| vakio | 20 / 15 / 30 / 15 | 1–3 | 1–2 | vakio, 1 replika | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 replikaa | Standard_GRS |

Mallikapasiteettiyksiköt ovat mallikohtaisia/SKU-kohtaisia; älä summioi niitä universaalina TPM
takuuna. Premium ei mahdollista zonivarmennettuja Container Appseja: se vaatii
lisäverkon suunnittelua. Basic Search tukee vektorihaun palvelun rajoitusten puitteissa; se ei ole lähtökohtaisesti ristiriidassa vektorien kanssa.


## 🚀 Pikainen käyttöönotto

Tutustu ensin `azuredeploy.json` ja `azuredeploy.parameters.json`. Alla olevat komennot
**luovat laskutettavia Azure-resursseja**; ne eivät ole offline-tarkistuksia.

Repositorion juuresta:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Skripti käyttää polkuja suhteessa omaan hakemistoonsa, tarkistaa kirjautumisen/työkalut/parametrit,
luo resurssiryhmän jos sitä ei ole, validoi käyttöönoton, provisionoi ja
näyttää ei-salaiset tulosteet. Ei vaadi tai suorita `jq`, datan täyttöä, salaisuuksien hakua tai
käyttöönoton jälkeistä sovellusasetusta.

Skriptin oletuskomentoriviarvot ylikirjoittavat vastaavat arvot
parametritiedostossa. Muokkaa parametritiedostoa asetuksia kuten toissijainen/kolmas
alue; käytä suoraa CLI-käyttöönottoa, jos tarvitset mielivaltaisia parametriylikirjoituksia:

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

Provisionointi voi kestää 15–45 minuuttia tai pidempään, ja voi epäonnistua alueellisten määrärajojen tai
mallin elinkaarirajoitusten vuoksi. Älä yritä uudelleen sokeasti: lue epäonnistunut toiminto ensin.

## Konfigurointivaihtoehdot

| Parametri | Oletus mallissa | Merkitys |
|---|---|---|
| `projectName` | Pakollinen (`retail` parametritiedostossa) | 3–10 pientä kirjainta/numeroa |
| `location` | Resurssiryhmän sijainti | Ensisijainen alue (`eastus2` parametritiedostossa) |
| `secondaryLocation` | `westus2` | Mini-mallin tilin alue |
| `tertiaryLocation` | `francecentral` | Embedding-tilin alue |
| `graderLocation` | Ensisijainen alue | Riippumaton grader-tilin alue |
| `environmentName` | `dev` | `dev`, `staging`, tai `prod`; pelkkä nimi, ei kovettuva kytkin |
| `deploymentMode` | `standard` | SKU-/kapasiteettivalinta |
| `enableMultiRegion` | `true` | Lisää toissijaiset ja embedding-tilit |
| `enableMonitoring` | `true` | Lisää Insights-/työtilan ja ympäristön lokien keräys |
| `enableSecurity` | `true` | Luo tyhjä vain RBAC-turvallinen vault |

Harhaanjohtava `openAiApiVersion`-parametri poistettiin: dataplane-API-version
ei ohjaa ARM-resurssiversioita tai malliversioita. Mallinimi/-versioparit
ovat `variables.modelDeployments`; tarkista ne yhdessä käyttöönoton SKU:n kanssa.

## Vahvista provisiointi

Käytä käyttöönoton nimeä skriptin tulosteesta tai `az deployment group list`.
Suoran käyttöönoton tapauksessa yllä:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Odotettu: käyttöönoton tila `Succeeded`. Virheen sattuessa tarkista operaation
virhetiedot. Pelkkä resurssilistan tuloste ei ole luotettava provisiointitilan tarkastus.

Testaa paikkamerkki **root**, ei olematonta agenttipäätettä:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Odotettu: HTTP 200 hello-world -sivu, **ei keskusteluvastaus**. HTTP-virhe
ei ole onnistuneen vahvistuksen merkki.

Todellisen ensisijaisen mallin inferenssin testaamiseksi (maksullinen):

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

Odotettu: JSON, jossa on `choices` ja `usage`. Käyttöönoton nimi on
`gpt-4.1-chat`, ei alla olevan mallin nimi `gpt-4.1`.

## 🔧 Käyttöönoton jälkeen: Seuraavat askeleet

Tämä on **kehitysjono**, ei valmis harjoitus:

1. Toteuta todennetut asiakas-/varastoagentit ja reitityssopimus.
2. Toteuta frontend ja varmista sen konfiguraatio.
3. Luo ja täytä hakemisto, jonka ulottuvuus/profiili vastaa upotusmalliasi, ja käsittele dokumenttien virheitä ja päivityksiä.
4. Luo rekisteri ja määritä kuvanvetotunnus/valtuudet.
5. Rakenna ja työnnä todelliset kuvat. Vaihda Container Appin sisääntulon portit ja tarkastusmekanismit
   vastaamaan kyseisiä kuvia ennen testausta; portti 80 kuuluu tällä hetkellä paikkamerkeille.
6. Määritä salaisuudet tai hallinnoidut identiteetit ja rajatut datatasoroolit. Älä
6. Määritä salaisuudet tai hallitut identiteetit ja rajatut data-tason roolit. Älä
   viittaa kuvitteellisiin salaisiin nimiin: tämä malli ei luo sovelluksen salaisuuksia.
7. Instrumentoi sovellukset, määritä hälytykset, testaa virheiden/elinvoimaisuuden palautus ja arvioi
   tulokset edustavan totuuden ja ihmisen tarkastelun perusteella.

Katso [arkkitehtuurisuunnitelma](../retail-scenario.md) suunnittelun rajojen osalta.

## Vianmääritys ja turvallisuusrajat

- **Malli ei saatavilla:** varmista malli/versio/SKU, alue ja tilauskiintiö;
  skripti ei tee malliluetteloiden ennakkotarkistusta.
- **Valvonta pois päältä:** ympäristön lokin kohde on `none`, ei
  virheellinen tyhjä Log Analytics -määritys.
- **Vain paikkamerkit:** `/chat`, agentin arviointi ja tiedostojen syöttö eivät ole olemassa.
- **Verkko/tunnistus:** julkiset päätepisteet ja paikallinen todennus ovat käytössä.
  Pelkkä Key Vault RBAC:n ottaminen käyttöön ei luo rooliasetuksia tai tunnuksia.
- **Produktiivikäyttö:** lisää todennus, rajatut tunnukset, salaisuuksien hallinta,
  yksityinen verkotus tarvittaessa, saatavuuden suunnittelu ja operatiiviset testit.
  Monialuemallin tilit eivät yksinään tarjoa vikatilannetukea.

## Siivous

Tässä ei ole AZD-projektia; `azd down` ei ole siivouskomento.
Tarkistettuasi, että ryhmä sisältää vain oppimateriaalisi:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Odotettu tila poiston jälkeen: `false`. Key Vaultin ja Cognitive Servicesin
pehmeästi poistetut resurssit voivat säilyttää nimet; puhdistus vaatii asianmukaiset oikeudet.
Tarkista Käyttökustannusten hallinta viiveellisten käytön veloitusten varalta.

[Ilmoita ongelmasta](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->