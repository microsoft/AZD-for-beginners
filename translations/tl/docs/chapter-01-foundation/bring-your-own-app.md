# Dalhin ang Sariling App - Magdagdag ng azd sa Isang Umiiral na Proyekto

**Pag-navigate sa Kabanata:**
- **📚 Home ng Kurso**: [AZD Para sa mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilis na Pagsisimula
- **⬅️ Nakaraan**: [Ang Iyong Unang Proyekto](first-project.md)
- **➡️ Susunod**: [Mga Dev Container at Codespaces](dev-containers.md)

> Target ng pagsusuri ng utos at konfigurasyon: `azd 1.37.2` (Nobyembre 2026). Ang mga nilikhang file ay nakadepende sa natukoy na aplikasyon; hindi isinagawa ang pagdeploy sa Azure sa pagsusuring ito.

## Panimula

Sa [Ang Iyong Unang Proyekto](first-project.md) nagdeploy ka ng app gamit ang pagsisimula mula sa isang template. Ngunit karamihan sa oras, mayroon ka nang *meron* na app—isang Node.js API, isang Python Flask na serbisyo, isang .NET web app—na nasa isang folder sa iyong makina. Ipinapakita ng araling ito kung paano idagdag ang azd sa umiiral na code para maideploy mo ito gamit ang `azd up`, hindi kailangan ng template.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng araling ito, maiintindihan mo:
- Ang tatlong paraan upang simulan ang isang azd proyekto
- Patakbuhin ang `azd init` sa loob ng umiiral na codebase
- Ano ang ginagawa ng `azure.yaml` at ng `infra/` na folder para sa iyong app
- Kailan dapat hayaan ang azd na lumikha ng imprastruktura at kailan sumulat ng sarili
- I-deploy ang iyong umiiral na app sa Azure gamit ang `azd up`

## Mga Resulta ng Pagkatuto

Matapos makumpleto ang araling ito, magagawa mo na:
- I-initialize ang azd sa isang proyekto na mayroon ka na
- Basahin at i-edit ang isang karaniwang `azure.yaml` na file
- Lumikha ng panimulang imprastruktura gamit ang `azd infra generate`
- Piliin ang angkop na host ng Azure para sa iyong app
- I-deploy at linisin ang sarili mong aplikasyon

---

## Tatlong Paraan para Magsimula ng azd Proyekto

| Panimulang punto | Utos | Kailan gagamitin |
|----------------|---------|-------------|
| **Mula sa template** | `azd init --template <name> .` (walang laman na direktoryo) | Para sa pag-aaral, o pagsisimula ng bagong app mula sa patunay nang halimbawa |
| **Mula sa iyong umiiral na code** | `azd init` (sa folder ng iyong proyekto) | Meron ka nang app at nais mo itong ideploy |
| **Mula sa Git repo** | `azd init --from-code` (sa cloned na repo) | Pag-aampon ng azd para sa umiiral na repositoryo |

Nasubukan mo na ang unang opsyon. Tinatalakay ng araling ito ang pangalawa—ang pinaka-karaniwang senaryo sa totoong buhay.

---

## Hakbang 1: Patakbuhin ang `azd init` sa Iyong Proyekto

Buksan ang terminal **nasa loob ng umiiral mong proyekto** at patakbuhin:

```bash
cd my-existing-app
azd init
```

Tatanungin ka ng azd kung paano mo gustong i-initialize. Piliin:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Piliin ang **"Use code in the current directory."** Pagkatapos, ise-scan ng azd ang iyong folder, matutukoy ang iyong wika at framework, at magmumungkahi ng host.

### Ano ang natutukoy ng azd

Hinahanap ng azd ang mga palatandaan ng aplikasyon tulad ng `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, o isang `Dockerfile`. Ang from-code flow ay hindi isang pangkalahatang wizard sa pagpili ng host para sa bawat suportadong target ng deployment:

| Iyong app | Malamang na natukoy na host |
|----------|----------------------|
| Sinusuportahang Node.js / Python / .NET web app | Karaniwan Azure Container Apps; suriin ang ginawang depinisyon |
| Containerized na app (`Dockerfile`) | Azure Container Apps |
| Function app o Static Web Apps na proyekto | Gumamit ng angkop na template o gumawa ng `azure.yaml` at imprastruktura kung hindi sinusuportahan ng from-code ang layout mo |

Kumpirmahin ang natukoy na serbisyo(s), at gagawa ng azd ng mga file na kailangan mo.

---

## Hakbang 2: Unawain ang nilikha ng azd

Pagkatapos ng init, suriin ang `azure.yaml`. Ang ginawang-inprastruktura na flow ay maaaring panatilihing implicit ang imprastruktura hanggang patakbuhin mo ang `azd infra generate`; huwag ipagpalagay na umiiral na ang `infra/`:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — ang depinisyon ng proyekto

Ito ang puso ng isang azd proyekto. Ang sumusunod na **mahulog-hulugang depinisyon ng App Service** ay nangangailangan ng nakaangkop na imprastruktura ng App Service; hindi ito dahilan para baguhin ang isang generated Container Apps host nang hindi binabago ang imprastruktura:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Ang bloke ng `services` ang mahalagang parte: bawat entry ay naka-map sa isang folder ng iyong code papunta sa isang Azure host. Kung ang iyong app ay may frontend at API, magkakaroon ka ng dalawang serbisyo.

### `infra/` — ang iyong mga Azure resources bilang code

Ang `infra/` na folder ay naglalaman ng mga Bicep file na naglalarawan ng mga Azure resources na kailangan ng iyong app (ang App Service, ang database, atbp.). Hindi mo kailangang isulat ito nang mano-mano—gumagawa ang azd ng isang gumaganang panimulang punto. Maaari mo *editin* ito mamaya para magdagdag ng mga resources o pahigpitin ang seguridad (tatalakayin sa [Kabanata 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Gusto mo bang makita o i-customize ang generated na imprastruktura bago i-deploy? Patakbuhin ang `azd infra generate` (na available din bilang `azd infra synth`) para isulat ang IaC sa disk upang maaari mo itong repasuhin at kontrolin ang bersyon.

---

## Hakbang 3: Itakda ang Kinakailangang Configuration

Kung ang iyong app ay nangangailangan ng mga setting o lihim (tulad ng connection string, API key), huwag itong i-hardcode. Gamitin ang mga environment value:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Ito ay nag-iimbak lamang ng lokal na halaga. Para magkaroon ng epekto sa app, dapat mo itong tahasang gamitin sa mga parameter ng imprastruktura, isang suportadong setting ng serbisyo, o isang hook; ang pag-set ng isang arbitraryong variable ay hindi nakaka-configure ng deployed runtime.

Para sa totoong mga lihim, itago ang mga ito sa Key Vault at tukuyin ito mula sa iyong imprastruktura—tingnan ang [Kabanata 3: Configuration at Authentication](../chapter-03-configuration/authsecurity.md).

---

## Hakbang 4: I-deploy

Ngayon gamit ang parehong workflow na alam mo na:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Kapag natapos, ipi-print ng azd ang URL ng iyong app. Suriin ito sa parehong paraan tulad ng anumang azd app:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Karaniwang Mga Isyu sa Unang Gamit

| Sintomas | Posibleng sanhi | Ayusin |
|---------|--------------|-----|
| Hindi na-detect ng azd ang aking app | Nawawalang manifest (e.g., `package.json`) | Idagdag ang manifest, o piliin ang host nang manu-mano habang `azd init` |
| Nabibigo ang build habang `azd up` | Kailangan ng app ng build step | I-configure ang package scripts ng app o ang serbisyo ng `prepackage` hook; gamitin ang `dist` para sa output ng deployment, hindi ang `buildCommand`/`outputPath` |
| Nagsisimula ang app pero may pinapabalik na error | Nawawalang config/secret | Ikabit ang mga halaga sa mga runtime app setting o isang Key Vault reference; ang `azd env set` ay hindi sapat mag-isa |
| Mali ang napiling host | Ang auto-detection ay hindi tugma sa iyong pangangailangan | Palitan pareho ang `host:` at ang kaukulang imprastruktura, o pumili ng template na tumutugma |

Para sa karagdagan, tingnan ang [Kabanata 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## Linisin

```bash
azd down --force --purge
```

---

## Buod

- Ang `azd init` → **"Gamitin ang code sa kasalukuyang direktoryo"** ay nagdadagdag ng azd sa isang app na mayroon ka na.
- Inuugnay ng `azure.yaml` ang iyong mga folder ng code sa mga Azure host; ang `infra/` ang naglalarawan ng mga resources bilang Bicep.
- Pinapahintulutan ka ng `azd infra generate` na repasuhin o i-customize ang generated na imprastruktura.
- Kapag na-initialize, ang iyong umiiral na app ay gumagamit ng eksaktong parehong `azd up` / `azd down` workflow tulad ng isang template-based na app.

---

## 🔗 Pag-navigate

| Direksyon | Aralin |
|-----------|--------|
| **Naiuna** | [Ang Iyong Unang Proyekto](first-project.md) |
| **Kasunod** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Kaugnay na Mga Mapagkukunan

- [Mga Pangunahing Kaalaman sa AZD](azd-basics.md)
- [Kabanata 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuration at Authentication](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->