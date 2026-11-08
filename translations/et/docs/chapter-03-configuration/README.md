# 3. peatükk: Konfiguratsioon ja autentimine

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 90-150 minutit koos integratsiooni praktikaga | **⭐ Tase**: Kesktase

---

## Ülevaade

Selles peatükis käsitletakse keskkonna konfiguratsiooni, autentimismustreid ja turvalisuse parimaid tavasid Azure Developer CLI rakendusteks.

> Käskude ja konfiguratsiooni ülevaate siht: `azd 1.37.2` (november 2026). Live Azure proovisüsteemi seadistust ei toimunud ülevaate ajal.

## Õpieesmärgid

Selle peatüki lõpetamisel:
- Omandad AZD konfiguratsiooni hierarhia kasutamise oskuse
- Halda mitut keskkonda (arendus, staging, tootmine)
- Rakenda turvalist autentimist hallatavate identiteetidega
- Sea keskkonnapõhised sätted

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Konfiguratsiooni juhend](configuration.md) | Keskkonna seadistamine ja haldamine | 30 min |
| 2 | [Autentimine & turvalisus](authsecurity.md) | Hallatavate identiteetide ja RBAC mustrid | 30 min |

---

## 🚀 Kiirkäivitus

Käivita **juba initsialiseeritud azd rakenduse juurest**, mitte kursuse hoidlast. Kasuta vabu keskkonnanimesid, kui olemasolevad on juba kasutusel.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` on illustratiivne: see mõjutab infrastruktuuri ainult siis, kui sinu mall seda otseselt kasutab. Tavalised `azd env set` väärtused salvestatakse lokaalselt tekstina; need ei ole turvalised salajased andmed.

---

## 🔧 Konfiguratsiooni hierarhia

Hoia kolm erinevat konfiguratsiooni tasandit eraldi: ülemaailmsed sätted (`azd config`), projekti struktuur (`azure.yaml`) ja keskkonnaspetsiifilised väärtused (`azd env`). Lipud muudavad ainult neid sätteid, mida nad toetavad; pole universaalset kattekihina toimivat suvaliste keskkonnamuutujate kihi lisamist `azure.yaml` või Bicep-i peale.

---

## 🔐 Turvalisuse parimad tavad

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [2. peatükk: AI arendus](../chapter-02-ai-development/README.md) |
| **Järgmine** | [4. peatükk: Infrastruktuur](../chapter-04-infrastructure/README.md) |

---

## 📖 Seotud ressursid

- [Enne juurutamist kontrollimine](../chapter-06-pre-deployment/README.md)
- [Tõrkeotsing](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->