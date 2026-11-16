# Jaemüügi mitmeagendi infrastruktuuri raamistik

**Täpsem arhitektuuri näide — mitte töötav mitmeagendi rakendus.**

[Kursuse avaleht](../../README.md) ·
[5. peatükk](../../docs/chapter-05-multi-agent/README.md) ·
[Arhitektuuri plaan](../retail-scenario.md)

## Mida see juurutab

See kaust sisaldab ARM-malli, parameetreid ja Bash-i juurutusskripti.
Siin **ei ole `azure.yaml` ega jaemüügi rakenduse lähtekoodi**.

| Ressurss | Tegelik olek pärast juurutamist |
|---|---|
| Esmane Azure OpenAI konto | `gpt-4.1-chat` juurutamine kasutades `gpt-4.1` versiooni `2025-04-14`, `GlobalStandard` |
| Sekundaarne OpenAI konto (valikuline) | `gpt-4.1-mini-inventory`, mudel `gpt-4.1-mini` versioon `2025-04-14`, `GlobalStandard` |
| Põimimis-konto (valikuline) | `text-embedding-ada-002` versioon `2`, `Standard`; pole indekseerimise torujuhet |
| Hinnangu andja OpenAI konto | `gpt-4.1-grader`, mudel `gpt-4.1` versioon `2025-04-14`, `GlobalStandard`; pole hindajat |
| AI Otsing | Tühi teenus; pole indeksit ega dokumente |
| Salvestus | Tühjad `documents` ja `uploads` mootoribittennärid |
| Cosmos DB | Serverivaba konto, `chathistory` andmebaas, `conversations` mootor, partitsioneeritud `/userId` järgi, 30-päevane üksuse TTL |
| Container Apps | Ruuderi ja esipaneeli teenused jooksevad mõlemad `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` pordil 80 |
| Võtmeklambri (Key Vault) (valikuline) | Tühi RBAC lubatud võtmeklambri vignett; **pole saladusi ega rollide määramisi** |
| Application Insights / Log Analytics (valikuline) | Ressursside ja keskkonna logide kogumine; puudub kohandatud rakenduse instrumentatsioon, hoiatused või juhtpaneelid |
| Dokumendi intelligentsus | S0 konto; puudub dokumenditöötlusvoog |

Legacy Bing Search v7 pensionitati 11. augustil 2025 ja seda **ei juurutata**.
Asendavat veebipõhist ühendust pole rakendatud.

**Ei ole kaasatud:** kliendi/lao agendid, ruuderi `/chat` API, esipaneeli jutuliides,
otsinguskeem või ingesti skriptid, Azure Container Registry, privaatotsad,
hallatud identiteedid, RBAC määramised, automaatne rikkeümberlülitus, Front Door, punase meeskonna
skanner, hindamise CLI, autentimine või CI/CD.

ARM-i edukuse teade kinnitab ainult ressursside juurutamist. See ei kinnita
rakenduse funktsionaalsust, turvalisust, kättesaadavust ega tootmisvalmidust.

## Eeltingimused ja kulud

- Bash (Git Bash/WSL Windowsil) ja
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Tellimus õigustega luua kõik loetletud ressursid.
- Kontrolli **iga mudeli/versiooni/SKU saadavust igas valitud piirkonnas** ja
  kvotaasi sinu tellimusele. Vaikeväärtused on näited, mitte garantiid.
  Vaata [mudeli saadavust](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Vali pühendatud ressursside grupp, mille saad pärast testimist kustutada.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Vaikimisi asukohad: esmane `eastus2`, sekundaarne `westus2`, põimikud `francecentral`;
hindeandja kasutab vaikimisi esmast piirkonda, v.a kui on edastatud `graderLocation`.
`--no-multi-region` väldib sekundaarset ja põimimis-kontosid; see ei väldi
hindeandja kontot.

Otsingut arvestatakse, kui see on juurutatud, isegi kui see on tühi. Konteineri miinimum koopiad,
salvestuse mitmekordistamine, Cosmos DB päringud/salvestus, mudeli tokenid, Dokumendi intelligentsuse
kõned ja logi sööte/salvestus võivad lisada kulusid. Ei ole fikseeritud ega valideeritud
igakuine kogus**. Hinnake täpsed SKU-d aadressil
[Azure hinnakalkulaator](https://azure.microsoft.com/pricing/calculator/) ja
seadistage eelarve enne juurutamist.

### Juurutamisrežiimid

Need seaded on ressursi suurused, **mitte tootmis- või SLA-sertifikaadid**:

| Režiim | Vestlus / mini / manustamine / hindaja mahuühikud | Marsruuteri replikad | Esipaneeli replikad | Otsingu tase | Salvestus |
|---|---|---|---|---|---|
| minimaalne | 10 / 10 / 20 / 5 | 0–3 | 1–2 | põhiline, 1 replik | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 replik | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 replikat | Standard_GRS |

Mudelimahtude ühikud on mudeli/SKU-spetsiifilised; ärge summeerige neid universaalseks TPM-i
garantiiks. Premium ei võimalda tsoonide ülekatteta Container Apps-i: see nõuab
täiendavat võrgu projekteerimist. Põhiosing toetab vektorotsingut, tingimusel et
teenuse piirangud seda lubavad; see ei ole vektorsõbralik.

## 🚀 Kiirjuurutus

Vaadake esmalt üle `azuredeploy.json` ja `azuredeploy.parameters.json`. Alljärgnevad käsud
**loovad tasustatavad Azure ressursid**; need ei ole võrguühenduseta kontrollid.

Hoidla juurtest:

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Skript kasutab oma kaustale suhtelisi teid, kontrollib sisselogimist/ tööriistu/parameetreid,
loob vajadusel ressursigrupi, valideerib juurutuse, paigaldab ning
kuvab saladusteta väljundid. Ei nõuta ega teostata `jq`, andmete
täitmist, saladuste päringut ega rakenduse käivituse seadistust pärast juurutust.

Skripti vaikeväärtused käsureal kirjutavad üle vastavad väärtused
parameetrite failis. Redigeerige parameetrite faili selliseid seadeid nagu teise/kolmanda
piirkonna seadistused; kui on vaja suvalisi parameetrite ülekirjutusi, kasutage otsest CLI juurutust:

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

Provisioneerimine võib kesta 15–45 minutit või kauem ning see võib ebaõnnestuda piirkondlike piirangute või
mudeli elutsükli piirangute tõttu. Ära proovi pimesi uuesti: loe esmalt ebaõnnestunud toimingut.

## Konfiguratsiooni valikud

| Parameeter | Vaikimisi mallis | Tähendus |
|---|---|---|
| `projectName` | Nõutud (`retail` parameetrite failis) | 3–10 väikese tähega tähte/numbrit |
| `location` | Ressursigrupi asukoht | Põhiala (`eastus2` parameetrite failis) |
| `secondaryLocation` | `westus2` | Mini mudeli konto asukoht |
| `tertiaryLocation` | `francecentral` | Embeddingute konto asukoht |
| `graderLocation` | Põhiala | Sõltumatu hindaja konto asukoht |
| `environmentName` | `dev` | `dev`, `staging` või `prod`; ainult nimi, mitte tugevdamise lüliti |
| `deploymentMode` | `standard` | SKU/kapasiteedi valik |
| `enableMultiRegion` | `true` | Lisa teisene ja embeddingute kontod |
| `enableMonitoring` | `true` | Lisa Insights/tööruumi ja keskkonna logikogumine |
| `enableSecurity` | `true` | Loo ainult tühi RBAC-i lubatud varamu |

Eksitav `openAiApiVersion` parameeter eemaldati: andmetasandi API versioon
ei juhi ARM-i ressursside versioone ega mudelite versioone. Mudeli nimi/versiooni paarid
on `variables.modelDeployments`; kontrolli neid koos juurutamise SKU-ga.

## Provisioneerimise kontrollimine

Kasuta skripti väljundist või `az deployment group list` juurutamise nime.
Otsese juurutamise puhul ülal:

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Oodata: juurutamise olek `Succeeded`. Ebaõnnestumise korral vaata toimingu vea
üksikasju. Ressursside nimekirja väljund üksi ei ole usaldusväärne provisioneerimise oleku kontroll.

Testi kohtlejana **root**, mitte mitteolevat agendi lõpp-punkti:

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Oodata: HTTP 200 tere-maailma lehekülg, **mitte vestluse vastus**. HTTP viga
ei loeta edukaks kontrolliks.

Tegeliku põhimudeli järelduse testimiseks (tasuline):

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

Oodata: JSON koos `choices` ja `usage`. Juurutamise nimi on
`gpt-4.1-chat`, mitte aluseks oleva mudeli nimi `gpt-4.1`.

## 🔧 Pärast juurutamist: järgmised sammud

See on **arendusjärjekord**, mitte lõpetatud harjutus:

1. Rakenda autentitud kliendi/varude agendid ja marsruuteri leping.
2. Rakenda kasutajaliides ja valideeri selle konfiguratsioon.
3. Loo ja täida otsingukaart mõõtmete/profiiliga, mis vastab sinu
   embedding mudelile, ning halda dokumentide ebaõnnestumisi ja uuendusi.
4. Loo register ja konfigureeri pilditõmbamise identiteet/lubade seadistus.
5. Ehita ja saada reaalsed pildid. Muuda konteinerirakenduse sisenemise pordid ja sondid,
   et need vastaksid nendele piltidele enne testimist; port 80 siin kuulub kohtletaladele.
6. Konfigureeri saladused või hallatud identiteedid ja ulatatud andmetasandi rollid. Ära
   viita kujuteldavatele saladuste nimedele: see mall ei loo rakenduse saladusi.
7. Instrumendi rakendused, seadista hoiatused, testi ebaõnnestumist/taastumist ja
   hinda tulemusi esindusliku ground truth'i ja inimliku ülevaate abil.

Vaata [arhitektuuri mustrit](../retail-scenario.md) disaini piiride kohta.

## Tõrkeotsing ja turvapiirid

- **Mudelit pole saadaval:** kontrolli mudelit/versiooni/SKU-d, piirkonda ja tellimuse limiiti;
  skript ei tee mudelikalendrite eelkontrolli.
- **Jälgimine keelatud:** keskkonna logi sihtkoht on `none`, mitte een
  vale tühi Log Analytics konfiguratsioon.
- **Ainult kohatäited:** `/chat`, agendi hindamine ja faili töötlus puuduvad.
- **Võrk/identiteet:** avalikud otsapunktid ja kohalik autentimine on lubatud.
  Ainult Key Vault RBAC aktiveerimine ei loo rolli määramisi ega identiteete.
- **Tootmine:** lisa autentimine, piiratud identiteedid, saladuste haldamine,
  vajadusel privaatvõrk, saadavuse disain ja tegevustestid.
  Mitme regiooni mudeli kontod üksi ei taga rikke korral üleminemist.

## Puhastamine

Siin pole AZD projekti; `azd down` ei ole puhastus käsk.
Peale kindlustamist, et grupp sisaldab ainult sinu õppevahendeid:

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Oodatav pärast kustutamise lõppu: `false`. Key Vault ja Cognitive Services
pehmendatud kustutusega ressursid võivad nimed säilitada; puhastamiseks on vaja sobivaid õigusi.
Kontrolli Kulu haldust hilinenud kasutustasude osas.

[Teata probleemist](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->