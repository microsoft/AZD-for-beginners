# Too oma rakendus – lisa azd olemasolevasse projekti

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Käesolev peatükk**: Peatükk 1 - Alus & Kiire algus
- **⬅️ Eelmine**: [Sinu esimene projekt](first-project.md)
- **➡️ Järgmine**: [Arenduskontainerid ja koodiruumi keskkonnad](dev-containers.md)

> Kontrollitud versiooniga `azd 1.27.1` juulis 2026.

## Sissejuhatus

[Sinu esimeses projektis](first-project.md) paigaldasid rakenduse, alustades mallist. Kuid enamikul juhtudel on sul juba *eksisteeriv* rakendus – Node.js API, Python Flask teenus, .NET veebirakendus – mis asub arvutis kaustas. See õppetund näitab, kuidas lisada azd sellele olemasolevale koodile, et saaksid seda paigaldada `azd up` käsuga, ilma mallita.

## Õpieesmärgid

Selle õppetunni lõpuks:
- Sa mõistad kolme viisi alustada azd projekti
- Käivitad `azd init` olemasoleva koodibaasi sees
- Sa tead, mida teeb `azure.yaml` ja `infra/` kaust sinu rakenduse jaoks
- Sa tead, millal lasta azd-il infrastruktuur genereerida ja millal kirjutada ise
- Paigaldad oma olemasoleva rakenduse Azure’i `azd up` käsuga

## Õpiväljundid

Pärast seda õppetundi:
- Õpid algatama azd olemasolevas projektis
- Loe ja muuda lihtsat `azure.yaml` faili
- Genereeri algne infrastruktuur käsuga `azd infra generate`
- Vali sobiv Azure host sinu rakendusele
- Paigalda ja puhasta oma rakendus

---

## Kolm viisi alustada azd projekti

| Alustamispunkt | Käsk | Millal kasutada |
|----------------|---------|-------------|
| **Mallist** | `azd init --template <name>` | Õppimiseks või uue rakenduse alustamiseks tõestatud näidise põhjal |
| **Olemolevast koodist** | `azd init` (projekti kaustas) | Kui sul juba on rakendus ja soovid seda paigaldada |
| **Git repo põhjal** | `azd init --from-code` (kopeeritud repos) | azd kasutuselevõtt olemasolevas repos |

Sa oled juba proovinud esimest varianti. See õppetund käsitleb teist – kõige tavalisemat reaalse maailma stsenaariumi.

---

## Samm 1: Käivita `azd init` oma projektis

Ava terminal **oma olemasoleva projekti kaustas** ja käivita:

```bash
cd my-existing-app
azd init
```

azd küsib, kuidas soovid algatada. Vali:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Vali **"Kasuta koodi praeguses kataloogis."**. Seejärel skaneerib azd kausta, tuvastab sinu keele ja raamistikud ning pakub hosti.

### Mida azd tuvastab

azd otsib signaale nagu `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` või `Dockerfile` ja soovitab sobiva Azure hosti:

| Sinu rakendus | Tõenäoliselt tuvastatud host |
|--------------|-----------------------------|
| Node.js / Python / .NET veebirakendus | Azure App Service või Container Apps |
| Konteineriseeritud rakendus (`Dockerfile`) | Azure Container Apps |
| Funktsioonirakendus | Azure Functions |
| Staatiline sait (React/Vue ehitatud tulemus) | Azure Static Web Apps |

Kinnita tuvastatud teenus(ed) ja azd loob vajalikud failid.

---

## Samm 2: Mõista, mida azd lõi

Algatamise järel on projektis kaks uut asja:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — projekti definitsioon

See on azd projekti süda. Minimaalne näeb välja selline:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` plokk on kõige olulisem: iga üksus seob sinu koodikausta Azure hostiga. Kui su rakendusel on nii frontend kui API, on sul kaks teenust.

### `infra/` — sinu Azure ressursid koodina

`infra/` kaust sisaldab Bicep faile, mis defineerivad sinu rakenduse nõutavad Azure ressursid (App Service, andmebaas jne). Sul ei ole vaja neid käsitsi kirjutada – azd genereerib toimiva lähtepunkti. Hiljem *saad* neid muuta, et lisada ressursse või tugevdada turvalisust (kaetud [Peatükis 4](../chapter-04-infrastructure/README.md)).

> **Nõuanne:** Tahad näha või kohandada genereeritud infrastruktuuri enne paigaldamist? Käivita `azd infra generate` (saadaval ka kui `azd infra synth`), mis kirjutab IaC-d kettale, et seda üle vaadata ja versioonihallata.

---

## Samm 3: Sea vajalik konfigureerimine

Kui su rakendus vajab seadistusi või salasõnu (ühenduse string, API võti), ära kodeeri neid otse. Kasuta keskkonnamuutujaid:

```bash
# Loo keskkond
azd env new dev

# Määra mitte-salajane väärtus
azd env set API_VERSION 1.0.0
```

Tõeliste saladuste jaoks säilita need Key Vaultis ja viita neile oma infrastruktuurist – vaata lähemalt [Peatüki 3: Konfigureerimine ja autentimine](../chapter-03-configuration/authsecurity.md).

---

## Samm 4: Paigalda

Nüüd kasuta sama töövoogu, mida sa juba tead:

```bash
# Autendi (vajalik azd jaoks)
azd auth login

# Vaata eelvaadet ressurssidest, mis luuakse
azd provision --preview

# Hangi infrastruktuur ja juputa oma kood ära
azd up
```

Kui see lõppeb, kuvab azd sinu rakenduse URL-i. Kontrolli nagu iga azd rakendust:

```bash
azd show           # kuva lõpp-punktid
azd monitor --logs # vajadusel kontrolli logisid
```

---

## Sageli esinevad esimesed probleemid

| Sümptom | Tõenäoline põhjus | Lahendus |
|---------|--------------|-----|
| azd ei tuvastanud minu rakendust | Puudub manifest (nt `package.json`) | Lisa manifest või vali host käsitsi `azd init` käigus |
| Kokkupanek ebaõnnestub `azd up` ajal | Rakendus vajab kokkupanekut | Lisa `buildCommand`/`outputPath` `azure.yaml` teenuse alla |
| Rakendus käivitub, aga tagastab vead | Puuduv seadistus/saladus | Sea väärtused `azd env set` või ühenda Key Vaultiga |
| Vale host valitud | Automaatne tuvastus eksis | Muuda `host:` `azure.yaml` failis ning käivita `azd up` uuesti |

Lisainfot leiad [Peatükist 7: Veaotsing](../chapter-07-troubleshooting/README.md).

---

## Puhasta

```bash
azd down --force --purge
```

---

## Kokkuvõte

- `azd init` → **"Kasuta koodi praeguses kataloogis"** lisab azd olemasolevasse rakendusse.
- `azure.yaml` seob sinu koodikaustad Azure hostidega; `infra/` määratleb ressursid Bicep vormingus.
- `azd infra generate` võimaldab sul genereeritud infrastruktuuri üle vaadata või kohandada.
- Kui algatatud, kasutab sinu olemasolev rakendus täpselt sama `azd up` / `azd down` töövoogu nagu mallipõhine rakendus.

---

## 🔗 Navigeerimine

| Suund | Õppetund |
|-----------|--------|
| **Eelmine** | [Sinu esimene projekt](first-project.md) |
| **Järgmine** | [Arenduskontainerid ja koodiruumi keskkonnad](dev-containers.md) |

## 📖 Seotud ressursid

- [AZD põhialused](azd-basics.md)
- [Peatükk 4: Infrastruktuur koodina](../chapter-04-infrastructure/README.md)
- [Konfigureerimine ja autentimine](../chapter-03-configuration/authsecurity.md)
- [Käskude mäluraamat](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->