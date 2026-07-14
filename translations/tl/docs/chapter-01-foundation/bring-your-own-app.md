# Dalhin ang Iyong Sariling App - Magdagdag ng azd sa Umiiral na Proyekto

**Navigasyon ng Kabanata:**
- **📚 Bahay ng Kurso**: [AZD Para sa mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilis na Pagsisimula
- **⬅️ Nakaraan**: [Ang Iyong Unang Proyekto](first-project.md)
- **➡️ Susunod**: [Dev Containers & Codespaces](dev-containers.md)

> Napatunayan gamit ang `azd 1.27.1` noong Hulyo 2026.

## Panimula

Sa [Ang Iyong Unang Proyekto](first-project.md) nag-deploy ka ng app sa pamamagitan ng pagsisimula mula sa isang template. Ngunit kadalasan ay mayroon ka nang *app*—isang Node.js API, Python Flask service, .NET web app—na nakalagay sa folder sa iyong makina. Ipinapakita ng araling ito kung paano idagdag ang azd sa umiiral na code upang ma-deploy mo ito gamit ang `azd up`, hindi kailangan ng template.

## Mga Layunin ng Pagkatuto

Sa pagtatapos ng araling ito, malalaman mo:
- Ang tatlong paraan upang magsimula ng azd na proyekto
- Patakbuhin ang `azd init` sa loob ng umiiral na codebase
- Ano ang ginagawa ng `azure.yaml` at ng folder na `infra/` para sa iyong app
- Kailan papayagan ang azd na gumawa ng imprastruktura kumpara sa pagsulat nito mismo
- I-deploy ang iyong umiiral na app sa Azure gamit ang `azd up`

## Mga Resulta ng Pagkatuto

Pagkatapos makumpleto ang araling ito, magagawa mong:
- Ini-initialize ang azd sa proyekto na mayroon ka na
- Basahin at i-edit ang isang pangunahing `azure.yaml` file
- Gumawa ng panimulang imprastruktura gamit ang `azd infra generate`
- Pumili ng angkop na Azure host para sa iyong app
- I-deploy at linisin ang iyong sariling aplikasyon

---

## Tatlong Paraan upang Magsimula ng azd na Proyekto

| Panimulang punto | Utos | Kailan gagamitin |
|----------------|---------|-------------|
| **Mula sa template** | `azd init --template <name>` | Para sa pagkatuto, o pagsisimula ng bagong app mula sa subok na halimbawa |
| **Mula sa umiiral mong code** | `azd init` (sa loob ng folder ng proyekto) | Mayroon ka nang app at gusto mo itong i-deploy |
| **Mula sa Git repo** | `azd init --from-code` (sa isang cloned na repo) | Pagtanggap ng azd para sa umiiral na repositoryo |

Nasubukan mo na ang unang opsyon. Tinatalakay sa araling ito ang pangalawang paraan—ang pinaka-karaniwang senaryo sa totoong buhay.

---

## Hakbang 1: Patakbuhin ang `azd init` sa Iyong Proyekto

Buksan ang terminal **sa loob ng umiiral mong project folder** at patakbuhin:

```bash
cd my-existing-app
azd init
```

Tatanungin ka ng azd kung paano mo nais i-initialize. Piliin:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Piliin ang **"Use code in the current directory."** Susuriin ng azd ang folder mo, tutuklasin ang wika at framework, at magmumungkahi ng host.

### Ano ang natutuklasan ng azd

Hinahanap ng azd ang mga palatandaan tulad ng `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, o isang `Dockerfile`, at nagmumungkahi ng akmang Azure host:

| Iyong app | Malamang na host na natuklasan |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service o Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Kumpirmahin ang natuklasang serbisyo, at maghahanda ang azd ng mga file na kailangan mo.

---

## Hakbang 2: Intindihin Kung Ano ang Ginawa ng azd

Pagkatapos ng init, magkakaroon ka ng dalawang bagong bagay sa iyong proyekto:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — ang depende ng proyekto

Ito ang puso ng azd na proyekto. Ang isang minimal ay ganito ang hitsura:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Ang `services` block ang pangunahing bahagi: bawat entry ay tumutugma sa isang folder ng iyong code papunta sa Azure host. Kung ang iyong app ay may frontend at API, magkakaroon ka ng dalawang serbisyo.

### `infra/` — ang iyong Azure resources bilang code

Hawak ng `infra/` folder ang mga Bicep file na naglalarawan ng mga Azure resources na kailangan ng iyong app (App Service, database, atbp.). Hindi mo kailangang isulat ito nang manu-mano—ang azd ang bumubuo ng panimulang punto na gumagana. Maaari mo itong i-edit mamaya upang magdagdag ng mga resources o higpitan ang seguridad (tinalakay sa [Kabanata 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Gusto mo bang makita o i-customize ang nabuo na imprastruktura bago mag-deploy? Patakbuhin ang `azd infra generate` (pati na rin bilang `azd infra synth`) upang isulat ang IaC sa disk para marebyu at mapamahalaan mo sa version control.

---

## Hakbang 3: I-set ang Kinakailangang Konfigurasyon

Kung kailangan ng iyong app ng settings o mga sikreto (tulad ng connection string, API key), huwag mo itong i-hardcode. Gamitin ang mga environment values:

```bash
# Lumikha ng isang kapaligiran
azd env new dev

# Itakda ang isang halaga na hindi lihim
azd env set API_VERSION 1.0.0
```

Para sa tunay na mga sikreto, itago ito sa Key Vault at i-refer ito mula sa iyong imprastruktura—tingnan ang [Kabanata 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Hakbang 4: Mag-deploy

Gamitin ang parehong workflow na kilala mo na:

```bash
# Magpatunay (kailangan para sa azd)
azd auth login

# Tingnan ang mga mapagkukunan na malilikha
azd provision --preview

# Maglaan ng imprastraktura at i-deploy ang iyong code
azd up
```

Kapag tapos na, ipapakita ng azd ang URL ng iyong app. Patunayan ito sa parehong paraan ng kahit anong azd app:

```bash
azd show           # ipakita ang mga endpoint
azd monitor --logs # tingnan ang mga tala kung kinakailangan
```

---

## Karaniwang Mga Suliranin sa Unang Pagsubok

| Sintomas | Malamang na sanhi | Solusyon |
|---------|--------------|-----|
| Hindi nadetect ng azd ang app ko | Wala ang manifest (hal. `package.json`) | Idagdag ang manifest, o piliin ang host nang manu-mano sa `azd init` |
| Bumagsak ang build sa `azd up` | Kailangan ng build step ang app | Idagdag ang `buildCommand`/`outputPath` sa ilalim ng serbisyo sa `azure.yaml` |
| Nagsimula ang app pero nagbalik ng mga error | Wala ang config/sikreto | I-set ang mga halaga gamit ang `azd env set` o i-configure ang Key Vault |
| Mali ang napiling host | Mali ang hula ng auto-detection | I-edit ang `host:` sa `azure.yaml` at patakbuhin muli ang `azd up` |

Para sa iba pa, tingnan ang [Kabanata 7: Pag-ayos ng Problema](../chapter-07-troubleshooting/README.md).

---

## Linisin

```bash
azd down --force --purge
```

---

## Buod

- Ang `azd init` → **"Use code in the current directory"** ay nagdadagdag ng azd sa app na mayroon ka na.
- Tinutukoy ng `azure.yaml` ang mga folder ng code mo sa mga Azure host; ang `infra/` ay naglalarawan ng mga resources bilang Bicep.
- Pinapayagan ka ng `azd infra generate` na suriin o i-customize ang nabuo na imprastruktura.
- Kapag na-initialize, ginagamit ng umiiral mong app ang eksaktong parehong workflow ng `azd up` / `azd down` gaya ng app na naka-base sa template.

---

## 🔗 Navigasyon

| Direksyon | Aralin |
|-----------|--------|

| **Nakaraan** | [Ang Iyong Unang Proyekto](first-project.md) |
| **Susunod** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Mga Kaugnay na Pinagkukunan

- [Mga Pangunahing Kaalaman sa AZD](azd-basics.md)
- [Kabanata 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Kumpigurasyon at Pagpapatunay](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->