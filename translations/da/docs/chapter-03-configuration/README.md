# Kapitel 3: Konfiguration & Autentificering

**📚 Kursus**: [AZD for begyndere](../../README.md) | **⏱️ Varighed**: 45-60 minutter | **⭐ Kompleksitet**: Mellemniveau

---

## Oversigt

Dette kapitel gennemgår miljøkonfiguration, autentificeringsmønstre og sikkerhedspraksis for udrulninger med Azure Developer CLI.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Beherske AZD-konfigurationshierarkiet
- Administrere flere miljøer (dev, staging, prod)
- Implementere sikker autentificering med administrerede identiteter
- Konfigurere miljøspecifikke indstillinger

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Konfigurationsvejledning](configuration.md) | Miljøopsætning og administration | 30 min |
| 2 | [Autentificering & Sikkerhed](authsecurity.md) | Mønstre for administrerede identiteter og RBAC | 30 min |

---

## 🚀 Hurtig start

```bash
# Opret flere miljøer
azd env new dev
azd env new staging
azd env new prod

# Skift mellem miljøer
azd env select prod

# Indstil miljøvariabler
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Vis konfiguration
azd env get-values
```

---

## 🔧 Konfigurationshierarki

AZD anvender indstillinger i denne rækkefølge (senere overskriver tidligere):

1. **Standardværdier** (indbygget i skabeloner)
2. **azure.yaml** (projektkonfiguration)
3. **Miljøvariabler** (`azd env set`)
4. **Kommandolinjeflag** (`--location eastus`)

---

## 🔐 Bedste sikkerhedspraksis

```bash
# Brug administreret identitet (anbefales)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kontroller autentificeringsstatus
azd auth whoami
az account show

# Autentificer igen, hvis nødvendigt
azd auth login
az login
```

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 2: AI-udvikling](../chapter-02-ai-development/README.md) |
| **Næste** | [Kapitel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Relaterede ressourcer

- [Kontroller før udrulning](../chapter-06-pre-deployment/README.md)
- [Fejlfinding](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets originalsprog bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales en professionel menneskelig oversættelse. Vi er ikke ansvarlige for misforståelser eller fejltolkninger, som opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->