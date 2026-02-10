# Kapitel 4: Infrastruktur som kode & Udrulning

**📚 Course**: [AZD for begyndere](../../README.md) | **⏱️ Duration**: 1-1,5 timer | **⭐ Complexity**: Mellem

---

## Oversigt

Dette kapitel dækker Infrastructure as Code (IaC)-mønstre med Bicep-skabeloner, ressourceprovisionering og udrulningsstrategier ved brug af Azure Developer CLI.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Forstå Bicep-skabelons struktur og syntaks
- Oprette Azure-ressourcer med `azd provision`
- Udrulle applikationer med `azd deploy`
- Implementer blue-green- og rullende udrulningsstrategier

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Provisionering af ressourcer](provisioning.md) | Azure-ressourcehåndtering med AZD | 45 min |
| 2 | [Udrulningsguide](deployment-guide.md) | Strategier for applikationsudrulning | 45 min |

---

## 🚀 Hurtig start

```bash
# Initialiser fra skabelon
azd init --template azure-functions-python-v2-http

# Forhåndsvis hvad der vil blive oprettet
azd provision --preview

# Opsæt kun infrastruktur
azd provision

# Udrul kun kode
azd deploy

# Eller begge dele
azd up
```

---

## 📁 AZD-projektstruktur

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

## 🔧 Væsentlige kommandoer

| Kommando | Beskrivelse |
|---------|-------------|
| `azd init` | Initialiser projekt |
| `azd provision` | Opret Azure-ressourcer |
| `azd deploy` | Udrul applikationskode |
| `azd up` | opret + udrul |
| `azd down` | Slet alle ressourcer |

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Næste** | [Kapitel 5: Multi-agentløsninger](../chapter-05-multi-agent/README.md) |

---

## 📖 Relaterede ressourcer

- [Tjek før udrulning](../chapter-06-pre-deployment/README.md)
- [Eksempler på container-apps](../../examples/container-app/README.md)
- [Eksempel på database-app](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi stræber efter nøjagtighed, bedes du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument i dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales en professionel menneskelig oversættelse. Vi kan ikke holdes ansvarlige for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->