# Kabanata 4: Imprastruktura bilang Code at Pag-deploy

**📚 Kurso**: [AZD Para sa Mga Baguhan](../../README.md) | **⏱️ Tagal**: 1-1.5 oras | **⭐ Kahirapan**: Katamtaman

---

## Pangkalahatang-ideya

Tinatalakay ng kabanatang ito ang Imprastruktura bilang Code (IaC) na mga pattern gamit ang mga Bicep template, paglalaan ng mga resource, at mga estratehiya sa pag-deploy gamit ang Azure Developer CLI.

> Napatunayan gamit ang `azd 1.23.12` noong Marso 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, matututuhan mo:
- Maunawaan ang estruktura at sintaks ng Bicep template
- Mag-provision ng mga Azure resource gamit ang `azd provision`
- I-deploy ang mga application gamit ang `azd deploy`
- Ipatupad ang mga estratehiya ng blue-green at rolling deployment

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Paglalaan ng mga Resource](provisioning.md) | Pamamahala ng mga Azure resource gamit ang AZD | 45 min |
| 2 | [Gabay sa Pag-deploy](deployment-guide.md) | Mga estratehiya sa pag-deploy ng aplikasyon | 45 min |

---

## 🚀 Mabilis na Simula

```bash
# Simulan mula sa template
azd init --template azure-functions-python-v2-http

# I-preview kung ano ang malilikha
azd provision --preview

# Mag-provision ng imprastruktura lamang
azd provision

# I-deploy lamang ang kodigo
azd deploy

# O pareho nang magkasama
azd up
```

---

## 📁 Estruktura ng Proyekto ng AZD

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
| `azd init` | I-initialize ang proyekto |
| `azd provision` | Lumikha ng mga Azure resource |
| `azd deploy` | I-deploy ang code ng aplikasyon |
| `azd up` | mag-provision + mag-deploy |
| `azd down` | Tanggalin ang lahat ng mga resource |

---

## 🔗 Nabigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 3: Konfigurasyon](../chapter-03-configuration/README.md) |
| **Susunod** | [Kabanata 5: Mga Multi-Agent na Solusyon](../chapter-05-multi-agent/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Mga Pagsusuri Bago ang Pag-deploy](../chapter-06-pre-deployment/README.md)
- [Mga Halimbawa ng Container App](../../examples/container-app/README.md)
- [Halimbawa ng Database App](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI na tagasalin [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa kawastuhan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o kawalan ng katumpakan. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na may awtoridad. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->