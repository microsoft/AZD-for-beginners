# 3. peatükk: Konfiguratsioon ja autentimine

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 45-60 minutit | **⭐ Tase**: Kesktase

---

## Ülevaade

Selles peatükis käsitletakse keskkonna konfiguratsiooni, autentimismustreid ja turbe parimaid tavasid Azure Developer CLI juurutuste jaoks.

> Kontrollitud versiooniga `azd 1.27.1` juulis 2026.

## Õpieesmärgid

Selle peatüki lõpetades suudad:
- Valdada AZD konfiguratsiooni hierarhiat
- Hallata mitut keskkonda (dev, staging, prod)
- Rakendada turvalist autentimist hallatud identiteetidega
- Konfigureerida keskkonnapõhiseid seadeid

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|----------|-----------|------|
| 1 | [Konfiguratsiooni juhend](configuration.md) | Keskkonna seadistamine ja haldus | 30 min |
| 2 | [Autentimine ja turvalisus](authsecurity.md) | Hallatud identiteedi ja RBAC mustrid | 30 min |

---

## 🚀 Kiire algus

```bash
# Loo mitu keskkonda
azd env new dev
azd env new staging
azd env new prod

# Vaheta keskkondi
azd env select prod

# Määra keskkonnamuutujad
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Vaata konfiguratsiooni
azd env get-values
```

---

## 🔧 Konfiguratsiooni hierarhia

AZD rakendab seadeid selles järjekorras (hilisemad muudavad varasemaid):

1. **Vaikesätted** (mallidesse sisse ehitatud)
2. **azure.yaml** (projekti konfiguratsioon)
3. **Keskkonnamuutujad** (`azd env set`)
4. **Käsurea lipud** (`--location eastus`)

---

## 🔐 Turvalisuse parimad tavad

```bash
# Kasuta hallatud identiteeti (soovitatav)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kontrolli AZD autentimise olekut
azd auth status

# Valikuline: kontrolli Azure CLI konteksti, kui kavatsete käivitada az käske
az account show

# Vajadusel uuesti autentida
azd auth login

# Valikuline: värskenda Azure CLI autentimist az käskude jaoks
az login
```

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-------|---------|
| **Eelmine** | [2. peatükk: AI arendus](../chapter-02-ai-development/README.md) |
| **Järgmine** | [4. peatükk: Taristu](../chapter-04-infrastructure/README.md) |

---

## 📖 Seotud ressursid

- [Enne juurutamist tehtavad kontrollid](../chapter-06-pre-deployment/README.md)
- [Tõrkeotsing](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->