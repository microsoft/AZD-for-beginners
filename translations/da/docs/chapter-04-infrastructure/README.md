# Kapitel 4: Infrastruktur som kode & Udrulning

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 2-3 timers læsning; afsæt ekstra tid til udrulningsøvelser | **⭐ Kompleksitet**: Mellem

---

## Oversigt

Dette kapitel dækker Infrastruktur som kode (IaC) mønstre med Bicep-skabeloner, ressourcetildeling og udrulningsstrategier ved brug af Azure Developer CLI.

> Kommando- og konfigurationsgennemgang mål: `azd 1.37.2` (november 2026). Live Azure-provisionering blev ikke kørt under gennemgang.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Forstå Bicep-skabelonstruktur og syntaks
- Provisionere Azure-ressourcer med `azd provision`
- Udrulle applikationer med `azd deploy`
- Implementere blue-green og rolling udrulningsstrategier

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Provisionering af ressourcer](provisioning.md) | Azure-ressourcestyring med AZD | 45 min |
| 2 | [Udrulningsvejledning](deployment-guide.md) | Applikationsudrulningsstrategier | 45 min |
| 3 | [Forfat din egen skabelon](custom-templates.md) | Byg og udgiv genanvendelige azd-skabeloner | 30 min |

---

## 🚀 Hurtig start

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

## 📁 AZD projektstruktur

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
| `azd up` | provision + udrul |
| `azd down` | Slet alle ressourcer |

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Næste** | [Kapitel 5: Multi-Agent løsninger](../chapter-05-multi-agent/README.md) |

---

## 📖 Relaterede ressourcer

- [Pre-Deployment checks](../chapter-06-pre-deployment/README.md)
- [Container App eksempler](../../examples/container-app/README.md)
- [Database App eksempel](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->