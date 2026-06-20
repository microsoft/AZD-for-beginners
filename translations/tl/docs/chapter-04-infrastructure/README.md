# Kabanata 4: Infrastruktura bilang Code & Pag-deploy

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1-1.5 oras | **⭐ Kumpleksidad**: Katamtaman

---

## Pangkalahatang-ideya

Ang kabanatang ito ay sumasaklaw sa Infrastructure as Code (IaC) na mga pattern gamit ang Bicep templates, provisioning ng mga resource, at mga estratehiya sa pag-deploy gamit ang Azure Developer CLI.

> Na-validate laban sa `azd 1.25.6` noong Hunyo 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, makakamit mo ang mga sumusunod:
- Maunawaan ang istruktura at sintaks ng Bicep template
- Mag-provision ng mga Azure resource gamit ang `azd provision`
- Mag-deploy ng mga application gamit ang `azd deploy`
- Ipatupad ang blue-green at rolling na mga estratehiya sa pag-deploy

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Pag-provision ng Mga Resource](provisioning.md) | Pamamahala ng Azure resource gamit ang AZD | 45 min |
| 2 | [Gabay sa Pag-deploy](deployment-guide.md) | Mga estratehiya sa pag-deploy ng application | 45 min |
| 3 | [Paggawa ng Iyong Sariling Template](custom-templates.md) | Bumuo at mag-publish ng mga reusable na azd template | 30 min |

---

## 🚀 Mabilis na Panimula

```bash
# I-initialize mula sa template
azd init --template azure-functions-python-v2-http

# I-preview kung ano ang malilikha
azd provision --preview

# Mag-provision lamang ng imprastruktura
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

| Command | Description |
|---------|-------------|
| `azd init` | Initialize project |
| `azd provision` | Create Azure resources |
| `azd deploy` | Deploy application code |
| `azd up` | provision + deploy |
| `azd down` | Delete all resources |

---

## 🔗 Navigasyon

| Direction | Chapter |
|-----------|---------|
| **Nakaraan** | [Kabanata 3: Konfigurasyon](../chapter-03-configuration/README.md) |
| **Susunod** | [Kabanata 5: Mga Solusyong Multi-Agent](../chapter-05-multi-agent/README.md) |

---

## 📖 Kaugnay na Mapagkukunan

- [Mga Pag-check Bago ang Pag-deploy](../chapter-06-pre-deployment/README.md)
- [Mga Halimbawa ng Container App](../../examples/container-app/README.md)
- [Halimbawa ng Database App](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->