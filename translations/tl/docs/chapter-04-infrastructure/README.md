# Kabanata 4: Infrastructure as Code at Deployment

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1-1.5 oras | **⭐ Antas ng Kahirapan**: Gitnang Antas

---

## Pangkalahatang-ideya

Saklaw ng kabanatang ito ang Infrastructure as Code (IaC) na mga pattern gamit ang Bicep templates, pagproprovision ng mga resource, at mga estratehiya sa deployment gamit ang Azure Developer CLI.

> Nasubok gamit ang `azd 1.27.1` noong Hulyo 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, matututuhan mo:
- Maunawaan ang istruktura at syntax ng Bicep template
- Mag-provision ng mga Azure resource gamit ang `azd provision`
- Mag-deploy ng mga aplikasyon gamit ang `azd deploy`
- Magpatupad ng blue-green at rolling deployment na mga estratehiya

---

## 📚 Mga Aralin

| # | Aralin | Deskripsyon | Oras |
|---|--------|-------------|------|
| 1 | [Pagprovision ng mga Resource](provisioning.md) | Pamamahala ng Azure resource gamit ang AZD | 45 min |
| 2 | [Gabay sa Deployment](deployment-guide.md) | Mga estratehiya sa pag-deploy ng aplikasyon | 45 min |
| 3 | [Pagsusulat ng Sariling Template](custom-templates.md) | Gumawa at mag-publish ng reusable na azd templates | 30 min |

---

## 🚀 Mabilisang Pagsisimula

```bash
# Simulan mula sa template
azd init --template azure-functions-python-v2-http

# Tingnan kung ano ang malilikha
azd provision --preview

# Maglaan lamang ng imprastraktura
azd provision

# I-deploy lamang ang code
azd deploy

# O pareho nang sabay
azd up
```

---

## 📁 Istruktura ng Proyektong AZD

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

## 🔧 Mahahalagang Mga Utos

| Utos | Deskripsyon |
|---------|-------------|
| `azd init` | Simulan ang proyekto |
| `azd provision` | Lumikha ng Azure resources |
| `azd deploy` | I-deploy ang code ng aplikasyon |
| `azd up` | mag-provision + mag-deploy |
| `azd down` | Burahin ang lahat ng resources |

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 3: Configuration](../chapter-03-configuration/README.md) |
| **Susunod** | [Kabanata 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 Kaugnay na Mga Mapagkukunan

- [Mga Pagsusuri Bago ang Deployment](../chapter-06-pre-deployment/README.md)
- [Mga Halimbawa ng Container App](../../examples/container-app/README.md)
- [Halimbawa ng Database App](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->