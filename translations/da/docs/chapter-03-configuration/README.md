# Kapitel 3: Konfiguration & Autentificering

**📚 Kursus**: [AZD for begyndere](../../README.md) | **⏱️ Varighed**: 45-60 minutter | **⭐ Kompleksitet**: Mellemniveau

---

## Oversigt

Dette kapitel dækker miljøkonfiguration, autentificeringsmønstre og bedste sikkerhedspraksis for Azure Developer CLI-udrulninger.

> Bekræftet mod `azd 1.25.6` i juni 2026.

## Læringsmål

Ved at gennemføre dette kapitel vil du:
- Beherske AZD's konfigurationshierarki
- Administrere flere miljøer (dev, staging, prod)
- Implementere sikker autentificering med administrerede identiteter
- Konfigurere miljøspecifikke indstillinger

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | Opsætning og administration af miljø | 30 min |
| 2 | [Authentication & Security](authsecurity.md) | Administrerede identiteter og RBAC-mønstre | 30 min |

---

## 🚀 Hurtigstart

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
4. **Kommandolinje-flag** (`--location eastus`)

---

## 🔐 Bedste sikkerhedspraksis

```bash
# Brug administreret identitet (anbefales)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kontroller AZD-autentificeringsstatus
azd auth status

# Valgfrit: bekræft Azure CLI-kontekst, hvis du planlægger at køre az-kommandoer
az account show

# Autentificer igen om nødvendigt
azd auth login

# Valgfrit: opfrisk Azure CLI-autentificering for az-kommandoer
az login
```

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Forrige** | [Kapitel 2: AI-udvikling](../chapter-02-ai-development/README.md) |
| **Næste** | [Kapitel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Relaterede ressourcer

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->