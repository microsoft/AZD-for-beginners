# Kabanata 4: Imprastruktura bilang Code at Pag-deploy

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1-1.5 oras | **⭐ Antas ng Kahirapan**: Katamtaman

---

## Pangkalahatang-ideya

Tinutukoy ng kabanatang ito ang mga pattern ng Infrastructure as Code (IaC) gamit ang mga Bicep template, provisioning ng mga resource, at mga estratehiya ng pag-deploy gamit ang Azure Developer CLI.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, ikaw ay:
- Maunawaan ang istruktura at sintaks ng mga Bicep template
- Mag-provision ng mga Azure resource gamit ang `azd provision`
- Mag-deploy ng mga aplikasyon gamit ang `azd deploy`
- Ipapatupad ang mga estratehiya ng blue-green at rolling deployment

---

## 📚 Mga Aralin

| # | Aralin | Deskripsyon | Oras |
|---|--------|-------------|------|
| 1 | [Pagpo-provision ng Mga Resource](provisioning.md) | Pamamahala ng Azure resources gamit ang AZD | 45 min |
| 2 | [Gabay sa Pag-deploy](deployment-guide.md) | Mga estratehiya ng pag-deploy ng aplikasyon | 45 min |

---

## 🚀 Mabilis na Pagsisimula

```bash
# Simulan mula sa template
azd init --template azure-functions-python-v2-http

# Tingnan kung ano ang malilikha
azd provision --preview

# Maglaan ng imprastruktura lamang
azd provision

# I-deploy lamang ang kodigo
azd deploy

# O pareho nang sabay
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

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 3: Konfigurasyon](../chapter-03-configuration/README.md) |
| **Susunod** | [Kabanata 5: Mga Solusyon ng Maramihang Ahente](../chapter-05-multi-agent/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Mga Suriin Bago Mag-deploy](../chapter-06-pre-deployment/README.md)
- [Mga Halimbawa ng Container App](../../examples/container-app/README.md)
- [Halimbawa ng Database App](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay naisalin gamit ang serbisyong AI na pagsasalin [Co-op Translator] (https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa kawastuhan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi eksaktong pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mga mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot para sa anumang hindi pagkakaunawaan o maling interpretasyon na magmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->