# Kabanata 4: Infrastructure as Code at Deployment

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 2-3 oras na pagbabasa; maglaan ng karagdagang oras para sa mga deployment na pagsasanay | **⭐ Antas ng Kahirapan**: Intermediate

---

## Pangkalahatang-ideya

Sinasaklaw ng kabanatang ito ang mga pattern ng Infrastructure as Code (IaC) gamit ang Bicep templates, provisioning ng mga resource, at mga diskarte sa deployment gamit ang Azure Developer CLI.

> Target ng pagsusuri ng utos at konfigurasyon: `azd 1.37.2` (Nobyembre 2026). Hindi pinatakbo ang live na Azure provisioning sa panahon ng pagsusuri.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, ikaw ay:
- Maiintindihan ang istruktura at sintaks ng Bicep template
- Makakapag-provision ng Azure resources gamit ang `azd provision`
- Makakapag-deploy ng mga aplikasyon gamit ang `azd deploy`
- Makapagpapatupad ng blue-green at rolling deployment na mga diskarte

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Provisioning ng Mga Resource](provisioning.md) | Pamamahala ng Azure resource gamit ang AZD | 45 min |
| 2 | [Gabay sa Deployment](deployment-guide.md) | Mga diskarte sa pag-deploy ng aplikasyon | 45 min |
| 3 | [Pagsusulat ng Iyong Sariling Template](custom-templates.md) | Gumawa at mag-publish ng reusable azd templates | 30 min |

---

## 🚀 Mabilis na Simula

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 Istruktura ng Proyekto sa AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Mahahalagang Utos

| Utos | Paglalarawan |
|---------|-------------|
| `azd init` | Simulan ang proyekto |
| `azd provision` | Lumikha ng Azure resources |
| `azd deploy` | I-deploy ang code ng aplikasyon |
| `azd up` | provision + deploy |
| `azd down` | Tanggalin lahat ng resources |

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 3: Konfigurasyon](../chapter-03-configuration/README.md) |
| **Susunod** | [Kabanata 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Pag-check Bago ang Deployment](../chapter-06-pre-deployment/README.md)
- [Mga Halimbawa ng Container App](../../examples/container-app/README.md)
- [Halimbawa ng Database App](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->