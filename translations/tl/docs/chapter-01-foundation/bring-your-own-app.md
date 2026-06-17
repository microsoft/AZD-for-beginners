# Dalhin ang Iyong Sariling App - Idagdag ang azd sa Umiiral na Proyekto

**Chapter Navigation:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 1 - Pundasyon at Mabilisang Simula
- **⬅️ Nakaraan**: [Ang Iyong Unang Proyekto](first-project.md)
- **➡️ Susunod**: [Dev Containers at Codespaces](dev-containers.md)

> Napatunayan gamit ang `azd 1.25.6` noong Hunyo 2026.

## Panimula

Sa [Ang Iyong Unang Proyekto](first-project.md) nag-deploy ka ng app sa pamamagitan ng pagsisimula mula sa template. Ngunit kadalasan mayroon ka nang app—isang Node.js API, isang Python Flask service, isang .NET web app—na nasa isang folder sa iyong makina. Ipinapakita ng araling ito kung paano idagdag ang azd sa umiiral na code upang ma-deploy mo ito gamit ang `azd up`, walang template na kinakailangan.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng araling ito, ikaw ay:
- Maiintindihan ang tatlong paraan upang simulan ang isang proyektong azd
- Mapapatakbo ang `azd init` sa loob ng umiiral na codebase
- Maiintindihan kung ano ang ginagawa ng `azure.yaml` at ng folder na `infra/` para sa iyong app
- Malalaman kung kailan hayaan ang azd na mag-generate ng imprastruktura kumpara sa pagsulat ng sarili mong IaC
- Maide-deploy ang iyong umiiral na app sa Azure gamit ang `azd up`

## Mga Kinalabasan ng Pagkatuto

Pagkatapos makumpleto ang araling ito, magagawa mong:
- I-initialize ang azd sa isang proyektong mayroon ka na
- Basahin at i-edit ang isang pangunahing `azure.yaml` na file
- Mag-generate ng panimulang imprastruktura gamit ang `azd infra generate`
- Pumili ng angkop na Azure host para sa iyong app
- Mag-deploy at maglinis ng iyong sariling aplikasyon

---

## Tatlong Paraan para Simulan ang isang proyektong azd

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **Mula sa template** | `azd init --template <name>` | Para sa pag-aaral, o sa pagsisimula ng bagong app mula sa subok na halimbawa |
| **Mula sa umiiral na code** | `azd init` (sa iyong project folder) | Mayroon ka nang app at gusto mo itong i-deploy |
| **Mula sa Git repo** | `azd init --from-code` (sa isang cloned repo) | Pag-aampon ng azd para sa umiiral na repositoryo |

Nasubukan mo na ang unang opsyon. Tinatalakay ng araling ito ang pangalawa—ang pinakakaraniwang senaryo sa totoong buhay.

---

## Hakbang 1: Patakbuhin ang `azd init` sa Iyong Proyekto

Buksan ang terminal **sa loob ng umiiral mong folder ng proyekto** at patakbuhin:

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

Piliin **"Gamitin ang code sa kasalukuyang direktoryo."** Tini-scan ng azd ang iyong folder, natutukoy ang iyong wika at framework, at magmumungkahi ng host.

### Ano ang natutukoy ng azd

Tinitingnan ng azd ang mga senyales tulad ng `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, o isang `Dockerfile`, at nagmumungkahi ng katugmang Azure host:

| Ang iyong app | Posibleng matukoy na host |
|---------------|---------------------------|
| Node.js / Python / .NET web app | Azure App Service o Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Kumpirmahin ang natukoy na serbisyo, at gagawa ang azd ng mga file na kailangan mo.

---

## Hakbang 2: Unawain Kung Ano ang Nilikha ng azd

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

### `azure.yaml` — ang definisyon ng proyekto

Ito ang puso ng isang azd project. Ang isang minimal na halimbawa ay ganito ang hitsura:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Ang `services` block ang pangunahing bahagi: bawat entry ay nagmamapa ng isang folder ng iyong code sa isang Azure host. Kung ang iyong app ay may frontend at API, magkakaroon ka ng dalawang serbisyo.

### `infra/` — ang iyong mga resource sa Azure bilang code

Ang folder na `infra/` ay naglalaman ng mga Bicep file na naglalarawan ng mga Azure resource na kailangan ng iyong app (ang App Service, ang database, atbp.). Hindi mo kailangang isulat ito nang mano-mano—nagge-generate ang azd ng isang gumaganang panimulang punto. Maaari mo silang i-edit mamaya upang magdagdag ng mga resource o pahigpitin ang seguridad (tinalakay sa [Kabanata 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Gusto mong makita o i-customize ang ginawang imprastruktura bago mag-deploy? Patakbuhin ang `azd infra generate` (magagamit din bilang `azd infra synth`) upang isulat ang IaC sa disk para ma-review at ma-version-control mo ito.

---

## Hakbang 3: Itakda ang Kinakailangang Konfigurasyon

Kung nangangailangan ng settings o secrets ang iyong app (isang connection string, isang API key), huwag itong i-hardcode. Gumamit ng mga environment value:

```bash
# Lumikha ng isang kapaligiran
azd env new dev

# Itakda ang isang hindi lihim na halaga
azd env set API_VERSION 1.0.0
```

Para sa totoong mga secret, itago ang mga ito sa Key Vault at i-reference mula sa iyong imprastruktura—tingnan ang [Kabanata 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Hakbang 4: I-deploy

Ngayon gamitin ang parehong workflow na alam mo na:

```bash
# Magpatunay ng pagkakakilanlan (kailangan para sa azd)
azd auth login

# I-preview ang mga resource na malilikha
azd provision --preview

# Ihanda ang imprastraktura at i-deploy ang iyong code
azd up
```

Kapag natapos na, ipi-print ng azd ang URL ng iyong app. I-verify ito sa parehong paraan tulad ng anumang azd app:

```bash
azd show           # ipakita ang mga endpoint
azd monitor --logs # suriin ang mga log kung kinakailangan
```

---

## Mga Karaniwang Unang Problema

| Sintomas | Malamang na sanhi | Ayusin |
|---------|------------------|--------|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Idagdag ang manifest, o piliin ang host nang manu-mano sa `azd init` |
| Build fails during `azd up` | App needs a build step | Idagdag ang `buildCommand`/`outputPath` sa ilalim ng service sa `azure.yaml` |
| App starts but returns errors | Missing config/secret | Itakda ang mga value gamit ang `azd env set` o i-wire ang Key Vault |
| Wrong host chosen | Auto-detection guessed | I-edit ang `host:` sa `azure.yaml` at i-run muli ang `azd up` |

Para sa karagdagan, tingnan ang [Kabanata 7: Pag-troubleshoot](../chapter-07-troubleshooting/README.md).

---

## Linisin

```bash
azd down --force --purge
```

---

## Buod

- `azd init` → **"Gamitin ang code sa kasalukuyang direktoryo"** nagdaragdag ng azd sa isang app na mayroon ka na.
- `azure.yaml` ang nagmamapa ng iyong mga folder ng code sa mga Azure host; `infra/` ang naglalarawan ng mga resource bilang Bicep.
- `azd infra generate` nagbibigay-daan sa iyo na i-review o i-customize ang ginawang imprastruktura.
- Kapag na-initialize na, ginagamit ng iyong umiiral na app ang eksaktong parehong `azd up` / `azd down` na workflow tulad ng isang app na nagsimula mula sa template.

---

## 🔗 Nabigasyon

| Direksyon | Aralin |
|-----------|--------|
| **Previous** | [Ang Iyong Unang Proyekto](first-project.md) |
| **Next** | [Dev Containers at Codespaces](dev-containers.md) |

## 📖 Kaugnay na Mga Mapagkukunan

- [Mga Batayan ng AZD](azd-basics.md)
- [Kabanata 4: Imprastruktura bilang Code](../chapter-04-infrastructure/README.md)
- [Konfigurasyon at Pagpapatunay](../chapter-03-configuration/authsecurity.md)
- [Cheat Sheet ng mga Utos](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->